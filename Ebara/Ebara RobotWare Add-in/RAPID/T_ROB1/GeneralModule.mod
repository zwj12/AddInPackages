MODULE GeneralModule(NOSTEPIN)
    !*****************************************************
    !Module Name:   GeneralModule
    !Version:       1.0
    !Description:   This module can be encrypted
    !Date:          2018-7-12
    !Author:        Michael
    !*****************************************************
    !2018-8-31      Add UnaryLinearRegressionAnalysis
    !2018-9-3       Michael, Add GetPedestalVertexHeight

    !Structure data of every point in a circle seam(from 0 to 360)
    RECORD RECORDWeldTarget
        num numAngle;
        !1 - ArcLStart; 2 - ArcL; 3 - ArcLEnd; 4 - ArcCStart; 5 - ArcC; 6 - ArcCEnd, 7 - MoveL; 8 - MoveC; 9 - MoveJ;
        !11 - ArcCalcLStart; 12 - ArcCalcL; 13 - ArcCalcLEnd; 15 - ArcCalcC; 16 - ArcCalcCEnd;
        num numProcessType;

        !Offset and rotate the weld target in tool coordinate system
        !The rotations will be performed in the following order if two or three rotations are specified at the same time:
        !1 rotation around the x axis
        !2 rotation around the new y axis
        !3 rotation around the new z axis
        num numTCSOffsetX;
        num numTCSOffsetY;
        num numTCSOffsetZ;
        num numTCSRotationX;
        num numTCSRotationY;
        num numTCSRotationZ;

        string strWeldProcedureID;
        string strRemark;

        !For getting the nominal coordinate system
        num numWobjX;
        num numWobjY;
        num numWobjZ;
        num numWobjEZ;
        num numWobjEY;
        num numWobjEX;

    ENDRECORD

    !Structure data of a combination of pipe an pipe, the IPC sends a pipe groove model data once a time
    RECORD RECORDPipeGrooveModel
        num numIndex;

        !numPipeGrooveType: 1 - Platoon Sinking of Container and Water Pipe , 2 - Platoon Sinking of Header Pipe and Water Pipe , 3 - Saddle Weld of Container and Pipe
        num numPipeGrooveType;

        num numSeamCenterX;
        num numSeamNormalAngle;

        num numHeaderDiameter;
        num numHeaderThickness;
        !numHeaderMaterial: 1 - Carbon Steel, now only support 1
        num numHeaderMaterial;

        num numBranchDiameter;
        num numBranchThickness;
        num numBranchMaterial;

        num numMultiPassTotal;

        !numCooperativeRobots: bit 1 for robot1, bit 2 for robot2, bit 3 for synchronized
        !numCooperativeRobots: 1 - only robot1(001), 2 - only robot2(010), 3 - robot1 and robot2 without synchronized movements(011)
        !5 - robot1 and pos1 with synchronized movements(101), 6 - robot2 and pos1 with synchronized movements(110), 7 - robot1 and robot2 and pos1 with synchronized movements(111)
        num numCooperativeRobots;

        !numPathSource: 1 - by IPC, 2 - by Routine, 3 - by Module Data
        !if numPathSource=2, the routine name shoule be set as "numPipeGrooveType_numHeaderDiameter_numHeaderThickness_numBranchDiameter_numBranchThickness_numWeldLegWidth_LayerNo"
        !if numPathSource=3, the Module name shoule be set as "Module_numPipeGrooveType_numHeaderDiameter_numHeaderThickness_numBranchDiameter_numBranchThickness"
        num numPathSource;

        !numReviseScanBranchType: 0 - Use theory data, 1 - Use scan data, 2 - Use last scan data; obsolete from 2018-12-7 by Michael
        !numReviseScanBranchType: bit 1 for robot1 scan, bit 2 for robot2 scan, bit 3 for Using last robot1 scan data offset, bit 4 for Using last robot2 scan data offset
        !numReviseScanBranchType: bit 5 Use robot1 theory data, bit 6 Use robot2 theory data
        num numReviseScanBranchType;
        num numReviseScanHeaderType;

        num numWeldLegWidth;
        num numGrooveGap;
        num numBranchGrooveRoot;
        num numBranchGrooveAngle;
        
        num numBranchGrooveAngle90;
        num numTopHeight90;
        num numBottomHeight90;
        num numProfCosine;
        
        num numLayerHeight;
        !numLayerPassTotalRoundType: 1 - round, 2 - truncate, 3 - truncate + 1
        num numLayerPassTotalRoundType;
        
        bool boolContinuous;
        !boolUseAlignedSTNbyFixedValue: true - shoulder use 0 degree and belly use 90 degree; false - use algorithm of GetAlignedJointtarget
        bool boolUseAlignedSTNbyFixedValue;

        string strID;
        string strRemark;
    ENDRECORD

    !Structure data of welidng parameters
    RECORD RECORDWeldProcedure
        string strWeldProcedureID;
        num numWeldSpeed;
        num numPreFlow;
        num numSche;
        num numTrackCurrent;
        num numPostFlow;
        num numWeaveShape;
        num numWeaveType;
        num numWeaveLength;
        num numWeaveWidth;
        num numWeaveHeigth;
        num numDwellLeft;
        num numDwellCenter;
        num numDwellRight;
        num numWeaveDir;
        num numWeaveTilt;
        num numWeaveOri;
        num numWeaveBias;
        num numTrackType;
        num numGainY;
        num numGainZ;
        num numPenetration;
        num numTrackBias;
        num numWeaveWidth90;
        string strRemark;
    ENDRECORD

    !For adjust the points between in each quadrant
    RECORD RECORDCircle
        num numDegree0;
        num numDegree90;
        num numDegree180;
        num numDegree270;
        !1 - Linear, 2 - sinusoid
        num numCurveType;
    ENDRECORD

    RECORD RECORDLayerParamter
        num numWorkAngleDeclination;
        RECORDCircle rCircleOffsetX;
        RECORDCircle rCircleOffsetZ;
        RECORDCircle rCircleRotationX;
        RECORDCircle rCircleRotationY;
        RECORDCircle rCircleRotationZ;
        string strWeldProcedureID;
    ENDRECORD

    !2018-10-26, Michael, Add OffsetinWobj
    FUNC robtarget GetRobtarget(RECORDWeldTarget rSeamTargets{*},num index,\switch TCSRotateFirst\switch OffsetinPolarFrame\confdata confValue\extjoint extjointValue)
        VAR robtarget robtWeld:=[[0,0,0],[1,0,0,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        IF NOT CheckLicense() THEN
            !            ErrWrite "System identity fault","Faulty system identity for this program ";
            TPWrite "The license for this controller is not enable.";
            TPWrite "Please contact ABB WAC for assistance.";
            EXIT;
        ENDIF

        robtWeld.trans.x:=rSeamTargets{index}.numWobjX;
        robtWeld.trans.y:=rSeamTargets{index}.numWobjY;
        robtWeld.trans.z:=rSeamTargets{index}.numWobjZ;
        robtWeld.rot:=OrientZYX(rSeamTargets{index}.numWobjEZ,rSeamTargets{index}.numWobjEY,rSeamTargets{index}.numWobjEX);
        IF Present(TCSRotateFirst) THEN
            robtWeld:=RelTool(robtWeld,0,0,0\Rx:=rSeamTargets{index}.numTCSRotationX\Ry:=rSeamTargets{index}.numTCSRotationY\Rz:=rSeamTargets{index}.numTCSRotationZ);
            IF Present(OffsetinPolarFrame) THEN
                robtWeld:=offs(robtWeld,rSeamTargets{index}.numTCSOffsetX*Cos(rSeamTargets{index}.numAngle),rSeamTargets{index}.numTCSOffsetX*Sin(rSeamTargets{index}.numAngle),rSeamTargets{index}.numTCSOffsetZ);
            ELSE
                robtWeld:=RelTool(robtWeld,rSeamTargets{index}.numTCSOffsetX,rSeamTargets{index}.numTCSOffsetY,rSeamTargets{index}.numTCSOffsetZ);
            ENDIF
        ELSE
            IF Present(OffsetinPolarFrame) THEN
                robtWeld:=offs(robtWeld,rSeamTargets{index}.numTCSOffsetX*Cos(rSeamTargets{index}.numAngle),rSeamTargets{index}.numTCSOffsetX*Sin(rSeamTargets{index}.numAngle),rSeamTargets{index}.numTCSOffsetZ);
                robtWeld:=RelTool(robtWeld,0,0,0\Rx:=rSeamTargets{index}.numTCSRotationX\Ry:=rSeamTargets{index}.numTCSRotationY\Rz:=rSeamTargets{index}.numTCSRotationZ);
            ELSE
                robtWeld:=RelTool(robtWeld,rSeamTargets{index}.numTCSOffsetX,rSeamTargets{index}.numTCSOffsetY,rSeamTargets{index}.numTCSOffsetZ\Rx:=rSeamTargets{index}.numTCSRotationX\Ry:=rSeamTargets{index}.numTCSRotationY\Rz:=rSeamTargets{index}.numTCSRotationZ);
            ENDIF
        ENDIF
        IF Present(confValue) THEN
            robtWeld.robconf:=confValue;
        ENDIF
        IF Present(extjointValue) THEN
            robtWeld.extax:=extjointValue;
        ENDIF
        RETURN robtWeld;
    ENDFUNC

    PROC WriteWeldTestLog(string strLogFileName,string strTestNo,num nunLayerNo,num numTargetIndex,seamdata seamTemp,welddata weldTemp,weavedata weaveTemp,trackdata trackTemp,num numWeldResult)
        VAR iodev iodevWeldTestLog;
        VAR string strTab:=",";
        VAR string strTPWriteHeader;
        VAR string strTPWrite;
        IF weaveTemp.weave_shape=0 THEN
            weaveTemp.weave_length:=0;
            weaveTemp.weave_width:=0;
            weaveTemp.weave_height:=0;
        ENDIF

        IF IsFile(strLogFileName\RegFile) THEN
        ENDIF
        Close iodevWeldTestLog;
        Open "HOME:"\File:=strLogFileName,iodevWeldTestLog\Append;
        Write iodevWeldTestLog,CDate()+" "+CTime()\NoNewLine;
        Write iodevWeldTestLog,strTab+strTestNo+strTab+ValToStr(nunLayerNo)+strTab+ValToStr(numTargetIndex)+strTab+ValToStr(weldTemp.weld_speed)+strTab+ValToStr(weldTemp.main_arc.sched)+strTab+ValToStr(weldTemp.main_arc.current)\NoNewLine;
        Write iodevWeldTestLog,strTab+ValToStr(weaveTemp.weave_shape)+strTab+ValToStr(weaveTemp.weave_length)+strTab+ValToStr(weaveTemp.weave_width)+strTab+ValToStr(weaveTemp.org_weave_height)+strTab+ValToStr(weaveTemp.dwell_center)+strTab+ValToStr(weaveTemp.dwell_left)+strTab+ValToStr(weaveTemp.dwell_right)\NoNewLine;
        Write iodevWeldTestLog,strTab+ValToStr(trackTemp.arctrack.track_type)+strTab+ValToStr(trackTemp.arctrack.gain_y)+strTab+ValToStr(trackTemp.arctrack.gain_z)+strTab+ValToStr(trackTemp.arctrack.weld_penetration)+strTab+ValToStr(trackTemp.arctrack.track_bias)\NoNewLine;
        Write iodevWeldTestLog,strTab+ValToStr(numWeldResult);
        Close iodevWeldTestLog;
    ERROR
        IF ERRNO=ERR_FILEACC THEN
            TPWrite "Create a new RegFile "+strLogFileName;
            Open "HOME:"\File:=strLogFileName,iodevWeldTestLog\Append;
            Write iodevWeldTestLog,"Time"+strTab+"TestNo"+strTab+"LayerNo"+strTab+"TargetIndex"+strTab+"WeldSpeed"+strTab+"sched"+strTab+"trackcurrent"\NoNewLine;
            Write iodevWeldTestLog,strTab+"WeaveShape"+strTab+"WeaveLength"+strTab+"WeaveWidth"+strTab+"WeaveHeight"+strTab+"DwellCenter"+strTab+"DwellLeft"+strTab+"DwellRight"\NoNewLine;
            Write iodevWeldTestLog,strTab+"track_type"+strTab+"gain_y"+strTab+"gain_z"+strTab+"weld_penetration"+strTab+"track_bias"\NoNewLine;
            Write iodevWeldTestLog,strTab+"WeldResult";
            Close iodevWeldTestLog;
            TRYNEXT;
        ENDIF
    ENDPROC

    FUNC num GetIncludedAngleofVectors(pos vectorA,pos vectorB)
        VAR num numdotprodAB;
        VAR num numcosAB;
        VAR num numIncludedAngle;
        numdotprodAB:=dotprod(vectorA,vectorB);
        numcosAB:=numdotprodAB/(VectMagn(vectorA)*VectMagn(vectorB));
        numIncludedAngle:=ACos(numcosAB);
        RETURN numIncludedAngle;
    ENDFUNC

    !The Z direction of TCP is projected to ZY-Plane
    FUNC num GetHeaderRollAxisAngle(robtarget robtCur)
        VAR robtarget robtApproach;
        VAR robtarget robtApproachProjection;
        VAR pos vectorZDirectionProjection;
        VAR pos vectorRollRef:=[0,0,1];
        VAR pos vectorCross;
        VAR num numHeaderRollAxisAngle;
        robtApproach:=reltool(robtCur,0,0,-20);
        robtApproachProjection:=robtApproach;
        robtApproachProjection.trans.x:=robtCur.trans.x;
        vectorZDirectionProjection:=robtApproachProjection.trans-robtCur.trans;
        IF Distance(robtApproachProjection.trans,robtCur.trans)=0 THEN
            RETURN 0;
        ENDIF
        numHeaderRollAxisAngle:=GetIncludedAngleofVectors(vectorZDirectionProjection,vectorRollRef);
        vectorCross:=CrossProd(vectorZDirectionProjection,vectorRollRef);
        IF vectorCross.x>=0 THEN
            RETURN numHeaderRollAxisAngle;
        ELSE
            RETURN 0-numHeaderRollAxisAngle;
        ENDIF

    ENDFUNC

    !The Z direction of TCP is projected to ZX-Plane
    FUNC num GetHeaderPitchAxisAngle(robtarget robtCur)
        VAR robtarget robtApproach;
        VAR robtarget robtApproachProjection;
        VAR pos vectorZDirectionProjection;
        VAR pos vectorPitchRef:=[0,0,1];
        VAR pos vectorCross;
        VAR num numPitchRollAxisAngle;
        robtApproach:=reltool(robtCur,0,0,-20);
        robtApproachProjection:=robtApproach;
        robtApproachProjection.trans.y:=robtCur.trans.y;
        vectorZDirectionProjection:=robtApproachProjection.trans-robtCur.trans;
        IF Distance(robtApproachProjection.trans,robtCur.trans)=0 THEN
            RETURN 0;
        ENDIF
        numPitchRollAxisAngle:=GetIncludedAngleofVectors(vectorZDirectionProjection,vectorPitchRef);
        vectorCross:=CrossProd(vectorZDirectionProjection,vectorPitchRef);
        IF vectorCross.y>=0 THEN
            RETURN numPitchRollAxisAngle;
        ELSE
            RETURN 0-numPitchRollAxisAngle;
        ENDIF
    ENDFUNC

    !Fro non-MultiMove System
    FUNC robtarget GetAlignedRobtarget(robtarget robtOri,num numAngle)
        VAR num numRollAxisAngle;
        VAR num numPitchAxisAngle;
        VAR robtarget robtNew;
        VAR num numRollAxisAngleAdjusted;
        robtNew:=robtOri;
        IF boolAlignHeaderRollAxis THEN
            numRollAxisAngle:=GetHeaderRollAxisAngle(robtOri);
            numRollAxisAngleAdjusted:=numRollAxisAngle*GetAlignedScalebyAngle(numAngle);
            robtNew.extax.eax_b:=numRollAxisAngleAdjusted+rPipeGrooveModel.numSeamNormalAngle;
        ELSE
            robtNew.extax.eax_b:=rPipeGrooveModel.numSeamNormalAngle;
        ENDIF
        !In this system, boolAlignHeaderPitchAxis=false
        IF boolAlignHeaderPitchAxis THEN
            numPitchAxisAngle:=GetHeaderPitchAxisAngle(robtOri);
            robtNew.extax.eax_a:=numPitchAxisAngleRef+numPitchAxisAngle;
            IF robtNew.extax.eax_a>numAxis1Max THEN
                robtNew.extax.eax_a:=numAxis1Max;
            ENDIF
        ELSE
            robtNew.extax.eax_a:=numPitchAxisAngleRef;
        ENDIF
        RETURN robtNew;
    ENDFUNC

    !To get the downhill welding
    FUNC num GetAlignedScalebyAngle(num numAngle)
        VAR num numScale:=0;
        IF numAngle<0 THEN
            numAngle:=numAngle+360*(Abs(numAngle DIV 360)+1);
        ENDIF
        IF numAngle>360 THEN
            numAngle:=numAngle MOD 360;
        ENDIF
        IF numAngle>=0 and numAngle<=90 THEN
            numScale:=numAngle/90;
        ELSEIF numAngle>90 and numAngle<=180 THEN
            !numScale:=(180-numAngle)/90;
            !numScale:=Sin(180-numAngle);
            IF Abs(rPipeGrooveModel.numHeaderDiameter-rPipeGrooveModel.numBranchDiameter)<10 THEN
                numScale:=numAngle/90;
            ELSE
                numScale:=1;
            ENDIF
        ELSEIF numAngle>180 and numAngle<=270 THEN
            numScale:=(numAngle-180)/90;
        ELSEIF numAngle>270 and numAngle<=360 THEN
            !numScale:=(360-numAngle)/90;
            !numScale:=Sin(360-numAngle);
            IF Abs(rPipeGrooveModel.numHeaderDiameter-rPipeGrooveModel.numBranchDiameter)<10 THEN
                numScale:=numAngle/90;
            ELSE
                numScale:=1;
            ENDIF
        ENDIF
        RETURN numScale;
    ENDFUNC

    !0 - 0, 90 - 1
    FUNC num GetLinearScalebyAngle(num numAngle)
        RETURN 1-Abs((numAngle MOD 180)-90)/90;
    ENDFUNC

    !0 - 0, 90 - 1
    FUNC num GetSineScalebyAngle(num numAngle)
        RETURN Sin(90-Abs((numAngle MOD 180)-90));
    ENDFUNC

    !0 - 0, 90 - 1
    FUNC num GetParabolaScalebyAngle(num numAngle)
        RETURN Pow(1-Abs((numAngle MOD 180)-90)/90,2);
    ENDFUNC

    !0 - 0, 90 - 1
    FUNC num GetCubicScalebyAngle(num numAngle)
        RETURN Pow(1-Abs((numAngle MOD 180)-90)/90,3);
    ENDFUNC

    !Fro MultiMove System
    FUNC extjoint GetAlignedExternalAxis(robtarget robtOri,num numAngle)
        VAR robtarget robtNew;
        robtNew:=GetAlignedRobtarget(robtOri,numAngle);
        RETURN robtNew.extax;
    ENDFUNC

    FUNC jointtarget JointSubtract(jointtarget j1,jointtarget j2)
        VAR jointtarget j;
        j.robax.rax_1:=Round(j1.robax.rax_1-j2.robax.rax_1);
        j.robax.rax_2:=Round(j1.robax.rax_2-j2.robax.rax_2);
        j.robax.rax_3:=Round(j1.robax.rax_3-j2.robax.rax_3);
        j.robax.rax_4:=Round(j1.robax.rax_4-j2.robax.rax_4);
        j.robax.rax_5:=Round(j1.robax.rax_5-j2.robax.rax_5);
        j.robax.rax_6:=Round(j1.robax.rax_6-j2.robax.rax_6);
        j.extax.eax_a:=Round(j1.extax.eax_a-j2.extax.eax_a);
        j.extax.eax_b:=Round(j1.extax.eax_b-j2.extax.eax_b);
        j.extax.eax_c:=Round(j1.extax.eax_c-j2.extax.eax_c);
        j.extax.eax_d:=Round(j1.extax.eax_d-j2.extax.eax_d);
        j.extax.eax_e:=Round(j1.extax.eax_e-j2.extax.eax_e);
        j.extax.eax_f:=Round(j1.extax.eax_f-j2.extax.eax_f);
        RETURN j;
    ENDFUNC

    !Unit: mm and kg
    FUNC num GetWeightofPipe(num numDiameter,num numThickness,num numLength)
        VAR num numVolumn;
        numVolumn:=(Pow(numDiameter/2,2)-Pow((numDiameter/2-numThickness),2))*pi*numLength;
        RETURN numVolumn*7.8/1000000;
    ENDFUNC

    !Unit: mm and kg
    FUNC num GetWeightofCuboid(num numLength,num numWidth,num numHeight)
        VAR num numVolumn;
        numVolumn:=numLength*numWidth*numHeight;
        RETURN numVolumn*7.8/1000000;
    ENDFUNC

    PROC RefreshJointChangeMax(num index,jointtarget jointPre,jointtarget jointCur,INOUT jointtarget jointChangeMaxTemp,INOUT jointtarget jointChangeIndexMaxTemp)
        VAR jointtarget jointChangeCur;
        jointChangeCur:=JointSubtract(jointCur,jointPre);
        IF Abs(jointChangeMaxTemp.robax.rax_1)<Abs(jointChangeCur.robax.rax_1) THEN
            jointChangeMaxTemp.robax.rax_1:=jointChangeCur.robax.rax_1;
            jointChangeIndexMaxTemp.robax.rax_1:=index;
        ENDIF

        IF Abs(jointChangeMaxTemp.robax.rax_2)<Abs(jointChangeCur.robax.rax_2) THEN
            jointChangeMaxTemp.robax.rax_2:=jointChangeCur.robax.rax_2;
            jointChangeIndexMaxTemp.robax.rax_2:=index;
        ENDIF

        IF Abs(jointChangeMaxTemp.robax.rax_3)<Abs(jointChangeCur.robax.rax_3) THEN
            jointChangeMaxTemp.robax.rax_3:=jointChangeCur.robax.rax_3;
            jointChangeIndexMaxTemp.robax.rax_3:=index;
        ENDIF

        IF Abs(jointChangeMaxTemp.robax.rax_4)<Abs(jointChangeCur.robax.rax_4) THEN
            jointChangeMaxTemp.robax.rax_4:=jointChangeCur.robax.rax_4;
            jointChangeIndexMaxTemp.robax.rax_4:=index;
        ENDIF

        IF Abs(jointChangeMaxTemp.robax.rax_5)<Abs(jointChangeCur.robax.rax_5) THEN
            jointChangeMaxTemp.robax.rax_5:=jointChangeCur.robax.rax_5;
            jointChangeIndexMaxTemp.robax.rax_5:=index;
        ENDIF

        IF Abs(jointChangeMaxTemp.robax.rax_6)<Abs(jointChangeCur.robax.rax_6) THEN
            jointChangeMaxTemp.robax.rax_6:=jointChangeCur.robax.rax_6;
            jointChangeIndexMaxTemp.robax.rax_6:=index;
        ENDIF

        IF Abs(jointChangeMaxTemp.extax.eax_a)<Abs(jointChangeCur.extax.eax_a) THEN
            jointChangeMaxTemp.extax.eax_a:=jointChangeCur.extax.eax_a;
            jointChangeIndexMaxTemp.extax.eax_a:=index;
        ENDIF

        IF Abs(jointChangeMaxTemp.extax.eax_b)<Abs(jointChangeCur.extax.eax_b) THEN
            jointChangeMaxTemp.extax.eax_b:=jointChangeCur.extax.eax_b;
            jointChangeIndexMaxTemp.extax.eax_b:=index;
        ENDIF

        IF Abs(jointChangeMaxTemp.extax.eax_c)<Abs(jointChangeCur.extax.eax_c) THEN
            jointChangeMaxTemp.extax.eax_c:=jointChangeCur.extax.eax_c;
            jointChangeIndexMaxTemp.extax.eax_c:=index;
        ENDIF

        IF Abs(jointChangeMaxTemp.extax.eax_d)<Abs(jointChangeCur.extax.eax_d) THEN
            jointChangeMaxTemp.extax.eax_d:=jointChangeCur.extax.eax_d;
            jointChangeIndexMaxTemp.extax.eax_d:=index;
        ENDIF

        IF Abs(jointChangeMaxTemp.extax.eax_e)<Abs(jointChangeCur.extax.eax_e) THEN
            jointChangeMaxTemp.extax.eax_e:=jointChangeCur.extax.eax_e;
            jointChangeIndexMaxTemp.extax.eax_e:=index;
        ENDIF

        IF Abs(jointChangeMaxTemp.extax.eax_f)<Abs(jointChangeCur.extax.eax_f) THEN
            jointChangeMaxTemp.extax.eax_f:=jointChangeCur.extax.eax_f;
            jointChangeIndexMaxTemp.extax.eax_f:=index;
        ENDIF
    ENDPROC

    FUNC RECORDWeldProcedure GetWeldProcedure(string strWeldProcedureID)
        VAR RECORDWeldProcedure rWeldProcedures{100};
        VAR RECORDWeldProcedure rWeldProcedure;
        FOR i FROM 1 TO 2 DO
            GetDataVal "rWeldProcedures"+ValToStr(i),rWeldProcedures;
            FOR j FROM 1 TO dim(rWeldProcedures1,1) DO
                IF rWeldProcedures{j}.strWeldProcedureID=strWeldProcedureID THEN
                    rWeldProcedure:=rWeldProcedures{j};
                    rWeldProcedures{j}.strRemark:=CDate()+" "+CTime();
                    SetDataVal "rWeldProcedures"+ValToStr(i),rWeldProcedures;
                    RETURN rWeldProcedure;
                ENDIF
            ENDFOR
        ENDFOR
        RETURN rWeldProcedure;
    ENDFUNC

    PROC CopyRobLayerTargets()
        VAR num numFromRobot:=1;
        VAR num numFromLayer:=1;
        VAR num numToRobot;
        VAR num numToLayer;
        !VAR RECORDWeldTarget rRobLayerTemp{100};
        !        TPReadNum numFromRobot,"From Robot:";
        !        TPReadNum numFromLayer,"From Layer:";
        !        TPReadNum numToRobot,"To Robot:";
        !        TPReadNum numToLayer,"To Layer:";
        numFromRobot:=UINumEntry(\Header:="numFromRobot"\Message:="From Robot:"\InitValue:=1\MinValue:=1\MaxValue:=2\AsInteger);
        numFromLayer:=UINumEntry(\Header:="numFromLayer"\Message:="From Layer:"\InitValue:=1\MinValue:=1\MaxValue:=11\AsInteger);
        numToRobot:=UINumEntry(\Header:="numToRobot"\Message:="To Robot:"\InitValue:=numFromRobot\MinValue:=1\MaxValue:=2\AsInteger);
        numToLayer:=UINumEntry(\Header:="numToLayer"\Message:="To Layer:"\MinValue:=1\MaxValue:=11\AsInteger);

        CopyRobLayer numFromRobot,numFromLayer,numToRobot,numToLayer;

        !        GetDataVal "rRob"+ValToStr(numFromRobot)+"Layer"+ValToStr(numFromLayer),rRobLayerCur;
        !        GetDataVal "numRob"+ValToStr(numFromRobot)+"Layer"+ValToStr(numFromLayer)+"Total",numRobLayerCurTotal;
        !        SetDataVal "rRob"+ValToStr(numToRobot)+"Layer"+ValToStr(numToLayer),rRobLayerCur;
        !        SetDataVal "numRob"+ValToStr(numToRobot)+"Layer"+ValToStr(numToLayer)+"Total",numRobLayerCurTotal;

    ENDPROC

    PROC CopyRobLayer(num numFromRobot,num numFromLayer,num numToRobot,num numToLayer)
        VAR RECORDWeldTarget rRobLayerTemp{100};
        GetDataVal "rRob"+ValToStr(numFromRobot)+"Layer"+ValToStr(numFromLayer),rRobLayerCur;
        GetDataVal "numRob"+ValToStr(numFromRobot)+"Layer"+ValToStr(numFromLayer)+"Total",numRobLayerCurTotal;
        SetDataVal "rRob"+ValToStr(numToRobot)+"Layer"+ValToStr(numToLayer),rRobLayerCur;
        SetDataVal "numRob"+ValToStr(numToRobot)+"Layer"+ValToStr(numToLayer)+"Total",numRobLayerCurTotal;
    ENDPROC

    FUNC extjoint GetAlignedJointtarget(RECORDWeldTarget rSeamTargets{*},num index,bool boolUseAlignedSTNbyFixedValue\num DegreeMin\num DegreeMax)
        VAR robtarget rob1;
        VAR extjoint extjointtemp;
        VAR num numDegreeMin:=0;
        VAR num numDegreeMax:=90;
        VAR num numAngleRevised:=0;
        IF Present(DegreeMin) THEN
            numDegreeMin:=Abs(DegreeMin);
        ENDIF
        IF Present(DegreeMax) THEN
            numDegreeMax:=Abs(DegreeMax);
        ENDIF
        rob1:=GetRobtarget(rSeamTargets,index);
        extjointtemp:=GetAlignedExternalAxis(rob1,rSeamTargets{index}.numAngle);
        IF boolUseAlignedSTNbyFixedValue THEN
            numAngleRevised:=(rRobLayerCur{index}.numAngle MOD 360+360) MOD 360;
            extjointtemp.eax_b:=numDegreeMax-(numDegreeMax-numDegreeMin)*Abs(numAngleRevised MOD 180-90)/90;
            IF numAngleRevised>180 THEN
                extjointtemp.eax_b:=0-extjointtemp.eax_b;
            ENDIF
            extjointtemp.eax_b:=extjointtemp.eax_b+rPipeGrooveModel.numSeamNormalAngle;
        ENDIF
        RETURN extjointtemp;
    ENDFUNC

    FUNC bool CheckLicense()
        VAR string strRobotSerialNumber:="1600-515088";
        IF IsSysId(strRobotSerialNumber) THEN
            RETURN TRUE;
        ELSE
            !            ErrWrite "System identity fault","Faulty system identity for this program ";
            !            EXIT;
            RETURN FALSE;
        ENDIF
    ENDFUNC

    PROC GetSysInformation()
        VAR string serial;
        VAR string version;
        VAR string versionname;
        VAR string rtype;
        VAR string cid;
        VAR string lanip;
        VAR string clang;
        VAR string sysname;
        serial:=GetSysInfo(\SerialNo);
        version:=GetSysInfo(\SWVersion);
        versionname:=GetSysInfo(\SWVersionName);
        rtype:=GetSysInfo(\RobotType);
        cid:=GetSysInfo(\CtrlId);
        lanip:=GetSysInfo(\LanIp);
        clang:=GetSysInfo(\CtrlLang);
        sysname:=GetSysInfo(\SystemName);
    ENDPROC

    PROC BitSetGO(VAR signalgo goData,num numBitPos)
        VAR dnum dnumGoData;
        dnumGoData:=GOutputDnum(goData);
        BitSet dnumGoData,numBitPos+1;
        SetGO goData,dnumGoData;
    ENDPROC

    PROC BitClearGO(VAR signalgo goData,num numBitPos)
        VAR dnum dnumGoData;
        dnumGoData:=GOutputDnum(goData);
        BitClear dnumGoData,numBitPos+1;
        SetGO goData,dnumGoData;
    ENDPROC

    !y=ax+b
    !a - numXVariable1, b - numIntercept
    !posSample - only use x and y
    PROC UnaryLinearRegressionAnalysis(pos posSample{*},\num numSample,INOUT num numXVariable1,INOUT num numIntercept,\INOUT num numAngleofInclination\INOUT num numSST,\INOUT num numSSR,\INOUT num numRSquare)
        VAR num numMeanX:=0;
        VAR num numMeanY:=0;
        VAR num numMeanXY:=0;
        VAR num numMeanXSquare:=0;
        VAR num numSampleTotal:=0;

        IF Present(numSample) THEN
            IF numSample>Dim(posSample,1) THEN
                numSampleTotal:=Dim(posSample,1);
            ELSE
                numSampleTotal:=numSample;
            ENDIF
        ELSE
            numSampleTotal:=Dim(posSample,1);
        ENDIF
        FOR i FROM 1 TO numSampleTotal DO
            numMeanX:=numMeanX+posSample{i}.x;
            numMeanY:=numMeanY+posSample{i}.y;
            numMeanXY:=numMeanXY+posSample{i}.x*posSample{i}.y;
            numMeanXSquare:=numMeanXSquare+posSample{i}.x*posSample{i}.x;
        ENDFOR
        numMeanX:=numMeanX/numSampleTotal;
        numMeanY:=numMeanY/numSampleTotal;
        numMeanXY:=numMeanXY/numSampleTotal;
        numMeanXSquare:=numMeanXSquare/numSampleTotal;
        numXVariable1:=(numMeanX*numMeanY-numMeanXY)/(numMeanX*numMeanX-numMeanXSquare);
        numIntercept:=numMeanY-numXVariable1*numMeanX;

        IF Present(numAngleofInclination) THEN
            numAngleofInclination:=ATan(numXVariable1);
        ENDIF

        IF Present(numSST) THEN
            numSST:=0;
        ENDIF
        IF Present(numSSR) THEN
            numSSR:=0;
        ENDIF
        IF Present(numRSquare) THEN
            numRSquare:=0;
        ENDIF
        FOR i FROM 1 TO numSampleTotal DO
            IF Present(numSST) THEN
                numSST:=numSST+pow((posSample{i}.y-numMeanY),2);
            ENDIF
            IF Present(numSSR) THEN
                numSSR:=numSSR+pow((numXVariable1*posSample{i}.x+numIntercept-numMeanY),2);
            ENDIF
        ENDFOR
        IF Present(numRSquare) THEN
            numRSquare:=numSSR/numSST;
        ENDIF
    ENDPROC

    FUNC num GetPedestalVertexHeight(num numBottomWidth,num numBottomHeight,num numAngle)
        VAR num numHeight;
        VAR num numVertexHeight;
        numHeight:=(numBottomWidth/2)/Tan(numAngle/2);
        numVertexHeight:=numBottomHeight-numHeight;
        RETURN numVertexHeight;
    ENDFUNC

    PROC ConvertEulerQuaternion(INOUT orient orientQuaternion,INOUT num numEZ,INOUT num numEY,INOUT num numEX\switch EulerToQuaternion|switch QuaternionToEuler)
        IF Present(EulerToQuaternion) THEN
            orientQuaternion:=OrientZYX(numEZ,numEY,numEZ);
        ELSE
            numEZ:=EulerZYX(\Z,orientQuaternion);
            numEY:=EulerZYX(\Y,orientQuaternion);
            numEX:=EulerZYX(\X,orientQuaternion);
        ENDIF
        TPWrite "Euler Angle: ["+ValToStr(numEZ)+","+ValToStr(numEY)+","+ValToStr(numEX)+"] is equal to ";
        TPWrite ValToStr(orientQuaternion);
    ENDPROC

    FUNC confdata GetCurrentConfData()
        VAR robtarget robtCur;
        robtCur:=CRobT();
        RETURN robtCur.robconf;
    ENDFUNC

    FUNC num GetAdaptiveWeldSpeed(weavedata weaveNominal,num numWeldSpeedNominal,num numWeldWidth)
        VAR num numWeldSpeed;
        numWeldSpeed:=Round(numWeldSpeedNominal*Sqrt((pow(weaveNominal.weave_length,2)+pow(2*weaveNominal.weave_width,2))/(pow(weaveNominal.weave_length,2)+pow(2*numWeldWidth,2)))\Dec:=1);
        RETURN numWeldSpeed;
    ENDFUNC

    FUNC num GetLayerInterpolation(num numAngle,RECORDCircle rCircle)
        VAR num numInterpolationValue;
        VAR num numInitialValue;
        VAR num numFinalValue;
        numAngle:=numAngle MOD 360;
        IF numAngle>=0 AND numAngle<=90 THEN
            numInitialValue:=rCircle.numDegree0;
            numFinalValue:=rCircle.numDegree90;
        ELSEIF numAngle>=90 AND numAngle<=180 THEN
            numInitialValue:=rCircle.numDegree180;
            numFinalValue:=rCircle.numDegree90;
        ELSEIF numAngle>=180 AND numAngle<=270 THEN
            numInitialValue:=rCircle.numDegree180;
            numFinalValue:=rCircle.numDegree270;
        ELSE
            numInitialValue:=rCircle.numDegree0;
            numFinalValue:=rCircle.numDegree270;
        ENDIF
        IF rCircle.numCurveType=1 THEN
            numInterpolationValue:=numInitialValue+(numFinalValue-numInitialValue)*GetLinearScalebyAngle(numAngle);
        ELSEIF rCircle.numCurveType=2 THEN
            numInterpolationValue:=numInitialValue+(numFinalValue-numInitialValue)*GetSineScalebyAngle(numAngle);
        ELSEIF rCircle.numCurveType=3 THEN
            numInterpolationValue:=numInitialValue+(numFinalValue-numInitialValue)*GetParabolaScalebyAngle(numAngle);
        ELSEIF rCircle.numCurveType=4 THEN
            numInterpolationValue:=numInitialValue+(numFinalValue-numInitialValue)*GetCubicScalebyAngle(numAngle);
        ELSE
            numInterpolationValue:=0;
        ENDIF
        RETURN numInterpolationValue;
    ENDFUNC

    PROC DeleteDirectory(string strDirPath)
        VAR dir dirCur;
        VAR string strFileName;
        IF NOT IsFile(strDirPath\Directory) THEN
            RETURN ;
        ENDIF
        OpenDir dirCur,strDirPath;
        WHILE ReadDir(dirCur,strFileName) DO
            IF strFileName<>"." AND strFileName<>".." THEN
                IF IsFile(strDirPath+"/"+strFileName\Directory) THEN
                    DeleteDirectory strDirPath+"/"+strFileName;
                ELSE
                    RemoveFile strDirPath+"/"+strFileName;
                ENDIF
            ENDIF
        ENDWHILE
        CloseDir dirCur;
        RemoveDir strDirPath;
    ERROR
        IF ERRNO=ERR_FILEACC THEN
            TPWrite "DeleteDirectory Error: ERR_FILEACC";
            RETURN ;
            !TRYNEXT;
        ENDIF
    UNDO
        CloseDir dirCur;
    ENDPROC

    !The return point is P3
    !The line is from P1 to P2, and The P3 is more closer to P2
    FUNC pos GetAnotherPointOnTheLine(pos P1,pos P2,num numDistance31)
        VAR pos P3;
        VAR num numDistance21;
        numDistance21:=Distance(P1,P2);
        P3.x:=numDistance31/numDistance21*(P2.x-P1.x)+P1.x;
        P3.y:=numDistance31/numDistance21*(P2.y-P1.y)+P1.y;
        P3.z:=numDistance31/numDistance21*(P2.z-P1.z)+P1.z;
        RETURN P3;
    ENDFUNC
ENDMODULE

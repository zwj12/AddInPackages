MODULE SharedModule
    !*****************************************************
    !Module Name: SharedModule
    !Version:     1.0
    !Description: This module is shared by all of the tasks but normally can not be encrypted
    !Date:        2018-8-23
    !Author:      Michael
    !*****************************************************

    PERS num numArcCalcIntercept:=0.3;
    VAR intnum intnumArcCalcIntercept;

    PERS bool boolGenerateModuleAutoLoad:=FALSE;
    PERS bool boolTrackOnCoerce:=FALSE;
    TASK PERS string strGenerateModuleName:="PathRob1_1_2163_230_762_45";
    TASK PERS string strGenerateProcName:="WeldPath";
    VAR iodev iodevPathModule;

    PROC WeldLayerIndependent(\switch Start\switch End\num numIndexStart\num numIndexEnd\confdata robconf\switch ReverseWeldDirection)
        VAR num index;
        VAR num IndexEnd;
        VAR string strSeamName;
        VAR robtarget robtCur;
        VAR jointtarget jointPre;
        VAR jointtarget jointCur;
        VAR jointtarget jointChangeMaxTemp:=[[0,0,0,0,0,0],[0,0,0,0,0,0]];
        VAR jointtarget jointChangeIndexMaxTemp:=[[0,0,0,0,0,0],[0,0,0,0,0,0]];
        VAR RECORDWeldProcedure rWeldProcedureNext;
        VAR string sHeader;
        VAR string sMsg{5};
        VAR btnres nAnswer;

        RefreshCurrentLayerTargets strSeamName\ReverseWeldDirection?ReverseWeldDirection;

        IF NOT (rPipeGrooveModel.numCooperativeRobots=3 AND numCurTaskNo=2) THEN
            IF boolMoveLSubstituted THEN
                numStartPoint:=UINumEntry(\Header:="Start Point Index"\Message:="Which point do you want to start to adjust?"\Icon:=iconInfo\InitValue:=numStartPoint\MinValue:=1\MaxValue:=numRobLayerCurTotal\AsInteger);
            ENDIF
        ENDIF

        IF Present(Start) THEN
            WeldStart\IndexStart?numIndexStart\robconf?robconf;
        ENDIF

        IF Present(numIndexStart) THEN
            index:=numIndexStart;
        ELSE
            index:=1;
        ENDIF

        IF Present(numIndexEnd) THEN
            IndexEnd:=numIndexEnd;
        ELSE
            IndexEnd:=numRobLayerCurTotal;
        ENDIF

        WHILE index<=IndexEnd DO
            jointPre:=CJointT();
            robtCur:=CRobT();
            robtNext:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);

            IF boolMoveLSubstituted THEN
                IF NOT (rPipeGrooveModel.numCooperativeRobots=3 AND numCurTaskNo=2) THEN
                    boolMoveLAdjustOK:=FALSE;
                ENDIF
                WaitSyncTask SyncMoveLSubstituted1,taskListCurrent;

                WHILE NOT boolMoveLAdjustOK DO
                    robtNext:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    Logging\INFO,"Moving to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            MoveL robtNext,speedWeld,fine,toolWeldGun\WObj:=wobjCurrent1;
                        ELSE
                            MoveL robtNext,speedWeld,fine,toolWeldGun\WObj:=wobjCurrent2;
                        ENDIF
                    ELSE
                        MoveL robtNext,speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
                    ENDIF
                    IF NOT (rPipeGrooveModel.numCooperativeRobots=3 AND numCurTaskNo=2) THEN
                        IF index>=numStartPoint THEN
                            sHeader:="Adjust seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                            sMsg{1}:="Press Yes to confirm the robtarget.";
                            sMsg{2}:="";
                            sMsg{3}:="Press No to retry once again.";
                            sMsg{4}:="";
                            sMsg{5}:="";
                            UIMsgBox\Header:=sHeader,sMsg{1}\MsgLine2:=sMsg{2}\MsgLine3:=sMsg{3}\MsgLine4:=sMsg{4}\MsgLine5:=sMsg{5}\Buttons:=btnYesNo\Icon:=iconInfo\Result:=nAnswer;
                            IF (nAnswer=resYes) THEN
                                boolMoveLAdjustOK:=TRUE;
                            ENDIF
                        ELSE
                            boolMoveLAdjustOK:=TRUE;
                        ENDIF
                    ENDIF
                    WaitSyncTask SyncMoveLSubstituted2,taskListCurrent;
                ENDWHILE
            ELSE
                TEST rRobLayerCur{index}.numProcessType
                CASE 1:
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    Logging\INFO,"ArcLStarting to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);

                    IF numWaitTimeForAsyncArcOn<0 AND numCurTaskNo=1 THEN
                        WaitTime\InPos,Abs(numWaitTimeForAsyncArcOn);
                    ELSEIF numWaitTimeForAsyncArcOn>0 AND numCurTaskNo=2 THEN
                        WaitTime\InPos,Abs(numWaitTimeForAsyncArcOn);
                    ENDIF

                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            IF weaveNext.weave_shape=0 THEN
                                ArcLStart robtNext,speedWeld,seamNext,weldNext,fine,toolWeldGun\WObj:=wobjCurrent1\SeamName:=strSeamName;
                            ELSE
                                ArcLStart robtNext,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent1\Track:=trackNext\SeamName:=strSeamName;
                            ENDIF
                        ELSE
                            IF weaveNext.weave_shape=0 THEN
                                ArcLStart robtNext,speedWeld,seamNext,weldNext,fine,toolWeldGun\WObj:=wobjCurrent2\SeamName:=strSeamName;
                            ELSE
                                ArcLStart robtNext,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent2\Track:=trackNext\SeamName:=strSeamName;
                            ENDIF
                        ENDIF
                    ELSE
                        IF weaveNext.weave_shape=0 THEN
                            ArcLStart robtNext,speedWeld,seamNext,weldNext,fine,toolWeldGun\WObj:=wobjCurrent\SeamName:=strSeamName;
                        ELSE
                            ArcLStart robtNext,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackNext\SeamName:=strSeamName;
                        ENDIF
                    ENDIF
                CASE 2:
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    Logging\INFO,"ArcLing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            IF weaveNext.weave_shape=0 THEN
                                ArcL robtNext,speedWeld,seamNext,weldNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent1;
                            ELSE
                                ArcL robtNext,speedWeld,seamNext,weldNext\Weave:=weaveNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent1\Track:=trackNext;
                            ENDIF
                        ELSE
                            IF weaveNext.weave_shape=0 THEN
                                ArcL robtNext,speedWeld,seamNext,weldNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent2;
                            ELSE
                                ArcL robtNext,speedWeld,seamNext,weldNext\Weave:=weaveNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent2\Track:=trackNext;
                            ENDIF
                        ENDIF
                    ELSE
                        IF weaveNext.weave_shape=0 THEN
                            ArcL robtNext,speedWeld,seamNext,weldNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
                        ELSE
                            ArcL robtNext,speedWeld,seamNext,weldNext\Weave:=weaveNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackNext;
                        ENDIF
                    ENDIF
                CASE 3:
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    Logging\INFO,"ArcLEnding to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            IF weaveNext.weave_shape=0 THEN
                                ArcLEnd robtNext,speedWeld,seamNext,weldNext,fine,toolWeldGun\WObj:=wobjCurrent1;
                            ELSE
                                ArcLEnd robtNext,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent1\Track:=trackNext;
                            ENDIF
                        ELSE
                            IF weaveNext.weave_shape=0 THEN
                                ArcLEnd robtNext,speedWeld,seamNext,weldNext,fine,toolWeldGun\WObj:=wobjCurrent2;
                            ELSE
                                ArcLEnd robtNext,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent2\Track:=trackNext;
                            ENDIF
                        ENDIF
                    ELSE
                        IF weaveNext.weave_shape=0 THEN
                            ArcLEnd robtNext,speedWeld,seamNext,weldNext,fine,toolWeldGun\WObj:=wobjCurrent;
                        ELSE
                            ArcLEnd robtNext,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackNext;
                        ENDIF
                    ENDIF
                CASE 4:
                    Incr index;
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    Logging\INFO,"ArcCStarting seam targets: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index-1)+" and "+ValToStr(index);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            IF weaveNext.weave_shape=0 THEN
                                ArcCStart robtNext,robtCircleEnd,speedWeld,seamNext,weldNext,fine,toolWeldGun\WObj:=wobjCurrent1\SeamName:=strSeamName;
                            ELSE
                                ArcCStart robtNext,robtCircleEnd,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent1\Track:=trackNext\SeamName:=strSeamName;
                            ENDIF
                        ELSE
                            IF weaveNext.weave_shape=0 THEN
                                ArcCStart robtNext,robtCircleEnd,speedWeld,seamNext,weldNext,fine,toolWeldGun\WObj:=wobjCurrent2\SeamName:=strSeamName;
                            ELSE
                                ArcCStart robtNext,robtCircleEnd,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent2\Track:=trackNext\SeamName:=strSeamName;
                            ENDIF
                        ENDIF
                    ELSE
                        IF weaveNext.weave_shape=0 THEN
                            ArcCStart robtNext,robtCircleEnd,speedWeld,seamNext,weldNext,fine,toolWeldGun\WObj:=wobjCurrent\SeamName:=strSeamName;
                        ELSE
                            ArcCStart robtNext,robtCircleEnd,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackNext\SeamName:=strSeamName;
                        ENDIF
                    ENDIF
                CASE 5:
                    Incr index;
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    Logging\INFO,"ArcCing to seam targets: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index-1)+" and "+ValToStr(index);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            IF weaveNext.weave_shape=0 THEN
                                ArcC robtNext,robtCircleEnd,speedWeld,seamNext,weldNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent1;
                            ELSE
                                ArcC robtNext,robtCircleEnd,speedWeld,seamNext,weldNext\Weave:=weaveNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent1\Track:=trackNext;
                            ENDIF
                        ELSE
                            IF weaveNext.weave_shape=0 THEN
                                ArcC robtNext,robtCircleEnd,speedWeld,seamNext,weldNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent2;
                            ELSE
                                ArcC robtNext,robtCircleEnd,speedWeld,seamNext,weldNext\Weave:=weaveNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent2\Track:=trackNext;
                            ENDIF
                        ENDIF
                    ELSE
                        IF weaveNext.weave_shape=0 THEN
                            ArcC robtNext,robtCircleEnd,speedWeld,seamNext,weldNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
                        ELSE
                            ArcC robtNext,robtCircleEnd,speedWeld,seamNext,weldNext\Weave:=weaveNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackNext;
                        ENDIF
                    ENDIF
                CASE 6:
                    Incr index;
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    Logging\INFO,"ArcCEnding seam targets: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index-1)+" and "+ValToStr(index);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            IF weaveNext.weave_shape=0 THEN
                                ArcCEnd robtNext,robtCircleEnd,speedWeld,seamNext,weldNext,fine,toolWeldGun\WObj:=wobjCurrent1;
                            ELSE
                                ArcCEnd robtNext,robtCircleEnd,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent1\Track:=trackNext;
                            ENDIF
                        ELSE
                            IF weaveNext.weave_shape=0 THEN
                                ArcCEnd robtNext,robtCircleEnd,speedWeld,seamNext,weldNext,fine,toolWeldGun\WObj:=wobjCurrent2;
                            ELSE
                                ArcCEnd robtNext,robtCircleEnd,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent2\Track:=trackNext;
                            ENDIF
                        ENDIF
                    ELSE
                        IF weaveNext.weave_shape=0 THEN
                            ArcCEnd robtNext,robtCircleEnd,speedWeld,seamNext,weldNext,fine,toolWeldGun\WObj:=wobjCurrent;
                        ELSE
                            ArcCEnd robtNext,robtCircleEnd,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackNext;
                        ENDIF
                    ENDIF
                CASE 11:
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    !Set the standard weave width
                    adaptNext.NominalWidth:=weaveNext.weave_width;
                    numGrooveWidthNext:=weaveNext.weave_width;
                    Logging\INFO,"ArcCalcLStarting to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    Logging\INFO,"NominalWidth="+ValToStr(adaptNext.NominalWidth)+", WeaveWidth90="+ValToStr(numWeaveWidth90)+", GrooveWidthNext="+ValToStr(numGrooveWidthNext);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            ArcCalcLStart robtNext,speedWeld,numGrooveWidthNext,adaptNext,seamNext,weldNext,weaveNext,fine,toolWeldGun\WObj:=wobjCurrent1,trackNext\SeamName:=strSeamName;
                        ELSE
                            ArcCalcLStart robtNext,speedWeld,numGrooveWidthNext,adaptNext,seamNext,weldNext,weaveNext,fine,toolWeldGun\WObj:=wobjCurrent2,trackNext\SeamName:=strSeamName;
                        ENDIF
                    ELSE
                        ArcCalcLStart robtNext,speedWeld,numGrooveWidthNext,adaptNext,seamNext,weldNext,weaveNext,fine,toolWeldGun\WObj:=wobjCurrent,trackNext\SeamName:=strSeamName;
                    ENDIF
                CASE 12:
                    !RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    numGrooveWidthNext:=adaptNext.NominalWidth+(1-Abs((rRobLayerCur{index}.numAngle MOD 180)-90)/90)*(numWeaveWidth90-adaptNext.NominalWidth);
                    Logging\INFO,"ArcCalcLing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    Logging\INFO,"numGrooveWidthNext="+ValToStr(numGrooveWidthNext);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            ArcCalcL robtNext,speedWeld,numGrooveWidthNext,adaptNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent1;
                        ELSE
                            ArcCalcL robtNext,speedWeld,numGrooveWidthNext,adaptNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent2;
                        ENDIF
                    ELSE
                        ArcCalcL robtNext,speedWeld,numGrooveWidthNext,adaptNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
                    ENDIF
                CASE 13:
                    !RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    numGrooveWidthNext:=adaptNext.NominalWidth+(1-Abs((rRobLayerCur{index}.numAngle MOD 180)-90)/90)*(numWeaveWidth90-adaptNext.NominalWidth);
                    Logging\INFO,"ArcCalcLEnding to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    Logging\INFO,"numGrooveWidthNext="+ValToStr(numGrooveWidthNext);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            ArcCalcLEnd robtNext,speedWeld,numGrooveWidthNext,adaptNext,fine,toolWeldGun\WObj:=wobjCurrent1;
                        ELSE
                            ArcCalcLEnd robtNext,speedWeld,numGrooveWidthNext,adaptNext,fine,toolWeldGun\WObj:=wobjCurrent2;
                        ENDIF
                    ELSE
                        ArcCalcLEnd robtNext,speedWeld,numGrooveWidthNext,adaptNext,fine,toolWeldGun\WObj:=wobjCurrent;
                    ENDIF
                CASE 15:
                    Incr index;
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    !RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    numGrooveWidthNext:=adaptNext.NominalWidth+(1-Abs((rRobLayerCur{index}.numAngle MOD 180)-90)/90)*(numWeaveWidth90-adaptNext.NominalWidth);
                    Logging\INFO,"ArcCalcCing to seam targets: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index-1)+" and "+ValToStr(index);
                    Logging\INFO,"numGrooveWidthNext="+ValToStr(numGrooveWidthNext);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            ArcCalcC robtNext,robtCircleEnd,speedWeld,numGrooveWidthNext,adaptNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent1;
                        ELSE
                            ArcCalcC robtNext,robtCircleEnd,speedWeld,numGrooveWidthNext,adaptNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent2;
                        ENDIF
                    ELSE
                        ArcCalcC robtNext,robtCircleEnd,speedWeld,numGrooveWidthNext,adaptNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
                    ENDIF
                CASE 16:
                    Incr index;
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    !RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    numGrooveWidthNext:=adaptNext.NominalWidth+(1-Abs((rRobLayerCur{index}.numAngle MOD 180)-90)/90)*(numWeaveWidth90-adaptNext.NominalWidth);
                    Logging\INFO,"ArcCalcCEnding to seam targets: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index-1)+" and "+ValToStr(index);
                    Logging\INFO,"numGrooveWidthNext="+ValToStr(numGrooveWidthNext);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            ArcCalcCEnd robtNext,robtCircleEnd,speedWeld,numGrooveWidthNext,adaptNext,fine,toolWeldGun\WObj:=wobjCurrent1;
                        ELSE
                            ArcCalcCEnd robtNext,robtCircleEnd,speedWeld,numGrooveWidthNext,adaptNext,fine,toolWeldGun\WObj:=wobjCurrent2;
                        ENDIF
                    ELSE
                        ArcCalcCEnd robtNext,robtCircleEnd,speedWeld,numGrooveWidthNext,adaptNext,fine,toolWeldGun\WObj:=wobjCurrent;
                    ENDIF
                CASE 7:
                    Logging\INFO,"MoveLing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            MoveL robtNext,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent1;
                        ELSE
                            MoveL robtNext,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent2;
                        ENDIF
                    ELSE
                        MoveL robtNext,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
                    ENDIF
                CASE 8:
                    Incr index;
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    Logging\INFO,"MoveCing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            MoveC robtNext,robtCircleEnd,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent1;
                        ELSE
                            MoveC robtNext,robtCircleEnd,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent2;
                        ENDIF
                    ELSE
                        MoveC robtNext,robtCircleEnd,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
                    ENDIF
                CASE 9:
                    Logging\INFO,"MoveJing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            MoveJ robtNext,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent1;
                        ELSE
                            MoveJ robtNext,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent2;
                        ENDIF
                    ELSE
                        MoveJ robtNext,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
                    ENDIF
                ENDTEST
            ENDIF

            jointCur:=CJointT();
            RefreshJointChangeMax index,jointPre,jointCur,jointChangeMaxTemp,jointChangeIndexMaxTemp;

            Incr index;
        ENDWHILE

        IF Present(End) THEN
            WeldEnd\IndexEnd?numIndexEnd;
        ENDIF

        IF boolMoveLSubstituted THEN
            SetDataVal "rRob"+ValToStr(numCurTaskNo)+"Layer"+ValToStr(numCurrentLayerNo),rRobLayerCur;
        ENDIF

        Logging\INFO,"The max joint change index is "+ValToStr(jointChangeIndexMaxTemp);
        Logging\INFO,"The max joint change is "+ValToStr(jointChangeMaxTemp);
    ENDPROC

    PROC WeldLayerSynchronized(\switch Start\switch End\confdata robconf)
        VAR num index;
        VAR string strSeamName;
        VAR robtarget robtCur;
        VAR robtarget robtTemp;
        VAR jointtarget jointPre;
        VAR jointtarget jointCur;
        VAR jointtarget jointChangeMaxTemp:=[[0,0,0,0,0,0],[0,0,0,0,0,0]];
        VAR jointtarget jointChangeIndexMaxTemp:=[[0,0,0,0,0,0],[0,0,0,0,0,0]];
        VAR RECORDWeldProcedure rWeldProcedureNext;
        VAR string sHeader;
        VAR string sMsg{5};
        VAR btnres nAnswer;
        VAR num numPreFlowTime;
        VAR num numPostFlowTime;
        VAR num numPurgeTime;
        VAR num numDistanceArcCalcLStart;

        RefreshCurrentLayerTargets strSeamName;
        IF boolMoveLSubstituted THEN
            numStartPoint:=UINumEntry(\Header:="Start Point Index"\Message:="Which point do you want to start to adjust?"\Icon:=iconInfo\InitValue:=numStartPoint\MinValue:=1\MaxValue:=numRobLayerCurTotal\AsInteger);
        ENDIF

        IF Present(Start) THEN
            WeldStart\SyncMove\robconf?robconf;
        ENDIF

        index:=1;
        WHILE index<=numRobLayerCurTotal DO
            jointPre:=CJointT();
            robtCur:=CRobT();
            robtNext:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
            Logging\INFO,"robtNext.trans="+ValToStr(robtNext.trans);
            Logging\INFO,"robtNext.rot="+ValToStr(robtNext.rot);

            TEST numCurTaskNo
            CASE 1:
                IF rRobLayerCur{index}.numAngle>=210 AND rRobLayerCur{index}.numAngle<=330 THEN
                    ConfL\Off;
                ELSE
                    IF boolConfOn THEN
                        ConfL\On;
                    ELSE
                        ConfL\Off;
                    ENDIF
                ENDIF
            CASE 2:
                IF rRobLayerCur{index}.numAngle>=30 AND rRobLayerCur{index}.numAngle<=150 THEN
                    ConfL\Off;
                ELSEIF rRobLayerCur{index}.numAngle>=210 AND rRobLayerCur{index}.numAngle<=330 THEN
                    ConfL\Off;
                ELSE
                    IF boolConfOn THEN
                        ConfL\On;
                    ELSE
                        ConfL\Off;
                    ENDIF
                ENDIF
            DEFAULT:
                IF boolConfOn THEN
                    ConfL\On;
                ELSE
                    ConfL\Off;
                ENDIF
            ENDTEST

            IF boolMoveLSubstituted THEN
                boolMoveLAdjustOK:=FALSE;
                WaitSyncTask SyncMoveLSubstituted1,taskListCurrent;

                WHILE NOT boolMoveLAdjustOK DO
                    robtNext:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    Logging\INFO,"Moving to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);

                    MoveL robtNext\ID:=index,speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
                    IF index>=numStartPoint THEN
                        sHeader:="Adjust seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                        sMsg{1}:="Press Yes to confirm the robtarget.";
                        sMsg{2}:="";
                        sMsg{3}:="Press No to retry once again.";
                        sMsg{4}:="";
                        sMsg{5}:="";
                        UIMsgBox\Header:=sHeader,sMsg{1}\MsgLine2:=sMsg{2}\MsgLine3:=sMsg{3}\MsgLine4:=sMsg{4}\MsgLine5:=sMsg{5}\Buttons:=btnYesNo\Icon:=iconInfo\Result:=nAnswer;
                        IF (nAnswer=resYes) THEN
                            boolMoveLAdjustOK:=TRUE;
                        ENDIF
                    ELSE
                        boolMoveLAdjustOK:=TRUE;
                    ENDIF
                    !Stop;
                    WaitSyncTask SyncMoveLSubstituted2,taskListCurrent;
                ENDWHILE
            ELSE
                TEST rRobLayerCur{index}.numProcessType
                CASE 1:
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    Logging\INFO,"ArcLStarting to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    ArcLStart robtNext\ID:=index,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackNext\SeamName:=strSeamName;
                CASE 2:
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    Logging\INFO,"ArcLing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    ArcL robtNext\ID:=index,speedWeld,seamNext,weldNext\Weave:=weaveNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackNext;
                CASE 3:
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    Logging\INFO,"ArcLEnding to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    ArcLEnd robtNext\ID:=index,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackNext;
                CASE 4:
                    Incr index;
                    robtCur:=CRobT();
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    Logging\INFO,"ArcCStarting to seam targets: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index-1)+" and "+ValToStr(index);
                    ArcCStart robtNext,robtCircleEnd\ID:=index,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackNext\SeamName:=strSeamName;
                CASE 5:
                    Incr index;
                    robtCur:=CRobT();
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    Logging\INFO,"ArcCing to seam targets: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index-1)+" and "+ValToStr(index);
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    ArcC robtNext,robtCircleEnd\ID:=index,speedWeld,seamNext,weldNext\Weave:=weaveNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackNext;
                CASE 6:
                    Incr index;
                    robtCur:=CRobT();
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    Logging\INFO,"ArcCEnding to seam targets: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index-1)+" and "+ValToStr(index);
                    ArcCEnd robtNext,robtCircleEnd\ID:=index,speedWeld,seamNext,weldNext\Weave:=weaveNext,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackNext;
                CASE 11:
                    RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    WriteWeldProcedureLog strWeldProcedureLogLogFileName,ValToStr(rPipeGrooveModel.numHeaderDiameter)+"-"+ValToStr(rPipeGrooveModel.numBranchDiameter),numCurrentLayerNo,index,rWeldProcedureNext,1;
                    !Set the standard weave width
                    adaptNext.NominalWidth:=weaveNext.weave_width;
                    numGrooveWidthNext:=GetAdaptiveGrooveWidth(rRobLayerCur{index}.numAngle,adaptNext.NominalWidth,numWeaveWidth90);
                    Logging\INFO,"ArcCalcLStarting to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    Logging\INFO,"NominalWidth="+ValToStr(adaptNext.NominalWidth)+", WeaveWidth90="+ValToStr(numWeaveWidth90)+", GrooveWidthNext="+ValToStr(numGrooveWidthNext);
                    IF rPipeGrooveModel.boolContinuous=TRUE THEN
                        !Don't use pulse signal
                        IF numCurTaskNo=1 THEN
                            SetDO soFr1ArcStable,1;
                        ELSE
                            SetDO soFr2ArcStable,1;
                        ENDIF

                        numPurgeTime:=seamNext.purge_time;
                        numPreFlowTime:=seamNext.preflow_time;
                        numPostFlowTime:=seamNext.postflow_time;

                        !Michael, 2019-1-31, Use gas flow time for cooling time between layers when boolBlocksiFr1ArcStable=false
                        IF boolBlocksiFr1ArcStable=TRUE THEN
                            seamNext.purge_time:=0;
                            seamNext.preflow_time:=0;
                            seamNext.postflow_time:=0;
                            IF numCurrentLayerNo=numLayerNoStart THEN
                                seamNext.purge_time:=numPurgeTime;
                                seamNext.preflow_time:=numPreFlowTime;
                            ELSEIF numCurrentLayerNo=rPipeGrooveModel.numMultiPassTotal THEN
                                seamNext.postflow_time:=numPostFlowTime;
                            ENDIF
                        ENDIF

                        !Michael, 2019-1-30, Add boolBlocksiFr1ArcStable
                        !IF numCurrentLayerNo>numLayerNoStart THEN
                        IF numCurrentLayerNo>numLayerNoStart And boolBlocksiFr1ArcStable=TRUE THEN
                            numDistanceArcCalcLStart:=Distance(robtCur.trans,robtNext.trans);
                            Logging\INFO,"numDistanceArcCalcLStart="+ValToStr(numDistanceArcCalcLStart)+", "+"weave_length="+ValToStr(weaveNext.weave_length);
                            Logging\INFO,"robtCur.trans="+ValToStr(robtTemp.trans);
                            Logging\INFO,"robtCur.rot="+ValToStr(robtNext.rot);

                            !Michael, 2019-2-19, Support Arc off between layers
                            IF numDistanceArcCalcLStart>numBlocksiArcStableLength THEN
                                IF numCurTaskNo=1 THEN
                                    SetDO doFr1ArcOn,0;
                                    WaitDI diFr1ArcStable,0;
                                ELSE
                                    SetDO doFr2ArcOn,0;
                                    WaitDI diFr2ArcStable,0;
                                ENDIF
                            ENDIF

                            IF numDistanceArcCalcLStart<=weaveNext.weave_length/2 OR numDistanceArcCalcLStart>numBlocksiArcStableLength THEN
                                IF numDistanceArcCalcLStart>numBlocksiArcStableLength THEN
                                    robtTemp:=robtNext;
                                    robtTemp:=Offs(robtNext,0,0-weaveNext.weave_length/2-0.5,0);
                                ELSE
                                    robtTemp:=robtCur;
                                    robtTemp.trans:=GetAnotherPointOnTheLine(robtNext.trans,robtCur.trans,weaveNext.weave_length/2+0.5);
                                ENDIF
                                Logging\INFO,"robtTemp.trans="+ValToStr(robtTemp.trans);
                                Logging\INFO,"robtTemp.rot="+ValToStr(robtNext.rot);
                                ArcCalcLStart robtTemp\ID:=index-1,speedWeld,numGrooveWidthNext,adaptNext,seamNext,weldNext,weaveNext,fine,toolWeldGun\WObj:=wobjCurrent,trackNext\SeamName:=strSeamName;
                            ELSE
                                ArcCalcLStart robtCur\ID:=index-1,speedWeld,numGrooveWidthNext,adaptNext,seamNext,weldNext,weaveNext,fine,toolWeldGun\WObj:=wobjCurrent,trackNext\SeamName:=strSeamName;
                            ENDIF
                            Logging\INFO,"Via seam target is moved";
                            !ArcCalcL robtNext\ID:=index,speedWeld,numGrooveWidthNext,adaptNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
                            ArcCalcL robtNext\ID:=index,speedWeld,numGrooveWidthNext,adaptNext,z0,toolWeldGun\WObj:=wobjCurrent;
                        ELSE
                            ArcCalcLStart robtNext\ID:=index,speedWeld,numGrooveWidthNext,adaptNext,seamNext,weldNext,weaveNext,fine,toolWeldGun\WObj:=wobjCurrent,trackNext\SeamName:=strSeamName;
                        ENDIF
                        seamNext.purge_time:=numPurgeTime;
                        seamNext.preflow_time:=numPreFlowTime;
                        seamNext.postflow_time:=numPostFlowTime;
                    ELSE
                        ArcCalcLStart robtNext\ID:=index,speedWeld,numGrooveWidthNext,adaptNext,seamNext,weldNext,weaveNext,fine,toolWeldGun\WObj:=wobjCurrent,trackNext\SeamName:=strSeamName;
                    ENDIF
                CASE 12:
                    !RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    !numGrooveWidthNext:=adaptNext.NominalWidth+(1-Abs((rRobLayerCur{index}.numAngle MOD 180)-90)/90)*(numWeaveWidth90-adaptNext.NominalWidth);
                    numGrooveWidthNext:=GetAdaptiveGrooveWidth(rRobLayerCur{index}.numAngle,adaptNext.NominalWidth,numWeaveWidth90);
                    Logging\INFO,"ArcCalcLing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    Logging\INFO,"numGrooveWidthNext="+ValToStr(numGrooveWidthNext);
                    ArcCalcL robtNext\ID:=index,speedWeld,numGrooveWidthNext,adaptNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
                CASE 13:
                    !RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    !numGrooveWidthNext:=adaptNext.NominalWidth+(1-Abs((rRobLayerCur{index}.numAngle MOD 180)-90)/90)*(numWeaveWidth90-adaptNext.NominalWidth);
                    numGrooveWidthNext:=GetAdaptiveGrooveWidth(rRobLayerCur{index}.numAngle,adaptNext.NominalWidth,numWeaveWidth90);
                    Logging\INFO,"ArcCalcLEnding to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    Logging\INFO,"numGrooveWidthNext="+ValToStr(numGrooveWidthNext);

                    !Eliminate the arc break between ArcCalcLEnd and ArcCalcLStart instructions
                    IF rPipeGrooveModel.boolContinuous=TRUE AND numCurrentLayerNo<rPipeGrooveModel.numMultiPassTotal THEN
                        IDelete intnumArcCalcIntercept;
                        CONNECT intnumArcCalcIntercept WITH TrapArcCalcContinuous;
                        IF numCurTaskNo=1 THEN
                            !Michael, 2019-1-30, Add Single
                            ISignalDO\Single,doFr1ArcOn,low,intnumArcCalcIntercept;
                        ELSE
                            ISignalDO\Single,doFr2ArcOn,low,intnumArcCalcIntercept;
                        ENDIF
                    ENDIF

                    ArcCalcLEnd robtNext\ID:=index,speedWeld,numGrooveWidthNext,adaptNext,fine,toolWeldGun\WObj:=wobjCurrent;
                CASE 15:
                    Incr index;
                    robtCur:=CRobT();
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    Logging\INFO,"robtCircleEnd.trans="+ValToStr(robtCircleEnd.trans);
                    Logging\INFO,"robtCircleEnd.rot="+ValToStr(robtCircleEnd.rot);
                    !RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    !numGrooveWidthNext:=adaptNext.NominalWidth+(1-Abs((rRobLayerCur{index}.numAngle MOD 180)-90)/90)*(numWeaveWidth90-adaptNext.NominalWidth);
                    numGrooveWidthNext:=GetAdaptiveGrooveWidth(rRobLayerCur{index}.numAngle,adaptNext.NominalWidth,numWeaveWidth90);
                    Logging\INFO,"ArcCalcCing to seam targets: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index-1)+" and "+ValToStr(index);
                    Logging\INFO,"numGrooveWidthNext="+ValToStr(numGrooveWidthNext);
                    ArcCalcC robtNext,robtCircleEnd\ID:=index,speedWeld,numGrooveWidthNext,adaptNext,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
                CASE 16:
                    Incr index;
                    robtCur:=CRobT();
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    Logging\INFO,"robtCircleEnd.trans="+ValToStr(robtCircleEnd.trans);
                    Logging\INFO,"robtCircleEnd.rot="+ValToStr(robtCircleEnd.rot);
                    !RefreshWeldingParameters rRobLayerCur{index}.strWeldProcedureID,\rWeldProcedureReturn:=rWeldProcedureNext;
                    !numGrooveWidthNext:=adaptNext.NominalWidth+(1-Abs((rRobLayerCur{index}.numAngle MOD 180)-90)/90)*(numWeaveWidth90-adaptNext.NominalWidth);
                    numGrooveWidthNext:=GetAdaptiveGrooveWidth(rRobLayerCur{index}.numAngle,adaptNext.NominalWidth,numWeaveWidth90);
                    Logging\INFO,"ArcCalcCEnding to seam targets: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index-1)+" and "+ValToStr(index);
                    Logging\INFO,"numGrooveWidthNext="+ValToStr(numGrooveWidthNext);

                    !Eliminate the arc break between ArcCalcCEnd and ArcCalcLStart instructions
                    IF rPipeGrooveModel.boolContinuous=TRUE AND numCurrentLayerNo<rPipeGrooveModel.numMultiPassTotal THEN
                        IDelete intnumArcCalcIntercept;
                        CONNECT intnumArcCalcIntercept WITH TrapArcCalcContinuous;
                        IF numCurTaskNo=1 THEN
                            ISignalDO\Single,doFr1ArcOn,low,intnumArcCalcIntercept;
                        ELSE
                            ISignalDO\Single,doFr2ArcOn,low,intnumArcCalcIntercept;
                        ENDIF
                    ENDIF

                    ArcCalcCEnd robtNext,robtCircleEnd\ID:=index,speedWeld,numGrooveWidthNext,adaptNext,fine,toolWeldGun\WObj:=wobjCurrent;

                CASE 7:
                    Logging\INFO,"MoveLing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            MoveL robtNext\ID:=index,speedWeld,fine,toolWeldGun\WObj:=wobjCurrent1;
                        ELSE
                            MoveL robtNext\ID:=index,speedWeld,fine,toolWeldGun\WObj:=wobjCurrent2;
                        ENDIF
                    ELSE
                        MoveL robtNext,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
                    ENDIF
                CASE 8:
                    Incr index;
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue:=robtCur.robconf\extjointValue:=extjointValue);
                    Logging\INFO,"MoveCing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            MoveC robtNext,robtCircleEnd\ID:=index,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent1;
                        ELSE
                            MoveC robtNext,robtCircleEnd\ID:=index,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent2;
                        ENDIF
                    ELSE
                        MoveC robtNext,robtCircleEnd\ID:=index,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
                    ENDIF
                CASE 9:
                    Logging\INFO,"MoveJing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    IF boolUseRespectiveWobj THEN
                        IF numCurTaskNo=1 THEN
                            MoveJ robtNext\ID:=index,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent1;
                        ELSE
                            MoveJ robtNext\ID:=index,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent2;
                        ENDIF
                    ELSE
                        MoveJ robtNext\ID:=index,speedWeld,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
                    ENDIF
                ENDTEST
            ENDIF

            jointCur:=CJointT();
            RefreshJointChangeMax index,jointPre,jointCur,jointChangeMaxTemp,jointChangeIndexMaxTemp;

            Incr index;
        ENDWHILE

        IF Present(End) THEN
            WeldEnd\SyncMove;
        ENDIF

        IF boolMoveLSubstituted THEN
            SetDataVal "rRob"+ValToStr(numCurTaskNo)+"Layer"+ValToStr(numCurrentLayerNo),rRobLayerCur;
            !rRob1Layer1_g:=rRobLayerCur;
        ENDIF

        Logging\INFO,"The max joint change index is "+ValToStr(jointChangeIndexMaxTemp);
        Logging\INFO,"The max joint change is "+ValToStr(jointChangeMaxTemp);

    UNDO
        IF numCurTaskNo=1 THEN
            SetDO soFr1ArcStable,1;
        ELSE
            SetDO soFr2ArcStable,1;
        ENDIF
    ENDPROC

    TRAP TrapArcCalcContinuous
        IF numCurTaskNo=1 THEN
            IF boolBlocksiFr1ArcStable THEN
                SetDO doFr1ArcOn,1;
                !Use pulse signal
                !PulseDO\PLength:=numArcCalcIntercept,soFr1ArcStable;

                !Don't use pulse signal
                SetDO soFr1ArcStable,0;
            ENDIF
            !Due to ISignalDO\Single, there is no need for IDelete
            !IDelete intnumArcCalcIntercept;
        ELSE
            IF boolBlocksiFr1ArcStable THEN
                SetDO doFr2ArcOn,1;
                !PulseDO\PLength:=numArcCalcIntercept,soFr2ArcStable;
                SetDO soFr2ArcStable,0;
            ENDIF
            !Due to ISignalDO\Single, there is no need for IDelete
            !IDelete intnumArcCalcIntercept;
        ENDIF
    ENDTRAP

    PROC RefreshCurrentLayerTargets(INOUT string strSeamName\num DataTaskNo\switch ReverseWeldDirection)
        VAR string strPostfix;
        VAR num numDataTaskNo;
        VAR num numRobTargetsTotal{100};
        VAR RECORDWeldTarget rRobLayerTemp{100};
        IF Present(DataTaskNo) THEN
            numDataTaskNo:=DataTaskNo;
        ELSE
            numDataTaskNo:=numCurTaskNo;
        ENDIF
        Logging\INFO,"TaskName="+strCurTaskName+", TaskNo="+ValToStr(numCurTaskNo);

        IF rPipeGrooveModel.numPathSource=1 THEN
            GetDataVal "rRob"+ValToStr(numDataTaskNo)+"Layer"+ValToStr(numCurrentLayerNo),rRobLayerCur;
            !GetDataVal "numRob"+ValToStr(numDataTaskNo)+"Layer"+ValToStr(numCurrentLayerNo)+"Total",numRobLayerCurTotal;
            GetDataVal "numRob"+ValToStr(numDataTaskNo)+"TargetsTotal",numRobTargetsTotal;
            numRobLayerCurTotal:=numRobTargetsTotal{numCurrentLayerNo};
        ELSEIF rPipeGrooveModel.numPathSource=3 THEN
            GetDataVal "strPostfix"+"_"+ValToStr(rPipeGrooveModel.numPipeGrooveType)+"_"+ValToStr(Trunc(rPipeGrooveModel.numHeaderDiameter*10))+"_"+ValToStr(Trunc(rPipeGrooveModel.numHeaderThickness*10))+"_"+ValToStr(Trunc(rPipeGrooveModel.numBranchDiameter*10))+"_"+ValToStr(Trunc(rPipeGrooveModel.numBranchThickness*10)),strPostfix;
            GetDataVal "rRob"+ValToStr(numDataTaskNo)+"Layer"+ValToStr(numCurrentLayerNo)+strPostfix,rRobLayerCur;
            !GetDataVal "numRob"+ValToStr(numDataTaskNo)+"Layer"+ValToStr(numCurrentLayerNo)+"Total"+strPostfix,numRobLayerCurTotal;
            GetDataVal "numRob"+ValToStr(numDataTaskNo)+"TargetsTotal"+strPostfix,numRobTargetsTotal;
            numRobLayerCurTotal:=numRobTargetsTotal{numCurrentLayerNo};
        ELSE
        ENDIF

        !obsoleted by Michael at 2019-1-4
        !        IF Present(ReverseWeldDirection) THEN
        !            FOR i FROM 1 TO numRobLayerCurTotal DO
        !                rRobLayerTemp{i}:=rRobLayerCur{numRobLayerCurTotal-i+1};
        !                rRobLayerTemp{i}.numProcessType:=rRobLayerCur{i}.numProcessType;
        !                rRobLayerTemp{i}.strWeldProcedureID:=rRobLayerCur{i}.strWeldProcedureID;
        !            ENDFOR
        !            rRobLayerCur:=rRobLayerTemp;
        !        ENDIF

        strSeamName:="Seam_"+ValToStr(rPipeGrooveModel.numPipeGrooveType)+"_"+ValToStr(numCurTaskNo)+"_"+ValToStr(numCurrentLayerNo);

    ENDPROC

    PROC WeldStart(\switch SyncMove\num IndexStart\confdata robconf\switch ForPos)
        VAR robtarget robtCur;
        VAR num numIndexStart;

        IF Present(IndexStart) THEN
            numIndexStart:=IndexStart;
        ELSE
            numIndexStart:=1;
        ENDIF

        IF Present(ForPos) THEN
            IF NOT IsMechUnitActive(STN1) THEN
                ActUnit STN1;
            ENDIF
            IF Present(SyncMove) THEN
                jointNext.extax:=GetAlignedJointtarget(rRobLayerCur,1,rPipeGrooveModel.boolUseAlignedSTNbyFixedValue);
            ELSE
                jointNext.extax.eax_b:=rPipeGrooveModel.numSeamNormalAngle;
            ENDIF
            MoveExtJ jointNext,speedAir,fine;
        ENDIF

        IF NOT Present(ForPos) THEN
            robtCur:=CRobT();
            IF Present(robconf) THEN
                robtCur.robconf:=robconf;
            ENDIF
            robtNext:=GetRobtarget(rRobLayerCur,numIndexStart\confValue:=robtCur.robconf\extjointValue:=extjointValue);

            IF Present(SyncMove) THEN
                MoveJ RelTool(robtNext,0,0,numWeldApproachOffsetZ),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
            ELSE
                IF numCurTaskNo=1 THEN
                    MoveJ RelTool(Offs(robtNext,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),0,0,numWeldApproachOffsetZ),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
                ELSE
                    MoveJ RelTool(Offs(robtNext,0,rPipeGrooveModel.numHeaderDiameter/2,0),0,0,numWeldApproachOffsetZ),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
                ENDIF
            ENDIF
            robtCur:=CRobT();
            Logging\INFO,"The conf of first point is "+ValToStr(robtCur.robconf);
        ENDIF

        WaitSyncTask SyncPositionerWeldApproached,taskListCurrent;

        IF Present(SyncMove) THEN
            SyncMoveOn SyncAllRobotsWeldStart,taskListCurrent;
        ENDIF

    ENDPROC

    PROC WeldEnd(\switch SyncMove\num IndexEnd\switch ForPos)
        VAR robtarget robtCur;
        VAR num numIndexEnd;
        IF Present(IndexEnd) THEN
            numIndexEnd:=IndexEnd;
        ELSE
            numIndexEnd:=numRobLayerCurTotal;
        ENDIF

        IF Present(SyncMove) THEN
            SyncMoveOff SyncAllRobotsWeldEnd;
            WaitRob\InPos;
        ENDIF

        IF NOT Present(ForPos) THEN
            robtCur:=CRobT();
            robtNext:=GetRobtarget(rRobLayerCur,numIndexEnd\confValue:=robtCur.robconf\extjointValue:=extjointValue);

            IF Present(SyncMove) THEN
                MoveL RelTool(robtNext,0,0,numWeldApproachOffsetZ),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
            ELSE
                IF numCurTaskNo=1 THEN
                    MoveL RelTool(Offs(robtNext,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),0,0,numWeldApproachOffsetZ),speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
                ELSE
                    MoveL RelTool(Offs(robtNext,0,rPipeGrooveModel.numHeaderDiameter/2,0),0,0,numWeldApproachOffsetZ),speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
                ENDIF
            ENDIF
        ENDIF

        WaitSyncTask SyncRobotsWeldDeparted,taskListCurrent;

    ENDPROC


    PROC WeldLayerIndependentForPOS(\switch Start\switch End\num numIndexStart\num numIndexEnd)
        IF Present(Start) THEN
            WeldStart\ForPos;
        ENDIF
        IF Present(End) THEN
            WeldEnd\ForPos;
        ENDIF

    ENDPROC

    PROC WeldLayerSynchForPOS(\switch Start\switch End)
        VAR num index;
        VAR string strSeamName;

        IF rPipeGrooveModel.numCooperativeRobots=5 THEN
            RefreshCurrentLayerTargets strSeamName\DataTaskNo:=1;
        ELSEIF rPipeGrooveModel.numCooperativeRobots=6 THEN
            RefreshCurrentLayerTargets strSeamName\DataTaskNo:=2;
        ENDIF

        IF Present(Start) THEN
            WeldStart\SyncMove\ForPos;
        ENDIF

        index:=1;
        WHILE index<=numRobLayerCurTotal DO
            jointNext.extax:=GetAlignedJointtarget(rRobLayerCur,index,rPipeGrooveModel.boolUseAlignedSTNbyFixedValue);

            IF boolMoveLSubstituted THEN
                WaitSyncTask SyncMoveLSubstituted1,taskListCurrent;
                jointAlignedTargets{index}.extax:=jointNext.extax;

                WHILE NOT boolMoveLAdjustOK DO
                    IF rPipeGrooveModel.numCooperativeRobots=5 THEN
                        RefreshCurrentLayerTargets strSeamName\DataTaskNo:=1;
                    ELSEIF rPipeGrooveModel.numCooperativeRobots=6 THEN
                        RefreshCurrentLayerTargets strSeamName\DataTaskNo:=2;
                    ENDIF

                    jointNext.extax:=GetAlignedJointtarget(rRobLayerCur,index,rPipeGrooveModel.boolUseAlignedSTNbyFixedValue);
                    Logging\INFO,"Moving to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    MoveExtJ jointNext\ID:=index,speedWeld,fine;
                    Logging\INFO,"STN1 eax_b:"+ValToStr(jointNext.extax.eax_b);

                    !Stop;
                    WaitSyncTask SyncMoveLSubstituted2,taskListCurrent;
                ENDWHILE
            ELSE
                TEST rRobLayerCur{index}.numProcessType
                CASE 1:
                    Logging\INFO,"ArcMoveExtJing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    ArcMoveExtJ jointNext\ID:=index,speedWeld,fine\Start;
                CASE 11:
                    Logging\INFO,"ArcMoveExtJing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    IF rPipeGrooveModel.boolContinuous=TRUE AND numCurrentLayerNo>numLayerNoStart And boolBlocksiFr1ArcStable=TRUE THEN
                        ArcMoveExtJ jointNext\ID:=index-1,speedWeld,fine\Start;
                        Logging\INFO,"Via seam target is moved";
                        ArcMoveExtJ jointNext\ID:=index,speedWeld,z0;
                    ELSE
                        ArcMoveExtJ jointNext\ID:=index,speedWeld,fine\Start;
                    ENDIF
                CASE 2,12:
                    Logging\INFO,"ArcMoveExtJing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    ArcMoveExtJ jointNext\ID:=index,speedWeld,zoneWeld;
                CASE 3,13:
                    Logging\INFO,"ArcMoveExtJing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    ArcMoveExtJ jointNext\ID:=index,speedWeld,fine;
                CASE 4:
                    Incr index;
                    jointNext.extax:=GetAlignedJointtarget(rRobLayerCur,index,rPipeGrooveModel.boolUseAlignedSTNbyFixedValue);
                    Logging\INFO,"ArcMoveExtJing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    ArcMoveExtJ jointNext\ID:=index,speedWeld,fine;
                CASE 5,15:
                    Incr index;
                    jointNext.extax:=GetAlignedJointtarget(rRobLayerCur,index,rPipeGrooveModel.boolUseAlignedSTNbyFixedValue);
                    Logging\INFO,"ArcMoveExtJing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    ArcMoveExtJ jointNext\ID:=index,speedWeld,zoneWeld;
                CASE 6,16:
                    Incr index;
                    jointNext.extax:=GetAlignedJointtarget(rRobLayerCur,index,rPipeGrooveModel.boolUseAlignedSTNbyFixedValue);
                    Logging\INFO,"ArcMoveExtJing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    ArcMoveExtJ jointNext\ID:=index,speedWeld,fine;
                CASE 7,9:
                    Logging\INFO,"MoveExtJing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    MoveExtJ jointNext\ID:=index,speedWeld,zoneWeld;
                CASE 8:
                    Incr index;
                    jointNext.extax:=GetAlignedJointtarget(rRobLayerCur,index,rPipeGrooveModel.boolUseAlignedSTNbyFixedValue);
                    Logging\INFO,"MoveExtJing to seam target: "+ValToStr(numCurrentLayerNo)+" - "+ValToStr(index);
                    MoveExtJ jointNext\ID:=index,speedWeld,zoneWeld;
                ENDTEST
            ENDIF

            Incr index;
        ENDWHILE

        IF Present(End) THEN
            WeldEnd\SyncMove\ForPos;
        ENDIF

    ENDPROC

    !For Rob1, ScanAngle: 210~330, rotate Axis Z, Axis X is degree 0
    !For Rob2, ScanAngle: 30~150, rotate Axis Z, Axis X is degree 0
    PROC InitScanBranchTargets(num numScanAngleFrom,num numScanAngleTo,INOUT num numScanPointsTotal,INOUT robtarget robtScanPoints{*}\switch Rob1|switch Rob2\switch Laser|switch Wire)
        VAR num numAngleUnit;
        VAR num numTheta;

        numScanPointsTotal:=Trunc(numScanPointsTotal);
        IF numScanPointsTotal MOD 2=0 THEN
            Decr numScanPointsTotal;
        ENDIF
        IF numScanPointsTotal<3 THEN
            numScanPointsTotal:=3;
        ENDIF
        numAngleUnit:=(numScanAngleTo-numScanAngleFrom)/(numScanPointsTotal-1);

        FOR i FROM 1 TO numScanPointsTotal DO
            numTheta:=numScanAngleFrom+numAngleUnit*(i-1);
            !            IF i=9 THEN
            !                !Avoid singular points
            !                numTheta:=numTheta+5;
            !            ENDIF
            !robtScanPoints{i}:=robtScanPoints{1};
            robtScanPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Cos(numTheta);
            robtScanPoints{i}.trans.y:=rPipeGrooveModel.numBranchDiameter/2*Sin(numTheta);
            robtScanPoints{i}.trans.z:=rPipeGrooveModel.numHeaderDiameter/2+numSSBDeviation;

            IF Present(Wire) THEN
                IF Present(Rob1) THEN
                    robtScanPoints{i}.rot:=OrientZYX(0,-90,-90-(270-numTheta));
                ELSE
                    IF numTheta<=90 THEN
                        robtScanPoints{i}.rot:=OrientZYX(0,-90,numTheta);
                    ELSE
                        robtScanPoints{i}.rot:=OrientZYX(0,90,90-(numTheta-90)/3);
                    ENDIF
                ENDIF
            ELSE
                !********************************
                !For standard laser scan posture
                IF Present(Rob1) THEN
                    IF numTheta<=270 THEN
                        robtScanPoints{i}.rot:=OrientZYX(0,-90,-90-(270-numTheta)/3);
                    ELSE
                        robtScanPoints{i}.rot:=OrientZYX(0,90,-90-(numTheta-270));
                    ENDIF
                ELSE
                    IF numTheta<=90 THEN
                        robtScanPoints{i}.rot:=OrientZYX(0,-90,numTheta);
                    ELSE
                        robtScanPoints{i}.rot:=OrientZYX(0,90,90-(numTheta-90)/3);
                    ENDIF
                ENDIF
                !********************************
                !For used laser scan posture
                IF Present(Rob1) THEN
                    robtScanPoints{i}.rot:=OrientZYX(numTheta-90,0,90);
                ELSE
                    robtScanPoints{i}.rot:=OrientZYX(numTheta-90,0,90);
                ENDIF
                !********************************
            ENDIF

            robtScanPoints{i}.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        ENDFOR
    ENDPROC

    !For Rob1, ScanAngle: 180~90, rotate Axis X, Axis Y is degree 0
    !For Rob2, ScanAngle: 0~90, rotate Axis X, Axis Y is degree 0
    PROC InitScanHeaderTargets(num numScanAngleFrom,num numScanAngleTo,INOUT num numScanPointsTotal,INOUT robtarget robtScanPoints{*}\switch Rob1|switch Rob2\switch Laser|switch Wire\num numRealGrooveX)
        VAR num numAngleUnit;
        VAR num numTheta;

        numScanPointsTotal:=Trunc(numScanPointsTotal);
        IF numScanPointsTotal MOD 2=0 THEN
            Decr numScanPointsTotal;
        ENDIF
        IF numScanPointsTotal<3 THEN
            numScanPointsTotal:=3;
        ENDIF
        numAngleUnit:=(numScanAngleTo-numScanAngleFrom)/(numScanPointsTotal-1);

        FOR i FROM 1 TO numScanPointsTotal DO
            numTheta:=numScanAngleFrom+numAngleUnit*(i-1);
            robtScanPoints{i}.trans.y:=rPipeGrooveModel.numHeaderDiameter/2*Cos(numTheta);
            robtScanPoints{i}.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(numTheta);

            IF Present(Wire) THEN
                IF Present(Rob1) THEN
                    IF Present(numRealGrooveX) THEN
                        robtScanPoints{i}.trans.x:=numRealGrooveX+rPipeGrooveModel.numBranchDiameter/2+numSSHDeviation;
                    ELSE
                        robtScanPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSSHDeviation;
                    ENDIF
                    IF numTheta>=135 THEN
                        robtScanPoints{i}.rot:=OrientZYX(-90,numTheta-270,0);
                    ELSE
                        robtScanPoints{i}.rot:=OrientZYX(90,0-numTheta-90,0);
                    EndIF

                ELSE
                    IF Present(numRealGrooveX) THEN
                        !robtScanPoints{i}.trans.x:=numRealGrooveX-rPipeGrooveModel.numBranchDiameter/2-numSSHDeviation;
                        robtScanPoints{i}.trans.x:=numRealGrooveX+rPipeGrooveModel.numBranchDiameter/2+numSSHDeviation;
                    ELSE
                        !robtScanPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX-rPipeGrooveModel.numBranchDiameter/2-numSSHDeviation;
                        robtScanPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSSHDeviation;
                    ENDIF
                    robtScanPoints{i}.rot:=OrientZYX(180,0,-90-numTheta);
                ENDIF
            ELSE
                IF Present(Rob1) THEN
                    IF Present(numRealGrooveX) THEN
                        robtScanPoints{i}.trans.x:=numRealGrooveX+rPipeGrooveModel.numBranchDiameter/2+numSSHDeviation;
                    ELSE
                        robtScanPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSSHDeviation;
                    ENDIF
                    robtScanPoints{i}.rot:=OrientZYX(0,0,numTheta-270);
                ELSE
                    IF Present(numRealGrooveX) THEN
                        !robtScanPoints{i}.trans.x:=numRealGrooveX-rPipeGrooveModel.numBranchDiameter/2-numSSHDeviation;
                        robtScanPoints{i}.trans.x:=numRealGrooveX+rPipeGrooveModel.numBranchDiameter/2+numSSHDeviation;
                    ELSE
                        !robtScanPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX-rPipeGrooveModel.numBranchDiameter/2-numSSHDeviation;
                        robtScanPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSSHDeviation;
                    ENDIF
                    robtScanPoints{i}.rot:=OrientZYX(180,0,-90-numTheta);
                ENDIF
            ENDIF

            robtScanPoints{i}.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;

        ENDFOR
    ENDPROC

    !For Rob1, ScanAngle: 210~330, rotate Axis Z, Axis X is degree 0
    !For Rob2, ScanAngle: 30~150, rotate Axis Z, Axis X is degree 0
    PROC InitSPBTargets(num numScanAngleFrom,num numScanAngleTo,INOUT num numScanPointsTotal,INOUT robtarget robtScanPoints{*}\switch Rob1|switch Rob2\switch Laser|switch Wire)
        VAR num numAngleUnit;
        VAR num numTheta;

        numScanPointsTotal:=Trunc(numScanPointsTotal);
        IF numScanPointsTotal MOD 2=0 THEN
            Decr numScanPointsTotal;
        ENDIF
        IF numScanPointsTotal<3 THEN
            numScanPointsTotal:=3;
        ENDIF
        numAngleUnit:=(numScanAngleTo-numScanAngleFrom)/(numScanPointsTotal-1);

        FOR i FROM 1 TO numScanPointsTotal DO
            numTheta:=numScanAngleFrom+numAngleUnit*(i-1);
            !            IF i=9 THEN
            !                !Avoid singular points
            !                numTheta:=numTheta+5;
            !            ENDIF
            !robtScanPoints{i}:=robtScanPoints{1};
            robtScanPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Cos(numTheta);
            robtScanPoints{i}.trans.y:=rPipeGrooveModel.numBranchDiameter/2*Sin(numTheta);
            robtScanPoints{i}.trans.z:=rPipeGrooveModel.numHeaderDiameter/2+numSPBDeviation;

            IF Present(Wire) THEN
                IF Present(Rob1) THEN
                    robtScanPoints{i}.rot:=OrientZYX(0,-90,-90-(270-numTheta));
                ELSE
                    IF numTheta<=90 THEN
                        robtScanPoints{i}.rot:=OrientZYX(0,-90,numTheta);
                    ELSE
                        robtScanPoints{i}.rot:=OrientZYX(0,90,90-(numTheta-90)/3);
                    ENDIF
                ENDIF
            ELSE
                !For used laser scan posture
                IF Present(Rob1) THEN
                    IF numTheta>=270 THEN
                        robtScanPoints{i}.rot:=OrientZYX(numTheta-90,0,90);
                    ELSE
                        robtScanPoints{i}.rot:=OrientZYX(numTheta+90,0,-90);
                    ENDIF
                ELSE
                    IF numTheta>=90 THEN
                        robtScanPoints{i}.rot:=OrientZYX(numTheta-90,0,90);
                    ELSE
                        robtScanPoints{i}.rot:=OrientZYX(numTheta+90,0,-90);
                    ENDIF
                ENDIF
                !********************************
            ENDIF

            robtScanPoints{i}.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        ENDFOR
    ENDPROC

    !For Rob1, ScanAngle: 180~90, rotate Axis X, Axis Y is degree 0
    !For Rob2, ScanAngle: 0~90, rotate Axis X, Axis Y is degree 0
    PROC InitSPHTargets(num numScanAngleFrom,num numScanAngleTo,INOUT num numScanPointsTotal,INOUT robtarget robtScanPoints{*}\switch Rob1|switch Rob2\switch Laser|switch Wire\num numRealGrooveX)
        VAR num numAngleUnit;
        VAR num numTheta;

        numScanPointsTotal:=Trunc(numScanPointsTotal);
        IF numScanPointsTotal MOD 2=0 THEN
            Decr numScanPointsTotal;
        ENDIF
        IF numScanPointsTotal<3 THEN
            numScanPointsTotal:=3;
        ENDIF
        numAngleUnit:=(numScanAngleTo-numScanAngleFrom)/(numScanPointsTotal-1);

        FOR i FROM 1 TO numScanPointsTotal DO
            numTheta:=numScanAngleFrom+numAngleUnit*(i-1);
            robtScanPoints{i}.trans.y:=rPipeGrooveModel.numHeaderDiameter/2*Cos(numTheta);
            robtScanPoints{i}.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(numTheta);

            IF Present(Wire) THEN
                IF Present(Rob1) THEN
                    IF Present(numRealGrooveX) THEN
                        robtScanPoints{i}.trans.x:=numRealGrooveX+rPipeGrooveModel.numBranchDiameter/2+numSPHDeviation;
                    ELSE
                        robtScanPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSPHDeviation;
                    ENDIF
                    IF numTheta>=135 THEN
                        robtScanPoints{i}.rot:=OrientZYX(-90,numTheta-270,0);
                    ELSE
                        robtScanPoints{i}.rot:=OrientZYX(90,0-numTheta-90,0);
                    EndIF

                ELSE
                    IF Present(numRealGrooveX) THEN
                        robtScanPoints{i}.trans.x:=numRealGrooveX-rPipeGrooveModel.numBranchDiameter/2-numSPHDeviation;
                    ELSE
                        robtScanPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX-rPipeGrooveModel.numBranchDiameter/2-numSPHDeviation;
                    ENDIF
                    robtScanPoints{i}.rot:=OrientZYX(180,0,-90-numTheta);
                ENDIF
            ELSE
                IF Present(Rob1) THEN
                    IF Present(numRealGrooveX) THEN
                        robtScanPoints{i}.trans.x:=numRealGrooveX-rPipeGrooveModel.numBranchDiameter/2-numSPHDeviation-95;
                    ELSE
                        !robtScanPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX-rPipeGrooveModel.numBranchDiameter/2-numSPHDeviation-95;
                        robtScanPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSPHDeviation;
                    ENDIF
                    robtScanPoints{i}.rot:=OrientZYX(90,270-numTheta,0);
                ELSE
                    IF Present(numRealGrooveX) THEN
                        robtScanPoints{i}.trans.x:=numRealGrooveX+rPipeGrooveModel.numBranchDiameter/2+numSPHDeviation;
                    ELSE
                        robtScanPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSPHDeviation;
                    ENDIF
                    robtScanPoints{i}.rot:=OrientZYX(-90,90+numTheta,0);
                ENDIF
            ENDIF

            robtScanPoints{i}.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;

        ENDFOR
    ENDPROC

    PROC SaveModule()
        TEST numCurTaskNo
        CASE 1:
            Save "GlobalDataModule"\FilePath:="HOME:/Rapids/T_ROB1/GlobalDataModule.mod";
            Save "GeneralModule"\FilePath:="HOME:/Rapids/T_ROB1/GeneralModule.mod";
            Save "ScanModule"\FilePath:="HOME:/Rapids/T_ROB1/ScanModule.mod";
            Save "ScanPipeModule"\FilePath:="HOME:/Rapids/T_ROB1/ScanPipeModule.mod";
            Save "ScanV2Module"\FilePath:="HOME:/Rapids/T_ROB1/ScanV2Module.mod";
            Save "SharedModule"\FilePath:="HOME:/Rapids/T_ROB1/SharedModule.mod";

            Save "CalibDataModule"\FilePath:="HOME:/Rapids/T_ROB1/CalibDataModule.mod";
            Save "ErrorHandlingModule"\FilePath:="HOME:/Rapids/T_ROB1/ErrorHandlingModule.mod";
            Save "MainModule"\FilePath:="HOME:/Rapids/T_ROB1/MainModule.mod";
            Save "ServiceModule"\FilePath:="HOME:/Rapids/T_ROB1/ServiceModule.mod";
            Save "TaskModule"\FilePath:="HOME:/Rapids/T_ROB1/TaskModule.mod";
            Save "TestModule"\FilePath:="HOME:/Rapids/T_ROB1/TestModule.mod";
            Save "WeldSyncModule"\FilePath:="HOME:/Rapids/T_ROB1/WeldSyncModule.mod";
            Save "WorldZoneModule"\FilePath:="HOME:/Rapids/T_ROB1/WorldZoneModule.mod";

            Save "SmarTacTestModule"\FilePath:="HOME:/Rapids/T_ROB1/SmarTacTestModule.mod";
            Save "WeldTestModule"\FilePath:="HOME:/Rapids/T_ROB1/WeldTestModule.mod";

            Save "BE_User"\FilePath:="HOME:/Rapids/T_ROB1/BE_User.sys";
            Save "BE_User"\FilePath:="HOME:/ApplSys/ROB1/BE_User.sys";

            Save "Module_1_2163_230_762_45"\FilePath:="HOME:/Rapids/T_ROB1/Module_1_2163_230_762_45.mod";
            Save "Module_1_2674_214_762_70"\FilePath:="HOME:/Rapids/T_ROB1/Module_1_2674_214_762_70.mod";
            Save "Module_3_2163_182_1143_111"\FilePath:="HOME:/Rapids/T_ROB1/Module_3_2163_182_1143_111.mod";
            Save "Module_3_2163_183_1143_111"\FilePath:="HOME:/Rapids/T_ROB1/Module_3_2163_183_1143_111.mod";
            Save "Module_3_3185_254_3185_254"\FilePath:="HOME:/Rapids/T_ROB1/Module_3_3185_254_3185_254.mod";

        CASE 2:
            Save "CalibDataModule"\FilePath:="HOME:/Rapids/T_ROB2/CalibDataModule.mod";
            Save "ErrorHandlingModule"\FilePath:="HOME:/Rapids/T_ROB2/ErrorHandlingModule.mod";
            Save "MainModule"\FilePath:="HOME:/Rapids/T_ROB2/MainModule.mod";
            Save "ServiceModule"\FilePath:="HOME:/Rapids/T_ROB2/ServiceModule.mod";
            Save "TaskModule"\FilePath:="HOME:/Rapids/T_ROB2/TaskModule.mod";
            Save "TestModule"\FilePath:="HOME:/Rapids/T_ROB2/TestModule.mod";
            Save "WeldSyncModule"\FilePath:="HOME:/Rapids/T_ROB2/WeldSyncModule.mod";
            Save "WorldZoneModule"\FilePath:="HOME:/Rapids/T_ROB2/WorldZoneModule.mod";

            Save "SmarTacTestModule"\FilePath:="HOME:/Rapids/T_ROB2/SmarTacTestModule.mod";
            Save "WeldTestModule"\FilePath:="HOME:/Rapids/T_ROB2/WeldTestModule.mod";

            Save "BE_User"\FilePath:="HOME:/Rapids/T_ROB2/BE_User.sys";
            Save "BE_User"\FilePath:="HOME:/ApplSys/ROB2/BE_User.sys";

        CASE 3:
            Save "CalibDataModule"\FilePath:="HOME:/Rapids/T_POS1/CalibDataModule.mod";
            Save "MainModule"\FilePath:="HOME:/Rapids/T_POS1/MainModule.mod";
            Save "TaskModule"\FilePath:="HOME:/Rapids/T_POS1/TaskModule.mod";
            Save "WeldSyncModule"\FilePath:="HOME:/Rapids/T_POS1/WeldSyncModule.mod";
            Save "WorldZoneModule"\FilePath:="HOME:/Rapids/T_POS1/WorldZoneModule.mod";
        ENDTEST
    ENDPROC

    PROC WriteWeldProcedureLog(string strLogFileName,string strTestNo,num nunLayerNo,num numTargetIndex,RECORDWeldProcedure rWeldProcedure,num numWeldResult)
        VAR iodev iodevWeldTestLog;
        VAR string strTab:=",";
        VAR string strTPWriteHeader;
        VAR string strTPWrite;

        IF IsFile(strLogFileName\RegFile) THEN
        ENDIF
        Close iodevWeldTestLog;
        Open "HOME:"\File:=strLogFileName,iodevWeldTestLog\Append;
        Write iodevWeldTestLog,CDate()+" "+CTime()\NoNewLine;
        Write iodevWeldTestLog,strTab+strTestNo+strTab+ValToStr(nunLayerNo)+strTab+ValToStr(numTargetIndex)+strTab+ValToStr(rWeldProcedure.numWeldSpeed)+strTab+ValToStr(rWeldProcedure.numSche)+strTab+ValToStr(rWeldProcedure.numTrackCurrent)\NoNewLine;
        Write iodevWeldTestLog,strTab+ValToStr(rWeldProcedure.numWeaveShape)+strTab+ValToStr(rWeldProcedure.numWeaveLength)+strTab+ValToStr(rWeldProcedure.numWeaveWidth)+strTab+ValToStr(rWeldProcedure.numWeaveHeigth)+strTab+ValToStr(rWeldProcedure.numDwellCenter)+strTab+ValToStr(rWeldProcedure.numDwellLeft)+strTab+ValToStr(rWeldProcedure.numDwellRight)\NoNewLine;
        Write iodevWeldTestLog,strTab+ValToStr(rWeldProcedure.numTrackType)+strTab+ValToStr(rWeldProcedure.numGainY)+strTab+ValToStr(rWeldProcedure.numGainZ)+strTab+ValToStr(rWeldProcedure.numPenetration)+strTab+ValToStr(rWeldProcedure.numTrackBias)\NoNewLine;
        Write iodevWeldTestLog,strTab+ValToStr(rWeldProcedure.numWeaveWidth90)+strTab+rWeldProcedure.strWeldProcedureID+strTab+ValToStr(numWeldResult);
        Close iodevWeldTestLog;
    ERROR
        IF ERRNO=ERR_FILEACC THEN
            TPWrite "Create a new RegFile "+strLogFileName;
            Open "HOME:"\File:=strLogFileName,iodevWeldTestLog\Append;
            Write iodevWeldTestLog,"Time"+strTab+"TestNo"+strTab+"LayerNo"+strTab+"TargetIndex"+strTab+"WeldSpeed"+strTab+"sched"+strTab+"trackcurrent"\NoNewLine;
            Write iodevWeldTestLog,strTab+"WeaveShape"+strTab+"WeaveLength"+strTab+"WeaveWidth"+strTab+"WeaveHeight"+strTab+"DwellCenter"+strTab+"DwellLeft"+strTab+"DwellRight"\NoNewLine;
            Write iodevWeldTestLog,strTab+"track_type"+strTab+"gain_y"+strTab+"gain_z"+strTab+"weld_penetration"+strTab+"track_bias"\NoNewLine;
            Write iodevWeldTestLog,strTab+"WeaveWidth90"+strTab+"WeldProcedureID"+strTab+"WeldResult";
            Close iodevWeldTestLog;
            TRYNEXT;
        ENDIF
    ENDPROC

    PROC GeneratePathModule(\num numIndexStart\num numIndexEnd\confdata robconf)
        VAR num index;
        VAR num IndexEnd;
        VAR string strSeamName;
        VAR RECORDWeldProcedure rWeldProcedureNext;

        strGenerateModuleName:="PathRob"+ValToStr(numCurTaskNo)+"_"+ValToStr(rPipeGrooveModel.numPipeGrooveType)+"_"+ValToStr(Round(rPipeGrooveModel.numHeaderDiameter*10))+"_"+ValToStr(Round(rPipeGrooveModel.numHeaderThickness*10));
        strGenerateModuleName:=strGenerateModuleName+"_"+ValToStr(Round(rPipeGrooveModel.numBranchDiameter*10))+"_"+ValToStr(Round(rPipeGrooveModel.numBranchThickness*10));
        Close iodevPathModule;
        Open "HOME:"\File:=strGenerateModuleName+".mod",iodevPathModule\Write;
        Write iodevPathModule,"MODULE "+strGenerateModuleName;

        RefreshCurrentLayerTargets strSeamName;

        IF Present(numIndexStart) THEN
            index:=numIndexStart;
        ELSE
            index:=1;
        ENDIF

        IF Present(numIndexEnd) THEN
            IndexEnd:=numIndexEnd;
        ELSE
            IndexEnd:=numRobLayerCurTotal;
        ENDIF

        WHILE index<=IndexEnd DO
            robtNext:=GetRobtarget(rRobLayerCur,index\confValue?robconf\extjointValue:=extjointValue);
            Write iodevPathModule,"    LOCAL CONST robtarget p"+ValToStr(index)+":=["\NoNewLine;
            Write iodevPathModule,ValToStr(robtNext.trans)+","\NoNewLine;
            Write iodevPathModule,ValToStr(robtNext.rot)+","\NoNewLine;
            Write iodevPathModule,ValToStr(robtNext.robconf)+","\NoNewLine;
            Write iodevPathModule,ValToStr(robtNext.extax)+"];";
            Incr index;
        ENDWHILE

        Write iodevPathModule,"";

        Write iodevPathModule,"    LOCAL PROC "+strGenerateProcName+"()";

        IF Present(numIndexStart) THEN
            index:=numIndexStart;
        ELSE
            index:=1;
        ENDIF

        WHILE index<=IndexEnd DO
            robtNext:=GetRobtarget(rRobLayerCur,index\confValue?robconf\extjointValue:=extjointValue);

            IF boolMoveLSubstituted THEN
                TEST rRobLayerCur{index}.numProcessType
                CASE 1,2,3,11,12,13,7:
                    Write iodevPathModule,"        MoveL p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedWeld,zoneWeld,toolWeldGun\\WObj:=wobjCurrent;";
                CASE 4,5,6,8,15,16:
                    Write iodevPathModule,"        MoveL p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedWeld,zoneWeld,toolWeldGun\\WObj:=wobjCurrent;";
                CASE 9:
                    Write iodevPathModule,"        MoveJ p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedAir,zoneAir,toolWeldGun\\WObj:=wobjCurrent;";
                DEFAULT:
                    Write iodevPathModule,"        MoveJ p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedAir,zoneAir,toolWeldGun\\WObj:=wobjCurrent;";
                ENDTEST
            ELSE
                TEST rRobLayerCur{index}.numProcessType
                CASE 1,11:
                    Write iodevPathModule,"        ArcLStart p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedWeld,seamNext,weldNext\\Weave:=weaveNext,zoneWeld,toolWeldGun"\NoNewLine;
                    Write iodevPathModule,"\\WObj:=wobjCurrent\\Track:=trackNext\\SeamName:="""+strSeamName+""";";
                CASE 2,12:
                    Write iodevPathModule,"        ArcL p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedWeld,seamNext,weldNext\\Weave:=weaveNext,zoneWeld,toolWeldGun"\NoNewLine;
                    Write iodevPathModule,"\\WObj:=wobjCurrent\\Track:=trackNext;";
                CASE 3,13:
                    Write iodevPathModule,"        ArcLEnd p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedWeld,seamNext,weldNext\\Weave:=weaveNext,zoneWeld,toolWeldGun"\NoNewLine;
                    Write iodevPathModule,"\\WObj:=wobjCurrent\\Track:=trackNext;";
                CASE 4:
                    Incr index;
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue?robconf\extjointValue:=extjointValue);
                    Write iodevPathModule,"        ArcCStart p"+ValToStr(index-1)+",p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedWeld,seamNext,weldNext\\Weave:=weaveNext,zoneWeld,toolWeldGun"\NoNewLine;
                    Write iodevPathModule,"\\WObj:=wobjCurrent\\Track:=trackNext\\SeamName:="""+strSeamName+""";";
                CASE 5,15:
                    Incr index;
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue?robconf\extjointValue:=extjointValue);
                    Write iodevPathModule,"        ArcC p"+ValToStr(index-1)+",p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedWeld,seamNext,weldNext\\Weave:=weaveNext,zoneWeld,toolWeldGun"\NoNewLine;
                    Write iodevPathModule,"\\WObj:=wobjCurrent\\Track:=trackNext;";
                CASE 6,16:
                    Incr index;
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue?robconf\extjointValue:=extjointValue);
                    Write iodevPathModule,"        ArcCEnd p"+ValToStr(index-1)+",p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedWeld,seamNext,weldNext\\Weave:=weaveNext,zoneWeld,toolWeldGun"\NoNewLine;
                    Write iodevPathModule,"\\WObj:=wobjCurrent\\Track:=trackNext;";
                CASE 7:
                    Write iodevPathModule,"        MoveJ p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedAir,zoneAir,toolWeldGun\\WObj:=wobjCurrent;";
                CASE 8:
                    Incr index;
                    robtCircleEnd:=GetRobtarget(rRobLayerCur,index\confValue?robconf\extjointValue:=extjointValue);
                    Write iodevPathModule,"        MoveC p"+ValToStr(index-1)+",p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedWeld,zoneWeld,toolWeldGun\\WObj:=wobjCurrent;";
                CASE 9:
                    Write iodevPathModule,"        MoveJ p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedAir,zoneAir,toolWeldGun\\WObj:=wobjCurrent;";
                DEFAULT:
                    Write iodevPathModule,"        MoveJ p"+ValToStr(index)\NoNewLine;
                    Write iodevPathModule,",speedAir,zoneAir,toolWeldGun\\WObj:=wobjCurrent;";
                ENDTEST
            ENDIF
            Incr index;
        ENDWHILE

        Write iodevPathModule,"    ENDPROC";
        Write iodevPathModule,"ENDMODULE";
        Close iodevPathModule;
        IF boolGenerateModuleAutoLoad THEN
            IF ModExist(strGenerateModuleName) THEN
                EraseModule strGenerateModuleName;
            ENDIF
            Load strGenerateModuleName+".MOD"\CheckRef;
        ENDIF
    ENDPROC

    PROC RefreshWeldingParameters(string strWeldProcedureID,\INOUT RECORDWeldProcedure rWeldProcedureReturn)
        VAR RECORDWeldProcedure rWeldProcedure;
        rWeldProcedure:=GetWeldProcedure(strWeldProcedureID);
        IF Present(rWeldProcedureReturn) THEN
            rWeldProcedureReturn:=rWeldProcedure;
        ENDIF

        IF rWeldProcedure.numWeldSpeed=0 THEN
            RETURN ;
        ENDIF

        seamNext.preflow_time:=rWeldProcedure.numPostFlow;
        seamNext.postflow_time:=rWeldProcedure.numPostFlow;

        weldNext.weld_speed:=rWeldProcedure.numWeldSpeed;
        weldNext.main_arc.sched:=rWeldProcedure.numSche;
        weldNext.main_arc.current:=rWeldProcedure.numTrackCurrent;

        IF rWeldProcedure.numWeaveShape=0 AND boolTrackOnCoerce=TRUE THEN
            weaveNext.weave_shape:=1;
            weaveNext.weave_type:=0;
            weaveNext.weave_length:=weldNext.weld_speed;
            weaveNext.weave_width:=0.1;
            weaveNext.dwell_left:=0;
            weaveNext.dwell_center:=0;
            weaveNext.dwell_right:=0;
            weaveNext.weave_dir:=0;
            weaveNext.weave_tilt:=0;
            weaveNext.weave_ori:=0;
            weaveNext.weave_bias:=0;
        ELSE
            weaveNext.weave_shape:=rWeldProcedure.numWeaveShape;
            weaveNext.weave_type:=rWeldProcedure.numWeaveType;
            weaveNext.weave_length:=rWeldProcedure.numWeaveLength;
            weaveNext.weave_width:=rWeldProcedure.numWeaveWidth;
            weaveNext.weave_height:=rWeldProcedure.numWeaveHeigth;
            weaveNext.dwell_left:=rWeldProcedure.numDwellLeft;
            weaveNext.dwell_center:=rWeldProcedure.numDwellCenter;
            weaveNext.dwell_right:=rWeldProcedure.numDwellRight;
            weaveNext.weave_dir:=rWeldProcedure.numWeaveDir;
            weaveNext.weave_tilt:=rWeldProcedure.numWeaveTilt;
            weaveNext.weave_ori:=rWeldProcedure.numWeaveOri;
            weaveNext.weave_bias:=rWeldProcedure.numWeaveBias;
        ENDIF

        trackNext.arctrack.track_type:=rWeldProcedure.numTrackType;
        trackNext.arctrack.gain_y:=rWeldProcedure.numGainY;
        trackNext.arctrack.gain_z:=rWeldProcedure.numGainZ;
        trackNext.arctrack.weld_penetration:=rWeldProcedure.numPenetration;
        trackNext.arctrack.track_bias:=rWeldProcedure.numTrackBias;

        adaptNext.NominalWidth:=rWeldProcedure.numWeaveWidth;
        numWeaveWidth90:=rWeldProcedure.numWeaveWidth90;

    ENDPROC

    PROC FitCircleSmoothing(pos points{*},num numPoints,num numSmoothTime,INOUT pos center,INOUT num radius,INOUT pos normal,INOUT num rms,INOUT num maxErr,INOUT num indexWorst)
        FitCircle points\NumPoints:=numPoints,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;
        FOR j FROM 1 TO numSmoothTime DO
            FOR i FROM indexWorst TO numPoints DO
                IF indexWorst<numPoints THEN
                    points{indexWorst}:=points{indexWorst+1};
                ENDIF
            ENDFOR
            numPoints:=numPoints-1;
            FitCircle points\NumPoints:=numPoints,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;
        ENDFOR
    ENDPROC

    FUNC pos GetSaddlePos(num numBranchRadius,num numHeaderRadius,num numTheta)
        VAR pos posSaddle;
        posSaddle.x:=numBranchRadius*Cos(numTheta);
        posSaddle.y:=numBranchRadius*Sin(numTheta);
        posSaddle.z:=Sqrt(Pow(numHeaderRadius,2)-Pow(numBranchRadius*Sin(numTheta),2));
        RETURN posSaddle;
    ENDFUNC

    FUNC num GetAdaptiveGrooveWidth(num numAngle,num NominalWidth,num numWidth90)
        VAR num numGrooveWidth;
        !Make sure the numAngle to be the positive number by cycle
        numAngle:=numAngle+360*(Abs(numAngle DIV 360)+1);
        !Make the numAngle to be in 0~359
        numAngle:=numAngle-(numAngle DIV 360)*360;
        IF rPipeGrooveModel.numBranchDiameter/rPipeGrooveModel.numHeaderDiameter>numIsometricalSaddleCoefficient THEN
            IF (numAngle>=0 And numAngle<=30) OR (numAngle>=150 And numAngle<=210) OR (numAngle>=330 And numAngle<=360) THEN
                numGrooveWidth:=NominalWidth;
            ELSE
                numGrooveWidth:=NominalWidth+(1-Abs((numAngle MOD 180)-90)/90)*(numWidth90-NominalWidth);
            ENDIF
            !Due to large groove at saddle's shoulder position, the weld speed needs to be reduced
            !IF (numAngle=0 OR numAngle=180) And NominalWidth<1 THEN
            IF numAngle=0 OR numAngle=180 THEN
                numGrooveWidth:=NominalWidth*numShoulderGrooveCoefficient;
            ENDIF
        ELSE
            numGrooveWidth:=NominalWidth+(1-Abs((numAngle MOD 180)-90)/90)*(numWidth90-NominalWidth);
        ENDIF
        RETURN numGrooveWidth;
    ENDFUNC

    PROC SortWeldProcedures()
        VAR RECORDWeldProcedure rWeldProcedures{100};
        VAR RECORDWeldProcedure rWeldProcedure;
        FOR i FROM 1 TO 2 DO
            GetDataVal "rWeldProcedures"+ValToStr(i),rWeldProcedures;
            BubbleSortWeldProcedureArray rWeldProcedures;
            SetDataVal "rWeldProcedures"+ValToStr(i),rWeldProcedures;
        ENDFOR
    ENDPROC

    PROC BubbleSortWeldProcedureArray(inout RECORDWeldProcedure weldProcedureArray{*})
        VAR RECORDWeldProcedure weldProcedureTemp;
        VAR num numElementsTotal;
        numElementsTotal:=Dim(weldProcedureArray,1);
        IF numElementsTotal>1 THEN
            FOR i FROM 1 TO numElementsTotal-1 DO
                FOR j FROM 1 TO numElementsTotal-i DO
                    IF StringCompare(weldProcedureArray{j}.strWeldProcedureID,weldProcedureArray{j+1}.strWeldProcedureID) THEN
                        weldProcedureTemp:=weldProcedureArray{j};
                        weldProcedureArray{j}:=weldProcedureArray{j+1};
                        weldProcedureArray{j+1}:=weldProcedureTemp;
                    ENDIF
                ENDFOR
            ENDFOR
        ENDIF
    ENDPROC

    !if str1<=str2, return true;
    FUNC bool StringCompare(string str1,string str2)
        VAR num numCompareLength;
        VAR rawbytes raw_data1;
        VAR rawbytes raw_data2;
        VAR byte byte1;
        VAR byte byte2;
        numCompareLength:=Min(StrLen(str1),StrLen(str2));
        IF numCompareLength>0 THEN
            PackRawBytes str1,raw_data1,1\ASCII;
            PackRawBytes str2,raw_data2,1\ASCII;
            FOR i FROM 1 TO numCompareLength DO
                UnpackRawBytes raw_data1,i,byte1\Hex1;
                UnpackRawBytes raw_data2,i,byte2\Hex1;
                IF byte1<byte2 THEN
                    RETURN TRUE;
                ELSEIF byte1>byte2 THEN
                    RETURN FALSE;
                ENDIF
            ENDFOR
            IF StrLen(str1)<=StrLen(str2) THEN
                RETURN TRUE;
            ELSEIF StrLen(str1)>StrLen(str2) THEN
                RETURN FALSE;
            ENDIF
        ELSE
            IF StrLen(str1)=0 THEN
                RETURN TRUE;
            ELSE
                RETURN FALSE;
            ENDIF
        ENDIF
    ENDFUNC

    PROC InitWeldProcedures()
        VAR RECORDWeldProcedure rWeldProcedures{100};
        VAR RECORDWeldProcedure rWeldProcedure;
        FOR i FROM 1 TO 2 DO
            GetDataVal "rWeldProcedures"+ValToStr(i),rWeldProcedures;
            FOR j FROM 1 TO Dim(rWeldProcedures1,1) DO
                IF StrLen(rWeldProcedures{j}.strWeldProcedureID)>0 AND rWeldProcedures{j}.numWeldSpeed=0 THEN
                    rWeldProcedures{j}:=InitWeldProcedure(rWeldProcedures{j}\ByID);
                ENDIF
            ENDFOR
            SetDataVal "rWeldProcedures"+ValToStr(i),rWeldProcedures;
        ENDFOR
    ENDPROC

    !The format of the ID is s10j45w0-0, s means weld speed, j means job no, w means weave width at 0 and 90 degrees
    FUNC RECORDWeldProcedure InitWeldProcedure(RECORDWeldProcedure rWeldProcedure\switch ByID|switch ByValue)
        VAR num numFounds:=1;
        VAR num numFoundj;
        VAR num numFoundw;
        VAR num numFounddash;
        VAR bool boolOK;
        IF Present(ByID) THEN
            numFoundj:=StrMatch(rWeldProcedure.strWeldProcedureID,numFounds+1,"j");
            boolOK:=StrToVal(StrPart(rWeldProcedure.strWeldProcedureID,numFounds+1,numFoundj-numFounds-1),rWeldProcedure.numWeldSpeed);
            IF boolOK THEN
                numFoundw:=StrMatch(rWeldProcedure.strWeldProcedureID,numFoundj+1,"w");
                boolOK:=StrToVal(StrPart(rWeldProcedure.strWeldProcedureID,numFoundj+1,numFoundw-numFoundj-1),rWeldProcedure.numSche);
                IF boolOK THEN
                    numFounddash:=StrMatch(rWeldProcedure.strWeldProcedureID,numFoundw+1,"-");
                    boolOK:=StrToVal(StrPart(rWeldProcedure.strWeldProcedureID,numFoundw+1,numFounddash-numFoundw-1),rWeldProcedure.numWeaveWidth);
                    IF boolOK THEN
                        boolOK:=StrToVal(StrPart(rWeldProcedure.strWeldProcedureID,numFounddash+1,StrLen(rWeldProcedure.strWeldProcedureID)-numFounddash),rWeldProcedure.numWeaveWidth90);
                        IF boolOK THEN
                            IF rWeldProcedure.numWeaveShape>0 THEN
                                IF rWeldProcedure.numWeaveWidth=0 THEN
                                    rWeldProcedure.numWeaveWidth:=0.1;
                                ENDIF
                                IF rWeldProcedure.numWeaveWidth90=0 THEN
                                    rWeldProcedure.numWeaveWidth90:=0.1;
                                ENDIF
                            ELSE
                                rWeldProcedure.numWeaveHeigth:=0;
                            ENDIF
                            rWeldProcedure.numDwellCenter:=0;
                            rWeldProcedure.numDwellLeft:=0;
                            rWeldProcedure.numDwellRight:=0;
                            rWeldProcedure.numGainY:=0;
                            rWeldProcedure.numGainZ:=0;
                            rWeldProcedure.numPenetration:=0;
                            rWeldProcedure.numPostFlow:=0.5;
                            rWeldProcedure.numPreFlow:=0.5;
                            rWeldProcedure.numTrackBias:=0;
                            rWeldProcedure.numTrackCurrent:=200;
                            rWeldProcedure.numTrackType:=0;
                            rWeldProcedure.numWeaveBias:=0;
                            rWeldProcedure.numWeaveDir:=0;
                            rWeldProcedure.numWeaveLength:=rWeldProcedure.numWeldSpeed/2;
                            rWeldProcedure.numWeaveOri:=0;
                            rWeldProcedure.numWeaveTilt:=0;
                            rWeldProcedure.numWeaveType:=0;
                            rWeldProcedure.strRemark:=CDate()+" "+CTime()+" initiated";
                        ENDIF
                    ENDIF
                ENDIF
            ENDIF
        ELSE
            IF rWeldProcedure.numWeldSpeed>0 THEN
                rWeldProcedure.numWeaveWidth:=Round(rWeldProcedure.numWeaveWidth);
                rWeldProcedure.numWeaveWidth90:=Round(rWeldProcedure.numWeaveWidth90);
                IF rWeldProcedure.numWeaveShape>0 THEN
                    IF rWeldProcedure.numWeaveWidth=0 THEN
                        rWeldProcedure.numWeaveWidth:=0.1;
                    ENDIF
                    IF rWeldProcedure.numWeaveWidth90=0 THEN
                        rWeldProcedure.numWeaveWidth90:=0.1;
                    ENDIF
                ENDIF
                rWeldProcedure.strWeldProcedureID:="s"+ValToStr(rWeldProcedure.numWeldSpeed)+"j"+ValToStr(rWeldProcedure.numSche)+"w"+ValToStr(rWeldProcedure.numWeaveWidth)+"-"+ValToStr(rWeldProcedure.numWeaveWidth90);
                rWeldProcedure.numDwellCenter:=0;
                rWeldProcedure.numDwellLeft:=0;
                rWeldProcedure.numDwellRight:=0;
                rWeldProcedure.numGainY:=0;
                rWeldProcedure.numGainZ:=0;
                rWeldProcedure.numPenetration:=0;
                rWeldProcedure.numPostFlow:=0.5;
                rWeldProcedure.numPreFlow:=0.5;
                rWeldProcedure.numTrackBias:=0;
                rWeldProcedure.numTrackCurrent:=200;
                rWeldProcedure.numTrackType:=0;
                rWeldProcedure.numWeaveBias:=0;
                rWeldProcedure.numWeaveDir:=0;
                rWeldProcedure.numWeaveHeigth:=0;
                rWeldProcedure.numWeaveLength:=rWeldProcedure.numWeldSpeed/2;
                rWeldProcedure.numWeaveOri:=0;
                rWeldProcedure.numWeaveTilt:=0;
                rWeldProcedure.numWeaveType:=0;
                rWeldProcedure.strRemark:=CDate()+" "+CTime()+" initiated";
            ENDIF
        ENDIF
        RETURN rWeldProcedure;
    ENDFUNC

ENDMODULE
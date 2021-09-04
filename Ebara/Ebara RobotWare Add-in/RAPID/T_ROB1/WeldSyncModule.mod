MODULE WeldSyncModule
    !*****************************************************
    !Module Name: WeldSyncModule
    !Version:     1.0
    !Description: -
    !Date:        2018-8-10
    !Author:      Michael
    !*****************************************************

    RECORD RecordFrameOffset
        num numSeamCenterXMin;
        num numSeamCenterXMax;
        num numHeaderDiameterMin;
        num numHeaderDiameterMax;
        num numBranchDiameterMin;
        num numBranchDiameterMax;
        num numOffsetX;
        num numOffsetY;
        num numOffsetZ;
    ENDRECORD

    PERS bool boolUseRespectiveWobj:=FALSE;
    PERS bool boolReverseWeldDirection:=FALSE;

    VAR iodev iodevWobjCurrent;
    CONST string strScanSaddleWobjLogFileName:="ScanSaddleWobj.csv";
    CONST string strScanPlatoonWobjLogFileName:="ScanPlatoonWobj.csv";
    CONST string strSSWobjOffsetFileName:="SSWobjOffset.csv";
    CONST string strSPWobjOffsetFileName:="SPWobjOffset.csv";
    CONST string strSSFileName:="SS.csv";
    CONST string strSPFileName:="SP.csv";
    TASK PERS bool boolInitSaddleWobjLogFile:=TRUE;
    TASK PERS bool boolInitPlatoonWobjLogFile:=TRUE;
    TASK PERS bool boolInitSSWobjOffsetLogFile:=FALSE;
    TASK PERS bool boolInitSPWobjOffsetLogFile:=FALSE;
    TASK PERS bool boolInitSSLogFile:=FALSE;
    TASK PERS bool boolInitSPLogFile:=FALSE;

    TASK PERS pos posScanSaddleBranchOffset1:=[0,0,0];
    TASK PERS pos posScanSaddleBranchOffset2:=[0,0,0];
    TASK PERS pos posScanSaddleHeaderOffset1:=[0,0,0];
    TASK PERS pos posScanSaddleHeaderOffset2:=[0,0,0];
    TASK PERS pos posScanPlatoonBranchOffset1:=[-1.48106,0,3.46191];
    TASK PERS pos posScanPlatoonBranchOffset2:=[-1.48501,0,1.9209];
    TASK PERS pos posScanPlatoonHeaderOffset1:=[-3.89165,2.98773,0];
    TASK PERS pos posScanPlatoonHeaderOffset2:=[-3.89165,2.98773,0];

    TASK PERS num useOnlyRobotDataofBranch:=0;
    TASK PERS num useOnlyRobotDataofHeader:=0;
    TASK PERS num numBranchDeviationY:=-24.5253;
    TASK PERS num numBranchPeripheryDeviationY:=-1.61082;

    !numWobjYCalibType: 1 - Use branch data, 2 - Use header data, 3 - use branch and header data
    TASK PERS num numSaddleWobjXCalibType:=1;
    TASK PERS num numPlatoonWobjXCalibType:=1;

    VAR iodev iodevLayerParameterLog;
    CONST string strLayerParameterLogFileName:="LayerParameter.csv";
    TASK PERS bool boolInitLayerParameterLogFile:=FALSE;

    PROC MultiPassWeldSync()
        Logging\INFO,"index="+ValToStr(rPipeGrooveModel.numIndex);
        Logging\INFO,"numPipeGrooveType="+ValToStr(rPipeGrooveModel.numPipeGrooveType);
        Logging\INFO,"numWeldLegWidth="+ValToStr(rPipeGrooveModel.numWeldLegWidth);
        Logging\INFO,"numGrooveGap="+ValToStr(rPipeGrooveModel.numGrooveGap);
        Logging\INFO,"numBranchGrooveRoot="+ValToStr(rPipeGrooveModel.numBranchGrooveRoot);
        Logging\INFO,"numBranchGrooveAngle="+ValToStr(rPipeGrooveModel.numBranchGrooveAngle);

        Logging\INFO,"numSeamCenterX="+ValToStr(rPipeGrooveModel.numSeamCenterX);
        Logging\INFO,"numSeamNormalAngle="+ValToStr(rPipeGrooveModel.numSeamNormalAngle);

        Logging\INFO,"numHeaderDiameter="+ValToStr(rPipeGrooveModel.numHeaderDiameter);
        Logging\INFO,"numHeaderThickness="+ValToStr(rPipeGrooveModel.numHeaderThickness);
        Logging\INFO,"numHeaderMaterial="+ValToStr(rPipeGrooveModel.numHeaderMaterial);
        Logging\INFO,"numBranchDiameter="+ValToStr(rPipeGrooveModel.numBranchDiameter);
        Logging\INFO,"numBranchThickness="+ValToStr(rPipeGrooveModel.numBranchThickness);
        Logging\INFO,"numBranchMaterial="+ValToStr(rPipeGrooveModel.numBranchMaterial);

        Logging\INFO,"numMultiPassTotal="+ValToStr(rPipeGrooveModel.numMultiPassTotal);
        Logging\INFO,"numCooperativeRobots="+ValToStr(rPipeGrooveModel.numCooperativeRobots);
        Logging\INFO,"numPathSource="+ValToStr(rPipeGrooveModel.numPathSource);
        Logging\INFO,"numReviseScanBranchType="+ValToStr(rPipeGrooveModel.numReviseScanBranchType);
        Logging\INFO,"numReviseScanHeaderType="+ValToStr(rPipeGrooveModel.numReviseScanHeaderType);
        Logging\INFO,"boolContinuous="+ValToStr(rPipeGrooveModel.boolContinuous);
        Logging\INFO,"strID="+ValToStr(rPipeGrooveModel.strID);
        Logging\INFO,"strRemark="+ValToStr(rPipeGrooveModel.strRemark);

        WaitSyncTask SyncPositionerHomed,taskListRob1Rob2Pos1;

        IF NOT boolKeepLastWobj THEN
            UpdateWobjAndTrack;
        ELSE
            UpdateTrackAndViaPoints;
        ENDIF

        MovetoHome;

        IF boolConfOn THEN
            ConfJ\On;
            ConfL\On;
        ELSE
            ConfJ\Off;
            ConfL\Off;
        ENDIF

        Logging\INFO,"uframe.trans="+ValToStr(wobjCurrent.uframe.trans);
        Logging\INFO,"uframe.rot="+ValToStr(wobjCurrent.uframe.rot);
        Logging\INFO,"oframe.trans="+ValToStr(wobjCurrent.oframe.trans);
        Logging\INFO,"oframe.rot="+ValToStr(wobjCurrent.oframe.rot);

        TEST rPipeGrooveModel.numCooperativeRobots
        CASE 1:
            taskListCurrent:=[["T_ROB1"],[""],[""]];
            WeldPlatoon;
        CASE 2:
        CASE 3:
            taskListCurrent:=[["T_ROB1"],["T_ROB2"],[""]];
            !wobjCurrent:=[FALSE,TRUE,"",[[236,0,644.08],[0.5,0.5,0.5,0.5]],[[2.04825,7.59898,2615.33],[0.5,-0.5,-0.5,-0.5]]];
            !IF numPlatoonSinkingTotal>0 THEN
            !wobjCurrent:=[FALSE,TRUE,"",[[236,0,644.08],[0.5,0.5,0.5,0.5]],[[2.04825,7.59898,2615.33],[0.5,-0.5,-0.5,-0.5]]];
            !wobjCurrent.oframe.trans.z:=wobjCurrent.oframe.trans.z+numPlatoonWeldingSequenceArray{rPipeGrooveModel.numIndex}*105;
            !ENDIF
            WeldPlatoon;
        CASE 5:
            taskListCurrent:=[["T_ROB1"],[""],["T_POS1"]];
            !wobjCurrent:=[FALSE,FALSE,"STN1",[[0,0,0],[1,0,0,0]],[[-0.4,-2,379.485],[0.0684488,0.703786,-0.0684488,0.703786]]];
            WeldSaddle;
        CASE 6:
        ENDTEST

        MovetoHome;

        ConfJ\On;
        ConfL\On;
    ENDPROC

    PROC WeldPlatoon()
        FOR i FROM numLayerNoStart TO rPipeGrooveModel.numMultiPassTotal STEP 1 DO
            numCurrentLayerNo:=i;
            IF i=numLayerNoStart THEN
                MoveJ robtApproachPlatoonSinking,speedAir,zoneAir,toolWeldGun\WObj:=wobjRailFixture;
            ENDIF

            IF boolMoveApproach THEN
                MoveJ robtApproachPlatoonSinking,speedAir,zoneAir,toolWeldGun\WObj:=wobjRailFixture;
            ENDIF
            IF boolReverseWeldDirection THEN
                WeldLayerIndependent\Start\End\robconf:=confPlatoonSinkingOrigin\ReverseWeldDirection;
            ELSE
                WeldLayerIndependent\Start\End\robconf:=confPlatoonSinkingOrigin;
            ENDIF
            IF boolMoveApproach THEN
                MoveJ robtDepartPlatoonSinking,speedAir,zoneAir,toolWeldGun\WObj:=wobjRailFixture;
            ENDIF

            IF i>=rPipeGrooveModel.numMultiPassTotal THEN
                MoveJ robtDepartPlatoonSinking,speedAir,zoneAir,toolWeldGun\WObj:=wobjRailFixture;
            ENDIF
        ENDFOR
    ENDPROC

    PROC WeldSaddle()
        FOR i FROM numLayerNoStart TO rPipeGrooveModel.numMultiPassTotal STEP 1 DO
            numCurrentLayerNo:=i;
            IF i=numLayerNoStart THEN
                MoveJ robtApproachSaddle,speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
            ENDIF

            IF rPipeGrooveModel.boolContinuous=TRUE THEN
                IF numLayerNoStart>=rPipeGrooveModel.numMultiPassTotal THEN
                    WeldLayerSynchronized\Start\End\robconf:=confSaddleOrigin;
                ELSEIF i=numLayerNoStart THEN
                    WeldLayerSynchronized\Start\robconf:=confSaddleOrigin;
                ELSEIF i>=rPipeGrooveModel.numMultiPassTotal THEN
                    WeldLayerSynchronized\End;
                ELSE
                    WeldLayerSynchronized;
                ENDIF
            ELSE
                IF boolMoveApproach THEN
                    MoveJ robtApproachSaddle,speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
                ENDIF
                WeldLayerSynchronized\Start\End\robconf:=confSaddleOrigin;
                IF boolMoveApproach THEN
                    MoveJ robtDepartSaddle,speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
                ENDIF
            ENDIF

            IF i>=rPipeGrooveModel.numMultiPassTotal THEN
                MoveJ robtDepartSaddle,speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
            ENDIF

        ENDFOR
    ENDPROC

    PROC UpdateTrackAndViaPoints()
        extjointValue.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;

        robtApproachPlatoonSinking.extax:=extjointValue;
        robtApproachPlatoonSinking.trans.x:=rPipeGrooveModel.numSeamCenterX;
        robtDepartPlatoonSinking.extax:=extjointValue;
        robtDepartPlatoonSinking.trans.x:=rPipeGrooveModel.numSeamCenterX;

        robtApproachPlatoonSinkingScan.extax:=extjointValue;
        robtApproachPlatoonSinkingScan.trans.x:=rPipeGrooveModel.numSeamCenterX;
        robtDepartPlatoonSinkingScan.extax:=extjointValue;
        robtDepartPlatoonSinkingScan.trans.x:=rPipeGrooveModel.numSeamCenterX;

        robtApproachSaddle.extax:=extjointValue;
        robtApproachSaddle.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+50;
        robtDepartSaddle.extax:=extjointValue;
        robtDepartSaddle.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+50;

        robtApproachSaddleScan.extax:=extjointValue;
        robtApproachSaddleScan.trans.x:=rPipeGrooveModel.numSeamCenterX;
        robtDepartSaddleScan.extax:=extjointValue;
        robtDepartSaddleScan.trans.x:=rPipeGrooveModel.numSeamCenterX;

        jointSSApproach.extax:=extjointValue;
        jointSSDepart.extax:=extjointValue;
        jointSPApproach.extax:=extjointValue;
        jointSPDepart.extax:=extjointValue;
    ENDPROC

    !Set the current wobj parameters and track position.
    PROC UpdateWobjAndTrack()
        VAR pose oframeTemp;
        VAR pose poseGrooveAngle:=[[0,0,0],[1,0,0,0]];

        UpdateTrackAndViaPoints;

        oframeTemp:=wobjCurrent.oframe;
        IF rPipeGrooveModel.numCooperativeRobots>3 THEN
            wobjCurrent:=wobjSTN1;
            !wobjCurrent.oframe:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
            !poseGrooveAngle.rot:=OrientZYX(0,0,0-rPipeGrooveModel.numSeamNormalAngle);
            !wobjCurrent.oframe:=PoseMult(wobjCurrent.oframe,poseGrooveAngle);
            wobjCurrent.oframe.rot:=OrientZYX(0,-90,-90-rPipeGrooveModel.numSeamNormalAngle);
            wobjCurrent.oframe.trans:=[0,0,rPipeGrooveModel.numSeamCenterX];
        ELSE
            wobjCurrent:=wobjRailFixture;
            wobjCurrent.oframe:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
            wobjCurrent.oframe.trans.z:=rPipeGrooveModel.numSeamCenterX;
        ENDIF

        WaitSyncTask SyncWobjScanning,taskListRob1Rob2Pos1;
        IF rPipeGrooveModel.numCooperativeRobots>3 THEN
            ScanSaddleWobj;
        ELSE
            !ScanPlatoonSinkingWobj;
            !Michael, 2019-2-21, Switch to ScanV2
            ScanPlatoon;
        ENDIF
        WaitSyncTask SyncWobjScaned,taskListRob1Rob2Pos1;

        ReviseWobj;
        WaitSyncTask SyncWobjRevised,taskListRob1Rob2Pos1;

    ENDPROC

    PROC ReviseWobj()
        VAR pose poseGrooveAngle:=[[0,0,0],[1,0,0,0]];
        VAR pos posoframeCenterRotated:=[0,0,0];
        VAR pos posoframeCenter:=[0,0,0];
        !Get the theory wobj
        wobjCurrent1:=wobjCurrent;
        wobjCurrent2:=wobjCurrent;

        IF rPipeGrooveModel.numCooperativeRobots>3 THEN
            ReviseSaddleWobj;
        ELSE
            !RevisePlatoonWobj;
            !Michael, 2019-2-21, Switch to ScanV2
            IF NOT (BitCheck(rPipeGrooveModel.numReviseScanBranchType,5) AND BitCheck(rPipeGrooveModel.numReviseScanBranchType,6)) THEN
                WriteOptimumCenterLog;
                wobjCurrent1.oframe.trans.x:=posOptimumCenterRob1.y;
                wobjCurrent1.oframe.trans.y:=posOptimumCenterRob1.z;
                wobjCurrent1.oframe.trans.z:=posOptimumCenterRob1.x;
                wobjCurrent2.oframe.trans.x:=posOptimumCenterRob2.y;
                wobjCurrent2.oframe.trans.y:=posOptimumCenterRob2.z;
                wobjCurrent2.oframe.trans.z:=posOptimumCenterRob2.x;
                !            wobjCurrent1.oframe.trans:=posOptimumCenterRob1;
                !            wobjCurrent2.oframe.trans:=posOptimumCenterRob2;
                wobjCurrent.oframe.trans.x:=(wobjCurrent1.oframe.trans.x+wobjCurrent2.oframe.trans.x)/2;
                wobjCurrent.oframe.trans.y:=(wobjCurrent1.oframe.trans.y+wobjCurrent2.oframe.trans.y)/2;
                wobjCurrent.oframe.trans.z:=(wobjCurrent1.oframe.trans.z+wobjCurrent2.oframe.trans.z)/2;
            ENDIF
        ENDIF

    ENDPROC

    PROC ReviseSaddleWobj()
        VAR pose poseGrooveAngle:=[[0,0,0],[1,0,0,0]];
        poseGrooveAngle.rot:=OrientZYX(0-rPipeGrooveModel.numSeamNormalAngle,0,0);

        !useOnlyRobotDataofBranch: 1 - robot1, 2 - robot2
        useOnlyRobotDataofBranch:=0;
        useOnlyRobotDataofHeader:=0;

        IF BitCheck(rPipeGrooveModel.numReviseScanBranchType,1) THEN
            IF numScanSaddleBranchMethod=1 OR numScanSaddleBranchMethod=3 THEN
                posScanSaddleBranchOffset1.x:=posRob1SSBPeripheryCenter.y+rPipeGrooveModel.numBranchDiameter/2;
            ELSE
                posScanSaddleBranchOffset1.x:=posRob1SSBCenter.y;
            ENDIF
            posScanSaddleBranchOffset1.y:=0;
            posScanSaddleBranchOffset1.z:=posRob1SSBCenter.x-rPipeGrooveModel.numSeamCenterX;
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanBranchType,3) THEN
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanBranchType,5) THEN
            posScanSaddleBranchOffset1:=[0,0,0];
        ELSE
            !For only use robot2 data
            useOnlyRobotDataofBranch:=2;
        ENDIF

        IF BitCheck(rPipeGrooveModel.numReviseScanBranchType,2) THEN
            IF numScanSaddleBranchMethod=1 OR numScanSaddleBranchMethod=3 THEN
                posScanSaddleBranchOffset2.x:=posRob2SSBPeripheryCenter.y-rPipeGrooveModel.numBranchDiameter/2;
            ELSE
                posScanSaddleBranchOffset2.x:=posRob2SSBCenter.y;
            ENDIF
            posScanSaddleBranchOffset2.y:=0;
            posScanSaddleBranchOffset2.z:=posRob2SSBCenter.x-rPipeGrooveModel.numSeamCenterX;
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanBranchType,4) THEN
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanBranchType,6) THEN
            posScanSaddleBranchOffset2:=[0,0,0];
        ELSE
            !For only use robot1 data
            useOnlyRobotDataofBranch:=1;
        ENDIF

        IF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,1) THEN
            IF numScanSaddleHeaderMethod=1 OR numScanSaddleHeaderMethod=3 THEN
                posScanSaddleHeaderOffset1.x:=posRob1SSHPeripheryCenter.y+rPipeGrooveModel.numHeaderDiameter/2;
            ELSE
                posScanSaddleHeaderOffset1.x:=posRob1SSHCenter.y;
            ENDIF
            posScanSaddleHeaderOffset1.y:=posRob1SSHCenter.z;
            posScanSaddleHeaderOffset1.z:=0;
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,3) THEN
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanBranchType,5) THEN
            posScanSaddleHeaderOffset1:=[0,0,0];
        ELSE
            !For only use robot2 data
            useOnlyRobotDataofBranch:=2;
        ENDIF

        IF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,2) THEN
            IF numScanSaddleHeaderMethod=1 OR numScanSaddleHeaderMethod=3 THEN
                posScanSaddleHeaderOffset2.x:=posRob2SSHPeripheryCenter.y-rPipeGrooveModel.numHeaderDiameter/2;
            ELSE
                posScanSaddleHeaderOffset2.x:=posRob2SSHCenter.y;
            ENDIF
            posScanSaddleHeaderOffset2.y:=posRob2SSHCenter.z;
            posScanSaddleHeaderOffset2.z:=0;
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,4) THEN
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanBranchType,6) THEN
            posScanSaddleHeaderOffset2:=[0,0,0];
        ELSE
            !For only use robot1 data
            useOnlyRobotDataofBranch:=1;
        ENDIF

        IF useOnlyRobotDataofBranch=1 THEN
            posScanSaddleBranchOffset2:=posScanSaddleBranchOffset1;
        ELSEIF useOnlyRobotDataofBranch=2 THEN
            posScanSaddleBranchOffset1:=posScanSaddleBranchOffset2;
        ENDIF

        IF useOnlyRobotDataofHeader=1 THEN
            posScanSaddleHeaderOffset2:=posScanSaddleHeaderOffset1;
        ELSEIF useOnlyRobotDataofHeader=2 THEN
            posScanSaddleHeaderOffset1:=posScanSaddleHeaderOffset2;
        ENDIF

        wobjCurrent1.oframe.trans.x:=posScanSaddleBranchOffset1.x;
        wobjCurrent1.oframe.trans.y:=0;
        wobjCurrent1.oframe.trans.z:=posScanSaddleBranchOffset1.z+rPipeGrooveModel.numSeamCenterX;
        !wobjCurrent1.oframe.trans.x:=(posScanSaddleBranchOffset1.x+posScanSaddleHeaderOffset1.x)/2;
        !wobjCurrent1.oframe.trans.y:=posScanSaddleHeaderOffset1.y;
        wobjCurrent1.oframe.trans:=PoseVect(poseGrooveAngle,wobjCurrent1.oframe.trans);
        Logging\INFO,"oframe1="+ValToStr(wobjCurrent1.oframe.trans);

        wobjCurrent2.oframe.trans.x:=posScanSaddleBranchOffset2.x;
        wobjCurrent2.oframe.trans.y:=0;
        wobjCurrent2.oframe.trans.z:=posScanSaddleBranchOffset2.z+rPipeGrooveModel.numSeamCenterX;
        !wobjCurrent2.oframe.trans.x:=(posScanSaddleBranchOffset2.x+posScanSaddleHeaderOffset2.x)/2;
        !wobjCurrent2.oframe.trans.y:=posScanSaddleHeaderOffset2.y;
        wobjCurrent2.oframe.trans:=PoseVect(poseGrooveAngle,wobjCurrent2.oframe.trans);
        Logging\INFO,"oframe2="+ValToStr(wobjCurrent2.oframe.trans);

        !        wobjCurrent.oframe.trans.x:=(wobjCurrent1.oframe.trans.x+wobjCurrent2.oframe.trans.x)/2;        
        !        wobjCurrent.oframe.trans.y:=(wobjCurrent1.oframe.trans.y+wobjCurrent2.oframe.trans.y)/2;
        wobjCurrent.oframe.trans.x:=0;
        wobjCurrent.oframe.trans.y:=0;
        wobjCurrent.oframe.trans.z:=(wobjCurrent1.oframe.trans.z+wobjCurrent2.oframe.trans.z)/2;
        !            wobjCurrent.oframe.trans.x:=wobjCurrent1.oframe.trans.x;
        !            wobjCurrent.oframe.trans.y:=wobjCurrent1.oframe.trans.y;
        !            wobjCurrent.oframe.trans.z:=wobjCurrent1.oframe.trans.z;
        Logging\INFO,"oframe="+ValToStr(wobjCurrent.oframe.trans);

        IF BitCheck(rPipeGrooveModel.numReviseScanBranchType,1) OR BitCheck(rPipeGrooveModel.numReviseScanBranchType,2) OR BitCheck(rPipeGrooveModel.numReviseScanHeaderType,1) OR BitCheck(rPipeGrooveModel.numReviseScanHeaderType,2) THEN
            WriteSSWobjOffsetLog;
            WriteSSLog;
        ENDIF

    ENDPROC

    PROC RevisePlatoonWobj()
        !useOnlyRobotDataofBranch: 1 - robot1, 2 - robot2
        useOnlyRobotDataofBranch:=0;
        useOnlyRobotDataofHeader:=0;
        IF BitCheck(rPipeGrooveModel.numReviseScanBranchType,1) THEN
            !IF numScanPlatoonBranchMethod=1 OR numScanPlatoonBranchMethod=3 THEN
            IF numScanPlatoonBranchMethod=3 THEN
                posScanPlatoonBranchOffset1.x:=posRob1SPBPeripheryCenter.y+rPipeGrooveModel.numBranchDiameter/2;
            ELSEIF numScanPlatoonBranchMethod=1 THEN
                numBranchDeviationY:=posRob1SPBCenter.y-posRob2SPBCenter.y;
                numBranchPeripheryDeviationY:=posRob1SPBPeripheryCenter.y+rPipeGrooveModel.numBranchDiameter/2-(posRob2SPBPeripheryCenter.y-rPipeGrooveModel.numBranchDiameter/2);
                IF Abs(numBranchDeviationY)<Abs(numBranchPeripheryDeviationY) THEN
                    posScanPlatoonBranchOffset1.x:=posRob1SPBCenter.y;
                    Logging\INFO,"Use posRob1SPBCenter for Rob1";
                ELSE
                    posScanPlatoonBranchOffset1.x:=posRob1SPBPeripheryCenter.y+rPipeGrooveModel.numBranchDiameter/2;
                    Logging\INFO,"Use posRob1SPBPeripheryCenter for Rob1";
                ENDIF
            ELSE
                posScanPlatoonBranchOffset1.x:=posRob1SPBCenter.y;
            ENDIF
            posScanPlatoonBranchOffset1.y:=0;
            posScanPlatoonBranchOffset1.z:=posRob1SPBCenter.x-rPipeGrooveModel.numSeamCenterX;
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanBranchType,3) THEN
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanBranchType,5) THEN
            posScanPlatoonBranchOffset1:=[0,0,0];
        ELSE
            !For only use robot2 data
            useOnlyRobotDataofBranch:=2;
        ENDIF

        IF BitCheck(rPipeGrooveModel.numReviseScanBranchType,2) THEN
            !IF numScanPlatoonBranchMethod=1 OR numScanPlatoonBranchMethod=3 THEN
            IF numScanPlatoonBranchMethod=3 THEN
                posScanPlatoonBranchOffset2.x:=posRob2SPBPeripheryCenter.y-rPipeGrooveModel.numBranchDiameter/2;
            ELSEIF numScanPlatoonBranchMethod=1 THEN
                numBranchDeviationY:=posRob1SPBCenter.y-posRob2SPBCenter.y;
                numBranchPeripheryDeviationY:=posRob1SPBPeripheryCenter.y+rPipeGrooveModel.numBranchDiameter/2-(posRob2SPBPeripheryCenter.y-rPipeGrooveModel.numBranchDiameter/2);
                IF Abs(numBranchDeviationY)<Abs(numBranchPeripheryDeviationY) THEN
                    posScanPlatoonBranchOffset2.x:=posRob2SPBCenter.y;
                    Logging\INFO,"Use posRob1SPBCenter for Rob2";
                ELSE
                    posScanPlatoonBranchOffset2.x:=posRob2SPBPeripheryCenter.y-rPipeGrooveModel.numBranchDiameter/2;
                    Logging\INFO,"Use posRob1SPBPeripheryCenter for Rob2";
                ENDIF
            ELSE
                posScanPlatoonBranchOffset2.x:=posRob2SPBCenter.y;
            ENDIF
            posScanPlatoonBranchOffset2.y:=0;
            posScanPlatoonBranchOffset2.z:=posRob2SPBCenter.x-rPipeGrooveModel.numSeamCenterX;
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanBranchType,4) THEN
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanBranchType,6) THEN
            posScanPlatoonBranchOffset2:=[0,0,0];
        ELSE
            !For only use robot1 data
            useOnlyRobotDataofBranch:=1;
        ENDIF

        IF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,1) THEN
            !IF numScanPlatoonHeaderMethod=1 OR numScanPlatoonHeaderMethod=3 THEN
            IF numScanPlatoonHeaderMethod=3 THEN
                posScanPlatoonHeaderOffset1.x:=posRob1SPHPeripheryCenter.y+rPipeGrooveModel.numHeaderDiameter/2;
            ELSE
                posScanPlatoonHeaderOffset1.x:=posRob1SPHCenter.y;
            ENDIF
            posScanPlatoonHeaderOffset1.y:=posRob1SPHCenter.z;
            posScanPlatoonHeaderOffset1.z:=0;
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,3) THEN
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,5) THEN
            posScanPlatoonHeaderOffset1:=[0,0,0];
        ELSE
            !For only use robot2 data
            useOnlyRobotDataofHeader:=2;
        ENDIF

        IF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,2) THEN
            !IF numScanPlatoonHeaderMethod=1 OR numScanPlatoonHeaderMethod=3 THEN
            IF numScanPlatoonHeaderMethod=3 THEN
                posScanPlatoonHeaderOffset2.x:=posRob2SPHPeripheryCenter.y-rPipeGrooveModel.numHeaderDiameter/2;
            ELSE
                posScanPlatoonHeaderOffset2.x:=posRob2SPHCenter.y;
            ENDIF
            posScanPlatoonHeaderOffset2.y:=posRob2SPHCenter.z;
            posScanPlatoonHeaderOffset2.z:=0;
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,4) THEN
        ELSEIF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,6) THEN
            posScanPlatoonHeaderOffset2:=[0,0,0];
        ELSE
            !For only use robot1 data
            useOnlyRobotDataofHeader:=1;
        ENDIF

        IF useOnlyRobotDataofBranch=1 THEN
            posScanPlatoonBranchOffset2:=posScanPlatoonBranchOffset1;
        ELSEIF useOnlyRobotDataofBranch=2 THEN
            posScanPlatoonBranchOffset1:=posScanPlatoonBranchOffset2;
        ENDIF

        IF useOnlyRobotDataofHeader=1 THEN
            posScanPlatoonHeaderOffset2:=posScanPlatoonHeaderOffset1;
        ELSEIF useOnlyRobotDataofHeader=2 THEN
            posScanPlatoonHeaderOffset1:=posScanPlatoonHeaderOffset2;
        ENDIF

        TEST numPlatoonWobjXCalibType
        CASE 1:
            wobjCurrent1.oframe.trans.x:=posScanPlatoonBranchOffset1.x;
        CASE 2:
            wobjCurrent1.oframe.trans.x:=posScanPlatoonHeaderOffset1.x;
        DEFAULT:
            wobjCurrent1.oframe.trans.x:=(posScanPlatoonBranchOffset1.x+posScanPlatoonHeaderOffset1.x)/2;
        ENDTEST
        wobjCurrent1.oframe.trans.y:=posScanPlatoonHeaderOffset1.y;
        wobjCurrent1.oframe.trans.z:=posScanPlatoonBranchOffset1.z+rPipeGrooveModel.numSeamCenterX;
        !wobjCurrent1.oframe.trans.x:=(posScanPlatoonBranchOffset1.x+posScanPlatoonHeaderOffset1.x)/2;
        Logging\INFO,"oframe1="+ValToStr(wobjCurrent1.oframe.trans);

        TEST numPlatoonWobjXCalibType
        CASE 1:
            wobjCurrent2.oframe.trans.x:=posScanPlatoonBranchOffset2.x;
        CASE 2:
            wobjCurrent2.oframe.trans.x:=posScanPlatoonHeaderOffset2.x;
        DEFAULT:
            wobjCurrent2.oframe.trans.x:=(posScanPlatoonBranchOffset2.x+posScanPlatoonHeaderOffset2.x)/2;
        ENDTEST
        wobjCurrent2.oframe.trans.y:=posScanPlatoonHeaderOffset2.y;
        wobjCurrent2.oframe.trans.z:=posScanPlatoonBranchOffset2.z+rPipeGrooveModel.numSeamCenterX;
        !wobjCurrent2.oframe.trans.x:=(posScanPlatoonBranchOffset2.x+posScanPlatoonHeaderOffset2.x)/2;
        Logging\INFO,"oframe2="+ValToStr(wobjCurrent2.oframe.trans);

        wobjCurrent.oframe.trans.x:=(wobjCurrent1.oframe.trans.x+wobjCurrent2.oframe.trans.x)/2;
        wobjCurrent.oframe.trans.y:=(wobjCurrent1.oframe.trans.y+wobjCurrent2.oframe.trans.y)/2;
        wobjCurrent.oframe.trans.z:=(wobjCurrent1.oframe.trans.z+wobjCurrent2.oframe.trans.z)/2;
        UniqueSkillbyFrameOffset;

        Logging\INFO,"oframe="+ValToStr(wobjCurrent.oframe.trans);

        IF BitCheck(rPipeGrooveModel.numReviseScanBranchType,1) OR BitCheck(rPipeGrooveModel.numReviseScanBranchType,2) OR BitCheck(rPipeGrooveModel.numReviseScanHeaderType,1) OR BitCheck(rPipeGrooveModel.numReviseScanHeaderType,2) THEN
            WriteSPWobjOffsetLog;
            WriteSPLog;
        ENDIF

    ENDPROC

    !When you can't find any reason for offset of work ojbect and the offset is stable, you can use this unique skill
    PROC UniqueSkillbyFrameOffset()
        IF rPipeGrooveModel.numPipeGrooveType=3 THEN
            FOR i FROM 1 TO Dim(rFrameOffsetSaddle,1) DO
                IF rPipeGrooveModel.numSeamCenterX>=rFrameOffsetSaddle{i}.numSeamCenterXMin AND rPipeGrooveModel.numSeamCenterX<=rFrameOffsetSaddle{i}.numSeamCenterXMax THEN
                    wobjCurrent.oframe.trans.x:=(wobjCurrent1.oframe.trans.x+wobjCurrent2.oframe.trans.x)/2+rFrameOffsetSaddle{i}.numOffsetX;
                    wobjCurrent.oframe.trans.y:=(wobjCurrent1.oframe.trans.y+wobjCurrent2.oframe.trans.y)/2+rFrameOffsetSaddle{i}.numOffsetY;
                    wobjCurrent.oframe.trans.z:=(wobjCurrent1.oframe.trans.z+wobjCurrent2.oframe.trans.z)/2+rFrameOffsetSaddle{i}.numOffsetZ;
                ENDIF
            ENDFOR
        ELSEIF rPipeGrooveModel.numPipeGrooveType=1 or rPipeGrooveModel.numPipeGrooveType=2 THEN
            FOR i FROM 1 TO Dim(rFrameOffsetPlatoon,1) DO
                IF rPipeGrooveModel.numSeamCenterX>=rFrameOffsetPlatoon{i}.numSeamCenterXMin AND rPipeGrooveModel.numSeamCenterX<=rFrameOffsetPlatoon{i}.numSeamCenterXMax THEN
                    wobjCurrent.oframe.trans.x:=(wobjCurrent1.oframe.trans.x+wobjCurrent2.oframe.trans.x)/2+rFrameOffsetPlatoon{i}.numOffsetX;
                    wobjCurrent.oframe.trans.y:=(wobjCurrent1.oframe.trans.y+wobjCurrent2.oframe.trans.y)/2+rFrameOffsetPlatoon{i}.numOffsetY;
                    wobjCurrent.oframe.trans.z:=(wobjCurrent1.oframe.trans.z+wobjCurrent2.oframe.trans.z)/2+rFrameOffsetPlatoon{i}.numOffsetZ;
                ENDIF
            ENDFOR
        ENDIF
    ENDPROC

    PROC WriteSSWobjOffsetLog()
        Close iodevWobjCurrent;
        IF boolInitSSWobjOffsetLogFile THEN
            Open "HOME:"\File:=strSSWobjOffsetFileName,iodevWobjCurrent;
            Write iodevWobjCurrent,"Time"+strTab+"BranchMethod"+strTab+"HeaderMethod"+strTab+"oframe1.x"+strTab+"oframe1.y"+strTab+"oframe1.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"oframe2.x"+strTab+"oframe2.y"+strTab+"oframe2.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"oframe.x"+strTab+"oframe.y"+strTab+"oframe.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"SSBOffset1.x"+strTab+"SSBOffset1.y"+strTab+"SSBOffset1.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"SSBOffset2.x"+strTab+"SSBOffset2.y"+strTab+"SSBOffset2.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"SSHOffset1.x"+strTab+"SSHOffset1.y"+strTab+"SSHOffset1.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"SSHOffset2.x"+strTab+"SSHOffset2.y"+strTab+"SSHOffset2.z";
            boolInitSSWobjOffsetLogFile:=FALSE;
        ELSE
            Open "HOME:"\File:=strSSWobjOffsetFileName,iodevWobjCurrent\Append;
        ENDIF
        Write iodevWobjCurrent,CDate()+" "+CTime()+strTab+ValToStr(numScanSaddleBranchMethod)+strTab+ValToStr(numScanSaddleHeaderMethod)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent1.oframe.trans.x)+strTab+ValToStr(wobjCurrent1.oframe.trans.y)+strTab+ValToStr(wobjCurrent1.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent2.oframe.trans.x)+strTab+ValToStr(wobjCurrent2.oframe.trans.y)+strTab+ValToStr(wobjCurrent2.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent.oframe.trans.x)+strTab+ValToStr(wobjCurrent.oframe.trans.y)+strTab+ValToStr(wobjCurrent.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posScanSaddleBranchOffset1.x)+strTab+ValToStr(posScanSaddleBranchOffset1.y)+strTab+ValToStr(posScanSaddleBranchOffset1.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posScanSaddleBranchOffset2.x)+strTab+ValToStr(posScanSaddleBranchOffset2.y)+strTab+ValToStr(posScanSaddleBranchOffset2.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posScanSaddleHeaderOffset1.x)+strTab+ValToStr(posScanSaddleHeaderOffset1.y)+strTab+ValToStr(posScanSaddleHeaderOffset1.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posScanSaddleHeaderOffset2.x)+strTab+ValToStr(posScanSaddleHeaderOffset2.y)+strTab+ValToStr(posScanSaddleHeaderOffset2.z);
        Close iodevWobjCurrent;
    ENDPROC

    PROC WriteSPWobjOffsetLog()
        Close iodevWobjCurrent;
        IF boolInitSPWobjOffsetLogFile THEN
            Open "HOME:"\File:=strSPWobjOffsetFileName,iodevWobjCurrent;
            Write iodevWobjCurrent,"Time"+strTab+"BranchMethod"+strTab+"HeaderMethod"+strTab+"oframe1.x"+strTab+"oframe1.y"+strTab+"oframe1.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"oframe2.x"+strTab+"oframe2.y"+strTab+"oframe2.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"oframe.x"+strTab+"oframe.y"+strTab+"oframe.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"SPBOffset1.x"+strTab+"SPBOffset1.y"+strTab+"SPBOffset1.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"SPBOffset2.x"+strTab+"SPBOffset2.y"+strTab+"SPBOffset2.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"SPHOffset1.x"+strTab+"SPHOffset1.y"+strTab+"SPHOffset1.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"SPHOffset2.x"+strTab+"SPHOffset2.y"+strTab+"SPHOffset2.z";
            boolInitSPWobjOffsetLogFile:=FALSE;
        ELSE
            Open "HOME:"\File:=strSPWobjOffsetFileName,iodevWobjCurrent\Append;
        ENDIF
        Write iodevWobjCurrent,CDate()+" "+CTime()+strTab+ValToStr(numScanPlatoonBranchMethod)+strTab+ValToStr(numScanPlatoonHeaderMethod)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent1.oframe.trans.x)+strTab+ValToStr(wobjCurrent1.oframe.trans.y)+strTab+ValToStr(wobjCurrent1.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent2.oframe.trans.x)+strTab+ValToStr(wobjCurrent2.oframe.trans.y)+strTab+ValToStr(wobjCurrent2.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent.oframe.trans.x)+strTab+ValToStr(wobjCurrent.oframe.trans.y)+strTab+ValToStr(wobjCurrent.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posScanPlatoonBranchOffset1.x)+strTab+ValToStr(posScanPlatoonBranchOffset1.y)+strTab+ValToStr(posScanPlatoonBranchOffset1.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posScanPlatoonBranchOffset2.x)+strTab+ValToStr(posScanPlatoonBranchOffset2.y)+strTab+ValToStr(posScanPlatoonBranchOffset2.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posScanPlatoonHeaderOffset1.x)+strTab+ValToStr(posScanPlatoonHeaderOffset1.y)+strTab+ValToStr(posScanPlatoonHeaderOffset1.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posScanPlatoonHeaderOffset2.x)+strTab+ValToStr(posScanPlatoonHeaderOffset2.y)+strTab+ValToStr(posScanPlatoonHeaderOffset2.z);
        Close iodevWobjCurrent;
    ENDPROC

    PROC WriteScanSaddleWobjLog()
        Close iodevWobjCurrent;
        IF boolInitSaddleWobjLogFile THEN
            Open "HOME:"\File:=strScanSaddleWobjLogFileName,iodevWobjCurrent;
            Write iodevWobjCurrent,"Time"+strTab+"BranchMethod"+strTab+"HeaderMethod"+strTab+"oframe1.x"+strTab+"oframe1.y"+strTab+"oframe1.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"oframe2.x"+strTab+"oframe2.y"+strTab+"oframe2.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"deviation.x"+strTab+"deviation.y"+strTab+"deviation.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"oframe.x"+strTab+"oframe.y"+strTab+"oframe.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Branch.y"+strTab+"Rob1Header.y"+strTab+"Rob1Average.y"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Branch.y"+strTab+"Rob2Header.y"+strTab+"Rob2Average.y"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Branch.radius"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Branch.normal.x"+strTab+"Rob1Branch.normal.y"+strTab+"Rob1Branch.normal.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Branch.rms"+strTab+"Rob1Branch.maxErr"+strTab+"Rob1Branch.indexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Branch.radius"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Branch.normal.x"+strTab+"Rob2Branch.normal.y"+strTab+"Rob2Branch.normal.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Branch.rms"+strTab+"Rob2Branch.maxErr"+strTab+"Rob2Branch.indexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Header.radius"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Header.normal.x"+strTab+"Rob1Header.normal.y"+strTab+"Rob1Header.normal.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Header.rms"+strTab+"Rob1Header.maxErr"+strTab+"Rob1Header.indexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Header.radius"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Header.normal.x"+strTab+"Rob2Header.normal.y"+strTab+"Rob2Header.normal.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Header.rms"+strTab+"Rob2Header.maxErr"+strTab+"Rob2Header.indexWorst";
            boolInitSaddleWobjLogFile:=FALSE;
        ELSE
            Open "HOME:"\File:=strScanSaddleWobjLogFileName,iodevWobjCurrent\Append;
        ENDIF
        Write iodevWobjCurrent,CDate()+" "+CTime()+strTab+ValToStr(numScanSaddleBranchMethod)+strTab+ValToStr(numScanSaddleHeaderMethod)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent1.oframe.trans.x)+strTab+ValToStr(wobjCurrent1.oframe.trans.y)+strTab+ValToStr(wobjCurrent1.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent2.oframe.trans.x)+strTab+ValToStr(wobjCurrent2.oframe.trans.y)+strTab+ValToStr(wobjCurrent2.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent2.oframe.trans.x-wobjCurrent1.oframe.trans.x)+strTab+ValToStr(wobjCurrent2.oframe.trans.y-wobjCurrent1.oframe.trans.y)+strTab+ValToStr(wobjCurrent2.oframe.trans.z-wobjCurrent1.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent.oframe.trans.x)+strTab+ValToStr(wobjCurrent.oframe.trans.y)+strTab+ValToStr(wobjCurrent.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SSBCenter.y)+strTab+ValToStr(posRob1SSHCenter.y)+strTab+ValToStr((posRob1SSBCenter.y+posRob1SSHCenter.y)/2)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SSBCenter.y)+strTab+ValToStr(posRob2SSHCenter.y)+strTab+ValToStr((posRob2SSBCenter.y+posRob2SSHCenter.y)/2)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob1SSBRadius)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SSBnormal.x)+strTab+ValToStr(posRob1SSBnormal.y)+strTab+ValToStr(posRob1SSBnormal.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob1SSBrms)+strTab+ValToStr(numRob1SSBmaxErr)+strTab+ValToStr(numRob1SSBindexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob2SSBRadius)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SSBnormal.x)+strTab+ValToStr(posRob2SSBnormal.y)+strTab+ValToStr(posRob2SSBnormal.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob2SSBrms)+strTab+ValToStr(numRob2SSBmaxErr)+strTab+ValToStr(numRob2SSBindexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob1SSHRadius)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SSHnormal.x)+strTab+ValToStr(posRob1SSHnormal.y)+strTab+ValToStr(posRob1SSHnormal.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob1SSHrms)+strTab+ValToStr(numRob1SSHmaxErr)+strTab+ValToStr(numRob1SSHindexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob2SSHRadius)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SSHnormal.x)+strTab+ValToStr(posRob2SSHnormal.y)+strTab+ValToStr(posRob2SSHnormal.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob2SSHrms)+strTab+ValToStr(numRob2SSHmaxErr)+strTab+ValToStr(numRob2SSHindexWorst);
        Close iodevWobjCurrent;
    ENDPROC

    PROC WriteScanPlatoonWobjLog()
        Close iodevWobjCurrent;
        IF boolInitPlatoonWobjLogFile THEN
            Open "HOME:"\File:=strScanPlatoonWobjLogFileName,iodevWobjCurrent;
            Write iodevWobjCurrent,"Time"+strTab+"BranchMethod"+strTab+"HeaderMethod"+strTab+"oframe1.x"+strTab+"oframe1.y"+strTab+"oframe1.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"oframe2.x"+strTab+"oframe2.y"+strTab+"oframe2.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"deviation.x"+strTab+"deviation.y"+strTab+"deviation.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"oframe.x"+strTab+"oframe.y"+strTab+"oframe.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Branch.y"+strTab+"Rob1Header.y"+strTab+"Rob1Average.y"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Branch.y"+strTab+"Rob2Header.y"+strTab+"Rob2Average.y"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Branch.radius"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Branch.normal.x"+strTab+"Rob1Branch.normal.y"+strTab+"Rob1Branch.normal.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Branch.rms"+strTab+"Rob1Branch.maxErr"+strTab+"Rob1Branch.indexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Branch.radius"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Branch.normal.x"+strTab+"Rob2Branch.normal.y"+strTab+"Rob2Branch.normal.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Branch.rms"+strTab+"Rob2Branch.maxErr"+strTab+"Rob2Branch.indexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Header.radius"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Header.normal.x"+strTab+"Rob1Header.normal.y"+strTab+"Rob1Header.normal.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Header.rms"+strTab+"Rob1Header.maxErr"+strTab+"Rob1Header.indexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Header.radius"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Header.normal.x"+strTab+"Rob2Header.normal.y"+strTab+"Rob2Header.normal.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Header.rms"+strTab+"Rob2Header.maxErr"+strTab+"Rob2Header.indexWorst";
            boolInitPlatoonWobjLogFile:=FALSE;
        ELSE
            Open "HOME:"\File:=strScanPlatoonWobjLogFileName,iodevWobjCurrent\Append;
        ENDIF
        Write iodevWobjCurrent,CDate()+" "+CTime()+strTab+ValToStr(numScanPlatoonBranchMethod)+strTab+ValToStr(numScanPlatoonHeaderMethod)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent1.oframe.trans.x)+strTab+ValToStr(wobjCurrent1.oframe.trans.y)+strTab+ValToStr(wobjCurrent1.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent2.oframe.trans.x)+strTab+ValToStr(wobjCurrent2.oframe.trans.y)+strTab+ValToStr(wobjCurrent2.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent2.oframe.trans.x-wobjCurrent1.oframe.trans.x)+strTab+ValToStr(wobjCurrent2.oframe.trans.y-wobjCurrent1.oframe.trans.y)+strTab+ValToStr(wobjCurrent2.oframe.trans.z-wobjCurrent1.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(wobjCurrent.oframe.trans.x)+strTab+ValToStr(wobjCurrent.oframe.trans.y)+strTab+ValToStr(wobjCurrent.oframe.trans.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SPBCenter.y)+strTab+ValToStr(posRob1SPHCenter.y)+strTab+ValToStr((posRob1SPBCenter.y+posRob1SPHCenter.y)/2)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SPBCenter.y)+strTab+ValToStr(posRob2SPHCenter.y)+strTab+ValToStr((posRob2SPBCenter.y+posRob2SPHCenter.y)/2)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob1SPBRadius)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SPBnormal.x)+strTab+ValToStr(posRob1SPBnormal.y)+strTab+ValToStr(posRob1SPBnormal.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob1SPBrms)+strTab+ValToStr(numRob1SPBmaxErr)+strTab+ValToStr(numRob1SPBindexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob2SPBRadius)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SPBnormal.x)+strTab+ValToStr(posRob2SPBnormal.y)+strTab+ValToStr(posRob2SPBnormal.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob2SPBrms)+strTab+ValToStr(numRob2SPBmaxErr)+strTab+ValToStr(numRob2SPBindexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob1SPHRadius)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SPHnormal.x)+strTab+ValToStr(posRob1SPHnormal.y)+strTab+ValToStr(posRob1SPHnormal.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob1SPHrms)+strTab+ValToStr(numRob1SPHmaxErr)+strTab+ValToStr(numRob1SPHindexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob2SPHRadius)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SPHnormal.x)+strTab+ValToStr(posRob2SPHnormal.y)+strTab+ValToStr(posRob2SPHnormal.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob2SPHrms)+strTab+ValToStr(numRob2SPHmaxErr)+strTab+ValToStr(numRob2SPHindexWorst);
        Close iodevWobjCurrent;
    ENDPROC

    PROC WriteSPLog()
        Close iodevWobjCurrent;
        IF boolInitSPLogFile THEN
            Open "HOME:"\File:=strSPFileName,iodevWobjCurrent;
            Write iodevWobjCurrent,"Time"+strTab+"BranchMethod"+strTab+"HeaderMethod"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Branch.x"+strTab+"Rob1Branch.y"+strTab+"Rob1Branch.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1PeripheryCenter.x"+strTab+"Rob1PeripheryCenter.y"+strTab+"Rob1PeripheryCenter.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Branch.radius"+strTab+"Rob1Branch.Rms"+strTab+"Rob1Branch.MaxErr"+strTab+"Rob1Branch.IndexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"posRob1SPBLLSClosest.y"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Header.x"+strTab+"Rob1Header.y"+strTab+"Rob1Header.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1PeripheryCenter.x"+strTab+"Rob1PeripheryCenter.y"+strTab+"Rob1PeripheryCenter.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Header.radius"+strTab+"Rob1Header.Rms"+strTab+"Rob1Header.MaxErr"+strTab+"Rob1Header.IndexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"posRob1SPHLLSClosest.y"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Branch.x"+strTab+"Rob2Branch.y"+strTab+"Rob2Branch.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2PeripheryCenter.x"+strTab+"Rob2PeripheryCenter.y"+strTab+"Rob2PeripheryCenter.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Branch.radius"+strTab+"Rob2Branch.Rms"+strTab+"Rob2Branch.MaxErr"+strTab+"Rob2Branch.IndexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"posRob2SPBLLSClosest.y"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Header.x"+strTab+"Rob2Header.y"+strTab+"Rob2Header.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2PeripheryCenter.x"+strTab+"Rob2PeripheryCenter.y"+strTab+"Rob2PeripheryCenter.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Header.radius"+strTab+"Rob2Header.Rms"+strTab+"Rob2Header.MaxErr"+strTab+"Rob2Header.IndexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"posRob2SPHLLSClosest.y";
            boolInitSPLogFile:=FALSE;
        ELSE
            Open "HOME:"\File:=strSPFileName,iodevWobjCurrent\Append;
        ENDIF
        Write iodevWobjCurrent,CDate()+" "+CTime()+strTab+ValToStr(numScanPlatoonBranchMethod)+strTab+ValToStr(numScanPlatoonHeaderMethod)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SPBCenter.x)+strTab+ValToStr(posRob1SPBCenter.y)+strTab+ValToStr(posRob1SPBCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SPBPeripheryCenter.x)+strTab+ValToStr(posRob1SPBPeripheryCenter.y)+strTab+ValToStr(posRob1SPBPeripheryCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob1SPBRadius)+strTab+ValToStr(numRob1SPBRms)+strTab+ValToStr(numRob1SPBMaxErr)+strTab+ValToStr(numRob1SPBIndexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SPBLLSClosest.y)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SPHCenter.x)+strTab+ValToStr(posRob1SPHCenter.y)+strTab+ValToStr(posRob1SPHCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SPHPeripheryCenter.x)+strTab+ValToStr(posRob1SPHPeripheryCenter.y)+strTab+ValToStr(posRob1SPHPeripheryCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob1SPHRadius)+strTab+ValToStr(numRob1SPHRms)+strTab+ValToStr(numRob1SPHMaxErr)+strTab+ValToStr(numRob1SPHIndexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SPHLLSClosest.y)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SPBCenter.x)+strTab+ValToStr(posRob2SPBCenter.y)+strTab+ValToStr(posRob2SPBCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SPBPeripheryCenter.x)+strTab+ValToStr(posRob2SPBPeripheryCenter.y)+strTab+ValToStr(posRob2SPBPeripheryCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob2SPBRadius)+strTab+ValToStr(numRob2SPBRms)+strTab+ValToStr(numRob2SPBMaxErr)+strTab+ValToStr(numRob2SPBIndexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SPBLLSClosest.y)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SPHCenter.x)+strTab+ValToStr(posRob2SPHCenter.y)+strTab+ValToStr(posRob2SPHCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SPHPeripheryCenter.x)+strTab+ValToStr(posRob2SPHPeripheryCenter.y)+strTab+ValToStr(posRob2SPHPeripheryCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob2SPHRadius)+strTab+ValToStr(numRob2SPHRms)+strTab+ValToStr(numRob2SPHMaxErr)+strTab+ValToStr(numRob2SPHIndexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SPHLLSClosest.y);
        Close iodevWobjCurrent;

    ENDPROC

    PROC WriteSSLog()
        Close iodevWobjCurrent;
        IF boolInitSSLogFile THEN
            Open "HOME:"\File:=strSSFileName,iodevWobjCurrent;
            Write iodevWobjCurrent,"Time"+strTab+"BranchMethod"+strTab+"HeaderMethod"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Branch.x"+strTab+"Rob1Branch.y"+strTab+"Rob1Branch.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1PeripheryCenter.x"+strTab+"Rob1PeripheryCenter.y"+strTab+"Rob1PeripheryCenter.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Branch.radius"+strTab+"Rob1Branch.Rms"+strTab+"Rob1Branch.MaxErr"+strTab+"Rob1Branch.IndexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"posRob1SSBLLSClosest.y"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Header.x"+strTab+"Rob1Header.y"+strTab+"Rob1Header.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1PeripheryCenter.x"+strTab+"Rob1PeripheryCenter.y"+strTab+"Rob1PeripheryCenter.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob1Header.radius"+strTab+"Rob1Header.Rms"+strTab+"Rob1Header.MaxErr"+strTab+"Rob1Header.IndexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"posRob1SSHLLSClosest.y"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Branch.x"+strTab+"Rob2Branch.y"+strTab+"Rob2Branch.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2PeripheryCenter.x"+strTab+"Rob2PeripheryCenter.y"+strTab+"Rob2PeripheryCenter.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Branch.radius"+strTab+"Rob2Branch.Rms"+strTab+"Rob2Branch.MaxErr"+strTab+"Rob2Branch.IndexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"posRob2SSBLLSClosest.y"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Header.x"+strTab+"Rob2Header.y"+strTab+"Rob2Header.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2PeripheryCenter.x"+strTab+"Rob2PeripheryCenter.y"+strTab+"Rob2PeripheryCenter.z"\NoNewLine;
            Write iodevWobjCurrent,strTab+"Rob2Header.radius"+strTab+"Rob2Header.Rms"+strTab+"Rob2Header.MaxErr"+strTab+"Rob2Header.IndexWorst"\NoNewLine;
            Write iodevWobjCurrent,strTab+"posRob2SSHLLSClosest.y";
            boolInitSSLogFile:=FALSE;
        ELSE
            Open "HOME:"\File:=strSSFileName,iodevWobjCurrent\Append;
        ENDIF
        Write iodevWobjCurrent,CDate()+" "+CTime()+strTab+ValToStr(numScanSaddleBranchMethod)+strTab+ValToStr(numScanSaddleHeaderMethod)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SSBCenter.x)+strTab+ValToStr(posRob1SSBCenter.y)+strTab+ValToStr(posRob1SSBCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SSBPeripheryCenter.x)+strTab+ValToStr(posRob1SSBPeripheryCenter.y)+strTab+ValToStr(posRob1SSBPeripheryCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob1SSBRadius)+strTab+ValToStr(numRob1SSBRms)+strTab+ValToStr(numRob1SSBMaxErr)+strTab+ValToStr(numRob1SSBIndexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SSBLLSClosest.y)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SSHCenter.x)+strTab+ValToStr(posRob1SSHCenter.y)+strTab+ValToStr(posRob1SSHCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SSHPeripheryCenter.x)+strTab+ValToStr(posRob1SSHPeripheryCenter.y)+strTab+ValToStr(posRob1SSHPeripheryCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob1SSHRadius)+strTab+ValToStr(numRob1SSHRms)+strTab+ValToStr(numRob1SSHMaxErr)+strTab+ValToStr(numRob1SSHIndexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob1SSHLLSClosest.y)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SSBCenter.x)+strTab+ValToStr(posRob2SSBCenter.y)+strTab+ValToStr(posRob2SSBCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SSBPeripheryCenter.x)+strTab+ValToStr(posRob2SSBPeripheryCenter.y)+strTab+ValToStr(posRob2SSBPeripheryCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob2SSBRadius)+strTab+ValToStr(numRob2SSBRms)+strTab+ValToStr(numRob2SSBMaxErr)+strTab+ValToStr(numRob2SSBIndexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SSBLLSClosest.y)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SSHCenter.x)+strTab+ValToStr(posRob2SSHCenter.y)+strTab+ValToStr(posRob2SSHCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SSHPeripheryCenter.x)+strTab+ValToStr(posRob2SSHPeripheryCenter.y)+strTab+ValToStr(posRob2SSHPeripheryCenter.z)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(numRob2SSHRadius)+strTab+ValToStr(numRob2SSHRms)+strTab+ValToStr(numRob2SSHMaxErr)+strTab+ValToStr(numRob2SSHIndexWorst)\NoNewLine;
        Write iodevWobjCurrent,strTab+ValToStr(posRob2SSHLLSClosest.y);
        Close iodevWobjCurrent;
    ENDPROC

    PROC WriteLayerParameterLog(RECORDPipeGrooveModel rPipeGrooveModelLog,RECORDLayerParamter rLayerParameterLog\string PipeGrooveModelName\string LayerParameterName)
        VAR string strPipeGrooveModelName;
        VAR string strLayerParameterName;
        IF Present(PipeGrooveModelName) THEN
            strPipeGrooveModelName:=PipeGrooveModelName;
        ELSE
            strPipeGrooveModelName:=ArgName(rPipeGrooveModelLog);
        ENDIF
        IF Present(LayerParameterName) THEN
            strLayerParameterName:=LayerParameterName;
        ELSE
            strLayerParameterName:=ArgName(rLayerParameterLog);
        ENDIF
        Close iodevLayerParameterLog;
        IF boolInitLayerParameterLogFile THEN
            Open "HOME:"\File:=strLayerParameterLogFileName,iodevLayerParameterLog;
            Write iodevLayerParameterLog,"Time"+strTab+"PipeGrooveModelName"+strTab+"LayerParamterName"\NoNewLine;
            Write iodevLayerParameterLog,strTab+"WorkAngleDeclination"+strTab+"WeldProcedureID"\NoNewLine;
            Write iodevLayerParameterLog,strTab+"OffsetX.Degree0"+strTab+"OffsetX.Degree90"+strTab+"OffsetX.Degree180"\NoNewLine;
            Write iodevLayerParameterLog,strTab+"OffsetX.Degree270"+strTab+"OffsetX.CurveType"\NoNewLine;
            Write iodevLayerParameterLog,strTab+"OffsetZ.Degree0"+strTab+"OffsetZ.Degree90"+strTab+"OffsetZ.Degree180"\NoNewLine;
            Write iodevLayerParameterLog,strTab+"OffsetZ.Degree270"+strTab+"OffsetZ.CurveType"\NoNewLine;
            Write iodevLayerParameterLog,strTab+"RotationX.Degree0"+strTab+"RotationX.Degree90"+strTab+"RotationX.Degree180"\NoNewLine;
            Write iodevLayerParameterLog,strTab+"RotationX.Degree270"+strTab+"RotationX.CurveType"\NoNewLine;
            Write iodevLayerParameterLog,strTab+"RotationY.Degree0"+strTab+"RotationY.Degree90"+strTab+"RotationY.Degree180"\NoNewLine;
            Write iodevLayerParameterLog,strTab+"RotationY.Degree270"+strTab+"RotationY.CurveType"\NoNewLine;
            Write iodevLayerParameterLog,strTab+"RotationZ.Degree0"+strTab+"RotationZ.Degree90"+strTab+"RotationZ.Degree180"\NoNewLine;
            Write iodevLayerParameterLog,strTab+"RotationZ.Degree270"+strTab+"RotationZ.CurveType";
            boolInitLayerParameterLogFile:=FALSE;
        ELSE
            Open "HOME:"\File:=strLayerParameterLogFileName,iodevLayerParameterLog\Append;
        ENDIF
        Write iodevLayerParameterLog,CDate()+" "+CTime()+strTab+strPipeGrooveModelName+strTab+strLayerParameterName\NoNewLine;
        Write iodevLayerParameterLog,strTab+ValToStr(rLayerParameterLog.numWorkAngleDeclination)+strTab+rLayerParameterLog.strWeldProcedureID\NoNewLine;
        Write iodevLayerParameterLog,strTab+ValToStr(rLayerParameterLog.rCircleOffsetX.numDegree0)+strTab+ValToStr(rLayerParameterLog.rCircleOffsetX.numDegree90)+strTab+ValToStr(rLayerParameterLog.rCircleOffsetX.numDegree180)+strTab+ValToStr(rLayerParameterLog.rCircleOffsetX.numDegree270)+strTab+ValToStr(rLayerParameterLog.rCircleOffsetX.numCurveType)\NoNewLine;
        Write iodevLayerParameterLog,strTab+ValToStr(rLayerParameterLog.rCircleOffsetZ.numDegree0)+strTab+ValToStr(rLayerParameterLog.rCircleOffsetZ.numDegree90)+strTab+ValToStr(rLayerParameterLog.rCircleOffsetZ.numDegree180)+strTab+ValToStr(rLayerParameterLog.rCircleOffsetZ.numDegree270)+strTab+ValToStr(rLayerParameterLog.rCircleOffsetZ.numCurveType)\NoNewLine;
        Write iodevLayerParameterLog,strTab+ValToStr(rLayerParameterLog.rCircleRotationX.numDegree0)+strTab+ValToStr(rLayerParameterLog.rCircleRotationX.numDegree90)+strTab+ValToStr(rLayerParameterLog.rCircleRotationX.numDegree180)+strTab+ValToStr(rLayerParameterLog.rCircleRotationX.numDegree270)+strTab+ValToStr(rLayerParameterLog.rCircleRotationX.numCurveType)\NoNewLine;
        Write iodevLayerParameterLog,strTab+ValToStr(rLayerParameterLog.rCircleRotationY.numDegree0)+strTab+ValToStr(rLayerParameterLog.rCircleRotationY.numDegree90)+strTab+ValToStr(rLayerParameterLog.rCircleRotationY.numDegree180)+strTab+ValToStr(rLayerParameterLog.rCircleRotationY.numDegree270)+strTab+ValToStr(rLayerParameterLog.rCircleRotationY.numCurveType)\NoNewLine;
        Write iodevLayerParameterLog,strTab+ValToStr(rLayerParameterLog.rCircleRotationZ.numDegree0)+strTab+ValToStr(rLayerParameterLog.rCircleRotationZ.numDegree90)+strTab+ValToStr(rLayerParameterLog.rCircleRotationZ.numDegree180)+strTab+ValToStr(rLayerParameterLog.rCircleRotationZ.numDegree270)+strTab+ValToStr(rLayerParameterLog.rCircleRotationZ.numCurveType);
        Close iodevLayerParameterLog;
    ENDPROC

ENDMODULE
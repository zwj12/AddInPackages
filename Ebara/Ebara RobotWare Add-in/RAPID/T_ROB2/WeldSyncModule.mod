MODULE WeldSyncModule
    !*****************************************************
    !Module Name: WeldSyncModule
    !Version:     1.0
    !Description: -
    !Date:        2018-8-10
    !Author:      Michael
    !*****************************************************

    PERS bool boolScanWobjEnable:=FALSE;
    PERS bool boolUseRespectiveWobj:=FALSE;
    PERS bool boolReverseWeldDirection:=FALSE;

    PROC MultiPassWeldSync()
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

        TEST rPipeGrooveModel.numCooperativeRobots
        CASE 1:
        CASE 2:
            taskListCurrent:=[[""],["T_ROB2"],[""]];
            WeldPlatoon;
        CASE 3:
            taskListCurrent:=[["T_Rob1"],["T_ROB2"],[""]];
            WeldPlatoon;
        CASE 5:
        CASE 6:
            taskListCurrent:=[[""],["T_ROB2"],["T_POS1"]];
            WeldSaddle;
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

    PROC UpdateWobjAndTrack()
        VAR pose oframeTemp;

        UpdateTrackAndViaPoints;

        WaitSyncTask SyncWobjScanning,taskListRob1Rob2Pos1;
        IF rPipeGrooveModel.numCooperativeRobots>3 THEN
            ScanSaddleWobj;
        ELSE
            !ScanPlatoonSinkingWobj;
            !Michael, 2019-2-21, Switch to ScanV2
            ScanPlatoon;
        ENDIF
        WaitSyncTask SyncWobjScaned,taskListRob1Rob2Pos1;

        WaitSyncTask SyncWobjRevised,taskListRob1Rob2Pos1;
    ENDPROC
ENDMODULE
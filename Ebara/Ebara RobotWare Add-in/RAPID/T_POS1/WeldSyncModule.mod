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
    PERS zonedata zoneWeldSTN1:=[FALSE,100,150,150,15,150,15];

    PROC MultiPassWeldSync()
        zoneWeldSTN1:=z100;
        MovetoHome;
        WaitSyncTask SyncPositionerHomed,taskListRob1Rob2Pos1;

        IF NOT boolKeepLastWobj THEN
            UpdateWobjAndTrack;
        ENDIF

        TEST rPipeGrooveModel.numCooperativeRobots
        CASE 1:
        CASE 2:
        CASE 3:
        CASE 5:
            taskListCurrent:=[["T_ROB1"],[""],["T_POS1"]];
            WeldSaddle;
        CASE 6:
            taskListCurrent:=[[""],["T_ROB2"],["T_POS1"]];
            WeldSaddle;
        ENDTEST

        MovetoHome;

    ENDPROC

    PROC WeldSaddle()
        FOR i FROM numLayerNoStart TO rPipeGrooveModel.numMultiPassTotal STEP 1 DO
            numCurrentLayerNo:=i;
            IF rPipeGrooveModel.boolContinuous=TRUE THEN
                IF numLayerNoStart>=rPipeGrooveModel.numMultiPassTotal THEN
                    WeldLayerSynchForPOS\Start\End;
                ELSEIF i=numLayerNoStart THEN
                    WeldLayerSynchForPOS\Start;
                ELSEIF i>=rPipeGrooveModel.numMultiPassTotal THEN
                    WeldLayerSynchForPOS\End;
                ELSE
                    WeldLayerSynchForPOS;
                ENDIF
            ELSE
                WeldLayerSynchForPOS\Start\End;
            ENDIF
        ENDFOR
    ENDPROC

    PROC UpdateWobjAndTrack()
        !        IF boolScanWobjEnable THEN
        !            WaitSyncTask SyncWobjScanning,taskListRob1Rob2Pos1;
        !            WaitSyncTask SyncWobjBranchScaned,taskListRob1Rob2Pos1;
        !            WaitSyncTask SyncWobjScaned,taskListRob1Rob2Pos1;
        !        ENDIF
        WaitSyncTask SyncWobjScanning,taskListRob1Rob2Pos1;
        WaitSyncTask SyncWobjBranchScaned,taskListRob1Rob2Pos1;
        WaitSyncTask SyncWobjScaned,taskListRob1Rob2Pos1;
        WaitSyncTask SyncWobjRevised,taskListRob1Rob2Pos1;
    ENDPROC

ENDMODULE
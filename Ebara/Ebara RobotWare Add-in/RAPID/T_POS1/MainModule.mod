MODULE MainModule

    PERS ee_event ee_eventStart:=[1,"EBARAInitialize","T_ROB1:T_ROB2:T_POS1",0,1];
    PERS ee_event ee_eventCycleStart:=[2,"EBARACycleStart","T_ROB1:T_ROB2:T_POS1",0,1];
    PERS ee_event ee_eventPreProd:=[4,"EBARAPreProd","T_ROB1:T_ROB2:T_POS1",0,1];
    PERS ee_event ee_eventPostProd:=[11,"EBARAPostProd","T_ROB1:T_ROB2:T_POS1",0,1];
    PERS bool bSafeMutex:=FALSE;
    PERS num numPlatoonSinkingTotal:=1;
    PERS num numPlatoonSinkingMidIndex:=13;

    PROC main()
        !jointHome3:=jointOrigin3;
        !TestScanWobjAccuracy;
        ActUnit STN1;
        ExecEngine;
    ENDPROC

    !Use the rPipeGrooveModel.numSeamNormalAngle to check the home position
    PROC EBARAInitialize()
        VAR jointtarget jointSTN1Cur;
        VAR bool bRelSafeMutex;
        VAR string sHeader;
        VAR num nAnswer;
        VAR string stButtons{2}:=["MANUAL","AUTO"];
        VAR string stMsgArray1{6}:=["Robot not in home position","Please choose MANUAL or AUTO","","MANUAL => move robot by joystick to home position","","AUTO   => robot moves directly to home position"];

        strCurTaskName:="T_POS1";
        numCurTaskNo:=3;
        SaveModule;

        jointHome3.extax.eax_b:=rPipeGrooveModel.numSeamNormalAngle;
        IF RobOS()=FALSE THEN
            MovetoHome;
        ELSE
            WaitTestAndSet bSafeMutex;
            bRelSafeMutex:=TRUE;

            ActUnit STN1;
            jointSTN1Cur:=CJointT();
            WHILE (Abs(jointSTN1Cur.extax.eax_a-jointHome3.extax.eax_a)>1 OR Abs(jointSTN1Cur.extax.eax_b-jointHome3.extax.eax_b)>1) DO
                !WHILE Abs(jointSTN1Cur.extax.eax_a-jointHome3.extax.eax_a)>1 DO
                sHeader:="Home position ("+GetTaskName()+")";
                nAnswer:=UIMessageBox(\Header:=sHeader\MsgArray:=stMsgArray1\BtnArray:=stButtons\Icon:=iconWarning);
                IF (nAnswer=1) THEN
                    Stop\AllMoveTasks;
                    TPErase;
                    !! jog to safe position
                ELSE
                    MovetoHome;
                ENDIF
                jointSTN1Cur:=CJointT();
            ENDWHILE
            DeactUnit STN1;

            bSafeMutex:=FALSE;
            bRelSafeMutex:=FALSE;
        ENDIF

        SetTPHandlerLogLevel\INFO;
        SetFileHandlerLogLevel\DEBUG;
        Logging\INFO,"EBARAInitialize of "+PMgrTaskName();

    UNDO
        IF (bRelSafeMutex) bSafeMutex:=FALSE;
    ENDPROC

    PROC MovetoHome(\switch Deactive)
        VAR num numTrackPositionCur;
        IF NOT IsMechUnitActive(STN1) THEN
            ActUnit STN1;
        ENDIF

        jointHome3.extax.eax_b:=rPipeGrooveModel.numSeamNormalAngle;
        MoveExtJ jointHome3,speedAir,fine;
        IF Present(Deactive) THEN
            DeactUnit STN1;
        ENDIF
    ENDPROC

    !The user must get the precise value of numGrooveAngle
    !The positioner will align the branch pipe with vertical base on the numGrooveAngle value
    PROC EBARACycleStart()
        PMgrGetNextPart numStation,pdTmpChk\InstanceName:=sPartDataName;
        jointHome3.extax.eax_b:=rPipeGrooveModel.numSeamNormalAngle;
        Logging\INFO,"EBARACycleStart of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
    ENDPROC

    PROC EBARAPreProd()
        Logging\INFO,"EBARAPreProd of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
    ENDPROC

    !    PROC BeforePart()
    !        Logging\INFO, "BeforePart of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
    !    ENDPROC

    !    PROC AfterPart()
    !        Logging\INFO, "AfterPart of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
    !    ENDPROC

    PROC EBARAPostProd()
        Logging\INFO,"EBARAPostProd of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName\CloseFile;
    ENDPROC

    !Below part routines are for testing
    PROC PlatoonSinking()
        Logging\INFO,"PlatoonSinking of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
        FOR i FROM 1 TO numPlatoonSinkingTotal DO
            WaitSyncTask SyncRobotsForTest11,taskListRob1Rob2Pos1;
            MultiPassWeldSync;
        ENDFOR
    ENDPROC

    PROC PlatoonSinking2()
        Logging\INFO,"PlatoonSinking of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
        FOR i FROM 1 TO numPlatoonSinkingTotal DO
            WaitSyncTask SyncRobotsForTest12,taskListRob1Rob2Pos1;
            MultiPassWeldSync;
        ENDFOR
    ENDPROC

    PROC SaddleWeld()
        Logging\INFO,"SaddleWeld of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;

        WaitSyncTask SyncRobotsForTest21,taskListRob1Rob2Pos1;
        MultiPassWeldSync;
    ENDPROC

    PROC SaddleWeld2()
        Logging\INFO,"SaddleWeld of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;

        WaitSyncTask SyncRobotsForTest22,taskListRob1Rob2Pos1;
        MultiPassWeldSync;
    ENDPROC

    PROC SaddleWeld3()
        Logging\INFO,"SaddleWeld of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;

        WaitSyncTask SyncRobotsForTest23,taskListRob1Rob2Pos1;
        MultiPassWeldSync;
    ENDPROC

    PROC SaddleWeld4()
        Logging\INFO,"SaddleWeld of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
        FOR i FROM 1 TO 1 DO
            WaitSyncTask SyncRobotsForTest24,taskListRob1Rob2Pos1;
            MultiPassWeldSync;
        ENDFOR
    ENDPROC

    PROC SaddleWeld5()
        Logging\INFO,"SaddleWeld of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
        FOR i FROM 1 TO 1 DO
            WaitSyncTask SyncRobotsForTest25,taskListRob1Rob2Pos1;
            MultiPassWeldSync;
        ENDFOR
    ENDPROC

    PROC SaddleWeld6()
        Logging\INFO,"SaddleWeld of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
        FOR i FROM 1 TO 1 DO
            WaitSyncTask SyncRobotsForTest26,taskListRob1Rob2Pos1;
            MultiPassWeldSync;
        ENDFOR
    ENDPROC

    PROC TestScanWobjAccuracy()
        UpdateWobjAndTrack;
    ENDPROC

    PROC OnlyForTest()
        Logging\INFO,"OnlyForTest";
    ENDPROC

    PROC VerifyTrackHorizontal()
    ENDPROC

ENDMODULE
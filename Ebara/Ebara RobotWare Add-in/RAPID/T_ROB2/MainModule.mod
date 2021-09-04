MODULE MainModule

    PERS ee_event ee_eventStart:=[1,"EBARAInitialize","T_ROB1:T_ROB2:T_POS1",0,1];
    PERS ee_event ee_eventCycleStart:=[2,"EBARACycleStart","T_ROB1:T_ROB2:T_POS1",0,1];
    PERS ee_event ee_eventPreProd:=[4,"EBARAPreProd","T_ROB1:T_ROB2:T_POS1",0,1];
    PERS ee_event ee_eventPostProd:=[11,"EBARAPostProd","T_ROB1:T_ROB2:T_POS1",0,1];
    PERS bool bSafeMutex:=FALSE;
    PERS num numPlatoonSinkingTotal:=1;
    !PERS num numPlatoonSinkingMidIndex:=13;
    PERS num numTrackMin:=0;
    PERS num numTrackMax:=5000;
    PERS num numVerifyTrackOverLap:=15;
    PERS num numVerifyTrackHeight:=830;

    PROC main()
        !        FOR i FROM 1 TO 10 DO
        !            FitCircleSmoothing posSPBPeripherys,numSPBLLSScan,i,center,radius,normal,rms,maxErr,indexWorst;
        !            Logging\INFO, "SPBCenter="+ValToStr(center)+", radius="+ValToStr(radius);
        !            Logging\INFO, "normal="+ValToStr(normal);
        !            Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);
        !        ENDFOR
        ExecEngine;
        MoveAbsJ [[-97.597,-13.2063,14.3927,-2.62109,36.4833,2.84741],[3647.57,9E+09,9E+09,9E+09,9E+09,9E+09]]\NoEOffs, v1000, z50, toolWeldGun\WObj:=wobjRailFixture;
        MoveAbsJ [[-97.5969,-13.2063,14.3927,-2.62109,36.4831,2.84736],[2647.57,9E+09,9E+09,9E+09,9E+09,9E+09]]\NoEOffs, v1000, z50, toolWeldGun\WObj:=wobjRailFixture;
    ENDPROC

    !The track will keep the last position, so the home position will not check the track
    PROC EBARAInitialize()
        VAR bool bRelSafeMutex;
        VAR string sHeader;
        VAR num nAnswer;
        VAR string stButtons{2}:=["MANUAL","AUTO"];
        VAR string stMsgArray1{6}:=["Robot not in home position","Please choose MANUAL or AUTO","","MANUAL => move robot by joystick to home position","","AUTO   => robot moves directly to home position"];
        VAR jointtarget jointCur;

        strCurTaskName:="T_ROB2";
        numCurTaskNo:=2;
        SetDO soFr2ArcStable,1;
        SaveModule;

        IF RobOS()=FALSE THEN
            MovetoHome;
        ELSE
            WaitTestAndSet bSafeMutex;
            bRelSafeMutex:=TRUE;

            WHILE soAtSafeR2_1=0 DO
                sHeader:="Home position ("+GetTaskName()+")";
                nAnswer:=UIMessageBox(\Header:=sHeader\MsgArray:=stMsgArray1\BtnArray:=stButtons\Icon:=iconWarning);
                IF (nAnswer=1) THEN
                    Stop\AllMoveTasks;
                    TPErase;
                    !! jog to safe position
                ELSE
                    jointCur:=CJointT();
                    extjointValue:=jointCur.extax;
                    MovetoHome;
                ENDIF
            ENDWHILE
            bSafeMutex:=FALSE;
            bRelSafeMutex:=FALSE;
        ENDIF

        SetTPHandlerLogLevel\INFO;
        SetFileHandlerLogLevel\DEBUG;
        Logging\INFO,"EBARAInitialize of "+PMgrTaskName();

    UNDO
        IF (bRelSafeMutex) bSafeMutex:=FALSE;
    ENDPROC

    PROC MovetoHome()
        VAR num numTrackPositionCur;
        jointHome2.extax:=extjointValue;
        MoveAbsJ jointHome2,speedAir,fine,toolWeldGun;
    ENDPROC

    PROC EBARACycleStart()
        PMgrGetNextPart numStation,pdTmpChk\InstanceName:=sPartDataName;
        Logging\INFO,"EBARACycleStart of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
    ENDPROC

    !All the targets are related to the toolWeldGun which is equal to toolWeldGun2
    PROC EBARAPreProd()
        Logging\INFO,"EBARAPreProd of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
        toolWeldGun:=toolWeldGun2;
        IF numProductFinishedCount MOD numTorchCleanIntervalCount=0 THEN
            TorchServices;
            !BEToolCheck;
        ENDIF
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
        VAR string strSeamName;
        Logging\INFO,"PlatoonSinking of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
        FOR i FROM 1 TO numPlatoonSinkingTotal DO
            WaitSyncTask SyncRobotsForTest11,taskListRob1Rob2Pos1;

            !            numCurrentLayerNo:=1;
            !            RefreshCurrentLayerTargets strSeamName;
            !            GeneratePathModule\numIndexStart:=1\numIndexEnd:=numPlatoonSinkingMidIndex;

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
        WaitSyncTask SyncRobotsForTest24,taskListRob1Rob2Pos1;
        MultiPassWeldSync;
    ENDPROC

    PROC SaddleWeld5()
        Logging\INFO,"SaddleWeld of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
        WaitSyncTask SyncRobotsForTest25,taskListRob1Rob2Pos1;
        MultiPassWeldSync;
    ENDPROC

    PROC SaddleWeld6()
        Logging\INFO,"SaddleWeld of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
        FOR i FROM 1 TO 1 DO
            WaitSyncTask SyncRobotsForTest26,taskListRob1Rob2Pos1;
            MultiPassWeldSync;
        ENDFOR
    ENDPROC

    PROC OnlyForTest()
        VAR num numWeldLength:=70;
        VAR num numWeldSpace:=30;
        VAR num numWeldDiameter:=76.2;
        VAR num numWeldCenterDistance:=105;
        Logging\INFO,"OnlyForTest";
        MoveJ pWeldReady,v100,z10,toolWeldGun;
        MoveL pWeld2,v100,z10,toolWeldGun;
        MoveL pWeld1,v100,z10,toolWeldGun;
        SyncMoveOn SyncRobotsForTest25,taskListRob1Rob2;
        FOR i FROM 1 TO 13 DO
            !            ArcLStart Offs(pWeld1,(numWeldLength+numWeldSpace)*(i-1)+70,0,0)\ID:=i*10+1,v100,seamWeld,weldWeld,fine,toolWeldGun;
            !            ArcLEnd Offs(pWeld1,(numWeldLength+numWeldSpace)*(i-1)+numWeldLength+30,0,0)\ID:=i*10+2,v100,seamWeld,weldWeld,fine,toolWeldGun;
            ArcLStart Offs(pWeld1,numWeldCenterDistance*(i-1),0,0)\ID:=i*10+1,v100,seamWeld,weldWeld,fine,toolWeldGun;
            ArcCEnd Offs(pWeld1,numWeldCenterDistance*(i-1)-numWeldDiameter/2,numWeldDiameter/2,0),Offs(pWeld1,numWeldCenterDistance*(i-1)-numWeldDiameter,0,0)\ID:=i*10+2,v100,seamWeld,weldWeld,fine,toolWeldGun;
            MoveL Offs(pWeld2,numWeldCenterDistance*(i-1),0,0)\ID:=i*10+3,v100,z10,toolWeldGun;
            WaitTime 5;
        ENDFOR
        SyncMoveOff SyncRobotsForTest26;
        MoveL pWeldReady,v100,fine,toolWeldGun;
    ENDPROC

ENDMODULE
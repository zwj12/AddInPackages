MODULE MainModule

    PERS ee_event ee_eventStart:=[1,"EBARAInitialize","T_ROB1:T_ROB2:T_POS1",0,1];
    PERS ee_event ee_eventCycleStart:=[2,"EBARACycleStart","T_ROB1:T_ROB2:T_POS1",0,1];
    PERS ee_event ee_eventPreProd:=[4,"EBARAPreProd","T_ROB1:T_ROB2:T_POS1",0,1];
    !    PERS ee_event ee_eventCloseJig:=[5,"EBARACloseJig","T_ROB1",0,1];
    !    PERS ee_event ee_eventOpenJig:=[9,"EBARAOpenJig","T_ROB1",0,1];
    !    PERS ee_event ee_eventService:=[10,"EBARAService","T_ROB1:T_ROB2:T_POS1",0,1];
    PERS ee_event ee_eventPostProd:=[11,"EBARAPostProd","T_ROB1:T_ROB2:T_POS1",0,1];
    PERS bool bSafeMutex:=TRUE;

    PERS orient orientValue:=[0.5,-0.5,-0.5,-0.5];
    PERS num numEZ:=0;
    PERS num numEY:=-90;
    PERS num numEX:=-90;

    PERS num numPlatoonSinkingTotal:=1;
    PERS num numPlatoonWeldingSequenceArray{10}:=[-4,0,0,0,0,0,0,0,0,0];

    PERS num numTrackMin:=0;
    PERS num numTrackMax:=5000;
    PERS num numVerifyTrackOverLap:=15;
    PERS num numVerifyTrackHeight:=830;

    PROC main()
        VAR robtarget robtTemp;
        VAR pose poseGrooveAngle:=[[0,0,0],[1,0,0,0]];
        VAR pos posoframeCenter:=[0,0,0];
        VAR pos posoframeCenterRotated:=[0,0,0];
        zoneWeld:=z20;
        ExecEngine;
        !wobjCurrent:=[FALSE,FALSE,"STN1",[[0,0,0],[1,0,0,0]],[[-0.173493,0.313764,955.428],[0.176687,-0.684676,-0.176687,-0.684676]]];
        !wobjCurrent:=[FALSE,FALSE,"STN1",[[0,0,0],[1,0,0,0]],[[-0.140267,0.329968,976.532],[0.141156,-0.692874,-0.141156,-0.692874]]];
        !rPipeGrooveModel_c.numSeamNormalAngle:=25.4;
        MoveAbsJ [[87.4379,-27.779,20.0939,-3.54362,73.5571,8.40521],[3219.65,9E+09,9E+09,9E+09,9E+09,9E+09]]\NoEOffs, v1000, z50, toolWeldGun\WObj:=wobjRailFixture;
        MoveAbsJ [[87.4379,-27.779,20.0939,-3.54362,73.5571,8.40521],[1219.65,9E+09,9E+09,9E+09,9E+09,9E+09]]\NoEOffs, v1000, z50, toolWeldGun\WObj:=wobjRailFixture;
    ENDPROC

    !The track will keep the last position, so the home position will not check the track
    PROC EBARAInitialize()
        VAR bool bRelSafeMutex;
        VAR string sHeader;
        VAR num nAnswer;
        VAR string stButtons{2}:=["MANUAL","AUTO"];
        VAR string stMsgArray1{6}:=["Robot not in home position","Please choose MANUAL or AUTO","","MANUAL => move robot by joystick to home position","","AUTO   => robot moves directly to home position"];
        VAR jointtarget jointCur;

        strCurTaskName:="T_ROB1";
        numCurTaskNo:=1;
        SetDO soFr1ArcStable,1;
        SaveModule;

        IF RobOS()=FALSE THEN
            MovetoHome;
        ELSE
            WaitTestAndSet bSafeMutex;
            bRelSafeMutex:=TRUE;

            WHILE soAtSafeR1_1=0 DO
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
        jointHome1.extax:=extjointValue;
        MoveAbsJ jointHome1,speedAir,fine,toolWeldGun;

    ENDPROC

    PROC EBARACycleStart()
        PMgrGetNextPart numStation,pdTmpChk\InstanceName:=sPartDataName;
        Logging\INFO,"EBARACycleStart of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
        DeleteDirectory "HOME:/PM";
        ClkReset clockPartTimeConsume;
        ClkStart clockPartTimeConsume;
    ENDPROC

    !All the targets are related to the toolWeldGun which is equal to toolWeldGun1
    PROC EBARAPreProd()
        Logging\INFO,"EBARAPreProd of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
        toolWeldGun:=toolWeldGun1;
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
        Incr numProductFinishedCount;
        Logging\INFO,"EBARAPostProd of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;
        numTimeConsumeTotal:=ClkRead(clockPartTimeConsume);
        Logging\INFO,"numTimeConsumeTotal="+ValToStr(numTimeConsumeTotal)\CloseFile;
        ClkStop clockPartTimeConsume;
    ENDPROC

    !Below part routines are for testing
    PROC PlatoonSinking()
        VAR num numGrooveXCur;
        VAR string strSeamName;
        VAR num numPlatoonSeamOverLapAngle:=8;
        Logging\INFO,"PlatoonSinking of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;

        InitRobLayerTargets_Sinking;
        CopyMultiRobLayersV2 "_a","";
        GetDataVal "numSeamOverLapAngle"+"_a",numPlatoonSeamOverLapAngle;
        rPipeGrooveModel.numPathSource:=1;
        rPipeGrooveModel.numSeamNormalAngle:=0;
        numGrooveXCur:=rPipeGrooveModel.numSeamCenterX;

        FOR i FROM 1 TO numPlatoonSinkingTotal DO
            rPipeGrooveModel.numSeamCenterX:=numGrooveXCur+(i-1)*105;

            FOR numLayer FROM 1 TO 4 DO
                GetDataVal "rRob1Layer"+ValToStr(numLayer),rRobLayerCur;
                IF numLayer MOD 2=1 THEN
                    FOR i FROM 19 TO 1 DO
                        rRobLayerCur{i+2}:=rRobLayerCur{i};
                    ENDFOR
                    rRobLayerCur{1}:=rRobLayerCur{3};
                    rRobLayerCur{2}:=rRobLayerCur{3};
                    rRobLayerCur{1}.numAngle:=numPlatoonSeamOverLapAngle;
                    rRobLayerCur{2}.numAngle:=numPlatoonSeamOverLapAngle/2;
                    rRobLayerCur{1}.numProcessType:=1;
                    rRobLayerCur{2}.numProcessType:=5;
                    rRobLayerCur{3}.numProcessType:=5;
                    IF numLayer=1 THEN
                        rRobLayerCur{1}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{1}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{2}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{2}.numAngle);
                        rRobLayerCur{2}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{2}.numAngle);
                        rRobLayerCur{1}.numTCSRotationX:=-30;
                        rRobLayerCur{1}.numTCSRotationY:=-15;
                        rRobLayerCur{2}.numTCSRotationX:=-30;
                        rRobLayerCur{2}.numTCSRotationY:=-15;
                    ELSEIF numLayer=3 THEN
                        rRobLayerCur{1}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2+8)*Cos(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{1}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2+8)*Sin(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{2}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2+8)*Cos(rRobLayerCur{2}.numAngle);
                        rRobLayerCur{2}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2+8)*Sin(rRobLayerCur{2}.numAngle);
                        !                        rRobLayerCur{1}.numTCSRotationX:=-40;
                        !                        rRobLayerCur{1}.numTCSRotationY:=-8;
                        !                        rRobLayerCur{2}.numTCSRotationX:=-40;
                        !                        rRobLayerCur{2}.numTCSRotationY:=-8;
                    ENDIF
                ELSE
                    rRobLayerCur{20}:=rRobLayerCur{19};
                    rRobLayerCur{21}:=rRobLayerCur{19};
                    rRobLayerCur{20}.numAngle:=180-numPlatoonSeamOverLapAngle/2;
                    rRobLayerCur{21}.numAngle:=180-numPlatoonSeamOverLapAngle;
                    rRobLayerCur{18}.numProcessType:=5;
                    rRobLayerCur{19}.numProcessType:=5;
                    rRobLayerCur{20}.numProcessType:=6;
                    rRobLayerCur{21}.numProcessType:=6;
                    IF numLayer=2 THEN
                        rRobLayerCur{20}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{20}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{21}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{21}.numAngle);
                        rRobLayerCur{21}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{21}.numAngle);
                        rRobLayerCur{20}.numTCSRotationX:=30;
                        rRobLayerCur{20}.numTCSRotationY:=-15;
                        rRobLayerCur{21}.numTCSRotationX:=30;
                        rRobLayerCur{21}.numTCSRotationY:=-15;
                    ELSEIF numLayer=4 THEN
                        rRobLayerCur{20}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2)*Cos(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{20}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2)*Sin(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{21}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2)*Cos(rRobLayerCur{21}.numAngle);
                        rRobLayerCur{21}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2)*Sin(rRobLayerCur{21}.numAngle);
                        !                        rRobLayerCur{20}.numTCSRotationX:=40;
                        !                        rRobLayerCur{20}.numTCSRotationY:=-2;
                        !                        rRobLayerCur{21}.numTCSRotationX:=40;
                        !                        rRobLayerCur{21}.numTCSRotationY:=-2;
                    ENDIF
                ENDIF
                SetDataVal "rRob1Layer"+ValToStr(numLayer),rRobLayerCur;
                numRob1TargetsTotal{numLayer}:=numRob1TargetsTotal{numLayer}+2;
            ENDFOR

            FOR numLayer FROM 1 TO 4 DO
                GetDataVal "rRob2Layer"+ValToStr(numLayer),rRobLayerCur;
                IF numLayer MOD 2=1 THEN
                    FOR i FROM 19 TO 1 DO
                        rRobLayerCur{i+2}:=rRobLayerCur{i};
                    ENDFOR
                    rRobLayerCur{1}:=rRobLayerCur{3};
                    rRobLayerCur{2}:=rRobLayerCur{3};
                    rRobLayerCur{1}.numAngle:=180+numPlatoonSeamOverLapAngle;
                    rRobLayerCur{2}.numAngle:=180+numPlatoonSeamOverLapAngle/2;
                    rRobLayerCur{1}.numProcessType:=1;
                    rRobLayerCur{2}.numProcessType:=5;
                    rRobLayerCur{3}.numProcessType:=5;
                    IF numLayer=1 THEN
                        rRobLayerCur{1}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{1}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{2}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{2}.numAngle);
                        rRobLayerCur{2}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{2}.numAngle);
                        rRobLayerCur{1}.numTCSRotationX:=-30;
                        rRobLayerCur{1}.numTCSRotationY:=-15;
                        rRobLayerCur{2}.numTCSRotationX:=-30;
                        rRobLayerCur{2}.numTCSRotationY:=-15;
                    ELSEIF numLayer=3 THEN
                        rRobLayerCur{1}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2+8)*Cos(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{1}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2+8)*Sin(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{2}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2+8)*Cos(rRobLayerCur{2}.numAngle);
                        rRobLayerCur{2}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2+8)*Sin(rRobLayerCur{2}.numAngle);
                        !                        rRobLayerCur{1}.numTCSRotationX:=-40;
                        !                        rRobLayerCur{1}.numTCSRotationY:=-8;
                        !                        rRobLayerCur{2}.numTCSRotationX:=-40;
                        !                        rRobLayerCur{2}.numTCSRotationY:=-8;
                    ENDIF
                ELSE
                    rRobLayerCur{20}:=rRobLayerCur{19};
                    rRobLayerCur{21}:=rRobLayerCur{19};
                    rRobLayerCur{20}.numAngle:=360-numPlatoonSeamOverLapAngle/2;
                    rRobLayerCur{21}.numAngle:=360-numPlatoonSeamOverLapAngle;
                    rRobLayerCur{18}.numProcessType:=5;
                    rRobLayerCur{19}.numProcessType:=5;
                    rRobLayerCur{20}.numProcessType:=6;
                    rRobLayerCur{21}.numProcessType:=6;
                    IF numLayer=2 THEN
                        rRobLayerCur{20}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{20}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{21}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{21}.numAngle);
                        rRobLayerCur{21}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{21}.numAngle);
                        rRobLayerCur{20}.numTCSRotationX:=30;
                        rRobLayerCur{20}.numTCSRotationY:=-15;
                        rRobLayerCur{21}.numTCSRotationX:=30;
                        rRobLayerCur{21}.numTCSRotationY:=-15;
                    ELSEIF numLayer=4 THEN
                        rRobLayerCur{20}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2)*Cos(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{20}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2)*Sin(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{21}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2)*Cos(rRobLayerCur{21}.numAngle);
                        rRobLayerCur{21}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2)*Sin(rRobLayerCur{21}.numAngle);
                        !                        rRobLayerCur{20}.numTCSRotationX:=40;
                        !                        rRobLayerCur{20}.numTCSRotationY:=-2;
                        !                        rRobLayerCur{21}.numTCSRotationX:=40;
                        !                        rRobLayerCur{21}.numTCSRotationY:=-2;
                    ENDIF
                ENDIF
                SetDataVal "rRob2Layer"+ValToStr(numLayer),rRobLayerCur;
                numRob2TargetsTotal{numLayer}:=numRob2TargetsTotal{numLayer}+2;
            ENDFOR

            numPedestalVertexHeight:=GetPedestalVertexHeight(numPedestalBottomWidth,numPedestalBottomHeight,numPedestalAngle);
            wobjRailFixture.uframe.trans.z:=numPedestalVertexHeight+rPipeGrooveModel.numHeaderDiameter/2/Sin(numPedestalAngle/2);
            WaitSyncTask SyncRobotsForTest11,taskListRob1Rob2Pos1;

            !            numCurrentLayerNo:=1;
            !            RefreshCurrentLayerTargets strSeamName;
            !            GeneratePathModule\numIndexStart:=numPlatoonSinkingMidIndex\numIndexEnd:=25;

            MultiPassWeldSync;
        ENDFOR
    ENDPROC

    PROC PlatoonSinking2()
        VAR num numGrooveXCur;
        VAR string strSeamName;
        VAR num numPlatoonSeamOverLapAngle:=8;
        VAR num numSeamOverLapOffsetY:=2;
        Logging\INFO,"PlatoonSinking of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;

        InitRobLayerTargetsV2_Sinking "_d";
        GetDataVal "numSeamOverLapAngle"+"_d",numPlatoonSeamOverLapAngle;
        GetDataVal "numSeamOverLapOffsetY"+"_d",numSeamOverLapOffsetY;

        FOR i FROM 1 TO numPlatoonSinkingTotal DO
            CopyMultiRobLayersV2 "_d","";
            rPipeGrooveModel.numPathSource:=1;
            rPipeGrooveModel.numSeamNormalAngle:=0;
            numGrooveXCur:=rPipeGrooveModel.numSeamCenterX;

            rPipeGrooveModel.numSeamCenterX:=numGrooveXCur+(i-1)*105;
            !Michael, 2019-2-26, For pre-assessment
            IF numPlatoonSinkingTotal>1 THEN
                IF i=1 THEN
                    rPipeGrooveModel.numReviseScanBranchType:=3;
                    rPipeGrooveModel.numReviseScanHeaderType:=3;
                ELSE
                    rPipeGrooveModel.numReviseScanBranchType:=12;
                    rPipeGrooveModel.numReviseScanHeaderType:=12;
                ENDIF
                rPipeGrooveModel.numIndex:=i;
                rPipeGrooveModel.numSeamCenterX:=numGrooveXCur;
            ENDIF

            FOR numLayer FROM 1 TO 4 DO
                GetDataVal "rRob1Layer"+ValToStr(numLayer),rRobLayerCur;
                IF numLayer MOD 2=1 THEN
                    FOR i FROM 19 TO 1 DO
                        rRobLayerCur{i+2}:=rRobLayerCur{i};
                    ENDFOR
                    rRobLayerCur{1}:=rRobLayerCur{3};
                    rRobLayerCur{2}:=rRobLayerCur{3};
                    rRobLayerCur{1}.numAngle:=numPlatoonSeamOverLapAngle;
                    rRobLayerCur{2}.numAngle:=numPlatoonSeamOverLapAngle/2;
                    rRobLayerCur{1}.numProcessType:=1;
                    rRobLayerCur{2}.numProcessType:=5;
                    rRobLayerCur{3}.numProcessType:=5;
                    IF numLayer=1 THEN
                        rRobLayerCur{1}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{1}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{2}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{2}.numAngle);
                        rRobLayerCur{2}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{2}.numAngle);
                        rRobLayerCur{1}.numTCSRotationX:=-30;
                        rRobLayerCur{1}.numTCSRotationY:=-13;
                        rRobLayerCur{2}.numTCSRotationX:=-30;
                        rRobLayerCur{2}.numTCSRotationY:=-13;
                    ELSEIF numLayer=3 THEN
                        rRobLayerCur{1}.numAngle:=numPlatoonSeamOverLapAngle-2;
                        rRobLayerCur{2}.numAngle:=(numPlatoonSeamOverLapAngle-2)/2;
                        rRobLayerCur{1}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2+11)*Cos(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{1}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2+11)*Sin(rRobLayerCur{1}.numAngle)+numSeamOverLapOffsetY;
                        rRobLayerCur{2}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2+11)*Cos(rRobLayerCur{2}.numAngle);
                        rRobLayerCur{2}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2+11)*Sin(rRobLayerCur{2}.numAngle)+numSeamOverLapOffsetY;
                        !                        rRobLayerCur{1}.numTCSRotationX:=-40;
                        !                        rRobLayerCur{1}.numTCSRotationY:=-8;
                        !                        rRobLayerCur{2}.numTCSRotationX:=-40;
                        !                        rRobLayerCur{2}.numTCSRotationY:=-8;
                    ENDIF
                ELSE
                    rRobLayerCur{20}:=rRobLayerCur{19};
                    rRobLayerCur{21}:=rRobLayerCur{19};
                    rRobLayerCur{20}.numAngle:=180-numPlatoonSeamOverLapAngle/2;
                    rRobLayerCur{21}.numAngle:=180-numPlatoonSeamOverLapAngle;
                    rRobLayerCur{18}.numProcessType:=5;
                    rRobLayerCur{19}.numProcessType:=5;
                    rRobLayerCur{20}.numProcessType:=6;
                    rRobLayerCur{21}.numProcessType:=6;
                    IF numLayer=2 THEN
                        rRobLayerCur{20}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{20}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{21}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{21}.numAngle);
                        rRobLayerCur{21}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{21}.numAngle);
                        rRobLayerCur{20}.numTCSRotationX:=30;
                        rRobLayerCur{20}.numTCSRotationY:=-15;
                        rRobLayerCur{21}.numTCSRotationX:=30;
                        rRobLayerCur{21}.numTCSRotationY:=-15;
                        rRobLayerCur{1}.numTCSOffsetY:=4;
                    ELSEIF numLayer=4 THEN
                        rRobLayerCur{20}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2+1)*Cos(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{20}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2+1)*Sin(rRobLayerCur{20}.numAngle)+numSeamOverLapOffsetY;
                        rRobLayerCur{21}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2+1)*Cos(rRobLayerCur{21}.numAngle);
                        rRobLayerCur{21}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2+1)*Sin(rRobLayerCur{21}.numAngle)+numSeamOverLapOffsetY;
                        rRobLayerCur{1}.numTCSOffsetY:=4;
                        !                        rRobLayerCur{20}.numTCSRotationX:=40;
                        !                        rRobLayerCur{20}.numTCSRotationY:=-2;
                        !                        rRobLayerCur{21}.numTCSRotationX:=40;
                        !                        rRobLayerCur{21}.numTCSRotationY:=-2;
                    ENDIF
                ENDIF
                SetDataVal "rRob1Layer"+ValToStr(numLayer),rRobLayerCur;
                numRob1TargetsTotal{numLayer}:=numRob1TargetsTotal{numLayer}+2;
            ENDFOR

            FOR numLayer FROM 1 TO 4 DO
                GetDataVal "rRob2Layer"+ValToStr(numLayer),rRobLayerCur;
                IF numLayer MOD 2=1 THEN
                    FOR i FROM 19 TO 1 DO
                        rRobLayerCur{i+2}:=rRobLayerCur{i};
                    ENDFOR
                    rRobLayerCur{1}:=rRobLayerCur{3};
                    rRobLayerCur{2}:=rRobLayerCur{3};
                    rRobLayerCur{1}.numAngle:=180+numPlatoonSeamOverLapAngle;
                    rRobLayerCur{2}.numAngle:=180+numPlatoonSeamOverLapAngle/2;
                    rRobLayerCur{1}.numProcessType:=1;
                    rRobLayerCur{2}.numProcessType:=5;
                    rRobLayerCur{3}.numProcessType:=5;
                    IF numLayer=1 THEN
                        rRobLayerCur{1}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{1}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{2}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{2}.numAngle);
                        rRobLayerCur{2}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{2}.numAngle);
                        rRobLayerCur{1}.numTCSRotationX:=-30;
                        rRobLayerCur{1}.numTCSRotationY:=-13;
                        rRobLayerCur{2}.numTCSRotationX:=-30;
                        rRobLayerCur{2}.numTCSRotationY:=-13;
                    ELSEIF numLayer=3 THEN
                    rRobLayerCur{1}.numAngle:=180+(numPlatoonSeamOverLapAngle-2);
                    rRobLayerCur{2}.numAngle:=180+(numPlatoonSeamOverLapAngle-2)/2;
                        rRobLayerCur{1}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2+11)*Cos(rRobLayerCur{1}.numAngle);
                        rRobLayerCur{1}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2+11)*Sin(rRobLayerCur{1}.numAngle)-numSeamOverLapOffsetY;
                        rRobLayerCur{2}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2+11)*Cos(rRobLayerCur{2}.numAngle);
                        rRobLayerCur{2}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2+11)*Sin(rRobLayerCur{2}.numAngle)-numSeamOverLapOffsetY;
                        !                        rRobLayerCur{1}.numTCSRotationX:=-40;
                        !                        rRobLayerCur{1}.numTCSRotationY:=-8;
                        !                        rRobLayerCur{2}.numTCSRotationX:=-40;
                        !                        rRobLayerCur{2}.numTCSRotationY:=-8;
                    ENDIF
                ELSE
                    rRobLayerCur{20}:=rRobLayerCur{19};
                    rRobLayerCur{21}:=rRobLayerCur{19};
                    rRobLayerCur{20}.numAngle:=360-numPlatoonSeamOverLapAngle/2;
                    rRobLayerCur{21}.numAngle:=360-numPlatoonSeamOverLapAngle;
                    rRobLayerCur{18}.numProcessType:=5;
                    rRobLayerCur{19}.numProcessType:=5;
                    rRobLayerCur{20}.numProcessType:=6;
                    rRobLayerCur{21}.numProcessType:=6;
                    IF numLayer=2 THEN
                        rRobLayerCur{20}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{20}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{21}.numWobjX:=rPipeGrooveModel.numBranchDiameter/2*Cos(rRobLayerCur{21}.numAngle);
                        rRobLayerCur{21}.numWobjY:=rPipeGrooveModel.numBranchDiameter/2*Sin(rRobLayerCur{21}.numAngle);
                        rRobLayerCur{20}.numTCSRotationX:=30;
                        rRobLayerCur{20}.numTCSRotationY:=-15;
                        rRobLayerCur{21}.numTCSRotationX:=30;
                        rRobLayerCur{21}.numTCSRotationY:=-15;
                        rRobLayerCur{1}.numTCSOffsetY:=4;
                    ELSEIF numLayer=4 THEN
                        rRobLayerCur{20}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2)*Cos(rRobLayerCur{20}.numAngle);
                        rRobLayerCur{20}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2)*Sin(rRobLayerCur{20}.numAngle)-numSeamOverLapOffsetY;
                        rRobLayerCur{21}.numWobjX:=(rPipeGrooveModel.numBranchDiameter/2)*Cos(rRobLayerCur{21}.numAngle);
                        rRobLayerCur{21}.numWobjY:=(rPipeGrooveModel.numBranchDiameter/2)*Sin(rRobLayerCur{21}.numAngle)-numSeamOverLapOffsetY;
                        rRobLayerCur{1}.numTCSOffsetY:=4;
                        !                        rRobLayerCur{20}.numTCSRotationX:=40;
                        !                        rRobLayerCur{20}.numTCSRotationY:=-2;
                        !                        rRobLayerCur{21}.numTCSRotationX:=40;
                        !                        rRobLayerCur{21}.numTCSRotationY:=-2;
                    ENDIF
                ENDIF
                SetDataVal "rRob2Layer"+ValToStr(numLayer),rRobLayerCur;
                numRob2TargetsTotal{numLayer}:=numRob2TargetsTotal{numLayer}+2;
            ENDFOR

            numPedestalVertexHeight:=GetPedestalVertexHeight(numPedestalBottomWidth,numPedestalBottomHeight,numPedestalAngle);
            wobjRailFixture.uframe.trans.z:=numPedestalVertexHeight+rPipeGrooveModel.numHeaderDiameter/2/Sin(numPedestalAngle/2);
            WaitSyncTask SyncRobotsForTest12,taskListRob1Rob2Pos1;

            !            numCurrentLayerNo:=1;
            !            RefreshCurrentLayerTargets strSeamName;
            !            GeneratePathModule\numIndexStart:=numPlatoonSinkingMidIndex\numIndexEnd:=25;

            MultiPassWeldSync;
        ENDFOR
    ENDPROC

    PROC InitRobLayerTargets_Sinking()
        VAR string strPostfix:="_a";
        VAR RECORDWeldTarget rRobLayerTemp{100};
        VAR RECORDPipeGrooveModel rPipeGrooveModelTemp;
        VAR RECORDLayerParamter rLayerParamterTemp;
        VAR num numWobjEY_Index1;
        VAR num numMultiPassTotal;
        GetDataVal "rPipeGrooveModel"+strPostfix,rPipeGrooveModelTemp;
        numMultiPassTotal:=rPipeGrooveModelTemp.numMultiPassTotal;
        IF numMultiPassTotal<numLayerNoStart THEN
            numMultiPassTotal:=numLayerNoStart;
        ENDIF

        FOR numLayer FROM 1 TO 4 DO
            GetDataVal "rRob1Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
            IF numLayer<10 THEN
                GetDataVal "rLayerParamter0"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ELSE
                GetDataVal "rLayerParamter"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ENDIF
            FOR i FROM 1 TO 19 DO
                !IF numLayer=1 AND rRobLayerTemp{i}.numAngle=240 THEN
                IF numLayer=1 THEN
                    IF i=13 THEN
                        rRobLayerTemp{i}.numAngle:=232;
                        rRobLayerTemp{i}.numWobjX:=rPipeGrooveModelTemp.numBranchDiameter/2*Cos(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjY:=rPipeGrooveModelTemp.numBranchDiameter/2*Sin(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjEZ:=rRobLayerTemp{i}.numAngle;
                    ELSEIF i=14 THEN
                        rRobLayerTemp{i}.numAngle:=225;
                        rRobLayerTemp{i}.numWobjX:=rPipeGrooveModelTemp.numBranchDiameter/2*Cos(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjY:=rPipeGrooveModelTemp.numBranchDiameter/2*Sin(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjEZ:=rRobLayerTemp{i}.numAngle;
                    ENDIF
                ENDIF

                !rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY+rLayerParamterTemp.numWorkAngleDeclination;

                rRobLayerTemp{i}.numTCSOffsetX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetX);
                rRobLayerTemp{i}.numTCSOffsetZ:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetZ);

                rRobLayerTemp{i}.numTCSRotationX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationX);
                rRobLayerTemp{i}.numTCSRotationY:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationY);
                !                rRobLayerTemp{i}.numTCSRotationX:=numPlatoonSinkingPushDragAngle-(rRobLayerTemp{i}.numAngle-180)/180*numPlatoonSinkingPushDragAngle*2;
                !                rRobLayerTemp{i}.numTCSRotationY:=Abs(rRobLayerTemp{i}.numAngle-270)/90*numPlatoonSinkingWorkAngle;
                rRobLayerTemp{i}.numTCSRotationZ:=rRobLayerTemp{i}.numAngle-90;

                IF numLayer>=4 THEN
                    !rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+20-Abs(rRobLayerTemp{i}.numAngle-240)/40*20;
                    IF rRobLayerTemp{i}.numAngle>=240 AND rRobLayerTemp{i}.numAngle<=330 THEN
                        rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+Abs(rRobLayerTemp{i}.numAngle-300)/90*20;
                    ELSEIF rRobLayerTemp{i}.numAngle>=210 AND rRobLayerTemp{i}.numAngle<240 THEN
                        rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+20;
                    ELSEIF rRobLayerTemp{i}.numAngle<210 THEN
                        rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+20-Abs(rRobLayerTemp{i}.numAngle-210)/30*20;
                    ENDIF
                ENDIF

                IF numLayer=1 THEN
                    IF i=1 THEN
                        rRobLayerTemp{i}.numProcessType:=1;
                    ELSEIF i>=2 AND i<=5 THEN
                        rRobLayerTemp{i}.numProcessType:=5;
                    ELSEIF i>=6 AND i<=7 THEN
                        rRobLayerTemp{i}.numProcessType:=6;
                    ELSEIF i>=8 AND i<=11 THEN
                        rRobLayerTemp{i}.numProcessType:=8;
                    ELSEIF i>=12 AND i<=13 THEN
                        rRobLayerTemp{i}.numProcessType:=4;
                    ELSEIF i>=14 AND i<=17 THEN
                        rRobLayerTemp{i}.numProcessType:=5;
                    ELSEIF i>=18 AND i<=19 THEN
                        rRobLayerTemp{i}.numProcessType:=6;
                    ELSE
                        rRobLayerTemp{i}.numProcessType:=7;
                    ENDIF
                ELSE
                    IF i=1 THEN
                        rRobLayerTemp{i}.numProcessType:=1;
                    ELSEIF i>=18 AND i<=19 THEN
                        rRobLayerTemp{i}.numProcessType:=6;
                    ELSE
                        rRobLayerTemp{i}.numProcessType:=5;
                    ENDIF
                ENDIF

                rRobLayerTemp{i}.strWeldProcedureID:=rLayerParamterTemp.strWeldProcedureID;

                IF numLayer=2 THEN
                    IF rRobLayerTemp{i}.numAngle>=240 AND rRobLayerTemp{i}.numAngle<300 THEN
                        rRobLayerTemp{i}.strWeldProcedureID:="test15";
                    ENDIF
                ELSEIF numLayer=4 THEN
                    IF rRobLayerTemp{i}.numAngle>=220 AND rRobLayerTemp{i}.numAngle<320 THEN
                        rRobLayerTemp{i}.strWeldProcedureID:="test21";
                    ELSEIF rRobLayerTemp{i}.numAngle>=240 AND rRobLayerTemp{i}.numAngle<300 THEN
                        rRobLayerTemp{i}.strWeldProcedureID:="test22";
                    ENDIF
                ENDIF
            ENDFOR

            IF numLayer=1 THEN
                rRobLayerTemp{1}.strWeldProcedureID:="test18";
                rRobLayerTemp{3}.strWeldProcedureID:="test18";
                rRobLayerTemp{5}.strWeldProcedureID:="test19";
                rRobLayerTemp{7}.strWeldProcedureID:="test20";

                !                rRobLayerTemp{1}.strWeldProcedureID:="test11";
                !                rRobLayerTemp{3}.strWeldProcedureID:="test11";
                !                rRobLayerTemp{5}.strWeldProcedureID:="test12";
                !                rRobLayerTemp{7}.strWeldProcedureID:="test13";

                rRobLayerTemp{13}.strWeldProcedureID:="test13";
                rRobLayerTemp{15}.strWeldProcedureID:="test13";
                rRobLayerTemp{17}.strWeldProcedureID:="test12";
                rRobLayerTemp{19}.strWeldProcedureID:="test11";
            ENDIF


            SetDataVal "rRob1Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
        ENDFOR

        FOR numLayer FROM 1 TO 4 DO
            GetDataVal "rRob2Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
            IF numLayer<10 THEN
                GetDataVal "rLayerParamter0"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ELSE
                GetDataVal "rLayerParamter"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ENDIF
            !FOR i FROM 1 TO numPlatoonSinkingMidIndex DO
            FOR i FROM 1 TO 19 DO
                !IF numLayer=1 AND rRobLayerTemp{i}.numAngle=60 THEN
                IF numLayer=1 THEN
                    IF i=13 THEN
                        rRobLayerTemp{i}.numAngle:=52;
                        rRobLayerTemp{i}.numWobjX:=rPipeGrooveModelTemp.numBranchDiameter/2*Cos(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjY:=rPipeGrooveModelTemp.numBranchDiameter/2*Sin(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjEZ:=rRobLayerTemp{i}.numAngle;
                    ELSEIF i=14 THEN
                        rRobLayerTemp{i}.numAngle:=45;
                        rRobLayerTemp{i}.numWobjX:=rPipeGrooveModelTemp.numBranchDiameter/2*Cos(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjY:=rPipeGrooveModelTemp.numBranchDiameter/2*Sin(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjEZ:=rRobLayerTemp{i}.numAngle;
                    ENDIF
                ENDIF

                !rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY+rLayerParamterTemp.numWorkAngleDeclination;

                rRobLayerTemp{i}.numTCSOffsetX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetX);
                rRobLayerTemp{i}.numTCSOffsetZ:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetZ);

                rRobLayerTemp{i}.numTCSRotationX:=0-GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationX);
                rRobLayerTemp{i}.numTCSRotationY:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationY);
                !                rRobLayerTemp{i}.numTCSRotationX:=numPlatoonSinkingPushDragAngle-rRobLayerTemp{i}.numAngle/180*numPlatoonSinkingPushDragAngle*2;
                !                rRobLayerTemp{i}.numTCSRotationY:=Abs(rRobLayerTemp{i}.numAngle-90)/90*numPlatoonSinkingWorkAngle;
                rRobLayerTemp{i}.numTCSRotationZ:=rRobLayerTemp{i}.numAngle+90;

                IF numLayer>=4 THEN
                    !rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+20-Abs(rRobLayerTemp{i}.numAngle-60)/40*20;
                    IF rRobLayerTemp{i}.numAngle>=60 AND rRobLayerTemp{i}.numAngle<=150 THEN
                        rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+Abs(rRobLayerTemp{i}.numAngle-150)/90*20;
                    ELSEIF rRobLayerTemp{i}.numAngle>=30 AND rRobLayerTemp{i}.numAngle<60 THEN
                        rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+20;
                    ELSEIF rRobLayerTemp{i}.numAngle<30 THEN
                        rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+20-Abs(rRobLayerTemp{i}.numAngle-30)/30*20;
                    ENDIF
                ENDIF

                IF numLayer=1 THEN
                    IF i=1 THEN
                        rRobLayerTemp{i}.numProcessType:=1;
                    ELSEIF i>=2 AND i<=5 THEN
                        rRobLayerTemp{i}.numProcessType:=5;
                    ELSEIF i>=6 AND i<=7 THEN
                        rRobLayerTemp{i}.numProcessType:=6;
                    ELSEIF i>=8 AND i<=11 THEN
                        rRobLayerTemp{i}.numProcessType:=8;
                    ELSEIF i>=12 AND i<=13 THEN
                        rRobLayerTemp{i}.numProcessType:=4;
                    ELSEIF i>=14 AND i<=17 THEN
                        rRobLayerTemp{i}.numProcessType:=5;
                    ELSEIF i>=18 AND i<=19 THEN
                        rRobLayerTemp{i}.numProcessType:=6;
                    ELSE
                        rRobLayerTemp{i}.numProcessType:=7;
                    ENDIF
                ELSE
                    IF i=1 THEN
                        rRobLayerTemp{i}.numProcessType:=1;
                    ELSEIF i>=18 AND i<=19 THEN
                        rRobLayerTemp{i}.numProcessType:=6;
                    ELSE
                        rRobLayerTemp{i}.numProcessType:=5;
                    ENDIF
                ENDIF

                rRobLayerTemp{i}.strWeldProcedureID:=rLayerParamterTemp.strWeldProcedureID;
                IF numLayer=2 THEN
                    IF rRobLayerTemp{i}.numAngle>=60 AND rRobLayerTemp{i}.numAngle<120 THEN
                        rRobLayerTemp{i}.strWeldProcedureID:="test15";
                    ENDIF
                ELSEIF numLayer=4 THEN
                    IF rRobLayerTemp{i}.numAngle>=40 AND rRobLayerTemp{i}.numAngle<140 THEN
                        rRobLayerTemp{i}.strWeldProcedureID:="test21";
                    ELSEIF rRobLayerTemp{i}.numAngle>=60 AND rRobLayerTemp{i}.numAngle<120 THEN
                        rRobLayerTemp{i}.strWeldProcedureID:="test22";
                    ENDIF
                ENDIF

            ENDFOR

            IF numLayer=1 THEN
                rRobLayerTemp{1}.strWeldProcedureID:="test18";
                rRobLayerTemp{3}.strWeldProcedureID:="test18";
                rRobLayerTemp{5}.strWeldProcedureID:="test19";
                rRobLayerTemp{7}.strWeldProcedureID:="test20";

                !                rRobLayerTemp{1}.strWeldProcedureID:="test11";
                !                rRobLayerTemp{3}.strWeldProcedureID:="test11";
                !                rRobLayerTemp{5}.strWeldProcedureID:="test12";
                !                rRobLayerTemp{7}.strWeldProcedureID:="test13";

                rRobLayerTemp{13}.strWeldProcedureID:="test13";
                rRobLayerTemp{15}.strWeldProcedureID:="test13";
                rRobLayerTemp{17}.strWeldProcedureID:="test12";
                rRobLayerTemp{19}.strWeldProcedureID:="test11";
            ENDIF

            SetDataVal "rRob2Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;

        ENDFOR

    ENDPROC

    PROC InitRobLayerTargetsV2_Sinking(string strPostfix)
        VAR RECORDWeldTarget rRobLayerTemp{30};
        VAR RECORDPipeGrooveModel rPipeGrooveModelTemp;
        VAR RECORDLayerParamter rLayerParamterTemp;
        VAR num numWobjEY_Index1;
        VAR num numWobjEYPreDeclination_Index1;
        VAR num numMultiPassTotal;
        GetDataVal "rPipeGrooveModel"+strPostfix,rPipeGrooveModelTemp;
        numMultiPassTotal:=rPipeGrooveModelTemp.numMultiPassTotal;
        IF numMultiPassTotal<numLayerNoStart THEN
            numMultiPassTotal:=numLayerNoStart;
        ENDIF

        FOR numLayer FROM numLayerNoStart TO numMultiPassTotal DO
            GetDataVal "rRob1Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
            IF numLayer<10 THEN
                GetDataVal "rLayerParamter0"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ELSE
                GetDataVal "rLayerParamter"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ENDIF

            IF boolMoveLSubstituted=FALSE THEN
                WriteLayerParameterLog rPipeGrooveModelTemp,rLayerParamterTemp\PipeGrooveModelName:="rPipeGrooveModel"+strPostfix\LayerParameterName:="rLayerParamter"+ValToStr(numLayer)+strPostfix;
            ENDIF

            numWobjEY_Index1:=rRobLayerTemp{1}.numWobjEY;
            numWobjEYPreDeclination_Index1:=numWobjEY_Index1+135;
            FOR i FROM 1 TO 19 DO
                IF numLayer=1 THEN
                    IF i=13 THEN
                        rRobLayerTemp{i}.numAngle:=232;
                        rRobLayerTemp{i}.numWobjX:=rPipeGrooveModelTemp.numBranchDiameter/2*Cos(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjY:=rPipeGrooveModelTemp.numBranchDiameter/2*Sin(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjEZ:=rRobLayerTemp{i}.numAngle;
                    ELSEIF i=14 THEN
                        rRobLayerTemp{i}.numAngle:=225;
                        rRobLayerTemp{i}.numWobjX:=rPipeGrooveModelTemp.numBranchDiameter/2*Cos(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjY:=rPipeGrooveModelTemp.numBranchDiameter/2*Sin(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjEZ:=rRobLayerTemp{i}.numAngle;
                    ENDIF
                ENDIF

                IF numWobjEY_Index1=-135 THEN
                    rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY+rLayerParamterTemp.numWorkAngleDeclination;
                ELSE
                    rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY-numWobjEYPreDeclination_Index1+rLayerParamterTemp.numWorkAngleDeclination;
                ENDIF

                rRobLayerTemp{i}.numTCSOffsetX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetX);
                rRobLayerTemp{i}.numTCSOffsetZ:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetZ);

                rRobLayerTemp{i}.numTCSRotationX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationX);
                rRobLayerTemp{i}.numTCSRotationY:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationY);
                rRobLayerTemp{i}.numTCSRotationZ:=rRobLayerTemp{i}.numAngle-90;

                !                IF numLayer>=4 THEN
                !                    IF rRobLayerTemp{i}.numAngle>=240 AND rRobLayerTemp{i}.numAngle<=330 THEN
                !                        rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+Abs(rRobLayerTemp{i}.numAngle-300)/90*20;
                !                    ELSEIF rRobLayerTemp{i}.numAngle>=210 AND rRobLayerTemp{i}.numAngle<240 THEN
                !                        rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+20;
                !                    ELSEIF rRobLayerTemp{i}.numAngle<210 THEN
                !                        rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+20-Abs(rRobLayerTemp{i}.numAngle-210)/30*20;
                !                    ENDIF
                !                ENDIF

                IF numLayer=1 THEN
                    IF i=1 THEN
                        rRobLayerTemp{i}.numProcessType:=1;
                    ELSEIF i>=2 AND i<=5 THEN
                        rRobLayerTemp{i}.numProcessType:=5;
                    ELSEIF i>=6 AND i<=7 THEN
                        rRobLayerTemp{i}.numProcessType:=6;
                    ELSEIF i>=8 AND i<=11 THEN
                        rRobLayerTemp{i}.numProcessType:=8;
                    ELSEIF i>=12 AND i<=13 THEN
                        rRobLayerTemp{i}.numProcessType:=4;
                    ELSEIF i>=14 AND i<=17 THEN
                        rRobLayerTemp{i}.numProcessType:=5;
                    ELSEIF i>=18 AND i<=19 THEN
                        rRobLayerTemp{i}.numProcessType:=6;
                    ELSE
                        rRobLayerTemp{i}.numProcessType:=7;
                    ENDIF
                ELSE
                    IF i=1 THEN
                        rRobLayerTemp{i}.numProcessType:=1;
                    ELSEIF i>=18 AND i<=19 THEN
                        rRobLayerTemp{i}.numProcessType:=6;
                    ELSE
                        rRobLayerTemp{i}.numProcessType:=5;
                    ENDIF
                ENDIF

                rRobLayerTemp{i}.strWeldProcedureID:=rLayerParamterTemp.strWeldProcedureID;

                IF numLayer=2 THEN
                    IF rRobLayerTemp{i}.numAngle>=240 AND rRobLayerTemp{i}.numAngle<300 THEN
                        rRobLayerTemp{i}.strWeldProcedureID:="test15";
                    ENDIF
                ELSEIF numLayer=4 THEN
                    IF rRobLayerTemp{i}.numAngle>=220 AND rRobLayerTemp{i}.numAngle<320 THEN
                        rRobLayerTemp{i}.strWeldProcedureID:="test21";
                    ELSEIF rRobLayerTemp{i}.numAngle>=240 AND rRobLayerTemp{i}.numAngle<300 THEN
                        rRobLayerTemp{i}.strWeldProcedureID:="test22";
                    ENDIF
                ENDIF
            ENDFOR

            IF numLayer=1 THEN
                rRobLayerTemp{1}.strWeldProcedureID:="test18";
                rRobLayerTemp{3}.strWeldProcedureID:="test18";
                rRobLayerTemp{5}.strWeldProcedureID:="test19";
                rRobLayerTemp{7}.strWeldProcedureID:="test20";

                !                rRobLayerTemp{1}.strWeldProcedureID:="test11";
                !                rRobLayerTemp{3}.strWeldProcedureID:="test11";
                !                rRobLayerTemp{5}.strWeldProcedureID:="test12";
                !                rRobLayerTemp{7}.strWeldProcedureID:="test13";

                rRobLayerTemp{13}.strWeldProcedureID:="test13";
                rRobLayerTemp{15}.strWeldProcedureID:="test13";
                rRobLayerTemp{17}.strWeldProcedureID:="test12";
                rRobLayerTemp{19}.strWeldProcedureID:="test11";
            ENDIF


            SetDataVal "rRob1Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
        ENDFOR

        FOR numLayer FROM numLayerNoStart TO numMultiPassTotal DO
            GetDataVal "rRob2Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
            IF numLayer<10 THEN
                GetDataVal "rLayerParamter0"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ELSE
                GetDataVal "rLayerParamter"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ENDIF

            numWobjEY_Index1:=rRobLayerTemp{1}.numWobjEY;
            numWobjEYPreDeclination_Index1:=numWobjEY_Index1+135;
            FOR i FROM 1 TO 19 DO
                IF numLayer=1 THEN
                    IF i=13 THEN
                        rRobLayerTemp{i}.numAngle:=52;
                        rRobLayerTemp{i}.numWobjX:=rPipeGrooveModelTemp.numBranchDiameter/2*Cos(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjY:=rPipeGrooveModelTemp.numBranchDiameter/2*Sin(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjEZ:=rRobLayerTemp{i}.numAngle;
                    ELSEIF i=14 THEN
                        rRobLayerTemp{i}.numAngle:=45;
                        rRobLayerTemp{i}.numWobjX:=rPipeGrooveModelTemp.numBranchDiameter/2*Cos(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjY:=rPipeGrooveModelTemp.numBranchDiameter/2*Sin(rRobLayerTemp{i}.numAngle);
                        rRobLayerTemp{i}.numWobjEZ:=rRobLayerTemp{i}.numAngle;
                    ENDIF
                ENDIF

                IF numWobjEY_Index1=-135 THEN
                    rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY+rLayerParamterTemp.numWorkAngleDeclination;
                ELSE
                    rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY-numWobjEYPreDeclination_Index1+rLayerParamterTemp.numWorkAngleDeclination;
                ENDIF

                rRobLayerTemp{i}.numTCSOffsetX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetX);
                rRobLayerTemp{i}.numTCSOffsetZ:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetZ);

                rRobLayerTemp{i}.numTCSRotationX:=0-GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationX);
                rRobLayerTemp{i}.numTCSRotationY:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationY);
                rRobLayerTemp{i}.numTCSRotationZ:=rRobLayerTemp{i}.numAngle+90;

                !                IF numLayer>=4 THEN
                !                    IF rRobLayerTemp{i}.numAngle>=60 AND rRobLayerTemp{i}.numAngle<=150 THEN
                !                        rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+Abs(rRobLayerTemp{i}.numAngle-150)/90*20;
                !                    ELSEIF rRobLayerTemp{i}.numAngle>=30 AND rRobLayerTemp{i}.numAngle<60 THEN
                !                        rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+20;
                !                    ELSEIF rRobLayerTemp{i}.numAngle<30 THEN
                !                        rRobLayerTemp{i}.numTCSRotationX:=rRobLayerTemp{i}.numTCSRotationX+20-Abs(rRobLayerTemp{i}.numAngle-30)/30*20;
                !                    ENDIF
                !                ENDIF

                IF numLayer=1 THEN
                    IF i=1 THEN
                        rRobLayerTemp{i}.numProcessType:=1;
                    ELSEIF i>=2 AND i<=5 THEN
                        rRobLayerTemp{i}.numProcessType:=5;
                    ELSEIF i>=6 AND i<=7 THEN
                        rRobLayerTemp{i}.numProcessType:=6;
                    ELSEIF i>=8 AND i<=11 THEN
                        rRobLayerTemp{i}.numProcessType:=8;
                    ELSEIF i>=12 AND i<=13 THEN
                        rRobLayerTemp{i}.numProcessType:=4;
                    ELSEIF i>=14 AND i<=17 THEN
                        rRobLayerTemp{i}.numProcessType:=5;
                    ELSEIF i>=18 AND i<=19 THEN
                        rRobLayerTemp{i}.numProcessType:=6;
                    ELSE
                        rRobLayerTemp{i}.numProcessType:=7;
                    ENDIF
                ELSE
                    IF i=1 THEN
                        rRobLayerTemp{i}.numProcessType:=1;
                    ELSEIF i>=18 AND i<=19 THEN
                        rRobLayerTemp{i}.numProcessType:=6;
                    ELSE
                        rRobLayerTemp{i}.numProcessType:=5;
                    ENDIF
                ENDIF

                rRobLayerTemp{i}.strWeldProcedureID:=rLayerParamterTemp.strWeldProcedureID;
                IF numLayer=2 THEN
                    IF rRobLayerTemp{i}.numAngle>=60 AND rRobLayerTemp{i}.numAngle<120 THEN
                        rRobLayerTemp{i}.strWeldProcedureID:="test15";
                    ENDIF
                ELSEIF numLayer=4 THEN
                    IF rRobLayerTemp{i}.numAngle>=40 AND rRobLayerTemp{i}.numAngle<140 THEN
                        rRobLayerTemp{i}.strWeldProcedureID:="test21";
                    ELSEIF rRobLayerTemp{i}.numAngle>=60 AND rRobLayerTemp{i}.numAngle<120 THEN
                        rRobLayerTemp{i}.strWeldProcedureID:="test22";
                    ENDIF
                ENDIF

            ENDFOR

            IF numLayer=1 THEN
                rRobLayerTemp{1}.strWeldProcedureID:="test18";
                rRobLayerTemp{3}.strWeldProcedureID:="test18";
                rRobLayerTemp{5}.strWeldProcedureID:="test19";
                rRobLayerTemp{7}.strWeldProcedureID:="test20";

                !                rRobLayerTemp{1}.strWeldProcedureID:="test11";
                !                rRobLayerTemp{3}.strWeldProcedureID:="test11";
                !                rRobLayerTemp{5}.strWeldProcedureID:="test12";
                !                rRobLayerTemp{7}.strWeldProcedureID:="test13";

                rRobLayerTemp{13}.strWeldProcedureID:="test13";
                rRobLayerTemp{15}.strWeldProcedureID:="test13";
                rRobLayerTemp{17}.strWeldProcedureID:="test12";
                rRobLayerTemp{19}.strWeldProcedureID:="test11";
            ENDIF

            SetDataVal "rRob2Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;

        ENDFOR

    ENDPROC

    PROC SaddleWeld()
        Logging\INFO,"SaddleWeld of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;

        InitRobLayerTargets;
        CopyMultiRobLayersV2 "_g","";
        rPipeGrooveModel.numPathSource:=1;

        WaitSyncTask SyncRobotsForTest21,taskListRob1Rob2Pos1;
        MultiPassWeldSync;

    ENDPROC

    PROC SaddleWeld2()
        Logging\INFO,"SaddleWeld of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;

        InitRobLayerTargetsV2 "_b";
        CopyMultiRobLayersV2 "_b","";
        rPipeGrooveModel.numPathSource:=1;

        !Michael, 2019-1-31, To eliminate undercut of seam at the last seam;
        IF rPipeGrooveModel.numMultiPassTotal=9 THEN
            GetDataVal "rRob1Layer"+ValToStr(rPipeGrooveModel.numMultiPassTotal),rRobLayerCur;
            rRobLayerCur{numRob1TargetsTotal{rPipeGrooveModel.numMultiPassTotal}-1}.numProcessType:=15;
            rRobLayerCur{numRob1TargetsTotal{rPipeGrooveModel.numMultiPassTotal}}.numProcessType:=15;
            rRobLayerCur{numRob1TargetsTotal{rPipeGrooveModel.numMultiPassTotal}+1}:=rRobLayerCur{2};
            rRobLayerCur{numRob1TargetsTotal{rPipeGrooveModel.numMultiPassTotal}+1}.numProcessType:=13;
            SetDataVal "rRob1Layer"+ValToStr(rPipeGrooveModel.numMultiPassTotal),rRobLayerCur;
            numRob1TargetsTotal{rPipeGrooveModel.numMultiPassTotal}:=numRob1TargetsTotal{rPipeGrooveModel.numMultiPassTotal}+1;

            GetDataVal "rRob2Layer"+ValToStr(rPipeGrooveModel.numMultiPassTotal),rRobLayerCur;
            rRobLayerCur{numRob2TargetsTotal{rPipeGrooveModel.numMultiPassTotal}-1}.numProcessType:=15;
            rRobLayerCur{numRob2TargetsTotal{rPipeGrooveModel.numMultiPassTotal}}.numProcessType:=15;
            rRobLayerCur{numRob2TargetsTotal{rPipeGrooveModel.numMultiPassTotal}+1}:=rRobLayerCur{2};
            rRobLayerCur{numRob2TargetsTotal{rPipeGrooveModel.numMultiPassTotal}+1}.numProcessType:=13;
            SetDataVal "rRob2Layer"+ValToStr(rPipeGrooveModel.numMultiPassTotal),rRobLayerCur;
            numRob2TargetsTotal{rPipeGrooveModel.numMultiPassTotal}:=numRob2TargetsTotal{rPipeGrooveModel.numMultiPassTotal}+1;
        ENDIF

        rRob2Layer6{25}.numTCSOffsetY:=5;

        WaitSyncTask SyncRobotsForTest22,taskListRob1Rob2Pos1;
        MultiPassWeldSync;

    ENDPROC

    PROC SaddleWeld3()
        !        VAR num numTemp;
        Logging\INFO,"SaddleWeld of "+PMgrTaskName()+" : "+pdTmpChk.pathProcName;

        InitRobLayerTargetsV3 "_c";
        CopyMultiRobLayersV2 "_c","";
        !        numTemp:=rRob1Layer1{1}.numWobjZ+150;
        !        FOR i FROM 1 TO 25 DO
        !            rRob1Layer1{i}.numWobjZ:=numTemp;
        !        ENDFOR
        rPipeGrooveModel.numPathSource:=1;

        WaitSyncTask SyncRobotsForTest23,taskListRob1Rob2Pos1;
        MultiPassWeldSync;

    ENDPROC

    PROC InitRobLayerTargetsV2(string strPostfix)
        VAR RECORDWeldTarget rRobLayerTemp{30};
        VAR RECORDPipeGrooveModel rPipeGrooveModelTemp;
        VAR RECORDLayerParamter rLayerParamterTemp;
        VAR num numWobjEY_Index1;
        VAR num numWobjEYPreDeclination_Index1;
        VAR num numMultiPassTotal;
        GetDataVal "rPipeGrooveModel"+strPostfix,rPipeGrooveModelTemp;
        numMultiPassTotal:=rPipeGrooveModelTemp.numMultiPassTotal;
        IF numMultiPassTotal<numLayerNoStart THEN
            numMultiPassTotal:=numLayerNoStart;
        ENDIF

        FOR numLayer FROM 1 TO numMultiPassTotal DO
            GetDataVal "rRob1Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
            IF numLayer<10 THEN
                GetDataVal "rLayerParamter0"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ELSE
                GetDataVal "rLayerParamter"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ENDIF
            numWobjEY_Index1:=rRobLayerTemp{1}.numWobjEY;
            numWobjEYPreDeclination_Index1:=numWobjEY_Index1+112.5;
            FOR i FROM 1 TO 25 DO
                rRobLayerTemp{i}.numTCSOffsetX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetX);
                rRobLayerTemp{i}.numTCSOffsetZ:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetZ);
                rRobLayerTemp{i}.numTCSRotationY:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationY);
                IF (rRobLayerTemp{i}.numAngle>90 AND rRobLayerTemp{i}.numAngle<180) OR (rRobLayerTemp{i}.numAngle>270 AND rRobLayerTemp{i}.numAngle<360) THEN
                    rRobLayerTemp{i}.numTCSRotationX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationX);
                ELSE
                    rRobLayerTemp{i}.numTCSRotationX:=0;
                ENDIF

                IF numWobjEY_Index1=-112.5 THEN
                    rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY+rLayerParamterTemp.numWorkAngleDeclination;
                ELSE
                    rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY-numWobjEYPreDeclination_Index1+rLayerParamterTemp.numWorkAngleDeclination;
                ENDIF

                rRobLayerTemp{i}.numTCSRotationZ:=-90+(i-1)*15;

                rRobLayerTemp{10}.numTCSRotationZ:=40;
                rRobLayerTemp{11}.numTCSRotationZ:=50;
                rRobLayerTemp{12}.numTCSRotationZ:=60;
                rRobLayerTemp{13}.numTCSRotationZ:=70;
                rRobLayerTemp{14}.numTCSRotationZ:=90;
                rRobLayerTemp{15}.numTCSRotationZ:=105;

                rRobLayerTemp{17}.numTCSRotationZ:=165;
                rRobLayerTemp{18}.numTCSRotationZ:=165;
                rRobLayerTemp{19}.numTCSRotationZ:=180;
                rRobLayerTemp{20}.numTCSRotationZ:=120;
                rRobLayerTemp{21}.numTCSRotationZ:=120;

                IF i=1 THEN
                    rRobLayerTemp{i}.numProcessType:=11;
                ELSEIF i<24 THEN
                    rRobLayerTemp{i}.numProcessType:=15;
                ELSE
                    rRobLayerTemp{i}.numProcessType:=16;
                ENDIF

                rRobLayerTemp{i}.strWeldProcedureID:=rLayerParamterTemp.strWeldProcedureID;

            ENDFOR
            SetDataVal "rRob1Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
        ENDFOR

        FOR numLayer FROM 1 TO numMultiPassTotal DO
            GetDataVal "rRob2Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
            IF numLayer<10 THEN
                GetDataVal "rLayerParamter0"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ELSE
                GetDataVal "rLayerParamter"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ENDIF
            numWobjEY_Index1:=rRobLayerTemp{1}.numWobjEY;
            numWobjEYPreDeclination_Index1:=numWobjEY_Index1+112.5;
            FOR i FROM 1 TO 25 DO
                rRobLayerTemp{i}.numTCSOffsetX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetX);
                rRobLayerTemp{i}.numTCSOffsetZ:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetZ);
                rRobLayerTemp{i}.numTCSRotationY:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationY);
                IF (rRobLayerTemp{i}.numAngle>90 AND rRobLayerTemp{i}.numAngle<180) OR (rRobLayerTemp{i}.numAngle>270 AND rRobLayerTemp{i}.numAngle<360) THEN
                    rRobLayerTemp{i}.numTCSRotationX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationX);
                ELSE
                    rRobLayerTemp{i}.numTCSRotationX:=0;
                ENDIF

                IF numWobjEY_Index1=-112.5 THEN
                    rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY+rLayerParamterTemp.numWorkAngleDeclination;
                ELSE
                    rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY-numWobjEYPreDeclination_Index1+rLayerParamterTemp.numWorkAngleDeclination;
                ENDIF

                rRobLayerTemp{i}.numTCSRotationZ:=(90+(i-1)*15) MOD 360;

                rRobLayerTemp{6}.numTCSRotationZ:=190;
                rRobLayerTemp{7}.numTCSRotationZ:=180;
                rRobLayerTemp{8}.numTCSRotationZ:=175;
                rRobLayerTemp{9}.numTCSRotationZ:=190;
                rRobLayerTemp{11}.numTCSRotationZ:=250;
                rRobLayerTemp{12}.numTCSRotationZ:=280;
                rRobLayerTemp{13}.numTCSRotationZ:=310;
                rRobLayerTemp{14}.numTCSRotationZ:=325;
                rRobLayerTemp{15}.numTCSRotationZ:=335;
                rRobLayerTemp{17}.numTCSRotationZ:=330;
                rRobLayerTemp{20}.numTCSRotationZ:=-15;

                IF i=1 THEN
                    rRobLayerTemp{i}.numProcessType:=11;
                ELSEIF i<24 THEN
                    rRobLayerTemp{i}.numProcessType:=15;
                ELSE
                    rRobLayerTemp{i}.numProcessType:=16;
                ENDIF

                rRobLayerTemp{i}.strWeldProcedureID:=rLayerParamterTemp.strWeldProcedureID;

            ENDFOR
            SetDataVal "rRob2Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
        ENDFOR
    ENDPROC

    PROC InitRobLayerTargetsV3(string strPostfix)
        VAR RECORDWeldTarget rRobLayerTemp{30};
        VAR RECORDPipeGrooveModel rPipeGrooveModelTemp;
        VAR RECORDLayerParamter rLayerParamterTemp;
        VAR num numWobjEY_Index1;
        VAR num numWobjEYPreDeclination_Index1;
        VAR num numMultiPassTotal;
        GetDataVal "rPipeGrooveModel"+strPostfix,rPipeGrooveModelTemp;
        numMultiPassTotal:=rPipeGrooveModelTemp.numMultiPassTotal;
        IF numMultiPassTotal<numLayerNoStart THEN
            numMultiPassTotal:=numLayerNoStart;
        ENDIF

        FOR numLayer FROM numLayerNoStart TO numMultiPassTotal DO
            GetDataVal "rRob1Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
            IF numLayer<10 THEN
                GetDataVal "rLayerParamter0"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ELSE
                GetDataVal "rLayerParamter"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ENDIF

            IF boolMoveLSubstituted=FALSE THEN
                WriteLayerParameterLog rPipeGrooveModelTemp,rLayerParamterTemp\PipeGrooveModelName:="rPipeGrooveModel"+strPostfix\LayerParameterName:="rLayerParamter"+ValToStr(numLayer)+strPostfix;
            ENDIF

            numWobjEY_Index1:=rRobLayerTemp{1}.numWobjEY;
            numWobjEYPreDeclination_Index1:=numWobjEY_Index1+112.5;
            FOR i FROM 1 TO 25 DO
                rRobLayerTemp{i}.numTCSOffsetX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetX);
                rRobLayerTemp{i}.numTCSOffsetZ:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetZ);
                rRobLayerTemp{i}.numTCSRotationY:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationY);
                IF (rRobLayerTemp{i}.numAngle>90 AND rRobLayerTemp{i}.numAngle<180) OR (rRobLayerTemp{i}.numAngle>270 AND rRobLayerTemp{i}.numAngle<360) THEN
                    rRobLayerTemp{i}.numTCSRotationX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationX);
                ELSE
                    rRobLayerTemp{i}.numTCSRotationX:=0;
                ENDIF

                IF numWobjEY_Index1=-112.5 THEN
                    rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY+rLayerParamterTemp.numWorkAngleDeclination;
                ELSE
                    rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY-numWobjEYPreDeclination_Index1+rLayerParamterTemp.numWorkAngleDeclination;
                ENDIF

                rRobLayerTemp{i}.numTCSRotationZ:=-90+(i-1)*15;
                rRobLayerTemp{1}.numTCSRotationZ:=-60;
                rRobLayerTemp{2}.numTCSRotationZ:=-45;
                rRobLayerTemp{3}.numTCSRotationZ:=-30;
                rRobLayerTemp{4}.numTCSRotationZ:=-15;
                rRobLayerTemp{5}.numTCSRotationZ:=0;
                rRobLayerTemp{6}.numTCSRotationZ:=0;
                rRobLayerTemp{5}.numTCSRotationZ:=0;
                rRobLayerTemp{6}.numTCSRotationZ:=0;
                rRobLayerTemp{7}.numTCSRotationZ:=0;
                rRobLayerTemp{8}.numTCSRotationZ:=0;
                rRobLayerTemp{9}.numTCSRotationZ:=0;
                rRobLayerTemp{10}.numTCSRotationZ:=0;
                rRobLayerTemp{11}.numTCSRotationZ:=0;
                rRobLayerTemp{12}.numTCSRotationZ:=15;
                rRobLayerTemp{13}.numTCSRotationZ:=30;

                rRobLayerTemp{14}.numTCSRotationZ:=45;
                rRobLayerTemp{15}.numTCSRotationZ:=60;
                rRobLayerTemp{16}.numTCSRotationZ:=60;
                rRobLayerTemp{17}.numTCSRotationZ:=80;
                rRobLayerTemp{18}.numTCSRotationZ:=105;
                rRobLayerTemp{19}.numTCSRotationZ:=120;
                rRobLayerTemp{20}.numTCSRotationZ:=150;
                rRobLayerTemp{21}.numTCSRotationZ:=180;
                rRobLayerTemp{22}.numTCSRotationZ:=210;
                rRobLayerTemp{23}.numTCSRotationZ:=240;
                rRobLayerTemp{24}.numTCSRotationZ:=270;
                rRobLayerTemp{25}.numTCSRotationZ:=300;

                IF i=1 THEN
                    rRobLayerTemp{i}.numProcessType:=11;
                ELSEIF i<24 THEN
                    rRobLayerTemp{i}.numProcessType:=15;
                ELSE
                    rRobLayerTemp{i}.numProcessType:=16;
                ENDIF

                rRobLayerTemp{i}.strWeldProcedureID:=rLayerParamterTemp.strWeldProcedureID;

            ENDFOR
            SetDataVal "rRob1Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
        ENDFOR

        FOR numLayer FROM numLayerNoStart TO numMultiPassTotal DO
            GetDataVal "rRob2Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
            IF numLayer<10 THEN
                GetDataVal "rLayerParamter0"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ELSE
                GetDataVal "rLayerParamter"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ENDIF
            numWobjEY_Index1:=rRobLayerTemp{1}.numWobjEY;
            numWobjEYPreDeclination_Index1:=numWobjEY_Index1+112.5;
            FOR i FROM 1 TO 25 DO
                rRobLayerTemp{i}.numTCSOffsetX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetX);
                rRobLayerTemp{i}.numTCSOffsetZ:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetZ);
                rRobLayerTemp{i}.numTCSRotationY:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationY);
                IF (rRobLayerTemp{i}.numAngle>90 AND rRobLayerTemp{i}.numAngle<180) OR (rRobLayerTemp{i}.numAngle>270 AND rRobLayerTemp{i}.numAngle<360) THEN
                    rRobLayerTemp{i}.numTCSRotationX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleRotationX);
                ELSE
                    rRobLayerTemp{i}.numTCSRotationX:=0;
                ENDIF

                IF numWobjEY_Index1=-112.5 THEN
                    rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY+rLayerParamterTemp.numWorkAngleDeclination;
                ELSE
                    rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY-numWobjEYPreDeclination_Index1+rLayerParamterTemp.numWorkAngleDeclination;
                ENDIF

                rRobLayerTemp{i}.numTCSRotationZ:=(90+(i-1)*15) MOD 360;

                rRobLayerTemp{6}.numTCSRotationZ:=190;
                rRobLayerTemp{7}.numTCSRotationZ:=180;
                rRobLayerTemp{8}.numTCSRotationZ:=175;
                rRobLayerTemp{9}.numTCSRotationZ:=190;
                rRobLayerTemp{11}.numTCSRotationZ:=250;
                rRobLayerTemp{12}.numTCSRotationZ:=280;
                rRobLayerTemp{13}.numTCSRotationZ:=310;
                rRobLayerTemp{14}.numTCSRotationZ:=325;
                rRobLayerTemp{15}.numTCSRotationZ:=335;
                rRobLayerTemp{17}.numTCSRotationZ:=330;
                rRobLayerTemp{20}.numTCSRotationZ:=-15;

                IF i=1 THEN
                    rRobLayerTemp{i}.numProcessType:=11;
                ELSEIF i<24 THEN
                    rRobLayerTemp{i}.numProcessType:=15;
                ELSE
                    rRobLayerTemp{i}.numProcessType:=16;
                ENDIF

                rRobLayerTemp{i}.strWeldProcedureID:=rLayerParamterTemp.strWeldProcedureID;

            ENDFOR
            SetDataVal "rRob2Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
        ENDFOR
    ENDPROC

    PROC InitRobLayerTargets()
        VAR string strPostfix:="_g";
        VAR RECORDWeldTarget rRobLayerTemp{100};
        VAR RECORDPipeGrooveModel rPipeGrooveModelTemp;
        VAR RECORDLayerParamter rLayerParamterTemp;
        VAR num numWobjEY_Index1;
        VAR num numMultiPassTotal;
        GetDataVal "rPipeGrooveModel"+strPostfix,rPipeGrooveModelTemp;
        numMultiPassTotal:=rPipeGrooveModelTemp.numMultiPassTotal;
        IF numMultiPassTotal<numLayerNoStart THEN
            numMultiPassTotal:=numLayerNoStart;
        ENDIF

        FOR numLayer FROM 1 TO 6 DO
            GetDataVal "rRob1Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
            IF numLayer<10 THEN
                GetDataVal "rLayerParamter0"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ELSE
                GetDataVal "rLayerParamter"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ENDIF
            FOR i FROM 1 TO 25 DO
                rRobLayerTemp{i}.numTCSOffsetX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetX);
                rRobLayerTemp{i}.numTCSOffsetZ:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetZ);

                !rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY+rLayerParamterTemp.numWorkAngleDeclination;
                rRobLayerTemp{i}.numTCSRotationZ:=-90+(i-1)*15;

                rRobLayerTemp{10}.numTCSRotationZ:=40;
                rRobLayerTemp{11}.numTCSRotationZ:=50;
                rRobLayerTemp{12}.numTCSRotationZ:=60;
                rRobLayerTemp{13}.numTCSRotationZ:=70;
                rRobLayerTemp{14}.numTCSRotationZ:=90;
                rRobLayerTemp{15}.numTCSRotationZ:=105;

                rRobLayerTemp{17}.numTCSRotationZ:=165;
                rRobLayerTemp{18}.numTCSRotationZ:=165;
                rRobLayerTemp{19}.numTCSRotationZ:=180;
                rRobLayerTemp{20}.numTCSRotationZ:=120;
                rRobLayerTemp{21}.numTCSRotationZ:=120;

                IF i=1 THEN
                    rRobLayerTemp{i}.numProcessType:=11;
                    !rRobLayerTemp{i}.numProcessType:=1;
                ELSEIF i<24 THEN
                    rRobLayerTemp{i}.numProcessType:=15;
                    !rRobLayerTemp{i}.numProcessType:=5;
                ELSE
                    rRobLayerTemp{i}.numProcessType:=16;
                    !rRobLayerTemp{i}.numProcessType:=6;
                ENDIF

                !for boolContinuous=TRUE
                !                IF rPipeGrooveModel.boolContinuous=TRUE THEN
                !                    IF numLayer=numLayerNoStart AND i=1 THEN
                !                        rRobLayerTemp{i}.numProcessType:=11;
                !                    ELSEIF i=1 THEN
                !                        rRobLayerTemp{i}.numProcessType:=12;
                !                    ELSEIF numLayer=rPipeGrooveModel.numMultiPassTotal AND (i=24 OR i=25) THEN
                !                        rRobLayerTemp{i}.numProcessType:=16;
                !                    ELSE
                !                        rRobLayerTemp{i}.numProcessType:=15;
                !                    ENDIF
                !                ENDIF

                rRobLayerTemp{i}.strWeldProcedureID:=rLayerParamterTemp.strWeldProcedureID;

            ENDFOR
            SetDataVal "rRob1Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
        ENDFOR

        FOR numLayer FROM 1 TO 6 DO
            GetDataVal "rRob2Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
            IF numLayer<10 THEN
                GetDataVal "rLayerParamter0"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ELSE
                GetDataVal "rLayerParamter"+ValToStr(numLayer)+strPostfix,rLayerParamterTemp;
            ENDIF
            FOR i FROM 1 TO 25 DO
                rRobLayerTemp{i}.numTCSOffsetX:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetX);
                rRobLayerTemp{i}.numTCSOffsetZ:=GetLayerInterpolation(rRobLayerTemp{i}.numAngle,rLayerParamterTemp.rCircleOffsetZ);

                !rRobLayerTemp{i}.numWobjEY:=rRobLayerTemp{i}.numWobjEY+rLayerParamterTemp.numWorkAngleDeclination;
                rRobLayerTemp{i}.numTCSRotationZ:=(90+(i-1)*15) MOD 360;

                rRobLayerTemp{6}.numTCSRotationZ:=190;
                rRobLayerTemp{7}.numTCSRotationZ:=180;
                rRobLayerTemp{8}.numTCSRotationZ:=175;
                rRobLayerTemp{9}.numTCSRotationZ:=190;
                rRobLayerTemp{11}.numTCSRotationZ:=250;
                rRobLayerTemp{12}.numTCSRotationZ:=280;
                rRobLayerTemp{13}.numTCSRotationZ:=310;
                rRobLayerTemp{14}.numTCSRotationZ:=325;
                rRobLayerTemp{15}.numTCSRotationZ:=335;
                rRobLayerTemp{17}.numTCSRotationZ:=330;

                !                rRobLayerTemp{17}.numTCSRotationZ:=165;
                !                rRobLayerTemp{18}.numTCSRotationZ:=165;
                !                rRobLayerTemp{19}.numTCSRotationZ:=180;
                rRobLayerTemp{20}.numTCSRotationZ:=-15;
                !                rRobLayerTemp{21}.numTCSRotationZ:=120;

                IF i=1 THEN
                    rRobLayerTemp{i}.numProcessType:=11;
                    !rRobLayerTemp{i}.numProcessType:=1;
                ELSEIF i<24 THEN
                    rRobLayerTemp{i}.numProcessType:=15;
                    !rRobLayerTemp{i}.numProcessType:=5;
                ELSE
                    rRobLayerTemp{i}.numProcessType:=16;
                    !rRobLayerTemp{i}.numProcessType:=6;
                ENDIF

                !for boolContinuous=TRUE
                !                IF rPipeGrooveModel.boolContinuous=TRUE THEN
                !                    IF numLayer=numLayerNoStart AND i=1 THEN
                !                        rRobLayerTemp{i}.numProcessType:=11;
                !                    ELSEIF i=1 THEN
                !                        rRobLayerTemp{i}.numProcessType:=12;
                !                    ELSEIF numLayer=rPipeGrooveModel.numMultiPassTotal AND (i=24 OR i=25) THEN
                !                        rRobLayerTemp{i}.numProcessType:=16;
                !                    ELSE
                !                        rRobLayerTemp{i}.numProcessType:=15;
                !                    ENDIF
                !                ENDIF

                rRobLayerTemp{i}.strWeldProcedureID:=rLayerParamterTemp.strWeldProcedureID;

            ENDFOR
            SetDataVal "rRob2Layer"+ValToStr(numLayer)+strPostfix,rRobLayerTemp;
        ENDFOR
    ENDPROC

    !Only for test
    PROC CopyMultiRobLayers(string strFrom,string strTo)
        VAR num numRobTargetsTotal{100};
        FOR i FROM 1 TO 10 DO
            GetDataVal "rRob1Layer"+ValToStr(i)+strFrom,rRobLayerCur;
            SetDataVal "rRob1Layer"+ValToStr(i)+strTo,rRobLayerCur;
            GetDataVal "rRob2Layer"+ValToStr(i)+strFrom,rRobLayerCur;
            SetDataVal "rRob2Layer"+ValToStr(i)+strTo,rRobLayerCur;

        ENDFOR
        GetDataVal "numRob1TargetsTotal"+strFrom,numRobTargetsTotal;
        SetDataVal "numRob1TargetsTotal"+strTo,numRobTargetsTotal;
        GetDataVal "numRob2TargetsTotal"+strFrom,numRobTargetsTotal;
        SetDataVal "numRob2TargetsTotal"+strTo,numRobTargetsTotal;
    ENDPROC

    PROC CopyMultiRobLayersV2(string strFrom,string strTo)
        VAR RECORDPipeGrooveModel rPipeGrooveModelTemp;
        VAR num numRob1TargetsTotalTemp{100};
        VAR num numRob2TargetsTotalTemp{100};
        VAR RECORDWeldTarget rWeldTargetTemp;
        VAR num numMultiPassTotal;
        GetDataVal "rPipeGrooveModel"+strFrom,rPipeGrooveModelTemp;
        numMultiPassTotal:=rPipeGrooveModelTemp.numMultiPassTotal;
        IF numMultiPassTotal<numLayerNoStart THEN
            numMultiPassTotal:=numLayerNoStart;
        ENDIF

        GetDataVal "rPipeGrooveModel"+strFrom,rPipeGrooveModelTemp;
        SetDataVal "rPipeGrooveModel"+strTo,rPipeGrooveModelTemp;
        GetDataVal "numRob1TargetsTotal"+strFrom,numRob1TargetsTotalTemp;
        SetDataVal "numRob1TargetsTotal"+strTo,numRob1TargetsTotalTemp;
        GetDataVal "numRob2TargetsTotal"+strFrom,numRob2TargetsTotalTemp;
        SetDataVal "numRob2TargetsTotal"+strTo,numRob2TargetsTotalTemp;

        FOR numLayerNo FROM 1 TO numMultiPassTotal STEP 1 DO
            FOR numIndex FROM 1 TO numRob1TargetsTotalTemp{numLayerNo} DO
                %"GetWeldTarget"+strFrom %1,numLayerNo,numIndex,rWeldTargetTemp;
                %"SetWeldTarget"+strTo %1,numLayerNo,numIndex,rWeldTargetTemp;
            ENDFOR
            FOR numIndex FROM 1 TO numRob2TargetsTotalTemp{numLayerNo} DO
                %"GetWeldTarget"+strFrom %2,numLayerNo,numIndex,rWeldTargetTemp;
                %"SetWeldTarget"+strTo %2,numLayerNo,numIndex,rWeldTargetTemp;
            ENDFOR
        ENDFOR

    ENDPROC

    PROC GetWeldTarget(num robNo,num layerNo,num index,inout RECORDWeldTarget rWeldTargetRef)
        GetDataVal "rRob"+ValToStr(robNo)+"Layer"+ValToStr(layerNo),rRobLayerCur;
        rWeldTargetRef:=rRobLayerCur{index};
    ENDPROC

    PROC SetWeldTarget(num robNo,num layerNo,num index,inout RECORDWeldTarget rWeldTargetRef)
        GetDataVal "rRob"+ValToStr(robNo)+"Layer"+ValToStr(layerNo),rRobLayerCur;
        rRobLayerCur{index}:=rWeldTargetRef;
        SetDataVal "rRob"+ValToStr(robNo)+"Layer"+ValToStr(layerNo),rRobLayerCur;
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
            ArcCEnd Offs(pWeld1,numWeldCenterDistance*(i-1)+numWeldDiameter/2,0-numWeldDiameter/2,0),Offs(pWeld1,numWeldCenterDistance*(i-1)+numWeldDiameter,0,0)\ID:=i*10+2,v100,seamWeld,weldWeld,fine,toolWeldGun;
            MoveL Offs(pWeld2,numWeldCenterDistance*(i-1),0,0)\ID:=i*10+3,v100,z10,toolWeldGun;
            WaitTime 5;
        ENDFOR
        SyncMoveOff SyncRobotsForTest26;
        MoveL pWeldReady,v100,fine,toolWeldGun;
    ENDPROC

ENDMODULE
MODULE ScanV2Module
    !*****************************************************
    !Module Name: ScanV2Module
    !Version:     1.0
    !Description: -
    !Date:        2018-12-26
    !Author:      Michael
    !*****************************************************

    PERS bool boolScanWaitSync:=FALSE;
    PERS bool boolDLSUseSmarTac:=TRUE;
    PERS bool boolOnlyUseSHPositionY:=FALSE;
    PERS bool boolOnlyUsePHPositionY:=TRUE;
    PERS num numScanDataArrayTrim:=1;

    PERS num numLinerSBScanAngle:=50;
    PERS num numLinerSHScanAngle:=55;

    PERS pos posLLCenterSPBRob1:=[2616.28,1.25958,293.327];
    PERS robtarget robtLLSPPSPBRob1:=[[2616.27,-36.2413,293.323],[0.707108,-0.707105,6.51256E-06,9.76062E-06],[-1,-1,-2,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS pos posLLClosestSPBRob1:=[2616.28,-35.4952,293.7];
    PERS pos posDLSCenterSPBRob1:=[2615.69,1.30539,293.686];
    PERS robtarget robtDLSSPPSPBRob1:=[[2615.69,-35.9414,293.715],[0.707116,-0.707098,-5.46308E-07,-1.43921E-06],[-1,-1,-2,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS pos posDLSClosestSPBRob1:=[2615.69,-35.3488,293.7];
    PERS num numLLSPBRadiusRob1:=37.7776;
    PERS num numDLSSPBRadiusRob1:=37.2838;

    PERS pos posLLCenterSPHRob1:=[2703.07,3.13079,7.21332];
    PERS robtarget robtLLSPPSPHRob1:=[[2703.09,-128.196,7.23092],[0.500009,-0.49999,0.499996,0.500006],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS pos posLLClosestSPHRob1:=[2703.1,-128.458,7.21332];
    PERS pos posDLSCenterSPHRob1:=[2703.25,3.73764,7.60993];
    PERS robtarget robtDLSSPPSPHRob1:=[[2703.26,-128.386,7.65147],[0.500014,-0.49999,0.499985,0.500011],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS pos posDLSClosestSPHRob1:=[2703.1,-129.044,7.60993];
    PERS num numLLSPHRadiusRob1:=131.928;
    PERS num numDLSSPHRadiusRob1:=132.313;

    PERS pos posLLCenterSSBRob1:=[957.552,-3.73442,257.9];
    PERS robtarget robtLLSPPSSBRob1:=[[957.576,-161.391,257.885],[8.79755E-06,2.37475E-05,0.707118,0.707095],[0,-1,1,1],[4262,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS pos posLLClosestSSBRob1:=[957.552,-160.408,268.15];
    PERS pos posDLSCenterSSBRob1:=[956.146,0.882462,259.287];
    PERS robtarget robtDLSSPPSSBRob1:=[[956.181,-161.609,259.261],[2.03711E-05,2.07692E-05,0.707115,0.707099],[0,-1,1,1],[4262,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS pos posDLSClosestSSBRob1:=[955,-160.115,268.15];
    PERS num numLLSSBRadiusRob1:=0;
    PERS num numDLSSSBRadiusRob1:=0;

    PERS pos posLLCenterSSHRob1:=[380,3.8147E-6,208.15];
    PERS robtarget robtLLSPPSSHRob1:=[[380.809,-58.937,158.199],[1.54142E-5,2.18225E-5,0.707085,0.707129],[0,-1,1,1],[4837,9E+9,9E+9,9E+9,9E+9,9E+9]];
    PERS pos posLLClosestSSHRob1:=[462.15,-108.15,0];
    PERS pos posDLSCenterSSHRob1:=[462.15,2.28882E-5,-1.90735E-5];
    PERS robtarget robtDLSSPPSSHRob1:=[[0,0,0],[1.54142E-5,2.18225E-5,0.707085,0.707129],[0,-1,1,1],[4837,9E+9,9E+9,9E+9,9E+9,9E+9]];
    PERS pos posDLSClosestSSHRob1:=[462.15,-108.15,0];
    PERS num numLLSSHRadiusRob1:=0;
    PERS num numDLSSSHRadiusRob1:=0;

    PERS num numCenterListXRob1{2}:=[2615.69,2616.28];
    PERS num numCenterListYRob1{12}:=[3.13079,3.13079,3.73764,3.73764,4.65559,4.65559,5.24155,5.24155,5.31372,5.31372,5.50383,5.50383];
    PERS num numCenterListZRob1{2}:=[7.21332,7.60993];
    PERS pos posOptimumCenterRob1:=[2615.98,4.73713,7.41163];


    PERS pos posLLCenterSPBRob2:=[2614.77,1.299,293.704];
    PERS robtarget robtLLSPPSPBRob2:=[[2614.79,37.5058,293.657],[0.499994,0.500013,0.500013,-0.499981],[0,0,0,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS pos posLLClosestSPBRob2:=[2614.77,37.3996,293.7];
    PERS pos posDLSCenterSPBRob2:=[2616.56,-0.515662,293.622];
    PERS robtarget robtDLSSPPSPBRob2:=[[2616.57,37.867,293.569],[0.499987,0.500015,0.500018,-0.499981],[0,0,0,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS pos posDLSClosestSPBRob2:=[2616.56,36.8136,293.7];
    PERS num numLLSPBRadiusRob2:=36.6285;
    PERS num numDLSSPBRadiusRob2:=37.2907;

    PERS pos posLLCenterSPHRob2:=[2703.1,4.43895,7.63207];
    PERS robtarget robtLLSPPSPHRob2:=[[2703.1,135.442,7.62293],[0.499986,0.499998,0.50001,-0.500007],[0,0,0,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS pos posLLClosestSPHRob2:=[2703.1,135.939,7.63207];
    PERS pos posDLSCenterSPHRob2:=[2703.35,3.51102,7.94061];
    PERS robtarget robtDLSSPPSPHRob2:=[[2703.33,135.388,7.94904],[0.499984,0.499993,0.500006,-0.500016],[0,0,0,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS pos posDLSClosestSPHRob2:=[2703.1,135.646,7.94061];
    PERS num numLLSPHRadiusRob2:=131.749;
    PERS num numDLSSPHRadiusRob2:=132.22;

    PERS pos posLLCenterSSBRob2:=[487.15,0,3.8147E-6];
    PERS robtarget robtLLSPPSSBRob2:=[[380.809,-58.937,158.199],[1.54142E-5,2.18225E-5,0.707085,0.707129],[0,-1,1,1],[4837,9E+9,9E+9,9E+9,9E+9,9E+9]];
    PERS pos posLLClosestSSBRob2:=[380,57.15,208.15];
    PERS pos posDLSCenterSSBRob2:=[380,-1.90735E-5,208.15];
    PERS robtarget robtDLSSPPSSBRob2:=[[0,0,0],[1.54142E-5,2.18225E-5,0.707085,0.707129],[0,-1,1,1],[4837,9E+9,9E+9,9E+9,9E+9,9E+9]];
    PERS pos posDLSClosestSSBRob2:=[380,57.15,208.15];
    PERS num numLLSSBRadiusRob2:=0;
    PERS num numDLSSSBRadiusRob2:=0;

    PERS pos posLLCenterSSHRob2:=[380,-1.90735E-5,208.15];
    PERS robtarget robtLLSPPSSHRob2:=[[380.809,-58.937,158.199],[1.54142E-5,2.18225E-5,0.707085,0.707129],[0,-1,1,1],[4837,9E+9,9E+9,9E+9,9E+9,9E+9]];
    PERS pos posLLClosestSSHRob2:=[462.15,108.15,0];
    PERS pos posDLSCenterSSHRob2:=[297.85,-2.28882E-5,-1.52588E-5];
    PERS robtarget robtDLSSPPSSHRob2:=[[0,0,0],[1.54142E-5,2.18225E-5,0.707085,0.707129],[0,-1,1,1],[4837,9E+9,9E+9,9E+9,9E+9,9E+9]];
    PERS pos posDLSClosestSSHRob2:=[462.15,108.15,0];
    PERS num numLLSSHRadiusRob2:=0;
    PERS num numDLSSSHRadiusRob2:=0;

    PERS num numCenterListXRob2{2}:=[2614.77,2616.56];
    PERS num numCenterListYRob2{12}:=[1.68813,1.68813,1.74243,1.74243,1.94556,1.94556,2.23853,2.23853,3.51102,3.51102,4.43895,4.43895];
    PERS num numCenterListZRob2{2}:=[7.63207,7.94061];
    PERS pos posOptimumCenterRob2:=[2615.67,2.35938,7.78634];

    PERS tasks taskListScan{3}:=[[""],[""],[""]];

    VAR iodev iodevOptimumCenter;
    PERS string strOptimumCenterFileName:="OptimumCenter.csv";
    PERS bool boolInitOptimumCenterLogFile:=FALSE;
    PERS bool boolStoreScanData:=TRUE;

    PROC ScanPlatoon()
        IF BitCheck(rPipeGrooveModel.numReviseScanBranchType,1) AND BitCheck(rPipeGrooveModel.numReviseScanBranchType,2) THEN
            taskListScan:=[["T_ROB1"],["T_ROB2"],[""]];
        ELSE
            taskListScan:=[[""],[""],[""]];
        ENDIF
        WaitSyncTask SyncWobjBranchScaningV2,taskListRob1Rob2;
        IF BitCheck(rPipeGrooveModel.numReviseScanBranchType,numCurTaskNo) THEN
            ScanPlatoonBranchWobj;
            IF boolStoreScanData THEN
                CopyFile "HOME:/"+strScanPlatoonBranchLogFileName,"HOME:/Logging/"+strScanPlatoonBranchLogFileName+" "+CDate()+" "+ValToStr(GetTime(\Hour))+"-"+ValToStr(GetTime(\Min))+"-"+ValToStr(GetTime(\Sec))+".csv";
            ENDIF
        ENDIF
        WaitSyncTask SyncWobjBranchScanedV2,taskListRob1Rob2;

        WaitSyncTask SyncWobjBranchScaned,taskListRob1Rob2Pos1;

        IF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,1) AND BitCheck(rPipeGrooveModel.numReviseScanHeaderType,2) THEN
            taskListScan:=[["T_ROB1"],["T_ROB2"],[""]];
        ELSE
            taskListScan:=[[""],[""],[""]];
        ENDIF
        WaitSyncTask SyncWobjHeaderScaningV2,taskListRob1Rob2;
        IF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,numCurTaskNo) THEN
            ScanPlatoonHeaderWobj;
            IF boolStoreScanData THEN
                CopyFile "HOME:/"+strScanPlatoonHeaderLogFileName,"HOME:/Logging/"+strScanPlatoonHeaderLogFileName+" "+CDate()+" "+ValToStr(GetTime(\Hour))+"-"+ValToStr(GetTime(\Min))+"-"+ValToStr(GetTime(\Sec))+".csv";
            ENDIF
        ENDIF
        WaitSyncTask SyncWobjHeaderScanedV2,taskListRob1Rob2;

        GetBestScanPlatoonData;

    ENDPROC

    PROC ScanSaddle()
        IF BitCheck(rPipeGrooveModel.numReviseScanBranchType,1) AND BitCheck(rPipeGrooveModel.numReviseScanBranchType,2) THEN
            taskListScan:=[["T_ROB1"],["T_ROB2"],[""]];
        ELSE
            taskListScan:=[[""],[""],[""]];
        ENDIF
        WaitSyncTask SyncWobjBranchScaningV2,taskListRob1Rob2;
        IF BitCheck(rPipeGrooveModel.numReviseScanBranchType,numCurTaskNo) THEN
            ScanSaddleBranchWobj;
            IF boolStoreScanData THEN
                CopyFile "HOME:/"+strScanSaddleBranchLogFileName,"HOME:/Logging/"+strScanSaddleBranchLogFileName+" "+CDate()+" "+ValToStr(GetTime(\Hour))+"-"+ValToStr(GetTime(\Min))+"-"+ValToStr(GetTime(\Sec))+".csv";
            ENDIF
        ENDIF
        WaitSyncTask SyncWobjBranchScanedV2,taskListRob1Rob2;

        WaitSyncTask SyncWobjBranchScaned,taskListRob1Rob2Pos1;

        IF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,1) AND BitCheck(rPipeGrooveModel.numReviseScanHeaderType,2) THEN
            taskListScan:=[["T_ROB1"],["T_ROB2"],[""]];
        ELSE
            taskListScan:=[[""],[""],[""]];
        ENDIF
        WaitSyncTask SyncWobjHeaderScaningV2,taskListRob1Rob2;
        IF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,numCurTaskNo) THEN
            ScanSaddleHeaderWobj;
            IF boolStoreScanData THEN
                CopyFile "HOME:/"+strScanSaddleHeaderLogFileName,"HOME:/Logging/"+strScanSaddleHeaderLogFileName+" "+CDate()+" "+ValToStr(GetTime(\Hour))+"-"+ValToStr(GetTime(\Min))+"-"+ValToStr(GetTime(\Sec))+".csv";
            ENDIF
        ENDIF
        WaitSyncTask SyncWobjHeaderScanedV2,taskListRob1Rob2;

        GetBestScanSaddleData;

    ENDPROC

    PROC ScanPlatoonBranchWobj()
        VAR pos posSPPOffsetForSmarTac;
        MoveAbsJ jointSPApproach,speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;

        IF numCurTaskNo=1 THEN
            robtSPBLLCCenter.rot:=OrientZYX(0,0,-90);
            robtSPBLLCCenter.trans.y:=0-rPipeGrooveModel.numBranchDiameter/2;
            robtSPBLLClosestDetect.rot:=OrientZYX(0,-90,-90);
            InitSPBTargetsV2 numSPBAngleFrom,numSPBAngleTo,numSPBPointsTotal,robtSPBLaserSmarTacs\Rob1;
            posSPPOffsetForSmarTac:=[0,0-rPipeGrooveModel.numBranchDiameter/2,0];
        ELSE
            !robtSPBLLCCenter.rot:=OrientZYX(0,0,90);
            robtSPBLLCCenter.rot:=OrientZYX(0,90,90);
            robtSPBLLCCenter.trans.y:=rPipeGrooveModel.numBranchDiameter/2;
            robtSPBLLClosestDetect.rot:=OrientZYX(0,0,90);
            InitSPBTargets numSPBAngleFrom,numSPBAngleTo,numSPBPointsTotal,robtSPBLaserSmarTacs\Rob2;
            posSPPOffsetForSmarTac:=[0,rPipeGrooveModel.numBranchDiameter/2,0];
        ENDIF
        robtSPBLLCCenter.trans.x:=rPipeGrooveModel.numSeamCenterX;
        robtSPBLLCCenter.trans.z:=rPipeGrooveModel.numHeaderDiameter/2+numSPBDeviation;
        robtSPBLLCCenter.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        robtSPBLLClosestDetect.trans.x:=rPipeGrooveModel.numSeamCenterX;
        robtSPBLLClosestDetect.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;

        InitScanPipeData strAiLaserName,numTCPLaserValue,strScanPlatoonBranchLogFileName,boolScanWaitSync\tasksScan:=taskListScan
                ,robtSPBLLCCenter,1,rPipeGrooveModel.numBranchDiameter*Sin(numLinerSBScanAngle),posSPPOffsetForSmarTac,robtSPBLLClosestDetect
                ,robtSPBLaserSmarTacs,numSPBPointsTotal,boolDLSUseSmarTac,robtSPBLLClosestDetect;

        ScanPipebyLaser toolLaser,wobjRailFixture;

        IF numCurTaskNo=1 THEN
            GetScanPipeResult posLLCenterSPBRob1,robtLLSPPSPBRob1,posLLClosestSPBRob1,posDLSCenterSPBRob1,robtDLSSPPSPBRob1,posDLSClosestSPBRob1\LLRadius:=numLLSPBRadiusRob1\DLSRadius:=numDLSSPBRadiusRob1;
        ELSE
            GetScanPipeResult posLLCenterSPBRob2,robtLLSPPSPBRob2,posLLClosestSPBRob2,posDLSCenterSPBRob2,robtDLSSPPSPBRob2,posDLSClosestSPBRob2\LLRadius:=numLLSPBRadiusRob2\DLSRadius:=numDLSSPBRadiusRob2;
        ENDIF

        MoveAbsJ jointSPDepart,speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;

    ENDPROC

    PROC ScanPlatoonHeaderWobj()
        VAR pos posSPPOffsetForSmarTac;
        MoveAbsJ jointSPApproach,speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;

        IF numCurTaskNo=1 THEN
            robtSPHLLCCenter.rot:=OrientZYX(90,90,0);
            robtSPHLLCCenter.trans.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
            robtSPHLLClosestDetect.rot:=OrientZYX(90,90,0);
            InitSPHTargetsV2 numSPHAngleFrom,numSPHAngleTo,numSPHPointsTotal,robtSPHLaserSmarTacs\Rob1;
            posSPPOffsetForSmarTac:=[0,0-rPipeGrooveModel.numHeaderDiameter/2,0];
        ELSE
            robtSPHLLCCenter.rot:=OrientZYX(-90,90,0);
            robtSPHLLCCenter.trans.y:=rPipeGrooveModel.numHeaderDiameter/2;
            robtSPHLLClosestDetect.rot:=OrientZYX(-90,90,0);
            InitSPHTargets numSPHAngleFrom,numSPHAngleTo,numSPHPointsTotal,robtSPHLaserSmarTacs\Rob2;
            posSPPOffsetForSmarTac:=[0,rPipeGrooveModel.numHeaderDiameter/2,0];
        ENDIF
        robtSPHLLCCenter.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSPHDeviation;
        robtSPHLLCCenter.trans.z:=0;
        robtSPHLLCCenter.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        robtSPHLLClosestDetect.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSPHDeviation;
        robtSPHLLClosestDetect.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;

        InitScanPipeData strAiLaserName,numTCPLaserValue,strScanPlatoonHeaderLogFileName,boolScanWaitSync\tasksScan:=taskListScan
                ,robtSPHLLCCenter,3,rPipeGrooveModel.numHeaderDiameter*Sin(numLinerSHScanAngle),posSPPOffsetForSmarTac,robtSPHLLClosestDetect
                ,robtSPHLaserSmarTacs,numSPHPointsTotal,boolDLSUseSmarTac,robtSPHLLClosestDetect;

        ScanPipebyLaser toolLaser,wobjRailFixture;

        IF numCurTaskNo=1 THEN
            GetScanPipeResult posLLCenterSPHRob1,robtLLSPPSPHRob1,posLLClosestSPHRob1,posDLSCenterSPHRob1,robtDLSSPPSPHRob1,posDLSClosestSPHRob1\LLRadius:=numLLSPHRadiusRob1\DLSRadius:=numDLSSPHRadiusRob1;
        ELSE
            GetScanPipeResult posLLCenterSPHRob2,robtLLSPPSPHRob2,posLLClosestSPHRob2,posDLSCenterSPHRob2,robtDLSSPPSPHRob2,posDLSClosestSPHRob2\LLRadius:=numLLSPHRadiusRob2\DLSRadius:=numDLSSPHRadiusRob2;
        ENDIF

        MoveAbsJ jointSPDepart,speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;
    ENDPROC

    PROC ScanSaddleBranchWobj()
        VAR pos posSPPOffsetForSmarTac;
        MoveAbsJ jointSSApproach,speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;

        IF numCurTaskNo=1 THEN
            robtSSBLLCCenter.rot:=OrientZYX(180,0,90);
            robtSSBLLCCenter.trans.y:=0-rPipeGrooveModel.numBranchDiameter/2;
            InitScanBranchTargets numSSBAngleFrom,numSSBAngleTo,numSSBPointsTotal,robtSSBLaserSmarTacs\Rob1;
            posSPPOffsetForSmarTac:=[0,0-rPipeGrooveModel.numBranchDiameter/2,0];
        ELSE
            robtSSBLLCCenter.rot:=OrientZYX(0,0,90);
            robtSSBLLCCenter.trans.y:=rPipeGrooveModel.numBranchDiameter/2;
            InitScanBranchTargets numSSBAngleFrom,numSSBAngleTo,numSSBPointsTotal,robtSSBLaserSmarTacs\Rob2;
            posSPPOffsetForSmarTac:=[0,rPipeGrooveModel.numBranchDiameter/2,0];
        ENDIF
        robtSSBLLCCenter.trans.x:=rPipeGrooveModel.numSeamCenterX;
        robtSSBLLCCenter.trans.z:=rPipeGrooveModel.numHeaderDiameter/2+numSSBDeviation;
        robtSSBLLCCenter.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;

        robtSSBLLClosestDetect:=robtSSBLLCCenter;
        robtSSBLLClosestDetect.rot:=robtSSBLLCCenter.rot;
        robtSSBLLClosestDetect.trans.x:=rPipeGrooveModel.numSeamCenterX;
        robtSSBLLClosestDetect.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;

        InitScanPipeData strAiLaserName,numTCPLaserValue,strScanSaddleBranchLogFileName,boolScanWaitSync\tasksScan:=taskListScan
                ,robtSSBLLCCenter,1,rPipeGrooveModel.numBranchDiameter*Sin(numLinerSBScanAngle),posSPPOffsetForSmarTac,robtSSBLLClosestDetect
                ,robtSSBLaserSmarTacs,numSSBPointsTotal,boolDLSUseSmarTac,robtSSBLLClosestDetect;

        ScanPipebyLaser toolLaser,wobjSTN1PLATE1;

        IF numCurTaskNo=1 THEN
            GetScanPipeResult posLLCenterSSBRob1,robtLLSPPSSBRob1,posLLClosestSSBRob1,posDLSCenterSSBRob1,robtDLSSPPSSBRob1,posDLSClosestSSBRob1\LLRadius:=numLLSSBRadiusRob1\DLSRadius:=numDLSSSBRadiusRob1;
        ELSE
            GetScanPipeResult posLLCenterSSBRob2,robtLLSPPSSBRob2,posLLClosestSSBRob2,posDLSCenterSSBRob2,robtDLSSPPSSBRob2,posDLSClosestSSBRob2\LLRadius:=numLLSSBRadiusRob2\DLSRadius:=numDLSSSBRadiusRob2;
        ENDIF

        MoveAbsJ jointSSDepart,speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;

    ENDPROC

    PROC ScanSaddleHeaderWobj()
        VAR pos posSPPOffsetForSmarTac;
        MoveAbsJ jointSPApproach,speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;

        IF numCurTaskNo=1 THEN
            robtSSHLLCCenter.rot:=OrientZYX(-90,-90,0);
            robtSSHLLCCenter.trans.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
            InitScanHeaderTargets numSSHAngleFrom,numSSHAngleTo,numSSHPointsTotal,robtSSHLaserSmarTacs\Rob1;
            posSPPOffsetForSmarTac:=[0,0-rPipeGrooveModel.numHeaderDiameter/2,0];
        ELSE
            robtSSHLLCCenter.rot:=OrientZYX(90,-90,0);
            robtSSHLLCCenter.trans.y:=rPipeGrooveModel.numHeaderDiameter/2;
            InitScanHeaderTargets numSSHAngleFrom,numSSHAngleTo,numSSHPointsTotal,robtSSHLaserSmarTacs\Rob2;
            posSPPOffsetForSmarTac:=[0,rPipeGrooveModel.numHeaderDiameter/2,0];
        ENDIF
        robtSSHLLCCenter.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSSHDeviation;
        robtSSHLLCCenter.trans.z:=0;
        robtSSHLLCCenter.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;

        robtSSHLLClosestDetect:=robtSSHLLCCenter;
        robtSSHLLClosestDetect.rot:=robtSSHLLCCenter.rot;
        robtSSHLLClosestDetect.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSSHDeviation;
        robtSSHLLClosestDetect.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;

        InitScanPipeData strAiLaserName,numTCPLaserValue,strScanSaddleHeaderLogFileName,boolScanWaitSync\tasksScan:=taskListScan
                ,robtSSHLLCCenter,3,rPipeGrooveModel.numHeaderDiameter*Sin(numLinerSHScanAngle),posSPPOffsetForSmarTac,robtSSHLLClosestDetect
                ,robtSSHLaserSmarTacs,numSSHPointsTotal,boolDLSUseSmarTac\ConfOnForSmarTac:=FALSE,robtSSHLLClosestDetect;

        ScanPipebyLaser toolLaser,wobjSTN1PLATE1;

        IF numCurTaskNo=1 THEN
            GetScanPipeResult posLLCenterSSHRob1,robtLLSPPSSHRob1,posLLClosestSSHRob1,posDLSCenterSSHRob1,robtDLSSPPSSHRob1,posDLSClosestSSHRob1\LLRadius:=numLLSSHRadiusRob1\DLSRadius:=numDLSSSHRadiusRob1;
        ELSE
            GetScanPipeResult posLLCenterSSHRob2,robtLLSPPSSHRob2,posLLClosestSSHRob2,posDLSCenterSSHRob2,robtDLSSPPSSHRob2,posDLSClosestSSHRob2\LLRadius:=numLLSSHRadiusRob2\DLSRadius:=numDLSSSHRadiusRob2;
        ENDIF

        MoveAbsJ jointSPDepart,speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;
    ENDPROC

    PROC GetBestScanPlatoonData()
        IF numCurTaskNo=1 THEN
            IF RobOS()=FALSE THEN
                posLLCenterSPBRob1:=posDLSCenterSPBRob1;
                robtLLSPPSPBRob1.trans.y:=0-rPipeGrooveModel.numBranchDiameter/2;
                posLLClosestSPBRob1.y:=0-rPipeGrooveModel.numBranchDiameter/2;
                robtDLSSPPSPBRob1.trans.y:=0-rPipeGrooveModel.numBranchDiameter/2;
                posDLSClosestSPBRob1.y:=0-rPipeGrooveModel.numBranchDiameter/2;

                posLLCenterSPHRob1:=posDLSCenterSPHRob1;
                robtLLSPPSPHRob1.trans.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
                posLLClosestSPHRob1.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
                robtDLSSPPSPHRob1.trans.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
                posDLSClosestSPHRob1.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
            ENDIF

            numCenterListXRob1{1}:=posLLCenterSPBRob1.x;
            numCenterListXRob1{2}:=posDLSCenterSPBRob1.x;

            IF boolOnlyUsePHPositionY THEN
                numCenterListYRob1{1}:=posLLCenterSPHRob1.y;
                numCenterListYRob1{2}:=robtLLSPPSPHRob1.trans.y+rPipeGrooveModel.numHeaderDiameter/2;
                numCenterListYRob1{3}:=posLLClosestSPHRob1.y+rPipeGrooveModel.numHeaderDiameter/2;
                numCenterListYRob1{4}:=posDLSCenterSPHRob1.y;
                numCenterListYRob1{5}:=robtDLSSPPSPHRob1.trans.y+rPipeGrooveModel.numHeaderDiameter/2;
                numCenterListYRob1{6}:=posDLSClosestSPHRob1.y+rPipeGrooveModel.numHeaderDiameter/2;
            ELSE
                numCenterListYRob1{1}:=posLLCenterSPBRob1.y;
                numCenterListYRob1{2}:=robtLLSPPSPBRob1.trans.y+rPipeGrooveModel.numBranchDiameter/2;
                numCenterListYRob1{3}:=posLLClosestSPBRob1.y+rPipeGrooveModel.numBranchDiameter/2;
                numCenterListYRob1{4}:=posDLSCenterSPBRob1.y;
                numCenterListYRob1{5}:=robtDLSSPPSPBRob1.trans.y+rPipeGrooveModel.numBranchDiameter/2;
                numCenterListYRob1{6}:=posDLSClosestSPBRob1.y+rPipeGrooveModel.numBranchDiameter/2;
            ENDIF

            numCenterListYRob1{7}:=posLLCenterSPHRob1.y;
            numCenterListYRob1{8}:=robtLLSPPSPHRob1.trans.y+rPipeGrooveModel.numHeaderDiameter/2;
            numCenterListYRob1{9}:=posLLClosestSPHRob1.y+rPipeGrooveModel.numHeaderDiameter/2;
            numCenterListYRob1{10}:=posDLSCenterSPHRob1.y;
            numCenterListYRob1{11}:=robtDLSSPPSPHRob1.trans.y+rPipeGrooveModel.numHeaderDiameter/2;
            numCenterListYRob1{12}:=posDLSClosestSPHRob1.y+rPipeGrooveModel.numHeaderDiameter/2;

            numCenterListZRob1{1}:=posLLCenterSPHRob1.z;
            numCenterListZRob1{2}:=posDLSCenterSPHRob1.z;

            BubbleSortNumArray numCenterListXRob1;
            BubbleSortNumArray numCenterListYRob1;
            BubbleSortNumArray numCenterListZRob1;

            posOptimumCenterRob1.x:=GetOptimumNumFromSortedArray(numCenterListXRob1,numScanDataArrayTrim);
            IF boolOnlyUsePHPositionY THEN
                posOptimumCenterRob1.y:=GetOptimumNumFromSortedArray(numCenterListYRob1,numScanDataArrayTrim*2);
            ELSE
                posOptimumCenterRob1.y:=GetOptimumNumFromSortedArray(numCenterListYRob1,numScanDataArrayTrim);
            ENDIF
            posOptimumCenterRob1.z:=GetOptimumNumFromSortedArray(numCenterListZRob1,numScanDataArrayTrim);
        ELSE
            IF RobOS()=FALSE THEN
                posLLCenterSPBRob2:=posDLSCenterSPBRob2;
                robtLLSPPSPBRob2.trans.y:=rPipeGrooveModel.numBranchDiameter/2;
                posLLClosestSPBRob2.y:=rPipeGrooveModel.numBranchDiameter/2;
                robtDLSSPPSPBRob2.trans.y:=rPipeGrooveModel.numBranchDiameter/2;
                posDLSClosestSPBRob2.y:=rPipeGrooveModel.numBranchDiameter/2;

                posLLCenterSPHRob2:=posDLSCenterSPHRob2;
                robtLLSPPSPHRob2.trans.y:=rPipeGrooveModel.numHeaderDiameter/2;
                posLLClosestSPHRob2.y:=rPipeGrooveModel.numHeaderDiameter/2;
                robtDLSSPPSPHRob2.trans.y:=rPipeGrooveModel.numHeaderDiameter/2;
                posDLSClosestSPHRob2.y:=rPipeGrooveModel.numHeaderDiameter/2;
            ENDIF

            numCenterListXRob2{1}:=posLLCenterSPBRob2.x;
            numCenterListXRob2{2}:=posDLSCenterSPBRob2.x;

            IF boolOnlyUsePHPositionY THEN
                numCenterListYRob2{1}:=posLLCenterSPHRob2.y;
                numCenterListYRob2{2}:=robtLLSPPSPHRob2.trans.y-rPipeGrooveModel.numHeaderDiameter/2;
                numCenterListYRob2{3}:=posLLClosestSPHRob2.y-rPipeGrooveModel.numHeaderDiameter/2;
                numCenterListYRob2{4}:=posDLSCenterSPHRob2.y;
                numCenterListYRob2{5}:=robtDLSSPPSPHRob2.trans.y-rPipeGrooveModel.numHeaderDiameter/2;
                numCenterListYRob2{6}:=posDLSClosestSPHRob2.y-rPipeGrooveModel.numHeaderDiameter/2;
            ELSE
                numCenterListYRob2{1}:=posLLCenterSPBRob2.y;
                numCenterListYRob2{2}:=robtLLSPPSPBRob2.trans.y-rPipeGrooveModel.numBranchDiameter/2;
                numCenterListYRob2{3}:=posLLClosestSPBRob2.y-rPipeGrooveModel.numBranchDiameter/2;
                numCenterListYRob2{4}:=posDLSCenterSPBRob2.y;
                numCenterListYRob2{5}:=robtDLSSPPSPBRob2.trans.y-rPipeGrooveModel.numBranchDiameter/2;
                numCenterListYRob2{6}:=posDLSClosestSPBRob2.y-rPipeGrooveModel.numBranchDiameter/2;
            ENDIF

            numCenterListYRob2{7}:=posLLCenterSPHRob2.y;
            numCenterListYRob2{8}:=robtLLSPPSPHRob2.trans.y-rPipeGrooveModel.numHeaderDiameter/2;
            numCenterListYRob2{9}:=posLLClosestSPHRob2.y-rPipeGrooveModel.numHeaderDiameter/2;
            numCenterListYRob2{10}:=posDLSCenterSPHRob2.y;
            numCenterListYRob2{11}:=robtDLSSPPSPHRob2.trans.y-rPipeGrooveModel.numHeaderDiameter/2;
            numCenterListYRob2{12}:=posDLSClosestSPHRob2.y-rPipeGrooveModel.numHeaderDiameter/2;

            numCenterListZRob2{1}:=posLLCenterSPHRob2.z;
            numCenterListZRob2{2}:=posDLSCenterSPHRob2.z;

            BubbleSortNumArray numCenterListXRob2;
            BubbleSortNumArray numCenterListYRob2;
            BubbleSortNumArray numCenterListZRob2;

            posOptimumCenterRob2.x:=GetOptimumNumFromSortedArray(numCenterListXRob2,numScanDataArrayTrim);
            IF boolOnlyUsePHPositionY THEN
                posOptimumCenterRob2.y:=GetOptimumNumFromSortedArray(numCenterListYRob2,numScanDataArrayTrim*2);
            ELSE
                posOptimumCenterRob2.y:=GetOptimumNumFromSortedArray(numCenterListYRob2,numScanDataArrayTrim);
            ENDIF
            posOptimumCenterRob2.z:=GetOptimumNumFromSortedArray(numCenterListZRob2,numScanDataArrayTrim);
        ENDIF

    ENDPROC

    PROC GetBestScanSaddleData()
        IF numCurTaskNo=1 THEN
            IF RobOS()=FALSE THEN
                posLLCenterSSBRob1:=posDLSCenterSSBRob1;
                robtLLSPPSSBRob1.trans.y:=0-rPipeGrooveModel.numBranchDiameter/2;
                posLLClosestSSBRob1.y:=0-rPipeGrooveModel.numBranchDiameter/2;
                robtDLSSPPSSBRob1.trans.y:=0-rPipeGrooveModel.numBranchDiameter/2;
                posDLSClosestSSBRob1.y:=0-rPipeGrooveModel.numBranchDiameter/2;

                posLLCenterSSHRob1:=posDLSCenterSSHRob1;
                robtLLSPPSSHRob1.trans.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
                posLLClosestSSHRob1.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
                robtDLSSPPSSHRob1.trans.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
                posDLSClosestSSHRob1.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
            ENDIF

            numCenterListXRob1{1}:=posLLCenterSSBRob1.x;
            numCenterListXRob1{2}:=posDLSCenterSSBRob1.x;

            IF boolOnlyUseSHPositionY THEN
                numCenterListYRob1{1}:=posLLCenterSSHRob1.y;
                numCenterListYRob1{2}:=robtLLSPPSSHRob1.trans.y+rPipeGrooveModel.numHeaderDiameter/2;
                numCenterListYRob1{3}:=posLLClosestSSHRob1.y+rPipeGrooveModel.numHeaderDiameter/2;
                numCenterListYRob1{4}:=posDLSCenterSSHRob1.y;
                numCenterListYRob1{5}:=robtDLSSPPSSHRob1.trans.y+rPipeGrooveModel.numHeaderDiameter/2;
                numCenterListYRob1{6}:=posDLSClosestSSHRob1.y+rPipeGrooveModel.numHeaderDiameter/2;
            ELSE
                numCenterListYRob1{1}:=posLLCenterSSBRob1.y;
                numCenterListYRob1{2}:=robtLLSPPSSBRob1.trans.y+rPipeGrooveModel.numBranchDiameter/2;
                numCenterListYRob1{3}:=posLLClosestSSBRob1.y+rPipeGrooveModel.numBranchDiameter/2;
                numCenterListYRob1{4}:=posDLSCenterSSBRob1.y;
                numCenterListYRob1{5}:=robtDLSSPPSSBRob1.trans.y+rPipeGrooveModel.numBranchDiameter/2;
                numCenterListYRob1{6}:=posDLSClosestSSBRob1.y+rPipeGrooveModel.numBranchDiameter/2;
            ENDIF

            numCenterListYRob1{7}:=posLLCenterSSHRob1.y;
            numCenterListYRob1{8}:=robtLLSPPSSHRob1.trans.y+rPipeGrooveModel.numHeaderDiameter/2;
            numCenterListYRob1{9}:=posLLClosestSSHRob1.y+rPipeGrooveModel.numHeaderDiameter/2;
            numCenterListYRob1{10}:=posDLSCenterSSHRob1.y;
            numCenterListYRob1{11}:=robtDLSSPPSSHRob1.trans.y+rPipeGrooveModel.numHeaderDiameter/2;
            numCenterListYRob1{12}:=posDLSClosestSSHRob1.y+rPipeGrooveModel.numHeaderDiameter/2;

            numCenterListZRob1{1}:=posLLCenterSSHRob1.z;
            numCenterListZRob1{2}:=posDLSCenterSSHRob1.z;

            BubbleSortNumArray numCenterListXRob1;
            BubbleSortNumArray numCenterListYRob1;
            BubbleSortNumArray numCenterListZRob1;

            posOptimumCenterRob1.x:=GetOptimumNumFromSortedArray(numCenterListXRob1,numScanDataArrayTrim);
            IF boolOnlyUseSHPositionY THEN
                posOptimumCenterRob1.y:=GetOptimumNumFromSortedArray(numCenterListYRob1,numScanDataArrayTrim*2);
            ELSE
                posOptimumCenterRob1.y:=GetOptimumNumFromSortedArray(numCenterListYRob1,numScanDataArrayTrim);
            ENDIF
            posOptimumCenterRob1.z:=GetOptimumNumFromSortedArray(numCenterListZRob1,numScanDataArrayTrim);
        ELSE
            IF RobOS()=FALSE THEN
                posLLCenterSSBRob2:=posDLSCenterSSBRob2;
                robtLLSPPSSBRob2.trans.y:=rPipeGrooveModel.numBranchDiameter/2;
                posLLClosestSSBRob2.y:=rPipeGrooveModel.numBranchDiameter/2;
                robtDLSSPPSSBRob2.trans.y:=rPipeGrooveModel.numBranchDiameter/2;
                posDLSClosestSSBRob2.y:=rPipeGrooveModel.numBranchDiameter/2;

                posLLCenterSSHRob2:=posDLSCenterSSHRob2;
                robtLLSPPSSHRob2.trans.y:=rPipeGrooveModel.numHeaderDiameter/2;
                posLLClosestSSHRob2.y:=rPipeGrooveModel.numHeaderDiameter/2;
                robtDLSSPPSSHRob2.trans.y:=rPipeGrooveModel.numHeaderDiameter/2;
                posDLSClosestSSHRob2.y:=rPipeGrooveModel.numHeaderDiameter/2;
            ENDIF

            numCenterListXRob2{1}:=posLLCenterSSBRob2.x;
            numCenterListXRob2{2}:=posDLSCenterSSBRob2.x;

            IF boolOnlyUseSHPositionY THEN
                numCenterListYRob2{1}:=posLLCenterSSHRob2.y;
                numCenterListYRob2{2}:=robtLLSPPSSHRob2.trans.y-rPipeGrooveModel.numHeaderDiameter/2;
                numCenterListYRob2{3}:=posLLClosestSSHRob2.y-rPipeGrooveModel.numHeaderDiameter/2;
                numCenterListYRob2{4}:=posDLSCenterSSHRob2.y;
                numCenterListYRob2{5}:=robtDLSSPPSSHRob2.trans.y-rPipeGrooveModel.numHeaderDiameter/2;
                numCenterListYRob2{6}:=posDLSClosestSSHRob2.y-rPipeGrooveModel.numHeaderDiameter/2;
            ELSE
                numCenterListYRob2{1}:=posLLCenterSSBRob2.y;
                numCenterListYRob2{2}:=robtLLSPPSSBRob2.trans.y-rPipeGrooveModel.numBranchDiameter/2;
                numCenterListYRob2{3}:=posLLClosestSSBRob2.y-rPipeGrooveModel.numBranchDiameter/2;
                numCenterListYRob2{4}:=posDLSCenterSSBRob2.y;
                numCenterListYRob2{5}:=robtDLSSPPSSBRob2.trans.y-rPipeGrooveModel.numBranchDiameter/2;
                numCenterListYRob2{6}:=posDLSClosestSSBRob2.y-rPipeGrooveModel.numBranchDiameter/2;
            ENDIF

            numCenterListYRob2{7}:=posLLCenterSSHRob2.y;
            numCenterListYRob2{8}:=robtLLSPPSSHRob2.trans.y-rPipeGrooveModel.numHeaderDiameter/2;
            numCenterListYRob2{9}:=posLLClosestSSHRob2.y-rPipeGrooveModel.numHeaderDiameter/2;
            numCenterListYRob2{10}:=posDLSCenterSSHRob2.y;
            numCenterListYRob2{11}:=robtDLSSPPSSHRob2.trans.y-rPipeGrooveModel.numHeaderDiameter/2;
            numCenterListYRob2{12}:=posDLSClosestSSHRob2.y-rPipeGrooveModel.numHeaderDiameter/2;

            numCenterListZRob2{1}:=posLLCenterSSHRob2.z;
            numCenterListZRob2{2}:=posDLSCenterSSHRob2.z;

            BubbleSortNumArray numCenterListXRob2;
            BubbleSortNumArray numCenterListYRob2;
            BubbleSortNumArray numCenterListZRob2;

            posOptimumCenterRob2.x:=GetOptimumNumFromSortedArray(numCenterListXRob2,numScanDataArrayTrim);
            IF boolOnlyUseSHPositionY THEN
                posOptimumCenterRob2.y:=GetOptimumNumFromSortedArray(numCenterListYRob2,numScanDataArrayTrim*2);
            ELSE
                posOptimumCenterRob2.y:=GetOptimumNumFromSortedArray(numCenterListYRob2,numScanDataArrayTrim);
            ENDIF
            posOptimumCenterRob2.z:=GetOptimumNumFromSortedArray(numCenterListZRob2,numScanDataArrayTrim);

        ENDIF

    ENDPROC

    PROC BubbleSortNumArray(inout num numArray{*})
        VAR num numTemp;
        VAR num numElementsTotal;
        numElementsTotal:=Dim(numArray,1);
        IF numElementsTotal>1 THEN
            FOR i FROM 1 TO numElementsTotal-1 DO
                FOR j FROM 1 TO numElementsTotal-i DO
                    IF numArray{j}>numArray{j+1} THEN
                        numTemp:=numArray{j};
                        numArray{j}:=numArray{j+1};
                        numArray{j+1}:=numTemp;
                    ENDIF
                ENDFOR
            ENDFOR
        ENDIF
    ENDPROC

    FUNC num GetOptimumNumFromSortedArray(inout num numArray{*},num numArrayTrim)
        VAR num numOptimum;
        IF Dim(numArray,1)-numArrayTrim*2<=0 THEN
            numArrayTrim:=0;
        ENDIF

        TEST Dim(numArray,1)
        CASE 1:
            numOptimum:=numArray{1};
        CASE 2:
            numOptimum:=(numArray{1}+numArray{2})/2;
        DEFAULT:
            numOptimum:=0;
            FOR i FROM numArrayTrim+1 TO Dim(numArray,1)-numArrayTrim DO
                numOptimum:=numOptimum+numArray{i};
            ENDFOR
            numOptimum:=numOptimum/(Dim(numArray,1)-numArrayTrim*2);
        ENDTEST
        RETURN numOptimum;
    ENDFUNC

    !For Rob1, ScanAngle: 210~330, rotate Axis Z, Axis X is degree 0
    !For Rob2, ScanAngle: 30~150, rotate Axis Z, Axis X is degree 0
    PROC InitSPBTargetsV2(num numScanAngleFrom,num numScanAngleTo,INOUT num numScanPointsTotal,INOUT robtarget robtScanPoints{*}\switch Rob1|switch Rob2\switch Laser|switch Wire)
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
                    robtScanPoints{i}.rot:=OrientZYX(0,-90,numTheta-360);
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
    PROC InitSPHTargetsV2(num numScanAngleFrom,num numScanAngleTo,INOUT num numScanPointsTotal,INOUT robtarget robtScanPoints{*}\switch Rob1|switch Rob2\switch Laser|switch Wire\num numRealGrooveX)
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

    !Michael, 2019-2-25, Add log file for scan pipe V2
    PROC WriteOptimumCenterLog()
        Close iodevOptimumCenter;
        IF boolInitOptimumCenterLogFile THEN
            Open "HOME:"\File:=strOptimumCenterFileName,iodevOptimumCenter;
            Write iodevOptimumCenter,"Time"+strTab+"BranchMethod"+strTab+"HeaderMethod"\NoNewLine;
            Write iodevOptimumCenter,strTab+"BranchDiameter"+strTab+"HeaderDiameter"+strTab+"PipeGrooveType"\NoNewLine;

            Write iodevOptimumCenter,strTab+"OptimumCenterRob1.x"+strTab+"OptimumCenterRob1.y"+strTab+"OptimumCenterRob1.z"\NoNewLine;
            Write iodevOptimumCenter,strTab+"OptimumCenterRob2.x"+strTab+"OptimumCenterRob2.y"+strTab+"OptimumCenterRob2.z"\NoNewLine;

            Write iodevOptimumCenter,strTab+"LLCenterSBRob1.x"+strTab+"DLSCenterSBRob1.x"\NoNewLine;
            Write iodevOptimumCenter,strTab+"LLCenterSBRob1.y"+strTab+"robtLLSPPSBRob1.trans.y"+strTab+"LLClosestSBRob1.y"\NoNewLine;
            Write iodevOptimumCenter,strTab+"DLSCenterSBRob1.y"+strTab+"robtDLSSPPSBRob1.trans.y"+strTab+"DLSClosestSBRob1.y"\NoNewLine;
            Write iodevOptimumCenter,strTab+"LLCenterSHRob1.x"+strTab+"DLSCenterSHRob1.x"\NoNewLine;
            Write iodevOptimumCenter,strTab+"LLCenterSHRob1.y"+strTab+"robtLLSPPSHRob1.trans.y"+strTab+"LLClosestSHRob1.y"\NoNewLine;
            Write iodevOptimumCenter,strTab+"DLSCenterSHRob1.y"+strTab+"robtDLSSPPSHRob1.trans.y"+strTab+"DLSClosestSHRob1.y"\NoNewLine;

            Write iodevOptimumCenter,strTab+"LLCenterSBRob2.x"+strTab+"DLSCenterSBRob2.x"\NoNewLine;
            Write iodevOptimumCenter,strTab+"LLCenterSBRob2.y"+strTab+"robtLLSPPSBRob2.trans.y"+strTab+"LLClosestSBRob2.y"\NoNewLine;
            Write iodevOptimumCenter,strTab+"DLSCenterSBRob2.y"+strTab+"robtDLSSPPSBRob2.trans.y"+strTab+"DLSClosestSBRob2.y"\NoNewLine;
            Write iodevOptimumCenter,strTab+"LLCenterSHRob2.x"+strTab+"DLSCenterSHRob2.x"\NoNewLine;
            Write iodevOptimumCenter,strTab+"LLCenterSHRob2.y"+strTab+"robtLLSPPSHRob2.trans.y"+strTab+"LLClosestSHRob2.y"\NoNewLine;
            Write iodevOptimumCenter,strTab+"DLSCenterSHRob2.y"+strTab+"robtDLSSPPSHRob2.trans.y"+strTab+"DLSClosestSHRob2.y";

            boolInitOptimumCenterLogFile:=FALSE;
        ELSE
            Open "HOME:"\File:=strOptimumCenterFileName,iodevOptimumCenter\Append;
        ENDIF
        Write iodevOptimumCenter,CDate()+" "+CTime()+strTab+ValToStr(numScanPlatoonBranchMethod)+strTab+ValToStr(numScanPlatoonHeaderMethod)\NoNewLine;
        Write iodevOptimumCenter,strTab+ValToStr(rPipeGrooveModel.numBranchDiameter)+strTab+ValToStr(rPipeGrooveModel.numHeaderDiameter)+strTab+ValToStr(rPipeGrooveModel.numPipeGrooveType)\NoNewLine;
        Write iodevOptimumCenter,strTab+ValToStr(posOptimumCenterRob1.x)+strTab+ValToStr(posOptimumCenterRob1.y)+strTab+ValToStr(posOptimumCenterRob1.z)\NoNewLine;
        Write iodevOptimumCenter,strTab+ValToStr(posOptimumCenterRob2.x)+strTab+ValToStr(posOptimumCenterRob2.y)+strTab+ValToStr(posOptimumCenterRob2.z)\NoNewLine;

        IF rPipeGrooveModel.numPipeGrooveType=3 THEN
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSSBRob1.x)+strTab+ValToStr(posDLSCenterSSBRob1.x)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSSBRob1.y)+strTab+ValToStr(robtLLSPPSSBRob1.trans.y+rPipeGrooveModel.numBranchDiameter/2)+strTab+ValToStr(posLLClosestSSBRob1.y+rPipeGrooveModel.numBranchDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posDLSCenterSSBRob1.y)+strTab+ValToStr(robtDLSSPPSSBRob1.trans.y+rPipeGrooveModel.numBranchDiameter/2)+strTab+ValToStr(posDLSClosestSSBRob1.y+rPipeGrooveModel.numBranchDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSSHRob1.y)+strTab+ValToStr(robtLLSPPSSHRob1.trans.y+rPipeGrooveModel.numHeaderDiameter/2)+strTab+ValToStr(posLLClosestSSHRob1.y+rPipeGrooveModel.numHeaderDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posDLSCenterSSHRob1.y)+strTab+ValToStr(robtDLSSPPSSHRob1.trans.y+rPipeGrooveModel.numHeaderDiameter/2)+strTab+ValToStr(posDLSClosestSSHRob1.y+rPipeGrooveModel.numHeaderDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSSHRob1.z)+strTab+ValToStr(posDLSCenterSSHRob1.z)\NoNewLine;

            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSSBRob2.x)+strTab+ValToStr(posDLSCenterSSBRob2.x)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSSBRob2.y)+strTab+ValToStr(robtLLSPPSSBRob2.trans.y+rPipeGrooveModel.numBranchDiameter/2)+strTab+ValToStr(posLLClosestSSBRob2.y+rPipeGrooveModel.numBranchDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posDLSCenterSSBRob2.y)+strTab+ValToStr(robtDLSSPPSSBRob2.trans.y+rPipeGrooveModel.numBranchDiameter/2)+strTab+ValToStr(posDLSClosestSSBRob2.y+rPipeGrooveModel.numBranchDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSSHRob2.y)+strTab+ValToStr(robtLLSPPSSHRob2.trans.y+rPipeGrooveModel.numHeaderDiameter/2)+strTab+ValToStr(posLLClosestSSHRob2.y+rPipeGrooveModel.numHeaderDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posDLSCenterSSHRob2.y)+strTab+ValToStr(robtDLSSPPSSHRob2.trans.y+rPipeGrooveModel.numHeaderDiameter/2)+strTab+ValToStr(posDLSClosestSSHRob2.y+rPipeGrooveModel.numHeaderDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSSHRob2.z)+strTab+ValToStr(posDLSCenterSSHRob2.z);
        ELSE
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSPBRob1.x)+strTab+ValToStr(posDLSCenterSPBRob1.x)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSPBRob1.y)+strTab+ValToStr(robtLLSPPSPBRob1.trans.y+rPipeGrooveModel.numBranchDiameter/2)+strTab+ValToStr(posLLClosestSPBRob1.y+rPipeGrooveModel.numBranchDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posDLSCenterSPBRob1.y)+strTab+ValToStr(robtDLSSPPSPBRob1.trans.y+rPipeGrooveModel.numBranchDiameter/2)+strTab+ValToStr(posDLSClosestSPBRob1.y+rPipeGrooveModel.numBranchDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSPHRob1.y)+strTab+ValToStr(robtLLSPPSPHRob1.trans.y+rPipeGrooveModel.numHeaderDiameter/2)+strTab+ValToStr(posLLClosestSPHRob1.y+rPipeGrooveModel.numHeaderDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posDLSCenterSPHRob1.y)+strTab+ValToStr(robtDLSSPPSPHRob1.trans.y+rPipeGrooveModel.numHeaderDiameter/2)+strTab+ValToStr(posDLSClosestSPHRob1.y+rPipeGrooveModel.numHeaderDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSPHRob1.z)+strTab+ValToStr(posDLSCenterSPHRob1.z)\NoNewLine;

            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSPBRob2.x)+strTab+ValToStr(posDLSCenterSPBRob2.x)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSPBRob2.y)+strTab+ValToStr(robtLLSPPSPBRob2.trans.y+rPipeGrooveModel.numBranchDiameter/2)+strTab+ValToStr(posLLClosestSPBRob2.y+rPipeGrooveModel.numBranchDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posDLSCenterSPBRob2.y)+strTab+ValToStr(robtDLSSPPSPBRob2.trans.y+rPipeGrooveModel.numBranchDiameter/2)+strTab+ValToStr(posDLSClosestSPBRob2.y+rPipeGrooveModel.numBranchDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSPHRob2.y)+strTab+ValToStr(robtLLSPPSPHRob2.trans.y+rPipeGrooveModel.numHeaderDiameter/2)+strTab+ValToStr(posLLClosestSPHRob2.y+rPipeGrooveModel.numHeaderDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posDLSCenterSPHRob2.y)+strTab+ValToStr(robtDLSSPPSPHRob2.trans.y+rPipeGrooveModel.numHeaderDiameter/2)+strTab+ValToStr(posDLSClosestSPHRob2.y+rPipeGrooveModel.numHeaderDiameter/2)\NoNewLine;
            Write iodevOptimumCenter,strTab+ValToStr(posLLCenterSPHRob2.z)+strTab+ValToStr(posDLSCenterSPHRob2.z);
        ENDIF

        Close iodevOptimumCenter;

    ENDPROC

ENDMODULE
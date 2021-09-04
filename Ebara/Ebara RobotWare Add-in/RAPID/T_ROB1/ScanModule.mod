MODULE ScanModule
    !*****************************************************
    !Module Name:   ScanModule
    !Version:       1.0
    !Description:   Global persistent data object is shared by all tasks
    !Date:          2018-10-31
    !Author:        Michael
    !*****************************************************

    !*****************************************************
    !Premise and Hypothesis:
    !The positioner is calibrated with good accuracy.
    !The axis of the turn table is parallel with the aixs of the header.
    !The axis of the branch is vertical.
    !Due to the deflection of the long pipe, the center of the header may not be coincided with the axis of the turn table.
    !Only the origin of the wobj is adjusted, the orientation of the wobj will not be calibrated.
    !The parent of the wobj is aligned with the base frame of the positioner.
    !*****************************************************

    !1 - By Laser SmarTac, 2 - By Wire SmarTac, 3 - By Linear Laser Scan, 4 - By Laser Reltool
    PERS num numScanSaddleBranchMethod:=1;
    !1 - By Laser SmarTac, 2 - By Wire SmarTac, 3 - By Linear Laser Scan, 4 - By Laser Reltool
    PERS num numScanSaddleHeaderMethod:=3;

    !1 - By Laser SmarTac, 2 - By Wire SmarTac, 3 - By Linear Laser Scan, 4 - By Laser Reltool
    PERS num numScanPlatoonBranchMethod:=3;
    !1 - By Laser SmarTac, 2 - By Wire SmarTac, 3 - By Linear Laser Scan, 4 - By Laser Reltool
    PERS num numScanPlatoonHeaderMethod:=3;

    !Avoid the TCP's flutter
    PERS num numWaitTimeForLaser:=0.5;
    PERS num numSmarTacOffsetZ:=-30;
    PERS num numLinerScanNominalTotal:=90;
    PERS num numLinerScanTrim:=10;
    !1 - Forward, 2 - Reverse, 3 - Bidirection
    PERS num numLinerScanDirection:=1;
    PERS string strTab:=",";

    PERS pos posRob1SSBCenter:=[378.59,1.11247,208.148];
    PERS num numRob1SSBRadius:=54.7086;
    PERS pos posRob1SSBNormal:=[-0.000247562,9.0492E-05,1];
    PERS num numRob1SSBRms:=1.20214;
    PERS num numRob1SSBMaxErr:=3.55115;
    PERS num numRob1SSBIndexWorst:=11;
    PERS pos posRob1SSBPeripheryCenter:=[378.584,-53.7077,158.208];
    PERS pos posRob1SSBLLSClosest:=[2445.14,-39.2247,268.227];
    PERS num numRob1SSBLLSClosestLaseValue:=-1.13377;

    PERS pos posRob1SSHCenter:=[1189.24,-6.24036,-0.45499];
    PERS num numRob1SSHRadius:=152.206;
    PERS pos posRob1SSHNormal:=[1,0.000277772,1.95459E-05];
    PERS num numRob1SSHRms:=1.45467;
    PERS num numRob1SSHMaxErr:=10.2602;
    PERS num numRob1SSHIndexWorst:=4;
    PERS pos posRob1SSHPeripheryCenter:=[1189.23,-158.521,-0.436458];
    PERS pos posRob1SSHLLSClosest:=[3338.12,-112.062,0.0704858];
    PERS num numRob1SSHLLSClosestLaseValue:=-3.91705;

    PERS pos posRob2SSBCenter:=[379.99,2.46017,208.132];
    PERS num numRob2SSBRadius:=57.1929;
    PERS pos posRob2SSBNormal:=[-0.00041304,-0.00016806,1];
    PERS num numRob2SSBRms:=0.338257;
    PERS num numRob2SSBMaxErr:=0.884877;
    PERS num numRob2SSBIndexWorst:=11;
    PERS pos posRob2SSBPeripheryCenter:=[380.016,59.3683,158.112];
    PERS pos posRob2SSBLLSClosest:=[2445.14,-39.2247,268.227];
    PERS num numRob2SSBLLSClosestLaseValue:=-1.13377;

    PERS pos posRob2SSHCenter:=[1189.17,-0.191145,-1.88248];
    PERS num numRob2SSHRadius:=159.434;
    PERS pos posRob2SSHNormal:=[1,-0.000505718,-8.69042E-05];
    PERS num numRob2SSHRms:=0.244452;
    PERS num numRob2SSHMaxErr:=1.4915;
    PERS num numRob2SSHIndexWorst:=43;
    PERS pos posRob2SSHPeripheryCenter:=[1189.27,158.927,-1.83617];
    PERS pos posRob2SSHLLSClosest:=[3794.88,107.444,7.88006];
    PERS num numRob2SSHLLSClosestLaseValue:=0.7004;

    PERS pos posRob1SPBCenter:=[3253.46,-4.15949,268.162];
    PERS num numRob1SPBRadius:=35.6816;
    PERS pos posRob1SPBNormal:=[0.00328108,-0.000137635,0.999995];
    PERS num numRob1SPBRms:=0.202919;
    PERS num numRob1SPBMaxErr:=0.438939;
    PERS num numRob1SPBIndexWorst:=18;
    PERS pos posRob1SPBPeripheryCenter:=[3253.43,-39.5811,268.149];
    PERS pos posRob1SPBLLSClosest:=[3255.15,-40.1118,268.15];
    PERS num numRob1SPBLLSClosestLaseValue:=-2.0127;

    PERS pos posRob1SPHCenter:=[3338.17,-3.20758,2.98773];
    PERS num numRob1SPHRadius:=107.86;
    PERS pos posRob1SPHNormal:=[-1,0.000628755,-4.61756E-05];
    PERS num numRob1SPHRms:=0.351451;
    PERS num numRob1SPHMaxErr:=1.03419;
    PERS num numRob1SPHIndexWorst:=46;
    PERS pos posRob1SPHPeripheryCenter:=[3338.09,-112.042,2.9765];
    PERS pos posRob1SPHLLSClosest:=[3338.12,-112.062,0.0704858];
    PERS num numRob1SPHLLSClosestLaseValue:=-3.91705;

    PERS pos posRob2SPBCenter:=[3251.92,-2.00993,268.135];
    PERS num numRob2SPBRadius:=40.0451;
    PERS pos posRob2SPBNormal:=[0.00385381,-0.000496165,0.999992];
    PERS num numRob2SPBRms:=0.231729;
    PERS num numRob2SPBMaxErr:=0.575305;
    PERS num numRob2SPBIndexWorst:=51;
    PERS pos posRob2SPBPeripheryCenter:=[3251.93,36.615,268.099];
    PERS pos posRob2SPBLLSClosest:=[3250.97,38.8752,268.151];
    PERS num numRob2SPBLLSClosestLaseValue:=-0.773644;

    PERS pos posRob2SPHCenter:=[3794.95,-1.96683,2.38997];
    PERS num numRob2SPHRadius:=109.268;
    PERS pos posRob2SPHNormal:=[1,0.000525682,0.00017095];
    PERS num numRob2SPHRms:=0.17041;
    PERS num numRob2SPHMaxErr:=0.526712;
    PERS num numRob2SPHIndexWorst:=36;
    PERS pos posRob2SPHPeripheryCenter:=[3794.89,106.495,2.36952];
    PERS pos posRob2SPHLLSClosest:=[3794.88,107.444,7.88006];
    PERS num numRob2SPHLLSClosestLaseValue:=0.7004;

    PERS bool boolSmarTacbyAiSignal:=FALSE;

    PROC ScanSaddleWobj()
        IF BitCheck(rPipeGrooveModel.numReviseScanBranchType,numCurTaskNo) THEN
            TEST numScanSaddleBranchMethod
            CASE 1,4:
                SSBbyLaserSmarTac;
            CASE 2:
                SSBbyWireSmarTac;
            CASE 3:
                SSBbyLinearLaserScan;
            DEFAULT:
            ENDTEST
        ENDIF

        WaitSyncTask SyncWobjBranchScaned,taskListRob1Rob2Pos1;

        IF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,numCurTaskNo) THEN
            TEST numScanSaddleHeaderMethod
            CASE 1,4:
                SSHbyLaserSmarTac;
            CASE 2:
                SSHbyWireSmarTac;
            CASE 3:
                SSHbyLinearLaserScan;
            DEFAULT:
            ENDTEST
        ENDIF

    ENDPROC

    PROC ScanPlatoonSinkingWobj()
        IF BitCheck(rPipeGrooveModel.numReviseScanBranchType,numCurTaskNo) THEN
            TEST numScanPlatoonBranchMethod
            CASE 1,4:
                SPBbyLaserSmarTac;
            CASE 2:

            CASE 3:
                SPBbyLinearLaserScan;
            DEFAULT:
            ENDTEST
        ENDIF

        WaitSyncTask SyncWobjBranchScaned,taskListRob1Rob2Pos1;

        IF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,numCurTaskNo) THEN
            TEST numScanPlatoonHeaderMethod
            CASE 1,4:
                SPHbyLaserSmarTac;
            CASE 2:
            CASE 3:
                SPHbyLinearLaserScan;
            DEFAULT:
            ENDTEST
        ENDIF

    ENDPROC

    PROC SSBbyLaserSmarTac()
        VAR robtarget robtCur;
        VAR robtarget robTemp;
        !VAR pos posRobPoints{100};

        MoveAbsJ jointSSApproach,speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;
        !ConfJ\Off;
        !ConfL\Off; 

        IF numCurTaskNo=1 THEN
            InitScanBranchTargets numSSBAngleFrom,numSSBAngleTo,numSSBPointsTotal,robtSSBLaserSmarTacs\Rob1;
            robtSSBLinerFrom.rot:=OrientZYX(180,0,90);
            robtSSBLinerFrom.trans.y:=-90;
        ELSE
            InitScanBranchTargets numSSBAngleFrom,numSSBAngleTo,numSSBPointsTotal,robtSSBLaserSmarTacs\Rob2;
            robtSSBLinerFrom.rot:=OrientZYX(0,0,90);
            robtSSBLinerFrom.trans.y:=90;
        ENDIF
        robtSSBLinerFrom.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        robtSSBLinerFrom.trans.z:=rPipeGrooveModel.numHeaderDiameter/2+numSSBDeviation;
        robtSSBLinerTo:=robtSSBLinerFrom;

        IF numSSBPointsTotal DIV 4>=1 THEN
            MoveJ RelTool(robtSSBLaserSmarTacs{numSSBPointsTotal DIV 4},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;
        ELSE
            MoveJ RelTool(robtSSBLaserSmarTacs{1},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;
        ENDIF

        Close iodevSSBLog;
        Open "HOME:"\File:=strSSBLogFileName,iodevSSBLog;
        Write iodevSSBLog,"Time"+strTab+"index"+strTab+"rob.x"+strTab+"rob.y"+strTab+"rob.z"\NoNewLine;
        Write iodevSSBLog,strTab+"laser.value"+strTab+"periphery.x"+strTab+"periphery.y"+strTab+"periphery.z";

        FOR i FROM 1 TO numSSBPointsTotal DO
            Logging\INFO, "Moving to scan branch target: "+ValToStr(i);
            IF numScanSaddleBranchMethod=1 THEN
                MoveJ RelTool(robtSSBLaserSmarTacs{i},0,0,numSmarTacOffsetZ),speedScan,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;
                Search_1D poseSSBs{i}\SearchStop:=robtSSBPeripherys{i},RelTool(robtSSBLaserSmarTacs{i},0,0,numSmarTacOffsetZ),robtSSBLaserSmarTacs{i},speedScan,toolLaser\WObj:=wobjSTN1PLATE1;
                numSSBLaserValues{i}:=0;
            ELSEIF numScanSaddleBranchMethod=4 THEN
                MoveJ robtSSBLaserSmarTacs{i},speedScan,fine,toolLaser\WObj:=wobjSTN1PLATE1;
                WaitTime\InPos,numWaitTimeForLaser;
                numSSBLaserValues{i}:=(aiLaserScan1-numLaser1OriginPosition);
                robtSSBPeripherys{i}:=reltool(robtSSBLaserSmarTacs{i},0,0,numSSBLaserValues{i});
            ENDIF

            !For Test
            !posRobPoints{i}:=robtSSBLaserSmarTacs{i}.trans;
            posSSBPeripherys{i}:=robtSSBPeripherys{i}.trans;

            robtCur:=CRobT();
            robtSSBLaserSmarTacs{i}.robconf:=robtCur.robconf;
            robtSSBLaserSmarTacs{i+1}.robconf:=robtCur.robconf;

            Write iodevSSBLog,CDate()+" "+CTime()+strTab+ValToStr(i)\NoNewLine;
            Write iodevSSBLog,strTab+ValToStr(robtSSBLaserSmarTacs{i}.trans.x)+strTab+ValToStr(robtSSBLaserSmarTacs{i}.trans.y)+strTab+ValToStr(robtSSBLaserSmarTacs{i}.trans.z)\NoNewLine;
            Write iodevSSBLog,strTab+ValToStr(numSSBLaserValues{i})+strTab+ValToStr(posSSBPeripherys{i}.x)+strTab+ValToStr(posSSBPeripherys{i}.y)+strTab+ValToStr(posSSBPeripherys{i}.z);
        ENDFOR

        Close iodevSSBLog;

        IF (numSSBPointsTotal DIV 4)*3>=1 THEN
            MoveJ RelTool(robtSSBLaserSmarTacs{(numSSBPointsTotal DIV 4)*3},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;
        ELSE
            MoveJ RelTool(robtSSBLaserSmarTacs{1},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;
        ENDIF

        !For Test
        !FitCircle posRobPoints\NumPoints:=numSSBPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;
        !Logging\INFO, "Theory Center="+ValToStr(center);
        !Logging\INFO, "radius="+ValToStr(radius)+", ScanbyLaserSmarTac="+ValToStr(boolScanbyLaserSmarTac);

        FitCircle posSSBPeripherys\NumPoints:=numSSBPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;

        Logging\INFO, "SSBCenter="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

        WaitSyncBranchPeripherySmarTac;

        robTemp:=robtSSBLinerFrom;
        robTemp.trans.x:=center.x;
        robTemp.trans.z:=robTemp.trans.z-50;
        IF numCurTaskNo=1 THEN
            robTemp.trans.y:=0-rPipeGrooveModel.numBranchDiameter/2;
        ELSE
            robTemp.trans.y:=rPipeGrooveModel.numBranchDiameter/2;
        ENDIF
        Search_1D poseSSBPeripheryCenter\SearchStop:=robtSSBPeripheryCenter,RelTool(robTemp,0,0,numSmarTacOffsetZ),robTemp,speedAir,toolLaser\WObj:=wobjSTN1PLATE1;

        Logging\INFO, "robtSSBPeripheryCenter="+ValToStr(robtSSBPeripheryCenter.trans);

        IF numCurTaskNo=1 THEN
            posRob1SSBCenter:=center;
            numRob1SSBRadius:=radius;
            posRob1SSBNormal:=normal;
            numRob1SSBRms:=rms;
            numRob1SSBMaxErr:=maxErr;
            numRob1SSBIndexWorst:=indexWorst;
            posRob1SSBPeripheryCenter:=robtSSBPeripheryCenter.trans;
        ELSE
            posRob2SSBCenter:=center;
            numRob2SSBRadius:=radius;
            posRob2SSBNormal:=normal;
            numRob2SSBRms:=rms;
            numRob2SSBMaxErr:=maxErr;
            numRob2SSBIndexWorst:=indexWorst;
            posRob2SSBPeripheryCenter:=robtSSBPeripheryCenter.trans;
        ENDIF

        !MoveAbsJ jointSSDepart,speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;
    ENDPROC

    PROC SSBbyWireSmarTac()
        VAR robtarget robtCur;
        !VAR pos posRobPoints{100};

        SetDO doWireLock1,1;

        MoveAbsJ jointSSApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;

        IF numCurTaskNo=1 THEN
            InitScanBranchTargets numSSBAngleFrom+20,numSSBAngleTo-20,numSSBPointsTotal,robtSSBWireSmarTacs\Rob1\Wire;
        ELSE
            InitScanBranchTargets numSSBAngleFrom,numSSBAngleTo,numSSBPointsTotal,robtSSBWireSmarTacs\Rob2\Wire;
        ENDIF

        IF numSSBPointsTotal DIV 4>=1 THEN
            MoveJ RelTool(robtSSBWireSmarTacs{numSSBPointsTotal DIV 4},0,0,-100),speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        ELSE
            MoveJ RelTool(robtSSBWireSmarTacs{1},0,0,-100),speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        ENDIF

        Close iodevSSBLog;
        Open "HOME:"\File:=strSSBLogFileName,iodevSSBLog;
        Write iodevSSBLog,"Time"+strTab+"index"+strTab+"rob.x"+strTab+"rob.y"+strTab+"rob.z"\NoNewLine;
        Write iodevSSBLog,strTab+"laser.value"+strTab+"periphery.x"+strTab+"periphery.y"+strTab+"periphery.z";

        FOR i FROM 1 TO numSSBPointsTotal DO
            Logging\INFO, "Moving to scan branch target: "+ValToStr(i);

            MoveJ RelTool(robtSSBWireSmarTacs{i},0,0,numSmarTacOffsetZ),speedScan,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
            Search_1D\Wire,poseSSBs{i}\SearchStop:=robtSSBPeripherys{i},RelTool(robtSSBWireSmarTacs{i},0,0,numSmarTacOffsetZ),robtSSBWireSmarTacs{i},speedScan,toolWeldGun\WObj:=wobjSTN1PLATE1;
            numSSBLaserValues{i}:=0;

            !For Test
            !posRobPoints{i}:=robtSSBWireSmarTacs{i}.trans;
            posSSBPeripherys{i}:=robtSSBPeripherys{i}.trans;

            robtCur:=CRobT();
            robtSSBWireSmarTacs{i}.robconf:=robtCur.robconf;
            !robtSSBWireSmarTacs{i+1}.robconf:=robtCur.robconf;

            Write iodevSSBLog,CDate()+" "+CTime()+strTab+ValToStr(i)\NoNewLine;
            Write iodevSSBLog,strTab+ValToStr(robtSSBWireSmarTacs{i}.trans.x)+strTab+ValToStr(robtSSBWireSmarTacs{i}.trans.y)+strTab+ValToStr(robtSSBWireSmarTacs{i}.trans.z)\NoNewLine;
            Write iodevSSBLog,strTab+ValToStr(numSSBLaserValues{i})+strTab+ValToStr(posSSBPeripherys{i}.x)+strTab+ValToStr(posSSBPeripherys{i}.y)+strTab+ValToStr(posSSBPeripherys{i}.z);
        ENDFOR

        Close iodevSSBLog;

        IF (numSSBPointsTotal DIV 4)*3>=1 THEN
            MoveL RelTool(robtSSBWireSmarTacs{(numSSBPointsTotal DIV 4)*3},0,0,-100),speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        ELSE
            MoveL RelTool(robtSSBWireSmarTacs{1},0,0,-100),speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        ENDIF

        !For Test
        !FitCircle posRobPoints\NumPoints:=numSSBPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;
        !Logging\INFO, "Theory Center="+ValToStr(center);
        !Logging\INFO, "radius="+ValToStr(radius)+", ScanbyLaserSmarTac="+ValToStr(boolScanbyLaserSmarTac);

        FitCircle posSSBPeripherys\NumPoints:=numSSBPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;

        IF numCurTaskNo=1 THEN
            posRob1SSBCenter:=center;
            numRob1SSBRadius:=radius;
            posRob1SSBNormal:=normal;
            numRob1SSBRms:=rms;
            numRob1SSBMaxErr:=maxErr;
            numRob1SSBIndexWorst:=indexWorst;
        ELSE
            posRob2SSBCenter:=center;
            numRob2SSBRadius:=radius;
            posRob2SSBNormal:=normal;
            numRob2SSBRms:=rms;
            numRob2SSBMaxErr:=maxErr;
            numRob2SSBIndexWorst:=indexWorst;
        ENDIF

        Logging\INFO, "SSBCenter="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

        !MoveAbsJ jointSSDepart,speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;

        SetDO doWireLock1,0;

    UNDO
        SetDO doWireLock1,0;

    ENDPROC

    PROC SSBbyLinearLaserScan()
        VAR robtarget robTemp;

        MoveAbsJ jointSSApproach,speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;

        IF numCurTaskNo=1 THEN
            robtSSBLinerFrom.rot:=OrientZYX(180,0,90);
            robtSSBLinerFrom.trans.y:=-90;
        ELSE
            robtSSBLinerFrom.rot:=OrientZYX(0,0,90);
            robtSSBLinerFrom.trans.y:=90;
        ENDIF
        robtSSBLinerFrom.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        robtSSBLinerFrom.trans.z:=rPipeGrooveModel.numHeaderDiameter/2+numSSBDeviation;
        robtSSBLinerTo:=robtSSBLinerFrom;

        TEST numLinerScanDirection
        CASE 1:
            robtSSBLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Sin(numLinerSHScanAngle);
            robtSSBLinerTo.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Sin(-numLinerSHScanAngle);
        CASE 2:
            robtSSBLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Sin(0-numLinerSHScanAngle);
            robtSSBLinerTo.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Sin(numLinerSHScanAngle);
        DEFAULT:
            robtSSBLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Sin(numLinerSHScanAngle);
            robtSSBLinerTo.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Sin(-numLinerSHScanAngle);
        ENDTEST

        speedLinearScan.v_tcp:=Trunc(rPipeGrooveModel.numBranchDiameter*Abs(Sin(numLinerSHScanAngle))/numLinerScanNominalTotal/0.1);
        numSSBLLSInterval:=Abs(robtSSBLinerFrom.trans.x-robtSSBLinerTo.trans.x)/speedLinearScan.v_tcp/numLinerScanNominalTotal;
        IF numSSBLLSInterval<0.1 THEN
            numSSBLLSInterval:=0.1;
        ENDIF

        MoveJ robtSSBLinerFrom,speedAir,fine,toolLaser\WObj:=wobjSTN1PLATE1;
        Logging\INFO, "Moved to robtSSBLinerFrom";
        WaitTime numWaitTimeForLaser;

        Close iodevSSBLog;
        Open "HOME:"\File:=strSSBLogFileName,iodevSSBLog;
        Write iodevSSBLog,"Time"+strTab+"index"+strTab+"rob.x"+strTab+"rob.y"+strTab+"rob.z"\NoNewLine;
        Write iodevSSBLog,strTab+"laser.value"+strTab+"periphery.x"+strTab+"periphery.y"+strTab+"periphery.z";

        numSSBLLSScan:=0;
        numSSBLLSClosestLaseValue:=1000;
        IDelete intSSBLinerLaserScan;
        CONNECT intSSBLinerLaserScan WITH TrapSSBLinerLaserScan;
        ITimer numSSBLLSInterval,intSSBLinerLaserScan;

        MoveL robtSSBLinerTo,speedLinearScan,fine,toolLaser\WObj:=wobjSTN1PLATE1;
        IDelete intSSBLinerLaserScan;
        Close iodevSSBLog;
        Logging\INFO, "Moved to robtSSBLinerTo";

        FOR i FROM 1 TO numSSBLLSScan DO
            IF i>numLinerScanTrim THEN
                posSSBPeripherys{i-numLinerScanTrim}:=posSSBPeripherys{i};
            ENDIF
        ENDFOR

        FitCircle posSSBPeripherys\NumPoints:=numSSBLLSScan-numLinerScanTrim*2,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;

        Logging\INFO, "SSBCenter="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

        WaitSyncBranchPeripherySmarTac;

        robTemp:=robtSSBLinerFrom;
        robTemp.trans.x:=center.x;
        IF numCurTaskNo=1 THEN
            robTemp.trans.y:=0-rPipeGrooveModel.numBranchDiameter/2;
        ELSE
            robTemp.trans.y:=rPipeGrooveModel.numBranchDiameter/2;
        ENDIF
        Search_1D poseSSBPeripheryCenter\SearchStop:=robtSSBPeripheryCenter,RelTool(robTemp,0,0,numSmarTacOffsetZ),robTemp,speedAir,toolLaser\WObj:=wobjSTN1PLATE1;

        Logging\INFO, "robtSSBPeripheryCenter="+ValToStr(robtSSBPeripheryCenter.trans);
        Logging\INFO, "numSSBLLSScan="+ValToStr(numSSBLLSScan)+", numSSBLLSInterval="+ValToStr(numSSBLLSInterval);
        Logging\INFO, "posSSBLLSClosest="+ValToStr(posSSBLLSClosest);
        Logging\INFO, "numSSBLLSClosestLaseValue="+ValToStr(numSSBLLSClosestLaseValue)+", numSSBLLSClosestIndex="+ValToStr(numSSBLLSClosestIndex);

        IF numCurTaskNo=1 THEN
            posRob1SSBCenter:=center;
            numRob1SSBRadius:=radius;
            posRob1SSBNormal:=normal;
            numRob1SSBRms:=rms;
            numRob1SSBMaxErr:=maxErr;
            numRob1SSBIndexWorst:=indexWorst;
            posRob1SSBPeripheryCenter:=robtSSBPeripheryCenter.trans;
            posRob1SSBLLSClosest:=posSSBLLSClosest;
            numRob1SSBLLSClosestLaseValue:=numSSBLLSClosestLaseValue;
        ELSE
            posRob2SSBCenter:=center;
            numRob2SSBRadius:=radius;
            posRob2SSBNormal:=normal;
            numRob2SSBRms:=rms;
            numRob2SSBMaxErr:=maxErr;
            numRob2SSBIndexWorst:=indexWorst;
            posRob2SSBPeripheryCenter:=robtSSBPeripheryCenter.trans;
            posRob2SSBLLSClosest:=posSSBLLSClosest;
            numRob2SSBLLSClosestLaseValue:=numSSBLLSClosestLaseValue;
        ENDIF

        !MoveAbsJ jointSSDepart,speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;

    ENDPROC

    TRAP TrapSSBLinerLaserScan
        VAR robtarget robtCur;
        VAR robtarget robtReal;
        VAR num numLaserOffset;
        robtCur:=CRobT();
        IF numCurTaskNo=1 THEN
            numLaserOffset:=aiLaserScan1-numLaser1OriginPosition;
        ELSE
            numLaserOffset:=aiLaserScan2-numLaser2OriginPosition;
        ENDIF
        robtReal:=reltool(robtCur,0,0,numLaserOffset);
        Incr numSSBLLSScan;
        posSSBPeripherys{numSSBLLSScan}:=robtReal.trans;
        IF numLaserOffset<numSSBLLSClosestLaseValue THEN
            posSSBLLSClosest:=posSSBPeripherys{numSSBLLSScan};
            numSSBLLSClosestIndex:=numSSBLLSScan;
            numSSBLLSClosestLaseValue:=numLaserOffset;
        ENDIF
        Write iodevSSBLog,CDate()+" "+CTime()+strTab+ValToStr(numSSBLLSScan)\NoNewLine;
        Write iodevSSBLog,strTab+ValToStr(robtCur.trans.x)+strTab+ValToStr(robtCur.trans.y)+strTab+ValToStr(robtCur.trans.z)\NoNewLine;
        Write iodevSSBLog,strTab+ValToStr(numLaserOffset)+strTab+ValToStr(robtReal.trans.x)+strTab+ValToStr(robtReal.trans.y)+strTab+ValToStr(robtReal.trans.z);
    ENDTRAP

    PROC SSHbyLaserSmarTac()
        VAR robtarget robtCur;
        !VAR pos posRobPoints{100};

        MoveAbsJ jointSSApproach,speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;

        IF numCurTaskNo=1 THEN
            InitScanHeaderTargets numSSHAngleFrom,numSSHAngleTo,numSSHPointsTotal,robtSSHLaserSmarTacs\Rob1;
        ELSE
            InitScanHeaderTargets numSSHAngleFrom,numSSHAngleTo,numSSHPointsTotal,robtSSHLaserSmarTacs\Rob2;
        ENDIF

        ConfJ\Off;
        ConfL\Off;

        IF numSSHPointsTotal DIV 4>=1 THEN
            MoveJ RelTool(robtSSHLaserSmarTacs{numSSHPointsTotal DIV 4},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;
        ELSE
            MoveJ RelTool(robtSSHLaserSmarTacs{1},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;
        ENDIF

        Close iodevSSHLog;
        Open "HOME:"\File:=strSSHLogFileName,iodevSSHLog;
        Write iodevSSHLog,"Time"+strTab+"index"+strTab+"rob.x"+strTab+"rob.y"+strTab+"rob.z"\NoNewLine;
        Write iodevSSHLog,strTab+"laser.value"+strTab+"periphery.x"+strTab+"periphery.y"+strTab+"periphery.z";

        FOR i FROM 1 TO numSSHPointsTotal DO
            Logging\INFO, "Moving to scan header target: "+ValToStr(i);
            IF numScanSaddleBranchMethod=1 THEN
                MoveJ RelTool(robtSSHLaserSmarTacs{i},0,0,numSmarTacOffsetZ),speedScan,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;
                Search_1D poseSSHs{i}\SearchStop:=robtSSHPeripherys{i},RelTool(robtSSHLaserSmarTacs{i},0,0,numSmarTacOffsetZ),robtSSHLaserSmarTacs{i},speedScan,toolLaser\WObj:=wobjSTN1PLATE1;
                numSSHLaserValues{i}:=0;
            ELSEIF numScanSaddleBranchMethod=4 THEN
                MoveJ robtSSHLaserSmarTacs{i},speedScan,fine,toolLaser\WObj:=wobjSTN1PLATE1;
                WaitTime\InPos,numWaitTimeForLaser;
                numSSHLaserValues{i}:=(aiLaserScan1-numLaser1OriginPosition);
                robtSSHPeripherys{i}:=reltool(robtSSHLaserSmarTacs{i},0,0,numSSHLaserValues{i});
            ENDIF

            !For Test
            !posRobPoints{i}:=robtSSHLaserSmarTacs{i}.trans;
            posSSHPeripherys{i}:=robtSSHPeripherys{i}.trans;

            robtCur:=CRobT();
            robtSSHLaserSmarTacs{i}.robconf:=robtCur.robconf;
            robtSSHLaserSmarTacs{i+1}.robconf:=robtCur.robconf;

            Write iodevSSHLog,CDate()+" "+CTime()+strTab+ValToStr(i)\NoNewLine;
            Write iodevSSHLog,strTab+ValToStr(robtSSHLaserSmarTacs{i}.trans.x)+strTab+ValToStr(robtSSHLaserSmarTacs{i}.trans.y)+strTab+ValToStr(robtSSHLaserSmarTacs{i}.trans.z)\NoNewLine;
            Write iodevSSHLog,strTab+ValToStr(numSSHLaserValues{i})+strTab+ValToStr(posSSHPeripherys{i}.x)+strTab+ValToStr(posSSHPeripherys{i}.y)+strTab+ValToStr(posSSHPeripherys{i}.z);
        ENDFOR

        Close iodevSSHLog;

        IF boolConfOn THEN
            ConfJ\On;
            ConfL\On;
        ELSE
            ConfJ\Off;
            ConfL\Off;
        ENDIF

        IF (numSSHPointsTotal DIV 4)*3>=1 THEN
            MoveJ RelTool(robtSSHLaserSmarTacs{(numSSHPointsTotal DIV 4)*3},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;
        ELSE
            MoveJ RelTool(robtSSHLaserSmarTacs{1},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;
        ENDIF

        !For Test
        !FitCircle posRobPoints\NumPoints:=numSSHPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;
        !Logging\INFO, "Theory Center="+ValToStr(center);
        !Logging\INFO, "radius="+ValToStr(radius)+", ScanbyLaserSmarTac="+ValToStr(boolScanbyLaserSmarTac);

        FitCircle posSSHPeripherys\NumPoints:=numSSHPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;

        IF numCurTaskNo=1 THEN
            posRob1SSHCenter:=center;
            numRob1SSHRadius:=radius;
            posRob1SSHNormal:=normal;
            numRob1SSHRms:=rms;
            numRob1SSHMaxErr:=maxErr;
            numRob1SSHIndexWorst:=indexWorst;
        ELSE
            posRob2SSHCenter:=center;
            numRob2SSHRadius:=radius;
            posRob2SSHNormal:=normal;
            numRob2SSHRms:=rms;
            numRob2SSHMaxErr:=maxErr;
            numRob2SSHIndexWorst:=indexWorst;
        ENDIF

        Logging\INFO, "SSHCenter="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

        MoveAbsJ jointSSDepart,speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;

    ENDPROC

    PROC SSHbyWireSmarTac()
        VAR robtarget robtCur;
        !VAR pos posRobPoints{100};
        SetDO doWireLock1,1;

        MoveAbsJ jointSSApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;

        IF numCurTaskNo=1 THEN
            InitScanHeaderTargets numSSHAngleFrom,numSSHAngleTo,numSSHPointsTotal,robtSSHWireSmarTacs\Rob1\Wire;
        ELSE
            InitScanHeaderTargets numSSHAngleFrom,numSSHAngleTo,numSSHPointsTotal,robtSSHWireSmarTacs\Rob2\Wire;
        ENDIF

        !ConfJ\Off;
        !ConfL\Off;

        IF numSSHPointsTotal DIV 4>=1 THEN
            MoveJ RelTool(robtSSHWireSmarTacs{numSSHPointsTotal DIV 4},0,0,-100),speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        ELSE
            MoveJ RelTool(robtSSHWireSmarTacs{1},0,0,-100),speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        ENDIF

        Close iodevSSHLog;
        Open "HOME:"\File:=strSSHLogFileName,iodevSSHLog;
        Write iodevSSHLog,"Time"+strTab+"index"+strTab+"rob.x"+strTab+"rob.y"+strTab+"rob.z"\NoNewLine;
        Write iodevSSHLog,strTab+"laser.value"+strTab+"periphery.x"+strTab+"periphery.y"+strTab+"periphery.z";

        FOR i FROM 1 TO numSSHPointsTotal DO
            Logging\INFO, "Moving to scan header target: "+ValToStr(i);

            MoveJ RelTool(robtSSHWireSmarTacs{i},0,0,numSmarTacOffsetZ),speedScan,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
            Search_1D\Wire,poseSSHs{i}\SearchStop:=robtSSHPeripherys{i},RelTool(robtSSHWireSmarTacs{i},0,0,numSmarTacOffsetZ),robtSSHWireSmarTacs{i},speedScan,toolWeldGun\WObj:=wobjSTN1PLATE1;
            numSSHLaserValues{i}:=0;

            !For Test
            !posRobPoints{i}:=robtSSHWireSmarTacs{i}.trans;
            posSSHPeripherys{i}:=robtSSHPeripherys{i}.trans;

            robtCur:=CRobT();
            robtSSHWireSmarTacs{i}.robconf:=robtCur.robconf;
            !robtSSHWireSmarTacs{i+1}.robconf:=robtCur.robconf;

            Write iodevSSHLog,CDate()+" "+CTime()+strTab+ValToStr(i)\NoNewLine;
            Write iodevSSHLog,strTab+ValToStr(robtSSHWireSmarTacs{i}.trans.x)+strTab+ValToStr(robtSSHWireSmarTacs{i}.trans.y)+strTab+ValToStr(robtSSHWireSmarTacs{i}.trans.z)\NoNewLine;
            Write iodevSSHLog,strTab+ValToStr(numSSHLaserValues{i})+strTab+ValToStr(posSSHPeripherys{i}.x)+strTab+ValToStr(posSSHPeripherys{i}.y)+strTab+ValToStr(posSSHPeripherys{i}.z);
        ENDFOR

        Close iodevSSHLog;

        IF boolConfOn THEN
            ConfJ\On;
            ConfL\On;
        ELSE
            ConfJ\Off;
            ConfL\Off;
        ENDIF

        IF (numSSHPointsTotal DIV 4)*3>=1 THEN
            MoveJ RelTool(robtSSHWireSmarTacs{(numSSHPointsTotal DIV 4)*3},0,0,-100),speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        ELSE
            MoveJ RelTool(robtSSHWireSmarTacs{1},0,0,-100),speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        ENDIF

        !For Test
        !FitCircle posRobPoints\NumPoints:=numSSHPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;
        !Logging\INFO, "Theory Center="+ValToStr(center);
        !Logging\INFO, "radius="+ValToStr(radius)+", ScanbyLaserSmarTac="+ValToStr(boolScanbyLaserSmarTac);

        FitCircle posSSHPeripherys\NumPoints:=numSSHPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;

        IF numCurTaskNo=1 THEN
            posRob1SSHCenter:=center;
            numRob1SSHRadius:=radius;
            posRob1SSHNormal:=normal;
            numRob1SSHRms:=rms;
            numRob1SSHMaxErr:=maxErr;
            numRob1SSHIndexWorst:=indexWorst;
        ELSE
            posRob2SSHCenter:=center;
            numRob2SSHRadius:=radius;
            posRob2SSHNormal:=normal;
            numRob2SSHRms:=rms;
            numRob2SSHMaxErr:=maxErr;
            numRob2SSHIndexWorst:=indexWorst;
        ENDIF

        Logging\INFO, "SSHCenter="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

        MoveAbsJ jointSSDepart,speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;

        SetDO doWireLock1,0;

    UNDO
        SetDO doWireLock1,0;
    ENDPROC

    PROC SSHbyLinearLaserScan()
        VAR robtarget robTemp;

        MoveAbsJ jointSSApproach,speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;

        IF numCurTaskNo=1 THEN
            robtSSHLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSSHDeviation;
            robtSSHLinerFrom.trans.y:=0-rPipeGrooveModel.numHeaderDiameter/2+numSSHOffsetZ;
            robtSSHLinerFrom.rot:=OrientZYX(-90,-90,0);
        ELSE
            !robtSSHLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX-rPipeGrooveModel.numBranchDiameter/2-numSSHDeviation;
            robtSSHLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSSHDeviation;
            robtSSHLinerFrom.trans.y:=rPipeGrooveModel.numHeaderDiameter/2-numSSHOffsetZ;
            robtSSHLinerFrom.rot:=OrientZYX(90,-90,0);
        ENDIF

        robtSSHLinerFrom.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        robtSSHLinerTo:=robtSSHLinerFrom;

        TEST numLinerScanDirection
        CASE 1:
            robtSSHLinerFrom.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(numLinerSHScanAngle);
            robtSSHLinerTo.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(0-numLinerSHScanAngle);
        CASE 2:
            robtSSHLinerFrom.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(0-numLinerSHScanAngle);
            robtSSHLinerTo.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(numLinerSHScanAngle);
        DEFAULT:
            robtSSHLinerFrom.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(numLinerSHScanAngle);
            robtSSHLinerTo.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(0-numLinerSHScanAngle);
        ENDTEST

        speedLinearScan.v_tcp:=Trunc(rPipeGrooveModel.numHeaderDiameter*Abs(Sin(numLinerSHScanAngle))/numLinerScanNominalTotal/0.1);
        numSSHLLSInterval:=Abs(robtSSHLinerFrom.trans.z-robtSSHLinerTo.trans.z)/speedLinearScan.v_tcp/numLinerScanNominalTotal;
        IF numSSHLLSInterval<0.1 THEN
            numSSHLLSInterval:=0.1;
        ENDIF

        MoveJ robtSSHLinerFrom,speedAir,fine,toolLaser\WObj:=wobjSTN1PLATE1;
        Logging\INFO, "Moved to robtSSHLinerFrom";
        WaitTime numWaitTimeForLaser;

        Close iodevSSHLog;
        Open "HOME:"\File:=strSSHLogFileName,iodevSSHLog;
        Write iodevSSHLog,"Time"+strTab+"index"+strTab+"rob.x"+strTab+"rob.y"+strTab+"rob.z"\NoNewLine;
        Write iodevSSHLog,strTab+"laser.value"+strTab+"periphery.x"+strTab+"periphery.y"+strTab+"periphery.z";

        numSSHLLSScan:=0;
        numSSHLLSClosestLaseValue:=1000;
        IDelete intSSHLinerLaserScan;
        CONNECT intSSHLinerLaserScan WITH TrapSSHLinerLaserScan;
        ITimer numSSHLLSInterval,intSSHLinerLaserScan;

        MoveL robtSSHLinerTo,speedLinearScan,fine,toolLaser\WObj:=wobjSTN1PLATE1;
        IDelete intSSHLinerLaserScan;
        Close iodevSSHLog;
        Logging\INFO, "Moved to robtSSHLinerTo";

        FOR i FROM 1 TO numSSHPointsTotal DO
            IF i>numLinerScanTrim THEN
                posSSHPeripherys{i-numLinerScanTrim}:=posSSHPeripherys{i};
            ENDIF
        ENDFOR

        FitCircle posSSHPeripherys\NumPoints:=numSSHLLSScan-numLinerScanTrim*2,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;

        Logging\INFO, "SSHCenter="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

        WaitSyncHeaderPeripherySmarTac;

        robTemp:=robtSSHLinerFrom;
        robTemp.trans.z:=center.z;
        IF numCurTaskNo=1 THEN
            robTemp.trans.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
        ELSE
            robTemp.trans.y:=rPipeGrooveModel.numHeaderDiameter/2;
        ENDIF
        Search_1D poseSSHPeripheryCenter\SearchStop:=robtSSHPeripheryCenter,RelTool(robTemp,0,0,numSmarTacOffsetZ),robTemp,speedAir,toolLaser\WObj:=wobjSTN1PLATE1;

        Logging\INFO, "robtSSHPeripheryCenter="+ValToStr(robtSSHPeripheryCenter.trans);
        Logging\INFO, "numSSHLLSScan="+ValToStr(numSSHLLSScan)+", numSSHLLSInterval="+ValToStr(numSSHLLSInterval);
        Logging\INFO, "posSSHLLSClosest="+ValToStr(posSSHLLSClosest);
        Logging\INFO, "numSSHLLSClosestLaseValue="+ValToStr(numSSHLLSClosestLaseValue)+", numSSHLLSClosestIndex="+ValToStr(numSSHLLSClosestIndex);

        IF numCurTaskNo=1 THEN
            posRob1SSHCenter:=center;
            numRob1SSHRadius:=radius;
            posRob1SSHNormal:=normal;
            numRob1SSHRms:=rms;
            numRob1SSHMaxErr:=maxErr;
            numRob1SSHIndexWorst:=indexWorst;
            posRob1SSHPeripheryCenter:=robtSSHPeripheryCenter.trans;
            posRob1SSHLLSClosest:=posSPHLLSClosest;
            numRob1SSHLLSClosestLaseValue:=numSPHLLSClosestLaseValue;
        ELSE
            posRob2SSHCenter:=center;
            numRob2SSHRadius:=radius;
            posRob2SSHNormal:=normal;
            numRob2SSHRms:=rms;
            numRob2SSHMaxErr:=maxErr;
            numRob2SSHIndexWorst:=indexWorst;
            posRob2SSHPeripheryCenter:=robtSSHPeripheryCenter.trans;
            posRob2SSHLLSClosest:=posSPHLLSClosest;
            numRob2SSHLLSClosestLaseValue:=numSPHLLSClosestLaseValue;
        ENDIF

        MoveAbsJ jointSSDepart,speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;

    ENDPROC

    TRAP TrapSSHLinerLaserScan
        VAR robtarget robtCur;
        VAR robtarget robtReal;
        VAR num numLaserOffset;
        robtCur:=CRobT();
        IF numCurTaskNo=1 THEN
            numLaserOffset:=aiLaserScan1-numLaser1OriginPosition;
        ELSE
            numLaserOffset:=aiLaserScan2-numLaser2OriginPosition;
        ENDIF

        robtReal:=reltool(robtCur,0,0,numLaserOffset);
        Incr numSSHLLSScan;
        posSSHPeripherys{numSSHLLSScan}:=robtReal.trans;
        IF numLaserOffset<numSSHLLSClosestLaseValue THEN
            posSSHLLSClosest:=posSSHPeripherys{numSSHLLSScan};
            numSSHLLSClosestIndex:=numSSHLLSScan;
            numSSHLLSClosestLaseValue:=numLaserOffset;
        ENDIF
        Write iodevSSHLog,CDate()+" "+CTime()+strTab+ValToStr(numSSHLLSScan)\NoNewLine;
        Write iodevSSHLog,strTab+ValToStr(robtCur.trans.x)+strTab+ValToStr(robtCur.trans.y)+strTab+ValToStr(robtCur.trans.z)\NoNewLine;
        Write iodevSSHLog,strTab+ValToStr(numLaserOffset)+strTab+ValToStr(robtReal.trans.x)+strTab+ValToStr(robtReal.trans.y)+strTab+ValToStr(robtReal.trans.z);
    ENDTRAP

    PROC SPBbyLaserSmarTac()
        VAR robtarget robtCur;
        VAR robtarget robTemp;
        !VAR pos posRobPoints{100};

        MoveAbsJ jointSPApproach,speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;
        !ConfJ\Off;
        !ConfL\Off; 

        IF numCurTaskNo=1 THEN
            InitSPBTargets numSPBAngleFrom,numSPBAngleTo,numSPBPointsTotal,robtSPBLaserSmarTacs\Rob1;
            robtSPBLinerFrom.rot:=OrientZYX(180,0,90);
            robtSPBLinerFrom.trans.y:=0-rPipeGrooveModel.numBranchDiameter/2;
        ELSE
            InitSPBTargets numSPBAngleFrom,numSPBAngleTo,numSPBPointsTotal,robtSPBLaserSmarTacs\Rob2;
            robtSPBLinerFrom.rot:=OrientZYX(0,0,90);
            robtSPBLinerFrom.trans.y:=rPipeGrooveModel.numBranchDiameter/2;
        ENDIF
        robtSPBLinerFrom.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        robtSPBLinerFrom.trans.z:=rPipeGrooveModel.numHeaderDiameter/2+numSPBDeviation;
        robtSPBLinerTo:=robtSPBLinerFrom;

        IF numSPBPointsTotal DIV 4>=1 THEN
            MoveJ RelTool(robtSPBLaserSmarTacs{numSPBPointsTotal DIV 4},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;
        ELSE
            MoveJ RelTool(robtSPBLaserSmarTacs{1},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;
        ENDIF

        Close iodevSPBLog;
        Open "HOME:"\File:=strSPBLogFileName,iodevSPBLog;
        Write iodevSPBLog,"Time"+strTab+"index"+strTab+"rob.x"+strTab+"rob.y"+strTab+"rob.z"\NoNewLine;
        Write iodevSPBLog,strTab+"laser.value"+strTab+"periphery.x"+strTab+"periphery.y"+strTab+"periphery.z";

        FOR i FROM 1 TO numSPBPointsTotal DO
            Logging\INFO, "Moving to scan branch target: "+ValToStr(i);
            IF numScanSaddleBranchMethod=1 THEN
                MoveJ RelTool(robtSPBLaserSmarTacs{i},0,0,numSmarTacOffsetZ),speedScan,zoneAir,toolLaser\WObj:=wobjRailFixture;
                Search_1D poseSPBs{i}\SearchStop:=robtSPBPeripherys{i},RelTool(robtSPBLaserSmarTacs{i},0,0,numSmarTacOffsetZ),robtSPBLaserSmarTacs{i},speedScan,toolLaser\WObj:=wobjRailFixture;
                IF boolSmarTacbyAiSignal THEN
                    MoveL robtSPBPeripherys{i},speedScan,fine,toolLaser\WObj:=wobjRailFixture;
                    WaitTime\InPos,numWaitTimeForLaser;
                    numSPBLaserValues{i}:=(aiLaserScan1-numLaser1OriginPosition);
                    robtSPBPeripherys{i}:=reltool(robtSPBPeripherys{i},0,0,numSPBLaserValues{i});
                ELSE
                    numSPBLaserValues{i}:=0;
                ENDIF
            ELSEIF numScanSaddleBranchMethod=4 THEN
                MoveJ robtSPBLaserSmarTacs{i},speedScan,fine,toolLaser\WObj:=wobjRailFixture;
                WaitTime\InPos,numWaitTimeForLaser;
                numSPBLaserValues{i}:=(aiLaserScan1-numLaser1OriginPosition);
                robtSPBPeripherys{i}:=reltool(robtSPBLaserSmarTacs{i},0,0,numSPBLaserValues{i});
            ENDIF

            !For Test
            !posRobPoints{i}:=robtSPBLaserSmarTacs{i}.trans;
            posSPBPeripherys{i}:=robtSPBPeripherys{i}.trans;

            robtCur:=CRobT();
            robtSPBLaserSmarTacs{i}.robconf:=robtCur.robconf;
            robtSPBLaserSmarTacs{i+1}.robconf:=robtCur.robconf;

            Write iodevSPBLog,CDate()+" "+CTime()+strTab+ValToStr(i)\NoNewLine;
            Write iodevSPBLog,strTab+ValToStr(robtSPBLaserSmarTacs{i}.trans.x)+strTab+ValToStr(robtSPBLaserSmarTacs{i}.trans.y)+strTab+ValToStr(robtSPBLaserSmarTacs{i}.trans.z)\NoNewLine;
            Write iodevSPBLog,strTab+ValToStr(numSPBLaserValues{i})+strTab+ValToStr(posSPBPeripherys{i}.x)+strTab+ValToStr(posSPBPeripherys{i}.y)+strTab+ValToStr(posSPBPeripherys{i}.z);
        ENDFOR

        Close iodevSPBLog;

        IF (numSPBPointsTotal DIV 4)*3>=1 THEN
            MoveJ RelTool(robtSPBLaserSmarTacs{(numSPBPointsTotal DIV 4)*3},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;
        ELSE
            MoveJ RelTool(robtSPBLaserSmarTacs{1},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;
        ENDIF

        !For Test
        !FitCircle posRobPoints\NumPoints:=numSPBPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;
        !Logging\INFO, "Theory Center="+ValToStr(center);
        !Logging\INFO, "radius="+ValToStr(radius)+", ScanbyLaserSmarTac="+ValToStr(boolScanbyLaserSmarTac);

        FitCircle posSPBPeripherys\NumPoints:=numSPBPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;

        Logging\INFO, "SPBCenter="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

        WaitSyncBranchPeripherySmarTac;

        robTemp:=robtSPBLinerFrom;
        robTemp.trans.x:=center.x;
        robTemp.trans.z:=robTemp.trans.z-50;
        IF numCurTaskNo=1 THEN
            robTemp.trans.y:=0-rPipeGrooveModel.numBranchDiameter/2;
        ELSE
            robTemp.trans.y:=rPipeGrooveModel.numBranchDiameter/2;
        ENDIF
        MoveJ RelTool(robTemp,0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;
        Search_1D poseSPBPeripheryCenter\SearchStop:=robtSPBPeripheryCenter,RelTool(robTemp,0,0,numSmarTacOffsetZ),robTemp,speedAir,toolLaser\WObj:=wobjRailFixture;

        Logging\INFO, "robtSPBPeripheryCenter="+ValToStr(robtSPBPeripheryCenter.trans);

        IF numCurTaskNo=1 THEN
            posRob1SPBCenter:=center;
            numRob1SPBRadius:=radius;
            posRob1SPBNormal:=normal;
            numRob1SPBRms:=rms;
            numRob1SPBMaxErr:=maxErr;
            numRob1SPBIndexWorst:=indexWorst;
            posRob1SPBPeripheryCenter:=robtSPBPeripheryCenter.trans;
        ELSE
            posRob2SPBCenter:=center;
            numRob2SPBRadius:=radius;
            posRob2SPBNormal:=normal;
            numRob2SPBRms:=rms;
            numRob2SPBMaxErr:=maxErr;
            numRob2SPBIndexWorst:=indexWorst;
            posRob2SPBPeripheryCenter:=robtSPBPeripheryCenter.trans;
        ENDIF

        !MoveAbsJ jointSPDepart,speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;
    ENDPROC

    PROC SPBbyLinearLaserScan()
        VAR robtarget robTemp;

        MoveAbsJ jointSPApproach,speedAir,zoneAir,toolLaser\WObj:=wobjSTN1PLATE1;

        IF numCurTaskNo=1 THEN
            robtSPBLinerFrom.rot:=OrientZYX(180,0,90);
            robtSPBLinerFrom.trans.y:=0-rPipeGrooveModel.numBranchDiameter/2;
        ELSE
            robtSPBLinerFrom.rot:=OrientZYX(0,0,90);
            robtSPBLinerFrom.trans.y:=rPipeGrooveModel.numBranchDiameter/2;
        ENDIF
        robtSPBLinerFrom.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        robtSPBLinerFrom.trans.z:=rPipeGrooveModel.numHeaderDiameter/2+numSPBDeviation;
        robtSPBLinerTo:=robtSPBLinerFrom;

        TEST numLinerScanDirection
        CASE 1:
            robtSPBLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Sin(numLinerSBScanAngle);
            robtSPBLinerTo.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Sin(-numLinerSBScanAngle);
        CASE 2:
            robtSPBLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Sin(0-numLinerSBScanAngle);
            robtSPBLinerTo.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Sin(numLinerSBScanAngle);
        DEFAULT:
            robtSPBLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Sin(numLinerSBScanAngle);
            robtSPBLinerTo.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2*Sin(-numLinerSBScanAngle);
        ENDTEST

        speedLinearScan.v_tcp:=Trunc(rPipeGrooveModel.numBranchDiameter*Abs(Sin(numLinerSHScanAngle))/numLinerScanNominalTotal/0.1);
        numSPBLLSInterval:=Abs(robtSPBLinerFrom.trans.x-robtSPBLinerTo.trans.x)/speedLinearScan.v_tcp/numLinerScanNominalTotal;
        IF numSPBLLSInterval<0.1 THEN
            numSPBLLSInterval:=0.1;
        ENDIF

        MoveJ robtSPBLinerFrom,speedAir,fine,toolLaser\WObj:=wobjRailFixture;
        Logging\INFO, "Moved to robtSPBLinerFrom";
        WaitTime numWaitTimeForLaser;

        Close iodevSPBLog;
        Open "HOME:"\File:=strSPBLogFileName,iodevSPBLog;
        Write iodevSPBLog,"Time"+strTab+"index"+strTab+"rob.x"+strTab+"rob.y"+strTab+"rob.z"\NoNewLine;
        Write iodevSPBLog,strTab+"laser.value"+strTab+"periphery.x"+strTab+"periphery.y"+strTab+"periphery.z";

        numSPBLLSScan:=0;
        numSPBLLSClosestLaseValue:=1000;
        IDelete intSPBLinerLaserScan;
        CONNECT intSPBLinerLaserScan WITH TrapSPBLinerLaserScan;
        ITimer numSPBLLSInterval,intSPBLinerLaserScan;

        MoveL robtSPBLinerTo,speedLinearScan,fine,toolLaser\WObj:=wobjRailFixture;
        IDelete intSPBLinerLaserScan;
        Close iodevSPBLog;
        Logging\INFO, "Moved to robtSPBLinerTo";

        FOR i FROM 1 TO numSPBLLSScan DO
            IF i>numLinerScanTrim THEN
                posSPBPeripherys{i-numLinerScanTrim}:=posSPBPeripherys{i};
            ENDIF
        ENDFOR

        !FitCircle posSPBPeripherys\NumPoints:=numSPBLLSScan-numLinerScanTrim*2,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;
        FitCircleSmoothing posSPBPeripherys,numSPBLLSScan-numLinerScanTrim*2,5,center,radius,normal,rms,maxErr,indexWorst;

        Logging\INFO, "SPBCenter="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

        WaitSyncBranchPeripherySmarTac;

        robTemp:=robtSPBLinerFrom;
        robTemp.trans.x:=center.x;
        IF numCurTaskNo=1 THEN
            robTemp.trans.y:=0-rPipeGrooveModel.numBranchDiameter/2;
        ELSE
            robTemp.trans.y:=rPipeGrooveModel.numBranchDiameter/2;
        ENDIF
        Search_1D poseSPBPeripheryCenter\SearchStop:=robtSPBPeripheryCenter,RelTool(robTemp,0,0,numSmarTacOffsetZ),robTemp,speedAir,toolLaser\WObj:=wobjRailFixture;

        Logging\INFO, "robtSPBPeripheryCenter="+ValToStr(robtSPBPeripheryCenter.trans);
        Logging\INFO, "numSPBLLSScan="+ValToStr(numSPBLLSScan)+", numSPBLLSInterval="+ValToStr(numSPBLLSInterval);
        Logging\INFO, "posSPBLLSClosest="+ValToStr(posSPBLLSClosest);
        Logging\INFO, "numSPBLLSClosestLaseValue="+ValToStr(numSPBLLSClosestLaseValue)+", numSPBLLSClosestIndex="+ValToStr(numSPBLLSClosestIndex);

        IF numCurTaskNo=1 THEN
            posRob1SPBCenter:=center;
            numRob1SPBRadius:=radius;
            posRob1SPBNormal:=normal;
            numRob1SPBRms:=rms;
            numRob1SPBMaxErr:=maxErr;
            numRob1SPBIndexWorst:=indexWorst;
            posRob1SPBPeripheryCenter:=robtSPBPeripheryCenter.trans;
            posRob1SPBLLSClosest:=posSPBLLSClosest;
            numRob1SPBLLSClosestLaseValue:=numSPBLLSClosestLaseValue;
        ELSE
            posRob2SPBCenter:=center;
            numRob2SPBRadius:=radius;
            posRob2SPBNormal:=normal;
            numRob2SPBRms:=rms;
            numRob2SPBMaxErr:=maxErr;
            numRob2SPBIndexWorst:=indexWorst;
            posRob2SPBPeripheryCenter:=robtSPBPeripheryCenter.trans;
            posRob2SPBLLSClosest:=posSPBLLSClosest;
            numRob2SPBLLSClosestLaseValue:=numSPBLLSClosestLaseValue;
        ENDIF

        !MoveAbsJ jointSPDepart,speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;

    ENDPROC

    TRAP TrapSPBLinerLaserScan
        VAR robtarget robtCur;
        VAR robtarget robtReal;
        VAR num numLaserOffset;
        robtCur:=CRobT();
        IF numCurTaskNo=1 THEN
            numLaserOffset:=aiLaserScan1-numLaser1OriginPosition;
        ELSE
            numLaserOffset:=aiLaserScan2-numLaser2OriginPosition;
        ENDIF
        robtReal:=reltool(robtCur,0,0,numLaserOffset);
        Incr numSPBLLSScan;
        posSPBPeripherys{numSPBLLSScan}:=robtReal.trans;
        IF numLaserOffset<numSPBLLSClosestLaseValue THEN
            posSPBLLSClosest:=posSPBPeripherys{numSPBLLSScan};
            numSPBLLSClosestIndex:=numSPBLLSScan;
            numSPBLLSClosestLaseValue:=numLaserOffset;
        ENDIF
        Write iodevSPBLog,CDate()+" "+CTime()+strTab+ValToStr(numSPBLLSScan)\NoNewLine;
        Write iodevSPBLog,strTab+ValToStr(robtCur.trans.x)+strTab+ValToStr(robtCur.trans.y)+strTab+ValToStr(robtCur.trans.z)\NoNewLine;
        Write iodevSPBLog,strTab+ValToStr(numLaserOffset)+strTab+ValToStr(robtReal.trans.x)+strTab+ValToStr(robtReal.trans.y)+strTab+ValToStr(robtReal.trans.z);
    ENDTRAP

    PROC SPHbyLaserSmarTac()
        VAR robtarget robtCur;
        VAR robtarget robTemp;
        !VAR pos posRobPoints{100};

        MoveAbsJ jointSPApproach,speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;

        IF numCurTaskNo=1 THEN
            InitSPHTargets numSPHAngleFrom,numSPHAngleTo,numSPHPointsTotal,robtSPHLaserSmarTacs\Rob1;
            !robtSPHLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX-rPipeGrooveModel.numBranchDiameter/2-numSPHDeviation-95;
            robtSPHLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSPHDeviation;
            robtSPHLinerFrom.trans.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
            robtSPHLinerFrom.rot:=OrientZYX(90,90,0);
        ELSE
            InitSPHTargets numSPHAngleFrom,numSPHAngleTo,numSPHPointsTotal,robtSPHLaserSmarTacs\Rob2;
            robtSPHLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSPHDeviation;
            robtSPHLinerFrom.trans.y:=rPipeGrooveModel.numHeaderDiameter/2;
            robtSPHLinerFrom.rot:=OrientZYX(-90,90,0);
        ENDIF
        robtSPHLinerFrom.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        robtSPHLinerTo:=robtSPHLinerFrom;

        ConfJ\Off;
        ConfL\Off;

        IF numSPHPointsTotal DIV 4>=1 THEN
            MoveJ RelTool(robtSPHLaserSmarTacs{numSPHPointsTotal DIV 4},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;
        ELSE
            MoveJ RelTool(robtSPHLaserSmarTacs{1},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;
        ENDIF

        Close iodevSPHLog;
        Open "HOME:"\File:=strSPHLogFileName,iodevSPHLog;
        Write iodevSPHLog,"Time"+strTab+"index"+strTab+"rob.x"+strTab+"rob.y"+strTab+"rob.z"\NoNewLine;
        Write iodevSPHLog,strTab+"laser.value"+strTab+"periphery.x"+strTab+"periphery.y"+strTab+"periphery.z";

        FOR i FROM 1 TO numSPHPointsTotal DO
            Logging\INFO, "Moving to scan header target: "+ValToStr(i);
            IF numScanSaddleBranchMethod=1 THEN
                MoveJ RelTool(robtSPHLaserSmarTacs{i},0,0,numSmarTacOffsetZ),speedScan,zoneAir,toolLaser\WObj:=wobjRailFixture;
                Search_1D poseSPHs{i}\SearchStop:=robtSPHPeripherys{i},RelTool(robtSPHLaserSmarTacs{i},0,0,numSmarTacOffsetZ),robtSPHLaserSmarTacs{i},speedScan,toolLaser\WObj:=wobjRailFixture;
                numSPHLaserValues{i}:=0;
            ELSEIF numScanSaddleBranchMethod=4 THEN
                MoveJ robtSPHLaserSmarTacs{i},speedScan,fine,toolLaser\WObj:=wobjRailFixture;
                WaitTime\InPos,numWaitTimeForLaser;
                numSPHLaserValues{i}:=(aiLaserScan1-numLaser1OriginPosition);
                robtSPHPeripherys{i}:=reltool(robtSPHLaserSmarTacs{i},0,0,numSPHLaserValues{i});
            ENDIF

            !For Test
            !posRobPoints{i}:=robtSPHLaserSmarTacs{i}.trans;
            posSPHPeripherys{i}:=robtSPHPeripherys{i}.trans;

            robtCur:=CRobT();
            robtSPHLaserSmarTacs{i}.robconf:=robtCur.robconf;
            robtSPHLaserSmarTacs{i+1}.robconf:=robtCur.robconf;

            Write iodevSPHLog,CDate()+" "+CTime()+strTab+ValToStr(i)\NoNewLine;
            Write iodevSPHLog,strTab+ValToStr(robtSPHLaserSmarTacs{i}.trans.x)+strTab+ValToStr(robtSPHLaserSmarTacs{i}.trans.y)+strTab+ValToStr(robtSPHLaserSmarTacs{i}.trans.z)\NoNewLine;
            Write iodevSPHLog,strTab+ValToStr(numSPHLaserValues{i})+strTab+ValToStr(posSPHPeripherys{i}.x)+strTab+ValToStr(posSPHPeripherys{i}.y)+strTab+ValToStr(posSPHPeripherys{i}.z);
        ENDFOR

        Close iodevSPHLog;

        IF boolConfOn THEN
            ConfJ\On;
            ConfL\On;
        ELSE
            ConfJ\Off;
            ConfL\Off;
        ENDIF

        IF (numSPHPointsTotal DIV 4)*3>=1 THEN
            MoveJ RelTool(robtSPHLaserSmarTacs{(numSPHPointsTotal DIV 4)*3},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;
        ELSE
            MoveJ RelTool(robtSPHLaserSmarTacs{1},0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;
        ENDIF

        !For Test
        !FitCircle posRobPoints\NumPoints:=numSPHPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;
        !Logging\INFO, "Theory Center="+ValToStr(center);
        !Logging\INFO, "radius="+ValToStr(radius)+", ScanbyLaserSmarTac="+ValToStr(boolScanbyLaserSmarTac);

        FitCircle posSPHPeripherys\NumPoints:=numSPHPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;

        Logging\INFO, "SPHCenter="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

        WaitSyncHeaderPeripherySmarTac;

        robTemp:=robtSPHLinerFrom;
        robTemp.trans.z:=center.z;
        IF numCurTaskNo=1 THEN
            robTemp.trans.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
        ELSE
            robTemp.trans.y:=rPipeGrooveModel.numHeaderDiameter/2;
        ENDIF
        Search_1D poseSPHPeripheryCenter\SearchStop:=robtSPHPeripheryCenter,RelTool(robTemp,0,0,numSmarTacOffsetZ),robTemp,speedAir,toolLaser\WObj:=wobjRailFixture;

        Logging\INFO, "robtSPHPeripheryCenter="+ValToStr(robtSPHPeripheryCenter.trans);
        Logging\INFO, "numSPHLLSScan="+ValToStr(numSPHLLSScan)+", numSPHLLSInterval="+ValToStr(numSPHLLSInterval);
        Logging\INFO, "posSPHLLSClosest="+ValToStr(posSPHLLSClosest);
        Logging\INFO, "numSPHLLSClosestLaseValue="+ValToStr(numSPHLLSClosestLaseValue)+", numSPHLLSClosestIndex="+ValToStr(numSPHLLSClosestIndex);

        IF numCurTaskNo=1 THEN
            posRob1SPHCenter:=center;
            numRob1SPHRadius:=radius;
            posRob1SPHNormal:=normal;
            numRob1SPHRms:=rms;
            numRob1SPHMaxErr:=maxErr;
            numRob1SPHIndexWorst:=indexWorst;
            posRob1SPHPeripheryCenter:=robtSPHPeripheryCenter.trans;
        ELSE
            posRob2SPHCenter:=center;
            numRob2SPHRadius:=radius;
            posRob2SPHNormal:=normal;
            numRob2SPHRms:=rms;
            numRob2SPHMaxErr:=maxErr;
            numRob2SPHIndexWorst:=indexWorst;
            posRob2SPHPeripheryCenter:=robtSPHPeripheryCenter.trans;
        ENDIF

        MoveAbsJ jointSPDepart,speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;

    ENDPROC

    PROC SPHbyLinearLaserScan()
        VAR robtarget robTemp;

        MoveAbsJ jointSSApproach,speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;

        IF numCurTaskNo=1 THEN
            !robtSPHLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX-rPipeGrooveModel.numBranchDiameter/2-numSPHDeviation;
            robtSPHLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSPHDeviation;
            robtSPHLinerFrom.trans.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
            !robtSPHLinerFrom.rot:=OrientZYX(-90,-90,0);
            robtSPHLinerFrom.rot:=OrientZYX(90,90,0);
        ELSE
            !robtSPHLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX+rPipeGrooveModel.numBranchDiameter/2+numSPHDeviation;
            robtSPHLinerFrom.trans.x:=rPipeGrooveModel.numSeamCenterX-rPipeGrooveModel.numBranchDiameter/2-numSPHDeviation;
            robtSPHLinerFrom.trans.y:=rPipeGrooveModel.numHeaderDiameter/2;
            !robtSPHLinerFrom.rot:=OrientZYX(90,-90,0);
            robtSPHLinerFrom.rot:=OrientZYX(-90,90,0);
        ENDIF

        robtSPHLinerFrom.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        robtSPHLinerTo:=robtSPHLinerFrom;

        TEST numLinerScanDirection
        CASE 1:
            robtSPHLinerFrom.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(numLinerSHScanAngle);
            robtSPHLinerTo.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(0-numLinerSHScanAngle);
        CASE 2:
            robtSPHLinerFrom.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(0-numLinerSHScanAngle);
            robtSPHLinerTo.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(numLinerSHScanAngle);
        DEFAULT:
            robtSPHLinerFrom.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(numLinerSHScanAngle);
            robtSPHLinerTo.trans.z:=rPipeGrooveModel.numHeaderDiameter/2*Sin(0-numLinerSHScanAngle);
        ENDTEST

        speedLinearScan.v_tcp:=Trunc(rPipeGrooveModel.numHeaderDiameter*Abs(Sin(numLinerSHScanAngle))/numLinerScanNominalTotal/0.1);
        numSPHLLSInterval:=Abs(robtSPHLinerFrom.trans.z-robtSPHLinerTo.trans.z)/speedLinearScan.v_tcp/numLinerScanNominalTotal;
        IF numSPHLLSInterval<0.1 THEN
            numSPHLLSInterval:=0.1;
        ENDIF

        MoveJ RelTool(robtSPHLinerFrom,0,0,-100),speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;
        MoveL robtSPHLinerFrom,speedAir,fine,toolLaser\WObj:=wobjRailFixture;
        Logging\INFO, "Moved to robtSPHLinerFrom";
        WaitTime numWaitTimeForLaser;

        Close iodevSPHLog;
        Open "HOME:"\File:=strSPHLogFileName,iodevSPHLog;
        Write iodevSPHLog,"Time"+strTab+"index"+strTab+"rob.x"+strTab+"rob.y"+strTab+"rob.z"\NoNewLine;
        Write iodevSPHLog,strTab+"laser.value"+strTab+"periphery.x"+strTab+"periphery.y"+strTab+"periphery.z";

        numSPHLLSScan:=0;
        numSPHLLSClosestLaseValue:=1000;
        IDelete intSPHLinerLaserScan;
        CONNECT intSPHLinerLaserScan WITH TrapSPHLinerLaserScan;
        ITimer numSPHLLSInterval,intSPHLinerLaserScan;

        MoveL robtSPHLinerTo,speedLinearScan,fine,toolLaser\WObj:=wobjRailFixture;
        IDelete intSPHLinerLaserScan;
        Close iodevSPHLog;
        Logging\INFO, "Moved to robtSPHLinerTo";

        FOR i FROM 1 TO numSPHPointsTotal DO
            IF i>numLinerScanTrim THEN
                posSPHPeripherys{i-numLinerScanTrim}:=posSPHPeripherys{i};
            ENDIF
        ENDFOR

        FitCircle posSPHPeripherys\NumPoints:=numSPHLLSScan-numLinerScanTrim*2,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;

        Logging\INFO, "SPHCenter="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

        WaitSyncHeaderPeripherySmarTac;

        robTemp:=robtSPHLinerFrom;
        robTemp.trans.z:=center.z;
        IF numCurTaskNo=1 THEN
            robTemp.trans.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
        ELSE
            robTemp.trans.y:=rPipeGrooveModel.numHeaderDiameter/2;
        ENDIF
        Search_1D poseSPHPeripheryCenter\SearchStop:=robtSPHPeripheryCenter,RelTool(robTemp,0,0,numSmarTacOffsetZ),robTemp,speedAir,toolLaser\WObj:=wobjRailFixture;

        Logging\INFO, "robtSPHPeripheryCenter="+ValToStr(robtSPHPeripheryCenter.trans);
        Logging\INFO, "numSPHLLSScan="+ValToStr(numSPHLLSScan)+", numSPHLLSInterval="+ValToStr(numSPHLLSInterval);
        Logging\INFO, "posSPHLLSClosest="+ValToStr(posSPHLLSClosest);
        Logging\INFO, "numSPHLLSClosestLaseValue="+ValToStr(numSPHLLSClosestLaseValue)+", numSPHLLSClosestIndex="+ValToStr(numSPHLLSClosestIndex);

        IF numCurTaskNo=1 THEN
            posRob1SPHCenter:=center;
            numRob1SPHRadius:=radius;
            posRob1SPHNormal:=normal;
            numRob1SPHRms:=rms;
            numRob1SPHMaxErr:=maxErr;
            numRob1SPHIndexWorst:=indexWorst;
            posRob1SPHPeripheryCenter:=robtSPHPeripheryCenter.trans;
            posRob1SPHLLSClosest:=posSPHLLSClosest;
            numRob1SPHLLSClosestLaseValue:=numSPHLLSClosestLaseValue;
        ELSE
            posRob2SPHCenter:=center;
            numRob2SPHRadius:=radius;
            posRob2SPHNormal:=normal;
            numRob2SPHRms:=rms;
            numRob2SPHMaxErr:=maxErr;
            numRob2SPHIndexWorst:=indexWorst;
            posRob2SPHPeripheryCenter:=robtSPHPeripheryCenter.trans;
            posRob2SPHLLSClosest:=posSPHLLSClosest;
            numRob2SPHLLSClosestLaseValue:=numSPHLLSClosestLaseValue;
        ENDIF

        MoveAbsJ jointSPDepart,speedAir,zoneAir,toolLaser\WObj:=wobjRailFixture;

    ENDPROC

    TRAP TrapSPHLinerLaserScan
        VAR robtarget robtCur;
        VAR robtarget robtReal;
        VAR num numLaserOffset;
        robtCur:=CRobT();
        IF numCurTaskNo=1 THEN
            numLaserOffset:=aiLaserScan1-numLaser1OriginPosition;
        ELSE
            numLaserOffset:=aiLaserScan2-numLaser2OriginPosition;
        ENDIF

        robtReal:=reltool(robtCur,0,0,numLaserOffset);
        Incr numSPHLLSScan;
        posSPHPeripherys{numSPHLLSScan}:=robtReal.trans;
        IF numLaserOffset<numSPHLLSClosestLaseValue THEN
            posSPHLLSClosest:=posSPHPeripherys{numSPHLLSScan};
            numSPHLLSClosestIndex:=numSPHLLSScan;
            numSPHLLSClosestLaseValue:=numLaserOffset;
        ENDIF
        Write iodevSPHLog,CDate()+" "+CTime()+strTab+ValToStr(numSPHLLSScan)\NoNewLine;
        Write iodevSPHLog,strTab+ValToStr(robtCur.trans.x)+strTab+ValToStr(robtCur.trans.y)+strTab+ValToStr(robtCur.trans.z)\NoNewLine;
        Write iodevSPHLog,strTab+ValToStr(numLaserOffset)+strTab+ValToStr(robtReal.trans.x)+strTab+ValToStr(robtReal.trans.y)+strTab+ValToStr(robtReal.trans.z);
    ENDTRAP

    PROC WaitSyncBranchPeripherySmarTac()
        IF BitCheck(rPipeGrooveModel.numReviseScanBranchType,1) AND BitCheck(rPipeGrooveModel.numReviseScanBranchType,2) THEN
            WaitSyncTask SyncBranchPeripherySmarTac,taskListRob1Rob2;
        ENDIF
    ENDPROC

    PROC WaitSyncHeaderPeripherySmarTac()
        IF BitCheck(rPipeGrooveModel.numReviseScanHeaderType,1) AND BitCheck(rPipeGrooveModel.numReviseScanHeaderType,2) THEN
            WaitSyncTask SyncHeaderPeripherySmarTac,taskListRob1Rob2;
        ENDIF
    ENDPROC

ENDMODULE
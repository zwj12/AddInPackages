MODULE WeldTestModule
    TASK PERS robtarget pWeldReady:=[[2970.44,251.46,1105.67],[1.65375E-06,-0.371918,-0.928266,2.84201E-06],[-1,0,-1,0],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWeld1:=[[2470.03,-1.25,973.04],[0.0595908,0.367454,0.925139,-0.0744639],[-1,0,-2,0],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWeld2:=[[2543.14,82.94,1000.38],[0.0596031,0.367456,0.925135,-0.0744946],[-1,0,-2,0],[2601.99,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWeld3:=[[596.63,89.32,1079.18],[0.0369961,-0.708552,-0.703603,-0.0390982],[-1,0,-1,0],[4836.2,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS seamdata seamWeld:=[0,0.5,[0,0,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0.5];
    TASK PERS welddata weldWeld:=[6,0,[25,0,0,0,0,230,0,0,0],[0,0,0,0,0,0,0,0,0]];

    TASK PERS robtarget pWeldWeaveReady:=[[506.33,1243.17,-666.96],[0.657951,-0.267537,-0.648249,-0.274405],[0,-1,-3,1],[670.006,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWeldWeave1:=[[506.33,1243.17,-666.96],[0.65795,-0.267538,-0.648249,-0.274405],[0,-1,-3,1],[670.006,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWeldWeave2:=[[506.33,1243.17,-666.96],[0.65795,-0.267538,-0.648249,-0.274405],[0,-1,-3,1],[670.006,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS seamdata seamWeave:=[0,0,[0,0,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0.5];
    TASK PERS welddata weldWeave:=[3,0,[4,0,-5,0,0,230,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveWeave:=[1,0,1.5,6,0,0,0,0,0,0,0,0,0,0,0];

    TASK PERS robtarget pWGReady:=[[606.17,-40.03,1104.73],[0.077294,0.655417,0.734287,0.158984],[-1,0,-1,0],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWG1:=[[606.77,-40.03,1085.91],[0.0772937,0.655416,0.734288,0.158985],[-1,0,-1,0],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWG2:=[[615.88,48.47,1083.17],[0.0772929,0.655415,0.734289,0.158986],[-1,0,-1,0],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS seamdata seamWG:=[0,0,[0,0,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0.5];
    TASK PERS welddata weldWG:=[6,0,[12,0,0,0,0,250,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveWG:=[0,0,2,6,0,0,0,0,0,0,0,0,0,0,0];
    TASK PERS trackdata trackWG:=[0,TRUE,50,[1,50,50,0,0,4,8,5,10],[0,0,0,0,0,0,0]];
    TASK PERS multidata Layer_2:=[1,15,15,0,0,-12,10,0,0];
    TASK PERS multidata Layer_3:=[1,15,15,0,0,-5,5,0,0];

    LOCAL CONST robtarget pSmarTac1x:=[[-171.74,1217.50,657.77],[0.247726,-0.646663,-0.687784,-0.217741],[1,-1,1,0],[-458.612,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget pSmarTac1y:=[[3276.07,-893.34,416.86],[0.415186,-0.0263263,0.909173,-0.0182127],[-1,-2,0,1],[2628.78,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget pSmarTac1z:=[[3303.20,-893.35,447.85],[0.415243,-0.0263483,0.909146,-0.0182198],[-1,-2,0,1],[2628.78,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget pSmarTac2x:=[[-171.74,1217.50,657.77],[0.247726,-0.646663,-0.687784,-0.217741],[1,-1,1,0],[-458.612,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget pSmarTac2y:=[[3270.09,-1007.10,426.83],[0.41523,-0.0263466,0.909152,-0.0182145],[-1,-2,0,1],[2628.78,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL CONST robtarget pSmarTac2z:=[[3300.88,-1007.02,483.65],[0.415231,-0.0263267,0.909153,-0.0182011],[-1,-2,0,1],[2628.78,9E+09,9E+09,9E+09,9E+09,9E+09]];

    LOCAL PERS pose poseSmarTac1x:=[[12.8822,0.0789795,-12.6787],[1,0,0,0]];
    LOCAL PERS pose poseSmarTac1y:=[[11.6851,-0.00891113,0.096344],[1,0,0,0]];
    LOCAL PERS pose poseSmarTac1z:=[[0.00170898,-0.000427246,-4.96652],[1,0,0,0]];
    LOCAL PERS pose poseSmarTac2x:=[[23.9402,0.365601,-13.4241],[1,0,0,0]];
    LOCAL PERS pose poseSmarTac2y:=[[11.551,0.00830078,0.00735474],[1,0,0,0]];
    LOCAL PERS pose poseSmarTac2z:=[[0.00561523,-0.0124512,-12.0016],[1,0,0,0]];

    LOCAL PERS robtarget pWGAdaptReady:=[[596.62,-15.21,1079.11],[0.0370226,-0.708547,-0.703605,-0.03912],[-1,0,-1,0],[4836.21,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pWGAdapt1:=[[596.63,-15.21,1079.11],[0.0370212,-0.708548,-0.703605,-0.0391186],[-1,0,-1,0],[4836.21,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pWGAdapt2:=[[596.63,41.75,1079.11],[0.0370238,-0.708548,-0.703603,-0.0391243],[-1,0,-1,0],[4836.21,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pWGAdapt3:=[[596.63,85.68,1079.11],[0.0370214,-0.708547,-0.703605,-0.0391197],[-1,0,-1,0],[4836.21,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS trackdata trackWGAdapt:=[0,FALSE,50,[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0]];
    TASK PERS seamdata seamWGAdapt:=[0,0.5,[0,0,0,100,0,0,0,0,0],0,0,5,0,0,[0,0,1,140,0,0,0,0,0],0,1.5,[0,0,1,90,0,0,0,0,0],0.04,0,[0,0,0,0,0,0,0,0,0],0];
    TASK PERS welddata weldWGAdapt:=[6,0,[8,0,0,0,0,200,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveWGAdapt:=[1,0,6,6,0,0,0,0,0,0,0,0,0,0,0];
    TASK PERS adaptdata adaptWGAdapt:=[6,1,0,0,0.1,100,0.1,100];
    TASK PERS trackdata trackWGCalc:=[0,FALSE,50,[1,30,30,3,0,3,36,1,12],[0,0,0,0,0,0,0]];
    TASK PERS adaptdata adaptWGCalc:=[10,1,0,0,3,36,3,12];

    VAR intnum intIPathPos;
    TASK PERS pos posAdaptSensor:=[0,0,0];
    TASK PERS robtarget pAdaptWeaveCenter:=[[1183.87,44.9452,909.84],[0.14181,-0.00365029,0.989869,-0.00595079],[0,-1,0,0],[-1.0483E-33,9E+9,9E+9,9E+9,9E+9,9E+9]];
    TASK PERS num numAdaptWeaveCount:=15;
    TASK PERS num numGrooveWidthStart:=6;
    TASK PERS num numGrooveWidthEnd:=6;
    TASK PERS num numAdaptWeaveTotal:=8;
    TASK PERS num numAdaptWeaveWidth:=11.375;
    TASK PERS num numAdaptWeldSpeed:=3.4;

    VAR intnum sig1int;
    VAR intnum sig2int;
    VAR num TestWGadap:=0;
    TASK PERS adaptdata ad1:=[10,1,0,0,2,10,2,10];

    PROC WeldTest()
        MoveJ pWeldReady,v100,z10,toolWeldGun;
        ArcLStart pWeld1,v100,seamWeld,weldWeld,fine,toolWeldGun;
        ArcLEnd pWeld2,v100,seamWeld,weldWeld,fine,toolWeldGun;
        MoveL pWeldReady,v100,fine,toolWeldGun;
        !RETURN ;
    ENDPROC

    PROC WeldWeaveTest()
        MoveJ pWeldWeaveReady,v100,z10,toolWeldGun;
        ArcLStart pWeldWeave1,v100,seamWeave,weldWeave\Weave:=weaveWeave,fine,toolWeldGun;
        ArcLEnd pWeldWeave2,v100,seamWeave,weldWeave\Weave:=weaveWeave,fine,toolWeldGun;
        MoveL pWeldWeaveReady,v100,fine,toolWeldGun;
        RETURN ;
    ENDPROC

    PROC WGTest()
        MoveL pWGReady,v100,z10,toolWeldGun\WObj:=wobj0;
        ArcLStart pWG1,v100,seamWG,weldWG\Weave:=weaveWG,fine,toolWeldGun\Track:=trackWG\SeamName:="weldTest";
        ArcLEnd pWG2,v100,seamWG,weldWG\Weave:=weaveWG,fine,toolWeldGun\Track:=trackWG;
        Stop;
        !ArcRepL\Start\End,Layer_2,v100,seamWG,weldWG,weaveWG,z10,toolWeldGun\WObj:=wobj0\SeamName:="weldTest";
        Stop;
        !ArcRepL\Start\End,Layer_3,v100,seamWG,weldWG,weaveWG,z10,toolWeldGun\WObj:=wobj0\SeamName:="weldTest";
        MoveL pWGReady,v100,z10,toolWeldGun\WObj:=wobj0;
    ENDPROC

    PROC WGSmarTacTest()
        MoveL pWGReady,v100,z10,toolWeldGun\WObj:=wobj0;
        MoveL pWG1,v100,fine,toolWeldGun;
        MoveL pWG2,v100,fine,toolWeldGun;

        MoveL pWGReady,v100,fine,toolWeldGun;
        Search_1D poseSmarTac1y,pSmarTac1y,pWG1,v100,toolWeldGun;
        Search_1D poseSmarTac1z,pSmarTac1z,pWG2,v100,toolWeldGun;

        MoveL pWGReady,v100,fine,toolWeldGun;
        Search_1D poseSmarTac2y,pSmarTac2y,pWG2,v100,toolWeldGun;
        Search_1D poseSmarTac2z,pSmarTac2z,pWG2,v100,toolWeldGun;

        MoveL pWGReady,v100,fine,toolWeldGun;
        PDispSet poseSmarTac1y;
        PDispAdd poseSmarTac1z;
        ArcLStart pWG1,v100,seamWG,weldWG\Weave:=weaveWG,fine,toolWeldGun\Track:=trackWG\SeamName:="weldTest";
        PDispSet poseSmarTac2y;
        PDispAdd poseSmarTac2z;
        ArcLEnd pWG2,v100,seamWG,weldWG\Weave:=weaveWG,fine,toolWeldGun\Track:=trackWG;
        PDispOff;

        Stop;
        ArcRepL\Start\End,Layer_2,v100,seamWG,weldWG,weaveWG,z10,toolWeldGun\WObj:=wobj0\SeamName:="weldTest";
        Stop;
        ArcRepL\Start\End,Layer_3,v100,seamWG,weldWG,weaveWG,z10,toolWeldGun\WObj:=wobj0\SeamName:="weldTest";
        MoveL pWGReady,v100,z10,toolWeldGun\WObj:=wobj0;
    ENDPROC

    PROC WGAdaptiveCalcTest()
        !seamWGAdapt:=seamNext;
        !weldWGAdapt:=weldNext;
        !weaveWGAdapt:=weaveNext;
        !trackWGAdapt:=trackNext;

        MoveJ pWGAdaptReady,v100,z10,toolWeldGun\WObj:=wobj0;

        ArcCalcLStart pWGAdapt1,v100,numGrooveWidthStart,adaptWGAdapt,seamWGAdapt,weldWGAdapt,weaveWGAdapt,fine,toolWeldGun,trackWGAdapt;
        IDelete intnumArcCalcIntercept;
        CONNECT intnumArcCalcIntercept WITH TrapArcCalcContinuous;
        IF numCurTaskNo=1 THEN
            ISignalDO doFr1ArcOn,low,intnumArcCalcIntercept;
        ELSE
            ISignalDO doFr2ArcOn,low,intnumArcCalcIntercept;
        ENDIF
        ArcCalcLEnd pWGAdapt2,v100,numGrooveWidthEnd,adaptWGAdapt,fine,toolWeldGun;

        ArcCalcLStart pWGAdapt2,v100,numGrooveWidthStart,adaptWGAdapt,seamWG,weldWGAdapt,weaveWGAdapt,fine,toolWeldGun,trackWGAdapt;
        ArcCalcLEnd pWGAdapt3,v100,numGrooveWidthEnd,adaptWGAdapt,fine,toolWeldGun;

        MoveL pWGAdaptReady,v100,fine,toolWeldGun\WObj:=wobj0;

        Stop;
        SetGO goFr2JobNum,7;
        SetDO doFr2ArcOn,1;
        WaitDI diFr2ArcStable,1;
        WaitTime 1;
        SetDO doFr2ArcOn,0;
        WaitDI diFr2ArcStable,0;
        SetGO goFr2JobNum,8;
        SetDO doFr2ArcOn,1;
        WaitDI diFr2ArcStable,1;
        WaitTime 1;
        SetDO doFr2ArcOn,0;
        WaitDI diFr2ArcStable,0;

        Stop;

        SetDO soFr2ArcStable,1;
        MoveJ pWeldReady,v100,z10,toolWeldGun;

        ArcLStart pWeld1,v100,seamWeld,weldWeld,fine,toolWeldGun;

        IDelete sig2int;
        CONNECT sig2int WITH etrap;
        ISignalDO doFr2ArcOn,low,sig2int;

        ArcLEnd pWeld2,v100,seamWeld,weldWeld,fine,toolWeldGun;

        ArcLStart pWeld2,v100,seamWeave,weldWeld,fine,toolWeldGun;
        ArcLEnd pWeld3,v100,seamWeave,weldWeld,fine,toolWeldGun;
        MoveL pWeldReady,v100,fine,toolWeldGun;

    UNDO
        SetDO soFr2ArcStable,1;
    ENDPROC

    TRAP etrap
        SetDO doFr2ArcOn,1;
        PulseDO\PLength:=0.5,soFr2ArcStable;
        IDelete sig2int;
    ENDTRAP

    TRAP trapIPathPos
        Incr numAdaptWeaveCount;
        TPWrite "index="+ValToStr(numAdaptWeaveCount)+", center="+ValToStr(pAdaptWeaveCenter.trans);
        IF numAdaptWeaveCount MOD 2=1 THEN
            numAdaptWeaveWidth:=numGrooveWidthStart+numAdaptWeaveCount/2/numAdaptWeaveTotal*(numGrooveWidthEnd-numGrooveWidthStart);
            numAdaptWeldSpeed:=GetAdaptiveWeldSpeed(weaveWGAdapt,weldWGAdapt.weld_speed,numAdaptWeaveWidth);
            ArcRefresh\WeldSpeed:=numAdaptWeldSpeed,\WeaveWidth:=numAdaptWeaveWidth;
        ENDIF
    ENDTRAP

    PROC WGAdaptiveWeldTest()
        MoveJ pWGAdaptReady,v100,z10,toolWeldGun;

        numAdaptWeaveCount:=0;
        numAdaptWeaveTotal:=Trunc(Distance(pWGAdapt1.trans,pWGAdapt2.trans)/weaveWGAdapt.weave_width);
        IDelete intIPathPos;
        connect intIPathPos with trapIPathPos;
        IPathPos pAdaptWeaveCenter,posAdaptSensor,intIPathPos;
        ArcLStart pWGAdapt1,v100,seamWGAdapt,weldWGAdapt\Weave:=weaveWGAdapt,fine,toolWeldGun\Track:=trackWGAdapt\SeamName:="Weldtest";
        ArcLEnd pWGAdapt2,v100,seamWGAdapt,weldWGAdapt\Weave:=weaveWGAdapt,fine,toolWeldGun\Track:=trackWGAdapt;
        IDelete intIPathPos;

        MoveL pWGAdaptReady,v100,fine,toolWeldGun;

    ENDPROC
	PROC Routine1()
		ArcLStart [[657.35,6.05,1071.42],[0.0276267,0.708974,0.69676,0.105439],[-1,0,-1,0],[4836.99,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, seamWG, weldWG\Weave:=weaveWG, fine, toolWeldGun\Track:=trackWG;
		ArcLEnd [[651.48,45.73,1071.95],[0.0276258,0.708974,0.696761,0.105439],[-1,0,-1,0],[4836.99,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, seamWG, weldWG\Weave:=weaveWG, fine, toolWeldGun\Track:=trackWG;
		ArcAdaptLStart [[657.36,6.06,1071.37],[0.0276094,0.708973,0.696759,0.105455],[-1,0,-1,0],[4836.99,9E+09,9E+09,9E+09,9E+09,9E+09]], speedWeld, TestWGadap, ad1, seamWG, weldWG, weaveWG, fine, toolWeldGun, trackWG;
		ArcAdaptLEnd [[651.48,45.75,1071.89],[0.0276022,0.708974,0.696758,0.105459],[-1,0,-1,0],[4836.99,9E+09,9E+09,9E+09,9E+09,9E+09]], speedWeld, fine, toolWeldGun;
	ENDPROC


ENDMODULE
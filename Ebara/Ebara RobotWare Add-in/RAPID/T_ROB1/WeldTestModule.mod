MODULE WeldTestModule
    TASK PERS robtarget pWeldReady:=[[3033.02,-175.70,1180.65],[0.000185918,0.792523,-0.609842,0.000196649],[-1,0,-1,0],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWeld1:=[[2393.36,1.08,973.87],[0.0253898,-0.791918,0.609207,0.0329821],[0,-1,0,0],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWeld2:=[[2502.91,-86.37,998.83],[0.0253954,-0.791913,0.609212,0.0329991],[0,0,-1,0],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS seamdata seamWeld:=[0,0.5,[0,0,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0.5];
    TASK PERS welddata weldWeld:=[6,0,[25,0,0,0,0,230,0,0,0],[0,0,0,0,0,0,0,0,0]];

    TASK PERS robtarget pWeldWeaveReady:=[[506.33,1243.17,-666.96],[0.657951,-0.267537,-0.648249,-0.274405],[0,-1,-3,1],[670.006,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWeldWeave1:=[[506.33,1243.17,-666.96],[0.65795,-0.267538,-0.648249,-0.274405],[0,-1,-3,1],[670.006,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWeldWeave2:=[[506.33,1243.17,-666.96],[0.65795,-0.267538,-0.648249,-0.274405],[0,-1,-3,1],[670.006,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS seamdata seamWeave:=[0.5,0.5,[0,0,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0.5];
    TASK PERS welddata weldWeave:=[3,0,[4,0,-5,0,0,230,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveWeave:=[1,0,1.5,6,0,0,0,0,0,0,0,0,0,0,0];

    TASK PERS robtarget pWGReady:=[[1271.79,-4.62,1152.61],[0.0240367,-0.749435,0.658313,0.0662828],[-1,0,-1,0],[4202,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWG1:=[[1285.22,-9.89,1145.16],[0.0240104,-0.749439,0.658311,0.0662668],[-1,0,-1,0],[4202,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWG2:=[[1299.80,-114.47,1142.76],[0.0240398,-0.749434,0.658314,0.0662829],[-1,0,-1,0],[4202,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWG3:=[[2448.14,-82.67,921.15],[0.0506935,-0.644004,0.753239,0.123778],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWG4:=[[2439.86,-71.20,921.14],[0.050693,-0.644004,0.753239,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWG5:=[[2419.66,-82.10,921.15],[0.0506937,-0.644003,0.753239,0.123779],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS seamdata seamWG:=[0,0.5,[0,0,0,100,0,0,0,0,0],0,0,5,0,0,[0,0,1,140,0,0,0,0,0],0,1.5,[0,0,1,90,0,0,0,0,0],0.04,0,[0,0,0,0,0,0,0,0,0],0.5];
    TASK PERS welddata weldWG:=[7,0,[46,0,0,0,0,220,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveWG:=[1,0,3.5,0.1,0,0,0,0,0,0,0,0,0,0,0];
    TASK PERS trackdata trackWG:=[0,FALSE,50,[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0]];
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

    LOCAL PERS robtarget pWGAdaptReady:=[[2334.12,-833.13,1316.74],[0.0355487,0.711657,-0.700292,0.0432716],[0,-1,0,0],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pWGAdapt1:=[[2170.30,-833.13,1316.74],[0.0355492,0.711658,-0.700291,0.0432722],[0,-1,0,0],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pWGAdapt2:=[[2274.24,-833.12,1316.74],[0.0355444,0.711658,-0.700291,0.0432687],[0,-1,0,0],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pWGAdapt3:=[[1953.95,1014.40,700.07],[0.00019009,-0.0473788,0.998877,-0.000665836],[0,-1,0,0],[1758.22,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS trackdata trackWGAdapt:=[0,FALSE,50,[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0]];
    TASK PERS seamdata seamWGAdapt:=[0,0.5,[0,0,0,100,0,0,0,0,0],0,0,5,0,0,[0,0,1,140,0,0,0,0,0],0,1.5,[0,0,1,90,0,0,0,0,0],0.04,0,[0,0,0,0,0,0,0,0,0],0.5];
    TASK PERS welddata weldWGAdapt:=[9,0,[7,0,0,0,0,140,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveWGAdapt:=[1,0,4.5,0.1,0,0,0,0,0,0,0,0,0,0,0];
    TASK PERS adaptdata adaptWGAdapt:=[0.1,1,0,0,0.1,100,0.1,100];
    TASK PERS trackdata trackWGCalc:=[0,FALSE,50,[1,30,30,3,0,3,36,1,12],[0,0,0,0,0,0,0]];
    TASK PERS adaptdata adaptWGCalc:=[10,1,0,0,3,36,3,12];

    VAR intnum intIPathPos;
    TASK PERS pos posAdaptSensor:=[0,0,0];
    TASK PERS robtarget pAdaptWeaveCenter:=[[1183.87,44.9452,909.84],[0.14181,-0.00365029,0.989869,-0.00595079],[0,-1,0,0],[-1.0483E-33,9E+9,9E+9,9E+9,9E+9,9E+9]];
    TASK PERS num numAdaptWeaveCount:=15;
    TASK PERS num numGrooveWidthStart:=0.1;
    TASK PERS num numGrooveWidthEnd:=2;
    TASK PERS num numAdaptWeaveTotal:=8;
    TASK PERS num numAdaptWeaveWidth:=11.375;
    TASK PERS num numAdaptWeldSpeed:=3.4;
    TASK PERS robtarget pWeldReady10:=[[1181.74,-1106.16,1571.62],[0.0969078,0.705693,-0.694064,0.104314],[0,-1,0,0],[4262,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC WeldTest()
        MoveJ pWeldReady,v100,z10,toolWeldGun;
        ArcLStart pWeld1,v100,seamWeld,weldWeld,fine,toolWeldGun;
        ArcLEnd pWeld2,v100,seamWeld,weldWeld,fine,toolWeldGun;
        MoveL pWeldReady,v100,fine,toolWeldGun;
    ENDPROC

    PROC WeldWeaveTest()
        MoveJ pWeldWeaveReady,v100,z10,toolWeldGun;
        ArcLStart pWeldWeave1,v100,seamWeave,weldWeave\Weave:=weaveWeave,fine,toolWeldGun;
        ArcLEnd pWeldWeave2,v100,seamWeave,weldWeave\Weave:=weaveWeave,fine,toolWeldGun;
        MoveL pWeldWeaveReady,v100,fine,toolWeldGun;
        RETURN ;
    ENDPROC

    PROC WGTest()
        seamWG:=seamNext;
        weldWG:=weldNext;
        weaveWG:=weaveNext;
        trackWG:=trackNext;
        
        MoveL pWGReady,v100,z10,toolWeldGun\WObj:=wobj0;
        ArcLStart pWG1,v100,seamWG,weldWG\Weave:=weaveWG,fine,toolWeldGun\Track:=trackWG\SeamName:="weldTest";
        ArcLEnd pWG2,v100,seamWG,weldWG\Weave:=weaveWG,fine,toolWeldGun\Track:=trackWG;
        Stop;
        ArcRepL\Start\End,Layer_2,v100,seamWG,weldWG,weaveWG,z10,toolWeldGun\WObj:=wobj0\SeamName:="weldTest";
        Stop;
        ArcRepL\Start\End,Layer_3,v100,seamWG,weldWG,weaveWG,z10,toolWeldGun\WObj:=wobj0\SeamName:="weldTest";
        MoveL pWGReady,v100,z10,toolWeldGun\WObj:=wobj0;
    ENDPROC

    PROC WGCircleTest()
        seamWG:=seamNext;
        weldWG:=weldNext;
        weaveWG:=weaveNext;
        trackWG:=trackNext;
        
        MoveL pWGReady,v100,z10,toolWeldGun\WObj:=wobj0;
        ArcLStart pWG1,v100,seamWG,weldWG\Weave:=weaveWG,fine,toolWeldGun\Track:=trackWG\SeamName:="weldTest";
        ArcC pWG2,pWG3,v100,seamWG,weldWG\Weave:=weaveWG,fine,toolWeldGun\Track:=trackWG;
        ArcCEnd pWG4,pWG5,v100,seamWG,weldWG\Weave:=weaveWG,fine,toolWeldGun\Track:=trackWG;
        
        Stop;
        ArcRepL\Start\End,Layer_2,v100,seamWG,weldWG,weaveWG,z10,toolWeldGun\WObj:=wobj0\SeamName:="weldTest";
        Stop;
        ArcRepL\Start\End,Layer_3,v100,seamWG,weldWG,weaveWG,z10,toolWeldGun\WObj:=wobj0\SeamName:="weldTest";
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
        seamWGAdapt:=seamNext;
        weldWGAdapt:=weldNext;
        weaveWGAdapt:=weaveNext;
        trackWGAdapt:=trackNext;
        adaptWGAdapt:=adaptNext;

        MoveJ pWGAdaptReady,v100,z10,toolWeldGun\WObj:=wobj0;
        ArcCalcLStart pWGAdapt1,v100,numGrooveWidthStart,adaptWGAdapt,seamWGAdapt,weldWGAdapt,weaveWGAdapt,fine,toolWeldGun,trackWGAdapt;
        ArcCalcLEnd pWGAdapt2,v100,numGrooveWidthEnd,adaptWGAdapt,fine,toolWeldGun;
        MoveL pWGAdaptReady,v100,fine,toolWeldGun\WObj:=wobj0;
    ENDPROC

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


ENDMODULE
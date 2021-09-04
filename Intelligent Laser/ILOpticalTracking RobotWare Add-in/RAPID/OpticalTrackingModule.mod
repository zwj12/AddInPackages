MODULE OpticalTrackingModule
    PERS tooldata toolWeldGun:=[TRUE,[[90.9339,0.115218,340.077],[0.867056,0.0105615,0.497518,-0.0240616]],[2,[0,0,200],[1,0,0,0],0,0,0]];

    PERS seamdata seam1:=[0,0,[1,2,0,0,0,0,0,0,0],0,0,0,0,0,[1,2,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0];
    PERS welddata weld1:=[20,0,[1,2,0,0,0,0,0,0,0],[0,2,0,0,0,0,0,0,0]];
    PERS weavedata weave1:=[1,0,2.5,3,0,0,0,0,0,0,0,0,0,0,0];
    PERS trackdata track1:=[1,FALSE,100,[0,0,0,0,0,0,0,0,0],[5,10,0,0,0,0,12]];
    PERS optscandata optscan_sink:=[5,5,0,0,0,0,FALSE];
    PERS Pose pose_search:=[[29.9498,8.12799,-1.4411],[1,0,0,0]];

    PERS robtarget p_ready:=[[1270,0,1570],[0.707107,0,0.707107,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget p_schfrom:=[[708.10,-816.19,761.26],[0.0332307,0.0115016,0.999378,-0.00282893],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget p_schto:=[[708.18,-888.85,761.27],[0.0332309,0.0115151,0.999378,-0.00282975],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget p_search:=[[738.13,-880.722,759.829],[0.0332397,0.0114776,0.999378,-0.00285672],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget p_start:=[[738.13,-880.722,759.829],[0.0332397,0.0114776,0.999378,-0.00285672],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget p_via1:=[[738.13,-880.722,759.829],[0.0332397,0.0114776,0.999378,-0.00285672],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget p_via2:=[[738.13,-880.722,759.829],[0.0332397,0.0114776,0.999378,-0.00285672],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget p_end:=[[738.13,-880.722,759.829],[0.0332397,0.0114776,0.999378,-0.00285672],[-1,0,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PERS num numGapValue:=6.55385;
    PERS string strLaserDevice:="laser1:";
    VAR intnum IntAdaptive;

    PROC WeldbyOpticalTracking()
        MoveJ p_ready,v100,z50,toolWeldGun;
        OptSearch_1D pose_search\SearchStop:=p_search,p_schfrom,p_schto,v100,toolWeldGun,optscan_sink,track1;
        ArcLStart p_search,v100,seam1,weld1,fine,toolWeldGun\Track:=track1;
        ArcLEnd p_end,v100,seam1,weld1,fine,toolWeldGun\Track:=track1;
        MoveL p_ready,v100,fine,toolWeldGun;
    ENDPROC

    PROC WeldwithPreProcess()
        MoveJ p_ready,v100,z50,toolWeldGun\WObj:=wobj0;
        ArcLStart p_start,v100,seam1,weld1,fine,toolWeldGun\WObj:=wobj0\Track:=track1\PreProcessTracking;
        ArcL p_via1,v100,seam1,weld1,z10,toolWeldGun\WObj:=wobj0\Track:=track1;
        ArcL p_via2,v100,seam1,weld1,z10,toolWeldGun\WObj:=wobj0\Track:=track1;
        ArcLEnd p_end,v100,seam1,weld1,fine,toolWeldGun\WObj:=wobj0\Track:=track1;
        MoveL p_ready,v100,fine,toolWeldGun\WObj:=wobj0;
    ENDPROC

    PROC AdaptiveWeld()
        IDelete IntAdaptive;
        CONNECT IntAdaptive WITH AdaptiveRefresh;
        IVarValue strLaserDevice,LTAPP__GAP,numGapValue,IntAdaptive\unit:=1\deadband:=1\ReportAtTool;
        MoveJ p_ready,v100,z50,toolWeldGun;
        ArcLStart p_start,v100,seam1,weld1\Weave:=weave1,fine,toolweldgun\Track:=track1;
        ArcLEnd p_end,v100,seam1,weld1\Weave:=weave1,fine,toolweldgun\Track:=track1;
        MoveL p_ready,v100,fine,toolweldgun;
    ENDPROC

    TRAP AdaptiveRefresh
        ISleep IntAdaptive;
        IF numGapValue<=2 THEN
            weave1.weave_width:=2;
        ELSEIF numGapValue<=3 THEN
            weave1.weave_width:=3;
        ELSEIF numGapValue<=4 THEN
            weave1.weave_width:=4;
        ELSEIF numGapValue<=5 THEN
            weave1.weave_width:=5;
        ELSEIF numGapValue<=6 THEN
            weave1.weave_width:=6;
        ELSEIF numGapValue<=7 THEN
            weave1.weave_width:=7;
        ELSEIF numGapValue<=8 THEN
            weave1.weave_width:=8;
        ELSEIF numGapValue<=9 THEN
            weave1.weave_width:=9;
        ELSE
            weave1.weave_width:=10;
        ENDIF
        ArcRefresh;
        IWatch IntAdaptive;
    ENDTRAP
ENDMODULE
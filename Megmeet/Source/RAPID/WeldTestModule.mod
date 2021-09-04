MODULE WeldTestModule
    TASK PERS robtarget pWeldReady:=[[921.59,39.96,468.12],[0.00308549,0.00705431,-0.918314,-0.395779],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWeld1:=[[1054.64,104.22,361.28],[0.00619787,0.0110549,-0.91577,-0.401503],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWeld2:=[[1123.15,109.25,361.30],[0.00621767,0.0110818,-0.915759,-0.401526],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS seamdata seamWeld:=[0,0.5,[0,0,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0.5];
    TASK PERS welddata weldWeld:=[10,0,[11,0,0,0,200,0,0,0,0],[0,0,0,0,0,0,0,0,0]];

    TASK PERS robtarget pWeldWeaveReady:=[[1196.64,148.52,517.49],[0.201481,-0.634123,-0.706072,-0.242395],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWeldWeave1:=[[1260.37,161.06,508.92],[0.20147,-0.634117,-0.706086,-0.242378],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWeldWeave2:=[[1456.36,144.09,533.45],[0.201508,-0.634096,-0.706108,-0.24234],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS seamdata seamWeave:=[0.5,0.5,[0,0,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0.5];
    TASK PERS welddata weldWeave:=[5,0,[11,0,-5,0,0,200,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveWeave:=[1,0,2.5,4,0,0,0,0,0,0,0,0,0,0,0];

    TASK PERS robtarget pWGReady:=[[1035.79,377.26,458.58],[0.385729,-0.000928072,-0.922604,0.00381442],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWG1:=[[975.05,454.71,363.83],[0.385727,-0.000866472,-0.922605,0.00383952],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget pWG2:=[[974.99,377.23,363.84],[0.385777,-0.000906104,-0.922583,0.00384172],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS seamdata seamWGHeight:=[0,0.5,[0,0,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0.5];
    TASK PERS welddata weldWGHeight:=[6,0,[11,0,0,0,200,160,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveWGHeight:=[1,0,3,2,0,0,0,0,0,0,0,0,0,0,0];
    TASK PERS trackdata trackWGHeight:=[2,TRUE,100,[5,0,20,0,0,0,0,0,0],[0,0,0,0,0,0,0]];
 
    TASK PERS seamdata seamWG:=[0,0.5,[0,0,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0.5];
    TASK PERS welddata weldWG:=[4,0,[11,0,1,0,200,160,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveWG:=[1,0,2,4,0,0,0,0,0,0,0,0,0,0,0];
    TASK PERS trackdata trackWG:=[2,TRUE,100,[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0]];
    TASK PERS multidata Layer_2:=[1,15,15,0,0,5,5,0,0];
    TASK PERS multidata Layer_3:=[1,15,15,0,0,-5,5,0,0];

    PROC WeldTest()
        MoveJ pWeldReady,v100,fine,toolWeldGun;
        ArcLStart pWeld1,v100,seamWeld,weldWeld,fine,toolWeldGun;
        ArcLEnd pWeld2,v100,seamWeld,weldWeld,fine,toolWeldGun;
        MoveL pWeldReady,v100,fine,toolWeldGun;
        !RETURN ;
    ENDPROC

    PROC WeldWeaveTest()
        !MoveJ pWeldWeaveReady, v100, fine, toolWeldGun;
        ArcLStart pWeldWeave1,v100,seamWeave,weldWeave\Weave:=weaveWeave,fine,toolWeldGun\Track:=trackWG;
        ArcLEnd pWeldWeave2,v100,seamWeave,weldWeave\Weave:=weaveWeave,fine,toolWeldGun\Track:=trackWG;
        Stop;
        !MoveL pWeldWeaveReady,v100,fine,toolWeldGun;
        RETURN ;
    ENDPROC
    
    PROC WGHeightTest()
        MoveL pWGReady,v100,z10,toolWeldGun\WObj:=wobj0;
        ArcLStart pWG1,v100,seamWGHeight,weldWGHeight,fine,toolWeldGun\Track:=trackWGHeight\SeamName:="weldHeightTest";
        ArcLEnd pWG2,v100,seamWGHeight,weldWGHeight,fine,toolWeldGun\Track:=trackWGHeight;
        Stop;
        ArcRepL\Start\End,Layer_2,v100,seamWG,weldWG,weaveWG,z10,toolWeldGun\WObj:=wobj0\SeamName:="weldHeightTest";
        Stop;
        ArcRepL\Start\End,Layer_3,v100,seamWG,weldWG,weaveWG,z10,toolWeldGun\WObj:=wobj0\SeamName:="weldHeightTest";
        MoveL pWGReady,v100,z10,toolWeldGun\WObj:=wobj0;
    ENDPROC
    
    PROC WGTest()
        MoveL pWGReady,v100,z10,toolWeldGun\WObj:=wobj0;
        ArcLStart pWG1, v100, seamWG, weldWG\Weave:=weaveWG, fine, toolWeldGun\Track:=trackWG\SeamName:="weldTest";
        ArcLEnd pWG2, v100, seamWG, weldWG\Weave:=weaveWG, fine, toolWeldGun\Track:=trackWG;
        Stop;
        ArcRepL\Start\End,Layer_2,v100,seamWG,weldWG,weaveWG,z10,toolWeldGun\WObj:=wobj0\SeamName:="weldTest";
        Stop;
        ArcRepL\Start\End,Layer_3,v100,seamWG,weldWG,weaveWG,z10,toolWeldGun\WObj:=wobj0\SeamName:="weldTest";
        MoveL pWGReady,v100,z10,toolWeldGun\WObj:=wobj0;
    ENDPROC

ENDMODULE
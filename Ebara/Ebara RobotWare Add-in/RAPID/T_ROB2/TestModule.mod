MODULE TestModule
    !*****************************************************
    !Module Name: TestModule
    !Version:     1.0
    !Description: Used for adjust the robtarget or other test
    !Date:        2018-8-10
    !Author:      Michael
    !*****************************************************

    PERS seamdata seam1:=[0,0.5,[0,0,0,100,0,0,0,0,0],0,0,5,0,0,[0,0,1,140,0,0,0,0,0],0,1.5,[0,0,1,90,0,0,0,0,0],0.04,0,[0,0,0,0,0,0,0,0,0],0.5];
    PERS welddata weld1:=[7,0,[8,0,0,0,0,140,0,0,0],[0,0,0,0,0,0,0,0,0]];
    PERS welddata weld2:=[7,0,[7,0,0,0,0,140,0,0,0],[0,0,0,0,0,0,0,0,0]];
    PERS welddata weld3:=[7,0,[7,0,0,0,0,140,0,0,0],[0,0,0,0,0,0,0,0,0]];
    PERS welddata weld4:=[7,0,[7,0,0,0,0,140,0,0,0],[0,0,0,0,0,0,0,0,0]];
    PERS welddata weld5:=[7,0,[7,0,0,0,0,140,0,0,0],[0,0,0,0,0,0,0,0,0]];
    PERS welddata weld6:=[7,0,[7,0,0,0,0,140,0,0,0],[0,0,0,0,0,0,0,0,0]];
    PERS welddata weld7:=[7,0,[7,0,0,0,0,140,0,0,0],[0,0,0,0,0,0,0,0,0]];
    PERS welddata weld8:=[7,0,[7,0,0,0,0,140,0,0,0],[0,0,0,0,0,0,0,0,0]];
    PERS welddata weld9:=[7,0,[9,0,0,0,0,140,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS tooldata tool1:=[TRUE,[[0,0,0],[1,0,0,0]],[-1,[0,0,0],[1,0,0,0],0,0,0]];

    PROC TestScanWobjAccuracy()
        UpdateWobjAndTrack;
    ENDPROC

    PROC TestSBPeriphery()
        VAR pose poseGrooveAngle:=[[0,0,0],[1,0,0,0]];
        jointBranchCenter.extax:=extjointValue;
        MoveAbsJ jointBranchCenter\NoEOffs,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !poseGrooveAngle.rot:=OrientZYX(0,0,0-rPipeGrooveModel.numSeamNormalAngle);
        !wobjCurrent.oframe.rot:=[0.5,-0.5,-0.5,-0.5];
        !wobjCurrent.oframe:=PoseMult(wobjCurrent.oframe,poseGrooveAngle);
        robtBranchCenter.trans.x:=0;
        robtBranchCenter.trans.y:=0;
        !robtBranchCenter.trans.z:=300;
        robtBranchCenter.extax.eax_a:=extjointValue.eax_a;
        MoveJ robtBranchCenter,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtBranchCenter,0,rPipeGrooveModel.numBranchDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtBranchCenter,0-rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtBranchCenter,0,0-rPipeGrooveModel.numBranchDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        Stop;
        MoveL Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveC Offs(robtBranchCenter,0,rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtBranchCenter,0-rPipeGrooveModel.numBranchDiameter/2,0,0),speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveC Offs(robtBranchCenter,0,0-rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
        Stop;

        MoveJ robtBranchCenter,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtBranchCenter,0,rPipeGrooveModel.numBranchDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtBranchCenter,0-rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtBranchCenter,0,0-rPipeGrooveModel.numBranchDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        Stop;
        MoveL Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveC Offs(robtBranchCenter,0,rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtBranchCenter,0-rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveC Offs(robtBranchCenter,0,0-rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
    ENDPROC

    PROC TestSBPeripherybyLaser()
        VAR pose poseGrooveAngle:=[[0,0,0],[1,0,0,0]];
        jointBranchCenter.extax:=extjointValue;
        MoveAbsJ jointBranchCenter\NoEOffs,speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        !poseGrooveAngle.rot:=OrientZYX(0,0,0-rPipeGrooveModel.numSeamNormalAngle);
        !wobjCurrent.oframe.rot:=[0.5,-0.5,-0.5,-0.5];
        !wobjCurrent.oframe:=PoseMult(wobjCurrent.oframe,poseGrooveAngle);
        robtBranchCenter.trans.x:=0;
        robtBranchCenter.trans.y:=0;
        !robtBranchCenter.trans.z:=300;
        robtBranchCenter.extax.eax_a:=extjointValue.eax_a;
        MoveJ robtBranchCenter,speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        MoveL Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolLaser\WObj:=wobjCurrent;
        MoveC Offs(robtBranchCenter,0,rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtBranchCenter,0-rPipeGrooveModel.numBranchDiameter/2,0,0),speedWeld,fine,toolLaser\WObj:=wobjCurrent;
        MoveC Offs(robtBranchCenter,0,0-rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedWeld,fine,toolLaser\WObj:=wobjCurrent;
        MoveL Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolLaser\WObj:=wobjCurrent;
        MoveL Offs(robtBranchCenter,0,rPipeGrooveModel.numBranchDiameter/2,0),speedAir,fine,toolLaser\WObj:=wobjCurrent;
        MoveL Offs(robtBranchCenter,0-rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolLaser\WObj:=wobjCurrent;
        MoveL Offs(robtBranchCenter,0,0-rPipeGrooveModel.numBranchDiameter/2,0),speedAir,fine,toolLaser\WObj:=wobjCurrent;
        Stop;

        MoveJ robtBranchCenter,speedAir,zoneAir,toolLaser\WObj:=wobjCurrent2;
        MoveL Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolLaser\WObj:=wobjCurrent2;
        MoveC Offs(robtBranchCenter,0,rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtBranchCenter,0-rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolLaser\WObj:=wobjCurrent2;
        MoveC Offs(robtBranchCenter,0,0-rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolLaser\WObj:=wobjCurrent2;
    ENDPROC

    PROC TestSBPeripheryinSTN1PLATE1()
        jointBranchCenter.extax:=extjointValue;
        MoveAbsJ jointBranchCenter\NoEOffs,speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        robtBranchCenter.trans.x:=rPipeGrooveModel.numSeamCenterX;
        robtBranchCenter.trans.y:=0;
        !robtBranchCenter.trans.z:=300;
        robtBranchCenter.extax.eax_a:=extjointValue.eax_a;
        MoveJ robtBranchCenter,speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveL Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveC Offs(robtBranchCenter,0,rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtBranchCenter,0-rPipeGrooveModel.numBranchDiameter/2,0,0),speedWeld,fine,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveC Offs(robtBranchCenter,0,0-rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedWeld,fine,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveL Offs(robtBranchCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveL Offs(robtBranchCenter,0,rPipeGrooveModel.numBranchDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveL Offs(robtBranchCenter,0-rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveL Offs(robtBranchCenter,0,0-rPipeGrooveModel.numBranchDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjSTN1PLATE1;
        Stop;
    ENDPROC

    PROC TestSHPeripheryinSTN1PLATE1()
        jointHeaderCenter.extax:=extjointValue;
        MoveAbsJ jointHeaderCenter\NoEOffs,speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        !robtHeaderCenter.trans.x:=0;
        robtHeaderCenter.trans.y:=0;
        robtHeaderCenter.trans.z:=0;
        robtHeaderCenter.extax.eax_a:=extjointValue.eax_a-300;
        MoveJ robtHeaderCenter,speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveL Offs(robtHeaderCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveC Offs(robtHeaderCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),Offs(robtHeaderCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedWeld,fine,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveC Offs(robtHeaderCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),Offs(robtHeaderCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedWeld,fine,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveL Offs(robtHeaderCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveL Offs(robtHeaderCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveL Offs(robtHeaderCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveL Offs(robtHeaderCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjSTN1PLATE1;
        Stop;

    ENDPROC

    PROC TestSHPeriphery()
        jointHeaderCenter.extax.eax_a:=extjointValue.eax_a-400;
        MoveAbsJ jointHeaderCenter\NoEOffs,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !robtHeaderCenter.trans.x:=0;
        robtHeaderCenter.trans.y:=0;
        robtHeaderCenter.trans.z:=0;
        robtHeaderCenter.extax:=jointHeaderCenter.extax;
        MoveJ robtHeaderCenter,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtHeaderCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtHeaderCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtHeaderCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtHeaderCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        Stop;
        MoveL Offs(robtHeaderCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveC Offs(robtHeaderCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),Offs(robtHeaderCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveC Offs(robtHeaderCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),Offs(robtHeaderCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
        Stop;

        MoveJ robtHeaderCenter,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtHeaderCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtHeaderCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtHeaderCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtHeaderCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        Stop;
        MoveL Offs(robtHeaderCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveC Offs(robtHeaderCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),Offs(robtHeaderCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveC Offs(robtHeaderCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),Offs(robtHeaderCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;

    ENDPROC

    PROC TestSTN1Aligned()
        jointSTN1Aligned.extax:=extjointValue;
        MoveAbsJ jointSTN1Aligned\NoEOffs,v1000,z50,toolWeldGun\WObj:=wobjSTN1PLATE1;
        Stop;
        robtSTN1Aligned.trans.x:=rPipeGrooveModel.numSeamCenterX;
        robtSTN1Aligned.trans.y:=30+rPipeGrooveModel.numBranchDiameter/2;
        robtSTN1Aligned.trans.z:=rPipeGrooveModel.numHeaderDiameter/2;
        robtSTN1Aligned.extax:=extjointValue;
        Stop;
        MoveL robtSTN1Aligned,speedAir,fine,toolWeldGun\WObj:=wobjSTN1PLATE1;
        MoveL offs(robtSTN1Aligned,0,0,80),speedAir,fine,toolWeldGun\WObj:=wobjSTN1PLATE1;
    ENDPROC

    PROC TestPBPeriphery()
        VAR pose poseGrooveAngle:=[[0,0,0],[1,0,0,0]];
        jointPBCenter.extax:=extjointValue;
        MoveAbsJ jointPBCenter\NoEOffs,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !poseGrooveAngle.rot:=OrientZYX(0,0,0-rPipeGrooveModel.numSeamNormalAngle);
        !wobjCurrent.oframe.rot:=[0.5,-0.5,-0.5,-0.5];
        !wobjCurrent.oframe:=PoseMult(wobjCurrent.oframe,poseGrooveAngle);
        robtPBCenter.trans.x:=0;
        robtPBCenter.trans.y:=0;
        robtPBCenter.trans.z:=310;
        robtPBCenter.extax.eax_a:=extjointValue.eax_a;
        MoveJ robtPBCenter,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtPBCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtPBCenter,0,rPipeGrooveModel.numBranchDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtPBCenter,0-rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtPBCenter,0,0-rPipeGrooveModel.numBranchDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        Stop;
        MoveL Offs(robtPBCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveC Offs(robtPBCenter,0,rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtPBCenter,0-rPipeGrooveModel.numBranchDiameter/2,0,0),speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveC Offs(robtPBCenter,0,0-rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtPBCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
        Stop;

        MoveJ robtPBCenter,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent1;
        MoveL Offs(robtPBCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtPBCenter,0,rPipeGrooveModel.numBranchDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtPBCenter,0-rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtPBCenter,0,0-rPipeGrooveModel.numBranchDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        Stop;
        MoveL Offs(robtPBCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveC Offs(robtPBCenter,0,rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtPBCenter,0-rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveC Offs(robtPBCenter,0,0-rPipeGrooveModel.numBranchDiameter/2,0),Offs(robtPBCenter,rPipeGrooveModel.numBranchDiameter/2,0,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
    ENDPROC

    PROC TestPBBottom()
        jointPBBottom.extax:=extjointValue;
        MoveAbsJ jointPBBottom\NoEOffs,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        robtPBBottom.trans.x:=rPipeGrooveModel.numBranchDiameter/2+10;
        robtPBBottom.trans.y:=rPipeGrooveModel.numBranchDiameter/2;
        !robtPBBottom.trans.z:=rPipeGrooveModel.numHeaderDiameter/2+rPipeGrooveModel.numGrooveGap;
        robtPBBottom.trans.z:=rPipeGrooveModel.numHeaderDiameter/2;
        robtPBBottom.rot:=OrientZYX(180,0,-90);
        robtPBBottom.extax.eax_a:=extjointValue.eax_a;

        MoveJ robtPBBottom,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL robtPBBottom,speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        Stop;

        MoveJ robtPBBottom,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL robtPBBottom,speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        Stop;
    ENDPROC

    PROC TestPHPeriphery()
        jointPHCenter.extax.eax_a:=extjointValue.eax_a+300;
        MoveAbsJ jointPHCenter\NoEOffs,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !robtPHCenter.trans.x:=0;
        robtPHCenter.trans.y:=0;
        robtPHCenter.trans.z:=0;
        robtPHCenter.extax:=jointPHCenter.extax;
        MoveJ robtPHCenter,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtPHCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtPHCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtPHCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtPHCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        Stop;
        MoveL Offs(robtPHCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveC Offs(robtPHCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),Offs(robtPHCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveC Offs(robtPHCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),Offs(robtPHCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
        Stop;

        MoveJ robtPHCenter,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtPHCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtPHCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtPHCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtPHCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        Stop;
        MoveL Offs(robtPHCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent1;
        MoveC Offs(robtPHCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),Offs(robtPHCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveC Offs(robtPHCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),Offs(robtPHCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
    ENDPROC

    PROC TestPHPeripheryMedianLine()
        jointPHCenterMedianLine.extax.eax_a:=extjointValue.eax_a;
        MoveAbsJ jointPHCenterMedianLine\NoEOffs,speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        robtPHCenterMedianLine.trans.x:=0;
        robtPHCenterMedianLine.trans.y:=rPipeGrooveModel.numHeaderDiameter/2;
        robtPHCenterMedianLine.trans.z:=0;
        robtPHCenterMedianLine.extax:=jointPHCenterMedianLine.extax;
        MoveL robtPHCenterMedianLine,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        Stop;

        MoveJ robtPHCenterMedianLine,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent1;

    ENDPROC


    PROC TestSHPeripheryMedianLine()
        jointSHCenterMedianLine.extax.eax_a:=extjointValue.eax_a;
        MoveAbsJ jointSHCenterMedianLine\NoEOffs,speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        Stop;
        robtSHCenterMedianLine.trans.x:=0;
        robtSHCenterMedianLine.trans.y:=0-rPipeGrooveModel.numHeaderDiameter/2;
        robtSHCenterMedianLine.trans.z:=0;
        robtSHCenterMedianLine.extax:=jointSHCenterMedianLine.extax;
        MoveJ robtSHCenterMedianLine,speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        Stop;

        MoveJ robtSHCenterMedianLine,speedAir,fine,toolWeldGun\WObj:=wobjCurrent1;

    ENDPROC

    PROC TestPHPeriphery2()
        jointPHCenter2.extax.eax_a:=extjointValue.eax_a-400;
        MoveAbsJ jointPHCenter2\NoEOffs,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !robtPHCenter.trans.x:=0;
        robtPHCenter.trans.y:=0;
        robtPHCenter.trans.z:=0;
        robtPHCenter.extax:=jointPHCenter2.extax;
        MoveJ robtPHCenter,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtPHCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtPHCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtPHCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveL Offs(robtPHCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        Stop;
        MoveL Offs(robtPHCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveC Offs(robtPHCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),Offs(robtPHCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveC Offs(robtPHCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),Offs(robtPHCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
        Stop;

        MoveJ robtPHCenter,speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtPHCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtPHCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtPHCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        MoveL Offs(robtPHCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent2;
        Stop;
        MoveL Offs(robtPHCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent1;
        MoveC Offs(robtPHCenter,0,0,rPipeGrooveModel.numHeaderDiameter/2),Offs(robtPHCenter,0,0-rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
        MoveC Offs(robtPHCenter,0,0,0-rPipeGrooveModel.numHeaderDiameter/2),Offs(robtPHCenter,0,rPipeGrooveModel.numHeaderDiameter/2,0),speedAir,fine,toolWeldGun\WObj:=wobjCurrent2;
    ENDPROC

    PROC TestPlatoonAligned()
        jointPlatoonAligned.extax:=extjointValue;
        MoveAbsJ jointPlatoonAligned\NoEOffs,v1000,z50,toolWeldGun\WObj:=wobjRailFixture;
        robtPlatoonAligned.trans.x:=rPipeGrooveModel.numSeamCenterX;
        robtPlatoonAligned.trans.y:=30+rPipeGrooveModel.numBranchDiameter/2;
        robtPlatoonAligned.trans.z:=rPipeGrooveModel.numHeaderDiameter/2;
        MoveL robtPlatoonAligned,speedAir,fine,toolWeldGun\WObj:=wobjRailFixture;
        MoveL offs(robtPlatoonAligned,0,0,120),speedWeld,fine,toolWeldGun\WObj:=wobjRailFixture;
    ENDPROC

    PROC TestTrackHorizontal()
        jointTrackHorizontal.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        MoveAbsJ jointTrackHorizontal\NoEOffs,v1000,z50,toolWeldGun\WObj:=wobjRailFixture;
        robtTrackHorizontal.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        robtTrackHorizontal.trans.x:=rPipeGrooveModel.numSeamCenterX;
        robtTrackHorizontal.trans.y:=0;
        robtTrackHorizontal.trans.z:=1000;
        !robtTrackHorizontal.rot:=[0.5,0.5,0.5,-0.5];
        robtTrackHorizontal.rot:=OrientZYX(0,90,90);
        MoveL robtTrackHorizontal,speedAir,fine,toolWeldGun\WObj:=wobjRailFixture;
    ENDPROC

    PROC VerifyTrackHorizontal()
        robtTrackHorizontal.extax.eax_a:=numTrackMin;
        robtTrackHorizontal.trans.x:=numTrackRef-numTrackMin;
        robtTrackHorizontal.trans.y:=0-numVerifyTrackOverLap;
        robtTrackHorizontal.trans.z:=numVerifyTrackHeight;
        !robtTrackHorizontal.rot:=[0.5,0.5,0.5,-0.5];
        robtTrackHorizontal.rot:=OrientZYX(0,90,90);

        MoveJ offs(robtTrackHorizontal,0,100,100),speedAir,fine,toolWeldGun\WObj:=wobjRailFixture;
        MoveL robtTrackHorizontal,speedAir,fine,toolWeldGun\WObj:=wobjRailFixture;

        robtTrackHorizontal.extax.eax_a:=numTrackMax;
        robtTrackHorizontal.trans.x:=numTrackRef-numTrackMax;
        SyncMoveOn SyncVerifyTrackHorizontal1,taskListRob1Rob2;
        MoveL robtTrackHorizontal\ID:=1,speedAir,fine,toolWeldGun\WObj:=wobjRailFixture;
        SyncMoveOff SyncVerifyTrackHorizontal2;

        Stop;

        SyncMoveOn SyncVerifyTrackHorizontal3,taskListRob1Rob2;
        
        robtTrackHorizontal:=offs(robtTrackHorizontal,0,200,200);
        MoveL robtTrackHorizontal\ID:=3,speedAir,fine,toolWeldGun\WObj:=wobjRailFixture;
        robtTrackHorizontal.extax.eax_a:=numTrackMin;
        robtTrackHorizontal.trans.x:=numTrackRef-numTrackMin;
        MoveL robtTrackHorizontal\ID:=4,speedAir,fine,toolWeldGun\WObj:=wobjRailFixture;

        Stop;
        robtTrackHorizontal:=offs(robtTrackHorizontal,0,-400,0);
        MoveL robtTrackHorizontal\ID:=5,speedAir,fine,toolWeldGun\WObj:=wobjRailFixture;
        robtTrackHorizontal.extax.eax_a:=numTrackMax;
        robtTrackHorizontal.trans.x:=numTrackRef-numTrackMax;
        MoveL robtTrackHorizontal\ID:=6,speedAir,fine,toolWeldGun\WObj:=wobjRailFixture;

        Stop;
        robtTrackHorizontal:=offs(robtTrackHorizontal,0,200,200);
        MoveL robtTrackHorizontal\ID:=7,speedAir,fine,toolWeldGun\WObj:=wobjRailFixture;
        robtTrackHorizontal.extax.eax_a:=numTrackMin;
        robtTrackHorizontal.trans.x:=numTrackRef-numTrackMin;
        MoveL robtTrackHorizontal\ID:=8,speedAir,fine,toolWeldGun\WObj:=wobjRailFixture;
        
        SyncMoveOff SyncVerifyTrackHorizontal4;


    ENDPROC

    PROC WeldPlatoonTestbyZhang()
        MoveJ [[2419.65,-82.10,946.15],[0.0506911,-0.644002,0.75324,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]],speedWeld,z10,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart [[2419.65,-82.10,946.15],[0.0506911,-0.644002,0.75324,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]],speedWeld,seam1,weld1,fine,toolWeldGun\WObj:=wobjCurrent;
        ArcC [[2419.65,-82.10,946.15],[0.0506911,-0.644002,0.75324,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2419.65,-82.10,946.15],[0.0506911,-0.644002,0.75324,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]],speedWeld,seam1,weld2,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
        ArcC [[2419.65,-82.10,946.15],[0.0506911,-0.644002,0.75324,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2419.65,-82.10,946.15],[0.0506911,-0.644002,0.75324,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]],speedWeld,seam1,weld1,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
        ArcC [[2419.65,-82.10,946.15],[0.0506911,-0.644002,0.75324,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2419.65,-82.10,946.15],[0.0506911,-0.644002,0.75324,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]],speedWeld,seam1,weld1,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
        ArcC [[2419.65,-82.10,946.15],[0.0506911,-0.644002,0.75324,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2419.65,-82.10,946.15],[0.0506911,-0.644002,0.75324,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]],speedWeld,seam1,weld1,zoneWeld,toolWeldGun\WObj:=wobjCurrent;
        ArcCEnd [[2419.65,-82.10,946.15],[0.0506911,-0.644002,0.75324,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2419.65,-82.10,946.15],[0.0506911,-0.644002,0.75324,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]],speedWeld,seam1,weld1,fine,toolWeldGun\WObj:=wobjCurrent;
        MoveL [[2419.65,-82.10,946.15],[0.0506911,-0.644002,0.75324,0.123777],[-1,-1,0,1],[3109,9E+09,9E+09,9E+09,9E+09,9E+09]],speedWeld,fine,toolWeldGun\WObj:=wobjCurrent;
    ENDPROC

    !Michael, 2019-2-21, For revise the wobj of Saddle
    PROC ComputeSaddleWobjbyOffset()
        VAR pose poseGrooveAngle:=[[0,0,0],[1,0,0,0]];
        VAR pos posWobjOriOffsetInWorld:=[0,0,0];
        VAR pos posWobjOri:=[0,0,0];
        VAR num nAnswer;

        TPErase;
        posWobjOriOffsetInWorld.x:=UINumEntry(\Header:="Offset Y"\Message:="Please input the offsetY in world frame"\Icon:=iconInfo\InitValue:=posWobjOriOffsetInWorld.x\MinValue:=-10\MaxValue:=10);
        posWobjOriOffsetInWorld.y:=UINumEntry(\Header:="Offset Z"\Message:="Please input the offsetZ in world frame"\Icon:=iconInfo\InitValue:=posWobjOriOffsetInWorld.y\MinValue:=-10\MaxValue:=10);
        posWobjOriOffsetInWorld.z:=wobjCurrent.oframe.trans.z;

        poseGrooveAngle.rot:=OrientZYX(0-rPipeGrooveModel.numSeamNormalAngle,0,0);
        posWobjOri:=PoseVect(poseGrooveAngle,posWobjOriOffsetInWorld);
        posWobjOri.x:=Round(posWobjOri.x\Dec:=2);
        posWobjOri.y:=Round(posWobjOri.y\Dec:=2);
        posWobjOri.z:=Round(posWobjOri.z\Dec:=2);

        TPWrite "The seam normal angle is: "\Num:=rPipeGrooveModel.numSeamNormalAngle;
        TPWrite "The new Saddle oframe's position is: "\Pos:=posWobjOri;

        UIMsgBox\Header:="Update wobjCurrent","x="+ValToStr(posWobjOri.x)\MsgLine2:="y="+ValToStr(posWobjOri.y)\MsgLine5:="Press OK to use the offset"\Buttons:=btnOKCancel\Icon:=iconInfo\Result:=nAnswer;

        IF nAnswer=resOK THEN
            wobjCurrent.oframe.trans.x:=posWobjOri.x;
            wobjCurrent.oframe.trans.y:=posWobjOri.y;
            TPWrite "wobjCurrent was updated";
        ENDIF
    ENDPROC

ENDMODULE
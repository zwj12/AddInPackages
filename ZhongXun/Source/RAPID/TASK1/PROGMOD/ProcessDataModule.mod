MODULE ProcessDataModule
    !*****************************************************
    !Module Name:   ProcessDataModule
    !Version:       1.0
    !Description:   
    !Date:          2021-3-25
    !Author:        Michael
    !*****************************************************

    !Scan Data
    !Seam 1
    CONST ScanData scanJoint1:=[1];
    !Seam 2
    CONST ScanData scanJoint2:=[2];
    !Seam 3
    CONST ScanData scanJoint3:=[3];
    !Seam 4
    CONST ScanData scanJoint4:=[4];
    !Seam 5
    CONST ScanData scanJoint5:=[5];
    !Seam 6
    CONST ScanData scanJoint6:=[6];
    !Seam 7
    CONST ScanData scanJoint7:=[7];
    !Seam 8
    CONST ScanData scanJoint8:=[8];
    !Seam 9
    CONST ScanData scanJoint9:=[9];
    !Seam 10
    CONST ScanData scanJoint10:=[10];
    !Seam 11
    CONST ScanData scanJoint11:=[11];
    !Seam 12
    CONST ScanData scanJoint12:=[12];
    !Seam 13
    CONST ScanData scanJoint13:=[13];
    !Seam 14
    CONST ScanData scanJoint14:=[14];
    !Seam 15
    CONST ScanData scanJoint15:=[1];
    !Seam 16
    CONST ScanData scanJoint16:=[16];
    !Seam 17
    CONST ScanData scanJoint17:=[17];
    !Seam 18
    CONST ScanData scanJoint18:=[18];
    !Seam 19
    CONST ScanData scanJoint19:=[19];
    !Seam 20
    CONST ScanData scanJoint20:=[20];
    
    !Welding Parameters
    TASK PERS seamdata seamShared:=[0,0.5,[0,0,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0.5];

    !Fillet weld: 2F
    TASK PERS welddata weldShared_1:=[1.5,0,[21,0,-1,0,0,350,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveShared_1:=[1,0,2.2,6,0,0.7,0,0.7,0,0,0,0,0,0,0];
    TASK PERS trackdata trackShared_1:=[2,TRUE,50,[0,0,0,3940,0,0,0,0,0],[0,0,0,0,0,0,0]];

    !Fillet weld: 3F
    TASK PERS welddata weldShared_2:=[1.7,0,[20,0,-1,0,0,350,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveShared_2:=[1,0,3,6.5,0,1,0,1,0,0,0,0,0,0,0];
    TASK PERS trackdata trackShared_2:=[2,TRUE,50,[0,0,0,3617,0,0,0,0,0],[0,0,0,0,0,0,0]];

    !Butt weld: 1G - Layer 1-1
    TASK PERS welddata weldShared_3:=[6,0,[38,0,-1,0,0,350,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveShared_3:=[1,0,4,6,0,0,0,0,0,0,0,0,0,0,0];
    TASK PERS trackdata trackShared_3:=[2,TRUE,50,[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0]];

    !Butt weld: 1G - Layer 2-1
    TASK PERS welddata weldShared_4:=[6,0,[38,0,-1,0,0,350,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveShared_4:=[1,0,4,6,0,0,0,0,0,0,0,0,0,0,0];
    TASK PERS trackdata trackShared_4:=[2,TRUE,50,[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0]];

    !Butt weld: 1G - Layer 2-2
    TASK PERS welddata weldShared_5:=[6,0,[38,0,-1,0,0,350,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveShared_5:=[1,0,4,6,0,0,0,0,0,0,0,0,0,0,0];
    TASK PERS trackdata trackShared_5:=[2,TRUE,50,[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0]];

    !Fillet weld: 2F - 3F
    TASK PERS welddata weldShared_6:=[1,0,[21,0,-1,0,0,350,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveShared_6:=[1,0,3,7,0,0.5,0,1,0,0,0,0,0,0,0];
    TASK PERS trackdata trackShared_6:=[2,TRUE,50,[0,0,0,3940,0,0,0,0,0],[0,0,0,0,0,0,0]];

    !Fillet weld: 2F - 3F
    TASK PERS welddata weldShared_7:=[1.2,0,[21,0,-1,0,0,350,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveShared_7:=[1,0,3,7,0,1,0,0.5,0,0,0,0,0,0,0];
    TASK PERS trackdata trackShared_7:=[2,TRUE,50,[0,0,0,3940,0,0,0,0,0],[0,0,0,0,0,0,0]];
    
ENDMODULE
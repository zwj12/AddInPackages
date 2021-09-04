MODULE ProcessDataModule
    !*****************************************************
    !Module Name:   ProcessDataModule
    !Version:       1.0
    !Description:   
    !Date:          2021-3-25
    !Author:        Michael
    !*****************************************************

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
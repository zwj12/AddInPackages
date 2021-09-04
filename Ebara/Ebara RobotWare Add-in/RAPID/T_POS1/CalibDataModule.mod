MODULE CalibDataModule
    !*****************************************************
    !Module Name: CalibDataModule
    !Version:     1.0
    !Description: -
    !Date:        2018-8-9
    !Author:      Michael
    !*****************************************************

    TASK PERS menudata md_MoveToHome:=["Move to Home","","MovetoHome",1,"",255,True,1,0,False,210];
    TASK PERS menudata md_MovetoOrigin:=["Move to Origin","","MovetoOrigin",1,"",255,True,1,0,False,211];
    TASK PERS menudata md_VerifyTrackHorizontal:=["Verify Track Horizontal","","VerifyTrackHorizontal",1,"T_ROB1:T_ROB2:T_POS1",255,True,1,0,False,212];
    
    PERS wobjdata wobjCurrent:=[FALSE,FALSE,"STN1",[[0,0,0],[1,0,0,0]],[[0,0,380],[0.350074,-0.614368,-0.350074,-0.614368]]];
    PERS wobjdata wobjCurrent1:=[FALSE,FALSE,"STN1",[[0,0,0],[1,0,0,0]],[[0,0,1000],[0.353553,-0.612372,-0.353553,-0.612372]]];
    PERS wobjdata wobjCurrent2:=[FALSE,FALSE,"STN1",[[0,0,0],[1,0,0,0]],[[0,0,1000],[0.353553,-0.612372,-0.353553,-0.612372]]];

    PERS jointtarget jointOrigin3:=[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,0,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jointHome3:=[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,0,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jointCurrent3:=[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,-5.31201,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jointTransportation3:=[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,0,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS jointtarget jposSTN1Arm1Points{10}:=[[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[-90,0,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[-60,0,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[-30,0,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,0,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[30,0,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[60,0,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[90,0,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[120,0,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[150,0,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[180,0,9E+09,9E+09,9E+09,9E+09]]];
    TASK PERS jointtarget jposSTN1Plate1Points{10}:=[[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,0,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,36,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,72,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,108,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,144,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,180,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,216,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,252,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,288,9E+09,9E+09,9E+09,9E+09]],[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,324,9E+09,9E+09,9E+09,9E+09]]];

    PERS num numCalibARM1AngleStep:=30;
    PERS num numCalibPLATE1AngleStep:=36;

    PROC MoveSpecialPoint()
        ActUnit STN1;
        MoveExtJ jointHome3,v1000,fine;
        DeactUnit STN1;
        Stop;
        ActUnit STN1;
        MoveExtJ jointOrigin3,v1000,fine;
        DeactUnit STN1;
        Stop;
        ActUnit STN1;
        MoveExtJ jointTransportation3,v1000,fine;
        DeactUnit STN1;
        Stop;
        ActUnit STN1;
        MoveExtJ jointCurrent3,v1000,fine;
        DeactUnit STN1;
        Stop;
    ENDPROC

    PROC MovetoOrigin()
        ActUnit STN1;
        MoveExtJ jointOrigin3,speedAir,fine;
        DeactUnit STN1;
    ENDPROC

    !Rotate the first axis and move the robot's TCP to the reference point
    !default value of numCalibARM1AngleStep is 30
    PROC CalibARM1Center()
        FOR i FROM 1 TO Dim(jposSTN1Arm1Points,1) DO
            jposSTN1Arm1Points{i}.extax.eax_a:=(i-4)*numCalibARM1AngleStep;
            jposSTN1Arm1Points{i}.extax.eax_b:=0;
        ENDFOR
        Stop;
        ActUnit STN1;
        MoveExtJ jposSTN1Arm1Points{1},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 1";
        Stop;
        MoveExtJ jposSTN1Arm1Points{2},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 2";
        Stop;
        MoveExtJ jposSTN1Arm1Points{3},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 3";
        Stop;
        MoveExtJ jposSTN1Arm1Points{4},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 4";
        Stop;
        MoveExtJ jposSTN1Arm1Points{5},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 5";
        Stop;
        MoveExtJ jposSTN1Arm1Points{6},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 6";
        Stop;
        MoveExtJ jposSTN1Arm1Points{7},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 7";
        Stop;
        MoveExtJ jposSTN1Arm1Points{8},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 8";
        Stop;
        MoveExtJ jposSTN1Arm1Points{9},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 9";
        Stop;
        MoveExtJ jposSTN1Arm1Points{10},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 10";
        Stop;
        DeactUnit STN1;
    ENDPROC

    PROC CalibPlate1Center()
        FOR i FROM 1 TO Dim(jposSTN1Plate1Points,1) DO
            jposSTN1Plate1Points{i}.extax.eax_a:=0;
            jposSTN1Plate1Points{i}.extax.eax_b:=(i-1)*numCalibPLATE1AngleStep;
        ENDFOR
        ActUnit STN1;
        MoveExtJ jposSTN1Plate1Points{1},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 1";
        Stop;
        MoveExtJ jposSTN1Plate1Points{2},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 2";
        Stop;
        MoveExtJ jposSTN1Plate1Points{3},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 3";
        Stop;
        MoveExtJ jposSTN1Plate1Points{4},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 4";
        Stop;
        MoveExtJ jposSTN1Plate1Points{5},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 5";
        Stop;
        MoveExtJ jposSTN1Plate1Points{6},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 6";
        Stop;
        MoveExtJ jposSTN1Plate1Points{7},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 7";
        Stop;
        MoveExtJ jposSTN1Plate1Points{8},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 8";
        Stop;
        MoveExtJ jposSTN1Plate1Points{9},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 9";
        Stop;
        MoveExtJ jposSTN1Plate1Points{10},vrot100,fine;
        Logging\INFO, "MoveExtJ to point 10";
        Stop;
        DeactUnit STN1;
    ENDPROC
ENDMODULE
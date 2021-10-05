MODULE ServiceModule
    !*****************************************************
    !Module Name: ServiceModule
    !Version:     1.0
    !Description: -
    !Date:        2021-10-5
    !Author:      Michael
    !*****************************************************

    TASK PERS robtarget rtMechCleanApproach:=[[25.8652,-1461.27,1485.71],[7.75297E-06,-0.995107,0.0988043,-1.69901E-05],[1,-1,0,0],[4706.6,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtMechClean:=[[25.8652,-1461.27,1351.6],[7.34746E-06,-0.995108,0.0987951,-1.11486E-05],[1,-1,0,0],[4706.6,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtSprayApproach:=[[42.8052,-1324.43,1515.45],[1.07714E-05,-0.995108,0.0987966,-1.48665E-05],[1,-1,0,0],[4706.6,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtSpray:=[[42.8052,-1324.43,1395.31],[9.28678E-06,-0.995107,0.0988004,-1.56396E-05],[1,-1,0,0],[4706.6,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtCutApproach:=[[-52.4946,-1455.03,1444.25],[0.0158969,-0.999656,-0.0155172,0.0139433],[1,-1,0,0],[4706.6,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtCut:=[[-52.4946,-1455.03,1332.86],[0.0158935,-0.999656,-0.0155161,0.013941],[1,-1,0,0],[4706.6,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS jointtarget jointMechCleanApproach:=[[0,0,0,0,0,0],[0,0,0,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jointMechClean:=[[0,0,0,0,0,0],[0,0,0,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jointSprayApproach:=[[0,0,0,0,0,0],[0,0,0,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jointSpray:=[[0,0,0,0,0,0],[0,0,0,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jointCutApproach:=[[0,0,0,0,0,0],[0,0,0,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jointCut:=[[0,0,0,0,0,0],[0,0,0,9E+09,9E+09,9E+09]];

    TASK PERS num numTorchCleanTime:=3;
    TASK PERS num numTorchSprayime:=2;
    TASK PERS num numTorchCutTime:=1;

    PROC TorchServicesByMoveAbsJ()
        jointCurrent:=CJointT();

        !jointMechCleanApproach.extax:=jointCurrent.extax;
        !jointMechClean.extax:=jointCurrent.extax;
        !jointSprayApproach.extax:=jointCurrent.extax;
        !jointSpray.extax:=jointCurrent.extax;
        !jointCutApproach.extax:=jointCurrent.extax;
        !jointCut.extax:=jointCurrent.extax;

        jointMechCleanApproach.extax.eax_a:=jointCurrent.extax.eax_a;
        jointMechClean.extax.eax_a:=jointCurrent.extax.eax_a;
        jointSprayApproach.extax.eax_a:=jointCurrent.extax.eax_a;
        jointSpray.extax.eax_a:=jointCurrent.extax.eax_a;
        jointCutApproach.extax.eax_a:=jointCurrent.extax.eax_a;
        jointCut.extax.eax_a:=jointCurrent.extax.eax_a;

        MoveAbsJ jointMechCleanApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobj0;
        MoveAbsJ jointMechClean,speedAir,fine,toolWeldGun\WObj:=wobj0;
        SetDO doTS1_St,1;
        WaitTime numTorchCleanTime;
        SetDO doTS1_St,0;
        WaitTime numTorchCleanTime;
        MoveAbsJ jointMechCleanApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobj0;

        MoveAbsJ jointSprayApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobj0;
        MoveAbsJ jointSpray,speedAir,fine,toolWeldGun\WObj:=wobj0;
        SetDO doTS1_SpOn,1;
        WaitTime numTorchSprayime;
        SetDO doTS1_SpOn,0;
        MoveAbsJ jointSprayApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobj0;

        MoveAbsJ jointCutApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobj0;
        MoveAbsJ jointCut,speedAir,fine,toolWeldGun\WObj:=wobj0;
        SetDO doTS1_CutterSt,1;
        WaitTime numTorchCutTime;
        SetDO doTS1_CutterSt,0;
        MoveAbsJ jointCutApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobj0;

        Logging\INFO,"TorchServicesByMoveAbsJ has been done!";

    UNDO
        SetDO doTS1_St,0;
        SetDO doTS1_SpOn,0;
        SetDO doTS1_CutterSt,0;
    ENDPROC

    PROC TorchServices()
        jointCurrent:=CJointT();

        rtMechCleanApproach.trans.x:=rtMechCleanApproach.trans.x+rtMechCleanApproach.extax.eax_a-jointCurrent.extax.eax_a;
        rtMechClean.trans.x:=rtMechClean.trans.x+rtMechClean.extax.eax_a-jointCurrent.extax.eax_a;

        rtSprayApproach.trans.x:=rtSprayApproach.trans.x+rtSprayApproach.extax.eax_a-jointCurrent.extax.eax_a;
        rtSpray.trans.x:=rtSpray.trans.x+rtSpray.extax.eax_a-jointCurrent.extax.eax_a;

        rtCutApproach.trans.x:=rtCutApproach.trans.x+rtCutApproach.extax.eax_a-jointCurrent.extax.eax_a;
        rtCut.trans.x:=rtCut.trans.x+rtCut.extax.eax_a-jointCurrent.extax.eax_a;

        rtMechCleanApproach.extax.eax_a:=jointCurrent.extax.eax_a;
        rtMechClean.extax.eax_a:=jointCurrent.extax.eax_a;
        rtSprayApproach.extax.eax_a:=jointCurrent.extax.eax_a;
        rtSpray.extax.eax_a:=jointCurrent.extax.eax_a;
        rtCutApproach.extax.eax_a:=jointCurrent.extax.eax_a;
        rtCut.extax.eax_a:=jointCurrent.extax.eax_a;
        

        MoveJ rtMechCleanApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobj0;
        MoveMechCleanJ rtMechCleanApproach,rtMechClean,speedAproach,fine,toolWeldGun\WObj:=wobj0;
        MoveJ rtMechCleanApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobj0;

        MoveJ rtSprayApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobj0;
        MoveSprayJ rtSprayApproach,rtSpray,speedAproach,fine,toolWeldGun\WObj:=wobj0;
        MoveJ rtSprayApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobj0;

        MoveJ rtCutApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobj0;
        MoveWireCutJ rtCutApproach,rtCut,speedAproach,fine,toolWeldGun\WObj:=wobj0;
        MoveJ rtCutApproach,speedAir,zoneAir,toolWeldGun\WObj:=wobj0;

        Logging\INFO,"TorchServices has been done!";
    ENDPROC

ENDMODULE
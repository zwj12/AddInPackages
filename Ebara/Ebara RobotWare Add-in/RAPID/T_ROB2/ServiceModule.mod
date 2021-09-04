MODULE ServiceModule
    !*****************************************************
    !Module Name: ServiceModule
    !Version:     1.0
    !Description: -
    !Date:        2018-10-9
    !Author:      Michael
    !*****************************************************

    TASK PERS robtarget rtMechCleanApp:=[[2997.22,1592.75,1490.9],[0.00972123,0.999901,0.00927113,0.0040902],[-2,0,-1,0],[1762.01,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtMechClean:=[[2992.53,1588.26,1378.38],[0.00971668,0.999901,0.00927054,0.00408693],[-2,0,-1,0],[1762.01,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtSprayApp:=[[3016.22,1726.91,1496.34],[0.00528436,0.99992,0.00921553,0.00685714],[-2,0,-1,0],[1762.01,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtSpray:=[[3013.85,1727.59,1400.34],[0.00528374,0.99992,0.00921539,0.0068567],[-2,0,-1,0],[1762.01,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtCutApp:=[[2915.85,1596.51,1473.71],[0.00528539,0.99992,0.0092147,0.00685872],[-2,0,-1,0],[1762.01,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtCut:=[[2915.7,1598.42,1352.86],[0.00528881,0.99992,0.00921389,0.00687406],[-2,0,-1,0],[1762.01,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC TorchServices()
        VAR jointtarget jointHomeTemp:=[[0,0,0,0,0,0],[0,9E+09,9E+09,9E+09,9E+09,9E+09]];
        VAR jointtarget jointTemp;
        jointTemp:=CJointT();
        jointHomeTemp:=jointHome2;
        jointHomeTemp.extax.eax_a:=jointTemp.extax.eax_a;
        MoveAbsJ jointHomeTemp,speedAir,fine,toolWeldGun;

        rtMechCleanApp.trans.x:=rtMechCleanApp.trans.x+rtMechCleanApp.extax.eax_a-jointTemp.extax.eax_a;
        rtMechClean.trans.x:=rtMechClean.trans.x+rtMechClean.extax.eax_a-jointTemp.extax.eax_a;

        rtSprayApp.trans.x:=rtSprayApp.trans.x+rtSprayApp.extax.eax_a-jointTemp.extax.eax_a;
        rtSpray.trans.x:=rtSpray.trans.x+rtSpray.extax.eax_a-jointTemp.extax.eax_a;

        rtCutApp.trans.x:=rtCutApp.trans.x+rtCutApp.extax.eax_a-jointTemp.extax.eax_a;
        rtCut.trans.x:=rtCut.trans.x+rtCut.extax.eax_a-jointTemp.extax.eax_a;

        rtMechCleanApp.extax.eax_a:=jointTemp.extax.eax_a;
        rtSprayApp.extax.eax_a:=jointTemp.extax.eax_a;
        rtCutApp.extax.eax_a:=jointTemp.extax.eax_a;

        rtMechClean.extax.eax_a:=jointTemp.extax.eax_a;
        rtSpray.extax.eax_a:=jointTemp.extax.eax_a;
        rtCut.extax.eax_a:=jointTemp.extax.eax_a;

        rtMechClean.extax.eax_a:=jointTemp.extax.eax_a;
        rtMechClean.extax.eax_b:=jointTemp.extax.eax_b;
        rtSpray.extax.eax_a:=jointTemp.extax.eax_a;
        rtSpray.extax.eax_b:=jointTemp.extax.eax_b;
        rtCut.extax.eax_a:=jointTemp.extax.eax_a;
        rtCut.extax.eax_b:=jointTemp.extax.eax_b;

        !MoveJ rtSprayApp,speedAir,zoneAir,toolWeldGun;

        MoveMechCleanJ rtMechCleanApp,rtMechClean,v200,fine,toolWeldGun;
        !MoveJ rtMechCleanApp,speedAir,zoneAir,toolWeldGun;
        !MoveL rtMechClean,speedAir,zoneAir,toolWeldGun;
        !WaitTime 3;
        !MoveL rtMechCleanApp,speedAir,zoneAir,toolWeldGun;

        MoveSprayJ rtSprayApp,rtSpray,v200,fine,toolWeldGun;
        
        !MoveJ rtCutApp,speedAir,zoneAir,toolWeldGun;
        !MoveL rtCut,speedAir,zoneAir,toolWeldGun;
        !MoveL rtCutApp,speedAir,zoneAir,toolWeldGun;
        
        MoveWireCutJ rtCutApp,rtCut,v200,fine,toolWeldGun;

        !MoveJ rtSprayApp,speedAir,zoneAir,toolWeldGun;

        Logging\INFO, "TorchServices has been done!";

        MoveAbsJ jointHomeTemp,speedAir,fine,toolWeldGun;
    ENDPROC

ENDMODULE
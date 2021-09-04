MODULE ServiceModule
    !*****************************************************
    !Module Name: ServiceModule
    !Version:     1.0
    !Description: -
    !Date:        2018-10-9
    !Author:      Michael
    !*****************************************************

    TASK PERS robtarget rtMechCleanApp:=[[2994.43,-1465.09,1434.8],[0.0227223,0.994787,-0.0987535,-0.0114124],[1,-1,0,0],[1762,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtMechClean:=[[2994.43,-1465.09,1360.05],[0.022723,0.994787,-0.0987531,-0.0114145],[1,-1,0,0],[1762,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtSprayApp:=[[3015.18,-1322.99,1525.14],[0.0254356,0.845358,-0.533594,-3.40957E-05],[1,-1,0,0],[1762,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtSpray:=[[3012.17,-1325.2,1378.52],[0.0254381,0.845357,-0.533595,-3.64533E-05],[1,-1,1,0],[1762,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtCutApp:=[[2917.22,-1455.92,1431.99],[0.0158819,-0.999656,-0.0155166,0.0139542],[1,-1,0,0],[1762,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget rtCut:=[[2917.83,-1454.25,1331.95],[0.0158808,-0.999656,-0.0155165,0.0139551],[1,-1,0,0],[1762,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC TorchServices()
        VAR jointtarget jointHomeTemp:=[[0,0,0,0,0,0],[0,9E+09,9E+09,9E+09,9E+09,9E+09]];
        VAR jointtarget jointTemp;
        jointTemp:=CJointT();
        jointHomeTemp:=jointHome1;
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
        
        MoveJ rtSprayApp, speedAir, zoneAir, toolWeldGun;
        MoveL rtMechCleanApp, v200, zoneAir, toolWeldGun;
        MoveL rtMechClean, v200, zoneAir, toolWeldGun;
        WaitTime 3;
        MoveL rtMechCleanApp, v200, zoneAir, toolWeldGun;

        !MoveMechCleanJ rtMechCleanApp,rtMechClean,v200,fine,toolWeldGun;
        MoveSprayJ rtSprayApp,rtSpray,v200,fine,toolWeldGun;
        MoveJ rtCutApp, v200, zoneAir, toolWeldGun;
        MoveL rtCut, v200, zoneAir, toolWeldGun;
        WaitTime 3;
        MoveL rtCutApp, v200, zoneAir, toolWeldGun;
        !MoveWireCutJ rtCutApp,rtCut,v200,fine,toolWeldGun;
        
        MoveJ rtSprayApp, speedAir, zoneAir, toolWeldGun;

        Logging\INFO, "TorchServices has been done!";

        MoveAbsJ jointHomeTemp,speedAir,fine,toolWeldGun;
    ENDPROC
    
ENDMODULE
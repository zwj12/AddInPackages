MODULE MainModule
    !*****************************************************
    !Module Name:   MainModule
    !Version:       1.0
    !Description:   
    !Date:          2021-3-25
    !Author:        Michael
    !*****************************************************

    PROC main()
        speedAir:=v200;
        speedAproach:=v200;
        numGantryCollisionDistance:=2000;
        SaveModule;
        !InhibWeld FALSE\Weld\Weave\Track;
        IF OpMode()=OP_AUTO THEN
            !Switch Job mode to PLC mode when the robot is at Auto Mode
            numJobMode:=3;
        ENDIF
        ExecEngine;
    ENDPROC

ENDMODULE
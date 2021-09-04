MODULE WorldZoneModule
    !*****************************************************
    !Module Name: WorldZoneModule
    !Version:     1.0
    !Description: -
    !Date:        2018-8-30
    !Author:      Michael
    !*****************************************************

    VAR wztemporary wztemporaryHome1;
    VAR wzstationary wzstationaryHome1;

    TASK PERS jointtarget jointHomeDelta1:=[[10,10,10,10,10,10],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC WorldZoneInit()
        VAR shapedata shapeJoint1;
        VAR jointtarget jointHomeTemp;
        jointHomeTemp:=jointHome1;
        jointHomeTemp.extax.eax_a:=9E+09;
        WZFree wztemporaryHome1;
        WZHomeJointDef\Inside,shapeJoint1,jointHomeTemp,jointHomeDelta1;
        WZDOSet\Temp,wztemporaryHome1\Inside,shapeJoint1,soAtSafeR1_1,1;
        TPWrite "WorldZone is set";
    ENDPROC

    PROC WorldZonePowerOn()
        VAR shapedata shapeJointHome1;
        VAR shapedata shapeLeftCarvedPrinter1;
        VAR jointtarget jointHomeTemp;

        !Set WorldZone of home position
        jointHomeTemp:=jointHome1;
        jointHomeTemp.extax.eax_a:=9E+09;
        WZHomeJointDef\Inside,shapeJointHome1,jointHomeTemp,jointHomeDelta1;
        WZDOSet\Stat,wzstationaryHome1\Inside,shapeJointHome1,soAtSafeR1_1,1;

        bSafeMutex:=FALSE;
        IF RobOS() THEN
            SetDO doVirtualController,0;
        ELSE
            SetDO doVirtualController,1;
        ENDIF
    ENDPROC

ENDMODULE
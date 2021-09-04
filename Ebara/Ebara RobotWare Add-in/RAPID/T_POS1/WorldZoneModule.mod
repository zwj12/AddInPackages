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

    TASK PERS jointtarget jointHomeDelta1:=[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[10,10,9E+09,9E+09,9E+09,9E+09]];

    PROC WorldZoneInit()
        VAR shapedata shapeJoint1;
        VAR jointtarget jointHomeTemp;
        jointHomeTemp:=jointHome3;
        WZFree wztemporaryHome1;
        WZHomeJointDef\Inside,shapeJoint1,jointHomeTemp,jointHomeDelta1;
        !WZDOSet\Temp,wztemporaryHome1\Inside,shapeJoint1,soAtSafeP1_1,1;
        TPWrite "WorldZone is set";
    ENDPROC

    PROC WorldZonePowerOn()
        VAR shapedata shapeJointHome1;
        VAR shapedata shapeLeftCarvedPrinter1;
        VAR jointtarget jointHomeTemp;

        !Set WorldZone of home position
        jointHomeTemp:=jointHome3;
        !WZHomeJointDef\Inside,shapeJointHome1,jointHomeTemp,jointHomeDelta1;
        !WZDOSet\Stat,wzstationaryHome1\Inside,shapeJointHome1,soAtSafeP1_1,1;
    ENDPROC

ENDMODULE
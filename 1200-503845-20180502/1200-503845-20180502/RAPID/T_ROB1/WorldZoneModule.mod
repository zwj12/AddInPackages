MODULE WorldZoneModule
    !*****************************************************
    !Module Name: WorldZoneModule
    !Version:     1.0
    !Description: -
    !Date:        2018-4-20
    !Author:      Michael
    !*****************************************************

    VAR wztemporary wztemporaryHome1;
    VAR wzstationary wzstationaryHome1;

    TASK PERS jointtarget jointHomeDelta1:=[[10,10,10,10,10,10],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC WorldZoneInit()
        VAR shapedata shapeJoint1;
        VAR jointtarget jointHomeTemp;
        jointHomeTemp:=jointHome;
        jointHomeTemp.extax.eax_a:=9E+09;
        WZFree wztemporaryHome1;
        WZHomeJointDef\Inside,shapeJoint1,jointHomeTemp,jointHomeDelta1;
        WZDOSet\Temp,wztemporaryHome1\Inside,shapeJoint1,doRobotAtHomePosition,1;
        TPWrite "WorldZone is set";
    ENDPROC

    PROC WorldZonePowerOn()
        VAR shapedata shapeJointHome1;
        VAR shapedata shapeLeftCarvedPrinter1;
        VAR jointtarget jointHomeTemp;

        !Set WorldZone of home position
        jointHomeTemp:=jointHome;
        jointHomeTemp.extax.eax_a:=9E+09;
        jointHomeTemp.extax.eax_b:=9E+09;
        jointHomeTemp.extax.eax_c:=9E+09;
        jointHomeTemp.extax.eax_d:=9E+09;
        jointHomeTemp.extax.eax_e:=9E+09;
        jointHomeTemp.extax.eax_f:=9E+09;
        WZHomeJointDef\Inside,shapeJointHome1,jointHomeTemp,jointHomeDelta1;
        WZDOSet\Stat,wzstationaryHome1\Inside,shapeJointHome1,doRobotAtHomePosition,1;

    ENDPROC

ENDMODULE
MODULE TaskModule
    !*****************************************************
    !Module Name: TaskModule
    !Version:     1.0
    !Description: This module stroes ths data which are not shared among other tasks
    !Date:        2021-1-6
    !Author:      Michael
    !*****************************************************

    !2021-8-11, Michael, Add extjointGantryReadyOffset, extjointGantryDepart
    !2021-8-20, Michael, Add iodevSysDataLog

    !TASK PERS extjoint extGantryHome:=[0,0,-500,9E+09,9E+09,9E+09];
    TASK PERS extjoint extGantryTranslation:=[0,0,220,9E+9,9E+9,9E+9];
    TASK PERS extjoint extjointGantryOffset:=[800,500,-1200,9E+9,9E+9,9E+9];

    TASK PERS extjoint extjointGantryDepart:=[500,100,-500,9E+9,9E+9,9E+9];

    TASK PERS pose posePathDisplacementCurrentList{32}:=[[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]]];
    TASK PERS pos posTargetCurrentList{32}:=[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]];
    TASK PERS extjoint extGantryOffsetCurrent:=[-2000,-450,-60,9E+09,9E+09,9E+09];

    TASK PERS seamdata seamCurrent:=[0.5,0.5,[0,0,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0];
    TASK PERS welddata weldCurrent:=[6,0,[38,0,-1,0,0,350,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveCurrent:=[1,0,4,6,0,0,0,0,0,0,0,0,0,0,0];
    TASK PERS trackdata trackCurrent:=[0,TRUE,50,[0,30,30,0,0,0,0,0,0],[0,0,0,0,0,0,0]];

    VAR iodev iodevSysDataLog;
    CONST string strSysDataLogFileName:="SysData.csv";
    TASK PERS bool boolInitSysDataLogFile:=FALSE;

    PERS string strTemplateList{40}:=["10014","10023","20014","20023","30014","30023","40014","40023","50014","50023","60014","60023","70014","70023","80014","80023","90014","90023","100014","100023","510001","","","","","","","","","","","","","","","","","","",""];

    PERS jointtarget jointReadyQuadrant1:=[[60,-75,-15,0,90,-90],[800,500,-440,9E+09,9E+09,9E+09]];
    PERS jointtarget jointReadyQuadrant2:=[[-60,-75,-15,0,90,90],[-800,500,-440,9E+09,9E+09,9E+09]];
    PERS jointtarget jointReadyQuadrant3:=[[-120,-75,-15,0,90,-90],[-800,-500,-440,9E+09,9E+09,9E+09]];
    PERS jointtarget jointReadyQuadrant4:=[[120,-75,-15,0,90,90],[800,-500,-440,9E+09,9E+09,9E+09]];

    PERS bool boolDebugMode:=FALSE;
    PERS bool boolEnableGantryOffset:=TRUE;
    PERS bool boolEnableSearch:=TRUE;
    PERS bool boolDebugSearch:=TRUE;
    PERS bool boolEnableDisp:=TRUE;
    PERS num numWaitTimeForLaser:=0;
    PERS num numAproachRelToolZ:=-50;


ENDMODULE
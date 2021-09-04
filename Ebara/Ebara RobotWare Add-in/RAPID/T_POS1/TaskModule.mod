MODULE TaskModule
    !*****************************************************
    !Module Name: TaskModule
    !Version:     1.0
    !Description: This module stroes ths data which are not shared among other tasks
    !Date:        2018-8-10
    !Author:      Michael
    !*****************************************************

    VAR num numStation:=1;
    VAR partdata pdTmpChk;
    VAR string sPartDataName;

    VAR syncident SyncPositionerHomed;
    VAR syncident SyncWobjScanning;
    VAR syncident SyncWobjBranchScaning;
    VAR syncident SyncWobjBranchScaned;
    VAR syncident SyncWobjHeaderScaning;
    VAR syncident SyncWobjHeaderScaned;
    VAR syncident SyncWobjBranchScaningV2;
    VAR syncident SyncWobjBranchScanedV2;
    VAR syncident SyncWobjHeaderScaningV2;
    VAR syncident SyncWobjHeaderScanedV2;
    VAR syncident SyncWobjScaned;
    VAR syncident SyncWobjRevised;

    VAR syncident SyncPositionerWeldApproached;
    VAR syncident SyncRobotsWeldApproached;
    VAR syncident SyncAllRobotsWeldStart;
    VAR syncident SyncAllRobotsWeldEnd;
    VAR syncident SyncRobotsWeldDeparted;

    VAR syncident SyncMoveLSubstituted1;
    VAR syncident SyncMoveLSubstituted2;

    VAR syncident SyncRobotsForTest11;
    VAR syncident SyncRobotsForTest12;
    VAR syncident SyncRobotsForTest13;

    VAR syncident SyncRobotsForTest21;
    VAR syncident SyncRobotsForTest22;
    VAR syncident SyncRobotsForTest23;
    VAR syncident SyncRobotsForTest24;
    VAR syncident SyncRobotsForTest25;
    VAR syncident SyncRobotsForTest26;

    VAR string strCurTaskName:="T_ROB3";
    VAR num numCurTaskNo:=3;
    VAR num numRobLayerCurTotal;
    VAR RECORDWeldTarget rRobLayerCur{30};

    TASK PERS tooldata toolWeldGun:=[TRUE,[[44.025,0,363.649],[0.981627183,0,0.190808995,0]],[1,[0,0,1],[1,0,0,0],0,0,0]];
    TASK PERS extjoint extjointValue:=[5350,9E+9,9E+9,9E+9,9E+9,9E+9];

    TASK PERS robtarget robtNext:=[[41.7664,41.7664,159.546],[0.406435,0.329174,-0.84302,0.125591],[0,0,0,0],[5350,9E+9,9E+9,9E+9,9E+9,9E+9]];
    TASK PERS robtarget robtCircleEnd:=[[29.6649,51.3691,156.772],[0.404301,0.430611,-0.784636,0.188311],[0,0,0,0],[5350,9E+9,9E+9,9E+9,9E+9,9E+9]];

    TASK PERS seamdata seamNext:=[3,2,[0,0,0,100,0,0,0,0,0],0,0,5,0,0,[0,0,1,140,0,0,0,0,0],0,1.5,[0,0,1,90,0,0,0,0,0],0.04,0,[0,0,0,0,0,0,0,0,0],0.5];
    TASK PERS welddata weldNext:=[5,0,[22,0,1,140,0,245,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata weaveNext:=[1,0,2.5,3,0,0,0,0,0,0,0,0,0,0,0];
    TASK PERS trackdata trackNext:=[0,TRUE,50,[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0]];
    TASK PERS adaptdata adaptNext:=[2,1,0,0,0.1,100,0.1,100];
    TASK PERS num numWeaveWidth90:=0;
    TASK PERS num numGrooveWidthNext:=0;

    TASK PERS jointtarget jointNext:=[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,30,9E+09,9E+09,9E+09,9E+09]];

    CONST string strWeldProcedureLogLogFileName:="WeldProcedureLog1.csv";

ENDMODULE
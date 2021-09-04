MODULE REHMProcessControlModule
    LOCAL PERS string strDeviceName:="ioREHM1";
    LOCAL CONST num WeldingStart:=1;
    LOCAL CONST num GasTest:=2;
    LOCAL CONST num WireThreadingInch:=4;
    LOCAL CONST num WireRetract:=5;
    LOCAL CONST num WireSensingTouch:=7;
    LOCAL CONST num WeldingSimulation:=9;

    LOCAL CONST num PulseTime:=0.05;

    VAR intnum intWeldingStart;
    VAR intnum intFeedForward;
    VAR intnum intFeedRetract;
    VAR intnum intGasTest;
    VAR intnum intWireSensingTouch;
    VAR intnum intWeldingSimulation;

    VAR intnum intMode;
    VAR intnum intJobNum;

    VAR intnum intCurrent;
    VAR intnum intMaterialThickness;
    VAR intnum intWireSpeed;
    VAR intnum intArcLength;
    VAR intnum intPulseDymanikCorrection;

    !1-JobMode, 2-Current+ArcLength+Correction, 3-WireSpeed, 4-MaterialThickness
    !For now, only mode 1 and mode 2 are supported.
    PERS num numMode:=1;

    PROC InitREHM()
        Logging\DEBUG,"Init REHM Welder...";
        IDelete intWeldingStart;
        IDelete intFeedForward;
        IDelete intFeedRetract;
        IDelete intGasTest;
        IDelete intWireSensingTouch;
        IDelete intWeldingSimulation;
        IDelete intMode;
        IDelete intJobNum;
        IDelete intCurrent;
        IDelete intArcLength;
        IDelete intPulseDymanikCorrection;
        IDelete intWireSpeed;
        IDelete intMaterialThickness;

        CONNECT intWeldingStart WITH TRAPWeldingStart;
        CONNECT intFeedForward WITH TRAPFeedForward;
        CONNECT intFeedRetract WITH TRAPFeedRetract;
        CONNECT intGasTest WITH TRAPGasTest;
        CONNECT intWireSensingTouch WITH TRAPWireSensingTouch;
        CONNECT intWeldingSimulation WITH TRAPWeldingSimulation;
        CONNECT intMode WITH TRAPSwitchMode;
        CONNECT intJobNum WITH TRAPLoadJob;

        CONNECT intCurrent WITH TRAPCurrent;
        CONNECT intArcLength WITH TRAPArcLength;
        CONNECT intPulseDymanikCorrection WITH TRAPPulseDymanikCorrection;

        CONNECT intWireSpeed WITH TRAPWireSpeed;

        CONNECT intMaterialThickness WITH TRAPMaterialThickness;

        ISignalDO sdoArc1ArcOn,2,intWeldingStart;
        ISignalDO sdoArc1FeedForward,2,intFeedForward;
        ISignalDO sdoArc1FeedRetract,2,intFeedRetract;
        ISignalDO sdoArc1GasOn,2,intGasTest;
        ISignalDO sdoArc1TouchSense,2,intWireSensingTouch;
        ISignalDO sdoArc1Simulation,2,intWeldingSimulation;
        IPers numMode,intMode;

        TEST numMode
        CASE 1:
            ISignalGO sgoArc1JobNum,intJobNum;
        CASE 2:
            ISignalAO saoArc1Current,AIO_BETWEEN,999,0,1,intCurrent;
            ISignalAO saoArc1ArcLength,AIO_BETWEEN,9.9,-9.9,0.1,intArcLength;
            ISignalAO saoPulseDymanikCorrection,AIO_BETWEEN,5,-5,0.1,intPulseDymanikCorrection;
        CASE 3:
            ISignalAO saoWireSpeed,AIO_BETWEEN,999,-999,0.1,intWireSpeed;
            ISignalAO saoArc1ArcLength,AIO_BETWEEN,9.9,-9.9,0.1,intArcLength;
            ISignalAO saoPulseDymanikCorrection,AIO_BETWEEN,5,-5,0.1,intPulseDymanikCorrection;
        CASE 4:
            ISignalAO saoMaterialThickness,AIO_BETWEEN,400,0,0.1,intMaterialThickness;
            ISignalAO saoArc1ArcLength,AIO_BETWEEN,9.9,-9.9,0.1,intArcLength;
            ISignalAO saoPulseDymanikCorrection,AIO_BETWEEN,5,-5,0.1,intPulseDymanikCorrection;
        DEFAULT:
            ISignalGO sgoArc1JobNum,intJobNum;
            ISignalAO saoArc1Current,AIO_BETWEEN,999,0,1,intCurrent;
            ISignalAO saoArc1ArcLength,AIO_BETWEEN,9.9,-9.9,0.1,intArcLength;
            ISignalAO saoPulseDymanikCorrection,AIO_BETWEEN,5,-5,0.1,intPulseDymanikCorrection;
            ISignalAO saoWireSpeed,AIO_BETWEEN,999,-999,0.1,intWireSpeed;
            ISignalAO saoMaterialThickness,AIO_BETWEEN,400,0,0.1,intMaterialThickness;
        ENDTEST

    ENDPROC

    TRAP TRAPSwitchMode
        VAR num nAnswer;
        IF boolDebug THEN
            Logging\DEBUG,"TRAPSwitchMode...";
        ENDIF
        TEST numMode
        CASE 1:
            WriteCfgData "/PROC/ARC_EQUIP_IO_GO/stdIO_T_ROB1","SchedulePort","sgoArc1JobNum";
            WriteCfgData "/PROC/ARC_EQUIP_IO_AO/stdIO_T_ROB1","CurrentReference","";
            WriteCfgData "/PROC/ARC_EQUIP_IO_AO/stdIO_T_ROB1","VoltReference","";
            WriteCfgData "/PROC/ARC_EQUIP_IO_AO/stdIO_T_ROB1","ControlPort","";
        CASE 2:
            WriteCfgData "/PROC/ARC_EQUIP_IO_GO/stdIO_T_ROB1","SchedulePort","";
            WriteCfgData "/PROC/ARC_EQUIP_IO_AO/stdIO_T_ROB1","CurrentReference","saoArc1Current";
            WriteCfgData "/PROC/ARC_EQUIP_IO_AO/stdIO_T_ROB1","VoltReference","saoArc1ArcLength";
            WriteCfgData "/PROC/ARC_EQUIP_IO_AO/stdIO_T_ROB1","ControlPort","saoPulseDymanikCorrection";
        CASE 3:
        CASE 4:
        DEFAULT:
            WriteCfgData "/PROC/ARC_EQUIP_IO_GO/stdIO_T_ROB1","SchedulePort","sgoArc1JobNum";
            WriteCfgData "/PROC/ARC_EQUIP_IO_AO/stdIO_T_ROB1","CurrentReference","saoArc1Current";
            WriteCfgData "/PROC/ARC_EQUIP_IO_AO/stdIO_T_ROB1","VoltReference","saoArc1ArcLength";
            WriteCfgData "/PROC/ARC_EQUIP_IO_AO/stdIO_T_ROB1","ControlPort","saoPulseDymanikCorrection";
        ENDTEST
        UIMsgBox\Header:="Restart","The changes will not take effect until the controller is restarted."\MsgLine3:="Do you want to restart now?"\Buttons:=btnYesNo\Icon:=iconWarning\Result:=nAnswer;
        IF (nAnswer=resYes) THEN
            Logging\WARNING,"Warm start the system to enable mode: "+ValToStr(numMode);
            WarmStart;
        ENDIF
    ENDTRAP

    TRAP TRAPFeedForward
        IF boolDebug THEN
            Logging\DEBUG,"TRAPFeedForward...";
        ENDIF
        IF IOUnitState(strDeviceName\Phys)<>IOUNIT_PHYS_STATE_RUNNING THEN
            RETURN ;
        ENDIF
        SetGO goREHM1FunctionRequest,WireThreadingInch;
        IF sdoArc1FeedForward=1 THEN
            SetDO doREHM1FRActivate,1;
        ELSE
            SetDO doREHM1FRActivate,0;
        ENDIF
        IF boolDebug THEN
            Logging\DEBUG,"TRAPFeedForward:"+ValToStr(GOutputDnum(goREHM1FunctionRequest))+", "+ValToStr(DOutput(doREHM1FRActivate));
        ENDIF
    ENDTRAP

    TRAP TRAPFeedRetract
        IF boolDebug THEN
            Logging\DEBUG,"TRAPFeedRetract...";
        ENDIF
        IF IOUnitState(strDeviceName\Phys)<>IOUNIT_PHYS_STATE_RUNNING THEN
            RETURN ;
        ENDIF
        SetGO goREHM1FunctionRequest,WireRetract;
        IF sdoArc1FeedRetract=1 THEN
            SetDO doREHM1FRActivate,1;
        ELSE
            SetDO doREHM1FRActivate,0;
        ENDIF
        IF boolDebug THEN
            Logging\DEBUG,"TRAPFeedRetract:"+ValToStr(GOutputDnum(goREHM1FunctionRequest))+", "+ValToStr(DOutput(doREHM1FRActivate));
        ENDIF
    ENDTRAP

    PROC GasTestPulse()
        SetGO goREHM1FunctionRequest,GasTest;
        SetDO doREHM1FRActivate,1;
        WaitTime PulseTime;
        SetDO doREHM1FRActivate,0;
    ENDPROC

    FUNC bool CheckGasStatus()
        IF diREHM1GasTest=1 AND diREHM1GasValveOn=1 THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        ENDIF
    ENDFUNC

    TRAP TRAPGasTest
        IF boolDebug THEN
            Logging\DEBUG,"TRAPGasTest...";
        ENDIF
        IF IOUnitState(strDeviceName\Phys)<>IOUNIT_PHYS_STATE_RUNNING THEN
            RETURN ;
        ENDIF
        IF sdoArc1GasOn=1 THEN
            IF CheckGasStatus()=FALSE THEN
                GasTestPulse;
            ENDIF
        ELSE
            IF CheckGasStatus()=TRUE THEN
                GasTestPulse;
            ENDIF
        ENDIF
        IF boolDebug THEN
            Logging\DEBUG,"TRAPGasTest:"+ValToStr(GOutputDnum(goREHM1FunctionRequest))+", "+ValToStr(DOutput(doREHM1FRActivate));
        ENDIF
    ENDTRAP

    TRAP TRAPWeldingStart
        IF boolDebug THEN
            Logging\DEBUG,"TRAPWeldingStart...";
        ENDIF
        IF IOUnitState(strDeviceName\Phys)<>IOUNIT_PHYS_STATE_RUNNING THEN
            RETURN ;
        ENDIF
        SetGO goREHM1FunctionRequest,WeldingStart;
        IF sdoArc1ArcOn=1 THEN
            SetDO doREHM1FRActivate,1;
        ELSE
            SetDO doREHM1FRActivate,0;
        ENDIF
        IF boolDebug THEN
            Logging\DEBUG,"TRAPWeldingStart:"+ValToStr(GOutputDnum(goREHM1FunctionRequest))+", "+ValToStr(DOutput(doREHM1FRActivate));
        ENDIF
    ENDTRAP

    TRAP TRAPWireSensingTouch
        IF boolDebug THEN
            Logging\DEBUG,"TRAPWireSensingTouch...";
        ENDIF
        IF IOUnitState(strDeviceName\Phys)<>IOUNIT_PHYS_STATE_RUNNING THEN
            RETURN ;
        ENDIF
        SetGO goREHM1FunctionRequest,WireSensingTouch;
        IF sdoArc1TouchSense=1 THEN
            SetDO doREHM1FRActivate,1;
        ELSE
            SetDO doREHM1FRActivate,0;
        ENDIF
        IF boolDebug THEN
            Logging\DEBUG,"TRAPWireSensingTouch:"+ValToStr(GOutputDnum(goREHM1FunctionRequest))+", "+ValToStr(DOutput(doREHM1FRActivate));
        ENDIF
    ENDTRAP

    TRAP TRAPWeldingSimulation
        IF boolDebug THEN
            Logging\DEBUG,"TRAPWeldingSimulation...";
        ENDIF
        IF IOUnitState(strDeviceName\Phys)<>IOUNIT_PHYS_STATE_RUNNING THEN
            RETURN ;
        ENDIF
        SetGO goREHM1FunctionRequest,WeldingSimulation;
        IF sdoArc1ArcOn=1 THEN
            SetDO doREHM1FRActivate,1;
        ELSE
            SetDO doREHM1FRActivate,0;
        ENDIF
        IF boolDebug THEN
            Logging\DEBUG,"TRAPWeldingSimulation:"+ValToStr(GOutputDnum(goREHM1FunctionRequest))+", "+ValToStr(DOutput(doREHM1FRActivate));
        ENDIF
    ENDTRAP

    TRAP TRAPLoadJob
        IF boolDebug THEN
            Logging\DEBUG,"TRAPLoadJob...";
        ENDIF
        IF IOUnitState(strDeviceName\Phys)<>IOUNIT_PHYS_STATE_RUNNING THEN
            RETURN ;
        ENDIF
        SetGO goREHM1ActionRequest,0X140861;
        SetGO goREHM1JobNum,sgoArc1JobNum;
        IF boolDebug THEN
            Logging\DEBUG,"TRAPLoadJob:"+ValToStr(GOutputDnum(goREHM1ActionRequest))+", "+ValToStr(GOutputDnum(goREHM1JobNum));
        ENDIF
    ENDTRAP

    TRAP TRAPCurrent
        IF boolDebug THEN
            Logging\DEBUG,"TRAPCurrent...";
        ENDIF
        IF IOUnitState(strDeviceName\Phys)<>IOUNIT_PHYS_STATE_RUNNING THEN
            RETURN ;
        ENDIF
        SetGO goREHM1ChangeMIGMAGPrefix,0X20069;
        SetAO aoREHM1ChangeMIGMAGSetpoints,Round(saoArc1Current);
        WaitTime PulseTime;
        IF boolDebug THEN
            Logging\DEBUG,"TRAPCurrent:"+ValToStr(GOutputDnum(goREHM1ChangeMIGMAGPrefix))+", "+ValToStr(AOutput(aoREHM1ChangeMIGMAGSetpoints));
        ENDIF
    ENDTRAP

    TRAP TRAPArcLength
        IF boolDebug THEN
            Logging\DEBUG,"TRAPArcLength...";
        ENDIF
        IF IOUnitState(strDeviceName\Phys)<>IOUNIT_PHYS_STATE_RUNNING THEN
            RETURN ;
        ENDIF
        SetGO goREHM1ChangeMIGMAGPrefix,0XA0069;
        SetAO aoREHM1ChangeMIGMAGSetpoints,Round(saoArc1ArcLength*10);
        WaitTime PulseTime;
        IF boolDebug THEN
            Logging\DEBUG,"TRAPArcLength:"+ValToStr(GOutputDnum(goREHM1ChangeMIGMAGPrefix))+", "+ValToStr(AOutput(aoREHM1ChangeMIGMAGSetpoints));
        ENDIF
    ENDTRAP

    TRAP TRAPMaterialThickness
        VAR string strTemp;
        IF boolDebug THEN
            Logging\DEBUG,"TRAPMaterialThickness...";
        ENDIF
        IF IOUnitState(strDeviceName\Phys)<>IOUNIT_PHYS_STATE_RUNNING THEN
            RETURN ;
        ENDIF
        SetGO goREHM1ChangeMIGMAGPrefix,0X40069;
        SetAO aoREHM1ChangeMIGMAGSetpoints,Round(saoMaterialThickness*10);
        WaitTime PulseTime;
        IF boolDebug THEN
            Logging\DEBUG,"TRAPMaterialThickness:"+ValToStr(GOutputDnum(goREHM1ChangeMIGMAGPrefix))+", "+ValToStr(AOutput(aoREHM1ChangeMIGMAGSetpoints));
        ENDIF
    ENDTRAP

    TRAP TRAPWireSpeed
        IF boolDebug THEN
            Logging\DEBUG,"TRAPWireSpeed...";
        ENDIF
        IF IOUnitState(strDeviceName\Phys)<>IOUNIT_PHYS_STATE_RUNNING THEN
            RETURN ;
        ENDIF
        SetGO goREHM1ChangeMIGMAGPrefix,0X30069;
        SetAO aoREHM1ChangeMIGMAGSetpoints,Round(saoWireSpeed*100);
        WaitTime PulseTime;
        IF boolDebug THEN
            Logging\DEBUG,"TRAPWireSpeed:"+ValToStr(GOutputDnum(goREHM1ChangeMIGMAGPrefix))+", "+ValToStr(AOutput(aoREHM1ChangeMIGMAGSetpoints));
        ENDIF
    ENDTRAP

    TRAP TRAPPulseDymanikCorrection
        IF boolDebug THEN
            Logging\DEBUG,"TRAPPulseDymanikCorrection...";
        ENDIF
        IF IOUnitState(strDeviceName\Phys)<>IOUNIT_PHYS_STATE_RUNNING THEN
            RETURN ;
        ENDIF
        SetGO goREHM1ChangeMIGMAGPrefix,0XB0069;
        SetAO aoREHM1ChangeMIGMAGSetpoints,Round(saoPulseDymanikCorrection*10);
        WaitTime PulseTime;
        IF boolDebug THEN
            Logging\DEBUG,"TRAPPulseDymanikCorrection:"+ValToStr(GOutputDnum(goREHM1ChangeMIGMAGPrefix))+", "+ValToStr(AOutput(aoREHM1ChangeMIGMAGSetpoints));
        ENDIF
    ENDTRAP

ENDMODULE
MODULE CalibDataModule
    PERS tooldata toolWeldGun:=[TRUE,[[-58.4751,28.4198,512.957],[0.94816,0.049366,0.184396,-0.254073]],[3,[0,0,1],[1,0,0,0],0,0,0]];
    PERS tooldata tool1:=[TRUE,[[42.5885,-24.7621,376.857],[0.887189,0.111393,0.426214,-0.137218]],[1.4,[24.4,0,143.2],[1,0,0,0],0,0,0]];
    PERS tooldata tool2:=[TRUE,[[-62.8103,22.8888,454.522],[1,0,0,0]],[2,[0,0,0],[1,0,0,0],0,0,0]];

    ! postions for tool definition of weld gun
    PERS jointtarget jtWeldGun1:=[[-24.6945,20.8801,3.51235,42.8037,80.6113,9.63012],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtWeldGun2:=[[-2.61628,-10.6739,38.7227,2.37009,23.8979,14.2085],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtWeldGun3:=[[15.9163,14.3989,5.55419,-34.7948,72.665,18.1962],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtWeldGun4:=[[-1.72054,-0.572209,20.49,0.862472,48.1158,27.8293],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtWeldGunZ:=[[-1.72046,-1.48671,13.4232,0.773378,56.0927,27.9777],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtWeldGunX:=[[-1.57965,5.36821,14.2944,0.787672,48.3715,28.0069],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS menudata md_DefineWeldGun:=["Define TCP of Weld Gun","","DefTCPofWeldGun",1,"",255,True,1,0,False,101];

    PERS jointtarget jointOrigin:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jointCurrent:=[[-0.0018897,-8.00527E-05,0.000263918,0.000224577,50.0002,-0.000150301],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jointTransportation:=[[0,0,0,0,0,0],[4838,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jointHome:=[[0,0,0,0,68,30],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC DefTCPofWeldGun()
        VAR num nMaxErr;
        VAR num nMeanErr;
        VAR num nUserInputFP:=0;
        VAR string sHeader;
        VAR string sMsg{5};
        VAR btnres nAnswer;
        VAR robtarget pTCP;
        VAR robtarget robtarWeldGun1;
        VAR robtarget robtarWeldGun2;
        VAR robtarget robtarWeldGun3;
        VAR robtarget robtarWeldGun4;

        sHeader:="Two Axis Gantry System"+" ("+GetTaskName()+")";
        sMsg{1}:=" Press Yes to run definition of";
        sMsg{2}:="               tool:  toolWeldGun.";
        sMsg{3}:=" Press No  to cancel.";
        sMsg{4}:="";
        sMsg{5}:="";
        UIMsgBox\Header:=sHeader,sMsg{1}\MsgLine2:=sMsg{2}\MsgLine3:=sMsg{3}\MsgLine4:=sMsg{4}\MsgLine5:=sMsg{5}\Buttons:=btnYesNo\Icon:=iconInfo\Result:=nAnswer;
        IF nAnswer=resNo THEN
            GOTO Calculate;
        ENDIF

        Stop\NoRegain;
        MoveAbsJ jtWeldGun4,v100,fine,toolWeldGun;
        MoveAbsJ jtWeldGun1,v100,fine,toolWeldGun;
        Stop;
        MoveAbsJ jtWeldGun4,v100,fine,toolWeldGun;
        MoveAbsJ jtWeldGun2,v100,fine,toolWeldGun;
        Stop;
        MoveAbsJ jtWeldGun4,v100,fine,toolWeldGun;
        MoveAbsJ jtWeldGun3,v100,fine,toolWeldGun;
        Stop;
        MoveAbsJ jtWeldGun4,v100,fine,toolWeldGun;
        Stop;
        MoveAbsJ jtWeldGunZ,v100,fine,toolWeldGun;
        Stop;
        MoveAbsJ jtWeldGunX,v100,fine,toolWeldGun;
        Stop;

        Calculate:

        MToolTCPCalib jtWeldGun1,jtWeldGun2,jtWeldGun3,jtWeldGun4,toolWeldGun,nMaxErr,nMeanErr;
        MToolRotCalib jtWeldGun4,jtWeldGunZ\XPos:=jtWeldGunX,toolWeldGun;
        TPErase;
        TPWrite " nMaxErr  ... "\Num:=nMaxErr;
        TPWrite " nMeanErr ... "\Num:=nMeanErr;
        robtarWeldGun1:=CalcRobT(jtWeldGun1,toolWeldGun);
        robtarWeldGun2:=CalcRobT(jtWeldGun2,toolWeldGun);
        robtarWeldGun3:=CalcRobT(jtWeldGun3,toolWeldGun);
        robtarWeldGun4:=CalcRobT(jtWeldGun4,toolWeldGun);
        TPWrite " Distance between point1 and point 4 is "\Num:=Distance(robtarWeldGun1.trans,robtarWeldGun4.trans);
        TPWrite " Distance between point2 and point 4 is "\Num:=Distance(robtarWeldGun2.trans,robtarWeldGun4.trans);
        TPWrite " Distance between point3 and point 4 is "\Num:=Distance(robtarWeldGun3.trans,robtarWeldGun4.trans);
        TPReadFK nUserInputFP,"",stEmpty,stEmpty,stEmpty,stEmpty,"OK";
        Stop;

        Calibrate:
        MoveAbsJ jtWeldGun4,v100,fine,tool0;
        pTCP:=CRobT(\Tool:=toolWeldGun);
        MoveL RelTool(pTCP,0,0,0),v100,fine,toolWeldGun;
        MoveL Reltool(pTCP,0,0,-30),v100,fine,toolWeldGun;
        MoveL Reltool(pTCP,0,0,30),v100,fine,toolWeldGun;
    ENDPROC

    PROC MoveSpecialPoint()
        MoveAbsJ jointHome,v1000,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveAbsJ jointOrigin,v1000,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveAbsJ jointTransportation,v1000,fine,toolWeldGun\WObj:=wobj0;
        Stop;
    ENDPROC

    
    PROC SaveModule()
        Save "CalibDataModule"\FilePath:="HOME:/WACDemoCfg/RAPID/CalibDataModule.mod";
        Save "MainModule"\FilePath:="HOME:/WACDemoCfg/RAPID/MainModule.mod";
        Save "WeldTestModule"\FilePath:="HOME:/WACDemoCfg/RAPID/WeldTestModule.mod";

    ENDPROC
    
ENDMODULE
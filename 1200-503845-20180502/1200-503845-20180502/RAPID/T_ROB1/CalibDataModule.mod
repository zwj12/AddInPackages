MODULE CalibDataModule
    PERS tooldata toolWeldGun:=[TRUE,[[10.9347,36.0045,447.379],[0.661019,0.21729,0.235374,-0.678555]],[3.5,[0,0,1],[1,0,0,0],0,0,0]];
    PERS tooldata toolPlasma:=[TRUE,[[-102.729,-14.89,222.874],[1,0,0,0]],[3,[0,0,1],[1,0,0,0],0,0,0]];
    PERS tooldata toolLaser:=[TRUE,[[141.769066707,-16.897170095,263.855801994],[1,0,0,0]],[4,[0,0,1],[1,0,0,0],0,0,0]];
    PERS tooldata toolHolder:=[TRUE,[[0,0,36],[1,0,0,0]],[1,[0,0,1],[1,0,0,0],0,0,0]];

    ! postions for tool definition of laser
    PERS jointtarget jtLaser1:=[[157.738,49.8491,2.14434,-0.777557,72.7949,-97.1629],[687.096,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtLaser2:=[[134.139,42.004,26.8916,45.0966,53.6812,-157.201],[687.095,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtLaser3:=[[151.113,16.1579,61.9742,146.38,15.9532,-247.799],[687.092,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtLaser4:=[[159.014,21.5328,41.6006,-1.67954,26.9466,-20.2972],[687.113,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtLaserZ:=[[159.015,8.68591,36.5218,-1.07903,44.8617,-21.0289],[687.115,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtLaserX:=[[161.523,27.5424,31.4752,-1.46627,31.0902,-18.0317],[687.112,9E+09,9E+09,9E+09,9E+09,9E+09]];

    ! postions for tool definition of weld gun
    PERS jointtarget jtWeldGun1:=[[-45.304,49.5465,13.8251,66.6044,75.0202,-86.3346],[7683.71,268.709,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtWeldGun2:=[[-34.1455,16.8265,35.1305,67.1992,51.6674,-73.0182],[7683.71,268.712,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtWeldGun3:=[[16.3952,28.8709,-16.2945,-9.95969,70.9148,-3.502],[7683.72,268.71,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtWeldGun4:=[[-23.4195,48.2221,-26.8564,34.7687,84.6677,-30.263],[7683.71,268.72,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtWeldGunZ:=[[-23.388,45.5074,-40.1349,34.9712,97.7934,-21.115],[7683.71,268.717,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jtWeldGunX:=[[-11.2908,41.3683,-15.0054,38.5769,74.0462,-24.2474],[7683.71,268.717,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS menudata md_DefineWeldGun:=["Define TCP of Weld Gun","","DefTCPofWeldGun",1,"",255,True,1,0,False,201];
    TASK PERS menudata md_DefineLaserGun:=["Define TCP of Laser","","DefTCPofLaser",1,"",255,True,1,0,False,202];

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

    PROC DefTCPofLaser()
        VAR num nMaxErr;
        VAR num nMeanErr;
        VAR num nUserInputFP:=0;
        VAR string sHeader;
        VAR string sMsg{5};
        VAR btnres nAnswer;
        VAR robtarget pTCP;
        VAR robtarget robtarLaser1;
        VAR robtarget robtarLaser2;
        VAR robtarget robtarLaser3;
        VAR robtarget robtarLaser4;

        sHeader:="Two Axis Gantry System"+" ("+GetTaskName()+")";
        sMsg{1}:=" Press Yes to run definition of";
        sMsg{2}:="               tool:  toolLaser.";
        sMsg{3}:=" Press No  to cancel.";
        sMsg{4}:="";
        sMsg{5}:="";
        UIMsgBox\Header:=sHeader,sMsg{1}\MsgLine2:=sMsg{2}\MsgLine3:=sMsg{3}\MsgLine4:=sMsg{4}\MsgLine5:=sMsg{5}\Buttons:=btnYesNo\Icon:=iconInfo\Result:=nAnswer;
        IF nAnswer=resNo THEN
            GOTO Calculate;
        ENDIF

        Stop\NoRegain;
        MoveAbsJ jtLaser1,v100,fine,toolLaser;
        Stop;
        MoveAbsJ jtLaser2,v100,fine,toolLaser;
        Stop;
        MoveAbsJ jtLaser3,v100,fine,toolLaser;
        Stop;
        MoveAbsJ jtLaser4,v100,fine,toolLaser;
        Stop;
        MoveAbsJ jtLaserZ,v100,fine,toolLaser;
        Stop;
        MoveAbsJ jtLaserX,v100,fine,toolLaser;
        Stop;

        Calculate:

        MToolTCPCalib jtLaser1,jtLaser2,jtLaser3,jtLaser4,toolLaser,nMaxErr,nMeanErr;
        MToolRotCalib jtLaser4,jtLaserZ\XPos:=jtLaserX,toolLaser;
        TPErase;
        TPWrite " nMaxErr  ... "\Num:=nMaxErr;
        TPWrite " nMeanErr ... "\Num:=nMeanErr;
        robtarLaser1:=CalcRobT(jtLaser1,toolLaser);
        robtarLaser2:=CalcRobT(jtLaser2,toolLaser);
        robtarLaser3:=CalcRobT(jtLaser3,toolLaser);
        robtarLaser4:=CalcRobT(jtLaser4,toolLaser);
        TPWrite " Distance between point1 and point 4 is "\Num:=Distance(robtarLaser1.trans,robtarLaser4.trans);
        TPWrite " Distance between point2 and point 4 is "\Num:=Distance(robtarLaser2.trans,robtarLaser4.trans);
        TPWrite " Distance between point3 and point 4 is "\Num:=Distance(robtarLaser3.trans,robtarLaser4.trans);
        TPReadFK nUserInputFP,"",stEmpty,stEmpty,stEmpty,stEmpty,"OK";
        Stop;

        Calibrate:
        MoveAbsJ jtLaser4,v100,fine,tool0;
        pTCP:=CRobT(\Tool:=toolLaser);
        MoveL RelTool(pTCP,0,0,0),v100,fine,toolLaser;
        MoveL Reltool(pTCP,0,0,-70),v100,fine,toolLaser;
        MoveL Reltool(pTCP,0,0,5),v100,fine,toolLaser;

    ENDPROC


ENDMODULE
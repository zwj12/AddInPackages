MODULE CalibDataModule
    !*****************************************************
    !Module Name: CalibDataModule
    !Version:     1.0
    !Description: -
    !Date:        2018-8-9
    !Author:      Michael
    !*****************************************************

    TASK PERS tooldata TCP:=[TRUE,[[44.025,0,363.649],[0.981627183,0,0.190808995,0]],[1,[0,0,1],[1,0,0,0],0,0,0]];

    ! postions for tool definition of weld gun
    TASK PERS jointtarget jtWeldGun1:=[[94.935,-20.0275,45.141,44.4704,65.439,27.0852],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtWeldGun2:=[[137.015,25.6896,-1.54183,-12.5323,105.771,27.2948],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtWeldGun3:=[[165.957,-32.8715,56.4201,-50.5923,61.9166,270.551],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtWeldGun4:=[[139.458,-19.5515,33.3556,-18.4181,63.5048,59.5152],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtWeldGunZ:=[[139.458,-19.0574,19.582,-16.931,76.1623,55.2282],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtWeldGunX:=[[130.538,-10.6881,26.8578,-16.5689,58.6545,50.9363],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtWeldGunVia1:=[[137.015,25.6896,-1.54183,-12.5323,105.771,27.2948],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtWeldGunVia2:=[[137.015,25.6896,-1.54183,-12.5323,105.771,27.2948],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtWeldGunVia3:=[[137.015,25.6896,-1.54183,-12.5323,105.771,27.2948],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtWeldGunVia4:=[[137.015,25.6896,-1.54183,-12.5323,105.771,27.2948],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    ! postions for tool definition of laser
    TASK PERS jointtarget jtLaser1:=[[-109.382,-37.4881,33.1175,7.78188,73.4569,-19.0305],[4998.93,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtLaser2:=[[-107.119,-8.17274,11.0863,5.04409,101.998,-14.8357],[4998.93,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtLaser3:=[[-79.5557,-10.5497,17.1409,-24.812,100.915,7.51347],[4998.93,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtLaser4:=[[-102.589,-19.6488,19.2565,0.0756925,90.4863,-12.2526],[4998.92,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtLaserZ:=[[-102.046,-14.8365,-0.0168828,-0.501104,105.493,-11.852],[4998.93,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtLaserX:=[[-100.977,-12.6335,14.2481,0.0732561,88.4744,-10.6443],[4998.93,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtLaserVia1:=[[-90.3637,-17.7546,18.9534,1.34778,88.4882,1.63907],[-0.00205856,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtLaserVia2:=[[-90.3637,-17.7546,18.9534,1.34778,88.488,1.63885],[-0.00205856,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtLaserVia3:=[[-90.3637,-17.7546,18.9534,1.34778,88.4882,1.63907],[-0.00205856,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS jointtarget jtLaserVia4:=[[-90.7576,-18.3359,27.3411,1.8484,80.7021,0.984536],[0.0012992,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS menudata md_DefineWeldGun:=["Define TCP of Weld Gun","","DefTCPofWeldGun",1,"",255,True,1,0,False,201];
    TASK PERS menudata md_DefineLaserGun:=["Define TCP of Laser","","DefTCPofLaser",1,"",255,True,1,0,False,202];
    TASK PERS menudata md_MoveToHome:=["Move to Home","","MovetoHome",1,"",255,True,1,0,False,210];
    TASK PERS menudata md_MovetoOrigin:=["Move to Origin","","MovetoOrigin",1,"",255,True,1,0,False,211];
    TASK PERS menudata md_VerifyTrackHorizontal:=["Verify Track Horizontal","","VerifyTrackHorizontal",1,"T_ROB1:T_ROB2:T_POS1",255,True,1,0,False,212];

    PERS tooldata toolWeldGun2:=[TRUE,[[79.6797,-0.416093,372.923],[0.951182,0.000468257,0.308629,0.000774227]],[5.2,[30.6,-22.1,100.1],[1,0,0,0],0,0,0]];
    PERS tooldata toolLaser2:=[TRUE,[[-50.2332,13.2462,422.412],[0.99997,-0.00371251,-0.00510598,-0.00440267]],[5.2,[30.6,-22.1,100.1],[1,0,0,0],0,0,0]];
    PERS num numLaser1OriginPosition:=100;
    PERS num numLaser2OriginPosition:=0;

    PERS wobjdata wobjSTN1:=[FALSE,FALSE,"STN1",[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]]];
    PERS wobjdata wobjSTN1PLATE1:=[FALSE,TRUE,"",[[236,0,843.17],[0.5,0.5,0.5,0.5]],[[0,0,0],[0.5,-0.5,-0.5,-0.5]]];
    !uframe is aligned with STN1, oframe is aligned with the workpiece
    PERS wobjdata wobjRailFixture:=[FALSE,TRUE,"",[[236,0,607.947],[0.5,0.5,0.5,0.5]],[[0,0,0],[0.5,-0.5,-0.5,-0.5]]];
    PERS wobjdata wobjCurrent:=[FALSE,FALSE,"STN1",[[0,0,0],[1,0,0,0]],[[0,0,380],[0.350074,-0.614368,-0.350074,-0.614368]]];
    PERS wobjdata wobjCurrent1:=[FALSE,FALSE,"STN1",[[0,0,0],[1,0,0,0]],[[0,0,1000],[0.353553,-0.612372,-0.353553,-0.612372]]];
    PERS wobjdata wobjCurrent2:=[FALSE,FALSE,"STN1",[[0,0,0],[1,0,0,0]],[[0,0,1000],[0.353553,-0.612372,-0.353553,-0.612372]]];

    PERS num numSTN1ArmPointsTotal:=7;
    TASK PERS robtarget robtSTN1Arm1WirePoints{10}:=[[[318.617,-21.9362,689.183],[0.559343,-0.338609,-0.704978,0.274745],[0,-1,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[353.537,-22.6462,869.224],[0.362373,-0.318849,-0.858416,0.173616],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[292.997,-22.6162,1042.18],[0.241289,-0.42207,-0.858679,0.162192],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[153.677,-22.6462,1161.33],[0.0528182,0.682137,0.729271,-0.00798319],[-1,0,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-26.513,-22.6462,1196.37],[0.185461,0.658303,0.715481,0.142574],[-1,0,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-199.683,-22.6462,1135.87],[0.371781,0.639795,0.638865,0.21046],[-1,0,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-318.743,-21.8762,996.893],[0.425903,0.755697,0.255873,0.426683],[-1,0,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-87.367,-149.556,1014.78],[0.461046,-0.653304,0.371736,-0.471638],[0,-1,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-87.357,-149.556,1014.78],[0.461048,-0.653302,0.371736,-0.47164],[0,-1,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-87.357,-149.556,1014.78],[0.461048,-0.653302,0.371736,-0.47164],[0,-1,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]]];
    TASK PERS robtarget robtSTN1Arm1LaserPoints{10}:=[[[318.617,-21.9362,689.183],[0.559343,-0.338609,-0.704978,0.274745],[0,-1,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[353.537,-22.6462,869.224],[0.362373,-0.318849,-0.858416,0.173616],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[292.997,-22.6162,1042.18],[0.241289,-0.42207,-0.858679,0.162192],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[153.677,-22.6462,1161.33],[0.0528182,0.682137,0.729271,-0.00798319],[-1,0,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-26.513,-22.6462,1196.37],[0.185461,0.658303,0.715481,0.142574],[-1,0,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-199.683,-22.6462,1135.87],[0.371781,0.639795,0.638865,0.21046],[-1,0,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-318.743,-21.8762,996.893],[0.425903,0.755697,0.255873,0.426683],[-1,0,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-87.367,-149.556,1014.78],[0.461046,-0.653304,0.371736,-0.471638],[0,-1,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-87.357,-149.556,1014.78],[0.461048,-0.653302,0.371736,-0.47164],[0,-1,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-87.357,-149.556,1014.78],[0.461048,-0.653302,0.371736,-0.47164],[0,-1,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]]];
    TASK PERS pos posSTN1Arm1Points{10}:=[[90.74,-20.17,671.79],[125.66,-20.88,851.83],[65.12,-20.85,1024.79],[-74.2,-20.88,1143.94],[-254.39,-20.88,1178.98],[-427.56,-20.88,1118.48],[-546.62,-20.11,979.5],[-315.244,-147.79,997.382],[-315.234,-147.79,997.382],[-315.234,-147.79,997.382]];
    TASK PERS pos posSTN1Arm1Center:=[-227.877,-20.253,825.694];
    TASK PERS num numSTN1Arm1radius:=354.083;
    TASK PERS pos numSTN1Arm1normal:=[0.000975905,0.999998,0.00194986];
    TASK PERS num numSTN1Arm1rms:=0.387646;
    TASK PERS num numSTN1Arm1maxErr:=0.689528;
    TASK PERS num numSTN1Arm1indexWorst:=4;

    PERS num numSTN1PlatePointsTotal:=10;
    TASK PERS robtarget robtSTN1Plate1WirePoints{10}:=[[[251.347,-3.01619,544.073],[0.510827,-0.115137,-0.846833,0.09313],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[250.687,174.164,598.854],[0.510829,-0.115136,-0.846832,0.0931287],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[251.617,284.174,747.534],[0.510838,-0.115115,-0.846831,0.0931118],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[250.567,285.964,931.674],[0.51085,-0.115116,-0.846827,0.0930859],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[249.157,179.294,1083.29],[0.510858,-0.115075,-0.846831,0.0930539],[0,-1,-1,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[249.327,3.09381,1142.68],[0.467735,-0.336069,-0.785762,0.225519],[0,-1,-1,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[248.877,-173.336,1087.98],[0.404619,-0.317332,-0.82005,0.2512],[0,-1,-1,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[248.857,-283.966,939.464],[0.347934,-0.399861,-0.789651,0.309038],[0,-1,-1,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[249.277,-285.796,753.784],[0.3083,-0.435514,-0.777335,0.33321],[0,-1,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[249.867,-178.786,602.794],[0.308317,-0.435504,-0.777342,0.33319],[0,-2,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]]];
    TASK PERS robtarget robtSTN1Plate1LaserPoints{10}:=[[[251.347,-3.01619,544.073],[0.510827,-0.115137,-0.846833,0.09313],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[250.687,174.164,598.854],[0.510829,-0.115136,-0.846832,0.0931287],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[251.617,284.174,747.534],[0.510838,-0.115115,-0.846831,0.0931118],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[250.567,285.964,931.674],[0.51085,-0.115116,-0.846827,0.0930859],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[249.157,179.294,1083.29],[0.510858,-0.115075,-0.846831,0.0930539],[0,-1,-1,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[249.327,3.09381,1142.68],[0.467735,-0.336069,-0.785762,0.225519],[0,-1,-1,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[248.877,-173.336,1087.98],[0.404619,-0.317332,-0.82005,0.2512],[0,-1,-1,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[248.857,-283.966,939.464],[0.347934,-0.399861,-0.789651,0.309038],[0,-1,-1,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[249.277,-285.796,753.784],[0.3083,-0.435514,-0.777335,0.33321],[0,-1,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[249.867,-178.786,602.794],[0.308317,-0.435504,-0.777342,0.33319],[0,-2,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]]];
    TASK PERS pos posSTN1Plate1Points{10}:=[[23.47,-1.25,526.68],[22.81,175.93,581.46],[23.74,285.94,730.14],[22.69,287.73,914.28],[21.28,181.06,1065.9],[21.45,4.86,1125.29],[21,-171.57,1070.59],[20.98,-282.2,922.07],[21.4,-284.03,736.39],[21.99,-177.02,585.4]];
    TASK PERS pos posSTN1Plate1Center:=[22.0804,1.76619,825.859];
    TASK PERS num numSTN1Plate1radius:=299.639;
    TASK PERS pos numSTN1Plate1normal:=[0.999991,-0.00296269,0.0030441];
    TASK PERS num numSTN1Plate1rms:=0.457688;
    TASK PERS num numSTN1Plate1maxErr:=0.707249;
    TASK PERS num numSTN1Plate1indexWorst:=2;

    PERS jointtarget jointOrigin2:=[[0,0,0,0,0,0],[0,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jointHome2:=[[0,-35,65,0,60,0],[3962.74,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jointCurrent2:=[[-0.0018897,-8.00527E-05,0.000263918,0.000224577,50.0002,-0.000150301],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jointTransportation2:=[[0,-35,65,0,60,0],[5000.03,9E+09,9E+09,9E+09,9E+09,9E+09]];

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
        MoveAbsJ jtWeldGunVia1,v100,fine,toolWeldGun2;
        MoveAbsJ jtWeldGun1,v100,fine,toolWeldGun2;
        Stop;
        MoveAbsJ jtWeldGunVia2,v100,fine,toolWeldGun2;
        MoveAbsJ jtWeldGun2,v100,fine,toolWeldGun2;
        Stop;
        MoveAbsJ jtWeldGunVia3,v100,fine,toolWeldGun2;
        MoveAbsJ jtWeldGun3,v100,fine,toolWeldGun2;
        Stop;
        MoveAbsJ jtWeldGunVia4,v100,fine,toolWeldGun2;
        MoveAbsJ jtWeldGun4,v100,fine,toolWeldGun2;
        Stop;
        MoveAbsJ jtWeldGunZ,v100,fine,toolWeldGun2;
        Stop;
        MoveAbsJ jtWeldGunX,v100,fine,toolWeldGun2;
        Stop;

        Calculate:

        MToolTCPCalib jtWeldGun1,jtWeldGun2,jtWeldGun3,jtWeldGun4,toolWeldGun2,nMaxErr,nMeanErr;
        MToolRotCalib jtWeldGun4,jtWeldGunZ\XPos:=jtWeldGunX,toolWeldGun2;
        toolWeldGun:=toolWeldGun2;
        toolLaser2.tload:=toolWeldGun2.tload;
        TPErase;
        TPWrite " nMaxErr  ... "\Num:=nMaxErr;
        TPWrite " nMeanErr ... "\Num:=nMeanErr;
        robtarWeldGun1:=CalcRobT(jtWeldGun1,toolWeldGun2);
        robtarWeldGun2:=CalcRobT(jtWeldGun2,toolWeldGun2);
        robtarWeldGun3:=CalcRobT(jtWeldGun3,toolWeldGun2);
        robtarWeldGun4:=CalcRobT(jtWeldGun4,toolWeldGun2);
        TPWrite " Distance between point1 and point 4 is "\Num:=Distance(robtarWeldGun1.trans,robtarWeldGun4.trans);
        TPWrite " Distance between point2 and point 4 is "\Num:=Distance(robtarWeldGun2.trans,robtarWeldGun4.trans);
        TPWrite " Distance between point3 and point 4 is "\Num:=Distance(robtarWeldGun3.trans,robtarWeldGun4.trans);
        TPReadFK nUserInputFP,"",stEmpty,stEmpty,stEmpty,stEmpty,"OK";
        Stop;

        Calibrate:
        MoveAbsJ jtWeldGun4,v100,fine,toolWeldGun2;
        pTCP:=CRobT(\Tool:=toolWeldGun2);
        MoveL RelTool(pTCP,0,0,0),v100,fine,toolWeldGun2;
        MoveL Reltool(pTCP,0,0,-30),v100,fine,toolWeldGun2;
        MoveL Reltool(pTCP,0,0,30),v100,fine,toolWeldGun2;
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
        MoveAbsJ jtLaserVia1,v100,fine,toolLaser2;
        MoveAbsJ jtLaser1,v100,fine,toolLaser2;
        Stop;
        MoveAbsJ jtLaserVia2,v100,fine,toolLaser2;
        MoveAbsJ jtLaser2,v100,fine,toolLaser2;
        Stop;
        MoveAbsJ jtLaserVia3,v100,fine,toolLaser2;
        MoveAbsJ jtLaser3,v100,fine,toolLaser2;
        Stop;
        MoveAbsJ jtLaserVia4,v100,fine,toolLaser2;
        MoveAbsJ jtLaser4,v100,fine,toolLaser2;
        Stop;
        MoveAbsJ jtLaserZ,v100,fine,toolLaser2;
        Stop;
        MoveAbsJ jtLaserX,v100,fine,toolLaser2;
        Stop;

        Calculate:

        MToolTCPCalib jtLaser1,jtLaser2,jtLaser3,jtLaser4,toolLaser2,nMaxErr,nMeanErr;
        MToolRotCalib jtLaser4,jtLaserZ\XPos:=jtLaserX,toolLaser2;
        toolLaser:=toolLaser2;
        TPErase;
        TPWrite " nMaxErr  ... "\Num:=nMaxErr;
        TPWrite " nMeanErr ... "\Num:=nMeanErr;
        robtarLaser1:=CalcRobT(jtLaser1,toolLaser2);
        robtarLaser2:=CalcRobT(jtLaser2,toolLaser2);
        robtarLaser3:=CalcRobT(jtLaser3,toolLaser2);
        robtarLaser4:=CalcRobT(jtLaser4,toolLaser2);
        TPWrite " Distance between point1 and point 4 is "\Num:=Distance(robtarLaser1.trans,robtarLaser4.trans);
        TPWrite " Distance between point2 and point 4 is "\Num:=Distance(robtarLaser2.trans,robtarLaser4.trans);
        TPWrite " Distance between point3 and point 4 is "\Num:=Distance(robtarLaser3.trans,robtarLaser4.trans);
        TPReadFK nUserInputFP,"",stEmpty,stEmpty,stEmpty,stEmpty,"OK";
        Stop;

        Calibrate:
        MoveAbsJ jtLaser4,v100,fine,toolLaser2;
        pTCP:=CRobT(\Tool:=toolLaser2);
        MoveL RelTool(pTCP,0,0,0),v100,fine,toolLaser2;
        MoveL Reltool(pTCP,0,0,-70),v100,fine,toolLaser2;
        MoveL Reltool(pTCP,0,0,5),v100,fine,toolLaser2;

    ENDPROC

    PROC MoveSpecialPoint()
        MoveAbsJ jointHome2,v1000,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveAbsJ jointOrigin2,v1000,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveAbsJ jointTransportation2,v1000,fine,toolWeldGun\WObj:=wobj0;
        Stop;
    ENDPROC

    PROC MoveToOrigin()
        MoveAbsJ jointOrigin2,v1000,fine,toolWeldGun\WObj:=wobj0;
    ENDPROC

    PROC CalibBaseFrameTrack2()
        CalibARM1Center;
        CalibPLATE1Center;
        CalibBaseFrameTrack "TRACK_2";
    ENDPROC

    PROC CalibARM1Center()
        VAR pos center;
        VAR num radius;
        VAR pos normal;
        VAR num rms;
        VAR num maxErr;
        VAR num indexWorst;

        MoveJ robtSTN1Arm1WirePoints{1},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1WirePoints{2},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1WirePoints{3},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1WirePoints{4},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1WirePoints{5},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1WirePoints{6},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1WirePoints{7},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1WirePoints{8},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1WirePoints{9},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1WirePoints{10},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        FOR i FROM 1 TO Dim(posSTN1Arm1Points,1) DO
            posSTN1Arm1Points{i}:=robtSTN1Arm1WirePoints{i}.trans;
        ENDFOR
        FitCircle posSTN1Arm1Points\NumPoints:=numSTN1ArmPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;
        posSTN1Arm1Center:=center;
        numSTN1Arm1radius:=radius;
        numSTN1Arm1normal:=normal;
        numSTN1Arm1rms:=rms;
        numSTN1Arm1maxErr:=maxErr;
        numSTN1Arm1indexWorst:=indexWorst;
        Logging\INFO, "Arm1: center="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

    ENDPROC

    PROC CalibPLATE1Center()
        VAR pos center;
        VAR num radius;
        VAR pos normal;
        VAR num rms;
        VAR num maxErr;
        VAR num indexWorst;

        MoveJ robtSTN1Plate1WirePoints{1},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1WirePoints{2},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1WirePoints{3},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1WirePoints{4},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1WirePoints{5},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1WirePoints{6},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1WirePoints{7},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1WirePoints{8},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1WirePoints{9},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1WirePoints{10},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        FOR i FROM 1 TO Dim(posSTN1Plate1Points,1) DO
            posSTN1Plate1Points{i}:=robtSTN1Plate1WirePoints{i}.trans;
        ENDFOR
        FitCircle posSTN1Plate1Points\NumPoints:=numSTN1PlatePointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;
        posSTN1Plate1Center:=center;
        numSTN1Plate1radius:=radius;
        numSTN1Plate1normal:=normal;
        numSTN1Plate1rms:=rms;
        numSTN1Plate1maxErr:=maxErr;
        numSTN1Plate1indexWorst:=indexWorst;
        Logging\INFO, "Plate1: center="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

    ENDPROC

    PROC CalibARM1CenterbyLaser()
        VAR pos center;
        VAR num radius;
        VAR pos normal;
        VAR num rms;
        VAR num maxErr;
        VAR num indexWorst;

        MoveJ robtSTN1Arm1LaserPoints{1},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1LaserPoints{2},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1LaserPoints{3},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1LaserPoints{4},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1LaserPoints{5},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1LaserPoints{6},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1LaserPoints{7},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1LaserPoints{8},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1LaserPoints{9},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Arm1LaserPoints{10},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        FOR i FROM 1 TO Dim(posSTN1Arm1Points,1) DO
            posSTN1Arm1Points{i}:=robtSTN1Arm1LaserPoints{i}.trans;
        ENDFOR
        FitCircle posSTN1Arm1Points\NumPoints:=numSTN1ArmPointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;
        posSTN1Arm1Center:=center;
        numSTN1Arm1radius:=radius;
        numSTN1Arm1normal:=normal;
        numSTN1Arm1rms:=rms;
        numSTN1Arm1maxErr:=maxErr;
        numSTN1Arm1indexWorst:=indexWorst;
        Logging\INFO, "Arm1: center="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

    ENDPROC

    PROC CalibPLATE1CenterbyLaser()
        VAR pos center;
        VAR num radius;
        VAR pos normal;
        VAR num rms;
        VAR num maxErr;
        VAR num indexWorst;

        MoveJ robtSTN1Plate1LaserPoints{1},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1LaserPoints{2},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1LaserPoints{3},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1LaserPoints{4},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1LaserPoints{5},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1LaserPoints{6},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1LaserPoints{7},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1LaserPoints{8},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1LaserPoints{9},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveJ robtSTN1Plate1LaserPoints{10},v100,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        FOR i FROM 1 TO Dim(posSTN1Plate1Points,1) DO
            posSTN1Plate1Points{i}:=robtSTN1Plate1LaserPoints{i}.trans;
        ENDFOR
        FitCircle posSTN1Plate1Points\NumPoints:=numSTN1PlatePointsTotal,center,radius,normal\RMS:=rms\MaxErr:=maxErr\IndexWorst:=indexWorst;
        posSTN1Plate1Center:=center;
        numSTN1Plate1radius:=radius;
        numSTN1Plate1normal:=normal;
        numSTN1Plate1rms:=rms;
        numSTN1Plate1maxErr:=maxErr;
        numSTN1Plate1indexWorst:=indexWorst;
        Logging\INFO, "Plate1: center="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO, "normal="+ValToStr(normal);
        Logging\INFO, "rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);

    ENDPROC

    !strTrack = TRACK_1 or TRACK_2
    PROC CalibBaseFrameTrack(string strTrack)
        VAR pos posBFArm1:=[0,0,0];
        VAR pos posBFPlate1:=[0,0,0];
        VAR pos posBFTrack:=[0,0,0];
        VAR pos posBFTrackCalibed:=[0,0,0];
        VAR pos posBFTrackOffset:=[0,0,0];
        VAR string sHeader;
        VAR string sMsg{5};
        VAR btnres nAnswer;

        ReadCfgData "/MOC/ARM_TYPE/M8DM2","rot_axis_pose_pos_x",posBFArm1.x;
        ReadCfgData "/MOC/ARM_TYPE/M8DM2","rot_axis_pose_pos_y",posBFArm1.y;
        ReadCfgData "/MOC/ARM_TYPE/M8DM2","rot_axis_pose_pos_z",posBFArm1.z;

        ReadCfgData "/MOC/ARM_TYPE/M9DM2","rot_axis_pose_pos_x",posBFPlate1.x;
        ReadCfgData "/MOC/ARM_TYPE/M9DM2","rot_axis_pose_pos_y",posBFPlate1.y;
        ReadCfgData "/MOC/ARM_TYPE/M9DM2","rot_axis_pose_pos_z",posBFPlate1.z;

        ReadCfgData "/MOC/SINGLE/"+strTrack,"base_frame_pos_x",posBFTrack.x;
        ReadCfgData "/MOC/SINGLE/"+strTrack,"base_frame_pos_y",posBFTrack.y;
        ReadCfgData "/MOC/SINGLE/"+strTrack,"base_frame_pos_z",posBFTrack.z;

        !Get the deviation
        Logging\INFO, "posBFArm1="+ValToStr(posBFArm1);
        Logging\INFO, "posBFPlate1="+ValToStr(posBFPlate1);
        Logging\INFO, "posBFTrack="+ValToStr(posBFTrack);
        Logging\INFO, "posSTN1Arm1Center="+ValToStr(posSTN1Arm1Center);
        Logging\INFO, "posSTN1Plate1Center="+ValToStr(posSTN1Plate1Center);
        posBFTrackOffset.x:=0-(posSTN1Arm1Center.x/1000-posBFArm1.x);
        posBFTrackOffset.y:=0-((posSTN1Plate1Center.y/1000-posBFPlate1.y));
        posBFTrackOffset.z:=0-((posSTN1Arm1Center.z/1000-posBFArm1.z)+(posSTN1Plate1Center.z/1000-posBFPlate1.z))/2;

        posBFTrackCalibed.x:=posBFTrack.x+posBFTrackOffset.x;
        posBFTrackCalibed.y:=posBFTrack.y+posBFTrackOffset.y;
        posBFTrackCalibed.z:=posBFTrack.z+posBFTrackOffset.z;

        Logging\INFO, "posBFTrackOffset="+ValToStr(posBFTrackOffset);
        Logging\INFO, "posBFTrackCalibed="+ValToStr(posBFTrackCalibed);

        sHeader:="Save base frame of "+strTrack;
        sMsg{1}:="Press Yes to WarmStart for save base frame configurations.";
        sMsg{2}:="Press No to cancel.";
        sMsg{3}:="posBFTrackOffset="+ValToStr(posBFTrackOffset);
        sMsg{4}:="posBFTrackCalibed="+ValToStr(posBFTrackCalibed);
        sMsg{5}:="";
        UIMsgBox\Header:=sHeader,sMsg{1}\MsgLine2:=sMsg{2}\MsgLine3:=sMsg{3}\MsgLine4:=sMsg{4}\MsgLine5:=sMsg{5}\Buttons:=btnYesNo\Icon:=iconInfo\Result:=nAnswer;
        IF (nAnswer=resYes) THEN
            !Save the new base frame value of track
            WriteCfgData "/MOC/SINGLE/"+strTrack,"base_frame_pos_x",posBFTrackCalibed.x;
            WriteCfgData "/MOC/SINGLE/"+strTrack,"base_frame_pos_y",posBFTrackCalibed.y;
            WriteCfgData "/MOC/SINGLE/"+strTrack,"base_frame_pos_z",posBFTrackCalibed.z;

            FOR i FROM 1 TO Dim(robtSTN1Arm1WirePoints,1) DO
                robtSTN1Arm1WirePoints{i}:=Offs(robtSTN1Arm1WirePoints{i},posBFTrackOffset.x*1000,posBFTrackOffset.y*1000,posBFTrackOffset.z*1000);
                robtSTN1Plate1WirePoints{i}:=Offs(robtSTN1Plate1WirePoints{i},posBFTrackOffset.x*1000,posBFTrackOffset.y*1000,posBFTrackOffset.z*1000);
            ENDFOR
            WarmStart;
        ENDIF
    ENDPROC

ENDMODULE
MODULE CalibDataModule
    !*****************************************************
    !Module Name: CalibDataModule
    !Version:     1.0
    !Description: -
    !Date:        2018-8-9
    !Author:      Michael
    !*****************************************************

    ! postions for tool definition of weld gun
    LOCAL PERS jointtarget jtWeldGun1:=[[147.054,-16.466,47.5226,-73.584,94.7181,120.744],[-0.0239682,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtWeldGun2:=[[62.957,-13.2054,39.7354,65.6012,95.7677,-116.673],[-0.0239682,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtWeldGun3:=[[94.6211,9.6844,3.2616,14.863,103.991,-16.0466],[-0.0273539,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtWeldGun4:=[[108.947,-34.3821,34.4417,-12.1864,54.5382,21.7288],[-0.0234039,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtWeldGunZ:=[[108.947,-31.6346,21.9848,-11.0236,64.0505,19.4598],[-0.0234039,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtWeldGunX:=[[104.416,-22.7901,28.5299,-9.71775,48.1011,17.4194],[-0.0234039,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtWeldGunVia1:=[[137.015,25.6896,-1.54183,-12.5323,105.771,27.2948],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtWeldGunVia2:=[[137.015,25.6896,-1.54183,-12.5323,105.771,27.2948],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtWeldGunVia3:=[[137.015,25.6896,-1.54183,-12.5323,105.771,27.2948],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtWeldGunVia4:=[[137.015,25.6896,-1.54183,-12.5323,105.771,27.2948],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    ! postions for tool definition of laser
    LOCAL PERS jointtarget jtLaser1:=[[80.1186,-25.4705,26.7021,23.3754,89.9018,5.56049],[4837.01,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtLaser2:=[[117.53,-17.9809,19.9349,-16.768,95.9539,22.6034],[4837.01,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtLaser3:=[[97.7321,0.758012,6.05111,4.48434,113.216,12.566],[4837.01,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtLaser4:=[[100.62,-21.2382,20.0494,0.426058,92.1034,6.32004],[4837.01,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtLaserZ:=[[100.617,-17.1007,2.41655,0.460412,105.606,6.41796],[4837.01,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtLaserX:=[[104.183,-20.5903,19.6404,0.476331,91.8419,9.88219],[4837.01,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtLaserVia1:=[[100.33,-42.0414,38.4908,-1.85403E-06,68.9809,-0.000183473],[4837.01,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtLaserVia2:=[[111.035,-14.1674,15.9717,3.25019,87.2514,23.8672],[-0.00887456,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtLaserVia3:=[[111.035,-14.1674,15.9717,3.25002,87.2512,23.8673],[-0.00887456,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS jointtarget jtLaserVia4:=[[111.035,-14.1674,15.9717,3.25002,87.2512,23.8673],[4838,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS menudata md_DefineWeldGun:=["Define TCP of Weld Gun","","DefTCPofWeldGun",1,"",255,True,1,0,False,201];
    TASK PERS menudata md_DefineLaserGun:=["Define TCP of Laser","","DefTCPofLaser",1,"",255,True,1,0,False,202];
    TASK PERS menudata md_CopyRobLayerTargets:=["Copy Robot Layer Targets","","CopyRobLayerTargets",1,"",255,True,1,0,False,204];
    TASK PERS menudata md_CopyMultiRobLayers:=["Copy Multi Robot Layers","","CopyMultiRobLayers",1,"",255,True,1,0,False,205];
    TASK PERS menudata md_MoveToHome:=["Move to Home","","MovetoHome",1,"",255,True,1,0,False,210];
    TASK PERS menudata md_MovetoOrigin:=["Move to Origin","","MovetoOrigin",1,"",255,True,1,0,False,211];
    TASK PERS menudata md_VerifyTrackHorizontal:=["Verify Track Horizontal","","VerifyTrackHorizontal",1,"T_ROB1:T_ROB2:T_POS1",255,True,1,0,False,212];
    
    PERS tooldata toolWeldGun1:=[TRUE,[[80.8801,-0.792657,372.832],[0.950301,0.00218631,0.311128,-0.0110736]],[5.2,[34.6,-12.3,73.3],[1,0,0,0],0.048,0.077,0.012]];
    PERS tooldata toolLaser1234:=[TRUE,[[-54.9581,16.2889,420.256],[0.734819,0.0065364,-0.00402659,-0.67822]],[5.2,[34.6,-12.3,73.3],[1,0,0,0],0.048,0.077,0.012]];
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
    TASK PERS robtarget robtSTN1Arm1WirePoints{10}:=[[[316.896,-147.91,691.532],[0.580013,0.0706158,-0.808495,-0.0702392],[-1,0,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[350.486,-147.92,869.192],[0.410221,0.0554725,-0.906531,-0.0827235],[-1,0,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[290.666,-148.97,1040.49],[0.239181,0.0395591,-0.965856,-0.091376],[-1,-1,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[153.396,-149.83,1158.41],[0.0192392,0.0134159,-0.993948,-0.107319],[0,-1,1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-25.544,-147.51,1194],[0.0987456,-0.844721,0.496596,-0.17346],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-196.664,-147.51,1134.66],[0.312196,-0.768527,0.439436,-0.344667],[0,-1,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-315.234,-147.79,997.382],[0.461048,-0.653302,0.371736,-0.47164],[0,-1,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-315.244,-147.79,997.382],[0.461046,-0.653304,0.371736,-0.471638],[0,-1,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-315.234,-147.79,997.382],[0.461048,-0.653302,0.371736,-0.47164],[0,-1,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-315.234,-147.79,997.382],[0.461048,-0.653302,0.371736,-0.47164],[0,-1,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]]];
    TASK PERS robtarget robtSTN1Arm1LaserPoints{10}:=[[[316.896,-147.91,691.532],[0.580013,0.0706158,-0.808495,-0.0702392],[-1,0,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[350.486,-147.92,869.192],[0.410221,0.0554725,-0.906531,-0.0827235],[-1,0,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[290.666,-148.97,1040.49],[0.239181,0.0395591,-0.965856,-0.091376],[-1,-1,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[153.396,-149.83,1158.41],[0.0192392,0.0134159,-0.993948,-0.107319],[0,-1,1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-25.544,-147.51,1194],[0.0987456,-0.844721,0.496596,-0.17346],[0,-1,-1,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-196.664,-147.51,1134.66],[0.312196,-0.768527,0.439436,-0.344667],[0,-1,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-315.234,-147.79,997.382],[0.461048,-0.653302,0.371736,-0.47164],[0,-1,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-315.244,-147.79,997.382],[0.461046,-0.653304,0.371736,-0.471638],[0,-1,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-315.234,-147.79,997.382],[0.461048,-0.653302,0.371736,-0.47164],[0,-1,0,0],[5300,9E+09,9E+09,9E+09,9E+09,9E+09]],[[-315.234,-147.79,997.382],[0.461048,-0.653302,0.371736,-0.47164],[0,-1,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]]];
    TASK PERS pos posSTN1Arm1Points{10}:=[[85.16,-147.91,691.523],[118.75,-147.92,869.183],[58.93,-148.97,1040.48],[-78.34,-149.83,1158.4],[-257.28,-147.51,1193.99],[-428.4,-147.51,1134.65],[-546.97,-147.79,997.373],[-546.98,-147.79,997.373],[-546.97,-147.79,997.373],[-546.97,-147.79,997.373]];
    TASK PERS pos posSTN1Arm1Center:=[-231.736,-147.572,843.161];
    TASK PERS num numSTN1Arm1radius:=351.282;
    TASK PERS pos numSTN1Arm1normal:=[0.00224412,0.999994,0.0026587];
    TASK PERS num numSTN1Arm1rms:=0.731789;
    TASK PERS num numSTN1Arm1maxErr:=1.28172;
    TASK PERS num numSTN1Arm1indexWorst:=4;

    PERS num numSTN1PlatePointsTotal:=10;
    TASK PERS robtarget robtSTN1Plate1WirePoints{10}:=[[[248.74,-2.70405,543.26],[0.59067,0.046884,-0.772957,-0.226821],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[248.74,173.966,599.11],[0.590669,0.0468841,-0.772958,-0.226822],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[248.74,284.466,748.58],[0.59067,0.0468832,-0.772958,-0.226821],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[248.19,286.356,933.26],[0.590669,0.0468839,-0.772958,-0.226821],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[247.55,178.536,1083.64],[0.590669,0.0468841,-0.772958,-0.226822],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[247.04,3.83595,1142.58],[0.590669,0.0468818,-0.772957,-0.226823],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[247.04,-173.004,1087],[0.59067,0.0468831,-0.772957,-0.226823],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[247.04,-284.034,939.3],[0.590668,0.0468854,-0.772959,-0.226821],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[247.04,-287.284,753.24],[0.590668,0.0468822,-0.772959,-0.226823],[-1,0,-1,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[248.62,-178.574,603.69],[0.590671,0.0468801,-0.772956,-0.226822],[-1,0,-1,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]]];
    TASK PERS robtarget robtSTN1Plate1LaserPoints{10}:=[[[248.74,-2.70405,543.26],[0.59067,0.046884,-0.772957,-0.226821],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[248.74,173.966,599.11],[0.590669,0.0468841,-0.772958,-0.226822],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[248.74,284.466,748.58],[0.59067,0.0468832,-0.772958,-0.226821],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[248.19,286.356,933.26],[0.590669,0.0468839,-0.772958,-0.226821],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[247.55,178.536,1083.64],[0.590669,0.0468841,-0.772958,-0.226822],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[247.04,3.83595,1142.58],[0.590669,0.0468818,-0.772957,-0.226823],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[247.04,-173.004,1087],[0.59067,0.0468831,-0.772957,-0.226823],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[247.04,-284.034,939.3],[0.590668,0.0468854,-0.772959,-0.226821],[-1,0,0,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[247.04,-287.284,753.24],[0.590668,0.0468822,-0.772959,-0.226823],[-1,0,-1,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]],[[248.62,-178.574,603.69],[0.590671,0.0468801,-0.772956,-0.226822],[-1,0,-1,0],[5300.01,9E+09,9E+09,9E+09,9E+09,9E+09]]];
    TASK PERS pos posSTN1Plate1Points{10}:=[[248.74,-128.55,543.26],[248.74,48.12,599.11],[248.74,158.62,748.58],[248.19,160.51,933.26],[247.55,52.69,1083.64],[247.04,-122.01,1142.58],[247.04,-298.85,1087],[247.04,-409.88,939.3],[247.04,-413.13,753.24],[248.62,-304.42,603.69]];
    TASK PERS pos posSTN1Plate1Center:=[247.875,-125.846,843.029];
    TASK PERS num numSTN1Plate1radius:=299.715;
    TASK PERS pos numSTN1Plate1normal:=[0.999994,-0.0020281,0.00276721];
    TASK PERS num numSTN1Plate1rms:=0.639849;
    TASK PERS num numSTN1Plate1maxErr:=1.36867;
    TASK PERS num numSTN1Plate1indexWorst:=9;

    PERS num numIncludedAngleofAB:=-4.91087;
    PERS num numSTBranchZOffset:=-50;

    TASK PERS robtarget robtBranchRollAngleA1:=[[617.46,-76.87,955.24],[0.469696,-0.469887,-0.528585,-0.528384],[0,0,1,1],[4847.06,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget robtBranchRollAngleA2:=[[617.46,-76.87,1045.24],[0.469696,-0.469887,-0.528585,-0.528384],[0,0,1,1],[4847.06,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS pose poseSmarTacBranchRollAngleA1:=[[-0.00640869,6.27273,-0.0454102],[1,0,0,0]];
    TASK PERS pose poseSmarTacBranchRollAngleA2:=[[0.00543213,-2.09799,-0.0167236],[1,0,0,0]];
    TASK PERS robtarget robtSearchStopBranchRollAngleA1:=[[617.454,-70.5973,955.195],[0.469683,-0.46991,-0.528596,-0.528364],[0,0,1,1],[4847.07,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget robtSearchStopBranchRollAngleA2:=[[617.465,-78.968,1045.22],[0.46969,-0.469907,-0.528583,-0.528374],[0,0,1,1],[4847.06,9E+09,9E+09,9E+09,9E+09,9E+09]];

    TASK PERS robtarget robtBranchRollAngleA1byLaser:=[[617.84,-77.07,960.04],[1.31768E-06,3.94535E-05,-0.707252,-0.706961],[0,-1,0,1],[4847.06,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget robtBranchRollAngleA2byLaser:=[[617.84,-77.07,1050.04],[1.31768E-06,3.94535E-05,-0.707252,-0.706961],[0,-1,0,1],[4847.06,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS pose poseSTBranchRollAngleA1byLaser:=[[-0.00646973,4.35897,-0.0235596],[1,0,0,0]];
    TASK PERS pose poseSTBranchRollAngleA2byLaser:=[[-0.0116577,-3.37495,-0.012085],[1,0,0,0]];
    TASK PERS robtarget robtSSBranchRollAngleA1byLaser:=[[617.834,-72.711,960.016],[1.21738E-05,4.78963E-05,-0.707262,-0.706951],[0,-1,0,1],[4847.05,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS robtarget robtSSBranchRollAngleA2byLaser:=[[617.828,-80.4449,1050.03],[1.09164E-06,4.1961E-05,-0.707256,-0.706958],[0,-1,0,1],[4847.07,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PERS robtarget robtAlignPoints{100}:=[[[380,-57.15,118.15],[0.5,-0.5,-0.5,-0.5],[0,-1,0,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[380,-57.15,128.15],[0.5,-0.5,-0.5,-0.5],[0,-1,0,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[380,-57.15,138.15],[0.5,-0.5,-0.5,-0.5],[0,-1,0,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[380,-57.15,148.15],[0.5,-0.5,-0.5,-0.5],[0,-1,0,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[380,-57.15,158.15],[0.5,-0.5,-0.5,-0.5],[0,-1,0,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[380,-57.15,168.15],[0.5,-0.5,-0.5,-0.5],[0,-1,0,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[380,-57.15,178.15],[0.5,-0.5,-0.5,-0.5],[0,-1,0,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[380,-57.15,188.15],[0.5,-0.5,-0.5,-0.5],[0,-1,0,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[380,-57.15,198.15],[0.5,-0.5,-0.5,-0.5],[0,-1,0,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[380,-57.15,198.15],[0.5,-0.5,-0.5,-0.5],[0,-1,0,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[380,-57.15,208.15],[0.5,-0.5,-0.5,-0.5],[0,-1,0,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[380,-57.15,218.15],[0.5,-0.5,-0.5,-0.5],[0,-1,0,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[380,-57.15,228.15],[0.5,-0.5,-0.5,-0.5],[0,-1,0,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]],[[75.54,-110.49,75.53],[0.104911,-0.592891,0.59209,0.535634],[-1,0,-1,0],[3747.5,9E+09,9E+09,9E+09,9E+09,9E+09]]];
    TASK PERS num numAlignLaserValues{100}:=[73.954,74.247,72.9286,71.0242,69.8523,67.8014,66.483,64.8717,63.5533,76.7464,75.8675,80.5551,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    TASK PERS pos posRevisedAlignPoints{100}:=[[118.15,73.954,183.7],[128.15,74.247,183.7],[138.15,72.9286,183.7],[148.15,71.0242,183.7],[158.15,69.8523,183.7],[168.15,67.8014,183.7],[178.15,66.3366,183.7],[188.15,64.8717,183.7],[198.15,63.5533,183.7],[10,76.7464,183.7],[11,75.8675,183.7],[12,80.5551,183.7],[13,150,183.7],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]];

    !Must be an odd number and equal or greater than 3
    TASK PERS num numAlignPointsTotal:=9;
    TASK PERS num numAlignSpan:=10;
    TASK PERS num numAlignDeviation:=10;

    TASK PERS num numAlignXVariable1:=-0.143562;
    TASK PERS num numAlignIntercept:=92.1008;
    TASK PERS num numAlignAngleofInclination:=-8.16965;
    TASK PERS num numAlignSST:=126.155;
    TASK PERS num numAlignSSR:=123.66;
    TASK PERS num numAlignRSquare:=0.980218;

    PERS jointtarget jointOrigin1:=[[0,0,0,0,0,0],[0,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jointHome1:=[[0,-35,65,0,60,0],[4816.37,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jointCurrent1:=[[-0.0018897,-8.00527E-05,0.000263918,0.000224577,50.0002,-0.000150301],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jointTransportation1:=[[0,0,0,0,0,0],[4838,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PERS jointtarget jointCurrent3:=[[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09],[0,-5.31201,9E+09,9E+09,9E+09,9E+09]];
    PERS tooldata toolLaser1:=[TRUE,[[-54.9581,16.2889,420.256],[0.999173,0.00179167,-0.00748378,0.0399198]],[5.2,[34.6,-12.3,73.3],[1,0,0,0],0.048,0.077,0.012]];

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
        MoveAbsJ jtWeldGunVia1,v100,fine,toolWeldGun1;
        MoveAbsJ jtWeldGun1,v100,fine,toolWeldGun1;
        Stop;
        MoveAbsJ jtWeldGunVia2,v100,fine,toolWeldGun1;
        MoveAbsJ jtWeldGun2,v100,fine,toolWeldGun1;
        Stop;
        MoveAbsJ jtWeldGunVia3,v100,fine,toolWeldGun1;
        MoveAbsJ jtWeldGun3,v100,fine,toolWeldGun1;
        Stop;
        MoveAbsJ jtWeldGunVia4,v100,fine,toolWeldGun1;
        MoveAbsJ jtWeldGun4,v100,fine,toolWeldGun1;
        Stop;
        MoveAbsJ jtWeldGunZ,v100,fine,toolWeldGun1;
        Stop;
        MoveAbsJ jtWeldGunX,v100,fine,toolWeldGun1;
        Stop;

        Calculate:

        MToolTCPCalib jtWeldGun1,jtWeldGun2,jtWeldGun3,jtWeldGun4,toolWeldGun1,nMaxErr,nMeanErr;
        MToolRotCalib jtWeldGun4,jtWeldGunZ\XPos:=jtWeldGunX,toolWeldGun1;
        toolWeldGun:=toolWeldGun1;
        toolLaser1.tload:=toolWeldGun1.tload;
        TPErase;
        TPWrite " nMaxErr  ... "\Num:=nMaxErr;
        TPWrite " nMeanErr ... "\Num:=nMeanErr;
        robtarWeldGun1:=CalcRobT(jtWeldGun1,toolWeldGun1);
        robtarWeldGun2:=CalcRobT(jtWeldGun2,toolWeldGun1);
        robtarWeldGun3:=CalcRobT(jtWeldGun3,toolWeldGun1);
        robtarWeldGun4:=CalcRobT(jtWeldGun4,toolWeldGun1);
        TPWrite " Distance between point1 and point 4 is "\Num:=Distance(robtarWeldGun1.trans,robtarWeldGun4.trans);
        TPWrite " Distance between point2 and point 4 is "\Num:=Distance(robtarWeldGun2.trans,robtarWeldGun4.trans);
        TPWrite " Distance between point3 and point 4 is "\Num:=Distance(robtarWeldGun3.trans,robtarWeldGun4.trans);
        TPReadFK nUserInputFP,"",stEmpty,stEmpty,stEmpty,stEmpty,"OK";
        Stop;

        Calibrate:
        MoveAbsJ jtWeldGun4,v100,fine,toolWeldGun1;
        pTCP:=CRobT(\Tool:=toolWeldGun1);
        MoveL RelTool(pTCP,0,0,0),v100,fine,toolWeldGun1;
        MoveL Reltool(pTCP,0,0,-30),v100,fine,toolWeldGun1;
        MoveL Reltool(pTCP,0,0,30),v100,fine,toolWeldGun1;
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
        MoveAbsJ jtLaserVia1,v100,fine,toolLaser1;
        MoveAbsJ jtLaser1,v100,fine,toolLaser1;
        Stop;
        MoveAbsJ jtLaserVia2,v100,fine,toolLaser1;
        MoveAbsJ jtLaser2,v100,fine,toolLaser1;
        Stop;
        MoveAbsJ jtLaserVia3,v100,fine,toolLaser1;
        MoveAbsJ jtLaser3,v100,fine,toolLaser1;
        Stop;
        MoveAbsJ jtLaserVia4,v100,fine,toolLaser1;
        MoveAbsJ jtLaser4,v100,fine,toolLaser1;
        Stop;
        MoveAbsJ jtLaserZ,v100,fine,toolLaser1;
        Stop;
        MoveAbsJ jtLaserX,v100,fine,toolLaser1;
        Stop;

        Calculate:

        MToolTCPCalib jtLaser1,jtLaser2,jtLaser3,jtLaser4,toolLaser1,nMaxErr,nMeanErr;
        MToolRotCalib jtLaser4,jtLaserZ\XPos:=jtLaserX,toolLaser1;
        toolLaser:=toolLaser1;
        TPErase;
        TPWrite " nMaxErr  ... "\Num:=nMaxErr;
        TPWrite " nMeanErr ... "\Num:=nMeanErr;
        robtarLaser1:=CalcRobT(jtLaser1,toolLaser1);
        robtarLaser2:=CalcRobT(jtLaser2,toolLaser1);
        robtarLaser3:=CalcRobT(jtLaser3,toolLaser1);
        robtarLaser4:=CalcRobT(jtLaser4,toolLaser1);
        TPWrite " Distance between point1 and point 4 is "\Num:=Distance(robtarLaser1.trans,robtarLaser4.trans);
        TPWrite " Distance between point2 and point 4 is "\Num:=Distance(robtarLaser2.trans,robtarLaser4.trans);
        TPWrite " Distance between point3 and point 4 is "\Num:=Distance(robtarLaser3.trans,robtarLaser4.trans);
        TPReadFK nUserInputFP,"",stEmpty,stEmpty,stEmpty,stEmpty,"OK";
        Stop;

        Calibrate:
        MoveAbsJ jtLaser4,v100,fine,toolLaser1;
        pTCP:=CRobT(\Tool:=toolLaser1);
        MoveL RelTool(pTCP,0,0,0),v100,fine,toolLaser1;
        MoveL Reltool(pTCP,0,0,-70),v100,fine,toolLaser1;
        MoveL Reltool(pTCP,0,0,5),v100,fine,toolLaser1;

    ENDPROC

    PROC MoveSpecialPoint()
        MoveAbsJ jointHome1,v1000,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveAbsJ jointOrigin1,v1000,fine,toolWeldGun\WObj:=wobj0;
        Stop;
        MoveAbsJ jointTransportation1,v1000,fine,toolWeldGun\WObj:=wobj0;
        Stop;
    ENDPROC

    PROC MoveToOrigin()
        MoveAbsJ jointOrigin1,v1000,fine,toolWeldGun\WObj:=wobj0;
    ENDPROC
    
    PROC CalibBaseFrameTrack1()
        CalibARM1Center;
        CalibPLATE1Center;
        CalibBaseFrameTrack "TRACK_1";
    ENDPROC

    !Used for calibrating the positoner's first axis center coocdinate value.
    PROC CalibARM1Center()
        VAR pos center;
        VAR num radius;
        VAR pos normal;
        VAR num rms;
        VAR num maxErr;
        VAR num indexWorst;

        !Engineer can set 3~10 points for getting a circle
        !Each point corresonding to an angle of the first axis, please refer to the routine CalibARM1Center in T_POS1
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
        !Fit a cicle by 3~10 points, then give the center point coordinate value, radius and normal vector of the circle.
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
    !Calculate the deviation between the positioner's base frame and the track's base frame
    !Correct the track's base frame parameter and restart the robot
    !Due the base frame of track is modified, so the value of robtargets are also need to be adjusted
    PROC CalibBaseFrameTrack(string strTrack)
        VAR pos posBFArm1:=[0,0,0];
        VAR pos posBFPlate1:=[0,0,0];
        VAR pos posBFTrack:=[0,0,0];
        VAR pos posBFTrackCalibed:=[0,0,0];
        VAR pos posBFTrackOffset:=[0,0,0];
        VAR string sHeader;
        VAR string sMsg{5};
        VAR btnres nAnswer;

        !Get the current parameters of mechnical units' base frame
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

    PROC CalibBranchRollAngle()
        VAR pos vectorAxisReal;
        VAR pos vectorAxisRef:=[0,0,1];
        VAR pos vectorCross;
        VAR string sHeader;
        VAR string sMsg{5};
        VAR btnres nAnswer;

        MoveJ robtBranchRollAngleA1,v100,fine,toolWeldGun\WObj:=wobj0;
        robtBranchRollAngleA2:=robtBranchRollAngleA1;
        robtBranchRollAngleA2.trans.z:=robtBranchRollAngleA1.trans.z+90;
        Stop;
        MoveL robtBranchRollAngleA2,v100,fine,toolWeldGun\WObj:=wobj0;

        Stop;

        MoveJ RelTool(robtBranchRollAngleA1,0,0,-100),v100,fine,toolWeldGun\WObj:=wobj0;

        SetDO doWireLock1,1;
        Search_1D\Wire,poseSmarTacBranchRollAngleA1\SearchStop:=robtSearchStopBranchRollAngleA1,RelTool(robtBranchRollAngleA1,0,0,numSTBranchZOffset),robtBranchRollAngleA1,speedAir,toolWeldGun\WObj:=wobj0;
        Search_1D\Wire,poseSmarTacBranchRollAngleA2\SearchStop:=robtSearchStopBranchRollAngleA2,RelTool(robtBranchRollAngleA2,0,0,numSTBranchZOffset),robtBranchRollAngleA2,speedAir,toolWeldGun\WObj:=wobj0;
        SetDO doWireLock1,0;

        MoveL RelTool(robtBranchRollAngleA1,0,0,-100),v100,fine,toolWeldGun\WObj:=wobj0;

        vectorAxisReal:=robtSearchStopBranchRollAngleA2.trans-robtSearchStopBranchRollAngleA1.trans;
        numIncludedAngleofAB:=GetIncludedAngleofVectors(vectorAxisReal,vectorAxisRef);

        vectorCross:=CrossProd(vectorAxisReal,vectorAxisRef);
        IF vectorCross.x>=0 THEN
            numIncludedAngleofAB:=numIncludedAngleofAB;
        ELSE
            numIncludedAngleofAB:=0-numIncludedAngleofAB;
        ENDIF
        Logging\INFO, "vectorCross="+ValToStr(vectorCross)+", numIncludedAngleofAB="+ValToStr(numIncludedAngleofAB);
        Logging\INFO, "Please double check the numGrooveAngle in IPC";

        sHeader:="CalibBranchRollAngle"+" ("+GetTaskName()+")";
        sMsg{1}:="Do you want to update the numGrooveAngle and jointCurrent3 value?";
        sMsg{2}:="vectorCross="+ValToStr(vectorCross);
        sMsg{3}:="numIncludedAngleofAB="+ValToStr(numIncludedAngleofAB);
        sMsg{4}:="";
        sMsg{5}:="Press No to cancel.";
        UIMsgBox\Header:=sHeader,sMsg{1}\MsgLine2:=sMsg{2}\MsgLine3:=sMsg{3}\MsgLine4:=sMsg{4}\MsgLine5:=sMsg{5}\Buttons:=btnYesNo\Icon:=iconInfo\Result:=nAnswer;
        IF (nAnswer=resYes) THEN
            rPipeGrooveModel.numSeamNormalAngle:=numIncludedAngleofAB;
            jointCurrent3.extax.eax_b:=rPipeGrooveModel.numSeamNormalAngle;
        ENDIF

    UNDO
        SetDO doWireLock1,0;
    ENDPROC

    PROC CalibBranchRollAnglebyLaser()
        VAR pos vectorAxisReal;
        VAR pos vectorAxisRef:=[0,0,1];
        VAR pos vectorCross;
        VAR string sHeader;
        VAR string sMsg{5};
        VAR btnres nAnswer;

        MoveJ robtBranchRollAngleA1byLaser,v100,fine,toolLaser1\WObj:=wobj0;
        robtBranchRollAngleA2byLaser:=robtBranchRollAngleA1byLaser;
        robtBranchRollAngleA2byLaser.trans.z:=robtBranchRollAngleA1byLaser.trans.z+90;
        Stop;
        MoveL robtBranchRollAngleA2byLaser,v100,fine,toolLaser1\WObj:=wobj0;

        Stop;

        MoveJ RelTool(robtBranchRollAngleA1byLaser,0,0,-100),v100,fine,toolLaser1\WObj:=wobj0;

        Search_1D poseSTBranchRollAngleA1byLaser\SearchStop:=robtSSBranchRollAngleA1byLaser,RelTool(robtBranchRollAngleA1byLaser,0,0,numSTBranchZOffset),robtBranchRollAngleA1byLaser,speedAir,toolLaser1\WObj:=wobj0;
        Search_1D poseSTBranchRollAngleA2byLaser\SearchStop:=robtSSBranchRollAngleA2byLaser,RelTool(robtBranchRollAngleA2byLaser,0,0,numSTBranchZOffset),robtBranchRollAngleA2byLaser,speedAir,toolLaser1\WObj:=wobj0;

        MoveL RelTool(robtBranchRollAngleA1byLaser,0,0,-100),v100,fine,toolLaser1\WObj:=wobj0;

        vectorAxisReal:=robtSSBranchRollAngleA2byLaser.trans-robtSSBranchRollAngleA1byLaser.trans;
        numIncludedAngleofAB:=GetIncludedAngleofVectors(vectorAxisReal,vectorAxisRef);

        vectorCross:=CrossProd(vectorAxisReal,vectorAxisRef);
        IF vectorCross.x>=0 THEN
            numIncludedAngleofAB:=numIncludedAngleofAB;
        ELSE
            numIncludedAngleofAB:=0-numIncludedAngleofAB;
        ENDIF
        Logging\INFO, "vectorCross="+ValToStr(vectorCross)+", numIncludedAngleofAB="+ValToStr(numIncludedAngleofAB);
        Logging\INFO, "Please double check the numGrooveAngle in IPC";

        sHeader:="CalibBranchRollAngle"+" ("+GetTaskName()+")";
        sMsg{1}:="Do you want to update the numGrooveAngle and jointCurrent3 value?";
        sMsg{2}:="vectorCross="+ValToStr(vectorCross);
        sMsg{3}:="numIncludedAngleofAB="+ValToStr(numIncludedAngleofAB);
        sMsg{4}:="";
        sMsg{5}:="Press No to cancel.";
        UIMsgBox\Header:=sHeader,sMsg{1}\MsgLine2:=sMsg{2}\MsgLine3:=sMsg{3}\MsgLine4:=sMsg{4}\MsgLine5:=sMsg{5}\Buttons:=btnYesNo\Icon:=iconInfo\Result:=nAnswer;
        IF (nAnswer=resYes) THEN
            rPipeGrooveModel.numSeamNormalAngle:=numIncludedAngleofAB;
            jointCurrent3.extax.eax_b:=rPipeGrooveModel.numSeamNormalAngle;
        ENDIF

    ENDPROC

    !Please choose one of CalibBranchRollAngle or AlignPositionerbyBranch to rotate the product to vertical
    PROC AlignPositionerbyBranch()
        VAR pos vectorAxisReal;
        VAR pos vectorAxisRef:=[0,0,1];
        VAR pos vectorCross;
        VAR string sHeader;
        VAR string sMsg{5};
        VAR btnres nAnswer;
        VAR robtarget robtTemp;
        ComputeAlignPositionerTargets;
        MoveAbsJ jointHome1,speedAir,fine,toolLaser;

        MoveJ RelTool(robtAlignPoints{1},0,0,-100),speedAir,fine,toolLaser\WObj:=wobjSTN1PLATE1;

        FOR i FROM 1 TO numAlignPointsTotal DO
            Logging\INFO, "Moving to align positioner target: "+ValToStr(i);
            MoveL robtAlignPoints{i},speedScan,fine,toolLaser\WObj:=wobjSTN1PLATE1;
            WaitTime\InPos,numWaitTimeForLaser;
            numAlignLaserValues{i}:=aiLaserScan1;
            robtTemp:=reltool(robtAlignPoints{i},0,0,numAlignLaserValues{i});
            posRevisedAlignPoints{i}.x:=robtAlignPoints{i}.trans.z;
            posRevisedAlignPoints{i}.y:=aiLaserScan1;
        ENDFOR

        MoveJ RelTool(robtAlignPoints{1},0,0,-100),speedAir,fine,toolLaser\WObj:=wobjSTN1PLATE1;

        UnaryLinearRegressionAnalysis posRevisedAlignPoints\numSample:=numAlignPointsTotal,numAlignXVariable1,numAlignIntercept\numAngleofInclination:=numAlignAngleofInclination\numSST:=numAlignSST\numSSR:=numAlignSSR\numRSquare:=numAlignRSquare;
        Logging\INFO, "XVariable1="+ValToStr(numAlignXVariable1)+", Intercept="+ValToStr(numAlignIntercept)+", AngleofInclination="+ValToStr(numAlignAngleofInclination);
        Logging\INFO, "numSST="+ValToStr(numAlignSSR)+", numSSR="+ValToStr(numAlignSSR)+", numRSquare="+ValToStr(numAlignRSquare);
        Logging\INFO, "Please double check the numGrooveAngle in IPC";

        sHeader:="AlignPositionerbyBranch"+" ("+GetTaskName()+")";
        sMsg{1}:="Do you want to update the numGrooveAngle and jointCurrent3 value?";
        sMsg{2}:="AngleofInclination="+ValToStr(numAlignAngleofInclination);
        sMsg{3}:="";
        sMsg{4}:="";
        sMsg{5}:="Press No to cancel.";
        UIMsgBox\Header:=sHeader,sMsg{1}\MsgLine2:=sMsg{2}\MsgLine3:=sMsg{3}\MsgLine4:=sMsg{4}\MsgLine5:=sMsg{5}\Buttons:=btnYesNo\Icon:=iconInfo\Result:=nAnswer;
        IF (nAnswer=resYes) THEN
            rPipeGrooveModel.numSeamNormalAngle:=numAlignAngleofInclination;
            jointCurrent3.extax.eax_b:=rPipeGrooveModel.numSeamNormalAngle;
        ENDIF

    ENDPROC

    PROC ComputeAlignPositionerTargets()
        !robtAlignPoints{1}:=robtBranchRollAngleA1byLaser;
        numAlignPointsTotal:=Trunc(numAlignPointsTotal);
        FOR i FROM 1 TO numAlignPointsTotal DO
            robtAlignPoints{i}:=robtAlignPoints{1};
            robtAlignPoints{i}.trans.x:=rPipeGrooveModel.numSeamCenterX;
            robtAlignPoints{i}.trans.y:=0-rPipeGrooveModel.numBranchDiameter/2;
            robtAlignPoints{i}.trans.z:=rPipeGrooveModel.numHeaderDiameter/2+numAlignDeviation+numAlignSpan*(i-1);
            robtAlignPoints{i}.rot:=OrientZYX(0,-90,-90);
            robtAlignPoints{i}.extax.eax_a:=numTrackRef-rPipeGrooveModel.numSeamCenterX;
        ENDFOR

    ENDPROC
ENDMODULE
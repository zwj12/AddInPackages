MODULE Template_40023_Module
    !*****************************************************
    !Module Name:   Template_40023_Module
    !Version:       1.0
    !Description:   All the targets are coordinated in its self coordinate system
    !Date:          2021-8-21
    !Author:        Michael
    !*****************************************************

    LOCAL PERS num numPartCount:=10;

    !For oframe searching            
    LOCAL PERS robtarget pQ1_X1:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_X2:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_Y1:=[[0,75,0],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_Y2:=[[0,200,0],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_Z1:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_Z2:=[[0,0,250],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_X1_Found:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_X2_Found:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_Y1_Found:=[[0,75,0],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_Y2_Found:=[[0,200,0],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_Z1_Found:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_Z2_Found:=[[0,0,250],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+9,9E+9,9E+9]];

    LOCAL PERS robtarget pQ2_X1:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_X2:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_Y1:=[[-0.03,74.99,-0.03],[0.0903086,-0.672569,0.657682,-0.327031],[-1,-1,0,1],[-800,500,456.001,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ2_Y2:=[[-0.03,200,-0.03],[0.0903092,-0.67257,0.657681,-0.327031],[-1,-1,0,1],[-800,500,456.001,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ2_Z1:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_Z2:=[[0,0,250],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_X1_Found:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_X2_Found:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_Y1_Found:=[[17.85,90.22,0.26],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ2_Y2_Found:=[[14.86,215.24,-0.11],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ2_Z1_Found:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_Z2_Found:=[[16.02,7.07,231.87],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pQ3_X1:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_X2:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_Y1:=[[0,-300,0],[0.0890947,0.615873,0.708619,0.332599],[-2,0,-1,1],[-800,-500,450.515,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ3_Y2:=[[0,-100,0],[0.0890967,0.615873,0.708619,0.332599],[-1,0,-2,1],[-800,-500,450.515,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ3_Z1:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_Z2:=[[0,0,200],[0.312194,-0.711531,-0.301209,-0.55275],[-1,0,-2,1],[-799.999,-500,536.095,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ3_X1_Found:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_X2_Found:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_Y1_Found:=[[11.1,-292.01,15.76],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ3_Y2_Found:=[[5.7,-93.68,16.15],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ3_Z1_Found:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_Z2_Found:=[[2.72,20.03,206.54],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pQ4_X1:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_X2:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_Y1:=[[0,75,0],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_Y2:=[[0,200,0],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_Z1:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_Z2:=[[0,0,250],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_X1_Found:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_X2_Found:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_Y1_Found:=[[0,75,0],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_Y2_Found:=[[0,200,0],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_Z1_Found:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_Z2_Found:=[[0,0,250],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+9,9E+9,9E+9]];

    LOCAL PERS wobjdata wobjLast:=[FALSE,TRUE,"",[[-480,0,60],[1,0,0,0]],[[2.59389,20.4005,16.3743],[1,0,0,0]]];
    LOCAL PERS pose poseFrame:=[[2.59389,20.4005,16.3743],[0.4925,0.493797,0.506428,0.507089]];
    LOCAL PERS pose poseTransform:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q1:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q2:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q3:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q4:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];

    LOCAL PERS robtarget pSearchSeam1_1:=[[-100,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,300,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam1_2:=[[-50,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,300,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam2_1:=[[0,0,75],[0.1969,0.792206,-0.328139,0.475357],[-1,-1,0,1],[-800,500,500,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam2_2:=[[0,0,150],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,500,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam3_1:=[[-100.00,0.00,0.00],[0.370619,-0.917176,-0.010609,-0.146001],[-1,0,-1,1],[-772.01,-462.973,258.768,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam3_2:=[[-50,0,0],[0.370618,-0.917177,-0.0106105,-0.146002],[-1,0,-1,1],[-772.01,-462.973,258.768,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam4_1:=[[0,0,100],[0.238663,-0.787733,-0.272532,-0.49824],[-1,0,-1,1],[-843.059,-440.815,450,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam4_2:=[[0,0,200],[0.243457,-0.745392,-0.234844,-0.574428],[-1,1,-2,1],[-843.059,-440.815,450,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam5_1:=[[-149.85,-133.12,-26.57],[0.0702846,-0.702051,-0.671304,-0.227014],[-2,0,-1,1],[-800.001,-500,456.001,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam5_2:=[[-149.86,-47.08,-26.58],[0.0619501,-0.692742,-0.686897,-0.210815],[-2,0,-1,1],[-800.001,-500,456.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam6_1:=[[0,-100,280.94],[0.189716,-0.674469,0.688069,-0.188839],[-2,-1,-3,1],[-802.082,-80.2308,-153.782,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam6_2:=[[0,100,280.94],[0.189716,-0.674468,0.68807,-0.188839],[-2,-1,-3,1],[-802.082,-80.2308,-153.782,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam7_1:=[[-156.78,140,0],[0.115185,0.681147,-0.674796,0.259657],[-1,-1,0,1],[-800.001,500,456.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam7_2:=[[-156.78,70,0],[0.115184,0.681147,-0.674796,0.259657],[-2,-1,1,1],[-800.001,500,456.002,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pSeamFound1_1:=[[-118.91,-2.44,15.7],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound1_2:=[[-69.02,-1.43,15.04],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound2_1:=[[-15.52,14.1,67.9],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound2_2:=[[-12.12,10.13,137.44],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound3_1:=[[-119.61,2.15,8.59],[0.37941,-0.915976,0.0499502,-0.12059],[-1,0,-1,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound3_2:=[[-69.5,3.02,8.47],[0.37941,-0.915976,0.0499502,-0.12059],[-1,0,-1,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound4_1:=[[-12.35,-4.19,87.6],[0.528109,-0.308093,0.759593,0.221807],[-2,0,0,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound4_2:=[[-9.45,-0.27,185.16],[0.232963,-0.732963,-0.303603,-0.562422],[-1,1,-2,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound5_1:=[[-141.65,-134.27,-2.35],[0.183013,0.612372,0.683013,0.353553],[-2,-1,-1,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound5_2:=[[-141.8,-47.06,-2.32],[0.0515551,-0.666714,-0.684629,-0.290031],[-2,0,-1,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound6_1:=[[3.46,-107.87,312.22],[0.353553,0.683013,0.612372,0.183013],[-1,0,2,1],[-800,500,0,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound6_2:=[[-0.83,92.08,310.76],[0.353553,0.683013,0.612372,0.183013],[-1,0,2,1],[-800,500,0,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound7_1:=[[-145.67,130.15,1],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,0,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound7_2:=[[-143.86,61.02,2.42],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,0,1],[-800,500,456,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pSeam1_1:=[[-132,0,0],[0.12059,-0.0499502,0.915976,-0.37941],[-1,0,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam1_2:=[[-10,0,0],[0.12059,-0.0499502,0.915976,-0.37941],[-1,0,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam2_1:=[[0,0,10],[0.232962913,0.732962913,-0.303603179,0.562422224],[-1,-1,0,1],[-800.000011921,500,480.000019073,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam2_2:=[[0.00,0.00,100.00],[0.319156,0.553743,-0.253295,0.726188],[-1,-2,1,1],[-800,500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam2_3:=[[0,0,385],[0.325934,0.549781,-0.262196,0.723022],[-1,-2,1,1],[-800,500,280,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam3_1:=[[-132,-11,0],[0.169082,-0.0700359,0.914659,0.360423],[-2,1,1,1],[-800,-500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam3_2:=[[-10,-11,0],[0.169082,-0.0700359,0.914659,0.360423],[-2,1,1,1],[-800,-500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam4_1:=[[0.00,-11.00,10.00],[0.266412,-0.657996,-0.396353,-0.582212],[-2,0,2,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam4_2:=[[0.00,-11.02,99.95],[0.287699,-0.546881,-0.304884,-0.724704],[-2,1,2,1],[-800,-500,456.003,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam4_3:=[[0,-11,390],[0.303603,-0.562422,-0.232963,-0.732963],[-2,0,3,1],[-800,-500,256,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam5_1:=[[-160.11,-151.99,-26.07],[0.297855,-0.712614,0.631299,0.0701772],[-1,0,-4,1],[-688.301,-487.405,629.411,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam5_2:=[[-160.11,-41.27,-26.07],[0.297855,-0.712614,0.631299,0.0701786],[-1,0,-4,1],[-688.301,-487.405,629.411,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam5_3:=[[-160.10,-8.51,-26.12],[0.343063,-0.705625,0.607848,0.122159],[-1,0,-4,1],[-688.3,-487.404,630.232,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam6_1:=[[-17.16,-127.70,278.75],[0.226583,-0.634706,0.673315,-0.304066],[-1,0,-4,1],[-782.589,16.5024,84.63,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam6_2:=[[-23.89,157.67,277.45],[0.226584,-0.634704,0.673316,-0.304067],[-1,0,-4,1],[-782.589,16.5021,84.63,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam7_1:=[[-138.52,159.26,-17.18],[0.283186,0.444176,0.843417,-0.105649],[-2,-1,3,1],[-799.999,500,550.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam7_2:=[[-138.52,51.18,-17.18],[0.283186,0.444176,0.843416,-0.105649],[-1,-1,3,1],[-799.999,500,550.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam7_3:=[[-138.52,17.33,-17.18],[0.333449,0.437175,0.824617,-0.13303],[-1,-1,3,1],[-799.999,500,550.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam8_1:=[[-160.11,-151.99,-26.07],[0.297855,-0.712614,0.631299,0.0701772],[-1,0,-4,1],[-688.301,-487.405,629.411,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam8_2:=[[-160.11,-41.27,-26.07],[0.297855,-0.712614,0.631299,0.0701786],[-1,0,-4,1],[-688.301,-487.405,629.411,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam8_3:=[[-160.10,-8.51,-26.12],[0.343063,-0.705625,0.607848,0.122159],[-1,0,-4,1],[-688.3,-487.404,630.232,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam9_1:=[[-17.16,-127.70,278.75],[0.226583,-0.634706,0.673315,-0.304066],[-1,0,-4,1],[-782.589,16.5024,84.63,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam9_2:=[[-23.89,157.67,277.45],[0.226584,-0.634704,0.673316,-0.304067],[-1,0,-4,1],[-782.589,16.5021,84.63,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam10_1:=[[-138.52,159.26,-17.18],[0.283186,0.444176,0.843417,-0.105649],[-2,-1,3,1],[-799.999,500,550.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam10_2:=[[-138.52,51.18,-17.18],[0.283186,0.444176,0.843416,-0.105649],[-1,-1,3,1],[-799.999,500,550.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam10_3:=[[-138.52,17.33,-17.18],[0.333449,0.437175,0.824617,-0.13303],[-1,-1,3,1],[-799.999,500,550.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam11_1:=[[-160.11,-151.99,-26.07],[0.297855,-0.712614,0.631299,0.0701772],[-1,0,-4,1],[-688.301,-487.405,629.411,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam11_2:=[[-160.11,-41.27,-26.07],[0.297855,-0.712614,0.631299,0.0701786],[-1,0,-4,1],[-688.301,-487.405,629.411,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam11_3:=[[-160.10,-8.51,-26.12],[0.343063,-0.705625,0.607848,0.122159],[-1,0,-4,1],[-688.3,-487.404,630.232,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam12_1:=[[-17.16,-127.70,278.75],[0.226583,-0.634706,0.673315,-0.304066],[-1,0,-4,1],[-782.589,16.5024,84.63,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam12_2:=[[-23.89,157.67,277.45],[0.226584,-0.634704,0.673316,-0.304067],[-1,0,-4,1],[-782.589,16.5021,84.63,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam13_1:=[[-138.52,159.26,-17.18],[0.283186,0.444176,0.843417,-0.105649],[-2,-1,3,1],[-799.999,500,550.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam13_2:=[[-138.52,51.18,-17.18],[0.283186,0.444176,0.843416,-0.105649],[-1,-1,3,1],[-799.999,500,550.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam13_3:=[[-138.52,17.33,-17.18],[0.333449,0.437175,0.824617,-0.13303],[-1,-1,3,1],[-799.999,500,550.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam14_1:=[[-160.11,-151.99,-26.07],[0.297855,-0.712614,0.631299,0.0701772],[-1,0,-4,1],[-688.301,-487.405,629.411,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam14_2:=[[-160.11,-41.27,-26.07],[0.297855,-0.712614,0.631299,0.0701786],[-1,0,-4,1],[-688.301,-487.405,629.411,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam14_3:=[[-160.10,-8.51,-26.12],[0.343063,-0.705625,0.607848,0.122159],[-1,0,-4,1],[-688.3,-487.404,630.232,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam15_1:=[[-17.16,-127.70,278.75],[0.226583,-0.634706,0.673315,-0.304066],[-1,0,-4,1],[-782.589,16.5024,84.63,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam15_2:=[[-23.89,157.67,277.45],[0.226584,-0.634704,0.673316,-0.304067],[-1,0,-4,1],[-782.589,16.5021,84.63,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam16_1:=[[-138.52,159.26,-17.18],[0.283186,0.444176,0.843417,-0.105649],[-2,-1,3,1],[-799.999,500,550.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam16_2:=[[-138.52,51.18,-17.18],[0.283186,0.444176,0.843416,-0.105649],[-1,-1,3,1],[-799.999,500,550.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam16_3:=[[-138.52,17.33,-17.18],[0.333449,0.437175,0.824617,-0.13303],[-1,-1,3,1],[-799.999,500,550.002,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pSeam22_1:=[[-129.14,5.69,-8.25],[0.264301,0.0328898,0.897292,-0.352037],[-2,-1,-2,1],[-868.532,321.366,609.384,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_2:=[[-129.14,11.40,-7.89],[0.264302,0.0328913,0.897292,-0.352036],[-2,-1,-2,1],[-868.532,321.366,609.384,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_3:=[[-129.14,11.40,-7.89],[0.2643,0.0328899,0.897292,-0.352037],[-2,-1,-2,1],[-868.532,321.366,609.384,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_4:=[[-3.53,14.97,-7.89],[0.264302,0.0328903,0.897292,-0.352036],[-2,-1,-2,1],[-868.532,321.366,609.384,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_5:=[[5.05,14.97,0.16],[0.230255,-0.095414,0.840093,-0.481791],[-2,-2,-2,1],[-868.532,321.366,609.384,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_6:=[[4.80,14.79,8.22],[0.179846,-0.248764,0.739478,-0.599119],[-1,-2,-2,1],[-868.532,321.367,609.384,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_7:=[[2.73,14.70,24.10],[0.193385,-0.238395,0.705059,-0.639266],[-1,-2,-2,1],[-868.532,321.366,609.384,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_8:=[[1.66,10.95,231.17],[0.241849,-0.192725,0.599976,-0.737831],[-1,-2,-2,1],[-868.532,321.366,609.384,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_1:=[[-150.68,-1.78,-2.10],[0.233971,-0.156912,0.908916,0.307422],[-2,-2,0,1],[-620.302,-450.925,530.56,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_2:=[[-150.68,-6.87,-2.10],[0.188076,-0.0217242,0.928382,0.319784],[-2,-1,-1,1],[-620.302,-450.925,530.56,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_3:=[[-150.68,-6.87,-2.10],[0.188076,-0.0217242,0.928382,0.319784],[-2,-1,-1,1],[-620.302,-450.926,530.56,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_4:=[[-26.96,-6.91,-2.24],[0.167475,0.0343632,0.920224,0.352078],[-2,-1,-2,1],[-620.302,-450.925,530.56,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_5:=[[-18.45,-2.23,2.52],[0.207648,0.194404,0.808281,0.51553],[-2,-2,0,1],[-620.301,-450.925,530.559,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_6:=[[-14.54,-4.16,11.63],[0.189079,0.227223,0.785209,0.544119],[-2,-2,0,1],[-620.301,-450.925,530.559,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_7:=[[-16.40,-2.75,28.99],[0.184447,0.213861,0.770719,0.57117],[-2,-2,0,1],[-620.301,-450.925,530.559,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_8:=[[-20.97,-4.52,232.97],[0.210624,0.202221,0.610609,0.736139],[-2,-2,0,1],[-620.301,-450.925,530.559,9E+09,9E+09,9E+09]];

    !Only used to compensate Absolute Accuracy Offset
    LOCAL PERS pos posAOSeam1_1:=[0,0,0];
    LOCAL PERS pos posAOSeam1_2:=[0,0,0];
    LOCAL PERS pos posAOSeam2_1:=[0,-2,0];
    LOCAL PERS pos posAOSeam2_2:=[0,-2,0];
    LOCAL PERS pos posAOSeam2_3:=[6,0,0];
    LOCAL PERS pos posAOSeam3_1:=[4,0,-6];
    LOCAL PERS pos posAOSeam3_2:=[0,-6,0];
    LOCAL PERS pos posAOSeam4_1:=[-2,3,0];
    LOCAL PERS pos posAOSeam4_2:=[-1,6,0];
    LOCAL PERS pos posAOSeam4_3:=[0,10,0];
    LOCAL PERS pos posAOSeam5_1:=[-16,-4,-25];
    LOCAL PERS pos posAOSeam5_2:=[-16,-4,-25];
    LOCAL PERS pos posAOSeam5_3:=[-16,0,-25];
    LOCAL PERS pos posAOSeam6_1:=[-15,-23,-10];
    LOCAL PERS pos posAOSeam6_2:=[-15,-23,-10];
    LOCAL PERS pos posAOSeam7_1:=[-3,-14,-15];
    LOCAL PERS pos posAOSeam7_2:=[-3,-15,-18];
    LOCAL PERS pos posAOSeam7_3:=[-3,-15,-15];
    LOCAL PERS pos posAOSeam8_1:=[-16,-4,-25];
    LOCAL PERS pos posAOSeam8_2:=[-16,-4,-25];
    LOCAL PERS pos posAOSeam8_3:=[-16,0,-25];
    LOCAL PERS pos posAOSeam9_1:=[-15,-23,-10];
    LOCAL PERS pos posAOSeam9_2:=[-15,-23,-10];
    LOCAL PERS pos posAOSeam10_1:=[-3,-14,-15];
    LOCAL PERS pos posAOSeam10_2:=[-3,-15,-18];
    LOCAL PERS pos posAOSeam10_3:=[-3,-15,-15];
    LOCAL PERS pos posAOSeam11_1:=[-16,-4,-25];
    LOCAL PERS pos posAOSeam11_2:=[-16,-4,-25];
    LOCAL PERS pos posAOSeam11_3:=[-16,0,-25];
    LOCAL PERS pos posAOSeam12_1:=[-15,-23,-10];
    LOCAL PERS pos posAOSeam12_2:=[-15,-23,-10];
    LOCAL PERS pos posAOSeam13_1:=[-3,-14,-15];
    LOCAL PERS pos posAOSeam13_2:=[-3,-15,-18];
    LOCAL PERS pos posAOSeam13_3:=[-3,-15,-15];
    LOCAL PERS pos posAOSeam14_1:=[-16,-4,-25];
    LOCAL PERS pos posAOSeam14_2:=[-16,-4,-25];
    LOCAL PERS pos posAOSeam14_3:=[-16,0,-25];
    LOCAL PERS pos posAOSeam15_1:=[-15,-23,-10];
    LOCAL PERS pos posAOSeam15_2:=[-15,-23,-10];
    LOCAL PERS pos posAOSeam16_1:=[-3,-14,-15];
    LOCAL PERS pos posAOSeam16_2:=[-3,-15,-18];
    LOCAL PERS pos posAOSeam16_3:=[-3,-15,-15];

    LOCAL PERS pos posAOSeam22_1:=[-2,1,-17];
    LOCAL PERS pos posAOSeam22_2:=[10,2,-16];
    LOCAL PERS pos posAOSeam22_3:=[12,2,-16];
    LOCAL PERS pos posAOSeam22_4:=[-10,1,-12];
    LOCAL PERS pos posAOSeam22_5:=[6,0,-5];
    LOCAL PERS pos posAOSeam22_6:=[20,0,13];
    LOCAL PERS pos posAOSeam22_7:=[18,-13,20];
    LOCAL PERS pos posAOSeam22_8:=[5,0,0];
    LOCAL PERS pos posAOSeam23_1:=[-5,3,-2];
    LOCAL PERS pos posAOSeam23_2:=[3,-1,-5];
    LOCAL PERS pos posAOSeam23_3:=[8,-1,-8];
    LOCAL PERS pos posAOSeam23_4:=[-29,0,-8];
    LOCAL PERS pos posAOSeam23_5:=[-10,3,0];
    LOCAL PERS pos posAOSeam23_6:=[-3,3,10];
    LOCAL PERS pos posAOSeam23_7:=[-4,15,5];
    LOCAL PERS pos posAOSeam23_8:=[-14,7,0];

    !Used for PDispSet
    LOCAL PERS pose peSeam1_1:=[[0.155304,-6.36427,1.11146],[1,0,0,0]];
    LOCAL PERS pose peSeam1_2:=[[0.0753555,-3.29217,1.66705],[1,0,0,0]];
    LOCAL PERS pose peSeam2_1:=[[0.607692,-1.74091,0.0125351],[1,0,0,0]];
    LOCAL PERS pose peSeam2_2:=[[-1.0559,-2.19269,-0.0204926],[1,0,0,0]];
    LOCAL PERS pose peSeam2_3:=[[-0.32395,-1.62331,-0.125092],[1,0,0,0]];
    LOCAL PERS pose peSeam3_1:=[[4.12688,-4.41331,-8.79105],[1,0,0,0]];
    LOCAL PERS pose peSeam3_2:=[[0.0145874,-6.72514,-3.08223],[1,0,0,0]];
    LOCAL PERS pose peSeam4_1:=[[-8.09118,3.01741,-0.0262299],[1,0,0,0]];
    LOCAL PERS pose peSeam4_2:=[[-7.48061,5.27455,-0.0342102],[1,0,0,0]];
    LOCAL PERS pose peSeam4_3:=[[-7.73635,6.79469,-0.0606995],[1,0,0,0]];
    LOCAL PERS pose peSeam5_1:=[[2.49045,-3.97635,-1.28609],[1,0,0,0]];
    LOCAL PERS pose peSeam5_2:=[[2.3,-3.9767,-1.248],[1,0,0,0]];
    LOCAL PERS pose peSeam5_3:=[[2.23366,0.0231609,-1.18673],[1,0,0,0]];
    LOCAL PERS pose peSeam6_1:=[[6.03051,-22.3034,23.6097],[1,0,0,0]];
    LOCAL PERS pose peSeam6_2:=[[6.63764,-22.2961,22.8259],[1,0,0,0]];
    LOCAL PERS pose peSeam7_1:=[[-10.9162,-13.8462,2.57889],[1,0,0,0]];
    LOCAL PERS pose peSeam7_2:=[[-8.08952,-14.7266,1.79651],[1,0,0,0]];
    LOCAL PERS pose peSeam7_3:=[[-7.20422,-14.6892,5.49105],[1,0,0,0]];
    LOCAL PERS pose peSeam8_1:=[[2.49045,-3.97635,-1.28609],[1,0,0,0]];
    LOCAL PERS pose peSeam8_2:=[[2.3,-3.9767,-1.248],[1,0,0,0]];
    LOCAL PERS pose peSeam8_3:=[[2.23366,0.0231609,-1.18673],[1,0,0,0]];
    LOCAL PERS pose peSeam9_1:=[[6.03051,-22.3034,23.6097],[1,0,0,0]];
    LOCAL PERS pose peSeam9_2:=[[6.63764,-22.2961,22.8259],[1,0,0,0]];
    LOCAL PERS pose peSeam10_1:=[[-10.9162,-13.8462,2.57889],[1,0,0,0]];
    LOCAL PERS pose peSeam10_2:=[[-8.08952,-14.7266,1.79651],[1,0,0,0]];
    LOCAL PERS pose peSeam10_3:=[[-7.20422,-14.6892,5.49105],[1,0,0,0]];
    LOCAL PERS pose peSeam11_1:=[[2.49045,-3.97635,-1.28609],[1,0,0,0]];
    LOCAL PERS pose peSeam11_2:=[[2.3,-3.9767,-1.248],[1,0,0,0]];
    LOCAL PERS pose peSeam11_3:=[[2.23366,0.0231609,-1.18673],[1,0,0,0]];
    LOCAL PERS pose peSeam12_1:=[[6.03051,-22.3034,23.6097],[1,0,0,0]];
    LOCAL PERS pose peSeam12_2:=[[6.63764,-22.2961,22.8259],[1,0,0,0]];
    LOCAL PERS pose peSeam13_1:=[[-10.9162,-13.8462,2.57889],[1,0,0,0]];
    LOCAL PERS pose peSeam13_2:=[[-8.08952,-14.7266,1.79651],[1,0,0,0]];
    LOCAL PERS pose peSeam13_3:=[[-7.20422,-14.6892,5.49105],[1,0,0,0]];
    LOCAL PERS pose peSeam14_1:=[[2.49045,-3.97635,-1.28609],[1,0,0,0]];
    LOCAL PERS pose peSeam14_2:=[[2.3,-3.9767,-1.248],[1,0,0,0]];
    LOCAL PERS pose peSeam14_3:=[[2.23366,0.0231609,-1.18673],[1,0,0,0]];
    LOCAL PERS pose peSeam15_1:=[[6.03051,-22.3034,23.6097],[1,0,0,0]];
    LOCAL PERS pose peSeam15_2:=[[6.63764,-22.2961,22.8259],[1,0,0,0]];
    LOCAL PERS pose peSeam16_1:=[[-10.9162,-13.8462,2.57889],[1,0,0,0]];
    LOCAL PERS pose peSeam16_2:=[[-8.08952,-14.7266,1.79651],[1,0,0,0]];
    LOCAL PERS pose peSeam16_3:=[[-7.20422,-14.6892,5.49105],[1,0,0,0]];

    LOCAL PERS pose peSeam22_1:=[[-1.51288,-7.32724,7.07889],[1,0,0,0]];
    LOCAL PERS pose peSeam22_2:=[[10.5979,-12.035,7.71742],[1,0,0,0]];
    LOCAL PERS pose peSeam22_3:=[[12.5979,-12.035,7.71742],[1,0,0,0]];
    LOCAL PERS pose peSeam22_4:=[[-25.6487,-14.0621,10.0557],[1,0,0,0]];
    LOCAL PERS pose peSeam22_5:=[[-17.8169,-14.8907,8.8937],[1,0,0,0]];
    LOCAL PERS pose peSeam22_6:=[[-3.17514,-14.718,18.8385],[1,0,0,0]];
    LOCAL PERS pose peSeam22_7:=[[-2.33776,-11.1622,21.0993],[1,0,0,0]];
    LOCAL PERS pose peSeam22_8:=[[-4.19255,-6.17652,0.0968475],[1,0,0,0]];
    LOCAL PERS pose peSeam23_1:=[[-5.03308,6.38999,8.76448],[1,0,0,0]];
    LOCAL PERS pose peSeam23_2:=[[2.7123,6.57578,5.11677],[1,0,0,0]];
    LOCAL PERS pose peSeam23_3:=[[7.7123,6.57578,2.11677],[1,0,0,0]];
    LOCAL PERS pose peSeam23_4:=[[-18.6502,11.7154,2.70131],[1,0,0,0]];
    LOCAL PERS pose peSeam23_5:=[[-8.00854,10.3231,5.9725],[1,0,0,0]];
    LOCAL PERS pose peSeam23_6:=[[-4.65117,12.3816,6.87644],[1,0,0,0]];
    LOCAL PERS pose peSeam23_7:=[[-3.28387,10.9764,5.13492],[1,0,0,0]];
    LOCAL PERS pose peSeam23_8:=[[-2.75911,12.6234,-0.54715],[1,0,0,0]];

    !Only for local welding parameters
    LOCAL PERS welddata weld_1:=[6,0,[38,0,-1,0,0,350,0,0,0],[0,0,0,0,0,0,0,0,0]];
    LOCAL PERS weavedata weave_1:=[1,0,4,6,0,0,0,0,0,0,0,0,0,0,0];
    LOCAL PERS trackdata track_1:=[0,TRUE,50,[0,30,30,0,0,0,0,0,0],[0,0,0,0,0,0,0]];

    !wobjCurrent must be set correctly
    !extOffsetCurrent must be set correctly
    PROC Template_40023()
        Logging "Start to run Template_40023...";
        SetGO Go112_WeldCompleted,0;
        SetGO Go80_WeldingStatus,0;

        IF boolEnableGantryOffset THEN
            LoadGantryOffset;
        ENDIF

        MoveToReadyQuadrant 3;
        IF boolEnableSearch THEN
            SearchAndProcess;
        ENDIF

        !WeldSeam 23;
        MoveToReadyQuadrant 3;

        MoveToReadyQuadrant 2;
        !WeldSeam 22;
        WeldSeam 7;
        MoveToReadyQuadrant 2;

        MoveToReadyQuadrant 3;
        WeldSeam 6;
        WeldSeam 5;
        MoveToReadyQuadrant 3;

        MoveToReadyQuadrant 2;
        WeldSeam 10;
        MoveToReadyQuadrant 2;

        MoveToReadyQuadrant 3;
        WeldSeam 9;
        WeldSeam 8;
        MoveToReadyQuadrant 3;

        MoveToReadyQuadrant 2;
        WeldSeam 13;
        MoveToReadyQuadrant 2;

        MoveToReadyQuadrant 3;
        WeldSeam 12;
        WeldSeam 11;
        MoveToReadyQuadrant 3;

        MoveToReadyQuadrant 2;
        WeldSeam 16;
        MoveToReadyQuadrant 2;

        MoveToReadyQuadrant 3;
        WeldSeam 15;
        WeldSeam 14;
        MoveToReadyQuadrant 3;

        EOffsOff;
        Incr numPartCount;
        Logging "Template_40023 is done";

    UNDO
        EOffsOff;
    ENDPROC

    !1 - Search the fine oframe
    !2 - Search the seam offset if needed
    LOCAL PROC SearchAndProcess()
        SearchOframe;
        !SearchFeaturePoint;
        !ProcessFeaturePoint;
    ENDPROC

    LOCAL PROC SearchFeaturePoint()
        Logging "SearchFeaturePoint";
        MoveAbsJ [[-0.442793,-43.1611,0,20,-65.6482,0],[-500,500,0,9E+09,9E+09,9E+09]],speedAir,fine,toolLaser\WObj:=wobjCurrent;
        MoveJ pSearchSeam1_1,speedAproach,fine,toolLaser\WObj:=wobjCurrent;
        MoveJ pSearchSeam1_2,speedAproach,fine,toolLaser\WObj:=wobjCurrent;
    ENDPROC

    LOCAL PROC ProcessFeaturePoint()
        Logging "ProcessFeaturePoint";
        pSeam1_1.trans.y:=pSearchSeam1_1.trans.y;
        pSeam1_1.trans.z:=pSearchSeam1_1.trans.z;
        pSeam1_2.trans.y:=pSearchSeam1_2.trans.y;
        pSeam1_2.trans.z:=pSearchSeam1_2.trans.z;

    ENDPROC

    LOCAL PROC SearchOframe()
        Logging "Search oframe";
        wobjCurrent.oframe:=[[0,0,0],[1,0,0,0]];

        MoveAbsJ [[-69.8437,-39.8871,45.8877,34.3389,-62.4823,-125.956],[-800,-500,450.515,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pQ3_Y1_Found,pQ3_Y1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pQ3_Y2_Found,pQ3_Y2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-105.635,-11.9899,28.2629,12.7016,-67.9619,-83.0548],[-800,-500,450.515,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        !MoveAbsJ [[-89.7306,-43.1368,0,-20,-65.7254,9.9994],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        !ScanSeamByLaser pQ3_X1_Found,pQ3_X1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        !ScanSeamByLaser pQ3_X2_Found,pQ3_X2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        !MoveAbsJ [[-89.7306,-43.1368,0,-20,-65.7254,9.9994],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        !MoveAbsJ [[-92.7971,-23.7414,5.96932,0,-45.8213,6.36111E-15],[-800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        !ScanSeamByLaser pQ3_Z1_Found,pQ3_Z1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-82.9996,-9.5199,18.4753,48.6046,-79.0996,-98.8539],[-799.999,-500,477.382,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pQ3_Z2_Found,pQ3_Z2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-60.1153,-30.9719,-3.96374,87.039,-55.3627,-100.045],[-799.999,-502.261,250.103,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        !Search YPXN in Wobj0
        poseTransform.rot:=OrientZYX(-90,0,0);
        !Search YPZP in Wobj0
        poseTransform.rot:=OrientZYX(0,-90,-90);

        poseTransform_Q3:=poseTransform;

        poseFrame:=DefFrame(pQ3_Y1_Found,pQ3_Y2_Found,pQ3_Z2_Found\Origin:=3);
        Logging "poseFrame.trans:="+ValToStr(poseFrame.trans);
        Logging "poseFrame.rot:="+GetEulerAngleString(poseFrame.rot);
        wobjCurrent.oframe:=PoseMult(poseFrame,poseTransform);
        !wobjCurrent.oframe.trans:=[0,0,0];
        wobjCurrent.oframe.rot:=[1,0,0,0];
        Logging "oframe.trans:="+ValToStr(wobjCurrent.oframe.trans);
        Logging "oframe.rot:="+GetEulerAngleString(wobjCurrent.oframe.rot);

        wobjLast:=wobjCurrent;
        WriteSysDataLog "Template_40023";

    ENDPROC

    LOCAL PROC WeldSeam(num numSeamIndex)
        VAR dnum dnumWeldSeamStatus;

        dnumWeldSeamStatus:=GOutputDnum(Go112_WeldCompleted);
        BitClear dnumWeldSeamStatus,numSeamIndex;
        SetGO Go112_WeldCompleted,dnumWeldSeamStatus;
        SetGO Go80_WeldingStatus,pow(2,numSeamIndex-1);
        %"Seam_"+ValToStr(numSeamIndex)%;
        SetGO Go80_WeldingStatus,0;
        BitSet dnumWeldSeamStatus,numSeamIndex;
        SetGO Go112_WeldCompleted,dnumWeldSeamStatus;

    ENDPROC

    LOCAL PROC Seam_5()
        MoveAbsJ [[-90,-45.3776,29.7093,-26.0507,-60,-89.658],[-800.001,-500,1.11759E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound5_1,pSearchSeam5_1,scanJoint5,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound5_2,pSearchSeam5_2,scanJoint5,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-104.932,9.17494,12.2382,11.0023,-93.0149,-122.229],[-1080.49,-543.439,154.12,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[-37.8693,-17.9691,-8.12652,52.6918,-71.0129,-293.141],[-861.883,-372.755,244.084,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam5_1,posAOSeam5_1,pSeam5_1,pSeamFound5_1,pSeamFound5_2;
        MoveJ GetAproachTarget(pSeam5_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam5_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam5_2,posAOSeam5_2,pSeam5_2,pSeamFound5_1,pSeamFound5_2;
        ArcL pSeam5_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam5_3,posAOSeam5_3,pSeam5_3,pSeamFound5_1,pSeamFound5_2;
        ArcLEnd pSeam5_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam5_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-41.0418,-31.5876,26.0872,55.1135,-96.0722,-271.732],[-1052.23,-501.078,28.2565,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_8()
        MoveAbsJ [[-71.556,-47.9334,28.2436,31.7192,-45.8965,-223.034],[-962.587,-574.971,78.9099,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam8_1,posAOSeam8_1,pSeam8_1,pSeamFound5_1,pSeamFound5_2;
        MoveJ GetAproachTarget(pSeam8_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam8_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam8_2,posAOSeam8_2,pSeam8_2,pSeamFound5_1,pSeamFound5_2;
        ArcL pSeam8_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam8_3,posAOSeam8_3,pSeam8_3,pSeamFound5_1,pSeamFound5_2;
        ArcLEnd pSeam8_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam8_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-41.0418,-31.5876,26.0872,55.1135,-96.0722,-271.732],[-1052.23,-501.078,28.2565,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_11()
        MoveAbsJ [[-90.0958,-51.82,19.8196,31.233,-19.0313,-205.181],[-1001.63,-502.947,-7.06924,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam11_1,posAOSeam11_1,pSeam11_1,pSeamFound5_1,pSeamFound5_2;
        MoveJ GetAproachTarget(pSeam11_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam11_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam11_2,posAOSeam11_2,pSeam11_2,pSeamFound5_1,pSeamFound5_2;
        ArcL pSeam11_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam11_3,posAOSeam11_3,pSeam11_3,pSeamFound5_1,pSeamFound5_2;
        ArcLEnd pSeam11_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam11_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-41.0418,-31.5876,26.0872,55.1135,-96.0722,-271.732],[-1052.23,-501.078,28.2565,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_14()
        MoveAbsJ [[-91.7336,-51.0976,19.6248,30.665,-17.9291,-207.595],[-994.15,-506.227,-10.8218,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam14_1,posAOSeam14_1,pSeam14_1,pSeamFound5_1,pSeamFound5_2;
        MoveJ GetAproachTarget(pSeam14_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam14_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam14_2,posAOSeam14_2,pSeam14_2,pSeamFound5_1,pSeamFound5_2;
        ArcL pSeam14_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam14_3,posAOSeam14_3,pSeam14_3,pSeamFound5_1,pSeamFound5_2;
        ArcLEnd pSeam14_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam14_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-41.0418,-31.5876,26.0872,55.1135,-96.0722,-271.732],[-1052.23,-501.078,28.2565,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_6()
        MoveAbsJ [[-15.2629,-48.9582,13.634,59.9236,-44.6367,-377.918],[-813.209,-80.2299,-176.579,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound6_1,pSearchSeam6_1,scanJoint6,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound6_2,pSearchSeam6_2,scanJoint6,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-124.654,-47.1903,1.04579,-45.7171,-24.4711,-195.227],[-802.082,-80.2308,-153.782,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[-33.5777,-14.1948,-7.14305,31.9006,-54.7255,-329.895],[-974.292,26.6024,-153.782,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam6_1,posAOSeam6_1,pSeam6_1,pSeamFound6_1,pSeamFound6_2;
        MoveJ GetAproachTarget(pSeam6_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam6_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam6_2,posAOSeam6_2,pSeam6_2,pSeamFound6_1,pSeamFound6_2;
        ArcLEnd pSeam6_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam6_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-95.2212,-57.4908,23.9722,28.9891,-13.2344,-189.739],[-1030.97,16.5018,-37.1456,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_9()
        MoveAbsJ [[-33.5777,-14.1948,-7.14305,31.9006,-54.7255,-329.895],[-974.292,26.6024,-153.782,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam9_1,posAOSeam9_1,pSeam9_1,pSeamFound6_1,pSeamFound6_2;
        MoveJ GetAproachTarget(pSeam9_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam9_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam9_2,posAOSeam9_2,pSeam9_2,pSeamFound6_1,pSeamFound6_2;
        ArcLEnd pSeam9_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam9_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-95.2212,-57.4908,23.9722,28.9891,-13.2344,-189.739],[-1030.97,16.5018,-37.1456,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_12()
        MoveAbsJ [[-33.5777,-14.1948,-7.14305,31.9006,-54.7255,-329.895],[-974.292,26.6024,-153.782,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam12_1,posAOSeam12_1,pSeam12_1,pSeamFound6_1,pSeamFound6_2;
        MoveJ GetAproachTarget(pSeam12_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam12_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam12_2,posAOSeam12_2,pSeam12_2,pSeamFound6_1,pSeamFound6_2;
        ArcLEnd pSeam12_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam12_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-95.2212,-57.4908,23.9722,28.9891,-13.2344,-189.739],[-1030.97,16.5018,-37.1456,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_15()
        MoveAbsJ [[-33.5777,-14.1948,-7.14305,31.9006,-54.7255,-329.895],[-974.292,26.6024,-153.782,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam15_1,posAOSeam15_1,pSeam15_1,pSeamFound6_1,pSeamFound6_2;
        MoveJ GetAproachTarget(pSeam15_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam15_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam15_2,posAOSeam15_2,pSeam15_2,pSeamFound6_1,pSeamFound6_2;
        ArcLEnd pSeam15_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam15_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-95.2212,-57.4908,23.9722,28.9891,-13.2344,-189.739],[-1030.97,16.5018,-37.1456,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_7()
        MoveAbsJ [[-46.062,-60,29.8365,31.1131,-33.8128,32.5521],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound7_1,pSearchSeam7_1,scanJoint7,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound7_2,pSearchSeam7_2,scanJoint7,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-46.062,-60,29.8365,31.1131,-33.8128,32.5521],[-800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[-57.8525,-46.5622,23.0288,10.0453,-41.145,3.82011],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam7_1,posAOSeam7_1,pSeam7_1,pSeamFound7_1,pSeamFound7_2;
        MoveJ GetAproachTarget(pSeam7_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam7_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam7_2,posAOSeam7_2,pSeam7_2,pSeamFound7_1,pSeamFound7_2;
        ArcL pSeam7_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam7_3,posAOSeam7_3,pSeam7_3,pSeamFound7_1,pSeamFound7_2;
        ArcLEnd pSeam7_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam7_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-57.8525,-46.5622,23.0288,10.0453,-41.145,3.82011],[-800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_10()
        MoveAbsJ [[-57.8525,-46.5622,23.0288,10.0453,-41.145,3.82011],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam10_1,posAOSeam10_1,pSeam10_1,pSeamFound7_1,pSeamFound7_2;
        MoveJ GetAproachTarget(pSeam10_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam10_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam10_2,posAOSeam10_2,pSeam10_2,pSeamFound7_1,pSeamFound7_2;
        ArcL pSeam10_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam10_3,posAOSeam10_3,pSeam10_3,pSeamFound7_1,pSeamFound7_2;
        ArcLEnd pSeam10_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam10_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-57.8525,-46.5622,23.0288,10.0453,-41.145,3.82011],[-800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_13()
        MoveAbsJ [[-57.8525,-46.5622,23.0288,10.0453,-41.145,3.82011],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam13_1,posAOSeam13_1,pSeam13_1,pSeamFound7_1,pSeamFound7_2;
        MoveJ GetAproachTarget(pSeam13_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam13_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam13_2,posAOSeam13_2,pSeam13_2,pSeamFound7_1,pSeamFound7_2;
        ArcL pSeam13_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam13_3,posAOSeam13_3,pSeam13_3,pSeamFound7_1,pSeamFound7_2;
        ArcLEnd pSeam13_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam13_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-57.8525,-46.5622,23.0288,10.0453,-41.145,3.82011],[-800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_16()
        MoveAbsJ [[-57.8525,-46.5622,23.0288,10.0453,-41.145,3.82011],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam16_1,posAOSeam16_1,pSeam16_1,pSeamFound7_1,pSeamFound7_2;
        MoveJ GetAproachTarget(pSeam16_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam16_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam16_2,posAOSeam16_2,pSeam16_2,pSeamFound7_1,pSeamFound7_2;
        ArcL pSeam16_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam16_3,posAOSeam16_3,pSeam16_3,pSeamFound7_1,pSeamFound7_2;
        ArcLEnd pSeam16_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam16_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-57.8525,-46.5622,23.0288,10.0453,-41.145,3.82011],[-800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_22()
        !MoveAbsJ jointReadyQuadrant2, speedAir, zoneAir, toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-89.7306,-26.803,-5.92105E-05,-2.60201,-65.7253,-29.8671],[-800,500,-228.305,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound1_1,pSearchSeam1_1,scanJoint1,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound1_2,pSearchSeam1_2,scanJoint1,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-97.5864,-6.70666,2.93768,-53.9323,-60.6038,57.0214],[-800,500,450.693,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound2_1,pSearchSeam2_1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound2_2,pSearchSeam2_2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-103.244,-30.2741,-0.893874,-47.9194,-28.3413,-9.01765E-05],[-799.998,500.001,207.46,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[-140.85,-47.5345,7.2376,-70.3767,-48.7358,-116.989],[-884.451,488.954,294.348,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam22_1,posAOSeam22_1,pSeam22_1,pSeamFound1_1,pSeamFound1_2;
        MoveJ GetAproachTarget(pSeam22_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam22_1,speedAproach,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam22_2,posAOSeam22_2,pSeam22_2,pSeamFound1_1,pSeamFound1_2;
        ArcL pSeam22_2,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\X\Y\Z,peSeam22_3,posAOSeam22_3,pSeam22_3,pSeamFound1_1,pSeamFound1_2;
        ArcL pSeam22_3,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam22_4,posAOSeam22_4,pSeam22_4,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X,peSeam22_4,posAOSeam22_4,pSeam22_4,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam22_4,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam22_5,posAOSeam22_5,pSeam22_5,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X,peSeam22_5,posAOSeam22_5,pSeam22_5,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam22_5,speedAproach,seamShared,weldShared_6\Weave:=weaveShared_6,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_7;
        RefreshDisp\Y\Z,peSeam22_6,posAOSeam22_6,pSeam22_6,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X,peSeam22_6,posAOSeam22_6,pSeam22_6,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam22_6,speedWeld,seamShared,weldShared_6\Weave:=weaveShared_6,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_7;
        RefreshDisp\X\Y\Z,peSeam22_7,posAOSeam22_7,pSeam22_7,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam22_7,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        RefreshDisp\X\Y\Z,peSeam22_8,posAOSeam22_8,pSeam22_8,pSeamFound2_1,pSeamFound2_2;
        ArcLEnd pSeam22_8,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        MoveL GetAproachTarget(pSeam22_8),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !MoveJ GetAproachTarget(pSeam22_8),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-93.71,-37.8293,-37.0417,-141.001,-53.8819,-121.31],[-868.532,467.011,268.65,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveAbsJ [[-109.6,-44.2229,-33.4861,-140.509,-9.35891,15.4808],[-856.746,472.685,-140.279,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !MoveAbsJ jointReadyQuadrant2, speedAir, zoneAir, toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_23()
        !Stop;
        MoveAbsJ [[-84.5075,-23.447,11.5827,21.453,-56.8284,-14.8627],[-772.01,-462.973,258.768,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound3_1,pSearchSeam3_1,scanJoint3,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound3_2,pSearchSeam3_2,scanJoint3,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-86.827,-23.9992,11.9199,34.1856,-65.0957,-55.2315],[-772.009,-462.974,258.768,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound4_1,pSearchSeam4_1,scanJoint4,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound4_2,pSearchSeam4_2,scanJoint4,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-86.6429,-29.4795,-18.9519,66.6832,-22.4893,-113.396],[-843.059,-447.109,78.1805,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[-109.945,-41.7575,-11.1631,-53.5774,-22.7197,-68.5669],[-750.614,-448.692,-91.2371,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam23_1,posAOSeam23_1,pSeam23_1,pSeamFound3_1,pSeamFound3_2;
        MoveJ GetAproachTarget(pSeam23_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam23_1,speedAproach,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam23_2,posAOSeam23_2,pSeam23_2,pSeamFound3_1,pSeamFound3_2;
        ArcL pSeam23_2,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\X\Y\Z,peSeam23_3,posAOSeam23_3,pSeam23_3,pSeamFound3_1,pSeamFound3_2;
        ArcL pSeam23_3,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam23_4,posAOSeam23_4,pSeam23_4,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X,peSeam23_4,posAOSeam23_4,pSeam23_4,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam23_4,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam23_5,posAOSeam23_5,pSeam23_5,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X,peSeam23_5,posAOSeam23_5,pSeam23_5,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam23_5,speedAproach,seamShared,weldShared_7\Weave:=weaveShared_7,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_6;
        RefreshDisp\Y\Z,peSeam23_6,posAOSeam23_6,pSeam23_6,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X,peSeam23_6,posAOSeam23_6,pSeam23_6,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam23_6,speedWeld,seamShared,weldShared_7\Weave:=weaveShared_7,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_6;
        RefreshDisp\X\Y\Z,peSeam23_7,posAOSeam23_7,pSeam23_7,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam23_7,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        RefreshDisp\X\Y\Z,peSeam23_8,posAOSeam23_8,pSeam23_8,pSeamFound4_1,pSeamFound4_2;
        ArcLEnd pSeam23_8,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        MoveL GetAproachTarget(pSeam23_8),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !MoveJ GetAproachTarget(pSeam23_8),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-158.788,-56.6875,-20.8843,-140.21,-49.1573,77.6079],[-620.301,-450.925,279.781,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

ENDMODULE
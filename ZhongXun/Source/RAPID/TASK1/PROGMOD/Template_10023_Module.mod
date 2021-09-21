MODULE Template_10023_Module
    !*****************************************************
    !Module Name:   Template_10023_Module
    !Version:       1.0
    !Description:   All the targets are coordinated in its self coordinate system
    !Date:          2021-8-11
    !Author:        Michael
    !*****************************************************

    !2021-8-20, Michael, Add wobjLast

    LOCAL PERS num numPartCount:=7;

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
    LOCAL PERS robtarget pQ3_Y1:=[[0,75,0],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_Y2:=[[0,200,0],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_Z1:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_Z2:=[[0,0,250],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_X1_Found:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_X2_Found:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_Y1_Found:=[[0,75,0],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_Y2_Found:=[[0,200,0],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_Z1_Found:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ3_Z2_Found:=[[0,0,250],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+9,9E+9,9E+9]];

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

    LOCAL PERS wobjdata wobjLast:=[FALSE,TRUE,"",[[-513,-36,67],[1,0,0,0]],[[-26.6848,-26.3847,-11.3046],[1,0,0,0]]];
    LOCAL PERS pose poseFrame:=[[19.8528,6.47694,0.50784],[0.498786,0.48914,0.502487,0.509373]];
    LOCAL PERS pose poseTransform:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q1:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q2:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q3:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q4:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];

    LOCAL PERS robtarget pSearchSeam1_1:=[[-100,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,4,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam1_2:=[[-25,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,4,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam2_1:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,3,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam2_2:=[[0,0,250],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSearchSeam3_1:=[[-100,-11,0],[0.379409523,-0.915975615,0.049950211,-0.120590477],[-1,0,-1,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam3_2:=[[-25,-11,0],[0.379409523,-0.915975615,0.049950211,-0.120590477],[-1,0,-1,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam4_1:=[[0,-11,50],[0.528109,-0.308093,0.759593,0.221807],[-2,0,0,1],[-800,-500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSearchSeam4_2:=[[0,-11,250],[0.232963,-0.732963,-0.303603,-0.562422],[-1,1,2,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam5_1:=[[-143.5,-25,0],[0.051556,-0.666714,-0.684628,-0.290031],[-2,0,3,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam5_2:=[[-143.5,-125,0],[0.0515572,-0.666714,-0.684629,-0.290031],[-2,0,3,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam6_1:=[[0.00,-116.94,434.86],[0.353553,0.683013,0.612372,0.183013],[-1,0,2,1],[-800,500,-0.00013411,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam6_2:=[[0.00,125.00,432.02],[0.353552,0.683013,0.612373,0.183012],[-1,0,2,1],[-800,500,-0.00013411,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam7_1:=[[-156.56,23.99,-0.01],[0.0113895,0.681242,-0.666782,0.301962],[-1,-1,0,1],[-800,500,456.001,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam7_2:=[[-156,100,0],[0.0113914,0.681237,-0.666784,0.30197],[-1,-1,0,1],[-800,500,456,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pSeamFound1_1:=[[-114.47,-4.98,-0.93],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound1_2:=[[-39.99,-2.74,-0.22],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound2_1:=[[-0.88,1.28,65.86],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound2_2:=[[-4.06,0.68,235.27],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound3_1:=[[-115.57,-14.92,-2.83],[0.37941,-0.915976,0.0499502,-0.12059],[-1,0,-1,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound3_2:=[[-40.22,-12.64,-3.01],[0.37941,-0.915976,0.0499502,-0.12059],[-1,0,-1,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound4_1:=[[-6.34,-11.47,67.44],[0.528109,-0.308093,0.759593,0.221807],[-2,0,0,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound4_2:=[[-7.07,-12.9,236.04],[0.232963,-0.732963,-0.303603,-0.562422],[-1,1,-2,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound5_1:=[[-143.73,-40.22,-3.44],[0.183013,0.612372,0.683013,0.353553],[-2,-1,-1,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound5_2:=[[-141.05,-139.63,-3.99],[0.0515551,-0.666714,-0.684629,-0.290031],[-2,0,-1,1],[-800,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound6_1:=[[-1.63,-129.49,447.51],[0.353553,0.683013,0.612372,0.183013],[-1,0,2,1],[-800,500,0,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound6_2:=[[-6.7,113.51,444.9],[0.353553,0.683013,0.612372,0.183013],[-1,0,2,1],[-800,500,0,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound7_1:=[[-142.52,40.16,0.34],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,0,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound7_2:=[[-143.83,116.32,0.49],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,0,1],[-800,500,456,9E+09,9E+09,9E+09]];

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
    LOCAL PERS robtarget pSeam5_1:=[[-143.5,-155.5,0],[0.212631,-0.706434,0.67438,-0.0308436],[-2,0,0,1],[-801,-500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam5_2:=[[-143.5,-21,0],[0.212631,-0.706434,0.67438,-0.0308436],[-2,0,0,1],[-801,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam5_3:=[[-143.5,-21,0],[0.212631,-0.706434,0.67438,-0.0308436],[-2,0,0,1],[-801,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam6_1:=[[0,-144.5,416],[0.25,0.25,0.933013,0.0669873],[-1,0,1,1],[-800,500,156,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam6_2:=[[0,144.5,416],[0.25,0.25,0.933013,0.0669873],[-1,0,1,1],[-800,500,156,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam7_1:=[[-143.5,25,0],[0.270598,0.701057,0.653281,0.0922959],[-2,-1,3,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam7_2:=[[-143.5,125,0],[0.270598,0.701057,0.653281,0.0922959],[-1,-1,3,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam7_3:=[[-143.5,125,0],[0.270598,0.701057,0.653281,0.0922959],[-1,-1,3,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam8_1:=[[-143.5,-155.5,0],[0.212631,-0.706434,0.67438,-0.0308436],[-2,0,0,1],[-801,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam8_2:=[[-143.5,-21,0],[0.212631,-0.706434,0.67438,-0.0308436],[-2,0,0,1],[-801,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam8_3:=[[-143.5,-21,0],[0.212631,-0.706434,0.67438,-0.0308436],[-2,0,0,1],[-801,-500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam9_1:=[[0,-144.5,416],[0.25,0.25,0.933013,0.0669873],[-1,0,1,1],[-800,500,156,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam9_2:=[[0,144.5,416],[0.25,0.25,0.933013,0.0669873],[-1,0,1,1],[-800,500,156,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam10_1:=[[-143.5,25,0],[0.270598,0.701057,0.653281,0.0922959],[-2,-1,3,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam10_2:=[[-143.5,125,0],[0.270598,0.701057,0.653281,0.0922959],[-1,-1,3,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam10_3:=[[-143.5,125,0],[0.270598,0.701057,0.653281,0.0922959],[-1,-1,3,1],[-800,500,456,9E+09,9E+09,9E+09]];
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

    LOCAL PERS robtarget pSeam22_1:=[[-150,-4.77,0],[0.147388,0.013946,0.943852,-0.29534],[-1,0,0,1],[-698.527,504.221,467.895,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_2:=[[-150,1.58,0],[0.147395,0.0139495,0.94385,-0.295344],[-1,0,0,1],[-698.531,504.222,467.895,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_3:=[[-142.77,2.55,0],[0.147393,0.0139474,0.94385,-0.295343],[-1,0,0,1],[-698.53,504.221,467.894,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_4:=[[-22.40,4.37,0],[0.261771,-0.0223631,0.919965,-0.29093],[-1,1,0,1],[-698.53,504.221,467.894,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_5:=[[-15.56,5.63,10],[0.110216,-0.383059,0.740522,-0.54106],[-1,1,-1,1],[-698.53,504.222,467.896,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_6:=[[-9.32,3.83,20],[0.337928,0.738102,-0.198901,0.549043],[-1,-1,0,1],[-698.53,504.222,467.894,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_7:=[[-12.94,3.92,100],[0.360942,0.648816,-0.14361,0.65432],[-1,-2,1,1],[-698.53,504.222,467.894,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam22_8:=[[-12.94,3.92,370],[0.360945,0.648815,-0.143606,0.654321],[-1,-1,0,1],[-698.53,504.222,467.894,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_1:=[[-139.22,-10.66,-0.50],[0.0177515,0.0365074,0.921828,0.385467],[-2,1,1,1],[-602.94,-441.388,358.533,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_2:=[[-137.75,-20.55,-0.50],[0.0510221,-0.182377,0.931068,0.311846],[-2,0,1,1],[-602.94,-441.388,358.533,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_3:=[[-130.85,-17.46,-0.50],[0.0510226,-0.182377,0.931068,0.311846],[-2,0,1,1],[-602.94,-441.388,358.533,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_4:=[[-14.75,-13.58,-0.50],[0.0379111,0.126,0.913438,0.385122],[-2,0,1,1],[-602.94,-441.388,358.533,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_5:=[[-5.69,-14.34,8.21],[0.170021,-0.539535,-0.604385,-0.560993],[-2,0,2,1],[-602.94,-441.388,358.533,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_6:=[[-0.93,-13.19,20.17],[0.283969,-0.690104,-0.284621,-0.601756],[-2,1,2,1],[-602.94,-441.388,358.533,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_7:=[[-2.06,-12.79,55.69],[0.390607,-0.663585,-0.179181,-0.612352],[-1,1,2,1],[-602.94,-441.388,358.533,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam23_8:=[[-3.01,-12.89,246.73],[0.433065,-0.624687,-0.115987,-0.639349],[-1,1,2,1],[-602.94,-441.388,358.533,9E+09,9E+09,9E+09]];

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
    LOCAL PERS pos posAOSeam5_1:=[0,0,0];
    LOCAL PERS pos posAOSeam5_2:=[0,0,0];
    LOCAL PERS pos posAOSeam5_3:=[0,0,0];
    LOCAL PERS pos posAOSeam6_1:=[-20,0,0];
    LOCAL PERS pos posAOSeam6_2:=[-20,0,0];
    LOCAL PERS pos posAOSeam7_1:=[0,0,0];
    LOCAL PERS pos posAOSeam7_2:=[0,0,0];
    LOCAL PERS pos posAOSeam7_3:=[0,0,0];
    LOCAL PERS pos posAOSeam8_1:=[0,0,0];
    LOCAL PERS pos posAOSeam8_2:=[0,0,0];
    LOCAL PERS pos posAOSeam8_3:=[0,0,0];
    LOCAL PERS pos posAOSeam9_1:=[-20,0,0];
    LOCAL PERS pos posAOSeam9_2:=[-20,0,0];
    LOCAL PERS pos posAOSeam10_1:=[0,0,0];
    LOCAL PERS pos posAOSeam10_2:=[0,0,0];
    LOCAL PERS pos posAOSeam10_3:=[0,0,0];
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

    LOCAL PERS pos posAOSeam22_1:=[-4,0,0];
    LOCAL PERS pos posAOSeam22_2:=[-4,4,0];
    LOCAL PERS pos posAOSeam22_3:=[0,4,0];
    LOCAL PERS pos posAOSeam22_4:=[-10,4,0];
    LOCAL PERS pos posAOSeam22_5:=[-5,4,0];
    LOCAL PERS pos posAOSeam22_6:=[0,4,20];
    LOCAL PERS pos posAOSeam22_7:=[0,0,0];
    LOCAL PERS pos posAOSeam22_8:=[0,0,0];
    LOCAL PERS pos posAOSeam23_1:=[-4,0,0];
    LOCAL PERS pos posAOSeam23_2:=[-4,4,0];
    LOCAL PERS pos posAOSeam23_3:=[0,4,0];
    LOCAL PERS pos posAOSeam23_4:=[-10,4,0];
    LOCAL PERS pos posAOSeam23_5:=[-5,4,0];
    LOCAL PERS pos posAOSeam23_6:=[0,4,20];
    LOCAL PERS pos posAOSeam23_7:=[0,0,0];
    LOCAL PERS pos posAOSeam23_8:=[0,0,0];

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
    LOCAL PERS pose peSeam5_1:=[[2.87514,0.100067,-4.07725],[1,0,0,0]];
    LOCAL PERS pose peSeam5_2:=[[-0.748108,-0.00172424,-3.33367],[1,0,0,0]];
    LOCAL PERS pose peSeam5_3:=[[-0.748108,-0.00172424,-3.33367],[1,0,0,0]];
    LOCAL PERS pose peSeam6_1:=[[-21.3233,0.312531,31.6679],[1,0,0,0]];
    LOCAL PERS pose peSeam6_2:=[[-27.3498,0.153458,28.5655],[1,0,0,0]];
    LOCAL PERS pose peSeam7_1:=[[1.2404,0.0207253,0.310183],[1,0,0,0]];
    LOCAL PERS pose peSeam7_2:=[[-0.479141,-0.00924683,0.507077],[1,0,0,0]];
    LOCAL PERS pose peSeam7_3:=[[-0.479141,-0.00924683,0.507077],[1,0,0,0]];
    LOCAL PERS pose peSeam8_1:=[[2.8342,0.0904541,-4.80138],[1,0,0,0]];
    LOCAL PERS pose peSeam8_2:=[[-0.692978,0.00148392,-4.16271],[1,0,0,0]];
    LOCAL PERS pose peSeam8_3:=[[-0.692978,0.00148392,-4.16271],[1,0,0,0]];
    LOCAL PERS pose peSeam9_1:=[[-22.565,0.286362,30.3056],[1,0,0,0]];
    LOCAL PERS pose peSeam9_2:=[[-28.5206,0.127365,27.0722],[1,0,0,0]];
    LOCAL PERS pose peSeam10_1:=[[1.15506,0.0231094,-0.816231],[1,0,0,0]];
    LOCAL PERS pose peSeam10_2:=[[-0.668945,-0.010788,-0.566907],[1,0,0,0]];
    LOCAL PERS pose peSeam10_3:=[[-0.668945,-0.010788,-0.566907],[1,0,0,0]];
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

    LOCAL PERS pose peSeam22_1:=[[-3.94951,-1.27705,-1.26822],[1,0,0,0]];
    LOCAL PERS pose peSeam22_2:=[[-3.75871,-3.62132,-1.2664],[1,0,0,0]];
    LOCAL PERS pose peSeam22_3:=[[0.263245,-4.37321,-1.19727],[1,0,0,0]];
    LOCAL PERS pose peSeam22_4:=[[12.7484,-2.57502,-0.050429],[1,0,0,0]];
    LOCAL PERS pose peSeam22_5:=[[10.7233,-3.6255,-9.98402],[1,0,0,0]];
    LOCAL PERS pose peSeam22_6:=[[9.29772,-1.63678,0.0757961],[1,0,0,0]];
    LOCAL PERS pose peSeam22_7:=[[11.4153,-2.76164,0.204498],[1,0,0,0]];
    LOCAL PERS pose peSeam22_8:=[[6.34899,-3.71755,0.106018],[1,0,0,0]];
    LOCAL PERS pose peSeam23_1:=[[-3.9471,-1.73105,0.166434],[1,0,0,0]];
    LOCAL PERS pose peSeam23_2:=[[-3.74954,-4.0749,0.167627],[1,0,0,0]];
    LOCAL PERS pose peSeam23_3:=[[0.273361,-4.81904,0.211436],[1,0,0,0]];
    LOCAL PERS pose peSeam23_4:=[[13.4774,-2.89261,0.938115],[1,0,0,0]];
    LOCAL PERS pose peSeam23_5:=[[11.4385,-3.93672,-9.02001],[1,0,0,0]];
    LOCAL PERS pose peSeam23_6:=[[9.999,-1.94246,1.01767],[1,0,0,0]];
    LOCAL PERS pose peSeam23_7:=[[12.0028,-3.1555,0.225418],[1,0,0,0]];
    LOCAL PERS pose peSeam23_8:=[[6.55326,-4.60554,0.107544],[1,0,0,0]];

    !Only for local welding parameters
    LOCAL PERS welddata weld_1:=[6,0,[38,0,-1,0,0,350,0,0,0],[0,0,0,0,0,0,0,0,0]];
    LOCAL PERS weavedata weave_1:=[1,0,4,6,0,0,0,0,0,0,0,0,0,0,0];
    LOCAL PERS trackdata track_1:=[0,TRUE,50,[0,30,30,0,0,0,0,0,0],[0,0,0,0,0,0,0]];

    !wobjCurrent must be set correctly
    !extOffsetCurrent must be set correctly
    PROC Template_10023()
        Logging "Start to run Template_10023...";
        SetGO Go112_WeldCompleted,0;
        SetGO Go80_WeldingStatus,0;

        IF boolEnableGantryOffset THEN
            LoadGantryOffset;
        ENDIF

        MoveToReadyQuadrant 2;
        IF boolEnableSearch THEN
            SearchAndProcess;
        ENDIF
        
        WeldSeam 22;
        MoveToReadyQuadrant 2;

        MoveToReadyQuadrant 3;
        WeldSeam 23;
        WeldSeam 5;
        MoveToReadyQuadrant 3;

        MoveToReadyQuadrant 2;
        WeldSeam 6;
        WeldSeam 7;
        MoveToReadyQuadrant 2;

        !        MoveToReadyQuadrant 3;
        !        WeldSeam 8;
        !        MoveToReadyQuadrant 3;

        !        MoveToReadyQuadrant 2;
        !        WeldSeam 9;
        !        WeldSeam 10;
        !        MoveToReadyQuadrant 2;

        EOffsOff;
        Incr numPartCount;
        Logging "Template_10023 is done";

    UNDO
        EOffsOff;
    ENDPROC

    !1 - Search the fine oframe
    !2 - Search the seam offset if needed
    LOCAL PROC SearchAndProcess()
        !        IF RobOS() THEN
        !            IF NOT ASFMu_Initialize(Laser_IP_Add,2,TRUE,TRUE,TRUE,toolWeldGun,wobjCurrent) THEN
        !                TPWrite "The socket between laser and robot error Can't connect to vision controller";
        !                stop;
        !            ENDIF
        !        ENDIF
        SearchOframe;
        !        IF RobOS() THEN
        !            IF NOT ASFMu_Clear() THEN
        !                Stop;
        !            ENDIF
        !            IF NOT ASFMu_Initialize(Laser_IP_Add,2,TRUE,TRUE,TRUE,toolWeldGun,wobjCurrent) THEN
        !                TPWrite "The socket between laser and robot error Can't connect to vision controller";
        !                stop;
        !            ENDIF
        !        ENDIF
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

        MoveAbsJ [[-40.1504,-68.9705,41.6796,27.6411,-20.5006,108.121],[-800,500,-0.00013411,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pQ2_Y1_Found,pQ2_Y1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pQ2_Y2_Found,pQ2_Y2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-0.442793,-43.1611,0,20,-65.6482,5.56909E-9],[-800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        !MoveAbsJ [[-89.7306,-43.1368,0,-20,-65.7254,9.9994],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        !ScanSeamByLaser pQ2_X1_Found,pQ2_X1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        !ScanSeamByLaser pQ2_X2_Found,pQ2_X2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        !MoveAbsJ [[-89.7306,-43.1368,0,-20,-65.7254,9.9994],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        !MoveAbsJ [[-92.7971,-23.7414,5.96932,0,-45.8213,6.36111E-15],[-800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        !ScanSeamByLaser pQ2_Z1_Found,pQ2_Z1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-92.7971,-23.7414,5.96932,0,-45.8213,0],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pQ2_Z2_Found,pQ2_Z2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-92.7971,-23.7414,5.96932,0,-45.8213,100.384],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        !Search YPXN in Wobj0
        poseTransform.rot:=OrientZYX(-90,0,0);
        !Search YPZP in Wobj0
        poseTransform.rot:=OrientZYX(0,-90,-90);

        poseTransform_Q2:=poseTransform;

        poseFrame:=DefFrame(pQ2_Y1_Found,pQ2_Y2_Found,pQ2_Z2_Found\Origin:=3);
        Logging "poseFrame.trans:="+ValToStr(poseFrame.trans);
        Logging "poseFrame.rot:="+GetEulerAngleString(poseFrame.rot);
        wobjCurrent.oframe:=PoseMult(poseFrame,poseTransform);
        !wobjCurrent.oframe.trans:=[0,0,0];
        wobjCurrent.oframe.rot:=[1,0,0,0];
        Logging "oframe.trans:="+ValToStr(wobjCurrent.oframe.trans);
        Logging "oframe.rot:="+GetEulerAngleString(wobjCurrent.oframe.rot);

        wobjLast:=wobjCurrent;
        WriteSysDataLog "Template_10023";

    ENDPROC

    LOCAL PROC WeldSeam(num numSeamIndex)
        UpdateWeldSeamStatus\Start,numSeamIndex;
        %"Seam_"+ValToStr(numSeamIndex)%;
        UpdateWeldSeamStatus numSeamIndex;
    ENDPROC

    LOCAL PROC Seam_1()
        !ReloadGantryOffset;

        MoveAbsJ [[-89.7306,-43.1368,0,-20,-65.7254,270],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound1_1,pSearchSeam1_1,scanJoint1,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound1_2,pSearchSeam1_2,scanJoint1,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-89.7306,-43.1368,0,-20,-65.7254,270],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam1_1,posAOSeam1_1,pSeam1_1,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X\Y\Z,peSeam1_2,posAOSeam1_2,pSeam1_2,pSeamFound1_1,pSeamFound1_2;

        MoveAbsJ [[-57.3899,-45,-30,0,40,181.888],[-800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        PDispSet peSeam1_1;
        MoveJ GetAproachTarget(pSeam1_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam1_1,speedAproach,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1\SeamName:="WeldSeam";
        PDispSet peSeam1_2;
        ArcLEnd pSeam1_2,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        MoveL GetAproachTarget(pSeam1_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-57.3899,-45,-30,0,40,181.888],[-800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_2()
        MoveAbsJ [[-92.7971,-23.7414,5.96932,0,-45.8213,0],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound2_1,pSearchSeam2_1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound2_2,pSearchSeam2_2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-92.7971,-23.7414,5.96932,0,-45.8213,100.384],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam2_1,posAOSeam2_1,pSeam2_1,pSeamFound2_1,pSeamFound2_2;
        RefreshDisp\X\Y\Z,peSeam2_2,posAOSeam2_2,pSeam2_2,pSeamFound2_1,pSeamFound2_2;
        RefreshDisp\X\Y\Z,peSeam2_3,posAOSeam2_3,pSeam2_3,pSeamFound2_1,pSeamFound2_2;

        !peSeam2_1.trans.z:=pSeamFound1_1.trans.z-pSeam1_1.trans.z+posAOSeam2_1.z;

        MoveAbsJ [[-89.1336,-19.4308,4.46111,-6.28607,-45.2808,89.8206],[-800,500,89.6952,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        PDispSet peSeam2_1;
        MoveJ GetAproachTarget(pSeam2_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam2_1,speedAproach,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2\SeamName:="WeldSeam";
        PDispSet peSeam2_2;
        ArcL pSeam2_2,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        PDispSet peSeam2_3;
        ArcLEnd pSeam2_3,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        MoveL GetAproachTarget(pSeam2_3),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-89.1336,-19.4308,4.46111,-6.28607,-45.2808,89.8206],[-800,500,89.6952,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveAbsJ [[-89.1336,-30,30,90,-90,89.8206],[-800,500,89.6952,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_3()
        MoveAbsJ [[-90.1743,-20.0001,19.9999,90.0001,-75.7744,56.0873],[-800,-500,-0.00013411,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-90.1743,-19.9999,30,-6.4176,-75.7746,28.7485],[-800,-500,-0.00013411,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound3_1,pSearchSeam3_1,scanJoint3,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound3_2,pSearchSeam3_2,scanJoint3,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-90.1743,-28.203,36.4509,-5.46308E-05,-75.7745,37.1404],[-800,-500,0.000245869,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam3_1,posAOSeam3_1,pSeam3_1,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X\Y\Z,peSeam3_2,posAOSeam3_2,pSeam3_2,pSeamFound3_1,pSeamFound3_2;

        MoveAbsJ [[-75,-60,10,91.0512,-30,120.621],[-800,-500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        PDispSet peSeam3_1;
        MoveJ GetAproachTarget(pSeam3_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam3_1,speedAproach,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1\SeamName:="WeldSeam";
        PDispSet peSeam3_2;
        ArcLEnd pSeam3_2,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        MoveL GetAproachTarget(pSeam3_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-75,-60,10,91.0512,-30,120.621],[-800,-500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_4()
        MoveAbsJ [[-54.7922,-70.5062,45,3.90715,-68.4188,36.4322],[-800,-500,1.86265E-6,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound4_1,pSearchSeam4_1,scanJoint4,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound4_2,pSearchSeam4_2,scanJoint4,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-85.1215,-60,0,79.4456,-20,90],[-800,-500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam4_1,posAOSeam4_1,pSeam4_1,pSeamFound4_1,pSeamFound4_2;
        RefreshDisp\X\Y\Z,peSeam4_2,posAOSeam4_2,pSeam4_2,pSeamFound4_1,pSeamFound4_2;
        RefreshDisp\X\Y\Z,peSeam4_3,posAOSeam4_3,pSeam4_3,pSeamFound4_1,pSeamFound4_2;

        MoveAbsJ [[-85.1215,-60,0,79.4456,-20,-91.3062],[-800,-500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        PDispSet peSeam4_1;
        MoveJ GetAproachTarget(pSeam4_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam4_1,speedAproach,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2\SeamName:="WeldSeam";
        PDispSet peSeam4_2;
        ArcL pSeam4_2,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        PDispSet peSeam4_3;
        ArcLEnd pSeam4_3,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        MoveL GetAproachTarget(pSeam4_3),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[-44.8198,-38.9682,10.3138,59.7025,-72.646,121.464],[-799.999,-500,128.324,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
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
        MoveAbsJ [[-89.7306,-43.1368,0,-20,-65.7254,270],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound1_1,pSearchSeam1_1,scanJoint1,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound1_2,pSearchSeam1_2,scanJoint1,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-151.286,-18.7531,-14.2564,-45.3536,-84.2743,301.248],[-800,500,230.338,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound2_1,pSearchSeam2_1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound2_2,pSearchSeam2_2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-91.6084,-32.3753,-0.280293,-50.9631,-57.0723,194.327],[-800,500,207.46,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[-52.7557,-43.8883,36.8223,15.4091,-52.0967,115.276],[-737.076,502.617,361.603,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

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
        PDispOff;

        MoveAbsJ [[-94.6272,-62.3288,31.5236,-67.9884,-28.6289,132.373],[-732.484,502.809,311.327,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_23()
        Stop;
        MoveAbsJ [[-89.7306,-43.1368,0,-20,-65.7254,270],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound3_1,pSearchSeam3_1,scanJoint3,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound3_2,pSearchSeam3_2,scanJoint3,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-151.286,-18.7531,-14.2564,-45.3536,-84.2743,301.248],[-800,500,230.338,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound4_1,pSearchSeam4_1,scanJoint4,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound4_2,pSearchSeam4_2,scanJoint4,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[-91.6084,-32.3753,-0.280293,-50.9631,-57.0723,194.327],[-800,500,207.46,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[-52.7557,-43.8883,36.8223,15.4091,-52.0967,115.276],[-737.076,502.617,361.603,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

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
        PDispOff;

        MoveAbsJ [[-94.6272,-62.3288,31.5236,-67.9884,-28.6289,132.373],[-732.484,502.809,311.327,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

ENDMODULE
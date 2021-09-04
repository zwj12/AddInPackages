MODULE Template_10014_Module
    !*****************************************************
    !Module Name:   Template_10014_Module
    !Version:       1.0
    !Description:   All the targets are coordinated in its self coordinate system
    !Date:          2021-8-16
    !Author:        Michael
    !*****************************************************

    !2021-8-20, Michael, Add wobjLast, WriteSysDataLog

    LOCAL PERS num numPartCount:=11;

    !For oframe searching            
    LOCAL PERS robtarget pQ1_X1:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_X2:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_Y1:=[[0,75,0],[0.353553421,0.683012702,-0.61237243,-0.183012661],[0,-1,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ1_Y2:=[[0,200,0],[0.353553421,0.683012702,-0.61237243,-0.183012661],[0,-1,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ1_Z1:=[[0,0,50],[0.232962913,0.732962913,0.303603179,-0.562422224],[1,0,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ1_Z2:=[[0,0,250],[0.562422,0.303603,-0.732963,0.232963],[1,0,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ1_X1_Found:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_X2_Found:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ1_Y1_Found:=[[-27.57,83.92,-10.77],[0.353553,0.683013,-0.612372,-0.183013],[0,-1,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ1_Y2_Found:=[[-30.12,208.52,-10.29],[0.353553,0.683013,-0.612372,-0.183013],[0,-1,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ1_Z1_Found:=[[-22.5,-29.63,56.82],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ1_Z2_Found:=[[-24.71,-27.71,222.88],[0.562422,0.303603,-0.732963,0.232963],[1,0,-1,1],[800,500,456,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pQ2_X1:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_X2:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_Y1:=[[0,74.99,0],[0.0903086,-0.672569,0.657682,-0.327031],[-1,-1,0,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ2_Y2:=[[0,200,0],[0.0903092,-0.67257,0.657681,-0.327031],[-1,-1,0,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ2_Z1:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_Z2:=[[0,0,250],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_X1_Found:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_X2_Found:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_Y1_Found:=[[17.72,90.01,-0.38],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ2_Y2_Found:=[[15.32,215.36,0.3],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ2_Z1_Found:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ2_Z2_Found:=[[16.14,7.09,231.86],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+09,9E+09,9E+09]];

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

    LOCAL PERS wobjdata wobjLast:=[FALSE,TRUE,"",[[-2163,-36,67],[1,0,0,0]],[[-25.3036,-26.8204,-11.1966],[1,0,0,0]]];
    LOCAL PERS pose poseFrame:=[[-25.3036,-26.8204,-11.1966],[0.493275,0.496437,0.504757,0.505422]];
    LOCAL PERS pose poseTransform:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q1:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q2:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q3:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q4:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];

    LOCAL PERS robtarget pSearchSeam1_1:=[[100,0,0],[0.120591,-0.0499502,-0.915976,0.37941],[0,0,0,1],[800,500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSearchSeam1_2:=[[25,0,0],[0.120591,-0.0499502,-0.915976,0.37941],[0,0,0,1],[800,500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSearchSeam2_1:=[[0,0,50],[0.232963,0.732963,0.303603,-0.562422],[1,0,-1,1],[800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSearchSeam2_2:=[[0,0,250],[0.562422,0.303603,-0.732963,0.232963],[1,0,-1,1],[800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSearchSeam3_1:=[[100,-20,0],[0.238672,-0.00634124,-0.915341,-0.324261],[0,1,-2,0],[871.349,-465.412,580.706,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam3_2:=[[25,-20,0],[0.238673,-0.00634157,-0.915341,-0.324261],[0,1,-2,0],[871.349,-465.412,580.706,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam4_1:=[[0,-20,25],[0.178533,-0.757587,0.343021,0.525856],[0,1,0,0],[871.349,-465.412,580.706,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam4_2:=[[0,-20,250],[0.518278,-0.312386,-0.770725,-0.199464],[0,1,-2,0],[871.349,-465.412,580.706,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam5_1:=[[161.50,-125.01,-0.01],[0.258695,-0.685431,-0.679861,0.0324105],[1,-1,0,1],[799.999,-500,480.001,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam5_2:=[[161.5,-50,-0.01],[0.258696,-0.685431,-0.67986,0.0324082],[1,-1,0,1],[799.999,-500,480.001,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam6_1:=[[0,-125,440],[0.270598,0.653282,-0.653282,-0.270598],[0,-1,-1,1],[800,500,180,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSearchSeam6_2:=[[0,125,440],[0.270598,0.653282,-0.653282,-0.270598],[0,-1,-1,1],[800,500,180,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSearchSeam7_1:=[[172.50,125.00,18.00],[0.298606,0.663087,-0.6864,-0.00225087],[0,0,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam7_2:=[[172.5,25,18],[0.298604,0.663086,-0.686402,-0.00225078],[0,0,-1,1],[800,500,456,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pSeamFound1_1:=[[114.91,1.01,-4.14],[0.120591,-0.0499502,-0.915976,0.37941],[0,0,0,1],[800,500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound1_2:=[[39.66,-0.51,-4.32],[0.120591,-0.0499502,-0.915976,0.37941],[0,0,0,1],[800,500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound2_1:=[[2.06,-2.54,65.36],[0.232963,0.732963,0.303603,-0.562422],[1,0,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound2_2:=[[0.58,-0.8,234.13],[0.562422,0.303603,-0.732963,0.232963],[1,0,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound3_1:=[[109.19,-11.22,-13.78],[0.120591,0.0499502,-0.915976,-0.37941],[0,-1,-1,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound3_2:=[[34.32,-12.25,-13.86],[0.120591,0.0499502,-0.915976,-0.37941],[0,-1,-1,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound4_1:=[[-8.8,-15.04,37.69],[0.232963,-0.732963,0.303603,0.562422],[0,-1,0,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound4_2:=[[-7.5,-11.63,228.32],[0.562422,-0.303603,-0.732963,-0.232963],[0,-1,0,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound5_1:=[[144.2,-138.82,-4.3],[0.353553,-0.683013,-0.612372,0.183013],[1,0,0,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound5_2:=[[142.24,-63.8,-4.04],[0.353553,-0.683013,-0.612372,0.183013],[1,0,0,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound6_1:=[[4.47,-109.79,436.82],[0.270598,0.653282,-0.653282,-0.270598],[0,-1,-1,1],[800,500,180,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound6_2:=[[-0.89,140.42,432.85],[0.270598,0.653282,-0.653282,-0.270598],[0,-1,-1,1],[800,500,180,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound7_1:=[[140.36,132.63,2],[0.353553,0.683013,-0.612372,-0.183013],[0,-1,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound7_2:=[[142.64,32.7,1.74],[0.353553,0.683013,-0.612372,-0.183013],[0,-1,-1,1],[800,500,480,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pSeam1_1:=[[132.96,0,0],[0.37941,0.915976,-0.0499504,-0.120589],[0,0,-2,1],[800,500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam1_2:=[[10,0,0],[0.37941,0.915976,-0.0499502,-0.12059],[0,0,-2,1],[800,500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam2_1:=[[0,0,10],[0.562422,0.303603,-0.732963,0.232963],[0,0,-1,1],[800,500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam2_2:=[[0,0,100],[0.732963,0.232963,-0.562422,0.303603],[0,0,-1,1],[800,500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam2_3:=[[0,0,385],[0.732963,0.232963,-0.562422,0.303603],[0,0,-1,1],[800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam3_1:=[[132.961,-20,7],[0.379409,-0.915976,-0.0499502,0.120591],[1,-1,1,1],[800,-500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam3_2:=[[0,-20,7],[0.379409,-0.915976,-0.0499502,0.120591],[1,-1,2,1],[800,-500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam4_1:=[[0,-20,10],[0.562422,-0.303603,-0.732963,-0.232963],[1,-1,0,1],[800,-500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam4_2:=[[0,-20,100],[0.732963,-0.232963,-0.562422,-0.303603],[1,-1,0,1],[800,-500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam4_3:=[[0,-20,380],[0.732963,-0.232963,-0.562422,-0.303603],[1,-1,0,1],[800,-500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam5_1:=[[161.5,-125,0],[0.183013,0.612372,-0.683013,-0.353553],[0,-1,-1,1],[800,-500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam5_2:=[[161.5,-24,0],[0.183013,0.612372,-0.683013,-0.353553],[0,-1,-1,1],[800,-500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam5_3:=[[161.5,-24,0],[0.183013,0.612372,-0.683013,-0.353553],[0,-1,-1,1],[800,-500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam6_1:=[[0,-155.5,440],[0.191341728,-0.800103119,-0.461939792,0.331413594],[0,0,1,1],[800,500,180,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam6_2:=[[0,144.5,440],[0.191341728,-0.800103119,-0.461939792,0.331413594],[0,0,1,1],[800,500,180,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam7_1:=[[172.5,144.5,-6],[0.183013,-0.612372,-0.683013,0.353553],[0,0,0,1],[800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam7_2:=[[172.5,13,-6],[0.183013,-0.612372,-0.683013,0.353553],[0,0,0,1],[800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam7_3:=[[172.5,13,-6],[0.183013,-0.612372,-0.683013,0.353553],[0,0,0,1],[800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSeam8_1:=[[159.91,-141.08,-6.04],[0.0391989,0.579794,-0.746019,-0.325206],[0,-1,3,1],[800.001,-500,600.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam8_2:=[[158.36,-37.68,-6.04],[0.0392008,0.579791,-0.74602,-0.325206],[0,-1,3,1],[800,-499.999,600.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam8_3:=[[158.36,-0.37,-6.04],[0.00426361,-0.557239,0.748135,0.360222],[0,-1,3,1],[800,-500,600.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam9_1:=[[-14.43,-149.11,300.63],[0.168364,0.836144,-0.497818,-0.157143],[0,-1,-1,1],[859.81,-197.861,180.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam9_2:=[[14.22,156.44,301.36],[0.168364,0.836144,-0.497818,-0.157143],[1,-1,-2,1],[859.81,-197.861,180.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam10_1:=[[190.01,170.01,43.94],[0.0133679,0.756125,0.564702,-0.330465],[1,0,0,1],[800,499.994,600,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam10_2:=[[193.62,63.97,45.76],[0.0133696,0.756125,0.564703,-0.330464],[0,0,0,1],[800,499.994,600,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam10_3:=[[199.64,31.16,46.72],[0.0901692,0.710698,0.573659,-0.397106],[1,0,0,1],[800,499.993,600,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam11_1:=[[159.91,-141.08,-6.04],[0.0391989,0.579794,-0.746019,-0.325206],[0,-1,3,1],[800.001,-500,600.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam11_2:=[[158.36,-37.68,-6.04],[0.0392008,0.579791,-0.74602,-0.325206],[0,-1,3,1],[800,-499.999,600.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam11_3:=[[158.36,-0.37,-6.04],[0.00426361,-0.557239,0.748135,0.360222],[0,-1,3,1],[800,-500,600.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam12_1:=[[-14.43,-149.11,300.63],[0.168364,0.836144,-0.497818,-0.157143],[0,-1,-1,1],[859.81,-197.861,180.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam12_2:=[[14.22,156.44,301.36],[0.168364,0.836144,-0.497818,-0.157143],[1,-1,-2,1],[859.81,-197.861,180.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam13_1:=[[190.01,170.01,43.94],[0.0133679,0.756125,0.564702,-0.330465],[1,0,0,1],[800,499.994,600,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam13_2:=[[193.62,63.97,45.76],[0.0133696,0.756125,0.564703,-0.330464],[0,0,0,1],[800,499.994,600,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam13_3:=[[199.64,31.16,46.72],[0.0901692,0.710698,0.573659,-0.397106],[1,0,0,1],[800,499.993,600,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam14_1:=[[159.91,-141.08,-6.04],[0.0391989,0.579794,-0.746019,-0.325206],[0,-1,3,1],[800.001,-500,600.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam14_2:=[[158.36,-37.68,-6.04],[0.0392008,0.579791,-0.74602,-0.325206],[0,-1,3,1],[800,-499.999,600.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam14_3:=[[158.36,-0.37,-6.04],[0.00426361,-0.557239,0.748135,0.360222],[0,-1,3,1],[800,-500,600.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam15_1:=[[-14.43,-149.11,300.63],[0.168364,0.836144,-0.497818,-0.157143],[0,-1,-1,1],[859.81,-197.861,180.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam15_2:=[[14.22,156.44,301.36],[0.168364,0.836144,-0.497818,-0.157143],[1,-1,-2,1],[859.81,-197.861,180.002,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam16_1:=[[190.01,170.01,43.94],[0.0133679,0.756125,0.564702,-0.330465],[1,0,0,1],[800,499.994,600,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam16_2:=[[193.62,63.97,45.76],[0.0133696,0.756125,0.564703,-0.330464],[0,0,0,1],[800,499.994,600,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam16_3:=[[199.64,31.16,46.72],[0.0901692,0.710698,0.573659,-0.397106],[1,0,0,1],[800,499.993,600,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pSeam21_1:=[[156,0,0],[0.375673,0.916651,-0.133646,0.0275736],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_2:=[[156,0,0],[0.375674,0.916651,-0.133644,0.0275745],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_3:=[[156,0,0],[0.375672,0.916652,-0.133642,0.0275736],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_4:=[[0,0,0],[0.411828,0.878648,-0.240982,0.0173946],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_5:=[[0.02,0.00,-0.02],[0.559579,0.507293,-0.622641,0.204558],[0,0,-1,1],[567.975,449.039,440.69,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_6:=[[0,0,0],[0.549605,0.275701,-0.700945,0.361385],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_7:=[[0,0,100],[0.597745,0.115458,-0.635132,0.47537],[1,1,-2,1],[567.974,449.041,440.688,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_8:=[[10,5,380],[0.610985,0.11281,-0.614171,0.486585],[1,0,-1,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_1:=[[134,0,0],[0.412765,-0.909289,0.0387012,0.0363478],[1,1,0,0],[871.35,-465.412,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_2:=[[134,0,0],[0.412765,-0.909289,0.0386965,0.0363475],[1,1,0,0],[871.35,-465.411,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_3:=[[128,-10.97,-12.83],[0.412764,-0.909289,0.0387005,0.0363503],[1,1,0,0],[871.349,-465.412,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_4:=[[3.59,-12.48,-13.38],[0.428722,-0.882929,-0.17301,0.0818541],[1,1,-1,0],[871.35,-465.412,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_5:=[[-1.39,-11.99,-7.80],[0.547347,-0.689456,-0.466884,-0.0841506],[1,1,-1,0],[871.35,-465.411,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_6:=[[-7.11,-11.24,2.57],[0.585739,-0.316714,-0.7033,-0.24894],[1,1,-2,0],[871.35,-465.411,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_7:=[[-7.11,-11.24,100],[0.617685,-0.181827,-0.658014,-0.390412],[0,1,-1,0],[871.35,-465.41,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_8:=[[-1.33,-14.89,371],[0.663782,-0.15302,-0.611481,-0.402578],[0,1,-2,0],[871.349,-465.411,580.705,9E+09,9E+09,9E+09]];

    !Only used to compensate Absolute Accuracy Offset
    LOCAL PERS pos posAOSeam1_1:=[0,0,0];
    LOCAL PERS pos posAOSeam1_2:=[0,0,0];
    LOCAL PERS pos posAOSeam2_1:=[0,0,0];
    LOCAL PERS pos posAOSeam2_2:=[0,0,0];
    LOCAL PERS pos posAOSeam2_3:=[0,0,0];
    LOCAL PERS pos posAOSeam3_1:=[0,0,0];
    LOCAL PERS pos posAOSeam3_2:=[0,0,0];
    LOCAL PERS pos posAOSeam4_1:=[0,0,0];
    LOCAL PERS pos posAOSeam4_2:=[0,0,0];
    LOCAL PERS pos posAOSeam4_3:=[0,0,0];
    LOCAL PERS pos posAOSeam5_1:=[0,0,0];
    LOCAL PERS pos posAOSeam5_2:=[0,0,0];
    LOCAL PERS pos posAOSeam5_3:=[0,0,0];
    LOCAL PERS pos posAOSeam6_1:=[20,0,0];
    LOCAL PERS pos posAOSeam6_2:=[20,0,0];
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
    LOCAL PERS pos posAOSeam11_1:=[0,0,0];
    LOCAL PERS pos posAOSeam11_2:=[0,0,0];
    LOCAL PERS pos posAOSeam11_3:=[0,0,0];
    LOCAL PERS pos posAOSeam12_1:=[20,0,0];
    LOCAL PERS pos posAOSeam12_2:=[20,0,0];
    LOCAL PERS pos posAOSeam13_1:=[0,0,0];
    LOCAL PERS pos posAOSeam13_2:=[0,0,0];
    LOCAL PERS pos posAOSeam13_3:=[0,0,0];
    LOCAL PERS pos posAOSeam14_1:=[0,0,0];
    LOCAL PERS pos posAOSeam14_2:=[0,0,0];
    LOCAL PERS pos posAOSeam14_3:=[0,0,0];
    LOCAL PERS pos posAOSeam15_1:=[20,0,0];
    LOCAL PERS pos posAOSeam15_2:=[20,0,0];
    LOCAL PERS pos posAOSeam16_1:=[0,0,0];
    LOCAL PERS pos posAOSeam16_2:=[0,0,0];
    LOCAL PERS pos posAOSeam16_3:=[0,0,0];
    
    LOCAL PERS pos posAOSeam21_1:=[0,-5,10];
    LOCAL PERS pos posAOSeam21_2:=[0,6,10];
    LOCAL PERS pos posAOSeam21_3:=[-5,-3,10];
    LOCAL PERS pos posAOSeam21_4:=[25,0,10];
    LOCAL PERS pos posAOSeam21_5:=[13,-1,10];
    LOCAL PERS pos posAOSeam21_6:=[10,3,17];
    LOCAL PERS pos posAOSeam21_7:=[11,3,0];
    LOCAL PERS pos posAOSeam21_8:=[14,3,0];
    LOCAL PERS pos posAOSeam24_1:=[-3,-5,10];
    LOCAL PERS pos posAOSeam24_2:=[-3,-6,6];
    LOCAL PERS pos posAOSeam24_3:=[0,-4,10];
    LOCAL PERS pos posAOSeam24_4:=[13,-3,5];
    LOCAL PERS pos posAOSeam24_5:=[9,-3,9];
    LOCAL PERS pos posAOSeam24_6:=[3,-2,20];
    LOCAL PERS pos posAOSeam24_7:=[5,0,0];
    LOCAL PERS pos posAOSeam24_8:=[5,-6,0];

    !Used for PDispSet
    LOCAL PERS pose peSeam1_1:=[[0.108917,-4.07159,-1.86837],[1,0,0,0]];
    LOCAL PERS pose peSeam1_2:=[[0.188454,-7.17133,-2.27623],[1,0,0,0]];
    LOCAL PERS pose peSeam2_1:=[[3.81084,-8.34172,0.114883],[1,0,0,0]];
    LOCAL PERS pose peSeam2_2:=[[3.16523,-7.39732,0.100342],[1,0,0,0]];
    LOCAL PERS pose peSeam2_3:=[[1.12079,-4.40669,0.0542603],[1,0,0,0]];
    LOCAL PERS pose peSeam3_1:=[[-0.187469,6.93883,-11.5402],[1,0,0,0]];
    LOCAL PERS pose peSeam3_2:=[[-0.0967331,3.46754,-11.469],[1,0,0,0]];
    LOCAL PERS pose peSeam4_1:=[[-3.76151,1.15481,0.0334816],[1,0,0,0]];
    LOCAL PERS pose peSeam4_2:=[[-2.74957,1.84187,0.016861],[1,0,0,0]];
    LOCAL PERS pose peSeam4_3:=[[0.398711,3.97939,-0.0348511],[1,0,0,0]];
    LOCAL PERS pose peSeam5_1:=[[-17.6494,-0.446373,-4.25365],[1,0,0,0]];
    LOCAL PERS pose peSeam5_2:=[[-20.2863,-0.516472,-3.90385],[1,0,0,0]];
    LOCAL PERS pose peSeam5_3:=[[-20.2863,-0.516472,-3.90385],[1,0,0,0]];
    LOCAL PERS pose peSeam6_1:=[[25.4475,0.0777283,-2.45596],[1,0,0,0]];
    LOCAL PERS pose peSeam6_2:=[[19.0255,-0.135315,-7.21259],[1,0,0,0]];
    LOCAL PERS pose peSeam7_1:=[[-32.3935,-0.759979,8.02891],[1,0,0,0]];
    LOCAL PERS pose peSeam7_2:=[[-29.3948,-0.690666,7.68695],[1,0,0,0]];
    LOCAL PERS pose peSeam7_3:=[[-29.3948,-0.690666,7.68695],[1,0,0,0]];
    LOCAL PERS pose peSeam8_1:=[[2.8342,0.0904541,-4.80138],[1,0,0,0]];
    LOCAL PERS pose peSeam8_2:=[[-0.692978,0.00148392,-4.16271],[1,0,0,0]];
    LOCAL PERS pose peSeam8_3:=[[-0.692978,0.00148392,-4.16271],[1,0,0,0]];
    LOCAL PERS pose peSeam9_1:=[[-22.565,0.286362,30.3056],[1,0,0,0]];
    LOCAL PERS pose peSeam9_2:=[[-28.5206,0.127365,27.0722],[1,0,0,0]];
    LOCAL PERS pose peSeam10_1:=[[1.15506,0.0231094,-0.816231],[1,0,0,0]];
    LOCAL PERS pose peSeam10_2:=[[-0.668945,-0.010788,-0.566907],[1,0,0,0]];
    LOCAL PERS pose peSeam10_3:=[[-0.668945,-0.010788,-0.566907],[1,0,0,0]];
    LOCAL PERS pose peSeam11_1:=[[-11.3247,-0.231934,0.78],[1,0,0,0]];
    LOCAL PERS pose peSeam11_2:=[[-11.8922,-0.243561,0.78],[1,0,0,0]];
    LOCAL PERS pose peSeam11_3:=[[-12.656,-0.259196,0.78],[1,0,0,0]];
    LOCAL PERS pose peSeam12_1:=[[35.5721,0.325867,12.6324],[1,0,0,0]];
    LOCAL PERS pose peSeam12_2:=[[0.630541,-0.395615,11.7948],[1,0,0,0]];
    LOCAL PERS pose peSeam13_1:=[[-46.2289,-0.914124,-45.8258],[1,0,0,0]];
    LOCAL PERS pose peSeam13_2:=[[-48.2293,-0.950661,-47.1536],[1,0,0,0]];
    LOCAL PERS pose peSeam13_3:=[[-53.7501,-1.03816,-47.9609],[1,0,0,0]];
    LOCAL PERS pose peSeam14_1:=[[-11.3247,-0.231934,0.78],[1,0,0,0]];
    LOCAL PERS pose peSeam14_2:=[[-11.8922,-0.243561,0.78],[1,0,0,0]];
    LOCAL PERS pose peSeam14_3:=[[-12.656,-0.259196,0.78],[1,0,0,0]];
    LOCAL PERS pose peSeam15_1:=[[35.5721,0.325867,12.6324],[1,0,0,0]];
    LOCAL PERS pose peSeam15_2:=[[0.630541,-0.395615,11.7948],[1,0,0,0]];
    LOCAL PERS pose peSeam16_1:=[[-46.2289,-0.914124,-45.8258],[1,0,0,0]];
    LOCAL PERS pose peSeam16_2:=[[-48.2293,-0.950661,-47.1536],[1,0,0,0]];
    LOCAL PERS pose peSeam16_3:=[[-53.7501,-1.03816,-47.9609],[1,0,0,0]];
    
    LOCAL PERS pose peSeam21_1:=[[-0.0274963,-3.16056,5.95822],[1,0,0,0]];
    LOCAL PERS pose peSeam21_2:=[[-0.0274963,7.83944,5.95822],[1,0,0,0]];
    LOCAL PERS pose peSeam21_3:=[[-5.0275,-1.16056,5.95822],[1,0,0,0]];
    LOCAL PERS pose peSeam21_4:=[[27.6327,-1.31036,5.58522],[1,0,0,0]];
    LOCAL PERS pose peSeam21_5:=[[15.6128,-2.30995,5.60527],[1,0,0,0]];
    LOCAL PERS pose peSeam21_6:=[[12.6327,1.68964,12.5852],[1,0,0,0]];
    LOCAL PERS pose peSeam21_7:=[[12.7559,0.817525,0.0378952],[1,0,0,0]];
    LOCAL PERS pose peSeam21_8:=[[3.30125,-1.29661,-0.0494995],[1,0,0,0]];
    LOCAL PERS pose peSeam24_1:=[[-2.83568,-15.8764,-3.75331],[1,0,0,0]];
    LOCAL PERS pose peSeam24_2:=[[-2.83568,-16.8764,-7.75331],[1,0,0,0]];
    LOCAL PERS pose peSeam24_3:=[[0.000869751,-3.99122,9.0701],[1,0,0,0]];
    LOCAL PERS pose peSeam24_4:=[[0.262744,-3.19271,4.48717],[1,0,0,0]];
    LOCAL PERS pose peSeam24_5:=[[1.28061,-3.75104,2.90186],[1,0,0,0]];
    LOCAL PERS pose peSeam24_6:=[[1.07113,-3.57942,3.52577],[1,0,0,0]];
    LOCAL PERS pose peSeam24_7:=[[3.73531,-2.68438,0.0566559],[1,0,0,0]];
    LOCAL PERS pose peSeam24_8:=[[-0.197462,-0.188957,-0.0684814],[1,0,0,0]];

    !Only for local welding parameters
    LOCAL PERS welddata weld_1:=[6,0,[38,0,-1,0,0,350,0,0,0],[0,0,0,0,0,0,0,0,0]];
    LOCAL PERS weavedata weave_1:=[1,0,4,6,0,0,0,0,0,0,0,0,0,0,0];
    LOCAL PERS trackdata track_1:=[0,TRUE,50,[0,30,30,0,0,0,0,0,0],[0,0,0,0,0,0,0]];

    !wobjCurrent must be set correctly
    !extOffsetCurrent must be set correctly
    PROC Template_10014()
        Logging "Start to run Template_10014...";
        SetGO Go112_WeldCompleted,0;
        SetGO Go80_WeldingStatus,0;

        IF boolEnableGantryOffset THEN
            LoadGantryOffset;
        ENDIF

        MoveToReadyQuadrant 1;
        IF boolEnableSearch THEN
            SearchAndProcess;
        ENDIF

        InhibWeld TRUE\Weld;

        !WeldSeam 1;
        !WeldSeam 2;
        WeldSeam 21;
        MoveToReadyQuadrant 1;

        MoveToReadyQuadrant 4;
        !WeldSeam 3;
        !WeldSeam 4;
        WeldSeam 24;
        Stop;

        InhibWeld TRUE\Weld\Weave;

        WeldSeam 5;
        MoveToReadyQuadrant 4;

        MoveToReadyQuadrant 1;
        WeldSeam 6;
        WeldSeam 7;
        MoveToReadyQuadrant 1;

        !        MoveToReadyQuadrant 4;
        !        WeldSeam 8;
        !        MoveToReadyQuadrant 4;

        !        MoveToReadyQuadrant 1;
        !        WeldSeam 9;
        !        WeldSeam 10;
        !        MoveToReadyQuadrant 1;

        EOffsOff;
        Incr numPartCount;
        Logging "Template_10014 is done";

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

        MoveAbsJ [[57.2174,-60,14.5962,-12.6144,-30,-58.0924],[800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pQ1_Y1_Found,pQ1_Y1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pQ1_Y2_Found,pQ1_Y2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[57.2174,-60,14.5962,-12.6144,-30,-58.0924],[800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        !MoveAbsJ [[-89.7306,-43.1368,0,-20,-65.7254,9.9994],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        !ScanSeamByLaser pQ1_X1_Found,pQ1_X1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        !ScanSeamByLaser pQ1_X2_Found,pQ1_X2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        !MoveAbsJ [[-89.7306,-43.1368,0,-20,-65.7254,9.9994],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        !MoveAbsJ [[-92.7971,-23.7414,5.96932,0,-45.8213,6.36111E-15],[-800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        !ScanSeamByLaser pQ1_Z1_Found,pQ1_Z1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[57.2174,-60,14.5962,-12.6144,-30,-90],[800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pQ1_Z2_Found,pQ1_Z2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[57.2174,-60,14.5962,-12.6144,-30,-90],[800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        !Search YPXN in Wobj0
        poseTransform.rot:=OrientZYX(-90,0,0);
        !Search YPZP in Wobj0
        poseTransform.rot:=OrientZYX(0,-90,-90);

        poseTransform_Q1:=poseTransform;

        poseFrame:=DefFrame(pQ1_Y1_Found,pQ1_Y2_Found,pQ1_Z2_Found\Origin:=3);
        Logging "poseFrame.trans:="+ValToStr(poseFrame.trans);
        Logging "poseFrame.rot:="+GetEulerAngleString(poseFrame.rot);
        wobjCurrent.oframe:=PoseMult(poseFrame,poseTransform);
        !wobjCurrent.oframe.trans:=[0,0,0];
        wobjCurrent.oframe.rot:=[1,0,0,0];
        Logging "oframe.trans:="+ValToStr(wobjCurrent.oframe.trans);
        Logging "oframe.rot:="+GetEulerAngleString(wobjCurrent.oframe.rot);

        wobjLast:=wobjCurrent;
        WriteSysDataLog "Template_10014";

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

    LOCAL PROC Seam_1()
        !ReloadGantryOffset;

        MoveAbsJ [[89.8036,-45,30,0,-45,4.69007],[800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound1_1,pSearchSeam1_1,scanJoint1,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound1_2,pSearchSeam1_2,scanJoint1,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[89.8036,-45,30,0,-45,4.69007],[800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam1_1,posAOSeam1_1,pSeam1_1,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X\Y\Z,peSeam1_2,posAOSeam1_2,pSeam1_2,pSeamFound1_1,pSeamFound1_2;

        MoveAbsJ [[54.848,-45,10.0862,0,-45,-164.158],[800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        PDispSet peSeam1_1;
        MoveJ GetAproachTarget(pSeam1_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam1_1,speedAproach,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1\SeamName:="WeldSeam";
        PDispSet peSeam1_2;
        ArcLEnd pSeam1_2,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        MoveL GetAproachTarget(pSeam1_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[92.1918,-45,10.0862,0.000125473,-44.9998,-164.158],[800,500,0.000264496,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_2()
        MoveAbsJ [[113.189,-52.9601,6.76318,69.1689,-38.7873,-139.676],[800,500,1.49012E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound2_1,pSearchSeam2_1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound2_2,pSearchSeam2_2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[89.8276,-60,20,90,-10,-60],[800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam2_1,posAOSeam2_1,pSeam2_1,pSeamFound2_1,pSeamFound2_2;
        RefreshDisp\X\Y\Z,peSeam2_2,posAOSeam2_2,pSeam2_2,pSeamFound2_1,pSeamFound2_2;
        RefreshDisp\X\Y\Z,peSeam2_3,posAOSeam2_3,pSeam2_3,pSeamFound2_1,pSeamFound2_2;

        !peSeam2_1.trans.z:=pSeamFound1_1.trans.z-pSeam1_1.trans.z+posAOSeam2_1.z;

        MoveAbsJ [[86.4727,-47.3789,17.2334,76.93,-18.8419,-55.6531],[800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        PDispSet peSeam2_1;
        MoveJ GetAproachTarget(pSeam2_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam2_1,speedAproach,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2\SeamName:="WeldSeam";
        PDispSet peSeam2_2;
        ArcL pSeam2_2,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        PDispSet peSeam2_3;
        ArcLEnd pSeam2_3,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        MoveL GetAproachTarget(pSeam2_3),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[98.254,-33.2348,-4.93085,65.8677,-27.9526,-59.3318],[800,500,1.49012E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_3()
        MoveAbsJ [[87.6697,-60,30,0,-20,0.596836],[800,-500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound3_1,pSearchSeam3_1,scanJoint3,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound3_2,pSearchSeam3_2,scanJoint3,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[87.6697,-60,30,0,-20,0.596836],[800,-500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam3_1,posAOSeam3_1,pSeam3_1,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X\Y\Z,peSeam3_2,posAOSeam3_2,pSeam3_2,pSeamFound3_1,pSeamFound3_2;

        MoveAbsJ [[120.05,-45,9.19948,0,-30,188.432],[800,-500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        PDispSet peSeam3_1;
        MoveJ GetAproachTarget(pSeam3_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam3_1,speedAproach,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1\SeamName:="WeldSeam";
        PDispSet peSeam3_2;
        ArcLEnd pSeam3_2,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        MoveL GetAproachTarget(pSeam3_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[120.05,-45,9.19948,0,-30,188.432],[800,-500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_4()
        MoveAbsJ [[50.041,-47.6996,14.9196,-22.4149,-57.6893,230.583],[800,-500,1.49012E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound4_1,pSearchSeam4_1,scanJoint4,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound4_2,pSearchSeam4_2,scanJoint4,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[83.2358,-60,30,-45,-49.5969,100.638],[800,-500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam4_1,posAOSeam4_1,pSeam4_1,pSeamFound4_1,pSeamFound4_2;
        RefreshDisp\X\Y\Z,peSeam4_2,posAOSeam4_2,pSeam4_2,pSeamFound4_1,pSeamFound4_2;
        RefreshDisp\X\Y\Z,peSeam4_3,posAOSeam4_3,pSeam4_3,pSeamFound4_1,pSeamFound4_2;

        MoveAbsJ [[94.2338,-34.6748,21.4062,-37.1393,-50.5632,71.7215],[800,-500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        PDispSet peSeam4_1;
        MoveJ GetAproachTarget(pSeam4_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam4_1,speedAproach,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2\SeamName:="WeldSeam";
        PDispSet peSeam4_2;
        ArcL pSeam4_2,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        PDispSet peSeam4_3;
        ArcLEnd pSeam4_3,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        MoveL GetAproachTarget(pSeam4_3),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[80.0186,-23.9942,-8.48631,-51.9854,-46.7499,102.517],[800,-500,1.49012E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC
    
    LOCAL PROC Seam_5()
        MoveAbsJ [[147.387,-45,25.1431,35.3544,-48.8681,23.5475],[800,-500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound5_1,pSearchSeam5_1,scanJoint7,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound5_2,pSearchSeam5_2,scanJoint7,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[134.944,-49.8207,23.1384,33.087,-39.4355,-41.3668],[800,-500,1.11759E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[69.9818,-48.9757,6.34264,-62.7015,-22.7564,270],[800,-500,1.11759E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam5_1,posAOSeam5_1,pSeam5_1,pSeamFound5_1,pSeamFound5_2;
        MoveJ GetAproachTarget(pSeam5_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam5_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam5_2,posAOSeam5_2,pSeam5_2,pSeamFound5_1,pSeamFound5_2;
        ArcL pSeam5_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam5_3,posAOSeam5_3,pSeam5_3,pSeamFound5_1,pSeamFound5_2;
        ArcLEnd pSeam5_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam5_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[64.2701,-48.9794,19.2184,-51.7214,-36.0267,265.328],[808.901,-530.05,235.674,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_6()
        !MoveAbsJ jointReadyQuadrant4, speedAir, zoneAir, toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[133.323,-63.7916,29.0313,26.8015,-14.0673,-149.248],[856.738,-202.507,-177.685,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound6_1,pSearchSeam6_1,scanJoint6,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound6_2,pSearchSeam6_2,scanJoint6,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[115.057,-5.43864,10.6614,9.15885,-50.2402,-123.079],[859.811,-197.86,180.003,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[77.6642,-20.5292,21.7224,-21.8752,-52.8969,-92.4213],[859.811,-197.861,180.002,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam6_1,posAOSeam6_1,pSeam6_1,pSeamFound6_1,pSeamFound6_2;
        MoveJ GetAproachTarget(pSeam6_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam6_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam6_2,posAOSeam6_2,pSeam6_2,pSeamFound6_1,pSeamFound6_2;
        ArcLEnd pSeam6_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam6_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[113.513,-23.939,11.7589,2.23008,-56.7628,-137.662],[859.811,-197.862,-204.744,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_7()
        MoveAbsJ [[45.9334,-60,33.8211,-29.2108,-36.3224,-34.8371],[800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound7_1,pSearchSeam7_1,scanJoint5,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound7_2,pSearchSeam7_2,scanJoint5,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[45.9334,-60,33.8211,-29.2108,-36.3224,-34.8371],[800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[148.573,-19.3696,-25.4619,62.3876,-66.8332,-16.4782],[800,500,1.11759E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam7_1,posAOSeam7_1,pSeam7_1,pSeamFound7_1,pSeamFound7_2;
        MoveJ GetAproachTarget(pSeam7_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam7_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam7_2,posAOSeam7_2,pSeam7_2,pSeamFound7_1,pSeamFound7_2;
        ArcL pSeam7_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam7_3,posAOSeam7_3,pSeam7_3,pSeamFound7_1,pSeamFound7_2;
        ArcLEnd pSeam7_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam7_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[131.088,-24.7087,-23.3642,70.0898,-35.59,-4.74765],[800,500,-0.000242144,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_8()
        MoveAbsJ [[69.9818,-48.9757,6.34264,-62.7015,-22.7564,270],[800,-500,1.11759E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam8_1,posAOSeam8_1,pSeam8_1,pSeamFound5_1,pSeamFound5_2;
        MoveJ GetAproachTarget(pSeam8_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam8_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam8_2,posAOSeam8_2,pSeam8_2,pSeamFound5_1,pSeamFound5_2;
        ArcL pSeam8_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam8_3,posAOSeam8_3,pSeam8_3,pSeamFound5_1,pSeamFound5_2;
        ArcLEnd pSeam8_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam8_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[64.2701,-48.9794,19.2184,-51.7214,-36.0267,265.328],[808.901,-530.05,235.674,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_9()
        MoveAbsJ [[77.6642,-20.5292,21.7224,-21.8752,-52.8969,-92.4213],[859.811,-197.861,180.002,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam9_1,posAOSeam9_1,pSeam9_1,pSeamFound6_1,pSeamFound6_2;
        MoveJ GetAproachTarget(pSeam9_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam9_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam9_2,posAOSeam9_2,pSeam9_2,pSeamFound6_1,pSeamFound6_2;
        ArcLEnd pSeam9_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam9_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[113.513,-23.939,11.7589,2.23008,-56.7628,-137.662],[859.811,-197.862,-204.744,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_10()
        MoveAbsJ [[148.573,-19.3696,-25.4619,62.3876,-66.8332,-16.4782],[800,500,1.11759E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam10_1,posAOSeam10_1,pSeam10_1,pSeamFound7_1,pSeamFound7_2;
        MoveJ GetAproachTarget(pSeam10_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam10_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam10_2,posAOSeam10_2,pSeam10_2,pSeamFound7_1,pSeamFound7_2;
        ArcL pSeam10_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam10_3,posAOSeam10_3,pSeam10_3,pSeamFound7_1,pSeamFound7_2;
        ArcLEnd pSeam10_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam10_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[131.088,-24.7087,-23.3642,70.0898,-35.59,-4.74765],[800,500,-0.000242144,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_11()
        MoveAbsJ [[69.9818,-48.9757,6.34264,-62.7015,-22.7564,270],[800,-500,1.11759E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam11_1,posAOSeam11_1,pSeam11_1,pSeamFound5_1,pSeamFound5_2;
        MoveJ GetAproachTarget(pSeam11_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam11_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam11_2,posAOSeam11_2,pSeam11_2,pSeamFound5_1,pSeamFound5_2;
        ArcL pSeam11_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam11_3,posAOSeam11_3,pSeam11_3,pSeamFound5_1,pSeamFound5_2;
        ArcLEnd pSeam11_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam11_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[64.2701,-48.9794,19.2184,-51.7214,-36.0267,265.328],[808.901,-530.05,235.674,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_12()
        MoveAbsJ [[77.6642,-20.5292,21.7224,-21.8752,-52.8969,-92.4213],[859.811,-197.861,180.002,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam12_1,posAOSeam12_1,pSeam12_1,pSeamFound6_1,pSeamFound6_2;
        MoveJ GetAproachTarget(pSeam12_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam12_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam12_2,posAOSeam12_2,pSeam12_2,pSeamFound6_1,pSeamFound6_2;
        ArcLEnd pSeam12_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam12_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[113.513,-23.939,11.7589,2.23008,-56.7628,-137.662],[859.811,-197.862,-204.744,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_13()
        MoveAbsJ [[148.573,-19.3696,-25.4619,62.3876,-66.8332,-16.4782],[800,500,1.11759E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam13_1,posAOSeam13_1,pSeam13_1,pSeamFound7_1,pSeamFound7_2;
        MoveJ GetAproachTarget(pSeam13_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam13_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam13_2,posAOSeam13_2,pSeam13_2,pSeamFound7_1,pSeamFound7_2;
        ArcL pSeam13_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam13_3,posAOSeam13_3,pSeam13_3,pSeamFound7_1,pSeamFound7_2;
        ArcLEnd pSeam13_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam13_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[131.088,-24.7087,-23.3642,70.0898,-35.59,-4.74765],[800,500,-0.000242144,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_14()
        MoveAbsJ [[69.9818,-48.9757,6.34264,-62.7015,-22.7564,270],[800,-500,1.11759E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam14_1,posAOSeam14_1,pSeam14_1,pSeamFound5_1,pSeamFound5_2;
        MoveJ GetAproachTarget(pSeam14_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam14_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam14_2,posAOSeam14_2,pSeam14_2,pSeamFound5_1,pSeamFound5_2;
        ArcL pSeam14_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam14_3,posAOSeam14_3,pSeam14_3,pSeamFound5_1,pSeamFound5_2;
        ArcLEnd pSeam14_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam14_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[64.2701,-48.9794,19.2184,-51.7214,-36.0267,265.328],[808.901,-530.05,235.674,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_15()
        MoveAbsJ [[77.6642,-20.5292,21.7224,-21.8752,-52.8969,-92.4213],[859.811,-197.861,180.002,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam15_1,posAOSeam15_1,pSeam15_1,pSeamFound6_1,pSeamFound6_2;
        MoveJ GetAproachTarget(pSeam15_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam15_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam15_2,posAOSeam15_2,pSeam15_2,pSeamFound6_1,pSeamFound6_2;
        ArcLEnd pSeam15_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam15_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[113.513,-23.939,11.7589,2.23008,-56.7628,-137.662],[859.811,-197.862,-204.744,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_16()
        MoveAbsJ [[148.573,-19.3696,-25.4619,62.3876,-66.8332,-16.4782],[800,500,1.11759E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam16_1,posAOSeam16_1,pSeam16_1,pSeamFound7_1,pSeamFound7_2;
        MoveJ GetAproachTarget(pSeam16_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam16_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam16_2,posAOSeam16_2,pSeam16_2,pSeamFound7_1,pSeamFound7_2;
        ArcL pSeam16_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam16_3,posAOSeam16_3,pSeam16_3,pSeamFound7_1,pSeamFound7_2;
        ArcLEnd pSeam16_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam16_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[131.088,-24.7087,-23.3642,70.0898,-35.59,-4.74765],[800,500,-0.000242144,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_21()
        MoveAbsJ [[105.094,-39.4504,18.876,66.3755,-48.4178,-99.4821],[800,500,2.4149,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound1_1,pSearchSeam1_1,scanJoint1,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound1_2,pSearchSeam1_2,scanJoint1,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[121.312,-20.8694,22.2274,45.2696,-84.1783,94.4141],[800,500.001,480,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound2_1,pSearchSeam2_1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound2_2,pSearchSeam2_2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[87.5788,-17.9884,-3.36047,91.5666,-40.8279,-105.447],[800,500,456,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[85.9621,-35.2551,10.8295,97.6802,-38.2092,-182.774],[800.001,500,456,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam21_1,posAOSeam21_1,pSeam21_1,pSeamFound1_1,pSeamFound1_2;
        MoveJ GetAproachTarget(pSeam21_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam21_1,speedAproach,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam21_2,posAOSeam21_2,pSeam21_2,pSeamFound1_1,pSeamFound1_2;
        ArcL pSeam21_2,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\X\Y\Z,peSeam21_3,posAOSeam21_3,pSeam21_3,pSeamFound1_1,pSeamFound1_2;
        ArcL pSeam21_3,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam21_4,posAOSeam21_4,pSeam21_4,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X,peSeam21_4,posAOSeam21_4,pSeam21_4,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam21_4,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam21_5,posAOSeam21_5,pSeam21_5,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X,peSeam21_5,posAOSeam21_5,pSeam21_5,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam21_5,speedAproach,seamShared,weldShared_6\Weave:=weaveShared_6,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_6;
        RefreshDisp\Y\Z,peSeam21_6,posAOSeam21_6,pSeam21_6,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X,peSeam21_6,posAOSeam21_6,pSeam21_6,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam21_6,speedWeld,seamShared,weldShared_6\Weave:=weaveShared_6,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_6;
        RefreshDisp\X\Y\Z,peSeam21_7,posAOSeam21_7,pSeam21_7,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam21_7,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        RefreshDisp\X\Y\Z,peSeam21_8,posAOSeam21_8,pSeam21_8,pSeamFound2_1,pSeamFound2_2;
        ArcLEnd pSeam21_8,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        MoveL GetAproachTarget(pSeam21_8),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[106.626,-66.1115,30.6261,79.0368,-44.0713,-81.2002],[567.974,449.71,440.405,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_24()
        MoveAbsJ [[68.8667,-31.6133,44.9288,157.731,50.0277,-137.367],[871.349,-465.412,580.706,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound3_1,pSearchSeam3_1,scanJoint3,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound3_2,pSearchSeam3_2,scanJoint3,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[73.5926,2.4661,28.782,135.453,98.0292,-12.13],[871.349,-465.412,580.706,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound4_1,pSearchSeam4_1,scanJoint4,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound4_2,pSearchSeam4_2,scanJoint4,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[79.1434,-6.2032,23.337,125.165,66.0271,-121.231],[871.349,-465.412,580.706,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[80.0917,-5.8906,19.0881,125.469,66.822,-93.7918],[871.348,-465.412,580.706,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam24_1,posAOSeam24_1,pSeam24_1,pSeamFound3_1,pSeamFound3_2;
        MoveJ GetAproachTarget(pSeam24_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam24_1,speedAproach,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam24_2,posAOSeam24_2,pSeam24_2,pSeamFound3_1,pSeamFound3_2;
        ArcL pSeam24_2,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\X\Y\Z,peSeam24_3,posAOSeam24_3,pSeam24_3,pSeamFound3_1,pSeamFound3_2;
        ArcL pSeam24_3,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam24_4,posAOSeam24_4,pSeam24_4,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X,peSeam24_4,posAOSeam24_4,pSeam24_4,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam24_4,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam24_5,posAOSeam24_5,pSeam24_5,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X,peSeam24_5,posAOSeam24_5,pSeam24_5,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam24_5,speedAproach,seamShared,weldShared_7\Weave:=weaveShared_7,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_7;
        RefreshDisp\Y\Z,peSeam24_6,posAOSeam24_6,pSeam24_6,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X,peSeam24_6,posAOSeam24_6,pSeam24_6,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam24_6,speedWeld,seamShared,weldShared_7\Weave:=weaveShared_7,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_7;
        RefreshDisp\X\Y\Z,peSeam24_7,posAOSeam24_7,pSeam24_7,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam24_7,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        RefreshDisp\X\Y\Z,peSeam24_8,posAOSeam24_8,pSeam24_8,pSeamFound4_1,pSeamFound4_2;
        ArcLEnd pSeam24_8,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        MoveL GetAproachTarget(pSeam24_8),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[51.0238,0.120287,15.5792,109.912,100.09,-121.139],[871.35,-465.41,580.707,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

ENDMODULE
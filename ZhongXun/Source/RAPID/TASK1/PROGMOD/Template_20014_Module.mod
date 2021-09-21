MODULE Template_20014_Module
    !*****************************************************
    !Module Name:   Template_20014_Module
    !Version:       1.0
    !Description:   All the targets are coordinated in its self coordinate system
    !Date:          2021-8-21
    !Author:        Michael
    !*****************************************************

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
    LOCAL PERS robtarget pQ4_Y1:=[[0,-250,0],[0.32651,-0.65651,-0.665404,0.140086],[1,-1,0,1],[800,-500,450.507,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ4_Y2:=[[0,-100,0],[0.326511,-0.656509,-0.665404,0.140087],[1,-1,0,1],[800,-500,450.507,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ4_Z1:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_Z2:=[[0.00,0.00,350.00],[0.527973,-0.298341,-0.784554,-0.129277],[1,-1,0,1],[800,-500,450.507,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ4_X1_Found:=[[-75,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_X2_Found:=[[-30,0,0],[0.37941,0.915976,0.0499502,0.12059],[-1,-1,0,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_Y1_Found:=[[14.83,-255.08,12.37],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ4_Y2_Found:=[[15.34,-104.86,11.47],[0.183013,-0.612372,0.683013,-0.353553],[-1,0,-1,1],[-800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pQ4_Z1_Found:=[[0,0,50],[0.562422,0.303603,0.732963,-0.232963],[-1,-2,-1,1],[-800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pQ4_Z2_Found:=[[13.73,-20.64,360.26],[0.232963,0.732963,-0.303603,0.562422],[-2,-1,1,1],[-800,500,456,9E+09,9E+09,9E+09]];

    LOCAL PERS wobjdata wobjLast:=[FALSE,TRUE,"",[[-2155,0,60],[1,0,0,0]],[[15.6188,-22.739,10.978],[1,0,0,0]]];
    LOCAL PERS pose poseFrame:=[[15.6188,-22.739,10.978],[0.503694,0.497985,0.499296,0.499005]];
    LOCAL PERS pose poseTransform:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q1:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q2:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q3:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];
    LOCAL PERS pose poseTransform_Q4:=[[0,0,0],[0.5,-0.5,-0.5,-0.5]];

    LOCAL PERS robtarget pSearchSeam1_1:=[[100,0,0],[0.120591,-0.0499502,-0.915976,0.37941],[0,0,0,1],[800,500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSearchSeam1_2:=[[25,0,0],[0.120591,-0.0499502,-0.915976,0.37941],[0,0,0,1],[800,500,480,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSearchSeam2_1:=[[0,0,50],[0.232963,0.732963,0.303603,-0.562422],[1,0,-1,1],[800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSearchSeam2_2:=[[0,0,250],[0.562422,0.303603,-0.732963,0.232963],[1,0,-1,1],[800,500,456,9E+9,9E+9,9E+9]];
    LOCAL PERS robtarget pSearchSeam3_1:=[[80,0,0],[0.236994,-0.0364926,-0.926549,-0.289843],[1,-1,0,1],[800,-500,450.507,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam3_2:=[[20,0,0],[0.236992,-0.0364912,-0.926549,-0.289843],[1,-1,0,1],[800,-500,450.507,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam4_1:=[[0,0,25],[0.242391,-0.776959,0.314758,0.488373],[0,-1,3,1],[800,-500,450.507,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam4_2:=[[0,0,500],[0.618495,-0.272918,-0.684572,-0.272655],[0,-1,0,1],[800,-500,450.507,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam5_1:=[[161.50,-125.01,-0.01],[0.258695,-0.685431,-0.679861,0.0324105],[1,-1,0,1],[799.999,-500,480.001,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam5_2:=[[161.5,-50,-0.01],[0.258696,-0.685431,-0.67986,0.0324082],[1,-1,0,1],[799.999,-500,480.001,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam6_1:=[[167.69,-102.08,743.33],[0.000161429,-0.710535,0.703633,-0.00628518],[1,0,-2,1],[452.749,-59.0069,-472.001,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam6_2:=[[167.69,154.14,743.33],[0.000160785,-0.710536,0.703633,-0.00628453],[1,0,-2,1],[452.749,197.215,-472.001,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam7_1:=[[172.5,140,18],[0.298606,0.663087,-0.6864,-0.00225087],[0,0,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSearchSeam7_2:=[[172.5,60,18],[0.298604,0.663086,-0.686402,-0.00225078],[0,0,-1,1],[800,500,456,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pSeamFound1_1:=[[103.17,13.99,0.32],[0.120591,-0.0499502,-0.915976,0.37941],[0,0,0,1],[800,500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound1_2:=[[27.86,13.23,-0.6],[0.120591,-0.0499502,-0.915976,0.37941],[0,0,0,1],[800,500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound2_1:=[[4.42,9.12,53.55],[0.232963,0.732963,0.303603,-0.562422],[1,0,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound2_2:=[[-0.64,17.45,252.85],[0.562422,0.303603,-0.732963,0.232963],[1,0,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound3_1:=[[83.22,1.28,4.95],[0.120591,0.0499502,-0.915976,-0.37941],[0,-1,-1,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound3_2:=[[22.61,0.52,3.53],[0.120591,0.0499502,-0.915976,-0.37941],[0,-1,-1,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound4_1:=[[-5.14,-5.67,25.32],[0.232963,-0.732963,0.303603,0.562422],[0,-1,0,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound4_2:=[[-1.88,3.39,498.93],[0.562422,-0.303603,-0.732963,-0.232963],[0,-1,0,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound5_1:=[[141.15,-125.45,1.12],[0.353553,-0.683013,-0.612372,0.183013],[1,0,0,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound5_2:=[[141.32,-50.4,0.96],[0.353553,-0.683013,-0.612372,0.183013],[1,0,0,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound6_1:=[[155.72,-101.91,736.32],[0.270598,0.653282,-0.653282,-0.270598],[0,-1,-1,1],[800,500,180,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound6_2:=[[156.79,154.36,736.18],[0.270598,0.653282,-0.653282,-0.270598],[0,-1,-1,1],[800,500,180,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound7_1:=[[140.33,132.63,6.29],[0.353553,0.683013,-0.612372,-0.183013],[0,-1,-1,1],[800,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeamFound7_2:=[[139.87,52.98,7.25],[0.353553,0.683013,-0.612372,-0.183013],[0,-1,-1,1],[800,500,480,9E+09,9E+09,9E+09]];

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
    LOCAL PERS robtarget pSeam5_1:=[[164.99,-130.04,-21.75],[0.112353,0.627287,-0.718587,-0.278424],[0,-1,-1,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam5_2:=[[164.99,-32.24,-21.75],[0.112353,0.627287,-0.718587,-0.278424],[1,-1,-1,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam5_3:=[[164.74,2.38,-17.78],[0.00329922,0.578826,-0.727438,-0.368488],[0,-1,-1,1],[799.999,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam6_1:=[[135.16,-120.81,716.46],[0.345787,0.71383,-0.599472,-0.107291],[1,0,-2,1],[870.638,-213.693,-280.225,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam6_2:=[[135.96,169.94,717.34],[0.345787,0.713831,-0.599471,-0.107294],[1,0,-2,1],[870.638,-213.693,-280.225,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam7_1:=[[172.50,144.50,-6.00],[0.127328,-0.626323,-0.711981,0.290843],[1,0,0,1],[799.999,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam7_2:=[[170.90,63.61,-11.57],[0.130142,-0.619395,-0.718016,0.289595],[0,0,0,1],[800,499.999,456.031,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam7_3:=[[170.89,26.58,-11.77],[0.0665778,-0.592277,-0.726922,0.341116],[1,0,0,1],[799.999,500,456.031,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam8_1:=[[164.99,-130.04,-21.75],[0.112353,0.627287,-0.718587,-0.278424],[0,-1,-1,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam8_2:=[[164.99,-32.24,-21.75],[0.112353,0.627287,-0.718587,-0.278424],[1,-1,-1,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam8_3:=[[164.74,2.38,-17.78],[0.00329922,0.578826,-0.727438,-0.368488],[0,-1,-1,1],[799.999,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam9_1:=[[135.16,-120.81,716.46],[0.345787,0.71383,-0.599472,-0.107291],[1,0,-2,1],[870.638,-213.693,-280.225,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam9_2:=[[135.96,169.94,717.34],[0.345787,0.713831,-0.599471,-0.107294],[1,0,-2,1],[870.638,-213.693,-280.225,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam10_1:=[[172.5,144.5,-6],[0.127328,-0.626323,-0.711981,0.290843],[1,0,0,1],[799.999,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam10_2:=[[170.9,63.61,-11.57],[0.130142,-0.619395,-0.718016,0.289595],[0,0,0,1],[800,499.999,456.031,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam10_3:=[[170.89,26.58,-11.77],[0.0665778,-0.592277,-0.726922,0.341116],[1,0,0,1],[799.999,500,456.031,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam11_1:=[[164.99,-130.04,-21.75],[0.112353,0.627287,-0.718587,-0.278424],[0,-1,-1,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam11_2:=[[164.99,-32.24,-21.75],[0.112353,0.627287,-0.718587,-0.278424],[1,-1,-1,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam11_3:=[[164.74,2.38,-17.78],[0.00329922,0.578826,-0.727438,-0.368488],[0,-1,-1,1],[799.999,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam12_1:=[[135.16,-120.81,716.46],[0.345787,0.71383,-0.599472,-0.107291],[1,0,-2,1],[870.638,-213.693,-280.225,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam12_2:=[[135.96,169.94,717.34],[0.345787,0.713831,-0.599471,-0.107294],[1,0,-2,1],[870.638,-213.693,-280.225,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam13_1:=[[172.5,144.5,-6],[0.127328,-0.626323,-0.711981,0.290843],[1,0,0,1],[799.999,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam13_2:=[[170.9,63.61,-11.57],[0.130142,-0.619395,-0.718016,0.289595],[0,0,0,1],[800,499.999,456.031,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam13_3:=[[170.89,26.58,-11.77],[0.0665778,-0.592277,-0.726922,0.341116],[1,0,0,1],[799.999,500,456.031,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam14_1:=[[164.99,-130.04,-21.75],[0.112353,0.627287,-0.718587,-0.278424],[0,-1,-1,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam14_2:=[[164.99,-32.24,-21.75],[0.112353,0.627287,-0.718587,-0.278424],[1,-1,-1,1],[800,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam14_3:=[[164.74,2.38,-17.78],[0.00329922,0.578826,-0.727438,-0.368488],[0,-1,-1,1],[799.999,-500,480,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam15_1:=[[135.16,-120.81,716.46],[0.345787,0.71383,-0.599472,-0.107291],[1,0,-2,1],[870.638,-213.693,-280.225,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam15_2:=[[135.96,169.94,717.34],[0.345787,0.713831,-0.599471,-0.107294],[1,0,-2,1],[870.638,-213.693,-280.225,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam16_1:=[[172.5,144.5,-6],[0.127328,-0.626323,-0.711981,0.290843],[1,0,0,1],[799.999,500,456,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam16_2:=[[170.9,63.61,-11.57],[0.130142,-0.619395,-0.718016,0.289595],[0,0,0,1],[800,499.999,456.031,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam16_3:=[[170.89,26.58,-11.77],[0.0665778,-0.592277,-0.726922,0.341116],[1,0,0,1],[799.999,500,456.031,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pSeam21_1:=[[156,0,0],[0.375673,0.916651,-0.133646,0.0275736],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_2:=[[156,0,0],[0.375674,0.916651,-0.133644,0.0275745],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_3:=[[156,0,0],[0.375672,0.916652,-0.133642,0.0275736],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_4:=[[0,0,0],[0.411828,0.878648,-0.240982,0.0173946],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_5:=[[0.02,0.00,-0.02],[0.559579,0.507293,-0.622641,0.204558],[0,0,-1,1],[567.975,449.039,440.69,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_6:=[[0,0,0],[0.549605,0.275701,-0.700945,0.361385],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_7:=[[0.00,0.00,100.00],[0.672798,0.228919,-0.605343,0.358466],[1,1,-2,1],[567.974,449.041,440.688,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam21_8:=[[14.06,-8.24,645.55],[0.705805,0.169931,-0.571432,0.38266],[1,1,-1,1],[567.974,449.71,240,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_1:=[[134,0,0],[0.412765,-0.909289,0.0387012,0.0363478],[1,1,0,0],[871.35,-465.412,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_2:=[[134,0,0],[0.412765,-0.909289,0.0386965,0.0363475],[1,1,0,0],[871.35,-465.411,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_3:=[[128,-10.97,-12.83],[0.412764,-0.909289,0.0387005,0.0363503],[1,1,0,0],[871.349,-465.412,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_4:=[[3.59,-12.48,-13.38],[0.428722,-0.882929,-0.17301,0.0818541],[1,1,-1,0],[871.35,-465.412,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_5:=[[-1.39,-11.99,-7.80],[0.547347,-0.689456,-0.466884,-0.0841506],[1,1,-1,0],[871.35,-465.411,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_6:=[[-7.11,-11.24,2.57],[0.585739,-0.316714,-0.7033,-0.24894],[1,1,-2,0],[871.35,-465.411,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_7:=[[-7.11,-11.24,100.00],[0.659407,-0.258138,-0.631988,-0.314862],[1,1,-2,0],[871.35,-465.41,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam24_8:=[[-5.24,-14.83,636.58],[0.77652,-0.195134,-0.519129,-0.299073],[1,1,-2,0],[871.19,-465.411,440.267,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pSeam25_1:=[[129.53,-0.06,18.14],[0.493535,0.801522,-0.316406,0.11778],[0,0,-2,1],[760.208,491.375,445.334,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam25_2:=[[127.30,1.08,7.29],[0.493536,0.801522,-0.316405,0.117781],[0,0,-2,1],[760.208,491.375,445.334,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam25_3:=[[121.97,0.22,6.28],[0.493536,0.801523,-0.316404,0.117777],[0,0,-2,1],[760.208,491.375,445.334,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam25_4:=[[29.22,0.21,6.28],[0.493537,0.801522,-0.316405,0.117778],[0,0,-2,1],[760.208,491.375,445.333,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam25_5:=[[29.22,-0.64,11.11],[0.55817,0.766338,-0.317047,-0.0255703],[0,-2,0,1],[580.061,491.375,445.334,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam25_6:=[[27.73,-1.20,20.34],[0.55026,0.765482,-0.330592,-0.0442808],[0,-2,0,1],[580.061,491.375,445.334,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam25_7:=[[26.54,-1.19,42.69],[0.657803,0.674985,-0.321321,-0.0918844],[0,-2,0,1],[580.061,491.375,514.317,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam25_8:=[[25.00,4.70,622.18],[0.767636,0.406562,-0.45852,0.187621],[0,-3,1,1],[580.06,491.376,146.746,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam26_1:=[[134,0,0],[0.412765,-0.909289,0.0387012,0.0363478],[1,1,0,0],[871.35,-465.412,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam26_2:=[[134,0,0],[0.412765,-0.909289,0.0386965,0.0363475],[1,1,0,0],[871.35,-465.411,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam26_3:=[[128,-10.97,-12.83],[0.412764,-0.909289,0.0387005,0.0363503],[1,1,0,0],[871.349,-465.412,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam26_4:=[[3.59,-12.48,-13.38],[0.428722,-0.882929,-0.17301,0.0818541],[1,1,-1,0],[871.35,-465.412,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam26_5:=[[-1.39,-11.99,-7.80],[0.547347,-0.689456,-0.466884,-0.0841506],[1,1,-1,0],[871.35,-465.411,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam26_6:=[[-7.11,-11.24,2.57],[0.53449,-0.397139,-0.660527,-0.346851],[1,1,-2,0],[871.35,-465.411,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam26_7:=[[-7.11,-11.24,100.00],[0.627175,-0.328793,-0.593709,-0.382173],[0,1,-1,0],[871.35,-465.41,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam26_8:=[[-11.77,-9.98,601.68],[0.776659,-0.163911,-0.429969,-0.430188],[0,0,-2,0],[871.35,-465.41,569.719,9E+09,9E+09,9E+09]];

    LOCAL PERS robtarget pSeam27_1:=[[156,0,0],[0.375673,0.916651,-0.133646,0.0275736],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam27_2:=[[156,0,0],[0.375674,0.916651,-0.133644,0.0275745],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam27_3:=[[156,0,0],[0.375672,0.916652,-0.133642,0.0275736],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam27_4:=[[0,0,0],[0.411828,0.878648,-0.240982,0.0173946],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam27_5:=[[0.02,0.00,-0.02],[0.559579,0.507293,-0.622641,0.204558],[0,0,-1,1],[567.975,449.039,440.69,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam27_6:=[[0,0,0],[0.549605,0.275701,-0.700945,0.361385],[0,0,-2,1],[567.974,449.71,440.405,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam27_7:=[[0.00,0.00,100.00],[0.672798,0.228919,-0.605343,0.358466],[1,1,-2,1],[567.974,449.041,440.688,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam27_8:=[[14.06,-8.24,645.55],[0.705805,0.169931,-0.571432,0.38266],[1,1,-1,1],[567.974,449.71,240,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam28_1:=[[134,0,0],[0.412765,-0.909289,0.0387012,0.0363478],[1,1,0,0],[871.35,-465.412,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam28_2:=[[134,0,0],[0.412765,-0.909289,0.0386965,0.0363475],[1,1,0,0],[871.35,-465.411,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam28_3:=[[128,-10.97,-12.83],[0.412764,-0.909289,0.0387005,0.0363503],[1,1,0,0],[871.349,-465.412,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam28_4:=[[3.59,-12.48,-13.38],[0.428722,-0.882929,-0.17301,0.0818541],[1,1,-1,0],[871.35,-465.412,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam28_5:=[[-1.39,-11.99,-7.80],[0.547347,-0.689456,-0.466884,-0.0841506],[1,1,-1,0],[871.35,-465.411,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam28_6:=[[-7.11,-11.24,2.57],[0.585739,-0.316714,-0.7033,-0.24894],[1,1,-2,0],[871.35,-465.411,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam28_7:=[[-7.11,-11.24,100.00],[0.659407,-0.258138,-0.631988,-0.314862],[1,1,-2,0],[871.35,-465.41,580.705,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget pSeam28_8:=[[-5.24,-14.83,636.58],[0.77652,-0.195134,-0.519129,-0.299073],[1,1,-2,0],[871.19,-465.411,440.267,9E+09,9E+09,9E+09]];

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
    LOCAL PERS pos posAOSeam5_1:=[8,0,-5];
    LOCAL PERS pos posAOSeam5_2:=[8,0,-5];
    LOCAL PERS pos posAOSeam5_3:=[8,0,-5];
    LOCAL PERS pos posAOSeam6_1:=[-18,-5,-17];
    LOCAL PERS pos posAOSeam6_2:=[-18,-5,-17];
    LOCAL PERS pos posAOSeam7_1:=[13,15,-8];
    LOCAL PERS pos posAOSeam7_2:=[13,0,-8];
    LOCAL PERS pos posAOSeam7_3:=[13,-5,-8];
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

    LOCAL PERS pos posAOSeam21_1:=[-5,-5,5];
    LOCAL PERS pos posAOSeam21_2:=[-8,0,6];
    LOCAL PERS pos posAOSeam21_3:=[-10,0,5];
    LOCAL PERS pos posAOSeam21_4:=[25,-1,7];
    LOCAL PERS pos posAOSeam21_5:=[13,-1,10];
    LOCAL PERS pos posAOSeam21_6:=[10,-1,17];
    LOCAL PERS pos posAOSeam21_7:=[11,1,0];
    LOCAL PERS pos posAOSeam21_8:=[20,-10,0];
    LOCAL PERS pos posAOSeam24_1:=[-5,0,-10];
    LOCAL PERS pos posAOSeam24_2:=[-10,0,-9];
    LOCAL PERS pos posAOSeam24_3:=[-5,0,-8];
    LOCAL PERS pos posAOSeam24_4:=[13,-1,-7];
    LOCAL PERS pos posAOSeam24_5:=[0,-3,-2];
    LOCAL PERS pos posAOSeam24_6:=[-5,1,8];
    LOCAL PERS pos posAOSeam24_7:=[-5,4,0];
    LOCAL PERS pos posAOSeam24_8:=[-10,-1,0];

    LOCAL PERS pos posAOSeam25_1:=[0,-2,11];
    LOCAL PERS pos posAOSeam25_2:=[0,-2,11];
    LOCAL PERS pos posAOSeam25_3:=[0,-2,11];
    LOCAL PERS pos posAOSeam25_4:=[20,-2,13];
    LOCAL PERS pos posAOSeam25_5:=[13,-1,10];
    LOCAL PERS pos posAOSeam25_6:=[0,0,0];
    LOCAL PERS pos posAOSeam25_7:=[0,0,0];
    LOCAL PERS pos posAOSeam25_8:=[0,0,0];
    LOCAL PERS pos posAOSeam26_1:=[-10,-5,0];
    LOCAL PERS pos posAOSeam26_2:=[-15,-5,0];
    LOCAL PERS pos posAOSeam26_3:=[-20,-5,0];
    LOCAL PERS pos posAOSeam26_4:=[13,-5,0];
    LOCAL PERS pos posAOSeam26_5:=[7,-4,3];
    LOCAL PERS pos posAOSeam26_6:=[6,-4,8];
    LOCAL PERS pos posAOSeam26_7:=[4,4,0];
    LOCAL PERS pos posAOSeam26_8:=[-2,0,0];

    LOCAL PERS pos posAOSeam27_1:=[-5,-5,5];
    LOCAL PERS pos posAOSeam27_2:=[-8,0,6];
    LOCAL PERS pos posAOSeam27_3:=[-10,0,5];
    LOCAL PERS pos posAOSeam27_4:=[25,-1,7];
    LOCAL PERS pos posAOSeam27_5:=[13,-1,10];
    LOCAL PERS pos posAOSeam27_6:=[10,-1,17];
    LOCAL PERS pos posAOSeam27_7:=[11,1,0];
    LOCAL PERS pos posAOSeam27_8:=[20,-10,0];
    LOCAL PERS pos posAOSeam28_1:=[-5,0,-10];
    LOCAL PERS pos posAOSeam28_2:=[-10,0,-9];
    LOCAL PERS pos posAOSeam28_3:=[-5,0,-8];
    LOCAL PERS pos posAOSeam28_4:=[13,-1,-7];
    LOCAL PERS pos posAOSeam28_5:=[0,-3,-2];
    LOCAL PERS pos posAOSeam28_6:=[-5,1,8];
    LOCAL PERS pos posAOSeam28_7:=[-5,4,0];
    LOCAL PERS pos posAOSeam28_8:=[-10,-1,0];

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
    LOCAL PERS pose peSeam5_1:=[[-15.8502,0.102798,17.8796],[1,0,0,0]];
    LOCAL PERS pose peSeam5_2:=[[-15.6286,0.101864,17.6711],[1,0,0,0]];
    LOCAL PERS pose peSeam5_3:=[[-15.3002,0.0925035,13.6273],[1,0,0,0]];
    LOCAL PERS pose peSeam6_1:=[[2.48077,-5.07465,2.87036],[1,0,0,0]];
    LOCAL PERS pose peSeam6_2:=[[2.89471,-5.07697,1.83148],[1,0,0,0]];
    LOCAL PERS pose peSeam7_1:=[[-19.0995,15.3317,4.14294],[1,0,0,0]];
    LOCAL PERS pose peSeam7_2:=[[-17.9663,0.404068,10.687],[1,0,0,0]];
    LOCAL PERS pose peSeam7_3:=[[-18.1701,-4.58697,11.3332],[1,0,0,0]];
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

    LOCAL PERS pose peSeam21_1:=[[-5.15831,9.52154,5.96345],[1,0,0,0]];
    LOCAL PERS pose peSeam21_2:=[[-8.15831,14.5215,6.96345],[1,0,0,0]];
    LOCAL PERS pose peSeam21_3:=[[-10.1583,14.5215,5.96345],[1,0,0,0]];
    LOCAL PERS pose peSeam21_4:=[[30.7831,11.9476,6.0582],[1,0,0,0]];
    LOCAL PERS pose peSeam21_5:=[[18.7637,11.9478,9.07844],[1,0,0,0]];
    LOCAL PERS pose peSeam21_6:=[[15.7831,11.9476,16.0582],[1,0,0,0]];
    LOCAL PERS pose peSeam21_7:=[[14.2503,12.0456,-0.379143],[1,0,0,0]];
    LOCAL PERS pose peSeam21_8:=[[-4.60977,32.0039,-2.38043],[1,0,0,0]];
    LOCAL PERS pose peSeam24_1:=[[-5.16776,1.91464,-3.86423],[1,0,0,0]];
    LOCAL PERS pose peSeam24_2:=[[-10.1678,1.91464,-2.86423],[1,0,0,0]];
    LOCAL PERS pose peSeam24_3:=[[-5.60136,12.804,10.815],[1,0,0,0]];
    LOCAL PERS pose peSeam24_4:=[[4.00324,11.7547,9.45161],[1,0,0,0]];
    LOCAL PERS pose peSeam24_5:=[[-3.97853,9.20398,8.75823],[1,0,0,0]];
    LOCAL PERS pose peSeam24_6:=[[-3.18736,12.3855,8.26022],[1,0,0,0]];
    LOCAL PERS pose peSeam24_7:=[[-2.51699,10.9957,-0.150917],[1,0,0,0]];
    LOCAL PERS pose peSeam24_8:=[[-5.69546,19.845,-0.428406],[1,0,0,0]];

    LOCAL PERS pose peSeam25_1:=[[0.0692749,12.3167,-6.49714],[1,0,0,0]];
    LOCAL PERS pose peSeam25_2:=[[-0.0511856,11.153,4.32415],[1,0,0,0]];
    LOCAL PERS pose peSeam25_3:=[[-0.0708542,11.959,5.2688],[1,0,0,0]];
    LOCAL PERS pose peSeam25_4:=[[-3.57735,11.0332,6.13603],[1,0,0,0]];
    LOCAL PERS pose peSeam25_5:=[[-10.6988,12.8838,-1.69335],[1,0,0,0]];
    LOCAL PERS pose peSeam25_6:=[[15.7412,12.1298,15.8863],[1,0,0,0]];
    LOCAL PERS pose peSeam25_7:=[[14.2091,11.8515,-0.382355],[1,0,0,0]];
    LOCAL PERS pose peSeam25_8:=[[-4.64692,32.3212,-2.43451],[1,0,0,0]];
    LOCAL PERS pose peSeam26_1:=[[-10.1678,-3.08536,6.13577],[1,0,0,0]];
    LOCAL PERS pose peSeam26_2:=[[-15.1678,-3.08536,6.13577],[1,0,0,0]];
    LOCAL PERS pose peSeam26_3:=[[-20.6014,7.80396,18.815],[1,0,0,0]];
    LOCAL PERS pose peSeam26_4:=[[4.00324,7.75467,16.4516],[1,0,0,0]];
    LOCAL PERS pose peSeam26_5:=[[3.02147,8.20398,13.7582],[1,0,0,0]];
    LOCAL PERS pose peSeam26_6:=[[7.81264,7.38547,8.26022],[1,0,0,0]];
    LOCAL PERS pose peSeam26_7:=[[6.48301,10.9957,-0.150917],[1,0,0,0]];
    LOCAL PERS pose peSeam26_8:=[[8.59474,15.3286,-0.366211],[1,0,0,0]];

    LOCAL PERS pose peSeam27_1:=[[-5.11118,9.24859,5.75099],[1,0,0,0]];
    LOCAL PERS pose peSeam27_2:=[[-8.11118,14.2486,6.75099],[1,0,0,0]];
    LOCAL PERS pose peSeam27_3:=[[-10.1112,14.2486,5.75099],[1,0,0,0]];
    LOCAL PERS pose peSeam27_4:=[[30.7412,12.1298,5.88632],[1,0,0,0]];
    LOCAL PERS pose peSeam27_5:=[[18.7217,12.1299,8.90655],[1,0,0,0]];
    LOCAL PERS pose peSeam27_6:=[[15.7412,12.1298,15.8863],[1,0,0,0]];
    LOCAL PERS pose peSeam27_7:=[[14.2091,11.8515,-0.382355],[1,0,0,0]];
    LOCAL PERS pose peSeam27_8:=[[-4.64692,32.3212,-2.43451],[1,0,0,0]];
    LOCAL PERS pose peSeam28_1:=[[-5.12456,1.91719,-4.57234],[1,0,0,0]];
    LOCAL PERS pose peSeam28_2:=[[-10.1246,1.91719,-3.57234],[1,0,0,0]];
    LOCAL PERS pose peSeam28_3:=[[-5.50514,12.7985,10.1426],[1,0,0,0]];
    LOCAL PERS pose peSeam28_4:=[[3.78267,11.5796,9.44914],[1,0,0,0]];
    LOCAL PERS pose peSeam28_5:=[[-4.19748,9.02192,8.7813],[1,0,0,0]];
    LOCAL PERS pose peSeam28_6:=[[-3.40328,12.1952,8.31174],[1,0,0,0]];
    LOCAL PERS pose peSeam28_7:=[[-2.70426,11.0398,-0.147552],[1,0,0,0]];
    LOCAL PERS pose peSeam28_8:=[[-5.72494,19.6154,-0.414551],[1,0,0,0]];

    !Only for local welding parameters
    LOCAL PERS welddata weld_1:=[6,0,[38,0,-1,0,0,350,0,0,0],[0,0,0,0,0,0,0,0,0]];
    LOCAL PERS weavedata weave_1:=[1,0,4,6,0,0,0,0,0,0,0,0,0,0,0];
    LOCAL PERS trackdata track_1:=[0,TRUE,50,[0,30,30,0,0,0,0,0,0],[0,0,0,0,0,0,0]];

    !wobjCurrent must be set correctly
    !extOffsetCurrent must be set correctly
    PROC Template_20014()
        Logging "Start to run Template_20014...";
        SetGO Go112_WeldCompleted,0;
        SetGO Go80_WeldingStatus,0;

        IF boolEnableGantryOffset THEN
            LoadGantryOffset;
        ENDIF

        MoveToReadyQuadrant 4;
        IF boolEnableSearch THEN
            SearchAndProcess;
        ENDIF

        WeldSeam 24;
        MoveToReadyQuadrant 4;

        MoveToReadyQuadrant 1;
        WeldSeam 21;
        WeldSeam 7;
        MoveToReadyQuadrant 1;

        MoveToReadyQuadrant 4;
        WeldSeam 6;
        WeldSeam 5;
        WeldSeam 26;
        MoveToReadyQuadrant 4;

        MoveToReadyQuadrant 1;
        WeldSeam 25;
        WeldSeam 10;
        MoveToReadyQuadrant 1;

        MoveToReadyQuadrant 4;
        WeldSeam 9;
        WeldSeam 8;
        WeldSeam 28;
        MoveToReadyQuadrant 4;

        MoveToReadyQuadrant 1;
        WeldSeam 27;
        WeldSeam 13;
        MoveToReadyQuadrant 1;

        MoveToReadyQuadrant 4;
        WeldSeam 12;
        WeldSeam 11;
        MoveToReadyQuadrant 4;

        MoveToReadyQuadrant 1;
        WeldSeam 16;
        MoveToReadyQuadrant 1;

        MoveToReadyQuadrant 4;
        WeldSeam 15;
        WeldSeam 14;
        MoveToReadyQuadrant 4;

        EOffsOff;
        Incr numPartCount;
        Logging "Template_20014 is done";

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

        MoveAbsJ [[101.259,-45.1049,40.0317,-9.65812,-44.1596,82.4076],[800,-500,450.507,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pQ4_Y1_Found,pQ4_Y1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pQ4_Y2_Found,pQ4_Y2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[101.259,-45.1048,40.0317,-9.65839,-44.1594,82.4075],[800,-500,450.507,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        !MoveAbsJ [[-89.7306,-43.1368,0,-20,-65.7254,9.9994],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        !ScanSeamByLaser pQ4_X1_Found,pQ4_X1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        !ScanSeamByLaser pQ4_X2_Found,pQ4_X2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        !MoveAbsJ [[-89.7306,-43.1368,0,-20,-65.7254,9.9994],[-800,500,0,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        !MoveAbsJ [[-92.7971,-23.7414,5.96932,0,-45.8213,6.36111E-15],[-800,500,0,9E+9,9E+9,9E+9]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        !ScanSeamByLaser pQ4_Z1_Found,pQ4_Z1,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[101.259,-45.1049,40.0318,-9.65839,-44.1596,82.4076],[800,-500,450.507,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pQ4_Z2_Found,pQ4_Z2,scanJoint2,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[76.2804,-66.3822,48.4628,-73.4509,-45.2956,98.8218],[800,-500,450.507,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        !Search YPXN in Wobj0
        poseTransform.rot:=OrientZYX(-90,0,0);
        !Search YPZP in Wobj0
        poseTransform.rot:=OrientZYX(0,-90,-90);

        poseTransform_Q4:=poseTransform;

        poseFrame:=DefFrame(pQ4_Y1_Found,pQ4_Y2_Found,pQ4_Z2_Found\Origin:=3);
        Logging "poseFrame.trans:="+ValToStr(poseFrame.trans);
        Logging "poseFrame.rot:="+GetEulerAngleString(poseFrame.rot);
        wobjCurrent.oframe:=PoseMult(poseFrame,poseTransform);
        !wobjCurrent.oframe.trans:=[0,0,0];
        wobjCurrent.oframe.rot:=[1,0,0,0];
        Logging "oframe.trans:="+ValToStr(wobjCurrent.oframe.trans);
        Logging "oframe.rot:="+GetEulerAngleString(wobjCurrent.oframe.rot);

        wobjLast:=wobjCurrent;
        WriteSysDataLog "Template_20014";

    ENDPROC
    
     LOCAL PROC CopySeamTargets()
        peSeam25_1:=peSeam21_1;
        peSeam25_2:=peSeam21_2;
        peSeam25_3:=peSeam21_3;
        peSeam25_4:=peSeam21_4;
        peSeam25_5:=peSeam21_5;
        peSeam25_6:=peSeam21_6;
        peSeam25_7:=peSeam21_7;
        peSeam25_8:=peSeam21_8;
        peSeam26_1:=peSeam24_1;
        peSeam26_2:=peSeam24_2;
        peSeam26_3:=peSeam24_3;
        peSeam26_4:=peSeam24_4;
        peSeam26_5:=peSeam24_5;
        peSeam26_6:=peSeam24_6;
        peSeam26_7:=peSeam24_7;
        peSeam26_8:=peSeam24_8;
        
        peSeam27_1:=peSeam21_1;
        peSeam27_2:=peSeam21_2;
        peSeam27_3:=peSeam21_3;
        peSeam27_4:=peSeam21_4;
        peSeam27_5:=peSeam21_5;
        peSeam27_6:=peSeam21_6;
        peSeam27_7:=peSeam21_7;
        peSeam27_8:=peSeam21_8;
        peSeam28_1:=peSeam24_1;
        peSeam28_2:=peSeam24_2;
        peSeam28_3:=peSeam24_3;
        peSeam28_4:=peSeam24_4;
        peSeam28_5:=peSeam24_5;
        peSeam28_6:=peSeam24_6;
        peSeam28_7:=peSeam24_7;
        peSeam28_8:=peSeam24_8;
        
        pSeam8_1:=pSeam5_1;
        pSeam8_2:=pSeam5_2;
        pSeam8_3:=pSeam5_3;
        pSeam9_1:=pSeam6_1;
        pSeam9_2:=pSeam6_2;
        pSeam10_1:=pSeam7_1;
        pSeam10_2:=pSeam7_2;
        pSeam10_3:=pSeam7_3;

        pSeam11_1:=pSeam5_1;
        pSeam11_2:=pSeam5_2;
        pSeam11_3:=pSeam5_3;
        pSeam12_1:=pSeam6_1;
        pSeam12_2:=pSeam6_2;
        pSeam13_1:=pSeam7_1;
        pSeam13_2:=pSeam7_2;
        pSeam13_3:=pSeam7_3;

        pSeam14_1:=pSeam5_1;
        pSeam14_2:=pSeam5_2;
        pSeam14_3:=pSeam5_3;
        pSeam15_1:=pSeam6_1;
        pSeam15_2:=pSeam6_2;
        pSeam16_1:=pSeam7_1;
        pSeam16_2:=pSeam7_2;
        pSeam16_3:=pSeam7_3;
    ENDPROC

    LOCAL PROC WeldSeam(num numSeamIndex)
        UpdateWeldSeamStatus\Start,numSeamIndex;
        %"Seam_"+ValToStr(numSeamIndex)%;
        UpdateWeldSeamStatus numSeamIndex;
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
        MoveAbsJ [[134.944,-49.8208,23.1384,33.087,-39.4355,-51.3418],[799.999,-500,1.11759E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[69.9818,-48.9757,6.34264,-62.7016,-22.7564,-7.67796],[800,-500,1.11759E-05,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam5_1,posAOSeam5_1,pSeam5_1,pSeamFound5_1,pSeamFound5_2;
        MoveJ GetAproachTarget(pSeam5_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam5_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam5_2,posAOSeam5_2,pSeam5_2,pSeamFound5_1,pSeamFound5_2;
        ArcL pSeam5_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        RefreshDisp\X\Y\Z,peSeam5_3,posAOSeam5_3,pSeam5_3,pSeamFound5_1,pSeamFound5_2;
        ArcLEnd pSeam5_3,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam5_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[60.9739,-32.8513,1.57206,-66.7281,-37.4931,137.806],[1144.68,-500,-327.589,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_6()
        !MoveAbsJ jointReadyQuadrant4, speedAir, zoneAir, toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[90.3375,-31.7511,31.8035,0.490368,-90.5796,-90.8935],[679.217,-400.368,-539.775,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound6_1,pSearchSeam6_1,scanJoint9,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound6_2,pSearchSeam6_2,scanJoint9,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[90.3369,-31.7505,31.8027,0.490368,-46.6471,-90.8929],[1000.65,-56.6423,-363.211,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[90.3369,-31.7505,31.8027,0.490368,-46.6471,-90.8929],[941.509,-213.692,-280.225,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam6_1,posAOSeam6_1,pSeam6_1,pSeamFound6_1,pSeamFound6_2;
        MoveJ GetAproachTarget(pSeam6_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam6_1,speedAproach,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam6_2,posAOSeam6_2,pSeam6_2,pSeamFound6_1,pSeamFound6_2;
        ArcLEnd pSeam6_2,speedWeld,seamShared,weldShared_3\Weave:=weaveShared_3,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_3;
        MoveL GetAproachTarget(pSeam6_2),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[163.185,-10.3004,41.9965,37.8071,-104.442,-149.943],[870.638,-551.08,-280.225,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

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

        MoveAbsJ [[66.8443,-78.8051,48.5306,47.843,-28.7134,-168.093],[567.975,538.115,440.405,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

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

        MoveAbsJ [[83.1473,-72.0612,24.1567,67.9638,-22.3013,-125.276],[567.974,449.71,240,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !MoveAbsJ [[68.9497,-73.8637,0.180656,26.2776,46.5799,-103.639],[710.29,480.556,-432.155,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !MoveAbsJ jointReadyQuadrant1, speedAir, zoneAir, toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_24()
        MoveAbsJ [[81.0053,-13.057,28.2407,-38.1626,-82.7421,10.7131],[800,-500,450.507,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound3_1,pSearchSeam3_1,scanJoint3,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound3_2,pSearchSeam3_2,scanJoint3,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[81.0053,-13.057,28.2407,-38.1623,-82.7422,126.192],[800,-500,450.507,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound4_1,pSearchSeam4_1,scanJoint4,speedAproach,toolLaser\WObj:=wobjCurrent;
        ScanSeamByLaser pSeamFound4_2,pSearchSeam4_2,scanJoint4,speedAproach,toolLaser\WObj:=wobjCurrent;
        MoveAbsJ [[84.3411,-62.1578,24.2355,-42.6394,-10.3468,124.027],[812.73,-493.829,215.17,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolLaser\WObj:=wobjCurrent;

        MoveAbsJ [[90.354,-57.0644,8.58768,151.385,-7.45448,24.3551],[871.349,-465.412,75.0999,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

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

        MoveAbsJ [[93.6202,-12.3069,29.9953,109.743,21.4016,-116.482],[1154.36,-570.085,446.682,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveAbsJ [[93.6188,-12.3069,29.9948,109.743,21.4021,-116.482],[1199.49,-570.085,-237.531,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !MoveAbsJ jointReadyQuadrant4, speedAir, zoneAir, toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_25()
        MoveAbsJ [[85.9621,-35.2551,10.8295,97.6802,-38.2092,-182.774],[800.001,500,456,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam25_1,posAOSeam25_1,pSeam25_1,pSeamFound1_1,pSeamFound1_2;
        MoveJ GetAproachTarget(pSeam25_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam25_1,speedAproach,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam25_2,posAOSeam25_2,pSeam25_2,pSeamFound1_1,pSeamFound1_2;
        ArcL pSeam25_2,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\X\Y\Z,peSeam25_3,posAOSeam25_3,pSeam25_3,pSeamFound1_1,pSeamFound1_2;
        ArcL pSeam25_3,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam25_4,posAOSeam25_4,pSeam25_4,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X,peSeam25_4,posAOSeam25_4,pSeam25_4,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam25_4,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam25_5,posAOSeam25_5,pSeam25_5,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X,peSeam25_5,posAOSeam25_5,pSeam25_5,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam25_5,speedAproach,seamShared,weldShared_6\Weave:=weaveShared_6,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_6;
        RefreshDisp\Y\Z,peSeam25_6,posAOSeam25_6,pSeam25_6,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X,peSeam25_6,posAOSeam25_6,pSeam25_6,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam25_6,speedWeld,seamShared,weldShared_6\Weave:=weaveShared_6,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_6;
        RefreshDisp\X\Y\Z,peSeam25_7,posAOSeam25_7,pSeam25_7,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam25_7,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        RefreshDisp\X\Y\Z,peSeam25_8,posAOSeam25_8,pSeam25_8,pSeamFound2_1,pSeamFound2_2;
        ArcLEnd pSeam25_8,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        MoveL GetAproachTarget(pSeam25_8),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[83.1473,-72.0612,24.1567,67.9638,-22.3013,-125.276],[567.974,449.71,240,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !MoveAbsJ jointReadyQuadrant1, speedAir, zoneAir, toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_27()
        MoveAbsJ [[85.9621,-35.2551,10.8295,97.6802,-38.2092,-182.774],[800.001,500,456,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam27_1,posAOSeam27_1,pSeam27_1,pSeamFound1_1,pSeamFound1_2;
        MoveJ GetAproachTarget(pSeam27_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam27_1,speedAproach,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam27_2,posAOSeam27_2,pSeam27_2,pSeamFound1_1,pSeamFound1_2;
        ArcL pSeam27_2,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\X\Y\Z,peSeam27_3,posAOSeam27_3,pSeam27_3,pSeamFound1_1,pSeamFound1_2;
        ArcL pSeam27_3,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam27_4,posAOSeam27_4,pSeam27_4,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X,peSeam27_4,posAOSeam27_4,pSeam27_4,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam27_4,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam27_5,posAOSeam27_5,pSeam27_5,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X,peSeam27_5,posAOSeam27_5,pSeam27_5,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam27_5,speedAproach,seamShared,weldShared_6\Weave:=weaveShared_6,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_6;
        RefreshDisp\Y\Z,peSeam27_6,posAOSeam27_6,pSeam27_6,pSeamFound1_1,pSeamFound1_2;
        RefreshDisp\X,peSeam27_6,posAOSeam27_6,pSeam27_6,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam27_6,speedWeld,seamShared,weldShared_6\Weave:=weaveShared_6,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_6;
        RefreshDisp\X\Y\Z,peSeam27_7,posAOSeam27_7,pSeam27_7,pSeamFound2_1,pSeamFound2_2;
        ArcL pSeam27_7,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        RefreshDisp\X\Y\Z,peSeam27_8,posAOSeam27_8,pSeam27_8,pSeamFound2_1,pSeamFound2_2;
        ArcLEnd pSeam27_8,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        MoveL GetAproachTarget(pSeam27_8),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[83.1473,-72.0612,24.1567,67.9638,-22.3013,-125.276],[567.974,449.71,240,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !MoveAbsJ jointReadyQuadrant1, speedAir, zoneAir, toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_26()
        MoveAbsJ [[90.354,-57.0644,8.58768,151.385,-7.45448,24.3551],[871.349,-465.412,75.0999,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam26_1,posAOSeam26_1,pSeam26_1,pSeamFound3_1,pSeamFound3_2;
        MoveJ GetAproachTarget(pSeam26_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam26_1,speedAproach,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam26_2,posAOSeam26_2,pSeam26_2,pSeamFound3_1,pSeamFound3_2;
        ArcL pSeam26_2,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\X\Y\Z,peSeam26_3,posAOSeam26_3,pSeam26_3,pSeamFound3_1,pSeamFound3_2;
        ArcL pSeam26_3,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam26_4,posAOSeam26_4,pSeam26_4,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X,peSeam26_4,posAOSeam26_4,pSeam26_4,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam26_4,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam26_5,posAOSeam26_5,pSeam26_5,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X,peSeam26_5,posAOSeam26_5,pSeam26_5,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam26_5,speedAproach,seamShared,weldShared_7\Weave:=weaveShared_7,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_7;
        RefreshDisp\Y\Z,peSeam26_6,posAOSeam26_6,pSeam26_6,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X,peSeam26_6,posAOSeam26_6,pSeam26_6,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam26_6,speedWeld,seamShared,weldShared_7\Weave:=weaveShared_7,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_7;
        RefreshDisp\X\Y\Z,peSeam26_7,posAOSeam26_7,pSeam26_7,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam26_7,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        RefreshDisp\X\Y\Z,peSeam26_8,posAOSeam26_8,pSeam26_8,pSeamFound4_1,pSeamFound4_2;
        ArcLEnd pSeam26_8,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        MoveL GetAproachTarget(pSeam26_8),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[48.0944,-26.8531,-4.85096,116.84,76.8332,-52.2849],[871.349,-465.411,229.285,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        MoveAbsJ [[48.0945,-26.8531,-4.85107,116.84,76.8331,-52.2847],[971.184,-465.411,-459.718,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !MoveAbsJ jointReadyQuadrant4, speedAir, zoneAir, toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

    LOCAL PROC Seam_28()
        MoveAbsJ [[90.354,-57.0644,8.58768,151.385,-7.45448,24.3551],[871.349,-465.412,75.0999,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;

        RefreshDisp\X\Y\Z,peSeam28_1,posAOSeam28_1,pSeam28_1,pSeamFound3_1,pSeamFound3_2;
        MoveJ GetAproachTarget(pSeam28_1),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        ArcLStart pSeam28_1,speedAproach,seamShared,weldShared_1\Weave:=weaveShared_1,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1\SeamName:="WeldSeam";
        RefreshDisp\X\Y\Z,peSeam28_2,posAOSeam28_2,pSeam28_2,pSeamFound3_1,pSeamFound3_2;
        ArcL pSeam28_2,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\X\Y\Z,peSeam28_3,posAOSeam28_3,pSeam28_3,pSeamFound3_1,pSeamFound3_2;
        ArcL pSeam28_3,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam28_4,posAOSeam28_4,pSeam28_4,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X,peSeam28_4,posAOSeam28_4,pSeam28_4,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam28_4,speedWeld,seamShared,weldShared_1\Weave:=weaveShared_1,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_1;
        RefreshDisp\Y\Z,peSeam28_5,posAOSeam28_5,pSeam28_5,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X,peSeam28_5,posAOSeam28_5,pSeam28_5,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam28_5,speedAproach,seamShared,weldShared_7\Weave:=weaveShared_7,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_7;
        RefreshDisp\Y\Z,peSeam28_6,posAOSeam28_6,pSeam28_6,pSeamFound3_1,pSeamFound3_2;
        RefreshDisp\X,peSeam28_6,posAOSeam28_6,pSeam28_6,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam28_6,speedWeld,seamShared,weldShared_7\Weave:=weaveShared_7,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_7;
        RefreshDisp\X\Y\Z,peSeam28_7,posAOSeam28_7,pSeam28_7,pSeamFound4_1,pSeamFound4_2;
        ArcL pSeam28_7,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,zoneWeld,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        RefreshDisp\X\Y\Z,peSeam28_8,posAOSeam28_8,pSeam28_8,pSeamFound4_1,pSeamFound4_2;
        ArcLEnd pSeam28_8,speedWeld,seamShared,weldShared_2\Weave:=weaveShared_2,fine,toolWeldGun\WObj:=wobjCurrent\Track:=trackShared_2;
        MoveL GetAproachTarget(pSeam28_8),speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        PDispOff;

        MoveAbsJ [[48.0944,-26.8531,-4.85096,116.84,76.8332,-52.2849],[871.349,-465.411,229.285,9E+09,9E+09,9E+09]],speedAir,zoneAir,toolWeldGun\WObj:=wobjCurrent;
        !MoveAbsJ jointReadyQuadrant4, speedAir, zoneAir, toolWeldGun\WObj:=wobjCurrent;

    UNDO
        PDispOff;
    ENDPROC

ENDMODULE
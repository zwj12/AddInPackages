MODULE ScanPipeModule
    !*****************************************************
    !Module Name: ScanPipeModule
    !Version:     1.0
    !Description: -
    !Date:        2018-12-21
    !Author:      Michael
    !*****************************************************

    !*****************************************************
    !To get the center of a pipe, we can use these two methods: Linear laser (Move a laser displacement sensor along a straight line)
    !, Discrete laser spot (Move a laser displacement sensor along a circumference line).
    !After got the center, we also can use the laser SmarTac to search the special periphery point for verifying.
    !
    !Step1 - Scan by laser line at forward direction
    !Step2 - Get the center of the circle by smooth algorithm
    !Step3 - Scan by laser line at reverse direction after revised the path
    !Step4 - Get the center of the circle by smooth algorithm
    !Step5 - Get the closest point of the circle after smooth algorithm
    !Step6 - Search by laser SmarTac at the center of the circle 
    !Step7 - Scan by laser smartac along the Periphery
    !Step8 - Get the center of the circle by smooth algorithm
    !Step9 - Search by laser SmarTac at the center of the circle 
    !*****************************************************

    !*****************************************************
    !This module use there abbreviations:
    !LL - Linear Laser
    !LLC - Linear Laser Coarse
    !LLF - Linear Laser Fine
    !LLSPP - Linear Laser Special Periphery Point
    !DLS - Discrete Laser Spot
    !DLSSPP - Discrete Laser Spot Special Periphery Point
    !*****************************************************

    LOCAL VAR signalai signalaiLaser;
    LOCAL PERS num numTCPLaserValue:=0;
    LOCAL PERS num numLaserOffsetMax:=100;
    LOCAL PERS string strScanLogFileName:="ScanPlatoonBranch1.csv";
    LOCAL PERS bool boolWaitSync:=FALSE;
    LOCAL PERS bool boolConfOnForSmarTac:=TRUE;
    LOCAL PERS tasks taskListScan{3}:=[[""],[""],[""]];

    LOCAL VAR syncident SyncLLC;
    LOCAL VAR syncident SyncLLF;
    LOCAL VAR syncident SyncDLS;
    LOCAL VAR iodev iodevScanLog;
    LOCAL VAR intnum intLinearLaserScan;
    LOCAL PERS num numWaitTimeForLaserScan:=0.5;
    LOCAL PERS num numLLInterval:=0.1;
    LOCAL PERS speeddata speedLinearScan:=[6.48584,500,5000,1000];
    LOCAL CONST num numLLNominalTotal:=90;
    LOCAL PERS num numLLActualTotal:=102;
    LOCAL PERS num numLLTrim:=10;
    LOCAL PERS num numLLSmoothTime:=5;
    LOCAL PERS num numDLSSmoothTime:=2;
    LOCAL PERS num numSmarTacOffsetZ:=-30;

    LOCAL PERS robtarget robtLLCCenter:=[[3770,-38.1,293.7],[0.707107,-0.707107,0,0],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !numLLScanDirection: 1 - Along X axis, 2 - Along Y axis, 3 - Along Z axis
    LOCAL PERS num numLLScanDirection:=1;
    LOCAL PERS num numLLLength:=58.3726;
    LOCAL PERS pos posSPPOffsetForSmarTac:=[0,-38.1,0];

    LOCAL PERS robtarget robtLLCFrom:=[[3740.81,-38.1,293.7],[0.707107,-0.707107,0,0],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget robtLLCTo:=[[3799.19,-38.1,293.7],[0.707107,-0.707107,0,0],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget robtLLFFrom:=[[2703.1,-133.7,116.569],[0.5,-0.5,0.5,0.5],[0,0,1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget robtLLFTo:=[[2703.1,-133.7,-102.472],[0.5,-0.5,0.5,0.5],[0,0,1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS robtarget robtLLPeripherys{100}:=[[[3740.82,-22.3036,293.689],[0.707099,-0.707115,9.24888E-06,2.69621E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3740.84,-21.8636,293.69],[0.707099,-0.707114,1.37758E-05,-3.84904E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3740.95,-22.3018,293.688],[0.707098,-0.707116,4.34349E-05,-3.05999E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.05,-22.4475,293.688],[0.707098,-0.707116,6.74158E-05,-5.61011E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.08,-22.598,293.691],[0.707099,-0.707114,5.28654E-05,-3.72721E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.08,-22.4575,293.692],[0.7071,-0.707114,2.46891E-05,-2.52304E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.11,-22.6077,293.692],[0.7071,-0.707114,1.24535E-05,1.42287E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.17,-22.7561,293.692],[0.7071,-0.707114,1.15291E-05,1.37642E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.22,-22.6102,293.694],[0.707101,-0.707113,1.23295E-05,1.56608E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.28,-22.6119,293.695],[0.707101,-0.707112,1.44247E-05,1.37251E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.32,-22.6137,293.695],[0.707101,-0.707112,1.49885E-05,1.59061E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.37,-22.7623,293.695],[0.707101,-0.707112,1.51801E-05,1.86309E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.43,-22.7628,293.697],[0.707102,-0.707111,1.67627E-05,1.9745E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.48,-22.7652,293.695],[0.707102,-0.707112,1.53362E-05,1.98211E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.53,-22.7641,293.7],[0.707104,-0.70711,1.66138E-05,2.11526E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.58,-23.0579,293.699],[0.707104,-0.70711,1.72791E-05,1.9879E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.63,-23.0583,293.702],[0.707105,-0.707109,1.63468E-05,2.1487E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.69,-23.0564,293.704],[0.707106,-0.707107,1.79379E-05,1.80566E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.74,-23.0533,293.709],[0.707109,-0.707104,1.72118E-05,1.93504E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.79,-23.198,293.712],[0.70711,-0.707103,1.77477E-05,2.19018E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.85,-23.0494,293.716],[0.707113,-0.7071,1.82664E-05,1.93558E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.9,-23.1945,293.719],[0.707115,-0.707099,1.87311E-05,1.93591E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3741.95,-23.3392,293.72],[0.707116,-0.707098,2.07763E-05,1.79435E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.01,-23.1908,293.725],[0.707118,-0.707095,1.93575E-05,1.75049E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.06,-23.1888,293.727],[0.70712,-0.707094,1.69708E-05,1.31176E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.12,-23.3334,293.73],[0.707122,-0.707092,1.53625E-05,1.09762E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.17,-23.3329,293.733],[0.707124,-0.70709,1.18452E-05,1.0531E-05],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.22,-23.479,293.73],[0.707122,-0.707091,1.15132E-05,5.71919E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.3,-23.4781,293.737],[0.707126,-0.707088,7.09419E-06,1.49506E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.32,-23.4786,293.736],[0.707126,-0.707088,2.66002E-06,3.49857E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.37,-23.6246,293.736],[0.707127,-0.707087,1.62945E-06,5.81379E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.42,-23.6254,293.735],[0.707126,-0.707087,-4.95696E-07,-4.23084E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.47,-23.6252,293.736],[0.707127,-0.707087,-3.36391E-06,-1.2176E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.52,-23.7715,293.736],[0.707128,-0.707086,-4.63117E-06,-1.46055E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.58,-23.7723,293.733],[0.707126,-0.707088,-4.3861E-06,-3.17921E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.62,-23.7719,293.732],[0.707125,-0.707088,-6.76462E-06,-1.3958E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.68,-24.0647,293.729],[0.707123,-0.70709,-5.16627E-06,-1.24902E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.73,-23.7727,293.725],[0.707121,-0.707092,-3.57571E-06,-3.62964E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.78,-24.0678,293.719],[0.707118,-0.707096,-4.14047E-06,-6.40409E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.83,-24.0684,293.717],[0.707117,-0.707097,-5.05271E-06,4.4514E-09],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.89,-24.0681,293.717],[0.707117,-0.707097,-2.32757E-06,2.2048E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.94,-24.2142,293.713],[0.707114,-0.7071,-1.93604E-06,1.31128E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3742.99,-24.2134,293.715],[0.707115,-0.707099,6.11096E-08,-1.29008E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.04,-24.3595,293.713],[0.707113,-0.7071,-8.57054E-07,-6.50861E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.1,-24.5072,293.709],[0.707112,-0.707102,1.26555E-06,9.69162E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.15,-24.3605,293.707],[0.70711,-0.707103,1.36008E-07,1.87622E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.2,-24.3586,293.711],[0.707112,-0.707101,-1.50821E-06,7.81344E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.25,-24.3604,293.71],[0.707112,-0.707102,8.00612E-07,-8.50455E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.31,-24.3604,293.704],[0.707108,-0.707105,1.22108E-06,1.78831E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.36,-24.5059,293.706],[0.70711,-0.707104,1.73101E-06,-9.0458E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.41,-24.3607,293.705],[0.707109,-0.707104,6.95175E-07,-9.55774E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.46,-25.0909,293.708],[0.707111,-0.707103,1.43606E-06,-6.699E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.51,-25.0923,293.705],[0.707109,-0.707104,-7.45902E-07,7.43174E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.57,-24.9462,293.706],[0.707109,-0.707104,1.3506E-06,-2.23724E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.62,-25.0926,293.707],[0.70711,-0.707103,-9.12832E-07,5.81207E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.68,-24.6517,293.709],[0.707111,-0.707102,2.42261E-06,-2.15124E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.73,-25.0925,293.706],[0.70711,-0.707104,2.10213E-06,-4.47558E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.78,-24.6521,293.708],[0.707111,-0.707103,1.99931E-06,-1.47846E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.83,-25.0911,293.707],[0.70711,-0.707104,2.125E-06,-2.32063E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.88,-25.3838,293.708],[0.707111,-0.707103,2.44942E-06,-3.37054E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.93,-25.2383,293.707],[0.70711,-0.707103,1.53611E-06,-1.17393E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3743.98,-25.0913,293.71],[0.707111,-0.707102,5.04654E-07,-1.70191E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.04,-25.3844,293.708],[0.70711,-0.707103,2.49158E-06,-1.31928E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.08,-25.2377,293.709],[0.70711,-0.707103,5.71049E-07,9.79642E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.13,-25.3841,293.705],[0.707109,-0.707105,4.65072E-07,5.57092E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.19,-25.2384,293.706],[0.707109,-0.707104,1.01105E-06,5.99078E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.24,-25.3843,293.708],[0.70711,-0.707104,1.03067E-06,-8.33899E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.29,-25.3848,293.707],[0.70711,-0.707103,-5.5568E-07,1.59985E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.34,-25.3845,293.705],[0.707109,-0.707105,-1.00649E-06,1.70648E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.39,-25.3848,293.707],[0.70711,-0.707103,-2.20048E-06,3.57465E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.44,-25.3856,293.706],[0.707109,-0.707104,-3.02663E-06,1.26248E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.49,-25.5315,293.708],[0.707111,-0.707103,-2.34688E-06,1.00189E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.55,-25.3844,293.707],[0.70711,-0.707103,-2.49993E-07,1.6581E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.6,-25.3856,293.706],[0.707109,-0.707104,-2.61709E-06,1.83127E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.65,-25.5306,293.706],[0.70711,-0.707104,-1.15565E-06,1.35769E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.7,-25.5307,293.708],[0.707111,-0.707103,-1.30009E-06,-1.28221E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.76,-25.9701,293.708],[0.707111,-0.707103,-1.33567E-06,-2.96452E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.81,-25.9715,293.705],[0.70711,-0.707104,-6.64729E-07,3.55325E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.87,-25.8245,293.705],[0.70711,-0.707104,-2.28447E-07,-1.17942E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.92,-25.9701,293.707],[0.70711,-0.707103,1.78688E-06,-2.18424E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.97,-26.1168,293.705],[0.707109,-0.707105,6.01122E-07,7.01692E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.03,-26.1176,293.706],[0.70711,-0.707104,1.10865E-06,-1.3743E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.08,-25.97,293.707],[0.70711,-0.707103,3.08193E-06,-2.37886E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.13,-26.1161,293.707],[0.70711,-0.707103,2.5735E-06,-2.85685E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.19,-26.1149,293.708],[0.707111,-0.707103,2.55888E-06,-1.89194E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.24,-26.1171,293.706],[0.70711,-0.707104,1.79481E-06,-2.06253E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.29,-26.2624,293.707],[0.70711,-0.707104,2.42702E-06,-3.88015E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.34,-26.2645,293.707],[0.70711,-0.707103,2.94823E-06,-3.82084E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.39,-26.2644,293.707],[0.70711,-0.707103,7.62552E-07,-2.45243E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.44,-26.2646,293.705],[0.707109,-0.707105,-5.60241E-07,-1.69826E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.5,-26.2652,293.706],[0.70711,-0.707104,1.87025E-06,-3.77429E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.54,-26.4121,293.705],[0.707109,-0.707104,-1.20096E-06,7.89373E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.59,-26.4117,293.705],[0.707109,-0.707104,-1.02785E-06,-4.8678E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.65,-26.4102,293.708],[0.707111,-0.707103,-5.27537E-07,-2.48126E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.7,-26.4117,293.704],[0.707109,-0.707105,-8.53175E-07,-3.17173E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.75,-26.5565,293.705],[0.707109,-0.707105,-1.48431E-06,-7.27443E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.8,-26.2647,293.705],[0.707109,-0.707105,1.10232E-07,3.9899E-07],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.85,-26.4089,293.708],[0.707111,-0.707103,-4.077E-07,-1.60965E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.9,-26.849,293.709],[0.707111,-0.707103,-1.90667E-06,-1.03432E-06],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3745.95,-26.4083,293.709],[0.707111,-0.707103,-1.91516E-06,6.70144E-08],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]]];
    LOCAL PERS pos posLLPeripherys{100}:=[[3740.82,-22.3036,293.689],[3740.84,-21.8636,293.69],[3740.95,-22.3018,293.688],[3741.05,-22.4475,293.688],[3741.08,-22.598,293.691],[3741.08,-22.4575,293.692],[3741.11,-22.6077,293.692],[3741.17,-22.7561,293.692],[3741.22,-22.6102,293.694],[3741.28,-22.6119,293.695],[3741.32,-22.6137,293.695],[3741.37,-22.7623,293.695],[3741.43,-22.7628,293.697],[3741.48,-22.7652,293.695],[3741.53,-22.7641,293.7],[3741.58,-23.0579,293.699],[3741.63,-23.0583,293.702],[3741.69,-23.0564,293.704],[3741.74,-23.0533,293.709],[3741.79,-23.198,293.712],[3741.85,-23.0494,293.716],[3741.9,-23.1945,293.719],[3741.95,-23.3392,293.72],[3742.01,-23.1908,293.725],[3742.06,-23.1888,293.727],[3742.12,-23.3334,293.73],[3742.17,-23.3329,293.733],[3742.22,-23.479,293.73],[3742.3,-23.4781,293.737],[3742.32,-23.4786,293.736],[3742.37,-23.6246,293.736],[3742.42,-23.6254,293.735],[3742.47,-23.6252,293.736],[3742.52,-23.7715,293.736],[3742.58,-23.7723,293.733],[3742.62,-23.7719,293.732],[3742.68,-24.0647,293.729],[3742.73,-23.7727,293.725],[3742.78,-24.0678,293.719],[3742.83,-24.0684,293.717],[3742.89,-24.0681,293.717],[3742.94,-24.2142,293.713],[3742.99,-24.2134,293.715],[3743.04,-24.3595,293.713],[3743.1,-24.5072,293.709],[3743.15,-24.3605,293.707],[3743.2,-24.3586,293.711],[3743.25,-24.3604,293.71],[3743.31,-24.3604,293.704],[3743.36,-24.5059,293.706],[3743.41,-24.3607,293.705],[3743.46,-25.0909,293.708],[3743.51,-25.0923,293.705],[3743.57,-24.9462,293.706],[3743.62,-25.0926,293.707],[3743.68,-24.6517,293.709],[3743.73,-25.0925,293.706],[3743.78,-24.6521,293.708],[3743.83,-25.0911,293.707],[3743.88,-25.3838,293.708],[3743.93,-25.2383,293.707],[3743.98,-25.0913,293.71],[3744.04,-25.3844,293.708],[3744.08,-25.2377,293.709],[3744.13,-25.3841,293.705],[3744.19,-25.2384,293.706],[3744.24,-25.3843,293.708],[3744.29,-25.3848,293.707],[3744.34,-25.3845,293.705],[3744.39,-25.3848,293.707],[3744.44,-25.3856,293.706],[3744.49,-25.5315,293.708],[3744.55,-25.3844,293.707],[3744.6,-25.3856,293.706],[3744.65,-25.5306,293.706],[3744.7,-25.5307,293.708],[3744.76,-25.9701,293.708],[3744.81,-25.9715,293.705],[3744.87,-25.8245,293.705],[3744.92,-25.9701,293.707],[3744.97,-26.1168,293.705],[3745.03,-26.1176,293.706],[3745.08,-25.97,293.707],[3745.13,-26.1161,293.707],[3745.19,-26.1149,293.708],[3745.24,-26.1171,293.706],[3745.29,-26.2624,293.707],[3745.34,-26.2645,293.707],[3745.39,-26.2644,293.707],[3745.44,-26.2646,293.705],[3745.5,-26.2652,293.706],[3745.54,-26.4121,293.705],[3745.59,-26.4117,293.705],[3745.65,-26.4102,293.708],[3745.7,-26.4117,293.704],[3745.75,-26.5565,293.705],[3745.8,-26.2647,293.705],[3745.85,-26.4089,293.708],[3745.9,-26.849,293.709],[3745.95,-26.4083,293.709]];
    LOCAL PERS num numLLLaserValues{100}:=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

    !Scan result of FitCircle
    LOCAL PERS pos posLLCenter:=[2703.07,3.13079,7.21332];
    LOCAL PERS num numLLRadius:=131.928;

    !Scan result of SmarTac
    LOCAL PERS robtarget robtLLSPP:=[[2703.09,-128.196,7.23092],[0.500009,-0.49999,0.499996,0.500006],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS pose poseLLSPP:=[[0.0151367,2.37305,0.0175905],[1,0,0,0]];

    LOCAL PERS robtarget robtLLClosestDetect:=[[3770,-38.1,293.7],[0.5,-0.5,-0.5,-0.5],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]];

    !Scan result of fixed point
    LOCAL PERS pos posLLClosest:=[2703.1,-128.458,7.21332];
    LOCAL PERS num numLLClosestLaserValue:=5.24155;

    LOCAL PERS robtarget robtDLSTheoryPeripherys{20}:=[[[3740.81,-24.4902,293.7],[0.241845,-0.664463,-0.241845,-0.664463],[0,0,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3744.67,-28.4617,293.7],[0.289484,-0.645135,-0.289484,-0.645135],[0,0,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3749.06,-31.8321,293.7],[0.335593,-0.622396,-0.335593,-0.622396],[0,0,-1,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3753.9,-34.5303,293.7],[0.379928,-0.596368,-0.379928,-0.596368],[0,0,-1,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3759.07,-36.4994,293.7],[0.422255,-0.567187,-0.422255,-0.567187],[0,0,-1,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3764.48,-37.6977,293.7],[0.462349,-0.535007,-0.462349,-0.535007],[0,0,-1,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3770,-38.1,293.7],[0.5,-0.5,-0.5,-0.5],[0,-1,1,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3775.52,-37.6977,293.7],[0.535007,-0.462349,-0.535008,-0.462349],[-1,-1,1,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3780.93,-36.4994,293.7],[0.567187,-0.422255,-0.567187,-0.422255],[-1,-1,1,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3786.1,-34.5303,293.7],[0.596368,-0.379928,-0.596368,-0.379928],[-1,-1,1,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3790.94,-31.8321,293.7],[0.622396,-0.335593,-0.622396,-0.335593],[-1,-1,1,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3795.33,-28.4617,293.7],[0.645135,-0.289484,-0.645135,-0.289484],[-1,-1,1,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[3799.19,-24.4902,293.7],[0.664463,-0.241845,-0.664463,-0.241845],[-1,-1,1,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,-1,1,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,0,-2,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,0,-2,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,0,-2,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,0,-2,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,0,-2,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,0,-2,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]]];
    LOCAL PERS num numDLSPointsTotal:=13;
    LOCAL PERS bool boolDLSUseSmarTac:=TRUE;

    LOCAL PERS robtarget robtDLSPeripherys{20}:=[[[2703.11,-128.273,-0.0122585],[0.499989,-0.5,0.500011,0.5],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2703.11,-128.574,11.2576],[0.477713,-0.521327,0.521338,0.477718],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2703.1,-127.648,22.5098],[0.454514,-0.541674,0.541679,0.454522],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2703.09,-126.135,33.817],[0.430478,-0.561005,0.560958,0.430451],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2703.11,-122.959,44.7012],[0.405571,-0.579246,0.579232,0.405557],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2703.09,-119.579,55.7607],[0.379948,-0.596389,0.596341,0.379918],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2703.1,-115.131,66.3841],[0.353528,-0.612385,0.612388,0.353531],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2703.11,-109.132,76.3731],[0.326493,-0.627217,0.627219,0.326493],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2703.09,-102.695,86.2097],[0.298833,-0.640818,0.640882,0.298867],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2703.11,-95.3384,95.3059],[0.270591,-0.653287,0.653283,0.270589],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2703.11,-87.1814,103.875],[0.241842,-0.664473,0.664458,0.241833],[-1,-1,0,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2703.09,-78.0886,111.446],[0.21261,-0.674382,0.67439,0.212614],[-1,-1,0,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]],[[2703.03,-68.4769,118.756],[0.183002,-0.683,0.683005,0.183097],[-1,-1,0,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,-1,1,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,0,-2,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,0,-2,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,0,-2,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,0,-2,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,0,-2,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]],[[652.53,-493.33,1047.99],[0.459259,-0.544323,-0.447932,-0.54051],[-1,0,-2,1],[4837,9E+09,9E+09,9E+09,9E+09,9E+09]]];
    LOCAL PERS pose poseDLSPeripherys{20}:=[[[0.0107422,5.42668,-0.0122468],[1,0,0,0]],[[0.00952148,4.61769,-0.395177],[1,0,0,0]],[[0.00195313,4.02123,-0.706989],[1,0,0,0]],[[-0.00805664,3.00952,-0.787167],[1,0,0,0]],[[0.00585938,2.67777,-1.02692],[1,0,0,0]],[[-0.00952148,1.59389,-0.743401],[1,0,0,0]],[[0.00292969,0.6567,-0.465935],[1,0,0,0]],[[0.00854492,0.388535,-0.314034],[1,0,0,0]],[[-0.00634766,-0.274811,0.26902],[1,0,0,0]],[[0.00537109,-0.798203,0.765717],[1,0,0,0]],[[0.00561523,-1.24067,1.45485],[1,0,0,0]],[[-0.0109863,-1.40141,1.92549],[1,0,0,0]],[[-0.0725098,-1.62691,2.96816],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]]];
    LOCAL PERS pos posDLSPeripherys{20}:=[[2703.11,-128.273,-0.0122585],[2703.11,-128.574,11.2576],[2703.1,-127.648,22.5098],[2703.09,-126.135,33.817],[2703.11,-122.959,44.7012],[2703.09,-119.579,55.7607],[2703.1,-115.131,66.3841],[2703.11,-109.132,76.3731],[2703.09,-102.695,86.2097],[2703.11,-95.3384,95.3059],[2703.11,-87.1814,103.875],[2703.09,-78.0886,111.446],[2703.03,-68.4769,118.756],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]];
    LOCAL PERS num numDLSLaserValues{20}:=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

    !Scan result of FitCircle
    LOCAL PERS pos posDLSCenter:=[2703.25,3.73764,7.60993];
    LOCAL PERS num numDLSRadius:=132.313;

    !Scan result of SmarTac
    LOCAL PERS robtarget robtDLSSPP:=[[2703.26,-128.386,7.65147],[0.500014,-0.49999,0.499985,0.500011],[-1,-1,-1,1],[2602,9E+09,9E+09,9E+09,9E+09,9E+09]];
    LOCAL PERS pose poseDLSSPP:=[[0.00927734,1.57608,0.0415416],[1,0,0,0]];

    LOCAL PERS robtarget robtDLSClosestDetect:=[[3770,-38.1,293.7],[0.5,-0.5,-0.5,-0.5],[-1,-1,-2,1],[1447,9E+09,9E+09,9E+09,9E+09,9E+09]];

    !Scan result of fixed point
    LOCAL PERS pos posDLSClosest:=[2703.1,-129.044,7.60993];
    LOCAL PERS num numDLSClosestLaserValue:=4.6556;

    LOCAL VAR pos center;
    LOCAL VAR num radius;
    LOCAL VAR pos normal;
    LOCAL VAR num rms;
    LOCAL VAR num maxErr;
    LOCAL VAR num indexWorst;

    PROC ScanPipebyLaser(PERS tooldata toolScan,PERS wobjdata wobjScan)
        VAR robtarget robtTemp;

        ScanPipebyLLC toolScan,wobjScan;
        IF boolWaitSync THEN
            WaitSyncTask SyncLLC,taskListScan;
        ENDIF

        ScanPipebyLLF toolScan,wobjScan;
        IF boolWaitSync THEN
            WaitSyncTask SyncLLF,taskListScan;
        ELSE
            taskListScan:=[[""],[""],[""]];
        ENDIF

        ScanPipebyDLS toolScan,wobjScan;
        IF boolWaitSync THEN
            WaitSyncTask SyncDLS,taskListScan;
        ENDIF

    ENDPROC

    PROC InitScanPipeData(string strAiLaserName,num TCPLaserValue,string ScanLogFileName,bool WaitSync\tasks tasksScan{*}
        ,robtarget LLCCenter,num LLScanDirection,num LLLength,pos SPPOffsetForSmarTac,robtarget LLClosestDetect
        ,robtarget DLSTheoryPeripherys{*},num DLSPointsTotal,bool DLSUseSmarTac\bool ConfOnForSmarTac,robtarget DLSClosestDetect)
        AliasIO strAiLaserName,signalaiLaser;
        numTCPLaserValue:=TCPLaserValue;
        strScanLogFileName:=ScanLogFileName;
        boolWaitSync:=WaitSync;
        IF WaitSync THEN
            taskListScan:=tasksScan;
        ENDIF
        robtLLCCenter:=LLCCenter;
        numLLScanDirection:=LLScanDirection;
        numLLLength:=LLLength;
        posSPPOffsetForSmarTac:=SPPOffsetForSmarTac;
        robtLLClosestDetect:=LLClosestDetect;
        robtDLSTheoryPeripherys:=DLSTheoryPeripherys;
        numDLSPointsTotal:=DLSPointsTotal;
        boolDLSUseSmarTac:=DLSUseSmarTac;
        IF Present(ConfOnForSmarTac) THEN
            boolConfOnForSmarTac:=ConfOnForSmarTac;
        ELSE
            boolConfOnForSmarTac:=TRUE;
        ENDIF
        robtDLSClosestDetect:=DLSClosestDetect;
    ENDPROC

    PROC GetScanPipeResult(inout pos LLCenter,inout robtarget LLSPP,inout pos LLClosest,inout pos DLSCenter,inout robtarget DLSSPP,inout pos DLSClosest\inout num LLRadius\inout num DLSRadius)
        LLCenter:=posLLCenter;
        LLSPP:=robtLLSPP;
        LLClosest:=posLLClosest;
        DLSCenter:=posDLSCenter;
        DLSSPP:=robtDLSSPP;
        DLSClosest:=posDLSClosest;
        LLRadius:=numLLRadius;
        DLSRadius:=numDLSRadius;
    ENDPROC

    LOCAL TRAP TrapLinerLaserScan
        VAR robtarget robtCur;
        VAR robtarget robtReal;
        VAR num numLaserOffset;
        numLaserOffset:=signalaiLaser-numTCPLaserValue;
        IF numLaserOffset>numLaserOffsetMax THEN
            RETURN ;
        ENDIF
        Incr numLLActualTotal;
        robtCur:=CRobT();
        robtReal:=reltool(robtCur,0,0,numLaserOffset);
        robtLLPeripherys{numLLActualTotal}:=robtReal;
        posLLPeripherys{numLLActualTotal}:=robtReal.trans;
        Write iodevScanLog,CDate()+" "+CTime()+strTab+ValToStr(numLLActualTotal)\NoNewLine;
        Write iodevScanLog,strTab+ValToStr(robtCur.trans.x)+strTab+ValToStr(robtCur.trans.y)+strTab+ValToStr(robtCur.trans.z)\NoNewLine;
        Write iodevScanLog,strTab+ValToStr(numLaserOffset)+strTab+ValToStr(robtReal.trans.x)+strTab+ValToStr(robtReal.trans.y)+strTab+ValToStr(robtReal.trans.z);
    ENDTRAP

    LOCAL PROC InitLLInterval()
        speedLinearScan.v_tcp:=numLLLength/numLLNominalTotal/0.1;
        numLLInterval:=numLLLength/speedLinearScan.v_tcp/numLLNominalTotal;
        IF numLLInterval<0.1 THEN
            numLLInterval:=0.1;
        ENDIF
    ENDPROC

    LOCAL PROC ScanPipebyLLC(PERS tooldata toolScan,PERS wobjdata wobjScan)
        InitLLInterval;

        TEST numLLScanDirection
        CASE 1:
            robtLLCFrom:=Offs(robtLLCCenter,0-numLLLength/2,0,0);
            robtLLCTo:=Offs(robtLLCCenter,numLLLength/2,0,0);
        CASE 2:
            robtLLCFrom:=Offs(robtLLCCenter,0,0-numLLLength/2,0);
            robtLLCTo:=Offs(robtLLCCenter,0,numLLLength/2,0);
        DEFAULT:
            robtLLCFrom:=Offs(robtLLCCenter,0,0,0-numLLLength/2);
            robtLLCTo:=Offs(robtLLCCenter,0,0,numLLLength/2);
        ENDTEST

        MoveL robtLLCFrom,speedAir,fine,toolScan\WObj:=wobjScan;
        Logging\INFO,"Moved to robtLLCFrom";
        WaitTime numWaitTimeForLaserScan;

        Close iodevScanLog;
        Open "HOME:"\File:=strScanLogFileName,iodevScanLog;
        Write iodevScanLog,"ScanPipebyLLC:";
        Write iodevScanLog,"Time"+strTab+"index"+strTab+"rob.x"+strTab+"rob.y"+strTab+"rob.z"\NoNewLine;
        Write iodevScanLog,strTab+"laser.value"+strTab+"periphery.x"+strTab+"periphery.y"+strTab+"periphery.z";

        numLLActualTotal:=0;
        IDelete intLinearLaserScan;
        CONNECT intLinearLaserScan WITH TrapLinerLaserScan;
        ITimer numLLInterval,intLinearLaserScan;

        MoveL robtLLCTo,speedLinearScan,fine,toolScan\WObj:=wobjScan;
        IDelete intLinearLaserScan;
        !Close iodevScanLog;
        Logging\INFO,"Moved to robtLLCTo";

        FOR i FROM 1 TO numLLActualTotal DO
            IF i>numLLTrim THEN
                posLLPeripherys{i-numLLTrim}:=posLLPeripherys{i};
            ENDIF
        ENDFOR
        IF RobOS() THEN
            FitCircleSmoothing posLLPeripherys,numLLActualTotal-numLLTrim*2,numLLSmoothTime,center,radius,normal,rms,maxErr,indexWorst;
        ENDIF

        Logging\INFO,"Center="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO,"normal="+ValToStr(normal);
        Logging\INFO,"rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);
        Write iodevScanLog,"";
        Write iodevScanLog,"Center"+strTab+"radius"+strTab+"normal"+strTab+"rms"+strTab+"maxErr"+strTab+"indexWorst";
        Write iodevScanLog,ValToStr(center)+strTab+ValToStr(radius)\NoNewLine;
        Write iodevScanLog,strTab+ValToStr(normal)\NoNewLine;
        Write iodevScanLog,strTab+ValToStr(rms)+strTab+ValToStr(maxErr)+strTab+ValToStr(indexWorst);
        Close iodevScanLog;

        posLLCenter:=center;

        TEST numLLScanDirection
        CASE 1:
            IF RobOS() THEN
                robtLLCCenter.trans.x:=center.x;
            ENDIF
            robtLLFTo:=Offs(robtLLCCenter,0-numLLLength/2,0,0);
            robtLLFFrom:=Offs(robtLLCCenter,numLLLength/2,0,0);
        CASE 2:
            IF RobOS() THEN
                robtLLCCenter.trans.y:=center.y;
            ENDIF
            robtLLFTo:=Offs(robtLLCCenter,0,0-numLLLength/2,0);
            robtLLFFrom:=Offs(robtLLCCenter,0,numLLLength/2,0);
        DEFAULT:
            IF RobOS() THEN
                robtLLCCenter.trans.z:=center.z;
            ENDIF
            robtLLFTo:=Offs(robtLLCCenter,0,0,0-numLLLength/2);
            robtLLFFrom:=Offs(robtLLCCenter,0,0,numLLLength/2);
        ENDTEST

    ENDPROC

    LOCAL PROC ScanPipebyLLF(PERS tooldata toolScan,PERS wobjdata wobjScan)
        VAR robtarget robtTemp;

        MoveJ robtLLFFrom,speedAir,fine,toolScan\WObj:=wobjScan;
        Logging\INFO,"Moved to robtLLFFrom";
        WaitTime numWaitTimeForLaserScan;

        Close iodevScanLog;
        Open "HOME:"\File:=strScanLogFileName,iodevScanLog\Append;
        Write iodevScanLog,"ScanPipebyLLF:";
        Write iodevScanLog,"";
        Write iodevScanLog,"Time"+strTab+"index"+strTab+"rob.x"+strTab+"rob.y"+strTab+"rob.z"\NoNewLine;
        Write iodevScanLog,strTab+"laser.value"+strTab+"periphery.x"+strTab+"periphery.y"+strTab+"periphery.z";

        numLLActualTotal:=0;
        IDelete intLinearLaserScan;
        CONNECT intLinearLaserScan WITH TrapLinerLaserScan;
        ITimer numLLInterval,intLinearLaserScan;

        MoveL robtLLFTo,speedLinearScan,fine,toolScan\WObj:=wobjScan;
        IDelete intLinearLaserScan;
        !Close iodevScanLog;
        Logging\INFO,"Moved to robtLLFTo";

        FOR i FROM 1 TO numLLActualTotal DO
            IF i>numLLTrim THEN
                posLLPeripherys{i-numLLTrim}:=posLLPeripherys{i};
            ENDIF
        ENDFOR
        IF RobOS() THEN
            FitCircleSmoothing posLLPeripherys,numLLActualTotal-numLLTrim*2,numLLSmoothTime,center,radius,normal,rms,maxErr,indexWorst;
        ENDIF
        posLLCenter:=center;
        numLLRadius:=radius;

        Logging\INFO,"Center="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO,"normal="+ValToStr(normal);
        Logging\INFO,"rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);
        Write iodevScanLog,"";
        Write iodevScanLog,"Center"+strTab+"radius"+strTab+"normal"+strTab+"rms"+strTab+"maxErr"+strTab+"indexWorst";
        Write iodevScanLog,ValToStr(center)+strTab+ValToStr(radius)\NoNewLine;
        Write iodevScanLog,strTab+ValToStr(normal)\NoNewLine;
        Write iodevScanLog,strTab+ValToStr(rms)+strTab+ValToStr(maxErr)+strTab+ValToStr(indexWorst);

        robtTemp:=robtLLCCenter;
        IF RobOS() THEN
            robtTemp.trans:=center+posSPPOffsetForSmarTac;
        ENDIF
        MoveJ robtTemp,speedAir,fine,toolScan\WObj:=wobjScan;
        Search_1D poseLLSPP\SearchStop:=robtLLSPP,RelTool(robtTemp,0,0,numSmarTacOffsetZ),robtTemp,speedAir,toolScan\WObj:=wobjScan;
        Logging\INFO,"robtLLSPP="+ValToStr(robtLLSPP.trans);
        Write iodevScanLog,"";
        Write iodevScanLog,"robtLLSPP";
        Write iodevScanLog,ValToStr(robtLLSPP.trans);

        !GetClosest
        IF RobOS() THEN
            TEST numLLScanDirection
            CASE 1:
                robtLLClosestDetect.trans.x:=center.x;
            CASE 2:
                robtLLClosestDetect.trans.y:=center.y;
            DEFAULT:
                robtLLClosestDetect.trans.z:=center.z;
            ENDTEST
        ENDIF
        MoveJ robtLLClosestDetect,speedAir,fine,toolScan\WObj:=wobjScan;
        Logging\INFO,"Moved to robtLLClosestDetect";
        WaitTime numWaitTimeForLaserScan;
        numLLClosestLaserValue:=signalaiLaser-numTCPLaserValue;
        robtTemp:=RelTool(robtLLClosestDetect,0,0,numLLClosestLaserValue);
        posLLClosest:=robtTemp.trans;
        Write iodevScanLog,"";
        Write iodevScanLog,"posLLClosest";
        Write iodevScanLog,ValToStr(posLLClosest);
        Close iodevScanLog;

    ENDPROC

    LOCAL PROC ScanPipebyDLS(PERS tooldata toolScan,PERS wobjdata wobjScan)
        VAR robtarget robtTemp;
        IF numDLSPointsTotal DIV 4>=1 THEN
            MoveJ RelTool(robtDLSTheoryPeripherys{numDLSPointsTotal DIV 4},0,0,-100),speedAir,zoneAir,toolScan\WObj:=wobjScan;
        ELSE
            MoveJ RelTool(robtDLSTheoryPeripherys{1},0,0,-100),speedAir,zoneAir,toolScan\WObj:=wobjScan;
        ENDIF

        Close iodevScanLog;
        Open "HOME:"\File:=strScanLogFileName,iodevScanLog\Append;
        Write iodevScanLog,"ScanPipebyDLS:";
        Write iodevScanLog,"";
        Write iodevScanLog,"Time"+strTab+"index"+strTab+"rob.x"+strTab+"rob.y"+strTab+"rob.z"\NoNewLine;
        Write iodevScanLog,strTab+"laser.value"+strTab+"periphery.x"+strTab+"periphery.y"+strTab+"periphery.z";

        IF boolConfOnForSmarTac THEN
            ConfJ\On;
            ConfL\On;
        ELSE
            ConfJ\Off;
            ConfL\Off;
        ENDIF

        FOR i FROM 1 TO numDLSPointsTotal DO
            Logging\INFO,"Moving to scan target: "+ValToStr(i);
            IF boolDLSUseSmarTac THEN
                MoveJ RelTool(robtDLSTheoryPeripherys{i},0,0,numSmarTacOffsetZ),speedAir,zoneAir,toolScan\WObj:=wobjScan;
                Search_1D poseDLSPeripherys{i}\SearchStop:=robtDLSPeripherys{i},RelTool(robtDLSTheoryPeripherys{i},0,0,numSmarTacOffsetZ),robtDLSTheoryPeripherys{i},speedAir,toolScan\WObj:=wobjScan;
                numDLSLaserValues{i}:=0;
            ELSE
                MoveJ robtDLSTheoryPeripherys{i},speedAir,fine,toolScan\WObj:=wobjScan;
                WaitTime\InPos,numWaitTimeForLaser;
                numDLSLaserValues{i}:=signalaiLaser-numTCPLaserValue;
                robtDLSPeripherys{i}:=reltool(robtDLSTheoryPeripherys{i},0,0,numSPBLaserValues{i});
            ENDIF

            IF RobOS() THEN
                posDLSPeripherys{i}:=robtDLSPeripherys{i}.trans;
            ELSE
                posDLSPeripherys{i}:=robtDLSTheoryPeripherys{i}.trans;
            ENDIF

            robtTemp:=CRobT();
            robtDLSTheoryPeripherys{i}.robconf:=robtTemp.robconf;
            robtDLSTheoryPeripherys{i+1}.robconf:=robtTemp.robconf;

            Write iodevScanLog,CDate()+" "+CTime()+strTab+ValToStr(i)\NoNewLine;
            Write iodevScanLog,strTab+ValToStr(robtDLSTheoryPeripherys{i}.trans.x)+strTab+ValToStr(robtDLSTheoryPeripherys{i}.trans.y)+strTab+ValToStr(robtDLSTheoryPeripherys{i}.trans.z)\NoNewLine;
            Write iodevScanLog,strTab+ValToStr(numDLSLaserValues{i})+strTab+ValToStr(posDLSPeripherys{i}.x)+strTab+ValToStr(posDLSPeripherys{i}.y)+strTab+ValToStr(posDLSPeripherys{i}.z);
        ENDFOR

        !Close iodevSPBLog;

        IF (numDLSPointsTotal DIV 4)*3>=1 THEN
            MoveJ RelTool(robtDLSTheoryPeripherys{(numSPBPointsTotal DIV 4)*3},0,0,-100),speedAir,zoneAir,toolScan\WObj:=wobjScan;
        ELSE
            MoveJ RelTool(robtDLSTheoryPeripherys{1},0,0,-100),speedAir,zoneAir,toolScan\WObj:=wobjScan;
        ENDIF

        ConfJ\On;
        ConfL\On;

        FitCircleSmoothing posDLSPeripherys,numDLSPointsTotal,numDLSSmoothTime,center,radius,normal,rms,maxErr,indexWorst;
        posDLSCenter:=center;
        numDLSRadius:=radius;

        Logging\INFO,"Center="+ValToStr(center)+", radius="+ValToStr(radius);
        Logging\INFO,"normal="+ValToStr(normal);
        Logging\INFO,"rms="+ValToStr(rms)+", maxErr="+ValToStr(maxErr)+", indexWorst="+ValToStr(indexWorst);
        Write iodevScanLog,"";
        Write iodevScanLog,"Center"+strTab+"radius"+strTab+"normal"+strTab+"rms"+strTab+"maxErr"+strTab+"indexWorst";
        Write iodevScanLog,ValToStr(center)+strTab+ValToStr(radius)\NoNewLine;
        Write iodevScanLog,strTab+ValToStr(normal)\NoNewLine;
        Write iodevScanLog,strTab+ValToStr(rms)+strTab+ValToStr(maxErr)+strTab+ValToStr(indexWorst);

        robtTemp:=robtLLCCenter;
        IF RobOS() THEN
            robtTemp.trans:=center+posSPPOffsetForSmarTac;
        ENDIF
        MoveJ robtTemp,speedAir,fine,toolScan\WObj:=wobjScan;
        Search_1D poseDLSSPP\SearchStop:=robtDLSSPP,RelTool(robtTemp,0,0,numSmarTacOffsetZ),robtTemp,speedAir,toolScan\WObj:=wobjScan;
        Logging\INFO,"robtDLSSPP="+ValToStr(robtDLSSPP.trans);
        Write iodevScanLog,"";
        Write iodevScanLog,"robtDLSSPP";
        Write iodevScanLog,ValToStr(robtDLSSPP.trans);

        !GetClosest
        IF RobOS() THEN
            TEST numLLScanDirection
            CASE 1:
                robtDLSClosestDetect.trans.x:=center.x;
            CASE 2:
                robtDLSClosestDetect.trans.y:=center.y;
            DEFAULT:
                robtDLSClosestDetect.trans.z:=center.z;
            ENDTEST
        ENDIF
        MoveJ robtDLSClosestDetect,speedAir,fine,toolScan\WObj:=wobjScan;
        Logging\INFO,"Moved to robtDLSClosestDetect";
        WaitTime numWaitTimeForLaserScan;
        numDLSClosestLaserValue:=signalaiLaser-numTCPLaserValue;
        robtTemp:=RelTool(robtDLSClosestDetect,0,0,numDLSClosestLaserValue);
        posDLSClosest:=robtTemp.trans;
        Write iodevScanLog,"";
        Write iodevScanLog,"posDLSClosest";
        Write iodevScanLog,ValToStr(posDLSClosest);
        Close iodevScanLog;

    ENDPROC
ENDMODULE
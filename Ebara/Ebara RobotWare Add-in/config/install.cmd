setstr -strvar $TMP_ARC -value $BOOTPATH
setstr -strvar $BOOTPATH -value "$HOME/WACDemoCfg"

config -filename $BOOTPATH/EIO_d652.cfg -domain EIO -replace

config -filename $BOOTPATH/EIO_B520.cfg -domain EIO -replace

config -filename $BOOTPATH/EIO_BK5250.cfg -domain EIO -replace
config -filename $BOOTPATH/PROC_TorchServices.cfg -domain PROC -replace

config -filename $BOOTPATH/SYS_Ebara.cfg -domain SYS -replace

config -filename $BOOTPATH/EIO_FroniusSmarTac.cfg -domain EIO -replace
config -filename $BOOTPATH/PROC_FroniusSmarTac.cfg -domain PROC -replace

config -filename $BOOTPATH/SYS_ProductionManager.cfg -domain SYS -replace
config -filename $BOOTPATH/EIO_Virtual_ProductionManager.cfg -domain EIO -replace
config -filename $BOOTPATH/PROC_Virtual_ProductionManager.cfg -domain PROC -replace
config -filename $BOOTPATH/MMC_Virtual_ProductionManager.cfg -domain MMC -replace

config -filename $BOOTPATH/MOC/MOC_Ebara.cfg -domain MOC -replace
#config -filename $BOOTPATH/MOC/mocActivationNormal.cfg -domain MOC -replace
config -filename $BOOTPATH/MOC/mocActivationErrorModel.cfg -domain MOC -replace
config -filename $BOOTPATH/MOC/Drveio_2.cfg -domain EIO-replace
config -filename $BOOTPATH/MOC/DrveioTrustlevel.cfg -domain EIO-replace
config -filename $BOOTPATH/MOC/IoA_1_Drveio2.cfg -domain EIO-replace

copy -from $HOME/Rapids/T_ROB1/BE_User.sys -to $HOME/ApplSys/ROB1/BE_User.sys
copy -from $HOME/Rapids/T_ROB2/BE_User.sys -to $HOME/ApplSys/ROB2/BE_User.sys

setstr -strvar $BOOTPATH -value "$TMP_ARC"
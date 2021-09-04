setstr -strvar $TMP_ARC -value $BOOTPATH
setstr -strvar $BOOTPATH -value "$HOME/WACDemoCfg"

config -filename $BOOTPATH/config/EIO_Megmeet.cfg -domain EIO -replace

config -filename $BOOTPATH/config/PROC_Megmeet.cfg -domain PROC -replace

config -filename $BOOTPATH/config/MMC_Megmeet.cfg -domain MMC -replace

config -filename $BOOTPATH/config/SYS.cfg -domain SYS -replace

config -filename $BOOTPATH/config/MOC.cfg -domain MOC -replace

setstr -strvar $BOOTPATH -value "$TMP_ARC"
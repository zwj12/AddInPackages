setstr -strvar $TMP_ARC -value $BOOTPATH
setstr -strvar $BOOTPATH -value "$HOME/WACDemoCfg"

config -filename $BOOTPATH/config/EIO_DONSUN.cfg -domain EIO -replace

config -filename $BOOTPATH/config/PROC_DONSUN.cfg -domain PROC -replace

config -filename $BOOTPATH/config/SYS_DONSUN.cfg -domain SYS -replace

config -filename $BOOTPATH/config/MMC_DONSUN.cfg -domain MMC -replace

setstr -strvar $BOOTPATH -value "$TMP_ARC"
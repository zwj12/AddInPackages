#setstr -strvar $TMP_ARC -value $BOOTPATH
#setstr -strvar $BOOTPATH -value "$HOME/WACDemoCfg"

config -filename $BOOTPATH/SYSPAR/DeviceNet/EIO_d651.cfg -domain EIO -replace
config -filename $BOOTPATH/SYSPAR/DeviceNet/EIO_d652.cfg -domain EIO -replace
config -filename $BOOTPATH/SYSPAR/DeviceNet/EIO_BK5250.cfg -domain EIO -replace
config -filename $BOOTPATH/SYSPAR/DeviceNet/EIO_FESTOValve.cfg -domain EIO -replace
config -filename $BOOTPATH/SYSPAR/DeviceNet/EIO_RPC.cfg -domain EIO -replace

config -filename $BOOTPATH/SYSPAR/PROFINET/EIO_PNVC5.cfg -domain EIO -replace
config -filename $BOOTPATH/SYSPAR/PROFINET/EIO_PN_Internal_Device.cfg -domain EIO -replace
config -filename $BOOTPATH/SYSPAR/PROFINET/SIO_PN_Internal_Device.cfg -domain SYS -replace

config -filename $BOOTPATH/SYSPAR/EtherNetIP/EIO_EN_Internal_Device.cfg -domain EIO -replace

config -filename $BOOTPATH/SYSPAR/EIO_ToolChanger.cfg -domain EIO -replace

config -filename $BOOTPATH/SYSPAR/RPC/PROC_RPC.cfg -domain PROC -replace

config -filename $BOOTPATH/SYSPAR/PROC_ProductionManger.cfg -domain PROC -replace
config -filename $BOOTPATH/SYSPAR/MMC_ProductionManager.cfg -domain MMC -replace

config -filename $BOOTPATH/SYSPAR/WeldGuide/EIO_WeldGuide.cfg -domain EIO -replace
config -filename $BOOTPATH/SYSPAR/WeldGuide/PROC_WeldGuide.cfg -domain PROC -replace
config -filename $BOOTPATH/SYSPAR/WeldGuide/SIO_WeldGuideCom1.cfg -domain SIO -replace

#config -filename $BOOTPATH/SYSPAR/SYS_1200.cfg -domain SYS -replace

#copy -from $HOME/Rapids/T_ROB1/TCSupport/tcbase.sys -to $HOME/TCSupport/tcbase.sys
#copy -from $HOME/Rapids/T_ROB1/TCSupport/tcuser.sys -to $HOME/TCSupport/tcuser.sys
#copy -from $HOME/Rapids/T_ROB1/TCSupport/tcdefine.sys -to $HOME/TCSupport/tcdefine.sys
#copy -from $HOME/Rapids/T_ROB1/TCSupport/tcdevice.sys -to $HOME/TCSupport/tcdevice.sys

#copy -from $HOME/Rapids/T_ROB1/BullsEye/BE_User.sys -to $HOME/ApplSys/ROB1/BE_User.sys

#setstr -strvar $BOOTPATH -value "$TMP_ARC"
# Install.cmd script for Add-In ZHONGXUN
# Michael, 2021-9-4, Created

echo -text "Installing ZHONGXUN Add-In"

# Define environment variable
# Must be capitalized
setenv -name "ZHONGXUN" -value $BOOTPATH

# Register path for ZHONGXUN GUIs
register -type option -description ZHONGXUN -path $BOOTPATH

# Create Production screen Dir
direxist -path $HOME/ProdScr -label NEXT
mkdir -path $HOME/ProdScr
#NEXT
direxist -path $HOME/ProdScr/tps -label NEXT
mkdir -path $HOME/ProdScr/tps
#NEXT
direxist -path $HOME/ProdScr/config -label NEXT
mkdir -path $HOME/ProdScr/config
#NEXT
direxist -path $HOME/ProdScr/language -label NEXT
mkdir -path $HOME/ProdScr/language
#NEXT
direxist -path $HOME/ProdScr/language/zh -label NEXT
mkdir -path $HOME/ProdScr/language/zh
#NEXT
direxist -path $HOME/ProdScr/language/zh/tps -label NEXT
mkdir -path $HOME/ProdScr/language/zh/tps
#NEXT

# Create RAATCfg Dir
direxist -path $HOME/RAATCfg -label NEXT
mkdir -path $HOME/RAATCfg
#NEXT
direxist -path $HOME/RAATCfg/RAPID -label NEXT
mkdir -path $HOME/RAATCfg/RAPID
#NEXT
direxist -path $HOME/RAATCfg/RAPID/TASK1 -label NEXT
mkdir -path $HOME/RAATCfg/RAPID/TASK1
#NEXT
direxist -path $HOME/RAATCfg/RAPID/TASK1/PROGMOD -label NEXT
mkdir -path $HOME/RAATCfg/RAPID/TASK1/PROGMOD
#NEXT
direxist -path $HOME/RAATCfg/RAPID/TASK1/SYSMOD -label NEXT
mkdir -path $HOME/RAATCfg/RAPID/TASK1/SYSMOD
#NEXT
direxist -path $HOME/RAATCfg/RAPID/TASK3 -label NEXT
mkdir -path $HOME/RAATCfg/RAPID/TASK3
#NEXT
direxist -path $HOME/RAATCfg/RAPID/TASK3/PROGMOD -label NEXT
mkdir -path $HOME/RAATCfg/RAPID/TASK3/PROGMOD
#NEXT
direxist -path $HOME/RAATCfg/RAPID/TASK3/SYSMOD -label NEXT
mkdir -path $HOME/RAATCfg/RAPID/TASK3/SYSMOD
#NEXT

# Copy Data Modules
copy -from $BOOTPATH/RAPID/TASK1/PROGMOD/CalibDataModule.mod -to $HOME/RAATCfg/RAPID/TASK1/PROGMOD/CalibDataModule.mod
copy -from $BOOTPATH/RAPID/TASK1/PROGMOD/MainModule.mod -to $HOME/RAATCfg/RAPID/TASK1/PROGMOD/MainModule.mod
copy -from $BOOTPATH/RAPID/TASK1/PROGMOD/ProcessDataModule.mod -to $HOME/RAATCfg/RAPID/TASK1/PROGMOD/ProcessDataModule.mod
copy -from $BOOTPATH/RAPID/TASK1/PROGMOD/TaskModule.mod -to $HOME/RAATCfg/RAPID/TASK1/PROGMOD/TaskModule.mod
copy -from $BOOTPATH/RAPID/TASK1/PROGMOD/TestModule.mod -to $HOME/RAATCfg/RAPID/TASK1/PROGMOD/TestModule.mod
copy -from $BOOTPATH/RAPID/TASK1/PROGMOD/ServiceModule.mod -to $HOME/RAATCfg/RAPID/TASK1/PROGMOD/ServiceModule.mod
copy -from $BOOTPATH/RAPID/TASK1/PROGMOD/SmarTacTestModule.mod -to $HOME/RAATCfg/RAPID/TASK1/PROGMOD/SmarTacTestModule.mod
copy -from $BOOTPATH/RAPID/TASK1/PROGMOD/WeldTestModule.mod -to $HOME/RAATCfg/RAPID/TASK1/PROGMOD/WeldTestModule.mod
copy -from $BOOTPATH/RAPID/TASK1/PROGMOD/TestAutoCal.mod -to $HOME/RAATCfg/RAPID/TASK1/PROGMOD/TestAutoCal.mod
copy -from $BOOTPATH/RAPID/TASK1/SYSMOD/AutoCal2b.sys -to $HOME/RAATCfg/RAPID/TASK1/SYSMOD/AutoCal2b.sys

# Create YAML Dir
direxist -path $HOME/yaml -label NEXT
mkdir -path $HOME/yaml
#NEXT

# Copy files
getkey -id "ROBOT107895" -strvar $ANSWER -errlabel NEXT
copy -from $BOOTPATH/config/ProductionSetup_ZHONGXUN.xml -to $HOME/ProdScr/config/ProductionSetup_ZHONGXUN.xml
# copy -from $BOOTPATH/tps/TpsViewZHONGXUN.dll -to $HOME/ProdScr/tps/TpsViewZHONGXUN.dll
# copy -from $BOOTPATH/tps/TpsViewZHONGXUNTexts.dll -to $HOME/ProdScr/tps/TpsViewZHONGXUNTexts.dll
# copy -from $BOOTPATH/tps/icon_ZHONGXUN.png -to $HOME/ProdScr/tps/icon_ZHONGXUN.png
# copy -from $BOOTPATH/language/zh/tps/TpsViewZHONGXUNTexts.resources.dll -to $HOME/ProdScr/language/zh/tps/TpsViewZHONGXUNTexts.resources.dll
#NEXT

getkey -id "ROBOT107896" -strvar $ANSWER -errlabel NEXT
copy -from $BOOTPATH/config/ProductionSetup_ZHONGXUN.xml -to $HOME/ProdScr/config/ProductionSetup_ZHONGXUN.xml
# copy -from $BOOTPATH/tps/TpsViewZHONGXUN.dll -to $HOME/ProdScr/tps/TpsViewZHONGXUN.dll
# copy -from $BOOTPATH/tps/TpsViewZHONGXUNTexts.dll -to $HOME/ProdScr/tps/TpsViewZHONGXUNTexts.dll
# copy -from $BOOTPATH/tps/icon_ZHONGXUN.png -to $HOME/ProdScr/tps/icon_ZHONGXUN.png
# copy -from $BOOTPATH/language/zh/tps/TpsViewZHONGXUNTexts.resources.dll -to $HOME/ProdScr/language/zh/tps/TpsViewZHONGXUNTexts.resources.dll
#NEXT

# Load configuration files
getkey -id "ROBOT107895" -strvar $ANSWER -errlabel NEXT
config -filename $BOOTPATH/config/MOC_GantryXYZ_MU433_M789DM1.cfg -domain MOC -replace
config -filename $BOOTPATH/config/mocMoutIRB140_0.81_6.cfg -domain MOC -replace

config -filename $BOOTPATH/config/EIO_Virtual_ProductionManager.cfg -domain EIO -replace
config -filename $BOOTPATH/config/PROC_Virtual_ProductionManager.cfg -domain PROC -replace
config -filename $BOOTPATH/config/MMC_Virtual_ProductionManager.cfg -domain MMC -replace

config -filename $BOOTPATH/config/EIO_Virtual_SystemInOut.cfg -domain EIO -replace

config -filename $BOOTPATH/config/EIO_LocalIO.cfg -domain EIO -replace

config -filename $BOOTPATH/config/EIO_Virtual.cfg -domain EIO -replace
config -filename $BOOTPATH/config/PROC_Virtual.cfg -domain PROC -replace

config -filename $BOOTPATH/config/EIO_PN_Internal_Device_107895.cfg -domain EIO -replace
config -filename $BOOTPATH/config/SIO_PN_Internal_Device_107895.cfg -domain SIO -replace

config -filename $BOOTPATH/config/EIO_FroniusSmarTac_107895.cfg -domain EIO -replace
config -filename $BOOTPATH/config/PROC_FroniusSmarTac.cfg -domain PROC -replace

config -filename $BOOTPATH/config/EIO_DN_107895.cfg -domain EIO -replace

config -filename $BOOTPATH/config/PROC_TorchServices.cfg -domain PROC -replace

config -filename $BOOTPATH/config/SYS.cfg -domain SYS -replace
#NEXT

getkey -id "ROBOT107896" -strvar $ANSWER -errlabel NEXT
config -filename $BOOTPATH/config/MOC_GantryXYZ_MU433_M789DM1_107896.cfg -domain MOC -replace
config -filename $BOOTPATH/config/mocMoutIRB140_0.81_6.cfg -domain MOC -replace

config -filename $BOOTPATH/config/EIO_Virtual_ProductionManager.cfg -domain EIO -replace
config -filename $BOOTPATH/config/PROC_Virtual_ProductionManager.cfg -domain PROC -replace
config -filename $BOOTPATH/config/MMC_Virtual_ProductionManager.cfg -domain MMC -replace

config -filename $BOOTPATH/config/EIO_Virtual_SystemInOut.cfg -domain EIO -replace

config -filename $BOOTPATH/config/EIO_LocalIO.cfg -domain EIO -replace

config -filename $BOOTPATH/config/EIO_Virtual.cfg -domain EIO -replace
config -filename $BOOTPATH/config/PROC_Virtual.cfg -domain PROC -replace

config -filename $BOOTPATH/config/EIO_PN_Internal_Device_107896.cfg -domain EIO -replace
config -filename $BOOTPATH/config/SIO_PN_Internal_Device_107896.cfg -domain SIO -replace

config -filename $BOOTPATH/config/EIO_FroniusSmarTac_107896.cfg -domain EIO -replace
config -filename $BOOTPATH/config/PROC_FroniusSmarTac.cfg -domain PROC -replace

config -filename $BOOTPATH/config/EIO_DN_107896.cfg -domain EIO -replace

config -filename $BOOTPATH/config/PROC_TorchServices.cfg -domain PROC -replace

config -filename $BOOTPATH/config/SYS.cfg -domain SYS -replace
#NEXT

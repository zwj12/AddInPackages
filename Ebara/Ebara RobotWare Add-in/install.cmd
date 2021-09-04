# Install.cmd script for Add-In Ebara

echo -text "Installing Ebara Add-In"

# Register path for Ebara GUIs
register -type option -description Ebara -path $BOOTPATH

# Load configuration files

config -filename $BOOTPATH/config/EIO_d652.cfg -domain EIO -replace

config -filename $BOOTPATH/config/EIO_B520.cfg -domain EIO -replace

config -filename $BOOTPATH/config/EIO_BK5250.cfg -domain EIO -replace
config -filename $BOOTPATH/config/PROC_TorchServices.cfg -domain PROC -replace

config -filename $BOOTPATH/config/SYS_Ebara.cfg -domain SYS -replace

config -filename $BOOTPATH/config/EIO_FroniusSmarTac.cfg -domain EIO -replace
config -filename $BOOTPATH/config/PROC_FroniusSmarTac.cfg -domain PROC -replace

config -filename $BOOTPATH/config/SYS_ProductionManager.cfg -domain SYS -replace
config -filename $BOOTPATH/config/EIO_Virtual_ProductionManager.cfg -domain EIO -replace
config -filename $BOOTPATH/config/PROC_Virtual_ProductionManager.cfg -domain PROC -replace
config -filename $BOOTPATH/config/MMC_Virtual_ProductionManager.cfg -domain MMC -replace

config -filename $BOOTPATH/config/MOC/MOC_Ebara.cfg -domain MOC -replace
config -filename $BOOTPATH/config/MOC/mocActivationErrorModel.cfg -domain MOC -replace
config -filename $BOOTPATH/config/MOC/Drveio_2.cfg -domain EIO-replace
config -filename $BOOTPATH/config/MOC/DrveioTrustlevel.cfg -domain EIO-replace
config -filename $BOOTPATH/config/MOC/IoA_1_Drveio2.cfg -domain EIO-replace

copy -from $BOOTPATH/RAPID/T_ROB1/BE_User.sys -to $HOME/ApplSys/ROB1/BE_User.sys
copy -from $BOOTPATH/RAPID/T_ROB2/BE_User.sys -to $HOME/ApplSys/ROB2/BE_User.sys

copy -from $BOOTPATH/config/ProductionSetup_Ebara.xml -to $HOME/ProdScr/config/ProductionSetup_Ebara.xml

# Define environment variable
# Must be capitalized

setenv -name "EBARA" -value $BOOTPATH

# Register elog messages

# register -type elogmes -domain_no 11 -min 5001 -max 5001 -prepath $BOOTPATH/language/ -postpath /Ebara_elogtext.xml
# register -type elogtitle -prepath $BOOTPATH/language/ -postpath /Ebara_elogtitles.xml

direxist -path $HOME/Rapids -label DirRapidsExist
mkdir -path $HOME/Rapids
#DirRapidsExist

direxist -path $HOME/Rapids/T_ROB1 -label DirT_ROB1Exist
mkdir -path $HOME/Rapids/T_ROB1
#DirT_ROB1Exist

direxist -path $HOME/Rapids/T_ROB2 -label DirT_ROB2Exist
mkdir -path $HOME/Rapids/T_ROB2
#DirT_ROB2Exist

direxist -path $HOME/Rapids/T_POS1 -label DirT_POS1Exist
mkdir -path $HOME/Rapids/T_POS1
#DirT_POS1Exist
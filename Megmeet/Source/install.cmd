# Install.cmd script for Add-In MEGMEET
# Michael, 2020-5-27, Created

echo -text "Installing MEGMEET Add-In"

# Define environment variable
# Must be capitalized
setenv -name "MEGMEET" -value $BOOTPATH

# Register path for MEGMEET GUIs
register -type option -description MEGMEET -path $BOOTPATH

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

# Load configuration files for DeviceNet
getkey -id "ArtsenPlusDeviceNet" -strvar $ANSWER -errlabel NEXT
config -filename $BOOTPATH/config/EIO_Megmeet.cfg -domain EIO -replace
config -filename $BOOTPATH/config/PROC_Megmeet.cfg -domain PROC -replace
config -filename $BOOTPATH/config/MMC_Megmeet.cfg -domain MMC -replace
config -filename $BOOTPATH/config/SYS_Megmeet.cfg -domain SYS -replace

# Load configuration files if No FieldBus is checked
getkey -id "ArtsenPlus" -strvar $ANSWER -errlabel NEXT
config -filename $BOOTPATH/config/EIO_Megmeet.cfg -domain EIO -replace
config -filename $BOOTPATH/config/PROC_Megmeet.cfg -domain PROC -replace
config -filename $BOOTPATH/config/MMC_Megmeet.cfg -domain MMC -replace
config -filename $BOOTPATH/config/SYS_Megmeet.cfg -domain SYS -replace
#NEXT

# Register elog messages
# register -type elogmes -domain_no 11 -min 5001 -max 5001 -prepath $BOOTPATH/language/ -postpath /MEGMEET_elogtext.xml
# register -type elogtitle -prepath $BOOTPATH/language/ -postpath /MEGMEET_elogtitles.xml

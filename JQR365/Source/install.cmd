# Install.cmd script for Add-In JQR365
# Michael, 2019-7-31, Created

echo -text "Installing JQR365 Add-In"

# Define environment variable
# Must be capitalized
setenv -name "JQR365" -value $BOOTPATH

# Register path for JQR365 GUIs
register -type option -description JQR365 -path $BOOTPATH

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

# Copy files
getkey -id "DONSUN" -strvar $ANSWER -errlabel NEXT
copy -from $BOOTPATH/config/ProductionSetup_JQR365.xml -to $HOME/ProdScr/config/ProductionSetup_JQR365.xml
#copy -from $BOOTPATH/tps/TpsViewJQR365.dll -to $HOME/ProdScr/tps/TpsViewJQR365.dll
#copy -from $BOOTPATH/tps/TpsViewJQR365Texts.dll -to $HOME/ProdScr/tps/TpsViewJQR365Texts.dll
#copy -from $BOOTPATH/tps/icon_jqr365.png -to $HOME/ProdScr/tps/icon_jqr365.png
#copy -from $BOOTPATH/language/zh/tps/TpsViewJQR365Texts.resources.dll -to $HOME/ProdScr/language/zh/tps/TpsViewJQR365Texts.resources.dll
#NEXT

# Load configuration files
getkey -id "DONSUN" -strvar $ANSWER -errlabel NEXT
config -filename $BOOTPATH/config/EIO_DONSUN.cfg -domain EIO -replace
config -filename $BOOTPATH/config/PROC_DONSUN.cfg -domain PROC -replace
config -filename $BOOTPATH/config/SYS_DONSUN_JQR365.cfg -domain SYS -replace
config -filename $BOOTPATH/config/MMC_DONSUN.cfg -domain MMC -replace
#NEXT

# Register elog messages
# register -type elogmes -domain_no 11 -min 5001 -max 5001 -prepath $BOOTPATH/language/ -postpath /Ebara_elogtext.xml
# register -type elogtitle -prepath $BOOTPATH/language/ -postpath /Ebara_elogtitles.xml

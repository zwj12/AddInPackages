# Install.cmd script for Add-In REHM
# Michael, 2020-12-28, Created

echo -text "Installing REHM Add-In"

# Define environment variable
# Must be capitalized
setenv -name "REHM" -value $BOOTPATH

# Load configuration files
config -filename $BOOTPATH/config/EIO_REHM.cfg -domain EIO -replace
config -filename $BOOTPATH/config/MMC_REHM.cfg -domain MMC -replace
config -filename $BOOTPATH/config/PROC_REHM.cfg -domain PROC -replace
config -filename $BOOTPATH/config/SYS_REHM.cfg -domain SYS -replace

getkey -id "REHMDEVICENET" -strvar $ANSWER -errlabel NEXT
config -filename $BOOTPATH/config/EIO_REHM_DeviceNet.cfg -domain EIO -replace
#NEXT

getkey -id "REHMPROFINET" -strvar $ANSWER -errlabel NEXT
config -filename $BOOTPATH/config/EIO_REHM_PROFINET.cfg -domain EIO -replace
copy -from $BOOTPATH/config/IPPNIO.xml -to $HOME/IPPNIO.xml
#NEXT

getkey -id "REHMETHERNETIP" -strvar $ANSWER -errlabel NEXT
config -filename $BOOTPATH/config/EIO_REHM_EtherNetIP.cfg -domain EIO -replace
#NEXT
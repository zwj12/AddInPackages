# Install.cmd script for Add-In ILOpticalTracking
# Michael, 2019-3-25, Created

echo -text "Installing ILOpticalTracking Add-In"

# Load configuration files

getkey -id "ILHSP" -strvar $ANSWER -errlabel NEXT
config -filename $BOOTPATH/config/PROC_SENSOR.cfg -domain PROC -replace
config -filename $BOOTPATH/config/SIO_SENSOR.cfg -domain SIO -replace
#NEXT

getkey -id "IL150" -strvar $ANSWER -errlabel NEXT
config -filename $BOOTPATH/config/PROC_SENSOR.cfg -domain PROC -replace
config -filename $BOOTPATH/config/SIO_SENSOR.cfg -domain SIO -replace
#NEXT

#ROBOT_1
getkey -id "SampleCode1" -strvar $ANSWER -errlabel ROBOT_2
config -filename $BOOTPATH/config/SYS_SampleCode_T_ROB1.cfg -domain SYS -replace

#ROBOT_2
getkey -id "SampleCode2" -strvar $ANSWER -errlabel ROBOT_3
config -filename $BOOTPATH/config/SYS_SampleCode_T_ROB2.cfg -domain SYS -replace

#ROBOT_3
getkey -id "SampleCode3" -strvar $ANSWER -errlabel ROBOT_4
config -filename $BOOTPATH/config/SYS_SampleCode_T_ROB3.cfg -domain SYS -replace

#ROBOT_4
getkey -id "SampleCode4" -strvar $ANSWER -errlabel NEXT
config -filename $BOOTPATH/config/SYS_SampleCode_T_ROB4.cfg -domain SYS -replace

#NEXT

# Define environment variable
# Must be capitalized

setenv -name "ILOpticalTracking" -value $BOOTPATH

# Register elog messages

# register -type elogmes -domain_no 11 -min 5001 -max 5001 -prepath $BOOTPATH/language/ -postpath /Ebara_elogtext.xml
# register -type elogtitle -prepath $BOOTPATH/language/ -postpath /Ebara_elogtitles.xml

direxist -path $HOME/Rapids -label DirRapidsExist
mkdir -path $HOME/Rapids
#DirRapidsExist

copy -from $BOOTPATH/RAPID/OpticalTrackingModule.mod -to $HOME/Rapids/OpticalTrackingModule.mod

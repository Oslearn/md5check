#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Email : e2ma3n@Gmail.com
# Website : http://OSLearn.ir
# License : GPL v3.0
# md5check v1.0
#####################################################
# check md5check file
[ ! -f md5check.txt ] && echo "cannot access md5check.txt: No such file" && exit 1

# get number of files
var0=`cat md5check.txt | wc -l`

for (( i=1 ; i <= $var0 ; i++ )) ; do

# get hash file from md5check.txt
var1=`cat md5check.txt | head -n $i | tail -n 1 | cut -d " " -f 1`

# get file name from md5check.txt
var2=`cat md5check.txt | head -n $i | tail -n 1 | cut -d " " -f 3`

# get md5sum from local file
var3=`md5sum $var2 | cut -d " " -f 1`

# compare 2 hash
if [ "$var1" = "$var3" ] ; then
	echo -e "\e[92m$var2 \e[39m"
else
	echo -e "\e[91m$var2 \e[39m"
fi ; done

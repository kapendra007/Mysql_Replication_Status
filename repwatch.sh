#!/bin/bash

ctime=$(date +%F-%T)
pwd_path=`dirname "$0"`
script_path=$(echo "$pwd_path")

MYSQLFILE="--defaults-file=/root/.my.cnf"
#wget -q -O /tmp/iv-DB2.txt http://MINT80.monster.co.in/iv.txt

###################################

function Check_if_Active ()
{
DBName=$1
SRVName=$2
case $DBName in
	seeker)
		FName='$script_path/db_details/seeker_slave.txt'
	;;
	sso)
		FName='$script_path/db_details/sso_slave.txt'
	;;
	recruiter)
		FName='$script_path/db_details/recruiter_slave.txt'
        ;;
        miscellaneous)
                FName='$script_path/db_details/miscellaneous_slave.txt'
	;;
esac
grep $SRVName $FName >> /dev/null
if [ $? -eq 0 ]
then
	echo -n "A "
else
	echo -n "  "
fi
}


##########################################
echo
echo "############### Replication Status of All DB Cluster #############"
echo 
date
echo 
echo "-----------------------------------------------------"
echo -e "\n\nSlaves in seconds behind master Mintdb2 ( Mintdb2M ) \n"
Check_if_Active DB2 as01; mysql $MYSQLFILE -h 10.216.240.124 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb2as01\t\t\t"$2}'
mysql $MYSQLFILE1 -h <hostname> -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "DB2SL(10.216.204.7)\t\t"$2}'


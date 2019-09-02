#!/bin/bash

ctime=$(date +%F-%T)
pwd_path=`dirname "$0"`
script_path=$(echo "$pwd_path")

MYSQLFILE="--defaults-file=/root/.my.cnf"
#wget -q -O /tmp/iv-DB2.txt http://dbhostname.com/iv.txt

###################################

function Check_if_Active ()
{
DBName=$1
SRVName=$2
case $DBName in
	slave1)
		FName='$script_path/db_details/salve1.txt'
	;;
	slave2)
		FName='$script_path/db_details/slave2.txt'
	;;
	slave3)
		FName='$script_path/db_details/slave3.txt'
        ;;
        slave4)
                FName='$script_path/db_details/slave4.txt'
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
echo "--------------------------------------------------
echo -e "\n\nSlaves in seconds behind master slave1 ( $HOSTNAME ) \n"
Check_if_Active dbname slave; mysql $MYSQLFILE -h 10.10.240.124 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "slave1\t\t\t"$2}'
mysql $MYSQLFILE1 -h <hostname> -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "$HOSTNAME(10.216.204.7)\t\t"$2}'


#!/bin/bash
MYSQLFILE="--defaults-file=/root/.my.cnf"
MYSQLFILE1="--defaults-file=/root/.my.cnf.root"
MYSQLFILE11="--defaults-file=/root/.my.cnf.root11"
#wget -q -O /tmp/iv-DB1.txt http://MINT65.monster.co.in/iv.txt
#wget -q -O /tmp/iv-DB2.txt http://MINT80.monster.co.in/iv.txt
function Check_if_Active ()
{
DBName=$1
SRVName=$2
case $DBName in
	DB1)
		FName='/tmp/iv-DB1.txt'
	;;
	DB2)
		FName='/tmp/iv-DB2.txt'
	;;
	DB3)
		FName='/tmp/iv-DB3.txt'
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
echo
echo "############### Replication Status of All DB Cluster #############"
echo 
date
echo 
echo -e "Slaves in seconds behind master Mintdb1 ( Mintdb1M ) \n"
echo "------------------------------------------------------"
Check_if_Active DB1 as01; mysql $MYSQLFILE -h 10.216.240.105 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb1as01\t\t\t"$2}'
Check_if_Active DB1 as01; mysql $MYSQLFILE -h 10.216.240.105 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb1as01\t\t\t"$2}'
Check_if_Active DB1 as02; mysql $MYSQLFILE -h 10.216.240.106 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb1as02\t\t\t"$2}'
Check_if_Active DB1 as03; mysql $MYSQLFILE -h 10.216.240.113 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb1as03\t\t\t"$2}'
Check_if_Active DB1 as04; mysql $MYSQLFILE -h 10.216.240.114 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb1as04\t\t\t"$2}'
Check_if_Active DB1 ps01; mysql $MYSQLFILE -h 10.216.240.115 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb1ps01\t\t\t"$2}'
Check_if_Active DB1 ps01; mysql $MYSQLFILE -h 10.216.240.122 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb1ps02\t\t\t"$2}'
#Check_if_Active DB1 sas; mysql $MYSQLFILE -h 10.216.240.182 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "MINTdb1sas\t\t\t"$2}'
mysql $MYSQLFILE1 -h DB1SL  -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "DB1SL(10.216.204.6)\t\t"$2}'

echo "------------------------------------------------------"
echo -e "\n\nSlaves in seconds behind master Mintdb2 ( Mintdb2M ) \n"
Check_if_Active DB2 as01; mysql $MYSQLFILE -h 10.216.240.124 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb2as01\t\t\t"$2}'
Check_if_Active DB2 as02; mysql $MYSQLFILE -h 10.216.240.131 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb2as02\t\t\t"$2}'
Check_if_Active DB2 as03; mysql $MYSQLFILE -h 10.216.240.132 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb2as03\t\t\t"$2}'
Check_if_Active DB2 as04; mysql $MYSQLFILE -h 10.216.240.133 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb2as04\t\t\t"$2}'
Check_if_Active DB2 ps01; mysql $MYSQLFILE -h 10.216.240.140 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb2ps01\t\t\t"$2}'
Check_if_Active DB2 ps02; mysql $MYSQLFILE -h 10.216.240.141 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb2ps02\t\t\t"$2}'
Check_if_Active DB2 ps03; mysql $MYSQLFILE -h 10.216.240.142 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb2ps03\t\t\t"$2}'
Check_if_Active DB2 ps04; mysql $MYSQLFILE -h 10.216.240.109 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb2ps04\t\t\t"$2}'
Check_if_Active DB2 ps05; mysql $MYSQLFILE -h 10.216.240.118 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb2ps05\t\t\t"$2}'
#Check_if_Active DB2 sas; mysql $MYSQLFILE -h 10.216.240.184 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb2sas\t\t\t"$2}'
mysql $MYSQLFILE1 -h DB2SL -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "DB2SL(10.216.204.7)\t\t"$2}'
#mysql $MYSQLFILE1 -h 10.216.204.21 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "UserResume21(10.216.204.21)\t"$2}'

echo "-----------------------------------------------------"
echo -e "Slaves in seconds behind master Mintdb3 ( Mintdb3M )\n"
Check_if_Active DB3 as01; mysql $MYSQLFILE -h 10.216.240.150 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb3as01\t\t\t"$2}'
Check_if_Active DB3 as02; mysql $MYSQLFILE -h 10.216.240.151 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb3as02\t\t\t"$2}'
Check_if_Active DB3 as03; mysql $MYSQLFILE -h 10.216.240.152 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb3as03\t\t\t"$2}'
Check_if_Active DB3 as04; mysql $MYSQLFILE -h 10.216.240.158 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb3as04\t\t\t"$2}'
#Check_if_Active DB3 sas; mysql $MYSQLFILE -h 10.216.240.178 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb3sas\t\t\t"$2}'
mysql $MYSQLFILE1 -h DB3SL -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "DB3SL(10.216.204.9)\t\t"$2}'
#echo "--------------------------------------------------------------"

echo "-----------------------------------------------------"
echo -e "Slaves in seconds behind master Mintdb5 ( Mintdb5M )\n"
Check_if_Active DB5 as01; mysql $MYSQLFILE -h 10.216.240.160 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb5as01\t\t\t"$2}'
#Check_if_Active DB5 sas; mysql $MYSQLFILE -h 10.216.240.184 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "Mintdb5sas\t\t\t"$2}'
mysql $MYSQLFILE1 -h DB7SL -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "DB7SL(10.216.204.30)\t\t"$2}'

echo "-----------------------------------------------------"
echo -e "Slaves in seconds behind master PUG-Servers ( Pug-7 )\n"
mysql $MYSQLFILE -h 207.191.232.168 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "\tPug7\t\t\t"$2}'
mysql $MYSQLFILE -h 207.191.232.160 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "\tPug5\t\t\t"$2}'
mysql $MYSQLFILE -h 207.191.232.92 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "\tPug4\t\t\t"$2}'

#echo "--------------------------------------------------------------"
echo "-----------------------------------------------------"

#echo -e "Slaves in seconds behind master Mind13/Mind14/Mind6 ( Relience_Slaves_Status )\n"

#mysql $MYSQLFILE -h 10.216.204.36 -P 9878 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "mind14\t\t\t"$2}'
#mysql $MYSQLFILE -h 10.216.204.192 -P 3315 -e "show slave status\G" | grep Seconds_Behind_Master | awk '{print "mind6\t\t\t"$2}'
#mysql $MYSQLFILE1 -h 10.216.204.192 --socket=/storage1/mysqldata/mysql.sock -e "show slave status\G;" | grep  "Seconds_Behind_Master" | awk '{print "Mind6SL\t\t\t"$2}'

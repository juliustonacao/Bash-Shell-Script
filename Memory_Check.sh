nano memory_check.sh
# this will create the script file
# you will be routed inside the memory_check.sh wherein you  will write the code
# chmod u+x memory_check.sh to modify execution rights

#!/bin/bash
# A script about memory alert
# Author : JCLT

threshold1=60 # in percent for first reach point
threshold2=90 # in percent for second reach point
sudo hostname bpx.server.local
host=`hostname -f` 
alert=email@mine.com # Email that the alerts will be sent to
logfile="/var/log/memory.log" #alerts are sent here
sudo timedatectl set-timezone Asia/Manila #setting timezone to PHL

# Calculate real-time used memory and assigning variable REALMEM

REALMEM=`free | awk 'FNR == 3 {print $4/($3+$4)*100-100}'| sed 's/-//g' |cut -d "." -f1`

if [ "$REALMEM" -gt "$threshold1" ]
then

date=`date`
echo "The memory usage has reached $REALMEM% on $host" | mail -s "$host : High Memory Usage Alert" $alert
echo "$date : The memory usage has reached $REALMEM% on $host." >> $logfile

##EDIT HERE, SEND EMAIL PART 

if [ "$REALMEM" -gt "$threshold2" ]
then

#SUBJECT="ATTENTION: Memory Utilization is Critical on $(hostname) at $(date)"
DATE="date +"%Y%m%d%T""$
MESSAGE="/tmp/Mail.out"
TO="email@mine.com"

echo "Memory Current Usage is: $ramusage%" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "Top Memory Consuming Process Using top command" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "$(top -b -o +%MEM | head -n 20)" >> $MESSAGE
  
  mail -s "$DATE" "$TO" < $MESSAGE
  rm /tmp/Mail.out
  fi

# Put your own urgency commands here

fi
fi

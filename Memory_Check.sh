nano memory_check.sh
# this will create the script file
# you will be routed inside the memory_check.sh wherein you  will write the code

#!bin/bash
#############################################################################################
# Purpose: Memory Check
# Author : JCLT
#############################################################################################

## Checking the total Memory and assigning variable
free -mt | awk '/Mem:/{print $2 " MB Total Memory "}'
TOTAL_MEMORY=$( free -mt | awk '/Mem:/{print $2 " MB Total Memory"}' )

## Checking how much memoy is used and assigning variable
free -mt | awk '/Mem:/{print $3 " MB Total Memory "}'
USED_MEMORY=$( free -mt | awk '/Mem:/{print $3 " MB Total Memory"}' )

## Checking how much is the free memory and assigning variable
free -mt | awk '/Mem:/{print $4 " MB Total Memory "}'
FREE_MEMORY=$( free -mt | awk '/Mem:/{print $4 " MB Total Memory"}' )

## Checking the RAM_USAGE percentage
RAM_USAGE=$( free -mt | awk '/Mem:/{printf(" RAM USAGE %.2f\n "), $$3/$2*100}' )

## Now we have set up four variables and we can simply call them out using echo command and $variable
## The four variables are as follows : TOTAL_MEMORY, FREE_MEMORY, USED_MEMORY, RAM_USAGE. Please note that these are case sensitive

## CONDDITIONALS: If the used memory is <60% of the TOTAL_MEMORY, do nothing
## exit code should be 0
if [[ "$USED_MEMORY" -le  ]]

exit 0
fi

## CONDDITIONALS: If the used memory is >= 60% of the TOTAL_MEMORY, trigger a WARNING
## exit code should be 1

exit 1
fi


## CONDDITIONALS: If the used memory is >= 90% of the TOTAL_MEMORY, trigger a CRITICAL WARNING 
## List the top processes that consumes the memory and send an email to email@mine.com
## format should be 20220225 06:00 Memory Check - Critical
## exit code should be 2

exit 2
fi


##command for top processes
TOPPROCESS=$(ps -eo pid -eo pcpu -eo command | sort -k 2 -r | grep -v PID | head -n 1)

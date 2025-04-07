#!/bin/bash 


echo -e "\n"
echo  "=== Server Performance Stats ==="

#CPU Usage

echo -e "\n[CPU Usage]"
top -bn1| grep "Cpu(s)" | awk '{print "CPU Load: " 100 - $8 "%"}'

#Memory Usage

echo -e "\n[Memory Usage]"

echo -e "Total Memory: $(free -h | grep "Mem" | awk '{print $2}')"
#Calculate used percentage 

memory_info=$(free  | grep Mem)
total=$(echo $memory_info | awk '{print $2}')
used=$(echo $memory_info | awk '{print $3}')
percent=$((used*100 / total))
echo -e "Memory Used: $used --> ($percent%)"

#Calculate available percentage

available=$(echo $memory_info | awk '{print $7}')
available_percent=$((available*100 / total))
echo -e "Memory Available: $available --> ($available_percent%)"


#Calculate free percentage

free_mem=$(echo $memory_info | awk '{print $4}')
free_percent=$((free_mem*100 / total))
echo -e "Free Memory: $free_mem --> ($free_percent%)"

#Disk Usage

echo -e "\n[Disk Usage]"

echo -e
#Calculate percentage from raw values

disk_info=$(df --total | grep total)
total_disk=$(echo $disk_info | awk '{print $2}')

echo "Total Disk: $total_disk"
used_disk=$(echo $disk_info | awk '{print $3}')
percent_disk=$(echo $disk_info | awk '{print $5}')
echo "Disk Used: $used_disk --> ($percent_disk)"

#Calculate available disk percentage
available_disk=$(echo $disk_info | awk '{print $4}' )
available_disk_pcent=$((available_disk*100 / total_disk))
echo "Disk Available: $available_disk --> ($available_disk_pcent%)"

# Disk Usage per Partition

echo -e "\n[Disk Usage by Partition]"
df -h --output=target,avail,used,pcent 


#Top 5 processes by CPU Usage
echo -e "\n[Top 5 processes by CPU Usage]"
ps -eo user,pid,command,%cpu --sort=-%cpu | head -n 6

#top 5 processes by Memory Usage
echo -e "\n[Top 5 processes by Memory Usage]"
ps -eo user,pid,command,%mem --sort=-%mem | head -n 6


#OS Version
echo -e "\n[OS Version]"
cat /etc/os-release | grep -E '^(NAME|VERSION)=' | sed 's/.*=//' | tr -d '"'


#System Uptime
echo -e "\n[System Uptime]"
uptime -p


#Load Average
echo -e "\n[Load Average (1min, 5min, 15min)]"
cat /proc/loadavg | awk '{print $1, $2, $3}'


#Logged in Useres
echo -e "\n[Logged-in Users]"
who


#Number of Logged in Users
echo -e "\n[Number of Logged-in Users]"
who | wc -l


#System Boot Time
echo -e "\n[System Boot Time]"
who -b


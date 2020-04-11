#!/bin/bash
# Evan Gallis (erg9699)
# CSEC 464 - Lab1

# Time
printf "\n---------- Time ----------\n"
printf "\n********** Date ********** \n"
date
printf "\n********** Uptime ********** \n"
uptime

# OS Info
printf "\n---------- OS ----------\n"
printf "\n********** Operating System ********** \n"
lsb_release -irc
cpu=$(lscpu | grep "Model name:")
model=${cpu##Model name:}
out=$(echo -e "${model}" | sed -e 's/^[[:space:]]*//')
printf "Processor:\t$out"
printf "\nKernel Version:\t"
uname -v

# System Specs
printf "\n---------- System ----------\n"
printf "\n********** CPU ********** \n"
lscpu
printf "\n********** Memory ********** \n"
free -m
printf "\n********** Disks ********** \n"
df -m
printf "\n********** Host Info ********** \n"
printf "Hostname:\t$(hostname)\n"
printf "Domain:\t$(hostname -d)\n"


# Network
printf "\n---------- Network ----------\n"
printf "\n********** NIC Info ********** \n"
ip a
printf "\n********** Established Connections **********\n"
lsof -i | grep ESTABLISHED

# Users
printf "\n---------- Users ----------\n"
printf "\n********** Logged In Currently **********\n"
w
printf "\n********** All User Logins **********\n"
lastlog
printf "\n********** User uid=0 **********\n"
awk -F: '($3 == 0) {printf "%s:%s\n",$1,$3}' /etc/passwd
printf "\n********** Root SUID Files **********\n"
find / -user root -perm -4000 -print 2>/dev/null

# Processes + Open files
printf "\n---------- Processes ----------\n"
printf "\n********** All Processes **********\n"
ps -A
printf "\n********** All Services  **********\n"
service --status-all
printf "\n********** All 'NC' Opened Files **********\n"
netcat=$(ps -c nc | grep nc | awk '{print $1}')
lsof -p $netcat
printf "\n********** Unlinked Files **********\n"
lsof +L1

# Misc
printf "\n---------- MISC. ----------\n"
printf "\n********** Files modified last 24h - /home **********\n"
find /home/* -mtime -1 -ls
printf "\n********** Show scheduled tasks **********\n"
printf "\n++++++++++++++++ Crontab ++++++++++++++++\n"
cat /etc/crontab
printf "\n++++++++++++++++ cron.d ++++++++++++++++\n"
cat /etc/cron.d/*
printf "\n++++++++++++++++ cron.hourly ++++++++++++++++\n"
cat /etc/cron.hourly/*
printf "\n++++++++++++++++ cron.daily ++++++++++++++++\n"
cat /etc/cron.daily/*
printf "\n++++++++++++++++ cron.weekly ++++++++++++++++\n"
cat /etc/cron.weekly/*
printf "\n++++++++++++++++ cron.monthly ++++++++++++++++\n"
cat /etc/cron.monthly/*

# EXTRAS
printf "\n---------- 3 Additional ----------\n"
# 1.
printf "\n********** Files modified last 24h - /etc **********\n"
find /etc/* -mtime -1 -ls
# 2.
printf "\n********** Failed Sudo Commands **********\n"
cat /var/log/auth.log | grep incorrect | grep "COMMAND"
# 3.
printf "\n********** Failed SSH **********\n"
cat /var/log/auth.log | grep sshd | grep "authentication failure"

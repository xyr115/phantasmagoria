# Script to help determine the purpose of the target Linux server
# RUN AS ROOT FOR BEST RESULTS

# display running processes
printf "\n\n\n====================================================================\n"
printf "\tShowing running processes\n"
printf "====================================================================\n\n"
ps aux

# display the running processes in top
printf "\n\n\n====================================================================\n"
printf "\tShowing processes in top\n"
printf "====================================================================\n\n"
top -b -n 1

# check last logins
printf "\n\n\n====================================================================\n"
printf "\tDisplaying last logins for all accounts\n"
printf "====================================================================\n\n"
lastlog

# check running crons
printf "\n\n\n====================================================================\n"
printf "\tShowing crons set up for root\n"
printf "====================================================================\n\n"
crontab -l

# check status of sendmail server
printf "\n\n\n====================================================================\n"
printf "\tLooking at recent sendmail usage\n"
printf "====================================================================\n\n"
ls -altr /var/spool/mail

# check local hostnames for which sendmail server is receiving mail
printf "\n\n\n====================================================================\n"
printf "\tDisplaying sendmail local hostnames\n"
printf "====================================================================\n\n"
cat /etc/mail/local-host-names

# show current connections
printf "\n\n\n====================================================================\n"
printf "\tRetrieving current connection table\n"
printf "====================================================================\n\n"
netstat -tapen

# gather some traffic
printf "\n\n\n====================================================================\n"
printf "\tGathering some traffic for analysis\n"
printf "====================================================================\n\n"
tcpdump -i eth0 not port 22 -vvvvAe -c 500

# show which logs have been used most recently
printf "\n\n\n====================================================================\n"
printf "\tShowing recently used logs\n"
printf "====================================================================\n\n"
ls -altr /var/log

# show which mysql files have been used most recently
printf "\n\n\n====================================================================\n"
printf "\tShowing recently used mysql database files\n"
printf "====================================================================\n\n"
ls -Raltr /var/lib/mysql

# show the end of the system log
printf "\n\n\n====================================================================\n"
printf "\tDisplaying the end of the system log\n"
printf "====================================================================\n\n"
tail -n 1000 /var/log/messages

# display info about apache config files
printf "\n\n\n====================================================================\n"
printf "\tShowing most recently modified httpd (apache) config files\n"
printf "====================================================================\n\n"
ls -Raltr /etc/httpd/conf

# show anything that is being exported over NFS
printf "\n\n\n====================================================================\n"
printf "\tShowing NFS exports\n"
printf "====================================================================\n\n"
cat /etc/exports

# check to see if we are using any virtual machines
printf "\n\n\n====================================================================\n"
printf "\tAny libvirt KVM virtual machines running?\n"
printf "====================================================================\n\n"
virsh list --all

# dump the currently running set of iptables rules
printf "\n\n\n====================================================================\n"
printf "\tList iptables rules\n"
printf "====================================================================\n\n"
iptables -L


# showing the users set up on the machine
printf "\n\n\n====================================================================\n"
printf "\tList of users on the machine\n"
printf "====================================================================\n\n"
sort /etc/passwd | cut -d ':' -f 1

# show the routing table
printf "\n\n\n====================================================================\n"
printf "\tListing out the routing table\n"
printf "====================================================================\n\n"
route -n


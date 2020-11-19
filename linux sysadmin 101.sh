# Let's start saying that this is a compilation of commands that i used and learned.
# I use this in RHEL, CentOS and Fedora.

#-FILE SYSTEM HIERARCHY-#
/etc #Contains configuration files for programs and packages
    /etc/passwd #contains passwords and other information concerning users who are registered to use the system. For obvious security reasons, this is writable only by root and readble by others. It can be modified by root directly, but it is preferable to use a configuration utility such as passwd to make the changes. A corrupt /etc/passwd file can easily render a Linux box unusable.  
        
        1-Username: It is used when user logs in. It should be between 1 and 32 characters in length.
        2-Password: An x character indicates that encrypted password is stored in /etc/shadow file. Please note that you need to use the passwd command to computes the hash of a password typed at the CLI or to store/update the hash of the password in /etc/shadow file.
        3-User ID (UID): Each user must be assigned a user ID (UID). UID 0 (zero) is reserved for root and UIDs 1-99 are reserved for other predefined accounts. Further UID 100-999 are reserved by system for administrative and system accounts/groups.
        4-Group ID (GID): The primary group ID (stored in /etc/group file)
        5-User ID Info: The comment field. It allow you to add extra information about the users such as user’s full name, phone number etc. This field use by finger command.
        6-Home directory: The absolute path to the directory the user will be in when they log in. If this directory does not exists then users directory becomes /
        7-Command/shell: The absolute path of a command or shell (/bin/bash). Typically, this is a shell. Please note that it does not have to be a shell. For example, sysadmin can use the nologin shell, which acts as a replacement shell for the user accounts. If shell set to /sbin/nologin and the user tries to log in to the Linux system directly, the /sbin/nologin shell closes the connection.

    /etc/group #similar to /etc/passwd but for groups
    /etc/hosts #contains a list of host names and absolute IP addresses.
    /etc/resolv.conf #contains a list of domain name servers used by the local machine
    /etc/aliases #file containing aliases used by sendmail and other MTAs (mail transport agents).
    /etc/bashrc #system-wide default functions and aliases for the bash shell
    /etc/fstab #Information of Disk Drive and their mount point.
    /etc/conf.modules #aliases and options for configurable modules
    /etc/crontab #A shell script to run specified commands on a predefined time Interval.
    /etc/profile #Bash shell defaults
    /etc/profile.d #Application script, executed after login.
/var #Variable data specific to system. This data should not be removed or changed when the system reboots. Logs files tend to be stored within the /var directory
    /var/log/messages #general system messages/logs, includes most of what is in dmesg if it hasn’t “rolled over”.
    /var/log/dmesg  #boot time hardware detection and driver setup.
    /var/log/daemon.log #messages from service tasks like lircd
    /var/log/kern.log #if something has gone wrong with a kernel module, you may find something here.
/run #Runtime data for processes since last boot
/home #Location of home directories; used for storing personal documents and information on the system
/root #root user home directory
/tmp #Files are removed after ten days; universal read/write permissions
/boot #files needed to start the system boot process
/boot/vmlinuz #the typical location and name of the Linux kernel.
/dev #Contains information on essential devices
/dev/null #used when you want to send output into oblivion
/lib #Some shared library directories, files, and links
/mnt #The typical mount point for the user-mountable devices such as floppy drives and CDROM
/proc #Virtual file system that provides system statistics.  It doesn’t contain real files but provides an interface to runtime system information.
/sbin #Commands used by the super user for system administrative functions
/usr #Contains executable binaries, documentation, source code, libraries for second level program.
    /usr/bin #Contains commands available to normal users
    /usr/share #Contains shared directories for man files, info files, etc.
    /usr/lib #Library files searched by the linker when programs are compiled
    /usr/local/bin #Common executable application files local to this system
    /usr/sbin #Commands used by the super user for system administrative functions

#-USE SYSTEM DOCUMENTATION-#
info #Read information files; provides more information than man
whoami #print the name of the current user
which #Show full path of command; useful for scripting
whatis #Display manual page descriptions
locate #Locate files on system by name
uptime #shows since how long your system is running and the number of users are currently logged in and also displays load average for 1,5 and 15 minutes intervals.
W #It will displays users currently logged in and their process along-with shows load averages. also shows the login name, tty name, remote host, login time, idle time, JCPU, PCPU, command and processes.
updatedb #Update locate command databases
man #Documentation, 9 sections
    1 #Executable programs and shell commands
    2 #System calls
    3 #Library calls
    4 #Special files
    5 #File formats
    6 #Games
    7 #Miscellaneous
    8 #root user commands
    9 #Kernel routines

#-BOOT, REBOOT AND SHUTDOWN-#
-Reboot:
    reboot
    systemctl reboot
    shutdown -r now
-Shutdown:
    systemctl halt
    halt
    hutdown -h now
    init 0
-Power off:
    systemctl poweroff
    poweroff
    shutdown -P

#-CRONTAB-#
30 08 10 06 * /home/maverick/full-backup
•	Minute – A minute value can be between 0-59
•	Hour – A hour value can be between 0-23
•	Day_of_the_month – This value can between 1-31. For the months having less days will ignore remaining part
•	Month_of_the_year – This can be between 1-12. You can also define this value with first three alphebts of month like jan, feb, mar, apr etc.
•	Day_of_the_Week – This can be the value between 0-7. Where 0 and 7 for Sunday, 1 for Monday, 2 for Tuestday etc. You can also use first three alphabets of days like, sun, mon, tue, wed, etc.
•	command/script to execute

#-BASIC LINUX COMMANDS-#
#---->if you need to see the options remember to add -h or -help
pwd #Show current working directory path
cd  #Change directory
ls #List contents of directory
sudo #Allows a super user to run a command with root priviledges
mkdir #Create new directory
rmdir #Remove directory
rm -rf #Force remove a directory, recursively (includes all files inside)
touch #Create new, empty files
echo "test" > file.txt #Redirect standard output to file
echo "test" >> file.txt #Replaces file, if already exists
2> #Redirect standard error
2>> #Redirect and append standard error
/dev/null #Data sent to /dev/null is lost
2>&1 #Redirect STDEDD to STDOUT
less #File viewing application and STDOUT can often piped into for ease of reading
head #Show first ten lines of file, with -n  Define number of lines
tail #Show last ten lines of file, with -n • Define number of lines
su USER #switch to USER user (non-login shell)
su - USER #Login into a login shell
yum install PACKAGENAME
yum update PACKAGENAME
yum list kernel #list installed and available kernels
history #displays the summary of the commands


#-CREATION OF FILES AND FOLDERS-#
#---->if you need to see the options remember to add -h or -help
mkdir #Make directory
cp #Copy files and directories
mv #Move files and directories
rm #Remove files and directories
ln #Create links between files. Links directly to an inode to create a new entry referencing an existing file on the system
ln -s #Soft links that connects one file to another, symbolically

#-CHANGE PERMISSIONS-#
r/4 - read
w/2 - write
x/1 - execute

chmod #set the permissions for a file or directory
    -u #User
    -g #Group
    -o #Other
    -a #All
    -r #Read
    -w #Write
    -x #Execute
    -s #Set UID or GID
    -t #Set sticky bit
chown #Change owner and group permissions
    -R #Set ownership recursively
chgrp #Change group ownership
umask #Set default permissions for new directories and files

#-GREP AND REGULAR EXPRESSIONS-#
#---->if you need to see the options remember to add -h or -help
grep #Prints lines that match defined pattern
- grep "PATTERN" file.txt
#check this site for more info: 
#https://www.tecmint.com/12-practical-examples-of-linux-grep-command/

#-REMOTE ACCESS AND SWITCH USERS-#
sudo vim /etc/ssh/sshd_config #for the edition of the SSH config file
sudo ssh service <restart/start/stop> #restart, start or stop the service
ssh user@SERVER #Connect to remote host
ssh-keygen -t rsa #will generate a public/private rsa key pair
ssh-copy-id SERVER/HOST #To copy your key to a server
scp fileName user@SERVER:/home/username/destination #securely copy files over the SSH protocol using the SCP tool
ssh -D 8888 user@remoteserver # The ssh client can tunnel traffic over the connection using a SOCKS proxy server with a quick one liner. A key thing to understand is that traffic to the remote systems will have a source of the remote server.
ssh -v -R 0.0.0.0:1999:127.0.0.1:902 192.168.1.100 user@SERVER #SSH REVERSE TUNNEL - With this ssh session established a connection to the remoteserver port 1999 will be forwarded to port 902 on our local client
ssh -v -R 0.0.0.0:1999 192.168.1.100 user@SERVER #SSH REVERSE PROXY


#-COMPRESSION USING TAR,GZIP OR BZIP2-#
tar #Archive files; does not handle compression
    -c #Create new archive
    -t #List contents of archive
    -x #Extract files from archive
    -z #Compress or uncompress file in gzip
    -v #Verbose
    -j #Compress or uncompress file in bzip2
    -f #Read archive from or to file

star #Archiving utility generally used to archive large sets of data; includes pattern-matching and searching
    -c #Create archive file
    -v #Verbose output
    -n #Show results of running command, without executing the actions
    -t #List contents of file
    -x #Extract file
    --diff #Show difference between files
    -C #Change to specified directory
    -f #Specify file name

gzip #Compression utility used to reduce file sized; files are unavailable until unpacked; generally used with tar
    -d #Decompress files
    -l #List compression information

#-INTERRUPT BOOT PROCESS TO ACCESS TO THE SYSTEM-#
Start or reboot system
Stop Grub autoselection
Ensure the appropriate kernel is highlighted and press E to edit
Navigate to the linux16 line, press E
Add line rd.break
CTRL+X
System boots into emergency mode
Mount /sysroot with read and write permissions
»» mount -oremount, rw /sysroot
Switch into chroot jail:
»» chroot /sysroot
Reset root password
Clean up
»» touch /.autorelabel
exit

#-CPU/MEMORY COMMANDS-#
Ps #displays processes running in the system
Kill #terminate process
   pkill -9 -t [pts/tty#] #kill user session
•	TTY: tty stands for Teletypewriter. This is directly connected to the system as a keyboard/mouse or a serial connection to the device (for instance, the console on your system).
•	PTS: pts Stands for the pseudo terminal slave. It is a terminal device, which is emulated by another program (for instance, ssh session to your system).
top
    k #Kill process
    q #Quit
    r #Renice
    s #Change update rate
    P #Sort by CPU usage
    M #Sort by memory usage
    l #Toggle load average
    t #Toggle task display
    m #Toggle memory display
    B #Bold display
    u #Filter by username
    -b #Start in batch mode
    -n #Number of updates before exiting
pgrep #Search processes
    -u #Username
    -l #Display process name
    -t #Define tty ID
    -n #Sort by newest
pkill #Kill process
    -u #Kill process for defined user
    -t #Kill process for defined terminal

#-CREATE AND REMOVE PHYSICAL AND LOGICAL VOLUMES-#
pvcreate #Create physical volume
pvdisplay #Show available physical volumes
vgcreate name /dev/DISKS #Create volume group
vgdisplay #Show available volume groups
lvcreate #Create logical volume
    -n • Volume
    -L • Size in bytes
lvremove /dev/vg/VOLUME #Remove volume
pvremove /dev/DISK #Remove physical volume
#----->CONFIGURING SYSTEM TO MOUNT FILE SYSTEM AT BOOT
mkfs -t xfs /dev/xvdf1 #Make file system
blkid #List available block devices on system
lsblk #List all attached block devices
mount /dev/disk /mnt/mountlocation #Non-persistent mount
    -Mounting with the UUID ensures the appropriate mount is used
    -Add to /etc/fstab to mount persistently
tune2fs -L LABELMNAME /dev/disk #Mount with file system label (ext)
e2label /dev/disk LABELNAME #Mount with file system label (ext)
xfs_admin -L LABELNAME /dev/disk #Mount with file system label (XFS)
mount LABEL=LABELNAME /mnt/mountlocation defaults 1 1 #Mount with label, non-persistent; edit /etc/fstab for persistence
mount -a #Mount all file systems in /etc/fstab
umount -a #Unmount all file systems in /etc/fstab

#-ANALYSIS OF LOGS-#
•	Grep
#Using surround search returns a number of lines before or after a match. This provides context for each event by letting you trace the events that led up to or immediately followed the event. The -B flag specifies how many lines to return before the event, and the -A flag specifies the number of lines after.
#For example, let’s search for attempted logins with an invalid username and show the surrounding results. We see that users who fail to log in also fail the reverse mapping check. This means the client doesn’t have a valid reverse DNS record, which is common with public Internet connections. This doesn’t mean your SSH server is vulnerable, but it could mean attackers are actively trying to gain access to it.
#$ grep -B 3 -A 2 'Invalid user' /var/log/auth.log
#Apr 28 17:06:20 ip-172-31-11-241 sshd[12545]: reverse mapping checking getaddrinfo for 216-19-2-8.commspeed.net [216.19.2.8] failed - POSSIBLE BREAK-IN ATTEMPT!
#Apr 28 17:06:20 ip-172-31-11-241 sshd[12545]: Received disconnect from 216.19.2.8: 11: Bye Bye [preauth]
#pr 28 17:06:20 ip-172-31-11-241 sshd[12547]: Invalid user admin from 216.19.2.8
#pr 28 17:06:20 ip-172-31-11-241 sshd[12547]: input_userauth_request: invalid user admin [preauth]
#pr 28 17:06:20 ip-172-31-11-241 sshd[12547]: Received disconnect from 216.19.2.8: 11: Bye Bye [preauth]
•	Tail
#Tail is another command line tool that can display the latest changes from a file in real time. This is useful for monitoring ongoing processes, such as restarting a service or testing a code change. You can also use tail to print the last few lines of a file, or pair it with grep to filter the output from a log file.
#$ tail -f /var/log/auth.log | grep 'Invalid user'
#Apr 30 19:49:48 ip-172-31-11-241 sshd[6512]: Invalid user ubnt from 219.140.64.136
#pr 30 19:49:49 ip-172-31-11-241 sshd[6514]: Invalid user admin from 219.140.64.136
    -tail -n 15 #shows the last 15 lines
•	AWK
#awk works on programs that contain rules comprised of patterns and actions. The action is executed on the text that matches the pattern. Patterns are enclosed in curly braces ({}). Together, a pattern and an action form a rule. The entire awk program is enclosed in single quotes (').
#awk considers a field to be a string of characters surrounded by whitespace, the start of a line, or the end of a line. Fields are identified by a dollar sign ($) and a number. So, $1 represents the first field, which we’ll use with the print action to print the first field.
who | awk '{print $1,$4}'
•	$0: Represents the entire line of text.
•	$1: Represents the first field.
•	$2: Represents the second field.
•	$7: Represents the seventh field.
•	$45: Represents the 45th field.
•	$NF: Stands for “number of fields,” and represents the last field.
#Examples:
1) Amit     Physics   80
2) Rahul    Maths     90
3) Shyam    Biology   87
4) Kedar    English   85
5) Hari     History   89

awk '{print $3 "\t" $4}' marks.txt
Output
Physics   80
Maths     90
Biology   87


#-NETWORKING COMMANDS-#
/etc/sysconfig/network-scripts #is the location where all config files are located
ifconfig #this command is use to initialize an interface, assign IP Address to interface and enable or disable interface on demand. 
iwconfig #same that ifconfig but with wireless
ip addr #The ip command allows Linux users to quickly leverage the IP utility for manipulating the routing, devices, policy routing, and tunnels.
nslookup #obtain domain name or IP address mapping by querying the Domain Name System
         #"name server lookup", finds information about a named domain. We can also perform the above operation in reverse by providing the IP address rather than the domain name.
         #-type=ns/a/aaaa/mx/cname
wget #tool that allow to downloading contents from web servers.
dig #for query the DNS for network tshooting
whois #tool for obtaining both domain and IP related information about a network.
ping
traceroute
netstat
    -a #list all ports
    -at #list all TCP ports
    -au #list all UDP ports
    -l #list only listening ports
    -lt #list only TCP listening ports
    -lu #list only UDP listening ports
    -s #show statistics for all ports

#---> NETWORK MANAGER
nmcli con show #display lisy of connections
    --active #display only active connections
nmcli dev status #display the device status
nmcli con add con-name “nameofthecon” type Ethernet ifname eth0 #add a connection
    -- ifname is the name of the Ethernet device; can find them by doing ls /sys/class/net
nmcli con reload #after modifying a network connection you should reload the config.
nmcli dev disconnect "device" #turn off the network device
nmcli dev connect "device" #turn on the network device
systemctl start NetworkManager
systemctl enable NetworkManager
systemctl restart network


#-LOGICAL VOLUME MANAGER-#
yum install lvm2 #install LVM if not installed
pvcreate /dev/disk /dev/disk [disk-amount] #Create LVM physical volumes
pvdisplay #display all available physical volumes
vgcreate VGNAME /dev/disk /dev/disk #create a volume group. VGNAME is the name you assign to the volume group
vgdisplay #display all the available volume groups
lvcreate -n NameOfLVMVolume -L 20G VolumeGroupToUse #Create a logical volume:
    -L #size of the volume in bytes (use 1M, 1G, 20G, etc.)
    -l #size in physical extents; generally a physical extent is 4MiB in size
lvdisplay #Display view logical volumes:

#--->EXTENDING VOLUME GROUPS AND LOGICAL VOLUMES
1- Extend a volume group with a new disk:
    - pvcreate /dev/newdisk
    - vgextend vg-name /dev/newdisk
    - vgdisplay
2.1- Extend the LVM to be exactly XGBs in size:
    - lvextend -L XG /dev/vg-name/lvmname
2.2- Extend the LVM and add an additional 5G:
    - lvextend -L +5G /dev/vg-name/lvmname

#---> REMOVING LOGICAL AND PHYSICAL VOLUMES & VOLUME GROUPS
lvremove /dev/vg-name/volume #remove a logical volume
vggremove vg-name #Remove a volume group

#-IPTABLES-#
systemctl start iptables
systemctl stop iptables
systemctl restart iptables
iptables -L -n -v #check all IPTABLES firewall rules
iptables -A INPUT -s xxx.xxx.xxx.xxx -j DROP #block specific IP address in Iptables
iptables -D INPUT -s xxx.xxx.xxx.xxx -j DROP #unblock specific IP address in Iptables
iptables -A OUTPUT -p tcp --dport xxx -j DROP #block specific port
iptables -A INPUT -p tcp --dport xxx -j ACCEPT #allow specific port
#allow multiple ports on Iptables using Multiport
iptables -A INPUT  -p tcp -m multiport --dports 22,80,443 -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --sports 22,80,443 -j ACCEPT
#block a specific range of addresses based on a hostname
1- get the public IP address with the host command
host facebook.com 
-->facebook.com has address 66.220.156.68
2- get the CIDR bassed in the public address
whois 66.220.156.68 | grep CIDR
-->CIDR: 66.220.144.0/20
3- create the rules
iptables -A OUTPUT -p tcp -d 66.220.144.0/20 -j DROP


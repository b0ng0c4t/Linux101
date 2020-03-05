# Let's start saying that this is a compilation of commands that i used and learned.
# I use this in RHEL, CentOS and Fedora.

#-FILE SYSTEM HIERARCHY-#
/etc #Contains configuration files for programs and packages
    /etc/passwd #contains passwords and other information concerning users who are registered to use the system. For obvious security reasons, this is writable only by root and readble by others. It can be modified by root directly, but it is preferable to use a configuration utility such as passwd to make the changes. A corrupt /etc/passwd file can easily render a Linux box unusable.
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
which #Show full path of command; useful for scripting
whatis #Display manual page descriptions
locate #Locate files on system by name
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

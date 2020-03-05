# Let's start saying that this is a compilation of commands that i used and learned.
# I use this in RHEL, CentOS and Fedora.

#-FILE SYSTEM HIERARCHY-#
/etc #Contains configuration files for programs and packages
/var #Variable data specific to system. This data should not be removed or changed when the system reboots. Logs files tend to be stored within the /var directory
/run #Runtime data for processes since last boot
/home #Location of home directories; used for storing personal documents and information on the system
/root #root user home directory
/tmp #Files are removed after ten days; universal read/write permissions
/boot #files needed to start the system boot process
/dev #Contains information on essential devices



#-BASIC LINUX COMMANDS-#
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


#how do you change the default editor that the system opens the file with to nano?
The system will use the editor defined in your EDITOR environment variable and can be set by; 
export EDITOR=nano

#While using X, you encounter issues and cannot quit the X server, how can you force it to restart?
Linux has a solution for restarting X server with the combination of Alt-Ctrl-Backspace which will force X Restart.

#What does an open mail relay server mean?
An Open mail relay server, means that this is a server that everyone can send emails through it without the need to identify first or be a part of the domain group.

#You want to find all of the “.tmp” files in /home/* and delete them, how can you do it in a command?
find /home/ -name ‘*.tmp’ | xargs rm –rf.

#How do you get additional information about a command?
using man or info

#You are running a crontab command and doesn’t want the command to send an output to the crontab service, how can you handle it?
commandName 2>&1 >/dev/null

#how to identify what is the path of a process of an application with PID XXXXX?
pwdx XXXXX

#how to record a commands and outputs for a later review?
script -a mysession.log

#You have 100 .txt files and want to know in which ones you have a string with "Error"
grep "Error" *.txt

#Given the directory “myImportantFiles” how can you create a tar file “myImportantTar.tar” 
#containing this folder?
tar -cf myImportantTar.tar myImportantFiles.

#check the Kernel Version currently loaded to the system?
uname -rsv

#How do you make sure that your computer date & time are always aligned?
ntpd
ntptime ntpserver.com

#how do you convert it to a gzip file on best compression?
gzip -9 myFile.tar

#You have a file that you want to randomize its lines and create
#permutations of it for distinctive file list, how can you create a
#permutation of the file “myfile” into “mynewfile”?
shuf myfile > mynewfile

#how can you verify that the file has not been corrupted?
md5sum

#How would you copy the file “file.txt” owned by root using
#secure ftp from 10.1.1.1 on /root/ to your local folder in one command?
scp root@10.1.1.1:/root/file.txt ./

#How will you change all the ownership of /home/user1 to user2 (recursively)?
chown user2:user2 /home/user1 –R.

#How can you check what processes a specified user (tom) is currently running?
ps -U tom

#How would you see the contents of a gzip compressed contents without 
#decompressing it first?
zcat FILENAME.gzip

#get a brief explanation about a command?
whatis command

#How can you search for the word “FindMe” in all of the “.txt” files 
#in the current directory, recursively?
Find . -name "*.txt" | xargs grep "FindMe"

#How can you send a message “Hello everyone” to everyone who is currently 
#connected to the system?
wall Hello everyone

#Create a crontab that will run once a day at 3am and write
#the output of ls into /tmp/ls_result (truncate the file) ?
a) Edit crontab: crontab -e
b) Add crontab line: 0 3 * * * /bin/ls > /tmp/ls_result
c) Save crontab.
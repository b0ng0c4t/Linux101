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

#how to identify a process of an application with PID XXXXX?
pwdx XXXXX

#how to record a commands and outputs for a later review?
script -a mysession.log

#You have 100 .txt files and want to know in which ones you have a string with "Error"
grep "Error" *.txt
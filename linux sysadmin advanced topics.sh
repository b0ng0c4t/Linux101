#-NETWORKING COMMANDS-#
/etc/sysconfig/network-scripts #is the location where all config files are located
ifconfig #this command is use to initialize an interface, assign IP Address to interface and enable or disable interface on demand. 
iwconfig #same that ifconfig but with wireless
ip addr #The ip command allows Linux users to quickly leverage the IP utility for manipulating the routing, devices, policy routing, and tunnels.
nslookup #obtain domain name or IP address mapping by querying the Domain Name System
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


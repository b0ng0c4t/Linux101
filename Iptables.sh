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
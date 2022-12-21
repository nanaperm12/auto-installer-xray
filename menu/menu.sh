#!/bin/bash
MYIP=$(curl -sS ipv4.icanhazip.com)
echo "Checking VPS"
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/firdaus-rx/akses-xray/main/allow/ip | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Facebook : https://m.facebook.com/firdaus2212"
echo -e "${NC}${LIGHT}WhatsApp : 081324336437"
echo -e "${NC}${LIGHT}Telegram : https://t.me/firdaus_rx"
exit 0
fi

#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear 
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green     XRAY INSTALLER BY FIRDAUS     $NC"
echo -e "$green   Contact admin t.me/firdaus_rx     $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "                                                                                         "
echo -e "\e[33m Operating System     \e[0m:  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`	
echo -e "\e[33m Total Amount Of RAM  \e[0m:  $tram MB"
echo -e "\e[33m System Uptime        \e[0m:  $uptime "
echo -e "\e[33m Isp Name             \e[0m:  $ISP"
echo -e "\e[33m Domain               \e[0m:  $domain"	
echo -e "\e[33m Ip Vps               \e[0m:  $IPVPS"	
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green            MENU XRAY               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e " [\e[36m•1\e[0m] Create Account XRAY Vmess Websocket"
echo -e " [\e[36m•2\e[0m] Create Account XRAY Vless Websocket "
echo -e " [\e[36m•3\e[0m] Create Account Trojan "
echo -e " [\e[36m•4\e[0m] Create Account Shadowshocks GFW "
echo -e " [\e[36m•5\e[0m] Create Account SS WS/GRPC "

echo -e " [\e[36m•6\e[0m] Delete Account XRAY Vmess Websocket "
echo -e " [\e[36m•7\e[0m] Delete Account XRAY Vless Websocket "
echo -e " [\e[36m•8\e[0m] Delete Account Trojan & Trojan GFW "
echo -e " [\e[36m•9\e[0m] Delete Account SS WS/GRPC "


echo -e " [\e[36m•10\e[0m] Extending Account XRAY Vmess Active Life "
echo -e " [\e[36m•11\e[0m] Extending Account XRAY Vless Active Life "
echo -e " [\e[36m•12\e[0m] Extending Account Trojan Active Life "
echo -e " [\e[36m•13\e[0m] Extending Account SS WS/GRPC Active Life "


echo -e " [\e[36m•14\e[0m] Check User Login XRAY Vmess "
echo -e " [\e[36m•15\e[0m] Check User Login XRAY Vless "
echo -e " [\e[36m•16\e[0m] Check User Login Trojan "

echo -e " [\e[36m•17\e[0m] Change Domain & Certfix "

echo -e " [\e[36m•18\e[0m] Restart All Services Xray "
echo -e " [\e[36m•19\e[0m] Speedtest VPS "
echo -e " [\e[36m•20\e[0m] Status Service"

echo -e   ""
echo -e   " Press x or [ Ctrl+C ] • To-Exit-Script"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green           XRAY MENU               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; add-ws  ;;
2) clear ; add-vless  ;;
3) clear ; add-tr ;;
4) clear ; add-ssws ;;
5) clear ; add-trgfw ;;

6) clear ; del-ws ;;
7) clear ; del-vless ;;
8) clear ; del-tr ;;
9) clear ; del-ssws ;;

10) clear ; renew-ws ;;
11) clear ; renew-vless ;;
12) clear ; renew-tr ;;
13) clear ; renew-ssws ;;

14) clear ; cek-ws ; exit ;;
15) clear ; cek-vless ; exit ;;
16) clear ; cek-tr ;;

17) clear ; add-host ;;

18)
clear
echo -e ""
echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
sleep 1
/etc/init.d/dropbear restart
/etc/init.d/stunnel4 restart
/etc/init.d/fail2ban restart
/etc/init.d/cron restart
/etc/init.d/nginx restart
/etc/init.d/squid restart
echo -e "[ \033[32mok\033[0m ] Restarting xray Service (via systemctl) "
sleep 0.5
systemctl restart xray
systemctl restart xray.service
echo -e "[ \033[32mok\033[0m ] Restarting badvpn Service (via systemctl) "
sleep 0.5
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
sleep 0.5
echo -e "[ \033[32mok\033[0m ] Restarting websocket Service (via systemctl) "
sleep 0.5
systemctl restart sshws.service
systemctl restart ws-dropbear.service
systemctl restart ws-stunnel.service
sleep 0.5
echo -e "[ \033[32mok\033[0m ] Restarting Trojan Go Service (via systemctl) "
sleep 0.5
systemctl restart trojan-go.service 
sleep 0.5
echo -e "[ \033[32mInfo\033[0m ] ALL Service Restarted"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on system menu"
menu
;;

19) clear ; speedtest ; exit ;;

20) clear ; running ;;

x) exit ;;
esac

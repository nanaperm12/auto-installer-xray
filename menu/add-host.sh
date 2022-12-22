#!/bin/bash

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
clear

cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`

clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Domain/Host: " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
menu
else
echo "IP=$host" > /var/lib/SIJA/ipvps.conf
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Renew Cert              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 1
wget https://raw.githubusercontent.com/firdaus-rx/auto-installer-xray/main/menu/certv2ray.sh && chmod +x certv2ray.sh && ./certv2ray.sh

echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi

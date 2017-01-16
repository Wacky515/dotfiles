#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

PROCESS="input IP addr"

ym_echo "${PROCESS^}"

read ipaddr
result_echo $? "fixed ip addr"

ym_echo ">> Input routers"
read rout
result_echo $? "setting routers"

ym_echo ">> Input DNS"
read dns
result_echo $? "input DNS"

# cat << EOS >> test_ip_addr.txt
# "Directory nonexistent" になる -> DONEのはず
cat << EOS >> /etc/dhcpcd.conf
interface eth0
static ip_address=$ipaddr/24
static routers=$rout
static domain_name_servers=$dns
EOS
result_echo $? $PROCESS

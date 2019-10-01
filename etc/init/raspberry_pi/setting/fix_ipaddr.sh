#!/bin/bash
# @(#) Fix IP addr

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="fixed IP addr"

ym_echo ">> ${PROCESS^}"

ym_echo ">> Input IP addr"
read ipaddr
result_echo $? "input ip addr"

ym_echo ">> Input routers"
read rout
result_echo $? "input routers"

ym_echo ">> Input DNS"
read dns
result_echo $? "input DNS"

cat << EOS >> /etc/dhcpcd.conf
interface eth0
static ip_address=${ipaddr}/24
static routers=${rout}
static domain_name_servers=${dns}

interface wlan0
static ip_address=${ipaddr}/24
static routers=${rout}
static domain_name_servers=${dns}
EOS
result_echo $? "${PROCESS}"

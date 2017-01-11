#!/bin/sh
echo "Input IP addr"
read ipaddr
echo "Fixed IP addr $ipaddr"
echo ""

echo "Input routers"
read rout
echo "Routers: $rout"
echo ""

echo "Input DNS"
read dns
echo "DNS: $dns"
echo ""

cat << EOS >> etc/dhcpcd.conf
# cat << EOS >> test_ip_addr.txt
interface eth0
static ip_address=$ipaddr/24
static routers=$rout
static domain_name_servers=$dns
EOS

#!/bin/bash
echo ">> Input IP addr"
read ipaddr

if [ "$?" -eq 0 ]
then
    echo ">> Fixed IP addr $ipaddr"
else
    echo ">> Fail fixed IP addr"
fi

echo ">> Input routers"
read rout

if [ "$?" -eq 0 ]
then
    echo ">> Routers: $rout"
else
    echo ">> Fail setting routers"
fi

echo ">> Input DNS"
read dns

if [ "$?" -eq 0 ]
then
    echo ">> DNS: $dns"
else
    echo ">> Fail setting DNS"
fi

# cat << EOS >> test_ip_addr.txt
# "Directory nonexistent" になる
cat << EOS >> /etc/dhcpcd.conf
interface eth0
static ip_address=$ipaddr/24
static routers=$rout
static domain_name_servers=$dns
EOS

if [ "$?" -eq 0 ]
then
    echo ">> Success fixed IP addr"
else
    echo ">> Fail fixed IP addr"
fi

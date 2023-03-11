rem for /l %i in (0,1,255) do ping -w 1 -n 1 172.21.118.%i && arp -a 172.21.118.%i >> arp.log
for /l %i in (0,1,255) do ping -w 1 -n 1 172.21.118.%i && arp -a 172.21.118.%i > arp.log

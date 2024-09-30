mv /etc/3gnet /etc/ppp/peers
#sleep 5
#/usr/bin/sscom&
sleep 10
wvdial&
sleep 10
echo "nameserver 114.114.114.114" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
sleep 90
route_rule

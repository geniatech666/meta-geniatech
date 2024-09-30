eth_up=`ethtool eth1 |grep detected |awk '{print $3}'`
str_up="yes"
str_down="no"
eth_ip=`ifconfig eth1|grep inet|grep -c inet`
eth_route=`ip route | /bin/grep eth1 | grep scope |awk '{print $1}'`

dns_on=$(/bin/grep -c nameserver /etc/resolv.conf)

ppp_ip=`ifconfig ppp0|grep inet|grep -c inet`
ppp_route=`ip route |grep default |grep ppp0 |grep -c metric`

if [ ${eth_up} = ${str_down} ] && [ $eth_ip -ge 1 ]; then
	#route delete default dev eth0
	#ip route del ${eth_route}
	/etc/init.d/networking restart
fi

if [ ${eth_up} = ${str_up} ] && [ $eth_ip -lt 1 ]; then
        #route delete default dev eth0
        #ip route del ${eth_route}
        /etc/init.d/networking restart
	udhcpc -i eth1
fi

if [ ${eth_up} = ${str_up} ] && [ $eth_ip -lt 1 ]; then
	udhcpc -i eth1
fi

if [ ${ppp_route} -lt 1 ] && [ $ppp_ip -ge 1 ]; then
	route delete default ppp0
	route add default dev ppp0 metric 300
fi

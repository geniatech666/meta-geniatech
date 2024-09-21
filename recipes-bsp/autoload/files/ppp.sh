eth_up=`ethtool eth0 |grep detected |awk '{print $3}'`
str_up="yes"
str_down="no"
eth_ip=`ifconfig eth0|grep inet|grep -c inet`
eth_route=`ip route | /bin/grep eth0 | grep scope |awk '{print $1}'`

dns_on=$(/bin/grep -c nameserver /etc/resolv.conf)

mlan_ip=`ifconfig mlan0|grep inet|grep -c inet`

if [ ${eth_up} = ${str_down} ] && [ $eth_ip -ge 1 ]; then
	#route delete default dev eth0
	#ip route del ${eth_route}
	/etc/init.d/networking restart
fi

if [ ${eth_up} = ${str_up} ] && [ $eth_ip -lt 1 ]; then
        #route delete default dev eth0
        #ip route del ${eth_route}
        /etc/init.d/networking restart
	udhcpc -i eth0
fi

if [ ${eth_up} = ${str_up} ] && [ $eth_ip -lt 1 ]; then
	udhcpc -i eth0
fi

if [ ${dns_on} -lt 1 ] && [ $mlan_ip -ge 1 ]; then
	udhcpc -i mlan0	
fi

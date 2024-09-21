ppp_on=$(/sbin/ifconfig | /bin/grep -c ppp0)

crontab /etc/crontab
sda6=`lsblk |grep sda6`
if [ -n "$sda6" ]; then
    echo "sda6 is not empty"
    umount /oem
    umount /userdata
    mount /dev/sda7 /oem
    mount /dev/sda8 /userdata
else
    echo "sda6 is empty"
fi

export DISPLAY=:0
su -c "xrandr --output HDMI-1 --mode 1920x1080"

if [ $ppp_on -eq 1 ];then 
	ifconfig eth1 up
	udhcpc -i eth1
fi


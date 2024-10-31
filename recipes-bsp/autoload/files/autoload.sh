eth1=$(ifconfig -a | /bin/grep -c eth1)

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
su -c "xrandr --output DSI-1 --primary --mode 1280x800"
su -c "xrandr --output HDMI-1 --mode 1920x1080"


if [ $eth1 -eq 1 ];then 
	ifconfig eth1 up
	#udhcpc -i eth1
fi
sleep 4
hciconfig hci0 up &

amixer cset name='Playback Path' 3 -c 0 &

echo "nameserver 114.114.114.114" >/etc/resolv.conf
echo "nameserver 8.8.8.8" >/etc/resolv.conf
#echo host >/sys/devices/platform/fe8a0000.usb2-phy/otg_mode &

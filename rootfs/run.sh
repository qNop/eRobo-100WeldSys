#!/bin/sh
echo "Please enter cmd you want，load is to run app ， file is to operation 。"

read cmd

case  "$cmd" in
	load)
	if [ -e /Nop/eRobo-100WeldSys ]
	then
		echo "rm /Nop/eRobo-100WeldSys"
		rm /Nop/eRobo-100WeldSys
		#复制debug文件到 /Nop
		cp /mnt/eRobo-100WeldSys/debug/eRobo-100WeldSys /Nop
	else
		echo "creator /Nop."
		cp -R /mnt/eRobo-100WeldSys/debug /Nop
		#输出dbus机器ID
		echo "gen dbus machine id"
		dbus-uuidgen >/usr/var/lib/dbus/machine-id
		#支持中文字体
		#echo "use zhonghejian"
		#cp /mnt/zhonghejian.ttf /usr/share/fonts/turetype	
	fi
	if [ ! -e /Nop/leds ]
	then 
		#leds QTshell
		echo "cp leds to Nop"
		cp /mnt/rootfs/leds /Nop
	fi

	echo "loading ..." 
	cd /Nop
	./eRobo-100WeldSys
	;;
	file)
	./eRobo-100WeldSys/rootfs/rootfscmd.sh
	;;
	*)
	echo "cmd is not supported"
	;;
esac


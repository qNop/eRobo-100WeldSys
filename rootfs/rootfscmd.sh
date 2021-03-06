#!/bin/sh

echo "This shell is used to Copy or Send Rootfs files ." 
echo "please enter the command Copy or Send."
#读取输入命令
read cmd 
#读取命令文件
echo "please enter the Dir Material、Rootfs、Keyboard."
read filename
case  "$cmd" in
#复制命令
	Copy)
	case "$filename" in
		Rootfs)
		if [ ! -e /mnt/eRobo-100WeldSys/rootfs/etc/rc.d/init.d ]
		then
			mkdir -p /mnt/eRobo-100WeldSys/rootfs/etc/rc.d/init.d
		fi
		echo "Copy profile from /etc to /mnt/eRobo-100WeldSys/rootfs/etc"
		cp -P /etc/profile /mnt/eRobo-100WeldSys/rootfs/etc
		echo "Copy inittab from /etc to /mnt/eRobo-100WeldSys/rootfs/etc"
		cp -P /etc/inittab /mnt/eRobo-100WeldSys/rootfs/etc
		echo "Copy rc.conf from /etc/rc.d to /mnt/eRobo-100WeldSys/rootfs/etc/rc.d"
		cp -P /etc/rc.d/rc.conf /mnt/eRobo-100WeldSys/rootfs/etc/rc.d
		echo "Copy ethcfg from /etc/rc.d/init.d to /mnt/eRobo-100WeldSys/rootfs/etc/rc.d/init.d"
		cp -P /etc/rc.d/init.d/ethcfg /mnt/eRobo-100WeldSys/rootfs/etc/rc.d/init.d
		echo "Copy qtexport from /etc/rc.d/init.d to /mnt/eRobo-100WeldSys/rootfs/etc/rc.d/init.d"
		cp -P /etc/rc.d/init.d/qtexport /mnt/eRobo-100WeldSys/rootfs/etc/rc.d/init.d
		echo "Copy files ok ."
		chmod -R 777 /mnt/eRobo-100WeldSys/rootfs/etc
		;;
		Material)
		if [ ! -e /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/qml ]
		then
			mkdir -p /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/qml/Material
			mkdir -p /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/qml/QtQuick/Controls/Styles/Material
		fi
		for file in $(ls /opt/Qt5/qml/Material)
		do
			if  [ $file != "fonts" -a $file != "icons" ]
			then 
				echo "Copy "$file" to /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/qml/Material"
				if [ $file != "ListItems" -a $file != "Extras" ]
				then
					cp -P /opt/Qt5/qml/Material/$file /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/qml/Material
				else
					cp -R /opt/Qt5/qml/Material/$file /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/qml/Material
				fi				
			fi
		done
		for file in $(ls /opt/Qt5/qml/QtQuick/Controls/Styles/Material)
		do
			echo "Copy" $file "to /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/qml/QtQuick/Controls/Styles/Material"
			cp -P /opt/Qt5/qml/QtQuick/Controls/Styles/Material/$file /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/qml/QtQuick/Controls/Styles/Material
		done
		chmod -R 777 /mnt/eRobo-100WeldSys/rootfs/opt		
		;;
		*)
		echo "filesname is not found ."
		;;
	esac
;;
#发送命令
	Send)
	case "$filename" in
		Rootfs)
		if [ -e /mnt/eRobo-100WeldSys/rootfs/etc/profile ]
		then
			echo "Send profile"
			cp /mnt/eRobo-100WeldSys/rootfs/etc/profile /etc
			echo "ok"
	
		else
			echo "profile Send fail . because files is not exist ."
		fi

		if [ -e /mnt/eRobo-100WeldSys/rootfs/etc/inittab ]
		then
			echo "Send inittab"
			cp /mnt/eRobo-100WeldSys/rootfs/etc/inittab /etc
			echo "ok ."
		else
			echo "inittab Send fail . because inittab is not exist ."
		fi
		if [ -e /mnt/eRobo-100WeldSys/rootfs/etc/rc.d/rc.conf ]
		then
			echo "Send rc.conf"
			cp /mnt/eRobo-100WeldSys/rootfs/etc/rc.d/rc.conf /etc/rc.d
			echo "ok ."
		else
			echo "rc.conf Send fail . because rc.conf is not exist ."
		fi
		if [ -e /mnt/eRobo-100WeldSys/rootfs/etc/rc.d/init.d/ethcfg ]
		then
			echo "Send ethcfg"
			cp /mnt/eRobo-100WeldSys/rootfs/etc/rc.d/init.d/ethcfg /etc/rc.d
			echo "ok ."
		else
			echo "ethcfg Send fail . because ethcfg is not exist ."
		fi
		if [ -e /mnt/eRobo-100WeldSys/rootfs/etc/rc.d/init.d/qtexport ]
		then
			echo "Send qtexport"
			cp /mnt/eRobo-100WeldSys/rootfs/etc/rc.d/init.d/qtexport /etc/rc.d
			echo "ok ."
		else
			echo "qtexport Send fail . because qtexport is not exist ."
		fi
		;;
		Material)
		if [ -e /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/qml/Material ]
		then
			echo "Send Material to /opt/Qt5/qml"
			cp -R -v /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/qml/Material /opt/Qt5/qml
		else
			echo "Material is not found"
		fi
		if [ -e /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/qml/QtQuick/Controls/Styles/Material ]
		then
			echo "Send Styles to /opt/Qt5/qml/QtQuick/Controls/Styles"
			cp -R -v /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/qml/QtQuick/Controls/Styles/Material /opt/Qt5/qml/QtQuick/Controls/Styles	
		else
			echo "Styles is not found"
		fi		
		;;
		Keyboard)
		if [ -e /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/plugins/platforminputcontexts/libVirtualKeyboard.so ]
		then
			echo "Send libVirtualKeyboard.so to /opt/Qt5/plugins/platforminputcontexts"
			cp -R /mnt/eRobo-100WeldSys/rootfs/opt/Qt5/plugins/platforminputcontexts /opt/Qt5/plugins/
		else	
			echo "libVirtualKeyboard.so is not found"
		fi
		;;
		*)
			echo "filesname is not found ."
		;;
	esac
;;
#命令不存在
	*)
	echo "cmd is not found ."	
esac

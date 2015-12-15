#!/bin/sh
cd /etc
echo "rm profile rc.d/init.d/qtexport rc.d/init.d/ethcfg inittab rc.d/rc.conf "
rm profile rc.d/init.d/qtexport rc.d/init.d/ethcfg inittab rc.d/rc.conf
echo "cp profile qtexport ethcfg inittab rc.conf"
cd /mnt/rootfs 

cp  qtexport /etc/rc.d/init.d/
cp  ethcfg /etc/rc.d/init.d/
cp  profile /etc/ 
cp  inittab /etc/
cp  rc.conf /etc/rc.d/
#是否存在truetype文件 否 复制该字体到 该文件下
if [ -e /usr/share/fonts/truetype ] 
then
   echo "cp zhonghejian.ttf to dir /usr/share/fonts/truetype"
   cp zhonghejian.ttf /usr/share/fonts/truetype
fi
#是否存在/Nop文件夹
if [ -e /Nop ]
then
   echo "创建/Nop 并复制leds shell"
   mkdir /Nop
   cp leds /Nop
   cp backlight /Nop
fi

#!/bin/sh

dirname=$(cd `dirname $0`; pwd)
echo $dirname
target=appName # 你的app 名字
builtdir=$dirname/deploy
ProductName=$2
 
echo "deb package..."
target_name=${ProductName}_arm64.deb
version=1.0.0
if [ -n "$1" ];then
	target_name=${ProductName}_$1_arm64.deb
	echo "target_name" $target_name
 	version=$1
fi
 
#设置信息
sed -i "s/&version/$1/" $dirname/debPackage/DEBIAN/control
sed -i "s/&version/$1/" $dirname/debPackage/DEBIAN/postinst
sed -i "s/&version/$1/" $dirname/deploy/${ProductName}/${ProductName}.desktop
 
 
sed -i "s/&project_name/$4/" $dirname/deploy/${ProductName}/${ProductName}.desktop
sed -i "s/&package_name/$3/" $dirname/debPackage/DEBIAN/control
 
sed -i "s/&product_name/$2/" $dirname/debPackage/DEBIAN/control
sed -i "s/&product_name/$2/" $dirname/deploy/${ProductName}/${ProductName}.desktop
sed -i "s/&product_name/$2/" $dirname/debPackage/DEBIAN/postinst
sed -i "s/&product_name/$2/" $dirname/debPackage/DEBIAN/preinst
sed -i "s/&product_name/$2/" $dirname/deploy/${ProductName}/${ProductName}.desktop
sed -i "s/&project_name/$4/" $dirname/debPackage/DEBIAN/postinst
 
#给下列文件增加执行权限
chmod +x $dirname/deploy/${ProductName}/$target $dirname/deploy/${ProductName}/runApp.sh $dirname/deploy/${ProductName}/${ProductName}.desktop $dirname/debPackage/usr/bin/$target
 
 
echo "calculate package size..."
deploySize=$(du -s $dirname/deploy/$ProductName)
packSize="`echo $deploySize | cut -d ' ' -f 1`"
sed -i "s/&size/$packSize/" $dirname/debPackage/DEBIAN/control
 
cd $dirname
dpkg -b debPackage $target_name
 
# clean temp folder
rm -rf $builtdir/${ProductName}/

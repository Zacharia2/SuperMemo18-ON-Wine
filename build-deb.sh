#!/bin/sh
# 暂时不可以用。没写自动化构建脚本。

version=1.1.0
product_name=yourapp_name
project_name=yourproduct_name
package_name=yourpackage_name
export build_version=$version.$BUILD_NUMBER
export target_name=${product_name}_${build_version}_arm64.deb
export build_target=$WORKSPACE/${target_name}
 
cd $WORKSPACE
 
chmod +x deploy.sh
chmod +x debPackage/DEBIAN/postinst debPackage/DEBIAN/postrm debPackage/DEBIAN/prerm debPackage/DEBIAN/preinst
./deploy.sh $build_version $product_name $package_name $project_name

#!/bin/sh

u-name=`eval echo $(who | grep "(:0)" | awk '{print $1}')`
current-dir=`eval echo "/home/"${u-name}"/桌面/SuperMemo卡组与资料库/"`

# 创建父目录
mkdir -p /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_c/SuperMemo/SuperMemo资料库
mkdir -p $current-dir
# 给予SuperMemo资料库所有用户读写权限
sudo chmod a+rw /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_c/SuperMemo/SuperMemo资料库
sudo chmod a+rw $current-dir

# 添加C盘、D盘、E盘卡包文件夹与资料库，应放到明显的位置打开。
ln -s /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_c/SuperMemo/systems ${current-dir}"SuperMemo_C盘卡组"
ln -s /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_d/ ${current-dir}"SuperMemo_D盘卡组"
ln -s /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_e/ ${current-dir}"SuperMemo_E盘卡组"
ln -s /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_c/SuperMemo/SuperMemo资料库 ${current-dir}"SuperMemo_C盘资料库"

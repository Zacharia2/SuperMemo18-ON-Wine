#!/bin/sh

sname=`eval echo $(who | grep "(:0)" | awk '{print $1}')`
scurrent=`eval echo "/home/"${sname}"/桌面/SuperMemo卡组与资料库/"`

# 创建父目录
mkdir -p /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_c/SuperMemo/SuperMemo资料库
mkdir -p $scurrent
# 给予SuperMemo资料库所有用户读写权限
sudo chmod a+rw /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_c/SuperMemo/SuperMemo资料库
sudo chmod a+rw $scurrent

# 添加C盘、D盘、E盘卡包文件夹与资料库，应放到明显的位置打开。
ln -s /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_c/SuperMemo/systems ${scurrent}"SuperMemo_C盘卡组"
ln -s /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_d/ ${scurrent}"SuperMemo_D盘卡组"
ln -s /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_e/ ${scurrent}"SuperMemo_E盘卡组"
ln -s /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_c/SuperMemo/SuperMemo资料库 ${scurrent}"SuperMemo_C盘资料库"

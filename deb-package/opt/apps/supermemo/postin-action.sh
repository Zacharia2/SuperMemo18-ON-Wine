#!/bin/sh

curent=`eval echo "/home/"${LOGNAME}"/桌面/SuperMemo卡组与资料库/"`

# 创建父目录
mkdir -p /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_c/SuperMemo/SuperMemo资料库
mkdir -p $curent
# 给予SuperMemo资料库所有用户读写权限
sudo chmod a+rw /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_c/SuperMemo/SuperMemo资料库
sudo chmod a+rw $curent

# 添加C盘、D盘、E盘卡包文件夹与资料库，应放到明显的位置打开。
ln -s /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_c/SuperMemo/systems ${curent}"SuperMemo_C盘卡组"
ln -s /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_d/ ${curent}"SuperMemo_D盘卡组"
ln -s /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_e/ ${curent}"SuperMemo_E盘卡组"
ln -s /opt/apps/supermemo/SM18.05-WINE-Vessel/drive_c/SuperMemo/SuperMemo资料库 ${curent}"SuperMemo_C盘资料库"
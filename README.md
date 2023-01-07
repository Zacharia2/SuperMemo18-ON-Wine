# SuperMemo18.05-WINE32

<img src="https://github.com/Zacharia2/SuperMemo18-ON-Wine/blob/main/docs/images/%E9%A2%84%E8%A7%88%E5%9B%BE%EF%BC%9ASM18.05-WINE32.png" style="width:60%">


## 安装步骤：

如果想最快上手(无需手动配置)

Debian / Ubuntu

```bash
wget https://github.com/Zacharia2/SuperMemo18-ON-Wine/releases/download/v1.4.0/SuperMemo18.05-lazy-wine32-package.v1.4.0.deb \
&& sudo apt install ./SuperMemo18.05-lazy-wine32-package.v1.4.0.deb
```

Arch / Manjaro

```bash
mkdir -p /tmp/sm18
cd /tmp/sm18
wget https://raw.githubusercontent.com/Zacharia2/SuperMemo18-ON-Wine/main/PKGBUILD
makepkg -i
```

## 文件说明

- [SM18.05-WINE-Vessel文件夹](https://github.com/Zacharia2/SuperMemo18-ON-Wine/blob/main/SM18.05-WINE-Vessel/)
  - SuperMemo容器环境（仅含Supermemo软件的bin配置目录，请不要覆盖此文件夹（SuperMemo/bin）中的配置文件），分离软件用于保持环境整洁。
- [SM18.05-WINE-Vessel/README.md](https://github.com/Zacharia2/SuperMemo18-ON-Wine/blob/main/SM18.05-WINE-Vessel/README.md)
  - SuperMemo容器环境使用教程。（仅限Linux）
- [docs/Instal-and-Package.md](https://github.com/Zacharia2/SuperMemo18-ON-Wine/blob/main/docs/Instal-and-Package.md)
  - Linux系统中从零开始安装supermemo、与封装deb安装包的流程、知识及注意事项。
- Wrap-DEB文件夹
  - 构建DEB安装包的配置文件，需要SM18.05-WINE-Vessel文件夹、以及SuperMemo懒人包。
- config/winetricks-cache
  - winetricks（wine工具）安装supermemo的缓存依赖文件。用于跳过网络下载，加快安装速度。
- config/supermemo18.verb
  - winetricks（wine工具）的 supermemo 安装自动化配置文件。
- config/SuperMemo18.desktop
  - SuperMemo快速启动的桌面图标。（打包时可以用）
- config/wine-sm18.05-winecfg.desktop
  - SuperMemo快速启动wine容器配置的桌面图标。（打包时可以用）



## SuperMemo18.05-lazy-wine32-package.v1.4.0.deb

安装: `sudo dpkg -i SuperMemo18.05-lazy-wine32-package.v1.4.0.deb`

卸载: `sudo dpkg -r supermemo18.05-wine32`

封装: `sudo dpkg -b Wrap-DEB SuperMemo18.05-lazy-wine32-package.v1.4.0.deb`

SuperMemo卡组与资料库软链接文件夹位置：`/home/SuperMemo卡组与资料库/` 。你可以通过此链接文件夹快速交换资料。删除链接文件夹不会删除原文件。

运行软件请使用开始菜单中的启动器文件: SuperMemo18.desktop。配置sm-wine容器请使用启动器：SuperMemo18.05-winecfg.desktop。
 
可以使用`sm-wine`命令启动SuperMemo18-WINE32自带的wine-appimage。没有设置WINEPREFIX容器根目录变量的情况下这将会在HOME目录生成默认的.wine容器。
 
软件实际所在目录：`/usr/share/SM18.05-WINE-Vessel/drive_c/SuperMemo`



## 相关链接：

- Installers for SuperMemo for Windows using Winetricks：https://github.com/alessivs/supermemo-wine

- supermemo懒人包：https://github.com/L-M-Sherlock/sm18-lazy-package/releases

- [邹佳庆/Wine_Appimage - 码云 - 开源中国 (gitee.com)](https://gitee.com/zoujiaqing/Wine_Appimage/tree/master)

- Wine Appimage ：https://github.com/Hackerl/Wine_Appimage/releases

- [AppImage/AppImageKit：将桌面应用程序打包为AppImages，这些应用程序在基于Linux的常见操作系统上运行，例如RHEL，CentOS，openSUSE，SLED，Ubuntu，Fedora，debian及其衍生产品。在 irc.libera.chat 上加入#AppImage (github.com)](https://github.com/AppImage/AppImageKit)

- [Linux常用应用清单（使Linux变得更加易用 | Linux下替代Win常用软件的应用）](https://zhuanlan.zhihu.com/p/542560170)

- Deb 打包详解: https://blog.csdn.net/fengshengwei3/article/details/124271254

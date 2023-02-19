# SuperMemo18.05-WINE32

<img src="docs/images/%E9%A2%84%E8%A7%88%E5%9B%BE%EF%BC%9ASM18.05-WINE32.png" style="width:60%">


## 安装步骤：

如果想最快上手(无需手动配置)

Debian / Ubuntu

```bash
wget https://github.com/Zacharia2/SuperMemo18-ON-Wine/releases/download/v1.4.0/SuperMemo18.05-lazy-wine32-package.v1.4.0.deb \
&& sudo dpkg -i ./SuperMemo18.05-lazy-wine32-package.v1.4.0.deb
```

Arch / Manjaro

```bash
mkdir -p /tmp/sm18
cd /tmp/sm18
wget https://raw.githubusercontent.com/Zacharia2/SuperMemo18-ON-Wine/main/PKGBUILD
makepkg -i
```

## 文件说明

- [SM18.05-WINE-Vessel文件夹](deb-package/opt/apps/supermemo/SM18.05-WINE-Vessel)
  - SuperMemo容器环境（仅含Supermemo软件的bin配置目录，请不要覆盖此文件夹（SuperMemo/bin）中的配置文件），分离软件用于保持环境整洁。
- [SM18.05-WINE-Vessel/README.md](deb-package/opt/apps/supermemo/SM18.05-WINE-Vessel/README.md)
  - SuperMemo容器环境使用教程。（仅限Linux）
- [docs/Instal-and-Package.md](docs/Instal-and-Package.md)
  - Linux系统中从零开始安装supermemo、与封装deb安装包的流程、知识及注意事项。
- deb-package文件夹
  - 构建DEB安装包的配置文件，需要SM18.05-WINE-Vessel文件夹、以及SuperMemo懒人包。
- config/winetricks-cache
  - winetricks（wine工具）安装supermemo的缓存依赖文件。用于跳过网络下载，加快安装速度。
- config/supermemo18.verb
  - winetricks（wine工具）的 supermemo 安装自动化配置文件。



## SuperMemo18.05-lazy-wine32-package.v1.4.0.deb

安装: `sudo dpkg -i SuperMemo18.05-lazy-wine32-package.v1.4.0.deb`

卸载: `sudo dpkg -r supermemo18.05-wine32`

构建: `sudo dpkg -b deb-package SuperMemo18.05-lazy-wine32-package.v1.4.0.deb`


我准备了一个快速访问SuperMemo的链接资料库文件夹：`/home/SuperMemo卡组与资料库`

你可以把此文件夹复制到桌面使用，里面有四个链接文件夹。分别是：

- SuperMemo_C盘资料库：该目录链接 C:\\SuperMemo\SuperMemo资料库，导入资料时选择C:\\SuperMemo/SuperMemo资料库目录，就可以看到文件了。

- SuperMemo_C盘卡组：该目录链接 C:\\SuperMemo\systems，你可以把卡包放入此文件夹然后点击开始菜单中的启动器SuperMemo18.desktop启动supermemo，在sm中打开卡包。

- SuperMemo_D盘卡组：该目录链接 D:\ ，有放在其它磁盘的同学可以使用了。

- SuperMemo_E盘卡组：该目录链接 E:\\

删掉链接文件夹（SuperMemo_C盘卡组、SuperMemo_C盘资料库等文件夹）不影响源文件（systems目录等）。**卸载软件后，将会删除所有文件，卸载软件前请请注意保存和备份资料。**

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

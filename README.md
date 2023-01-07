# SuperMemo18-Wine32

![](https://github.com/Zacharia2/SuperMemo18-ON-Wine/blob/main/docs/images/%E9%A2%84%E8%A7%88%E5%9B%BE%EF%BC%9ASM18.05-WINE32.png)


## 文件说明

- SM18.05-WINE-Vessel
  - SuperMemo容器环境（无Supermemo软件包），分离软件用于保持环境整洁。
- [docs/Instal-and-Package.md](https://github.com/Zacharia2/SuperMemo18-ON-Wine/blob/main/docs/Instal-and-Package.md)
  - 从零开始安装supermemo，以及打包为deb安装包教程（流程与知识及注意事项）
- config/winetricks-cache
  - winetricks安装supermemo的缓存依赖文件。用于跳过网络下载，加快安装速度。
- config/supermemo18.verb
  - winetricks 的 supermemo 安装自动化配置文件。
- config/SuperMemo18.desktop
  - SuperMemo快速启动的桌面图标。（打包时可以用）
- config/wine-sm18.05-winecfg.desktop
  - SuperMemo快速启动wine容器配置的桌面图标。（打包时可以用）



## 安装步骤：

如果想最快上手(无需手动配置)

Debian / Ubuntu

```bash
wget https://github.com/Zacharia2/SuperMemo18-ON-Wine/releases/download/v3/SuperMemo18-Wine32-dpkg-3.deb \
&& sudo apt install ./SuperMemo18-Wine32-dpkg-3.deb
```

Arch / Manjaro

```bash
mkdir -p /tmp/sm18
cd /tmp/sm18
wget https://raw.githubusercontent.com/Zacharia2/SuperMemo18-ON-Wine/main/PKGBUILD
makepkg -i
```


#### 相关链接：

- Installers for SuperMemo for Windows using Winetricks：https://github.com/alessivs/supermemo-wine

- [邹佳庆/Wine_Appimage - 码云 - 开源中国 (gitee.com)](https://gitee.com/zoujiaqing/Wine_Appimage/tree/master)

- Wine Appimage ：https://github.com/Hackerl/Wine_Appimage/releases

- [AppImage/AppImageKit：将桌面应用程序打包为AppImages，这些应用程序在基于Linux的常见操作系统上运行，例如RHEL，CentOS，openSUSE，SLED，Ubuntu，Fedora，debian及其衍生产品。在 irc.libera.chat 上加入#AppImage (github.com)](https://github.com/AppImage/AppImageKit)

- [Linux常用应用清单（使Linux变得更加易用 | Linux下替代Win常用软件的应用）](https://zhuanlan.zhihu.com/p/542560170)

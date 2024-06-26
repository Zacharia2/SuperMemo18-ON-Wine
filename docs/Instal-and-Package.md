## 从零开始安装

1. 克隆此仓库，并在终端中将工作目录切换到SuperMemo18-ON-Wine

   ```sh
   git clone https://github.com/Zacharia2/SuperMemo18-ON-Wine.git
   cd SuperMemo18-ON-Wine
   ```
   也可以：下载此仓库解压后-右单击该文件夹-在终端中打开。

2. 安装winetricks并更新

   ```sh
   sudo apt install winetricks
   sudo winetricks --self-update
   ```

3. 创建一个wine容器。

   ```sh
   bash winetricks    #启动winetricks向导
   ```
   在Winetricks-择-Wine容器对话框中选择创建新的wine容器。
   出现新窗口，Architecture（架构）选择32，Name输入：SM18-Wine32点击OK，然后弹出新的窗口点击Yes（为wine报告统计数据帮助wine的发展）。等待创建结束就可以关闭向导窗口（容器对话框）。
   

4. 把字体文件放到容器系统中的字体文件夹

   ```sh
   cp -r SM18.05-WINE-Vessel/drive_c/windows/Fonts/* $HOME/.local/share/wineprefixes/SM18-Wine32/drive_c/windows/Fonts
   ```
   需要的字体文件有14个或者更多：

   - Deng.ttf
   - MTEXTRA.TTF
   - REFSPCL.TTF
   - seguiemj.ttf
   - simsun.ttc
   - symbol.ttf
   - tahoma.ttf
   - tahomabd.ttf
   - Times Ten LT Std + FZYouSongS.ttf
   - Times Ten LT Std Roman.OTF
   - webdings.ttf
   - wingding.ttf
   - WINGDNG2.TTF
   - WINGDNG3.TTF

5. 将依赖程序放进winetricks缓存文件夹以避免联网下载。

   ```sh
   cp -rf config/winetricks-cache/* $HOME/.cache/winetricks
   cp -rf config/supermemo18.verb $HOME/.local/share/wineprefixes/SM18-Wine32
   ```

6. 切换到容器所在目录

   ```sh
   cd $HOME/.local/share/wineprefixes/SM18-Wine32
   ```

7. 在SM18-Wine32目录执行winetricks安装脚本文件

   ```sh
   bash winetricks prefix=SM18-Wine32 supermemo18.verb
   ```

8. 使用supermemo懒人版覆盖原版。

   > 懒人版supermemo下载地址：https://github.com/L-M-Sherlock/sm18-lazy-package/archive/refs/tags/1.4.0.tar.gz

   将懒人包下载后放到桌面，然后空白位置-按右键-点击在终端中打开命令。
   
   删除程序安装的原版supermemo文件夹下所有文件。

   ```sh
   rm -rf $HOME/.local/share/wineprefixes/SM18-Wine32/drive_c/SuperMemo/*
   ```

   解压下载的SuperMemo懒人包到指定目录
   - 指定目录：WINE容器C盘下的SuperMemo目录，安装后此目录下应含有sm18.exe程序。
   - 注意：解压命令指定的文件是在刚下载到桌面的懒人包文件。

   ```sh
   tar -zxvf 压缩文件名.tar.gz -C $HOME/桌面
   cp -r /sm18-lazy-package-1.4.0/sm18/* $HOME/.local/share/wineprefixes/SM18-Wine32/drive_c/SuperMemo/
   ```

9. 修改两个配置文件：SuperMemo/bin/supermemo.ini、SuperMemo/bin/layout.ini

   ```ini
   supermemo.ini 
   找到[Alarm],修改file字段如下文所示：

   [Alarm]
   File=c:\supermemo\bin\sounds\Alarm_Clock_Tick.wav
   ```
   ```
   layout.ini
   
   隐藏背景图片，防止遮挡。
   修改所有的Background值，改为0（假，false）
   ```

## 需要用到的知识

### 一、tar压缩与解压缩

1. 解压命令：`tar -zxvf 压缩文件名.tar.gz`

   解压到指定目录：`tar -zxvf 压缩文件名.tar.gz   -C   <目标目录>`

2. 压缩命令：`tar -zcvf 压缩文件名.tar.gz <被压缩的文件夹>`



### 二、在命令中预设环境变量然后运行程序

```sh
env WINEARCH=win32 WINEPREFIX="/opt/SM18-Wine32/" wine <要安装的Windows程序>
env WINEARCH=win32 WINEPREFIX="/opt/SM18-Wine32/" wine <配置容器的命令winecfg>
```


### 三、dpkg的打包安装与卸载命令

1. 打包 `sudo dpkg -b <包目录> 包名.deb`
2. 安装 `sudo dpkg -i 包名.deb`
3. 卸载 `sudo dpkg -r 包名(/mydpkg/DEBIAN/control文件中定义的名字)`



### 四、创建与删除符号链接

- 创建符号链接：`ln -s <当前文件>   <目标目录/文件>`
- 删除链接时，直接用`rm`命令



### 五、在SuperMemo18.desktop使用环境变量

在SuperMemo18.desktop使用环境变量：`Exec=env WINEARCH=win32 WINEPREFIX="/opt/sm18/SM18-Wine32/ 应用程序名"` 



### 六、Wine的两个重要环境变量。

（无需设置，已在.desktop文件中设置，但这两个变量很重要，设置不好会导致无法找到wine容器所在目录，并且会在HOME目录初始化新的.wine容器。）

说明：环境变量WINEARCH设置wine的cpu架构，WINEPREFIX设置wine容器所在目录（sm18容器目录是在/opt/**SM18-Wine32**/文件夹位置。粗体就是）。

```sh
export WINEARCH=win32  
export WINEPREFIX="/opt/SM18-Wine32/" 
```









## SuperMemo18-ON-WINE32 封装DEB安装包方法

我们希望把它安装在/opt/SM18-Wine32目录里。

首先是，你已经手动安装好了以上步骤：安装更新winetricks、创建Sm18-wine容器、安装好了supermemo。这样我们就得到一个完整的SM18-Wine32容器（环境）。我们要做的就是把这个环境与系统安装的wine独立开。便于打包deb。



### dpkg 打包

#### 思路

1. 打包成为deb（该部分所用到的文件在文章的后面可以找到）
   1. 在桌面创建新的文件夹随便命名为mydpkg，在mydpkg文件夹中创建DEBIAN文件夹，内含control文件、postinst文件、postrm文件。
   2. 在mydpkg文件夹中创建opt目录，将SM18-Wine32容器（$HOME/.local/share/wineprefixes/SM18-Wine32）放进去。
   3. 然后把Wine_Appimage下载到mydpkg/opt/SM18-Wine32目录里并重命名为Wine-x86_64.AppImage，然后为它赋予可执行文件权限。
   4. Wine_Appimage下载地址：[Releases · Hackerl/Wine_Appimage (github.com)](https://github.com/Hackerl/Wine_Appimage/releases)
   5. 在mydpkg/usr/share/application文件夹中创建两个desktop文件用于创建快捷方式：SuperMemo18.desktop、wine-sm18.05-winecfg.desktop
   6. 将说明文件以及预览图放进mydpkg/opt/SM18-Wine32里面。

2. 执行打包命令（回到含有mydpkg文件夹的桌面）

   ```
   sudo dpkg -b mydpkg SuperMemo18-Wine32.deb
   ```




#### 文件

/mydpkg/DEBIAN

- control

```
Package:SuperMemo18-Wine32
Version:18.05.pkged.3
Section:contrib
Architecture:i386
Installed-Size:435712
Maintainer:WhiteFall
Description:SuperMemo On Wine.(32bit)
 下载的sm18卡包可以放在这个目录: /mnt/SuperMemo卡包 ,该目录链接 C:\\SuperMemo/systems，打开它点击SuperMemo18.desktop启动supermemo，在sm中打开卡包。
 . 
 需要被sm18访问到的文件放在这个目录: /mnt/SuperMemo资料库，该目录链接 C:\\SuperMemo/SuperMemo资料库，导入资料时选择C:\\SuperMemo/SuperMemo资料库,目录即可。
 . 
 在linux中使用SuperMemo.请使用管理员权限安装本软件.
 . 
 方法: sudo dpkg -i SuperMemo18-Wine32.deb
 . 
 运行软件请使用启动器文件：SuperMemo18.desktop
 . 
 配置sm-wine容器请使用wine-sm18.05-winecfg.desktop
 . 
 另外Wine-x86_64.AppImage链接到/usr/bin/sm-wine，可以使用命令sm-wine启动SuperMemo18-Wine32自带的wine appimage。没有设置WINEPREFIX容器根目录变量的情况下这将会在HOME目录生成默认的.wine容器。
 .
 配置容器以及为容器安装软件命令：
 . 
 env WINEARCH=win32 WINEPREFIX="/opt/SM18-Wine32/" sm-wine <要安装的Windows程序>
 . 
 env WINEARCH=win32 WINEPREFIX="/opt/SM18-Wine32/" sm-wine <配置容器的命令winecfg>
 . 
 软件实际所在目录：/opt/SM18-Wine32/drive_c/SuperMemo
 . 
 本说明文档会放在/opt/SM18-Wine32，请需要时查阅。
（此处应增加一个空行作为文件结束）


```

- postinst（安装后执行的脚本）

```sh
#!/bin/sh
chmod a+x /opt/SM18-Wine32/Wine-x86_64.AppImage
sudo ln -s /opt/SM18-Wine32/Wine-x86_64.AppImage /usr/bin/sm-wine
ln -s /opt/SM18-Wine32/drive_c/SuperMemo/systems /mnt/SuperMemo卡包
ln -s /opt/SM18-Wine32/drive_c/SuperMemo/SuperMemo资料库 /mnt/SuperMemo资料库
```

- postrm（卸载后执行的脚本）

```sh
#!/bin/sh
sudo rm /usr/bin/sm-wine
rm /mnt/SuperMemo卡包
rm /mnt/SuperMemo资料库
sudo rm -rf /opt/SM18-Wine32
```





/mydpkg/opt/SM18-Wine32    软件包，安装时会直接解压到相应的目录。

- Wine-x86_64.AppImage
- 预览图1.png
- 预览图2.png
- drive_c/SuperMemo
- system.reg
- 软件说明
- ...........

/mydpkg/usr/share/applications/快捷方式文件（启动器deskktop文件）。

- SuperMemo18.desktop
- wine-sm18.05-winecfg.desktop





SuperMemo18.desktop文件具体内容。

```sh
[Desktop Entry]
Name=SuperMemo 18 
Exec=env WINEARCH=win32 WINEPREFIX="/opt/SM18-Wine32" /opt/SM18-Wine32/Wine-x86_64.AppImage /opt/SM18-Wine32/drive_c/SuperMemo/sm18.exe
Type=Application
Categories=Education;
StartupNotify=true
Comment=组织你的知识，以尽可能快的速度学习.
Path=/opt/SM18-Wine32/drive_c/SuperMemo
Icon=/opt/SM18-Wine32/drive_c/SuperMemo/smicon.png
StartupWMClass=sm18.exe
```



wine-sm18.05-winecfg.desktop文件内容。

```sh
[Desktop Entry]
Name=wine-sm18.05-winecfg
Exec=env WINEARCH=win32 WINEPREFIX="/opt/SM18-Wine32/" /opt/SM18-Wine32/Wine-x86_64.AppImage winecfg
Type=Application
Categories=Education;
StartupNotify=true
Comment=打开supermemo18-wine的配置窗口。
Path=/opt/SM18-Wine32/
Icon=/opt/SM18-Wine32/drive_c/SuperMemo/smicon.png
StartupWMClass=Wine-x86_64.AppImage
```


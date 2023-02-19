# SuperMemo WINE32.



> 这是SuperMemo18的WINE容器，也就是在非windows系统上必要的运行环境。
>
> 此WINE容器环境包含SusperMemo18.05所需的所有依赖，可以直接使用，仅需将懒人包解压到SM18.05-WINE-Vessel/drive_c/SuperMemo，注意不要覆盖容器中的SuperMemo/bin文件夹。
>
> 软件实际所在目录：SM18.05-WINE-Vessel/drive_c/SuperMemo，不过只包含bin文件夹（supermemo的配置文件）。你可以将懒人包的非bin文件夹复制到此，一样使用。你也可以将其封装为DEB安装包，请阅读[docs/Instal-and-Package.md](https://github.com/Zacharia2/SuperMemo18-ON-Wine/blob/main/docs/Instal-and-Package.md)，并下载适合你电脑版本的[Wine Appimage](https://github.com/Hackerl/Wine_Appimage/releases) 来完成打包。
>
> SuperMemo WINE32可以作为阅读记忆与复习工具以及手动传统制卡工具使用。



## 安装WINE


- 对于Linux可以使用命令sudo apt install winetricks
- 备注：wine-momo（.net框架的跨平台实现）wine-gecko（IE浏览器的wine实现。已安装IE。）wine-momo已有linux实现。[linux版的dotnet框架](https://learn.microsoft.com/en-us/dotnet/core/install/linux)


## 使用方法

下载懒人包，将懒人包里面**除了bin文件夹的所有文件**复制到`SM18.05-WINE-Vessel/drive_c/SuperMemo `文件夹。

- 使用wine命令启动sm18.exe
  - 设置wine环境
    - 设置系统架构为win32：`WINEARCH=win32`
    - 设置wine软件容器所在位置的绝对路径：`WINEPREFIX="/软件所在目录/SM18.05-WINE-Vessel/"`
  - wine命令
    - wine，可以用来在WINE容器中启动或安装windows软件
    - wine winecfg ，用来配置WINE容器环境。比如增减磁盘、设置windows版本等等。
  - 命令可以分成三个部分，`设置wine环境` + `wine命令` + `/绝对路径/SM18程序`

例子：启动SuperMemo
```shell
env WINEARCH=win32 WINEPREFIX="/软件所在目录/SM18.05-WINE-Vessel/" wine /软件所在目录/SM18.05-WINE-Vessel/drive_c/SuperMemo/sm18.exe
```

## 关于quicker
依赖软件：
  - 微软WebView2组件
  - 微软.Net 4.7.2（.net framework 4.7.2）

下载地址
  - http://getquicker.net/Download

注：依赖软件可以安装在linux系统中或者安装在WINE容器环境中。看情况选择，如果都不行，则使用虚拟机或者专用平台。

## 附加功能

容器中可以安装受支持的任意window软件，比如 IE8 （已安装）。Quicker或许也可以安装。

安装任意软件到容器要先设置好两个必要的环境变量，使它们指向容器所在的目录。

- WINEARCH，设置系统架构为win32。
- WINEPREFIX，设置wine软件容器所在位置，绝对路径。

举例子：`env WINEARCH=win32 WINEPREFIX="/软件所在目录/SM18.05-WINE-Vessel/" wine Quicker安装程序.exe`。这样就会启动Quicker安装程序，然后按照win上的流程操作就可以了。


配置容器命令：

`env WINEARCH=win32 WINEPREFIX="/软件所在目录绝对路径/SM18.05-WINE-Vessel/" wine winecfg`


## 关于MacOS

关于MacOS，由于身边只有linux电脑，所以无法测试给出结果。不过，可以到官网下载winehq-staging-5.7.pkg、XQuartz然后安装软件包。

- winehq-staging-5.7.pkg ：https://dl.winehq.org/wine-builds/macosx/download.html
- XQuartz： https://www.xquartz.org/

关于Mac像快捷方式一样快速启动supermemo：在Mac中，后缀名为command的脚本可以实现双击运行的效果（例如scriptName.command），但是文件开头应以#!/bin/sh 开头，然后给脚本文件写入可执行文件权限。


## 版本说明

1. 更新SuperMemo懒人包到1.4.0
2. 增加d、e两个盘符。
3. 修改layout.ini文件，隐藏所有布局的背景图片，以适配Linux中背景图片遮挡软件界面的问题。
4. 增加符号字体文件。


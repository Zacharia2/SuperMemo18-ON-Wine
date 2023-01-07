# SuperMemo WINE32.



> 这是SuperMemo18的WINE容器，也就是在非windows系统上必要的运行环境。
>
> 软件实际所在目录：SM18.05-WINE32Vessel-1.3.1/drive_c/SuperMemo
>
> SuperMemo WINE32可以作为阅读记忆与复习工具以及手动传统制卡工具使用。



## 安装WINE

- 如果没有wine，可以使用一下方法安装。
  - 对于Linux可以使用命令sudo apt install winetricks
  - 对于MacOS，可以到官网下载winehq-staging-5.7.pkg、XQuartz-2.8.1.dmg然后安装软件包。在Mac中，后缀名为command的脚本可以实现双击运行的效果（例如scriptName.command），但是文件开头应以#!/bin/sh 开头，然后给脚本文件写入可执行文件权限。

- wine-momo（.net框架的跨平台实现）wine-gecko（IE浏览器的wine实现。）
  - quicker安装需要.net framework 4.7.2

## 使用方法

- 使用wine命令启动sm18.exe
  - WINEARCH，设置系统架构为win32。
  - WINEPREFIX，设置wine软件容器所在位置，绝对路径。
  - 命令分成三个部分，设置wine环境，wine命令 + SM18程序。


```shell
env WINEARCH=win32 WINEPREFIX="/软件所在目录/SM18.05-WINE32Vessel-1.3.1/" wine /软件所在目录/SM18.05-WINE32Vessel-1.3.1/drive_c/SuperMemo/sm18.exe
```



## 附加功能

容器中可以安装受支持的任意window软件，比如 IE8 （已安装）。Quicker或许也可以安装。



安装任意软件到容器要先设置好两个必要的环境变量，使它们指向容器所在的目录。

- WINEARCH，设置系统架构为win32。
- WINEPREFIX，设置wine软件容器所在位置，绝对路径。

举例子：env WINEARCH=win32 WINEPREFIX="/软件所在目录/SM18.05-WINE32Vessel-1.3.1/" wine Quicker安装程序.exe。这样就会启动Quicker安装程序，然后按照win上的流程操作就可以了。



配置容器命令。
env WINEARCH=win32 WINEPREFIX="/软件所在目录/SM18.05-WINE32Vessel-1.3.1/" wine winecfg





## 版本说明

1. 修改layout.ini文件，隐藏所有布局的背景图片，以适配Linux中背景图片遮挡软件界面的问题。
2. 更新SuperMemo懒人包到1.3.1


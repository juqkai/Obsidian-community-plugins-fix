@echo off
set home=%localappdata%\Obsidian\resources
c:
cd %home% 

set sedcmd="C:\Program Files\Git\usr\bin\sed.exe"
IF NOT EXIST obsidian.asar.backup (
	echo 没有找到之前备份的文件！
	pause
	exit
)

del   .\obsidian.asar
ren obsidian.asar.backup obsidian.asar

echo 完成了 obsidian 的恢复！

pause

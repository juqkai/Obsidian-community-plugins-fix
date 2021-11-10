@echo off
set obsidianHome=%localappdata%\Obsidian
set home=%obsidianHome%\resources

IF NOT EXIST %home%\obsidian.asar (
	echo 没有找到obsidian的安装目录！
	echo 请替换本文件第二行【obsidianHome=】后面的内容为Obsidian安装目录！
	pause
	exit
)

copy %home%\obsidian.asar %home%\obsidian.asar.backup
echo 完成 obsidian 备份！
echo 开始应用补丁！

:: %sedcmd% -b -i 's/https:\/\/raw\.githubusercontent\.com/          https:\/\/raw\.fastgit\.org/g' obsidian.asar
%~dp0sed-4.8-x86.exe -b -i "s/https:\/\/raw\.githubusercontent\.com/https:\/\/raw\.fastgit\.org/g" %home%\obsidian.asar
%~dp0sed-4.8-x86.exe -b -i "s/https:\/\/github\.com\/\"/https:\/\/hub\.fastgit\.org\/\"/g" %home%\obsidian.asar
echo 完成插件下载补丁的修复！

:: 创建快捷方式
echo 正在创建桌面快捷方式。
::设置程序或文件的完整路径（必选）
set Program=%obsidianHome%\Obsidian.exe
set args="--disable-web-security"
::设置快捷方式名称（必选）
set LnkName=Obsibian
::设置程序的工作路径，一般为程序主目录，此项若留空，脚本将自行分析路径
set WorkDir=%obsidianHome%
::设置快捷方式显示的说明（可选）
set Desc=修复Obsidian无法安装第三方插件
 
if not defined WorkDir call:GetWorkDir "%Program%"
(echo Set WshShell=CreateObject("WScript.Shell"^)
echo strDesKtop=WshShell.SpecialFolders("DesKtop"^)
echo Set oShellLink=WshShell.CreateShortcut(strDesKtop^&"\%LnkName%.lnk"^)
echo oShellLink.TargetPath="%Program%" 
echo oShellLink.Arguments=%args%
echo oShellLink.WorkingDirectory="%WorkDir%"
echo oShellLink.WindowStyle=1
echo oShellLink.Description="%Desc%"
echo oShellLink.Save)>makelnk.vbs
makelnk.vbs
del /f /q makelnk.vbs
echo 桌面快捷方式创建成功！ 
echo Obsidian补丁执行结束！ 
pause
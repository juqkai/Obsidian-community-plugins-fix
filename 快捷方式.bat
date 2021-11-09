::@echo off
echo 正在创建桌面快捷方式，请勿关闭本窗口.
::设置程序或文件的完整路径（必选）
set Program=%localappdata%\Obsidian\Obsidian.exe

set args="--disable-web-security"

::设置快捷方式名称（必选）
set LnkName=Obsibian
 
::设置程序的工作路径，一般为程序主目录，此项若留空，脚本将自行分析路径
set WorkDir=%localappdata%\Obsidian
 
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
exit
goto :eof
:GetWorkDir
set WorkDir=%~dp1
set WorkDir=%WorkDir:~,-1%
goto :eof

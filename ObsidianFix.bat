@echo off

set home=%localappdata%\Obsidian\resources
copy %home%\obsidian.asar %home%\obsidian.asar.backup
echo ��� obsidian ���ݣ�


:: %sedcmd% -b -i 's/https:\/\/raw\.githubusercontent\.com/          https:\/\/raw\.fastgit\.org/g' obsidian.asar
%~dp0sed-4.8-x86.exe -b -i "s/https:\/\/raw\.githubusercontent\.com/https:\/\/raw\.fastgit\.org/g" %home%\obsidian.asar
%~dp0sed-4.8-x86.exe -b -i "s/https:\/\/github\.com\/\"/https:\/\/hub\.fastgit\.org\/\"/g" %home%\obsidian.asar

echo ��ɲ�����ص��޸���



:: ������ݷ�ʽ
echo ���ڴ��������ݷ�ʽ��
::���ó�����ļ�������·������ѡ��
set Program=%localappdata%\Obsidian\Obsidian.exe

set args="--disable-web-security"

::���ÿ�ݷ�ʽ���ƣ���ѡ��
set LnkName=Obsibian
 
::���ó���Ĺ���·����һ��Ϊ������Ŀ¼�����������գ��ű������з���·��
set WorkDir=%localappdata%\Obsidian
 
::���ÿ�ݷ�ʽ��ʾ��˵������ѡ��
set Desc=�޸�Obsidian�޷���װ���������
 
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
echo �����ݷ�ʽ�����ɹ��� 
echo Obsidian����ִ�н����� 
pause
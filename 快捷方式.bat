::@echo off
echo ���ڴ��������ݷ�ʽ������رձ�����.
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
exit
goto :eof
:GetWorkDir
set WorkDir=%~dp1
set WorkDir=%WorkDir:~,-1%
goto :eof

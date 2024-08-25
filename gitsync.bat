@echo off
setlocal enableextensions
:: GitSync, by PatoFlamejanteTV
:: ----------------------------

set VERSION=0.0.5
set delay=10
set commitmsg=Commit AUTOMATICO feito pelo GitSync [Ferramenta por: PatoFlamejanteTV]
set gsabout=SOBRE: GitSync e uma ferramenta cujo intuito e 'sincronizar' coisas de um repositorio noa-local para meu computador.
set info=%gsabout%	GitSync Info: Version %VERSION%, 


TITLE [GitSync %VERSION%] CMSG: %commitmsg% DELAY: %delay% DESC: %descmsg%
echo GitSync current configs:
echo.
echo DELAY: %delay%

echo ------------------------

:sync
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)
git pull
git add *
git push
git commit -m "%commitmsg%" -m "%info%, DATE: %mytime%."
timeout %delay%
cls
goto sync
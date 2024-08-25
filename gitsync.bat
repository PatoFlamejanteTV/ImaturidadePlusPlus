@echo off
setlocal enableextensions
:: GitSync, by PatoFlamejanteTV
:: ----------------------------

set VERSION=0.0.7

set delay=7

set commitmsg=Commit AUTOMATICO feito pelo GitSync [Ferramenta por: PatoFlamejanteTV]
set gsabout=SOBRE: GitSync e uma ferramenta cujo intuito e 'sincronizar' coisas de um repositorio nao-local para meu computador (e vice-versa).

set info=%gsabout%	GitSync Info: Version %VERSION% 


TITLE [GitSync %VERSION%] CMSG: %commitmsg% DELAY: %delay% DESC: %info%
echo GitSync current configs:
echo.
echo DELAY: %delay%

echo ------------------------

:sync
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a:%%b)
git pull
git add *
git push
git commit -m "[GitSync %VERSION%] %commitmsg%" -m "%info%, DATE (24H): %mytime%."
timeout %delay%
cls
goto sync
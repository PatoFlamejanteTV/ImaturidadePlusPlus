@echo off
:: setlocal enableextensions
:: GitSync, by PatoFlamejanteTV
:: ----------------------------

set gs=0.0.7

set delay=7

set gsabout=SOBRE: GitSync e uma ferramenta cujo intuito e 'sincronizar' coisas de um repositorio nao-local para meu computador (e vice-versa).

set info=%gsabout%	GitSync Info: Version %gs% 


TITLE [GitSync %gs%] CMSG: %commitmsg% DELAY: %delay% DESC: %info%
echo GitSync current configs:
echo.
echo DELAY: %delay%

echo ------------------------

:sync
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a:%%b)
git pull
git add *
git push
git commit -m "[GitSync %VERSION%] %gsabout%" -m "%info%, DATE (24H): %mytime%."
timeout %delay%
cls
goto sync
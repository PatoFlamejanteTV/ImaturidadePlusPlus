@echo off
set gs=0.1.0
set delay=45
TITLE [GitSync %gs%] Running...
:: setlocal enableextensions
:: GitSync, by PatoFlamejanteTV
:: ----------------------------

set title=COMMIT Feito automaticamente pelo GitSync
echo GitSync current configs:
echo.
echo DELAY: %delay%

echo ------------------------

:sync
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a:%%b)
git pull
git add *
git push
git commit -m "[GitSync %gs%] %title%" -m "DATE (24H): %mytime%."
timeout %delay%
cls
goto sync
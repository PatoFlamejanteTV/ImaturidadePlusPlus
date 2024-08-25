@echo off
:: setlocal enableextensions
:: GitSync, by PatoFlamejanteTV
:: ----------------------------

set gs=0.0.7

set delay=7

set title=[GitSync %gs%]COMMIT Feito automaticamente pelo GitSync
echo GitSync current configs:
echo.
echo DELAY: %delay%

echo ------------------------

:sync
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a:%%b)
git pull
git add *
git push
git commit -m "[GitSync %VERSION%] %title%" -m "%info%, DATE (24H): %mytime%."
timeout %delay%
cls
goto sync
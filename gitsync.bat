@echo off
set gs=0.1.3
:: set delay=5
TITLE [GitSync %gs%] Running...
:: setlocal enableextensions
:: GitSync, by PatoFlamejanteTV
:: ----------------------------

set title=COMMIT Feito automaticamente pelo GitSync
echo GitSync current configs:
echo.
:: echo DELAY atual: %delay%

echo ------------------------

:sync
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a:%%b)
git pull
git add *
git push
git commit -m "[GitSync V:%gs%] %title%" -m "DATA (24 horas): %mytime%."
:: timeout %delay% /nobreak
cls
goto sync

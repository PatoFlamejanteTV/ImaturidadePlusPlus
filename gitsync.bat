:: GitSync, by PatoFlamejanteTV
:: ----------------------------

@echo off

set delay=60
set commitmsg=Automatic Commit by GitSync [Tool by: PatoFlamejanteTV]

echo GitSync current configs:
echo.
echo DELAY: %delay%
echo commitmsg: %commitmsg%
echo ------------------------
:sync
git pull
git add *
git push
git commit -m "%commitmsg%"
timeout %delay%
cls
goto sync
:: GitSync, by PatoFlamejanteTV
:: ----------------------------

set delay=15
set commitmsg=Commited by GitSync [PatoFlamejanteTV]

echo GitSync current configs:
echo.
echo DELAY: %delay%
echo commitmsg: %commitmsg%
:sync
git pull
git add *
git push
git commit -m "%commitmsg%"
timeout %delay%
goto sync
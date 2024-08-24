:: GitSync, by PatoFlamejanteTV
:: ----------------------------

@echo off

set delay=15
set commitmsg=Commit AUTOMÁTICO feito pelo GitSync [Ferramenta por: PatoFlamejanteTV]
set descmsg=SOBRE: GitSyn é uma ferramenta criada por mim, que permite enviar e receber alterações de um repositório não-local\n**INFORMAÇÕES: **Delay: %delay%

TITLE CMSG: %commitmsg% DELAY: %delay%
echo GitSync current configs:
echo.
echo DELAY: %delay%
echo commitmsg: %commitmsg%

echo ------------------------

:sync
git pull
git add *
git push
git commit -m "%commitmsg%" -m "%descmsg%"
timeout %delay%
cls
goto sync
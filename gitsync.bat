@echo off
:: GitSync, by PatoFlamejanteTV
:: ----------------------------

set delay=10
set commitmsg=Commit AUTOMATICO feito pelo GitSync [Ferramenta por: PatoFlamejanteTV]
set descmsg=SOBRE: GitSyn e uma ferramenta criada por mim, que permite enviar e receber alteracoes de um repositorio nao-local...	\n**INFORMACOES: **Delay: %delay%

TITLE CMSG: %commitmsg% DELAY: %delay% DESC: %descmsg%
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
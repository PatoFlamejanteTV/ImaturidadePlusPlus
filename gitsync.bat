:: GitSync, by PatoFlamejanteTV
:: ----------------------------

:: MOTIVO DA MUDANÇA DO DELAY:  MINHA REDE ELÉTRICA ESTÁ INSTAVEL E MINHA INTERNET TAMBEM - ESSA MUDANÇA É TEMPORARIA
@echo off

set delay=5
set commitmsg=Commit AUTOMÁTICO feito pelo GitSync [Ferramenta por: PatoFlamejanteTV]

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
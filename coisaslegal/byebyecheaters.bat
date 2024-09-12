@Echo off
:: PatoFlamejanteTV's Anti Cheat
:: Based on Loader-Souce's Anticheat
:: https://github.com/binaryloverr/Loader-Source/blob/caf4e95ab3d535b66cab419db4ea378755428db8/prot/protector.h

TITLE cheater???????
echo Did you have cheats?
askkill /f /im Cheat Engine.exe
taskkill /f /im cheatengine-x86_64.exe
taskkill /f /im cheatengine-x86_64-SSE4-AVX2.exe
taskkill /f /im MugenJinFuu-x86_64-SSE4-AVX2.exe
taskkill /f /im MugenJinFuu-i386.exe
taskkill /f /im cheatengine-x86_64.exe
taskkill /f /im cheatengine-i386.exe
taskkill /FI \"IMAGENAME eq cheatengine*\" /IM * /F /T
echo.
echo wooow bye!
timeout 3 /nobreak
rem Инициализация скрипта
@echo off
SetLocal EnableExtensions EnableDelayedExpansion
title skinReplace v0.5
color 1F
rem программа 
md "%APPDATA%\.minecraft\resourcepacks\skinReplace %DATE%\assets\minecraft\textures\entity"
copy /y resources\pack.png "%APPDATA%\.minecraft\resourcepacks\skinReplace %DATE%"
copy skin\steve.png "%APPDATA%\.minecraft\resourcepacks\skinReplace %DATE%\assets\minecraft\textures\entity\steve.png"
choice /c 12345 /m "choose your minecraft version (1. <1.9, 2. 1.9, 3. 1.11 - 1.12, 4. 1.13 - 1.14, 5. 1.15)"
echo mcmeta = mcmeta%ERRORLEVEL%
GOTO mcmeta%ERRORLEVEL%

:next
echo mcmeta = %mcmeta%
rem Код, для замены строки, был написан (или украден, я хз) Евгением с Хабр'а (@tw1ggyz). Огромное спасибо ему :)
setlocal enabledelayedexpansion
Set infile=pack.info
Set find="pack_format": 0,
Set replace="pack_format": %mcmeta%,
setlocal enabledelayedexpansion
set COUNT=0
for /F "tokens=* delims=, eol=#" %%n in (!infile!) do (
set LINE=%%n
set TMPR=!LINE:%find%=%replace%!
Echo !TMPR!>>TMP.TMP
)
move TMP.TMP %infile%
copy /y pack.info "%APPDATA%\.minecraft\resourcepacks\skinReplace %DATE%\pack.mcmeta"
setlocal enabledelayedexpansion
Set infile=pack.info
Set find="pack_format": %mcmeta%,
Set replace="pack_format": 0,
setlocal enabledelayedexpansion
set COUNT=0
for /F "tokens=* delims=, eol=#" %%n in (!infile!) do (
set LINE=%%n
set TMPR=!LINE:%find%=%replace%!
Echo !TMPR!>>TMP.TMP
)
move TMP.TMP %infile%
rem Да... Говнокод
choice /n /m "Now, you can close application..."

:mcmeta1
set mcmeta=1
GOTO next
:mcmeta2
set mcmeta=2
GOTO next
:mcmeta3
set mcmeta=3
GOTO next
:mcmeta4
set mcmeta=4
GOTO next
:mcmeta5
set mcmeta=5
GOTO next

@echo off
REM hide the commands lines

REM titre de la fenetre
title PenduSquall
REM window width
mode con cols=80 lines=30
REM back and foreground color
color 5F

:start
cls
echo *****************************************
echo ***                Menu               ***
echo *****************************************
echo.
echo.
echo I-   Niveau 1
echo II-  Niveau 2
echo III- Niveau 3
echo.
echo *****************************************
echo.
echo.

:control_choix
echo Choisissez un niveau
set /p a=
if %a% lss 1 goto control_choix
if %a% gtr 3 goto control_choix

if %a% equ 1 set b=50
if %a% equ 2 set b=100
if %a% equ 3 set b=200

REM generation of the random number between 1 and b
set /a nbr= (%RANDOM%*%b%/32768+1)

cls
:jeu
echo.
echo Devinez un nombre entre 1 et %b%
set /p devine=
if %devine% lss %nbr% echo %devine% est trop petit
if %devine% gtr %nbr% echo %devine% est trop grand
if %devine% neq %nbr% goto jeu
echo.
echo.
echo *****************************************
echo.
echo       Bravo vous avez trouve!!! :-)         
echo.     
echo ***************************************** 

:control_rep
echo.
echo.
echo voulez vous recommencez??
echo 1=oui  0=non
set /p rep=
if %rep% equ 1 goto start
if %rep% neq 0 goto control_rep

pause > nul
exit 
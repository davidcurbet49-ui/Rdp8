@echo off
:menu
cls
echo Select an option:
echo 1. Open WSL Ubuntu terminal to export files
echo 2. Exit
set /p choice="Enter your choice to continue: "

if "%choice%"=="1" goto wsl_terminal
if "%choice%"=="2" goto end
echo Invalid choice. Please try again.
pause
goto menu

:wsl_terminal
cls
echo Opening WSL Ubuntu terminal...
echo You can enter your commands below.
echo To exit WSL terminal, type 'exit' and press Enter.
echo.

:: Open WSL and allow user to enter commands interactively
wsl

:: After exiting WSL, return to menu
goto menu

:end
echo Exiting...
exit

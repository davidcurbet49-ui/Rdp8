@echo off
title Android-x86 Installer Helper
color 0B

:: Section 1: ISO Path
set /p isoPath="Enter the full file path to your Android-x86 ISO: "
if not exist "%isoPath%" (
    echo [ERROR] ISO file not found at %isoPath%
    pause
    exit /b
)

:: Section 2: Size Selection
echo.
echo Select Data Storage Size:
echo 1) 4GB
echo 2) 8GB
echo 3) 16GB
set /p sizeChoice="Enter your choice (1-3): "

:: Section 3: Target Installation
echo.
echo Select Target Installation:
echo 1) Prepare Android-x86 USB
echo 2) Setup for Windows 11 Dual Boot (Grub2Win)
set /p targetChoice="Enter your choice (1 or 2): "

:: Logic for Choice 1
if "%targetChoice%"=="1" (
    echo.
    echo [ACTION] Preparing to flash %isoPath% to USB...
    echo (Note: You may need a tool like Rufus or 'dd' for actual flashing)
)

:: Logic for Choice 2
if "%targetChoice%"=="2" (
    echo.
    echo [ACTION] Configuring for Windows 11 Dual Boot...
    echo Please ensure Grub2Win is installed. 
    echo Target Partition: Choice 1 selected.
)

echo.
echo Configuration Complete. 
echo ISO: %isoPath%
echo Size Choice: %sizeChoice%
echo Target: %targetChoice%
pause

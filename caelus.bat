@echo off
::=============================================================================
:: CAELUS ENVIRONMENT MENU
:: caelus.bat
::=============================================================================

SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion

::=============================================================================

:menu
cls
echo.
echo !ESC![36m "===============================================================";!ESC![0m
echo !ESC![36m "     _______  _______  _______  _                 _______      ";!ESC![0m
echo !ESC![36m "    (  ____ \(  ___  )(  ____ \( \      |\     /|(  ____ \     ";!ESC![0m
echo !ESC![36m "    | (    \/| (   ) || (    \/| (      | )   ( || (    \/     ";!ESC![0m
echo !ESC![36m "    | |      | (___) || (__    | |      | |   | || (_____      ";!ESC![0m
echo !ESC![36m "    | |      |  ___  ||  __)   | |      | |   | |(_____  )     ";!ESC![0m
echo !ESC![36m "    | |      | (   ) || (      | |      | |   | |      ) |     ";!ESC![0m
echo !ESC![36m "    | (____/\| )   ( || (____/\| (____/\| (___) |/\____) |     ";!ESC![0m
echo !ESC![36m "    (_______/|/     \|(_______/(_______/(_______)\_______)     ";!ESC![0m
echo !ESC![36m "                                                               ";!ESC![0m
echo !ESC![36m "              CAELUS UTILITY MENU                              ";!ESC![0m
echo !ESC![36m "                                                               ";!ESC![0m
echo !ESC![36m "===============================================================";!ESC![0m
echo.

::=============================================================================

echo Select an option (items marked with [^^!] delete files):
echo.
echo 1. Start Caelus
echo 2. Setup Environment
echo 3. Pre-commit checks [^^!]
echo 4. Reset Environment [^^!]
echo 5. Exit
echo.
set /p choice=Option:

if "%choice%"=="1" (
    cls
    call scripts\caelus_start.bat
) else if "%choice%"=="2" (
    cls
    call scripts\setup_environment.bat
    ) else if "%choice%"=="3" (
    cls
    call scripts\pre_commit_checks.bat
    ) else if "%choice%"=="4" (
    cls
    call scripts\reset_environment.bat
) else if "%choice%"=="5" (
    echo Exiting...
    cls
    exit /b 0
) else (
    echo Invalid selection. Please select a valid option.
    pause
    goto :menu
)

::=============================================================================
:: EXFILTRATE!!
::=============================================================================

echo.
exit /b 0

::= EOF =======================================================================

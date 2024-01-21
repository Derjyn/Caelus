@echo off
::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
:: CAELUS APPLICATION START
:: caelus_start.bat
::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion

::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

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
echo !ESC![36m "              CAELUS APPLICATION BACKEND                       ";!ESC![0m
echo !ESC![36m "                                                               ";!ESC![0m
echo !ESC![36m "              CTRL+C TO TERMINATE SERVER                       ";!ESC![0m
echo !ESC![36m "===============================================================";!ESC![0m
echo.

::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

call uvicorn backend.app.main:app --reload

if %ERRORLEVEL% neq 0 (
    echo "Error: Caelus application backend ran into a mysterious error..."
    exit /b %ERRORLEVEL%
)

::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
:: EXFILTRATE!!
::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

echo.
exit /b 0

::= EOF = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

@echo off
::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
:: CAELUS PRE-COMMIT CHECK SCRIPT
:: pre_commit_check.bat
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
echo !ESC![36m "              PERMORMING PRE-COMMIT CHECKS...                  ";!ESC![0m
echo !ESC![36m "===============================================================";!ESC![0m
echo.

::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

echo.
echo !ESC![31m "===============================================================";!ESC![0m
echo !ESC![31m "           _____   ____  ______ _______ _______     __         ";!ESC![0m
echo !ESC![31m "          |  __ \ / __ \|  ____|__   __|  __ \ \   / /         ";!ESC![0m
echo !ESC![31m "          | |__) | |  | | |__     | |  | |__) \ \_/ /          ";!ESC![0m
echo !ESC![31m "          |  ___/| |  | |  __|    | |  |  _  / \   /           ";!ESC![0m
echo !ESC![31m "          | |    | |__| | |____   | |  | | \ \  | |            ";!ESC![0m
echo !ESC![31m "          |_|     \____/|______|  |_|  |_|  \_\ |_|            ";!ESC![0m
echo !ESC![31m "                                                               ";!ESC![0m
echo !ESC![31m "          RUNNING POETRY CHECK...                              ";!ESC![0m
echo !ESC![31m "===============================================================";!ESC![0m
echo.

::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

call poetry check

if %ERRORLEVEL% neq 0 (
    echo "Error: Poetry check failed."
    exit /b %ERRORLEVEL%
)

::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

echo.
echo !ESC![33m "===============================================================";!ESC![0m
echo !ESC![33m "           _   _ _____  __  __                                 ";!ESC![0m
echo !ESC![33m "          | \ | |  __ \|  \/  |                                ";!ESC![0m
echo !ESC![33m "          |  \| | |__) | \  / |                                ";!ESC![0m
echo !ESC![33m "          | . \ |  ___/| |\/| |                                ";!ESC![0m
echo !ESC![33m "          | |\  | |    | |  | |                                ";!ESC![0m
echo !ESC![33m "          |_| \_|_|    |_|  |_|                                ";!ESC![0m
echo !ESC![33m "                                                               ";!ESC![0m
echo !ESC![33m "          RUNNING NPM AUDIT...                                 ";!ESC![0m
echo !ESC![33m "===============================================================";!ESC![0m
echo.

::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

call npm audit

if %ERRORLEVEL% neq 0 (
    echo "Error: NPM audit failed."
    exit /b %ERRORLEVEL%
)

::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

echo.
echo !ESC![33m "===============================================================";!ESC![0m
echo !ESC![36m "           ____  _               _____ _  __                   ";!ESC![0m
echo !ESC![36m "          |  _ \| |        /\   / ____| |/ /                   ";!ESC![0m
echo !ESC![36m "          | |_) | |       /  \ | |    | ' /                    ";!ESC![0m
echo !ESC![36m "          |  _ <| |      / /\ \| |    |  <                     ";!ESC![0m
echo !ESC![36m "          | |_) | |____ / ____ \ |____| . \                    ";!ESC![0m
echo !ESC![36m "          |____/|______/_/    \_\_____|_|\_\                   ";!ESC![0m
echo !ESC![36m "                                                               ";!ESC![0m
echo !ESC![36m "          RUNNING BLACK FORMATTING...                          ";!ESC![0m
echo !ESC![33m "===============================================================";!ESC![0m
echo.

::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

call python -m black "backend"

if %ERRORLEVEL% neq 0 (
    echo "Error: Black formatting failed."
    exit /b %ERRORLEVEL%
)

::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

echo.
echo !ESC![33m "===============================================================";!ESC![0m
echo !ESC![33m "            _____ _      ______          _   _                 ";!ESC![0m
echo !ESC![33m "           / ____| |    |  ____|   /\   | \ | |                ";!ESC![0m
echo !ESC![33m "          | |    | |    | |__     /  \  |  \| |                ";!ESC![0m
echo !ESC![33m "          | |    | |    |  __|   / /\ \ | . \ |                ";!ESC![0m
echo !ESC![33m "          | |____| |____| |____ / ____ \| |\  |                ";!ESC![0m
echo !ESC![33m "           \_____|______|______/_/    \_\_| \_|                ";!ESC![0m
echo !ESC![33m "                                                               ";!ESC![0m
echo !ESC![33m "          CLEANING ENVIRONMENT...                              ";!ESC![0m
echo !ESC![33m "===============================================================";!ESC![0m
echo.

::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

call scripts\reset_environment.bat

if %ERRORLEVEL% neq 0 (
    echo "Error: A walrus fell from the sky while cleaning up."
    exit /b %ERRORLEVEL%
)

::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
:: EXFILTRATE!!
::= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

echo.
exit /b 0

::= EOF = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
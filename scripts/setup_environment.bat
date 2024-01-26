@echo off
::=============================================================================
:: CAELUS ENVIRONMENT SETUP SCRIPT
:: setup_environment.bat
::=============================================================================

SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion

::=============================================================================

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
echo !ESC![36m "              PERMORMING ENVIRONMENT PRIMING...                ";!ESC![0m
echo !ESC![36m "===============================================================";!ESC![0m
echo.

::=============================================================================

echo.
echo !ESC![31m "===============================================================";!ESC![0m
echo !ESC![31m "           _____   ____  ______ _______ _______     __         ";!ESC![0m
echo !ESC![31m "          |  __ \ / __ \|  ____|__   __|  __ \ \   / /         ";!ESC![0m
echo !ESC![31m "          | |__) | |  | | |__     | |  | |__) \ \_/ /          ";!ESC![0m
echo !ESC![31m "          |  ___/| |  | |  __|    | |  |  _  / \   /           ";!ESC![0m
echo !ESC![31m "          | |    | |__| | |____   | |  | | \ \  | |            ";!ESC![0m
echo !ESC![31m "          |_|     \____/|______|  |_|  |_|  \_\ |_|            ";!ESC![0m
echo !ESC![31m "                                                               ";!ESC![0m
echo !ESC![31m "===============================================================";!ESC![0m
echo.

::=============================================================================

call poetry install --no-root

if %ERRORLEVEL% neq 0 (
    echo "Error: Poetry install failed."
    exit /b %ERRORLEVEL%
)

::=============================================================================

echo.
echo !ESC![33m "===============================================================";!ESC![0m
echo !ESC![33m "           _   _ _____  __  __                                 ";!ESC![0m
echo !ESC![33m "          | \ | |  __ \|  \/  |                                ";!ESC![0m
echo !ESC![33m "          |  \| | |__) | \  / |                                ";!ESC![0m
echo !ESC![33m "          | . \ |  ___/| |\/| |                                ";!ESC![0m
echo !ESC![33m "          | |\  | |    | |  | |                                ";!ESC![0m
echo !ESC![33m "          |_| \_|_|    |_|  |_|                                ";!ESC![0m
echo !ESC![33m "                                                               ";!ESC![0m
echo !ESC![33m "===============================================================";!ESC![0m
echo.

::=============================================================================

call npm install htmx.org tailwindcss @tailwindcss/typography @tailwindcss/forms @tailwindcss/aspect-ratio @tailwindcss/container-queries

if %ERRORLEVEL% neq 0 (
    echo "Error: NPM install failed."
    exit /b %ERRORLEVEL%
)

::=============================================================================

echo.
echo !ESC![32m "===============================================================";!ESC![0m
echo !ESC![32m "           _____ _   _ _____ _______                           ";!ESC![0m
echo !ESC![32m "          |_   _| \ | |_   _|__   __|                          ";!ESC![0m
echo !ESC![32m "            | | |  \| | | |    | |                             ";!ESC![0m
echo !ESC![32m "            | | | . \ | | |    | |                             ";!ESC![0m
echo !ESC![32m "           _| |_| |\  |_| |_   | |                             ";!ESC![0m
echo !ESC![32m "          |_____|_| \_|_____|  |_|                             ";!ESC![0m
echo !ESC![32m "                                                               ";!ESC![0m
echo !ESC![32m "===============================================================";!ESC![0m

::=============================================================================

call npx tailwindcss -i frontend/static/css/style.css -o frontend/static/css/tailwind.css

copy ".\node_modules\htmx.org\dist\htmx.min.js" "frontend\static\js"

if %ERRORLEVEL% neq 0 (
    echo "Error: Init failed."
    exit /b %ERRORLEVEL%
)

::=============================================================================
:: EXFILTRATE!!
::=============================================================================

echo.
exit /b 0

::= EOF =======================================================================

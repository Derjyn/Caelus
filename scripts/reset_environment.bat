@echo off
::=============================================================================
:: CAELUS ENVIRONMENT RESET SCRIPT
:: reset_environment.bat
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
echo !ESC![36m "              PERMORMING ENVIRONMENT RESET...                  ";!ESC![0m
echo !ESC![36m "===============================================================";!ESC![0m
echo.

::=============================================================================

echo.
echo !ESC![36m "              DESTROYING DIRECTORIES...                        ";!ESC![0m

::=============================================================================

:: Delete directories
call :check_and_delete ".venv"
call :check_and_delete "node_modules"
call :check_and_delete "frontend\dist"
call :check_and_delete "backend\__pycache__"
call :check_and_delete "backend\app\__pycache__"
call :check_and_delete "backend\app\routers\__pycache__"
call :check_and_delete "backend\app\services\__pycache__"

::=============================================================================

echo !ESC![36m "              SHREDDING FILES...                               ";!ESC![0m

::=============================================================================

:: Delete files
call :delete_file "package-lock.json"
call :delete_file "poetry.lock"
call :delete_file "frontend\static\css\tailwind.css"
call :delete_file "frontend\static\js\htmx.min.js"
call :delete_file "frontend\static\js\lucide.min.js"

::=============================================================================

:: Function to check directory existence and delete it
:check_and_delete
if exist "%~1" (
    rmdir /s /q "%~1"
    if %ERRORLEVEL% neq 0 (
        echo Error deleting %~1
        exit /b %ERRORLEVEL%
    )
) else (
    echo Directory %~1 not found, skipping...
)
exit /b 0

::=============================================================================

:: Function to delete specific files
:delete_file
if exist "%~1" (
    del /q "%~1"
    if %ERRORLEVEL% neq 0 (
        echo Error deleting file %~1
        exit /b %ERRORLEVEL%
    )
) else (
    echo File %~1 not found, skipping...
)
exit /b 0

::=============================================================================
:: EXFILTRATE!!
::=============================================================================

echo.
exit /b 0

::= EOF =======================================================================

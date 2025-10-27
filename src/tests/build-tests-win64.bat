@echo off
REM Build HolocronTests for Win64

echo.
echo ========================================
echo Building HolocronTests (Win64)...
echo ========================================
echo.

REM Create output directories if they don't exist
if not exist Win64\Debug mkdir Win64\Debug
if not exist Win64\Debug\dcu mkdir Win64\Debug\dcu

REM Compile tests with correct paths
dcc64 -B -U..\..\lib\DUnitX\Source;.. -E.\Win64\Debug -N.\Win64\Debug\dcu HolocronTests.dpr

if errorlevel 1 (
    echo.
    echo ========================================
    echo Build FAILED!
    echo ========================================
    pause
    exit /b 1
)

echo.
echo ========================================
echo Build successful!
echo ========================================
pause


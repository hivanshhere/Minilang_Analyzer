@echo off
setlocal
cd /d "%~dp0"

echo Building MiniLang compiler...
gcc -Wall -Wextra -std=c11 main.c lexer.c parser.c semantic.c tree.c tac.c -o minilang.exe
if errorlevel 1 (
    echo.
    echo C compiler build failed.
    pause
    exit /b 1
)

echo Building MiniLang IDE...
javac -encoding UTF-8 MiniLangIDE.java
if errorlevel 1 (
    echo.
    echo Java IDE build failed.
    pause
    exit /b 1
)

echo Starting MiniLang IDE...
java MiniLangIDE

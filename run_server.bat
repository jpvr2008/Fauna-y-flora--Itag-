@echo off
REM Buscar php en PATH
where php >nul 2>&1
if %ERRORLEVEL%==0 (
  set "PHP_EXE=php"
) else (
  set "PHP_EXE="
  if exist "C:\php\php.exe" set "PHP_EXE=C:\php\php.exe"
  if "%PHP_EXE%"=="" if exist "C:\Program Files\PHP\php.exe" set "PHP_EXE=C:\Program Files\PHP\php.exe"
  if "%PHP_EXE%"=="" if exist "C:\Program Files (x86)\PHP\php.exe" set "PHP_EXE=C:\Program Files (x86)\PHP\php.exe"
  if "%PHP_EXE%"=="" if exist "C:\xampp\php\php.exe" set "PHP_EXE=C:\xampp\php\php.exe"
  if "%PHP_EXE%"=="" if exist "C:\wamp\bin\php\php.exe" set "PHP_EXE=C:\wamp\bin\php\php.exe"
  if "%PHP_EXE%"=="" if exist "C:\wamp64\bin\php\php.exe" set "PHP_EXE=C:\wamp64\bin\php\php.exe"
)

if "%PHP_EXE%"=="" (
  echo.
  echo ERROR: No se encontró php.exe.
  echo - Instala PHP y añade su carpeta (la que contiene php.exe) al PATH de Windows.
  echo - O instala XAMPP/WAMP, o copia php.exe a C:\php\
  echo.
  echo Comandos útiles:
  echo   php -v   (comprueba si PHP está en PATH)
  echo   where php
  echo.
  pause
  exit /b 1
)

echo Usando: %PHP_EXE%
echo Iniciando servidor en http://localhost:8000/ (presiona CTRL+C para parar)
"%PHP_EXE%" -S localhost:8000 -t admin

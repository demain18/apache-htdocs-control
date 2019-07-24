@echo off

dir /a:d /b > apacheServers.txt
type apacheServers.txt
echo.
: echo plase insert server directory 
: set /p dir=Choose directory:
set dir=%cd%
set /p server=Choose server:


set file=C:\xampp\apache\conf\httpd.conf
set newline=DocumentRoot "%dir%\%server%"
set insertline=252

: REM Use Set Output=Con to send to screen without amending code, or set it to a filename to make a new file
set output=C:\xampp\apache\conf\httpd_phase2.conf

(for /f "tokens=1* delims=[]" %%a in ('find /n /v "##" ^< "%file%"') do (
if "%%~a"=="%insertline%" (
echo %newline%
REM ECHO.%%b
) ELSE (
echo.%%b
)
)) > %output%

: REM Shows output file, remove if wanted


set file=C:\xampp\apache\conf\httpd_phase2.conf
set newline=^^^<Directory "%dir%\%server%"^^^>
set insertline=253

: REM Use Set Output=Con to send to screen without amending code, or set it to a filename to make a new file
set output=C:\xampp\apache\conf\httpd.conf

(for /f "tokens=1* delims=[]" %%a in ('find /n /v "##" ^< "%file%"') do (
if "%%~a"=="%insertline%" (
echo %newline%
REM ECHO.%%b
) ELSE (
echo.%%b
)
)) > %output%

del %dir%\apacheServers.txt
del C:\xampp\apache\conf\httpd_phase2.conf
: ren %dir%\httpd_phase3 %dir%\httpd.conf

echo.
echo server directory: '%dir%\%server%'
echo server folder has been changed as '%server%'

echo press any key to exit.
pause>nul
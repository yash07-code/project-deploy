@echo off

if not ""%1"" == ""START"" goto stop

cmd.exe /C start /B /MIN "" "D:\optical_shop(yash)\apache\bin\httpd.exe"

if errorlevel 255 goto finish
if errorlevel 1 goto error
goto finish

:stop
cmd.exe /C start "" /MIN call "D:\optical_shop(yash)\killprocess.bat" "httpd.exe"

if not exist "D:\optical_shop(yash)\apache\logs\httpd.pid" GOTO finish
del "D:\optical_shop(yash)\apache\logs\httpd.pid"
goto finish

:error
echo Error starting Apache

:finish
exit 


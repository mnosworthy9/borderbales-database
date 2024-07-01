@REM goes into admin console 
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

@REM sets the environmental variables
call .env.bat

@REM moves to the directory that psql.exe is located 
cd "C:\Program Files\PostgreSQL\14\bin"

@REM var to make code easier to read
set CONNECT=psql -f

@REM running all of the files containing postgreSQL
%CONNECT% "C:\\Users\\User\\Documents\\my-website\\database\\drop tables.pgsql" 
%CONNECT% "C:\\Users\\User\\Documents\\my-website\\database\\user table.pgsql" 
%CONNECT% "C:\Users\User\Documents\my-website\database\bank_details table.pgsql" 
%CONNECT% "C:\Users\User\Documents\my-website\database\refresh token table.pgsql" 
%CONNECT% "C:\Users\User\Documents\my-website\database\product table.pgsql"
%CONNECT% "C:\Users\User\Documents\my-website\database\image table.pgsql"
%CONNECT% "C:\Users\User\Documents\my-website\database\review table.pgsql"
%CONNECT% "C:\Users\User\Documents\my-website\database\order table.pgsql"
%CONNECT% "C:\Users\User\Documents\my-website\database\inserts.pgsql"
%CONNECT% "C:\Users\User\Documents\my-website\database\selects.pgsql"

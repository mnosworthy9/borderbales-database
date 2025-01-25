@REM goes into admin console 
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

@REM sets the environmental variables
call .env.bat

@REM moves to the directory that psql.exe is located 
cd "C:\Program Files\PostgreSQL\17\bin"

@REM var to make code easier to read
set CONNECT=psql -f

@REM running all of the files containing postgreSQL
%CONNECT% "C:\Users\mnosw\Documents\BorderBales\Database\sql\01_UserTable.pgsql"
%CONNECT% "C:\Users\mnosw\Documents\BorderBales\Database\sql\02_ProductTable.pgsql" 
%CONNECT% "C:\Users\mnosw\Documents\BorderBales\Database\sql\03_BankDetailsTable.pgsql" 
%CONNECT% "C:\Users\mnosw\Documents\BorderBales\Database\sql\04_RefreshTokenTable.pgsql" 
%CONNECT% "C:\Users\mnosw\Documents\BorderBales\Database\sql\05_OrderTable.pgsql"
%CONNECT% "C:\Users\mnosw\Documents\BorderBales\Database\sql\06_ImageTable.pgsql"
%CONNECT% "C:\Users\mnosw\Documents\BorderBales\Database\sql\07_ReviewTable.pgsql"

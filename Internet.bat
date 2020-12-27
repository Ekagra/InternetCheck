@echo off
:start
echo Processing is on...
set infs=0
PING -n 1 www.google.com|find "Reply from " >NUL
IF NOT ERRORLEVEL 1 goto :SUCCESS
IF     ERRORLEVEL 1 goto :TRYAGAIN

:TRYAGAIN
PING -n 3 www.google.com|find "Reply from " >NUL
IF NOT ERRORLEVEL 1 goto :SUCCESS2
IF     ERRORLEVEL 1 goto :TRYIP

:TRYIP
ping -n 1 216.239.37.99|find "Reply from " >NUL
IF NOT ERRORLEVEL 1 goto :SUCCESSDNS
IF     ERRORLEVEL 1 goto :TRYROUTER

:TRYROUTER
ping -n 2 192.168.1.1|find "Reply from " >NUL
IF NOT ERRORLEVEL 1 goto :ROUTERSUCCESS
IF     ERRORLEVEL 1 goto :NETDOWN

:ROUTERSUCCESS
goto :FAILURE

:NETDOWN
goto :FAILURE

:SUCCESSDNS
goto :FAILURE

:SUCCESS
goto cnfw

:SUCCESS2
goto cnfw

:FAILURE
@echo off
set infs=0
PING -n 1 www.google.com|find "Reply from " >NUL
IF NOT ERRORLEVEL 1 goto :SUCCESS
IF     ERRORLEVEL 1 goto :TRYAGAIN

:TRYAGAIN
PING -n 3 www.google.com|find "Reply from " >NUL
IF NOT ERRORLEVEL 1 goto :SUCCESS2
IF     ERRORLEVEL 1 goto :TRYIP

:TRYIP
ping -n 1 216.239.37.99|find "Reply from " >NUL
IF NOT ERRORLEVEL 1 goto :SUCCESSDNS
IF     ERRORLEVEL 1 goto :TRYROUTER

:TRYROUTER
ping -n 2 192.168.1.1|find "Reply from " >NUL
IF NOT ERRORLEVEL 1 goto :ROUTERSUCCESS
IF     ERRORLEVEL 1 goto :NETDOWN

:ROUTERSUCCESS
goto :FAILURE

:NETDOWN
goto :FAILURE

:SUCCESSDNS
goto :FAILURE

:SUCCESS
set /a infs=0
goto cnfw

:SUCCESS2
set /a infs=0
goto cnfw

:FAILURE
set /a infs=1
goto cnfw
:cnfw
IF %infs% EQU 1 goto nofw
IF %infs% EQU 0 goto niwf
:niwf
cls
set numagainhi=%random%
echo ' > "temp%numagainhi%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%numagainhi%.vbs"
echo speech.speak "Hey, Internet is now active." >> "temp%numagainhi%.vbs"
start temp%numagainhi%.vbs
timeout /nobreak 1 >nul
del temp%numagainhi%.vbs
color df
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                 Internet Is Active
echo.                                                          
echo.                                
echo.                                                  
echo.                               
echo.
echo.
echo.
echo.
echo.
echo.
echo.
timeout /nobreak 4 >nul
goto niwfa
:niwfa
cls
color fd
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                 Internet Is Active
echo.                                                          
echo.                                
echo.                                                  
echo.                               
echo.
echo.
echo.
echo.
echo.
echo.
echo.
timeout /nobreak 4 >nul
goto niwf
:nofw
cls
goto start
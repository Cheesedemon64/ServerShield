@echo off
title Port-A-Shield Laptop Security
color 0a

REM ================================================
REM ServerShield Security Suite
REM Copyright (c) 2025 Cheesedemon64
REM Licensed under Cheesedemon64 Anti-Corporate License v1.0
REM 
REM 🆓 Community use: FREE
REM 💰 Corporate use: Commercial license required
REM 🚫 Nintendo: BANNED 
REM 
REM Contact: OTYTbuisness@outlook.com
REM GitHub: https://github.com/Cheesedemon64/ServerShield
REM 
REM This software is protected by copyright law.
REM Unauthorized corporate use will result in legal action.
REM 
REM "Corporate security for EVERYONE - except corporate jerks!"
REM ================================================

REM PORT-A-SHIELD Laptop Security System
REM Portable protection for mobile Windows systems
REM 
REM Security Components:
REM - THE_BLACK_CAT: Two-factor authentication 
REM - TARTEUS: Emergency alert system (Greek: Tartarus)
REM - SINEVA: Suspicious file detection (Delta Force)
REM - MOBILE-GUARD: Laptop-specific security features
REM
REM Created by: Cheesedemon64
REM Optimized for laptops, mobile work, and remote access
REM Windows Phone can go to hell! Long live real Windows!
REM 
REM GitHub: https://github.com/Cheesedemon64/Port-A-Shield
REM ================================================

REM Laptop-optimized configuration
set CORRECT_PASSWORD_HASH=5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8
set CORRECT_PASSKEY_HASH=ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f
set MOBILE_SERVER_URL=https://mobile-security.example.com/api/laptop-alert
set BATTERY_CHECK=true
set WIFI_SECURITY_CHECK=true

REM Check if running on laptop (battery present)
powercfg /batteryreport /output temp_battery.html >nul 2>&1
if exist temp_battery.html (
    set LAPTOP_DETECTED=true
    del temp_battery.html >nul 2>&1
) else (
    set LAPTOP_DETECTED=false
)

echo ================================================
echo            Port-A-Shield Security
echo         Laptop Protection System
echo.
echo        THE_BLACK_CAT Authentication
echo         with TARTEUS Alert System
echo           SINEVA File Detection
echo           MOBILE-GUARD Active
echo.
if "%LAPTOP_DETECTED%"=="true" (
    echo       Status: Laptop Mode Detected
) else (
    echo       Status: Desktop Mode
)
echo           Created by: Cheesedemon64
echo ================================================
echo.

REM Pre-authentication laptop security checks
call :mobile_security_check

REM Step 1: Password (REQUIRED)
set /p USER_PASSWORD="Enter Password: "

REM Hash the entered password for secure comparison
echo %USER_PASSWORD%| certutil -hashfile - SHA256 | findstr /v "SHA256" | findstr /v "CertUtil" > temp_hash.txt
set /p USER_PASSWORD_HASH=<temp_hash.txt
del temp_hash.txt >nul 2>&1

if NOT "%USER_PASSWORD_HASH%"=="%CORRECT_PASSWORD_HASH%" (
    echo.
    echo INCORRECT PASSWORD
    goto :authentication_failed
)

echo Password verified.
echo.

REM Step 2: Passkey (ALSO REQUIRED)
set /p USER_PASSKEY="Enter Passkey: "

REM Hash the entered passkey for secure comparison
echo %USER_PASSKEY%| certutil -hashfile - SHA256 | findstr /v "SHA256" | findstr /v "CertUtil" > temp_hash2.txt
set /p USER_PASSKEY_HASH=<temp_hash2.txt
del temp_hash2.txt >nul 2>&1

if NOT "%USER_PASSKEY_HASH%"=="%CORRECT_PASSKEY_HASH%" (
    echo.
    echo INCORRECT PASSKEY
    goto :authentication_failed
)

REM BOTH correct - access granted!
echo Passkey verified.
echo.
echo FULL AUTHENTICATION SUCCESSFUL
goto :laptop_system_access

REM ===========================================
REM LAPTOP-SPECIFIC SECURITY CHECKS
REM ===========================================
:mobile_security_check
echo MOBILE-GUARD: Running laptop security checks...

REM Check battery status for power management
if "%LAPTOP_DETECTED%"=="true" (
    for /f "tokens=2 delims=," %%i in ('wmic path Win32_Battery get EstimatedChargeRemaining /format:csv ^| findstr /v "Node"') do (
        if not "%%i"=="" (
            if %%i LSS 20 (
                echo WARNING: Low battery detected (%%i%%). Consider plugging in.
            )
        )
    )
)

REM Check WiFi security
netsh wlan show interfaces | findstr /i "state.*connected" >nul
if !errorlevel! equ 0 (
    echo WiFi connection detected. Checking security...
    netsh wlan show interfaces | findstr /i "authentication.*open" >nul
    if !errorlevel! equ 0 (
        color 0e
        echo WARNING: Connected to unsecured WiFi network!
        echo Consider using VPN for additional security.
        timeout /t 2 /nobreak >nul
        color 0a
    )
)

REM Check for USB devices (common attack vector on laptops)
for /f "skip=1" %%d in ('wmic logicaldisk where drivetype^=2 get caption') do (
    if not "%%d"=="" (
        echo USB device detected: %%d - Running security scan...
        call :check_usb_security "%%d"
    )
)

echo MOBILE-GUARD: Security checks complete.
echo.
goto :eof

:check_usb_security
set USB_DRIVE=%~1
if exist "%USB_DRIVE%\autorun.inf" (
    echo WARNING: USB autorun file detected on %USB_DRIVE%
)
goto :eof

REM ===========================================
REM AUTHENTICATION FAILED - MOBILE EMERGENCY
REM ===========================================
:authentication_failed
echo.
echo AUTHENTICATION FAILED
echo Alerting mobile security operations...
echo.

call :trigger_mobile_emergency_response

echo Access denied. Laptop secured.
if "%LAPTOP_DETECTED%"=="true" (
    echo Initiating laptop sleep mode for additional security...
    rundll32.exe powrprof.dll,SetSuspendState 0,1,0
)
pause
exit

REM ===========================================
REM LAPTOP SUCCESS - MOBILE-OPTIMIZED ACCESS
REM ===========================================
:laptop_system_access
color 0a
echo.
echo Welcome to your secure laptop system!
echo Mobile authentication successful.

REM Clear sensitive variables from memory for security
set USER_PASSWORD=
set USER_PASSKEY=

echo Loading mobile security modules...
echo - THE_BLACK_CAT: Authentication complete
echo - TARTEUS: Mobile alert system active  
echo - SINEVA: File detection online
echo - MOBILE-GUARD: Laptop protection active
echo - ctOS: Monitoring and logic systems active

if "%LAPTOP_DETECTED%"=="true" (
    echo - POWER-GUARD: Battery monitoring enabled
    echo - WIFI-GUARD: Network security active
)

timeout /t 2 /nobreak >nul
echo Port-A-Shield systems ready for mobile work.

REM Start background mobile security monitoring
start /min cmd /c call :background_mobile_monitoring

pause
REM Your laptop system operations here
goto :eof

REM ===========================================
REM BACKGROUND MOBILE MONITORING
REM ===========================================
:background_mobile_monitoring
REM Continuous monitoring for mobile threats
:monitor_loop
timeout /t 60 /nobreak >nul

REM Check for new WiFi connections
netsh wlan show interfaces | findstr /i "state.*connected" | findstr /i "authentication.*open" >nul
if !errorlevel! equ 0 (
    echo %date% %time% - WARNING: Insecure WiFi detected >> mobile_security.log
)

REM Monitor USB activity
for /f "skip=1" %%d in ('wmic logicaldisk where drivetype^=2 get caption 2^>nul') do (
    if not "%%d"=="" (
        echo %date% %time% - USB activity: %%d >> mobile_security.log
    )
)

goto monitor_loop

REM ===========================================
REM MOBILE EMERGENCY RESPONSE SYSTEM
REM ===========================================
:trigger_mobile_emergency_response
echo Initiating mobile emergency security protocol...

REM System information with mobile context
set HOSTNAME=%COMPUTERNAME%
for /f "tokens=1-3" %%a in ('date /t') do set ALERT_DATE=%%a %%b %%c
for /f "tokens=1-2" %%a in ('time /t') do set ALERT_TIME=%%a %%b

REM Get location context (WiFi network name for geo-context)
for /f "tokens=2 delims=:" %%i in ('netsh wlan show interfaces ^| findstr /i "SSID"') do set WIFI_SSID=%%i

REM Check for SQL injection attempts (mobile version)
set INJECTION_DETECTED=false
echo %USER_PASSWORD% | findstr /i "select\|insert\|update\|delete\|drop\|union\|script\|exec\|declare\|';--\|'OR\|'AND\|1=1\|admin'--" >nul
if !errorlevel! equ 0 set INJECTION_DETECTED=true

echo %USER_PASSKEY% | findstr /i "select\|insert\|update\|delete\|drop\|union\|script\|exec\|declare\|';--\|'OR\|'AND\|1=1\|admin'--" >nul
if !errorlevel! equ 0 set INJECTION_DETECTED=true

if "%INJECTION_DETECTED%"=="true" (
    color 0c
    echo.
    echo =========================================
    echo            NICE TRY! :D
    echo   SQL Injection attempt detected!
    echo   Port-A-Shield has caught you!
    echo =========================================
    echo.
    call :alert_mobile_injection_attempt
    timeout /t 3 /nobreak >nul
    echo Laptop secured. Goodbye mobile hacker!
    pause
    exit
)

REM Sanitize inputs
set CLEAN_PASSWORD=%USER_PASSWORD:"=%
set CLEAN_PASSWORD=%CLEAN_PASSWORD:'=%
set CLEAN_PASSWORD=%CLEAN_PASSWORD:&=%
set CLEAN_PASSWORD=%CLEAN_PASSWORD:|=%
set CLEAN_PASSWORD=%CLEAN_PASSWORD:;=%
set CLEAN_PASSWORD=%CLEAN_PASSWORD:<%=%
set CLEAN_PASSWORD=%CLEAN_PASSWORD:>=%
if defined CLEAN_PASSWORD set CLEAN_PASSWORD=%CLEAN_PASSWORD:~0,50%

set CLEAN_PASSKEY=%USER_PASSKEY:"=%
set CLEAN_PASSKEY=%CLEAN_PASSKEY:'=%
set CLEAN_PASSKEY=%CLEAN_PASSKEY:&=%
set CLEAN_PASSKEY=%CLEAN_PASSKEY:|=%
set CLEAN_PASSKEY=%CLEAN_PASSKEY:;=%
set CLEAN_PASSKEY=%CLEAN_PASSKEY:<%=%
set CLEAN_PASSKEY=%CLEAN_PASSKEY:>=%
if defined CLEAN_PASSKEY set CLEAN_PASSKEY=%CLEAN_PASSKEY:~0,50%

REM Create mobile security alert
set MOBILE_ALERT={"event":"MOBILE_TWO_FACTOR_AUTH_FAILURE","device_type":"laptop","hostname":"%HOSTNAME%","date":"%ALERT_DATE%","time":"%ALERT_TIME%","wifi_network":"%WIFI_SSID%","attempted_password_hash":"%USER_PASSWORD_HASH%","attempted_passkey_hash":"%USER_PASSKEY_HASH%","alert_level":"CRITICAL","platform":"Port-A-Shield"}

REM Send alert to mobile security server
curl -X POST "%MOBILE_SERVER_URL%" ^
     -H "Content-Type: application/json" ^
     -H "X-Mobile-Security: Port-A-Shield" ^
     -d "%MOBILE_ALERT%" ^
     --connect-timeout 10 ^
     --max-time 30

if %errorlevel% equ 0 (
    echo Mobile Security Operations contacted.
    echo Global Threat Initiative responding...
    echo Downloading mobile emergency response...
    
    REM Download mobile-specific emergency files
    curl -o "mobile_breach_response.bat" "%MOBILE_SERVER_URL%/mobile_breach_response" --max-time 30
    curl -o "laptop_lockdown.exe" "%MOBILE_SERVER_URL%/laptop_lockdown" --max-time 30
    
    echo Global Threat Initiative mobile files downloaded.
    echo Executing laptop security protocols...
    
    if exist "mobile_breach_response.bat" (
        echo Running mobile breach response...
        call mobile_breach_response.bat
    )
    
    if exist "laptop_lockdown.exe" (
        echo Activating laptop lockdown...
        start laptop_lockdown.exe
    )
    
    echo Mobile emergency protocols activated.
    
) else (
    echo Mobile server contact failed. Activating local laptop security...
    
    REM Local mobile emergency procedures
    echo %ALERT_DATE% %ALERT_TIME% - MOBILE AUTH FAILURE on %HOSTNAME% >> mobile_security_incidents.log
    echo WiFi Network: %WIFI_SSID% >> mobile_security_incidents.log
    echo Password hash attempt: %USER_PASSWORD_HASH% >> mobile_security_incidents.log
    echo Passkey hash attempt: %USER_PASSKEY_HASH% >> mobile_security_incidents.log
    
    REM Lock the laptop
    echo Locking laptop system...
    rundll32.exe user32.dll,LockWorkStation
)

REM Clear sensitive variables from memory
set USER_PASSWORD=
set USER_PASSKEY=
set CLEAN_PASSWORD=
set CLEAN_PASSKEY=

goto :eof

REM ===========================================
REM MOBILE SQL INJECTION HANDLER
REM ===========================================
:alert_mobile_injection_attempt
echo Alerting mobile security about injection attempt...

set HOSTNAME=%COMPUTERNAME%
for /f "tokens=1-3" %%a in ('date /t') do set INJECT_DATE=%%a %%b %%c
for /f "tokens=1-2" %%a in ('time /t') do set INJECT_TIME=%%a %%b

REM Create mobile injection alert
set MOBILE_INJECTION_ALERT={"event":"MOBILE_SQL_INJECTION_ATTEMPT","device_type":"laptop","hostname":"%HOSTNAME%","date":"%INJECT_DATE%","time":"%INJECT_TIME%","attack_type":"SQL_INJECTION","alert_level":"CRITICAL","message":"Mobile hacker detected and taunted","platform":"Port-A-Shield"}

curl -X POST "%MOBILE_SERVER_URL%" ^
     -H "Content-Type: application/json" ^
     -H "X-Mobile-Security: Port-A-Shield" ^
     -d "%MOBILE_INJECTION_ALERT%" ^
     --connect-timeout 5 ^
     --max-time 15

if %errorlevel% equ 0 (
    echo Mobile security alerted about laptop hacker attempt.
    echo Global Threat Initiative dispatched.
) else (
    echo %INJECT_DATE% %INJECT_TIME% - MOBILE SQL INJECTION on %HOSTNAME% >> mobile_hacker_attempts.log
)

goto :eof

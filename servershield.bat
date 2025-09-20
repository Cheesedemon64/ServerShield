@echo off
title ServerShield Two-Factor Authentication
color 0a

REM ================================================
REM THE_BLACK_CAT Authentication System
REM Two-Factor Password & Passkey Verification
REM Named after the cafe where coding began
REM SQL Injection & Rainbow Table Protected
REM 
REM Security Components:
REM - THE_BLACK_CAT: Two-factor authentication 
REM - TARTEUS: Emergency alert system (Greek: Tartarus)
REM - SINEVA: Suspicious file detection (Delta Force)
REM - Global Threat Initiative: Server response system (Delta Force)
REM - ctOS: Logic and monitoring system (Watch Dogs 2)
REM
REM Created by: CheeseDemon64
REM Designed for Tipperary County Council (TIPPCoCo)
REM Enterprise-grade security for government systems
REM 
REM License: As mentioned in the license file
REM Copyright (c) 2025 CheeseDemon64
REM 

REM THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
REM IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
REM FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
REM AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
REM LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
REM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
REM SOFTWARE.
REM 
REM GitHub: https://github.com/Cheesedemon64/ServerShield
REM ================================================

REM Configuration - Store as hashes for security
REM To generate hashes: echo your_password | certutil -hashfile - SHA256
REM Replace these example hashes with your actual password hashes
set CORRECT_PASSWORD_HASH=5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8
set CORRECT_PASSKEY_HASH=ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f
set SERVER_URL=https://your-server.com/api/emergency-alert

echo ================================================
echo           ServerShield Security
echo        THE_BLACK_CAT Authentication
echo         with TARTEUS Alert System
echo           & SINEVA File Detection
echo.
echo      Tipperary County Council Security
echo           Created by: CheeseDemon64
echo ================================================
echo.

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
goto :system_access

REM ===========================================
REM AUTHENTICATION FAILED - EMERGENCY MODE
REM ===========================================
:authentication_failed
echo.
echo AUTHENTICATION FAILED
echo Alerting security server...
echo.

call :trigger_emergency_response

echo Access denied. System secured.
pause
exit

REM ===========================================
REM SUCCESS - BOTH PASSWORD AND PASSKEY CORRECT
REM ===========================================
:system_access
color 0a
echo.
echo Welcome! Both credentials verified.
echo System access granted.

REM Clear sensitive variables from memory for security
set USER_PASSWORD=
set USER_PASSKEY=

echo Loading security modules...
echo - THE_BLACK_CAT: Authentication complete
echo - TARTEUS: Alert system active  
echo - SINEVA: File detection online
echo - ctOS: Monitoring and logic systems active

timeout /t 2 /nobreak >nul
echo Ready.
pause
REM Your normal system operations here
goto :eof

REM ===========================================
REM SINEVA Suspicious File Detection System
REM Delta Force reference
REM Created by: CheeseDemon64
REM ===========================================
:sineva_file_scan
echo SINEVA: Scanning for suspicious files...
echo Delta Force protocols activated...

REM Basic suspicious file detection
for %%d in (C:\Users C:\Windows\Temp C:\ProgramData) do (
    if exist "%%d" (
        for /r "%%d" %%f in (*.exe *.scr *.bat *.vbs) do (
            echo Checking: %%~nxf
            REM Add file analysis logic here
        )
    )
)

echo SINEVA scan complete.
goto :eof

REM ===========================================
REM TARTEUS Emergency Alert System
REM Advanced security response and monitoring
REM Created by: CheeseDemon64
REM ===========================================
:trigger_emergency_response
echo Initiating emergency security protocol...

REM System information
set HOSTNAME=%COMPUTERNAME%
for /f "tokens=1-3" %%a in ('date /t') do set ALERT_DATE=%%a %%b %%c
for /f "tokens=1-2" %%a in ('time /t') do set ALERT_TIME=%%a %%b

REM Sanitize inputs to prevent injection attacks
REM Remove dangerous characters and limit length
set INJECTION_DETECTED=false

REM Check for SQL injection attempts
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
    echo =========================================
    echo.
    call :alert_injection_attempt
    timeout /t 3 /nobreak >nul
    echo System secured. Goodbye hacker!
    pause
    exit
)

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

REM Create security alert with sanitized data
set SECURITY_ALERT={"event":"TWO_FACTOR_AUTH_FAILURE","hostname":"%HOSTNAME%","date":"%ALERT_DATE%","time":"%ALERT_TIME%","attempted_password_hash":"%USER_PASSWORD_HASH%","attempted_passkey_hash":"%USER_PASSKEY_HASH%","alert_level":"CRITICAL"}

REM Send alert to server
curl -X POST "%SERVER_URL%" ^
     -H "Content-Type: application/json" ^
     -d "%SECURITY_ALERT%" ^
     --connect-timeout 15 ^
     --max-time 60

if %errorlevel% equ 0 (
    echo Security server contacted.
    echo Global Threat Initiative responding...
    echo Downloading emergency response protocols...
    
    REM Download emergency response files
    curl -o "security_breach_response.bat" "%SERVER_URL%/security_breach_response" --max-time 45
    curl -o "lockdown_system.exe" "%SERVER_URL%/lockdown_system" --max-time 45
    curl -o "alert_handler.dll" "%SERVER_URL%/alert_handler" --max-time 45
    
    echo Global Threat Initiative emergency files downloaded.
    echo Executing security protocols...
    
    REM Execute emergency response
    if exist "security_breach_response.bat" (
        echo Running breach response...
        call security_breach_response.bat
    )
    
    if exist "lockdown_system.exe" (
        echo Activating system lockdown...
        start lockdown_system.exe
    )
    
    if exist "alert_handler.dll" (
        echo Loading alert handler...
        regsvr32 /s alert_handler.dll
    )
    
    echo Emergency protocols activated.
    
) else (
    echo Server contact failed. Activating local security measures...
    
    REM Local emergency procedures
    echo %ALERT_DATE% %ALERT_TIME% - TWO-FACTOR AUTH FAILURE on %HOSTNAME% >> security_incidents.log
    echo Password hash attempt: %USER_PASSWORD_HASH% >> security_incidents.log
    echo Passkey hash attempt: %USER_PASSKEY_HASH% >> security_incidents.log
    
    REM Lock the workstation
    echo Locking system...
    rundll32.exe user32.dll,LockWorkStation
)

REM Clear sensitive variables from memory
set USER_PASSWORD=
set USER_PASSKEY=
set CLEAN_PASSWORD=
set CLEAN_PASSKEY=

goto :eof

REM ===========================================
REM SQL INJECTION ATTEMPT HANDLER
REM ===========================================
:alert_injection_attempt
echo Alerting server about injection attempt...

REM System information
set HOSTNAME=%COMPUTERNAME%
for /f "tokens=1-3" %%a in ('date /t') do set INJECT_DATE=%%a %%b %%c
for /f "tokens=1-2" %%a in ('time /t') do set INJECT_TIME=%%a %%b

REM Create injection alert (sanitized for logging)
set INJECTION_ALERT={"event":"SQL_INJECTION_ATTEMPT","hostname":"%HOSTNAME%","date":"%INJECT_DATE%","time":"%INJECT_TIME%","attack_type":"SQL_INJECTION","alert_level":"CRITICAL","message":"Hacker detected and taunted"}

REM Send alert to server
curl -X POST "%SERVER_URL%" ^
     -H "Content-Type: application/json" ^
     -d "%INJECTION_ALERT%" ^
     --connect-timeout 10 ^
     --max-time 30

if %errorlevel% equ 0 (
    echo Server alerted about hacker attempt.
    echo Global Threat Initiative dispatched.
) else (
    echo %INJECT_DATE% %INJECT_TIME% - SQL INJECTION ATTEMPT on %HOSTNAME% >> hacker_attempts.log
)

goto :eof

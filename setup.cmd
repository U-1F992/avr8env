@echo off

whoami /priv | find "SeDebugPrivilege" > nul
if %ERRORLEVEL% neq 0 (
    powershell -Command Start-Process %0 -Verb RunAs
    exit
)
cd "%~dp0"

mkdir .avr8
fsutil file setCaseSensitiveInfo .avr8 enable
cd .avr8

powershell -Command Invoke-WebRequest -Uri "https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/avr8-gnu-toolchain-3.7.0.1796-win32.any.x86_64.zip" -OutFile avr8-gnu-toolchain-3.7.0.1796-win32.any.x86_64.zip
powershell -Command Expand-Archive -Path avr8-gnu-toolchain-3.7.0.1796-win32.any.x86_64.zip -DestinationPath .\
del avr8-gnu-toolchain-3.7.0.1796-win32.any.x86_64.zip

powershell -Command Invoke-WebRequest -Uri "https://github.com/avrdudes/avrdude/releases/download/v7.3/avrdude-v7.3-windows-x64.zip" -OutFile avrdude-v7.3-windows-x64.zip
powershell -Command Expand-Archive -Path avrdude-v7.3-windows-x64.zip -DestinationPath avrdude-v7.3-windows-x64
del avrdude-v7.3-windows-x64.zip

pause
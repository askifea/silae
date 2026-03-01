@echo off
title Deploiement Silae - Groupe IFEA

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo [ERREUR] Ce script doit etre execute en tant qu'administrateur.
    echo Clic droit sur le fichier - "Executer en tant qu'administrateur"
    echo.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo    Deploiement Silae - Groupe IFEA
echo ==========================================
echo.

echo [1/4] Nettoyage des anciennes politiques...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge\AutoLaunchProtocolsFromOrigins" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge\AutoOpenAllowedForURLs"         /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge\AutoOpenFileTypes"               /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\sadec-akelys.silae.fr" /f >nul 2>&1
echo     OK

echo [2/4] Configuration du mode IE Edge...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "InternetExplorerIntegrationLevel" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "InternetExplorerIntegrationSiteList" /t REG_SZ /d "https://askifea.github.io/silae/sitelist.xml" /f >nul
echo     OK

echo [3/4] Creation du raccourci bureau...
set "SHORTCUT=%PUBLIC%\Desktop\Silae.lnk"
set "EDGE=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if not exist "%EDGE%" set "EDGE=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"

powershell -NoProfile -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT%'); $s.TargetPath = '%EDGE%'; $s.Arguments = 'https://askifea.github.io/silae'; $s.IconLocation = '%EDGE%,0'; $s.Description = 'Silae Groupe IFEA'; $s.Save()"

if exist "%SHORTCUT%" (
    echo     OK - Raccourci cree sur le bureau de tous les utilisateurs
) else (
    echo     ATTENTION - Echec creation raccourci
)

echo [4/4] Application des politiques...
gpupdate /force >nul 2>&1
echo     OK

echo.
echo ==========================================
echo  Deploiement termine !
echo  Fermez Edge s'il est ouvert, puis
echo  double-cliquez sur le raccourci Silae.
echo ==========================================
echo.
pause

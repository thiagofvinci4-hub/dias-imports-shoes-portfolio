@echo off
title Dias Imports Shoes - Preparar aplicativo
cd /d "%~dp0"
where node >nul 2>nul || (echo Instale o Node.js LTS em https://nodejs.org/ & pause & exit /b 1)
if not exist .env copy .env.example .env
call npm install
if errorlevel 1 (echo Falha ao instalar dependencias. & pause & exit /b 1)
echo.
echo Aplicativo preparado com sucesso.
echo Execute INICIAR_APP_WINDOWS.bat para abrir o Expo.
pause

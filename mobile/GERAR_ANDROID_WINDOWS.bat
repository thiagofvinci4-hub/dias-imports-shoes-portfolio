@echo off
title Dias Imports Shoes - Gerar Android
cd /d "%~dp0"
call npx eas-cli build --platform android --profile production
pause

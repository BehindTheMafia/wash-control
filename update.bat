@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set "file=index.html"
set "temp=index_temp.html"

:: Leer el archivo y hacer reemplazos
powershell -Command "$content = Get-Content '%file%' -Raw; $content = $content -replace 'Sistema #1 para Dueños de Autolavados', 'Sistema de Gestión para Autolavados'; $content = $content -replace 'DETÉN LAS FUGAS DE DINERO EN TU NEGOCIO', 'MODERNIZA LA GESTIÓN DE TU AUTOLAVADO'; $content = $content -replace 'Comenzar a Ganar Más', 'Solicitar Demostración'; $content = $content -replace 'Nómina Blindada', 'Gestión de Nómina'; $content = $content -replace 'Caja Blindada', 'Control de Caja'; $content = $content -replace 'franquicias de autolavado más demandantes', 'autolavados que buscan crecer y organizarse'; Set-Content '%temp%' $content -Encoding UTF8"

:: Reemplazar el original
move /Y "%temp%" "%file%"

echo Actualización completada

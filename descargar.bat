@echo off
:: Título de la ventana
title Descargador de Musica MP3 - Proyecto Open Source
color 0A

:: Comprobar si existen las herramientas
if not exist yt-dlp.exe goto FALTATOOLS
if not exist ffmpeg.exe goto FALTATOOLS

:MENU
cls
echo =================================================
echo   DESCARGADOR DE MUSICA MP3 (Youtube-DL)
echo =================================================
echo.
echo   1. Descargar una sola cancion (o video suelto)
echo   2. Descargar una PLAYLIST completa
echo   3. Actualizar el programa
echo   4. Salir
echo.
set /p opcion="Elige una opcion (1-4): "

if "%opcion%"=="1" goto SINGLE
if "%opcion%"=="2" goto PLAYLIST
if "%opcion%"=="3" goto UPDATE
if "%opcion%"=="4" goto EOF

:SINGLE
cls
echo.
echo Pega la URL del video o cancion:
set /p url=
echo.
echo Descargando...
:: El comando --no-playlist evita que se baje la lista entera si te equivocas de link
yt-dlp -x --audio-format mp3 --audio-quality 0 --no-playlist "%url%"
echo.
echo [!] Descarga completada.
pause
goto MENU

:PLAYLIST
cls
echo.
echo Pega la URL de la PLAYLIST:
set /p url=
echo.
echo Detectando lista de reproduccion...
echo Esto puede tardar dependiendo de la cantidad de canciones.
yt-dlp -x --audio-format mp3 --audio-quality 0 "%url%"
echo.
echo [!] Lista completada.
pause
goto MENU

:UPDATE
cls
echo Buscando actualizaciones...
yt-dlp -U
pause
goto MENU

:FALTATOOLS
cls
echo [ERROR CRITICO]
echo No se encuentran yt-dlp.exe o ffmpeg.exe en esta carpeta.
echo Por favor, lee el archivo README.md para instrucciones de instalacion.
pause
exit
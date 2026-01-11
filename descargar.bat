@echo off
:: Ajustar tamaño de ventana y color (Aqua sobre negro)
mode con: cols=85 lines=30
color 0B
title MP3 Downloader Pro - v2.0

:: --- CONFIGURACION ---
:: Aqui definimos el nombre de la carpeta donde se guardara todo
set "CARPETA_DESTINO=Musica"

:: --- COMPROBACIONES DE MOTORES ---
if not exist yt-dlp.exe goto FALTATOOLS
if not exist ffmpeg.exe goto FALTATOOLS

:: Crear la carpeta musica si no existe (el comando mkdir)
if not exist "%CARPETA_DESTINO%" mkdir "%CARPETA_DESTINO%"

:MENU
cls
echo.
echo  ==================================================================
echo    MP3 DOWNLOADER PRO - Tu musica, limpia y organizada
echo  ==================================================================
echo.
echo    [ ESTADO ]
echo    - Carpeta de descargas: .\%CARPETA_DESTINO%
echo.
echo    1. Descargar CANCION suelta (Se guarda en \%CARPETA_DESTINO%)
echo    2. Descargar PLAYLIST (Se crea una subcarpeta con el nombre)
echo    3. Actualizar programa (yt-dlp)
echo    4. Salir
echo.
echo  ==================================================================
set /p opcion=" > Escribe tu opcion (1-4): "

if "%opcion%"=="1" goto SINGLE
if "%opcion%"=="2" goto PLAYLIST
if "%opcion%"=="3" goto UPDATE
if "%opcion%"=="4" goto EOF
goto MENU

:SINGLE
cls
echo.
echo  --- MODO CANCION INDIVIDUAL ---
echo.
echo  Pega la URL del video:
set /p url=
echo.
echo  [PROCESANDO] Descargando en alta calidad...
echo.
:: -o define la ruta de salida. %%(title)s es el nombre del video.
yt-dlp -x --audio-format mp3 --audio-quality 0 --no-playlist -o "%CARPETA_DESTINO%/%%(title)s.%%(ext)s" "%url%"
echo.
echo  ------------------------------------------------------------------
echo   [EXITO] Cancion guardada en la carpeta "%CARPETA_DESTINO%"
echo  ------------------------------------------------------------------
pause
goto MENU

:PLAYLIST
cls
echo.
echo  --- MODO PLAYLIST ---
echo.
echo  Pega la URL de la playlist:
set /p url=
echo.
echo  [PROCESANDO] Analizando lista... (Esto puede tardar)
echo.
:: Aqui usamos %%(playlist_title)s para crear una carpeta con el nombre de la lista
yt-dlp -x --audio-format mp3 --audio-quality 0 -o "%CARPETA_DESTINO%/%%(playlist_title)s/%%(title)s.%%(ext)s" "%url%"
echo.
echo  ------------------------------------------------------------------
echo   [EXITO] Playlist completada. Revisa la carpeta "%CARPETA_DESTINO%"
echo  ------------------------------------------------------------------
pause
goto MENU

:UPDATE
cls
echo.
echo  [ACTUALIZANDO] Buscando nueva version de yt-dlp...
yt-dlp -U
echo.
pause
goto MENU

:FALTATOOLS
cls
color 0C
echo.
echo  [ERROR CRITICO]
echo  ------------------------------------------------------------------
echo  No encuentro 'yt-dlp.exe' o 'ffmpeg.exe'.
echo  Tienen que estar en la misma carpeta que este archivo .bat
echo  ------------------------------------------------------------------
echo.
pause
exit
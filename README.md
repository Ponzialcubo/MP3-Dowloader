# 🎵 Simple MP3 Downloader

![Windows](https://img.shields.io/badge/Platform-Windows-0078D6?style=flat&logo=windows)
![Language](https://img.shields.io/badge/Language-Batchfile-orange)
![License](https://img.shields.io/badge/License-MIT-green)

Un descargador de música robusto y ligero. Convierte vídeos y listas de reproducción de YouTube a MP3 de alta calidad automáticamente, incrustando carátulas y metadatos.

## ✨ Características

- 🚀 **Sin instalación:** Funciona directo desde la carpeta.
- 🎧 **Alta Calidad:** Extrae el mejor audio disponible.
- 🖼️ **Metadatos:** Añade automáticamente la carátula y el nombre del artista al MP3.
- 📋 **Soporte de Playlists:** Descarga listas enteras con un solo enlace.
- 🛡️ **Privacidad:** Sin anuncios ni rastreadores.

---

## ⚙️ Instalación (Setup)

Por razones legales y de peso, este repositorio **no incluye** los archivos ejecutables (.exe). Debes descargarlos tú mismo (¡es gratis y seguro!).

### 1. Descarga el código
Clona este repositorio o descarga el ZIP verde arriba a la derecha.

### 2. Descarga los motores (Requerido)
Necesitas descargar estas dos herramientas y colocarlas junto al script:

* **yt-dlp:** [Descargar último yt-dlp.exe](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe)
* **FFmpeg:** [Descargar FFmpeg Essentials (ZIP)](https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip)
    * *Nota:* Del ZIP de FFmpeg, entra en la carpeta `bin` y extrae los 3 archivos .exe.

### 3. Organiza la carpeta
Para que funcione, tu carpeta debe verse **exactamente así**:

```text
MiCarpeta/
├── descargar.bat      <-- El script que ejecutarás
├── yt-dlp.exe         <-- Motor de descarga
├── ffmpeg.exe         <-- Motor de audio
├── ffplay.exe         <-- (Opcional)
└── ffprobe.exe        <-- (Opcional)

🎮 Cómo usar
Haz doble clic en el archivo descargar.bat.

Aparecerá un menú negro. Escribe 1 para canción suelta o 2 para lista.

Pega el enlace (URL) y pulsa Enter.

¡Listo! La música aparecerá en esa misma carpeta.

⚠️ Solución de Problemas
Windows me dice "Protegió su PC" Al ser un script creado por un particular y no una empresa, Windows Defender puede mostrar una pantalla azul de aviso (SmartScreen).

Pulsa en "Más información".

Pulsa en el botón "Ejecutar de todas formas".

El programa se cierra enseguida Asegúrate de que ffmpeg.exe y yt-dlp.exe están en la misma carpeta que el archivo .bat (mira el diagrama de arriba). No los metas en subcarpetas.

⚖️ Aviso Legal
Este proyecto es un "wrapper" educativo para yt-dlp. El usuario es responsable de respetar los derechos de autor y los términos de servicio de las plataformas desde las que descargue contenido.
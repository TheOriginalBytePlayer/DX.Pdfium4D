# Icon-Generierung für DX PDF Viewer

## Schnellste Methode: Online-Tool (Empfohlen)

### Schritt 1: AppIcon.co verwenden

1. Öffnen Sie https://appicon.co/ in Ihrem Browser
2. Klicken Sie auf "Choose File" oder ziehen Sie `icon-template.svg` in den Upload-Bereich
3. Wählen Sie die Plattformen aus:
   - ✅ iOS
   - ✅ Android
   - ✅ macOS
   - ✅ Windows
4. Klicken Sie auf "Generate"
5. Laden Sie das ZIP-Archiv herunter

### Schritt 2: Icons extrahieren

Aus dem heruntergeladenen ZIP:

**Für Windows:**
- Suchen Sie nach `windows/icon.ico` oder ähnlich
- Kopieren Sie nach `P:\DX-PDFViewer\DxPdfViewer.ico`

**Für macOS:**
- Suchen Sie nach `macos/AppIcon.icns` oder ähnlich
- Kopieren Sie nach `P:\DX-PDFViewer\DxPdfViewer.icns`

**Für Android/iOS:**
- Die Icons werden automatisch in den richtigen Größen generiert
- Diese können später in den Delphi-Projekt-Optionen konfiguriert werden

---

## Alternative: Inkscape + ImageMagick

### Voraussetzungen

1. **Inkscape** installieren: https://inkscape.org/release/
2. **ImageMagick** installieren: https://imagemagick.org/script/download.php

### Windows Icon (.ico) erstellen

```powershell
# PowerShell-Befehle
cd P:\DX-PDFViewer\assets

# PNG-Dateien in verschiedenen Größen exportieren
& "C:\Program Files\Inkscape\bin\inkscape.exe" icon-template.svg --export-filename=icon_16.png --export-width=16 --export-height=16
& "C:\Program Files\Inkscape\bin\inkscape.exe" icon-template.svg --export-filename=icon_32.png --export-width=32 --export-height=32
& "C:\Program Files\Inkscape\bin\inkscape.exe" icon-template.svg --export-filename=icon_48.png --export-width=48 --export-height=48
& "C:\Program Files\Inkscape\bin\inkscape.exe" icon-template.svg --export-filename=icon_256.png --export-width=256 --export-height=256

# ICO-Datei erstellen
magick convert icon_16.png icon_32.png icon_48.png icon_256.png ..\DxPdfViewer.ico

# Temporäre PNG-Dateien löschen
Remove-Item icon_*.png
```

### macOS Icon (.icns) erstellen

**Auf macOS:**
```bash
cd assets

# PNG-Dateien exportieren
inkscape icon-template.svg --export-filename=icon_16.png --export-width=16 --export-height=16
inkscape icon-template.svg --export-filename=icon_32.png --export-width=32 --export-height=32
inkscape icon-template.svg --export-filename=icon_128.png --export-width=128 --export-height=128
inkscape icon-template.svg --export-filename=icon_256.png --export-width=256 --export-height=256
inkscape icon-template.svg --export-filename=icon_512.png --export-width=512 --export-height=512
inkscape icon-template.svg --export-filename=icon_1024.png --export-width=1024 --export-height=1024

# iconset-Verzeichnis erstellen
mkdir DxPdfViewer.iconset
cp icon_16.png DxPdfViewer.iconset/icon_16x16.png
cp icon_32.png DxPdfViewer.iconset/icon_16x16@2x.png
cp icon_32.png DxPdfViewer.iconset/icon_32x32.png
cp icon_128.png DxPdfViewer.iconset/icon_128x128.png
cp icon_256.png DxPdfViewer.iconset/icon_128x128@2x.png
cp icon_256.png DxPdfViewer.iconset/icon_256x256.png
cp icon_512.png DxPdfViewer.iconset/icon_256x256@2x.png
cp icon_512.png DxPdfViewer.iconset/icon_512x512.png
cp icon_1024.png DxPdfViewer.iconset/icon_512x512@2x.png

# ICNS erstellen
iconutil -c icns DxPdfViewer.iconset -o ../DxPdfViewer.icns

# Aufräumen
rm -rf DxPdfViewer.iconset icon_*.png
```

**Auf Windows (mit ImageMagick):**
```powershell
# Nur PNG exportieren, ICNS kann nicht direkt auf Windows erstellt werden
# Verwenden Sie stattdessen ein Online-Tool wie CloudConvert
```

---

## Alternative: Online-Tools

### CloudConvert (https://cloudconvert.com/)

**Für Windows ICO:**
1. Gehen Sie zu https://cloudconvert.com/svg-to-ico
2. Laden Sie `icon-template.svg` hoch
3. Klicken Sie auf "Convert"
4. Laden Sie `DxPdfViewer.ico` herunter

**Für macOS ICNS:**
1. Gehen Sie zu https://cloudconvert.com/svg-to-icns
2. Laden Sie `icon-template.svg` hoch
3. Klicken Sie auf "Convert"
4. Laden Sie `DxPdfViewer.icns` herunter

### ICO Convert (https://icoconvert.com/)

1. Gehen Sie zu https://icoconvert.com/
2. Laden Sie `icon-template.svg` hoch
3. Wählen Sie die gewünschten Größen (16, 32, 48, 256)
4. Klicken Sie auf "Convert ICO"
5. Laden Sie die ICO-Datei herunter

---

## Verifikation

### Windows Icon prüfen

```powershell
# Icon-Eigenschaften anzeigen
Get-Item DxPdfViewer.ico | Select-Object *

# Icon in Explorer anzeigen
explorer.exe DxPdfViewer.ico
```

### macOS Icon prüfen

```bash
# Icon-Informationen anzeigen
file DxPdfViewer.icns

# Icon im Finder anzeigen
open DxPdfViewer.icns
```

---

## Icon im Projekt verwenden

### In Delphi IDE

1. Öffnen Sie `DxPdfViewer.dproj` in Delphi
2. Gehen Sie zu **Project → Options → Application**
3. **Windows:**
   - Klicken Sie auf "Load Icon" unter "Icon"
   - Wählen Sie `DxPdfViewer.ico`
4. **macOS:**
   - Klicken Sie auf "Load Icon" unter "Icon"
   - Wählen Sie `DxPdfViewer.icns`

### Manuell (bereits konfiguriert)

Die Projektdatei ist bereits konfiguriert:

```xml
<Icon_MainIcon>DxPdfViewer.ico</Icon_MainIcon>
<Icns_MainIcns>DxPdfViewer.icns</Icns_MainIcns>
```

Stellen Sie einfach sicher, dass die Icon-Dateien im Projektstamm liegen.

---

## Troubleshooting

### "Icon wird nicht angezeigt"

1. Stellen Sie sicher, dass die Icon-Dateien im Projektstamm liegen
2. Führen Sie einen Clean Build durch: **Project → Build All**
3. Löschen Sie die DCU-Dateien: `rd /S /Q Win32\Debug\dcu`
4. Kompilieren Sie neu

### "ICO-Datei ist zu groß"

- Windows ICO-Dateien sollten < 1 MB sein
- Verwenden Sie nur die notwendigen Größen: 16, 32, 48, 256
- Komprimieren Sie die PNG-Dateien vor der Konvertierung

### "ICNS-Datei funktioniert nicht"

- Stellen Sie sicher, dass alle erforderlichen Größen enthalten sind
- Verwenden Sie `iconutil` auf macOS für beste Kompatibilität
- Alternativ: Online-Tool wie CloudConvert verwenden

---

## Lizenz

Das Icon-Template (`icon-template.svg`) ist gemeinfrei und kann frei verwendet werden.


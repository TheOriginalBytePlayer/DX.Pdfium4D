# DX PDF Viewer - Icon Assets

## Icon Design

Das Icon zeigt ein stilisiertes PDF-Dokument in Rot mit weißem "PDF"-Text.

**Design-Merkmale:**
- ✅ Keine Adobe-Markenzeichen
- ✅ Generisches Dokumenten-Design
- ✅ Klare Erkennbarkeit als PDF-Viewer
- ✅ Professionelles Erscheinungsbild

## Icon-Generierung

### Benötigte Größen

**Windows (.ico):**
- 16x16, 32x32, 48x48, 256x256 (in einer .ico-Datei)

**macOS (.icns):**
- 16x16, 32x32, 64x64, 128x128, 256x256, 512x512, 1024x1024

**Android:**
- 36x36 (ldpi)
- 48x48 (mdpi)
- 72x72 (hdpi)
- 96x96 (xhdpi)
- 144x144 (xxhdpi)
- 192x192 (xxxhdpi)

**iOS:**
- 20x20, 29x29, 40x40, 58x58, 60x60, 76x76, 80x80, 87x87, 120x120, 152x152, 167x167, 180x180, 1024x1024

### Konvertierung mit Inkscape (kostenlos)

```bash
# Windows Icon (einzelne Größen)
inkscape icon-template.svg --export-filename=icon_16.png --export-width=16 --export-height=16
inkscape icon-template.svg --export-filename=icon_32.png --export-width=32 --export-height=32
inkscape icon-template.svg --export-filename=icon_48.png --export-width=48 --export-height=48
inkscape icon-template.svg --export-filename=icon_256.png --export-width=256 --export-height=256

# Dann mit ImageMagick zu .ico kombinieren:
magick convert icon_16.png icon_32.png icon_48.png icon_256.png DxPdfViewer.ico
```

### Konvertierung mit Online-Tools

**Empfohlene Tools:**
1. **CloudConvert** (https://cloudconvert.com/svg-to-ico)
   - SVG → ICO (Windows)
   - SVG → ICNS (macOS)
   - SVG → PNG (alle Größen)

2. **ICO Convert** (https://icoconvert.com/)
   - Spezialisiert auf Icon-Konvertierung
   - Unterstützt Multi-Size ICO

3. **App Icon Generator** (https://appicon.co/)
   - Generiert alle benötigten Größen für alle Plattformen
   - Lädt SVG hoch → Downloadet ZIP mit allen Icons

### Manuelle Schritte

1. **SVG öffnen** in Inkscape oder Adobe Illustrator
2. **Exportieren** in verschiedene PNG-Größen
3. **ICO erstellen** mit ImageMagick oder Online-Tool
4. **ICNS erstellen** mit `iconutil` (macOS) oder Online-Tool

### Schnellste Methode (empfohlen)

1. Gehen Sie zu https://appicon.co/
2. Laden Sie `icon-template.svg` hoch
3. Wählen Sie alle Plattformen (iOS, Android, macOS, Windows)
4. Klicken Sie "Generate"
5. Laden Sie das ZIP herunter
6. Extrahieren Sie die Icons in die entsprechenden Verzeichnisse

## Icon-Platzierung im Projekt

### Windows
```
DxPdfViewer.ico → Projektstamm
```

In `DxPdfViewer.dproj` ist bereits konfiguriert:
```xml
<Icon_MainIcon>DxPdfViewer.ico</Icon_MainIcon>
```

### macOS
```
DxPdfViewer.icns → Projektstamm
```

In `DxPdfViewer.dproj` ist bereits konfiguriert:
```xml
<Icns_MainIcns>DxPdfViewer.icns</Icns_MainIcns>
```

### Android
Icons werden automatisch aus dem Projekt-Deployment verwendet.
Die Standard-Icons können in den Projekt-Optionen unter "Application → Icons" konfiguriert werden.

### iOS
Icons werden automatisch aus dem Projekt-Deployment verwendet.
Die Standard-Icons können in den Projekt-Optionen unter "Application → Icons" konfiguriert werden.

## Alternative: Delphi IDE verwenden

1. Öffnen Sie das Projekt in Delphi
2. Gehen Sie zu **Project → Options → Application**
3. Klicken Sie auf **Load Icon** (Windows) oder **Load Icon** (macOS)
4. Wählen Sie die entsprechende Icon-Datei

## Lizenz

Das Icon-Design ist lizenzfrei und kann ohne Einschränkungen verwendet werden.
Es verwendet keine geschützten Markenzeichen von Adobe oder anderen Unternehmen.


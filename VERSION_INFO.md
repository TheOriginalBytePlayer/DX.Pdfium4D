# DX PDF-Viewer - Version Information

## Version 1.0.0

**Release Date:** 2025
**Copyright:** (c) 2025 Olaf Monien
**Reverse URL:** net.developer-experts

---

## Version Information (All Platforms)

### Windows (Win32/Win64)
- **Product Name:** DX PDF-Viewer
- **File Description:** DX PDF-Viewer
- **Company:** Olaf Monien
- **Copyright:** (c) 2025 Olaf Monien
- **Version:** 1.0.0.0
- **Build Number:** ✅ Auto-Generated (via `VerInfo_AutoGenVersion`)
- **Bundle ID:** net.developer-experts.dxpdfviewer

### macOS (OSX64/OSXARM64)
- **Bundle Name:** DX PDF-Viewer
- **Bundle Display Name:** DX PDF-Viewer
- **Bundle Identifier:** net.developer-experts.dxpdfviewer
- **Bundle Version:** 1.0.0
- **Bundle Short Version:** 1.0.0
- **Bundle Signature:** DXPV
- **Category:** Productivity (public.app-category.productivity)
- **Copyright:** (c) 2025 Olaf Monien
- **High Resolution Capable:** ✅ Yes

### Android (Android/Android64)
- **Package Name:** net.developer-experts.dxpdfviewer
- **App Label:** DX PDF-Viewer
- **Version Code:** 1
- **Version Name:** 1.0.0
- **Min SDK Version:** 23 (Android 6.0)
- **Target SDK Version:** 35 (Android 15)

### iOS (iOSDevice64/iOSSimARM64)
- **Bundle Name:** DX PDF-Viewer
- **Bundle Display Name:** DX PDF-Viewer
- **Bundle Identifier:** net.developer-experts.dxpdfviewer
- **Bundle Version:** 1.0.0
- **Bundle Short Version:** 1.0.0
- **Category:** Productivity
- **Copyright:** (c) 2025 Olaf Monien

---

## Build Number Generation

**Windows:** ✅ Auto-Generated via `VerInfo_AutoGenVersion` (timestamp-based)
**macOS:** Manual (CFBundleVersion)
**Android:** Manual (versionCode)
**iOS:** Manual (CFBundleVersion)

**Note:** Delphi's `VerInfo_AutoGenVersion` generates build numbers automatically based on compilation timestamp for Windows. For other platforms, build numbers should be manually incremented before release builds.

---

## Privacy Descriptions (macOS/iOS)

### macOS
- **Documents Folder:** "To open PDF files from the Documents folder"
- **Downloads Folder:** "To open PDF files from the Downloads folder"
- **Desktop Folder:** "To open PDF files from the Desktop folder"

### iOS
- Similar descriptions for file access permissions

---

## Encryption Declaration

**ITSAppUsesNonExemptEncryption:** false

This app does not use encryption that requires export compliance documentation.

---

## Icon Files

### Required Files
- `DxPdfViewer.ico` - Windows icon (16x16, 32x32, 48x48, 256x256)
- `DxPdfViewer.icns` - macOS icon (multiple sizes up to 1024x1024)

### Icon Design
- Red document with "PDF" text
- No Adobe trademarks
- Generic, professional design
- See `assets/icon-template.svg` for source

### Icon Generation
See `assets/README.md` for detailed instructions on generating icons for all platforms.

---

## Build Information

### Compiler
- **Delphi Version:** 12.2 Athens (Compiler 36.0)
- **Framework:** FireMonkey (FMX)
- **Target Platforms:** Win32, Win64, OSX64, OSXARM64, Android, Android64, iOSDevice64, iOSSimARM64

### Dependencies
- **PDFium Library:** Google's PDFium (https://pdfium.googlesource.com/pdfium/)
- **PDFium Binaries:** https://github.com/bblanchon/pdfium-binaries

---

## Release Checklist

Before releasing a new version:

1. ✅ Update version numbers in `DxPdfViewer.dproj`
2. ✅ Increment build numbers for all platforms
3. ✅ Update `VERSION_INFO.md` (this file)
4. ✅ Run all unit tests (`tests/build-and-run-tests.bat`)
5. ✅ Build for all target platforms
6. ✅ Test on each platform
7. ✅ Update `README.md` with release notes
8. ✅ Create Git tag (e.g., `v1.0.0`)
9. ✅ Build release packages
10. ✅ Sign executables (Windows/macOS)

---

## Version History

### Version 1.0.0 (2025)
- Initial release
- PDF viewing with PDFium
- Drag & Drop support
- Keyboard navigation
- Touch gestures
- PDF/A detection
- Metadata display
- Background rendering
- Multi-platform support

---

## Contact

**Developer:** Olaf Monien  
**Website:** https://developer-experts.net  
**Email:** (Add if desired)

---

## License

See `LICENSE` file for license information.


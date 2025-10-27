# HOLOCRON
## The Delphi PDF Viewer

![HOLOCRON Logo](assets/Logo.svg)

**HOLOCRON** is a minimalistic, cross-platform PDF viewer built with Delphi and FireMonkey (FMX), based on Google's PDFium library. It serves as a demonstration of Delphi PDFium wrapper classes and showcases modern Delphi development practices.

---

## Features

✨ **Minimalistic Design**
- Clean, distraction-free interface
- Focus on content, not chrome
- Modern Material Design-inspired UI

📄 **PDF Viewing**
- High-quality rendering using Google's PDFium
- Automatic high-DPI display support
- Smooth page navigation with keyboard, mouse wheel, and touch gestures

🎯 **User-Friendly**
- Drag & Drop PDF files to open
- Click anywhere to browse for files
- Keyboard shortcuts (Ctrl+O to open, arrow keys to navigate)
- PDF/A detection and metadata display

⚡ **Performance**
- Background rendering for smooth UI
- Efficient memory management
- Fast page switching

🌍 **Cross-Platform**
- Windows (Win32, Win64)
- macOS (Intel, Apple Silicon)
- Android
- iOS

---

## Getting Started

### Prerequisites

- **Delphi 12.2 Athens** or later
- **PDFium Library** (included in `lib/pdfium-bin`)

### Building

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/holocron.git
   cd holocron
   ```

2. **Open the project:**
   - Open `Holocron.dproj` in Delphi IDE

3. **Build:**
   - Press **F9** or select **Run → Run**
   - The PDFium DLL will be automatically copied to the output directory

### Running

**Windows:**
```bash
Win32\Debug\Holocron.exe
```

**Command-line with file:**
```bash
Holocron.exe path\to\document.pdf
```

---

## Usage

### Opening PDF Files

**Method 1: Drag & Drop**
- Drag a PDF file from Explorer and drop it onto the HOLOCRON window

**Method 2: Click to Browse**
- Click anywhere on the drop zone or status bar to open the file browser
- Select a PDF file and click "Open"

**Method 3: Keyboard Shortcut**
- Press **Ctrl+O** to open the file browser

**Method 4: Command Line**
- Pass the PDF file path as a command-line argument:
  ```bash
  Holocron.exe document.pdf
  ```

### Navigation

| Action | Method |
|--------|--------|
| **Next Page** | ↓ Arrow Key, Mouse Wheel Down, Swipe Up |
| **Previous Page** | ↑ Arrow Key, Mouse Wheel Up, Swipe Down |
| **Open File** | Ctrl+O, Click on status bar |

### Status Bar

The status bar displays:
- **File name** (clickable to open another file)
- **PDF version** (e.g., PDF 1.7)
- **PDF/A compliance** (if applicable)
- **Current page / Total pages**

---

## Using the Delphi PDFium Wrapper Classes

HOLOCRON includes a set of object-oriented wrapper classes for PDFium that make it easy to work with PDF documents in Delphi.

For detailed documentation on using these classes in your own projects, see:

📖 **[Using the DX.Pdf Wrapper Classes](USING_DX_PDF.md)**

---

## Project Structure

```
holocron/
├── src/                      # Source code
│   ├── DX.Pdf.API.pas       # Low-level PDFium C-API bindings
│   ├── DX.Pdf.Document.pas  # High-level document/page classes
│   ├── DX.Pdf.Viewer.FMX.pas # FMX visual component
│   ├── Holocron/            # Main application
│   │   ├── Holocron.dpr     # Main program file
│   │   ├── Holocron.dproj   # Delphi project file
│   │   ├── Main.Form.pas    # Main application form
│   │   └── Main.Form.fmx    # Form layout
│   └── tests/               # Unit tests
│       ├── HolocronTests.dpr    # Test project
│       ├── HolocronTests.dproj  # Test project file
│       └── DX.Pdf.Document.Tests.pas
├── assets/                   # Icons and logos
│   ├── Icon.svg             # Application icon (source)
│   └── Logo.svg             # HOLOCRON logo
└── lib/                      # Third-party libraries
    ├── pdfium-bin/          # PDFium binaries
    └── DUnitX/              # Unit testing framework
```


---

## Architecture

### PDFium Wrapper Layers

**1. Low-Level API (`DX.Pdf.API.pas`)**
- Direct C-API bindings to PDFium
- Platform-independent function declarations
- Minimal abstraction

**2. High-Level Classes (`DX.Pdf.Document.pas`)**
- Object-oriented wrapper with automatic resource management
- Reference counting for documents and pages
- Metadata extraction (title, author, PDF/A compliance, etc.)
- Bitmap rendering with configurable DPI

**3. Visual Component (`DX.Pdf.Viewer.FMX.pas`)**
- FMX component for displaying PDFs
- Automatic page navigation
- Drag & Drop support
- Background rendering for smooth UI

### Threading Model

- **Main Thread:** UI updates, user interaction
- **Background Thread:** PDF page rendering (using `TTask`)
- **Synchronization:** `TThread.Synchronize` for bitmap updates

---

## Dependencies

### PDFium Library

HOLOCRON uses Google's PDFium library for PDF rendering:

- **Source:** https://pdfium.googlesource.com/pdfium/
- **Binaries:** https://github.com/bblanchon/pdfium-binaries
- **License:** BSD-3-Clause (compatible with commercial use)

### DUnitX

Unit testing framework:

- **Source:** https://github.com/VSoftTechnologies/DUnitX
- **License:** Apache 2.0

---

## Testing

HOLOCRON includes comprehensive unit tests for the PDFium wrapper classes.

### Running Tests

**Option 1: Batch Script**
```bash
cd src\tests
build-and-run-tests.bat
```

**Option 2: Delphi IDE**
1. Open `src\tests\HolocronTests.dproj`
2. Press **F9** to run tests
3. View results in the console

### Test Coverage

- ✅ PDF document loading
- ✅ Page count and dimensions
- ✅ Metadata extraction
- ✅ PDF/A detection
- ✅ Bitmap rendering
- ✅ Error handling

---

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues.

---

## License

Copyright (c) 2025 Olaf Monien

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Third-Party Licenses

- **PDFium:** BSD-3-Clause License
- **DUnitX:** Apache 2.0 License

---

## Author

**Olaf Monien**
- Website: https://developer-experts.net
- Email: olaf@monien.net

---

## Acknowledgments

- **Google** for the PDFium library
- **Benoît Blanchon** for maintaining PDFium binaries
- **VSoft Technologies** for DUnitX
- **Embarcadero** for Delphi

---

**HOLOCRON** - *Preserving knowledge, one PDF at a time.*

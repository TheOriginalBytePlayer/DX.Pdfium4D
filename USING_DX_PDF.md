# Using the DX.Pdf Wrapper Classes

This document describes how to use the Delphi PDFium wrapper classes (`DX.Pdf.*`) in your own projects.

---

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [API Reference](#api-reference)
  - [DX.Pdf.API](#dxpdfapi)
  - [DX.Pdf.Document](#dxpdfdocument)
  - [DX.Pdf.Viewer.FMX](#dxpdfviewerfmx)
- [Examples](#examples)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)

---

## Overview

The DX.Pdf wrapper classes provide three layers of abstraction for working with PDF documents in Delphi:

1. **DX.Pdf.API** - Low-level C-API bindings to PDFium
2. **DX.Pdf.Document** - High-level object-oriented wrapper
3. **DX.Pdf.Viewer.FMX** - Visual FMX component for displaying PDFs

Most applications will use **DX.Pdf.Document** for programmatic access or **DX.Pdf.Viewer.FMX** for visual display.

---

## Installation

### 1. Copy the Source Files

Copy the following files to your project:

```
src/DX.Pdf.API.pas
src/DX.Pdf.Document.pas
src/DX.Pdf.Viewer.FMX.pas  (optional, only for FMX applications)
```

### 2. Add PDFium Library

Download PDFium binaries from:
- https://github.com/bblanchon/pdfium-binaries

Place the appropriate library file in your application directory:

| Platform | File | Location |
|----------|------|----------|
| Windows 32-bit | `pdfium.dll` | Same directory as .exe |
| Windows 64-bit | `pdfium.dll` | Same directory as .exe |
| macOS | `libpdfium.dylib` | Same directory as app bundle |
| Linux | `libpdfium.so` | Same directory as executable |
| Android | `libpdfium.so` | Deploy as library |
| iOS | `libpdfium.a` | Link statically |

### 3. Add to Uses Clause

```pascal
uses
  DX.Pdf.Document;  // For programmatic access
  // or
  DX.Pdf.Viewer.FMX;  // For visual component
```

---

## Quick Start

### Loading and Rendering a PDF

```pascal
uses
  DX.Pdf.Document;

procedure RenderPdfToFile(const APdfPath, AOutputPath: string);
var
  LDoc: TPdfDocument;
  LPage: TPdfPage;
  LBitmap: TBitmap;
begin
  // Load PDF document
  LDoc := TPdfDocument.Create(APdfPath);
  try
    // Get first page
    LPage := LDoc.Pages[0];

    // Create bitmap
    LBitmap := TBitmap.Create;
    try
      // Render at 150 DPI
      LPage.RenderToBitmap(LBitmap, 150);

      // Save to file
      LBitmap.SaveToFile(AOutputPath);
    finally
      LBitmap.Free;
    end;
  finally
    LDoc.Free;
  end;
end;
```

### Using the FMX Viewer Component

```pascal
uses
  DX.Pdf.Viewer.FMX;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Create PDF viewer
  FPdfViewer := TPdfViewer.Create(Self);
  FPdfViewer.Parent := Self;
  FPdfViewer.Align := TAlignLayout.Client;

  // Load PDF
  FPdfViewer.LoadFromFile('document.pdf');
end;

procedure TForm1.NextPageButtonClick(Sender: TObject);
begin
  FPdfViewer.NextPage;
end;

procedure TForm1.PreviousPageButtonClick(Sender: TObject);
begin
  FPdfViewer.PreviousPage;
end;
```

---

## API Reference

### DX.Pdf.API

Low-level C-API bindings. Use only if you need direct access to PDFium functions.

**Key Functions:**
- `FPDF_InitLibrary` - Initialize PDFium
- `FPDF_DestroyLibrary` - Cleanup PDFium
- `FPDF_LoadDocument` - Load PDF from file
- `FPDF_CloseDocument` - Close PDF document
- `FPDF_GetPageCount` - Get number of pages
- `FPDF_LoadPage` - Load a specific page
- `FPDF_ClosePage` - Close a page
- `FPDF_RenderPageBitmap` - Render page to bitmap

**Example:**
```pascal
uses
  DX.Pdf.API;

var
  LDoc: FPDF_DOCUMENT;
  LPageCount: Integer;
begin
  FPDF_InitLibrary;
  try
    LDoc := FPDF_LoadDocument(PAnsiChar(AnsiString(APdfPath)), nil);
    if LDoc <> nil then
    begin
      LPageCount := FPDF_GetPageCount(LDoc);
      ShowMessage('Page count: ' + LPageCount.ToString);
      FPDF_CloseDocument(LDoc);
    end;
  finally
    FPDF_DestroyLibrary;
  end;
end;
```

---

### DX.Pdf.Document

High-level object-oriented wrapper with automatic resource management.

#### TPdfDocument

**Constructor:**
```pascal
constructor Create(const AFilePath: string);
```

**Properties:**
- `PageCount: Integer` - Number of pages in document
- `Pages[Index: Integer]: TPdfPage` - Access pages by index (0-based)
- `Title: string` - Document title from metadata
- `Author: string` - Document author from metadata
- `Subject: string` - Document subject from metadata
- `Keywords: string` - Document keywords from metadata
- `Creator: string` - Application that created the document
- `Producer: string` - PDF producer
- `CreationDate: string` - Creation date
- `ModificationDate: string` - Last modification date
- `Version: string` - PDF version (e.g., "1.7")
- `IsPdfA: Boolean` - True if document is PDF/A compliant
- `PdfAVersion: string` - PDF/A version if applicable

**Example:**
```pascal
var
  LDoc: TPdfDocument;
begin
  LDoc := TPdfDocument.Create('document.pdf');
  try
    ShowMessage('Title: ' + LDoc.Title);
    ShowMessage('Pages: ' + LDoc.PageCount.ToString);
    ShowMessage('PDF Version: ' + LDoc.Version);

    if LDoc.IsPdfA then
      ShowMessage('PDF/A Version: ' + LDoc.PdfAVersion);
  finally
    LDoc.Free;
  end;
end;
```

#### TPdfPage

**Properties:**
- `Width: Double` - Page width in points (1/72 inch)
- `Height: Double` - Page height in points
- `PageIndex: Integer` - Zero-based page index

**Methods:**
```pascal
procedure RenderToBitmap(ABitmap: TBitmap; ADPI: Integer = 96);
```

Renders the page to a bitmap at the specified DPI.

**Example:**
```pascal
var
  LDoc: TPdfDocument;
  LPage: TPdfPage;
  LBitmap: TBitmap;
begin
  LDoc := TPdfDocument.Create('document.pdf');
  try
    LPage := LDoc.Pages[0];

    LBitmap := TBitmap.Create;
    try
      // Render at 300 DPI for high quality
      LPage.RenderToBitmap(LBitmap, 300);

      // Use bitmap...
      Image1.Bitmap.Assign(LBitmap);
    finally
      LBitmap.Free;
    end;
  finally
    LDoc.Free;
  end;
end;
```

---

### DX.Pdf.Viewer.FMX

Visual FMX component for displaying PDF documents.

#### TPdfViewer

**Properties:**
- `CurrentPage: Integer` - Current page number (1-based)
- `PageCount: Integer` - Total number of pages
- `Document: TPdfDocument` - Underlying PDF document (read-only)
- `ShowLoadingIndicator: Boolean` - Show/hide loading animation (default: True)

**Methods:**
```pascal
procedure LoadFromFile(const AFilePath: string);
procedure NextPage;
procedure PreviousPage;
procedure GoToPage(APageNumber: Integer);
procedure Clear;
```

**Events:**
```pascal
property OnPageChanged: TNotifyEvent;
```

Fired when the current page changes.

**Example:**
```pascal
type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    FPdfViewer: TPdfViewer;
    procedure OnPdfPageChanged(Sender: TObject);
  end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPdfViewer := TPdfViewer.Create(Self);
  FPdfViewer.Parent := Self;
  FPdfViewer.Align := TAlignLayout.Client;
  FPdfViewer.OnPageChanged := OnPdfPageChanged;
  FPdfViewer.LoadFromFile('document.pdf');
end;

procedure TForm1.OnPdfPageChanged(Sender: TObject);
begin
  StatusBar1.SimpleText := Format('Page %d of %d',
    [FPdfViewer.CurrentPage, FPdfViewer.PageCount]);
end;
```

---

## Examples

### Example 1: Extract All Pages as Images

```pascal
procedure ExtractAllPages(const APdfPath, AOutputDir: string);
var
  LDoc: TPdfDocument;
  LPage: TPdfPage;
  LBitmap: TBitmap;
  I: Integer;
begin
  LDoc := TPdfDocument.Create(APdfPath);
  try
    LBitmap := TBitmap.Create;
    try
      for I := 0 to LDoc.PageCount - 1 do
      begin
        LPage := LDoc.Pages[I];
        LPage.RenderToBitmap(LBitmap, 150);
        LBitmap.SaveToFile(TPath.Combine(AOutputDir,
          Format('page_%d.png', [I + 1])));
      end;
    finally
      LBitmap.Free;
    end;
  finally
    LDoc.Free;
  end;
end;
```

### Example 2: Get PDF Metadata

```pascal
procedure ShowPdfInfo(const APdfPath: string);
var
  LDoc: TPdfDocument;
  LInfo: TStringList;
begin
  LDoc := TPdfDocument.Create(APdfPath);
  try
    LInfo := TStringList.Create;
    try
      LInfo.Add('Title: ' + LDoc.Title);
      LInfo.Add('Author: ' + LDoc.Author);
      LInfo.Add('Subject: ' + LDoc.Subject);
      LInfo.Add('Keywords: ' + LDoc.Keywords);
      LInfo.Add('Creator: ' + LDoc.Creator);
      LInfo.Add('Producer: ' + LDoc.Producer);
      LInfo.Add('Created: ' + LDoc.CreationDate);
      LInfo.Add('Modified: ' + LDoc.ModificationDate);
      LInfo.Add('Version: ' + LDoc.Version);
      LInfo.Add('Pages: ' + LDoc.PageCount.ToString);

      if LDoc.IsPdfA then
        LInfo.Add('PDF/A: ' + LDoc.PdfAVersion)
      else
        LInfo.Add('PDF/A: No');

      ShowMessage(LInfo.Text);
    finally
      LInfo.Free;
    end;
  finally
    LDoc.Free;
  end;
end;
```

### Example 3: Render with Custom DPI

```pascal
procedure RenderHighQuality(const APdfPath: string; AImage: TImage);
var
  LDoc: TPdfDocument;
  LPage: TPdfPage;
  LBitmap: TBitmap;
begin
  LDoc := TPdfDocument.Create(APdfPath);
  try
    LPage := LDoc.Pages[0];

    LBitmap := TBitmap.Create;
    try
      // Render at 300 DPI for print quality
      LPage.RenderToBitmap(LBitmap, 300);
      AImage.Bitmap.Assign(LBitmap);
    finally
      LBitmap.Free;
    end;
  finally
    LDoc.Free;
  end;
end;
```

---

## Best Practices

### 1. Always Use try..finally

```pascal
LDoc := TPdfDocument.Create(AFilePath);
try
  // Use document
finally
  LDoc.Free;
end;
```

### 2. Render in Background Thread

For responsive UI, render pages in background threads:

```pascal
TTask.Run(
  procedure
  var
    LBitmap: TBitmap;
  begin
    LBitmap := TBitmap.Create;
    try
      LPage.RenderToBitmap(LBitmap, 150);

      TThread.Synchronize(nil,
        procedure
        begin
          Image1.Bitmap.Assign(LBitmap);
        end);
    finally
      LBitmap.Free;
    end;
  end);
```

### 3. Choose Appropriate DPI

- **Screen display:** 96-150 DPI
- **High-DPI displays:** 150-200 DPI
- **Print quality:** 300 DPI
- **High-quality print:** 600 DPI

### 4. Handle Errors

```pascal
try
  LDoc := TPdfDocument.Create(AFilePath);
  try
    // Use document
  finally
    LDoc.Free;
  end;
except
  on E: Exception do
    ShowMessage('Error loading PDF: ' + E.Message);
end;
```

---

## Troubleshooting

### "PDFium library not found"

**Solution:** Ensure `pdfium.dll` (Windows) or equivalent library is in the same directory as your executable.

### "Access violation" or crashes

**Solution:**
- Always use try..finally blocks
- Don't access pages after document is freed
- Don't render from multiple threads simultaneously to the same document

### Blurry rendering

**Solution:** Increase DPI when calling `RenderToBitmap`:
```pascal
LPage.RenderToBitmap(LBitmap, 150);  // Instead of 96
```

### Memory issues with large PDFs

**Solution:**
- Render pages on-demand, not all at once
- Free bitmaps when no longer needed
- Use background threads to avoid UI blocking

---

## License

The DX.Pdf wrapper classes are part of DX Pdfium4D and are licensed under the MIT License.

PDFium itself is licensed under the BSD-3-Clause License.

---

## Support

For questions, issues, or contributions:

- **GitHub:** https://github.com/omonien/DX-Pdfium4D
- **Website:** https://developer-experts.net
- **Email:** olaf@monien.net

---

**Part of DX Pdfium4D - Delphi Cross-Platform Wrapper für Pdfium**
Copyright (c) 2025 Olaf Monien

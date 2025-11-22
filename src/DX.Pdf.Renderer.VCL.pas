{*******************************************************************************
  Unit: DX.Pdf.Renderer.VCL

  Part of DX Pdfium4D - Delphi Cross-Platform Wrapper für Pdfium
  https://github.com/omonien/DX-Pdfium4D

  Description:
    VCL-specific PDF rendering functionality.
    Provides methods to render PDF pages to VCL TBitmap.

  Author: Olaf Monien
  Copyright (c) 2025 Olaf Monien
  License: MIT - see LICENSE file
*******************************************************************************}
unit DX.Pdf.Renderer.VCL;

interface

uses
  System.SysUtils,
  System.UITypes,
  Vcl.Graphics,
  DX.Pdf.API,
  DX.Pdf.Document;

type
  /// <summary>
  /// VCL-specific PDF page renderer
  /// </summary>
  TPdfPageRendererVCL = class helper for TPdfPage
  public
    /// <summary>
    /// Renders the page to a VCL bitmap
    /// </summary>
    procedure RenderToBitmap(ABitmap: Vcl.Graphics.TBitmap; ABackgroundColor: TAlphaColor = TAlphaColors.White);
  end;

implementation

{ TPdfPageRendererVCL }

procedure TPdfPageRendererVCL.RenderToBitmap(ABitmap: Vcl.Graphics.TBitmap; ABackgroundColor: TAlphaColor);
var
  LPdfBitmap: FPDF_BITMAP;
  LBuffer: Pointer;
  LStride: Integer;
  LSrcPtr: PByte;
  LDstPtr: PByte;
  LY: Integer;
  LX: Integer;
  LR, LG, LB, LA: Byte;
  LBgColor: FPDF_DWORD;
begin
  if Handle = nil then
    raise EPdfRenderException.Create('Page not loaded');

  if ABitmap = nil then
    raise EPdfRenderException.Create('Bitmap is nil');

  // Bitmap size should already be set by caller to desired resolution
  // Don't resize here - caller determines the DPI/resolution

  // Validate bitmap has valid size
  if (ABitmap.Width <= 0) or (ABitmap.Height <= 0) then
    raise EPdfRenderException.Create('Bitmap has invalid size');

  // Create PDFium bitmap (BGRA format)
  LPdfBitmap := FPDFBitmap_Create(ABitmap.Width, ABitmap.Height, 1);
  if LPdfBitmap = nil then
    raise EPdfRenderException.Create('Failed to create PDFium bitmap');

  try
    // Fill with background color (convert ARGB to BGRA)
    LA := TAlphaColorRec(ABackgroundColor).A;
    LR := TAlphaColorRec(ABackgroundColor).R;
    LG := TAlphaColorRec(ABackgroundColor).G;
    LB := TAlphaColorRec(ABackgroundColor).B;
    LBgColor := (LA shl 24) or (LR shl 16) or (LG shl 8) or LB;
    FPDFBitmap_FillRect(LPdfBitmap, 0, 0, ABitmap.Width, ABitmap.Height, LBgColor);

    // Render PDF page to bitmap with high-quality settings
    // Use FPDF_ANNOT for annotations and FPDF_LCD_TEXT for better text rendering
    FPDF_RenderPageBitmap(
      LPdfBitmap,
      Handle,
      0, 0,
      ABitmap.Width, ABitmap.Height,
      FPDF_ROTATE_0,
      FPDF_ANNOT or FPDF_LCD_TEXT
    );

    // Copy PDFium bitmap to VCL bitmap
    LBuffer := FPDFBitmap_GetBuffer(LPdfBitmap);
    LStride := FPDFBitmap_GetStride(LPdfBitmap);

    // VCL implementation using ScanLine
    ABitmap.PixelFormat := pf32bit;
    LSrcPtr := LBuffer;
    for LY := 0 to ABitmap.Height - 1 do
    begin
      LDstPtr := ABitmap.ScanLine[LY];
      for LX := 0 to ABitmap.Width - 1 do
      begin
        // PDFium uses BGRA, VCL uses BGRA on Windows
        LB := LSrcPtr^; Inc(LSrcPtr);
        LG := LSrcPtr^; Inc(LSrcPtr);
        LR := LSrcPtr^; Inc(LSrcPtr);
        LA := LSrcPtr^; Inc(LSrcPtr);

        // VCL on Windows: BGRA -> BGRA (no conversion needed)
        LDstPtr^ := LB; Inc(LDstPtr);
        LDstPtr^ := LG; Inc(LDstPtr);
        LDstPtr^ := LR; Inc(LDstPtr);
        LDstPtr^ := LA; Inc(LDstPtr);
      end;
      // Skip to next scanline in source
      LSrcPtr := PByte(NativeInt(LBuffer) + (LY + 1) * LStride);
    end;
  finally
    FPDFBitmap_Destroy(LPdfBitmap);
  end;
end;

end.


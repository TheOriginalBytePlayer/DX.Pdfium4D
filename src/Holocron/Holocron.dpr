{*******************************************************************************
  HOLOCRON - The Delphi PDF Viewer

  A minimalistic PDF viewer based on Google's PDFium library, demonstrating
  the usage of Delphi PDFium wrapper classes.

  Copyright (c) 2025 Olaf Monien
  https://developer-experts.net
*******************************************************************************}
program Holocron;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main.Form in 'Main.Form.pas' {MainForm},
  DX.Pdf.API in '..\DX.Pdf.API.pas',
  DX.Pdf.Document in '..\DX.Pdf.Document.pas',
  DX.Pdf.Viewer.FMX in '..\DX.Pdf.Viewer.FMX.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.


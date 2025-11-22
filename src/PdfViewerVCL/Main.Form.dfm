object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'DX PDF Viewer 1.1 (VCL)'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object StatusBar: TStatusBar
    Left = 0
    Top = 581
    Width = 800
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'No document loaded'
  end
  object DropPanel: TPanel
    Left = 200
    Top = 150
    Width = 400
    Height = 300
    Anchors = []
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    OnClick = DropPanelClick
    object DropLabel: TLabel
      AlignWithMargins = True
      Left = 20
      Top = 20
      Width = 360
      Height = 260
      Margins.Left = 20
      Margins.Top = 20
      Margins.Right = 20
      Margins.Bottom = 20
      Align = alClient
      Alignment = taCenter
      Caption = 
        'Drop PDF file here'#13#10#13#10'or'#13#10#13#10'Click to open file'#13#10#13#10'Keyboard Sh' +
        'ortcuts:'#13#10'Arrow Keys / Page Up/Down: Navigate pages'#13#10'Home/End:' +
        ' First/Last page'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      ExplicitWidth = 265
      ExplicitHeight = 135
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'pdf'
    Filter = 'PDF Files (*.pdf)|*.pdf|All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Open PDF File'
    Left = 40
    Top = 40
  end
end


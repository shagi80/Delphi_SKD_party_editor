object ImportFromExcelForTurkei: TImportFromExcelForTurkei
  Left = 0
  Top = 0
  Caption = 'Import from KLASS'
  ClientHeight = 409
  ClientWidth = 1232
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BottomPanel: TPanel
    Left = 0
    Top = 360
    Width = 1232
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object checkButton: TBitBtn
      Left = 960
      Top = 6
      Width = 130
      Height = 30
      Caption = 'CHECK DATA'
      Enabled = False
      TabOrder = 0
      OnClick = checkButtonClick
      Kind = bkHelp
    end
    object createBoxButton: TBitBtn
      Left = 1096
      Top = 6
      Width = 130
      Height = 30
      Caption = 'CREATE BOXES'
      Enabled = False
      TabOrder = 1
      OnClick = createBoxButtonClick
      Kind = bkOK
    end
  end
  object MainPanel: TPanel
    Left = 0
    Top = 35
    Width = 1232
    Height = 325
    Align = alClient
    TabOrder = 1
    object table: TStringGrid
      Left = 1
      Top = 1
      Width = 1230
      Height = 323
      Align = alClient
      ColCount = 11
      DefaultColWidth = 30
      RowCount = 50
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing]
      TabOrder = 0
      ColWidths = (
        30
        59
        59
        94
        209
        46
        52
        54
        228
        79
        281)
      RowHeights = (
        24
        23
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24)
    end
  end
  object topPanel: TPanel
    Left = 0
    Top = 0
    Width = 1232
    Height = 35
    Align = alTop
    BorderWidth = 5
    TabOrder = 2
    object infoLabel: TLabel
      Left = 1178
      Top = 6
      Width = 48
      Height = 23
      Align = alRight
      Caption = 'info'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 904
      ExplicitTop = 1
      ExplicitHeight = 39
    end
    object pasteButton: TSpeedButton
      Left = 6
      Top = 6
      Width = 75
      Height = 23
      Align = alLeft
      Caption = 'PASTE'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = pasteButtonClick
    end
    object clearButton: TSpeedButton
      Left = 81
      Top = 6
      Width = 75
      Height = 23
      Align = alLeft
      Caption = 'CLEAR'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = clearButtonClick
      ExplicitLeft = 182
    end
    object delRowButton: TSpeedButton
      Left = 156
      Top = 6
      Width = 109
      Height = 23
      Align = alLeft
      Caption = 'DELETE ROW'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = delRowButtonClick
    end
  end
end

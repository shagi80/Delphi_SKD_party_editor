object RateForm: TRateForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1091#1088#1089#1099' '#1074#1072#1083#1102#1090
  ClientHeight = 152
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 22
    Top = 26
    Width = 116
    Height = 13
    Caption = #1050#1091#1088#1089' USD:  1 USD   = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 207
    Top = 26
    Width = 22
    Height = 13
    Caption = #1056#1059#1041
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 22
    Top = 58
    Width = 120
    Height = 13
    Caption = #1050#1091#1088#1089' RMB:  1 RMB   = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 207
    Top = 58
    Width = 22
    Height = 13
    Caption = #1056#1059#1041
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object USDtoRUBED: TEdit
    Left = 144
    Top = 24
    Width = 57
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    Text = 'USDtoRUBED'
  end
  object RUBtoRMBED: TEdit
    Left = 144
    Top = 56
    Width = 57
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    Text = 'Edit1'
  end
  object BitBtn1: TBitBtn
    Left = 45
    Top = 104
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 126
    Top = 104
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
end

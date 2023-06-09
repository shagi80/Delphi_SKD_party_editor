object CreateBoxForm: TCreateBoxForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'CreateBoxForm'
  ClientHeight = 269
  ClientWidth = 569
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 569
    Height = 269
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object BoxItmCap: TLabel
      Left = 11
      Top = 70
      Width = 53
      Height = 13
      Caption = 'BoxItmCap'
    end
    object BoxCountCap: TLabel
      Left = 11
      Top = 16
      Width = 66
      Height = 13
      Caption = 'BoxCountCap'
    end
    object BoxGNetCap: TLabel
      Left = 219
      Top = 16
      Width = 66
      Height = 13
      Caption = 'BoxCountCap'
    end
    object BoxNetCap: TLabel
      Left = 219
      Top = 48
      Width = 66
      Height = 13
      Caption = 'BoxCountCap'
    end
    object BoxSG: TStringGrid
      AlignWithMargins = True
      Left = 11
      Top = 104
      Width = 547
      Height = 154
      Margins.Left = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alBottom
      ColCount = 4
      Ctl3D = False
      DefaultColWidth = 20
      FixedColor = clWindow
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentCtl3D = False
      TabOrder = 0
      OnKeyPress = BoxSGKeyPress
      OnKeyUp = BoxSGKeyUp
      OnSelectCell = BoxSGSelectCell
      ColWidths = (
        20
        349
        59
        85)
    end
    object BoxCount: TEdit
      Left = 128
      Top = 13
      Width = 41
      Height = 21
      TabOrder = 1
      Text = '1'
      OnKeyPress = BoxCountKeyPress
      OnKeyUp = BoxGNetKeyUp
    end
    object UpDown1: TUpDown
      Left = 169
      Top = 13
      Width = 16
      Height = 21
      Associate = BoxCount
      Min = 1
      Max = 10000
      Position = 1
      TabOrder = 2
      OnClick = UpDown1Click
    end
    object BitBtn1: TBitBtn
      Left = 483
      Top = 11
      Width = 75
      Height = 25
      TabOrder = 3
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 402
      Top = 11
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 4
      OnClick = BitBtn2Click
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
    object BoxGNet: TEdit
      Left = 336
      Top = 18
      Width = 49
      Height = 21
      TabOrder = 5
      Text = '0'
      OnKeyPress = BoxGnetKeyPress
      OnKeyUp = BoxGNetKeyUp
    end
    object BoxNet: TEdit
      Left = 336
      Top = 45
      Width = 49
      Height = 21
      TabOrder = 6
      Text = '0'
      OnKeyPress = BoxCountKeyPress
      OnKeyUp = BoxNetKeyUp
    end
    object BoxNumberEdit: TEdit
      Left = 112
      Top = 40
      Width = 73
      Height = 21
      TabOrder = 7
      Visible = False
    end
    object BoxNumberCheck: TCheckBox
      Left = 11
      Top = 35
      Width = 87
      Height = 29
      Caption = 'set box nuber'
      TabOrder = 8
      OnClick = BoxNumberCheckClick
    end
  end
end

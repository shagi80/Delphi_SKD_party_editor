object CntLstForm: TCntLstForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'CntLstForm'
  ClientHeight = 271
  ClientWidth = 255
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
    Width = 255
    Height = 233
    Align = alTop
    TabOrder = 0
    object BCLB: TLabel
      Left = 24
      Top = 198
      Width = 24
      Height = 13
      Caption = 'BCLB'
    end
    object CntLst: TListBox
      Left = 1
      Top = 1
      Width = 253
      Height = 181
      Margins.Left = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alTop
      ItemHeight = 13
      TabOrder = 0
    end
    object BCED: TEdit
      Left = 169
      Top = 195
      Width = 35
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = '0'
    end
    object BCUD: TUpDown
      Left = 204
      Top = 195
      Width = 16
      Height = 21
      Associate = BCED
      TabOrder = 2
    end
  end
  object BitBtn1: TBitBtn
    Left = 48
    Top = 239
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 129
    Top = 239
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end

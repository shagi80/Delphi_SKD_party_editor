object PrSetForm: TPrSetForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Print settup'
  ClientHeight = 140
  ClientWidth = 237
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
    Width = 237
    Height = 97
    Align = alTop
    TabOrder = 0
    object PrRG: TRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 229
      Height = 89
      Align = alClient
      Caption = 'Print mode'
      TabOrder = 0
      ExplicitTop = 55
      ExplicitHeight = 102
    end
  end
  object BitBtn1: TBitBtn
    Left = 39
    Top = 103
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 103
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end

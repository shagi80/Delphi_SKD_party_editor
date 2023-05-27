object NewContForm: TNewContForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'NewContForm'
  ClientHeight = 185
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 291
    Height = 145
    Align = alTop
    TabOrder = 0
    object NewContMaxVolCap: TLabel
      Left = 16
      Top = 100
      Width = 121
      Height = 13
      AutoSize = False
      Caption = 'NewContMaxVolCap'
    end
    object NewContMaxNetCap: TLabel
      Left = 16
      Top = 72
      Width = 121
      Height = 13
      AutoSize = False
      Caption = 'NewContMaxNetCap'
    end
    object NewContNameCap: TLabel
      Left = 16
      Top = 16
      Width = 265
      Height = 13
      AutoSize = False
      Caption = 'NewContNameCap'
    end
    object NewContName: TEdit
      Left = 16
      Top = 35
      Width = 248
      Height = 21
      TabOrder = 0
      Text = 'NewContName'
    end
    object NewContMaxNet: TEdit
      Left = 143
      Top = 69
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'NewContMaxNet'
      OnKeyPress = NewContMaxNetKeyPress
    end
    object NewContMaxVol: TEdit
      Left = 143
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'NewContMaxVol'
      OnKeyPress = NewContMaxNetKeyPress
    end
  end
  object BitBtn1: TBitBtn
    Left = 62
    Top = 151
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 151
    Top = 151
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end

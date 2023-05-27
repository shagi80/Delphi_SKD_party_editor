object DtEDForm: TDtEDForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1087#1080#1089#1080' '#1086' '#1076#1077#1090#1072#1083#1080
  ClientHeight = 442
  ClientWidth = 560
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
    Width = 560
    Height = 393
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 55
      Height = 13
      Caption = #1050#1086#1076' '#1087#1086' 1'#1057':'
    end
    object Label2: TLabel
      Left = 16
      Top = 43
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label3: TLabel
      Left = 16
      Top = 71
      Width = 98
      Height = 13
      Caption = #1055#1086#1083' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label7: TLabel
      Left = 16
      Top = 126
      Width = 97
      Height = 13
      Caption = #1040#1085#1075' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label8: TLabel
      Left = 16
      Top = 98
      Width = 97
      Height = 13
      Caption = #1050#1086#1083' '#1074' '#1103#1097#1080#1082#1077' ('#1090#1077#1082'):'
    end
    object Label10: TLabel
      Left = 284
      Top = 261
      Width = 61
      Height = 13
      Caption = #1064#1090#1088#1080#1093'-'#1082#1086#1076':'
    end
    object Label12: TLabel
      Left = 16
      Top = 261
      Width = 48
      Height = 13
      Caption = 'BOM '#1082#1086#1076':'
    end
    object Label13: TLabel
      Left = 284
      Top = 287
      Width = 95
      Height = 13
      Caption = #1047#1072#1082#1072#1079' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
    end
    object Label14: TLabel
      Left = 16
      Top = 288
      Width = 64
      Height = 13
      Caption = #1042#1077#1089' 1 '#1077#1076', '#1082#1075':'
    end
    object Label15: TLabel
      Left = 284
      Top = 207
      Width = 80
      Height = 13
      Caption = #1054#1073#1098#1077#1084' 1 '#1077#1076', '#1082#1075':'
    end
    object Label16: TLabel
      Left = 16
      Top = 207
      Width = 77
      Height = 13
      Caption = #1062#1077#1085#1072' FOB,USD:'
    end
    object Bevel2: TBevel
      Left = 16
      Top = 343
      Width = 521
      Height = 7
      Shape = bsTopLine
    end
    object Label4: TLabel
      Left = 284
      Top = 98
      Width = 102
      Height = 13
      Caption = #1050#1086#1083' '#1074' '#1103#1097#1080#1082#1077' ('#1089#1090#1072#1088'):'
    end
    object Label5: TLabel
      Left = 284
      Top = 234
      Width = 105
      Height = 13
      Caption = #1062#1077#1085#1072' '#1053#1086#1074#1086#1074#1088#1086#1089',USD:'
    end
    object Label6: TLabel
      Left = 16
      Top = 234
      Width = 98
      Height = 13
      Caption = #1062#1077#1085#1072' '#1040#1085#1075#1072#1088#1089#1082',USD:'
    end
    object Label9: TLabel
      Left = 284
      Top = 16
      Width = 103
      Height = 13
      Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103':'
    end
    object Label11: TLabel
      Left = 16
      Top = 152
      Width = 98
      Height = 13
      Caption = #1050#1080#1090' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label17: TLabel
      Left = 16
      Top = 180
      Width = 61
      Height = 13
      Caption = #1050#1086#1076' '#1058#1053#1042#1069#1044':'
    end
    object Label18: TLabel
      Left = 284
      Top = 180
      Width = 74
      Height = 13
      Caption = #1042#1080#1076' '#1091#1087#1072#1082#1086#1074#1082#1080':'
    end
    object Label19: TLabel
      Left = 16
      Top = 314
      Width = 64
      Height = 13
      Caption = #1042#1077#1089' 1 '#1077#1076', '#1082#1075':'
    end
    object ENameED: TEdit
      Left = 127
      Top = 123
      Width = 409
      Height = 21
      TabOrder = 0
      Text = 'ENameED'
    end
    object BomED: TEdit
      Left = 127
      Top = 258
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'BomED'
    end
    object QtyED: TEdit
      Left = 415
      Top = 285
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'QtyED'
    end
    object WghtED: TEdit
      Left = 127
      Top = 285
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'WghtED'
    end
    object VolED: TEdit
      Left = 415
      Top = 204
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'VolED'
    end
    object FOBED: TEdit
      Left = 127
      Top = 204
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'FOBED'
    end
    object TCB: TCheckBox
      Left = 16
      Top = 356
      Width = 433
      Height = 17
      Caption = 
        #1080#1079#1084#1077#1085#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080' '#1074#1086' '#1074#1089#1077#1093' '#1079#1072#1082#1072#1079#1072#1093' ('#1079#1072#1082#1072#1079#1072#1085#1085#1099#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1085#1077' '#1084#1077 +
        #1085#1103#1102#1090#1089#1103')'
      TabOrder = 6
      OnClick = TCBClick
    end
    object CodeED: TEdit
      Left = 127
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 7
      Text = 'CodeED'
    end
    object RNameED: TEdit
      Left = 127
      Top = 40
      Width = 409
      Height = 21
      TabOrder = 8
      Text = 'RNameED'
    end
    object LRNameED: TEdit
      Left = 127
      Top = 69
      Width = 409
      Height = 21
      TabOrder = 9
      Text = 'LRNameED'
    end
    object CIBED: TEdit
      Left = 127
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 10
      Text = 'CIBED'
    end
    object BARED: TEdit
      Left = 415
      Top = 258
      Width = 121
      Height = 21
      TabOrder = 11
      Text = 'BARED'
    end
    object CIBOldED: TEdit
      Left = 416
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 12
      Text = 'Edit4'
    end
    object PRNED: TEdit
      Left = 415
      Top = 231
      Width = 121
      Height = 21
      TabOrder = 13
      Text = 'FOBED'
    end
    object PRAED: TEdit
      Left = 127
      Top = 231
      Width = 121
      Height = 21
      TabOrder = 14
      Text = 'FOBED'
    end
    object EICB: TComboBox
      Left = 414
      Top = 13
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 15
      Items.Strings = (
        #1096#1090' /  pcs'
        #1082#1075'  /  kg'
        #1075'    /  g'
        #1084'    /  m'
        #1089#1084'  /  mm'
        #1084#1084'  /  cm')
    end
    object TNCodeED: TEdit
      Left = 127
      Top = 177
      Width = 121
      Height = 21
      TabOrder = 16
      Text = 'FOBED'
    end
    object BoxTypeEd: TEdit
      Left = 415
      Top = 177
      Width = 121
      Height = 21
      TabOrder = 17
      Text = 'VolED'
    end
    object CnNameED: TTntEdit
      Left = 127
      Top = 150
      Width = 408
      Height = 21
      TabOrder = 18
      Text = 'CnNameED'
    end
    object CIOneEd: TEdit
      Left = 127
      Top = 311
      Width = 121
      Height = 21
      TabOrder = 19
      Text = 'WghtED'
    end
  end
  object BitBtn1: TBitBtn
    Left = 477
    Top = 409
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 396
    Top = 409
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
end

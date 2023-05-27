object CompForm: TCompForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1040#1085#1072#1083#1080#1079' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
  ClientHeight = 266
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NB: TNotebook
    Left = 0
    Top = 0
    Width = 376
    Height = 266
    Align = alClient
    PageIndex = 1
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 376
        Height = 266
        Align = alClient
        TabOrder = 0
        object GroupBox4: TGroupBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 368
          Height = 141
          Align = alTop
          Caption = #1055#1086#1083#1091#1095#1077#1085#1085#1099#1077' '#1082#1086#1085#1090#1077#1081#1085#1077#1088#1072': '
          TabOrder = 0
          object ContCBL: TCheckListBox
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 358
            Height = 118
            Align = alClient
            ItemHeight = 13
            TabOrder = 0
          end
        end
        object GroupBox5: TGroupBox
          AlignWithMargins = True
          Left = 4
          Top = 151
          Width = 368
          Height = 79
          Align = alTop
          Caption = #1060#1072#1081#1083' '#1074#1099#1075#1088#1091#1079#1082#1080' '#1089#1082#1072#1085#1077#1088#1072': '
          TabOrder = 1
          object Panel3: TPanel
            Left = 2
            Top = 15
            Width = 364
            Height = 27
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object FNameED: TEdit
              AlignWithMargins = True
              Left = 10
              Top = 3
              Width = 308
              Height = 21
              Margins.Left = 10
              Align = alClient
              ReadOnly = True
              TabOrder = 0
              Text = 'FNameED'
            end
            object Button1: TButton
              AlignWithMargins = True
              Left = 324
              Top = 3
              Width = 30
              Height = 21
              Margins.Right = 10
              Align = alRight
              Caption = '...'
              TabOrder = 1
              OnClick = Button1Click
            end
          end
          object ModeRG: TRadioGroup
            AlignWithMargins = True
            Left = 12
            Top = 40
            Width = 344
            Height = 37
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Align = alBottom
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #1082#1086#1076'-'#1082#1086#1088#1086#1073#1082#1072
              #1082#1086#1076'-'#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086)
            TabOrder = 1
          end
        end
        object BitBtn1: TBitBtn
          Left = 296
          Top = 236
          Width = 75
          Height = 25
          Caption = #1054#1090#1084#1077#1085#1072
          TabOrder = 2
          Kind = bkCancel
        end
        object CompBtn: TBitBtn
          Left = 220
          Top = 236
          Width = 75
          Height = 25
          Caption = 'OK'
          Default = True
          TabOrder = 3
          OnClick = CompBtnClick
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
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Fin'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 376
        Height = 266
        Align = alClient
        TabOrder = 0
        object GB3: TGroupBox
          AlignWithMargins = True
          Left = 4
          Top = 172
          Width = 368
          Height = 78
          Align = alTop
          Caption = #1051#1080#1096#1085#1077#1077': '
          TabOrder = 0
          object AddLB: TLabel
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 358
            Height = 16
            Align = alTop
            Alignment = taCenter
            Caption = 'AddLB'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
            ExplicitWidth = 41
          end
          object sb6: TSpeedButton
            Left = 125
            Top = 50
            Width = 120
            Height = 25
            Caption = #1057#1087#1080#1089#1086#1082' '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1086#1074
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sb6Click
          end
        end
        object GB2: TGroupBox
          AlignWithMargins = True
          Left = 4
          Top = 88
          Width = 368
          Height = 78
          Align = alTop
          Caption = #1053#1077' '#1085#1072#1081#1076#1077#1085#1086':  '
          TabOrder = 1
          object NotFindLB: TLabel
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 358
            Height = 16
            Align = alTop
            Alignment = taCenter
            Caption = 'Label1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
            ExplicitWidth = 42
          end
          object SB3: TSpeedButton
            Left = 5
            Top = 50
            Width = 120
            Height = 25
            Caption = #1057#1087#1080#1089#1086#1082' '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1086#1074
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = SB3Click
          end
          object SB4: TSpeedButton
            Left = 125
            Top = 50
            Width = 120
            Height = 25
            Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1088#1086#1073#1086#1082
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = SB4Click
          end
          object SB5: TSpeedButton
            Left = 245
            Top = 50
            Width = 120
            Height = 25
            Caption = #1057#1087#1080#1089#1086#1082' '#1076#1077#1090#1072#1083#1077#1081
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = SB5Click
          end
        end
        object GB1: TGroupBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 368
          Height = 78
          Align = alTop
          Caption = #1053#1072#1081#1076#1077#1085#1086': '
          TabOrder = 2
          object FindLb: TLabel
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 358
            Height = 16
            Align = alTop
            Alignment = taCenter
            Caption = 'Label1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
            ExplicitWidth = 42
          end
          object SB1: TSpeedButton
            Left = 5
            Top = 50
            Width = 120
            Height = 25
            Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' 1'#1057
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = SB1Click
          end
          object SB2: TSpeedButton
            Left = 245
            Top = 50
            Width = 120
            Height = 25
            Caption = #1057#1087#1080#1089#1086#1082' '#1076#1077#1090#1072#1083#1077#1081
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = SB2Click
          end
        end
      end
    end
  end
  object tmPanel: TPanel
    Left = 80
    Top = 54
    Width = 225
    Height = 78
    Caption = #1055#1086#1078#1072#1083#1091#1081#1089#1090#1072', '#1087#1086#1076#1086#1078#1076#1080#1090#1077' ....'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 217
      Height = 16
      Align = alTop
      Caption = ' '#1040#1085#1072#1083#1080#1079' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
      Color = clActiveCaption
      ParentColor = False
      ExplicitWidth = 124
    end
  end
  object OpenDlg: TOpenDialog
    DefaultExt = '*.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' (*.txt)|*.txt'
    Title = #1054#1090#1082#1088#1099#1090#1080#1077' '#1092#1072#1081#1083#1072' '#1089#1082#1072#1085#1077#1088#1072
    Left = 344
    Top = 8
  end
  object SaveDlg: TSaveDialog
    Left = 304
    Top = 8
  end
end

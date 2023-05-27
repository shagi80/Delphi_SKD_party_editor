object FindForm: TFindForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Find'
  ClientHeight = 304
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 265
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 655
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 721
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 647
      object ED: TEdit
        AlignWithMargins = True
        Left = 10
        Top = 7
        Width = 271
        Height = 25
        Margins.Left = 10
        Margins.Top = 7
        Margins.Right = 10
        Margins.Bottom = 8
        Align = alClient
        TabOrder = 0
        Text = 'ED'
        ExplicitWidth = 197
        ExplicitHeight = 21
      end
      object Cbtn: TButton
        AlignWithMargins = True
        Left = 651
        Top = 7
        Width = 60
        Height = 25
        Margins.Top = 7
        Margins.Right = 10
        Margins.Bottom = 8
        Align = alRight
        Caption = 'By 1C'
        TabOrder = 1
        OnClick = CbtnClick
        ExplicitLeft = 577
      end
      object NameBtn: TButton
        AlignWithMargins = True
        Left = 519
        Top = 7
        Width = 60
        Height = 25
        Margins.Top = 7
        Margins.Bottom = 8
        Align = alRight
        Caption = 'By name'
        TabOrder = 2
        OnClick = NameBtnClick
        ExplicitLeft = 445
      end
      object BomBtn: TButton
        AlignWithMargins = True
        Left = 585
        Top = 7
        Width = 60
        Height = 25
        Margins.Top = 7
        Margins.Bottom = 8
        Align = alRight
        Caption = 'By BOM'
        TabOrder = 3
        OnClick = BomBtnClick
        ExplicitLeft = 511
      end
      object RG: TRadioGroup
        AlignWithMargins = True
        Left = 294
        Top = 0
        Width = 153
        Height = 37
        Margins.Top = 0
        Align = alRight
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #1074' '#1085#1072#1095#1072#1083#1077
          #1074#1077#1079#1076#1077)
        TabOrder = 4
        ExplicitLeft = 220
      end
      object ENameBtn: TButton
        AlignWithMargins = True
        Left = 453
        Top = 7
        Width = 60
        Height = 25
        Margins.Top = 7
        Margins.Bottom = 8
        Align = alRight
        Caption = 'By name'
        TabOrder = 5
        OnClick = ENameBtnClick
        ExplicitLeft = 379
      end
    end
    object SG: TStringGrid
      AlignWithMargins = True
      Left = 4
      Top = 50
      Width = 721
      Height = 211
      Align = alClient
      ColCount = 8
      DefaultColWidth = 20
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goRowSelect]
      TabOrder = 1
      OnDblClick = OkBtnClick
      OnDrawCell = SGDrawCell
      ExplicitWidth = 647
      ColWidths = (
        20
        75
        112
        67
        132
        85
        32
        57)
    end
  end
  object OkBtn: TBitBtn
    Left = 509
    Top = 271
    Width = 100
    Height = 25
    TabOrder = 1
    OnClick = OkBtnClick
    Kind = bkOK
  end
  object CanBtn: TBitBtn
    Left = 615
    Top = 271
    Width = 100
    Height = 25
    TabOrder = 2
    OnClick = CanBtnClick
    Kind = bkCancel
  end
end

object SDIAppForm: TSDIAppForm
  Left = 0
  Top = 100
  Caption = 'SDI'
  ClientHeight = 777
  ClientWidth = 1213
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 24
    Top = 7
    Width = 89
    Height = 13
    AutoSize = False
    Caption = 'ContNet'
  end
  object Label4: TLabel
    Left = 24
    Top = 26
    Width = 89
    Height = 13
    AutoSize = False
    Caption = 'ContNet'
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 758
    Width = 1213
    Height = 19
    AutoHint = True
    Panels = <>
    SimplePanel = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 34
    Width = 1213
    Height = 724
    Align = alClient
    BevelOuter = bvLowered
    Color = clAppWorkSpace
    TabOrder = 1
    object LoadPN: TPanel
      AlignWithMargins = True
      Left = 371
      Top = 11
      Width = 831
      Height = 545
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      TabOrder = 0
      object LoadSG: TTntStringGrid
        Left = 1
        Top = 79
        Width = 829
        Height = 403
        Align = alClient
        ColCount = 11
        DefaultColWidth = 25
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 4
        OnDblClick = LoadSGDblClick
        OnDrawCell = LoadSGDrawCell
        OnMouseDown = LoadSGMouseDown
        OnSelectCell = LoadSGSelectCell
        ColWidths = (
          25
          44
          90
          63
          55
          51
          56
          62
          61
          51
          51)
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 829
        Height = 57
        Align = alTop
        TabOrder = 0
        object LoadPnCap: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 821
          Height = 20
          Align = alTop
          AutoSize = False
          Caption = '  Orders lists'
          Color = clActiveCaption
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 334
        end
        object ToolBar2: TToolBar
          Left = 1
          Top = 27
          Width = 827
          Height = 28
          BorderWidth = 1
          Color = clBtnFace
          Images = ImgLst
          Indent = 5
          ParentColor = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Wrapable = False
          object ContCreateBtn: TToolButton
            Left = 5
            Top = 0
            Action = actNewCont
          end
          object LoadSGDelContBtn: TToolButton
            Left = 28
            Top = 0
            Action = actDelCont
          end
          object ChContDtBtn: TToolButton
            Left = 51
            Top = 0
            Caption = 'ChContDtBtn'
            ImageIndex = 19
            OnClick = ChContDtBtnClick
          end
          object ToolButton6: TToolButton
            Left = 74
            Top = 0
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 7
            Style = tbsSeparator
          end
          object FindInOrdBtn: TToolButton
            Left = 82
            Top = 0
            Caption = 'FindInOrdBtn'
            ImageIndex = 13
            OnClick = FindInOrdBtnClick
          end
          object LoadSGEdBtn: TToolButton
            Left = 105
            Top = 0
            Caption = 'LoadSGEdBtn'
            ImageIndex = 10
            OnClick = LoadSGEdBtnClick
          end
          object movBoxBtn: TToolButton
            Left = 128
            Top = 0
            Caption = 'movBoxBtn'
            Enabled = False
            ImageIndex = 18
            OnClick = movBoxBtnClick
          end
          object ToolButton4: TToolButton
            Left = 151
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 14
            Style = tbsSeparator
          end
          object ToolButton5: TToolButton
            Left = 159
            Top = 0
            Action = actMaxLoadPn
          end
          object ToolButton8: TToolButton
            Left = 182
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 14
            Style = tbsSeparator
          end
          object SelAllBtn: TToolButton
            Left = 190
            Top = 0
            Caption = 'SelAllBtn'
            ImageIndex = 17
            OnClick = SelAllBtnClick
          end
          object UnSelAllBtn: TToolButton
            Left = 213
            Top = 0
            Caption = 'UnSelAllBtn'
            ImageIndex = 15
            OnClick = UnSelAllBtnClick
          end
          object InvSelBtn: TToolButton
            Left = 236
            Top = 0
            Caption = 'InvSelBtn'
            ImageIndex = 16
            OnClick = InvSelBtnClick
          end
          object ToolButton11: TToolButton
            Left = 259
            Top = 0
            Width = 8
            Caption = 'ToolButton11'
            ImageIndex = 18
            Style = tbsSeparator
          end
          object PrintContLstBtn: TToolButton
            Left = 267
            Top = 0
            Caption = 'PrintContLstBtn'
            ImageIndex = 14
            OnClick = PrintContLstBtnClick
          end
          object ToolButton3: TToolButton
            Left = 290
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 25
            Style = tbsSeparator
          end
          object ExpContBtn: TToolButton
            Left = 298
            Top = 0
            Caption = 'ExpContLstBtn'
            ImageIndex = 23
            OnClick = ExpContBtnClick
          end
          object CompScanBtn: TToolButton
            Left = 321
            Top = 0
            Caption = 'CompScanBtn'
            ImageIndex = 24
            OnClick = CompScanBtnClick
          end
        end
      end
      object ContTbs: TTabSet
        AlignWithMargins = True
        Left = 1
        Top = 58
        Width = 828
        Height = 21
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 1
        Margins.Bottom = 0
        Align = alTop
        BackgroundColor = clAppWorkSpace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        SoftTop = True
        Style = tsSoftTabs
        TabPosition = tpTop
        OnChange = ContTbsChange
      end
      object ContrDtPn: TPanel
        Left = 1
        Top = 482
        Width = 829
        Height = 62
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object ContVol: TLabel
          Left = 322
          Top = 34
          Width = 89
          Height = 13
          AutoSize = False
          Caption = 'ContVol'
          OnClick = ContVolClick
        end
        object ContNet: TLabel
          Left = 322
          Top = 15
          Width = 89
          Height = 13
          AutoSize = False
          Caption = 'ContNet'
        end
        object MaxContNetCap: TLabel
          Left = 24
          Top = 15
          Width = 107
          Height = 13
          AutoSize = False
          Caption = 'MaxContNetCap'
        end
        object MaxContVolCap: TLabel
          Left = 24
          Top = 34
          Width = 107
          Height = 13
          AutoSize = False
          Caption = 'MaxContVolCap'
        end
        object MaxContNet: TLabel
          Left = 137
          Top = 14
          Width = 89
          Height = 13
          AutoSize = False
          Caption = 'MaxContNet'
        end
        object MaxContVol: TLabel
          Left = 137
          Top = 34
          Width = 89
          Height = 13
          AutoSize = False
          Caption = 'MaxContVol'
        end
        object RealContNetCap: TLabel
          Left = 203
          Top = 15
          Width = 113
          Height = 13
          AutoSize = False
          Caption = 'RealContNetCap'
        end
        object RealContVolCap: TLabel
          Left = 203
          Top = 34
          Width = 113
          Height = 13
          AutoSize = False
          Caption = 'RealContVolCap'
        end
        object RealContNNetCap: TLabel
          Left = 397
          Top = 15
          Width = 113
          Height = 13
          AutoSize = False
          Caption = 'RealContNNetCap'
        end
        object RealBoxCount: TLabel
          Left = 397
          Top = 34
          Width = 113
          Height = 13
          AutoSize = False
          Caption = 'RealBoxCap'
        end
        object ContBox: TLabel
          Left = 516
          Top = 34
          Width = 89
          Height = 13
          AutoSize = False
          Caption = 'ContBox'
        end
        object ContNNet: TLabel
          Left = 516
          Top = 15
          Width = 89
          Height = 13
          AutoSize = False
          Caption = 'ContNNet'
        end
      end
      object BNETED: TEdit
        Left = 38
        Top = 143
        Width = 27
        Height = 21
        TabOrder = 2
        Text = '0'
        Visible = False
        OnKeyPress = BNETEDKeyPress
      end
    end
    object DataPn: TPanel
      AlignWithMargins = True
      Left = 11
      Top = 566
      Width = 1191
      Height = 147
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alBottom
      Color = clWhite
      TabOrder = 1
      object DtPnBomCap: TLabel
        Left = 79
        Top = 80
        Width = 81
        Height = 13
        AutoSize = False
        Caption = 'DtPnBomCap'
        Layout = tlCenter
      end
      object Image1: TImage
        AlignWithMargins = True
        Left = 11
        Top = 33
        Width = 46
        Height = 108
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alLeft
        Picture.Data = {
          0A544A504547496D6167659E050000FFD8FFE000104A46494600010101006000
          600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC00011080038002B03012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F698
          E5964F319A57C896451838E03103F414FDCFFF003D64FF00BEAA2B7FBB27FD76
          97FF00436A96800DCFFF003D64FF00BE8D24C65F299A1B8955C0C8C907F98A5A
          3FFD5401369F7E2EE250E024DB436DECC3D47E7F87E44DDAE78DADF7950A8B9B
          5CC2A023244CADC0C752DFD2B56D6F8496EAD3ED49790CA0F19071FD2802A41F
          71FF00EBB4BFFA31AB9EF1378A134C68B4CD3A7B36D6EE6448A04B8DC62899D8
          2AB4DB01650C4851C6493D94332F430FDC7FFAEB2FFE8C6AF3FF000D4FF6DF10
          6B5E20D42F34116A845CC76EA035DE9ACD184733BB7FA87F2E25574191943C8D
          A7771E3F190C1D09569ABDBA777D11518B93B1CF6B5A378BF5AD120B99EE756B
          8BD87525820F3E1815A08CC6AAF729147B479A25DEA8CCE5515B70603F7C2C68
          5F11757D335BD421F124FF006FB1B56786EEF6D6148EDEDA642A088F76D77450
          7E7621897922455F990CB7753F89525AF8CF4AD1ED628655BA9C25C5AB44DE75
          BC3DE691B7623239631142422E5CA13B55BF11F4BB58AF2DB56336991488AD70
          2D9A74B7B8BC9E3036950D1C8B70E17E44565F9379C13BFE5F17059AE323898D
          0C741479D36BCBC9FE3E6692A71E5BC7A1EA55418E6493FEBA37F3354BC1C35E
          1E14B11E2760DACE1CDC11B3FBEDB47C9F2FDDDBD2AD8FBD27FD747FFD08D7D3
          189760FB8FFF005DA5FF00D18D5C2F8B2DEEEC75892FAFE2D32E742D400B1BA9
          6E5DA196DADDC0564126424699DEE589DCECC918E421AEEADFEE49FF005DA5FF
          00D0DAA4E2B1C4518D7A52A52D98D3B3B9E4D16A7E12B6B1BCF15CD79A9DCDFE
          A57D0D9B5EDCDA62766DAA620A91A20F2CC61251B4062369CEF0A02E83A4EA1E
          33D52F3FB4F4FB11E1F8256B686F2D6EC96BDB7D8C0C6AF1901937946C8DBB3F
          7918186755F46FEC2D3BFB5FFB53C993ED5BFCCFF5CFB37ECF2F7F979D9BF67C
          BBB19C719C5686EAE0C26550C3D795794DCE4FABE854A77561D59CBD5FFEBA3F
          FE846AF17AA09FC7FEFB7FE846BD520B21A681E58CDA5C37EF5D8322E4105891
          DFDE8F3E6FF9F1BBFF00BF7FFD7A28A00433CDFF003E377FF7EFFF00AF49E74D
          FF003E375FF7C7FF005E8A28013CD9FF00E7C6EBFEF8FF00EBD1059DCBC7B8C0
          E9B998ED6E08E4D145007FFFD9}
        ExplicitLeft = 6
        ExplicitTop = 32
        ExplicitHeight = 82
      end
      object DtPnCIOCap: TLabel
        Left = 79
        Top = 99
        Width = 81
        Height = 13
        AutoSize = False
        Caption = 'DtPnCIOCap'
        Layout = tlCenter
      end
      object DtPnEICap: TLabel
        Left = 79
        Top = 118
        Width = 81
        Height = 13
        AutoSize = False
        Caption = 'DtPnEICap'
        Layout = tlCenter
      end
      object DtPnBom: TLabel
        Left = 166
        Top = 80
        Width = 82
        Height = 13
        AutoSize = False
        Caption = 'DtPnBom'
        Layout = tlCenter
      end
      object DtPnCIO: TLabel
        Left = 166
        Top = 99
        Width = 82
        Height = 13
        AutoSize = False
        Caption = 'DtPnCIO'
        Layout = tlCenter
      end
      object DtPnEI: TLabel
        Left = 166
        Top = 118
        Width = 82
        Height = 13
        AutoSize = False
        Caption = 'DtPnEI'
        Layout = tlCenter
      end
      object DtPnNetCap: TLabel
        Left = 254
        Top = 80
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnNetCap'
        Layout = tlCenter
      end
      object DtPnVolCap: TLabel
        Left = 254
        Top = 99
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnVolCap'
        Layout = tlCenter
      end
      object DtPnCIBCap: TLabel
        Left = 254
        Top = 118
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnCIBCap'
        Layout = tlCenter
      end
      object DtPnNet: TLabel
        Left = 361
        Top = 80
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnNet'
        Layout = tlCenter
      end
      object DtPnCIB: TLabel
        Left = 361
        Top = 118
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnCIB'
        Layout = tlCenter
      end
      object DtPnVol: TLabel
        Left = 361
        Top = 99
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnVol'
        Layout = tlCenter
      end
      object DtPnBarCap: TLabel
        Left = 468
        Top = 80
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnBarCap'
        Layout = tlCenter
      end
      object DtPnBar: TLabel
        Left = 575
        Top = 80
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnBar'
        Layout = tlCenter
      end
      object DtPnTCCap: TLabel
        Left = 468
        Top = 99
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnTCCap'
        Layout = tlCenter
      end
      object DtPnTC: TLabel
        Left = 575
        Top = 99
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnTC'
        Layout = tlCenter
      end
      object DtPnLCCap: TLabel
        Left = 468
        Top = 118
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnLCCap'
        Layout = tlCenter
      end
      object DtPnLC: TLabel
        Left = 575
        Top = 118
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnLC'
        Layout = tlCenter
      end
      object DtPnPriceCap: TLabel
        Left = 682
        Top = 80
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnPriceCap'
        Layout = tlCenter
      end
      object DtPnPrice: TLabel
        Left = 789
        Top = 80
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnBar'
        Layout = tlCenter
      end
      object DtPnPriceNCap: TLabel
        Left = 682
        Top = 99
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnPriceNCap'
        Layout = tlCenter
      end
      object DtPnPriceN: TLabel
        Left = 789
        Top = 99
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnPriceN'
        Layout = tlCenter
      end
      object DtPnPriceACap: TLabel
        Left = 682
        Top = 118
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnPriceACap'
        Layout = tlCenter
      end
      object DtPnPriceA: TLabel
        Left = 789
        Top = 118
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnPriceA'
        Layout = tlCenter
      end
      object DtPnNameCap: TLabel
        Left = 79
        Top = 40
        Width = 69
        Height = 13
        Caption = 'DtPnNameCap'
      end
      object DtPnName1: TLabel
        Left = 166
        Top = 40
        Width = 56
        Height = 13
        Caption = 'DtPnName1'
      end
      object DtPnTNCodeCap: TLabel
        Left = 922
        Top = 80
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnPriceCap'
        Layout = tlCenter
      end
      object DtPnTNCode: TLabel
        Left = 1029
        Top = 80
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnBar'
        Layout = tlCenter
      end
      object DtPnBoxTypeCap: TLabel
        Left = 922
        Top = 99
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnPriceNCap'
        Layout = tlCenter
      end
      object DtPnBoxType: TLabel
        Left = 1029
        Top = 99
        Width = 101
        Height = 13
        AutoSize = False
        Caption = 'DtPnPriceN'
        Layout = tlCenter
      end
      object DtPnName2: TTntLabel
        Left = 166
        Top = 58
        Width = 56
        Height = 13
        Caption = 'DtPnName2'
      end
      object DtPnCap: TTntLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 1183
        Height = 16
        Align = alTop
        AutoSize = False
        Caption = 'DtPnCap'
        Color = clActiveCaption
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
    end
    object LOrdPn: TPanel
      Left = 1
      Top = 1
      Width = 360
      Height = 565
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'LOrdPn'
      Color = clAppWorkSpace
      TabOrder = 2
      object MPn: TPanel
        AlignWithMargins = True
        Left = 317
        Top = 10
        Width = 43
        Height = 545
        Margins.Left = 0
        Margins.Top = 10
        Margins.Right = 0
        Margins.Bottom = 10
        Align = alRight
        BevelKind = bkSoft
        BevelOuter = bvNone
        BorderWidth = 3
        Color = clAppWorkSpace
        TabOrder = 0
        object AutoLoadBtn: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 85
          Width = 33
          Height = 38
          Margins.Left = 0
          Margins.Right = 0
          Align = alTop
          Flat = True
          Glyph.Data = {
            B60C0000424DB60C000000000000360400002800000041000000200000000100
            0800000000008008000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030300030303030303030303030303030303030303030303
            0303030303030303030303000303030303030303030303030303030000000303
            0303030303030303030303030303000003030303030303030303030303030303
            0303030303030303030303030303030000030303030303030303030303030300
            0000030303030303030303030303030303030000030303030303030303030303
            0303030303030303030303030303030303030300000303030303030303030303
            0303030000000303030303030303030303030303030300710003030303030303
            0303030303030303030303030303030303030303030303000300030303030303
            0303030303030300000003030303030303030300000000000000007171000303
            0303030303030303030303030303030303030303000000000000000003030003
            0303030303030303030303000000030303030303030303007171717171717171
            7171000303030303030303030303030303030303030303030003030303030303
            0303030003030303030303030303030000000303030303030303030071717171
            7171717171710003030303030303030303030303030303030303030300030303
            0303030303030300030303030303030303030300000003030303030303030300
            7171717171717171717171000303030303030303030303030303030303030303
            0003030303030303030303030003030303030303030303000000030303030303
            0303030071717171717171717171717100030303030303030303030303030303
            0303030300030303030303030303030303000303030303030303030000000303
            0303030303030300717171717171717171717171000303030303030303030303
            0303030303030303000303030303030303030303030003030303030303030300
            0000030303030303030303007171717171717171717171000303030303030303
            0303030303030303030303030003030303030303030303030003030303030303
            0303030000000303030303030303030071717171717171717171000003030303
            0303030303030303030303030303030300030303030303030303030000030303
            0303030303030300000003000000000000000000717171717171717171710000
            0000000303030303030303030000000000000000000303030303030303030300
            00000000030303030303030000000300BFBFBFBFBFBFBF000000000000000071
            7100BFBFBFBF0000000303030303030300030303030303030000000000000000
            0303000303030300000003030303030000000300BFBFBFBFBFBFBFBFBFBFBFBF
            BFBF007100BFBFBFBFBF00BFBF00030303030303000303030303030303030303
            030303000300030303030300030300030303030000000300BFBFBFBFBFBFBFBF
            BFBFBFBFBFBF0000BFBFBFBFBFBF00BFBFBF0000030303030003030303030303
            0303030303030300000303030303030003030300000303000000000000000000
            000000000000000000000000BFBFBFBFBFBF00BFBFBFBFBF0003030000000000
            00000000000000000000000000030303030303000303030303000300000000A4
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF00BFBFBFBFBFBFBF00BFBFBFBFBF00030300
            0003030303030303030303030303030003030303030303000303030303000300
            000000A4FF4F4FFFFFFFFFFFFFFF4F4FFFFF00BFBFBFBFBFBFBF00BFBFBFBFBF
            0003030000030000030303030303030000030300030303030303030003030303
            03000300000000A4FFFF4F4FFFFFFFFFFF4F4FFFFFFF00BFBFBFBFBFBFBF00BF
            BFBFBFBF00030300000303000003030303030000030303000303030303030300
            0303030303000300000000A4FFFF4F4FFFFFFFFFFF4F4FFFFFFF00BFBFBFBFBF
            BFBF00BFBFBFBFBF000303000003030000030303030300000303030003030303
            030303000303030303000300000000A4FFFF4F4F4F4F4F4F4F4F4FFFFFFF00BF
            BFBFBFBFBFBF00BFBFBFBFBF0003030000030300000000000000000003030300
            03030303030303000303030303000300000000A4FFFFFF4F4F4F4F4F4F4FFFFF
            FFFF00BFBFBFBFBFBFBF00BFBFBFBFBF00030300000303030000000000000003
            0303030003030303030303000303030303000300000000A4FFFFFF4F4FFFFFFF
            4F4FFFFFFFFF00BFBFBFBFBFBFBF00BFBFBFBFBF000303000003030300000303
            030000030303030003030303030303000303030303000300000000A4FFFFFF4F
            4FFFFFFF4F4FFFFFFFFF00BFBFBFBFBFBFBF00BFBFBFBFBF0003030000030303
            00000303030000030303030003030303030303000303030303000300000000A4
            FFFFFFFF4F4FFF4F4FFFFFFFFFFF00BFBFBFBFBFBFBF00BFBFBFBFBF00030300
            0003030303000003000003030303030003030303030303000303030303000300
            000000A4A4A4A4A44F4FA44F4FA4A4A4A4A4000000000000000000BFBFBFBFBF
            0003030000000000000000000000000000000000000000000000000003030303
            03000300000000FFA40808084F4F084F4F080808080800A4A4A4A4A4A4A4A400
            00BFBFBF00030300030003030300000300000303030303000303030303030303
            0000030303000300000000FFFFA4A408084F4F4F08080808080800A4A4A4A4A4
            A4A4A4A4A400BFBF000303000303000003030000000303030303030003030303
            030303030303000303000300000000FFFFFFA4A4A44F4F4F08080808080800A4
            A4A4A4A4A4A4A4A4A4A400000003030003030300000000000003030303030300
            03030303030303030303030000000300000000FFFFFFFFFFA4A4A4A4A4A4A4A4
            A4A4000000000000000000000000000000030300030303030300000000000000
            0000000000000000000000000000000000000300000000000000000000000000
            0000000000000003030303030303030303030303030303000000000000000000
            0000000000000000030303030303030303030303030303000000}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = AutoLoadBtnClick
          ExplicitLeft = 0
          ExplicitTop = 82
          ExplicitWidth = 40
        end
        object Bevel1: TBevel
          Left = 3
          Top = 126
          Width = 33
          Height = 20
          Align = alTop
          Shape = bsSpacer
          ExplicitTop = 135
          ExplicitWidth = 40
        end
        object CrBoxBtn: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 149
          Width = 33
          Height = 38
          Margins.Left = 0
          Margins.Right = 0
          Align = alTop
          Flat = True
          Glyph.Data = {
            B60C0000424DB60C000000000000360400002800000041000000200000000100
            0800000000008008000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030300030303030303030303030303030303030303030303
            0303030303030303030303000303030303030303030303030303030000000303
            0303030303030303030303030303000003030303030303030303030303030303
            0303030303030303030303030303030000030303030303030303030303030300
            0000030303030303030303030303030303030000030303030303030303030303
            0303030303030303030303030303030303030300000303030303030303030303
            0303030000000303030303030303030303030303030300710003030303030303
            0303030303030303030303030303030303030303030303000300030303030303
            0303030303030300000003030303030303030300000000000000007171000303
            0303030303030303030303030303030303030303000000000000000003030003
            0303030303030303030303000000030303030303030303007171717171717171
            7171000303030303030303030303030303030303030303030003030303030303
            0303030003030303030303030303030000000303030303030303030071717171
            7171717171710003030303030303030303030303030303030303030300030303
            0303030303030300030303030303030303030300000003030303030303030300
            7171717171717171717171000303030303030303030303030303030303030303
            0003030303030303030303030003030303030303030303000000030303030303
            0303030071717171717171717171717100030303030303030303030303030303
            0303030300030303030303030303030303000303030303030303030000000303
            0303030303030300717171717171717171717171000303030303030303030303
            0303030303030303000303030303030303030303030003030303030303030300
            0000030303030303030303007171717171717171717171000303030303030303
            0303030303030303030303030003030303030303030303030003030303030303
            0303030000000303030303030303030071717171717171717171000003030303
            0303030303030303030303030303030300030303030303030303030000030303
            0303030303030300000003000000000000000000717171717171717171710000
            0000000303030303030303030000000000000000000303030303030303030300
            00000000030303030303030000000300BFBFBFBFBFBFBF000000000000000071
            7100BFBFBFBF0000000303030303030300030303030303030000000000000000
            0303000303030300000003030303030000000300BFBFBFBFBFBFBFBFBFBFBFBF
            BFBF007100BFBFBFBFBF00BFBF00030303030303000303030303030303030303
            030303000300030303030300030300030303030000000300BFBFBFBFBFBFBFBF
            BFBFBFBFBFBF0000BFBFBFBFBFBF00BFBFBF0000030303030003030303030303
            03030303030303000003030303030300030303000003030000000300BFBFBFBF
            BFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF00BFBFBFBFBF0003030300030303
            0303030303030303030303000003030303030300030303030300030000000300
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBF00BFBFBFBFBF00030303
            0003030303030303030303030303030003030303030303000303030303000300
            00000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF
            0003030300030303030303030303030303030303030303030303030003030303
            0300030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BF
            BFBFBFBF00030303000303030303030303030303030303030303030303030300
            030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBF00BFBFBFBFBF000303030003030303030303030303030303030303030303
            03030300030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBF00BFBFBFBFBF0003030300030303030303030303030303030303
            0303030303030300030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF00030303000303030303030303030303
            030303030303030303030300030303030300030000000300BFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF000303030003030303030303
            03030303030303030303030303030300030303030300030000000300BFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF0003030300030303
            0303030303030303030303030303030303030300030303030300030000000300
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF00030303
            0003030303030303030303030303030303030303030303000303030303000300
            000003000000000000000000000000000000000000000000000000BFBFBFBFBF
            0003030300000000000000000000000000000000000000000000000003030303
            030003000000030300A4A4A400A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A400
            00BFBFBF00030303030003030300030303030303030303030303030303030303
            000003030300030000000303030000A400A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4
            A4A4A4A4A400BFBF000303030303000003000303030303030303030303030303
            030303030303000303000300000003030303030000A4A4A4A4A4A4A4A4A4A4A4
            A4A4A4A4A4A4A4A4A4A400000003030303030303000003030303030303030303
            0303030303030303030303000000030000000303030303030000000000000000
            0000000000000000000000000000000000030303030303030300000000000000
            0000000000000000000000000000000000000300000003030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303000000}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = CrBoxBtnClick
          ExplicitLeft = 0
        end
        object OrdSelImg: TImage
          Left = 17
          Top = 15
          Width = 20
          Height = 20
          AutoSize = True
          Picture.Data = {
            07544269746D6170C6050000424DC60500000000000036040000280000001400
            0000140000000100080000000000900100000000000000000000000100000000
            000000000000000080000080000000808000800000008000800080800000C0C0
            C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
            E00000400000004020000040400000406000004080000040A0000040C0000040
            E00000600000006020000060400000606000006080000060A0000060C0000060
            E00000800000008020000080400000806000008080000080A0000080C0000080
            E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
            E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
            E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
            E00040000000400020004000400040006000400080004000A0004000C0004000
            E00040200000402020004020400040206000402080004020A0004020C0004020
            E00040400000404020004040400040406000404080004040A0004040C0004040
            E00040600000406020004060400040606000406080004060A0004060C0004060
            E00040800000408020004080400040806000408080004080A0004080C0004080
            E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
            E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
            E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
            E00080000000800020008000400080006000800080008000A0008000C0008000
            E00080200000802020008020400080206000802080008020A0008020C0008020
            E00080400000804020008040400080406000804080008040A0008040C0008040
            E00080600000806020008060400080606000806080008060A0008060C0008060
            E00080800000808020008080400080806000808080008080A0008080C0008080
            E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
            E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
            E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
            E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
            E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
            E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
            E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
            E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
            E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
            E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
            A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000004F0000
            000000000000000000FFFF0008080808004F0008080808080808080800FFFF00
            080808004F4F4F00080808080808080800FFFF00080808004F4F4F4F00080808
            0808080800FFFF000808004F4F4F4F4F000808080808080800FFFF000808004F
            4F4F4F4F4F0008080808080800FFFF0008004F4F004F4F4F4F00080808080808
            00FFFF0008004F0008004F4F4F4F00080808080800FFFF00004F00080808004F
            4F4F00080808080800FFFF0000000808080808004F4F4F000808080800FFFF00
            0008080808080808004F4F000808080800FFFF00080808080808080808004F4F
            0008080800FF000008080808080808080808004F0008080800FFFF0008080808
            08080808080808004F00080800FFFF0008080808080808080808080800000808
            00FFFF000808080808080808080808080800000800FFFF000808080808080808
            080808080808000000FFFF000000000000000000000000000000000000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF}
          Visible = False
        end
        object DelBoxBtn: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 257
          Width = 33
          Height = 38
          Margins.Left = 0
          Margins.Right = 0
          Align = alTop
          Flat = True
          Glyph.Data = {
            B60C0000424DB60C000000000000360400002800000041000000200000000100
            0800000000008008000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030003030303030303030303030303030303030303030303030303
            0303030303030300030303030303030303030303030303030303030000000303
            0303030303030303030000030303030303030303030303030303030303030303
            0303030303030303030300000303030303030303030303030303030303030300
            0000030303030303030303030300000303030303030303030303030303030303
            0303030303030303030303030303000003030303030303030303030303030303
            03030300000003030303030303030303004F0003030303030303030303030303
            0303030303030303030303030303030303000300030303030303030303030303
            03030303030303000000030303030303030303004F4F00000000000000000303
            0303030303030303030303030303030303030303000303000000000000000003
            03030303030303030303030000000303030303030303004F4F4F4F4F4F4F4F4F
            4F00030303030303030303030303030303030303030303000303030303030303
            0303000303030303030303030303030000000303030303030303004F4F4F4F4F
            4F4F4F4F4F000303030303030303030303030303030303030303030003030303
            0303030303030003030303030303030303030300000003030303030303004F4F
            4F4F4F4F4F4F4F4F4F0003030303030303030303030303030303030303030003
            0303030303030303030300030303030303030303030303000000030303030303
            004F4F4F4F4F4F4F4F4F4F4F4F00030303030303030303030303030303030303
            0300030303030303030303030303000303030303030303030303030000000303
            03030303004F4F4F4F4F4F4F4F4F4F4F4F000303030303030303030303030303
            0303030303000303030303030303030303030003030303030303030303030300
            000003030303030303004F4F4F4F4F4F4F4F4F4F4F0003030303030303030303
            0303030303030303030300030303030303030303030300030303030303030303
            0303030000000303030303030300004F4F4F4F4F4F4F4F4F4F00030303030303
            0303030303030303030303030303000003030303030303030303000303030303
            030303030303030000000300000000000000004F4F4F4F4F4F4F4F4F4F000000
            0000000303030303030303030000000000000000030303030303030303030000
            00000000030303030303030000000300BFBFBFBFBFBFBF004F4F000000000000
            0000BFBFBFBF0000000303030303030300030303030303030003030000000000
            0000000303030300000003030303030000000300BFBFBFBFBFBFBFBF004F00BF
            BFBFBFBFBFBFBFBFBFBF00BFBF00030303030303000303030303030303000300
            030303030303030303030300030300030303030000000300BFBFBFBFBFBFBFBF
            BF0000BFBFBFBFBFBFBFBFBFBFBF00BFBFBF0000030303030003030303030303
            03030000030303030303030303030300030303000003030000000300BFBFBFBF
            BFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF0003030300030303
            0303030303030000030303030303030303030300030303030300030000000300
            BFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF00030303
            0003030303030303030303000303030303030303030303000303030303000300
            00000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF
            0003030300030303030303030303030303030303030303030303030003030303
            0300030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BF
            BFBFBFBF00030303000303030303030303030303030303030303030303030300
            030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBF00BFBFBFBFBF000303030003030303030303030303030303030303030303
            03030300030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBF00BFBFBFBFBF0003030300030303030303030303030303030303
            0303030303030300030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF00030303000303030303030303030303
            030303030303030303030300030303030300030000000300BFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF000303030003030303030303
            03030303030303030303030303030300030303030300030000000300BFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF0003030300030303
            0303030303030303030303030303030303030300030303030300030000000300
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF00030303
            0003030303030303030303030303030303030303030303000303030303000300
            000003000000000000000000000000000000000000000000000000BFBFBFBFBF
            0003030300000000000000000000000000000000000000000000000003030303
            030003000000030300A4A4A400A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A400
            00BFBFBF00030303030003030300030303030303030303030303030303030303
            000003030300030000000303030000A400A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4
            A4A4A4A4A400BFBF000303030303000003000303030303030303030303030303
            030303030303000303000300000003030303030000A4A4A4A4A4A4A4A4A4A4A4
            A4A4A4A4A4A4A4A4A4A400000003030303030303000003030303030303030303
            0303030303030303030303000000030000000303030303030000000000000000
            0000000000000000000000000000000000030303030303030300000000000000
            0000000000000000000000000000000000000300000003030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303000000}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = DelBoxBtnClick
          ExplicitLeft = 0
          ExplicitTop = 321
        end
        object DelItmBtn: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 301
          Width = 33
          Height = 38
          Margins.Left = 0
          Margins.Right = 0
          Align = alTop
          Flat = True
          Glyph.Data = {
            B60C0000424DB60C000000000000360400002800000041000000200000000100
            0800000000008008000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030000000300
            0000000000000000000000000000000000000000000000030303030303030303
            0000000000000000000000000000000000000000000000000303030303030300
            00000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000030303
            0303030300030303030303030303030303030303030303030303030000000303
            0303030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BF
            BF00030303030303000303030303030303030303030303030303030303030300
            030300030303030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBF00BFBFBF0000030303030003030303030303030303030303030303030303
            03030300030303000003030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBF00BFBFBFBFBF0003030300030303030303030303030303030303
            0303030303030300030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF00030303000303030303030303030303
            030303030303030303030300030303030300030000000300BFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF000303030003030303030303
            03030303030303030303030303030300030303030300030000000300BFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF0003030300030303
            0303030303030303030303030303030303030300030303030300030000000300
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF00030303
            0003030303030303030303030303030303030303030303000303030303000300
            00000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF
            0003030300030303030303030303030303030303030303030303030003030303
            0300030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BF
            BFBFBFBF00030303000303030303030303030303030303030303030303030300
            030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBF00BFBFBFBFBF000303030003030303030303030303030303030303030303
            03030300030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBF00BFBFBFBFBF0003030300030303030303030303030303030303
            0303030303030300030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF00030303000303030303030303030303
            0303030303030303030303000303030303000300000003000000000000000000
            000000000000000000000000000000BFBFBFBFBF000303030000000000000000
            0000000000000000000000000000000003030303030003000000030300A4A4A4
            00A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A40000BFBFBF0003030303000303
            0300030303030303030303030303030303030303000003030300030000000303
            030000A400A4A4A4A400000000000000000000A4A4A4A4A4A400BFBF00030303
            0303000003000303030300000000000000000000030303030303000303000300
            000003030303030000A4A4A4A4004F4F4F4F4F4F4F4F00A4A4A4A4A4A4A40000
            0003030303030303000003030303000303030303030303000303030303030300
            0000030000000303030303030300000000004F4F4F4F4F4F4F4F000000000000
            0000000000030303030303030303000000000003030303030303030000000000
            000000000000030000000303030303030003030303004F4F4F4F4F4F4F4F0003
            0303030303030303030303030303030303000303030300030303030303030300
            03030303030303030303030000000303030303000003030303004F4F4F4F4F4F
            4F4F000303030303030303030303030303030303000003030303000303030303
            03030300030303030303030303030300000003030303004F0000000000004F4F
            4F4F4F4F4F4F0003030303030303030303030303030303000300000000000003
            03030303030303000303030303030303030303000000030303004F4F4F4F4F4F
            4F4F4F4F4F4F4F4F4F4F00030303030303030303030303030303000303030303
            03030303030303030303030003030303030303030303030000000303004F4F4F
            4F4F4F4F4F4F4F4F4F4F4F4F4F4F000303030303030303030303030303000303
            0303030303030303030303030303030003030303030303030303030000000300
            4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F0003030303030303030303030303
            0003030303030303030303030303030303030300030303030303030303030300
            000003004F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F00030303030303030303
            0303030300030303030303030303030303030303030303000303030303030303
            0303030000000303004F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F000303030303
            0303030303030303030003030303030303030303030303030303030003030303
            03030303030303000000030303004F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F0003
            0303030303030303030303030303000303030303030303030303030303030300
            030303030303030303030300000003030303004F000000000000000000000000
            0000000303030303030303030303030303030300030000000000000000000000
            0000000003030303030303030303030000000303030303000003030303030303
            0303030303030303030303030303030303030303030303030000030303030303
            0303030303030303030303030303030303030300000003030303030300030303
            0303030303030303030303030303030303030303030303030303030303000303
            0303030303030303030303030303030303030303030303000000}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = DelItmBtnClick
          ExplicitLeft = 0
          ExplicitTop = 298
        end
        object CrItmBtn: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 193
          Width = 33
          Height = 38
          Margins.Left = 0
          Margins.Right = 0
          Align = alTop
          Flat = True
          Glyph.Data = {
            B60C0000424DB60C000000000000360400002800000041000000200000000100
            0800000000008008000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030000000300
            0000000000000000000000000000000000000000000000030303030303030303
            0000000000000000000000000000000000000000000000000303030303030300
            00000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000030303
            0303030300030303030303030303030303030303030303030303030000000303
            0303030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BF
            BF00030303030303000303030303030303030303030303030303030303030300
            030300030303030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBF00BFBFBF0000030303030003030303030303030303030303030303030303
            03030300030303000003030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBF00BFBFBFBFBF0003030300030303030303030303030303030303
            0303030303030300030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF00030303000303030303030303030303
            030303030303030303030300030303030300030000000300BFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF000303030003030303030303
            03030303030303030303030303030300030303030300030000000300BFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF0003030300030303
            0303030303030303030303030303030303030300030303030300030000000300
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF00030303
            0003030303030303030303030303030303030303030303000303030303000300
            00000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF
            0003030300030303030303030303030303030303030303030303030003030303
            0300030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BF
            BFBFBFBF00030303000303030303030303030303030303030303030303030300
            030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBF00BFBFBFBFBF000303030003030303030303030303030303030303030303
            03030300030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBF00BFBFBFBFBF0003030300030303030303030303030303030303
            0303030303030300030303030300030000000300BFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBF00BFBFBFBFBF00030303000303030303030303030303
            0303030303030303030303000303030303000300000003000000000000000000
            000000000000000000000000000000BFBFBFBFBF000303030000000000000000
            0000000000000000000000000000000003030303030003000000030300A4A4A4
            00A4A4A4A4A4A4A4A40000A4A4A4A4A4A4A4A40000BFBFBF0003030303000303
            0300030303030303030300000303030303030303000003030300030000000303
            030000A400A4A4A4A4A4A4A400717100A4A4A4A4A4A4A4A4A400BFBF00030303
            0303000003000303030303030300030300030303030303030303000303000300
            000003030303030000A4A4A4A4A40000717171710000A4A4A4A4A4A4A4A40000
            0003030303030303000003030303030000030303030000030303030303030300
            0000030000000303030303030000000000007171717171717171000000000000
            0000000000030303030303030300000000000003030303030303030000000000
            0000000000000300000003030303030303030303007171717171717171717100
            0303030303030303030303030303030303030303030003030303030303030303
            0003030303030303030303000000030303030303030300007171717171717171
            7171717100000303030303030303030303030303030303000003030303030303
            0303030303000003030303030303030000000303030303030300000000007171
            7171717171710000000000030303030303030303030303030303000000000003
            0303030303030300000000000303030303030300000003030303030303030303
            0300717171717171717100030303030303030303030303030303030303030303
            0303000303030303030303000303030303030303030303000000030303030303
            0303030303007171717171717171000303030303030303030303030303030303
            0303030303030003030303030303030003030303030303030303030000000300
            0000000000000000000071717171717171710003030303030303030303030303
            0000000000000000000000030303030303030300030303030303030303030300
            0000030071717171717171717171717171717171717100030303030303030303
            0303030300030303030303030303030303030303030303000303030303030303
            0303030000000300717171717171717171717171717171717171000303030303
            0303030303030303000303030303030303030303030303030303030003030303
            0303030303030300000003007171717171717171717171717171717171710003
            0303030303030303030303030003030303030303030303030303030303030300
            0303030303030303030303000000030071717171717171717171717171717171
            7171000303030303030303030303030300030303030303030303030303030303
            0303030003030303030303030303030000000300000000000000000000000000
            0000000000000003030303030303030303030303000000000000000000000000
            0000000000000000030303030303030303030300000003030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303000000}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = CrItmBtnClick
          ExplicitLeft = 0
          ExplicitTop = 158
          ExplicitWidth = 40
        end
        object Bevel3: TBevel
          Left = 3
          Top = 234
          Width = 33
          Height = 20
          Align = alTop
          Shape = bsSpacer
          ExplicitLeft = -3
          ExplicitTop = 235
          ExplicitWidth = 40
        end
        object Bevel2: TBevel
          Left = 3
          Top = 3
          Width = 33
          Height = 79
          Align = alTop
          Shape = bsSpacer
          ExplicitTop = 0
        end
        object Bevel4: TBevel
          Left = 3
          Top = 342
          Width = 33
          Height = 20
          Align = alTop
          Shape = bsSpacer
          ExplicitTop = 345
        end
        object ImportKlassBtn: TSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 365
          Width = 33
          Height = 38
          Margins.Left = 0
          Margins.Right = 0
          Align = alTop
          Flat = True
          Glyph.Data = {
            B60C0000424DB60C000000000000360400002800000041000000200000000100
            0800000000008008000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030000000303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030300
            00000303030A0000000000000403030303030303030303000000000000000000
            03030303030A0000000000000003030303030303030300000000000000000000
            0303030000000303030A00000000000004030303030303030303010000000000
            0000000403030303030A03030303030300030303030303030300030303030303
            030300030303030000000303030A000000000000040303030303030303030000
            000000000000000303030303030A030303030303000303030303030300030303
            03030303030300030303030000000303030A0000000000000403030303030303
            03010000000000000000900303030303030A0303030303030003030303030303
            0003030303030303030003030303030000000303030A00000000000004030303
            030303036F000000000000000040030303030303030A03030303030300030303
            030303000303030303030303030003030303030000000303030A000000000000
            0403030303030303010000000000000000D8030303030303030A030303030303
            00030303030303000303030303030303000303030303030000000303030A0000
            00000000040303030303036F00000000000000000403030303030303030A0303
            0303030300030303030300030303030303030303000303030303030000000303
            030A000000000000009003030303030100000000000000000303030303030303
            030A030303030303030003030303000303030303030303000303030303030300
            00000303030A0000000000000000900303030300000000000000009003030303
            03030303030A0303030303030303000303000303030303030303000303030303
            0303030000000303030A000000000000000000D8030301000000000000004003
            0303030303030303030A03030303030303030300030003030303030303030003
            030303030303030000000303030A00000000000000000000D803000000000000
            0000D8030303030303030303030A030303030303030303030003030303030303
            03000303030303030303030000000303030A0000000000000000000000000000
            00000000000403030303030303030303030A0303030303030303030303030303
            0303030303000303030303030303030000000303030A00000000000000000000
            0000000000000000000303030303030303030303030A03030303030303030303
            030303030303030300030303030303030303030000000303030A000000000000
            000000000000000000000000900303030303030303030303030A030303030303
            03030303030303030303030300030303030303030303030000000303030A0000
            00000000000000000000000000000040030303030303030303030303030A0303
            0303030303030303030303030303030003030303030303030303030000000303
            030A0000000000000000000000000000000000D8030303030303030303030303
            030A030303030303030303030303030303030300030303030303030303030300
            00000303030A0000000000000000000000000000000004030303030303030303
            03030303030A0303030303030003030303030303030300030303030303030303
            0303030000000303030A000000000000046D0000000000000000000303030303
            0303030303030303030A03030303030300000303030303030303000303030303
            030303030303030000000303030A000000000000040303000000000000000000
            030303030303030303030303030A030303030303000300030303030303030300
            03030303030303030303030000000303030A0000000000000403030300000000
            00000000000303030303030303030303030A0303030303030003030003030303
            0303030300030303030303030303030000000303030A00000000000004030303
            0300000000000000000003030303030303030303030A03030303030300030303
            000303030303030303000303030303030303030000000303030A000000000000
            040303030301000000000000000040030303030303030303030A030303030303
            00030303030003030303030303030003030303030303030000000303030A0000
            000000000403030303030A0000000000000000400303030303030303030A0303
            0303030300030303030300030303030303030300030303030303030000000303
            030A000000000000040303030303030000000000000000004003030303030303
            030A030303030303000303030303030003030303030303030003030303030300
            00000303030A0000000000000403030303030303000000000000000000400303
            03030303030A0303030303030003030303030303000303030303030303000303
            0303030000000303030A00000000000004030303030303030300000000000000
            0000400303030303030A03030303030300030303030303030300030303030303
            030300030303030000000303030A000000000000040303030303030303150000
            000000000000000403030303030A000000000000000303030303030303030000
            0000000000000000030303000000030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030000000303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030300000003030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303030303030303030303030303030303000000}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = ImportKlassBtnClick
          ExplicitLeft = 0
          ExplicitTop = 368
        end
      end
      object LPn: TPanel
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 297
        Height = 545
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        BevelOuter = bvNone
        Color = clAppWorkSpace
        TabOrder = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 297
          Height = 57
          Align = alTop
          TabOrder = 0
          object OrdPnCap: TLabel
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 289
            Height = 20
            Align = alTop
            AutoSize = False
            Caption = '  Orders lists'
            Color = clActiveCaption
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 334
          end
          object ToolBar1: TToolBar
            Left = 1
            Top = 27
            Width = 295
            Height = 28
            BorderWidth = 1
            Color = clBtnFace
            Images = ImgLst
            Indent = 5
            ParentColor = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Wrapable = False
            object OrdOpenBtn: TToolButton
              Left = 5
              Top = 0
              Action = actOpenOrd
            end
            object DelOrdBtn: TToolButton
              Left = 28
              Top = 0
              Action = actDelOrd
            end
            object OrdSumBtn: TToolButton
              Left = 51
              Top = 0
              Caption = 'OrdSumBtn'
              ImageIndex = 26
              OnClick = OrdSumBtnClick
            end
            object ToolButton7: TToolButton
              Left = 74
              Top = 0
              Width = 8
              Caption = 'ToolButton7'
              ImageIndex = 15
              Style = tbsSeparator
            end
            object DtNewBtn: TToolButton
              Left = 82
              Top = 0
              Caption = 'DtNewBtn'
              ImageIndex = 20
              OnClick = DtNewBtnClick
            end
            object DtCopyBtn: TToolButton
              Left = 105
              Top = 0
              Caption = 'DtCopyBtn'
              ImageIndex = 21
              OnClick = DtCopyBtnClick
            end
            object DtDelBtn: TToolButton
              Left = 128
              Top = 0
              Caption = 'DtDelBtn'
              ImageIndex = 22
              OnClick = DtDelBtnClick
            end
            object DtEdBtn: TToolButton
              Left = 151
              Top = 0
              Caption = 'DtEdBtn'
              ImageIndex = 10
              OnClick = DtEdBtnClick
            end
            object UpdateDtBtn: TToolButton
              Left = 174
              Top = 0
              Caption = 'UpdateDtBtn'
              ImageIndex = 25
              OnClick = UpdateDtBtnClick
            end
            object ToolButton2: TToolButton
              Left = 197
              Top = 0
              Width = 8
              Caption = 'ToolButton2'
              ImageIndex = 17
              Style = tbsSeparator
            end
            object FindBtn: TToolButton
              Left = 205
              Top = 0
              Caption = 'FindBtn'
              ImageIndex = 9
              OnClick = FindBtnClick
            end
            object FindInContBtn: TToolButton
              Left = 228
              Top = 0
              Caption = 'FindInContBtn'
              ImageIndex = 13
              OnClick = FindInContBtnClick
            end
            object ToolButton1: TToolButton
              Left = 251
              Top = 0
              Width = 8
              Caption = 'ToolButton1'
              ImageIndex = 16
              Style = tbsSeparator
            end
            object OrdPrintBtn: TToolButton
              Left = 259
              Top = 0
              Caption = 'OrdPrintBtn'
              ImageIndex = 14
              OnClick = OrdPrintBtnClick
            end
            object ExpOrdBtn: TToolButton
              Left = 282
              Top = 0
              Caption = 'ExpOrdBtn'
              ImageIndex = 23
              OnClick = ExpOrdBtnClick
            end
          end
        end
        object OrdPn: TPanel
          Left = 0
          Top = 78
          Width = 297
          Height = 467
          Align = alClient
          Caption = 'OrdPn'
          TabOrder = 1
          object OrdSG: TTntStringGrid
            Left = 1
            Top = 1
            Width = 295
            Height = 465
            Align = alClient
            DefaultColWidth = 25
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
            TabOrder = 1
            OnDblClick = OrdSGDblClick
            OnDrawCell = OrdSGDrawCell
            OnMouseDown = OrdSGMouseDown
            OnSelectCell = OrdSGSelectCell
            ColWidths = (
              25
              55
              55
              58
              51)
          end
          object CIBED: TEdit
            Left = 13
            Top = 65
            Width = 27
            Height = 21
            TabOrder = 0
            Text = '0'
            Visible = False
            OnKeyPress = CIBEDKeyPress
          end
        end
        object OrdTbs: TTabSet
          AlignWithMargins = True
          Left = 0
          Top = 57
          Width = 296
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 1
          Margins.Bottom = 0
          Align = alTop
          BackgroundColor = clAppWorkSpace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          SoftTop = True
          Style = tsSoftTabs
          TabPosition = tpTop
          OnChange = OrdTbsChange
        end
      end
    end
  end
  object InvNumPanel: TPanel
    Left = 0
    Top = 0
    Width = 1213
    Height = 34
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    TabOrder = 2
  end
  object MainMenu1: TMainMenu
    Images = ImgLst
    Left = 512
    object File1: TMenuItem
      Caption = '&File'
      Hint = 'File related commands'
      object FileNewItem: TMenuItem
        Action = FileNew1
      end
      object FileOpenItem: TMenuItem
        Action = FileOpen1
      end
      object FileSaveItem: TMenuItem
        Action = FileSave1
      end
      object FileSaveAsItem: TMenuItem
        Action = FileSaveAs1
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object FileExitItem: TMenuItem
        Action = FileExit1
      end
    end
    object miSet: TMenuItem
      Caption = 'Language'
      object miPswrd: TMenuItem
        Action = actPswrd
      end
      object miLang: TMenuItem
        Caption = 'miLang'
        object actSetENG2: TMenuItem
          Action = actSetENG
        end
        object actSetRUS2: TMenuItem
          Action = actSetRUS
        end
        object actSetCn1: TMenuItem
          Action = actSetCn
        end
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      Hint = 'Help topics'
      object HelpAboutItem: TMenuItem
        Action = HelpAbout1
      end
    end
  end
  object ActionList1: TActionList
    Images = ImgLst
    Left = 544
    object FileNew1: TAction
      Category = 'File'
      Caption = '&New'
      Hint = 'New|Create a new file'
      ImageIndex = 6
      ShortCut = 16462
      OnExecute = FileNew1Execute
    end
    object FileOpen1: TAction
      Category = 'File'
      Caption = '&Open'
      Hint = 'Open|Open a file'
      ImageIndex = 7
      ShortCut = 16463
      OnExecute = FileOpen1Execute
    end
    object FileSave1: TAction
      Category = 'File'
      Caption = '&Save'
      Hint = 'Save|Save current file'
      ImageIndex = 8
      ShortCut = 16467
      OnExecute = FileSave1Execute
    end
    object FileSaveAs1: TAction
      Category = 'File'
      Caption = 'Save &As...'
      Hint = 'Save As|Save current file with different name'
      OnExecute = FileSaveAs1Execute
    end
    object FileExit1: TAction
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit|Exit application'
      OnExecute = FileExit1Execute
    end
    object EditCut1: TEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Enabled = False
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ShortCut = 16472
    end
    object EditCopy1: TEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Enabled = False
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ShortCut = 16451
    end
    object EditPaste1: TEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 2
      ShortCut = 16470
    end
    object HelpAbout1: TAction
      Category = 'Help'
      Caption = '&About...'
      Hint = 
        'About|Displays program information, version number, and copyrigh' +
        't'
      OnExecute = HelpAbout1Execute
    end
    object actOpenOrd: TAction
      Caption = 'OpenOrd'
      ImageIndex = 6
      OnExecute = actOpenOrdExecute
    end
    object actDelOrd: TAction
      Caption = 'actDelOrd'
      ImageIndex = 5
      OnExecute = actDelOrdExecute
    end
    object actNewCont: TAction
      Caption = 'actNewCont'
      ImageIndex = 6
      OnExecute = actNewContExecute
    end
    object actSetRUS: TAction
      Caption = 'actSetRUS'
      GroupIndex = 1
      OnExecute = actSetRUSExecute
    end
    object actSetENG: TAction
      Caption = 'actSetENG'
      GroupIndex = 1
      OnExecute = actSetENGExecute
    end
    object actMaxLoadPn: TAction
      Caption = 'actMaxLoadPn'
      ImageIndex = 12
      OnExecute = actMaxLoadPnExecute
    end
    object actDelCont: TAction
      Caption = 'actDelCont'
      ImageIndex = 5
      OnExecute = actDelContExecute
    end
    object actPswrd: TAction
      Caption = 'actPswrd'
      OnExecute = actPswrdExecute
    end
    object actSetCn: TAction
      Caption = 'actSetCn'
      OnExecute = actSetCnExecute
    end
  end
  object ImgLst: TImageList
    Left = 584
    Bitmap = {
      494C01011B001D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00241CED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000FFFFFF008080800000000000800000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00241CED00FFFF
      FF00241CED00241CED00241CED00241CED00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000030009900300099003000990030009900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C000C0C0
      C000C0C0C000FFFFFF0080808000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00241CED00FFFF
      FF00FFFFFF00241CED00FFFFFF00241CED00241CED00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000030009900241CED00241CED0030009900000000000000
      00000000000000000000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C00000000000C0C0
      C000C0C0C000C0C0C000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00241CED00241C
      ED00FFFFFF00FFFFFF00FFFFFF00241CED00241CED00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000030009900241CED00241CED0030009900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C00000000000FFFF
      000000000000C0C0C000C0C0C000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00241CED00241C
      ED00FFFFFF00241CED00FFFFFF00FFFFFF00241CED00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF003000
      9900300099003000990030009900241CED00241CED0030009900300099003000
      99003000990000000000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800000000000FFFF
      FF0000000000C0C0C00080808000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00241C
      ED00241CED00241CED00241CED00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF003000
      9900241CED00241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED0030009900FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000000000008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00241CED00FFFFFF0000000000C0C0C00000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF003000
      9900241CED00241CED00241CED00241CED00241CED00241CED00241CED00241C
      ED00300099008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000C0C0
      C00000000000FFFFFF0000000000C0C0C00000000000C0C0C000000000000000
      0000000000000000000080000000800000000000000000000000FFFFFF003000
      9900000000000000000030009900241CED00241CED0030009900300099003000
      990030009900FFFFFF0080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0C000C0C0
      C000C0C0C0000000000080000000800000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0030009900241CED00241CED0030009900FFFFFF00FFFF
      FF00800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000C0C0C00000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080000000800000000000000000000000FFFFFF000000
      000000000000FFFFFF0030009900241CED00241CED0030009900800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C00000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080000000800000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0030009900300099003000990030009900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000080000000800000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D900D900000000008200880011190000111900008200
      880000000000D900D90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009936
      2F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFB70000EFB7000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D700D700000000007C008C0013003C000EC2FF000EC2FF001300
      3C007C008C0000000000D700D700000000000000000000000000000000000000
      0000000000000000000000000000EFB70000EFB7000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099362F00241C
      ED0099362F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFB70000EFB7000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D800D800000000000EC2FF000EC2FF000EC2FF00BDF9FF00BDF9FF000EC2
      FF000EC2FF000EC2FF0000000000D800D8000000000000000000000000000000
      0000000000000000000000000000EFB70000EFB7000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000099362F00241CED00241C
      ED00241CED0099362F000000000000000000000000000000000000000000EFB7
      0000F36D4D00F36D4D00EFB70000EFB70000EFB70000EFB70000F36D4D00F36D
      4D00EFB700000000000000000000000000000000000000000000000000000000
      0000000000007D008C000EC2FF0000F2FF009CE4F50031082500310825009CE4
      F50000F2FF000EC2FF007D008C00000000000000000000000000000000000000
      000000000000F36D4D00EFB70000EFB70000EFB70000EFB70000F36D4D000000
      0000000000000000000000000000000000000000000000000000008080000080
      80000000000000000000000000000000000099362F00241CED00241CED00241C
      ED00241CED00241CED0099362F0000000000000000000000000000000000F36D
      4D00EFB70000EFB70000EFB700000000000000000000EFB70000EFB70000EFB7
      0000F36D4D000000000000000000000000000000000000000000D900D9000000
      00008100870013003C000EC2FF009CE4F5000000280000000000000000000000
      28009CE4F5000EC2FF0013003C00810087000000000000000000000000000000
      00000000000000000000EFB700000000000000000000EFB70000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      800000000000000000000000000099362F00241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED0099362F00000000000000000000000000F36D
      4D00EFB70000000000000000000000000000000000000000000000000000EFB7
      0000F36D4D0000000000000000000000000000000000D700D700000000007C00
      8C00111900000EC2FF00BDF9FF00310826000000000000000000000000000000
      000031082600BDF9FF000EC2FF00111900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F36D4D000000000000000000000000000000000000000000008080000080
      8000000000000000000099362F0099362F0099362F0099362F00241CED00241C
      ED00241CED0099362F0099362F0099362F00000000000000000000000000EFB7
      0000EFB70000000000000000000000000000000000000000000000000000EFB7
      0000EFB70000000000000000000000000000D800D8000000000094770000C04E
      4000111900000EC2FF00BDF9FF00310826000000000000000000000000000000
      000031082600BDF9FF000EC2FF0011190000000000000000000000000000EFB7
      0000EFB70000000000000000000000000000000000000000000000000000EFB7
      0000EFB700000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800099362F00241CED00241C
      ED00241CED0099362F00000000000000000000000000EFB70000EFB70000EFB7
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFB70000EFB70000EFB7000000000000000000007D008C00BF4E4100DCAF
      00008100870013003C000EC2FF009CE4F5000000280000000000000000000000
      28009CE4F5000EC2FF0013003C008100870000000000EFB70000EFB70000EFB7
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFB70000EFB70000EFB70000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000099362F00241CED00241C
      ED00241CED0099362F00000000000000000000000000EFB70000EFB70000EFB7
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFB70000EFB70000EFB70000000000008100870013003C00BD731C00C8A8
      0000000000007D008C000EC2FF0000F2FF009CE4F50031082500310825009CE4
      F50000F2FF000EC2FF007D008C000000000000000000EFB70000EFB70000EFB7
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFB70000EFB70000EFB70000000000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00099362F00241CED00241C
      ED00241CED0099362F000000000000000000000000000000000000000000EFB7
      0000EFB70000000000000000000000000000000000000000000000000000EFB7
      0000EFB7000000000000000000000000000011190000CCA20000FBC800003108
      2600D800D800000000000EC2FF000EC2FF000EC2FF00BDF9FF00BDF9FF000EC2
      FF000EC2FF000EC2FF0000000000D800D800000000000000000000000000EFB7
      0000EFB700000000000000000000000000000000000000000000000000000000
      0000EFB700000000000000000000000000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00099362F00241CED00241C
      ED00241CED0099362F000000000000000000000000000000000000000000F36D
      4D00EFB70000000000000000000000000000000000000000000000000000EFB7
      0000F36D4D0000000000000000000000000011190000CCA20000FBC800003108
      260000000000D700D700000000007C008C0013003C000EC2FF000EC2FF001300
      3C007C008C0000000000D700D70000000000000000000000000000000000F36D
      4D00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00099362F00241CED00241C
      ED00241CED0099362F000000000000000000000000000000000000000000F36D
      4D00EFB70000EFB70000EFB700000000000000000000EFB70000EFB70000EFB7
      0000F36D4D000000000000000000000000008100870013003C00BD731C00C8A8
      00000000000000000000D900D900000000008200880011190000111900008200
      880000000000D900D90000000000000000000000000000000000000000000000
      00000000000000000000EFB700000000000000000000EFB70000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00099362F00241CED00241C
      ED00241CED0099362F000000000000000000000000000000000000000000EFB7
      0000F36D4D00F36D4D00EFB70000EFB70000EFB70000EFB70000F36D4D00F36D
      4D00EFB70000000000000000000000000000000000007D008C00BF4E4100DCAF
      0000C8A800003108250031082500C8A80000DCAF0000BF4E41007D008C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F36D4D00EFB70000EFB70000EFB70000EFB70000F36D4D00F36D
      4D00000000000000000000000000000000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00099362F0099362F009936
      2F0099362F0099362F0000000000000000000000000000000000000000000000
      0000000000000000000000000000EFB70000EFB7000000000000000000000000
      000000000000000000000000000000000000D800D8000000000094770000C04E
      4000BD731C00FBC80000FBC80000BD731C00C04E40009477000000000000D800
      D800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFB70000EFB7000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000EFB70000EFB7000000000000000000000000
      00000000000000000000000000000000000000000000D700D700000000007C00
      8C0013003C00CCA20000CCA2000013003C007C008C0000000000D700D7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFB70000EFB7000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D900D9000000
      00008200880011190000111900008200880000000000D900D900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003000
      9900000000008000000080000000800000008000000080000000800000003000
      9900800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000300099003000
      99000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003000
      9900300099008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000030009900300099003000
      9900300099003000990030009900300099003000990030009900300099003000
      99003000990030009900FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00241CED00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000003000990030009900300099003000
      9900300099003000990030009900300099003000990030009900300099003000
      990030009900300099003000990080000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00241CED00241CED00241C
      ED00FFFFFF00FFFFFF00FFFFFF00800000000000000030009900300099003000
      9900300099003000990030009900300099003000990030009900300099003000
      99003000990030009900FFFFFF0080000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      000000000000000000000000000080000000241CED00241CED00241CED00241C
      ED00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000300099003000
      9900DCDCDC0080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003000
      99003000990080000000FFFFFF0080000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00241CED00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000FFFFFF00FFFF
      FF00241CED00FFFFFF00FFFFFF0080000000241CED00241CED00241CED00241C
      ED00241CED00FFFFFF00FFFFFF00800000000000000000000000DCDCDC003000
      9900DCDCDC0080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003000
      9900FFFFFF0080000000FFFFFF0080000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00241C
      ED00241CED00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000FFFFFF00241C
      ED00241CED00FFFFFF00FFFFFF00241CED00241CED00FFFFFF00241CED00241C
      ED00241CED00FFFFFF00FFFFFF00800000000000000000000000DCDCDC00DCDC
      DC00DCDCDC0080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000FFFFFF0080000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000F2FF0000F2FF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000241CED00241C
      ED00241CED00241CED00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000241CED00241C
      ED00241CED00241CED00FFFFFF00241CED00FFFFFF00FFFFFF00FFFFFF00241C
      ED00241CED00241CED00FFFFFF00800000000000000000000000DCDCDC00DCDC
      DC00DCDCDC008000000080000000800000008000000080000000800000008000
      00008000000080000000FFFFFF0080000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000F2FF0000F2FF000000
      0000000000000000000000000000000000000000000000000000241CED00241C
      ED00241CED00241CED00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000241CED00241C
      ED00241CED00241CED00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00241CED00241CED00241CED00800000000000000000000000DCDCDC00DCDC
      DC00DCDCDC00DCDCDC0080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000FFFFFF0080000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000F2FF0000F2
      FF000000000000000000000000000000000000000000241CED00241CED00FFFF
      FF00241CED00241CED00241CED0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008000000000000000241CED00241CED00FFFF
      FF00241CED00241CED00241CED0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00241CED00241CED00800000000000000000000000DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008000000080000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000F2
      FF0000F2FF0000000000000000000000000000000000241CED00FFFFFF00FFFF
      FF00FFFFFF00241CED00241CED00800000008000000080000000800000008000
      00008000000080000000800000000000000000000000241CED00FFFFFF00FFFF
      FF00FFFFFF00241CED00241CED00800000008000000080000000800000008000
      00008000000080000000241CED00000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      000080000000800000008000000080000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000F2FF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00241CED00241CED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00241CED00241CED000000000000000000000000000000
      0000000000000000000000000000241CED00000000000000000000000000DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC0000000000DCDCDC000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      00000000000000000000F36D4D00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00241CED00241CED0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00241CED00241CED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000F36D4D00000000000000000000000000000000000000
      000000000000000000000000000000000000241CED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000241CED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000241CED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000241CED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000C0C0C0008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080000000C0C0
      C000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000C0C0C0008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      00000000000000000000000000000000000080000000C0C0C000800000008000
      000080000000000000000000000000000000000000000000000080808000C0C0
      C000FFFFFF008080800000000000800000000000000000000000000000000000
      00000000800000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00000FFFF0000FFFF0000FFFF00C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000FFFFFF008080800080000000800000008000
      0000000000000000000000000000000000000000000080808000C0C0C000C0C0
      C000C0C0C000FFFFFF0080808000000000000000000000000000000000000000
      80000000800000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080008080800080808000C0C0C000C0C0
      C00000000000C0C0C00000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000000000000000000080808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF0080808000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000FFFFFF00000000000000000000000000000080000000
      8000000080000000800000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00000000000000
      00000000000000000000000000000000000000000000C0C0C000FFFFFF00FFFF
      0000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      80000000800000000000000000000000800000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C00000000000C0C0C000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00C0C0C000C0C0C00080808000000000000000000000000000000000000000
      0000000080000000000000000000000080000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00000000000C0C0C00000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000C0C0C0008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000008000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C0C0C00000000000C0C0C000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008000000000000000C0C0C000FFFFFF00FFFF
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008000000000000000C0C0C000FFFFFF00FFFF
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000000000000
      0000000080000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000FFFFFF00FFFF
      FF00FFFF0000FFFF0000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000000000000
      0000000080000000800000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C00080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      8000000080000000800000008000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000080000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C0000000000000808000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C0000000000000808000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C0000000000000808000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000C0C0C000C0C0C0008080
      80000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000080808000C0C0C000C0C0C000FFFF00008080
      80008080800000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000808000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000C0C0C000C0C0C000C0C0C0008080
      8000C0C0C00000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000080800000808000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000FFFF0000C0C0C000C0C0C0008080
      8000C0C0C00000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000000000000000000000000000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C0000000000000808000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000080808000FFFF0000FFFF0000C0C0C0008080
      80008080800000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000C0C0C00000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000000000000000000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C0000000000000808000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080808000C0C0C000C0C0C0008080
      80000000000000000000000000000000000000000000FFFFFF0000000000C0C0
      C00000000000FFFFFF0000000000C0C0C00000000000C0C0C000000000000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000080000000000000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C0000000000000808000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0C000C0C0
      C000C0C0C0000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000000000000000
      0000000000008000000080000000800000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C0000000000000808000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000C0C0C00000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080000000800000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000000000000000
      0000000000008000000080000000800000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C0000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C00000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080000000800000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000000000000000
      0000000000008000000080000000800000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000C0C0C000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000000000007F5B00000000
      0000000000000000000000000000000000000000000064490400644904006449
      0400644904006449040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000080800000808000008080000080800000808000008080000080
      80000080800000808000000000000000000000000000000000007F5B00000000
      0000000000000000000000000000000000000000000000000000916B0A007F5B
      00007F5B0000916B0A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F5B00000000
      0000000000000000000000000000000000000000000000000000D9A77D00916B
      0A007F5B0000916B0A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      00000000000000000000000000000000000000000000000000007F5B0000D9A7
      7D000000000000000000000000000000000000000000D9A77D007F5B0000D9A7
      7D00916B0A00916B0A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000D9A77D007F5B
      0000D9A77D000000000000000000D9A77D007F5B00007F5B0000D9A77D000000
      000000000000916B0A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D9A7
      7D007F5B00007F5B00007F5B00007F5B0000D9A77D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000000000000000000000800000000000000000000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000000000000000000000800000000000000080000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080808000008080008080
      8000008080008080800080000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000000000000000000000800000000000000080000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000808000808080000080
      8000808080000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000000000000080000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080808000008080008080
      8000008080008080800080000000FFFFFF00000000000000000000000000FFFF
      FF00800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000000000000080000000800000008000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000808000808080000080
      8000808080000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000000000000000000000644904006449
      0400644904006449040064490400000000000000000000000000000000000000
      0000000000007F5B000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000000000000080000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000080808000008080008080
      8000008080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000000000000000000000000000000000000916B0A007F5B
      00007F5B0000916B0A0000000000000000000000000000000000000000000000
      0000000000007F5B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000FFFF
      FF00800000008000000080000000800000000000000000808000808080000080
      8000808080000080800080000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000916B0A007F5B
      0000916B0A00D9A77D0000000000000000000000000000000000000000000000
      0000000000007F5B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000000000000080808000008080008080
      8000008080008080800000808000808080000080800080808000008080008080
      8000008080000000000000000000000000000000000000000000916B0A00916B
      0A00D9A77D007F5B0000D9A77D00000000000000000000000000000000000000
      0000D9A77D007F5B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000000000000000000000000000000808000808080000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080000000000000000000000000000000000000000000916B0A000000
      000000000000D9A77D007F5B00007F5B0000D9A77D000000000000000000D9A7
      7D007F5B0000D9A77D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000080808000808080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000008080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D9A77D007F5B00007F5B00007F5B00007F5B
      0000D9A77D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000808080000080
      80000000000000FFFF00000000000000000000FFFF0000000000808080000080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF3FFFFFFFFF0000962B000FFFFF0000
      C061000FFE00000080B7000FFC00000000FD000FFC0000000089000F80000000
      0089000F800000000089000F800000008089000F800000008089000480010000
      948900008003000094890000800700009489F800803F00009489FC0080FF0000
      9489FE0481FF0000FFFFFFFFFFFF0000FC3FFD0BFC3FFFEFEC37F8018C31C001
      C003F000800180018001F80180018001C003D060C0038000C18380F0C1838000
      03C000F00000800107E080600420800107E008010400800103C0000000008001
      C1830801C1838001C0030D0BC00380018001801F80018001C003000F80018001
      EC37801F8C318001FC3FD0BFFC3FFFFFFFFFFFFFE803FFFFFFFFFFFFC801FFFF
      FE00FE008000C007FE00FE000000C007FE00FE008000C007800080008000C007
      800080008000C007800080008000C007800080008000C007800080008000C007
      800080008000C003800080008000C001807F807EC00FC000807F807FE00FC018
      807F807FF00FC03CFF7FFF7FFFFFFFFFFFF3FFFFFFFFFFFFFFE1FF3FC007FFFF
      FFC1FE3F8003FE00FF83C07F0001FE00F00780F70001FE00C00F00E700018000
      801F00C100008000801F00E600008000000F00F680008000000F81FEC0008000
      000FC3BFE0018000000FFFB7E0078000801FFFB3F007807F801FFFC1F003807F
      C03FFFF3F803807FF0FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFC001000C000FF9FF
      80010008000FF9FF80010001000FF3C780010003000F73C780010003000F27FF
      80010003000F07C780010003000F00C780010003000F01E380010007000403F1
      8001000F000006388001000F00000E388001000FF8001E388001001FFC003F01
      8001003FFE047F83FFFF007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFEFFDC007001FFFFFC7FFC007000FFFFFC3FBC0070007FFFFE3F7C0070003
      DF83F1E7C0070001DFC3F8CFC0070000DFC3FC1FC007001FCF83FE3FC007001F
      C61BFC1FC007001FE07FF8CFC0078FF1FFFFE1E7C00FFFF9FFFFC3F3C01FFF75
      FFFFC7FDC03FFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFFFFC00FFFF
      F6CFFE008000FFFFF6B7FE000000FFFFF6B7FE000000FFFFF8B780000000FFFF
      FE8F80000001C1FBFE3F80000003C3FBFF7F80000003C3FBFE3F80010003C1F3
      FEBF80030003D863FC9F80070003FE07FDDF807F0003FFFFFDDF80FF8007FFFF
      FDDF81FFF87FFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object OpenDlg: TOpenDialog
    Filter = 'Text files (*.txt)|*.txt|Octopus files (*.oct)|*.oct'
    Left = 616
  end
  object SaveDlg: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Text files (*.txt)|*.txt|Octopus files (*.oct)|*.oct'
    Left = 648
  end
end

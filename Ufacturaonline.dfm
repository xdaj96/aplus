object ffacturaonline: Tffacturaonline
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Factura online'
  ClientHeight = 460
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Bitstream Vera Sans Mono'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gfacturaonline: TDBGrid
    Left = 2
    Top = 131
    Width = 763
    Height = 302
    DataSource = dmFacturador.dsfactura
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Bitstream Vera Sans Mono'
    TitleFont.Style = []
    OnDrawColumnCell = gfacturaonlineDrawColumnCell
    OnKeyDown = gfacturaonlineKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_alfabeta'
        ReadOnly = True
        Title.Caption = 'Alfabeta'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cod_barraspri'
        ReadOnly = True
        Title.Caption = 'Codigo de barras'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nom_largo'
        ReadOnly = True
        Title.Caption = 'Descripcion'
        Width = 227
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cantidad'
        ReadOnly = True
        Title.Caption = 'Cantidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cantidadcontrol'
        Title.Caption = 'Cantidad control'
        Width = 64
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 2
    Top = 3
    Width = 764
    Height = 127
    TabOrder = 1
    object lproveedor: TLabel
      Left = 195
      Top = 23
      Width = 42
      Height = 13
      Caption = 'Label1'
    end
    object LDOCUMENTO: TLabel
      Left = 377
      Top = 23
      Width = 7
      Height = 13
    end
    object LIMPORTETOTAL: TLabel
      Left = 565
      Top = 23
      Width = 7
      Height = 13
    end
    object Bevel1: TBevel
      Left = 7
      Top = 19
      Width = 175
      Height = 22
    end
    object Lrazonsocial: TLabel
      Left = 15
      Top = 23
      Width = 84
      Height = 13
      Caption = 'Lrazonsocial'
    end
    object Label1: TLabel
      Left = 15
      Top = 4
      Width = 49
      Height = 13
      Caption = 'Destino'
    end
    object Bevel2: TBevel
      Left = 188
      Top = 19
      Width = 175
      Height = 22
    end
    object Label2: TLabel
      Left = 188
      Top = 4
      Width = 63
      Height = 13
      Caption = 'Proveedor'
    end
    object Bevel3: TBevel
      Left = 369
      Top = 19
      Width = 184
      Height = 22
    end
    object Label3: TLabel
      Left = 369
      Top = 4
      Width = 49
      Height = 13
      Caption = 'Factura'
    end
    object Bevel4: TBevel
      Left = 557
      Top = 19
      Width = 98
      Height = 22
    end
    object Label4: TLabel
      Left = 559
      Top = 4
      Width = 49
      Height = 13
      Caption = 'Importe'
    end
    object Bevel5: TBevel
      Left = 661
      Top = 19
      Width = 98
      Height = 22
    end
    object LFECHA: TLabel
      Left = 670
      Top = 23
      Width = 7
      Height = 13
    end
    object Label5: TLabel
      Left = 661
      Top = 4
      Width = 35
      Height = 13
      Caption = 'Fecha'
    end
    object ebuscar: TEdit
      Left = 7
      Top = 100
      Width = 210
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      OnKeyDown = ebuscarKeyDown
    end
    object rformacarga: TRadioGroup
      Left = 7
      Top = 42
      Width = 281
      Height = 54
      Caption = 'Forma de carga'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Por unidad'
        'Por cantidad')
      TabOrder = 1
    end
    object ecantidad: TEdit
      Left = 218
      Top = 100
      Width = 70
      Height = 21
      Color = clWhite
      NumbersOnly = True
      TabOrder = 2
      OnKeyDown = ecantidadKeyDown
    end
    object Bagregar: TButton
      Left = 289
      Top = 98
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 3
      OnClick = BagregarClick
    end
  end
  object Bcancelar: TBitBtn
    Left = 2
    Top = 433
    Width = 177
    Height = 25
    Caption = 'Cerrar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFF5C58DA
      2722CE2622CF2722CE2520CB2420CB241FCB2520CB251FCA251FCA2620CD231E
      C82620CD5B56D9FFFFFF605FE12E2DFB2423EF0B06B6201DE52B29FA2824F428
      24F42723F42722F42925FC130DCE0A05B0211AEF2921FB5D5ADE2423D6272BEF
      1312B16A67BF1B1AB01F20E22D2EF4282AED2929EE2C2DF40E0DCA3F3CB59090
      CE1210B12321EE201CD22C2CD4100EBB918ED3FFFFFFADAAE0100FB21C20E030
      36F42F35F40D0DCE3835B8ECECF8FFFFFF6A67C60F0DC02B29D53034DB1D24D7
      433DC3EBEAF8FFFFFFAFADE31D1BB91D24DE171CD73934BEEEEDF9FFFFFFACAA
      E41F1BBD252CE72E2DD83136DC384FFA161ED43A32C5EDEDF9FFFFFFD0CEF020
      1FC11E1DC0E2E2F6FFFFFFB3B1E81511BF232DE53241F72F30D82E34DD364FF3
      3950F3151DD83E35CCDEDBF6FFFFFFCFCDF2CFCEF3FFFFFFD4D3F32321C7202C
      E33447F43144F22B2FDB5056E53B55F3334BEF3852F41F2ADF211DCBCDCCF4FF
      FFFFFFFFFFCDCBF42120CD2232E3354DF42F44EE364DF24E52E36E72EA6E82F7
      556AF24862F32B3BE8221FD2CDCBF3FFFFFFFFFFFFCDCBF4201DD2242FE4445D
      F35366F26A7DF66B6FE96B70EC7388F7788CF66472F1514BE0D5D2F7FFFFFFDC
      DAF8DCDAF8FFFFFFDCDAF8655EE2575EEA7588F66F83F6686DEA6C72EE7891F7
      6779F25550E6CAC6F6FFFFFFE9E8FC5851E65954E6E0DEFAFFFFFFF6F5FD6F69
      E9575FEC748CF76A6FED6E76EF6F82F35E59EBC2BFF7FFFFFFF2F1FD6E66EC5D
      68EF6472F15E57EBC5C1F8FFFFFFF1F0FD7670EC616BF16D74EF7078F15A5CEF
      928BF3FFFFFFF1F0FE6F68F05B64EF7A92F67A91F66775F25551EDC3BFF9FFFF
      FFAFA8F75857F06C71EF6C75F37A91F65A57F0AEA8F77771F35F68F27D96F679
      8EF5788EF57C94F66D7FF45F5BF0948CF55956F1758BF66A73F1949BF685A1F7
      7C94F65B5BF36975F584A1F88099F77F98F77F98F77E97F6819CF67588F55C5F
      F37990F5819DF79399F5FFFFFF969BF8757BF57278F5757CF5737AF5737AF572
      7AF5727AF5737AF57279F5737AF5737AF4737AF4959AF7FFFFFF}
    ModalResult = 2
    TabOrder = 2
    OnClick = BcancelarClick
  end
  object BitBtn1: TBitBtn
    Left = 178
    Top = 433
    Width = 177
    Height = 25
    Caption = 'Finalizar pedido(F6)'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFF338E3B
      31963D31963D31963D31963D31963D31963D31963D31963D31963D31963D3196
      3D31963D348E3BFFFFFF31903B40DF6B3DD96929B8471AA7321AAA351AAA351A
      AA3519AA3519AA351AAA351AA73227B8473CDA6840E06932903A3A9E4541D56A
      18B33AB9D7BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9D7
      BC15B2373FD468389C443C9F493DD76D17B43DB9D8BDFFFFFFFFFFFFFFFFFFF9
      FBF9FAFCFAFFFFFFFFFEFFFFFFFFB9D7BC17B33A3FD5683C9D473CA24A3BD46D
      37CA6229AC441B9C311CA83A0688153E873E328033018E1421A83B1B9B3029AA
      4239CA603CD2683CA04939A34A3CD57139C8633ACC693FDC7617B844438C42FF
      FFFFFFFFFF37883C1CBF493DD9723ACA6439C6633ED46C389E473BAB532BD266
      38CA663ED4721DB7483A873BFFFFFFFFFFFFFFFFFFFFFFFF2B873221BE4F3DD0
      6F38C7642CCF603CA74E86D19A59D8902FD06B15C04E368D39FFFEFFFFFFFFFF
      FFFFFFFFFFFFFFFFF3F3F22A89301AC04C30CD6459D88B84CE998AD3A099EBC9
      84E0AE59A965F4EFF2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2ECED5CAA
      6684DFAB9AE9C489D19E86D39F8BE8C379CE9579CE9587CF9E8FCB9DFFFFFFFF
      FFFFFFFFFFFFFFFF79C48C79C48C7DC79175C98E8BE8BB86D09B87D6A38CE7C1
      8CE4BD86E6BB78E0AE7FCA95FFFFFFFFFFFFFFFFFFFFFFFF7FCC9573DEA885E3
      B68BE3B78CE5BC86D49E87D8A78CE7C58AE4BB8BE4BE83E4B88AD09EFFFFFFFF
      FFFFFFFFFFFFFFFF8BCF9F7EE1B28CE3BB8AE3B88CE7C087D6A289DAA98DE9C7
      8AE6BF8BE6C281E5BB8AD3A3FFFFFFFFFFFFFFFFFFFFFFFF8CD5A57CE0B38BE6
      BE8AE4BB8BE6C288D7A689DCAF8DECCC8BE6C28CE9C582E5BF90D6A6FFFFFFFF
      FFFFFFFFFFFFFFFF90D6A97DE2B68BE5C08AE3BE8CEAC688D9A883DAAA8DEFD6
      8CECCF8CEBD08BECD07EDCAE9BE2C199E2C199E2C19DE2C284DDAF88EACB8DEA
      CA8CEACA8DEDCF86D9A7FFFFFF8CDEB18CE1B58CE0B38DE0B38EE4BA86E0B386
      E0B486E0B486E0B58CE2B98BDFB38BDFB28BDFB588DBADFFFFFF}
    ModalResult = 2
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object idhttp: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 742
  end
end

object FRecetaElectronica: TFRecetaElectronica
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Consulta de receta electr'#243'nica'
  ClientHeight = 404
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Gfacturador: TDBGrid
    Left = 0
    Top = 144
    Width = 693
    Height = 210
    TabStop = False
    Color = clScrollBar
    DataSource = DSProductos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    StyleElements = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_ALFABETA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NRO_TROQUEL'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOM_LARGO'
        Title.Caption = 'DESCRIPCION'
        Width = 207
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_BARRASPRI'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VALE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_IVA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'can_stk'
        Title.Caption = 'STOCK'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_TOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_TOTALDESC'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCUENTOS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJEOS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJECO1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJECO2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESCUENTOSOS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESCUENTOCO1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESCUENTOCO2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_LABORATORIO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'can_vale'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'tamano'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Modificado'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RUBRO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IMPORTEGENT'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODAUTORIZACION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'porcentaje'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Item'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'GENTILEZA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'hosp'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJEAPLUS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESCUENTOAPLUS'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ES_RECARGO'
        Visible = False
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 8
    Width = 693
    Height = 138
    TabOrder = 1
    object eosafiliado: TBevel
      Left = 189
      Top = 37
      Width = 284
      Height = 21
    end
    object Label8: TLabel
      Left = 189
      Top = 15
      Width = 114
      Height = 16
      Caption = 'Nombre del afiliado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 20
      Top = 72
      Width = 76
      Height = 16
      Caption = 'N'#176' de receta:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object eosnroreceta: TBevel
      Left = 20
      Top = 94
      Width = 125
      Height = 21
    end
    object eosfecha: TBevel
      Left = 488
      Top = 37
      Width = 133
      Height = 21
    end
    object Label2: TLabel
      Left = 488
      Top = 15
      Width = 112
      Height = 16
      Caption = 'Fecha de la receta:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 151
      Top = 71
      Width = 113
      Height = 16
      Caption = 'M'#233'dico Prescriptor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object eosmedico: TBevel
      Left = 151
      Top = 93
      Width = 470
      Height = 21
    end
    object Label4: TLabel
      Left = 20
      Top = 15
      Width = 30
      Height = 16
      Caption = 'Plan:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object bevel1: TBevel
      Left = 20
      Top = 37
      Width = 163
      Height = 21
    end
    object Label5: TLabel
      Left = 20
      Top = 37
      Width = 4
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 189
      Top = 37
      Width = 4
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 488
      Top = 37
      Width = 4
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object lblplan: TLabel
      Left = 20
      Top = 37
      Width = 163
      Height = 16
      Caption = 'Usuario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblafiliado: TLabel
      Left = 189
      Top = 37
      Width = 284
      Height = 16
      Caption = 'Usuario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblfecha: TLabel
      Left = 489
      Top = 37
      Width = 132
      Height = 16
      Caption = 'Usuario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblreceta: TLabel
      Left = 20
      Top = 94
      Width = 125
      Height = 16
      Caption = 'Usuario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblmedico: TLabel
      Left = 151
      Top = 93
      Width = 470
      Height = 16
      Caption = 'Usuario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 560
      Top = 59
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      Visible = False
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 360
    Width = 705
    Height = 41
    TabOrder = 2
    object baccion: TBitBtn
      Left = 135
      Top = 6
      Width = 150
      Height = 27
      Caption = 'Modificar Prod.(F4)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        916D37A8895BB78D56AC8A56B69756AC8D57B58765AB875AA68A5BA79068A78B
        629C7A4B987545FFFFFFFFFFFFFFFFFFAB8E62FEFFFFFEFFFFFEFFFFFEFFFFFE
        FFFFFEFFFFEFF2E8EBE4DEEBE4DEEBE4DEEBE4DEA48659FFFFFFFFFFFFFFFFFF
        B4956AF5FCFF0097EEFFF7F00C00EECFD6E409E604EFF2E8F8D5C2DA9A42E19F
        41EBE8E0A58452FFFFFFFFFFFFFFFFFFBB9F76F4FBFF009CF0FFF7F05F59FFCF
        D6E402DF11EFF2E8FCDCC6EBE4DEEBE4DEEBE4DEA58452FFFFFFFFFFFFFFFFFF
        BEA47AF4FBFF009AF0FFF7F0FFFFEFEEF5E300D911EFF2E8FFDCCBDE9E41E19F
        41EAE6DFA58452FFFFFFFFFFFFFFFFFFBDA37AF4FBFF079FF0FFF7F0FFF7F0EA
        F1E300DC11EFF2E8FFDECEEBE4DEEBE4DEEAE6DEA58451FFFFFFFFFFFFFFFFFF
        BBA37AFEFFFFEBF0F0F1F0EDF7F2EEEAF0E300DB0EEFF2E8FFE2CFE19F41E19F
        41EBE7E1A58453FFFFFFFFFFFFFFFFFFBAA37FFFFFFFFBF6EFF6F2EDF9F3F1EF
        F2E808E11CEFF2E8FFE2D3DD9C41E19F41EBE4DEA68553FFFFFFFFFFFFFFFFFF
        BCAA8CFFFFFEFEFFFFFBFFFFFCFFFFFCFFFFF2FFFFF9FFFFF9FFFFEBE8E0EBE8
        E0EBE8E0A68553FFFFFFFFFFFFFFFFFFC5B397FDFAF5E6AC54E3A546E2A54AE3
        A54BE6A54DDEA148D9A04CD3994CD3994CD3C8B3A58553FFFFFFFFFFFFFFFFFF
        CCBB9FFCF9F4FCFFFFFCFFFFFCFFFFF9FDFBF5F6F7E4E0D9D0C2ADBFAB8BBFAB
        8BB69B71A48452FFFFFFFFFFFFFFFFFFCEBDA3FDFCFCFCFFFFFCFFFFFCFFFFF9
        FDFBF5F6F7E4E0D9D0C2ADEAE6E4DFD6C7B69B71A98857FFFFFFFFFFFFFFFFFF
        CFBDA6FDFCFBFBFDFEFCFCFCF6F6F1EEE8E1EDE2D9D3C1AACFBDA0FFFFFFCDB9
        9DBAA078F2EDE6FFFFFFFFFFFFFFFFFFD0C0A7FDFCFCFCFEFFFBF7F3F3EBE5E6
        DFD6E2D4C4CDB798BEAC8AD1C1A9B69B6EF9F7F3FFFFFFFFFFFFFFFFFFFFFFFF
        D1C3ABFDFCFBFEFEFEF6F2EFEDE4DADED5C4D6C4ADC0A984A38652BAA078FCFB
        F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBBB9FD1C2A9D1C0A7CDBCA2CBBA9EC7
        B291C3AB86AD9364AF9367F9F7F3FFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      TabOrder = 0
    end
    object Bcancelar: TBitBtn
      Left = 426
      Top = 6
      Width = 111
      Height = 27
      Cancel = True
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
      TabOrder = 1
      OnClick = BcancelarClick
    end
  end
  object bagregar: TBitBtn
    Left = 282
    Top = 366
    Width = 150
    Height = 27
    Caption = 'Agregar al ticket (F6)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000012170000121700000000000000000000FF00FFBCA89A
      988270806D59806D59806D59806D59806D59806D59806D59806D59806D59806D
      59806D59FF00FFFF00FFFF00FFBCA89AFCF8F6FBF7F4FBF5F2FAF4F0DEE5D42B
      8E29DEE5D4F8EFE9F7EDE8F7ECE6F7ECE6806D59FF00FFFF00FFFF00FFBCA89A
      FDF9F8FCF8F6FBF7F4DEE5D42B8E2938BB462B8E29DEE5D4F8EFE9F7EDE8F7EC
      E6806D59FF00FFFF00FFFF00FFBCA89AFDFBF9FDF9F8DEE5D42B8E293ABE4A39
      BD4834B6422B8E29DEE5D4F8EFE9F7EDE8806D59FF00FFFF00FFFF00FFBCA89A
      FEFCFBDEE5D42B8E2936B74431B23F31B23F31B23F2FAF3C2B8E29DEE5D4F8EF
      E9806D59FF00FFFF00FFFF00FFBCA89ADEE5D43EA13B34A93836AD3C2FAC3B2C
      AA382CAA38269E2F2194272B8E29DEE5D4806D59FF00FFFF00FFFF00FFBCA89A
      FFFFFFFEFDFDFEFCFB36AD3C3EBC4D37B94636B745219225FAF4F0FAF3EFF9F1
      ED806D59FF00FFFF00FFFF00FFBCA89AFFFFFFFFFFFFFEFDFD36AD3C62D8745B
      D66E57D269219225FBF5F2FAF4F0FAF3EF806D59FF00FFFF00FFFF00FFBCA89A
      FFFFFFFFFFFFFFFFFF36AD3C7FDF8F7BDE8C75DA8527962CFBF7F4FBF5F2FAF4
      F0806D59FF00FFFF00FFFF00FFBCA89AFFFFFFFFFFFFFFFFFF54AF5136AD3C36
      AD3C36AD3C36AD3CFCF8F6FBF7F4FBF5F2806D59FF00FFFF00FFFF00FFBCA89A
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFEFCFBFDFBF9FDF9F8FCF8F6FBF7
      F4806D59FF00FFFF00FFFF00FFBCA89AFFFFFF9E5D409E5D409E5D40FFFFFF9E
      5D40FEFDFD9E5D409E5D409E5D40FCF8F6806D59FF00FFFF00FFFF00FFBCA89A
      FFFFFF9E5D40FFFFFF9E5D40FFFFFF9E5D40FFFFFF9E5D40FEFCFB9E5D40FDF9
      F8806D59FF00FFFF00FFFF00FFBCA89AFFFFFF9E5D409E5D409E5D40FFFFFF9E
      5D40FFFFFF9E5D409E5D409E5D40FDFBF9806D59FF00FFFF00FFFF00FFBCA89A
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFEFC
      FB988270FF00FFFF00FFFF00FFBCA89ABCA89ABCA89ABCA89ABCA89ABCA89ABC
      A89ABCA89ABCA89ABCA89ABCA89ABCA89ABCA89AFF00FFFF00FF}
    ParentFont = False
    TabOrder = 3
    OnClick = bagregarClick
  end
  object TValidaReceta: TTimer
    Enabled = False
    OnTimer = TValidaRecetaTimer
    Left = 640
    Top = 216
  end
  object CDSPRODUCTOS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 640
    Top = 19
    object CDSPRODUCTOSCOD_ALFABETA: TStringField
      FieldName = 'COD_ALFABETA'
    end
    object CDSPRODUCTOSNRO_TROQUEL: TStringField
      FieldName = 'NRO_TROQUEL'
    end
    object CDSPRODUCTOSVALE: TStringField
      FieldName = 'VALE'
    end
    object CDSPRODUCTOSCOD_BARRASPRI: TStringField
      FieldName = 'COD_BARRASPRI'
    end
    object CDSPRODUCTOSNOM_LARGO: TStringField
      DisplayWidth = 40
      FieldName = 'NOM_LARGO'
      Size = 40
    end
    object CDSPRODUCTOSCOD_IVA: TStringField
      FieldName = 'COD_IVA'
    end
    object CDSPRODUCTOSPRECIO: TCurrencyField
      FieldName = 'PRECIO'
    end
    object CDSPRODUCTOSCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object CDSPRODUCTOSPRECIO_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'PRECIO_TOTAL'
    end
    object CDSPRODUCTOSPRECIO_TOTALDESC: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'PRECIO_TOTALDESC'
    end
    object CDSPRODUCTOSDESCUENTOS: TCurrencyField
      DisplayWidth = 2
      FieldKind = fkInternalCalc
      FieldName = 'DESCUENTOS'
    end
    object CDSPRODUCTOSPORCENTAJEOS: TFloatField
      FieldName = 'PORCENTAJEOS'
      Precision = 4
    end
    object CDSPRODUCTOSPORCENTAJECO1: TFloatField
      FieldName = 'PORCENTAJECO1'
    end
    object CDSPRODUCTOSPORCENTAJECO2: TFloatField
      FieldName = 'PORCENTAJECO2'
    end
    object CDSPRODUCTOSDESCUENTOSOS: TCurrencyField
      DisplayWidth = 10
      FieldName = 'DESCUENTOSOS'
    end
    object CDSPRODUCTOSDESCUENTOCO1: TCurrencyField
      DisplayWidth = 10
      FieldName = 'DESCUENTOCO1'
    end
    object CDSPRODUCTOSDESCUENTOCO2: TCurrencyField
      DisplayWidth = 10
      FieldName = 'DESCUENTOCO2'
    end
    object CDSPRODUCTOSCOD_LABORATORIO: TStringField
      DisplayWidth = 5
      FieldName = 'COD_LABORATORIO'
      Size = 5
    end
    object CDSPRODUCTOScan_stk: TIntegerField
      FieldName = 'can_stk'
    end
    object CDSPRODUCTOScan_vale: TStringField
      FieldName = 'can_vale'
      EditMask = '0'
    end
    object CDSPRODUCTOStamano: TIntegerField
      FieldName = 'tamano'
    end
    object CDSPRODUCTOSModificado: TBooleanField
      FieldName = 'Modificado'
    end
    object CDSPRODUCTOSRUBRO: TStringField
      FieldName = 'RUBRO'
    end
    object CDSPRODUCTOSIMPORTEGENT: TFloatField
      FieldName = 'IMPORTEGENT'
    end
    object CDSPRODUCTOSCODAUTORIZACION: TStringField
      FieldName = 'CODAUTORIZACION'
    end
    object CDSPRODUCTOSporcentaje: TFloatField
      DisplayWidth = 2
      FieldName = 'porcentaje'
      Precision = 4
    end
    object CDSPRODUCTOSItem: TIntegerField
      FieldName = 'Item'
    end
    object CDSPRODUCTOSGENTILEZA: TFloatField
      FieldName = 'GENTILEZA'
    end
    object CDSPRODUCTOShosp: TStringField
      FieldName = 'hosp'
      Size = 1
    end
    object CDSPRODUCTOSPORCENTAJEAPLUS: TFloatField
      FieldName = 'PORCENTAJEAPLUS'
    end
    object CDSPRODUCTOSDESCUENTOAPLUS: TFloatField
      FieldName = 'DESCUENTOAPLUS'
      currency = True
    end
    object CDSPRODUCTOSES_RECARGO: TStringField
      FieldName = 'ES_RECARGO'
      Size = 1
    end
    object CDSPRODUCTOSimportetotal: TAggregateField
      FieldName = 'importetotal'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(precio_total)'
    end
    object CDSPRODUCTOSdescuentos_total: TAggregateField
      FieldName = 'descuentos_total'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentos)'
    end
    object CDSPRODUCTOSnetoxcobrar: TAggregateField
      FieldName = 'netoxcobrar'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(precio_totaldesc)'
    end
    object CDSPRODUCTOSDESCUENTOTOTALOS: TAggregateField
      FieldName = 'DESCUENTOTOTALOS'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentosos)'
    end
    object CDSPRODUCTOSDESCUENTOTOTALCO1: TAggregateField
      FieldName = 'DESCUENTOTOTALCO1'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentoco1)'
    end
    object CDSPRODUCTOSDESCUENTOTOTALCO2: TAggregateField
      FieldName = 'DESCUENTOTOTALCO2'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentoco2)'
    end
    object CDSPRODUCTOSTOTALGENTILEZA: TAggregateField
      FieldName = 'TOTALGENTILEZA'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(IMPORTEGENT)'
    end
    object CDSPRODUCTOSdescuentototalaplus: TAggregateField
      FieldName = 'descuentototalaplus'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(DESCUENTOAPLUS)'
    end
  end
  object DSProductos: TDataSource
    DataSet = CDSDetalleReceta
    Left = 464
    Top = 48
  end
  object CDSDetalleReceta: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 632
    Top = 91
    object StringField1: TStringField
      FieldName = 'COD_ALFABETA'
    end
    object StringField2: TStringField
      FieldName = 'NRO_TROQUEL'
    end
    object StringField3: TStringField
      FieldName = 'VALE'
    end
    object StringField4: TStringField
      FieldName = 'COD_BARRASPRI'
    end
    object StringField5: TStringField
      DisplayWidth = 40
      FieldName = 'NOM_LARGO'
      Size = 40
    end
    object StringField6: TStringField
      FieldName = 'COD_IVA'
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'PRECIO'
    end
    object IntegerField1: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object CurrencyField2: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'PRECIO_TOTAL'
    end
    object CurrencyField3: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'PRECIO_TOTALDESC'
    end
    object CurrencyField4: TCurrencyField
      DisplayWidth = 2
      FieldKind = fkInternalCalc
      FieldName = 'DESCUENTOS'
    end
    object FloatField1: TFloatField
      FieldName = 'PORCENTAJEOS'
      Precision = 4
    end
    object FloatField2: TFloatField
      FieldName = 'PORCENTAJECO1'
    end
    object FloatField3: TFloatField
      FieldName = 'PORCENTAJECO2'
    end
    object CurrencyField5: TCurrencyField
      DisplayWidth = 10
      FieldName = 'DESCUENTOSOS'
    end
    object CurrencyField6: TCurrencyField
      DisplayWidth = 10
      FieldName = 'DESCUENTOCO1'
    end
    object CurrencyField7: TCurrencyField
      DisplayWidth = 10
      FieldName = 'DESCUENTOCO2'
    end
    object StringField7: TStringField
      DisplayWidth = 5
      FieldName = 'COD_LABORATORIO'
      Size = 5
    end
    object IntegerField2: TIntegerField
      FieldName = 'can_stk'
    end
    object StringField8: TStringField
      FieldName = 'can_vale'
      EditMask = '0'
    end
    object IntegerField3: TIntegerField
      FieldName = 'tamano'
    end
    object BooleanField1: TBooleanField
      FieldName = 'Modificado'
    end
    object StringField9: TStringField
      FieldName = 'RUBRO'
    end
    object FloatField4: TFloatField
      FieldName = 'IMPORTEGENT'
    end
    object StringField10: TStringField
      FieldName = 'CODAUTORIZACION'
    end
    object FloatField5: TFloatField
      DisplayWidth = 2
      FieldName = 'porcentaje'
      Precision = 4
    end
    object IntegerField4: TIntegerField
      FieldName = 'Item'
    end
    object FloatField6: TFloatField
      FieldName = 'GENTILEZA'
    end
    object StringField11: TStringField
      FieldName = 'hosp'
      Size = 1
    end
    object FloatField7: TFloatField
      FieldName = 'PORCENTAJEAPLUS'
    end
    object FloatField8: TFloatField
      FieldName = 'DESCUENTOAPLUS'
      currency = True
    end
    object StringField12: TStringField
      FieldName = 'ES_RECARGO'
      Size = 1
    end
    object AggregateField1: TAggregateField
      FieldName = 'importetotal'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(precio_total)'
    end
    object AggregateField2: TAggregateField
      FieldName = 'descuentos_total'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentos)'
    end
    object AggregateField3: TAggregateField
      FieldName = 'netoxcobrar'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(precio_totaldesc)'
    end
    object AggregateField4: TAggregateField
      FieldName = 'DESCUENTOTOTALOS'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentosos)'
    end
    object AggregateField5: TAggregateField
      FieldName = 'DESCUENTOTOTALCO1'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentoco1)'
    end
    object AggregateField6: TAggregateField
      FieldName = 'DESCUENTOTOTALCO2'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentoco2)'
    end
    object AggregateField7: TAggregateField
      FieldName = 'TOTALGENTILEZA'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(IMPORTEGENT)'
    end
    object AggregateField8: TAggregateField
      FieldName = 'descuentototalaplus'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(DESCUENTOAPLUS)'
    end
  end
end

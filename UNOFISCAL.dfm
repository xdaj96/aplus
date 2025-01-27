object FNOFISCAL: TFNOFISCAL
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Documentos no fiscales'
  ClientHeight = 656
  ClientWidth = 849
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poPrintToFit
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label27: TLabel
    Left = 9
    Top = 565
    Width = 63
    Height = 14
    Caption = 'Importe Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object importetotal: TDBText
    Left = 111
    Top = 561
    Width = 120
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'importetotal'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label44: TLabel
    Left = 9
    Top = 591
    Width = 73
    Height = 14
    Caption = 'Descuento OS:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object descuentoos: TDBText
    Left = 110
    Top = 587
    Width = 120
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'DESCUENTOTOTALOS'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label28: TLabel
    Left = 236
    Top = 565
    Width = 61
    Height = 14
    Caption = 'Descuentos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label45: TLabel
    Left = 236
    Top = 592
    Width = 80
    Height = 14
    Caption = 'Descuentos Co1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object descuentos: TDBText
    Left = 345
    Top = 562
    Width = 120
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'descuentos_total'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object descuentoco1: TDBText
    Left = 345
    Top = 587
    Width = 120
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'DESCUENTOTOTALCO1'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label46: TLabel
    Left = 471
    Top = 591
    Width = 80
    Height = 14
    Caption = 'Descuentos Co2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label29: TLabel
    Left = 471
    Top = 565
    Width = 70
    Height = 14
    Caption = 'Neto a Cobrar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object netoacobrar: TDBText
    Left = 575
    Top = 563
    Width = 120
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'netoxcobrar'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object descuentoco2: TDBText
    Left = 575
    Top = 591
    Width = 120
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'DESCUENTOTOTALCO2'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label7: TLabel
    Left = 376
    Top = 152
    Width = 31
    Height = 13
    Caption = 'Label7'
  end
  object Label18: TLabel
    Left = 424
    Top = 152
    Width = 37
    Height = 13
    Caption = 'Label18'
  end
  object Panel1: TPanel
    Left = 3
    Top = 8
    Width = 322
    Height = 105
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object Bevel1: TBevel
      Left = 103
      Top = 75
      Width = 186
      Height = 21
    end
    object Label1: TLabel
      Left = 111
      Top = 79
      Width = 3
      Height = 14
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 10
      Top = 56
      Width = 47
      Height = 14
      Caption = 'Vendedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object Shape1: TShape
      Left = 2
      Top = 22
      Width = 318
      Height = 1
      Brush.Color = clBlue
      Brush.Style = bsBDiagonal
      Pen.Color = clMoneyGreen
    end
    object Label6: TLabel
      Left = 13
      Top = 3
      Width = 75
      Height = 16
      Caption = 'Area Factura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object lcomprob: TLabel
      Left = 74
      Top = 35
      Width = 102
      Height = 14
      Caption = 'Tipo de Comprobante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object Evendedor: TEdit
      Left = 10
      Top = 75
      Width = 87
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 0
      OnChange = EvendedorChange
      OnEnter = EvendedorEnter
      OnExit = EvendedorExit
      OnKeyPress = EvendedorKeyPress
    end
    object ecomprob: TEdit
      Left = 10
      Top = 30
      Width = 58
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 1
      OnChange = ecomprobChange
      OnEnter = ecomprobEnter
      OnExit = ecomprobExit
      OnKeyDown = ecomprobKeyDown
    end
  end
  object Panel2: TPanel
    Left = 2
    Top = 114
    Width = 323
    Height = 130
    TabOrder = 2
    object Label14: TLabel
      Left = 10
      Top = 50
      Width = 46
      Height = 14
      Caption = 'Producto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object ebusqueda: TEdit
      Left = 10
      Top = 66
      Width = 301
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnEnter = ebusquedaEnter
      OnExit = ebusquedaExit
      OnKeyPress = ebusquedaKeyPress
    end
    object bbuscar: TButton
      Left = 10
      Top = 93
      Width = 152
      Height = 25
      Caption = 'Buscar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = bbuscarClick
    end
    object Rbusqueda: TRadioGroup
      Left = 3
      Top = 2
      Width = 316
      Height = 46
      Caption = 'Criterio de busqueda'
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Descripcion'
        'Drogas'
        'Acc. Farmc.')
      ParentFont = False
      TabOrder = 0
    end
    object bmodificable: TButton
      Left = 161
      Top = 93
      Width = 152
      Height = 25
      Caption = 'P. modificable(F1)'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = bmodificableClick
    end
  end
  object Gfacturador: TDBGrid
    Left = 2
    Top = 246
    Width = 846
    Height = 313
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnExit = GfacturadorExit
    OnKeyDown = GfacturadorKeyDown
    OnKeyPress = GfacturadorKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'NRO_TROQUEL'
        ReadOnly = True
        Title.Caption = 'Troquel'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOM_LARGO'
        ReadOnly = True
        Title.Caption = 'Descripcion'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Title.Caption = 'Precio'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Title.Caption = 'Cantidad'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCUENTOS'
        Title.Caption = 'Descuentos'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_TOTALDESC'
        Title.Caption = 'Precio c/descuento'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_TOTAL'
        ReadOnly = True
        Title.Caption = 'Precio Total'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'porcentaje'
        Title.Caption = 'Porcentaje'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_ALFABETA'
        ReadOnly = True
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_BARRASPRI'
        ReadOnly = True
        Title.Caption = 'Codigo de barras'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_IVA'
        ReadOnly = True
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJEOS'
        Title.Caption = '%OS'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJECO1'
        Title.Caption = '%CO1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJECO2'
        Title.Caption = '%CO2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCUENTOSOS'
        Title.Caption = 'DescuentosOS'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_LABORATORIO'
        Title.Caption = 'Laboratorio'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'can_stk'
        Title.Caption = 'STOCK'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VALE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'can_vale'
        Title.Caption = 'Cantidad Vale'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tamano'
        Visible = True
      end>
  end
  object Blimpiartodo: TBitBtn
    Left = 2
    Top = 610
    Width = 133
    Height = 25
    Caption = 'Limpiar (F2)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      9C9699746D70716A6B716A6B716A6B716A6B716A6B716A6B716A6B716A6B716A
      6D9C9699FFFFFFFFFFFFFFFFFFFFFFFF776C70A2AFA5A2AFA5A2AFA5A2AFA5A2
      AFA5A2AFA5A2AFA5A2AFA5A2AFA5A2AFA5796E72FFFFFFFFFFFFFFFFFFFFFFFF
      837B7FC9C5C7008036278E5236945CA9BEAF9BB9A5008036008036008036C9C5
      C7837B7FFFFFFFFFFFFFFFFFFFC5C0C2A19B9CE8E6E604904248A872E0DFDDE0
      DFDDE0DFDDE0DFDD64B286049042E8E6E6A19B9CDDDADBFFFFFFFFFFFFACA5A8
      C9C5C7F0EEED84D6AF26A863E1E8E3F0EEEDF0EEEDE1E8E317A35984D6AFF0EE
      EDC9C5C7BFBABCFFFFFFFFFFFF91888CE8E6E6FCFBF9EDF5F0FCFBF9EDF5F0FC
      FBF9FCFBF9DDF1E6EDF5F0DFF1E6FCFBF9E8E6E69F979BFFFFFFFFFFFF7E7478
      FFFEFEFFFEFEFFFEFEFFFEFE0BAF60B3E6CCB3E6CC0BAF60FFFEFEFFFEFEFFFE
      FEFFFEFE887E82FFFFFFFFFFFF877F83F0EEEDF0EEEDF0EEEDF0EEED23AD6C64
      B28664B28615A963E0E8E3F0EEEDF0EEEDF0EEED8C8488FFFFFFFFFFFF9F9598
      DDDCDADDDCDADDDCDADDDCDADDDCDA019750019750DDDCDADDDCDADDDCDADDDC
      DADDDCDA9F9598FFFFFFFFFFFFAAA2A5CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7CB
      C8C7CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7AAA2A5FFFFFF186B1D0A791C
      0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A79
      1C0A791C0A791C136A181F8B3635C06435C06435C06435C06435C06435C06435
      C06435C06435C06435C06435C06435C06435C06435C0640D8326229B4541D48E
      41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D4
      8E41D48E41D48E0E94372D9A47239E4D1C96461A9040178B3C16873915863815
      863815863815863816883A178B3C1A90411C96461F9C4B219740FFFFFF55985A
      096F15086A14086512076311076211076211076211076211076412086713096B
      14096F1546914CFFFFFFFFFFFFFFFFFF6CAC73388E42167B220A74170A74170A
      74170A74170A74170A74171C7E2842944C76B27DFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 4
    OnClick = BlimpiartodoClick
  end
  object imprimir: TBitBtn
    Left = 266
    Top = 610
    Width = 133
    Height = 25
    Caption = 'Imprimir(F6)'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFBBA799806D59806D59806D59806D59806D59806D59806D59FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBBA799F3F3F3F3F3F3F3
      F3F3F3F3F3F3F3F3F3F3F3806D59FF00FFFF00FFFF00FFFF00FF9292916E6464
      6E64646E6464BBA799F3F3F3E8D0BEDCB38CE0B68DE6B88CF3F3F3806D596E64
      646E64646E64646E6464929291959594A09F9F3B3A3ABBA799F3F3F3E8C79FF6
      DEB5F7DEB1F7E7CDF8F8F8B8AEA3929292CAC9C9C4C4C3AEA9A9929291A09F9F
      A09F9F3B3A3A917D6CF3F3F3FDEBC1FDEBC1C5C6DCD6D9EF806D597666527666
      52766652766652AEA9A992929192929192929192929192929192929192929192
      9291929291C2C2C2806D59FFFFFF4859CCB9BBDB766652AEA9A9929291FEFDFD
      FEFDFD929291EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAF3F3F3806D594859CC0030
      F84859CC766652AEA9A9929291D9D9D9727171929291D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9E9E9E9806D590030F8FFFFFF0030F84859CCAEA9A9929291D9D9D9
      D9D9D9929291C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9E1E1E1806D59806D59806D
      59806D590030F84859CC929291F3F3F3F3F3F3929291D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9E9E9E9E9E9E9E9E9E9C2C2C2F3F3F3F3F3F30030F8AEADADAEADAD
      AEADAD929291949294949294949294949294929291C2C2C2806D597666527666
      52766652766652C2C2C2FF00FFFF00FFFF00FF545453BBA798FFFFFFFFFFFFFF
      FFFFFFFBFFFFFBFF806D59FFFFFF4859CCB9BBDB766652FF00FFFF00FFFF00FF
      FF00FF646363BBA798FFFFFFFFFFFFFFFFFFFFFBFFFFFBFF806D594859CC0030
      F84859CC766652FF00FFFF00FFFF00FFFF00FFFF00FFBBA798FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF806D590030F8FFFFFF0030F84859CCFF00FFFF00FFFF00FF
      FF00FFFF00FFBBA798FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF806D59806D59806D
      59806D590030F84859CCFF00FFFF00FFFF00FFFF00FFBBA798BBA798BBA798BB
      A798BBA798BBA798D9CEC6D9CEC6FF00FFFF00FFFF00FF0030F8}
    ParentFont = False
    TabOrder = 5
    OnClick = imprimirClick
  end
  object DESCOBER: TBitBtn
    Left = 134
    Top = 610
    Width = 133
    Height = 25
    Caption = 'Desbloq.(F7)'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFEDB883DC8743B75400B85500B65300DC8541EBB683FFFFFFFFFF
      FFFFFFFFFFFFFFD9710BFFFFFFFFFFFFFFFFFFD16008E39200E49600E19300ED
      9E00F9A200FDB00DFFBB17D56908D86F0AFFFFFFD9700AEC951CFFFFFFFFFFFF
      B55200E79B00E29300DE8F00E39000FAA500F8A708F9B01AFCB221FFC737F6AB
      28D46502F6AF2DED9621FFFFFFC85809E89C00DF8F00E39200F0A100F19005EF
      8F05EC8600FFC129FFBE2EFFC845FFCE50FFD964FFDC6DF3A224A24000E29100
      E19300E39200F2A300C35508C25202D2670AD06508D16407FFD965FFC945FFD0
      58FFD767FFDC71F4A629A74200EA9C00EC9C00F0A100C35508FFFFFFFFFFFFFF
      FFFFFFFFFFF1A83EFFE393FFD055FFD563FFDE78FFE486F8AE2DB35000DE8100
      DB7D00DD8000C65908FFFFFFFFFFFFFFFFFFDE7508FFCF56FFEBA7FFF2C9FFEB
      A7FFDF7DFFE78DFCB52EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFDD7306DB6E00ED900DEF8E0AFDC552FCC24FFECB56D47314DA7E21
      D97D21B24300C24F00E17803E0780AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB75300EA9900F39A00FFD858FFEA9AFFF2C9FFDA52E0
      790CFFFFFFFFFFFFFFFFFFF19718EF900FFFB71EFFB61DFEBD2CBC5700F5A000
      F8A303FCAD10F9A814FFB517D36503FFFFFFFFFFFFFFFFFFFFFFFFEF8E0AFFED
      97FFEB9DFFF2C9FFB61FC65C00FBA600F8A308FBB321FAB525FFCF4CDE740FE4
      810BEE9618EC9014EF8E0AFFED97FFE386FFE9A7FFF6EAFFB921C95F00FBA904
      FCAE10FEB825FEB729FFC53FFFD44EFFD75DFFD359FFCD50FFE383FFE385FFE1
      7EFFF6EAFFD053FFFFFFD16500FEAE12C75905D66B08FFC834FFC53DFFC948FF
      D35EFFD765FFDC79FFDC71FFE8A0FFF6EAFFD053FFFFFFFFFFFFD46800CB6007
      FFFFFFFFFFFFD56805FFD456FFD24EFFD45EFFDB68FFDF72FFE79CFFF6EAFFD1
      56FFFFFFFFFFFFFFFFFFDC750DFFFFFFFFFFFFFFFFFFFFFFFFF6C586EFA549F0
      9212F8AA29F8A318FEBE4DFFE7A7FFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 6
    OnClick = DESCOBERClick
  end
  object pgCoberturas: TPageControl
    Left = 327
    Top = 5
    Width = 521
    Height = 239
    ActivePage = tbCobertura
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 1
    object Proveedor: TTabSheet
      Caption = 'Proveedor'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label47: TLabel
        Left = 16
        Top = 10
        Width = 71
        Height = 14
        Caption = 'Cuit Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label49: TLabel
        Left = 18
        Top = 58
        Width = 65
        Height = 14
        Caption = 'Letra Factura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label48: TLabel
        Left = 192
        Top = 58
        Width = 72
        Height = 14
        Caption = 'Nro de Factura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label50: TLabel
        Left = 123
        Top = 58
        Width = 12
        Height = 14
        Caption = 'Pv'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 269
        Top = 10
        Width = 86
        Height = 14
        Caption = 'Nombre de cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object cuitproveedor: TEdit
        Left = 16
        Top = 29
        Width = 249
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = cuitproveedorChange
        OnKeyPress = cuitproveedorKeyPress
      end
      object Cletrafactura: TComboBox
        Left = 16
        Top = 77
        Width = 93
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = 'A'
        Items.Strings = (
          'A'
          'B'
          'C'
          'D'
          'E'
          'M')
      end
      object facturanro: TEdit
        Left = 192
        Top = 77
        Width = 160
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        MaxLength = 10
        NumbersOnly = True
        ParentFont = False
        TabOrder = 3
        OnExit = facturanroExit
        OnKeyPress = facturanroKeyPress
      end
      object blimpiarprov: TBitBtn
        Left = 3
        Top = 178
        Width = 121
        Height = 25
        Caption = 'Limpiar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          9C9699746D70716A6B716A6B716A6B716A6B716A6B716A6B716A6B716A6B716A
          6D9C9699FFFFFFFFFFFFFFFFFFFFFFFF776C70A2AFA5A2AFA5A2AFA5A2AFA5A2
          AFA5A2AFA5A2AFA5A2AFA5A2AFA5A2AFA5796E72FFFFFFFFFFFFFFFFFFFFFFFF
          837B7FC9C5C7008036278E5236945CA9BEAF9BB9A5008036008036008036C9C5
          C7837B7FFFFFFFFFFFFFFFFFFFC5C0C2A19B9CE8E6E604904248A872E0DFDDE0
          DFDDE0DFDDE0DFDD64B286049042E8E6E6A19B9CDDDADBFFFFFFFFFFFFACA5A8
          C9C5C7F0EEED84D6AF26A863E1E8E3F0EEEDF0EEEDE1E8E317A35984D6AFF0EE
          EDC9C5C7BFBABCFFFFFFFFFFFF91888CE8E6E6FCFBF9EDF5F0FCFBF9EDF5F0FC
          FBF9FCFBF9DDF1E6EDF5F0DFF1E6FCFBF9E8E6E69F979BFFFFFFFFFFFF7E7478
          FFFEFEFFFEFEFFFEFEFFFEFE0BAF60B3E6CCB3E6CC0BAF60FFFEFEFFFEFEFFFE
          FEFFFEFE887E82FFFFFFFFFFFF877F83F0EEEDF0EEEDF0EEEDF0EEED23AD6C64
          B28664B28615A963E0E8E3F0EEEDF0EEEDF0EEED8C8488FFFFFFFFFFFF9F9598
          DDDCDADDDCDADDDCDADDDCDADDDCDA019750019750DDDCDADDDCDADDDCDADDDC
          DADDDCDA9F9598FFFFFFFFFFFFAAA2A5CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7CB
          C8C7CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7AAA2A5FFFFFF186B1D0A791C
          0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A79
          1C0A791C0A791C136A181F8B3635C06435C06435C06435C06435C06435C06435
          C06435C06435C06435C06435C06435C06435C06435C0640D8326229B4541D48E
          41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D4
          8E41D48E41D48E0E94372D9A47239E4D1C96461A9040178B3C16873915863815
          863815863815863816883A178B3C1A90411C96461F9C4B219740FFFFFF55985A
          096F15086A14086512076311076211076211076211076211076412086713096B
          14096F1546914CFFFFFFFFFFFFFFFFFF6CAC73388E42167B220A74170A74170A
          74170A74170A74170A74171C7E2842944C76B27DFFFFFFFFFFFF}
        ParentFont = False
        TabOrder = 5
        OnClick = blimpiarprovClick
      end
      object BitBtn1: TBitBtn
        Left = 125
        Top = 178
        Width = 121
        Height = 25
        Caption = 'Buscar Online'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFE6CBB9D19C6FC6792ACC7B1FCA7A1DC47827D29B6EE6CCBAFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF7F4CC8D5AD98D1FE8A424EBA821E6
          A21FE59E19E69E16E49713D38313CA8C5AFCF8F5FFFFFFFFFFFFFFFFFFFCF9F6
          CB823DEDAE34F3CE7FEAB963E3A126E3A22EE29F28E19C24E29D20E69E1AE298
          17C87D36FDF9F7FFFFFFFFFFFFD39862F1BF52ECB73EF3DDC7F0C88AE7A523E8
          AE3EE7A937E6A733E5A32DE2A02BE49D15E29C16D2945FFFFFFFECD3BDE8B459
          F5CB65ECB949F2D7AAF8F1FFEDBD5CE9B039EAB247E9B141E8AD3EE6A62FEAC0
          76ECB543DA8D10ECD3BDE0B181F9D779F2C767F1C053F3D398F8F2FFF7E8DEED
          BC51EDB84AEBB84EEBB346EAB444F4EAF9F2DBC5EFC472DEB083DFA85EFCE18B
          F2CC6EF3CA61F6E5CEF8EEECFAF1FBF4DCB0EEBD4FEFC05BECBA4BEFC677F5E7
          E8F5E1DEF7E1BFDA9F5FE9BD70FBDF8CF4CE6EF4D899FAF4FCF9EFECFBF2F9F6
          E7D7F0C75CF2C45FEFBC4AF1CC7FF6E7E9F3E4E6F2D085DF9D2DE9BF71FCE390
          F6D46DF8E1B3F9F6FFFAF3F4F8E5C1F6DA93F6DC99F7DDA3F6DFB6F7E4D2F5E8
          E4F4E4E0F5E6DFE3A64CE8B76DFFF0B4F8E5B7FAF0EAFAF2E7F9E9CAF9E1A1F8
          E4AEF8DF9FF9EEE0F9F2FEF7ECE9F6E7E0F3E3DBF8EDF2E7BA80ECC795FDFBFE
          FBF5F1FBEED7FAEBCBFBE8B6FAE6B1FAE5B2F9E2A5F9ECD4F9F0F1F7EBE5F6E9
          E5F5E4DEF8EEF5EDCDA3F5E2C6FAF9FAFDFCFFFCF9F7FBECC5FBE2A6FBE5B0FB
          E7B6FBE7B3FAE4ACF9F0EFF8ECE9F8E7D6F8ECEAF4E3D4F5E0C2FFFFFFF2D3A8
          FFFFFFFDFDFFFEFBFCFCF2DFFCEBC2FBE5B2FBE7B6FBE5AEF9EDDAF8EDEBF8E9
          E5F9F3FDEECA93FFFFFFFFFFFFFEFBF7F7E5C6FFFFFFFFFFFFFEFFFFFCF3DFFA
          E2A4FBE7B4FBE5ACFAECD7FAF3FAF9F5FFF0CD9BFEFBF7FFFFFFFFFFFFFFFFFF
          FEFCF7F3D4A0FAEED7FFFFFFFEF1D3FCF0D6FDEBBEFDEECBFCF1D9F8E9D7F3D0
          9AFEFBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF1DCF9EAC9F4D9A2F1
          CC7FF1CC7FF5D9A2F9E7C4FBEFD8FFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        TabOrder = 4
        OnClick = BitBtn1Click
      end
      object epv: TEdit
        Left = 123
        Top = 77
        Width = 63
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        MaxLength = 4
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
        OnKeyPress = epvKeyPress
      end
      object ecuit: TEdit
        Left = 277
        Top = 29
        Width = 233
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
    object tbCobertura: TTabSheet
      Caption = 'ObraSocial'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label2: TLabel
        Left = 6
        Top = 6
        Width = 18
        Height = 14
        Caption = 'OS:'
      end
      object Label5: TLabel
        Left = 44
        Top = 65
        Width = 39
        Height = 14
        Caption = 'Afiliado:'
      end
      object Label10: TLabel
        Left = 9
        Top = 30
        Width = 61
        Height = 14
        Caption = 'Nro. Afiliado:'
      end
      object Label11: TLabel
        Left = 16
        Top = 88
        Width = 63
        Height = 14
        Caption = 'Matr. Medica:'
      end
      object Label12: TLabel
        Left = 30
        Top = 147
        Width = 57
        Height = 14
        Caption = 'Nro Receta:'
      end
      object Label13: TLabel
        Left = 16
        Top = 179
        Width = 70
        Height = 14
        Caption = 'Fecha Receta:'
      end
      object Label30: TLabel
        Left = 58
        Top = 123
        Width = 37
        Height = 14
        Caption = 'Medico:'
      end
      object Ltratamiento: TLabel
        Left = 316
        Top = 8
        Width = 3
        Height = 13
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Eos: TEdit
        Left = 32
        Top = 3
        Width = 51
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 3
        TabOrder = 1
        StyleElements = [seFont, seBorder]
        OnChange = EosChange
        OnEnter = EosEnter
        OnExit = EosExit
        OnKeyDown = EosKeyDown
      end
      object Panel4: TPanel
        Left = 105
        Top = 24
        Width = 346
        Height = 185
        Color = cl3DLight
        Enabled = False
        ParentBackground = False
        TabOrder = 0
        object desbloqueo: TLabel
          Left = 10
          Top = 208
          Width = 3
          Height = 13
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 6
          Top = 82
          Width = 38
          Height = 14
          Caption = 'Apellido'
        end
        object Label37: TLabel
          Left = 116
          Top = 82
          Width = 37
          Height = 14
          Caption = 'Nombre'
        end
        object Label38: TLabel
          Left = 116
          Top = 24
          Width = 37
          Height = 14
          Caption = 'Nombre'
        end
        object Label39: TLabel
          Left = 6
          Top = 24
          Width = 38
          Height = 14
          Caption = 'Apellido'
        end
        object eafiliado: TEdit
          Left = 6
          Top = 3
          Width = 229
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          StyleElements = [seFont, seBorder]
          OnChange = eafiliadoChange
          OnEnter = eafiliadoEnter
          OnExit = eafiliadoExit
          OnKeyDown = eafiliadoKeyDown
          OnKeyPress = eafiliadoKeyPress
        end
        object eosapellido: TEdit
          Left = 6
          Top = 38
          Width = 109
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 1
          StyleElements = [seFont, seBorder]
          OnEnter = eosapellidoEnter
          OnExit = eosapellidoExit
          OnKeyPress = eosapellidoKeyPress
        end
        object eosmedicoAPELLIDO: TEdit
          Left = 6
          Top = 96
          Width = 109
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 2
          StyleElements = [seFont, seBorder]
          OnEnter = eosmedicoAPELLIDOEnter
          OnExit = eosmedicoAPELLIDOExit
          OnKeyPress = eosmedicoAPELLIDOKeyPress
        end
        object dtfecreceta: TDateTimePicker
          Left = 8
          Top = 147
          Width = 112
          Height = 21
          Date = 42492.605182592590000000
          Time = 42492.605182592590000000
          TabOrder = 3
          StyleElements = [seFont, seBorder]
          OnKeyPress = dtfecrecetaKeyPress
        end
        object Eosmatricula: TEdit
          Left = 6
          Top = 61
          Width = 109
          Height = 21
          CharCase = ecUpperCase
          NumbersOnly = True
          TabOrder = 4
          StyleElements = [seFont, seBorder]
          OnChange = EosmatriculaChange
          OnEnter = EosmatriculaEnter
          OnExit = EosmatriculaExit
          OnKeyDown = EosmatriculaKeyDown
          OnKeyPress = EosmatriculaKeyPress
        end
        object eosreceta: TEdit
          Left = 6
          Top = 120
          Width = 229
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 5
          StyleElements = [seFont, seBorder]
          OnEnter = eosrecetaEnter
          OnExit = eosrecetaExit
          OnKeyPress = eosrecetaKeyPress
        end
        object blimpiar: TBitBtn
          Left = 125
          Top = 146
          Width = 111
          Height = 25
          Caption = 'Limpiar'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            9C9699746D70716A6B716A6B716A6B716A6B716A6B716A6B716A6B716A6B716A
            6D9C9699FFFFFFFFFFFFFFFFFFFFFFFF776C70A2AFA5A2AFA5A2AFA5A2AFA5A2
            AFA5A2AFA5A2AFA5A2AFA5A2AFA5A2AFA5796E72FFFFFFFFFFFFFFFFFFFFFFFF
            837B7FC9C5C7008036278E5236945CA9BEAF9BB9A5008036008036008036C9C5
            C7837B7FFFFFFFFFFFFFFFFFFFC5C0C2A19B9CE8E6E604904248A872E0DFDDE0
            DFDDE0DFDDE0DFDD64B286049042E8E6E6A19B9CDDDADBFFFFFFFFFFFFACA5A8
            C9C5C7F0EEED84D6AF26A863E1E8E3F0EEEDF0EEEDE1E8E317A35984D6AFF0EE
            EDC9C5C7BFBABCFFFFFFFFFFFF91888CE8E6E6FCFBF9EDF5F0FCFBF9EDF5F0FC
            FBF9FCFBF9DDF1E6EDF5F0DFF1E6FCFBF9E8E6E69F979BFFFFFFFFFFFF7E7478
            FFFEFEFFFEFEFFFEFEFFFEFE0BAF60B3E6CCB3E6CC0BAF60FFFEFEFFFEFEFFFE
            FEFFFEFE887E82FFFFFFFFFFFF877F83F0EEEDF0EEEDF0EEEDF0EEED23AD6C64
            B28664B28615A963E0E8E3F0EEEDF0EEEDF0EEED8C8488FFFFFFFFFFFF9F9598
            DDDCDADDDCDADDDCDADDDCDADDDCDA019750019750DDDCDADDDCDADDDCDADDDC
            DADDDCDA9F9598FFFFFFFFFFFFAAA2A5CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7CB
            C8C7CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7AAA2A5FFFFFF186B1D0A791C
            0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A79
            1C0A791C0A791C136A181F8B3635C06435C06435C06435C06435C06435C06435
            C06435C06435C06435C06435C06435C06435C06435C0640D8326229B4541D48E
            41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D4
            8E41D48E41D48E0E94372D9A47239E4D1C96461A9040178B3C16873915863815
            863815863815863816883A178B3C1A90411C96461F9C4B219740FFFFFF55985A
            096F15086A14086512076311076211076211076211076211076412086713096B
            14096F1546914CFFFFFFFFFFFFFFFFFF6CAC73388E42167B220A74170A74170A
            74170A74170A74170A74171C7E2842944C76B27DFFFFFFFFFFFF}
          TabOrder = 6
          OnClick = blimpiarClick
        end
        object Cosprovincia: TComboBox
          Left = 116
          Top = 61
          Width = 119
          Height = 22
          ItemIndex = 1
          TabOrder = 7
          Text = 'Santa cruz'
          Items.Strings = (
            'NACIONAL'
            'Santa cruz'
            'Chubut'
            'Tierra del fuego'
            'Rio Negro'
            'Mendoza'
            'Cordoba'
            'San luis'
            'Buenos aires'
            'Santa fe'
            'Catamarca'
            'La rioja'
            'Salta'
            'Jujuy'
            'Misiones'
            'Chaco'
            'Santiago del estero'
            'Corrientes'
            'Entre Rios')
        end
        object EOSMEDICONOMBRE: TEdit
          Left = 116
          Top = 96
          Width = 119
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 8
          StyleElements = [seFont, seBorder]
          OnEnter = EOSMEDICONOMBREEnter
          OnExit = EOSMEDICONOMBREExit
          OnKeyPress = EOSMEDICONOMBREKeyPress
        end
        object eosnombre: TEdit
          Left = 116
          Top = 38
          Width = 119
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 9
          StyleElements = [seFont, seBorder]
          OnEnter = eosnombreEnter
          OnExit = eosnombreExit
          OnKeyPress = eosnombreKeyPress
        end
        object bgrabarafiliado: TBitBtn
          Left = 235
          Top = 3
          Width = 108
          Height = 25
          Caption = 'Grabar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000C1761BC27519
            BD6B13B96504B96504B96504BA6504BA6504BA6504BA6504BA6504BA6504BA65
            04BC690AB96A15C3791FD5933DEFB736CDC6C0E9F8FFDBE5F6DBE8F8DBE8F8DB
            E8F9DBE8F8DAE7F8DBE7F8D8E4F5E9F6FFCDC6C0EAA714C0761DCD9551E8AE3C
            DCD7D4ECE8E9ADA0A2A79B9E9E939594898C8A818583797C7B7276685F64ECE8
            E9DCD7D4E59E20C77B25D09653EAB447DCD7D4EFF0EFDFDEDCE1E0DFE0DFDEDF
            E0DDE0DFDDDFDEDDDFE0DEDBD9D9EDEDEDDCD7D4E7A62BC9802BD49B58EBB950
            DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
            E9DCD7D4E8AC37CC8531D69E5BEDBD5ADCD7D4FFFFFFFFFEFEFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EAB340D08B34D9A45EF0C263
            DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
            E9DCD7D4EDB749D2903AD8A35CF0C66DDCD7D4FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EEBD54D7963EDEAC69F9D281
            C1975C9A7B6095775E97795D97795D97795D97795D97795C97795C95775E9A7A
            5EC19A64F7CA6BD99B44DDAB67F6D58BFFD056C0A887C8C5C9CEC6BFCDC6C0CD
            C6C0CDC6BFD6D0CAD6D3D0CFCED4C0A888FFD25DF3CC75DCA148DCA966F6D993
            FBC85DC2B4A2D7DEEBDDDDDDDCDDDEDCDBDDE7E8EAC8BAA7A29692C2B4A2C6BC
            A9FBCB63F3D07EE0A74CE5B973F6DA97FBCC62C8BAA7DDE0E9E1DFDDE0DFDEDF
            DDDCEFF3F99F886FE5AF479E9189C7BDB2FDCF6AF5D484E3AC51E9BC75F8DD9E
            FDCF69CEC0AFE3E7EFE7E5E3E6E5E4E5E4E2F1F6FFBAA386FFE873B5AB9ECAC0
            B8FFD26EF9DA8EE7B25BEAC079F8E09BFBD165D3C4AFEAEEF6ECEBE8ECEBE9EB
            E9E6FBFFFFA28E78DEAF4FA89C95D1C7B9FFDA78F5D889E2A442ECC47EFEF4D5
            FFE290DCD7D4F5FFFFF6FEFFF6FEFFF6FDFFFFFFFFDFDDDCC8BAA7DFDDDCE5E4
            E2FFDE88E4AA45FCF5ECECC681F0CA82F4CA7DE8C788EFCF94EFD498EDCF92EE
            D092EED093F2D396F7D79BF6D69BE6C48AEBB552FDF9F2FFFFFF}
          ParentFont = False
          TabOrder = 10
          OnClick = bgrabarafiliadoClick
        end
        object bgrabarmedico: TBitBtn
          Left = 235
          Top = 60
          Width = 108
          Height = 25
          Caption = 'Grabar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000C1761BC27519
            BD6B13B96504B96504B96504BA6504BA6504BA6504BA6504BA6504BA6504BA65
            04BC690AB96A15C3791FD5933DEFB736CDC6C0E9F8FFDBE5F6DBE8F8DBE8F8DB
            E8F9DBE8F8DAE7F8DBE7F8D8E4F5E9F6FFCDC6C0EAA714C0761DCD9551E8AE3C
            DCD7D4ECE8E9ADA0A2A79B9E9E939594898C8A818583797C7B7276685F64ECE8
            E9DCD7D4E59E20C77B25D09653EAB447DCD7D4EFF0EFDFDEDCE1E0DFE0DFDEDF
            E0DDE0DFDDDFDEDDDFE0DEDBD9D9EDEDEDDCD7D4E7A62BC9802BD49B58EBB950
            DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
            E9DCD7D4E8AC37CC8531D69E5BEDBD5ADCD7D4FFFFFFFFFEFEFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EAB340D08B34D9A45EF0C263
            DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
            E9DCD7D4EDB749D2903AD8A35CF0C66DDCD7D4FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EEBD54D7963EDEAC69F9D281
            C1975C9A7B6095775E97795D97795D97795D97795D97795C97795C95775E9A7A
            5EC19A64F7CA6BD99B44DDAB67F6D58BFFD056C0A887C8C5C9CEC6BFCDC6C0CD
            C6C0CDC6BFD6D0CAD6D3D0CFCED4C0A888FFD25DF3CC75DCA148DCA966F6D993
            FBC85DC2B4A2D7DEEBDDDDDDDCDDDEDCDBDDE7E8EAC8BAA7A29692C2B4A2C6BC
            A9FBCB63F3D07EE0A74CE5B973F6DA97FBCC62C8BAA7DDE0E9E1DFDDE0DFDEDF
            DDDCEFF3F99F886FE5AF479E9189C7BDB2FDCF6AF5D484E3AC51E9BC75F8DD9E
            FDCF69CEC0AFE3E7EFE7E5E3E6E5E4E5E4E2F1F6FFBAA386FFE873B5AB9ECAC0
            B8FFD26EF9DA8EE7B25BEAC079F8E09BFBD165D3C4AFEAEEF6ECEBE8ECEBE9EB
            E9E6FBFFFFA28E78DEAF4FA89C95D1C7B9FFDA78F5D889E2A442ECC47EFEF4D5
            FFE290DCD7D4F5FFFFF6FEFFF6FEFFF6FDFFFFFFFFDFDDDCC8BAA7DFDDDCE5E4
            E2FFDE88E4AA45FCF5ECECC681F0CA82F4CA7DE8C788EFCF94EFD498EDCF92EE
            D092EED093F2D396F7D79BF6D69BE6C48AEBB552FDF9F2FFFFFF}
          ParentFont = False
          TabOrder = 11
          OnClick = bgrabarmedicoClick
        end
      end
      object los: TEdit
        Left = 89
        Top = 3
        Width = 221
        Height = 21
        TabOrder = 2
        OnChange = losChange
      end
    end
    object tbCoseguro: TTabSheet
      Caption = 'Coseguro 1'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label3: TLabel
        Left = 4
        Top = 6
        Width = 24
        Height = 14
        Caption = 'CO1:'
      end
      object Label9: TLabel
        Left = 9
        Top = 30
        Width = 61
        Height = 14
        Caption = 'Nro. Afiliado:'
      end
      object Label15: TLabel
        Left = 44
        Top = 65
        Width = 39
        Height = 14
        Caption = 'Afiliado:'
      end
      object Label16: TLabel
        Left = 16
        Top = 88
        Width = 63
        Height = 14
        Caption = 'Matr. Medica:'
      end
      object Label17: TLabel
        Left = 58
        Top = 122
        Width = 37
        Height = 14
        Caption = 'Medico:'
      end
      object Label20: TLabel
        Left = 30
        Top = 155
        Width = 57
        Height = 14
        Caption = 'Nro Receta:'
      end
      object Label21: TLabel
        Left = 16
        Top = 179
        Width = 70
        Height = 14
        Caption = 'Fecha Receta:'
      end
      object Eco1: TEdit
        Left = 32
        Top = 3
        Width = 51
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 3
        TabOrder = 0
        StyleElements = [seFont, seBorder]
        OnChange = Eco1Change
        OnEnter = Eco1Enter
        OnExit = Eco1Exit
        OnKeyDown = Eco1KeyDown
        OnKeyPress = Eco1KeyPress
      end
      object Panel5: TPanel
        Left = 107
        Top = 24
        Width = 343
        Height = 179
        Color = cl3DLight
        Enabled = False
        ParentBackground = False
        TabOrder = 1
        object Label40: TLabel
          Left = 6
          Top = 24
          Width = 38
          Height = 14
          Caption = 'Apellido'
        end
        object Label41: TLabel
          Left = 116
          Top = 24
          Width = 37
          Height = 14
          Caption = 'Nombre'
        end
        object Label42: TLabel
          Left = 116
          Top = 82
          Width = 37
          Height = 14
          Caption = 'Nombre'
        end
        object Label43: TLabel
          Left = 6
          Top = 82
          Width = 38
          Height = 14
          Caption = 'Apellido'
        end
        object ECO1AFILIADO: TEdit
          Left = 6
          Top = 3
          Width = 229
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          StyleElements = [seFont, seBorder]
          OnChange = ECO1AFILIADOChange
          OnEnter = ECO1AFILIADOEnter
          OnExit = ECO1AFILIADOExit
          OnKeyDown = ECO1AFILIADOKeyDown
          OnKeyPress = ECO1AFILIADOKeyPress
        end
        object ECO1apellido: TEdit
          Left = 6
          Top = 38
          Width = 109
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          StyleElements = [seFont, seBorder]
          OnEnter = ECO1apellidoEnter
          OnExit = ECO1apellidoExit
          OnKeyPress = ECO1apellidoKeyPress
        end
        object ECO1apellidoMEDICO: TEdit
          Left = 6
          Top = 96
          Width = 109
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
          StyleElements = [seFont, seBorder]
          OnEnter = ECO1apellidoMEDICOEnter
          OnExit = ECO1apellidoMEDICOExit
          OnKeyPress = ECO1apellidoMEDICOKeyPress
        end
        object dtfeccoseguro: TDateTimePicker
          Left = 6
          Top = 150
          Width = 112
          Height = 21
          Date = 42492.605182592590000000
          Time = 42492.605182592590000000
          TabOrder = 3
          OnKeyPress = dtfeccoseguroKeyPress
        end
        object ECO1MATRICULA: TEdit
          Left = 6
          Top = 61
          Width = 109
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
          StyleElements = [seFont, seBorder]
          OnChange = ECO1MATRICULAChange
          OnEnter = ECO1MATRICULAEnter
          OnExit = ECO1MATRICULAExit
          OnKeyDown = ECO1MATRICULAKeyDown
          OnKeyPress = ECO1MATRICULAKeyPress
        end
        object eco1receta: TEdit
          Left = 6
          Top = 123
          Width = 229
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 5
          StyleElements = [seFont, seBorder]
          OnEnter = eco1recetaEnter
          OnExit = eco1recetaExit
          OnKeyPress = eco1recetaKeyPress
        end
        object blimpiarco1: TBitBtn
          Left = 124
          Top = 150
          Width = 111
          Height = 25
          Caption = 'Limpiar'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            9C9699746D70716A6B716A6B716A6B716A6B716A6B716A6B716A6B716A6B716A
            6D9C9699FFFFFFFFFFFFFFFFFFFFFFFF776C70A2AFA5A2AFA5A2AFA5A2AFA5A2
            AFA5A2AFA5A2AFA5A2AFA5A2AFA5A2AFA5796E72FFFFFFFFFFFFFFFFFFFFFFFF
            837B7FC9C5C7008036278E5236945CA9BEAF9BB9A5008036008036008036C9C5
            C7837B7FFFFFFFFFFFFFFFFFFFC5C0C2A19B9CE8E6E604904248A872E0DFDDE0
            DFDDE0DFDDE0DFDD64B286049042E8E6E6A19B9CDDDADBFFFFFFFFFFFFACA5A8
            C9C5C7F0EEED84D6AF26A863E1E8E3F0EEEDF0EEEDE1E8E317A35984D6AFF0EE
            EDC9C5C7BFBABCFFFFFFFFFFFF91888CE8E6E6FCFBF9EDF5F0FCFBF9EDF5F0FC
            FBF9FCFBF9DDF1E6EDF5F0DFF1E6FCFBF9E8E6E69F979BFFFFFFFFFFFF7E7478
            FFFEFEFFFEFEFFFEFEFFFEFE0BAF60B3E6CCB3E6CC0BAF60FFFEFEFFFEFEFFFE
            FEFFFEFE887E82FFFFFFFFFFFF877F83F0EEEDF0EEEDF0EEEDF0EEED23AD6C64
            B28664B28615A963E0E8E3F0EEEDF0EEEDF0EEED8C8488FFFFFFFFFFFF9F9598
            DDDCDADDDCDADDDCDADDDCDADDDCDA019750019750DDDCDADDDCDADDDCDADDDC
            DADDDCDA9F9598FFFFFFFFFFFFAAA2A5CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7CB
            C8C7CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7AAA2A5FFFFFF186B1D0A791C
            0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A79
            1C0A791C0A791C136A181F8B3635C06435C06435C06435C06435C06435C06435
            C06435C06435C06435C06435C06435C06435C06435C0640D8326229B4541D48E
            41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D4
            8E41D48E41D48E0E94372D9A47239E4D1C96461A9040178B3C16873915863815
            863815863815863816883A178B3C1A90411C96461F9C4B219740FFFFFF55985A
            096F15086A14086512076311076211076211076211076211076412086713096B
            14096F1546914CFFFFFFFFFFFFFFFFFF6CAC73388E42167B220A74170A74170A
            74170A74170A74170A74171C7E2842944C76B27DFFFFFFFFFFFF}
          TabOrder = 6
          OnClick = blimpiarco1Click
        end
        object eco1nombremedico: TEdit
          Left = 116
          Top = 96
          Width = 119
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 7
          StyleElements = [seFont, seBorder]
          OnEnter = eco1nombremedicoEnter
          OnExit = eco1nombremedicoExit
          OnKeyPress = eco1nombremedicoKeyPress
        end
        object ComboBox1: TComboBox
          Left = 116
          Top = 61
          Width = 119
          Height = 22
          ItemIndex = 1
          TabOrder = 8
          Text = 'Santa cruz'
          Items.Strings = (
            'NACIONAL'
            'Santa cruz'
            'Chubut'
            'Tierra del fuego'
            'Rio Negro'
            'Mendoza'
            'Cordoba'
            'San luis'
            'Buenos aires'
            'Santa fe'
            'Catamarca'
            'La rioja'
            'Salta'
            'Jujuy'
            'Misiones'
            'Chaco'
            'Santiago del estero'
            'Corrientes'
            'Entre Rios')
        end
        object eco1nombre: TEdit
          Left = 116
          Top = 38
          Width = 119
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 9
          StyleElements = [seFont, seBorder]
          OnEnter = eco1nombreEnter
          OnExit = eco1nombreExit
          OnKeyPress = eco1nombreKeyPress
        end
        object bagregarafico: TBitBtn
          Left = 236
          Top = 3
          Width = 105
          Height = 25
          Caption = 'Grabar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000C1761BC27519
            BD6B13B96504B96504B96504BA6504BA6504BA6504BA6504BA6504BA6504BA65
            04BC690AB96A15C3791FD5933DEFB736CDC6C0E9F8FFDBE5F6DBE8F8DBE8F8DB
            E8F9DBE8F8DAE7F8DBE7F8D8E4F5E9F6FFCDC6C0EAA714C0761DCD9551E8AE3C
            DCD7D4ECE8E9ADA0A2A79B9E9E939594898C8A818583797C7B7276685F64ECE8
            E9DCD7D4E59E20C77B25D09653EAB447DCD7D4EFF0EFDFDEDCE1E0DFE0DFDEDF
            E0DDE0DFDDDFDEDDDFE0DEDBD9D9EDEDEDDCD7D4E7A62BC9802BD49B58EBB950
            DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
            E9DCD7D4E8AC37CC8531D69E5BEDBD5ADCD7D4FFFFFFFFFEFEFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EAB340D08B34D9A45EF0C263
            DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
            E9DCD7D4EDB749D2903AD8A35CF0C66DDCD7D4FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EEBD54D7963EDEAC69F9D281
            C1975C9A7B6095775E97795D97795D97795D97795D97795C97795C95775E9A7A
            5EC19A64F7CA6BD99B44DDAB67F6D58BFFD056C0A887C8C5C9CEC6BFCDC6C0CD
            C6C0CDC6BFD6D0CAD6D3D0CFCED4C0A888FFD25DF3CC75DCA148DCA966F6D993
            FBC85DC2B4A2D7DEEBDDDDDDDCDDDEDCDBDDE7E8EAC8BAA7A29692C2B4A2C6BC
            A9FBCB63F3D07EE0A74CE5B973F6DA97FBCC62C8BAA7DDE0E9E1DFDDE0DFDEDF
            DDDCEFF3F99F886FE5AF479E9189C7BDB2FDCF6AF5D484E3AC51E9BC75F8DD9E
            FDCF69CEC0AFE3E7EFE7E5E3E6E5E4E5E4E2F1F6FFBAA386FFE873B5AB9ECAC0
            B8FFD26EF9DA8EE7B25BEAC079F8E09BFBD165D3C4AFEAEEF6ECEBE8ECEBE9EB
            E9E6FBFFFFA28E78DEAF4FA89C95D1C7B9FFDA78F5D889E2A442ECC47EFEF4D5
            FFE290DCD7D4F5FFFFF6FEFFF6FEFFF6FDFFFFFFFFDFDDDCC8BAA7DFDDDCE5E4
            E2FFDE88E4AA45FCF5ECECC681F0CA82F4CA7DE8C788EFCF94EFD498EDCF92EE
            D092EED093F2D396F7D79BF6D69BE6C48AEBB552FDF9F2FFFFFF}
          ParentFont = False
          TabOrder = 10
          OnClick = bagregaraficoClick
        end
        object bagregarmedico: TBitBtn
          Left = 236
          Top = 61
          Width = 105
          Height = 25
          Caption = 'Grabar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000C1761BC27519
            BD6B13B96504B96504B96504BA6504BA6504BA6504BA6504BA6504BA6504BA65
            04BC690AB96A15C3791FD5933DEFB736CDC6C0E9F8FFDBE5F6DBE8F8DBE8F8DB
            E8F9DBE8F8DAE7F8DBE7F8D8E4F5E9F6FFCDC6C0EAA714C0761DCD9551E8AE3C
            DCD7D4ECE8E9ADA0A2A79B9E9E939594898C8A818583797C7B7276685F64ECE8
            E9DCD7D4E59E20C77B25D09653EAB447DCD7D4EFF0EFDFDEDCE1E0DFE0DFDEDF
            E0DDE0DFDDDFDEDDDFE0DEDBD9D9EDEDEDDCD7D4E7A62BC9802BD49B58EBB950
            DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
            E9DCD7D4E8AC37CC8531D69E5BEDBD5ADCD7D4FFFFFFFFFEFEFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EAB340D08B34D9A45EF0C263
            DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
            E9DCD7D4EDB749D2903AD8A35CF0C66DDCD7D4FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EEBD54D7963EDEAC69F9D281
            C1975C9A7B6095775E97795D97795D97795D97795D97795C97795C95775E9A7A
            5EC19A64F7CA6BD99B44DDAB67F6D58BFFD056C0A887C8C5C9CEC6BFCDC6C0CD
            C6C0CDC6BFD6D0CAD6D3D0CFCED4C0A888FFD25DF3CC75DCA148DCA966F6D993
            FBC85DC2B4A2D7DEEBDDDDDDDCDDDEDCDBDDE7E8EAC8BAA7A29692C2B4A2C6BC
            A9FBCB63F3D07EE0A74CE5B973F6DA97FBCC62C8BAA7DDE0E9E1DFDDE0DFDEDF
            DDDCEFF3F99F886FE5AF479E9189C7BDB2FDCF6AF5D484E3AC51E9BC75F8DD9E
            FDCF69CEC0AFE3E7EFE7E5E3E6E5E4E5E4E2F1F6FFBAA386FFE873B5AB9ECAC0
            B8FFD26EF9DA8EE7B25BEAC079F8E09BFBD165D3C4AFEAEEF6ECEBE8ECEBE9EB
            E9E6FBFFFFA28E78DEAF4FA89C95D1C7B9FFDA78F5D889E2A442ECC47EFEF4D5
            FFE290DCD7D4F5FFFFF6FEFFF6FEFFF6FDFFFFFFFFDFDDDCC8BAA7DFDDDCE5E4
            E2FFDE88E4AA45FCF5ECECC681F0CA82F4CA7DE8C788EFCF94EFD498EDCF92EE
            D092EED093F2D396F7D79BF6D69BE6C48AEBB552FDF9F2FFFFFF}
          ParentFont = False
          TabOrder = 11
          OnClick = bagregarmedicoClick
        end
      end
      object lco1: TEdit
        Left = 89
        Top = 3
        Width = 221
        Height = 21
        TabOrder = 2
        OnChange = lco1Change
      end
    end
    object tbCoseguro2: TTabSheet
      Caption = 'Coseguro 2'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label4: TLabel
        Left = 5
        Top = 6
        Width = 24
        Height = 14
        Caption = 'CO2:'
      end
      object Label22: TLabel
        Left = 5
        Top = 33
        Width = 61
        Height = 14
        Caption = 'Nro. Afiliado:'
      end
      object Label23: TLabel
        Left = 5
        Top = 55
        Width = 40
        Height = 14
        Caption = 'Nombre:'
      end
      object Label24: TLabel
        Left = 5
        Top = 77
        Width = 63
        Height = 14
        Caption = 'Matr. Medica:'
      end
      object Label25: TLabel
        Left = 5
        Top = 101
        Width = 37
        Height = 14
        Caption = 'Medico:'
      end
      object Label26: TLabel
        Left = 6
        Top = 125
        Width = 63
        Height = 14
        Caption = 'Especialidad:'
      end
      object Label33: TLabel
        Left = 6
        Top = 150
        Width = 59
        Height = 14
        Caption = 'Diagnostico:'
      end
      object Label34: TLabel
        Left = 5
        Top = 174
        Width = 57
        Height = 14
        Caption = 'Nro Receta:'
      end
      object Label35: TLabel
        Left = 5
        Top = 198
        Width = 70
        Height = 14
        Caption = 'Fecha Receta:'
      end
      object Eco2: TEdit
        Left = 32
        Top = 3
        Width = 51
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 3
        TabOrder = 0
        OnKeyPress = Eco2KeyPress
      end
      object Panel3: TPanel
        Left = 75
        Top = 27
        Width = 380
        Height = 221
        Color = cl3DLight
        Enabled = False
        ParentBackground = False
        TabOrder = 1
        object eco2afiliado: TEdit
          Left = 6
          Top = 3
          Width = 229
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object eco2nombre: TEdit
          Left = 6
          Top = 26
          Width = 229
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object eco2medico: TEdit
          Left = 6
          Top = 73
          Width = 229
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object eco2especialidad: TEdit
          Left = 6
          Top = 97
          Width = 229
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object eco2diagnostico: TEdit
          Left = 6
          Top = 122
          Width = 229
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
        end
        object DateTimePicker2: TDateTimePicker
          Left = 6
          Top = 170
          Width = 112
          Height = 21
          Date = 42492.605182592590000000
          Time = 42492.605182592590000000
          TabOrder = 5
        end
        object eco2matricula: TEdit
          Left = 6
          Top = 49
          Width = 112
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 6
        end
        object eco2receta: TEdit
          Left = 6
          Top = 146
          Width = 229
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 7
        end
        object Limpiar: TBitBtn
          Left = 124
          Top = 168
          Width = 111
          Height = 25
          Caption = 'Limpiar'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            9C9699746D70716A6B716A6B716A6B716A6B716A6B716A6B716A6B716A6B716A
            6D9C9699FFFFFFFFFFFFFFFFFFFFFFFF776C70A2AFA5A2AFA5A2AFA5A2AFA5A2
            AFA5A2AFA5A2AFA5A2AFA5A2AFA5A2AFA5796E72FFFFFFFFFFFFFFFFFFFFFFFF
            837B7FC9C5C7008036278E5236945CA9BEAF9BB9A5008036008036008036C9C5
            C7837B7FFFFFFFFFFFFFFFFFFFC5C0C2A19B9CE8E6E604904248A872E0DFDDE0
            DFDDE0DFDDE0DFDD64B286049042E8E6E6A19B9CDDDADBFFFFFFFFFFFFACA5A8
            C9C5C7F0EEED84D6AF26A863E1E8E3F0EEEDF0EEEDE1E8E317A35984D6AFF0EE
            EDC9C5C7BFBABCFFFFFFFFFFFF91888CE8E6E6FCFBF9EDF5F0FCFBF9EDF5F0FC
            FBF9FCFBF9DDF1E6EDF5F0DFF1E6FCFBF9E8E6E69F979BFFFFFFFFFFFF7E7478
            FFFEFEFFFEFEFFFEFEFFFEFE0BAF60B3E6CCB3E6CC0BAF60FFFEFEFFFEFEFFFE
            FEFFFEFE887E82FFFFFFFFFFFF877F83F0EEEDF0EEEDF0EEEDF0EEED23AD6C64
            B28664B28615A963E0E8E3F0EEEDF0EEEDF0EEED8C8488FFFFFFFFFFFF9F9598
            DDDCDADDDCDADDDCDADDDCDADDDCDA019750019750DDDCDADDDCDADDDCDADDDC
            DADDDCDA9F9598FFFFFFFFFFFFAAA2A5CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7CB
            C8C7CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7AAA2A5FFFFFF186B1D0A791C
            0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A79
            1C0A791C0A791C136A181F8B3635C06435C06435C06435C06435C06435C06435
            C06435C06435C06435C06435C06435C06435C06435C0640D8326229B4541D48E
            41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D4
            8E41D48E41D48E0E94372D9A47239E4D1C96461A9040178B3C16873915863815
            863815863815863816883A178B3C1A90411C96461F9C4B219740FFFFFF55985A
            096F15086A14086512076311076211076211076211076211076412086713096B
            14096F1546914CFFFFFFFFFFFFFFFFFF6CAC73388E42167B220A74170A74170A
            74170A74170A74170A74171C7E2842944C76B27DFFFFFFFFFFFF}
          TabOrder = 8
        end
      end
      object lco2: TEdit
        Left = 89
        Top = 3
        Width = 221
        Height = 21
        TabOrder = 2
      end
    end
  end
  object pinformativo: TPanel
    Left = 0
    Top = 636
    Width = 841
    Height = 18
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
    StyleElements = []
  end
end

object Ffacturador: TFfacturador
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'A+'
  ClientHeight = 660
  ClientWidth = 858
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMode = pmExplicit
  Position = poDesigned
  OnActivate = FormActivate
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
    Top = 568
    Width = 57
    Height = 12
    Caption = 'Importe Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label28: TLabel
    Left = 217
    Top = 568
    Width = 53
    Height = 12
    Caption = 'Descuentos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label29: TLabel
    Left = 433
    Top = 568
    Width = 62
    Height = 12
    Caption = 'Neto a Cobrar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object importetotal: TDBText
    Left = 81
    Top = 562
    Width = 120
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'importetotal'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    StyleElements = [seBorder]
  end
  object descuentos: TDBText
    Left = 297
    Top = 562
    Width = 120
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'descuentos_total'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    StyleElements = [seBorder]
  end
  object netoacobrar: TDBText
    Left = 520
    Top = 562
    Width = 120
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'netoxcobrar'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    StyleElements = [seBorder]
  end
  object descuentoco1: TDBText
    Left = 297
    Top = 587
    Width = 120
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'DESCUENTOTOTALCO1'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    StyleElements = [seBorder]
  end
  object descuentoos: TDBText
    Left = 81
    Top = 587
    Width = 120
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'DESCUENTOTOTALOS'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    StyleElements = [seBorder]
  end
  object descuentoco2: TDBText
    Left = 520
    Top = 590
    Width = 120
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'DESCUENTOTOTALCO2'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    StyleElements = [seBorder]
  end
  object Label44: TLabel
    Left = 9
    Top = 592
    Width = 64
    Height = 12
    Caption = 'Descuento OS:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label45: TLabel
    Left = 217
    Top = 592
    Width = 70
    Height = 12
    Caption = 'Descuentos Co1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label46: TLabel
    Left = 433
    Top = 592
    Width = 70
    Height = 12
    Caption = 'Descuentos Co2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object desbloqueo: TLabel
    Left = 330
    Top = 340
    Width = 3
    Height = 14
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object importegentilezas: TDBText
    Left = 731
    Top = 562
    Width = 119
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'TOTALGENTILEZA'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    StyleElements = [seBorder]
  end
  object Label18: TLabel
    Left = 644
    Top = 568
    Width = 66
    Height = 12
    Caption = 'Imp. gentilezas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object descuentoaplus: TDBText
    Left = 731
    Top = 588
    Width = 121
    Height = 22
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'descuentototalaplus'
    DataSource = dmFacturador.dsfact
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    StyleElements = [seBorder]
  end
  object Label34: TLabel
    Left = 646
    Top = 593
    Width = 70
    Height = 12
    Caption = 'Descuento aplus'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label35: TLabel
    Left = 728
    Top = 200
    Width = 37
    Height = 13
    Caption = 'Label35'
  end
  object Label48: TLabel
    Left = 752
    Top = 200
    Width = 37
    Height = 13
    Caption = 'Label48'
  end
  object pgCoberturas: TPageControl
    Left = 330
    Top = 5
    Width = 528
    Height = 309
    ActivePage = tbCobertura
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    MultiLine = True
    OwnerDraw = True
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 1
    OnDrawTab = pgCoberturasDrawTab
    OnExit = pgCoberturasExit
    object tbCobertura: TTabSheet
      Caption = 'ObraSocial'
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnExit = tbCoberturaExit
      object Label2: TLabel
        Left = 14
        Top = 4
        Width = 26
        Height = 17
        Caption = 'OS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 51
        Top = 92
        Width = 46
        Height = 16
        Caption = 'Afiliado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 11
        Top = 47
        Width = 73
        Height = 16
        Caption = 'Nro. Afiliado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 19
        Top = 122
        Width = 79
        Height = 16
        Caption = 'Matr. Medica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 35
        Top = 193
        Width = 69
        Height = 16
        Caption = 'Nro Receta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 19
        Top = 221
        Width = 85
        Height = 16
        Caption = 'Fecha Receta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label30: TLabel
        Left = 67
        Top = 163
        Width = 46
        Height = 16
        Caption = 'Medico:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Ltratamiento: TLabel
        Left = 381
        Top = 4
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
        Left = 42
        Top = 1
        Width = 62
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 0
        StyleElements = [seFont, seBorder]
        OnChange = EosChange
        OnEnter = EosEnter
        OnExit = EosExit
        OnKeyDown = EosKeyDown
      end
      object Panel4: TPanel
        Left = 129
        Top = 29
        Width = 390
        Height = 247
        Color = cl3DLight
        Enabled = False
        ParentBackground = False
        TabOrder = 1
        object Label36: TLabel
          Left = 7
          Top = 114
          Width = 50
          Height = 17
          Caption = 'Apellido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label37: TLabel
          Left = 122
          Top = 114
          Width = 52
          Height = 17
          Caption = 'Nombre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 122
          Top = 41
          Width = 52
          Height = 17
          Caption = 'Nombre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 8
          Top = 41
          Width = 50
          Height = 17
          Caption = 'Apellido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object lblDatosMedico: TLabel
          Left = 243
          Top = 132
          Width = 124
          Height = 39
          Caption = 'Por favor completar nombre y apellido del medico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          WordWrap = True
        end
        object eafiliado: TEdit
          Left = 8
          Top = 10
          Width = 229
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          StyleElements = [seFont, seBorder]
          OnChange = eafiliadoChange
          OnEnter = eafiliadoEnter
          OnExit = eafiliadoExit
          OnKeyDown = eafiliadoKeyDown
          OnKeyPress = eafiliadoKeyPress
        end
        object eosapellido: TEdit
          Left = 8
          Top = 59
          Width = 109
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          StyleElements = [seFont, seBorder]
          OnEnter = eosapellidoEnter
          OnExit = eosapellidoExit
          OnKeyPress = eosapellidoKeyPress
        end
        object eosmedicoAPELLIDO: TEdit
          Left = 7
          Top = 130
          Width = 109
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          StyleElements = [seFont, seBorder]
          OnEnter = eosmedicoAPELLIDOEnter
          OnExit = eosmedicoAPELLIDOExit
          OnKeyPress = eosmedicoAPELLIDOKeyPress
        end
        object dtfecreceta: TDateTimePicker
          Left = 8
          Top = 189
          Width = 112
          Height = 25
          Date = 42492.605182592590000000
          Time = 42492.605182592590000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          StyleElements = [seFont, seBorder]
          OnKeyPress = dtfecrecetaKeyPress
        end
        object Eosmatricula: TEdit
          Left = 7
          Top = 90
          Width = 109
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 0
          StyleElements = [seFont, seBorder]
          OnChange = EosmatriculaChange
          OnEnter = EosmatriculaEnter
          OnExit = EosmatriculaExit
          OnKeyDown = EosmatriculaKeyDown
          OnKeyPress = EosmatriculaKeyPress
        end
        object eosreceta: TEdit
          Left = 8
          Top = 157
          Width = 229
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          StyleElements = [seFont, seBorder]
          OnEnter = eosrecetaEnter
          OnExit = eosrecetaExit
          OnKeyPress = eosrecetaKeyPress
        end
        object blimpiar: TBitBtn
          Left = 121
          Top = 189
          Width = 128
          Height = 25
          Caption = 'Limpiar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
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
          TabOrder = 12
          OnClick = blimpiarClick
        end
        object Cosprovincia: TComboBox
          Left = 118
          Top = 90
          Width = 119
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ItemIndex = 2
          ParentFont = False
          TabOrder = 6
          Text = 'Chubut'
          OnExit = CosprovinciaExit
          OnKeyPress = cosprovinciakeypress
          OnSelect = CosprovinciaSelect
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
          Left = 117
          Top = 130
          Width = 120
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          StyleElements = [seFont, seBorder]
          OnEnter = EOSMEDICONOMBREEnter
          OnExit = EOSMEDICONOMBREExit
          OnKeyPress = EOSMEDICONOMBREKeyPress
        end
        object eosnombre: TEdit
          Left = 117
          Top = 59
          Width = 120
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          StyleElements = [seFont, seBorder]
          OnEnter = eosnombreEnter
          OnExit = eosnombreExit
          OnKeyPress = eosnombreKeyPress
        end
        object bgrabarafiliado: TBitBtn
          Left = 243
          Top = 14
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
          TabOrder = 1
          OnClick = bgrabarafiliadoClick
        end
        object bgrabarmedico: TBitBtn
          Left = 243
          Top = 89
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
          TabOrder = 5
          OnClick = bgrabarmedicoClick
        end
        object bhistorial: TBitBtn
          Left = 249
          Top = 189
          Width = 128
          Height = 25
          Caption = 'Historial'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFF1258CB
            0D5ED90B58D30C5DD70E5DD60E5AD30E5AD30E5CD50E5CD50E5BD30E5AD30E5B
            D30E5CD61256CAFFFFFF105BCE0979FF085EDE256AD30A5AD5046EF70F80FF0E
            80FF0371FA0069F30C7DFF0E7FFF0B7DFF0074FE0C80FF1059CE0D63DE0F64D8
            BECDE6FBFAF9D3DBED2262CC0876F90B74F2356CCB6288CF0C63DD0F80FE1062
            D8366ECE0E6DE70F64DD0B55D4679CE3FFFFFFFFFFFFFFFFFF96B3E3066FED0B
            6BE7C7D7EDFFFFFF2B70D5006CEE5C88D3FAFAFA5D93DD0B58D50D5FDA5791E2
            FFFFFFFFFFFFFFFFFF89AAE20D7CF40B64DDE0E7F4FFFFFC2974DD0775F085AB
            E4FFFFFF74A5E70B59D61D75E60F70E6BECDE6ECEFF8BECDE61F70DF0D82F843
            83DEFFFFFED5DFF3106CE31176EBCEDDF7FFFFFE4D90E51167E02077E72AA1FF
            167FEE1B77E6197FEC1489F91065DDD5DFF3FFFFFF6696E11385F41C71E2F6F4
            F9F8F6FA2277E41F7AE92A81E93CAFFF2497FA1A88F31679EB347EE4D5DFF3FF
            FFFFD5DFF31E7CE91083F271A0E7FFFFFFCEDDF72086EF2C85EA3E8EEB67C0FE
            5799E99BC0EFD1DFF6FFFEFDFFFFFFD5DFF3217BE61B91F92E7EE6E6EFF9FBFD
            FE5E9CEA60BDFE3E8FEC4192EF67BDFBA8CBF4FFFFFFFFFFFEEAF1FCD1DFF63C
            92EE3BA3F94095EEE6EFF9FFFFFFCEDDF757ACF67ED1FF3F91EE4495F081D0FF
            5FAAF488C2F775B7F65DABF455B0F951ACF977B0F3E6EFF9FFFFFFCEDDF751A4
            F37ACCFF85D4FF4395F0479AF28FDBFF75C7FE57B2FB57AEF95EAEF87EBBF8CE
            DDF7FFFFFEFFFFFFCEDDF751A5F479CBFE84D1FF8AD8FF479AF34AA0F685D4FF
            71B3F9D7E8FCE3EEFCF4F7FDFFFFFEFFFFFFE7F0FE8FC2F959AEFA84D4FF8CD7
            FF89D5FF92DCFF4A9FF64FA6F986D5FF88C0FCFFFEFFFBFCFFF4F8FFC9E3FE89
            C0FC6CB7FC70C5FD92DBFF91D9FF8FD8FF8FD8FF9BE0FF4CA4F93C99FBA0E5FF
            7BC8FF76BEFF7FC5FF68B9FF74C6FE85D3FF97DEFFA0E3FF9BE0FF9BE0FF9BE0
            FF9CE1FF9EE4FF3F9AFBFFFFFF419EFE54ADFE4AA7FE4EABFE52ACFE50ABFE4F
            A9FE4EA8FE4EA8FE4EA8FE4EA8FE4EA8FE50AAFE409EFEFFFFFF}
          ParentFont = False
          TabOrder = 10
          OnClick = bhistorialClick
        end
        object bValidaReElec: TBitBtn
          Left = 11
          Top = 219
          Width = 75
          Height = 25
          Caption = 'Validar Receta'
          TabOrder = 13
          Visible = False
          OnClick = bValidaReElecClick
        end
      end
      object los: TEdit
        Left = 108
        Top = 1
        Width = 261
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnChange = losChange
      end
    end
    object tbCoseguro: TTabSheet
      Caption = 'Coseguro 1'
      ImageIndex = 1
      OnExit = tbCoseguroExit
      object Label3: TLabel
        Left = 8
        Top = 4
        Width = 35
        Height = 17
        Caption = 'CO1:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 5
        Top = 47
        Width = 73
        Height = 16
        Caption = 'Nro. Afiliado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 45
        Top = 91
        Width = 46
        Height = 16
        Caption = 'Afiliado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 13
        Top = 121
        Width = 79
        Height = 16
        Caption = 'Matr. Medica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 61
        Top = 163
        Width = 46
        Height = 16
        Caption = 'Medico:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 29
        Top = 195
        Width = 69
        Height = 16
        Caption = 'Nro Receta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 13
        Top = 226
        Width = 85
        Height = 16
        Caption = 'Fecha Receta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Eco1: TEdit
        Left = 40
        Top = 1
        Width = 62
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 0
        StyleElements = [seFont, seBorder]
        OnChange = Eco1Change
        OnEnter = Eco1Enter
        OnExit = Eco1Exit
        OnKeyDown = Eco1KeyDown
        OnKeyPress = Eco1KeyPress
      end
      object Panel5: TPanel
        Left = 130
        Top = 28
        Width = 387
        Height = 246
        Color = clMoneyGreen
        Enabled = False
        ParentBackground = False
        TabOrder = 1
        object Label40: TLabel
          Left = 8
          Top = 41
          Width = 50
          Height = 17
          Caption = 'Apellido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 121
          Top = 41
          Width = 52
          Height = 17
          Caption = 'Nombre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 121
          Top = 112
          Width = 52
          Height = 17
          Caption = 'Nombre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 8
          Top = 113
          Width = 50
          Height = 17
          Caption = 'Apellido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object ECO1AFILIADO: TEdit
          Left = 8
          Top = 13
          Width = 229
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          StyleElements = [seFont, seBorder]
          OnChange = ECO1AFILIADOChange
          OnEnter = ECO1AFILIADOEnter
          OnExit = ECO1AFILIADOExit
          OnKeyDown = ECO1AFILIADOKeyDown
          OnKeyPress = ECO1AFILIADOKeyPress
        end
        object eco1apellido: TEdit
          Left = 8
          Top = 57
          Width = 109
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          StyleElements = [seFont, seBorder]
          OnEnter = eco1apellidoEnter
          OnExit = eco1apellidoExit
          OnKeyPress = eco1apellidoKeyPress
        end
        object eco1apellidomedico: TEdit
          Left = 8
          Top = 129
          Width = 109
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          StyleElements = [seFont, seBorder]
          OnEnter = eco1apellidomedicoEnter
          OnExit = eco1apellidomedicoExit
          OnKeyPress = eco1apellidomedicoKeyPress
        end
        object dtfeccoseguro: TDateTimePicker
          Left = 3
          Top = 193
          Width = 112
          Height = 23
          Date = 42492.605182592590000000
          Time = 42492.605182592590000000
          TabOrder = 10
          StyleElements = [seFont, seBorder]
          OnKeyPress = dtfeccoseguroKeyPress
        end
        object ECO1MATRICULA: TEdit
          Left = 6
          Top = 89
          Width = 109
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          StyleElements = [seFont, seBorder]
          OnChange = ECO1MATRICULAChange
          OnEnter = ECO1MATRICULAEnter
          OnExit = ECO1MATRICULAExit
          OnKeyDown = ECO1MATRICULAKeyDown
          OnKeyPress = ECO1MATRICULAKeyPress
        end
        object eco1receta: TEdit
          Left = 8
          Top = 161
          Width = 229
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          StyleElements = [seFont, seBorder]
          OnKeyPress = eco1recetaKeyPress
        end
        object blimpiarco1: TBitBtn
          Left = 121
          Top = 193
          Width = 128
          Height = 25
          Caption = 'Limpiar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
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
          TabOrder = 11
          OnClick = blimpiarco1Click
        end
        object eco1nombremedico: TEdit
          Left = 118
          Top = 129
          Width = 119
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          StyleElements = [seFont, seBorder]
          OnEnter = eco1nombremedicoEnter
          OnExit = eco1nombremedicoExit
          OnKeyPress = eco1nombremedicoKeyPress
        end
        object cco1provincia: TComboBox
          Left = 118
          Top = 89
          Width = 118
          Height = 24
          ItemIndex = 1
          TabOrder = 5
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
          Left = 118
          Top = 57
          Width = 119
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          StyleElements = [seFont, seBorder]
          OnEnter = eco1nombreEnter
          OnExit = eco1nombreExit
          OnKeyPress = eco1nombreKeyPress
        end
        object bagregarafico: TBitBtn
          Left = 242
          Top = 13
          Width = 109
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
          TabOrder = 3
          OnClick = bagregaraficoClick
        end
        object bagregarmedico: TBitBtn
          Left = 242
          Top = 88
          Width = 109
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
          TabOrder = 8
          OnClick = bagregarmedicoClick
        end
      end
      object lco1: TEdit
        Left = 108
        Top = 1
        Width = 261
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnChange = lco1Change
      end
    end
    object tbCoseguro2: TTabSheet
      Caption = 'Coseguro 2'
      ImageIndex = 2
      object Label22: TLabel
        Left = 12
        Top = 47
        Width = 73
        Height = 16
        Caption = 'Nro. Afiliado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 52
        Top = 93
        Width = 46
        Height = 16
        Caption = 'Afiliado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 20
        Top = 122
        Width = 79
        Height = 16
        Caption = 'Matr. Medica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 68
        Top = 165
        Width = 46
        Height = 16
        Caption = 'Medico:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 36
        Top = 194
        Width = 69
        Height = 16
        Caption = 'Nro Receta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label33: TLabel
        Left = 20
        Top = 222
        Width = 85
        Height = 16
        Caption = 'Fecha Receta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 3
        Width = 35
        Height = 17
        Caption = 'CO2:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ParentFont = False
      end
      object Eco2: TEdit
        Left = 42
        Top = 1
        Width = 62
        Height = 24
        CharCase = ecUpperCase
        Color = clWhite
        MaxLength = 3
        TabOrder = 0
        OnChange = Eco2Change
        OnEnter = Eco2Enter
        OnExit = Eco2Exit
        OnKeyDown = Eco2KeyDown
        OnKeyPress = Eco2KeyPress
      end
      object lco2: TEdit
        Left = 108
        Top = 1
        Width = 261
        Height = 24
        Color = clWhite
        TabOrder = 1
        OnChange = lco2Change
      end
      object Panel3: TPanel
        Left = 130
        Top = 29
        Width = 390
        Height = 247
        Color = clTeal
        Enabled = False
        ParentBackground = False
        TabOrder = 2
        object Label19: TLabel
          Left = 7
          Top = 114
          Width = 50
          Height = 17
          Caption = 'Apellido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 122
          Top = 114
          Width = 52
          Height = 17
          Caption = 'Nombre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 122
          Top = 41
          Width = 52
          Height = 17
          Caption = 'Nombre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 8
          Top = 41
          Width = 50
          Height = 17
          Caption = 'Apellido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object eco2afiliado: TEdit
          Left = 8
          Top = 10
          Width = 229
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          StyleElements = [seFont, seBorder]
          OnChange = eco2afiliadoChange
          OnEnter = eco2afiliadoEnter
          OnExit = eco2afiliadoExit
          OnKeyDown = eco2afiliadoKeyDown
          OnKeyPress = eco2afiliadoKeyPress
        end
        object eco2apellido: TEdit
          Left = 8
          Top = 59
          Width = 109
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          StyleElements = [seFont, seBorder]
          OnEnter = eosapellidoEnter
          OnExit = eosapellidoExit
          OnKeyPress = eosapellidoKeyPress
        end
        object eco2medicoapellido: TEdit
          Left = 8
          Top = 131
          Width = 109
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          StyleElements = [seFont, seBorder]
          OnKeyPress = eco2medicoapellidoKeyPress
        end
        object dtfeccoseguro2: TDateTimePicker
          Left = 8
          Top = 188
          Width = 112
          Height = 25
          Date = 42492.605182592590000000
          Time = 42492.605182592590000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          StyleElements = [seFont, seBorder]
          OnKeyPress = dtfeccoseguro2KeyPress
        end
        object eco2matricula: TEdit
          Left = 8
          Top = 89
          Width = 109
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 4
          StyleElements = [seFont, seBorder]
          OnChange = eco2matriculaChange
          OnKeyPress = eco2matriculaKeyPress
        end
        object eco2receta: TEdit
          Left = 8
          Top = 159
          Width = 231
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          StyleElements = [seFont, seBorder]
          OnKeyPress = eco2recetaKeyPress
        end
        object blimpiarco2: TBitBtn
          Left = 121
          Top = 189
          Width = 128
          Height = 25
          Caption = 'Limpiar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
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
          TabOrder = 11
          OnClick = blimpiarco2Click
        end
        object cco2provincia: TComboBox
          Left = 119
          Top = 89
          Width = 120
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ItemIndex = 1
          ParentFont = False
          TabOrder = 5
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
        object eco2mediconombre: TEdit
          Left = 119
          Top = 131
          Width = 120
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          StyleElements = [seFont, seBorder]
          OnKeyPress = eco2mediconombreKeyPress
        end
        object eco2nombre: TEdit
          Left = 119
          Top = 59
          Width = 120
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          StyleElements = [seFont, seBorder]
          OnEnter = eosnombreEnter
          OnExit = eosnombreExit
          OnKeyPress = eosnombreKeyPress
        end
        object Bgrabarafico2: TBitBtn
          Left = 243
          Top = 7
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
          TabOrder = 3
          OnClick = Bgrabarafico2Click
        end
        object bagregarmedicoco2: TBitBtn
          Left = 242
          Top = 89
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
          TabOrder = 8
          OnClick = bagregarmedicoco2Click
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 2
    Top = 5
    Width = 322
    Height = 144
    Caption = 'Panel1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Simplified Arabic'
    Font.Style = []
    ParentFont = False
    ShowCaption = False
    TabOrder = 0
    object Bevel1: TBevel
      Left = 103
      Top = 94
      Width = 207
      Height = 21
    end
    object Label1: TLabel
      Left = 111
      Top = 96
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
      Left = 13
      Top = 7
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
    object Label7: TLabel
      Left = 103
      Top = 43
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
    object Label8: TLabel
      Left = 13
      Top = 70
      Width = 54
      Height = 16
      Caption = 'Vendedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object Shape1: TShape
      Left = 2
      Top = 26
      Width = 318
      Height = 1
      Brush.Color = clBlue
      Brush.Style = bsBDiagonal
      Pen.Color = clMoneyGreen
    end
    object lblLeyendaTurno: TLabel
      Left = 12
      Top = 121
      Width = 229
      Height = 13
      Caption = 'Presione [F8] para  actualizar el turnero'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Evendedor: TEdit
      Left = 10
      Top = 94
      Width = 87
      Height = 22
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 1
      StyleElements = [seFont, seBorder]
      OnChange = EvendedorChange
      OnEnter = EvendedorEnter
      OnExit = EvendedorExit
      OnKeyDown = EvendedorKeyDown
      OnKeyPress = EvendedorKeyPress
    end
    object combotipo: TComboBox
      Left = 10
      Top = 38
      Width = 87
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = combotipoExit
      OnKeyPress = combotipoKeyPress
    end
  end
  object Gfacturador: TDBGrid
    Left = 0
    Top = 314
    Width = 850
    Height = 242
    TabStop = False
    Color = clScrollBar
    DataSource = dmFacturador.dsfact
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
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
    StyleElements = []
    OnCellClick = GfacturadorCellClick
    OnExit = GfacturadorExit
    OnKeyDown = GfacturadorKeyDown
    OnKeyPress = GfacturadorKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'NRO_TROQUEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ReadOnly = True
        Title.Caption = 'Troquel'
        Title.Color = clMenuBar
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ReadOnly = True
        Title.Caption = 'Descripcion'
        Title.Color = clMenuBar
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ReadOnly = True
        Title.Caption = 'Precio'
        Title.Color = clMenuBar
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = clInfoText
        Expanded = False
        FieldName = 'CANTIDAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = [fsBold]
        Title.Caption = 'Cantidad'
        Title.Color = clMenuBar
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ReadOnly = True
        Title.Caption = 'Descuentos'
        Title.Color = clMenuBar
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ReadOnly = True
        Title.Caption = 'Precio c/descuento'
        Title.Color = clMenuBar
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
        FieldName = 'PRECIO_TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ReadOnly = True
        Title.Caption = 'Precio Total'
        Title.Color = clMenuBar
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 97
        Visible = True
      end
      item
        Color = 7886092
        Expanded = False
        FieldName = 'porcentaje'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = [fsBold]
        Title.Caption = 'Porcentaje'
        Title.Color = clMenuBar
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_ALFABETA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ReadOnly = True
        Title.Color = clMenuBar
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ReadOnly = True
        Title.Caption = 'Codigo de barras'
        Title.Color = clMenuBar
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_IVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ReadOnly = True
        Title.Color = clMenuBar
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = False
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'PORCENTAJEOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = [fsBold]
        Title.Caption = '%OS'
        Title.Color = clMenuBar
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = False
      end
      item
        Color = clInactiveCaption
        Expanded = False
        FieldName = 'PORCENTAJECO1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = [fsBold]
        Title.Caption = '%CO1'
        Title.Color = clMenuBar
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = False
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'PORCENTAJECO2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        Title.Caption = '%CO2'
        Title.Color = clMenuBar
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESCUENTOSOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        Title.Caption = 'DescuentosOS'
        Title.Color = clMenuBar
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_LABORATORIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        Title.Caption = 'Laboratorio'
        Title.Color = clMenuBar
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'can_stk'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        Title.Caption = 'STOCK'
        Title.Color = clMenuBar
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        ReadOnly = True
        Title.Color = clMenuBar
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'can_vale'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        Title.Caption = 'Cantidad Vale'
        Title.Color = clMenuBar
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        Title.Caption = 'Tama'#241'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESCUENTOCO1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Modificado'
        Visible = False
      end
      item
        Color = clTeal
        Expanded = False
        FieldName = 'GENTILEZA'
        ReadOnly = True
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RUBRO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IMPORTEGENT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -15
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODAUTORIZACION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Item'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESCUENTOCO2'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hosp'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJEAPLUS'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCUENTOAPLUS'
        Width = 74
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 1
    Top = 150
    Width = 323
    Height = 167
    ParentBackground = False
    TabOrder = 2
    object Label14: TLabel
      Left = 8
      Top = 78
      Width = 52
      Height = 16
      Caption = 'Producto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object ebusqueda: TEdit
      Left = 8
      Top = 94
      Width = 303
      Height = 22
      TabStop = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      StyleElements = [seFont, seBorder]
      OnEnter = ebusquedaEnter
      OnExit = ebusquedaExit
      OnKeyDown = ebusquedaKeyDown
      OnKeyPress = ebusquedaKeyPress
    end
    object bbuscar: TButton
      Left = 8
      Top = 122
      Width = 98
      Height = 25
      Caption = 'Buscar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = bbuscarClick
    end
    object Rbusqueda: TRadioGroup
      Left = 3
      Top = 8
      Width = 316
      Height = 66
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
      TabOrder = 1
    end
    object bmodificable: TButton
      Left = 112
      Top = 122
      Width = 102
      Height = 25
      Caption = 'P. modificable(F1)'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = bmodificableClick
    end
    object btnRecargos: TButton
      Left = 220
      Top = 122
      Width = 95
      Height = 25
      Caption = 'R.Medicinal(F9)'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnRecargosClick
    end
  end
  object imprimir: TBitBtn
    Left = 369
    Top = 610
    Width = 122
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
    TabOrder = 4
    OnClick = imprimirClick
  end
  object Blimpiartodo: TBitBtn
    Left = 4
    Top = 609
    Width = 122
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
    TabOrder = 5
    OnClick = BlimpiartodoClick
  end
  object BVALIDAR: TBitBtn
    Left = 744
    Top = 283
    Width = 20
    Height = 25
    Caption = 'Validar(F5)'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFF0E0BAB2321B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A8E31712CB312EBAFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFCFCFE4A47CD201AF22C29B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C1E62A24E81B13FF33
      31B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF6160C8332BFF150EF52F2CBCFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDBF51610B62F2CF41B
      18FC1E1BFA3330C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFAFADE73A38DA4248FF1417F81614DEBEBCEAFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2623C34B4FE73D
      4AFE2029F1423DD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF3D37D07C84F36F87FF6673F73D39D5FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9F440
      3CDC7D93FC6882FB6A7EF83531D9EFEFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFBBB8F45958E87D96FD6781F86C84FA677BF74541DFF2F1
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAB8F36367ED88
      A7FF6B83F87695FC4E56ECCCCBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF312CDF707BF281A5FD728DF981A2FD4649E9A7A3
      F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF38
      30E58197F87EA0FA85A9FC819DFA2E29E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B23E69BBDFE788DF84E47EAF9F9
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF8884F13735EA4840EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 6
    Visible = False
    OnClick = BVALIDARClick
  end
  object DESCOBER: TBitBtn
    Left = 488
    Top = 609
    Width = 122
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
    TabOrder = 7
    OnClick = DESCOBERClick
  end
  object pinformativo: TPanel
    Left = 2
    Top = 634
    Width = 851
    Height = 24
    Color = 7886092
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 8
    StyleElements = []
  end
  object bvale: TBitBtn
    Left = 246
    Top = 609
    Width = 122
    Height = 25
    Caption = 'Vale(F4)'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC89878D3AE94FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB8784CBF6D19C18B65FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB97748BF6D19E59E1EB9774AFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFCA8A4CBC6C1FBC6C1FBC6C1FBC6C1FBC6C1FBF
      6D19E4A32FE6A630BB6A1FBC6C1FBC6C1FBC6C1FCC8E52FFFFFFDCA45DE9AE3C
      E9AE3CE8AC3BE8AC3BE8AC3BE8AC3BE6A93AE6A93AE6A93AE8AC3BE8AC3BE8AC
      3BE9AE3CE9AE3CDEA763D38C33E9B248E9B448EBB64AEBB64AEBB64AEBB64AEB
      B64AEBB64AEBB64AEBB64AEBB64AEBB64AE9B448E9B248D38C33D38C33EBB852
      DFA23FC97A20C97A1FC97A1FC97A1FC97A1FC97A1FC97A1FC97A1FC97A1FC97A
      20DFA23FEBB852D38C33DB9B3FF0C261E2A746FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2A746F0C261DB9B3FDD9E40F0C667
      E4AE4DCC9052CC9052CC9052CC9052CC9052CC9052CC9052CC9052CC9052CC90
      52E4AF4EF0C668DD9F42E7BE73F6DDA3F6DEA5F7DD9BF8DD99F6DA90F5D381F5
      D581F5D581F5D581F5D581F6DA90F6D98FF5DA98F6DDA5E7BF74EAC176F7DEA5
      E4AF4EE4AF4EE4AF4EE4AF4EE4AF4EE4AF4EE4AF4EE4AF4EE4AF4EE4AF4EE4AF
      4EE4AF4EF7DEA5EAC176EDC87DF8E3AFE9BF75FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9BF75F8E3AFEDC87DEECD82FAE5B1
      F4D899F4D899F4D899F4D899F4D899F4D899F4D899F4D899F4D899F4D899F4D8
      99F4D899FAE5B1EECD82F5DCA3FAE6B5FAE6B4FAE6B4FAE6B4FAE6B4FAE6B4FA
      E6B4FAE6B4FAE6B4FAE6B4FAE6B4FAE6B4FAE6B4FAE6B5F6DFB3FFFFFFF5DFAA
      EEC86FEEC86FEEC86FEEC86FEEC86FEEC86FEEC86FEEC86FEEC86FEEC86FEEC8
      6FEEC86FF5DDA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 9
    OnClick = bvaleClick
  end
  object bprecio: TBitBtn
    Left = 125
    Top = 609
    Width = 122
    Height = 25
    Caption = 'M.Precio (F3)'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFF2C2BEB
      3D47EB3A42EB393FE7393EE53237E01319DB1019D9292ED73031D72D2DD22B29
      CF2926CE1611B4FFFFFF3C39EE6D97F64D72F54D70F5496BF44566F62C4CF488
      9AF996A6FA112FF13147F9303EF82E37F82C30F92D2AFF1310B23F3DF0688BF5
      445FF24561F2445EF12945EF6477F3FFFFFFFFFFFF5D6BF1192AED2E3AED2B30
      EC2729EC2A27FE140FB49992F66375F34F71F34562F24460F12F4BEF576EF2F9
      FBFEFBFAFF4E60F01F30EE2E39EE2B31ED2B2DF9221EDD8D8ACBFFFFFF3C33EC
      678AF53D5CF24460F1425BF12542EF3F52EF3F52F00D27EC313FEF2E38EE2B31
      ED2C2DFB1F1BAEFFFFFFFFFFFFB3AEF84C54EE4F73F5405BF1304CEF556AF2FF
      FFFFFFFFFF495EF01D2FEE2E39ED2F36FC1F1CD0B2B0E0FFFFFFFFFFFFFFFFFF
      746AEE6A81F53958F2203DEE5F74F3FFFFFFFFFFFF5A6BF1172AED313DF42C30
      F04B47BBFFFFFFFFFFFFFFFFFFFFFFFFE9E8FC7D7DF17C96F73F58F16377F4FF
      FFFFFFFFFF5161F11023ED2B3AF91714C5E0DFF3FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF928AEF8B99F46880F58997F6FFFFFFFFFFFF7180F34151F5585FEF8A85
      D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FE6864E9728AF98393F6FF
      FFFFFFFFFF8692F65C6BF95956D1F8F7FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC5C1F6737AF0869CFAFFFFFFFFFFFF7F8FFB5057E6C6C3ECFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAFF746DE58094F78B
      99F6919DF65E72F86D68D5FBFAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFDDDBF96F71E86F8AFA5B74FC5C5FE2DDDBF5FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA39FEC78
      7DEB6E74EAA49FE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B4EFAEABEBFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 10
    OnClick = bprecioClick
  end
  object bstockonline: TBitBtn
    Left = 609
    Top = 609
    Width = 122
    Height = 25
    Caption = 'Stock Suc.(F12)'
    Enabled = False
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFF1258CB
      0D5ED90B58D30C5DD70E5DD60E5AD30E5AD30E5CD50E5CD50E5BD30E5AD30E5B
      D30E5CD61256CAFFFFFF105BCE0979FF085EDE256AD30A5AD5046EF70F80FF0E
      80FF0371FA0069F30C7DFF0E7FFF0B7DFF0074FE0C80FF1059CE0D63DE0F64D8
      BECDE6FBFAF9D3DBED2262CC0876F90B74F2356CCB6288CF0C63DD0F80FE1062
      D8366ECE0E6DE70F64DD0B55D4679CE3FFFFFFFFFFFFFFFFFF96B3E3066FED0B
      6BE7C7D7EDFFFFFF2B70D5006CEE5C88D3FAFAFA5D93DD0B58D50D5FDA5791E2
      FFFFFFFFFFFFFFFFFF89AAE20D7CF40B64DDE0E7F4FFFFFC2974DD0775F085AB
      E4FFFFFF74A5E70B59D61D75E60F70E6BECDE6ECEFF8BECDE61F70DF0D82F843
      83DEFFFFFED5DFF3106CE31176EBCEDDF7FFFFFE4D90E51167E02077E72AA1FF
      167FEE1B77E6197FEC1489F91065DDD5DFF3FFFFFF6696E11385F41C71E2F6F4
      F9F8F6FA2277E41F7AE92A81E93CAFFF2497FA1A88F31679EB347EE4D5DFF3FF
      FFFFD5DFF31E7CE91083F271A0E7FFFFFFCEDDF72086EF2C85EA3E8EEB67C0FE
      5799E99BC0EFD1DFF6FFFEFDFFFFFFD5DFF3217BE61B91F92E7EE6E6EFF9FBFD
      FE5E9CEA60BDFE3E8FEC4192EF67BDFBA8CBF4FFFFFFFFFFFEEAF1FCD1DFF63C
      92EE3BA3F94095EEE6EFF9FFFFFFCEDDF757ACF67ED1FF3F91EE4495F081D0FF
      5FAAF488C2F775B7F65DABF455B0F951ACF977B0F3E6EFF9FFFFFFCEDDF751A4
      F37ACCFF85D4FF4395F0479AF28FDBFF75C7FE57B2FB57AEF95EAEF87EBBF8CE
      DDF7FFFFFEFFFFFFCEDDF751A5F479CBFE84D1FF8AD8FF479AF34AA0F685D4FF
      71B3F9D7E8FCE3EEFCF4F7FDFFFFFEFFFFFFE7F0FE8FC2F959AEFA84D4FF8CD7
      FF89D5FF92DCFF4A9FF64FA6F986D5FF88C0FCFFFEFFFBFCFFF4F8FFC9E3FE89
      C0FC6CB7FC70C5FD92DBFF91D9FF8FD8FF8FD8FF9BE0FF4CA4F93C99FBA0E5FF
      7BC8FF76BEFF7FC5FF68B9FF74C6FE85D3FF97DEFFA0E3FF9BE0FF9BE0FF9BE0
      FF9CE1FF9EE4FF3F9AFBFFFFFF419EFE54ADFE4AA7FE4EABFE52ACFE50ABFE4F
      A9FE4EA8FE4EA8FE4EA8FE4EA8FE4EA8FE50AAFE409EFEFFFFFF}
    TabOrder = 11
    OnClick = bstockonlineClick
  end
  object bdetalle: TBitBtn
    Left = 730
    Top = 609
    Width = 122
    Height = 25
    Caption = 'Detalle prod.(F11)'
    Enabled = False
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC89878D3AE94FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB8784CBF6D19C18B65FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB97748BF6D19E59E1EB9774AFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFCA8A4CBC6C1FBC6C1FBC6C1FBC6C1FBC6C1FBF
      6D19E4A32FE6A630BB6A1FBC6C1FBC6C1FBC6C1FCC8E52FFFFFFDCA45DE9AE3C
      E9AE3CE8AC3BE8AC3BE8AC3BE8AC3BE6A93AE6A93AE6A93AE8AC3BE8AC3BE8AC
      3BE9AE3CE9AE3CDEA763D38C33E9B248E9B448EBB64AEBB64AEBB64AEBB64AEB
      B64AEBB64AEBB64AEBB64AEBB64AEBB64AE9B448E9B248D38C33D38C33EBB852
      DFA23FC97A20C97A1FC97A1FC97A1FC97A1FC97A1FC97A1FC97A1FC97A1FC97A
      20DFA23FEBB852D38C33DB9B3FF0C261E2A746FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2A746F0C261DB9B3FDD9E40F0C667
      E4AE4DCC9052CC9052CC9052CC9052CC9052CC9052CC9052CC9052CC9052CC90
      52E4AF4EF0C668DD9F42E7BE73F6DDA3F6DEA5F7DD9BF8DD99F6DA90F5D381F5
      D581F5D581F5D581F5D581F6DA90F6D98FF5DA98F6DDA5E7BF74EAC176F7DEA5
      E4AF4EE4AF4EE4AF4EE4AF4EE4AF4EE4AF4EE4AF4EE4AF4EE4AF4EE4AF4EE4AF
      4EE4AF4EF7DEA5EAC176EDC87DF8E3AFE9BF75FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9BF75F8E3AFEDC87DEECD82FAE5B1
      F4D899F4D899F4D899F4D899F4D899F4D899F4D899F4D899F4D899F4D899F4D8
      99F4D899FAE5B1EECD82F5DCA3FAE6B5FAE6B4FAE6B4FAE6B4FAE6B4FAE6B4FA
      E6B4FAE6B4FAE6B4FAE6B4FAE6B4FAE6B4FAE6B4FAE6B5F6DFB3FFFFFFF5DFAA
      EEC86FEEC86FEEC86FEEC86FEEC86FEEC86FEEC86FEEC86FEEC86FEEC86FEEC8
      6FEEC86FF5DDA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 12
    OnClick = bdetalleClick
  end
  object lturno: TPanel
    Left = 704
    Top = 8
    Width = 135
    Height = 49
    BevelInner = bvRaised
    BevelOuter = bvNone
    Color = 7886092
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 13
    StyleElements = []
    OnClick = lturnoClick
  end
end

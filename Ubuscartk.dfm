object fbuscartk: Tfbuscartk
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Fbuscartk'
  ClientHeight = 550
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Bitstream Vera Sans Mono'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 1
    Top = 2
    Width = 775
    Height = 37
    TabOrder = 0
    object Shape1: TShape
      Left = 2
      Top = 27
      Width = 352
      Height = 1
      Brush.Color = clBlue
      Brush.Style = bsBDiagonal
      Pen.Color = clRed
    end
    object Label6: TLabel
      Left = 686
      Top = 43
      Width = 221
      Height = 15
      Caption = 'Busqueda e insercion de comprobantes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 1
    Top = 39
    Width = 775
    Height = 477
    TabOrder = 1
    object mticket: TMemo
      Left = 3
      Top = 3
      Width = 768
      Height = 267
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object gdetalle: TDBGrid
      Left = 2
      Top = 275
      Width = 769
      Height = 199
      DataSource = dsource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Bitstream Vera Sans Mono'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_ALFABETA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NRO_TROQUEL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_BARRASPRI'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOM_LARGO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_IVA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_TOTAL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_TOTALDESC'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTOS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAJEOS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAJECO1'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAJECO2'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTOSOS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTOCO1'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTOCO2'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_LABORATORIO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'can_stk'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'can_vale'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tamano'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Modificado'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GENTILEZA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RUBRO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTEGENT'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODAUTORIZACION'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'porcentaje'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Item'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APLUS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTEAPLUS'
          Width = 64
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 1
    Top = 517
    Width = 775
    Height = 31
    TabOrder = 2
    object Blimpiartodo: TBitBtn
      Left = 3
      Top = 1
      Width = 132
      Height = 27
      Caption = 'Limpiar (F2)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
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
      TabOrder = 0
      OnClick = BlimpiartodoClick
    end
    object bbuscar: TBitBtn
      Left = 134
      Top = 1
      Width = 131
      Height = 27
      Caption = 'Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF4D74AB234179C5ABA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF4173AF008EEC009AF41F4B80FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF2F6EB22BA7
        F516C0FF00A0F3568BC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFFFF2974BB68C4F86BD4FF279CE66696C8FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D8FD5A4E3FEB5EEFF4CAA
        E7669DD2FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEA188898A6A6A93736E866567B0
        9595BAA8B1359EE8BDF5FF77C4EF63A1DAFFFFFFFFFFFFFFFFFFFFFFFFD7CDCD
        7E5857DFD3CBFFFFF7FFFFE7FFFEDBD6BB9E90584D817B8E1794E46BB5E9FFFF
        FFFFFFFFFFFFFFFFFFFFEDE9E9886565FFFFFFFFFFFFFDF8E8FAF2DCF8EDCFFF
        F1CFF6DEBA9F5945C0C7D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA38889F6EFEA
        FFFFFFFEFBF5FBF7E8F9F4DAF5EBCCE6CEACF3DAB8E2BD99AB8B8EFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF937674FFFFFFFDFBF1FCF8EEFAF3E1FCF5E3F7F0D7F0
        DFC1E7C9A9F0D1ABA87E75F8F6F6FFFFFFFFFFFFFFFFFFFFFFFF997D7AFFFFFC
        F9F2E1FAF3DEFAF7E5FAF1DCF1DFC0EDD9BAECD8B9EDCAA5AF8679EDE8E9FFFF
        FFFFFFFFFFFFFFFFFFFF9C807BFFFFEBF9EED5FAF1D7F9F2DAF2E3C6FEFBF9FF
        FFF0EFDFC0E9C69EB0857BF5F2F3FFFFFFFFFFFFFFFFFFFFFFFFAF9596F7EAC8
        F9EBCCEFDCBEF4E4C7F0E1C5FDFCECFAF5DDEFDCBCDFB087B59A9AFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFDED4D7BA998CFDECC4EDD4B0E5CAA8EFDBBFF2E3C4F2
        DEBCEABF93BB8E7DE7DFE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEBFC5
        BE9A8DE6C7A5EFCBA3ECC8A2E8BE94DCAA86BE9585DFD6D7FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E4E6C9B3B4B99C93C3A097BF9F96CC
        B9B7F1EEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      TabOrder = 1
      OnClick = bbuscarClick
    end
    object binsertar: TBitBtn
      Left = 264
      Top = 1
      Width = 131
      Height = 27
      Caption = 'Insertar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
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
      TabOrder = 2
      OnClick = binsertarClick
    end
  end
  object odialog: TOpenDialog
    Filter = 'xml|*.xml'
    Left = 585
    Top = 18
  end
  object dsource: TDataSource
    DataSet = cdsdetalle
    Left = 648
    Top = 72
  end
  object cdsdetalle: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 384
    Top = 75
    object cdsdetalleCOD_ALFABETA: TStringField
      FieldName = 'COD_ALFABETA'
    end
    object cdsdetalleNRO_TROQUEL: TStringField
      FieldName = 'NRO_TROQUEL'
    end
    object cdsdetalleVALE: TStringField
      FieldName = 'VALE'
    end
    object cdsdetalleCOD_BARRASPRI: TStringField
      FieldName = 'COD_BARRASPRI'
    end
    object cdsdetalleNOM_LARGO: TStringField
      DisplayWidth = 40
      FieldName = 'NOM_LARGO'
      Size = 40
    end
    object cdsdetalleCOD_IVA: TStringField
      FieldName = 'COD_IVA'
    end
    object cdsdetallePRECIO: TCurrencyField
      FieldName = 'PRECIO'
    end
    object cdsdetalleCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object cdsdetallePRECIO_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'PRECIO_TOTAL'
    end
    object cdsdetallePRECIO_TOTALDESC: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'PRECIO_TOTALDESC'
    end
    object cdsdetalleDESCUENTOS: TCurrencyField
      DisplayWidth = 2
      FieldKind = fkInternalCalc
      FieldName = 'DESCUENTOS'
    end
    object cdsdetallePORCENTAJEOS: TFloatField
      FieldName = 'PORCENTAJEOS'
      Precision = 3
    end
    object cdsdetallePORCENTAJECO1: TFloatField
      FieldName = 'PORCENTAJECO1'
    end
    object cdsdetallePORCENTAJECO2: TFloatField
      FieldName = 'PORCENTAJECO2'
    end
    object cdsdetalleDESCUENTOSOS: TCurrencyField
      DisplayWidth = 10
      FieldName = 'DESCUENTOSOS'
    end
    object cdsdetalleDESCUENTOCO1: TCurrencyField
      DisplayWidth = 10
      FieldName = 'DESCUENTOCO1'
    end
    object cdsdetalleDESCUENTOCO2: TCurrencyField
      DisplayWidth = 10
      FieldName = 'DESCUENTOCO2'
    end
    object cdsdetalleCOD_LABORATORIO: TStringField
      DisplayWidth = 5
      FieldName = 'COD_LABORATORIO'
      Size = 5
    end
    object cdsdetallecan_stk: TIntegerField
      FieldName = 'can_stk'
    end
    object cdsdetalletamano: TIntegerField
      FieldName = 'tamano'
    end
    object cdsdetalleModificado: TBooleanField
      FieldName = 'Modificado'
    end
    object cdsdetalleGENTILEZA: TIntegerField
      FieldName = 'GENTILEZA'
    end
    object cdsdetalleRUBRO: TStringField
      FieldName = 'RUBRO'
    end
    object cdsdetalleIMPORTEGENT: TFloatField
      FieldName = 'IMPORTEGENT'
    end
    object cdsdetalleCODAUTORIZACION: TStringField
      FieldName = 'CODAUTORIZACION'
    end
    object cdsdetalleporcentaje: TFloatField
      DisplayWidth = 2
      FieldName = 'porcentaje'
      Precision = 3
    end
    object cdsdetalleItem: TIntegerField
      FieldName = 'Item'
    end
    object cdsdetallecan_vale: TStringField
      FieldName = 'can_vale'
    end
    object cdsdetalleAPLUS: TFloatField
      FieldName = 'APLUS'
    end
    object cdsdetalleIMPORTEAPLUS: TFloatField
      FieldName = 'IMPORTEAPLUS'
    end
    object cdsdetalleimportetotal: TAggregateField
      FieldName = 'importetotal'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(precio_total)'
    end
    object cdsdetalledescuentos_total: TAggregateField
      FieldName = 'descuentos_total'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentos)'
    end
    object cdsdetallenetoxcobrar: TAggregateField
      FieldName = 'netoxcobrar'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(precio_totaldesc)'
    end
    object cdsdetalleDESCUENTOTOTALOS: TAggregateField
      FieldName = 'DESCUENTOTOTALOS'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentosos)'
    end
    object cdsdetalleDESCUENTOTOTALCO1: TAggregateField
      FieldName = 'DESCUENTOTOTALCO1'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentoco1)'
    end
    object cdsdetalleDESCUENTOTOTALCO2: TAggregateField
      FieldName = 'DESCUENTOTOTALCO2'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentoco2)'
    end
    object cdsdetalleTOTALGENTILEZA: TAggregateField
      FieldName = 'TOTALGENTILEZA'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(IMPORTEGENT)'
    end
  end
end

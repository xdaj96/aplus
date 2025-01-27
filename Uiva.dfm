object fiva: Tfiva
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Reporte de iva'
  ClientHeight = 471
  ClientWidth = 925
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
  TextHeight = 13
  object Label3: TLabel
    Left = 448
    Top = 240
    Width = 42
    Height = 13
    Caption = 'Label3'
  end
  object Panel2: TPanel
    Left = 2
    Top = 194
    Width = 920
    Height = 278
    TabOrder = 0
    object Label4: TLabel
      Left = 274
      Top = 240
      Width = 84
      Height = 13
      Caption = 'Neto Gravado'
    end
    object Label5: TLabel
      Left = 396
      Top = 240
      Width = 21
      Height = 13
      Caption = 'Iva'
    end
    object Label7: TLabel
      Left = 518
      Top = 240
      Width = 70
      Height = 13
      Caption = 'No Gravado'
    end
    object Label8: TLabel
      Left = 641
      Top = 240
      Width = 105
      Height = 13
      Caption = 'Percepcion IIBB'
    end
    object Label9: TLabel
      Left = 760
      Top = 240
      Width = 35
      Height = 13
      Caption = 'Total'
    end
    object giva: TDBGrid
      Left = 11
      Top = 7
      Width = 903
      Height = 233
      DataSource = dmFacturador.dsreporteiva
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Bitstream Vera Sans Mono'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'fecha'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'comprobante'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descripcion'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cuit'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'netogravado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tasa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'importeiva'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nogravado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'percepcionibb'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total'
          Visible = True
        end>
    end
    object Bcancelar: TBitBtn
      Left = 11
      Top = 251
      Width = 125
      Height = 25
      Cancel = True
      Caption = 'Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 1
    end
    object Blimpiartodo: TBitBtn
      Left = 136
      Top = 251
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
      TabOrder = 2
      OnClick = BlimpiartodoClick
    end
    object enetogravado: TEdit
      Left = 272
      Top = 255
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object eiva: TEdit
      Left = 394
      Top = 255
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object enogravado: TEdit
      Left = 516
      Top = 255
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object Epercepcion: TEdit
      Left = 638
      Top = 255
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object etotal: TEdit
      Left = 760
      Top = 255
      Width = 121
      Height = 21
      TabOrder = 7
    end
  end
  object PageControl1: TPageControl
    Left = 2
    Top = -2
    Width = 922
    Height = 196
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Reporte iva'
      object Panel1: TPanel
        Left = -10
        Top = -13
        Width = 915
        Height = 176
        TabOrder = 0
        object Shape1: TShape
          Left = 2
          Top = 26
          Width = 903
          Height = 1
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clRed
        end
        object Label1: TLabel
          Left = 59
          Top = 37
          Width = 42
          Height = 13
          Caption = 'Desde:'
        end
        object Label2: TLabel
          Left = 299
          Top = 37
          Width = 42
          Height = 13
          Caption = 'Hasta:'
        end
        object Lrazonsocial: TLabel
          Left = 656
          Top = 33
          Width = 7
          Height = 13
        end
        object Ldireccion: TLabel
          Left = 656
          Top = 52
          Width = 7
          Height = 13
        end
        object LIIBB: TLabel
          Left = 656
          Top = 71
          Width = 7
          Height = 13
        end
        object Lcuit: TLabel
          Left = 656
          Top = 90
          Width = 7
          Height = 13
        end
        object dtdesde: TDateTimePicker
          Left = 107
          Top = 33
          Width = 138
          Height = 21
          Date = 42796.579175081020000000
          Time = 42796.579175081020000000
          TabOrder = 0
        end
        object dthasta: TDateTimePicker
          Left = 344
          Top = 33
          Width = 138
          Height = 21
          Date = 42796.579175081020000000
          Time = 42796.579175081020000000
          TabOrder = 1
        end
        object bbuscar: TBitBtn
          Left = 493
          Top = 32
          Width = 127
          Height = 25
          Caption = 'Buscar'
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
          TabOrder = 2
          OnClick = bbuscarClick
        end
        object Breporte: TBitBtn
          Left = 493
          Top = 56
          Width = 127
          Height = 25
          Caption = 'Reporte'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            916D37A7895BA68756A68756A68756A68756A68756A68756A68756A68756A585
            579D7B4C987545FFFFFFFFFFFFFFFFFFA98D62FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F3ECA48659FFFFFFFFFFFFFFFFFF
            B1946AFDFCFCB37955B57E5BB77F5DB77F5DB67E5BB37C5AB37C5CB0714FCAA2
            8CE8DDD1A58452FFFFFFFFFFFFFFFFFFB89E76FDFCFCFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDEDE7DDA58452FFFFFFFFFFFFFFFFFF
            BCA37AFDFCFCB47753B77954B77A57B77A57B77B58B77A58BA7B5AB5744ED1AB
            91E6D8CBA58452FFFFFFFFFFFFFFFFFFBBA37AFDFCFCFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEEDE7DDA58451FFFFFFFFFFFFFFFFFF
            BBA37AFDFCFCB67854B87A56B67956B77957BA7A5ABD8257BC825FBA7652CFA6
            8BE6D9CCA58453FFFFFFFFFFFFFFFFFFBAA37FFDFCFCFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FBF6EDE6DEA68553FFFFFFFFFFFFFFFFFF
            BCAA8CFDFCFCB87A54B47B52B97B5AB77C5BB97C5AB77B5BB1764DA4653FC29C
            83DECCBCA68553FFFFFFFFFFFFFFFFFFC5B295FDFCFCFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFEFFFFECEDE3D9CEB9A58553FFFFFFFFFFFFFFFFFF
            CCBA9DFDFCFCB47954B77855B77A5AB77D55B67953B47851A76A44984F27B386
            68BDA380A48452FFFFFFFFFFFFFFFFFFCEBDA3FDFCFCFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFCEBB9EE8DFD5DDD2BEB69C72A98857FFFFFFFFFFFFFFFFFF
            CFBDA6FDFCFCA86136B36F48AD6F43A8663DAA633E904F2BCFBDA0FFFFFFCDB9
            9DBAA078F2EDE6FFFFFFFFFFFFFFFFFFD0C0A7FDFCFCFCFEFFFBF7F3F3EBE5E6
            DFD6E2D4C4CDB798BEAC8AD1C1A9B69B6EF9F7F3FFFFFFFFFFFFFFFFFFFFFFFF
            D1C3ABFDFCFBFEFEFEF6F2EFEDE4DADED5C4D6C4ADC0A984A38652BAA078FCFB
            F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBBB9FD1C2A9D1C0A7CDBCA2CBBA9EC7
            B291C3AB86AD9364AF9367F9F7F3FFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 3
          OnClick = BreporteClick
        end
        object clsucursal: TCheckListBox
          Left = 11
          Top = 56
          Width = 471
          Height = 117
          Color = clWhite
          Columns = 2
          ItemHeight = 13
          TabOrder = 4
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Declaracion jurada ventas'
      ImageIndex = 1
      object Panel5: TPanel
        Left = 0
        Top = 1
        Width = 910
        Height = 165
        ParentBackground = False
        TabOrder = 0
        object Shape2: TShape
          Left = 7
          Top = 25
          Width = 314
          Height = 1
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clRed
        end
        object Label6: TLabel
          Left = 7
          Top = 6
          Width = 84
          Height = 13
          Caption = 'Alicuota: 21'
        end
        object Label10: TLabel
          Left = 10
          Top = 32
          Width = 154
          Height = 13
          Caption = 'Responsable inscripto:'
        end
        object Label11: TLabel
          Left = 151
          Top = 54
          Width = 84
          Height = 13
          Caption = 'Neto grabado'
        end
        object Label12: TLabel
          Left = 151
          Top = 76
          Width = 21
          Height = 13
          Caption = 'Iva'
        end
        object Label13: TLabel
          Left = 10
          Top = 96
          Width = 140
          Height = 13
          Caption = 'Consumidores finales'
        end
        object Label14: TLabel
          Left = 151
          Top = 140
          Width = 21
          Height = 13
          Caption = 'Iva'
        end
        object Label15: TLabel
          Left = 151
          Top = 118
          Width = 84
          Height = 13
          Caption = 'Neto grabado'
        end
        object Label16: TLabel
          Left = 322
          Top = 32
          Width = 154
          Height = 13
          Caption = 'Responsable inscripto:'
        end
        object Label17: TLabel
          Left = 463
          Top = 54
          Width = 84
          Height = 13
          Caption = 'Neto grabado'
        end
        object Label19: TLabel
          Left = 322
          Top = 96
          Width = 140
          Height = 13
          Caption = 'Consumidores finales'
        end
        object Label21: TLabel
          Left = 463
          Top = 118
          Width = 84
          Height = 13
          Caption = 'Neto grabado'
        end
        object Label22: TLabel
          Left = 319
          Top = 6
          Width = 77
          Height = 13
          Caption = 'Alicuota: 0'
        end
        object Shape3: TShape
          Left = 319
          Top = 25
          Width = 314
          Height = 1
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clRed
        end
        object rineto21: TEdit
          Left = 10
          Top = 50
          Width = 135
          Height = 21
          TabOrder = 0
        end
        object riiva21: TEdit
          Left = 10
          Top = 73
          Width = 135
          Height = 21
          TabOrder = 1
        end
        object coneto21: TEdit
          Left = 10
          Top = 114
          Width = 135
          Height = 21
          TabOrder = 2
        end
        object coiva21: TEdit
          Left = 10
          Top = 137
          Width = 135
          Height = 21
          TabOrder = 3
        end
        object rineto0: TEdit
          Left = 322
          Top = 50
          Width = 135
          Height = 21
          TabOrder = 4
        end
        object coneto0: TEdit
          Left = 322
          Top = 114
          Width = 135
          Height = 21
          TabOrder = 5
        end
      end
    end
  end
end

object fConsultaReceta: TfConsultaReceta
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Consulta de recetas por afiliado'
  ClientHeight = 377
  ClientWidth = 517
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
  object Label1: TLabel
    Left = 11
    Top = 13
    Width = 75
    Height = 14
    Caption = 'Nro. de afiliado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 4
    Top = 8
    Width = 509
    Height = 22
  end
  object lafiliado: TLabel
    Left = 134
    Top = 13
    Width = 3
    Height = 14
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 157
    Width = 97
    Height = 13
    Caption = 'Detalle de la receta:'
  end
  object Label3: TLabel
    Left = 8
    Top = 36
    Width = 43
    Height = 13
    Caption = 'Recetas:'
  end
  object Bevel2: TBevel
    Left = -8
    Top = 356
    Width = 521
    Height = 22
  end
  object Label4: TLabel
    Left = 8
    Top = 360
    Width = 38
    Height = 13
    Caption = 'Tiempo:'
  end
  object LSegundos: TLabel
    Left = 48
    Top = 360
    Width = 3
    Height = 13
  end
  object Bcancelar: TBitBtn
    Left = 266
    Top = 325
    Width = 97
    Height = 25
    Cancel = True
    Caption = 'Cerrar'
    Enabled = False
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
    TabOrder = 0
    OnClick = BcancelarClick
  end
  object grillahistorial: TDBGrid
    Left = 4
    Top = 52
    Width = 509
    Height = 101
    DataSource = DSHISTORIAL
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = grillahistorialKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prescriptor'
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nro_receta'
        Width = 151
        Visible = True
      end>
  end
  object Memo1: TMemo
    Left = 8
    Top = 176
    Width = 501
    Height = 143
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 107
    Top = 325
    Width = 159
    Height = 25
    Cancel = True
    Caption = 'Bajar receta'
    Enabled = False
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
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object btnListarRecetas: TBitBtn
    Left = 416
    Top = 294
    Width = 93
    Height = 25
    Caption = 'Listar Recetas'
    TabOrder = 4
    Visible = False
    OnClick = btnListarRecetasClick
  end
  object btnCargarItems: TButton
    Left = 412
    Top = 325
    Width = 97
    Height = 25
    Caption = 'CargarItems'
    TabOrder = 5
    Visible = False
    OnClick = btnCargarItemsClick
  end
  object cdshistorial: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 16
    object cdshistorialprescriptor: TStringField
      FieldName = 'prescriptor'
    end
    object cdshistorialnro_receta: TStringField
      FieldName = 'nro_receta'
    end
    object cdshistorialfecha: TDateField
      FieldName = 'fecha'
    end
  end
  object DSHISTORIAL: TDataSource
    DataSet = cdshistorial
    OnDataChange = DSHISTORIALDataChange
    Left = 456
    Top = 104
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 424
    Top = 320
  end
  object CDSDetaReceta: TClientDataSet
    PersistDataPacket.Data = {
      520000009619E0BD01000000180000000200000000000300000052000A6E726F
      5F7265636574610100490000000100055749445448020002001400046974656D
      01004900000001000557494454480200020096000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 160
    object StringField3: TStringField
      FieldName = 'nro_receta'
    end
    object CDSDetaRecetaitem: TStringField
      FieldName = 'item'
      Size = 150
    end
  end
end

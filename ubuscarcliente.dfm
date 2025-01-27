object fcliente: Tfcliente
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Busqueda cliente'
  ClientHeight = 358
  ClientWidth = 644
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
  object DBGrid1: TDBGrid
    Left = 2
    Top = 128
    Width = 639
    Height = 200
    DataSource = dscliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
  end
  object RadioGroup1: TRadioGroup
    Left = 2
    Top = 9
    Width = 421
    Height = 42
    Caption = 'Criterio de busqueda'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Buscar por descripcion'
      'Buscar por Cuit')
    ParentFont = False
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 2
    Top = 51
    Width = 421
    Height = 71
    Caption = 'Buscar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object ebuscar: TEdit
      Left = 17
      Top = 25
      Width = 251
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyDown = ebuscarKeyDown
    end
    object bbuscar: TButton
      Left = 272
      Top = 23
      Width = 81
      Height = 27
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = bbuscarClick
    end
  end
  object Bcancelar: TBitBtn
    Left = 2
    Top = 331
    Width = 132
    Height = 27
    Cancel = True
    Caption = 'Cerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
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
    TabOrder = 3
  end
  object dscliente: TDataSource
    DataSet = dmFacturador.qcliente
    Left = 568
    Top = 16
  end
end

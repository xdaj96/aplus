object fliquidacion: Tfliquidacion
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Liquidacion obras s.'
  ClientHeight = 569
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 2
    Top = 4
    Width = 505
    Height = 560
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 11
      Width = 145
      Height = 13
      Caption = 'Grupo de planes Obra sociales'
    end
    object combotipo: TComboBox
      Left = 10
      Top = 30
      Width = 351
      Height = 23
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnSelect = combotipoSelect
    end
    object egrupo: TEdit
      Left = 367
      Top = 31
      Width = 66
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object panel: TPanel
      Left = -2
      Top = 59
      Width = 505
      Height = 502
      Caption = 'panel'
      TabOrder = 2
      object Label2: TLabel
        Left = 10
        Top = 298
        Width = 62
        Height = 13
        Caption = 'Presentacion'
      end
      object Label3: TLabel
        Left = 337
        Top = 298
        Width = 56
        Height = 13
        Caption = 'Fecha limite'
      end
      object Label7: TLabel
        Left = 289
        Top = 346
        Width = 113
        Height = 13
        Caption = 'Planes seleccionados:   '
      end
      object lcount: TLabel
        Left = 394
        Top = 346
        Width = 3
        Height = 13
      end
      object DBGrid1: TDBGrid
        Left = 10
        Top = 8
        Width = 487
        Height = 281
        DataSource = dmFacturador.DSGRUPOS
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PLAN'
            Width = 64
            Visible = True
          end>
      end
      object bpresentacion: TButton
        Left = 276
        Top = 312
        Width = 58
        Height = 25
        Caption = 'Nueva'
        Enabled = False
        TabOrder = 1
        OnClick = bpresentacionClick
      end
      object datefechalimite: TDateTimePicker
        Left = 336
        Top = 313
        Width = 161
        Height = 21
        Date = 44166.462536817130000000
        Time = 44166.462536817130000000
        TabOrder = 2
      end
      object Button3: TButton
        Left = 10
        Top = 342
        Width = 135
        Height = 25
        Caption = 'Liquidar movimientos'
        TabOrder = 3
        OnClick = Button3Click
      end
      object panelpresentacion: TPanel
        Left = 10
        Top = 373
        Width = 487
        Height = 118
        TabOrder = 4
        Visible = False
        object Label4: TLabel
          Left = 55
          Top = 9
          Width = 62
          Height = 13
          Caption = 'Presentacion'
        end
        object Label5: TLabel
          Left = 40
          Top = 36
          Width = 77
          Height = 13
          Caption = 'N'#176' Presentacion'
        end
        object Label6: TLabel
          Left = 23
          Top = 64
          Width = 94
          Height = 13
          Caption = 'Fecha Presentacion'
        end
        object enumeropresentacion: TEdit
          Left = 144
          Top = 33
          Width = 180
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object enombrepresentacion: TEdit
          Left = 144
          Top = 6
          Width = 180
          Height = 21
          Enabled = False
          TabOrder = 1
        end
        object edatepresentacion: TDateTimePicker
          Left = 144
          Top = 60
          Width = 180
          Height = 21
          Date = 44166.462536817130000000
          Time = 44166.462536817130000000
          Enabled = False
          TabOrder = 2
        end
        object Button1: TButton
          Left = 4
          Top = 87
          Width = 75
          Height = 25
          Caption = 'Grabar'
          TabOrder = 3
          OnClick = Button1Click
        end
        object BitBtn1: TBitBtn
          Left = 80
          Top = 87
          Width = 91
          Height = 25
          Cancel = True
          Caption = 'Cancelar'
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
          TabOrder = 4
          OnClick = BitBtn1Click
        end
      end
    end
    object combopresentacion: TComboBox
      Left = 10
      Top = 372
      Width = 263
      Height = 23
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 565
    Width = 511
    Height = 4
    Panels = <>
  end
end

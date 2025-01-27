object FrmReporteVtaPorCoseguro: TFrmReporteVtaPorCoseguro
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Totales de venta por coseguro'
  ClientHeight = 476
  ClientWidth = 703
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 24
    Top = 45
    Width = 58
    Height = 14
    Caption = 'Sucursal:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 500
    Width = 58
    Height = 14
    Caption = 'Sucursal:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 336
    Top = 232
    Width = 31
    Height = 13
    Caption = 'Label5'
  end
  object Label6: TLabel
    Left = 8
    Top = 405
    Width = 82
    Height = 16
    Caption = 'Total ticket:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 131
    Top = 405
    Width = 63
    Height = 16
    Caption = 'Imp COS:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 235
    Top = 405
    Width = 73
    Height = 16
    Caption = 'Gentilezas:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 336
    Top = 405
    Width = 132
    Height = 16
    Caption = 'Total Imp. Afectado'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lblTotalTicket: TLabel
    Left = 10
    Top = 427
    Width = 5
    Height = 16
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lblTotalCOS: TLabel
    Left = 131
    Top = 427
    Width = 5
    Height = 16
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lblTotalGentileza: TLabel
    Left = 235
    Top = 427
    Width = 5
    Height = 16
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lblTotalAfectado: TLabel
    Left = 336
    Top = 427
    Width = 5
    Height = 16
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object btnSalir: TButton
    Left = 596
    Top = 420
    Width = 97
    Height = 33
    Caption = 'Salir'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 480
    Top = 420
    Width = 110
    Height = 33
    Caption = 'Imprimir'
    TabOrder = 1
  end
  object TabControl3: TTabControl
    Left = 0
    Top = 8
    Width = 685
    Height = 138
    TabOrder = 3
    Tabs.Strings = (
      'Datos de Facturaci'#243'n')
    TabIndex = 0
    object lblCodCos: TLabel
      Left = 248
      Top = 37
      Width = 66
      Height = 14
      Caption = 'Coseguro:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblNombCos: TLabel
      Left = 413
      Top = 37
      Width = 100
      Height = 14
      Caption = 'Descuento 20%'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 3
      Top = 70
      Width = 88
      Height = 13
      Caption = 'Periodo Facturado'
    end
    object Shape1: TShape
      Left = 0
      Top = 89
      Width = 505
      Height = 1
      Brush.Color = clBlue
      Brush.Style = bsBDiagonal
      Pen.Color = clRed
    end
    object lblDesde: TLabel
      Left = 20
      Top = 105
      Width = 54
      Height = 14
      Caption = 'F.Desde:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblHasta: TLabel
      Left = 303
      Top = 105
      Width = 51
      Height = 14
      Caption = 'F.Hasta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 37
      Width = 58
      Height = 14
      Caption = 'Sucursal:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object btnVerReporte: TButton
      Left = 528
      Top = 51
      Width = 121
      Height = 54
      Caption = 'Ver Reporte'
      TabOrder = 3
      OnClick = btnVerReporteClick
    end
    object DTPDesde: TDateTimePicker
      Left = 80
      Top = 96
      Width = 177
      Height = 21
      Date = 45294.466704097220000000
      Time = 45294.466704097220000000
      TabOrder = 1
    end
    object DTPHasta: TDateTimePicker
      Left = 360
      Top = 101
      Width = 145
      Height = 21
      Date = 45294.466704097220000000
      Time = 45294.466704097220000000
      TabOrder = 2
    end
    object CMBSucursal: TDBLookupComboBox
      Left = 80
      Top = 35
      Width = 160
      Height = 21
      KeyField = 'nro_sucursal'
      ListField = 'NOM_SUCURSAL'
      ListSource = DSSucursal
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 152
    Width = 692
    Height = 240
    DataSource = DSRCoseguro
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'fec_comprob'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nro_sucursal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nom_obrasocial'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'imp_ticket'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'imp_afectado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'imp_cargoos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'imp_gentileza'
        Visible = True
      end>
  end
  object EcodCos: TEdit
    Left = 320
    Top = 43
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
    TabOrder = 2
    StyleElements = [seFont, seBorder]
    OnEnter = ECodCosEnter
    OnExit = ECodCosExit
  end
  object DSRCoseguro: TDataSource
    DataSet = CDSRCos
    Left = 592
    Top = 288
  end
  object CDSRCos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 656
    Top = 288
    object CDSRCosfec_comprob: TStringField
      DisplayLabel = 'Fecha'
      FieldName = 'fec_comprob'
    end
    object CDSRCosimp_ticket: TFloatField
      FieldName = 'imp_ticket'
    end
    object CDSRCosimp_cargoos: TFloatField
      FieldName = 'imp_cargoos'
    end
    object CDSRCosimp_afectado: TFloatField
      FieldName = 'imp_afectado'
    end
    object CDSRCosimp_gentileza: TFloatField
      FieldName = 'imp_gentileza'
    end
    object CDSRCosnro_sucursal: TIntegerField
      FieldName = 'nro_sucursal'
    end
    object CDSRCosnom_obrasocial: TStringField
      FieldName = 'nom_obrasocial'
      Size = 50
    end
  end
  object CDSSucursal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 400
    object CDSSucursalnro_sucursal: TIntegerField
      FieldName = 'nro_sucursal'
    end
    object CDSSucursalNOM_SUCURSAL: TStringField
      FieldName = 'NOM_SUCURSAL'
      Size = 50
    end
  end
  object DSSucursal: TDataSource
    DataSet = CDSSucursal
    Left = 256
    Top = 424
  end
end

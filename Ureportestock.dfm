object Freportestock: TFreportestock
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Reporte Stock'
  ClientHeight = 539
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 1
    Top = 6
    Width = 721
    Height = 92
    TabOrder = 0
    object Label2: TLabel
      Left = 10
      Top = 16
      Width = 41
      Height = 14
      Caption = 'Alfabeta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 202
      Top = 16
      Width = 36
      Height = 14
      Caption = 'Troquel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 445
      Top = 17
      Width = 33
      Height = 14
      Caption = 'Barras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 9
      Top = 43
      Width = 37
      Height = 14
      Caption = 'Nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 459
      Top = 43
      Width = 56
      Height = 14
      Caption = 'Codigo labo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 624
      Top = 6
      Width = 81
      Height = 25
      Caption = 'Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 624
      Top = 31
      Width = 81
      Height = 25
      Caption = 'Limpiar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object Edbarras: TEdit
      Left = 496
      Top = 16
      Width = 121
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtroquel: TEdit
      Left = 256
      Top = 16
      Width = 121
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edalfabeta: TEdit
      Left = 72
      Top = 16
      Width = 121
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object ednombre: TEdit
      Left = 72
      Top = 41
      Width = 361
      Height = 22
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edlabo: TEdit
      Left = 544
      Top = 41
      Width = 73
      Height = 22
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object Button1: TButton
      Left = 624
      Top = 57
      Width = 81
      Height = 25
      Caption = 'Reporte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object gstock: TDBGrid
    Left = 1
    Top = 100
    Width = 718
    Height = 431
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = gstockTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NOM_LARGO'
        Title.Caption = 'Descripcion'
        Width = 249
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_BARRASPRI'
        Title.Caption = 'Codigo de barras'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAN_STK'
        Title.Caption = 'Stock'
        Width = 71
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 536
    Top = 328
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 264
    object ClientDataSet1COD_BARRASPRI: TStringField
      FieldName = 'COD_BARRASPRI'
      Size = 30
    end
    object ClientDataSet1NOM_LARGO: TStringField
      FieldName = 'NOM_LARGO'
      Size = 50
    end
    object ClientDataSet1CAN_STK: TIntegerField
      FieldName = 'CAN_STK'
    end
  end
  object IBQuery1: TIBQuery
    Database = dmFacturador.databasefire
    Transaction = dmFacturador.transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 536
    Top = 200
  end
end

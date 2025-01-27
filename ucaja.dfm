object fcaja: Tfcaja
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cambio de caja'
  ClientHeight = 305
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 4
    Top = 11
    Width = 98
    Height = 13
    Caption = 'Cambio de caja'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
  object DBGrid1: TDBGrid
    Left = 2
    Top = 35
    Width = 449
    Height = 268
    DataSource = dcaja
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
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
    Columns = <
      item
        Expanded = False
        FieldName = 'IDE_PUESTO'
        Title.Caption = 'PUESTO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRO_CAJA'
        Title.Caption = 'CAJA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Bitstream Vera Sans Mono'
        Title.Font.Style = []
        Width = 140
        Visible = True
      end>
  end
  object basecfg: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=nmpnet'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    ServerType = 'IBServer'
    SQLDialect = 1
    Left = 40
    Top = 240
  end
  object ibcaja: TIBQuery
    Database = basecfg
    Transaction = IBTcaja
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select ide_puesto, nro_caja from msmapuesto')
    Left = 40
    Top = 200
    object ibcajaIDE_PUESTO: TIBStringField
      DisplayWidth = 10
      FieldName = 'IDE_PUESTO'
      Origin = 'MSMAPUESTO.IDE_PUESTO'
      Required = True
      Size = 25
    end
    object ibcajaNRO_CAJA: TSmallintField
      DisplayWidth = 25
      FieldName = 'NRO_CAJA'
      Origin = 'MSMAPUESTO.NRO_CAJA'
    end
  end
  object dcaja: TDataSource
    DataSet = ibcaja
    Left = 40
    Top = 168
  end
  object IBTcaja: TIBTransaction
    DefaultDatabase = basecfg
    Left = 40
    Top = 128
  end
  object base: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=nmpnet')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 120
    Top = 240
  end
  object ibcajanombre: TIBQuery
    Database = base
    Transaction = ibtcajanombre
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT'
      'DISTINCT c.NRO_CAJA,'
      'a.des_caja,'
      'MAX(FEC_OPERACIONES)'
      'FROM cjmaapertura c, cjmacaja a'
      'WHERE'
      'c.nro_caja=a.nro_caja'
      'and c.nro_sucursal=a.nro_sucursal'
      'and MAR_CAJA='#39'S'#39
      'GROUP BY 1,2')
    Left = 120
    Top = 192
    object ibcajanombreNRO_CAJA: TSmallintField
      DisplayWidth = 5
      FieldName = 'NRO_CAJA'
      Origin = '"CJMAAPERTURA"."NRO_CAJA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ibcajanombreDES_CAJA: TIBStringField
      DisplayWidth = 20
      FieldName = 'DES_CAJA'
      Origin = '"CJMACAJA"."DES_CAJA"'
      Size = 50
    end
    object ibcajanombreMAX: TDateTimeField
      FieldName = 'MAX'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object Dcajanombre: TDataSource
    DataSet = ibcajanombre
    Left = 120
    Top = 144
  end
  object ibtcajanombre: TIBTransaction
    DefaultDatabase = base
    Left = 120
    Top = 104
  end
end

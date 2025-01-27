object fbuscarco1: Tfbuscarco1
  Left = 0
  Top = 0
  Caption = 'Buscar'
  ClientHeight = 251
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object EBUSCAR: TEdit
    Left = 3
    Top = 4
    Width = 182
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 191
    Top = -3
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object gbuscaros: TDBGrid
    Left = 2
    Top = 28
    Width = 500
    Height = 195
    DataSource = DataSource2
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gbuscarosDblClick
  end
  object BitBtn1: TBitBtn
    Left = 2
    Top = 225
    Width = 75
    Height = 25
    Caption = '&Cerrar'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase2
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 120
    Top = 152
  end
  object IBDatabase2: TIBDatabase
    ServerType = 'IBServer'
    Left = 152
    Top = 152
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = IBDatabase2
    Left = 184
    Top = 152
  end
  object DataSource2: TDataSource
    DataSet = IBQuery2
    Left = 216
    Top = 152
  end
end

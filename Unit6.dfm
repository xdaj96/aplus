object FOS: TFOS
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Buscar'
  ClientHeight = 277
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ebuscaros: TEdit
    Left = 3
    Top = 16
    Width = 179
    Height = 21
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 45
    Width = 508
    Height = 202
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object BitBtn1: TBitBtn
    Left = 187
    Top = 14
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object bcancelar: TBitBtn
    Left = 3
    Top = 250
    Width = 75
    Height = 25
    Caption = '&Cerrar'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
    OnClick = bcancelarClick
  end
  object QBUSCAROS: TIBQuery
    Database = BASEOS
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 40
    Top = 64
  end
  object BASEOS: TIBDatabase
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 32
    Top = 200
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = BASEOS
    Left = 80
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = QBUSCAROS
    Left = 88
    Top = 64
  end
end

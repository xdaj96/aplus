object FBUSCAROS: TFBUSCAROS
  Left = 0
  Top = 0
  Caption = 'Buscar'
  ClientHeight = 257
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbuscaros: TDBGrid
    Left = 2
    Top = 28
    Width = 500
    Height = 195
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object EBUSCAR: TEdit
    Left = 3
    Top = 4
    Width = 182
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 186
    Top = 2
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 120
    Top = 152
  end
  object IBDatabase1: TIBDatabase
    ServerType = 'IBServer'
    Left = 152
    Top = 152
  end
  object IBTransaction1: TIBTransaction
    Left = 184
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 216
    Top = 152
  end
end

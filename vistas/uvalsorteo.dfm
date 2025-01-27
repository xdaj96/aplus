object FrmValSorteo: TFrmValSorteo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Validaci'#243'n de sorteos'
  ClientHeight = 369
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 15
    Width = 160
    Height = 15
    Caption = 'Esperando Respuesta:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 188
    Top = 15
    Width = 64
    Height = 15
    Caption = 'Segundos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Lsegundos: TLabel
    Left = 174
    Top = 15
    Width = 8
    Height = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    StyleElements = [seClient, seBorder]
  end
  object mmsjvalida: TMemo
    Left = 0
    Top = 36
    Width = 633
    Height = 334
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -13
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    StyleElements = [seFont, seBorder]
    OnKeyPress = mmsjvalidaKeyPress
  end
  object btnValidar: TBitBtn
    Left = 360
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Validar'
    TabOrder = 1
    OnClick = btnValidarClick
  end
  object Tvalidacion: TTimer
    Enabled = False
    Left = 544
    Top = 8
  end
  object idhttp: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 366
    Top = 8
  end
end

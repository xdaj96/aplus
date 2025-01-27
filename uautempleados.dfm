object fautorizacion: Tfautorizacion
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Autorizacion'
  ClientHeight = 451
  ClientWidth = 862
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
  object Label1: TLabel
    Left = 8
    Top = 3
    Width = 176
    Height = 15
    Caption = 'Autorizacion empleados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object mmsjvalida: TMemo
    Left = 0
    Top = 24
    Width = 861
    Height = 426
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
    OnKeyDown = mmsjvalidaKeyDown
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
    Left = 822
    Top = 408
  end
end

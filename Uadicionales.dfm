object fadicionales: Tfadicionales
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Datos adicionales'
  ClientHeight = 453
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 1
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
    Left = 203
    Top = 1
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
    Left = 176
    Top = 1
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
    Top = 17
    Width = 861
    Height = 436
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
  object Tvalidacion: TTimer
    Enabled = False
    OnTimer = TvalidacionTimer
    Left = 799
    Top = 225
  end
  object XMLVAL: TXMLDocument
    Left = 799
    Top = 275
  end
end

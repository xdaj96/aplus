object Fvalida: TFvalida
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Validacion'
  ClientHeight = 450
  ClientWidth = 860
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
    Left = 5
    Top = 7
    Width = 132
    Height = 16
    Caption = 'Esperando Respuesta:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 200
    Top = 7
    Width = 58
    Height = 16
    Caption = 'Segundos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Lsegundos: TLabel
    Left = 173
    Top = 7
    Width = 4
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    StyleElements = [seClient, seBorder]
  end
  object mmsjvalida: TMemo
    Left = 5
    Top = 28
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
  object XMLVAL: TXMLDocument
    Left = 700
    Top = 10
  end
  object Tvalidacion: TTimer
    Enabled = False
    OnTimer = TvalidacionTimer
    Left = 696
    Top = 56
  end
end

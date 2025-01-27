object valcancel: Tvalcancel
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cancelacion'
  ClientHeight = 451
  ClientWidth = 861
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
    Top = 8
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
    Top = 8
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
    Top = 8
    Width = 8
    Height = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
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
  object Tvalidacion: TTimer
    Enabled = False
    OnTimer = TvalidacionTimer
    Left = 739
    Top = 56
  end
  object XMLVAL: TXMLDocument
    Left = 739
    Top = 10
  end
end

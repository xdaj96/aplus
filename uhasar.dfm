object Fhasar: TFhasar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Herramienta de mantenimiento'
  ClientHeight = 265
  ClientWidth = 439
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
    Left = 89
    Top = 12
    Width = 21
    Height = 13
    Caption = 'Com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object HASAR1: THASAR
    Left = 403
    Top = 8
    Width = 32
    Height = 32
    OnImpresoraNoResponde = HASAR1ImpresoraNoResponde
    OnErrorImpresora = HASAR1ErrorImpresora
    OnErrorFiscal = HASAR1ErrorFiscal
    OnFaltaPapel = HASAR1FaltaPapel
    ControlData = {000300004F0300004F030000}
  end
  object bImprimirX: TButton
    Left = 85
    Top = 239
    Width = 84
    Height = 25
    Caption = 'IMPRIMIR X'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = bImprimirXClick
  end
  object bEstado: TButton
    Left = 3
    Top = 8
    Width = 84
    Height = 25
    Caption = 'ESTADO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = bEstadoClick
  end
  object Memo1: TMemo
    Left = 2
    Top = 37
    Width = 440
    Height = 194
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 3
  end
  object eCom: TEdit
    Left = 111
    Top = 10
    Width = 45
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = '1'
  end
  object bImprimirZ: TButton
    Left = 2
    Top = 239
    Width = 84
    Height = 25
    Caption = 'IMPRIMIR Z'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = bImprimirZClick
  end
  object bCambiarFyH: TButton
    Left = 168
    Top = 239
    Width = 84
    Height = 25
    Caption = 'Cambiar F/H'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = bCambiarFyHClick
  end
end

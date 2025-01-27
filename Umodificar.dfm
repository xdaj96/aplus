object Fmodificacion: TFmodificacion
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Clave Modificar'
  ClientHeight = 83
  ClientWidth = 185
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 8
    Top = 16
    Width = 169
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 8
    Top = 50
    Width = 85
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 93
    Top = 50
    Width = 84
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = Button2Click
  end
end

object fprogreso: Tfprogreso
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 32
  ClientWidth = 251
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  StyleElements = [seFont, seClient]
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 2
    Top = 2
    Width = 248
    Height = 28
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 75
    Top = 8
    Width = 104
    Height = 15
    Caption = 'Procesando...'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    StyleElements = [seClient, seBorder]
  end
end

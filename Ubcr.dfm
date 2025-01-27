object Fbcr: TFbcr
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fbcr'
  ClientHeight = 291
  ClientWidth = 669
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
  object Shape7: TShape
    Left = 25
    Top = 50
    Width = 26
    Height = 1
    Pen.Color = clRed
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 649
    Height = 265
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 14
      Width = 74
      Height = 13
      Caption = 'Banco Deposito'
    end
    object Shape1: TShape
      Left = 17
      Top = 42
      Width = 1
      Height = 72
      Brush.Color = clGreen
      Pen.Color = clRed
    end
    object Shape2: TShape
      Left = 17
      Top = 98
      Width = 26
      Height = -1
      Brush.Color = clGreen
      Pen.Color = clRed
    end
    object Label2: TLabel
      Left = 38
      Top = 69
      Width = 88
      Height = 13
      Caption = 'Fecha de deposito'
    end
    object Shape3: TShape
      Left = 17
      Top = 88
      Width = 1
      Height = 156
      Brush.Color = clGreen
      Pen.Color = clRed
    end
    object Shape4: TShape
      Left = 17
      Top = 154
      Width = 26
      Height = -1
      Brush.Color = clGreen
      Pen.Color = clRed
    end
    object Label3: TLabel
      Left = 38
      Top = 126
      Width = 86
      Height = 13
      Caption = 'Adjuntar depostio'
    end
    object ladjuntos: TLabel
      Left = 275
      Top = 147
      Width = 3
      Height = 13
    end
    object Label4: TLabel
      Left = 167
      Top = 147
      Width = 102
      Height = 13
      Caption = 'Archivos adjuntados:'
    end
    object Shape5: TShape
      Left = 17
      Top = 201
      Width = 26
      Height = 1
      Pen.Color = clRed
    end
    object Label5: TLabel
      Left = 167
      Top = 195
      Width = 94
      Height = 13
      Caption = 'Importe depositado'
    end
    object Shape6: TShape
      Left = 17
      Top = 243
      Width = 26
      Height = 1
      Pen.Color = clRed
    end
    object Combo: TComboBox
      Left = 38
      Top = 33
      Width = 262
      Height = 21
      TabOrder = 0
      OnSelect = ComboSelect
    end
    object fechadep: TDateTimePicker
      Left = 38
      Top = 88
      Width = 186
      Height = 21
      Date = 44739.404714907410000000
      Time = 44739.404714907410000000
      TabOrder = 1
      OnChange = fechadepChange
    end
    object Button1: TButton
      Left = 37
      Top = 142
      Width = 124
      Height = 25
      Caption = 'Adjuntar'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Panel2: TPanel
      Left = 304
      Top = 25
      Width = 335
      Height = 38
      BevelOuter = bvLowered
      TabOrder = 3
      object lbanco: TLabel
        Left = 15
        Top = 9
        Width = 3
        Height = 13
      end
    end
    object Panel3: TPanel
      Left = 304
      Top = 77
      Width = 335
      Height = 37
      BevelOuter = bvLowered
      TabOrder = 4
      object lfecha: TLabel
        Left = 16
        Top = 12
        Width = 3
        Height = 13
      end
    end
    object Button2: TButton
      Left = 38
      Top = 232
      Width = 123
      Height = 25
      Caption = 'Subir deposito'
      Enabled = False
      TabOrder = 5
      OnClick = Button2Click
    end
    object eimporte: TEdit
      Left = 39
      Top = 192
      Width = 122
      Height = 21
      NumbersOnly = True
      TabOrder = 6
      Text = '0'
    end
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
    Left = 614
    Top = 16
  end
end

object Fcajaenviar2: TFcajaenviar2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cajas'
  ClientHeight = 666
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label37: TLabel
    Left = 259
    Top = 331
    Width = 89
    Height = 14
    Caption = 'Bonificaciones OS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label46: TLabel
    Left = 250
    Top = 425
    Width = 21
    Height = 14
    Caption = 'NDB'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
  end
  object pcajas: TPageControl
    Left = 0
    Top = 4
    Width = 801
    Height = 661
    ActivePage = enviar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object enviar: TTabSheet
      Caption = 'Caja'
      object Panel1: TPanel
        Left = 4
        Top = -5
        Width = 786
        Height = 477
        Color = clMenuBar
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 17
          Top = 156
          Width = 39
          Height = 14
          Caption = 'Efectivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 17
          Top = 177
          Width = 32
          Height = 14
          Caption = 'Tarjeta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 177
          Top = 141
          Width = 38
          Height = 14
          Caption = 'Sistema'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 315
          Top = 140
          Width = 48
          Height = 14
          Caption = 'Se envian'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 17
          Top = 219
          Width = 22
          Height = 14
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 13
          Top = 7
          Width = 112
          Height = 14
          Caption = 'Carga de datos de caja'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Shape1: TShape
          Left = 2
          Top = 24
          Width = 391
          Height = 1
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clTeal
        end
        object Label10: TLabel
          Left = 17
          Top = 198
          Width = 37
          Height = 14
          Caption = 'Cheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Shape2: TShape
          Left = 452
          Top = 24
          Width = 1
          Height = 423
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clTeal
        end
        object Shape3: TShape
          Left = 338
          Top = 24
          Width = 463
          Height = 1
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clTeal
        end
        object Shape4: TShape
          Left = 452
          Top = 45
          Width = 349
          Height = 1
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clTeal
        end
        object Label22: TLabel
          Left = 456
          Top = 31
          Width = 39
          Height = 14
          Caption = 'Efectivo'
        end
        object Shape5: TShape
          Left = 618
          Top = 27
          Width = 1
          Height = 231
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clTeal
        end
        object Label23: TLabel
          Left = 625
          Top = 31
          Width = 38
          Height = 14
          Caption = 'Tarjetas'
        end
        object Label31: TLabel
          Left = 13
          Top = 93
          Width = 31
          Height = 14
          Caption = 'Desde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 13
          Top = 118
          Width = 28
          Height = 14
          Caption = 'Hasta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 207
          Top = 91
          Width = 56
          Height = 14
          Caption = 'Hora desde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 207
          Top = 118
          Width = 53
          Height = 14
          Caption = 'Hora hasta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Shape6: TShape
          Left = 0
          Top = 140
          Width = 453
          Height = 1
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clTeal
        end
        object Label35: TLabel
          Left = 13
          Top = 67
          Width = 21
          Height = 14
          Caption = 'Caja'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Shape7: TShape
          Left = 0
          Top = 257
          Width = 453
          Height = 1
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clTeal
        end
        object Label3: TLabel
          Left = 16
          Top = 326
          Width = 35
          Height = 14
          Caption = 'Gastos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 16
          Top = 348
          Width = 30
          Height = 14
          Caption = 'NCT B'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 16
          Top = 369
          Width = 30
          Height = 14
          Caption = 'NCT A'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 17
          Top = 391
          Width = 65
          Height = 14
          Caption = 'Cantidad NCT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 17
          Top = 413
          Width = 67
          Height = 14
          Caption = 'Cantidad NCA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 17
          Top = 239
          Width = 49
          Height = 14
          Caption = 'Diferencia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 16
          Top = 263
          Width = 47
          Height = 14
          Caption = 'Cuenta C.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 459
          Top = 312
          Width = 60
          Height = 14
          Caption = 'Comentarios'
        end
        object lcaja: TLabel
          Left = 5
          Top = 141
          Width = 3
          Height = 14
          Caption = ' '
        end
        object Shape9: TShape
          Left = 452
          Top = 257
          Width = 336
          Height = 1
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clTeal
        end
        object Label24: TLabel
          Left = 459
          Top = 264
          Width = 37
          Height = 14
          Caption = 'Dolares'
        end
        object Label25: TLabel
          Left = 459
          Top = 288
          Width = 28
          Height = 14
          Caption = 'Euros'
        end
        object Label26: TLabel
          Left = 625
          Top = 266
          Width = 63
          Height = 14
          Caption = 'Dolar tomado'
        end
        object Label27: TLabel
          Left = 625
          Top = 289
          Width = 60
          Height = 14
          Caption = 'Euro tomado'
        end
        object Label28: TLabel
          Left = 16
          Top = 306
          Width = 43
          Height = 14
          Caption = 'Obras S.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 16
          Top = 284
          Width = 50
          Height = 14
          Caption = 'Pagos CC.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 270
          Top = 431
          Width = 40
          Height = 14
          Caption = 'IVA NCB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 270
          Top = 453
          Width = 41
          Height = 14
          Caption = 'IVA NCA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 242
          Top = 277
          Width = 21
          Height = 14
          Caption = 'NCB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 242
          Top = 298
          Width = 22
          Height = 14
          Caption = 'NCA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 242
          Top = 319
          Width = 53
          Height = 14
          Caption = 'Facturas A'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label40: TLabel
          Left = 242
          Top = 340
          Width = 53
          Height = 14
          Caption = 'Facturas B'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 242
          Top = 258
          Width = 130
          Height = 14
          Caption = 'Importes no contabilizables'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Shape11: TShape
          Left = 236
          Top = 424
          Width = 217
          Height = 1
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clTeal
        end
        object Shape12: TShape
          Left = 237
          Top = 257
          Width = 1
          Height = 170
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clTeal
        end
        object Label42: TLabel
          Left = 242
          Top = 361
          Width = 54
          Height = 14
          Caption = 'Facturas M'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 242
          Top = 382
          Width = 21
          Height = 14
          Caption = 'NDB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object Label44: TLabel
          Left = 459
          Top = 408
          Width = 79
          Height = 14
          Caption = 'Adjuntar Gastos'
        end
        object Label45: TLabel
          Left = 540
          Top = 433
          Width = 106
          Height = 14
          Caption = 'Archivos adjuntados: '
        end
        object ladjuntos: TLabel
          Left = 693
          Top = 433
          Width = 3
          Height = 14
        end
        object Label47: TLabel
          Left = 244
          Top = 404
          Width = 54
          Height = 14
          Caption = 'Gentilezas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
        end
        object eefectivo: TEdit
          Left = 97
          Top = 153
          Width = 129
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          OnChange = eefectivoChange
        end
        object etarjeta: TEdit
          Left = 97
          Top = 174
          Width = 129
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          OnChange = etarjetaChange
        end
        object etotal: TEdit
          Left = 97
          Top = 216
          Width = 129
          Height = 22
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '0'
          OnChange = etotalChange
        end
        object Etotalenvia: TEdit
          Left = 249
          Top = 216
          Width = 129
          Height = 22
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '0'
          OnChange = EtotalenviaChange
        end
        object Efenvian: TEdit
          Left = 249
          Top = 153
          Width = 129
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '0'
          OnChange = EfenvianChange
        end
        object enviatarjeta: TEdit
          Left = 249
          Top = 174
          Width = 129
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          Text = '0'
          OnChange = enviatarjetaChange
        end
        object fechadesde: TDateTimePicker
          Left = 55
          Top = 89
          Width = 131
          Height = 21
          Date = 42920.488423078710000000
          Time = 42920.488423078710000000
          TabOrder = 6
        end
        object echeque: TEdit
          Left = 97
          Top = 195
          Width = 129
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          Text = '0'
          OnChange = echequeChange
        end
        object enviacheque: TEdit
          Left = 249
          Top = 195
          Width = 129
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Text = '0'
          OnChange = enviachequeChange
        end
        object fechahasta: TDateTimePicker
          Left = 55
          Top = 116
          Width = 131
          Height = 21
          Date = 42920.488423078710000000
          Time = 42920.488423078710000000
          TabOrder = 9
        end
        object horadesde: TMaskEdit
          Left = 283
          Top = 88
          Width = 70
          Height = 22
          EditMask = '!90:00:00;1;_'
          MaxLength = 8
          TabOrder = 10
          Text = '00:00:00'
        end
        object horahasta: TMaskEdit
          Left = 283
          Top = 115
          Width = 69
          Height = 22
          EditMask = '!90:00:00;1;_'
          MaxLength = 8
          TabOrder = 11
          Text = '23:59:59'
        end
        object combocaja: TComboBox
          Left = 55
          Top = 64
          Width = 131
          Height = 22
          TabOrder = 12
        end
        object RadioGroup1: TRadioGroup
          Left = 2
          Top = 26
          Width = 389
          Height = 34
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            'Por fecha operativa'
            'Por fecha de comprobante')
          ParentFont = False
          TabOrder = 13
        end
        object valuepesos: TValueListEditor
          Left = 459
          Top = 56
          Width = 153
          Height = 193
          Color = clBtnFace
          DisplayOptions = [doAutoColResize, doKeyColFixed]
          Strings.Strings = (
            '$1='
            '$2='
            '$5='
            '$10='
            '$20='
            '$50='
            '$100='
            '$200='
            '$500='
            '$1000='
            '$2000='
            '$5000='
            '$10000='
            '$20000='
            'Otras=')
          TabOrder = 14
          OnExit = valuepesosExit
          OnKeyPress = valuepesosKeyPress
          ColWidths = (
            58
            72)
        end
        object ecuentac: TEdit
          Left = 97
          Top = 259
          Width = 129
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
          Text = '0'
        end
        object EGASTOS: TEdit
          Left = 97
          Top = 324
          Width = 129
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
          Text = '0'
        end
        object enct: TEdit
          Left = 97
          Top = 345
          Width = 129
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
          Text = '0'
        end
        object bbuscar: TBitBtn
          Left = 202
          Top = 60
          Width = 145
          Height = 25
          Caption = 'Buscar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF6666663F3F3F989898FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFE5151513C3C3C2C2C2C3B3B3BFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5656565858
            585151513B3B3B595959FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFCFCFC6060607A7A7A767676545454545454FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B7B858585B0B0B07272
            727C7C7CFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFBDBDBDB2B2B2ADADADA9A9A9A4
            A4A4AAAAAAB2B2B26969697B7B7B828282FFFFFFFFFFFFFFFFFFFFFFFFD6D6D6
            C8C8C8EBD2B2F4D3A5F1D1A6F4D1A4EFCCA7A3A3A3B2B2B2B5B5B59D9D9DFFFF
            FFFFFFFFFFFFFFFFFFFFEDEDEDCCCCCCF2DCB5F1D9B4EFDDBDEFDDBDEDDAB8EF
            D5AFF9D5A7A6A6A6AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9F3E7CA
            F6E5C3F4EBD0F4EED1F4EED3F5ECD0F2E5C7F2DFBCF7DEB58A8A8AF4F4F4FFFF
            FFFFFFFFFFFFFFFFFFFFBABABAFAF1D5F6F2D4F6F2D6F6F2D7F6F2D6F6F2D6F5
            F1D5F4EBCDFDE9C3A4A4A4DADADAFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8FFFAE7
            F7F2D5F5EFD5F7F0D6F7F1D8F6F1D8F6F1D6F5F2D6FFF5D3A9A9A9CECECEFFFF
            FFFFFFFFFFFFFFFFFFFFBABABAFEFAEAFAF6E3FBFAF1FDFBF3F9F2DDF7F2DAF6
            F1D7F5F0D5FFFEDDA7A7A7DADADAFFFFFFFFFFFFFFFFFFFFFFFFC7C7C7F9FAEA
            FFFBEBFEFFFEFFFFFFF9F7ECF9F5E1F7F2DEFCF7DFFFFFEA919191FEFEFEFFFF
            FFFFFFFFFFFFFFFFFFFFDEDEDECCCCCCFFFFF1FFFFF3FEFDF7FCFBF4FCF9EFFF
            FEEFFFFFF5C1C1C1D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7
            C6C6C6F8F7ECFFFFF7FFFFF7FFFFF3FEFDEEBCBCBCC6C6C6FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E2CFCFCFC3C3C3C3C3C3C3C3C3CF
            CFCFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          TabOrder = 18
          OnClick = bbuscarClick
        end
        object ENCA: TEdit
          Left = 97
          Top = 366
          Width = 129
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
          Text = '0'
        end
        object nctcantidad: TEdit
          Left = 117
          Top = 388
          Width = 109
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 20
          Text = '0'
        end
        object ncacantidad: TEdit
          Left = 117
          Top = 410
          Width = 109
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 21
          Text = '0'
        end
        object vtarjeta: TValueListEditor
          Left = 625
          Top = 56
          Width = 153
          Height = 193
          Color = clBtnFace
          DisplayOptions = [doAutoColResize, doKeyColFixed]
          Strings.Strings = (
            'Visa='
            'Maestro='
            'Mastercard='
            'Naranja='
            'Electron='
            'Cabal='
            'American='
            'TDF='
            'Nativa='
            'QR='
            'Otras=')
          TabOrder = 22
          OnExit = vtarjetaExit
          OnKeyPress = vtarjetaKeyPress
          ColWidths = (
            58
            72)
        end
        object ediferencia: TEdit
          Left = 97
          Top = 236
          Width = 129
          Height = 22
          Color = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 23
          Text = '0'
        end
        object mcomentarios: TMemo
          Left = 459
          Top = 331
          Width = 319
          Height = 71
          MaxLength = 255
          TabOrder = 24
          OnKeyPress = mcomentariosKeyPress
        end
        object edolar: TEdit
          Left = 522
          Top = 263
          Width = 97
          Height = 22
          TabOrder = 25
          Text = '0'
          OnKeyPress = edolarKeyPress
        end
        object eeuro: TEdit
          Left = 522
          Top = 285
          Width = 97
          Height = 22
          TabOrder = 26
          Text = '0'
          OnKeyPress = eeuroKeyPress
        end
        object ecambiodolar: TEdit
          Left = 715
          Top = 262
          Width = 63
          Height = 22
          TabOrder = 27
          Text = '71'
        end
        object ecambioeuro: TEdit
          Left = 715
          Top = 285
          Width = 63
          Height = 22
          TabOrder = 28
          Text = '81'
        end
        object EOS: TEdit
          Left = 97
          Top = 303
          Width = 129
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 29
          Text = '0'
        end
        object epagoscc: TEdit
          Left = 97
          Top = 281
          Width = 129
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 30
          Text = '0'
        end
        object EFA: TEdit
          Left = 317
          Top = 316
          Width = 121
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 31
          Text = '0'
        end
        object EIVANCB: TEdit
          Left = 325
          Top = 426
          Width = 74
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 32
          Text = '0'
        end
        object EIVANCA: TEdit
          Left = 325
          Top = 450
          Width = 74
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 33
          Text = '0'
        end
        object ENNCA: TEdit
          Left = 317
          Top = 295
          Width = 121
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 34
          Text = '0'
        end
        object ENNCB: TEdit
          Left = 317
          Top = 274
          Width = 121
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 35
          Text = '0'
        end
        object EFM: TEdit
          Left = 317
          Top = 358
          Width = 121
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 36
          Text = '0'
        end
        object ENDB: TEdit
          Left = 317
          Top = 379
          Width = 121
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 37
          Text = '0'
        end
        object EFB: TEdit
          Left = 317
          Top = 337
          Width = 121
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 38
          Text = '0'
        end
        object Egenti: TEdit
          Left = 317
          Top = 398
          Width = 121
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 39
          Text = '0'
        end
      end
      object Panel2: TPanel
        Left = 3
        Top = 473
        Width = 785
        Height = 125
        Color = clMenu
        ParentBackground = False
        TabOrder = 1
        object Label9: TLabel
          Left = 4
          Top = 5
          Width = 28
          Height = 14
          Caption = 'Zetas'
        end
        object gzeta: TDBGrid
          Left = 4
          Top = 25
          Width = 774
          Height = 93
          DataSource = Dzetas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnExit = gzetaExit
          OnKeyPress = gzetaKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'ZETA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TESTIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIFERENCIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPROBANTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BRUTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NETOGRAVADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NETONOGRAVADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NETOGRAVDESC'
              Visible = True
            end
            item
              Color = clMoneyGreen
              Expanded = False
              FieldName = 'cantidad'
              Title.Caption = 'Cantidad TK'
              Title.Color = clFuchsia
              Width = 89
              Visible = True
            end>
        end
      end
      object bcancelar: TBitBtn
        Left = 364
        Top = 604
        Width = 113
        Height = 25
        Cancel = True
        Caption = 'Cancelar'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFF5C58DA
          2722CE2622CF2722CE2520CB2420CB241FCB2520CB251FCA251FCA2620CD231E
          C82620CD5B56D9FFFFFF605FE12E2DFB2423EF0B06B6201DE52B29FA2824F428
          24F42723F42722F42925FC130DCE0A05B0211AEF2921FB5D5ADE2423D6272BEF
          1312B16A67BF1B1AB01F20E22D2EF4282AED2929EE2C2DF40E0DCA3F3CB59090
          CE1210B12321EE201CD22C2CD4100EBB918ED3FFFFFFADAAE0100FB21C20E030
          36F42F35F40D0DCE3835B8ECECF8FFFFFF6A67C60F0DC02B29D53034DB1D24D7
          433DC3EBEAF8FFFFFFAFADE31D1BB91D24DE171CD73934BEEEEDF9FFFFFFACAA
          E41F1BBD252CE72E2DD83136DC384FFA161ED43A32C5EDEDF9FFFFFFD0CEF020
          1FC11E1DC0E2E2F6FFFFFFB3B1E81511BF232DE53241F72F30D82E34DD364FF3
          3950F3151DD83E35CCDEDBF6FFFFFFCFCDF2CFCEF3FFFFFFD4D3F32321C7202C
          E33447F43144F22B2FDB5056E53B55F3334BEF3852F41F2ADF211DCBCDCCF4FF
          FFFFFFFFFFCDCBF42120CD2232E3354DF42F44EE364DF24E52E36E72EA6E82F7
          556AF24862F32B3BE8221FD2CDCBF3FFFFFFFFFFFFCDCBF4201DD2242FE4445D
          F35366F26A7DF66B6FE96B70EC7388F7788CF66472F1514BE0D5D2F7FFFFFFDC
          DAF8DCDAF8FFFFFFDCDAF8655EE2575EEA7588F66F83F6686DEA6C72EE7891F7
          6779F25550E6CAC6F6FFFFFFE9E8FC5851E65954E6E0DEFAFFFFFFF6F5FD6F69
          E9575FEC748CF76A6FED6E76EF6F82F35E59EBC2BFF7FFFFFFF2F1FD6E66EC5D
          68EF6472F15E57EBC5C1F8FFFFFFF1F0FD7670EC616BF16D74EF7078F15A5CEF
          928BF3FFFFFFF1F0FE6F68F05B64EF7A92F67A91F66775F25551EDC3BFF9FFFF
          FFAFA8F75857F06C71EF6C75F37A91F65A57F0AEA8F77771F35F68F27D96F679
          8EF5788EF57C94F66D7FF45F5BF0948CF55956F1758BF66A73F1949BF685A1F7
          7C94F65B5BF36975F584A1F88099F77F98F77F98F77E97F6819CF67588F55C5F
          F37990F5819DF79399F5FFFFFF969BF8757BF57278F5757CF5737AF5737AF572
          7AF5727AF5737AF57279F5737AF5737AF4737AF4959AF7FFFFFF}
        ModalResult = 2
        TabOrder = 2
      end
      object bguardar: TBitBtn
        Left = 124
        Top = 604
        Width = 121
        Height = 25
        Caption = 'Guardar'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000C1761BC27519
          BD6B13B96504B96504B96504BA6504BA6504BA6504BA6504BA6504BA6504BA65
          04BC690AB96A15C3791FD5933DEFB736CDC6C0E9F8FFDBE5F6DBE8F8DBE8F8DB
          E8F9DBE8F8DAE7F8DBE7F8D8E4F5E9F6FFCDC6C0EAA714C0761DCD9551E8AE3C
          DCD7D4ECE8E9ADA0A2A79B9E9E939594898C8A818583797C7B7276685F64ECE8
          E9DCD7D4E59E20C77B25D09653EAB447DCD7D4EFF0EFDFDEDCE1E0DFE0DFDEDF
          E0DDE0DFDDDFDEDDDFE0DEDBD9D9EDEDEDDCD7D4E7A62BC9802BD49B58EBB950
          DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
          E9DCD7D4E8AC37CC8531D69E5BEDBD5ADCD7D4FFFFFFFFFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EAB340D08B34D9A45EF0C263
          DCD7D4ECE8E9A99D9FA4999E9A919492888B897F8582797C7A7177655C62ECE8
          E9DCD7D4EDB749D2903AD8A35CF0C66DDCD7D4FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4EEBD54D7963EDEAC69F9D281
          C1975C9A7B6095775E97795D97795D97795D97795D97795C97795C95775E9A7A
          5EC19A64F7CA6BD99B44DDAB67F6D58BFFD056C0A887C8C5C9CEC6BFCDC6C0CD
          C6C0CDC6BFD6D0CAD6D3D0CFCED4C0A888FFD25DF3CC75DCA148DCA966F6D993
          FBC85DC2B4A2D7DEEBDDDDDDDCDDDEDCDBDDE7E8EAC8BAA7A29692C2B4A2C6BC
          A9FBCB63F3D07EE0A74CE5B973F6DA97FBCC62C8BAA7DDE0E9E1DFDDE0DFDEDF
          DDDCEFF3F99F886FE5AF479E9189C7BDB2FDCF6AF5D484E3AC51E9BC75F8DD9E
          FDCF69CEC0AFE3E7EFE7E5E3E6E5E4E5E4E2F1F6FFBAA386FFE873B5AB9ECAC0
          B8FFD26EF9DA8EE7B25BEAC079F8E09BFBD165D3C4AFEAEEF6ECEBE8ECEBE9EB
          E9E6FBFFFFA28E78DEAF4FA89C95D1C7B9FFDA78F5D889E2A442ECC47EFEF4D5
          FFE290DCD7D4F5FFFFF6FEFFF6FEFFF6FDFFFFFFFFDFDDDCC8BAA7DFDDDCE5E4
          E2FFDE88E4AA45FCF5ECECC681F0CA82F4CA7DE8C788EFCF94EFD498EDCF92EE
          D092EED093F2D396F7D79BF6D69BE6C48AEBB552FDF9F2FFFFFF}
        ParentFont = False
        TabOrder = 3
        OnClick = bguardarClick
      end
      object Blimpiartodo: TBitBtn
        Left = 3
        Top = 604
        Width = 122
        Height = 25
        Caption = 'Limpiar (F2)'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          9C9699746D70716A6B716A6B716A6B716A6B716A6B716A6B716A6B716A6B716A
          6D9C9699FFFFFFFFFFFFFFFFFFFFFFFF776C70A2AFA5A2AFA5A2AFA5A2AFA5A2
          AFA5A2AFA5A2AFA5A2AFA5A2AFA5A2AFA5796E72FFFFFFFFFFFFFFFFFFFFFFFF
          837B7FC9C5C7008036278E5236945CA9BEAF9BB9A5008036008036008036C9C5
          C7837B7FFFFFFFFFFFFFFFFFFFC5C0C2A19B9CE8E6E604904248A872E0DFDDE0
          DFDDE0DFDDE0DFDD64B286049042E8E6E6A19B9CDDDADBFFFFFFFFFFFFACA5A8
          C9C5C7F0EEED84D6AF26A863E1E8E3F0EEEDF0EEEDE1E8E317A35984D6AFF0EE
          EDC9C5C7BFBABCFFFFFFFFFFFF91888CE8E6E6FCFBF9EDF5F0FCFBF9EDF5F0FC
          FBF9FCFBF9DDF1E6EDF5F0DFF1E6FCFBF9E8E6E69F979BFFFFFFFFFFFF7E7478
          FFFEFEFFFEFEFFFEFEFFFEFE0BAF60B3E6CCB3E6CC0BAF60FFFEFEFFFEFEFFFE
          FEFFFEFE887E82FFFFFFFFFFFF877F83F0EEEDF0EEEDF0EEEDF0EEED23AD6C64
          B28664B28615A963E0E8E3F0EEEDF0EEEDF0EEED8C8488FFFFFFFFFFFF9F9598
          DDDCDADDDCDADDDCDADDDCDADDDCDA019750019750DDDCDADDDCDADDDCDADDDC
          DADDDCDA9F9598FFFFFFFFFFFFAAA2A5CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7CB
          C8C7CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7CBC8C7AAA2A5FFFFFF186B1D0A791C
          0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A791C0A79
          1C0A791C0A791C136A181F8B3635C06435C06435C06435C06435C06435C06435
          C06435C06435C06435C06435C06435C06435C06435C0640D8326229B4541D48E
          41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D48E41D4
          8E41D48E41D48E0E94372D9A47239E4D1C96461A9040178B3C16873915863815
          863815863815863816883A178B3C1A90411C96461F9C4B219740FFFFFF55985A
          096F15086A14086512076311076211076211076211076211076412086713096B
          14096F1546914CFFFFFFFFFFFFFFFFFF6CAC73388E42167B220A74170A74170A
          74170A74170A74170A74171C7E2842944C76B27DFFFFFFFFFFFF}
        ParentFont = False
        TabOrder = 4
        OnClick = BlimpiartodoClick
      end
      object breporte: TBitBtn
        Left = 244
        Top = 604
        Width = 121
        Height = 25
        Caption = 'Reporte'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Bitstream Vera Sans Mono'
        Font.Style = []
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          9F804B9776419776419776419776419776419776419776419776419776419776
          41987343987343FFFFFFFFFFFFFFFFFFA07F50FFFFFFF9FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C6524FFFFFFFFFFFFFFFFFF
          AC8755E7FCFF0087FABBE4ECCB8C69BB8767BA8867B88665B78566B37B5AD2AD
          9CF5F7F08C6524FFFFFFFFFFFFFFFFFFAF9162FFFFFFFEF6F1FDF6F1FAF9F5FA
          FBF9FAFBF9FBFCF7F7FBF2F8F9F5FFFFFEF1EBE48C6524FFFFFFFFFFFFFFFFFF
          BB9869D9F4FF0087FABAE2E9CF906CBF8969C08C6CC08B6CC28C6EBD825FD7B3
          9FF5F3ED8C6524FFFFFFFFFFFFFFFFFFB09465FFFFFFFEF6F1FEF6F2FBF9F4F8
          FBF8FBFDFAFBFBFAFFFEFFFEFCFBFFFFFFF1ECE38C6524FFFFFFFFFFFFFFFFFF
          B99867D8F5FF0087FABAE2E8CE8E6BBE8869C38B6EC5916CC59172BF8362D5B0
          9AF6F6F08C6524FFFFFFFFFFFFFFFFFFB0946BFFFFFFFEF6EFFBF6F0F9F9F4FC
          FAFCFEFFFEFFFFFFFFFFFFF8F6F3F9F7F3F2EDE68C6524FFFFFFFFFFFFFFFFFF
          B9A17DE3F7FF0087FABFEAEDD1916FBF8B6CC28C6EC08C6EBB8764AE7554C6A3
          8DECE4D98C6524FFFFFFFFFFFFFFFFFFBCA686FFFFFFFFFFFEFFFFFCFFFFFFFE
          FFFFFFFFFFFAFEF8F6F8F4EDEBE5EAE3DCD8CDB78C6524FFFFFFFFFFFFFFFFFF
          CCB390E1F3FB0087FABEE8F3D09171C08C6ABF8A67BB8664A66C44985427AB7A
          56C3B08E8C6524FFFFFFFFFFFFFFFFFFC8B595FFFFFFFFFFFFFFFFFFFFFFFFFC
          FFF8F9FAF8E4DDD2D3C6A9F6F7F3E8E4D5B79D738C6524FFFFFFFFFFFFFFFFFF
          CFB69ADFF3F90087FAC0EAF1CA8C67B2795AB67B5C985E37CCB99CFFFFFFCFBA
          A0A07D46FBFAF7FFFFFFFFFFFFFFFFFFC7B79AFFFFFFFFFFFFFFFDF7FCFDFBEF
          F1EDEEE9DDD4C5A9BCAC89D7C9B5997335FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          CBBDA1FFFFFFFFFFFFF9F7F7F0E7DEDFD7C7D8C5B0C1AA85AA9161A17E47FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4B292CEBDA3CCBBA0C9B69AC8B699C4
          AF8CC3AB84AA9161936C32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        TabOrder = 5
        OnClick = breporteClick
      end
      object Button1: TButton
        Left = 463
        Top = 422
        Width = 75
        Height = 25
        Caption = 'Adjuntar'
        TabOrder = 6
        OnClick = Button1Click
      end
    end
    object buscar: TTabSheet
      Caption = 'Buscar'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 3
        Top = 0
        Width = 787
        Height = 607
        Color = clMenu
        ParentBackground = False
        TabOrder = 0
        object Shape10: TShape
          Left = 96
          Top = 432
          Width = 65
          Height = 65
        end
        object TPanel
          Left = 0
          Top = 4
          Width = 785
          Height = 101
          TabOrder = 0
          object Label18: TLabel
            Left = 16
            Top = 54
            Width = 31
            Height = 14
            Caption = 'Desde'
          end
          object Label19: TLabel
            Left = 208
            Top = 54
            Width = 28
            Height = 14
            Caption = 'Hasta'
          end
          object Shape8: TShape
            Left = 4
            Top = 31
            Width = 703
            Height = 1
            Brush.Color = clBlue
            Brush.Style = bsBDiagonal
            Pen.Color = clTeal
          end
          object Label20: TLabel
            Left = 4
            Top = 15
            Width = 204
            Height = 14
            Caption = 'Busqueda de cajas previamente cargadas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Bitstream Vera Sans Mono'
            Font.Style = []
            ParentFont = False
          end
          object desdehis: TDateTimePicker
            Left = 55
            Top = 51
            Width = 131
            Height = 21
            Date = 42920.488423078710000000
            Time = 42920.488423078710000000
            TabOrder = 0
          end
          object hastahis: TDateTimePicker
            Left = 245
            Top = 51
            Width = 131
            Height = 21
            Date = 42920.488423078710000000
            Time = 42920.488423078710000000
            TabOrder = 1
          end
          object bhistorico: TBitBtn
            Left = 393
            Top = 48
            Width = 145
            Height = 25
            Caption = 'Buscar'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF6666663F3F3F989898FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFEFEFE5151513C3C3C2C2C2C3B3B3BFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5656565858
              585151513B3B3B595959FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFCFCFC6060607A7A7A767676545454545454FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B7B858585B0B0B07272
              727C7C7CFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFBDBDBDB2B2B2ADADADA9A9A9A4
              A4A4AAAAAAB2B2B26969697B7B7B828282FFFFFFFFFFFFFFFFFFFFFFFFD6D6D6
              C8C8C8EBD2B2F4D3A5F1D1A6F4D1A4EFCCA7A3A3A3B2B2B2B5B5B59D9D9DFFFF
              FFFFFFFFFFFFFFFFFFFFEDEDEDCCCCCCF2DCB5F1D9B4EFDDBDEFDDBDEDDAB8EF
              D5AFF9D5A7A6A6A6AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9F3E7CA
              F6E5C3F4EBD0F4EED1F4EED3F5ECD0F2E5C7F2DFBCF7DEB58A8A8AF4F4F4FFFF
              FFFFFFFFFFFFFFFFFFFFBABABAFAF1D5F6F2D4F6F2D6F6F2D7F6F2D6F6F2D6F5
              F1D5F4EBCDFDE9C3A4A4A4DADADAFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8FFFAE7
              F7F2D5F5EFD5F7F0D6F7F1D8F6F1D8F6F1D6F5F2D6FFF5D3A9A9A9CECECEFFFF
              FFFFFFFFFFFFFFFFFFFFBABABAFEFAEAFAF6E3FBFAF1FDFBF3F9F2DDF7F2DAF6
              F1D7F5F0D5FFFEDDA7A7A7DADADAFFFFFFFFFFFFFFFFFFFFFFFFC7C7C7F9FAEA
              FFFBEBFEFFFEFFFFFFF9F7ECF9F5E1F7F2DEFCF7DFFFFFEA919191FEFEFEFFFF
              FFFFFFFFFFFFFFFFFFFFDEDEDECCCCCCFFFFF1FFFFF3FEFDF7FCFBF4FCF9EFFF
              FEEFFFFFF5C1C1C1D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7
              C6C6C6F8F7ECFFFFF7FFFFF7FFFFF3FEFDEEBCBCBCC6C6C6FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E2CFCFCFC3C3C3C3C3C3C3C3C3CF
              CFCFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            TabOrder = 2
            OnClick = bhistoricoClick
          end
        end
        object TPanel
          Left = 0
          Top = 107
          Width = 785
          Height = 494
          TabOrder = 1
          object Label21: TLabel
            Left = 10
            Top = 4
            Width = 27
            Height = 14
            Caption = 'Cajas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Bitstream Vera Sans Mono'
            Font.Style = []
            ParentFont = False
          end
          object gcajas: TDBGrid
            Left = 4
            Top = 19
            Width = 778
            Height = 470
            DataSource = dcajas
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Bitstream Vera Sans Mono'
            TitleFont.Style = []
            OnDblClick = gcajasDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'fecha'
                Title.Caption = 'Fecha'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cajero'
                Title.Caption = 'Cajero'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'efectivo_contado'
                Title.Caption = 'Efectivo contado'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'efectivo_sistema'
                Title.Caption = 'Efectivo sistema'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'efectivo_diferencia'
                Title.Caption = 'Efectivo diferencia'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tarjeta_contado'
                Title.Caption = 'Tarjeta contado'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tarjeta_sistema'
                Title.Caption = 'Tarjeta sistema'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'gastos'
                Title.Caption = 'Gastos'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nca_emitidas'
                Title.Caption = 'Nca emitidas'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ncb_emitidas'
                Title.Caption = 'Ncb emitidas'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'id_caja'
                Visible = True
              end>
          end
        end
      end
    end
  end
  object Dzetas: TDataSource
    DataSet = cdszetas
    Left = 504
    Top = 32
  end
  object transzetas: TIBTransaction
    Active = True
    DefaultDatabase = base
    Left = 424
    Top = 65520
  end
  object qpagos: TIBQuery
    Database = base
    Transaction = transzetas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ' SELECT'
      ' tip_comprobante ,'
      ' COUNT(NRO_COMPROBANTE),'
      ' SUM(CC) as cc,'
      ' SUM(EFV) as efv,'
      ' SUM(CH) as ch,'
      ' SUM(TAR) as tar,'
      'SUM(OS) as os'
      
        ' FROM CJSP1TIPOCOMBPAGO (:NROSUC, :FECDESDE, :FECHASTA, :CAJADES' +
        'DE, :CAJAHASTA, :PASOXCAJA)'
      ' WHERE TIP_COMPROBANTE IN ('#39'GAS'#39','#39'NCT'#39','#39'NCA'#39')'
      ' group by 1')
    Left = 336
    Top = 65520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NROSUC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECDESDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHASTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAJADESDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAJAHASTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PASOXCAJA'
        ParamType = ptUnknown
      end>
    object qpagosTIP_COMPROBANTE: TIBStringField
      FieldName = 'TIP_COMPROBANTE'
      Origin = '"CJSP1TIPOCOMBPAGO"."TIP_COMPROBANTE"'
      Size = 3
    end
    object qpagosCOUNT: TIntegerField
      FieldName = 'COUNT'
      ProviderFlags = []
      ReadOnly = True
    end
    object qpagosCC: TIBBCDField
      FieldName = 'CC'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qpagosEFV: TIBBCDField
      FieldName = 'EFV'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qpagosCH: TIBBCDField
      FieldName = 'CH'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qpagosTAR: TIBBCDField
      FieldName = 'TAR'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qpagosOS: TIBBCDField
      FieldName = 'OS'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
  end
  object qzetas: TIBQuery
    Database = base
    Transaction = transzetas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ' select               '
      
        '                         SUBSTR(v.nro_comprobante, 1, 2) as ZETA' +
        ','
      
        '                         (substring(v.tip_comprobante   FROM 3  ' +
        'FOR 3) )as tip_comprobante, '
      
        '                         SUM (cast(v.imp_bruto as decimal(10,3))' +
        ') as bruto, '
      
        '                         count(DISTINCT v.nro_comprobante) as tk' +
        ','
      
        '                         sum(cast(i.imp_iva+i.imp_iva_desc as de' +
        'cimal(10,3)))  as iva,'
      
        '                         sum(case when i.por_porcentaje>0 then (' +
        'cast(i.imp_netograv+i.imp_netograv_desc as decimal(10,3))) end )' +
        ' as netogravado,'
      
        '                         sum(case when i.por_porcentaje=0 then (' +
        'cast(i.imp_netograv+i.imp_netograv_desc as decimal(10,3))) end )' +
        ' as netonogravado, '
      
        '                         sum(cast(i.imp_netograv_desc as decimal' +
        '(10,3))) as netogravdesc,'
      
        '                         sum(cast(i.imp_iva_desc+i.imp_iva+i.imp' +
        '_netograv+i.imp_netograv_desc as decimal(10,3))) as IMPORTES'
      '                         from vtmacomprobemitido v '
      
        '                         inner join vtmatipcomprob t on v.tip_co' +
        'mprobante=t.tip_comprobante '
      
        '                         left join mkmacliente c on v.cod_client' +
        'e=c.cod_cliente'
      
        '                         inner join vtmaporcentajesiva i  on i.t' +
        'ip_comprobante=t.tip_comprobante and  v.nro_comprobante=i.nro_co' +
        'mprobante and v.nro_sucursal=i.nro_sucursal,  '
      '                         sumasucursal s '
      '                         where  v.nro_sucursal=s.nro_sucursal  '
      '                         and s.nro_sucursal=i.nro_sucursal '
      
        '                         and (CAST(v.fec_comprobante AS DATE))  ' +
        'between (:desde) and (:hasta)'
      '                         and v.NRO_SUCURSAL=:sucursal '
      '                         AND T.MAR_SUBDIA = '#39'V'#39
      
        '                         anD t.tip_comprobante  NOT IN ('#39'NCT'#39','#39'N' +
        'CA'#39','#39'TKM'#39','#39'NCM'#39')'
      '                            group by 1,2 '
      '')
    Left = 544
    Top = 65520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'desde'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hasta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sucursal'
        ParamType = ptUnknown
      end>
    object qzetasZETA: TIBStringField
      FieldName = 'ZETA'
      ProviderFlags = []
      Size = 80
    end
    object qzetasBRUTO: TIBBCDField
      FieldName = 'BRUTO'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qzetasIVA: TIBBCDField
      FieldName = 'IVA'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qzetasNETOGRAVADO: TIBBCDField
      FieldName = 'NETOGRAVADO'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qzetasNETONOGRAVADO: TIBBCDField
      FieldName = 'NETONOGRAVADO'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qzetasNETOGRAVDESC: TIBBCDField
      FieldName = 'NETOGRAVDESC'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qzetasIMPORTES: TIBBCDField
      FieldName = 'IMPORTES'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qzetasTIP_COMPROBANTE: TIBStringField
      FieldName = 'TIP_COMPROBANTE'
      ProviderFlags = []
      Size = 3
    end
    object qzetasTK: TIntegerField
      FieldName = 'TK'
      ProviderFlags = []
    end
  end
  object base: TIBDatabase
    Connected = True
    DatabaseName = '\\127.0.0.1\c:\net\data\fwdat.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=nmpnet'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 544
    Top = 32
  end
  object cdszetas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 338
    Top = 35
    object cdszetasZETA: TStringField
      FieldName = 'ZETA'
    end
    object cdszetasIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      currency = True
    end
    object cdszetasTESTIGO: TFloatField
      FieldName = 'TESTIGO'
      currency = True
    end
    object cdszetasDIFERENCIA: TFloatField
      FieldName = 'DIFERENCIA'
      currency = True
    end
    object cdszetasCOMPROBANTE: TStringField
      FieldName = 'COMPROBANTE'
    end
    object cdszetasBRUTO: TFloatField
      FieldName = 'BRUTO'
    end
    object cdszetasIVA: TFloatField
      FieldName = 'IVA'
      currency = True
    end
    object cdszetasNETOGRAVADO: TFloatField
      FieldName = 'NETOGRAVADO'
      currency = True
    end
    object cdszetasNETONOGRAVADO: TFloatField
      FieldName = 'NETONOGRAVADO'
      currency = True
    end
    object cdszetasNETOGRAVDESC: TFloatField
      FieldName = 'NETOGRAVDESC'
      currency = True
    end
    object cdszetascantidad: TStringField
      FieldName = 'cantidad'
    end
  end
  object qpagos1: TIBQuery
    Database = base
    Transaction = transzetas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ' SELECT'
      ''
      '    SUM(CC) as cc,'
      '    SUM(EFV) as efv ,'
      '    SUM(CH) as ch,'
      '    SUM(TAR) as tar,'
      '   SUM(OS) AS OS'
      
        '  FROM CJSP1TIPOCOMBPAGO (:NROSUC, :FECDESDE, :FECHASTA, :CAJADE' +
        'SDE, :CAJAHASTA, :PASOXCAJA)')
    Left = 376
    Top = 65520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NROSUC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECDESDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHASTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAJADESDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAJAHASTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PASOXCAJA'
        ParamType = ptUnknown
      end>
    object qpagos1CC: TIBBCDField
      FieldName = 'CC'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qpagos1EFV: TIBBCDField
      FieldName = 'EFV'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qpagos1CH: TIBBCDField
      FieldName = 'CH'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qpagos1TAR: TIBBCDField
      FieldName = 'TAR'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qpagos1OS: TIBBCDField
      FieldName = 'OS'
      ProviderFlags = []
      Precision = 18
      Size = 3
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
    Left = 702
    Top = 8
  end
  object cdscajas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 378
    Top = 35
    object cdscajasfecha: TStringField
      FieldName = 'fecha'
    end
    object cdscajascajero: TStringField
      FieldName = 'cajero'
    end
    object cdscajasefectivo_contado: TStringField
      FieldName = 'efectivo_contado'
    end
    object cdscajasefectivo_sistema: TStringField
      FieldName = 'efectivo_sistema'
    end
    object cdscajasefectivo_diferencia: TStringField
      FieldName = 'efectivo_diferencia'
    end
    object cdscajastarjeta_contado: TStringField
      FieldName = 'tarjeta_contado'
    end
    object cdscajastarjeta_sistema: TStringField
      FieldName = 'tarjeta_sistema'
    end
    object cdscajasgastos: TStringField
      FieldName = 'gastos'
    end
    object cdscajasnca_emitidas: TStringField
      FieldName = 'nca_emitidas'
    end
    object cdscajasncb_emitidas: TStringField
      FieldName = 'ncb_emitidas'
    end
    object cdscajastarjeta_diferencia: TStringField
      FieldName = 'tarjeta_diferencia'
    end
    object cdscajasid_caja: TStringField
      FieldName = 'id_caja'
    end
  end
  object dcajas: TDataSource
    DataSet = cdscajas
    Left = 424
    Top = 32
  end
  object qnct: TIBQuery
    Database = base
    Transaction = transzetas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      '           SELECT  '
      '                          v.tip_comprobante,'
      '                          sum(iva.imp_iva),'
      '                          sum(v.imp_bruto),'
      '                          cOunt(v.nro_comprobante) '
      
        '                          FROM vtmacomprobemitido V, vtmaporcent' +
        'ajesiva iva'
      '                          WHERE  v.nro_sucursal=iva.nro_sucursal'
      
        '                           and v.nro_comprobante=iva.nro_comprob' +
        'ante'
      
        '                           and  v.tip_comprobante=iva.tip_compro' +
        'bante'
      ''
      
        '                           and V.TIP_COMPROBANTE IN ('#39'GAS'#39','#39'NCT'#39 +
        ','#39'NCA'#39')'
      '                           AND V.NRO_SUCURSAL=:NROSUC '
      
        '                           AND V.FEC_COMPROBANTE BETWEEN :FECDES' +
        'DE AND :FECHASTA  '
      
        '                           AND V.nro_caja BETWEEN :CAJADESDE AND' +
        ' :CAJAHASTA '
      '                           AND V.mar_pasoxcaja=:PASOXCAJA '
      '                           group by 1'
      ''
      '')
    Left = 464
    Top = 65520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NROSUC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECDESDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHASTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAJADESDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAJAHASTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PASOXCAJA'
        ParamType = ptUnknown
      end>
    object qnctTIP_COMPROBANTE: TIBStringField
      FieldName = 'TIP_COMPROBANTE'
      Origin = '"VTMACOMPROBEMITIDO"."TIP_COMPROBANTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qnctSUM: TIBBCDField
      FieldName = 'SUM'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object qnctCOUNT: TIntegerField
      FieldName = 'COUNT'
      ProviderFlags = []
      ReadOnly = True
    end
    object qnctSUM1: TIBBCDField
      FieldName = 'SUM1'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
  end
  object qboni: TIBQuery
    Database = base
    Transaction = transzetas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select v.tip_comprobante, sum(imp_ctacte) as importe FROM'
      'vttbpagoctacte v, VTMACOMPROBEMITIDO vt'
      'where v.NRO_SUCURSAL = vt.NRO_SUCURSAL'
      'and v.TIP_COMPROBANTE = vt.TIP_COMPROBANTE'
      'and v.NRO_COMPROBANTE = vt.NRO_COMPROBANTE'
      'and cod_ctacte in ('#39'OAS'#39','#39'OAB'#39','#39'OB1'#39')'
      
        'and   v.aud_fec_alta between '#39'2019/12/18 00:00:00.00'#39' and '#39'2019/' +
        '12/18 23:59:59.00'#39
      'and v.nro_sucursal=:sucursal'
      'and vt.nro_caja=:caja'
      'group by 1')
    Left = 496
    Top = 65520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sucursal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'caja'
        ParamType = ptUnknown
      end>
    object qboniTIP_COMPROBANTE: TIBStringField
      FieldName = 'TIP_COMPROBANTE'
      Origin = '"VTTBPAGOCTACTE"."TIP_COMPROBANTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qboniIMPORTE: TIBBCDField
      FieldName = 'IMPORTE'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
  end
  object qpcc: TIBQuery
    Database = base
    Transaction = transzetas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      '  select vt.tip_comprobante,SUM(VT.imp_neto) as importe'
      '  FROM'
      '  VTMACOMPROBEMITIDO vt where'
      '  (CAST(vT.FEC_COMPROBANTE as date)) between :desde and :hasta'
      '  and vt.tip_comprobante like '#39'%CC%'#39
      '  and vt.nro_caja=:caja'
      '  AND VT.nro_sucursal='#39'7'#39
      '  group by 1')
    Left = 464
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'desde'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hasta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'caja'
        ParamType = ptUnknown
      end>
    object IBStringField1: TIBStringField
      FieldName = 'TIP_COMPROBANTE'
      Origin = '"VTTBPAGOCTACTE"."TIP_COMPROBANTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qpccIMPORTE: TIBBCDField
      FieldName = 'IMPORTE'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
  end
  object qgenti: TIBQuery
    Database = base
    Transaction = transzetas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 424
    Top = 88
  end
end

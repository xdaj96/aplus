object fkardex: Tfkardex
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'kardex'
  ClientHeight = 474
  ClientWidth = 434
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
  object Panel1: TPanel
    Left = 1
    Top = 3
    Width = 431
    Height = 78
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 2
      Width = 34
      Height = 13
      Caption = 'Kardex'
    end
    object Shape2: TShape
      Left = 8
      Top = 20
      Width = 410
      Height = 1
      Brush.Color = clBlue
      Brush.Style = bsBDiagonal
      Pen.Color = clSkyBlue
    end
    object ebusqueda: TEdit
      Left = 8
      Top = 34
      Width = 303
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = 'Escriba palabra a buscar..'
      OnKeyDown = ebusquedaKeyDown
    end
    object bbuscar: TButton
      Left = 312
      Top = 32
      Width = 115
      Height = 25
      Caption = 'Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = bbuscarClick
    end
  end
  object Panel2: TPanel
    Left = 1
    Top = 82
    Width = 431
    Height = 391
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 342
      Width = 30
      Height = 13
      Caption = 'Desde'
    end
    object Label3: TLabel
      Left = 178
      Top = 342
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object gkardex: TDBGrid
      Left = 4
      Top = 5
      Width = 420
      Height = 326
      DataSource = dmFacturador.dsetiquetas
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = gkardexDblClick
      OnKeyDown = gkardexKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_alfabeta'
          Title.Caption = 'Alfabeta'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NRO_TROQUEL'
          Title.Caption = 'Troquel'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_BARRASPRI'
          Title.Caption = 'Codigo de Barras'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOM_LARGO'
          Title.Caption = 'Nombre'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_IVA'
          Title.Caption = 'Codigo Iva'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAN_STK'
          Title.Caption = 'Cantidad'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_TOTAL'
          Title.Caption = 'PRECIO TOTAL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'RUBRO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTOOS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESCUENTOCO1'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESCUENTOCO2'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COD_LABORATORIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cod_tamano'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'des_accion'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'des_droga'
          Visible = False
        end>
    end
    object breporte: TBitBtn
      Left = 4
      Top = 362
      Width = 109
      Height = 25
      Caption = 'Reporte'
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
      TabOrder = 1
      OnClick = breporteClick
    end
    object ddesde: TDateTimePicker
      Left = 44
      Top = 339
      Width = 121
      Height = 21
      Date = 42933.882420428240000000
      Time = 42933.882420428240000000
      TabOrder = 2
    end
    object dhasta: TDateTimePicker
      Left = 212
      Top = 339
      Width = 121
      Height = 21
      Date = 42933.882420428240000000
      Time = 42933.882420428240000000
      TabOrder = 3
    end
  end
end

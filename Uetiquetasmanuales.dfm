object fetiquetasmanuales: Tfetiquetasmanuales
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Etiquetas manuales'
  ClientHeight = 568
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 418
    Top = 1
    Width = 380
    Height = 136
    TabOrder = 0
    object rimpresion: TRadioGroup
      Left = 5
      Top = 5
      Width = 356
      Height = 98
      Caption = 'Impresion'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Impresora Etiquetas'
        'Impresora Comun')
      ParentFont = False
      TabOrder = 0
    end
    object Bimprimir: TBitBtn
      Left = 261
      Top = 106
      Width = 100
      Height = 25
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFD7C39BECE3D6ECE3D6ECE3D6ECE3D6ECE3D6ECE3D6D7C39BFFFF
        FFFFFFFFFFFFFFFFFFFFB0ACACB1ACACA7A2A2726C73C4AB7FEDE1D5EDE1D5ED
        E1D5EDE1D5EDE1D5EDE1D5C4AB7F767177A49E9EA9A4A4ABA5A5958F8FC3C0BF
        C3C0BF837D84C6A874E0CBAEE0CBAEE0CBAEE0CBAEE0CBAEE0CBAEC6A874837D
        84C3C0BFC3C0BF999292A49FA1D1CFCED1CFCED3D2D1D2D2D3D0D0D2D0D0D2D0
        D0D2D0D0D2D0D0D2D0D0D2D2D2D3D3D2D1BACAD76E9BE3A49FA1AAA7A7D9D7D7
        D9D7D7D9D7D7D9D7D7D9D7D7D9D7D7D9D7D7D9D7D7D9D7D7D9D7D7D9D7D7D9D7
        D78AC3E9004BFBABA8A8B7B3B3E6E8E9D6C5AFBC6B10BB6A0FBB6A0FBB6A0FBB
        6A0FBB6A0FBB6A0FBB6A0FBB6A0FBC6B10D6C5AFE6E8E9B8B5B5BCB9BAEEF2F5
        BA7B3EE1A942E1A842E1A842E1A842E1A842E1A842E1A842E1A842E1A842E1A9
        42BA7B3EEEF2F5BFBBBCCDC8C9F8FCFFCD9753EEC670EEC771EEC771EEC771EE
        C771EEC771EEC771EEC771EEC771EEC670CD9753F8FCFFCECBCCD2D0D0FCFFFF
        D7A55CEDC977E9BF68E9BF68E9BF68E9BF68E9BF68E9BF68E9BF68E9BF68EDC9
        77D7A55CFCFFFFD4D1D0DEDCDBFFFFFFE8C070E0AC54B99D6BD7BD91D7BD91D7
        BD91D7BD91D7BD91D7BD91B99D6BE0AC54E8C070FFFFFFE3DFDFD1CBCDBCBBC0
        DEB673CF9E5FC4AB7FDFCAADDFCAADDFCAADDFCAADDFCAADDFCAADC4AB7FCD99
        56DDB36EBEBDC1D1CACCFFFFFFFFFFFFFFFFFFFFFFFFD0BD98ECDFD1ECDFD1EC
        DFD1ECDFD1ECDFD1ECDFD1D0BD98FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD5C4A4EFE4D8EFE4D8EFE4D8EFE4D8EFE4D8EFE4D8D5C4A4FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED0B8F5EDE4F5EDE4F5
        EDE4F5EDE4F5EDE4F5EDE4DED0B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE2D6C1F8F3EAF8F3EAF8F3EAF8F3EAF8F3EAF8F3EAE2D6C1FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7DDCDEFE8DBEFE8DBEF
        E8DBEFE8DBEFE8DBEFE8DBE8DFD0FFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      TabOrder = 1
      OnClick = BimprimirClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 139
    Width = 798
    Height = 427
    TabOrder = 1
    object getiquetas: TDBGrid
      Left = 6
      Top = 1
      Width = 786
      Height = 396
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
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_alfabeta'
          ReadOnly = True
          Title.Caption = 'Alfabeta'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NRO_TROQUEL'
          ReadOnly = True
          Title.Caption = 'Troquel'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COD_BARRASPRI'
          ReadOnly = True
          Title.Caption = 'Codigo de barras'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOM_LARGO'
          ReadOnly = True
          Title.Caption = 'Descripcion'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Width = 245
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_IVA'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CAN_STK'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          ReadOnly = True
          Title.Caption = 'Precio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PRECIO_TOTAL'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'RUBRO'
          ReadOnly = True
          Title.Caption = 'Rubro'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTOOS'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESCUENTOCO1'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESCUENTOCO2'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COD_LABORATORIO'
          ReadOnly = True
          Title.Caption = 'Codigo laboratorio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Bitstream Vera Sans Mono'
          Title.Font.Style = []
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'imp_descuento'
          Visible = True
        end>
    end
    object blimpiar: TBitBtn
      Left = 5
      Top = 397
      Width = 108
      Height = 25
      Cancel = True
      Caption = 'Limpiar'
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
      TabOrder = 1
      OnClick = blimpiarClick
    end
  end
  object petiquetas: TPageControl
    Left = 1
    Top = 1
    Width = 416
    Height = 136
    ActivePage = Baja
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChanging = petiquetasChanging
    object Alta: TTabSheet
      Caption = 'Alta'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel1: TPanel
        Left = -7
        Top = -25
        Width = 415
        Height = 132
        TabOrder = 0
        object Busqueda: TLabel
          Left = 9
          Top = 27
          Width = 49
          Height = 14
          Caption = 'Busqueda'
        end
        object Shape1: TShape
          Left = 2
          Top = 46
          Width = 410
          Height = 1
          Brush.Color = clBlue
          Brush.Style = bsBDiagonal
          Pen.Color = clSkyBlue
        end
        object bbuscar: TBitBtn
          Left = 303
          Top = 63
          Width = 89
          Height = 25
          Caption = 'Buscar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = bbuscarClick
        end
        object ebusqueda: TEdit
          Left = 16
          Top = 65
          Width = 281
          Height = 22
          BevelInner = bvNone
          BevelOuter = bvNone
          CharCase = ecUpperCase
          TabOrder = 1
          OnKeyPress = ebusquedaKeyPress
        end
      end
    end
    object Baja: TTabSheet
      Caption = 'Baja'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 2
        Top = 2
        Width = 49
        Height = 14
        Caption = 'Busqueda'
      end
      object Shape2: TShape
        Left = -2
        Top = 20
        Width = 410
        Height = 1
        Brush.Color = clBlue
        Brush.Style = bsBDiagonal
        Pen.Color = clSkyBlue
      end
      object bbuscarbaja: TBitBtn
        Left = 296
        Top = 38
        Width = 89
        Height = 25
        Caption = 'Buscar'
        TabOrder = 0
        OnClick = bbuscarbajaClick
      end
      object ebusquedabaja: TEdit
        Left = 9
        Top = 40
        Width = 281
        Height = 22
        BevelInner = bvNone
        BevelOuter = bvNone
        CharCase = ecUpperCase
        TabOrder = 1
        OnKeyPress = ebusquedabajaKeyPress
      end
      object bajaetiquetas: TBitBtn
        Left = 296
        Top = 67
        Width = 89
        Height = 25
        Caption = 'Dar de baja'
        Enabled = False
        TabOrder = 2
        OnClick = bajaetiquetasClick
      end
    end
    object Actualizaciones: TTabSheet
      Caption = 'Actualizaciones'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label2: TLabel
        Left = 2
        Top = 2
        Width = 77
        Height = 14
        Caption = 'Actualizaciones'
      end
      object Shape3: TShape
        Left = -2
        Top = 20
        Width = 410
        Height = 1
        Brush.Color = clBlue
        Brush.Style = bsBDiagonal
        Pen.Color = clSkyBlue
      end
      object Label3: TLabel
        Left = 9
        Top = 82
        Width = 52
        Height = 14
        Caption = 'Registros: '
      end
      object lregistros: TLabel
        Left = 81
        Top = 82
        Width = 3
        Height = 14
      end
      object dtdesde: TDateTimePicker
        Left = 9
        Top = 40
        Width = 128
        Height = 21
        Date = 42695.000000000000000000
        Time = 42695.000000000000000000
        TabOrder = 0
      end
      object dthasta: TDateTimePicker
        Left = 143
        Top = 40
        Width = 129
        Height = 21
        Date = 42695.597464780090000000
        Time = 42695.597464780090000000
        TabOrder = 1
      end
      object bbuscaractu: TButton
        Left = 278
        Top = 38
        Width = 89
        Height = 25
        Caption = 'Buscar'
        TabOrder = 2
        OnClick = bbuscaractuClick
      end
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
    Left = 766
  end
end

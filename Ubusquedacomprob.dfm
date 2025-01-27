object fbusquedacomprob: Tfbusquedacomprob
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busqueda'
  ClientHeight = 551
  ClientWidth = 921
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Bitstream Vera Sans Mono'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pbusqueda: TPageControl
    Left = 0
    Top = 0
    Width = 921
    Height = 526
    ActivePage = Busqueda
    TabOrder = 0
    object Busqueda: TTabSheet
      Caption = 'Busqueda'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 913
        Height = 498
        Color = clMenu
        ParentBackground = False
        TabOrder = 0
        object panel3: TPanel
          Left = 3
          Top = 66
          Width = 908
          Height = 432
          TabOrder = 0
          object gdetalle: TDBGrid
            Left = 3
            Top = 133
            Width = 902
            Height = 296
            DataSource = dmFacturador.dsdetalle
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Bitstream Vera Sans Mono'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'COD_ALFABETA'
                Title.Caption = 'Alfabeta'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NRO_ITEM'
                Title.Caption = 'Item'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOM_LARGO'
                Title.Caption = 'Descripcion'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CAN_CANTIDAD'
                Title.Caption = 'Cantidad'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IMP_UNITARIO'
                Title.Caption = 'Importe'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IMP_PRODNETO'
                Title.Caption = 'Importe neto'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IMP_DESCUENTO'
                Title.Caption = 'Importe descuento'
                Width = 131
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'POR_DESCUENTO'
                Title.Caption = '% Descuento'
                Visible = True
              end>
          end
        end
        object gbusquedacomprob: TDBGrid
          Left = 6
          Top = 70
          Width = 902
          Height = 126
          DataSource = dmFacturador.dsbusquedacomprob
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Bitstream Vera Sans Mono'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'TIP_ COMPROBANTE'
              Title.Caption = 'Tipo Comprobante'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRO_COMPROBANTE'
              Title.Caption = 'Nro Comprobante'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_VENDEDOR'
              Title.Caption = 'Vendedor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRO_CAJA'
              Title.Caption = 'Nro Caja'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FEC_COMPROBANTE'
              Title.Caption = 'Fecha Comprobante'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAN_ITEMS'
              Title.Caption = 'Items'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_NETO'
              Title.Caption = 'Imp. Neto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_BRUTO'
              Title.Caption = 'Imp. Bruto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOM_CLIENTE'
              Title.Caption = 'Cliente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_CLIENTE'
              Title.Caption = 'Cod. Cliente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_CARGOOS'
              Title.Caption = 'Importe OS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_PLANOS'
              Title.Caption = 'Codigo Plan'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOM_OBRASOCIAL'
              Title.Caption = 'Nombre OS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FEC_RECETA'
              Title.Caption = 'Fecha Receta'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOM_AFILIADO'
              Title.Caption = 'Afiliado'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRO_MATRICULA'
              Title.Caption = 'Matricula'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAR_OBRASOCIAL'
              Title.Caption = 'Tipo OS'
              Visible = True
            end>
        end
      end
      object panel4: TPanel
        Left = 3
        Top = 3
        Width = 908
        Height = 62
        Color = clMenu
        ParentBackground = False
        TabOrder = 1
        object Label1: TLabel
          Left = 103
          Top = 9
          Width = 105
          Height = 13
          Caption = 'Nro comprobante'
        end
        object ecomprob: TEdit
          Left = 103
          Top = 28
          Width = 175
          Height = 21
          NumbersOnly = True
          TabOrder = 0
        end
        object combotipo: TComboBox
          Left = 10
          Top = 28
          Width = 87
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object bbuscar: TButton
          Left = 282
          Top = 26
          Width = 152
          Height = 25
          Caption = 'Buscar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = bbuscarClick
        end
      end
    end
    object Detalle: TTabSheet
      Caption = 'Detalle'
      ImageIndex = 1
      object MemoIMPRESION: TMemo
        Left = 0
        Top = 3
        Width = 910
        Height = 492
        Lines.Strings = (
          '')
        TabOrder = 0
      end
    end
  end
  object Blimpiartodo: TBitBtn
    Left = 2
    Top = 525
    Width = 122
    Height = 25
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
    OnClick = BlimpiartodoClick
  end
  object imprimir: TBitBtn
    Left = 124
    Top = 525
    Width = 122
    Height = 25
    Caption = 'Imprimir'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFBBA799806D59806D59806D59806D59806D59806D59806D59FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBBA799F3F3F3F3F3F3F3
      F3F3F3F3F3F3F3F3F3F3F3806D59FF00FFFF00FFFF00FFFF00FF9292916E6464
      6E64646E6464BBA799F3F3F3E8D0BEDCB38CE0B68DE6B88CF3F3F3806D596E64
      646E64646E64646E6464929291959594A09F9F3B3A3ABBA799F3F3F3E8C79FF6
      DEB5F7DEB1F7E7CDF8F8F8B8AEA3929292CAC9C9C4C4C3AEA9A9929291A09F9F
      A09F9F3B3A3A917D6CF3F3F3FDEBC1FDEBC1C5C6DCD6D9EF806D597666527666
      52766652766652AEA9A992929192929192929192929192929192929192929192
      9291929291C2C2C2806D59FFFFFF4859CCB9BBDB766652AEA9A9929291FEFDFD
      FEFDFD929291EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAF3F3F3806D594859CC0030
      F84859CC766652AEA9A9929291D9D9D9727171929291D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9E9E9E9806D590030F8FFFFFF0030F84859CCAEA9A9929291D9D9D9
      D9D9D9929291C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9E1E1E1806D59806D59806D
      59806D590030F84859CC929291F3F3F3F3F3F3929291D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9E9E9E9E9E9E9E9E9E9C2C2C2F3F3F3F3F3F30030F8AEADADAEADAD
      AEADAD929291949294949294949294949294929291C2C2C2806D597666527666
      52766652766652C2C2C2FF00FFFF00FFFF00FF545453BBA798FFFFFFFFFFFFFF
      FFFFFFFBFFFFFBFF806D59FFFFFF4859CCB9BBDB766652FF00FFFF00FFFF00FF
      FF00FF646363BBA798FFFFFFFFFFFFFFFFFFFFFBFFFFFBFF806D594859CC0030
      F84859CC766652FF00FFFF00FFFF00FFFF00FFFF00FFBBA798FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF806D590030F8FFFFFF0030F84859CCFF00FFFF00FFFF00FF
      FF00FFFF00FFBBA798FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF806D59806D59806D
      59806D590030F84859CCFF00FFFF00FFFF00FFFF00FFBBA798BBA798BBA798BB
      A798BBA798BBA798D9CEC6D9CEC6FF00FFFF00FFFF00FF0030F8}
    ParentFont = False
    TabOrder = 2
    OnClick = imprimirClick
  end
end

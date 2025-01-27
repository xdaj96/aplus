object fautofarmaplus: Tfautofarmaplus
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'fautofarmaplus'
  ClientHeight = 172
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 8
    Width = 401
    Height = 156
    TabOrder = 0
    object Label25: TLabel
      Left = 13
      Top = 50
      Width = 98
      Height = 13
      Caption = 'Codigo Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object Label31: TLabel
      Left = 13
      Top = 11
      Width = 18
      Height = 13
      Caption = 'DNI'
    end
    object Label26: TLabel
      Left = 151
      Top = 11
      Width = 98
      Height = 13
      Caption = 'Nombre Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
    end
    object ecliente: TEdit
      Left = 13
      Top = 67
      Width = 134
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
      OnKeyDown = eclienteKeyDown
    end
    object edocumento: TEdit
      Left = 13
      Top = 27
      Width = 134
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      NumbersOnly = True
      TabOrder = 0
      OnKeyDown = edocumentoKeyDown
    end
    object bbuscardni: TButton
      Left = 153
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 2
      OnClick = bbuscardniClick
    end
    object Blimpiartodo: TBitBtn
      Left = 11
      Top = 118
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
      TabOrder = 5
      OnClick = BlimpiartodoClick
    end
    object bcancelar: TBitBtn
      Left = 255
      Top = 118
      Width = 122
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
    end
    object enombrecliente: TEdit
      Left = 151
      Top = 28
      Width = 211
      Height = 21
      CharCase = ecUpperCase
      Color = clMenu
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnChange = enombreclienteChange
    end
    object Baceptar: TBitBtn
      Left = 133
      Top = 118
      Width = 122
      Height = 25
      Caption = 'Aceptar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      Kind = bkOK
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 3
      OnClick = BaceptarClick
    end
  end
end

object fcajaenviar: Tfcajaenviar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fcajaenviar'
  ClientHeight = 588
  ClientWidth = 747
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Bitstream Vera Sans Mono'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 2
    Top = 6
    Width = 743
    Height = 328
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 134
      Width = 56
      Height = 13
      Caption = 'Efectivo'
    end
    object Label2: TLabel
      Left = 16
      Top = 162
      Width = 49
      Height = 13
      Caption = 'Tarjeta'
    end
    object Label4: TLabel
      Left = 124
      Top = 107
      Width = 49
      Height = 13
      Caption = 'Sistema'
    end
    object Label5: TLabel
      Left = 272
      Top = 107
      Width = 63
      Height = 13
      Caption = 'Se envian'
    end
    object Label6: TLabel
      Left = 16
      Top = 274
      Width = 35
      Height = 13
      Caption = 'Total'
    end
    object Label7: TLabel
      Left = 13
      Top = 7
      Width = 154
      Height = 13
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
      Pen.Color = clRed
    end
    object Label8: TLabel
      Left = 20
      Top = 26
      Width = 70
      Height = 13
      Caption = 'Fecha Caja'
    end
    object Label10: TLabel
      Left = 16
      Top = 190
      Width = 42
      Height = 13
      Caption = 'Cheque'
    end
    object Shape2: TShape
      Left = 393
      Top = 24
      Width = 1
      Height = 298
      Brush.Color = clBlue
      Brush.Style = bsBDiagonal
      Pen.Color = clRed
    end
    object Shape3: TShape
      Left = 338
      Top = 24
      Width = 463
      Height = 1
      Brush.Color = clBlue
      Brush.Style = bsBDiagonal
      Pen.Color = clRed
    end
    object Shape4: TShape
      Left = 393
      Top = 45
      Width = 408
      Height = 1
      Brush.Color = clBlue
      Brush.Style = bsBDiagonal
      Pen.Color = clRed
    end
    object Label12: TLabel
      Left = 422
      Top = 58
      Width = 14
      Height = 13
      Caption = '$1'
    end
    object Label13: TLabel
      Left = 422
      Top = 86
      Width = 14
      Height = 13
      Caption = '$2'
    end
    object Label14: TLabel
      Left = 422
      Top = 114
      Width = 14
      Height = 13
      Caption = '$5'
    end
    object Label15: TLabel
      Left = 415
      Top = 142
      Width = 21
      Height = 13
      Caption = '$10'
    end
    object Label16: TLabel
      Left = 415
      Top = 170
      Width = 21
      Height = 13
      Caption = '$20'
    end
    object Label17: TLabel
      Left = 415
      Top = 198
      Width = 21
      Height = 13
      Caption = '$50'
    end
    object Label18: TLabel
      Left = 408
      Top = 226
      Width = 28
      Height = 13
      Caption = '$100'
    end
    object Label19: TLabel
      Left = 408
      Top = 253
      Width = 28
      Height = 13
      Caption = '$500'
    end
    object Label20: TLabel
      Left = 401
      Top = 280
      Width = 35
      Height = 13
      Caption = '$1000'
    end
    object Label21: TLabel
      Left = 401
      Top = 307
      Width = 35
      Height = 13
      Caption = 'Otras'
    end
    object Label22: TLabel
      Left = 399
      Top = 31
      Width = 56
      Height = 13
      Caption = 'Efectivo'
    end
    object Shape5: TShape
      Left = 559
      Top = 24
      Width = 1
      Height = 298
      Brush.Color = clBlue
      Brush.Style = bsBDiagonal
      Pen.Color = clRed
    end
    object Label23: TLabel
      Left = 566
      Top = 31
      Width = 56
      Height = 13
      Caption = 'Tarjetas'
    end
    object Label24: TLabel
      Left = 566
      Top = 58
      Width = 28
      Height = 13
      Caption = 'Visa'
    end
    object Label25: TLabel
      Left = 566
      Top = 86
      Width = 70
      Height = 13
      Caption = 'Mastercard'
    end
    object Label26: TLabel
      Left = 566
      Top = 114
      Width = 49
      Height = 13
      Caption = 'Maestro'
    end
    object Label27: TLabel
      Left = 566
      Top = 142
      Width = 56
      Height = 13
      Caption = 'Electron'
    end
    object Label28: TLabel
      Left = 566
      Top = 170
      Width = 21
      Height = 13
      Caption = 'TDF'
    end
    object Label29: TLabel
      Left = 566
      Top = 198
      Width = 35
      Height = 13
      Caption = 'Cabal'
    end
    object Label30: TLabel
      Left = 566
      Top = 255
      Width = 35
      Height = 13
      Caption = 'Otras'
    end
    object Label31: TLabel
      Left = 54
      Top = 50
      Width = 35
      Height = 13
      Caption = 'Desde'
    end
    object Label32: TLabel
      Left = 54
      Top = 75
      Width = 35
      Height = 13
      Caption = 'Hasta'
    end
    object Label33: TLabel
      Left = 248
      Top = 48
      Width = 70
      Height = 13
      Caption = 'Hora desde'
    end
    object Label34: TLabel
      Left = 248
      Top = 75
      Width = 70
      Height = 13
      Caption = 'Hora hasta'
    end
    object Label11: TLabel
      Left = 566
      Top = 226
      Width = 49
      Height = 13
      Caption = 'Naranja'
    end
    object eefectivo: TEdit
      Left = 96
      Top = 126
      Width = 129
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object etarjeta: TEdit
      Left = 96
      Top = 154
      Width = 129
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Edit6: TEdit
      Left = 96
      Top = 266
      Width = 129
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Edit7: TEdit
      Left = 246
      Top = 266
      Width = 129
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Efenvian: TEdit
      Left = 248
      Top = 126
      Width = 129
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = '0'
    end
    object Edit5: TEdit
      Left = 248
      Top = 154
      Width = 129
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object fechacomprobante: TDateTimePicker
      Left = 96
      Top = 46
      Width = 129
      Height = 21
      Date = 42920.488423078710000000
      Time = 42920.488423078710000000
      TabOrder = 6
    end
    object echeque: TEdit
      Left = 96
      Top = 182
      Width = 129
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object Edit9: TEdit
      Left = 248
      Top = 182
      Width = 129
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object ef1: TEdit
      Left = 439
      Top = 50
      Width = 73
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnKeyPress = ef1KeyPress
    end
    object Edit3: TEdit
      Left = 439
      Top = 78
      Width = 73
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object Edit8: TEdit
      Left = 439
      Top = 106
      Width = 73
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object Edit10: TEdit
      Left = 439
      Top = 134
      Width = 73
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object Edit11: TEdit
      Left = 439
      Top = 162
      Width = 73
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
    end
    object Edit12: TEdit
      Left = 439
      Top = 190
      Width = 73
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
    end
    object Edit13: TEdit
      Left = 439
      Top = 218
      Width = 73
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object Edit14: TEdit
      Left = 439
      Top = 245
      Width = 73
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object Edit15: TEdit
      Left = 439
      Top = 272
      Width = 73
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
    end
    object Edit16: TEdit
      Left = 439
      Top = 299
      Width = 73
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bitstream Vera Sans Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
    end
    object DateTimePicker1: TDateTimePicker
      Left = 96
      Top = 73
      Width = 129
      Height = 21
      Date = 42920.488423078710000000
      Time = 42920.488423078710000000
      TabOrder = 19
    end
    object MaskEdit1: TMaskEdit
      Left = 331
      Top = 45
      Width = 46
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 20
      Text = '00:00'
    end
    object MaskEdit2: TMaskEdit
      Left = 331
      Top = 72
      Width = 46
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 21
      Text = '23:59'
    end
  end
  object Panel2: TPanel
    Left = 2
    Top = 336
    Width = 743
    Height = 228
    TabOrder = 1
    object Label9: TLabel
      Left = 3
      Top = 1
      Width = 35
      Height = 13
      Caption = 'Zetas'
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 16
      Width = 734
      Height = 209
      DataSource = Dzetas
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Bitstream Vera Sans Mono'
      TitleFont.Style = []
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
        end>
    end
  end
  object BitBtn1: TBitBtn
    Left = 246
    Top = 564
    Width = 121
    Height = 25
    Caption = 'Guardar'
    Default = True
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
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
  end
  object Blimpiartodo: TBitBtn
    Left = 2
    Top = 564
    Width = 122
    Height = 25
    Caption = 'Limpiar (F2)'
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
    TabOrder = 3
  end
  object Baceptar: TBitBtn
    Left = 124
    Top = 564
    Width = 122
    Height = 25
    Caption = 'Actualizar'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCB6413FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DCC2DE
      871DD5730AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFDFBF0C99AE0840EE58C00D77409DDA280FDF9F7FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF7F0E9AD6ADE7B08E18301E5
      8C04E28A07D97D0BD27E38DFAE93FEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF2C89DE29A32EAAD33E1850AE58F0CE9980AEA9B09EB9C0FD97D0DC87B
      53FAF4F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9BA9BDC9340F2C258E8
      9613EFB842F2C047EFAA1DF2AD1CDB8314CF9173FEFCFBFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF3DCD1DE995FF8D678E3A13ED4813FEAB047F2B82DF6BD
      2CCB6D15E3C2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF4EFDD
      9E60E7B566E9C3ABDB9E77ECB036F5C33BECAB2DC57B4FFFFFFFFFFFFFFCECC7
      F9E3B4F8DFB6F7DDB7FFFFFFFFFFFFFFFFFFD9905BFFFFFFF2DCD1DC8D28F8CC
      48F5C746CC7A3AFFFFFFFFFFFFF6CB5CF4C649F3C348EAA22DF6DAB7FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFDC903EFAD357F6CF56D48840FFFFFFFFFFFFF6CB5D
      F9D866FADD68F1BD46F5D7B4FFFFFFFFFFFFFFFFFFFFFFFFEBCCBCE2A037FEE0
      69F9D761C9773DFFFFFFFFFFFFF7D480F8D86BFCE073FADB69EBAF53FAEDE0FF
      FFFFFFFFFFF7E8DFD58844F9D766FFEA7AEDBB4BCD8E6AFFFFFFFFFFFFFDF3DC
      F5C960FDE98EFDE67DFBDE72E9AA42E7AD69E3A667DE933CFADD71FEEA80FFEF
      87C87838EFDCD3FFFFFFFFFFFFFFFFFFF9DFADF3CE6BFFEF9FFFEC8DFFED87FC
      E275FCE275FFF08AFFF08FFFF69BDC9C45DCB19EFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF6D49FF2C367FBE59AFFF4ACFFF5ACFFF5ABFFF8A9F8E08DDA954AD9A7
      92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAD3EFC184E8B164EB
      BB66E8B363DE9C59DDA47AF0DACFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    TabOrder = 4
    OnClick = BaceptarClick
  end
  object Edit17: TEdit
    Left = 647
    Top = 56
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object Edit21: TEdit
    Left = 647
    Top = 253
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object Edit22: TEdit
    Left = 647
    Top = 196
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object Edit23: TEdit
    Left = 647
    Top = 168
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object Edit24: TEdit
    Left = 647
    Top = 140
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object Edit25: TEdit
    Left = 647
    Top = 112
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object Edit26: TEdit
    Left = 647
    Top = 84
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object Edit1: TEdit
    Left = 647
    Top = 224
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Bitstream Vera Sans Mono'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
  end
  object bcancelar: TBitBtn
    Left = 366
    Top = 564
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
    TabOrder = 13
  end
  object transzetas: TIBTransaction
    DefaultDatabase = base
    Left = 480
    Top = 360
  end
  object Dzetas: TDataSource
    DataSet = cdszetas
    Left = 432
    Top = 360
  end
  object qzetas: TIBQuery
    Database = base
    Transaction = transzetas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select distinct(substring(v.tip_comprobante FROM 3  FOR 3)) AS Z' +
        'ETA , sum(v.imp_bruto) AS IMPORTE from vtmacomprobemitido  v , v' +
        'tmatipcomprob tipo where v.tip_comprobante=tipo.tip_comprobante ' +
        'and v.nro_caja='#39'2'#39' and  (CAST(v.fec_comprobante AS DATE))='#39'2017/' +
        '07/04'#39' and tipo.mar_tipoproceso='#39'F'#39' group by 1')
    Left = 432
    Top = 408
    object qzetasZETA: TIBStringField
      FieldName = 'ZETA'
      ProviderFlags = []
      Size = 3
    end
    object qzetasIMPORTE: TIBBCDField
      FieldName = 'IMPORTE'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
  end
  object base: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=nmpnet')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 432
    Top = 464
  end
  object qpagos: TIBQuery
    Database = base
    Transaction = transzetas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      'DISTINCT '
      'c.NRO_CAJA,'
      ' a.des_caja, '
      'FEC_OPERACIONES'
      ' FROM cjmaapertura c, cjmacaja a '
      'WHERE c.nro_caja=a.nro_caja and c.nro_sucursal=a.nro_sucursal '
      'and MAR_CAJA='#39'S'#39' '
      'GROUP BY 1,2,3')
    Left = 480
    Top = 408
  end
  object cdszetas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 194
    Top = 411
    object cdszetasZETA: TStringField
      FieldName = 'ZETA'
    end
    object cdszetasIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object cdszetasTESTIGO: TFloatField
      FieldName = 'TESTIGO'
    end
    object cdszetasDIFERENCIA: TFloatField
      FieldName = 'DIFERENCIA'
    end
  end
end

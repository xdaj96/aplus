object FLibroRecetas: TFLibroRecetas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Libro Recetas'
  ClientHeight = 465
  ClientWidth = 747
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblDesde: TLabel
    Left = 40
    Top = 24
    Width = 30
    Height = 13
    Caption = 'Desde'
  end
  object lblHasta: TLabel
    Left = 40
    Top = 58
    Width = 28
    Height = 13
    Caption = 'Hasta'
  end
  object DBGLibroRecetas: TDBGrid
    Left = 40
    Top = 96
    Width = 641
    Height = 265
    DataSource = DSLibroRecetas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'renglon'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'medico'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prescripcion'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cantidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'precio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nro_comprobante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo'
        Visible = True
      end>
  end
  object btnCancelar: TButton
    Left = 40
    Top = 398
    Width = 153
    Height = 49
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = btnCancelarClick
  end
  object btnConsultar: TButton
    Left = 528
    Top = 41
    Width = 153
    Height = 49
    Caption = 'Consultar'
    TabOrder = 2
    OnClick = btnConsultarClick
  end
  object DTPDesde: TDateTimePicker
    Left = 88
    Top = 16
    Width = 201
    Height = 21
    Date = 45033.657251354170000000
    Time = 45033.657251354170000000
    TabOrder = 3
    OnChange = DTPDesdeChange
  end
  object DTPHasta: TDateTimePicker
    Left = 88
    Top = 50
    Width = 201
    Height = 21
    Date = 45033.657251354170000000
    Time = 45033.657251354170000000
    TabOrder = 4
    OnChange = DTPHastaChange
  end
  object btnExportarExcel: TButton
    Left = 528
    Top = 398
    Width = 153
    Height = 49
    Caption = 'Exportar a Excel'
    TabOrder = 5
    OnClick = btnExportarExcelClick
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
    Left = 375
    Top = 368
  end
  object DSLibroRecetas: TDataSource
    DataSet = CDSLibroRecetas
    Left = 304
    Top = 368
  end
  object CDSLibroRecetas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 368
    object CDSLibroRecetasrenglon: TLargeintField
      FieldName = 'renglon'
    end
    object CDSLibroRecetasmedico: TStringField
      FieldName = 'medico'
      Size = 50
    end
    object CDSLibroRecetasprescripcion: TStringField
      FieldName = 'prescripcion'
      Size = 100
    end
    object CDSLibroRecetasfecha: TDateField
      FieldName = 'fecha'
      DisplayFormat = 'DD-MM-YYYY'
    end
    object CDSLibroRecetascantidad: TIntegerField
      FieldName = 'cantidad'
    end
    object CDSLibroRecetasprecio: TFloatField
      FieldName = 'precio'
    end
    object CDSLibroRecetasnro_comprobante: TLargeintField
      FieldName = 'nro_comprobante'
    end
    object CDSLibroRecetasid: TIntegerField
      FieldName = 'id'
    end
    object CDSLibroRecetastipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
  end
  object scExcelExport1: TscExcelExport
    DataPipe = dpDataSet
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontHeader.Charset = DEFAULT_CHARSET
    FontHeader.Color = clWindowText
    FontHeader.Height = 1
    FontHeader.Name = 'Tahoma'
    FontHeader.Orientation = 0
    FontHeader.Style = []
    FontHeader.Alignment = haGeneral
    FontHeader.VerticalAlignment = vaCenter
    FontHeader.WrapText = False
    BorderHeader.BackAlternateColor = clBlack
    MergeHeaderCells = True
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = 1
    FontTitles.Name = 'Tahoma'
    FontTitles.Orientation = 0
    FontTitles.Style = []
    FontTitles.Alignment = haGeneral
    FontTitles.VerticalAlignment = vaCenter
    FontTitles.WrapText = False
    BorderTitles.BackAlternateColor = clBlack
    AutoFilter = False
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = 1
    FontData.Name = 'Tahoma'
    FontData.Orientation = 0
    FontData.Style = []
    FontData.Alignment = haGeneral
    FontData.VerticalAlignment = vaCenter
    FontData.WrapText = False
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = 1
    FontSummary.Name = 'Tahoma'
    FontSummary.Orientation = 0
    FontSummary.Style = []
    FontSummary.Alignment = haGeneral
    FontSummary.VerticalAlignment = vaCenter
    FontSummary.WrapText = False
    BorderSummary.BackAlternateColor = clBlack
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    FontFooter.Charset = DEFAULT_CHARSET
    FontFooter.Color = clWindowText
    FontFooter.Height = 1
    FontFooter.Name = 'Tahoma'
    FontFooter.Orientation = 0
    FontFooter.Style = []
    FontFooter.Alignment = haGeneral
    FontFooter.VerticalAlignment = vaCenter
    FontFooter.WrapText = False
    BorderFooter.BackAlternateColor = clBlack
    MergeFooterCells = True
    FontGroup.Charset = DEFAULT_CHARSET
    FontGroup.Color = clWindowText
    FontGroup.Height = 1
    FontGroup.Name = 'Tahoma'
    FontGroup.Orientation = 0
    FontGroup.Style = []
    FontGroup.Alignment = haGeneral
    FontGroup.VerticalAlignment = vaCenter
    FontGroup.WrapText = False
    BorderGroup.BackAlternateColor = clBlack
    GroupOptions.ClearContents = True
    GroupOptions.BorderRange = bsRow
    GroupOptions.IntervalFontSize = 2
    Left = 376
    Top = 40
  end
end

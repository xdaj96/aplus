object dmFacturador: TdmFacturador
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 1440
  Width = 949
  object dsfact: TDataSource
    DataSet = DPRINCIPAL
    Left = 91
    Top = 133
  end
  object datosbusqueda: TDataSource
    Left = 416
    Top = 203
  end
  object databasefire: TIBDatabase
    Connected = True
    DatabaseName = 'C:\NET\DATA\FWDAT.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=nmpnet'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 24
    Top = 13
  end
  object transactionprod: TIBTransaction
    DefaultDatabase = databasefire
    Left = 160
    Top = 189
  end
  object qbusqueda: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ' select first(100)                   DISTINCT a.cod_alfabeta,'
      
        '                                                    a.nro_troque' +
        'l,'
      
        '                                                    a.cod_barras' +
        'pri,'
      '                                                    a.nom_largo,'
      '                                                    a.cod_iva,'
      '                                                    s.can_stk,'
      
        '                                                    a.cod_tamano' +
        ','
      
        '                                                    a.cod_labora' +
        'torio,'
      
        '                                                   coalesce(CAST' +
        '('
      '                                                    CASE'
      
        '                                                    WHEN a.mar_i' +
        'mpsug='#39'N'#39' and a.mar_precioventa='#39'S'#39' THEN'
      '                                                     b.imp_venta'
      
        '                                                     when a.mar_' +
        'impsug='#39'N'#39' and a.mar_precioventa='#39'N'#39' THEN'
      
        '                                                     (b.imp_comp' +
        'ra*(1+r.por_margen/100))'
      
        '                                                      when a.mar' +
        '_impsug='#39'S'#39' AND A.mar_precioventa='#39'S'#39' then'
      
        '                                                     (a.imp_suge' +
        'rido)'
      
        '                                                     when A.mar_' +
        'impsug='#39'S'#39' AND A.mar_precioventa='#39'N'#39' then'
      
        '                                                      ((a.imp_su' +
        'gerido*r.por_margen/100) + a.imp_sugerido)'
      
        '                                                      END AS DEC' +
        'IMAL (10,2)),0) as PRECIO,'
      
        '                                                     c.POR_VAR_P' +
        'RECIO as varlabo,'
      
        '                                                     r.por_var_p' +
        'recio as VARRUBRO,'
      
        '                                                     r.cod_rubro' +
        ','
      
        '                                                     d.des_droga' +
        ','
      
        '                                                     f.des_accfa' +
        'rm,'
      
        '                                                     c.nom_labor' +
        'atorio'
      
        '                                                     from  prmal' +
        'aboratorio c, prmarubro r,'
      
        '                                                     prmaproduct' +
        'o a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta'
      
        '                                                     LEFT JOIN p' +
        'rmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm'
      
        '                                                     LEFT JOIN p' +
        'rmamonodroga d ON  D.cod_droga=a.cod_droga'
      
        '                                                     left join  ' +
        ' prmastock s on    a.cod_alfabeta=s.cod_alfabeta and s.nro_sucur' +
        'sal=b.nro_sucursal'
      
        '                                                     where (cod_' +
        'barraspri= :Barras Or NRO_TROQUEL= :Troquel or (a.nom_largo like' +
        ' :nombre ) )'
      
        '                                                     AND a.cod_r' +
        'ubro=r.cod_rubro'
      
        '                                                     and c.cod_l' +
        'aboratorio=a.cod_laboratorio'
      
        '                                                     and not(mar' +
        '_baja='#39'S'#39' and s.can_stk=0)'
      
        '                                                     and b.nro_s' +
        'ucursal=:sucursal')
    Left = 88
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Barras'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Troquel'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sucursal'
        ParamType = ptUnknown
      end>
    object qbusquedaCOD_ALFABETA: TIntegerField
      FieldName = 'COD_ALFABETA'
      Origin = '"PRMAPRODUCTO"."COD_ALFABETA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qbusquedaNRO_TROQUEL: TIntegerField
      FieldName = 'NRO_TROQUEL'
      Origin = '"PRMAPRODUCTO"."NRO_TROQUEL"'
      Required = True
    end
    object qbusquedaCOD_BARRASPRI: TIBStringField
      FieldName = 'COD_BARRASPRI'
      Origin = '"PRMAPRODUCTO"."COD_BARRASPRI"'
      Size = 15
    end
    object qbusquedaNOM_LARGO: TIBStringField
      FieldName = 'NOM_LARGO'
      Origin = '"PRMAPRODUCTO"."NOM_LARGO"'
      Size = 100
    end
    object qbusquedaCOD_IVA: TIBStringField
      FieldName = 'COD_IVA'
      Origin = '"PRMAPRODUCTO"."COD_IVA"'
      Required = True
      Size = 1
    end
    object qbusquedaCAN_STK: TSmallintField
      FieldName = 'CAN_STK'
      Origin = '"PRMASTOCK"."CAN_STK"'
    end
    object qbusquedaPRECIO: TIBBCDField
      FieldName = 'PRECIO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qbusquedaCOD_RUBRO: TIBStringField
      FieldName = 'COD_RUBRO'
      Origin = '"PRMARUBRO"."COD_RUBRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object qbusquedaCOD_LABORATORIO: TIBStringField
      FieldName = 'COD_LABORATORIO'
      Origin = '"PRMALABORATORIO"."COD_LABORATORIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object qbusquedaVARLABO: TIBBCDField
      FieldName = 'VARLABO'
      Origin = '"PRMALABORATORIO"."POR_VAR_PRECIO"'
      Precision = 9
      Size = 3
    end
    object qbusquedaVARRUBRO: TIBBCDField
      FieldName = 'VARRUBRO'
      Origin = '"PRMARUBRO"."POR_VAR_PRECIO"'
      Precision = 9
      Size = 3
    end
    object qbusquedacod_tamano: TSmallintField
      FieldName = 'cod_tamano'
    end
    object qbusquedaDES_ACCFARM: TIBStringField
      FieldName = 'DES_ACCFARM'
      Origin = '"PRMAACCIONFARM"."DES_ACCFARM"'
      Size = 50
    end
    object qbusquedaDES_DROGA: TIBStringField
      FieldName = 'DES_DROGA'
      Origin = '"PRMAMONODROGA"."DES_DROGA"'
      Size = 50
    end
    object qbusquedaNOM_LABORATORIO: TIBStringField
      FieldName = 'NOM_LABORATORIO'
      Origin = '"PRMALABORATORIO"."NOM_LABORATORIO"'
      Size = 50
    end
  end
  object DPRINCIPAL: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 24
    Top = 67
    object DPRINCIPALCOD_ALFABETA: TStringField
      FieldName = 'COD_ALFABETA'
    end
    object DPRINCIPALNRO_TROQUEL: TStringField
      FieldName = 'NRO_TROQUEL'
    end
    object DPRINCIPALVALE: TStringField
      FieldName = 'VALE'
    end
    object DPRINCIPALCOD_BARRASPRI: TStringField
      FieldName = 'COD_BARRASPRI'
    end
    object DPRINCIPALNOM_LARGO: TStringField
      DisplayWidth = 40
      FieldName = 'NOM_LARGO'
      Size = 40
    end
    object DPRINCIPALCOD_IVA: TStringField
      FieldName = 'COD_IVA'
    end
    object DPRINCIPALPRECIO: TCurrencyField
      FieldName = 'PRECIO'
    end
    object DPRINCIPALCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object DPRINCIPALPRECIO_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'PRECIO_TOTAL'
    end
    object DPRINCIPALPRECIO_TOTALDESC: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'PRECIO_TOTALDESC'
    end
    object DPRINCIPALDESCUENTOS: TCurrencyField
      DisplayWidth = 2
      FieldKind = fkInternalCalc
      FieldName = 'DESCUENTOS'
    end
    object DPRINCIPALPORCENTAJEOS: TFloatField
      FieldName = 'PORCENTAJEOS'
      Precision = 4
    end
    object DPRINCIPALPORCENTAJECO1: TFloatField
      FieldName = 'PORCENTAJECO1'
    end
    object DPRINCIPALPORCENTAJECO2: TFloatField
      FieldName = 'PORCENTAJECO2'
    end
    object DPRINCIPALDESCUENTOSOS: TCurrencyField
      DisplayWidth = 10
      FieldName = 'DESCUENTOSOS'
    end
    object DPRINCIPALDESCUENTOCO1: TCurrencyField
      DisplayWidth = 10
      FieldName = 'DESCUENTOCO1'
    end
    object DPRINCIPALDESCUENTOCO2: TCurrencyField
      DisplayWidth = 10
      FieldName = 'DESCUENTOCO2'
    end
    object DPRINCIPALCOD_LABORATORIO: TStringField
      DisplayWidth = 5
      FieldName = 'COD_LABORATORIO'
      Size = 5
    end
    object DPRINCIPALcan_stk: TIntegerField
      FieldName = 'can_stk'
    end
    object DPRINCIPALcan_vale: TStringField
      FieldName = 'can_vale'
      EditMask = '0'
    end
    object DPRINCIPALtamano: TIntegerField
      FieldName = 'tamano'
    end
    object DPRINCIPALModificado: TBooleanField
      FieldName = 'Modificado'
    end
    object DPRINCIPALRUBRO: TStringField
      FieldName = 'RUBRO'
    end
    object DPRINCIPALIMPORTEGENT: TFloatField
      FieldName = 'IMPORTEGENT'
    end
    object DPRINCIPALCODAUTORIZACION: TStringField
      FieldName = 'CODAUTORIZACION'
    end
    object DPRINCIPALporcentaje: TFloatField
      DisplayWidth = 2
      FieldName = 'porcentaje'
      Precision = 4
    end
    object DPRINCIPALItem: TIntegerField
      FieldName = 'Item'
    end
    object DPRINCIPALGENTILEZA: TFloatField
      FieldName = 'GENTILEZA'
    end
    object DPRINCIPALhosp: TStringField
      FieldName = 'hosp'
      Size = 1
    end
    object DPRINCIPALPORCENTAJEAPLUS: TFloatField
      FieldName = 'PORCENTAJEAPLUS'
    end
    object DPRINCIPALDESCUENTOAPLUS: TFloatField
      FieldName = 'DESCUENTOAPLUS'
      currency = True
    end
    object DPRINCIPALES_RECARGO: TStringField
      FieldName = 'ES_RECARGO'
      Size = 1
    end
    object DPRINCIPALimportetotal: TAggregateField
      FieldName = 'importetotal'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(precio_total)'
    end
    object DPRINCIPALdescuentos_total: TAggregateField
      FieldName = 'descuentos_total'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentos)'
    end
    object DPRINCIPALnetoxcobrar: TAggregateField
      FieldName = 'netoxcobrar'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(precio_totaldesc)'
    end
    object DPRINCIPALDESCUENTOTOTALOS: TAggregateField
      FieldName = 'DESCUENTOTOTALOS'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentosos)'
    end
    object DPRINCIPALDESCUENTOTOTALCO1: TAggregateField
      FieldName = 'DESCUENTOTOTALCO1'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentoco1)'
    end
    object DPRINCIPALDESCUENTOTOTALCO2: TAggregateField
      FieldName = 'DESCUENTOTOTALCO2'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(descuentoco2)'
    end
    object DPRINCIPALTOTALGENTILEZA: TAggregateField
      FieldName = 'TOTALGENTILEZA'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(IMPORTEGENT)'
    end
    object DPRINCIPALdescuentototalaplus: TAggregateField
      FieldName = 'descuentototalaplus'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(DESCUENTOAPLUS)'
    end
  end
  object qafiliados: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select des_afiliado, nro_afiliado from osmaafiliado where cod_pl' +
        'anos=:codigo OR DES_AFILIADO like :NOMBRE')
    Left = 84
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE'
        ParamType = ptUnknown
      end>
  end
  object dataafiliados: TDataSource
    DataSet = qafiliados
    Left = 101
    Top = 64
  end
  object tranafiliados: TIBTransaction
    DefaultDatabase = databasefire
    Left = 158
    Top = 64
  end
  object qiafiliados: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 147
    Top = 13
  end
  object dsecundario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 187
    object dsecundarioCOD_ALFABETA: TStringField
      FieldName = 'COD_ALFABETA'
    end
    object dsecundarioNRO_TROQUEL: TStringField
      FieldName = 'NRO_TROQUEL'
    end
    object dsecundarioCOD_BARRASPRI: TStringField
      FieldName = 'COD_BARRASPRI'
    end
    object dsecundarioNOM_LARGO: TStringField
      FieldName = 'NOM_LARGO'
      Size = 40
    end
    object dsecundarioCOD_IVA: TStringField
      FieldName = 'COD_IVA'
    end
    object dsecundarioCAN_STK: TIntegerField
      FieldName = 'CAN_STK'
    end
    object dsecundarioPRECIO: TStringField
      FieldName = 'PRECIO'
    end
    object dsecundarioDESCUENTO: TStringField
      FieldName = 'DESCUENTO'
    end
    object dsecundarioPRECIO_TOTAL: TFloatField
      FieldName = 'PRECIO_TOTAL'
    end
    object dsecundarioRUBRO: TStringField
      FieldName = 'RUBRO'
    end
    object dsecundarioDESCUENTOOS: TStringField
      FieldName = 'DESCUENTOOS'
    end
    object dsecundarioDESCUENTOCO1: TStringField
      FieldName = 'DESCUENTOCO1'
    end
    object dsecundarioDESCUENTOCO2: TStringField
      FieldName = 'DESCUENTOCO2'
    end
    object dsecundarioCOD_LABORATORIO: TStringField
      FieldName = 'COD_LABORATORIO'
    end
    object dsecundariocod_tamano: TStringField
      FieldName = 'cod_tamano'
    end
    object dsecundariodes_accion: TStringField
      FieldName = 'des_accion'
      Size = 50
    end
    object dsecundariodes_droga: TStringField
      FieldName = 'des_droga'
      Size = 50
    end
    object dsecundarionom_laboratorio: TStringField
      FieldName = 'nom_laboratorio'
    end
    object dsecundarioHOSP: TStringField
      FieldName = 'HOSP'
      Size = 1
    end
  end
  object dsbusqueda: TDataSource
    DataSet = dsecundario
    Left = 472
    Top = 227
  end
  object qosmaplanesos: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select POR_DESOS from osmaplanesos  where cod_planos=:PLAN and c' +
        'od_rubro like :rubro')
    Left = 360
    Top = 227
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PLAN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rubro'
        ParamType = ptUnknown
      end>
  end
  object qNROVALIDACION: TIBQuery
    Database = databasefire
    Transaction = IBTransactionVAL
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select first 1 idcomprobante from osmacomprobvalidaciones  order' +
        ' by idcomprobante desc')
    Left = 256
    Top = 24
  end
  object IBTransactionVAL: TIBTransaction
    DefaultDatabase = databasefire
    Left = 256
    Top = 64
  end
  object IBQcodigoprestador: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 368
    Top = 24
  end
  object ibqcaja: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 84
    Top = 424
  end
  object icomprobante: TIBQuery
    Database = databasefire
    Transaction = ticomprobante
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 624
    Top = 64
  end
  object ticomprobante: TIBTransaction
    DefaultDatabase = databasefire
    Left = 624
    Top = 112
  end
  object qvendedor: TIBQuery
    Database = databasefire
    Transaction = tpanel1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 25
    Top = 368
  end
  object qcomprobante: TIBQuery
    Database = databasefire
    Transaction = tpanel1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select TIP_COMPROBANTE, TIP_IMPRE from vtmatipcomprob where tip_' +
        'comprobante like :LETRA  AND MAR_TIPOPROCESO='#39'F'#39' order by 1 desc')
    Left = 96
    Top = 245
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'LETRA'
        ParamType = ptUnknown
      end>
    object qcomprobanteTIP_COMPROBANTE: TIBStringField
      FieldName = 'TIP_COMPROBANTE'
      Origin = '"VTMATIPCOMPROB"."TIP_COMPROBANTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qcomprobanteTIP_IMPRE: TIBStringField
      FieldName = 'TIP_IMPRE'
      Origin = '"VTMATIPCOMPROB"."TIP_IMPRE"'
      Size = 1
    end
  end
  object tpanel1: TIBTransaction
    DefaultDatabase = databasefire
    Left = 101
    Top = 306
  end
  object Dscomprobante: TDataSource
    DataSet = qcomprobante
    Left = 104
    Top = 368
  end
  object qpanel2: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 176
    Top = 368
  end
  object qtipocomprob: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 168
    Top = 254
  end
  object qcliente: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 464
    Top = 368
  end
  object qicliente: TIBQuery
    Database = databasefire
    Transaction = traninsertcliente
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 464
    Top = 416
  end
  object traninsertcliente: TIBTransaction
    DefaultDatabase = databasefire
    Left = 560
    Top = 416
  end
  object DSicliente: TDataSource
    Left = 512
    Top = 416
  end
  object qupdatecliente: TIBQuery
    Database = databasefire
    Transaction = traninsertcliente
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 408
    Top = 416
  end
  object cdsfactura: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 768
    Top = 67
    object cdsfacturacod_alfabeta: TStringField
      FieldName = 'cod_alfabeta'
    end
    object cdsfacturacod_barraspri: TStringField
      FieldName = 'cod_barraspri'
    end
    object cdsfacturanom_largo: TStringField
      FieldName = 'nom_largo'
    end
    object cdsfacturacantidad: TStringField
      FieldName = 'cantidad'
    end
    object cdsfacturacantidadcontrol: TStringField
      FieldName = 'cantidadcontrol'
    end
  end
  object dsfactura: TDataSource
    DataSet = cdsfactura
    Left = 696
    Top = 64
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSet = cdsfacturareporte
    BCDToCurrency = False
    Left = 32
    Top = 576
  end
  object reportefactonline: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42600.377013194390000000
    ReportOptions.LastChange = 42604.603447511600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 113
    Top = 576
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Productos Inexistentes')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Width = 740.787401574802900000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 151.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nombre')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          Left = 151.000000000000000000
          Width = 151.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Codigo de barras')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          Left = 302.000000000000000000
          Width = 151.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'cantidad')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          Left = 453.000000000000000000
          Width = 151.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'cantidad control')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 151.181200000000000000
        Width = 740.409927000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset'
        RowCount = 0
        object Memo7: TfrxMemoView
          Width = 151.000000000000000000
          Height = 18.897650000000000000
          DataField = 'nom_largo'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset."nom_largo"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          Left = 151.000000000000000000
          Width = 151.000000000000000000
          Height = 18.897650000000000000
          DataField = 'cod_barraspri'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset."cod_barraspri"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          Left = 302.000000000000000000
          Width = 151.000000000000000000
          Height = 18.897650000000000000
          DataField = 'cantidad'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset."cantidad"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          Left = 453.000000000000000000
          Width = 151.000000000000000000
          Height = 18.897650000000000000
          DataField = 'cantidadcontrol'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset."cantidadcontrol"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 234.330860000000000000
        Width = 740.409927000000000000
        object Memo11: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo12: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo13: TfrxMemoView
          Align = baRight
          Left = 664.819327000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
  object cdsfacturareporte: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 121
    Top = 528
    object cdsfacturareportecod_alfabeta: TStringField
      FieldName = 'cod_alfabeta'
    end
    object cdsfacturareportecod_barraspri: TStringField
      FieldName = 'cod_barraspri'
    end
    object cdsfacturareportenom_largo: TStringField
      FieldName = 'nom_largo'
    end
    object cdsfacturareportecantidad: TStringField
      FieldName = 'cantidad'
    end
    object cdsfacturareportecantidadcontrol: TStringField
      FieldName = 'cantidadcontrol'
    end
    object cdsfacturareportenro_factura: TStringField
      FieldName = 'nro_factura'
    end
  end
  object dsfacturareporte: TDataSource
    Left = 32
    Top = 528
  end
  object qnrocomprob: TIBQuery
    Database = databasefire
    Transaction = transcomprob
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select des_afiliado, nro_afiliado from osmaafiliado where cod_pl' +
        'anos=:codigo OR DES_AFILIADO like :NOMBRE')
    Left = 28
    Top = 252
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE'
        ParamType = ptUnknown
      end>
  end
  object transcomprob: TIBTransaction
    DefaultDatabase = databasefire
    Left = 24
    Top = 304
  end
  object CDSetiquetas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 523
    object CDSetiquetascod_alfabeta: TStringField
      FieldName = 'cod_alfabeta'
    end
    object CDSetiquetasNRO_TROQUEL: TStringField
      FieldName = 'NRO_TROQUEL'
    end
    object CDSetiquetasCOD_BARRASPRI: TStringField
      FieldName = 'COD_BARRASPRI'
    end
    object CDSetiquetasNOM_LARGO: TStringField
      FieldName = 'NOM_LARGO'
      Size = 40
    end
    object CDSetiquetasCOD_IVA: TStringField
      FieldName = 'COD_IVA'
    end
    object CDSetiquetasCAN_STK: TIntegerField
      FieldName = 'CAN_STK'
    end
    object CDSetiquetasPRECIO: TStringField
      FieldName = 'PRECIO'
    end
    object CDSetiquetasDESCUENTO: TStringField
      FieldName = 'DESCUENTO'
    end
    object CDSetiquetasPRECIO_TOTAL: TFloatField
      FieldName = 'PRECIO_TOTAL'
    end
    object CDSetiquetaSRUBRO: TStringField
      FieldName = 'RUBRO'
    end
    object CDSetiquetasDESCUENTOOS: TStringField
      FieldName = 'DESCUENTOOS'
    end
    object CDSetiquetasDESCUENTOCO1: TStringField
      FieldName = 'DESCUENTOCO1'
    end
    object CDSetiquetasDESCUENTOCO2: TStringField
      FieldName = 'DESCUENTOCO2'
    end
    object CDSetiquetasCOD_LABORATORIO: TStringField
      FieldName = 'COD_LABORATORIO'
    end
    object CDSetiquetascod_tamano: TStringField
      FieldName = 'cod_tamano'
      Size = 10
    end
    object CDSetiquetasdes_accion: TStringField
      FieldName = 'des_accion'
      Size = 40
    end
    object CDSetiquetasdes_droga: TStringField
      FieldName = 'des_droga'
      Size = 40
    end
    object CDSetiquetasimp_descuento: TFloatField
      FieldName = 'imp_descuento'
    end
  end
  object dsetiquetas: TDataSource
    DataSet = CDSetiquetas
    Left = 320
    Top = 520
  end
  object frxetiquetas: TfrxDBDataset
    UserName = 'frxetiquetas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_alfabeta=cod_alfabeta'
      'NRO_TROQUEL=NRO_TROQUEL'
      'COD_BARRASPRI=COD_BARRASPRI'
      'NOM_LARGO=NOM_LARGO'
      'COD_IVA=COD_IVA'
      'CAN_STK=CAN_STK'
      'PRECIO=PRECIO'
      'DESCUENTO=DESCUENTO'
      'PRECIO_TOTAL=PRECIO_TOTAL'
      'RUBRO=RUBRO'
      'DESCUENTOOS=DESCUENTOOS'
      'DESCUENTOCO1=DESCUENTOCO1'
      'DESCUENTOCO2=DESCUENTOCO2'
      'COD_LABORATORIO=COD_LABORATORIO')
    DataSource = dsetiquetas
    BCDToCurrency = False
    Left = 248
    Top = 568
  end
  object reporteetiquetas: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42618.544030810200000000
    ReportOptions.LastChange = 42618.639292824080000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 321
    Top = 568
    Datasets = <
      item
        DataSet = frxetiquetas
        DataSetName = 'frxetiquetas'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 4
      ColumnWidth = 49.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '49'
        '98'
        '147')
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 185.196970000000000000
        DataSet = frxetiquetas
        DataSetName = 'frxetiquetas'
        RowCount = 0
        object Shape1: TfrxShapeView
          Left = 1.779530000000000000
          Top = 1.000000000000000000
          Width = 181.417440000000000000
          Height = 86.929190000000000000
        end
        object Memo1: TfrxMemoView
          Left = 3.559060000000000000
          Top = 22.456710000000000000
          Width = 30.236240000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '$')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 2.000000000000000000
          Top = 64.252010000000000000
          Width = 181.417440000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line2: TfrxLineView
          Left = 2.000000000000000000
          Top = 18.897650000000000000
          Width = 181.417440000000000000
          Color = clBlack
          Diagonal = True
        end
        object frxetiquetasPRECIO: TfrxMemoView
          Left = 37.795300000000000000
          Top = 22.677180000000000000
          Width = 117.165430000000000000
          Height = 37.795300000000000000
          DataField = 'PRECIO'
          DataSet = frxetiquetas
          DataSetName = 'frxetiquetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxetiquetas."PRECIO"]')
          ParentFont = False
          WordWrap = False
          Wysiwyg = False
        end
        object frxetiquetasNOM_LARGO: TfrxMemoView
          Left = 6.559060000000000000
          Top = 2.779530000000001000
          Width = 173.858282360000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          DataField = 'NOM_LARGO'
          DataSet = frxetiquetas
          DataSetName = 'frxetiquetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxetiquetas."NOM_LARGO"]')
          ParentFont = False
          WordBreak = True
          WordWrap = False
        end
        object frxetiquetasCOD_BARRASPRI: TfrxMemoView
          Left = 5.000000000000000000
          Top = 68.031540000000010000
          Width = 170.078850000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          DataField = 'COD_BARRASPRI'
          DataSet = frxetiquetas
          DataSetName = 'frxetiquetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxetiquetas."COD_BARRASPRI"]')
          ParentFont = False
          WordBreak = True
        end
      end
    end
  end
  object basecfg: TIBDatabase
    DatabaseName = 'C:\BASEPRUEBA\farmbase\fwdat.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=nmpnet'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 144
    Top = 421
  end
  object qcaja: TIBQuery
    Database = basecfg
    Transaction = trancaja
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 28
    Top = 424
  end
  object trancaja: TIBTransaction
    DefaultDatabase = basecfg
    Left = 80
    Top = 480
  end
  object qlimite: TIBQuery
    Database = databasefire
    Transaction = tranlimite
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select '
      'CAN_MAXUNIDXREC,'
      'CAN_MAXUNIDXREN,'
      'CAN_MAXUNIDXTICKET,'
      'CAN_MAXRENXTICKET'
      'from osmalimites O, PRMATAMANO P'
      'where O.COD_TAMANO=P.COD_TAMANO'
      'AND cod_planos=:plan and tip_tratamiento=:tratamiento')
    Left = 240
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'plan'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tratamiento'
        ParamType = ptUnknown
      end>
    object qlimiteCAN_MAXUNIDXREC: TSmallintField
      FieldName = 'CAN_MAXUNIDXREC'
      Origin = '"OSMALIMITES"."CAN_MAXUNIDXREC"'
    end
    object qlimiteCAN_MAXUNIDXREN: TSmallintField
      FieldName = 'CAN_MAXUNIDXREN'
      Origin = '"OSMALIMITES"."CAN_MAXUNIDXREN"'
    end
    object qlimiteCAN_MAXUNIDXTICKET: TSmallintField
      FieldName = 'CAN_MAXUNIDXTICKET'
      Origin = '"OSMALIMITES"."CAN_MAXUNIDXTICKET"'
    end
    object qlimiteCAN_MAXRENXTICKET: TSmallintField
      FieldName = 'CAN_MAXRENXTICKET'
      Origin = '"OSMALIMITES"."CAN_MAXRENXTICKET"'
    end
  end
  object tranlimite: TIBTransaction
    DefaultDatabase = databasefire
    Left = 240
    Top = 304
  end
  object qdire: TIBQuery
    Database = databasefire
    Transaction = transdire
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select des_direccion from sumasucursal where nro_sucursal=:sucur' +
        'sal')
    Left = 236
    Top = 364
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sucursal'
        ParamType = ptUnknown
      end>
    object qdireDES_DIRECCION: TIBStringField
      FieldName = 'DES_DIRECCION'
      Origin = '"SUMASUCURSAL"."DES_DIRECCION"'
      Size = 40
    end
  end
  object transdire: TIBTransaction
    DefaultDatabase = databasefire
    Left = 240
    Top = 416
  end
  object qcuit: TIBQuery
    Database = databasefire
    Transaction = tcuit
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select nro_cuit from sumasucursal where nro_sucursal=:sucursal')
    Left = 248
    Top = 189
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sucursal'
        ParamType = ptUnknown
      end>
    object qcuitNRO_CUIT: TIBStringField
      FieldName = 'NRO_CUIT'
      Origin = '"SUMASUCURSAL"."NRO_CUIT"'
      Size = 13
    end
  end
  object tcuit: TIBTransaction
    DefaultDatabase = databasefire
    Left = 245
    Top = 138
  end
  object cdsreporteiva: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 648
    Top = 936
    object cdsreporteivafecha: TDateField
      FieldName = 'fecha'
    end
    object cdsreporteivacomprobante: TStringField
      FieldName = 'comprobante'
      Size = 40
    end
    object cdsreporteivadescripcion: TStringField
      DisplayWidth = 30
      FieldName = 'descripcion'
      Size = 30
    end
    object cdsreporteivacliente: TStringField
      FieldName = 'cliente'
    end
    object cdsreporteivacuit: TStringField
      FieldName = 'cuit'
    end
    object cdsreporteivanetogravado: TCurrencyField
      FieldName = 'netogravado'
    end
    object cdsreporteivatasa: TFloatField
      FieldName = 'tasa'
    end
    object cdsreporteivaimporteiva: TCurrencyField
      FieldName = 'importeiva'
    end
    object cdsreporteivanogravado: TCurrencyField
      FieldName = 'nogravado'
    end
    object cdsreporteivapercepcionibb: TFloatField
      FieldName = 'percepcionibb'
    end
    object cdsreporteivatotal: TCurrencyField
      FieldName = 'total'
    end
  end
  object qreporteiva: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      'SUBSTR(v.nro_comprobante, 1, 2) as puestoventa,'
      'min(v.nro_comprobante)as minimo,'
      'MAX(v.nro_comprobante)as maximo,'
      'v.tip_comprobante,'
      't.des_comp,'
      ''
      'case when t.mar_letra='#39'A'#39' then c.nro_cuit else NULL end as cuit,'
      
        'case when t.mar_letra='#39'A'#39' then V.nom_cliente else '#39'CONSUMIDOR FI' +
        'NAL'#39' end as cliente,'
      ''
      'cast(fec_comprobante as date) as fecha,'
      'max(i.por_porcentaje) as por_porcentaje,'
      ''
      'SUM (cast(v.imp_bruto as decimal(10,3))) as bruto,'
      'sum(cast(i.imp_iva+i.imp_iva_desc as decimal(10,3)))  as iva,'
      
        'sum(case when i.por_porcentaje>0 then (cast(i.imp_netograv+i.imp' +
        '_netograv_desc as decimal(10,3))) end )  as netogravado,'
      
        'sum(case when i.por_porcentaje=0 then (cast(i.imp_netograv+i.imp' +
        '_netograv_desc as decimal(10,3))) end ) as netonogravado,'
      'sum(cast(i.imp_netograv_desc as decimal(10,3))) as netogravdesc,'
      
        'sum(cast(i.imp_iva_desc+i.imp_iva+i.imp_netograv+i.imp_netograv_' +
        'desc as decimal(10,3))) as total'
      ''
      'from vtmacomprobemitido v'
      
        'inner join vtmatipcomprob t on v.tip_comprobante=t.tip_comproban' +
        'te'
      'left join mkmacliente c on v.cod_cliente=c.cod_cliente'
      
        'inner join vtmaporcentajesiva i  on i.tip_comprobante=t.tip_comp' +
        'robante and  v.nro_comprobante=i.nro_comprobante and v.nro_sucur' +
        'sal=i.nro_sucursal,'
      'sumasucursal s'
      'where'
      'v.nro_sucursal=s.nro_sucursal'
      'and'
      's.nro_sucursal=i.nro_sucursal'
      'and'
      
        ' (CAST(v.fec_comprobante AS DATE))  between (:desde) and (:hasta' +
        ')'
      
        'and (cast(:NroSucursalesSeleccion as varchar(222))) Containing '#39 +
        '#'#39' ||  v.NRO_SUCURSAL || '#39'#'#39
      ''
      ''
      'AND T.MAR_SUBDIA = '#39'V'#39
      
        'anD t.tip_comprobante  NOT IN ('#39'NCT'#39','#39'NCA'#39','#39'NCM'#39','#39'IA0'#39','#39'IA1'#39','#39'IA' +
        '2'#39','#39'IA3'#39','#39'IA4'#39','#39'RA6'#39','#39'IA5'#39','#39'IA6'#39','#39'IA7'#39','#39'IA8'#39','#39'IA9'#39','#39'IAD'#39','#39'IAF'#39','#39 +
        'IAG'#39','#39'IAH'#39','#39'IAI'#39','#39'IAJ'#39','#39'IAK'#39','#39'TA0'#39','#39'TA1'#39','#39'TA2'#39','#39'TA3'#39','#39'TA4'#39','#39'TA5'#39 +
        ','#39'TA6'#39','#39'TA7'#39','#39'TA8'#39','#39'TA9'#39','#39'TAD'#39','#39'TAF'#39','#39'TAG'#39','#39'TAE'#39','#39'TAH'#39','#39'TAI'#39','#39'TA' +
        'J'#39','#39'TAK'#39','#39'IV0'#39','#39'IV1'#39','#39'IV2'#39','#39'IV3'#39','#39'IV4'#39','#39'IV5'#39','#39'IV6'#39','#39'IV8'#39','#39'IV7'#39','#39 +
        'IV9'#39','#39'IVD'#39','#39'IVG'#39','#39'IVF'#39','#39'IVJ'#39','#39'TKM'#39')'
      'group by 1,4,5,6,7,8'
      ''
      ''
      'union all'
      ''
      'select'
      'SUBSTR(v.nro_comprobante, 1, 2) as puestoventa,'
      'min(v.nro_comprobante)as minimo,'
      'MAX(v.nro_comprobante)as maximo,'
      'v.tip_comprobante,'
      't.des_comp,'
      '--i.por_porcentaje,'
      ''
      'case when t.mar_letra='#39'A'#39' then c.nro_cuit else NULL end as cuit,'
      
        'case when t.mar_letra='#39'A'#39' then V.nom_cliente else '#39'CONSUMIDOR FI' +
        'NAL'#39' end as cliente,'
      ''
      
        'cast(fec_comprobante as date) as fecha,                --(cast(i' +
        '.imp_iva+i.imp_iva_desc as decimal(10,3)))*100  as iva'
      'max(i.por_porcentaje) as por_porcentaje,'
      
        'sum(case when t.tip_comprobante in ('#39'NCT'#39','#39'NCA'#39','#39'NCM'#39') THEN cast' +
        '(v.imp_bruto*-1 as decimal (10,3)) ELSE cast(V.IMP_BRUTO as deci' +
        'mal (10,3)) END )as bruto,'
      
        'sum(case when t.tip_comprobante in ('#39'NCT'#39','#39'NCA'#39','#39'NCM'#39') THEN (cas' +
        't(i.imp_iva+i.imp_iva_desc as decimal (10,3)))*-1 ELSE (cast(i.i' +
        'mp_iva+i.imp_iva_desc as decimal (10,3))) END) as iva,'
      
        'sum(case when i.por_porcentaje>0 then (case when t.tip_comproban' +
        'te in ('#39'NCT'#39','#39'NCA'#39','#39'NCM'#39') THEN (cast(i.imp_netograv+i.imp_netogr' +
        'av_desc as decimal (10,3))*-1) ELSE (cast(i.imp_netograv+i.imp_n' +
        'etograv_desc as decimal (10,3))) END) end )as netogravado,'
      
        'sum(case when i.por_porcentaje=0 then (case when t.tip_comproban' +
        'te in ('#39'NCT'#39','#39'NCA'#39','#39'NCM'#39') THEN (cast(i.imp_netograv+i.imp_netogr' +
        'av_desc as decimal (10,3))*-1) ELSE (cast(i.imp_netograv+i.imp_n' +
        'etograv_desc as decimal (10,3))) END) end) as netonogravado,'
      
        'sum(case when t.tip_comprobante in ('#39'NCT'#39','#39'NCA'#39','#39'NCM'#39') THEN (cas' +
        't(i.imp_netograv_desc as decimal (10,3))*-1) ELSE (cast(i.imp_ne' +
        'tograv_desc as decimal (10,3)))END )as netogravdesc,'
      
        'sum((case when t.tip_comprobante in ('#39'NCT'#39','#39'NCA'#39','#39'NCM'#39') THEN -1 ' +
        'else 1 end)* (cast(i.imp_iva_desc+i.imp_iva+i.imp_netograv+i.imp' +
        '_netograv_desc as decimal(10,3)))) as total'
      ''
      'from vtmacomprobemitido v'
      
        'inner join vtmatipcomprob t on v.tip_comprobante=t.tip_comproban' +
        'te'
      'left join mkmacliente c on v.cod_cliente=c.cod_cliente'
      
        'inner join vtmaporcentajesiva i  on i.tip_comprobante=t.tip_comp' +
        'robante and  v.nro_comprobante=i.nro_comprobante and v.nro_sucur' +
        'sal=i.nro_sucursal,'
      'sumasucursal s'
      ''
      'where'
      'v.nro_sucursal=s.nro_sucursal'
      'and'
      's.nro_sucursal=i.nro_sucursal'
      'and'
      
        ' (CAST(v.fec_comprobante AS DATE))  between (:desde) and (:hasta' +
        ')'
      
        'and (cast(:NroSucursalesSeleccion as varchar(222)))  Containing ' +
        #39'#'#39' || v.NRO_SUCURSAL || '#39'#'#39
      ''
      'AND T.MAR_SUBDIA = '#39'V'#39
      
        'anD t.tip_comprobante IN ('#39'NCT'#39','#39'NCA'#39','#39'NCM'#39','#39'IA0'#39','#39'IA1'#39','#39'IA2'#39','#39'I' +
        'A3'#39','#39'IA4'#39','#39'IA5'#39','#39'IA6'#39','#39'RA6'#39','#39'IA7'#39','#39'IA8'#39','#39'IA9'#39','#39'IAD'#39','#39'IAF'#39','#39'IAG'#39',' +
        #39'IAH'#39','#39'IAI'#39','#39'IAJ'#39','#39'IAK'#39','#39'TA0'#39','#39'TA1'#39','#39'TA2'#39','#39'TA3'#39','#39'TA4'#39','#39'TA5'#39','#39'TA6' +
        #39','#39'TA7'#39','#39'TA8'#39','#39'TA9'#39','#39'TAD'#39','#39'TAF'#39','#39'TAG'#39','#39'TAE'#39','#39'TAH'#39','#39'TAI'#39','#39'TAJ'#39','#39'T' +
        'AK'#39','#39'IV0'#39','#39'IV1'#39','#39'IV2'#39','#39'IV3'#39','#39'IV4'#39','#39'IV5'#39','#39'IV6'#39','#39'IV7'#39','#39'IV8'#39','#39'IV9'#39',' +
        #39'IVD'#39','#39'IVG'#39','#39'IVF'#39','#39'IVJ'#39','#39'TKM'#39')'
      'group by 1,4,5,6,7,8'
      ''
      'order by 8')
    Left = 664
    Top = 872
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
        Name = 'NroSucursalesSeleccion'
        ParamType = ptUnknown
      end
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
        Name = 'NroSucursalesSeleccion'
        ParamType = ptUnknown
      end>
    object qreporteivaPUESTOVENTA: TIBStringField
      FieldName = 'PUESTOVENTA'
      ProviderFlags = []
      Size = 80
    end
    object qreporteivaMINIMO: TFloatField
      FieldName = 'MINIMO'
      ProviderFlags = []
    end
    object qreporteivaMAXIMO: TFloatField
      FieldName = 'MAXIMO'
      ProviderFlags = []
    end
    object qreporteivaTIP_COMPROBANTE: TIBStringField
      FieldName = 'TIP_COMPROBANTE'
      Origin = '"VTMACOMPROBEMITIDO"."TIP_COMPROBANTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qreporteivaPOR_PORCENTAJE: TIBBCDField
      FieldName = 'POR_PORCENTAJE'
      Origin = '"VTMAPORCENTAJESIVA"."POR_PORCENTAJE"'
      Precision = 9
      Size = 3
    end
    object qreporteivaCUIT: TIBStringField
      FieldName = 'CUIT'
      ProviderFlags = []
      Size = 13
    end
    object qreporteivaCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      ProviderFlags = []
      Size = 40
    end
    object qreporteivaFECHA: TDateField
      FieldName = 'FECHA'
      ProviderFlags = []
    end
    object qreporteivaBRUTO: TIBBCDField
      FieldName = 'BRUTO'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qreporteivaIVA: TIBBCDField
      FieldName = 'IVA'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qreporteivaNETOGRAVADO: TIBBCDField
      FieldName = 'NETOGRAVADO'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qreporteivaNETONOGRAVADO: TIBBCDField
      FieldName = 'NETONOGRAVADO'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qreporteivaNETOGRAVDESC: TIBBCDField
      FieldName = 'NETOGRAVDESC'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qreporteivaTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qreporteivaDES_COMP: TIBStringField
      FieldName = 'DES_COMP'
      Origin = '"VTMATIPCOMPROB"."DES_COMP"'
      Required = True
      Size = 30
    end
  end
  object tranreporteiva: TIBTransaction
    DefaultDatabase = databasefire
    Left = 736
    Top = 872
  end
  object dsreporteiva: TDataSource
    DataSet = cdsreporteiva
    Left = 784
    Top = 936
  end
  object qdroga: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select des_droga from prmamonodroga where des_droga like :droga')
    Left = 160
    Top = 308
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'droga'
        ParamType = ptUnknown
      end>
    object qdrogaDES_DROGA: TIBStringField
      FieldName = 'DES_DROGA'
      Origin = '"PRMAMONODROGA"."DES_DROGA"'
      Size = 50
    end
  end
  object dsdroga: TDataSource
    DataSet = qdroga
    Left = 192
    Top = 304
  end
  object qranking: TIBQuery
    Database = databasefire
    Transaction = tranking
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 36
    Top = 640
  end
  object tranking: TIBTransaction
    DefaultDatabase = databasefire
    Left = 96
    Top = 640
  end
  object reportekardex: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42933.923150219900000000
    ReportOptions.LastChange = 42941.644464340280000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 393
    Top = 600
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Kardex de movimientos')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 740.409927000000000000
        Child = reportekardex.Child1
        object Memo2: TfrxMemoView
          Width = 740.787401574802900000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object frxDBDataset2NOM_LARGO: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779529999999990000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'NOM_LARGO'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Memo.UTF8W = (
            '[frxDBDataset2."NOM_LARGO"]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 196.535560000000000000
        Width = 740.409927000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object frxDBDataset2FEC_MOVIMIENTO: TfrxMemoView
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'FEC_MOVIMIENTO'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Memo.UTF8W = (
            '[frxDBDataset2."FEC_MOVIMIENTO"]')
        end
        object frxDBDataset2TIP_COMPROBANTE: TfrxMemoView
          Left = 154.960730000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'TIP_COMPROBANTE'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Memo.UTF8W = (
            '[frxDBDataset2."TIP_COMPROBANTE"]')
        end
        object frxDBDataset2NRO_COMPROBANTE: TfrxMemoView
          Left = 335.023810000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'NRO_COMPROBANTE'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Memo.UTF8W = (
            '[frxDBDataset2."NRO_COMPROBANTE"]')
        end
        object frxDBDataset2STK_INICIAL: TfrxMemoView
          Left = 433.291590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'STK_INICIAL'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Memo.UTF8W = (
            '[frxDBDataset2."STK_INICIAL"]')
        end
        object frxDBDataset2MOVIMIENTOS: TfrxMemoView
          Left = 527.779840000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MOVIMIENTOS'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Memo.UTF8W = (
            '[frxDBDataset2."MOVIMIENTOS"]')
        end
        object frxDBDataset2STK_FINAL: TfrxMemoView
          Left = 626.047620000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'STK_FINAL'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Memo.UTF8W = (
            '[frxDBDataset2."STK_FINAL"]')
        end
        object Memo12: TfrxMemoView
          Left = 215.653680000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'NOM_VENDEDOR'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Memo.UTF8W = (
            '[frxDBDataset2."NOM_VENDEDOR"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 275.905690000000000000
        Width = 740.409927000000000000
        object Memo3: TfrxMemoView
          Align = baWidth
          Width = 740.409927000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo4: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo5: TfrxMemoView
          Align = baRight
          Left = 664.819327000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 113.385900000000000000
        Width = 740.409927000000000000
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Fecha')
        end
        object Memo7: TfrxMemoView
          Left = 132.283550000000000000
          Top = 3.779529999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Tipo Comp.')
        end
        object Memo8: TfrxMemoView
          Left = 335.023810000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Nro. Compr.')
        end
        object Memo9: TfrxMemoView
          Left = 429.512060000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Stk. Inicial')
        end
        object Memo10: TfrxMemoView
          Left = 527.779840000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Movimientos')
        end
        object Memo11: TfrxMemoView
          Left = 626.047620000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Stk. Final')
        end
        object Memo13: TfrxMemoView
          Left = 215.653680000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Vendedor')
        end
      end
    end
  end
  object qkardex: TIBQuery
    Database = databasefire
    Transaction = tranking
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT'
      '                                              pro.nom_largo,'
      '                    mov.FEC_MOVIMIENTO ,'
      
        '                                              mov.TIP_COMPROBANT' +
        'E,'
      
        '                                              mov.NRO_COMPROBANT' +
        'E,'
      '                                              mov.STK_INICIAL,'
      '                                              mov.MOVIMIENTOS,'
      '                                              mov.STK_FINAL,'
      '                                              ven.nom_vendedor'
      ''
      
        '                                              FROM movstock mov ' +
        ', prmaproducto pro , vtmacomprobemitido vta, vtmavendedor  ven'
      
        '                                              WHERE mov.cod_alfa' +
        'beta=pro.cod_alfabeta and vta.nro_comprobante=mov.nro_comprobant' +
        'e and ven.cod_vendedor=vta.cod_vendedor'
      '                    and pro.COD_ALFABETA=:ALFABETA'
      
        '                    AND CAST (FEC_MOVIMIENTO AS DATE) BETWEEN :D' +
        'ESDE AND :HASTA')
    Left = 220
    Top = 632
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ALFABETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HASTA'
        ParamType = ptUnknown
      end>
    object qkardexFEC_MOVIMIENTO: TDateTimeField
      FieldName = 'FEC_MOVIMIENTO'
      Origin = '"MOVSTOCK"."FEC_MOVIMIENTO"'
      Required = True
    end
    object qkardexTIP_COMPROBANTE: TIBStringField
      FieldName = 'TIP_COMPROBANTE'
      Origin = '"MOVSTOCK"."TIP_COMPROBANTE"'
      Size = 3
    end
    object qkardexNRO_COMPROBANTE: TFloatField
      FieldName = 'NRO_COMPROBANTE'
      Origin = '"MOVSTOCK"."NRO_COMPROBANTE"'
    end
    object qkardexSTK_INICIAL: TSmallintField
      FieldName = 'STK_INICIAL'
      Origin = '"MOVSTOCK"."STK_INICIAL"'
    end
    object qkardexMOVIMIENTOS: TSmallintField
      FieldName = 'MOVIMIENTOS'
      Origin = '"MOVSTOCK"."MOVIMIENTOS"'
    end
    object qkardexSTK_FINAL: TSmallintField
      FieldName = 'STK_FINAL'
      Origin = '"MOVSTOCK"."STK_FINAL"'
    end
    object qkardexNOM_LARGO: TIBStringField
      FieldName = 'NOM_LARGO'
      Origin = '"PRMAPRODUCTO"."NOM_LARGO"'
      Size = 100
    end
    object qkardexNOM_VENDEDOR: TIBStringField
      FieldName = 'NOM_VENDEDOR'
      Origin = '"VTMAVENDEDOR"."NOM_VENDEDOR"'
      Size = 40
    end
  end
  object dskardex: TDataSource
    DataSet = qkardex
    Left = 312
    Top = 640
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FEC_MOVIMIENTO=FEC_MOVIMIENTO'
      'TIP_COMPROBANTE=TIP_COMPROBANTE'
      'NRO_COMPROBANTE=NRO_COMPROBANTE'
      'STK_INICIAL=STK_INICIAL'
      'MOVIMIENTOS=MOVIMIENTOS'
      'STK_FINAL=STK_FINAL'
      'NOM_LARGO=NOM_LARGO'
      'NOM_VENDEDOR=NOM_VENDEDOR')
    DataSource = dskardex
    BCDToCurrency = False
    Left = 216
    Top = 696
  end
  object qbusquedacomprob: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      'v.tip_comprobante,'
      'v.nro_comprobante,'
      'v.cod_vendedor,'
      'v.nro_caja,'
      'v.fec_comprobante,'
      'v.can_items,'
      'v.imp_neto,'
      'v.imp_bruto,'
      'v.nom_cliente,'
      'v.cod_cliente,'
      'O.imp_cargoos,'
      'O.cod_planos,'
      'O.nom_obrasocial,'
      'O.fec_receta,'
      'O.nom_afiliado,'
      'O.nro_matriculA,'
      'osma.mar_obrasocial'
      
        'from vtmacomprobemitido v left join  osmamovobrasocial o  on  v.' +
        'nro_comprobante=o.nro_comprob AND v.tip_comprobante=o.tip_compro' +
        'b'
      'left join osmaplanesos osma on osma.cod_planos=o.cod_planos'
      'where v.nro_Comprobante=:NUMERO'
      ' AND v.TIP_COMPROBANTE=:TIPO')
    Left = 576
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end>
    object qbusquedacomprobTIP_COMPROBANTE: TIBStringField
      FieldName = 'TIP_COMPROBANTE'
      Origin = '"VTMACOMPROBEMITIDO"."TIP_COMPROBANTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qbusquedacomprobNRO_COMPROBANTE: TFloatField
      FieldName = 'NRO_COMPROBANTE'
      Origin = '"VTMACOMPROBEMITIDO"."NRO_COMPROBANTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qbusquedacomprobCOD_VENDEDOR: TIBStringField
      FieldName = 'COD_VENDEDOR'
      Origin = '"VTMACOMPROBEMITIDO"."COD_VENDEDOR"'
      Required = True
      Size = 3
    end
    object qbusquedacomprobNRO_CAJA: TSmallintField
      FieldName = 'NRO_CAJA'
      Origin = '"VTMACOMPROBEMITIDO"."NRO_CAJA"'
    end
    object qbusquedacomprobFEC_COMPROBANTE: TDateTimeField
      FieldName = 'FEC_COMPROBANTE'
      Origin = '"VTMACOMPROBEMITIDO"."FEC_COMPROBANTE"'
    end
    object qbusquedacomprobCAN_ITEMS: TSmallintField
      FieldName = 'CAN_ITEMS'
      Origin = '"VTMACOMPROBEMITIDO"."CAN_ITEMS"'
    end
    object qbusquedacomprobIMP_NETO: TIBBCDField
      FieldName = 'IMP_NETO'
      Origin = '"VTMACOMPROBEMITIDO"."IMP_NETO"'
      Precision = 18
      Size = 3
    end
    object qbusquedacomprobIMP_BRUTO: TIBBCDField
      FieldName = 'IMP_BRUTO'
      Origin = '"VTMACOMPROBEMITIDO"."IMP_BRUTO"'
      Precision = 18
      Size = 3
    end
    object qbusquedacomprobNOM_CLIENTE: TIBStringField
      FieldName = 'NOM_CLIENTE'
      Origin = '"VTMACOMPROBEMITIDO"."NOM_CLIENTE"'
      Size = 40
    end
    object qbusquedacomprobCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"VTMACOMPROBEMITIDO"."COD_CLIENTE"'
    end
    object qbusquedacomprobIMP_CARGOOS: TIBBCDField
      FieldName = 'IMP_CARGOOS'
      Origin = '"OSMAMOVOBRASOCIAL"."IMP_CARGOOS"'
      Precision = 18
      Size = 3
    end
    object qbusquedacomprobCOD_PLANOS: TIBStringField
      FieldName = 'COD_PLANOS'
      Origin = '"OSMAMOVOBRASOCIAL"."COD_PLANOS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object qbusquedacomprobNOM_OBRASOCIAL: TIBStringField
      FieldName = 'NOM_OBRASOCIAL'
      Origin = '"OSMAMOVOBRASOCIAL"."NOM_OBRASOCIAL"'
      Size = 50
    end
    object qbusquedacomprobFEC_RECETA: TDateTimeField
      FieldName = 'FEC_RECETA'
      Origin = '"OSMAMOVOBRASOCIAL"."FEC_RECETA"'
    end
    object qbusquedacomprobNOM_AFILIADO: TIBStringField
      FieldName = 'NOM_AFILIADO'
      Origin = '"OSMAMOVOBRASOCIAL"."NOM_AFILIADO"'
      Size = 50
    end
    object qbusquedacomprobNRO_MATRICULA: TIBStringField
      FieldName = 'NRO_MATRICULA'
      Origin = '"OSMAMOVOBRASOCIAL"."NRO_MATRICULA"'
      Size = 30
    end
    object qbusquedacomprobMAR_OBRASOCIAL: TIBStringField
      FieldName = 'MAR_OBRASOCIAL'
      Origin = '"OSMAPLANESOS"."MAR_OBRASOCIAL"'
      Size = 1
    end
  end
  object dsbusquedacomprob: TDataSource
    DataSet = cdsbusquedacomprob
    Left = 576
    Top = 528
  end
  object qosmamovobrasocial: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      'v.cod_alfabeta,'
      'v.nro_item,'
      't.nom_largo,'
      'v.can_cantidad,'
      'v.imp_unitario,'
      'v.imp_prodneto,'
      'c.imp_descuento,'
      'c.por_descuento'
      ''
      ''
      ''
      'from vtmadetallecomprob v'
      'inner join prmaproducto t on v.cod_alfabeta=t.cod_alfabeta'
      
        'left join osmadetallemov c on v.nro_comprobante=c.nro_comprob an' +
        'd v.tip_comprobante=c.tip_comprob'
      ''
      ''
      'where v.tip_comprobante=:tipo'
      'and v.nro_comprobante=:comprobante')
    Left = 576
    Top = 576
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'comprobante'
        ParamType = ptUnknown
      end>
    object qosmamovobrasocialCOD_ALFABETA: TIntegerField
      FieldName = 'COD_ALFABETA'
      Origin = '"VTMADETALLECOMPROB"."COD_ALFABETA"'
    end
    object qosmamovobrasocialNRO_ITEM: TSmallintField
      FieldName = 'NRO_ITEM'
      Origin = '"VTMADETALLECOMPROB"."NRO_ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qosmamovobrasocialNOM_LARGO: TIBStringField
      FieldName = 'NOM_LARGO'
      Origin = '"PRMAPRODUCTO"."NOM_LARGO"'
      Size = 100
    end
    object qosmamovobrasocialCAN_CANTIDAD: TSmallintField
      FieldName = 'CAN_CANTIDAD'
      Origin = '"VTMADETALLECOMPROB"."CAN_CANTIDAD"'
    end
    object qosmamovobrasocialIMP_UNITARIO: TIBBCDField
      FieldName = 'IMP_UNITARIO'
      Origin = '"VTMADETALLECOMPROB"."IMP_UNITARIO"'
      Precision = 18
      Size = 3
    end
    object qosmamovobrasocialIMP_PRODNETO: TIBBCDField
      FieldName = 'IMP_PRODNETO'
      Origin = '"VTMADETALLECOMPROB"."IMP_PRODNETO"'
      Precision = 18
      Size = 3
    end
    object qosmamovobrasocialIMP_DESCUENTO: TIBBCDField
      FieldName = 'IMP_DESCUENTO'
      Origin = '"OSMADETALLEMOV"."IMP_DESCUENTO"'
      Precision = 18
      Size = 3
    end
    object qosmamovobrasocialPOR_DESCUENTO: TIBBCDField
      FieldName = 'POR_DESCUENTO'
      Origin = '"OSMADETALLEMOV"."POR_DESCUENTO"'
      Precision = 9
      Size = 3
    end
  end
  object qcuitcliente: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      'tip_comprobante,'
      'nro_comprobante,'
      'cod_vendedor,'
      'nro_caja,'
      'fec_comprobante,'
      'can_items,'
      'imp_neto,'
      'imp_bruto,'
      'nom_cliente,'
      'cod_cliente '
      'from vtmacomprobemitido'
      'where nro_Comprobante=:NUMERO'
      'AND TIP_COMPROBANTE=:TIPO')
    Left = 496
    Top = 576
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end>
  end
  object cdsbusquedacomprob: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 632
    object cdsbusquedacomprobTIP_COMPROBANTE: TStringField
      FieldName = 'TIP_ COMPROBANTE'
    end
    object cdsbusquedacomprobNRO_COMPROBANTE: TStringField
      FieldName = 'NRO_COMPROBANTE'
    end
    object cdsbusquedacomprobCOD_VENDEDOR: TStringField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsbusquedacomprobNRO_CAJA: TStringField
      FieldName = 'NRO_CAJA'
    end
    object cdsbusquedacomprobFEC_COMPROBANTE: TStringField
      FieldName = 'FEC_COMPROBANTE'
    end
    object cdsbusquedacomprobCAN_ITEMS: TStringField
      FieldName = 'CAN_ITEMS'
    end
    object cdsbusquedacomprobIMP_NETO: TStringField
      FieldName = 'IMP_NETO'
    end
    object cdsbusquedacomprobIMP_BRUTO: TStringField
      FieldName = 'IMP_BRUTO'
    end
    object cdsbusquedacomprobNOM_CLIENTE: TStringField
      FieldName = 'NOM_CLIENTE'
    end
    object cdsbusquedacomprobCOD_CLIENTE: TStringField
      FieldName = 'COD_CLIENTE'
    end
    object cdsbusquedacomprobIMP_CARGOOS: TStringField
      FieldName = 'IMP_CARGOOS'
    end
    object cdsbusquedacomprobCOD_PLANOS: TStringField
      FieldName = 'COD_PLANOS'
    end
    object cdsbusquedacomprobNOM_OBRASOCIAL: TStringField
      FieldName = 'NOM_OBRASOCIAL'
    end
    object cdsbusquedacomprobFEC_RECETA: TStringField
      FieldName = 'FEC_RECETA'
    end
    object cdsbusquedacomprobNOM_AFILIADO: TStringField
      FieldName = 'NOM_AFILIADO'
    end
    object cdsbusquedacomprobNRO_MATRICULA: TStringField
      FieldName = 'NRO_MATRICULA'
    end
    object cdsbusquedacomprobMAR_OBRASOCIAL: TStringField
      FieldName = 'MAR_OBRASOCIAL'
    end
  end
  object cdsosmamovobrasocial: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 584
    object cdsosmamovobrasocialCOD_ALFABETA: TStringField
      FieldName = 'COD_ALFABETA'
    end
    object cdsosmamovobrasocialNRO_ITEM: TStringField
      FieldName = 'NRO_ITEM'
    end
    object cdsosmamovobrasocialNOM_LARGO: TStringField
      FieldName = 'NOM_LARGO'
    end
    object cdsosmamovobrasocialCAN_CANTIDAD: TStringField
      FieldName = 'CAN_CANTIDAD'
    end
    object cdsosmamovobrasocialIMP_UNITARIO: TStringField
      FieldName = 'IMP_UNITARIO'
    end
    object cdsosmamovobrasocialIMP_PRODNETO: TStringField
      FieldName = 'IMP_PRODNETO'
    end
    object cdsosmamovobrasocialIMP_DESCUENTO: TStringField
      FieldName = 'IMP_DESCUENTO'
    end
    object cdsosmamovobrasocialPOR_DESCUENTO: TStringField
      FieldName = 'POR_DESCUENTO'
    end
  end
  object dsdetalle: TDataSource
    DataSet = cdsosmamovobrasocial
    Left = 576
    Top = 680
  end
  object qbusquedastock: TIBQuery
    Database = databasefire
    Transaction = ticomprobante
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select can_stk from prmastock where cod_Alfabeta=:codigo and nro' +
        '_sucursal=:sucursal')
    Left = 712
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sucursal'
        ParamType = ptUnknown
      end>
  end
  object qcomprobantenf: TIBQuery
    Database = databasefire
    Transaction = tpanel1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select TIP_COMPROBANTE, TIP_IMPRE, des_comp from vtmatipcomprob ' +
        'where MAR_TIPOPROCESO='#39'T'#39' and tip_comprobante=:comprobante')
    Left = 352
    Top = 333
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'comprobante'
        ParamType = ptUnknown
      end>
    object IBStringField1: TIBStringField
      FieldName = 'TIP_COMPROBANTE'
      Origin = '"VTMATIPCOMPROB"."TIP_COMPROBANTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBStringField2: TIBStringField
      FieldName = 'TIP_IMPRE'
      Origin = '"VTMATIPCOMPROB"."TIP_IMPRE"'
      Size = 1
    end
    object qcomprobantenfDES_COMP: TIBStringField
      FieldName = 'DES_COMP'
      Origin = '"VTMATIPCOMPROB"."DES_COMP"'
      Required = True
      Size = 30
    end
  end
  object dstipcomprobantenf: TDataSource
    DataSet = qcomprobantenf
    Left = 416
    Top = 280
  end
  object qmodif: TIBQuery
    Database = databasefire
    Transaction = tranking
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      'vt.tip_comprobante,'
      'v.nro_comprobante,'
      'ven.nom_vendedor,'
      'vt.nom_producto,'
      'vt.imp_unitario,'
      'vt.can_cantidad,'
      'cast(vt.aud_fec_Alta as date)'
      
        'from vtmadetallecomprob vt, vtmacomprobemitido v, vtmavendedor v' +
        'en'
      ' where vt.nro_comprobante=v.nro_comprobante'
      ' and vt.nro_sucursal=v.nro_sucursal'
      ' and vt.tip_comprobante=v.tip_comprobante'
      ' and v.cod_vendedor=ven.cod_vendedor'
      ''
      ' and vt.mar_modif='#39'S'#39
      ' and cast(vt.aud_fec_Alta as date)=:fecha')
    Left = 44
    Top = 736
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
    object qmodifTIP_COMPROBANTE: TIBStringField
      FieldName = 'TIP_COMPROBANTE'
      Origin = '"VTMADETALLECOMPROB"."TIP_COMPROBANTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qmodifNRO_COMPROBANTE: TFloatField
      FieldName = 'NRO_COMPROBANTE'
      Origin = '"VTMACOMPROBEMITIDO"."NRO_COMPROBANTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qmodifNOM_VENDEDOR: TIBStringField
      FieldName = 'NOM_VENDEDOR'
      Origin = '"VTMAVENDEDOR"."NOM_VENDEDOR"'
      Size = 40
    end
    object qmodifNOM_PRODUCTO: TIBStringField
      FieldName = 'NOM_PRODUCTO'
      Origin = '"VTMADETALLECOMPROB"."NOM_PRODUCTO"'
      Size = 100
    end
    object qmodifIMP_UNITARIO: TIBBCDField
      FieldName = 'IMP_UNITARIO'
      Origin = '"VTMADETALLECOMPROB"."IMP_UNITARIO"'
      Precision = 18
      Size = 3
    end
    object qmodifCAN_CANTIDAD: TSmallintField
      FieldName = 'CAN_CANTIDAD'
      Origin = '"VTMADETALLECOMPROB"."CAN_CANTIDAD"'
    end
    object qmodifCAST: TDateField
      FieldName = 'CAST'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsmodif: TDataSource
    DataSet = qmodif
    Left = 104
    Top = 736
  end
  object reportemodif: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43038.684452569400000000
    ReportOptions.LastChange = 43039.416611828700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 113
    Top = 784
    Datasets = <
      item
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 75.590600000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 196.535560000000000000
          Top = 30.236240000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'REPORTE MODIFICACIONES DE PRECIOS')
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Fecha:')
        end
        object frxDBDataset3CAST: TfrxMemoView
          Left = 52.913420000000000000
          Top = 56.692950000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'CAST'
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          Memo.UTF8W = (
            '[frxDBDataset3."CAST"]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
        RowCount = 0
        object frxDBDataset3TIP_COMPROBANTE: TfrxMemoView
          Left = 3.779530000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataField = 'TIP_COMPROBANTE'
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset3."TIP_COMPROBANTE"]')
          ParentFont = False
        end
        object frxDBDataset3NRO_COMPROBANTE: TfrxMemoView
          Left = 39.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'NRO_COMPROBANTE'
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset3."NRO_COMPROBANTE"]')
          ParentFont = False
        end
        object frxDBDataset3NOM_VENDEDOR: TfrxMemoView
          Left = 120.944960000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DataField = 'NOM_VENDEDOR'
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset3."NOM_VENDEDOR"]')
          ParentFont = False
        end
        object frxDBDataset3NOM_PRODUCTO: TfrxMemoView
          Left = 321.260050000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          DataField = 'NOM_PRODUCTO'
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset3."NOM_PRODUCTO"]')
          ParentFont = False
        end
        object frxDBDataset3IMP_UNITARIO: TfrxMemoView
          Left = 566.929500000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'IMP_UNITARIO'
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset3."IMP_UNITARIO"]')
          ParentFont = False
        end
        object frxDBDataset3CAN_CANTIDAD: TfrxMemoView
          Left = 661.417750000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'CAN_CANTIDAD'
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          Memo.UTF8W = (
            '[frxDBDataset3."CAN_CANTIDAD"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Comprobante')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 151.181200000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Vendedor')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 321.260050000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Producto')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 551.811380000000000000
          Top = 3.779530000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Importe modificado')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 653.858690000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Cantidad')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
        end
      end
    end
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TIP_COMPROBANTE=TIP_COMPROBANTE'
      'NRO_COMPROBANTE=NRO_COMPROBANTE'
      'NOM_VENDEDOR=NOM_VENDEDOR'
      'NOM_PRODUCTO=NOM_PRODUCTO'
      'IMP_UNITARIO=IMP_UNITARIO'
      'CAN_CANTIDAD=CAN_CANTIDAD'
      'CAST=CAST')
    DataSource = dsmodif
    BCDToCurrency = False
    Left = 40
    Top = 784
  end
  object qinsertlineastock: TIBQuery
    Database = databasefire
    Transaction = ticomprobante
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select can_stk from prmastock where cod_Alfabeta=:codigo and nro' +
        '_sucursal=:sucursal')
    Left = 792
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sucursal'
        ParamType = ptUnknown
      end>
  end
  object qstock: TIBQuery
    Database = databasefire
    Transaction = transtock
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 820
    Top = 672
  end
  object dsstock: TDataSource
    DataSet = qstock
    Left = 872
    Top = 664
  end
  object transtock: TIBTransaction
    DefaultDatabase = databasefire
    Left = 48
    Top = 920
  end
  object frxstock: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_barraspri=cod_barraspri'
      'nom_largo=nom_largo'
      'cantidad=cantidad')
    DataSet = cdsstock
    BCDToCurrency = False
    Left = 40
    Top = 976
  end
  object frxreportestock: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43129.609960300900000000
    ReportOptions.LastChange = 43722.439613807870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 121
    Top = 976
    Datasets = <
      item
        DataSet = frxstock
        DataSetName = 'frxDBDataset'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 64.252010000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Left = 238.110390000000000000
          Top = 15.118120000000000000
          Width = 287.244280000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Bitstream Vera Sans Mono'
          Font.Style = []
          Memo.UTF8W = (
            'Reporte Stock')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897637800000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = frxstock
        DataSetName = 'frxDBDataset'
        RowCount = 0
        object frxDBDatasetcod_barraspri: TfrxMemoView
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          DataField = 'cod_barraspri'
          DataSet = frxstock
          DataSetName = 'frxDBDataset'
          Memo.UTF8W = (
            '[frxDBDataset."cod_barraspri"]')
        end
        object frxDBDatasetnom_largo: TfrxMemoView
          Left = 204.094620000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataField = 'nom_largo'
          DataSet = frxstock
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset."nom_largo"]')
          ParentFont = False
        end
        object frxDBDatasetcantidad: TfrxMemoView
          Left = 536.693260000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DataSet = frxstock
          DataSetName = 'frxDBDataset'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Memo.UTF8W = (
            '[frxDBDataset."cantidad"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 328.819110000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 638.740570000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 143.622140000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Codigo de barras')
        end
        object Memo3: TfrxMemoView
          Left = 204.094620000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Nombre producto')
        end
        object Memo4: TfrxMemoView
          Left = 536.693260000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Stock')
        end
        object Line1: TfrxLineView
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 540.994104480000000000
          Top = 0.912300340000000000
          Width = 163.692747590000000000
          Height = 17.985349660000000000
          Memo.UTF8W = (
            '[SUM(<frxDBDataset."cantidad">)]')
        end
        object Memo7: TfrxMemoView
          Left = 3.433614830000000000
          Top = 2.526197930000000000
          Width = 534.217016210000000000
          Height = 15.639434480000000000
          Memo.UTF8W = (
            'Cantidad Total:')
        end
        object Line2: TfrxLineView
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object cdsstock: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 753
    Top = 688
    object cdsstockcod_barraspri: TStringField
      DisplayWidth = 20
      FieldName = 'cod_barraspri'
    end
    object cdsstocknom_largo: TStringField
      FieldName = 'nom_largo'
      Size = 50
    end
    object cdsstockcantidad: TIntegerField
      FieldName = 'cantidad'
    end
  end
  object qtablaiva: TIBQuery
    Database = databasefire
    Transaction = tpanel1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select cod_iva, por_iva from prmaiva')
    Left = 624
    Top = 213
  end
  object ibtcajanombre: TIBTransaction
    Left = 216
    Top = 768
  end
  object Dcajanombre: TDataSource
    DataSet = cdcaja
    Left = 216
    Top = 816
  end
  object ibcajanombre: TIBQuery
    Transaction = ibtcajanombre
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
    Left = 216
    Top = 864
    object ibcajanombreNRO_CAJA: TSmallintField
      DisplayWidth = 5
      FieldName = 'NRO_CAJA'
      Origin = '"CJMAAPERTURA"."NRO_CAJA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ibcajanombreDES_CAJA: TIBStringField
      DisplayWidth = 20
      FieldName = 'DES_CAJA'
      Origin = '"CJMACAJA"."DES_CAJA"'
      Size = 50
    end
  end
  object cdcaja: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 288
    Top = 835
    object cdcajacaja: TStringField
      FieldName = 'caja'
    end
  end
  object frxreportecaja: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43241.408327638900000000
    ReportOptions.LastChange = 45673.599354166670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 305
    Top = 976
    Datasets = <
      item
        DataSet = frxcaja
        DataSetName = 'frxDBDatasetCAJA'
      end
      item
        DataSet = frxDdzetas
        DataSetName = 'frxDdzetas'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftRight]
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Shape1: TfrxShapeView
          Left = 0.779530000000000000
          Width = 740.787880000000000000
          Height = 34.015770000000000000
          Fill.BackColor = clSilver
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 257.008040000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Cierre de caja')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 24.677180000000000000
        Top = 933.543910000000000000
        Width = 740.409927000000000000
        DataSet = frxDdzetas
        DataSetName = 'frxDdzetas'
        RowCount = 0
        object Line10: TfrxLineView
          Left = -0.779530000000000000
          Top = 20.897650000000000000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frxDdzetaszeta: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'zeta'
          DataSet = frxDdzetas
          DataSetName = 'frxDdzetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDdzetas."zeta"]')
          ParentFont = False
        end
        object frxDdzetasimporte: TfrxMemoView
          Left = 117.165430000000000000
          Top = 1.000000000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'importe'
          DataSet = frxDdzetas
          DataSetName = 'frxDdzetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDdzetas."importe"]')
          ParentFont = False
        end
        object frxDdzetastestigo: TfrxMemoView
          Left = 222.992270000000000000
          Top = 1.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'testigo'
          DataSet = frxDdzetas
          DataSetName = 'frxDdzetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDdzetas."testigo"]')
          ParentFont = False
        end
        object frxDdzetasdiferenciazeta: TfrxMemoView
          Left = 340.157700000000000000
          Top = 1.000000000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'diferenciazeta'
          DataSet = frxDdzetas
          DataSetName = 'frxDdzetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDdzetas."diferenciazeta"]')
          ParentFont = False
        end
        object frxDdzetasiva: TfrxMemoView
          Left = 444.205010000000000000
          Top = 1.000000000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'iva'
          DataSet = frxDdzetas
          DataSetName = 'frxDdzetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDdzetas."iva"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 753.346940000000000000
        Top = 75.590600000000000000
        Width = 740.409927000000000000
        object Memo29: TfrxMemoView
          Left = 7.559060000000000000
          Top = 663.433520000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 20000')
          ParentFont = False
        end
        object frxDBDatasetefotras: TfrxMemoView
          Left = 98.267780000000000000
          Top = 682.331170000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'efotras'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."efotras"]')
          ParentFont = False
        end
        object frxDBDatasetEFECTIVOSIS: TfrxMemoView
          Left = 113.385900000000000000
          Top = 51.031540000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataField = 'EFECTIVOSIS'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."EFECTIVOSIS"]')
        end
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000010000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nombre de caja:')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 24.677180000000000000
          Width = 733.228820000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Left = 7.559060000000000000
          Top = 51.031540000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Efectivo')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 77.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tarjeta')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 7.559060000000000000
          Top = 105.504020000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cheque')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 153.078850000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 113.385900000000000000
          Top = 28.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Sistema')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 262.787570000000000000
          Top = 28.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'S. envia')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 411.968770000000000000
          Top = 28.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Diferencia')
          ParentFont = False
        end
        object frxDBDatasetTARJETASIS: TfrxMemoView
          Left = 113.385900000000000000
          Top = 77.488250000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataField = 'TARJETASIS'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."TARJETASIS"]')
          ParentFont = False
        end
        object frxDBDatasetTOTALSIS: TfrxMemoView
          Left = 113.385900000000000000
          Top = 153.078850000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataField = 'TOTALSIS'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."TOTALSIS"]')
          ParentFont = False
        end
        object frxDBDatasetCHEQUESIS: TfrxMemoView
          Left = 115.165430000000000000
          Top = 104.944960000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataField = 'CHEQUESIS'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."CHEQUESIS"]')
          ParentFont = False
        end
        object frxDBDatasetEFECTIVO: TfrxMemoView
          Left = 262.228510000000000000
          Top = 51.811070000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'EFECTIVO'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."EFECTIVO"]')
          ParentFont = False
        end
        object frxDBDatasetTARJETA: TfrxMemoView
          Left = 262.787570000000000000
          Top = 77.267780000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'TARJETA'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."TARJETA"]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 3.779530000000000000
          Top = 48.252010000000000000
          Width = 733.228820000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frxDBDatasetTOTAL: TfrxMemoView
          Left = 260.787570000000000000
          Top = 153.078850000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."TOTAL"]')
          ParentFont = False
        end
        object frxDBDatasetDIFERENCIA: TfrxMemoView
          Left = 411.968770000000000000
          Top = 153.078850000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'DIFERENCIA'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."DIFERENCIA"]')
        end
        object Line4: TfrxLineView
          Top = 176.315090000000000000
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 7.559060000000000000
          Top = 199.874150000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cuenta corriente')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 7.559060000000000000
          Top = 280.992270000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Gastos')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 7.559060000000000000
          Top = 300.448980000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Notas de credito B')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 7.559060000000000000
          Top = 321.685220000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Notas de credito A')
          ParentFont = False
        end
        object frxDBDatasetCuentac: TfrxMemoView
          Left = 147.401670000000000000
          Top = 199.874150000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'Cuentac'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."Cuentac"]')
        end
        object frxDBDatasetgastos: TfrxMemoView
          Left = 148.842610000000000000
          Top = 280.992270000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'gastos'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."gastos"]')
        end
        object Memo15: TfrxMemoView
          Left = 147.401670000000000000
          Top = 178.653680000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Importe')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 302.362400000000000000
          Top = 178.653680000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cantidad')
          ParentFont = False
        end
        object frxDBDatasetnctb: TfrxMemoView
          Left = 147.401670000000000000
          Top = 301.244280000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'nctb'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."nctb"]')
        end
        object frxDBDatasetnca: TfrxMemoView
          Left = 147.401670000000000000
          Top = 321.700990000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'nca'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."nca"]')
        end
        object frxDBDatasetcantidadnct: TfrxMemoView
          Left = 302.362400000000000000
          Top = 297.669450000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'cantidadnct'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."cantidadnct"]')
        end
        object frxDBDatasetcantidadnca: TfrxMemoView
          Left = 302.362400000000000000
          Top = 324.126160000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'cantidadnca'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."cantidadnca"]')
        end
        object frxDBDatasetcheque: TfrxMemoView
          Left = 261.787570000000000000
          Top = 104.165430000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'cheque'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."cheque"]')
        end
        object Line5: TfrxLineView
          Top = 345.157700000000000000
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo17: TfrxMemoView
          Left = 7.559060000000000000
          Top = 348.937230000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Efectivo contado detalle')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 7.559060000000000000
          Top = 375.393940000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Billetes')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 7.559060000000000000
          Top = 401.850650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 1')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 7.559060000000000000
          Top = 420.527830000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 2')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 7.559060000000000000
          Top = 439.205010000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 5')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 7.559060000000000000
          Top = 458.661720000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 10')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 7.559060000000000000
          Top = 478.338900000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 20')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 7.559060000000000000
          Top = 498.016080000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 50')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 7.559060000000000000
          Top = 517.693260000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 100')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 7.559060000000000000
          Top = 537.370440000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 200')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 7.559060000000000000
          Top = 557.047620000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 500')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 7.559060000000000000
          Top = 575.724800000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 1000')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 98.267780000000000000
          Top = 375.393940000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cantidad')
          ParentFont = False
        end
        object frxDBDatasetef1: TfrxMemoView
          Left = 98.267780000000000000
          Top = 401.850650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ef1'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef1"]')
          ParentFont = False
        end
        object frxDBDatasetef2: TfrxMemoView
          Left = 98.267780000000000000
          Top = 420.527830000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ef2'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef2"]')
          ParentFont = False
        end
        object frxDBDatasetef5: TfrxMemoView
          Left = 98.267780000000000000
          Top = 439.205010000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ef5'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef5"]')
          ParentFont = False
        end
        object frxDBDatasetef10: TfrxMemoView
          Left = 98.267780000000000000
          Top = 458.661720000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ef10'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef10"]')
          ParentFont = False
        end
        object frxDBDatasetef20: TfrxMemoView
          Left = 98.267780000000000000
          Top = 478.338900000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ef20'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef20"]')
          ParentFont = False
        end
        object frxDBDatasetef50: TfrxMemoView
          Left = 98.267780000000000000
          Top = 498.016080000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ef50'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef50"]')
          ParentFont = False
        end
        object frxDBDatasetef100: TfrxMemoView
          Left = 98.267780000000000000
          Top = 517.693260000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ef100'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef100"]')
          ParentFont = False
        end
        object frxDBDatasetef200: TfrxMemoView
          Left = 98.267780000000000000
          Top = 537.370440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ef200'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef200"]')
          ParentFont = False
        end
        object frxDBDatasetef500: TfrxMemoView
          Left = 98.267780000000000000
          Top = 557.047620000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ef500'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef500"]')
          ParentFont = False
        end
        object frxDBDatasetef1000: TfrxMemoView
          Left = 98.267780000000000000
          Top = 575.724800000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ef1000'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef1000"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 230.551330000000000000
          Top = 348.937230000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tarjeta detalle')
          ParentFont = False
        end
        object Line6: TfrxLineView
          Left = 204.094620000000000000
          Top = 344.157700000000000000
          Height = 275.905690000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo32: TfrxMemoView
          Left = 215.433210000000000000
          Top = 375.393940000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tarjetas')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 215.433210000000000000
          Top = 401.850650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Visa')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 215.433210000000000000
          Top = 420.527830000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Maestro')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 215.433210000000000000
          Top = 439.205010000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Mastercard')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 215.433210000000000000
          Top = 458.661720000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Naranja')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 215.433210000000000000
          Top = 478.338900000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Electron')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 215.433210000000000000
          Top = 498.016080000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cabal')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 215.433210000000000000
          Top = 517.693260000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'American')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 215.433210000000000000
          Top = 537.370440000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tdf')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 215.433210000000000000
          Top = 579.063390000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Otras')
          ParentFont = False
        end
        object frxDBDatasettarvisa: TfrxMemoView
          Left = 317.480520000000000000
          Top = 401.850650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'tarvisa'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."tarvisa"]')
          ParentFont = False
        end
        object frxDBDatasettarmaestro: TfrxMemoView
          Left = 317.480520000000000000
          Top = 420.527830000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'tarmaestro'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."tarmaestro"]')
          ParentFont = False
        end
        object frxDBDatasettarmastercard: TfrxMemoView
          Left = 317.480520000000000000
          Top = 439.205010000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'tarmastercard'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."tarmastercard"]')
          ParentFont = False
        end
        object frxDBDatasettarnaranja: TfrxMemoView
          Left = 317.480520000000000000
          Top = 458.661720000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'tarnaranja'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."tarnaranja"]')
          ParentFont = False
        end
        object frxDBDatasettarelectron: TfrxMemoView
          Left = 317.480520000000000000
          Top = 478.338900000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'tarelectron'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."tarelectron"]')
          ParentFont = False
        end
        object frxDBDatasettarcabal: TfrxMemoView
          Left = 317.480520000000000000
          Top = 498.016080000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'tarcabal'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."tarcabal"]')
          ParentFont = False
        end
        object frxDBDatasettartdf1: TfrxMemoView
          Left = 317.480520000000000000
          Top = 537.370440000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'tartdf'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."tartdf"]')
          ParentFont = False
        end
        object frxDBDatasettarotras: TfrxMemoView
          Left = 317.480520000000000000
          Top = 578.063390000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'tarotras'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."tarotras"]')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Left = 457.323130000000000000
          Top = 345.157700000000000000
          Height = 408.189240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo42: TfrxMemoView
          Left = 464.882190000000000000
          Top = 348.937230000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Comentarios')
          ParentFont = False
        end
        object frxDBDatasetcomentarios: TfrxMemoView
          Left = 480.000310000000000000
          Top = 379.173470000000000000
          Width = 222.992270000000000000
          Height = 241.889920000000000000
          DataField = 'comentarios'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."comentarios"]')
        end
        object Memo43: TfrxMemoView
          Left = 275.905690000000000000
          Top = 3.779529999999990000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fecha desde:')
          ParentFont = False
        end
        object frxDBDatasetfechadesde: TfrxMemoView
          Left = 370.393940000000000000
          Top = 3.779529999999990000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataField = 'fechadesde'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."fechadesde"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 514.016080000000000000
          Top = 4.779530000000010000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'hasta')
          ParentFont = False
        end
        object frxDBDatasetfechahasta: TfrxMemoView
          Left = 574.488560000000000000
          Top = 3.779529999999990000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'fechahasta'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."fechahasta"]')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Top = 702.858690000000000000
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frxDBDatasetCAJACAJA: TfrxMemoView
          Left = 117.165430000000000000
          Top = 3.779529999999990000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DataField = 'CAJA'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."CAJA"]')
        end
        object frxDBDatasetCAJAtaramerican: TfrxMemoView
          Left = 317.480520000000000000
          Top = 520.118430000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'taramerican'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."taramerican"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 215.433210000000000000
          Top = 559.472790000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nativa')
          ParentFont = False
        end
        object frxDBDatasetCAJAtarnativa: TfrxMemoView
          Left = 317.480520000000000000
          Top = 559.472790000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'tarnativa'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."tarnativa"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 0.220470000000000000
          Top = 370.260050000000000000
          Width = 737.008350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          Top = 396.716760000000000000
          Width = 457.323130000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frxDBDatasetCAJApagoscc: TfrxMemoView
          Left = 147.401670000000000000
          Top = 220.889920000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'pagoscc'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."pagoscc"]')
        end
        object frxDBDatasetCAJAboni: TfrxMemoView
          Left = 147.401670000000000000
          Top = 240.126160000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'boni'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."boni"]')
        end
        object frxDBDatasetCAJAos: TfrxMemoView
          Left = 147.401670000000000000
          Top = 261.362400000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'os'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."os"]')
        end
        object Memo49: TfrxMemoView
          Left = 7.559060000000000000
          Top = 221.889920000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Pagos CC.')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 7.559060000000000000
          Top = 242.126160000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bonificaciones OS.')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 7.559060000000000000
          Top = 261.362400000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Obras sociales')
          ParentFont = False
        end
        object frxDBDatasetCAJAdolarenviado: TfrxMemoView
          Left = 11.338590000000000000
          Top = 729.449290000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'dolarenviado'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."dolarenviado"]')
          ParentFont = False
        end
        object frxDBDatasetCAJAdolarcambio: TfrxMemoView
          Left = 109.606370000000000000
          Top = 729.449290000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'dolarcambio'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."dolarcambio"]')
          ParentFont = False
        end
        object frxDBDatasetCAJAeuroenviado: TfrxMemoView
          Left = 215.433210000000000000
          Top = 729.449290000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'euroenviado'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."euroenviado"]')
          ParentFont = False
        end
        object frxDBDatasetCAJAeurocambio: TfrxMemoView
          Left = 309.921460000000000000
          Top = 729.449290000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'eurocambio'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."eurocambio"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 3.779530000000000000
          Top = 710.551640000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dolares enviados')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 105.826840000000000000
          Top = 710.551640000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cambio tomado')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 207.874150000000000000
          Top = 710.551640000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Euros enviados')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 309.921460000000000000
          Top = 710.551640000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cambio tomado')
          ParentFont = False
        end
        object Line12: TfrxLineView
          Left = 204.094620000000000000
          Top = 620.842920000000000000
          Height = 132.283550000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo57: TfrxMemoView
          Left = 215.433210000000000000
          Top = 597.165740000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'QR')
          ParentFont = False
        end
        object frxDBDatasetCAJAtarqr: TfrxMemoView
          Left = 317.480520000000000000
          Top = 600.945270000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'tarqr'
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."tarqr"]')
          ParentFont = False
        end
        object frxDBDatasetCAJAef2000: TfrxMemoView
          Left = 98.267780000000000000
          Top = 593.386210000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataField = 'ef2000'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef2000"]')
        end
        object Memo58: TfrxMemoView
          Left = 7.559060000000000000
          Top = 597.165740000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 2000')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 7.559060000000000000
          Top = 616.063390000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 5000')
          ParentFont = False
        end
        object frxDBDatasetCAJAef5000: TfrxMemoView
          Left = 98.267780000000000000
          Top = 612.283860000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ef5000'
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef5000"]')
        end
        object Memo60: TfrxMemoView
          Left = 7.559060000000000000
          Top = 132.283550000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Gentilezas')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 113.385900000000000000
          Top = 132.283550000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."gentilezas"]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 7.559060000000000000
          Top = 638.740570000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ 10000')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 98.267780000000000000
          Top = 634.961040000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDatasetCAJA'
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef10000"]')
        end
        object Memo64: TfrxMemoView
          Left = 7.559060000000000000
          Top = 680.315400000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $ Otras')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 98.267780000000000000
          Top = 661.417750000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxcaja
          DataSetName = 'frxDBDatasetCAJA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetCAJA."ef20000"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 22.677167800000000000
        Top = 888.189550000000000000
        Width = 740.409927000000000000
        object Memo45: TfrxMemoView
          Left = 11.338590000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Zeta')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 117.165430000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Importe')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 226.771800000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Testigo')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 336.378170000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Diferencia zeta')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 449.764070000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Impuestos')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Left = -1.165430000000010000
          Top = 19.897650000000000000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object cdsreportecaja: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 265
    Top = 928
    object cdsreportecajaCAJA: TStringField
      FieldName = 'CAJA'
    end
    object cdsreportecajaEFECTIVOSIS: TFloatField
      FieldName = 'EFECTIVOSIS'
    end
    object cdsreportecajaTARJETASIS: TFloatField
      FieldName = 'TARJETASIS'
    end
    object cdsreportecajaTOTALSIS: TFloatField
      FieldName = 'TOTALSIS'
    end
    object cdsreportecajaDIFERENCIA: TFloatField
      FieldName = 'DIFERENCIA'
    end
    object cdsreportecajaEFECTIVO: TFloatField
      FieldName = 'EFECTIVO'
    end
    object cdsreportecajaTARJETA: TFloatField
      FieldName = 'TARJETA'
    end
    object cdsreportecajaCHEQUESIS: TFloatField
      FieldName = 'CHEQUESIS'
    end
    object cdsreportecajaTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object cdsreportecajaCuentac: TFloatField
      FieldName = 'Cuentac'
    end
    object cdsreportecajagastos: TFloatField
      FieldName = 'gastos'
    end
    object cdsreportecajanctb: TFloatField
      FieldName = 'nctb'
    end
    object cdsreportecajanca: TFloatField
      FieldName = 'nca'
    end
    object cdsreportecajacantidadnct: TFloatField
      FieldName = 'cantidadnct'
    end
    object cdsreportecajacantidadnca: TFloatField
      FieldName = 'cantidadnca'
    end
    object cdsreportecajacheque: TFloatField
      FieldName = 'cheque'
    end
    object cdsreportecajatarvisa: TStringField
      DisplayWidth = 20
      FieldName = 'tarvisa'
    end
    object cdsreportecajatarmaestro: TStringField
      FieldName = 'tarmaestro'
    end
    object cdsreportecajatarmastercard: TStringField
      FieldName = 'tarmastercard'
    end
    object cdsreportecajatarnaranja: TStringField
      FieldName = 'tarnaranja'
    end
    object cdsreportecajatarelectron: TStringField
      FieldName = 'tarelectron'
    end
    object cdsreportecajatarcabal: TStringField
      FieldName = 'tarcabal'
    end
    object cdsreportecajataramerican: TStringField
      FieldName = 'taramerican'
    end
    object cdsreportecajatartdf: TStringField
      FieldName = 'tartdf'
    end
    object cdsreportecajatarotras: TStringField
      FieldName = 'tarotras'
    end
    object cdsreportecajacomentarios: TStringField
      FieldName = 'comentarios'
      Size = 255
    end
    object cdsreportecajafechadesde: TDateField
      FieldName = 'fechadesde'
    end
    object cdsreportecajafechahasta: TDateField
      FieldName = 'fechahasta'
    end
    object cdsreportecajazeta: TStringField
      FieldName = 'zeta'
    end
    object cdsreportecajaimporte: TStringField
      FieldName = 'importe'
    end
    object cdsreportecajatestigo: TStringField
      FieldName = 'testigo'
    end
    object cdsreportecajadiferenciazeta: TStringField
      FieldName = 'diferenciazeta'
    end
    object cdsreportecajaef1: TStringField
      FieldName = 'ef1'
    end
    object cdsreportecajaef2: TStringField
      FieldName = 'ef2'
    end
    object cdsreportecajaef5: TStringField
      FieldName = 'ef5'
    end
    object cdsreportecajaef10: TStringField
      FieldName = 'ef10'
    end
    object cdsreportecajaef20: TStringField
      FieldName = 'ef20'
    end
    object cdsreportecajaef50: TStringField
      FieldName = 'ef50'
    end
    object cdsreportecajaef100: TStringField
      FieldName = 'ef100'
    end
    object cdsreportecajaef200: TStringField
      FieldName = 'ef200'
    end
    object cdsreportecajaef500: TStringField
      FieldName = 'ef500'
    end
    object cdsreportecajaef1000: TStringField
      FieldName = 'ef1000'
    end
    object cdsreportecajaef2000: TStringField
      FieldName = 'ef2000'
    end
    object cdsreportecajaef5000: TStringField
      FieldName = 'ef5000'
    end
    object cdsreportecajaefotras: TStringField
      FieldName = 'efotras'
    end
    object cdsreportecajatarnativa: TStringField
      FieldName = 'tarnativa'
    end
    object cdsreportecajapagoscc: TFloatField
      FieldName = 'pagoscc'
    end
    object cdsreportecajaos: TFloatField
      FieldName = 'os'
    end
    object cdsreportecajaboni: TFloatField
      FieldName = 'boni'
    end
    object cdsreportecajadolarenviado: TFloatField
      FieldName = 'dolarenviado'
    end
    object cdsreportecajadolarcambio: TFloatField
      FieldName = 'dolarcambio'
    end
    object cdsreportecajaeuroenviado: TFloatField
      FieldName = 'euroenviado'
    end
    object cdsreportecajaeurocambio: TFloatField
      FieldName = 'eurocambio'
    end
    object cdsreportecajatarqr: TStringField
      FieldName = 'tarqr'
    end
    object cdsreportecajagentilezas: TFloatField
      FieldName = 'gentilezas'
    end
    object cdsreportecajaef10000: TStringField
      FieldName = 'ef10000'
    end
    object cdsreportecajaef20000: TIntegerField
      FieldName = 'ef20000'
    end
  end
  object cdszetas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 473
    Top = 936
    object cdszetaszeta: TStringField
      FieldName = 'zeta'
    end
    object cdszetasimporte: TStringField
      FieldName = 'importe'
    end
    object cdszetastestigo: TStringField
      FieldName = 'testigo'
    end
    object cdszetasdiferenciazeta: TStringField
      FieldName = 'diferenciazeta'
    end
    object cdszetasiva: TStringField
      FieldName = 'iva'
    end
  end
  object frxDdzetas: TfrxDBDataset
    UserName = 'frxDdzetas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'zeta=zeta'
      'importe=importe'
      'testigo=testigo'
      'diferenciazeta=diferenciazeta'
      'iva=iva')
    DataSet = cdszetas
    BCDToCurrency = False
    Left = 432
    Top = 984
  end
  object cdsiva: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 721
    Top = 936
    object cdsivafecha: TDateField
      FieldName = 'fecha'
    end
    object cdsivacomprobante: TStringField
      FieldName = 'comprobante'
      Size = 40
    end
    object cdsivadescripcion: TStringField
      FieldName = 'descripcion'
      Size = 30
    end
    object cdsivacliente: TStringField
      FieldName = 'cliente'
    end
    object cdsivacuit: TStringField
      FieldName = 'cuit'
    end
    object cdsivanetogravado: TFloatField
      FieldName = 'netogravado'
    end
    object cdsivatasa: TIntegerField
      FieldName = 'tasa'
    end
    object cdsivaimporteiva: TFloatField
      FieldName = 'importeiva'
    end
    object cdsivanogravado: TFloatField
      FieldName = 'nogravado'
    end
    object cdsivapercepcionibb: TIntegerField
      FieldName = 'percepcionibb'
    end
    object cdsivatotal: TFloatField
      FieldName = 'total'
    end
    object cdsivafdesde: TDateField
      FieldName = 'fdesde'
    end
    object cdsivafhasta: TDateField
      FieldName = 'fhasta'
    end
    object cdsivacuitsucursal: TStringField
      FieldName = 'cuitsucursal'
    end
    object cdsivarazonsocial: TStringField
      FieldName = 'razonsocial'
    end
    object cdsivadireccion: TStringField
      FieldName = 'direccion'
    end
    object cdsivaiibb: TStringField
      FieldName = 'iibb'
    end
  end
  object frxiva: TfrxDBDataset
    UserName = 'frxiva'
    CloseDataSource = False
    FieldAliases.Strings = (
      'fecha=fecha'
      'comprobante=comprobante'
      'descripcion=descripcion'
      'cliente=cliente'
      'cuit=cuit'
      'netogravado=netogravado'
      'tasa=tasa'
      'importeiva=importeiva'
      'nogravado=nogravado'
      'percepcionibb=percepcionibb'
      'total=TOTAL'
      'fdesde=fdesde'
      'fhasta=fhasta'
      'cuitsucursal=cuitsucursal'
      'razonsocial=razonsocial'
      'direccion=direccion'
      'iibb=iibb')
    DataSet = cdsiva
    BCDToCurrency = False
    Left = 656
    Top = 984
  end
  object frxivareporte: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43251.444047013900000000
    ReportOptions.LastChange = 43255.414499178240000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 737
    Top = 984
    Datasets = <
      item
        DataSet = frxiva
        DataSetName = 'frxiva'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 170.078850000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo16: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Razon social:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 3.779530000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CUIT:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 3.779530000000000000
          Top = 41.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'IIBB:')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 740.787880000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'N'#186' de establecimiento:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 740.787880000000000000
          Top = 18.897650000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Domicilio:')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 381.732530000000000000
          Top = 79.370130000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Subdiario IVA Ventas')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 249.448980000000000000
          Top = 138.063080000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Desde:')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 430.866420000000000000
          Top = 138.842610000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hasta:')
          ParentFont = False
        end
        object frxivafdesde: TfrxMemoView
          Left = 325.039580000000000000
          Top = 139.842610000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'fdesde'
          DataSet = frxiva
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."fdesde"]')
          ParentFont = False
        end
        object frxivafhasta: TfrxMemoView
          Left = 498.897960000000000000
          Top = 139.842610000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'fhasta'
          DataSet = frxiva
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."fhasta"]')
          ParentFont = False
        end
        object frxivacuitsucursal: TfrxMemoView
          Left = 102.047310000000000000
          Top = 22.677180000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'cuitsucursal'
          DataSet = frxiva
          DataSetName = 'frxiva'
          Memo.UTF8W = (
            '[frxiva."cuitsucursal"]')
        end
        object frxivarazonsocial: TfrxMemoView
          Left = 105.826840000000000000
          Top = 3.779530000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'razonsocial'
          DataSet = frxiva
          DataSetName = 'frxiva'
          Memo.UTF8W = (
            '[frxiva."razonsocial"]')
        end
        object frxivadireccion: TfrxMemoView
          Left = 827.717070000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'direccion'
          DataSet = frxiva
          DataSetName = 'frxiva'
          Memo.UTF8W = (
            '[frxiva."direccion"]')
        end
        object frxivaiibb: TfrxMemoView
          Left = 102.047310000000000000
          Top = 41.574830000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'iibb'
          DataSet = frxiva
          DataSetName = 'frxiva'
          Memo.UTF8W = (
            '[frxiva."iibb"]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 306.141930000000000000
        Width = 1046.929810000000000000
        DataSet = frxiva
        DataSetName = 'frxiva'
        RowCount = 0
        object frxivafecha: TfrxMemoView
          Left = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'fecha'
          DataSet = frxiva
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."fecha"]')
          ParentFont = False
        end
        object frxivacomprobante: TfrxMemoView
          Left = 78.929190000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DataField = 'comprobante'
          DataSet = frxiva
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."comprobante"]')
          ParentFont = False
        end
        object frxivanetogravado: TfrxMemoView
          Left = 619.842920000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DataField = 'netogravado'
          DataSet = frxiva
          DataSetName = 'frxiva'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."netogravado"]')
          ParentFont = False
        end
        object frxivatasa: TfrxMemoView
          Left = 688.992580000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DataField = 'tasa'
          DataSet = frxiva
          DataSetName = 'frxiva'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."tasa"]')
          ParentFont = False
        end
        object frxivaimporteiva: TfrxMemoView
          Left = 758.142240000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DataField = 'importeiva'
          DataSet = frxiva
          DataSetName = 'frxiva'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."importeiva"]')
          ParentFont = False
        end
        object frxivanogravado: TfrxMemoView
          Left = 827.850960000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DataField = 'nogravado'
          DataSet = frxiva
          DataSetName = 'frxiva'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."nogravado"]')
          ParentFont = False
        end
        object frxivapercepcionibb: TfrxMemoView
          Left = 898.441560000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DataField = 'percepcionibb'
          DataSet = frxiva
          DataSetName = 'frxiva'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."percepcionibb"]')
          ParentFont = False
        end
        object frxivaTOTAL: TfrxMemoView
          Left = 968.032160000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL'
          DataSet = frxiva
          DataSetName = 'frxiva'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."TOTAL"]')
          ParentFont = False
        end
        object frxivadescripcion: TfrxMemoView
          Left = 272.126160000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'descripcion'
          DataSet = frxiva
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."descripcion"]')
          ParentFont = False
        end
        object frxivacliente: TfrxMemoView
          Left = 389.291590000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'cliente'
          DataSet = frxiva
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."cliente"]')
          ParentFont = False
        end
        object frxivacuit: TfrxMemoView
          Left = 521.575140000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'cuit'
          DataSet = frxiva
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."cuit"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 430.866420000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 411.968770000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 249.448980000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Shape1: TfrxShapeView
          Width = 1043.150280000000000000
          Height = 34.015770000000000000
        end
        object Memo2: TfrxMemoView
          Left = 60.472480000000000000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Datos de comprobante')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Fecha')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 117.165430000000000000
          Top = 18.897650000000000000
          Width = 71.811070000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Numero')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 15.118120000000000000
          Width = 272.126160000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 272.685220000000000000
          Height = 34.015770000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          Left = 79.370130000000000000
          Top = 15.118120000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          Left = 389.291590000000000000
          Height = 34.015770000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Left = 389.291590000000000000
          Top = 15.118120000000000000
          Width = 230.551330000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          Left = 619.842920000000000000
          Height = 34.015770000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 517.795610000000000000
          Top = 15.118120000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          Left = 687.874460000000000000
          Height = 34.015770000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 827.717070000000000000
          Height = 34.015770000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          Left = 687.874460000000000000
          Top = 15.118120000000000000
          Width = 139.842610000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          Left = 895.748610000000000000
          Height = 34.015770000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line12: TfrxLineView
          Left = 967.559680000000000000
          Height = 34.015770000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line13: TfrxLineView
          Left = 755.906000000000000000
          Top = 15.118120000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo5: TfrxMemoView
          Left = 294.803340000000000000
          Top = 1.000000000000000000
          Width = 71.811070000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Descripcion'
            'del comprobante')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 464.882190000000000000
          Width = 128.504020000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Datos del cliente')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 434.645950000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 544.252320000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Cuit')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 634.961040000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '  Neto'
            'Gravado')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 744.567410000000000000
          Top = 1.779530000000000000
          Width = 26.456710000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'IVA')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 710.551640000000000000
          Top = 18.897650000000000000
          Width = 26.456710000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Tasa')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 759.685530000000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Importe')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 839.055660000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '   No'
            'Gravado')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 903.307670000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Percepcion'
            '    IIBB')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 975.118740000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 347.716760000000000000
        Width = 1046.929810000000000000
        object Shape2: TfrxShapeView
          Align = baBottom
          Left = 591.811380000000000000
          Width = 449.764070000000000000
          Height = 22.677180000000000000
          Frame.Style = fsAltDot
        end
        object SysMemo5: TfrxSysMemoView
          Left = 970.559680000000000000
          Top = 1.779530000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[SUM(<frxiva."TOTAL">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 833.276130000000000000
          Top = 1.779530000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[SUM(<frxiva."nogravado">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 901.307670000000000000
          Top = 1.779530000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[SUM(<frxiva."percepcionibb">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 612.283860000000000000
          Top = 1.000000000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[SUM(<frxiva."netogravado">,MasterData1)]')
          ParentFont = False
        end
        object Line15: TfrxLineView
          Left = 695.433520000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          Left = 831.496600000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          Left = 899.528140000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line19: TfrxLineView
          Left = 967.559680000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object SysMemo3: TfrxSysMemoView
          Left = 758.228820000000000000
          Top = 1.779530000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[SUM(<frxiva."importeiva">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object qsucursales: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      'SUBSTR(v.nro_comprobante, 1, 2) as puestoventa,'
      'min(v.nro_comprobante)as minimo,'
      'MAX(v.nro_comprobante)as maximo,'
      'v.tip_comprobante,'
      't.des_comp,'
      ''
      'case when t.mar_letra='#39'A'#39' then c.nro_cuit else NULL end as cuit,'
      
        'case when t.mar_letra='#39'A'#39' then V.nom_cliente else '#39'CONSUMIDOR FI' +
        'NAL'#39' end as cliente,'
      ''
      'cast(fec_comprobante as date) as fecha,'
      'max(i.por_porcentaje) as por_porcentaje,'
      ''
      'SUM (cast((v.imp_bruto) as decimal (10,2))) as bruto,'
      'sum(cast(i.imp_iva+i.imp_iva_desc as decimal(10,2)))  as iva,'
      
        'sum(case when i.por_porcentaje>0 then (cast(i.imp_netograv+i.imp' +
        '_netograv_desc as decimal(10,2))) end )  as netogravado,'
      
        'sum(case when i.por_porcentaje=0 then (cast(i.imp_netograv+i.imp' +
        '_netograv_desc as decimal(10,2))) end ) as netonogravado,'
      'sum(cast(i.imp_netograv_desc as decimal(10,2))) as netogravdesc,'
      
        'sum(cast(i.imp_iva_desc+i.imp_iva+i.imp_netograv+i.imp_netograv_' +
        'desc as decimal(10,2))) as total'
      ''
      'from vtmacomprobemitido v'
      
        'inner join vtmatipcomprob t on v.tip_comprobante=t.tip_comproban' +
        'te'
      'left join mkmacliente c on v.cod_cliente=c.cod_cliente'
      
        'inner join vtmaporcentajesiva i  on i.tip_comprobante=t.tip_comp' +
        'robante and  v.nro_comprobante=i.nro_comprobante and v.nro_sucur' +
        'sal=i.nro_sucursal,'
      'sumasucursal s'
      'where'
      'v.nro_sucursal=s.nro_sucursal'
      'and'
      's.nro_sucursal=i.nro_sucursal'
      'and'
      
        ' (CAST(v.fec_comprobante AS DATE))  between (:desde) and (:hasta' +
        ')'
      'and v.nro_sucursal=:sucursal'
      ''
      ''
      'AND T.MAR_SUBDIA = '#39'V'#39
      
        'anD t.tip_comprobante  NOT IN ('#39'NCT'#39','#39'NCA'#39','#39'IA0'#39','#39'IA1'#39','#39'IA2'#39','#39'IA' +
        '3'#39','#39'IA4'#39','#39'RA6'#39','#39'IA5'#39','#39'IA6'#39','#39'IA7'#39','#39'IA8'#39','#39'IA9'#39','#39'IAD'#39','#39'IAF'#39','#39'IAG'#39','#39 +
        'IAH'#39','#39'IAI'#39','#39'IAJ'#39','#39'IAK'#39','#39'TA0'#39','#39'TA1'#39','#39'TA2'#39','#39'TA3'#39','#39'TA4'#39','#39'TA5'#39','#39'TA6'#39 +
        ','#39'TA7'#39','#39'TA8'#39','#39'TA9'#39','#39'TAD'#39','#39'TAF'#39','#39'TAG'#39','#39'TAE'#39','#39'TAH'#39','#39'TAI'#39','#39'TAJ'#39','#39'TA' +
        'K'#39','#39'IV0'#39','#39'IV1'#39','#39'IV2'#39','#39'IV3'#39','#39'IV4'#39','#39'IV5'#39','#39'IV6'#39','#39'IV8'#39','#39'IV7'#39','#39'IV9'#39','#39 +
        'IVD'#39','#39'IVG'#39','#39'IVF'#39','#39'IVJ'#39','#39'TKM'#39')'
      'group by 1,4,5,6,7,8'
      ''
      ''
      'union all'
      ''
      'select'
      'SUBSTR(v.nro_comprobante, 1, 2) as puestoventa,'
      'min(v.nro_comprobante)as minimo,'
      'MAX(v.nro_comprobante)as maximo,'
      'v.tip_comprobante,'
      't.des_comp,'
      '--i.por_porcentaje,'
      ''
      'case when t.mar_letra='#39'A'#39' then c.nro_cuit else NULL end as cuit,'
      
        'case when t.mar_letra='#39'A'#39' then V.nom_cliente else '#39'CONSUMIDOR FI' +
        'NAL'#39' end as cliente,'
      ''
      
        'cast(fec_comprobante as date) as fecha,                --(cast(i' +
        '.imp_iva+i.imp_iva_desc as decimal(10,2)))*100  as iva'
      'max(i.por_porcentaje) as por_porcentaje,'
      
        'sum(case when t.tip_comprobante in ('#39'NCT'#39','#39'NCA'#39') THEN cast(v.imp' +
        '_bruto*-1 as decimal (10,2)) ELSE cast(V.IMP_BRUTO as decimal (1' +
        '0,2)) END )as bruto,'
      
        'sum(case when t.tip_comprobante in ('#39'NCT'#39','#39'NCA'#39') THEN (cast(i.im' +
        'p_iva+i.imp_iva_desc as decimal (10,2)))*-1 ELSE (cast(i.imp_iva' +
        '+i.imp_iva_desc as decimal (10,2))) END) as iva,'
      
        'sum(case when i.por_porcentaje>0 then (case when t.tip_comproban' +
        'te in ('#39'NCT'#39','#39'NCA'#39') THEN (cast(i.imp_netograv+i.imp_netograv_des' +
        'c as decimal (10,2))*-1) ELSE (cast(i.imp_netograv+i.imp_netogra' +
        'v_desc as decimal (10,2))) END) end )as netogravado,'
      
        'sum(case when i.por_porcentaje=0 then (case when t.tip_comproban' +
        'te in ('#39'NCT'#39','#39'NCA'#39') THEN (cast(i.imp_netograv+i.imp_netograv_des' +
        'c as decimal (10,2))*-1) ELSE (cast(i.imp_netograv+i.imp_netogra' +
        'v_desc as decimal (10,2))) END) end) as netonogravado,'
      
        'sum(case when t.tip_comprobante in ('#39'NCT'#39','#39'NCA'#39') THEN (cast(i.im' +
        'p_netograv_desc as decimal (10,2))*-1) ELSE (cast(i.imp_netograv' +
        '_desc as decimal (10,2)))END )as netogravdesc,'
      
        'sum((case when t.tip_comprobante in ('#39'NCT'#39','#39'NCA'#39') THEN -1 else 1' +
        ' end)* (cast(i.imp_iva_desc+i.imp_iva+i.imp_netograv+i.imp_netog' +
        'rav_desc as decimal(10,2)))) as total'
      ''
      'from vtmacomprobemitido v'
      
        'inner join vtmatipcomprob t on v.tip_comprobante=t.tip_comproban' +
        'te'
      'left join mkmacliente c on v.cod_cliente=c.cod_cliente'
      
        'inner join vtmaporcentajesiva i  on i.tip_comprobante=t.tip_comp' +
        'robante and  v.nro_comprobante=i.nro_comprobante and v.nro_sucur' +
        'sal=i.nro_sucursal,'
      'sumasucursal s'
      ''
      'where'
      'v.nro_sucursal=s.nro_sucursal'
      'and'
      's.nro_sucursal=i.nro_sucursal'
      'and'
      
        ' (CAST(v.fec_comprobante AS DATE))  between (:desde) and (:hasta' +
        ')'
      'and v.nro_sucursal=:sucursal'
      ''
      'AND T.MAR_SUBDIA = '#39'V'#39
      
        'anD t.tip_comprobante IN ('#39'NCT'#39','#39'NCA'#39','#39'IA0'#39','#39'IA1'#39','#39'IA2'#39','#39'IA3'#39','#39'I' +
        'A4'#39','#39'IA5'#39','#39'IA6'#39','#39'RA6'#39','#39'IA7'#39','#39'IA8'#39','#39'IA9'#39','#39'IAD'#39','#39'IAF'#39','#39'IAG'#39','#39'IAH'#39',' +
        #39'IAI'#39','#39'IAJ'#39','#39'IAK'#39','#39'TA0'#39','#39'TA1'#39','#39'TA2'#39','#39'TA3'#39','#39'TA4'#39','#39'TA5'#39','#39'TA6'#39','#39'TA7' +
        #39','#39'TA8'#39','#39'TA9'#39','#39'TAD'#39','#39'TAF'#39','#39'TAG'#39','#39'TAE'#39','#39'TAH'#39','#39'TAI'#39','#39'TAJ'#39','#39'TAK'#39','#39'I' +
        'V0'#39','#39'IV1'#39','#39'IV2'#39','#39'IV3'#39','#39'IV4'#39','#39'IV5'#39','#39'IV6'#39','#39'IV7'#39','#39'IV8'#39','#39'IV9'#39','#39'IVD'#39',' +
        #39'IVG'#39','#39'IVF'#39','#39'IVJ'#39','#39'TKM'#39')'
      'group by 1,4,5,6,7,8'
      ''
      'order by 8')
    Left = 664
    Top = 824
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
      end
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
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 824
    Top = 984
  end
  object qnombrecuit: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select NOM_CLIENTE from mkmacliente v where v.nro_cuit=:cuit')
    Left = 552
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptUnknown
      end>
  end
  object qpromo: TIBQuery
    Database = databasefire
    Transaction = tpromo
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select des_afiliado, nro_afiliado from osmaafiliado where cod_pl' +
        'anos=:codigo OR DES_AFILIADO like :NOMBRE')
    Left = 388
    Top = 140
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE'
        ParamType = ptUnknown
      end>
  end
  object tpromo: TIBTransaction
    DefaultDatabase = databasefire
    Left = 448
    Top = 144
  end
  object qgrupoos: TIBQuery
    Database = databasefire
    Transaction = tpanel1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select cod_grupo, des_grupo from osmagrupos')
    Left = 40
    Top = 1077
  end
  object qplanes: TIBQuery
    Database = databasefire
    Transaction = tpanel1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select o.cod_planos, o.nom_planos from osmaplanesos o where o.co' +
        'd_grupo=:grupo')
    Left = 40
    Top = 1133
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end>
  end
  object cdsgrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 1200
    object cdsgruposCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 5
    end
    object cdsgruposPLAN: TStringField
      FieldName = 'PLAN'
      Size = 80
    end
  end
  object DSGRUPOS: TDataSource
    DataSet = cdsgrupos
    Left = 112
    Top = 1080
  end
  object qpresentacion: TIBQuery
    Database = databasefire
    Transaction = tpanel1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select ide_presentacion,des_presentacion,nro_presentacion from o' +
        'smapresentacion where cod_grupo=:grupo')
    Left = 40
    Top = 1269
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end>
  end
  object qpresentacionnueva: TIBQuery
    Database = databasefire
    Transaction = tranpresentacion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select ide_presentacion,des_presentacion,nro_presentacion from o' +
        'smapresentacion where cod_grupo=:grupo')
    Left = 40
    Top = 1333
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end>
  end
  object tranpresentacion: TIBTransaction
    DefaultDatabase = databasefire
    Left = 160
    Top = 1288
  end
  object qliquidar: TIBQuery
    Database = databasefire
    Transaction = tranliquidacion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select ide_presentacion,des_presentacion,nro_presentacion from o' +
        'smapresentacion where cod_grupo=:grupo')
    Left = 40
    Top = 1389
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end>
  end
  object tranliquidacion: TIBTransaction
    DefaultDatabase = databasefire
    Left = 160
    Top = 1368
  end
  object qdecla: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 744
    Top = 824
  end
  object cdsdecla: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 649
    Top = 1064
    object cdsdeclarineto21: TFloatField
      FieldName = 'rineto21'
    end
    object cdsdeclariiva21: TFloatField
      FieldName = 'riiva21'
    end
    object cdsdeclaconeto21: TFloatField
      FieldName = 'coneto21'
    end
    object cdsdeclacoiva21: TFloatField
      FieldName = 'coiva21'
    end
    object cdsdeclarineto0: TFloatField
      FieldName = 'rineto0'
    end
    object cdsdeclaconeto0: TFloatField
      FieldName = 'coneto0'
    end
    object cdsdeclafecha: TDateTimeField
      FieldName = 'fecha'
    end
    object cdsdeclarazon: TStringField
      FieldName = 'razon'
    end
    object cdsdeclacuit: TStringField
      FieldName = 'cuit'
    end
    object cdsdeclaritotal21: TFloatField
      FieldName = 'ritotal21'
    end
    object cdsdeclaritotal0: TFloatField
      FieldName = 'ritotal0'
    end
    object cdsdeclacototal21: TFloatField
      FieldName = 'cototal21'
    end
    object cdsdeclacototal0: TFloatField
      FieldName = 'cototal0'
    end
  end
  object frxReportdecla: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44664.509869386600000000
    ReportOptions.LastChange = 44664.604091493060000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 729
    Top = 1080
    Datasets = <
      item
        DataSet = frxdecla
        DataSetName = 'frxiva'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 139.820037150000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Left = 177.142857150000000000
          Top = 60.149969050000000000
          Width = 412.380952380000000000
          Height = 50.476190480000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Informe detallado ventas')
          ParentFont = False
        end
        object frxivarazon: TfrxMemoView
          Left = 1.904761900000000000
          Top = 3.007111900000000000
          Width = 235.883117140000000000
          Height = 18.897650000000000000
          DataField = 'razon'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."razon"]')
          ParentFont = False
        end
        object frxivacuit: TfrxMemoView
          Left = 244.761904760000000000
          Top = 2.054730950000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'cuit'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."cuit"]')
          ParentFont = False
        end
        object frxivafecha: TfrxMemoView
          Left = 593.333333330000000000
          Top = 3.007111900000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'fecha'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            '[frxiva."fecha"]')
          ParentFont = False
        end
        object Shape2: TfrxShapeView
          Left = 4.913385826771654000
          Top = 105.864254760000000000
          Width = 729.726345240000000000
          Height = 29.373840480000000000
          Fill.BackColor = cl3DLight
        end
        object Memo4: TfrxMemoView
          Left = 15.238095230000000000
          Top = 114.435683330000000000
          Width = 600.952380950000000000
          Height = 18.095238100000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            
              '+/-                                           Importe       Desc' +
              'ripci'#243'n')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Height = 746.486703810000000000
        ParentFont = False
        Top = 219.212740000000000000
        Width = 740.409927000000000000
        DataSet = frxdecla
        DataSetName = 'frxiva'
        RowCount = 0
        object Memo3: TfrxMemoView
          Left = 16.190476190000000000
          Top = 2.692021909523807000
          Width = 82.857142860000000000
          Height = 23.809523810000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'VENTAS')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 28.571428570000000000
          Top = 29.358688569523810000
          Width = 148.571428580000000000
          Height = 23.809523810000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'DEBITO FISCAL')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 40.952380950000000000
          Top = 53.168212379523810000
          Width = 268.571428580000000000
          Height = 23.809523810000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Operaciones con Responsables Inscriptos:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 88.571428570000000000
          Top = 100.787259999523800000
          Width = 236.190476200000000000
          Height = 15.238095240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Monto Total Facturado:')
          ParentFont = False
        end
        object frxivarineto21: TfrxMemoView
          Left = 181.904761900000000000
          Top = 122.025355239523800000
          Width = 125.084415720000000000
          Height = 18.897650000000000000
          DataField = 'rineto21'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxiva."rineto21"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 310.476190480000000000
          Top = 121.739640949523800000
          Width = 414.285714290000000000
          Height = 19.047619050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            
              'Netos Gravados por Debitos Fiscales de Ventas a  Responsables In' +
              'scriptos.')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 310.476190480000000000
          Top = 144.596783809523800000
          Width = 395.238095240000000000
          Height = 19.047619050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'IVA por Debitos Fiscales de Ventas a Responsables Inscriptos.')
          ParentFont = False
        end
        object frxivariiva21: TfrxMemoView
          Left = 181.904761910000000000
          Top = 144.596783809523800000
          Width = 125.084415710000000000
          Height = 18.897650000000000000
          DataField = 'riiva21'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxiva."riiva21"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 152.380952380000000000
          Top = 163.358688570000000000
          Width = 154.285714290000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.TopLine.Width = 2.000000000000000000
        end
        object frxivaritotal21: TfrxMemoView
          Left = 217.142857140000000000
          Top = 184.596783809523800000
          DataField = 'ritotal21'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Memo.UTF8W = (
            '[frxiva."ritotal21"]')
        end
        object frxivaritotal211: TfrxMemoView
          Left = 181.904761900000000000
          Top = 165.168212379523800000
          Width = 125.084415720000000000
          Height = 18.897650000000000000
          DataField = 'ritotal21'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxiva."ritotal21"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 88.571428570000000000
          Top = 184.834879049523800000
          Width = 236.190476200000000000
          Height = 15.238095240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Debito Fiscal Facturado:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 181.904761900000000000
          Top = 201.739640949523800000
          Width = 125.084415710000000000
          Height = 18.897650000000000000
          DataField = 'riiva21'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxiva."riiva21"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 310.476190480000000000
          Top = 201.739640949523800000
          Width = 395.238095240000000000
          Height = 19.047619050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'IVA por Debitos Fiscales de Ventas a Responsables Inscriptos.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 40.952380950000000000
          Top = 337.358688569523800000
          Width = 413.333333340000000000
          Height = 23.809523810000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Operaciones con Consumidores Finales, Exentos y No Alcanzados:')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 71.428571430000000000
          Top = 369.644402859523800000
          Width = 253.333333350000000000
          Height = 23.809523810000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Alicuota:                                       21.00')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 88.571428570000000000
          Top = 392.263450479523800000
          Width = 236.190476200000000000
          Height = 15.238095240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Monto Total Facturado:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 181.904761900000000000
          Top = 415.120593329523800000
          Width = 125.084415720000000000
          Height = 18.897650000000000000
          DataField = 'coneto21'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxiva."coneto21"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 181.904761900000000000
          Top = 439.882498099523800000
          Width = 125.084415720000000000
          Height = 18.897650000000000000
          DataField = 'coiva21'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxiva."coiva21"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 310.476190480000000000
          Top = 415.120593329523800000
          Width = 395.238095240000000000
          Height = 19.047619050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Netos Gravados por Debitos Fiscales de Ventas a Exentos')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 310.476190480000000000
          Top = 439.882498099523800000
          Width = 395.238095240000000000
          Height = 19.047619050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'IVA por Debitos Fiscales de Ventas a Exentos')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 152.380952380000000000
          Top = 458.834879050000000000
          Width = 154.285714290000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.TopLine.Width = 2.000000000000000000
        end
        object frxivacototal21: TfrxMemoView
          Left = 181.904761910000000000
          Top = 464.834879049523800000
          Width = 125.084415710000000000
          Height = 18.897650000000000000
          DataField = 'cototal21'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxiva."cototal21"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 86.666666670000000000
          Top = 485.787259999523800000
          Width = 236.190476200000000000
          Height = 15.238095240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Debito Fiscal Facturado:')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 181.904761900000000000
          Top = 504.834879049523800000
          Width = 125.084415720000000000
          Height = 18.897650000000000000
          DataField = 'coiva21'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxiva."coiva21"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 310.476190480000000000
          Top = 504.834879049523800000
          Width = 395.238095240000000000
          Height = 19.047619050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'IVA por Debitos Fiscales de Ventas a Exentos')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 88.571428570000000000
          Top = 249.358688569523800000
          Width = 236.190476200000000000
          Height = 15.238095240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Monto Total Facturado:')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 181.904761900000000000
          Top = 268.406307619523800000
          Width = 125.084415710000000000
          Height = 18.897650000000000000
          DataField = 'rineto0'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxiva."rineto0"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 311.428571430000000000
          Top = 268.406307619523800000
          Width = 411.428571430000000000
          Height = 19.047619050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            
              'Netos Gravados por Debitos Fiscales de Ventas a  Responsables In' +
              'scriptos.')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 181.904761900000000000
          Top = 291.263450479523800000
          Width = 125.084415710000000000
          Height = 18.897650000000000000
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '00.00')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 310.476190480000000000
          Top = 291.263450479523800000
          Width = 395.238095240000000000
          Height = 19.047619050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'IVA por Debitos Fiscales de Ventas a Responsables Inscriptos.')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 152.380952380000000000
          Top = 310.311069520000000000
          Width = 154.285714290000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.TopLine.Width = 2.000000000000000000
        end
        object frxivaritotal0: TfrxMemoView
          Left = 227.619047620000000000
          Top = 312.215831429523800000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ritotal0'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxiva."ritotal0"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 71.428571430000000000
          Top = 526.501545719523800000
          Width = 235.238095250000000000
          Height = 23.809523810000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Alicuota:                                        00.00')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 89.523809520000000000
          Top = 553.168212379523800000
          Width = 236.190476200000000000
          Height = 15.238095240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Monto Total Facturado:')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 182.857142850000000000
          Top = 572.215831429523800000
          Width = 125.084415710000000000
          Height = 18.897650000000000000
          DataField = 'coneto0'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxiva."coneto0"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 312.380952380000000000
          Top = 572.215831429523800000
          Width = 395.238095240000000000
          Height = 19.047619050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Netos Gravados por Debitos Fiscales de Ventas a Exentos')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 182.857142850000000000
          Top = 595.072974289523800000
          Width = 125.084415710000000000
          Height = 18.897650000000000000
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '00.00')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 311.428571430000000000
          Top = 595.072974289523800000
          Width = 395.238095240000000000
          Height = 19.047619050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'IVA por Debitos Fiscales de Ventas a Exentos')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 153.333333330000000000
          Top = 614.120593330000000000
          Width = 154.285714290000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.TopLine.Width = 2.000000000000000000
        end
        object Memo36: TfrxMemoView
          Left = 228.571428570000000000
          Top = 616.025355239523800000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'cototal0'
          DataSet = frxdecla
          DataSetName = 'frxiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxiva."cototal0"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 71.428571430000000000
          Top = 76.977736189523810000
          Width = 253.333333350000000000
          Height = 23.809523810000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Alicuota:                                       21.00')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 71.428571430000000000
          Top = 225.549164759523800000
          Width = 235.238095250000000000
          Height = 23.809523810000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Memo.UTF8W = (
            'Alicuota:                                        00.00')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 1028.032160000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Left = 665.197280000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
    end
  end
  object frxdecla: TfrxDBDataset
    UserName = 'frxiva'
    CloseDataSource = False
    FieldAliases.Strings = (
      'rineto21=rineto21'
      'riiva21=riiva21'
      'coneto21=coneto21'
      'coiva21=coiva21'
      'rineto0=rineto0'
      'coneto0=coneto0'
      'fecha=fecha'
      'razon=razon'
      'cuit=cuit'
      'ritotal21=ritotal21'
      'ritotal0=ritotal0'
      'cototal21=cototal21'
      'cototal0=cototal0')
    DataSet = cdsdecla
    BCDToCurrency = False
    Left = 648
    Top = 1144
  end
  object QAFILIADO: TIBQuery
    Database = databasefire
    Transaction = transafiliado
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 296
    Top = 1080
  end
  object transafiliado: TIBTransaction
    DefaultDatabase = databasefire
    Left = 376
    Top = 1080
  end
  object nsucursal: TIBQuery
    Database = databasefire
    Transaction = IBTransactionsucu
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 824
    Top = 352
  end
  object IBTransactionsucu: TIBTransaction
    DefaultDatabase = databasefire
    Left = 824
    Top = 424
  end
  object qFacturador: TIBQuery
    Database = databasefire
    Transaction = transactionprod
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 736
    Top = 240
  end
  object frxcaja: TfrxDBDataset
    UserName = 'frxDBDatasetCAJA'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CAJA=CAJA'
      'EFECTIVOSIS=EFECTIVOSIS'
      'TARJETASIS=TARJETASIS'
      'TOTALSIS=TOTALSIS'
      'DIFERENCIA=DIFERENCIA'
      'EFECTIVO=EFECTIVO'
      'TARJETA=TARJETA'
      'CHEQUESIS=CHEQUESIS'
      'TOTAL=TOTAL'
      'Cuentac=Cuentac'
      'gastos=gastos'
      'nctb=nctb'
      'nca=nca'
      'cantidadnct=cantidadnct'
      'cantidadnca=cantidadnca'
      'cheque=cheque'
      'tarvisa=tarvisa'
      'tarmaestro=tarmaestro'
      'tarmastercard=tarmastercard'
      'tarnaranja=tarnaranja'
      'tarelectron=tarelectron'
      'tarcabal=tarcabal'
      'taramerican=taramerican'
      'tartdf=tartdf'
      'tarotras=tarotras'
      'comentarios=comentarios'
      'fechadesde=fechadesde'
      'fechahasta=fechahasta'
      'zeta=zeta'
      'importe=importe'
      'testigo=testigo'
      'diferenciazeta=diferenciazeta'
      'ef1=ef1'
      'ef2=ef2'
      'ef5=ef5'
      'ef10=ef10'
      'ef20=ef20'
      'ef50=ef50'
      'ef100=ef100'
      'ef200=ef200'
      'ef500=ef500'
      'ef1000=ef1000'
      'ef2000=ef2000'
      'ef5000=ef5000'
      'efotras=efotras'
      'tarnativa=tarnativa'
      'pagoscc=pagoscc'
      'os=os'
      'boni=boni'
      'dolarenviado=dolarenviado'
      'dolarcambio=dolarcambio'
      'euroenviado=euroenviado'
      'eurocambio=eurocambio'
      'tarqr=tarqr'
      'gentilezas=gentilezas'
      'ef10000=ef10000'
      'ef20000=ef20000')
    DataSet = cdsreportecaja
    BCDToCurrency = False
    Left = 224
    Top = 1048
  end
end

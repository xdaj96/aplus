unit uRanckingProdDAO;

interface
  uses uRanckingProd,udmFacturador;
  type TRanckingProdDAO = class
    private
      FConsultaInsertCargada:Boolean;
      procedure cargarConsultaInsercion;
    public
      constructor Create;
      function tieneRancking:Boolean;
      procedure iniciarTransaccion;
      procedure insertar(rancking:TRanckingProd);
      procedure actualizar(rancking:TRanckingProd);
      procedure consultarRanckingPorFechaYAlfabeta(fecha:TDate;cod_alfabeta:Integer);
      procedure commit;
      procedure RollbackTransaccion;
  end;
implementation


constructor TRanckingProdDAO.Create;
begin
    FConsultaInsertCargada:= False;
end;

procedure TRanckingProdDAO.consultarRanckingPorFechaYAlfabeta(fecha:TDate;cod_alfabeta:Integer);
begin
  dmfacturador.qranking.Database:=dmFacturador.getConexion;
  dmfacturador.qranking.SQL.Clear;
  dmfacturador.qranking.Close;
  dmfacturador.qranking.SQL.Text:=concat('select can_stkinicial, can_venta_diaria, can_compra_diaria, can_movdia from cotbrankproducto b where b.dat_fecha_hora=:fecha and cod_alfabeta=:alfabeta');
  dmfacturador.qranking.ParamByName('alfabeta').asinteger:=cod_alfabeta;
  dmfacturador.qranking.ParamByName('fecha').AsDate:=fecha;

  dmfacturador.qranking.Open;
end;




procedure TRanckingProdDAO.iniciarTransaccion;
begin
    if dmfacturador.ticomprobante.InTransaction  then
    begin
        dmfacturador.ticomprobante.Rollback;
    end;
    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database:=dmFacturador.getConexion;
    dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;

    FConsultaInsertCargada:= False;
end;


procedure TRanckingProdDAO.cargarConsultaInsercion;
begin

  dmfacturador.icomprobante.SQL.Text:=concat(' INSERT                                 ',
                                                     ' INTO COTBRANKPRODUCTO (NRO_SUCURSAL,   ',
                                                     '  COD_ALFABETA,              ',
                                                     '  DAT_FECHA_HORA,           ',
                                                     '  CAN_STKINICIAL,          ',
                                                     '  CAN_VENTA_DIARIA,                            ',
                                                     '  CAN_COMPRA_DIARIA,                          ',
                                                     '  CAN_MOVDIA,                                ',
                                                     '  IMP_VENTA,                                ',
                                                     '  IMP_NETOVENTA,                           ',
                                                     '  IMP_COSTOVENTA,                         ',
                                                     '  IMP_COSTOCOMPRA,                       ',
                                                     '  IMP_OSD,                              ',
                                                     '  IMP_RETENCION_OSD,                    ',
                                                     '  CAN_UNID_OSD,                        ',
                                                     '  IMP_OSM,                            ',
                                                     '  IMP_RETENCION_OSM,                 ',
                                                     '  CAN_UNID_OSM,                     ',
                                                     '  IMP_COB_EFECTIVO,                ',
                                                     '  IMP_COB_CHEQUE,                 ',
                                                     '  IMP_COB_TARJ,                  ',
                                                     '  IMP_RETENCION_TARJ,           ',
                                                     '  IMP_CTACTE,                  ',
                                                     '  IMP_DSC_CTACTE,             ',
                                                     '  IMP_GENTILEZA,             ',
                                                     '  IMP_DSC_AFIL_OSD,         ',
                                                     '  IMP_DSC_AFIL_OSM)        ',
                                                     '                          ',
                                                     ' VALUES (:sucursal,                      ',
                                                     ' :cod_Alfabeta,                         ',
                                                     ' :fechahora,                           ',
                                                     ' :stockinicial,                       ',
                                                     ' :CANTIDAD,                          ',
                                                     ' :CAN_COMPRA_DIARIA,              ',
                                                     ' :CAN_MOVDIA,                     ',
                                                     ' :importeventa,                    ',
                                                     ' :importeneto,                    ',
                                                     ' :importecostoventa,             ',
                                                     ' :importecostocompra,           ',
                                                     ' :importeosd,                  ',
                                                     ' :importeRETENCIONOSD,        ',
                                                     ' :CAN_UNID_OSD,              ',
                                                     ' :IMP_OSM,                   ',
                                                     ' :CAN_UNID_OSM,              ',
                                                     ' :importeRETENCIONOSM,           ',
                                                     ' :IMP_COB_EFECTIVO,        ',
                                                     ' :IMP_COB_CHEQUE,         ',
                                                     ' :IMP_COB_TARJ,          ',
                                                     ' :IMP_RETENCION_TARJ,   ',
                                                     ' :IMP_CTACTE,          ',
                                                     ' :IMP_DSC_CTACTE,     ',
                                                     ' :IMP_GENTILEZA,     ',
                                                     ' :IMP_DSC_AFIL_OSD, ',
                                                     ' :IMP_DSC_AFIL_OSM)');
    FConsultaInsertCargada:= True;
end;

procedure TRanckingProdDAO.actualizar(rancking: TRanckingProd);
begin

  FConsultaInsertCargada:= False;

  dmfacturador.icomprobante.SQL.Text := concat(' UPDATE COTBRANKPRODUCTO SET           ', ' CAN_STKINICIAL = :stock_inicial,     ', ' CAN_VENTA_DIARIA = :venta_diaria,   ', ' CAN_COMPRA_DIARIA = :compra_diaria, ', ' CAN_MOVDIA = :movdia               ', '                                     ', ' WHERE (NRO_SUCURSAL = :sucursal) AND ', ' (COD_ALFABETA = :alfabeta) AND ', '(DAT_FECHA_HORA = :fecha) ');

  {---------------------------------------------------------------------------------------------}
  {Parametros de consulta}
  dmfacturador.icomprobante.parambyname('Sucursal').asstring := rancking.sucursal;
  dmfacturador.icomprobante.ParamByName('alfabeta').asinteger := rancking.CodAlfabeta;
  dmfacturador.icomprobante.ParamByName('fecha').AsDate := rancking.FechaHora;
  dmfacturador.icomprobante.parambyname('stock_inicial').asinteger := rancking.StockInicial;
  dmfacturador.icomprobante.ParamByName('movdia').Asinteger := rancking.CantidadMovDia;
  dmfacturador.icomprobante.ParamByName('venta_diaria').asinteger :=  rancking.CantidadVentaDiaria;
  dmfacturador.icomprobante.ParamByName('compra_diaria').Asinteger := rancking.CantidadCompraDiaria;
  dmFacturador.icomprobante.ExecSQL;
end;


procedure TRanckingProdDAO.insertar(rancking:TRanckingProd);
begin

  cargarConsultaInsercion;

dmfacturador.icomprobante.parambyname('Sucursal').asstring:=rancking.sucursal;
dmfacturador.icomprobante.ParamByName('cod_alfabeta').asinteger:=rancking.CodAlfabeta;
dmfacturador.icomprobante.ParamByName('fechahora').AsDate:=rancking.FechaHora;
dmfacturador.icomprobante.ParamByName('stockinicial').asinteger:=rancking.StockInicial;
dmfacturador.icomprobante.ParamByName('importeventa').asFLOAT:=rancking.ImporteVenta;
dmfacturador.icomprobante.ParamByName('importeneto').AsFloat:=rancking.ImporteNeto;
dmfacturador.icomprobante.ParamByName('importecostoventa').AsFloat:=rancking.ImporteCostoVenta;
dmfacturador.icomprobante.ParamByName('importecostocompra').AsFloat:=rancking.ImporteCostoCompra;
dmfacturador.icomprobante.ParamByName('importeRETENCIONOSD').AsFloat:=rancking.ImporteRetencionOSD;
dmfacturador.icomprobante.ParamByName('importeRETENCIONOSM').AsFloat:=rancking.ImporteRetencionOSM;
dmfacturador.icomprobante.ParamByName('importeosd').AsFloat:=rancking.ImporteOSD;
dmfacturador.icomprobante.ParamByName('CAN_UNID_OSD').AsFloat:=rancking.CantidadUnidOSD;
dmfacturador.icomprobante.ParamByName('IMP_COB_EFECTIVO').AsFLOAT:=rancking.ImporteCobroEfectivo;
dmfacturador.icomprobante.ParamByName('IMP_COB_CHEQUE').AsFLOAT:=rancking.ImporteCobroCheque;
dmfacturador.icomprobante.ParamByName('IMP_COB_TARJ').AsFLOAT:=rancking.ImporteCobroTarjeta;
dmfacturador.icomprobante.ParamByName('IMP_RETENCION_TARJ').AsFloat:=rancking.ImporteRetencionTarjeta;
dmfacturador.icomprobante.ParamByName('IMP_CTACTE').AsFLOAT:=rancking.ImporteCtaCte;
dmfacturador.icomprobante.ParamByName('IMP_DSC_CTACTE').AsFloat:=rancking.ImporteDescCtaCte;
dmfacturador.icomprobante.ParamByName('IMP_GENTILEZA').AsFloat:=rancking.ImporteGentileza;
dmfacturador.icomprobante.ParamByName('IMP_DSC_CTACTE').AsFloat:=rancking.ImporteDescCtaCte;
dmfacturador.icomprobante.ParamByName('IMP_GENTILEZA').AsFloat:=rancking.ImporteGentileza;
dmfacturador.icomprobante.ParamByName('IMP_DSC_AFIL_OSD').AsFloat:=rancking.ImporteDscAfilOSD;
dmfacturador.icomprobante.ParamByName('IMP_DSC_AFIL_OSM').AsFloat:=rancking.ImporteDscAfilOSM;
dmFacturador.icomprobante.ExecSQL;

end;

function TRanckingProdDAO.tieneRancking:Boolean;
begin
Result:= dmfacturador.qranking.RecordCount > 0;
end;



procedure TRanckingProdDAO.commit;
begin
   dmfacturador.ticomprobante.Commit;
   FConsultaInsertCargada:= False;
end;

procedure TRanckingProdDAO.RollbackTransaccion;
begin
        dmfacturador.ticomprobante.Rollback;
end;


end.

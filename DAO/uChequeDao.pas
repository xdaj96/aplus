unit uChequeDao;

interface
  uses UdmFacturador,uChequeModel;
  type  TChequeDao = class
    public

     constructor Create;
     procedure insertarCheque(cheque:TCheque);
     procedure iniciarTransaccion;
     procedure commit;


  end;

implementation


  constructor TChequeDao.Create;
  begin

  end;

  procedure TChequeDao.iniciarTransaccion;
  begin
    if dmfacturador.ticomprobante.InTransaction  then
        dmfacturador.ticomprobante.Rollback;
    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database:=dmFacturador.getConexion;
    dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;
  end;

  procedure TChequeDao.insertarCheque(cheque:TCheque);
  begin
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTTBPAGOCHEQUE (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_BANCO, COD_CTA, NRO_CHEQUE, IMP_CHEQUE) VALUES (:sucursal,:tip_comprobante, :nro_comprobante, :cod_banco, '''', :nro_cheque, :importe_cheque);');
    dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=cheque.Sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=cheque.TipoComprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobante').AsString:=cheque.NroComprobante;
    dmfacturador.icomprobante.ParamByName('cod_banco').AsString:= cheque.CodigoBanco;
    dmfacturador.icomprobante.ParamByName('nro_cheque').AsString:=cheque.NroCheque;
    dmfacturador.icomprobante.ParamByName('importe_cheque').AsFloat:= cheque.Importe;
  end;

  procedure TChequeDao.commit;
  begin
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;



end.


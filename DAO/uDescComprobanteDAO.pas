unit uDescComprobanteDAO;

interface
  uses udmfacturador,sysUtils,db,uDescComprobante,System.Generics.Collections;
  Type
    TDescComprobanteDAO = class
      procedure registrarDescuentos(listaDescuentos:TList<TDescComprobante>);
      procedure registrarListaDescuentos(listaDescuentos:TList<TDescComprobante>);
      procedure iniciarTransaccion;
      procedure commit;
      procedure rollback;

    end;
implementation

procedure TDescComprobanteDAO.registrarDescuentos(listaDescuentos:TList<TDescComprobante>);
var
  unDescuento:TDescComprobante;
begin
    dmfacturador.icomprobante.SQL.text := concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)', ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');


    for unDescuento in listaDescuentos do
    begin


       dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring := unDescuento.nro_sucursal;
      dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring := unDescuento.tipo_comprobante;
      dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring := unDescuento.nro_comprobante;
      dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring := unDescuento.cod_planos;
      dmfacturador.icomprobante.ParamByName('ITEM').AsFloat := unDescuento.item;
      dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat := unDescuento.por_descuento;
      dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat := unDescuento.imp_descuento;
      dmfacturador.icomprobante.ExecSQL;


    end;


end;

procedure TDescComprobanteDAO.iniciarTransaccion;
begin
   if dmfacturador.ticomprobante.InTransaction then
      rollback;
   dmfacturador.ticomprobante.StartTransaction;
   dmfacturador.icomprobante.Database := dmfacturador.getConexion;
   dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
   dmfacturador.icomprobante.Close;
   dmfacturador.icomprobante.SQL.Clear;
   dmfacturador.icomprobante.Close;

end;


procedure TDescComprobanteDAO.registrarListaDescuentos(listaDescuentos:TList<TDescComprobante>);
begin
   try
       iniciarTransaccion;
      registrarDescuentos(listaDescuentos);
            commit;
   except
      on E:Exception do
      begin
        rollback;
         raise Exception.Create('No se pudo registrar los descuentos del comprobante'+ e.Message);
      end;

   end;
end;



procedure TDescComprobanteDAO.commit;
begin
   //dmfacturador.icomprobante.Open;
   dmfacturador.ticomprobante.Commit;
end;


procedure TDescComprobanteDAO.rollback;
begin
    dmfacturador.ticomprobante.Rollback;
end;


end.

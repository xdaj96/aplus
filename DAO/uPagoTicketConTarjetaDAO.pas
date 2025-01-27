unit uPagoTicketConTarjetaDAO;

interface
  uses udmFacturador,IBX.IBQUERY;

  type TFPagoTarjetaDAO = class
    private
    public
      constructor Create;

      function obtenerImporteTarjetaPorComprobMed(nro_sucursal:string;nro_comprob:string):TIBQUERY;


  end;
implementation

 constructor TFPagoTarjetaDAO.Create;
 begin

 end;



 function TFPagoTarjetaDAO.obtenerImporteTarjetaPorComprobMed(nro_sucursal:string;nro_comprob:string):TIBQUERY;
 begin
     dmfacturador.qfacturador.Database:= dmFacturador.getConexion;
      with dmFacturador do
      begin
        qfacturador.Close;
        qfacturador.SQL.Clear;
        icomprobante.SQL.Text:= concat('SELECT FIRST 1 pago_tarjeta.IMP_TARJETA FROM OSMAMOVOBRASOCIAL as movos',
' INNER JOIN VTTBPAGOTARJETA as pago_tarjeta on pago_tarjeta.NRO_SUCURSAL = movos.NRO_SUCURSAL ',
'AND pago_tarjeta.TIP_COMPROBANTE = movos.TIP_COMPROB AND pago_tarjeta.NRO_COMPROBANTE = movos.NRO_COMPROB',
 'WHERE movos.NRO_SUCURSAL = :NRO_SUCURSAL AND movos.NRO_COMPROB = :NRO_COMPROB ORDER BY movos.AUD_FEC_ALTA DESC');

        icomprobante.ParamByName('NRO_SUCURSAL').AsString:=nro_sucursal;
        icomprobante.ParamByName('NRO_COMPROB').AsString:=nro_comprob;
        icomprobante.Open;
        Result:= icomprobante;

      end;



 end;



end.


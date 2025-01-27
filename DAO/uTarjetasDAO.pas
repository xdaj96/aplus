unit uTarjetasDAO;

interface
  uses udmFacturador,IBX.IBQUERY;

  type TTarjetasDAO = class
    private
    public
      constructor Create;
      function obtenerTarjetas():TIBQUERY;
      function obtenerTarjetaPorCodigo(cod_tarjeta:string):TIBQUERY;


  end;
implementation

 constructor TTarjetasDAO.Create;
 begin

 end;

 function TTarjetasDAO.obtenerTarjetas():TIBQUERY;
 begin
    dmfacturador.qfacturador.Database:= dmFacturador.getConexion;
      with dmFacturador do
      begin
        qfacturador.Close;
        qfacturador.SQL.Clear;
        icomprobante.SQL.Text:= concat('SELECT tarjeta.COD_TARJETA,tarjeta.NOM_TARJETA,tarjeta.POR_RECARGO FROM BAMATARJETA as tarjeta');

        icomprobante.Open;
        Result:= icomprobante;

      end;
 end;


 function TTarjetasDAO.obtenerTarjetaPorCodigo(cod_tarjeta:string):TIBQUERY;
 begin
      with dmFacturador do
      begin
        qfacturador.Close;
        qfacturador.SQL.Clear;
         icomprobante.SQL.Text:= concat('SELECT tarjeta.COD_TARJETA,tarjeta.NOM_TARJETA,tarjeta.POR_RECARGO FROM BAMATARJETA as tarjeta ',
         ' WHERE tarjeta.COD_TARJETA=:CODTARJ');
        icomprobante.ParamByName('CODTARJ').AsString:=cod_tarjeta;
        icomprobante.Open;
        Result:= icomprobante;

      end;



 end;



end.

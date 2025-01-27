unit uSucursalDAO;

interface
   uses udmfacturador,system.SysUtils,DB;
   type TSucursalDAO = class
     private

     public
      function getSucursales: TDataSet;
      procedure iniciarBaseDatos;
      constructor Create;

   end;
implementation

  constructor TSucursalDAO.Create;
  begin
    iniciarBaseDatos;

  end;


  procedure TSucursalDAO.iniciarBaseDatos;
  begin
     dmfacturador.icomprobante.Database:=dmFacturador.getConexion;
     dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
     dmfacturador.icomprobante.Close;
     dmfacturador.icomprobante.SQL.Clear;
  end;

  function TSucursalDAO.getSucursales():TDataSet;
  begin
      dmfacturador.icomprobante.SQL.Text:=concat('SELECT  SUCURSAL.NRO_SUCURSAL,SUCURSAL.NOM_SUCURSAL FROM SUMASUCURSAL AS SUCURSAL');

      dmFacturador.icomprobante.Open;

      Result:= dmFacturador.icomprobante;
  end;

end.

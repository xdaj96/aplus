unit uPRMASTOCKDAO;

interface
   {CLASE QUE CONTIENE EL STOCK DE LA BASE DE DATOS}
   uses udmFacturador;
   type TPRMASTOCKDAO = class
       private
       public
        procedure actualizarStockSucursal(cod_alfabeta:Integer;nro_sucursal:string;cantStk:Integer);
        procedure buscarStockPorCodigoYSucursal(sucursal:string;cod_alfabeta:integer);
        procedure iniciarTransaccion;
        procedure inicializarStock(sucursal:string ; cod_alfabeta:integer);
        procedure commit;
   end;

implementation


  procedure TPRMASTOCKDAO.actualizarStockSucursal(cod_alfabeta:Integer;nro_sucursal:string;cantStk:Integer);
  begin
          dmfacturador.icomprobante.SQL.Clear;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('update prmastock set can_stk=:can_stk where cod_alfabeta=:cod_alfabeta and nro_sucursal=:nro_sucursal');
          dmfacturador.icomprobante.ParamByName('cod_alfabeta').asinteger:=cod_alfabeta;
          dmfacturador.icomprobante.ParamByName('can_stk').asinteger:=cantStk;
          dmfacturador.icomprobante.parambyname('nro_sucursal').asstring:=nro_sucursal;
  end;

  procedure TPRMASTOCKDAO.buscarStockPorCodigoYSucursal(sucursal:string;cod_alfabeta:integer);
  begin
    dmfacturador.qbusquedastock.Close;
    dmfacturador.qbusquedastock.SQL.Text:=concat('select can_stk from prmastock where cod_Alfabeta=:codigo and nro_sucursal=:sucursal');
    dmfacturador.qbusquedastock.ParamByName('codigo').asinteger:= cod_alfabeta;
    dmfacturador.qbusquedastock.ParamByName('sucursal').asstring:= sucursal;
    dmfacturador.qbusquedastock.Open;
  end;

  procedure TPRMASTOCKDAO.iniciarTransaccion;
  begin
    if dmfacturador.ticomprobante.InTransaction then
     begin
       dmfacturador.ticomprobante.Rollback;

     end;

     dmfacturador.ticomprobante.StartTransaction;
       dmfacturador.icomprobante.Database:=dmFacturador.getConexion;
       dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
       dmfacturador.icomprobante.Close;

  end;
  (**
    Descripcion: Metodo que inicializa el stock de un producto
    @param string sucursal: sucursal que contiene el producto
    @param integer cod_alfabeta: codigo del producto
  **)
  procedure TPRMASTOCKDAO.inicializarStock(sucursal:string ; cod_alfabeta:integer);
  begin
    dmfacturador.qinsertlineastock.Close;
    dmfacturador.qinsertlineastock.SQL.Text:=concat(' INSERT INTO PRMASTOCK (NRO_SUCURSAL, COD_ALFABETA, CAN_STKMIN, CAN_STKMAX, CAN_STK) ',
                                                 ' VALUES (:sucursal, :alfabeta, 0, 1000, 0)');
    dmfacturador.qinsertlineastock.ParamByName('alfabeta').asinteger:=cod_alfabeta;
    dmfacturador.qinsertlineastock.ParamByName('sucursal').asstring:=sucursal;
    dmfacturador.qinsertlineastock.Open;

  end;

  procedure TPRMASTOCKDAO.commit;
  begin
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;
  end;




end.

unit uDetaMovOSDAO;

interface
   uses udmfacturador,uDetalleMovOS,Generics.Collections,SysUtils,Dialogs;
   type TDetalleMovOSDAO = class

   private
      FConsultaInsertCargada:Boolean;
      procedure cargarConsultaInsercion;

   public
    constructor Create;
    procedure IniciarTransaccion;
    procedure insertarItem(item:TDetalleMovOS);
    procedure insertarItems(items:TList<TDetalleMovOS>);
    procedure commit;
   end;
implementation


    constructor TDetalleMovOSDAO.Create;
    begin
        FConsultaInsertCargada:= False;
    end;



   {************************************************************
    Descripcion: Método  que inicia la transaccion en la bd.
   ************************************************************}
   procedure TDetalleMovOSDAO.IniciarTransaccion;
   begin
     if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

     dmfacturador.ticomprobante.StartTransaction;
     dmfacturador.icomprobante.Database:=dmFacturador.getConexion;
     dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
     dmfacturador.icomprobante.Close;
     dmfacturador.icomprobante.SQL.Clear;
     FConsultaInsertCargada:= False;
   end;


   {************************************************************
    Descripcion: Método  que verifica y carga la consulta de
                 insercion parametrizada
   ************************************************************}

   procedure TDetalleMovOSDAO.cargarConsultaInsercion;
   begin

      if not FConsultaInsertCargada then
      begin
      dmfacturador.icomprobante.Close;
      dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO OSMADETALLEMOV                     ',
                                                     ' (COD_PLANOS,                                 ',
                                                     ' NRO_SUCURSAL,                               ',
                                                     ' TIP_COMPROB,                               ',
                                                     ' NRO_COMPROB,                              ',
                                                     ' NRO_ITEM,                                ',
                                                     ' COD_ALFABETA,                           ',
                                                     ' COD_LABORATORIO,                       ',
                                                     ' NOM_LARGO,                            ',
                                                     ' CAN_VENDIDA,                         ',
                                                     ' IMP_UNITARIO,                       ',
                                                     ' POR_DESCUENTO,                     ',
                                                     ' IMP_DESCUENTO,                    ',
                                                     ' MAR_MOTVENTA,                    ',
                                                     ' NRO_TROQUEL,                    ',
                                                     ' COD_VALIDACION)                ',
                                                     '                               ',
                                                     ' VALUES (:cod_planos,         ',
                                                     ' :nro_sucursal,              ',
                                                     ' :tip_comprobante,          ',
                                                     ' :nro_comprobante,         ',
                                                     ' :nro_item,               ',
                                                     ' :cod_alfabeta,          ',
                                                     ' :cod_laboratorio,      ',
                                                     ' :nom_largo,           ',
                                                     ' :can_vendida,        ',
                                                     ' :imp_unitario,      ',
                                                     ' :por_descuento,    ',
                                                     ' :imp_descuento,   ',
                                                     ' ''3'',            ',
                                                     ' :nro_troquel,  ',
                                                     ' :cod_validacion);');
      FConsultaInsertCargada:= True;
      end;

   end;


   procedure TDetalleMovOSDAO.insertarItems(items: TList<TDetalleMovOS>);
var
  item: TDetalleMovOS;
begin
  IniciarTransaccion; // Inicia la transacción antes de insertar los registros

    cargarConsultaInsercion; // Carga la consulta de inserción una vez

    for item in items do
    begin
      dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString := item.COD_PLANOS;
      dmfacturador.icomprobante.ParamByName('nro_SUCURSAL').AsString := item.nro_SUCURSAL;
      dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString := item.TIP_COMPROBANTE;
      dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString := item.nro_comprobANTE;
      dmfacturador.icomprobante.ParamByName('nro_item').Asinteger := item.nro_item;
      dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger := item.cod_alfabeta;
      dmfacturador.icomprobante.ParamByName('cod_laboratorio').AsString := item.cod_laboratorio;
      dmfacturador.icomprobante.ParamByName('nom_largo').AsString := item.nom_largo;
      //
      dmfacturador.icomprobante.ParamByName('can_vendida').AsString := item.can_vendida;
      dmfacturador.icomprobante.ParamByName('imp_unitario').Asfloat := item.imp_unitario;
      dmfacturador.icomprobante.ParamByName('por_descuento').Asinteger := item.por_descuento;
      dmfacturador.icomprobante.ParamByName('imp_descuento').Asfloat := item.imp_descuento;
      dmfacturador.icomprobante.ParamByName('nro_troquel').Asinteger := item.nro_troquel;
      dmfacturador.icomprobante.ParamByName('cod_validacion').AsString := item.cod_validacion;
      dmfacturador.icomprobante.ExecSQL;
    end;

    commit; // Confirma la transacción después de insertar todos los registros

end;




   {************************************************************
  Descripcion: Método que inserta un item en el detalle
               del movimiento por obra social.
  @param integer nro_item num de item que se va a registrar
  @param integer col_descuento num de columna en donde se aplica descuento
  ************************************************************}
   procedure TDetalleMovOSDAO.insertarItem(item:TDetalleMovOS);
   begin
        cargarConsultaInsercion;
        dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString := item.COD_PLANOS;
        dmfacturador.icomprobante.ParamByName('nro_SUCURSAL').AsString := item.nro_SUCURSAL;
        dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString := item.TIP_COMPROBANTE;
        dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString := item.nro_comprobANTE;
        dmfacturador.icomprobante.ParamByName('nro_item').Asinteger := item.nro_item;
        dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger := item.cod_alfabeta;
        dmfacturador.icomprobante.ParamByName('cod_laboratorio').AsString := item.cod_laboratorio;
        dmfacturador.icomprobante.ParamByName('nom_largo').AsString := item.nom_largo;
        //
        dmfacturador.icomprobante.ParamByName('can_vendida').AsString := item.can_vendida;
        dmfacturador.icomprobante.ParamByName('imp_unitario').Asfloat := item.imp_unitario;
        dmfacturador.icomprobante.ParamByName('por_descuento').Asinteger := item.por_descuento;
        dmfacturador.icomprobante.ParamByName('imp_descuento').Asfloat := item.imp_descuento;
        dmfacturador.icomprobante.ParamByName('nro_troquel').Asinteger := item.nro_troquel;
        dmfacturador.icomprobante.ParamByName('cod_validacion').AsString := item.cod_validacion;
        dmfacturador.icomprobante.ExecSQL;
   end;

   {************************************************************
    Descripcion: Método que confirma la consulta de la base de datos
  ************************************************************}
   procedure TDetalleMovOSDAO.commit;
   begin
        dmfacturador.ticomprobante.Commit;

   end;


end.

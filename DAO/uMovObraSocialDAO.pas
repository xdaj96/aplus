unit uMovObraSocialDAO;

interface
   uses udmfacturador,uMovObraSocial,IBX.IBQUERY,Data.DB,system.SysUtils;
   type TMovObraSocialDAO = class

   private
      FConsultaInsertCargada:Boolean;

      procedure cargarConsultaInsercion;

   public
    constructor Create;

    procedure IniciarTransaccion;
    procedure insertar(item:TMovObraSocial);
    function consultarMovimientos(nro_sucursal:string;cod_cos:string;f_desde:string;f_hasta:string):TDataSet;
    procedure commit;
   end;
implementation


    constructor TMovObraSocialDAO.Create;
    begin
        FConsultaInsertCargada:= False;
    end;



   {************************************************************
    Descripcion: Método  que inicia la transaccion en la bd.
   ************************************************************}
   procedure TMovObraSocialDAO.IniciarTransaccion;
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

   procedure TMovObraSocialDAO.cargarConsultaInsercion;
   begin

      if not FConsultaInsertCargada then
      begin
      dmfacturador.icomprobante.Close;
       dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO OSMAMOVOBRASOCIAL                         ',
                                                     '(NRO_SUCURSAL,                                       ',
                                                     ' TIP_COMPROB,                                       ',
                                                     ' NRO_COMPROB,                                      ',
                                                     ' COD_PLANOS,                                      ',
                                                     ' COD_PLANOSORIG,                                 ',
                                                     ' NOM_OBRASOCIAL,                                ',
                                                     ' FEC_COMPROB,                                  ',
                                                     ' FEC_RECETA,                                  ',
                                                     ' IMP_TICKET,                                 ',
                                                     ' IMP_AFECTADO,                              ',
                                                     ' IMP_CARGOOS,                              ',
                                                     ' IMP_GENTILEZA,                           ',
                                                     ' IMP_PRESTADOR,                          ',
                                                     ' NRO_AFILIADO,                          ',
                                                     ' COD_ESTADO,                           ',
                                                     ' NOM_AFILIADO,                        ',
                                                     ' NRO_MATRICULA,                      ',
                                                     ' NRO_RECETA,                        ',
                                                     ' MAR_TRATAMIENTO,                  ',
                                                     ' NRO_LIQUIDACION,                 ',
                                                     ' IDE_PRESENTACION,               ',
                                                     ' DES_PARTICULARIDAD,            ',
                                                     ' COD_CLINICA,                  ',
                                                     ' NOM_CLINICA,                 ',
                                                     ' INFOADICIONAL)              ',
                                                     '                            ',
                                                     ' VALUES (:sucursal,        ',
                                                     ' :tipo_comprobante,       ',
                                                     ' :nro_Comprobante,                 ',
                                                     ' :cod_planos,                     ',
                                                     '  NULL,                          ',
                                                     ' :nom_obrasocial,               ',
                                                     ' :fec_comprobante,             ',
                                                     ' :fec_receta,                 ',
                                                     ' :imp_ticket,                ',
                                                     ' :imp_afectado,             ',
                                                     ' :imp_cargoos,             ',
                                                     ' 0,                       ',
                                                     ' 0,                      ',
                                                     ' :nro_afiliado,         ',
                                                     ' ''C'',                  ',
                                                     ' :nom_afiliado,       ',
                                                     ' :nro_matricula,     ',
                                                     ' :nro_receta,       ',
                                                     ' :tip_tratamiento, ',
                                                     ' NULL,        ',
                                                     ' NULL,      ',
                                                     ' '''',       ',
                                                     ' NULL,   ',
                                                     ' NULL, ',
                                                     ' '''');');
      FConsultaInsertCargada:= True;
      end;

   end;



   {************************************************************
  Descripcion: Método que inserta un item en el detalle
               del movimiento por obra social.
  @param integer nro_item num de item que se va a registrar
  @param integer col_descuento num de columna en donde se aplica descuento
  ************************************************************}
   procedure TMovObraSocialDAO.insertar(item:TMovObraSocial);
   begin
        cargarConsultaInsercion;                         //REM 6
          dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=item.sucursal;
          dmfacturador.icomprobante.ParamByName('TIPO_COMPROBANTE').AsString:=item.TIPO_COMPROBANTE;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=item.nro_comprobante;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=item.COD_PLANOS;
          dmfacturador.icomprobante.ParamByName('nom_obrasocial').AsString:=item.nom_obrasocial;
          dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDatetime:=item.fec_comprobante;
          dmfacturador.icomprobante.ParamByName('fec_receta').Asdate:=item.fec_receta;
          dmfacturador.icomprobante.ParamByName('imp_ticket').Asfloat:=item.imp_ticket;
          dmfacturador.icomprobante.ParamByName('imp_afectado').Asfloat:=item.imp_afectado;
          dmfacturador.icomprobante.ParamByName('imp_cargoos').Asfloat:=item.imp_cargoos;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=item.nro_afiliado;
          dmfacturador.icomprobante.ParamByName('nom_afiliado').asstring:=item.nom_afiliado;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=item.nro_matricula;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=item.nro_receta;
          dmfacturador.icomprobante.ParamByName('tip_tratamiento').Asstring:=item.tip_tratamiento;
   end;


   function TMovObraSocialDAO.consultarMovimientos(nro_sucursal:string;cod_cos:string;f_desde:string;f_hasta:string):TDataSet;
   begin
     dmfacturador.icomprobante.Database:=dmFacturador.getConexion;
     dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
     dmfacturador.icomprobante.Close;
     dmfacturador.icomprobante.SQL.Clear;

     dmfacturador.icomprobante.SQL.Text:=concat('SELECT  MOVOS.NRO_SUCURSAL,MOVOS.FEC_COMPROB,SUM(MOVOS.IMP_TICKET) AS IMP_TICKET,SUM(MOVOS.IMP_AFECTADO) AS IMP_AFECTADO,SUM(MOVOS.IMP_CARGOOS) AS IMP_CARGOOS,SUM(MOVOS.IMP_GENTILEZA) AS IMP_GENTILEZA',
     ' ,MOVOS.NOM_OBRASOCIAL FROM OSMAMOVOBRASOCIAL AS MOVOS WHERE MOVOS.NRO_SUCURSAL =:sucursal AND MOVOS.COD_PLANOS=:cod_cos AND MOVOS.FEC_COMPROB BETWEEN :f_desde AND :f_hasta GROUP BY MOVOS.NRO_SUCURSAL,MOVOS.FEC_COMPROB ORDER BY MOVOS.FEC_COMPROB ASC');
     dmFacturador.icomprobante.ParamByName('sucursal').AsString:= nro_sucursal;
     dmFacturador.icomprobante.ParamByName('cod_cos').AsString:= cod_cos;
       dmFacturador.icomprobante.ParamByName('f_desde').AsString:= f_desde;
        dmFacturador.icomprobante.ParamByName('f_hasta').AsString:= f_hasta;

     dmFacturador.icomprobante.SQL.SaveToFile('C:\NET\reporte.sql');

     dmFacturador.icomprobante.Open;

     Result := dmFacturador.icomprobante;
   end;


   {************************************************************
    Descripcion: Método que confirma la consulta de la base de datos
  ************************************************************}
   procedure TMovObraSocialDAO.commit;
   begin
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;

   end;


end.

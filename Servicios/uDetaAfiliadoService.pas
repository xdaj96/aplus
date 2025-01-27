unit uDetaAfiliadoService;

interface
uses sysUtils,math,udmfacturador,System.generics.collections,uDetalleAfiliado,udTicket,uUtils;

 Type
   TDetaAfiliadoService = class
    private

    public

      procedure registrarDetalleAplusDesdeTicket(nro_comprob:integer;ticket:TTicket);

   end;
implementation


procedure TDetaAfiliadoService.registrarDetalleAplusDesdeTicket(nro_comprob:integer;ticket:TTicket);
begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;
    dmfacturador.ticomprobante.StartTransaction;

    dmfacturador.icomprobante.SQL.text := concat('INSERT INTO VTMADETALLEAFILOS ', ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ', ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ', ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)', ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ', ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');
    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring := Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring := Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring := ticket.nrocomprobantenf;
    dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring := 'ZBG';
    dmfacturador.icomprobante.ParamByName('nro_afiliado').Asstring := TICKET.cod_cliente;
    dmfacturador.icomprobante.ParamByName('nro_matricula').Asstring := '';
    dmfacturador.icomprobante.ParamByName('nom_medico').Asstring := '';
    dmfacturador.icomprobante.ParamByName('nro_receta').Asstring := '';
    dmfacturador.icomprobante.ParamByName('fec_recet').asdate := now;
    dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency := roundto(strtofloat(formatfloat('0.00', (Ticket.importeAplus * Ticket.coeficientetarjeta))), -2);
    dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency := roundto(strtofloat(formatfloat('0.00', (Ticket.importeAplus * Ticket.coeficientetarjeta))), -2);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;




end;

end.

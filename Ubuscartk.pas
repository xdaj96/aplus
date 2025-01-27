unit Ubuscartk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, udticket, Xml.xmldom, Xml.XMLIntf,
  msxmldom, xml.xmldoc, Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient, udmfacturador, uprogreso, unumeracion,uUtils,uDescComprobanteservice,udetaafiliadoservice;

type
  Tfbuscartk = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    odialog: TOpenDialog;
    Panel3: TPanel;
    Blimpiartodo: TBitBtn;
    bbuscar: TBitBtn;
    binsertar: TBitBtn;
    mticket: TMemo;
    Shape1: TShape;
    Label6: TLabel;
    gdetalle: TDBGrid;
    dsource: TDataSource;
    cdsdetalle: TClientDataSet;
    cdsdetalleCOD_ALFABETA: TStringField;
    cdsdetalleNRO_TROQUEL: TStringField;
    cdsdetalleVALE: TStringField;
    cdsdetalleCOD_BARRASPRI: TStringField;
    cdsdetalleNOM_LARGO: TStringField;
    cdsdetalleCOD_IVA: TStringField;
    cdsdetallePRECIO: TCurrencyField;
    cdsdetalleCANTIDAD: TIntegerField;
    cdsdetallePRECIO_TOTAL: TCurrencyField;
    cdsdetallePRECIO_TOTALDESC: TCurrencyField;
    cdsdetalleDESCUENTOS: TCurrencyField;
    cdsdetallePORCENTAJEOS: TFloatField;
    cdsdetallePORCENTAJECO1: TFloatField;
    cdsdetallePORCENTAJECO2: TFloatField;
    cdsdetalleDESCUENTOSOS: TCurrencyField;
    cdsdetalleDESCUENTOCO1: TCurrencyField;
    cdsdetalleDESCUENTOCO2: TCurrencyField;
    cdsdetalleCOD_LABORATORIO: TStringField;
    cdsdetallecan_stk: TIntegerField;
    cdsdetalletamano: TIntegerField;
    cdsdetalleModificado: TBooleanField;
    cdsdetalleGENTILEZA: TIntegerField;
    cdsdetalleRUBRO: TStringField;
    cdsdetalleIMPORTEGENT: TFloatField;
    cdsdetalleCODAUTORIZACION: TStringField;
    cdsdetalleporcentaje: TFloatField;
    cdsdetalleItem: TIntegerField;
    cdsdetallecan_vale: TStringField;
    cdsdetalleAPLUS: TFloatField;
    cdsdetalleIMPORTEAPLUS: TFloatField;
    cdsdetalleimportetotal: TAggregateField;
    cdsdetalledescuentos_total: TAggregateField;
    cdsdetallenetoxcobrar: TAggregateField;
    cdsdetalleDESCUENTOTOTALOS: TAggregateField;
    cdsdetalleDESCUENTOTOTALCO1: TAggregateField;
    cdsdetalleDESCUENTOTOTALCO2: TAggregateField;
    cdsdetalleTOTALGENTILEZA: TAggregateField;
    procedure bbuscarClick(Sender: TObject);
    procedure BlimpiartodoClick(Sender: TObject);
    procedure binsertarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
   Ticket:TTicket;
    descComprobService:Tdesccomprobanteservice;
    detaAfiliadoService:TDetaafiliadoservice;
    procedure calcularIVA;
  public
    procedure SetTicket(unTicket:TTicket);
    procedure registrardescuentoaplus(var i: Integer);

  end;

var
  fbuscartk: Tfbuscartk;

implementation

{$R *.dfm}




procedure tfbuscartk.registrardescuentoaplus(var i: Integer);
begin

  //--------------agregado VTMADESCCOMPROB------------------//
  if ticket.importeaplus <> 0 then
  begin

      descComprobService.registrarDescuentoAplus(ticket.comprobante,ticket.nrocomprobantenf,
       ticket.sucursal,
       cdsdetalle,
       ticket.coeficientetarjeta
      );
   end;


  //---------------agregado VTMADETALLEAFILOS-------------------//

   if ticket.importeAplus <> 0 then
 begin
    detaAfiliadoService.registrarDetalleAplusDesdeTicket(strtoint(ticket.nrocomprobantenf),ticket);


 end;
//---------------agregado OSMAMOVOBRASOCIAL-------------------//
   if ticket.importeAplus <> 0  then
 begin
      if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;
    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;
    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text := concat('INSERT INTO OSMAMOVOBRASOCIAL',
    '(NRO_SUCURSAL,',
    ' TIP_COMPROB,',' NRO_COMPROB,','COD_PLANOS,', ' COD_PLANOSORIG,', ' NOM_OBRASOCIAL,', 'FEC_COMPROB,',
     ' FEC_RECETA,',' IMP_TICKET,', ' IMP_AFECTADO,', ' IMP_CARGOOS,', ' IMP_GENTILEZA,',
     ' IMP_PRESTADOR,', ' NRO_AFILIADO,', ' COD_ESTADO,', ' NOM_AFILIADO,', ' NRO_MATRICULA,',
     ' NRO_RECETA,', ' MAR_TRATAMIENTO,', ' NRO_LIQUIDACION,',
     ' IDE_PRESENTACION,               ', ' DES_PARTICULARIDAD,            ',
     ' COD_CLINICA,                  ', ' NOM_CLINICA,                 ', ' INFOADICIONAL)', '   ', ' VALUES (:sucursal,        ',
      ' :tipo_comprobante,       ', ' :nro_Comprobante,                 ',
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
          ' '''',       ', ' NULL,   ', ' NULL, ', ' '''');');
    dmfacturador.icomprobante.ParamByName('SUCURSAL').Asstring := Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIPO_COMPROBANTE').Asstring := Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring := ticket.nrocomprobantenf;
    dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring := 'ZBG';
    dmfacturador.icomprobante.ParamByName('nom_obrasocial').Asstring := 'DESCUENTO APLUS';
    dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDateTime := Ticket.fechafiscal;
    dmfacturador.icomprobante.ParamByName('fec_receta').asdate := ticket.fechafiscal;
    dmfacturador.icomprobante.ParamByName('imp_ticket').AsFloat := Ticket.importebruto * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('imp_afectado').AsFloat := Ticket.importetotaldescuento * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('imp_cargoos').AsFloat := Ticket.importeaplus;
    dmfacturador.icomprobante.ParamByName('nro_afiliado').Asstring := Ticket.cod_cliente;
    if (Ticket.DESCRIPCIONCLIENTE <> '') then
    begin
      dmfacturador.icomprobante.ParamByName('nom_afiliado').Asstring := ticket.DESCRIPCIONCLIENTE;
    end;
    if (Ticket.DESCRIPCIONCLIENTE = '') then
    begin
      dmfacturador.icomprobante.ParamByName('nom_afiliado').Asstring := '';
    end;
    dmfacturador.icomprobante.ParamByName('nro_matricula').Asstring := '';
    dmfacturador.icomprobante.ParamByName('nro_receta').Asstring := '';
    dmfacturador.icomprobante.ParamByName('tip_tratamiento').Asstring := 'N';
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;
 end;

 //--------------agregado OSMAMOVOBRASOCIAL------------------//

 //--------------agregado OSMADETALLEMOV------------------//
 if ticket.importeAplus <> 0 then
 begin

    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;
    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;
    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;
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
    i := 0;
    gdetalle.DataSource.DataSet.First;
    while not gdetalle.DataSource.DataSet.Eof do
    begin
      i := i + 1;
      dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring := 'ZBG';
      dmfacturador.icomprobante.ParamByName('nro_SUCURSAL').Asstring := Ticket.sucursal;
      dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring := Ticket.comprobante;
      dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring := ticket.nrocomprobantenf;
      dmfacturador.icomprobante.ParamByName('nro_item').Asinteger := i;
      dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger := gdetalle.Fields[0].Asinteger;
      dmfacturador.icomprobante.ParamByName('cod_laboratorio').Asstring := gdetalle.Fields[17].Asstring;
      dmfacturador.icomprobante.ParamByName('nom_largo').Asstring := gdetalle.Fields[1].Asstring;
      //
      dmfacturador.icomprobante.ParamByName('can_vendida').Asstring := gdetalle.Fields[7].Asstring;
      dmfacturador.icomprobante.ParamByName('imp_unitario').AsFloat := gdetalle.Fields[6].AsFloat * Ticket.coeficientetarjeta;
      dmfacturador.icomprobante.ParamByName('por_descuento').AsFloat := gdetalle.Fields[28].AsFloat;
      dmfacturador.icomprobante.ParamByName('imp_descuento').AsFloat := roundto((gdetalle.Fields[29].AsFloat * Ticket.coeficientetarjeta) / (gdetalle.Fields[7].AsFloat), -2);
      // roundto((ffacturador.Gfacturador.Fields[2].Asfloat*ffacturador.Gfacturador.Fields[11].Asfloat)/100,-2);
      dmfacturador.icomprobante.ParamByName('nro_troquel').Asinteger := gdetalle.Fields[0].Asinteger;
      dmfacturador.icomprobante.ParamByName('cod_validacion').Asstring := '0';
      dmfacturador.icomprobante.Open;
      dmfacturador.ticomprobante.Commit;
      gdetalle.DataSource.DataSet.Next;
    end;

 end;
  //--------------agregado OSMADETALLEMOV------------------//


end;



procedure Tfbuscartk.bbuscarClick(Sender: TObject);
var
archivoxmlval: txmldocument;
encabezadoval,rtaval,nrorefval,detalleval,
ITEMVAL,BARRASVAL,TROQUELVAL,DESCRIPCIONVAL,RTAPRODUCTO,CANTIDADVAL,PORCENTAJEVAL,IMPORTEUNITARIOVAL,IMPORTEAFIVAL,IMPORTECOBERVAL:ixmlnode;
flag: integer;
I: INTEGER;
itemsval:TTicketItemval;
leido: boolean;
   key: word;

begin
blimpiartodo.Click;
cdsdetalle.close;
odialog.Execute();
odialog.FileName;
//---- se cargan los datos del xml ----------//



                archivoxmlval:= TXMLDocument.Create(Application);
                archivoxmlval.LoadFromFile (odialog.FileName);
                archivoxmlval.Active:=true;
                archivoxmlval.DocumentElement.ChildNodes.Count;
                encabezadoval:=archivoxmlval.DocumentElement.ChildNodes[0];
                encabezadoval.ChildNodes.Count;
                TICKET.nrocomprobantenf:=encabezadoval.ChildNodes['NROTK'].text;
                ticket.comprobante:=encabezadoval.ChildNodes['tipo_comprobante'].text;
                ticket.cod_vendedor:=encabezadoval.ChildNodes['NRO_VENDEDOR'].Text;
                ticket.fechafiscal:=strtodatetime(encabezadoval.ChildNodes['fecha_comprobante'].Text);
                ticket.cod_cliente:=encabezadoval.ChildNodes['codigo_cliente'].Text;
                ticket.codigocc:=encabezadoval.ChildNodes['codigo_cc'].Text;
                ticket.codigotarjeta:=encabezadoval.ChildNodes['codigo_tj'].Text;
                ticket.codigocheque:=encabezadoval.ChildNodes['codigo_ch'].Text;
                ticket.codigo_OS:=encabezadoval.ChildNodes['codigo_os'].Text;
                ticket.codigo_co1:=encabezadoval.ChildNodes['codigo_co1'].Text;
                ticket.codigo_Cos2:=encabezadoval.ChildNodes['codigo_co2'].Text;
                ticket.importebruto:=strtofloat(encabezadoval.ChildNodes['importe_total'].Text);
                ticket.importeneto:=strtofloat(encabezadoval.ChildNodes['importe_neto'].Text);
                ticket.importecargoos:=strtofloat(encabezadoval.ChildNodes['importe_os'].Text);
                ticket.importecargoco1:=strtofloat(encabezadoval.ChildNodes['importe_co1'].Text);
                ticket.coeficientetarjeta:=strtofloat(encabezadoval.ChildNodes['coeficiente_tarjeta'].Text);
               ticket.importetotaldescuento:=strtofloat(encabezadoval.ChildNodes['imp_afectado'].Text);
                if encabezadoval.ChildNodes['pago_efectivo'].Text='' then
                begin
                 ticket.efectivo:=0;
                end;
                if encabezadoval.ChildNodes['pago_efectivo'].Text<>'' then
                begin
                ticket.efectivo:=strtofloat(encabezadoval.ChildNodes['pago_efectivo'].Text);
                end;
                if encabezadoval.ChildNodes['pago_tarjeta'].Text='' then
                begin
                ticket.tarjeta:=0;
                end;
                if encabezadoval.ChildNodes['pago_tarjeta'].Text<>''  then
                begin
                ticket.tarjeta:=strtofloat(encabezadoval.ChildNodes['pago_tarjeta'].Text);
                end;
                if encabezadoval.ChildNodes['pago_cc'].Text='' then
                begin
                ticket.ctacte:=0;
                end;
                if encabezadoval.ChildNodes['pago_cc'].Text<>'' then
                begin
                ticket.ctacte:=strtofloat(encabezadoval.ChildNodes['pago_cc'].Text);
                end;
                if encabezadoval.ChildNodes['pago_ch'].Text='' then
                begin
                ticket.cheque:=0;
                end;
                if encabezadoval.ChildNodes['pago_ch'].Text<>'' then
                begin
                ticket.cheque:=strtofloat(encabezadoval.ChildNodes['pago_ch'].Text);
                end;

                 if encabezadoval.ChildNodes['pago_aplus'].Text='' then
                begin
                ticket.importeAplus:=0;
                end;
                if encabezadoval.ChildNodes['pago_aplus'].Text<>'' then
                begin
                ticket.importeAplus:=strtofloat(encabezadoval.ChildNodes['pago_aplus'].Text);
                end;



                ticket.afiliado_numero:=encabezadoval.ChildNodes['afiliado_os'].Text;
                ticket.medico_nro_matricula:=encabezadoval.ChildNodes['matricula_medico'].Text;
                ticket.afiliado_numeroco1:=encabezadoval.ChildNodes['afiliado_co1'].Text;
                ticket.medico_nro_matriculaco1:=encabezadoval.ChildNodes['matricula_medicoco1'].Text;
                ticket.valnroreferencia:=encabezadoval.ChildNodes['codigo_Validacion'].Text;
                ticket.nro_caja:=encabezadoval.ChildNodes['Nro_caja'].Text;
                ticket.fechacaja:=strtodate(encabezadoval.ChildNodes['fecha_operativa'].Text);

                mticket.Lines.Add(datetostr(TICKET.fechafiscal)+'-----------------------------'+'Nro COMPROB: '+TICKET.comprobante+' '+TICKET.nrocomprobantenf);
                mticket.Lines.Add('VENDEDOR: '+TICKET.cod_vendedor);
                mticket.Lines.Add('Cliente: '+TICKET.cod_cliente+'----------------------'+'CTA. CTE: '+TICKET.codigocc);
                mticket.Lines.Add('CODIGO OS: '+ticket.codigo_OS);
                mticket.Lines.Add('Afiliado os: '+ticket.afiliado_numero);
                mticket.Lines.Add('Matricula: '+ticket.medico_nro_matricula);
                mticket.Lines.Add('Importe neto a cobrar: '+floattostr(ticket.importeneto));
                mticket.Lines.Add('Importe total: '+floattostr(ticket.importebruto));
                mticket.Lines.Add('Pago efectivo: '+floattostr(ticket.efectivo));
                mticket.Lines.Add('Pago tarjeta: '+floattostr(ticket.tarjeta));
                mticket.Lines.Add('Pago ctacte: '+floattostr(ticket.ctacte));
                mticket.Lines.Add('Pago cheque: '+floattostr(ticket.cheque));
                mticket.Lines.Add('Pago Aplus: '+floattostr(ticket.importeAplus));
                mticket.Lines.Add('Pago a cargo os: '+floattostr(ticket.importecargoos));
                mticket.Lines.Add('Pago a cargo co1: '+floattostr(ticket.importecargoco1));
                mticket.Lines.Add('Importe total descuento: '+floattostr(ticket.importetotaldescuento));
                mticket.Lines.Add('Codigo de validacion: '+ticket.valnroreferencia);
                detalleval:=archivoxmlval.DocumentElement.ChildNodes[1];

                if cdsdetalle.Active=false then
                    begin



                      cdsdetalle.Active:=true;
                    end;
                    for I := 0 to DETALLEVAL.ChildNodes.Count -1 do
                        BEGIN
                          ITEMVAL:=DETALLEVAL.ChildNodes[I];
                          cdsdetalle.Append;
                          cdsdetallenro_troquel.Asstring:=itemval.ChildNodes['nro_troquel'].Text;
                          cdsdetallenom_largo.Asstring:=itemval.ChildNodes['nom_largo'].Text;
                          cdsdetalleprecio.Asstring:=itemval.ChildNodes['precio'].Text;
                          cdsdetallecantidad.Asstring:=itemval.ChildNodes['cantidad'].Text;
                          cdsdetalledescuentos.Asstring:=itemval.ChildNodes['descuentos'].Text;
                          cdsdetalleprecio_totaldesc.Asstring:=itemval.ChildNodes['precio_totaldesc'].Text;
                          cdsdetalleprecio_total.Asstring:=itemval.ChildNodes['precio_total'].Text;
                          cdsdetalleporcentaje.Asstring:=itemval.ChildNodes['porcentaje'].Text;
                          cdsdetallecod_alfabeta.Asstring:=itemval.ChildNodes['cod_alfabeta'].Text;
                          cdsdetallecod_barraspri.Asstring:=itemval.ChildNodes['cod_barraspri'].Text;
                          cdsdetallecod_iva.Asstring:=itemval.ChildNodes['cod_iva'].Text;
                          cdsdetalleporcentajeos.Asstring:=itemval.ChildNodes['porcentajeos'].Text;
                          cdsdetalleporcentajeco1.Asstring:=itemval.ChildNodes['porcentajeco1'].Text;
                          cdsdetalleporcentajeco2.Asstring:=itemval.ChildNodes['porcentajeco2'].Text;
                          cdsdetalledescuentosos.Asstring:=itemval.ChildNodes['descuentosos'].Text;
                          cdsdetallecod_laboratorio.Asstring:=itemval.ChildNodes['cod_laboratorio'].Text;
                          cdsdetallecan_stk.Asstring:=itemval.ChildNodes['can_stk'].Text;
                          cdsdetallevale.Asstring:=itemval.ChildNodes['vale'].Text;
                          cdsdetallecan_vale.Asstring:=itemval.ChildNodes['can_vale'].Text;
                          cdsdetalletamano.Asstring:=itemval.ChildNodes['tamano'].Text;
                          cdsdetalledescuentoco1.Asstring:=itemval.ChildNodes['descuentoco1'].Text;
                          cdsdetallemodificado.Asstring:=itemval.ChildNodes['modificado'].Text;
                          cdsdetallegentileza.Asstring:=itemval.ChildNodes['gentileza'].Text;
                          cdsdetallerubro.Asstring:=itemval.ChildNodes['rubro'].Text;
                          cdsdetalleimportegent.Asstring:=itemval.ChildNodes['importegent'].Text;
                          cdsdetallecodautorizacion.Asstring:=itemval.ChildNodes['cod_autorizacion'].Text;
                          cdsdetalleitem.Asstring:=itemval.ChildNodes['NroItem'].Text;

                          cdsdetalleIMPORTEAPLUS.AsString:= itemval.ChildNodes['importe_aplus'].Text;
                          cdsdetalleAPLUS.AsString:=itemval.ChildNodes['porcentaje_aplus'].Text;


                        end;
               ticket.itemstotales:=DETALLEVAL.ChildNodes.Count;


  calcularIVA;







 end;


procedure Tfbuscartk.binsertarClick(Sender: TObject);



var
   i: integer;
   iva: double;
   condIva:String;
  //importeTotal
   baseImponible, importeIva, unaTasa:Double;
   unaTasaIVA:TTasaIVA;
   form: tfprogreso;
   form2: tfnumeracion;
   stockparcial: integer;
begin

   if APPLICATION.MessageBox(' Desea agregar manualmente la numeracion? ','Numeracion', MB_YESNO or MB_DEFBUTTON2) = IDYES    then
       BEGIN
        form2:=tfnumeracion.Create(self);
        form2.SetTicket(ticket);
        form2.ShowModal;
        if ticket.nrocomprobantenf='' then
        begin
        ticket.nrocomprobantenf:=INTTOSTR(STRTOINT(dmfacturador.qnrocomprob.Fields[0].Text)+1);
        end;
       END;
  form:=tfprogreso.Create(self);
  form.Show;
  application.ProcessMessages;

   //-------------------------tablas ivas-------------------------------//
  dmfacturador.qtablaiva.Close;
  dmfacturador.qtablaiva.SQL.Text:=concat('select cod_iva, por_iva from prmaiva');
  dmfacturador.qtablaiva.Open;
  dmfacturador.qtablaiva.First;
  while not dmfacturador.qtablaiva.Eof do
  begin
  if dmfacturador.qtablaiva.Fields[0].Text='A' THEN
  BEGIN
    TICKET.IVAA:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
  if dmfacturador.qtablaiva.Fields[0].Text='B' THEN
  BEGIN
    TICKET.IVAB:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
    if dmfacturador.qtablaiva.Fields[0].Text='C' THEN
  BEGIN
    TICKET.IVAC:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
    if dmfacturador.qtablaiva.Fields[0].Text='D' THEN
  BEGIN
    TICKET.IVAD:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
      if dmfacturador.qtablaiva.Fields[0].Text='E' THEN
  BEGIN
    TICKET.IVAE:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
      if dmfacturador.qtablaiva.Fields[0].Text='F' THEN
  BEGIN
    TICKET.IVAF:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
      if dmfacturador.qtablaiva.Fields[0].Text='s' THEN
  BEGIN
    TICKET.IVAs:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
  dmfacturador.qtablaiva.Next;
  end;

  //-------------------------tablas ivas-------------------------------//

 //INSERTAR VTMACOMPROBANTE  VR
        if dmfacturador.ticomprobante.InTransaction then
             begin
              dmfacturador.ticomprobante.Rollback;
              end;
              dmFacturador.AbrirConexion();
            dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

            dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
            dmfacturador.icomprobante.Close;
            dmfacturador.icomprobante.SQL.Clear;

            dmfacturador.icomprobante.Close;
            dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMACOMPROBEMITIDO                                 ',
                                                         ' (NRO_SUCURSAL,                                              ',
                                                         ' TIP_COMPROBANTE,                                          ',
                                                         ' NRO_COMPROBANTE,                                        ',
                                                         ' NRO_CAJA,                                             ',
                                                         ' COD_VENDEDOR,                                       ',
                                                         ' NRO_TRANSACCION,                                  ',
                                                         ' COD_CLIENTE,                                    ',
                                                         ' NOM_CLIENTE,                                  ',
                                                         ' COD_PROVEEDOR,                              ',
                                                         ' FEC_COMPROBANTE,                          ',
                                                         ' DES_LEYENDA,                            ',
                                                         ' FEC_PROXVENC_RECETA,                  ',
                                                         ' MAR_TRATAMIENTO,                    ',
                                                         ' CAN_REIMPRESO,                    ',
                                                         ' MAR_ANULADO,                    ',
                                                         ' NRO_SUC_CANCELADO,            ',
                                                         ' TIP_COMPROB_CANCELADO,      ',
                                                         ' NRO_COMPROB_CANCELADO,    ',
                                                         ' FEC_COMPROB_CANCELADO,  ',
                                                          'DES_PARTICULARIDAD,   ',
                                                          'MAR_ODONTOLOGO,                                                ',
                                                          'NRO_PBM,                                                      ',
                                                          'NOM_MEDICO,                                                  ',
                                                          'CAN_ITEMS,                                                  ',
                                                          'IMP_FINANC,                                                ',
                                                          'IMP_NETO,                                                 ',
                                                          'IMP_BRUTO,                                                ',
                                                         ' IMP_INTERES,                                             ',
                                                         ' IMP_GENTILEZA_FARM,                                      ',
                                                         ' MAR_PASOXCAJA,                                           ',
                                                         ' MAR_IMPRE_SUBDIA,                                      ',
                                                         ' MAR_IMPRESO_FISCAL,                                  ',
                                                         ' CAN_REIMPRESO_AUD,                                 ',
                                                         ' IMP_VALES,                                       ',
                                                         ' IMP_SALDO,                                     ',
                                                         ' FEC_REF,                                     ',
                                                         ' FEC_OPERATIVA,                             ',
                                                         ' MAR_RESERVADO,                           ',
                                                         ' IMP_APAGAR,                            ',
                                                         ' IMP_PERCEPCION,                      ',
                                                         ' MAR_ORIGEN,                        ',
                                                         ' COD_CLINICA,                     ',
                                                         ' NOM_CLINICA,                   ',
                                                         ' COD_AUTORIZACION,            ',
                                                         ' POR_GENTILEZA_FARM,        ',
                                                         ' POR_IVA)                 ',
                                                         ' VALUES (               ',
                                                         ' :sucursal,           ',
                                                         ' :tkcomprobante,                                      ',
                                                         ' :nrocomprobante,                                    ',
                                                         ' :caja,                                          ',
                                                         ' :vendedor,                                    ',
                                                         ' :transaccion,                               ',
                                                         ' :cod_cliente,                             ',
                                                         ' :nom_cliente,                           ',
                                                         ' NULL,                                 ',
                                                         ' :fec_comprobante,                   ',
                                                         ' '''',                               ',
                                                         ' :fec_receta,                    ',
                                                         ' :mar_tratamiento,             ',
                                                         ' 0,                          ',
                                                         ' ''N'',                      ',
                                                         ' :sucursal,              ',
                                                         ' NULL,                 ',
                                                         ' NULL,                 ',
                                                         ' NULL,                                   ',
                                                         ' '''',                                    ',
                                                         ' ''N'',                                  ',
                                                         ' -1,                                  ',
                                                         ' :MEDICO,                            ',
                                                         ' :CANTIDADINTEMS,                   ',
                                                         ' 0,                                ',
                                                         ' :IMP_NETO,                        ',
                                                         ' :IMP_BRUTO,                      ',
                                                         ' 0,                              ',
                                                         ' 0,                             ',
                                                         ' :PASOXCAJA,                   ',
                                                         ' NULL,                         ',
                                                         ' ''S'',                         ',
                                                         ' 0,                          ',
                                                         ' 0,                         ',
                                                         ' :SALDOCC,                  ',
                                                         ' :FEC_REF,                 ',
                                                         ' :FEC_OPERATIVA,          ',
                                                         ' NULL,                   ',
                                                         ' NULL,                  ',
                                                         ' 0,                    ',
                                                         ' ''F'',                 ',
                                                         ' NULL,               ',
                                                         ' NULL,               ',
                                                         ' :CODAUTORIZACION, ',
                                                         ' NULL, ',
                                                         ' NULL)');



        dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TKCOMPROBANTE').ASSTRING:=ticket.comprobante;
        dmfacturador.icomprobante.ParamByName('NROCOMPROBANTE').ASSTRING:=ticket.nrocomprobantenf;
        if TICKET.nro_caja='999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('CAJA').ASSTRING:='999';
        END;
        if TICKET.nro_caja<>'999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('CAJA').ASSTRING:=TICKET.nro_caja;
        END;
        dmfacturador.icomprobante.ParamByName('VENDEDOR').ASSTRING:=ticket.cod_vendedor;
        dmfacturador.icomprobante.ParamByName('TRANSACCION').AsString:=ticket.nrocomprobantenf;
        dmfacturador.icomprobante.ParamByName('COD_CLIENTE').AsString:=ticket.codigocliente;
        dmfacturador.icomprobante.ParamByName('nom_cliente').AsString:='';
        dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDateTime:=ticket.fechafiscal;
        dmfacturador.icomprobante.ParamByName('fec_receta').asdate:=ticket.fechafiscal;
        if TICKET.codigo_tratamiento='' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('mar_tratamiento').AsString:='N';
        END;
         if TICKET.codigo_tratamiento<>'' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('mar_tratamiento').AsString:=TICKET.codigo_tratamiento;
        END;
        dmfacturador.icomprobante.ParamByName('sucursal').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('MEDICO').AsString:='';
        dmfacturador.icomprobante.ParamByName('CANTIDADINTEMS').Asinteger:=ticket.itemstotales;
        dmfacturador.icomprobante.ParamByName('IMP_NETO').AsFloat:=ticket.importeneto;
        dmfacturador.icomprobante.ParamByName('IMP_BRUTO').AsFloat:=ticket.importebruto;
         if TICKET.nro_caja='999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('PASOXCAJA').ASSTRING:='N';
        END;
        if TICKET.nro_caja<>'999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('PASOXCAJA').ASSTRING:='S';
        END;

        dmfacturador.icomprobante.ParamByName('SALDOCC').ASFLOAT:=0;
        dmfacturador.icomprobante.ParamByName('FEC_REF').ASdate:=TICKEt.fechacaja;
        if TICKET.nro_caja='999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('FEC_OPERATIVA').asstring:='';
        END;
        if TICKET.nro_caja<>'999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('FEC_OPERATIVA').AsDate:=ticket.fechacaja;
        END;
        dmfacturador.icomprobante.ParamByName('CODAUTORIZACION').AsString:=ticket.valnroreferencia;

        //dmFacturador.icomprobante.SQL.SaveToFile('C:\NET\comprobante.sql');

        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;







 //INSTERTAR VTMADETALLECOMPROB -----------------------------------------// VR



  if dmfacturador.ticomprobante.InTransaction then
      begin
       dmfacturador.ticomprobante.Rollback;
      end;
            dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

            dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
            dmfacturador.icomprobante.Close;
            dmfacturador.icomprobante.SQL.Clear;


            dmfacturador.icomprobante.Close;
            dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMADETALLECOMPROB ',
                                                        '(NRO_SUCURSAL,                  ',
                                                        'TIP_COMPROBANTE,                 ',
                                                        'NRO_COMPROBANTE,                  ',
                                                        'NRO_ITEM,                          ',
                                                        'COD_ALFABETA,                       ',
                                                        'NOM_PRODUCTO,                        ',
                                                        'CAN_CANTIDAD,                         ',
                                                        'IMP_UNITARIO,                          ',
                                                        'IMP_IVADESC,                            ',
                                                        'IMP_IVA_NETO,                            ',
                                                        'IMP_IVATASA,                              ',
                                                        'IMP_PRODNETO,                              ',
                                                        'IMP_GENTILEZA_FARM,                         ',
                                                        'MAR_MODIF,                                   ',
                                                        'MAR_MOTVENTA,                                 ',
                                                        'CAN_VALE,                                      ',
                                                        'TIP_VALE,                                       ',
                                                        'COD_PROD_REC,                                   ',
                                                        'COD_AUTORIZACION)                               ',
                                                        '                                                ',
                                                        'VALUES (:nro_sucursal,                          ',
                                                        ':TIP_COMPROBANTE,                                        ',
                                                        ':nro_comprobante,                               ',
                                                        ':nro_item,                                      ',
                                                        ':cod_alfabeta,                                  ',
                                                        ':nom_producto,                                  ',
                                                        ':cantidad,                                      ',
                                                        ':imp_unitario,                                  ',
                                                        ':IMP_IVADESC,                                   ',
                                                        ':IMP_IVANETO,                                   ',
                                                        ':IMP_IVATASA,                                   ',
                                                        ':IMP_PRODNETO,                                  ',
                                                        '0,                                              ',
                                                        '''N'',                                          ',
                                                        'NULL,                                           ',
                                                        ':can_vale,                                     ',
                                                        'NULL,                                           ',
                                                        'NULL,                                           ',
                                                        ''''');');


i:=0;

gdetalle.DataSource.DataSet.first;
while not gdetalle.DataSource.DataSet.Eof do
    begin
    i:=i+1;
     dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').asstring:=TICKET.comprobante;
     dmfacturador.icomprobante.ParamByName('nro_sucursal').asstring:=ticket.sucursal;
     dmfacturador.icomprobante.parambyname('nro_comprobante').AsString:=ticket.nrocomprobantenf;
     dmfacturador.icomprobante.ParamByName('nro_item').Asinteger:=i;
     dmfacturador.icomprobante.parambyname('cod_alfabeta').Asinteger:=gdetalle.Fields[0].AsInteger;
     dmfacturador.icomprobante.parambyname('nom_producto').asstring:=gdetalle.Fields[4].AsString;
     dmfacturador.icomprobante.parambyname('cantidad').asinteger:=gdetalle.Fields[7].Asinteger;
     dmfacturador.icomprobante.parambyname('imp_unitario').asfloat:=gdetalle.Fields[6].asfloat;
     dmfacturador.icomprobante.parambyname('can_vale').asinteger:=gdetalle.Fields[19].Asinteger;
     //----------cuando tiene obra social o coseguro cambia el campo del iva--------------------///
  if not ((ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') or (ticket.codigo_Cos2<>''))  then
  begin
    if gdetalle.fields[8].AsString='B' then
    begin
    iva:=(ticket.IVAB/100)+1;
     dmfacturador.icomprobante.parambyname('imp_ivaneto').AsFloat:=(gdetalle.Fields[6].asfloat*gdetalle.Fields[7].Asinteger)-((gdetalle.Fields[6].asfloat*gdetalle.Fields[7].Asinteger)/iva);
     dmfacturador.icomprobante.parambyname('imp_ivadesc').AsFloat:=0;
    end;
    if gdetalle.fields[8].AsString<>'B' then
    begin
    iva:=0;
     dmfacturador.icomprobante.parambyname('imp_ivaneto').AsFloat:=(gdetalle.Fields[6].asfloat*gdetalle.Fields[7].Asinteger)*iva;
     dmfacturador.icomprobante.parambyname('imp_ivadesc').AsFloat:=0;
    end;

  end;


    if (ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') or (ticket.codigo_Cos2<>'')  then
  begin
    if gdetalle.fields[8].AsString='B' then
    begin
    iva:=(ticket.IVAB/100)+1;
     dmfacturador.icomprobante.parambyname('imp_ivadesc').AsFloat:=(gdetalle.Fields[6].asfloat*gdetalle.Fields[7].Asinteger)-((gdetalle.Fields[6].asfloat*gdetalle.Fields[7].Asinteger)/iva);
     dmfacturador.icomprobante.parambyname('imp_ivaneto').AsFloat:=0;
    end;
    if gdetalle.fields[8].AsString<>'B' then
    begin
    iva:=0;
     dmfacturador.icomprobante.parambyname('imp_ivadesc').AsFloat:=(gdetalle.Fields[6].asfloat*gdetalle.Fields[7].Asinteger)*iva;
     dmfacturador.icomprobante.parambyname('imp_ivaneto').AsFloat:=0;
    end;
//----------cuando tiene obra social o coseguro cambia el campo del iva--------------------///
  end;
    dmfacturador.icomprobante.parambyname('imp_ivatasa').AsFloat:=0;
    dmfacturador.icomprobante.parambyname('imp_prodneto').AsFloat:=(gdetalle.Fields[6].asfloat*gdetalle.Fields[7].Asinteger)-gdetalle.Fields[9].Asfloat;
    dmfacturador.icomprobante.Open;
    dmFacturador.ticomprobante.Commit;
    gdetalle.DataSource.DataSet.Next;
    end;



 //INSERTAR VTMAPORCENTAJESIVA   ----VR LLEVA PERO TODOS LOS VALORES EN 0

if dmfacturador.ticomprobante.InTransaction  then
dmfacturador.ticomprobante.Rollback;

dmfacturador.ticomprobante.StartTransaction;
dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
dmfacturador.icomprobante.Close;
dmfacturador.icomprobante.SQL.Clear;


dmfacturador.icomprobante.Close;
dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMAPORCENTAJESIVA                        ',
                                            '(NRO_SUCURSAL,                                       ',
                                            'TIP_COMPROBANTE,                                     ',
                                            'NRO_COMPROBANTE,                                     ',
                                            'NRO_ITEM,                                           ',
                                            'POR_PORCENTAJE,                                     ',
                                            'POR_SOBRETASA,                                     ',
                                            'IMP_NETOGRAV,                                      ',
                                            'IMP_IVA,                                         ',
                                            'IMP_IVASOBRETASA,                              ',
                                            'IMP_NETOGRAV_DESC,                           ',
                                            'IMP_IVA_DESC,                              ',
                                            'IMP_IVASOBRETASA_DESC)                   ',
                                            '                                       ',
                                            'VALUES (:nro_sucursal,                   ',
                                            ':tip_comprobante,  ',
                                            ':nro_comprobante,                ',
                                            ':nro_item,                     ',
                                            ':por_porcentaje,             ',
                                            ':por_sobretasa,            ',
                                            ':imp_netograv,            ',
                                            ':imp_iva,                ',
                                            ':imp_ivasobretasa,     ',
                                            ':imp_netograv_desc,   ',
                                            ':imp_iva_desc,      ',
                                            'NULL);');

i:=0;

for condIVA in ticket.TotalesIVA.Keys do
Begin
  i:=i+1;
  ticket.TotalesIVA.TryGetValue(condIVa, unaTasaIVA);
  dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').asstring:=TICKET.comprobante;
  dmfacturador.icomprobante.ParamByName('nro_sucursal').asstring:=ticket.sucursal;
  dmfacturador.icomprobante.parambyname('nro_comprobante').AsString:=ticket.nrocomprobantenf;
  dmfacturador.icomprobante.ParamByName('nro_item').Asinteger:=i;

  //Obtener la tasa de iva de la tabla PRMAIVA con la condicion condIVA
  if condIVA ='A' then unaTasa:=ticket.IVAA
  else if condIVA='B' then unaTasa:=ticket.IVAB
  else if condIVA='D' then unaTasa:=ticket.IVAD
  else if condIVA='E' then unaTasa:=ticket.IVAE
  else if condIVA='s' then unaTasa:=ticket.IVAs;


  //Si es S poner el monto sobretrasa sino 0
  iva:=unaTasa/100;
  baseImponible:=unaTasaIVA.importeTotal /(1+iva);
  importeIVA:=baseImponible*iva;

  dmfacturador.icomprobante.parambyname('por_sobretasa').asstring:='0';
  dmfacturador.icomprobante.parambyname('por_porcentaje').AsFloat:=unaTasa;


  dmfacturador.icomprobante.parambyname('imp_netograv').asfloat:=unaTasaIVA.netogravado;
  dmfacturador.icomprobante.parambyname('imp_netograv_desc').AsFloat:=unaTasaIVA.netogravadodesc;


  dmfacturador.icomprobante.parambyname('imp_iva').asfloat:= unaTasaIVA.imp_iva;

  dmfacturador.icomprobante.parambyname('imp_iva_desc').AsFloat:=unaTasaIVA.imp_ivadesc;

  dmfacturador.icomprobante.parambyname('imp_ivasobretasa').AsFloat:=0;
  dmfacturador.icomprobante.Open;
  dmfacturador.ticomprobante.Commit;
  End;




 //INSERTAR VTTBPAGOCHEQUE          --VR LLEVA TODOS LOS MEDIOS DE PAGO

if ticket.cheque<>0 then
begin
     if dmfacturador.ticomprobante.InTransaction  then
    dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

    dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;


    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTTBPAGOCHEQUE (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_BANCO, COD_CTA, NRO_CHEQUE, IMP_CHEQUE) VALUES (:sucursal,:tip_comprobante, :nro_comprobante, :cod_banco, '''', :nro_cheque, :importe_cheque);');



    dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobante').AsString:=ticket.nrocomprobantenf;
    dmfacturador.icomprobante.ParamByName('cod_banco').AsString:=ticket.codigocheque;
    dmfacturador.icomprobante.ParamByName('nro_cheque').AsString:=ticket.nrocomprobantenf;
    dmfacturador.icomprobante.ParamByName('importe_cheque').AsFloat:=ticket.cheque;
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

end;

//INSTERTAR VTTPAGOCTACTE

if ticket.ctacte<>0 then
        begin
         if dmfacturador.ticomprobante.InTransaction  then
        dmfacturador.ticomprobante.Rollback;

        dmfacturador.ticomprobante.StartTransaction;
        dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

        dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Clear;


        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTTBPAGOCTACTE ',
                                                   '(NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_CTACTE, COD_SUBCTA, COD_AUTORIZACTA, IMP_CTACTE, IMP_SALDO, ',
                                                   ' MAR_RESUMIDO, NRO_SUCURSAL_LIQ, NRO_LIQUIDACION, CAN_CUOTAS, CAN_CUOTASPEN, POR_IVA, CODIGOPAGO) ',
                                                   ' VALUES (:NRO_SUCURSAL,:TIP_COMPROBANTE , :NRO_COMPROB, :COD_CTACTE, :COD_SUBCTA, '''', :IMP_CTACTE, :IMP_SCTACTE, ''N'', 0, NULL, 0, 0, NULL, NULL)');


        dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
        dmfacturador.icomprobante.ParamByName('nro_comprob').AsString:=ticket.nrocomprobantenf;
        dmfacturador.icomprobante.ParamByName('COD_CTACTE').AsString:=ticket.codigocc;
        dmfacturador.icomprobante.ParamByName('cod_subcta').AsString:=ticket.codigocc;
        dmfacturador.icomprobante.ParamByName('imp_ctacte').AsFloat:=ticket.ctacte;
        dmfacturador.icomprobante.ParamByName('imp_sctacte').AsFloat:=ticket.ctacte;
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;

end;

//INSERTAR VTTPAGOEFECTIVO

 if ticket.efectivo<>0 then
        begin
         if dmfacturador.ticomprobante.InTransaction  then
        dmfacturador.ticomprobante.Rollback;

        dmfacturador.ticomprobante.StartTransaction;
        dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

        dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Clear;


        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTTBPAGOEFECTIVO (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_MONEDA, IMP_EFECTIVO, IMP_COTIZ, POR_IVA)',
                                                   ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, ''$'', :IMP_EFECTIVO, NULL, NULL)');


        dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
        dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
        dmfacturador.icomprobante.ParamByName('imp_EFECTIVO').AsFloat:=ticket.efectivo;
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;

        end;





 //INSERTAR VTTBPAGOTARJETA


 if ticket.tarjeta<>0 then
        begin
         if dmfacturador.ticomprobante.InTransaction  then
        dmfacturador.ticomprobante.Rollback;

        dmfacturador.ticomprobante.StartTransaction;
        dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

        dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Clear;


        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTTBPAGOTARJETA (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_TARJETA, NRO_TARJETA, COD_MONEDA, NRO_CUPON, ',
                                                   ' IMP_TARJETA, IMP_COTIZ, NRO_CUOTA, NRO_AUTORIZACION, NRO_LIQUIDACION, FEC_VENCIMIENTO, NRO_PIN, POR_IVA, CODIGOPAGO)',
                                                   ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_TARJETA, ''0'', ''$'', NULL, :IMP_TARJETA, NULL, 0, 0, NULL, CURRENT_DATE , 0, NULL, NULL)');



        dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
        dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
        dmfacturador.icomprobante.ParamByName('COD_TARJETA').AsString:=ticket.codigotarjeta;
        dmfacturador.icomprobante.ParamByName('imp_tarjeta').AsFloat:=ticket.tarjeta;
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;

        end;




 //INSERTAR VTMADESCCOMPROB     ------VR LLEVA PERO SIN IMPORTES


 if TICKET.codigo_OS<>'' THEN
 begin
        i:=0;

        gdetalle.DataSource.DataSet.first;
        while not gdetalle.DataSource.DataSet.Eof do
          begin
          I:=I+1;
           if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
                                                     ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_OS;
          dmfacturador.icomprobante.ParamByName('ITEM').AsFloat:=I;
          dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat:=gdetalle.Fields[11].AsInteger;
          dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat:=gdetalle.Fields[14].Asfloat;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          gdetalle.DataSource.DataSet.Next;
          end;
 end;

  if TICKET.codigo_Co1<>'' THEN
 begin
        i:=0;

        gdetalle.DataSource.DataSet.first;
        while not gdetalle.DataSource.DataSet.Eof do
          begin
          I:=I+1;
           if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
                                                     ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Co1;
          dmfacturador.icomprobante.ParamByName('ITEM').AsFloat:=I;
          dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat:=gdetalle.Fields[12].AsInteger;
          dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat:=gdetalle.Fields[15].Asfloat;
          dmfacturador.ticomprobante.Commit;
           gdetalle.DataSource.DataSet.Next;
          end;
 end;
 if TICKET.codigo_Cos2<>'' THEN
 begin
        i:=0;

         gdetalle.DataSource.DataSet.first;
         while not  gdetalle.DataSource.DataSet.Eof do
          begin
          I:=I+1;
           if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
                                                     ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Cos2;
          dmfacturador.icomprobante.ParamByName('ITEM').AsFloat:=I;
          dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat:=gdetalle.Fields[6].AsInteger;
          dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat:=gdetalle.Fields[7].Asfloat;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          gdetalle.DataSource.DataSet.Next;
          end;
 end;


 //INSERTAR VTMADETALLEAFILOS  ---vr lleva     sin importes tambien


if TICKET.codigo_os<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMADETALLEAFILOS ',
                                                     ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
                                                     ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
                                                     ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
                                                     ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
                                                     ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');




          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_os;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_nro_matricula;
          dmfacturador.icomprobante.ParamByName('nom_medico').asstring:=ticket.medico_nombre+' '+ticket.medico_apellido;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('fec_recet').Asdate:=ticket.fecha_receta;
          dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency:=ticket.importecargoos;
          dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency:=ticket.importebruto;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;

 if TICKET.codigo_Co1<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMADETALLEAFILOS ',
                                                     ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
                                                     ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
                                                     ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
                                                     ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
                                                     ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');




          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Co1;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_tipo_matriculaco1+ticket.medico_nro_matriculaco1;
          dmfacturador.icomprobante.ParamByName('nom_medico').asstring:=ticket.medico_nombre+' '+ticket.medico_apellido;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('fec_recet').Asdate:=ticket.fecha_recetaco1;
          dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency:=ticket.importecargoos;
          dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency:=ticket.importebruto;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;
  if TICKET.codigo_cos2<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMADETALLEAFILOS ',
                                                     ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
                                                     ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
                                                     ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
                                                     ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
                                                     ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');






          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Cos2;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_nro_matricula;
          dmfacturador.icomprobante.ParamByName('nom_medico').asstring:=ticket.medico_nombre+' '+ticket.medico_apellido;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('fec_recet').Asdate:=ticket.fecha_recetaco1;
          dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency:=ticket.importecargoos;
          dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency:=ticket.importebruto;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;



 //INSERTAR OSMAMOVOBRASOCIAL     --vr no lleva

  if TICKET.codigo_os<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


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





          dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIPO_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_os;
          dmfacturador.icomprobante.ParamByName('nom_obrasocial').AsString:=TICKET.nombre_os;
          dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDatetime:=ticket.fechafiscal;
          dmfacturador.icomprobante.ParamByName('fec_receta').Asdate:=ticket.fechafiscal;
          dmfacturador.icomprobante.ParamByName('imp_ticket').Asfloat:=ticket.importebruto;
          dmfacturador.icomprobante.ParamByName('imp_afectado').Asfloat:=ticket.importetotaldescuento;
          dmfacturador.icomprobante.ParamByName('imp_cargoos').Asfloat:=ticket.importecargoos;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          if (ticket.afiliado_nombre<>'') and (ticket.afiliado_apellido<>'') then
          begin
          dmfacturador.icomprobante.ParamByName('nom_afiliado').asstring:=ticket.afiliado_nombre+' '+ticket.afiliado_apellido;
          end;
          if (ticket.afiliado_nombre='') or (ticket.afiliado_apellido='') then
          begin
          dmfacturador.icomprobante.ParamByName('nom_afiliado').asstring:=ticket.afiliado_apellido;
          end;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_tipo_matricula+ticket.medico_nro_matricula;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('tip_tratamiento').Asstring:='N';
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;


if TICKET.codigo_Co1<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


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





          dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIPO_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Co1;
          dmfacturador.icomprobante.ParamByName('nom_obrasocial').AsString:=TICKET.nombre_co1;
          dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDatetime:=ticket.fechafiscal;
          dmfacturador.icomprobante.ParamByName('fec_receta').Asdate:=ticket.fecha_recetaco1;
          dmfacturador.icomprobante.ParamByName('imp_ticket').Asfloat:=ticket.importebruto;
          dmfacturador.icomprobante.ParamByName('imp_afectado').Asfloat:=ticket.importetotaldescuento;
          dmfacturador.icomprobante.ParamByName('imp_cargoos').Asfloat:=ticket.importecargoco1;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numeroco1;
          if (ticket.afiliado_nombreco1<>'') and (ticket.afiliado_apellidoco1<>'') then
          begin
          dmfacturador.icomprobante.ParamByName('nom_afiliado').asstring:=ticket.afiliado_nombreco1+' '+ticket.afiliado_apellidoco1;
          end;
          if (ticket.afiliado_nombreco1='') and (ticket.afiliado_apellidoco1='') then
          begin
          dmfacturador.icomprobante.ParamByName('nom_afiliado').asstring:=ticket.afiliado_apellidoco1;
          end;

          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_tipo_matricula+ticket.medico_nro_matriculaco1;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_recetaco1;
          dmfacturador.icomprobante.ParamByName('tip_tratamiento').Asstring:='N';
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;

 if TICKET.codigo_Cos2<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


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





          dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIPO_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Cos2;
          dmfacturador.icomprobante.ParamByName('nom_obrasocial').AsString:=TICKET.nombre_cos2;
          dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDatetime:=ticket.fechafiscal;
          dmfacturador.icomprobante.ParamByName('fec_receta').Asdate:=ticket.fecha_recetaco1;
          dmfacturador.icomprobante.ParamByName('imp_ticket').Asfloat:=ticket.importebruto;
          dmfacturador.icomprobante.ParamByName('imp_afectado').Asfloat:=ticket.importetotaldescuento;
          dmfacturador.icomprobante.ParamByName('imp_cargoos').Asfloat:=ticket.importecargoco2;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          dmfacturador.icomprobante.ParamByName('nom_afiliado').asstring:=ticket.afiliado_nombre+' '+ticket.afiliado_apellido;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_nro_matricula;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('tip_tratamiento').Asstring:=ticket.codigo_tratamiento;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;

 //INSTERTAR OSMADETALLEMOV     --vr no lleva


 if TICKET.codigo_os<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


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



i:=0;
gdetalle.DataSource.DataSet.first;
while not gdetalle.DataSource.DataSet.Eof do
    begin
          i:=i+1;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_os;
          dmfacturador.icomprobante.ParamByName('nro_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('nro_item').Asinteger:=i;
          dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger:=gdetalle.Fields[0].AsInteger;
          dmfacturador.icomprobante.ParamByName('cod_laboratorio').AsString:=gdetalle.Fields[17].Asstring;
          dmfacturador.icomprobante.ParamByName('nom_largo').AsString:=gdetalle.Fields[4].Asstring;//
          dmfacturador.icomprobante.ParamByName('can_vendida').AsString:=gdetalle.Fields[7].Asstring;
          dmfacturador.icomprobante.ParamByName('imp_unitario').Asfloat:=gdetalle.Fields[6].Asfloat;
          dmfacturador.icomprobante.ParamByName('por_descuento').Asinteger:=gdetalle.Fields[11].Asinteger;
          dmfacturador.icomprobante.ParamByName('imp_descuento').Asfloat:=gdetalle.Fields[14].Asfloat;
          dmfacturador.icomprobante.ParamByName('nro_troquel').Asinteger:=gdetalle.Fields[1].Asinteger;
          dmfacturador.icomprobante.ParamByName('cod_validacion').AsString:=ticket.valnroreferencia;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          gdetalle.DataSource.DataSet.Next;
    end;

 end;

 if TICKET.codigo_co1<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


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



i:=0;
gdetalle.DataSource.DataSet.first;
while not gdetalle.DataSource.DataSet.Eof do
    begin
          i:=i+1;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKEt.codigo_Co1;
          dmfacturador.icomprobante.ParamByName('nro_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('nro_item').Asinteger:=i;
          dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger:=gdetalle.Fields[0].AsInteger;
          dmfacturador.icomprobante.ParamByName('cod_laboratorio').AsString:='';
          dmfacturador.icomprobante.ParamByName('nom_largo').AsString:=gdetalle.Fields[4].Asstring;//
          dmfacturador.icomprobante.ParamByName('can_vendida').AsString:=gdetalle.Fields[7].Asstring;
          dmfacturador.icomprobante.ParamByName('imp_unitario').Asfloat:=gdetalle.Fields[6].Asfloat;
          dmfacturador.icomprobante.ParamByName('por_descuento').Asinteger:=gdetalle.Fields[12].Asinteger;
          dmfacturador.icomprobante.ParamByName('imp_descuento').Asfloat:=gdetalle.Fields[15].Asfloat;
          dmfacturador.icomprobante.ParamByName('nro_troquel').Asinteger:=gdetalle.Fields[1].Asinteger;
          dmfacturador.icomprobante.ParamByName('cod_validacion').AsString:=ticket.valnroreferencia;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          gdetalle.DataSource.DataSet.Next;
    end;

 end;


if TICKET.codigo_cos2<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


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



i:=0;
gdetalle.DataSource.DataSet.first;
while not gdetalle.DataSource.DataSet.Eof do
    begin
          i:=i+1;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKEt.codigo_Cos2;
          dmfacturador.icomprobante.ParamByName('nro_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('nro_item').Asinteger:=i;
          dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger:=gdetalle.Fields[1].AsInteger;
          dmfacturador.icomprobante.ParamByName('cod_laboratorio').AsString:='';
          dmfacturador.icomprobante.ParamByName('nom_largo').AsString:=gdetalle.Fields[2].Asstring;//
          dmfacturador.icomprobante.ParamByName('can_vendida').AsString:=gdetalle.Fields[3].Asstring;
          dmfacturador.icomprobante.ParamByName('imp_unitario').Asfloat:=gdetalle.Fields[4].Asfloat;
          dmfacturador.icomprobante.ParamByName('por_descuento').Asinteger:=gdetalle.Fields[6].Asinteger;
          dmfacturador.icomprobante.ParamByName('imp_descuento').Asfloat:=gdetalle.Fields[7].Asfloat;
          dmfacturador.icomprobante.ParamByName('nro_troquel').Asinteger:=gdetalle.Fields[5].Asinteger;
          dmfacturador.icomprobante.ParamByName('cod_validacion').AsString:=ticket.valnroreferencia;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          gdetalle.DataSource.DataSet.Next;

    end;

 end;


 // Registramos los descuentos del coseguro aplus
 registrardescuentoaplus(i);



 //stock.. --vr no lleva

if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('update prmastock set can_stk=:can_stk where cod_alfabeta=:cod_alfabeta and nro_sucursal=:nro_sucursal');

gdetalle.DataSource.DataSet.first;
stockparcial:=0;
while not gdetalle.DataSource.DataSet.Eof do
    begin
    dmfacturador.qbusquedastock.Close;
    dmfacturador.qbusquedastock.SQL.Text:=concat('select can_stk from prmastock where cod_Alfabeta=:codigo and nro_sucursal=:sucursal');
    dmfacturador.qbusquedastock.ParamByName('codigo').asinteger:=gdetalle.Fields[0].AsInteger;
    dmfacturador.qbusquedastock.ParamByName('sucursal').asstring:=ticket.sucursal;
    dmfacturador.qbusquedastock.Open;
    if dmfacturador.qbusquedastock.RecordCount>0 then
    begin

    stockparcial:=dmfacturador.qbusquedastock.FieldByName('can_stk').AsInteger;


    end;
    if dmfacturador.qbusquedastock.RecordCount=0 then
    begin

    dmfacturador.qinsertlineastock.Close;
    dmfacturador.qinsertlineastock.SQL.Text:=concat(' INSERT INTO PRMASTOCK (NRO_SUCURSAL, COD_ALFABETA, CAN_STKMIN, CAN_STKMAX, CAN_STK) ',
                                                 ' VALUES (:sucursal, :alfabeta, 0, 1000, 0)');
    dmfacturador.qinsertlineastock.ParamByName('alfabeta').asinteger:=gdetalle.Fields[0].AsInteger;
    dmfacturador.qinsertlineastock.ParamByName('sucursal').asstring:=ticket.sucursal;
    dmfacturador.qinsertlineastock.Open;

    stockparcial:=0;


    end;



    dmfacturador.icomprobante.ParamByName('cod_alfabeta').asinteger:=gdetalle.Fields[0].AsInteger;
    dmfacturador.icomprobante.ParamByName('can_stk').asinteger:=stockparcial-gdetalle.Fields[7].AsInteger;;
    dmfacturador.icomprobante.parambyname('nro_sucursal').asstring:=ticket.sucursal;
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;
    gdetalle.DataSource.DataSet.Next;
    end;


 form.Close;
 showmessage('TICKET INSERTADO CON EXITO');
 blimpiartodo.Click;













end;

procedure Tfbuscartk.BlimpiartodoClick(Sender: TObject);
begin
mticket.Clear;
if cdsdetalle.Active=true then
  begin
  cdsdetalle.EmptyDataSet;
  end;
end;

procedure Tfbuscartk.FormShow(Sender: TObject);
begin
 cdsdetalle.CreateDataSet;
 descComprobservice:=TdescComprobanteservice.create;
 detaAfiliadoService:=TDetaAfiliadoService.create;

end;

procedure tfbuscartk.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;

end;

procedure Tfbuscartk.calcularIVA;
var
 importeGravado: Double;
  importeNeto: Double;
  importeNetodesc: Double;
  importeGravadodesc: Double;
  importeDescuentos:Double;
  importeAplus:double;
  importeGentileza:double;
  importeUnitario:double;
  cantidadProd:double;
  unaTasaIVA: TTasaIVA;
  imp_iva:double;
  imp_ivadesc:double;
begin

   gdetalle.DataSource.DataSet.First;

   ticket.TotalesIVA.Clear;

  while not gdetalle.DataSource.DataSet.Eof do
  begin
   {
    CODIGO REARMADO VER DESPUES
    unaTasaIVA := nil;
    ticket.TotalesIVA.TryGetValue(gdetalle.DataSource.DataSet.FieldByName('cod_iva').AsString, unaTasaIVA);
    if (unaTasaIVA = nil) then
    begin
      unaTasaIVA := TTasaIVA.Create;
    end;
    unaTasaIVA.codigoIVA := gdetalle.DataSource.DataSet.FieldByName('cod_iva').AsString;
    importeGravado := ((gdetalle.DataSource.DataSet.FieldByName('precio').Asfloat * gdetalle.DataSource.DataSet.FieldByName('cantidad').Asfloat) - gdetalle.DataSource.DataSet.FieldByName('descuentos').Asfloat);
    if (unaTasaIVA.getPorcentajeIVA > 0) then
    begin
      importeNeto := importeGravado / (1 + unaTasaIVA.getPorcentajeIVA / 100);
    end
    else
    begin
      importeNeto := importeGravado;
    end;
    unaTasaIVA.netogravado := unaTasaIVA.netogravado + importeNeto;
    importegravadodesc := gdetalle.DataSource.DataSet.FieldByName('precio_totaldesc').Asfloat;
    ticket.TotalesIVA.AddOrSetValue(gdetalle.DataSource.DataSet.FieldByName('cod_iva').AsString, unaTasaIVA);
    if (unaTasaIVA.getPorcentajeIVA > 0) then
    begin
      importeNetodesc := importeGravadodesc / (1 + unaTasaIVA.getPorcentajeIVA / 100);
    end
    else
    begin
      importeNetodesc := importeGravadodesc;
    end;
    unaTasaIVA.netogravadodesc := unaTasaIVA.netogravadodesc + importeNetoDesc;
    //    sumaitem:=gfacturador.Fields[3].Asinteger+sumaitem;
    gdetalle.DataSource.DataSet.next;}

        // Cargo las variables

    importeDescuentos:= GDetalle.DataSource.DataSet.FieldByName('descuentos').Asfloat;

    importeGentileza:= GDetalle.DataSource.DataSet.FieldByName('importegent').Asfloat;
    importeAplus:= GDetalle.DataSource.DataSet.FieldByName('importeaplus').Asfloat;
    importeUnitario:= GDetalle.DataSource.DataSet.FieldByName('precio').Asfloat;
    cantidadProd:= GDetalle.DataSource.DataSet.FieldByName('cantidad').Asfloat;

    unaTasaIVA := nil;
    Ticket.TotalesIVA.TryGetValue(GDetalle.DataSource.DataSet.FieldByName('cod_iva').AsString, unaTasaIVA);
    if (unaTasaIVA = nil) then
    begin
      unaTasaIVA := TTasaIVA.Create;
    end;
    unaTasaIVA.codigoIVA := GDetalle.DataSource.DataSet.FieldByName('cod_iva').AsString;
    importeGravado := ((importeUnitario * cantidadProd) - importeDescuentos);

    imp_iva:=0;
    imp_ivadesc:=0;

    if (unaTasaIVA.getPorcentajeIVA > 0) then
    begin
      importeNeto:= importeGravado / ( 1+ unaTasaIVA.getPorcentajeIVA /100);
       imp_iva:= importeGravado - importeNeto;
    end
    else
    begin
      IMPORTENETO := importeGravado;
    end;
    unaTasaIVA.netogravado := unaTasaIVA.netogravado + IMPORTENETO;
    unaTasaIVA.imp_iva := unaTasaIVA.imp_iva + imp_iva;


    // Si pesos aplus se mandan al gravado de descuentos, no corresponde las
    // gentilezas en iva de descuentos

    if importeGentileza > 0 then
    begin
      importeGravadodesc := 0;

      if importeAplus > 0 then
       begin
       importeGravadodesc := importeDescuentos - importeGentileza;
       end;
    end;


    {---SI NO HAY GENTILEZAS MANDAMOS TODO AL GRAVADO DESC A LO BESTIA --------}
    if importeGentileza = 0
    then
    begin
      importeGravadodesc := importeDescuentos;
    end;

    {-- CALCULAMOS EL IMPORTE GRAVADO DE DESCUENTO --}
    if (unaTasaIVA.getPorcentajeIVA > 0) then
    begin
        importeNetodesc := importeGravadodesc/( 1+ unaTasaIVA.getPorcentajeIVA / 100 );
        imp_ivadesc:=  importeGravadodesc - importeNetodesc;


    end
    else
    begin
      importeNetodesc := importeGravadodesc;
    end;

    {-- CALCULAMOS EL IMPORTE GRAVADO DE DESCUENTO --}


    unaTasaIVA.netogravadodesc := unaTasaIVA.netogravadodesc + importeNetodesc;
    unaTasaIVA.imp_ivadesc := unaTasaIVA.imp_ivadesc + imp_ivadesc;

    Ticket.TotalesIVA.AddOrSetValue(GDetalle.DataSource.DataSet.FieldByName('cod_iva').AsString, unaTasaIVA);
    Gdetalle.DataSource.DataSet.Next;


  end;
end;


end.

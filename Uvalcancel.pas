unit Uvalcancel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  Vcl.ExtCtrls, Vcl.StdCtrls, UDTicket,math;

type
  Tvalcancel = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Lsegundos: TLabel;
    mmsjvalida: TMemo;
    Tvalidacion: TTimer;
    XMLVAL: TXMLDocument;
    procedure FormShow(Sender: TObject);
    procedure TvalidacionTimer(Sender: TObject);
    procedure mmsjvalidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
     Ticket:TTicket;
  public
      procedure SetTicket(unTicket:TTicket);
  end;

var
  valcancel: Tvalcancel;
  NUMEROVALIDA: INTEGER;
  x: integer;
  ceros: string;

implementation

{$R *.dfm}

uses UdmFacturador,facturador, uticket;

Function FillSpaces(cVar:String;nLen:Integer):String;
 begin
 Result:=StringOfChar('0',nLen - Length(cVar))+cVar;
 end;

procedure Tvalcancel.FormShow(Sender: TObject);
var

  archivoXML: TXMLDocument;

  Nodo,NDatosGenerales,NMensajeFacturacion,NCabecera,NDatosFinales,terminal,software,
  validador,prestador,prescriptor, beneficiario, financiador, credencial, CoberturaEspecial, Preautorizacion,
  Fechareceta,Dispensa, Formulario, TipoTratamiento, Diagnostico, Institucion, Retira, detallereceta, item
  : IXMLNode;
  I:Integer;
  detalleTicket: TTicketItem;
  impcoberturaredondeado: double;
  impunitarioredondeado: double;
  IDCOMPROBANTEVALIDACIONES: INTEGER;

begin
 dmfacturador.qNROVALIDACION.close;
 dmfacturador.qNROVALIDACION.SQL.Text:=concat('select MAX(idcomprobante), MAX(IDCOMPROBANTEVALIDACIONES) from osmacomprobvalidaciones');
 dmfacturador.qNROVALIDACION.Open;
 NUMEROVALIDA:=strtoint(dmfacturador.qNROVALIDACION.Fields[1].Text)+1;
 IDCOMPROBANTEVALIDACIONES:=strtoint(dmfacturador.qNROVALIDACION.Fields[0].Text)+1;
 x:=0;
 ceros:='';
 archivoXML := TXMLDocument.Create(Application);

    try


      // Activamos el archivo XML
       archivoxml.xml.Clear;
       archivoxml.Active:=true;
       archivoXML.Version:='1.0';
       archivoXML.Encoding:='ISO-8859-1';



       // Creamos el elemento principal: EsteEsElementoPrincipal //
      NMensajeFacturacion := archivoXML.AddChild('MensajeADESFA');
      if ticket.codigo_validador='S' then
      BEGIN
        NMensajeFacturacion.Attributes['version'] := '2.0';
      END;
      IF (TICKET.codigo_validador='I') or (TICKET.codigo_validador='Z') or (ticket.codigo_validador='G') or (ticket.codigo_validador='M')  then
      BEGIN
        NMensajeFacturacion.Attributes['version'] := '2.1';
      END;
      // Ponemos el elemento que denominamos: Cabecera //
      NCabecera := NMensajeFacturacion.AddChild( 'EncabezadoMensaje' );
      // ponemos elementos hijos del anterior que era 'Cabecera'
      Nodo := NCabecera.AddChild( 'NroReferencia' );
      Nodo.text := ticket.valnroreferencia;
      Nodo := NCabecera.AddChild( 'TipoMsj' );
      Nodo.text := '200';
      Nodo := NCabecera.AddChild( 'CodAccion' );
      Nodo.Text := '20010';
      Nodo := NCabecera.AddChild( 'IdMsj' );
      Nodo.Text := inttostr(NUMEROVALIDA);//NUMERO DE MSJ SECUENCIAL (EL MISMO QUE EL ARCHIVO)
      // Ponemos el elemento: DatosGenerales - Dentro del elemento Cabecera
      NDatosGenerales := NCabecera.AddChild( 'InicioTrx' );
      Nodo := NDatosGenerales.AddChild( 'Fecha' );
      Nodo.Text :=  FormatDateTime('yyyymmdd',date); //fecha en formato aaaammdd
      Nodo := NDatosGenerales.AddChild( 'Hora' );
      Nodo.Text :=  FormatDateTime('hhmmss',time); //hora en formato hhmmss
      // Ponemos el elemento terminal dentro de cabecera
      Terminal := NCabecera.AddChild( 'Terminal' );
      nodo:= terminal.AddChild('Tipo');
      nodo.Text:='PC'; //TIPO DE TERMINAL  ------------------------------------------------LO CAMBIE CONEXIA
      nodo:= terminal.AddChild('Numero');
      nodo.Text:='0001'; // numero de la terminal;
      software := NCabecera.AddChild( 'Software' );
      nodo:= software.AddChild('Nombre');
      nodo.Text:='NMP';
      nodo:=software.AddChild('Version');
      nodo.Text:='';
      validador := NCabecera.AddChild( 'Validador' );
      nodo:= validador.AddChild('Nombre');
      nodo.Text:=TICKET.codigo_validador;
      nodo:=validador.AddChild('Version');
      nodo.Text:='';
      IF (TICKET.codigo_validador='S') THEN
      BEGIN
      Nodo := NCabecera.AddChild( 'VersionMsj' );
      nodo.Text:='2.0'
      end;
      IF (TICKET.codigo_validador<>'S') THEN
      BEGIN
      Nodo := NCabecera.AddChild( 'VersionMsj' );
      nodo.Text:='1.1';
      END;


      prestador := NCabecera.AddChild( 'Prestador' );
       IF (TICKET.codigo_validador='Z') THEN
       BEGIN
       nodo:= prestador.AddChild('Cuit');
       nodo.Text:=ticket.cuitsucursal;
       END;
       IF (TICKET.codigo_validador<>'Z') THEN
       BEGIN
       nodo:= prestador.AddChild('Cuit');
       nodo.Text:='';
       END;

      nodo:=prestador.AddChild('Sucursal');
      nodo.Text:='';
      nodo:=prestador.AddChild('RazonSocial');
      nodo.Text:='';
      nodo:=prestador.AddChild('Codigo');
      nodo.Text:=TICKET.codigoos_prestador;
      nodo:=prestador.AddChild('Vendedor');
      nodo.Text:='1';
  //    Nodo := NCabecera.AddChild( 'SetCaracteres' );
 //     nodo.Text:='ISO-8859-1';

      // Ponemos el elemento: ENCABEZADO RECETA //
      NDatosFinales := NMensajeFacturacion.AddChild( 'EncabezadoReceta' );
    {  if TICKET.valbono<>'SI' then
      BEGIN
      //-------------------medico-----------------------//
      Prescriptor := ndatosfinales.AddChild('Prescriptor');
      Nodo := prescriptor.AddChild( 'Apellido' );
      Nodo.Text := ticket.medico_apellido;
      Nodo := prescriptor.AddChild( 'Nombre' );
      Nodo.Text := ticket.medico_nombre;
      Nodo := prescriptor.AddChild( 'TipoMatricula' );
      Nodo.Text := ticket.medico_tipo_matricula;
      Nodo := prescriptor.AddChild( 'Provincia' );
      Nodo.Text := ticket.medico_codigo_provincia;
      Nodo := prescriptor.AddChild( 'NroMatricula');
      Nodo.Text := TICKET.medico_nro_matricula;
      Nodo := prescriptor.AddChild( 'TipoPrescriptor');
      Nodo.Text := 'M';
      Nodo := prescriptor.AddChild( 'Cuit' );
      Nodo.Text := '';
      Nodo := prescriptor.AddChild( 'Especialidad' );
      Nodo.Text := '';
      END;
      if TICKET.valbono='SI' then
      BEGIN
      //--------------------MEDIO DE PAGO-----------------------//
      Prescriptor := ndatosfinales.AddChild('MedioPago');
      Nodo := prescriptor.AddChild( 'MontoTrx' );
      Nodo.Text := floattostr(ticket.importeneto);
      Nodo := prescriptor.AddChild( 'CantidadCuotas' );
      Nodo.Text := '1';
      END; }

      // -------------------medico---------------------------//
      //--------------------afiliado--------------------------//
      beneficiario := ndatosfinales.AddChild( 'Beneficiario' );
      Nodo := beneficiario.AddChild( 'TipoDoc' );
      Nodo.Text := 'DNI';
      Nodo := beneficiario.AddChild( 'NroDoc' );
      Nodo.Text := '';                                                 //////////hasta aqui llegue hoy23/06/2016
      Nodo := beneficiario.AddChild( 'Apellido' );
      Nodo.Text := ticket.afiliado_apellido;
      Nodo := beneficiario.AddChild( 'Nombre' );
      Nodo.Text := ticket.afiliado_nombre;
      Nodo := beneficiario.AddChild( 'Sexo' );
      Nodo.Text := '';
      Nodo := beneficiario.AddChild( 'FechaNacimiento' );
      Nodo.Text := '';
      Nodo := beneficiario.AddChild( 'Parentesco' );
      Nodo.Text := '';
      Nodo := beneficiario.AddChild( 'EdadUnidad' );
      Nodo.Text := 'A';
      Nodo := beneficiario.AddChild( 'Edad' );
      Nodo.Text := '1';
      //--------------------afiliado---------------------//
      //-------------------financiador-------------------//
      financiador := ndatosfinales.AddChild( 'Financiador' );
      Nodo := financiador.AddChild( 'Codigo' );
      Nodo.Text := ticket.codigoos_validador;//codigo os...
      Nodo := financiador.AddChild( 'Cuit' );
      Nodo.Text := '';
      Nodo := financiador.AddChild( 'Sucursal' );
      Nodo.Text := '';

      //--------------------financiador------------------//
      //--------------------Credencial-------------------//
      Credencial := ndatosfinales.AddChild( 'Credencial' );
      Nodo := Credencial.AddChild( 'Numero' );
      Nodo.Text :=ticket.afiliado_numero;
      Nodo := Credencial.AddChild( 'Track' );
      Nodo.Text := '';
      Nodo := Credencial.AddChild( 'Version' );
      Nodo.Text := '';
      Nodo := Credencial.AddChild( 'Vencimiento' );
      Nodo.Text := '';
      Nodo := Credencial.AddChild( 'ModoIngreso' );
      Nodo.Text := 'A';
      Nodo := Credencial.AddChild( 'EsProvisorio' );
      Nodo.Text := '';
      Nodo := Credencial.AddChild( 'Plan' );
      Nodo.Text := ticket.codigo_planos_validador;

      //---------------------Credencial------------------//
      //-----------------CoberturaEspecial-----------------//

   {   CoberturaEspecial := ndatosfinales.AddChild( 'CoberturaEspecial' );
      coberturaEspecial.Text:='';
      //-----------------CoberturaEspecial-----------------//
      //---------------Preautorizacion----------------//
      Preautorizacion := ndatosfinales.AddChild( 'Preautorizacion' );
      Nodo := Preautorizacion.AddChild( 'Codigo' );
      Nodo.Text := '';
      Nodo := Preautorizacion.AddChild( 'Fecha' );
      Nodo.Text := '';

      //---------------Preautorizacion----------------//
      //------------------fechareceta-------------------//
    }  Fechareceta := ndatosfinales.AddChild( 'FechaReceta' );
      fechareceta.Text := formatdatetime('yyyymmdd',ticket.fecha_receta);

      //-------------------fechareceta-------------------//
      //-------------------Dispensa-------------------//
      Dispensa := ndatosfinales.AddChild( 'Dispensa' );
      Nodo := Dispensa.AddChild( 'Fecha' );
      Nodo.Text := FormatDateTime('yyyymmdd',date);
      Nodo := Dispensa.AddChild( 'Hora' );
      Nodo.Text := FormatDateTime('hhmmss',time);

      //-------------------Dispensa-------------------//

      //-------------------Formulario-------------------//


      detallereceta := NMensajeFacturacion.AddChild( 'DetalleReceta' );
      //------------------------retira-------------------//
      //----------------------detallereceta-----------------//
      for I := 0 to ticket.items.Count -1 do
      Begin
      detalleTicket:=ticket.items[I];
      item := detallereceta.AddChild('Item');
      Nodo := item.AddChild( 'NroItem' );
      Nodo.Text := IntToStr(detalleTicket.nro_item);
      Nodo := item.AddChild( 'CodAutOri' );
      Nodo.Text := detalleticket.codautorizacion;
      Nodo := item.AddChild( 'CodBarras' );
      Nodo.Text := detalleTicket.cod_barras;
      Nodo := item.AddChild( 'CodTroquel' );
      Nodo.Text := detalleTicket.cod_troquel;
      Nodo := item.AddChild( 'Alfabeta' );
      Nodo.Text := '';//detalleTicket.cod_alfabeta;
      Nodo := item.AddChild( 'Kairos' );
      Nodo.Text := '';
      Nodo := item.AddChild( 'Codigo' );
      Nodo.Text := '';

      //----------------------detallereceta-----------------//
      end;
      archivoxml.Active:=true;
      archivoXML.Version:='1.0';
      archivoXML.Encoding:='ISO-8859-1';


// guardamos los datos del fichero con el nombre indicado--------------------------------------------//
archivoXML.SaveToFile(ticket.path_validador+'ida\'+ FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XML');


//archivoXML.SaveToFile(ticket.path_validador+'bck\ida\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.xml');
finally
archivoxml.Active:=false;
archivoXML.Free;
end;

mmsjvalida.Lines.Add(inttostr(NUMEROVALIDA)+'.XML'+' VALIDANDO........');


if DMFACTURADOR.IBTransactionVAL.InTransaction then
begin
DMFACTURADOR.IBTransactionVAL.Rollback;
end;
 dmfacturador.IBTransactionVAL.StartTransaction;
 dmfacturador.qNROVALIDACION.close;
 dmfacturador.qNROVALIDACION.SQL.Text:=concat('INSERT INTO OSMACOMPROBVALIDACIONES (IDCOMPROBANTEVALIDACIONES, COD_ESTADO, IDCOMPROBANTE, FECHA, COD_VALIDADOR, COD_PLANOS)',
                                              'VALUES (:ID, 0, :NUMEROARCHIVO, CURRENT_DATE, :CODIGOVAL, :CODIGOPLAN);');


 dmfacturador.qNROVALIDACION.ParamByName('id').Asinteger:=NUMEROVALIDA;
 dmfacturador.qNROVALIDACION.ParamByName('numeroarchivo').AsInteger:=IDCOMPROBANTEVALIDACIONES;
 dmfacturador.qNROVALIDACION.ParamByName('codigoval').Asstring:=ticket.codigo_validador;
 dmfacturador.qNROVALIDACION.ParamByName('codigoplan').Asstring:=ticket.codigo_OS;
 dmfacturador.qNROVALIDACION.Open;
 dmfacturador.IBTransactionVAL.Commit;
 tvalidacion.Enabled:=True;

 end;





procedure Tvalcancel.mmsjvalidaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
  if (mmsjvalida.Color=clmaroon) or (mmsjvalida.Color=clgreen)  then
  begin
  ModalResult := mrCancel;
  end;


end;
end;

procedure Tvalcancel.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;


procedure Tvalcancel.TvalidacionTimer(Sender: TObject);

var
archivoxmlval: txmldocument;
encabezadoval,rtaval,nrorefval,detalleval,
ITEMVAL,BARRASVAL,TROQUELVAL,DESCRIPCIONVAL,RTAPRODUCTO,CANTIDADVAL,PORCENTAJEVAL,IMPORTEUNITARIOVAL,IMPORTEAFIVAL,IMPORTECOBERVAL:ixmlnode;
flag: integer;
I: INTEGER;
itemsval:TTicketItemval;
leido: boolean;

begin

ticket.valcodigorespuesta:='999';
ticket.valdescripcionrespuesta:='';
ticket.valmsjrespuesta:='';
ticket.valnroreferencia:='';
ticket.itemsval:=Tlist.Create;
leido:=false;


       if x<60 then
        begin
         x:=x+1;
        archivoxmlval:= TXMLDocument.Create(Application);
        if flag=0 then
           begin

         If FileExists (ticket.path_respuesta+'rta\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XML') Then
                begin
//              archivoxmlval.LoadFromFile (ticket.path_validador+'rta\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XML');
                archivoxmlval.LoadFromFile (ticket.path_validador+'rta\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XML');
                archivoxmlval.Active:=true;
                archivoxmlval.DocumentElement.ChildNodes.Count;
 //----------------------modificado el 03/03/2017-------------------------- lectura de validacion universal--------------//

   {                 if (archivoxmlval.ChildNodes['MensajeADESFA'].AttributeNodes['version'].text='2.0') then
                    begin  }
                    leido:=true;
                    encabezadoval:=archivoxmlval.DocumentElement.ChildNodes[0];
                    encabezadoval.ChildNodes.Count;
                    rtaval:=encabezadoval.ChildNodes['Rta'];
                    ticket.valcodigorespuesta:=StringReplace(StringReplace((rtaval.ChildNodes['CodRtaGeneral'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                    ticket.valdescripcionrespuesta:=rtaval.ChildNodes['Descripcion'].Text;
                    ticket.valmsjrespuesta:=rtaval.ChildNodes['Mensaje'].Text;

                    nrorefval:=encabezadoval.ChildNodes['NroReferencia'];

                    ticket.valnroreferencia:=StringReplace(StringReplace(StringReplace((NROREFVAL.Text), 'V', '', [rfReplaceAll]), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);

                    if archivoxmlval.DocumentElement.ChildNodes.Count>1 then
                    begin
                    if archivoxmlval.DocumentElement.ChildNodes.Count=3 then
                    begin
                    detalleval:=archivoxmlval.DocumentElement.ChildNodes[2];

                     for I := 0 to DETALLEVAL.ChildNodes.Count -1 do
                        BEGIN
                        itemsVal:=TTicketItemVAL.Create;
                        ITEMVAL:=DETALLEVAL.ChildNodes[I];
                        itemsval.nro_itemval:=StringReplace(StringReplace((itemval.ChildNodes['NroItem'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                        itemsval.cod_barrasVAL:=StringReplace(StringReplace((itemval.ChildNodes['CodBarras'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                        itemsval.cod_troquelVAL:=StringReplace(StringReplace((itemval.ChildNodes['CodTroquel'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                        itemsval.descripcionval:=StringReplace(StringReplace((itemval.ChildNodes['Descripcion'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                        itemsval.msjitemval:=StringReplace(StringReplace((itemval.ChildNodes['MensajeRta'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                        itemsval.cantidadVAL:=StringReplace(StringReplace((itemval.ChildNodes['CantidadSolicitada'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                        itemsval.cantidadaprobada:=StringReplace(StringReplace((itemval.ChildNodes['CantidadAprobada'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                        itemsval.porcentaje_coberturaVAL:=StringReplace(StringReplace((itemval.ChildNodes['PorcentajeCobertura'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                        itemsval.importe_unitarioVAL:=StringReplace(StringReplace((itemval.ChildNodes['ImporteUnitario'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                        itemsval.importe_coberturaVAL:=StringReplace(StringReplace((itemval.ChildNodes['ImporteCobertura'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                        itemsval.importe_afiliado:=StringReplace(StringReplace((itemval.ChildNodes['ImporteACargoAfiliado'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                        ticket.itemsval.Add(itemsVal);
                        END;
                    end;
                    end;




 //----------------------modificado el 03/03/2017-------------------------- lectura de validacion universal--------------//




                        if (ticket.valcodigorespuesta)='' then
                        begin
                          flag:=0;
                        end;
                         if ticket.valcodigorespuesta='0' then
                        begin
                          flag:=1;
                        end;
                         if (ticket.valcodigorespuesta<>'0') and ((ticket.valcodigorespuesta)<>'')  then
                        begin
                          flag:=2;
                        end;
                        if ((ticket.valcodigorespuesta<>'0') AND (ticket.valcodigorespuesta<>'00')) then
                        begin
                          mmsjvalida.Lines.Add('_____________________________________________________________');
                          mmsjvalida.Lines.Add('SOLICITUD RECHAZADA CORRIJA LOS DATOS Y VUELVA A INTENTARLO!');
                          mmsjvalida.Lines.Add('_____________________________________________________________');
                          tvalidacion.Enabled:=false;
                          mmsjvalida.Lines.Add((ticket.valcodigorespuesta));
                          mmsjvalida.Lines.Add('_____________________________________________________________');
                          mmsjvalida.Lines.Add(ticket.valdescripcionrespuesta);
                          mmsjvalida.Lines.Add('_____________________________________________________________');
                          mmsjvalida.Lines.Add(ticket.valmsjrespuesta);
                          ticket.valnroreferencia:='';
                          MMSJVALIDA.Color:=clmaroon;
                        end;
                end;

            end;

        lsegundos.Caption:=inttostr(x);


       end;
         if (x=60) and (flag=0) then
             begin
                mmsjvalida.Lines.Add('_____________________________________________________________');
                mmsjvalida.Lines.Add('Tiempo de espera agotado');
                mmsjvalida.Lines.Add('_____________________________________________________________');
                tvalidacion.Enabled:=false;
                MMSJVALIDA.Color:=clmaroon;
             end;

       if (ticket.valcodigorespuesta='0') OR (ticket.valcodigorespuesta='00')  then
         BEGIN

           if (flag=2) or (flag=1) then
            begin
            mmsjvalida.Lines.Add('');
            mmsjvalida.Lines.Add('');
            mmsjvalida.Lines.Add('_____________________________________________________________');
            mmsjvalida.Lines.Add('RESPUESTA RECIBIDA NRO. REF:..................'+ticket.valnroreferencia);
            mmsjvalida.Lines.Add('_____________________________________________________________');
            mmsjvalida.Lines.Add('');
            mmsjvalida.Lines.Add('_____________________________________________________________');
            mmsjvalida.Lines.Add(ticket.valdescripcionrespuesta);
            mmsjvalida.Lines.Add('_____________________________________________________________');
            mmsjvalida.Lines.Add('');
            mmsjvalida.Lines.Add('_____________________________________________________________');
            mmsjvalida.Lines.Add(ticket.valmsjrespuesta);
            mmsjvalida.Lines.Add('_____________________________________________________________');

              for I := 0 to ticket.itemsval.Count -1 do
              begin
                itemsVal:=ticket.itemsval.Items[i];
                mmsjvalida.Lines.Add('');
                mmsjvalida.Lines.Add((itemsval.nro_itemVAL)+'  '+itemsval.cod_troquelVAL+'  '+itemsval.descripcionval+'  '+itemsval.porcentaje_coberturaVAL+' %'+'  '+itemsval.cantidadaprobada+'  '+itemsval.importe_unitarioVAL+' '+itemsval.importe_coberturaVAL+' '+itemsval.importe_afiliado+' '+'  '+itemsval.msjitemval);
              end;

            x:=60;
            lsegundos.Caption:='';
            tvalidacion.Enabled:=false;
            MMSJVALIDA.Color:=clgreen;
            end;
         END;


    If (FileExists (ticket.path_respuesta+'rta\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.xml')) and (leido=true) Then
    begin
 //     copyfile(pchar(ticket.path_respuesta+'rta\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.xml'),pchar(ticket.path_respuesta+'bck\rta\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.xml'),false);
      deletefile(ticket.path_respuesta+'rta\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.xml');
    end;


end;

end.

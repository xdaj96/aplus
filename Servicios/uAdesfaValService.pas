unit uAdesfaValService;

interface
  uses udmFacturador,sysutils,udticket,Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML,uUtils;
  Type
    TAdesfaValService = class
      private


      public
       Ticket:TTicket;
        NUMEROVALIDA,IDCOMPROBANTEVALIDACIONES:integer;
        procedure enviarValidacion(archivoXML:TXMLDocument);
        procedure recibirValidacion(xml:TXMLDocument);

        procedure nuevaValidacion();
        procedure borrarArchivoValidacion();
        function registrarValidacion():string;
        procedure setTicket(unTicket:TTicket);
    end;
implementation




procedure TAdesfaValService.enviarValidacion(archivoXML:TXMLDocument);
begin
  // guardamos los datos del fichero con el nombre indicado--------------------------------------------//
if directoryExists(ticket.path_validador+'ida\') then
begin

      if TICKET.codigo_validador='G' then
      BEGIN
      archivoXML.SaveToFile(ticket.path_validador+'ida\'+ TUtils.FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XML');
      END;
      if TICKET.codigo_validador='P' then
      BEGIN
      archivoXML.SaveToFile(ticket.path_validador+'ida\'+ TUtils.FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XML');
      END;
      if TICKET.codigo_validador='Y' then
      BEGIN
      archivoXML.SaveToFile(ticket.path_validador+'ida\'+ TUtils.FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XML');
      END;
      if (TICKET.codigo_validador<>'G') AND (TICKET.codigo_validador<>'P') and  (TICKET.codigo_validador<>'Y') then
      BEGIN
      archivoXML.SaveToFile(ticket.path_validador+'ida\'+ TUtils.FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XML');
      END;

end


end;
procedure TAdesfaValService.recibirValidacion(xml:TXMLDocument);
var
  xmldoc: TXMLDocument;
  rutaXML: string;
begin
  // Inicializar xmldoc a nil


  // Construcción de la ruta del archivo XML
  rutaXML := ticket.path_respuesta + 'rta\' + TUtils.FillSpaces(IntToStr(NUMEROVALIDA), 8) + '.XML';

  // Verificar si el archivo existe
  if FileExists(rutaXML) then
  begin
    try
       xml.Active := True;
      // Cargar el archivo XML
      xml.LoadFromFile(rutaXML);

    except
      on E: Exception do
      begin
        // Si ocurre un error al cargar el XML, asignar nil y mostrar el error
        xmldoc := nil;
        raise Exception.CreateFmt('Ocurrió un error al obtener la respuesta ADESFA: %s', [E.Message]);
      end;
    end;
  end;

end;


procedure TAdesfaValService.borrarArchivoValidacion;
begin
  deletefile(ticket.path_respuesta+'rta\'+TUtils.FillSpaces(inttostr(NUMEROVALIDA), 8)+'.xml');
end;


procedure TAdesfaValService.nuevaValidacion();
begin
dmfacturador.qNROVALIDACION.close;
 dmfacturador.qNROVALIDACION.SQL.Text:=concat('select MAX(idcomprobante), MAX(IDCOMPROBANTEVALIDACIONES) from osmacomprobvalidaciones');
 dmfacturador.qNROVALIDACION.Open;
 NUMEROVALIDA:=strtoint(dmfacturador.qNROVALIDACION.Fields[1].Text)+1;
 IDCOMPROBANTEVALIDACIONES:=strtoint(dmfacturador.qNROVALIDACION.Fields[0].Text)+1;

end;

function TAdesfaValService.registrarValidacion():string;
begin

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

end;

procedure TAdesfaValService.setTicket(unTicket:TTicket);
begin
    ticket:=unTicket;
end;


end.




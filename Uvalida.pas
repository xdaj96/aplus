unit Uvalida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Xml.xmldom, Xml.XMLIntf,
  msxmldom, xml.xmldoc, UDTicket, udmfacturador, maxi, Vcl.ExtCtrls, math, Registry;
Const
  RegKey ='Software\Autofarma\APlus\';

type
  TFvalida = class(TForm)
    mmsjvalida: TMemo;

    XMLVAL: TXMLDocument;
    Tvalidacion: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Lsegundos: TLabel;
    procedure FormShow(Sender: TObject);
    procedure TvalidacionTimer(Sender: TObject);
    procedure mmsjvalidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    Ticket:TTicket;
    procedure obtenerReversas;

  public
    { Public declarations }
    procedure SetTicket(unTicket:TTicket);

  end;

var
  Fvalida: TFvalida;
  NUMEROVALIDA: INTEGER;
  x: integer;
  ceros: string;

implementation

{$R *.dfm}

uses
facturador, uticket;

Function FillSpaces(cVar:String;nLen:Integer):String;
 begin
 Result:=StringOfChar('0',nLen - Length(cVar))+cVar;
 end;

//------------------------prueba-----------------------------------------------//
function SepararCadena(const Cadena: string; const Delim: Char): TStringList;
begin
  Result:= TStringList.Create;
  Result.Delimiter:= Delim;
  Result.DelimitedText:= Cadena;
end;

//------------------------------------------------------------------------------------//
function conectarUnidad(letraUnidad : string; rutaUnidad : string;
    contrasenaUsuario : string; nombreUsuario : string;
    mostrarError : Boolean;
  reconectarAlIniciar : Boolean): DWORD;
var
  nRes: TNetResource;
  errCode: DWORD;
  dwFlags: DWORD;
begin
  FillChar(NRes, SizeOf(NRes), #0);
  nRes.dwType := RESOURCETYPE_DISK;
  nRes.lpLocalName  := PChar(letraUnidad);
  nRes.lpRemoteName := PChar(rutaUnidad);
  if reconectarAlIniciar then
    dwFlags := CONNECT_UPDATE_PROFILE and CONNECT_INTERACTIVE
  else
    dwFlags := CONNECT_INTERACTIVE;

  if (contrasenaUsuario = '') and (nombreUsuario = '') then
    errCode := WNetAddConnection3(fvalida.Handle, nRes,
        nil, nil, dwFlags)
  else
    errCode := WNetAddConnection3(fvalida.Handle, nRes,
        pchar(contrasenaUsuario), pchar(nombreUsuario), dwFlags);

  if (errCode <> NO_ERROR) and (mostrarError) then
  begin
    Application.MessageBox(PChar('No se ha podido conectar la unidad [' +
        letraUnidad + ']' + #13#10 +
        SysErrorMessage(GetLastError)), 'Error al conectar unidad de red',
        MB_ICONERROR + MB_OK);
  end;
  Result := errCode;
end;

function desconectarUnidad (letraUnidad : string; mostrarError : Boolean;
    forzarDesconexion : Boolean; guardar : Boolean): DWORD;
var
  dwFlags: DWORD;
  errCode: DWORD;
begin
  if guardar then
    dwFlags := CONNECT_UPDATE_PROFILE
  else
    dwFlags := 0;
  errCode := WNetCancelConnection2(PChar(letraUnidad), dwFlags, forzarDesconexion);
  if (errCode <> NO_ERROR) and (mostrarError) then
  begin
    Application.MessageBox(PChar('Error al desconectar unidad de red:'
        + #13#10 + SysErrorMessage(GetLastError)),
        'Error al desconectar',  MB_ICONERROR + MB_OK);
  end;
  Result := errCode;
end;




//------------------------prueba-----------------------------------------------//


procedure TFvalida.FormShow(Sender: TObject);
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
  rutaarchivo: string;
  rutadestino: string;
  reg: tregistry;
  ip: STRING;
  ip2: tstringLIST;
  ip3: STRING;


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
      IF (TICKET.codigo_validador='F')   then
      BEGIN
        NMensajeFacturacion.Attributes['version'] := '3.1.0';
      END;
      // Ponemos el elemento que denominamos: Cabecera //
      NCabecera := NMensajeFacturacion.AddChild( 'EncabezadoMensaje' );

      // ponemos elementos hijos del anterior que era 'Cabecera'
      Nodo := NCabecera.AddChild( 'TipoMsj' );
      Nodo.text := '200';
      Nodo := NCabecera.AddChild( 'CodAccion' );
      Nodo.Text := ticket.CodAccion;
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
      nodo.Text:='';
       // Si valida por seros no lleva tipo de terminal
      IF (TICKET.codigo_validador <> 'Y')   THEN
       BEGIN
          nodo.Text:='PC'; //TIPO DE TERMINAL  ------------------------------------------------LO CAMBIE CONEXIA

       END;


      nodo:= terminal.AddChild('Numero');
      nodo.Text:='001'; // numero de la terminal;

        // Si valida por seros lleva la terminal 4
      IF (TICKET.codigo_validador = 'Y')   THEN
       BEGIN
          nodo.Text:='04'; //TIPO DE TERMINAL  ------------------------------------------------LO CAMBIE CONEXIA

       END;


      software := NCabecera.AddChild( 'Software' );
      nodo:= software.AddChild('Nombre');
  //    nodo.Text:='aPlus';
      IF (TICKET.codigo_validador='S') THEN
      BEGIN
      nodo.Text:='aPlus';
      END;
      IF (TICKET.codigo_validador<>'S') THEN
      BEGIN
      nodo.Text:='NMP';
      END;


      nodo:=software.AddChild('Version');
      nodo.Text:='';
      validador := NCabecera.AddChild( 'Validador' );
      nodo:= validador.AddChild('Nombre');
      if (TICKET.codigo_validador='F') THEN
      BEGIN
      nodo.Text:=ticket.codigo_planos_validador;
      END;
      if (TICKET.codigo_validador<>'F') THEN
      BEGIN
      nodo.Text:=TICKET.codigo_validador;
      END;

      nodo:=validador.AddChild('Version');
      nodo.Text:='';
      IF ((TICKET.codigo_validador='S') or (TICKET.codigo_validador='Y')) THEN
      BEGIN
      Nodo := NCabecera.AddChild( 'VersionMsj' );
      nodo.Text:='2.0'
      end;
      IF ((TICKET.codigo_validador<>'S') and (TICKET.codigo_validador<>'Y'))  THEN
      BEGIN
      Nodo := NCabecera.AddChild( 'VersionMsj' );
      nodo.Text:='1.1';
      END;


      prestador := NCabecera.AddChild( 'Prestador' );
      nodo:= prestador.AddChild('Cuit');
       IF (TICKET.codigo_validador='Z')   THEN
       BEGIN
          nodo.Text:=ticket.cuitsucursal;
       END else
       IF (TICKET.codigo_validador='Y') OR (TICKET.codigo_validador='F') THEN
       BEGIN
       nodo.Text:=StringReplace(ticket.cuitsucursal, '-', '', [rfReplaceAll]);;
       END else
       Begin
       nodo.Text:='';
       END;

      nodo:=prestador.AddChild('Sucursal');
      nodo.Text:='';

      // Si valida por seros le asignamos la sucursal 01
      IF (TICKET.codigo_validador='Y')   THEN
       BEGIN
          nodo.Text:='01';
       END;




      nodo:=prestador.AddChild('RazonSocial');
      nodo.Text:='';
      nodo:=prestador.AddChild('Codigo');
      nodo.Text:=TICKET.codigoos_prestador;
      Nodo := NCabecera.AddChild( 'SetCaracteres' );
      nodo.Text:='ISO-8859-1';

       // Si valida por seros le asignamos  ASCII
      IF (TICKET.codigo_validador='Y')   THEN
       BEGIN
          nodo.Text:='ASCII';
       END;




      // Ponemos el elemento: ENCABEZADO RECETA //
      NDatosFinales := NMensajeFacturacion.AddChild( 'EncabezadoReceta' );
      if TICKET.valbono<>'SI' then
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
      END;

      // -------------------medico---------------------------//
      //--------------------afiliado--------------------------//
      beneficiario := ndatosfinales.AddChild( 'Beneficiario' );
      Nodo := beneficiario.AddChild( 'TipoDoc' );
      Nodo.Text := 'DNI';

       // Si valida por seros le asignamos el documento 96
      IF (TICKET.codigo_validador='Y')   THEN
       BEGIN
          nodo.Text:='96';
       END;



      Nodo := beneficiario.AddChild( 'NroDoc' );
      Nodo.Text := ticket.documento;                                                 //////////hasta aqui llegue hoy23/06/2016
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

      // Si valida por seros le asignamos la cuit de sucursal
      IF (TICKET.codigo_validador='Y')   THEN
       BEGIN
          nodo.Text:='30999222907';
       END;



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
      if TICKET.codigo_validador<>'S' then
      BEGIN
        if ticket.codigo_seguridad<>'' then
        begin
        Nodo := Credencial.AddChild( 'CSC' );
        Nodo.Text := ticket.codigo_seguridad;
        end;
      END;

      Nodo := Credencial.AddChild( 'EsProvisorio' );
      Nodo.Text := '';
      Nodo := Credencial.AddChild( 'Plan' );
      Nodo.Text := ticket.codigo_planos_validador;
      if TICKET.codigo_validador='S' then
      BEGIN
        if ticket.codigo_seguridad<>'' then
        begin
        Nodo := Credencial.AddChild( 'cvc2' );
        Nodo.Text := ticket.codigo_seguridad;
        end;
      END;

      //---------------------Credencial------------------//
      //-----------------CoberturaEspecial-----------------//

      CoberturaEspecial := ndatosfinales.AddChild( 'CoberturaEspecial' );
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
      Fechareceta := ndatosfinales.AddChild( 'FechaReceta' );
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

      Formulario := ndatosfinales.AddChild( 'Formulario' );
      Nodo := Formulario.AddChild( 'Fecha' );
      Nodo.Text := FormatDateTime('yyyymmdd',date);
      Nodo := Formulario.AddChild( 'Tipo' );
      Nodo.Text := '';
      Nodo := Formulario.AddChild( 'Numero' );
      Nodo.Text := ticket.numero_receta;
      Nodo := Formulario.AddChild( 'Serie' );
      Nodo.Text := '';
      Nodo := Formulario.AddChild('NroAutEspecial');
      Nodo.Text := ticket.numero_receta;
      //-------------------Formulario-------------------//

      //-------------------------TIPOTRAT----------------///
      TipoTratamiento := ndatosfinales.AddChild( 'TipoTratamiento' );
      tipotratamiento.Text :=ticket.codigo_tratamiento;

      //-------------------------TIPOTRAT----------------///
      //-------------------------Diagnostico----------------///
      Diagnostico := ndatosfinales.AddChild( 'Diagnostico' );
      diagnostico.Text := '';
      //-------------------------Diagnostico----------------///
      //-------------------------institucion-----------------//
      Institucion := ndatosfinales.AddChild( 'Institucion' );
      Nodo := Institucion.AddChild( 'Codigo' );
      Nodo.Text := '';
      Nodo := Institucion.AddChild( 'Cuit' );
      Nodo.Text := '';
      Nodo := Institucion.AddChild( 'Sucursal' );
      Nodo.Text := '';


      //--------------------------institucion----------------//
      //------------------------retira-------------------//


      Retira := ndatosfinales.AddChild( 'Retira' );
      Nodo := retira.AddChild( 'Apellido' );
      Nodo.Text := '';
      Nodo := retira.AddChild( 'Nombre' );
      Nodo.Text := '';
      Nodo := retira.AddChild( 'TipoDoc' );
      Nodo.Text := 'DNI';
      Nodo := retira.AddChild( 'NroDoc' );
      Nodo.Text := '';
      Nodo := retira.AddChild( 'NroTelefono' );
      Nodo.Text := '';
      detallereceta := NMensajeFacturacion.AddChild( 'DetalleReceta' );
      //------------------------retira-------------------//
      //----------------------detallereceta-----------------//
      for I := 0 to ticket.items.Count -1 do
      Begin
      detalleTicket:=ticket.items[I];
      item := detallereceta.AddChild('Item');
      Nodo := item.AddChild( 'NroItem' );
      Nodo.Text := IntToStr(detalleTicket.nro_item);
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

      Nodo := item.AddChild( 'ImporteUnitario' );

      impunitarioredondeado:=simpleroundto((detalleticket.importe_unitario),-2);
      Nodo.Text := floattostr(impunitarioredondeado);
      Nodo := item.AddChild( 'CantidadSolicitada' );
      Nodo.Text := inttostr(detalleticket.cantidad);
      Nodo := item.AddChild( 'PorcentajeCobertura');
      Nodo.Text := floattostr(detalleticket.porcentaje_cobertura)+'.00';
      Nodo := item.AddChild( 'CodPreautorizacion' );
      Nodo.Text := '';
      Nodo := item.AddChild( 'ImporteCobertura' );

      impcoberturaredondeado:=simpleroundto((detalleticket.importe_cobertura),-2);
      Nodo.Text := floattostr(impcoberturaredondeado);
      Nodo := item.AddChild( 'ExcepcionPrescripcion' );
      Nodo.Text := '0';
      Nodo := item.AddChild( 'Diagnostico' );
      Nodo.Text := '';
      Nodo := item.AddChild( 'DosisDiaria' );
      Nodo.Text := '';
      Nodo := item.AddChild( 'DiasTratamiento' );
      Nodo.Text := '';
      Nodo := item.AddChild( 'Generico' );
      Nodo.Text := '';
      Nodo := item.AddChild( 'CodConflicto' );
      Nodo.Text := '';
      Nodo := item.AddChild( 'CodIntervencion' );
      Nodo.Text := '';
      Nodo := item.AddChild( 'CodAccion' );
      Nodo.Text := '';
      //----------------------detallereceta-----------------//
      end;
      archivoxml.Active:=true;
      archivoXML.Version:='1.0';
      archivoXML.Encoding:='ISO-8859-1';


// guardamos los datos del fichero con el nombre indicado--------------------------------------------//
if directoryExists(ticket.path_validador+'ida\') then
begin

      if TICKET.codigo_validador='G' then
      BEGIN
      archivoXML.SaveToFile(ticket.path_validador+'ida\'+ FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XMI');
      END;
      if TICKET.codigo_validador='P' then
      BEGIN
      archivoXML.SaveToFile(ticket.path_validador+'ida\'+ FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XMI');
      END;
      if TICKET.codigo_validador='Y' then
      BEGIN
      archivoXML.SaveToFile(ticket.path_validador+'ida\'+ FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XMI');
      END;
      if (TICKET.codigo_validador<>'G') AND (TICKET.codigo_validador<>'P') and  (TICKET.codigo_validador<>'Y') then
      BEGIN
      archivoXML.SaveToFile(ticket.path_validador+'ida\'+ FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XML');
      END;

end
else
begin
      Reg := TRegistry.Create;
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey(regKey,true);

      ip:= reg.ReadString('rutabasecfg');

      ip2:=separarcadena(ip,'\');
      ip3:=ip2[2];

      desconectarUnidad('z:', false, true, true);

      desconectarUnidad('x:', false, true, true);

      desconectarUnidad('y:', false, true, true);


      conectarUnidad('Z:', '\\'+IP3+'\'+'VALIDA','','', false, False);

      conectarUnidad('X:', '\\'+IP3+'\'+'VALIDA2','','', false, False);

      conectarUnidad('Y:', '\\'+IP3+'\'+'VALIDA3','','', false, False);

      if TICKET.codigo_validador='G' then
      BEGIN
      archivoXML.SaveToFile(ticket.path_validador+'ida\'+ FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XMI');
      END;
      if TICKET.codigo_validador='P' then
      BEGIN
      archivoXML.SaveToFile(ticket.path_validador+'ida\'+ FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XMI');
      END;
      if TICKET.codigo_validador='Y' then
      BEGIN
      archivoXML.SaveToFile(ticket.path_validador+'ida\'+ FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XMI');
      END;
      if (TICKET.codigo_validador<>'G') AND (TICKET.codigo_validador<>'P') and  (TICKET.codigo_validador<>'Y') then
      BEGIN
      archivoXML.SaveToFile(ticket.path_validador+'ida\'+ FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XML');
      END;

end;



finally
archivoxml.Active:=false;
archivoXML.Free;
end;
if FileExists(ticket.path_validador+'ida\'+ FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XMI') then
    begin
              RenameFile(ticket.path_validador+'ida\'+ FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XMI', ticket.path_validador+'ida\'+ FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XML');

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




procedure TFvalida.mmsjvalidaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
if key=vk_return then
begin
  if (mmsjvalida.Color=clmaroon) or (mmsjvalida.Color=clgreen) OR (mmsjvalida.Color=clBLUE) then
  begin
  ModalResult := mrCancel;
  end;


end;
end;

procedure TFvalida.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;

// ------------------- obtener reversas ------------------------------------//
procedure TFvalida.obtenerReversas;
begin
  // si la reversa es de imed
  if FileExists(ticket.path_respuesta + 'rta\reversa_imed_' + FillSpaces(inttostr(NUMEROVALIDA), 8) + '.XML') then
  begin
    RenameFile(ticket.path_respuesta + 'rta\reversa_imed_' + FillSpaces(inttostr(NUMEROVALIDA), 8) + '.XML', ticket.path_respuesta + 'rta\' + FillSpaces(inttostr(NUMEROVALIDA), 8) + '.XML');
    ticket.tieneReversaValidacion:= true;
  end;
end;

// ------------------- obtener reversas ------------------------------------//

procedure TFvalida.TvalidacionTimer(Sender: TObject);
var
archivoxmlval: txmldocument;
encabezadoval,rtaval,nrorefval,detalleval,ENCABEZADORECETA, encRTAADICIONAL, enclinea,
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


       if x<80 then
        begin
         x:=x+1;
        archivoxmlval:= TXMLDocument.Create(Application);
        if flag=0 then
           begin

      //obtenerReversas;



         If FileExists (ticket.path_respuesta+'rta\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XML') Then
                begin
                try
                    //archivoxmlval.LoadFromFile ('C:\VALIDA\csf\Rta\00000148.XML');
                    archivoxmlval.LoadFromFile (ticket.path_validador+'rta\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.XML');
                    archivoxmlval.Active:=true;
                    archivoxmlval.DocumentElement.ChildNodes.Count;
 //----------------------modificado el 03/03/2017-------------------------- lectura de validacion universal--------------//


                    leido:=true;
                    encabezadoval:=archivoxmlval.DocumentElement.ChildNodes[0];
                    encabezadoval.ChildNodes.Count;
                    rtaval:=encabezadoval.ChildNodes['Rta'];
                    ticket.valcodigorespuesta:=StringReplace(StringReplace((rtaval.ChildNodes['CodRtaGeneral'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                    ticket.valdescripcionrespuesta:=rtaval.ChildNodes['Descripcion'].Text;
                    ticket.valmsjrespuesta:=rtaval.ChildNodes['Mensaje'].Text;

                    nrorefval:=encabezadoval.ChildNodes['NroReferencia'];

                    ticket.valnroreferencia:=StringReplace(StringReplace(StringReplace((NROREFVAL.Text), 'V', '', [rfReplaceAll]), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                    ticket.nrorefadicional:=  ticket.valnroreferencia;
                    ENCABEZADORECETA:=archivoxmlval.DocumentElement.ChildNodes[1];
                    encRTAADICIONAL:=ENCABEZADORECETA.ChildNodes['RtaAdicional'];
                    enclinea:=encRTAADICIONAL.ChildNodes['Linea'];
                    TICKET.enrta:=enclinea.ChildNodes['Mensaje'].Text;

                    if archivoxmlval.DocumentElement.ChildNodes.Count>2 then
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
                        itemsval.codautorizacion:=StringReplace(StringReplace((itemval.ChildNodes['CodAutorizacion'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                        itemsval.cod_rta:=StringReplace(StringReplace((itemval.ChildNodes['CodRta'].Text), #$A, '', [rfReplaceAll]), ' ', '', [rfReplaceAll]);
                        ticket.itemsval.Add(itemsVal);
                        END;
                     end;
                  except
                   begin
                     x:=80;
                     showmessage('XML mal formado');

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
                          for I := 0 to ticket.itemsval.Count -1 do
                          begin
                          ffacturador.Gfacturador.DataSource.DataSet.First;
                          while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
                            begin
                            itemsVal:=ticket.itemsval.Items[i];
                                  if ffacturador.Gfacturador.Fields[26].AsString=itemsval.nro_itemVAL then
                                  begin
                                  mmsjvalida.Lines.Add('');
                                  mmsjvalida.Lines.Add((itemsval.nro_itemVAL)+'  '+itemsval.cod_troquelVAL+'  '+ffacturador.Gfacturador.Fields[1].AsString+'  '+itemsval.descripcionval+'  '+itemsval.porcentaje_coberturaVAL+' %'+'  '+itemsval.cantidadaprobada+'  '+itemsval.importe_unitarioVAL+' '+itemsval.importe_coberturaVAL+' '+itemsval.importe_afiliado+' '+'  '+itemsval.msjitemval);
                                  end;
                             ffacturador.Gfacturador.DataSource.DataSet.next;
                            end;
                          end;
                          MMSJVALIDA.Color:=clmaroon;
                        end;
                end;


            end;

        lsegundos.Caption:=inttostr(x);


       end;
         if (x=80) and (flag=0) then
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

            if ticket.tieneReversaValidacion then
            begin
                  mmsjvalida.Lines.Add('_____________________________________________________________');
                  mmsjvalida.Lines.Add('LA SOLICITUD NO SE PUDO PROCESAR VUELVA A INTENTARLO!');
            end;

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
            mmsjvalida.Lines.Add('Respuest adicional:'+ ticket.enrta);


            MMSJVALIDA.Color:=clgreen;
              for I := 0 to ticket.itemsval.Count -1 do
              begin
                itemsVal:=ticket.itemsval.Items[i];
                mmsjvalida.Lines.Add('');
                mmsjvalida.Lines.Add((itemsval.nro_itemVAL)+'  '+itemsval.cod_troquelVAL+'  '+itemsval.descripcionval+'  '+itemsval.porcentaje_coberturaVAL+' %'+'  '+itemsval.cantidadaprobada+'  '+itemsval.importe_unitarioVAL+' '+itemsval.importe_coberturaVAL+' '+itemsval.importe_afiliado+' '+'  '+itemsval.msjitemval);
                if not ((itemsval.cod_rta='0') or (itemsval.cod_rta='00'))then
                begin
                   MMSJVALIDA.Color:=clblue;
                end;




              end;
     
            x:=80;
            lsegundos.Caption:='';
            tvalidacion.Enabled:=false;

            end;
         END;


    If (FileExists (ticket.path_respuesta+'rta\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.xml')) and (leido=true) Then
    begin
 //     copyfile(pchar(ticket.path_respuesta+'rta\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.xml'),pchar(ticket.path_respuesta+'bck\rta\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.xml'),false);
      deletefile(ticket.path_respuesta+'rta\'+FillSpaces(inttostr(NUMEROVALIDA), 8)+'.xml');
    end;





end;

end.

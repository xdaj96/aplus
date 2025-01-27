unit UConsultaReceta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,math,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids ,registry,  udticket, UDMFACTURADOR, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, uprogreso,uadesfavalservice,uUtils;


type
  TfConsultaReceta = class(TForm)
    Bcancelar: TBitBtn;
    Bevel1: TBevel;
    grillahistorial: TDBGrid;
    cdshistorial: TClientDataSet;
    DSHISTORIAL: TDataSource;
    lafiliado: TLabel;
    Label1: TLabel;
    cdshistorialprescriptor: TStringField;
    cdshistorialnro_receta: TStringField;
    Memo1: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Timer1: TTimer;
    CDSDetaReceta: TClientDataSet;
    StringField3: TStringField;
    CDSDetaRecetaitem: TStringField;
    btnListarRecetas: TBitBtn;
    btnCargarItems: TButton;
    Bevel2: TBevel;
    Label4: TLabel;
    LSegundos: TLabel;
    cdshistorialfecha: TDateField;
    procedure Timer1Timer(Sender: TObject);
    procedure btnListarRecetasClick(Sender: TObject);
    procedure btnCargarItemsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure leerRecetas;
    procedure BcancelarClick(Sender: TObject);
    procedure grillahistorialDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DSHISTORIALDataChange(Sender: TObject; Field: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure grillahistorialKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    x,contador:integer;
    leido: boolean;
    numerovalida:integer;
    progreso:tfProgreso;
    xmlConsulta:string;
    tipo_accion:string;
    adesfaValService:TAdesfaValService;
    procedure construirConsultaRecetaPorAfiliado;

  public
   Ticket:TTicket;
   ItemList: TList;
   procedure SetTicket(unTicket:TTicket);
  end;

var
  fConsultaReceta: TfConsultaReceta;

implementation

{$R *.dfm}

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
    errCode := WNetAddConnection3(fConsultaReceta.Handle, nRes,
        nil, nil, dwFlags)
  else
    errCode := WNetAddConnection3(fConsultaReceta.Handle, nRes,
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



procedure TfConsultaReceta.btnListarRecetasClick(Sender: TObject);
var
 archivoXML: TXMLDocument;

begin
  progreso.Show;


  AdesfaValService.nuevaValidacion;
  AdesfaValService.registrarValidacion;
  construirConsultaRecetaPorAfiliado;
  archivoXML:= TXMLDocument.Create(self);
  archivoXML.LoadFromXML(xmlConsulta);
  adesfaValService.enviarValidacion(archivoXML);
  tipo_accion:='CONSULTA_RECETASAFI';
  Timer1.Enabled:=true;
end;

procedure TfConsultaReceta.DSHISTORIALDataChange(Sender: TObject;
  Field: TField);
begin
 btnCargarItems.Click;
end;

procedure TfConsultaReceta.FormCreate(Sender: TObject);
begin
  AdesfaValService:=TAdesfaValService.Create;


  progreso:=TFProgreso.Create(self);
  progreso.Position:= poOwnerFormCenter;
end;

procedure TfConsultaReceta.FormShow(Sender: TObject);
begin
  tipo_accion:='CONSULTA_RECETASAFI';
  contador:=0;
  btnListarRecetas.Click;
end;

procedure TfConsultaReceta.BcancelarClick(Sender: TObject);
begin
 progreso.Close;
 ModalResult:=mrClose;
end;

procedure TfConsultaReceta.BitBtn1Click(Sender: TObject);
begin
  ticket.numero_receta:=  cdshistorial.FieldByName('nro_receta').AsString;
  ticket.medico_nro_matricula:= cdshistorial.FieldByName('prescriptor').AsString;
  ticket.fecha_receta:= trunc(cdshistorial.FieldByName('fecha').AsDateTime);

end;

procedure TfConsultaReceta.btnCargarItemsClick(Sender: TObject);
begin

if cdshistorial.RecordCount <1 then
   exit;
  memo1.Lines.Clear;
  CDSDetaReceta.First;

  while not CDSDetaReceta.Eof do
  begin
    if cdshistorial.FieldByName('nro_receta').AsString = CDSDetaReceta.FieldByName('nro_receta').AsString  then
    begin
      Memo1.Lines.Add( CDSDetaReceta.FieldByName('item').AsString);
    end;
     CDSDetaReceta.Next;

  end;


end;

procedure TfConsultaReceta.grillahistorialDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   if (leido and (cdshistorial.RecordCount >0)) then
 begin
    btnCargarItems.Click;
 end;
end;

procedure TfConsultaReceta.grillahistorialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    BitBtn1.Click;
end;

procedure TfConsultaReceta.SetTicket(unTicket: TTicket);
begin

  ticket:=unTicket;
  adesfaValService.setTicket(unTicket);
end;

function StringToDateTime(const fecha: string): TDate;
begin
  // Comprobar si la longitud de la cadena es válida (8 caracteres)
  if Length(fecha) = 8 then
  begin  // Convertir la cadena a un formato de fecha (YYYY-MM-DD)
    Result := strTodate(Format('%s/%s/%s', [Copy(fecha, 7, 2), Copy(fecha, 5, 2), Copy(fecha, 1, 4)]));
  end;

  // Comprobar si la longitud de la cadena es válida (8 caracteres)
  if Length(fecha) = 6 then
  begin  // Convertir la cadena a un formato de fecha (YY-MM-DD)
         Result := strTodate('20'+Copy(fecha, 1, 2)+'/'+Copy(fecha, 3, 2)+'/'+Copy(fecha, 5, 2));

  end;



end;



procedure TfConsultaReceta.construirConsultaRecetaPorAfiliado;
begin
  xmlConsulta := '<?xml version="1.0" encoding="UTF-8"?>' + sLineBreak +
  '<MensajeADESFA version="3.1.0">' + sLineBreak +
  '  <EncabezadoMensaje>' + sLineBreak +
  '    <TipoMsj>200</TipoMsj>' + sLineBreak +
  '    <CodAccion>490220</CodAccion>' + sLineBreak +
  '    <IdMsj>322709</IdMsj>' + sLineBreak +
  '    <InicioTrx>' + sLineBreak +
  '      <Fecha>'+'20241117</Fecha>' + sLineBreak +
  '      <Hora>075107</Hora>' + sLineBreak +
  '    </InicioTrx>' + sLineBreak + '    <Software>' + sLineBreak +
   '      <CodigoADESFA/>' + sLineBreak +
   '      <Nombre>W</Nombre>' + sLineBreak +
   '      <Version>3.00.0033</Version>' + sLineBreak + '    </Software>' + sLineBreak +
   '    <Validador>' + sLineBreak +
   '      <CodigoADESFA/>' + sLineBreak +
   '      <Nombre/>' + sLineBreak +
   '    </Validador>' + sLineBreak +
   '    <Prestador>' + sLineBreak +
   '      <CodigoADESFA/>' + sLineBreak +
    '      <Cuit/>' + sLineBreak +
     '      <Sucursal/>' + sLineBreak +
     '      <RazonSocial/>' + sLineBreak +
     '      <Codigo>'+TICKET.codigoos_prestador+'</Codigo>' + sLineBreak +
     '      <Vendedor/>' + sLineBreak + '    </Prestador>' + sLineBreak +
     '  </EncabezadoMensaje>' + sLineBreak + '  <EncabezadoReceta>' + sLineBreak +
     '    <Financiador>' + sLineBreak + '      <CodigoADESFA/>' + sLineBreak +
     '      <Codigo>41</Codigo>' + sLineBreak + '      <Cuit/>' + sLineBreak +
     '      <Sucursal/>' + sLineBreak + '    </Financiador>' + sLineBreak +
     '    <Beneficiario>' + sLineBreak + '      <TipoDoc/>' + sLineBreak +
      '      <NroDoc></NroDoc>' + sLineBreak + '      <Apellido/>' + sLineBreak +
      '      <Nombre/>' + sLineBreak + '      <Sexo/>' + sLineBreak +
      '      <FechaNacimiento/>' + sLineBreak + '      <Parentesco/>' + sLineBreak +
      '      <EdadUnidad/>' + sLineBreak + '      <Edad/>' + sLineBreak +
      '    </Beneficiario>' + sLineBreak + '    <Credencial>' + sLineBreak +
      '      <Numero>' + ticket.afiliado_numero + '</Numero>' + sLineBreak +
      '      <Track/>' + sLineBreak + '      <Version/>' + sLineBreak +
      '      <Vencimiento/>' + sLineBreak + '      <ModoIngreso/>' + sLineBreak +
      '      <EsProvisorio/>' + sLineBreak + '      <Plan>41</Plan>' + sLineBreak +
      '      <cvc2> </cvc2>' + sLineBreak + '    </Credencial>' + sLineBreak +
      '  </EncabezadoReceta>' + sLineBreak + '</MensajeADESFA>';
end;


























procedure TfConsultaReceta.LeerRecetas;
var
  archivoxmlval: TXMLDocument;
  RecetasNode,AdesfaNode, RecetaNode, DetalleRecetaNode, ItemNode, FormularioNode: IXMLNode;
  NroReceta, Prescriptor, Fecha, Numero,CodRtaGeneral: string;
  x,i: Integer;
begin
  Timer1.Enabled := False;
  archivoxmlval:=TXMLDocument.Create(self);
  adesfaValService.recibirValidacion(archivoxmlval);
  archivoxmlval.Active:=true;

  if archivoxmlval.ChildNodes.FindNode('MensajeADESFA') <> nil then
  begin
    try
       CodRtaGeneral := archivoxmlval.DocumentElement.ChildNodes['EncabezadoMensaje'].ChildNodes['Rta'].ChildNodes['CodRtaGeneral'].Text;
       Bcancelar.Enabled:=true;


       if CodRtaGeneral ='75' then  // Afiliado sin recetas
       begin
          ShowMessage('AFILIADO SIN RECETAS ELECTRONICAS');
          progreso.Hide;
          Bcancelar.Click;
          exit;
       end;


       if CodRtaGeneral ='8' then  // Afiliado sin recetas
       begin
          ShowMessage('FINANCIADOR INEXISTENTE');
          progreso.Hide;
          Bcancelar.Click;
       end;


      RecetasNode := archivoxmlval.DocumentElement.ChildNodes.FindNode('Recetas');
      BitBtn1.Enabled:=true;
      if RecetasNode <> nil then
      begin
        for i := 0 to RecetasNode.ChildNodes.Count - 1 do
        begin
          RecetaNode := RecetasNode.ChildNodes[i];

          // Extraer los datos de cada receta
          NroReceta := RecetaNode.ChildNodes['NroReceta'].Text;
          Prescriptor := RecetaNode.ChildNodes['Prescriptor'].Text;

          // Extraer los datos del formulario
          FormularioNode := RecetaNode.ChildNodes['Formulario'];
          if FormularioNode <> nil then
          begin
            Fecha := FormularioNode.ChildNodes['Fecha'].Text;
            Numero := FormularioNode.ChildNodes['Numero'].Text;
          end;

          // Si CDSHistorial no está activo, lo inicializamos
          if not CDSHistorial.Active then
          begin
            CDSHistorial.CreateDataSet;
            CDSHistorial.Open;
            CDSHistorial.EmptyDataSet;
          end;

          // Agregar datos al CDSHistorial
          CDSHistorial.Append;
          CDSHistorial.FieldByName('nro_receta').AsString := Numero;
          CDSHistorial.FieldByName('prescriptor').AsString := Prescriptor;

          // Convertir la fecha y asignarla correctamente
          try
            CDSHistorial.FieldByName('fecha').AsDateTime := StringToDateTime(Fecha);
          except
            on E: Exception do
              ShowMessage('Error al convertir la fecha: ' + E.Message);
          end;

          CDSHistorial.Post;

          // Extraer los datos del detalle de la receta
          DetalleRecetaNode := RecetaNode.ChildNodes['DetalleReceta'];

          if DetalleRecetaNode <> nil then
          begin
            for x := 0 to DetalleRecetaNode.ChildNodes.Count - 1 do
            begin
              ItemNode := DetalleRecetaNode.ChildNodes[x];

              // Si CDSDetaReceta no está activo, lo inicializamos
              if not CDSDetaReceta.Active then
              begin
                CDSDetaReceta.CreateDataSet;
                CDSDetaReceta.Open;
                CDSDetaReceta.EmptyDataSet;
              end;

              // Añadir una nueva fila al dataset de detalle
              CDSDetaReceta.Append;
              CDSDetaReceta.FieldByName('nro_receta').AsString := Numero;
              CDSDetaReceta.FieldByName('item').AsString := ItemNode.Text;  // Asignamos el texto del item
              CDSDetaReceta.Post;
            end;
          end;
        end;
      end;

      // Configuración final
      cdshistorial.First;
      progreso.Hide;
      grillahistorial.SetFocus;
       BitBtn1.Enabled:=false;

    except
      on E: Exception do
      begin
        progreso.Hide;
        Timer1.Enabled := False;
        ShowMessage('Ocurrió un error al intentar obtener las recetas: ' + E.Message);
        ModalResult := mrClose;
      end;
    end;
  end
  else
  begin
    archivoxmlval.Free;
    Timer1.Enabled := True;
  end;

end;

procedure TfConsultaReceta.Timer1Timer(Sender: TObject);
var


NroReceta,Prescriptor,Fecha,numero:string;
begin
if contador >30 then
begin
  Timer1.Enabled:=false;
  ShowMessage('No se pudo consultar las recetas');
  progreso.close;
  modalResult:=mrClose;

end;

contador:=contador +1;
LSegundos.Caption:=IntToStr(contador)+' Segundos';
    leerRecetas;










end;


end.

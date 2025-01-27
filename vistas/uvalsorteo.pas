unit uvalsorteo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,Xml.xmldom, Xml.XMLIntf,
  msxmldom, xml.xmldoc,uCliente,uSorteo, System.Generics.Collections, uClienteService,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,udTicket;

type
  TFrmValSorteo = class(TForm)
    mmsjvalida: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Tvalidacion: TTimer;
    Lsegundos: TLabel;
    btnValidar: TBitBtn;
    idhttp: TIdHTTP;

    procedure btnValidarClick(Sender: TObject);
    procedure mmsjvalidaKeyPress(Sender: TObject; var Key: Char);
  private

    { Private declarations }
    ticket:TTicket;

  public
    { Public declarations }



    function obtenerRenglonDesdeXML(detalle:IXMLNODE):TRenglonSorteo;
    procedure crearSorteo(detalle:IXMLNODE;unSorteo:TSorteo);
    procedure mostrarMensajeError(cod_respuesta:string);
    procedure mostrarMensajeAltaSorteo(unSorteo:TSorteo);
    procedure SetTicket(unTicket:TTicket);
  end;



var
  FrmValSorteo: TFrmValSorteo;

implementation

{$R *.dfm}

procedure TFrmValSorteo.btnValidarClick(Sender: TObject);
var
  s,cod_respuesta,url,fechastr:string;
  doc:ixmldocument;
  detalle,resultado:ixmlnode;

  unSorteo:TSorteo;
  unRenglon:TRenglonSorteo;
begin
{
  ruta: http://138.118.214.152/webapps/alta_premio.php?cod_cliente=1018402&sorteo=1&sucursal=2a&categoria=1&f_entrega=2024-03-01
}
s:= '';
fechaStr:= FormatDateTime('yyy-mm-dd',now);

try
  idhttp.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';

  url:=ticket.url +'alta_premio.php?cod_cliente='+ticket.codigocliente+'&sorteo='+ticket.nroSorteo+'&sucursal_id='+ticket.sucursal+'&f_entrega='+fechastr;
  s:= IdHTTP.Get(url);

  doc:=LoadXMLData(s);
  doc.DocumentElement.ChildNodes.Count;

  resultado:= doc.ChildNodes['Resultado_alta_premio'];
  detalle:= resultado.ChildNodes['detalle'];
  cod_respuesta:= detalle.ChildNodes['codigo_respuesta'].Text;



except
  on E:Exception do
  begin
    cod_respuesta:= 'No se pudo validar el sorteo:'+E.Message;
  end;

end;

if cod_respuesta <> 'OK' then // No se pudo dar de alta el premio
begin
   mostrarMensajeError(cod_respuesta);
      mmsjvalida.Lines.Add(url);
   mmsjvalida.SetFocus;

   exit;
end;

crearSorteo(detalle,unSorteo);
mostrarMensajeAltaSorteo(unSorteo);
mmsjvalida.SetFocus;

end;

procedure TFrmValSorteo.SetTicket(unTicket: TTicket);
begin
  Ticket := unTicket;
end;

procedure TFrmValSorteo.mostrarMensajeError(cod_respuesta:string);
begin
   mmsjvalida.Color:= clMaroon;
   mmsjvalida.Lines.Add('_____________________________________________________________');
   mmsjvalida.Lines.Add('                   SORTEOS AUTOFARMA                         ');
   mmsjvalida.Lines.Add('_____________________________________________________________');
   tvalidacion.Enabled:=false;
   mmsjvalida.Lines.Add(cod_respuesta);
   mmsjvalida.Lines.Add('_____________________________________________________________');
   mmsjvalida.Lines.Add('_____________________________________________________________');


end;

procedure TFrmValSorteo.mmsjvalidaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin
     ModalResult:=mrCancel;
  end;

end;

procedure TFrmValSorteo.mostrarMensajeAltaSorteo(unSorteo:TSorteo);
begin
   mmsjvalida.Color:= clGreen;
   mmsjvalida.Lines.Add('_____________________________________________________________');
   mmsjvalida.Lines.Add('        SORTEOS AUTOFARMA - TICKET GANADOR                   ');
   mmsjvalida.Lines.Add('_____________________________________________________________');
   tvalidacion.Enabled:=false;
   mmsjvalida.Lines.Add(unSorteo.Nombre);
   mmsjvalida.Lines.Add('El cliente ganó un producto de:'+unsorteo.Detalle[0].DesCategoria);
   mmsjvalida.Lines.Add('_____________________________________________________________');

   mmsjvalida.Lines.Add('_____________________________________________________________');
   mmsjvalida.Lines.Add('                   DATOS DEL CLIENTE                         ');
   mmsjvalida.Lines.Add('_____________________________________________________________');
   mmsjvalida.Lines.Add('');
   mmsjvalida.Lines.Add('Documento: '+unsorteo.cliente.Documento);
   mmsjvalida.Lines.Add('Nombre:    '+unsorteo.cliente.Nombre);
   mmsjvalida.Lines.Add('Teléfono:  '+unsorteo.cliente.Telefono);
   mmsjvalida.Lines.Add('Dirección: '+unsorteo.cliente.Domicilio);


end;


procedure TFrmValSorteo.crearSorteo(detalle:IXMLNODE;unSorteo:TSorteo);
var
   unCliente:TCliente;
   clienteNode:IXMLNode;
   clienteService:TClienteService;
begin

 clienteService:=TClienteService.Create;

 clienteNode:= detalle.ChildNodes['cliente'];
 unCliente:= clienteService.obtenerClienteDesdeXML(clienteNode);
 unSorteo:=TSorteo.Create;
 unsorteo.Nombre:=detalle.ChildNodes['nombre_sorteo'].Text;

 unsorteo.Detalle:= TList<TRenglonSorteo>.Create();
 unSorteo.Detalle.Add(obtenerRenglonDesdeXML(detalle));

 unsorteo.cliente:=unCliente;

end;




function TFrmValSorteo.obtenerRenglonDesdeXML(detalle:IXMLNODE):TRenglonSorteo;
var
  unRenglon:TRenglonSorteo;
begin
  unRenglon:= TRenglonSorteo.Create;
  unRenglon.CodCategoria:= detalle.ChildNodes['codigo_categoria'].Text;
  unRenglon.DesCategoria:= detalle.ChildNodes['des_categoria'].Text;
  unRenglon.SucursalId:= ticket.sucursal;
  Result:=unRenglon;
end;


end.

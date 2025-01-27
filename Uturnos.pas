unit Uturnos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML,registry,udticket,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  Tfturnos = class(TForm)
    idhttp: TIdHTTP;
    lturno: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ereceta: TEdit;
    edespacho: TEdit;
    eatencion: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Bcancelar: TBitBtn;
    Label4: TLabel;
    eprioridad: TEdit;
    Button4: TButton;
    Label5: TLabel;
    eweb: TEdit;
    Button5: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure cargarAjusteTurneroSucursal;
    { Private declarations }
  public
    { Public declarations }
     Ticket:TTicket;
     procedure SetTicket(unTicket:TTicket);
  end;

var
  fturnos: Tfturnos;

implementation

{$R *.dfm}

procedure Tfturnos.Button1Click(Sender: TObject);
VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  atencion, despacho,tipo: STRING;
  reg: tregistry;
  detalleval:ixmlnode;

begin
s:='';
  try
    // lnmedicamento.Caption:=ticket.nombrestock;
    url := Ticket.direccionturnero + 'wsturno.php'+'?puesto='+TICKET.nombre_terminal;

    IdHTTP.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    s := IdHTTP.Get(url);
    j := 0;
    Doc := LoadXMLData(s);

    Doc.DocumentElement.ChildNodes.Count;

    for i := 0 to Doc.DocumentElement.ChildNodes.Count - 1 do
    begin

      atencion := doc.DocumentElement.ChildNodes['id_turno'].Text;
      tipo := doc.DocumentElement.ChildNodes['tipo_turno'].Text;
      ticket.turnoatencion:= atencion+tipo;
      bcancelar.Click;

    end;



except
  on E: Exception do
  begin
{$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:' + E.Message){$ENDIF};
  end;





end;
end;

procedure Tfturnos.Button2Click(Sender: TObject);
VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  atencion, despacho: STRING;
  reg: tregistry;
  detalleval:ixmlnode;
  tipo: string;

begin
s:='';
  try
    // lnmedicamento.Caption:=ticket.nombrestock;
    url := Ticket.direccionturnero + 'wsturnod.php'+'?puesto='+TICKET.nombre_terminal;

    IdHTTP.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    s := IdHTTP.Get(url);
    j := 0;
    Doc := LoadXMLData(s);

    Doc.DocumentElement.ChildNodes.Count;

    for i := 0 to Doc.DocumentElement.ChildNodes.Count - 1 do
    begin

      atencion := doc.DocumentElement.ChildNodes['id_turno'].Text;
      tipo :='D';
      ticket.turnoatencion:=atencion+tipo;
      bcancelar.Click;
    end;



except
  on E: Exception do
  begin
{$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:' + E.Message){$ENDIF};
  end;





end;
end;

procedure Tfturnos.Button3Click(Sender: TObject);
VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  atencion, despacho: STRING;
  reg: tregistry;
  detalleval:ixmlnode;
  tipo: string;

begin
s:='';
  try
    // lnmedicamento.Caption:=ticket.nombrestock;
    url := Ticket.direccionturnero + 'wsturnoR.php'+'?puesto='+TICKET.nombre_terminal;

    IdHTTP.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    s := IdHTTP.Get(url);
    j := 0;
    Doc := LoadXMLData(s);

    Doc.DocumentElement.ChildNodes.Count;

    for i := 0 to Doc.DocumentElement.ChildNodes.Count - 1 do
    begin

      atencion := doc.DocumentElement.ChildNodes['id_turno'].Text;
      tipo :='R';
      ticket.turnoatencion:=atencion+tipo;
      bcancelar.Click;
    end;



except
  on E: Exception do
  begin
{$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:' + E.Message){$ENDIF};
  end;





end;
end;
procedure Tfturnos.Button4Click(Sender: TObject);
VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  atencion, despacho: STRING;
  reg: tregistry;
  detalleval:ixmlnode;
  tipo: string;

begin
s:='';
  try
    // lnmedicamento.Caption:=ticket.nombrestock;
    url := Ticket.direccionturnero + 'wsturnoP.php'+'?puesto='+TICKET.nombre_terminal;

    IdHTTP.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    s := IdHTTP.Get(url);
    j := 0;
    Doc := LoadXMLData(s);

    Doc.DocumentElement.ChildNodes.Count;

    for i := 0 to Doc.DocumentElement.ChildNodes.Count - 1 do
    begin

      atencion := doc.DocumentElement.ChildNodes['id_turno'].Text;
      tipo :='P';
      ticket.turnoatencion:=atencion+tipo;
      bcancelar.Click;
    end;



except
  on E: Exception do
  begin
{$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:' + E.Message){$ENDIF};
  end;





end;
end;

procedure Tfturnos.Button5Click(Sender: TObject);
VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  atencion, despacho: STRING;
  reg: tregistry;
  detalleval:ixmlnode;
  tipo: string;

begin
s:='';
  try
    // lnmedicamento.Caption:=ticket.nombrestock;
    url := Ticket.direccionturnero + 'wsturnoW.php'+'?puesto='+TICKET.nombre_terminal;

    IdHTTP.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    s := IdHTTP.Get(url);
    j := 0;
    Doc := LoadXMLData(s);

    Doc.DocumentElement.ChildNodes.Count;

    for i := 0 to Doc.DocumentElement.ChildNodes.Count - 1 do
    begin

      atencion := doc.DocumentElement.ChildNodes['id_turno'].Text;
      tipo :='W';
      ticket.turnoatencion:=atencion+tipo;
      bcancelar.Click;
    end;



except
  on E: Exception do
  begin
{$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:' + E.Message){$ENDIF};
  end;





end;
end;

procedure Tfturnos.FormShow(Sender: TObject);
VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  atencion, despacho,receta,prioridad,WEB: STRING;
  reg: tregistry;
  detalleval:ixmlnode;

begin
  cargarAjusteTurneroSucursal;
     



s:='';
  try
    // lnmedicamento.Caption:=ticket.nombrestock;
    url := Ticket.direccionturnero + 'wsturnoactu.php';

    IdHTTP.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    s := IdHTTP.Get(url);
    j := 0;
    Doc := LoadXMLData(s);

    Doc.DocumentElement.ChildNodes.Count;
    detalleval := Doc.DocumentElement.ChildNodes[1];
    for i := 0 to Doc.DocumentElement.ChildNodes.Count - 1 do
    begin

      atencion := doc.DocumentElement.ChildNodes['turno_atencion'].Text;
      despacho := doc.DocumentElement.ChildNodes['turno_despacho'].Text;
      receta := doc.DocumentElement.ChildNodes['turno_receta'].Text;
      prioridad := doc.DocumentElement.ChildNodes['turno_prioridad'].Text;
      WEB := doc.DocumentElement.ChildNodes['turno_WEB'].Text;
      if atencion='0' then
      begin
        button1.Enabled:=false;
      end;
       if atencion<>'0' then
      begin
        button1.Enabled:=true ;
      end;

      if despacho='0' then
      begin
        button2.Enabled:=false;
      end;
       if despacho<>'0' then
      begin
        button2.Enabled:=true ;
      end;

       if receta='0' then
      begin
        button3.Enabled:=false;
      end;
       if receta<>'0' then
      begin
        button3.Enabled:=true ;
      end;

       if prioridad='0' then
      begin
        button4.Enabled:=false;
      end;
       if prioridad<>'0' then
      begin
        button4.Enabled:=true ;
      end;

        if web='0' then
      begin
        button5.Enabled:=false;
      end;
       if web<>'0' then
      begin
        button5.Enabled:=true ;
      end;

      eatencion.Text:=atencion;
      edespacho.Text:=despacho;
      ereceta.Text:=receta;
      eprioridad.Text:=prioridad;
      eweb.Text:=web;

    end;



except
  on E: Exception do
  begin
{$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:' + E.Message){$ENDIF};
  end;





end;
end;
procedure Tfturnos.SetTicket(unTicket: TTicket);
begin

  ticket:=unTicket;


end;

procedure Tfturnos.cargarAjusteTurneroSucursal;
begin
  if ticket.sucursal = '202' then
  begin
    button4.Caption := 'ATENCION OSEF/AC.SOCIAL/PROFE';
  end;
end;

end.

unit Ustock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ValEdit, Vcl.StdCtrls,
  Vcl.Buttons, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, registry,  udticket, UDMFACTURADOR,
  Vcl.ExtCtrls;

type
  Tfstock = class(TForm)
    Bcancelar: TBitBtn;
    idhttp: TIdHTTP;
    vlstock: TValueListEditor;
    Bevel1: TBevel;
    lnmedicamento: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BcancelarClick(Sender: TObject);

  private
    { Private declarations }
  public
   alfabeta: string;
   Ticket:TTicket;
   procedure SetTicket(unTicket:TTicket);
  end;

var
  fstock: Tfstock;

implementation

{$R *.dfm}

procedure Tfstock.BcancelarClick(Sender: TObject);
begin
  modalresult:= mrcancel;
end;



procedure Tfstock.FormShow(Sender: TObject);
VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  SUCURSAL, STOCK: STRING;
  reg: tregistry;
  detalleval:ixmlnode;

begin
s:='';
try
  lnmedicamento.Caption:=ticket.nombrestock;
  url:=ticket.url+'get_stock.php?'+'cod_alfabeta='+ticket.alfabetastock;

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);
  j:=0;
  Doc:=LoadXMLData(s);

  doc.DocumentElement.ChildNodes.Count;
  detalleval:=doc.DocumentElement.ChildNodes[1];
  for I := 0 to detalleval.ChildNodes.Count -1 do
  begin
  j:=j+1;
  if strtoint(detalleval.ChildNodes[I].ChildNodes['CAN_STK'].Text)>0 then
  begin
    SUCURSAL:=detalleval.ChildNodes[I].ChildNodes['NOM_SUCURSAL'].Text;
    STOCK:=detalleval.ChildNodes[I].ChildNodes['CAN_STK'].Text;
    vlstock.InsertRow(sucursal,stock,true);

  end;


  end;

   except
      on E: Exception do
      begin
        {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
      end;





end;
end;
procedure tFSTOCK.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;

end.

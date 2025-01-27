unit passaj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,udticket,Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,registry;

type
  TFPass = class(TForm)
    eclave: TEdit;
    Label1: TLabel;
    Baceptar: TBitBtn;
    Bcancelar: TBitBtn;
    IdHTTP: TIdHTTP;
    procedure BaceptarClick(Sender: TObject);
  private

    Ticket:TTicket;
  public

     procedure SetTicket(unTicket:TTicket);
  end;

var
  FPass: TFPass;

implementation

{$R *.dfm}
procedure TFPass.SetTicket(unTicket: TTicket);
begin
ticket:=unTicket;
end;
procedure TFPass.BaceptarClick(Sender: TObject);
VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  clave: STRING;
  jerarquia: string;
  vendedor: string;
  reg: tregistry;
  detalleval:ixmlnode;



begin
      // Clave de sistemas envia al codigo de vendedor 001

      if eclave.Text = 'nmpnet123'  then
      begin
          ticket.autorizado:='S';
          ticket.jerarquia:='0';
          ticket.cod_vendedor:='001';
          exit;
      end;

      doc := TXMLDocument.Create(nil);

      doc.LoadFromFile(ticket.ofertas+'vendedores.xml');

      doc.DocumentElement.ChildNodes.Count;

      detalleval:=doc.DocumentElement.ChildNodes[0];
      detalleval.ChildNodes.Count;
      for I := 0 to doc.DocumentElement.ChildNodes.Count -1 do
            begin
            j:=j+1;
              clave:=doc.DocumentElement.ChildNodes[i].ChildNodes['clave'].Text;
              jerarquia:=doc.DocumentElement.ChildNodes[i].ChildNodes['jerarquia'].Text;
              vendedor:=doc.DocumentElement.ChildNodes[i].ChildNodes['vendedor'].Text;
               if clave=eclave.text then
               begin
                 ticket.autorizado:='S';
                 ticket.jerarquia:=jerarquia;
                 ticket.cod_vendedor:=vendedor;

                 break;
               end;

            end;



end;






end.

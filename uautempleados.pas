unit uautempleados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UDTicket, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  Tfautorizacion = class(TForm)
    mmsjvalida: TMemo;
    Label1: TLabel;
    idhttp: TIdHTTP;
    procedure FormShow(Sender: TObject);
    procedure mmsjvalidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Ticket:TTicket;
  public
    { Public declarations }
     procedure SetTicket(unTicket:TTicket);
  end;

var
  fautorizacion: Tfautorizacion;

implementation

{$R *.dfm}


procedure Tfautorizacion.FormShow(Sender: TObject);

VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  porcentaje, descuentos, afiliado_nombre, afiliado_apellido: STRING;

  detalleval:ixmlnode;
begin

s:='';
try

if ticket.codigo_Co1='Z87' then
BEGIN
  url:=ticket.url+'validar_descuento_empleado.php?'+'dni='+ticket.afiliado_numeroco1+'&importe='+floattostr(ticket.importebruto)+'&sucursal_id='+ticket.sucursal;
END;
if ticket.codigo_CoS2='Z87' then
BEGIN
  url:=ticket.url+'validar_descuento_empleado.php?'+'dni='+ticket.afiliado_numeroco2+'&importe='+floattostr(ticket.importebruto)+'&sucursal_id='+ticket.sucursal;
END;

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);
  j:=0;
  Doc:=LoadXMLData(s);

  doc.DocumentElement.ChildNodes.Count;
  detalleval:=doc.DocumentElement.ChildNodes[0];
  for I := 0 to detalleval.ChildNodes.Count -1 do
  begin
  j:=j+1;
    porcentaje:=detalleval.ChildNodes['porcentaje_validado'].Text;
    descuentos:=detalleval.ChildNodes['total_descuentos_mes'].Text;
    afiliado_nombre:=detalleval.ChildNodes['nombre'].Text;
    afiliado_apellido:=detalleval.ChildNodes['apellido'].Text;




end;

   except
      on E: Exception do
      begin
        {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
      end;

end;
   porcentaje:=FLOATTOSTR(STRTOFLOAT(porcentaje)*100);
    if strtoint(porcentaje)>0  then
    begin

                          mmsjvalida.Lines.Add('_____________________________________________________________');
                          mmsjvalida.Lines.Add('VENTA APROBADA!!');
                          mmsjvalida.Lines.Add('_____________________________________________________________');
                          mmsjvalida.Lines.Add('_____________________________________________________________');
                          mmsjvalida.Lines.Add('AFILIADO: '+AFILIADO_NOMBRE+' '+AFILIADO_APELLIDO);
                          mmsjvalida.Lines.Add('_____________________________________________________________');
                          mmsjvalida.Lines.Add(' ');
                          mmsjvalida.Lines.Add(' ');
                          mmsjvalida.Lines.Add(' ');
                          mmsjvalida.Lines.Add('DESCUENTOS MES: '+descuentos);
                          mmsjvalida.Lines.Add('PORCENTAJE APROBADO: '+PORCENTAJE+'%');
                          MMSJVALIDA.Color:=clgreen;

    end;
    if strtoint(porcentaje)=0  then
    begin

                          mmsjvalida.Lines.Add('_____________________________________________________________');
                          mmsjvalida.Lines.Add('VENTA  RECHAZADA, comunicarse con administracion central');
                          MMSJVALIDA.Color:=clRED;

    end;

ticket.porcentajeempleados:=strtoint(porcentaje);

end;

procedure Tfautorizacion.mmsjvalidaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
  if (mmsjvalida.Color=clred) or (mmsjvalida.Color=clgreen) OR (mmsjvalida.Color=clBLUE) then
  begin
  ModalResult := mrCancel;
  end;

end;
end;

procedure TFautorizacion.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;


end.

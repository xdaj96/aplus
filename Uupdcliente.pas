unit Uupdcliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,udticket,Xml.xmldom,
  Xml.XMLIntf, Xml.XMLDoc, MSXML, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP,registry, Vcl.Buttons;

type
  Tvalupdcliente = class(TForm)
    Memo1: TMemo;
    idhttp: TIdHTTP;
    Bcancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
     Ticket:TTicket;
     procedure SetTicket(unTicket:TTicket);
  end;

var
  valupdcliente: Tvalupdcliente;

implementation

{$R *.dfm}

uses UdmFacturador;

procedure Tvalupdcliente.FormShow(Sender: TObject);
var
  s, url:String;
  i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  codigo_respuesta, alta_llaneza, alta_autofarma, codigo_cliente: STRING;
  reg: tregistry;

begin
s:='';
try
//------------------------se agregan + en la url para q tome los espacios ------------------------------//
  url:=ticket.url+'actualizar_cliente.php?'+'cod_cliente='+ticket.codigocliente+'&nombre='+(StringReplace(ticket.DESCRIPCIONCLIENTE, ' ', '+', [rfReplaceAll]))+'&cond_iva='+(StringReplace(ticket.CONDICIONIVA, ' ', '+', [rfReplaceAll]))+'&direccion='+(StringReplace(ticket.direccion, ' ', '+', [rfReplaceAll]))+'&telefono='+(StringReplace(ticket.telefono, ' ', '+', [rfReplaceAll]))+'&dni='+(StringReplace(ticket.dni, ' ', '+', [rfReplaceAll]))+'&cuit='+(StringReplace(ticket.CUIT, ' ', '', [rfReplaceAll]));

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);

  Doc:=LoadXMLData(s);
  doc.DocumentElement.ChildNodes.Count;
  codigo_respuesta:=doc.ChildNodes['Resultado_alta_cliente'].ChildNodes['Detalle'].ChildNodes['codigo_respuesta'].Text;
  alta_llaneza:=doc.ChildNodes['Resultado_alta_cliente'].ChildNodes['Detalle'].ChildNodes['Alta_Llaneza'].Text;
  alta_autofarma:=doc.ChildNodes['Resultado_alta_cliente'].ChildNodes['Detalle'].ChildNodes['Alta_Autofarma'].Text;
  codigo_cliente:=doc.ChildNodes['Resultado_alta_cliente'].ChildNodes['Detalle'].ChildNodes['codigo_cliente'].Text;



  memo1.Lines.Add('RESULTADO ALTA CLIENTE:  '+codigo_respuesta);
  memo1.Lines.Add('SERVIDOR LLANEZA:  '+alta_llaneza );
  memo1.Lines.Add('SERVIDOR AUTOFARMA:  '+alta_autofarma);
  memo1.Lines.Add('NRO DE CLIENTE:  '+codigo_cliente);
  TICKET.codigocliente:=CODIGO_CLIENTE;


  except
      on E: Exception do
      begin
        {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
      end;
  end;
  if ((codigo_respuesta='OK') and (alta_llaneza='1') and (alta_autofarma='1')) then
  begin
    dmfacturador.AbrirConexion();
    dmfacturador.qcliente.Close;
    dmfacturador.qcliente.SQL.Clear;
    dmfacturador.qcliente.SQL.Append('select cod_cliente, nom_cliente, pos_iva, nro_cuit, des_direccion, des_telefono  from mkmacliente where cod_cliente=:codigo');
    dmfacturador.qcliente.ParamByName('codigo').AsString:=codigo_cliente;
    dmfacturador.qcliente.Open;
    end;
    if not dmfacturador.qcliente.IsEmpty then
    begin
        dmfacturador.AbrirConexion();
        dmfacturador.qcliente.Database:=dmFacturador.getConexion;
        dmfacturador.DSicliente.DataSet:=dmfacturador.qcliente;
        dmfacturador.qcliente.Transaction:=dmFacturador.traninsertcliente;
        dmfacturador.qcliente.Close;
        dmfacturador.qcliente.SQL.Clear;
        dmfacturador.qcliente.SQL.Text:=concat( 'UPDATE MKMACLIENTE SET             ',
                                                'NOM_CLIENTE = :nombre,            ',
                                                'POS_IVA = :codigoiva,            ',
                                                'NRO_CUIT =:cuit,                ',
                                                'DES_DIRECCION = :direccion,    ',
                                                'DES_LOCALIDAD = :localidad,   ',
                                                'DES_TELEFONO = :telefono    ',
                                                'WHERE (COD_CLIENTE = :cliente)');


        dmfacturador.qcliente.ParamByName('cliente').AsString:=TICKET.codigocliente;
        dmfacturador.qcliente.ParamByName('nombre').AsString:=ticket.DESCRIPCIONCLIENTE;
        dmfacturador.qcliente.ParamByName('codigoiva').AsString:=ticket.CONDICIONIVA;
        dmfacturador.qcliente.ParamByName('cuit').AsString:=TICKET.CUIT;
        dmfacturador.qcliente.ParamByName('DIRECCION').AsString:=ticket.direccion;
        dmfacturador.qcliente.ParamByName('TELEFONO').AsString:=ticket.telefono;
        dmfacturador.qcliente.ParamByName('localidad').AsString:=ticket.nom_vendedor+' '+ticket.sucursal;
        dmfacturador.qcliente.Open;
        dmfacturador.traninsertcliente.Commit;
        memo1.Color:=clgreen;





    end;







  if ((codigo_respuesta<>'OK') or (alta_llaneza<>'1') or (alta_autofarma<>'1')) then
        begin

          memo1.Color:=clred;
          showmessage('Imposible actualizar cliente vuelva a intentarlo nuevamente');


        end;

memo1.SetFocus;


end;



procedure Tvalupdcliente.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if memo1.Color=clgreen then
begin
    if key=vk_return then

    ModalResult := mrCancel;

end;
if memo1.Color=clred then
begin
    if key=vk_return then

    ModalResult := mrCancel;

end;

end;


procedure tvalupdcliente.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;

end.

unit Uhistorial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids ,registry,  udticket, UDMFACTURADOR, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, uprogreso;

type
  Tfhistorial = class(TForm)
    Bcancelar: TBitBtn;
    Bevel1: TBevel;
    grillahistorial: TDBGrid;
    cdshistorial: TClientDataSet;
    cdshistorialSUCURSAL: TStringField;
    cdshistorialPRODUCTO: TStringField;
    cdshistorialCANTIDAD: TStringField;
    cdshistorialFECHA: TStringField;
    DSHISTORIAL: TDataSource;
    idhttp: TIdHTTP;
    lafiliado: TLabel;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   Ticket:TTicket;
   procedure SetTicket(unTicket:TTicket);
  end;

var
  fhistorial: Tfhistorial;

implementation

{$R *.dfm}

procedure Tfhistorial.FormShow(Sender: TObject);

VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  SUCURSAL, fecha, NOM_LARGO, CAN_VENDIDA: STRING;
  reg: tregistry;
  detalleval:ixmlnode;
  form2: tfprogreso;

begin
s:='';
  form2:=tfprogreso.Create(self);

  form2.Show;
  application.ProcessMessages;
try
  lafiliado.Caption:=ticket.afiliadohistorial;
  url:=ticket.url+'get_historial.php?'+'cod_afiliado='+ticket.afiliadohistorial+'&cod_os='+ticket.codigo_OS;

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);
  j:=0;
  Doc:=LoadXMLData(s);
  doc.DocumentElement.ChildNodes.Count;
  detalleval:=doc.DocumentElement.ChildNodes[1];
  for I := 0 to detalleval.ChildNodes.Count -1 do
  begin
  j:=j+1;

    SUCURSAL:=detalleval.ChildNodes[I].ChildNodes['NOM_SUCURSAL'].Text;
    fecha:=detalleval.ChildNodes[I].ChildNodes['FEC_COMPROB'].Text;
    NOM_LARGO:=detalleval.ChildNodes[I].ChildNodes['NOM_LARGO'].Text;
    CAN_VENDIDA:=detalleval.ChildNodes[I].ChildNodes['CAN_VENDIDA'].Text;
      if cdshistorial.Active=false then
      begin

      cdshistorial.CreateDataSet;
      cdshistorial.Active:=true;
      end;
      cdshistorial.Append;
      cdshistorialSUCURSAL.AsString:=SUCURSAL;
      cdshistorialPRODUCTO.asstring:=NOM_LARGO;
      cdshistorialcantidad.AsString:=can_vendida;
      cdshistorialfecha.AsString:=fecha;
      cdshistorial.Post;
      end;






except
      on E: Exception do
        begin
          {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
        end;
      end;





 form2.close;
end;

procedure Tfhistorial.SetTicket(unTicket: TTicket);
begin

  ticket:=unTicket;

end;

end.

unit ubcr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udticket, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls, Vcl.ExtCtrls,Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML,registry,IdMultipartFormData,
  Vcl.ComCtrls, uadjuntobcr;

type
  TFbcr = class(TForm)
    Panel1: TPanel;
    Combo: TComboBox;
    idhttp: TIdHTTP;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    fechadep: TDateTimePicker;
    Label2: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Button1: TButton;
    Label3: TLabel;
    Panel2: TPanel;
    lbanco: TLabel;
    Panel3: TPanel;
    lfecha: TLabel;
    ladjuntos: TLabel;
    Label4: TLabel;
    Button2: TButton;
    Shape5: TShape;
    eimporte: TEdit;
    Label5: TLabel;
    Shape6: TShape;
    Shape7: TShape;
    procedure FormShow(Sender: TObject);
    procedure ComboSelect(Sender: TObject);
    procedure fechadepChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    Ticket:TTicket;
  public
    { Public declarations }
     procedure SetTicket(unTicket:TTicket);
  end;

var
  Fbcr: TFbcr;
  rutaarchivos: string;

implementation

{$R *.dfm}

{ TFbcr }

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
begin
   ListOfStrings.Clear;
   ListOfStrings.Delimiter       := Delimiter;
   ListOfStrings.StrictDelimiter := True; // Requere D2006 o superior.
   ListOfStrings.DelimitedText   := Str;
end;


procedure TFbcr.Button1Click(Sender: TObject);
var
 form: tfadjuntobcr;
 archivoslista: tstringlist;
begin
ticket.bcr:='S';
form := tfadjuntobcr.Create(SELF);
form.ShowModal;
  if not form.itemscaja.IsEmpty then
  begin

  rutaarchivos:=form.itemscaja;
  archivoslista:=tstringlist.Create ;
  split(';',rutaarchivos , archivoslista) ;

  ladjuntos.Caption:=inttostr(archivoslista.Count);
  if archivoslista.Count>0 then
    begin
       button2.Enabled:=true;
    end;


  end;
  if form.itemscaja.IsEmpty then
  begin
    rutaarchivos:='';
  end;
ticket.bcr:='N';
end;

procedure TFbcr.Button2Click(Sender: TObject);
var
rta: string;
Params: TIdMultiPartFormDataStream;
  banco:string;
  banconumero:string;
  stringconv:string;
  archivoslista: tstringlist;
  bancolist: tstringlist;
  i: integer;

begin
 banco:=combo.text;
 bancolist:=tstringlist.Create;
 split(',',banco , bancolist) ;
 banco:=bancolist[1];


 //stringconv:=stringreplace(stringcaja,' ','-', [rfReplaceAll]);

 archivoslista:=tstringlist.Create ;
 Params :=  TIdMultiPartFormDataStream.Create;
 params.AddFormField('sucursal_num',ticket.sucursal);

 params.AddFormField('fecha',datetostr(fechadep.Date));

 params.AddFormField('cuenta',banco);

 params.AddFormField('importe',eimporte.Text);

 split(';',rutaarchivos , archivoslista) ;
  if archivoslista.Count>0 then
  begin
    for i := 0 to archivoslista.Count - 1 do
      begin

      Params.AddFile('fileToUpload', archivoslista[i]);

      idHTTP.Request.Referer := ticket.url+'boleta_deposito_save_file.php';
      rta:=idhttp.Post( ticket.url+'boleta_deposito_save_file.php',params);
      showmessage('DEPOSITO SUBIDO');
      end;

  end;

end;


procedure TFbcr.ComboSelect(Sender: TObject);
begin
lbanco.Caption:=combo.text;
end;



procedure TFbcr.fechadepChange(Sender: TObject);
begin
lfecha.Caption:=datetostr(fechadep.Date);
end;

procedure TFbcr.FormShow(Sender: TObject);
VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  c_bankaccount_id, desc_cuenta,banco_desc,banco: STRING;
  reg: tregistry;
  detalleval:ixmlnode;

begin
s:='';
fechadep.DateTime:=now;
try

  url:=ticket.url+'get_cuentas_ban.php?'+'sucursal_id='+ticket.sucursal;

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);
  j:=0;
  Doc:=LoadXMLData(s);

  doc.DocumentElement.ChildNodes.Count;
  for J := 0 to  doc.DocumentElement.ChildNodes.Count-1 do
  BEGIN
      detalleval:=doc.DocumentElement.ChildNodes[J];



      c_bankaccount_id:=detalleval.ChildNodes['c_bankaccount_id'].Text;
      desc_cuenta:=detalleval.ChildNodes['desc_cuenta'].Text;
      banco_desc:=detalleval.ChildNodes['banco_desc'].Text;
      banco:=detalleval.ChildNodes['banco'].Text;

      combo.Items.Add(banco+','+c_bankaccount_id);

  end;
  except
      on E: Exception do
      begin
        {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
      end;
  end;
end;

procedure Tfbcr.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;


end.

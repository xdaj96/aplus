unit Uafiliar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Buttons, Xml.xmldom, Xml.XMLIntf,Xml.XMLDoc,registry, MSXML,udticket,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, UDMFACTURADOR;

type
  Tfafiliar = class(TForm)
    Panel1: TPanel;
    enombre: TEdit;
    edni: TEdit;
    eemail: TEdit;
    etelefono: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    bagregarfarmacoins: TBitBtn;
    bcancelar: TBitBtn;
    IdHTTP: TIdHTTP;
    procedure bagregarfarmacoinsClick(Sender: TObject);
    procedure SetTicket(unTicket:TTicket);
    procedure bcancelarClick(Sender: TObject);
    procedure enombreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edniKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eemailKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure etelefonoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Ticket:TTicket;
  end;

var
  fafiliar: Tfafiliar;

implementation

{$R *.dfm}

procedure Tfafiliar.bagregarfarmacoinsClick(Sender: TObject);
VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  afiliado, estado: STRING;
  reg: tregistry;
  detalleval:ixmlnode;
  nombre, nombreconv,emailconv: string;

begin
  if enombre.Text='' then
  begin
    showmessage('Ingresar nombre de afiliado');
  end;
  if edni.Text='' then
  begin
    showmessage('Ingresar dni de afiliado');
  end;
  if eemail.Text='' then
  begin
    showmessage('Ingresar email de afiliado');
  end;
  if etelefono.Text='' then
  begin
    showmessage('Ingresar telefono de afiliado');
  end;
  if (enombre.Text<>'') and (edni.Text<>'') and (eemail.Text<>'') and (etelefono.Text<>'') then
    begin
      s:='';
      try
        emailconv:=stringreplace(eemail.Text,' ','', [rfReplaceAll]);
        nombreconv:=stringreplace(enombre.Text,' ','%20', [rfReplaceAll]);

        url:=ticket.url+'alta_farmavalor.php?'+'nombre='+nombreconv+'&email='+emailconv+'&nro_doc='+edni.Text+'&telefono='+etelefono.Text;

        IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
        s:=IdHTTP.Get(url);
        j:=0;
        Doc:=LoadXMLData(s);


        doc.DocumentElement.ChildNodes.Count;
        detalleval:=doc.DocumentElement.ChildNodes[0];


                  estado:=detalleval.ChildNodes[0].Text;
                  afiliado:=detalleval.ChildNodes[3].Text;





        except
          on E: Exception do
            begin
              {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
            end;
          end;
          ticket.afiliadofc:=afiliado;
          if estado='OK' then
          BEGIN
           dmFacturador.AbrirConexion();
            if dmfacturador.transafiliado.InTransaction then
            begin
              dmfacturador.transafiliado.Rollback;
            end;
           dmFacturador.qAFILIADO.Close;
           dmFacturador.qAFILIADO.SQL.Clear;
           dmFacturador.qAFILIADO.SQL.Append('INSERT INTO MKMACLIENTE (cod_cliente,NOM_CLIENTE, COD_CATEGORIA, COD_TIPDOC, NRO_DOC, DES_TELEFONO, DES_EMAIL) VALUES (:codigo,:NOMBRE, NULL, ''DNI'', :DNI, :TELEFONO, :MAIL)');
           dmfacturador.qafiliado.ParamByName('codigo').AsString:=ticket.afiliadofc;
           dmfacturador.qafiliado.ParamByName('nombre').AsString:=enombre.Text;
           dmfacturador.qafiliado.ParamByName('dni').AsString:=edni.Text;
           dmfacturador.qafiliado.ParamByName('telefono').AsString:=etelefono.Text;
           dmfacturador.qafiliado.ParamByName('mail').AsString:=eemail.Text;
           dmfacturador.qafiliado.Open;
           dmfacturador.transafiliado.Commit;
           ticket.TIENEAPLUS:='S'
          END;

      end;
  ticket.dni:=edni.Text;
  ticket.cod_cliente:=ticket.afiliadofc;

 bcancelar.Click;
end;
procedure Tfafiliar.bcancelarClick(Sender: TObject);
begin
 modalresult := mrcancel;
end;

procedure Tfafiliar.edniKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    if edni.Text <> '' then
    begin
      eemail.SetFocus;
    end;
  end;
end;

procedure Tfafiliar.eemailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    if eemail.Text <> '' then
    begin
      etelefono.SetFocus;
    end;
  end
end;

procedure Tfafiliar.enombreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    if enombre.Text <> '' then
    begin
      edni.SetFocus;
    end;
  end;
end;

procedure Tfafiliar.etelefonoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    if etelefono.Text <> '' then
    begin
      bagregarfarmacoins.SetFocus;
    end;
  end
end;

procedure Tfafiliar.SetTicket(unTicket: TTicket);

begin
  ticket:=unTicket;
end;


end.


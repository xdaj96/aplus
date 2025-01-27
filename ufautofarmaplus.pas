unit ufautofarmaplus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,udticket, udmfacturador;

type
  Tfautofarmaplus = class(TForm)
    Panel1: TPanel;
    ecliente: TEdit;
    Label25: TLabel;
    edocumento: TEdit;
    Label31: TLabel;
    bbuscardni: TButton;
    Blimpiartodo: TBitBtn;
    bcancelar: TBitBtn;
    enombrecliente: TEdit;
    Label26: TLabel;
    Baceptar: TBitBtn;
      procedure SetTicket(unTicket:TTicket);
    procedure bbuscardniClick(Sender: TObject);
    procedure edocumentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eclienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure enombreclienteChange(Sender: TObject);
    procedure BlimpiartodoClick(Sender: TObject);
    procedure BaceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Ticket:TTicket;
  end;

var
  fautofarmaplus: Tfautofarmaplus;

implementation

{$R *.dfm}
procedure Tfautofarmaplus.BaceptarClick(Sender: TObject);
begin
ticket.cod_cliente:=ecliente.Text;
ticket.dni:=edocumento.Text;
end;

procedure Tfautofarmaplus.bbuscardniClick(Sender: TObject);
begin
if edocumento.Text<>'' then
begin

  dmFacturador.AbrirConexion();
  dmFacturador.qcliente.Close;
  dmFacturador.qcliente.SQL.Clear;
  dmFacturador.qcliente.SQL.Append
    ('select cod_cliente, nom_cliente, pos_iva, nro_cuit, des_direccion, des_telefono, nro_doc  from mkmacliente where nro_doc=:codigo');
  dmFacturador.qcliente.ParamByName('codigo').AsString := edocumento.Text;
  dmFacturador.qcliente.Open;
  if dmFacturador.qcliente.RecordCount = 1 then
  begin
    ecliente.Text := dmFacturador.qcliente.Fields[0].Text;
    Ticket.codigocliente := dmFacturador.qcliente.Fields[0].Text;
    enombrecliente.Text := dmFacturador.qcliente.Fields[1].Text;
    Ticket.DESCRIPCIONCLIENTE := dmFacturador.qcliente.Fields[1].Text;

    Ticket.CUIT := dmFacturador.qcliente.Fields[3].Text;

    Ticket.direccion := dmFacturador.qcliente.Fields[4].Text;

    Ticket.telefono := dmFacturador.qcliente.Fields[5].Text;
 //   edocumento.Text := dmFacturador.qcliente.Fields[6].Text;
    Ticket.dni := dmFacturador.qcliente.Fields[6].Text;

    ticket.tieneaplus:='S'

  end;
  if dmFacturador.qcliente.RecordCount = 0 then
  begin

    enombrecliente.Text := '';

    ecliente.text:= '';

    ticket.tieneaplus:='N'




  end;



end;


if ecliente.Text<>'' then
begin
  //  edocumento.OnChange:=nil;
  dmFacturador.AbrirConexion();
  dmFacturador.qcliente.Close;
  dmFacturador.qcliente.SQL.Clear;
  dmFacturador.qcliente.SQL.Append
    ('select cod_cliente, nom_cliente, pos_iva, nro_cuit, des_direccion, des_telefono, nro_doc  from mkmacliente where cod_cliente=:codigo');
  dmFacturador.qcliente.ParamByName('codigo').AsString := ecliente.Text;
  dmFacturador.qcliente.Open;
  if dmFacturador.qcliente.RecordCount = 1 then
  begin
    ecliente.Text := dmFacturador.qcliente.Fields[0].Text;
    Ticket.codigocliente := dmFacturador.qcliente.Fields[0].Text;
    enombrecliente.Text := dmFacturador.qcliente.Fields[1].Text;
    Ticket.DESCRIPCIONCLIENTE := dmFacturador.qcliente.Fields[1].Text;

    Ticket.CUIT := dmFacturador.qcliente.Fields[3].Text;

    Ticket.direccion := dmFacturador.qcliente.Fields[4].Text;

    Ticket.telefono := dmFacturador.qcliente.Fields[5].Text;
    edocumento.Text := dmFacturador.qcliente.Fields[6].Text;
    Ticket.dni := dmFacturador.qcliente.Fields[6].Text;

  end;
  if dmFacturador.qcliente.RecordCount = 0 then
  begin

    enombrecliente.Text := '';

//    edocumento.Text := '';



  end;
end;
end;





procedure Tfautofarmaplus.BlimpiartodoClick(Sender: TObject);
begin
edocumento.Text:='';
ecliente.Text:='';
enombrecliente.Text:='';
end;

procedure Tfautofarmaplus.eclienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = vk_return then
  begin
    bbuscardni.Click;
  end;
if enombrecliente.Text<>'' then
  begin
    baceptar.SetFocus;
  end;


end;

procedure Tfautofarmaplus.edocumentoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = vk_return then
  begin
    bbuscardni.Click;

  end;
end;
procedure Tfautofarmaplus.enombreclienteChange(Sender: TObject);
begin
if enombrecliente.Text<>'' then
  begin
     baceptar.Enabled:=true;
  end;
if enombrecliente.Text='' then
  begin
     baceptar.Enabled:=false;
  end;
end;

procedure Tfautofarmaplus.SetTicket(unTicket: TTicket);

begin
  ticket:=unTicket;
end;

end.

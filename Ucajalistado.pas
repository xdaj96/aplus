unit Ucajalistado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Registry, Data.DB, IBX.IBDatabase, IBX.IBCustomDataSet,
  IBX.IBQuery, udticket, ucajaenviar2;
 Const
  RegKey ='Software\Autofarma\APlus\';
type
  Tfcajalistado = class(TForm)
    gcajas: TDBGrid;
    bcancelar: TBitBtn;
    ibtcajanombre: TIBTransaction;
    Dcajanombre: TDataSource;
    ibcajanombre: TIBQuery;
    ibcajanombreNRO_CAJA: TSmallintField;
    ibcajanombreDES_CAJA: TIBStringField;
    ibcajanombreFEC_OPERACIONES: TDateTimeField;
    base: TIBDatabase;
    procedure FormShow(Sender: TObject);
    procedure gcajasDblClick(Sender: TObject);
    private
   Ticket:TTicket;
    public
    procedure SetTicket(unTicket:TTicket);
    end;

var
  fcajalistado: Tfcajalistado;

implementation

{$R *.dfm}

procedure Tfcajalistado.FormShow(Sender: TObject);
var

 reg: tregistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);
  base.Connected:=false;
  base.LoginPrompt:=false;
  base.DatabaseName:=reg.ReadString('rutabase');
  base.Params.Values['User_Name']:='SYSDBA';
  base.Params.Values['Password']:='nmpnet';
  base.DefaultTransaction:=ibtcajanombre;
  if ibtcajanombre.InTransaction then
  ibtcajanombre.Rollback;

  base.Connected:=true;
  ibtcajanombre.StartTransaction;
  ibcajanombre.Database:=base;
  ibcajanombre.Close;
  ibcajanombre.SQL.Clear;
  ibcajanombre.SQL.Add('SELECT DISTINCT c.NRO_CAJA, a.des_caja, FEC_OPERACIONES FROM cjmaapertura c, cjmacaja a WHERE c.nro_caja=a.nro_caja and c.nro_sucursal=a.nro_sucursal and MAR_CAJA=''S'' GROUP BY 1,2,3');
  ibcajanombre.Open;
end;
procedure Tfcajalistado.gcajasDblClick(Sender: TObject);
var
form: tfcajaenviar2;
begin
    ticket.cajacambio:=gcajas.Fields[0].AsString;
    FORM:=tfcajaenviar2.Create(SELF);
    form.SetTicket(ticket);

    FORM.ShowModal;
    FORM.DisposeOf;
end;

procedure tfcajalistado.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;

end;

end.

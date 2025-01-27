unit Ulistadocajas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Registry, Data.DB, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids,udticket,
  Vcl.StdCtrls, Vcl.Buttons;
Const
  RegKey ='Software\Autofarma\APlus\';

type
  Tfcajas = class(TForm)
    gcajas: TDBGrid;
    ibtcajanombre: TIBTransaction;
    Dcajanombre: TDataSource;
    ibcajanombre: TIBQuery;
    ibcajanombreNRO_CAJA: TSmallintField;
    ibcajanombreDES_CAJA: TIBStringField;
    base: TIBDatabase;
    ibcajanombreFEC_OPERACIONES: TDateTimeField;
    bcancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure gcajasDblClick(Sender: TObject);
    procedure bcancelarClick(Sender: TObject);

    private
   Ticket:TTicket;
    public
    procedure SetTicket(unTicket:TTicket);
    end;


var
  fcajas: Tfcajas;

implementation

{$R *.dfm}

procedure Tfcajas.gcajasDblClick(Sender: TObject);
var
form: tfcajas;
begin
ticket.cajacambio:=gcajas.Fields[0].AsString;
bcancelar.Click;
end;

procedure Tfcajas.bcancelarClick(Sender: TObject);
begin
modalresult:=mrcancel;
end;

procedure Tfcajas.FormShow(Sender: TObject);
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
procedure tfcajas.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;

end;

end.

unit ucaja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ValEdit, WinInet, WinSock,
  Vcl.DBGrids,Registry, Data.DB, IBX.IBDatabase, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls, ulistadocajas, udticket;
 Const
  RegKey ='Software\Autofarma\APlus\';

 type
  Tfcaja = class(TForm)
    DBGrid1: TDBGrid;
    basecfg: TIBDatabase;
    ibcaja: TIBQuery;
    dcaja: TDataSource;
    IBTcaja: TIBTransaction;
    base: TIBDatabase;
    ibcajanombre: TIBQuery;
    Dcajanombre: TDataSource;
    ibtcajanombre: TIBTransaction;
    ibcajaIDE_PUESTO: TIBStringField;
    ibcajaNRO_CAJA: TSmallintField;
    ibcajanombreNRO_CAJA: TSmallintField;
    ibcajanombreDES_CAJA: TIBStringField;
    ibcajanombreMAX: TDateTimeField;
    Label3: TLabel;
    Shape1: TShape;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);



    private
   Ticket:TTicket;
  public
    procedure SetTicket(unTicket:TTicket);
end;


var
  fcaja: Tfcaja;

implementation

{$R *.dfm}
function GetPCName: string;
var
  Buffer: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
  Size: Cardinal;
begin
  FillChar(Buffer,Sizeof(Buffer),0);
  Size:= Sizeof(Buffer);
  if GetComputerName(Buffer,Size) then
    Result:= String(PChar(@Buffer))
  else
    Result:= '';
end;


procedure Tfcaja.DBGrid1DblClick(Sender: TObject);

VAR
FORM: TFcajas;

reg: tregistry;
caja: string;
Idx: Integer;
begin
  ticket.puestocambio:=DBGRID1.DataSource.DataSet.FieldByName('IDE_PUESTO').AsString;
  FORM:=tFcajas.Create(SELF);
  form.SetTicket(ticket);
  FORM.Showmodal;

 // LPUESTO.Caption:=DBGRID1.DataSource.DataSet.FieldByName('IDE_PUESTO').AsString;

        Reg := TRegistry.Create;
        Reg.RootKey := HKEY_CURRENT_USER;
        Reg.OpenKey(regKey,true);
        basecfg.Connected:=false;
        basecfg.LoginPrompt:=false;
        basecfg.DatabaseName:=reg.ReadString('rutabasecfg');
        basecfg.Params.Values['User_Name']:='SYSDBA';
        basecfg.Params.Values['Password']:='nmpnet';
        basecfg.DefaultTransaction:=ibtcaja;
        if ticket.cajacambio<>'' then
        begin
        if ibtcaja.InTransaction then
        begin
        ibtcaja.Rollback;
        end;

        basecfg.Connected:=true;
        ibtcaja.StartTransaction;
        ibcaja.Database:=basecfg;
        ibcaja.Close;
        ibcaja.SQL.Clear;
        ibcaja.SQL.Add('update msmapuesto  set nro_caja=:caja where ide_puesto=:puesto');
        ibcaja.ParamByName('caja').ASSTRING:=ticket.cajacambio;
        ibcaja.ParamByName('puesto').AsString:=ticket.puestocambio;
        ibcaja.Open;
        ibtcaja.commit;

          Reg := TRegistry.Create;
          Reg.RootKey := HKEY_CURRENT_USER;
          Reg.OpenKey(regKey,true);
          basecfg.Connected:=false;
          basecfg.LoginPrompt:=false;
          basecfg.DatabaseName:=reg.ReadString('rutabasecfg');
          basecfg.Params.Values['User_Name']:='SYSDBA';
          basecfg.Params.Values['Password']:='nmpnet';
          basecfg.DefaultTransaction:=ibtcaja;
          basecfg.Connected:=true;
          ibcaja.Database:=basecfg;
          ibcaja.Close;
          ibcaja.SQL.Clear;
          ibcaja.SQL.Add('select ide_puesto, nro_caja from msmapuesto');
          ibcaja.Open;
          showmessage('Cambio puesto '+ticket.puestocambio+' realizado con exito');
          ticket.puestocambio:='';
          ticket.cajacambio:='';

        end;

end;

procedure Tfcaja.FormShow(Sender: TObject);
var
 reg: tregistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);
  basecfg.Connected:=false;
  basecfg.LoginPrompt:=false;
  basecfg.DatabaseName:=reg.ReadString('rutabasecfg');
  basecfg.Params.Values['User_Name']:='SYSDBA';
  basecfg.Params.Values['Password']:='nmpnet';
  basecfg.DefaultTransaction:=ibtcaja;
  basecfg.Connected:=true;
  ibcaja.Database:=basecfg;
  ibcaja.Close;
  ibcaja.SQL.Clear;
  ibcaja.SQL.Add('select ide_puesto, nro_caja from msmapuesto');
  ibcaja.Open;

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
  ibcajanombre.SQL.Add('SELECT DISTINCT c.NRO_CAJA, a.des_caja, MAX(FEC_OPERACIONES) FROM cjmaapertura c, cjmacaja a WHERE c.nro_caja=a.nro_caja and c.nro_sucursal=a.nro_sucursal and MAR_CAJA=''S'' GROUP BY 1,2');
  ibcajanombre.Open;



end;
procedure tfcaja.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;

end;

end.

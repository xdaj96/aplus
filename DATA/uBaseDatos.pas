unit uBaseDatos;

interface

uses  uRegistryHelper,
  IBX.IBDatabase,db,System.SysUtils, IBX.IBQuery, IBX.IBCustomDataSet, Classes,Dialogs;

type
  TBaseDatos = class
  private
    class var FInstance: TBaseDatos;
    FDatabase: TIBDatabase;
    FTransaction: TIBTransaction;
    FQuery: TIBQuery;
    constructor Create;
  public
    class function GetInstance: TBaseDatos;
    destructor Destroy; override;

    procedure Conectar();
    procedure Desconectar;
    procedure iniciarTransaccion;
    procedure EjecutarConsulta(const ASQL: string);
    procedure Commit;
    procedure Rollback;
    function ObtenerResultSet(const ASQL: string): TDataSet;
    function getQuery:TIBQuery;
    function estaConectado:boolean;
  end;

implementation

{ TBaseDatos }

constructor TBaseDatos.Create;
begin
  FDatabase := TIBDatabase.Create(nil);
      FDatabase.Connected := False;
  FTransaction := TIBTransaction.Create(nil);
  FQuery := TIBQuery.Create(nil);

  FQuery.Database := FDatabase;
  FQuery.Transaction := FTransaction;

  FTransaction.DefaultDatabase := FDatabase;

end;

destructor TBaseDatos.Destroy;
begin
  Desconectar;
  FQuery.Free;
  FTransaction.Free;
  FDatabase.Free;
  inherited;
end;



class function TBaseDatos.GetInstance: TBaseDatos;
begin
  if FInstance = nil then
    FInstance := TBaseDatos.Create;
  Result := FInstance;
end;

procedure TBaseDatos.Conectar();
var
reg: TRegistryHelper;
begin

  try

  Reg := TRegistryHelper.Create;


  if not FDatabase.Connected then
  begin
    FDatabase.Connected:=false;
    FDatabase.DatabaseName:=reg.LeerValor('rutabase');

    FDatabase.Params.Values['User_Name']:='SYSDBA';
    FDatabase.Params.Values['Password']:='nmpnet';
    FDatabase.LoginPrompt:= False;
    FDatabase.Connected := True;
  end;

  reg.Free;

  except
    on E:Exception do
    begin
      raise Exception.Create('No se pudo conectar a la base de datos. Revise la configuración');
    end;

  end;
end;

function TBaseDatos.estaConectado;
begin
  Result:= FDatabase.Connected;
end;


procedure TBaseDatos.Desconectar;
begin
  if FDatabase.Connected then
    FDatabase.Connected := False;
end;

procedure TBaseDatos.iniciarTransaccion;
begin
  if FTransaction.InTransaction then
     FTransaction.Rollback;

  FTransaction.StartTransaction;
end;

procedure TBaseDatos.EjecutarConsulta(const ASQL: string);
begin
  FQuery.Close;
  FQuery.SQL.Text := ASQL;
  FQuery.ExecSQL;
end;


function TBaseDatos.getQuery:TibQuery;
begin
  Result:= FQuery;
end;


procedure TBaseDatos.Commit;
begin
  FTransaction.Commit;
end;

procedure TBaseDatos.Rollback;
begin
  FTransaction.Rollback;
end;

function TBaseDatos.ObtenerResultSet(const ASQL: string): TDataSet;
begin
  Result := FQuery.Create(nil);
  try
    FQuery.Database := FDatabase;
    FQuery.Transaction := FTransaction;
    FQuery.SQL.Text := ASQL;
    Result.Open;
  except
    on E:Exception do
    begin
    //Result.Free;
      raise Exception.Create('No se pudo obtener el dataset '+#13+'Detalles:'+E.Message);
    end;


  end;
end;

initialization

finalization
  if TBaseDatos.FInstance <> nil then
    TBaseDatos.FInstance.Free;

end.

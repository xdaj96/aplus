unit uRegistryHelper;

interface

uses
  Registry,Windows;

type
  TRegistryHelper = class
  private
    FRegistry: TRegistry;
    RegKey:string;

  public
    constructor Create;
    destructor Destroy; override;
    function LeerValor(Nombre: string): string;
    procedure EscribirValor(Nombre: string; Valor: string);
    procedure EliminarValor(Nombre: string);
  end;

implementation

constructor TRegistryHelper.Create;
begin
  FRegistry := TRegistry.Create;
  RegKey :='Software\Autofarma\APlus\';
end;

destructor TRegistryHelper.Destroy;
begin
  FRegistry.Free;
  inherited;
end;

function TRegistryHelper.LeerValor(Nombre: string): string;
begin
    FRegistry.OpenKey(regKey,true);
    Result := FRegistry.ReadString(Nombre);
    FRegistry.CloseKey;
end;

procedure TRegistryHelper.EscribirValor(Nombre: string; Valor: string);
begin
  FRegistry.RootKey := HKEY_CURRENT_USER;
  if FRegistry.OpenKey(RegKey, True) then
  begin
    FRegistry.WriteString(Nombre, Valor);
    FRegistry.CloseKey;
  end;
end;

procedure TRegistryHelper.EliminarValor(Nombre: string);
begin
  FRegistry.RootKey := HKEY_CURRENT_USER;
  if FRegistry.OpenKey(RegKey, True) then
  begin
    FRegistry.DeleteValue(Nombre);
    FRegistry.CloseKey;
  end;
end;

end.


unit uConfiguracionService;

interface
 uses
   Classes,System.SysUtils,uRegistryHelper;
  type TConfiguracion = class
    private
     reg:TRegistryHelper;
    public
     constructor Create;
     destructor destroy;
     procedure validarConfiguracion(arrConfiguracion:TStrings);
     procedure registrarConfiguracion(arrConfiguracion:TStrings);
     function obtenerParametro(parametro:string):string;
  end;
implementation


constructor TConfiguracion.Create;
begin
  reg:= TRegistryHelper.Create;
end;

destructor TConfiguracion.destroy;
begin
  if Assigned(reg) then
     reg.Free;
end;


procedure TConfiguracion.validarConfiguracion(arrConfiguracion:TStrings);
var
i:Integer;
begin
  for i := 0 to arrConfiguracion.Count - 1 do
  begin
    if arrConfiguracion.ValueFromIndex[i] = '' then
    begin
       raise Exception.Create('Falta configurar parametros. Revise la configuración');
    end;

  end;
end;

function TConfiguracion.obtenerParametro(parametro: string):string;
begin
  Result:= reg.LeerValor(parametro);
end;

procedure TConfiguracion.registrarConfiguracion(arrConfiguracion:TStrings);
begin
   validarConfiguracion(arrConfiguracion);

  Reg.EscribirValor('rutabase', arrconfiguracion.Values['Ruta base de datos']);
  Reg.EscribirValor('rutabasecfg', arrconfiguracion.Values['Ruta base de configuracion']);
  Reg.EscribirValor('sucursal', arrconfiguracion.Values['Numero de sucursal']);
  Reg.EscribirValor('pv', arrconfiguracion.Values['Letrita']);
  Reg.EscribirValor('pf', arrconfiguracion.Values['Numero']);
  Reg.EscribirValor('com', arrconfiguracion.Values['Puerto COM fiscal']);
  Reg.EscribirValor('URL', arrconfiguracion.Values['Url Webapps']);
  Reg.EscribirValor('Reportes', arrconfiguracion.Values['Ruta reportes']);
  Reg.EscribirValor('error', arrconfiguracion.Values['Ruta errores']);
  Reg.EscribirValor('Recargo', arrconfiguracion.Values['Recargo']);
  Reg.EscribirValor('clave', arrConfiguracion.Values['clave']);
  REG.EscribirValor('ipfiscal',arrconfiguracion.Values['IP controlador FISCAL']);
  REG.EscribirValor('ifh',arrconfiguracion.Values['Version IFH']);
  REG.EscribirValor('P-441F',arrconfiguracion.Values['P-441F']);
  REG.EscribirValor('caja',arrconfiguracion.Values['Modulo de caja']);
  REG.EscribirValor('ventanas',arrconfiguracion.Values['Ventanas Multiples']);
  REG.EscribirValor('ofertas',arrconfiguracion.Values['Ruta Ofertas']);
  REG.EscribirValor('region',arrconfiguracion.Values['Region']);
  REG.EscribirValor('Fiscal',arrconfiguracion.Values['Marca del Fiscal']);
  REG.EscribirValor('Cola',arrconfiguracion.Values['Usa cola']);
  REG.EscribirValor('Rcola',arrconfiguracion.Values['Ruta de cola']);
  REG.EscribirValor('Oespecial',arrconfiguracion.Values['Oferta especial']);
  REG.EscribirValor('Turnero',arrconfiguracion.Values['Turnero']);
  REG.EscribirValor('Dturnero',arrconfiguracion.Values['Direccion turnero']);
  Reg.EscribirValor('RecargoHosp',arrconfiguracion.values['Recargo hospital']);
  Reg.EscribirValor('IMPRESORA',arrconfiguracion.values['IMPRESORA']);


end;

end.

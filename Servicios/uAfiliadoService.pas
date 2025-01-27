unit uAfiliadoService;

interface

uses uAfiliadoDAO, db, sysUtils, uAfiliado;

type
  TAfiliadoService = class
  private
    afiliadoDAO: TAfiliadoDAO;
  public
    constructor Create;
    destructor destroy;
    function buscarAfiliado(codigoPlan: string;nroAfiliado:string): TAfiliado;
    function getAfiliadoDesdeDataSet(data:TDataSet):TAfiliado;
    function getAfiliado(codPlanos:string;nroAfi:string;apellidoAfi:string;nombreAfi:string):TAfiliado;

    function existeAfiliado(afiliado:TAfiliado):boolean;
    procedure actualizarAfiliado(afiliado:TAfiliado);
    procedure registrarAfiliado(afiliado:TAfiliado);
    procedure guardar(afiliado:TAfiliado);
  end;

implementation

constructor TAfiliadoService.Create;
begin
  afiliadoDAO := TAfiliadoDAO.Create;

end;

destructor  TAfiliadoService.destroy;
begin
    afiliadoDAO.Free;
end;


{-------------------------------------------------------------------------
  Procedimiento: getAfiliadoDesdeDataSet
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: obtiene una instancia de afiliado a partir de un dataset
--------------------------------------------------------------------------}

function TAfiliadoService.getAfiliadoDesdeDataSet(data: TDataSet):TAfiliado;
var
  afiliado:TAfiliado;
begin
  afiliado:=nil;

  if not data.IsEmpty then
  begin
    afiliado:= TAfiliado.Create;
    afiliado.codigoPlan:= data.FieldByName('cod_planos').AsString;
    afiliado.setApellidoNombre(data.FieldByName('des_afiliado').AsString);
    afiliado.nroAfiliado:= data.FieldByName('nro_afiliado').AsString;

  end;

  Result:= afiliado;
end;

{-------------------------------------------------------------------------
  Procedimiento: buscarAfiliado
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: busca un medico en la base de datos por plan y nro de afiliado
--------------------------------------------------------------------------}

function TAfiliadoService.buscarAfiliado(codigoPlan: string;nroAfiliado:string): TAfiliado;
var
  data:TDataSet;
begin
  try
    data:= afiliadoDAO.buscarPorCodigo(codigoPlan,nroAfiliado);
    Result:= getAfiliadoDesdeDataSet(data);

  except
    on E:Exception do
    begin
      raise Exception.Create('No se pudo buscar el afiliado. Vuelva a intentarlo'+#13+'Detalles:'+E.Message);
    end;

  end;
end;

{-------------------------------------------------------------------------
  Procedimiento: actualizarAfiliado
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: actualiza un medico en la base de datos
--------------------------------------------------------------------------}

procedure TAfiliadoService.actualizarAfiliado(afiliado: TAfiliado);
begin
  try
     afiliadoDAO.iniciarTransaccion;
     afiliadoDAO.actualizar(afiliado);
     afiliadoDAO.commit;
  except
    on E:Exception do
    begin
        afiliadoDAO.rolback;
        raise Exception.Create('No se pudo registrar el afiliado'+ 'Detalles:'+E.Message);
    end;

  end;


end;

{-------------------------------------------------------------------------
  Procedimiento: existeAfiliado
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: verifica si existe el afiliado en la base de datos
--------------------------------------------------------------------------}

function TAfiliadoService.existeAfiliado(afiliado: TAfiliado):boolean;
var
afiliadoEncontrado:TAfiliado;
existe:boolean;
begin
  try
    existe:= false;

    afiliadoEncontrado:= buscarAfiliado(afiliado.codigoPlan,afiliado.nroAfiliado);

    if (afiliadoEncontrado <> nil)  then
      existe:= True;

    Result:= existe;
  except
    on E:Exception do
    begin
      raise Exception.Create('No se pudo verificar el afiliado. Vuelva a intentarlo'+#13+'Detalles:'+E.Message);
    end;

  end;

  // Liberar la memoria asignada al objeto afiliadoEncontrado
  if Assigned(afiliadoEncontrado) then
    afiliadoEncontrado.Free;


end;

{-------------------------------------------------------------------------
  Procedimiento: Guardar
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: Determina el tipo de actualizacion del afiliado
--------------------------------------------------------------------------}

procedure TAfiliadoService.guardar(afiliado: TAfiliado);
begin

  if existeAfiliado(afiliado) then
  begin
      actualizarAfiliado(afiliado);
  end
  else
  begin
      registrarAfiliado(afiliado);
  end;



end;


{-------------------------------------------------------------------------
  Procedimiento: getAfiliado
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: Genera el modelo de afiliado desde el modelo
--------------------------------------------------------------------------}

function TAfiliadoService.getAfiliado(codPlanos:string;nroAfi:string;apellidoAfi:string;nombreAfi:string):TAfiliado;
var
  afiliado:TAfiliado;
begin
  afiliado := TAfiliado.Create;
  afiliado.nroAfiliado := nroAfi;
  afiliado.codigoPlan := codPlanos;
  afiliado.nombre := nombreAfi;
  afiliado.apellido := apellidoAfi;
  Result:= afiliado;
end;


{-------------------------------------------------------------------------
  Procedimiento: registrarAfiliado
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: Registra un afiliado en la base de datos
--------------------------------------------------------------------------}

procedure TAfiliadoService.registrarAfiliado(afiliado: TAfiliado);
begin
   try
     afiliadoDAO.iniciarTransaccion;
     afiliadoDAO.registrar(afiliado);
     afiliadoDAO.commit;
  except
    on E:Exception do
    begin
        afiliadoDAO.rolback;
        raise Exception.Create('No se pudo actualizar el afiliado' + #13+'Detalles:'+E.Message);
    end;

  end;

end;

end.

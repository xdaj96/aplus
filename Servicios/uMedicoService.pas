unit uMedicoService;

interface

uses uAfiliadoDAO, db, sysUtils, uAfiliado,uMedico,uMedicoDAO;

type
  TMedicoService = class
  private
    medicoDAO: TMedicoDAO;
  public
    constructor Create;
    destructor destroy;
    function buscarMedico(codigoPlan: string;nroMatricula:string): TMedico;
    function getMedicoDesdeDataSet(data:TDataSet):TMedico;
    function existeMedico(medico:TMedico):boolean;
    function getMedico(codPlanos:string;nroMat:string;apellidoMed:string;nombreMed:string):TMedico;

    procedure actualizarMedico(medico:TMedico);
    procedure registrarMedico(medico:TMedico);
    procedure guardar(medico:TMedico);
  end;

implementation

constructor TMedicoService.Create;
begin
  medicoDAO := TMedicoDAO.Create;

end;

destructor  TMedicoService.destroy;
begin
    medicoDAO.Free;
end;


{-------------------------------------------------------------------------
  Procedimiento: getMedicoDesdeDataSet
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: construye la instancia de medico desde un registro de dataset
--------------------------------------------------------------------------}
function TMedicoService.getMedicoDesdeDataSet(data: TDataSet):TMedico;
var
  medico:TMedico;
begin
  medico:=nil;

  if not data.IsEmpty then
  begin
    medico:= TMedico.Create;
    medico.codigoPlan:= data.FieldByName('cod_planos').AsString;
    medico.setApellidoNombre(data.FieldByName('des_medico').AsString);
    medico.nroMatricula:= data.FieldByName('nro_matricula').AsString;

  end;

  Result:= medico;
end;

{-------------------------------------------------------------------------
  Procedimiento: getMedicoDesdeDataSet
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: Busca el medico por plan y matricula en la base de datos
--------------------------------------------------------------------------}

function TMedicoService.buscarMedico(codigoPlan: string;nroMatricula:string): TMedico;
var
  data:TDataSet;
begin
  try
    data:= medicoDAO.buscarPorCodigo(codigoPlan,nroMatricula);
    Result:= getMedicoDesdeDataSet(data);

  except
    on E:Exception do
    begin
      raise Exception.Create('No se pudo buscar el medico. Vuelva a intentarlo'+#13+'Detalles:'+E.Message);
    end;

  end;
end;

{-------------------------------------------------------------------------
  Procedimiento: actualizarMedico
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: actualiza los datos del medico en la base de datos
--------------------------------------------------------------------------}
procedure TMedicoService.actualizarMedico(medico: TMedico);
begin
  try
     medicoDAO.iniciarTransaccion;
     medicoDAO.actualizar(medico);
     medicoDAO.commit;
  except
    on E:Exception do
    begin
        medicoDAO.rolback;
        raise Exception.Create('No se pudo registrar el medico'+ 'Detalles:'+E.Message);
    end;

  end;


end;


{-------------------------------------------------------------------------
  Procedimiento: Guardar
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: Determina el tipo de actualizacion del afiliado
--------------------------------------------------------------------------}

procedure TMedicoService.guardar(medico: TMedico);
begin

  if existeMedico(medico) then
  begin
      actualizarMedico(medico);
  end
  else
  begin
      registrarMedico(medico);
  end;



end;

{-------------------------------------------------------------------------
  Procedimiento: getMedico
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: Genera el modelo del medico
--------------------------------------------------------------------------}

function TMedicoService.getMedico(codPlanos:string;nroMat:string;apellidoMed:string;nombreMed:string):TMedico;
var
  medico:TMedico;
begin
  medico := TMedico.Create;
  medico.nroMatricula := nroMat;
  medico.codigoPlan := codPlanos;
  medico.nombre := nombreMed;
  medico.apellido := apellidoMed;
  Result:= medico;
end;


{-------------------------------------------------------------------------
  Procedimiento: existeMedico
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: Verifica si existe el medico en la base de datos
--------------------------------------------------------------------------}

function TMedicoService.existeMedico(medico: TMedico):boolean;
var
medicoEncontrado:TMedico;
existe:boolean;
begin
  try
    existe:= false;

    medicoEncontrado:= buscarMedico(medico.codigoPlan,medico.nroMatricula);

    if (medicoEncontrado <> nil)  then
      existe:= True;

    Result:= existe;
  except
    on E:Exception do
    begin
      raise Exception.Create('No se pudo verificar el medico. Vuelva a intentarlo'+#13+'Detalles:'+E.Message);
    end;

  end;

  // Liberar la memoria asignada al objeto afiliadoEncontrado
  if Assigned(medicoEncontrado) then
    medicoEncontrado.Free;


end;

{-------------------------------------------------------------------------
  Procedimiento: registrarMedico
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: Registra un medico en la base de datos
--------------------------------------------------------------------------}

procedure TMedicoService.registrarMedico(medico: TMedico);
begin
   try
     medicoDAO.iniciarTransaccion;
     medicoDAO.registrar(medico);
     medicoDAO.commit;
  except
    on E:Exception do
    begin
        medicoDAO.rolback;
        raise Exception.Create('No se pudo actualizar el medico' + #13+'Detalles:'+E.Message);
    end;

  end;

end;

end.

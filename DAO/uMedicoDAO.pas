unit uMedicoDAO;

interface

uses udmFacturador, db, sysUtils, uMedico;

type
  TMedicoDAO = class
  private

  public
    function buscarPorCodigo(codigoPlan: string; nroMatricula: string)
      : TDataSet;
    procedure iniciarTransaccion;
    procedure commit;
    procedure rolback;
    procedure registrar(medico: TMedico);
    procedure actualizar(medico: TMedico);

  end;

implementation

{-------------------------------------------------------------------------
  Procedimiento: iniciarTransaccion
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: Inicia la transaccion en la base de datos
--------------------------------------------------------------------------}

procedure TMedicoDAO.iniciarTransaccion;
begin
  if dmfacturador.tranafiliados.InTransaction then
  begin
    rolback;
  end;
  dmfacturador.qiafiliados.Database := dmfacturador.getConexion;
  dmfacturador.dataafiliados.DataSet := dmfacturador.qiafiliados;
  dmfacturador.qiafiliados.Transaction := dmfacturador.tranafiliados;
  dmfacturador.qiafiliados.Close;
  dmfacturador.qiafiliados.SQL.Clear;

end;

{-------------------------------------------------------------------------
  Procedimiento: rolback
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: Cancela la transaccion en la base de datos
--------------------------------------------------------------------------}
procedure TMedicoDAO.rolback;
begin
  dmfacturador.tranafiliados.Rollback;
end;

procedure TMedicoDAO.commit;
begin
  dmfacturador.qiafiliados.Open;
  dmfacturador.tranafiliados.commit;
end;

{-------------------------------------------------------------------------
  Procedimiento: registrar
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: Genera la consulta de inserción parametrizada
--------------------------------------------------------------------------}
procedure TMedicoDAO.registrar(medico: TMedico);
begin
  dmfacturador.qiafiliados.SQL.Text :=
    concat('INSERT INTO OSMAMEDICOS (NRO_MATRICULA, COD_PLANOS, DES_MEDICO, MAR_INHIBIDO, DES_DIRECCION, DES_LOCALIDAD, DES_TELEFONO, DES_FAX, COD_ESPECIALIDAD, ES_INSTITUCION)',
    'VALUES (:MATRICULA, :CODIGOPLAN, :DESMEDICO, ''N'', NULL, NULL, NULL, NULL, NULL, ''N'')');
  dmfacturador.qiafiliados.ParamByName('codigoPLAN').AsString := medico.codigoPlan;
  dmfacturador.qiafiliados.ParamByName('MATRICULA').AsString := medico.nroMatricula;
  dmfacturador.qiafiliados.ParamByName('DESMEDICO').AsString :=medico.getApellidoNombre;


end;

{-------------------------------------------------------------------------
  Procedimiento: actualizar
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: Genera la consulta de actualización parametrizada
--------------------------------------------------------------------------}
procedure TMedicoDAO.actualizar(medico: TMedico);
begin
  with dmfacturador.qiafiliados do
  begin
    SQL.Text :=
      concat('UPDATE OSMAMEDICOS SET des_medico=:nombre WHERE nro_matricula=:numero AND cod_planos=:codigo');
    ParamByName('codigo').AsString := medico.codigoPlan;
    ParamByName('numero').AsString := medico.nroMatricula;
    ParamByName('nombre').AsString := medico.getApellidoNombre;
  end;

end;

{-------------------------------------------------------------------------
  Procedimiento: registrar
  Fecha: 23-02-2024
  Version: 0.0.1
  Descripción: Genera la consulta de busqueda por cod_plan y nro_matricula
--------------------------------------------------------------------------}

function TMedicoDAO.buscarPorCodigo(codigoPlan: string; nroMatricula: string)
  : TDataSet;
begin
  dmfacturador.AbrirConexion();
  dmfacturador.qafiliados.Close;
  dmfacturador.qafiliados.SQL.Text :=
    concat('select des_medico, nro_matricula,cod_planos from OSMAMEDICOS where cod_planos=:codigo AND nro_matricula=:numero');
  dmfacturador.qafiliados.ParamByName('codigo').AsString := codigoPlan;
  dmfacturador.qafiliados.ParamByName('numero').AsString := nroMatricula;
  dmfacturador.qafiliados.Open;
  Result := dmfacturador.qafiliados;
end;

end.

unit uAfiliadoDAO;

interface

uses udmFacturador, db,sysUtils, uAfiliado;

type
  TAfiliadoDAO = class
  private

  public
    function buscarPorCodigo(codigoPlan: string; nroAfiliado: string): TDataSet;
    procedure iniciarTransaccion;
    procedure commit;
    procedure rolback;
    procedure registrar(afiliado: TAfiliado);
    procedure actualizar(afiliado: TAfiliado);

  end;

implementation

procedure TAfiliadoDAO.iniciarTransaccion;
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

procedure TAfiliadoDAO.rolback;
begin
   dmfacturador.tranafiliados.Rollback;
end;


procedure TAfiliadoDAO.commit;
begin
  dmfacturador.qiafiliados.Open;
  dmfacturador.tranafiliados.commit;
end;

procedure TAfiliadoDAO.registrar(afiliado: TAfiliado);
begin

    dmfacturador.qiafiliados.SQL.text:=
      'INSERT INTO OSMAAFILIADO (COD_PLANOS, NRO_AFILIADO, DES_AFILIADO, NRO_DOCUMENTO, SEXO, PARENTESCO, FECHA_NAC)'+
      'VALUES (:codigo, :numero, :nombre, 0, ''M'', ''T'', ''1899-12-30'')';
    dmfacturador.qiafiliados.ParamByName('codigo').AsString := afiliado.codigoPlan;
    dmfacturador.qiafiliados.ParamByName('numero').AsString := afiliado.nroAfiliado;
    dmfacturador.qiafiliados.ParamByName('nombre').AsString := afiliado.getApellidoNombre;

end;

procedure TAfiliadoDAO.actualizar(afiliado: TAfiliado);
begin
  with dmfacturador.qiafiliados do
  begin
    SQL.Text :=
      concat('UPDATE OSMAAFILIADO SET DES_AFILIADO=:nombre WHERE nro_afiliado=:numero AND cod_planos=:codigo');
    ParamByName('codigo').AsString := afiliado.codigoPlan;
    ParamByName('numero').AsString := afiliado.nroAfiliado;
    ParamByName('nombre').AsString := afiliado.getApellidoNombre;
  end;

end;

function TAfiliadoDAO.buscarPorCodigo(codigoPlan: string; nroAfiliado: string)
  : TDataSet;
begin
  dmfacturador.AbrirConexion();
  dmfacturador.qafiliados.Close;
  dmfacturador.qafiliados.SQL.Text :=
    concat('select des_afiliado, nro_afiliado,cod_planos from osmaafiliado where cod_planos=:codigo AND nro_afiliado=:numero');
  dmfacturador.qafiliados.ParamByName('codigo').AsString := codigoPlan;
  dmfacturador.qafiliados.ParamByName('numero').AsString := nroAfiliado;
  dmfacturador.qafiliados.Open;
  Result := dmfacturador.qafiliados;
end;

end.

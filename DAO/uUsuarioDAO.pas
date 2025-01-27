unit uUsuarioDAO;

interface
  uses uBaseCfg,DB,sysUtils,IBX.IBQuery;

  type TUsuarioDAO = class
    private
      baseDatos:TBaseCfg;
      query:TibQuery;
    public

      function login(usuario:string;clave:string):TDataSet;
      function obtenerIdPerfil(usuario:string):TDataSet;
      constructor Create;
      destructor destroy;

  end;


implementation

  constructor TUsuarioDAO.Create;
  begin
      baseDatos:= TBaseCfg.getInstance;
  end;


  destructor TUsuarioDAO.destroy;
  begin
     baseDatos.free;

  end;


  function TUsuarioDAO.login(usuario:string;clave:string):TDataSet;
  begin
    query:= baseDatos.getQuery;
    query.Close;

    baseDatos.iniciarTransaccion;
    query.SQL.Clear;
    query.SQL.Add('select * from msmausuario where ide_usuario=:usuario and ide_claveusuario=:clave');
    query.ParamByName('usuario').AsString:=usuario;
    query.ParamByName('clave').AsString:=clave;
    query.Open;

    Result:= query;

  end;

  function TUsuarioDAO.obtenerIdPerfil(usuario:string):TDataSet;
  begin
    query:= baseDatos.getQuery;
    query.Close;
      query.SQL.Clear;
      query.SQL.Add('select MAX(ide_perfil) from msrlperusu where ide_usuario=:usuario');
      query.ParamByName('usuario').AsString:=usuario;
      query.Open;
    Result:= query;


  end;


end.

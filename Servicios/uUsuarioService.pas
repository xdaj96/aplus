unit uUsuarioService;

interface
   uses DB,uUsuarioDAO,uBaseCfg,sysUtils,uUsuario;
   type TUsuarioService = class
     private
       usuarioDAO:TUsuarioDAO;
       baseCfg:TBaseCfg;

     public
       function login(nom_usuario:string;clave:string):TUsuario;
       function obtenerIdPerfil(nom_usuario:string):string;
       constructor Create;
   end;
implementation


constructor TUsuarioService.Create;
begin
  baseCFG:= TBaseCFG.getInstance;
  usuarioDAO:= TUsuarioDAO.Create;
end;

function TUsuarioService.login(nom_usuario:string;clave:string):TUsuario;
var
  regUsuario:TDataSet;
  usuario:TUsuario;
begin
  try
    baseCFG.conectar();
    usuario:= nil;
    regUsuario:= usuarioDAO.login(nom_usuario,clave);

    if not regUsuario.isEmpty then
    begin
        usuario:= TUsuario.Create;
        usuario.id    := regUsuario.fieldByName('IDE_USUARIO').asString;
        usuario.nombre:= regUsuario.fieldByName('NOM_USUARIO').asString;
        usuario.rol   := regUsuario.fieldByName('ROL_USUARIO').asString;

    end;

    Result:= usuario;

  except
    on E:Exception do
    begin
        raise Exception.Create('Fallo el inicio de sesión. Vuelva a intentarlo');
    end;

  end;
end;

function TUsuarioService.obtenerIdPerfil(nom_usuario:string):string;
var
  regPerfil:TDataSet;
  idPerfil:string;
begin
  try
    baseCFG.conectar();
    idPerfil:= '';
    regPerfil:= usuarioDAO.obtenerIdPerfil(nom_usuario);

    if not regPerfil.isEmpty then
    begin
        idPerfil:= regPerfil.fields[0].asString;
    end;

    Result:= idPerfil;

  except
    on E:Exception do
    begin
        raise Exception.Create('Fallo la carga del perfil. Vuelva a iniciar sesion');
    end;

  end;
end;




end.

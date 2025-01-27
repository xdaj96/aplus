unit uUsuario;

interface
  type TUsuario = class
    private
      FNombre:string;
      FIDE_usuario:string;
      FRolUsuario:string;

    public
      property nombre:string read FNombre write FNombre;
      property id:string read FIDE_usuario write FIDE_usuario;
      property rol:string read FRolUsuario write FRolUsuario;
  end;
implementation

end.

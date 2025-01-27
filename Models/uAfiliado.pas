unit uAfiliado;

interface

uses sysUtils, classes,dialogs;

type
  TAfiliado = class
  private
    FCodigoPlan: string;
    FNroAfiliado: string;
    FNombre: string;
    FApellido: string;

  public
    property codigoPlan: string read FCodigoPlan write FCodigoPlan;
    property nroAfiliado: string read FNroAfiliado write FNroAfiliado;
    property nombre: string read FNombre write FNombre;
    property apellido: string read FApellido write FApellido;

    procedure setApellidoNombre(nombre: string);
    function getApellidoNombre:string;
  end;

implementation

procedure TAfiliado.setApellidoNombre(nombre: string);
var
  s1, s2: TStringList;
begin
  s1 := TStringList.Create;
  s1.Text := nombre;

  s2 := TStringList.Create;
  s2.CommaText := s1.Text;
   s2.Count;

   if s2.Count = 5 then
      begin
        FApellido := s2[0] + ' ' + s2[1] + ' ' + s2[2] + ' ' + s2[3];
        FNombre := s2[4];
      end;
      if s2.Count = 4 then
      begin
        FApellido := s2[0] + ' ' + s2[1] + ' ' + s2[2];
        FNombre := s2[3];
      end;
      if s2.Count = 3 then
      begin
        FApellido := s2[0] + ' ' + s2[1];
        FNombre := s2[2];
      end;


    if s2.Count = 2 then
    begin
      FApellido := s2[0];
      FNombre := s2[1];
    end;
    if s2.Count = 1 then
    begin
      FApellido := s2[0];

    end;

end;


function TAfiliado.getApellidoNombre:string;
begin
    Result:= FApellido+','+FNombre;
end;

end.

unit uCliente;

interface

type
  TCliente = class
  private
    FNombre: string;
    FDocumento: string;
    FDomicilio: string;
    FTelefono: string;
  public
    property Nombre: string read FNombre write FNombre;
    property Documento: string read FDocumento write FDocumento;
    property Domicilio: string read FDomicilio write FDomicilio;
    property Telefono: string read FTelefono write FTelefono;

    constructor Create(ANombre, ADocumento, ADomicilio, ATelefono: string);
  end;

implementation

{ TCliente }

constructor TCliente.Create(ANombre, ADocumento, ADomicilio, ATelefono: string);
begin
  FNombre := ANombre;
  FDocumento := ADocumento;
  FDomicilio := ADomicilio;
  FTelefono := ATelefono;
end;

end.

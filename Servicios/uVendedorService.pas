unit uVendedorService;

interface

uses uVendedorDAO, db, sysUtils, uVendedor;

type
  TVendedorService = class
  private
    vendedorDAO: TVendedorDAO;
  public
    constructor Create;
    destructor destroy;
    function buscarVendedor(codigo: string): TVendedor;

  end;

implementation

constructor TVendedorService.Create;
begin
  vendedorDAO := TVendedorDAO.Create;
end;

destructor  TVendedorService.destroy;
begin
    vendedorDAO.Free;
end;


function TVendedorService.buscarVendedor(codigo: string): TVendedor;
var
  vendedor: TVendedor;
  data:TDataSet;
begin
  try
    vendedor:= nil;
    data:= vendedorDAO.buscarPorCodigo(codigo);

    if not data.IsEmpty then
    begin
       vendedor:= TVendedor.Create;
       vendedor.codigo := codigo;
       vendedor.nombre := data.FieldByName('nom_vendedor').AsString;
    end;
    Result:= vendedor;

  except
    on E:Exception do
    begin
      raise Exception.Create('No se pudo buscar el vendedor. Vuelva a intentarlo');
    end;

  end;


end;

end.

unit uCalculadoraPrecio;

interface
   uses sysUtils;
type
  TCalculadoraPrecio = class
  private
    FRecargo: Double;
    FCodOS: string;
    FCodCos1: string;
    FCodCos2: string;
    FCodRubro:string;
    FTipoVenta:string;
    function llevaRecargoPorRubro(codRubro:string):boolean;
    function esVentaHospitalaria():boolean;
    procedure analizarTipoVenta;
  public
    constructor Create(recargo: Double);
    function CalcularPrecio(preciocrudo, porvarlabo, porvarrubro: Double;cRubro:string): Double;
    // Propiedades para acceder a los atributos
    property Recargo: Double read FRecargo write FRecargo;
    property CodOS: string read FCodOS write FCodOS;
    property CodCos1: string read FCodCos1 write FCodCos1;
    property CodCos2: string read FCodCos2 write FCodCos2;
    property CodRubro:string read FCodRubro write FcodRubro;
    property tipo_venta:string read FTipoVenta write FTipoVenta;
  end;

implementation

uses
  Math;

constructor TCalculadoraPrecio.Create(recargo: Double);
begin
  FRecargo := recargo;
  FCodOS := '';
  FCodCos1 := '';
  FCodCos2 := '';
end;

procedure TCalculadoraPrecio.analizarTipoVenta;
begin
  if (((FCodOS <> '') or (FCodCos1 <> '') or (FCodCos2 <> ''))) then
  begin
      FTipoVenta:='COSEGURO';
  end
  else
  begin
    FTipoVenta:= 'PARTICULAR';
  end;
end;



function TCalculadoraPrecio.llevaRecargoPorRubro(codRubro:string):boolean;
var
  tieneRecargo:boolean;
  rubrosConRecargo:TArray<string>;
  rubro:string;
begin
 tieneRecargo:= False;
 rubrosConRecargo:= ['H','J','M'];

 for rubro in rubrosConRecargo do
 begin

    if codRubro = rubro then
    begin
      tieneRecargo:= True;
      break;
    end;
 end;
 Result:= tieneRecargo;



end;

function TCalculadoraPrecio.esVentaHospitalaria():boolean;

begin
 Result:= False;

end;



// Ajuste de los recargos según la configuración de coseguro
function TCalculadoraPrecio.CalcularPrecio(preciocrudo, porvarlabo, porvarrubro: Double;cRubro:string): Double;
var

  RecargoFijoPorcentaje: Double;
  RecargoFijo: Double;
  PorcentajeVariableLaboratorio: Double;
  DescuentoRubro: Double;
  PrecioAjustado: Double;
  PrecioFinal: Double;
begin
  analizarTipoVenta;
  sleep(15);


  // Si tengo una obra social o coseguro se devuelve el precio de venta del producto
  if (FTipoVenta = 'COSEGURO') then
  begin
    PrecioFinal := preciocrudo;

  end
  else
  begin

  RecargoFijo := 0.0;

  // Calcular el porcentaje variable de laboratorio
  PorcentajeVariableLaboratorio := precioCrudo * (porvarlabo / 100);

  // Calcular el porcentaje por rubro
  DescuentoRubro := precioCrudo * (porvarrubro / 100);

  // Calcular el precio ajustado
  PrecioAjustado := precioCrudo + PorcentajeVariableLaboratorio + DescuentoRubro;

  // Verificar si el rubro es uno de los específicos para aplicar el recargo fijo
  if llevaRecargoPorRubro(codRubro) then
  begin
    // Calcular el recargo fijo
    RecargoFijo := PrecioAjustado * (FRecargo / 100);
  end;

  PrecioFinal := PrecioAjustado + RecargoFijo;

  if PrecioFinal < precioCrudo then
  begin
     RecargoFijo := PrecioAjustado * (FRecargo / 100);
     PrecioFinal:= PrecioAjustado + RecargoFijo;
  end;




  // Calcular el precio final

  end;
   setroundmode(rmNearest);
  Result:= simpleroundto(PrecioFinal,-2);




end;

end.

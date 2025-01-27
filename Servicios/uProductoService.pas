unit uProductoService;


interface
  uses DB,uProductoDAO,System.SysUtils,system.Math;
  type TProductoService = class
    private
     productoDAO: TProductoDAO;
    public
      constructor Create;
      procedure construirBusquedaProducto(busqueda:string);

  end;
implementation


constructor TProductoService.Create;
begin
  productoDAO:=TProductoDAO.Create;
end;


procedure TProductoService.construirBusquedaProducto(busqueda:string);
var
  barras:string;
  troquel:Integer;
  descripcionProd:string;
  valor:Extended;
  value:integer;
  espacios:string;
begin
  barras:= '';
  troquel:= 0;
  descripcionProd:= '';

   if TextToFloat(PChar(busqueda), Valor, fvExtended) then
   begin
      barras:= busqueda;
   end;

   if tryStrToInt(busqueda, value) then
   begin
      troquel:= value;
   end;

   if not TextToFloat(PChar(busqueda), Valor, fvExtended) then
   begin
      espacios := StringReplace(busqueda, ' ', '%', [rfReplaceAll]);
      busqueda := '%' + espacios + '%';
   end;

   productoDAO.construirListaPrecios(barras,troquel,descripcionProd);

end;

end.

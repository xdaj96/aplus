unit uDescComprobanteService;

interface
 uses db,sysutils,udmfacturador,uDescComprobante,uDesccomprobantedao,System.Generics.Collections;
Type
  TDescComprobanteService = class
    private
      daoDescuento:TDescComprobanteDAO;

    public
      procedure registrarDescuentoAplus(
        tipo_comprobante:string;
        nro_comprob:string;
        nro_sucursal:string;
        items:TDataSet;
        coeficienteTar:double
      );
      constructor Create;
      destructor Destroy;



  end;

implementation

procedure TDescComprobanteService.registrarDescuentoAplus(
        tipo_comprobante:string;
        nro_comprob:string;
        nro_sucursal:string;
        items:TDataSet;
        coeficienteTar:double
      );
var
  i:integer;
  unDescuento:TDescComprobante;
  arrDescComprobante:TList<TDescComprobante>;

begin
    i := 0;
    //items.Open;
    items.First;
    arrDescComprobante:=TList<TDescComprobante>.Create;

    while not items.Eof do
    begin
      i := i + 1;

      unDescuento.nro_sucursal:= nro_sucursal;
      unDescuento.tipo_comprobante:= tipo_comprobante;
      unDescuento.nro_comprobante:= nro_comprob;

      unDescuento.cod_planos:= 'ZBG';
      unDescuento.item:= i;
      unDescuento.por_descuento:= items.FieldByName('APLUS').AsFloat;

      unDescuento.imp_descuento:= ((items.FieldByName('APLUS').asfloat * coeficienteTar) * (items.FieldByName('PRECIO').AsFloat)) / 100;
      arrDescComprobante.Add(unDescuento);
      items.Next;
    end;

    daoDescuento.registrarListaDescuentos(arrDescComprobante);

end;





constructor TDescComprobanteService.Create;
begin
   daoDescuento:= TDescComprobanteDAO.Create;
end;




destructor TDescComprobanteService.Destroy;
begin
   daoDescuento.Free;
end;



end.

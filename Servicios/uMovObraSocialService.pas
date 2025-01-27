unit uMovObraSocialService;

interface
  uses Data.DB,uMovObraSocialDAO,System.SysUtils,uUtils;

  type TMovOSService = class
    private
      movOSDAO:TMovObraSocialDAO;
    public
      function getMovimientos(nro_sucursal:string;cod_cos:string;f_desde:TDateTime;f_hasta:TDateTime):TDataSet;
      constructor Create;
  end;
implementation

  constructor TMovOSService.Create;
  begin
    movOSDAO:= TMovObraSocialDAO.Create;
  end;

  function TMovOSService.getMovimientos(nro_sucursal:string;cod_cos:string;f_desde:TDateTime;f_hasta:TDateTime):TDataSet;
  var
    fecha_desde:string;
    fecha_hasta:string;
  begin
      if TUtils.esCampoVacio(nro_sucursal) then
      begin
         raise Exception.Create('El numero de sucursal no existe');
      end;

       if TUtils.esCampoVacio(cod_cos) then
      begin
         raise Exception.Create('El coseguro no existe');
      end;



      fecha_desde:= DateToStr(f_desde);
      fecha_hasta:= DateToStr( f_hasta);

      Result:= movOSDAO.consultarMovimientos(nro_sucursal,cod_cos,fecha_desde,fecha_hasta);
  end;
end.

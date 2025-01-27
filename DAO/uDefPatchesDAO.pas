unit uDefPatchesDAO;

interface
   uses udmfacturador,sysUtils;

   Type
     TDefPatchesDAO = class(TObject)
       private

       public
         function getUltPatchPorSucursal(nro_sucursal:string):string;
         function existePathEnSucursal(nro_sucursal:string):boolean;
         procedure actualizarPathSucursal(nro_path:integer;nro_sucursal:string);
         procedure registrarPathSucursal(nro_path:integer;nro_sucursal:string);
         procedure aplicarPathEnSucursal(nro_path:integer;nro_sucursal:string);

         procedure iniciarTransaccion();
     end;


implementation


procedure TDefPatchesDAO.iniciarTransaccion();
begin
  if dmfacturador.tpromo.InTransaction then
  begin
    dmfacturador.tpromo.Rollback;
  end;
end;


function TDefPatchesDAO.getUltPatchPorSucursal(nro_sucursal:string):string;
var
  nroPath:string;
begin
  iniciarTransaccion;
  dmfacturador.icomprobante.Transaction := dmfacturador.tpromo;
  dmfacturador.qpromo.Close;
  dmfacturador.qpromo.SQL.Clear;
  dmfacturador.qpromo.SQL.Add('select ultimopatchejecutado from defpatches where idpatch=:sucursal');
  dmfacturador.qpromo.ParamByName('sucursal').Asstring := nro_sucursal;
  dmfacturador.qpromo.Open;
  nroPath:= dmfacturador.qpromo.FieldByName('ultimopatchejecutado').Asstring;
  if nroPath = '' then
  begin
    nroPath:= '0';
  end;



  Result:=nroPath;

end;

function TDefPatchesDAO.existePathEnSucursal(nro_sucursal:string):boolean;
var
  existeRegistro:boolean;
begin
  iniciarTransaccion;
  existeRegistro:= False;
  dmfacturador.icomprobante.Transaction := dmfacturador.tpromo;
  dmfacturador.qpromo.Close;
  dmfacturador.qpromo.SQL.Clear;
  dmfacturador.qpromo.SQL.Add('select COUNT(*) as cantPath from defpatches where idpatch=:sucursal');
  dmfacturador.qpromo.ParamByName('sucursal').Asstring := nro_sucursal;
  dmfacturador.qpromo.Open;

  if dmfacturador.qpromo.FieldByName('cantPath').Asstring <>'0' then
  begin
     existeRegistro:= True;
  end;
  Result:= existeRegistro;
end;

procedure TDefPatchesDAO.aplicarPathEnSucursal(nro_path:integer;nro_sucursal:string);
begin

   if existePathEnSucursal(nro_sucursal) then
   begin
      actualizarPathSucursal(nro_path,nro_sucursal);
   end
   else
   begin
      registrarPathSucursal(nro_path,nro_sucursal);
   end;


end;

procedure TDefPatchesDAO.registrarPathSucursal(nro_path:integer;nro_sucursal:string);
begin
    iniciarTransaccion;
  dmfacturador.qpromo.Close;
  dmfacturador.qpromo.SQL.Clear;
  dmfacturador.qpromo.SQL.Add('insert into defpatches(idpath,ultimopatchejecutado) VALUES(:sucursal,:valor)');
  dmfacturador.qpromo.ParamByName('sucursal').Asstring := nro_sucursal;
  dmfacturador.qpromo.ParamByName('valor').Asstring := intToStr(nro_path);
  dmfacturador.qpromo.Open;
  dmfacturador.tpromo.Commit;
end;




procedure TDefPatchesDAO.actualizarPathSucursal(nro_path:integer;nro_sucursal:string);
begin

  iniciarTransaccion;
  dmfacturador.qpromo.Close;
  dmfacturador.qpromo.SQL.Clear;
  dmfacturador.qpromo.SQL.Add('update defpatches set ultimopatchejecutado=:valor where idpatch=:sucursal');
  dmfacturador.qpromo.ParamByName('sucursal').Asstring := nro_sucursal;
  dmfacturador.qpromo.ParamByName('valor').Asstring := intToStr(nro_path);
  dmfacturador.qpromo.Open;
  dmfacturador.tpromo.Commit;
end;



end.

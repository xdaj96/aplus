unit UCalcularDescuento;


interface

  uses udmFacturador, registry, System.SysUtils, udticket, MATH;


Type

TItemDescuento=class(TObject)
    cod_alfabeta:String;
    porc_coseguro:double;
    mar_cos1,mar_cos2:string;
    porc_coseguro2:double;
   Porc_os:double;
   public
   Ticket:TTicket;
   function getDescuentotal(): double;
   procedure SetTicket(unTicket:TTicket);
  end;



function calcularDescuento(sucursal,codalfabeta,PlanOS,PlanCO1,PlanCO2,eosafiliado,eco1afiliado,eco2afiliado,rubro:String;porcentajeOS:double=0):TItemDescuento;



implementation
function calcularDescuento(sucursal, codalfabeta,PlanOS,PlanCO1,PlanCO2,eosafiliado,eco1afiliado,eco2afiliado,rubro:String;porcentajeOS:double=0):TItemDescuento;
var
reg: tregistry;
prueba: string;
unDescuento: TitemDescuento;
unPrecio,unPrecioDescOS,precioResto:double;
Begin
undescuento:=titemdescuento.Create;
  if planos<>'' then
   begin
     dmfacturador.qosmaplanesos.Close;
     dmfacturador.qosmaplanesos.SQL.Clear;
     dmfacturador.qosmaplanesos.SQL.Text:=concat('Select * From prod_descuentosos (:planos,:alfabeta,:sucursal,0,0,0,0)');
     dmfacturador.qosmaplanesos.ParamByName('PLANos').AsString:=PLANOS;
     dmfacturador.qosmaplanesos.ParamByName('alfabeta').AsString:=codalfabeta;
     dmfacturador.qosmaplanesos.ParamByName('sucursal').AsString:=sucursal;
     dmfacturador.qosmaplanesos.Open;
     if dmfacturador.qosmaplanesos.RecordCount=0 then
     begin
       undescuento.Porc_os:=0;
     end;
     if dmfacturador.qosmaplanesos.RecordCount=1 then
       begin

        undescuento.Porc_os:=round(strtofloat(dmfacturador.qosmaplanesos.Fields[0].asstring));
       end;
     end;





     if planCO1<>'' then
      begin
     dmfacturador.qosmaplanesos.Close;
     dmfacturador.qosmaplanesos.SQL.Clear;
     dmfacturador.qosmaplanesos.SQL.Text:=concat('Select * From prod_descuentosos (:planos,:alfabeta,:sucursal,0,0,0,0)');
     dmfacturador.qosmaplanesos.ParamByName('PLANos').AsString:=PLANco1;
     dmfacturador.qosmaplanesos.ParamByName('alfabeta').AsString:=codalfabeta;
     dmfacturador.qosmaplanesos.ParamByName('sucursal').AsString:=sucursal;
     dmfacturador.qosmaplanesos.Open;
     if dmfacturador.qosmaplanesos.RecordCount=0 then
     begin
       undescuento.porc_coseguro:=0;
     end;
     if dmfacturador.qosmaplanesos.RecordCount=1 then
       begin
         unDescuento.mar_cos1:= dmfacturador.qosmaplanesos.Fields[4].asstring;
       if unDescuento.mar_cos1 ='R' then
       begin

       if porcentajeOS > 0 then
       begin
        undescuento.Porc_os:= porcentajeOS;
       end;


             undescuento.porc_coseguro:= (100 - unDescuento.Porc_os)*(round(strtofloat(dmfacturador.qosmaplanesos.Fields[0].asstring))/100);

       end
       else
       begin
                undescuento.porc_coseguro:=round(strtofloat(dmfacturador.qosmaplanesos.Fields[0].asstring));
       end;



       end;
     end;
     if planCO2<>'' then
      begin
     dmfacturador.qosmaplanesos.Close;
     dmfacturador.qosmaplanesos.SQL.Clear;
     dmfacturador.qosmaplanesos.SQL.Text:=concat('Select * From prod_descuentosos (:planos,:alfabeta,:sucursal,0,0,0,0)');
     dmfacturador.qosmaplanesos.ParamByName('PLANos').AsString:=PLANco2;
     dmfacturador.qosmaplanesos.ParamByName('alfabeta').AsString:=codalfabeta;
     dmfacturador.qosmaplanesos.ParamByName('sucursal').AsString:=sucursal;
     dmfacturador.qosmaplanesos.Open;
     if dmfacturador.qosmaplanesos.RecordCount=0 then
     begin
       undescuento.porc_coseguro2:=0;
     end;
     if dmfacturador.qosmaplanesos.RecordCount=1 then
       begin

        undescuento.porc_coseguro2:=round(strtofloat(dmfacturador.qosmaplanesos.Fields[0].asstring));
       end;
     end;



     calculardescuento:=undescuento;
    end;
function titemdescuento.getDescuentotal():double;
Var
  descuento:double;
begin
   descuento:=0;
   descuento:=porc_os+porc_coseguro+porc_coseguro2;
   if descuento>100 then
   begin
   descuento:=100;
   end;
   getdescuentotal:=descuento;




end;

 procedure TItemDescuento.SetTicket(unTicket: TTicket);
begin
ticket:=unTicket;
end;

End.

unit ULimitesCobertura;

interface
uses



udmFacturador, registry, System.SysUtils, udticket,system.Generics.collections;



Type

TItemLimites = Class (TObject)
     cod_tamanio:String;
     CAN_MAXUNIDXREC: Integer;
     CAN_MAXUNIDXREN: Integer;
     CAN_MAXUNIDXTICKET: Integer;
     CAN_MAXRENXTICKET: Integer;
     COD_TAMANO : Integer;
     DES_TAMANO: String;

End;


     TComprobadorLimites = Class (TObject)
     cod_plan:String;
     tipo_tratamiento:String;
     reglas:TDictionary <Integer, TItemLimites>;
     Public
     function CargarLimites(cod_plan,cod_tratamiento:String):Boolean;
     function comprobarProducto(ticket: TTicket;cod_tamanio, cantidad:integer):integer;

   Constructor Create; overload;

     End;


implementation

{ TComprobadorLimites }

function TComprobadorLimites.CargarLimites(cod_plan,
  cod_tratamiento: String): Boolean;
var
reg: tregistry;
prueba: string;


begin
//Ejecutar el query para conocer los renglones del plan y cargar por cada renglon
//de tipo de tamanio un objeto en reglas del tipo TItemLimites

//while del query
// para cada uno
//crear TItemLimites y agregar a reglas
//    reglas.Add(tratamiento, itemRegla);


{     dmfacturador.qlimites.Close;
     dmfacturador.qlimites.SQL.Clear;
     dmfacturador.qlimites.SQL.Text:=concat('select ',
                                                 ' CAN_MAXUNIDXREC,  ',
                                                 ' CAN_MAXUNIDXREN,   ',
                                                 ' CAN_MAXUNIDXTICKET, ',
                                                 ' CAN_MAXRENXTICKET,   ',
                                                 ' O.COD_TAMANO,     ',
                                                 ' DES_TAMANO      ',
                                                 ' from osmalimites O, PRMATAMANO P  ',
                                                 ' where O.COD_TAMANO=P.COD_TAMANO   ',
                                                 ' AND cod_planos=:plan and tip_tratamiento=:tratamiento');



     dmfacturador.qlimites.ParamByName('PLAN').AsString:=cod_plan;
     dmfacturador.qlimites.ParamByName('tratamiento').AsString:=cod_tratamiento;
     dmfacturador.qlimites.Open;
     dmfacturador.qlimites.RecordCount
//     while dmfacturador.qlimites.RecordCount do
//     begin
//    reglas.Add(dmfacturador.qlimites.FieldByName('CAN_MAXUNIDXREC').Asinteger,TItemLimites.CAN_MAXUNIDXREC);









//     end;







//end;

//Retorna 0 si es correcto, sino el codigo de error
//1 Cantidad Excente
//2 Renglones Excente
//3 Cantidad por renglon excente

}end;
function TComprobadorLimites.comprobarProducto(ticket: TTicket; cod_tamanio,
  cantidad: integer): integer;
begin

end;

constructor TComprobadorLimites.Create;
begin

  reglas:=TDictionary<Integer,TItemLimites>.create();

end;

end.

unit UAnalizaOfertas;

interface
      uses Classes, system.Generics.collections,UDTicket, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML, registry,
            System.SysUtils, System.Variants, System.DateUtils,dialogs
;

procedure analizarDescuentosTicket  (unTicket:TTicket);
procedure analizarAlfaBeta (unRenglon:TTicketItem; unTicket:TTicket);
procedure aplicarDescuentoRepeticionLabo(unTicket:TTicket;descuentoTotal:double;totalUnidades:integer;totalValorLaboratorio:double);
procedure evaluarOfertaProductosMismoLaboratorio(unTicket: TTicket;repeticion:integer);
VAR
  IMPORTE,lab_ofertaRepeticion: STRING;
  descLabo,importeFijo:double;
  uniOfertaLabRepeticion:Integer;
  alfabetaLabRepeticion:TList<string>;

implementation

procedure consolidarTicket(itemsConsolidado:TDictionary<string, TTicketItem>;unTicket:TTicket);
var
  i: Integer;
  itemTicket: TTicketItem;
  itemConsolidado: TTicketItem;

begin
  for i := 0 to unTicket.items.Count - 1 do
  begin
    itemTicket := unTicket.items[i];
    //unItem es el elemento del ticket original
    itemsConsolidado.TryGetValue(itemTicket.cod_alfabeta, itemConsolidado);
    if (itemConsolidado <> nil) then
    begin
      //Como lo encuentro le sumo la cantidad al existente nada mas
      itemConsolidado.cantidad := itemConsolidado.cantidad + itemTicket.cantidad;
    end
    else
    begin
      //No lo encontre, tengo que crear un nuevo item
      itemConsolidado := TTicketItem.Create;
      itemConsolidado.nro_item := itemTicket.nro_item;
      itemConsolidado.cod_barras := itemTicket.cod_barras;
      itemConsolidado.cod_troquel := itemTicket.cod_troquel;
      itemConsolidado.cod_alfabeta := itemTicket.cod_alfabeta;
      itemConsolidado.importe_unitario := itemTicket.importe_unitario;
      itemConsolidado.cantidad := itemTicket.cantidad;
      itemConsolidado.cod_laboratorio := itemTicket.cod_laboratorio;
      itemConsolidado.cod_rubro := itemTicket.cod_rubro;
      itemsConsolidado.Add(itemConsolidado.cod_alfabeta, itemConsolidado);
    end;
  end;
end;


 procedure analizarDescuentosTicket  (unTicket:TTicket);
 Var
    itemsConsolidado: TDictionary <STRING, TTicketItem>;
    itemConsolidado:TTicketItem;
    codigoAB:String;
 Begin
  alfabetaLabRepeticion:= TList<string>.Create;
  itemsConsolidado:=TDictionary<string, TTicketItem>.create;
  lab_ofertaRepeticion:= '';
  uniOfertaLabRepeticion:= 99999999;
  importeFijo:= 0; // Oferta sin importe fijo
  //En itemsConsolidado tengo los renglones del ticket con las cantidades sumadas
  // por codigo alfabeta (unificadas)
   consolidarTicket(itemsConsolidado, unTicket);

  //Iterar sobre los elementos consolidados para ver si aplica una oferta o no
  for codigoAB in  itemsConsolidado.Keys do
  begin
   itemConsolidado:=itemsConsolidado.items[codigoAB];
   IMPORTE:=FLOATTOSTR(itemConsolidado.importe_unitario);
    analizarAlfaBeta (itemConsolidado, unTicket);

  end;
    evaluarOfertaProductosMismoLaboratorio(unTicket,uniOfertaLabRepeticion);
 end;

//Carga en
procedure analizarAlfaBeta (unRenglon:TTicketItem ; unTicket:TTicket);
Var
  s:String;
  itemADescontar:TTicketItem;
  descuento: Double;
  i, j, x, y, z, v, dia, cantidad_afectada:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle, renglon :ixmlnode;
  Sucursal_id,  Monto_porcentaje, nombre: STRING;
  reg: tregistry;
  esquema :ixmlnode;
  descuent_con_repe:boolean;
  ahora, Fecha_hasta, Fecha_desde: tdate;
  alfabeta, repeticion, Condicion_venta,  Cod_planos, Cod_alfabeta, Cod_laboratorio, Cod_rubro, dia_semana, importe_fijo, porcentajedet :String;
  flag: double;
Begin

      descuent_con_repe:=false;
      descuento:=0;

      doc := TXMLDocument.Create(nil);

      doc.LoadFromFile(unticket.ofertas+'ofertas.xml');

      doc.DocumentElement.ChildNodes.Count;
      for x :=0 to  doc.DocumentElement.ChildNodes.Count -1 do
      begin
      esquema:=doc.DocumentElement.ChildNodes[x];
      if esquema.ChildNodes.Count>3 then
      begin
          Sucursal_id:=esquema.ChildNodes['Sucursal_id'].text;
          nombre:=esquema.ChildNodes['Nombre'].text;
          Fecha_desde:=strtodate(esquema.ChildNodes['Fecha_desde'].Text);
          Fecha_hasta:=strtodate(esquema.ChildNodes['Fecha_hasta'].text);
          Monto_porcentaje:=esquema.ChildNodes['Monto_porcentaje'].text;
          ahora:=strtodate( FormatDateTime('dd/mm/yyyy', Now()));
          dia_semana:= esquema.ChildNodes['Dias_Semana'].Text;
          dia:=dayoftheweek(now);
          if sucursal_id=unticket.sucursal then
          begin

          if (dia_semana[dia])='S' then
          BEGIN
            if fecha_desde<ahora then
            begin
              if fecha_hasta>ahora then
              begin
              detalle:=esquema.ChildNodes['Detalle'];

                  renglon:=detalle.ChildNodes['Renglon'];
                  for v := 0 to detalle.ChildNodes.Count-1 do
                  begin
                  Cod_rubro:= detalle.ChildNodes[v].ChildNodes['Cod_rubro'].Text;
                  Cod_laboratorio:= renglon.ChildNodes['Cod_laboratorio'].Text;
                  Cod_alfabeta:= detalle.ChildNodes[v].ChildNodes['Cod_alfabeta'].Text;
                  Cod_planos:= renglon.ChildNodes['Cod_planos'].Text;
                  sucursal_id:= renglon.ChildNodes['sucursal_id'].Text;
                  Condicion_venta:= renglon.ChildNodes['Condicion_venta'].Text;
                  repeticion:= renglon.ChildNodes['repeticion'].Text;
                  importe_fijo:= detalle.ChildNodes[v].ChildNodes['importe_fijo'].Text;
                  porcentajedet:= detalle.ChildNodes[v].ChildNodes['porcentaje_descuento'].Text;

                  {Descuento por cod_alfabeta y repeticion de producto}
                  if (Cod_alfabeta<>'') and (repeticion<>'') then
                  begin
                     if (Cod_alfabeta=unrenglon.cod_alfabeta) and((unRenglon.cantidad -1) >= strtoint(repeticion)) then
                     begin

                     cantidad_afectada:=unrenglon.cantidad div strtoint(repeticion);
                     descuento:=(unrenglon.importe_unitario*cantidad_afectada)*strtofloat(monto_porcentaje);
                     descuento:=descuento/(unrenglon.cantidad*unrenglon.importe_unitario);
                     descuento:=descuento*100;
                     descuent_con_repe:=true;


                     //DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;


                     end;
                  end;

                  {Descuento varias unidades por laboratorio y alfabeta}
                   if (cod_laboratorio<>'') and (repeticion <> '') and (cod_rubro='') and (cod_planos='')  then
                   begin
                      lab_ofertaRepeticion:= cod_laboratorio;
                      uniOfertaLabRepeticion:= strToInt(repeticion);
                      descLabo:= strToFloat(monto_porcentaje);

                      // Si el descuento es por laboratorio con repeticion pero de distintos alfabetas pertenecientes al mismo lab
                      if (Cod_alfabeta <> '') then
                      begin
                          alfabetaLabRepeticion.add(Cod_alfabeta);
                      end;
                      


                      // Si se le asigna un importe fijo a la unidad
                      if (importe_fijo <> '00.00') then
                      begin
                          importeFijo:= strToFloat(importe_fijo);

                      end;


                   end;

                  {Descuento por laboratorio y coseguro}
                  if (cod_laboratorio<>'') and (cod_planos<>'') then
                  begin
                     if (cod_laboratorio=unrenglon.cod_laboratorio) and (cod_planos=unticket.codigo_Co1)then
                     begin

                     DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;


                     end;
                  end;
                  {Descuento por cod_alfabeta  y coseguro}
                  if (cod_planos<>'') and (cod_alfabeta<>'') then
                  begin
                     if (cod_planos=unticket.codigo_Co1) and (cod_alfabeta=unrenglon.cod_alfabeta) then
                     begin

                     DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;


                     end;
                  end;
                  {Descuento por coseguro y rubro}
                  if (cod_planos<>'') and (cod_rubro<>'') then
                  begin
                     if (cod_planos=unticket.codigo_Co1) and (cod_rubro=unrenglon.cod_rubro) then
                     begin

                     DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;


                     end;
                  end;

                  {Descuento por rubro y laboratorio}
                  if (cod_laboratorio<>'') and (cod_rubro<>'') then
                  begin
                     if (cod_laboratorio=unrenglon.cod_laboratorio) and (cod_rubro=unrenglon.cod_rubro) then
                     begin

                     DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;


                     end;
                  end;

                  {DESCUENTO POR RUBRO SIN REPETICION}

                  if (Cod_rubro<>'') and (repeticion='') then
                  begin
                     if (Cod_rubro=unrenglon.cod_rubro) and  (cod_planos='') and (Cod_laboratorio='')  then
                     begin

                     DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;


                     end;
                  end;


                  { DESCUENTO POR LABORATORIO SIN REPETICION}
                  if (cod_laboratorio<>'') and (repeticion='') and (cod_rubro='') and (cod_planos='') then
                  begin
                     if (cod_laboratorio=unrenglon.cod_laboratorio) and  (cod_planos='')  then
                     begin

                     DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;


                     end;
                  end;
                  {Descuento por cod_alfabeta con importe fijo}
                  if (cod_laboratorio='') and (cod_rubro='') and (cod_planos='') and (repeticion='') then
                  begin
                     if (cod_alfabeta=unrenglon.cod_alfabeta) then
                     begin
                     if STRTOFLOAT(MONTO_PORCENTAJE)<>0 then
                     begin
                     DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;
                     end
                     else
                     begin
                     DESCUENTO:=100-(STRTOFLOAT(importe_fijo)*100)/STRTOFLOAT(IMPORTE);
                     end;

                     end;
                  end;
                  {Descuento por cod_alfabeta sin importe fijo}

                  if (cod_laboratorio='') and (cod_rubro='') and (cod_planos='') and (repeticion='') and (importe_fijo='0.00') then
                  begin
                     if (cod_alfabeta=unrenglon.cod_alfabeta) then
                     begin
                     if STRTOFLOAT(MONTO_PORCENTAJE)<>0 then
                     begin
                     DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;
                     ShowMessage(floatToStr(STRTOFLOAT(MONTO_PORCENTAJE)));
                     end
                     else
                     begin
                     DESCUENTO:=strtofloat(porcentajedet)*100;
                     end;

                     end;
                  end;



                  end;
              end;
            end;
          end;
      end;
      end;
      end;



  //Asignar el descuento
    for I := 0 to unTicket.items.Count-1 do
    Begin
        itemADescontar:=unTicket.items[i];
        if (itemAdescontar.cod_alfabeta=unRenglon.cod_alfabeta) then
         Begin
           itemADescontar.descuento:=descuento;

           {if  descuent_con_repe=true then
           begin
             break;
           end;     }

         End;
    End;


End;

//--------------- OFERTAS BASADAS EN REPETICIONES ---------------------------//

function existeAlfabeta(codAlfabeta:string;listaAlfabetas:TList<string>):boolean;
var
  existe:boolean;
  unAlfabeta:string;
begin
   existe:= false;
   for unAlfabeta in listaAlfabetas do
   begin
     if unAlfabeta = codAlfabeta then
     begin
       existe:=True;
       break;
     end;
   end;

   Result:= existe;

end;


procedure aplicarDescuentoRepeticionLabo(unTicket:TTicket;descuentoTotal:double;totalUnidades:integer;totalValorLaboratorio:double);
var
  itemADescontar:TTicketItem;
  i:Integer;
  totalLaboratorio,descuentoPorValor,valorTotal,descuentoPorUnidad,descuentoPre:double;
begin
    for I := 0 to unTicket.items.Count-1 do
    Begin
        itemADescontar:=unTicket.items[i];
        if ((itemAdescontar.cod_laboratorio=lab_ofertaRepeticion) and ((alfabetaLabRepeticion.Count = 0 ) or(existeAlfabeta(itemADescontar.cod_alfabeta,alfabetaLabRepeticion)))) then
         Begin

            if (importeFijo > 0) then
            begin
                descuentoTotal := (1 - (importeFijo / itemADescontar.importe_unitario)) * 100;
                sleep(10);
        // Calcula el descuento por unidad
        descuentoPorUnidad := itemADescontar.importe_unitario * (descuentoTotal / 100);

        // Calcula el descuento total para todas las unidades de este ítem
        valorTotal := descuentoPorUnidad * itemADescontar.cantidad;

        // Asigna el descuento total al ítem
        itemADescontar.descuento := (  (valorTotal/(itemADescontar.cantidad * itemADescontar.importe_unitario)))*100;
            end
            else
            begin
              valorTotal := itemAdescontar.importe_unitario * itemAdescontar.cantidad;
              itemAdescontar.descuento := ((descuentoTotal * 100) * valorTotal) / totalValorLaboratorio;
            end;




           {if  descuent_con_repe=true then
           begin
             break;
           end;     }

         End;
    End;


end;



procedure evaluarOfertaProductosMismoLaboratorio(unTicket: TTicket;repeticion:integer);
var
  productosPorLaboratorio: TDictionary<string, Integer>;
  item: TTicketItem;
  i, cantidadTotal: Integer;
  codLabo,unAlfabeta:string;
  totalValorLaboratorio:double;

begin
  // Inicializar el diccionario para almacenar el número total de productos por laboratorio
  productosPorLaboratorio := TDictionary<string, Integer>.Create;
   totalValorLaboratorio:=0;
 

  if lab_ofertaRepeticion = '' then
    exit;


  // Recorrer los elementos del ticket
  for i := 0 to unTicket.items.Count - 1 do
  begin
    item := unTicket.items[i];

    if ((lab_ofertaRepeticion = item.cod_laboratorio) and ((alfabetaLabRepeticion.Count = 0) or (existeAlfabeta(item.cod_alfabeta,alfabetaLabRepeticion))) ) then
    begin

      // Verificar si ya se ha registrado el laboratorio del producto actual
      if productosPorLaboratorio.ContainsKey(item.cod_laboratorio)  then
      begin
        // Obtener la cantidad total de productos para este laboratorio y sumar la cantidad del producto actual
        cantidadTotal := productosPorLaboratorio[item.cod_laboratorio];
        cantidadTotal := cantidadTotal + item.cantidad;
        productosPorLaboratorio[item.cod_laboratorio] := cantidadTotal;
        totalValorLaboratorio := totalValorLaboratorio + (item.importe_unitario * item.cantidad);


      end
      else
      begin
          // Agregar el laboratorio del producto actual al diccionario con la cantidad total inicializada en la cantidad del producto actual
        productosPorLaboratorio.Add(item.cod_laboratorio, item.cantidad);
      end;
    end;
  end;

    // Obtener el par (clave, valor) del diccionario
    // Clave: código de laboratorio
    // Valor: cantidad total de productos para este laboratorio
     if productosPorLaboratorio.ContainsKey(lab_ofertaRepeticion) then
     begin
      if ((productosPorLaboratorio.Items[lab_ofertaRepeticion]-1) >= repeticion) then
      begin
        // Entro en la oferta
        aplicarDescuentoRepeticionLabo(unTicket,descLabo, productosPorLaboratorio.Items[lab_ofertaRepeticion],totalValorLaboratorio);
        // Puedes realizar alguna acción adicional aquí si es necesario
      end;
     end;
  // Liberar la memoria utilizada por el diccionario
  productosPorLaboratorio.Free;
end;

//--------------- OFERTAS BASADAS EN REPETICIONES ---------------------------//


end.

unit uSorteoService;

interface
  uses uSorteo,Xml.xmldom, Xml.XMLIntf,System.Generics.Collections,
  Xml.XMLDoc, MSXML,System.SysUtils;
  type TSorteoService = class
      private
       XMLDoc: TXMLDocument;

      public
         entraPromo:boolean;
         categoria:string;
         cantTickets:Integer;
         constructor Create(xml:TXMLDocument);
         function obtenerSorteos(rutaXML:string):TList<TSorteo>;
         procedure analizarSorteo(unSorteo:TSorteo);
  end;
implementation

  constructor TSorteoService.Create(xml:TXMLDocument);
  begin
      XMLDoc:=xml;
      entraPromo:= False;
  end;

  procedure TSorteoService.analizarSorteo(unSorteo:TSorteo);
  var
    unRenglon:TRenglonSorteo;
    tipoSorteo:string;
  begin
     entraPromo:= False;
     for unRenglon in unSorteo.Detalle do
     begin
       tipoSorteo:=unRenglon.getTipoSorteo;

       if tipoSorteo = 'T' then // Promoción por cantidad de tickets
       begin

          if ((cantTickets mod strToInt(unRenglon.CantidadTickets) = 0))  then
          begin

            categoria:= unRenglon.CodCategoria;
            entraPromo:= true;
          end;



       end;


     end;
  end;



  function TSorteoService.obtenerSorteos(rutaXML:string):TList<TSorteo>;
  var

  XMLNode: IXMLNode;
  EsquemaNode,DetalleNode,RenglonNode: IXMLNode;
  ahora, Fecha_hasta, Fecha_desde: tdate;
  i,x:integer;
  cod_cate,tk_facturados:string;
  CategoriaTickets:TDictionary<string, string>;
  unSorteo:TSorteo;
  unRenglon:TRenglonSorteo;
  listaSorteos:TList<TSorteo>;
  begin
    // Crear el documento XML
    unSorteo:=TSorteo.Create;
    // Cargar el archivo XML
    listaSorteos:=TList<TSorteo>.Create;

    if not FileExists(rutaXML) then
    begin
        Result:= listaSorteos;
        exit;
    end;



    XMLDoc.LoadFromFile(rutaXML);

    CategoriaTickets:= TDictionary<string, string>.Create();

    unRenglon:= TRenglonSorteo.Create;
    unSorteo:= TSorteo.Create;
    // Obtener el nodo raíz <Esquemas_sorteo>
    XMLNode := XMLDoc.DocumentElement;
    XMLNode.ChildNodes.Count;
    for x :=0 to  XMLNode.ChildNodes.Count -1 do
    begin
    // Verificar que el nodo raíz sea el correcto
    esquemaNode:=XMLNode.ChildNodes[x];

      if esquemaNode.ChildNodes.Count>3 then
      begin
        Fecha_desde:=strtodate(EsquemaNode.ChildNodes['Fecha_desde'].Text);
        Fecha_hasta:=strtodate(EsquemaNode.ChildNodes['Fecha_hasta'].text);
        ahora:=strtodate( FormatDateTime('dd/mm/yyyy', Now()));

        if ((fecha_desde<ahora) and (fecha_hasta>ahora)) then
        begin

            unSorteo.FechaDesde:= fecha_desde;
            unSorteo.FechaHasta:= fecha_hasta;
            unSorteo.Nombre:= EsquemaNode.ChildNodes['Nombre'].text;
            unSorteo.SorteoEsquemaId:= EsquemaNode.ChildNodes['sorteo_esquema_id'].text;
            unSorteo.Cupon:= EsquemaNode.ChildNodes['cupon'].text;
            unSorteo.TotalVenta:= EsquemaNode.ChildNodes['total_venta'].text;
            unSorteo.SucursalId:= EsquemaNode.ChildNodes['sucursal_id'].text;

             // Acceder al nodo <Detalle> dentro de <Esquema>
             DetalleNode := EsquemaNode.ChildNodes['Detalle'];

            // Verificar que el nodo <Detalle> exista
            if Assigned(DetalleNode) then
            begin
              // Iterar sobre los nodos <Renglon> dentro de <Detalle>
              for i := 0 to DetalleNode.ChildNodes.Count - 1 do
              begin
                RenglonNode := DetalleNode.ChildNodes[i];

                // Verificar que el nodo sea un <Renglon>
                if Assigned(RenglonNode) and (RenglonNode.NodeName = 'Renglon') then
                begin

                  unRenglon.CodRubro:=        RenglonNode.ChildNodes['Cod_rubro'].text;
                  unRenglon.CodLaboratorio:=  RenglonNode.ChildNodes['Cod_laboratorio'].text;
                  unRenglon.SucursalId:=      RenglonNode.ChildNodes['sucursal_id'].text;
                  unRenglon.Repeticion:=      RenglonNode.ChildNodes['repeticion'].text;
                  unRenglon.CodCategoria:=    RenglonNode.ChildNodes['cod_categoria'].text;
                  unRenglon.CodAlfabeta:=     RenglonNode.ChildNodes['cod_alfabeta'].text;
                  unRenglon.CantidadTickets:= RenglonNode.ChildNodes['cantidad_tickets'].text;
                  unRenglon.CantidadPremios:= RenglonNode.ChildNodes['cantidad_premios'].text;
                  unRenglon.DesCategoria:=    RenglonNode.ChildNodes['des_categoria'].text;

                  unSorteo.Detalle.Add(unRenglon);


                end;
              end;
            end;
            listaSorteos.Add(unSorteo);


        end;

      end;


    end;
    Result:= listaSorteos;
  end;

end.

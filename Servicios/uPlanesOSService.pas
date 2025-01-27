unit uPlanesOSService;

interface
  uses sysUtils,uPlanesOSDAO,db,uplanos,uwebappservice,Xml.xmldom, Xml.XMLIntf,
  msxmldom, xml.xmldoc;
  Type
    TPlanesOSService = class
      private
       planesOSDAO:TPlanesOSDAO;
       webAppService:TWebAppService;
      public
        constructor Create;
        destructor Destroy;
        function obtenerNombrePlan(cod_planos:string):string;
        function obtenerPlanPorCodigo(cod_planos:string):TPlanos;
        function buscarPlan(busqueda:string):TDataSet;
        procedure obtenerDescuentosCosPorWebApp(urlWebApp:string;data:TDataSet;coseguros:string;sucursales:string;fdesde:TDate;fhasta:TDate);
    end;
implementation

 constructor TPlanesOSService.Create;
 begin
    planesOSDAO:= TPlanesOSDAO.Create;
    webAppService:= TWebAppService.Create;
 end;

 destructor TPlanesOSService.Destroy;
 begin
    planesOSDAO.Free;
    webAppService.free;
 end;


 function TPlanesOSService.obtenerNombrePlan(cod_planos:string):string;
 var
  data:TDataSet;
 begin
   data:= planesOSDAO.obtenerPlanPorCodigo(cod_planos);

   Result:= data.fieldByName('nom_planos').Asstring;

 end;

 function TPlanesOSService.obtenerPlanPorCodigo(cod_planos:string):TPlanos;
 var
  data:TDataSet;
  planos:TPlanOS;
 begin
   data:= planesOSDAO.obtenerPlanPorCodigo(cod_planos);

   planOS:= TPlanOS.create;
   planOS.cod_planos:= cod_planos;
   planOS.nombrePlan:= data.fieldByName('nom_planos').AsString;
   Result:= planos;

 end;

 function TPlanesOSService.buscarPlan(busqueda:string):TDataSet;
 begin
   Result:= planesOSDAO.buscarPlanPorNombre(busqueda);
 end;

 procedure TPlanesOSService.obtenerDescuentosCosPorWebApp(urlWebApp:string;data:TDataSet;coseguros:string;sucursales:string;fdesde:TDate;fhasta:TDate);
 var
  doc:IXMLDocument;
  url:string;
  i:Integer;
  resultadoNode,detalleNode,Renglon:IXMLNODE;
 begin
    url:= urlwebapp + 'get_totalesplanos.php?sucursales='+sucursales+'&coseguros='+coseguros+'&f_desde='+FormatDateTime('yyyy-mm-dd',fdesde)+'&f_hasta='+FormatDateTime('yyyy-mm-dd',fhasta);

    doc:=LoadXMLDATA(webAppService.get(url));

    data.Append;
    resultadoNode:= doc.childnodes['Resultado_coseguros'];
    detalleNode:= resultadoNode.childnodes['Detalle'];
    detalleNode.ChildNodes.Count;

    for i := 0 to detalleNode.childNodes.count -1 do
    begin
      renglon:= detalleNode.childNodes[i];
      data.append;
      data.fieldByName('cod_planos').AsString:= renglon.ChildNodes['cod_planos'].text;
      data.fieldByName('nro_sucursal').AsString:= renglon.ChildNodes['nro_sucursal'].text;
      data.fieldByName('nom_sucursal').AsString:= renglon.ChildNodes['nom_sucursal'].text;
      data.fieldByName('imp_descuento').AsString:= renglon.ChildNodes['imp_total_desc'].text;
      data.fieldByName('imp_ticket').AsString:= renglon.ChildNodes['imp_total_ticket'].text;
      data.Post;
    end;


 end;

end.

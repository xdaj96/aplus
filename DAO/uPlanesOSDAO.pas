unit uPlanesOSDAO;

interface
  uses sysUtils,udmfacturador,IBX.IBQUERY,db,uPlanos;
   Type
    TPlanesOSDAO = class
      private
       query:TIBQuery;

      public
       constructor Create;
       function obtenerPlanPorCodigo(cod_planos:string):TDataSet;
       function buscarPlanPorNombre(nombre_plan:string):TDataset;



    end;
implementation

constructor TPlanesOSDAO.Create;
begin
  query:= dmFacturador.qplanes;
end;

function TPlanesOSDAO.obtenerPlanPorCodigo(cod_planos:string):TDataSet;
begin
   query.Close;
   query.SQL.Clear;
   query.SQL.Text:= 'SELECT COD_PLANOS,NOM_PLANOS FROM OSMAPLANESOS WHERE COD_PLANOS=:cod_plan';
   query.ParamByName('cod_plan').AsString:= cod_planos;
   query.Open;


   Result:= query;
end;


function TPlanesOSDAO.buscarPlanPorNombre(nombre_plan:string):TDataset;
begin
   query.Close;
   query.SQL.Clear;
   query.SQL.Text:= 'SELECT COD_PLANOS,NOM_PLANOS FROM OSMAPLANESOS WHERE NOM_PLANOS LIKE :cod_plan';
   query.ParamByName('nombre').AsString:= '%'+nombre_plan+'%';
   query.Open;
   Result:= query;
end;



end.

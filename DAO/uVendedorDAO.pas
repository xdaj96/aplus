unit uVendedorDAO;

interface
  uses udmFacturador,db;

  type TVendedorDAO = class
    private

    public
      function buscarPorCodigo(codigo:string):TDataSet;
  end;

implementation


 function TVendedorDAO.buscarPorCodigo(codigo: string):TDataSet;
 begin
     dmfacturador.qvendedor.Close;
     dmfacturador.qvendedor.SQL.Clear;
     dmfacturador.qvendedor.SQL.Append('select nom_vendedor from vtmavendedor where cod_vendedor=:codigo_vendedor');
     dmfacturador.qvendedor.ParamByName('codigo_vendedor').AsString:=codigo;
     dmfacturador.qvendedor.Open;
     Result:= dmFacturador.qvendedor;
 end;



end.

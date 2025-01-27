unit uProductoDAO;

interface
uses udmFacturador,DB;

type TProductoDAO = class
  private

  public
    procedure construirListaPrecios(barras:string;troquel:integer;descripcion:string);
end;

implementation


{--------------------------------------------------------------------------}


{-------------------------------------------------------------------------
  Procedimiento: construirListaPrecios
  Fecha: 29-12-2023
  Autor: David Avalos Jeppewy
  Version: 0.0.1
  Descripción: Construye la consulta para recuperar el listado de productos con precio
--------------------------------------------------------------------------}

 procedure TProductoDAO.construirListaPrecios(barras:string;troquel:integer;descripcion:string);
 begin
     dmFacturador.qbusqueda.Close;
      dmFacturador.qbusqueda.SQL.Clear;
      dmFacturador.qbusqueda.SQL.Text := concat(' select first(100) ',
        '  DISTINCT a.cod_alfabeta, ', '  a.nro_troquel,   ',
        '  a.cod_barraspri,  ', '  a.nom_largo, ', '  a.cod_iva, ',
        '  s.can_stk, ', '  a.cod_tamano, ', '  a.cod_laboratorio, ',
        ' coalesce(CAST(   ', ' CASE  ',
        ' WHEN a.mar_impsug=''N'' and a.mar_precioventa=''S'' THEN  ',
        ' b.imp_venta  ',
        ' when a.mar_impsug=''N'' and a.mar_precioventa=''N'' THEN ',
        ' (b.imp_compra*(1+r.por_margen/100)) ',
        '  when a.mar_impsug=''S'' AND A.mar_precioventa=''S'' then ',
        ' (a.imp_sugerido) ',
        ' when A.mar_impsug=''S'' AND A.mar_precioventa=''N'' then ',
        '  ((a.imp_sugerido*r.por_margen/100) + a.imp_sugerido) ',
        '  END AS DECIMAL (10,2)),0) as PRECIO, ',
        ' c.POR_VAR_PRECIO as varlabo,  ', ' r.por_var_precio as VARRUBRO,  ',
        ' r.cod_rubro,  ', ' d.des_droga,  ', ' f.des_accfarm,  ',
        ' c.nom_laboratorio ', ' from  prmalaboratorio c, prmarubro r,   ',
        ' prmaproducto a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta ',
        ' LEFT JOIN prmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm  ',
        ' LEFT JOIN prmamonodroga d ON  D.cod_droga=a.cod_droga   ',
        ' left join   prmastock s on    a.cod_alfabeta=s.cod_alfabeta and s.nro_sucursal=b.nro_sucursal ',
        ' where (cod_barraspri= :Barras Or NRO_TROQUEL= :Troquel or (a.nom_largo like :nombre ) ) ',
        ' AND a.cod_rubro=r.cod_rubro ',
        ' and c.cod_laboratorio=a.cod_laboratorio ',
        ' and not(mar_baja=''S'' and s.can_stk=0) ',
        ' and b.nro_sucursal=:sucursal ', ' order by 4 asc');

        dmFacturador.qbusqueda.ParamByName('sucursal').AsString :=
        dmFacturador.getSucursal();
        DMFACTURADOR.qbusqueda.SQL.SaveToFile('SQL.TXT');
        dmFacturador.qbusqueda.ParamByName('barras').AsString := barras;
        dmFacturador.qbusqueda.ParamByName('troquel').Asinteger := troquel;
        dmFacturador.qbusqueda.ParamByName('nombre').AsString:= descripcion;
        dmFacturador.qbusqueda.Open;
 end;

end.

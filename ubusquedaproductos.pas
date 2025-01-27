unit ubusquedaproductos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udmfacturador, Vcl.Grids, Vcl.DBGrids,uCalculadoraPrecio,
  Vcl.StdCtrls, Vcl.Buttons, ustock,udticket, ucalculardescuento, uprogreso, udesdroga, math,
  Data.DB;

type
  Tfbusquedaproductos = class(TForm)
    gproducto: TDBGrid;
    bagregar: TBitBtn;
    bstockonline: TBitBtn;
    Bcancelar: TBitBtn;
    bdroga: TBitBtn;
    baccion: TBitBtn;
    btroquel: TBitBtn;
    dssecundario: TDataSource;
    procedure bagregarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bstockonlineClick(Sender: TObject);
    procedure gproductoDblClick(Sender: TObject);
    procedure gproductoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gproductoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bdrogaClick(Sender: TObject);
    procedure baccionClick(Sender: TObject);
    procedure btroquelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dssecundarioDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
      preciocrudo: double;
     preciocalculado: double;
      porvarlabo: double;
     porvarrubro: double;
     calcuPrecio:TCalculadoraPrecio;
     esRepintable:boolean;
  public
    Ticket:TTicket;
    procedure SetTicket(unTicket:TTicket);
    procedure buscardroga;
    procedure buscaraccion;
    procedure precio;

  end;

var
  fbusquedaproductos: Tfbusquedaproductos;
  droga: string;
  accion: string;

implementation



{$R *.dfm}
uses
facturador;

procedure Tfbusquedaproductos.baccionClick(Sender: TObject);
begin
gproducto.Columns.Items[5].Visible:=false;
gproducto.Columns.Items[4].Visible:=true;
gproducto.Columns.Items[1].Visible:=false;
end;

procedure Tfbusquedaproductos.bagregarClick(Sender: TObject);
var
descuento: double;
form: tfdescripciondroga;
begin
if not (gproducto.Columns.Items[4].Visible=false or gproducto.Columns.Items[5].Visible=false)  then
begin
      if dmfacturador.dprincipal.Active=false then
        begin

        dmfacturador.dprincipal.CreateDataSet;
        dmfacturador.dprincipal.Active:=true;
        end;
        dmfacturador.dprincipal.Append;
        dmfacturador.dprincipalNOM_LARGO.AsString:=GPRODUCTO.DataSource.DataSet.FieldByName('nom_largo').AsString;
        dmfacturador.dprincipalCANTIDAD.AsInteger:=0;
        dmfacturador.dprincipalPRECIO.AsCurrency:=GPRODUCTO.DataSource.DataSet.FieldByName('PRECIO').Ascurrency;//GPRODUCTO.Fields[6].AsCurrency;
        dmfacturador.dprincipalcod_alfabeta.AsString:=GPRODUCTO.DataSource.DataSet.FieldByName('COD_ALFABETA').AsString;//GPRODUCTO.Fields[0].AsString;
        dmfacturador.dprincipalcod_barraspri.AsString:=GPRODUCTO.DataSource.DataSet.FieldByName('COD_BARRASPRI').AsString;//GPRODUCTO.Fields[2].AsString;
        dmfacturador.dprincipalNRO_troquel.AsString:=GPRODUCTO.DataSource.DataSet.FieldByName('NRO_TROQUEL').AsString;//GPRODUCTO.Fields[1].AsString;
        dmfacturador.dprincipalcod_iva.AsString:=GPRODUCTO.DataSource.DataSet.FieldByName('COD_IVA').AsString;//GPRODUCTO.Fields[4].AsString;
        dmfacturador.dprincipalPrecio_Total.AsFloat:=dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat;
        dmfacturador.dprincipalDESCUENTOS.AsFloat:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((GPRODUCTO.DataSource.DataSet.FieldByName('DESCUENTO').AsFLOAT)/100);//GPRODUCTO.Fields[7].AsFLOAT)/100);
        descuento:=0;

        descuento:=GPRODUCTO.DataSource.DataSet.FieldByName('DESCUENTOOS').AsFLOAT+GPRODUCTO.DataSource.DataSet.FieldByName('DESCUENTOCO1').AsFLOAT+GPRODUCTO.DataSource.DataSet.FieldByName('DESCUENTOCO2').AsFLOAT;//gproducto.Fields[10].AsFloat+gproducto.Fields[11].AsFloat+gproducto.Fields[12].AsFloat;
         if descuento>100 then
         begin
         descuento:=100;
         end;
        dmfacturador.dprincipalporcentaje.AsFloat:=descuento;


        dmfacturador.dprincipalprecio_totaldesc.AsFloat:=dmfacturador.DPRINCIPALprecio_total.AsFloat-dmfacturador.dprincipaldescuentos.AsFloat;
        dmfacturador.DPRINCIPALPORCENTAJEOS.AsFloat:=GPRODUCTO.DataSource.DataSet.FieldByName('DESCUENTOOS').AsFLOAT;
        dmfacturador.DPRINCIPALPORCENTAJEco1.AsFloat:=GPRODUCTO.DataSource.DataSet.FieldByName('DESCUENTOCO1').AsFLOAT;
        dmfacturador.DPRINCIPALPORCENTAJEco2.AsFloat:=GPRODUCTO.DataSource.DataSet.FieldByName('DESCUENTOCO2').AsFLOAT;
        dmfacturador.dprincipalDESCUENTOSOS.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((ffacturador.Gfacturador.Fields[11].AsFLOAT)/100);
        dmfacturador.dprincipalDESCUENTOco1.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((ffacturador.Gfacturador.Fields[12].AsFLOAT)/100);
        dmfacturador.dprincipalDESCUENTOco2.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((ffacturador.Gfacturador.Fields[13].AsFLOAT)/100);
        dmfacturador.DPRINCIPALCOD_LABORATORIO.AsString:=GPRODUCTO.DataSource.DataSet.FieldByName('COD_LABORATORIO').AsSTRING;
        dmfacturador.DPRINCIPALcan_stk.Asinteger:=GPRODUCTO.DataSource.DataSet.FieldByName('CAN_STK').AsINTEGER;
        dmfacturador.DPRINCIPALtamano.Asinteger:=GPRODUCTO.DataSource.DataSet.FieldByName('COD_TAMANO').AsINTEGER;
        dmfacturador.DPRINCIPALrubro.AsString:=dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString;
        dmfacturador.DPRINCIPALcan_vale.AsString:='0';
        dmFacturador.dprincipalhosp.AsString :=dmFacturador.dsecundariohosp.AsString;
        dmfacturador.DPRINCIPALPORCENTAJEAPLUS.AsFloat:=0;
        dmfacturador.dprincipal.Post;
        dmfacturador.dsecundario.Close;
        bcancelar.Click;
        end;
if (gproducto.Columns.Items[5].Visible=true)  then
begin

droga:=gproducto.DataSource.DataSet.FieldByName('des_droga').AsString;
            if dmfacturador.dsecundario.Active=true then
                begin
                dmfacturador.dsecundario.Active:=false;
                end;

form:=tfdescripciondroga.Create(self);
FORM.SetTicket(TICKET);
form.ShowModal;
buscardroga;
end;
if (gproducto.Columns.Items[4].Visible=true)  then
begin
accion:=gproducto.DataSource.DataSet.FieldByName('des_accion').AsString;
            if dmfacturador.dsecundario.Active=true then
                begin
                dmfacturador.dsecundario.Active:=false;
                end;
buscaraccion;
end;


end;






procedure Tfbusquedaproductos.bdrogaClick(Sender: TObject);
begin
gproducto.Columns.Items[4].Visible:=false;
gproducto.Columns.Items[5].Visible:=true;
gproducto.Columns.Items[1].Visible:=false;
end;

procedure Tfbusquedaproductos.BitBtn1Click(Sender: TObject);
begin
 fbusquedaproductos.CloseModal;
end;

procedure Tfbusquedaproductos.bstockonlineClick(Sender: TObject);

var
FORM: tfstock;

begin

 FORM:=tfstock.Create(SELF);
 form.SetTicket(ticket);
 ticket.alfabetastock:=GPRODUCTO.Fields[0].AsString;
 ticket.nombrestock:=GPRODUCTO.Fields[3].AsString;
 form.ShowModal;

end;
procedure Tfbusquedaproductos.btroquelClick(Sender: TObject);
begin
gproducto.Columns.Items[4].Visible:=false;
gproducto.Columns.Items[5].Visible:=false;
gproducto.Columns.Items[1].Visible:=true;
end;

procedure Tfbusquedaproductos.buscaraccion;
var
descuento: titemdescuento;
cobOS:double;
cobCos1:double;
cobcos2: double;
form: tfprogreso;
begin
    esRepintable:=false;
    form:=tfprogreso.Create(self);
    form.Show;
    application.ProcessMessages;
    btroquel.Click;
    dmfacturador.qbusqueda.Close;
    dmfacturador.qbusqueda.SQL.Text:=concat(' select first(100)',
                                            ' DISTINCT a.cod_alfabeta, ',
                                              ' a.nro_troquel, ',
                                              ' a.cod_barraspri, ',
                                              ' a.nom_largo, ',
                                               ' a.cod_iva, ',
                                               ' s.can_stk, ',
                                               ' a.cod_laboratorio, ',
                                               ' a.cod_tamano, ',
                                               ' coalesce(CAST( ',
                                               ' CASE  ',
                                               'WHEN a.mar_impsug=''N'' and a.mar_precioventa=''S'' THEN   ',
                                               ' b.imp_venta                                           ',
                                               ' when a.mar_impsug=''N'' and a.mar_precioventa=''N'' THEN  ',
                                               ' (b.imp_compra*(1+r.por_margen/100))                   ',
                                               '  when a.mar_impsug=''S'' AND A.mar_precioventa=''S'' then ',
                                               ' (a.imp_sugerido)                                      ',
                                               ' when A.mar_impsug=''S'' AND A.mar_precioventa=''N'' then  ',
                                               ' ((a.imp_sugerido*r.por_margen/100) + a.imp_sugerido) ',
                                               ' END AS DECIMAL (10,2)),0) as PRECIO, ',
                                               'c.POR_VAR_PRECIO as varlabo, ',
                                               'r.por_var_precio as VARRUBRO, ',
                                               'r.cod_rubro, ',
                                               'd.des_droga,  ',
                                               'f.des_accfarm, ',
                                               'c.nom_laboratorio ',
                                               'from  prmalaboratorio c, prmarubro r, prmastock s, ',
                                               ' prmaproducto a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta ',
                                               ' LEFT JOIN prmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm LEFT JOIN prmamonodroga d ON  D.cod_droga=a.cod_droga ',
                                               ' where (f.des_accfarm like :nombre )',
                                               ' AND a.cod_rubro=r.cod_rubro ',
                                               ' and c.cod_laboratorio=a.cod_laboratorio ',
                                               ' and a.cod_alfabeta=s.cod_alfabeta ',
                                               ' and s.nro_sucursal=b.nro_sucursal ',
                                               ' and not(mar_baja=''S'' and s.can_stk=0) ',
                                               ' and b.nro_sucursal=:sucursal ',
                                               ' order by 4 asc');




       dmfacturador.qbusqueda.ParamByName('nombre').AsString:=accion;

     dmfacturador.qbusqueda.ParamByName('sucursal').AsString:=dmFacturador.getSucursal();
     dmfacturador.qbusqueda.Open;
            if not  dmfacturador.qbusqueda.IsEmpty then
     Begin
       While not dmfacturador.qbusqueda.Eof do
       begin
         if dmfacturador.dsecundario.Active=false then
          begin
            dmfacturador.dsecundario.CreateDataSet;
            dmfacturador.dsecundario.Active:=true;
          end;
          dmfacturador.dsecundario.Append;
          dmfacturador.dsecundariocod_alfabeta.AsString:=dmfacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString;
          dmfacturador.dsecundarionro_troquel.Asstring:=dmfacturador.qbusqueda.FieldByName('nro_troquel').AsString;
          dmfacturador.dsecundariocod_barraspri.Asstring:=dmfacturador.qbusqueda.FieldByName('cod_barraspri').AsString;
          dmfacturador.dsecundarionom_largo.AsString:=dmfacturador.qbusqueda.FieldByName('nom_largo').AsString;
          dmfacturador.dsecundariocod_iva.AsString:=dmfacturador.qbusqueda.FieldByName('cod_iva').AsString;
          dmfacturador.dsecundariocan_stk.AsString:=dmfacturador.qbusqueda.FieldByName('can_stk').AsString;
            porvarlabo:=dmfacturador.qbusqueda.FieldByName('varlabo').AsFLOAT;
            porvarrubro:=dmfacturador.qbusqueda.FieldByName('varrubro').Asfloat;
            preciocrudo:=dmfacturador.qbusqueda.FieldByName('precio').Asfloat;
          precio;
          dmfacturador.dsecundarioprecio.AsString:=floattostr(preciocalculado);
//          dmfacturador.dsecundarioprecio.AsString:=dmfacturador.qbusqueda.FieldByName('precio').AsString;


          ///------------------------si los campos de os no estan vacios--------------------------///
           if ((ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') or (ticket.codigo_Cos2<>''))  then
                begin
                descuento:=CalcularDescuento(ticket.sucursal,(dmfacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString),ticket.codigo_OS,ticket.codigo_Co1,ticket.codigo_Cos2,ffacturador.eafiliado.Text,ffacturador.eco1afiliado.Text,ffacturador.eco2afiliado.text,(dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString));
                end;
                ///-------------------------calculo de descuento preliminar--------------------------------//
                if ((ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') or (ticket.codigo_Cos2<>''))  then
                begin
                dmfacturador.dsecundariodescuento.AsFloat:=(descuento.getDescuentotal);
                  if (descuento.getDescuentotal)>0 then
                    begin
                    dmfacturador.dsecundarioPRECIO_TOTAL.AsFloat:=dmfacturador.dsecundarioprecio.asfloat*((descuento.getDescuentotal)/100);
                    end;
                end;
               if dmfacturador.dsecundariodescuento.IsNull then
               begin
                 dmfacturador.dsecundarioDESCUENTO.AsFloat:=0;
               end;

                dmfacturador.dsecundarioPRECIO_TOTAL.AsFloat:=dmfacturador.dsecundarioprecio.asfloat;


                dmfacturador.dsecundarioRUBRO.AsString:=dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString;

                if ticket.codigo_OS<>'' then
                begin
                    dmfacturador.dsecundarioDESCUENTOOS.asfloat:=descuento.Porc_os;
                    cobOS:=descuento.Porc_OS;
                end;
                 if ticket.codigo_OS='' then
                begin
                    dmfacturador.dsecundarioDESCUENTOOS.asfloat:=0;
                end;


                 if ticket.codigo_Co1<>'' then
                 begin
                  cobCos1:=DESCUENTO.porc_coseguro;
                  if cobCos1+cobOS>100 then
                  BEGIN
                    cobcos1:=100-cobOs;
                    if cobcos1<0 then
                    begin
                      cobcos1:=0;
                    end;
                  END;
                 end;


          if  ticket.codigo_Co1<>'' then
          begin
              dmfacturador.dsecundarioDescuentoco1.Asfloat:=cobcos1;
          end;
           if  ticket.codigo_Co1='' then
          begin
              dmfacturador.dsecundarioDescuentoco1.Asfloat:=0;
          end;
          if ticket.codigo_Cos2<>'' then
          begin
          cobCos2:=DESCUENTO.porc_coseguro2;
          if cobos+cobCos1+cobcos2>100 then
          BEGIN
            cobcos2:=100-cobos-cobcos1;
            if cobcos2<0 then
            begin
              cobcos2:=0;
            end;
          END;
          end;
          if ticket.codigo_Cos2<>'' then
          begin
              dmfacturador.dsecundarioDESCUENTOCO2.Asfloat:=cobcos2;
          end;
          if ticket.codigo_Cos2='' then
          begin
              dmfacturador.dsecundarioDESCUENTOCO2.Asfloat:=0;
          end;
          dmfacturador.dsecundarioCod_laboratorio.AsString:=dmfacturador.qbusqueda.FieldByName('cod_laboratorio').AsString;
          dmfacturador.dsecundariocod_tamano.AsString:=dmfacturador.qbusqueda.FieldByName('cod_tamano').AsString;
          dmfacturador.dsecundariodes_accion.AsString:=dmfacturador.qbusqueda.FieldByName('DES_ACCFARM').AsString;
          dmfacturador.dsecundariodes_droga.AsString:=dmfacturador.qbusqueda.FieldByName('DES_DROGA').AsString;
          dmfacturador.dsecundarionom_laboratorio.AsString:=dmfacturador.qbusqueda.FieldByName('nom_laboratorio').AsString;
          dmfacturador.qbusqueda.Next;

        end;

        gproducto.DataSource.DataSet.First;


         End;
          form.Close;
          esRepintable:=true;
end;

procedure Tfbusquedaproductos.buscardroga;
var
espacios: string;
descuento: titemdescuento;
cobOS:double;
cobCos1:double;
cobcos2: double;
form: tfprogreso;
begin
    esRepintable:=false;

    btroquel.Click;
    form:=tfprogreso.Create(self);
    form.Show;
    application.ProcessMessages;

 //   dmfacturador.dsecundario.Open;
    dmfacturador.qbusqueda.SQL.Clear;
    dmfacturador.qbusqueda.Close;
    dmfacturador.qbusqueda.SQL.Text:=concat(' select first(100)',
                                                   ' DISTINCT a.cod_alfabeta, ',
                                                   ' a.nro_troquel, ',
                                                   ' a.cod_barraspri, ',
                                                   ' a.nom_largo, ',
                                                   ' a.cod_iva, ',
                                                   ' s.can_stk, ',
                                                   ' a.cod_laboratorio, ',
                                                   ' a.cod_tamano, ',
                                                   ' coalesce(CAST( ',
                                                   ' CASE  ',
                                                    'WHEN a.mar_impsug=''N'' and a.mar_precioventa=''S'' THEN   ',
                                                    ' b.imp_venta                                           ',
                                                    ' when a.mar_impsug=''N'' and a.mar_precioventa=''N'' THEN  ',
                                                    ' (b.imp_compra*(1+r.por_margen/100))                   ',
                                                    '  when a.mar_impsug=''S'' AND A.mar_precioventa=''S'' then ',
                                                    ' (a.imp_sugerido)                                      ',
                                                    ' when A.mar_impsug=''S'' AND A.mar_precioventa=''N'' then  ',
                                                     ' ((a.imp_sugerido*r.por_margen/100) + a.imp_sugerido) ',
                                                     ' END AS DECIMAL (10,2)),0) as PRECIO, ',
                                                     ' c.POR_VAR_PRECIO as varlabo, ',
                                                     ' r.por_var_precio as VARRUBRO, ',
                                                     ' r.cod_rubro, ',
                                                     ' d.des_droga,  ',
                                                     ' f.des_accfarm,  ',
                                                     ' c.nom_laboratorio ',
                                                     'from  prmalaboratorio c, prmarubro r, prmastock s, ',
                                                     'prmaproducto a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta LEFT JOIN prmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm LEFT JOIN prmamonodroga d ON  D.cod_droga=a.cod_droga ',
                                                     ' where (d.des_droga like :nombre )',
                                                     ' and a.nom_largo like :descripcion  ',
                                                     'AND a.cod_rubro=r.cod_rubro ',
                                                     'and c.cod_laboratorio=a.cod_laboratorio ',
                                                     'and a.cod_alfabeta=s.cod_alfabeta ',
                                                     'and s.nro_sucursal=b.nro_sucursal ',
                                                     ' and not(mar_baja=''S'' and s.can_stk=0) ',
                                                     'and b.nro_sucursal=:sucursal ',
                                                     ' order by 4 asc ');





     dmfacturador.qbusqueda.ParamByName('descripcion').AsString:='%'+ticket.desdroga+'%';
     dmfacturador.qbusqueda.ParamByName('nombre').AsString:='%'+ticket.desdroga+'%';
     dmfacturador.qbusqueda.ParamByName('sucursal').AsString:=dmFacturador.getSucursal();
     dmfacturador.qbusqueda.Open;
        if not  dmfacturador.qbusqueda.IsEmpty then
         Begin
           While not dmfacturador.qbusqueda.Eof do
           begin

            if dmfacturador.dsecundario.Active=false then
              begin
                dmfacturador.dsecundario.CreateDataSet;
                dmfacturador.dsecundario.Active:=true;
              end;
                dmfacturador.dsecundario.Append;
                dmfacturador.dsecundariocod_alfabeta.AsString:=dmfacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString;
                dmfacturador.dsecundarionro_troquel.Asstring:=dmfacturador.qbusqueda.FieldByName('nro_troquel').AsString;
                dmfacturador.dsecundariocod_barraspri.Asstring:=dmfacturador.qbusqueda.FieldByName('cod_barraspri').AsString;
                dmfacturador.dsecundarionom_largo.AsString:=dmfacturador.qbusqueda.FieldByName('nom_largo').AsString;
                dmfacturador.dsecundariocod_iva.AsString:=dmfacturador.qbusqueda.FieldByName('cod_iva').AsString;
                dmfacturador.dsecundariocan_stk.AsString:=dmfacturador.qbusqueda.FieldByName('can_stk').AsString;
                porvarlabo:=dmfacturador.qbusqueda.FieldByName('varlabo').AsFLOAT;
                porvarrubro:=dmfacturador.qbusqueda.FieldByName('varrubro').Asfloat;
                preciocrudo:=dmfacturador.qbusqueda.FieldByName('precio').Asfloat;
                 precio;
                dmfacturador.dsecundarioprecio.AsString:=floattostr(preciocalculado);

    //            dmfacturador.dsecundarioprecio.AsString:=dmfacturador.qbusqueda.FieldByName('precio').AsString;
                ///------------------------si los campos de os no estan vacios--------------------------///
                if ((ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') or (ticket.codigo_Cos2<>''))  then
                begin
                descuento:=CalcularDescuento(ticket.sucursal,(dmfacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString),ticket.codigo_OS,ticket.codigo_Co1,ticket.codigo_Cos2,ffacturador.eafiliado.Text,ffacturador.eco1afiliado.Text,ffacturador.eco2afiliado.text,(dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString));
                end;
                ///-------------------------calculo de descuento preliminar--------------------------------//
                if ((ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') or (ticket.codigo_Cos2<>''))  then
                begin
                dmfacturador.dsecundariodescuento.AsFloat:=(descuento.getDescuentotal);
                  if (descuento.getDescuentotal)>0 then
                    begin
                    dmfacturador.dsecundarioPRECIO_TOTAL.AsFloat:=dmfacturador.dsecundarioprecio.asfloat*((descuento.getDescuentotal)/100);
                    end;
                end;
               if dmfacturador.dsecundariodescuento.IsNull then
               begin
                 dmfacturador.dsecundarioDESCUENTO.AsFloat:=0;
               end;

                dmfacturador.dsecundarioPRECIO_TOTAL.AsFloat:=dmfacturador.dsecundarioprecio.asfloat;


                dmfacturador.dsecundarioRUBRO.AsString:=dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString;

                if ticket.codigo_OS<>'' then
                begin
                    dmfacturador.dsecundarioDESCUENTOOS.asfloat:=descuento.Porc_os;
                    cobOS:=descuento.Porc_OS;
                end;
                 if ticket.codigo_OS='' then
                begin
                    dmfacturador.dsecundarioDESCUENTOOS.asfloat:=0;
                end;


                 if ticket.codigo_Co1<>'' then
                 begin
                  cobCos1:=DESCUENTO.porc_coseguro;
                  if cobCos1+cobOS>100 then
                  BEGIN
                    cobcos1:=100-cobOs;
                    if cobcos1<0 then
                    begin
                      cobcos1:=0;
                    end;
                  END;
                 end;


          if  ticket.codigo_Co1<>'' then
          begin
              dmfacturador.dsecundarioDescuentoco1.Asfloat:=cobcos1;
          end;
           if  ticket.codigo_Co1='' then
          begin
              dmfacturador.dsecundarioDescuentoco1.Asfloat:=0;
          end;
          if ticket.codigo_Cos2<>'' then
          begin
          cobCos2:=DESCUENTO.porc_coseguro2;
          if cobos+cobCos1+cobcos2>100 then
          BEGIN
            cobcos2:=100-cobos-cobcos1;
            if cobcos2<0 then
            begin
              cobcos2:=0;
            end;
          END;
          end;
          if ticket.codigo_Cos2<>'' then
          begin
              dmfacturador.dsecundarioDESCUENTOCO2.Asfloat:=cobcos2;
          end;
          if ticket.codigo_Cos2='' then
          begin
              dmfacturador.dsecundarioDESCUENTOCO2.Asfloat:=0;
          end;
          dmfacturador.dsecundarioCod_laboratorio.AsString:=dmfacturador.qbusqueda.FieldByName('cod_laboratorio').AsString;
          dmfacturador.dsecundariocod_tamano.AsString:=dmfacturador.qbusqueda.FieldByName('cod_tamano').AsString;
          dmfacturador.dsecundariodes_accion.AsString:=dmfacturador.qbusqueda.FieldByName('DES_ACCFARM').AsString;
          dmfacturador.dsecundariodes_droga.AsString:=dmfacturador.qbusqueda.FieldByName('DES_DROGA').AsString;
          dmfacturador.dsecundarionom_laboratorio.AsString:=dmfacturador.qbusqueda.FieldByName('nom_laboratorio').AsString;
          dmfacturador.qbusqueda.Next;

        end;

        gproducto.DataSource.DataSet.First;


         End;
         form.Close;
          esRepintable:=true;
end;

procedure Tfbusquedaproductos.dssecundarioDataChange(Sender: TObject;
  Field: TField);
begin
  if esRepintable then
      gproducto.Repaint;
end;

procedure Tfbusquedaproductos.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
GPRODUCTO.Height:=NEWHEIGHT-65;
GPRODUCTO.Width:=NEWWIDTH-5;
BAGREGAR.TOP:=NEWHEIGHT-59;
BSTOCKONLINE.TOP:=NEWHEIGHT-59;
BCANCELAR.TOP:=NEWHEIGHT-59;
btroquel.Top:=NEWHEIGHT-59;
bdroga.Top:=NEWHEIGHT-59;
baccion.Top:=NEWHEIGHT-59;

end;

procedure Tfbusquedaproductos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f12 then
begin
  bstockonline.Click;
end;
if key=vk_f4 then
begin
  btroquel.Click;
end;
if key=vk_f5 then
begin
  bdroga.Click;
end;
if key=vk_f6 then
begin
  baccion.Click;
end;
end;

procedure Tfbusquedaproductos.FormShow(Sender: TObject);
begin
esRepintable:=true;

gproducto.DataSource.DataSet.First;
calcuPrecio:=TCalculadoraPrecio.Create(strtofloat(ticket.recargo));
end;

procedure Tfbusquedaproductos.gproductoDblClick(Sender: TObject);
begin
bagregar.Click;
end;

procedure Tfbusquedaproductos.gproductoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  const
   clPaleGreen = TColor($CCFFCC);
   clPaleRed =TColor($CCCCFF);
   clpaleskyblue=Tcolor(15750518);
   clpaleyellow=Tcolor($CCFFFF);
begin
if esRepintable then
begin
if GPRODUCTO.DataSource.DataSet.FieldByName('DESCUENTO').asfloat>0 then
begin
   gproducto.canvas.brush.color := clpalegreen;
   gproducto.DefaultDrawColumnCell(rect,DataCol,Column,State)
end;
if GPRODUCTO.DataSource.DataSet.FieldByName('CAN_STK').asfloat<0 then
begin
   gproducto.canvas.brush.color := clpalered;
   gproducto.DefaultDrawColumnCell(rect,DataCol,Column,State);
end;
if  (gdSelected in State)  then
    begin
    gproducto.Canvas.Brush.Color :=clskyblue;
    gproducto.Canvas.Font.Style:=[fsBold];
    gproducto.Canvas.Font.Color:=Clblack;
    gproducto.DefaultDrawColumnCell(Rect,Datacol,Column,State);
    end;
end;


end;

procedure Tfbusquedaproductos.gproductoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
  bagregar.Click;
end;

end;

procedure Tfbusquedaproductos.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;

procedure Tfbusquedaproductos.precio;
var
 porvarlabocalculo: double;
 porvarrubrocalculo: double;
 recargo: double;
begin
porvarlabocalculo:=0;
porvarrubrocalculo:=0;
{recargo:=1+(strtofloat(ticket.recargo))/100;
if ((ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') or (ticket.codigo_Cos2<>''))  then
begin
preciocalculado:=preciocrudo;
end;
if ((ticket.codigo_OS='') and (ticket.codigo_Co1='') and (ticket.codigo_Cos2=''))  then
begin
porvarlabocalculo:=1+porvarlabo/100;
porvarrubrocalculo:=1+porvarrubro/100;
preciocalculado:=simpleroundto(preciocrudo*porvarlabocalculo*porvarrubrocalculo*recargo,-2);
end; }

calcuPrecio.CodRubro:=dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString;
  calcuPrecio.CodOS:=ticket.codigo_OS;
  calcuPrecio.CodCos1:= ticket.codigo_Co1;
  calcuPrecio.CodCos2:= ticket.codigo_Cos2;

  preciocalculado:= calcuPrecio.CalcularPrecio(preciocrudo,porvarlabo,porvarrubro,dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString);




end;


end.

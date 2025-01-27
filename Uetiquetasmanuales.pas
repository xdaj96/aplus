unit Uetiquetasmanuales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, uprogreso, udmfacturador, printers, registry,
  Vcl.ComCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, ucalculadoraprecio,
  IdHTTP,udticket, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML, math, System.DateUtils;

type
  Tfetiquetasmanuales = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    getiquetas: TDBGrid;
    rimpresion: TRadioGroup;
    Bimprimir: TBitBtn;
    blimpiar: TBitBtn;
    petiquetas: TPageControl;
    Alta: TTabSheet;
    Baja: TTabSheet;
    Actualizaciones: TTabSheet;
    Panel1: TPanel;
    Busqueda: TLabel;
    Shape1: TShape;
    bbuscar: TBitBtn;
    ebusqueda: TEdit;
    idhttp: TIdHTTP;
    bbuscarbaja: TBitBtn;
    Label1: TLabel;
    ebusquedabaja: TEdit;
    Shape2: TShape;
    bajaetiquetas: TBitBtn;
    Label2: TLabel;
    Shape3: TShape;
    dtdesde: TDateTimePicker;
    dthasta: TDateTimePicker;
    bbuscaractu: TButton;
    Label3: TLabel;
    lregistros: TLabel;
    procedure bbuscarClick(Sender: TObject);
    procedure BimprimirClick(Sender: TObject);
    procedure ebusquedaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BcancelarClick(Sender: TObject);
    procedure blimpiarClick(Sender: TObject);
    procedure agregarurl;
    procedure agregarurlbaja;
    procedure petiquetasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure bbuscarbajaClick(Sender: TObject);
    procedure ebusquedabajaKeyPress(Sender: TObject; var Key: Char);
    procedure bajaetiquetasClick(Sender: TObject);
    Function GetImpresora(Impre:String):Integer;
    procedure bbuscaractuClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure analizaroferta(var monto:double);
  private
   Ticket:TTicket;
   calcuprecio:TCalculadoraPrecio;
  public
    procedure SetTicket(unTicket:TTicket);
    procedure precio;
  end;

var
  fetiquetasmanuales: Tfetiquetasmanuales;
  tsalfabeta:tstringlist;
  tsprecios: tstringlist;
   porvarlabo: double;
   porvarrubro: double;
   preciocrudo: double;
   preciocalculado: double;
   monto: double;

implementation

{$R *.dfm}

Function Tfetiquetasmanuales.GetImpresora(Impre:String):Integer;
Var
nCont:Integer;
lSearch:Boolean;
cNewLIne:String;
begin
lSearch:=False;
cNewLine:=Chr(10)+Chr(13);

  For nCont:=0 to Printer.Printers.Count - 1 do
  //buscamos la impresora en la lista del sistema
  begin

      if Pos(impre, Printer.Printers[nCont]) <> 0 then
      begin
      lSearch:=True;
      Result:=nCont;
      Break;
      end;

  end;

  if lSearch = False then
  begin
  ShowMessage('Impresora no encontrada.'+impre+cNewLine+'Se utilizará la predeterminda.');
  Result:=-1
  end;

end;

procedure Tfetiquetasmanuales.agregarurl;
var
s, url:String;

begin
s:='';
try


  url:=ticket.url+'alta_etiquetas.php?'+'sucursal_id='+ticket.sucursal+'&cod_alfabeta='+tsalfabeta.CommaText+'&precios='+tsprecios.CommaText;

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);



   except
      on E: Exception do
      begin
        {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
      end;


end;
end;


procedure Tfetiquetasmanuales.agregarurlbaja;
var
s, url:String;

begin
s:='';
try


  url:=ticket.url+'baja_etiquetas.php?'+'sucursal_id='+ticket.sucursal+'&cod_alfabeta='+tsalfabeta.CommaText;

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);



   except
      on E: Exception do
      begin
        {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
      end;
end;

blimpiar.Click;
end;


procedure Tfetiquetasmanuales.analizaroferta(var monto :double);
var
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
  alfabeta, repeticion, Condicion_venta,  Cod_planos, Cod_alfabeta, Cod_laboratorio, Cod_rubro, dia_semana, importe_fijo :String;
  flag,importefijo: double;
begin
    descuent_con_repe:=false;
      descuento:=0;

      doc := TXMLDocument.Create(nil);

      doc.LoadFromFile(ticket.ofertas+'ofertas.xml');

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
           if sucursal_id=ticket.sucursal then
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




                  if (cod_laboratorio<>'') and (cod_rubro<>'') then
                  begin
                     if (cod_laboratorio=Getiquetas.Fields[13].AsString) and (cod_rubro=Getiquetas.Fields[9].AsString) then
                     begin

                     DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;


                     end;
                  end;
                  if (cod_laboratorio<>'') then
                  begin
                     if (cod_laboratorio=Getiquetas.Fields[13].AsString) and  (cod_planos='')  then
                     begin

                     DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;


                     end;
                  end;
                  if (cod_laboratorio='') and (cod_rubro='') and (cod_planos='') and (repeticion='') then
                  begin
                     if (cod_alfabeta=Getiquetas.Fields[0].AsString) then
                     begin
                     if STRTOFLOAT(MONTO_PORCENTAJE)<>0 then
                     begin
                     DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;
                     end
                     else
                     begin
                   //  DESCUENTO:=100-(STRTOFLOAT(importe_fijo)*100)/STRTOFLOAT(IMPORTE);
                     monto:= strtofloat(importe_fijo);

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


end;

procedure Tfetiquetasmanuales.bajaetiquetasClick(Sender: TObject);
var
  o: integer;
  tamañogrilla:integer;
begin
o:=0;
if not getiquetas.DataSource.DataSet.IsEmpty then
  begin
  if petiquetas.ActivePageIndex=1 then
    begin
    getiquetas.DataSource.DataSet.First;
    tsalfabeta := TStringList.Create;
      while not getiquetas.DataSource.DataSet.Eof do
      begin

       tsalfabeta.Add(Getiquetas.Fields[0].AsString);
       o:=o+1;
       getiquetas.DataSource.DataSet.Next;
       tamañogrilla:=getiquetas.DataSource.DataSet.RecordCount;
       if o=50 then
       begin
         agregarurlbaja;
       end;
       if o=tamañogrilla then
       begin
       agregarurlbaja;
       end;
      end;


    end;





  end;
end;

procedure Tfetiquetasmanuales.bbuscaractuClick(Sender: TObject);
VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  alfabeta: STRING;
  reg: tregistry;
  detalleval:ixmlnode;
  form: tfprogreso;

begin
s:='';
form:=tfprogreso.Create(self);
form.Show;
application.ProcessMessages;
try
   url:=ticket.url+'get_etiquetas.php?'+'sucursal='+ticket.sucursal;

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);
  j:=0;
  Doc:=LoadXMLData(s);
  doc.DocumentElement.ChildNodes.Count;
  detalleval:=doc.DocumentElement.ChildNodes[0];
  detalleval.ChildNodes.Count;
  for I := 0 to doc.DocumentElement.ChildNodes.Count -1 do
        begin
        j:=j+1;
          alfabeta:=doc.DocumentElement.ChildNodes[i].ChildNodes['cod_alfabeta'].Text;
            dmFacturador.AbrirConexion();

              dmfacturador.qbusqueda.Close;
              dmfacturador.qbusqueda.SQL.Clear;
              dmfacturador.qbusqueda.SQL.Text:=concat(' select first(100) ',
                                                          '  DISTINCT a.cod_alfabeta, ',
                                                          '  a.nro_troquel,   ',
                                                          '  a.cod_barraspri,  ',
                                                          '  a.nom_largo, ',
                                                          '  a.cod_iva, ',
                                                          '  s.can_stk, ',
                                                          '  a.cod_tamano, ',
                                                          '  a.cod_laboratorio, ',
                                                          ' coalesce(CAST(   ',
                                                          ' CASE  ',
                                                          ' WHEN a.mar_impsug=''N'' and a.mar_precioventa=''S'' THEN  ',
                                                          ' b.imp_venta  ',
                                                          ' when a.mar_impsug=''N'' and a.mar_precioventa=''N'' THEN ',
                                                          ' (b.imp_compra*(1+r.por_margen/100)) ',
                                                          '  when a.mar_impsug=''S'' AND A.mar_precioventa=''S'' then ',
                                                          ' (a.imp_sugerido) ',
                                                          ' when A.mar_impsug=''S'' AND A.mar_precioventa=''N'' then ',
                                                          '  ((a.imp_sugerido*r.por_margen/100) + a.imp_sugerido) ',
                                                          '  END AS DECIMAL (10,2)),0) as PRECIO, ',
                                                          ' c.POR_VAR_PRECIO as varlabo,  ',
                                                          ' r.por_var_precio as VARRUBRO,  ',
                                                          ' r.cod_rubro,  ',
                                                          ' d.des_droga,  ',
                                                          ' f.des_accfarm,  ',
                                                          ' c.nom_laboratorio ',
                                                          ' from  prmalaboratorio c, prmarubro r,   ',
                                                          ' prmaproducto a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta ',
                                                          ' LEFT JOIN prmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm  ',
                                                          ' LEFT JOIN prmamonodroga d ON  D.cod_droga=a.cod_droga   ',
                                                          ' left join   prmastock s on    a.cod_alfabeta=s.cod_alfabeta and s.nro_sucursal=b.nro_sucursal ',
                                                          ' where (A.cod_ALFABETA= :CODIGO ) ',
                                                          ' AND a.cod_rubro=r.cod_rubro ',
                                                          ' and c.cod_laboratorio=a.cod_laboratorio ',
                                                          ' and not(mar_baja=''S'' and s.can_stk=0) ',
                                                          ' and b.nro_sucursal=:sucursal  ',
                                                           'and cast(b.FEC_ULACPRECIO as date) between :desde and :hasta ');




          DMFACTURADOR.qbusqueda.SQL.SaveToFile('SQL.TXT');
          dmfacturador.qbusqueda.ParamByName('sucursal').AsString:=dmFacturador.getSucursal();
          dmfacturador.qbusqueda.ParamByName('codigo').AsString:=alfabeta;
          dmfacturador.qbusqueda.ParamByName('desde').Asdate:=dtdesde.DateTime;
          dmfacturador.qbusqueda.ParamByName('hasta').Asdate:=dthasta.DateTime;
          dmfacturador.qbusqueda.Open;
          //------------------------insersion en grilla de busqueda--------------//
          if not  dmfacturador.qbusqueda.IsEmpty then
                 Begin
                   While not dmfacturador.qbusqueda.Eof do
                       begin
                               if dmfacturador.CDSetiquetas.Active=false then
                                begin
                                  dmfacturador.CDSetiquetas.CreateDataSet;
                                  dmfacturador.CDSetiquetas.Active:=true;
                                end;
                            dmfacturador.CDSetiquetas.Append;
                            dmfacturador.CDSetiquetascod_alfabeta.AsString:=dmfacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString;
                            dmfacturador.CDSetiquetasnro_troquel.Asstring:=dmfacturador.qbusqueda.FieldByName('nro_troquel').AsString;
                            dmfacturador.CDSetiquetascod_barraspri.Asstring:=dmfacturador.qbusqueda.FieldByName('cod_barraspri').AsString;
                            dmfacturador.CDSetiquetasnom_largo.AsString:=dmfacturador.qbusqueda.FieldByName('nom_largo').AsString;
                            dmfacturador.CDSetiquetascod_iva.AsString:=dmfacturador.qbusqueda.FieldByName('cod_iva').AsString;
                            dmfacturador.CDSetiquetascan_stk.AsString:=dmfacturador.qbusqueda.FieldByName('can_stk').AsString;
                            porvarlabo:=dmfacturador.qbusqueda.FieldByName('varlabo').AsFLOAT;
                            porvarrubro:=dmfacturador.qbusqueda.FieldByName('varrubro').Asfloat;
                            preciocrudo:=dmfacturador.qbusqueda.FieldByName('precio').Asfloat;
                            precio;
                                if dmfacturador.qbusqueda.FieldByName('precio').asfloat=0 then
                                begin
                                    dmfacturador.CDSetiquetasprecio.asstring:='0.00';
                                end;
                                 if dmfacturador.qbusqueda.FieldByName('precio').asfloat<>0 then
                                begin

                                    dmfacturador.CDSetiquetasprecio.asstring:=floattostr(preciocalculado);
                                end;


                            dmfacturador.CDSetiquetasdescuento.AsFloat:=0;
                            dmfacturador.CDSetiquetasPRECIO_TOTAL.AsFloat:=0;
                            dmfacturador.CDSetiquetasRUBRO.AsString:=dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString;
                            dmfacturador.CDSetiquetasDESCUENTOOS.asfloat:=0;
                            dmfacturador.CDSetiquetasDescuentoco1.Asfloat:=0;
                            dmfacturador.CDSetiquetasDESCUENTOCO2.Asfloat:=0;

                      //------------------------busqueda de producto en ofertas---------------------//

                //            analizaroferta(monto);



                     //------------------------insersion en grilla de busqueda--------------//
                            dmfacturador.CDSetiquetasimp_descuento.AsFloat:=monto;
                            dmfacturador.CDSetiquetasCod_laboratorio.AsString:=dmfacturador.qbusqueda.FieldByName('cod_laboratorio').AsString;
                            dmfacturador.qbusqueda.Next;
                       end;
              End;
  application.ProcessMessages;
  lregistros.Caption:=inttostr(j);
  end;
  form.Close;










   except on E: Exception do
      begin
        {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
      end;





end;
form.Close;
end;

procedure Tfetiquetasmanuales.bbuscarbajaClick(Sender: TObject);

var
//reg: tregistry;
A: INTEGER;

cobOS:double;
cobCos1:double;
cobcos2: double;
Valor: extended;
espacios: string;
value: integer;
form: tfprogreso;


begin
  form:=tfprogreso.Create(self);

  form.Show;
  application.ProcessMessages;
  dmfacturador.dsecundario.Close;
 //------------------------------------------------busqueda por descripcion/codigo troquel/ barras--------------------------------/ /

   dmFacturador.AbrirConexion();

  if Length(ebusquedabaja.text)>0  then
   begin
    dmfacturador.qbusqueda.Close;
    dmfacturador.qbusqueda.SQL.Clear;
    dmfacturador.qbusqueda.SQL.Text:=concat(' select first(100) ',
                                                    '  DISTINCT a.cod_alfabeta, ',
                                                    '  a.nro_troquel,   ',
                                                    '  a.cod_barraspri,  ',
                                                    '  a.nom_largo, ',
                                                    '  a.cod_iva, ',
                                                    '  s.can_stk, ',
                                                    '  a.cod_tamano, ',
                                                    '  a.cod_laboratorio, ',
                                                    ' coalesce(CAST(   ',
                                                    ' CASE  ',
                                                    ' WHEN a.mar_impsug=''N'' and a.mar_precioventa=''S'' THEN  ',
                                                    ' b.imp_venta  ',
                                                    ' when a.mar_impsug=''N'' and a.mar_precioventa=''N'' THEN ',
                                                    ' (b.imp_compra*(1+r.por_margen/100)) ',
                                                    '  when a.mar_impsug=''S'' AND A.mar_precioventa=''S'' then ',
                                                    ' (a.imp_sugerido) ',
                                                    ' when A.mar_impsug=''S'' AND A.mar_precioventa=''N'' then ',
                                                    '  ((a.imp_sugerido*r.por_margen/100) + a.imp_sugerido) ',
                                                    '  END AS DECIMAL (10,2)),0) as PRECIO, ',
                                                    ' c.POR_VAR_PRECIO as varlabo,  ',
                                                    ' r.por_var_precio as VARRUBRO,  ',
                                                    ' r.cod_rubro,  ',
                                                    ' d.des_droga,  ',
                                                    ' f.des_accfarm,  ',
                                                    ' c.nom_laboratorio ',
                                                    ' from  prmalaboratorio c, prmarubro r,   ',
                                                    ' prmaproducto a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta ',
                                                    ' LEFT JOIN prmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm  ',
                                                    ' LEFT JOIN prmamonodroga d ON  D.cod_droga=a.cod_droga   ',
                                                    ' left join   prmastock s on    a.cod_alfabeta=s.cod_alfabeta and s.nro_sucursal=b.nro_sucursal ',
                                                    ' where (cod_barraspri= :Barras Or NRO_TROQUEL= :Troquel or (a.nom_largo like :nombre ) ) ',
                                                    ' AND a.cod_rubro=r.cod_rubro ',
                                                    ' and c.cod_laboratorio=a.cod_laboratorio ',
                                                    ' and not(mar_baja=''S'' and s.can_stk=0) ',
                                                    ' and b.nro_sucursal=:sucursal ');




    DMFACTURADOR.qbusqueda.SQL.SaveToFile('SQL.TXT');
    if TextToFloat(PChar(ebusquedabaja.text),Valor,fvExtended) then
    begin
    dmfacturador.qbusqueda.ParamByName('barras').AsString:=ebusquedabaja.Text;
    end;
    if tryStrToInt(ebusquedabaja.Text, value)then
    begin
    dmfacturador.qbusqueda.parambyname('troquel').asinteger:=value;
    end;
     dmfacturador.qbusqueda.ParamByName('sucursal').AsString:=dmFacturador.getSucursal();
    if not TextToFloat(PChar(ebusquedabaja.text),Valor,fvExtended) then
    begin
     espacios:= StringReplace(ebusquedabaja.text, ' ', '%', [rfReplaceAll]);
     dmfacturador.qbusqueda.ParamByName('nombre').AsString:='%'+espacios+'%';
    end;
     dmfacturador.qbusqueda.Open;
   end;
   //------------------------insersion en grilla de busqueda--------------//
   if not  dmfacturador.qbusqueda.IsEmpty then
     Begin
       While not dmfacturador.qbusqueda.Eof do
       begin
         if dmfacturador.CDSetiquetas.Active=false then
          begin
            dmfacturador.CDSetiquetas.CreateDataSet;
            dmfacturador.CDSetiquetas.Active:=true;
          end;
          dmfacturador.CDSetiquetas.Append;
          dmfacturador.CDSetiquetascod_alfabeta.AsString:=dmfacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString;
          dmfacturador.CDSetiquetasnro_troquel.Asstring:=dmfacturador.qbusqueda.FieldByName('nro_troquel').AsString;
          dmfacturador.CDSetiquetascod_barraspri.Asstring:=dmfacturador.qbusqueda.FieldByName('cod_barraspri').AsString;
          dmfacturador.CDSetiquetasnom_largo.AsString:=dmfacturador.qbusqueda.FieldByName('nom_largo').AsString;
          dmfacturador.CDSetiquetascod_iva.AsString:=dmfacturador.qbusqueda.FieldByName('cod_iva').AsString;
          dmfacturador.CDSetiquetascan_stk.AsString:=dmfacturador.qbusqueda.FieldByName('can_stk').AsString;
          porvarlabo:=dmfacturador.qbusqueda.FieldByName('varlabo').AsFLOAT;
          porvarrubro:=dmfacturador.qbusqueda.FieldByName('varrubro').Asfloat;
          preciocrudo:=dmfacturador.qbusqueda.FieldByName('precio').Asfloat;
          precio;
          if dmfacturador.qbusqueda.FieldByName('precio').asfloat=0 then
          begin
              dmfacturador.CDSetiquetasprecio.asstring:='0.00';
          end;
           if dmfacturador.qbusqueda.FieldByName('precio').asfloat<>0 then
          begin

              dmfacturador.CDSetiquetasprecio.asstring:=floattostr(preciocalculado);
          end;


          dmfacturador.CDSetiquetasdescuento.AsFloat:=0;
          dmfacturador.CDSetiquetasPRECIO_TOTAL.AsFloat:=0;
          dmfacturador.CDSetiquetasRUBRO.AsString:=dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString;
          dmfacturador.CDSetiquetasDESCUENTOOS.asfloat:=0;
          dmfacturador.CDSetiquetasDescuentoco1.Asfloat:=0;
          dmfacturador.CDSetiquetasDESCUENTOCO2.Asfloat:=0;
          dmfacturador.CDSetiquetasCod_laboratorio.AsString:=dmfacturador.qbusqueda.FieldByName('cod_laboratorio').AsString;
          dmfacturador.qbusqueda.Next;

       end;

     End;





  form.Close;
  ebusquedabaja.Clear;
  ebusquedabaja.SetFocus;

  if not getiquetas.DataSource.DataSet.IsEmpty then
  begin
    bimprimir.Enabled:=false;
    bajaetiquetas.Enabled:=true;
  end;
   if  getiquetas.DataSource.DataSet.IsEmpty then
  begin
    bimprimir.Enabled:=false;
    bajaetiquetas.Enabled:=false;
  end;



end;




procedure Tfetiquetasmanuales.bbuscarClick(Sender: TObject);
var
//reg: tregistry;
A,i: INTEGER;

cobOS:double;
cobCos1:double;
cobcos2: double;
Valor: extended;
espacios: string;
value: integer;
form: tfprogreso;
unItem: TTicketItem;
importe: double;

begin
  form:=tfprogreso.Create(self);

  form.Show;
  application.ProcessMessages;
  dmfacturador.dsecundario.Close;
 //------------------------------------------------busqueda por descripcion/codigo troquel/ barras--------------------------------/ /

   dmFacturador.AbrirConexion();

  if Length(ebusqueda.text)>0  then
   begin
    dmfacturador.qbusqueda.Close;
    dmfacturador.qbusqueda.SQL.Clear;
    dmfacturador.qbusqueda.SQL.Text:=concat(       ' select first(100) ',
                                                    '  DISTINCT a.cod_alfabeta, ',
                                                    '  a.nro_troquel,   ',
                                                    '  a.cod_barraspri,  ',
                                                    '  a.nom_largo, ',
                                                    '  a.cod_iva, ',
                                                    '  s.can_stk, ',
                                                    '  a.cod_tamano, ',
                                                    '  a.cod_laboratorio, ',
                                                    ' coalesce(CAST(   ',
                                                    ' CASE  ',
                                                    ' WHEN a.mar_impsug=''N'' and a.mar_precioventa=''S'' THEN  ',
                                                    ' b.imp_venta  ',
                                                    ' when a.mar_impsug=''N'' and a.mar_precioventa=''N'' THEN ',
                                                    ' (b.imp_compra*(1+r.por_margen/100)) ',
                                                    '  when a.mar_impsug=''S'' AND A.mar_precioventa=''S'' then ',
                                                    ' (a.imp_sugerido) ',
                                                    ' when A.mar_impsug=''S'' AND A.mar_precioventa=''N'' then ',
                                                    '  ((a.imp_sugerido*r.por_margen/100) + a.imp_sugerido) ',
                                                    '  END AS DECIMAL (10,2)),0) as PRECIO, ',
                                                    ' c.POR_VAR_PRECIO as varlabo,  ',
                                                    ' r.por_var_precio as VARRUBRO,  ',
                                                    ' r.cod_rubro,  ',
                                                    ' d.des_droga,  ',
                                                    ' f.des_accfarm,  ',
                                                    ' c.nom_laboratorio ',
                                                    ' from  prmalaboratorio c, prmarubro r,   ',
                                                    ' prmaproducto a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta ',
                                                    ' LEFT JOIN prmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm  ',
                                                    ' LEFT JOIN prmamonodroga d ON  D.cod_droga=a.cod_droga   ',
                                                    ' left join   prmastock s on    a.cod_alfabeta=s.cod_alfabeta and s.nro_sucursal=b.nro_sucursal ',
                                                    ' where (cod_barraspri= :Barras Or NRO_TROQUEL= :Troquel or (a.nom_largo like :nombre ) ) ',
                                                    ' AND a.cod_rubro=r.cod_rubro ',
                                                    ' and c.cod_laboratorio=a.cod_laboratorio ',
                                                    ' and not(mar_baja=''S'' and s.can_stk=0) ',
                                                    ' and b.nro_sucursal=:sucursal ');




    DMFACTURADOR.qbusqueda.SQL.SaveToFile('SQL.TXT');
    if TextToFloat(PChar(ebusqueda.text),Valor,fvExtended) then
    begin
    dmfacturador.qbusqueda.ParamByName('barras').AsString:=ebusqueda.Text;
    end;
    if tryStrToInt(ebusqueda.Text, value)then
    begin
    dmfacturador.qbusqueda.parambyname('troquel').asinteger:=value;
    end;
     dmfacturador.qbusqueda.ParamByName('sucursal').AsString:=dmFacturador.getSucursal();
    if not TextToFloat(PChar(ebusqueda.text),Valor,fvExtended) then
    begin
     espacios:= StringReplace(ebusqueda.text, ' ', '%', [rfReplaceAll]);
     dmfacturador.qbusqueda.ParamByName('nombre').AsString:='%'+espacios+'%';
    end;
     dmfacturador.qbusqueda.Open;
   end;


   if not  dmfacturador.qbusqueda.IsEmpty then
     Begin
       While not dmfacturador.qbusqueda.Eof do
       begin
         if dmfacturador.CDSetiquetas.Active=false then
          begin
            dmfacturador.CDSetiquetas.CreateDataSet;
            dmfacturador.CDSetiquetas.Active:=true;
          end;
          dmfacturador.CDSetiquetas.Append;
          dmfacturador.CDSetiquetascod_alfabeta.AsString:=dmfacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString;
          dmfacturador.CDSetiquetasnro_troquel.Asstring:=dmfacturador.qbusqueda.FieldByName('nro_troquel').AsString;
          dmfacturador.CDSetiquetascod_barraspri.Asstring:=dmfacturador.qbusqueda.FieldByName('cod_barraspri').AsString;
          dmfacturador.CDSetiquetasnom_largo.AsString:=dmfacturador.qbusqueda.FieldByName('nom_largo').AsString;
          dmfacturador.CDSetiquetascod_iva.AsString:=dmfacturador.qbusqueda.FieldByName('cod_iva').AsString;
          dmfacturador.CDSetiquetascan_stk.AsString:=dmfacturador.qbusqueda.FieldByName('can_stk').AsString;
          porvarlabo:=dmfacturador.qbusqueda.FieldByName('varlabo').AsFLOAT;
          porvarrubro:=dmfacturador.qbusqueda.FieldByName('varrubro').Asfloat;
          preciocrudo:=dmfacturador.qbusqueda.FieldByName('precio').Asfloat;
          precio;
          if dmfacturador.qbusqueda.FieldByName('precio').asfloat=0 then
          begin
              dmfacturador.CDSetiquetasprecio.asstring:='0.00';
          end;
           if dmfacturador.qbusqueda.FieldByName('precio').asfloat<>0 then
          begin

              dmfacturador.CDSetiquetasprecio.asstring:=floattostr(preciocalculado);
          end;


          dmfacturador.CDSetiquetasdescuento.AsFloat:=0;
          dmfacturador.CDSetiquetasPRECIO_TOTAL.AsFloat:=0;
          dmfacturador.CDSetiquetasRUBRO.AsString:=dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString;
          dmfacturador.CDSetiquetasDESCUENTOOS.asfloat:=0;
          dmfacturador.CDSetiquetasDescuentoco1.Asfloat:=0;
          dmfacturador.CDSetiquetasDESCUENTOCO2.Asfloat:=0;
          dmfacturador.CDSetiquetasCod_laboratorio.AsString:=dmfacturador.qbusqueda.FieldByName('cod_laboratorio').AsString;
          dmfacturador.CDSetiquetascod_tamano.AsString:=dmfacturador.qbusqueda.FieldByName('cod_tamano').AsString;
          dmfacturador.CDSetiquetasdes_accion.AsString:=dmfacturador.qbusqueda.FieldByName('DES_ACCFARM').AsString;
          dmfacturador.CDSetiquetasdes_droga.AsString:=dmfacturador.qbusqueda.FieldByName('DES_DROGA').AsString;

    //------------------------busqueda de producto en ofertas---------------------//

    //      analizaroferta(monto);



   //------------------------insersion en grilla de busqueda--------------//
          dmfacturador.CDSetiquetasimp_descuento.AsFloat:=monto;
        //  dmfacturador.dsecundarionom_laboratorio.AsString:=dmfacturador.qbusqueda.FieldByName('nom_laboratorio').AsString;
          dmfacturador.qbusqueda.Next;
       end;
     End;




  form.Close;
  ebusqueda.Clear;
  ebusqueda.SetFocus;

end;

procedure Tfetiquetasmanuales.BcancelarClick(Sender: TObject);
begin
dmfacturador.CDSetiquetas.close;
end;

procedure Tfetiquetasmanuales.BimprimirClick(Sender: TObject);
 var
i:integer;
 r: TRect;
  e: Integer;
  PRINT: string;
  DESCRIPCION: string;
  PRECIO: string;
  reg: tregistry;
  o: integer;
  tamañogrilla:integer;
  numImpresora: integer;
begin
o:=0;
i:=1;
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey(regKey,true);
    if petiquetas.ActivePageIndex=0 then
    begin
    getiquetas.DataSource.DataSet.First;
    tsalfabeta := TStringList.Create;
    tsprecios := TStringList.Create;
      while not getiquetas.DataSource.DataSet.Eof do
      begin

       tsalfabeta.Add(Getiquetas.Fields[0].AsString);
       tsprecios.Add(Getiquetas.Fields[6].AsString);
       o:=o+1;
       getiquetas.DataSource.DataSet.Next;
       tamañogrilla:=getiquetas.DataSource.DataSet.RecordCount;
       if o=50 then
       begin
         agregarurl;
       end;
       if o=tamañogrilla then
       begin
       agregarurl;
       end;
      end;


    end;

    if rimpresion.ItemIndex=0 then
    begin
    getiquetas.DataSource.DataSet.First;
      while not getiquetas.DataSource.DataSet.Eof do
          begin
             with Printer do
             begin
             if getiquetas.fields[14].asfloat=0 then
               begin

               numImpresora:=getImpresora(reg.ReadString('IMPRESORA'));
               Printer.PrinterIndex:=numImpresora;
               BeginDoc;
               Canvas.Font.Style := [];
               Canvas.Brush.Style := bsclear;
               canvas.Font.Height:=25;
               Canvas.TextOut(200,-5,Getiquetas.Fields[2].AsString);
               Canvas.TextOut(100,-4, '____________________________________________');
               Canvas.Brush.Color := clBlack;
               Canvas.Brush.Style := bsclear;
               canvas.Font.Height:=25;
               Canvas.TextOut(200,50,Getiquetas.Fields[3].AsString);
               Canvas.TextOut(100,51, '____________________________________________');
               Canvas.Brush.Color := clBlack;
               Canvas.Brush.Style := bsclear;
               canvas.Font.Height:=70;
               Canvas.TextOut(160,80, '$');
               Canvas.TextOut(200,80,Getiquetas.Fields[6].AsString);
               canvas.Font.Height:=25;
               Canvas.TextOut(100,125, '____________________________________________');
               canvas.Font.Height:=20;
               Canvas.TextOut(100,148, '            autofarma centro de bienestar');
               enddoc;
               end;
             if getiquetas.fields[14].asfloat<>0 then
               begin

               numImpresora:=getImpresora(reg.ReadString('IMPRESORA'));
               Printer.PrinterIndex:=numImpresora;
               BeginDoc;
               Canvas.Brush.Style := bsclear;
               canvas.Font.Height:=25;
               Canvas.TextOut(150,-5,Getiquetas.Fields[2].AsString);
               Canvas.TextOut(50,-2, '____________________________________________');
                canvas.Font.Height:=20;
                Canvas.Font.Style := [fsbold];
               Canvas.TextOut(50,17, 'oferta-oferta-oferta-oferta-oferta-oferta-oferta-oferta-oferta-oferta');
               Canvas.Brush.Color := clBlack;
               Canvas.Brush.Style := bsclear;
               canvas.Font.Height:=25;
               Canvas.TextOut(150,52,Getiquetas.Fields[3].AsString);
               Canvas.TextOut(50,53, '____________________________________________');
               Canvas.Brush.Color := clblack;
               Canvas.Brush.Style := bsclear;
               canvas.Font.Height:=70;
               Canvas.TextOut(110,80, '$');
               Canvas.TextOut(150,80,Getiquetas.Fields[14].AsString);
               Canvas.Brush.Color := clblack;
               Canvas.Brush.Style := bsclear;
               canvas.Font.Height:=20;
               Canvas.TextOut(50,134, '_____________________________________________________________________');
               Canvas.Font.Style := [fsbold];
               Canvas.TextOut(50,150, 'oferta-oferta-oferta-oferta-oferta-oferta-oferta-oferta-oferta-oferta');
               canvas.Font.Height:=20;
               Canvas.TextOut(50,150, '_____________________________________________________________________');
               Canvas.TextOut(50,167, '            autofarma centro de bienestar');
               enddoc;
               end;
             end;
          getiquetas.DataSource.DataSet.next;
          end;
    end;

    if rimpresion.ItemIndex=1 then
    begin
     dmfacturador.reporteetiquetas.LoadFromFile(Reg.ReadString('Reportes')+'etiquetas.FR3');
     dmfacturador.reporteetiquetas.ShowReport(false);
     dmfacturador.CDSetiquetas.close;
    end;



end;

procedure Tfetiquetasmanuales.blimpiarClick(Sender: TObject);
begin
dmfacturador.CDSetiquetas.close;
bimprimir.Enabled:=true;
if petiquetas.ActivePageIndex=1 then
begin
bajaetiquetas.Enabled:=false;
end;
end;

procedure Tfetiquetasmanuales.ebusquedabajaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
  begin
  bbuscarbaja.Click;
  end;
end;

procedure Tfetiquetasmanuales.ebusquedaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
  bbuscar.Click;
  end;
end;

procedure Tfetiquetasmanuales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmfacturador.CDSetiquetas.close;
if Assigned(calcuprecio) then
   calcuprecio.Free;


end;

procedure Tfetiquetasmanuales.FormShow(Sender: TObject);
begin
getiquetas.DataSource:= dmFacturador.dsetiquetas;

calcuprecio:= TCalculadoraPrecio.Create(strToFloat(ticket.recargo));
petiquetas.TabIndex:=0;
ebusqueda.SetFocus;
end;

procedure Tfetiquetasmanuales.petiquetasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
blimpiar.Click;
bimprimir.Enabled:=true;
 if dtdesde.Visible=true then
 begin
  dtdesde.DateTime:=date;
  dthasta.DateTime:=date;

 end;

end;

procedure Tfetiquetasmanuales.precio;

begin
  calcuPrecio.CodRubro:=dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString;
  calcuPrecio.CodOS:='';
  calcuPrecio.CodCos1:= '';
  calcuPrecio.CodCos2:='';
  preciocalculado:= calcuPrecio.CalcularPrecio(preciocrudo,porvarlabo,porvarrubro,dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString);

end;

procedure tfetiquetasmanuales.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;

end;

end.

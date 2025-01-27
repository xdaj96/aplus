unit Ukardex;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, udticket, udmfacturador, uprogreso,uCalculadoraPrecio,
  registry , math;

type
  Tfkardex = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ebusqueda: TEdit;
    bbuscar: TButton;
    gkardex: TDBGrid;
    breporte: TBitBtn;
    Label1: TLabel;
    Shape2: TShape;
    ddesde: TDateTimePicker;
    dhasta: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    procedure bbuscarClick(Sender: TObject);
    procedure breporteClick(Sender: TObject);
    procedure ebusquedaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gkardexDblClick(Sender: TObject);
    procedure gkardexKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
   Ticket:TTicket;
   calcuPrecio:TCalculadoraPrecio;
  public
    procedure SetTicket(unTicket:TTicket);
    procedure precio;
  end;

var
  fkardex: Tfkardex;


  tsalfabeta:tstringlist;
  tsprecios: tstringlist;
   porvarlabo: double;
   porvarrubro: double;
   preciocrudo: double;
   preciocalculado: double;
   recargo:Double;
implementation

{$R *.dfm}

{ Tfkardex }

procedure Tfkardex.bbuscarClick(Sender: TObject);
var
form: tfprogreso;
Valor: extended;
espacios: string;
value: integer;
  trimmedText: string;

begin
 dmfacturador.CDSetiquetas.close;
 form:=tfprogreso.Create(self);

  form.Show;
  application.ProcessMessages;
  dmfacturador.dsecundario.Close;
 //------------------------------------------------busqueda por descripcion/codigo troquel/ barras--------------------------------/ /
     trimmedText := StringReplace(ebusqueda.Text, ' ', '', [rfReplaceAll]); // Elimina espacios en blanco

    dmFacturador.AbrirConexion();

         if Length(trim(ebusqueda.text))>2  then
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



  //INACTIVOS

           // DMFACTURADOR.qbusqueda.SQL.SaveToFile('SQL.TXT');
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

          dmfacturador.qbusqueda.Next;
       end;
     End;




end
else
begin
    ShowMessage('El campo de búsqueda debe tener al menos 3 caracteres.');
    ebusqueda.SetFocus; // Devolver el foco al campo de búsqueda para que el usuario pueda corregirlo.

end;
  form.close;
  application.ProcessMessages;
  ebusqueda.Clear;

end;


procedure Tfkardex.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;
procedure Tfkardex.breporteClick(Sender: TObject);
var
 reg: tregistry;
 form: tfprogreso;
begin
   form:=tfprogreso.Create(self);

  form.Show;
  application.ProcessMessages;
       Reg := TRegistry.Create;
       Reg.RootKey := HKEY_CURRENT_USER;
       Reg.OpenKey(regKey,true);

     dmFacturador.AbrirConexion();

     dmfacturador.qkardex.Close;
     dmfacturador.qkardex.SQL.Clear;
     dmfacturador.qkardex.SQL.Text:=concat('SELECT ',
                                           ' pro.nom_largo, ',
                                           ' mov.FEC_MOVIMIENTO , ',
                                           ' mov.TIP_COMPROBANTE, ',
                                           ' mov.NRO_COMPROBANTE, ',
                                           ' mov.STK_INICIAL, ',
                                           ' mov.MOVIMIENTOS, ',
                                           ' mov.STK_FINAL,    ',
                                           ' ven.nom_vendedor  ',
                                           ' FROM movstock mov , prmaproducto pro , vtmacomprobemitido vta, vtmavendedor  ven ',
                                           ' WHERE mov.cod_alfabeta=pro.cod_alfabeta and vta.nro_comprobante=mov.nro_comprobante and ven.cod_vendedor=vta.cod_vendedor ',
                                           ' and pro.COD_ALFABETA=:ALFABETA  ',
                                           ' AND MOV.tip_comprobante=VTA.tip_comprobante ',
                                           ' AND CAST (FEC_MOVIMIENTO AS DATE) BETWEEN :DESDE AND :HASTA ',
                                           ' and vta.tip_comprobante not like ''%VR%''',
                                           ' order by 2 ');


     dmfacturador.qkardex.ParamByName('alfabeta').AsString:=gkardex.Fields[0].AsString;
     dmfacturador.qkardex.parambyname('desde').asdate:=ddesde.Date;
     dmfacturador.qkardex.parambyname('hasta').asdate:=dhasta.Date;
     dmfacturador.qkardex.open;

     form.Close;
     dmfacturador.reportekardex.LoadFromFile(Reg.ReadString('Reportes')+'kardex.FR3');
     dmfacturador.reportekardex.ShowReport(false);
     dmfacturador.CDSetiquetas.close;
end;

procedure Tfkardex.ebusquedaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
  bbuscar.Click;
end;
end;

procedure Tfkardex.FormShow(Sender: TObject);
begin
ddesde.DateTime:=now;
dhasta.DateTime:=now;
recargo:=(strtofloat(ticket.recargo));
calcuPrecio:= TCalculadoraPrecio.Create(recargo);


end;

procedure Tfkardex.gkardexDblClick(Sender: TObject);
begin
breporte.click;
end;

procedure Tfkardex.gkardexKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=vk_return then
begin
  breporte.Click;
end;
end;

procedure Tfkardex.precio;
begin
calcuPrecio.CodRubro:= dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString;
preciocalculado:=calcuPrecio.CalcularPrecio(preciocrudo,porvarlabo,porvarrubro,dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString)

end;


end.

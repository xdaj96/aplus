unit Ubusquedacomprob;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, udticket, udmfacturador, uprogreso ,Printers, math, registry;

type
  Tfbusquedacomprob = class(TForm)
    pbusqueda: TPageControl;
    Busqueda: TTabSheet;
    Detalle: TTabSheet;
    Panel1: TPanel;
    panel3: TPanel;
    panel4: TPanel;
    gbusquedacomprob: TDBGrid;
    Blimpiartodo: TBitBtn;
    ecomprob: TEdit;
    combotipo: TComboBox;
    Label1: TLabel;
    bbuscar: TButton;
    imprimir: TBitBtn;
    MemoIMPRESION: TMemo;
    gdetalle: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure bbuscarClick(Sender: TObject);
    procedure imprimirClick(Sender: TObject);
    procedure BlimpiartodoClick(Sender: TObject);
    Function GetImpresora(Impre:String):Integer;
    private
   Ticket:TTicket;
    public
    procedure SetTicket(unTicket:TTicket);
    end;

var
  fbusquedacomprob: Tfbusquedacomprob;

implementation

{$R *.dfm}

{ Tfbusquedacomprob }
function cadLongitudFija (cadena : string; longitud : Integer;
    posicionIzquierda : boolean; valorRelleno : string) : string;
var
  i: integer;
begin
  if length(cadena) > longitud then
    cadena := copy(cadena, 1, longitud)
  else
  begin
    for i := 1 to longitud - Length(cadena) do
      if posicionIzquierda then
        cadena := valorRelleno + cadena
      else
        cadena := cadena + valorRelleno;
  end;
  Result := cadena;
end;

Function Tfbusquedacomprob.GetImpresora(Impre:String):Integer;
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


procedure Tfbusquedacomprob.bbuscarClick(Sender: TObject);
var
form: tfprogreso;
begin

form:=tfprogreso.Create(self);

  form.Show;
  application.ProcessMessages;

dmFacturador.AbrirConexion();
dmfacturador.qbusquedacomprob.Close;
dmfacturador.qbusquedacomprob.SQL.Clear;
dmfacturador.qbusquedacomprob.SQL.Text:=concat(' select                ',
                                               ' v.tip_comprobante,    ',
                                               ' v.nro_comprobante,    ',
                                               ' v.cod_vendedor,       ',
                                               ' v.nro_caja,           ',
                                               ' v.fec_comprobante,    ',
                                               ' v.can_items,         ',
                                               ' v.imp_neto,         ',
                                               ' v.imp_bruto,        ',
                                               ' v.nom_cliente,      ',
                                               ' v.cod_cliente,      ',
                                               ' O.imp_cargoos,      ',
                                               ' O.cod_planos,       ',
                                               ' O.nom_obrasocial,   ',
                                               ' O.fec_receta,      ',
                                               ' O.nom_afiliado,   ',
                                               ' O.nro_matriculA, ',
                                               ' osma.mar_obrasocial ',
                                              ' from vtmacomprobemitido v left join  osmamovobrasocial o  on  v.nro_comprobante=o.nro_comprob AND v.tip_comprobante=o.tip_comprob ',
                                              ' left join osmaplanesos osma on osma.cod_planos=o.cod_planos ',
                                              ' where v.nro_Comprobante=:NUMERO ',
                                              ' AND v.TIP_COMPROBANTE=:TIPO ');


dmfacturador.qbusquedacomprob.ParamByName('NUMERO').AsString:=ecomprob.Text;
dmfacturador.qbusquedacomprob.ParamByName('TIPO').AsString:=COMBOTIPO.Text;

 dmfacturador.qbusquedacomprob.Open;
 dmfacturador.qbusquedacomprob.first;
 if dmfacturador.cdsbusquedacomprob.Active=false then
          begin
            dmfacturador.cdsbusquedacomprob.CreateDataSet;
            dmfacturador.cdsbusquedacomprob.Active:=true;
          end;
 While not dmfacturador.qbusquedacomprob.Eof do
       begin

          dmfacturador.cdsbusquedacomprob.Append;
          dmfacturador.cdsbusquedacomprobTIP_COMPROBANTE.AsString:=dmfacturador.qbusquedacomprob.FieldByName('tip_comprobante').AsString;
          dmfacturador.cdsbusquedacomprobnro_comprobante.AsString:=dmfacturador.qbusquedacomprob.FieldByName('nro_comprobante').AsString;
          dmfacturador.cdsbusquedacomprobcod_vendedor.AsString:=dmfacturador.qbusquedacomprob.FieldByName('cod_vendedor').AsString;
          dmfacturador.cdsbusquedacomprobnro_caja.AsString:=dmfacturador.qbusquedacomprob.FieldByName('nro_caja').AsString;
          dmfacturador.cdsbusquedacomprobfec_comprobante.AsString:=dmfacturador.qbusquedacomprob.FieldByName('fec_comprobante').AsString;
          dmfacturador.cdsbusquedacomprobcan_items.AsString:=dmfacturador.qbusquedacomprob.FieldByName('can_items').AsString;
          dmfacturador.cdsbusquedacomprobimp_neto.AsString:=dmfacturador.qbusquedacomprob.FieldByName('imp_neto').AsString;
          dmfacturador.cdsbusquedacomprobimp_bruto.AsString:=dmfacturador.qbusquedacomprob.FieldByName('imp_bruto').AsString;
          dmfacturador.cdsbusquedacomprobnom_cliente.AsString:=dmfacturador.qbusquedacomprob.FieldByName('nom_cliente').AsString;
          dmfacturador.cdsbusquedacomprobcod_cliente.AsString:=dmfacturador.qbusquedacomprob.FieldByName('cod_cliente').AsString;
          dmfacturador.cdsbusquedacomprobIMP_CARGOOS.AsString:=dmfacturador.qbusquedacomprob.FieldByName('imp_cargoos').AsString;
          dmfacturador.cdsbusquedacomprobcod_planos.AsString:=dmfacturador.qbusquedacomprob.FieldByName('cod_planos').AsString;
          dmfacturador.cdsbusquedacomprobnom_obrasocial.AsString:=dmfacturador.qbusquedacomprob.FieldByName('nom_obrasocial').AsString;
          dmfacturador.cdsbusquedacomprobfec_receta.AsString:=dmfacturador.qbusquedacomprob.FieldByName('fec_receta').AsString;
          dmfacturador.cdsbusquedacomprobnom_afiliado.AsString:=dmfacturador.qbusquedacomprob.FieldByName('nom_afiliado').AsString;
          dmfacturador.cdsbusquedacomprobnro_matricula.AsString:=dmfacturador.qbusquedacomprob.FieldByName('nro_matricula').AsString;
          dmfacturador.cdsbusquedacomprobmar_obrasocial.asstring:=dmfacturador.qbusquedacomprob.FieldByName('mar_obrasocial').AsString;

          dmfacturador.cdsbusquedacomprob.Post;
          dmfacturador.qbusquedacomprob.next;

       end;


dmfacturador.qosmamovobrasocial.Close;
dmfacturador.qosmamovobrasocial.SQL.Clear;
dmfacturador.qosmamovobrasocial.SQL.Text:=concat( ' select        ',
                                                ' v.cod_alfabeta, ',
                                                ' v.nro_item,      ',
                                                ' t.nom_largo,      ',
                                                ' v.can_cantidad,    ',
                                                ' v.imp_unitario,     ',
                                                ' v.imp_prodneto,      ',
                                                ' SUM(c.imp_descuento) as imp_descuento,      ',
                                                ' SUM(c.por_descuento) as por_descuento        ',
                                                '                         ',
                                                '                          ',
                                                '                           ',
                                                ' from vtmadetallecomprob v  ',
                                                ' inner join prmaproducto t on v.cod_alfabeta=t.cod_alfabeta ',
                                                ' left join osmadetallemov c on v.nro_comprobante=c.nro_comprob and v.tip_comprobante=c.tip_comprob  ',
                                                ' where v.tip_comprobante=:tipo  ',
                                                ' and v.nro_comprobante=:comprobante ',
                                                ' GROUP BY 1,2,3,4,5,6');


dmfacturador.qosmamovobrasocial.ParamByName('comprobante').AsString:=ecomprob.Text;
dmfacturador.qosmamovobrasocial.ParamByName('TIPO').AsString:=COMBOTIPO.Text;

 dmfacturador.qosmamovobrasocial.Open;
 dmfacturador.qosmamovobrasocial.first;
 While not dmfacturador.qosmamovobrasocial.Eof do
       begin
         if dmfacturador.cdsosmamovobrasocial.Active=false then
          begin
            dmfacturador.cdsosmamovobrasocial.CreateDataSet;
            dmfacturador.cdsosmamovobrasocial.Active:=true;
          end;
          dmfacturador.cdsosmamovobrasocial.Append;
          dmfacturador.cdsosmamovobrasocialCOD_ALFABETA.AsString:=dmfacturador.qosmamovobrasocial.FieldByName('cod_alfabeta').AsString;
          dmfacturador.cdsosmamovobrasocialnro_item.AsString:=dmfacturador.qosmamovobrasocial.FieldByName('nro_item').AsString;
          dmfacturador.cdsosmamovobrasocialnom_largo.AsString:=dmfacturador.qosmamovobrasocial.FieldByName('nom_largo').AsString;
          dmfacturador.cdsosmamovobrasocialcan_cantidad.AsString:=dmfacturador.qosmamovobrasocial.FieldByName('can_cantidad').AsString;
          if dmfacturador.qosmamovobrasocial.FieldByName('imp_unitario').AsString<>'' then
          begin
          dmfacturador.cdsosmamovobrasocialimp_unitario.AsString:=dmfacturador.qosmamovobrasocial.FieldByName('imp_unitario').AsString;
          end;
          if dmfacturador.qosmamovobrasocial.FieldByName('imp_unitario').AsString='' then
          begin
          dmfacturador.cdsosmamovobrasocialimp_unitario.AsString:='0';
          end;
          if dmfacturador.qosmamovobrasocial.FieldByName('imp_prodneto').AsString<>'' then
          begin
          dmfacturador.cdsosmamovobrasocialimp_prodneto.AsString:=dmfacturador.qosmamovobrasocial.FieldByName('imp_prodneto').AsString;
          end;
          if dmfacturador.qosmamovobrasocial.FieldByName('imp_prodneto').AsString='' then
          begin
          dmfacturador.cdsosmamovobrasocialimp_prodneto.AsString:='0';
          end;
          if dmfacturador.qosmamovobrasocial.FieldByName('imp_descuento').AsString<>'' then
          begin
          dmfacturador.cdsosmamovobrasocialimp_descuento.AsString:=dmfacturador.qosmamovobrasocial.FieldByName('imp_descuento').AsString;
          end;
          if dmfacturador.qosmamovobrasocial.FieldByName('imp_descuento').AsString='' then
          begin
          dmfacturador.cdsosmamovobrasocialimp_descuento.AsString:='0';
          end;
          if dmfacturador.qosmamovobrasocial.FieldByName('por_descuento').AsString<>'' then
          begin
          dmfacturador.cdsosmamovobrasocialpor_descuento.AsString:=dmfacturador.qosmamovobrasocial.FieldByName('por_descuento').AsString;
          end;
          if dmfacturador.qosmamovobrasocial.FieldByName('por_descuento').AsString='' then
          begin
          dmfacturador.cdsosmamovobrasocialpor_descuento.AsString:='0';
          end;


          dmfacturador.cdsosmamovobrasocial.Post;
          dmfacturador.qosmamovobrasocial.next;

       end;

if not dmfacturador.qbusquedacomprob.IsEmpty then
begin
imprimir.Enabled:=true;

end;
form.close;

end;

procedure Tfbusquedacomprob.imprimirClick(Sender: TObject);
var
i: integer;
r: TRect;
cantidad: integer;
OS: STRING;
CO: STRING;
imptotal: double;
numimpresora: integer;
reg : tregistry;
begin

gBUSQUEDACOMPROB.DataSource.DataSet.First;
While not gBUSQUEDACOMPROB.DataSource.DataSet.Eof do
  BEGIN
        if Gbusquedacomprob.Fields[16].AsString='O' then
      BEGIN

      OS:=Gbusquedacomprob.Fields[12].AsString
      END;
      if Gbusquedacomprob.Fields[16].AsString='C' then
      BEGIN

      CO:=Gbusquedacomprob.Fields[12].AsString
      END;


    gBUSQUEDACOMPROB.DataSource.DataSet.NEXT;
  END;



pbusqueda.TabIndex:=1;
memoimpresion.Clear;
memoimpresion.Lines.Add('FECHA: '+(Gbusquedacomprob.Fields[4].AsString));
memoimpresion.Lines.Add('Nro. Comprobante:'+'....'+(Gbusquedacomprob.Fields[0].AsString)+' '+Gbusquedacomprob.Fields[1].AsString);
memoimpresion.Lines.Add('Nro. Afiliado: '+ (Gbusquedacomprob.Fields[14].AsString));
memoimpresion.Lines.Add('Nombre Cliente: '+ (Gbusquedacomprob.Fields[8].AsString));
memoimpresion.Lines.Add('Codigo Plan: '+ (Gbusquedacomprob.Fields[11].AsString));
memoimpresion.Lines.Add('Nombre Vendedor: '+ (Gbusquedacomprob.Fields[2].AsString));
memoimpresion.Lines.Add('Nombre OS: '+ OS);
memoimpresion.Lines.Add('Nombre Co: '+ CO);
memoimpresion.Lines.Add('Fecha receta: '+ (Gbusquedacomprob.Fields[13].AsString));
memoimpresion.Lines.Add('Matricula: '+ (Gbusquedacomprob.Fields[15].AsString));
memoimpresion.Lines.Add('Productos: ');

memoimpresion.Lines.Add(cadLongitudFija ('NOMBRE',  25, false, ' ')+cadLongitudFija ('CANT', 5, false, ' ')+cadLongitudFija ('IMP',  8, false, ' ')+cadLongitudFija ('%DTO',  12, false, ' '));
memoimpresion.Lines.Add('--------------------------------------------------------------------------------');
gdetalle.DataSource.DataSet.First;
imptotal:=0;
While not gdetalle.DataSource.DataSet.Eof do
  BEGIN
  i:=i+1;
  memoimpresion.Lines.Add(cadLongitudFija (gdetalle.Fields[2].AsString, 25, false, ' ')+cadLongitudFija (INTTOSTR(gdetalle.Fields[3].Asinteger), 5, false, ' ')+cadLongitudFija ('$'+FLOATTOSTR(gdetalle.Fields[4].asfloat*gdetalle.Fields[3].asinteger), 8, false, ' ')+cadLongitudFija ('%'+FLOATTOSTR(gdetalle.Fields[7].asFLOAT), 4, false, ' ')+cadLongitudFija ('$'+FLOATTOSTR(gdetalle.Fields[6].asFLOAT), 4, false, ' '));
  cantidad:=cantidad+(gdetalle.Fields[3].Asinteger);
  imptotal:=imptotal+(gdetalle.Fields[4].asfloat*gdetalle.Fields[3].asinteger);
  gdetalle.DataSource.DataSet.Next;
  END;

memoimpresion.Lines.Add('--------------------------------------------------------------------------------');

memoimpresion.Lines.Add('');
memoimpresion.Lines.Add('TOTAL UNIDADES: '+inttostr(cantidad));
memoimpresion.Lines.Add('');
memoimpresion.Lines.Add('Importe total: '+floattostr(imptotal));
memoimpresion.Lines.Add('');
memoimpresion.Lines.Add('Importe Neto: '+'$ '+GBUSQUEDACOMPROB.Fields[6].ASSTRING);
memoimpresion.Lines.Add('');
memoimpresion.Lines.Add('Importe Cobertura: '+'$ '+GBUSQUEDACOMPROB.Fields[10].ASSTRING);
memoimpresion.Lines.Add('');
memoimpresion.Lines.Add('');
memoimpresion.Lines.Add('--------------------------------------------------------------------------------');
memoimpresion.Lines.Add(' ');
memoimpresion.Lines.Add(' ');
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);


with Printer do
          begin
            numImpresora:=getImpresora(reg.ReadString('IMPRESORA'));
            Printer.PrinterIndex:=numImpresora;
            BeginDoc;
            canvas.Font.Name:='Bitstream Vera Sans Mono';
            canvas.Font.Size:=8;
            Canvas.Brush.Style := bsClear;

            for i := 0 to Memoimpresion.Lines.Count do
             Canvas.TextOut(40,150 + (i *
                         Canvas.TextHeight(Memoimpresion.Lines.Strings[i])),
                         Memoimpresion.Lines.Strings[i]);

            Canvas.Brush.Color := clBlack;
            Canvas.FrameRect(r);
            EndDoc;


          end;
end;


procedure Tfbusquedacomprob.BlimpiartodoClick(Sender: TObject);
begin
dmfacturador.cdsosmamovobrasocial.Close;
dmfacturador.cdsbusquedacomprob.Close;
ecomprob.Clear;
combotipo.ItemIndex:=-1;
imprimir.Enabled:=false;
MEMOIMPRESION.Clear;
PBUSQUEDA.TabIndex:=0;
end;

procedure Tfbusquedacomprob.FormShow(Sender: TObject);

begin
 dmFacturador.AbrirConexion();
 if dmfacturador.tpanel1.InTransaction then
 begin
   dmfacturador.tpanel1.Rollback;
 end;

 dmfacturador.qcomprobante.Close;
 dmfacturador.qcomprobante.SQL.Clear;
 dmfacturador.qcomprobante.SQL.Append('select TIP_COMPROBANTE, TIP_IMPRE from vtmatipcomprob  order by 1 desc');
 dmfacturador.qcomprobante.Open;
 dmfacturador.qcomprobante.First;
  while not dmfacturador.qcomprobante.Eof do
  begin
    combotipo.Items.Add(dmfacturador.qcomprobante.Fields[0].Text);
    dmfacturador.qcomprobante.Next;
  end;

combotipo.ItemIndex:=0;

end;

procedure Tfbusquedacomprob.SetTicket(unTicket: TTicket);
begin
 ticket:=unTicket;
end;

end.

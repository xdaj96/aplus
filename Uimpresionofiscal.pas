unit Uimpresionofiscal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, udticket, math, Vcl.OleCtrls, System.Types,
  unumeracion ,Printers, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ComCtrls, registry;

const
  UM_ACTIVATED = WM_USER + 1;
  RegKey ='Software\Autofarma\APlus\';

type
  Tfimpresionnofiscal = class(TForm)
    memoimpresion: TMemo;
    Image1: TImage;
  procedure setEfectivo(importe:String);
  procedure setTarjeta(importe:String);
  procedure setos(importe:String);
  procedure setcc(importe:String);
  procedure setch(importe:String);
  procedure setco1(importe:String);
  procedure setco2(importe:String);
  procedure Insertarcomprobante;
  procedure nrocomprobante;
  procedure Insertarcomprobantevale;
  procedure SetTicket(unTicket:TTicket);
  Function GetImpresora(Impre:String):Integer;
  procedure UMActivated(var Message: TMessage); message UM_ACTIVATED;
  procedure FormShow(Sender: TObject);
  procedure memoimpresionKeyPress(Sender: TObject; var Key: Char);
  procedure comprobacionnro;
   private
    { Private declarations }
    imp_efectivo: string;
    imp_tarjeta: string;
    imp_cc: string;
    imp_co1: string;
    imp_co2: string;
    imp_ch: string;
    imp_os: string;
    nro_comprob: integer;

  public
  vendedor: string;
  pv: string;
  producto: string;
  preciounitario: double;
  total: double;
  cantidad: integer;
  Ticket:TTicket;
  end;




var
  fimpresionnofiscal: Tfimpresionnofiscal;

implementation

{$R *.dfm}

uses
unofiscal, uticket, UdmFacturador, facturador, uprogreso;

function LeftPad(S: string; Ch: Char; Len: Integer): string;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := S + StringOfChar(Ch, RestLen);
end;

function RightPad(S: string; Ch: Char; Len: Integer): string;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;

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

Function Tfimpresionnofiscal.GetImpresora(Impre:String):Integer;
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

procedure Tfimpresionnofiscal.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;

procedure TFIMPRESIONnofiscal.setEfectivo(importe: String);
begin
  imp_efectivo:=importe;
end;

procedure TFIMPRESIONnofiscal.setTarjeta(importe: String);
begin
   imp_tarjeta:=importe;
end;
procedure TFIMPRESIONnofiscal.setos(importe: String);
begin
  imp_os:=importe;
end;
procedure TFIMPRESIONnofiscal.setcc(importe: String);
begin
  imp_cc:=importe;
end;
procedure TFIMPRESIONnofiscal.setch(importe: String);
begin
  imp_ch:=importe;
end;
procedure TFIMPRESIONnofiscal.setco1(importe: String);
begin
  imp_co1:=importe;
end;
procedure TFIMPRESIONnofiscal.setco2(importe: String);
begin
  imp_co2:=importe;
end;


procedure tfimpresionnofiscal.nrocomprobante;
var
form: tfnumeracion;
i: integer;
sucorigen: string;
begin
i:=0;
  if  ((ticket.comprobante='TKT') OR (ticket.comprobante='TKA') OR (ticket.comprobante='TKB') OR (ticket.comprobante='REM') OR (ticket.comprobante='NCT') OR (ticket.comprobante='NCB') OR (ticket.comprobante='NCA') or (ticket.comprobante='CC4') or (ticket.comprobante='TKM') or (ticket.comprobante='NDA') or (ticket.comprobante='NDB') OR (ticket.comprobante='NDM') OR (ticket.comprobante='NCM'))THEN
   BEGIN
    if APPLICATION.MessageBox(' Desea agregar manualmente la numeracion? ','Numeracion', MB_YESNO or MB_DEFBUTTON2) = IDYES    then
       BEGIN
        dmfacturador.AbrirConexion();
        dmfacturador.qnrocomprob.Close;
        dmfacturador.qnrocomprob.SQL.Text:=concat('select nro_ultimocomp, mar_stock, mar_rankingcompra, mar_rankingventa  from vtmatipcomprob where tip_comprobante=:tipo');
        dmfacturador.qnrocomprob.ParamByName('tipo').AsString:=TICKET.comprobante;
        dmfacturador.qnrocomprob.Open;
        form:=tfnumeracion.Create(self);
        form.SetTicket(ticket);
        form.ShowModal;
        if ticket.nrocomprobantenf='' then
        begin
        ticket.nrocomprobantenf:=floatTOSTR(STRTOfloat(dmfacturador.qnrocomprob.Fields[0].Text)+1);
        end;
        ticket.marstock:=dmfacturador.qnrocomprob.Fields[1].Text;
        ticket.rankingcompra:=dmfacturador.qnrocomprob.Fields[2].Text;
        ticket.rankingventa:=dmfacturador.qnrocomprob.Fields[3].Text;
       END
       ELSE

       BEGIN
        dmfacturador.AbrirConexion();
        dmfacturador.qnrocomprob.Close;
        dmfacturador.qnrocomprob.SQL.Text:=concat('select nro_ultimocomp, mar_stock, mar_rankingcompra, mar_rankingventa  from vtmatipcomprob where tip_comprobante=:tipo');
        dmfacturador.qnrocomprob.ParamByName('tipo').AsString:=TICKET.comprobante;
        dmfacturador.qnrocomprob.Open;
        ticket.nrocomprobantenf:=floatTOSTR(STRTOfloat(dmfacturador.qnrocomprob.Fields[0].Text)+1);
           ticket.marstock:=dmfacturador.qnrocomprob.Fields[1].Text;
        ticket.rankingcompra:=dmfacturador.qnrocomprob.Fields[2].Text;
        ticket.rankingventa:=dmfacturador.qnrocomprob.Fields[3].Text;
       END;


end;

 if not ((ticket.comprobante='TKT') OR (ticket.comprobante='TKA') OR (ticket.comprobante='TKB') OR (ticket.comprobante='REM') OR (ticket.comprobante='NCT') OR (ticket.comprobante='NCB') OR (ticket.comprobante='NCA') or (ticket.comprobante='CC4') or (ticket.comprobante='TKM') or (ticket.comprobante='NDA') or (ticket.comprobante='NDB') OR (ticket.comprobante='NDM') ) THEN
    BEGIN
        dmfacturador.AbrirConexion();
        dmfacturador.qnrocomprob.Close;
        dmfacturador.qnrocomprob.SQL.Text:=concat('select nro_ultimocomp, mar_stock, mar_rankingcompra, mar_rankingventa  from vtmatipcomprob where tip_comprobante=:tipo');
        dmfacturador.qnrocomprob.ParamByName('tipo').AsString:=TICKET.comprobante;
        dmfacturador.qnrocomprob.Open;
        ticket.nrocomprobantenf:=floatTOSTR(STRTOfloat(dmfacturador.qnrocomprob.Fields[0].Text)+1);
        ticket.marstock:=dmfacturador.qnrocomprob.Fields[1].Text;
        ticket.rankingcompra:=dmfacturador.qnrocomprob.Fields[2].Text;
        ticket.rankingventa:=dmfacturador.qnrocomprob.Fields[3].Text;

    end;
 dmfacturador.AbrirConexion();
 dmfacturador.nsucursal.Close;
 dmfacturador.nsucursal.SQL.Text:='select nom_sucursal from sumasucursal where nro_sucursal=:suc';
 dmfacturador.nsucursal.ParamByName('suc').AsString:=ticket.sucursal;
 dmfacturador.nsucursal.Open;
sucorigen:=dmfacturador.nsucursal.Fields[0].Text;



comprobacionnro;
memoimpresion.Font.Name:='Bitstream Vera Sans Mono';
memoimpresion.Font.Size:=8;
memoimpresion.Lines.Add('FECHA: '+(TICKET.fechaactual));
memoimpresion.Lines.Add('Nro. Comprobante:'+'......'+ticket.comprobante+' '+ticket.nrocomprobantenf);
if ticket.afiliado_numero<>'' then
begin
  memoimpresion.Lines.Add('Nro. Afiliado: '+ TICKET.afiliado_numero);
end;
if ticket.afiliado_numeroco1<>'' then
begin
  memoimpresion.Lines.Add('Nro. Afiliado: '+ TICKET.afiliado_numeroco1);
end;
if ticket.afiliado_numeroco2<>'' then
begin
  memoimpresion.Lines.Add('Nro. Afiliado: '+ TICKET.afiliado_numeroco2);
end;

//memoimpresion.Lines.Add('Nro. Afiliado: '+ TICKET.afiliado_numero);
memoimpresion.Lines.Add('Sucursal Origen: '+ sucorigen);
if ticket.comprobante<>'ING' then
BEGIN
  if ticket.codigo_OS<>'' then
   begin
      memoimpresion.Lines.Add('Nombre Cliente: '+ TICKET.afiliado_nombre+' '+TICKET.afiliado_apellido);
      memoimpresion.Lines.Add('Obra social: '+ ticket.codigo_OS+'-'+TICKET.nombre_os);
   end;
   if ticket.codigo_Co1<>'' then
   begin
      memoimpresion.Lines.Add('Nombre Cliente: '+ TICKET.afiliado_nombreco1+' '+TICKET.afiliado_apellidoco1);
      memoimpresion.Lines.Add('Obra social: '+ ticket.codigo_Co1+'-'+TICKET.nombre_co1);
   end;
    if ticket.codigo_Cos2<>'' then
   begin
      memoimpresion.Lines.Add('Nombre Cliente: '+ TICKET.afiliado_nombreco2+' '+TICKET.afiliado_apellidoco2);
      memoimpresion.Lines.Add('Obra social: '+ ticket.codigo_Cos2+'-'+TICKET.nombre_cos2);
   end;
END;
memoimpresion.Lines.Add('Nombre Cliente: '+ ticket.DESCRIPCIONCLIENTE);
if ticket.comprobante='ING' then
BEGIN
memoimpresion.Lines.Add('Nombre Cliente: '+ ticket.DESCRIPCIONCLIENTE);
END;
memoimpresion.Lines.Add('Nro. receta: '+ ticket.numero_receta);
memoimpresion.Lines.Add('CUIT Cliente: '+ ticket.CUIT);
memoimpresion.Lines.Add('Nombre Vendedor: '+ ticket.nom_vendedor);
memoimpresion.Lines.Add('Productos: ');
memoimpresion.Lines.Add(' ');
memoimpresion.Lines.Add(' ');
memoimpresion.Lines.Add(cadLongitudFija ('NOMBRE',  25, false, ' ')+cadLongitudFija ('CANT', 5, false, ' ')+cadLongitudFija ('IMP',  7, false, ' '));
memoimpresion.Lines.Add('--------------------------------------------------------------------------------');
ffacturador.Gfacturador.DataSource.DataSet.First;
While not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  BEGIN
  i:=i+1;
  memoimpresion.Lines.Add(cadLongitudFija (ffacturador.Gfacturador.Fields[1].AsString, 25, false, ' ')+cadLongitudFija ('('+INTTOSTR(ffacturador.Gfacturador.Fields[3].Asinteger)+')', 5, false, ' ')+cadLongitudFija ('$'+FLOATTOSTR(ffacturador.Gfacturador.Fields[2].asfloat*ffacturador.Gfacturador.Fields[3].Asinteger), 7, false, ' '));
  cantidad:=cantidad+(ffacturador.Gfacturador.Fields[3].Asinteger);
  ffacturador.Gfacturador.DataSource.DataSet.Next;
  END;

memoimpresion.Lines.Add('--------------------------------------------------------------------------------');
memoimpresion.Lines.Add(' ');
memoimpresion.Lines.Add(' ');
memoimpresion.Lines.Add('TOTAL UNIDADES: '+inttostr(cantidad));
memoimpresion.Lines.Add('');
memoimpresion.Lines.Add('TOTAL EFECTIVO: '+'$ '+IMP_EFECTIVO);
memoimpresion.Lines.Add('');
memoimpresion.Lines.Add('TOTAL TARJETA: '+'$ '+IMP_TARJETA);
memoimpresion.Lines.Add('');
memoimpresion.Lines.Add('TOTAL CC: '+'$ '+IMP_CC+ '  CODIGO: '+ TICKET.codigocc);
memoimpresion.Lines.Add('');
memoimpresion.Lines.Add('TOTAL CHEQUE: '+'$ '+IMP_CH);
memoimpresion.Lines.Add('');
memoimpresion.Lines.Add('TOTAL OS: '+ticket.codigo_OS+' $ '+IMP_OS);
memoimpresion.Lines.Add('');
memoimpresion.Lines.Add('TOTAL CO1: '+ticket.codigo_Co1+' $ '+IMP_CO1);
memoimpresion.Lines.Add('');
memoimpresion.Lines.Add('TOTAL CO2: '+'$ '+IMP_CO2);
memoimpresion.Lines.Add('');


end;


procedure Tfimpresionnofiscal.comprobacionnro;
var
chequeo: integer;
begin
chequeo:=0;

//---------------------vtmacomprobante---------------------//

        dmfacturador.AbrirConexion();
        dmfacturador.qnrocomprob.Close;
        dmfacturador.qnrocomprob.SQL.Text:=concat('select * from vtmacomprobemitido where nro_comprobante=:comprobante and tip_comprobante=:tipo');
        dmfacturador.qnrocomprob.ParamByName('comprobante').AsString:=ticket.nrocomprobantenf;
        dmfacturador.qnrocomprob.ParamByName('tipo').AsString:=ticket.comprobante;

        dmfacturador.qnrocomprob.Open;

if dmfacturador.qnrocomprob.RecordCount>0 then
begin

chequeo:=chequeo+1;


end;

//---------------------vtmadetalle---------------------//






//-------------------vtmaporcentajesiva----------------------//





//----------------vttpagocheque---------------------//




//------------------vttpagoefectivo-----------------//




//------------------vttpagotarjeta-----------------//




//------------------vttpagoctacte-----------------//



//-----------------VTMADESCCOMPROB----------------//





//-----------------VTMADETALLEAFILOS----------------//



//-----------------OSMAMOVOBRASOCIAL----------------//



//-----------------OSMADETALLEMOV ----------------//





if chequeo>0 then
begin

ticket.nrocomprobantenf:=floattostr(STRTOfloat(ticket.nrocomprobantenf)+1);
comprobacionnro;


end;

if chequeo=0 then
begin

//break;

end;





end;

procedure Tfimpresionnofiscal.FormShow(Sender: TObject);
var
i:integer;
 r: TRect;
  e: Integer;
  PRINT: string;
  DESCRIPCION: string;
  PRECIO: string;
  cantidad: integer;

 form: tfprogreso;

begin
cantidad:=0;
        if imp_efectivo='' then
        begin
          imp_efectivo:='0';
        end;
        if imp_tarjeta='' then
         begin
           imp_tarjeta:='0';
         end;
        if imp_cc='' then
         begin
           imp_cc:='0';
         end;
        if imp_os='' then
         begin
           imp_os:='0';
         end;
         if imp_co1='' then
         begin
           imp_co1:='0';
         end;
         if imp_co2='' then
         begin
           imp_co2:='0';
         end;
         if imp_ch='' then
         begin
           imp_ch:='0';
         end;
         if imp_cc='' then
         begin
           imp_cc:='0';
         end;

//  form:=tfprogreso.Create(self);

//  form.Show;
  //-------------------------tablas ivas-------------------------------//
  dmfacturador.qtablaiva.Close;
  dmfacturador.qtablaiva.SQL.Text:=concat('select cod_iva, por_iva from prmaiva');
  dmfacturador.qtablaiva.Open;
  dmfacturador.qtablaiva.First;
  while not dmfacturador.qtablaiva.Eof do
  begin
  if dmfacturador.qtablaiva.Fields[0].Text='A' THEN
  BEGIN
    TICKET.IVAA:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
  if dmfacturador.qtablaiva.Fields[0].Text='B' THEN
  BEGIN
    TICKET.IVAB:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
    if dmfacturador.qtablaiva.Fields[0].Text='C' THEN
  BEGIN
    TICKET.IVAC:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
    if dmfacturador.qtablaiva.Fields[0].Text='D' THEN
  BEGIN
    TICKET.IVAD:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
      if dmfacturador.qtablaiva.Fields[0].Text='E' THEN
  BEGIN
    TICKET.IVAE:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
      if dmfacturador.qtablaiva.Fields[0].Text='F' THEN
  BEGIN
    TICKET.IVAF:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
      if dmfacturador.qtablaiva.Fields[0].Text='s' THEN
  BEGIN
    TICKET.IVAs:=dmfacturador.qtablaiva.Fields[1].AsFloat;
  END;
  dmfacturador.qtablaiva.Next;
  end;

  //-------------------------tablas ivas-------------------------------//

nrocomprobante;
form:=tfprogreso.Create(self);
FORM.Show;
application.ProcessMessages;
insertarcomprobante;
if dmfacturador.transcomprob.InTransaction then
      begin
       dmfacturador.transcomprob.Rollback;
      end;
  dmfacturador.AbrirConexion();
  dmfacturador.qnrocomprob.Close;
  dmfacturador.qnrocomprob.SQL.Text:=concat('UPDATE vtmatipcomprob SET nro_ultimocomp=:numeroultimo   where tip_comprobante=:TIPO');
  dmfacturador.qnrocomprob.ParamByName('tipo').AsString:=TICKET.comprobante;
  dmfacturador.qnrocomprob.ParamByName('numeroultimo').AsString:=ticket.nrocomprobantenf;
  dmfacturador.qnrocomprob.Open;
  dmfacturador.transcomprob.Commit;




form.Close;
end;

procedure Tfimpresionnofiscal.insertarcomprobante;
var
i: integer;
iva: double;
 condIva:String;
 //importeTotal
  baseImponible, importeIva, unaTasa:Double;
 unaTasaIVA:TTasaIVA;
stockparcial: integer;

begin



 //INSERTAR VTMACOMPROBANTE  VR

           if dmfacturador.ticomprobante.InTransaction then
             begin
              dmfacturador.ticomprobante.Rollback;
              end;
            dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

            dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
            dmfacturador.icomprobante.Close;
            dmfacturador.icomprobante.SQL.Clear;


            dmfacturador.icomprobante.Close;
            dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMACOMPROBEMITIDO                                 ',
                                                         ' (NRO_SUCURSAL,                                              ',
                                                         ' TIP_COMPROBANTE,                                          ',
                                                         ' NRO_COMPROBANTE,                                        ',
                                                         ' NRO_CAJA,                                             ',
                                                         ' COD_VENDEDOR,                                       ',
                                                         ' NRO_TRANSACCION,                                  ',
                                                         ' COD_CLIENTE,                                    ',
                                                         ' NOM_CLIENTE,                                  ',
                                                         ' COD_PROVEEDOR,                              ',
                                                         ' FEC_COMPROBANTE,                          ',
                                                         ' DES_LEYENDA,                            ',
                                                         ' FEC_PROXVENC_RECETA,                  ',
                                                         ' MAR_TRATAMIENTO,                    ',
                                                         ' CAN_REIMPRESO,                    ',
                                                         ' MAR_ANULADO,                    ',
                                                         ' NRO_SUC_CANCELADO,            ',
                                                         ' TIP_COMPROB_CANCELADO,      ',
                                                         ' NRO_COMPROB_CANCELADO,    ',
                                                         ' FEC_COMPROB_CANCELADO,  ',
                                                          'DES_PARTICULARIDAD,   ',
                                                          'MAR_ODONTOLOGO,                                                ',
                                                          'NRO_PBM,                                                      ',
                                                          'NOM_MEDICO,                                                  ',
                                                          'CAN_ITEMS,                                                  ',
                                                          'IMP_FINANC,                                                ',
                                                          'IMP_NETO,                                                 ',
                                                          'IMP_BRUTO,                                                ',
                                                         ' IMP_INTERES,                                             ',
                                                         ' IMP_GENTILEZA_FARM,                                      ',
                                                         ' MAR_PASOXCAJA,                                           ',
                                                         ' MAR_IMPRE_SUBDIA,                                      ',
                                                         ' MAR_IMPRESO_FISCAL,                                  ',
                                                         ' CAN_REIMPRESO_AUD,                                 ',
                                                         ' IMP_VALES,                                       ',
                                                         ' IMP_SALDO,                                     ',
                                                         ' FEC_REF,                                     ',
                                                         ' FEC_OPERATIVA,                             ',
                                                         ' MAR_RESERVADO,                           ',
                                                         ' IMP_APAGAR,                            ',
                                                         ' IMP_PERCEPCION,                      ',
                                                         ' MAR_ORIGEN,                        ',
                                                         ' COD_CLINICA,                     ',
                                                         ' NOM_CLINICA,                   ',
                                                         ' COD_AUTORIZACION,            ',
                                                         ' POR_GENTILEZA_FARM,        ',
                                                         ' POR_IVA)                 ',
                                                         ' VALUES (               ',
                                                         ' :sucursal,           ',
                                                         ' :tkcomprobante,                                      ',
                                                         ' :nrocomprobante,                                    ',
                                                         ' :caja,                                          ',
                                                         ' :vendedor,                                    ',
                                                         ' :transaccion,                               ',
                                                         ' :cod_cliente,                             ',
                                                         ' :nom_cliente,                           ',
                                                         ' NULL,                                 ',
                                                         ' :fec_comprobante,                   ',
                                                         ' '''',                               ',
                                                         ' :fec_receta,                    ',
                                                         ' :mar_tratamiento,             ',
                                                         ' 0,                          ',
                                                         ' ''N'',                      ',
                                                         ' :sucursal,              ',
                                                         ' NULL,                 ',
                                                         ' NULL,                 ',
                                                         ' NULL,                                   ',
                                                         ' '''',                                    ',
                                                         ' ''N'',                                  ',
                                                         ' -1,                                  ',
                                                         ' :MEDICO,                            ',
                                                         ' :CANTIDADINTEMS,                   ',
                                                         ' 0,                                ',
                                                         ' :IMP_NETO,                        ',
                                                         ' :IMP_BRUTO,                      ',
                                                         ' 0,                              ',
                                                         ' 0,                             ',
                                                         ' :PASOXCAJA,                   ',
                                                         ' NULL,                         ',
                                                         ' ''S'',                         ',
                                                         ' 0,                          ',
                                                         ' 0,                         ',
                                                         ' :SALDOCC,                  ',
                                                         ' :FEC_REF,                 ',
                                                         ' :FEC_OPERATIVA,          ',
                                                         ' NULL,                   ',
                                                         ' NULL,                  ',
                                                         ' 0,                    ',
                                                         ' ''F'',                 ',
                                                         ' NULL,               ',
                                                         ' NULL,               ',
                                                         ' :CODAUTORIZACION, ',
                                                         ' NULL, ',
                                                         ' NULL)');



        dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TKCOMPROBANTE').ASSTRING:=ticket.comprobante;
        dmfacturador.icomprobante.ParamByName('NROCOMPROBANTE').ASSTRING:=ticket.nrocomprobantenf;
        if TICKET.nro_caja='999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('CAJA').ASSTRING:='';
        END;
        if TICKET.nro_caja<>'999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('CAJA').ASSTRING:=TICKET.nro_caja;
        END;
        dmfacturador.icomprobante.ParamByName('VENDEDOR').ASSTRING:=ticket.cod_vendedor;
        dmfacturador.icomprobante.ParamByName('TRANSACCION').AsString:=inttostr(nro_comprob);
        dmfacturador.icomprobante.ParamByName('COD_CLIENTE').AsString:=ticket.codigocliente;
        dmfacturador.icomprobante.ParamByName('nom_cliente').AsString:=ticket.DESCRIPCIONCLIENTE;
        dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDatetime:=ticket.fechafiscal;
        dmfacturador.icomprobante.ParamByName('fec_receta').asdate:=ticket.fecha_receta;
        if TICKET.codigo_tratamiento='' then
        BEGIN
        TICKET.codigo_tratamiento:='N';
        dmfacturador.icomprobante.ParamByName('mar_tratamiento').AsString:=TICKET.codigo_tratamiento;
        END;
         if TICKET.codigo_tratamiento<>'' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('mar_tratamiento').AsString:=TICKET.codigo_tratamiento;
        END;
        dmfacturador.icomprobante.ParamByName('sucursal').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('MEDICO').AsString:=ticket.medico_apellido+ticket.medico_nombre;
        dmfacturador.icomprobante.ParamByName('CANTIDADINTEMS').Asinteger:=ticket.itemstotales;
        dmfacturador.icomprobante.ParamByName('IMP_NETO').AsFloat:=ticket.importeneto;
        dmfacturador.icomprobante.ParamByName('IMP_BRUTO').AsFloat:=ticket.importebruto;
         if TICKET.nro_caja='999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('PASOXCAJA').ASSTRING:='N';
        END;
        if TICKET.nro_caja<>'999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('PASOXCAJA').ASSTRING:='S';
        END;

        dmfacturador.icomprobante.ParamByName('SALDOCC').ASFLOAT:=TICKEt.saldocc;
        dmfacturador.icomprobante.ParamByName('FEC_REF').ASstring:=TICKEt.fechaactual;
        if TICKET.nro_caja='999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('FEC_OPERATIVA').asstring:='';
        END;
        if TICKET.nro_caja<>'999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('FEC_OPERATIVA').AsDate:=ticket.fec_operativa;
        END;
        dmfacturador.icomprobante.ParamByName('CODAUTORIZACION').AsString:=ticket.valnroreferencia;
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;







 //INSTERTAR VTMADETALLECOMPROB -----------------------------------------// VR



  if dmfacturador.ticomprobante.InTransaction then
      begin
       dmfacturador.ticomprobante.Rollback;
      end;
            dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

            dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
            dmfacturador.icomprobante.Close;
            dmfacturador.icomprobante.SQL.Clear;


            dmfacturador.icomprobante.Close;
            dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMADETALLECOMPROB ',
                                                        '(NRO_SUCURSAL,                  ',
                                                        'TIP_COMPROBANTE,                 ',
                                                        'NRO_COMPROBANTE,                  ',
                                                        'NRO_ITEM,                          ',
                                                        'COD_ALFABETA,                       ',
                                                        'NOM_PRODUCTO,                        ',
                                                        'CAN_CANTIDAD,                         ',
                                                        'IMP_UNITARIO,                          ',
                                                        'IMP_IVADESC,                            ',
                                                        'IMP_IVA_NETO,                            ',
                                                        'IMP_IVATASA,                              ',
                                                        'IMP_PRODNETO,                              ',
                                                        'IMP_GENTILEZA_FARM,                         ',
                                                        'MAR_MODIF,                                   ',
                                                        'MAR_MOTVENTA,                                 ',
                                                        'CAN_VALE,                                      ',
                                                        'TIP_VALE,                                       ',
                                                        'COD_PROD_REC,                                   ',
                                                        'COD_AUTORIZACION)                               ',
                                                        '                                                ',
                                                        'VALUES (:nro_sucursal,                          ',
                                                        ':TIP_COMPROBANTE,                                        ',
                                                        ':nro_comprobante,                               ',
                                                        ':nro_item,                                      ',
                                                        ':cod_alfabeta,                                  ',
                                                        ':nom_producto,                                  ',
                                                        ':cantidad,                                      ',
                                                        ':imp_unitario,                                  ',
                                                        ':IMP_IVADESC,                                   ',
                                                        ':IMP_IVANETO,                                   ',
                                                        ':IMP_IVATASA,                                   ',
                                                        ':IMP_PRODNETO,                                  ',
                                                        '0,                                              ',
                                                        '''N'',                                          ',
                                                        'NULL,                                           ',
                                                        '0,                                              ',
                                                        'NULL,                                           ',
                                                        'NULL,                                           ',
                                                        ''''');');


i:=0;

ffacturador.Gfacturador.DataSource.DataSet.first;
while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
    i:=i+1;
     dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').asstring:=TICKET.comprobante;
     dmfacturador.icomprobante.ParamByName('nro_sucursal').asstring:=ticket.sucursal;
     dmfacturador.icomprobante.parambyname('nro_comprobante').AsString:=ticket.nrocomprobantenf;
     dmfacturador.icomprobante.ParamByName('nro_item').Asinteger:=i;
     dmfacturador.icomprobante.parambyname('cod_alfabeta').Asinteger:=ffacturador.Gfacturador.Fields[8].AsInteger;
     dmfacturador.icomprobante.parambyname('nom_producto').asstring:=ffacturador.Gfacturador.Fields[1].AsString;
     dmfacturador.icomprobante.parambyname('cantidad').asinteger:=ffacturador.Gfacturador.Fields[3].Asinteger;
     dmfacturador.icomprobante.parambyname('imp_unitario').asfloat:=ffacturador.Gfacturador.Fields[2].asfloat;

     //----------cuando tiene obra social o coseguro cambia el campo del iva--------------------///
  if not ((ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') or (ticket.codigo_Cos2<>''))  then
  begin
    if ffacturador.Gfacturador.fields[10].AsString='B' then
    begin
    iva:=(ticket.IVAB/100)+1;
     dmfacturador.icomprobante.parambyname('imp_ivaneto').AsFloat:=ffacturador.Gfacturador.Fields[6].asfloat-(ffacturador.Gfacturador.Fields[6].asfloat/iva);
     dmfacturador.icomprobante.parambyname('imp_ivadesc').AsFloat:=0;
    end;
    if ffacturador.Gfacturador.fields[10].AsString<>'B' then
    begin
    iva:=0;
     dmfacturador.icomprobante.parambyname('imp_ivaneto').AsFloat:=ffacturador.Gfacturador.Fields[6].asfloat*iva;
     dmfacturador.icomprobante.parambyname('imp_ivadesc').AsFloat:=0;
    end;

  end;


    if (ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') or (ticket.codigo_Cos2<>'')  then
  begin
    if ffacturador.Gfacturador.fields[10].AsString='B' then
    begin
    iva:=(ticket.IVAB/100)+1;
     dmfacturador.icomprobante.parambyname('imp_ivadesc').AsFloat:=ffacturador.Gfacturador.Fields[6].asfloat-(ffacturador.Gfacturador.Fields[6].asfloat/iva);
     dmfacturador.icomprobante.parambyname('imp_ivaneto').AsFloat:=0;
    end;
    if ffacturador.Gfacturador.fields[10].AsString<>'B' then
    begin
    iva:=0;
     dmfacturador.icomprobante.parambyname('imp_ivadesc').AsFloat:=ffacturador.Gfacturador.Fields[6].asfloat*iva;
     dmfacturador.icomprobante.parambyname('imp_ivaneto').AsFloat:=0;
    end;
//----------cuando tiene obra social o coseguro cambia el campo del iva--------------------///
  end;
    dmfacturador.icomprobante.parambyname('imp_ivatasa').AsFloat:=0;
    dmfacturador.icomprobante.parambyname('imp_prodneto').AsFloat:=ffacturador.Gfacturador.Fields[6].asfloat-ffacturador.Gfacturador.Fields[4].asfloat;
    dmfacturador.icomprobante.Open;
    dmFacturador.ticomprobante.Commit;
    ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;



 //INSERTAR VTMAPORCENTAJESIVA   ----VR LLEVA PERO TODOS LOS VALORES EN 0

if dmfacturador.ticomprobante.InTransaction  then
dmfacturador.ticomprobante.Rollback;

dmfacturador.ticomprobante.StartTransaction;
dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
dmfacturador.icomprobante.Close;
dmfacturador.icomprobante.SQL.Clear;


dmfacturador.icomprobante.Close;
dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMAPORCENTAJESIVA                        ',
                                            '(NRO_SUCURSAL,                                       ',
                                            'TIP_COMPROBANTE,                                     ',
                                            'NRO_COMPROBANTE,                                     ',
                                            'NRO_ITEM,                                           ',
                                            'POR_PORCENTAJE,                                     ',
                                            'POR_SOBRETASA,                                     ',
                                            'IMP_NETOGRAV,                                      ',
                                            'IMP_IVA,                                         ',
                                            'IMP_IVASOBRETASA,                              ',
                                            'IMP_NETOGRAV_DESC,                           ',
                                            'IMP_IVA_DESC,                              ',
                                            'IMP_IVASOBRETASA_DESC)                   ',
                                            '                                       ',
                                            'VALUES (:nro_sucursal,                   ',
                                            ':tip_comprobante,  ',
                                            ':nro_comprobante,                ',
                                            ':nro_item,                     ',
                                            ':por_porcentaje,             ',
                                            ':por_sobretasa,            ',
                                            ':imp_netograv,            ',
                                            ':imp_iva,                ',
                                            ':imp_ivasobretasa,     ',
                                            ':imp_netograv_desc,   ',
                                            ':imp_iva_desc,      ',
                                            'NULL);');

i:=0;

for condIVA in ticket.TotalesIVA.Keys do
Begin
  i:=i+1;
  ticket.TotalesIVA.TryGetValue(condIVa, unaTasaIVA);
  dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').asstring:=TICKET.comprobante;
  dmfacturador.icomprobante.ParamByName('nro_sucursal').asstring:=ticket.sucursal;
  dmfacturador.icomprobante.parambyname('nro_comprobante').AsString:=ticket.nrocomprobantenf;
  dmfacturador.icomprobante.ParamByName('nro_item').Asinteger:=i;

  //Obtener la tasa de iva de la tabla PRMAIVA con la condicion condIVA
  if condIVA ='A' then unaTasa:=ticket.IVAA
  else if condIVA=  'B' then unaTasa:=ticket.ivab
  else if condIVA='D' then unaTasa:=ticket.ivad
  else if condIVA=  'E' then unaTasa:=ticket.ivae
  else if condIVA=  's' then unaTasa:=ticket.ivas;


  //Si es S poner el monto sobretrasa sino 0
  iva:=unaTasa/100;
  baseImponible:=unaTasaIVA.importeTotal /(1+iva);
  importeIVA:=baseImponible*iva;

  dmfacturador.icomprobante.parambyname('por_sobretasa').asstring:='0';
  dmfacturador.icomprobante.parambyname('por_porcentaje').AsFloat:=unaTasa;


  dmfacturador.icomprobante.parambyname('imp_netograv').asfloat:=unaTasaIVA.netogravado;
  dmfacturador.icomprobante.parambyname('imp_netograv_desc').AsFloat:=unaTasaIVA.netogravadodesc;

  dmfacturador.icomprobante.parambyname('imp_iva').asfloat:= unaTasaIVA.netogravado*iva;

  dmfacturador.icomprobante.parambyname('imp_iva_desc').AsFloat:=unaTasaIVA.netogravadodesc*iva;

  dmfacturador.icomprobante.parambyname('imp_ivasobretasa').AsFloat:=0;
  dmfacturador.icomprobante.Open;
  dmfacturador.ticomprobante.Commit;
  End;




 //INSERTAR VTTBPAGOCHEQUE          --VR LLEVA TODOS LOS MEDIOS DE PAGO

if strtofloat(imp_CH)<>0 then
begin
     if dmfacturador.ticomprobante.InTransaction  then
    dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

    dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;


    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTTBPAGOCHEQUE (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_BANCO, COD_CTA, NRO_CHEQUE, IMP_CHEQUE) VALUES (:sucursal,:tip_comprobante, :nro_comprobante, :cod_banco, '''', :nro_cheque, :importe_cheque);');



    dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobante').AsString:=ticket.nrocomprobantenf;
    dmfacturador.icomprobante.ParamByName('cod_banco').AsString:=ticket.codigocheque;
    dmfacturador.icomprobante.ParamByName('nro_cheque').AsString:=ticket.numerocheque;
    dmfacturador.icomprobante.ParamByName('importe_cheque').AsFloat:=strtofloat(imp_ch);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

end;

//INSTERTAR VTTPAGOCTACTE

if strtofloat(imp_CC)<>0 then
        begin
         if dmfacturador.ticomprobante.InTransaction  then
        dmfacturador.ticomprobante.Rollback;

        dmfacturador.ticomprobante.StartTransaction;
        dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

        dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Clear;


        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTTBPAGOCTACTE ',
                                                   '(NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_CTACTE, COD_SUBCTA, COD_AUTORIZACTA, IMP_CTACTE, IMP_SALDO, ',
                                                   ' MAR_RESUMIDO, NRO_SUCURSAL_LIQ, NRO_LIQUIDACION, CAN_CUOTAS, CAN_CUOTASPEN, POR_IVA, CODIGOPAGO) ',
                                                   ' VALUES (:NRO_SUCURSAL,:TIP_COMPROBANTE , :NRO_COMPROB, :COD_CTACTE, :COD_SUBCTA, '''', :IMP_CTACTE, :IMP_SCTACTE, ''N'', 0, NULL, 0, 0, NULL, NULL)');


        dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
        dmfacturador.icomprobante.ParamByName('nro_comprob').AsString:=ticket.nrocomprobantenf;
        dmfacturador.icomprobante.ParamByName('COD_CTACTE').AsString:=ticket.codigocc;
        dmfacturador.icomprobante.ParamByName('cod_subcta').AsString:=ticket.codigosubcc;
        dmfacturador.icomprobante.ParamByName('imp_ctacte').AsFloat:=strtofloat(imp_cc);
        dmfacturador.icomprobante.ParamByName('imp_sctacte').AsFloat:=strtofloat(imp_cc);
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;

end;

//INSERTAR VTTPAGOEFECTIVO

 if strtofloat(imp_efectivo)<>0 then
        begin
         if dmfacturador.ticomprobante.InTransaction  then
        dmfacturador.ticomprobante.Rollback;

        dmfacturador.ticomprobante.StartTransaction;
        dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

        dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Clear;


        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTTBPAGOEFECTIVO (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_MONEDA, IMP_EFECTIVO, IMP_COTIZ, POR_IVA)',
                                                   ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, ''$'', :IMP_EFECTIVO, NULL, NULL)');


        dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
        dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
        dmfacturador.icomprobante.ParamByName('imp_EFECTIVO').AsFloat:=strtofloat(imp_efectivo);
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;

        end;





 //INSERTAR VTTBPAGOTARJETA


 if strtofloat(imp_tarjeta)<>0 then
        begin
         if dmfacturador.ticomprobante.InTransaction  then
        dmfacturador.ticomprobante.Rollback;

        dmfacturador.ticomprobante.StartTransaction;
        dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

        dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Clear;


        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTTBPAGOTARJETA (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_TARJETA, NRO_TARJETA, COD_MONEDA, NRO_CUPON, ',
                                                   ' IMP_TARJETA, IMP_COTIZ, NRO_CUOTA, NRO_AUTORIZACION, NRO_LIQUIDACION, FEC_VENCIMIENTO, NRO_PIN, POR_IVA, CODIGOPAGO)',
                                                   ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_TARJETA, ''0'', ''$'', NULL, :IMP_TARJETA, NULL, 0, 0, NULL, CURRENT_DATE , 0, NULL, NULL)');



        dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
        dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
        dmfacturador.icomprobante.ParamByName('COD_TARJETA').AsString:=ticket.codigotarjeta;
        dmfacturador.icomprobante.ParamByName('imp_tarjeta').AsFloat:=strtofloat(imp_tarjeta);
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;

        end;




 //INSERTAR VTMADESCCOMPROB     ------VR LLEVA PERO SIN IMPORTES


 if TICKET.codigo_OS<>'' THEN
 begin
        i:=0;

        ffacturador.Gfacturador.DataSource.DataSet.first;
        while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
          begin
          I:=I+1;
           if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
                                                     ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_OS;
          dmfacturador.icomprobante.ParamByName('ITEM').AsFloat:=I;
          dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat:=ffacturador.Gfacturador.Fields[11].AsInteger;
          dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat:=((ffacturador.Gfacturador.Fields[11].AsInteger)*(ffacturador.Gfacturador.Fields[6].Asfloat))/100;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          ffacturador.Gfacturador.DataSource.DataSet.Next;
          end;
 end;

  if TICKET.codigo_Co1<>'' THEN
 begin
        i:=0;

        ffacturador.Gfacturador.DataSource.DataSet.first;
        while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
          begin
          I:=I+1;
           if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
                                                     ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Co1;
          dmfacturador.icomprobante.ParamByName('ITEM').AsFloat:=I;
          dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat:=ffacturador.Gfacturador.Fields[12].AsInteger;
          dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat:=((ffacturador.Gfacturador.Fields[12].AsInteger)*(ffacturador.Gfacturador.Fields[6].Asfloat))/100;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          ffacturador.Gfacturador.DataSource.DataSet.Next;
          end;
 end;
 if TICKET.codigo_Cos2<>'' THEN
 begin
        i:=0;

        ffacturador.Gfacturador.DataSource.DataSet.first;
         while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
          begin
          I:=I+1;
           if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
                                                     ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Cos2;
          dmfacturador.icomprobante.ParamByName('ITEM').AsFloat:=I;
          dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat:=ffacturador.Gfacturador.Fields[13].AsInteger;
          dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat:=((ffacturador.Gfacturador.Fields[13].AsInteger)*(ffacturador.Gfacturador.Fields[6].Asfloat))/100;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          ffacturador.Gfacturador.DataSource.DataSet.Next;
          end;
 end;


 //INSERTAR VTMADETALLEAFILOS  ---vr lleva     sin importes tambien


if TICKET.codigo_os<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMADETALLEAFILOS ',
                                                     ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
                                                     ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
                                                     ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
                                                     ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
                                                     ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');




          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_os;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_nro_matricula;
          dmfacturador.icomprobante.ParamByName('nom_medico').asstring:=ticket.medico_nombre+' '+ticket.medico_apellido;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('fec_recet').Asdate:=ticket.fecha_receta;
          dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency:=roundto(strtofloat(formatfloat('0.00',(ffacturador.descuentoos.field.value))),-2);
          dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency:=roundto(strtofloat(formatfloat('0.00',(ffacturador.importetotal.Field.Value))),-2);
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;

 if TICKET.codigo_Co1<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMADETALLEAFILOS ',
                                                     ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
                                                     ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
                                                     ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
                                                     ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
                                                     ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');




          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Co1;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_nro_matricula;
          dmfacturador.icomprobante.ParamByName('nom_medico').asstring:=ticket.medico_nombre+' '+ticket.medico_apellido;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('fec_recet').Asdate:=ticket.fecha_receta;
          dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency:=roundto(strtofloat(formatfloat('0.00',(ffacturador.descuentoco1.field.value))),-2);
          dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency:=roundto(strtofloat(formatfloat('0.00',(ffacturador.descuentoco1.field.value))),-2);
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;
  if TICKET.codigo_cos2<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMADETALLEAFILOS ',
                                                     ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
                                                     ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
                                                     ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
                                                     ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
                                                     ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');






          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Cos2;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_nro_matricula;
          dmfacturador.icomprobante.ParamByName('nom_medico').asstring:=ticket.medico_nombre+' '+ticket.medico_apellido;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('fec_recet').Asdate:=ticket.fecha_receta;
          dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency:=roundto(strtofloat(formatfloat('0.00',(ffacturador.descuentoco2.field.value))),-2);
          dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency:=roundto(strtofloat(formatfloat('0.00',(ffacturador.descuentoco2.field.value))),-2);
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;



 //INSERTAR OSMAMOVOBRASOCIAL     --vr no lleva

  if TICKET.codigo_os<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO OSMAMOVOBRASOCIAL                         ',
                                                     '(NRO_SUCURSAL,                                       ',
                                                     ' TIP_COMPROB,                                       ',
                                                     ' NRO_COMPROB,                                      ',
                                                     ' COD_PLANOS,                                      ',
                                                     ' COD_PLANOSORIG,                                 ',
                                                     ' NOM_OBRASOCIAL,                                ',
                                                     ' FEC_COMPROB,                                  ',
                                                     ' FEC_RECETA,                                  ',
                                                     ' IMP_TICKET,                                 ',
                                                     ' IMP_AFECTADO,                              ',
                                                     ' IMP_CARGOOS,                              ',
                                                     ' IMP_GENTILEZA,                           ',
                                                     ' IMP_PRESTADOR,                          ',
                                                     ' NRO_AFILIADO,                          ',
                                                     ' COD_ESTADO,                           ',
                                                     ' NOM_AFILIADO,                        ',
                                                     ' NRO_MATRICULA,                      ',
                                                     ' NRO_RECETA,                        ',
                                                     ' MAR_TRATAMIENTO,                  ',
                                                     ' NRO_LIQUIDACION,                 ',
                                                     ' IDE_PRESENTACION,               ',
                                                     ' DES_PARTICULARIDAD,            ',
                                                     ' COD_CLINICA,                  ',
                                                     ' NOM_CLINICA,                 ',
                                                     ' INFOADICIONAL)              ',
                                                     '                            ',
                                                     ' VALUES (:sucursal,        ',
                                                     ' :tipo_comprobante,       ',
                                                     ' :nro_Comprobante,                 ',
                                                     ' :cod_planos,                     ',
                                                     '  NULL,                          ',
                                                     ' :nom_obrasocial,               ',
                                                     ' :fec_comprobante,             ',
                                                     ' :fec_receta,                 ',
                                                     ' :imp_ticket,                ',
                                                     ' :imp_afectado,             ',
                                                     ' :imp_cargoos,             ',
                                                     ' 0,                       ',
                                                     ' 0,                      ',
                                                     ' :nro_afiliado,         ',
                                                     ' ''C'',                  ',
                                                     ' :nom_afiliado,       ',
                                                     ' :nro_matricula,     ',
                                                     ' :nro_receta,       ',
                                                     ' :tip_tratamiento, ',
                                                     ' NULL,        ',
                                                     ' NULL,      ',
                                                     ' '''',       ',
                                                     ' NULL,   ',
                                                     ' NULL, ',
                                                     ' '''');');





          dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIPO_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_os;
          dmfacturador.icomprobante.ParamByName('nom_obrasocial').AsString:=TICKET.nombre_os;
          dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDatetime:=ticket.fechafiscal;
          dmfacturador.icomprobante.ParamByName('fec_receta').Asdate:=ticket.fecha_receta;
          dmfacturador.icomprobante.ParamByName('imp_ticket').Asfloat:=ticket.importebruto;
          dmfacturador.icomprobante.ParamByName('imp_afectado').Asfloat:=ticket.importetotaldescuento;
          dmfacturador.icomprobante.ParamByName('imp_cargoos').Asfloat:=ticket.importecargoos;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          dmfacturador.icomprobante.ParamByName('nom_afiliado').asstring:=ticket.afiliado_nombre+' '+ticket.afiliado_apellido;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_nro_matricula;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('tip_tratamiento').Asstring:=ticket.codigo_tratamiento;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;


if TICKET.codigo_Co1<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO OSMAMOVOBRASOCIAL                         ',
                                                     '(NRO_SUCURSAL,                                       ',
                                                     ' TIP_COMPROB,                                       ',
                                                     ' NRO_COMPROB,                                      ',
                                                     ' COD_PLANOS,                                      ',
                                                     ' COD_PLANOSORIG,                                 ',
                                                     ' NOM_OBRASOCIAL,                                ',
                                                     ' FEC_COMPROB,                                  ',
                                                     ' FEC_RECETA,                                  ',
                                                     ' IMP_TICKET,                                 ',
                                                     ' IMP_AFECTADO,                              ',
                                                     ' IMP_CARGOOS,                              ',
                                                     ' IMP_GENTILEZA,                           ',
                                                     ' IMP_PRESTADOR,                          ',
                                                     ' NRO_AFILIADO,                          ',
                                                     ' COD_ESTADO,                           ',
                                                     ' NOM_AFILIADO,                        ',
                                                     ' NRO_MATRICULA,                      ',
                                                     ' NRO_RECETA,                        ',
                                                     ' MAR_TRATAMIENTO,                  ',
                                                     ' NRO_LIQUIDACION,                 ',
                                                     ' IDE_PRESENTACION,               ',
                                                     ' DES_PARTICULARIDAD,            ',
                                                     ' COD_CLINICA,                  ',
                                                     ' NOM_CLINICA,                 ',
                                                     ' INFOADICIONAL)              ',
                                                     '                            ',
                                                     ' VALUES (:sucursal,        ',
                                                     ' :tipo_comprobante,       ',
                                                     ' :nro_Comprobante,                 ',
                                                     ' :cod_planos,                     ',
                                                     '  NULL,                          ',
                                                     ' :nom_obrasocial,               ',
                                                     ' :fec_comprobante,             ',
                                                     ' :fec_receta,                 ',
                                                     ' :imp_ticket,                ',
                                                     ' :imp_afectado,             ',
                                                     ' :imp_cargoos,             ',
                                                     ' 0,                       ',
                                                     ' 0,                      ',
                                                     ' :nro_afiliado,         ',
                                                     ' ''C'',                  ',
                                                     ' :nom_afiliado,       ',
                                                     ' :nro_matricula,     ',
                                                     ' :nro_receta,       ',
                                                     ' :tip_tratamiento, ',
                                                     ' NULL,        ',
                                                     ' NULL,      ',
                                                     ' '''',       ',
                                                     ' NULL,   ',
                                                     ' NULL, ',
                                                     ' '''');');





          dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIPO_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Co1;
          dmfacturador.icomprobante.ParamByName('nom_obrasocial').AsString:=TICKET.nombre_co1;
          dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDatetime:=ticket.fechafiscal;
          dmfacturador.icomprobante.ParamByName('fec_receta').Asdate:=ticket.fecha_receta;
          dmfacturador.icomprobante.ParamByName('imp_ticket').Asfloat:=ticket.importebruto;
          dmfacturador.icomprobante.ParamByName('imp_afectado').Asfloat:=ticket.importetotaldescuento;
          dmfacturador.icomprobante.ParamByName('imp_cargoos').Asfloat:=ticket.importecargoco1;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          dmfacturador.icomprobante.ParamByName('nom_afiliado').asstring:=ticket.afiliado_nombre+' '+ticket.afiliado_apellido;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_nro_matricula;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('tip_tratamiento').Asstring:=ticket.codigo_tratamiento;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;

 if TICKET.codigo_Cos2<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO OSMAMOVOBRASOCIAL                         ',
                                                     '(NRO_SUCURSAL,                                       ',
                                                     ' TIP_COMPROB,                                       ',
                                                     ' NRO_COMPROB,                                      ',
                                                     ' COD_PLANOS,                                      ',
                                                     ' COD_PLANOSORIG,                                 ',
                                                     ' NOM_OBRASOCIAL,                                ',
                                                     ' FEC_COMPROB,                                  ',
                                                     ' FEC_RECETA,                                  ',
                                                     ' IMP_TICKET,                                 ',
                                                     ' IMP_AFECTADO,                              ',
                                                     ' IMP_CARGOOS,                              ',
                                                     ' IMP_GENTILEZA,                           ',
                                                     ' IMP_PRESTADOR,                          ',
                                                     ' NRO_AFILIADO,                          ',
                                                     ' COD_ESTADO,                           ',
                                                     ' NOM_AFILIADO,                        ',
                                                     ' NRO_MATRICULA,                      ',
                                                     ' NRO_RECETA,                        ',
                                                     ' MAR_TRATAMIENTO,                  ',
                                                     ' NRO_LIQUIDACION,                 ',
                                                     ' IDE_PRESENTACION,               ',
                                                     ' DES_PARTICULARIDAD,            ',
                                                     ' COD_CLINICA,                  ',
                                                     ' NOM_CLINICA,                 ',
                                                     ' INFOADICIONAL)              ',
                                                     '                            ',
                                                     ' VALUES (:sucursal,        ',
                                                     ' :tipo_comprobante,       ',
                                                     ' :nro_Comprobante,                 ',
                                                     ' :cod_planos,                     ',
                                                     '  NULL,                          ',
                                                     ' :nom_obrasocial,               ',
                                                     ' :fec_comprobante,             ',
                                                     ' :fec_receta,                 ',
                                                     ' :imp_ticket,                ',
                                                     ' :imp_afectado,             ',
                                                     ' :imp_cargoos,             ',
                                                     ' 0,                       ',
                                                     ' 0,                      ',
                                                     ' :nro_afiliado,         ',
                                                     ' ''C'',                  ',
                                                     ' :nom_afiliado,       ',
                                                     ' :nro_matricula,     ',
                                                     ' :nro_receta,       ',
                                                     ' :tip_tratamiento, ',
                                                     ' NULL,        ',
                                                     ' NULL,      ',
                                                     ' '''',       ',
                                                     ' NULL,   ',
                                                     ' NULL, ',
                                                     ' '''');');





          dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIPO_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Cos2;
          dmfacturador.icomprobante.ParamByName('nom_obrasocial').AsString:=TICKET.nombre_cos2;
          dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDatetime:=ticket.fechafiscal;
          dmfacturador.icomprobante.ParamByName('fec_receta').Asdate:=ticket.fecha_receta;
          dmfacturador.icomprobante.ParamByName('imp_ticket').Asfloat:=ticket.importebruto;
          dmfacturador.icomprobante.ParamByName('imp_afectado').Asfloat:=ticket.importetotaldescuento;
          dmfacturador.icomprobante.ParamByName('imp_cargoos').Asfloat:=ticket.importecargoco2;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          dmfacturador.icomprobante.ParamByName('nom_afiliado').asstring:=ticket.afiliado_nombre+' '+ticket.afiliado_apellido;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_nro_matricula;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('tip_tratamiento').Asstring:=ticket.codigo_tratamiento;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;

 //INSTERTAR OSMADETALLEMOV     --vr no lleva


 if TICKET.codigo_os<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO OSMADETALLEMOV                     ',
                                                     ' (COD_PLANOS,                                 ',
                                                     ' NRO_SUCURSAL,                               ',
                                                     ' TIP_COMPROB,                               ',
                                                     ' NRO_COMPROB,                              ',
                                                     ' NRO_ITEM,                                ',
                                                     ' COD_ALFABETA,                           ',
                                                     ' COD_LABORATORIO,                       ',
                                                     ' NOM_LARGO,                            ',
                                                     ' CAN_VENDIDA,                         ',
                                                     ' IMP_UNITARIO,                       ',
                                                     ' POR_DESCUENTO,                     ',
                                                     ' IMP_DESCUENTO,                    ',
                                                     ' MAR_MOTVENTA,                    ',
                                                     ' NRO_TROQUEL,                    ',
                                                     ' COD_VALIDACION)                ',
                                                     '                               ',
                                                     ' VALUES (:cod_planos,         ',
                                                     ' :nro_sucursal,              ',
                                                     ' :tip_comprobante,          ',
                                                     ' :nro_comprobante,         ',
                                                     ' :nro_item,               ',
                                                     ' :cod_alfabeta,          ',
                                                     ' :cod_laboratorio,      ',
                                                     ' :nom_largo,           ',
                                                     ' :can_vendida,        ',
                                                     ' :imp_unitario,      ',
                                                     ' :por_descuento,    ',
                                                     ' :imp_descuento,   ',
                                                     ' ''3'',            ',
                                                     ' :nro_troquel,  ',
                                                     ' :cod_validacion);');



i:=0;
ffacturador.Gfacturador.DataSource.DataSet.first;
while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
          i:=i+1;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_os;
          dmfacturador.icomprobante.ParamByName('nro_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('nro_item').Asinteger:=i;
          dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger:=ffacturador.Gfacturador.Fields[8].AsInteger;
          dmfacturador.icomprobante.ParamByName('cod_laboratorio').AsString:=ffacturador.Gfacturador.Fields[15].Asstring;
          dmfacturador.icomprobante.ParamByName('nom_largo').AsString:=ffacturador.Gfacturador.Fields[1].Asstring;//
          dmfacturador.icomprobante.ParamByName('can_vendida').AsString:=ffacturador.Gfacturador.Fields[3].Asstring;
          dmfacturador.icomprobante.ParamByName('imp_unitario').Asfloat:=ffacturador.Gfacturador.Fields[2].Asfloat;
          dmfacturador.icomprobante.ParamByName('por_descuento').Asinteger:=ffacturador.Gfacturador.Fields[11].Asinteger;
          dmfacturador.icomprobante.ParamByName('imp_descuento').Asfloat:=(ffacturador.Gfacturador.Fields[2].Asfloat*ffacturador.Gfacturador.Fields[11].Asfloat)/100;
          dmfacturador.icomprobante.ParamByName('nro_troquel').Asinteger:=ffacturador.Gfacturador.Fields[0].Asinteger;
          dmfacturador.icomprobante.ParamByName('cod_validacion').AsString:=ticket.valnroreferencia;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

 end;

 if TICKET.codigo_co1<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO OSMADETALLEMOV                     ',
                                                     ' (COD_PLANOS,                                 ',
                                                     ' NRO_SUCURSAL,                               ',
                                                     ' TIP_COMPROB,                               ',
                                                     ' NRO_COMPROB,                              ',
                                                     ' NRO_ITEM,                                ',
                                                     ' COD_ALFABETA,                           ',
                                                     ' COD_LABORATORIO,                       ',
                                                     ' NOM_LARGO,                            ',
                                                     ' CAN_VENDIDA,                         ',
                                                     ' IMP_UNITARIO,                       ',
                                                     ' POR_DESCUENTO,                     ',
                                                     ' IMP_DESCUENTO,                    ',
                                                     ' MAR_MOTVENTA,                    ',
                                                     ' NRO_TROQUEL,                    ',
                                                     ' COD_VALIDACION)                ',
                                                     '                               ',
                                                     ' VALUES (:cod_planos,         ',
                                                     ' :nro_sucursal,              ',
                                                     ' :tip_comprobante,          ',
                                                     ' :nro_comprobante,         ',
                                                     ' :nro_item,               ',
                                                     ' :cod_alfabeta,          ',
                                                     ' :cod_laboratorio,      ',
                                                     ' :nom_largo,           ',
                                                     ' :can_vendida,        ',
                                                     ' :imp_unitario,      ',
                                                     ' :por_descuento,    ',
                                                     ' :imp_descuento,   ',
                                                     ' ''3'',            ',
                                                     ' :nro_troquel,  ',
                                                     ' :cod_validacion);');



i:=0;
ffacturador.Gfacturador.DataSource.DataSet.first;
while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
          i:=i+1;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_co1;
          dmfacturador.icomprobante.ParamByName('nro_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('nro_item').Asinteger:=i;
          dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger:=ffacturador.Gfacturador.Fields[8].AsInteger;
          dmfacturador.icomprobante.ParamByName('cod_laboratorio').AsString:=ffacturador.Gfacturador.Fields[15].Asstring;
          dmfacturador.icomprobante.ParamByName('nom_largo').AsString:=ffacturador.Gfacturador.Fields[1].Asstring;//
          dmfacturador.icomprobante.ParamByName('can_vendida').AsString:=ffacturador.Gfacturador.Fields[3].Asstring;
          dmfacturador.icomprobante.ParamByName('imp_unitario').Asfloat:=ffacturador.Gfacturador.Fields[2].Asfloat;
          dmfacturador.icomprobante.ParamByName('por_descuento').Asinteger:=ffacturador.Gfacturador.Fields[12].Asinteger;
          dmfacturador.icomprobante.ParamByName('imp_descuento').Asfloat:=(ffacturador.Gfacturador.Fields[2].Asfloat*ffacturador.Gfacturador.Fields[12].Asfloat)/100;
          dmfacturador.icomprobante.ParamByName('nro_troquel').Asinteger:=ffacturador.Gfacturador.Fields[0].Asinteger;
          dmfacturador.icomprobante.ParamByName('cod_validacion').AsString:=ticket.valnroreferencia;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

 end;


if TICKET.codigo_cos2<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO OSMADETALLEMOV                     ',
                                                     ' (COD_PLANOS,                                 ',
                                                     ' NRO_SUCURSAL,                               ',
                                                     ' TIP_COMPROB,                               ',
                                                     ' NRO_COMPROB,                              ',
                                                     ' NRO_ITEM,                                ',
                                                     ' COD_ALFABETA,                           ',
                                                     ' COD_LABORATORIO,                       ',
                                                     ' NOM_LARGO,                            ',
                                                     ' CAN_VENDIDA,                         ',
                                                     ' IMP_UNITARIO,                       ',
                                                     ' POR_DESCUENTO,                     ',
                                                     ' IMP_DESCUENTO,                    ',
                                                     ' MAR_MOTVENTA,                    ',
                                                     ' NRO_TROQUEL,                    ',
                                                     ' COD_VALIDACION)                ',
                                                     '                               ',
                                                     ' VALUES (:cod_planos,         ',
                                                     ' :nro_sucursal,              ',
                                                     ' :tip_comprobante,          ',
                                                     ' :nro_comprobante,         ',
                                                     ' :nro_item,               ',
                                                     ' :cod_alfabeta,          ',
                                                     ' :cod_laboratorio,      ',
                                                     ' :nom_largo,           ',
                                                     ' :can_vendida,        ',
                                                     ' :imp_unitario,      ',
                                                     ' :por_descuento,    ',
                                                     ' :imp_descuento,   ',
                                                     ' ''3'',            ',
                                                     ' :nro_troquel,  ',
                                                     ' :cod_validacion);');



i:=0;
ffacturador.Gfacturador.DataSource.DataSet.first;
while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
          i:=i+1;
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_cos2;
          dmfacturador.icomprobante.ParamByName('nro_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:=TICKET.comprobante;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.nrocomprobantenf;
          dmfacturador.icomprobante.ParamByName('nro_item').Asinteger:=i;
          dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger:=ffacturador.Gfacturador.Fields[8].AsInteger;
          dmfacturador.icomprobante.ParamByName('cod_laboratorio').AsString:=ffacturador.Gfacturador.Fields[15].Asstring;
          dmfacturador.icomprobante.ParamByName('nom_largo').AsString:=ffacturador.Gfacturador.Fields[1].Asstring;//
          dmfacturador.icomprobante.ParamByName('can_vendida').AsString:=ffacturador.Gfacturador.Fields[3].Asstring;
          dmfacturador.icomprobante.ParamByName('imp_unitario').Asfloat:=ffacturador.Gfacturador.Fields[2].Asfloat;
          dmfacturador.icomprobante.ParamByName('por_descuento').Asinteger:=ffacturador.Gfacturador.Fields[13].Asinteger;
          dmfacturador.icomprobante.ParamByName('imp_descuento').Asfloat:=(ffacturador.Gfacturador.Fields[2].Asfloat*ffacturador.Gfacturador.Fields[13].Asfloat)/100;
          dmfacturador.icomprobante.ParamByName('nro_troquel').Asinteger:=ffacturador.Gfacturador.Fields[0].Asinteger;
          dmfacturador.icomprobante.ParamByName('cod_validacion').AsString:=ticket.valnroreferencia;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

 end;

 //stock.. --vr no lleva

if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('update prmastock set can_stk=:can_stk where cod_alfabeta=:cod_alfabeta and nro_sucursal=:nro_sucursal');

ffacturador.Gfacturador.DataSource.DataSet.first;
while not ffacturador.Gfacturador.DataSource.DataSet.Eof do

    begin
    dmfacturador.qbusquedastock.Close;
    dmfacturador.qbusquedastock.SQL.Text:=concat('select can_stk from prmastock where cod_Alfabeta=:codigo and nro_sucursal=:sucursal');
    dmfacturador.qbusquedastock.ParamByName('codigo').asinteger:=ffacturador.Gfacturador.Fields[8].AsInteger;
    dmfacturador.qbusquedastock.ParamByName('sucursal').asstring:=ticket.sucursal;
    dmfacturador.qbusquedastock.Open;

    if dmfacturador.qbusquedastock.RecordCount>0 then
    begin

    stockparcial:=dmfacturador.qbusquedastock.FieldByName('can_stk').AsInteger;


    end;
    if dmfacturador.qbusquedastock.RecordCount=0 then
    begin

    dmfacturador.qinsertlineastock.Close;
    dmfacturador.qinsertlineastock.SQL.Text:=concat(' INSERT INTO PRMASTOCK (NRO_SUCURSAL, COD_ALFABETA, CAN_STKMIN, CAN_STKMAX, CAN_STK) ',
                                                 ' VALUES (:sucursal, :alfabeta, 0, 1000, 0)');
    dmfacturador.qinsertlineastock.ParamByName('alfabeta').asinteger:=ffacturador.Gfacturador.Fields[8].AsInteger;
    dmfacturador.qinsertlineastock.ParamByName('sucursal').asstring:=ticket.sucursal;
    dmfacturador.qinsertlineastock.Open;

    stockparcial:=0;


    end;







    dmfacturador.icomprobante.ParamByName('cod_alfabeta').asinteger:=ffacturador.Gfacturador.Fields[8].AsInteger;
    if ticket.marstock='R' then
    BEGIN
     dmfacturador.icomprobante.ParamByName('can_stk').asinteger:=stockparcial-ffacturador.Gfacturador.Fields[3].AsInteger;
    END;
    if ticket.marstock='S' then
    BEGIN
     dmfacturador.icomprobante.ParamByName('can_stk').asinteger:=stockparcial+ffacturador.Gfacturador.Fields[3].AsInteger;
    END;
     if ticket.marstock='N' then
    BEGIN
     dmfacturador.icomprobante.ParamByName('can_stk').asinteger:=stockparcial;
    END;

    dmfacturador.icomprobante.parambyname('nro_sucursal').asstring:=ticket.sucursal;
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;
    ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

//-----------------------------------------------------------------------------------------------//
//------------------------------------------RANCKING PRODUCTOS-----------------------------------//
//-----------------------------------------------------------------------------------------------//



ffacturador.Gfacturador.DataSource.DataSet.first;
while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
          if dmfacturador.tranking.InTransaction  then
          BEGIN
          dmfacturador.tranking.Rollback;
          END;

          dmfacturador.tranking.StartTransaction;
          dmfacturador.AbrirConexion();
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;
          dmfacturador.qranking.Transaction:=dmFacturador.tranking;
          dmfacturador.qranking.SQL.Clear;
          dmfacturador.qranking.Close;
          dmfacturador.qranking.SQL.Text:=concat('select can_stkinicial, can_venta_diaria, can_compra_diaria, can_movdia from cotbrankproducto b where b.dat_fecha_hora=:fecha and cod_alfabeta=:alfabeta');


    dmfacturador.qranking.ParamByName('alfabeta').asinteger:=ffacturador.Gfacturador.Fields[8].AsInteger;
    dmfacturador.qranking.ParamByName('fecha').AsDate:=ticket.fechafiscal;
    dmfacturador.qranking.Open;
    if dmfacturador.qranking.RecordCount>0 then
    begin
    if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;
          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.SQL.Clear;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat(' UPDATE COTBRANKPRODUCTO SET           ',
                                                     ' CAN_STKINICIAL = :stock_inicial,     ',
                                                     ' CAN_VENTA_DIARIA = :venta_diaria,   ',
                                                     ' CAN_COMPRA_DIARIA = :compra_diaria, ',
                                                     ' CAN_MOVDIA = :movdia               ',
                                                     '                                     ',
                                                     ' WHERE (NRO_SUCURSAL = :sucursal) AND ',
                                                     ' (COD_ALFABETA = :alfabeta) AND ',
                                                     '(DAT_FECHA_HORA = :fecha) ');

        dmfacturador.icomprobante.parambyname('Sucursal').asstring:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('alfabeta').asinteger:=ffacturador.Gfacturador.Fields[8].AsInteger;
        dmfacturador.icomprobante.ParamByName('fecha').AsDate:=ticket.fechafiscal;
        dmfacturador.icomprobante.parambyname('stock_inicial').asinteger:=ffacturador.Gfacturador.Fields[16].AsInteger;;
        if ticket.rankingventa='S' then
        begin
        dmfacturador.icomprobante.ParamByName('venta_diaria').asinteger:=dmfacturador.qranking.FieldByName('can_venta_diaria').AsInteger+ffacturador.Gfacturador.Fields[3].AsINTEGER;
        end;
        if ticket.rankingventa='N' then
        begin
        dmfacturador.icomprobante.ParamByName('venta_diaria').asinteger:=dmfacturador.qranking.FieldByName('can_venta_diaria').AsInteger;
        end;
        if ticket.rankingcompra='S' then
        begin
        dmfacturador.icomprobante.ParamByName('compra_diaria').Asinteger:=dmfacturador.qranking.FieldByName('can_compra_diaria').AsInteger+ffacturador.Gfacturador.Fields[3].AsINTEGER;
        end;
         if ticket.rankingcompra='N' then
        begin
        dmfacturador.icomprobante.ParamByName('compra_diaria').Asinteger:=dmfacturador.qranking.FieldByName('can_compra_diaria').AsInteger;
        end;
        if  (TICKET.rankingcompra='N') and (ticket.rankingventa='N') then
        begin
            if ticket.marstock='R' then
            BEGIN
            dmfacturador.icomprobante.ParamByName('movdia').Asinteger:=dmfacturador.qranking.FieldByName('can_movdia').AsInteger-ffacturador.Gfacturador.Fields[3].AsINTEGER;
            end;

            if ticket.marstock='S' then
            BEGIN
            dmfacturador.icomprobante.ParamByName('movdia').Asinteger:=dmfacturador.qranking.FieldByName('can_movdia').AsInteger+ffacturador.Gfacturador.Fields[3].AsINTEGER;
            end;
        end;
        if  (TICKET.rankingcompra<>'N') OR (ticket.rankingventa<>'N') then
        begin
        dmfacturador.icomprobante.ParamByName('movdia').Asinteger:=dmfacturador.qranking.FieldByName('can_movdia').AsInteger;
        end;
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;
    end;
    if dmfacturador.qranking.RecordCount=0 then

    begin

         if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.SQL.Clear;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat(' INSERT                                 ',
                                                     ' INTO COTBRANKPRODUCTO (NRO_SUCURSAL,   ',
                                                     '  COD_ALFABETA,              ',
                                                     '  DAT_FECHA_HORA,           ',
                                                     '  CAN_STKINICIAL,          ',
                                                     '  CAN_VENTA_DIARIA,                            ',
                                                     '  CAN_COMPRA_DIARIA,                          ',
                                                     '  CAN_MOVDIA,                                ',
                                                     '  IMP_VENTA,                                ',
                                                     '  IMP_NETOVENTA,                           ',
                                                     '  IMP_COSTOVENTA,                         ',
                                                     '  IMP_COSTOCOMPRA,                       ',
                                                     '  IMP_OSD,                              ',
                                                     '  IMP_RETENCION_OSD,                    ',
                                                     '  CAN_UNID_OSD,                        ',
                                                     '  IMP_OSM,                            ',
                                                     '  IMP_RETENCION_OSM,                 ',
                                                     '  CAN_UNID_OSM,                     ',
                                                     '  IMP_COB_EFECTIVO,                ',
                                                     '  IMP_COB_CHEQUE,                 ',
                                                     '  IMP_COB_TARJ,                  ',
                                                     '  IMP_RETENCION_TARJ,           ',
                                                     '  IMP_CTACTE,                  ',
                                                     '  IMP_DSC_CTACTE,             ',
                                                     '  IMP_GENTILEZA,             ',
                                                     '  IMP_DSC_AFIL_OSD,         ',
                                                     '  IMP_DSC_AFIL_OSM)        ',
                                                     '                          ',
                                                     ' VALUES (:sucursal,                      ',
                                                     ' :cod_Alfabeta,                         ',
                                                     ' :fechahora,                           ',
                                                     ' :stockinicial,                       ',
                                                     ' :CANTIDAD,                          ',
                                                     ' :CAN_COMPRA_DIARIA,              ',
                                                     ' :CAN_MOVDIA,                     ',
                                                     ' :importeventa,                    ',
                                                     ' :importeneto,                    ',
                                                     ' :importecostoventa,             ',
                                                     ' :importecostocompra,           ',
                                                     ' :importeosd,                  ',
                                                     ' :importeRETENCIONOSD,        ',
                                                     ' :CAN_UNID_OSD,              ',
                                                     ' :IMP_OSM,                   ',
                                                     ' :CAN_UNID_OSM,              ',
                                                     ' :importeRETENCIONOSM,           ',
                                                     ' :IMP_COB_EFECTIVO,        ',
                                                     ' :IMP_COB_CHEQUE,         ',
                                                     ' :IMP_COB_TARJ,          ',
                                                     ' :IMP_RETENCION_TARJ,   ',
                                                     ' :IMP_CTACTE,          ',
                                                     ' :IMP_DSC_CTACTE,     ',
                                                     ' :IMP_GENTILEZA,     ',
                                                     ' :IMP_DSC_AFIL_OSD, ',
                                                     ' :IMP_DSC_AFIL_OSM)');


                  dmfacturador.icomprobante.parambyname('Sucursal').asstring:=ticket.sucursal;
                  dmfacturador.icomprobante.ParamByName('cod_alfabeta').asinteger:=ffacturador.Gfacturador.Fields[8].AsInteger;
                  dmfacturador.icomprobante.ParamByName('fechahora').AsDate:=ticket.fechafiscal;
                  dmfacturador.icomprobante.ParamByName('stockinicial').asinteger:=ffacturador.Gfacturador.Fields[16].AsInteger;





                  if ticket.rankingventa='S' then
                  begin
                  dmfacturador.icomprobante.ParamByName('CANTIDAD').asinteger:=ffacturador.Gfacturador.Fields[3].AsINTEGER;
                  end;
                  if ticket.rankingventa='N' then
                  begin
                  dmfacturador.icomprobante.ParamByName('CANTIDAD').asinteger:=0;
                  end;
                  if ticket.rankingcompra='S' then
                  begin
                  dmfacturador.icomprobante.ParamByName('CAN_COMPRA_DIARIA').Asinteger:=ffacturador.Gfacturador.Fields[3].AsINTEGER;

                  end;
                   if ticket.rankingcompra='N' then
                  begin
                  dmfacturador.icomprobante.ParamByName('CAN_COMPRA_DIARIA').Asinteger:=0;
                  end;
                  if  (TICKET.rankingcompra='N') and (ticket.rankingventa='N') then
                  begin
                      if ticket.marstock='R' then
                      BEGIN
                      dmfacturador.icomprobante.ParamByName('CAN_MOVDIA').Asinteger:=ffacturador.Gfacturador.Fields[3].AsINTEGER*-1;
                      end;

                      if ticket.marstock='S' then
                      BEGIN
                      dmfacturador.icomprobante.ParamByName('CAN_MOVDIA').Asinteger:=ffacturador.Gfacturador.Fields[3].AsINTEGER;
                      end;
                      if ticket.marstock='N' then
                      BEGIN
                      dmfacturador.icomprobante.ParamByName('CAN_MOVDIA').Asinteger:=0;
                      end;
                  end;
                  if  (TICKET.rankingcompra<>'N') OR (ticket.rankingventa<>'N') then
                  begin
                  dmfacturador.icomprobante.ParamByName('CAN_MOVDIA').Asinteger:=0;
                  end;





                  dmfacturador.icomprobante.ParamByName('importeventa').asFLOAT:=ffacturador.Gfacturador.Fields[2].asfloat;
                  dmfacturador.icomprobante.ParamByName('importeneto').AsFloat:=ffacturador.Gfacturador.Fields[2].asfloat;
                  dmfacturador.icomprobante.ParamByName('importecostoventa').AsFloat:=ffacturador.Gfacturador.Fields[2].asfloat;
                  dmfacturador.icomprobante.ParamByName('importecostocompra').AsFloat:=ffacturador.Gfacturador.Fields[2].asfloat;
                  dmfacturador.icomprobante.ParamByName('importeRETENCIONOSD').AsFloat:=0;
                  dmfacturador.icomprobante.ParamByName('importeRETENCIONOSM').AsFloat:=0;
                  dmfacturador.icomprobante.ParamByName('importeosd').AsFloat:=TICKET.importecargoos;
                  dmfacturador.icomprobante.ParamByName('CAN_UNID_OSD').AsFloat:=0;
                  dmfacturador.icomprobante.ParamByName('IMP_COB_EFECTIVO').AsFLOAT:=STRTOFLOAT(IMP_EFECTIVO);
                  dmfacturador.icomprobante.ParamByName('IMP_COB_CHEQUE').AsFLOAT:=STRTOFLOAT(IMP_CH);
                  dmfacturador.icomprobante.ParamByName('IMP_COB_TARJ').AsFLOAT:=STRTOFLOAT(IMP_TARJETA);
                  dmfacturador.icomprobante.ParamByName('IMP_RETENCION_TARJ').AsFloat:=0;
                  dmfacturador.icomprobante.ParamByName('IMP_CTACTE').AsFLOAT:=STRTOFLOAT(IMP_CC);
                  dmfacturador.icomprobante.ParamByName('IMP_DSC_CTACTE').AsFloat:=0;
                  dmfacturador.icomprobante.ParamByName('IMP_GENTILEZA').AsFloat:=0;
                  dmfacturador.icomprobante.ParamByName('IMP_DSC_CTACTE').AsFloat:=0;
                  dmfacturador.icomprobante.ParamByName('IMP_GENTILEZA').AsFloat:=0;
                  dmfacturador.icomprobante.ParamByName('IMP_DSC_AFIL_OSD').AsFloat:=0;
                  dmfacturador.icomprobante.ParamByName('IMP_DSC_AFIL_OSM').AsFloat:=0;
                  dmfacturador.icomprobante.Open;
                  dmfacturador.ticomprobante.Commit;






           end;

    ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;




end;


// ticket.estadoticket:=1;





procedure TFIMPRESIONnofiscal.UMActivated(var Message: TMessage);
begin
 ModalResult := mrCancel;
end;


//--------------------------insercion del vale cuando lo tiene----------------------------------//
procedure Tfimpresionnofiscal.Insertarcomprobantevale;
var
i: integer;
iva: double;
 condIva:String;
 //importeTotal,
 unaTasaIVA:TTasaIVA;
  baseImponible, importeIva, unaTasa:Double;

begin


 //INSERTAR VTMACOMPROBANTE

           if dmfacturador.ticomprobante.InTransaction then
             begin
              dmfacturador.ticomprobante.Rollback;
              end;
            dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

            dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
            dmfacturador.icomprobante.Close;
            dmfacturador.icomprobante.SQL.Clear;


            dmfacturador.icomprobante.Close;
            dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMACOMPROBEMITIDO                                 ',
                                                         ' (NRO_SUCURSAL,                                              ',
                                                         ' TIP_COMPROBANTE,                                          ',
                                                         ' NRO_COMPROBANTE,                                        ',
                                                         ' NRO_CAJA,                                             ',
                                                         ' COD_VENDEDOR,                                       ',
                                                         ' NRO_TRANSACCION,                                  ',
                                                         ' COD_CLIENTE,                                    ',
                                                         ' NOM_CLIENTE,                                  ',
                                                         ' COD_PROVEEDOR,                              ',
                                                         ' FEC_COMPROBANTE,                          ',
                                                         ' DES_LEYENDA,                            ',
                                                         ' FEC_PROXVENC_RECETA,                  ',
                                                         ' MAR_TRATAMIENTO,                    ',
                                                         ' CAN_REIMPRESO,                    ',
                                                         ' MAR_ANULADO,                    ',
                                                         ' NRO_SUC_CANCELADO,            ',
                                                         ' TIP_COMPROB_CANCELADO,      ',
                                                         ' NRO_COMPROB_CANCELADO,    ',
                                                         ' FEC_COMPROB_CANCELADO,  ',
                                                          'DES_PARTICULARIDAD,   ',
                                                          'MAR_ODONTOLOGO,                                                ',
                                                          'NRO_PBM,                                                      ',
                                                          'NOM_MEDICO,                                                  ',
                                                          'CAN_ITEMS,                                                  ',
                                                          'IMP_FINANC,                                                ',
                                                          'IMP_NETO,                                                 ',
                                                          'IMP_BRUTO,                                                ',
                                                         ' IMP_INTERES,                                             ',
                                                         ' IMP_GENTILEZA_FARM,                                      ',
                                                         ' MAR_PASOXCAJA,                                           ',
                                                         ' MAR_IMPRE_SUBDIA,                                      ',
                                                         ' MAR_IMPRESO_FISCAL,                                  ',
                                                         ' CAN_REIMPRESO_AUD,                                 ',
                                                         ' IMP_VALES,                                       ',
                                                         ' IMP_SALDO,                                     ',
                                                         ' FEC_REF,                                     ',
                                                         ' FEC_OPERATIVA,                             ',
                                                         ' MAR_RESERVADO,                           ',
                                                         ' IMP_APAGAR,                            ',
                                                         ' IMP_PERCEPCION,                      ',
                                                         ' MAR_ORIGEN,                        ',
                                                         ' COD_CLINICA,                     ',
                                                         ' NOM_CLINICA,                   ',
                                                         ' COD_AUTORIZACION,            ',
                                                         ' POR_GENTILEZA_FARM,        ',
                                                         ' POR_IVA)                 ',
                                                         ' VALUES (               ',
                                                         ' :sucursal,           ',
                                                         ' :tkcomprobante,                                      ',
                                                         ' :nrocomprobante,                                    ',
                                                         ' :caja,                                          ',
                                                         ' :vendedor,                                    ',
                                                         ' :transaccion,                               ',
                                                         ' :cod_cliente,                             ',
                                                         ' :nom_cliente,                           ',
                                                         ' NULL,                                 ',
                                                         ' :fec_comprobante,                   ',
                                                         ' '''',                               ',
                                                         ' :fec_receta,                    ',
                                                         ' :mar_tratamiento,             ',
                                                         ' 0,                          ',
                                                         ' ''N'',                      ',
                                                         ' :sucursal,              ',
                                                         ' NULL,                 ',
                                                         ' NULL,                 ',
                                                         ' NULL,                                   ',
                                                         ' '''',                                    ',
                                                         ' ''N'',                                  ',
                                                         ' -1,                                  ',
                                                         ' :MEDICO,                            ',
                                                         ' :CANTIDADINTEMS,                   ',
                                                         ' 0,                                ',
                                                         ' :IMP_NETO,                        ',
                                                         ' :IMP_BRUTO,                      ',
                                                         ' 0,                              ',
                                                         ' 0,                             ',
                                                         ' :PASOXCAJA,                   ',
                                                         ' NULL,                         ',
                                                         ' ''S'',                         ',
                                                         ' 0,                          ',
                                                         ' 0,                         ',
                                                         ' :SALDOCC,                  ',
                                                         ' :FEC_REF,                 ',
                                                         ' :FEC_OPERATIVA,          ',
                                                         ' NULL,                   ',
                                                         ' NULL,                  ',
                                                         ' 0,                    ',
                                                         ' ''F'',                 ',
                                                         ' NULL,               ',
                                                         ' NULL,               ',
                                                         ' :CODAUTORIZACION, ',
                                                         ' NULL, ',
                                                         ' NULL)');



        dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TKCOMPROBANTE').ASSTRING:='VR'+TICKET.fiscla_pv;
        dmfacturador.icomprobante.ParamByName('NROCOMPROBANTE').ASSTRING:=ticket.fiscla_pv+(rightpad(inttostr(nro_comprob), '0', 8));
        if TICKET.nro_caja='999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('CAJA').ASSTRING:='';
        END;
        if TICKET.nro_caja<>'999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('CAJA').ASSTRING:=TICKET.nro_caja;
        END;
        dmfacturador.icomprobante.ParamByName('VENDEDOR').ASSTRING:=ticket.cod_vendedor;
        dmfacturador.icomprobante.ParamByName('TRANSACCION').AsString:=inttostr(nro_comprob);
        dmfacturador.icomprobante.ParamByName('COD_CLIENTE').AsString:=ticket.codigocliente;
        dmfacturador.icomprobante.ParamByName('nom_cliente').AsString:=ticket.DESCRIPCIONCLIENTE;
        dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDatetime:=ticket.fechafiscal;
        dmfacturador.icomprobante.ParamByName('fec_receta').asdate:=ticket.fecha_receta;
        if TICKET.codigo_tratamiento='' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('mar_tratamiento').AsString:='N';
        END;
         if TICKET.codigo_tratamiento<>'' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('mar_tratamiento').AsString:=TICKET.codigo_tratamiento;
        END;
        dmfacturador.icomprobante.ParamByName('sucursal').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('MEDICO').AsString:=ticket.medico_apellido+ticket.medico_nombre;
        dmfacturador.icomprobante.ParamByName('CANTIDADINTEMS').Asinteger:=ticket.itemstotales;
        dmfacturador.icomprobante.ParamByName('IMP_NETO').AsFloat:=0;
        dmfacturador.icomprobante.ParamByName('IMP_BRUTO').AsFloat:=0;
         if TICKET.nro_caja='999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('PASOXCAJA').ASSTRING:='N';
        END;
        if TICKET.nro_caja<>'999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('PASOXCAJA').ASSTRING:='S';
        END;

        dmfacturador.icomprobante.ParamByName('SALDOCC').ASFLOAT:=0;
        dmfacturador.icomprobante.ParamByName('FEC_REF').ASstring:=TICKEt.fechaactual;
        if TICKET.nro_caja='999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('FEC_OPERATIVA').asstring:='';
        END;
        if TICKET.nro_caja<>'999' then
        BEGIN
        dmfacturador.icomprobante.ParamByName('FEC_OPERATIVA').AsDate:=ticket.fec_operativa;
        END;
        dmfacturador.icomprobante.ParamByName('CODAUTORIZACION').AsString:=ticket.valnroreferencia;
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;







 //INSTERTAR VTMADETALLECOMPROB -----------------------------------------// VR



  if dmfacturador.ticomprobante.InTransaction then
      begin
       dmfacturador.ticomprobante.Rollback;
      end;
            dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

            dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
            dmfacturador.icomprobante.Close;
            dmfacturador.icomprobante.SQL.Clear;


            dmfacturador.icomprobante.Close;
            dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMADETALLECOMPROB ',
                                                        '(NRO_SUCURSAL,                  ',
                                                        'TIP_COMPROBANTE,                 ',
                                                        'NRO_COMPROBANTE,                  ',
                                                        'NRO_ITEM,                          ',
                                                        'COD_ALFABETA,                       ',
                                                        'NOM_PRODUCTO,                        ',
                                                        'CAN_CANTIDAD,                         ',
                                                        'IMP_UNITARIO,                          ',
                                                        'IMP_IVADESC,                            ',
                                                        'IMP_IVA_NETO,                            ',
                                                        'IMP_IVATASA,                              ',
                                                        'IMP_PRODNETO,                              ',
                                                        'IMP_GENTILEZA_FARM,                         ',
                                                        'MAR_MODIF,                                   ',
                                                        'MAR_MOTVENTA,                                 ',
                                                        'CAN_VALE,                                      ',
                                                        'TIP_VALE,                                       ',
                                                        'COD_PROD_REC,                                   ',
                                                        'COD_AUTORIZACION)                               ',
                                                        '                                                ',
                                                        'VALUES (:nro_sucursal,                          ',
                                                        ':TIP_COMPROBANTE,                                        ',
                                                        ':nro_comprobante,                               ',
                                                        ':nro_item,                                      ',
                                                        ':cod_alfabeta,                                  ',
                                                        ':nom_producto,                                  ',
                                                        ':cantidad,                                      ',
                                                        ':imp_unitario,                                  ',
                                                        ':IMP_IVADESC,                                   ',
                                                        ':IMP_IVANETO,                                   ',
                                                        ':IMP_IVATASA,                                   ',
                                                        ':IMP_PRODNETO,                                  ',
                                                        '0,                                              ',
                                                        '''N'',                                          ',
                                                        'NULL,                                           ',
                                                        '0,                                              ',
                                                        'NULL,                                           ',
                                                        'NULL,                                           ',
                                                        ''''');');


i:=0;

ffacturador.Gfacturador.DataSource.DataSet.first;
while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
    i:=i+1;
     dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').asstring:='VR'+TICKET.fiscla_pv;
     dmfacturador.icomprobante.ParamByName('nro_sucursal').asstring:=ticket.sucursal;
     dmfacturador.icomprobante.parambyname('nro_comprobante').AsString:=ticket.fiscla_pv+(rightpad(inttostr(nro_comprob), '0', 8));
     dmfacturador.icomprobante.ParamByName('nro_item').Asinteger:=i;
     dmfacturador.icomprobante.parambyname('cod_alfabeta').Asinteger:=ffacturador.Gfacturador.Fields[8].AsInteger;
     dmfacturador.icomprobante.parambyname('nom_producto').asstring:=ffacturador.Gfacturador.Fields[1].AsString;
     dmfacturador.icomprobante.parambyname('cantidad').asinteger:=ffacturador.Gfacturador.Fields[3].Asinteger;
     dmfacturador.icomprobante.parambyname('imp_unitario').asfloat:=0;

     //----------cuando tiene obra social o coseguro cambia el campo del iva--------------------///
  if not ((ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') or (ticket.codigo_Cos2<>''))  then
  begin
    if ffacturador.Gfacturador.fields[10].AsString='B' then
    begin
    iva:=(ticket.IVAB/100)+1;
     dmfacturador.icomprobante.parambyname('imp_ivaneto').AsFloat:=0;
     dmfacturador.icomprobante.parambyname('imp_ivadesc').AsFloat:=0;
    end;
    if ffacturador.Gfacturador.fields[10].AsString<>'B' then
    begin
    iva:=0;
     dmfacturador.icomprobante.parambyname('imp_ivaneto').AsFloat:=0;
     dmfacturador.icomprobante.parambyname('imp_ivadesc').AsFloat:=0;
    end;

  end;


    if (ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') or (ticket.codigo_Cos2<>'')  then
  begin
    if ffacturador.Gfacturador.fields[10].AsString='B' then
    begin
    iva:=(ticket.IVAB/100)+1;
     dmfacturador.icomprobante.parambyname('imp_ivadesc').AsFloat:=0;
     dmfacturador.icomprobante.parambyname('imp_ivaneto').AsFloat:=0;
    end;
    if ffacturador.Gfacturador.fields[10].AsString<>'B' then
    begin
    iva:=0;
     dmfacturador.icomprobante.parambyname('imp_ivadesc').AsFloat:=0;
     dmfacturador.icomprobante.parambyname('imp_ivaneto').AsFloat:=0;
    end;
//----------cuando tiene obra social o coseguro cambia el campo del iva--------------------///
    end;
    dmfacturador.icomprobante.parambyname('imp_ivatasa').AsFloat:=0;
    dmfacturador.icomprobante.parambyname('imp_prodneto').AsFloat:=0;
    dmfacturador.icomprobante.Open;
    dmFacturador.ticomprobante.Commit;
    ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;



 //INSERTAR VTMAPORCENTAJESIVA   ----VR LLEVA PERO TODOS LOS VALORES EN 0

if dmfacturador.ticomprobante.InTransaction  then
dmfacturador.ticomprobante.Rollback;

dmfacturador.ticomprobante.StartTransaction;
dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
dmfacturador.icomprobante.Close;
dmfacturador.icomprobante.SQL.Clear;


dmfacturador.icomprobante.Close;
dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMAPORCENTAJESIVA                        ',
                                            '(NRO_SUCURSAL,                                       ',
                                            'TIP_COMPROBANTE,                                     ',
                                            'NRO_COMPROBANTE,                                     ',
                                            'NRO_ITEM,                                           ',
                                            'POR_PORCENTAJE,                                     ',
                                            'POR_SOBRETASA,                                     ',
                                            'IMP_NETOGRAV,                                      ',
                                            'IMP_IVA,                                         ',
                                            'IMP_IVASOBRETASA,                              ',
                                            'IMP_NETOGRAV_DESC,                           ',
                                            'IMP_IVA_DESC,                              ',
                                            'IMP_IVASOBRETASA_DESC)                   ',
                                            '                                       ',
                                            'VALUES (:nro_sucursal,                   ',
                                            ':tip_comprobante,  ',
                                            ':nro_comprobante,                ',
                                            ':nro_item,                     ',
                                            ':por_porcentaje,             ',
                                            ':por_sobretasa,            ',
                                            ':imp_netograv,            ',
                                            ':imp_iva,                ',
                                            ':imp_ivasobretasa,     ',
                                            ':imp_netograv_desc,   ',
                                            ':imp_iva_desc,      ',
                                            'NULL);');

i:=0;

for condIVA in ticket.TotalesIVA.Keys do
Begin
  i:=i+1;
  ticket.TotalesIVA.TryGetValue(condIVa, unaTasaIVA);
  dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').asstring:='VR'+TICKET.fiscla_pv;
  dmfacturador.icomprobante.ParamByName('nro_sucursal').asstring:=ticket.sucursal;
  dmfacturador.icomprobante.parambyname('nro_comprobante').AsString:=ticket.fiscla_pv+(rightpad(inttostr(nro_comprob), '0', 8));
  dmfacturador.icomprobante.ParamByName('nro_item').Asinteger:=i;

  //Obtener la tasa de iva de la tabla PRMAIVA con la condicion condIVA
  if condIVA ='A' then unaTasa:=ticket.IVAA
  else if condIVA=  'B' then unaTasa:=ticket.IVAB
  else if condIVA='D' then unaTasa:=ticket.IVAD
  else if condIVA=  'E' then unaTasa:=ticket.IVAE
  else if condIVA=  's' then unaTasa:=ticket.IVAs;


  //Si es S poner el monto sobretrasa sino 0
  iva:=unaTasa/100;
  baseImponible:=unaTasaIVA.importeTotal/(1+iva);
  importeIVA:=baseImponible*iva;

  dmfacturador.icomprobante.parambyname('por_sobretasa').asstring:='0';
  dmfacturador.icomprobante.parambyname('por_porcentaje').AsFloat:=0;

  if not ((ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') or (ticket.codigo_Cos2<>''))  then
  Begin
    //NO TENGO OBRA SOCIAL
    dmfacturador.icomprobante.parambyname('imp_netograv').asfloat:=0;
    dmfacturador.icomprobante.parambyname('imp_netograv_desc').AsFloat:=0;
    dmfacturador.icomprobante.parambyname('imp_iva').asfloat:=0;
    dmfacturador.icomprobante.parambyname('imp_iva_desc').AsFloat:=0;
  End
  else
  begin //TIENE OBRA SOCIAL
      dmfacturador.icomprobante.parambyname('imp_netograv_desc').asfloat:=0;
      dmfacturador.icomprobante.parambyname('imp_netograv').AsFloat:=0;
      dmfacturador.icomprobante.parambyname('imp_iva_desc').asfloat:=0;
      dmfacturador.icomprobante.parambyname('imp_iva').AsFloat:=0;
  end;
  dmfacturador.icomprobante.parambyname('imp_ivasobretasa').AsFloat:=0;
  dmfacturador.icomprobante.Open;
  dmfacturador.ticomprobante.Commit;
  End;




 //INSERTAR VTTBPAGOCHEQUE          --VR LLEVA TODOS LOS MEDIOS DE PAGO

if strtofloat(imp_CH)<>0 then
begin
     if dmfacturador.ticomprobante.InTransaction  then
    dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

    dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;


    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTTBPAGOCHEQUE (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_BANCO, COD_CTA, NRO_CHEQUE, IMP_CHEQUE) VALUES (:sucursal,:tip_comprobante, :nro_comprobante, :cod_banco, '''', :nro_cheque, :importe_cheque);');



    dmfacturador.icomprobante.ParamByName('SUCURSAL').AsString:=ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:='VR'+TICKET.fiscla_pv;;
    dmfacturador.icomprobante.ParamByName('nro_comprobante').AsString:=ticket.fiscla_pv+(rightpad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('cod_banco').AsString:=ticket.codigocheque;
    dmfacturador.icomprobante.ParamByName('nro_cheque').AsString:=ticket.numerocheque;
    dmfacturador.icomprobante.ParamByName('importe_cheque').AsFloat:=strtofloat(imp_ch);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

end;

//INSTERTAR VTTPAGOCTACTE

if strtofloat(imp_CC)<>0 then
        begin
         if dmfacturador.ticomprobante.InTransaction  then
        dmfacturador.ticomprobante.Rollback;

        dmfacturador.ticomprobante.StartTransaction;
        dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

        dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Clear;


        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTTBPAGOCTACTE ',
                                                   '(NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_CTACTE, COD_SUBCTA, COD_AUTORIZACTA, IMP_CTACTE, IMP_SALDO, ',
                                                   ' MAR_RESUMIDO, NRO_SUCURSAL_LIQ, NRO_LIQUIDACION, CAN_CUOTAS, CAN_CUOTASPEN, POR_IVA, CODIGOPAGO) ',
                                                   ' VALUES (:NRO_SUCURSAL,:TIP_COMPROBANTE , :NRO_COMPROB, :COD_CTACTE, :COD_SUBCTA, '''', :IMP_CTACTE, :IMP_SCTACTE, ''N'', 0, NULL, 0, 0, NULL, NULL)');


        dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:='VR'+TICKET.fiscla_pv;
        dmfacturador.icomprobante.ParamByName('nro_comprob').AsString:=ticket.fiscla_pv+(rightpad(inttostr(nro_comprob), '0', 8));
        dmfacturador.icomprobante.ParamByName('COD_CTACTE').AsString:=ticket.codigocc;
        dmfacturador.icomprobante.ParamByName('cod_subcta').AsString:=ticket.codigosubcc;
        dmfacturador.icomprobante.ParamByName('imp_ctacte').AsFloat:=strtofloat(imp_cc);
        dmfacturador.icomprobante.ParamByName('imp_sctacte').AsFloat:=strtofloat(imp_cc);
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;

end;

//INSERTAR VTTPAGOEFECTIVO

 if strtofloat(imp_efectivo)<>0 then
        begin
         if dmfacturador.ticomprobante.InTransaction  then
        dmfacturador.ticomprobante.Rollback;

        dmfacturador.ticomprobante.StartTransaction;
        dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

        dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Clear;


        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTTBPAGOEFECTIVO (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_MONEDA, IMP_EFECTIVO, IMP_COTIZ, POR_IVA)',
                                                   ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, ''$'', :IMP_EFECTIVO, NULL, NULL)');


        dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:='VR'+TICKET.fiscla_pv;;
        dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.fiscla_pv+(rightpad(inttostr(nro_comprob), '0', 8));
        dmfacturador.icomprobante.ParamByName('imp_EFECTIVO').AsFloat:=strtofloat(imp_efectivo);
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;

        end;





 //INSERTAR VTTBPAGOTARJETA


 if strtofloat(imp_tarjeta)<>0 then
        begin
         if dmfacturador.ticomprobante.InTransaction  then
        dmfacturador.ticomprobante.Rollback;

        dmfacturador.ticomprobante.StartTransaction;
        dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

        dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Clear;


        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTTBPAGOTARJETA (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_TARJETA, NRO_TARJETA, COD_MONEDA, NRO_CUPON, ',
                                                   ' IMP_TARJETA, IMP_COTIZ, NRO_CUOTA, NRO_AUTORIZACION, NRO_LIQUIDACION, FEC_VENCIMIENTO, NRO_PIN, POR_IVA, CODIGOPAGO)',
                                                   ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_TARJETA, ''0'', ''$'', NULL, :IMP_TARJETA, NULL, 0, 0, NULL, CURRENT_DATE , 0, NULL, NULL)');



        dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:='VR'+TICKET.fiscla_pv;;
        dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.fiscla_pv+(rightpad(inttostr(nro_comprob), '0', 8));
        dmfacturador.icomprobante.ParamByName('COD_TARJETA').AsString:=ticket.codigotarjeta;
        dmfacturador.icomprobante.ParamByName('imp_tarjeta').AsFloat:=strtofloat(imp_tarjeta);
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;

        end;




 //INSERTAR VTMADESCCOMPROB     ------VR LLEVA PERO SIN IMPORTES


 if TICKET.codigo_OS<>'' THEN
 begin
        i:=0;

        ffacturador.Gfacturador.DataSource.DataSet.first;
        while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
          begin
          I:=I+1;
           if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
                                                     ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:='VR'+TICKET.fiscla_pv;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.fiscla_pv+(rightpad(inttostr(nro_comprob), '0', 8));
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_OS;
          dmfacturador.icomprobante.ParamByName('ITEM').AsFloat:=I;
          dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat:=0;
          dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat:=0;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          ffacturador.Gfacturador.DataSource.DataSet.Next;
          end;
 end;

  if TICKET.codigo_Co1<>'' THEN
 begin
        i:=0;

        ffacturador.Gfacturador.DataSource.DataSet.first;
        while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
          begin
          I:=I+1;
           if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
                                                     ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:='VR'+TICKET.fiscla_pv;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.fiscla_pv+(rightpad(inttostr(nro_comprob), '0', 8));
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Co1;
          dmfacturador.icomprobante.ParamByName('ITEM').AsFloat:=I;
          dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat:=0;
          dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat:=0;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          ffacturador.Gfacturador.DataSource.DataSet.Next;
          end;
 end;
 if TICKET.codigo_Cos2<>'' THEN
 begin
        i:=0;

        ffacturador.Gfacturador.DataSource.DataSet.first;
         while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
          begin
          I:=I+1;
           if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
                                                     ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:='VR'+TICKET.fiscla_pv;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.fiscla_pv+(rightpad(inttostr(nro_comprob), '0', 8));
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Cos2;
          dmfacturador.icomprobante.ParamByName('ITEM').AsFloat:=I;
          dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat:=0;
          dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat:=0;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;
          ffacturador.Gfacturador.DataSource.DataSet.Next;
          end;
 end;


 //INSERTAR VTMADETALLEAFILOS  ---vr lleva     sin importes tambien


if TICKET.codigo_os<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMADETALLEAFILOS ',
                                                     ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
                                                     ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
                                                     ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
                                                     ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
                                                     ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');




          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:='VR'+TICKET.fiscla_pv;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.fiscla_pv+(rightpad(inttostr(nro_comprob), '0', 8));
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_os;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_nro_matricula;
          dmfacturador.icomprobante.ParamByName('nom_medico').asstring:=ticket.medico_nombre+' '+ticket.medico_apellido;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('fec_recet').Asdate:=ticket.fecha_receta;
          dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency:=0;
          dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency:=0;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;

 if TICKET.codigo_Co1<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMADETALLEAFILOS ',
                                                     ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
                                                     ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
                                                     ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
                                                     ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
                                                     ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');




          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:='VR'+TICKET.fiscla_pv;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.fiscla_pv+(rightpad(inttostr(nro_comprob), '0', 8));
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Co1;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_nro_matricula;
          dmfacturador.icomprobante.ParamByName('nom_medico').asstring:=ticket.medico_nombre+' '+ticket.medico_apellido;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('fec_recet').Asdate:=ticket.fecha_receta;
          dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency:=0;
          dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency:=0;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

 end;
  if TICKET.codigo_cos2<>'' THEN
 begin
          if dmfacturador.ticomprobante.InTransaction  then
          dmfacturador.ticomprobante.Rollback;

          dmfacturador.ticomprobante.StartTransaction;
          dmfacturador.icomprobante.Database:=dmFacturador.getConexion;

          dmfacturador.icomprobante.Transaction:=dmFacturador.ticomprobante;
          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Clear;


          dmfacturador.icomprobante.Close;
          dmfacturador.icomprobante.SQL.Text:=concat('INSERT INTO VTMADETALLEAFILOS ',
                                                     ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
                                                     ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
                                                     ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
                                                     ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
                                                     ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');






          dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').AsString:=ticket.sucursal;
          dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').AsString:='VR'+TICKET.fiscla_pv;
          dmfacturador.icomprobante.ParamByName('nro_comprobANTE').AsString:=ticket.fiscla_pv+(rightpad(inttostr(nro_comprob), '0', 8));
          dmfacturador.icomprobante.ParamByName('COD_PLANOS').AsString:=TICKET.codigo_Cos2;
          dmfacturador.icomprobante.ParamByName('nro_afiliado').asstring:=ticket.afiliado_numero;
          dmfacturador.icomprobante.ParamByName('nro_matricula').asstring:=ticket.medico_nro_matricula;
          dmfacturador.icomprobante.ParamByName('nom_medico').asstring:=ticket.medico_nombre+' '+ticket.medico_apellido;
          dmfacturador.icomprobante.ParamByName('nro_receta').asstring:=ticket.numero_receta;
          dmfacturador.icomprobante.ParamByName('fec_recet').Asdate:=ticket.fecha_receta;
          dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency:=0;
          dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency:=0;
          dmfacturador.icomprobante.Open;
          dmfacturador.ticomprobante.Commit;

  end;
 end;

procedure Tfimpresionnofiscal.memoimpresionKeyPress(Sender: TObject;
  var Key: Char);
var
  r: TRect;
  i: Integer;
  numimpresora: integeR;
  reg: tregistry;
Rectt: TRect;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);
if key=#13 then
begin
  if APPLICATION.MessageBox(' Desea imprimir una copia? ','Impresion', MB_YESNO) = IDYES     then
       BEGIN
       numImpresora:=getImpresora(reg.ReadString('IMPRESORA'));
       Printer.PrinterIndex:=numImpresora;
          with Printer do
          begin

            BeginDoc;
            printer.Canvas.Draw(20,20,image1.Picture.Graphic);
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
          modalresult:=mrcancel;
          PostMessage(Handle, UM_ACTIVATED, 0, 0);
          ticket.estadoticket:=1;
       end;
       END
       ELSE
          modalresult:=mrcancel;
          PostMessage(Handle, UM_ACTIVATED, 0, 0);
          ticket.estadoticket:=1;
       BEGIN

       END;




end;

end.

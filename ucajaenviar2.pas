unit ucajaenviar2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  IBX.IBDatabase, IBX.IBCustomDataSet, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls, udticket, registry,
  Vcl.DBCtrls, udmfacturador, Vcl.ValEdit, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,Math,ShellAPI,ugastos,IdMultipartFormData;

   Const
  RegKey ='Software\Autofarma\APlus\';

type
  TFcajaenviar2 = class(TForm)

    Dzetas: TDataSource;
    transzetas: TIBTransaction;
    qpagos: TIBQuery;
    qzetas: TIBQuery;
    base: TIBDatabase;
    cdszetas: TClientDataSet;
    cdszetasZETA: TStringField;
    cdszetasIMPORTE: TFloatField;
    cdszetasTESTIGO: TFloatField;
    cdszetasDIFERENCIA: TFloatField;
    qpagosTIP_COMPROBANTE: TIBStringField;
    qpagosCOUNT: TIntegerField;
    qpagosCC: TIBBCDField;
    qpagosEFV: TIBBCDField;
    qpagosCH: TIBBCDField;
    qpagosTAR: TIBBCDField;
    qpagos1: TIBQuery;
    qpagos1CC: TIBBCDField;
    qpagos1EFV: TIBBCDField;
    qpagos1CH: TIBBCDField;
    qpagos1TAR: TIBBCDField;
    pcajas: TPageControl;
    enviar: TTabSheet;
    buscar: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Shape1: TShape;
    Label10: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label22: TLabel;
    Shape5: TShape;
    Label23: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Shape6: TShape;
    Label35: TLabel;
    Shape7: TShape;
    Label3: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label11: TLabel;
    eefectivo: TEdit;
    etarjeta: TEdit;
    etotal: TEdit;
    Etotalenvia: TEdit;
    Efenvian: TEdit;
    enviatarjeta: TEdit;
    fechadesde: TDateTimePicker;
    echeque: TEdit;
    enviacheque: TEdit;
    fechahasta: TDateTimePicker;
    horadesde: TMaskEdit;
    horahasta: TMaskEdit;
    combocaja: TComboBox;
    RadioGroup1: TRadioGroup;
    valuepesos: TValueListEditor;
    ecuentac: TEdit;
    EGASTOS: TEdit;
    enct: TEdit;
    bbuscar: TBitBtn;
    ENCA: TEdit;
    nctcantidad: TEdit;
    ncacantidad: TEdit;
    vtarjeta: TValueListEditor;
    ediferencia: TEdit;
    Panel2: TPanel;
    Label9: TLabel;
    gzeta: TDBGrid;
    bcancelar: TBitBtn;
    bguardar: TBitBtn;
    Blimpiartodo: TBitBtn;
    Label12: TLabel;
    Label17: TLabel;
    idhttp: TIdHTTP;
    mcomentarios: TMemo;
    Panel3: TPanel;
    desdehis: TDateTimePicker;
    hastahis: TDateTimePicker;
    Label18: TLabel;
    Label19: TLabel;
    bhistorico: TBitBtn;
    Shape8: TShape;
    Label20: TLabel;
    gcajas: TDBGrid;
    cdscajas: TClientDataSet;
    cdscajasfecha: TStringField;
    cdscajascajero: TStringField;
    cdscajasefectivo_contado: TStringField;
    cdscajasefectivo_sistema: TStringField;
    cdscajasefectivo_diferencia: TStringField;
    cdscajastarjeta_contado: TStringField;
    cdscajastarjeta_sistema: TStringField;
    cdscajasgastos: TStringField;
    cdscajasnca_emitidas: TStringField;
    cdscajasncb_emitidas: TStringField;
    dcajas: TDataSource;
    cdscajastarjeta_diferencia: TStringField;
    lcaja: TLabel;
    breporte: TBitBtn;
    Label21: TLabel;
    cdscajasid_caja: TStringField;
    qnct: TIBQuery;
    qnctTIP_COMPROBANTE: TIBStringField;
    qnctSUM: TIBBCDField;
    qnctCOUNT: TIntegerField;
    cdszetasCOMPROBANTE: TStringField;
    Shape9: TShape;
    edolar: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    eeuro: TEdit;
    ecambiodolar: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    ecambioeuro: TEdit;
    EOS: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    epagoscc: TEdit;
    EFA: TEdit;
    Shape10: TShape;
    qboni: TIBQuery;
    qboniTIP_COMPROBANTE: TIBStringField;
    qboniIMPORTE: TIBBCDField;
    qpagosOS: TIBBCDField;
    qpagos1OS: TIBBCDField;
    cdszetasBRUTO: TFloatField;
    cdszetasIVA: TFloatField;
    cdszetasNETOGRAVADO: TFloatField;
    cdszetasNETONOGRAVADO: TFloatField;
    cdszetasNETOGRAVDESC: TFloatField;
    qzetasZETA: TIBStringField;
    qzetasBRUTO: TIBBCDField;
    qzetasIVA: TIBBCDField;
    qzetasNETOGRAVADO: TIBBCDField;
    qzetasNETONOGRAVADO: TIBBCDField;
    qzetasNETOGRAVDESC: TIBBCDField;
    qzetasIMPORTES: TIBBCDField;
    qzetasTIP_COMPROBANTE: TIBStringField;
    qpcc: TIBQuery;
    IBStringField1: TIBStringField;
    qpccIMPORTE: TIBBCDField;
    EIVANCB: TEdit;
    EIVANCA: TEdit;
    Label8: TLabel;
    Label36: TLabel;
    qnctSUM1: TIBBCDField;
    cdszetascantidad: TStringField;
    qzetasTK: TIntegerField;
    Label37: TLabel;
    ENNCA: TEdit;
    ENNCB: TEdit;
    Label30: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Shape11: TShape;
    Shape12: TShape;
    EFM: TEdit;
    Label42: TLabel;
    ENDB: TEdit;
    Label43: TLabel;
    Label44: TLabel;
    Button1: TButton;
    Label45: TLabel;
    ladjuntos: TLabel;
    EFB: TEdit;
    qgenti: TIBQuery;
    Label46: TLabel;
    Egenti: TEdit;
    Label47: TLabel;

    procedure FormShow(Sender: TObject);
    procedure bbuscarClick(Sender: TObject);
    procedure valuepesosKeyPress(Sender: TObject; var Key: Char);
    procedure valuepesosExit(Sender: TObject);
    procedure vtarjetaKeyPress(Sender: TObject; var Key: Char);
    procedure totalenviar;
    procedure totalcontado;
    procedure totaldiferencia;
    procedure eefectivoChange(Sender: TObject);
    procedure etarjetaChange(Sender: TObject);
    procedure echequeChange(Sender: TObject);
    procedure EfenvianChange(Sender: TObject);
    procedure enviatarjetaChange(Sender: TObject);
    procedure enviachequeChange(Sender: TObject);
    procedure etotalChange(Sender: TObject);
    procedure EtotalenviaChange(Sender: TObject);
    procedure gzetaExit(Sender: TObject);
    procedure bguardarClick(Sender: TObject);
    procedure gzetaKeyPress(Sender: TObject; var Key: Char);
    procedure BlimpiartodoClick(Sender: TObject);
    procedure bhistoricoClick(Sender: TObject);
    procedure gcajasDblClick(Sender: TObject);
    procedure mcomentariosKeyPress(Sender: TObject; var Key: Char);
    procedure breporteClick(Sender: TObject);
    procedure vtarjetaExit(Sender: TObject);
    procedure edolarKeyPress(Sender: TObject; var Key: Char);
    procedure eeuroKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure subirarchivos;
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
     Ticket:TTicket;
  public
    { Public declarations }
    procedure SetTicket(unTicket:TTicket);
  end;

var
  Fcajaenviar2: TFcajaenviar2;
  rutaarchivos: string;
implementation


{$R *.dfm}



procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
begin
   ListOfStrings.Clear;
   ListOfStrings.Delimiter       := Delimiter;
   ListOfStrings.StrictDelimiter := True; // Requere D2006 o superior.
   ListOfStrings.DelimitedText   := Str;
end;




procedure TFcajaenviar2.bbuscarClick(Sender: TObject);
var

reg: tregistry;
valorprov: string;
Valor: extended;
prueba: string;
CALCULO: DOUBLE;
CALCULO2: DOUBLE;
 s, url:String;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  SUCURSAL, STOCK: STRING;
  j,i:Integer;
  detalleval:ixmlnode;
  cuit : string;
  VALOR2: INT64;




begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);
  base.Connected:=false;
  base.LoginPrompt:=false;
  base.DatabaseName:=reg.ReadString('rutabase');
  base.Params.Values['User_Name']:='SYSDBA';
  base.Params.Values['Password']:='nmpnet';
  base.DefaultTransaction:=transzetas;
  if transzetas.InTransaction then
  transzetas.Rollback;

  base.Connected:=true;
  transzetas.StartTransaction;

  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);
  base.Connected:=false;
  base.LoginPrompt:=false;
  base.DatabaseName:=reg.ReadString('rutabase');
  base.Params.Values['User_Name']:='SYSDBA';
  base.Params.Values['Password']:='nmpnet';
  base.DefaultTransaction:=transzetas;
  if transzetas.InTransaction then
  transzetas.Rollback;

  eefectivo.Text:='0';
etarjeta.Text:='0';
echeque.Text:='0';
etotal.Text:='0';
ediferencia.Text:='0';
efenvian.Text:='0';
enviatarjeta.Text:='0';
enviacheque.Text:='0';
etotalenvia.Text:='0';
ecuentac.Text:='0';
egastos.Text:='0';
enct.Text:='0';
enca.Text:='0';
nctcantidad.Text:='0';
ncacantidad.Text:='0';
mcomentarios.Lines.Clear;
cdszetas.Close;
 valuepesos.Values['$1']:='0';
 valuepesos.Values['$2']:='0';
 valuepesos.Values['$5']:='0';
 valuepesos.Values['$10']:='0';
 valuepesos.Values['$20']:='0';
 valuepesos.Values['$50']:='0';
 valuepesos.Values['$100']:='0';
 valuepesos.Values['$200']:='0';
 valuepesos.Values['$500']:='0';
 valuepesos.Values['$1000']:='0';
 valuepesos.Values['$2000']:='0';
 valuepesos.Values['$5000']:='0';
  valuepesos.Values['$10000']:='0';
 valuepesos.Values['$20000']:='0';
 valuepesos.Values['Otras']:='0';
 vtarjeta.Values['Visa']:='0';
 vtarjeta.Values['Maestro']:='0';
 vtarjeta.Values['Mastercard']:='0';
 vtarjeta.Values['Naranja']:='0';
 vtarjeta.Values['Electron']:='0';
 vtarjeta.Values['Cabal']:='0';
 vtarjeta.Values['American']:='0';
 vtarjeta.Values['TDF']:='0';
 vtarjeta.Values['Otras']:='0';
 vtarjeta.Values['Nativa']:='0';
 vtarjeta.Values['QR']:='0';
 blimpiartodo.Enabled:=false;
 bguardar.Enabled:=false;
 breporte.Enabled:=false;


  base.Connected:=true;
  transzetas.StartTransaction;
  qpagos1.Database:=base;
  qpagos1.Close;
  qpagos1.SQL.Clear;
  qpagos1.SQL.text:=concat(' SELECT  SUM(CC) as cc, SUM(EFV) as efv, SUM(CH) as ch, SUM(TAR) as tar, SUM(OS) AS OS FROM CJSPTIPOCOMBPAGO (:NROSUC, :FECDESDE, :FECHASTA, :CAJADESDE, :CAJAHASTA, :PASOXCAJA)');


  if combocaja.Text='TODAS' then
  BEGIN
  qpagos1.ParamByName('CAJADESDE').AsString:='1';
  qpagos1.ParamByName('CAJAHASTA').AsString:='999';
  END;
  if combocaja.Text<>'TODAS' then
  BEGIN
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);
  base.Connected:=false;
  base.LoginPrompt:=false;
  base.DatabaseName:=reg.ReadString('rutabase');
  base.Params.Values['User_Name']:='SYSDBA';
  base.Params.Values['Password']:='nmpnet';
  base.DefaultTransaction:=dmfacturador.ibtcajanombre;
  if dmfacturador.ibtcajanombre.InTransaction then
  dmfacturador.ibtcajanombre.Rollback;

  base.Connected:=true;
  dmfacturador.ibtcajanombre.StartTransaction;
  dmfacturador.ibcajanombre.Database:=base;
  dmfacturador.ibcajanombre.Close;
  dmfacturador.ibcajanombre.SQL.Clear;
  dmfacturador.ibcajanombre.SQL.Add('SELECT DISTINCT a.NRO_CAJA, a.des_caja FROM cjmacaja a WHERE A.DES_CAJA=:CAJA');
  DMFACTURADOR.ibcajanombre.ParamByName('CAJA').AsString:=COMBOCAJA.Text;
  dmfacturador.ibcajanombre.Open;
  qpagos1.ParamByName('CAJADESDE').AsString:=dmfacturador.ibcajanombre.Fields[0].AsString;
  qpagos1.ParamByName('CAJAHASTA').AsString:=dmfacturador.ibcajanombre.Fields[0].AsString;

  END;
  fechadesde.Time:=strtotime(horadesde.Text);
  fechahasta.Time:=strtotime(horahasta.Text);
  qpagos1.ParamByName('NROSUC').AsString:=ticket.sucursal;
  qpagos1.ParamByName('FECDESDE').AsDatetime:=fechadesde.Datetime;
  qpagos1.ParamByName('FECHASTA').AsDatetime:=fechahasta.Datetime;
  qpagos1.ParamByName('PASOXCAJA').Asstring:='S';
  qpagos1.Open;

  qpagos1.First;


   While not Qpagos1.Eof do
    BEGIN
     if qpagos1.Fieldbyname('EFV').AsString<>'' then
     begin
     EEFECTIVO.Text:=qpagos1.Fieldbyname('EFV').AsString;
     end;
     if qpagos1.Fieldbyname('TAR').AsString<>'' then
     begin
     Etarjeta.Text:=qpagos1.Fieldbyname('TAR').AsString;
     end;
      if qpagos1.Fieldbyname('CC').AsString<>'' then
     begin
     Ecuentac.Text:=qpagos1.Fieldbyname('CC').AsString;
     end;
     if qpagos1.Fieldbyname('CH').AsString<>'' then
     begin
     EcHEQUE.Text:=qpagos1.Fieldbyname('CH').AsString;
     end;
     if qpagos1.Fieldbyname('OS').AsString<>'' then
     begin
     EOS.Text:=qpagos1.Fieldbyname('OS').AsString;
     end;


     QPAGOS1.Next;



  end;


  Qnct.Close;
  Qnct.SQL.Clear;
  Qnct.SQL.text:=concat( ' SELECT          ',
                       ' v.tip_comprobante,  ',
                       ' sum(iva.imp_iva+IVA.IMP_IVA_DESC),  ',
                       ' sum(case when iva.nro_item is not null then iva.imp_netograv+iva.imp_netograv_desc+iva.imp_iva+IVA.IMP_IVA_DESC else v.imp_bruto end),   ',
                       ' count(DISTINCT v.nro_comprobante)  ',
                       ' FROM vtmacomprobemitido V left join vtmaporcentajesiva iva  on  v.nro_sucursal=iva.nro_sucursal and v.nro_comprobante=iva.nro_comprobante and v.tip_comprobante=iva.tip_comprobante  ',
                       ' WHERE   ',
                       '                 ',
                       '   V.TIP_COMPROBANTE IN (''GAS'',''NCT'',''NCA'') ',
                       '  AND V.NRO_SUCURSAL=:NROSUC                  ',
                       '  AND V.FEC_COMPROBANTE BETWEEN :FECDESDE AND :FECHASTA ',
                       '  AND V.nro_caja BETWEEN :CAJADESDE AND :CAJAHASTA        ',
                       '  AND V.mar_pasoxcaja=:PASOXCAJA ',
                       '  group by 1 ');













  if combocaja.Text='TODAS' then
  BEGIN
  Qnct.ParamByName('CAJADESDE').AsString:='1';
  Qnct.ParamByName('CAJAHASTA').AsString:='999';
  END;
  if combocaja.Text<>'TODAS' then
  BEGIN
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);
  base.Connected:=false;
  base.LoginPrompt:=false;
  base.DatabaseName:=reg.ReadString('rutabase');
  base.Params.Values['User_Name']:='SYSDBA';
  base.Params.Values['Password']:='nmpnet';
  base.DefaultTransaction:=dmfacturador.ibtcajanombre;
  if dmfacturador.ibtcajanombre.InTransaction then
  dmfacturador.ibtcajanombre.Rollback;

  base.Connected:=true;
  dmfacturador.ibtcajanombre.StartTransaction;
  dmfacturador.ibcajanombre.Database:=base;
  dmfacturador.ibcajanombre.Close;
  dmfacturador.ibcajanombre.SQL.Clear;
  dmfacturador.ibcajanombre.SQL.Add('SELECT DISTINCT a.NRO_CAJA, a.des_caja FROM cjmacaja a WHERE A.DES_CAJA=:CAJA');
  DMFACTURADOR.ibcajanombre.ParamByName('CAJA').AsString:=COMBOCAJA.Text;
  dmfacturador.ibcajanombre.Open;
  Qnct.ParamByName('CAJADESDE').AsString:=dmfacturador.ibcajanombre.Fields[0].AsString;
  Qnct.ParamByName('CAJAHASTA').AsString:=dmfacturador.ibcajanombre.Fields[0].AsString;

  END;
  fechadesde.Time:=strtotime(horadesde.Text);
  fechahasta.Time:=strtotime(horahasta.Text);
  Qnct.ParamByName('NROSUC').AsString:=ticket.sucursal;
  Qnct.ParamByName('FECDESDE').AsDatetime:=fechadesde.Datetime;
  Qnct.ParamByName('FECHASTA').AsDatetime:=fechahasta.Datetime;
  Qnct.ParamByName('PASOXCAJA').Asstring:='S';
  Qnct.Open;

  Qnct.First;

   While not Qnct.Eof do
    BEGIN
     if Qnct.Fields[0].AsString='GAS' then
     BEGIN
       EGASTOS.Text:=floattostr(Qnct.Fields[3].Asfloat);
     if egastos.Text='' then
     begin
       egastos.text:='0';
     end;
     END;
     if Qnct.Fields[0].AsString='NCT' then
     BEGIN
       Enct.Text:=floattostr(Qnct.Fields[3].Asfloat);
       nctcantidad.Text:=Qnct.Fields[2].AsString;
       EIVANCB.Text:=floattostr(Qnct.Fields[1].Asfloat);
     if nctcantidad.Text='' then
     begin
       nctcantidad.text:='0';
     end;
       if enct.Text='' then
     begin
       enct.text:='0';
     end;
     END;
     if Qnct.Fields[0].AsString='NCA' then
     BEGIN
       EncA.Text:=floattostr(Qnct.Fields[3].Asfloat);
       ncacantidad.Text:=Qnct.Fields[2].AsString;
       EIVANCA.Text:=floattostr(Qnct.Fields[1].Asfloat);
     if ncacantidad.Text='' then
     begin
       ncacantidad.text:='0';
     end;
       if enca.Text='' then
     begin
       enca.text:='0';
     end;
     END;

     Qnct.Next;


    END;
   if  Qnct.RecordCount=0 then
   begin
     egastos.Text:='0';
     enct.Text:='0';
     enca.Text:='0';
     ncacantidad.Text:='0';
     nctcantidad.Text:='0';
   end;


  qzetas.Database:=base;
  qzetas.Close;
  qzetas.SQL.Clear;
  qzetas.SQL.text:=concat(' select                ',
                          '  SUBSTR(v.nro_comprobante, 1, 2) as ZETA, ',
                          '  (substring(v.tip_comprobante   FROM 3  FOR 3) )as tip_comprobante,  ',
                          '  SUM (cast(v.imp_bruto as decimal(10,3))) as bruto, ',
                          '  count(DISTINCT v.nro_comprobante) as tk, ',
                          '  sum(cast(i.imp_iva+i.imp_iva_desc as decimal(10,3)))  as iva, ',
                          '  sum(case when i.por_porcentaje>0 then (cast(i.imp_netograv+i.imp_netograv_desc as decimal(10,3))) end ) as netogravado, ',
                          '  sum(case when i.por_porcentaje=0 then (cast(i.imp_netograv+i.imp_netograv_desc as decimal(10,3))) end ) as netonogravado, ',
                          '  sum(cast(i.imp_netograv_desc as decimal(10,3))) as netogravdesc, ',
                          '  sum(cast(i.imp_iva_desc+i.imp_iva+i.imp_netograv+i.imp_netograv_desc as decimal(10,3))) as IMPORTES ',
                          '  from vtmacomprobemitido v ',
                          '  inner join vtmatipcomprob t on v.tip_comprobante=t.tip_comprobante ',
                          '  left join mkmacliente c on v.cod_cliente=c.cod_cliente ',
                          '  inner join vtmaporcentajesiva i  on i.tip_comprobante=t.tip_comprobante and  v.nro_comprobante=i.nro_comprobante and v.nro_sucursal=i.nro_sucursal,  ',
                          '  sumasucursal s ',
                          '  where  v.nro_sucursal=s.nro_sucursal  ',
                          '  and s.nro_sucursal=i.nro_sucursal  ',
                          '  and (CAST(v.fec_comprobante AS DATE))  between (:desde) and (:hasta) ',
                          '  and v.NRO_SUCURSAL=:sucursal ',
                          '  AND T.MAR_SUBDIA = ''V'' ',
                          '  anD t.tip_comprobante  NOT IN (''NCT'',''NCA'',''TKM'',''NCM'') ',
                          '  group by 1,2 ');



  qzetas.ParamByName('desde').AsDate:=fechadesde.Date;
  qzetas.ParamByName('hasta').AsDate:=fechahasta.Date;
  qzetas.ParamByName('sucursal').Asstring:=ticket.sucursal;
  qzetas.Open;
  cdszetas.Close;
  if NOT QZETAS.IsEmpty then
  BEGIN
  qzetas.first;
    While not QZETAS.Eof do
    BEGIN
                           if CDSZETAS.Active=false then
                            begin
                              CDSZETAS.CreateDataSet;
                              CDSZETAS.Active:=true;
                            end;
                            CDSZETAS.Append;

                             prueba:=qZETAS.FieldByName('tip_comprobante').AsSTRING;

                            if TextToFloat(PChar(prueba),Valor,fvExtended) then
                            begin
                            CDSZETASZETA.AsSTRING:=copy(qZETAS.FieldByName('ZETA').AsString,1,1);
                            end;
                            if not TextToFloat(PChar(prueba),Valor,fvExtended) then
                            begin

                            CDSZETASZETA.AsSTRING:=copy(qZETAS.FieldByName('ZETA').AsString,1,2);
                            end;

                            CDSZETASIMPORTE.AsFloat:=qZETAS.FieldByName('IMPORTES').AsFLOAT;
                            CDSZETASCOMPROBANTE.AsString:=qZETAS.FieldByName('tip_comprobante').AsSTRING;
                            CDSZETASIVA.AsFloat:=qZETAS.FieldByName('IVA').AsFLOAT;
                            cdszetasBRUTO.AsFloat:=qZETAS.FieldByName('BRUTO').AsFLOAT;
                            CDSZETASNETOGRAVADO.AsFloat:=qZETAS.FieldByName('NETOGRAVADO').AsFLOAT;
                            CDSZETASNETONOGRAVADO.AsFloat:=qZETAS.FieldByName('NETONOGRAVADO').AsFLOAT;
                            CDSZETASNETOGRAVDESC.AsFloat:=qZETAS.FieldByName('NETOGRAVDESC').AsFLOAT;
                            CDSZETASCANTIDAD.AsString:=qzetas.FieldByName('tk').AsString;
                            CDSZETAS.Post;
                            qzetas.Next;


    END;

  END;

//-----------------------------------------mierda que no entra en el open----------------------------------------------//
//----------ctacte------------------------------

  url:=ticket.url+'get_clientesControlados.php';

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);
  Doc:=LoadXMLData(s);

  doc.DocumentElement.ChildNodes.Count;

  for I := 0 to doc.DocumentElement.ChildNodes.Count -1 do
  begin
  j:=j+1;

    SUCURSAL:=doc.DocumentElement.ChildNodes[I].ChildNodes['cuit'].Text;
    sucursal:=StringReplace( sucursal, '-', '',[rfReplaceAll, rfIgnoreCase]);
    sucursal:=StringReplace( sucursal, ' ', '',[rfReplaceAll, rfIgnoreCase]);
     if i=0 then
     begin
       if sucursal<>'' then
       begin
         if TryStrToInt64(SUCURSAL, VALOR2) then
         BEGIN
         cuit:=''''+sucursal+''''
         END;

       end;
     end;
     if i>0 then
     begin
       if sucursal<>'' then
       begin
          if TryStrToInt64(SUCURSAL, VALOR2) THEN
          BEGIN
          cuit:=cuit+','+''''+sucursal+'''';
          END;

       end;
     end;




  end;







  qboni.Database:=base;
  qboni.Close;
  qboni.SQL.Clear;
  qboni.SQL.text:=concat('select v.tip_comprobante, sum(v.imp_ctacte)as IMPORTE  ',
                         '  FROM                                                  ',
                         '  vttbpagoctacte v , VTMACOMPROBEMITIDO vt, mkmacliente c where ',
                         ' v.NRO_SUCURSAL = vt.NRO_SUCURSAL                                ',
                         ' and v.TIP_COMPROBANTE = vt.TIP_COMPROBANTE                       ',
                         ' and v.NRO_COMPROBANTE = vt.NRO_COMPROBANTE                        ',
                         ' and vt.cod_cliente=c.cod_cliente                                    ',
                         ' and   (CAST(vT.FEC_COMPROBANTE as date)) between :desde and :hasta   ',
                         ' and v.nro_sucursal=:sucursal  ',
                         ' and vt.nro_caja=:caja  ',
                         ' and c.nro_cuit  in (');
 qboni.SQL.text:=concat( qboni.SQL.text+cuit+')');
 qboni.SQL.Text:=concat( qboni.SQL.text+' group by 1' );
 qboni.SQL.SaveToFile('caja.sql');
 qboni.ParamByName('desde').AsDate:=fechadesde.Date;
 qboni.ParamByName('hasta').AsDate:=fechahasta.Date;
 qboni.ParamByName('sucursal').Asstring:=ticket.sucursal;
 qboni.ParamByName('caja').Asstring:=dmfacturador.ibcajanombre.Fields[0].AsString;

 qboni.Open;
 CALCULO:=0;
 CALCULO2:=0;
 ENNCB.TEXT:='0';
 ENNCA.TEXT:='0';
 ENDB.TEXT:='0';
 EFM.TEXT:='0';
 EFA.Text:='0';
 EFB.Text:='0';
  QBONI.First;




  while not QBONI.Eof do
  BEGIN
    if NOT qboni.IsEmpty then
      BEGIN
        if qBONI.FieldByName('tip_comprobante').AsString='NCT' then
        BEGIN
         ENNCB.TEXT:=FLOATTOSTR(qBONI.FieldByName('IMPORTE').AsFLOAT);
         ecuentac.Text:=(formatfloat('0.00' ,strtofloat(ecuentac.Text)+(qBONI.FieldByName('IMPORTE').AsFLOAT)));
        END;
        if qBONI.FieldByName('tip_comprobante').AsString='NCA' then
        BEGIN
         ENNCA.TEXT:=FLOATTOSTR(qBONI.FieldByName('IMPORTE').AsFLOAT);
         ecuentac.Text:=formatfloat('0.00',strtofloat(ecuentac.Text)+(qBONI.FieldByName('IMPORTE').AsFLOAT));
        END;
        if qBONI.FieldByName('tip_comprobante').AsString='NDB' then
        BEGIN
         ENDB.TEXT:=FLOATTOSTR(qBONI.FieldByName('IMPORTE').AsFLOAT);
         ecuentac.Text:=formatfloat('0.00',strtofloat(ecuentac.Text)-(qBONI.FieldByName('IMPORTE').AsFLOAT));
        END;
        if qBONI.FieldByName('tip_comprobante').AsString='TKM' then
        BEGIN
         eFM.Text:=FLOATTOSTR(qBONI.FieldByName('IMPORTE').AsFLOAT);
         ecuentac.Text:=formatfloat('0.00',strtofloat(ecuentac.Text)-(qBONI.FieldByName('IMPORTE').AsFLOAT));
        END;
        if qBONI.FieldByName('tip_comprobante').AsString='TKA' then
        BEGIN
         EFA.TEXT:=FLOATTOSTR(qBONI.FieldByName('IMPORTE').AsFLOAT);
         ecuentac.Text:=formatfloat('0.00',strtofloat(ecuentac.Text)-(qBONI.FieldByName('IMPORTE').AsFLOAT));
        END;
        if qBONI.FieldByName('tip_comprobante').AsString='TKB' then
        BEGIN
         EFB.TEXT:=FLOATTOSTR(qBONI.FieldByName('IMPORTE').AsFLOAT);
         ecuentac.Text:=formatfloat('0.00',strtofloat(ecuentac.Text)-(qBONI.FieldByName('IMPORTE').AsFLOAT));
        END;

    END;
    QBONI.Next;
    end;




 //-----------------------------------------mierda que no entra en el open----------------------------------------------//





  qpcc.Database:=base;
  qpcc.Close;
  qpcc.SQL.Clear;
  qpcc.SQL.text:=concat('    select vt.tip_comprobante,SUM(VT.imp_neto) as importe ',
                         '     FROM                           ',
                         '     VTMACOMPROBEMITIDO vt where  ',
                         '     (CAST(vT.FEC_COMPROBANTE as date)) between :desde and :hasta ',
                         '     and vt.tip_comprobante like ''%CC%'' ',
                         '     and vt.nro_caja=:caja      ',
                         '     AND VT.nro_sucursal=:sucursal  ',
                         '     group by 1');



  qpcc.ParamByName('desde').AsDate:=fechadesde.Date;
  qpcc.ParamByName('hasta').AsDate:=fechahasta.Date;
  qpcc.ParamByName('sucursal').Asstring:=ticket.sucursal;
  qpcc.ParamByName('caja').Asstring:=dmfacturador.ibcajanombre.Fields[0].AsString;
  qpcc.Open;

  if NOT qpcc.IsEmpty then
  BEGIN

   epagoscc.Text:=qpcc.FieldByName('IMPORTE').AsString;



  end;


  blimpiartodo.Enabled:=true;
  bguardar.Enabled:=true;
  breporte.Enabled:=true;

lcaja.Caption:=combocaja.Text;



END;











procedure TFcajaenviar2.bhistoricoClick(Sender: TObject);
VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  SUCURSAL, STOCK: STRING;
  reg: tregistry;
  detalleval:ixmlnode;
  fechadesde: string;
  fechahasta: string;
  fecha: string;
  Cajero: string;
  Efectivo_contado: string;
  Efectivo_sistema: string;
  Efectivo_diferencia: string;
  Tarjeta_contado: string;
  Tarjeta_sistema: string;
  Tarjeta_diferencia: string;
  Gastos:string;
  nca_emitidas: string;
  ncb_emitidas: string;
  id_caja: string;

begin
s:='';
try

  fechadesde:=formatdatetime('yyyy-mm-dd',(desdehis.Date));
  fechahasta:=formatdatetime('yyyy-mm-dd',(hastahis.date));
  url:=ticket.url+'get_cajas_diarias.php?sucursal_id='+ticket.sucursal+'&f_desde='+fechadesde+'&f_hasta='+fechahasta;

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);
  j:=0;
  Doc:=LoadXMLData(s);
  cdscajas.Close;
  if doc.DocumentElement.ChildNodes.Count>0 then
  begin
    detalleval:=doc.DocumentElement.ChildNodes[0];
    for I := 0 to doc.DocumentElement.ChildNodes.Count -1 do
    begin
       detalleval:=doc.DocumentElement.ChildNodes[i];


      id_caja:=detalleval.ChildNodes['CajaDiariaLine_Id'].Text;
      SUCURSAL:=detalleval.ChildNodes['Sucursal_Id'].Text;
      fecha:=detalleval.ChildNodes['fecha'].Text;
      Cajero:=detalleval.ChildNodes['Cajero'].Text;
      Efectivo_contado:=detalleval.ChildNodes['Efectivo_contado'].Text;
      Efectivo_sistema:= detalleval.ChildNodes['Efectivo_sistema'].Text;
      Efectivo_diferencia:= detalleval.ChildNodes['Efectivo_diferencia'].Text;
      Tarjeta_contado:=detalleval.ChildNodes['Tarjeta_contado'].Text;
      Tarjeta_sistema:= detalleval.ChildNodes['Tarjeta_sistema'].Text;
      Tarjeta_diferencia:= detalleval.ChildNodes['Tarjeta_diferencia'].Text;
      Gastos:=  detalleval.ChildNodes['Gastos'].Text;
      nca_emitidas:=  detalleval.ChildNodes['nca_emitidas'].Text;
      ncb_emitidas:=  detalleval.ChildNodes['ncb_emitidas'].Text;

      if cdscajas.Active=false then
          begin
            cdscajas.CreateDataSet;
            cdscajas.Active:=true;
          end;
        cdscajas.Append;
        cdscajasfecha.AsString:=fecha;
        cdscajascajero.AsString:=cajero;
        cdscajasid_caja.AsString:=id_caja;
        cdscajasefectivo_contado.asstring:=efectivo_contado;
        cdscajasefectivo_sistema.AsString:=efectivo_sistema;
        cdscajasefectivo_diferencia.asstring:=efectivo_diferencia;
        cdscajastarjeta_contado.AsString:=tarjeta_contado;
        cdscajastarjeta_sistema.AsString:=tarjeta_sistema;
        cdscajastarjeta_diferencia.AsString:=tarjeta_diferencia;
        cdscajasgastos.AsString:=gastos;
        cdscajasnca_emitidas.AsString:=nca_emitidas;
        cdscajasncb_emitidas.AsString:=ncb_emitidas;




     end;





 end;
     except
        on E: Exception do
        begin
          {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
        end;

        end;


//http://192.168.201.12/webapps/get_cajas_diarias.php?sucursal_id=7&f_desde=2017-05-17&f_hasta=2017-05-17
end;


procedure TFcajaenviar2.bguardarClick(Sender: TObject);

VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  SUCURSAL, STOCK: STRING;
  reg: tregistry;
  detalleval:ixmlnode;
  z_pv:tstrings;
  z_sis:tstrings;
  z_cont:tstrings;
  z_pvcoma:string;
  z_contcoma: string;
  z_siscoma:string;
  z_netogravado:tstrings;
  z_netogravadodesc:tstrings;
  z_netonogravado:tstrings;
  z_iva:tstrings;
  z_netogracoma: string;
  z_netogradesccoma:string;
  z_netonogravadocoma: string;
  z_ivacoma:string;
  stringcaja:string;
  stringconv:string;
  comentarios:string;
  boni:double;
  gentilezas: double;
begin
gzeta.DataSource.DataSet.First;
  while not Gzeta.DataSource.DataSet.Eof do
  Begin
  cdszetas.edit;
   if Gzeta.Fields[2].AsString='' then
   begin

      cdszetastestigo.asinteger:=0;

   end;
   cdszetasdiferencia.asfloat:=Gzeta.Fields[1].Asfloat-Gzeta.Fields[2].Asfloat;
   gzeta.DataSource.DataSet.next;
  End;
s:='';
z_pv := TStringList.Create;
z_sis := TStringList.Create;
z_cont := TStringList.Create;
z_netogravado:= TStringList.Create;
z_netogravadodesc:= TStringList.Create;
z_netonogravado:= TStringList.Create;
z_iva:= TStringList.Create;

 gzeta.DataSource.DataSet.First;
while not gzeta.DataSource.DataSet.Eof do
begin
  z_pv.Add(gzeta.Fields[0].AsString);
  if gzeta.Fields[1].AsString='' then
  begin
  z_sis.add('0');
  end;
  if gzeta.Fields[1].AsString<>'' then
  begin
  z_sis.add(gzeta.Fields[1].AsString);
  end;
  if gzeta.Fields[2].AsString='' then
  begin
  z_cont.add('0');
  end;
  if gzeta.Fields[2].AsString<>'' then
  begin
  z_cont.add(gzeta.Fields[2].AsString);
  end;

  if gzeta.Fields[7].AsString='' then
  begin
  z_netogravado.add('0');
  end;
  if gzeta.Fields[7].AsString<>'' then
  begin
  z_netogravado.add(gzeta.Fields[7].AsString);
  end;
   if gzeta.Fields[9].AsString='' then
  begin
  z_netogravadodesc.add('0');
  end;
  if gzeta.Fields[9].AsString<>'' then
  begin
  z_netogravadodesc.add(gzeta.Fields[9].AsString);
  end;
  if gzeta.Fields[8].AsString='' then
  begin
  z_netonogravado.add('0');
  end;
  if gzeta.Fields[8].AsString<>'' then
  begin
  z_netonogravado.add(gzeta.Fields[8].AsString);
  end;
  if gzeta.Fields[6].AsString='' then
  begin
  z_iva.add('0');
  end;
  if gzeta.Fields[6].AsString<>'' then
  begin
  z_iva.add(gzeta.Fields[6].AsString);
  end;



  gzeta.DataSource.DataSet.next;
end;

z_pvcoma:=z_pv.CommaText;
z_siscoma:=z_sis.CommaText;
z_contcoma:=z_cont.CommaText;
z_netogracoma:= z_netogravado.CommaText;
z_netogradesccoma:= z_netogravadodesc.CommaText;
z_netonogravadocoma:= z_netonogravado.CommaText;
z_ivacoma:= z_iva.CommaText;

try
  qgenti.Database:=base;
  qgenti.Close;
  qgenti.SQL.Clear;
  qgenti.SQL.text:=concat(' select sum(imp_cargoos) as importe from osmamovobrasocial O where cod_planos=''Z87'' AND (CAST(o.fec_comprob as date)) between :desde and :hasta and nro_sucursal=:NROSUC');
  qgenti.ParamByName('NROSUC').AsString:=ticket.sucursal;
  qgenti.ParamByName('desde').AsDatetime:=fechadesde.Datetime;
  qgenti.ParamByName('hasta').AsDatetime:=fechahasta.Datetime;
  Egenti.Text:=floatTostr(gentilezas);
  qgenti.Open;
  gentilezas:=qgenti.Fieldbyname('importe').Asfloat;

  boni:=strtofloat(enncb.Text)+strtofloat(ennca.Text);
  stringcaja:=combocaja.Text;
  stringconv:=stringreplace(stringcaja,' ','-', [rfReplaceAll]);
  if STRINGCONV<>'TODAS' then
  BEGIN
  comentarios:=stringreplace(mcomentarios.Text,' ','-', [rfReplaceAll]);
  url:=ticket.url+'caja_diaria_save_4.php?sucursal_num='+ticket.sucursal+'&cajero='+stringconv+'&fecha='+datetostr(fechahasta.Date)+'&efec_sis='+eefectivo.Text+'&efec_cnt='+
  efenvian.text+'&tc_sis='+etarjeta.Text+'&tc_cnt='+enviatarjeta.Text+'&gastos='+egastos.Text+
  '&primer_nc=0&ult_nc=0&nca_emitidas='+ncacantidad.Text+'&ncb_emitidas='+nctcantidad.Text+'&comentario='+comentarios+'&z_pv='+z_pvcoma+'&z_sis='+z_siscoma+'&z_cont='+z_contcoma+'&neto_grav='+z_netogracoma+
  '&neto_grav_desc='+z_netogradesccoma+'&neto_no_grav='+z_netonogravadocoma+'&iva='+z_ivacoma+'&os='+eos.Text+'&pag_ctacte='+epagoscc.Text+'&ctacte='+ecuentac.text+'&bonif='+floattostr(boni)+
  '&ncb_pesos='+enct.text+'&nca_pesos='+enca.text+'&iva_nca='+eivanca.Text+'&iva_ncb='+eivancb.text+'&gentilezas='+floattostr(gentilezas);

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);
  END;
  if STRINGCONV='TODAS' then
  BEGIN
  comentarios:=stringreplace(mcomentarios.Text,' ','-', [rfReplaceAll]);
  url:=ticket.url+'caja_diaria_save2.php?sucursal_num='+ticket.sucursal+'&cajero='+
  stringconv+'&fecha='+datetostr(fechahasta.Date)+'&efec_sis='+'0'+'&efec_cnt='+'0'+'&tc_sis='+'0'+'&tc_cnt='+'0'+'&gastos='+'0'+'&primer_nc=0&ult_nc=0&nca_emitidas='+'0'+'&ncb_emitidas='+'0'+'&comentario='+comentarios+'&z_pv='+z_pvcoma+'&z_sis='+z_siscoma+'&z_cont='+z_contcoma;
  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);


  END;

   except
      on E: Exception do
      begin
      {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
      end;

      end;
  subirarchivos;
//  campo(gentilezas)

  showmessage('CAJA SUBIDA CON EXITO');


end;

procedure TFcajaenviar2.BlimpiartodoClick(Sender: TObject);
begin
fechadesde.Date:=now;
fechahasta.Date:=now;
eefectivo.Text:='0';
etarjeta.Text:='0';
echeque.Text:='0';
etotal.Text:='0';
ediferencia.Text:='0';
efenvian.Text:='0';
enviatarjeta.Text:='0';
enviacheque.Text:='0';
etotalenvia.Text:='0';
ecuentac.Text:='0';
egastos.Text:='0';
enct.Text:='0';
enca.Text:='0';

eos.Text:='0';
edolar.Text:='0';
eeuro.Text:='0';
nctcantidad.Text:='0';
ncacantidad.Text:='0';
mcomentarios.Lines.Clear;
cdszetas.Close;
 valuepesos.Values['$1']:='0';
 valuepesos.Values['$2']:='0';
 valuepesos.Values['$5']:='0';
 valuepesos.Values['$10']:='0';
 valuepesos.Values['$20']:='0';
 valuepesos.Values['$50']:='0';
 valuepesos.Values['$100']:='0';
 valuepesos.Values['$200']:='0';
 valuepesos.Values['$500']:='0';
 valuepesos.Values['$1000']:='0';
 valuepesos.Values['$2000']:='0';
 valuepesos.Values['$5000']:='0';
 valuepesos.Values['$10000']:='0';
 valuepesos.Values['$20000']:='0';
 valuepesos.Values['Otras']:='0';
 vtarjeta.Values['Visa']:='0';
 vtarjeta.Values['Maestro']:='0';
 vtarjeta.Values['Mastercard']:='0';
 vtarjeta.Values['Naranja']:='0';
 vtarjeta.Values['Electron']:='0';
 vtarjeta.Values['Cabal']:='0';
 vtarjeta.Values['American']:='0';
 vtarjeta.Values['TDF']:='0';
 vtarjeta.Values['Otras']:='0';
 vtarjeta.Values['Nativa']:='0';
 vtarjeta.Values['QR']:='0';
 blimpiartodo.Enabled:=false;
 bguardar.Enabled:=false;
 breporte.Enabled:=false;



end;

procedure TFcajaenviar2.breporteClick(Sender: TObject);
var
reg: tregistry;
begin
gzeta.DataSource.DataSet.First;
  while not Gzeta.DataSource.DataSet.Eof do
  Begin
  cdszetas.edit;
   if Gzeta.Fields[2].AsString='' then
   begin

      cdszetastestigo.asinteger:=0;

   end;
   cdszetasdiferencia.asfloat:=Gzeta.Fields[2].Asfloat-Gzeta.Fields[1].Asfloat;
   gzeta.DataSource.DataSet.next;
  End;
Reg := TRegistry.Create;
Reg.RootKey := HKEY_CURRENT_USER;
Reg.OpenKey(regKey,true);
dmfacturador.cdsreportecaja.Close;
if dmfacturador.cdsreportecaja.Active=false then
          begin
            dmfacturador.cdsreportecaja.CreateDataSet;
            dmfacturador.cdsreportecaja.Active:=true;
          end;
          dmfacturador.cdsreportecaja.Append;
          dmfacturador.cdsreportecajacaja.AsString:=lcaja.Caption;
          dmfacturador.cdsreportecajaefectivosis.AsFloat:=strtofloat(eefectivo.Text);
          dmfacturador.cdsreportecajatarjetasis.AsFloat:=strtofloat(etarjeta.Text);
          dmfacturador.cdsreportecajaTOTALSIS.AsFloat:=strtofloat(etotal.Text);
          dmfacturador.cdsreportecajadiferencia.AsFloat:=strtofloat(ediferencia.Text);
          dmfacturador.cdsreportecajaefectivo.AsFloat:=strtofloat(efenvian.Text);
          dmfacturador.cdsreportecajatarjeta.AsFloat:=strtofloat(enviatarjeta.Text);
          dmfacturador.cdsreportecajachequesis.AsFloat:=strtofloat(echeque.Text);
          dmfacturador.cdsreportecajatotal.AsFloat:=strtofloat(etotalenvia.Text);
          dmfacturador.cdsreportecajaCuentac.AsFloat:=strtofloat(ecuentac.Text);
          dmfacturador.cdsreportecajagastos.AsFloat:=strtofloat(egastos.Text);
          dmfacturador.cdsreportecajanctb.AsFloat:=strtofloat(enct.Text);
          dmfacturador.cdsreportecajanca.AsFloat:=strtofloat(enca.Text);
          dmfacturador.cdsreportecajacantidadnct.AsFloat:=strtofloat(nctcantidad.Text);
          dmfacturador.cdsreportecajacantidadnca.AsFloat:=strtofloat(ncacantidad.Text);
          dmfacturador.cdsreportecajacheque.AsFloat:=strtofloat(enviacheque.Text);
          dmfacturador.cdsreportecajaef1.asstring:=(valuepesos.Values['$1']);
          dmfacturador.cdsreportecajaef2.asstring:=(valuepesos.Values['$2']);
          dmfacturador.cdsreportecajaef5.asstring:=(valuepesos.Values['$5']);
          dmfacturador.cdsreportecajaef10.asstring:=(valuepesos.Values['$10']);
          dmfacturador.cdsreportecajaef20.asstring:=(valuepesos.Values['$20']);
          dmfacturador.cdsreportecajaef50.asstring:=(valuepesos.Values['$50']);
          dmfacturador.cdsreportecajaef100.asstring:=(valuepesos.Values['$100']);
          dmfacturador.cdsreportecajaef200.asstring:=(valuepesos.Values['$200']);
          dmfacturador.cdsreportecajaef500.asstring:=(valuepesos.Values['$500']);
          dmfacturador.cdsreportecajaef1000.asstring:=(valuepesos.Values['$1000']);
          dmfacturador.cdsreportecajaef2000.AsString:=(valuepesos.Values['$2000']);
          dmfacturador.cdsreportecajaef5000.AsString:=(valuepesos.Values['$5000']);
          dmFacturador.cdsreportecajaef10000.AsString:=(valuepesos.Values['$10000']);
          dmFacturador.cdsreportecajaef20000.AsString:=(valuepesos.Values['$20000']);

          dmfacturador.cdsreportecajaefotras.asstring:=(valuepesos.Values['Otras']);
          dmfacturador.cdsreportecajatarvisa.asstring:=vtarjeta.Values['Visa'];
          dmfacturador.cdsreportecajatarmaestro.asstring:=vtarjeta.Values['Maestro'];
          dmfacturador.cdsreportecajatarmastercard.asstring:=vtarjeta.Values['Mastercard'];
          dmfacturador.cdsreportecajatarnaranja.asstring:=vtarjeta.Values['Naranja'];
          dmfacturador.cdsreportecajatarelectron.asstring:=vtarjeta.Values['Electron'];
          dmfacturador.cdsreportecajatarcabal.asstring:=vtarjeta.Values['Cabal'];
          dmfacturador.cdsreportecajataramerican.asstring:=vtarjeta.Values['American'];
          dmfacturador.cdsreportecajatartdf.asstring:=vtarjeta.Values['TDF'];
          dmfacturador.cdsreportecajatarnativa.asstring:=vtarjeta.Values['Nativa'];
          dmfacturador.cdsreportecajatarotras.asstring:=vtarjeta.Values['Otras'];
          dmfacturador.cdsreportecajatarmastercard.asstring:=vtarjeta.Values['Mastercard'];
          dmfacturador.cdsreportecajatarqr.asstring:=vtarjeta.Values['QR'];
          dmfacturador.cdsreportecajacomentarios.asstring:=mcomentarios.Text;
          dmfacturador.cdsreportecajafechadesde.AsDateTime:=fechadesde.DateTime;
          dmfacturador.cdsreportecajafechahasta.AsDateTime:=fechahasta.DateTime;
          dmfacturador.cdsreportecajapagoscc.AsFloat:=strtofloat(epagoscc.Text);
          dmfacturador.cdsreportecajaos.AsFloat:=strtofloat(eos.Text);
          //dmfacturador.cdsreportecajaboni.AsFloat:=strtofloat(eboni.Text);
          dmfacturador.cdsreportecajadolarenviado.AsFloat:=strtofloat(edolar.Text);
          dmfacturador.cdsreportecajadolarcambio.AsFloat:=strtofloat(ecambiodolar.Text);
          dmfacturador.cdsreportecajaeuroenviado.AsFloat:=strtofloat(eeuro.Text);
          dmfacturador.cdsreportecajaeurocambio.asfloat:=strtofloat(ecambioeuro.Text);
          gzeta.DataSource.DataSet.First;
          dmfacturador.cdszetas.Close;
          while not gzeta.DataSource.DataSet.Eof do
          begin

          if dmfacturador.cdszetas.Active=false then
          begin
            dmfacturador.cdszetas.CreateDataSet;
            dmfacturador.cdszetas.Active:=true;
          end;
          dmfacturador.cdszetas.Append;
          dmfacturador.cdszetaszeta.asstring:=gzeta.fields[0].Asstring;
          dmfacturador.cdszetasimporte.asstring:=gzeta.fields[1].Asstring;
          dmfacturador.cdszetastestigo.asstring:=gzeta.fields[2].Asstring;
          dmfacturador.cdszetasdiferenciazeta.asstring:=gzeta.fields[3].Asstring;
          dmfacturador.cdszetasiva.AsString:=gzeta.fields[6].Asstring;
          gzeta.DataSource.DataSet.Next;
          end;




     if not dmfacturador.cdsreportecaja.IsEmpty then
     begin
     dmfacturador.frxreportecaja.LoadFromFile(Reg.ReadString('Reportes')+'caja.FR3');
     dmfacturador.frxreportecaja.ShowReport(false);
     dmfacturador.cdsreportecaja.Close;

     end;

end;








procedure TFcajaenviar2.Button1Click(Sender: TObject);
var
 form: tfgastos;
 archivoslista: tstringlist;
begin
form := tfgastos.Create(SELF);
form.ShowModal;
if not form.itemscaja.IsEmpty then
begin

rutaarchivos:=form.itemscaja;
archivoslista:=tstringlist.Create ;
split(';',rutaarchivos , archivoslista) ;

ladjuntos.Caption:=inttostr(archivoslista.Count);

end;
if form.itemscaja.IsEmpty then
begin
  rutaarchivos:='';
end;

end;

procedure TFcajaenviar2.Button2Click(Sender: TObject);
begin
subirarchivos;
end;

procedure TFcajaenviar2.echequeChange(Sender: TObject);
begin
totalenviar;
end;

procedure TFcajaenviar2.edolarKeyPress(Sender: TObject; var Key: Char);
var
 variable: string;
begin
if key=#13 then
 begin
   if edolar.Text<>'' then
   begin
    if ecambiodolar.Text<>'' then
    begin
      valuepesos.OnKeyPress(self,key);

     variable:=inttostr(strtoint(valuepesos.Values['$1'])*1+strtoint(valuepesos.Values['$2'])*2+strtoint(valuepesos.Values['$5'])*5+strtoint(valuepesos.Values['$10'])*10+strtoint(valuepesos.Values['$20'])*20+strtoint(valuepesos.Values['$50'])*50+strtoint(valuepesos.Values['$100'])*100+strtoint(valuepesos.Values['$200'])*200+strtoint(valuepesos.Values['$500'])*500+strtoint(valuepesos.Values['$1000'])*1000+strtoint(valuepesos.Values['$2000'])*2000+strtoint(valuepesos.Values['$5000'])*5000+(strtoint(valuepesos.Values['$10000'])*10000)+(strtoint(valuepesos.Values['$20000'])*20000)+strtoint(valuepesos.Values['Otras'])*1);
     variable:=floattostr((strtoint(variable))+(strtofloat(edolar.Text)*strtofloat(ecambiodolar.Text)));
     efenvian.Text:=variable;
    end;
   end;

 end;
end;

procedure TFcajaenviar2.eefectivoChange(Sender: TObject);
begin
totalenviar;
end;

procedure TFcajaenviar2.eeuroKeyPress(Sender: TObject; var Key: Char);
var
 variable: string;
begin
if key=#13 then
 begin
  if eeuro.Text<>'' then
   begin
    if ecambioeuro.Text<>'' then
    begin
      valuepesos.OnKeyPress(self,key);

      variable:=inttostr(strtoint(valuepesos.Values['$1'])*1+strtoint(valuepesos.Values['$2'])*2+strtoint(valuepesos.Values['$5'])*5+strtoint(valuepesos.Values['$10'])*10+strtoint(valuepesos.Values['$20'])*20+strtoint(valuepesos.Values['$50'])*50+strtoint(valuepesos.Values['$100'])*100+strtoint(valuepesos.Values['$200'])*200+strtoint(valuepesos.Values['$500'])*500+strtoint(valuepesos.Values['$1000'])*1000+strtoint(valuepesos.Values['$2000'])*2000+strtoint(valuepesos.Values['$5000'])*5000+strtoint(valuepesos.Values['$10000'])*10000+strtoint(valuepesos.Values['$10000'])*20000+strtoint(valuepesos.Values['Otras'])*1);
      variable:=floattostr(strtofloat(efenvian.Text)+(strtofloat(eeuro.Text)*strtofloat(ecambioeuro.Text)));
      efenvian.Text:=variable;
    end;
   end;

 end;
end;

procedure TFcajaenviar2.EfenvianChange(Sender: TObject);
begin
totalcontado
end;

procedure TFcajaenviar2.enviachequeChange(Sender: TObject);
begin
totalcontado
end;

procedure TFcajaenviar2.enviatarjetaChange(Sender: TObject);
begin
totalcontado
end;

procedure TFcajaenviar2.etarjetaChange(Sender: TObject);
begin
totalenviar;
end;

procedure TFcajaenviar2.etotalChange(Sender: TObject);
begin
totaldiferencia;
end;

procedure TFcajaenviar2.EtotalenviaChange(Sender: TObject);
begin
totaldiferencia;
end;


procedure TFcajaenviar2.FormShow(Sender: TObject);
var

 reg: tregistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);
  base.Connected:=false;
  base.LoginPrompt:=false;
  base.DatabaseName:=reg.ReadString('rutabase');
  base.Params.Values['User_Name']:='SYSDBA';
  base.Params.Values['Password']:='nmpnet';
  base.DefaultTransaction:=dmfacturador.ibtcajanombre;
  if dmfacturador.ibtcajanombre.InTransaction then
  dmfacturador.ibtcajanombre.Rollback;

  base.Connected:=true;
  dmfacturador.ibtcajanombre.StartTransaction;
  dmfacturador.ibcajanombre.Database:=base;
  dmfacturador.ibcajanombre.Close;
  dmfacturador.ibcajanombre.SQL.Clear;
  dmfacturador.ibcajanombre.SQL.Add('SELECT DISTINCT a.NRO_CAJA, a.des_caja FROM cjmacaja a');
  dmfacturador.ibcajanombre.Open;

  dmfacturador.ibcajanombre.First;
  //------------------------insersion en grilla de busqueda--------------//
  if not  dmfacturador.ibcajanombre.IsEmpty then
                 Begin
                   While not dmfacturador.ibcajanombre.Eof do
                       begin
                               if dmfacturador.CDcaja.Active=false then
                                begin
                                  dmfacturador.CDcaja.CreateDataSet;
                                  dmfacturador.CDcaja.Active:=true;
                                end;
                            dmfacturador.CDcaja.Append;
                            dmfacturador.CDcajacaja.AsString:=dmfacturador.ibcajanombre.FieldByName('des_caja').AsString;
                            dmfacturador.ibcajanombre.Next;
                       end;
  {                   dmfacturador.cdcaja.Append;
                     dmfacturador.cdcajacaja.AsString:='TODAS';  }

                 End;

  dmfacturador.cdcaja.First;
  while not  dmfacturador.CDcaja.Eof do
  begin
    combocaja.Items.Add(dmfacturador.CDcajacaja.AsString);
    dmfacturador.cdcaja.next;
  end;
fechadesde.DateTime:=now;
fechahasta.DateTime:=now;
desdehis.DateTime:=now;
hastahis.DateTime:=now;
combocaja.ItemIndex:=0;

pcajas.TabIndex:=0;





end;

procedure TFcajaenviar2.gcajasDblClick(Sender: TObject);
var
  s, url:String;
  j,i,x:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  SUCURSAL, STOCK: STRING;
  reg: tregistry;
  detalleval,zeta, cierre :ixmlnode;
  tfechadesde: string;
  tfechahasta: string;
  fecha: string;
  fechaconv: tdatetime;
  Cajero: string;
  Efectivo_contado: string;
  Efectivo_sistema: string;
  Efectivo_diferencia: string;
  Tarjeta_contado: string;
  Tarjeta_sistema: string;
  Tarjeta_diferencia: string;
  Gastos:string;
  nca_emitidas: string;
  ncb_emitidas: string;
  id_caja: string;
  StrDate : string;
Fmt     : TFormatSettings;
dt      : TDateTime;


begin
   blimpiartodo.Click;
   lcaja.Caption:=Gcajas.Fields[1].AsString;
   eefectivo.Text:=Gcajas.Fields[3].AsString;
   efenvian.Text:=Gcajas.Fields[2].asstring;
   etarjeta.Text:=Gcajas.Fields[6].asstring;
   enviatarjeta.Text:=Gcajas.Fields[5].asstring;
   egastos.Text:=Gcajas.Fields[7].asstring;
   enviatarjeta.Text:=Gcajas.Fields[5].asstring;
   nctcantidad.text:=Gcajas.Fields[9].asstring;
   ncacantidad.text:=Gcajas.Fields[8].asstring;
   fmt.ShortDateFormat:='yyyy-mm-dd';
   fmt.DateSeparator  :='-';
   fmt.LongTimeFormat :='hh:nn:ss';
   fmt.TimeSeparator  :=':';
   StrDate:=(Gcajas.Fields[0].Asstring);
   fechaconv:=StrToDateTime(StrDate,Fmt);



  // fechaconv:=strtodate(Gcajas.Fields[0].Asstring);
   fechadesde.DateTime:=fechaconv;
   fechahasta.DateTime:=fechaconv;
s:='';
try

  tfechadesde:=formatdatetime('yyyy-mm-dd',(desdehis.Date));
  tfechahasta:=formatdatetime('yyyy-mm-dd',(hastahis.date));
  url:=ticket.url+'get_cajas_diarias.php?sucursal_id='+ticket.sucursal+'&f_desde='+tfechadesde+'&f_hasta='+tfechahasta;

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);
  j:=0;
  Doc:=LoadXMLData(s);

  doc.DocumentElement.ChildNodes.Count;
  detalleval:=doc.DocumentElement.ChildNodes[0];
  for I := 0 to doc.DocumentElement.ChildNodes.Count -1 do
  begin
     detalleval:=doc.DocumentElement.ChildNodes[i];

     if Gcajas.Fields[10].asstring=detalleval.ChildNodes['CajaDiariaLine_Id'].Text then
     begin
      zeta:=detalleval.ChildNodes['Cierres_Zeta'];

      for j := 0 to zeta.ChildNodes.Count -1 do
        begin
        cierre:=zeta.ChildNodes[J];




          if CDSZETAS.Active=false then
            begin
            CDSZETAS.CreateDataSet;
            CDSZETAS.Active:=true;
            end;
            CDSZETAS.Append;
            CDSZETASZETA.AsSTRING:=cierre.ChildNodes['PV'].Text;
            CDSZETASIMPORTE.AsFloat:=strtofloat(cierre.ChildNodes['z_sistema'].Text);
            CDSZETASTESTIGO.AsFloat:=strtofloat(cierre.ChildNodes['z_contado'].Text);

          end;
         end;
     end;













pcajas.TabIndex:=0;
breporte.Enabled:=true;
blimpiartodo.Enabled:=true;
bguardar.Enabled:=true;




finally


end;
end;

procedure TFcajaenviar2.gzetaExit(Sender: TObject);
begin
gzeta.DataSource.DataSet.First;
  while not Gzeta.DataSource.DataSet.Eof do
  Begin
  cdszetas.edit;
   if Gzeta.Fields[2].AsString='' then
   begin

      cdszetastestigo.asinteger:=0;

   end;
   cdszetasdiferencia.asfloat:=Gzeta.Fields[1].Asfloat-Gzeta.Fields[2].Asfloat;
   gzeta.DataSource.DataSet.next;
  End;
end;

procedure TFcajaenviar2.gzetaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  cdszetas.edit;
  cdszetasdiferencia.asfloat:=Gzeta.Fields[1].Asfloat-Gzeta.Fields[2].Asfloat;
  gzeta.DataSource.DataSet.next;
end;
end;

procedure TFcajaenviar2.mcomentariosKeyPress(Sender: TObject; var Key: Char);
begin
if ( StrScan('0123456789.qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNM '+chr(7)+chr(8), Key) = nil ) then  Key := #0;

end;

procedure Tfcajaenviar2.SetTicket(unTicket: TTicket);
begin
ticket:=unTicket;

end;



procedure TFcajaenviar2.subirarchivos;
var
rta: string;
Params: TIdMultiPartFormDataStream;
  stringcaja:string;
  stringconv:string;
  archivoslista: tstringlist;
  i: integer;

begin
 stringcaja:=combocaja.Text;

 stringconv:=stringreplace(stringcaja,' ','-', [rfReplaceAll]);

 archivoslista:=tstringlist.Create ;
 Params :=  TIdMultiPartFormDataStream.Create;

 params.AddFormField('sucursal_num',ticket.sucursal);

 params.AddFormField('cajero',stringconv);

 params.AddFormField('fecha',datetostr(fechahasta.Date));

 split(';',rutaarchivos , archivoslista) ;
  if archivoslista.Count>0 then
  begin
    for i := 0 to archivoslista.Count - 1 do
      begin

      Params.AddFile('fileToUpload', archivoslista[i]);

      idHTTP.Request.Referer := ticket.url+'caja_diaria_save_file.php';
      rta:=idhttp.Post(ticket.url+'caja_diaria_save_file.php',params);
      showmessage(rta);
      end;

  end;

end;

procedure TFcajaenviar2.totalcontado;
begin
etotalenvia.Text:=floattostr(strtofloat(efenvian.text)+strtofloat(enviatarjeta.text)+strtofloat(enviacheque.text) )
end;

procedure TFcajaenviar2.totaldiferencia;
begin
ediferencia.Text:=floattostr(strtofloat(etotalenvia.text)-strtofloat(etotal.text) )
end;

procedure TFcajaenviar2.totalenviar;
begin

etotal.Text:=floattostr(strtofloat(eefectivo.text)+strtofloat(etarjeta.text)+strtofloat(echeque.text) )

end;

procedure TFcajaenviar2.valuepesosExit(Sender: TObject);
var
key:char;
variable: string;
begin
 key:=#13;
     valuepesos.OnKeyPress(self,key);
end;

procedure TFcajaenviar2.valuepesosKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
begin
if valuepesos.Values['$1']='' then
begin
  valuepesos.Values['$1']:='0';
end;
if valuepesos.Values['$2']='' then
begin
  valuepesos.Values['$2']:='0';
end;
if valuepesos.Values['$5']='' then
begin
  valuepesos.Values['$5']:='0';
end;
if valuepesos.Values['$10']='' then
begin
  valuepesos.Values['$10']:='0';
end;
if valuepesos.Values['$20']='' then
begin
  valuepesos.Values['$20']:='0';
end;
if valuepesos.Values['$50']='' then
begin
  valuepesos.Values['$50']:='0';
end;
if valuepesos.Values['$100']='' then
begin
  valuepesos.Values['$100']:='0';
end;
if valuepesos.Values['$200']='' then
begin
  valuepesos.Values['$200']:='0';
end;
if valuepesos.Values['$500']='' then
begin
  valuepesos.Values['$500']:='0';
end;
if valuepesos.Values['$1000']='' then
begin
  valuepesos.Values['$1000']:='0';
end;
if valuepesos.Values['$2000']='' then
begin
  valuepesos.Values['$2000']:='0';
end;
if valuepesos.Values['$5000']='' then
begin
  valuepesos.Values['$5000']:='0';
end;

if valuepesos.Values['$10000']='' then
begin
  valuepesos.Values['$10000']:='0';
end;


if valuepesos.Values['$20000']='' then
begin
  valuepesos.Values['$20000']:='0';
end;


if valuepesos.Values['Otras']='' then
begin
  valuepesos.Values['Otras']:='0';
end;

efenvian.Text:=floattostr(strtoint(valuepesos.Values['$1'])*1+strtoint(valuepesos.Values['$2'])*2+strtoint(valuepesos.Values['$5'])*5+strtoint(valuepesos.Values['$10'])*10+strtoint(valuepesos.Values['$20'])*20+strtoint(valuepesos.Values['$50'])*50+strtoint(valuepesos.Values['$100'])*100+strtoint(valuepesos.Values['$200'])*200+strtoint(valuepesos.Values['$500'])*500+strtoint(valuepesos.Values['$1000'])*1000+strtoint(valuepesos.Values['$2000'])*2000+strtoint(valuepesos.Values['$5000'])*5000+ strtoint(valuepesos.Values['$10000'])*10000+strtoint(valuepesos.Values['$20000'])*20000+strtoint(valuepesos.Values['Otras'])*1+(strtofloat(edolar.Text)*strtofloat(ecambiodolar.Text)));

end;
end;

procedure TFcajaenviar2.vtarjetaExit(Sender: TObject);
var
key:char;
begin
 key:=#13;
     vtarjeta.OnKeyPress(self,key);
end;

procedure TFcajaenviar2.vtarjetaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
if vtarjeta.Values['Visa']='' then
begin
  vtarjeta.Values['Visa']:='0';
end;
if vtarjeta.Values['Maestro']='' then
begin
  vtarjeta.Values['Maestro']:='0';
end;
if vtarjeta.Values['Mastercard']='' then
begin
  vtarjeta.Values['Mastercard']:='0';
end;
if vtarjeta.Values['Naranja']='' then
begin
  vtarjeta.Values['Naranja']:='0';
end;
if vtarjeta.Values['Electron']='' then
begin
   vtarjeta.Values['Electron']:='0';
end;
if vtarjeta.Values['Cabal']='' then
begin
  vtarjeta.Values['Cabal']:='0';
end;
if vtarjeta.Values['American']='' then
begin
  vtarjeta.Values['American']:='0';
end;
if vtarjeta.Values['TDF']='' then
begin
  vtarjeta.Values['TDF']:='0';
end;
if vtarjeta.Values['Nativa']='' then
begin
  vtarjeta.Values['Nativa']:='0';
end;
if vtarjeta.Values['Otras']='' then
begin
  vtarjeta.Values['Otras']:='0';
end;
if vtarjeta.Values['QR']='' then
begin
  vtarjeta.Values['QR']:='0';
end;

enviatarjeta.Text:=floattostr(strtofloat(vtarjeta.Values['Visa'])+strtofloat(vtarjeta.Values['Maestro'])+strtofloat(vtarjeta.Values['Mastercard'])+strtofloat(vtarjeta.Values['Naranja'])+strtofloat(vtarjeta.Values['Electron'])+strtofloat(vtarjeta.Values['Cabal'])+strtofloat(vtarjeta.Values['American'])+strtofloat(vtarjeta.Values['TDF'])+strtofloat(vtarjeta.Values['Otras'])+strtofloat(vtarjeta.Values['Nativa'])+strtofloat(vtarjeta.Values['QR']));
end;
end;


end.

unit Uiva;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, udmfacturador, registry, Vcl.CheckLst;
  Const
  RegKey ='Software\Autofarma\APlus\';

type
  Tfiva = class(TForm)
    Panel2: TPanel;
    giva: TDBGrid;
    Bcancelar: TBitBtn;
    Blimpiartodo: TBitBtn;
    enetogravado: TEdit;
    eiva: TEdit;
    enogravado: TEdit;
    Epercepcion: TEdit;
    etotal: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Lrazonsocial: TLabel;
    Ldireccion: TLabel;
    LIIBB: TLabel;
    Lcuit: TLabel;
    dtdesde: TDateTimePicker;
    dthasta: TDateTimePicker;
    bbuscar: TBitBtn;
    Breporte: TBitBtn;
    clsucursal: TCheckListBox;
    Panel5: TPanel;
    Shape2: TShape;
    Label6: TLabel;
    rineto21: TEdit;
    riiva21: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    coneto21: TEdit;
    coiva21: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    rineto0: TEdit;
    coneto0: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Shape3: TShape;
    procedure bbuscarClick(Sender: TObject);
    procedure BreporteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sucursal;
    procedure BlimpiartodoClick(Sender: TObject);
    procedure decla;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fiva: Tfiva;
   sucursales: string;
implementation

{$R *.dfm}

procedure Tfiva.bbuscarClick(Sender: TObject);
var
total: double;
percepcion: double;
nogravado: double;
iva: double;
netogravado: double;
begin
            sucursales:='';
            sucursal;
            dmfacturador.cdsreporteiva.Close;
            dmFacturador.AbrirConexion();
            dmfacturador.qreporteiva.Close;
            dmfacturador.qreporteiva.ParamByName('desde').asdate:=dtdesde.Date;
            dmfacturador.qreporteiva.ParamByName('hasta').asdate:=dtHASTA.Date;
            dmfacturador.qreporteiva.ParamByName('NroSucursalesSeleccion').asstring:='#'+sucursales;

            dmfacturador.qreporteiva.Open;


            if not  dmfacturador.qreporteiva.IsEmpty then
                 Begin
                     if dmfacturador.cdsreporteiva.Active=false then
                            begin
                              dmfacturador.cdsreporteiva.CreateDataSet;
                              dmfacturador.cdsreporteiva.Active:=true;
                            end;
                     While not dmfacturador.qreporteiva.Eof do
                         begin

                            dmfacturador.cdsreporteiva.Append;
                            dmfacturador.cdsreporteivafecha.AsDatetime:=dmfacturador.qreporteiva.FieldByName('FECHA').AsDateTime;
                            dmfacturador.cdsreporteivacomprobante.AsSTRING:='DESDE '+dmfacturador.qreporteiva.FieldByName('MINIMO').AsSTRING+'-HASTA '+dmfacturador.qreporteiva.FieldByName('MAXIMO').AsSTRING ;
                            if dmfacturador.qreporteiva.FieldByName('DES_COMP').AsSTRING='TICKET' THEN
                            BEGIN
                            dmfacturador.cdsreporteivadescripcion.AsString:=dmfacturador.qreporteiva.FieldByName('DES_COMP').AsSTRING+' B';
                            END;
                            if dmfacturador.qreporteiva.FieldByName('DES_COMP').AsSTRING='NOTA DE CREDITO' THEN
                            BEGIN
                            dmfacturador.cdsreporteivadescripcion.AsString:=dmfacturador.qreporteiva.FieldByName('DES_COMP').AsSTRING+' B';
                            END;
                            if (dmfacturador.qreporteiva.FieldByName('DES_COMP').AsSTRING<>'NOTA DE CREDITO') AND (dmfacturador.qreporteiva.FieldByName('DES_COMP').AsSTRING<>'TICKET')   THEN
                            BEGIN
                            dmfacturador.cdsreporteivadescripcion.AsString:=dmfacturador.qreporteiva.FieldByName('DES_COMP').AsSTRING;
                            END;
                            dmfacturador.cdsreporteivacliente.AsString:=dmfacturador.qreporteiva.FieldByName('cliente').AsSTRING;
                            dmfacturador.cdsreporteivacuit.AsString:=dmfacturador.qreporteiva.FieldByName('cuit').AsSTRING;
                            dmfacturador.cdsreporteivanetogravado.AsCurrency:=dmfacturador.qreporteiva.FieldByName('netogravado').Asfloat;
                            dmfacturador.cdsreporteivatasa.Asfloat:=dmfacturador.qreporteiva.FieldByName('por_porcentaje').AsFloat;
                            dmfacturador.cdsreporteivaimporteiva.AsCurrency:=dmfacturador.qreporteiva.FieldByName('iva').Asfloat;
                            dmfacturador.cdsreporteivanogravado.AsCurrency:=dmfacturador.qreporteiva.FieldByName('netonogravado').Asfloat;
                            dmfacturador.cdsreporteivapercepcionibb.AsCurrency:=0.00;
                            dmfacturador.cdsreporteivatotal.AsCurrency:=dmfacturador.qreporteiva.FieldByName('total').Asfloat;
                            total:=total+dmfacturador.qreporteiva.FieldByName('total').Asfloat;
                            percepcion:=percepcion+0;
                            nogravado:=nogravado+dmfacturador.qreporteiva.FieldByName('netonogravado').Asfloat;
                            iva:=iva+dmfacturador.qreporteiva.FieldByName('iva').Asfloat;
                            netogravado:=netogravado+dmfacturador.qreporteiva.FieldByName('netogravado').Asfloat;
                            dmfacturador.qreporteiva.Next;
                         end;
                  etotal.Text:=floattostr(total);
                  epercepcion.Text:=floattostr(percepcion);
                  enogravado.Text:=floattostr(nogravado);
                  eiva.Text:=floattostr(iva);
                  enetogravado.Text:=floattostr(netogravado);
                 End;








 decla;

end;

procedure Tfiva.BlimpiartodoClick(Sender: TObject);
begin
dmfacturador.cdsreporteiva.Close;

end;

procedure Tfiva.BreporteClick(Sender: TObject);
var
reg: tregistry;
begin
if not dmfacturador.cdsreporteiva.IsEmpty then
begin

Reg := TRegistry.Create;
Reg.RootKey := HKEY_CURRENT_USER;
Reg.OpenKey(regKey,true);

if dmfacturador.cdsiva.Active=false then
          begin
            dmfacturador.cdsiva.CreateDataSet;
            dmfacturador.cdsiva.Active:=true;
          end;
         giva.DataSource.DataSet.First;
          while not giva.DataSource.DataSet.Eof do
          begin
          if dmfacturador.cdsiva.Active=false then
          begin
            dmfacturador.cdsiva.CreateDataSet;
            dmfacturador.cdsiva.Active:=true;
          end;
          dmfacturador.cdsiva.Append;
          dmfacturador.cdsivafecha.AsDateTime:=giva.fields[0].Asdatetime;
          dmfacturador.cdsivacomprobante.Asstring:=giva.fields[1].Asstring;
          dmfacturador.cdsivadescripcion.Asstring:=giva.fields[2].Asstring;
          dmfacturador.cdsivacliente.Asstring:=giva.fields[3].Asstring;
          dmfacturador.cdsivacuit.Asstring:=giva.fields[4].Asstring;
          dmfacturador.cdsivanetogravado.asfloat:=giva.fields[5].Asfloat;
          dmfacturador.cdsivatasa.Asinteger:=giva.fields[6].Asinteger;
          dmfacturador.cdsivaimporteiva.Asfloat:=giva.fields[7].Asfloat;
          dmfacturador.cdsivanogravado.Asfloat:=giva.fields[8].Asfloat;
          dmfacturador.cdsivapercepcionibb.Asinteger:=giva.fields[9].Asinteger;
          dmfacturador.cdsivatotal.Asfloat:=giva.fields[10].Asfloat;
          giva.DataSource.DataSet.Next;
          end;
          dmfacturador.cdsivafdesde.AsDateTime:=dtdesde.Datetime;
          dmfacturador.cdsivafhasta.AsDateTime:=dthasta.Datetime;
          dmfacturador.cdsivacuitsucursal.Asstring:=lcuit.Caption;
          dmfacturador.cdsivarazonsocial.Asstring:=lrazonsocial.Caption;
          dmfacturador.cdsivadireccion.Asstring:=ldireccion.Caption;
          dmfacturador.cdsivaiibb.Asstring:=liibb.Caption;
if not dmfacturador.cdsiva.IsEmpty then
     begin
     dmfacturador.frxivareporte.LoadFromFile(Reg.ReadString('Reportes')+'reporteiva.FR3');
     dmfacturador.frxivareporte.ShowReport(false);
     dmfacturador.cdsiva.Close;

     end;
end;
if dmfacturador.cdsdecla.Active=false then
          begin
            dmfacturador.cdsdecla.CreateDataSet;
            dmfacturador.cdsdecla.Active:=true;
          end;
           dmfacturador.cdsdecla.Append;
          dmfacturador.cdsdeclarineto21.asfloat:=strtofloat(rineto21.Text);
          dmfacturador.cdsdeclariiva21.asfloat:=strtofloat(riiva21.Text);
          dmfacturador.cdsdeclaconeto21.asfloat:=strtofloat(coneto21.Text);
          dmfacturador.cdsdeclacoiva21.asfloat:=strtofloat(coiva21.Text);
          dmfacturador.cdsdeclarineto0.asfloat:=strtofloat(rineto0.Text);
          dmfacturador.cdsdeclaconeto0.asfloat:=strtofloat(coneto0.Text);
          dmfacturador.cdsdeclaritotal21.asfloat:=strtofloat(rineto21.Text)+strtofloat(riiva21.Text);
          dmfacturador.cdsdeclacototal21.asfloat:=strtofloat(coneto21.Text)+strtofloat(coiva21.Text);
          dmfacturador.cdsdeclaritotal0.asfloat:=strtofloat(rineto0.Text);
          dmfacturador.cdsdeclacototal0.asfloat:=strtofloat(coneto0.Text);
          dmfacturador.cdsdeclafecha.asdatetime:=now;
          dmfacturador.cdsdeclarazon.asstring:=lrazonsocial.Caption;
          dmfacturador.cdsdeclacuit.asstring:=lcuit.Caption;



if not dmfacturador.cdsDECLA.IsEmpty then
     begin
     dmfacturador.frxreportdecla.LoadFromFile(Reg.ReadString('Reportes')+'decla.FR3');
     dmfacturador.frxreportdecla.ShowReport(false);
     dmfacturador.cdsdecla.Close;

     end;





end;


procedure Tfiva.decla;
begin

            dmFacturador.AbrirConexion();
            dmfacturador.qdecla.Close;
dmfacturador.qdecla.SQL.Text:=concat('select ',
'  case when t.mar_letra=''A'' then ''RESPONSABLE INSCRIPTO'' else ''CONSUMIDOR FINAL'' end as cliente,  ',
'  sum(case when t.tip_comprobante in (''NCT'',''NCA'',''NCM'') THEN cast(v.imp_bruto*-1 as decimal (10,3)) ELSE cast(V.IMP_BRUTO as decimal (10,3)) END )as bruto,  ',
'  sum(case when t.tip_comprobante in (''NCT'',''NCA'',''NCM'') THEN (cast(i.imp_iva+i.imp_iva_desc as decimal (10,3)))*-1 ELSE (cast(i.imp_iva+i.imp_iva_desc as decimal (10,3))) END) as iva,   ',
'  sum(case when i.por_porcentaje>0 then (case when t.tip_comprobante in (''NCT'',''NCA'',''NCM'') THEN (cast(i.imp_netograv+i.imp_netograv_desc as decimal (10,3))*-1) ELSE (cast(i.imp_netograv+i.imp_netograv_desc as decimal (10,3))) END) end )as netogravado,   ',
'  sum(case when i.por_porcentaje=0 then (case when t.tip_comprobante in (''NCT'',''NCA'',''NCM'') THEN (cast(i.imp_netograv+i.imp_netograv_desc as decimal (10,3))*-1) ELSE (cast(i.imp_netograv+i.imp_netograv_desc as decimal (10,3))) END) end) as netonogravado, ',
'  sum(case when t.tip_comprobante in (''NCT'',''NCA'',''NCM'') THEN (cast(i.imp_netograv_desc as decimal (10,3))*-1) ELSE (cast(i.imp_netograv_desc as decimal (10,3)))END )as netogravdesc,   ',
'  sum((case when t.tip_comprobante in (''NCT'',''NCA'',''NCM'') THEN -1 else 1 end)* (cast(i.imp_iva_desc+i.imp_iva+i.imp_netograv+i.imp_netograv_desc as decimal(10,3)))) as total ',
'  from vtmacomprobemitido v ',
'  inner join vtmatipcomprob t on v.tip_comprobante=t.tip_comprobante  ',
'  left join mkmacliente c on v.cod_cliente=c.cod_cliente ',
'  inner join vtmaporcentajesiva i  on i.tip_comprobante=t.tip_comprobante and  v.nro_comprobante=i.nro_comprobante and v.nro_sucursal=i.nro_sucursal, ',
'  sumasucursal s  ',
'  where v.nro_sucursal=s.nro_sucursal   ',
'  and s.nro_sucursal=i.nro_sucursal  ',
'  and (CAST(v.fec_comprobante AS DATE))  between (:desde) and (:hasta)   ',
'  and (cast(:NroSucursalesSeleccion as varchar(222)))  Containing ''#'' || v.NRO_SUCURSAL || ''#'' ',
'  AND T.MAR_SUBDIA = ''V'' ',
'  group by 1 ',
'  order by 1 ');


            rineto21.Text:='0.00';
            riiva21.Text:='0.00';
            rineto0.Text:='0.00';
            COneto21.Text:='0.00';
            COiva21.Text:='0.00';
            COneto0.Text:='0.00';

            dmfacturador.qdecla.ParamByName('desde').asdate:=dtdesde.Date;
            dmfacturador.qdecla.ParamByName('hasta').asdate:=dtHASTA.Date;
            dmfacturador.qdecla.ParamByName('NroSucursalesSeleccion').asstring:='#'+sucursales;
            dmfacturador.qdecla.Open;

            if not  dmfacturador.qdecla.IsEmpty then
                 Begin
                  dmfacturador.qdecla.first;
                  While not dmfacturador.qdecla.Eof do
                  begin
                     if dmfacturador.qdecla.FieldByName('CLIENTE').AsString='RESPONSABLE INSCRIPTO' then
                     BEGIN

                     if dmfacturador.qdecla.FieldByName('NETOGRAVADO').AsString<>'' then
                       begin
                       rineto21.Text:=dmfacturador.qdecla.FieldByName('NETOGRAVADO').AsString;
                       end;
                     if dmfacturador.qdecla.FieldByName('IVA').AsString<>'' then
                       begin
                         riiva21.Text:=dmfacturador.qdecla.FieldByName('IVA').AsString;
                       end;
                       if dmfacturador.qdecla.FieldByName('NETONOGRAVADO').AsString<>'' then
                       begin
                       rineto0.Text:=dmfacturador.qdecla.FieldByName('NETONOGRAVADO').AsString;
                       end;
                     END;

                     if Trim(dmfacturador.qdecla.FieldByName('CLIENTE').AsString)='CONSUMIDOR FINAL' then
                     BEGIN
                     if dmfacturador.qdecla.FieldByName('NETOGRAVADO').AsString<>'' then
                       begin
                       COneto21.Text:=dmfacturador.qdecla.FieldByName('NETOGRAVADO').AsString;
                       end;
                     if dmfacturador.qdecla.FieldByName('IVA').AsString<>'' then
                       begin
                       COiva21.Text:=dmfacturador.qdecla.FieldByName('IVA').AsString;
                       end;
                     if dmfacturador.qdecla.FieldByName('NETONOGRAVADO').AsString<>'' then
                       begin
                       COneto0.Text:=dmfacturador.qdecla.FieldByName('NETONOGRAVADO').AsString;
                       end;
                     END;
                     dmfacturador.qdecla.next;

                  END;










end;
end;

procedure Tfiva.FormShow(Sender: TObject);
begin

            dmfacturador.cdsreporteiva.Close;
            dmFacturador.AbrirConexion();
            dmfacturador.qsucursales.Close;
            dmfacturador.qsucursales.SQL.Text:=concat('select s.nro_sucursal,s.nom_sucursal from sumasucursal s');
            dmfacturador.qsucursales.Open;
            dmfacturador.qsucursales.First;
            while not dmfacturador.qsucursales.Eof do
            begin
            clsucursal.Items.Add(dmfacturador.qsucursales.Fields[0].AsString+'='+dmfacturador.qsucursales.Fields[1].AsString);
            dmfacturador.qsucursales.Next;
            end;

DTDESDE.DateTime:=NOW;
DThasta.DateTime:=NOW;
pagecontrol1.ActivePageIndex := 0;
end;

procedure Tfiva.sucursal;
var
  I:      Integer;

  parsear: string;
  p: integeR;
  parseado: string;
begin

  for I := 0 to clsucursal.Count-1 do
    if clsucursal.Checked[I] then
    begin
    parsear:=Clsucursal.Items[i];
    p := pos ('=',parsear);
    parseado:=Copy(parsear, 1, p-1);
    sucursales:=parseado+'#'+sucursales;

    end;
    dmfacturador.cdsreporteiva.Close;
    dmFacturador.AbrirConexion();
    dmfacturador.qsucursales.Close;
    dmfacturador.qsucursales.SQL.Text:=concat('select s.nom_propietario, s.nro_cuit, s.nro_ingbrutos, s.des_direccion  from sumasucursal S  where s.nro_sucursal=:sucursal');
    dmfacturador.qsucursales.ParamByName('sucursal').AsString:=parseado;
    dmfacturador.qsucursales.Open;
    lcuit.Caption:=dmfacturador.qsucursales.fields[1].AsString;
    ldireccion.Caption:=dmfacturador.qsucursales.fields[3].AsString;
    liibb.Caption:=dmfacturador.qsucursales.fields[2].AsString;
    lrazonsocial.Caption:=dmfacturador.qsucursales.fields[0].AsString;
end;
end.

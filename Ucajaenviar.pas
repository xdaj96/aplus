unit Ucajaenviar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls, udticket, registry, Data.DB,
  IBX.IBDatabase, IBX.IBCustomDataSet, IBX.IBQuery, Datasnap.DBClient, Vcl.Mask ;
   Const
  RegKey ='Software\Autofarma\APlus\';

type
  Tfcajaenviar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    eefectivo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    etarjeta: TEdit;
    Efenvian: TEdit;
    Edit5: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    Shape1: TShape;
    fechacomprobante: TDateTimePicker;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    Blimpiartodo: TBitBtn;
    Label10: TLabel;
    echeque: TEdit;
    Edit9: TEdit;
    Baceptar: TBitBtn;
    transzetas: TIBTransaction;
    Dzetas: TDataSource;
    qzetas: TIBQuery;
    base: TIBDatabase;
    qpagos: TIBQuery;
    cdszetas: TClientDataSet;
    cdszetasZETA: TStringField;
    cdszetasIMPORTE: TFloatField;
    cdszetasTESTIGO: TFloatField;
    cdszetasDIFERENCIA: TFloatField;
    qzetasZETA: TIBStringField;
    qzetasIMPORTE: TIBBCDField;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    ef1: TEdit;
    Edit3: TEdit;
    Edit8: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit10: TEdit;
    Label15: TLabel;
    Edit11: TEdit;
    Label16: TLabel;
    Edit12: TEdit;
    Label17: TLabel;
    Edit13: TEdit;
    Label18: TLabel;
    Edit14: TEdit;
    Label19: TLabel;
    Edit15: TEdit;
    Label20: TLabel;
    Edit16: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Shape5: TShape;
    Label23: TLabel;
    Edit17: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label31: TLabel;
    Label32: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label33: TLabel;
    Label34: TLabel;
    Edit1: TEdit;
    Label11: TLabel;
    bcancelar: TBitBtn;
    procedure BaceptarClick(Sender: TObject);
    procedure ef1KeyPress(Sender: TObject; var Key: Char);
    private
   Ticket:TTicket;
    public
    procedure SetTicket(unTicket:TTicket);
    end;

var
  fcajaenviar: Tfcajaenviar;

implementation

{$R *.dfm}

{ Tfcajaenviar }

procedure Tfcajaenviar.BaceptarClick(Sender: TObject);

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
  base.DefaultTransaction:=transzetas;
  if transzetas.InTransaction then
  transzetas.Rollback;

  base.Connected:=true;
  transzetas.StartTransaction;
  qzetas.Database:=base;
  qzetas.Close;
  qzetas.SQL.Clear;
  qzetas.SQL.text:=concat(' select distinct(substring(v.tip_comprobante FROM 3  FOR 3))as zeta, sum(v.imp_bruto) as importe from vtmacomprobemitido  v , ',
                           ' vtmatipcomprob tipo where v.tip_comprobante=tipo.tip_comprobante and v.nro_caja=:caja and  (CAST(v.fec_comprobante AS DATE))=:fecha and tipo.mar_tipoproceso=''F'' group by 1');
  qzetas.ParamByName('caja').AsString:=ticket.cajacambio;
  qzetas.ParamByName('fecha').AsDate:=fechacomprobante.Date;
  qzetas.Open;
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
                            CDSZETASZETA.AsSTRING:=qZETAS.FieldByName('ZETA').AsString;
                            CDSZETASIMPORTE.AsFloat:=qZETAS.FieldByName('IMPORTE').AsFLOAT;
                            CDSZETAS.Post;
                            qzetas.Next;


    END;
  END;
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
  qpagos.Database:=base;
  qpagos.Close;
  qpagos.SQL.Clear;
  qpagos.SQL.text:=concat(' select  ',
                           '     sum(efe.imp_efectivo) as efectivo, ',
                           '     sum(tarj.imp_tarjeta) as tarjeta, ',
                           '     sum(ch.imp_cheque) as cheque ',
                           '     from vtmacomprobemitido v   ',
                           '     left join vttbpagoefectivo efe  on efe.nro_comprobante=v.nro_comprobante   ',
                           '     left join vttbpagotarjeta tarj  on tarj.nro_comprobante=v.nro_comprobante ',
                           '     left join vttbpagocheque ch  on ch.nro_comprobante=v.nro_comprobante ',
                           '     left join vtmatipcomprob tipo on v.tip_comprobante=tipo.tip_comprobante   ',
                           '     where v.nro_caja=:caja  ',
                           '     and v.fec_operativa=:fecha  ',
                           '     and tipo.mar_caja in (''S'')  ');
  qpagos.ParamByName('caja').AsString:=ticket.cajacambio;
  qpagos.ParamByName('fecha').AsDate:=fechacomprobante.Date;
  qpagos.Open;
  eefectivo.Text:=qpagos.FieldByName('efectivo').AsString;
  etarjeta.Text:=qpagos.FieldByName('tarjeta').AsString;
  echeque.Text:=qpagos.FieldByName('cheque').AsString;

end;

procedure Tfcajaenviar.ef1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
    begin
    efenvian.text:=floattostr(strtofloat(efenvian.Text)+strtofloat(ef1.text));
    end;
end;

procedure Tfcajaenviar.SetTicket(unTicket: TTicket);
begin
ticket:=unTicket;
end;

end.

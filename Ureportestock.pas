unit Ureportestock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, udmfacturador,  udticket, registry, Data.DB,
  Datasnap.DBClient, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFreportestock = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edbarras: TEdit;
    edtroquel: TEdit;
    edalfabeta: TEdit;
    ednombre: TEdit;
    edlabo: TEdit;
    Button1: TButton;
    gstock: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    IBQuery1: TIBQuery;
    ClientDataSet1COD_BARRASPRI: TStringField;
    ClientDataSet1NOM_LARGO: TStringField;
    ClientDataSet1CAN_STK: TIntegerField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gstockTitleClick(Column: TColumn);
  private
    { Private declarations }
    Ticket:TTicket;
  public
    { Public declarations }
     procedure SetTicket(unTicket:TTicket);
  end;

var
  Freportestock: TFreportestock;

implementation

{$R *.dfm}

procedure TFreportestock.SpeedButton1Click(Sender: TObject);
var
consulta: string;

begin
IBQUERY1.Close;
clientdataset1.Close;
dmFacturador.AbrirConexion();

 dmFacturador.qstock.Close;
consulta:='(P.COD_ALFABETA=S.COD_ALFABETA)';
IF EDnombre.TEXT<>'' THEN
    BEGIN
    consulta:=consulta+ 'and (P.nom_largo like ''%'+ednombre.text+'%'')';
    END;
IF EDalfabeta.TEXT<>'' THEN
    BEGIN
    consulta:=consulta+ 'and (P.cod_alfabeta like '+edalfabeta.text+')';
    END;
IF EDtroquel.TEXT<>'' THEN
    BEGIN
    consulta:=consulta+ 'and (P.nro_troquel like '+edtroquel.text+')';
    END;
IF EDbarras.TEXT<>'' THEN
    BEGIN
    consulta:=consulta+ 'and (P.cod_barraspri like '+edbarras.text+')';

    END;
IF EDlabo.TEXT<>'' THEN
    BEGIN
    consulta:=consulta+ 'and (P.cod_laboratorio like ''%'+edlabo.text+'%'')';
    END;


    IBQUERY1.SQL.Text :='select p.nom_largo, p.cod_barraspri, s.can_stk from prmaproducto p, prmastock s WHERE'+CONSULTA+ 'AND S.NRO_SUCURSAL=:sucursal';
    IBQUERY1.ParamByName('sucursal').AsString:=ticket.sucursal;
    IBQUERY1.Open;
    if clientdataset1.Active=false then
                            begin
                              clientdataset1.CreateDataSet;
                              clientdataset1.Active:=true;
                            end;
      ibquery1.First;
      While not ibquery1.Eof do
      begin

        clientdataset1.Append;

        clientdataset1cod_Barraspri.AsString:=ibquery1.FieldByName('cod_barraspri').AsSTRING;
        clientdataset1nom_largo.AsString:=ibquery1.FieldByName('nom_largo').AsSTRING;
        clientdataset1can_stk.AsString:=ibquery1.FieldByName('can_stk').AsSTRING;
        ibquery1.next;
      end;








 









end;
procedure TFreportestock.SpeedButton2Click(Sender: TObject);
begin
EDALFABETA.Text:='';
EDTROQUEL.Text:='';
EDBARRAS.Text:='';
EDNOMBRE.Text:='';
EDLABO.Text:='';
dmfacturador.qstock.Close;
dmfacturador.cdsstock.Close;
clientdataset1.close;
end;

procedure TFreportestock.Button1Click(Sender: TObject);
var
reg: tregistry;
begin
Reg := TRegistry.Create;
Reg.RootKey := HKEY_CURRENT_USER;
Reg.OpenKey(regKey,true);
dmfacturador.cdsstock.close;
gstock.DataSource.DataSet.first;
while not gstock.DataSource.DataSet.Eof do
    begin

         if dmfacturador.cdsstock.Active=false then
          begin
            dmfacturador.cdsstock.CreateDataSet;
            dmfacturador.cdsstock.Active:=true;
          end;
          dmfacturador.cdsstock.Append;

          dmfacturador.cdsstockcod_barraspri.Asstring:=gstock.fields[1].Asstring;
          dmfacturador.cdsstocknom_largo.Asstring:=gstock.fields[0].Asstring;
          dmfacturador.cdsstockcantidad.AsString:=gstock.fields[2].Asstring;



      gstock.DataSource.DataSet.Next;
      end;




     if not dmfacturador.cdsstock.IsEmpty then
     begin
     dmfacturador.reportefactonline.LoadFromFile(Reg.ReadString('Reportes')+'stock.FR3');
     dmfacturador.reportefactonline.ShowReport(false);
     dmfacturador.cdsfactura.Close;
     dmfacturador.cdsfacturareporte.Close;
     end;
end;

procedure TFreportestock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmfacturador.qstock.Close;
end;

procedure TFreportestock.gstockTitleClick(Column: TColumn);
begin
clientdataset1.Indexfieldnames:=Column.Field.Fieldname
end;

procedure tfreportestock.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;

end;

end.

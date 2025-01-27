unit liq;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,udticket,udmfacturador, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ImgList, Vcl.ComCtrls,
  Vcl.Buttons;

type
  Tfliquidacion = class(TForm)
    Panel1: TPanel;
    combotipo: TComboBox;
    Label1: TLabel;
    egrupo: TEdit;
    DBGrid1: TDBGrid;
    combopresentacion: TComboBox;
    bpresentacion: TButton;
    datefechalimite: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    StatusBar1: TStatusBar;
    Button3: TButton;
    panelpresentacion: TPanel;
    Label4: TLabel;
    enumeropresentacion: TEdit;
    enombrepresentacion: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edatepresentacion: TDateTimePicker;
    Button1: TButton;
    BitBtn1: TBitBtn;
    panel: TPanel;
    Label7: TLabel;
    lcount: TLabel;
    procedure FormShow(Sender: TObject);
    procedure combotipoSelect(Sender: TObject);
    procedure BcancelarClick(Sender: TObject);
    procedure bpresentacionClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1CellClick(Column: TColumn);
 private
    { Private declarations }
    Ticket:TTicket;
  public
    { Public declarations }
     procedure SetTicket(unTicket:TTicket);
  end;

var
  fliquidacion: Tfliquidacion;

implementation

{$R *.dfm}

{ Tfliquidacion }

procedure Tfliquidacion.BcancelarClick(Sender: TObject);
begin
fliquidacion.Close;
end;

procedure Tfliquidacion.BitBtn1Click(Sender: TObject);
begin

enombrepresentacion.Enabled:=false;
enumeropresentacion.Enabled:=false;
edatepresentacion.Enabled:=false;
panelpresentacion.Visible:=false;

end;

procedure Tfliquidacion.bpresentacionClick(Sender: TObject);
begin
panelpresentacion.Visible:=true;

enombrepresentacion.Enabled:=true;
enumeropresentacion.Enabled:=true;
edatepresentacion.Enabled:=true;
edatepresentacion.DateTime:=now;
end;

procedure Tfliquidacion.Button1Click(Sender: TObject);
begin

combopresentacion.Items.Clear;
dmFacturador.AbrirConexion();
 if dmfacturador.tranpresentacion.InTransaction then
 begin
   dmfacturador.tranpresentacion.Rollback;
 end;

 dmfacturador.qpresentacionnueva.Close;
 dmfacturador.qpresentacionnueva.SQL.Clear;
 dmfacturador.qpresentacionnueva.SQL.Append('insert into osmapresentacion (nro_sucursal, des_presentacion, nro_presentacion,cod_grupo, fec_presentacion)  values (:nro_sucursal,:nombre_presentacion,:nro_presentacion,:cod_grupo, :fecha)');
 dmfacturador.qpresentacionnueva.ParamByName('nro_sucursal').AsString:=ticket.sucursal;
 dmfacturador.qpresentacionnueva.ParamByName('nombre_presentacion').AsString:=enombrepresentacion.Text;
 dmfacturador.qpresentacionnueva.ParamByName('nro_presentacion').AsString:=enumeropresentacion.Text;
 dmfacturador.qpresentacionnueva.ParamByName('cod_grupo').AsString:=egrupo.Text;
 dmfacturador.qpresentacionnueva.ParamByName('fecha').Asdate:=edatepresentacion.DateTime;
 dmfacturador.qpresentacionnueva.Open;
 dmfacturador.tranpresentacion.Commit;

if dmfacturador.tpanel1.InTransaction then
 begin
   dmfacturador.tpanel1.Rollback;
 end;

 dmfacturador.qpresentacion.Close;
 dmfacturador.qpresentacion.SQL.Clear;
 dmfacturador.qpresentacion.SQL.Append('select ide_presentacion,des_presentacion,nro_presentacion from osmapresentacion where cod_grupo=:grupo order by 1 desc');
 dmfacturador.qpresentacion.ParamByName('grupo').AsString:=egrupo.Text;
 dmfacturador.qpresentacion.Open;

 dmfacturador.qpresentacion.First;
 while not dmfacturador.qpresentacion.Eof do
  begin
    combopresentacion.Items.Add(dmfacturador.qpresentacion.Fields[1].Text+'-'+dmfacturador.qpresentacion.Fields[0].Text);
    dmfacturador.qpresentacion.Next;
  end;

enombrepresentacion.Enabled:=false;
enumeropresentacion.Enabled:=false;
edatepresentacion.Enabled:=false;
panelpresentacion.Visible:=false;

end;

procedure Tfliquidacion.Button3Click(Sender: TObject);
var
Splitted: TArray<String>;
texto: string;
ide_presentacion:string;
i : integer;
codigo: string;
begin

texto:=combopresentacion.Text;
splitted:= texto.Split(['-']);
ide_presentacion:=splitted[1];

   if DBGrid1.SelectedRows.Count > 0 then
     with dbgrid1 do
       for i:= 0 to DBGrid1.SelectedRows.Count - 1 do
       begin


         DBGRID1.DataSource.DataSet.GotoBookmark(pointer (DBGRID1.selectedrows[i]));
         codigo:=DBGRID1.FIELDS[0].AsString;
          if dmfacturador.tranliquidacion.InTransaction then
           begin
             dmfacturador.tranliquidacion.Rollback;
           end;

           dmfacturador.qliquidar.Close;
           dmfacturador.qliquidar.SQL.Clear;
           dmfacturador.qliquidar.SQL.Append('select * from osspliquidar (:nro_sucursal,:nro_presentacion,:codigo_plan,:fecha_limite,:fecha_presentacion)');
           dmfacturador.qliquidar.ParamByName('nro_sucursal').AsString:=ticket.sucursal;
           dmfacturador.qliquidar.ParamByName('nro_presentacion').AsString:=ide_presentacion;
           dmfacturador.qliquidar.ParamByName('codigo_plan').AsString:=codigo;
           dmfacturador.qliquidar.ParamByName('fecha_limite').Asdate:=datefechalimite.DateTime;
           dmfacturador.qliquidar.ParamByName('fecha_presentacion').Asdate:=edatepresentacion.DateTime;
           dmfacturador.qliquidar.Open;
           dmfacturador.tranliquidacion.Commit;
       end;


showmessage('Liquidado');









end;

procedure Tfliquidacion.combotipoSelect(Sender: TObject);
var
codigogrupo: string;
Splitted: TArray<String>;
grupo: string;
begin
         grupo:=combotipo.Text;
         splitted:= grupo.Split(['-']);
         codigogrupo:=splitted[1];
         egrupo.Text:=codigogrupo;


dmfacturador.cdsgrupos.Close;
dmFacturador.AbrirConexion();
 if dmfacturador.tpanel1.InTransaction then
 begin
   dmfacturador.tpanel1.Rollback;
 end;

 dmfacturador.qplanes.Close;
 dmfacturador.qplanes.SQL.Clear;
 dmfacturador.qplanes.SQL.Append('select o.cod_planos, o.nom_planos from osmaplanesos o where o.cod_grupo=:grupo');
 dmfacturador.qplanes.ParamByName('grupo').AsString:=codigogrupo;
 dmfacturador.qplanes.Open;
 dmfacturador.qplanes.First;
 if not  dmfacturador.qplanes.IsEmpty then
                 Begin
                     While not dmfacturador.qplanes.Eof do
                         begin
                           if dmfacturador.cdsgrupos.Active=false then
                            begin
                              dmfacturador.cdsgrupos.CreateDataSet;
                              dmfacturador.cdsgrupos.Active:=true;
                            end;

                         dmfacturador.cdsgrupos.Append;
                         dmfacturador.cdsgruposcodigo.asstring:=dmfacturador.qplanes.Fields[0].Text;
                         dmfacturador.cdsgruposplan.asstring:=dmfacturador.qplanes.Fields[1].Text;



                         dmfacturador.qplanes.Next;
                         end;
end;

combopresentacion.Items.Clear;
 if dmfacturador.tpanel1.InTransaction then
 begin
   dmfacturador.tpanel1.Rollback;
 end;

 dmfacturador.qpresentacion.Close;
 dmfacturador.qpresentacion.SQL.Clear;
 dmfacturador.qpresentacion.SQL.Append('select ide_presentacion,des_presentacion,nro_presentacion from osmapresentacion where cod_grupo=:grupo order by 1 desc');
 dmfacturador.qpresentacion.ParamByName('grupo').AsString:=codigogrupo;
 dmfacturador.qpresentacion.Open;

 dmfacturador.qpresentacion.First;
 while not dmfacturador.qpresentacion.Eof do
  begin
    combopresentacion.Items.Add(dmfacturador.qpresentacion.Fields[1].Text+'-'+dmfacturador.qpresentacion.Fields[0].Text);
    dmfacturador.qpresentacion.Next;
  end;


bpresentacion.Enabled:=true;
end;

procedure Tfliquidacion.DBGrid1CellClick(Column: TColumn);
begin
lcount.Caption:=inttostr(dbgrid1.SelectedRows.Count)
end;

procedure Tfliquidacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmfacturador.cdsgrupos.Active=true then
  begin
  dmfacturador.cdsgrupos.EmptyDataSet;

  end;
  combopresentacion.Items.Clear;
end;

procedure Tfliquidacion.FormShow(Sender: TObject);
begin
dmFacturador.AbrirConexion();
 if dmfacturador.tpanel1.InTransaction then
 begin
   dmfacturador.tpanel1.Rollback;
 end;

 dmfacturador.qgrupoos.Close;
 dmfacturador.qgrupoos.SQL.Clear;
 dmfacturador.qgrupoos.SQL.Append('select cod_grupo, des_grupo from osmagrupos');
 dmfacturador.qgrupoos.Open;
 dmfacturador.qgrupoos.First;
   while not dmfacturador.qgrupoos.Eof do
  begin
    combotipo.Items.Add(dmfacturador.qgrupoos.Fields[1].Text+'-'+dmfacturador.qgrupoos.Fields[0].Text);
    dmfacturador.qgrupoos.Next;
  end;

datefechalimite.DateTime:=now;
end;

procedure Tfliquidacion.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;

end.

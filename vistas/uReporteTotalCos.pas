unit uReporteTotalCos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, udTicket,
  Vcl.ExtCtrls, Vcl.Buttons, Data.DB, Datasnap.DBClient, Vcl.ComCtrls,uMessageDLG,uPlanesOSService,
  scExcelExport;

type
  TfrmReporteTotalCos = class(TForm)
    Panel3: TPanel;
    CDSCoseguros: TClientDataSet;
    CDSSucursales: TClientDataSet;
    DSSucursales: TDataSource;
    DSCoseguros: TDataSource;
    BitBtn1: TBitBtn;
    btnCancelar: TBitBtn;
    CDSSucursalesnro_sucursal: TStringField;
    CDSSucursalesnom_sucursal: TStringField;
    CDSCoseguroscod_planos: TStringField;
    CDSCosegurosnom_planos: TStringField;
    CDSReporte: TClientDataSet;
    CDSReportecod_planos: TStringField;
    CDSReportenro_sucursal: TStringField;
    CDSReportenom_sucursal: TStringField;
    CDSReporteimp_descuento: TFloatField;
    CDSReporteimp_ticket: TFloatField;
    PageControl1: TPageControl;
    PCoseguros: TTabSheet;
    Shape1: TShape;
    Label2: TLabel;
    Label1: TLabel;
    Ecos: TEdit;
    lcos: TEdit;
    DBGrid1: TDBGrid;
    btnAgregarCOS: TBitBtn;
    btnEliminarCOS: TBitBtn;
    PSucursales: TTabSheet;
    Shape4: TShape;
    Label3: TLabel;
    Label4: TLabel;
    esucursal: TEdit;
    lsucursal: TEdit;
    DBGrid2: TDBGrid;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    scExcelExport1: TscExcelExport;
    procedure btnAgregarCOSClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EcosKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEliminarCOSClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EcosEnter(Sender: TObject);
    procedure EcosExit(Sender: TObject);
    procedure EcosChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    ticket:TTicket;
    planesOSService:TPlanesOSService;
  public
    { Public declarations }
    procedure setTicket(unTicket:TTicket);
    function obtenerCadenaCoseguros():string;
    function obtenerCadenaSucursales():string;

  end;

var
  frmReporteTotalCos: TfrmReporteTotalCos;

implementation

{$R *.dfm}

function TfrmReporteTotalCos.obtenerCadenaCoseguros():string;
var
  coseguros:string;
begin
  CDSCoseguros.First;
  while not CDSCoseguros.Eof do
  begin
    if ((CDSCoseguros.RecNo <> 0) and (CDSCoseguros.RecordCount -1 >(CDSCoseguros.RecNo))) then
    begin
       coseguros:=coseguros + ',';
    end;
    coseguros:=coseguros + CDSCoseguros.FieldByName('cod_planos').AsString;
    CDSCoseguros.Next;
  end;
  Result:= coseguros;

end;

function TfrmReporteTotalCos.obtenerCadenaSucursales():string;
var
  sucursales:string;
begin
  CDSSucursales.First;
  while not CDSSucursales.Eof do
  begin
    if ((CDSSucursales.RecNo <> 0) and (CDSSucursales.RecordCount -1 >(CDSSucursales.RecNo))) then
    begin
       sucursales:=sucursales + ',';
    end;
    sucursales:=sucursales + CDSSucursales.FieldByName('nro_sucursal').AsString;
    CDSSucursales.Next;
  end;
  Result:= sucursales;

end;


procedure TfrmReporteTotalCos.BitBtn1Click(Sender: TObject);
var
  coseguros,sucursales:string;
begin

  if cdscoseguros.IsEmpty then
  begin
      MensajeDLG('Debe seleccionar al menos un coseguro','Totales de coseguro',mtError,[mbOk]);
      PageControl1.ActivePage:= PCoseguros;
      ecos.SetFocus;
      exit;
  end;

  if cdscoseguros.IsEmpty then
  begin
      MensajeDLG('Debe seleccionar al menos una sucursal','Totales de coseguro',mtError,[mbOk]);
      PageControl1.ActivePage:= PSucursales;
      esucursal.SetFocus;
      exit;
  end;
  CDSReporte.EmptyDataSet;

  coseguros:= obtenerCadenaCoseguros();
  sucursales:= obtenerCadenaSucursales();
  planesosservice.obtenerDescuentosCosPorWebApp(ticket.url,cdsReporte,coseguros,sucursales,DTPDesde.date,DTPHasta.date);

  if cdsreporte.isEmpty then
  begin
    MensajeDLG('No se encontro registros','Totales de coseguro',mtInformation,[mbOk]);

    exit;
  end;


   try

      scExcelExport1.ExcelVisible := True;
      scExcelExport1.LoadDefaultProperties;
      scExcelExport1.DataSet := cdsReporte;
      scExcelExport1.HeaderText.Text := 'Reporte descuentos de coseguro';

      scExcelExport1.WorkSheetName := 'Descuentos de Coseguro';
      scExcelExport1.BeginRowHeader := 1;

      scExcelExport1.BorderTitles.BorderColor := clBlack;
      scExcelExport1.BorderTitles.LineStyle := blLine;
      scExcelExport1.BeginRowTitles := 3;

      scExcelExport1.ExportDataSet;
      scExcelExport1.ExcelWorkSheet.Range['A1','C1'].RowHeight:=25;

      scExcelExport1.ExcelWorkSheet.Range['C1','C1'].ColumnWidth:=30;
      scExcelExport1.ExcelWorkSheet.Range['A1','B1'].ColumnWidth:=13;
      scExcelExport1.ExcelWorkSheet.Range['D1','E1'].ColumnWidth:=13;

      scExcelExport1.ExcelWorkSheet.Range['A2','C'+intToStr(CDSReporte.RecordCount+3)].RowHeight:=20;
      scExcelExport1.ExcelWorkSheet.Range['A2','E2'].MergeCells:= True;
      scExcelExport1.ExcelWorkSheet.Range['A2','A2'].Cells.Value2:='Periodo:'+FormatDateTime('dd-mm-yyyy',DTPDesde.Date)+' a '+FormatDateTime('dd-mm-yyyy',DTPHasta.Date);



  finally
      scExcelExport1.Disconnect;
  end;





end;

procedure TfrmReporteTotalCos.BitBtn5Click(Sender: TObject);
begin
 if Length(esucursal.Text) >2 then
  begin
      CDSSucursales.Append;
      CDSSucursales.FieldByName('nro_sucursal').AsString:= esucursal.Text;
      CDSSucursales.FieldByName('nom_sucursal').AsString:= lsucursal.Text;
      CDSSucursales.Post;
      esucursal.Text:='';
      lsucursal.Text:='';
      esucursal.SetFocus;
      exit;
  end;
  ShowMessage('El numero de sucursal no es valido');
  esucursal.SetFocus;
end;

procedure TfrmReporteTotalCos.BitBtn6Click(Sender: TObject);
var
 buttonSelected:integer;
begin
buttonSelected:= MensajeDLG('¿Desea eliminar la sucursal seleccionada?','Totales de coseguro',mtCustom,[mbYes,mbNo]);

 if buttonSelected = mrYes then
 begin
    CDSSucursales.Delete;
 end;
 esucursal.SetFocus;

end;

procedure TfrmReporteTotalCos.btnAgregarCOSClick(Sender: TObject);
begin
  if Length(lcos.Text) >2 then
  begin
      CDSCoseguros.Append;
      CDSCoseguros.FieldByName('cod_planos').AsString:= ecos.Text;
      CDSCoseguros.FieldByName('nom_planos').AsString:= lcos.Text;
      CDSCoseguros.Post;
      ecos.Text:='';
      lcos.Text:='';
      ecos.SetFocus;
      exit;
  end;
  ShowMessage('El codigo de coseguro no es valido');
  ecos.SetFocus;
end;

procedure TfrmReporteTotalCos.btnCancelarClick(Sender: TObject);
begin
  if ticket.ventanas = 'S' then
    close;
  if ticket.ventanas = 'N' then
     ModalResult:=mrCancel;

end;

procedure TfrmReporteTotalCos.btnEliminarCOSClick(Sender: TObject);
var
  buttonSelected:integer;
begin
 buttonSelected:= MensajeDLG('¿Desea eliminar el coseguro seleccionado?','Totales de coseguro',mtCustom,[mbYes,mbNo]);

 if buttonSelected = mrYes then
 begin
    CDSCoseguros.Delete;
 end;
 ecos.SetFocus;

end;

procedure TfrmReporteTotalCos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Grid: TDBGrid;
begin
  Grid := Sender as TDBGrid;

  // Verificamos si la fila actual está seleccionada
  if ((gdSelected in State) and (not CDSCoseguros.IsEmpty)) then
  begin
    // Establecemos el color de fondo para la fila seleccionada
    Grid.Canvas.Brush.Color := clSkyBlue; // Color de fondo deseado para la fila seleccionada

    // Dibujamos la fila completa con el color de fondo
    Grid.Canvas.FillRect(Rect);

    // Ahora dibujamos el contenido de cada celda de la fila seleccionada
    // Iteramos sobre todas las columnas para dibujarlas
    Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
  begin
    // Si no está seleccionada, dibujamos normalmente
    Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmReporteTotalCos.EcosChange(Sender: TObject);
begin
  if Length(ecos.Text) = 3 then
  begin
     lcos.text:= planesosservice.obtenerNombrePlan(ecos.text);
  end;

end;

procedure TfrmReporteTotalCos.EcosEnter(Sender: TObject);
begin
  ecos.Color:= clMoneyGreen;
end;

procedure TfrmReporteTotalCos.EcosExit(Sender: TObject);
begin
  ecos.Color:= clWhite;
end;

procedure TfrmReporteTotalCos.EcosKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnAgregarCOS.Click;
  end;
end;

procedure TfrmReporteTotalCos.FormShow(Sender: TObject);
begin
  planesOSService:=TPlanesOsService.Create;
  CDSSucursales.CreateDataSet;
  CDSCoseguros.CreateDataSet;
  CDSReporte.CreateDataSet;
  PageControl1.ActivePage:=PCoseguros;
  ecos.SetFocus;
end;

procedure TfrmReporteTotalCos.setTicket(unTicket:TTicket);
begin
  ticket:= unTicket;
end;




end.

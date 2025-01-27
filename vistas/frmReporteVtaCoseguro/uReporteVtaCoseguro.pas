unit uReporteVtaCoseguro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, scExcelExport, Data.DB,
  Datasnap.DBClient, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, udmFacturador,uSucursalDAO,
  IdHTTP, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls,uMovObraSocialService;

type
  TFrmReporteVtaPorCoseguro = class(TForm)
    btnSalir: TButton;
    Button1: TButton;
    TabControl3: TTabControl;
    btnVerReporte: TButton;
    lblCodCos: TLabel;
    lblNombCos: TLabel;
    Label1: TLabel;
    Shape1: TShape;
    lblDesde: TLabel;
    DTPDesde: TDateTimePicker;
    lblHasta: TLabel;
    DTPHasta: TDateTimePicker;
    Label3: TLabel;
    DSRCoseguro: TDataSource;
    CDSRCos: TClientDataSet;
    CDSRCosfec_comprob: TStringField;
    CDSRCosimp_ticket: TFloatField;
    CDSRCosimp_cargoos: TFloatField;
    CDSRCosimp_afectado: TFloatField;
    CDSRCosimp_gentileza: TFloatField;
    DBGrid1: TDBGrid;
    CDSRCosnro_sucursal: TIntegerField;
    CDSRCosnom_obrasocial: TStringField;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblTotalTicket: TLabel;
    lblTotalGentileza: TLabel;
    lblTotalAfectado: TLabel;
    lblTotalCOS: TLabel;
    EcodCos: TEdit;
    CDSSucursal: TClientDataSet;
    CDSSucursalnro_sucursal: TIntegerField;
    CDSSucursalNOM_SUCURSAL: TStringField;
    DSSucursal: TDataSource;
    CMBSucursal: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnVerReporteClick(Sender: TObject);
    procedure ECodCosEnter(Sender: TObject);
    procedure ECodCosExit(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    movOSService:TMovOSService;
    sucursalDAO:TSucursalDAO;
    procedure cargarSucursales;
  public
    { Public declarations }
  end;

var
  FrmReporteVtaPorCoseguro: TFrmReporteVtaPorCoseguro;

implementation

{$R *.dfm}

procedure TFrmReporteVtaPorCoseguro.btnVerReporteClick(Sender: TObject);
var
dsMov:TDataSet;
totalTicket:Double;
totalCargoOS:Double;
totalGentileza:Double;
totalImpAfectado:Double;

begin
  totalTicket:=0;
  totalCargoOS:=0;
totalGentileza:=0;
totalImpAfectado:=0;

try

  dsMov:= movOSService.getMovimientos(CDSSucursal.FieldByName('NRO_SUCURSAL').AsString,ECodCos.Text,DTPDesde.DateTime,DTPHasta.DateTime);
 dsMov.First;

  // Agregar los datos en el dataset CDSRCos
      if CDSRCos.Active = false then
      begin
        CDSRCos.CreateDataSet;
        CDSRCos.Active := true;
      end;


while not dsMov.Eof do
begin
  totalTicket:= totalTicket + dsMov.FieldByName('imp_ticket').AsFloat;
  totalCargoOS:=totalCargoOS+ CDSRCos.FieldByName('imp_cargoos').AsFloat;
  totalGentileza:=totalGentileza +dsMov.FieldByName('imp_gentileza').AsFloat;
  totalImpAfectado:=totalImpAfectado+  dsMov.FieldByName('imp_afectado').AsFloat;

  // Agrega un nuevo registro a CDSRCos
  CDSRCos.Append;

  // Asigna los valores de los campos desde dsMov a CDSRCos
  CDSRCos.FieldByName('fec_comprob').AsString := dsMov.FieldByName('fec_comprob').AsString;
  CDSRCos.FieldByName('nro_sucursal').AsInteger := dsMov.FieldByName('nro_sucursal').AsInteger;

  CDSRCos.FieldByName('imp_ticket').AsFloat := dsMov.FieldByName('imp_ticket').AsFloat;
  CDSRCos.FieldByName('imp_cargoos').AsFloat := dsMov.FieldByName('imp_cargoos').AsFloat;
  CDSRCos.FieldByName('imp_gentileza').AsFloat := dsMov.FieldByName('imp_gentileza').AsFloat;
   CDSRCos.FieldByName('imp_afectado').AsFloat := dsMov.FieldByName('imp_afectado').AsFloat;

  CDSRCos.FieldByName('nom_obrasocial').AsString := dsMov.FieldByName('NOM_OBRASOCIAL').AsString;

  // Llama a Post para aplicar los cambios al nuevo registro en CDSRCos
  CDSRCos.Post;

  // Mueve al siguiente registro en dsMov
  dsMov.Next;
end;
 dsmov.Close;

 lblTotalTicket.Caption:= '$ ' + floatToStr(totalTicket);
 lblTotalCOS.Caption:= '$ ' + floatToStr(totalCargoOS);
 lblTotalGentileza.Caption:= '$ ' + floatToStr(totalGentileza);
 lblTotalAfectado.Caption:= '$ ' + floatToStr(totalImpAfectado);
except
  on E:Exception do
  begin
    ShowMessage(e.Message);
    exit;
  end;
end;

end;

procedure TFrmReporteVtaPorCoseguro.ECodCosEnter(Sender: TObject);
begin
 ECodCos.Color:=clMoneyGreen;
   Application.ProcessMessages;
end;

procedure TFrmReporteVtaPorCoseguro.ECodCosExit(Sender: TObject);
begin
   EcodCos.Color:= clWindow;
   Application.ProcessMessages;
end;

procedure TFrmReporteVtaPorCoseguro.cargarSucursales;
var
  sucursalDS: TDataSet;
begin
  sucursalDS := sucursalDAO.getSucursales;

  if not CDSSucursal.Active then
  begin
    CDSSucursal.CreateDataSet;
    CDSSucursal.Active:= True;
  end;


  while not sucursalDS.Eof do
  begin
    CDSSucursal.Append;
    CDSSucursal.FieldByName('NRO_SUCURSAL').AsInteger:=  sucursalDS.FieldByName('NRO_SUCURSAL').AsInteger;
    CDSSucursal.FieldByName('NOM_SUCURSAL').AsString:=  sucursalDS.FieldByName('NOM_SUCURSAL').AsString;
    CDSSucursal.Post;
    sucursalDS.Next;

  end;

  sucursalDS.Close;

end;

procedure TFrmReporteVtaPorCoseguro.FormCreate(Sender: TObject);
begin
  movOSService:= TMovOSService.Create;
  sucursalDAO:= TSucursalDAO.Create;
  cargarSucursales;


end;

procedure TFrmReporteVtaPorCoseguro.FormShow(Sender: TObject);
begin
  CMBSucursal.SetFocus;
end;

end.

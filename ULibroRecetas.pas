unit ULibroRecetas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  facturador, UDTicket, Vcl.ComCtrls, Vcl.ValEdit,Registry,
  Datasnap.DBClient, IBX.IBDatabase, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Xml.xmldom, Xml.XMLIntf,Xml.XMLDoc, MSXML, DateUtils, Excel2000, ComObj,
  scExcelExport,Uprogreso, Uticket;

type
    TFLibroRecetas = class(TForm)
    DBGLibroRecetas: TDBGrid;
    btnCancelar: TButton;
    btnConsultar: TButton;
    lblDesde: TLabel;
    lblHasta: TLabel;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    idhttp: TIdHTTP;
    DSLibroRecetas: TDataSource;
    CDSLibroRecetas: TClientDataSet;
    CDSLibroRecetasmedico: TStringField;
    CDSLibroRecetasprescripcion: TStringField;
    CDSLibroRecetascantidad: TIntegerField;
    CDSLibroRecetasprecio: TFloatField;
    CDSLibroRecetasid: TIntegerField;
    CDSLibroRecetasnro_comprobante: TLargeintField;
    CDSLibroRecetasrenglon: TLargeintField;
    btnExportarExcel: TButton;
    CDSLibroRecetasfecha: TDateField;
    CDSLibroRecetastipo: TStringField;
    scExcelExport1: TscExcelExport;
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure btnExportarExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    Ticket:TTicket;
  public
    { Public declarations }
    procedure SetTicket(unTicket:TTicket);
    procedure ObtenerResultadoWebService(fecha_desde: TDateTime; fecha_hasta: TDateTime);
    function LeerSucursal:String;
    function ObtenerNombreSucursal(sucursal_id: Integer):String;
  end;

var
  FLibroRecetas: TFLibroRecetas;

implementation

{$R *.dfm}

function TFLibroRecetas.ObtenerNombreSucursal(sucursal_id: Integer):String;
var
  respuesta: string;
  url : string;
  Reg : TRegistry;
begin
   try
    // Realizar la solicitud HTTP al servicio web
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey(regKey,true);
    url := Reg.ReadString('URL');
    url := url+'/get_sucursal2.php?'+ 'sucursal=' + IntToStr(sucursal_id);
    //url := 'http://192.168.201.8/webapps/get_sucursal2.php?'+ 'sucursal=' + IntToStr(sucursal_id);
    respuesta := idhttp.Get(url);
    Result := respuesta;
   except
    on E: Exception do
    begin
      {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
    end;
    end;
end;


function TFLibroRecetas.LeerSucursal:String;
Const
RegKey ='Software\Autofarma\APlus\';

var
  reg : Tregistry;
  nro_sucursal : String;

begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);
  nro_sucursal := Reg.ReadString('Sucursal');
  Reg.CloseKey;
  Reg.Free;
  result := nro_sucursal;
end;


procedure TFLibroRecetas.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;

end;

procedure TFLibroRecetas.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFLibroRecetas.btnConsultarClick(Sender: TObject);
var
  form : TfProgreso;

begin
  form:=tfprogreso.Create(self);
  form.Show;
  application.ProcessMessages;
 ObtenerResultadoWebService(DTPDesde.date, DTPHasta.date);
 form.Close;
end;


procedure TFLibroRecetas.btnExportarExcelClick(Sender: TObject);

var
  columna: Tfield;
  nombre_sucursal: string;

begin

  try
   try
    if MessageDlg('Esta seguro de guardar en excel?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      scExcelExport1.ExcelVisible := True;
      scExcelExport1.LoadDefaultProperties;
      scExcelExport1.DataSet := CDSLibroRecetas;
      nombre_sucursal := ObtenerNombreSucursal(StrToInt(leerSucursal()));
      {Inserción de header en el excel de acuerdo a la fecha seleccionada y a la sucursal}
      begin
       scExcelExport1.HeaderText.Text := 'Farmacia ' + nombre_sucursal + ' ' + datetoStr(DTPDesde.date) + ' al ' + datetoStr(DTPHasta.date);
      end;
      scExcelExport1.WorkSheetName := 'Libro_Recetas';
      scExcelExport1.ExportDataSet;
    end;
  except
    On E: exception do
    begin
      showmessage('Tabla Vacia, por favor verifique la consulta al libro o no la pc no tiene excel instalado');
    end;
  end;
  finally
      scExcelExport1.Disconnect;
  end;



end;

procedure TFLibroRecetas.DTPDesdeChange(Sender: TObject);
begin

    //Chequear que la fecha no sea mayor a la actual
    if((CompareDate(DTPDesde.Date, Now) = 1) or (CompareDate(DTPDesde.Date, DTPHasta.Date) = 1)) then
    begin
      //ShowMessage('La fecha no es válida');
      btnConsultar.Enabled := false;
    end
    Else
    begin
      btnConsultar.Enabled := true;
    end;

end;


procedure TFLibroRecetas.DTPHastaChange(Sender: TObject);
begin

    //Chequear que la fecha no sea mayor a la actual ni menor a la Desde
    if(CompareDate(DTPDesde.Date, DTPHasta.Date) <=  0) and (CompareDate(DTPHasta.Date,now) <= 0) then
    begin
      btnConsultar.Enabled := true;
    end
    else
    begin
      //ShowMessage('La fecha no es válida');
      btnConsultar.Enabled := false;
    end;

end;

procedure TFLibroRecetas.FormShow(Sender: TObject);
begin
  DTPDesde.Date := Date;
  DTPHasta.Date := Date;
end;

procedure TFLibroRecetas.ObtenerResultadoWebService(fecha_desde: TDateTime; fecha_hasta: TDateTime);
 {FDStanStorageXMLLink.StorageName := 'C:\data\datos.xml';
  FDStanStorageXMLLink.Load(FDMemTable1);}
var
  XMLDoc: IXMLDocument;
  Respuesta: WideString;
  url : string;
  Reg : TRegistry;
  cont,i : integer;
  NodeRenglon: IXMLNode;
  formatoFecha: TFormatSettings;
  fecha_string: string;
  fecha: TDate;
begin
  try
    // Realizar la solicitud HTTP al servicio web
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey(regKey,true);
    url := Reg.ReadString('URL');
    url := url+'get_libro_recetas2.php?'+ 'sucursal=' + LeerSucursal() + '&desde=' +
      FormatDateTime('YYYY-MM-DD', fecha_desde) +
      '&hasta=' +
      FormatDateTime('YYYY-MM-DD', fecha_hasta);
       ShowMessage(url);

      // esto anda
      //url := 'http://192.168.201.8/webapps/'+'/get_libro_recetas.php?'+ 'sucursal=' + LeerSucursal() + '&desde=' +
      //FormatDateTime('YYYY-MM-DD', fecha_desde) +
      //'&hasta=' +
      //FormatDateTime('YYYY-MM-DD', fecha_hasta);

    XMLDoc := TXMLDocument.Create(nil);
    // Obtener la respuesta del servicio web como una cadena Unicode
    Respuesta := idhttp.Get(url);

    // Crear un archivo para guardar la respuesta
    XMLDoc := LoadXMLData(respuesta);

    CDSLibroRecetas.Active := false;
    CDSLibroRecetas.Close;
    formatoFecha := TFormatSettings.Create();
    formatoFecha.DateSeparator := '-';
    formatoFecha.ShortDateFormat := 'YYYY-MM-DD';

    // Obtener la lista de nodos <renglon>
    for i := 0 to XMLDoc.DocumentElement.ChildNodes.Count - 1 do
    begin
      NodeRenglon := XMLDoc.DocumentElement.ChildNodes[i];

      // Agregar los datos en el dataset CDSLibroRecetas
      if CDSLibroRecetas.Active = false then
      begin
        CDSLibroRecetas.CreateDataSet;
        CDSLibroRecetas.Active := true;
      end;

      CDSLibroRecetas.Append;
    //  CDSLibroRecetas.FieldByName('sucursal_id').AsInteger := StrToInt(NodeRenglon.ChildNodes['sucursal_id'].Text);
      CDSLibroRecetas.FieldByName('renglon').AsLargeInt := StrToInt64(NodeRenglon.ChildNodes['renglon'].Text);
      CDSLibroRecetas.FieldByName('medico').AsString := NodeRenglon.ChildNodes['medico'].Text;
      CDSLibroRecetas.FieldByName('prescripcion').AsString := NodeRenglon.ChildNodes['prescripcion'].Text;
      fecha_string := NodeRenglon.ChildNodes['fecha'].Text;
      fecha := StrToDate(fecha_string, formatoFecha);
      CDSLibroRecetas.FieldByName('fecha').AsDateTime := fecha;
      CDSLibroRecetas.FieldByName('cantidad').AsInteger := StrToInt(NodeRenglon.ChildNodes['cantidad'].Text);
      CDSLibroRecetas.FieldByName('precio').AsFloat := StrToFloat(NodeRenglon.ChildNodes['precio'].Text);
      CDSLibroRecetas.FieldByName('nro_comprobante').AsLargeInt := StrToInt64(NodeRenglon.ChildNodes['nro_comprobante'].Text);
      CDSLibroRecetas.FieldByName('id').AsLargeInt := StrToInt64(NodeRenglon.ChildNodes['id'].Text);
      CDSLibroRecetas.FieldByName('tipo').AsString := NodeRenglon.ChildNodes['tipo'].Text;
      CDSLibroRecetas.Post;
    end;


  except
    on E: Exception do
    begin
      {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
    end;
  end;
end;


end.

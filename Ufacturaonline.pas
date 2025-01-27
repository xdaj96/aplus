unit Ufacturaonline;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udticket, Vcl.Grids, Vcl.DBGrids,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML,
  registry, Vcl.StdCtrls, Vcl.ExtCtrls, udmfacturador, Vcl.Buttons, frxClass,
  frxDBSet;

type
  Tffacturaonline = class(TForm)
    idhttp: TIdHTTP;
    gfacturaonline: TDBGrid;
    Panel1: TPanel;
    lproveedor: TLabel;
    LDOCUMENTO: TLabel;
    LIMPORTETOTAL: TLabel;
    Bevel1: TBevel;
    Lrazonsocial: TLabel;
    Label1: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    Bevel3: TBevel;
    Label3: TLabel;
    Bevel4: TBevel;
    Label4: TLabel;
    Bevel5: TBevel;
    LFECHA: TLabel;
    Label5: TLabel;
    Bcancelar: TBitBtn;
    ebuscar: TEdit;
    rformacarga: TRadioGroup;
    ecantidad: TEdit;
    Bagregar: TButton;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BcancelarClick(Sender: TObject);
    procedure BagregarClick(Sender: TObject);
    procedure ebuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gfacturaonlineDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ecantidadKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gfacturaonlineKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
   Ticket:TTicket;
   procedure SetTicket(unTicket:TTicket);

  end;

var
  ffacturaonline: Tffacturaonline;

implementation

{$R *.dfm}
uses login, ubusquedaproductos;
type
  DBGridExt = class(TDBGrid);



procedure Tffacturaonline.BagregarClick(Sender: TObject);
var
encontrado: string;
begin


if rformacarga.ItemIndex=0 then
        begin
        ENCONTRADO:='NO';
        gfacturaonline.DataSource.DataSet.First;
        while not gfacturaonline.DataSource.DataSet.Eof do
            begin

                if ebuscar.Text=dmfacturador.cdsfacturacod_barraspri.asstring then
                begin
                  dmfacturador.cdsfactura.Edit;
                  dmfacturador.cdsfacturacantidadcontrol.Asinteger:=strtoint(Gfacturaonline.Fields[4].AsString)+1;
                  dmfacturador.cdsfactura.Post;
                  encontrado:='SI';
                end;
            gfacturaonline.DataSource.DataSet.Next;
            end;
         if  (ENCONTRADO<>'SI')  then
                BEGIN
                  showmessage('Producto no encontrado en factura');
                end;
       ebuscar.Clear;
       ebuscar.SetFocus;
        end;
if rformacarga.ItemIndex=1 then
  begin
  ENCONTRADO:='NO';
  gfacturaonline.DataSource.DataSet.First;
  while not gfacturaonline.DataSource.DataSet.Eof do
        begin
        if ebuscar.Text=dmfacturador.cdsfacturacod_barraspri.asstring then
            begin
              dmfacturador.cdsfactura.Edit;
              if ecantidad.Text<>'' then
              begin
              dmfacturador.cdsfacturacantidadcontrol.Asinteger:=strtoint(Gfacturaonline.Fields[4].AsString)+strtoint(ecantidad.Text);
              dmfacturador.cdsfactura.Post;
              encontrado:='SI';
              end;
              if ecantidad.Text='' then
              begin
              dmfacturador.cdsfacturacantidadcontrol.Asinteger:=strtoint(Gfacturaonline.Fields[4].AsString)+1;
              dmfacturador.cdsfactura.Post;
              encontrado:='SI';
              end;
            end;


        gfacturaonline.DataSource.DataSet.Next;

        end;
        if  (ENCONTRADO<>'SI')  then
                BEGIN
                  showmessage('Producto no encontrado en factura');
                end;
       ebuscar.Clear;
       ecantidad.Clear;
       ebuscar.SetFocus;
  end;
end;


procedure Tffacturaonline.BcancelarClick(Sender: TObject);
begin
dmfacturador.cdsfactura.Close;
modalresult:=mrcancel;

end;

procedure Tffacturaonline.BitBtn1Click(Sender: TObject);
var
unItem:TItemsonline;
reg: tregistry;
begin
ticket.itemsonline.Clear;
gfacturaonline.DataSource.DataSet.First;
Reg := TRegistry.Create;
Reg.RootKey := HKEY_CURRENT_USER;
Reg.OpenKey(regKey,true);


 while not gfacturaonline.DataSource.DataSet.Eof do
    begin
    if gfacturaonline.fields[4].AsInteger>0 then
      begin
      unItem:=Titemsonline.Create;
      unItem.cod_alfabeta:=gfacturaonline.Fields[0].AsString;
      unItem.cantidadonline:=gfacturaonline.Fields[4].AsInteger;
      unitem.nombreonline:=gfacturaonline.Fields[2].AsString;
      ticket.itemsonline.Add(unItem);

      end;
    if gfacturaonline.fields[4].AsInteger<>gfacturaonline.fields[3].AsInteger then
      begin
        if dmfacturador.cdsfacturareporte.Active=false then
          begin
            dmfacturador.cdsfacturareporte.CreateDataSet;
            dmfacturador.cdsfacturareporte.Active:=true;
          end;
          dmfacturador.cdsfacturareporte.Append;
          dmfacturador.cdsfacturareportecod_alfabeta.AsString:=gfacturaonline.fields[0].AsString;
          dmfacturador.cdsfacturareportecod_barraspri.Asstring:=gfacturaonline.fields[1].Asstring;
          dmfacturador.cdsfacturareportenom_largo.Asstring:=gfacturaonline.fields[2].Asstring;
          dmfacturador.cdsfacturareportecantidad.AsString:=gfacturaonline.fields[3].Asstring;
          dmfacturador.cdsfacturareportecantidadcontrol.asstring:=gfacturaonline.fields[4].Asstring;
          dmfacturador.cdsfacturareportenro_factura.AsString:=LDOCUMENTO.Caption;


      end;
      gfacturaonline.DataSource.DataSet.Next;


     end;
     if not dmfacturador.cdsfacturareporte.IsEmpty then
     begin
     dmfacturador.reportefactonline.LoadFromFile(Reg.ReadString('Reportes')+'FACTURAONLINE.FR3');
     dmfacturador.reportefactonline.ShowReport(false);
     dmfacturador.cdsfactura.Close;
     dmfacturador.cdsfacturareporte.Close;
     end;

   dmfacturador.cdsfactura.Close;
   modalresult:=mrcancel;
end;

procedure Tffacturaonline.Button1Click(Sender: TObject);
begin
dmfacturador.reportefactonline.LoadFromFile('C:\REPORTES\FACTURAONLINE.FR3');

dmfacturador.reportefactonline.ShowReport(false);
end;

procedure Tffacturaonline.ebuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if rformacarga.ItemIndex=0 then
        begin
              if key=vk_return then
                  begin
                  bagregar.Click;
                  end;

        end;
    if rformacarga.ItemIndex=1 then
        begin
              if key=vk_return then
                  begin
                  ecantidad.SetFocus;
                  end;
        end;




end;




procedure Tffacturaonline.ecantidadKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if rformacarga.ItemIndex=1 then
        begin
              if key=vk_return then
                  begin
                  bagregar.Click;
                  end;

        end;
end;

procedure Tffacturaonline.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f6 then
begin
  BitBtn1.Click;
end;
end;

procedure Tffacturaonline.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #27 then
   key := #0;
end;

procedure Tffacturaonline.FormShow(Sender: TObject);

VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  SUCURSAL, STOCK: STRING;
  reg: tregistry;
  detalleval:ixmlnode;

begin
s:='';
try


  url:=ticket.url+'get_factura.php?'+'numerocomprobante='+ticket.facturaproveedor+'&cuit='+ticket.cuitproveedor;

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);
  j:=0;
  Doc:=LoadXMLData(s);
  doc.DocumentElement.ChildNodes.Count;
  detalleval:=doc.DocumentElement.ChildNodes['Detalle'];

  lrazonsocial.Caption:=DOC.DocumentElement.ChildNodes['Encabezado'].CHildNodes['razon_social'].Text;
  lproveedor.Caption:=DOC.DocumentElement.ChildNodes['Encabezado'].ChildNodes['proveedor'].Text;
  lDOCUMENTO.Caption:=DOC.DocumentElement.ChildNodes['Encabezado'].ChildNodes['documentno'].Text;
  lIMPORTETOTAL.Caption:=DOC.DocumentElement.ChildNodes['Encabezado'].ChildNodes['imp_total'].Text;
  lFECHA.Caption:=DOC.DocumentElement.ChildNodes['Encabezado'].ChildNodes['fecha'].Text;
for I := 0 to detalleval.ChildNodes.Count -1 do
  begin
  j:=j+1;


         if dmfacturador.cdsfactura.Active=false then
          begin
            dmfacturador.cdsfactura.CreateDataSet;
            dmfacturador.cdsfactura.Active:=true;
          end;
          if strtoint(detalleval.ChildNodes[i].ChildNodes['cantidad'].text)<>0 then
          BEGIN
          dmfacturador.cdsfactura.Append;
          dmfacturador.cdsfacturacod_alfabeta.AsString:=detalleval.ChildNodes[i].ChildNodes['codalfabeta'].Text;
          dmfacturador.cdsfacturacod_barraspri.Asstring:=detalleval.ChildNodes[i].ChildNodes['cod_barraspri'].Text;
          dmfacturador.cdsfacturanom_largo.Asstring:=detalleval.ChildNodes[i].ChildNodes['nom_largo'].Text;
          dmfacturador.cdsfacturacantidad.AsString:=detalleval.ChildNodes[i].ChildNodes['cantidad'].Text;
          dmfacturador.cdsfacturacantidadcontrol.asstring:='0';
          END;

        end;



 












  except
      on E: Exception do
      begin
        {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
      end;






end;

ebuscar.SetFocus;
end;

procedure Tffacturaonline.gfacturaonlineDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  const
   clPaleGreen = TColor($CCFFCC);
   clPaleRed =TColor($CCCCFF);
   clpaleskyblue=Tcolor(15750518);
   clpaleyellow=Tcolor($CCFFFF);
begin

if gfacturaonline.Fields[4].asfloat=gfacturaonline.Fields[3].asfloat then
  begin
     gfacturaonline.canvas.brush.color := clpalegreen;
     gfacturaonline.DefaultDrawColumnCell(rect,DataCol,Column,State);
  end
  else
  begin
     gfacturaonline.canvas.brush.color := clpalered;
     gfacturaonline.DefaultDrawColumnCell(rect,DataCol,Column,State);
  end;
end;

procedure Tffacturaonline.gfacturaonlineKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with DBGridExt(TDBGrid(Sender)) do
  begin

    if ((Key = VK_DOWN)and(Row = RowCount-1)) then
    begin
      Abort
    end;
    if ((Key = vk_insert)and(Row = RowCount-1)) then
    begin
      Abort
    end;
  end;
end;

procedure TFfacturaonline.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;

end.

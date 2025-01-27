unit Uproductosd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, udmfacturador,
  Vcl.Mask,uUtils,uProductoService;

type
  Tfproductosd = class(TForm)
    rprecio: TRadioGroup;
    edescripcion: TEdit;
    eprecio: TEdit;
    ecantidad: TEdit;
    Descripcion: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    bagregar: TBitBtn;
    Bcancelar: TBitBtn;
    BitBtn1: TBitBtn;

    procedure bagregarClick(Sender: TObject);
    procedure edescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure eprecioKeyPress(Sender: TObject; var Key: Char);
    procedure ecantidadKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    productoService:TProductoService;
    procedure validarRecargo;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  fproductosd: Tfproductosd;

implementation

{$R *.dfm}

uses facturador;

procedure Tfproductosd.bagregarClick(Sender: TObject);
var
descuento: double;
begin
     if ecantidad.Text = '' then
        ecantidad.Text:= '1';



      if dmfacturador.dprincipal.Active=false then
        begin

        dmfacturador.dprincipal.CreateDataSet;
        dmfacturador.dprincipal.Active:=true;
        end;
        dmfacturador.dprincipal.Append;
        dmfacturador.dprincipalNOM_LARGO.AsString:=edescripcion.Text;
        dmfacturador.dprincipalCANTIDAD.AsInteger:=strtoint(ecantidad.text);
        dmfacturador.dprincipalPRECIO.AsCurrency:=strtofloat(eprecio.Text);
        if rprecio.ItemIndex=0 then
        begin
        dmfacturador.dprincipalcod_alfabeta.AsString:='500064';
        end;
        if rprecio.ItemIndex=1 then
        begin
        dmfacturador.dprincipalcod_alfabeta.AsString:='500063';
        end;
        if rprecio.ItemIndex=2 then
        begin
        dmfacturador.dprincipalcod_alfabeta.AsString:='500447';
        end;

        if rprecio.ItemIndex = 3 then
        begin
          dmfacturador.dprincipalcod_alfabeta.AsString:='587909';
        end;



        dmfacturador.dprincipalcod_barraspri.AsString:='';
        if rprecio.ItemIndex=0 then
        begin
        dmfacturador.dprincipalNRO_troquel.AsString:='2';
        end;
        if rprecio.ItemIndex=1 then
        begin
        dmfacturador.dprincipalNRO_troquel.AsString:='1';
        end;
        if rprecio.ItemIndex=2 then
        begin
        dmfacturador.dprincipalNRO_troquel.AsString:='8';
        end;

         if rprecio.ItemIndex=3 then
        begin
        dmfacturador.dprincipalNRO_troquel.AsString:='1';
        end;

        if rprecio.ItemIndex=0 then
        begin
        dmfacturador.dprincipalcod_iva.AsString:='B';
        end;
        if rprecio.ItemIndex=1 then
        begin
        dmfacturador.dprincipalcod_iva.AsString:='A';
        end;
        if rprecio.ItemIndex=2 then
        begin
        dmfacturador.dprincipalcod_iva.AsString:='A';
        end;

        if rprecio.ItemIndex=3 then
        begin
        dmfacturador.dprincipalcod_iva.AsString:='A';
        end;


        dmfacturador.dprincipalPrecio_Total.AsFloat:=dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat;
        dmfacturador.dprincipalDESCUENTOS.AsFloat:=0;

        descuento:=0;
         if descuento>100 then
         begin
         descuento:=100;
         end;
        dmfacturador.dprincipalporcentaje.AsFloat:=descuento;


        dmfacturador.dprincipalprecio_totaldesc.AsFloat:=dmfacturador.DPRINCIPALprecio_total.AsFloat-dmfacturador.dprincipaldescuentos.AsFloat;
        dmfacturador.DPRINCIPALPORCENTAJEOS.AsFloat:=0;
        dmfacturador.DPRINCIPALPORCENTAJEco1.AsFloat:=0;
        dmfacturador.DPRINCIPALPORCENTAJEco2.AsFloat:=0;
        dmfacturador.dprincipalDESCUENTOSOS.AsCurrency:=0;
        dmfacturador.dprincipalDESCUENTOco1.AsCurrency:=0;
        dmfacturador.dprincipalDESCUENTOco2.AsCurrency:=0;
        dmfacturador.DPRINCIPALCOD_LABORATORIO.AsString:='LLAN' ;
        dmfacturador.DPRINCIPALcan_stk.Asinteger:=0;
        dmfacturador.DPRINCIPALtamano.Asinteger:=10;
        dmfacturador.DPRINCIPALcan_vale.AsString:='0';
        dmfacturador.DPRINCIPALIMPORTEGENT.AsFloat:=0;
        dmfacturador.DPRINCIPALPORCENTAJEAPLUS.AsFloat:=0;
        dmfacturador.dprincipal.Post;
        dmfacturador.dsecundario.Close;
        bcancelar.Click;
        end;

procedure Tfproductosd.BitBtn1Click(Sender: TObject);
var
value: Integer;
espacios:string;
begin
    if Length(edescripcion.Text) > 0 then
    begin
      productoService.construirBusquedaProducto(eDescripcion.Text);
    end;

end;

procedure Tfproductosd.ecantidadKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  if ecantidad.Text='' then
  begin
    ecantidad.Text:='1';
  end;
  bagregar.Click;
end;
end;

procedure Tfproductosd.edescripcionKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  eprecio.SetFocus;
end;
end;

procedure Tfproductosd.eprecioKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  ecantidad.SetFocus;
end;
  if not (Key in [#8, '0'..'9', '.', #13]) then begin
    key := #0;
  end

  else if Key = #13 then
    validarRecargo


  else if (Key = '.') and (Pos(Key, eprecio.Text) > 0) then begin
    Key := #0;
  end;
end;

procedure Tfproductosd.FormCreate(Sender: TObject);
begin
  productoService:=TProductoService.Create;
end;

procedure Tfproductosd.FormDestroy(Sender: TObject);
begin
  productoService.Free;
end;

procedure Tfproductosd.FormShow(Sender: TObject);
begin
edescripcion.SetFocus;
end;

procedure Tfproductosd.validarRecargo;
begin
   if Length(edescripcion.Text) = 13 then
   begin
     showmessage('validar recargo');
   end;

end;

end.

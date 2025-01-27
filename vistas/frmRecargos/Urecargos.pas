unit Urecargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, udmfacturador,
  Vcl.Mask,uUtils,uFPagoTarjetaDAO,IBX.IBQUERY,uTarjetasDAO,math,ubuscardatos;

type
  TfrmRecargo = class(TForm)
    eNroSeguimiento: TEdit;
    eprecio: TEdit;
    Descripcion: TLabel;
    Label1: TLabel;
    bagregar: TBitBtn;
    Bcancelar: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    eCodFormaPago: TEdit;
    eFormaPago: TEdit;
    Label4: TLabel;
    eRecargo: TEdit;
    Label5: TLabel;
    eTotalReceta: TEdit;
    eTotalCobro: TEdit;
    Label6: TLabel;

    procedure bagregarClick(Sender: TObject);
    procedure eNroSeguimientoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eCodFormaPagoChange(Sender: TObject);
    procedure eCodFormaPagoEnter(Sender: TObject);
    procedure eCodFormaPagoExit(Sender: TObject);
    procedure eCodFormaPagoKeyPress(Sender: TObject; var Key: Char);
    procedure eCodFormaPagoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eRecargoChange(Sender: TObject);
  private
    nro_sucursal:string;
    nro_comprob:string;
    FPagoTarjetaDAO:TFPagoTarjetaDAO;
    tarjetasDAO:TTarjetasDAO;
    query:TIBQUERY;
    form:TFbuscardatos;
    procedure validarRecargo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecargo: TfrmRecargo;

implementation

{$R *.dfm}

uses facturador;

procedure TfrmRecargo.bagregarClick(Sender: TObject);
var
descuento: double;
begin
      if StrToFloat(eprecio.Text) = 0 then
      begin
        showmessage('No es posible aplicar un cargo adicional sin intereses.');
        eCodFormaPago.SetFocus;
        exit;
      end;



      if dmfacturador.dprincipal.Active=false then
        begin

        dmfacturador.dprincipal.CreateDataSet;
        dmfacturador.dprincipal.Active:=true;
        end;

        dmfacturador.dprincipal.Append;
        dmfacturador.dprincipalNOM_LARGO.AsString:='IMP.RECARGO TICKET NRO.' +copy(nro_comprob,LENGTH(nro_comprob) -7,8);
        dmfacturador.dprincipalCANTIDAD.AsInteger:=1;
        dmfacturador.dprincipalPRECIO.AsCurrency:=strtofloat(ePrecio.Text);

        dmfacturador.DPRINCIPALES_RECARGO.AsString:='S';
        dmfacturador.dprincipalcod_alfabeta.AsString:='500064';
        dmfacturador.dprincipalNRO_troquel.AsString:='2';
        dmfacturador.dprincipalcod_iva.AsString:='B';
        dmfacturador.dprincipalcod_barraspri.AsString:='';
        dmfacturador.dprincipalPrecio_Total.AsFloat:=strToFloat(eprecio.text);
        dmfacturador.dprincipalDESCUENTOS.AsFloat:=0;

        descuento:=0;
         if descuento>100 then
         begin
         descuento:=100;
         end;
        dmfacturador.dprincipalporcentaje.AsFloat:=descuento;


        dmfacturador.dprincipalprecio_totaldesc.AsFloat:=strToFloat(eprecio.Text);
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


procedure TfrmRecargo.eCodFormaPagoChange(Sender: TObject);
begin

  if Length(eCodFormaPago.Text) >2 then
  begin
    query:= tarjetasDAO.obtenerTarjetaPorCodigo(eCodFormaPago.Text);

    if query.IsEmpty then
    begin
      ShowMessage('La forma de pago no es valida.');
      eCodFormaPago.Color:=clMaroon;
      ecodFormaPago.text:= '';
       exit;
    end;

    query.First;
    eFormaPago.Text := query.FieldByName('NOM_TARJETA').AsString;
    eRecargo.Text   := query.FieldByName('POR_RECARGO').AsString;

    if TUtils.esCampoVacio(eRecargo.text) then
    begin
        ShowMessage('Debe escribir un codigo de tarjeta que tenga recargo.');
        ecodFormaPago.text:= '';
        eFormaPago.Text := '';
        eRecargo.Text:= '';
        eTotalCobro.Text:= '0';
        eprecio.Text:= '0';
        eCodFormaPago.SetFocus;
        Exit;
    end;



    query.Close;

  end;



end;

procedure TfrmRecargo.eCodFormaPagoEnter(Sender: TObject);
begin

     TEdit(Sender).Color := clmoneygreen;
     Application.ProcessMessages;
end;

procedure TfrmRecargo.eCodFormaPagoExit(Sender: TObject);
begin
eCodFormaPago.Color:=clWindow;
end;

procedure TfrmRecargo.eCodFormaPagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_DOWN then
  BEGIN
    FORM := tfbuscardatos.Create(SELF);
    FORM.TipoBusqueda := tarjeta;
    FORM.ShowModal;

    eCodFormaPago.Text := FORM.nombreSeleccionado;
    eFormaPago.Text := FORM.numeroSeleccionado;
    eRecargo.Text := FORM.coeficiente;
    eNroSeguimiento.SetFocus;
    FORM.DisposeOf;
  END;
end;

procedure TfrmRecargo.eCodFormaPagoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    bAgregar.SetFocus;


end;

procedure TfrmRecargo.eNroSeguimientoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    validarRecargo;
end;

procedure TfrmRecargo.eRecargoChange(Sender: TObject);
var
precio_recargo:double;
begin

   if TUtils.esCampoVacio(eRecargo.Text) then
    Exit;

   precio_recargo:=0;
   precio_recargo:= (strToFloat(eTotalReceta.Text) * StrToFloat(eRecargo.Text))/100;
   eprecio.Text      := FloatToStr(roundTo(precio_recargo, -2));
   eTotalCobro.Text  := FloatToStr(roundTo(strToFloat(eTotalReceta.Text) + strToFloat(eprecio.Text),-2));

end;

procedure TfrmRecargo.FormCreate(Sender: TObject);
begin
  FPagoTarjetaDAO:= TFPagoTarjetaDAO.Create;
  tarjetasDAO:= TTarjetasDAO.Create;
end;

procedure TfrmRecargo.FormDestroy(Sender: TObject);
begin
FPagoTarjetaDAO.Free;
tarjetasDAO.Free;
end;

procedure TfrmRecargo.FormShow(Sender: TObject);
begin
  eNroSeguimiento.SetFocus;
  eprecio.Text:='0';
  eTotalReceta.Text:='0';
  eTotalCobro.Text:='0';

  eCodFormaPago.Color:= clMoneyGreen;
end;

procedure TfrmRecargo.validarRecargo;
var
precio_recargo:double;
cod_tarjeta:string;
begin
   if Length(eNroSeguimiento.Text) < 13 then
   begin
     showMessage('El numero de seguimiento no es valido');
     Exit;
   end;

   nro_sucursal:= Copy(eNroSeguimiento.Text,1,3);
   nro_comprob:= Copy(eNroSeguimiento.Text,4,Length(eNroSeguimiento.Text)-3);

   query:= FPagoTarjetaDAO.obtenerDatosTarjetaPorComprobMed(nro_sucursal,nro_comprob);

   if query.IsEmpty then
   begin
     showMessage('El número de seguimiento ingresado '+#13+'no ha sido facturado con tarjeta.');
     exit;
   end;

   query.First;
   eTotalReceta.Text := query.FieldByName('IMP_TARJETA').AsString;
   cod_tarjeta := query.FieldByName('COD_TARJETA').AsString;

   eCodFormaPago.setfocus;
   query.Close;
   eCodFormaPago.Text:= cod_tarjeta;
end;

end.

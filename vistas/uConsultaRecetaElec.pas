unit uConsultaRecetaElec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,uUtils,  DateUtils,math,uCalcularDescuento,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, udticket,uAdesfavalservice,udmfacturador,uCalculadoraprecio,
  Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient,uprogreso,Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML,uBusquedaProductos;

type
  TFRecetaElectronica = class(TForm)
    Gfacturador: TDBGrid;
    Panel1: TPanel;
    eosafiliado: TBevel;
    Label8: TLabel;
    Label1: TLabel;
    eosnroreceta: TBevel;
    eosfecha: TBevel;
    Label2: TLabel;
    TValidaReceta: TTimer;
    Panel2: TPanel;
    baccion: TBitBtn;
    bagregar: TBitBtn;
    Bcancelar: TBitBtn;
    Label3: TLabel;
    eosmedico: TBevel;
    Label4: TLabel;
    bevel1: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblplan: TLabel;
    lblafiliado: TLabel;
    lblfecha: TLabel;
    lblreceta: TLabel;
    lblmedico: TLabel;
    Button1: TButton;
    CDSPRODUCTOS: TClientDataSet;
    CDSPRODUCTOSCOD_ALFABETA: TStringField;
    CDSPRODUCTOSNRO_TROQUEL: TStringField;
    CDSPRODUCTOSVALE: TStringField;
    CDSPRODUCTOSCOD_BARRASPRI: TStringField;
    CDSPRODUCTOSNOM_LARGO: TStringField;
    CDSPRODUCTOSCOD_IVA: TStringField;
    CDSPRODUCTOSPRECIO: TCurrencyField;
    CDSPRODUCTOSCANTIDAD: TIntegerField;
    CDSPRODUCTOSPRECIO_TOTAL: TCurrencyField;
    CDSPRODUCTOSPRECIO_TOTALDESC: TCurrencyField;
    CDSPRODUCTOSDESCUENTOS: TCurrencyField;
    CDSPRODUCTOSPORCENTAJEOS: TFloatField;
    CDSPRODUCTOSPORCENTAJECO1: TFloatField;
    CDSPRODUCTOSPORCENTAJECO2: TFloatField;
    CDSPRODUCTOSDESCUENTOSOS: TCurrencyField;
    CDSPRODUCTOSDESCUENTOCO1: TCurrencyField;
    CDSPRODUCTOSDESCUENTOCO2: TCurrencyField;
    CDSPRODUCTOSCOD_LABORATORIO: TStringField;
    CDSPRODUCTOScan_stk: TIntegerField;
    CDSPRODUCTOScan_vale: TStringField;
    CDSPRODUCTOStamano: TIntegerField;
    CDSPRODUCTOSModificado: TBooleanField;
    CDSPRODUCTOSRUBRO: TStringField;
    CDSPRODUCTOSIMPORTEGENT: TFloatField;
    CDSPRODUCTOSCODAUTORIZACION: TStringField;
    CDSPRODUCTOSporcentaje: TFloatField;
    CDSPRODUCTOSItem: TIntegerField;
    CDSPRODUCTOSGENTILEZA: TFloatField;
    CDSPRODUCTOShosp: TStringField;
    CDSPRODUCTOSPORCENTAJEAPLUS: TFloatField;
    CDSPRODUCTOSDESCUENTOAPLUS: TFloatField;
    CDSPRODUCTOSES_RECARGO: TStringField;
    CDSPRODUCTOSimportetotal: TAggregateField;
    CDSPRODUCTOSdescuentos_total: TAggregateField;
    CDSPRODUCTOSnetoxcobrar: TAggregateField;
    CDSPRODUCTOSDESCUENTOTOTALOS: TAggregateField;
    CDSPRODUCTOSDESCUENTOTOTALCO1: TAggregateField;
    CDSPRODUCTOSDESCUENTOTOTALCO2: TAggregateField;
    CDSPRODUCTOSTOTALGENTILEZA: TAggregateField;
    CDSPRODUCTOSdescuentototalaplus: TAggregateField;
    DSProductos: TDataSource;
    CDSDetalleReceta: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    CurrencyField1: TCurrencyField;
    IntegerField1: TIntegerField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    CurrencyField4: TCurrencyField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    CurrencyField5: TCurrencyField;
    CurrencyField6: TCurrencyField;
    CurrencyField7: TCurrencyField;
    StringField7: TStringField;
    IntegerField2: TIntegerField;
    StringField8: TStringField;
    IntegerField3: TIntegerField;
    BooleanField1: TBooleanField;
    StringField9: TStringField;
    FloatField4: TFloatField;
    StringField10: TStringField;
    FloatField5: TFloatField;
    IntegerField4: TIntegerField;
    FloatField6: TFloatField;
    StringField11: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField12: TStringField;
    AggregateField1: TAggregateField;
    AggregateField2: TAggregateField;
    AggregateField3: TAggregateField;
    AggregateField4: TAggregateField;
    AggregateField5: TAggregateField;
    AggregateField6: TAggregateField;
    AggregateField7: TAggregateField;
    AggregateField8: TAggregateField;
    procedure BcancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TValidaRecetaTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bagregarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);


  private
    { Private declarations }
    progreso:Tfprogreso;
    AdesfaValService:TAdesfaValService;
    cod_troquel_busc:string;
    xmlConsulta:string;
    procedure leerReceta;
    procedure construirConsultaReceta;
    procedure solicitarReceta;
    procedure bajarDetalleATicket;
  public
    { Public declarations }
    ticket:TTicket;
    ItemList:TList;
    unItem:TTicketItemVAL;
    numItems:integer;
    procedure setTicket(unTicket:TTicket);
    procedure ProcesarXML(const XMLString: string);
  end;

var
  FRecetaElectronica: TFRecetaElectronica;

implementation

{$R *.dfm}

procedure TFRecetaElectronica.bagregarClick(Sender: TObject);
var
  unItemVal:TTicketItemVAL;
begin
  bajarDetalleATicket;

  modalResult:=mrClose;

end;

procedure TFRecetaElectronica.BcancelarClick(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure TFRecetaElectronica.Button1Click(Sender: TObject);
var
  // reg: tregistry;
  A: Integer;
  descuento: titemdescuento;
  cobOS: double;
  cobCos1: double;
  cobcos2: double;
  Valor: extended;
  espacios: string;
  value: Integer;
  form: tfprogreso;
  form3: tfbusquedaproductos;
  porvarlabo,porvarrubro:double;
  preciocalculado,precioCrudo,porcentajeAumentoHosp:double;
  r1descuento: double;
begin

  porcentajeAumentoHosp:=0;
  form := tfprogreso.Create(SELF);
  form.Show;
  application.ProcessMessages;
  dmFacturador.dsecundario.Close;
  // ------------------------------------------------busqueda por descripcion/codigo troquel/ barras--------------------------------/ /

    dmFacturador.AbrirConexion();

    if Length(cod_troquel_busc) > 0 then
    begin
      dmFacturador.qbusqueda.Close;
      dmFacturador.qbusqueda.SQL.Clear;
      dmFacturador.qbusqueda.SQL.Text := concat(' select first(100) ',
        '  DISTINCT a.cod_alfabeta, ', '  a.nro_troquel,   ',
        '  a.cod_barraspri,  ', '  a.nom_largo, ', '  a.cod_iva, ',
        '  s.can_stk, ', '  a.cod_tamano, ', '  a.cod_laboratorio, ',
        ' coalesce(CAST(   ', ' CASE  ',
        ' WHEN a.mar_impsug=''N'' and a.mar_precioventa=''S'' THEN  ',
        ' b.imp_venta  ',
        ' when a.mar_impsug=''N'' and a.mar_precioventa=''N'' THEN ',
        ' (b.imp_compra*(1+r.por_margen/100)) ',
        '  when a.mar_impsug=''S'' AND A.mar_precioventa=''S'' then ',
        ' (a.imp_sugerido) ',
        ' when A.mar_impsug=''S'' AND A.mar_precioventa=''N'' then ',
        '  ((a.imp_sugerido*r.por_margen/100) + a.imp_sugerido) ',
        '  END AS DECIMAL (10,2)),0) as PRECIO, ',
        ' c.POR_VAR_PRECIO as varlabo,  ', ' r.por_var_precio as VARRUBRO,  ',
        ' r.cod_rubro,  ', ' d.des_droga,  ', ' f.des_accfarm,  ',
        ' c.nom_laboratorio ', ' from  prmalaboratorio c, prmarubro r,   ',
        ' prmaproducto a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta ',
        ' LEFT JOIN prmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm  ',
        ' LEFT JOIN prmamonodroga d ON  D.cod_droga=a.cod_droga   ',
        ' left join   prmastock s on    a.cod_alfabeta=s.cod_alfabeta and s.nro_sucursal=b.nro_sucursal ',
        ' where (cod_barraspri= :Barras Or NRO_TROQUEL= :Troquel or (a.nom_largo like :nombre ) ) ',
        ' AND a.cod_rubro=r.cod_rubro ',
        ' and c.cod_laboratorio=a.cod_laboratorio ',
        ' and not(mar_baja=''S'' and s.can_stk=0) ',
        ' and b.nro_sucursal=:sucursal ', ' order by 4 asc');



      // INACTIVOS

      if tryStrToInt(cod_troquel_busc, value) then
      begin
        dmFacturador.qbusqueda.ParamByName('troquel').Asinteger := value;
      end;
      dmFacturador.qbusqueda.ParamByName('sucursal').AsString :=
        dmFacturador.getSucursal();

      dmFacturador.qbusqueda.Open;
      // ------------------------insersion en grilla de busqueda--------------//
      if not dmFacturador.qbusqueda.IsEmpty then
      Begin
        While not dmFacturador.qbusqueda.Eof do
        begin
          if dmFacturador.dsecundario.Active = false then
          begin
            dmFacturador.dsecundario.CreateDataSet;
            dmFacturador.dsecundario.Active := true;
          end;
          dmFacturador.dsecundario.Append;
          dmFacturador.dsecundariocod_alfabeta.AsString :=
            dmFacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString;
          dmFacturador.dsecundarionro_troquel.AsString :=
            dmFacturador.qbusqueda.FieldByName('nro_troquel').AsString;
          dmFacturador.dsecundariocod_barraspri.AsString :=
            dmFacturador.qbusqueda.FieldByName('cod_barraspri').AsString;
          dmFacturador.dsecundarionom_largo.AsString :=
            dmFacturador.qbusqueda.FieldByName('nom_largo').AsString;
          dmFacturador.dsecundariocod_iva.AsString :=
            dmFacturador.qbusqueda.FieldByName('cod_iva').AsString;
          dmFacturador.dsecundariocan_stk.AsString :=
            dmFacturador.qbusqueda.FieldByName('can_stk').AsString;

          porvarlabo := dmFacturador.qbusqueda.FieldByName('varlabo').Asfloat;
          porvarrubro := dmFacturador.qbusqueda.FieldByName('varrubro').Asfloat;

          setroundmode(rmNearest);
          preciocrudo :=
            simpleroundto((dmFacturador.qbusqueda.FieldByName('precio')
            .Asfloat), -2);

          dmFacturador.dSECUNDARIOhosp.AsString:='N';
          //----------------MODIFICADO 08/11/2022------------------------------//
          if (TICKET.codigo_OS='ZBI') OR (TICKET.codigo_OS='ZBH') OR (TICKET.codigo_OS='ZA7')  OR (TICKET.codigo_OS='W14') OR (TICKET.codigo_OS='WVP') OR (TICKET.codigo_OS='WVR') OR (TICKET.codigo_OS='W15') OR (TICKET.codigo_OS='WVJ') OR (TICKET.codigo_OS='WVM') OR (TICKET.codigo_OS='WVD') OR (TICKET.codigo_OS='WVO') OR (TICKET.codigo_OS='WVG') OR (TICKET.codigo_OS='WVF') OR (TICKET.codigo_OS='WVH') OR (TICKET.codigo_OS='WVN') OR (TICKET.codigo_OS='WVE') OR (TICKET.codigo_OS='ZAE') OR (TICKET.codigo_OS='ZAF') OR (TICKET.codigo_OS='ZAG') OR (TICKET.codigo_OS='ZAI') OR (TICKET.codigo_OS='ZAL') OR (TICKET.codigo_OS='ZAM') OR (TICKET.codigo_OS='ZAN') OR (TICKET.codigo_OS='ZAO') OR (TICKET.codigo_OS='OFL') OR (TICKET.codigo_OS='OFN') OR (TICKET.codigo_OS='OFM') OR (TICKET.codigo_OS='OFK') OR (TICKET.codigo_OS='OFJ') OR (TICKET.codigo_OS='ZA2') OR (TICKET.codigo_OS='ZA3')   then
          BEGIN
          dmFacturador.dsecundarioprecio.AsString :=floattostr(preciocrudo*porcentajeAumentoHosp);
          dmFacturador.dSECUNDARIOhosp.AsString:='S';
          END;

          if (ticket.codigo_Co1='ZBI') OR (ticket.codigo_Co1='ZBH') OR (ticket.codigo_Co1='ZA7')  OR (ticket.codigo_Co1='W14') OR (ticket.codigo_Co1='WVP') OR (ticket.codigo_Co1='WVR') OR (ticket.codigo_Co1='W15') OR (ticket.codigo_Co1='WVJ') OR (ticket.codigo_Co1='WVM') OR (ticket.codigo_Co1='WVD') OR (ticket.codigo_Co1='WVO') OR (ticket.codigo_Co1='WVG') OR (ticket.codigo_Co1='WVF') OR (ticket.codigo_Co1='WVH') OR (ticket.codigo_Co1='WVN') OR (ticket.codigo_Co1='WVE') OR (ticket.codigo_Co1='ZAE') OR (ticket.codigo_Co1='ZAF') OR (ticket.codigo_Co1='ZAG') OR (ticket.codigo_Co1='ZAI') OR (ticket.codigo_Co1='ZAL') OR (ticket.codigo_Co1='ZAM') OR (ticket.codigo_Co1='ZAN') OR (ticket.codigo_Co1='ZAO') OR (ticket.codigo_Co1='OFL') OR (ticket.codigo_Co1='OFN') OR (ticket.codigo_Co1='OFM') OR (ticket.codigo_Co1='OFK') OR (ticket.codigo_Co1='OFJ') OR (ticket.codigo_Co1='ZA2') OR (ticket.codigo_Co1='ZA3')   then
          BEGIN
          dmFacturador.dsecundarioprecio.AsString :=floattostr(preciocrudo*porcentajeAumentoHosp);
          dmFacturador.dSECUNDARIOhosp.AsString:='S';
          END;

          if (ticket.codigo_Cos2='ZBI') OR (ticket.codigo_Cos2='ZBH') OR (ticket.codigo_Cos2='ZA7')  OR (ticket.codigo_Cos2='W14') OR (ticket.codigo_Cos2='WVP') OR (ticket.codigo_Cos2='WVR') OR (ticket.codigo_Cos2='W15') OR (ticket.codigo_Cos2='WVJ') OR (ticket.codigo_Cos2='WVM') OR (ticket.codigo_Cos2='WVD') OR (ticket.codigo_Cos2='WVO') OR (ticket.codigo_Cos2='WVG') OR (ticket.codigo_Cos2='WVF') OR (ticket.codigo_Cos2='WVH') OR (ticket.codigo_Cos2='WVN') OR (ticket.codigo_Cos2='WVE') OR (ticket.codigo_Cos2='ZAE') OR (ticket.codigo_Cos2='ZAF') OR (ticket.codigo_Cos2='ZAG') OR (ticket.codigo_Cos2='ZAI') OR (ticket.codigo_Cos2='ZAL') OR (ticket.codigo_Cos2='ZAM') OR (ticket.codigo_Cos2='ZAN') OR (ticket.codigo_Cos2='ZAO') OR (ticket.codigo_Cos2='OFL') OR (ticket.codigo_Cos2='OFN') OR (ticket.codigo_Cos2='OFM') OR (ticket.codigo_Cos2='OFK') OR (ticket.codigo_Cos2='OFJ') OR (ticket.codigo_Cos2='ZA2') OR (ticket.codigo_Cos2='ZA3')   then
          BEGIN
          dmFacturador.dsecundarioprecio.AsString :=floattostr(preciocrudo*porcentajeAumentoHosp);
          dmFacturador.dSECUNDARIOhosp.AsString:='S';
          END;

          if NOT ((TICKET.codigo_OS='ZBI') OR (TICKET.codigo_OS='ZBH') OR (TICKET.codigo_OS='ZA7')  OR (TICKET.codigo_OS='W14') OR (TICKET.codigo_OS='WVP') OR (TICKET.codigo_OS='WVR') OR (TICKET.codigo_OS='W15') OR (TICKET.codigo_OS='WVJ') OR (TICKET.codigo_OS='WVM') OR (TICKET.codigo_OS='WVD') OR (TICKET.codigo_OS='WVO') OR (TICKET.codigo_OS='WVG') OR (TICKET.codigo_OS='WVF') OR (TICKET.codigo_OS='WVH') OR (TICKET.codigo_OS='WVN') OR (TICKET.codigo_OS='WVE') OR (TICKET.codigo_OS='ZAE') OR (TICKET.codigo_OS='ZAF') OR (TICKET.codigo_OS='ZAG') OR (TICKET.codigo_OS='ZAI') OR (TICKET.codigo_OS='ZAL') OR (TICKET.codigo_OS='ZAM') OR (TICKET.codigo_OS='ZAN') OR (TICKET.codigo_OS='ZAO') OR (TICKET.codigo_OS='OFL') OR (TICKET.codigo_OS='OFN') OR (TICKET.codigo_OS='OFM') OR (TICKET.codigo_OS='OFK') OR (TICKET.codigo_OS='OFJ') OR (TICKET.codigo_OS='ZA2') OR (TICKET.codigo_OS='ZA3')  ) then
          BEGIN
          if not ((ticket.codigo_Co1='ZBI') OR (ticket.codigo_Co1='ZBH') OR (ticket.codigo_Co1='ZA7')  OR (ticket.codigo_Co1='W14') OR (ticket.codigo_Co1='WVP') OR (ticket.codigo_Co1='WVR') OR (ticket.codigo_Co1='W15') OR (ticket.codigo_Co1='WVJ') OR (ticket.codigo_Co1='WVM') OR (ticket.codigo_Co1='WVD') OR (ticket.codigo_Co1='WVO') OR (ticket.codigo_Co1='WVG') OR (ticket.codigo_Co1='WVF') OR (ticket.codigo_Co1='WVH') OR (ticket.codigo_Co1='WVN') OR (ticket.codigo_Co1='WVE') OR (ticket.codigo_Co1='ZAE') OR (ticket.codigo_Co1='ZAF') OR (ticket.codigo_Co1='ZAG') OR (ticket.codigo_Co1='ZAI') OR (ticket.codigo_Co1='ZAL') OR (ticket.codigo_Co1='ZAM') OR (ticket.codigo_Co1='ZAN') OR (ticket.codigo_Co1='ZAO') OR (ticket.codigo_Co1='OFL') OR (ticket.codigo_Co1='OFN') OR (ticket.codigo_Co1='OFM') OR (ticket.codigo_Co1='OFK') OR (ticket.codigo_Co1='OFJ') OR (ticket.codigo_Co1='ZA2') OR (ticket.codigo_Co1='ZA3'))   then
            BEGIN
            if not ((ticket.codigo_Cos2='ZBI') OR (ticket.codigo_Cos2='ZBH') OR (ticket.codigo_Cos2='ZA7')  OR (ticket.codigo_Cos2='W14') OR (ticket.codigo_Cos2='WVP') OR (ticket.codigo_Cos2='WVR') OR (ticket.codigo_Cos2='W15') OR (ticket.codigo_Cos2='WVJ') OR (ticket.codigo_Cos2='WVM') OR (ticket.codigo_Cos2='WVD') OR (ticket.codigo_Cos2='WVO') OR (ticket.codigo_Cos2='WVG') OR (ticket.codigo_Cos2='WVF') OR (ticket.codigo_Cos2='WVH') OR (ticket.codigo_Cos2='WVN') OR (ticket.codigo_Cos2='WVE') OR (ticket.codigo_Cos2='ZAE') OR (ticket.codigo_Cos2='ZAF') OR (ticket.codigo_Cos2='ZAG') OR (ticket.codigo_Cos2='ZAI') OR (ticket.codigo_Cos2='ZAL') OR (ticket.codigo_Cos2='ZAM') OR (ticket.codigo_Cos2='ZAN') OR (ticket.codigo_Cos2='ZAO') OR (ticket.codigo_Cos2='OFL') OR (ticket.codigo_Cos2='OFN') OR (ticket.codigo_Cos2='OFM') OR (ticket.codigo_Cos2='OFK') OR (ticket.codigo_Cos2='OFJ') OR (ticket.codigo_Cos2='ZA2') OR (ticket.codigo_Cos2='ZA3')) then
              begin

              dmFacturador.dsecundarioprecio.AsString :=floattostr(preciocrudo);
              dmFacturador.dSECUNDARIOhosp.AsString:='N';
              end;
            END;
          END;

          //-----------AUMENTO A LOS HOSPITALES----------------------//
          // dmfacturador.dsecundarioprecio.AsString:=dmfacturador.qbusqueda.FieldByName('precio').AsString;
          /// ------------------------si los campos de os no estan vacios--------------------------///

            descuento := CalcularDescuento(Ticket.sucursal,
              (dmFacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString),
              ticket.codigo_OS, '', '', ticket.afiliado_numero, '','','');


          /// -------------------------calculo de descuento preliminar--------------------------------//

          dmFacturador.dsecundariodescuento.Asfloat :=
              (descuento.getDescuentotal);
            if (descuento.getDescuentotal) > 0 then
            begin
              dmFacturador.dsecundarioPRECIO_TOTAL.Asfloat :=
                dmFacturador.dsecundarioprecio.Asfloat *
                ((descuento.getDescuentotal) / 100);
            end;

          if dmFacturador.dsecundariodescuento.IsNull then
          begin
            dmFacturador.dsecundariodescuento.Asfloat := 0;
          end;

          dmFacturador.dsecundarioPRECIO_TOTAL.Asfloat :=
            dmFacturador.dsecundarioprecio.Asfloat;

          dmFacturador.dsecundarioRUBRO.AsString :=
            dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString;


            dmFacturador.dsecundarioDESCUENTOOS.Asfloat := descuento.Porc_os;
            cobOS := descuento.Porc_os;


          dmFacturador.dsecundarioCod_laboratorio.AsString :=
            dmFacturador.qbusqueda.FieldByName('cod_laboratorio').AsString;
          dmFacturador.dsecundariocod_tamano.AsString :=
            dmFacturador.qbusqueda.FieldByName('cod_tamano').AsString;
          dmFacturador.dsecundariodes_accion.AsString :=
            dmFacturador.qbusqueda.FieldByName('DES_ACCFARM').AsString;
          dmFacturador.dsecundariodes_droga.AsString :=
            dmFacturador.qbusqueda.FieldByName('des_droga').AsString;
          dmFacturador.dsecundarionom_laboratorio.AsString :=
            dmFacturador.qbusqueda.FieldByName('nom_laboratorio').AsString;
          dmFacturador.qbusqueda.Next;

        end;

        if dmFacturador.qbusqueda.RecordCount = 1 then
        Begin

          if CDSProductos.Active = false then
          begin

            CDSProductos.CreateDataSet;
            CDSProductos.Open;
          end;
          CDSProductos.Append;
          CDSProductosNOM_LARGO.AsString :=dmFacturador.dsecundarionom_largo.AsString;
          CDSProductosCANTIDAD.Asinteger := strToInt(unItem.cantidadVAL);
          CDSProductosPRECIO.AsCurrency := StrToCurr(unItem.importe_unitarioVAL);
          if(strToFloat(unItem.importe_unitarioVAL) = 0) then
          begin
            CDSProductosPRECIO.AsCurrency :=dmFacturador.dsecundarioprecio.AsCurrency;

          end;

          CDSProductoscod_alfabeta.AsString :=dmFacturador.dsecundariocod_alfabeta.AsString;
          CDSProductoscod_barraspri.AsString :=dmFacturador.dsecundariocod_barraspri.AsString;
          CDSProductosNRO_troquel.AsString :=dmFacturador.dsecundarionro_troquel.AsString;
          CDSProductoscod_iva.AsString :=dmFacturador.dsecundariocod_iva.AsString;
          CDSProductosPrecio_Total.Asfloat :=CDSProductosCANTIDAD.Asfloat *CDSProductosPRECIO.Asfloat;

          CDSProductosDESCUENTOS.Asfloat :=(CDSProductosCANTIDAD.Asfloat * CDSProductosPRECIO.Asfloat) *((dmFacturador.dsecundariodescuento.Asfloat / 100));


          r1descuento := dmFacturador.dsecundarioDESCUENTOOS.Asfloat;
          if r1descuento > 100 then
          begin
            r1descuento := 100;
          end;
          CDSProductosporcentaje.Asfloat := r1descuento;

          CDSProductosprecio_totaldesc.Asfloat := CDSProductosPrecio_Total.Asfloat - CDSProductosDESCUENTOS.Asfloat;
          CDSProductosPORCENTAJEOS.Asfloat := dmFacturador.dsecundarioDESCUENTOOS.Asfloat;
          CDSProductosDESCUENTOSOS.AsCurrency :=(CDSProductosCANTIDAD.Asfloat * CDSProductosPRECIO.Asfloat) *((CDSPRODUCTOSPORCENTAJEOS.Asfloat) / 100);
          {Aca deberia ir el cambio para SUTIAGA que dolor de huevos}
          CDSProductosDESCUENTOco1.AsCurrency := (CDSProductosCANTIDAD.Asfloat *CDSProductosPRECIO.Asfloat) *((0) / 100);
          {Esta linea es la posible de modificar}

          CDSProductosCOD_LABORATORIO.AsString := dmFacturador.dsecundarioCod_laboratorio.AsString;
          CDSProductoscan_stk.Asinteger :=dmFacturador.dsecundariocan_stk.Asinteger;
          CDSProductostamano.AsString := dmFacturador.qbusqueda.FieldByName('cod_tamano').AsString;
          CDSProductosrubro.AsString :=dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString;
          CDSProductoscan_vale.AsString := '0';
          CDSProductoshosp.AsString :=dmFacturador.dsecundariohosp.AsString;
          CDSProductosPORCENTAJEAPLUS.AsFloat:=0;
          CDSProductosITEM.AsInteger:=numItems;
          CDSProductos.Post;


          dmFacturador.dsecundario.Close;



      end;
      form.Close;
      if dmFacturador.qbusqueda.RecordCount > 1 then
      Begin
        form3 := tfbusquedaproductos.Create(SELF);
        form3.SetTicket(Ticket);
        form3.ShowModal;

      end;
    end;

  end;

  form.Close;

end;

procedure TFRecetaElectronica.construirConsultaReceta;
begin
  xmlConsulta:= '<MensajeADESFA version="3.1.0">'+
'    <EncabezadoMensaje>'+
'        <TipoMsj>200</TipoMsj>'+
'        <CodAccion>490120</CodAccion>'+
'        <IdMsj>12410</IdMsj>'+
'        <InicioTrx>'+
'            <Fecha>'+TUtils.obtenerFechaValidacion+'</Fecha>'+
'            <Hora>000001</Hora>'+
'        </InicioTrx>'+
'        <Software>'+
'            <CodigoADESFA />'+
'            <Nombre>IMD</Nombre>'+
'            <Version>1</Version>'+
'        </Software>'+
'        <Validador>'+
'            <CodigoADESFA />'+
'            <Nombre>IMED</Nombre>'+
'        </Validador>'+
'        <Prestador>'+
'            <CodigoADESFA />'+
'            <Cuit />'+
'            <Sucursal />'+
'            <RazonSocial />'+
'            <Codigo>'+ticket.codigoos_prestador+'</Codigo>'+
'            <Vendedor />'+
'        </Prestador>'+
'    </EncabezadoMensaje>'+
'    <EncabezadoReceta>'+
'        <Financiador>'+
'            <CodigoADESFA />'+
'            <Codigo>41</Codigo>'+
'            <Cuit />'+
'            <Sucursal />'+
'        </Financiador>'+
'        <Credencial>'+
'            <Numero>'+ticket.afiliado_numero+'</Numero>'+
'            <Track />'+
'            <Version />'+
'            <Vencimiento />'+
'            <ModoIngreso />'+
'            <EsProvisorio />'+
'            <Plan />'+
'        </Credencial>'+
'        <Formulario>'+
'            <Fecha />'+
'            <Tipo />'+
'            <Numero>'+ticket.numero_receta+'</Numero>'+
'            <Serie />'+
'        </Formulario>'+
'    </EncabezadoReceta>'+
'</MensajeADESFA>';


end;


procedure TFRecetaElectronica.ProcesarXML(const XMLString: string);
var
  XMLDoc: IXMLDocument;
  RtaGeneralNode, ReferenciaRxNode,CantidadPrescriptaNode, ItemNode,AdesfaNode: IXMLNode;
  Referencias: IXMLNodeList;
  Items: IXMLNodeList;
  i, j: Integer;
 Descripcion: string;
  ImporteUnitario,cantidad: string;
  CodBarras:string;
  CodTroquel:string;
  CodAlfabeta:string;
  Item: TTicketItemVAL;
begin
  ItemList:=TList.Create;
     // Crear objeto XMLDoc
  XMLDoc := TXMLDocument.Create(nil);
  try
    XMLDoc.LoadFromXML(XMLString);  // Cargar XML desde la cadena

    // Buscar el nodo CodRtaGeneral
    RtaGeneralNode := XMLDoc.DocumentElement.ChildNodes.FindNode('EncabezadoMensaje')
      .ChildNodes.FindNode('Rta').ChildNodes.FindNode('CodRtaGeneral');

    if RtaGeneralNode <> nil then
    begin
      if RtaGeneralNode.Text = '0' then
      begin
        // Si CodRtaGeneral es 0, buscar las referencias en 'DetalleReceta'
        Referencias := XMLDoc.DocumentElement.ChildNodes.FindNode('DetalleReceta').ChildNodes;

        // Recorrer todas las ReferenciasRx
        for i := 0 to Referencias.Count - 1 do
        begin
          ReferenciaRxNode := Referencias.Nodes[i];
          numItems:=i+1;
          if ReferenciaRxNode.HasChildNodes then
          begin
            // Obtener los Items dentro de cada ReferenciaRx
            Items := ReferenciaRxNode.ChildNodes;

            // Buscar el nodo CantidadPrescripta fuera de los Items
            CantidadPrescriptaNode := ReferenciaRxNode.ChildNodes.FindNode('CantidadPrescripta');

             // Obtener y asignar CantidadPrescripta
                  if CantidadPrescriptaNode <> nil then
                    cantidad := CantidadPrescriptaNode.Text
                  else
                    cantidad := '0';  // Default value if not found


            // Recorrer los Items dentro de la ReferenciaRx
            for j := 0 to Items.Count - 1 do
            begin
              ItemNode := Items.Nodes[j];
              if ItemNode.HasChildNodes then
              begin
                // Buscar el nodo 'Estado' para asegurarse de que esté en estado '1'
                if ((ItemNode.ChildNodes['Estado'].Text = '1') or (ItemNode.ChildNodes['Estado'].Text = '0')) then
                begin




                  // Extraer los datos del Item
                  Descripcion := ItemNode.ChildNodes.FindNode('Descripcion').Text;
                  ImporteUnitario := ItemNode.ChildNodes.FindNode('ImporteUnitario').Text;
                  CodAlfabeta := ItemNode.ChildNodes.FindNode('Alfabeta').Text;
                  CodTroquel := ItemNode.ChildNodes.FindNode('CodTroquel').Text;
                  CodBarras := ItemNode.ChildNodes.FindNode('CodBarras').Text;

                  // Crear el objeto TTicketItemVAL y agregarlo a la lista
                  unItem := TTicketItemVAL.Create;
                  unItem.nro_itemVAL := intToStr(numitems);
                  unItem.descripcionval := Descripcion;
                  unItem.importe_unitarioVAL := ImporteUnitario;
                  unItem.cod_alfabetaVAL := CodAlfabeta;
                  unItem.cod_troquelVAL := CodTroquel;
                  unItem.cod_barrasVAL := CodBarras;

                    unItem.cantidadVAL := cantidad;  // Default value if not found

                  unItem.cantidadaprobada := cantidad;
                  unItem.porcentaje_coberturaVAL := ItemNode.ChildNodes.FindNode('PorcentajeCobertura').Text;
                  unItem.importe_coberturaVAL := ItemNode.ChildNodes.FindNode('ImporteCobertura').Text;
                  unItem.importe_afiliado := ItemNode.ChildNodes.FindNode('ImporteACargoAfiliado').Text;



                  //Buscamos datos alternativos por las dudas

                  cod_troquel_busc:= unItem.cod_troquelVAL;
                  Button1.click;

                  unItem.Free;

                  //--------------------------------------------------//




                end;
              end;
            end;
          end;
        end;
      end
      else
      begin
        ShowMessage('No se pudo descargar la receta');
      end;
    end
    else
    begin
      ShowMessage('No se encontró el nodo CodRtaGeneral');
    end;
  finally
    XMLDoc := nil;
  end;
end;



procedure TFRecetaElectronica.bajarDetalleATicket;
begin

  if not dmFacturador.DPRINCIPAL.Active then
  begin
    dmFacturador.DPRINCIPAL.CreateDataSet;
    dmFacturador.DPRINCIPAL.Open;
  end;

  CDSDetalleReceta.First;
  dmFacturador.DPRINCIPAL.EmptyDataSet;
  while not CDSDetalleReceta.Eof do
  begin
    dmFacturador.DPRINCIPAL.Append;
    dmFacturador.DPRINCIPAL.FieldByName('NOM_LARGO').AsString :=        CDSDetalleReceta.FieldByName('NOM_LARGO').AsString;
    dmFacturador.DPRINCIPAL.FieldByName('CANTIDAD').Asinteger :=        CDSDetalleReceta.FieldByName('CANTIDAD').Asinteger;
    dmFacturador.DPRINCIPAL.FieldByName('PRECIO').AsCurrency :=         CDSDetalleReceta.FieldByName('PRECIO').AsCurrency;
    dmFacturador.DPRINCIPAL.FieldByName('cod_alfabeta').AsString :=     CDSDetalleReceta.FieldByName('cod_alfabeta').AsString;
    dmFacturador.DPRINCIPAL.FieldByName('cod_barraspri').AsString :=    CDSDetalleReceta.FieldByName('cod_barraspri').AsString;
    dmFacturador.DPRINCIPAL.FieldByName('NRO_troquel').AsString :=      CDSDetalleReceta.FieldByName('NRO_troquel').AsString;
    dmFacturador.DPRINCIPAL.FieldByName('cod_iva').AsString :=          CDSDetalleReceta.FieldByName('cod_iva').AsString ;
    dmFacturador.DPRINCIPAL.FieldByName('Precio_Total').Asfloat :=      CDSDetalleReceta.FieldByName('Precio_Total').Asfloat;
    dmFacturador.DPRINCIPAL.FieldByName('porcentaje').Asfloat :=        CDSDetalleReceta.FieldByName('porcentaje').Asfloat;
    dmFacturador.DPRINCIPAL.FieldByName('precio_totaldesc').Asfloat :=  CDSDetalleReceta.FieldByName('precio_totaldesc').Asfloat;
    dmFacturador.DPRINCIPAL.FieldByName('PORCENTAJEOS').Asfloat :=      CDSDetalleReceta.FieldByName('PORCENTAJEOS').Asfloat;
    dmFacturador.DPRINCIPAL.FieldByName('DESCUENTOSOS').AsCurrency :=   CDSDetalleReceta.FieldByName('DESCUENTOSOS').AsCurrency;
    dmFacturador.DPRINCIPAL.FieldByName('DESCUENTOS').AsCurrency :=     CDSDetalleReceta.FieldByName('DESCUENTOS').AsCurrency;

    dmFacturador.DPRINCIPAL.FieldByName('DESCUENTOco1').AsCurrency :=   CDSDetalleReceta.FieldByName('DESCUENTOco1').AsCurrency;
    dmFacturador.DPRINCIPAL.FieldByName('COD_LABORATORIO').AsString :=  CDSDetalleReceta.FieldByName('COD_LABORATORIO').AsString;
    dmFacturador.DPRINCIPAL.FieldByName('can_stk').Asinteger :=         CDSDetalleReceta.FieldByName('can_stk').Asinteger;
    dmFacturador.DPRINCIPAL.FieldByName('tamano').AsString :=           CDSDetalleReceta.FieldByName('tamano').AsString;
    dmFacturador.DPRINCIPAL.FieldByName('rubro').AsString :=            CDSDetalleReceta.FieldByName('rubro').AsString;
    dmFacturador.DPRINCIPAL.FieldByName('can_vale').AsString :=         CDSDetalleReceta.FieldByName('can_vale').AsString;
    dmFacturador.DPRINCIPAL.FieldByName('hosp').AsString :=             CDSDetalleReceta.FieldByName('hosp').AsString;

    dmFacturador.DPRINCIPAL.Post;
    CDSDetalleReceta.Next;
  end;
end;
procedure TFRecetaElectronica.LeerReceta;
var
archivoxmlval: txmldocument;
CodRtaGeneral:string;
  I: Integer;
begin
   progreso.Show;
 TValidaReceta.Enabled:=false;
 archivoxmlval:=TXMLDocument.Create(self);
  adesfaValService.recibirValidacion(archivoxmlval);
  archivoxmlval.Active:=true;

  if archivoxmlval.ChildNodes.FindNode('MensajeADESFA') <> nil then
  begin
    try
       CodRtaGeneral := archivoxmlval.DocumentElement.ChildNodes['EncabezadoMensaje'].ChildNodes['Rta'].ChildNodes['CodRtaGeneral'].Text;

       if CodRtaGeneral ='75' then  // Afiliado sin recetas
       begin
          ShowMessage('AFILIADO SIN RECETAS ELECTRONICAS');
          progreso.Hide;
          Bcancelar.Click;
          exit;
       end;


       if CodRtaGeneral ='8' then  // Afiliado sin recetas
       begin
          ShowMessage('FINANCIADOR INEXISTENTE');
          progreso.Hide;
          Bcancelar.Click;
       end;
  TValidaReceta.Enabled:=false;


  // Buscamos los productos que tiene el xml de respuesta en la bd y luego le cargamos
  // el precio que se obtiene de la validacion
  ProcesarXML(archivoxmlval.XML.Text);

  if not CDSDetalleReceta.Active then
  begin
    CDSDetalleReceta.CreateDataSet;
    CDSDetalleReceta.Open;
  end;

  for I := 1 to numItems do
  begin
     CDSProductos.First;
     while not CDSPRODUCTOS.Eof do
     begin
        if CDSPRODUCTOS.FieldByName('item').AsInteger = i then
        begin
           CDSDetalleReceta.Append;
          CDSDetalleReceta.FieldByName('NOM_LARGO').AsString:= CDSProductosNOM_LARGO.AsString;
          CDSDetalleReceta.FieldByName('CANTIDAD').Asinteger:=CDSProductosCANTIDAD.Asinteger ;
          CDSDetalleReceta.FieldByName('PRECIO').AsCurrency:=CDSProductosPRECIO.AsCurrency   ;


          CDSDetalleReceta.FieldByName('cod_alfabeta').AsString:=CDSProductoscod_alfabeta.AsString;
          CDSDetalleReceta.FieldByName('cod_barraspri').AsString:=CDSProductoscod_barraspri.AsString;
          CDSDetalleReceta.FieldByName('NRO_troquel').AsString:=CDSProductosNRO_troquel.AsString;
          CDSDetalleReceta.FieldByName('cod_iva').AsString:=CDSProductoscod_iva.AsString  ;
          CDSDetalleReceta.FieldByName('Precio_Total').Asfloat:=CDSProductosPrecio_Total.Asfloat ;
          CDSDetalleReceta.FieldByName('porcentaje').Asfloat:=CDSProductosporcentaje.Asfloat    ;

          CDSDetalleReceta.FieldByName('precio_totaldesc').Asfloat:=CDSProductosprecio_totaldesc.Asfloat ;
          CDSDetalleReceta.FieldByName('PORCENTAJEOS').Asfloat:=CDSProductosPORCENTAJEOS.Asfloat     ;
          CDSDetalleReceta.FieldByName('DESCUENTOSOS').AsCurrency:=CDSProductosDESCUENTOSOS.AsCurrency ;
          CDSDetalleReceta.FieldByName('DESCUENTOS').AsCurrency:=CDSProductosDESCUENTOSOS.AsCurrency ;
          {Aca deberia ir el cambio para SUTIAGA que dolor de huevos}
          CDSDetalleReceta.FieldByName('DESCUENTOco1').AsCurrency:=CDSProductosDESCUENTOco1.AsCurrency ;

          CDSDetalleReceta.FieldByName('COD_LABORATORIO').AsString:=CDSProductosCOD_LABORATORIO.AsString ;
          CDSDetalleReceta.FieldByName('can_stk').Asinteger:=CDSProductoscan_stk.Asinteger       ;
          CDSDetalleReceta.FieldByName('tamano').AsString:=CDSProductostamano.AsString        ;
          CDSDetalleReceta.FieldByName('rubro').AsString:=CDSProductosrubro.AsString        ;
          CDSDetalleReceta.FieldByName('can_vale').AsString:=CDSProductoscan_vale.AsString   ;
          CDSDetalleReceta.FieldByName('hosp').AsString:=CDSProductoshosp.AsString     ;

          CDSDetalleReceta.Post;
          break;

        end;
         CDSProductos.Next;

     end;

  end;





  ticket.itemsval:=ItemList;

  adesfavalservice.borrarArchivoValidacion;
  progreso.Hide;
  //ModalResult:=mrClose;
except
   on E:Exception do
   begin
     progreso.close;
     TValidaReceta.Enabled:=false;

     ShowMessage('Ocurrio un error al intentar obtener la receta:'+e.Message);

     ModalResult:=mrClose;

   end;
end;
end
 else
  begin
    archivoxmlval.Free;
    TValidaReceta.Enabled := True;
  end;






end;




procedure TFRecetaElectronica.FormCreate(Sender: TObject);
begin
  AdesfaValService:=TAdesfaValService.Create;
  progreso:=TFProgreso.Create(self);
end;

procedure TFRecetaElectronica.FormShow(Sender: TObject);
begin

  progreso.Position:=poOwnerFormCenter;
   numItems:=0;


end;


procedure TFRecetaElectronica.setTicket(unTicket:TTicket);
begin
    ticket:=unTicket;

    AdesfaValService.setTicket(ticket);
    lblplan.Caption:= ticket.nombre_os;
    lblafiliado.Caption:= ticket.afiliado_apellido + ' ' + ticket.afiliado_nombre;
    lblreceta.Caption:= ticket.numero_receta;
    lblmedico.Caption:= ticket.medico_nombre + ' ' + ticket.medico_apellido;
    lblfecha.Caption:= FormatDateTime('dd-mm-yyyy',ticket.fecha_receta);



    solicitarReceta;
end;

procedure TFRecetaElectronica.solicitarReceta();
var
  archivoXML:TXMLDocument;
begin
  progreso.Show;
  AdesfaValService.nuevaValidacion;
  AdesfaValService.registrarValidacion;
  construirConsultaReceta;
  archivoXML:= TXMLDocument.Create(self);
  archivoXML.LoadFromXML(xmlConsulta);
  adesfaValService.enviarValidacion(archivoXML);

  TValidaReceta.Enabled:=true;

end;



procedure TFRecetaElectronica.TValidaRecetaTimer(Sender: TObject);
begin
    leerReceta;
end;

end.



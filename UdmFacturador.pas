unit UdmFacturador;

interface

uses
    Winapi.Windows, Winapi.Messages,System.SysUtils, System.Classes, Data.DB, IBX.IBDatabase,registry, Data.DBXFirebird,
  Data.SqlExpr, Data.FMTBcd, unit1, Vcl.ComCtrls, IBX.IBCustomDataSet,
  IBX.IBQuery,  Datasnap.DBClient, System.Variants, IBX.IBStoredProc, frxClass,
  frxDBSet, frxExportPDF;

Const
  RegKey ='Software\Autofarma\APlus\';

type
  TdmFacturador = class(TDataModule)
    dsfact: TDataSource;
    datosbusqueda: TDataSource;
    databasefire: TIBDatabase;
    transactionprod: TIBTransaction;
    qbusqueda: TIBQuery;
    qbusquedaCOD_ALFABETA: TIntegerField;
    qbusquedaNRO_TROQUEL: TIntegerField;
    qbusquedaCOD_BARRASPRI: TIBStringField;
    qbusquedaNOM_LARGO: TIBStringField;
    qbusquedaCOD_IVA: TIBStringField;
    qbusquedaCAN_STK: TSmallintField;
    qbusquedaPRECIO: TIBBCDField;
    DPRINCIPAL: TClientDataSet;
    DPRINCIPALCOD_ALFABETA: TStringField;
    DPRINCIPALNRO_TROQUEL: TStringField;
    DPRINCIPALCOD_BARRASPRI: TStringField;
    DPRINCIPALNOM_LARGO: TStringField;
    DPRINCIPALCOD_IVA: TStringField;
    DPRINCIPALPRECIO: TCurrencyField;
    DPRINCIPALCANTIDAD: TIntegerField;
    DPRINCIPALPRECIO_TOTAL: TCurrencyField;
    DPRINCIPALimportetotal: TAggregateField;
    qafiliados: TIBQuery;
    dataafiliados: TDataSource;
    tranafiliados: TIBTransaction;
    qiafiliados: TIBQuery;
    dsecundario: TClientDataSet;
    dsbusqueda: TDataSource;
    dsecundarioCOD_ALFABETA: TStringField;
    dsecundarioNRO_TROQUEL: TStringField;
    dsecundarioCOD_BARRASPRI: TStringField;
    dsecundarioNOM_LARGO: TStringField;
    dsecundarioCOD_IVA: TStringField;
    dsecundarioCAN_STK: TIntegerField;
    dsecundarioPRECIO: TStringField;
    dsecundarioDESCUENTO: TStringField;
    DPRINCIPALPRECIO_TOTALDESC: TCurrencyField;
    dsecundarioPRECIO_TOTAL: TFloatField;
    DPRINCIPALDESCUENTOS: TCurrencyField;
    DPRINCIPALdescuentos_total: TAggregateField;
    DPRINCIPALnetoxcobrar: TAggregateField;
    dsecundarioRUBRO: TStringField;
    qbusquedaCOD_RUBRO: TIBStringField;
    qosmaplanesos: TIBQuery;
    qNROVALIDACION: TIBQuery;
    IBTransactionVAL: TIBTransaction;
    IBQcodigoprestador: TIBQuery;
    dsecundarioDESCUENTOOS: TStringField;
    dsecundarioDESCUENTOCO1: TStringField;
    dsecundarioDESCUENTOCO2: TStringField;
    DPRINCIPALPORCENTAJEOS: TFloatField;
    DPRINCIPALPORCENTAJECO1: TFloatField;
    DPRINCIPALPORCENTAJECO2: TFloatField;
    DPRINCIPALDESCUENTOSOS: TCurrencyField;
    ibqcaja: TIBQuery;
    icomprobante: TIBQuery;
    ticomprobante: TIBTransaction;
    qvendedor: TIBQuery;
    qcomprobante: TIBQuery;
    qcomprobanteTIP_COMPROBANTE: TIBStringField;
    qcomprobanteTIP_IMPRE: TIBStringField;
    tpanel1: TIBTransaction;
    Dscomprobante: TDataSource;
    qpanel2: TIBQuery;
    qtipocomprob: TIBQuery;
    qcliente: TIBQuery;
    qicliente: TIBQuery;
    traninsertcliente: TIBTransaction;
    DSicliente: TDataSource;
    qupdatecliente: TIBQuery;
    DPRINCIPALDESCUENTOCO1: TCurrencyField;
    DPRINCIPALDESCUENTOCO2: TCurrencyField;
    DPRINCIPALDESCUENTOTOTALOS: TAggregateField;
    DPRINCIPALDESCUENTOTOTALCO1: TAggregateField;
    DPRINCIPALDESCUENTOTOTALCO2: TAggregateField;
    dsecundarioCOD_LABORATORIO: TStringField;
    qbusquedaCOD_LABORATORIO: TIBStringField;
    DPRINCIPALCOD_LABORATORIO: TStringField;
    DPRINCIPALcan_stk: TIntegerField;
    DPRINCIPALVALE: TStringField;
    DPRINCIPALcan_vale: TStringField;
    cdsfactura: TClientDataSet;
    dsfactura: TDataSource;
    cdsfacturacod_alfabeta: TStringField;
    cdsfacturacod_barraspri: TStringField;
    cdsfacturanom_largo: TStringField;
    cdsfacturacantidad: TStringField;
    cdsfacturacantidadcontrol: TStringField;
    frxDBDataset1: TfrxDBDataset;
    reportefactonline: TfrxReport;
    cdsfacturareporte: TClientDataSet;
    cdsfacturareportecod_alfabeta: TStringField;
    cdsfacturareportecod_barraspri: TStringField;
    cdsfacturareportenom_largo: TStringField;
    cdsfacturareportecantidad: TStringField;
    cdsfacturareportecantidadcontrol: TStringField;
    dsfacturareporte: TDataSource;
    qnrocomprob: TIBQuery;
    transcomprob: TIBTransaction;
    CDSetiquetas: TClientDataSet;
    CDSetiquetascod_alfabeta: TStringField;
    CDSetiquetasNRO_TROQUEL: TStringField;
    CDSetiquetasCOD_BARRASPRI: TStringField;
    CDSetiquetasNOM_LARGO: TStringField;
    CDSetiquetasCOD_IVA: TStringField;
    CDSetiquetasCAN_STK: TIntegerField;
    CDSetiquetasPRECIO: TStringField;
    CDSetiquetasDESCUENTO: TStringField;
    CDSetiquetasPRECIO_TOTAL: TFloatField;
    CDSetiquetaSRUBRO: TStringField;
    CDSetiquetasDESCUENTOOS: TStringField;
    CDSetiquetasDESCUENTOCO1: TStringField;
    CDSetiquetasDESCUENTOCO2: TStringField;
    CDSetiquetasCOD_LABORATORIO: TStringField;
    dsetiquetas: TDataSource;
    frxetiquetas: TfrxDBDataset;
    reporteetiquetas: TfrxReport;
    basecfg: TIBDatabase;
    qcaja: TIBQuery;
    trancaja: TIBTransaction;
    qbusquedaVARLABO: TIBBCDField;
    qbusquedaVARRUBRO: TIBBCDField;
    dsecundariocod_tamano: TStringField;
    qbusquedacod_tamano: TSmallintField;
    qlimite: TIBQuery;
    tranlimite: TIBTransaction;
    qlimiteCAN_MAXUNIDXREC: TSmallintField;
    qlimiteCAN_MAXUNIDXREN: TSmallintField;
    qlimiteCAN_MAXUNIDXTICKET: TSmallintField;
    qlimiteCAN_MAXRENXTICKET: TSmallintField;
    DPRINCIPALtamano: TIntegerField;
    qdire: TIBQuery;
    qdireDES_DIRECCION: TIBStringField;
    transdire: TIBTransaction;
    qbusquedaDES_ACCFARM: TIBStringField;
    dsecundariodes_accion: TStringField;
    dsecundariodes_droga: TStringField;
    DPRINCIPALModificado: TBooleanField;
    CDSetiquetascod_tamano: TStringField;
    CDSetiquetasdes_accion: TStringField;
    CDSetiquetasdes_droga: TStringField;
    qcuit: TIBQuery;
    qcuitNRO_CUIT: TIBStringField;
    tcuit: TIBTransaction;
    cdsreporteiva: TClientDataSet;
    qreporteiva: TIBQuery;
    tranreporteiva: TIBTransaction;
    dsreporteiva: TDataSource;
    qreporteivaPUESTOVENTA: TIBStringField;
    qreporteivaMINIMO: TFloatField;
    qreporteivaMAXIMO: TFloatField;
    qreporteivaTIP_COMPROBANTE: TIBStringField;
    qreporteivaPOR_PORCENTAJE: TIBBCDField;
    qreporteivaCUIT: TIBStringField;
    qreporteivaCLIENTE: TIBStringField;
    qreporteivaFECHA: TDateField;
    qreporteivaBRUTO: TIBBCDField;
    qreporteivaIVA: TIBBCDField;
    qreporteivaNETOGRAVADO: TIBBCDField;
    qreporteivaNETONOGRAVADO: TIBBCDField;
    qreporteivaNETOGRAVDESC: TIBBCDField;
    qreporteivaTOTAL: TIBBCDField;
    cdsreporteivafecha: TDateField;
    cdsreporteivacomprobante: TStringField;
    cdsreporteivadescripcion: TStringField;
    cdsreporteivacliente: TStringField;
    cdsreporteivacuit: TStringField;
    cdsreporteivanetogravado: TCurrencyField;
    cdsreporteivatasa: TFloatField;
    cdsreporteivaimporteiva: TCurrencyField;
    cdsreporteivanogravado: TCurrencyField;
    cdsreporteivapercepcionibb: TFloatField;
    cdsreporteivatotal: TCurrencyField;
    qreporteivaDES_COMP: TIBStringField;
    cdsfacturareportenro_factura: TStringField;
    qbusquedaDES_DROGA: TIBStringField;
    qdroga: TIBQuery;
    qdrogaDES_DROGA: TIBStringField;
    dsdroga: TDataSource;
    qranking: TIBQuery;
    tranking: TIBTransaction;
    DPRINCIPALRUBRO: TStringField;
    DPRINCIPALIMPORTEGENT: TFloatField;
    DPRINCIPALTOTALGENTILEZA: TAggregateField;
    reportekardex: TfrxReport;
    qkardex: TIBQuery;
    dskardex: TDataSource;
    frxDBDataset2: TfrxDBDataset;
    qkardexFEC_MOVIMIENTO: TDateTimeField;
    qkardexTIP_COMPROBANTE: TIBStringField;
    qkardexNRO_COMPROBANTE: TFloatField;
    qkardexSTK_INICIAL: TSmallintField;
    qkardexMOVIMIENTOS: TSmallintField;
    qkardexSTK_FINAL: TSmallintField;
    qkardexNOM_LARGO: TIBStringField;
    qbusquedacomprob: TIBQuery;
    dsbusquedacomprob: TDataSource;
    qbusquedacomprobTIP_COMPROBANTE: TIBStringField;
    qbusquedacomprobNRO_COMPROBANTE: TFloatField;
    qbusquedacomprobCOD_VENDEDOR: TIBStringField;
    qbusquedacomprobNRO_CAJA: TSmallintField;
    qbusquedacomprobFEC_COMPROBANTE: TDateTimeField;
    qbusquedacomprobCAN_ITEMS: TSmallintField;
    qbusquedacomprobIMP_NETO: TIBBCDField;
    qbusquedacomprobIMP_BRUTO: TIBBCDField;
    qosmamovobrasocial: TIBQuery;
    qbusquedacomprobNOM_CLIENTE: TIBStringField;
    qbusquedacomprobCOD_CLIENTE: TIntegerField;
    qcuitcliente: TIBQuery;
    cdsbusquedacomprob: TClientDataSet;
    cdsbusquedacomprobTIP_COMPROBANTE: TStringField;
    cdsbusquedacomprobNRO_COMPROBANTE: TStringField;
    cdsbusquedacomprobCOD_VENDEDOR: TStringField;
    cdsbusquedacomprobNRO_CAJA: TStringField;
    cdsbusquedacomprobFEC_COMPROBANTE: TStringField;
    cdsbusquedacomprobCAN_ITEMS: TStringField;
    cdsbusquedacomprobIMP_NETO: TStringField;
    cdsbusquedacomprobIMP_BRUTO: TStringField;
    cdsbusquedacomprobNOM_CLIENTE: TStringField;
    cdsbusquedacomprobCOD_CLIENTE: TStringField;
    qbusquedacomprobIMP_CARGOOS: TIBBCDField;
    qbusquedacomprobCOD_PLANOS: TIBStringField;
    qbusquedacomprobNOM_OBRASOCIAL: TIBStringField;
    qbusquedacomprobFEC_RECETA: TDateTimeField;
    qbusquedacomprobNOM_AFILIADO: TIBStringField;
    qbusquedacomprobNRO_MATRICULA: TIBStringField;
    cdsbusquedacomprobIMP_CARGOOS: TStringField;
    cdsbusquedacomprobCOD_PLANOS: TStringField;
    cdsbusquedacomprobNOM_OBRASOCIAL: TStringField;
    cdsbusquedacomprobFEC_RECETA: TStringField;
    cdsbusquedacomprobNOM_AFILIADO: TStringField;
    cdsbusquedacomprobNRO_MATRICULA: TStringField;
    qosmamovobrasocialCOD_ALFABETA: TIntegerField;
    qosmamovobrasocialNRO_ITEM: TSmallintField;
    qosmamovobrasocialNOM_LARGO: TIBStringField;
    qosmamovobrasocialCAN_CANTIDAD: TSmallintField;
    qosmamovobrasocialIMP_UNITARIO: TIBBCDField;
    qosmamovobrasocialIMP_PRODNETO: TIBBCDField;
    qosmamovobrasocialIMP_DESCUENTO: TIBBCDField;
    qosmamovobrasocialPOR_DESCUENTO: TIBBCDField;
    cdsosmamovobrasocial: TClientDataSet;
    cdsosmamovobrasocialCOD_ALFABETA: TStringField;
    cdsosmamovobrasocialNRO_ITEM: TStringField;
    cdsosmamovobrasocialNOM_LARGO: TStringField;
    cdsosmamovobrasocialCAN_CANTIDAD: TStringField;
    cdsosmamovobrasocialIMP_UNITARIO: TStringField;
    cdsosmamovobrasocialIMP_PRODNETO: TStringField;
    cdsosmamovobrasocialIMP_DESCUENTO: TStringField;
    cdsosmamovobrasocialPOR_DESCUENTO: TStringField;
    dsdetalle: TDataSource;
    qkardexNOM_VENDEDOR: TIBStringField;
    qbusquedastock: TIBQuery;
    qbusquedacomprobMAR_OBRASOCIAL: TIBStringField;
    cdsbusquedacomprobMAR_OBRASOCIAL: TStringField;
    qcomprobantenf: TIBQuery;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    qcomprobantenfDES_COMP: TIBStringField;
    dstipcomprobantenf: TDataSource;
    DPRINCIPALCODAUTORIZACION: TStringField;
    qmodif: TIBQuery;
    dsmodif: TDataSource;
    reportemodif: TfrxReport;
    frxDBDataset3: TfrxDBDataset;
    qmodifTIP_COMPROBANTE: TIBStringField;
    qmodifNRO_COMPROBANTE: TFloatField;
    qmodifNOM_VENDEDOR: TIBStringField;
    qmodifNOM_PRODUCTO: TIBStringField;
    qmodifIMP_UNITARIO: TIBBCDField;
    qmodifCAN_CANTIDAD: TSmallintField;
    qmodifCAST: TDateField;
    qinsertlineastock: TIBQuery;
    DPRINCIPALporcentaje: TFloatField;
    qbusquedaNOM_LABORATORIO: TIBStringField;
    dsecundarionom_laboratorio: TStringField;
    qstock: TIBQuery;
    dsstock: TDataSource;
    transtock: TIBTransaction;
    frxstock: TfrxDBDataset;
    frxreportestock: TfrxReport;
    cdsstock: TClientDataSet;
    cdsstockcod_barraspri: TStringField;
    cdsstocknom_largo: TStringField;
    qtablaiva: TIBQuery;
    DPRINCIPALItem: TIntegerField;
    ibtcajanombre: TIBTransaction;
    Dcajanombre: TDataSource;
    ibcajanombre: TIBQuery;
    ibcajanombreNRO_CAJA: TSmallintField;
    ibcajanombreDES_CAJA: TIBStringField;
    cdcaja: TClientDataSet;
    cdcajacaja: TStringField;
    frxreportecaja: TfrxReport;
    cdsreportecaja: TClientDataSet;
    cdsreportecajaCAJA: TStringField;
    cdsreportecajaEFECTIVOSIS: TFloatField;
    cdsreportecajaTARJETASIS: TFloatField;
    cdsreportecajaTOTALSIS: TFloatField;
    cdsreportecajaDIFERENCIA: TFloatField;
    cdsreportecajaEFECTIVO: TFloatField;
    cdsreportecajaTARJETA: TFloatField;
    cdsreportecajaCHEQUESIS: TFloatField;
    cdsreportecajaTOTAL: TFloatField;
    cdsreportecajaCuentac: TFloatField;
    cdsreportecajagastos: TFloatField;
    cdsreportecajanctb: TFloatField;
    cdsreportecajanca: TFloatField;
    cdsreportecajacantidadnct: TFloatField;
    cdsreportecajacantidadnca: TFloatField;
    cdsreportecajacheque: TFloatField;
    cdsreportecajatarvisa: TStringField;
    cdsreportecajatarmaestro: TStringField;
    cdsreportecajatarmastercard: TStringField;
    cdsreportecajatarnaranja: TStringField;
    cdsreportecajatarelectron: TStringField;
    cdsreportecajatarcabal: TStringField;
    cdsreportecajataramerican: TStringField;
    cdsreportecajatartdf: TStringField;
    cdsreportecajatarotras: TStringField;
    cdsreportecajacomentarios: TStringField;
    cdsreportecajafechadesde: TDateField;
    cdsreportecajafechahasta: TDateField;
    cdsreportecajazeta: TStringField;
    cdsreportecajaimporte: TStringField;
    cdsreportecajatestigo: TStringField;
    cdsreportecajadiferenciazeta: TStringField;
    cdsreportecajaef1: TStringField;
    cdsreportecajaef2: TStringField;
    cdsreportecajaef5: TStringField;
    cdsreportecajaef10: TStringField;
    cdsreportecajaef20: TStringField;
    cdsreportecajaef50: TStringField;
    cdsreportecajaef100: TStringField;
    cdsreportecajaef200: TStringField;
    cdsreportecajaef500: TStringField;
    cdsreportecajaef1000: TStringField;
    //codigo nuevo
    cdsreportecajaef2000: TStringField;
    cdsreportecajaef5000: TStringField;
    //fin codigo
    cdsreportecajaefotras: TStringField;
    cdszetas: TClientDataSet;
    frxDdzetas: TfrxDBDataset;
    cdszetaszeta: TStringField;
    cdszetasimporte: TStringField;
    cdszetastestigo: TStringField;
    cdszetasdiferenciazeta: TStringField;
    cdsiva: TClientDataSet;
    frxiva: TfrxDBDataset;
    frxivareporte: TfrxReport;
    cdsivafecha: TDateField;
    cdsivacomprobante: TStringField;
    cdsivadescripcion: TStringField;
    cdsivacliente: TStringField;
    cdsivacuit: TStringField;
    cdsivanetogravado: TFloatField;
    cdsivatasa: TIntegerField;
    cdsivaimporteiva: TFloatField;
    cdsivanogravado: TFloatField;
    cdsivapercepcionibb: TIntegerField;
    cdsivatotal: TFloatField;
    qsucursales: TIBQuery;
    cdsivafdesde: TDateField;
    cdsivafhasta: TDateField;
    cdsivacuitsucursal: TStringField;
    cdsivarazonsocial: TStringField;
    cdsivadireccion: TStringField;
    cdsivaiibb: TStringField;
    frxPDFExport1: TfrxPDFExport;
    cdsreportecajatarnativa: TStringField;
    cdsstockcantidad: TIntegerField;
    cdsreportecajapagoscc: TFloatField;
    cdsreportecajaos: TFloatField;
    cdsreportecajaboni: TFloatField;
    cdsreportecajadolarenviado: TFloatField;
    cdsreportecajadolarcambio: TFloatField;
    cdsreportecajaeuroenviado: TFloatField;
    cdsreportecajaeurocambio: TFloatField;
    cdszetasiva: TStringField;
    qnombrecuit: TIBQuery;
    qpromo: TIBQuery;
    tpromo: TIBTransaction;
    qgrupoos: TIBQuery;
    qplanes: TIBQuery;
    cdsgrupos: TClientDataSet;
    cdsgruposCODIGO: TStringField;
    cdsgruposPLAN: TStringField;
    DSGRUPOS: TDataSource;
    qpresentacion: TIBQuery;
    qpresentacionnueva: TIBQuery;
    tranpresentacion: TIBTransaction;
    qliquidar: TIBQuery;
    tranliquidacion: TIBTransaction;
    DPRINCIPALGENTILEZA: TFloatField;
    CDSetiquetasimp_descuento: TFloatField;
    qdecla: TIBQuery;
    cdsdecla: TClientDataSet;
    cdsdeclarineto21: TFloatField;
    cdsdeclariiva21: TFloatField;
    cdsdeclaconeto21: TFloatField;
    cdsdeclacoiva21: TFloatField;
    cdsdeclarineto0: TFloatField;
    cdsdeclaconeto0: TFloatField;
    cdsdeclafecha: TDateTimeField;
    cdsdeclarazon: TStringField;
    cdsdeclacuit: TStringField;
    frxReportdecla: TfrxReport;
    frxdecla: TfrxDBDataset;
    cdsdeclaritotal21: TFloatField;
    cdsdeclaritotal0: TFloatField;
    cdsdeclacototal21: TFloatField;
    cdsdeclacototal0: TFloatField;
    QAFILIADO: TIBQuery;
    transafiliado: TIBTransaction;
    DPRINCIPALhosp: TStringField;
    dsecundarioHOSP: TStringField;
    DPRINCIPALPORCENTAJEAPLUS: TFloatField;
    DPRINCIPALDESCUENTOAPLUS: TFloatField;
    DPRINCIPALdescuentototalaplus: TAggregateField;
    cdsreportecajatarqr: TStringField;
    nsucursal: TIBQuery;
    IBTransactionsucu: TIBTransaction;
    qFacturador: TIBQuery;
    DPRINCIPALES_RECARGO: TStringField;
    cdsreportecajagentilezas: TFloatField;
    cdsreportecajaef10000: TStringField;
    frxcaja: TfrxDBDataset;
    cdsreportecajaef20000: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public

    function getConexion():TIBDatabase;
    procedure AbrirConexion();
    function cobertura (codigo: string; alfabeta: string): double ;
    function getPuntoVenta():String;
    function getSucursal(): String;

  end;

var
  dmFacturador: TdmFacturador;
  ptoVenta:String;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmFacturador }

procedure TdmFacturador.AbrirConexion();
var
reg: tregistry;

begin

  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(RegKey,true);
  databasefire.Connected:=false;

  databasefire.DatabaseName:=reg.ReadString('rutabase');
  databasefire.Params.Values['User_Name']:='SYSDBA';
  databasefire.Params.Values['Password']:='nmpnet';
  databasefire.DefaultTransaction:=transactionprod;
  databasefire.Connected:=true;
  qbusqueda.Database:=databasefire;
  datosbusqueda.DataSet:=qbusqueda;
  qbusqueda.Transaction:=transactionprod;

end;

function TdmFacturador.cobertura(codigo, alfabeta: string):Double;
begin

end;





procedure TdmFacturador.DataModuleCreate(Sender: TObject);
VAR
reg: tregistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(RegKey,true);
  databasefire.Connected:=false;

  databasefire.DatabaseName:=reg.ReadString('rutabase');
  databasefire.Params.Values['User_Name']:='SYSDBA';
  databasefire.Params.Values['Password']:='nmpnet';
  databasefire.DefaultTransaction:=transactionprod;
  databasefire.Connected:=true;
end;

function TdmFacturador.getConexion: TIBDatabase;
begin
  getConexion:=databasefire;
end;




function TdmFacturador.getPuntoVenta: String;
VAR
   reg: tregistry;
   ret:String;
begin
 Reg := TRegistry.Create;
 Reg.RootKey := HKEY_CURRENT_USER;
 Reg.OpenKey(regKey,true);
 ret:=REG.ReadString('PV');
 getPuntoVenta:=ret;
end;


function TdmFacturador.getSucursal: String;
VAR
   reg: tregistry;
   ret:String;
begin
 Reg := TRegistry.Create;
 Reg.RootKey := HKEY_CURRENT_USER;
 Reg.OpenKey(regKey,true);
 ret:=REG.ReadString('sucursal');
 getSucursal:=ret;
end;
end.

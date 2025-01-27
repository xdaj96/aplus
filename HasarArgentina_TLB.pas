unit HasarArgentina_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 17/04/2023 09:08:36 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\SysWow64\HasarArgentina1000.ocx (1)
// LIBID: {EA0EA423-EB62-4373-8E76-3AF0ADB03FBC}
// LCID: 0
// Helpfile: 
// HelpString: HasarArgentina
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Enum Member 'ConsumidorFinal' of 'TiposDeResponsabilidadesCliente' changed to 'ConsumidorFinal_'
//   Error creating palette bitmap of (TErrorConstants) : Server C:\Windows\SysWow64\HasarArgentina1000.ocx contains no icons
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleCtrls, Vcl.OleServer, Winapi.ActiveX;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  HasarArgentinaMajorVersion = 10;
  HasarArgentinaMinorVersion = 0;

  LIBID_HasarArgentina: TGUID = '{EA0EA423-EB62-4373-8E76-3AF0ADB03FBC}';

  IID__ErrorConstants: TGUID = '{816CEEFA-8171-4DA8-9B1B-295DBB541F0A}';
  CLASS_ErrorConstants: TGUID = '{6B42F849-7EFF-40CA-8C72-D39736F748F9}';
  IID__ImpresoraFiscalRG3561: TGUID = '{A8FB3BD0-4E7C-47CE-BAE9-9DE98D5DA2D3}';
  DIID___ImpresoraFiscalRG3561: TGUID = '{0F2B8BFB-C6AE-4C25-B01E-2C288408087A}';
  CLASS_ImpresoraFiscalRG3561: TGUID = '{F629C02D-0F32-463C-8389-C7CB4C5AA38C}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum ErroresFiscales
type
  ErroresFiscales = TOleEnum;
const
  FISCAL_OBJECT_ERROR = $80040001;
  SYSTEM_MUTEX_ERROR = $80040002;
  SYSTEM_SEMAPHORE_ERROR = $80040003;
  SYSTEM_RTC_ERROR = $80040004;
  SYSTEM_DRIVER_ERROR = $80040005;
  SYSTEM_ABORTED_PROCESS = $80040006;
  SYSTEM_OUT_OF_MEMORY = $80040007;
  SYSTEM_SERVICE_ERROR = $80040008;
  IO_READ_ERROR = $80040009;
  IO_WRITE_ERROR = $8004000A;
  IO_OPEN_ERROR = $8004000B;
  IO_SEEK_ERROR = $8004000C;
  IO_CLOSE_ERROR = $8004000D;
  IO_EOF_REACHED = $8004000E;
  IO_MOUNT_ERROR = $8004000F;
  IO_COMPRESS_ERROR = $80040010;
  IO_TIMEOUT_ERROR = $80040011;
  IO_FS_ERROR = $80040012;
  IO_PARAM_ERROR = $80040013;
  IO_NOT_OPEN = $80040014;
  IO_DISABLED = $80040015;
  IO_NOT_IMPLEMENTED = $80040016;
  IO_WRITE_ONLY = $80040017;
  IO_READ_ONLY = $80040018;
  IO_ABORTED = $80040019;
  IO_FORMAT_ERROR = $8004001A;
  IO_IOCTL_ERROR = $8004001B;
  IO_OPERATION_ERROR = $8004001C;
  IO_SESSION_ERROR = $8004001D;
  SOCK_ERROR_VERSION = $8004001E;
  SOCK_BIND_ERROR = $8004001F;
  SOCK_SELECT_ERROR = $80040020;
  SOCK_ERROR_CONNECT = $80040021;
  SOCK_ERROR_INIT = $80040022;
  SOCK_ERROR_GENERAL = $80040023;
  SOCK_ERROR_ACCEPT = $80040024;
  SOCK_CONFIGURE_ERROR = $80040025;
  SOCK_CONNECTION_CLOSED = $80040026;
  SOCK_LISTEN_ERROR = $80040027;
  XML_TOKEN_MISMATCH = $80040028;
  XML_EOF = $80040029;
  XML_BAD_ENCODING = $8004002A;
  XML_INVALID_CHAR = $8004002B;
  XML_TAG_UNDERFLOW = $8004002C;
  XML_ATTRIBUTE_OVERFLOW = $8004002D;
  XML_UNEXPECTED_TEXT = $8004002E;
  XML_NO_OPEN_TAG = $8004002F;
  XML_TAG_MISMATCH = $80040030;
  XML_INVALID_IDENTIFIER = $80040031;
  XML_EMPTY = $80040032;
  JSON_EOF = $80040033;
  JSON_SYNTAX_ERROR = $80040034;
  JSON_EMPTY = $80040035;
  CRYPTOGRAPHY_INIT = $80040036;
  CRYPTOGRAPHY_MEMORY_ERROR = $80040037;
  CRYPTOGRAPHY_INVALID_CERTIFICATE = $80040038;
  CRYPTOGRAPHY_INVALID_KEY = $80040039;
  CRYPTOGRAPHY_NOT_SUPPORTED_ALGORITHM = $8004003A;
  CRYPTOGRAPHY_ERROR = $8004003B;
  CRYPTOGRAPHY_SSL_ERROR = $8004003C;
  CRYPTOGRAPHY_SIGNATURE_FAIL = $8004003D;
  CRYPTOGRAPHY_CERTIFICATE_DATE = $8004003E;
  CRYPTOGRAPHY_RAND_GENERATOR_ERROR = $8004003F;
  CRYPTOGRAPHY_KEY_TOO_LARGE = $80040040;
  IMAGE_HEADER_ERROR = $80040041;
  IMAGE_FORMAT_ERROR = $80040042;
  IMAGE_READ_ERROR = $80040043;
  POS_CF_ERROR = $80040044;
  POS_NO_MORE_CHANGES = $80040045;
  POS_INVALID_STATE = $80040046;
  POS_BAD_WORKING_MEMORY_RECORD = $80040047;
  POS_NO_WORKING_MEMORY = $80040048;
  POS_BLOCKED = $80040049;
  POS_FISCAL_MEMORY_INIT = $8004004A;
  POS_USER_ERROR = $8004004B;
  POS_INVALID_KEY = $8004004C;
  POS_INVALID_CERTIFICATE = $8004004D;
  POS_SIGNATURE_ERROR = $8004004E;
  POS_NO_MORE_DOCUMENTS = $8004004F;
  POS_REPORT_GENERATION_ERROR = $80040050;
  POS_REPORT_GAP = $80040051;
  POS_DOCUMENT_BEYOND_FISCAL_DAY = $80040052;
  POS_MEMORY_ERROR = $80040053;
  POS_OPEN_DOCUMENT_INVALID_DATE = $80040054;
  POS_PRINTER_ERROR = $80040055;
  POS_FORMAT_ERROR = $80040056;
  POS_HARDWARE_ERROR = $80040057;
  AUDIT_FULL = $80040058;
  AUDIT_MEMORY_ERROR = $80040059;
  AUDIT_XML_WRITE_ERROR = $8004005A;
  AUDIT_BAD_POINTERS = $8004005B;
  AUDIT_BAD_SEQUENCE = $8004005C;
  AUDIT_XML_READ_ERROR = $8004005D;
  AUDIT_XML_OPEN_ERROR = $8004005E;
  AUDIT_FULL_DAY = $8004005F;
  AUDIT_SECONDARY_STORAGE_CHANGED = $80040060;
  AUDIT_BAD_DATA_FORMAT = $80040061;
  AUDIT_EMPTY_FISCAL_DAY_RANGE = $80040062;
  AUDIT_DATE_ERROR = $80040063;
  FISMEM_WRITE_ERROR = $80040064;
  FISMEM_CHANGED = $80040065;
  FISMEM_INITIALIZATION_ERROR = $80040066;
  FISMEM_REVISION_CHANGE = $80040067;
  COMM_TIMEOUT_ERROR = $80040068;
  COMM_PARAM_ERROR = $80040069;
  COMM_INVALID_ANSWER = $8004006A;
  COMM_UNRECOGNIZED_COMMAND = $8004006B;
  COMM_GENERAL_ERROR = $8004006C;
  COMM_ERROR_HOST = $8004006D;
  COMM_MAX_RETRIES = $8004006E;
  COMM_SYNTAX_ERROR = $8004006F;
  COMM_NOTFOUND_ERROR = $80040070;
  COMM_INVALID_DATA_FORMAT = $80040071;
  COMM_COMMAND_ERROR = $80040072;
  COMM_NOT_SUPPORTED = $80040073;
  COMM_UNAUTHORIZED_IP = $80040074;
  CMD_UNRECOGNIZED_COMMAND = $80040075;
  CMD_PARAM_NOT_PRESENT = $80040076;
  CMD_PARAM_SYNTAX_ERROR = $80040077;
  CMD_PARAM_OUT_OF_RANGE = $80040078;
  CMD_PARAM_SEMANTIC_ERROR = $80040079;
  CMD_FIELD_NOT_LOADED = $8004007A;
  CMD_INVALID_STATE = $8004007B;
  CMD_INVALID_OPERATION = $8004007C;
  CMD_EXECUTION_ERROR = $8004007D;
  CMD_BAD_BARCODE_LENGTH = $8004007E;
  CMD_BAD_BARCODE_FORMAT = $8004007F;
  CMD_BAD_BARCODE_TYPE = $80040080;
  CMD_ABORTED_ACTION = $80040081;
  CMD_DATA_NOT_FOUND = $80040082;
  CMD_ELECTRONIC_INVOICING_ERROR = $80040083;
  CMD_ELECTRONIC_INVOICING_COMM_ERROR = $80040084;
  CMD_ELECTRONIC_INVOICING_PRINT_ERROR = $80040085;
  ARITHMETIC_DOCUMENT_LIMIT_OVERFLOW = $80040086;
  ARITHMETIC_END_CONSUMER_LIMIT_OVERFLOW = $80040087;
  ARITHMETIC_RECEIPT_LIMIT_OVERFLOW = $80040088;
  ARITHMETIC_VAT_TABLE_OVERFLOW = $80040089;
  ARITHMETIC_NEGATIVE_TOTAL = $8004008A;
  ARITHMETIC_NEGATIVE_VAT = $8004008B;
  ARITHMETIC_DAILY_LIMIT_OVERFLOW = $8004008C;
  ARITHMETIC_NO_NET_AMOUNT_FOR_TAX = $8004008D;
  ARITHMETIC_INVALID_NET_AMOUNT_FOR_DISCOUNT = $8004008E;
  ARITHMETIC_NO_TOTAL_AMOUNT_FOR_TAX = $8004008F;
  ARITHMETIC_TAX_AMOUNT_GREATER_THAN_PRICE = $80040090;
  ARITHMETIC_TYPE_OVERFLOW = $80040091;
  ARITHMETIC_NEGATIVE_ADDITIONAL_TAXES = $80040092;
  ARITHMETIC_ZERO_SUBTOTAL = $80040093;
  ARITHMETIC_ZERO_AMOUNT = $80040094;
  ARITHMETIC_NEGATIVE_NET_AMOUNT = $80040095;
  ARITHMETIC_NEGATIVE_ITEM_ACUMULATOR = $80040096;
  ARITHMETIC_TAX_TABLE_OVERFLOW = $80040097;
  DATAFILE_KEY_NOT_FOUND = $80040098;
  DATAFILE_RECORD_NOT_FOUND = $80040099;
  DATAFILE_DELETE_ERROR = $8004009A;
  DATAFILE_INDEX = $8004009B;
  DATAFILE_SORT = $8004009C;
  DATAFILE_KEY_ALREADY_EXISTS = $8004009D;
  DATAFILE_FIELD_NOT_FOUND = $8004009E;
  DATAFILE_FIELD_TYPE_ERROR = $8004009F;
  DATAFILE_INVALID_RECORD = $800400A0;
  DATAFILE_INVALID = $800400A1;
  DATAFILE_VERSION_ERROR = $800400A2;
  PROTOCOL_NO_TRANSPORT = $800400A3;
  PROTOCOL_SIZE = $800400A4;
  PROTOCOL_ABORTED = $800400A5;
  PROTOCOL_COMM_ANOMALY = $800400A6;
  PROTOCOL_WRONG_PROTOCOL = $800400A7;
  PROTOCOL_INVALID_PACKET = $800400A8;
  PROTOCOL_MAX_RETRIES = $800400A9;
  PROTOCOL_COMMAND_REJECTED = $800400AA;
  PROTOCOL_RESOURCE_NOT_FOUND = $800400AB;
  PROTOCOL_PACKET_REJECTED = $800400AC;
  PROTOCOL_SYNTAX_ERROR = $800400AD;
  PROTOCOL_INVALID_ENCODING = $800400AE;
  PROTOCOL_UNKNOWN_COMMAND = $800400AF;
  PROTOCOL_CHECKSUM_MISMATCH = $800400B0;
  PROTOCOL_INVALID_SEQUENCE = $800400B1;
  PROTOCOL_SEQUENCE_MISMATCH = $800400B2;
  PROTOCOL_INVALID_CONTENT_TYPE = $800400B3;
  INTERFACE_COMMAND_REJECTED = $800400B4;
  INTERFACE_UNKNOWN_PROTOCOL = $800400B5;
  INTERFACE_SYNTAX_ERROR = $800400B6;
  INTERFACE_UNRECOGNIZED_COMMAND = $800400B7;
  INTERFACE_UNRECOGNIZED_FIELD = $800400B8;
  INTERFACE_MISSING_FIELD = $800400B9;
  INTERFACE_INVALID_STATE = $800400BA;
  INTERFACE_COMMAND_ABORTED = $800400BB;
  COUPON_PRINTER_INVALID_IMAGE_FILE = $800400BC;
  COUPON_PRINTER_INVALID_IMAGE_SIZE = $800400BD;

// Constants for enum CodigosMatrixDefault
type
  CodigosMatrixDefault = TOleEnum;
const
  ConceptosFinancieros = $00000000;
  DescuentosBonificacionesComerciales = $00000001;
  AjustesImpositivos = $00000002;
  Anticipos = $00000003;

// Constants for enum CondicionesIVA
type
  CondicionesIVA = TOleEnum;
const
  NoGravado = $00000001;
  Exento = $00000002;
  Gravado = $00000007;

// Constants for enum Formularios
type
  Formularios = TOleEnum;
const
  FormularioResumenTotales = $00001F4B;
  FormularioDuplicadosA = $00001F4C;
  FormularioCTD = $00001F4A;
  FormularioReporteInspector = $00001F4E;

// Constants for enum TipoDocReceptor
type
  TipoDocReceptor = TOleEnum;
const
  Cuit = $00000050;
  CUIL = $00000056;
  CDI = $00000057;
  LE = $00000059;
  LC = $0000005A;
  CIExtranjera = $0000005B;
  EnTramite = $0000005C;
  ActaNacimiento = $0000005D;
  Pasaporte = $0000005E;
  CIBsAsRNP = $0000005F;
  DNI = $00000060;
  SinIdentificar = $00000063;
  CertificadoMigracion = $0000001E;
  PadronANSES = $00000058;

// Constants for enum TiposComprobante
type
  TiposComprobante = TOleEnum;
const
  NoDocumento = $00000000;
  FacturaA = $00000001;
  NotaDeDebitoA = $00000002;
  NotaDeCreditoA = $00000003;
  ReciboA = $00000004;
  FacturaB = $00000006;
  NotaDeDebitoB = $00000007;
  NotaDeCreditoB = $00000008;
  ReciboB = $00000009;
  FacturaC = $0000000B;
  NotaDeDebitoC = $0000000C;
  NotaDeCreditoC = $0000000D;
  ReciboC = $0000000F;
  FacturaM = $00000033;
  NotaDeDebitoM = $00000034;
  NotaDeCreditoM = $00000035;
  ReciboM = $00000036;
  InformeDiarioDeCierre = $00000050;
  TiqueFacturaA = $00000051;
  TiqueFacturaB = $00000052;
  Tique = $00000053;
  RemitoR = $0000005B;
  TiqueNotaCredito = $0000006E;
  TiqueFacturaC = $0000006F;
  TiqueNotaCreditoA = $00000070;
  TiqueNotaCreditoB = $00000071;
  TiqueNotaCreditoC = $00000072;
  TiqueNotaDebitoA = $00000073;
  TiqueNotaDebitoB = $00000074;
  TiqueNotaDebitoC = $00000075;
  TiqueFacturaM = $00000076;
  TiqueNotaCreditoM = $00000077;
  TiqueNotaDebitoM = $00000078;
  RemitoX = $00000385;
  ReciboX = $00000386;
  PresupuestoX = $00000387;
  InformeDeAuditoria = $00000388;
  ComprobanteDonacion = $0000038B;
  Generico = $0000038E;
  MensajeCF = $0000039B;
  EstadisticaDeVentaHorariaYPorRubro = $000003A9;
  DetalleDeVentas = $000003AC;
  CambioIVA = $000003B6;
  CambioFechaHora = $000003B7;
  CambioCategorizacionIVA = $000003B8;
  CambioInscripcionIngBrutos = $000003B9;
  PruebaPerifericos = $000003BA;

// Constants for enum TiposHabilitacion
type
  TiposHabilitacion = TOleEnum;
const
  ComprobantesA = $00000001;
  ComprobantesAConLeyenda = $00000002;
  ComprobantesM = $00000003;

// Constants for enum TiposPago
type
  TiposPago = TOleEnum;
const
  Cambio = $00000000;
  CartaDeCreditoDocumentario = $00000001;
  CartaDeCreditoSimple = $00000002;
  Cheque = $00000003;
  ChequeCancelatorios = $00000004;
  CreditoDocumentario = $00000005;
  CuentaCorriente = $00000006;
  Deposito = $00000007;
  Efectivo = $00000008;
  EndosoDeCheque = $00000009;
  FacturaDeCredito = $0000000A;
  GarantiaBancaria = $0000000B;
  Giro = $0000000C;
  LetraDeCambio = $0000000D;
  MedioDePagoDeComercioExterior = $0000000E;
  OrdenDePagoDocumentaria = $0000000F;
  OrdenDePagoSimple = $00000010;
  PagoContraReembolso = $00000011;
  RemesaDocumentaria = $00000012;
  RemesaSimple = $00000013;
  TarjetaDeCredito = $00000014;
  TarjetaDeDebito = $00000015;
  Ticket = $00000016;
  TransferenciaBancaria = $00000017;
  TransferenciaNoBancaria = $00000018;
  OtrosMediosPago = $00000063;

// Constants for enum TiposResponsable
type
  TiposResponsable = TOleEnum;
const
  IVAResponsableInscripto = $00000001;
  IVAResponsableNoInscripto = $00000002;
  IVANoResponsable = $00000003;
  IVASujetoExento = $00000004;
  ConsumidorFinal = $00000005;
  ResponsableMonotributo = $00000006;
  SujetoNoCategorizado = $00000007;
  ProveedorDelExterior = $00000008;
  ClienteDelExterior = $00000009;
  IVALiberadoLey19640 = $0000000A;
  IVAResponsableInscriptoAgentePercepcion = $0000000B;
  PequenoContribuyenteEventual = $0000000C;
  MonotributistaSocial = $0000000D;
  PequenoContribuyenteEventualSocial = $0000000E;

// Constants for enum TiposTributos
type
  TiposTributos = TOleEnum;
const
  SinImpuestos = $00000000;
  ImpuestosNacionales = $00000001;
  ImpuestosProvinciales = $00000002;
  ImpuestosMunicipales = $00000003;
  ImpuestosInternos = $00000004;
  IIBB = $00000005;
  PercepcionIVA = $00000006;
  PercepcionIIBB = $00000007;
  PercepcionImpuestosMunicipales = $00000008;
  OtrasPercepciones = $00000009;
  ImpuestoInternoItem = $0000000A;
  OtrosTributos = $00000063;

// Constants for enum UnidadesMedida
type
  UnidadesMedida = TOleEnum;
const
  SinDescripcion = $00000000;
  Kilo = $00000001;
  Metro = $00000002;
  MetroCuadrado = $00000003;
  MetroCubico = $00000004;
  Litro = $00000005;
  KWH = $00000006;
  Unidad = $00000007;
  Par = $00000008;
  Docena = $00000009;
  Quilate = $0000000A;
  Millar = $0000000B;
  MegaUInterActAntib = $0000000C;
  UnidadInternaActInmung = $0000000D;
  Gramo = $0000000E;
  Milimetro = $0000000F;
  MilimetroCubico = $00000010;
  Kilometro = $00000011;
  Hectolitro = $00000012;
  MegaUnidadIntActInmung = $00000013;
  Centimetro = $00000014;
  KilogramoActivo = $00000015;
  GramoActivo = $00000016;
  GramoBase = $00000017;
  UIACTHOR = $00000018;
  JuegoPaqueteMazoNaipes = $00000019;
  MUIACTHOR = $0000001A;
  CentimetroCubico = $0000001B;
  UIACTANT = $0000001C;
  Tonelada = $0000001D;
  DecametroCubico = $0000001E;
  HectometroCubico = $0000001F;
  KilometroCubico = $00000020;
  Microgramo = $00000021;
  Nanogramo = $00000022;
  Picogramo = $00000023;
  MUIACTANT = $00000024;
  UIACTIG = $00000025;
  Miligramo = $00000029;
  Mililitro = $0000002F;
  Curie = $00000030;
  Milicurie = $00000031;
  Microcurie = $00000032;
  UInterActHormonal = $00000033;
  MegaUInterActHor = $00000034;
  KilogramoBase = $00000035;
  Gruesa = $00000036;
  MUIACTIG = $00000037;
  KilogramoBruto = $0000003D;
  Pack = $0000003E;
  Horma = $0000003F;
  Donacion = $0000005A;
  Ajustes = $0000005B;
  Devolucion = $0000005F;
  Anulacion = $00000060;
  SenasAnticipos = $00000061;
  OtrasUnidades = $00000062;
  Bonificacion = $00000063;

// Constants for enum OperacionesCajero
type
  OperacionesCajero = TOleEnum;
const
  Entrada = $00000045;
  Salida = $00000053;

// Constants for enum Baudios
type
  Baudios = TOleEnum;
const
  Baudrate1200 = $000004B0;
  Baudrate2400 = $00000960;
  Baudrate4800 = $000012C0;
  Baudrate9600 = $00002580;
  Baudrate19200 = $00004B00;
  Baudrate38400 = $00009600;
  Baudrate57600 = $0000E100;
  Baudrate115200 = $0001C200;

// Constants for enum Capacidades
type
  Capacidades = TOleEnum;
const
  SoportaEstacion = $00000045;
  SoportaComprobante = $00000043;
  SoportaCajon = $00000044;
  AnchoTotalImpresion = $00000049;
  AnchoRazonSocial = $00000052;
  AnchoTextoFiscal = $00000054;
  AnchoTextoVenta = $00000056;
  AnchoTextoNoFiscal = $0000004E;
  AnchoTextoLineasUsuario = $00000055;
  AnchoLogo = $0000004C;
  AltoLogo = $0000006C;

// Constants for enum CompresionDeInformacion
type
  CompresionDeInformacion = TOleEnum;
const
  Comprime = $00000050;
  NoComprime = $0000004E;

// Constants for enum Configuracion
type
  Configuracion = TOleEnum;
const
  LimiteBC = $00000042;
  ImpresionCambio = $00000043;
  ImpresionLeyendas = $0000004C;
  CortePapel = $00000050;
  ReimpresionCancelados = $00000052;
  PagoSaldo = $00000053;
  SonidoAviso = $00000041;
  ChequeoDesborde = $00000044;
  BorradoAutomaticoAuditoria = $00000045;
  TipoHabilitacion = $00000048;
  Interlineado = $00000049;
  ImpresionMarco = $00000031;
  AltoHoja = $00000032;
  AnchoHoja = $00000033;
  EstacionReportesXZ = $00000034;
  ModoImpresion = $00000035;
  ImpresionUsarColorAlternativo = $00000036;
  ImpresionColorAlternativo = $00000037;
  TimeoutEnvioRespuestaEnEspera = $00000038;
  ImpresionCodigoQR = $00000039;
  TimeoutModoAhorroEnergia = $00000046;

// Constants for enum EstadosFiscales
type
  EstadosFiscales = TOleEnum;
const
  Desconocido = $00000000;
  NoInicializado = $00000001;
  InicioJornadaFiscal = $00000002;
  EnJornadaFiscal = $00000003;
  VendiendoItems = $00000004;
  ImprimiendoTextoFiscal = $00000005;
  Pagando = $00000006;
  IngresandoOtrosTributos = $00000007;
  RealizandoOperacionAjuste = $00000008;
  RealizandoOperacionGlobalIVA = $00000009;
  RealizandoOperacionAnticipo = $0000000A;
  ImprimiendoLineasRecibo = $0000000B;
  ImprimiendoTextoNoFiscal = $0000000C;
  CintaAuditoriaCasiLlena = $0000000D;
  CintaAuditoriaLlena = $0000000E;
  ControladorFiscalEsperandoBaja = $0000000F;
  ControladorFiscalDadoDeBaja = $00000010;
  ControladorFiscalBloqueado = $00000011;

// Constants for enum IdentificadorBloque
type
  IdentificadorBloque = TOleEnum;
const
  BloqueInformacion = $00000001;
  BloqueFinal = $00000000;

// Constants for enum ImpresionCodigoDeBarras
type
  ImpresionCodigoDeBarras = TOleEnum;
const
  ImprimeCodigo = $00000050;
  ProgramaCodigo = $00000047;

// Constants for enum ImpresionNumeroCodigoDeBarras
type
  ImpresionNumeroCodigoDeBarras = TOleEnum;
const
  ImprimeNumerosCodigo = $0000004E;
  NoImprimeNumerosCodigo = $00000020;

// Constants for enum ImpresionSubtotal
type
  ImpresionSubtotal = TOleEnum;
const
  ImprimeSubtotal = $00000050;
  NoImprimeSubtotal = $0000004E;

// Constants for enum ModosDeDisplay
type
  ModosDeDisplay = TOleEnum;
const
  DisplayNo = $00000030;
  DisplaySi = $00000031;
  DisplayRep = $00000032;

// Constants for enum ModosDeImpuestosInternos
type
  ModosDeImpuestosInternos = TOleEnum;
const
  IIVariableKIVA = $00000030;
  IIVariablePorcentual = $00000025;
  IIFijoKIVA = $0000002B;
  IIFijoMonto = $00000024;

// Constants for enum ModosDeMonto
type
  ModosDeMonto = TOleEnum;
const
  ModoSumaMonto = $0000004D;
  ModoRestaMonto = $0000006D;

// Constants for enum ModosDePago
type
  ModosDePago = TOleEnum;
const
  Pagar = $00000054;
  Anular = $00000052;

// Constants for enum ModosDePrecio
type
  ModosDePrecio = TOleEnum;
const
  ModoPrecioBase = $00000042;
  ModoPrecioTotal = $00000054;

// Constants for enum OperacionesCargaLogoUsuario
type
  OperacionesCargaLogoUsuario = TOleEnum;
const
  ComienzoCargaLogo = $00000049;
  CargaLogoEnCurso = $00000043;
  FinCargaLogo = $00000046;

// Constants for enum SiNo
type
  SiNo = TOleEnum;
const
  Si = $00000053;
  No = $0000004E;

// Constants for enum TipoReporte
type
  TipoReporte = TOleEnum;
const
  ReporteX = $00000058;
  ReporteZ = $0000005A;

// Constants for enum TipoReporteAuditoria
type
  TipoReporteAuditoria = TOleEnum;
const
  ReporteAuditoriaGlobal = $00000054;
  ReporteAuditoriaDiscriminado = $00000044;

// Constants for enum TipoReporteZ
type
  TipoReporteZ = TOleEnum;
const
  ReporteZFecha = $00000046;
  ReporteZNumero = $0000005A;

// Constants for enum TiposDeAjustes
type
  TiposDeAjustes = TOleEnum;
const
  AjusteNeg = $00000044;
  AjustePos = $00000052;
  BonificacionGeneral = $00000042;

// Constants for enum TiposDeCodigoDeBarras
type
  TiposDeCodigoDeBarras = TOleEnum;
const
  CodigoDeBorrado = $00000030;
  CodigoTipoEAN13 = $00000031;
  CodigoTipoEAN8 = $00000032;
  CodigoTipoUPCA = $00000033;
  CodigoTipoI2OF5 = $00000034;

// Constants for enum TiposDeDocumentoCliente
type
  TiposDeDocumentoCliente = TOleEnum;
const
  TipoCUIT = $00000043;
  TipoCUIL = $0000004C;
  TipoLE = $00000030;
  TipoLC = $00000031;
  TipoDNI = $00000032;
  TipoPasaporte = $00000033;
  TipoCI = $00000034;
  TipoNinguno = $00000020;

// Constants for enum TiposDeEstacion
type
  TiposDeEstacion = TOleEnum;
const
  EstacionTicket = $00000054;
  EstacionSlip = $00000053;
  EstacionPorDefecto = $00000044;

// Constants for enum TiposDeOperacionesGlobalesIVA
type
  TiposDeOperacionesGlobalesIVA = TOleEnum;
const
  BonificacionIVA = $00000042;
  RecargoIVA = $00000052;
  DevolucionEnvases = $00000045;
  CobroAnticipo = $00000041;
  DescuentoAnticipo = $00000044;

// Constants for enum TiposDeRegistroInforme
type
  TiposDeRegistroInforme = TOleEnum;
const
  RegistroFinal = $00000030;
  RegistroDetalladoDF = $00000031;
  RegistroDetalladoDNFH = $00000032;
  RegistroDetalladoDNFHNoAcum = $00000033;
  RegistroGlobal = $00000034;

// Constants for enum TiposDeResponsabilidadesCliente
type
  TiposDeResponsabilidadesCliente = TOleEnum;
const
  ResponsableInscripto = $00000049;
  ResponsableExento = $00000045;
  NoResponsable = $00000041;
  ConsumidorFinal_ = $00000043;
  NoCategorizado = $00000054;
  Monotributo = $0000004D;
  MonotributoSocial = $00000053;
  Eventual = $00000056;
  EventualSocial = $00000057;

// Constants for enum TiposDeResponsabilidadesImpresor
type
  TiposDeResponsabilidadesImpresor = TOleEnum;
const
  IFResponsableInscripto = $00000049;
  IFResponsableExento = $00000045;
  IFNoResponsable = $00000041;
  IFMonotributo = $0000004D;
  IFMonotributoSocial = $00000053;

// Constants for enum TiposInterlineado
type
  TiposInterlineado = TOleEnum;
const
  InterlineadoNoDefinido = $00000030;
  InterlineadoMinimo = $00000031;
  InterlineadoNormal = $00000032;
  InterlineadoMaximo = $00000033;

// Constants for enum TiposReporteAFIP
type
  TiposReporteAFIP = TOleEnum;
const
  ReporteAFIPCompleto = $00000050;
  ReporteAFIPMemoriaFiscal = $0000004E;

// Constants for enum XMLsPorBajada
type
  XMLsPorBajada = TOleEnum;
const
  XMLUnico = $00000050;
  VariosXMLs = $0000004E;

// Constants for enum ZonasDeLineasDeUsuario
type
  ZonasDeLineasDeUsuario = TOleEnum;
const
  ZonaFantasia = $00000046;
  ZonaDomicilioEmisor = $0000004F;
  Zona1Encabezado = $00000048;
  Zona2Encabezado = $00000068;
  Zona1Cola = $00000054;
  Zona2Cola = $00000074;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _ErrorConstants = interface;
  _ErrorConstantsDisp = dispinterface;
  _ImpresoraFiscalRG3561 = interface;
  _ImpresoraFiscalRG3561Disp = dispinterface;
  __ImpresoraFiscalRG3561 = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ErrorConstants = _ErrorConstants;
  ImpresoraFiscalRG3561 = _ImpresoraFiscalRG3561;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
{$ALIGN 2}
  EstadoFiscal = record
    ErrorMemoriaFiscal: WordBool;
    ErrorMemoriaTrabajo: WordBool;
    ErrorMemoriaAuditoria: WordBool;
    ErrorGeneral: WordBool;
    ErrorParametro: WordBool;
    ErrorEstado: WordBool;
    ErrorAritmetico: WordBool;
    MemoriaFiscalLlena: WordBool;
    MemoriaFiscalCasiLlena: WordBool;
    MemoriaFiscalInicializada: WordBool;
    DocumentoFiscalAbierto: WordBool;
    DocumentoAbierto: WordBool;
    ErrorEjecucion: WordBool;
  end;

  EstadoImpresora = record
    ImpresoraOcupada: WordBool;
    ErrorImpresora: WordBool;
    ImpresoraOffLine: WordBool;
    FaltaPapelJournal: WordBool;
    FaltaPapelReceipt: WordBool;
    TapaAbierta: WordBool;
    CajonAbierto: WordBool;
    OrLogico: WordBool;
  end;

  AtributosDeTexto = record
    BorradoTexto: WordBool;
    DobleAncho: WordBool;
    Centrado: WordBool;
    Negrita: WordBool;
  end;

  EstadoAuxiliar = record
    MemoriaAuditoriaLlena: WordBool;
    MemoriaAuditoriaCasiLlena: WordBool;
    DatosClienteAlmacenados: WordBool;
    CodigoBarrasAlmacenado: WordBool;
    ModoEntrenamiento: WordBool;
    UltimoComprobanteFueCancelado: WordBool;
    CajeroActivo: WordBool;
  end;

{$ALIGN 4}
  RespuestaConsultarEstado = record
    EstadoAuxiliar: EstadoAuxiliar;
    EstadoInterno: EstadosFiscales;
    ComprobanteEnCurso: TiposComprobante;
    CodigoComprobante: TiposComprobante;
    NumeroUltimoComprobante: Integer;
    CantidadEmitidos: Integer;
    CantidadCancelados: Integer;
  end;

  RespuestaAbrirDocumento = record
    NumeroComprobante: Integer;
    IndiceAuditoria: Integer;
  end;

  RespuestaImprimirItem = record
    IndiceAuditoria: Integer;
  end;

  RespuestaImprimirDescuentoItem = record
    IndiceAuditoria: Integer;
  end;

  RespuestaImprimirAnticipoBonificacionEnvases = record
    IndiceAuditoria: Integer;
  end;

  RespuestaImprimirAjuste = record
    IndiceAuditoria: Integer;
    CantidadIVAs: Integer;
  end;

  RespuestaConsultarSubtotal = record
    CantidadItems: Double;
    Subtotal: Double;
    MontoIVA: Double;
    MontoPagado: Double;
    MontoOtrosTributos: Double;
    MontoImpInternos: Double;
    MontoBase: Double;
    AjusteRedondeo: Double;
  end;

  RespuestaImprimirPago = record
    Saldo: Double;
  end;

  RespuestaCerrarDocumento = record
    NumeroComprobante: Integer;
    CantidadDePaginas: Integer;
    IndiceAuditoria: Integer;
  end;

  CerrarJornadaFiscalX = record
    Numero: Integer;
    FechaInicio: TDateTime;
    HoraInicio: TDateTime;
    FechaCierre: TDateTime;
    HoraCierre: TDateTime;
    DF_Total: Double;
    DF_TotalIVA: Double;
    DF_TotalTributos: Double;
    DF_CantidadEmitidos: Integer;
    NC_Total: Double;
    NC_TotalIVA: Double;
    NC_TotalTributos: Double;
    NC_CantidadEmitidos: Integer;
    DNFH_CantidadEmitidos: Integer;
  end;

  CerrarJornadaFiscalZ = record
    Numero: Integer;
    Fecha: TDateTime;
    DF_Total: Double;
    DF_TotalGravado: Double;
    DF_TotalNoGravado: Double;
    DF_TotalExento: Double;
    DF_TotalIVA: Double;
    DF_TotalTributos: Double;
    DF_CantidadEmitidos: Integer;
    DF_CantidadCancelados: Integer;
    NC_Total: Double;
    NC_TotalGravado: Double;
    NC_TotalNoGravado: Double;
    NC_TotalExento: Double;
    NC_TotalIVA: Double;
    NC_TotalTributos: Double;
    NC_CantidadEmitidos: Integer;
    NC_CantidadCancelados: Integer;
    DNFH_Total: Double;
    DNFH_CantidadEmitidos: Integer;
  end;

  RespuestaCerrarJornadaFiscal = record
    Reporte: TipoReporte;
    X: CerrarJornadaFiscalX;
    Z: CerrarJornadaFiscalZ;
  end;

  RespuestaConsultarCapacidadZetas = record
    CantidadDeZetasRemanentes: Integer;
    UltimaZeta: Integer;
    UltimaZetaBajada: Integer;
    UltimaZetaBorrable: Integer;
    FechaUltimaBajada: TDateTime;
  end;

  RespuestaConsultarDatosInicializacion = record
    Cuit: WideString;
    RazonSocial: WideString;
    Registro: WideString;
    NumeroPos: Integer;
    FechaInicioActividades: TDateTime;
    IngBrutos: WideString;
    ResponsabilidadIVA: TiposDeResponsabilidadesImpresor;
    FechaInicioActividadesCompleta: TDateTime;
  end;

  RespuestaConsultarDocumentoAsociado = record
    CodigoComprobante: TiposComprobante;
    NumeroPos: Integer;
    NumeroComprobante: Integer;
  end;

  RespuestaConsultarZona = record
    Atributos: AtributosDeTexto;
    Descripcion: WideString;
  end;

  RespuestaConsultarFechaHora = record
    Fecha: TDateTime;
    Hora: TDateTime;
  end;

  RespuestaConsultarVersion = record
    Version: WideString;
    Marca: WideString;
    NombreProducto: WideString;
    VersionMotor: WideString;
    FechaFirmware: WideString;
    VersionProtocolo: Integer;
  end;

  RespuestaConsultarUltimoError = record
    UltimoError: WideString;
    NumeroParametro: Integer;
    Descripcion: WideString;
    Contexto: WideString;
    NombreParametro: WideString;
  end;

  RespuestaPedirReimpresion = record
    NumeroDeCopia: Integer;
  end;

  RespuestaConsultarConfiguracionRed = record
    DireccionIP: WideString;
    Mascara: WideString;
    Gateway: WideString;
    DHCP: SiNo;
  end;

  RespuestaObtenerPrimerBloqueAuditoria = record
    Registro: IdentificadorBloque;
    Informacion: WideString;
  end;

  RespuestaObtenerSiguienteBloqueAuditoria = record
    Registro: IdentificadorBloque;
    Informacion: WideString;
  end;

  RespuestaObtenerPrimerBloqueDocumento = record
    Registro: IdentificadorBloque;
    Informacion: WideString;
  end;

  RespuestaObtenerSiguienteBloqueDocumento = record
    Registro: IdentificadorBloque;
    Informacion: WideString;
  end;

  RespuestaObtenerPrimerBloqueLog = record
    Registro: IdentificadorBloque;
    Informacion: WideString;
  end;

  RespuestaObtenerSiguienteBloqueLog = record
    Registro: IdentificadorBloque;
    Informacion: WideString;
  end;

  RespuestaConsultarConfiguracionServidorCorreo = record
    DireccionIP: WideString;
    Puerto: Integer;
    DireccionRemitente: WideString;
  end;

  RespuestaConsultarZetaBorrable = record
    NumeroZeta: Integer;
  end;

  ConsultarAcumuladosCierreZetaRegDF = record
    CodigoComprobante: TiposComprobante;
    NumeroInicial: Integer;
    NumeroFinal: Integer;
    CantidadCancelados: Integer;
    Total: Double;
    TotalExento: Double;
    TotalNoGravado: Double;
    TotalGravado: Double;
    TotalIVA: Double;
    TotalTributos: Double;
    AlicuotaIVA_1: Double;
    MontoIVA_1: Double;
    AlicuotaIVA_2: Double;
    MontoIVA_2: Double;
    AlicuotaIVA_3: Double;
    MontoIVA_3: Double;
    AlicuotaIVA_4: Double;
    MontoIVA_4: Double;
    AlicuotaIVA_5: Double;
    MontoIVA_5: Double;
    AlicuotaIVA_6: Double;
    MontoIVA_6: Double;
    AlicuotaIVA_7: Double;
    MontoIVA_7: Double;
    AlicuotaIVA_8: Double;
    MontoIVA_8: Double;
    AlicuotaIVA_9: Double;
    MontoIVA_9: Double;
    AlicuotaIVA_10: Double;
    MontoIVA_10: Double;
    CodigoTributo1: TiposTributos;
    ImporteTributo1: Double;
    CodigoTributo2: TiposTributos;
    ImporteTributo2: Double;
    CodigoTributo3: TiposTributos;
    ImporteTributo3: Double;
    CodigoTributo4: TiposTributos;
    ImporteTributo4: Double;
    CodigoTributo5: TiposTributos;
    ImporteTributo5: Double;
    CodigoTributo6: TiposTributos;
    ImporteTributo6: Double;
    CodigoTributo7: TiposTributos;
    ImporteTributo7: Double;
    CodigoTributo8: TiposTributos;
    ImporteTributo8: Double;
    CodigoTributo9: TiposTributos;
    ImporteTributo9: Double;
    CodigoTributo10: TiposTributos;
    ImporteTributo10: Double;
    CodigoTributo11: TiposTributos;
    ImporteTributo11: Double;
  end;

  ConsultarAcumuladosCierreZetaRegDNFH = record
    CodigoComprobante: TiposComprobante;
    NumeroInicial: Integer;
    NumeroFinal: Integer;
    Total: Double;
  end;

  ConsultarAcumuladosCierreZetaRegDNFH_NoAcum = record
    CodigoComprobante: TiposComprobante;
    NumeroInicial: Integer;
    NumeroFinal: Integer;
  end;

  ConsultarAcumuladosCierreZetaRegGlobal = record
    DF_CantidadCancelados: Integer;
    DF_CantidadEmitidos: Integer;
    DF_Total: Double;
    DF_TotalExento: Double;
    DF_TotalNoGravado: Double;
    DF_TotalGravado: Double;
    DF_TotalIVA: Double;
    DF_TotalTributos: Double;
    DNFH_Total: Double;
  end;

  RespuestaConsultarAcumuladosCierreZeta = record
    Registro: TiposDeRegistroInforme;
    RegDF: ConsultarAcumuladosCierreZetaRegDF;
    RegDNFH: ConsultarAcumuladosCierreZetaRegDNFH;
    RegDNFH_NoAcum: ConsultarAcumuladosCierreZetaRegDNFH_NoAcum;
    RegGlobal: ConsultarAcumuladosCierreZetaRegGlobal;
  end;

  ConsultarAcumuladosMemoriaDeTrabajoRegDF = record
    CodigoComprobante: TiposComprobante;
    NumeroInicial: Integer;
    NumeroFinal: Integer;
    CantidadCancelados: Integer;
    Total: Double;
    TotalExento: Double;
    TotalNoGravado: Double;
    TotalGravado: Double;
    TotalIVA: Double;
    TotalTributos: Double;
    AlicuotaIVA_1: Double;
    MontoIVA_1: Double;
    AlicuotaIVA_2: Double;
    MontoIVA_2: Double;
    AlicuotaIVA_3: Double;
    MontoIVA_3: Double;
    AlicuotaIVA_4: Double;
    MontoIVA_4: Double;
    AlicuotaIVA_5: Double;
    MontoIVA_5: Double;
    AlicuotaIVA_6: Double;
    MontoIVA_6: Double;
    AlicuotaIVA_7: Double;
    MontoIVA_7: Double;
    AlicuotaIVA_8: Double;
    MontoIVA_8: Double;
    AlicuotaIVA_9: Double;
    MontoIVA_9: Double;
    AlicuotaIVA_10: Double;
    MontoIVA_10: Double;
    CodigoTributo1: TiposTributos;
    ImporteTributo1: Double;
    CodigoTributo2: TiposTributos;
    ImporteTributo2: Double;
    CodigoTributo3: TiposTributos;
    ImporteTributo3: Double;
    CodigoTributo4: TiposTributos;
    ImporteTributo4: Double;
    CodigoTributo5: TiposTributos;
    ImporteTributo5: Double;
    CodigoTributo6: TiposTributos;
    ImporteTributo6: Double;
    CodigoTributo7: TiposTributos;
    ImporteTributo7: Double;
    CodigoTributo8: TiposTributos;
    ImporteTributo8: Double;
    CodigoTributo9: TiposTributos;
    ImporteTributo9: Double;
    CodigoTributo10: TiposTributos;
    ImporteTributo10: Double;
    CodigoTributo11: TiposTributos;
    ImporteTributo11: Double;
  end;

  ConsultarAcumuladosMemoriaDeTrabajoRegDNFH = record
    CodigoComprobante: TiposComprobante;
    NumeroInicial: Integer;
    NumeroFinal: Integer;
    Total: Double;
  end;

  ConsultarAcumuladosMemoriaDeTrabajoRegDNFH_NoAcum = record
    CodigoComprobante: TiposComprobante;
    NumeroInicial: Integer;
    NumeroFinal: Integer;
  end;

  ConsultarAcumuladosMemoriaDeTrabajoRegGlobal = record
    DF_CantidadCancelados: Integer;
    DF_CantidadEmitidos: Integer;
    DF_Total: Double;
    DF_TotalExento: Double;
    DF_TotalNoGravado: Double;
    DF_TotalGravado: Double;
    DF_TotalIVA: Double;
    DF_TotalTributos: Double;
    DNFH_Total: Double;
  end;

  RespuestaConsultarAcumuladosMemoriaDeTrabajo = record
    Registro: TiposDeRegistroInforme;
    RegDF: ConsultarAcumuladosMemoriaDeTrabajoRegDF;
    RegDNFH: ConsultarAcumuladosMemoriaDeTrabajoRegDNFH;
    RegDNFH_NoAcum: ConsultarAcumuladosMemoriaDeTrabajoRegDNFH_NoAcum;
    RegGlobal: ConsultarAcumuladosMemoriaDeTrabajoRegGlobal;
  end;

  ConsultarAcumuladosComprobanteRegDF = record
    CodigoComprobante: TiposComprobante;
    NumeroInicial: Integer;
    NumeroFinal: Integer;
    CantidadCancelados: Integer;
    Total: Double;
    TotalExento: Double;
    TotalNoGravado: Double;
    TotalGravado: Double;
    TotalIVA: Double;
    TotalTributos: Double;
    AlicuotaIVA_1: Double;
    MontoIVA_1: Double;
    MontoNetoSinIVA_1: Double;
    AlicuotaIVA_2: Double;
    MontoIVA_2: Double;
    MontoNetoSinIVA_2: Double;
    AlicuotaIVA_3: Double;
    MontoIVA_3: Double;
    MontoNetoSinIVA_3: Double;
    AlicuotaIVA_4: Double;
    MontoIVA_4: Double;
    MontoNetoSinIVA_4: Double;
    AlicuotaIVA_5: Double;
    MontoIVA_5: Double;
    MontoNetoSinIVA_5: Double;
    AlicuotaIVA_6: Double;
    MontoIVA_6: Double;
    MontoNetoSinIVA_6: Double;
    AlicuotaIVA_7: Double;
    MontoIVA_7: Double;
    MontoNetoSinIVA_7: Double;
    AlicuotaIVA_8: Double;
    MontoIVA_8: Double;
    MontoNetoSinIVA_8: Double;
    AlicuotaIVA_9: Double;
    MontoIVA_9: Double;
    MontoNetoSinIVA_9: Double;
    AlicuotaIVA_10: Double;
    MontoIVA_10: Double;
    MontoNetoSinIVA_10: Double;
    CodigoTributo1: TiposTributos;
    ImporteTributo1: Double;
    CodigoTributo2: TiposTributos;
    ImporteTributo2: Double;
    CodigoTributo3: TiposTributos;
    ImporteTributo3: Double;
    CodigoTributo4: TiposTributos;
    ImporteTributo4: Double;
    CodigoTributo5: TiposTributos;
    ImporteTributo5: Double;
    CodigoTributo6: TiposTributos;
    ImporteTributo6: Double;
    CodigoTributo7: TiposTributos;
    ImporteTributo7: Double;
    CodigoTributo8: TiposTributos;
    ImporteTributo8: Double;
    CodigoTributo9: TiposTributos;
    ImporteTributo9: Double;
    CodigoTributo10: TiposTributos;
    ImporteTributo10: Double;
    CodigoTributo11: TiposTributos;
    ImporteTributo11: Double;
  end;

  ConsultarAcumuladosComprobanteRegDNFH = record
    CodigoComprobante: TiposComprobante;
    NumeroInicial: Integer;
    NumeroFinal: Integer;
    Total: Double;
  end;

  ConsultarAcumuladosComprobanteRegDNFH_NoAcum = record
    CodigoComprobante: TiposComprobante;
    NumeroInicial: Integer;
    NumeroFinal: Integer;
  end;

  ConsultarAcumuladosComprobanteRegGlobal = record
    DF_CantidadCancelados: Integer;
    DF_CantidadEmitidos: Integer;
    DF_Total: Double;
    DF_TotalExento: Double;
    DF_TotalNoGravado: Double;
    DF_TotalGravado: Double;
    DF_TotalIVA: Double;
    DF_TotalTributos: Double;
    DNFH_Total: Double;
  end;

  RespuestaConsultarAcumuladosComprobante = record
    Registro: TiposDeRegistroInforme;
    RegDF: ConsultarAcumuladosComprobanteRegDF;
    RegDNFH: ConsultarAcumuladosComprobanteRegDNFH;
    RegDNFH_NoAcum: ConsultarAcumuladosComprobanteRegDNFH_NoAcum;
    RegGlobal: ConsultarAcumuladosComprobanteRegGlobal;
  end;

  ContinuarConsultaAcumuladosRegDF = record
    CodigoComprobante: TiposComprobante;
    NumeroInicial: Integer;
    NumeroFinal: Integer;
    CantidadCancelados: Integer;
    Total: Double;
    TotalExento: Double;
    TotalNoGravado: Double;
    TotalGravado: Double;
    TotalIVA: Double;
    TotalTributos: Double;
    AlicuotaIVA_1: Double;
    MontoIVA_1: Double;
    AlicuotaIVA_2: Double;
    MontoIVA_2: Double;
    AlicuotaIVA_3: Double;
    MontoIVA_3: Double;
    AlicuotaIVA_4: Double;
    MontoIVA_4: Double;
    AlicuotaIVA_5: Double;
    MontoIVA_5: Double;
    AlicuotaIVA_6: Double;
    MontoIVA_6: Double;
    AlicuotaIVA_7: Double;
    MontoIVA_7: Double;
    AlicuotaIVA_8: Double;
    MontoIVA_8: Double;
    AlicuotaIVA_9: Double;
    MontoIVA_9: Double;
    AlicuotaIVA_10: Double;
    MontoIVA_10: Double;
    CodigoTributo1: TiposTributos;
    ImporteTributo1: Double;
    CodigoTributo2: TiposTributos;
    ImporteTributo2: Double;
    CodigoTributo3: TiposTributos;
    ImporteTributo3: Double;
    CodigoTributo4: TiposTributos;
    ImporteTributo4: Double;
    CodigoTributo5: TiposTributos;
    ImporteTributo5: Double;
    CodigoTributo6: TiposTributos;
    ImporteTributo6: Double;
    CodigoTributo7: TiposTributos;
    ImporteTributo7: Double;
    CodigoTributo8: TiposTributos;
    ImporteTributo8: Double;
    CodigoTributo9: TiposTributos;
    ImporteTributo9: Double;
    CodigoTributo10: TiposTributos;
    ImporteTributo10: Double;
    CodigoTributo11: TiposTributos;
    ImporteTributo11: Double;
  end;

  ContinuarConsultaAcumuladosRegDNFH = record
    CodigoComprobante: TiposComprobante;
    NumeroInicial: Integer;
    NumeroFinal: Integer;
    Total: Double;
  end;

  ContinuarConsultaAcumuladosRegDNFH_NoAcum = record
    CodigoComprobante: TiposComprobante;
    NumeroInicial: Integer;
    NumeroFinal: Integer;
  end;

  ContinuarConsultaAcumuladosRegGlobal = record
    DF_CantidadCancelados: Integer;
    DF_CantidadEmitidos: Integer;
    DF_Total: Double;
    DF_TotalExento: Double;
    DF_TotalNoGravado: Double;
    DF_TotalGravado: Double;
    DF_TotalIVA: Double;
    DF_TotalTributos: Double;
    DNFH_Total: Double;
  end;

  RespuestaContinuarConsultaAcumulados = record
    Registro: TiposDeRegistroInforme;
    RegDF: ContinuarConsultaAcumuladosRegDF;
    RegDNFH: ContinuarConsultaAcumuladosRegDNFH;
    RegDNFH_NoAcum: ContinuarConsultaAcumuladosRegDNFH_NoAcum;
    RegGlobal: ContinuarConsultaAcumuladosRegGlobal;
  end;

  RespuestaConsultarConfiguracionImpresoraFiscal = record
    Valor: WideString;
  end;

  RespuestaCopiarComprobante = record
    Zeta: Integer;
    Indice: Integer;
  end;

  RespuestaObtenerPrimerBloqueReporteElectronico = record
    Registro: IdentificadorBloque;
    Informacion: WideString;
  end;

  RespuestaObtenerSiguienteBloqueReporteElectronico = record
    Registro: IdentificadorBloque;
    Informacion: WideString;
  end;

  RespuestaConsultarCapacidadesImpresoraFiscal = record
    Valor: WideString;
  end;

  RespuestaObtenerRangoZetasPorFechas = record
    ZetaInicial: Integer;
    ZetaFinal: Integer;
  end;

  RespuestaObtenerRangoFechasPorZetas = record
    FechaInicial: TDateTime;
    FechaFinal: TDateTime;
  end;

  RespuestaConsultarInformacionBloqueo = record
    CodigoBloqueo: WideString;
    Descripcion: WideString;
    Contexto: WideString;
  end;

  RespuestaConsultarEstadoECR = record
    NumeroCajero: Integer;
    NombreCajero: WideString;
  end;

  RespuestaConsultarInformacionAritmetica = record
    Cantidad: Double;
    PrecioUnitarioBase: Double;
    PrecioUnitarioTotal: Double;
    CondicionIVA: CondicionesIVA;
    TasaIVA: Double;
    MontoIVA: Double;
    MontoImpuestosInternos: Double;
    ImpuestosInternosFijos: SiNo;
    MontoBase: Double;
    MontoTotal: Double;
    MontoIVAImpreso: Double;
    MontoImpuestosInternosImpreso: Double;
    MontoBaseImpreso: Double;
    MontoTotalImpreso: Double;
  end;

  RespuestaConsultarUltimaConexion = record
    IdentificadorConexion: WideString;
    Fecha: TDateTime;
    Hora: TDateTime;
  end;

  RespuestaAnularItem = record
    IndiceAuditoria: Integer;
  end;

  RespuestaConsultarCantidadIvasOtrosTributos = record
    CantidadAlicuotasIVA: Integer;
    CantidadOtrosTributos: Integer;
  end;


// *********************************************************************//
// Interface: _ErrorConstants
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {816CEEFA-8171-4DA8-9B1B-295DBB541F0A}
// *********************************************************************//
  _ErrorConstants = interface(IDispatch)
    ['{816CEEFA-8171-4DA8-9B1B-295DBB541F0A}']
  end;

// *********************************************************************//
// DispIntf:  _ErrorConstantsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {816CEEFA-8171-4DA8-9B1B-295DBB541F0A}
// *********************************************************************//
  _ErrorConstantsDisp = dispinterface
    ['{816CEEFA-8171-4DA8-9B1B-295DBB541F0A}']
  end;

// *********************************************************************//
// Interface: _ImpresoraFiscalRG3561
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {A8FB3BD0-4E7C-47CE-BAE9-9DE98D5DA2D3}
// *********************************************************************//
  _ImpresoraFiscalRG3561 = interface(IDispatch)
    ['{A8FB3BD0-4E7C-47CE-BAE9-9DE98D5DA2D3}']
    procedure GhostMethod__ImpresoraFiscalRG3561_28_1; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_32_2; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_36_3; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_40_4; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_44_5; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_48_6; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_52_7; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_56_8; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_60_9; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_64_10; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_68_11; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_72_12; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_76_13; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_80_14; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_84_15; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_88_16; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_92_17; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_96_18; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_100_19; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_104_20; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_108_21; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_112_22; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_116_23; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_120_24; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_124_25; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_128_26; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_132_27; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_136_28; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_140_29; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_144_30; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_148_31; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_152_32; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_156_33; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_160_34; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_164_35; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_168_36; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_172_37; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_176_38; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_180_39; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_184_40; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_188_41; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_192_42; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_196_43; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_200_44; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_204_45; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_208_46; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_212_47; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_216_48; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_220_49; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_224_50; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_228_51; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_232_52; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_236_53; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_240_54; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_244_55; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_248_56; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_252_57; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_256_58; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_260_59; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_264_60; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_268_61; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_272_62; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_276_63; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_280_64; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_284_65; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_288_66; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_292_67; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_296_68; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_300_69; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_304_70; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_308_71; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_312_72; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_316_73; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_320_74; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_324_75; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_328_76; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_332_77; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_336_78; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_340_79; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_344_80; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_348_81; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_352_82; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_356_83; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_360_84; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_364_85; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_368_86; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_372_87; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_376_88; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_380_89; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_384_90; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_388_91; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_392_92; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_396_93; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_400_94; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_404_95; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_408_96; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_412_97; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_416_98; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_420_99; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_424_100; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_428_101; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_432_102; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_436_103; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_440_104; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_444_105; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_448_106; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_452_107; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_456_108; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_460_109; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_464_110; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_468_111; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_472_112; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_476_113; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_480_114; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_484_115; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_488_116; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_492_117; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_496_118; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_500_119; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_504_120; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_508_121; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_512_122; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_516_123; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_520_124; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_524_125; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_528_126; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_532_127; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_536_128; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_540_129; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_544_130; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_548_131; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_552_132; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_556_133; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_560_134; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_564_135; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_568_136; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_572_137; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_576_138; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_580_139; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_584_140; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_588_141; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_592_142; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_596_143; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_600_144; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_604_145; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_608_146; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_612_147; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_616_148; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_620_149; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_624_150; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_628_151; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_632_152; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_636_153; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_640_154; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_644_155; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_648_156; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_652_157; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_656_158; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_660_159; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_664_160; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_668_161; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_672_162; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_676_163; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_680_164; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_684_165; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_688_166; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_692_167; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_696_168; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_700_169; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_704_170; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_708_171; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_712_172; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_716_173; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_720_174; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_724_175; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_728_176; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_732_177; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_736_178; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_740_179; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_744_180; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_748_181; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_752_182; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_756_183; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_760_184; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_764_185; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_768_186; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_772_187; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_776_188; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_780_189; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_784_190; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_788_191; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_792_192; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_796_193; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_800_194; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_804_195; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_808_196; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_812_197; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_816_198; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_820_199; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_824_200; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_828_201; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_832_202; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_836_203; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_840_204; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_844_205; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_848_206; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_852_207; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_856_208; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_860_209; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_864_210; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_868_211; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_872_212; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_876_213; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_880_214; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_884_215; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_888_216; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_892_217; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_896_218; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_900_219; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_904_220; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_908_221; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_912_222; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_916_223; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_920_224; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_924_225; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_928_226; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_932_227; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_936_228; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_940_229; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_944_230; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_948_231; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_952_232; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_956_233; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_960_234; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_964_235; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_968_236; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_972_237; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_976_238; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_980_239; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_984_240; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_988_241; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_992_242; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_996_243; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1000_244; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1004_245; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1008_246; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1012_247; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1016_248; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1020_249; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1024_250; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1028_251; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1032_252; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1036_253; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1040_254; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1044_255; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1048_256; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1052_257; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1056_258; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1060_259; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1064_260; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1068_261; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1072_262; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1076_263; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1080_264; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1084_265; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1088_266; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1092_267; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1096_268; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1100_269; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1104_270; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1108_271; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1112_272; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1116_273; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1120_274; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1124_275; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1128_276; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1132_277; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1136_278; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1140_279; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1144_280; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1148_281; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1152_282; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1156_283; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1160_284; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1164_285; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1168_286; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1172_287; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1176_288; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1180_289; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1184_290; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1188_291; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1192_292; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1196_293; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1200_294; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1204_295; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1208_296; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1212_297; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1216_298; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1220_299; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1224_300; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1228_301; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1232_302; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1236_303; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1240_304; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1244_305; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1248_306; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1252_307; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1256_308; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1260_309; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1264_310; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1268_311; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1272_312; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1276_313; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1280_314; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1284_315; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1288_316; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1292_317; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1296_318; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1300_319; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1304_320; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1308_321; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1312_322; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1316_323; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1320_324; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1324_325; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1328_326; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1332_327; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1336_328; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1340_329; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1344_330; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1348_331; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1352_332; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1356_333; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1360_334; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1364_335; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1368_336; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1372_337; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1376_338; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1380_339; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1384_340; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1388_341; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1392_342; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1396_343; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1400_344; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1404_345; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1408_346; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1412_347; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1416_348; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1420_349; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1424_350; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1428_351; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1432_352; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1436_353; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1440_354; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1444_355; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1448_356; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1452_357; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1456_358; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1460_359; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1464_360; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1468_361; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1472_362; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1476_363; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1480_364; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1484_365; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1488_366; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1492_367; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1496_368; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1500_369; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1504_370; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1508_371; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1512_372; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1516_373; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1520_374; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1524_375; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1528_376; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1532_377; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1536_378; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1540_379; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1544_380; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1548_381; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1552_382; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1556_383; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1560_384; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1564_385; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1568_386; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1572_387; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1576_388; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1580_389; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1584_390; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1588_391; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1592_392; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1596_393; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1600_394; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1604_395; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1608_396; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1612_397; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1616_398; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1620_399; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1624_400; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1628_401; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1632_402; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1636_403; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1640_404; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1644_405; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1648_406; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1652_407; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1656_408; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1660_409; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1664_410; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1668_411; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1672_412; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1676_413; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1680_414; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1684_415; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1688_416; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1692_417; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1696_418; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1700_419; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1704_420; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1708_421; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1712_422; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1716_423; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1720_424; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1724_425; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1728_426; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1732_427; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1736_428; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1740_429; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1744_430; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1748_431; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1752_432; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1756_433; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1760_434; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1764_435; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1768_436; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1772_437; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1776_438; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1780_439; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1784_440; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1788_441; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1792_442; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1796_443; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1800_444; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1804_445; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1808_446; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1812_447; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1816_448; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1820_449; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1824_450; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1828_451; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1832_452; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1836_453; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1840_454; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1844_455; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1848_456; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1852_457; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1856_458; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1860_459; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1864_460; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1868_461; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1872_462; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1876_463; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1880_464; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1884_465; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1888_466; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1892_467; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1896_468; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1900_469; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1904_470; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1908_471; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1912_472; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1916_473; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1920_474; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1924_475; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1928_476; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1932_477; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1936_478; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1940_479; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1944_480; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1948_481; safecall;
    procedure GhostMethod__ImpresoraFiscalRG3561_1952_482; safecall;
    procedure Abortar; safecall;
    function ObtenerVersionProtocolo: Smallint; safecall;
    function ObtenerRevision: Smallint; safecall;
    function ObtenerUltimoEstadoFiscal: EstadoFiscal; safecall;
    function ObtenerUltimoEstadoImpresora: EstadoImpresora; safecall;
    function ObtenerCampoRespuesta(const NombreCampo: WideString): WideString; safecall;
    procedure Conectar(const Destino: WideString; Puerto: Integer; 
                       TiempoEsperaConexion: OleVariant; TiempoEsperaComandos: OleVariant); safecall;
    procedure ArchivoRegistro(const NombreArchivo: WideString; MaximaLongitud: Integer); safecall;
    function ConsultarEstado(CodigoComprobante: TiposComprobante): RespuestaConsultarEstado; safecall;
    function AbrirDocumento(CodigoComprobante: TiposComprobante): RespuestaAbrirDocumento; safecall;
    procedure ImprimirTextoFiscal(var Atributos: AtributosDeTexto; const Texto: WideString; 
                                  ModoDisplay: ModosDeDisplay); safecall;
    function ImprimirItem(const Descripcion: WideString; Cantidad: Double; PrecioUnitario: Double; 
                          CondicionIVA: CondicionesIVA; AlicuotaIVA: Double; 
                          OperacionMonto: ModosDeMonto; 
                          TipoImpuestoInterno: ModosDeImpuestosInternos; 
                          MagnitudImpuestoInterno: Double; ModoDisplay: ModosDeDisplay; 
                          ModoBaseTotal: ModosDePrecio; UnidadReferencia: Integer; 
                          const CodigoProducto: WideString; const CodigoInterno: WideString; 
                          UnidadMedida: UnidadesMedida): RespuestaImprimirItem; safecall;
    function ImprimirDescuentoItem(const Descripcion: WideString; Monto: Double; 
                                   ModoDisplay: ModosDeDisplay; ModoBaseTotal: ModosDePrecio): RespuestaImprimirDescuentoItem; safecall;
    function ImprimirAnticipoBonificacionEnvases(const Descripcion: WideString; Monto: Double; 
                                                 CondicionIVA: CondicionesIVA; AlicuotaIVA: Double; 
                                                 TipoImpuestoInterno: ModosDeImpuestosInternos; 
                                                 MagnitudImpuestoInterno: Double; 
                                                 ModoDisplay: ModosDeDisplay; 
                                                 ModoBaseTotal: ModosDePrecio; 
                                                 const CodigoProducto: WideString; 
                                                 Operacion: TiposDeOperacionesGlobalesIVA): RespuestaImprimirAnticipoBonificacionEnvases; safecall;
    function ImprimirAjuste(const Descripcion: WideString; Monto: Double; 
                            ModoDisplay: ModosDeDisplay; ModoBaseTotal: ModosDePrecio; 
                            const CodigoProducto: WideString; Operacion: TiposDeAjustes): RespuestaImprimirAjuste; safecall;
    procedure ImprimirOtrosTributos(Codigo: TiposTributos; const Descripcion: WideString; 
                                    BaseImponible: Double; Importe: Double); safecall;
    procedure ImprimirConceptoRecibo(const Descripcion: WideString); safecall;
    function ConsultarSubtotal(Impresion: ImpresionSubtotal; ModoDisplay: ModosDeDisplay): RespuestaConsultarSubtotal; safecall;
    function ImprimirPago(const Descripcion: WideString; Monto: Double; Operacion: ModosDePago; 
                          ModoDisplay: ModosDeDisplay; const DescripcionAdicional: WideString; 
                          CodigoFormaPago: TiposPago; Cuotas: Integer; const Cupones: WideString; 
                          const Referencia: WideString): RespuestaImprimirPago; safecall;
    function CerrarDocumento(Copias: Integer; const DireccionEMail: WideString): RespuestaCerrarDocumento; safecall;
    function CerrarJornadaFiscal(Reporte: TipoReporte): RespuestaCerrarJornadaFiscal; safecall;
    procedure ReportarZetasPorFecha(FechaInicial: TDateTime; FechaFinal: TDateTime; 
                                    Reporte: TipoReporteAuditoria); safecall;
    procedure ReportarZetasPorNumeroZeta(ZetaInicial: Integer; ZetaFinal: Integer; 
                                         Reporte: TipoReporteAuditoria); safecall;
    function ConsultarCapacidadZetas: RespuestaConsultarCapacidadZetas; safecall;
    procedure ImprimirTextoGenerico(var Atributos: AtributosDeTexto; const Texto: WideString; 
                                    ModoDisplay: ModosDeDisplay); safecall;
    procedure ImprimirTextoPruebaPerifericos(var Atributos: AtributosDeTexto; 
                                             const Texto: WideString); safecall;
    function ConsultarDatosInicializacion: RespuestaConsultarDatosInicializacion; safecall;
    procedure CargarLogoEmisor(Operacion: OperacionesCargaLogoUsuario; const Informacion: WideString); safecall;
    procedure EliminarLogoEmisor; safecall;
    procedure CargarDatosCliente(const RazonSocial: WideString; const NumeroDocumento: WideString; 
                                 ResponsabilidadIVA: TiposDeResponsabilidadesCliente; 
                                 TipoDocumento: TiposDeDocumentoCliente; 
                                 const Domicilio: WideString; const DatosAdicionales1: WideString; 
                                 const DatosAdicionales2: WideString; 
                                 const DatosAdicionales3: WideString); safecall;
    procedure CargarDocumentoAsociado(NumeroLinea: Integer; CodigoComprobante: TiposComprobante; 
                                      NumeroPos: Integer; NumeroComprobante: Integer); safecall;
    function ConsultarDocumentoAsociado(NumeroLinea: Integer): RespuestaConsultarDocumentoAsociado; safecall;
    procedure ConfigurarZona(NumeroLinea: Integer; var Atributos: AtributosDeTexto; 
                             const Descripcion: WideString; Estacion: TiposDeEstacion; 
                             IdentificadorZona: ZonasDeLineasDeUsuario); safecall;
    function ConsultarZona(NumeroLinea: Integer; Estacion: TiposDeEstacion; 
                           IdentificadorZona: ZonasDeLineasDeUsuario): RespuestaConsultarZona; safecall;
    procedure CargarCodigoBarras(TipoCodigo: TiposDeCodigoDeBarras; const Numero: WideString; 
                                 ImprimeNumero: ImpresionNumeroCodigoDeBarras; 
                                 Almacena: ImpresionCodigoDeBarras); safecall;
    procedure ConfigurarFechaHora(Fecha: TDateTime; Hora: TDateTime); safecall;
    function ConsultarFechaHora: RespuestaConsultarFechaHora; safecall;
    procedure CambiarCategoriaIVA(ResponsabilidadIVA: TiposDeResponsabilidadesImpresor); safecall;
    procedure CambiarInscripIIBB(const IngBrutos: WideString); safecall;
    procedure CambiarFechaInicioActividades(Fecha: TDateTime); safecall;
    function ConsultarVersion: RespuestaConsultarVersion; safecall;
    function ConsultarUltimoError: RespuestaConsultarUltimoError; safecall;
    procedure Cancelar; safecall;
    function PedirReimpresion: RespuestaPedirReimpresion; safecall;
    procedure AbrirCajonDinero; safecall;
    procedure AvanzarPapelEstacionTique(CantidadDeLineas: Integer); safecall;
    procedure AvanzarPapelEstacionAuditoria(CantidadDeLineas: Integer); safecall;
    procedure AvanzarPapelAmbasEstaciones(CantidadDeLineas: Integer); safecall;
    procedure CambiarVelocidadPuerto(Baudios: Baudios); safecall;
    procedure ConfigurarRed(const DireccionIP: WideString; const Mascara: WideString; 
                            const Gateway: WideString; DHCP: SiNo); safecall;
    function ConsultarConfiguracionRed: RespuestaConsultarConfiguracionRed; safecall;
    function ObtenerPrimerBloqueAuditoria(const ZetaFechaInicial: WideString; 
                                          const ZetaFechaFinal: WideString; 
                                          TipoReporte: TipoReporteZ; 
                                          Zipea: CompresionDeInformacion; XMLUnico: XMLsPorBajada): RespuestaObtenerPrimerBloqueAuditoria; safecall;
    function ObtenerSiguienteBloqueAuditoria: RespuestaObtenerSiguienteBloqueAuditoria; safecall;
    function ObtenerPrimerBloqueDocumento(NumeroInicial: Integer; NumeroFinal: Integer; 
                                          CodigoComprobante: TiposComprobante; 
                                          Zipea: CompresionDeInformacion; XMLUnico: XMLsPorBajada): RespuestaObtenerPrimerBloqueDocumento; safecall;
    function ObtenerSiguienteBloqueDocumento: RespuestaObtenerSiguienteBloqueDocumento; safecall;
    function ObtenerPrimerBloqueLog: RespuestaObtenerPrimerBloqueLog; safecall;
    function ObtenerSiguienteBloqueLog: RespuestaObtenerSiguienteBloqueLog; safecall;
    procedure ConfigurarServidorCorreo(const DireccionIP: WideString; Puerto: Integer; 
                                       const DireccionRemitente: WideString); safecall;
    function ConsultarConfiguracionServidorCorreo: RespuestaConsultarConfiguracionServidorCorreo; safecall;
    procedure EnviarDocumentoCorreo(CodigoComprobante: TiposComprobante; 
                                    NumeroComprobante: Integer; const DireccionEMail: WideString); safecall;
    procedure ConfigurarZetaBorrable(NumeroZeta: Integer); safecall;
    function ConsultarZetaBorrable: RespuestaConsultarZetaBorrable; safecall;
    function ConsultarAcumuladosCierreZeta(TipoReporte: TipoReporteZ; 
                                           const NumeroZetaFecha: WideString; 
                                           CodigoComprobante: TiposComprobante): RespuestaConsultarAcumuladosCierreZeta; safecall;
    function ConsultarAcumuladosMemoriaDeTrabajo(CodigoComprobante: TiposComprobante): RespuestaConsultarAcumuladosMemoriaDeTrabajo; safecall;
    function ConsultarAcumuladosComprobante(CodigoComprobante: TiposComprobante; 
                                            NumeroComprobante: Integer): RespuestaConsultarAcumuladosComprobante; safecall;
    function ContinuarConsultaAcumulados: RespuestaContinuarConsultaAcumulados; safecall;
    procedure CargarBeneficiario(const RazonSocial: WideString; const NumeroDocumento: WideString; 
                                 TipoDocumento: TiposDeDocumentoCliente; const Domicilio: WideString); safecall;
    procedure CargarTransportista(const RazonSocial: WideString; const Cuit: WideString; 
                                  const Domicilio: WideString; const NombreChofer: WideString; 
                                  TipoDocumento: TiposDeDocumentoCliente; 
                                  const NumeroDocumento: WideString; const Dominio1: WideString; 
                                  const Dominio2: WideString); safecall;
    procedure ConfigurarImpresoraFiscal(Variable: Configuracion; const Valor: WideString); safecall;
    function ConsultarConfiguracionImpresoraFiscal(Variable: Configuracion): RespuestaConsultarConfiguracionImpresoraFiscal; safecall;
    function CopiarComprobante(CodigoComprobante: TiposComprobante; NumeroComprobante: Integer; 
                               Imprimir: SiNo): RespuestaCopiarComprobante; safecall;
    function ObtenerPrimerBloqueReporteElectronico(FechaInicial: TDateTime; FechaFinal: TDateTime; 
                                                   TipoReporte: TiposReporteAFIP): RespuestaObtenerPrimerBloqueReporteElectronico; safecall;
    function ObtenerSiguienteBloqueReporteElectronico: RespuestaObtenerSiguienteBloqueReporteElectronico; safecall;
    function ConsultarCapacidadesImpresoraFiscal(Capacidad: Capacidades; Estacion: TiposDeEstacion; 
                                                 CodigoComprobante: TiposComprobante): RespuestaConsultarCapacidadesImpresoraFiscal; safecall;
    function ObtenerRangoZetasPorFechas(FechaInicial: TDateTime; FechaFinal: TDateTime): RespuestaObtenerRangoZetasPorFechas; safecall;
    function ObtenerRangoFechasPorZetas(ZetaInicial: Integer; ZetaFinal: Integer): RespuestaObtenerRangoFechasPorZetas; safecall;
    function ConsultarInformacionBloqueo: RespuestaConsultarInformacionBloqueo; safecall;
    procedure OperacionCajero(NumeroCajero: Integer; const NombreCajero: WideString; 
                              Operacion: OperacionesCajero); safecall;
    function ConsultarEstadoECR: RespuestaConsultarEstadoECR; safecall;
    function ConsultarInformacionAritmetica(IndiceAuditoria: Integer; 
                                            IndiceDiscriminacionIVA: Integer): RespuestaConsultarInformacionAritmetica; safecall;
    function ConsultarUltimaConexion: RespuestaConsultarUltimaConexion; safecall;
    function AnularItem(IndiceAuditoria: Integer): RespuestaAnularItem; safecall;
    function ConsultarCantidadIvasOtrosTributos: RespuestaConsultarCantidadIvasOtrosTributos; safecall;
  end;

// *********************************************************************//
// DispIntf:  _ImpresoraFiscalRG3561Disp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {A8FB3BD0-4E7C-47CE-BAE9-9DE98D5DA2D3}
// *********************************************************************//
  _ImpresoraFiscalRG3561Disp = dispinterface
    ['{A8FB3BD0-4E7C-47CE-BAE9-9DE98D5DA2D3}']
    procedure GhostMethod__ImpresoraFiscalRG3561_28_1; dispid 1610743808;
    procedure GhostMethod__ImpresoraFiscalRG3561_32_2; dispid 1610743809;
    procedure GhostMethod__ImpresoraFiscalRG3561_36_3; dispid 1610743810;
    procedure GhostMethod__ImpresoraFiscalRG3561_40_4; dispid 1610743811;
    procedure GhostMethod__ImpresoraFiscalRG3561_44_5; dispid 1610743812;
    procedure GhostMethod__ImpresoraFiscalRG3561_48_6; dispid 1610743813;
    procedure GhostMethod__ImpresoraFiscalRG3561_52_7; dispid 1610743814;
    procedure GhostMethod__ImpresoraFiscalRG3561_56_8; dispid 1610743815;
    procedure GhostMethod__ImpresoraFiscalRG3561_60_9; dispid 1610743816;
    procedure GhostMethod__ImpresoraFiscalRG3561_64_10; dispid 1610743817;
    procedure GhostMethod__ImpresoraFiscalRG3561_68_11; dispid 1610743818;
    procedure GhostMethod__ImpresoraFiscalRG3561_72_12; dispid 1610743819;
    procedure GhostMethod__ImpresoraFiscalRG3561_76_13; dispid 1610743820;
    procedure GhostMethod__ImpresoraFiscalRG3561_80_14; dispid 1610743821;
    procedure GhostMethod__ImpresoraFiscalRG3561_84_15; dispid 1610743822;
    procedure GhostMethod__ImpresoraFiscalRG3561_88_16; dispid 1610743823;
    procedure GhostMethod__ImpresoraFiscalRG3561_92_17; dispid 1610743824;
    procedure GhostMethod__ImpresoraFiscalRG3561_96_18; dispid 1610743825;
    procedure GhostMethod__ImpresoraFiscalRG3561_100_19; dispid 1610743826;
    procedure GhostMethod__ImpresoraFiscalRG3561_104_20; dispid 1610743827;
    procedure GhostMethod__ImpresoraFiscalRG3561_108_21; dispid 1610743828;
    procedure GhostMethod__ImpresoraFiscalRG3561_112_22; dispid 1610743829;
    procedure GhostMethod__ImpresoraFiscalRG3561_116_23; dispid 1610743830;
    procedure GhostMethod__ImpresoraFiscalRG3561_120_24; dispid 1610743831;
    procedure GhostMethod__ImpresoraFiscalRG3561_124_25; dispid 1610743832;
    procedure GhostMethod__ImpresoraFiscalRG3561_128_26; dispid 1610743833;
    procedure GhostMethod__ImpresoraFiscalRG3561_132_27; dispid 1610743834;
    procedure GhostMethod__ImpresoraFiscalRG3561_136_28; dispid 1610743835;
    procedure GhostMethod__ImpresoraFiscalRG3561_140_29; dispid 1610743836;
    procedure GhostMethod__ImpresoraFiscalRG3561_144_30; dispid 1610743837;
    procedure GhostMethod__ImpresoraFiscalRG3561_148_31; dispid 1610743838;
    procedure GhostMethod__ImpresoraFiscalRG3561_152_32; dispid 1610743839;
    procedure GhostMethod__ImpresoraFiscalRG3561_156_33; dispid 1610743840;
    procedure GhostMethod__ImpresoraFiscalRG3561_160_34; dispid 1610743841;
    procedure GhostMethod__ImpresoraFiscalRG3561_164_35; dispid 1610743842;
    procedure GhostMethod__ImpresoraFiscalRG3561_168_36; dispid 1610743843;
    procedure GhostMethod__ImpresoraFiscalRG3561_172_37; dispid 1610743844;
    procedure GhostMethod__ImpresoraFiscalRG3561_176_38; dispid 1610743845;
    procedure GhostMethod__ImpresoraFiscalRG3561_180_39; dispid 1610743846;
    procedure GhostMethod__ImpresoraFiscalRG3561_184_40; dispid 1610743847;
    procedure GhostMethod__ImpresoraFiscalRG3561_188_41; dispid 1610743848;
    procedure GhostMethod__ImpresoraFiscalRG3561_192_42; dispid 1610743849;
    procedure GhostMethod__ImpresoraFiscalRG3561_196_43; dispid 1610743850;
    procedure GhostMethod__ImpresoraFiscalRG3561_200_44; dispid 1610743851;
    procedure GhostMethod__ImpresoraFiscalRG3561_204_45; dispid 1610743852;
    procedure GhostMethod__ImpresoraFiscalRG3561_208_46; dispid 1610743853;
    procedure GhostMethod__ImpresoraFiscalRG3561_212_47; dispid 1610743854;
    procedure GhostMethod__ImpresoraFiscalRG3561_216_48; dispid 1610743855;
    procedure GhostMethod__ImpresoraFiscalRG3561_220_49; dispid 1610743856;
    procedure GhostMethod__ImpresoraFiscalRG3561_224_50; dispid 1610743857;
    procedure GhostMethod__ImpresoraFiscalRG3561_228_51; dispid 1610743858;
    procedure GhostMethod__ImpresoraFiscalRG3561_232_52; dispid 1610743859;
    procedure GhostMethod__ImpresoraFiscalRG3561_236_53; dispid 1610743860;
    procedure GhostMethod__ImpresoraFiscalRG3561_240_54; dispid 1610743861;
    procedure GhostMethod__ImpresoraFiscalRG3561_244_55; dispid 1610743862;
    procedure GhostMethod__ImpresoraFiscalRG3561_248_56; dispid 1610743863;
    procedure GhostMethod__ImpresoraFiscalRG3561_252_57; dispid 1610743864;
    procedure GhostMethod__ImpresoraFiscalRG3561_256_58; dispid 1610743865;
    procedure GhostMethod__ImpresoraFiscalRG3561_260_59; dispid 1610743866;
    procedure GhostMethod__ImpresoraFiscalRG3561_264_60; dispid 1610743867;
    procedure GhostMethod__ImpresoraFiscalRG3561_268_61; dispid 1610743868;
    procedure GhostMethod__ImpresoraFiscalRG3561_272_62; dispid 1610743869;
    procedure GhostMethod__ImpresoraFiscalRG3561_276_63; dispid 1610743870;
    procedure GhostMethod__ImpresoraFiscalRG3561_280_64; dispid 1610743871;
    procedure GhostMethod__ImpresoraFiscalRG3561_284_65; dispid 1610743872;
    procedure GhostMethod__ImpresoraFiscalRG3561_288_66; dispid 1610743873;
    procedure GhostMethod__ImpresoraFiscalRG3561_292_67; dispid 1610743874;
    procedure GhostMethod__ImpresoraFiscalRG3561_296_68; dispid 1610743875;
    procedure GhostMethod__ImpresoraFiscalRG3561_300_69; dispid 1610743876;
    procedure GhostMethod__ImpresoraFiscalRG3561_304_70; dispid 1610743877;
    procedure GhostMethod__ImpresoraFiscalRG3561_308_71; dispid 1610743878;
    procedure GhostMethod__ImpresoraFiscalRG3561_312_72; dispid 1610743879;
    procedure GhostMethod__ImpresoraFiscalRG3561_316_73; dispid 1610743880;
    procedure GhostMethod__ImpresoraFiscalRG3561_320_74; dispid 1610743881;
    procedure GhostMethod__ImpresoraFiscalRG3561_324_75; dispid 1610743882;
    procedure GhostMethod__ImpresoraFiscalRG3561_328_76; dispid 1610743883;
    procedure GhostMethod__ImpresoraFiscalRG3561_332_77; dispid 1610743884;
    procedure GhostMethod__ImpresoraFiscalRG3561_336_78; dispid 1610743885;
    procedure GhostMethod__ImpresoraFiscalRG3561_340_79; dispid 1610743886;
    procedure GhostMethod__ImpresoraFiscalRG3561_344_80; dispid 1610743887;
    procedure GhostMethod__ImpresoraFiscalRG3561_348_81; dispid 1610743888;
    procedure GhostMethod__ImpresoraFiscalRG3561_352_82; dispid 1610743889;
    procedure GhostMethod__ImpresoraFiscalRG3561_356_83; dispid 1610743890;
    procedure GhostMethod__ImpresoraFiscalRG3561_360_84; dispid 1610743891;
    procedure GhostMethod__ImpresoraFiscalRG3561_364_85; dispid 1610743892;
    procedure GhostMethod__ImpresoraFiscalRG3561_368_86; dispid 1610743893;
    procedure GhostMethod__ImpresoraFiscalRG3561_372_87; dispid 1610743894;
    procedure GhostMethod__ImpresoraFiscalRG3561_376_88; dispid 1610743895;
    procedure GhostMethod__ImpresoraFiscalRG3561_380_89; dispid 1610743896;
    procedure GhostMethod__ImpresoraFiscalRG3561_384_90; dispid 1610743897;
    procedure GhostMethod__ImpresoraFiscalRG3561_388_91; dispid 1610743898;
    procedure GhostMethod__ImpresoraFiscalRG3561_392_92; dispid 1610743899;
    procedure GhostMethod__ImpresoraFiscalRG3561_396_93; dispid 1610743900;
    procedure GhostMethod__ImpresoraFiscalRG3561_400_94; dispid 1610743901;
    procedure GhostMethod__ImpresoraFiscalRG3561_404_95; dispid 1610743902;
    procedure GhostMethod__ImpresoraFiscalRG3561_408_96; dispid 1610743903;
    procedure GhostMethod__ImpresoraFiscalRG3561_412_97; dispid 1610743904;
    procedure GhostMethod__ImpresoraFiscalRG3561_416_98; dispid 1610743905;
    procedure GhostMethod__ImpresoraFiscalRG3561_420_99; dispid 1610743906;
    procedure GhostMethod__ImpresoraFiscalRG3561_424_100; dispid 1610743907;
    procedure GhostMethod__ImpresoraFiscalRG3561_428_101; dispid 1610743908;
    procedure GhostMethod__ImpresoraFiscalRG3561_432_102; dispid 1610743909;
    procedure GhostMethod__ImpresoraFiscalRG3561_436_103; dispid 1610743910;
    procedure GhostMethod__ImpresoraFiscalRG3561_440_104; dispid 1610743911;
    procedure GhostMethod__ImpresoraFiscalRG3561_444_105; dispid 1610743912;
    procedure GhostMethod__ImpresoraFiscalRG3561_448_106; dispid 1610743913;
    procedure GhostMethod__ImpresoraFiscalRG3561_452_107; dispid 1610743914;
    procedure GhostMethod__ImpresoraFiscalRG3561_456_108; dispid 1610743915;
    procedure GhostMethod__ImpresoraFiscalRG3561_460_109; dispid 1610743916;
    procedure GhostMethod__ImpresoraFiscalRG3561_464_110; dispid 1610743917;
    procedure GhostMethod__ImpresoraFiscalRG3561_468_111; dispid 1610743918;
    procedure GhostMethod__ImpresoraFiscalRG3561_472_112; dispid 1610743919;
    procedure GhostMethod__ImpresoraFiscalRG3561_476_113; dispid 1610743920;
    procedure GhostMethod__ImpresoraFiscalRG3561_480_114; dispid 1610743921;
    procedure GhostMethod__ImpresoraFiscalRG3561_484_115; dispid 1610743922;
    procedure GhostMethod__ImpresoraFiscalRG3561_488_116; dispid 1610743923;
    procedure GhostMethod__ImpresoraFiscalRG3561_492_117; dispid 1610743924;
    procedure GhostMethod__ImpresoraFiscalRG3561_496_118; dispid 1610743925;
    procedure GhostMethod__ImpresoraFiscalRG3561_500_119; dispid 1610743926;
    procedure GhostMethod__ImpresoraFiscalRG3561_504_120; dispid 1610743927;
    procedure GhostMethod__ImpresoraFiscalRG3561_508_121; dispid 1610743928;
    procedure GhostMethod__ImpresoraFiscalRG3561_512_122; dispid 1610743929;
    procedure GhostMethod__ImpresoraFiscalRG3561_516_123; dispid 1610743930;
    procedure GhostMethod__ImpresoraFiscalRG3561_520_124; dispid 1610743931;
    procedure GhostMethod__ImpresoraFiscalRG3561_524_125; dispid 1610743932;
    procedure GhostMethod__ImpresoraFiscalRG3561_528_126; dispid 1610743933;
    procedure GhostMethod__ImpresoraFiscalRG3561_532_127; dispid 1610743934;
    procedure GhostMethod__ImpresoraFiscalRG3561_536_128; dispid 1610743935;
    procedure GhostMethod__ImpresoraFiscalRG3561_540_129; dispid 1610743936;
    procedure GhostMethod__ImpresoraFiscalRG3561_544_130; dispid 1610743937;
    procedure GhostMethod__ImpresoraFiscalRG3561_548_131; dispid 1610743938;
    procedure GhostMethod__ImpresoraFiscalRG3561_552_132; dispid 1610743939;
    procedure GhostMethod__ImpresoraFiscalRG3561_556_133; dispid 1610743940;
    procedure GhostMethod__ImpresoraFiscalRG3561_560_134; dispid 1610743941;
    procedure GhostMethod__ImpresoraFiscalRG3561_564_135; dispid 1610743942;
    procedure GhostMethod__ImpresoraFiscalRG3561_568_136; dispid 1610743943;
    procedure GhostMethod__ImpresoraFiscalRG3561_572_137; dispid 1610743944;
    procedure GhostMethod__ImpresoraFiscalRG3561_576_138; dispid 1610743945;
    procedure GhostMethod__ImpresoraFiscalRG3561_580_139; dispid 1610743946;
    procedure GhostMethod__ImpresoraFiscalRG3561_584_140; dispid 1610743947;
    procedure GhostMethod__ImpresoraFiscalRG3561_588_141; dispid 1610743948;
    procedure GhostMethod__ImpresoraFiscalRG3561_592_142; dispid 1610743949;
    procedure GhostMethod__ImpresoraFiscalRG3561_596_143; dispid 1610743950;
    procedure GhostMethod__ImpresoraFiscalRG3561_600_144; dispid 1610743951;
    procedure GhostMethod__ImpresoraFiscalRG3561_604_145; dispid 1610743952;
    procedure GhostMethod__ImpresoraFiscalRG3561_608_146; dispid 1610743953;
    procedure GhostMethod__ImpresoraFiscalRG3561_612_147; dispid 1610743954;
    procedure GhostMethod__ImpresoraFiscalRG3561_616_148; dispid 1610743955;
    procedure GhostMethod__ImpresoraFiscalRG3561_620_149; dispid 1610743956;
    procedure GhostMethod__ImpresoraFiscalRG3561_624_150; dispid 1610743957;
    procedure GhostMethod__ImpresoraFiscalRG3561_628_151; dispid 1610743958;
    procedure GhostMethod__ImpresoraFiscalRG3561_632_152; dispid 1610743959;
    procedure GhostMethod__ImpresoraFiscalRG3561_636_153; dispid 1610743960;
    procedure GhostMethod__ImpresoraFiscalRG3561_640_154; dispid 1610743961;
    procedure GhostMethod__ImpresoraFiscalRG3561_644_155; dispid 1610743962;
    procedure GhostMethod__ImpresoraFiscalRG3561_648_156; dispid 1610743963;
    procedure GhostMethod__ImpresoraFiscalRG3561_652_157; dispid 1610743964;
    procedure GhostMethod__ImpresoraFiscalRG3561_656_158; dispid 1610743965;
    procedure GhostMethod__ImpresoraFiscalRG3561_660_159; dispid 1610743966;
    procedure GhostMethod__ImpresoraFiscalRG3561_664_160; dispid 1610743967;
    procedure GhostMethod__ImpresoraFiscalRG3561_668_161; dispid 1610743968;
    procedure GhostMethod__ImpresoraFiscalRG3561_672_162; dispid 1610743969;
    procedure GhostMethod__ImpresoraFiscalRG3561_676_163; dispid 1610743970;
    procedure GhostMethod__ImpresoraFiscalRG3561_680_164; dispid 1610743971;
    procedure GhostMethod__ImpresoraFiscalRG3561_684_165; dispid 1610743972;
    procedure GhostMethod__ImpresoraFiscalRG3561_688_166; dispid 1610743973;
    procedure GhostMethod__ImpresoraFiscalRG3561_692_167; dispid 1610743974;
    procedure GhostMethod__ImpresoraFiscalRG3561_696_168; dispid 1610743975;
    procedure GhostMethod__ImpresoraFiscalRG3561_700_169; dispid 1610743976;
    procedure GhostMethod__ImpresoraFiscalRG3561_704_170; dispid 1610743977;
    procedure GhostMethod__ImpresoraFiscalRG3561_708_171; dispid 1610743978;
    procedure GhostMethod__ImpresoraFiscalRG3561_712_172; dispid 1610743979;
    procedure GhostMethod__ImpresoraFiscalRG3561_716_173; dispid 1610743980;
    procedure GhostMethod__ImpresoraFiscalRG3561_720_174; dispid 1610743981;
    procedure GhostMethod__ImpresoraFiscalRG3561_724_175; dispid 1610743982;
    procedure GhostMethod__ImpresoraFiscalRG3561_728_176; dispid 1610743983;
    procedure GhostMethod__ImpresoraFiscalRG3561_732_177; dispid 1610743984;
    procedure GhostMethod__ImpresoraFiscalRG3561_736_178; dispid 1610743985;
    procedure GhostMethod__ImpresoraFiscalRG3561_740_179; dispid 1610743986;
    procedure GhostMethod__ImpresoraFiscalRG3561_744_180; dispid 1610743987;
    procedure GhostMethod__ImpresoraFiscalRG3561_748_181; dispid 1610743988;
    procedure GhostMethod__ImpresoraFiscalRG3561_752_182; dispid 1610743989;
    procedure GhostMethod__ImpresoraFiscalRG3561_756_183; dispid 1610743990;
    procedure GhostMethod__ImpresoraFiscalRG3561_760_184; dispid 1610743991;
    procedure GhostMethod__ImpresoraFiscalRG3561_764_185; dispid 1610743992;
    procedure GhostMethod__ImpresoraFiscalRG3561_768_186; dispid 1610743993;
    procedure GhostMethod__ImpresoraFiscalRG3561_772_187; dispid 1610743994;
    procedure GhostMethod__ImpresoraFiscalRG3561_776_188; dispid 1610743995;
    procedure GhostMethod__ImpresoraFiscalRG3561_780_189; dispid 1610743996;
    procedure GhostMethod__ImpresoraFiscalRG3561_784_190; dispid 1610743997;
    procedure GhostMethod__ImpresoraFiscalRG3561_788_191; dispid 1610743998;
    procedure GhostMethod__ImpresoraFiscalRG3561_792_192; dispid 1610743999;
    procedure GhostMethod__ImpresoraFiscalRG3561_796_193; dispid 1610744000;
    procedure GhostMethod__ImpresoraFiscalRG3561_800_194; dispid 1610744001;
    procedure GhostMethod__ImpresoraFiscalRG3561_804_195; dispid 1610744002;
    procedure GhostMethod__ImpresoraFiscalRG3561_808_196; dispid 1610744003;
    procedure GhostMethod__ImpresoraFiscalRG3561_812_197; dispid 1610744004;
    procedure GhostMethod__ImpresoraFiscalRG3561_816_198; dispid 1610744005;
    procedure GhostMethod__ImpresoraFiscalRG3561_820_199; dispid 1610744006;
    procedure GhostMethod__ImpresoraFiscalRG3561_824_200; dispid 1610744007;
    procedure GhostMethod__ImpresoraFiscalRG3561_828_201; dispid 1610744008;
    procedure GhostMethod__ImpresoraFiscalRG3561_832_202; dispid 1610744009;
    procedure GhostMethod__ImpresoraFiscalRG3561_836_203; dispid 1610744010;
    procedure GhostMethod__ImpresoraFiscalRG3561_840_204; dispid 1610744011;
    procedure GhostMethod__ImpresoraFiscalRG3561_844_205; dispid 1610744012;
    procedure GhostMethod__ImpresoraFiscalRG3561_848_206; dispid 1610744013;
    procedure GhostMethod__ImpresoraFiscalRG3561_852_207; dispid 1610744014;
    procedure GhostMethod__ImpresoraFiscalRG3561_856_208; dispid 1610744015;
    procedure GhostMethod__ImpresoraFiscalRG3561_860_209; dispid 1610744016;
    procedure GhostMethod__ImpresoraFiscalRG3561_864_210; dispid 1610744017;
    procedure GhostMethod__ImpresoraFiscalRG3561_868_211; dispid 1610744018;
    procedure GhostMethod__ImpresoraFiscalRG3561_872_212; dispid 1610744019;
    procedure GhostMethod__ImpresoraFiscalRG3561_876_213; dispid 1610744020;
    procedure GhostMethod__ImpresoraFiscalRG3561_880_214; dispid 1610744021;
    procedure GhostMethod__ImpresoraFiscalRG3561_884_215; dispid 1610744022;
    procedure GhostMethod__ImpresoraFiscalRG3561_888_216; dispid 1610744023;
    procedure GhostMethod__ImpresoraFiscalRG3561_892_217; dispid 1610744024;
    procedure GhostMethod__ImpresoraFiscalRG3561_896_218; dispid 1610744025;
    procedure GhostMethod__ImpresoraFiscalRG3561_900_219; dispid 1610744026;
    procedure GhostMethod__ImpresoraFiscalRG3561_904_220; dispid 1610744027;
    procedure GhostMethod__ImpresoraFiscalRG3561_908_221; dispid 1610744028;
    procedure GhostMethod__ImpresoraFiscalRG3561_912_222; dispid 1610744029;
    procedure GhostMethod__ImpresoraFiscalRG3561_916_223; dispid 1610744030;
    procedure GhostMethod__ImpresoraFiscalRG3561_920_224; dispid 1610744031;
    procedure GhostMethod__ImpresoraFiscalRG3561_924_225; dispid 1610744032;
    procedure GhostMethod__ImpresoraFiscalRG3561_928_226; dispid 1610744033;
    procedure GhostMethod__ImpresoraFiscalRG3561_932_227; dispid 1610744034;
    procedure GhostMethod__ImpresoraFiscalRG3561_936_228; dispid 1610744035;
    procedure GhostMethod__ImpresoraFiscalRG3561_940_229; dispid 1610744036;
    procedure GhostMethod__ImpresoraFiscalRG3561_944_230; dispid 1610744037;
    procedure GhostMethod__ImpresoraFiscalRG3561_948_231; dispid 1610744038;
    procedure GhostMethod__ImpresoraFiscalRG3561_952_232; dispid 1610744039;
    procedure GhostMethod__ImpresoraFiscalRG3561_956_233; dispid 1610744040;
    procedure GhostMethod__ImpresoraFiscalRG3561_960_234; dispid 1610744041;
    procedure GhostMethod__ImpresoraFiscalRG3561_964_235; dispid 1610744042;
    procedure GhostMethod__ImpresoraFiscalRG3561_968_236; dispid 1610744043;
    procedure GhostMethod__ImpresoraFiscalRG3561_972_237; dispid 1610744044;
    procedure GhostMethod__ImpresoraFiscalRG3561_976_238; dispid 1610744045;
    procedure GhostMethod__ImpresoraFiscalRG3561_980_239; dispid 1610744046;
    procedure GhostMethod__ImpresoraFiscalRG3561_984_240; dispid 1610744047;
    procedure GhostMethod__ImpresoraFiscalRG3561_988_241; dispid 1610744048;
    procedure GhostMethod__ImpresoraFiscalRG3561_992_242; dispid 1610744049;
    procedure GhostMethod__ImpresoraFiscalRG3561_996_243; dispid 1610744050;
    procedure GhostMethod__ImpresoraFiscalRG3561_1000_244; dispid 1610744051;
    procedure GhostMethod__ImpresoraFiscalRG3561_1004_245; dispid 1610744052;
    procedure GhostMethod__ImpresoraFiscalRG3561_1008_246; dispid 1610744053;
    procedure GhostMethod__ImpresoraFiscalRG3561_1012_247; dispid 1610744054;
    procedure GhostMethod__ImpresoraFiscalRG3561_1016_248; dispid 1610744055;
    procedure GhostMethod__ImpresoraFiscalRG3561_1020_249; dispid 1610744056;
    procedure GhostMethod__ImpresoraFiscalRG3561_1024_250; dispid 1610744057;
    procedure GhostMethod__ImpresoraFiscalRG3561_1028_251; dispid 1610744058;
    procedure GhostMethod__ImpresoraFiscalRG3561_1032_252; dispid 1610744059;
    procedure GhostMethod__ImpresoraFiscalRG3561_1036_253; dispid 1610744060;
    procedure GhostMethod__ImpresoraFiscalRG3561_1040_254; dispid 1610744061;
    procedure GhostMethod__ImpresoraFiscalRG3561_1044_255; dispid 1610744062;
    procedure GhostMethod__ImpresoraFiscalRG3561_1048_256; dispid 1610744063;
    procedure GhostMethod__ImpresoraFiscalRG3561_1052_257; dispid 1610744064;
    procedure GhostMethod__ImpresoraFiscalRG3561_1056_258; dispid 1610744065;
    procedure GhostMethod__ImpresoraFiscalRG3561_1060_259; dispid 1610744066;
    procedure GhostMethod__ImpresoraFiscalRG3561_1064_260; dispid 1610744067;
    procedure GhostMethod__ImpresoraFiscalRG3561_1068_261; dispid 1610744068;
    procedure GhostMethod__ImpresoraFiscalRG3561_1072_262; dispid 1610744069;
    procedure GhostMethod__ImpresoraFiscalRG3561_1076_263; dispid 1610744070;
    procedure GhostMethod__ImpresoraFiscalRG3561_1080_264; dispid 1610744071;
    procedure GhostMethod__ImpresoraFiscalRG3561_1084_265; dispid 1610744072;
    procedure GhostMethod__ImpresoraFiscalRG3561_1088_266; dispid 1610744073;
    procedure GhostMethod__ImpresoraFiscalRG3561_1092_267; dispid 1610744074;
    procedure GhostMethod__ImpresoraFiscalRG3561_1096_268; dispid 1610744075;
    procedure GhostMethod__ImpresoraFiscalRG3561_1100_269; dispid 1610744076;
    procedure GhostMethod__ImpresoraFiscalRG3561_1104_270; dispid 1610744077;
    procedure GhostMethod__ImpresoraFiscalRG3561_1108_271; dispid 1610744078;
    procedure GhostMethod__ImpresoraFiscalRG3561_1112_272; dispid 1610744079;
    procedure GhostMethod__ImpresoraFiscalRG3561_1116_273; dispid 1610744080;
    procedure GhostMethod__ImpresoraFiscalRG3561_1120_274; dispid 1610744081;
    procedure GhostMethod__ImpresoraFiscalRG3561_1124_275; dispid 1610744082;
    procedure GhostMethod__ImpresoraFiscalRG3561_1128_276; dispid 1610744083;
    procedure GhostMethod__ImpresoraFiscalRG3561_1132_277; dispid 1610744084;
    procedure GhostMethod__ImpresoraFiscalRG3561_1136_278; dispid 1610744085;
    procedure GhostMethod__ImpresoraFiscalRG3561_1140_279; dispid 1610744086;
    procedure GhostMethod__ImpresoraFiscalRG3561_1144_280; dispid 1610744087;
    procedure GhostMethod__ImpresoraFiscalRG3561_1148_281; dispid 1610744088;
    procedure GhostMethod__ImpresoraFiscalRG3561_1152_282; dispid 1610744089;
    procedure GhostMethod__ImpresoraFiscalRG3561_1156_283; dispid 1610744090;
    procedure GhostMethod__ImpresoraFiscalRG3561_1160_284; dispid 1610744091;
    procedure GhostMethod__ImpresoraFiscalRG3561_1164_285; dispid 1610744092;
    procedure GhostMethod__ImpresoraFiscalRG3561_1168_286; dispid 1610744093;
    procedure GhostMethod__ImpresoraFiscalRG3561_1172_287; dispid 1610744094;
    procedure GhostMethod__ImpresoraFiscalRG3561_1176_288; dispid 1610744095;
    procedure GhostMethod__ImpresoraFiscalRG3561_1180_289; dispid 1610744096;
    procedure GhostMethod__ImpresoraFiscalRG3561_1184_290; dispid 1610744097;
    procedure GhostMethod__ImpresoraFiscalRG3561_1188_291; dispid 1610744098;
    procedure GhostMethod__ImpresoraFiscalRG3561_1192_292; dispid 1610744099;
    procedure GhostMethod__ImpresoraFiscalRG3561_1196_293; dispid 1610744100;
    procedure GhostMethod__ImpresoraFiscalRG3561_1200_294; dispid 1610744101;
    procedure GhostMethod__ImpresoraFiscalRG3561_1204_295; dispid 1610744102;
    procedure GhostMethod__ImpresoraFiscalRG3561_1208_296; dispid 1610744103;
    procedure GhostMethod__ImpresoraFiscalRG3561_1212_297; dispid 1610744104;
    procedure GhostMethod__ImpresoraFiscalRG3561_1216_298; dispid 1610744105;
    procedure GhostMethod__ImpresoraFiscalRG3561_1220_299; dispid 1610744106;
    procedure GhostMethod__ImpresoraFiscalRG3561_1224_300; dispid 1610744107;
    procedure GhostMethod__ImpresoraFiscalRG3561_1228_301; dispid 1610744108;
    procedure GhostMethod__ImpresoraFiscalRG3561_1232_302; dispid 1610744109;
    procedure GhostMethod__ImpresoraFiscalRG3561_1236_303; dispid 1610744110;
    procedure GhostMethod__ImpresoraFiscalRG3561_1240_304; dispid 1610744111;
    procedure GhostMethod__ImpresoraFiscalRG3561_1244_305; dispid 1610744112;
    procedure GhostMethod__ImpresoraFiscalRG3561_1248_306; dispid 1610744113;
    procedure GhostMethod__ImpresoraFiscalRG3561_1252_307; dispid 1610744114;
    procedure GhostMethod__ImpresoraFiscalRG3561_1256_308; dispid 1610744115;
    procedure GhostMethod__ImpresoraFiscalRG3561_1260_309; dispid 1610744116;
    procedure GhostMethod__ImpresoraFiscalRG3561_1264_310; dispid 1610744117;
    procedure GhostMethod__ImpresoraFiscalRG3561_1268_311; dispid 1610744118;
    procedure GhostMethod__ImpresoraFiscalRG3561_1272_312; dispid 1610744119;
    procedure GhostMethod__ImpresoraFiscalRG3561_1276_313; dispid 1610744120;
    procedure GhostMethod__ImpresoraFiscalRG3561_1280_314; dispid 1610744121;
    procedure GhostMethod__ImpresoraFiscalRG3561_1284_315; dispid 1610744122;
    procedure GhostMethod__ImpresoraFiscalRG3561_1288_316; dispid 1610744123;
    procedure GhostMethod__ImpresoraFiscalRG3561_1292_317; dispid 1610744124;
    procedure GhostMethod__ImpresoraFiscalRG3561_1296_318; dispid 1610744125;
    procedure GhostMethod__ImpresoraFiscalRG3561_1300_319; dispid 1610744126;
    procedure GhostMethod__ImpresoraFiscalRG3561_1304_320; dispid 1610744127;
    procedure GhostMethod__ImpresoraFiscalRG3561_1308_321; dispid 1610744128;
    procedure GhostMethod__ImpresoraFiscalRG3561_1312_322; dispid 1610744129;
    procedure GhostMethod__ImpresoraFiscalRG3561_1316_323; dispid 1610744130;
    procedure GhostMethod__ImpresoraFiscalRG3561_1320_324; dispid 1610744131;
    procedure GhostMethod__ImpresoraFiscalRG3561_1324_325; dispid 1610744132;
    procedure GhostMethod__ImpresoraFiscalRG3561_1328_326; dispid 1610744133;
    procedure GhostMethod__ImpresoraFiscalRG3561_1332_327; dispid 1610744134;
    procedure GhostMethod__ImpresoraFiscalRG3561_1336_328; dispid 1610744135;
    procedure GhostMethod__ImpresoraFiscalRG3561_1340_329; dispid 1610744136;
    procedure GhostMethod__ImpresoraFiscalRG3561_1344_330; dispid 1610744137;
    procedure GhostMethod__ImpresoraFiscalRG3561_1348_331; dispid 1610744138;
    procedure GhostMethod__ImpresoraFiscalRG3561_1352_332; dispid 1610744139;
    procedure GhostMethod__ImpresoraFiscalRG3561_1356_333; dispid 1610744140;
    procedure GhostMethod__ImpresoraFiscalRG3561_1360_334; dispid 1610744141;
    procedure GhostMethod__ImpresoraFiscalRG3561_1364_335; dispid 1610744142;
    procedure GhostMethod__ImpresoraFiscalRG3561_1368_336; dispid 1610744143;
    procedure GhostMethod__ImpresoraFiscalRG3561_1372_337; dispid 1610744144;
    procedure GhostMethod__ImpresoraFiscalRG3561_1376_338; dispid 1610744145;
    procedure GhostMethod__ImpresoraFiscalRG3561_1380_339; dispid 1610744146;
    procedure GhostMethod__ImpresoraFiscalRG3561_1384_340; dispid 1610744147;
    procedure GhostMethod__ImpresoraFiscalRG3561_1388_341; dispid 1610744148;
    procedure GhostMethod__ImpresoraFiscalRG3561_1392_342; dispid 1610744149;
    procedure GhostMethod__ImpresoraFiscalRG3561_1396_343; dispid 1610744150;
    procedure GhostMethod__ImpresoraFiscalRG3561_1400_344; dispid 1610744151;
    procedure GhostMethod__ImpresoraFiscalRG3561_1404_345; dispid 1610744152;
    procedure GhostMethod__ImpresoraFiscalRG3561_1408_346; dispid 1610744153;
    procedure GhostMethod__ImpresoraFiscalRG3561_1412_347; dispid 1610744154;
    procedure GhostMethod__ImpresoraFiscalRG3561_1416_348; dispid 1610744155;
    procedure GhostMethod__ImpresoraFiscalRG3561_1420_349; dispid 1610744156;
    procedure GhostMethod__ImpresoraFiscalRG3561_1424_350; dispid 1610744157;
    procedure GhostMethod__ImpresoraFiscalRG3561_1428_351; dispid 1610744158;
    procedure GhostMethod__ImpresoraFiscalRG3561_1432_352; dispid 1610744159;
    procedure GhostMethod__ImpresoraFiscalRG3561_1436_353; dispid 1610744160;
    procedure GhostMethod__ImpresoraFiscalRG3561_1440_354; dispid 1610744161;
    procedure GhostMethod__ImpresoraFiscalRG3561_1444_355; dispid 1610744162;
    procedure GhostMethod__ImpresoraFiscalRG3561_1448_356; dispid 1610744163;
    procedure GhostMethod__ImpresoraFiscalRG3561_1452_357; dispid 1610744164;
    procedure GhostMethod__ImpresoraFiscalRG3561_1456_358; dispid 1610744165;
    procedure GhostMethod__ImpresoraFiscalRG3561_1460_359; dispid 1610744166;
    procedure GhostMethod__ImpresoraFiscalRG3561_1464_360; dispid 1610744167;
    procedure GhostMethod__ImpresoraFiscalRG3561_1468_361; dispid 1610744168;
    procedure GhostMethod__ImpresoraFiscalRG3561_1472_362; dispid 1610744169;
    procedure GhostMethod__ImpresoraFiscalRG3561_1476_363; dispid 1610744170;
    procedure GhostMethod__ImpresoraFiscalRG3561_1480_364; dispid 1610744171;
    procedure GhostMethod__ImpresoraFiscalRG3561_1484_365; dispid 1610744172;
    procedure GhostMethod__ImpresoraFiscalRG3561_1488_366; dispid 1610744173;
    procedure GhostMethod__ImpresoraFiscalRG3561_1492_367; dispid 1610744174;
    procedure GhostMethod__ImpresoraFiscalRG3561_1496_368; dispid 1610744175;
    procedure GhostMethod__ImpresoraFiscalRG3561_1500_369; dispid 1610744176;
    procedure GhostMethod__ImpresoraFiscalRG3561_1504_370; dispid 1610744177;
    procedure GhostMethod__ImpresoraFiscalRG3561_1508_371; dispid 1610744178;
    procedure GhostMethod__ImpresoraFiscalRG3561_1512_372; dispid 1610744179;
    procedure GhostMethod__ImpresoraFiscalRG3561_1516_373; dispid 1610744180;
    procedure GhostMethod__ImpresoraFiscalRG3561_1520_374; dispid 1610744181;
    procedure GhostMethod__ImpresoraFiscalRG3561_1524_375; dispid 1610744182;
    procedure GhostMethod__ImpresoraFiscalRG3561_1528_376; dispid 1610744183;
    procedure GhostMethod__ImpresoraFiscalRG3561_1532_377; dispid 1610744184;
    procedure GhostMethod__ImpresoraFiscalRG3561_1536_378; dispid 1610744185;
    procedure GhostMethod__ImpresoraFiscalRG3561_1540_379; dispid 1610744186;
    procedure GhostMethod__ImpresoraFiscalRG3561_1544_380; dispid 1610744187;
    procedure GhostMethod__ImpresoraFiscalRG3561_1548_381; dispid 1610744188;
    procedure GhostMethod__ImpresoraFiscalRG3561_1552_382; dispid 1610744189;
    procedure GhostMethod__ImpresoraFiscalRG3561_1556_383; dispid 1610744190;
    procedure GhostMethod__ImpresoraFiscalRG3561_1560_384; dispid 1610744191;
    procedure GhostMethod__ImpresoraFiscalRG3561_1564_385; dispid 1610744192;
    procedure GhostMethod__ImpresoraFiscalRG3561_1568_386; dispid 1610744193;
    procedure GhostMethod__ImpresoraFiscalRG3561_1572_387; dispid 1610744194;
    procedure GhostMethod__ImpresoraFiscalRG3561_1576_388; dispid 1610744195;
    procedure GhostMethod__ImpresoraFiscalRG3561_1580_389; dispid 1610744196;
    procedure GhostMethod__ImpresoraFiscalRG3561_1584_390; dispid 1610744197;
    procedure GhostMethod__ImpresoraFiscalRG3561_1588_391; dispid 1610744198;
    procedure GhostMethod__ImpresoraFiscalRG3561_1592_392; dispid 1610744199;
    procedure GhostMethod__ImpresoraFiscalRG3561_1596_393; dispid 1610744200;
    procedure GhostMethod__ImpresoraFiscalRG3561_1600_394; dispid 1610744201;
    procedure GhostMethod__ImpresoraFiscalRG3561_1604_395; dispid 1610744202;
    procedure GhostMethod__ImpresoraFiscalRG3561_1608_396; dispid 1610744203;
    procedure GhostMethod__ImpresoraFiscalRG3561_1612_397; dispid 1610744204;
    procedure GhostMethod__ImpresoraFiscalRG3561_1616_398; dispid 1610744205;
    procedure GhostMethod__ImpresoraFiscalRG3561_1620_399; dispid 1610744206;
    procedure GhostMethod__ImpresoraFiscalRG3561_1624_400; dispid 1610744207;
    procedure GhostMethod__ImpresoraFiscalRG3561_1628_401; dispid 1610744208;
    procedure GhostMethod__ImpresoraFiscalRG3561_1632_402; dispid 1610744209;
    procedure GhostMethod__ImpresoraFiscalRG3561_1636_403; dispid 1610744210;
    procedure GhostMethod__ImpresoraFiscalRG3561_1640_404; dispid 1610744211;
    procedure GhostMethod__ImpresoraFiscalRG3561_1644_405; dispid 1610744212;
    procedure GhostMethod__ImpresoraFiscalRG3561_1648_406; dispid 1610744213;
    procedure GhostMethod__ImpresoraFiscalRG3561_1652_407; dispid 1610744214;
    procedure GhostMethod__ImpresoraFiscalRG3561_1656_408; dispid 1610744215;
    procedure GhostMethod__ImpresoraFiscalRG3561_1660_409; dispid 1610744216;
    procedure GhostMethod__ImpresoraFiscalRG3561_1664_410; dispid 1610744217;
    procedure GhostMethod__ImpresoraFiscalRG3561_1668_411; dispid 1610744218;
    procedure GhostMethod__ImpresoraFiscalRG3561_1672_412; dispid 1610744219;
    procedure GhostMethod__ImpresoraFiscalRG3561_1676_413; dispid 1610744220;
    procedure GhostMethod__ImpresoraFiscalRG3561_1680_414; dispid 1610744221;
    procedure GhostMethod__ImpresoraFiscalRG3561_1684_415; dispid 1610744222;
    procedure GhostMethod__ImpresoraFiscalRG3561_1688_416; dispid 1610744223;
    procedure GhostMethod__ImpresoraFiscalRG3561_1692_417; dispid 1610744224;
    procedure GhostMethod__ImpresoraFiscalRG3561_1696_418; dispid 1610744225;
    procedure GhostMethod__ImpresoraFiscalRG3561_1700_419; dispid 1610744226;
    procedure GhostMethod__ImpresoraFiscalRG3561_1704_420; dispid 1610744227;
    procedure GhostMethod__ImpresoraFiscalRG3561_1708_421; dispid 1610744228;
    procedure GhostMethod__ImpresoraFiscalRG3561_1712_422; dispid 1610744229;
    procedure GhostMethod__ImpresoraFiscalRG3561_1716_423; dispid 1610744230;
    procedure GhostMethod__ImpresoraFiscalRG3561_1720_424; dispid 1610744231;
    procedure GhostMethod__ImpresoraFiscalRG3561_1724_425; dispid 1610744232;
    procedure GhostMethod__ImpresoraFiscalRG3561_1728_426; dispid 1610744233;
    procedure GhostMethod__ImpresoraFiscalRG3561_1732_427; dispid 1610744234;
    procedure GhostMethod__ImpresoraFiscalRG3561_1736_428; dispid 1610744235;
    procedure GhostMethod__ImpresoraFiscalRG3561_1740_429; dispid 1610744236;
    procedure GhostMethod__ImpresoraFiscalRG3561_1744_430; dispid 1610744237;
    procedure GhostMethod__ImpresoraFiscalRG3561_1748_431; dispid 1610744238;
    procedure GhostMethod__ImpresoraFiscalRG3561_1752_432; dispid 1610744239;
    procedure GhostMethod__ImpresoraFiscalRG3561_1756_433; dispid 1610744240;
    procedure GhostMethod__ImpresoraFiscalRG3561_1760_434; dispid 1610744241;
    procedure GhostMethod__ImpresoraFiscalRG3561_1764_435; dispid 1610744242;
    procedure GhostMethod__ImpresoraFiscalRG3561_1768_436; dispid 1610744243;
    procedure GhostMethod__ImpresoraFiscalRG3561_1772_437; dispid 1610744244;
    procedure GhostMethod__ImpresoraFiscalRG3561_1776_438; dispid 1610744245;
    procedure GhostMethod__ImpresoraFiscalRG3561_1780_439; dispid 1610744246;
    procedure GhostMethod__ImpresoraFiscalRG3561_1784_440; dispid 1610744247;
    procedure GhostMethod__ImpresoraFiscalRG3561_1788_441; dispid 1610744248;
    procedure GhostMethod__ImpresoraFiscalRG3561_1792_442; dispid 1610744249;
    procedure GhostMethod__ImpresoraFiscalRG3561_1796_443; dispid 1610744250;
    procedure GhostMethod__ImpresoraFiscalRG3561_1800_444; dispid 1610744251;
    procedure GhostMethod__ImpresoraFiscalRG3561_1804_445; dispid 1610744252;
    procedure GhostMethod__ImpresoraFiscalRG3561_1808_446; dispid 1610744253;
    procedure GhostMethod__ImpresoraFiscalRG3561_1812_447; dispid 1610744254;
    procedure GhostMethod__ImpresoraFiscalRG3561_1816_448; dispid 1610744255;
    procedure GhostMethod__ImpresoraFiscalRG3561_1820_449; dispid 1610744256;
    procedure GhostMethod__ImpresoraFiscalRG3561_1824_450; dispid 1610744257;
    procedure GhostMethod__ImpresoraFiscalRG3561_1828_451; dispid 1610744258;
    procedure GhostMethod__ImpresoraFiscalRG3561_1832_452; dispid 1610744259;
    procedure GhostMethod__ImpresoraFiscalRG3561_1836_453; dispid 1610744260;
    procedure GhostMethod__ImpresoraFiscalRG3561_1840_454; dispid 1610744261;
    procedure GhostMethod__ImpresoraFiscalRG3561_1844_455; dispid 1610744262;
    procedure GhostMethod__ImpresoraFiscalRG3561_1848_456; dispid 1610744263;
    procedure GhostMethod__ImpresoraFiscalRG3561_1852_457; dispid 1610744264;
    procedure GhostMethod__ImpresoraFiscalRG3561_1856_458; dispid 1610744265;
    procedure GhostMethod__ImpresoraFiscalRG3561_1860_459; dispid 1610744266;
    procedure GhostMethod__ImpresoraFiscalRG3561_1864_460; dispid 1610744267;
    procedure GhostMethod__ImpresoraFiscalRG3561_1868_461; dispid 1610744268;
    procedure GhostMethod__ImpresoraFiscalRG3561_1872_462; dispid 1610744269;
    procedure GhostMethod__ImpresoraFiscalRG3561_1876_463; dispid 1610744270;
    procedure GhostMethod__ImpresoraFiscalRG3561_1880_464; dispid 1610744271;
    procedure GhostMethod__ImpresoraFiscalRG3561_1884_465; dispid 1610744272;
    procedure GhostMethod__ImpresoraFiscalRG3561_1888_466; dispid 1610744273;
    procedure GhostMethod__ImpresoraFiscalRG3561_1892_467; dispid 1610744274;
    procedure GhostMethod__ImpresoraFiscalRG3561_1896_468; dispid 1610744275;
    procedure GhostMethod__ImpresoraFiscalRG3561_1900_469; dispid 1610744276;
    procedure GhostMethod__ImpresoraFiscalRG3561_1904_470; dispid 1610744277;
    procedure GhostMethod__ImpresoraFiscalRG3561_1908_471; dispid 1610744278;
    procedure GhostMethod__ImpresoraFiscalRG3561_1912_472; dispid 1610744279;
    procedure GhostMethod__ImpresoraFiscalRG3561_1916_473; dispid 1610744280;
    procedure GhostMethod__ImpresoraFiscalRG3561_1920_474; dispid 1610744281;
    procedure GhostMethod__ImpresoraFiscalRG3561_1924_475; dispid 1610744282;
    procedure GhostMethod__ImpresoraFiscalRG3561_1928_476; dispid 1610744283;
    procedure GhostMethod__ImpresoraFiscalRG3561_1932_477; dispid 1610744284;
    procedure GhostMethod__ImpresoraFiscalRG3561_1936_478; dispid 1610744285;
    procedure GhostMethod__ImpresoraFiscalRG3561_1940_479; dispid 1610744286;
    procedure GhostMethod__ImpresoraFiscalRG3561_1944_480; dispid 1610744287;
    procedure GhostMethod__ImpresoraFiscalRG3561_1948_481; dispid 1610744288;
    procedure GhostMethod__ImpresoraFiscalRG3561_1952_482; dispid 1610744289;
    procedure Abortar; dispid 1610810029;
    function ObtenerVersionProtocolo: Smallint; dispid 1610810030;
    function ObtenerRevision: Smallint; dispid 1610810031;
    function ObtenerUltimoEstadoFiscal: {NOT_OLEAUTO(EstadoFiscal)}OleVariant; dispid 1610810032;
    function ObtenerUltimoEstadoImpresora: {NOT_OLEAUTO(EstadoImpresora)}OleVariant; dispid 1610810033;
    function ObtenerCampoRespuesta(const NombreCampo: WideString): WideString; dispid 1610810034;
    procedure Conectar(const Destino: WideString; Puerto: Integer; 
                       TiempoEsperaConexion: OleVariant; TiempoEsperaComandos: OleVariant); dispid 1610810119;
    procedure ArchivoRegistro(const NombreArchivo: WideString; MaximaLongitud: Integer); dispid 1610810120;
    function ConsultarEstado(CodigoComprobante: TiposComprobante): {NOT_OLEAUTO(RespuestaConsultarEstado)}OleVariant; dispid 1610810124;
    function AbrirDocumento(CodigoComprobante: TiposComprobante): {NOT_OLEAUTO(RespuestaAbrirDocumento)}OleVariant; dispid 1610810125;
    procedure ImprimirTextoFiscal(var Atributos: {NOT_OLEAUTO(AtributosDeTexto)}OleVariant; 
                                  const Texto: WideString; ModoDisplay: ModosDeDisplay); dispid 1610810126;
    function ImprimirItem(const Descripcion: WideString; Cantidad: Double; PrecioUnitario: Double; 
                          CondicionIVA: CondicionesIVA; AlicuotaIVA: Double; 
                          OperacionMonto: ModosDeMonto; 
                          TipoImpuestoInterno: ModosDeImpuestosInternos; 
                          MagnitudImpuestoInterno: Double; ModoDisplay: ModosDeDisplay; 
                          ModoBaseTotal: ModosDePrecio; UnidadReferencia: Integer; 
                          const CodigoProducto: WideString; const CodigoInterno: WideString; 
                          UnidadMedida: UnidadesMedida): {NOT_OLEAUTO(RespuestaImprimirItem)}OleVariant; dispid 1610810127;
    function ImprimirDescuentoItem(const Descripcion: WideString; Monto: Double; 
                                   ModoDisplay: ModosDeDisplay; ModoBaseTotal: ModosDePrecio): {NOT_OLEAUTO(RespuestaImprimirDescuentoItem)}OleVariant; dispid 1610810128;
    function ImprimirAnticipoBonificacionEnvases(const Descripcion: WideString; Monto: Double; 
                                                 CondicionIVA: CondicionesIVA; AlicuotaIVA: Double; 
                                                 TipoImpuestoInterno: ModosDeImpuestosInternos; 
                                                 MagnitudImpuestoInterno: Double; 
                                                 ModoDisplay: ModosDeDisplay; 
                                                 ModoBaseTotal: ModosDePrecio; 
                                                 const CodigoProducto: WideString; 
                                                 Operacion: TiposDeOperacionesGlobalesIVA): {NOT_OLEAUTO(RespuestaImprimirAnticipoBonificacionEnvases)}OleVariant; dispid 1610810129;
    function ImprimirAjuste(const Descripcion: WideString; Monto: Double; 
                            ModoDisplay: ModosDeDisplay; ModoBaseTotal: ModosDePrecio; 
                            const CodigoProducto: WideString; Operacion: TiposDeAjustes): {NOT_OLEAUTO(RespuestaImprimirAjuste)}OleVariant; dispid 1610810130;
    procedure ImprimirOtrosTributos(Codigo: TiposTributos; const Descripcion: WideString; 
                                    BaseImponible: Double; Importe: Double); dispid 1610810131;
    procedure ImprimirConceptoRecibo(const Descripcion: WideString); dispid 1610810132;
    function ConsultarSubtotal(Impresion: ImpresionSubtotal; ModoDisplay: ModosDeDisplay): {NOT_OLEAUTO(RespuestaConsultarSubtotal)}OleVariant; dispid 1610810133;
    function ImprimirPago(const Descripcion: WideString; Monto: Double; Operacion: ModosDePago; 
                          ModoDisplay: ModosDeDisplay; const DescripcionAdicional: WideString; 
                          CodigoFormaPago: TiposPago; Cuotas: Integer; const Cupones: WideString; 
                          const Referencia: WideString): {NOT_OLEAUTO(RespuestaImprimirPago)}OleVariant; dispid 1610810134;
    function CerrarDocumento(Copias: Integer; const DireccionEMail: WideString): {NOT_OLEAUTO(RespuestaCerrarDocumento)}OleVariant; dispid 1610810135;
    function CerrarJornadaFiscal(Reporte: TipoReporte): {NOT_OLEAUTO(RespuestaCerrarJornadaFiscal)}OleVariant; dispid 1610810136;
    procedure ReportarZetasPorFecha(FechaInicial: TDateTime; FechaFinal: TDateTime; 
                                    Reporte: TipoReporteAuditoria); dispid 1610810137;
    procedure ReportarZetasPorNumeroZeta(ZetaInicial: Integer; ZetaFinal: Integer; 
                                         Reporte: TipoReporteAuditoria); dispid 1610810138;
    function ConsultarCapacidadZetas: {NOT_OLEAUTO(RespuestaConsultarCapacidadZetas)}OleVariant; dispid 1610810139;
    procedure ImprimirTextoGenerico(var Atributos: {NOT_OLEAUTO(AtributosDeTexto)}OleVariant; 
                                    const Texto: WideString; ModoDisplay: ModosDeDisplay); dispid 1610810140;
    procedure ImprimirTextoPruebaPerifericos(var Atributos: {NOT_OLEAUTO(AtributosDeTexto)}OleVariant; 
                                             const Texto: WideString); dispid 1610810141;
    function ConsultarDatosInicializacion: {NOT_OLEAUTO(RespuestaConsultarDatosInicializacion)}OleVariant; dispid 1610810142;
    procedure CargarLogoEmisor(Operacion: OperacionesCargaLogoUsuario; const Informacion: WideString); dispid 1610810143;
    procedure EliminarLogoEmisor; dispid 1610810144;
    procedure CargarDatosCliente(const RazonSocial: WideString; const NumeroDocumento: WideString; 
                                 ResponsabilidadIVA: TiposDeResponsabilidadesCliente; 
                                 TipoDocumento: TiposDeDocumentoCliente; 
                                 const Domicilio: WideString; const DatosAdicionales1: WideString; 
                                 const DatosAdicionales2: WideString; 
                                 const DatosAdicionales3: WideString); dispid 1610810145;
    procedure CargarDocumentoAsociado(NumeroLinea: Integer; CodigoComprobante: TiposComprobante; 
                                      NumeroPos: Integer; NumeroComprobante: Integer); dispid 1610810146;
    function ConsultarDocumentoAsociado(NumeroLinea: Integer): {NOT_OLEAUTO(RespuestaConsultarDocumentoAsociado)}OleVariant; dispid 1610810147;
    procedure ConfigurarZona(NumeroLinea: Integer; 
                             var Atributos: {NOT_OLEAUTO(AtributosDeTexto)}OleVariant; 
                             const Descripcion: WideString; Estacion: TiposDeEstacion; 
                             IdentificadorZona: ZonasDeLineasDeUsuario); dispid 1610810148;
    function ConsultarZona(NumeroLinea: Integer; Estacion: TiposDeEstacion; 
                           IdentificadorZona: ZonasDeLineasDeUsuario): {NOT_OLEAUTO(RespuestaConsultarZona)}OleVariant; dispid 1610810149;
    procedure CargarCodigoBarras(TipoCodigo: TiposDeCodigoDeBarras; const Numero: WideString; 
                                 ImprimeNumero: ImpresionNumeroCodigoDeBarras; 
                                 Almacena: ImpresionCodigoDeBarras); dispid 1610810150;
    procedure ConfigurarFechaHora(Fecha: TDateTime; Hora: TDateTime); dispid 1610810151;
    function ConsultarFechaHora: {NOT_OLEAUTO(RespuestaConsultarFechaHora)}OleVariant; dispid 1610810152;
    procedure CambiarCategoriaIVA(ResponsabilidadIVA: TiposDeResponsabilidadesImpresor); dispid 1610810153;
    procedure CambiarInscripIIBB(const IngBrutos: WideString); dispid 1610810154;
    procedure CambiarFechaInicioActividades(Fecha: TDateTime); dispid 1610810155;
    function ConsultarVersion: {NOT_OLEAUTO(RespuestaConsultarVersion)}OleVariant; dispid 1610810156;
    function ConsultarUltimoError: {NOT_OLEAUTO(RespuestaConsultarUltimoError)}OleVariant; dispid 1610810157;
    procedure Cancelar; dispid 1610810158;
    function PedirReimpresion: {NOT_OLEAUTO(RespuestaPedirReimpresion)}OleVariant; dispid 1610810159;
    procedure AbrirCajonDinero; dispid 1610810160;
    procedure AvanzarPapelEstacionTique(CantidadDeLineas: Integer); dispid 1610810161;
    procedure AvanzarPapelEstacionAuditoria(CantidadDeLineas: Integer); dispid 1610810162;
    procedure AvanzarPapelAmbasEstaciones(CantidadDeLineas: Integer); dispid 1610810163;
    procedure CambiarVelocidadPuerto(Baudios: Baudios); dispid 1610810164;
    procedure ConfigurarRed(const DireccionIP: WideString; const Mascara: WideString; 
                            const Gateway: WideString; DHCP: SiNo); dispid 1610810165;
    function ConsultarConfiguracionRed: {NOT_OLEAUTO(RespuestaConsultarConfiguracionRed)}OleVariant; dispid 1610810166;
    function ObtenerPrimerBloqueAuditoria(const ZetaFechaInicial: WideString; 
                                          const ZetaFechaFinal: WideString; 
                                          TipoReporte: TipoReporteZ; 
                                          Zipea: CompresionDeInformacion; XMLUnico: XMLsPorBajada): {NOT_OLEAUTO(RespuestaObtenerPrimerBloqueAuditoria)}OleVariant; dispid 1610810167;
    function ObtenerSiguienteBloqueAuditoria: {NOT_OLEAUTO(RespuestaObtenerSiguienteBloqueAuditoria)}OleVariant; dispid 1610810168;
    function ObtenerPrimerBloqueDocumento(NumeroInicial: Integer; NumeroFinal: Integer; 
                                          CodigoComprobante: TiposComprobante; 
                                          Zipea: CompresionDeInformacion; XMLUnico: XMLsPorBajada): {NOT_OLEAUTO(RespuestaObtenerPrimerBloqueDocumento)}OleVariant; dispid 1610810169;
    function ObtenerSiguienteBloqueDocumento: {NOT_OLEAUTO(RespuestaObtenerSiguienteBloqueDocumento)}OleVariant; dispid 1610810170;
    function ObtenerPrimerBloqueLog: {NOT_OLEAUTO(RespuestaObtenerPrimerBloqueLog)}OleVariant; dispid 1610810171;
    function ObtenerSiguienteBloqueLog: {NOT_OLEAUTO(RespuestaObtenerSiguienteBloqueLog)}OleVariant; dispid 1610810172;
    procedure ConfigurarServidorCorreo(const DireccionIP: WideString; Puerto: Integer; 
                                       const DireccionRemitente: WideString); dispid 1610810173;
    function ConsultarConfiguracionServidorCorreo: {NOT_OLEAUTO(RespuestaConsultarConfiguracionServidorCorreo)}OleVariant; dispid 1610810174;
    procedure EnviarDocumentoCorreo(CodigoComprobante: TiposComprobante; 
                                    NumeroComprobante: Integer; const DireccionEMail: WideString); dispid 1610810175;
    procedure ConfigurarZetaBorrable(NumeroZeta: Integer); dispid 1610810176;
    function ConsultarZetaBorrable: {NOT_OLEAUTO(RespuestaConsultarZetaBorrable)}OleVariant; dispid 1610810177;
    function ConsultarAcumuladosCierreZeta(TipoReporte: TipoReporteZ; 
                                           const NumeroZetaFecha: WideString; 
                                           CodigoComprobante: TiposComprobante): {NOT_OLEAUTO(RespuestaConsultarAcumuladosCierreZeta)}OleVariant; dispid 1610810178;
    function ConsultarAcumuladosMemoriaDeTrabajo(CodigoComprobante: TiposComprobante): {NOT_OLEAUTO(RespuestaConsultarAcumuladosMemoriaDeTrabajo)}OleVariant; dispid 1610810179;
    function ConsultarAcumuladosComprobante(CodigoComprobante: TiposComprobante; 
                                            NumeroComprobante: Integer): {NOT_OLEAUTO(RespuestaConsultarAcumuladosComprobante)}OleVariant; dispid 1610810180;
    function ContinuarConsultaAcumulados: {NOT_OLEAUTO(RespuestaContinuarConsultaAcumulados)}OleVariant; dispid 1610810181;
    procedure CargarBeneficiario(const RazonSocial: WideString; const NumeroDocumento: WideString; 
                                 TipoDocumento: TiposDeDocumentoCliente; const Domicilio: WideString); dispid 1610810182;
    procedure CargarTransportista(const RazonSocial: WideString; const Cuit: WideString; 
                                  const Domicilio: WideString; const NombreChofer: WideString; 
                                  TipoDocumento: TiposDeDocumentoCliente; 
                                  const NumeroDocumento: WideString; const Dominio1: WideString; 
                                  const Dominio2: WideString); dispid 1610810183;
    procedure ConfigurarImpresoraFiscal(Variable: Configuracion; const Valor: WideString); dispid 1610810184;
    function ConsultarConfiguracionImpresoraFiscal(Variable: Configuracion): {NOT_OLEAUTO(RespuestaConsultarConfiguracionImpresoraFiscal)}OleVariant; dispid 1610810185;
    function CopiarComprobante(CodigoComprobante: TiposComprobante; NumeroComprobante: Integer; 
                               Imprimir: SiNo): {NOT_OLEAUTO(RespuestaCopiarComprobante)}OleVariant; dispid 1610810186;
    function ObtenerPrimerBloqueReporteElectronico(FechaInicial: TDateTime; FechaFinal: TDateTime; 
                                                   TipoReporte: TiposReporteAFIP): {NOT_OLEAUTO(RespuestaObtenerPrimerBloqueReporteElectronico)}OleVariant; dispid 1610810187;
    function ObtenerSiguienteBloqueReporteElectronico: {NOT_OLEAUTO(RespuestaObtenerSiguienteBloqueReporteElectronico)}OleVariant; dispid 1610810188;
    function ConsultarCapacidadesImpresoraFiscal(Capacidad: Capacidades; Estacion: TiposDeEstacion; 
                                                 CodigoComprobante: TiposComprobante): {NOT_OLEAUTO(RespuestaConsultarCapacidadesImpresoraFiscal)}OleVariant; dispid 1610810189;
    function ObtenerRangoZetasPorFechas(FechaInicial: TDateTime; FechaFinal: TDateTime): {NOT_OLEAUTO(RespuestaObtenerRangoZetasPorFechas)}OleVariant; dispid 1610810190;
    function ObtenerRangoFechasPorZetas(ZetaInicial: Integer; ZetaFinal: Integer): {NOT_OLEAUTO(RespuestaObtenerRangoFechasPorZetas)}OleVariant; dispid 1610810191;
    function ConsultarInformacionBloqueo: {NOT_OLEAUTO(RespuestaConsultarInformacionBloqueo)}OleVariant; dispid 1610810192;
    procedure OperacionCajero(NumeroCajero: Integer; const NombreCajero: WideString; 
                              Operacion: OperacionesCajero); dispid 1610810193;
    function ConsultarEstadoECR: {NOT_OLEAUTO(RespuestaConsultarEstadoECR)}OleVariant; dispid 1610810194;
    function ConsultarInformacionAritmetica(IndiceAuditoria: Integer; 
                                            IndiceDiscriminacionIVA: Integer): {NOT_OLEAUTO(RespuestaConsultarInformacionAritmetica)}OleVariant; dispid 1610810195;
    function ConsultarUltimaConexion: {NOT_OLEAUTO(RespuestaConsultarUltimaConexion)}OleVariant; dispid 1610810196;
    function AnularItem(IndiceAuditoria: Integer): {NOT_OLEAUTO(RespuestaAnularItem)}OleVariant; dispid 1610810197;
    function ConsultarCantidadIvasOtrosTributos: {NOT_OLEAUTO(RespuestaConsultarCantidadIvasOtrosTributos)}OleVariant; dispid 1610810198;
  end;

// *********************************************************************//
// DispIntf:  __ImpresoraFiscalRG3561
// Flags:     (4240) Hidden NonExtensible Dispatchable
// GUID:      {0F2B8BFB-C6AE-4C25-B01E-2C288408087A}
// *********************************************************************//
  __ImpresoraFiscalRG3561 = dispinterface
    ['{0F2B8BFB-C6AE-4C25-B01E-2C288408087A}']
    procedure EstadoEspera(var EstadoImpresion: {NOT_OLEAUTO(EstadoImpresora)}OleVariant); dispid 1;
    procedure ComandoEnProceso; dispid 2;
    procedure ComandoProcesado; dispid 3;
  end;

// *********************************************************************//
// The Class CoErrorConstants provides a Create and CreateRemote method to          
// create instances of the default interface _ErrorConstants exposed by              
// the CoClass ErrorConstants. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoErrorConstants = class
    class function Create: _ErrorConstants;
    class function CreateRemote(const MachineName: string): _ErrorConstants;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TErrorConstants
// Help String      : 
// Default Interface: _ErrorConstants
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (0)
// *********************************************************************//
  TErrorConstants = class(TOleServer)
  private
    FIntf: _ErrorConstants;
    function GetDefaultInterface: _ErrorConstants;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _ErrorConstants);
    procedure Disconnect; override;
    property DefaultInterface: _ErrorConstants read GetDefaultInterface;
  published
  end;

(* *****************************************************************
 * WARNING: The following control wrapper was generated for a class 
 * for which the CAN_CREATE flag was not detected. This may imply   
 * that the control requires windowless control activation.  Delphi     
 * does not support Windowless Control activation at this time. ****)

// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TImpresoraFiscalRG3561
// Help String      : 
// Default Interface: _ImpresoraFiscalRG3561
// Def. Intf. DISP? : No
// Event   Interface: __ImpresoraFiscalRG3561
// TypeFlags        : (32) Control
// *********************************************************************//
  TImpresoraFiscalRG3561EstadoEspera = procedure(ASender: TObject; var EstadoImpresion: {NOT_OLEAUTO(EstadoImpresora)}OleVariant) of object;

  TImpresoraFiscalRG3561 = class(TOleControl)
  private
    FOnEstadoEspera: TImpresoraFiscalRG3561EstadoEspera;
    FOnComandoEnProceso: TNotifyEvent;
    FOnComandoProcesado: TNotifyEvent;
    FIntf: _ImpresoraFiscalRG3561;
    function  GetControlInterface: _ImpresoraFiscalRG3561;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure Abortar;
    function ObtenerVersionProtocolo: Smallint;
    function ObtenerRevision: Smallint;
    function ObtenerUltimoEstadoFiscal: EstadoFiscal;
    function ObtenerUltimoEstadoImpresora: EstadoImpresora;
    function ObtenerCampoRespuesta(const NombreCampo: WideString): WideString;
    procedure Conectar(const Destino: WideString; Puerto: Integer); overload;
    procedure Conectar(const Destino: WideString; Puerto: Integer; TiempoEsperaConexion: OleVariant); overload;
    procedure Conectar(const Destino: WideString; Puerto: Integer; 
                       TiempoEsperaConexion: OleVariant; TiempoEsperaComandos: OleVariant); overload;
    procedure ArchivoRegistro(const NombreArchivo: WideString; MaximaLongitud: Integer);
    function ConsultarEstado(CodigoComprobante: TiposComprobante): RespuestaConsultarEstado;
    function AbrirDocumento(CodigoComprobante: TiposComprobante): RespuestaAbrirDocumento;
    procedure ImprimirTextoFiscal(var Atributos: AtributosDeTexto; const Texto: WideString; 
                                  ModoDisplay: ModosDeDisplay);
    function ImprimirItem(const Descripcion: WideString; Cantidad: Double; PrecioUnitario: Double; 
                          CondicionIVA: CondicionesIVA; AlicuotaIVA: Double; 
                          OperacionMonto: ModosDeMonto; 
                          TipoImpuestoInterno: ModosDeImpuestosInternos; 
                          MagnitudImpuestoInterno: Double; ModoDisplay: ModosDeDisplay; 
                          ModoBaseTotal: ModosDePrecio; UnidadReferencia: Integer; 
                          const CodigoProducto: WideString; const CodigoInterno: WideString; 
                          UnidadMedida: UnidadesMedida): RespuestaImprimirItem;
    function ImprimirDescuentoItem(const Descripcion: WideString; Monto: Double; 
                                   ModoDisplay: ModosDeDisplay; ModoBaseTotal: ModosDePrecio): RespuestaImprimirDescuentoItem;
    function ImprimirAnticipoBonificacionEnvases(const Descripcion: WideString; Monto: Double; 
                                                 CondicionIVA: CondicionesIVA; AlicuotaIVA: Double; 
                                                 TipoImpuestoInterno: ModosDeImpuestosInternos; 
                                                 MagnitudImpuestoInterno: Double; 
                                                 ModoDisplay: ModosDeDisplay; 
                                                 ModoBaseTotal: ModosDePrecio; 
                                                 const CodigoProducto: WideString; 
                                                 Operacion: TiposDeOperacionesGlobalesIVA): RespuestaImprimirAnticipoBonificacionEnvases;
    function ImprimirAjuste(const Descripcion: WideString; Monto: Double; 
                            ModoDisplay: ModosDeDisplay; ModoBaseTotal: ModosDePrecio; 
                            const CodigoProducto: WideString; Operacion: TiposDeAjustes): RespuestaImprimirAjuste;
    procedure ImprimirOtrosTributos(Codigo: TiposTributos; const Descripcion: WideString; 
                                    BaseImponible: Double; Importe: Double);
    procedure ImprimirConceptoRecibo(const Descripcion: WideString);
    function ConsultarSubtotal(Impresion: ImpresionSubtotal; ModoDisplay: ModosDeDisplay): RespuestaConsultarSubtotal;
    function ImprimirPago(const Descripcion: WideString; Monto: Double; Operacion: ModosDePago; 
                          ModoDisplay: ModosDeDisplay; const DescripcionAdicional: WideString; 
                          CodigoFormaPago: TiposPago; Cuotas: Integer; const Cupones: WideString; 
                          const Referencia: WideString): RespuestaImprimirPago;
    function CerrarDocumento(Copias: Integer; const DireccionEMail: WideString): RespuestaCerrarDocumento;
    function CerrarJornadaFiscal(Reporte: TipoReporte): RespuestaCerrarJornadaFiscal;
    procedure ReportarZetasPorFecha(FechaInicial: TDateTime; FechaFinal: TDateTime; 
                                    Reporte: TipoReporteAuditoria);
    procedure ReportarZetasPorNumeroZeta(ZetaInicial: Integer; ZetaFinal: Integer; 
                                         Reporte: TipoReporteAuditoria);
    function ConsultarCapacidadZetas: RespuestaConsultarCapacidadZetas;
    procedure ImprimirTextoGenerico(var Atributos: AtributosDeTexto; const Texto: WideString; 
                                    ModoDisplay: ModosDeDisplay);
    procedure ImprimirTextoPruebaPerifericos(var Atributos: AtributosDeTexto; 
                                             const Texto: WideString);
    function ConsultarDatosInicializacion: RespuestaConsultarDatosInicializacion;
    procedure CargarLogoEmisor(Operacion: OperacionesCargaLogoUsuario; const Informacion: WideString);
    procedure EliminarLogoEmisor;
    procedure CargarDatosCliente(const RazonSocial: WideString; const NumeroDocumento: WideString; 
                                 ResponsabilidadIVA: TiposDeResponsabilidadesCliente; 
                                 TipoDocumento: TiposDeDocumentoCliente; 
                                 const Domicilio: WideString; const DatosAdicionales1: WideString; 
                                 const DatosAdicionales2: WideString; 
                                 const DatosAdicionales3: WideString);
    procedure CargarDocumentoAsociado(NumeroLinea: Integer; CodigoComprobante: TiposComprobante; 
                                      NumeroPos: Integer; NumeroComprobante: Integer);
    function ConsultarDocumentoAsociado(NumeroLinea: Integer): RespuestaConsultarDocumentoAsociado;
    procedure ConfigurarZona(NumeroLinea: Integer; var Atributos: AtributosDeTexto; 
                             const Descripcion: WideString; Estacion: TiposDeEstacion; 
                             IdentificadorZona: ZonasDeLineasDeUsuario);
    function ConsultarZona(NumeroLinea: Integer; Estacion: TiposDeEstacion; 
                           IdentificadorZona: ZonasDeLineasDeUsuario): RespuestaConsultarZona;
    procedure CargarCodigoBarras(TipoCodigo: TiposDeCodigoDeBarras; const Numero: WideString; 
                                 ImprimeNumero: ImpresionNumeroCodigoDeBarras; 
                                 Almacena: ImpresionCodigoDeBarras);
    procedure ConfigurarFechaHora(Fecha: TDateTime; Hora: TDateTime);
    function ConsultarFechaHora: RespuestaConsultarFechaHora;
    procedure CambiarCategoriaIVA(ResponsabilidadIVA: TiposDeResponsabilidadesImpresor);
    procedure CambiarInscripIIBB(const IngBrutos: WideString);
    procedure CambiarFechaInicioActividades(Fecha: TDateTime);
    function ConsultarVersion: RespuestaConsultarVersion;
    function ConsultarUltimoError: RespuestaConsultarUltimoError;
    procedure Cancelar;
    function PedirReimpresion: RespuestaPedirReimpresion;
    procedure AbrirCajonDinero;
    procedure AvanzarPapelEstacionTique(CantidadDeLineas: Integer);
    procedure AvanzarPapelEstacionAuditoria(CantidadDeLineas: Integer);
    procedure AvanzarPapelAmbasEstaciones(CantidadDeLineas: Integer);
    procedure CambiarVelocidadPuerto(Baudios: Baudios);
    procedure ConfigurarRed(const DireccionIP: WideString; const Mascara: WideString; 
                            const Gateway: WideString; DHCP: SiNo);
    function ConsultarConfiguracionRed: RespuestaConsultarConfiguracionRed;
    function ObtenerPrimerBloqueAuditoria(const ZetaFechaInicial: WideString; 
                                          const ZetaFechaFinal: WideString; 
                                          TipoReporte: TipoReporteZ; 
                                          Zipea: CompresionDeInformacion; XMLUnico: XMLsPorBajada): RespuestaObtenerPrimerBloqueAuditoria;
    function ObtenerSiguienteBloqueAuditoria: RespuestaObtenerSiguienteBloqueAuditoria;
    function ObtenerPrimerBloqueDocumento(NumeroInicial: Integer; NumeroFinal: Integer; 
                                          CodigoComprobante: TiposComprobante; 
                                          Zipea: CompresionDeInformacion; XMLUnico: XMLsPorBajada): RespuestaObtenerPrimerBloqueDocumento;
    function ObtenerSiguienteBloqueDocumento: RespuestaObtenerSiguienteBloqueDocumento;
    function ObtenerPrimerBloqueLog: RespuestaObtenerPrimerBloqueLog;
    function ObtenerSiguienteBloqueLog: RespuestaObtenerSiguienteBloqueLog;
    procedure ConfigurarServidorCorreo(const DireccionIP: WideString; Puerto: Integer; 
                                       const DireccionRemitente: WideString);
    function ConsultarConfiguracionServidorCorreo: RespuestaConsultarConfiguracionServidorCorreo;
    procedure EnviarDocumentoCorreo(CodigoComprobante: TiposComprobante; 
                                    NumeroComprobante: Integer; const DireccionEMail: WideString);
    procedure ConfigurarZetaBorrable(NumeroZeta: Integer);
    function ConsultarZetaBorrable: RespuestaConsultarZetaBorrable;
    function ConsultarAcumuladosCierreZeta(TipoReporte: TipoReporteZ; 
                                           const NumeroZetaFecha: WideString; 
                                           CodigoComprobante: TiposComprobante): RespuestaConsultarAcumuladosCierreZeta;
    function ConsultarAcumuladosMemoriaDeTrabajo(CodigoComprobante: TiposComprobante): RespuestaConsultarAcumuladosMemoriaDeTrabajo;
    function ConsultarAcumuladosComprobante(CodigoComprobante: TiposComprobante; 
                                            NumeroComprobante: Integer): RespuestaConsultarAcumuladosComprobante;
    function ContinuarConsultaAcumulados: RespuestaContinuarConsultaAcumulados;
    procedure CargarBeneficiario(const RazonSocial: WideString; const NumeroDocumento: WideString; 
                                 TipoDocumento: TiposDeDocumentoCliente; const Domicilio: WideString);
    procedure CargarTransportista(const RazonSocial: WideString; const Cuit: WideString; 
                                  const Domicilio: WideString; const NombreChofer: WideString; 
                                  TipoDocumento: TiposDeDocumentoCliente; 
                                  const NumeroDocumento: WideString; const Dominio1: WideString; 
                                  const Dominio2: WideString);
    procedure ConfigurarImpresoraFiscal(Variable: Configuracion; const Valor: WideString);
    function ConsultarConfiguracionImpresoraFiscal(Variable: Configuracion): RespuestaConsultarConfiguracionImpresoraFiscal;
    function CopiarComprobante(CodigoComprobante: TiposComprobante; NumeroComprobante: Integer; 
                               Imprimir: SiNo): RespuestaCopiarComprobante;
    function ObtenerPrimerBloqueReporteElectronico(FechaInicial: TDateTime; FechaFinal: TDateTime; 
                                                   TipoReporte: TiposReporteAFIP): RespuestaObtenerPrimerBloqueReporteElectronico;
    function ObtenerSiguienteBloqueReporteElectronico: RespuestaObtenerSiguienteBloqueReporteElectronico;
    function ConsultarCapacidadesImpresoraFiscal(Capacidad: Capacidades; Estacion: TiposDeEstacion; 
                                                 CodigoComprobante: TiposComprobante): RespuestaConsultarCapacidadesImpresoraFiscal;
    function ObtenerRangoZetasPorFechas(FechaInicial: TDateTime; FechaFinal: TDateTime): RespuestaObtenerRangoZetasPorFechas;
    function ObtenerRangoFechasPorZetas(ZetaInicial: Integer; ZetaFinal: Integer): RespuestaObtenerRangoFechasPorZetas;
    function ConsultarInformacionBloqueo: RespuestaConsultarInformacionBloqueo;
    procedure OperacionCajero(NumeroCajero: Integer; const NombreCajero: WideString; 
                              Operacion: OperacionesCajero);
    function ConsultarEstadoECR: RespuestaConsultarEstadoECR;
    function ConsultarInformacionAritmetica(IndiceAuditoria: Integer; 
                                            IndiceDiscriminacionIVA: Integer): RespuestaConsultarInformacionAritmetica;
    function ConsultarUltimaConexion: RespuestaConsultarUltimaConexion;
    function AnularItem(IndiceAuditoria: Integer): RespuestaAnularItem;
    function ConsultarCantidadIvasOtrosTributos: RespuestaConsultarCantidadIvasOtrosTributos;
    property  ControlInterface: _ImpresoraFiscalRG3561 read GetControlInterface;
    property  DefaultInterface: _ImpresoraFiscalRG3561 read GetControlInterface;
  published
    property Anchors;
    property OnEstadoEspera: TImpresoraFiscalRG3561EstadoEspera read FOnEstadoEspera write FOnEstadoEspera;
    property OnComandoEnProceso: TNotifyEvent read FOnComandoEnProceso write FOnComandoEnProceso;
    property OnComandoProcesado: TNotifyEvent read FOnComandoProcesado write FOnComandoProcesado;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

class function CoErrorConstants.Create: _ErrorConstants;
begin
  Result := CreateComObject(CLASS_ErrorConstants) as _ErrorConstants;
end;

class function CoErrorConstants.CreateRemote(const MachineName: string): _ErrorConstants;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ErrorConstants) as _ErrorConstants;
end;

procedure TErrorConstants.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{6B42F849-7EFF-40CA-8C72-D39736F748F9}';
    IntfIID:   '{816CEEFA-8171-4DA8-9B1B-295DBB541F0A}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TErrorConstants.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _ErrorConstants;
  end;
end;

procedure TErrorConstants.ConnectTo(svrIntf: _ErrorConstants);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TErrorConstants.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TErrorConstants.GetDefaultInterface: _ErrorConstants;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TErrorConstants.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TErrorConstants.Destroy;
begin
  inherited Destroy;
end;

procedure TImpresoraFiscalRG3561.InitControlData;
const
  CEventDispIDs: array [0..2] of DWORD = (
    $00000001, $00000002, $00000003);
  CControlData: TControlData2 = (
    ClassID:      '{F629C02D-0F32-463C-8389-C7CB4C5AA38C}';
    EventIID:     '{0F2B8BFB-C6AE-4C25-B01E-2C288408087A}';
    EventCount:   3;
    EventDispIDs: @CEventDispIDs;
    LicenseKey:   nil (*HR:$00000000*);
    Flags:        $00000000;
    Version:      500);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := UIntPtr(@@FOnEstadoEspera) - UIntPtr(Self);
end;

procedure TImpresoraFiscalRG3561.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _ImpresoraFiscalRG3561;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TImpresoraFiscalRG3561.GetControlInterface: _ImpresoraFiscalRG3561;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TImpresoraFiscalRG3561.Abortar;
begin
  DefaultInterface.Abortar;
end;

function TImpresoraFiscalRG3561.ObtenerVersionProtocolo: Smallint;
begin
  Result := DefaultInterface.ObtenerVersionProtocolo;
end;

function TImpresoraFiscalRG3561.ObtenerRevision: Smallint;
begin
  Result := DefaultInterface.ObtenerRevision;
end;

function TImpresoraFiscalRG3561.ObtenerUltimoEstadoFiscal: EstadoFiscal;
begin
  Result := DefaultInterface.ObtenerUltimoEstadoFiscal;
end;

function TImpresoraFiscalRG3561.ObtenerUltimoEstadoImpresora: EstadoImpresora;
begin
  Result := DefaultInterface.ObtenerUltimoEstadoImpresora;
end;

function TImpresoraFiscalRG3561.ObtenerCampoRespuesta(const NombreCampo: WideString): WideString;
begin
  Result := DefaultInterface.ObtenerCampoRespuesta(NombreCampo);
end;

procedure TImpresoraFiscalRG3561.Conectar(const Destino: WideString; Puerto: Integer);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Conectar(Destino, Puerto, EmptyParam, EmptyParam);
end;

procedure TImpresoraFiscalRG3561.Conectar(const Destino: WideString; Puerto: Integer; 
                                          TiempoEsperaConexion: OleVariant);
var
  EmptyParam: OleVariant;
begin
  EmptyParam := System.Variants.EmptyParam;
  DefaultInterface.Conectar(Destino, Puerto, TiempoEsperaConexion, EmptyParam);
end;

procedure TImpresoraFiscalRG3561.Conectar(const Destino: WideString; Puerto: Integer; 
                                          TiempoEsperaConexion: OleVariant; 
                                          TiempoEsperaComandos: OleVariant);
begin
  DefaultInterface.Conectar(Destino, Puerto, TiempoEsperaConexion, TiempoEsperaComandos);
end;

procedure TImpresoraFiscalRG3561.ArchivoRegistro(const NombreArchivo: WideString; 
                                                 MaximaLongitud: Integer);
begin
  DefaultInterface.ArchivoRegistro(NombreArchivo, MaximaLongitud);
end;

function TImpresoraFiscalRG3561.ConsultarEstado(CodigoComprobante: TiposComprobante): RespuestaConsultarEstado;
begin
  Result := DefaultInterface.ConsultarEstado(CodigoComprobante);
end;

function TImpresoraFiscalRG3561.AbrirDocumento(CodigoComprobante: TiposComprobante): RespuestaAbrirDocumento;
begin
  Result := DefaultInterface.AbrirDocumento(CodigoComprobante);
end;

procedure TImpresoraFiscalRG3561.ImprimirTextoFiscal(var Atributos: AtributosDeTexto; 
                                                     const Texto: WideString; 
                                                     ModoDisplay: ModosDeDisplay);
begin
  DefaultInterface.ImprimirTextoFiscal(Atributos, Texto, ModoDisplay);
end;

function TImpresoraFiscalRG3561.ImprimirItem(const Descripcion: WideString; Cantidad: Double; 
                                             PrecioUnitario: Double; CondicionIVA: CondicionesIVA; 
                                             AlicuotaIVA: Double; OperacionMonto: ModosDeMonto; 
                                             TipoImpuestoInterno: ModosDeImpuestosInternos; 
                                             MagnitudImpuestoInterno: Double; 
                                             ModoDisplay: ModosDeDisplay; 
                                             ModoBaseTotal: ModosDePrecio; 
                                             UnidadReferencia: Integer; 
                                             const CodigoProducto: WideString; 
                                             const CodigoInterno: WideString; 
                                             UnidadMedida: UnidadesMedida): RespuestaImprimirItem;
begin
  Result := DefaultInterface.ImprimirItem(Descripcion, Cantidad, PrecioUnitario, CondicionIVA, 
                                          AlicuotaIVA, OperacionMonto, TipoImpuestoInterno, 
                                          MagnitudImpuestoInterno, ModoDisplay, ModoBaseTotal, 
                                          UnidadReferencia, CodigoProducto, CodigoInterno, 
                                          UnidadMedida);
end;

function TImpresoraFiscalRG3561.ImprimirDescuentoItem(const Descripcion: WideString; Monto: Double; 
                                                      ModoDisplay: ModosDeDisplay; 
                                                      ModoBaseTotal: ModosDePrecio): RespuestaImprimirDescuentoItem;
begin
  Result := DefaultInterface.ImprimirDescuentoItem(Descripcion, Monto, ModoDisplay, ModoBaseTotal);
end;

function TImpresoraFiscalRG3561.ImprimirAnticipoBonificacionEnvases(const Descripcion: WideString; 
                                                                    Monto: Double; 
                                                                    CondicionIVA: CondicionesIVA; 
                                                                    AlicuotaIVA: Double; 
                                                                    TipoImpuestoInterno: ModosDeImpuestosInternos; 
                                                                    MagnitudImpuestoInterno: Double; 
                                                                    ModoDisplay: ModosDeDisplay; 
                                                                    ModoBaseTotal: ModosDePrecio; 
                                                                    const CodigoProducto: WideString; 
                                                                    Operacion: TiposDeOperacionesGlobalesIVA): RespuestaImprimirAnticipoBonificacionEnvases;
begin
  Result := DefaultInterface.ImprimirAnticipoBonificacionEnvases(Descripcion, Monto, CondicionIVA, 
                                                                 AlicuotaIVA, TipoImpuestoInterno, 
                                                                 MagnitudImpuestoInterno, 
                                                                 ModoDisplay, ModoBaseTotal, 
                                                                 CodigoProducto, Operacion);
end;

function TImpresoraFiscalRG3561.ImprimirAjuste(const Descripcion: WideString; Monto: Double; 
                                               ModoDisplay: ModosDeDisplay; 
                                               ModoBaseTotal: ModosDePrecio; 
                                               const CodigoProducto: WideString; 
                                               Operacion: TiposDeAjustes): RespuestaImprimirAjuste;
begin
  Result := DefaultInterface.ImprimirAjuste(Descripcion, Monto, ModoDisplay, ModoBaseTotal, 
                                            CodigoProducto, Operacion);
end;

procedure TImpresoraFiscalRG3561.ImprimirOtrosTributos(Codigo: TiposTributos; 
                                                       const Descripcion: WideString; 
                                                       BaseImponible: Double; Importe: Double);
begin
  DefaultInterface.ImprimirOtrosTributos(Codigo, Descripcion, BaseImponible, Importe);
end;

procedure TImpresoraFiscalRG3561.ImprimirConceptoRecibo(const Descripcion: WideString);
begin
  DefaultInterface.ImprimirConceptoRecibo(Descripcion);
end;

function TImpresoraFiscalRG3561.ConsultarSubtotal(Impresion: ImpresionSubtotal; 
                                                  ModoDisplay: ModosDeDisplay): RespuestaConsultarSubtotal;
begin
  Result := DefaultInterface.ConsultarSubtotal(Impresion, ModoDisplay);
end;

function TImpresoraFiscalRG3561.ImprimirPago(const Descripcion: WideString; Monto: Double; 
                                             Operacion: ModosDePago; ModoDisplay: ModosDeDisplay; 
                                             const DescripcionAdicional: WideString; 
                                             CodigoFormaPago: TiposPago; Cuotas: Integer; 
                                             const Cupones: WideString; const Referencia: WideString): RespuestaImprimirPago;
begin
  Result := DefaultInterface.ImprimirPago(Descripcion, Monto, Operacion, ModoDisplay, 
                                          DescripcionAdicional, CodigoFormaPago, Cuotas, Cupones, 
                                          Referencia);
end;

function TImpresoraFiscalRG3561.CerrarDocumento(Copias: Integer; const DireccionEMail: WideString): RespuestaCerrarDocumento;
begin
  Result := DefaultInterface.CerrarDocumento(Copias, DireccionEMail);
end;

function TImpresoraFiscalRG3561.CerrarJornadaFiscal(Reporte: TipoReporte): RespuestaCerrarJornadaFiscal;
begin
  Result := DefaultInterface.CerrarJornadaFiscal(Reporte);
end;

procedure TImpresoraFiscalRG3561.ReportarZetasPorFecha(FechaInicial: TDateTime; 
                                                       FechaFinal: TDateTime; 
                                                       Reporte: TipoReporteAuditoria);
begin
  DefaultInterface.ReportarZetasPorFecha(FechaInicial, FechaFinal, Reporte);
end;

procedure TImpresoraFiscalRG3561.ReportarZetasPorNumeroZeta(ZetaInicial: Integer; 
                                                            ZetaFinal: Integer; 
                                                            Reporte: TipoReporteAuditoria);
begin
  DefaultInterface.ReportarZetasPorNumeroZeta(ZetaInicial, ZetaFinal, Reporte);
end;

function TImpresoraFiscalRG3561.ConsultarCapacidadZetas: RespuestaConsultarCapacidadZetas;
begin
  Result := DefaultInterface.ConsultarCapacidadZetas;
end;

procedure TImpresoraFiscalRG3561.ImprimirTextoGenerico(var Atributos: AtributosDeTexto; 
                                                       const Texto: WideString; 
                                                       ModoDisplay: ModosDeDisplay);
begin
  DefaultInterface.ImprimirTextoGenerico(Atributos, Texto, ModoDisplay);
end;

procedure TImpresoraFiscalRG3561.ImprimirTextoPruebaPerifericos(var Atributos: AtributosDeTexto; 
                                                                const Texto: WideString);
begin
  DefaultInterface.ImprimirTextoPruebaPerifericos(Atributos, Texto);
end;

function TImpresoraFiscalRG3561.ConsultarDatosInicializacion: RespuestaConsultarDatosInicializacion;
begin
  Result := DefaultInterface.ConsultarDatosInicializacion;
end;

procedure TImpresoraFiscalRG3561.CargarLogoEmisor(Operacion: OperacionesCargaLogoUsuario; 
                                                  const Informacion: WideString);
begin
  DefaultInterface.CargarLogoEmisor(Operacion, Informacion);
end;

procedure TImpresoraFiscalRG3561.EliminarLogoEmisor;
begin
  DefaultInterface.EliminarLogoEmisor;
end;

procedure TImpresoraFiscalRG3561.CargarDatosCliente(const RazonSocial: WideString; 
                                                    const NumeroDocumento: WideString; 
                                                    ResponsabilidadIVA: TiposDeResponsabilidadesCliente; 
                                                    TipoDocumento: TiposDeDocumentoCliente; 
                                                    const Domicilio: WideString; 
                                                    const DatosAdicionales1: WideString; 
                                                    const DatosAdicionales2: WideString; 
                                                    const DatosAdicionales3: WideString);
begin
  DefaultInterface.CargarDatosCliente(RazonSocial, NumeroDocumento, ResponsabilidadIVA, 
                                      TipoDocumento, Domicilio, DatosAdicionales1, 
                                      DatosAdicionales2, DatosAdicionales3);
end;

procedure TImpresoraFiscalRG3561.CargarDocumentoAsociado(NumeroLinea: Integer; 
                                                         CodigoComprobante: TiposComprobante; 
                                                         NumeroPos: Integer; 
                                                         NumeroComprobante: Integer);
begin
  DefaultInterface.CargarDocumentoAsociado(NumeroLinea, CodigoComprobante, NumeroPos, 
                                           NumeroComprobante);
end;

function TImpresoraFiscalRG3561.ConsultarDocumentoAsociado(NumeroLinea: Integer): RespuestaConsultarDocumentoAsociado;
begin
  Result := DefaultInterface.ConsultarDocumentoAsociado(NumeroLinea);
end;

procedure TImpresoraFiscalRG3561.ConfigurarZona(NumeroLinea: Integer; 
                                                var Atributos: AtributosDeTexto; 
                                                const Descripcion: WideString; 
                                                Estacion: TiposDeEstacion; 
                                                IdentificadorZona: ZonasDeLineasDeUsuario);
begin
  DefaultInterface.ConfigurarZona(NumeroLinea, Atributos, Descripcion, Estacion, IdentificadorZona);
end;

function TImpresoraFiscalRG3561.ConsultarZona(NumeroLinea: Integer; Estacion: TiposDeEstacion; 
                                              IdentificadorZona: ZonasDeLineasDeUsuario): RespuestaConsultarZona;
begin
  Result := DefaultInterface.ConsultarZona(NumeroLinea, Estacion, IdentificadorZona);
end;

procedure TImpresoraFiscalRG3561.CargarCodigoBarras(TipoCodigo: TiposDeCodigoDeBarras; 
                                                    const Numero: WideString; 
                                                    ImprimeNumero: ImpresionNumeroCodigoDeBarras; 
                                                    Almacena: ImpresionCodigoDeBarras);
begin
  DefaultInterface.CargarCodigoBarras(TipoCodigo, Numero, ImprimeNumero, Almacena);
end;

procedure TImpresoraFiscalRG3561.ConfigurarFechaHora(Fecha: TDateTime; Hora: TDateTime);
begin
  DefaultInterface.ConfigurarFechaHora(Fecha, Hora);
end;

function TImpresoraFiscalRG3561.ConsultarFechaHora: RespuestaConsultarFechaHora;
begin
  Result := DefaultInterface.ConsultarFechaHora;
end;

procedure TImpresoraFiscalRG3561.CambiarCategoriaIVA(ResponsabilidadIVA: TiposDeResponsabilidadesImpresor);
begin
  DefaultInterface.CambiarCategoriaIVA(ResponsabilidadIVA);
end;

procedure TImpresoraFiscalRG3561.CambiarInscripIIBB(const IngBrutos: WideString);
begin
  DefaultInterface.CambiarInscripIIBB(IngBrutos);
end;

procedure TImpresoraFiscalRG3561.CambiarFechaInicioActividades(Fecha: TDateTime);
begin
  DefaultInterface.CambiarFechaInicioActividades(Fecha);
end;

function TImpresoraFiscalRG3561.ConsultarVersion: RespuestaConsultarVersion;
begin
  Result := DefaultInterface.ConsultarVersion;
end;

function TImpresoraFiscalRG3561.ConsultarUltimoError: RespuestaConsultarUltimoError;
begin
  Result := DefaultInterface.ConsultarUltimoError;
end;

procedure TImpresoraFiscalRG3561.Cancelar;
begin
  DefaultInterface.Cancelar;
end;

function TImpresoraFiscalRG3561.PedirReimpresion: RespuestaPedirReimpresion;
begin
  Result := DefaultInterface.PedirReimpresion;
end;

procedure TImpresoraFiscalRG3561.AbrirCajonDinero;
begin
  DefaultInterface.AbrirCajonDinero;
end;

procedure TImpresoraFiscalRG3561.AvanzarPapelEstacionTique(CantidadDeLineas: Integer);
begin
  DefaultInterface.AvanzarPapelEstacionTique(CantidadDeLineas);
end;

procedure TImpresoraFiscalRG3561.AvanzarPapelEstacionAuditoria(CantidadDeLineas: Integer);
begin
  DefaultInterface.AvanzarPapelEstacionAuditoria(CantidadDeLineas);
end;

procedure TImpresoraFiscalRG3561.AvanzarPapelAmbasEstaciones(CantidadDeLineas: Integer);
begin
  DefaultInterface.AvanzarPapelAmbasEstaciones(CantidadDeLineas);
end;

procedure TImpresoraFiscalRG3561.CambiarVelocidadPuerto(Baudios: Baudios);
begin
  DefaultInterface.CambiarVelocidadPuerto(Baudios);
end;

procedure TImpresoraFiscalRG3561.ConfigurarRed(const DireccionIP: WideString; 
                                               const Mascara: WideString; 
                                               const Gateway: WideString; DHCP: SiNo);
begin
  DefaultInterface.ConfigurarRed(DireccionIP, Mascara, Gateway, DHCP);
end;

function TImpresoraFiscalRG3561.ConsultarConfiguracionRed: RespuestaConsultarConfiguracionRed;
begin
  Result := DefaultInterface.ConsultarConfiguracionRed;
end;

function TImpresoraFiscalRG3561.ObtenerPrimerBloqueAuditoria(const ZetaFechaInicial: WideString; 
                                                             const ZetaFechaFinal: WideString; 
                                                             TipoReporte: TipoReporteZ; 
                                                             Zipea: CompresionDeInformacion; 
                                                             XMLUnico: XMLsPorBajada): RespuestaObtenerPrimerBloqueAuditoria;
begin
  Result := DefaultInterface.ObtenerPrimerBloqueAuditoria(ZetaFechaInicial, ZetaFechaFinal, 
                                                          TipoReporte, Zipea, XMLUnico);
end;

function TImpresoraFiscalRG3561.ObtenerSiguienteBloqueAuditoria: RespuestaObtenerSiguienteBloqueAuditoria;
begin
  Result := DefaultInterface.ObtenerSiguienteBloqueAuditoria;
end;

function TImpresoraFiscalRG3561.ObtenerPrimerBloqueDocumento(NumeroInicial: Integer; 
                                                             NumeroFinal: Integer; 
                                                             CodigoComprobante: TiposComprobante; 
                                                             Zipea: CompresionDeInformacion; 
                                                             XMLUnico: XMLsPorBajada): RespuestaObtenerPrimerBloqueDocumento;
begin
  Result := DefaultInterface.ObtenerPrimerBloqueDocumento(NumeroInicial, NumeroFinal, 
                                                          CodigoComprobante, Zipea, XMLUnico);
end;

function TImpresoraFiscalRG3561.ObtenerSiguienteBloqueDocumento: RespuestaObtenerSiguienteBloqueDocumento;
begin
  Result := DefaultInterface.ObtenerSiguienteBloqueDocumento;
end;

function TImpresoraFiscalRG3561.ObtenerPrimerBloqueLog: RespuestaObtenerPrimerBloqueLog;
begin
  Result := DefaultInterface.ObtenerPrimerBloqueLog;
end;

function TImpresoraFiscalRG3561.ObtenerSiguienteBloqueLog: RespuestaObtenerSiguienteBloqueLog;
begin
  Result := DefaultInterface.ObtenerSiguienteBloqueLog;
end;

procedure TImpresoraFiscalRG3561.ConfigurarServidorCorreo(const DireccionIP: WideString; 
                                                          Puerto: Integer; 
                                                          const DireccionRemitente: WideString);
begin
  DefaultInterface.ConfigurarServidorCorreo(DireccionIP, Puerto, DireccionRemitente);
end;

function TImpresoraFiscalRG3561.ConsultarConfiguracionServidorCorreo: RespuestaConsultarConfiguracionServidorCorreo;
begin
  Result := DefaultInterface.ConsultarConfiguracionServidorCorreo;
end;

procedure TImpresoraFiscalRG3561.EnviarDocumentoCorreo(CodigoComprobante: TiposComprobante; 
                                                       NumeroComprobante: Integer; 
                                                       const DireccionEMail: WideString);
begin
  DefaultInterface.EnviarDocumentoCorreo(CodigoComprobante, NumeroComprobante, DireccionEMail);
end;

procedure TImpresoraFiscalRG3561.ConfigurarZetaBorrable(NumeroZeta: Integer);
begin
  DefaultInterface.ConfigurarZetaBorrable(NumeroZeta);
end;

function TImpresoraFiscalRG3561.ConsultarZetaBorrable: RespuestaConsultarZetaBorrable;
begin
  Result := DefaultInterface.ConsultarZetaBorrable;
end;

function TImpresoraFiscalRG3561.ConsultarAcumuladosCierreZeta(TipoReporte: TipoReporteZ; 
                                                              const NumeroZetaFecha: WideString; 
                                                              CodigoComprobante: TiposComprobante): RespuestaConsultarAcumuladosCierreZeta;
begin
  Result := DefaultInterface.ConsultarAcumuladosCierreZeta(TipoReporte, NumeroZetaFecha, 
                                                           CodigoComprobante);
end;

function TImpresoraFiscalRG3561.ConsultarAcumuladosMemoriaDeTrabajo(CodigoComprobante: TiposComprobante): RespuestaConsultarAcumuladosMemoriaDeTrabajo;
begin
  Result := DefaultInterface.ConsultarAcumuladosMemoriaDeTrabajo(CodigoComprobante);
end;

function TImpresoraFiscalRG3561.ConsultarAcumuladosComprobante(CodigoComprobante: TiposComprobante; 
                                                               NumeroComprobante: Integer): RespuestaConsultarAcumuladosComprobante;
begin
  Result := DefaultInterface.ConsultarAcumuladosComprobante(CodigoComprobante, NumeroComprobante);
end;

function TImpresoraFiscalRG3561.ContinuarConsultaAcumulados: RespuestaContinuarConsultaAcumulados;
begin
  Result := DefaultInterface.ContinuarConsultaAcumulados;
end;

procedure TImpresoraFiscalRG3561.CargarBeneficiario(const RazonSocial: WideString; 
                                                    const NumeroDocumento: WideString; 
                                                    TipoDocumento: TiposDeDocumentoCliente; 
                                                    const Domicilio: WideString);
begin
  DefaultInterface.CargarBeneficiario(RazonSocial, NumeroDocumento, TipoDocumento, Domicilio);
end;

procedure TImpresoraFiscalRG3561.CargarTransportista(const RazonSocial: WideString; 
                                                     const Cuit: WideString; 
                                                     const Domicilio: WideString; 
                                                     const NombreChofer: WideString; 
                                                     TipoDocumento: TiposDeDocumentoCliente; 
                                                     const NumeroDocumento: WideString; 
                                                     const Dominio1: WideString; 
                                                     const Dominio2: WideString);
begin
  DefaultInterface.CargarTransportista(RazonSocial, Cuit, Domicilio, NombreChofer, TipoDocumento, 
                                       NumeroDocumento, Dominio1, Dominio2);
end;

procedure TImpresoraFiscalRG3561.ConfigurarImpresoraFiscal(Variable: Configuracion; 
                                                           const Valor: WideString);
begin
  DefaultInterface.ConfigurarImpresoraFiscal(Variable, Valor);
end;

function TImpresoraFiscalRG3561.ConsultarConfiguracionImpresoraFiscal(Variable: Configuracion): RespuestaConsultarConfiguracionImpresoraFiscal;
begin
  Result := DefaultInterface.ConsultarConfiguracionImpresoraFiscal(Variable);
end;

function TImpresoraFiscalRG3561.CopiarComprobante(CodigoComprobante: TiposComprobante; 
                                                  NumeroComprobante: Integer; Imprimir: SiNo): RespuestaCopiarComprobante;
begin
  Result := DefaultInterface.CopiarComprobante(CodigoComprobante, NumeroComprobante, Imprimir);
end;

function TImpresoraFiscalRG3561.ObtenerPrimerBloqueReporteElectronico(FechaInicial: TDateTime; 
                                                                      FechaFinal: TDateTime; 
                                                                      TipoReporte: TiposReporteAFIP): RespuestaObtenerPrimerBloqueReporteElectronico;
begin
  Result := DefaultInterface.ObtenerPrimerBloqueReporteElectronico(FechaInicial, FechaFinal, 
                                                                   TipoReporte);
end;

function TImpresoraFiscalRG3561.ObtenerSiguienteBloqueReporteElectronico: RespuestaObtenerSiguienteBloqueReporteElectronico;
begin
  Result := DefaultInterface.ObtenerSiguienteBloqueReporteElectronico;
end;

function TImpresoraFiscalRG3561.ConsultarCapacidadesImpresoraFiscal(Capacidad: Capacidades; 
                                                                    Estacion: TiposDeEstacion; 
                                                                    CodigoComprobante: TiposComprobante): RespuestaConsultarCapacidadesImpresoraFiscal;
begin
  Result := DefaultInterface.ConsultarCapacidadesImpresoraFiscal(Capacidad, Estacion, 
                                                                 CodigoComprobante);
end;

function TImpresoraFiscalRG3561.ObtenerRangoZetasPorFechas(FechaInicial: TDateTime; 
                                                           FechaFinal: TDateTime): RespuestaObtenerRangoZetasPorFechas;
begin
  Result := DefaultInterface.ObtenerRangoZetasPorFechas(FechaInicial, FechaFinal);
end;

function TImpresoraFiscalRG3561.ObtenerRangoFechasPorZetas(ZetaInicial: Integer; ZetaFinal: Integer): RespuestaObtenerRangoFechasPorZetas;
begin
  Result := DefaultInterface.ObtenerRangoFechasPorZetas(ZetaInicial, ZetaFinal);
end;

function TImpresoraFiscalRG3561.ConsultarInformacionBloqueo: RespuestaConsultarInformacionBloqueo;
begin
  Result := DefaultInterface.ConsultarInformacionBloqueo;
end;

procedure TImpresoraFiscalRG3561.OperacionCajero(NumeroCajero: Integer; 
                                                 const NombreCajero: WideString; 
                                                 Operacion: OperacionesCajero);
begin
  DefaultInterface.OperacionCajero(NumeroCajero, NombreCajero, Operacion);
end;

function TImpresoraFiscalRG3561.ConsultarEstadoECR: RespuestaConsultarEstadoECR;
begin
  Result := DefaultInterface.ConsultarEstadoECR;
end;

function TImpresoraFiscalRG3561.ConsultarInformacionAritmetica(IndiceAuditoria: Integer; 
                                                               IndiceDiscriminacionIVA: Integer): RespuestaConsultarInformacionAritmetica;
begin
  Result := DefaultInterface.ConsultarInformacionAritmetica(IndiceAuditoria, IndiceDiscriminacionIVA);
end;

function TImpresoraFiscalRG3561.ConsultarUltimaConexion: RespuestaConsultarUltimaConexion;
begin
  Result := DefaultInterface.ConsultarUltimaConexion;
end;

function TImpresoraFiscalRG3561.AnularItem(IndiceAuditoria: Integer): RespuestaAnularItem;
begin
  Result := DefaultInterface.AnularItem(IndiceAuditoria);
end;

function TImpresoraFiscalRG3561.ConsultarCantidadIvasOtrosTributos: RespuestaConsultarCantidadIvasOtrosTributos;
begin
  Result := DefaultInterface.ConsultarCantidadIvasOtrosTributos;
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TImpresoraFiscalRG3561]);
  RegisterComponents(dtlServerPage, [TErrorConstants]);
end;

end.

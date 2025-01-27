unit uFiscalEpson;

interface

   uses
   Xml.xmldom, Xml.XMLIntf,  Xml.xmldoc,SysUtils,udticket,Dialogs;

   type TFiscalEpson = class
      type
           TConsultarVersionDll = function(descripcion: PChar;
    descripcion_largo_maximo: LongInt; var mayor: LongInt; var menor: LongInt)
    : LongInt; StdCall;

  TConfigurarVelocidad = function(velocidad: LongInt): LongInt; StdCall;

  TConfigurarPuerto = function(velocidad: String): LongInt; StdCall;

  TConectar = function(): LongInt; StdCall;

  TImprimirCierreX = function(): LongInt; StdCall;

  TImprimirCierreZ = function(): LongInt; StdCall;

  TDesconectar = function(): LongInt; StdCall;

  tEstablecerEncabezado = function(numero_encabezado: integer;
    descripcion: PAnsiChar): LongInt; StdCall;

  tAbrirComprobante = function(id_tipo_documento: integer): LongInt; StdCall;

  tCerrarComprobante = function(): LongInt; StdCall;

  tEnviarComando = function(commando: PAnsiChar): LongInt; StdCall;

  tConsultarEncabezado = function(numero_encabezado: integer; respuesta: string;
    respuesta_largo_maximo: integer): LongInt; StdCall;

  tEstablecerCola = function(numero_cola: integer; descripcion: PAnsiChar)
    : LongInt; StdCall;

  tCargarTextoExtra = function(descripcion: PAnsiChar): LongInt; StdCall;

  TImprimirItem = function(id_modificador: integer; descripcion: PAnsiChar;
    cantidad: PAnsiChar; precio: PAnsiChar; id_tasa_iva: integer;
    ii_id: integer; ii_valor: PAnsiChar; id_codigo: integer; codigo: PAnsiChar;
    codigo_unidad_matrix: PAnsiChar; código_unidad_medida: integer)
    : LongInt; StdCall;

  TCargarPago = function(id_modificador: integer; codigo_forma_pago: integer;
    cantidad_cuotas: integer; monto: PAnsiChar; descripción_cupones: PAnsiChar;
    descripcion: PAnsiChar; descripcion_extra1: PAnsiChar;
    descripcion_extra2: PAnsiChar): LongInt; StdCall;

  TConsultarNumeroComprobanteUltimo = function(tipo_de_comprobante: PAnsiChar;
    respuesta: PAnsiChar; respuesta_largo_maximo: LongInt): LongInt; StdCall;

  TObtenerRespuesta = function(buffer_salida: PAnsiChar;
    largo_buffer_salida: integer; largo_final_buffer_salida: integer)
    : LongInt; StdCall;

  TConsultarNumeroComprobanteActual = function(respuesta: PAnsiChar;
    respuesta_largo_maximo: integer): LongInt; Stdcall;

  TConsultarFechaHora = function(respuesta: PAnsiChar;
    respuesta_largo_maximo: integer): LongInt; Stdcall;

  TCargarAjuste = function(id_modificador: integer; descripcion: PAnsiChar;
    monto: PAnsiChar; id_tasa_iva: integer; codigo_interno: PAnsiChar)
    : LongInt; Stdcall;

  TObtenerRespuestaExtendida = function(numero_campo: LongInt;
    buffer_salida: PAnsiChar; largo_buffer_salida: LongInt;
    largo_final_buffer_salida: LongInt): LongInt; Stdcall;

  TImprimirTextoLibre = function(descripcion: PAnsiChar): LongInt; Stdcall;

  TCargarDatosCliente = function(nombre_o_razon_social1: PAnsiChar;
    nombre_o_razon_social2: PAnsiChar; domicilio1: PAnsiChar;
    domicilio2: PAnsiChar; domicilio3: PAnsiChar; id_tipo_documento: LongInt;
    numero_documento: PAnsiChar; id_responsabilidad_iva: LongInt)
    : LongInt; stdcall;
    TCargarComprobanteAsociado = function(descripcion: PAnsiChar)
    : LongInt; Stdcall;

    private
     dll: THandle;
     Ticket: TTicket;
     function RightPad(S: string; Ch: Char; Len: integer): string;

     public

      ConfigurarVelocidad: TConfigurarVelocidad;
  ConfigurarPuerto: TConfigurarPuerto;
  Conectar: TConectar;
  ImprimirCierreX: TImprimirCierreX;
  ImprimirCierreZ: TImprimirCierreZ;
  Desconectar: TDesconectar;
  ConsultarVersionDll: TConsultarVersionDll;
  establecerencabezado: tEstablecerEncabezado;
  ConsultarEncabezado: tConsultarEncabezado;
  abrircomprobante: tAbrirComprobante;
  CerrarComprobante: tCerrarComprobante;
  EnviarComando: tEnviarComando;
  EstablecerCola: tEstablecerCola;
  CargarTextoExtra: tCargarTextoExtra;
  ImprimirItem: TImprimirItem;
  CargarPago: TCargarPago;
  ConsultarNumeroComprobanteUltimo: TConsultarNumeroComprobanteUltimo;
  ObtenerRespuesta: TObtenerRespuesta;
  ConsultarNumeroComprobanteActual: TConsultarNumeroComprobanteActual;
  ConsultarFechaHora: TConsultarFechaHora;
  ObtenerRespuestaExtendida: TObtenerRespuestaExtendida;
  Cargarajuste: TCargarAjuste;
  ImprimirTextoLibre: TImprimirTextoLibre;
  CargarDatosCliente: TCargarDatosCliente;
  CargarComprobanteAsociado: TCargarComprobanteAsociado;
  procedure borrarEncabezadoYCola;
  procedure imprimirCuponPromo(nro_comprob: integer);
  constructor Create(unTicket:TTicket);
  destructor destroy;
   end;



implementation
    uses Windows;
    constructor TFiscalEpson.Create(unTicket:TTicket);
begin

    dll := 0;
  Ticket:= unTicket;
  dll := LoadLibrary('C:\dll\EpsonFiscalInterface.dll');
  if dll <> 0 then
  begin

  // obtener las referencias a funciones:  "ConsultarVersionDll"
  @ConsultarVersionDll := GetProcAddress(dll, 'ConsultarVersionDll');
  if not Assigned(ConsultarVersionDll) then
  begin
    ShowMessage('Error al asignar funcion: ConsultarVersionDll');
    Exit;
  end;

  // obtener las referencias a funciones:  "ConfigurarVelocidad"
  @ConfigurarVelocidad := GetProcAddress(dll, 'ConfigurarVelocidad');
  if not Assigned(ConfigurarVelocidad) then
  begin
    ShowMessage('Error al asignar funcion: ConfigurarVelocidad');
    Exit;
  end;

  // obtener las referencias a funciones:  "ConfigurarPuerto"
  @ConfigurarPuerto := GetProcAddress(dll, 'ConfigurarPuerto');
  if not Assigned(ConfigurarPuerto) then
  begin
    ShowMessage('Error al asignar funcion: ConfigurarPuerto');
    Exit;
  end;

  // obtener las referencias a funciones:  "Conectar"
  @Conectar := GetProcAddress(dll, 'Conectar');
  if not Assigned(Conectar) then
  begin
    ShowMessage('Error al asignar funcion: Conectar');
    Exit;
  end;

  // obtener las referencias a funciones:  "ImprimirCierreX"
  @ImprimirCierreX := GetProcAddress(dll, 'ImprimirCierreX');
  if not Assigned(ImprimirCierreX) then
  begin
    ShowMessage('Error al asignar funcion: ImprimirCierreX');
    Exit;
  end;

  // obtener las referencias a funciones:  "ImprimirCierreZ"
  @ImprimirCierreZ := GetProcAddress(dll, 'ImprimirCierreZ');
  if not Assigned(ImprimirCierreZ) then
  begin
    ShowMessage('Error al asignar funcion: ImprimirCierreZ');
    Exit;
  end;

  @abrircomprobante := GetProcAddress(dll, 'AbrirComprobante');
  if not Assigned(abrircomprobante) then
  begin
    ShowMessage('Error al asignar funcion: AbrirComprobante');
    Exit;
  end;
  @CerrarComprobante := GetProcAddress(dll, 'CerrarComprobante');
  if not Assigned(abrircomprobante) then
  begin
    ShowMessage('Error al asignar funcion: CerrarComprobante');
    Exit;
  end;
  @establecerencabezado := GetProcAddress(dll, 'EstablecerEncabezado');
  if not Assigned(abrircomprobante) then
  begin
    ShowMessage('Error al asignar funcion: CerrarComprobante');
    Exit;
  end;
  @ConsultarEncabezado := GetProcAddress(dll, 'EstablecerEncabezado');
  if not Assigned(abrircomprobante) then
  begin
    ShowMessage('Error al asignar funcion: CerrarComprobante');
    Exit;
  end;
  @EnviarComando := GetProcAddress(dll, 'EnviarComando');
  if not Assigned(EnviarComando) then
  begin
    ShowMessage('Error al asignar funcion: EnviarComando');
    Exit;
  end;

  // obtener las referencias a funciones:  "Desconectar"
  @Desconectar := GetProcAddress(dll, 'Desconectar');
  if not Assigned(Desconectar) then
  begin
    ShowMessage('Error al asignar funcion: Desconectar');
    Exit;
  end;
  @EstablecerCola := GetProcAddress(dll, 'EstablecerCola');
  if not Assigned(EstablecerCola) then
  begin
    ShowMessage('Error al asignar funcion: EstablecerCola');
    Exit;
  end;
  @CargarTextoExtra := GetProcAddress(dll, 'CargarTextoExtra');
  if not Assigned(CargarTextoExtra) then
  begin
    ShowMessage('Error al asignar funcion: CargarTextoExtra');
    Exit;
  end;
  @ImprimirItem := GetProcAddress(dll, 'ImprimirItem');
  if not Assigned(ImprimirItem) then
  begin
    ShowMessage('Error al asignar funcion: ImprimirItem');
    Exit;
  end;
  @CargarPago := GetProcAddress(dll, 'CargarPago');
  if not Assigned(CargarPago) then
  begin
    ShowMessage('Error al asignar funcion: CargarPago');
    Exit;
  end;

  @ConsultarNumeroComprobanteActual :=
    GetProcAddress(dll, 'ConsultarNumeroComprobanteActual');
  if not Assigned(ConsultarNumeroComprobanteActual) then
  begin
    ShowMessage('Error al asignar funcion: ConsultarNumeroComprobanteActual');
    Exit;
  end;
  @ConsultarFechaHora := GetProcAddress(dll, 'Consultarfechahora');
  if not Assigned(ConsultarNumeroComprobanteActual) then
  begin
    ShowMessage('Error al asignar funcion: Consultarfechahora');
    Exit;
  end;

  @ObtenerRespuestaExtendida := GetProcAddress(dll,
    'ObtenerRespuestaExtendida');
  if not Assigned(ObtenerRespuestaExtendida) then
  begin
    ShowMessage('Error al asignar funcion: ObtenerRespuestaExtendida');
    Exit;
  end;
  @Cargarajuste := GetProcAddress(dll, 'CargarAjuste');
  if not Assigned(Cargarajuste) then
  begin
    ShowMessage('Error al asignar funcion: CargarAjuste');
    Exit;
  end;

  @ImprimirTextoLibre := GetProcAddress(dll, 'ImprimirTextoLibre');
  if not Assigned(ImprimirTextoLibre) then
  begin
    ShowMessage('Error al asignar funcion: ImprimirTextoLibre');
    Exit;
  end;
  @CargarDatosCliente := GetProcAddress(dll, 'CargarDatosCliente');
  if not Assigned(CargarDatosCliente) then
  begin
    ShowMessage('Error al asignar funcion: CargarDatosCliente');
    Exit;
  end;
  @ConsultarNumeroComprobanteUltimo :=
    GetProcAddress(dll, 'ConsultarNumeroComprobanteUltimo');
  if not Assigned(ConsultarNumeroComprobanteUltimo) then
  begin
    ShowMessage('Error al asignar funcion: ConsultarNumerocomprobanteultimo');
    Exit;
  end;

  end;
end;

 destructor TFiscalEpson.destroy;
 begin


 end;




 function RightPad(S: string; Ch: Char; Len: integer): string;
var
  RestLen: integer;

begin
  Result := S;
  RestLen := Len - Length(S);
  if RestLen < 1 then
    Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;

procedure TFiscalEpson.borrarEncabezadoYCola;
var
  comando: Array [0 .. 200] of AnsiChar;
  error: LongInt;
begin
  comando:='';
  error := establecerencabezado(1, @comando[0]);
  error := establecerencabezado(2, @comando[0]);
  error := establecerencabezado(3, @comando[0]);
  error := establecerencabezado(4, @comando[0]);
  error := establecerencabezado(5, @comando[0]);
  error := establecerencabezado(6, @comando[0]);
  error := establecerencabezado(7, @comando[0]);
  error := establecerencabezado(8, @comando[0]);
  error := establecerencabezado(9, @comando[0]);
  error := establecerencabezado(10, @comando[0]);

  error := EstablecerCola(1, @comando[0]);
  error := EstablecerCola(2, @comando[0]);
  error := EstablecerCola(3, @comando[0]);
  error := EstablecerCola(4, @comando[0]);
  error := EstablecerCola(5, @comando[0]);
  error := EstablecerCola(6, @comando[0]);
  error := EstablecerCola(7, @comando[0]);
  error := EstablecerCola(8, @comando[0]);
  error := EstablecerCola(9, @comando[0]);
  error := EstablecerCola(10, @comando[0]);

end;

  function TFiscalEpson.RightPad(S: string; Ch: Char; Len: integer): string;
var
  RestLen: integer;

begin
  Result := S;
  RestLen := Len - Length(S);
  if RestLen < 1 then
    Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;



 procedure TFiscalEpson.imprimirCuponPromo(nro_comprob: integer);
 var
  comando: Array [0 .. 200] of AnsiChar;
  error: LongInt;
   texto: string;
 begin
       error := CerrarComprobante();

                  comando := '';
                  texto := strpcopy(comando, 'Vendedor: ' + Ticket.nom_vendedor);
                  error := establecerencabezado(1, @comando[0]);
                  comando := '';
                  texto := strpcopy(comando, 'Participante: ' + Ticket.DESCRIPCIONCLIENTE);
                  error := establecerencabezado(2, @comando[0]);
                  comando := '';
                  texto := strpcopy(comando, 'DNI: ' + Ticket.dni);
                  error := establecerencabezado(3, @comando[0]);
                  comando := '';
                  texto := strpcopy(comando, 'TELEFONO: ' + Ticket.telefono);
                  error := establecerencabezado(4, @comando[0]);
                  comando := '';

                  error := abrircomprobante(21);

                  comando := '';
                  texto := strpcopy(comando, 'CUPON VALIDO PARA PARTICIPAR PROMO');
                  error := ImprimirTextoLibre(comando);
                  comando := '';
                  texto := strpcopy(comando, 'NRO TICKET: ' + Ticket.fiscla_pv +
                    (RightPad(inttostr(nro_comprob), '0', 8)));
                  error := ImprimirTextoLibre(comando);
                  comando := '';
                  texto := strpcopy(comando,
                    '--------------------------------------------------');
                  error := ImprimirTextoLibre(comando);

                  error := CerrarComprobante();
 end;



end.

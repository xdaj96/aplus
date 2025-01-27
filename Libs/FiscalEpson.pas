unit FiscalEpson;

interface
    type TConsultarVersionDll = function(descripcion: PChar;
    descripcion_largo_maximo: LongInt; var mayor: LongInt; var menor: LongInt)
    : LongInt; StdCall;

 type TConfigurarVelocidad = function(velocidad: LongInt): LongInt; StdCall;

 type TConfigurarPuerto = function(velocidad: String): LongInt; StdCall;

 type TConectar = function(): LongInt; StdCall;

 type TImprimirCierreX = function(): LongInt; StdCall;

  type TImprimirCierreZ = function(): LongInt; StdCall;

  type TDesconectar = function(): LongInt; StdCall;

  type tEstablecerEncabezado = function(numero_encabezado: integer;
    descripcion: PAnsiChar): LongInt; StdCall;

  type tAbrirComprobante = function(id_tipo_documento: integer): LongInt; StdCall;

  type tCerrarComprobante = function(): LongInt; StdCall;

  type tEnviarComando = function(commando: PAnsiChar): LongInt; StdCall;

  type tConsultarEncabezado = function(numero_encabezado: integer; respuesta: string;
    respuesta_largo_maximo: integer): LongInt; StdCall;

  type tEstablecerCola = function(numero_cola: integer; descripcion: PAnsiChar)
    : LongInt; StdCall;

  type tCargarTextoExtra = function(descripcion: PAnsiChar): LongInt; StdCall;

  type TImprimirItem = function(id_modificador: integer; descripcion: PAnsiChar;
    cantidad: PAnsiChar; precio: PAnsiChar; id_tasa_iva: integer;
    ii_id: integer; ii_valor: PAnsiChar; id_codigo: integer; codigo: PAnsiChar;
    codigo_unidad_matrix: PAnsiChar; código_unidad_medida: integer)
    : LongInt; StdCall;

  type TCargarPago = function(id_modificador: integer; codigo_forma_pago: integer;
    cantidad_cuotas: integer; monto: PAnsiChar; descripción_cupones: PAnsiChar;
    descripcion: PAnsiChar; descripcion_extra1: PAnsiChar;
    descripcion_extra2: PAnsiChar): LongInt; StdCall;

  type TConsultarNumeroComprobanteUltimo = function(tipo_de_comprobante: PAnsiChar;
    respuesta: PAnsiChar; respuesta_largo_maximo: LongInt): LongInt; StdCall;

  type TObtenerRespuesta = function(buffer_salida: PAnsiChar;
    largo_buffer_salida: integer; largo_final_buffer_salida: integer)
    : LongInt; StdCall;

  type TConsultarNumeroComprobanteActual = function(respuesta: PAnsiChar;
    respuesta_largo_maximo: integer): LongInt; Stdcall;

  type TConsultarFechaHora = function(respuesta: PAnsiChar;
    respuesta_largo_maximo: integer): LongInt; Stdcall;

  type TCargarAjuste = function(id_modificador: integer; descripcion: PAnsiChar;
    monto: PAnsiChar; id_tasa_iva: integer; codigo_interno: PAnsiChar)
    : LongInt; Stdcall;

  type TObtenerRespuestaExtendida = function(numero_campo: LongInt;
    buffer_salida: PAnsiChar; largo_buffer_salida: LongInt;
    largo_final_buffer_salida: LongInt): LongInt; Stdcall;

  type TImprimirTextoLibre = function(descripcion: PAnsiChar): LongInt; Stdcall;


    type TFiscalEpson = class
      private
      dll: THandle;
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

    end;



implementation
     // copiadigital;
  dll := 0;

  // instanciar dll - recordar que se require "uses Windows"

  dll := LoadLibrary('C:\dll\EpsonFiscalInterface.dll');

  // check error
  if dll = 0 then
  begin
    ShowMessage('Error al instanciar DLL');
    Exit;
  end;


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

  @ConsultarNumeroComprobanteUltimo :=
    GetProcAddress(dll, 'ConsultarNumeroComprobanteUltimo');
  if not Assigned(ConsultarNumeroComprobanteUltimo) then
  begin
    ShowMessage('Error al asignar funcion: ConsultarNumerocomprobanteultimo');
    Exit;
  end;

end.

unit uhasar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls,
  FiscalPrinterLib_TLB,Registry, udticket, HasarArgentina_TLB;

Const
  RegKey ='Software\Autofarma\APlus\';

type
  TFhasar = class(TForm)
    HASAR1: THASAR;
    bImprimirX: TButton;
    bEstado: TButton;
    Memo1: TMemo;
    eCom: TEdit;
    Label1: TLabel;
    bImprimirZ: TButton;
    bCambiarFyH: TButton;
    procedure bImprimirXClick(Sender: TObject);
    procedure bEstadoClick(Sender: TObject);
    procedure HASAR1ImpresoraNoResponde(ASender: TObject;
      CantidadReintentos: Integer);
    procedure bImprimirZClick(Sender: TObject);
    procedure bCambiarFyHClick(Sender: TObject);
    procedure HASAR1FaltaPapel(Sender: TObject);
    procedure HASAR1ErrorFiscal(ASender: TObject; Flags: Integer);
    procedure HASAR1ErrorImpresora(ASender: TObject; Flags: Integer);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    Ticket:TTicket;
    hasar2:TImpresoraFiscalRG3561;
  public
    { Public declarations }
     procedure SetTicket(unTicket:TTicket);

  end;

var
  Fhasar: TFhasar;

implementation

{$R *.dfm}


procedure TFhasar.bImprimirXClick(Sender: TObject);
TYPE
  TConsultarVersionDll = function ( descripcion : PChar; descripcion_largo_maximo: LongInt; var mayor : LongInt; var menor : LongInt) : LongInt; StdCall;

  TConfigurarVelocidad = function ( velocidad: LongInt ) : LongInt; StdCall;

  TConfigurarPuerto = function ( velocidad: String ) : LongInt; StdCall;

  TConectar = function () : LongInt; StdCall;

  TImprimirCierreX = function () : LongInt; StdCall;

  TImprimirCierreZ = function () : LongInt; StdCall;

  TDesconectar = function () : LongInt; StdCall;

  tEstablecerEncabezado= function( numero_encabezado: integer;  descripcion: PansiChar ): LongInt; StdCall;

  tAbrirComprobante= function( id_tipo_documento: integer)  : LongInt; StdCall;

  tCerrarComprobante= function()  : LongInt; StdCall;

  tEnviarComando=function ( commando:PansiChar  )  : LongInt; StdCall;

  tConsultarEncabezado=function( numero_encabezado: integer;  respuesta: string ;respuesta_largo_maximo:integer): LongInt; StdCall;

  tEstablecerCola=function( numero_cola: integer;  descripcion: PansiChar ): LongInt; StdCall;

  tCargarTextoExtra=function(descripcion :PansiChar ): LongInt; StdCall;

  TImprimirItem=function(id_modificador : integer; descripcion :Pansichar; cantidad :Pansichar; precio : Pansichar; id_tasa_iva : Integer; ii_id: integer; ii_valor: Pansichar; id_codigo : integer; codigo: Pansichar; codigo_unidad_matrix: Pansichar; código_unidad_medida: integer ):LongInt; StdCall;

  TCargarPago=function(id_modificador: Integer;  codigo_forma_pago:Integer; cantidad_cuotas:Integer; monto : Pansichar;descripción_cupones:Pansichar;descripcion:Pansichar;descripcion_extra1:Pansichar;descripcion_extra2:Pansichar): LongInt; StdCall;

  TConsultarNumeroComprobanteUltimo=function(tipo_de_comprobante: pansichar; respuesta: pansichar; respuesta_largo_maximo: Longint):Longint; StdCall;

  TObtenerRespuesta=function(buffer_salida:pansichar; largo_buffer_salida: integer;largo_final_buffer_salida: integer): LongInt; StdCall;

  TConsultarNumeroComprobanteActual=function( respuesta : pansichar; respuesta_largo_maximo : integer): LongInt; Stdcall;

  TConsultarFechaHora=function(respuesta: pansichar; respuesta_largo_maximo : integer): LongInt; Stdcall;

  TCargarAjuste=function ( id_modificador: integer ; descripcion: pansichar; monto : pansichar ;id_tasa_iva: integer; codigo_interno:pansichar ):Longint; Stdcall;

  TObtenerRespuestaExtendida=function ( numero_campo: longint;buffer_salida: pansichar;largo_buffer_salida : longint; largo_final_buffer_salida: longint ): LongInt; Stdcall;

  TImprimirTextoLibre=function(descripcion : Pansichar ):Longint; Stdcall;

  TCargarDatosCliente=function(nombre_o_razon_social1: pansichar; nombre_o_razon_social2: pansichar; domicilio1: pansichar; domicilio2: pansichar; domicilio3: pansichar; id_tipo_documento: Longint	; numero_documento: pansichar; id_responsabilidad_iva: Longint):Longint; stdcall;

  TCargarComprobanteAsociado=function( descripcion: pansichar ): Longint; Stdcall;
var
fecha: tdate;
numero: string;
com: integer;
ImprimirCierreX: TImprimirCierreX;
ImprimirCierreZ: TImprimirCierreZ;
  ConfigurarVelocidad: TConfigurarVelocidad;
  ConfigurarPuerto: TConfigurarPuerto;
  Conectar: TConectar;
  Desconectar: TDesconectar;
  ConsultarVersionDll: TConsultarVersionDll;
  establecerencabezado: testablecerencabezado;
  ConsultarEncabezado: tConsultarEncabezado;
  abrircomprobante: tabrircomprobante;
  CerrarComprobante: tCerrarComprobante;
  EnviarComando: tEnviarComando;
  EstablecerCola: tEstablecerCola;
  CargarTextoExtra: tCargarTextoExtra;
  ImprimirItem: tImprimirItem;
  CargarPago: TCargarPago;
  ConsultarNumeroComprobanteUltimo: TConsultarNumeroComprobanteUltimo;
  ObtenerRespuesta: TObtenerRespuesta;
  ConsultarNumeroComprobanteActual: TConsultarNumeroComprobanteActual;
  ConsultarFechaHora : TConsultarFechaHora;
  ObtenerRespuestaExtendida: tObtenerRespuestaExtendida;
  Cargarajuste: Tcargarajuste;
  ImprimirTextoLibre: TImprimirTextoLibre;
  CargarDatosCliente: TCargarDatosCliente;
  CargarComprobanteAsociado: TCargarComprobanteAsociado;
dll  : THandle;
  error : LongInt;
  str : Array[0..200] of Char;
  mayor : LongInt;
  menor : LongInt;
  mychar: char;
  comando: Array[0..200] of AnsiChar;
  texto: string;


begin
 if ticket.fiscal='H' then
 BEGIN
      if ticket.ifh<>'2' then
        begin
        com:=strtoint(eCom.Text);
        hasar1.finalizar;
        Hasar1.Puerto:= com;
        hasar1.Comenzar;
        hasar1.BorrarFantasiaEncabezadoCola(true,true,true);
        hasar1.CancelarComprobanteFiscal;
        hasar1.TratarDeCancelarTodo;

        hasar1.ReporteX;
        fecha:=hasar1.FechaHoraFiscal;
        numero:=inttostr(hasar1.UltimoDocumentoFiscalBC);
        hasar1.finalizar;
        END;

      if ticket.ifh='2' then
          begin
          hasar2:=TImpresoraFiscalRG3561.Create(self);
          hasar2.Conectar(ticket.ipfiscal,80,4000,4000);
          hasar2.CerrarJornadaFiscal(ReporteX);
          hasar2.DestroyComponents;
          hasar2.DisposeOf;
          end;
 END;
 if ticket.fiscal='E' then
 BEGIN
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

        @AbrirComprobante := GetProcAddress(dll, 'AbrirComprobante');
        if not Assigned(AbrirComprobante) then
        begin
          ShowMessage('Error al asignar funcion: AbrirComprobante');
          Exit;
        end;
         @CerrarComprobante := GetProcAddress(dll, 'CerrarComprobante');
        if not Assigned(AbrirComprobante) then
        begin
          ShowMessage('Error al asignar funcion: CerrarComprobante');
          Exit;
        end;
           @Establecerencabezado := GetProcAddress(dll, 'EstablecerEncabezado');
        if not Assigned(AbrirComprobante) then
        begin
          ShowMessage('Error al asignar funcion: CerrarComprobante');
          Exit;
        end;
            @ConsultarEncabezado:= GetProcAddress(dll, 'EstablecerEncabezado');
        if not Assigned(AbrirComprobante) then
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

               @ConsultarNumeroComprobanteActual := GetProcAddress(dll, 'ConsultarNumeroComprobanteActual');
        if not Assigned(ConsultarNumeroComprobanteActual) then
        begin
          ShowMessage('Error al asignar funcion: ConsultarNumeroComprobanteActual');
          Exit;
        end;
                 @Consultarfechahora := GetProcAddress(dll, 'Consultarfechahora');
        if not Assigned(ConsultarNumeroComprobanteActual) then
        begin
          ShowMessage('Error al asignar funcion: Consultarfechahora');
          Exit;
        end;

                   @ObtenerRespuestaExtendida:= GetProcAddress(dll, 'ObtenerRespuestaExtendida');
        if not Assigned(ObtenerRespuestaExtendida) then
        begin
          ShowMessage('Error al asignar funcion: ObtenerRespuestaExtendida');
          Exit;
        end;
                     @CargarAjuste:= GetProcAddress(dll, 'CargarAjuste');
        if not Assigned(Cargarajuste) then
        begin
          ShowMessage('Error al asignar funcion: CargarAjuste');
          Exit;
        end;

                  @ImprimirTextoLibre:= GetProcAddress(dll, 'ImprimirTextoLibre');
          if not Assigned(ImprimirTextoLibre) then
        begin
          ShowMessage('Error al asignar funcion: ImprimirTextoLibre');
          Exit;
        end;


        mayor := 0;
        menor := 0;
        mychar:=' ';
        error := ConsultarVersionDll( str, 100, mayor, menor );
        error := ConfigurarVelocidad( 9600 );
        error := ConfigurarPuerto( ticket.puerto_com );
        error := CerrarComprobante();
        error := Conectar();
        comando:='';
        texto:=strpcopy(comando,'0802|0C21') ;
        error :=enviarcomando(@comando[0]);


        error := Desconectar();
        FreeLibrary(dll);


END;



end;

procedure TFhasar.bEstadoClick(Sender: TObject);
TYPE
  TConsultarVersionDll = function ( descripcion : PChar; descripcion_largo_maximo: LongInt; var mayor : LongInt; var menor : LongInt) : LongInt; StdCall;

  TConfigurarVelocidad = function ( velocidad: LongInt ) : LongInt; StdCall;

  TConfigurarPuerto = function ( velocidad: String ) : LongInt; StdCall;

  TConectar = function () : LongInt; StdCall;

  TImprimirCierreX = function () : LongInt; StdCall;

  TImprimirCierreZ = function () : LongInt; StdCall;

  TDesconectar = function () : LongInt; StdCall;

  tEstablecerEncabezado= function( numero_encabezado: integer;  descripcion: PansiChar ): LongInt; StdCall;

  tAbrirComprobante= function( id_tipo_documento: integer)  : LongInt; StdCall;

  tCerrarComprobante= function()  : LongInt; StdCall;

  tEnviarComando=function ( commando:PansiChar  )  : LongInt; StdCall;

  tConsultarEncabezado=function( numero_encabezado: integer;  respuesta: string ;respuesta_largo_maximo:integer): LongInt; StdCall;

  tEstablecerCola=function( numero_cola: integer;  descripcion: PansiChar ): LongInt; StdCall;

  tCargarTextoExtra=function(descripcion :PansiChar ): LongInt; StdCall;

  TImprimirItem=function(id_modificador : integer; descripcion :Pansichar; cantidad :Pansichar; precio : Pansichar; id_tasa_iva : Integer; ii_id: integer; ii_valor: Pansichar; id_codigo : integer; codigo: Pansichar; codigo_unidad_matrix: Pansichar; código_unidad_medida: integer ):LongInt; StdCall;

  TCargarPago=function(id_modificador: Integer;  codigo_forma_pago:Integer; cantidad_cuotas:Integer; monto : Pansichar;descripción_cupones:Pansichar;descripcion:Pansichar;descripcion_extra1:Pansichar;descripcion_extra2:Pansichar): LongInt; StdCall;

  TConsultarNumeroComprobanteUltimo=function(tipo_de_comprobante: pansichar; respuesta: pansichar; respuesta_largo_maximo: Longint):Longint; StdCall;

  TObtenerRespuesta=function(buffer_salida:pansichar; largo_buffer_salida: integer;largo_final_buffer_salida: integer): LongInt; StdCall;

  TConsultarNumeroComprobanteActual=function( respuesta : pansichar; respuesta_largo_maximo : integer): LongInt; Stdcall;

  TConsultarFechaHora=function(respuesta: pansichar; respuesta_largo_maximo : integer): LongInt; Stdcall;

  TCargarAjuste=function ( id_modificador: integer ; descripcion: pansichar; monto : pansichar ;id_tasa_iva: integer; codigo_interno:pansichar ):Longint; Stdcall;

  TObtenerRespuestaExtendida=function ( numero_campo: longint;buffer_salida: pansichar;largo_buffer_salida : longint; largo_final_buffer_salida: longint ): LongInt; Stdcall;

  TImprimirTextoLibre=function(descripcion : Pansichar ):Longint; Stdcall;

  TCargarDatosCliente=function(nombre_o_razon_social1: pansichar; nombre_o_razon_social2: pansichar; domicilio1: pansichar; domicilio2: pansichar; domicilio3: pansichar; id_tipo_documento: Longint	; numero_documento: pansichar; id_responsabilidad_iva: Longint):Longint; stdcall;

  TCargarComprobanteAsociado=function( descripcion: pansichar ): Longint; Stdcall;

var
estado: string;
estadocodigo: string;
FECHA: TDATE;
NUMEROB: STRING;
NUMEROA: STRING;
com: integer;
respuesta: respuestaconsultarestado;
ImprimirCierreX: TImprimirCierreX;
ImprimirCierreZ: TImprimirCierreZ;
  ConfigurarVelocidad: TConfigurarVelocidad;
  ConfigurarPuerto: TConfigurarPuerto;
  Conectar: TConectar;
  Desconectar: TDesconectar;
  ConsultarVersionDll: TConsultarVersionDll;
  establecerencabezado: testablecerencabezado;
  ConsultarEncabezado: tConsultarEncabezado;
  abrircomprobante: tabrircomprobante;
  CerrarComprobante: tCerrarComprobante;
  EnviarComando: tEnviarComando;
  EstablecerCola: tEstablecerCola;
  CargarTextoExtra: tCargarTextoExtra;
  ImprimirItem: tImprimirItem;
  CargarPago: TCargarPago;
  ConsultarNumeroComprobanteUltimo: TConsultarNumeroComprobanteUltimo;
  ObtenerRespuesta: TObtenerRespuesta;
  ConsultarNumeroComprobanteActual: TConsultarNumeroComprobanteActual;
  ConsultarFechaHora : TConsultarFechaHora;
  ObtenerRespuestaExtendida: tObtenerRespuestaExtendida;
  Cargarajuste: Tcargarajuste;
  ImprimirTextoLibre: TImprimirTextoLibre;
  CargarDatosCliente: TCargarDatosCliente;
  CargarComprobanteAsociado: TCargarComprobanteAsociado;
dll  : THandle;
  error : LongInt;
  str : Array[0..200] of Char;
  mayor : LongInt;
  menor : LongInt;
  mychar: char;
  ip:string;
  ipw:widestring;
  tespera: olevariant;
  tcomandos: olevariant;


begin
    if ticket.fiscal='H' then
    BEGIN
    if ticket.ifh<>'2' then
    begin

      bEstado.Enabled:=false;
      com:=strtoint(eCom.Text);
      memo1.Lines.Add('Comprobando estado de fiscal hasar');
      memo1.Lines.Add('----------------------------------------------------');
      bEstado.Enabled:=false;
      hasar1.finalizar;
      Hasar1.Puerto:= com;

      Hasar1.Comenzar;
      HASAR1.CancelarComprobanteFiscal;
      hasar1.PedidoDeStatus;


      memo1.Lines.Add('Tratando de cancelar todo');
      estado:=hasar1.DescripcionEstadoControlador;

      memo1.Lines.Add(estado);
      fecha:=hasar1.FechaHoraFiscal;
      memo1.Lines.Add('Fecha fiscal: '+datetostr(fecha));
      numeroB:=inttostr(hasar1.UltimoDocumentoFiscalBC);
      memo1.Lines.Add('Ultimo numero comprobante B: '+ numerob);
      NUMEROA:=INTTOSTR(hasar1.UltimoDocumentoFiscalA);
      memo1.Lines.Add('Ultimo numero comprobante A: '+ numeroa);
      hasar1.finalizar;
      if estado='No hay ningún comprobante abierto' then
       BEGIN
         bImprimirZ.Enabled:=TRUE;
         bImprimirX.Enabled:=TRUE;
         bCambiarFyH.Enabled:=TRUE;
         bEstado.Enabled:=true;
       END;
         if estado<>'No hay ningún comprobante abierto' then
       BEGIN
         bImprimirZ.Enabled:=False;
         bImprimirX.Enabled:=False;
         bCambiarFyH.Enabled:=False;
         bEstado.Enabled:=true;
       END;
    end;
    if ticket.ifh='2' then
    begin
      hasar2:=TImpresoraFiscalRG3561.Create(self);
      ip:= ticket.ipfiscal;
      tespera:=14000;
      tcomandos:=14000;
      ipw:=ip;

      hasar2.Conectar(ip,80,tespera,tcomandos);
   //   hasar2.archivoRegistro('C:\hasar\ConsoleApplication1.log',32000);

      if hasar2.ObtenerUltimoEstadoFiscal.DocumentoAbierto=true then
      begin
      hasar2.CerrarDocumento(0,'maximiliano.guzman@autofarma.net');
      end;
      memo1.Lines.Add('Comprobando estado de fiscal hasar');
      memo1.Lines.Add('----------------------------------------------------');


      memo1.Lines.Add('Todo ok');
      memo1.Lines.Add('----------------------------------------------------');
        if hasar2.ObtenerUltimoEstadoFiscal.DocumentoAbierto=false then
        begin
           bImprimirZ.Enabled:=TRUE;
           bImprimirX.Enabled:=TRUE;
           bCambiarFyH.Enabled:=TRUE;
           bEstado.Enabled:=true;
         END;
        if hasar2.ObtenerUltimoEstadoFiscal.DocumentoAbierto=true then
        begin
           bImprimirZ.Enabled:=False;
           bImprimirX.Enabled:=False;
           bCambiarFyH.Enabled:=False;
           bEstado.Enabled:=true;
         END;
         hasar2.DestroyComponents;
          hasar2.DisposeOf;
    end;



    end;
    if ticket.fiscal='E' then
    begin

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

        @AbrirComprobante := GetProcAddress(dll, 'AbrirComprobante');
        if not Assigned(AbrirComprobante) then
        begin
          ShowMessage('Error al asignar funcion: AbrirComprobante');
          Exit;
        end;
         @CerrarComprobante := GetProcAddress(dll, 'CerrarComprobante');
        if not Assigned(AbrirComprobante) then
        begin
          ShowMessage('Error al asignar funcion: CerrarComprobante');
          Exit;
        end;
           @Establecerencabezado := GetProcAddress(dll, 'EstablecerEncabezado');
        if not Assigned(AbrirComprobante) then
        begin
          ShowMessage('Error al asignar funcion: CerrarComprobante');
          Exit;
        end;
            @ConsultarEncabezado:= GetProcAddress(dll, 'EstablecerEncabezado');
        if not Assigned(AbrirComprobante) then
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

               @ConsultarNumeroComprobanteActual := GetProcAddress(dll, 'ConsultarNumeroComprobanteActual');
        if not Assigned(ConsultarNumeroComprobanteActual) then
        begin
          ShowMessage('Error al asignar funcion: ConsultarNumeroComprobanteActual');
          Exit;
        end;
                 @Consultarfechahora := GetProcAddress(dll, 'Consultarfechahora');
        if not Assigned(ConsultarNumeroComprobanteActual) then
        begin
          ShowMessage('Error al asignar funcion: Consultarfechahora');
          Exit;
        end;

                   @ObtenerRespuestaExtendida:= GetProcAddress(dll, 'ObtenerRespuestaExtendida');
        if not Assigned(ObtenerRespuestaExtendida) then
        begin
          ShowMessage('Error al asignar funcion: ObtenerRespuestaExtendida');
          Exit;
        end;
                     @CargarAjuste:= GetProcAddress(dll, 'CargarAjuste');
        if not Assigned(Cargarajuste) then
        begin
          ShowMessage('Error al asignar funcion: CargarAjuste');
          Exit;
        end;

                  @ImprimirTextoLibre:= GetProcAddress(dll, 'ImprimirTextoLibre');
          if not Assigned(ImprimirTextoLibre) then
        begin
          ShowMessage('Error al asignar funcion: ImprimirTextoLibre');
          Exit;
        end;

        mayor := 0;
        menor := 0;
        mychar:=' ';
        error := ConsultarVersionDll( @str[0], 100, mayor, menor );
        error := ConfigurarVelocidad( 9600 );
        error := ConfigurarPuerto( ticket.puerto_com );
        error := CerrarComprobante();
        error := Conectar();
        error := Desconectar();
        FreeLibrary(dll);


        if error= 0 then
        begin
           bImprimirZ.Enabled:=TRUE;
           bImprimirX.Enabled:=TRUE;
           bCambiarFyH.Enabled:=TRUE;
           bEstado.Enabled:=true;
           memo1.Lines.Add('TODO OK FISCAL EPSON CONECTADO');
        end;
        if error<>0 then
        BEGIN
          memo1.Lines.Add('ERROR FISCAL EPSON DESCONECTADO');
           bImprimirZ.Enabled:=FALSE;
           bImprimirX.Enabled:=FALSE;
           bCambiarFyH.Enabled:=FALSE;
           bEstado.Enabled:=FALSE;
        END;





    end;

end;

procedure TFhasar.bImprimirZClick(Sender: TObject);
TYPE
  TConsultarVersionDll = function ( descripcion : PChar; descripcion_largo_maximo: LongInt; var mayor : LongInt; var menor : LongInt) : LongInt; StdCall;

  TConfigurarVelocidad = function ( velocidad: LongInt ) : LongInt; StdCall;

  TConfigurarPuerto = function ( velocidad: String ) : LongInt; StdCall;

  TConectar = function () : LongInt; StdCall;

  TImprimirCierreX = function () : LongInt; StdCall;

  TImprimirCierreZ = function () : LongInt; StdCall;

  TDesconectar = function () : LongInt; StdCall;

  tEstablecerEncabezado= function( numero_encabezado: integer;  descripcion: PansiChar ): LongInt; StdCall;

  tAbrirComprobante= function( id_tipo_documento: integer)  : LongInt; StdCall;

  tCerrarComprobante= function()  : LongInt; StdCall;

  tEnviarComando=function ( commando:PansiChar  )  : LongInt; StdCall;

  tConsultarEncabezado=function( numero_encabezado: integer;  respuesta: string ;respuesta_largo_maximo:integer): LongInt; StdCall;

  tEstablecerCola=function( numero_cola: integer;  descripcion: PansiChar ): LongInt; StdCall;

  tCargarTextoExtra=function(descripcion :PansiChar ): LongInt; StdCall;

  TImprimirItem=function(id_modificador : integer; descripcion :Pansichar; cantidad :Pansichar; precio : Pansichar; id_tasa_iva : Integer; ii_id: integer; ii_valor: Pansichar; id_codigo : integer; codigo: Pansichar; codigo_unidad_matrix: Pansichar; código_unidad_medida: integer ):LongInt; StdCall;

  TCargarPago=function(id_modificador: Integer;  codigo_forma_pago:Integer; cantidad_cuotas:Integer; monto : Pansichar;descripción_cupones:Pansichar;descripcion:Pansichar;descripcion_extra1:Pansichar;descripcion_extra2:Pansichar): LongInt; StdCall;

  TConsultarNumeroComprobanteUltimo=function(tipo_de_comprobante: pansichar; respuesta: pansichar; respuesta_largo_maximo: Longint):Longint; StdCall;

  TObtenerRespuesta=function(buffer_salida:pansichar; largo_buffer_salida: integer;largo_final_buffer_salida: integer): LongInt; StdCall;

  TConsultarNumeroComprobanteActual=function( respuesta : pansichar; respuesta_largo_maximo : integer): LongInt; Stdcall;

  TConsultarFechaHora=function(respuesta: pansichar; respuesta_largo_maximo : integer): LongInt; Stdcall;

  TCargarAjuste=function ( id_modificador: integer ; descripcion: pansichar; monto : pansichar ;id_tasa_iva: integer; codigo_interno:pansichar ):Longint; Stdcall;

  TObtenerRespuestaExtendida=function ( numero_campo: longint;buffer_salida: pansichar;largo_buffer_salida : longint; largo_final_buffer_salida: longint ): LongInt; Stdcall;

  TImprimirTextoLibre=function(descripcion : Pansichar ):Longint; Stdcall;

  TCargarDatosCliente=function(nombre_o_razon_social1: pansichar; nombre_o_razon_social2: pansichar; domicilio1: pansichar; domicilio2: pansichar; domicilio3: pansichar; id_tipo_documento: Longint	; numero_documento: pansichar; id_responsabilidad_iva: Longint):Longint; stdcall;

  TCargarComprobanteAsociado=function( descripcion: pansichar ): Longint; Stdcall;
var
fecha: tdate;
numero: string;
com: integer;ImprimirCierreX: TImprimirCierreX;
ImprimirCierreZ: TImprimirCierreZ;
  ConfigurarVelocidad: TConfigurarVelocidad;
  ConfigurarPuerto: TConfigurarPuerto;
  Conectar: TConectar;
  Desconectar: TDesconectar;
  ConsultarVersionDll: TConsultarVersionDll;
  establecerencabezado: testablecerencabezado;
  ConsultarEncabezado: tConsultarEncabezado;
  abrircomprobante: tabrircomprobante;
  CerrarComprobante: tCerrarComprobante;
  EnviarComando: tEnviarComando;
  EstablecerCola: tEstablecerCola;
  CargarTextoExtra: tCargarTextoExtra;
  ImprimirItem: tImprimirItem;
  CargarPago: TCargarPago;
  ConsultarNumeroComprobanteUltimo: TConsultarNumeroComprobanteUltimo;
  ObtenerRespuesta: TObtenerRespuesta;
  ConsultarNumeroComprobanteActual: TConsultarNumeroComprobanteActual;
  ConsultarFechaHora : TConsultarFechaHora;
  ObtenerRespuestaExtendida: tObtenerRespuestaExtendida;
  Cargarajuste: Tcargarajuste;
  ImprimirTextoLibre: TImprimirTextoLibre;
  CargarDatosCliente: TCargarDatosCliente;
  CargarComprobanteAsociado: TCargarComprobanteAsociado;
dll  : THandle;
  error : LongInt;
  str : Array[0..200] of Char;
  mayor : LongInt;
  menor : LongInt;
  mychar: char;
  comando: Array[0..200] of AnsiChar;
  texto: string;







begin
if ticket.fiscal='H' then
BEGIN
        if ticket.ifh<>'2' then
            begin
             com:=strtoint(eCom.Text);
            hasar1.finalizar;
            Hasar1.Puerto:= com;
            hasar1.Comenzar;
            hasar1.BorrarFantasiaEncabezadoCola(true,true,true);
            hasar1.CancelarComprobanteFiscal;
            hasar1.TratarDeCancelarTodo;

            hasar1.ReporteZ;
            fecha:=hasar1.FechaHoraFiscal;
            numero:=inttostr(hasar1.UltimoDocumentoFiscalBC);
            hasar1.finalizar;
        end;
      if ticket.ifh='2' then
          begin
          hasar2:=TImpresoraFiscalRG3561.Create(self);
          hasar2.Conectar(ticket.ipfiscal,80,4000,4000);
          hasar2.CerrarJornadaFiscal(ReporteZ);
          hasar2.DestroyComponents;
          hasar2.DisposeOf;
          end;
END;
if ticket.fiscal='E' then
BEGIN
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

  @AbrirComprobante := GetProcAddress(dll, 'AbrirComprobante');
  if not Assigned(AbrirComprobante) then
  begin
    ShowMessage('Error al asignar funcion: AbrirComprobante');
    Exit;
  end;
   @CerrarComprobante := GetProcAddress(dll, 'CerrarComprobante');
  if not Assigned(AbrirComprobante) then
  begin
    ShowMessage('Error al asignar funcion: CerrarComprobante');
    Exit;
  end;
     @Establecerencabezado := GetProcAddress(dll, 'EstablecerEncabezado');
  if not Assigned(AbrirComprobante) then
  begin
    ShowMessage('Error al asignar funcion: CerrarComprobante');
    Exit;
  end;
      @ConsultarEncabezado:= GetProcAddress(dll, 'EstablecerEncabezado');
  if not Assigned(AbrirComprobante) then
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

         @ConsultarNumeroComprobanteActual := GetProcAddress(dll, 'ConsultarNumeroComprobanteActual');
  if not Assigned(ConsultarNumeroComprobanteActual) then
  begin
    ShowMessage('Error al asignar funcion: ConsultarNumeroComprobanteActual');
    Exit;
  end;
           @Consultarfechahora := GetProcAddress(dll, 'Consultarfechahora');
  if not Assigned(ConsultarNumeroComprobanteActual) then
  begin
    ShowMessage('Error al asignar funcion: Consultarfechahora');
    Exit;
  end;

             @ObtenerRespuestaExtendida:= GetProcAddress(dll, 'ObtenerRespuestaExtendida');
  if not Assigned(ObtenerRespuestaExtendida) then
  begin
    ShowMessage('Error al asignar funcion: ObtenerRespuestaExtendida');
    Exit;
  end;
               @CargarAjuste:= GetProcAddress(dll, 'CargarAjuste');
  if not Assigned(Cargarajuste) then
  begin
    ShowMessage('Error al asignar funcion: CargarAjuste');
    Exit;
  end;

            @ImprimirTextoLibre:= GetProcAddress(dll, 'ImprimirTextoLibre');
    if not Assigned(ImprimirTextoLibre) then
  begin
    ShowMessage('Error al asignar funcion: ImprimirTextoLibre');
    Exit;
  end;


        mayor := 0;
        menor := 0;
        mychar:=' ';
        error := ConsultarVersionDll( str, 100, mayor, menor );
        error := ConfigurarVelocidad( 9600 );
        error := ConfigurarPuerto( ticket.puerto_com );
        error := CerrarComprobante();
        error := Conectar();
        comando:='';
        texto:=strpcopy(comando,'0801|0C00') ;
        error :=enviarcomando(@comando[0]);


        error := Desconectar();
        FreeLibrary(dll);


END;

end;

procedure TFhasar.bCambiarFyHClick(Sender: TObject);
var
com: integer;
tiempo: string;
fecha: string;

begin
if ticket.ifh<>'2' then
  begin
  com:=strtoint(eCom.Text);
  hasar1.finalizar;
  Hasar1.Puerto:= com;
  hasar1.Comenzar;
  hasar1.BorrarFantasiaEncabezadoCola(true,true,true);
  hasar1.CancelarComprobanteFiscal;
  hasar1.TratarDeCancelarTodo;
  hasar1.ReporteZ;
  hasar1.FechaHoraFiscal:=now;
  end;
if ticket.ifh='2' then
  begin
   hasar2:=TImpresoraFiscalRG3561.Create(self);
   hasar2.Conectar(ticket.ipfiscal,80,4000,4000);
   hasar2.CerrarJornadaFiscal(ReporteZ);
   fecha:=DateToStr(now);
   tiempo:=TimeToStr(now);

   hasar2.ConfigurarFechaHora(strtodatetime(fecha),strtodatetime(tiempo));




    hasar2.DestroyComponents;
    hasar2.DisposeOf;

  end;
end;

procedure TFhasar.FormShow(Sender: TObject);
var
reg: tregistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);
  eCom.Text:=Reg.ReadString('com');

end;

procedure TFhasar.HASAR1ErrorFiscal(ASender: TObject; Flags: Integer);
begin
MEMO1.Text:=hasar1.DescripcionEstadoControlador;
end;

procedure TFhasar.HASAR1ErrorImpresora(ASender: TObject; Flags: Integer);
begin
MEMO1.Text:=hasar1.DescripcionEstadoControlador;
end;

procedure TFhasar.HASAR1FaltaPapel(Sender: TObject);
begin
showmessage('REVISAR PAPEL DE LA IMPRESORA');
end;

procedure TFhasar.HASAR1ImpresoraNoResponde(ASender: TObject;
  CantidadReintentos: Integer);
begin
showmessage('IMPRESORA DESCONECTADA');
end;

procedure tfhasar.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;

end;

end.

unit UIMPRESION;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls,
  System.Win.ComObj,
  FiscalPrinterLib_TLB, udmfacturador, udticket, System.Types, math, uprogreso,
  printers,
  Vcl.Buttons, Xml.xmldom, Xml.XMLIntf,  Xml.xmldoc,
  msxmldom,  uadicionales, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, HasarArgentina_TLB, registry, httpapp, uImpresorEtiquetas,uUtils,
  IdStack,StrUtils,uFiscalEpson;

const
  UM_ACTIVATED = WM_USER + 1;

type

  TCuponPromo = record
    rubros: TArray<string>;
    laboratorios: TArray<string>;
    fecha_desde:string;
    fecha_hasta:string;
    cant_cupones:integer;
    gastoPorRubro:Double;
    gastoPorRubroCuponExtra:Double;

  end;
  TFIMPRESION = class(TForm)
    mimpresion: TMemo;
    HASAR: THASAR;

    Bcancelar: TBitBtn;
    IdHTTP: TIdHTTP;
    idhttpcambios: TIdHTTP;
    procedure FormShow(Sender: TObject);
    procedure mimpresionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    imp_efectivo: string;
    imp_tarjeta: string;
    imp_cc: string;
    imp_co1: string;
    imp_co2: string;
    imp_ch: string;
    imp_os: string;
    imp_farmacoins: string;
    imp_gentilezas: string;
    nro_comprob: integer;
    nro_comprobdigital: integer;
    imp_aplus: string;
    impreEtiqueta:TImpresorEtiqueta;
    fiscalEpson:TFiscalEpson;
    atTexto:AtributosDeTexto;
    function existeTextoEnArreglo(texto:string; arrTexto:TArray<string>):boolean;
    function esGastoMayorQuePromoRubro(dineroGastadoPorRubro, dineroPromocionPorRubro: Double): Boolean;
    procedure inicializarCuponPromo(cuponPromo:TCuponPromo);
    function tieneCuponExtraPorRubro(cuponPromo:TCuponPromo;totalRubro:Double): Boolean;

  public
    vendedor: string;
    pv: string;
    producto: string;
    preciounitario: double;
    total: double;
    cantidad: integer;
    Ticket: TTicket;
    hasar2: TImpresoraFiscalRG3561;
    cupon: string;
    // sumafarmacia: double;

    procedure setEfectivo(importe: String);
    procedure setTarjeta(importe: String);
    procedure setos(importe: String);
    procedure setcc(importe: String);
    procedure setch(importe: String);
    procedure setco1(importe: String);
    procedure setco2(importe: String);
    procedure setgentilezas(importe: String);
    procedure setFARMACOINS(importe: String);
    procedure setaplus(importe: String);
    procedure Insertarcomprobante;
    procedure Insertarcomprobantevale;
    procedure SetTicket(unTicket: TTicket);
    procedure ImprimirTicketA(var Imprimio: boolean);
    procedure ImprimirTicketB(var Imprimio: boolean);
    procedure ImprimirTicketT(var Imprimio: boolean);
    procedure ImprimirTicketT2(var Imprimio: boolean);
    procedure ImprimirTicket2A(var Imprimio: boolean);
    procedure ImprimirTicket2B(var Imprimio: boolean);

    procedure ImprimirTicketTepson(var Imprimio: boolean);
    procedure ImprimirTicketBepson(var Imprimio: boolean);
    procedure ImprimirTicketAepson(var Imprimio: boolean);
    procedure copiadigital;
    procedure ventaxempleado;
    procedure setcuponusado;
    procedure nrocomprobante;
    procedure generarcuponoferta(oferta: string);
    function ComenzarFiscal: boolean;
    procedure voucher;
    procedure UMActivated(var Message: TMessage); message UM_ACTIVATED;
    procedure modificacion;
    procedure farmacoins;
    procedure consultafarmacoins;
    procedure validarPromo(ticket:TTicket;atTexto:AtributosDeTexto;cuponPromo:TCuponPromo);
    procedure cargarPromos(ticket:TTicket;atTexto:AtributosDeTexto);
    procedure imprimirCuponPromocion(ticket:TTicket;atTexto:AtributosDeTexto);
  end;

var
  FIMPRESION: TFIMPRESION;
  inserciontk: string;
  insercionvr: string;

implementation

{$R *.dfm}

uses
  facturador, Uticket;









function LeftPad(S: string; Ch: Char; Len: integer): string;
var
  RestLen: integer;
begin
  Result := S;
  RestLen := Len - Length(S);
  if RestLen < 1 then
    Exit;
  Result := S + StringOfChar(Ch, RestLen);
end;

function URLEncode(S: string): string;
var
  i: integer;
  source: PAnsiChar;
begin
  Result := '';
  source := PAnsiChar(S);
  for i := 1 to Length(source) do
    if not(source[i - 1] in ['A' .. 'Z', 'a' .. 'z', '0' .. '9', '-', '_', '~',
      '.', ':', '/']) then
      Result := Result + '%' + inttohex(ord(source[i - 1]), 2)
    else
      Result := Result + source[i - 1];
  URLEncode := Result;
end;

Function GetImpresora(Impre: String): integer;
Var
  nCont: integer;
  lSearch: boolean;
  cNewLIne: String;
begin
  lSearch := False;
  cNewLIne := Chr(10) + Chr(13);

  For nCont := 0 to Printer.printers.Count - 1 do
  // buscamos la impresora en la lista del sistema
  begin

    if Pos(Impre, Printer.printers[nCont]) <> 0 then
    begin
      lSearch := True;
      Result := nCont;
      Break;
    end;

  end;

  if lSearch = False then
  begin
    ShowMessage('Impresora no encontrada.' + Impre + cNewLIne +
      'Se utilizará la predeterminda.');
    Result := -1
  end;

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

function cadLongitudFija(cadena: string; longitud: integer;
  posicionIzquierda: boolean; valorRelleno: string): string;
var
  i: integer;
begin
  if Length(cadena) > longitud then
    cadena := copy(cadena, 1, longitud)
  else
  begin
    for i := 1 to longitud - Length(cadena) do
      if posicionIzquierda then
        cadena := valorRelleno + cadena
      else
        cadena := cadena + valorRelleno;
  end;
  Result := cadena;
end;

function TFIMPRESION.ComenzarFiscal: boolean;
var
  i: integer;
  respuesta: respuestaconsultarestado;
begin

  Try
    if Ticket.ifh <> '2' then
    begin
      if Ticket.fiscal = 'H' then
      BEGIN
        with HASAR do
        begin
          Puerto := strtoint(Ticket.puerto_com);
          Transporte := PUERTO_SERIE;
          PrecioBase := False;
          DescripcionesLargas := True;
          Reintentos := 3;
          TiempoDeEspera := 2000;
        end;
        HASAR.Comenzar;

        ComenzarFiscal := True;

        i := 0;

        nro_comprobdigital := (strtoint(HASAR.respuesta[3])) + 1;

      END;
    end;
    if Ticket.ifh = '2' then
    begin
      respuesta := hasar2.ConsultarEstado(tique);
      nro_comprobdigital := respuesta.NumeroUltimoComprobante + 1;
      ComenzarFiscal := True;
    end;

    copiadigital;

  Except

    on E: EOleException do
    Begin
      ComenzarFiscal := False;
    End;
  End;
end;



//------------------ CODIGO REFACTORIZADO ---------------------------//

procedure TFIMPRESION.inicializarCuponPromo(cuponPromo:TCuponPromo);
begin
   cuponPromo.rubros:= [];
   cuponPromo.laboratorios:= [];
   cuponPromo.fecha_desde:= '';
   cuponPromo.fecha_hasta:='' ;
   cuponPromo.cant_cupones:= 2;
   cuponPromo.gastoPorRubro:=0;
   cuponPromo.gastoPorRubroCuponExtra:=0;

end;

function TFIMPRESION.tieneCuponExtraPorRubro(cuponPromo:TCuponPromo;totalRubro:Double): Boolean;
begin
    Result:= (cuponPromo.gastoPorRubroCuponExtra >0) and (cuponPromo.gastoPorRubroCuponExtra <= totalRubro);
end;

function TFIMPRESION.esGastoMayorQuePromoRubro(dineroGastadoPorRubro, dineroPromocionPorRubro: Double): Boolean;
begin
 Result:= dineroGastadoPorRubro > dineroPromocionPorRubro;
end;



function TFIMPRESION.existeTextoEnArreglo(texto:string; arrTexto:TArray<string>):boolean;
var
 i:integer;
 encontrado:Boolean;
begin
   encontrado:= False;

     for i := 0 to Length(arrTexto) - 1 do
        begin
          if arrTexto[i] = texto then
          begin
            encontrado := True;
              Break; // Si lo encontramos, salimos del bucle.
          end;
    end;


   Result:= encontrado;

end;

procedure TFIMPRESION.imprimirCuponPromocion(ticket:TTicket;atTexto:AtributosDeTexto);
var
  nro_tk:string;
begin

    if nro_comprob = 0 then
    begin
        nro_tk:= ticket.fiscla_pv + ': '+ ticket.fiscla_pv + (RightPad(inttostr(  nro_comprobdigital), '0', 8));
    end
    else
      begin
             nro_tk:= ticket.fiscla_pv + ': '+ ticket.fiscla_pv + (RightPad(inttostr(  nro_comprob), '0', 8));
    end;






    {Si usa modulo de impresor genere el cupon en la etiquetadora}
    if ticket.fiscal = 'E' then
    begin

      impreEtiqueta.imprimirCuponPromo(nro_tk, Ticket.nom_vendedor,Ticket.DESCRIPCIONCLIENTE,Ticket.dni,Ticket.telefono);

    end;

    if ticket.fiscal = 'H' then
     begin
          atTexto.DobleAncho := True;
          atTexto.Negrita := True;
          atTexto.Centrado := True;
          hasar2.AbrirDocumento(Generico);

          hasar2.ImprimirTextoGenerico(atTexto,'---- CUPON VALIDO PARA PARTICIPAR PROMO ------- ', DisplayNO);

          atTexto.DobleAncho := False;
          atTexto.Negrita := False;
          atTexto.Centrado := False;
          // ----------//
          hasar2.ImprimirTextoGenerico(atTexto, 'Vendedor:' + Ticket.nom_vendedor,DisplayNO);
          hasar2.ImprimirTextoGenerico(atTexto, 'Participante: ' + Ticket.DESCRIPCIONCLIENTE,DisplayNO);
          hasar2.ImprimirTextoGenerico(atTexto, 'DNI: ' + Ticket.dni,DisplayNO);
          hasar2.ImprimirTextoGenerico(atTexto, 'TELEFONO: ' + Ticket.telefono,DisplayNO);
          // ---------//
          hasar2.ImprimirTextoGenerico(atTexto, 'NRO TICKET: ' + nro_tk,DisplayNO);

          atTexto.DobleAncho := True;
          atTexto.Negrita := True;
          atTexto.Centrado := True;
          hasar2.ImprimirTextoGenerico(atTexto,'---- CUPON VALIDO PARA PARTICIPAR PROMO ------- ', DisplayNO);
          atTexto.DobleAncho := False;
          atTexto.Negrita := False;
          atTexto.Centrado := False;
          hasar2.CerrarDocumento(0, 'maximiliano.guzman@autofarma.net');
     end;
end;


procedure TFIMPRESION.validarPromo(ticket:TTicket;atTexto:AtributosDeTexto;cuponPromo:TCuponPromo);
var
ENTRAPROMO:string;
ENTRAPROMODOBLE:string;
TOTALRUBRO:double;
RUBRO:string;
LABORATORIO:string;
cuponImpreso: boolean;
cantCuponImpreso: Integer;
begin
    cuponImpreso:=False;
    ENTRAPROMO:='N';
    ENTRAPROMODOBLE:='N';
    TOTALRUBRO:=0;

    cantCuponImpreso:=0;
    ffacturador.Gfacturador.DataSource.DataSet.First;

       {Si se encuentra en el rango de fehas usar la oferta }
    if TFechaUtils.EstaFechaDentroDelRango(cuponPromo.fecha_desde,cuponPromo.fecha_hasta)  THEN
       BEGIN
           while not ffacturador.Gfacturador.DataSource.DataSet.Eof   do
              begin
                RUBRO := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[23].FieldName).Asstring);
                LABORATORIO := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[15].FieldName).Asstring);
                TOTALRUBRO:=TOTALRUBRO+(ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[6].FieldName).ASFLOAT);

                if cuponPromo.cant_cupones > cantCuponImpreso  then
                begin

                  if existeTextoEnArreglo(RUBRO,cuponPromo.rubros) and esGastoMayorQuePromoRubro(TOTALRUBRO,cuponPromo.gastoPorRubro) then
                  begin
                    cantCuponImpreso:= cantCuponImpreso +1;
                    imprimirCuponPromocion(ticket,atTexto);

                    if tieneCuponExtraPorRubro(cuponPromo,TOTALRUBRO) then
                    begin
                        imprimirCuponPromocion(ticket,atTexto);
                    end;


                  end;



                  if  existeTextoEnArreglo(LABORATORIO,cuponPromo.laboratorios) then
                  BEGIN
                    cantCuponImpreso:= cantCuponImpreso +1;
                    imprimirCuponPromocion(ticket,atTexto);

                  END;
                end;
                ffacturador.Gfacturador.DataSource.DataSet.Next;


            end;

       END;

end;

procedure TFIMPRESION.cargarPromos(ticket:TTicket;atTexto:AtributosDeTexto);
var
RubrosHabilitadosPromo: TArray<string>;
labHabilitadosPromo: TArray<string>;
cuponPromo:TCuponPromo;
begin

    inicializarCuponPromo(cuponPromo);

    if ticket.TIENEAPLUS='S' then
    begin

             {ACA VAN LAS PROMOS SOLO CON APLUS}
          {cuponPromo.rubros:=['1','2','3','4','B','C','D','E','G','I','K','L','M','N','P','Q','R','T','U','Z'];
          cuponPromo.laboratorios:=['98AF','CA02','74AF','CA07'];
          cuponPromo.fecha_desde:= '20/11/2022';
          cuponPromo.fecha_hasta:= '30/12/2022';
          cuponPromo.gastoPorRubro:= 4999.99;

          validarPromo(ticket,atTexto,cuponPromo); //PROMO VIEJA  }

          {PROMO PLAY Y TELE}
          inicializarCuponPromo(cuponPromo);
          cuponPromo.cant_cupones:= 2;
          cuponPromo.rubros:=['L','I','P','K'];
          cuponPromo.laboratorios:=[];
          cuponPromo.fecha_desde:= '20/11/2023';
          cuponPromo.fecha_hasta:= '31/12/2023';
          cuponPromo.gastoPorRubro:= 20000.00;
          cuponPromo.gastoPorRubroCuponExtra:=50000.00;
          validarPromo(ticket,atTexto,cuponPromo);
         {FIN PROMO PLAY Y TELE}

    end;

    {ACA VAN LAS PROMOS GENERALES}



end;

//-------------------------------------------------------//















procedure TFIMPRESION.consultafarmacoins;
var
  S, url: String;
  j, i: integer;
  Doc: IXMLDocument;
  resultado_alta_cliente, detalle: IXMLNode;
  porcentaje, descuentos, afiliado_nombre, afiliado_apellido: STRING;
  importe: string;
  numImpresora: integer;
  detalleval: IXMLNode;
  reg: tregistry;

begin

  S := '';

  try

    reg := tregistry.Create;
    reg.RootKey := HKEY_CURRENT_USER;
    reg.OpenKey(regKey, True);
    Ticket.importe_promo := Ticket.importebruto * 0.05;

    url := Ticket.url + 'get_farmacoins_importe.php?nroafiliado=' + ticket.afiliado_numero;

    IdHTTP.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    S := IdHTTP.Get(url);
    j := 0;
      Doc:=LoadXMLData(s);

    doc.DocumentElement.ChildNodes.Count;

    for I := 0 to  doc.DocumentElement.ChildNodes.Count -1 do
    begin
    j:=j+1;
    ticket.farmacoins_importe:=strtofloat( doc.DocumentElement.ChildNodes[I].ChildNodes['importe'].Text);

    end;


  finally

  end;

end;

procedure TFIMPRESION.copiadigital;
var
  archivoXML: TXMLDocument;

  Nodo, NDatosGenerales, NMensajeFacturacion, NCabecera, NDatosFinales,
    terminal, software, validador, prestador, prescriptor, beneficiario,
    financiador, credencial, CoberturaEspecial, Preautorizacion, Fechareceta,
    Dispensa, Formulario, TipoTratamiento, Diagnostico, Institucion, Retira,
    detallereceta, item: IXMLNode;
  i: integer;
  RESPONSABLEIVA: TiposDeResponsabilidades;
begin
  archivoXML := TXMLDocument.Create(Application);

  try
    begin

      if Ticket.cola = 'S' then
      BEGIN
        nrocomprobante;
        Ticket.nroticketadicional := Ticket.fiscla_pv +
          (RightPad(inttostr(nro_comprobdigital), '0', 8));
      END;

      // Activamos el archivo XML
      archivoXML.Xml.Clear;
      archivoXML.Active := True;
      archivoXML.Version := '1.0';
      archivoXML.Encoding := 'ISO-8859-1';
      NMensajeFacturacion := archivoXML.AddChild('COMPROBANTE');
      NCabecera := NMensajeFacturacion.AddChild('Encabezado');
      Nodo := NCabecera.AddChild('NROTK');

      Nodo.text := Ticket.fiscla_pv +
        (RightPad(inttostr(nro_comprobdigital), '0', 8));
      Nodo := NCabecera.AddChild('tipo_comprobante');
      Nodo.text := Ticket.comprobante;
      Nodo := NCabecera.AddChild('tipo_comprobantefiscal');
      Nodo.text := Ticket.tip_comprobante;
      Nodo := NCabecera.AddChild('NRO_VENDEDOR');
      Nodo.text := Ticket.cod_vendedor;
      Nodo := NCabecera.AddChild('nombre_vendedor');
      Nodo.text := Ticket.nom_vendedor;
      Nodo := NCabecera.AddChild('direccion_sucursal');
      Nodo.text := Ticket.direccionsucursal;
      Nodo := NCabecera.AddChild('fecha_comprobante');
      Nodo.text := datetostr(now);
      Nodo := NCabecera.AddChild('codigo_cliente');
      Nodo.text := Ticket.cod_cliente;
      Nodo := NCabecera.AddChild('direccion_cliente');
      Nodo.text := Ticket.direccion;
      Nodo := NCabecera.AddChild('responsableiva');
      Nodo.text := Ticket.CONDICIONIVA;
      Nodo := NCabecera.AddChild('DESCRIPCIONCLIENTE');
      Nodo.text := Ticket.DESCRIPCIONCLIENTE;
      Nodo := NCabecera.AddChild('cuit');
      Nodo.text := Ticket.CUIT;
      Nodo := NCabecera.AddChild('dni');
      Nodo.text := Ticket.dni;
      Nodo := NCabecera.AddChild('codigo_cc');
      Nodo.text := Ticket.codigocc;
      Nodo := NCabecera.AddChild('nombre_cc');
      Nodo.text := Ticket.nombrecc;
      Nodo := NCabecera.AddChild('codigo_tj');
      Nodo.text := Ticket.codigotarjeta;
      Nodo := NCabecera.AddChild('codigo_ch');
      Nodo.text := Ticket.codigocheque;
      Nodo := NCabecera.AddChild('numero_ch');
      Nodo.text := Ticket.numerocheque;
      Nodo := NCabecera.AddChild('codigo_os');
      Nodo.text := Ticket.codigo_OS;
      Nodo := NCabecera.AddChild('nombre_plan');
      Nodo.text := Ticket.nombre_os;
      Nodo := NCabecera.AddChild('codigo_co1');
      Nodo.text := Ticket.codigo_Co1;
      Nodo := NCabecera.AddChild('nombre_planco1');
      Nodo.text := Ticket.nombre_co1;
      Nodo := NCabecera.AddChild('codigo_co2');
      Nodo.text := Ticket.codigo_Cos2;
      Nodo := NCabecera.AddChild('nombre_planco2');
      Nodo.text := Ticket.nombre_cos2;
      Nodo := NCabecera.AddChild('importe_total');
      Nodo.text := floattostr(Ticket.importebruto);
      Nodo := NCabecera.AddChild('importe_neto');
      Nodo.text := floattostr(Ticket.importeneto);
      Nodo := NCabecera.AddChild('importe_os');
      Nodo.text := floattostr(Ticket.importecargoos);
      Nodo := NCabecera.AddChild('importe_co1');
      Nodo.text := floattostr(Ticket.importecargoco1);
      Nodo := NCabecera.AddChild('importe_co2');
      Nodo.text := floattostr(Ticket.importecargoco2);
      Nodo := NCabecera.AddChild('importe_aplus');
      Nodo.text := imp_aplus;
      Nodo := NCabecera.AddChild('imp_afectado');
      Nodo.text := floattostr(Ticket.importetotaldescuento);
      Nodo := NCabecera.AddChild('imp_gentilezas');
      Nodo.text := floattostr(Ticket.importegentileza);
      Nodo := NCabecera.AddChild('coeficiente_tarjeta');
      Nodo.text := floattostr(Ticket.coeficientetarjeta);
      Nodo := NCabecera.AddChild('pago_efectivo');
      Nodo.text := imp_efectivo;
      //--------------agregado copia------///
      Nodo := NCabecera.AddChild('pago_aplus');
      Nodo.text := imp_aplus;
      //--------------agregado copia------///
      Nodo := NCabecera.AddChild('pago_tarjeta');
      Nodo.text := imp_tarjeta;
      Nodo := NCabecera.AddChild('pago_cc');
      Nodo.text := imp_cc;
      Nodo := NCabecera.AddChild('pago_ch');
      Nodo.text := imp_ch;

      /// -------------------------------afiliado----------------------------------------------///
      Nodo := NCabecera.AddChild('afiliado_os');
      Nodo.text := Ticket.afiliado_numero;
      Nodo := NCabecera.AddChild('matricula_medico');
      Nodo.text := Ticket.medico_nro_matricula;
      Nodo := NCabecera.AddChild('nombre_medico');
      Nodo.text := Ticket.medico_nombre;
      Nodo := NCabecera.AddChild('apellido_medico');
      Nodo.text := Ticket.medico_apellido;
      Nodo := NCabecera.AddChild('codigo_provincia');
      Nodo.text := Ticket.medico_codigo_provincia;
      Nodo := NCabecera.AddChild('tipo_matricula');
      Nodo.text := Ticket.medico_tipo_matricula;
      Nodo := NCabecera.AddChild('afiliado_co1');
      Nodo.text := Ticket.afiliado_numeroco1;
      Nodo := NCabecera.AddChild('nombreafi_co1');
      Nodo.text := Ticket.afiliado_nombreco1;
      Nodo := NCabecera.AddChild('apellidoafi_co1');
      Nodo.text := Ticket.afiliado_apellidoco1;
      Nodo := NCabecera.AddChild('afiliado_co2');
      Nodo.text := Ticket.afiliado_numeroco2;
      Nodo := NCabecera.AddChild('nombreafi_co2');
      Nodo.text := Ticket.afiliado_nombreco2;
      Nodo := NCabecera.AddChild('apellidoafi_co2');
      Nodo.text := Ticket.afiliado_apellidoco2;
      Nodo := NCabecera.AddChild('matricula_medicoco1');
      Nodo.text := Ticket.medico_tipo_matricula + Ticket.medico_nro_matricula;
      Nodo := NCabecera.AddChild('nombre_medicoco1');
      Nodo.text := Ticket.medico_nombreco1;
      Nodo := NCabecera.AddChild('apellido_medicoco1');
      Nodo.text := Ticket.medico_apellidoco1;

      Nodo := NCabecera.AddChild('afiliado_apellido');
      Nodo.text := Ticket.afiliado_apellido;
      Nodo := NCabecera.AddChild('afiliado_nombre');
      Nodo.text := Ticket.afiliado_nombre;
      Nodo := NCabecera.AddChild('receta');
      Nodo.text := Ticket.numero_receta;
      Nodo := NCabecera.AddChild('tratamiento');
      Nodo.text := Ticket.codigo_tratamiento;
      Nodo := NCabecera.AddChild('codigo_Validacion');
      Nodo.text := Ticket.valnroreferencia;
      Nodo := NCabecera.AddChild('Nro_caja');
      Nodo.text := Ticket.nro_caja;
      Nodo := NCabecera.AddChild('fecha_operativa');
      Nodo.text := datetostr(Ticket.fec_operativa);
      Nodo := NCabecera.AddChild('datos_adicionales');
      Nodo.text := Ticket.info_adicional;
      Nodo := NCabecera.AddChild('codigo_prestador');
      Nodo.text := Ticket.codigoos_prestador;
      Nodo := NCabecera.AddChild('codigo_validador');
      Nodo.text := Ticket.codigo_validador;
      Nodo := NCabecera.AddChild('cuit_sucursal');
      Nodo.text := StringReplace(Ticket.cuitsucursal, '-', '', [rfReplaceAll]);
      Nodo := NCabecera.AddChild('codigoos_validador');
      Nodo.text := Ticket.codigoos_validador;
      Nodo := NCabecera.AddChild('punto_farmavalor');
      Nodo.text := Ticket.puntos_farmavalor;
      Nodo := NCabecera.AddChild('importe_farmacoins');
      Nodo.text := floattostr(Ticket.farmacoins_importe);

      detallereceta := NMensajeFacturacion.AddChild('DetalleReceta');
      ffacturador.Gfacturador.DataSource.DataSet.First;
      while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
      begin
        i := i + 1;
        item := detallereceta.AddChild('Item');
        Nodo := item.AddChild('NroItem'); // 26
        Nodo.text := inttostr(i);
        Nodo := item.AddChild('nro_troquel'); //
        Nodo.text := (ffacturador.Gfacturador.Fields[0].Asstring);
        Nodo := item.AddChild('nom_largo'); //
        Nodo.text := (ffacturador.Gfacturador.Fields[1].Asstring);
        Nodo := item.AddChild('precio'); //
        Nodo.text := (ffacturador.Gfacturador.Fields[2].Asstring);
        Nodo := item.AddChild('cantidad'); //
        Nodo.text := (ffacturador.Gfacturador.Fields[3].Asstring);
        Nodo := item.AddChild('descuentos'); //
        Nodo.text := (ffacturador.Gfacturador.Fields[4].Asstring);
        Nodo := item.AddChild('precio_totaldesc'); //
        Nodo.text := (ffacturador.Gfacturador.Fields[5].Asstring);
        Nodo := item.AddChild('precio_total'); //
        Nodo.text := (ffacturador.Gfacturador.Fields[6].Asstring);
        Nodo := item.AddChild('porcentaje');
        Nodo.text := (ffacturador.Gfacturador.Fields[7].Asstring);
        Nodo := item.AddChild('cod_alfabeta');
        Nodo.text := (ffacturador.Gfacturador.Fields[8].Asstring);
        Nodo := item.AddChild('cod_barraspri');
        Nodo.text := (ffacturador.Gfacturador.Fields[9].Asstring);
        Nodo := item.AddChild('cod_iva');
        Nodo.text := (ffacturador.Gfacturador.Fields[10].Asstring);
        Nodo := item.AddChild('porcentajeos');
        Nodo.text := (ffacturador.Gfacturador.Fields[11].Asstring);
        Nodo := item.AddChild('porcentajeco1');
        Nodo.text := (ffacturador.Gfacturador.Fields[12].Asstring);
        Nodo := item.AddChild('porcentajeco2');
        Nodo.text := (ffacturador.Gfacturador.Fields[13].Asstring);
        Nodo := item.AddChild('descuentosos');
        Nodo.text := (ffacturador.Gfacturador.Fields[14].Asstring);
        Nodo := item.AddChild('cod_laboratorio');
        Nodo.text := (ffacturador.Gfacturador.Fields[15].Asstring);
        Nodo := item.AddChild('can_stk');
        Nodo.text := (ffacturador.Gfacturador.Fields[16].Asstring);
        Nodo := item.AddChild('vale');
        Nodo.text := (ffacturador.Gfacturador.Fields[17].Asstring);
        Nodo := item.AddChild('can_vale');
        Nodo.text := (ffacturador.Gfacturador.Fields[18].Asstring);
        Nodo := item.AddChild('tamano');
        Nodo.text := (ffacturador.Gfacturador.Fields[19].Asstring);
        Nodo := item.AddChild('descuentoco1');
        Nodo.text := (ffacturador.Gfacturador.Fields[20].Asstring);
        Nodo := item.AddChild('modificado');
        Nodo.text := (ffacturador.Gfacturador.Fields[21].Asstring);
        Nodo := item.AddChild('gentileza');
        Nodo.text := (ffacturador.Gfacturador.Fields[22].Asstring);
        Nodo := item.AddChild('rubro');
        Nodo.text := (ffacturador.Gfacturador.Fields[23].Asstring);
        Nodo := item.AddChild('importegent');
        Nodo.text := (ffacturador.Gfacturador.Fields[24].Asstring);
        Nodo := item.AddChild('codautorizacion');
        Nodo.text := (ffacturador.Gfacturador.Fields[25].Asstring);
        Nodo := item.AddChild('descuentoco2');
        Nodo.text := (ffacturador.Gfacturador.Fields[27].Asstring);

        Nodo := item.AddChild('porcentaje_aplus');
        Nodo.text := (ffacturador.Gfacturador.Fields[29].Asstring);

        Nodo := item.AddChild('importe_aplus');
        Nodo.text := (ffacturador.Gfacturador.Fields[30].Asstring);
        ffacturador.Gfacturador.DataSource.DataSet.Next;
      end;
      if Ticket.cola <> 'S' then

      begin

        archivoXML.SaveToFile(Ticket.errores + Ticket.fiscla_pv +
          (RightPad(inttostr(nro_comprobdigital), '0', 8)) + '.xml');

      end;
      if Ticket.cola = 'S' then
      begin

        archivoXML.SaveToFile(Ticket.rcola + Ticket.fiscla_pv +
          (RightPad(inttostr(nro_comprobdigital), '0', 8)) + '.xml');
      end;
    end;

  finally

  end;

end;

procedure TFIMPRESION.farmacoins;
var
  S, url: String;
  j, i: integer;
  Doc: IXMLDocument;
  resultado_alta_cliente, detalle: IXMLNode;
  porcentaje, descuentos, afiliado_nombre, afiliado_apellido: STRING;
  numImpresora: integer;
  detalleval: IXMLNode;
  reg: tregistry;

begin

  S := '';

  try

    reg := tregistry.Create;
    reg.RootKey := HKEY_CURRENT_USER;
    reg.OpenKey(regKey, True);
    Ticket.importe_promo := Ticket.importebruto * 0.05;

    url := Ticket.url + 'farmacoins_mov.php?importe=' +
      floattostr(Ticket.importe_promo) + '&nroafiliado=' +
      Ticket.afiliado_numero + '&nrocomprobante=' + Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprobdigital), '0', 8)) + '&nrosucursal=' +
      Ticket.sucursal;
    IdHTTP.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    S := IdHTTP.Get(url);
    j := 0;

  finally

  end;

end;

procedure TFIMPRESION.FormClose(Sender: TObject; var Action: TCloseAction);
begin


  // hasar2.DestroyComponents;
  // hasar2.DisposeOf;

end;

procedure TFIMPRESION.FormShow(Sender: TObject);
var
  ESTADOFISCAL: string;
  z: integer;
  comprobanteimpreso: STRING;
  RESPONSABLEIVA: TiposDeResponsabilidades;
  valoriva: double;
  direccioncliente: olevariant;
  impresion_ok: boolean;
  form: tfadicionales;

begin

  { Inicializo los impresores}
  impreEtiqueta:=TImpresorEtiqueta.Create;

  comprobanteimpreso := '';

  dmfacturador.qdire.Close;
  dmfacturador.qdire.SQL.Clear;
  dmfacturador.qdire.SQL.Add
    ('select des_direccion from sumasucursal where nro_sucursal=:sucursal');
  dmfacturador.qdire.ParamByName('sucursal').Asstring := Ticket.sucursal;
  dmfacturador.qdire.Open;
  Ticket.direccionsucursal := dmfacturador.qdire.FieldByName
    ('des_direccion').Asstring;

  // -------------------------tablas ivas-------------------------------//
  dmfacturador.qtablaiva.Close;
  dmfacturador.qtablaiva.SQL.text :=
    concat('select cod_iva, por_iva from prmaiva');
  dmfacturador.qtablaiva.Open;
  dmfacturador.qtablaiva.First;
  while not dmfacturador.qtablaiva.Eof do
  begin
    if dmfacturador.qtablaiva.Fields[0].text = 'A' THEN
    BEGIN
      Ticket.IVAA := dmfacturador.qtablaiva.Fields[1].AsFloat;
    END;
    if dmfacturador.qtablaiva.Fields[0].text = 'B' THEN
    BEGIN
      Ticket.IVAB := dmfacturador.qtablaiva.Fields[1].AsFloat;
    END;
    if dmfacturador.qtablaiva.Fields[0].text = 'C' THEN
    BEGIN
      Ticket.IVAC := dmfacturador.qtablaiva.Fields[1].AsFloat;
    END;
    if dmfacturador.qtablaiva.Fields[0].text = 'D' THEN
    BEGIN
      Ticket.IVAD := dmfacturador.qtablaiva.Fields[1].AsFloat;
    END;
    if dmfacturador.qtablaiva.Fields[0].text = 'E' THEN
    BEGIN
      Ticket.IVAE := dmfacturador.qtablaiva.Fields[1].AsFloat;
    END;
    if dmfacturador.qtablaiva.Fields[0].text = 'F' THEN
    BEGIN
      Ticket.IVAF := dmfacturador.qtablaiva.Fields[1].AsFloat;
    END;
    if dmfacturador.qtablaiva.Fields[0].text = 's' THEN
    BEGIN
      Ticket.IVAs := dmfacturador.qtablaiva.Fields[1].AsFloat;
    END;
    dmfacturador.qtablaiva.Next;
  end;

  // -------------------------tablas ivas-------------------------------//

  // --------- ticket factura a------------------------//

  if Ticket.cola <> 'S' then
  begin


    if Ticket.ifh <> '2' then
    begin
      if Ticket.fiscal = 'H' then
      BEGIN
        if Ticket.tip_comprobante = 'A' then
        BEGIN
          ImprimirTicketA(impresion_ok);
        END;

        // --------- ticket factura B------------------------//

        if Ticket.tip_comprobante = 'B' then
        BEGIN
          ImprimirTicketB(impresion_ok);
        END;

        // --------- ticket comun------------------------//
        if Ticket.tip_comprobante = 'T' then
        begin
          ImprimirTicketT(impresion_ok);
        end;
      END;

      if Ticket.fiscal = 'E' then
      BEGIN
        if Ticket.tip_comprobante = 'A' then
        BEGIN
          ImprimirTicketAepson(impresion_ok);
        END;

        // --------- ticket factura B------------------------//

        if Ticket.tip_comprobante = 'B' then
        BEGIN
          ImprimirTicketBepson(impresion_ok);
        END;

        // --------- ticket comun------------------------//
        if Ticket.tip_comprobante = 'T' then
        begin
          ImprimirTicketTepson(impresion_ok);
        end;
      END;
    end;
    if Ticket.ifh = '2' then
    begin

      if Ticket.fiscal = 'H' then
      BEGIN
        if Ticket.tip_comprobante = 'T' then
        begin
          ImprimirTicketT2(impresion_ok);
        end;
        if Ticket.tip_comprobante = 'A' then
        BEGIN
          ImprimirTicket2A(impresion_ok);
        END;
        if Ticket.tip_comprobante = 'B' then
        BEGIN
          ImprimirTicket2B(impresion_ok);
        END;
      END;

    end;

    if impresion_ok then
    BEGIN

      inserciontk := '';

      Insertarcomprobante;


      if Ticket.modif <> nil then
      begin
        modificacion;
      end;

      if not(inserciontk = 'ok') then
      begin
        mimpresion.Lines.SaveToFile(Ticket.errores + Ticket.fiscla_pv +
          (RightPad(inttostr(nro_comprob), '0', 8)) + '.txt');
      end;
      if Ticket.llevavale = 'SI' then
      begin
        Insertarcomprobantevale;
      end;
      if (Ticket.info_adicional = 'S') and (Ticket.valnroreferencia <> '') then
      begin
        form := tfadicionales.Create(SELF);
        form.SetTicket(Ticket);
        form.ShowModal;
        form.DisposeOf;

      end;
      if Ticket.codigo_Co1 = 'Z87' THEN
      BEGIN
        ventaxempleado;

      END;
  {    if Ticket.Oespecial = 'S' then
        BEGIN
        if (ContainsText(TICKET.nombre_os,'SWISS')) OR (ContainsText(TICKET.nombre_os,'OSDE'))   then
        BEGIN

        farmacoins;


    END;

  END;         }
      if Ticket.codigocupon <> '' then
      begin
        setcuponusado;
      end;

      modalresult := mrcancel;
      PostMessage(Handle, UM_ACTIVATED, 0, 0);
      Ticket.estadoticket := 1;
      cargarPromos(ticket,atTexto);
    END
    ELSE
    BEGIN
      ShowMessage('IMPOSIBLE IMPRIMIR COMPROBANTE REVISE IMPRESORA');
      modalresult := mrcancel;
      PostMessage(Handle, UM_ACTIVATED, 0, 0);
      Ticket.estadoticket := 0;
    END;
  end;

  if Ticket.cola = 'S' then
  begin
    copiadigital;
    cargarPromos(ticket,atTexto);

    if Ticket.codigo_Co1 = 'Z87' THEN
      BEGIN
        ventaxempleado;

      END;

  {  if Ticket.Oespecial = 'S' then
        BEGIN
          if (ContainsText(TICKET.nombre_os,'SWISS')) OR (ContainsText(TICKET.nombre_os,'OSDE'))   then
          begin
            farmacoins;
          end;



        END; }
    if Ticket.modif <> nil then
    begin
      modificacion;
    end;

    modalresult := mrcancel;
    PostMessage(Handle, UM_ACTIVATED, 0, 0);
    Ticket.estadoticket := 1;
  end;

end;

procedure TFIMPRESION.generarcuponoferta(oferta: string);
var
  S, url: String;
  j, i: integer;
  Doc: IXMLDocument;
  resultado_alta_cliente, detalle: IXMLNode;
  porcentaje, descuentos, afiliado_nombre, afiliado_apellido: STRING;
  detalleval: IXMLNode;


begin

  S := '';

  try

    url:=ticket.url+'generar_cupon.php?ID_CEL='+(ticket.fiscla_pv+(rightpad(inttostr(nro_comprobdigital), '0', 8)))+'-'+ticket.sucursal+'&ID_DESC='+OFERTA;

    IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    s:=IdHTTP.Get(url);
    j:=0;
    Doc:=LoadXMLData(s);
    Doc.DocumentElement.ChildNodes.Count;
    cupon:=doc.DocumentElement.ChildNodes['CODIGO'].Text;

    if OFERTA='126' then
    BEGIN
    Canvas.TextOut(50,50,'VALIDO X '+cupon+'%');
    END;
    if OFERTA='127' then
    BEGIN
    Canvas.TextOut(50,50,'VALIDO X '+cupon+'%');
    END;
    {Canvas.TextOut(50,80,'En articulos de perfumeria');
    Canvas.TextOut(50,120, '_______________________________________');
    Canvas.Brush.Color := clBlack;
    Canvas.Brush.Style := bsclear;
    canvas.Font.Height:=50;
    Canvas.TextOut(50,230,cupon);
    canvas.Font.Height:=30;
    Canvas.TextOut(50,350, '______________________________________');
    canvas.Font.Height:=30;
    Canvas.TextOut(50,400,'autofarma centro de bienestar');
    Canvas.TextOut(50,450,'Fecha de emision: '+ datetostr(now));
    }
    if OFERTA = '256' then

    begin
      impreEtiqueta.imprimirCuponDescuento(cupon);
    end;

    if OFERTA = '257' then

    begin
    impreEtiqueta.imprimirCuponDescuento(cupon);
    end;

    if OFERTA = '258' then

    begin
      impreEtiqueta.imprimirCuponDescuento(cupon);
    end;

    if OFERTA = '259' then

    begin
     impreEtiqueta.imprimirCuponDescuento(cupon);
    end;




    except
    on E: Exception do
    begin
  {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
  end;


  end;

end;

procedure TFIMPRESION.setEfectivo(importe: String);
begin
  imp_efectivo := importe;
end;

procedure TFIMPRESION.setgentilezas(importe: String);
begin
  imp_gentilezas := importe;
end;

procedure TFIMPRESION.setTarjeta(importe: String);
begin
  imp_tarjeta := importe;
end;

procedure TFIMPRESION.setos(importe: String);
begin
  imp_os := importe;
end;

procedure TFIMPRESION.setcc(importe: String);
begin
  imp_cc := importe;
end;

procedure TFIMPRESION.setch(importe: String);
begin
  imp_ch := importe;
end;

procedure TFIMPRESION.setco1(importe: String);
begin
  imp_co1 := importe;
end;

procedure TFIMPRESION.setco2(importe: String);
begin
  imp_co2 := importe;
end;

procedure TFIMPRESION.setFARMACOINS(importe: String);
begin
  imp_FARMACOINS := importe;
end;
procedure TFIMPRESION.setaplus(importe: String);
begin
  imp_aplus := importe;
end;


procedure TFIMPRESION.ImprimirTicket2A(var Imprimio: boolean);
var
  ESTADOFISCAL: string;
  z: integer;
  RESPONSABLEIVA: TiposDeResponsabilidades;
  valoriva: double;
  direccioncliente: olevariant;
  descripcion: string;
  descripcioncortada: string;
  afiliado: double;
  atTexto: AtributosDeTexto;
  respuesta: respuestaconsultarestado;
  numero: integer;
  CONDICIONIVA: CondicionesIVA;
  respuestafecha: RespuestaConsultarFechaHora;
  ofecupon: string;
   ENTRAPROMO: STRING;
  ENTRAPROMODOBLE:STRING;
  TOTALRUBRO: DOUBLE;
  RUBRO: STRING;
  LABORATORIO: STRING;
begin
  hasar2 := TImpresoraFiscalRG3561.Create(SELF);
  atTexto.BorradoTexto := True;

  hasar2.Conectar(Ticket.ipfiscal, 80, 4000, 4000);
  if hasar2.ObtenerUltimoEstadoFiscal.DocumentoAbierto = True then
  begin
    hasar2.CerrarDocumento(0, 'maximiliano.guzman@autofarma.net');
  end;

  IF Ticket.CONDICIONIVA = 'RESPONSABLE MONOTRIBUTO' THEN
    RESPONSABLEIVA := MONOTRIBUTO
  ELSE IF Ticket.CONDICIONIVA = 'RESPONSABLE INSCRIPTO' THEN
    RESPONSABLEIVA := ResponsableInscripto
  ELSE IF Ticket.CONDICIONIVA = 'RESPONSABLE NO INSCRIPTO' THEN
    RESPONSABLEIVA := NoResponsable
  ELSE IF Ticket.CONDICIONIVA = 'EXENTO' THEN
    RESPONSABLEIVA := ResponsableExento
  ELSE IF Ticket.CONDICIONIVA = 'CONSUMIDOR FINAL' THEN
    RESPONSABLEIVA := ConsumidorFinal_;

  atTexto.DobleAncho := False;
  atTexto.BorradoTexto := False;
  hasar2.ConfigurarZona(1, atTexto, 'Vendedor:' + Ticket.nom_vendedor,
    EstacionTicket, Zona1Encabezado);
  hasar2.ConfigurarZona(2, atTexto, Ticket.direccionsucursal, EstacionTicket,
    Zona1Encabezado);
  direccioncliente := Ticket.direccion;

  while Pos(' ', Ticket.CUIT) > 0 do
    Delete(Ticket.CUIT, Pos(' ', Ticket.CUIT), 1);

  hasar2.CargarDatosCliente(Ticket.DESCRIPCIONCLIENTE, Ticket.CUIT,
    RESPONSABLEIVA, TipoCUIT, direccioncliente, '', '', '');
  hasar2.AbrirDocumento(TiqueFacturaA);

  ffacturador.Gfacturador.DataSource.DataSet.First;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[11].FieldName).Asstring = '0') then
    begin
      hasar2.ImprimirTextofiscal(atTexto, Ticket.codigo_OS + ': ' +
        ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[14].FieldName).Asstring + ' (' +
        (formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.
        FieldByName(ffacturador.Gfacturador.Columns[11].FieldName).AsFloat)) +
        '%)', DisplayNO);
    end;
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[12].FieldName).Asstring = '0') then
    begin
      hasar2.ImprimirTextofiscal(atTexto, Ticket.codigo_Co1 + ': ' +
        ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[20].FieldName).Asstring + ' (' +
        ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[12].FieldName).Asstring + '%)',
        DisplayNO);
    end;
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[29].FieldName).Asstring = '0') then
    begin
      hasar2.ImprimirTextofiscal(atTexto, Ticket.codigo_Cos2 + ': ' + ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[30].FieldName).Asstring + ' (' +ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[29].FieldName).Asstring + '%)',DisplayNO);
    end;
    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'B' then
    begin
      valoriva := Ticket.IVAB;
    end;
    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'A' then
    begin
      valoriva := Ticket.IVAA;
    end;
    descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);

    if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '0' then
    BEGIN
      descripcion := '(' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
        descripcion;
    END;
    if valoriva > 0 then
    begin
      CONDICIONIVA := Gravado;
    end;
    if valoriva = 0 then
    begin
      CONDICIONIVA := Exento;
    end;

    descripcioncortada := copy(descripcion, 0, 20);

    hasar2.ImprimirItem((descripcioncortada),
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[3].FieldName).AsFloat),
      ((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat) *
      Ticket.coeficientetarjeta), CONDICIONIVA, valoriva, ModoSumaMonto,
      IIVariablePorcentual, 0, DisplayNO, ModoPrecioTotal, 1,
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[9].FieldName).Asstring),
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[8].FieldName).Asstring), Unidad);
    ffacturador.Gfacturador.DataSource.DataSet.Next;

  end;

  // --------------------------descuento general----------------------------------//
  ffacturador.Gfacturador.DataSource.DataSet.First;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin
    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[22].FieldName).AsFloat <> 0 then
    begin
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
      if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '' then
      BEGIN
        descripcion := '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
          descripcion;
      END;

      descripcioncortada := copy(descripcion, 0, 20);
      hasar2.ImprimirDescuentoItem(descripcioncortada,
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[24].FieldName).AsFloat), DisplayNO,
        ModoPrecioTotal);

    end;
    ffacturador.Gfacturador.DataSource.DataSet.Next;
  end;

  // ----------------------------descuento general---------------------------------//
  if imp_efectivo = '' then
  begin
    imp_efectivo := '0';
  end;
  if imp_tarjeta = '' then
  begin
    imp_tarjeta := '0';
  end;
  if imp_cc = '' then
  begin
    imp_cc := '0';
  end;
  if imp_os = '' then
  begin
    imp_os := '0';
  end;
  if imp_co1 = '' then
  begin
    imp_co1 := '0';
  end;
  if imp_co2 = '' then
  begin
    imp_co2 := '0';
  end;
  if imp_ch = '' then
  begin
    imp_ch := '0';
  end;
  if imp_cc = '' then
  begin
    imp_cc := '0';
  end;
  if imp_aplus = '' then
  begin
      imp_aplus:= '0';
  end;
  afiliado := strtofloat(imp_efectivo) + strtofloat(imp_tarjeta) +
    strtofloat(imp_cc) + strtofloat(imp_ch);
  if imp_efectivo <> '0' then
  begin
    hasar2.ImprimirPago('Efectivo: ', strtofloat(imp_efectivo), Pagar,
      DisplayNO, '', Efectivo, 0, '', '');

  end;

  if imp_tarjeta <> '0' then
  begin
    hasar2.ImprimirPago('Tarjeta ' + Ticket.codigotarjeta + ': ',
      strtofloat(imp_tarjeta), Pagar, DisplayNO, '', Efectivo, 0, '', '');
  end;
  if imp_cc <> '0' then
  begin
    hasar2.ImprimirPago('CC ' + Ticket.codigocc + ' ' + Ticket.nombrecc + ':',
      strtofloat(imp_cc), Pagar, DisplayNO, '', Efectivo, 0, '', '');
  end;
  if imp_ch <> '0' then
  begin
    hasar2.ImprimirPago('Cheque: ', strtofloat(imp_ch), Pagar, DisplayNO, '',
      Efectivo, 0, '', '');
  end;
  if imp_os <> '0' then
  begin
    hasar2.ImprimirPago(Ticket.nombre_os, strtofloat(imp_os), Pagar, DisplayNO,
      '', Efectivo, 0, '', '');
  end;
  if imp_co1 <> '0' then
  begin
    hasar2.ImprimirPago(Ticket.nombre_co1, strtofloat(imp_co1), Pagar,
      DisplayNO, '', Efectivo, 0, '', '');
  end;
  if imp_co2 <> '0' then
  begin
    hasar2.ImprimirPago(Ticket.nombre_cos2, strtofloat(imp_co2), Pagar,
      DisplayNO, '', Efectivo, 0, '', '');
  end;
  if imp_aplus <> '0' then
  begin
    hasar2.ImprimirPago('APLUS:', strtofloat(imp_aplus), Pagar,
      DisplayNO, '', Efectivo, 0, '', '');
  end;

  hasar2.ConfigurarZona(1, atTexto, ' ', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(1, atTexto, 'Numero de ref: ' + Ticket.valnroreferencia,
    EstacionTicket, Zona2cola);
  if not(Ticket.puntos_farmavalor = '') or (Ticket.puntos_farmavalor = '0') then
  begin
    hasar2.ConfigurarZona(2, atTexto, ' ', EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(2, atTexto, 'Puntos Autofarma plus: ' +
      Ticket.puntos_farmavalor, EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(3, atTexto, ' ', EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(3, atTexto, 'Los puntos se actualizan cada 24 hs' +
      Ticket.puntos_farmavalor, EstacionTicket, Zona2cola);
  end;
  // --------------------  PROMO -----------------------------------------------------------------------//
  { if ticket.Oespecial='S' then
    BEGIN
    TRY

    if ticket.sumafarmacia<2000 then
    begin
    if ticket.sumafarmacia>1000 then
    begin
    generarcuponoferta('126');
    ofecupon:='%5:  '
    end;
    end;
    if ticket.sumafarmacia>2000 then
    begin
    generarcuponoferta('127');
    ofecupon:='%10:  '
    end;
    if cupon<>'' then
    begin

    HASAR2.ConfigurarZona(4,  attexto, ' ' ,EstacionTicket, Zona2cola);
    HASAR2.ConfigurarZona(4,  attexto, 'Cupon oferta perfu'+ofecupon+cupon ,EstacionTicket, Zona2cola);
    end;
    EXCEPT

    END;
    END; }

  // --------------------  PROMO -----------------------------------------------------------------------//

  hasar2.CerrarDocumento(0, 'maximiliano.guzman@autofarma.net');

  respuesta := hasar2.ConsultarEstado(TiqueFacturaA);
  nro_comprob := respuesta.NumeroUltimoComprobante;
  respuestafecha := hasar2.ConsultarFechaHora;
  Ticket.fechafiscal := respuestafecha.Fecha;
  Ticket.numero_ticketfiscal := nro_comprob;
  // if (ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') then
  // begin
  hasar2.PedirReimpresion;
  // end;
  // ------------------------------------------------------COPIA OS-----------------------------------------//
  if (Ticket.codigo_OS <> '') or (Ticket.codigo_Co1 <> '') then
  begin

    hasar2.ConfigurarZona(1, atTexto, 'Vendedor:' + Ticket.nom_vendedor,
      EstacionTicket, Zona1Encabezado);
    hasar2.ConfigurarZona(2, atTexto, Ticket.direccionsucursal, EstacionTicket,
      Zona1Encabezado);
    hasar2.ConfigurarZona(1, atTexto, 'Obra Social: ' + Ticket.codigo_OS + '-' +
      Ticket.nombre_os, EstacionTicket, Zona1cola);
    hasar2.ConfigurarZona(2, atTexto, 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
      Ticket.nombre_co1, EstacionTicket, Zona1cola);
    hasar2.ConfigurarZona(3, atTexto, 'Afiliado: ' + Ticket.afiliado_apellido +
      ' ' + Ticket.afiliado_nombre, EstacionTicket, Zona1cola);
    hasar2.ConfigurarZona(4, atTexto, 'Nro afiliado: ' + Ticket.afiliado_numero,
      EstacionTicket, Zona1cola);
    hasar2.ConfigurarZona(1, atTexto,
      'Mat. Med: ' + Ticket.medico_nro_matricula, EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(2, atTexto, 'Receta: ' + Ticket.numero_receta,
      EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(3, atTexto, 'Numero de ref: ' +
      Ticket.valnroreferencia, EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(4, atTexto, 'REC: ' + floattostr(Ticket.importebruto)
      + '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2)),
      EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(5, atTexto, 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
      ' AFI: ' + floattostr(roundto(afiliado, -2)), EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(6, atTexto,
      'EF: ' + floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
      floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
      floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
      floattostr(roundto(strtofloat(imp_tarjeta), -2)), EstacionTicket,
      Zona2cola);

    hasar2.AbrirDocumento(Generico);
    hasar2.ImprimirTextoGenerico(atTexto, 'NRO TICKET: ' + Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprob), '0', 8)), DisplayNO);
    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
      descripcioncortada := copy(descripcion, 0, 20);
      hasar2.ImprimirTextoGenerico(atTexto, (descripcioncortada) + '(' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
        floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat), DisplayNO);
      hasar2.ImprimirTextoGenerico(atTexto, ' ', DisplayNO);
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

    hasar2.CerrarDocumento(0, 'maximiliano.guzman@autofarma.net');
    if Ticket.codigo_Co1 <> '' then
    begin
      hasar2.PedirReimpresion;
    end;
  end;

  // ------------------------------------------------------COPIA OS-----------------------------------------//
  // --------------------------------------------vale-------------------------------------------------------//
  if Ticket.llevavale = 'SI' then
  BEGIN

    atTexto.DobleAncho := True;
    atTexto.Negrita := True;
    atTexto.Centrado := True;
    hasar2.AbrirDocumento(Generico);

    hasar2.ImprimirTextoGenerico(atTexto,
      '* * * * * * VALE A RETIRAR * * * * * *', DisplayNO);

    atTexto.DobleAncho := False;
    atTexto.Negrita := False;
    atTexto.Centrado := False;
    hasar2.ImprimirTextoGenerico(atTexto, 'Emision VR' + Ticket.fiscla_pv + ': '
      + Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)),
      DisplayNO);
    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
      BEGIN
        descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
        descripcioncortada := copy(descripcion, 0, 20);
        hasar2.ImprimirTextoGenerico(atTexto, (descripcioncortada) + '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
          floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat), DisplayNO);
        hasar2.ImprimirTextoGenerico(atTexto,
          'Unidades Vale:' + ffacturador.Gfacturador.Fields[18].Asstring,
          DisplayNO);

      END;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
    hasar2.ImprimirTextoGenerico(atTexto, 'REF. CPBT. ' + Ticket.fiscla_pv +
      ': ' + Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)),
      DisplayNO);
    hasar2.ImprimirTextoGenerico(atTexto, '*****VALIDO X 30 DIAS MAXIMO****',
      DisplayNO);

    hasar2.CerrarDocumento(0, 'maximiliano.guzman@autofarma.net');

  END;
   //--------------------------------------PROMO APLUS-------------------------------//

  //--------------------------------------PROMO APLUS-------------------------------//

  atTexto.BorradoTexto := True;
  hasar2.ConfigurarZona(1, atTexto, '', EstacionTicket, Zona1Encabezado);
  hasar2.ConfigurarZona(2, atTexto, '', EstacionTicket, Zona1Encabezado);
  hasar2.ConfigurarZona(3, atTexto, '', EstacionTicket, Zona1Encabezado);
  hasar2.ConfigurarZona(1, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(2, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(3, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(4, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(4, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(1, atTexto, '', EstacionTicket, Zona2encabezado);
  hasar2.ConfigurarZona(2, atTexto, '', EstacionTicket, Zona2encabezado);
  hasar2.ConfigurarZona(3, atTexto, '', EstacionTicket, Zona2encabezado);
  hasar2.ConfigurarZona(1, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(2, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(3, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(4, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(5, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(6, atTexto, '', EstacionTicket, Zona2cola);
  Imprimio := True;

  hasar2.DestroyComponents;
  hasar2.DisposeOf;

  // hasar2.Free;

END;

procedure TFIMPRESION.ImprimirTicket2B(var Imprimio: boolean);
var
  ESTADOFISCAL: string;
  z: integer;
  RESPONSABLEIVA: TiposDeResponsabilidades;
  valoriva: double;
  direccioncliente: olevariant;
  descripcion: string;
  descripcioncortada: string;
  afiliado: double;
  atTexto: AtributosDeTexto;
  respuesta: respuestaconsultarestado;
  numero: integer;
  CONDICIONIVA: CondicionesIVA;
  respuestafecha: RespuestaConsultarFechaHora;
  ofecupon: string;
  ENTRAPROMO: STRING;
  ENTRAPROMODOBLE:STRING;
  TOTALRUBRO: DOUBLE;
  RUBRO: STRING;
  LABORATORIO: STRING;
begin

  hasar2 := TImpresoraFiscalRG3561.Create(SELF);
  atTexto.BorradoTexto := True;

  hasar2.Conectar(Ticket.ipfiscal, 80, 4000, 4000);
  if hasar2.ObtenerUltimoEstadoFiscal.DocumentoAbierto = True then
  begin
    hasar2.CerrarDocumento(0, 'maximiliano.guzman@autofarma.net');
  end;

  IF Ticket.CONDICIONIVA = 'RESPONSABLE MONOTRIBUTO' THEN
    RESPONSABLEIVA := MONOTRIBUTO
  ELSE IF Ticket.CONDICIONIVA = 'RESPONSABLE INSCRIPTO' THEN
    RESPONSABLEIVA := ResponsableInscripto
  ELSE IF Ticket.CONDICIONIVA = 'RESPONSABLE NO INSCRIPTO' THEN
    RESPONSABLEIVA := NoResponsable
  ELSE IF Ticket.CONDICIONIVA = 'EXENTO' THEN
    RESPONSABLEIVA := ResponsableExento
  ELSE IF Ticket.CONDICIONIVA = 'CONSUMIDOR FINAL' THEN
    RESPONSABLEIVA := ConsumidorFinal_;

  atTexto.DobleAncho := False;
  atTexto.BorradoTexto := False;
  hasar2.ConfigurarZona(1, atTexto, 'Vendedor:' + Ticket.nom_vendedor,
    EstacionTicket, Zona1Encabezado);
  hasar2.ConfigurarZona(2, atTexto, Ticket.direccionsucursal, EstacionTicket,
    Zona1Encabezado);
  direccioncliente := Ticket.direccion;

  while Pos(' ', Ticket.CUIT) > 0 do
    Delete(Ticket.CUIT, Pos(' ', Ticket.CUIT), 1);

  IF Ticket.CONDICIONIVA = 'EXENTO' THEN
  begin
    hasar2.CargarDatosCliente(Ticket.DESCRIPCIONCLIENTE, Ticket.CUIT,
      RESPONSABLEIVA, TipoCUIT, direccioncliente, '', '', '');
  end;
  IF Ticket.CONDICIONIVA = 'CONSUMIDOR FINAL' THEN
  begin
    if Ticket.dni = '' then
    begin
      Ticket.dni := '1';
    end;
    hasar2.CargarDatosCliente(Ticket.DESCRIPCIONCLIENTE, Ticket.CUIT,
      RESPONSABLEIVA, TipoCUIT, direccioncliente, '', '', '');
  end;
  IF Ticket.CONDICIONIVA = 'RESPONSABLE NO INSCRIPTO' THEN
  begin
    hasar2.CargarDatosCliente(Ticket.DESCRIPCIONCLIENTE, Ticket.CUIT,
      RESPONSABLEIVA, TipoCUIT, direccioncliente, '', '', '');
  end;
  IF Ticket.CONDICIONIVA = 'RESPONSABLE MONOTRIBUTO' THEN
  begin
    hasar2.CargarDatosCliente(Ticket.DESCRIPCIONCLIENTE, Ticket.CUIT,
      RESPONSABLEIVA, TipoCUIT, direccioncliente, '', '', '');
  end;

  hasar2.AbrirDocumento(TiqueFacturaB);
  ffacturador.Gfacturador.DataSource.DataSet.First;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[11].FieldName).Asstring = '0') then
    begin
      hasar2.ImprimirTextofiscal(atTexto, Ticket.codigo_OS + ': ' +
        ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[14].FieldName).Asstring + ' (' +
        (formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.
        FieldByName(ffacturador.Gfacturador.Columns[11].FieldName).AsFloat)) +
        '%)', DisplayNO);
    end;
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[12].FieldName).Asstring = '0') then
    begin
      hasar2.ImprimirTextofiscal(atTexto, Ticket.codigo_Co1 + ': ' +
        ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[20].FieldName).Asstring + ' (' +
        ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[12].FieldName).Asstring + '%)',
        DisplayNO);
    end;
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[13].FieldName).Asstring = '0') then
    begin
      hasar2.ImprimirTextofiscal(atTexto, Ticket.codigo_Cos2 + ': ' +
        ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[27].FieldName).Asstring + ' (' +
        ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[13].FieldName).Asstring + '%)',
        DisplayNO);
    end;
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[29].FieldName).Asstring = '0') then
    begin
      hasar2.ImprimirTextofiscal(atTexto, Ticket.codigo_Cos2 + ': ' + ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[30].FieldName).Asstring + ' (' +ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[29].FieldName).Asstring + '%)',DisplayNO);
    end;

    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'B' then
    begin
      valoriva := Ticket.IVAB;
    end;
    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'A' then
    begin
      valoriva := Ticket.IVAA;
    end;
    descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);

    if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '0' then
    BEGIN
      descripcion := '(' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
        descripcion;
    END;
    if valoriva > 0 then
    begin
      CONDICIONIVA := Gravado;
    end;
    if valoriva = 0 then
    begin
      CONDICIONIVA := Exento;
    end;

    descripcioncortada := copy(descripcion, 0, 20);

    hasar2.ImprimirItem((descripcioncortada),
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[3].FieldName).AsFloat),
      ((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat) *
      Ticket.coeficientetarjeta), CONDICIONIVA, valoriva, ModoSumaMonto,
      IIVariablePorcentual, 0, DisplayNO, ModoPrecioTotal, 1,
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[9].FieldName).Asstring),
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[8].FieldName).Asstring), Unidad);
    ffacturador.Gfacturador.DataSource.DataSet.Next;

  end;

  // --------------------------descuento general----------------------------------//
  ffacturador.Gfacturador.DataSource.DataSet.First;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin
    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[22].FieldName).AsFloat <> 0 then
    begin
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
      if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '' then
      BEGIN
        descripcion := '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
          descripcion;
      END;

      descripcioncortada := copy(descripcion, 0, 20);
      hasar2.ImprimirDescuentoItem(descripcioncortada,
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[24].FieldName).AsFloat), DisplayNO,
        ModoPrecioTotal);

    end;
    ffacturador.Gfacturador.DataSource.DataSet.Next;
  end;

  // ----------------------------descuento general---------------------------------//
  if imp_efectivo = '' then
  begin
    imp_efectivo := '0';
  end;
  if imp_tarjeta = '' then
  begin
    imp_tarjeta := '0';
  end;
  if imp_cc = '' then
  begin
    imp_cc := '0';
  end;
  if imp_os = '' then
  begin
    imp_os := '0';
  end;
  if imp_co1 = '' then
  begin
    imp_co1 := '0';
  end;
  if imp_co2 = '' then
  begin
    imp_co2 := '0';
  end;
  if imp_ch = '' then
  begin
    imp_ch := '0';
  end;
  if imp_cc = '' then
  begin
    imp_cc := '0';
  end;
  if imp_aplus = '' then
  begin
      imp_aplus:= '0';
  end;
  afiliado := strtofloat(imp_efectivo) + strtofloat(imp_tarjeta) +
    strtofloat(imp_cc) + strtofloat(imp_ch);
  if imp_efectivo <> '0' then
  begin
    hasar2.ImprimirPago('Efectivo: ', strtofloat(imp_efectivo), Pagar,
      DisplayNO, '', Efectivo, 0, '', '');

  end;

  if imp_tarjeta <> '0' then
  begin
    hasar2.ImprimirPago('Tarjeta ' + Ticket.codigotarjeta + ': ',
      strtofloat(imp_tarjeta), Pagar, DisplayNO, '', Efectivo, 0, '', '');
  end;
  if imp_cc <> '0' then
  begin
    hasar2.ImprimirPago('CC ' + Ticket.codigocc + ' ' + Ticket.nombrecc + ':',
      strtofloat(imp_cc), Pagar, DisplayNO, '', Efectivo, 0, '', '');
  end;
  if imp_ch <> '0' then
  begin
    hasar2.ImprimirPago('Cheque: ', strtofloat(imp_ch), Pagar, DisplayNO, '',
      Efectivo, 0, '', '');
  end;
  if imp_os <> '0' then
  begin
    hasar2.ImprimirPago(Ticket.nombre_os, strtofloat(imp_os), Pagar, DisplayNO,
      '', Efectivo, 0, '', '');
  end;
  if imp_co1 <> '0' then
  begin
    hasar2.ImprimirPago(Ticket.nombre_co1, strtofloat(imp_co1), Pagar,
      DisplayNO, '', Efectivo, 0, '', '');
  end;
  if imp_co2 <> '0' then
  begin
    hasar2.ImprimirPago(Ticket.nombre_cos2, strtofloat(imp_co2), Pagar,
      DisplayNO, '', Efectivo, 0, '', '');
  end;
  if imp_aplus <> '0' then
  begin
    hasar2.ImprimirPago('APLUS:', strtofloat(imp_aplus), Pagar,
      DisplayNO, '', Efectivo, 0, '', '');
  end;
  hasar2.ConfigurarZona(1, atTexto, ' ', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(1, atTexto, 'Numero de ref: ' + Ticket.valnroreferencia,
    EstacionTicket, Zona2cola);
  if not(Ticket.puntos_farmavalor = '') or (Ticket.puntos_farmavalor = '0') then
  begin
    hasar2.ConfigurarZona(2, atTexto, ' ', EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(2, atTexto, 'Puntos Autofarma plus: ' +
      Ticket.puntos_farmavalor, EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(3, atTexto, ' ', EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(3, atTexto, 'Los puntos se actualizan cada 24 hs' +
      Ticket.puntos_farmavalor, EstacionTicket, Zona2cola);
  end;
  // --------------------  PROMO -----------------------------------------------------------------------//
  { if ticket.Oespecial='S' then
    BEGIN
    TRY

    if ticket.sumafarmacia<2000 then
    begin
    if ticket.sumafarmacia>1000 then
    begin
    generarcuponoferta('126');
    ofecupon:='%5:  '
    end;
    end;
    if ticket.sumafarmacia>2000 then
    begin
    generarcuponoferta('127');
    ofecupon:='%10:  '
    end;
    if cupon<>'' then
    begin

    HASAR2.ConfigurarZona(4,  attexto, ' ' ,EstacionTicket, Zona2cola);
    HASAR2.ConfigurarZona(4,  attexto, 'Cupon oferta perfu'+ofecupon+cupon ,EstacionTicket, Zona2cola);
    end;
    EXCEPT

    END;
    END; }

  // --------------------  PROMO -----------------------------------------------------------------------//

  hasar2.CerrarDocumento(0, 'maximiliano.guzman@autofarma.net');

  respuesta := hasar2.ConsultarEstado(TiqueFacturaB);
  nro_comprob := respuesta.NumeroUltimoComprobante;
  respuestafecha := hasar2.ConsultarFechaHora;
  Ticket.fechafiscal := respuestafecha.Fecha + respuestafecha.Hora;
  Ticket.numero_ticketfiscal := nro_comprob;
  // if (ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') then
  // begin
  hasar2.PedirReimpresion;
  // end;
  // ------------------------------------------------------COPIA OS-----------------------------------------//
  if (Ticket.codigo_OS <> '') or (Ticket.codigo_Co1 <> '') then
  begin

    hasar2.ConfigurarZona(1, atTexto, 'Vendedor:' + Ticket.nom_vendedor,
      EstacionTicket, Zona1Encabezado);
    hasar2.ConfigurarZona(2, atTexto, Ticket.direccionsucursal, EstacionTicket,
      Zona1Encabezado);
    hasar2.ConfigurarZona(1, atTexto, 'Obra Social: ' + Ticket.codigo_OS + '-' +
      Ticket.nombre_os, EstacionTicket, Zona1cola);
    hasar2.ConfigurarZona(2, atTexto, 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
      Ticket.nombre_co1, EstacionTicket, Zona1cola);
    hasar2.ConfigurarZona(3, atTexto, 'Afiliado: ' + Ticket.afiliado_apellido +
      ' ' + Ticket.afiliado_nombre, EstacionTicket, Zona1cola);
    hasar2.ConfigurarZona(4, atTexto, 'Nro afiliado: ' + Ticket.afiliado_numero,
      EstacionTicket, Zona1cola);
    hasar2.ConfigurarZona(1, atTexto,
      'Mat. Med: ' + Ticket.medico_nro_matricula, EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(2, atTexto, 'Receta: ' + Ticket.numero_receta,
      EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(3, atTexto, 'Numero de ref: ' +
      Ticket.valnroreferencia, EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(4, atTexto, 'REC: ' + floattostr(Ticket.importebruto)
      + '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2)),
      EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(5, atTexto, 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
      ' AFI: ' + floattostr(roundto(afiliado, -2)), EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(6, atTexto,
      'EF: ' + floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
      floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
      floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
      floattostr(roundto(strtofloat(imp_tarjeta), -2)), EstacionTicket,
      Zona2cola);

    hasar2.AbrirDocumento(Generico);
    hasar2.ImprimirTextoGenerico(atTexto, 'NRO TICKET: ' + Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprob), '0', 8)), DisplayNO);
    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin

      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
      descripcioncortada := copy(descripcion, 0, 20);
      hasar2.ImprimirTextoGenerico(atTexto, (descripcioncortada) + '(' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
        floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat), DisplayNO);
      hasar2.ImprimirTextoGenerico(atTexto, ' ', DisplayNO);
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

    hasar2.CerrarDocumento(0, 'maximiliano.guzman@autofarma.net');
    if Ticket.codigo_Co1 <> '' then
    begin
      hasar2.PedirReimpresion;
    end;
  end;

  // ------------------------------------------------------COPIA OS-----------------------------------------//
  // --------------------------------------------vale-------------------------------------------------------//
  if Ticket.llevavale = 'SI' then
  BEGIN

    atTexto.DobleAncho := True;
    atTexto.Negrita := True;
    atTexto.Centrado := True;
    hasar2.AbrirDocumento(Generico);

    hasar2.ImprimirTextoGenerico(atTexto, '--------- VALE A RETIRAR ---------',
      DisplayNO);

    atTexto.DobleAncho := False;
    atTexto.Negrita := False;
    atTexto.Centrado := False;
    // ----------//
    hasar2.ImprimirTextoGenerico(atTexto, 'Vendedor:' + Ticket.nom_vendedor,
      DisplayNO);
    hasar2.ImprimirTextoGenerico(atTexto,
      'Fecha:' + datetostr(Ticket.fechafiscal), DisplayNO);
    // ---------//
    hasar2.ImprimirTextoGenerico(atTexto, 'Emision VR' + Ticket.fiscla_pv + ': '
      + Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)),
      DisplayNO);
    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
      BEGIN
        descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
        descripcioncortada := copy(descripcion, 0, 20);
        hasar2.ImprimirTextoGenerico(atTexto, (descripcioncortada) + '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
          floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat), DisplayNO);
        hasar2.ImprimirTextoGenerico(atTexto,
          'Unidades Vale:' + ffacturador.Gfacturador.Fields[18].Asstring,
          DisplayNO);

      END;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
    hasar2.ImprimirTextoGenerico(atTexto, 'REF. CPBT. ' + Ticket.fiscla_pv +
      ': ' + Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)),
      DisplayNO);
    hasar2.ImprimirTextoGenerico(atTexto, '*****VALIDO X 30 DIAS MAXIMO****',
      DisplayNO);

    atTexto.DobleAncho := True;
    atTexto.Negrita := True;
    atTexto.Centrado := True;

    hasar2.ImprimirTextoGenerico(atTexto, '--------- VALE A RETIRAR --------',
      DisplayNO);

    atTexto.DobleAncho := False;
    atTexto.Negrita := False;
    atTexto.Centrado := False;
    // ----------//
    hasar2.ImprimirTextoGenerico(atTexto, 'Vendedor:' + Ticket.nom_vendedor,
      DisplayNO);
    hasar2.ImprimirTextoGenerico(atTexto,
      'Fecha:' + datetostr(Ticket.fechafiscal), DisplayNO);
    // ---------//
    hasar2.ImprimirTextoGenerico(atTexto, 'Emision VR' + Ticket.fiscla_pv + ': '
      + Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)),
      DisplayNO);
    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
      BEGIN
        descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
        descripcioncortada := copy(descripcion, 0, 20);
        hasar2.ImprimirTextoGenerico(atTexto, (descripcioncortada) + '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
          floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat), DisplayNO);
        hasar2.ImprimirTextoGenerico(atTexto,
          'Unidades Vale:' + ffacturador.Gfacturador.Fields[18].Asstring,
          DisplayNO);

      END;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
    hasar2.ImprimirTextoGenerico(atTexto, 'REF. CPBT. ' + Ticket.fiscla_pv +
      ': ' + Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)),
      DisplayNO);
    hasar2.ImprimirTextoGenerico(atTexto, '*****VALIDO X 30 DIAS MAXIMO****',
      DisplayNO);

    hasar2.CerrarDocumento(0, 'maximiliano.guzman@autofarma.net');

  END;
   //--------------------------------------PROMO APLUS-------------------------------//


  //--------------------------------------PROMO APLUS-------------------------------//

  atTexto.BorradoTexto := True;
  hasar2.ConfigurarZona(1, atTexto, '', EstacionTicket, Zona1Encabezado);
  hasar2.ConfigurarZona(2, atTexto, '', EstacionTicket, Zona1Encabezado);
  hasar2.ConfigurarZona(3, atTexto, '', EstacionTicket, Zona1Encabezado);
  hasar2.ConfigurarZona(1, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(2, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(3, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(4, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(4, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(1, atTexto, '', EstacionTicket, Zona2encabezado);
  hasar2.ConfigurarZona(2, atTexto, '', EstacionTicket, Zona2encabezado);
  hasar2.ConfigurarZona(3, atTexto, '', EstacionTicket, Zona2encabezado);
  hasar2.ConfigurarZona(1, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(2, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(3, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(4, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(5, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(6, atTexto, '', EstacionTicket, Zona2cola);
  Imprimio := True;

  hasar2.DestroyComponents;
  hasar2.DisposeOf;

  // hasar2.Free;

END;

procedure TFIMPRESION.ImprimirTicketA(var Imprimio: boolean);
var
  ESTADOFISCAL: string;
  z: integer;
  RESPONSABLEIVA: TiposDeResponsabilidades;
  valoriva: double;
  direccioncliente: olevariant;
  descripcion: string;
  descripcioncortada: string;
  co2cortado: string;
  ofecupon: string;

begin
  if not(ComenzarFiscal) then
  Begin
    ShowMessage('No se pudo conectar al fiscal');
    Imprimio := False;
    Exit;
  End;

  HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
  HASAR.CancelarComprobanteFiscal;
  HASAR.TratarDeCancelarTodo;
  if HASAR.DescripcionEstadoControlador = 'No hay ningún comprobante abierto'
  then
  beGIN
    IF Ticket.CONDICIONIVA = 'RESPONSABLE MONOTRIBUTO' THEN
      RESPONSABLEIVA := MONOTRIBUTO
    ELSE IF Ticket.CONDICIONIVA = 'RESPONSABLE INSCRIPTO' THEN
      RESPONSABLEIVA := RESPONSABLE_INSCRIPTO
    ELSE IF Ticket.CONDICIONIVA = 'RESPONSABLE NO INSCRIPTO' THEN
      RESPONSABLEIVA := RESPONSABLE_NO_INSCRIPTO
    ELSE IF Ticket.CONDICIONIVA = 'EXENTO' THEN
      RESPONSABLEIVA := RESPONSABLE_EXENTO
    ELSE IF Ticket.CONDICIONIVA = 'CONSUMIDOR FINAL' THEN
      RESPONSABLEIVA := CONSUMIDOR_FINAL;

    HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
    HASAR.Encabezado[2] := Ticket.direccionsucursal;
    direccioncliente := Ticket.direccion;
    HASAR.Encabezado[9] := 'Direccion cliente: ' + Ticket.direccion;
    HASAR.DatosCliente(Ticket.DESCRIPCIONCLIENTE, Ticket.CUIT, TIPO_CUIT,
      RESPONSABLEIVA, direccioncliente);

    HASAR.AbrirComprobanteFiscal(TICKET_FACTURA_A);

    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[11].FieldName).Asstring = '0') then
      begin
        HASAR.ImprimirTextofiscal(Ticket.codigo_OS + ': ' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[14].FieldName).Asstring + ' (' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[11].FieldName).Asstring + '%)');
      end;
      if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[12].FieldName).Asstring = '0') then
      begin
        HASAR.ImprimirTextofiscal(Ticket.codigo_Co1 + ': ' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[20].FieldName).Asstring + ' (' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[12].FieldName).Asstring + '%)');
      end;
      // ------linea nueva agregada coseguro 2------//
      if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[13].FieldName).Asstring = '0') then
      begin
        HASAR.ImprimirTextofiscal(Ticket.codigo_Cos2 + ': ' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[27].FieldName).Asstring + ' (' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[13].FieldName).Asstring + '%)');
      end;
      // ------fin linea nueva agregada coseguro 2------//
      if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[29].FieldName).Asstring = '0') then
      begin
        HASAR.ImprimirTextofiscal('aplus:' + ': ' +ffacturador.Gfacturador.DataSource.DataSet.FieldByName (ffacturador.Gfacturador.Columns[30].FieldName).Asstring + ' (' +(formatfloat('#####',ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[29].FieldName).AsFloat)) + '%)');
      end;
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'B' then
      begin
        valoriva := Ticket.IVAB;
      end;
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'A' then
      begin
        valoriva := Ticket.IVAA;
      end;
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
      descripcioncortada := copy(descripcion, 0, 20);
      HASAR.ImprimirItem((descripcioncortada),
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[3].FieldName).AsFloat),
        ((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat) *
        Ticket.coeficientetarjeta), valoriva, 0);

      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
    // --------------------------descuento general----------------------------------//
    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[22].FieldName).AsFloat <> 0 then
      begin
        descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
        if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '0' then
        BEGIN
          descripcion := '(' +
            (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
            descripcion;
        END;

        descripcioncortada := copy(descripcion, 0, 20);
        HASAR.DescuentoGeneral(descripcioncortada,
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[24].FieldName).AsFloat), True);
      end;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

    // ----------------------------descuento general---------------------------------//

    if imp_efectivo = '' then
    begin
      imp_efectivo := '0';
    end;
    if imp_tarjeta = '' then
    begin
      imp_tarjeta := '0';
    end;
    if imp_cc = '' then
    begin
      imp_cc := '0';
    end;
    if imp_os = '' then
    begin
      imp_os := '0';
    end;
    if imp_co1 = '' then
    begin
      imp_co1 := '0';
    end;
    if imp_co2 = '' then
    begin
      imp_co2 := '0';
    end;
    if imp_ch = '' then
    begin
      imp_ch := '0';
    end;
    if imp_cc = '' then
    begin
      imp_cc := '0';
    end;
    if imp_aplus = '' then
    begin
      imp_aplus:= '0';
    end;
    if imp_efectivo <> '0' then
    begin
      HASAR.ImprimirPago('Efectivo: ', strtofloat(imp_efectivo));
    end;
    if imp_tarjeta <> '0' then
    begin
      HASAR.ImprimirPago('Tarjeta: ', strtofloat(imp_tarjeta));
    end;
    if imp_cc <> '0' then
    begin
      HASAR.ImprimirPago('CC ' + Ticket.codigocc + ' ' + Ticket.nombrecc + ':',
        strtofloat(imp_cc));
    end;
    if imp_ch <> '0' then
    begin
      HASAR.ImprimirPago('Cheque: ', strtofloat(imp_ch));
    end;
    if imp_os <> '0' then
    begin
      HASAR.ImprimirPago(Ticket.nombre_os, strtofloat(imp_os));
    end;
    if imp_co1 <> '0' then
    begin
      HASAR.ImprimirPago(Ticket.nombre_co1, strtofloat(imp_co1));
    end;
    if imp_co2 <> '0' then
    begin
      HASAR.Encabezado[11] := Ticket.nombre_cos2 + '                           '
        + '$' + imp_co2;
    end;
    if imp_aplus <> '0' then
    begin
      HASAR.ImprimirPago('APLUS', strtofloat(imp_aplus));
    end;

    HASAR.Encabezado[12] := 'Numero de ref: ' + Ticket.valnroreferencia;

    HASAR.BorrarFantasiaEncabezadoCola(False, True, False);

    // ----------------------------oferton-------------------------------------//
    { TRY

      if ticket.sumafarmacia<2000 then
      begin
      if ticket.sumafarmacia>1000 then
      begin
      generarcuponoferta('126');
      ofecupon:='%5:  '
      end;
      end;
      if ticket.sumafarmacia>2000 then
      begin
      generarcuponoferta('127');
      ofecupon:='%10:  '
      end;
      if cupon<>'' then
      begin
      hasar.Encabezado[16]:='Cupon oferta perfu '+ofecupon+cupon;
      end;
      EXCEPT

      END; }

    // ----------------------------oferton-------------------------------------//

    HASAR.CerrarComprobanteFiscal;
    nro_comprob := strtoint(HASAR.respuesta[3]);
    Ticket.fechafiscal := HASAR.FechaHoraFiscal;
    if Ticket.codigo_OS <> '' then
    begin
      HASAR.Comenzar;
      HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
      HASAR.CancelarComprobanteFiscal;
      HASAR.TratarDeCancelarTodo;
      HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
      HASAR.Encabezado[2] := 'Obra Social: ' + Ticket.nombre_os;
      HASAR.Encabezado[3] := 'Coseguro 1: ' + Ticket.nombre_co1;
      HASAR.Encabezado[4] := 'Coseguro 2: ' + Ticket.nombre_cos2;
      HASAR.Encabezado[5] := 'Afiliado: ' + Ticket.afiliado_nombre + ' ' +
        Ticket.afiliado_apellido;
      HASAR.Encabezado[6] := 'Nro afiliado: ' + Ticket.afiliado_numero;
      HASAR.Encabezado[7] := 'Mat. Med: ' + Ticket.medico_nro_matricula;
      HASAR.Encabezado[8] := 'Receta: ' + Ticket.numero_receta;
      HASAR.Encabezado[9] := 'Numero de ref: ' + Ticket.valnroreferencia;
      HASAR.Encabezado[11] := 'REC: ' + floattostr(Ticket.importebruto) +
        '     OS: ' + imp_os;
      HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 + ' AFI: '
        + imp_efectivo;
      HASAR.Encabezado[13] := 'EF: ' + imp_efectivo + ' CH: ' + imp_ch + ' CC: '
        + imp_cc + ' TJ: ' + imp_tarjeta;
      HASAR.AbrirComprobanteNoFiscal;
      HASAR.ImprimirTextoNoFiscal('Ticket Nro: ' + Ticket.fiscla_pv +
        (RightPad(inttostr(nro_comprob), '0', 8)));
      HASAR.ImprimirTextoNoFiscal('Productos:');
      ffacturador.Gfacturador.DataSource.DataSet.First;
      while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
      begin

        HASAR.ImprimirTextoNoFiscal
          ((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring) + ' (' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ') ' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[2].FieldName).Asstring));
        ffacturador.Gfacturador.DataSource.DataSet.Next;
      end;

      HASAR.CerrarComprobanteNoFiscal;

    end;
    if Ticket.codigo_Co1 <> '' then
    begin
      HASAR.Comenzar;
      HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
      HASAR.CancelarComprobanteFiscal;
      HASAR.TratarDeCancelarTodo;
      HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
      HASAR.Encabezado[2] := 'Obra Social: ' + Ticket.nombre_os;
      HASAR.Encabezado[3] := 'Coseguro 1: ' + Ticket.nombre_co1;
      HASAR.Encabezado[4] := 'Coseguro 2: ' + Ticket.nombre_cos2;
      HASAR.Encabezado[5] := 'Afiliado: ' + Ticket.afiliado_nombre;
      HASAR.Encabezado[6] := 'Nro afiliado: ' + Ticket.afiliado_numero;
      HASAR.Encabezado[7] := 'Mat. Med: ' + Ticket.medico_nro_matricula;
      HASAR.Encabezado[8] := 'Receta: ' + Ticket.numero_receta;
      HASAR.Encabezado[9] := 'Numero de ref: ' + Ticket.valnroreferencia;
      HASAR.Encabezado[11] := 'REC: ' + floattostr(Ticket.importebruto) +
        '     OS: ' + imp_os;
      HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 + ' AFI: '
        + imp_efectivo;
      HASAR.Encabezado[13] := 'EF: ' + imp_efectivo + ' CH: ' + imp_ch + ' CC: '
        + imp_cc + ' TJ: ' + imp_tarjeta;
      HASAR.AbrirComprobanteNoFiscal;
      HASAR.ImprimirTextoNoFiscal('Ticket Nro: ' + Ticket.fiscla_pv +
        (RightPad(inttostr(nro_comprob), '0', 8)));
      HASAR.ImprimirTextoNoFiscal('Productos:');
      ffacturador.Gfacturador.DataSource.DataSet.First;
      while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
      begin

        HASAR.ImprimirTextoNoFiscal
          ((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring) + ' (' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ') ' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[2].FieldName).Asstring));
        ffacturador.Gfacturador.DataSource.DataSet.Next;
      end;

      HASAR.CerrarComprobanteNoFiscal;

    end;

    if Ticket.codigo_Cos2 <> '' then
    begin
      HASAR.Comenzar;
      HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
      HASAR.CancelarComprobanteFiscal;
      HASAR.TratarDeCancelarTodo;
      HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
      HASAR.Encabezado[2] := 'Obra Social: ' + Ticket.nombre_os;
      HASAR.Encabezado[3] := 'Coseguro 1: ' + Ticket.nombre_co1;
      HASAR.Encabezado[4] := 'Coseguro 2: ' + Ticket.nombre_cos2;
      HASAR.Encabezado[5] := 'Afiliado: ' + Ticket.afiliado_nombre;
      HASAR.Encabezado[6] := 'Nro afiliado: ' + Ticket.afiliado_numero;
      HASAR.Encabezado[7] := 'Mat. Med: ' + Ticket.medico_nro_matricula;
      HASAR.Encabezado[8] := 'Receta: ' + Ticket.numero_receta;
      HASAR.Encabezado[9] := 'Numero de ref: ' + Ticket.valnroreferencia;
      HASAR.Encabezado[11] := 'REC: ' + floattostr(Ticket.importebruto) +
        '     OS: ' + imp_os;
      HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 + ' AFI: '
        + imp_efectivo;
      HASAR.Encabezado[13] := 'EF: ' + imp_efectivo + ' CH: ' + imp_ch + ' CC: '
        + imp_cc + ' TJ: ' + imp_tarjeta;
      HASAR.AbrirComprobanteNoFiscal;
      HASAR.ImprimirTextoNoFiscal('Ticket Nro: ' + Ticket.fiscla_pv +
        (RightPad(inttostr(nro_comprob), '0', 8)));
      HASAR.ImprimirTextoNoFiscal('Productos:');
      ffacturador.Gfacturador.DataSource.DataSet.First;
      while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
      begin

        HASAR.ImprimirTextoNoFiscal
          ((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring) + ' (' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ') ' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[2].FieldName).Asstring));
        ffacturador.Gfacturador.DataSource.DataSet.Next;
      end;

      HASAR.CerrarComprobanteNoFiscal;

    end;

    if Ticket.llevavale = 'SI' then
    BEGIN
      HASAR.Comenzar;
      HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
      HASAR.CancelarComprobanteFiscal;
      HASAR.TratarDeCancelarTodo;
      HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
      HASAR.Encabezado[2] := 'Obra Social: ' + Ticket.nombre_os;
      HASAR.Encabezado[3] := 'Coseguro 1: ' + Ticket.nombre_co1;
      HASAR.Encabezado[4] := 'Coseguro 2: ' + Ticket.nombre_cos2;
      HASAR.Encabezado[9] := 'Numero de ref: ' + Ticket.valnroreferencia;
      HASAR.Encabezado[11] := 'REC: ' + floattostr(Ticket.importebruto) +
        '     OS: ' + imp_os;
      HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 + ' AFI: '
        + imp_efectivo;
      HASAR.Encabezado[13] := 'EF: ' + imp_efectivo + ' CH: ' + imp_ch + ' CC: '
        + imp_cc + ' TJ: ' + imp_tarjeta;
      HASAR.AbrirComprobanteNoFiscal;
      HASAR.ImprimirTextoNoFiscal('VALE A RETIRAR');
      HASAR.ImprimirTextoNoFiscal('Emision VR' + Ticket.fiscla_pv + ': ' +
        Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)));
      HASAR.ImprimirTextoNoFiscal('Productos:');
      ffacturador.Gfacturador.DataSource.DataSet.First;
      while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
      begin
        if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
        BEGIN
          HASAR.ImprimirTextoNoFiscal(ffacturador.Gfacturador.Fields[1]
            .Asstring);
          HASAR.ImprimirTextoNoFiscal('Unidades Vale:' +
            ffacturador.Gfacturador.Fields[18].Asstring);
        END;
        ffacturador.Gfacturador.DataSource.DataSet.Next;
      end;
      HASAR.ImprimirTextoNoFiscal('REF. CPBT. ' + Ticket.fiscla_pv +
        (RightPad(inttostr(nro_comprob), '0', 8)));
      HASAR.ImprimirTextoNoFiscal('*****VALIDO X 30 DIAS MAXIMO****');
      HASAR.CerrarComprobanteNoFiscal;

    END;

    HASAR.finalizar;
    Imprimio := True;

  end;
end;

procedure TFIMPRESION.ImprimirTicketAepson(var Imprimio: boolean);

var
  dll: THandle;
  error: LongInt;
  str: Array [0 .. 200] of Char;
  mayor: LongInt;
  menor: LongInt;
  mychar: Char;

  ESTADOFISCAL: string;
  z: integer;
  RESPONSABLEIVA: TiposDeResponsabilidades;
  valoriva: double;
  direccioncliente: olevariant;
  descripcioncortada: string;
  descripcion: string;
  efectivoredondeado: double;
  afiliado: double;
  prueba: Array [0 .. 200] of AnsiChar;
  comando: Array [0 .. 200] of AnsiChar;
  cantidadep: Array [0 .. 200] of AnsiChar;
  precioep: Array [0 .. 200] of AnsiChar;
  alfabetaep: Array [0 .. 200] of AnsiChar;
  monto: Array [0 .. 200] of AnsiChar;
  tipcomprob: Array [0 .. 200] of AnsiChar;
  respuesta: Array [0 .. 10000] of AnsiChar;
  numero: array [0 .. 10000] of LongInt;
  fechahora: array [0 .. 300] of AnsiChar;
  cliente: Array [0 .. 200] of AnsiChar;
  domicilio: Array [0 .. 200] of AnsiChar;
  cuitcliente: Array [0 .. 200] of AnsiChar;
  dnicliente: Array [0 .. 200] of AnsiChar;
  tipdoc: array [0 .. 200] of LongInt;
  respuesta_final_buffer_salida: integer;
  dnfh: string;
  valorivaep: integer;
  texto: string;
  CODIGOIVA: string;
  ofecupon: string;
    RUBRO: STRING;
  TOTALRUBRO:DOUBLE;
  ENTRAPROMO: STRING;
  LABORATORIO: STRING;
  ENTRAPROMODOBLE: STRING;
begin
  copiadigital;



  mayor := 0;
  menor := 0;
  mychar := ' ';
  error := fiscalEpson.ConsultarVersionDll(str, 100, mayor, menor);
  error := fiscalEpson.ConfigurarVelocidad(9600);
  error := fiscalEpson.ConfigurarPuerto(Ticket.puerto_com);
  error := fiscalEpson.CerrarComprobante();
  error := fiscalEpson.Conectar();
  error := fiscalEpson.ConsultarNumeroComprobanteUltimo('81', @respuesta, 2000);
  nro_comprobdigital := strtoint(respuesta) + 1;
  copiadigital;
  // ---------------------------borrado encabezados y cola-----------------------//
  comando := '';

  fiscalEpson.borrarEncabezadoYCola;
  // -----------------------------------------------------------------------------//
  // ----------------------cliente y vendedor----------------------------------------//

  direccioncliente := Ticket.direccion;

  if direccioncliente = '' then
  begin
    Ticket.direccion := Ticket.DESCRIPCIONCLIENTE;
  end;

  IF Ticket.CONDICIONIVA = 'RESPONSABLE MONOTRIBUTO' THEN
    CODIGOIVA := 'M'
  ELSE IF Ticket.CONDICIONIVA = 'RESPONSABLE NO INSCRIPTO' THEN
    CODIGOIVA := 'N'
  ELSE IF Ticket.CONDICIONIVA = 'EXENTO' THEN
    CODIGOIVA := 'E'
  ELSE IF Ticket.CONDICIONIVA = 'RESPONSABLE INSCRIPTO' THEN
    CODIGOIVA := 'I'
  ELSE IF Ticket.CONDICIONIVA = 'CONSUMIDOR FINAL' THEN
    CODIGOIVA := 'F';
  { I = Responsable Inscripto
    N = No Responsable
    M = Monotributista
    E = Exento
    U = No Categorizado
    F = Consumidor Final
    T = Monotributista Social
    P = Monotributo Trabajador Independiente Promovido }

  dnicliente := '';
  if Ticket.dni = '' then
  begin
    Ticket.dni := '1';

  end;
  if Ticket.dni <> '' then
  begin

    Ticket.dni := trim(Ticket.dni);

  end;

  Ticket.CUIT := trim(Ticket.CUIT);
  IF Ticket.CONDICIONIVA <> 'CONSUMIDOR FINAL' THEN
  begin
    comando := '';
    texto := strpcopy(comando, '0B01|0000|' + Ticket.DESCRIPCIONCLIENTE + '||' +
      Ticket.direccion + '|||T|' + Ticket.CUIT + '|' + CODIGOIVA + '||||');
    error := fiscalEpson.EnviarComando(@comando[0]);

    //
  end;
  IF Ticket.CONDICIONIVA = 'CONSUMIDOR FINAL' THEN
  begin
    comando := '';
    texto := strpcopy(comando, '0B01|0000|' + Ticket.DESCRIPCIONCLIENTE + '||' +
      Ticket.direccion + '|||D|' + Ticket.dni + '|' + CODIGOIVA + '||||');
    error := fiscalEpson.EnviarComando(@comando[0]);
    //
  end;

  // error:=CargarComprobanteAsociado('');

  // -----------------------------------------------------------------------------//
  // ----------------------Direccion fiscal----------------------------------------//
  comando := '';
  texto := strpcopy(comando, '050E|0000|' + (Ticket.direccionsucursal));

  error := fiscalEpson.EnviarComando(@comando[0]);

  comando := '';
  { texto:=strpcopy(comando,'0B01|0000|Nombre Comprador #1||TODOS PUTOS|||T|30614104712|E|083-00001-00000027|||') ;

    error :=enviarcomando(@comando[0]); }

  // --------------------------apertura de comprobante B---------------------------//

  // error := abrircomprobante(2);

  // -------------------------------------------------------------------------------//
  // -----------------------------CARGA DE ITEMS------------------------------------//
  ffacturador.Gfacturador.DataSource.DataSet.First;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin

    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[11].FieldName).Asstring = '0') then
    begin
      comando := '';
      texto := strpcopy(comando, Ticket.codigo_OS + ': ' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[14].FieldName).Asstring + ' (' +
        (formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.
        FieldByName(ffacturador.Gfacturador.Columns[11].FieldName).AsFloat)
        ) + '%)'));
      error := fiscalEpson.CargarTextoExtra(comando)
    end;
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[12].FieldName).Asstring = '0') then
    begin
      comando := '';
      texto := strpcopy(comando, Ticket.codigo_Co1 + ': ' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[20].FieldName).Asstring + ' (' +
        (formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.
        FieldByName(ffacturador.Gfacturador.Columns[12].FieldName).AsFloat)
        ) + '%)'));
      error := fiscalEpson.CargarTextoExtra(comando)
    end;
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[13].FieldName).Asstring = '0') then
    begin
      comando := '';
      texto := strpcopy(comando, Ticket.codigo_Cos2 + ': ' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[27].FieldName).Asstring + ' (' +
        (formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.
        FieldByName(ffacturador.Gfacturador.Columns[13].FieldName).AsFloat)
        ) + '%)'));
      error := fiscalEpson.CargarTextoExtra(comando)
    end;
    //------------------agregado-------------------///
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[29].FieldName).Asstring = '0') then
    begin
      comando := '';
      texto := strpcopy(comando, 'aplus:' + ': ' + (ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[30].FieldName).Asstring + ' (' +(formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[29].FieldName).AsFloat)) + '%)'));
      error := fiscalEpson.CargarTextoExtra(comando)
    end;
//------------------agregado-------------------///
    if NOT((Ticket.sucursal = '202') OR (Ticket.sucursal = '203') OR
      (Ticket.sucursal = '221')) then
    BEGIN
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'B' then
      begin
        valorivaep := 5;
      end;
    END;
    if ((Ticket.sucursal = '202') OR (Ticket.sucursal = '203') OR
      (Ticket.sucursal = '221')) then
    BEGIN
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'B' then
      begin
        valorivaep := 1;
      end;
    END;
    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'A' then
    begin
      valorivaep := 1;
    end;

    descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);

    if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '0' then
    BEGIN
      descripcion := '(' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
        descripcion;
    END;

    descripcioncortada := copy(descripcion, 0, 20);
    comando := '';
    texto := strpcopy(comando, descripcioncortada);

    texto := strpcopy(cantidadep,
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[3].FieldName).Asstring));

    if valorivaep = 5 then
    begin
      texto := strpcopy(precioep,
        floattostr(((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat) *
        Ticket.coeficientetarjeta) / 1.21));

    end;
    if valorivaep = 1 then
    begin
      texto := strpcopy(precioep,
        floattostr(((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat) *
        Ticket.coeficientetarjeta)));
    end;

    texto := strpcopy(alfabetaep,
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[0].FieldName).Asstring));

    error := fiscalEpson.ImprimirItem(200, comando, cantidadep, precioep, valorivaep, 0,
      (''), 1, alfabetaep, (''), 7);

    ffacturador.Gfacturador.DataSource.DataSet.Next;
  end;
  // -----------------------------CARGA DE ITEMS------------------------------------//
  // --------------------------descuento general----------------------------------//
  ffacturador.Gfacturador.DataSource.DataSet.First;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin
    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[22].FieldName).AsFloat <> 0 then
    begin
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
      if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '' then
      BEGIN
        descripcion := '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
          descripcion;
      END;

      descripcioncortada := copy(descripcion, 0, 20);
      texto := strpcopy(comando, descripcioncortada);
      texto := strpcopy(precioep,
        floattostr((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[24].FieldName).AsFloat) *
        Ticket.coeficientetarjeta));

      error := fiscalEpson.Cargarajuste(400, comando, precioep, valorivaep, alfabetaep);

    end;
    ffacturador.Gfacturador.DataSource.DataSet.Next;

  end;

  // ----------------------------descuento general---------------------------------//

  // ----------------------------PAGOS-----------------------------------------------//
  if imp_efectivo = '' then
  begin
    imp_efectivo := '0';
  end;
  if imp_tarjeta = '' then
  begin
    imp_tarjeta := '0';
  end;
  if imp_cc = '' then
  begin
    imp_cc := '0';
  end;
  if imp_os = '' then
  begin
    imp_os := '0';
  end;
  if imp_co1 = '' then
  begin
    imp_co1 := '0';
  end;
  if imp_co2 = '' then
  begin
    imp_co2 := '0';
  end;
  if imp_ch = '' then
  begin
    imp_ch := '0';
  end;
  if imp_cc = '' then
  begin
    imp_cc := '0';
  end;
  //------------------agregado-------------------///
   if imp_aplus = '' then
  begin
    imp_aplus:= '0';
  end;
//------------------agregado-------------------///

  afiliado := strtofloat(imp_efectivo) + strtofloat(imp_tarjeta) +
    strtofloat(imp_cc) + strtofloat(imp_ch);
  if imp_efectivo <> '0' then
  begin
    monto := '';
    texto := strpcopy(monto, imp_efectivo);
    comando := '';
    texto := strpcopy(comando, '');
    error := fiscalEpson.CargarPago(200, 8, 0, monto, '', comando, '', '');
  end;

  if imp_tarjeta <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_tarjeta);
    comando := '';
    texto := strpcopy(comando, 'Tarjeta ' + Ticket.codigotarjeta + ': ');
    error := fiscalEpson.CargarPago(200, 20, 0, monto, '', comando, '', '');
  end;

  if imp_cc <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_cc);
    comando := '';
    texto := strpcopy(comando, 'CC ' + Ticket.codigocc + ' ' + Ticket.nombrecc);
    error := fiscalEpson.CargarPago(200, 6, 0, monto, '', comando, '', '');

  end;
  if imp_ch <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_ch);
    comando := '';
    texto := strpcopy(comando, '');
    error := fiscalEpson.CargarPago(200, 3, 0, monto, '', comando, '', '');

  end;
  if imp_os <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_os);
    comando := '';
    texto := strpcopy(comando, Ticket.nombre_os);
    error := fiscalEpson.CargarPago(200, 99, 0, monto, '', comando, '', '');

  end;
  if imp_co1 <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_co1);
    comando := '';
    texto := strpcopy(comando, Ticket.nombre_co1);
    error := fiscalEpson.CargarPago(200, 99, 0, monto, '', comando, '', '');

  end;
  if imp_co2 <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_co2);
    comando := '';
    texto := strpcopy(comando, Ticket.nombre_cos2);
    error := fiscalEpson.CargarPago(200, 99, 0, monto, '', comando, '', '');
  end;
  if imp_aplus <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_aplus);
    comando := '';
    texto := strpcopy(comando, 'aplus:');
    error := fiscalEpson.CargarPago(200, 99, 0, monto, '', comando, '', '');
  end;
  // ----------------------------PAGOS-----------------------------------------------//
  // finalizacion ticket-------------------------------------------------------------//
  comando := '';
  texto := strpcopy(comando, 'Numero de ref:' + (Ticket.valnroreferencia));
  error := fiscalEpson.EstablecerCola(1, @comando[0]);
  //-------------------------------farmacoins---------------------------------------//
  if ticket.farmacoins_importe<>0 then
  begin
   comando := '';
  texto := strpcopy(comando, 'Autofarma plus disponibles: ' +'$ '+ floattostr(ticket.farmacoins_importe));
  error := fiscalEpson.EstablecerCola(2, @comando[0]);
  end;

  //-------------------------------farmacoins---------------------------------------//
  if not(Ticket.puntos_farmavalor = '') or (Ticket.puntos_farmavalor = '0') then
  begin
    comando := '';
    texto := strpcopy(comando, 'Puntos Autofarma plus: ' +
      (Ticket.puntos_farmavalor));
    error := fiscalEpson.EstablecerCola(2, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Los puntos se actualizan cada 24 hs');
    error := fiscalEpson.EstablecerCola(3, @comando[0]);
  end;
  // --------------------  PROMO -----------------------------------------------------------------------//
  { if ticket.Oespecial='S' then
    BEGIN
    TRY

    if ticket.sumafarmacia<2000 then
    begin
    if ticket.sumafarmacia>1000 then
    begin
    generarcuponoferta('126');
    ofecupon:='%5:  '
    end;
    end;
    if ticket.sumafarmacia>2000 then
    begin
    generarcuponoferta('127');
    ofecupon:='%10:  '
    end;
    if cupon<>'' then
    begin

    texto:=strpcopy(comando,'Cupon oferta perfu '+ofecupon+cupon) ;
    error :=establecercola (4, @comando[0]);
    end;
    EXCEPT

    END;
    END; }

  // --------------------  PROMO -----------------------------------------------------------------------//
  respuesta := '';
  tipcomprob := '';
  texto := strpcopy(tipcomprob, '83');
  error := fiscalEpson.ConsultarNumeroComprobanteActual(@respuesta, 2000);
  nro_comprob := strtoint(respuesta);
  respuesta := '';

  // texto:=strpcopy(fechahora,''+(ticket.puntos_farmavalor)) ;
  // error := consultarfechahora(@fechahora[300],300);

  Ticket.fechafiscal := (now);
  Ticket.numero_ticketfiscal := nro_comprob;
  error := fiscalEpson.CerrarComprobante();

  { texto:=strpcopy(respuesta,'0502|0000') ;
    error :=enviarcomando(respuesta);
    error :=ObtenerRespuesta(@str[0],0,200); }

  // -------------------borrado encabezado y cola------------------------------------------//
  comando := '';
  fiscalEpson.borrarEncabezadoYCola;
  // ------------------------------------------------------------------------------------//
  comando := '';
  texto := strpcopy(comando, '08F0|0001|081|' +
    inttostr(Ticket.numero_ticketfiscal));
  error := fiscalEpson.EnviarComando(comando);
  comando := '';
  texto := strpcopy(comando, '08F6|0000');
  error := fiscalEpson.EnviarComando(comando);



  // ----------------------------talon obras sociales-------------------------------------//

  if (Ticket.codigo_OS <> '') or (Ticket.codigo_Co1 <> '') or
    (Ticket.codigo_Cos2 <> '') then
  begin

    error := fiscalEpson.CerrarComprobante();

    comando := '';
    texto := strpcopy(comando, 'Vendedor: ' + Ticket.nom_vendedor);
    error := fiscalEpson.establecerencabezado(1, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Obra Social: ' + Ticket.codigo_OS + '-' +
      Ticket.nombre_os);
    error := fiscalEpson.establecerencabezado(2, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
      Ticket.nombre_co1);
    error := fiscalEpson.establecerencabezado(3, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
      Ticket.afiliado_nombre);
    error := fiscalEpson.establecerencabezado(4, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Nro afiliado: ' + Ticket.afiliado_numero);
    error := fiscalEpson.establecerencabezado(5, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Mat. Med: ' + Ticket.medico_nro_matricula);
    error := fiscalEpson.establecerencabezado(6, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Receta: ' + Ticket.numero_receta);
    error := fiscalEpson.establecerencabezado(7, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Numero de ref: ' + Ticket.valnroreferencia);
    error := fiscalEpson.establecerencabezado(9, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'REC: ' + floattostr(Ticket.importebruto) +
      '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2)));
    error := fiscalEpson.EstablecerCola(1, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 + ' AFI: '
      + floattostr(roundto(afiliado, -2)));
    error := fiscalEpson.EstablecerCola(2, @comando[0]);
    comando := '';
    texto := strpcopy(comando,'EF: ' + floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' + floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' + floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' + floattostr(roundto(strtofloat(imp_tarjeta), -2))+' A+: ' + floattostr(roundto(strtofloat(imp_APLUS), -2)));
    error := fiscalEpson.EstablecerCola(3, @comando[0]);

    error := fiscalEpson.abrircomprobante(21);

    comando := '';
    texto := strpcopy(comando, 'DOCUMENTO NO FISCAL FARMACIAS');
    error := fiscalEpson.ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando, 'NRO TICKET: ' + Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprob), '0', 8)));
    error := fiscalEpson.ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando,
      '--------------------------------------------------');
    error := fiscalEpson.ImprimirTextoLibre(comando);

    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
      descripcioncortada := copy(descripcion, 0, 20);

      comando := '';
      texto := strpcopy(comando, (descripcioncortada) + '(' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
        floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat));
      error := fiscalEpson.ImprimirTextoLibre(comando);
      comando := '';
      texto := strpcopy(comando, ' ');
      error := fiscalEpson.ImprimirTextoLibre(comando);

      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

    error := fiscalEpson.CerrarComprobante();
    if Ticket.codigo_OS <> '' then
    begin
      z := z + 1
    end;
    if Ticket.codigo_Co1 <> '' then
    begin
      z := z + 1
    end;
    comando := '';
    if z > 1 then
    begin
      error := fiscalEpson.CerrarComprobante();

      comando := '';
      texto := strpcopy(comando, 'Vendedor: ' + Ticket.nom_vendedor);
      error := fiscalEpson.establecerencabezado(1, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Obra Social: ' + Ticket.codigo_OS + '-' +
        Ticket.nombre_os);
      error := fiscalEpson.establecerencabezado(2, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
        Ticket.nombre_co1);
      error := fiscalEpson.establecerencabezado(3, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
        Ticket.afiliado_nombre);
      error := fiscalEpson.establecerencabezado(4, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Nro afiliado: ' + Ticket.afiliado_numero);
      error := fiscalEpson.establecerencabezado(5, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Mat. Med: ' + Ticket.medico_nro_matricula);
      error := fiscalEpson.establecerencabezado(6, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Receta: ' + Ticket.numero_receta);
      error := fiscalEpson.establecerencabezado(7, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Numero de ref: ' + Ticket.valnroreferencia);
      error := fiscalEpson.establecerencabezado(9, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'REC: ' + floattostr(Ticket.importebruto) +
        '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2)));
      error := fiscalEpson.EstablecerCola(1, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
        ' AFI: ' + floattostr(roundto(afiliado, -2)));
      error := fiscalEpson.EstablecerCola(2, @comando[0]);
      comando := '';
      texto := strpcopy(comando,'EF: ' + floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' + floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' + floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' + floattostr(roundto(strtofloat(imp_tarjeta), -2))+' A+: ' + floattostr(roundto(strtofloat(imp_APLUS), -2)));
      error := fiscalEpson.EstablecerCola(3, @comando[0]);

      error := fiscalEpson.abrircomprobante(21);

      comando := '';
      texto := strpcopy(comando, 'DOCUMENTO NO FISCAL FARMACIAS');
      error := fiscalEpson.ImprimirTextoLibre(comando);
      comando := '';
      texto := strpcopy(comando, 'NRO TICKET: ' + Ticket.fiscla_pv +
        (RightPad(inttostr(nro_comprob), '0', 8)));
      error := fiscalEpson.ImprimirTextoLibre(comando);
      comando := '';
      texto := strpcopy(comando,
        '--------------------------------------------------');
      error := fiscalEpson.ImprimirTextoLibre(comando);

      ffacturador.Gfacturador.DataSource.DataSet.First;

      while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
      begin
        descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
        descripcioncortada := copy(descripcion, 0, 20);

        comando := '';
        texto := strpcopy(comando, (descripcioncortada) + '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
          floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat));
        error := fiscalEpson.ImprimirTextoLibre(comando);
        comando := '';
        texto := strpcopy(comando, ' ');
        error := fiscalEpson.ImprimirTextoLibre(comando);

        ffacturador.Gfacturador.DataSource.DataSet.Next;
      end;

      error := fiscalEpson.CerrarComprobante();

    end;

  end;

  comando := '';

  fiscalEpson.borrarEncabezadoYCola;


  if Ticket.llevavale = 'SI' then
  BEGIN

    error := fiscalEpson.CerrarComprobante();

    comando := '';
    texto := strpcopy(comando, 'Vendedor: ' + Ticket.nom_vendedor);
    error := fiscalEpson.establecerencabezado(1, @comando[0]);

    if (Ticket.nombre_os = '') and (Ticket.nombre_co1 <> '') then
    begin
      comando := '';
      texto := strpcopy(comando, 'Obra Social: ' + Ticket.codigo_OS + '-' +
        Ticket.nombre_os);
      error := fiscalEpson.establecerencabezado(2, @comando[0]);
    end;

    if (Ticket.nombre_os = '') and (Ticket.nombre_co1 <> '') then
    begin
      comando := '';
      texto := strpcopy(comando, 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
        Ticket.afiliado_nombre);
      error := fiscalEpson.establecerencabezado(4, @comando[0]);

    end;
    if (Ticket.nombre_os <> '') then
    begin
      comando := '';
      texto := strpcopy(comando, 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
        Ticket.afiliado_nombre);
      error := fiscalEpson.establecerencabezado(4, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Nro afiliado: ' + Ticket.afiliado_numero);
      error := fiscalEpson.establecerencabezado(5, @comando[0]);

    end;
    comando := '';
    texto := strpcopy(comando, 'REC: ' + floattostr(Ticket.importebruto) +
      '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2)));
    error := fiscalEpson.EstablecerCola(1, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 + ' AFI: '
      + floattostr(roundto(afiliado, -2)));
    error := fiscalEpson.EstablecerCola(2, @comando[0]);
    comando := '';
    texto := strpcopy(comando,
      'EF: ' + floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
      floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
      floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
      floattostr(roundto(strtofloat(imp_tarjeta), -2)));
    error := fiscalEpson.EstablecerCola(3, @comando[0]);
    comando := '';

    error := fiscalEpson.abrircomprobante(21);

    texto := strpcopy(comando,
      '--------------------------------------------------');
    error := fiscalEpson.ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando, 'Emision VR' + Ticket.fiscla_pv + ': ' +
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)));
    error := fiscalEpson.ImprimirTextoLibre(comando);

    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
      BEGIN
        comando := '';
        texto := strpcopy(comando, ffacturador.Gfacturador.Fields[1].Asstring);
        error := fiscalEpson.ImprimirTextoLibre(comando);
        comando := '';
        texto := strpcopy(comando, 'Unidades Vale:' +
          (ffacturador.Gfacturador.Fields[18].Asstring));
        error := fiscalEpson.ImprimirTextoLibre(comando);

      END;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
    comando := '';
    texto := strpcopy(comando, 'REF. CPBT. ' + Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprob), '0', 8)));
    error := fiscalEpson.ImprimirTextoLibre(comando);

    texto := strpcopy(comando,
      '-----CORTAR-------------CORTAR------------CORTAR------------CORTAR------------️');
    error := fiscalEpson.ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando, 'Emision VR' + Ticket.fiscla_pv + ': ' +
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)));
    error := fiscalEpson.ImprimirTextoLibre(comando);

    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
      BEGIN
        comando := '';
        texto := strpcopy(comando, ffacturador.Gfacturador.Fields[1].Asstring);
        error := fiscalEpson.ImprimirTextoLibre(comando);
        comando := '';
        texto := strpcopy(comando, 'Unidades Vale:' +
          (ffacturador.Gfacturador.Fields[18].Asstring));
        error := fiscalEpson.ImprimirTextoLibre(comando);

      END;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
    comando := '';
    texto := strpcopy(comando, 'REF. CPBT. ' + Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprob), '0', 8)));
    error := fiscalEpson.ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando,
      '-----CORTAR-------------CORTAR------------CORTAR------------CORTAR------------');
    error := fiscalEpson.ImprimirTextoLibre(comando);

    error := fiscalEpson.CerrarComprobante();

  END;

  // ----------------------------talon obras sociales-------------------------------------//
  //----------------------------------TALON PROMO APLUS---------------------------------------//

  // ----------------------------talon PROMO APLUS-------------------------------------//
  error := fiscalEpson.Desconectar();

  Imprimio := True;



  // finalizacion ticket-------------------------------------------------------------//

end;

procedure TFIMPRESION.ImprimirTicketB(var Imprimio: boolean);
var
  ESTADOFISCAL: string;
  z: integer;
  RESPONSABLEIVA: TiposDeResponsabilidades;
  valoriva: double;
  direccioncliente: olevariant;
  descripcion: string;
  descripcioncortada: string;
  afiliado: double;
  precioos441: double;
  ofecupon: string;
begin
  HASAR.PrecioBase := False;
  if not(ComenzarFiscal) then
  Begin
    ShowMessage('No se pudo conectar al fiscal');
    Imprimio := False;
    Exit;
  End;

  HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
  HASAR.CancelarComprobanteFiscal;
  HASAR.TratarDeCancelarTodo;
  direccioncliente := Ticket.direccion;
  if HASAR.DescripcionEstadoControlador = 'No hay ningún comprobante abierto'
  then
  beGIN
    IF Ticket.CONDICIONIVA = 'RESPONSABLE MONOTRIBUTO' THEN
      RESPONSABLEIVA := MONOTRIBUTO
    ELSE IF Ticket.CONDICIONIVA = 'RESPONSABLE NO INSCRIPTO' THEN
      RESPONSABLEIVA := RESPONSABLE_NO_INSCRIPTO
    ELSE IF Ticket.CONDICIONIVA = 'EXENTO' THEN
      RESPONSABLEIVA := RESPONSABLE_EXENTO
    ELSE IF Ticket.CONDICIONIVA = 'CONSUMIDOR FINAL' THEN
      RESPONSABLEIVA := CONSUMIDOR_FINAL;

    HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
    HASAR.Encabezado[2] := Ticket.direccionsucursal;
    HASAR.Encabezado[9] := 'Direccion cliente: ' + Ticket.direccion;
    IF Ticket.CONDICIONIVA = 'EXENTO' THEN
    begin
      HASAR.DatosCliente(Ticket.DESCRIPCIONCLIENTE, Ticket.CUIT, TIPO_CUIT,
        RESPONSABLEIVA, direccioncliente);
    end;
    IF Ticket.CONDICIONIVA = 'CONSUMIDOR FINAL' THEN
    begin
      if Ticket.dni = '' then
      begin
        Ticket.dni := '1';
      end;
      HASAR.DatosCliente(Ticket.DESCRIPCIONCLIENTE, Ticket.dni, TIPO_DNI,
        RESPONSABLEIVA, direccioncliente);
    end;
    IF Ticket.CONDICIONIVA = 'RESPONSABLE NO INSCRIPTO' THEN
    begin
      HASAR.DatosCliente(Ticket.DESCRIPCIONCLIENTE, Ticket.CUIT, TIPO_CUIT,
        RESPONSABLEIVA, direccioncliente);
    end;
    IF Ticket.CONDICIONIVA = 'RESPONSABLE MONOTRIBUTO' THEN
    begin
      HASAR.DatosCliente(Ticket.DESCRIPCIONCLIENTE, Ticket.CUIT, TIPO_CUIT,
        RESPONSABLEIVA, direccioncliente);
    end;

    HASAR.AbrirComprobanteFiscal(TICKET_FACTURA_B);
    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[11].FieldName).Asstring = '0') then
      begin
        HASAR.ImprimirTextofiscal(Ticket.codigo_OS + ': ' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[14].FieldName).Asstring + ' (' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[11].FieldName).Asstring + '%)');
      end;
      if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[12].FieldName).Asstring = '0') then
      begin
        HASAR.ImprimirTextofiscal(Ticket.codigo_Co1 + ': ' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[20].FieldName).Asstring + ' (' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[12].FieldName).Asstring + '%)');
      end;
      // ------linea nueva agregada coseguro 2------//
      if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[13].FieldName).Asstring = '0') then
      begin
        HASAR.ImprimirTextofiscal(Ticket.codigo_Cos2 + ': ' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[27].FieldName).Asstring + ' (' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[13].FieldName).Asstring + '%)');
      end;
      // ------fin linea nueva agregada coseguro 2------//
      if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[29].FieldName).Asstring = '0') then
      begin
        HASAR.ImprimirTextofiscal('aplus:' + ': ' +ffacturador.Gfacturador.DataSource.DataSet.FieldByName (ffacturador.Gfacturador.Columns[30].FieldName).Asstring + ' (' +(formatfloat('#####',ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[29].FieldName).AsFloat)) + '%)');
      end;

      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'B' then
      begin
        valoriva := Ticket.IVAB;
      end;
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'A' then
      begin
        valoriva := Ticket.IVAA;
      end;
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);

      if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '' then
      BEGIN
        descripcion := '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
          descripcion;
      END;

      descripcioncortada := copy(descripcion, 0, 20);

      HASAR.ImprimirItem((descripcioncortada),
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[3].FieldName).AsFloat),
        ((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat) *
        Ticket.coeficientetarjeta), valoriva, 0);

      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

    // --------------------------descuento general----------------------------------//
    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[22].FieldName).AsFloat <> 0 then
      begin
        descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
        if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '0' then
        BEGIN
          descripcion := '(' +
            (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
            descripcion;
        END;

        descripcioncortada := copy(descripcion, 0, 20);
        HASAR.DescuentoGeneral(descripcioncortada,
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[24].FieldName).AsFloat), True);
      end;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

    // ----------------------------descuento general---------------------------------//

    if imp_efectivo = '' then
    begin
      imp_efectivo := '0';
    end;
    if imp_tarjeta = '' then
    begin
      imp_tarjeta := '0';
    end;
    if imp_cc = '' then
    begin
      imp_cc := '0';
    end;
    if imp_os = '' then
    begin
      imp_os := '0';
    end;
    if imp_co1 = '' then
    begin
      imp_co1 := '0';
    end;
    if imp_co2 = '' then
    begin
      imp_co2 := '0';
    end;
    if imp_ch = '' then
    begin
      imp_ch := '0';
    end;
    if imp_cc = '' then
    begin
      imp_cc := '0';
    end;
    if imp_aplus = '' then
    begin
      imp_aplus:= '0';
    end;
    afiliado := strtofloat(imp_efectivo) + strtofloat(imp_tarjeta) +
      strtofloat(imp_cc) + strtofloat(imp_ch);
    if imp_efectivo <> '0' then
    begin
      HASAR.ImprimirPago('Efectivo: ', strtofloat(imp_efectivo));
    end;
    if imp_tarjeta <> '0' then
    begin
      HASAR.ImprimirPago('Tarjeta: ', strtofloat(imp_tarjeta));
    end;
    if imp_cc <> '0' then
    begin
      HASAR.ImprimirPago('CC ' + Ticket.codigocc + ' ' + Ticket.nombrecc + ':',
        strtofloat(imp_cc));
    end;
    if imp_ch <> '0' then
    begin
      HASAR.ImprimirPago('Cheque: ', strtofloat(imp_ch));
    end;
    if imp_os <> '0' then
    begin
      HASAR.ImprimirPago(Ticket.nombre_os, strtofloat(imp_os));
    end;
    if imp_co1 <> '0' then
    begin
      HASAR.ImprimirPago(Ticket.nombre_co1, strtofloat(imp_co1));
    end;
    if imp_co2 <> '0' then
    begin
      // hasar.ImprimirPago(ticket.nombre_cos2 ,strtofloat(imp_co2));
      HASAR.Encabezado[11] := Ticket.nombre_cos2 + '                           '
        + '$' + imp_co2;
    end;
    if imp_aplus <> '0' then
    begin
      HASAR.ImprimirPago('APLUS', strtofloat(imp_aplus));
    end;

    HASAR.Encabezado[11] := 'Numero de ref: ' + Ticket.valnroreferencia;
    // ----------------------------oferton-------------------------------------//
    { if ticket.Oespecial='S' then
      BEGIN
      TRY

      if ticket.sumafarmacia<2000 then
      begin
      if ticket.sumafarmacia>1000 then
      begin
      generarcuponoferta('126');
      ofecupon:='%5:  '
      end;
      end;
      if ticket.sumafarmacia>2000 then
      begin
      generarcuponoferta('127');
      ofecupon:='%10:  '
      end;
      if cupon<>'' then
      begin
      hasar.Encabezado[16]:='Cupon oferta perfu '+ofecupon+cupon;
      end;
      EXCEPT

      END;
      END; }

    // ----------------------------oferton-------------------------------------//

    HASAR.BorrarFantasiaEncabezadoCola(False, True, False);

    HASAR.CerrarComprobanteFiscal;
    nro_comprob := strtoint(HASAR.respuesta[3]);
    Ticket.fechafiscal := HASAR.FechaHoraFiscal;

    if Ticket.p441f = 'N' then
    BEGIN
      if (Ticket.codigo_OS <> '') or (Ticket.codigo_Co1 <> '') then
      begin
        HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
        HASAR.Encabezado[2] := 'Obra Social: ' + Ticket.codigo_OS + '-' +
          Ticket.nombre_os;
        HASAR.Encabezado[3] := 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
          Ticket.nombre_co1;
        HASAR.Encabezado[4] := 'Coseguro 2: ' + Ticket.nombre_cos2;
        HASAR.Encabezado[5] := 'Afiliado: ' + Ticket.afiliado_nombre + ' ' +
          Ticket.afiliado_apellido;
        HASAR.Encabezado[6] := 'Nro afiliado: ' + Ticket.afiliado_numero;
        HASAR.Encabezado[7] := 'Mat. Med: ' + Ticket.medico_nro_matricula;
        HASAR.Encabezado[8] := 'Receta: ' + Ticket.numero_receta;
        HASAR.Encabezado[9] := 'Numero de ref: ' + Ticket.valnroreferencia;
        HASAR.Encabezado[11] := 'REC: ' + floattostr(Ticket.importebruto) +
          '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2));
        HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
          ' AFI: ' + floattostr(roundto(afiliado, -2));
        HASAR.Encabezado[13] := 'EF: ' +
          floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
          floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
          floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
          floattostr(roundto(strtofloat(imp_tarjeta), -2));
      end;

      if Ticket.codigo_OS <> '' then
      begin
        z := z + 1
      end;
      if Ticket.codigo_Co1 <> '' then
      begin
        z := z + 1
      end;
      HASAR.DNFHFarmacias(z);
    END;

    if Ticket.p441f = 'S' then
    begin
      if Ticket.codigo_OS <> '' then
      begin
        HASAR.Comenzar;
        HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
        HASAR.CancelarComprobanteFiscal;
        HASAR.TratarDeCancelarTodo;
        HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
        HASAR.Encabezado[2] := 'Obra Social: ' + Ticket.codigo_OS + '-' +
          Ticket.nombre_os;
        HASAR.Encabezado[3] := 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
          Ticket.nombre_co1;
        HASAR.Encabezado[4] := 'Afiliado: ' + Ticket.afiliado_nombre + ' ' +
          Ticket.afiliado_apellido;
        HASAR.Encabezado[5] := 'Nro afiliado: ' + Ticket.afiliado_numero;
        HASAR.Encabezado[6] := 'Mat. Med: ' + Ticket.medico_nro_matricula;
        HASAR.Encabezado[7] := 'Receta: ' + Ticket.numero_receta;
        HASAR.Encabezado[9] := 'Numero de ref: ' + Ticket.valnroreferencia;
        HASAR.Encabezado[11] := 'REC: ' + floattostr(Ticket.importebruto) +
          '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2));
        HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
          ' AFI: ' + floattostr(roundto(afiliado, -2));
        HASAR.Encabezado[13] := 'EF: ' +
          floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
          floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
          floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
          floattostr(roundto(strtofloat(imp_tarjeta), -2));
        HASAR.AbrirComprobanteNoFiscal;
        HASAR.ImprimirTextoNoFiscal('DOCUMENTO NO FISCAL FARMACIAS');
        HASAR.ImprimirTextoNoFiscal('NRO TICKET: ' + Ticket.fiscla_pv +
          (RightPad(inttostr(nro_comprob), '0', 8)));
        HASAR.ImprimirTextoNoFiscal
          ('--------------------------------------------------');
        ffacturador.Gfacturador.DataSource.DataSet.First;

        while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
        begin
          descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
          descripcioncortada := copy(descripcion, 0, 20);
          precioos441 :=
            roundto((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat), -2);
          HASAR.ImprimirTextoNoFiscal((descripcioncortada) + '(' +
            (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
            floattostr(precioos441));
          HASAR.ImprimirTextoNoFiscal('Unidades vale: ' +
            ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[18].FieldName).Asstring);
          HASAR.ImprimirTextoNoFiscal(' ');
          ffacturador.Gfacturador.DataSource.DataSet.Next;
        end;

        HASAR.CerrarComprobanteNoFiscal;

      end;
      if Ticket.codigo_Co1 <> '' then
      begin
        HASAR.Comenzar;
        HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
        HASAR.CancelarComprobanteFiscal;
        HASAR.TratarDeCancelarTodo;
        HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
        HASAR.Encabezado[2] := 'Obra Social: ' + Ticket.codigo_OS + '-' +
          Ticket.nombre_os;
        HASAR.Encabezado[3] := 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
          Ticket.nombre_co1;
        HASAR.Encabezado[4] := 'Afiliado: ' + Ticket.afiliado_nombre + ' ' +
          Ticket.afiliado_apellido;
        HASAR.Encabezado[5] := 'Nro afiliado: ' + Ticket.afiliado_numero;
        HASAR.Encabezado[6] := 'Mat. Med: ' + Ticket.medico_nro_matricula;
        HASAR.Encabezado[7] := 'Receta: ' + Ticket.numero_receta;
        HASAR.Encabezado[9] := 'Numero de ref: ' + Ticket.valnroreferencia;
        HASAR.Encabezado[11] := 'REC: ' + floattostr(Ticket.importebruto) +
          '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2));
        HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
          ' AFI: ' + floattostr(roundto(afiliado, -2));
        HASAR.Encabezado[13] := 'EF: ' +
          floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
          floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
          floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
          floattostr(roundto(strtofloat(imp_tarjeta), -2));
        HASAR.AbrirComprobanteNoFiscal;
        HASAR.ImprimirTextoNoFiscal('DOCUMENTO NO FISCAL FARMACIAS');
        HASAR.ImprimirTextoNoFiscal('NRO TICKET: ' + Ticket.fiscla_pv +
          (RightPad(inttostr(nro_comprob), '0', 8)));
        HASAR.ImprimirTextoNoFiscal
          ('------------------------------------------');
        ffacturador.Gfacturador.DataSource.DataSet.First;

        while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
        begin
          descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
          descripcioncortada := copy(descripcion, 0, 20);
          HASAR.ImprimirTextoNoFiscal((descripcioncortada) + '(' +
            (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
            floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat));
          HASAR.ImprimirTextoNoFiscal('Unidades vale: ' +
            ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[18].FieldName).Asstring);
          HASAR.ImprimirTextoNoFiscal(' ');
          ffacturador.Gfacturador.DataSource.DataSet.Next;
        end;

        HASAR.CerrarComprobanteNoFiscal;

      end;

      if Ticket.codigo_Cos2 <> '' then
      begin
        HASAR.Comenzar;
        HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
        HASAR.CancelarComprobanteFiscal;
        HASAR.TratarDeCancelarTodo;
        HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
        HASAR.Encabezado[2] := 'Obra Social: ' + Ticket.codigo_OS + '-' +
          Ticket.nombre_os;
        HASAR.Encabezado[3] := 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
          Ticket.nombre_co1;
        HASAR.Encabezado[4] := 'Afiliado: ' + Ticket.afiliado_nombre + ' ' +
          Ticket.afiliado_apellido;
        HASAR.Encabezado[5] := 'Nro afiliado: ' + Ticket.afiliado_numero;
        HASAR.Encabezado[6] := 'Mat. Med: ' + Ticket.medico_nro_matricula;
        HASAR.Encabezado[7] := 'Receta: ' + Ticket.numero_receta;
        HASAR.Encabezado[9] := 'Numero de ref: ' + Ticket.valnroreferencia;
        HASAR.Encabezado[11] := 'REC: ' + floattostr(Ticket.importebruto) +
          '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2));
        HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
          ' AFI: ' + floattostr(roundto(afiliado, -2));
        HASAR.Encabezado[13] := 'EF: ' +
          floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
          floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
          floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
          floattostr(roundto(strtofloat(imp_tarjeta), -2));
        HASAR.AbrirComprobanteNoFiscal;
        HASAR.ImprimirTextoNoFiscal('DOCUMENTO NO FISCAL FARMACIAS');
        HASAR.ImprimirTextoNoFiscal('NRO TICKET: ' + Ticket.fiscla_pv +
          (RightPad(inttostr(nro_comprob), '0', 8)));
        HASAR.ImprimirTextoNoFiscal
          ('------------------------------------------');
        ffacturador.Gfacturador.DataSource.DataSet.First;

        while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
        begin
          descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
          descripcioncortada := copy(descripcion, 0, 20);
          HASAR.ImprimirTextoNoFiscal((descripcioncortada) + '(' +
            (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
            floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat));
          HASAR.ImprimirTextoNoFiscal('Unidades vale: ' +
            ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[18].FieldName).Asstring);
          HASAR.ImprimirTextoNoFiscal(' ');
          ffacturador.Gfacturador.DataSource.DataSet.Next;
        end;

        HASAR.CerrarComprobanteNoFiscal;

      end;

    end;

    if Ticket.llevavale = 'SI' then
    BEGIN
      HASAR.Comenzar;
      HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
      HASAR.CancelarComprobanteFiscal;
      HASAR.TratarDeCancelarTodo;
      HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;

      if (Ticket.nombre_os = '') and (Ticket.nombre_co1 <> '') then
      begin
        HASAR.Encabezado[2] := 'Cobertura: ' + Ticket.nombre_co1;
      end;
      if Ticket.nombre_os <> '' then
      begin
        HASAR.Encabezado[2] := 'Cobertura: ' + Ticket.nombre_os;
      end;
      if (Ticket.nombre_os = '') and (Ticket.nombre_co1 = '') then
      begin
        HASAR.Encabezado[2] := 'Cobertura: ';
      end;
      if (Ticket.nombre_os = '') and (Ticket.nombre_co1 <> '') then
      begin
        HASAR.Encabezado[3] := 'Afiliado: ' + Ticket.afiliado_nombreco1 + ' ' +
          Ticket.afiliado_apellidoco1;
        HASAR.Encabezado[4] := 'Nro afiliado: ' + Ticket.afiliado_numeroco1;
      end;
      if (Ticket.nombre_os <> '') then
      begin
        HASAR.Encabezado[3] := 'Afiliado: ' + Ticket.afiliado_nombre + ' ' +
          Ticket.afiliado_apellido;
        HASAR.Encabezado[4] := 'Nro afiliado: ' + Ticket.afiliado_numero;
      end;

      HASAR.Encabezado[5] := '* * * * * * VALE A RETIRAR * * * * * *';
      HASAR.Encabezado[11] := 'REC: ' + floattostr(Ticket.importebruto) +
        '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2));
      HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 + ' AFI: '
        + floattostr(roundto(afiliado, -2));
      HASAR.Encabezado[13] := 'EF: ' +
        floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
        floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
        floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
        floattostr(roundto(strtofloat(imp_tarjeta), -2));
      HASAR.AbrirComprobanteNoFiscal;
      HASAR.ImprimirTextoNoFiscal('Emision VR' + Ticket.fiscla_pv + ': ' +
        Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)));
      ffacturador.Gfacturador.DataSource.DataSet.First;

      while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
      begin
        if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
        BEGIN
          HASAR.ImprimirTextoNoFiscal(ffacturador.Gfacturador.Fields[1]
            .Asstring);
          HASAR.ImprimirTextoNoFiscal('Unidades Vale:' +
            ffacturador.Gfacturador.Fields[18].Asstring);
        END;
        ffacturador.Gfacturador.DataSource.DataSet.Next;
      end;
      HASAR.ImprimirTextoNoFiscal('REF. CPBT. ' + Ticket.fiscla_pv +
        (RightPad(inttostr(nro_comprob), '0', 8)));
      HASAR.ImprimirTextoNoFiscal('*****VALIDO X 30 DIAS MAXIMO****');
      HASAR.CerrarComprobanteNoFiscal;

    END;

    HASAR.finalizar;
    Imprimio := True;
  end;

end;

procedure TFIMPRESION.ImprimirTicketBepson(var Imprimio: boolean);
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

var
  dll: THandle;
  error: LongInt;
  str: Array [0 .. 200] of Char;
  mayor: LongInt;
  menor: LongInt;
  mychar: Char;

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

  ESTADOFISCAL: string;
  z: integer;
  RESPONSABLEIVA: TiposDeResponsabilidades;
  valoriva: double;
  direccioncliente: olevariant;
  descripcioncortada: string;
  descripcion: string;
  efectivoredondeado: double;
  afiliado: double;
  prueba: Array [0 .. 200] of AnsiChar;
  comando: Array [0 .. 200] of AnsiChar;
  cantidadep: Array [0 .. 200] of AnsiChar;
  precioep: Array [0 .. 200] of AnsiChar;
  alfabetaep: Array [0 .. 200] of AnsiChar;
  monto: Array [0 .. 200] of AnsiChar;
  tipcomprob: Array [0 .. 200] of AnsiChar;
  respuesta: Array [0 .. 10000] of AnsiChar;
  numero: array [0 .. 10000] of LongInt;
  fechahora: array [0 .. 300] of AnsiChar;
  cliente: Array [0 .. 200] of AnsiChar;
  domicilio: Array [0 .. 200] of AnsiChar;
  cuitcliente: Array [0 .. 200] of AnsiChar;
  dnicliente: Array [0 .. 200] of AnsiChar;
  tipdoc: array [0 .. 200] of LongInt;
  respuesta_final_buffer_salida: integer;
  dnfh: string;
  valorivaep: integer;
  texto: string;
  CODIGOIVA: string;
  ofecupon: string;
    RUBRO: STRING;
  TOTALRUBRO:DOUBLE;
  ENTRAPROMO: STRING;
  LABORATORIO: STRING;
  ENTRAPROMODOBLE: STRING;
begin
  copiadigital;
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

  mayor := 0;
  menor := 0;
  mychar := ' ';
  error := ConsultarVersionDll(str, 100, mayor, menor);
  error := ConfigurarVelocidad(9600);
  error := ConfigurarPuerto(Ticket.puerto_com);
  error := CerrarComprobante();
  error := Conectar();
  error := ConsultarNumeroComprobanteUltimo('82', @respuesta, 2000);
  nro_comprobdigital := strtoint(respuesta) + 1;
  copiadigital;
  // ---------------------------borrado encabezados y cola-----------------------//
  comando := '';

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
  comando := '';
  texto := strpcopy(comando, 'Vendedor: ' + (Ticket.nom_vendedor));
  error := establecerencabezado(1, @comando[0]);
  // -----------------------------------------------------------------------------//
  // ----------------------cliente y vendedor----------------------------------------//

  direccioncliente := Ticket.direccion;

  IF Ticket.CONDICIONIVA = 'RESPONSABLE MONOTRIBUTO' THEN
    CODIGOIVA := 'M'
  ELSE IF Ticket.CONDICIONIVA = 'RESPONSABLE NO INSCRIPTO' THEN
    CODIGOIVA := 'N'
  ELSE IF Ticket.CONDICIONIVA = 'EXENTO' THEN
    CODIGOIVA := 'E'
  ELSE IF Ticket.CONDICIONIVA = 'RESPONSABLE INSCRIPTO' THEN
    CODIGOIVA := 'I'
  ELSE IF Ticket.CONDICIONIVA = 'CONSUMIDOR FINAL' THEN
    CODIGOIVA := 'F';
  { I = Responsable Inscripto
    N = No Responsable
    M = Monotributista
    E = Exento
    U = No Categorizado
    F = Consumidor Final
    T = Monotributista Social
    P = Monotributo Trabajador Independiente Promovido }

  { comando:='';
    texto:=strpcopy(comando,'Vendedor: '+(ticket.nom_vendedor)) ;
    error :=establecerencabezado (1, @comando[0]);
    comando:='';
    texto:=strpcopy(comando,'Direccion cliente: '+ticket.direccion) ;
    error :=establecerencabezado (2, @comando[0]);
    domicilio:='';
    texto:=strpcopy(domicilio,ticket.direccion) ;
    cliente:='';
    texto:=strpcopy(cliente,ticket.DESCRIPCIONCLIENTE) ;
    cuitcliente:='';
    texto:=strpcopy(cuitcliente,ticket.CUIT) ; }
  dnicliente := '';
  if Ticket.dni = '' then
  begin
    Ticket.dni := '1';

  end;
   if Ticket.dni = '0' then
  begin
    Ticket.dni := '1';

  end;
  if Ticket.dni <> '' then
  begin

    Ticket.dni := trim(Ticket.dni);

  end;

  Ticket.CUIT := trim(Ticket.CUIT);
  IF Ticket.CONDICIONIVA <> 'CONSUMIDOR FINAL' THEN
  begin
    comando := '';
    texto := strpcopy(comando, '0B01|0000|' + Ticket.DESCRIPCIONCLIENTE + '||' +
      Ticket.direccion + '|||T|' + Ticket.CUIT + '|' + CODIGOIVA + '||||');
    error := EnviarComando(@comando[0]);

    //
  end;
  IF Ticket.CONDICIONIVA = 'CONSUMIDOR FINAL' THEN
  begin
    comando := '';
    texto := strpcopy(comando, '0B01|0000|' + Ticket.DESCRIPCIONCLIENTE + '||' +
      Ticket.direccion + '|||D|' + Ticket.dni + '|' + CODIGOIVA + '||||');
    error := EnviarComando(@comando[0]);
    // error:=cargardatoscliente( cliente,'',domicilio,'','',1, dnicliente, codigoiva );
  end;

  // error:=CargarComprobanteAsociado('');

  // -----------------------------------------------------------------------------//
  // ----------------------Direccion fiscal----------------------------------------//
  comando := '';
  texto := strpcopy(comando, '050E|0000|' + (Ticket.direccionsucursal));

  error := EnviarComando(@comando[0]);

  comando := '';
  { texto:=strpcopy(comando,'0B01|0000|Nombre Comprador #1||TODOS PUTOS|||T|30614104712|E|083-00001-00000027|||') ;

    error :=enviarcomando(@comando[0]); }

  // --------------------------apertura de comprobante B---------------------------//

  // error := abrircomprobante(2);

  // -------------------------------------------------------------------------------//
  // -----------------------------CARGA DE ITEMS------------------------------------//
  ffacturador.Gfacturador.DataSource.DataSet.First;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[29].FieldName).Asstring = '0') then
    begin
      comando := '';
      texto := strpcopy(comando, 'aplus:' + ': ' + (ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[30].FieldName).Asstring + ' (' +(formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[29].FieldName).AsFloat)) + '%)'));
      error := CargarTextoExtra(comando)
    end;
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[11].FieldName).Asstring = '0') then
    begin
      comando := '';
      texto := strpcopy(comando, Ticket.codigo_OS + ': ' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[14].FieldName).Asstring + ' (' +
        (formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.
        FieldByName(ffacturador.Gfacturador.Columns[11].FieldName).AsFloat)
        ) + '%)'));
      error := CargarTextoExtra(comando)
    end;
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[12].FieldName).Asstring = '0') then
    begin
      comando := '';
      texto := strpcopy(comando, Ticket.codigo_Co1 + ': ' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[20].FieldName).Asstring + ' (' +
        (formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.
        FieldByName(ffacturador.Gfacturador.Columns[12].FieldName).AsFloat)
        ) + '%)'));
      error := CargarTextoExtra(comando)
    end;
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[13].FieldName).Asstring = '0') then
    begin
      comando := '';
      texto := strpcopy(comando, Ticket.codigo_Cos2 + ': ' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[27].FieldName).Asstring + ' (' +
        (formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.
        FieldByName(ffacturador.Gfacturador.Columns[13].FieldName).AsFloat)
        ) + '%)'));
      error := CargarTextoExtra(comando)
    end;
    if NOT((Ticket.sucursal = '202') OR (Ticket.sucursal = '203') OR
      (Ticket.sucursal = '221')) then
    BEGIN
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'B' then
      begin
        valorivaep := 5;
      end;
    END;
    if ((Ticket.sucursal = '202') OR (Ticket.sucursal = '203') OR
      (Ticket.sucursal = '221')) then
    BEGIN
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'B' then
      begin
        valorivaep := 1;
      end;
    END;
    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'A' then
    begin
      valorivaep := 1;
    end;

    descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);

    if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '0' then
    BEGIN
      descripcion := '(' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
        descripcion;
    END;

    descripcioncortada := copy(descripcion, 0, 20);
    comando := '';
    texto := strpcopy(comando, descripcioncortada);

    texto := strpcopy(cantidadep,
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[3].FieldName).Asstring));

    if valorivaep = 5 then
    begin
      texto := strpcopy(precioep,
        floattostr(((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat) *
        Ticket.coeficientetarjeta) / 1.21));

    end;
    if valorivaep = 1 then
    begin
      texto := strpcopy(precioep,
        floattostr(((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat) *
        Ticket.coeficientetarjeta)));
    end;

    texto := strpcopy(alfabetaep,
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[0].FieldName).Asstring));

    error := ImprimirItem(200, comando, cantidadep, precioep, valorivaep, 0,
      (''), 1, alfabetaep, (''), 7);

    ffacturador.Gfacturador.DataSource.DataSet.Next;
  end;
  // -----------------------------CARGA DE ITEMS------------------------------------//
  // --------------------------descuento general----------------------------------//
  ffacturador.Gfacturador.DataSource.DataSet.First;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin
    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[22].FieldName).AsFloat <> 0 then
    begin
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
      if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '' then
      BEGIN
        descripcion := '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
          descripcion;
      END;

      descripcioncortada := copy(descripcion, 0, 20);
      texto := strpcopy(comando, descripcioncortada);
      texto := strpcopy(precioep,
        floattostr((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[24].FieldName).AsFloat) *
        Ticket.coeficientetarjeta));

      error := Cargarajuste(400, comando, precioep, valorivaep, alfabetaep);

    end;
    ffacturador.Gfacturador.DataSource.DataSet.Next;

  end;

  // ----------------------------descuento general---------------------------------//

  // ----------------------------PAGOS-----------------------------------------------//
  if imp_efectivo = '' then
  begin
    imp_efectivo := '0';
  end;
  if imp_tarjeta = '' then
  begin
    imp_tarjeta := '0';
  end;
  if imp_cc = '' then
  begin
    imp_cc := '0';
  end;
  if imp_os = '' then
  begin
    imp_os := '0';
  end;
  if imp_co1 = '' then
  begin
    imp_co1 := '0';
  end;
  if imp_co2 = '' then
  begin
    imp_co2 := '0';
  end;
  if imp_ch = '' then
  begin
    imp_ch := '0';
  end;
  if imp_cc = '' then
  begin
    imp_cc := '0';
  end;
  if imp_aplus = '' then
  begin
    imp_aplus:= '0';
  end;
  afiliado := strtofloat(imp_efectivo) + strtofloat(imp_tarjeta) +
    strtofloat(imp_cc) + strtofloat(imp_ch);
  if imp_efectivo <> '0' then
  begin
    monto := '';
    texto := strpcopy(monto, imp_efectivo);
    comando := '';
    texto := strpcopy(comando, '');
    error := CargarPago(200, 8, 0, monto, '', comando, '', '');
  end;

  if imp_tarjeta <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_tarjeta);
    comando := '';
    texto := strpcopy(comando, 'Tarjeta ' + Ticket.codigotarjeta + ': ');
    error := CargarPago(200, 20, 0, monto, '', comando, '', '');
  end;

  if imp_cc <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_cc);
    comando := '';
    texto := strpcopy(comando, 'CC ' + Ticket.codigocc + ' ' + Ticket.nombrecc);
    error := CargarPago(200, 6, 0, monto, '', comando, '', '');

  end;
  if imp_ch <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_ch);
    comando := '';
    texto := strpcopy(comando, '');
    error := CargarPago(200, 3, 0, monto, '', comando, '', '');

  end;
  if imp_os <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_os);
    comando := '';
    texto := strpcopy(comando, Ticket.nombre_os);
    error := CargarPago(200, 99, 0, monto, '', comando, '', '');

  end;
  if imp_co1 <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_co1);
    comando := '';
    texto := strpcopy(comando, Ticket.nombre_co1);
    error := CargarPago(200, 99, 0, monto, '', comando, '', '');

  end;
  if imp_co2 <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_co2);
    comando := '';
    texto := strpcopy(comando, Ticket.nombre_cos2);
    error := CargarPago(200, 99, 0, monto, '', comando, '', '');
  end;
  if imp_aplus <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_aplus);
    comando := '';
    texto := strpcopy(comando, 'aplus:');
    error := CargarPago(200, 99, 0, monto, '', comando, '', '');
  end;
  // ----------------------------PAGOS-----------------------------------------------//
  // finalizacion ticket-------------------------------------------------------------//
  comando := '';
  texto := strpcopy(comando, 'Numero de ref:' + (Ticket.valnroreferencia));
  error := EstablecerCola(1, @comando[0]);
    //-------------------------------farmacoins---------------------------------------//
  if ticket.farmacoins_importe<>0 then
  begin
   comando := '';
  texto := strpcopy(comando, 'Autofarma plus disponibles: ' +'$ '+ floattostr(ticket.farmacoins_importe));
  error := EstablecerCola(2, @comando[0]);
  end;

  //-------------------------------farmacoins---------------------------------------//

  if not(Ticket.puntos_farmavalor = '') or (Ticket.puntos_farmavalor = '0') then
  begin
    comando := '';
    texto := strpcopy(comando, 'Puntos Autofarma plus: ' +
      (Ticket.puntos_farmavalor));
    error := EstablecerCola(2, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Los puntos se actualizan cada 24 hs');
    error := EstablecerCola(3, @comando[0]);
  end;
  // --------------------  PROMO -----------------------------------------------------------------------//
  { if ticket.Oespecial='S' then
    BEGIN
    TRY

    if ticket.sumafarmacia<2000 then
    begin
    if ticket.sumafarmacia>1000 then
    begin
    generarcuponoferta('126');
    ofecupon:='%5:  '
    end;
    end;
    if ticket.sumafarmacia>2000 then
    begin
    generarcuponoferta('127');
    ofecupon:='%10:  '
    end;
    if cupon<>'' then
    begin

    texto:=strpcopy(comando,'Cupon oferta perfu '+ofecupon+cupon) ;
    error :=establecercola (4, @comando[0]);
    end;
    EXCEPT

    END;
    END; }

  // --------------------  PROMO -----------------------------------------------------------------------//
  respuesta := '';
  tipcomprob := '';
  texto := strpcopy(tipcomprob, '83');
  error := ConsultarNumeroComprobanteActual(@respuesta, 2000);
  nro_comprob := strtoint(respuesta);
  respuesta := '';

  // texto:=strpcopy(fechahora,''+(ticket.puntos_farmavalor)) ;
  // error := consultarfechahora(@fechahora[300],300);

  Ticket.fechafiscal := (now);
  Ticket.numero_ticketfiscal := nro_comprob;
  error := CerrarComprobante();

  { texto:=strpcopy(respuesta,'0502|0000') ;
    error :=enviarcomando(respuesta);
    error :=ObtenerRespuesta(@str[0],0,200); }

  // -------------------borrado encabezado y cola------------------------------------------//
  comando := '';

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

  // ------------------------------------------------------------------------------------//
  comando := '';
  texto := strpcopy(comando, '08F0|0001|082|' +
    inttostr(Ticket.numero_ticketfiscal));
  error := EnviarComando(comando);
  comando := '';
  texto := strpcopy(comando, '08F6|0000');
  error := EnviarComando(comando);



  // ----------------------------talon obras sociales-------------------------------------//

  if (Ticket.codigo_OS <> '') or (Ticket.codigo_Co1 <> '') or
    (Ticket.codigo_Cos2 <> '') then
  begin

    error := CerrarComprobante();

    comando := '';
    texto := strpcopy(comando, 'Vendedor: ' + Ticket.nom_vendedor);
    error := establecerencabezado(1, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Obra Social: ' + Ticket.codigo_OS + '-' +
      Ticket.nombre_os);
    error := establecerencabezado(2, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
      Ticket.nombre_co1);
    error := establecerencabezado(3, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
      Ticket.afiliado_nombre);
    error := establecerencabezado(4, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Nro afiliado: ' + Ticket.afiliado_numero);
    error := establecerencabezado(5, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Mat. Med: ' + Ticket.medico_nro_matricula);
    error := establecerencabezado(6, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Receta: ' + Ticket.numero_receta);
    error := establecerencabezado(7, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Numero de ref: ' + Ticket.valnroreferencia);
    error := establecerencabezado(9, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'REC: ' + floattostr(Ticket.importebruto) +
      '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2)));
    error := EstablecerCola(1, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 + ' AFI: '
      + floattostr(roundto(afiliado, -2)));
    error := EstablecerCola(2, @comando[0]);
    comando := '';

    texto := strpcopy(comando,'EF: ' + floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' + floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' + floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' + floattostr(roundto(strtofloat(imp_tarjeta), -2))+' A+: ' + floattostr(roundto(strtofloat(imp_APLUS), -2)));
    error := EstablecerCola(3, @comando[0]);

    error := abrircomprobante(21);

    comando := '';
    texto := strpcopy(comando, 'DOCUMENTO NO FISCAL FARMACIAS');
    error := ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando, 'NRO TICKET: ' + Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprob), '0', 8)));
    error := ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando,
      '--------------------------------------------------');
    error := ImprimirTextoLibre(comando);

    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
      descripcioncortada := copy(descripcion, 0, 20);

      comando := '';
      texto := strpcopy(comando, (descripcioncortada) + '(' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
        floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat));
      error := ImprimirTextoLibre(comando);
      comando := '';
      texto := strpcopy(comando, ' ');
      error := ImprimirTextoLibre(comando);

      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

    error := CerrarComprobante();
    if Ticket.codigo_OS <> '' then
    begin
      z := z + 1
    end;
    if Ticket.codigo_Co1 <> '' then
    begin
      z := z + 1
    end;
    comando := '';
    if z > 1 then
    begin
      error := CerrarComprobante();

      comando := '';
      texto := strpcopy(comando, 'Vendedor: ' + Ticket.nom_vendedor);
      error := establecerencabezado(1, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Obra Social: ' + Ticket.codigo_OS + '-' +
        Ticket.nombre_os);
      error := establecerencabezado(2, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
        Ticket.nombre_co1);
      error := establecerencabezado(3, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
        Ticket.afiliado_nombre);
      error := establecerencabezado(4, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Nro afiliado: ' + Ticket.afiliado_numero);
      error := establecerencabezado(5, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Mat. Med: ' + Ticket.medico_nro_matricula);
      error := establecerencabezado(6, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Receta: ' + Ticket.numero_receta);
      error := establecerencabezado(7, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Numero de ref: ' + Ticket.valnroreferencia);
      error := establecerencabezado(9, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'REC: ' + floattostr(Ticket.importebruto) +
        '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2)));
      error := EstablecerCola(1, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
        ' AFI: ' + floattostr(roundto(afiliado, -2)));
      error := EstablecerCola(2, @comando[0]);
      comando := '';
      texto := strpcopy(comando,
        'EF: ' + floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
        floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
        floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
        floattostr(roundto(strtofloat(imp_tarjeta), -2)));
      error := EstablecerCola(3, @comando[0]);

      error := abrircomprobante(21);

      comando := '';
      texto := strpcopy(comando, 'DOCUMENTO NO FISCAL FARMACIAS');
      error := ImprimirTextoLibre(comando);
      comando := '';
      texto := strpcopy(comando, 'NRO TICKET: ' + Ticket.fiscla_pv +
        (RightPad(inttostr(nro_comprob), '0', 8)));
      error := ImprimirTextoLibre(comando);
      comando := '';
      texto := strpcopy(comando,
        '--------------------------------------------------');
      error := ImprimirTextoLibre(comando);

      ffacturador.Gfacturador.DataSource.DataSet.First;

      while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
      begin
        descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
        descripcioncortada := copy(descripcion, 0, 20);

        comando := '';
        texto := strpcopy(comando, (descripcioncortada) + '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
          floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat));
        error := ImprimirTextoLibre(comando);
        comando := '';
        texto := strpcopy(comando, ' ');
        error := ImprimirTextoLibre(comando);

        ffacturador.Gfacturador.DataSource.DataSet.Next;
      end;

      error := CerrarComprobante();

    end;

  end;

  comando := '';

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

  if Ticket.llevavale = 'SI' then
  BEGIN

    error := CerrarComprobante();

    comando := '';
    texto := strpcopy(comando, 'Vendedor: ' + Ticket.nom_vendedor);
    error := establecerencabezado(1, @comando[0]);

    if (Ticket.nombre_os = '') and (Ticket.nombre_co1 <> '') then
    begin
      comando := '';
      texto := strpcopy(comando, 'Obra Social: ' + Ticket.codigo_OS + '-' +
        Ticket.nombre_os);
      error := establecerencabezado(2, @comando[0]);
    end;

    if (Ticket.nombre_os = '') and (Ticket.nombre_co1 <> '') then
    begin
      comando := '';
      texto := strpcopy(comando, 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
        Ticket.afiliado_nombre);
      error := establecerencabezado(4, @comando[0]);

    end;
    if (Ticket.nombre_os <> '') then
    begin
      comando := '';
      texto := strpcopy(comando, 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
        Ticket.afiliado_nombre);
      error := establecerencabezado(4, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Nro afiliado: ' + Ticket.afiliado_numero);
      error := establecerencabezado(5, @comando[0]);

    end;
    comando := '';
    texto := strpcopy(comando, 'REC: ' + floattostr(Ticket.importebruto) +
      '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2)));
    error := EstablecerCola(1, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 + ' AFI: '
      + floattostr(roundto(afiliado, -2)));
    error := EstablecerCola(2, @comando[0]);
    comando := '';
     texto := strpcopy(comando,'EF: ' + floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' + floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' + floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' + floattostr(roundto(strtofloat(imp_tarjeta), -2))+' A+: ' + floattostr(roundto(strtofloat(imp_APLUS), -2)));
    error := EstablecerCola(3, @comando[0]);
    comando := '';

    error := abrircomprobante(21);

    texto := strpcopy(comando,
      '--------------------------------------------------');
    error := ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando, 'Emision VR' + Ticket.fiscla_pv + ': ' +
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)));
    error := ImprimirTextoLibre(comando);

    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
      BEGIN
        comando := '';
        texto := strpcopy(comando, ffacturador.Gfacturador.Fields[1].Asstring);
        error := ImprimirTextoLibre(comando);
        comando := '';
        texto := strpcopy(comando, 'Unidades Vale:' +
          (ffacturador.Gfacturador.Fields[18].Asstring));
        error := ImprimirTextoLibre(comando);

      END;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
    comando := '';
    texto := strpcopy(comando, 'REF. CPBT. ' + Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprob), '0', 8)));
    error := ImprimirTextoLibre(comando);

    texto := strpcopy(comando,
      '-----CORTAR-------------CORTAR------------CORTAR------------CORTAR------------️');
    error := ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando, 'Emision VR' + Ticket.fiscla_pv + ': ' +
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)));
    error := ImprimirTextoLibre(comando);

    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
      BEGIN
        comando := '';
        texto := strpcopy(comando, ffacturador.Gfacturador.Fields[1].Asstring);
        error := ImprimirTextoLibre(comando);
        comando := '';
        texto := strpcopy(comando, 'Unidades Vale:' +
          (ffacturador.Gfacturador.Fields[18].Asstring));
        error := ImprimirTextoLibre(comando);

      END;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
    comando := '';
    texto := strpcopy(comando, 'REF. CPBT. ' + Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprob), '0', 8)));
    error := ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando,
      '-----CORTAR-------------CORTAR------------CORTAR------------CORTAR------------');
    error := ImprimirTextoLibre(comando);

    error := CerrarComprobante();

  END;

  // ----------------------------talon obras sociales-------------------------------------//
  //----------------------------------TALON PROMO APLUS---------------------------------------//


  // ----------------------------talon PROMO APLUS-------------------------------------//
  error := Desconectar();
  FreeLibrary(dll);
  Imprimio := True;



  // finalizacion ticket-------------------------------------------------------------//

end;

procedure TFIMPRESION.ImprimirTicketT;
var
  ESTADOFISCAL: string;
  z: integer;
  RESPONSABLEIVA: TiposDeResponsabilidades;
  valoriva: double;
  direccioncliente: olevariant;
  descripcioncortada: string;
  descripcion: string;
  efectivoredondeado: double;
  afiliado: double;
  precioos441: double;
  co2cortado: string;
  ofecupon: string;
begin

  if not(ComenzarFiscal) then
  Begin
    ShowMessage('No se pudo conectar al fiscal');
    Imprimio := False;
    Exit;
  End;

  HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
  HASAR.CancelarComprobanteFiscal;

  HASAR.TratarDeCancelarTodo;
  if HASAR.DescripcionEstadoControlador = 'No hay ningún comprobante abierto'
  then
  beGIN
    HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
    HASAR.Encabezado[2] := Ticket.direccionsucursal;
    HASAR.Encabezado[8] := '-------------------------------------------';
    HASAR.AbrirComprobanteFiscal(TICKET_C);
    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[11].FieldName).Asstring = '0') then
      begin
        HASAR.ImprimirTextofiscal(Ticket.codigo_OS + ': ' +ffacturador.Gfacturador.DataSource.DataSet.FieldByName (ffacturador.Gfacturador.Columns[14].FieldName).Asstring + ' (' +(formatfloat('#####',ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[11].FieldName).AsFloat)) + '%)');
      end;
      if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[12].FieldName).Asstring = '0') then
      begin
        HASAR.ImprimirTextofiscal(Ticket.codigo_Co1 + ': ' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[20].FieldName).Asstring + ' (' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[12].FieldName).Asstring + '%)');
      end;
      // ------linea nueva agregada coseguro 2------//
      if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[13].FieldName).Asstring = '0') then
      begin
        HASAR.ImprimirTextofiscal(Ticket.codigo_Cos2 + ': ' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[27].FieldName).Asstring + ' (' +
          ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[13].FieldName).Asstring + '%)');
      end;
      // ------fin linea nueva agregada coseguro 2------//
      //------------agregado hasar---------------------------//
      if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[29].FieldName).Asstring = '0') then
      begin
        HASAR.ImprimirTextofiscal('aplus:' + ': ' +ffacturador.Gfacturador.DataSource.DataSet.FieldByName (ffacturador.Gfacturador.Columns[30].FieldName).Asstring + ' (' +(formatfloat('#####',ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[29].FieldName).AsFloat)) + '%)');
      end;
      //------------agregado hasar---------------------------//
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'B' then
      begin
        valoriva := Ticket.IVAB;
      end;
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'A' then
      begin
        valoriva := Ticket.IVAA;
      end;
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);

      if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '0' then
      BEGIN
        descripcion := '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
          descripcion;
      END;

      descripcioncortada := copy(descripcion, 0, 20);
      HASAR.ImprimirItem((descripcioncortada),
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[3].FieldName).AsFloat),
        ((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat) *
        Ticket.coeficientetarjeta), valoriva, 0);

      ffacturador.Gfacturador.DataSource.DataSet.Next;

    end;

    // --------------------------descuento general----------------------------------//
    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[22].FieldName).AsFloat <> 0 then
      begin
        descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
        if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '' then
        BEGIN
          descripcion := '(' +
            (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
            descripcion;
        END;

        descripcioncortada := copy(descripcion, 0, 20);
        HASAR.DescuentoGeneral(descripcioncortada,
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[24].FieldName).AsFloat), True);
      end;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

    // ----------------------------descuento general---------------------------------//
    if imp_efectivo = '' then
    begin
      imp_efectivo := '0';
    end;
    if imp_tarjeta = '' then
    begin
      imp_tarjeta := '0';
    end;
    if imp_cc = '' then
    begin
      imp_cc := '0';
    end;
    if imp_os = '' then
    begin
      imp_os := '0';
    end;
    if imp_co1 = '' then
    begin
      imp_co1 := '0';
    end;
    if imp_co2 = '' then
    begin
      imp_co2 := '0';
    end;
    if imp_ch = '' then
    begin
      imp_ch := '0';
    end;
    if imp_cc = '' then
    begin
      imp_cc := '0';
    end;
    //--------------------------AGREGADO HASAR---------------------//
    if imp_aplus = '' then
    begin
      imp_aplus:= '0';
    end;
    //--------------------------AGREGADO HASAR---------------------//
    afiliado := strtofloat(imp_efectivo) + strtofloat(imp_tarjeta) +
      strtofloat(imp_cc) + strtofloat(imp_ch);
    if imp_efectivo <> '0' then
    begin
      HASAR.ImprimirPago('Efectivo: ', strtofloat(imp_efectivo));
    end;

    if imp_tarjeta <> '0' then
    begin
      HASAR.ImprimirPago('Tarjeta ' + Ticket.codigotarjeta + ': ',
        strtofloat(imp_tarjeta));
    end;
    if imp_cc <> '0' then
    begin
      HASAR.ImprimirPago('CC ' + Ticket.codigocc + ' ' + Ticket.nombrecc + ':',
        strtofloat(imp_cc));
    end;
    if imp_ch <> '0' then
    begin
      HASAR.ImprimirPago('Cheque: ', strtofloat(imp_ch));
    end;
    if imp_os <> '0' then
    begin
      HASAR.ImprimirPago(Ticket.nombre_os, strtofloat(imp_os));
    end;
    if imp_co1 <> '0' then
    begin
      HASAR.ImprimirPago(Ticket.nombre_co1, strtofloat(imp_co1));
    end;
   //--------------------------AGREGADO HASAR---------------------//
    if imp_aplus <> '0' then
    begin
      HASAR.ImprimirPago('APLUS', strtofloat(imp_aplus));
    end;
    //--------------------------AGREGADO HASAR---------------------//

    if imp_co2 <> '0' then
    begin
      // hasar.ImprimirPago(ticket.nombre_cos2 ,strtofloat(imp_co2));
      co2cortado := Ticket.nombre_cos2;
      co2cortado := copy(co2cortado, 0, 23);
      HASAR.Encabezado[11] := co2cortado + '.' + '       ' + '$' + imp_co2;
    end;

    HASAR.Encabezado[12] := 'Numero de ref: ' + Ticket.valnroreferencia;
    if not(Ticket.puntos_farmavalor = '') or (Ticket.puntos_farmavalor = '0')
    then
    begin
      HASAR.Encabezado[14] := 'Puntos Autofarma plus: ' + Ticket.puntos_farmavalor;
      HASAR.Encabezado[15] := 'Los puntos se actualizan cada 24 hs';
    end;
    // --------------------  PROMO -----------------------------------------------------------------------//
    { if ticket.Oespecial='S' then
      BEGIN
      TRY

      if ticket.sumafarmacia<2000 then
      begin
      if ticket.sumafarmacia>1000 then
      begin
      generarcuponoferta('126');
      ofecupon:='%5:  '
      end;
      end;
      if ticket.sumafarmacia>2000 then
      begin
      generarcuponoferta('127');
      ofecupon:='%10:  '
      end;
      if cupon<>'' then
      begin
      hasar.Encabezado[16]:='Cupon oferta perfu '+ofecupon+cupon;
      end;
      EXCEPT

      END;
      END; }

    // --------------------  PROMO -----------------------------------------------------------------------//

    HASAR.BorrarFantasiaEncabezadoCola(False, True, False);

    HASAR.CerrarComprobanteFiscal;
    nro_comprob := strtoint(HASAR.respuesta[3]);
    Ticket.fechafiscal := HASAR.FechaHoraFiscal;
    Ticket.numero_ticketfiscal := nro_comprob;

    if Ticket.p441f = 'N' then
    BEGIN

      if (Ticket.codigo_OS <> '') or (Ticket.codigo_Co1 <> '') then
      begin

        HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
        HASAR.Encabezado[2] := 'Obra Social: ' + Ticket.codigo_OS + '-' +
          Ticket.nombre_os;
        HASAR.Encabezado[3] := 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
          Ticket.nombre_co1;
        HASAR.Encabezado[4] := 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
          Ticket.afiliado_nombre;
        HASAR.Encabezado[5] := 'Nro afiliado: ' + Ticket.afiliado_numero;
        HASAR.Encabezado[6] := 'Mat. Med: ' + Ticket.medico_nro_matricula;
        HASAR.Encabezado[7] := 'Receta: ' + Ticket.numero_receta;
        HASAR.Encabezado[8] := '    Numero de ref: ' + Ticket.valnroreferencia;
        HASAR.Encabezado[11] := 'REC: ' +
          floattostr(roundto((Ticket.importebruto), -2)) + '     OS: ' +
          floattostr(roundto(strtofloat(imp_os), -2));
        HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
          ' AFI: ' + floattostr(roundto(afiliado, -2));
        HASAR.Encabezado[13] := 'EF: ' +
          floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
          floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
          floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
          floattostr(roundto(strtofloat(imp_tarjeta), -2));

      end;
      if Ticket.codigo_OS <> '' then
      begin
        z := z + 1
      end;
      if Ticket.codigo_Co1 <> '' then
      begin
        z := z + 1
      end;
      { if ticket.codigo_Cos2<>'' then
        begin
        z:=z+1
        end; }
      HASAR.DNFHFarmacias(z);
      HASAR.finalizar;

    END;
    if Ticket.p441f = 'S' then
    begin
      if Ticket.codigo_OS <> '' then
      begin
        HASAR.Comenzar;
        HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
        HASAR.CancelarComprobanteFiscal;
        HASAR.TratarDeCancelarTodo;
        HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
        HASAR.Encabezado[2] := 'Obra Social: ' + Ticket.codigo_OS + '-' +
          Ticket.nombre_os;
        HASAR.Encabezado[3] := 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
          Ticket.nombre_co1;
        HASAR.Encabezado[4] := 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
          Ticket.afiliado_nombre;
        HASAR.Encabezado[5] := 'Nro afiliado: ' + Ticket.afiliado_numero;
        HASAR.Encabezado[6] := 'Mat. Med: ' + Ticket.medico_nro_matricula;
        HASAR.Encabezado[7] := 'Receta: ' + Ticket.numero_receta;
        HASAR.Encabezado[9] := 'Numero de ref: ' + Ticket.valnroreferencia;
        HASAR.Encabezado[11] := 'REC: ' +
          floattostr(roundto((Ticket.importebruto), -2)) + '     OS: ' +
          floattostr(roundto(strtofloat(imp_os), -2));
        HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
          ' AFI: ' + floattostr(roundto(afiliado, -2));
        HASAR.Encabezado[13] := 'EF: ' +
          floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
          floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
          floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
          floattostr(roundto(strtofloat(imp_tarjeta), -2));
        HASAR.AbrirComprobanteNoFiscal;
        HASAR.ImprimirTextoNoFiscal('DOCUMENTO NO FISCAL HOMOLOGADO');
        HASAR.ImprimirTextoNoFiscal('NRO TICKET: ' + Ticket.fiscla_pv +
          (RightPad(inttostr(nro_comprob), '0', 8)));
        HASAR.ImprimirTextoNoFiscal
          ('--------------------------------------------------');
        ffacturador.Gfacturador.DataSource.DataSet.First;

        while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
        begin
          descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
          descripcioncortada := copy(descripcion, 0, 20);
          precioos441 :=
            roundto((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat), -2);
          HASAR.ImprimirTextoNoFiscal((descripcioncortada) + '(' +
            (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
            floattostr(precioos441));
          HASAR.ImprimirTextoNoFiscal('Unidades vale: ' +
            ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[18].FieldName).Asstring);
          HASAR.ImprimirTextoNoFiscal(' ');
          ffacturador.Gfacturador.DataSource.DataSet.Next;
        end;

        HASAR.CerrarComprobanteNoFiscal;

      end;
      if Ticket.codigo_Co1 <> '' then
      begin
        HASAR.Comenzar;
        HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
        HASAR.CancelarComprobanteFiscal;
        HASAR.TratarDeCancelarTodo;
        HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
        HASAR.Encabezado[2] := 'Obra Social: ' + Ticket.codigo_OS + '-' +
          Ticket.nombre_os;
        HASAR.Encabezado[3] := 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
          Ticket.nombre_co1;
        HASAR.Encabezado[4] := 'Afiliado: ' + Ticket.afiliado_nombre + ' ' +
          Ticket.afiliado_apellido;
        HASAR.Encabezado[5] := 'Nro afiliado: ' + Ticket.afiliado_numero;
        HASAR.Encabezado[6] := 'Mat. Med: ' + Ticket.medico_nro_matricula;
        HASAR.Encabezado[7] := 'Receta: ' + Ticket.numero_receta;
        HASAR.Encabezado[9] := 'Numero de ref: ' + Ticket.valnroreferencia;
        HASAR.Encabezado[11] := 'REC: ' + floattostr(Ticket.importebruto) +
          '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2));
        HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
          ' AFI: ' + floattostr(roundto(afiliado, -2));
        HASAR.Encabezado[13] := 'EF: ' +
          floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
          floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
          floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
          floattostr(roundto(strtofloat(imp_tarjeta), -2));
        HASAR.AbrirComprobanteNoFiscal;
        HASAR.ImprimirTextoNoFiscal('DOCUMENTO NO FISCAL FARMACIAS');
        HASAR.ImprimirTextoNoFiscal('NRO TICKET: ' + Ticket.fiscla_pv +
          (RightPad(inttostr(nro_comprob), '0', 8)));
        HASAR.ImprimirTextoNoFiscal
          ('------------------------------------------');
        ffacturador.Gfacturador.DataSource.DataSet.First;

        while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
        begin
          descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
          descripcioncortada := copy(descripcion, 0, 20);
          precioos441 :=
            roundto((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat), -2);
          HASAR.ImprimirTextoNoFiscal((descripcioncortada) + '(' +
            (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
            floattostr(precioos441));
          HASAR.ImprimirTextoNoFiscal('Unidades vale: ' +
            ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[18].FieldName).Asstring);
          HASAR.ImprimirTextoNoFiscal(' ');
          ffacturador.Gfacturador.DataSource.DataSet.Next;
        end;

        HASAR.CerrarComprobanteNoFiscal;

      end;

      if Ticket.codigo_Cos2 <> '' then
      begin
        HASAR.Comenzar;
        HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
        HASAR.CancelarComprobanteFiscal;
        HASAR.TratarDeCancelarTodo;
        HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;
        HASAR.Encabezado[2] := 'Obra Social: ' + Ticket.codigo_OS + '-' +
          Ticket.nombre_os;
        HASAR.Encabezado[3] := 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
          Ticket.nombre_co1;
        HASAR.Encabezado[4] := 'Afiliado: ' + Ticket.afiliado_nombre + ' ' +
          Ticket.afiliado_apellido;
        HASAR.Encabezado[5] := 'Nro afiliado: ' + Ticket.afiliado_numero;
        HASAR.Encabezado[6] := 'Mat. Med: ' + Ticket.medico_nro_matricula;
        HASAR.Encabezado[7] := 'Receta: ' + Ticket.numero_receta;
        HASAR.Encabezado[9] := 'Numero de ref: ' + Ticket.valnroreferencia;
        HASAR.Encabezado[11] := 'REC: ' + floattostr(Ticket.importebruto) +
          '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2));
        HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
          ' AFI: ' + floattostr(roundto(afiliado, -2));
        HASAR.Encabezado[13] := 'EF: ' +
          floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
          floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
          floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
          floattostr(roundto(strtofloat(imp_tarjeta), -2));
        HASAR.AbrirComprobanteNoFiscal;
        HASAR.ImprimirTextoNoFiscal('DOCUMENTO NO FISCAL FARMACIAS');
        HASAR.ImprimirTextoNoFiscal('NRO TICKET: ' + Ticket.fiscla_pv +
          (RightPad(inttostr(nro_comprob), '0', 8)));
        HASAR.ImprimirTextoNoFiscal
          ('------------------------------------------');
        ffacturador.Gfacturador.DataSource.DataSet.First;

        while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
        begin
          descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
          descripcioncortada := copy(descripcion, 0, 20);
          precioos441 :=
            roundto((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat), -2);
          HASAR.ImprimirTextoNoFiscal((descripcioncortada) + '(' +
            (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
            floattostr(precioos441));
          HASAR.ImprimirTextoNoFiscal('Unidades vale: ' +
            ffacturador.Gfacturador.DataSource.DataSet.FieldByName
            (ffacturador.Gfacturador.Columns[18].FieldName).Asstring);
          HASAR.ImprimirTextoNoFiscal(' ');
          ffacturador.Gfacturador.DataSource.DataSet.Next;
        end;

        HASAR.CerrarComprobanteNoFiscal;

      end;

    end;

    if Ticket.llevavale = 'SI' then
    BEGIN
      HASAR.Comenzar;
      HASAR.BorrarFantasiaEncabezadoCola(True, True, True);
      HASAR.CancelarComprobanteFiscal;
      HASAR.TratarDeCancelarTodo;
      HASAR.Encabezado[1] := 'Vendedor: ' + Ticket.nom_vendedor;

      if (Ticket.nombre_os = '') and (Ticket.nombre_co1 <> '') then
      begin
        HASAR.Encabezado[2] := 'Cobertura: ' + Ticket.nombre_co1;
      end;
      if Ticket.nombre_os <> '' then
      begin
        HASAR.Encabezado[2] := 'Cobertura: ' + Ticket.nombre_os;
      end;
      if (Ticket.nombre_os = '') and (Ticket.nombre_co1 = '') then
      begin
        HASAR.Encabezado[2] := 'Cobertura: ';
      end;
      if (Ticket.nombre_os = '') and (Ticket.nombre_co1 <> '') then
      begin
        HASAR.Encabezado[3] := 'Afiliado: ' + Ticket.afiliado_nombreco1 + ' ' +
          Ticket.afiliado_apellidoco1;
        HASAR.Encabezado[4] := 'Nro afiliado: ' + Ticket.afiliado_numeroco1;
      end;
      if (Ticket.nombre_os <> '') then
      begin
        HASAR.Encabezado[3] := 'Afiliado: ' + Ticket.afiliado_nombre + ' ' +
          Ticket.afiliado_apellido;
        HASAR.Encabezado[4] := 'Nro afiliado: ' + Ticket.afiliado_numero;
      end;

      HASAR.Encabezado[5] := '* * * * * * VALE A RETIRAR * * * * * *';
      HASAR.Encabezado[11] := 'REC: ' + floattostr(Ticket.importebruto) +
        '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2));
      HASAR.Encabezado[12] := 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 + ' AFI: '
        + floattostr(roundto(afiliado, -2));
      HASAR.Encabezado[13] := 'EF: ' +
        floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
        floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
        floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
        floattostr(roundto(strtofloat(imp_tarjeta), -2));
      HASAR.AbrirComprobanteNoFiscal;
      HASAR.ImprimirTextoNoFiscal('Emision VR' + Ticket.fiscla_pv + ': ' +
        Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)));
      ffacturador.Gfacturador.DataSource.DataSet.First;

      while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
      begin
        if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
        BEGIN
          HASAR.ImprimirTextoNoFiscal(ffacturador.Gfacturador.Fields[1]
            .Asstring);
          HASAR.ImprimirTextoNoFiscal('Unidades Vale:' +
            ffacturador.Gfacturador.Fields[18].Asstring);
        END;
        ffacturador.Gfacturador.DataSource.DataSet.Next;
      end;
      HASAR.ImprimirTextoNoFiscal('REF. CPBT. ' + Ticket.fiscla_pv +
        (RightPad(inttostr(nro_comprob), '0', 8)));
      HASAR.ImprimirTextoNoFiscal('*****VALIDO X 30 DIAS MAXIMO****');
      HASAR.CerrarComprobanteNoFiscal;

    END;

    Imprimio := True;
  end;
end;

procedure TFIMPRESION.ImprimirTicketT2(var Imprimio: boolean);
var
  ESTADOFISCAL: string;
  z: integer;
  RESPONSABLEIVA: TiposDeResponsabilidades;
  valoriva: double;
  direccioncliente: olevariant;
  descripcioncortada: string;
  descripcion: string;
  efectivoredondeado: double;
  afiliado: double;
  atTexto: AtributosDeTexto;
  respuesta: respuestaconsultarestado;
  numero: integer;
  CONDICIONIVA: CondicionesIVA;
  respuestafecha: RespuestaConsultarFechaHora;
  ofecupon: string;
  //--------------------
  ENTRAPROMO: STRING;
  ENTRAPROMODOBLE:STRING;
  TOTALRUBRO: DOUBLE;
  RUBRO: STRING;
  LABORATORIO: STRING;
BEGIN

  hasar2 := TImpresoraFiscalRG3561.Create(SELF);

  atTexto.BorradoTexto := True;

  hasar2.Conectar(Ticket.ipfiscal, 80, 4000, 4000);
  if hasar2.ObtenerUltimoEstadoFiscal.DocumentoAbierto = True then
  begin
    hasar2.CerrarDocumento(0, 'maximiliano.guzman@autofarma.net');
  end;
  if not(ComenzarFiscal) then
  Begin
    ShowMessage('No se pudo conectar al fiscal');
    Imprimio := False;
    Exit;
  End;

  atTexto.DobleAncho := False;
  atTexto.BorradoTexto := False;
  hasar2.ConfigurarZona(1, atTexto, 'Vendedor:' + Ticket.nom_vendedor,
    EstacionTicket, Zona1Encabezado);
  hasar2.ConfigurarZona(2, atTexto, Ticket.direccionsucursal, EstacionTicket,
    Zona1Encabezado);
  hasar2.AbrirDocumento(tique);

  ffacturador.Gfacturador.DataSource.DataSet.First;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[11].FieldName).Asstring = '0') then
    begin
      hasar2.ImprimirTextofiscal(atTexto, Ticket.codigo_OS + ': ' +
        ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[14].FieldName).Asstring + ' (' +
        (formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.
        FieldByName(ffacturador.Gfacturador.Columns[11].FieldName).AsFloat)) +
        '%)', DisplayNO);
    end;
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[12].FieldName).Asstring = '0') then
    begin
      hasar2.ImprimirTextofiscal(atTexto, Ticket.codigo_Co1 + ': ' +
        ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[20].FieldName).Asstring + ' (' +
        ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[12].FieldName).Asstring + '%)',
        DisplayNO);
    end;
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[13].FieldName).Asstring = '0') then
    begin
      hasar2.ImprimirTextofiscal(atTexto, Ticket.codigo_Cos2 + ': ' +
        ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[27].FieldName).Asstring + ' (' +
        ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[13].FieldName).Asstring + '%)',
        DisplayNO);
    end;

    //--------------agregado hasar2-----------------//
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[29].FieldName).Asstring = '0') then
    begin
      hasar2.ImprimirTextofiscal(atTexto, 'aplus: ' + ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[30].FieldName).Asstring + ' (' +ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[29].FieldName).Asstring + '%)',DisplayNO);
    end;
    //--------------agregado hasar2-----------------//

    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'B' then
    begin
      valoriva := Ticket.IVAB;
    end;
    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'A' then
    begin
      valoriva := Ticket.IVAA;
    end;
    descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);

    if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '0' then
    BEGIN
      descripcion := '(' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
        descripcion;
    END;
    if valoriva > 0 then
    begin
      CONDICIONIVA := Gravado;
    end;
    if valoriva = 0 then
    begin
      CONDICIONIVA := Exento;
    end;

    descripcioncortada := copy(descripcion, 0, 20);

    hasar2.ImprimirItem((descripcioncortada),
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[3].FieldName).AsFloat),
      ((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat) *
      Ticket.coeficientetarjeta), CONDICIONIVA, valoriva, ModoSumaMonto,
      IIVariablePorcentual, 0, DisplayNO, ModoPrecioTotal, 1,
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[9].FieldName).Asstring),
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[8].FieldName).Asstring), Unidad);
    ffacturador.Gfacturador.DataSource.DataSet.Next;

  end;

  // --------------------------descuento general----------------------------------//
  ffacturador.Gfacturador.DataSource.DataSet.First;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin
    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[22].FieldName).AsFloat <> 0 then
    begin
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
      if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '' then
      BEGIN
        descripcion := '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
          descripcion;
      END;

      descripcioncortada := copy(descripcion, 0, 20);
      hasar2.ImprimirDescuentoItem(descripcioncortada,
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[24].FieldName).AsFloat), DisplayNO,
        ModoPrecioTotal);

    end;
    ffacturador.Gfacturador.DataSource.DataSet.Next;
  end;

  // ----------------------------descuento general---------------------------------//
  if imp_efectivo = '' then
  begin
    imp_efectivo := '0';
  end;
  if imp_tarjeta = '' then
  begin
    imp_tarjeta := '0';
  end;
  if imp_cc = '' then
  begin
    imp_cc := '0';
  end;
  if imp_os = '' then
  begin
    imp_os := '0';
  end;
  if imp_co1 = '' then
  begin
    imp_co1 := '0';
  end;
  if imp_co2 = '' then
  begin
    imp_co2 := '0';
  end;
  if imp_ch = '' then
  begin
    imp_ch := '0';
  end;
  if imp_cc = '' then
  begin
    imp_cc := '0';
  end;
  //---------------agregado hasar2------------//
  if imp_aplus = '' then
  begin
      imp_aplus:= '0';
  end;
    //---------------agregado hasar2------------//
  afiliado := strtofloat(imp_efectivo) + strtofloat(imp_tarjeta) +
    strtofloat(imp_cc) + strtofloat(imp_ch);
  if imp_efectivo <> '0' then
  begin
    hasar2.ImprimirPago('Efectivo: ', strtofloat(imp_efectivo), Pagar,
      DisplayNO, '', Efectivo, 0, '', '');

  end;

  if imp_tarjeta <> '0' then
  begin
    hasar2.ImprimirPago('Tarjeta ' + Ticket.codigotarjeta + ': ',
      strtofloat(imp_tarjeta), Pagar, DisplayNO, '', Efectivo, 0, '', '');
  end;
  if imp_cc <> '0' then
  begin
    hasar2.ImprimirPago('CC ' + Ticket.codigocc + ' ' + Ticket.nombrecc + ':',
      strtofloat(imp_cc), Pagar, DisplayNO, '', Efectivo, 0, '', '');
  end;
  if imp_ch <> '0' then
  begin
    hasar2.ImprimirPago('Cheque: ', strtofloat(imp_ch), Pagar, DisplayNO, '',
      Efectivo, 0, '', '');
  end;
  if imp_os <> '0' then
  begin
    hasar2.ImprimirPago(Ticket.nombre_os, strtofloat(imp_os), Pagar, DisplayNO,
      '', Efectivo, 0, '', '');
  end;
  if imp_co1 <> '0' then
  begin
    hasar2.ImprimirPago(Ticket.nombre_co1, strtofloat(imp_co1), Pagar,
      DisplayNO, '', Efectivo, 0, '', '');
  end;
  if imp_co2 <> '0' then
  begin
    hasar2.ImprimirPago(Ticket.nombre_cos2, strtofloat(imp_co2), Pagar,
      DisplayNO, '', Efectivo, 0, '', '');
  end;
 //---------------agregado hasar2------------//
  if imp_aplus <> '0' then
  begin
    hasar2.ImprimirPago('aplus:', strtofloat(imp_aplus), Pagar,
      DisplayNO, '', Efectivo, 0, '', '');
  end;
  //---------------agregado hasar2------------//

  hasar2.ConfigurarZona(1, atTexto, ' ', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(1, atTexto, 'Numero de ref: ' + Ticket.valnroreferencia,
    EstacionTicket, Zona2cola);
  if not(Ticket.puntos_farmavalor = '') or (Ticket.puntos_farmavalor = '0') then
  begin
    hasar2.ConfigurarZona(2, atTexto, ' ', EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(2, atTexto, 'Puntos Autofarma plus: ' +
      Ticket.puntos_farmavalor, EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(3, atTexto, ' ', EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(3, atTexto, 'Los puntos se actualizan cada 24 hs' +
      Ticket.puntos_farmavalor, EstacionTicket, Zona2cola);
  end;

  // --------------------  PROMO -----------------------------------------------------------------------//
  { if ticket.Oespecial='S' then
    BEGIN
    TRY

    if ticket.sumafarmacia<2000 then
    begin
    if ticket.sumafarmacia>1000 then
    begin
    generarcuponoferta('126');
    ofecupon:='%5:  '
    end;
    end;
    if ticket.sumafarmacia>2000 then
    begin
    generarcuponoferta('127');
    ofecupon:='%10:  '
    end;
    if cupon<>'' then
    begin

    HASAR2.ConfigurarZona(4,  attexto, ' ' ,EstacionTicket, Zona2cola);
    HASAR2.ConfigurarZona(4,  attexto, 'Cupon oferta perfu'+ofecupon+cupon ,EstacionTicket, Zona2cola);
    end;
    EXCEPT

    END;
    END; }

  // --------------------  PROMO -----------------------------------------------------------------------//

  hasar2.CerrarDocumento(0, 'maximiliano.guzman@autofarma.net');

  respuesta := hasar2.ConsultarEstado(tique);
  nro_comprob := respuesta.NumeroUltimoComprobante;
  respuestafecha := hasar2.ConsultarFechaHora;
  Ticket.fechafiscal := respuestafecha.Fecha + respuestafecha.Hora;
  Ticket.numero_ticketfiscal := nro_comprob;
  // if (ticket.codigo_OS<>'') or (ticket.codigo_Co1<>'') then
  // begin
  hasar2.PedirReimpresion;
  // end;
  // ------------------------------------------------------COPIA OS-----------------------------------------//
  if (Ticket.codigo_OS <> '') or (Ticket.codigo_Co1 <> '') then
  begin

    hasar2.ConfigurarZona(1, atTexto, 'Vendedor:' + Ticket.nom_vendedor,
      EstacionTicket, Zona1Encabezado);
    hasar2.ConfigurarZona(2, atTexto, Ticket.direccionsucursal, EstacionTicket,
      Zona1Encabezado);
    hasar2.ConfigurarZona(1, atTexto, 'Obra Social: ' + Ticket.codigo_OS + '-' +
      Ticket.nombre_os, EstacionTicket, Zona1cola);
    hasar2.ConfigurarZona(2, atTexto, 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
      Ticket.nombre_co1, EstacionTicket, Zona1cola);
    hasar2.ConfigurarZona(3, atTexto, 'Afiliado: ' + Ticket.afiliado_apellido +
      ' ' + Ticket.afiliado_nombre, EstacionTicket, Zona1cola);
    hasar2.ConfigurarZona(4, atTexto, 'Nro afiliado: ' + Ticket.afiliado_numero,
      EstacionTicket, Zona1cola);
    hasar2.ConfigurarZona(1, atTexto,
      'Mat. Med: ' + Ticket.medico_nro_matricula, EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(2, atTexto, 'Receta: ' + Ticket.numero_receta,
      EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(3, atTexto, 'Numero de ref: ' +
      Ticket.valnroreferencia, EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(4, atTexto, 'REC: ' + floattostr(Ticket.importebruto)
      + '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2)),
      EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(5, atTexto, 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
      ' AFI: ' + floattostr(roundto(afiliado, -2)), EstacionTicket, Zona2cola);
    hasar2.ConfigurarZona(6, atTexto,
      'EF: ' + floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
      floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
      floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
      floattostr(roundto(strtofloat(imp_tarjeta), -2)), EstacionTicket,
      Zona2cola);

    hasar2.AbrirDocumento(Generico);
    hasar2.ImprimirTextoGenerico(atTexto, 'NRO TICKET: ' + Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprob), '0', 8)), DisplayNO);
    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
      descripcioncortada := copy(descripcion, 0, 20);
      hasar2.ImprimirTextoGenerico(atTexto, (descripcioncortada) + '(' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
        floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat), DisplayNO);
      hasar2.ImprimirTextoGenerico(atTexto, ' ', DisplayNO);
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

    hasar2.CerrarDocumento(0, 'maximiliano.guzman@autofarma.net');
    if Ticket.codigo_Co1 <> '' then
    begin
      hasar2.PedirReimpresion;
    end;
  end;

  // ------------------------------------------------------COPIA OS-----------------------------------------//
  // --------------------------------------------vale-------------------------------------------------------//
  if Ticket.llevavale = 'SI' then
  BEGIN

    atTexto.DobleAncho := True;
    atTexto.Negrita := True;
    atTexto.Centrado := True;
    hasar2.AbrirDocumento(Generico);

    hasar2.ImprimirTextoGenerico(atTexto,
      '---------  VALE A RETIRAR --------- ', DisplayNO);

    atTexto.DobleAncho := False;
    atTexto.Negrita := False;
    atTexto.Centrado := False;
    // ----------//
    hasar2.ImprimirTextoGenerico(atTexto, 'Vendedor:' + Ticket.nom_vendedor,
      DisplayNO);
    hasar2.ImprimirTextoGenerico(atTexto,
      'Fecha:' + datetostr(Ticket.fechafiscal), DisplayNO);
    // ---------//
    hasar2.ImprimirTextoGenerico(atTexto, 'Emision VR' + Ticket.fiscla_pv + ': '
      + Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)),
      DisplayNO);
    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
      BEGIN
        descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
        descripcioncortada := copy(descripcion, 0, 20);
        hasar2.ImprimirTextoGenerico(atTexto, (descripcioncortada) + '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
          floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat), DisplayNO);
        hasar2.ImprimirTextoGenerico(atTexto,
          'Unidades Vale:' + ffacturador.Gfacturador.Fields[18].Asstring,
          DisplayNO);

      END;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
    hasar2.ImprimirTextoGenerico(atTexto, 'REF. CPBT. ' + Ticket.fiscla_pv +
      ': ' + Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)),
      DisplayNO);
    hasar2.ImprimirTextoGenerico(atTexto, '****VALIDO X 30 DIAS MAXIMO****',
      DisplayNO);

    atTexto.DobleAncho := True;
    atTexto.Negrita := True;
    atTexto.Centrado := True;

    hasar2.ImprimirTextoGenerico(atTexto, '--------- VALE A RETIRAR --------',
      DisplayNO);

    atTexto.DobleAncho := False;
    atTexto.Negrita := False;
    atTexto.Centrado := False;
    // ----------//
    hasar2.ImprimirTextoGenerico(atTexto, 'Vendedor:' + Ticket.nom_vendedor,
      DisplayNO);
    hasar2.ImprimirTextoGenerico(atTexto,
      'Fecha:' + datetostr(Ticket.fechafiscal), DisplayNO);
    // ---------//
    hasar2.ImprimirTextoGenerico(atTexto, 'Emision VR' + Ticket.fiscla_pv + ': '
      + Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)),
      DisplayNO);
    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
      BEGIN
        descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
        descripcioncortada := copy(descripcion, 0, 20);
        hasar2.ImprimirTextoGenerico(atTexto, (descripcioncortada) + '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
          floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat), DisplayNO);
        hasar2.ImprimirTextoGenerico(atTexto,
          'Unidades Vale:' + ffacturador.Gfacturador.Fields[18].Asstring,
          DisplayNO);

      END;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
    hasar2.ImprimirTextoGenerico(atTexto, 'REF. CPBT. ' + Ticket.fiscla_pv +
      ': ' + Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)),
      DisplayNO);
    hasar2.ImprimirTextoGenerico(atTexto, '*****VALIDO X 30 DIAS MAXIMO****',
      DisplayNO);

    hasar2.CerrarDocumento(0, 'maximiliano.guzman@autofarma.net');

  END;

  //--------------------------------------PROMO APLUS-------------------------------//

  //--------------------------------------PROMO APLUS-------------------------------//
  atTexto.BorradoTexto := True;
  hasar2.ConfigurarZona(1, atTexto, '', EstacionTicket, Zona1Encabezado);
  hasar2.ConfigurarZona(2, atTexto, '', EstacionTicket, Zona1Encabezado);
  hasar2.ConfigurarZona(3, atTexto, '', EstacionTicket, Zona1Encabezado);
  hasar2.ConfigurarZona(1, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(2, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(3, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(4, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(4, atTexto, '', EstacionTicket, Zona1cola);
  hasar2.ConfigurarZona(1, atTexto, '', EstacionTicket, Zona2encabezado);
  hasar2.ConfigurarZona(2, atTexto, '', EstacionTicket, Zona2encabezado);
  hasar2.ConfigurarZona(3, atTexto, '', EstacionTicket, Zona2encabezado);
  hasar2.ConfigurarZona(1, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(2, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(3, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(4, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(5, atTexto, '', EstacionTicket, Zona2cola);
  hasar2.ConfigurarZona(6, atTexto, '', EstacionTicket, Zona2cola);

  hasar2.DestroyComponents;
  hasar2.DisposeOf;

  Imprimio := True;

END;

procedure TFIMPRESION.ImprimirTicketTepson(var Imprimio: boolean);

var
  dll: THandle;
  error: LongInt;
  str: Array [0 .. 200] of Char;
  mayor: LongInt;
  menor: LongInt;
  mychar: Char;
  ESTADOFISCAL: string;
  z: integer;
  RESPONSABLEIVA: TiposDeResponsabilidades;
  valoriva: double;
  direccioncliente: olevariant;
  descripcioncortada: string;
  descripcion: string;
  efectivoredondeado: double;
  afiliado: double;
  prueba: Array [0 .. 200] of AnsiChar;
  comando: Array [0 .. 200] of AnsiChar;
  cantidadep: Array [0 .. 200] of AnsiChar;
  precioep: Array [0 .. 200] of AnsiChar;
  alfabetaep: Array [0 .. 200] of AnsiChar;
  monto: Array [0 .. 200] of AnsiChar;
  tipcomprob: Array [0 .. 200] of AnsiChar;
  respuesta: Array [0 .. 10000] of AnsiChar;
  numero: array [0 .. 10000] of LongInt;
  fechahora: array [0 .. 300] of AnsiChar;
  respuesta_final_buffer_salida: integer;
  dnfh: string;
  valorivaep: integer;
  texto: string;
  ofecupon: string;
  //-------------------
  RUBRO: STRING;
  TOTALRUBRO:DOUBLE;
  ENTRAPROMO: STRING;
  LABORATORIO: STRING;
  ENTRAPROMODOBLE: STRING;
begin



  mayor := 0;
  menor := 0;
  mychar := ' ';
  error := fiscalEpson.ConsultarVersionDll(str, 100, mayor, menor);
  error := fiscalEpson.ConfigurarVelocidad(9600);
  error := fiscalEpson.ConfigurarPuerto(Ticket.puerto_com);
  error := fiscalEpson.CerrarComprobante();
  error := fiscalEpson.Conectar();
  error := fiscalEpson.ConsultarNumeroComprobanteUltimo('83', @respuesta, 2000);
  nro_comprobdigital := strtoint(respuesta) + 1;
  copiadigital;
  // ---------------------------borrado encabezados y cola-----------------------//
  comando := '';

  fiscalEpson.borrarEncabezadoYCola;

  // -----------------------------------------------------------------------------//
  // ----------------------nombre vendedor----------------------------------------//

  comando := '';
  texto := strpcopy(comando, 'Vendedor: ' + (Ticket.nom_vendedor));
  error := fiscalEpson.establecerencabezado(1, @comando[0]);

  // -----------------------------------------------------------------------------//
  // ----------------------Direccion fiscal----------------------------------------//
  comando := '';
  texto := strpcopy(comando, '050E|0000|' + (Ticket.direccionsucursal));

  error := fiscalEpson.EnviarComando(@comando[0]);

  // -----------------------------------------------------------------------------//
  // --------------------------apertura de comprobante C---------------------------//

  error := fiscalEpson.abrircomprobante(2);

  // -------------------------------------------------------------------------------//
  // -----------------------------CARGA DE ITEMS------------------------------------//
  ffacturador.Gfacturador.DataSource.DataSet.First;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin

    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[11].FieldName).Asstring = '0') then
    begin
      comando := '';
      texto := strpcopy(comando, Ticket.codigo_OS + ': ' + (ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[14].FieldName).Asstring + ' (' +(formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[11].FieldName).AsFloat)) + '%)'));
      error := fiscalEpson.CargarTextoExtra(comando)
    end;
//------------------agregado-------------------///
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[29].FieldName).Asstring = '0') then
    begin
      comando := '';
      texto := strpcopy(comando, 'aplus' + ': ' + (ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[30].FieldName).Asstring + ' (' +(formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[29].FieldName).AsFloat)) + '%)'));
      error := fiscalEpson.CargarTextoExtra(comando)
    end;
//------------------agregado-------------------///
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[12].FieldName).Asstring = '0') then
    begin
      comando := '';
      texto := strpcopy(comando, Ticket.codigo_Co1 + ': ' + (ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[20].FieldName).Asstring + ' (' +(formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[12].FieldName).AsFloat)) + '%)'));
      error := fiscalEpson.CargarTextoExtra(comando)
    end;
    if not(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[13].FieldName).Asstring = '0') then
    begin
      comando := '';
      texto := strpcopy(comando, Ticket.codigo_Cos2 + ': ' +(ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[27].FieldName).Asstring + ' (' +(formatfloat('#####', ffacturador.Gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[13].FieldName).AsFloat)) + '%)'));
      error := fiscalEpson.CargarTextoExtra(comando)
    end;
    if NOT((Ticket.sucursal = '202') OR (Ticket.sucursal = '203') OR
      (Ticket.sucursal = '221')) then
    BEGIN
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'B' then
      begin
        valorivaep := 5;
      end;
    END;
    if ((Ticket.sucursal = '202') OR (Ticket.sucursal = '203') OR
      (Ticket.sucursal = '221')) then
    BEGIN
      if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'B' then
      begin
        valorivaep := 1;
      end;
    END;
    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[10].FieldName).Asstring = 'A' then
    begin
      valorivaep := 1;
    end;

    descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);

    if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '0' then
    BEGIN
      descripcion := '(' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
        descripcion;
    END;

    descripcioncortada := copy(descripcion, 0, 20);
    comando := '';
    texto := strpcopy(comando, descripcioncortada);

    texto := strpcopy(cantidadep,
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[3].FieldName).Asstring));

    texto := strpcopy(precioep,
      floattostr((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat) *
      Ticket.coeficientetarjeta));

    texto := strpcopy(alfabetaep,
      (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[0].FieldName).Asstring));

    error := fiscalEpson.ImprimirItem(200, comando, cantidadep, precioep, valorivaep, 0,
      (''), 1, alfabetaep, (''), 7);

    ffacturador.Gfacturador.DataSource.DataSet.Next;
  end;
  // -----------------------------CARGA DE ITEMS------------------------------------//
  // --------------------------descuento general----------------------------------//
  ffacturador.Gfacturador.DataSource.DataSet.First;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin
    if ffacturador.Gfacturador.DataSource.DataSet.FieldByName
      (ffacturador.Gfacturador.Columns[22].FieldName).AsFloat <> 0 then
    begin
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
      if (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) <> '' then
      BEGIN
        descripcion := '(' + (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[18].FieldName).Asstring) + ')' +
          descripcion;
      END;

      descripcioncortada := copy(descripcion, 0, 20);
      texto := strpcopy(comando, descripcioncortada);
      texto := strpcopy(precioep,
        floattostr((ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[24].FieldName).AsFloat) *
        Ticket.coeficientetarjeta));

      error := fiscalEpson.Cargarajuste(400, comando, precioep, valorivaep, alfabetaep);

    end;
    ffacturador.Gfacturador.DataSource.DataSet.Next;

  end;

  // ----------------------------descuento general---------------------------------//

  // ----------------------------PAGOS-----------------------------------------------//
  if imp_efectivo = '' then
  begin
    imp_efectivo := '0';
  end;
  if imp_tarjeta = '' then
  begin
    imp_tarjeta := '0';
  end;
  if imp_cc = '' then
  begin
    imp_cc := '0';
  end;
  if imp_os = '' then
  begin
    imp_os := '0';
  end;
  if imp_co1 = '' then
  begin
    imp_co1 := '0';
  end;
  if imp_co2 = '' then
  begin
    imp_co2 := '0';
  end;
  if imp_ch = '' then
  begin
    imp_ch := '0';
  end;
  if imp_cc = '' then
  begin
    imp_cc := '0';
  end;
  if imp_gentilezas = '' then
  begin
    imp_cc := '0';
  end;
//------------------agregado-------------------///
   if imp_aplus = '' then
  begin
    imp_aplus:= '0';
  end;
//------------------agregado-------------------///
  afiliado := strtofloat(imp_efectivo) + strtofloat(imp_tarjeta) +
    strtofloat(imp_cc) + strtofloat(imp_ch);
  if imp_efectivo <> '0' then
  begin
    monto := '';
    texto := strpcopy(monto, imp_efectivo);
    comando := '';
    texto := strpcopy(comando, '');
    error := fiscalEpson.CargarPago(200, 8, 0, monto, '', comando, '', '');
  end;

  if imp_tarjeta <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_tarjeta);
    comando := '';
    texto := strpcopy(comando, 'Tarjeta ' + Ticket.codigotarjeta + ': ');
    error := fiscalEpson.CargarPago(200, 20, 0, monto, '', comando, '', '');
  end;

  if imp_cc <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_cc);
    comando := '';
    texto := strpcopy(comando, 'CC ' + Ticket.codigocc + ' ' + Ticket.nombrecc);
    error := fiscalEpson.CargarPago(200, 6, 0, monto, '', comando, '', '');

  end;
  if imp_ch <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_ch);
    comando := '';
    texto := strpcopy(comando, '');
    error := fiscalEpson.CargarPago(200, 3, 0, monto, '', comando, '', '');

  end;
  if imp_os <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_os);
    comando := '';
    texto := strpcopy(comando, Ticket.nombre_os);
    error := fiscalEpson.CargarPago(200, 99, 0, monto, '', comando, '', '');

  end;
  if imp_co1 <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_co1);
    comando := '';
    texto := strpcopy(comando, Ticket.nombre_co1);
    error := fiscalEpson.CargarPago(200, 99, 0, monto, '', comando, '', '');

  end;
  if imp_co2 <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_co2);
    comando := '';
    texto := strpcopy(comando, Ticket.nombre_cos2);
    error := fiscalEpson.CargarPago(200, 99, 0, monto, '', comando, '', '');
  end;
//------------------agregado-------------------///
    if imp_aplus <> '0' then
  begin

    monto := '';
    texto := strpcopy(monto, imp_aplus);
    comando := '';
    texto := strpcopy(comando, 'aplus:');
    error := fiscalEpson.CargarPago(200, 99, 0, monto, '', comando, '', '');
  end;
  //------------------agregado-------------------///

  // ----------------------------PAGOS-----------------------------------------------//
  // finalizacion ticket-------------------------------------------------------------//
  comando := '';
  texto := strpcopy(comando, 'Numero de ref:' + (Ticket.valnroreferencia));
  error := fiscalEpson.EstablecerCola(1, @comando[0]);
  //-------------------------------farmacoins---------------------------------------//
  if ticket.farmacoins_importe<>0 then
  begin
   comando := '';
  texto := strpcopy(comando, 'Autofarma plus disponibles: ' +'$ '+ floattostr(ticket.farmacoins_importe));
  error := fiscalEpson.EstablecerCola(2, @comando[0]);
  end;

  //-------------------------------farmacoins---------------------------------------//
  if not(Ticket.puntos_farmavalor = '') or (Ticket.puntos_farmavalor = '0') then
  begin
    comando := '';
    texto := strpcopy(comando, 'Puntos Autofarma plus: ' + (Ticket.puntos_farmavalor));
    error := fiscalEpson.EstablecerCola(3, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Los puntos se actualizan cada 24 hs');
    error := fiscalEpson.EstablecerCola(4, @comando[0]);
  end;
  // --------------------  PROMO -----------------------------------------------------------------------//
  { if ticket.Oespecial='S' then
    BEGIN
    TRY

    if ticket.sumafarmacia<2000 then
    begin
    if ticket.sumafarmacia>1000 then
    begin
    generarcuponoferta('126');
    ofecupon:='%5:  '
    end;
    end;
    if ticket.sumafarmacia>2000 then
    begin
    generarcuponoferta('127');
    ofecupon:='%10:  '
    end;
    if cupon<>'' then
    begin

    texto:=strpcopy(comando,'Cupon oferta perfu '+ofecupon+cupon) ;
    error :=establecercola (4, @comando[0]);
    end;
    EXCEPT

    END;
    END; }

  // --------------------  PROMO -----------------------------------------------------------------------//

  respuesta := '';
  tipcomprob := '';
  texto := strpcopy(tipcomprob, '83');
  error := fiscalEpson.ConsultarNumeroComprobanteActual(@respuesta, 2000);

  nro_comprob := strtoint(respuesta);
  respuesta := '';

  // texto:=strpcopy(fechahora,''+(ticket.puntos_farmavalor)) ;
  // error := consultarfechahora(@fechahora[300],300);

  Ticket.fechafiscal := (now);
  Ticket.numero_ticketfiscal := nro_comprob;
  error := fiscalEpson.CerrarComprobante();

  { texto:=strpcopy(respuesta,'0502|0000') ;
    error :=enviarcomando(respuesta);
    error :=ObtenerRespuesta(@str[0],0,200); }

  // -------------------borrado encabezado y cola------------------------------------------//
  comando := '';
  fiscalEpson.borrarEncabezadoYCola();

  // ------------------------------------------------------------------------------------//
  comando := '';
  texto := strpcopy(comando, '08F0|0001|083|' +
    inttostr(Ticket.numero_ticketfiscal));
  error :=  fiscalEpson.EnviarComando(comando);
  comando := '';
  texto := strpcopy(comando, '08F6|0000');
  error := fiscalEpson.EnviarComando(comando);



  // ----------------------------talon obras sociales-------------------------------------//

  if (Ticket.codigo_OS <> '') or (Ticket.codigo_Co1 <> '') or
    (Ticket.codigo_Cos2 <> '') then
  begin

    error := fiscalEpson.CerrarComprobante();

    comando := '';
    texto := strpcopy(comando, 'Vendedor: ' + Ticket.nom_vendedor);
    error := fiscalEpson.establecerencabezado(1, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Obra Social: ' + Ticket.codigo_OS + '-' +
      Ticket.nombre_os);
    error := fiscalEpson.establecerencabezado(2, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
      Ticket.nombre_co1);
    error := fiscalEpson.establecerencabezado(3, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
      Ticket.afiliado_nombre);
    error := fiscalEpson.establecerencabezado(4, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Nro afiliado: ' + Ticket.afiliado_numero);
    error := fiscalEpson.establecerencabezado(5, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Mat. Med: ' + Ticket.medico_nro_matricula);
    error := fiscalEpson.establecerencabezado(6, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Receta: ' + Ticket.numero_receta);
    error := fiscalEpson.establecerencabezado(7, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'Numero de ref: ' + Ticket.valnroreferencia);
    error := fiscalEpson.establecerencabezado(9, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'REC: ' + floattostr(Ticket.importebruto) +'     OS: ' + floattostr(roundto(strtofloat(imp_os), -2)));
    error := fiscalEpson.EstablecerCola(1, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 + ' AFI: '+ floattostr(roundto(afiliado, -2)));
    error := fiscalEpson.EstablecerCola(2, @comando[0]);
    comando := '';
    //-----agregado epson----------//
    texto := strpcopy(comando,'EF: ' + floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' + floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' + floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' + floattostr(roundto(strtofloat(imp_tarjeta), -2))+' A+: ' + floattostr(roundto(strtofloat(imp_APLUS), -2)));
    error := fiscalEpson.EstablecerCola(3, @comando[0]);
     //-----agregado epson----------//
    error := fiscalEpson.abrircomprobante(21);

    comando := '';
    texto := strpcopy(comando, 'DOCUMENTO NO FISCAL FARMACIAS');
    error := fiscalEpson.ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando, 'NRO TICKET: ' + Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprob), '0', 8)));
    error := fiscalEpson.ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando,
      '--------------------------------------------------');
    error := fiscalEpson.ImprimirTextoLibre(comando);

    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
      descripcioncortada := copy(descripcion, 0, 20);

      comando := '';
      texto := strpcopy(comando, (descripcioncortada) + '(' +
        (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
        floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
        (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat));
      error := fiscalEpson.ImprimirTextoLibre(comando);
      comando := '';
      texto := strpcopy(comando, ' ');
      error := fiscalEpson.ImprimirTextoLibre(comando);

      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

    error := fiscalEpson.CerrarComprobante();
    if Ticket.codigo_OS <> '' then
    begin
      z := z + 1
    end;
    if Ticket.codigo_Co1 <> '' then
    begin
      z := z + 1
    end;
    comando := '';
    if z > 1 then
    begin
      error := fiscalEpson.CerrarComprobante();

      comando := '';
      texto := strpcopy(comando, 'Vendedor: ' + Ticket.nom_vendedor);
      error := fiscalEpson.establecerencabezado(1, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Obra Social: ' + Ticket.codigo_OS + '-' +
        Ticket.nombre_os);
      error := fiscalEpson.establecerencabezado(2, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Coseguro 1: ' + Ticket.codigo_Co1 + '-' +
        Ticket.nombre_co1);
      error := fiscalEpson.establecerencabezado(3, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
        Ticket.afiliado_nombre);
      error := fiscalEpson.establecerencabezado(4, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Nro afiliado: ' + Ticket.afiliado_numero);
      error := fiscalEpson.establecerencabezado(5, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Mat. Med: ' + Ticket.medico_nro_matricula);
      error := fiscalEpson.establecerencabezado(6, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Receta: ' + Ticket.numero_receta);
      error := fiscalEpson.establecerencabezado(7, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Numero de ref: ' + Ticket.valnroreferencia);
      error := fiscalEpson.establecerencabezado(9, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'REC: ' + floattostr(Ticket.importebruto) +
        '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2)));
      error := fiscalEpson.EstablecerCola(1, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 +
        ' AFI: ' + floattostr(roundto(afiliado, -2)));
      error := fiscalEpson.EstablecerCola(2, @comando[0]);
      comando := '';
      //------------------------agregado epson-------------------///
      texto := strpcopy(comando,'EF: ' + floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' + floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' + floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' + floattostr(roundto(strtofloat(imp_tarjeta), -2))+' A+: ' + floattostr(roundto(strtofloat(imp_APLUS), -2)));
       //------------------------agregado epson-------------------///
      error := fiscalEpson.EstablecerCola(3, @comando[0]);

      error := fiscalEpson.abrircomprobante(21);

      comando := '';
      texto := strpcopy(comando, 'DOCUMENTO NO FISCAL FARMACIAS');
      error := fiscalEpson.ImprimirTextoLibre(comando);
      comando := '';
      texto := strpcopy(comando, 'NRO TICKET: ' + Ticket.fiscla_pv +
        (RightPad(inttostr(nro_comprob), '0', 8)));
      error := fiscalEpson.ImprimirTextoLibre(comando);
      comando := '';
      texto := strpcopy(comando,
        '--------------------------------------------------');
      error := fiscalEpson.ImprimirTextoLibre(comando);

      ffacturador.Gfacturador.DataSource.DataSet.First;

      while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
      begin
        descripcion := (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[1].FieldName).Asstring);
        descripcioncortada := copy(descripcion, 0, 20);

        comando := '';
        texto := strpcopy(comando, (descripcioncortada) + '(' +
          (ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[3].FieldName).Asstring) + ')  ' +
          floattostr(ffacturador.Gfacturador.DataSource.DataSet.FieldByName
          (ffacturador.Gfacturador.Columns[2].FieldName).AsFloat));
        error := fiscalEpson.ImprimirTextoLibre(comando);
        comando := '';
        texto := strpcopy(comando, ' ');
        error := fiscalEpson.ImprimirTextoLibre(comando);

        ffacturador.Gfacturador.DataSource.DataSet.Next;
      end;

      error := fiscalEpson.CerrarComprobante();

    end;

  end;

  comando := '';
  fiscalEpson.borrarEncabezadoYCola();

  if Ticket.llevavale = 'SI' then
  BEGIN

    error := fiscalEpson.CerrarComprobante();

    comando := '';
    texto := strpcopy(comando, 'Vendedor: ' + Ticket.nom_vendedor);
    error := fiscalEpson.establecerencabezado(1, @comando[0]);

    if (Ticket.nombre_os = '') and (Ticket.nombre_co1 <> '') then
    begin
      comando := '';
      texto := strpcopy(comando, 'Obra Social: ' + Ticket.codigo_OS + '-' +
        Ticket.nombre_os);
      error := fiscalEpson.establecerencabezado(2, @comando[0]);
    end;

    if (Ticket.nombre_os = '') and (Ticket.nombre_co1 <> '') then
    begin
      comando := '';
      texto := strpcopy(comando, 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
        Ticket.afiliado_nombre);
      error := fiscalEpson.establecerencabezado(4, @comando[0]);

    end;
    if (Ticket.nombre_os <> '') then
    begin
      comando := '';
      texto := strpcopy(comando, 'Afiliado: ' + Ticket.afiliado_apellido + ' ' +
        Ticket.afiliado_nombre);
      error := fiscalEpson.establecerencabezado(4, @comando[0]);
      comando := '';
      texto := strpcopy(comando, 'Nro afiliado: ' + Ticket.afiliado_numero);
      error := fiscalEpson.establecerencabezado(5, @comando[0]);

    end;
    comando := '';
    texto := strpcopy(comando, 'REC: ' + floattostr(Ticket.importebruto) +
      '     OS: ' + floattostr(roundto(strtofloat(imp_os), -2)));
    error := fiscalEpson.EstablecerCola(1, @comando[0]);
    comando := '';
    texto := strpcopy(comando, 'CO1: ' + imp_co1 + ' CO2: ' + imp_co2 + ' AFI: '
      + floattostr(roundto(afiliado, -2)));
    error := fiscalEpson.EstablecerCola(2, @comando[0]);
    comando := '';
    texto := strpcopy(comando,
      'EF: ' + floattostr(roundto(strtofloat(imp_efectivo), -2)) + ' CH: ' +
      floattostr(roundto(strtofloat(imp_ch), -2)) + ' CC: ' +
      floattostr(roundto(strtofloat(imp_cc), -2)) + ' TJ: ' +
      floattostr(roundto(strtofloat(imp_tarjeta), -2)));
    error := fiscalEpson.EstablecerCola(3, @comando[0]);
    comando := '';

    error := fiscalEpson.abrircomprobante(21);

    texto := strpcopy(comando,
      '--------------------------------------------------');
    error := fiscalEpson.ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando, 'Emision VR' + Ticket.fiscla_pv + ': ' +
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)));
    error := fiscalEpson.ImprimirTextoLibre(comando);

    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
      BEGIN
        comando := '';
        texto := strpcopy(comando, ffacturador.Gfacturador.Fields[1].Asstring);
        error := fiscalEpson.ImprimirTextoLibre(comando);
        comando := '';
        texto := strpcopy(comando, 'Unidades Vale:' +
          (ffacturador.Gfacturador.Fields[18].Asstring));
        error := fiscalEpson.ImprimirTextoLibre(comando);

      END;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
    comando := '';
    texto := strpcopy(comando, 'REF. CPBT. ' + Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprob), '0', 8)));
    error := fiscalEpson.ImprimirTextoLibre(comando);

    texto := strpcopy(comando,
      '-----CORTAR-------------CORTAR------------CORTAR------------CORTAR------------️');
    error := fiscalEpson.ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando, 'Emision VR' + Ticket.fiscla_pv + ': ' +
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8)));
    error := fiscalEpson.ImprimirTextoLibre(comando);
    texto:=strpcopy(comando,'Vendedor: '+(ticket.nom_vendedor)) ;
                  error :=fiscalEpson.ImprimirTextoLibre(comando);
                  texto:=strpcopy(comando,'Obra Social: '+ticket.codigo_OS+'-'+ticket.nombre_os) ;
                  error :=fiscalEpson.ImprimirTextoLibre(comando);
                  texto:=strpcopy(comando,'Afiliado: '+ticket.afiliado_apellido+' '+ticket.afiliado_nombre) ;
                  error :=fiscalEpson.ImprimirTextoLibre(comando);
                  texto:=strpcopy(comando,'Fecha: '+(datetimetostr(now))) ;

    ffacturador.Gfacturador.DataSource.DataSet.First;

    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[17].Asstring = 'SI' then
      BEGIN
        comando := '';
        texto := strpcopy(comando, ffacturador.Gfacturador.Fields[1].Asstring);
        error := fiscalEpson.ImprimirTextoLibre(comando);
        comando := '';
        texto := strpcopy(comando, 'Unidades Vale:' +
          (ffacturador.Gfacturador.Fields[18].Asstring));
        error := fiscalEpson.ImprimirTextoLibre(comando);

      END;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
    comando := '';
    texto := strpcopy(comando, 'REF. CPBT. ' + Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprob), '0', 8)));
    error := fiscalEpson.ImprimirTextoLibre(comando);
    comando := '';
    texto := strpcopy(comando,
      '-----CORTAR-------------CORTAR------------CORTAR------------CORTAR------------');
    error := fiscalEpson.ImprimirTextoLibre(comando);

    error := fiscalEpson.CerrarComprobante();

  END;
  //----------------------------------TALON PROMO APLUS---------------------------------------//

  // ----------------------------talon PROMO APLUS-------------------------------------//
  error := FiscalEpson.Desconectar();
  FreeLibrary(dll);
  Imprimio := True;



  // finalizacion ticket-------------------------------------------------------------//

end;

procedure TFIMPRESION.Insertarcomprobante;
var
  i: integer;
  iva: double;
  condIva: String;
  // importeTotal
  baseImponible, importeIva, unaTasa: double;
  unaTasaIVA: TTasaIVA;
  form: tfprogreso;
  stockparcial: integer;
  conteo: integer;

begin
  form := tfprogreso.Create(SELF);
  form.Show;
  Application.ProcessMessages;

  Ticket.nroticketadicional := Ticket.fiscla_pv +
    (RightPad(inttostr(nro_comprob), '0', 8));

  // INSERTAR VTMACOMPROBANTE  VR
  if dmfacturador.ticomprobante.InTransaction then
  begin
    dmfacturador.ticomprobante.Rollback;
  end;
  dmfacturador.icomprobante.Database := dmfacturador.getConexion;

  dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.Clear;

  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.text :=
    concat('INSERT INTO VTMACOMPROBEMITIDO                                 ',
    ' (NRO_SUCURSAL,                                              ',
    ' TIP_COMPROBANTE,                                          ',
    ' NRO_COMPROBANTE,                                        ',
    ' NRO_CAJA,                                             ',
    ' COD_VENDEDOR,                                       ',
    ' NRO_TRANSACCION,                                  ',
    ' COD_CLIENTE,                                    ',
    ' NOM_CLIENTE,                                  ',
    ' COD_PROVEEDOR,                              ',
    ' FEC_COMPROBANTE,                          ',
    ' DES_LEYENDA,                            ',
    ' FEC_PROXVENC_RECETA,                  ',
    ' MAR_TRATAMIENTO,                    ',
    ' CAN_REIMPRESO,                    ', ' MAR_ANULADO,                    ',
    ' NRO_SUC_CANCELADO,            ', ' TIP_COMPROB_CANCELADO,      ',
    ' NRO_COMPROB_CANCELADO,    ', ' FEC_COMPROB_CANCELADO,  ',
    'DES_PARTICULARIDAD,   ',
    'MAR_ODONTOLOGO,                                                ',
    'NRO_PBM,                                                      ',
    'NOM_MEDICO,                                                  ',
    'CAN_ITEMS,                                                  ',
    'IMP_FINANC,                                                ',
    'IMP_NETO,                                                 ',
    'IMP_BRUTO,                                                ',
    ' IMP_INTERES,                                             ',
    ' IMP_GENTILEZA_FARM,                                      ',
    ' MAR_PASOXCAJA,                                           ',
    ' MAR_IMPRE_SUBDIA,                                      ',
    ' MAR_IMPRESO_FISCAL,                                  ',
    ' CAN_REIMPRESO_AUD,                                 ',
    ' IMP_VALES,                                       ',
    ' IMP_SALDO,                                     ',
    ' FEC_REF,                                     ',
    ' FEC_OPERATIVA,                             ',
    ' MAR_RESERVADO,                           ',
    ' IMP_APAGAR,                            ',
    ' IMP_PERCEPCION,                      ',
    ' MAR_ORIGEN,                        ',
    ' COD_CLINICA,                     ', ' NOM_CLINICA,                   ',
    ' COD_AUTORIZACION,            ', ' POR_GENTILEZA_FARM,        ',
    ' POR_IVA)                 ', ' VALUES (               ',
    ' :sucursal,           ',
    ' :tkcomprobante,                                      ',
    ' :nrocomprobante,                                    ',
    ' :caja,                                          ',
    ' :vendedor,                                    ',
    ' :transaccion,                               ',
    ' :cod_cliente,                             ',
    ' :nom_cliente,                           ',
    ' NULL,                                 ',
    ' :fec_comprobante,                   ',
    ' '''',                               ',
    ' :fec_receta,                    ', ' :mar_tratamiento,             ',
    ' 0,                          ', ' ''N'',                      ',
    ' :sucursal,              ', ' NULL,                 ',
    ' NULL,                 ', ' NULL,                                   ',
    ' '''',                                    ',
    ' ''N'',                                  ',
    ' -1,                                  ',
    ' :MEDICO,                            ',
    ' :CANTIDADINTEMS,                   ',
    ' 0,                                ',
    ' :IMP_NETO,                        ', ' :IMP_BRUTO,                      ',
    ' 0,                              ',
    ' :imp_gentileza,                             ',
    ' :PASOXCAJA,                   ', ' NULL,                         ',
    ' ''S'',                         ', ' 0,                          ',
    ' 0,                         ', ' :SALDOCC,                  ',
    ' :FEC_REF,                 ', ' :FEC_OPERATIVA,          ',
    ' NULL,                   ', ' NULL,                  ',
    ' 0,                    ', ' ''F'',                 ',
    ' NULL,               ', ' NULL,               ', ' :CODAUTORIZACION, ',
    ' NULL, ', ' NULL)');

  dmfacturador.icomprobante.ParamByName('SUCURSAL').Asstring := Ticket.sucursal;
  dmfacturador.icomprobante.ParamByName('TKCOMPROBANTE').Asstring :=
    Ticket.comprobante;
  dmfacturador.icomprobante.ParamByName('NROCOMPROBANTE').Asstring :=
    Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
  if Ticket.nro_caja = '999' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('CAJA').Asstring := '999';
  END;
  if Ticket.nro_caja <> '999' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('CAJA').Asstring := Ticket.nro_caja;
  END;
  dmfacturador.icomprobante.ParamByName('VENDEDOR').Asstring :=
    Ticket.cod_vendedor;
  dmfacturador.icomprobante.ParamByName('TRANSACCION').Asstring :=
    inttostr(nro_comprob);
  dmfacturador.icomprobante.ParamByName('COD_CLIENTE').Asstring :=
    Ticket.codigocliente;
  dmfacturador.icomprobante.ParamByName('nom_cliente').Asstring :=
    Ticket.DESCRIPCIONCLIENTE;
  dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDateTime :=
    Ticket.fechafiscal;
  dmfacturador.icomprobante.ParamByName('fec_receta').asdate :=
    Ticket.fecha_receta;
  if Ticket.codigo_tratamiento = '' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('mar_tratamiento').Asstring := 'N';
  END;
  if Ticket.codigo_tratamiento <> '' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('mar_tratamiento').Asstring :=
      Ticket.codigo_tratamiento;
  END;
  dmfacturador.icomprobante.ParamByName('sucursal').Asstring := Ticket.sucursal;
  dmfacturador.icomprobante.ParamByName('MEDICO').Asstring :=
    Ticket.medico_apellido + ',' + Ticket.medico_nombre;
  dmfacturador.icomprobante.ParamByName('CANTIDADINTEMS').Asinteger :=
    Ticket.itemstotales;
  //
  dmfacturador.icomprobante.ParamByName('IMP_NETO').AsFloat :=
    Ticket.importeneto * Ticket.coeficientetarjeta;
  dmfacturador.icomprobante.ParamByName('IMP_BRUTO').AsFloat :=
    Ticket.importebruto * Ticket.coeficientetarjeta;
  //
  dmfacturador.icomprobante.ParamByName('IMP_gentileza').AsFloat :=
    Ticket.importegentileza;
  if Ticket.nro_caja = '999' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('PASOXCAJA').Asstring := 'N';
  END;
  if Ticket.nro_caja <> '999' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('PASOXCAJA').Asstring := 'S';
  END;

  dmfacturador.icomprobante.ParamByName('SALDOCC').AsFloat := Ticket.saldocc;
  dmfacturador.icomprobante.ParamByName('FEC_REF').asdate := Ticket.fechacaja;
  if Ticket.nro_caja = '999' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('FEC_OPERATIVA').Asstring := '';
  END;
  if Ticket.nro_caja <> '999' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('FEC_OPERATIVA').asdate :=
      Ticket.fec_operativa;
  END;
  if Length(Ticket.valnroreferencia) > 13 then
  begin
    conteo := Length(Ticket.valnroreferencia);
    Delete(Ticket.valnroreferencia, 1, 8);
    dmfacturador.icomprobante.ParamByName('CODAUTORIZACION').Asstring := '0';
  end
  else
  begin
    dmfacturador.icomprobante.ParamByName('CODAUTORIZACION').Asstring := '0';
  end;
  dmfacturador.icomprobante.Open;
  dmfacturador.ticomprobante.Commit;







  // INSTERTAR VTMADETALLECOMPROB -----------------------------------------// VR

  if dmfacturador.ticomprobante.InTransaction then
  begin
    dmfacturador.ticomprobante.Rollback;
  end;
  dmfacturador.icomprobante.Database := dmfacturador.getConexion;

  dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.Clear;

  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.text :=
    concat('INSERT INTO VTMADETALLECOMPROB ',
    '(NRO_SUCURSAL,                  ', 'TIP_COMPROBANTE,                 ',
    'NRO_COMPROBANTE,                  ', 'NRO_ITEM,                          ',
    'COD_ALFABETA,                       ',
    'NOM_PRODUCTO,                        ',
    'CAN_CANTIDAD,                         ',
    'IMP_UNITARIO,                          ',
    'IMP_IVADESC,                            ',
    'IMP_IVA_NETO,                            ',
    'IMP_IVATASA,                              ',
    'IMP_PRODNETO,                              ',
    'IMP_GENTILEZA_FARM,                         ',
    'MAR_MODIF,                                   ',
    'MAR_MOTVENTA,                                 ',
    'CAN_VALE,                                      ',
    'TIP_VALE,                                       ',
    'COD_PROD_REC,                                   ',
    'COD_AUTORIZACION)                               ',
    '                                                ',
    'VALUES (:nro_sucursal,                          ',
    ':TIP_COMPROBANTE,                                        ',
    ':nro_comprobante,                               ',
    ':nro_item,                                      ',
    ':cod_alfabeta,                                  ',
    ':nom_producto,                                  ',
    ':cantidad,                                      ',
    ':imp_unitario,                                  ',
    ':IMP_IVADESC,                                   ',
    ':IMP_IVANETO,                                   ',
    ':IMP_IVATASA,                                   ',
    ':IMP_PRODNETO,                                  ',
    ':IMP_GENTILEZA,                                 ',
    ':modificado,                                          ',
    'NULL,                                           ',
    ':can_vale,                                              ',
    'NULL,                                           ',
    'NULL,                                           ', ''''');');

  i := 0;

  ffacturador.Gfacturador.DataSource.DataSet.First;
  // sumafarmacia:=0;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin
    i := i + 1;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_sucursal').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('nro_comprobante').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('nro_item').Asinteger := i;
    dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger :=
      ffacturador.Gfacturador.Fields[8].Asinteger;
    dmfacturador.icomprobante.ParamByName('nom_producto').Asstring :=
      ffacturador.Gfacturador.Fields[1].Asstring;
    dmfacturador.icomprobante.ParamByName('cantidad').Asinteger :=
      ffacturador.Gfacturador.Fields[3].Asinteger;
    //
    dmfacturador.icomprobante.ParamByName('imp_unitario').AsFloat :=
      ffacturador.Gfacturador.Fields[2].AsFloat * Ticket.coeficientetarjeta;

    // ----------cuando tiene obra social o coseguro cambia el campo del iva--------------------///
    if not((Ticket.codigo_OS <> '') or (Ticket.codigo_Co1 <> '') or
      (Ticket.codigo_Cos2 <> '')) then
    begin
      if ffacturador.Gfacturador.Fields[10].Asstring = 'B' then
      begin
        iva := (Ticket.IVAB / 100) + 1;
        //
        dmfacturador.icomprobante.ParamByName('imp_ivaneto').AsFloat :=
          ffacturador.Gfacturador.Fields[6].AsFloat * Ticket.coeficientetarjeta
          - ((ffacturador.Gfacturador.Fields[6].AsFloat *
          Ticket.coeficientetarjeta) / iva);
        dmfacturador.icomprobante.ParamByName('imp_ivadesc').AsFloat := 0;
      end;
      if ffacturador.Gfacturador.Fields[10].Asstring <> 'B' then
      begin
        iva := 0;
        //

        dmfacturador.icomprobante.ParamByName('imp_ivaneto').AsFloat :=
          (ffacturador.Gfacturador.Fields[6].AsFloat *
          Ticket.coeficientetarjeta) * iva;
        dmfacturador.icomprobante.ParamByName('imp_ivadesc').AsFloat := 0;
      end;

    end;

    if (Ticket.codigo_OS <> '') or (Ticket.codigo_Co1 <> '') or
      (Ticket.codigo_Cos2 <> '') then
    begin
      if ffacturador.Gfacturador.Fields[10].Asstring = 'B' then
      begin
        iva := (Ticket.IVAB / 100) + 1;
        dmfacturador.icomprobante.ParamByName('imp_ivadesc').AsFloat :=
          ffacturador.Gfacturador.Fields[6].AsFloat -
          (ffacturador.Gfacturador.Fields[6].AsFloat / iva);
        dmfacturador.icomprobante.ParamByName('imp_ivaneto').AsFloat := 0;
      end;
      if ffacturador.Gfacturador.Fields[10].Asstring <> 'B' then
      begin
        iva := 0;
        dmfacturador.icomprobante.ParamByName('imp_ivadesc').AsFloat :=
          ffacturador.Gfacturador.Fields[6].AsFloat * iva;
        dmfacturador.icomprobante.ParamByName('imp_ivaneto').AsFloat := 0;
      end;
      // ----------cuando tiene obra social o coseguro cambia el campo del iva--------------------///
    end;
    dmfacturador.icomprobante.ParamByName('imp_ivatasa').AsFloat := 0;
    dmfacturador.icomprobante.ParamByName('imp_prodneto').AsFloat :=
      (ffacturador.Gfacturador.Fields[6].AsFloat * Ticket.coeficientetarjeta) -
      ffacturador.Gfacturador.Fields[4].AsFloat;
    dmfacturador.icomprobante.ParamByName('imp_GENTILEZA').AsFloat :=
      ffacturador.Gfacturador.Fields[24].AsFloat;
    if ffacturador.Gfacturador.Fields[21].Asstring = 'True' then
    BEGIN
      dmfacturador.icomprobante.ParamByName('modificado').Asstring := 'S';
    END;
    if ffacturador.Gfacturador.Fields[21].Asstring = '' then
    BEGIN
      dmfacturador.icomprobante.ParamByName('modificado').Asstring := 'N';
    END;
    dmfacturador.icomprobante.ParamByName('can_vale').Asstring :=
      ffacturador.Gfacturador.Fields[18].Asstring;
    { if ffacturador.Gfacturador.fields[10].AsString<>'B' then
      begin
      sumafarmacia:=sumafarmacia+(ffacturador.Gfacturador.Fields[2].asfloat*ffacturador.Gfacturador.Fields[3].Asinteger);
      end; }
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;
    ffacturador.Gfacturador.DataSource.DataSet.Next;
  end;



  // INSERTAR VTMAPORCENTAJESIVA   ----VR LLEVA PERO TODOS LOS VALORES EN 0

  if dmfacturador.ticomprobante.InTransaction then
    dmfacturador.ticomprobante.Rollback;

  dmfacturador.ticomprobante.StartTransaction;
  dmfacturador.icomprobante.Database := dmfacturador.getConexion;

  dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.Clear;

  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.text :=
    concat('INSERT INTO VTMAPORCENTAJESIVA                        ',
    '(NRO_SUCURSAL,                                       ',
    'TIP_COMPROBANTE,                                     ',
    'NRO_COMPROBANTE,                                     ',
    'NRO_ITEM,                                           ',
    'POR_PORCENTAJE,                                     ',
    'POR_SOBRETASA,                                     ',
    'IMP_NETOGRAV,                                      ',
    'IMP_IVA,                                         ',
    'IMP_IVASOBRETASA,                              ',
    'IMP_NETOGRAV_DESC,                           ',
    'IMP_IVA_DESC,                              ',
    'IMP_IVASOBRETASA_DESC)                   ',
    '                                       ',
    'VALUES (:nro_sucursal,                   ', ':tip_comprobante,  ',
    ':nro_comprobante,                ', ':nro_item,                     ',
    ':por_porcentaje,             ', ':por_sobretasa,            ',
    ':imp_netograv,            ', ':imp_iva,                ',
    ':imp_ivasobretasa,     ', ':imp_netograv_desc,   ', ':imp_iva_desc,      ',
    'NULL);');

  i := 0;

  for condIva in Ticket.TotalesIVA.Keys do
  Begin
    i := i + 1;
    Ticket.TotalesIVA.TryGetValue(condIva, unaTasaIVA);
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_sucursal').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('nro_comprobante').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('nro_item').Asinteger := i;

    // Obtener la tasa de iva de la tabla PRMAIVA con la condicion condIVA
    if condIva = 'A' then
      unaTasa := Ticket.IVAA
    else if condIva = 'B' then
      unaTasa := Ticket.IVAB
    else if condIva = 'D' then
      unaTasa := Ticket.IVAD
    else if condIva = 'E' then
      unaTasa := Ticket.IVAE
    else if condIva = 's' then
      unaTasa := Ticket.IVAs;

    // Si es S poner el monto sobretrasa sino 0
    iva := unaTasa / 100;
    baseImponible := unaTasaIVA.importeTotal / (1 + iva);
    importeIva := baseImponible * iva;

    dmfacturador.icomprobante.ParamByName('por_sobretasa').Asstring := '0';
    dmfacturador.icomprobante.ParamByName('por_porcentaje').AsFloat := unaTasa;

    dmfacturador.icomprobante.ParamByName('imp_netograv').AsFloat :=unaTasaIVA.netogravado * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('imp_netograv_desc').AsFloat :=unaTasaIVA.netogravadodesc;

    //
    dmfacturador.icomprobante.ParamByName('imp_iva').AsFloat :=(unaTasaIVA.netogravado * Ticket.coeficientetarjeta) * iva;

    dmfacturador.icomprobante.ParamByName('imp_iva_desc').AsFloat :=
      unaTasaIVA.netogravadodesc * iva;

    dmfacturador.icomprobante.ParamByName('imp_ivasobretasa').AsFloat := 0;
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;
  End;




  // INSERTAR VTTBPAGOCHEQUE          --VR LLEVA TODOS LOS MEDIOS DE PAGO

  if strtofloat(imp_ch) <> 0 then
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat(' INSERT INTO VTTBPAGOCHEQUE (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_BANCO, COD_CTA, NRO_CHEQUE, IMP_CHEQUE) VALUES (:sucursal,:tip_comprobante, :nro_comprobante, :cod_banco, '''', :nro_cheque, :importe_cheque);');

    dmfacturador.icomprobante.ParamByName('SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobante').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('cod_banco').Asstring :=
      Ticket.codigocheque;
    dmfacturador.icomprobante.ParamByName('nro_cheque').Asstring :=
      Ticket.numerocheque;
    dmfacturador.icomprobante.ParamByName('importe_cheque').AsFloat :=
      strtofloat(imp_ch);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;

  // INSTERTAR VTTPAGOCTACTE

  if strtofloat(imp_cc) <> 0 then
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text := concat(' INSERT INTO VTTBPAGOCTACTE ',
      '(NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_CTACTE, COD_SUBCTA, COD_AUTORIZACTA, IMP_CTACTE, IMP_SALDO, ',
      ' MAR_RESUMIDO, NRO_SUCURSAL_LIQ, NRO_LIQUIDACION, CAN_CUOTAS, CAN_CUOTASPEN, POR_IVA, CODIGOPAGO) ',
      ' VALUES (:NRO_SUCURSAL,:TIP_COMPROBANTE , :NRO_COMPROB, :COD_CTACTE, :COD_SUBCTA, '''', :IMP_CTACTE, :IMP_SCTACTE, ''N'', 0, NULL, 0, 0, NULL, NULL)');

    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprob').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_CTACTE').Asstring :=
      Ticket.codigocc;
    dmfacturador.icomprobante.ParamByName('cod_subcta').Asstring :=
      Ticket.codigosubcc;
    dmfacturador.icomprobante.ParamByName('imp_ctacte').AsFloat :=
      strtofloat(imp_cc);
    dmfacturador.icomprobante.ParamByName('imp_sctacte').AsFloat :=
      strtofloat(imp_cc);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;

  // INSERTAR VTTPAGOEFECTIVO

  if strtofloat(imp_efectivo) <> 0 then
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO VTTBPAGOEFECTIVO (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_MONEDA, IMP_EFECTIVO, IMP_COTIZ, POR_IVA)',
      ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, ''$'', :IMP_EFECTIVO, NULL, NULL)');

    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('imp_EFECTIVO').AsFloat :=
      strtofloat(imp_efectivo);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;





  // INSERTAR VTTBPAGOTARJETA

  if strtofloat(imp_tarjeta) <> 0 then
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat(' INSERT INTO VTTBPAGOTARJETA (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_TARJETA, NRO_TARJETA, COD_MONEDA, NRO_CUPON, ',
      ' IMP_TARJETA, IMP_COTIZ, NRO_CUOTA, NRO_AUTORIZACION, NRO_LIQUIDACION, FEC_VENCIMIENTO, NRO_PIN, POR_IVA, CODIGOPAGO)',
      ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_TARJETA, ''0'', ''$'', NULL, :IMP_TARJETA, NULL, 0, 0, NULL, CURRENT_DATE , 0, NULL, NULL)');

    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_TARJETA').Asstring :=
      Ticket.codigotarjeta;
    dmfacturador.icomprobante.ParamByName('imp_tarjeta').AsFloat :=
      strtofloat(imp_tarjeta);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;




  // INSERTAR VTMADESCCOMPROB     ------VR LLEVA PERO SIN IMPORTES

  if Ticket.codigo_OS <> '' THEN
  begin
    i := 0;

    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      i := i + 1;
      if dmfacturador.ticomprobante.InTransaction then
        dmfacturador.ticomprobante.Rollback;

      dmfacturador.ticomprobante.StartTransaction;
      dmfacturador.icomprobante.Database := dmfacturador.getConexion;

      dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
      dmfacturador.icomprobante.Close;
      dmfacturador.icomprobante.SQL.Clear;

      dmfacturador.icomprobante.Close;
      dmfacturador.icomprobante.SQL.text :=
        concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
        ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

      dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
        Ticket.sucursal;
      dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
        Ticket.comprobante;
      dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
        Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
      dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
        Ticket.codigo_OS;
      dmfacturador.icomprobante.ParamByName('ITEM').AsFloat := i;
      dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat :=
        ffacturador.Gfacturador.Fields[11].Asinteger;
      dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat :=
        ((ffacturador.Gfacturador.Fields[11].Asinteger *
        Ticket.coeficientetarjeta) * (ffacturador.Gfacturador.Fields[2]
        .AsFloat)) / 100;
      dmfacturador.icomprobante.Open;
      dmfacturador.ticomprobante.Commit;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
  end;

  if Ticket.codigo_Co1 <> '' THEN
  begin
    i := 0;

    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      i := i + 1;
      if dmfacturador.ticomprobante.InTransaction then
        dmfacturador.ticomprobante.Rollback;

      dmfacturador.ticomprobante.StartTransaction;
      dmfacturador.icomprobante.Database := dmfacturador.getConexion;

      dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
      dmfacturador.icomprobante.Close;
      dmfacturador.icomprobante.SQL.Clear;

      dmfacturador.icomprobante.Close;
      dmfacturador.icomprobante.SQL.text :=
        concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
        ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

      dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
        Ticket.sucursal;
      dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
        Ticket.comprobante;
      dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
        Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
      dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
        Ticket.codigo_Co1;
      dmfacturador.icomprobante.ParamByName('ITEM').AsFloat := i;
      dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat :=
        ffacturador.Gfacturador.Fields[12].Asinteger;
      dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat :=
        ((ffacturador.Gfacturador.Fields[12].Asinteger *
        Ticket.coeficientetarjeta) * (ffacturador.Gfacturador.Fields[6]
        .AsFloat)) / 100;
      dmfacturador.icomprobante.Open;
      dmfacturador.ticomprobante.Commit;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
  end;
  if Ticket.codigo_Cos2 <> '' THEN
  begin
    i := 0;

    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      i := i + 1;
      if dmfacturador.ticomprobante.InTransaction then
        dmfacturador.ticomprobante.Rollback;

      dmfacturador.ticomprobante.StartTransaction;
      dmfacturador.icomprobante.Database := dmfacturador.getConexion;

      dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
      dmfacturador.icomprobante.Close;
      dmfacturador.icomprobante.SQL.Clear;

      dmfacturador.icomprobante.Close;
      dmfacturador.icomprobante.SQL.text :=
        concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
        ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

      dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
        Ticket.sucursal;
      dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
        Ticket.comprobante;
      dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
        Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
      dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
        Ticket.codigo_Cos2;
      dmfacturador.icomprobante.ParamByName('ITEM').AsFloat := i;
      dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat :=
        ffacturador.Gfacturador.Fields[13].Asinteger;
      dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat :=
        ((ffacturador.Gfacturador.Fields[13].Asinteger *
        Ticket.coeficientetarjeta) * (ffacturador.Gfacturador.Fields[6]
        .AsFloat)) / 100;
      dmfacturador.icomprobante.Open;
      dmfacturador.ticomprobante.Commit;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
  end;
  //--------------agregado insercion------------------//
  if imp_aplus <> '' THEN
  begin
    i := 0;

    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      i := i + 1;
      if dmfacturador.ticomprobante.InTransaction then
        dmfacturador.ticomprobante.Rollback;

      dmfacturador.ticomprobante.StartTransaction;
      dmfacturador.icomprobante.Database := dmfacturador.getConexion;

      dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
      dmfacturador.icomprobante.Close;
      dmfacturador.icomprobante.SQL.Clear;

      dmfacturador.icomprobante.Close;
      dmfacturador.icomprobante.SQL.text :=
        concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
        ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

      dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=Ticket.sucursal;
      dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=Ticket.comprobante;
      dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
      dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :='ZBG';
      dmfacturador.icomprobante.ParamByName('ITEM').AsFloat := i;
      dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat :=ffacturador.Gfacturador.Fields[29].Asinteger;
      dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat :=((ffacturador.Gfacturador.Fields[29].asfloat * Ticket.coeficientetarjeta) * (ffacturador.Gfacturador.Fields[6].AsFloat)) / 100;
      dmfacturador.icomprobante.Open;
      dmfacturador.ticomprobante.Commit;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
  end;

    //--------------agregado insercion------------------//
  // INSERTAR VTMADETALLEAFILOS  ---vr lleva     sin importes tambien

  if Ticket.codigo_OS <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO VTMADETALLEAFILOS ',
      ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
      ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
      ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
      ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
      ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');

    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
      Ticket.codigo_OS;
    dmfacturador.icomprobante.ParamByName('nro_afiliado').Asstring :=
      Ticket.afiliado_numero;
    dmfacturador.icomprobante.ParamByName('nro_matricula').Asstring :=
      Ticket.medico_tipo_matricula + Ticket.medico_nro_matricula;
    dmfacturador.icomprobante.ParamByName('nom_medico').Asstring :=
      Ticket.medico_nombre + ' ' + Ticket.medico_apellido;
    dmfacturador.icomprobante.ParamByName('nro_receta').Asstring :=
      Ticket.numero_receta;
    dmfacturador.icomprobante.ParamByName('fec_recet').asdate :=
      Ticket.fecha_receta;
    dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency :=
      roundto(strtofloat(formatfloat('0.00',
      (ffacturador.descuentoos.field.value * Ticket.coeficientetarjeta))), -2);
    dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency :=
      roundto(strtofloat(formatfloat('0.00',
      (ffacturador.importeTotal.field.value * Ticket.coeficientetarjeta))), -2);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;

  if Ticket.codigo_Co1 <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO VTMADETALLEAFILOS ',
      ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
      ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
      ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
      ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
      ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');

    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
      Ticket.codigo_Co1;
    dmfacturador.icomprobante.ParamByName('nro_afiliado').Asstring :=
      Ticket.afiliado_numero;
    dmfacturador.icomprobante.ParamByName('nro_matricula').Asstring :=
      Ticket.medico_tipo_matriculaco1 + Ticket.medico_nro_matriculaco1;
    dmfacturador.icomprobante.ParamByName('nom_medico').Asstring :=
      Ticket.medico_nombre + ' ' + Ticket.medico_apellido;
    dmfacturador.icomprobante.ParamByName('nro_receta').Asstring :=
      Ticket.numero_receta;
    dmfacturador.icomprobante.ParamByName('fec_recet').asdate :=
      Ticket.fecha_recetaco1;
    dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency :=
      roundto(strtofloat(formatfloat('0.00',
      (ffacturador.descuentoco1.field.value * Ticket.coeficientetarjeta))), -2);
    dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency :=
      roundto(strtofloat(formatfloat('0.00',
      (ffacturador.descuentoco1.field.value * Ticket.coeficientetarjeta))), -2);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;
  if Ticket.codigo_Cos2 <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO VTMADETALLEAFILOS ',
      ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
      ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
      ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
      ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
      ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');

    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
      Ticket.codigo_Cos2;
    dmfacturador.icomprobante.ParamByName('nro_afiliado').Asstring :=
      Ticket.afiliado_numero;
    dmfacturador.icomprobante.ParamByName('nro_matricula').Asstring :=
      Ticket.medico_nro_matricula;
    dmfacturador.icomprobante.ParamByName('nom_medico').Asstring :=
      Ticket.medico_nombre + ' ' + Ticket.medico_apellido;
    dmfacturador.icomprobante.ParamByName('nro_receta').Asstring :=
      Ticket.numero_receta;
    dmfacturador.icomprobante.ParamByName('fec_recet').asdate :=
      Ticket.fecha_recetaco1;
    dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency :=
      roundto(strtofloat(formatfloat('0.00',
      (ffacturador.descuentoco2.field.value * Ticket.coeficientetarjeta))), -2);
    dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency :=
      roundto(strtofloat(formatfloat('0.00',
      (ffacturador.descuentoco2.field.value * Ticket.coeficientetarjeta))), -2);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;
  //--------------agregado insercion------------------//
if imp_aplus <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO VTMADETALLEAFILOS ',
      ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
      ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
      ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
      ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
      ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');

    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :='ZBG';
    dmfacturador.icomprobante.ParamByName('nro_afiliado').Asstring :=TICKET.cod_cliente;
    dmfacturador.icomprobante.ParamByName('nro_matricula').Asstring :='';
    dmfacturador.icomprobante.ParamByName('nom_medico').Asstring :='';
    dmfacturador.icomprobante.ParamByName('nro_receta').Asstring :='';
    dmfacturador.icomprobante.ParamByName('fec_recet').asdate :=now;
    dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency :=roundto(strtofloat(formatfloat('0.00',(ffacturador.descuentoaplus.field.value * Ticket.coeficientetarjeta))), -2);
    dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency :=roundto(strtofloat(formatfloat('0.00',(ffacturador.descuentoaplus.field.value * Ticket.coeficientetarjeta))), -2);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;

  //--------------agregado insercion------------------//

  // INSERTAR OSMAMOVOBRASOCIAL     --vr no lleva

  if Ticket.codigo_OS <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO OSMAMOVOBRASOCIAL                         ',
      '(NRO_SUCURSAL,                                       ',
      ' TIP_COMPROB,                                       ',
      ' NRO_COMPROB,                                      ',
      ' COD_PLANOS,                                      ',
      ' COD_PLANOSORIG,                                 ',
      ' NOM_OBRASOCIAL,                                ',
      ' FEC_COMPROB,                                  ',
      ' FEC_RECETA,                                  ',
      ' IMP_TICKET,                                 ',
      ' IMP_AFECTADO,                              ',
      ' IMP_CARGOOS,                              ',
      ' IMP_GENTILEZA,                           ',
      ' IMP_PRESTADOR,                          ',
      ' NRO_AFILIADO,                          ',
      ' COD_ESTADO,                           ',
      ' NOM_AFILIADO,                        ',
      ' NRO_MATRICULA,                      ',
      ' NRO_RECETA,                        ',
      ' MAR_TRATAMIENTO,                  ',
      ' NRO_LIQUIDACION,                 ', ' IDE_PRESENTACION,               ',
      ' DES_PARTICULARIDAD,            ', ' COD_CLINICA,                  ',
      ' NOM_CLINICA,                 ', ' INFOADICIONAL)              ',
      '                            ', ' VALUES (:sucursal,        ',
      ' :tipo_comprobante,       ', ' :nro_Comprobante,                 ',
      ' :cod_planos,                     ', '  NULL,                          ',
      ' :nom_obrasocial,               ', ' :fec_comprobante,             ',
      ' :fec_receta,                 ', ' :imp_ticket,                ',
      ' :imp_afectado,             ', ' :imp_cargoos,             ',
      ' 0,                       ', ' 0,                      ',
      ' :nro_afiliado,         ', ' ''C'',                  ',
      ' :nom_afiliado,       ', ' :nro_matricula,     ', ' :nro_receta,       ',
      ' :tip_tratamiento, ', ' NULL,        ', ' NULL,      ', ' '''',       ',
      ' NULL,   ', ' NULL, ', ' '''');');

    dmfacturador.icomprobante.ParamByName('SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIPO_COMPROBANTE').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
      Ticket.codigo_OS;
    dmfacturador.icomprobante.ParamByName('nom_obrasocial').Asstring :=
      Ticket.nombre_os;
    dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDateTime :=
      Ticket.fechafiscal;
    dmfacturador.icomprobante.ParamByName('fec_receta').asdate :=
      Ticket.fecha_receta;
    dmfacturador.icomprobante.ParamByName('imp_ticket').AsFloat :=
      Ticket.importebruto * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('imp_afectado').AsFloat :=
      Ticket.importetotaldescuento * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('imp_cargoos').AsFloat :=
      Ticket.importecargoos * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('nro_afiliado').Asstring :=
      Ticket.afiliado_numero;

    if (Ticket.afiliado_nombre <> '') and (Ticket.afiliado_apellido <> '') then
    begin

      dmfacturador.icomprobante.ParamByName('nom_afiliado').Asstring :=
        Ticket.afiliado_apellido + ' ' + Ticket.afiliado_nombre;

    end;
    if (Ticket.afiliado_nombre = '') or (Ticket.afiliado_apellido = '') then
    begin
      dmfacturador.icomprobante.ParamByName('nom_afiliado').Asstring :=
        Ticket.afiliado_apellido;
    end;
    dmfacturador.icomprobante.ParamByName('nro_matricula').Asstring :=
      Ticket.medico_tipo_matricula + Ticket.medico_nro_matricula;
    dmfacturador.icomprobante.ParamByName('nro_receta').Asstring :=
      Ticket.numero_receta;
    dmfacturador.icomprobante.ParamByName('tip_tratamiento').Asstring :=
      Ticket.codigo_tratamiento;
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;

  if Ticket.codigo_Co1 <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO OSMAMOVOBRASOCIAL                         ',
      '(NRO_SUCURSAL,                                       ',
      ' TIP_COMPROB,                                       ',
      ' NRO_COMPROB,                                      ',
      ' COD_PLANOS,                                      ',
      ' COD_PLANOSORIG,                                 ',
      ' NOM_OBRASOCIAL,                                ',
      ' FEC_COMPROB,                                  ',
      ' FEC_RECETA,                                  ',
      ' IMP_TICKET,                                 ',
      ' IMP_AFECTADO,                              ',
      ' IMP_CARGOOS,                              ',
      ' IMP_GENTILEZA,                           ',
      ' IMP_PRESTADOR,                          ',
      ' NRO_AFILIADO,                          ',
      ' COD_ESTADO,                           ',
      ' NOM_AFILIADO,                        ',
      ' NRO_MATRICULA,                      ',
      ' NRO_RECETA,                        ',
      ' MAR_TRATAMIENTO,                  ',
      ' NRO_LIQUIDACION,                 ', ' IDE_PRESENTACION,               ',
      ' DES_PARTICULARIDAD,            ', ' COD_CLINICA,                  ',
      ' NOM_CLINICA,                 ', ' INFOADICIONAL)              ',
      '                            ', ' VALUES (:sucursal,        ',
      ' :tipo_comprobante,       ', ' :nro_Comprobante,                 ',
      ' :cod_planos,                     ', '  NULL,                          ',
      ' :nom_obrasocial,               ', ' :fec_comprobante,             ',
      ' :fec_receta,                 ', ' :imp_ticket,                ',
      ' :imp_afectado,             ', ' :imp_cargoos,             ',
      ' 0,                       ', ' 0,                      ',
      ' :nro_afiliado,         ', ' ''C'',                  ',
      ' :nom_afiliado,       ', ' :nro_matricula,     ', ' :nro_receta,       ',
      ' :tip_tratamiento, ', ' NULL,        ', ' NULL,      ', ' '''',       ',
      ' NULL,   ', ' NULL, ', ' '''');');

    dmfacturador.icomprobante.ParamByName('SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIPO_COMPROBANTE').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
      Ticket.codigo_Co1;
    dmfacturador.icomprobante.ParamByName('nom_obrasocial').Asstring :=
      Ticket.nombre_co1;
    dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDateTime :=
      Ticket.fechafiscal;
    dmfacturador.icomprobante.ParamByName('fec_receta').asdate :=
      Ticket.fecha_recetaco1;
    dmfacturador.icomprobante.ParamByName('imp_ticket').AsFloat :=
      Ticket.importebruto * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('imp_afectado').AsFloat :=
      Ticket.importetotaldescuento * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('imp_cargoos').AsFloat :=
      Ticket.importecargoco1 * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('nro_afiliado').Asstring :=
      Ticket.afiliado_numeroco1;
    if (Ticket.afiliado_nombreco1 <> '') and (Ticket.afiliado_apellidoco1 <> '')
    then
    begin
      dmfacturador.icomprobante.ParamByName('nom_afiliado').Asstring :=
        Ticket.afiliado_nombreco1 + ' ' + Ticket.afiliado_apellidoco1;
    end;
    if (Ticket.afiliado_nombreco1 = '') and (Ticket.afiliado_apellidoco1 = '')
    then
    begin
      dmfacturador.icomprobante.ParamByName('nom_afiliado').Asstring :=
        Ticket.afiliado_apellidoco1;
    end;

    dmfacturador.icomprobante.ParamByName('nro_matricula').Asstring :=
      Ticket.medico_tipo_matricula + Ticket.medico_nro_matriculaco1;
    dmfacturador.icomprobante.ParamByName('nro_receta').Asstring :=
      Ticket.numero_recetaco1;
    dmfacturador.icomprobante.ParamByName('tip_tratamiento').Asstring := 'N';
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;

  if Ticket.codigo_Cos2 <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO OSMAMOVOBRASOCIAL                         ',
      '(NRO_SUCURSAL,                                       ',
      ' TIP_COMPROB,                                       ',
      ' NRO_COMPROB,                                      ',
      ' COD_PLANOS,                                      ',
      ' COD_PLANOSORIG,                                 ',
      ' NOM_OBRASOCIAL,                                ',
      ' FEC_COMPROB,                                  ',
      ' FEC_RECETA,                                  ',
      ' IMP_TICKET,                                 ',
      ' IMP_AFECTADO,                              ',
      ' IMP_CARGOOS,                              ',
      ' IMP_GENTILEZA,                           ',
      ' IMP_PRESTADOR,                          ',
      ' NRO_AFILIADO,                          ',
      ' COD_ESTADO,                           ',
      ' NOM_AFILIADO,                        ',
      ' NRO_MATRICULA,                      ',
      ' NRO_RECETA,                        ',
      ' MAR_TRATAMIENTO,                  ',
      ' NRO_LIQUIDACION,                 ', ' IDE_PRESENTACION,               ',
      ' DES_PARTICULARIDAD,            ', ' COD_CLINICA,                  ',
      ' NOM_CLINICA,                 ', ' INFOADICIONAL)              ',
      '                            ', ' VALUES (:sucursal,        ',
      ' :tipo_comprobante,       ', ' :nro_Comprobante,                 ',
      ' :cod_planos,                     ', '  NULL,                          ',
      ' :nom_obrasocial,               ', ' :fec_comprobante,             ',
      ' :fec_receta,                 ', ' :imp_ticket,                ',
      ' :imp_afectado,             ', ' :imp_cargoos,             ',
      ' 0,                       ', ' 0,                      ',
      ' :nro_afiliado,         ', ' ''C'',                  ',
      ' :nom_afiliado,       ', ' :nro_matricula,     ', ' :nro_receta,       ',
      ' :tip_tratamiento, ', ' NULL,        ', ' NULL,      ', ' '''',       ',
      ' NULL,   ', ' NULL, ', ' '''');');

    dmfacturador.icomprobante.ParamByName('SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIPO_COMPROBANTE').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
      Ticket.codigo_Cos2;
    dmfacturador.icomprobante.ParamByName('nom_obrasocial').Asstring :=
      Ticket.nombre_cos2;
    dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDateTime :=
      Ticket.fechafiscal;
    dmfacturador.icomprobante.ParamByName('fec_receta').asdate :=
      Ticket.fecha_recetaco1;
    dmfacturador.icomprobante.ParamByName('imp_ticket').AsFloat :=
      Ticket.importebruto * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('imp_afectado').AsFloat :=
      Ticket.importetotaldescuento * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('imp_cargoos').AsFloat :=
      Ticket.importecargoco2 * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('nro_afiliado').Asstring :=
      Ticket.afiliado_numeroco2;
    if (Ticket.afiliado_nombreco1 <> '') and (Ticket.afiliado_apellidoco1 <> '')
    then
    begin
      dmfacturador.icomprobante.ParamByName('nom_afiliado').Asstring :=
        Ticket.afiliado_nombreco2 + ' ' + Ticket.afiliado_apellidoco2;
    end;
    if (Ticket.afiliado_nombreco1 = '') and (Ticket.afiliado_apellidoco1 = '')
    then
    begin
      dmfacturador.icomprobante.ParamByName('nom_afiliado').Asstring :=
        Ticket.afiliado_apellidoco2;
    end;

    dmfacturador.icomprobante.ParamByName('nro_matricula').Asstring :=
      Ticket.medico_tipo_matricula + Ticket.medico_nro_matriculaco1;
    dmfacturador.icomprobante.ParamByName('nro_receta').Asstring :=
      Ticket.numero_recetaco1;
    dmfacturador.icomprobante.ParamByName('tip_tratamiento').Asstring := 'N';
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;
  //---------------agregado insercion-------------------//
    if imp_aplus <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO OSMAMOVOBRASOCIAL                         ',
      '(NRO_SUCURSAL,                                       ',
      ' TIP_COMPROB,                                       ',
      ' NRO_COMPROB,                                      ',
      ' COD_PLANOS,                                      ',
      ' COD_PLANOSORIG,                                 ',
      ' NOM_OBRASOCIAL,                                ',
      ' FEC_COMPROB,                                  ',
      ' FEC_RECETA,                                  ',
      ' IMP_TICKET,                                 ',
      ' IMP_AFECTADO,                              ',
      ' IMP_CARGOOS,                              ',
      ' IMP_GENTILEZA,                           ',
      ' IMP_PRESTADOR,                          ',
      ' NRO_AFILIADO,                          ',
      ' COD_ESTADO,                           ',
      ' NOM_AFILIADO,                        ',
      ' NRO_MATRICULA,                      ',
      ' NRO_RECETA,                        ',
      ' MAR_TRATAMIENTO,                  ',
      ' NRO_LIQUIDACION,                 ', ' IDE_PRESENTACION,               ',
      ' DES_PARTICULARIDAD,            ', ' COD_CLINICA,                  ',
      ' NOM_CLINICA,                 ', ' INFOADICIONAL)              ',
      '                            ', ' VALUES (:sucursal,        ',
      ' :tipo_comprobante,       ', ' :nro_Comprobante,                 ',
      ' :cod_planos,                     ', '  NULL,                          ',
      ' :nom_obrasocial,               ', ' :fec_comprobante,             ',
      ' :fec_receta,                 ', ' :imp_ticket,                ',
      ' :imp_afectado,             ', ' :imp_cargoos,             ',
      ' 0,                       ', ' 0,                      ',
      ' :nro_afiliado,         ', ' ''C'',                  ',
      ' :nom_afiliado,       ', ' :nro_matricula,     ', ' :nro_receta,       ',
      ' :tip_tratamiento, ', ' NULL,        ', ' NULL,      ', ' '''',       ',
      ' NULL,   ', ' NULL, ', ' '''');');

    dmfacturador.icomprobante.ParamByName('SUCURSAL').Asstring :=Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIPO_COMPROBANTE').Asstring :=Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :='ZBG';
    dmfacturador.icomprobante.ParamByName('nom_obrasocial').Asstring :='';
    dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDateTime :=Ticket.fechafiscal;
    dmfacturador.icomprobante.ParamByName('fec_receta').asdate :=now;
    dmfacturador.icomprobante.ParamByName('imp_ticket').AsFloat :=Ticket.importebruto * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('imp_afectado').AsFloat :=Ticket.importetotaldescuento * Ticket.coeficientetarjeta;
    dmfacturador.icomprobante.ParamByName('imp_cargoos').AsFloat :=Ticket.autofarmaplus;
    dmfacturador.icomprobante.ParamByName('nro_afiliado').Asstring :=Ticket.cod_cliente;
    if (Ticket.DESCRIPCIONCLIENTE <> '') then
    begin
      dmfacturador.icomprobante.ParamByName('nom_afiliado').Asstring := ticket.DESCRIPCIONCLIENTE;
    end;
    if (Ticket.DESCRIPCIONCLIENTE = '')  then
    begin
      dmfacturador.icomprobante.ParamByName('nom_afiliado').Asstring :='';
    end;

    dmfacturador.icomprobante.ParamByName('nro_matricula').Asstring := '';
    dmfacturador.icomprobante.ParamByName('nro_receta').Asstring :='';
    dmfacturador.icomprobante.ParamByName('tip_tratamiento').Asstring := 'N';
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;
  //---------------agregado insercion-------------------//
  // INSTERTAR OSMADETALLEMOV     --vr no lleva

  if Ticket.codigo_OS <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO OSMADETALLEMOV                     ',
      ' (COD_PLANOS,                                 ',
      ' NRO_SUCURSAL,                               ',
      ' TIP_COMPROB,                               ',
      ' NRO_COMPROB,                              ',
      ' NRO_ITEM,                                ',
      ' COD_ALFABETA,                           ',
      ' COD_LABORATORIO,                       ',
      ' NOM_LARGO,                            ',
      ' CAN_VENDIDA,                         ',
      ' IMP_UNITARIO,                       ',
      ' POR_DESCUENTO,                     ',
      ' IMP_DESCUENTO,                    ',
      ' MAR_MOTVENTA,                    ', ' NRO_TROQUEL,                    ',
      ' COD_VALIDACION)                ', '                               ',
      ' VALUES (:cod_planos,         ', ' :nro_sucursal,              ',
      ' :tip_comprobante,          ', ' :nro_comprobante,         ',
      ' :nro_item,               ', ' :cod_alfabeta,          ',
      ' :cod_laboratorio,      ', ' :nom_largo,           ',
      ' :can_vendida,        ', ' :imp_unitario,      ', ' :por_descuento,    ',
      ' :imp_descuento,   ', ' ''3'',            ', ' :nro_troquel,  ',
      ' :cod_validacion);');

    i := 0;
    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      i := i + 1;
      dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
        Ticket.codigo_OS;
      dmfacturador.icomprobante.ParamByName('nro_SUCURSAL').Asstring :=
        Ticket.sucursal;
      dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
        Ticket.comprobante;
      dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
        Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
      dmfacturador.icomprobante.ParamByName('nro_item').Asinteger := i;
      dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger :=
        ffacturador.Gfacturador.Fields[8].Asinteger;
      dmfacturador.icomprobante.ParamByName('cod_laboratorio').Asstring :=
        ffacturador.Gfacturador.Fields[15].Asstring;
      dmfacturador.icomprobante.ParamByName('nom_largo').Asstring :=
        ffacturador.Gfacturador.Fields[1].Asstring; //
      dmfacturador.icomprobante.ParamByName('can_vendida').Asstring :=
        ffacturador.Gfacturador.Fields[3].Asstring;
      dmfacturador.icomprobante.ParamByName('imp_unitario').AsFloat :=
        ffacturador.Gfacturador.Fields[2].AsFloat * Ticket.coeficientetarjeta;
      dmfacturador.icomprobante.ParamByName('por_descuento').AsFloat :=
        ffacturador.Gfacturador.Fields[11].AsFloat;

      dmfacturador.icomprobante.ParamByName('imp_descuento').AsFloat :=
        roundto((ffacturador.Gfacturador.Fields[14].AsFloat *
        Ticket.coeficientetarjeta) / (ffacturador.Gfacturador.Fields[3]
        .AsFloat), -2);
      // roundto((ffacturador.Gfacturador.Fields[2].Asfloat*ffacturador.Gfacturador.Fields[11].Asfloat)/100,-2);
      dmfacturador.icomprobante.ParamByName('nro_troquel').Asinteger :=
        ffacturador.Gfacturador.Fields[0].Asinteger;
      dmfacturador.icomprobante.ParamByName('cod_validacion').Asstring := '0';
      dmfacturador.icomprobante.Open;
      dmfacturador.ticomprobante.Commit;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

  end;
  //--------------agregado insercion--------------------//
   if IMP_APLUS <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO OSMADETALLEMOV                     ',
      ' (COD_PLANOS,                                 ',
      ' NRO_SUCURSAL,                               ',
      ' TIP_COMPROB,                               ',
      ' NRO_COMPROB,                              ',
      ' NRO_ITEM,                                ',
      ' COD_ALFABETA,                           ',
      ' COD_LABORATORIO,                       ',
      ' NOM_LARGO,                            ',
      ' CAN_VENDIDA,                         ',
      ' IMP_UNITARIO,                       ',
      ' POR_DESCUENTO,                     ',
      ' IMP_DESCUENTO,                    ',
      ' MAR_MOTVENTA,                    ', ' NRO_TROQUEL,                    ',
      ' COD_VALIDACION)                ', '                               ',
      ' VALUES (:cod_planos,         ', ' :nro_sucursal,              ',
      ' :tip_comprobante,          ', ' :nro_comprobante,         ',
      ' :nro_item,               ', ' :cod_alfabeta,          ',
      ' :cod_laboratorio,      ', ' :nom_largo,           ',
      ' :can_vendida,        ', ' :imp_unitario,      ', ' :por_descuento,    ',
      ' :imp_descuento,   ', ' ''3'',            ', ' :nro_troquel,  ',
      ' :cod_validacion);');

    i := 0;
    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      i := i + 1;
      dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :='ZBG';
      dmfacturador.icomprobante.ParamByName('nro_SUCURSAL').Asstring :=Ticket.sucursal;
      dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=Ticket.comprobante;
      dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
      dmfacturador.icomprobante.ParamByName('nro_item').Asinteger := i;
      dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger :=ffacturador.Gfacturador.Fields[8].Asinteger;
      dmfacturador.icomprobante.ParamByName('cod_laboratorio').Asstring :=ffacturador.Gfacturador.Fields[15].Asstring;
      dmfacturador.icomprobante.ParamByName('nom_largo').Asstring :=ffacturador.Gfacturador.Fields[1].Asstring; //
      dmfacturador.icomprobante.ParamByName('can_vendida').Asstring :=ffacturador.Gfacturador.Fields[3].Asstring;
      dmfacturador.icomprobante.ParamByName('imp_unitario').AsFloat :=ffacturador.Gfacturador.Fields[2].AsFloat * Ticket.coeficientetarjeta;
      dmfacturador.icomprobante.ParamByName('por_descuento').AsFloat :=ffacturador.Gfacturador.Fields[29].AsFloat;
      dmfacturador.icomprobante.ParamByName('imp_descuento').AsFloat :=roundto((ffacturador.Gfacturador.Fields[30].AsFloat *Ticket.coeficientetarjeta) / (ffacturador.Gfacturador.Fields[3].AsFloat), -2);
      // roundto((ffacturador.Gfacturador.Fields[2].Asfloat*ffacturador.Gfacturador.Fields[11].Asfloat)/100,-2);
      dmfacturador.icomprobante.ParamByName('nro_troquel').Asinteger :=ffacturador.Gfacturador.Fields[0].Asinteger;
      dmfacturador.icomprobante.ParamByName('cod_validacion').Asstring := '0';
      dmfacturador.icomprobante.Open;
      dmfacturador.ticomprobante.Commit;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

  end;
  //--------------agregado insercion--------------------//


  if Ticket.codigo_Co1 <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO OSMADETALLEMOV                     ',
      ' (COD_PLANOS,                                 ',
      ' NRO_SUCURSAL,                               ',
      ' TIP_COMPROB,                               ',
      ' NRO_COMPROB,                              ',
      ' NRO_ITEM,                                ',
      ' COD_ALFABETA,                           ',
      ' COD_LABORATORIO,                       ',
      ' NOM_LARGO,                            ',
      ' CAN_VENDIDA,                         ',
      ' IMP_UNITARIO,                       ',
      ' POR_DESCUENTO,                     ',
      ' IMP_DESCUENTO,                    ',
      ' MAR_MOTVENTA,                    ', ' NRO_TROQUEL,                    ',
      ' COD_VALIDACION)                ', '                               ',
      ' VALUES (:cod_planos,         ', ' :nro_sucursal,              ',
      ' :tip_comprobante,          ', ' :nro_comprobante,         ',
      ' :nro_item,               ', ' :cod_alfabeta,          ',
      ' :cod_laboratorio,      ', ' :nom_largo,           ',
      ' :can_vendida,        ', ' :imp_unitario,      ', ' :por_descuento,    ',
      ' :imp_descuento,   ', ' ''3'',            ', ' :nro_troquel,  ',
      ' :cod_validacion);');

    i := 0;
    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      i := i + 1;
      dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
        Ticket.codigo_Co1;
      dmfacturador.icomprobante.ParamByName('nro_SUCURSAL').Asstring :=
        Ticket.sucursal;
      dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
        Ticket.comprobante;
      dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
        Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
      dmfacturador.icomprobante.ParamByName('nro_item').Asinteger := i;
      dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger :=
        ffacturador.Gfacturador.Fields[8].Asinteger;
      dmfacturador.icomprobante.ParamByName('cod_laboratorio').Asstring :=
        ffacturador.Gfacturador.Fields[15].Asstring;
      dmfacturador.icomprobante.ParamByName('nom_largo').Asstring :=
        ffacturador.Gfacturador.Fields[1].Asstring; //
      dmfacturador.icomprobante.ParamByName('can_vendida').Asstring :=
        ffacturador.Gfacturador.Fields[3].Asstring;
      dmfacturador.icomprobante.ParamByName('imp_unitario').AsFloat :=
        ffacturador.Gfacturador.Fields[2].AsFloat * Ticket.coeficientetarjeta;
      dmfacturador.icomprobante.ParamByName('por_descuento').AsFloat :=
        ffacturador.Gfacturador.Fields[12].AsFloat;
      dmfacturador.icomprobante.ParamByName('imp_descuento').AsFloat :=
        roundto((ffacturador.Gfacturador.Fields[20].AsFloat *
        Ticket.coeficientetarjeta) / (ffacturador.Gfacturador.Fields[3]
        .AsFloat), -2);
      // ffacturador.Gfacturador.Fields[20].Asfloat;//(ffacturador.Gfacturador.Fields[2].Asfloat*ffacturador.Gfacturador.Fields[12].Asfloat)/100);
      dmfacturador.icomprobante.ParamByName('nro_troquel').Asinteger :=
        ffacturador.Gfacturador.Fields[0].Asinteger;
      dmfacturador.icomprobante.ParamByName('cod_validacion').Asstring := '0';
      dmfacturador.icomprobante.Open;
      dmfacturador.ticomprobante.Commit;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

  end;

  if Ticket.codigo_Cos2 <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO OSMADETALLEMOV                     ',
      ' (COD_PLANOS,                                 ',
      ' NRO_SUCURSAL,                               ',
      ' TIP_COMPROB,                               ',
      ' NRO_COMPROB,                              ',
      ' NRO_ITEM,                                ',
      ' COD_ALFABETA,                           ',
      ' COD_LABORATORIO,                       ',
      ' NOM_LARGO,                            ',
      ' CAN_VENDIDA,                         ',
      ' IMP_UNITARIO,                       ',
      ' POR_DESCUENTO,                     ',
      ' IMP_DESCUENTO,                    ',
      ' MAR_MOTVENTA,                    ', ' NRO_TROQUEL,                    ',
      ' COD_VALIDACION)                ', '                               ',
      ' VALUES (:cod_planos,         ', ' :nro_sucursal,              ',
      ' :tip_comprobante,          ', ' :nro_comprobante,         ',
      ' :nro_item,               ', ' :cod_alfabeta,          ',
      ' :cod_laboratorio,      ', ' :nom_largo,           ',
      ' :can_vendida,        ', ' :imp_unitario,      ', ' :por_descuento,    ',
      ' :imp_descuento,   ', ' ''3'',            ', ' :nro_troquel,  ',
      ' :cod_validacion);');

    i := 0;
    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      i := i + 1;
      dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
        Ticket.codigo_Cos2;
      dmfacturador.icomprobante.ParamByName('nro_SUCURSAL').Asstring :=
        Ticket.sucursal;
      dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
        Ticket.comprobante;
      dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
        Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
      dmfacturador.icomprobante.ParamByName('nro_item').Asinteger := i;
      dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger :=
        ffacturador.Gfacturador.Fields[8].Asinteger;
      dmfacturador.icomprobante.ParamByName('cod_laboratorio').Asstring :=
        ffacturador.Gfacturador.Fields[15].Asstring;
      dmfacturador.icomprobante.ParamByName('nom_largo').Asstring :=
        ffacturador.Gfacturador.Fields[1].Asstring; //
      dmfacturador.icomprobante.ParamByName('can_vendida').Asstring :=
        ffacturador.Gfacturador.Fields[3].Asstring;
      dmfacturador.icomprobante.ParamByName('imp_unitario').AsFloat :=
        ffacturador.Gfacturador.Fields[2].AsFloat;
      dmfacturador.icomprobante.ParamByName('por_descuento').Asinteger :=
        ffacturador.Gfacturador.Fields[13].Asinteger;
      dmfacturador.icomprobante.ParamByName('imp_descuento').AsFloat :=
        roundto((ffacturador.Gfacturador.Fields[27].AsFloat *
        Ticket.coeficientetarjeta) / (ffacturador.Gfacturador.Fields[3]
        .AsFloat), -2);
      // ffacturador.Gfacturador.Fields[20].Asfloat;//(ffacturador.Gf
      dmfacturador.icomprobante.ParamByName('nro_troquel').Asinteger :=
        ffacturador.Gfacturador.Fields[0].Asinteger;
      dmfacturador.icomprobante.ParamByName('cod_validacion').Asstring := '0';
      dmfacturador.icomprobante.Open;
      dmfacturador.ticomprobante.Commit;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;

  end;

  // stock.. --vr no lleva

  if dmfacturador.ticomprobante.InTransaction then
    dmfacturador.ticomprobante.Rollback;

  dmfacturador.ticomprobante.StartTransaction;
  dmfacturador.icomprobante.Database := dmfacturador.getConexion;

  dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.Clear;

  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.text :=
    concat('update prmastock set can_stk=:can_stk where cod_alfabeta=:cod_alfabeta and nro_sucursal=:nro_sucursal');

  ffacturador.Gfacturador.DataSource.DataSet.First;
  stockparcial := 0;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin
    dmfacturador.qbusquedastock.Close;
    dmfacturador.qbusquedastock.SQL.text :=
      concat('select can_stk from prmastock where cod_Alfabeta=:codigo and nro_sucursal=:sucursal');
    dmfacturador.qbusquedastock.ParamByName('codigo').Asinteger :=
      ffacturador.Gfacturador.Fields[8].Asinteger;
    dmfacturador.qbusquedastock.ParamByName('sucursal').Asstring :=
      Ticket.sucursal;
    dmfacturador.qbusquedastock.Open;
    if dmfacturador.qbusquedastock.RecordCount > 0 then
    begin

      stockparcial := dmfacturador.qbusquedastock.FieldByName('can_stk')
        .Asinteger;

    end;
    if dmfacturador.qbusquedastock.RecordCount = 0 then
    begin

      dmfacturador.qinsertlineastock.Close;
      dmfacturador.qinsertlineastock.SQL.text :=
        concat(' INSERT INTO PRMASTOCK (NRO_SUCURSAL, COD_ALFABETA, CAN_STKMIN, CAN_STKMAX, CAN_STK) ',
        ' VALUES (:sucursal, :alfabeta, 0, 1000, 0)');
      dmfacturador.qinsertlineastock.ParamByName('alfabeta').Asinteger :=
        ffacturador.Gfacturador.Fields[8].Asinteger;
      dmfacturador.qinsertlineastock.ParamByName('sucursal').Asstring :=
        Ticket.sucursal;
      dmfacturador.qinsertlineastock.Open;

      stockparcial := 0;

    end;

    dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger :=
      ffacturador.Gfacturador.Fields[8].Asinteger;
    dmfacturador.icomprobante.ParamByName('can_stk').Asinteger := stockparcial -
      ffacturador.Gfacturador.Fields[3].Asinteger;;
    dmfacturador.icomprobante.ParamByName('nro_sucursal').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;
    ffacturador.Gfacturador.DataSource.DataSet.Next;
  end;



  // ------------------------------------------RANCKING PRODUCTOS---------------------------------//
  // ----------------------------------------------------------------------------------------------//

  ffacturador.Gfacturador.DataSource.DataSet.First;
  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin

    if dmfacturador.tranking.InTransaction then
      dmfacturador.tranking.Rollback;

    dmfacturador.tranking.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.qranking.Transaction := dmfacturador.tranking;
    dmfacturador.qranking.SQL.Clear;
    dmfacturador.qranking.Close;
    dmfacturador.qranking.SQL.text :=
      concat('select can_stkinicial, can_venta_diaria, can_compra_diaria, can_movdia from cotbrankproducto b where b.dat_fecha_hora=:fecha and cod_alfabeta=:alfabeta');
    dmfacturador.qranking.ParamByName('alfabeta').Asinteger :=
      ffacturador.Gfacturador.Fields[8].Asinteger;
    dmfacturador.qranking.ParamByName('fecha').asdate := Ticket.fechafiscal;
    dmfacturador.qranking.Open;
    if dmfacturador.qranking.RecordCount > 0 then
    begin
      if dmfacturador.ticomprobante.InTransaction then
        dmfacturador.ticomprobante.Rollback;

      dmfacturador.ticomprobante.StartTransaction;
      dmfacturador.icomprobante.Database := dmfacturador.getConexion;
      dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
      dmfacturador.icomprobante.SQL.Clear;
      dmfacturador.icomprobante.Close;
      dmfacturador.icomprobante.SQL.text :=
        concat(' UPDATE COTBRANKPRODUCTO SET           ',
        ' CAN_STKINICIAL = :stock_inicial,     ',
        ' CAN_VENTA_DIARIA = :venta_diaria,   ',
        ' CAN_COMPRA_DIARIA = :compra_diaria, ',
        ' CAN_MOVDIA = :movdia               ',
        '                                     ',
        ' WHERE (NRO_SUCURSAL = :sucursal) AND ',
        ' (COD_ALFABETA = :alfabeta) AND ', '(DAT_FECHA_HORA = :fecha) ');

      dmfacturador.icomprobante.ParamByName('Sucursal').Asstring :=
        Ticket.sucursal;
      dmfacturador.icomprobante.ParamByName('alfabeta').Asinteger :=
        ffacturador.Gfacturador.Fields[8].Asinteger;
      dmfacturador.icomprobante.ParamByName('fecha').asdate :=
        Ticket.fechafiscal;
      dmfacturador.icomprobante.ParamByName('stock_inicial').Asinteger :=
        ffacturador.Gfacturador.Fields[16].Asinteger;;
      dmfacturador.icomprobante.ParamByName('venta_diaria').Asinteger :=
        dmfacturador.qranking.FieldByName('can_venta_diaria').Asinteger +
        ffacturador.Gfacturador.Fields[3].Asinteger;;
      dmfacturador.icomprobante.ParamByName('compra_diaria').Asinteger :=
        dmfacturador.qranking.FieldByName('can_compra_diaria').Asinteger;
      dmfacturador.icomprobante.ParamByName('movdia').Asinteger :=
        dmfacturador.qranking.FieldByName('can_movdia').Asinteger;
      dmfacturador.icomprobante.Open;
      dmfacturador.ticomprobante.Commit;
    end;
    if dmfacturador.qranking.RecordCount = 0 then

    begin

      if dmfacturador.ticomprobante.InTransaction then
        dmfacturador.ticomprobante.Rollback;

      dmfacturador.ticomprobante.StartTransaction;
      dmfacturador.icomprobante.Database := dmfacturador.getConexion;

      dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
      dmfacturador.icomprobante.SQL.Clear;
      dmfacturador.icomprobante.Close;
      dmfacturador.icomprobante.SQL.text :=
        concat(' INSERT                                 ',
        ' INTO COTBRANKPRODUCTO (NRO_SUCURSAL,   ',
        '  COD_ALFABETA,              ', '  DAT_FECHA_HORA,           ',
        '  CAN_STKINICIAL,          ',
        '  CAN_VENTA_DIARIA,                            ',
        '  CAN_COMPRA_DIARIA,                          ',
        '  CAN_MOVDIA,                                ',
        '  IMP_VENTA,                                ',
        '  IMP_NETOVENTA,                           ',
        '  IMP_COSTOVENTA,                         ',
        '  IMP_COSTOCOMPRA,                       ',
        '  IMP_OSD,                              ',
        '  IMP_RETENCION_OSD,                    ',
        '  CAN_UNID_OSD,                        ',
        '  IMP_OSM,                            ',
        '  IMP_RETENCION_OSM,                 ',
        '  CAN_UNID_OSM,                     ',
        '  IMP_COB_EFECTIVO,                ',
        '  IMP_COB_CHEQUE,                 ',
        '  IMP_COB_TARJ,                  ', '  IMP_RETENCION_TARJ,           ',
        '  IMP_CTACTE,                  ', '  IMP_DSC_CTACTE,             ',
        '  IMP_GENTILEZA,             ', '  IMP_DSC_AFIL_OSD,         ',
        '  IMP_DSC_AFIL_OSM)        ', '                          ',
        ' VALUES (:sucursal,                      ',
        ' :cod_Alfabeta,                         ',
        ' :fechahora,                           ',
        ' :stockinicial,                       ',
        ' :CANTIDAD,                          ',
        ' 0,                                 ',
        ' 0,                                ',
        ' :importeventa,                    ',
        ' :importeneto,                    ',
        ' :importecostoventa,             ', ' :importecostocompra,           ',
        ' :importeosd,                  ', ' :importeRETENCIONOSD,        ',
        ' :CAN_UNID_OSD,              ', ' :IMP_OSM,                   ',
        ' :CAN_UNID_OSM,              ', ' :importeRETENCIONOSM,           ',
        ' :IMP_COB_EFECTIVO,        ', ' :IMP_COB_CHEQUE,         ',
        ' :IMP_COB_TARJ,          ', ' :IMP_RETENCION_TARJ,   ',
        ' :IMP_CTACTE,          ', ' :IMP_DSC_CTACTE,     ',
        ' :IMP_GENTILEZA,     ', ' :IMP_DSC_AFIL_OSD, ', ' :IMP_DSC_AFIL_OSM)');

      dmfacturador.icomprobante.ParamByName('Sucursal').Asstring :=
        Ticket.sucursal;
      dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger :=
        ffacturador.Gfacturador.Fields[8].Asinteger;
      dmfacturador.icomprobante.ParamByName('fechahora').asdate :=
        Ticket.fechafiscal;
      dmfacturador.icomprobante.ParamByName('stockinicial').Asinteger :=
        ffacturador.Gfacturador.Fields[16].Asinteger;
      dmfacturador.icomprobante.ParamByName('CANTIDAD').Asinteger :=
        ffacturador.Gfacturador.Fields[3].Asinteger;
      dmfacturador.icomprobante.ParamByName('importeventa').AsFloat :=
        ffacturador.Gfacturador.Fields[2].AsFloat * Ticket.coeficientetarjeta;
      dmfacturador.icomprobante.ParamByName('importeneto').AsFloat :=
        ffacturador.Gfacturador.Fields[2].AsFloat * Ticket.coeficientetarjeta;
      dmfacturador.icomprobante.ParamByName('importecostoventa').AsFloat :=
        ffacturador.Gfacturador.Fields[2].AsFloat * Ticket.coeficientetarjeta;
      dmfacturador.icomprobante.ParamByName('importecostocompra').AsFloat :=
        ffacturador.Gfacturador.Fields[2].AsFloat * Ticket.coeficientetarjeta;
      dmfacturador.icomprobante.ParamByName('importeRETENCIONOSD').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('importeRETENCIONOSM').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('importeosd').AsFloat :=
        Ticket.importecargoos * Ticket.coeficientetarjeta;
      dmfacturador.icomprobante.ParamByName('CAN_UNID_OSD').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('IMP_COB_EFECTIVO').AsFloat :=
        strtofloat(imp_efectivo);
      dmfacturador.icomprobante.ParamByName('IMP_COB_CHEQUE').AsFloat :=
        strtofloat(imp_ch);
      dmfacturador.icomprobante.ParamByName('IMP_COB_TARJ').AsFloat :=
        strtofloat(imp_tarjeta);
      dmfacturador.icomprobante.ParamByName('IMP_RETENCION_TARJ').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('IMP_CTACTE').AsFloat :=
        strtofloat(imp_cc);
      dmfacturador.icomprobante.ParamByName('IMP_DSC_CTACTE').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('IMP_GENTILEZA').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('IMP_DSC_CTACTE').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('IMP_GENTILEZA').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('IMP_DSC_AFIL_OSD').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('IMP_DSC_AFIL_OSM').AsFloat := 0;
      dmfacturador.icomprobante.Open;
      dmfacturador.ticomprobante.Commit;

    end;

    ffacturador.Gfacturador.DataSource.DataSet.Next;
  end;

  // ----------------------------------------------------insertar pago comprobante modulo de caja-------------------//
  if Ticket.modulocaja = 'S' then
  BEGIN
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text := concat('INSERT INTO CJMAPAGOCOMPROB ',
      ' (nro_caja, NRO_SUCURSAL,  TIP_COMPROBANTE, NRO_COMPROBANTE, COD_ESTADO) ',
      ' VALUES (null ,:sucursal,  :tipo_comprobante, :nro_comprobante, ''PP'')');

    // dmfacturador.icomprobante.ParamByName('caja').AsString:=ticket.nro_caja;
    dmfacturador.icomprobante.ParamByName('sucursal').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('tipo_comprobante').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('nro_comprobante').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text := concat(' UPDATE cjmapagocomprob ',
      ' set nro_caja=null      ', ' WHERE nro_comprobante = :comprobante ',
      ' and tip_comprobante= :tipo_comprobante ');

    dmfacturador.icomprobante.ParamByName('tipo_comprobante').Asstring :=
      Ticket.comprobante;
    dmfacturador.icomprobante.ParamByName('comprobante').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  END;

  form.Close;
  inserciontk := 'ok';
end;

procedure TFIMPRESION.SetTicket(unTicket: TTicket);
begin
  Ticket := unTicket;
end;

procedure TFIMPRESION.UMActivated(var Message: TMessage);
begin
  modalresult := mrcancel;
end;

procedure TFIMPRESION.ventaxempleado;
VAR
  S, url: String;
  j, i: integer;
  Doc: IXMLDocument;
  resultado_alta_cliente, detalle: IXMLNode;
  porcentaje, descuentos, afiliado_nombre, afiliado_apellido: STRING;

  detalleval: IXMLNode;
begin

  S := '';
  try

    url := Ticket.url + 'save_descuento_empleado.php?' + 'dni=' +
      Ticket.afiliado_numeroco1 + '&importe=' + floattostr(Ticket.importebruto)
      + '&sucursal_id=' + Ticket.sucursal + '&documentno=' + 'B' +
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));

    IdHTTP.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    S := IdHTTP.Get(url);
    j := 0;
    Doc := LoadXMLData(S);

  except
    on E: Exception do
    begin
{$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:' + E.Message){$ENDIF};
    end;
  end;
end;

procedure TFIMPRESION.voucher;
var
  valor: string;
  numImpresora: integer;
  reg: tregistry;

begin

  reg := tregistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  reg.OpenKey(regKey, True);

  if dmfacturador.tpromo.InTransaction then
  begin
    dmfacturador.tpromo.Rollback;
  end;
  dmfacturador.icomprobante.Transaction := dmfacturador.tpromo;
  dmfacturador.qpromo.Close;
  dmfacturador.qpromo.SQL.Clear;
  dmfacturador.qpromo.SQL.Add
    ('select ultimopatchejecutado from defpatches where idpatch=:sucursal');
  dmfacturador.qpromo.ParamByName('sucursal').Asstring := Ticket.sucursal;
  dmfacturador.qpromo.Open;
  valor := dmfacturador.qpromo.FieldByName('ultimopatchejecutado').Asstring;
  dmfacturador.qpromo.Close;
  dmfacturador.qpromo.SQL.Clear;
  dmfacturador.qpromo.SQL.Add
    ('update defpatches set ultimopatchejecutado=:valor where idpatch=:sucursal');
  dmfacturador.qpromo.ParamByName('sucursal').Asstring := Ticket.sucursal;
  dmfacturador.qpromo.ParamByName('valor').Asstring :=
    inttostr(strtoint(valor) + 1);
  dmfacturador.qpromo.Open;
  dmfacturador.tpromo.Commit;

  if strtoint(valor) > 1000 then
  begin
    ShowMessage('IMPRIMIENDO VOUCHER DE REGALO X $2500');
    dmfacturador.qpromo.Close;
    dmfacturador.qpromo.SQL.Clear;
    dmfacturador.qpromo.SQL.Add
      ('update defpatches set ultimopatchejecutado=:valor where idpatch=:sucursal');
    dmfacturador.qpromo.ParamByName('sucursal').Asstring := Ticket.sucursal;
    dmfacturador.qpromo.ParamByName('valor').Asstring := '0';
    dmfacturador.qpromo.Open;
    dmfacturador.tpromo.Commit;
    with Printer do
    begin
      numImpresora := GetImpresora(reg.ReadString('IMPRESORA'));
      Printer.PrinterIndex := numImpresora;
      BeginDoc;
      Canvas.Brush.Style := bsclear;
      Canvas.Font.Height := 30;
      Canvas.TextOut(50, 10, 'VOUCHER DE COMPRA');
      Canvas.TextOut(50, 20, '_______________________________________');
      Canvas.Brush.Color := clBlack;
      Canvas.Brush.Style := bsclear;
      Canvas.Font.Height := 60;
      Canvas.TextOut(50, 50, 'VALIDO X $2500');
      Canvas.TextOut(50, 80, '');
      Canvas.TextOut(50, 80, '');
      Canvas.TextOut(50, 120, '_______________________________________');
      Canvas.Brush.Color := clBlack;
      Canvas.Brush.Style := bsclear;
      Canvas.Font.Height := 50;
      Canvas.Font.Height := 30;
      Canvas.TextOut(50, 80, '');
      Canvas.TextOut(50, 80, '');
      Canvas.TextOut(50, 350, '______________________________________');
      Canvas.Font.Height := 30;
      Canvas.TextOut(50, 400, 'autofarma centro de bienestar');
      Canvas.TextOut(50, 450, 'Fecha de emision: ' + datetostr(now));
      enddoc;

    end;

  end;

end;

//
procedure TFIMPRESION.setcuponusado;
VAR
  S, url: String;
  j, i: integer;
  Doc: IXMLDocument;
  resultado_alta_cliente, detalle: IXMLNode;
  porcentaje, descuentos, afiliado_nombre, afiliado_apellido: STRING;

  detalleval: IXMLNode;
begin

  S := '';
  try

    url := Ticket.url + 'set_cupon_usado.php?' + 'ID_CUPON=' +
      Ticket.codigocupon;

    IdHTTP.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    S := IdHTTP.Get(url);
    j := 0;

  except
    on E: Exception do
    begin
{$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:' + E.Message){$ENDIF};
    end;
  end;
end;

// --------------------------insercion del vale cuando lo tiene----------------------------------//
procedure TFIMPRESION.Insertarcomprobantevale;
var
  i: integer;
  iva: double;
  condIva: String;
  // importeTotal,
  unaTasaIVA: TTasaIVA;
  baseImponible, importeIva, unaTasa: double;

begin


  // INSERTAR VTMACOMPROBANTE

  if dmfacturador.ticomprobante.InTransaction then
  begin
    dmfacturador.ticomprobante.Rollback;
  end;
  dmfacturador.icomprobante.Database := dmfacturador.getConexion;

  dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.Clear;

  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.text :=
    concat('INSERT INTO VTMACOMPROBEMITIDO                                 ',
    ' (NRO_SUCURSAL,                                              ',
    ' TIP_COMPROBANTE,                                          ',
    ' NRO_COMPROBANTE,                                        ',
    ' NRO_CAJA,                                             ',
    ' COD_VENDEDOR,                                       ',
    ' NRO_TRANSACCION,                                  ',
    ' COD_CLIENTE,                                    ',
    ' NOM_CLIENTE,                                  ',
    ' COD_PROVEEDOR,                              ',
    ' FEC_COMPROBANTE,                          ',
    ' DES_LEYENDA,                            ',
    ' FEC_PROXVENC_RECETA,                  ',
    ' MAR_TRATAMIENTO,                    ',
    ' CAN_REIMPRESO,                    ', ' MAR_ANULADO,                    ',
    ' NRO_SUC_CANCELADO,            ', ' TIP_COMPROB_CANCELADO,      ',
    ' NRO_COMPROB_CANCELADO,    ', ' FEC_COMPROB_CANCELADO,  ',
    'DES_PARTICULARIDAD,   ',
    'MAR_ODONTOLOGO,                                                ',
    'NRO_PBM,                                                      ',
    'NOM_MEDICO,                                                  ',
    'CAN_ITEMS,                                                  ',
    'IMP_FINANC,                                                ',
    'IMP_NETO,                                                 ',
    'IMP_BRUTO,                                                ',
    ' IMP_INTERES,                                             ',
    ' IMP_GENTILEZA_FARM,                                      ',
    ' MAR_PASOXCAJA,                                           ',
    ' MAR_IMPRE_SUBDIA,                                      ',
    ' MAR_IMPRESO_FISCAL,                                  ',
    ' CAN_REIMPRESO_AUD,                                 ',
    ' IMP_VALES,                                       ',
    ' IMP_SALDO,                                     ',
    ' FEC_REF,                                     ',
    ' FEC_OPERATIVA,                             ',
    ' MAR_RESERVADO,                           ',
    ' IMP_APAGAR,                            ',
    ' IMP_PERCEPCION,                      ',
    ' MAR_ORIGEN,                        ',
    ' COD_CLINICA,                     ', ' NOM_CLINICA,                   ',
    ' COD_AUTORIZACION,            ', ' POR_GENTILEZA_FARM,        ',
    ' POR_IVA)                 ', ' VALUES (               ',
    ' :sucursal,           ',
    ' :tkcomprobante,                                      ',
    ' :nrocomprobante,                                    ',
    ' :caja,                                          ',
    ' :vendedor,                                    ',
    ' :transaccion,                               ',
    ' :cod_cliente,                             ',
    ' :nom_cliente,                           ',
    ' NULL,                                 ',
    ' :fec_comprobante,                   ',
    ' '''',                               ',
    ' :fec_receta,                    ', ' :mar_tratamiento,             ',
    ' 0,                          ', ' ''N'',                      ',
    ' :sucursal,              ', ' NULL,                 ',
    ' NULL,                 ', ' NULL,                                   ',
    ' '''',                                    ',
    ' ''N'',                                  ',
    ' -1,                                  ',
    ' :MEDICO,                            ',
    ' :CANTIDADINTEMS,                   ',
    ' 0,                                ',
    ' :IMP_NETO,                        ', ' :IMP_BRUTO,                      ',
    ' 0,                              ', ' 0,                             ',
    ' :PASOXCAJA,                   ', ' NULL,                         ',
    ' ''S'',                         ', ' 0,                          ',
    ' 0,                         ', ' :SALDOCC,                  ',
    ' :FEC_REF,                 ', ' :FEC_OPERATIVA,          ',
    ' NULL,                   ', ' NULL,                  ',
    ' 0,                    ', ' ''F'',                 ',
    ' NULL,               ', ' NULL,               ', ' :CODAUTORIZACION, ',
    ' NULL, ', ' NULL)');

  dmfacturador.icomprobante.ParamByName('SUCURSAL').Asstring := Ticket.sucursal;
  dmfacturador.icomprobante.ParamByName('TKCOMPROBANTE').Asstring :=
    'VR' + dmfacturador.getPuntoVenta();
  dmfacturador.icomprobante.ParamByName('NROCOMPROBANTE').Asstring :=
    Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
  if Ticket.nro_caja = '999' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('CAJA').Asstring := '';
  END;
  if Ticket.nro_caja <> '999' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('CAJA').Asstring := Ticket.nro_caja;
  END;
  dmfacturador.icomprobante.ParamByName('VENDEDOR').Asstring :=
    Ticket.cod_vendedor;
  dmfacturador.icomprobante.ParamByName('TRANSACCION').Asstring :=
    inttostr(nro_comprob);
  dmfacturador.icomprobante.ParamByName('COD_CLIENTE').Asstring :=
    Ticket.codigocliente;
  dmfacturador.icomprobante.ParamByName('nom_cliente').Asstring :=
    Ticket.DESCRIPCIONCLIENTE;
  dmfacturador.icomprobante.ParamByName('fec_comprobante').AsDateTime :=
    Ticket.fechafiscal;
  dmfacturador.icomprobante.ParamByName('fec_receta').asdate :=
    Ticket.fecha_receta;
  if Ticket.codigo_tratamiento = '' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('mar_tratamiento').Asstring := 'N';
  END;
  if Ticket.codigo_tratamiento <> '' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('mar_tratamiento').Asstring :=
      Ticket.codigo_tratamiento;
  END;
  dmfacturador.icomprobante.ParamByName('sucursal').Asstring := Ticket.sucursal;
  dmfacturador.icomprobante.ParamByName('MEDICO').Asstring :=
    Ticket.medico_apellido + Ticket.medico_nombre;
  dmfacturador.icomprobante.ParamByName('CANTIDADINTEMS').Asinteger :=
    Ticket.itemstotales;
  dmfacturador.icomprobante.ParamByName('IMP_NETO').AsFloat := 0;
  dmfacturador.icomprobante.ParamByName('IMP_BRUTO').AsFloat := 0;
  if Ticket.nro_caja = '999' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('PASOXCAJA').Asstring := 'N';
  END;
  if Ticket.nro_caja <> '999' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('PASOXCAJA').Asstring := 'S';
  END;

  dmfacturador.icomprobante.ParamByName('SALDOCC').AsFloat := 0;
  dmfacturador.icomprobante.ParamByName('FEC_REF').asdate := Ticket.fechacaja;
  if Ticket.nro_caja = '999' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('FEC_OPERATIVA').Asstring := '';
  END;
  if Ticket.nro_caja <> '999' then
  BEGIN
    dmfacturador.icomprobante.ParamByName('FEC_OPERATIVA').asdate :=
      Ticket.fec_operativa;
  END;
  dmfacturador.icomprobante.ParamByName('CODAUTORIZACION').Asstring := '0';

  dmfacturador.icomprobante.Open;
  dmfacturador.ticomprobante.Commit;







  // INSTERTAR VTMADETALLECOMPROB -----------------------------------------// VR

  if dmfacturador.ticomprobante.InTransaction then
  begin
    dmfacturador.ticomprobante.Rollback;
  end;
  dmfacturador.icomprobante.Database := dmfacturador.getConexion;

  dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.Clear;

  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.text :=
    concat('INSERT INTO VTMADETALLECOMPROB ',
    '(NRO_SUCURSAL,                  ', 'TIP_COMPROBANTE,                 ',
    'NRO_COMPROBANTE,                  ', 'NRO_ITEM,                          ',
    'COD_ALFABETA,                       ',
    'NOM_PRODUCTO,                        ',
    'CAN_CANTIDAD,                         ',
    'IMP_UNITARIO,                          ',
    'IMP_IVADESC,                            ',
    'IMP_IVA_NETO,                            ',
    'IMP_IVATASA,                              ',
    'IMP_PRODNETO,                              ',
    'IMP_GENTILEZA_FARM,                         ',
    'MAR_MODIF,                                   ',
    'MAR_MOTVENTA,                                 ',
    'CAN_VALE,                                      ',
    'TIP_VALE,                                       ',
    'COD_PROD_REC,                                   ',
    'COD_AUTORIZACION)                               ',
    '                                                ',
    'VALUES (:nro_sucursal,                          ',
    ':TIP_COMPROBANTE,                                        ',
    ':nro_comprobante,                               ',
    ':nro_item,                                      ',
    ':cod_alfabeta,                                  ',
    ':nom_producto,                                  ',
    ':cantidad,                                      ',
    ':imp_unitario,                                  ',
    ':IMP_IVADESC,                                   ',
    ':IMP_IVANETO,                                   ',
    ':IMP_IVATASA,                                   ',
    ':IMP_PRODNETO,                                  ',
    '0,                                              ',
    '''N'',                                          ',
    'NULL,                                           ',
    ':CAN_VALE,                                              ',
    'NULL,                                           ',
    'NULL,                                           ', ''''');');

  i := 0;

  ffacturador.Gfacturador.DataSource.DataSet.First;

  while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
  begin
    if ffacturador.Gfacturador.Fields[18].Asinteger > 0 then
    begin
      i := i + 1;
      dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
        'VR' + dmfacturador.getPuntoVenta();
      dmfacturador.icomprobante.ParamByName('nro_sucursal').Asstring :=
        Ticket.sucursal;
      dmfacturador.icomprobante.ParamByName('nro_comprobante').Asstring :=
        Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
      dmfacturador.icomprobante.ParamByName('nro_item').Asinteger := i;
      dmfacturador.icomprobante.ParamByName('cod_alfabeta').Asinteger :=
        ffacturador.Gfacturador.Fields[8].Asinteger;
      dmfacturador.icomprobante.ParamByName('nom_producto').Asstring :=
        ffacturador.Gfacturador.Fields[1].Asstring;
      dmfacturador.icomprobante.ParamByName('cantidad').Asinteger :=
        ffacturador.Gfacturador.Fields[3].Asinteger;
      dmfacturador.icomprobante.ParamByName('imp_unitario').AsFloat := 0;

      // ----------cuando tiene obra social o coseguro cambia el campo del iva--------------------///
      if not((Ticket.codigo_OS <> '') or (Ticket.codigo_Co1 <> '') or
        (Ticket.codigo_Cos2 <> '')) then
      begin
        if ffacturador.Gfacturador.Fields[10].Asstring = 'B' then
        begin
          iva := (Ticket.IVAB / 100) + 1;
          dmfacturador.icomprobante.ParamByName('imp_ivaneto').AsFloat := 0;
          dmfacturador.icomprobante.ParamByName('imp_ivadesc').AsFloat := 0;
        end;
        if ffacturador.Gfacturador.Fields[10].Asstring <> 'B' then
        begin
          iva := 0;
          dmfacturador.icomprobante.ParamByName('imp_ivaneto').AsFloat := 0;
          dmfacturador.icomprobante.ParamByName('imp_ivadesc').AsFloat := 0;
        end;

      end;

      if (Ticket.codigo_OS <> '') or (Ticket.codigo_Co1 <> '') or
        (Ticket.codigo_Cos2 <> '') then
      begin
        if ffacturador.Gfacturador.Fields[10].Asstring = 'B' then
        begin
          iva := (Ticket.IVAB / 100) + 1;
          dmfacturador.icomprobante.ParamByName('imp_ivadesc').AsFloat := 0;
          dmfacturador.icomprobante.ParamByName('imp_ivaneto').AsFloat := 0;
        end;
        if ffacturador.Gfacturador.Fields[10].Asstring <> 'B' then
        begin
          iva := 0;
          dmfacturador.icomprobante.ParamByName('imp_ivadesc').AsFloat := 0;
          dmfacturador.icomprobante.ParamByName('imp_ivaneto').AsFloat := 0;
        end;
        // ----------cuando tiene obra social o coseguro cambia el campo del iva--------------------///
      end;
      dmfacturador.icomprobante.ParamByName('imp_ivatasa').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('imp_prodneto').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('can_vale').Asstring :=
        ffacturador.Gfacturador.Fields[18].Asstring;
      dmfacturador.icomprobante.Open;
      dmfacturador.ticomprobante.Commit;
    end;
    ffacturador.Gfacturador.DataSource.DataSet.Next;
  end;



  // INSERTAR VTMAPORCENTAJESIVA   ----VR LLEVA PERO TODOS LOS VALORES EN 0

  if dmfacturador.ticomprobante.InTransaction then
    dmfacturador.ticomprobante.Rollback;

  dmfacturador.ticomprobante.StartTransaction;
  dmfacturador.icomprobante.Database := dmfacturador.getConexion;

  dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.Clear;

  dmfacturador.icomprobante.Close;
  dmfacturador.icomprobante.SQL.text :=
    concat('INSERT INTO VTMAPORCENTAJESIVA                        ',
    '(NRO_SUCURSAL,                                       ',
    'TIP_COMPROBANTE,                                     ',
    'NRO_COMPROBANTE,                                     ',
    'NRO_ITEM,                                           ',
    'POR_PORCENTAJE,                                     ',
    'POR_SOBRETASA,                                     ',
    'IMP_NETOGRAV,                                      ',
    'IMP_IVA,                                         ',
    'IMP_IVASOBRETASA,                              ',
    'IMP_NETOGRAV_DESC,                           ',
    'IMP_IVA_DESC,                              ',
    'IMP_IVASOBRETASA_DESC)                   ',
    '                                       ',
    'VALUES (:nro_sucursal,                   ', ':tip_comprobante,  ',
    ':nro_comprobante,                ', ':nro_item,                     ',
    ':por_porcentaje,             ', ':por_sobretasa,            ',
    ':imp_netograv,            ', ':imp_iva,                ',
    ':imp_ivasobretasa,     ', ':imp_netograv_desc,   ', ':imp_iva_desc,      ',
    'NULL);');

  i := 0;

  for condIva in Ticket.TotalesIVA.Keys do
  Begin
    i := i + 1;
    Ticket.TotalesIVA.TryGetValue(condIva, unaTasaIVA);
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      'VR' + dmfacturador.getPuntoVenta();
    dmfacturador.icomprobante.ParamByName('nro_sucursal').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('nro_comprobante').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('nro_item').Asinteger := i;

    // Obtener la tasa de iva de la tabla PRMAIVA con la condicion condIVA
    if condIva = 'A' then
      unaTasa := Ticket.IVAA
    else if condIva = 'B' then
      unaTasa := Ticket.IVAB
    else if condIva = 'D' then
      unaTasa := Ticket.IVAD
    else if condIva = 'E' then
      unaTasa := Ticket.IVAE
    else if condIva = 's' then
      unaTasa := Ticket.IVAs;

    // Si es S poner el monto sobretrasa sino 0
    iva := unaTasa / 100;
    baseImponible := unaTasaIVA.importeTotal / (1 + iva);
    importeIva := baseImponible * iva;

    dmfacturador.icomprobante.ParamByName('por_sobretasa').Asstring := '0';
    dmfacturador.icomprobante.ParamByName('por_porcentaje').AsFloat := 0;

    if not((Ticket.codigo_OS <> '') or (Ticket.codigo_Co1 <> '') or
      (Ticket.codigo_Cos2 <> '')) then
    Begin
      // NO TENGO OBRA SOCIAL
      dmfacturador.icomprobante.ParamByName('imp_netograv').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('imp_netograv_desc').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('imp_iva').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('imp_iva_desc').AsFloat := 0;
    End
    else
    begin // TIENE OBRA SOCIAL
      dmfacturador.icomprobante.ParamByName('imp_netograv_desc').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('imp_netograv').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('imp_iva_desc').AsFloat := 0;
      dmfacturador.icomprobante.ParamByName('imp_iva').AsFloat := 0;
    end;
    dmfacturador.icomprobante.ParamByName('imp_ivasobretasa').AsFloat := 0;
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;
  End;




  // INSERTAR VTTBPAGOCHEQUE          --VR LLEVA TODOS LOS MEDIOS DE PAGO

  if strtofloat(imp_ch) <> 0 then
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat(' INSERT INTO VTTBPAGOCHEQUE (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_BANCO, COD_CTA, NRO_CHEQUE, IMP_CHEQUE) VALUES (:sucursal,:tip_comprobante, :nro_comprobante, :cod_banco, '''', :nro_cheque, :importe_cheque);');

    dmfacturador.icomprobante.ParamByName('SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      'VR' + dmfacturador.getPuntoVenta();
    dmfacturador.icomprobante.ParamByName('nro_comprobante').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('cod_banco').Asstring :=
      Ticket.codigocheque;
    dmfacturador.icomprobante.ParamByName('nro_cheque').Asstring :=
      Ticket.numerocheque;
    dmfacturador.icomprobante.ParamByName('importe_cheque').AsFloat :=
      strtofloat(imp_ch);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;

  // INSTERTAR VTTPAGOCTACTE

  if strtofloat(imp_cc) <> 0 then
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text := concat(' INSERT INTO VTTBPAGOCTACTE ',
      '(NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_CTACTE, COD_SUBCTA, COD_AUTORIZACTA, IMP_CTACTE, IMP_SALDO, ',
      ' MAR_RESUMIDO, NRO_SUCURSAL_LIQ, NRO_LIQUIDACION, CAN_CUOTAS, CAN_CUOTASPEN, POR_IVA, CODIGOPAGO) ',
      ' VALUES (:NRO_SUCURSAL,:TIP_COMPROBANTE , :NRO_COMPROB, :COD_CTACTE, :COD_SUBCTA, '''', :IMP_CTACTE, :IMP_SCTACTE, ''N'', 0, NULL, 0, 0, NULL, NULL)');

    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      'VR' + dmfacturador.getPuntoVenta();
    dmfacturador.icomprobante.ParamByName('nro_comprob').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_CTACTE').Asstring :=
      Ticket.codigocc;
    dmfacturador.icomprobante.ParamByName('cod_subcta').Asstring :=
      Ticket.codigosubcc;
    dmfacturador.icomprobante.ParamByName('imp_ctacte').AsFloat :=
      strtofloat(imp_cc);
    dmfacturador.icomprobante.ParamByName('imp_sctacte').AsFloat :=
      strtofloat(imp_cc);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;

  // INSERTAR VTTPAGOEFECTIVO

  if strtofloat(imp_efectivo) <> 0 then
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO VTTBPAGOEFECTIVO (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_MONEDA, IMP_EFECTIVO, IMP_COTIZ, POR_IVA)',
      ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, ''$'', :IMP_EFECTIVO, NULL, NULL)');

    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      'VR' + dmfacturador.getPuntoVenta();
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('imp_EFECTIVO').AsFloat :=
      strtofloat(imp_efectivo);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;





  // INSERTAR VTTBPAGOTARJETA

  if strtofloat(imp_tarjeta) <> 0 then
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat(' INSERT INTO VTTBPAGOTARJETA (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_TARJETA, NRO_TARJETA, COD_MONEDA, NRO_CUPON, ',
      ' IMP_TARJETA, IMP_COTIZ, NRO_CUOTA, NRO_AUTORIZACION, NRO_LIQUIDACION, FEC_VENCIMIENTO, NRO_PIN, POR_IVA, CODIGOPAGO)',
      ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_TARJETA, ''0'', ''$'', NULL, :IMP_TARJETA, NULL, 0, 0, NULL, CURRENT_DATE , 0, NULL, NULL)');

    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      'VR' + dmfacturador.getPuntoVenta();
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_TARJETA').Asstring :=
      Ticket.codigotarjeta;
    dmfacturador.icomprobante.ParamByName('imp_tarjeta').AsFloat :=
      strtofloat(imp_tarjeta);
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;




  // INSERTAR VTMADESCCOMPROB     ------VR LLEVA PERO SIN IMPORTES

  if Ticket.codigo_OS <> '' THEN
  begin
    i := 0;

    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[18].Asinteger > 0 then
      begin
        i := i + 1;
        if dmfacturador.ticomprobante.InTransaction then
          dmfacturador.ticomprobante.Rollback;

        dmfacturador.ticomprobante.StartTransaction;
        dmfacturador.icomprobante.Database := dmfacturador.getConexion;

        dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Clear;

        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.text :=
          concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
          ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

        dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
          Ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
          'VR' + dmfacturador.getPuntoVenta();
        dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
          Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
        dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
          Ticket.codigo_OS;
        dmfacturador.icomprobante.ParamByName('ITEM').AsFloat := i;
        dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat := 0;
        dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat := 0;
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;

      end;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
  end;

  if Ticket.codigo_Co1 <> '' THEN
  begin
    i := 0;

    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[18].Asinteger > 0 then
      begin
        i := i + 1;
        if dmfacturador.ticomprobante.InTransaction then
          dmfacturador.ticomprobante.Rollback;

        dmfacturador.ticomprobante.StartTransaction;
        dmfacturador.icomprobante.Database := dmfacturador.getConexion;

        dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Clear;

        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.text :=
          concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
          ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

        dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
          Ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
          'VR' + dmfacturador.getPuntoVenta();
        dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
          Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
        dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
          Ticket.codigo_Co1;
        dmfacturador.icomprobante.ParamByName('ITEM').AsFloat := i;
        dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat := 0;
        dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat := 0;
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;

      end;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
  end;
  if Ticket.codigo_Cos2 <> '' THEN
  begin
    i := 0;

    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
      if ffacturador.Gfacturador.Fields[18].Asinteger > 0 then
      begin
        i := i + 1;
        if dmfacturador.ticomprobante.InTransaction then
          dmfacturador.ticomprobante.Rollback;

        dmfacturador.ticomprobante.StartTransaction;
        dmfacturador.icomprobante.Database := dmfacturador.getConexion;

        dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.Clear;

        dmfacturador.icomprobante.Close;
        dmfacturador.icomprobante.SQL.text :=
          concat(' INSERT INTO VTMADESCCOMPROB (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_ITEM, POR_DESCUENTO, IMP_DESCUENTO, IMP_GENTILEZA, POR_GENTILEZA)',
          ' VALUES (:NRO_SUCURSAL, :TIP_COMPROBANTE, :NRO_COMPROBANTE, :COD_PLANOS, :ITEM, :POR_DESCUENTO, :IMP_DESCUENTO, 0, NULL)');

        dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
          Ticket.sucursal;
        dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
          'VR' + dmfacturador.getPuntoVenta();
        dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
          Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
        dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
          Ticket.codigo_Cos2;
        dmfacturador.icomprobante.ParamByName('ITEM').AsFloat := i;
        dmfacturador.icomprobante.ParamByName('POR_DESCUENTO').AsFloat := 0;
        dmfacturador.icomprobante.ParamByName('IMP_DESCUENTO').AsFloat := 0;
        dmfacturador.icomprobante.Open;
        dmfacturador.ticomprobante.Commit;

      end;
      ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
  end;


  // INSERTAR VTMADETALLEAFILOS  ---vr lleva     sin importes tambien

  if Ticket.codigo_OS <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO VTMADETALLEAFILOS ',
      ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
      ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
      ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
      ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
      ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');

    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      'VR' + dmfacturador.getPuntoVenta();
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
      Ticket.codigo_OS;
    dmfacturador.icomprobante.ParamByName('nro_afiliado').Asstring :=
      Ticket.afiliado_numero;
    dmfacturador.icomprobante.ParamByName('nro_matricula').Asstring :=
      Ticket.medico_tipo_matricula + Ticket.medico_nro_matricula;
    dmfacturador.icomprobante.ParamByName('nom_medico').Asstring :=
      Ticket.medico_nombre + ' ' + Ticket.medico_apellido;
    dmfacturador.icomprobante.ParamByName('nro_receta').Asstring :=
      Ticket.numero_receta;
    dmfacturador.icomprobante.ParamByName('fec_recet').asdate :=
      Ticket.fecha_receta;
    dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency := 0;
    dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency := 0;
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;

  if Ticket.codigo_Co1 <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO VTMADETALLEAFILOS ',
      ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
      ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
      ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
      ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
      ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');

    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      'VR' + dmfacturador.getPuntoVenta();
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
      Ticket.codigo_Co1;
    dmfacturador.icomprobante.ParamByName('nro_afiliado').Asstring :=
      Ticket.afiliado_numero;
    dmfacturador.icomprobante.ParamByName('nro_matricula').Asstring :=
      Ticket.medico_tipo_matriculaco1 + Ticket.medico_nro_matriculaco1;
    dmfacturador.icomprobante.ParamByName('nom_medico').Asstring :=
      Ticket.medico_nombre + ' ' + Ticket.medico_apellido;
    dmfacturador.icomprobante.ParamByName('nro_receta').Asstring :=
      Ticket.numero_receta;
    dmfacturador.icomprobante.ParamByName('fec_recet').asdate :=
      Ticket.fecha_recetaco1;
    dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency := 0;
    dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency := 0;
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;
  if Ticket.codigo_Cos2 <> '' THEN
  begin
    if dmfacturador.ticomprobante.InTransaction then
      dmfacturador.ticomprobante.Rollback;

    dmfacturador.ticomprobante.StartTransaction;
    dmfacturador.icomprobante.Database := dmfacturador.getConexion;

    dmfacturador.icomprobante.Transaction := dmfacturador.ticomprobante;
    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.Clear;

    dmfacturador.icomprobante.Close;
    dmfacturador.icomprobante.SQL.text :=
      concat('INSERT INTO VTMADETALLEAFILOS ',
      ' (NRO_SUCURSAL, TIP_COMPROBANTE, NRO_COMPROBANTE, COD_PLANOS, NRO_AFILIADO, NRO_MATRICULA, NOM_MEDICO, NRO_RECETA, FEC_RECETA, ',
      ' IMP_ABONAOS, IMP_GENTILEZA, IMP_PRESTADOR, IMP_TOTALAFEC, NOM_AFILIADO, MAR_INHIBIDO, FECHADENACIMIENTO, NRODEDOCUMENTO, COD_ESPECIALIDAD, ',
      ' COD_CLINICA, COD_DIAGNOSTICO, ESPECIALIDAD, DIAGNOSTICO, CLINICA, POR_IVA, SEXO, PARENTESCO, TIPOTRATAMIENTO, TIPOMATRICULA, TIPORECETARIO, COD_AUTORIZACION, MAR_MEDICOINHIBIDO, NUMEROCLINICA)',
      ' VALUES (:nro_sucursal, :tip_comprobante, :nro_comprobante, :cod_planos, :nro_afiliado , :nro_matricula, :nom_medico, ',
      ' :nro_receta, :fec_recet, :imp_abonaos, 0, 0, :imp_totalfec, :nom_afiliado, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL); ');

    dmfacturador.icomprobante.ParamByName('NRO_SUCURSAL').Asstring :=
      Ticket.sucursal;
    dmfacturador.icomprobante.ParamByName('TIP_COMPROBANTE').Asstring :=
      'VR' + dmfacturador.getPuntoVenta();
    dmfacturador.icomprobante.ParamByName('nro_comprobANTE').Asstring :=
      Ticket.fiscla_pv + (RightPad(inttostr(nro_comprob), '0', 8));
    dmfacturador.icomprobante.ParamByName('COD_PLANOS').Asstring :=
      Ticket.codigo_Cos2;
    dmfacturador.icomprobante.ParamByName('nro_afiliado').Asstring :=
      Ticket.afiliado_numero;
    dmfacturador.icomprobante.ParamByName('nro_matricula').Asstring :=
      Ticket.medico_nro_matricula;
    dmfacturador.icomprobante.ParamByName('nom_medico').Asstring :=
      Ticket.medico_nombre + ' ' + Ticket.medico_apellido;
    dmfacturador.icomprobante.ParamByName('nro_receta').Asstring :=
      Ticket.numero_receta;
    dmfacturador.icomprobante.ParamByName('fec_recet').asdate :=
      Ticket.fecha_recetaco1;
    dmfacturador.icomprobante.ParamByName('imp_abonaos').Ascurrency := 0;
    dmfacturador.icomprobante.ParamByName('imp_totalfec').Ascurrency := 0;
    dmfacturador.icomprobante.Open;
    dmfacturador.ticomprobante.Commit;

  end;
end;

procedure TFIMPRESION.mimpresionKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
  begin
    FIMPRESION.CloseModal;
  end;
end;

procedure TFIMPRESION.modificacion;
var
  modificado: TTicketmodif;
  i: integer;
  lista: TList;
  archivo: TextFile;
  ruta_archivo: string;
  unaLinea: String;
  reg: tregistry;
  Fecha: TDate;
  Dia, Mes, Anio: Word;

  S, url: String;
  j: integer;
  Doc: IXMLDocument;
  resultado_alta_cliente, detalle: IXMLNode;
  sucursal, STOCK: STRING;

  detalleval: IXMLNode;
begin
  reg := tregistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  reg.OpenKey(regKey, True);
  Fecha := Date;
  DecodeDate(Fecha, Anio, Mes, Dia);
  if Ticket.cola = 'S' then
  BEGIN
    nrocomprobante;
    Ticket.nroticketadicional := Ticket.fiscla_pv +
      (RightPad(inttostr(nro_comprobdigital), '0', 8));
  END;
  ruta_archivo := reg.ReadString('Reportes') + Ticket.nombre_terminal +
    inttostr(Mes) + inttostr(Anio) + '.txt';
  AssignFile(archivo, ruta_archivo);
  if FileExists(ruta_archivo) then
    append(archivo)
  else
    rewrite(archivo);
  for i := 0 to Ticket.modif.Count - 1 do
  begin
    modificado := Ticket.modif.Items[i];
    if (Ticket.cola = 'S') then
    BEGIN
      modificado.nro_comprobante := Ticket.nroticketadicional;
    END
    ELSE
    BEGIN
      modificado.nro_comprobante := Ticket.fiscla_pv +
        (RightPad(inttostr(nro_comprob), '0', 8));
    END;
    if ffacturador.Gfacturador.Fields[8].Asstring = modificado.cod_alfabeta then
    begin
      modificado.precio_nuevo := ffacturador.Gfacturador.Fields[2].Asstring;

    end;
    unaLinea := 'MODIFICACION ';
    unaLinea := unaLinea + '|';
    unaLinea := unaLinea + inttostr(modificado.nro_item) + '|';
    unaLinea := unaLinea + modificado.nombre_largo + '|';
    unaLinea := unaLinea + modificado.precio_viejo + '|';
    unaLinea := unaLinea + modificado.precio_nuevo + '|';
    unaLinea := unaLinea + modificado.vendedor + '|';
    unaLinea := unaLinea + modificado.nro_comprobante + '|';
    unaLinea := unaLinea + modificado.cod_alfabeta + '|';
    unaLinea := unaLinea + datetimetostr(now) + '|';
    unaLinea := unaLinea + #13 + #10;
    write(archivo, unaLinea);

    try
      modificado.nombre_largo := httpencode(modificado.nombre_largo);
      modificado.vendedor := httpencode(modificado.vendedor);

      url := Ticket.url + 'save_cambioprecio.php?' + 'sucursal=' +
        Ticket.sucursal + '&vendedor=' + modificado.vendedor + '&precio_orig=' +
        modificado.precio_viejo + '&precio_nuevo=' + modificado.precio_nuevo +
        '&cod_alfabeta=' + modificado.cod_alfabeta + '&descripcion=' +
        modificado.nombre_largo + '&nro_comprobante=' +
        modificado.nro_comprobante + '&nro_item=' +
        inttostr(modificado.nro_item);

      idhttpcambios.Request.UserAgent :=
        'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';

      S := idhttpcambios.Get(url);

    except
      on E: EIdHTTPProtocolException do
      begin
        // {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
      end;
      on E: EIdSocketError do
      begin
        // {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
      end;
    end;

  end;

  CloseFile(archivo);

end;

procedure TFIMPRESION.nrocomprobante;
var
  Hora: string;

begin
  Hora := formatdatetime('mmddHHMMSS', (now));

  nro_comprobdigital := strtoint(Hora);
end;

end.

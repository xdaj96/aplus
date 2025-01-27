unit facturador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,uMessageDLG,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, registry, Data.DBXFirebird, Data.DB,
  Data.SqlExpr, Data.FMTBcd, buscaros, ubuscarco1, Vcl.ComCtrls,
  IBX.IBCustomDataSet,uConsultaReceta,
  IBX.IBQuery, IBX.IBDatabase, Datasnap.DBClient, UdmFacturador, uticket,
  ubuscardatos,Urecargos,
  Vcl.Mask, Vcl.CustomizeDlg, Vcl.PlatformDefaultStyleActnCtrls, System.Actions,
  Vcl.ActnList, Vcl.ActnMan, math, UCalcularDescuento, Xml.xmldom, Xml.XMLIntf,
  Xml.XMLDoc, System.UITypes, uvalida, udTicket, ustock,
  System.Generics.collections, uvale, uprogreso, umodificar,
  Uhistorial, ulimitescobertura, uproductosd, udrogas, udesdroga,
  uAnalizaOfertas, DateUtils,uUtils,ucalculadoraPrecio,uconsultaRecetaElec,
  Vcl.XPMan, Vcl.Styles.DbGrid, Vcl.ValEdit, udatosadicionales, uautempleados,
  uturnos, passaj, ufautofarmaplus, uafiliar,uRegistryHelper,

  // Refactorizacion
  uMedico,uMedicoService,uAfiliado,uAfiliadoService

  ;

Const
  RegKey = 'Software\Autofarma\APlus\';

type
  TFfacturador = class(TForm)

    Panel1: TPanel;
    Gfacturador: TDBGrid;
    Evendedor: TEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    pgCoberturas: TPageControl;
    tbCobertura: TTabSheet;
    tbCoseguro: TTabSheet;
    tbCoseguro2: TTabSheet;
    Eos: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Eco1: TEdit;
    Eco2: TEdit;
    Panel2: TPanel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    bbuscar: TButton;
    Panel4: TPanel;
    eafiliado: TEdit;
    eosapellido: TEdit;
    eosmedicoAPELLIDO: TEdit;
    ebusqueda: TEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    imprimir: TBitBtn;
    Label30: TLabel;
    Rbusqueda: TRadioGroup;
    los: TEdit;
    dtfecreceta: TDateTimePicker;
    Eosmatricula: TEdit;
    eosreceta: TEdit;
    blimpiar: TBitBtn;
    Panel5: TPanel;
    ECO1AFILIADO: TEdit;
    eco1apellido: TEdit;
    eco1apellidomedico: TEdit;
    dtfeccoseguro: TDateTimePicker;
    ECO1MATRICULA: TEdit;
    eco1receta: TEdit;
    lco2: TEdit;
    lco1: TEdit;
    blimpiarco1: TBitBtn;
    Blimpiartodo: TBitBtn;
    BVALIDAR: TBitBtn;
    DESCOBER: TBitBtn;
    Ltratamiento: TLabel;
    Cosprovincia: TComboBox;
    Label36: TLabel;
    EOSMEDICONOMBRE: TEdit;
    Label37: TLabel;
    eosnombre: TEdit;
    Label38: TLabel;
    Label39: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    eco1nombremedico: TEdit;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    cco1provincia: TComboBox;
    eco1nombre: TEdit;
    pinformativo: TPanel;
    combotipo: TComboBox;
    importetotal: TDBText;
    descuentos: TDBText;
    netoacobrar: TDBText;
    descuentoco1: TDBText;
    descuentoos: TDBText;
    descuentoco2: TDBText;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    bvale: TBitBtn;
    bprecio: TBitBtn;
    Shape1: TShape;
    bgrabarafiliado: TBitBtn;
    bgrabarmedico: TBitBtn;
    bhistorial: TBitBtn;
    bagregarafico: TBitBtn;
    bagregarmedico: TBitBtn;
    desbloqueo: TLabel;
    bmodificable: TButton;
    bstockonline: TBitBtn;
    bdetalle: TBitBtn;
    importegentilezas: TDBText;
    Label18: TLabel;
    Panel3: TPanel;
    Label19: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label47: TLabel;
    eco2afiliado: TEdit;
    eco2apellido: TEdit;
    eco2medicoapellido: TEdit;
    dtfeccoseguro2: TDateTimePicker;
    eco2matricula: TEdit;
    eco2receta: TEdit;
    blimpiarco2: TBitBtn;
    cco2provincia: TComboBox;
    eco2mediconombre: TEdit;
    eco2nombre: TEdit;
    Bgrabarafico2: TBitBtn;
    bagregarmedicoco2: TBitBtn;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label33: TLabel;
    Label4: TLabel;
    lturno: TPanel;
    descuentoaplus: TDBText;
    Label34: TLabel;
    Label35: TLabel;
    Label48: TLabel;
    lblDatosMedico: TLabel;
    btnRecargos: TButton;
    lblLeyendaTurno: TLabel;
    bValidaReElec: TBitBtn;

    procedure FormShow(Sender: TObject);
    procedure EvendedorChange(Sender: TObject);
    procedure EvendedorKeyPress(Sender: TObject; var Key: Char);
    procedure EosChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Eco1Change(Sender: TObject);
    procedure Eco2Change(Sender: TObject);

    procedure EosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Eco1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure setCoseguro1(coseguro: String);
    procedure Eco2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbuscarClick(Sender: TObject);
    procedure bagregarClick(Sender: TObject);
    procedure GfacturadorKeyPress(Sender: TObject; var Key: Char);
    procedure imprimirClick(Sender: TObject);
    procedure losChange(Sender: TObject);
    procedure eafiliadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eafiliadoKeyPress(Sender: TObject; var Key: Char);
    procedure eosapellidoKeyPress(Sender: TObject; var Key: Char);
    procedure eosnombreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EosmatriculaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eosmedicoAPELLIDOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EosmatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure blimpiarClick(Sender: TObject);
    procedure lco1Change(Sender: TObject);
    procedure lco2Change(Sender: TObject);
    procedure ECO1AFILIADOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECO1AFILIADOKeyPress(Sender: TObject; var Key: Char);
    procedure ECO1MATRICULAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECO1MATRICULAKeyPress(Sender: TObject; var Key: Char);
    procedure eco2afiliadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eco2afiliadoKeyPress(Sender: TObject; var Key: Char);
    procedure eco2nombreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eco2nombreKeyPress(Sender: TObject; var Key: Char);
    procedure eco2matriculaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eco2matriculaKeyPress(Sender: TObject; var Key: Char);
    procedure eco2medicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eco2medicoKeyPress(Sender: TObject; var Key: Char);
    procedure blimpiarco1Click(Sender: TObject);
    procedure LimpiarClick(Sender: TObject);
    procedure ebusquedaKeyPress(Sender: TObject; var Key: Char);
    procedure gproductoKeyPress(Sender: TObject; var Key: Char);
    procedure GfacturadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gproductoDblClick(Sender: TObject);
    procedure ebusquedaEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DESCOBERClick(Sender: TObject);
    procedure BVALIDARClick(Sender: TObject);
    procedure GfacturadorExit(Sender: TObject);
    procedure dbcombotipoExit(Sender: TObject);
    procedure BlimpiartodoClick(Sender: TObject);
    procedure bvaleClick(Sender: TObject);
    procedure arregladescuento;
    procedure BcancelarClick(Sender: TObject);
    procedure bprecioClick(Sender: TObject);
    procedure EvendedorEnter(Sender: TObject);
    procedure EvendedorExit(Sender: TObject);
    procedure EosEnter(Sender: TObject);
    procedure EosExit(Sender: TObject);
    procedure eafiliadoEnter(Sender: TObject);
    procedure eafiliadoExit(Sender: TObject);
    procedure eosapellidoEnter(Sender: TObject);
    procedure eosapellidoExit(Sender: TObject);
    procedure eosnombreEnter(Sender: TObject);
    procedure eosnombreExit(Sender: TObject);
    procedure EosmatriculaEnter(Sender: TObject);
    procedure EosmatriculaExit(Sender: TObject);
    procedure eosmedicoAPELLIDOEnter(Sender: TObject);
    procedure eosmedicoAPELLIDOExit(Sender: TObject);
    procedure EOSMEDICONOMBREEnter(Sender: TObject);
    procedure EOSMEDICONOMBREExit(Sender: TObject);
    procedure eosrecetaEnter(Sender: TObject);
    procedure eosrecetaExit(Sender: TObject);
    procedure ebusquedaExit(Sender: TObject);
    procedure ECO1MATRICULAEnter(Sender: TObject);
    procedure ECO1MATRICULAExit(Sender: TObject);
    procedure EvendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Eco1Enter(Sender: TObject);
    procedure Eco1Exit(Sender: TObject);
    procedure ECO1AFILIADOEnter(Sender: TObject);
    procedure ECO1AFILIADOExit(Sender: TObject);
    procedure eco1apellidoEnter(Sender: TObject);
    procedure eco1apellidoExit(Sender: TObject);
    procedure eco1nombreEnter(Sender: TObject);
    procedure eco1nombreExit(Sender: TObject);
    procedure eco1apellidomedicoEnter(Sender: TObject);
    procedure eco1apellidomedicoExit(Sender: TObject);
    procedure eco1nombremedicoEnter(Sender: TObject);
    procedure eco1nombremedicoExit(Sender: TObject);
    procedure eco1nombreKeyPress(Sender: TObject; var Key: Char);
    procedure pgCoberturasDrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure bhistorialClick(Sender: TObject);
    procedure bgrabarafiliadoClick(Sender: TObject);
    procedure bgrabarmedicoClick(Sender: TObject);
    procedure bagregaraficoClick(Sender: TObject);
    procedure bagregarmedicoClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure eosnombreKeyPress(Sender: TObject; var Key: Char);
    procedure eosmedicoAPELLIDOKeyPress(Sender: TObject; var Key: Char);
    procedure EOSMEDICONOMBREKeyPress(Sender: TObject; var Key: Char);
    procedure eosdiagnosticoKeyPress(Sender: TObject; var Key: Char);
    procedure eosrecetaKeyPress(Sender: TObject; var Key: Char);
    procedure dtfecrecetaKeyPress(Sender: TObject; var Key: Char);
    procedure eco1apellidoKeyPress(Sender: TObject; var Key: Char);
    procedure eco1apellidomedicoKeyPress(Sender: TObject; var Key: Char);
    procedure eco1nombremedicoKeyPress(Sender: TObject; var Key: Char);
    procedure eco1diagnosticoKeyPress(Sender: TObject; var Key: Char);
    procedure eco1recetaKeyPress(Sender: TObject; var Key: Char);
    procedure dtfeccoseguroKeyPress(Sender: TObject; var Key: Char);
    procedure ECO1MATRICULAChange(Sender: TObject);
    procedure ECO1AFILIADOChange(Sender: TObject);
    procedure eafiliadoChange(Sender: TObject);
    procedure EosmatriculaChange(Sender: TObject);
    procedure Eco1KeyPress(Sender: TObject; var Key: Char);
    procedure bmodificableClick(Sender: TObject);
    procedure combotipoKeyPress(Sender: TObject; var Key: Char);
    procedure bstockonlineClick(Sender: TObject);
    procedure combotipoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bdetalleClick(Sender: TObject);
    procedure tbCoberturaExit(Sender: TObject);
    procedure tbCoseguroExit(Sender: TObject);
    procedure Eco2Enter(Sender: TObject);
    procedure Eco2Exit(Sender: TObject);
    procedure Eco2KeyPress(Sender: TObject; var Key: Char);
    procedure eco2afiliadoChange(Sender: TObject);
    procedure eco2afiliadoEnter(Sender: TObject);
    procedure eco2afiliadoExit(Sender: TObject);
    procedure Bgrabarafico2Click(Sender: TObject);
    procedure bagregarmedicoco2Click(Sender: TObject);
    procedure blimpiarco2Click(Sender: TObject);
    procedure eco2medicoapellidoKeyPress(Sender: TObject; var Key: Char);
    procedure eco2mediconombreKeyPress(Sender: TObject; var Key: Char);
    procedure eco2recetaKeyPress(Sender: TObject; var Key: Char);
    procedure dtfeccoseguro2KeyPress(Sender: TObject; var Key: Char);
    procedure GfacturadorCellClick(Column: TColumn);
    procedure pgCoberturasExit(Sender: TObject);
    procedure CosprovinciaExit(Sender: TObject);
    procedure CosprovinciaSelect(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cosprovinciakeypress(Sender: TObject; var Key: Char);
    procedure btnRecargosClick(Sender: TObject);
    procedure eco2matriculaChange(Sender: TObject);

    procedure lturnoClick(Sender: TObject);
    procedure ebusquedaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bValidaReElecClick(Sender: TObject);


  private
    esMedicoNuevo:Boolean;
    porcentajeAumentoHosp:double;
    registroSistema:TRegistryHelper;
    medicoService:TMedicoService;
    afiliadoService:TAfiliadoService;
   esAfiliadoValido,esMedicoValido:boolean;
    calcuPrecio:TCalculadoraPrecio;

    procedure guardarMedico(eCodPlanos:TEdit;eNroMatricula:TEdit;eNombre:TEdit;eApellido:TEdit);
    procedure guardarAfiliado(eCodPlanos:TEdit;eNroAfiliado:TEdit;eNombre:TEdit;eApellido:TEdit);
    procedure buscarMedico(eCodPlanos:TEdit;eNroMatricula:TEdit;eNombre:TEdit;eApellido:TEdit);
    procedure buscarAfiliado(eCodPlanos:TEdit;eNroAfiliado:TEdit;eNombre:TEdit;eApellido:TEdit);
    procedure validarAfiliado(eNroAfiliado:TEdit;eNombre:TEdit;eApellido:TEdit);
    procedure validarMedico(ematricula:TEdit;eNombre:TEdit;eApellido:TEdit);

    function verificarAfiliado:boolean;
    procedure cargarRecargoHospital;
    procedure consultarRecetasElectronicas;

  public

    Ticket: TTicket;
    comprobadorLimite: TComprobadorLimites;
    procedure SetTicket(unTicket: TTicket);
    procedure leerTicket();
    procedure limpiarunidadticket;
    procedure limiteos;
    procedure limiteco1;
    procedure reos;
    procedure reosempty;
    procedure reco1;
    procedure reco2;
    procedure reco1empty;
    procedure reco2empty;
    procedure precio;
    procedure recalculo;
    procedure verificarcaja;
    procedure ivadesc;
    procedure archivomod;
    function verificarMatricula: Boolean;
    procedure reiniciartodo;
    procedure traervendedor;

  var
    codigo_validador: string;
    codigo_os_validador: string;
    porvarlabo: double;
    porvarrubro: double;
    preciocrudo: double;
    preciocalculado: double;
    //promo farmacoins//
    fccredencial: string;
    fcsaldo: string;
    fcfarmacoin: string;
    //-- AGREGADO PARA RESTO DE COSEGURO -- //
    marTipoDescCo1,marTipoDescCO2:string;


    existemedico: boolean;
    frmTurnos:Tfturnos;
    enterKey:char;

  end;

var
  Ffacturador: TFfacturador;
  PROMO: STRING;

implementation

{$R *.dfm}

uses login, ubusquedaproductos;

type
  DBGridExt = class(TDBGrid);

procedure TFfacturador.traervendedor;
begin
    begin
    dmFacturador.qvendedor.Close;
    dmFacturador.qvendedor.SQL.Clear;
    dmFacturador.qvendedor.SQL.Append
      ('select nom_vendedor from vtmavendedor where cod_vendedor=:codigo_vendedor');
    dmFacturador.qvendedor.ParamByName('codigo_vendedor').AsString :=
      Evendedor.Text;
    dmFacturador.qvendedor.Open;
    Label1.Caption := dmFacturador.qvendedor.Fields[0].Text;
  END;
end;


{-------------------------------------------------------------------------
  Procedimiento: consultarRecetasElectronicas
  Fecha: 17-11-2024
  Autor: David Avalos Jeppewy
  Version: 0.0.1
  Descripción: Consulta de recetas del afiliado por ahora solo PAMI
--------------------------------------------------------------------------}

procedure TFfacturador.consultarRecetasElectronicas;
var

  key:char;
begin
  fConsultaReceta := TfConsultaReceta.Create(self);
  dmFacturador.AbrirConexion;
  dmFacturador.IBQcodigoprestador.Close;
  dmFacturador.IBQcodigoprestador.SQL.Text := concat('select cod_farmacia, path_envio, path_respuesta from osmavalidadores where cod_validador=:codigo');
  dmFacturador.IBQcodigoprestador.ParamByName('codigo').AsString := codigo_validador;
  dmFacturador.IBQcodigoprestador.Open;
  Ticket.codigoos_prestador := dmFacturador.IBQcodigoprestador.Fields[0].Text;
  Ticket.path_validador := dmFacturador.IBQcodigoprestador.Fields[1].Text;
  Ticket.path_respuesta := dmFacturador.IBQcodigoprestador.Fields[2].Text;
  Ticket.codigo_validador := codigo_validador;
  ticket.afiliado_numero:= eafiliado.text;
  Ticket.codigoos_validador := codigo_os_validador;
  Ticket.afiliado_apellido := eosapellido.Text;
  Ticket.afiliado_nombre := eosnombre.Text;
  Ticket.afiliado_apellidoco1 := eco1apellido.Text;
  Ticket.afiliado_apellidoco2 := eco2apellido.Text;

  fConsultaReceta.SetTicket(ticket);
  fConsultaReceta.ShowModal;
 ticket:= fConsultaReceta.Ticket;

  if not dmFacturador.DPRINCIPAL.Active then
  begin
    dmFacturador.DPRINCIPAL.CreateDataSet;
    dmFacturador.dprincipal.Open;
  end;

  key:= #13;
  eosreceta.Text:=ticket.numero_receta;
  dtfecreceta.Date:=ticket.fecha_receta;
  Eosmatricula.Text:= ticket.medico_nro_matricula;
    buscarMedico(eos,Eosmatricula,EOSMEDICONOMBRE,eosmedicoAPELLIDO);

  bValidaReElec.Click;








end;

//-----------------------------------------------------------------------------//

procedure TFfacturador.validarAfiliado(eNroAfiliado:TEdit;eNombre:TEdit;eApellido:TEdit);
var
  buttonSelected: Integer;

begin
  if eNroAfiliado.Text = '' then
begin
  eNroAfiliado.SetFocus;
  Exit;
end;

eNombre.Enabled := true;
eApellido.Enabled := true;

if eapellido.Text <> '' then
begin
  eApellido.SetFocus;
  Exit;
end;




buttonSelected := MensajeDLG('Afiliado inexistente. Complete los datos para agregarlo',
                 'Registro de afiliado', mtConfirmation, [mbOK, mbCancel]);
if buttonSelected = mrOk then
begin
  eApellido.SetFocus;
  Exit;
end;

eNroAfiliado.SetFocus;
eNombre.Enabled := false;
eApellido.Enabled := false;


end;



procedure TFfacturador.buscarAfiliado(eCodPlanos: TEdit; eNroAfiliado: TEdit; eNombre: TEdit; eApellido: TEdit);
var
  afiliado:TAfiliado;
begin
   afiliado:= afiliadoService.buscarAfiliado(eCodPlanos.Text,eNroAfiliado.Text);
   bhistorial.Enabled:= false;
   if Assigned(afiliado) then
   begin
      enombre.Text:= afiliado.nombre;
      eApellido.Text:= afiliado.apellido;
      bhistorial.Enabled:= true;
      exit;
   end;

   enombre.Text:='';
   eapellido.Text:= '';



end;

{-------------------------------------------------------------------------
  Procedimiento: buscarMedico
  Fecha: 07-03-2024
  Autor: David Avalos Jeppewy
  Version: 0.0.1
  Descripción: Verifico si el medico existe sino limpio los controles
--------------------------------------------------------------------------}

procedure TFfacturador.buscarMedico(eCodPlanos: TEdit; eNroMatricula: TEdit; eNombre: TEdit; eApellido: TEdit);
var
  medico:TMedico;

begin
   medico:= medicoService.buscarMedico(eCodPlanos.Text,eNroMatricula.Text);

   if Assigned(medico) then
   begin
      enombre.Text:= medico.nombre;
      eApellido.Text:= medico.apellido;

      exit;
   end;

   enombre.Text:='';
   eapellido.Text:= '';


end;



{-------------------------------------------------------------------------
  Procedimiento: validarMedico
  Fecha: 07-03-2024
  Autor: David Avalos Jeppewy
  Version: 0.0.1
  Descripción: Valida el medico y rellena los campos
--------------------------------------------------------------------------}

procedure TFfacturador.validarMedico(ematricula: TEdit; eNombre: TEdit; eApellido: TEdit);
var
  buttonSelected: Integer;

begin

eNombre.Enabled := true;
eApellido.Enabled := true;

if eApellido.Text <> '' then
begin
  eApellido.SetFocus;
  Exit;
end;

buttonSelected := MensajeDLG('Medico inexistente. Complete los datos para agregarlo',
                 'Registro de medico', mtConfirmation, [mbOK, mbCancel]);
if buttonSelected = mrOk then
begin
  eApellido.SetFocus;
  Exit;
end;

ematricula.SetFocus;
eNombre.Enabled := false;
eApellido.Enabled := false;



end;

{--------------------------------------------------------------------------}



{-------------------------------------------------------------------------
  Procedimiento: CargarRecargoHospital
  Fecha: 29-12-2023
  Autor: David Avalos Jeppewy
  Version: 0.0.1
  Descripción: Carga el porcentaje de recargo para hospitales
--------------------------------------------------------------------------}

procedure TFfacturador.cargarRecargoHospital;
var
  aumentoHospi: string;
begin
   aumentoHospi := registroSistema.LeerValor('RecargoHosp');
  if (not TUtils.esNumero(aumentoHospi)) or (strToInt(aumentoHospi) < 0) then
  begin
    porcentajeAumentoHosp := 1.45; // Recargo 45% a hospitales por defecto
    registroSistema.EscribirValor('RecargoHosp','45');
  end
  else

  begin
    porcentajeAumentoHosp := 1 + (strToInt(aumentoHospi) / 100);
  end;
end;

{--------------------------------------------------------------------------}


{-------------------------------------------------------------------------
  Función: verificarAfiliado
  Fecha: 29-12-2023
  Autor: David Avalos Jeppewy
  Version: 0.0.1
  Descripción: Verifica que exista el afiliado y tenga los datos cargados
--------------------------------------------------------------------------}

function TFfacturador.verificarAfiliado:Boolean;
var
detener: Boolean;
begin
  detener := True;
  if not(TUtils.esCampoVacio(eos.Text)) and (TUtils.esCampoVacio(eosapellido.Text) or TUtils.esCampoVacio(eafiliado.Text) or TUtils.esCampoVacio(eafiliado.Text)) then
  begin

    detener := False;

  end;

  Result:=detener;

end;

{--------------------------------------------------------------------------}

{-------------------------------------------------------------------------
  Procedimiento: ReiniciarTodo
  Fecha: 29-12-2023
  Autor: David Avalos Jeppewy
  Version: 0.0.1
  Descripción: Limpia todos los controles del formulario
--------------------------------------------------------------------------}

procedure TFfacturador.reiniciartodo;

var
valor_evendedor : boolean;
valor_ebusqueda : boolean;
valor_evendedor_nuevo : boolean;
valor_ebusqueda_nuevo : boolean;

begin
     esMedicoNuevo:= False;
     valor_evendedor := evendedor.Enabled;
     valor_ebusqueda := ebusqueda.Enabled;
     panel1.Enabled := true;
     panel2.Enabled := true;
     evendedor.Enabled := true;
     ebusqueda.Enabled := true;
     valor_evendedor_nuevo := evendedor.Enabled;
     valor_ebusqueda_nuevo := ebusqueda.Enabled;
     descober.Click;
  if dmFacturador.DPRINCIPAL.Active = true then
  begin
    dmFacturador.DPRINCIPAL.EmptyDataSet;
  end;
  if dmFacturador.dsecundario.Active = true then
  begin
    dmFacturador.dsecundario.Close;
  end;

  ebusqueda.Clear;

  pgCoberturas.TabIndex := 0;
  blimpiar.Click;
  pgCoberturas.TabIndex := 1;
  blimpiarco1.Click;
  pgCoberturas.TabIndex := 2;
  blimpiarco2.Click;
  pgCoberturas.TabIndex := 0;
  bprecio.Enabled := false;
  bvale.Enabled := false;
  BVALIDAR.Enabled := false;
  imprimir.Enabled := false;
  DESCOBER.Enabled := false;
  bstockonline.Enabled := false;
  bdetalle.Enabled := false;
  combotipo.ItemIndex := 0;
  Rbusqueda.ItemIndex := 0;

  limpiarunidadticket;
  pgCoberturas.ActivePageIndex := 0;
  dtfecreceta.DateTime := now;
  pgCoberturas.ActivePageIndex := 1;
  dtfeccoseguro.DateTime := now;
  pgCoberturas.ActivePageIndex := 0;
  panel1.Enabled := true;
  combotipo.Enabled := true;
  combotipo.SetFocus;
  ffacturador.fccredencial:='';
  ffacturador.fcsaldo:='';
  ffacturador.fcfarmacoin:='';
  ticket.TIENEAPLUS:='N';
  if Ticket.modif <> nil then
  begin
    Ticket.modif.Clear;
  end;
  // evendedor.SetFocus;
end;

{--------------------------------------------------------------------------}



{-------------------------------------------------------------------------
  Procedimiento: guardarAfiliado
  Fecha: 06-03-2024
  Autor: David Avalos Jeppewy
  Version: 0.0.1
  Descripción: Guarda los datos del afiliado en la base de datos
--------------------------------------------------------------------------}

procedure TFFacturador.guardarAfiliado(eCodPlanos:TEdit;eNroAfiliado:TEdit;eNombre:TEdit;eApellido:TEdit);
var
  afiliado: TAfiliado;
  buttonSelected:Integer;
begin
   esAfiliadoValido:= false;
   if eNroAfiliado.Text='' then
   begin
      showmessage('Inserte Numero de afiliado');
      eNroAfiliado.SetFocus;
      exit;
   end;

   if eApellido.TEXT='' then
   begin
      showmessage('Inserte Apellido de afiliado');
      eApellido.SetFocus;
      exit;
   end;

   if eNombre.TEXT='' then
   begin
      showmessage('Inserte nombre de afiliado');
      enombre.SetFocus;
      exit;
   end;


  afiliado := afiliadoService.buscarAfiliado(eos.Text, eafiliado.Text);
  buttonSelected := MensajeDLG('¿Desea guardar el afiliado?' + #13#10 +
      'Número de Afiliado: ' + eNroAfiliado.Text + #13#10 +
      'Código de OS: ' + eCodPlanos.Text + #13#10 +
      'Nombre completo: ' + eApellido.Text + ' ' + eNombre.Text + #13#10 +
      'Usuario: ' + Label1.Caption, 'Guardar afiliado', mtConfirmation, [mbYes, mbNo]);

  if buttonSelected = mrYes then
  begin
    try
        afiliado:= afiliadoService.getAfiliado(eCodPlanos.text,eNroAfiliado.text,eApellido.text,enombre.text);
        afiliadoService.guardar(afiliado);
        esAfiliadoValido:= True;
    except
      on E:Exception do
      begin
          showMessage(e.Message);
          eNroAfiliado.SetFocus;
      end;
    end;

  end;
end;







{-------------------------------------------------------------------------
  Procedimiento: guardarAfiliado
  Fecha: 06-03-2024
  Autor: David Avalos Jeppewy
  Version: 0.0.1
  Descripción: Guarda los datos del medico en la base de datos
--------------------------------------------------------------------------}

procedure TFfacturador.guardarMedico(eCodPlanos: TEdit; eNroMatricula: TEdit; eNombre: TEdit; eApellido: TEdit);
var
  buttonSelected:integer;
  medico:TMedico;
begin
   esMedicoValido:= false;
   if eNroMatricula.Text='' then
   begin
      showmessage('Inserte Numero de matricula');
      eNroMatricula.SetFocus;
      exit;
   end;

   if eApellido.TEXT='' then
   begin
      showmessage('Inserte Apellido de medico');
      eApellido.SetFocus;
      exit;
   end;

   if eNombre.TEXT='' then
   begin
      showmessage('Inserte nombre de medico');
      enombre.SetFocus;
      exit;
   end;

   buttonSelected := MensajeDLG('¿Desea guardar el médico?' + #13#10 +
      'Número de Matricula: ' + eNroMatricula.Text + #13#10 +
      'Código de OS: ' + eCodPlanos.Text + #13#10 +
      'Nombre completo: ' + eApellido.Text + ' ' + eNombre.Text + #13#10 +
      'Usuario: ' + Label1.Caption, 'Guardar Medico', mtConfirmation, [mbYes, mbNo]);

  esMedicoValido:= true;
  if buttonSelected = mrYes then
  begin
    try
        medico:= medicoService.getMedico(eCodPlanos.text,eNroMatricula.text,eApellido.text,enombre.text);
        medicoService.guardar(medico);
    except
      on E:Exception do
      begin
          showMessage(e.Message);
          eNroMatricula.SetFocus;
      end;
    end;

  end;




end;



{-------------------------------------------------------------------------
  Procedimiento: bagregaraficoClick
  Fecha: 29-12-2023
  Autor: David Avalos Jeppewy
  Version: 0.0.1
  Descripción: Verifica los datos del afiliado por coseguro y lo registra en la bd
--------------------------------------------------------------------------}

procedure TFfacturador.bagregaraficoClick(Sender: TObject);
begin
  if length(pchar(trim(eco1afiliado.Text))) <1 then
  begin
    esAfiliadoValido:=true;
    exit;
  end;


  guardarAfiliado(eco1,ECO1AFILIADO,eco1nombre,ECO1apellido);
end;

procedure TFfacturador.bagregarClick(Sender: TObject);

begin

  { if dmfacturador.dprincipal.Active=false then
    begin

    dmfacturador.dprincipal.CreateDataSet;
    dmfacturador.dprincipal.Active:=true;
    end;
    dmfacturador.dprincipal.Append;
    dmfacturador.dprincipalNOM_LARGO.AsString:=GPRODUCTO.Fields[3].AsString;
    dmfacturador.dprincipalCANTIDAD.AsInteger:=0;
    dmfacturador.dprincipalPRECIO.AsCurrency:=GPRODUCTO.Fields[6].AsCurrency;
    dmfacturador.dprincipalcod_alfabeta.AsString:=GPRODUCTO.Fields[0].AsString;
    dmfacturador.dprincipalcod_barraspri.AsString:=GPRODUCTO.Fields[2].AsString;
    dmfacturador.dprincipalNRO_troquel.AsString:=GPRODUCTO.Fields[1].AsString;
    dmfacturador.dprincipalcod_iva.AsString:=GPRODUCTO.Fields[4].AsString;
    dmfacturador.dprincipalPrecio_Total.AsFloat:=dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat;
    dmfacturador.dprincipalDESCUENTOS.AsFloat:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((GPRODUCTO.Fields[7].AsFLOAT)/100);
    descuento:=0;

    descuento:=gproducto.Fields[10].AsFloat+gproducto.Fields[11].AsFloat+gproducto.Fields[12].AsFloat;
    if descuento>100 then
    begin
    descuento:=100;
    end;
    dmfacturador.dprincipalporcentaje.AsFloat:=descuento;


    dmfacturador.dprincipalprecio_totaldesc.AsFloat:=dmfacturador.DPRINCIPALprecio_total.AsFloat-dmfacturador.dprincipaldescuentos.AsFloat;
    dmfacturador.DPRINCIPALPORCENTAJEOS.AsFloat:=gproducto.Fields[10].AsFloat;
    dmfacturador.DPRINCIPALPORCENTAJEco1.AsFloat:=gproducto.Fields[11].AsFloat;
    dmfacturador.DPRINCIPALPORCENTAJEco2.AsFloat:=gproducto.Fields[12].AsFloat;
    dmfacturador.dprincipalDESCUENTOSOS.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[11].AsFLOAT)/100);
    dmfacturador.dprincipalDESCUENTOco1.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[12].AsFLOAT)/100);
    dmfacturador.dprincipalDESCUENTOco2.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[13].AsFLOAT)/100);
    dmfacturador.DPRINCIPALCOD_LABORATORIO.AsString:=gproducto.Fields[13].AsSTRING;
    dmfacturador.DPRINCIPALcan_stk.Asinteger:=gproducto.Fields[5].Asinteger;
    dmfacturador.dprincipal.Post;
    dmfacturador.dsecundario.Close;
    ebusqueda.Clear;
    gfacturador.SetFocus;

    gfacturador.Selectedindex:=3;
    gfacturador.EditorMode:=true;
    dmfacturador.dprincipal.edit;
    dmfacturador.dprincipalCANTIDAD.Clear;




    if gfacturador.DataSource.DataSet.RecordCount>0 then
    begin
    imprimir.Enabled:=true;
    bvale.Enabled:=true;
    bprecio.Enabled:=true;
    end;
    if codigo_validador<>'' then
    begin
    bvalidar.Enabled:=true;
    end;
    if codigo_validador='' then
    begin
    bvalidar.Enabled:=false;
    end;
    bagregar.Enabled:=false;
    bstockonline.Enabled:=false;

    end; }
end;

procedure TFfacturador.bagregarmedicoClick(Sender: TObject);
begin
   if (ECO1MATRICULA.Text = '') and (eco1nombremedico.Text = '')
    and (ECO1apellidoMEDICO.Text = '') then
    begin
      esMedicoValido:= true;
      exit;
    end;


   guardarMedico(eco1,ECO1MATRICULA,eco1nombremedico,ECO1apellidoMEDICO);
end;



procedure TFfacturador.bagregarmedicoco2Click(Sender: TObject);
var
   medico:TMedico;
begin
 if (ECO1MATRICULA.Text = '') and (eco1nombremedico.Text = '')
    and (ECO1apellidoMEDICO.Text = '') then
    begin
      esMedicoValido:= true;
      exit;
    end;


   guardarMedico(eco2,ECO2MATRICULA,eco2mediconombre,eco2medicoapellido);
end;

procedure TFfacturador.blimpiarco1Click(Sender: TObject);
begin

  Eco1.Text := '';
  ECO1AFILIADO.Text := '';
  eco1nombre.Text := '';
  eco1apellido.Text := '';
  ECO1MATRICULA.Text := '';
  eco1apellidomedico.Text := '';
  eco1nombremedico.Text := '';

  eco1receta.Text := '';
  BVALIDAR.Enabled := false;

end;

procedure TFfacturador.blimpiarco2Click(Sender: TObject);
begin

  Eco2.Text := '';
  eco2afiliado.Text := '';
  eco2nombre.Text := '';
  eco2apellido.Text := '';
  eco2matricula.Text := '';
  eco2medicoapellido.Text := '';
  eco2mediconombre.Text := '';

  eco2receta.Text := '';
  BVALIDAR.Enabled := false;

end;

procedure TFfacturador.BlimpiartodoClick(Sender: TObject);
begin
  if dmFacturador.DPRINCIPAL.Active = true then
  begin
    dmFacturador.DPRINCIPAL.EmptyDataSet;
  end;
  if dmFacturador.dsecundario.Active = true then
  begin
    dmFacturador.dsecundario.Close;
  end;

  ebusqueda.Clear;
  Evendedor.Clear;
  eosmedicoapellido.Color := clWhite;
  eosmedicoNombre.Color := clWhite;

  pgCoberturas.TabIndex := 0;
  blimpiar.Click;
  pgCoberturas.TabIndex := 1;
  blimpiarco1.Click;
  pgCoberturas.TabIndex := 2;
  blimpiarco2.Click;
  pgCoberturas.TabIndex := 0;
  bprecio.Enabled := false;
  bvale.Enabled := false;
  BVALIDAR.Enabled := false;
  imprimir.Enabled := false;
  DESCOBER.Enabled := false;
  bstockonline.Enabled := false;
  bdetalle.Enabled := false;
  combotipo.ItemIndex := 0;
  Rbusqueda.ItemIndex := 0;

  limpiarunidadticket;
  pgCoberturas.ActivePageIndex := 0;
  dtfecreceta.DateTime := now;
  pgCoberturas.ActivePageIndex := 1;
  dtfeccoseguro.DateTime := now;
  pgCoberturas.ActivePageIndex := 0;
  panel1.Enabled := true;
  combotipo.Enabled := true;
  combotipo.SetFocus;
  ffacturador.fccredencial:='';
  ffacturador.fcsaldo:='';
  ffacturador.fcfarmacoin:='';
  ticket.TIENEAPLUS:='N';
  if Ticket.modif <> nil then
  begin
    Ticket.modif.Clear;
  end;
  // evendedor.SetFocus;
end;

procedure TFfacturador.bprecioClick(Sender: TObject);
var
  form: tfmodificacion;
  form2: tfpass;
  modificado: TTicketmodif;

begin


  if NOT((Ticket.codigo_OS = 'PAM') OR (Ticket.codigo_OS = 'Z96') OR
    (Ticket.codigo_OS = 'EW2') OR (Ticket.codigo_OS = 'EWC') OR
    (Ticket.codigo_OS = 'EW7') OR (Ticket.codigo_OS = 'Z97') OR
    (Ticket.codigo_OS = 'Z98')) then
  BEGIN
    Ticket.autorizado := 'N';
    Ticket.jerarquia := '';
    form2 := tfpass.Create(SELF);

    form2.SetTicket(Ticket);
    form2.ShowModal;

    if NOT(Ticket.codigo_OS = 'PAM') then
    BEGIN

      if Ticket.autorizado = 'S' THEN
      BEGIN
        if Ticket.jerarquia = '0' then
        begin
          dmFacturador.DPRINCIPAL.Edit;
          dmFacturador.DPRINCIPALModificado.AsBoolean := true;
          Gfacturador.Columns.Items[2].ReadOnly := false;
          Gfacturador.SetFocus;
          Gfacturador.Selectedindex := 2;
          Gfacturador.EditorMode := true;
          /// /////////////////////////////////////////////////////////////////

          if (Ticket.modif = nil) then
          Begin
            Ticket.modif := tlist.Create;
          End;

          modificado := TTicketmodif.Create;
          modificado.nro_item := Gfacturador.Fields[26].Asinteger;
          modificado.nombre_largo := Gfacturador.Fields[1].AsString;
          modificado.precio_viejo := Gfacturador.Fields[2].AsString;
          modificado.precio_nuevo := '';
          modificado.vendedor := Ticket.nom_vendedor;
          modificado.nro_comprobante := '';
          modificado.cod_alfabeta := Gfacturador.Fields[8].AsString;

          Ticket.modif.Add(modificado);

          // archivomod;
        end;
        if Ticket.jerarquia <> '0' then
        begin
          showmessage('NO AUTORIZADO');
        end;
        if Ticket.autorizado = 'N' then
        BEGIN
          Gfacturador.Columns.Items[2].ReadOnly := true;
          ebusqueda.SetFocus;
        END;
      END;

    END;
  END;
  if ((Ticket.codigo_OS = 'PAM') OR (Ticket.codigo_OS = 'Z96') OR
    (Ticket.codigo_OS = 'EW2') OR (Ticket.codigo_OS = 'EWC') OR
    (Ticket.codigo_OS = 'EW7') OR (Ticket.codigo_OS = 'Z97') OR
    (Ticket.codigo_OS = 'Z98')) then
  BEGIN
    dmFacturador.DPRINCIPAL.Edit;
    dmFacturador.DPRINCIPALModificado.AsBoolean := true;
    Gfacturador.Columns.Items[2].ReadOnly := false;
    Gfacturador.SetFocus;
    Gfacturador.Selectedindex := 2;
    Gfacturador.EditorMode := true;
  END;

end;

procedure TFfacturador.bstockonlineClick(Sender: TObject);
var
  form: tfstock;

begin

  form := tfstock.Create(SELF);
  form.SetTicket(Ticket);
  Ticket.alfabetastock := Gfacturador.Fields[8].AsString;
  Ticket.nombrestock := Gfacturador.Fields[1].AsString;
  form.ShowModal;

end;

procedure TFfacturador.btnRecargosClick(Sender: TObject);
var
frmRecargo:TFrmRecargo;
begin
    ebusqueda.Clear;
    frmRecargo:= TFrmRecargo.Create(SELF);
    frmRecargo.ShowModal;

    if not Gfacturador.DataSource.DataSet.IsEmpty then
      begin
        ebusqueda.Clear;
        if Ffacturador.Gfacturador.DataSource.DataSet.RecordCount > 0 then
        begin
          imprimir.Enabled := true;
        end;
        ebusqueda.SetFocus;
    end;




end;

procedure TFfacturador.bmodificableClick(Sender: TObject);
var
  form: tfproductosd;
  form1: tfmodificacion;
  form2: tfpass;
begin
  Ticket.autorizado := 'N';
  Ticket.jerarquia := '';
  form2 := tfpass.Create(SELF);

  form2.SetTicket(Ticket);
  form2.ShowModal;
  if Ticket.autorizado = 'S' THEN
  BEGIN
    if Ticket.jerarquia = '0' then
    begin

      form := tfproductosd.Create(SELF);
      form.ShowModal;

      if not Gfacturador.DataSource.DataSet.IsEmpty then
      begin
        ebusqueda.Clear;
        if Ffacturador.Gfacturador.DataSource.DataSet.RecordCount > 0 then
        begin
          imprimir.Enabled := true;
          bvale.Enabled := true;
          bprecio.Enabled := true;
        end;
        if codigo_validador <> '' then
        begin
          BVALIDAR.Enabled := true;
        end;
        if codigo_validador = '' then
        begin
          BVALIDAR.Enabled := false;
        end;
        ebusqueda.SetFocus;
      end;
    end;
    if Ticket.jerarquia <> '0' then
    begin
      showmessage('NO AUTORIZADO');
    end;

  end;

  if Ticket.autorizado = 'N' then
  BEGIN
    ebusqueda.SetFocus;
  END;

end;

procedure TFfacturador.bvaleClick(Sender: TObject);
var
  form: tfvale;
  Key: Char;
  registrogrilla: Integer;
begin
  if not Gfacturador.DataSource.DataSet.IsEmpty then
  begin
    Key := #13;
    Gfacturador.OnKeyPress(SELF, Key);
  end;
  dmFacturador.DPRINCIPAL.Edit;

  Ticket.valecantidadmax := dmFacturador.DPRINCIPALCANTIDAD.AsString;

  form := tfvale.Create(SELF);
  form.SetTicket(Ticket);
  form.ShowModal;
  registrogrilla := Gfacturador.DataSource.DataSet.RecNo;
  if Ticket.valecantidad <> '' then
  begin
    dmFacturador.DPRINCIPALcan_vale.AsString := Ticket.valecantidad;
    dmFacturador.DPRINCIPALvale.AsString := 'SI';
    Ticket.llevavale := 'SI';
  end;

  { if dmfacturador.DPRINCIPALcan_vale.AsInteger>dmfacturador.DPRINCIPALCANTIDAD.AsInteger then
    begin
    dmfacturador.DPRINCIPALcantidad.Asinteger:=dmfacturador.DPRINCIPALcan_vale.AsInteger;
    end; }

  ebusqueda.SetFocus;

end;

procedure TFfacturador.BVALIDARClick(Sender: TObject);

var
  form: tfvalida;

  i: Integer;
  itemsval: TTicketItemval;
  Key: Char;
BEGIN
  BVALIDAR.Enabled := false;
  Key := #13;

  Gfacturador.OnKeyPress(SELF, Key);
  form := tfvalida.Create(SELF);
  leerTicket;
  form.SetTicket(Ticket);

  form.ShowModal;
  Ticket.valcodigorespuesta := inttostr(strtoint(Ticket.valcodigorespuesta));
  Gfacturador.DataSource.DataSet.First;

  while not Gfacturador.DataSource.DataSet.Eof do
  begin

    if (Ticket.valcodigorespuesta = '0') OR (Ticket.valcodigorespuesta = '00')
    then
    begin
      if Ticket.codigo_validador <> 'G' then
      BEGIN
        if Ticket.codigo_validador <> 'M' then
        BEGIN
          if Ticket.codigo_validador = 'O' then
          BEGIN

          END;
          if Ticket.codigo_validador <> 'O' then
          BEGIN
            for i := 0 to Ticket.itemsval.Count - 1 do
            begin
              itemsval := Ticket.itemsval[i];
              if strtoint(itemsval.cod_troquelVAL)
                = strtoint(Gfacturador.Fields[0].AsString) then
              begin
                dmFacturador.DPRINCIPAL.Edit;
                if itemsval.importe_unitarioval <> '' then
                begin

                  if strtocurr(itemsval.importe_unitarioval) <> 0 then
                  begin
                    dmFacturador.dprincipalPRECIO.AsCurrency :=
                      strtocurr(itemsval.importe_unitarioval);
                  end;
                  if itemsval.porcentaje_coberturaVAL <> '' then
                  begin
                    dmFacturador.DPRINCIPALPORCENTAJEOS.Asinteger :=
                      trunc(strtofloat(itemsval.porcentaje_coberturaVAL));
                  end;

                  dmFacturador.DPRINCIPALCANTIDAD.Asinteger :=
                    strtoint(itemsval.cantidadaprobada);

                  IF itemsval.codautorizacion <> '' THEN
                  BEGIN
                    dmFacturador.dprincipalCODAUTORIZACION.AsString :=
                      itemsval.codautorizacion;

                  END;
                end;
                if (itemsval.importe_unitarioval = '') or
                  (itemsval.importe_unitarioval = '0') then
                begin
                  dmFacturador.DPRINCIPALPORCENTAJEOS.Asinteger := 0;
                end;

                if dmFacturador.DPRINCIPALPORCENTAJEOS.Asinteger = 0 then
                begin
                  dmFacturador.DPRINCIPAL.Delete;

                end;

              end;
            end;

            // gfacturador.OnKeyPress(self,key);
            // gfacturador.DataSource.DataSet.Next;
          end;
        END;
      END;
      if Ticket.codigo_validador = 'G' then
      BEGIN
        for i := 0 to Ticket.itemsval.Count - 1 do
        begin
          itemsval := Ticket.itemsval[i];
          if itemsval.cod_troquelVAL = Gfacturador.Fields[0].AsString then
          begin
            if (itemsval.cod_rta = '0') or (itemsval.cod_rta = '00') then
            begin
              dmFacturador.DPRINCIPAL.Edit;
              if strtocurr(itemsval.importe_unitarioval) <> 0 then
              begin
                dmFacturador.dprincipalPRECIO.AsCurrency :=
                  strtocurr(itemsval.importe_unitarioval);
              end;
              // SetRoundMode(rmNearest);

              // dmfacturador.DPRINCIPALPORCENTAJEOS.AsInteger:=round((strtofloat(ITEMSVAL.importe_coberturaVAL)*100)/strtofloat(ITEMSVAL.importe_unitarioVAL));
              dmFacturador.DPRINCIPALPORCENTAJEOS.Asfloat :=
                ((strtofloat(itemsval.importe_coberturaVAL) * 100) /
                strtofloat(itemsval.importe_unitarioval));
              dmFacturador.DPRINCIPALCANTIDAD.Asinteger :=
                strtoint(itemsval.cantidadVAl);
            end;
            if itemsval.importe_unitarioval = '' then
            begin
              dmFacturador.DPRINCIPALPORCENTAJEOS.Asinteger := 0;
            end;

            if dmFacturador.DPRINCIPALPORCENTAJEOS.Asinteger = 0 then
            begin
              dmFacturador.DPRINCIPAL.Delete;
            end;
            if (itemsval.cod_rta <> '00') then
            begin
              dmFacturador.DPRINCIPAL.Delete;
            end;
          end;

        end;
      END;
      if Ticket.codigo_validador = 'M' then
      BEGIN

        for i := 0 to Ticket.itemsval.Count - 1 do
        begin
          itemsval := Ticket.itemsval[i];
          if itemsval.cod_troquelVAL = Gfacturador.Fields[0].AsString then
          begin
            if (itemsval.cod_rta = '0') or (itemsval.cod_rta = '00') then
            begin
              dmFacturador.DPRINCIPAL.Edit;
              if strtocurr(itemsval.importe_unitarioval) <> 0 then
              begin
                dmFacturador.dprincipalPRECIO.AsCurrency :=
                  strtocurr(itemsval.importe_unitarioval);
              end;
              // SetRoundMode(rmNearest);

              // dmfacturador.DPRINCIPALPORCENTAJEOS.AsInteger:=round((strtofloat(ITEMSVAL.importe_coberturaVAL)*100)/strtofloat(ITEMSVAL.importe_unitarioVAL));
              dmFacturador.DPRINCIPALPORCENTAJEOS.Asfloat :=
                ((strtofloat(itemsval.importe_coberturaVAL) * 100) /
                strtofloat(itemsval.importe_unitarioval));
              dmFacturador.DPRINCIPALCANTIDAD.Asinteger :=
                strtoint(itemsval.cantidadVAl);
            end;
            if itemsval.importe_unitarioval = '' then
            begin
              dmFacturador.DPRINCIPALPORCENTAJEOS.Asinteger := 0;
            end;

            if dmFacturador.DPRINCIPALPORCENTAJEOS.Asinteger = 0 then
            begin
              dmFacturador.DPRINCIPAL.Delete;
            end;
            if (itemsval.cod_rta <> '00') then
            begin
              dmFacturador.DPRINCIPAL.Delete;
            end;
          end;

        end;
      END;
    end;
    if (Ticket.valcodigorespuesta <> '0') then
    begin
      dmFacturador.DPRINCIPAL.Edit;
      dmFacturador.DPRINCIPALPORCENTAJEOS.Asinteger := 0;

    end;

    Gfacturador.OnKeyPress(SELF, Key);
    Gfacturador.DataSource.DataSet.Next;

  end;
  Gfacturador.Focused;
  form.DisposeOf;

  BVALIDAR.Enabled := true;

end;

procedure TFfacturador.bValidaReElecClick(Sender: TObject);
var
  itemValidacion:TTicketItemVAL;
  i,Cantidad:integer;
  key:char;
  fRecetaElec:TFrecetaElectronica;

  PrecioUnitario, ImporteCobertura, PrecioTotal, Descuentos, PrecioTotalDesc, PorcentajeCobertura: Double;
begin

  if ((eosreceta.Text <> '')and (eos.Text='PAM')) then
  begin
     fRecetaElec:=TFrecetaElectronica.Create(self);
     ticket.medico_nombre:=EOSMEDICONOMBRE.Text;
     ticket.medico_apellido:=EOSMEDICONOMBRE.Text;
     ticket.medico_nro_matricula:=Eosmatricula.Text;
     ticket.medico_tipo_matricula:=Cosprovincia.Text;
     fRecetaElec.setTicket(ticket);

     frecetaelec.showmodal;
  end;




  
   if Gfacturador.DataSource.DataSet.RecordCount > 0 then
          begin
            imprimir.Enabled := true;
            bvale.Enabled := true;
            bprecio.Enabled := true;
            bstockonline.Enabled := true;
            bdetalle.Enabled := true;
          end;
          if codigo_validador <> '' then
          begin
            BVALIDAR.Enabled := true;
          end;
          if codigo_validador = '' then
          begin
            BVALIDAR.Enabled := false;
          end;
    dtfecreceta.SetFocus;

end;

procedure TFfacturador.combotipoExit(Sender: TObject);
begin
  combotipo.Enabled := false;
end;

procedure TFfacturador.combotipoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Evendedor.SetFocus;
  end;
end;


procedure TFfacturador.CosprovinciaExit(Sender: TObject);
begin
  eosmedicoapellido.SetFocus;
end;

procedure TFfacturador.cosprovinciakeypress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
  begin
    eosmedicoAPELLIDO.SetFocus;
    Exit;
  end;
end;

procedure TFfacturador.CosprovinciaSelect(Sender: TObject);
begin
  cosprovincia.Color := clmoneygreen;
  activecontrol := pgcoberturas;

  if Eosmatricula.Text = '' then
  begin
   Eosmatricula.SetFocus;
   Exit;
  end ;



  eosmedicoapellido.SetFocus;
end;

procedure TFfacturador.dbcombotipoExit(Sender: TObject);
begin
  if combotipo.Text = '' then
  begin
    Evendedor.Enabled := false;
    ebusqueda.Enabled := false;
  end;
  if combotipo.Text <> '' then
  begin
    Evendedor.Enabled := true;
    ebusqueda.Enabled := true;
  end;

end;

procedure TFfacturador.blimpiarClick(Sender: TObject);
begin
  {Eos.Text := '';
  eafiliado.Text := '';
  eosnombre.Text := '';
  eosapellido.Text := '';
  Eosmatricula.Text := '';
  eosmedicoAPELLIDO.Text := '';
  EOSMEDICONOMBRE.Text := '';

  eosreceta.Text := '';

  BVALIDAR.Enabled := false;}

  Eos.clear;
  eafiliado.Clear;
  eosnombre.Color := clwhite;
  eosnombre.clear;
  eosapellido.Color := clwhite;
  eosapellido.clear;
  eosmatricula.Color := clwhite;
  Eosmatricula.clear;
  eosmedicoAPELLIDO.clear;
  EOSMEDICONOMBRE.clear;
  Cosprovincia.ItemIndex := strtoint(Ticket.region);
  lblDatosMedico.Visible := false;
  eosreceta.clear;

  BVALIDAR.Enabled := false;

end;

procedure TFfacturador.bbuscarClick(Sender: TObject);
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
  form2: tfdrogas;
  form4: tfdescripciondroga;
  r1descuento: double;
begin
  form := tfprogreso.Create(SELF);
  form.Show;
  application.ProcessMessages;
  dmFacturador.dsecundario.Close;
  // ------------------------------------------------busqueda por descripcion/codigo troquel/ barras--------------------------------/ /
  if Rbusqueda.ItemIndex = 0 then
  begin
    dmFacturador.AbrirConexion();

    if Length(ebusqueda.Text) > 0 then
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

       DMFACTURADOR.qbusqueda.SQL.SaveToFile('SQL.TXT');
      if TextToFloat(PChar(ebusqueda.Text), Valor, fvExtended) then
      begin
        dmFacturador.qbusqueda.ParamByName('barras').AsString := ebusqueda.Text;
      end;
      if tryStrToInt(ebusqueda.Text, value) then
      begin
        dmFacturador.qbusqueda.ParamByName('troquel').Asinteger := value;
      end;
      dmFacturador.qbusqueda.ParamByName('sucursal').AsString :=
        dmFacturador.getSucursal();
      if not TextToFloat(PChar(ebusqueda.Text), Valor, fvExtended) then
      begin
        espacios := StringReplace(ebusqueda.Text, ' ', '%', [rfReplaceAll]);
        dmFacturador.qbusqueda.ParamByName('nombre').AsString :=
          '%' + espacios + '%';
      end;
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

          precio;
          dmFacturador.dSECUNDARIOhosp.AsString:='N';
          //----------------MODIFICADO 08/11/2022------------------------------//
          if (TICKET.codigo_OS='ZBI') OR (TICKET.codigo_OS='ZBH') OR (TICKET.codigo_OS='ZA7')  OR (TICKET.codigo_OS='W14') OR (TICKET.codigo_OS='WVP') OR (TICKET.codigo_OS='WVR') OR (TICKET.codigo_OS='W15') OR (TICKET.codigo_OS='WVJ') OR (TICKET.codigo_OS='WVM') OR (TICKET.codigo_OS='WVD') OR (TICKET.codigo_OS='WVO') OR (TICKET.codigo_OS='WVG') OR (TICKET.codigo_OS='WVF') OR (TICKET.codigo_OS='WVH') OR (TICKET.codigo_OS='WVN') OR (TICKET.codigo_OS='WVE') OR (TICKET.codigo_OS='ZAE') OR (TICKET.codigo_OS='ZAF') OR (TICKET.codigo_OS='ZAG') OR (TICKET.codigo_OS='ZAI') OR (TICKET.codigo_OS='ZAL') OR (TICKET.codigo_OS='ZAM') OR (TICKET.codigo_OS='ZAN') OR (TICKET.codigo_OS='ZAO') OR (TICKET.codigo_OS='OFL') OR (TICKET.codigo_OS='OFN') OR (TICKET.codigo_OS='OFM') OR (TICKET.codigo_OS='OFK') OR (TICKET.codigo_OS='OFJ') OR (TICKET.codigo_OS='ZA2') OR (TICKET.codigo_OS='ZA3')   then
          BEGIN
          dmFacturador.dsecundarioprecio.AsString :=floattostr(preciocalculado*porcentajeAumentoHosp);
          dmFacturador.dSECUNDARIOhosp.AsString:='S';
          END;

          if (ticket.codigo_Co1='ZBI') OR (ticket.codigo_Co1='ZBH') OR (ticket.codigo_Co1='ZA7')  OR (ticket.codigo_Co1='W14') OR (ticket.codigo_Co1='WVP') OR (ticket.codigo_Co1='WVR') OR (ticket.codigo_Co1='W15') OR (ticket.codigo_Co1='WVJ') OR (ticket.codigo_Co1='WVM') OR (ticket.codigo_Co1='WVD') OR (ticket.codigo_Co1='WVO') OR (ticket.codigo_Co1='WVG') OR (ticket.codigo_Co1='WVF') OR (ticket.codigo_Co1='WVH') OR (ticket.codigo_Co1='WVN') OR (ticket.codigo_Co1='WVE') OR (ticket.codigo_Co1='ZAE') OR (ticket.codigo_Co1='ZAF') OR (ticket.codigo_Co1='ZAG') OR (ticket.codigo_Co1='ZAI') OR (ticket.codigo_Co1='ZAL') OR (ticket.codigo_Co1='ZAM') OR (ticket.codigo_Co1='ZAN') OR (ticket.codigo_Co1='ZAO') OR (ticket.codigo_Co1='OFL') OR (ticket.codigo_Co1='OFN') OR (ticket.codigo_Co1='OFM') OR (ticket.codigo_Co1='OFK') OR (ticket.codigo_Co1='OFJ') OR (ticket.codigo_Co1='ZA2') OR (ticket.codigo_Co1='ZA3')   then
          BEGIN
          dmFacturador.dsecundarioprecio.AsString :=floattostr(preciocalculado*porcentajeAumentoHosp);
          dmFacturador.dSECUNDARIOhosp.AsString:='S';
          END;

          if (ticket.codigo_Cos2='ZBI') OR (ticket.codigo_Cos2='ZBH') OR (ticket.codigo_Cos2='ZA7')  OR (ticket.codigo_Cos2='W14') OR (ticket.codigo_Cos2='WVP') OR (ticket.codigo_Cos2='WVR') OR (ticket.codigo_Cos2='W15') OR (ticket.codigo_Cos2='WVJ') OR (ticket.codigo_Cos2='WVM') OR (ticket.codigo_Cos2='WVD') OR (ticket.codigo_Cos2='WVO') OR (ticket.codigo_Cos2='WVG') OR (ticket.codigo_Cos2='WVF') OR (ticket.codigo_Cos2='WVH') OR (ticket.codigo_Cos2='WVN') OR (ticket.codigo_Cos2='WVE') OR (ticket.codigo_Cos2='ZAE') OR (ticket.codigo_Cos2='ZAF') OR (ticket.codigo_Cos2='ZAG') OR (ticket.codigo_Cos2='ZAI') OR (ticket.codigo_Cos2='ZAL') OR (ticket.codigo_Cos2='ZAM') OR (ticket.codigo_Cos2='ZAN') OR (ticket.codigo_Cos2='ZAO') OR (ticket.codigo_Cos2='OFL') OR (ticket.codigo_Cos2='OFN') OR (ticket.codigo_Cos2='OFM') OR (ticket.codigo_Cos2='OFK') OR (ticket.codigo_Cos2='OFJ') OR (ticket.codigo_Cos2='ZA2') OR (ticket.codigo_Cos2='ZA3')   then
          BEGIN
          dmFacturador.dsecundarioprecio.AsString :=floattostr(preciocalculado*porcentajeAumentoHosp);
          dmFacturador.dSECUNDARIOhosp.AsString:='S';
          END;

          if NOT ((TICKET.codigo_OS='ZBI') OR (TICKET.codigo_OS='ZBH') OR (TICKET.codigo_OS='ZA7')  OR (TICKET.codigo_OS='W14') OR (TICKET.codigo_OS='WVP') OR (TICKET.codigo_OS='WVR') OR (TICKET.codigo_OS='W15') OR (TICKET.codigo_OS='WVJ') OR (TICKET.codigo_OS='WVM') OR (TICKET.codigo_OS='WVD') OR (TICKET.codigo_OS='WVO') OR (TICKET.codigo_OS='WVG') OR (TICKET.codigo_OS='WVF') OR (TICKET.codigo_OS='WVH') OR (TICKET.codigo_OS='WVN') OR (TICKET.codigo_OS='WVE') OR (TICKET.codigo_OS='ZAE') OR (TICKET.codigo_OS='ZAF') OR (TICKET.codigo_OS='ZAG') OR (TICKET.codigo_OS='ZAI') OR (TICKET.codigo_OS='ZAL') OR (TICKET.codigo_OS='ZAM') OR (TICKET.codigo_OS='ZAN') OR (TICKET.codigo_OS='ZAO') OR (TICKET.codigo_OS='OFL') OR (TICKET.codigo_OS='OFN') OR (TICKET.codigo_OS='OFM') OR (TICKET.codigo_OS='OFK') OR (TICKET.codigo_OS='OFJ') OR (TICKET.codigo_OS='ZA2') OR (TICKET.codigo_OS='ZA3')  ) then
          BEGIN
          if not ((ticket.codigo_Co1='ZBI') OR (ticket.codigo_Co1='ZBH') OR (ticket.codigo_Co1='ZA7')  OR (ticket.codigo_Co1='W14') OR (ticket.codigo_Co1='WVP') OR (ticket.codigo_Co1='WVR') OR (ticket.codigo_Co1='W15') OR (ticket.codigo_Co1='WVJ') OR (ticket.codigo_Co1='WVM') OR (ticket.codigo_Co1='WVD') OR (ticket.codigo_Co1='WVO') OR (ticket.codigo_Co1='WVG') OR (ticket.codigo_Co1='WVF') OR (ticket.codigo_Co1='WVH') OR (ticket.codigo_Co1='WVN') OR (ticket.codigo_Co1='WVE') OR (ticket.codigo_Co1='ZAE') OR (ticket.codigo_Co1='ZAF') OR (ticket.codigo_Co1='ZAG') OR (ticket.codigo_Co1='ZAI') OR (ticket.codigo_Co1='ZAL') OR (ticket.codigo_Co1='ZAM') OR (ticket.codigo_Co1='ZAN') OR (ticket.codigo_Co1='ZAO') OR (ticket.codigo_Co1='OFL') OR (ticket.codigo_Co1='OFN') OR (ticket.codigo_Co1='OFM') OR (ticket.codigo_Co1='OFK') OR (ticket.codigo_Co1='OFJ') OR (ticket.codigo_Co1='ZA2') OR (ticket.codigo_Co1='ZA3'))   then
            BEGIN
            if not ((ticket.codigo_Cos2='ZBI') OR (ticket.codigo_Cos2='ZBH') OR (ticket.codigo_Cos2='ZA7')  OR (ticket.codigo_Cos2='W14') OR (ticket.codigo_Cos2='WVP') OR (ticket.codigo_Cos2='WVR') OR (ticket.codigo_Cos2='W15') OR (ticket.codigo_Cos2='WVJ') OR (ticket.codigo_Cos2='WVM') OR (ticket.codigo_Cos2='WVD') OR (ticket.codigo_Cos2='WVO') OR (ticket.codigo_Cos2='WVG') OR (ticket.codigo_Cos2='WVF') OR (ticket.codigo_Cos2='WVH') OR (ticket.codigo_Cos2='WVN') OR (ticket.codigo_Cos2='WVE') OR (ticket.codigo_Cos2='ZAE') OR (ticket.codigo_Cos2='ZAF') OR (ticket.codigo_Cos2='ZAG') OR (ticket.codigo_Cos2='ZAI') OR (ticket.codigo_Cos2='ZAL') OR (ticket.codigo_Cos2='ZAM') OR (ticket.codigo_Cos2='ZAN') OR (ticket.codigo_Cos2='ZAO') OR (ticket.codigo_Cos2='OFL') OR (ticket.codigo_Cos2='OFN') OR (ticket.codigo_Cos2='OFM') OR (ticket.codigo_Cos2='OFK') OR (ticket.codigo_Cos2='OFJ') OR (ticket.codigo_Cos2='ZA2') OR (ticket.codigo_Cos2='ZA3')) then
              begin

              dmFacturador.dsecundarioprecio.AsString :=floattostr(preciocalculado);
              dmFacturador.dSECUNDARIOhosp.AsString:='N';
              end;
            END;
          END;

          //-----------AUMENTO A LOS HOSPITALES----------------------//
          // dmfacturador.dsecundarioprecio.AsString:=dmfacturador.qbusqueda.FieldByName('precio').AsString;
          /// ------------------------si los campos de os no estan vacios--------------------------///
          if ((los.Text <> '') or (lco1.Text <> '') or (lco2.Text <> '')) then
          begin
            descuento := CalcularDescuento(Ticket.sucursal,
              (dmFacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString),
              Eos.Text, Eco1.Text, Eco2.Text, eafiliado.Text, ECO1AFILIADO.Text,
              eco2afiliado.Text,
              (dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString));
              marTipoDescCo1:= descuento.mar_cos1;
              marTipoDescCo2:= descuento.mar_cos2;

          end;

          /// -------------------------calculo de descuento preliminar--------------------------------//
          if ((los.Text <> '') or (lco1.Text <> '') or (lco2.Text <> '')) then
          begin
            dmFacturador.dsecundariodescuento.Asfloat :=
              (descuento.getDescuentotal);
            if (descuento.getDescuentotal) > 0 then
            begin
              dmFacturador.dsecundarioPRECIO_TOTAL.Asfloat :=
                dmFacturador.dsecundarioprecio.Asfloat *
                ((descuento.getDescuentotal) / 100);
            end;
          end;
          if dmFacturador.dsecundariodescuento.IsNull then
          begin
            dmFacturador.dsecundariodescuento.Asfloat := 0;
          end;

          dmFacturador.dsecundarioPRECIO_TOTAL.Asfloat :=
            dmFacturador.dsecundarioprecio.Asfloat;

          dmFacturador.dsecundarioRUBRO.AsString :=
            dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString;

          if los.Text <> '' then
          begin
            dmFacturador.dsecundarioDESCUENTOOS.Asfloat := descuento.Porc_os;
            cobOS := descuento.Porc_os;
          end;
          if los.Text = '' then
          begin
            dmFacturador.dsecundarioDESCUENTOOS.Asfloat := 0;
          end;

          if lco1.Text <> '' then
          begin
            cobCos1 := descuento.porc_coseguro;
            if cobCos1 + cobOS > 100 then
            BEGIN
              cobCos1 := 100 - cobOS;
              if cobCos1 < 0 then
              begin
                cobCos1 := 0;
              end;
            END;
          end;
          if (lco1.Text <> '') and (lco2.Text <> '') then
          begin
            cobCos1 := descuento.porc_coseguro;
            cobcos2 := descuento.porc_coseguro2;
            if cobcos2 + cobCos1 + cobOS > 100 then
            BEGIN
              cobcos2 := 100 - cobOS - cobCos1;
              if cobcos2 < 0 then
              begin
                cobcos2 := 0;
              end;
              cobCos1 := 100 - cobOS - cobcos2;
            END;
          end;

          if lco1.Text <> '' then
          begin
            dmFacturador.dsecundarioDescuentoco1.Asfloat := cobCos1;
          end;
          if lco1.Text = '' then
          begin
            dmFacturador.dsecundarioDescuentoco1.Asfloat := 0;
          end;
          if lco2.Text <> '' then
          begin
            cobcos2 := descuento.porc_coseguro2;
            if cobOS + cobCos1 + cobcos2 > 100 then
            BEGIN
              cobcos2 := 100 - cobOS - cobCos1;
              if cobcos2 < 0 then
              begin
                cobcos2 := 0;
              end;
            END;
          end;

          if lco2.Text <> '' then
          begin
            dmFacturador.dsecundarioDESCUENTOCO2.Asfloat := cobcos2;
          end;
          if lco2.Text = '' then
          begin
            dmFacturador.dsecundarioDESCUENTOCO2.Asfloat := 0;
          end;
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

          if dmFacturador.DPRINCIPAL.Active = false then
          begin

            dmFacturador.DPRINCIPAL.CreateDataSet;
            dmFacturador.DPRINCIPAL.Active := true;
          end;
          dmFacturador.DPRINCIPAL.Append;
          dmFacturador.dprincipalNOM_LARGO.AsString :=dmFacturador.dsecundarionom_largo.AsString;
          dmFacturador.DPRINCIPALCANTIDAD.Asinteger := 0;
          dmFacturador.dprincipalPRECIO.AsCurrency :=dmFacturador.dsecundarioprecio.AsCurrency;
          dmFacturador.dprincipalcod_alfabeta.AsString :=dmFacturador.dsecundariocod_alfabeta.AsString;
          dmFacturador.dprincipalcod_barraspri.AsString :=dmFacturador.dsecundariocod_barraspri.AsString;
          dmFacturador.dprincipalNRO_troquel.AsString :=dmFacturador.dsecundarionro_troquel.AsString;
          dmFacturador.dprincipalcod_iva.AsString :=dmFacturador.dsecundariocod_iva.AsString;
          dmFacturador.dprincipalPrecio_Total.Asfloat :=dmFacturador.DPRINCIPALCANTIDAD.Asfloat *dmFacturador.dprincipalPRECIO.Asfloat;
          dmFacturador.dprincipalDESCUENTOS.Asfloat :=(dmFacturador.DPRINCIPALCANTIDAD.Asfloat * dmFacturador.dprincipalPRECIO.Asfloat) *((dmFacturador.dsecundariodescuento.Asfloat / 100));
          r1descuento := 0;

          r1descuento := dmFacturador.dsecundarioDESCUENTOOS.Asfloat + dmFacturador.dsecundarioDescuentoco1.Asfloat + dmFacturador.dsecundarioDESCUENTOCO2.Asfloat;
          if r1descuento > 100 then
          begin
            r1descuento := 100;
          end;
          dmFacturador.dprincipalporcentaje.Asfloat := r1descuento;

          dmFacturador.dprincipalprecio_totaldesc.Asfloat := dmFacturador.dprincipalPrecio_Total.Asfloat - dmFacturador.dprincipalDESCUENTOS.Asfloat;
          dmFacturador.DPRINCIPALPORCENTAJEOS.Asfloat := dmFacturador.dsecundarioDESCUENTOOS.Asfloat;
          dmFacturador.DPRINCIPALPORCENTAJEco1.Asfloat :=dmFacturador.dsecundarioDescuentoco1.Asfloat;
          dmFacturador.DPRINCIPALPORCENTAJEco2.Asfloat :=dmFacturador.dsecundarioDESCUENTOCO2.Asfloat;
          dmFacturador.dprincipalDESCUENTOSOS.AsCurrency :=(dmFacturador.DPRINCIPALCANTIDAD.Asfloat * dmFacturador.dprincipalPRECIO.Asfloat) *((Gfacturador.Fields[11].Asfloat) / 100);
          {Aca deberia ir el cambio para SUTIAGA que dolor de huevos}
          dmFacturador.dprincipalDESCUENTOco1.AsCurrency := (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *dmFacturador.dprincipalPRECIO.Asfloat) *((Gfacturador.Fields[12].Asfloat) / 100);
          {Esta linea es la posible de modificar}

          dmFacturador.dprincipalDESCUENTOco2.AsCurrency := (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *dmFacturador.dprincipalPRECIO.Asfloat) *((Gfacturador.Fields[13].Asfloat) / 100);
          dmFacturador.DPRINCIPALCOD_LABORATORIO.AsString := dmFacturador.dsecundarioCod_laboratorio.AsString;
          dmFacturador.DPRINCIPALcan_stk.Asinteger :=dmFacturador.dsecundariocan_stk.Asinteger;
          dmFacturador.DPRINCIPALtamano.AsString := dmFacturador.qbusqueda.FieldByName('cod_tamano').AsString;
          dmFacturador.DPRINCIPALrubro.AsString :=dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString;
          dmFacturador.DPRINCIPALcan_vale.AsString := '0';
          dmFacturador.dprincipalhosp.AsString :=dmFacturador.dsecundariohosp.AsString;
          dmfacturador.DPRINCIPALPORCENTAJEAPLUS.AsFloat:=0;
          dmFacturador.DPRINCIPAL.Post;
          dmFacturador.dsecundario.Close;
          ebusqueda.Clear;
          Gfacturador.SetFocus;

          Gfacturador.Selectedindex := 3;
          Gfacturador.EditorMode := true;
          dmFacturador.DPRINCIPAL.Edit;
          dmFacturador.DPRINCIPALCANTIDAD.Clear;
          if Ffacturador.Gfacturador.DataSource.DataSet.RecordCount > 0 then
          begin
            imprimir.Enabled := true;
            bvale.Enabled := true;
            bprecio.Enabled := true;
            bstockonline.Enabled := true;
            bdetalle.Enabled := true;
          end;
          if codigo_validador <> '' then
          begin
            BVALIDAR.Enabled := true;
          end;
          if codigo_validador = '' then
          begin
            BVALIDAR.Enabled := false;
          end;
          Gfacturador.SetFocus;
        end;
      end;
      form.Close;
      if dmFacturador.qbusqueda.RecordCount > 1 then
      Begin
        form3 := tfbusquedaproductos.Create(SELF);
        form3.SetTicket(Ticket);
        form3.ShowModal;
        if not Gfacturador.DataSource.DataSet.IsEmpty then
        begin
          ebusqueda.Clear;
          Gfacturador.SetFocus;
          Gfacturador.Selectedindex := 3;
          Gfacturador.EditorMode := true;
          dmFacturador.DPRINCIPAL.Edit;
          dmFacturador.DPRINCIPALCANTIDAD.Clear;
          if Ffacturador.Gfacturador.DataSource.DataSet.RecordCount > 0 then
          begin
            imprimir.Enabled := true;
            bvale.Enabled := true;
            bprecio.Enabled := true;
            bstockonline.Enabled := true;
            bdetalle.Enabled := true;
          end;
          if codigo_validador <> '' then
          begin
            BVALIDAR.Enabled := true;
          end;
          if codigo_validador = '' then
          begin
            BVALIDAR.Enabled := false;
          end;
          Gfacturador.SetFocus;
        end;
      end;
    end;

  end;
  // ------------- DROGAS
  if Rbusqueda.ItemIndex = 1 then
  begin
    form.Close;
    Ticket.monodroga := '';
    dmFacturador.qdroga.SQL.Clear;
    dmFacturador.qdroga.Close;
    dmFacturador.qdroga.SQL.Text :=
      concat('select des_droga from prmamonodroga where des_droga like :droga ');
    espacios := StringReplace(ebusqueda.Text, ' ', '%', [rfReplaceAll]);
    dmFacturador.qdroga.ParamByName('droga').AsString := '%' + espacios + '%';
    dmFacturador.qdroga.Open;
    form2 := tfdrogas.Create(SELF);
    form2.SetTicket(Ticket);
    form2.ShowModal;

    form4 := tfdescripciondroga.Create(SELF);
    form4.SetTicket(Ticket);
    form4.ShowModal;

    dmFacturador.AbrirConexion();

    if Length(ebusqueda.Text) > 0 then
    begin
      form := tfprogreso.Create(SELF);

      form.Show;
      application.ProcessMessages;
      dmFacturador.qbusqueda.SQL.Clear;
      dmFacturador.qbusqueda.Close;
      dmFacturador.qbusqueda.SQL.Text := concat(' select first(100)',
        ' DISTINCT a.cod_alfabeta, ', ' a.nro_troquel, ', ' a.cod_barraspri, ',
        ' a.nom_largo, ', ' a.cod_iva, ', ' s.can_stk, ',
        ' a.cod_laboratorio, ', ' a.cod_tamano, ', ' coalesce(CAST( ',
        ' CASE  ',
        'WHEN a.mar_impsug=''N'' and a.mar_precioventa=''S'' THEN   ',
        ' b.imp_venta                                           ',
        ' when a.mar_impsug=''N'' and a.mar_precioventa=''N'' THEN  ',
        ' (b.imp_compra*(1+r.por_margen/100))                   ',
        '  when a.mar_impsug=''S'' AND A.mar_precioventa=''S'' then ',
        ' (a.imp_sugerido)                                      ',
        ' when A.mar_impsug=''S'' AND A.mar_precioventa=''N'' then  ',
        ' ((a.imp_sugerido*r.por_margen/100) + a.imp_sugerido) ',
        ' END AS DECIMAL (10,2)),0) as PRECIO, ',
        ' c.POR_VAR_PRECIO as varlabo, ', ' r.por_var_precio as VARRUBRO, ',
        ' r.cod_rubro, ', ' d.des_droga,  ', ' f.des_accfarm,  ',
        ' c.nom_laboratorio ',
        'from  prmalaboratorio c, prmarubro r, prmastock s, ',
        'prmaproducto a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta LEFT JOIN prmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm LEFT JOIN prmamonodroga d ON  D.cod_droga=a.cod_droga ',
        ' where (d.des_droga like :nombre )',
        'and (a.nom_largo like :descripcion ) ', 'AND a.cod_rubro=r.cod_rubro ',
        'and c.cod_laboratorio=a.cod_laboratorio ',
        'and a.cod_alfabeta=s.cod_alfabeta ',
        'and s.nro_sucursal=b.nro_sucursal ',
        'and not(mar_baja=''S'' and s.can_stk=0) ',
        'and b.nro_sucursal=:sucursal ', 'order by 4 asc ');

      if not TextToFloat(PChar(ebusqueda.Text), Valor, fvExtended) then
      begin
        espacios := StringReplace(Ticket.monodroga, ' ', '%', [rfReplaceAll]);
        dmFacturador.qbusqueda.ParamByName('nombre').AsString :=
          '%' + espacios + '%';
        dmFacturador.qbusqueda.ParamByName('descripcion').AsString :=
          '%' + Ticket.desdroga + '%';
      end;
      dmFacturador.qbusqueda.ParamByName('sucursal').AsString :=
        dmFacturador.getSucursal();
      dmFacturador.qbusqueda.Open;
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
          // dmfacturador.dsecundarioprecio.AsString:=dmfacturador.qbusqueda.FieldByName('precio').AsString;
          porvarlabo := dmFacturador.qbusqueda.FieldByName('varlabo').Asfloat;
          porvarrubro := dmFacturador.qbusqueda.FieldByName('varrubro').Asfloat;
          preciocrudo := dmFacturador.qbusqueda.FieldByName('precio').Asfloat;
          precio;
            //----------------AGREGADO 16/05/2022------------------------------//
          if (TICKET.codigo_OS='ZBI') OR (TICKET.codigo_OS='ZBH') OR (TICKET.codigo_OS='ZA7')  OR (TICKET.codigo_OS='W14') OR (TICKET.codigo_OS='WVP') OR (TICKET.codigo_OS='WVR') OR (TICKET.codigo_OS='W15') OR (TICKET.codigo_OS='WVJ') OR (TICKET.codigo_OS='WVM') OR (TICKET.codigo_OS='WVD') OR (TICKET.codigo_OS='WVO') OR (TICKET.codigo_OS='WVG') OR (TICKET.codigo_OS='WVF') OR (TICKET.codigo_OS='WVH') OR (TICKET.codigo_OS='WVN') OR (TICKET.codigo_OS='WVE') OR (TICKET.codigo_OS='ZAE') OR (TICKET.codigo_OS='ZAF') OR (TICKET.codigo_OS='ZAG') OR (TICKET.codigo_OS='ZAI') OR (TICKET.codigo_OS='ZAL') OR (TICKET.codigo_OS='ZAM') OR (TICKET.codigo_OS='ZAN') OR (TICKET.codigo_OS='ZAO') OR (TICKET.codigo_OS='OFL') OR (TICKET.codigo_OS='OFN') OR (TICKET.codigo_OS='OFM') OR (TICKET.codigo_OS='OFK') OR (TICKET.codigo_OS='OFJ') OR (TICKET.codigo_OS='ZA2') OR (TICKET.codigo_OS='ZA3')   then
          BEGIN
          dmFacturador.dsecundarioprecio.AsString :=floattostr(preciocalculado*porcentajeAumentoHosp);
          END;

          if (ticket.codigo_Co1='ZBI') OR (ticket.codigo_Co1='ZBH') OR (ticket.codigo_Co1='ZA7')  OR (ticket.codigo_Co1='W14') OR (ticket.codigo_Co1='WVP') OR (ticket.codigo_Co1='WVR') OR (ticket.codigo_Co1='W15') OR (ticket.codigo_Co1='WVJ') OR (ticket.codigo_Co1='WVM') OR (ticket.codigo_Co1='WVD') OR (ticket.codigo_Co1='WVO') OR (ticket.codigo_Co1='WVG') OR (ticket.codigo_Co1='WVF') OR (ticket.codigo_Co1='WVH') OR (ticket.codigo_Co1='WVN') OR (ticket.codigo_Co1='WVE') OR (ticket.codigo_Co1='ZAE') OR (ticket.codigo_Co1='ZAF') OR (ticket.codigo_Co1='ZAG') OR (ticket.codigo_Co1='ZAI') OR (ticket.codigo_Co1='ZAL') OR (ticket.codigo_Co1='ZAM') OR (ticket.codigo_Co1='ZAN') OR (ticket.codigo_Co1='ZAO') OR (ticket.codigo_Co1='OFL') OR (ticket.codigo_Co1='OFN') OR (ticket.codigo_Co1='OFM') OR (ticket.codigo_Co1='OFK') OR (ticket.codigo_Co1='OFJ') OR (ticket.codigo_Co1='ZA2') OR (ticket.codigo_Co1='ZA3')   then
          BEGIN
          dmFacturador.dsecundarioprecio.AsString :=floattostr(preciocalculado*porcentajeAumentoHosp);
          END;

          if (ticket.codigo_Cos2='ZBI') OR (ticket.codigo_Cos2='ZBH') OR (ticket.codigo_Cos2='ZA7')  OR (ticket.codigo_Cos2='W14') OR (ticket.codigo_Cos2='WVP') OR (ticket.codigo_Cos2='WVR') OR (ticket.codigo_Cos2='W15') OR (ticket.codigo_Cos2='WVJ') OR (ticket.codigo_Cos2='WVM') OR (ticket.codigo_Cos2='WVD') OR (ticket.codigo_Cos2='WVO') OR (ticket.codigo_Cos2='WVG') OR (ticket.codigo_Cos2='WVF') OR (ticket.codigo_Cos2='WVH') OR (ticket.codigo_Cos2='WVN') OR (ticket.codigo_Cos2='WVE') OR (ticket.codigo_Cos2='ZAE') OR (ticket.codigo_Cos2='ZAF') OR (ticket.codigo_Cos2='ZAG') OR (ticket.codigo_Cos2='ZAI') OR (ticket.codigo_Cos2='ZAL') OR (ticket.codigo_Cos2='ZAM') OR (ticket.codigo_Cos2='ZAN') OR (ticket.codigo_Cos2='ZAO') OR (ticket.codigo_Cos2='OFL') OR (ticket.codigo_Cos2='OFN') OR (ticket.codigo_Cos2='OFM') OR (ticket.codigo_Cos2='OFK') OR (ticket.codigo_Cos2='OFJ') OR (ticket.codigo_Cos2='ZA2') OR (ticket.codigo_Cos2='ZA3')   then
          BEGIN
          dmFacturador.dsecundarioprecio.AsString :=floattostr(preciocalculado*porcentajeAumentoHosp);
          END;

          if NOT ((TICKET.codigo_OS='ZBI') OR (TICKET.codigo_OS='ZBH') OR (TICKET.codigo_OS='ZA7') OR (TICKET.codigo_OS='W14') OR (TICKET.codigo_OS='WVP') OR (TICKET.codigo_OS='WVR') OR (TICKET.codigo_OS='W15') OR (TICKET.codigo_OS='WVJ') OR (TICKET.codigo_OS='WVM') OR (TICKET.codigo_OS='WVD') OR (TICKET.codigo_OS='WVO') OR (TICKET.codigo_OS='WVG') OR (TICKET.codigo_OS='WVF') OR (TICKET.codigo_OS='WVH') OR (TICKET.codigo_OS='WVN') OR (TICKET.codigo_OS='WVE') OR (TICKET.codigo_OS='ZAE') OR (TICKET.codigo_OS='ZAF') OR (TICKET.codigo_OS='ZAG') OR (TICKET.codigo_OS='ZAI') OR (TICKET.codigo_OS='ZAL') OR (TICKET.codigo_OS='ZAM') OR (TICKET.codigo_OS='ZAN') OR (TICKET.codigo_OS='ZAO') OR (TICKET.codigo_OS='OFL') OR (TICKET.codigo_OS='OFN') OR (TICKET.codigo_OS='OFM') OR (TICKET.codigo_OS='OFK') OR (TICKET.codigo_OS='OFJ') OR (TICKET.codigo_OS='ZA2') OR (TICKET.codigo_OS='ZA3')  ) then
          BEGIN
          if not ((ticket.codigo_Co1='ZBI') OR (ticket.codigo_Co1='ZBH') OR (ticket.codigo_Co1='ZA7')  OR (ticket.codigo_Co1='W14') OR (ticket.codigo_Co1='WVP') OR (ticket.codigo_Co1='WVR') OR (ticket.codigo_Co1='W15') OR (ticket.codigo_Co1='WVJ') OR (ticket.codigo_Co1='WVM') OR (ticket.codigo_Co1='WVD') OR (ticket.codigo_Co1='WVO') OR (ticket.codigo_Co1='WVG') OR (ticket.codigo_Co1='WVF') OR (ticket.codigo_Co1='WVH') OR (ticket.codigo_Co1='WVN') OR (ticket.codigo_Co1='WVE') OR (ticket.codigo_Co1='ZAE') OR (ticket.codigo_Co1='ZAF') OR (ticket.codigo_Co1='ZAG') OR (ticket.codigo_Co1='ZAI') OR (ticket.codigo_Co1='ZAL') OR (ticket.codigo_Co1='ZAM') OR (ticket.codigo_Co1='ZAN') OR (ticket.codigo_Co1='ZAO') OR (ticket.codigo_Co1='OFL') OR (ticket.codigo_Co1='OFN') OR (ticket.codigo_Co1='OFM') OR (ticket.codigo_Co1='OFK') OR (ticket.codigo_Co1='OFJ') OR (ticket.codigo_Co1='ZA2') OR (ticket.codigo_Co1='ZA3'))   then
            BEGIN
            if not ((ticket.codigo_Cos2='ZBI') OR (ticket.codigo_Cos2='ZBH') OR (ticket.codigo_Cos2='ZA7')  OR (ticket.codigo_Cos2='W14') OR (ticket.codigo_Cos2='WVP') OR (ticket.codigo_Cos2='WVR') OR (ticket.codigo_Cos2='W15') OR (ticket.codigo_Cos2='WVJ') OR (ticket.codigo_Cos2='WVM') OR (ticket.codigo_Cos2='WVD') OR (ticket.codigo_Cos2='WVO') OR (ticket.codigo_Cos2='WVG') OR (ticket.codigo_Cos2='WVF') OR (ticket.codigo_Cos2='WVH') OR (ticket.codigo_Cos2='WVN') OR (ticket.codigo_Cos2='WVE') OR (ticket.codigo_Cos2='ZAE') OR (ticket.codigo_Cos2='ZAF') OR (ticket.codigo_Cos2='ZAG') OR (ticket.codigo_Cos2='ZAI') OR (ticket.codigo_Cos2='ZAL') OR (ticket.codigo_Cos2='ZAM') OR (ticket.codigo_Cos2='ZAN') OR (ticket.codigo_Cos2='ZAO') OR (ticket.codigo_Cos2='OFL') OR (ticket.codigo_Cos2='OFN') OR (ticket.codigo_Cos2='OFM') OR (ticket.codigo_Cos2='OFK') OR (ticket.codigo_Cos2='OFJ') OR (ticket.codigo_Cos2='ZA2') OR (ticket.codigo_Cos2='ZA3')) then
              begin
              dmFacturador.dsecundarioprecio.AsString :=floattostr(preciocalculado);
              end;
            END;
          END;
          //-----------AUMENTO A LOS HOSPITALES----------------------//


       //   dmFacturador.dsecundarioprecio.AsString := floattostr(preciocalculado);

          /// ------------------------si los campos de os no estan vacios--------------------------///
          if ((los.Text <> '') or (lco1.Text <> '') or (lco2.Text <> '')) then
          begin
            descuento := CalcularDescuento(Ticket.sucursal,
              (dmFacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString),
              Eos.Text, Eco1.Text, Eco2.Text, eafiliado.Text, ECO1AFILIADO.Text,
              eco2afiliado.Text,
              (dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString));
               marTipoDescCo1:= descuento.mar_cos1;
              marTipoDescCo2:= descuento.mar_cos2;
          end;
          /// -------------------------calculo de descuento preliminar--------------------------------//
          if ((los.Text <> '') or (lco1.Text <> '') or (lco2.Text <> '')) then
          begin
            dmFacturador.dsecundariodescuento.Asfloat :=
              (descuento.getDescuentotal);
            if (descuento.getDescuentotal) > 0 then
            begin
              dmFacturador.dsecundarioPRECIO_TOTAL.Asfloat :=
                dmFacturador.dsecundarioprecio.Asfloat *
                ((descuento.getDescuentotal) / 100);
            end;
          end;
          if dmFacturador.dsecundariodescuento.IsNull then
          begin
            dmFacturador.dsecundariodescuento.Asfloat := 0;
          end;

          dmFacturador.dsecundarioPRECIO_TOTAL.Asfloat :=
            dmFacturador.dsecundarioprecio.Asfloat;

          dmFacturador.dsecundarioRUBRO.AsString :=
            dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString;

          if los.Text <> '' then
          begin
            dmFacturador.dsecundarioDESCUENTOOS.Asfloat := descuento.Porc_os;
            cobOS := descuento.Porc_os;
          end;
          if los.Text = '' then
          begin
            dmFacturador.dsecundarioDESCUENTOOS.Asfloat := 0;
          end;

          if lco1.Text <> '' then
          begin
            cobCos1 := descuento.porc_coseguro;
            if cobCos1 + cobOS > 100 then
            BEGIN
              cobCos1 := 100 - cobOS;
              if cobCos1 < 0 then
              begin
                cobCos1 := 0;
              end;
            END;
          end;

          if lco1.Text <> '' then
          begin
            dmFacturador.dsecundarioDescuentoco1.Asfloat := cobCos1;
          end;
          if lco1.Text = '' then
          begin
            dmFacturador.dsecundarioDescuentoco1.Asfloat := 0;
          end;
          if lco2.Text <> '' then
          begin
            cobcos2 := descuento.porc_coseguro2;
            if cobOS + cobCos1 + cobcos2 > 100 then
            BEGIN
              cobcos2 := 100 - cobOS - cobCos1;
              if cobcos2 < 0 then
              begin
                cobcos2 := 0;
              end;
            END;
          end;
          if lco2.Text <> '' then
          begin
            dmFacturador.dsecundarioDESCUENTOCO2.Asfloat := cobcos2;
          end;
          if lco2.Text = '' then
          begin
            dmFacturador.dsecundarioDESCUENTOCO2.Asfloat := 0;
          end;
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

      END;
    end;

    form.Close;
    if dmFacturador.qbusqueda.RecordCount > 1 then
    Begin
      form3 := tfbusquedaproductos.Create(SELF);
      form3.SetTicket(Ticket);
      form3.ShowModal;
      if not Gfacturador.DataSource.DataSet.IsEmpty then
      begin
        ebusqueda.Clear;
        Gfacturador.SetFocus;
        Gfacturador.Selectedindex := 3;
        Gfacturador.EditorMode := true;
        dmFacturador.DPRINCIPAL.Edit;
        dmFacturador.DPRINCIPALCANTIDAD.Clear;
        if Ffacturador.Gfacturador.DataSource.DataSet.RecordCount > 0 then
        begin
          imprimir.Enabled := true;
          bvale.Enabled := true;
          bprecio.Enabled := true;
          bstockonline.Enabled := true;
        end;
        if codigo_validador <> '' then
        begin
          BVALIDAR.Enabled := true;
        end;
        if codigo_validador = '' then
        begin
          BVALIDAR.Enabled := false;
        end;
        Gfacturador.SetFocus;
      end;
    end;

  end;

  // ------------- ACCION FARMACO
  if Rbusqueda.ItemIndex = 2 then
  begin

    dmFacturador.AbrirConexion();
    if Length(ebusqueda.Text) > 0 then
    begin
      dmFacturador.qbusqueda.Close;
      dmFacturador.qbusqueda.SQL.Text := concat(' select first(100)',
        ' DISTINCT a.cod_alfabeta, ', ' a.nro_troquel, ', ' a.cod_barraspri, ',
        ' a.nom_largo, ', ' a.cod_iva, ', ' s.can_stk, ',
        ' a.cod_laboratorio, ', ' a.cod_tamano, ', ' coalesce(CAST( ',
        ' CASE  ',
        'WHEN a.mar_impsug=''N'' and a.mar_precioventa=''S'' THEN   ',
        ' b.imp_venta                                           ',
        ' when a.mar_impsug=''N'' and a.mar_precioventa=''N'' THEN  ',
        ' (b.imp_compra*(1+r.por_margen/100))                   ',
        '  when a.mar_impsug=''S'' AND A.mar_precioventa=''S'' then ',
        ' (a.imp_sugerido)                                      ',
        ' when A.mar_impsug=''S'' AND A.mar_precioventa=''N'' then  ',
        ' ((a.imp_sugerido*r.por_margen/100) + a.imp_sugerido) ',
        ' END AS DECIMAL (10,2)),0) as PRECIO, ',
        'c.POR_VAR_PRECIO as varlabo, ', 'r.por_var_precio as VARRUBRO, ',
        'r.cod_rubro, ', 'd.des_droga,  ', 'f.des_accfarm, ',
        'c.nom_laboratorio ',
        'from  prmalaboratorio c, prmarubro r, prmastock s, ',
        ' prmaproducto a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta ',
        ' LEFT JOIN prmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm LEFT JOIN prmamonodroga d ON  D.cod_droga=a.cod_droga ',
        ' where (f.des_accfarm like :nombre )', ' AND a.cod_rubro=r.cod_rubro ',
        ' and c.cod_laboratorio=a.cod_laboratorio ',
        ' and a.cod_alfabeta=s.cod_alfabeta ',
        ' and s.nro_sucursal=b.nro_sucursal ',
        ' and not(mar_baja=''S'' and s.can_stk=0) ',
        ' and b.nro_sucursal=:sucursal ', ' order by 4 asc');

      if not TextToFloat(PChar(ebusqueda.Text), Valor, fvExtended) then
      begin
        espacios := StringReplace(ebusqueda.Text, ' ', '%', [rfReplaceAll]);
        dmFacturador.qbusqueda.ParamByName('nombre').AsString :=
          '%' + espacios + '%';
      end;
      dmFacturador.qbusqueda.ParamByName('sucursal').AsString :=
        dmFacturador.getSucursal();
      dmFacturador.qbusqueda.Open;
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




          dmFacturador.dsecundarioprecio.AsString :=    dmFacturador.qbusqueda.FieldByName('precio').AsString;
          /// ------------------------si los campos de os no estan vacios--------------------------///
          if ((los.Text <> '') or (lco1.Text <> '') or (lco2.Text <> '')) then
          begin
            descuento := CalcularDescuento(Ticket.sucursal,
              (dmFacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString),
              Eos.Text, Eco1.Text, Eco2.Text, eafiliado.Text, ECO1AFILIADO.Text,
              eco2afiliado.Text,
              (dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString));
               marTipoDescCo1:= descuento.mar_cos1;
              marTipoDescCo2:= descuento.mar_cos2;
          end;
          /// -------------------------calculo de descuento preliminar--------------------------------//
          if ((los.Text <> '') or (lco1.Text <> '') or (lco2.Text <> '')) then
          begin
            dmFacturador.dsecundariodescuento.Asfloat :=
              (descuento.getDescuentotal);
            if (descuento.getDescuentotal) > 0 then
            begin
              dmFacturador.dsecundarioPRECIO_TOTAL.Asfloat :=
                dmFacturador.dsecundarioprecio.Asfloat *
                ((descuento.getDescuentotal) / 100);
            end;
          end;
          if dmFacturador.dsecundariodescuento.IsNull then
          begin
            dmFacturador.dsecundariodescuento.Asfloat := 0;
          end;

          dmFacturador.dsecundarioPRECIO_TOTAL.Asfloat :=
            dmFacturador.dsecundarioprecio.Asfloat;

          dmFacturador.dsecundarioRUBRO.AsString :=
            dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString;

          if los.Text <> '' then
          begin
            dmFacturador.dsecundarioDESCUENTOOS.Asfloat := descuento.Porc_os;
            cobOS := descuento.Porc_os;
          end;
          if los.Text = '' then
          begin
            dmFacturador.dsecundarioDESCUENTOOS.Asfloat := 0;
          end;

          if lco1.Text <> '' then
          begin
            cobCos1 := descuento.porc_coseguro;
            if cobCos1 + cobOS > 100 then
            BEGIN
              cobCos1 := 100 - cobOS;
              if cobCos1 < 0 then
              begin
                cobCos1 := 0;
              end;
            END;
          end;

          if lco1.Text <> '' then
          begin
            dmFacturador.dsecundarioDescuentoco1.Asfloat := cobCos1;
          end;
          if lco1.Text = '' then
          begin
            dmFacturador.dsecundarioDescuentoco1.Asfloat := 0;
          end;
          if lco2.Text <> '' then
          begin
            cobcos2 := descuento.porc_coseguro2;
            if cobOS + cobCos1 + cobcos2 > 100 then
            BEGIN
              cobcos2 := 100 - cobOS - cobCos1;
              if cobcos2 < 0 then
              begin
                cobcos2 := 0;
              end;
            END;
          end;
          if lco2.Text <> '' then
          begin
            dmFacturador.dsecundarioDESCUENTOCO2.Asfloat := cobcos2;
          end;
          if lco2.Text = '' then
          begin
            dmFacturador.dsecundarioDESCUENTOCO2.Asfloat := 0;
          end;
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

      END;
    end;
    form.Close;
    if dmFacturador.qbusqueda.RecordCount > 1 then
    Begin
      form3 := tfbusquedaproductos.Create(SELF);
      form3.SetTicket(Ticket);
      form3.ShowModal;
      if not Gfacturador.DataSource.DataSet.IsEmpty then
      begin
        ebusqueda.Clear;
        Gfacturador.SetFocus;
        Gfacturador.Selectedindex := 3;
        Gfacturador.EditorMode := true;
        dmFacturador.DPRINCIPAL.Edit;
        dmFacturador.DPRINCIPALCANTIDAD.Clear;
        if Ffacturador.Gfacturador.DataSource.DataSet.RecordCount > 0 then
        begin
          imprimir.Enabled := true;
          bvale.Enabled := true;
          bprecio.Enabled := true;
          bstockonline.Enabled := true;
        end;
        if codigo_validador <> '' then
        begin
          BVALIDAR.Enabled := true;
        end;
        if codigo_validador = '' then
        begin
          BVALIDAR.Enabled := false;
        end;
        Gfacturador.SetFocus;
      end;
    end;

  end;

  if dmFacturador.qbusqueda.IsEmpty then
  begin
    ebusqueda.Text := '';
    ebusqueda.SetFocus;
  end;
  form.Close;

end;

procedure TFfacturador.BcancelarClick(Sender: TObject);
begin
  if dmFacturador.DPRINCIPAL.Active = true then
  begin
    dmFacturador.DPRINCIPAL.EmptyDataSet;

  end;
  if dmFacturador.DPRINCIPAL.Active = true then
  begin
    dmFacturador.dsecundario.Close;
  end;

end;

procedure TFfacturador.bdetalleClick(Sender: TObject);
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
  form2: tfdrogas;
  form4: tfdescripciondroga;
  r1descuento: double;
begin
  form := tfprogreso.Create(SELF);

  form.Show;
  application.ProcessMessages;
  dmFacturador.dsecundario.Close;
  // ------------------------------------------------busqueda por descripcion/codigo troquel/ barras--------------------------------/ /
  if Rbusqueda.ItemIndex = 0 then
  begin
    dmFacturador.AbrirConexion();

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
      ' and b.nro_sucursal=:sucursal ');

    dmFacturador.qbusqueda.ParamByName('barras').AsString :=
      Ffacturador.Gfacturador.Fields[9].AsString;

    dmFacturador.qbusqueda.ParamByName('troquel').Asinteger :=
      Ffacturador.Gfacturador.Fields[0].Asinteger;

    dmFacturador.qbusqueda.ParamByName('sucursal').AsString :=
      dmFacturador.getSucursal();
    if not TextToFloat(PChar(ebusqueda.Text), Valor, fvExtended) then
    begin
      espacios := StringReplace(Ffacturador.Gfacturador.Fields[1].AsString, ' ',
        '%', [rfReplaceAll]);
      dmFacturador.qbusqueda.ParamByName('nombre').AsString :=
        '%' + espacios + '%';
    end;
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
        preciocrudo := dmFacturador.qbusqueda.FieldByName('precio').Asfloat;
        precio;
        dmFacturador.dsecundarioprecio.AsString := floattostr(preciocalculado);
        // dmfacturador.dsecundarioprecio.AsString:=dmfacturador.qbusqueda.FieldByName('precio').AsString;
        /// ------------------------si los campos de os no estan vacios--------------------------///
        if ((los.Text <> '') or (lco1.Text <> '') or (lco2.Text <> '')) then
        begin
          descuento := CalcularDescuento(Ticket.sucursal,
            (dmFacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString),
            Eos.Text, Eco1.Text, Eco2.Text, eafiliado.Text, ECO1AFILIADO.Text,
            eco2afiliado.Text, (dmFacturador.qbusqueda.FieldByName('cod_rubro')
            .AsString));
             marTipoDescCo1:= descuento.mar_cos1;
              marTipoDescCo2:= descuento.mar_cos2;
        end;
        /// -------------------------calculo de descuento preliminar--------------------------------//
        if ((los.Text <> '') or (lco1.Text <> '') or (lco2.Text <> '')) then
        begin
          dmFacturador.dsecundariodescuento.Asfloat :=
            (descuento.getDescuentotal);
          if (descuento.getDescuentotal) > 0 then
          begin
            dmFacturador.dsecundarioPRECIO_TOTAL.Asfloat :=
              dmFacturador.dsecundarioprecio.Asfloat *
              ((descuento.getDescuentotal) / 100);
          end;
        end;
        if dmFacturador.dsecundariodescuento.IsNull then
        begin
          dmFacturador.dsecundariodescuento.Asfloat := 0;
        end;

        dmFacturador.dsecundarioPRECIO_TOTAL.Asfloat :=
          dmFacturador.dsecundarioprecio.Asfloat;

        dmFacturador.dsecundarioRUBRO.AsString :=
          dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString;

        if los.Text <> '' then
        begin
          dmFacturador.dsecundarioDESCUENTOOS.Asfloat := descuento.Porc_os;
          cobOS := descuento.Porc_os;
        end;
        if los.Text = '' then
        begin
          dmFacturador.dsecundarioDESCUENTOOS.Asfloat := 0;
        end;

        if lco1.Text <> '' then
        begin
          cobCos1 := descuento.porc_coseguro;
          if cobCos1 + cobOS > 100 then
          BEGIN
            cobCos1 := 100 - cobOS;
            if cobCos1 < 0 then
            begin
              cobCos1 := 0;
            end;
          END;
        end;

        if lco1.Text <> '' then
        begin
          dmFacturador.dsecundarioDescuentoco1.Asfloat := cobCos1;
        end;
        if lco1.Text = '' then
        begin
          dmFacturador.dsecundarioDescuentoco1.Asfloat := 0;
        end;
        if lco2.Text <> '' then
        begin
          cobcos2 := descuento.porc_coseguro2;
          if cobOS + cobCos1 + cobcos2 > 100 then
          BEGIN
            cobcos2 := 100 - cobOS - cobCos1;
            if cobcos2 < 0 then
            begin
              cobcos2 := 0;
            end;
          END;
        end;
        if lco2.Text <> '' then
        begin
          dmFacturador.dsecundarioDESCUENTOCO2.Asfloat := cobcos2;
        end;
        if lco2.Text = '' then
        begin
          dmFacturador.dsecundarioDESCUENTOCO2.Asfloat := 0;
        end;
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
      form.Close;
      if dmFacturador.qbusqueda.RecordCount = 1 then
      Begin
        form3 := tfbusquedaproductos.Create(SELF);
        form3.SetTicket(Ticket);
        form3.ShowModal;
        if not Gfacturador.DataSource.DataSet.IsEmpty then
        begin
          ebusqueda.Clear;
          Gfacturador.SetFocus;
          Gfacturador.Selectedindex := 3;
          Gfacturador.EditorMode := true;
          dmFacturador.DPRINCIPAL.Edit;
          dmFacturador.DPRINCIPALCANTIDAD.Clear;
          if Ffacturador.Gfacturador.DataSource.DataSet.RecordCount > 0 then
          begin
            imprimir.Enabled := true;
            bvale.Enabled := true;
            bprecio.Enabled := true;
            bstockonline.Enabled := true;
            bdetalle.Enabled := true;
          end;
          if codigo_validador <> '' then
          begin
            BVALIDAR.Enabled := true;
          end;
          if codigo_validador = '' then
          begin
            BVALIDAR.Enabled := false;
          end;
          Gfacturador.SetFocus;
        end;
        form.Close;
      end;
      form.Close;
    end;
    form.Close;
  end;
  form.Close;
end;

procedure TFfacturador.Bgrabarafico2Click(Sender: TObject);

  var
  afiliado:TAfiliado;
begin
 guardarAfiliado(eco2,ECO2AFILIADO,eco2nombre,ECO2apellido);
end;

procedure TFfacturador.bgrabarafiliadoClick(Sender: TObject);

begin
  guardarAfiliado(Eos,eafiliado,eosnombre,eosapellido);
end;


procedure TFfacturador.bgrabarmedicoClick(Sender: TObject);
var
reg: tregistry;
buttonSelected : Integer;
begin
  guardarMedico(eos,eosmatricula,EOSMEDICONOMBRE,eosmedicoAPELLIDO);
end;


procedure TFfacturador.bhistorialClick(Sender: TObject);
var
  form: tfhistorial;
  form2: tfprogreso;

begin
  dmFacturador.dsecundario.Close;
  form := tfhistorial.Create(SELF);
  form.SetTicket(Ticket);
  Ticket.afiliadohistorial := eafiliado.Text;

  form.ShowModal;

end;

procedure TFfacturador.DESCOBERClick(Sender: TObject);
begin
  pgCoberturas.Enabled := true;
  Eos.Color := clWINDOW;
  los.Color := clWINDOW;
  Eco1.Color := clWINDOW;
  Eco2.Color := clWINDOW;
  lco1.Color := clWINDOW;
  lco2.Color := clWINDOW;
  desbloqueo.Caption := '';
  DESCOBER.Enabled := false;
  pgCoberturas.TabIndex := 0;
  Eos.SetFocus;
  {if dmFacturador.DPRINCIPAL.Active = true then
  begin
    dmFacturador.DPRINCIPAL.EmptyDataSet;
  end;
  if dmFacturador.dsecundario.Active = true then
  begin
    dmFacturador.dsecundario.Close;
  end;
  limpiarunidadticket; }

end;

procedure TFfacturador.dtfeccoseguro2KeyPress(Sender: TObject; var Key: Char);

var
  dias: Integer;
begin

  dias := trunc(now - dtfeccoseguro.DateTime) + 1;

  if Key = #13 then
  begin
    if dias <= strtoint(Ticket.dias_validezco) then
    begin

      bagregarafico.Click;
      bagregarmedico.Click;
      // ebusqueda.SetFocus;

      pgCoberturas.TabIndex := 2;
      pgCoberturas.Enabled := true;
      Eco2.SetFocus;
    end
    else
    begin
      showmessage('RECETA VENCIDA CORRIJA LOS DATOS');

    end;
  end;

end;

procedure TFfacturador.dtfeccoseguroKeyPress(Sender: TObject; var Key: Char);
{ begin
  if key=#13 then
  begin
  bagregarafico.Click;
  bagregarmedico.Click;
  ebusqueda.SetFocus;


  end;
  end; }
var
  dias: Integer;
begin




  dias := trunc(now - dtfeccoseguro.DateTime) + 1;

  if Key = #13 then
  begin
    if dias <= strtoint(Ticket.dias_validezco) then
    begin
       bagregarafico.Click;
      if esAfiliadoValido then
          bagregarmedico.Click;


      if esMedicoValido then
      begin
         pgCoberturas.TabIndex := 2;
         pgCoberturas.Enabled := true;
         Eco2.SetFocus;
      end;

      // ebusqueda.SetFocus;


    end
    else
    begin
      showmessage('RECETA VENCIDA CORRIJA LOS DATOS');

    end;
  end;
end;

procedure TFfacturador.dtfecrecetaKeyPress(Sender: TObject; var Key: Char);
var
  dias: Integer;
begin
  dias := trunc(now - dtfecreceta.DateTime) + 1;

  if Key = #13 then
  begin
    if dias <= strtoint(Ticket.dias_validez) then
    begin
        bgrabarafiliado.Click;

      if esAfiliadoValido then
         bgrabarmedico.Click;

      if esMedicoValido then
      begin
        pgCoberturas.TabIndex := 1;
        Eco1.SetFocus;
      end;

    end
    else
    begin
      showmessage('RECETA VENCIDA CORRIJA LOS DATOS');

    end;
  end;
end;

procedure TFfacturador.eafiliadoChange(Sender: TObject);
 var
  key:Char;
begin



end;

procedure TFfacturador.eafiliadoEnter(Sender: TObject);
begin
  eafiliado.Color := clmoneygreen;
end;

procedure TFfacturador.eafiliadoExit(Sender: TObject);
begin
  eafiliado.Color := clwhite;
end;

procedure TFfacturador.eafiliadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  form: tfbuscardatos;
  s1, s2: tstringlist;

begin

  if Key = VK_DOWN then
  BEGIN
    form := tfbuscardatos.Create(SELF);
    if Ticket.cod_afiliadoplanos = '' then
    begin
      form.codigoCoseguro := Eos.Text;
    end;
    if Ticket.cod_afiliadoplanos <> '' then
    begin
      form.codigoCoseguro := Ticket.cod_afiliadoplanos;
    end;
    form.TipoBusqueda := Afiliados;
    form.ShowModal;
    if ((form.nombreSeleccionado <> '') or (form.nombreSeleccionado <> '')) then
    begin
      s1 := tstringlist.Create;
      s1.Text := form.nombreSeleccionado;

      s2 := tstringlist.Create;
      s2.CommaText := s1.Text;

      eafiliado.Text := form.numeroSeleccionado;

      s2.Count;
      if s2.Count > 2 then
      begin
        if s2.Count = 5 then
        begin
          eosapellido.Text := s2[0] + ' ' + s2[1] + ' ' + s2[2] + ' ' + s2[3];
          eosnombre.Text := s2[4];
        end;
        if s2.Count = 4 then
        begin
          eosapellido.Text := s2[0] + ' ' + s2[1] + ' ' + s2[2];
          eosnombre.Text := s2[3];
        end;
        if s2.Count = 3 then
        begin
          eosapellido.Text := s2[0] + ' ' + s2[1];
          eosnombre.Text := s2[2];
        end;

        if s2.Count = 2 then
        begin
          eosapellido.Text := s2[0];
          eosnombre.Text := s2[1];
        end;
      end;
         eafiliadoKeyPress(Sender,enterKey);
    end;

  END;
end;

procedure TFfacturador.eafiliadoKeyPress(Sender: TObject; var Key: Char);
var
  reg: tregistry;
  buttonSelected: Integer;
  s1, s2: tstringlist;
begin
if ((Key=#13)) then
begin
  key:= #13;



  if length(pchar(trim(eafiliado.Text))) < 1 then
  begin
    showMessage('Ingrese numero de afiliado');
    exit;
  end;
  buscarAfiliado(eos,eafiliado,eosnombre,eosapellido);

  if Length(pchar(trim(eafiliado.Text))) > 0 then
  begin
    validarAfiliado(eafiliado,eosnombre,eosapellido);
  end;





end;
end;

procedure TFfacturador.ebusquedaEnter(Sender: TObject);
begin

  pgCoberturas.Enabled := False;
  Eos.Color := clmenu;
  los.Color := clmenu;
  Eco1.Color := clmenu;
  Eco2.Color := clmenu;
  lco1.Color := clmenu;
  lco2.Color := clmenu;
  desbloqueo.Caption :=
    'Pantalla coberturas en modo bloqueado, Para desbloquear presionar F7';
  desbloqueo.Visible:= True;
  DESCOBER.Enabled := true;
  ebusqueda.Color := clmoneygreen;
  if true then

end;

procedure TFfacturador.ebusquedaExit(Sender: TObject);
begin
  ebusqueda.Color := clwhite;
end;

procedure TFfacturador.ebusquedaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = vk_f9 then
  begin
    btnRecargos.click;
  end;
end;

procedure TFfacturador.ebusquedaKeyPress(Sender: TObject; var Key: Char);
begin

  if (Key = #13) then
  begin
    if (Length(ebusqueda.Text) > 3) then
    begin
      bbuscar.Click;
    end
    ELSE
    begin
      showmessage('Datos insuficientes');
    end;

  end;



end;

procedure TFfacturador.ECO1AFILIADOChange(Sender: TObject);
 var
  key:Char;
begin
  key:= #13;

  

end;

procedure TFfacturador.ECO1AFILIADOEnter(Sender: TObject);
begin
  ECO1AFILIADO.Color := clmoneygreen;
end;

procedure TFfacturador.ECO1AFILIADOExit(Sender: TObject);
begin
  ECO1AFILIADO.Color := clwhite;
end;

procedure TFfacturador.ECO1AFILIADOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  form: tfbuscardatos;
  s1, s2: tstringlist;
begin
  if Key = VK_DOWN then
  BEGIN
    form := tfbuscardatos.Create(SELF);
    if Ticket.cod_afiliadoplanos = '' then
    begin
      form.codigoCoseguro := Eco1.Text;
    end;
    if Ticket.cod_afiliadoplanos <> '' then
    begin
      form.codigoCoseguro := Ticket.cod_afiliadoplanos;
    end;

    form.TipoBusqueda := Afiliados;
    form.ShowModal;

    if ((form.nombreSeleccionado <> '') or (form.nombreSeleccionado <> '')) then
    begin
      s1 := tstringlist.Create;
      s1.Text := form.nombreSeleccionado;

      s2 := tstringlist.Create;
      s2.CommaText := s1.Text;

      ECO1AFILIADO.Text := form.numeroSeleccionado;

      eco1apellido.Text := s2[0];
      eco1nombre.Text := s2[1];
      ECO1AFILIADOKeyPress(sender,enterKey);
    end;

  END;
end;

procedure TFfacturador.ECO1AFILIADOKeyPress(Sender: TObject; var Key: Char);
var
  reg: tregistry;
  buttonSelected: Integer;
  s1, s2: tstringlist;
begin
if ((Key=#13)) then
begin

  if Length(pchar(trim(ECO1AFILIADO.Text))) > 0 then
  begin
    buscarAfiliado(eco1,eco1afiliado,eco1nombre,eco1apellido);
    validarAfiliado(ECO1AFILIADO,eco1nombre,eco1apellido);
    exit;
  end;
  eco1receta.SetFocus;
  esAfiliadoValido:= true;

end;

end;

procedure TFfacturador.Eco1Change(Sender: TObject);
VAR
  MAR_OBRASOCIAL: STRING;
begin
  dmFacturador.AbrirConexion();
  MAR_OBRASOCIAL := 'C';
  dmFacturador.qpanel2.Close;
  dmFacturador.qpanel2.SQL.Clear;
  dmFacturador.qpanel2.SQL.Append
    ('select NOM_PLANOS, codigo_validador, codigo_os_validador, codigo_plan_validador, COD_AFIL_PLANOS, can_diasvalidez from osmaplanesos where cod_planos=:CODIGO  AND MAR_OBRASOCIAL=:MAR_OBRASOCIAL   and mar_utilizados=''S''');
  dmFacturador.qpanel2.ParamByName('codigo').AsString := Eco1.Text;
  dmFacturador.qpanel2.ParamByName('mar_obrasocial').AsString := MAR_OBRASOCIAL;
  dmFacturador.qpanel2.Open;
  lco1.Text := dmFacturador.qpanel2.Fields[0].Text;
  Ticket.cod_afiliadoplanos := dmFacturador.qpanel2.Fields[4].Text;
  Ticket.dias_validezco := dmFacturador.qpanel2.Fields[5].Text;
  if not dmFacturador.qpanel2.IsEmpty then
  begin
    Ticket.codigo_Co1 := Eco1.Text;
    ECO1AFILIADO.SetFocus;
    Gfacturador.Columns.Items[12].Visible := true;
  end;
  if not dmFacturador.qpanel2.IsEmpty then
  begin
    if not Gfacturador.DataSource.DataSet.IsEmpty then
    begin
      reco1;
      DESCOBER.Click;
      pgCoberturas.TabIndex := 1;
      ECO1AFILIADO.SetFocus;
    end;
  end;
  if dmFacturador.qpanel2.IsEmpty then
  begin
    Gfacturador.Columns.Items[12].Visible := false;
    if not Gfacturador.DataSource.DataSet.IsEmpty then
    begin
      reco1empty;
      ticket.codigo_Co1:='';
    end;

  end;

  { if not gfacturador.DataSource.DataSet.IsEmpty then
    begin
    reco1;
    end;
    if gfacturador.DataSource.DataSet.IsEmpty then
    begin
    reco1empty;
    end; }
end;

procedure TFfacturador.eco1diagnosticoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    eco1receta.SetFocus;
  end;
end;

procedure TFfacturador.Eco1Enter(Sender: TObject);
begin
  Eco1.Color := clmoneygreen;
end;

procedure TFfacturador.Eco1Exit(Sender: TObject);
begin
  Eco1.Color := clwhite;

end;

procedure TFfacturador.Eco1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  form: tfbuscarco1;
begin
  if Key = VK_DOWN then
  BEGIN
    form := tfbuscarco1.Create(SELF);
    form.ShowModal;
    Eco1.Text := form.codObraSocial;

  END;

end;

procedure TFfacturador.Eco1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    // pgcoberturas.TabIndex:=2;
    // ebusqueda.SetFocus;
    if lco1.Text <> '' then
    begin
      ECO1AFILIADO.SetFocus;
      { if lco1.Text='' then
        begin
        pgcoberturas.TabIndex:=2;
        eco2.SetFocus;
        end; }
    end;
    if lco1.Text = '' then
    begin

      pgCoberturas.ActivePageIndex := 0;

      ebusqueda.Enabled:= True;
      ebusqueda.SetFocus;
    end;

  end;
end;

procedure TFfacturador.eco1apellidoEnter(Sender: TObject);
begin
  eco1apellido.Color := clmoneygreen;
end;

procedure TFfacturador.eco1apellidoExit(Sender: TObject);
begin
  eco1apellido.Color := clwhite;
end;

procedure TFfacturador.eco1apellidoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    eco1nombre.SetFocus;
  end;

end;

procedure TFfacturador.eco1apellidomedicoEnter(Sender: TObject);
begin
  eco1apellidomedico.Color := clmoneygreen;
end;

procedure TFfacturador.eco1apellidomedicoExit(Sender: TObject);
begin
  eco1apellidomedico.Color := clwhite;
end;

procedure TFfacturador.eco1apellidomedicoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    eco1nombremedico.SetFocus;
  end;
end;

procedure TFfacturador.Eco2Change(Sender: TObject);
VAR
  MAR_OBRASOCIAL: STRING;
begin
  dmFacturador.AbrirConexion();
  MAR_OBRASOCIAL := 'C';
  dmFacturador.qpanel2.Close;
  dmFacturador.qpanel2.SQL.Clear;
  dmFacturador.qpanel2.SQL.Append
    ('select NOM_PLANOS, codigo_validador, codigo_os_validador, codigo_plan_validador, COD_AFIL_PLANOS, can_diasvalidez from osmaplanesos where cod_planos=:CODIGO  AND MAR_OBRASOCIAL=:MAR_OBRASOCIAL   and mar_utilizados=''S''');
  dmFacturador.qpanel2.ParamByName('codigo').AsString := Eco2.Text;
  dmFacturador.qpanel2.ParamByName('mar_obrasocial').AsString := MAR_OBRASOCIAL;
  dmFacturador.qpanel2.Open;
  lco2.Text := dmFacturador.qpanel2.Fields[0].Text;
  Ticket.cod_afiliadoplanos := dmFacturador.qpanel2.Fields[4].Text;
  Ticket.dias_validezco := dmFacturador.qpanel2.Fields[5].Text;
  if not dmFacturador.qpanel2.IsEmpty then
  begin
    Ticket.codigo_Cos2 := Eco2.Text;
    eco2afiliado.SetFocus;
    Gfacturador.Columns.Items[13].Visible := true;
  end;
  if not dmFacturador.qpanel2.IsEmpty then
  begin
    if not Gfacturador.DataSource.DataSet.IsEmpty then
    begin
      reco2;
      DESCOBER.Click;
      pgCoberturas.TabIndex := 1;
      eco2afiliado.SetFocus;
    end;
  end;
  if dmFacturador.qpanel2.IsEmpty then
  begin
    Gfacturador.Columns.Items[13].Visible := false;
    if not Gfacturador.DataSource.DataSet.IsEmpty then
    begin
      reco1empty;
      ticket.codigo_Cos2:='';
    end;

  end;

  { if not gfacturador.DataSource.DataSet.IsEmpty then
    begin
    reco1;
    end;
    if gfacturador.DataSource.DataSet.IsEmpty then
    begin
    reco1empty;
    end; }
end;

procedure TFfacturador.Eco2Enter(Sender: TObject);
begin
  Eco2.Color := clmoneygreen;
end;

procedure TFfacturador.Eco2Exit(Sender: TObject);
begin
  Eco2.Color := clwhite;
end;

procedure TFfacturador.Eco2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  form: tfbuscarco1;
BEGIN

  if Key = VK_DOWN then
  BEGIN
    form := tfbuscarco1.Create(SELF);
    form.ShowModal;
    Eco2.Text := form.codObraSocial;
  END;
end;

procedure TFfacturador.Eco2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    pgCoberturas.TabIndex := 0;
    ebusqueda.SetFocus;

  end;

end;

procedure TFfacturador.eco2matriculaChange(Sender: TObject);
begin
    buscarMedico(eco2,eco2matricula,eco2medicoapellido,eco2mediconombre);
end;

procedure TFfacturador.eco2matriculaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

VAR
  form: tfbuscardatos;
begin
  if Key = VK_DOWN then
  BEGIN
    form := tfbuscardatos.Create(SELF);
    form.codigoCoseguro := Eco2.Text;
    form.TipoBusqueda := Medicos;
    form.ShowModal;
    eco2matricula.Text := form.numeroSeleccionado;
    eco2mediconombre.Text := form.nombreSeleccionado;
  END;

end;

procedure TFfacturador.eco2matriculaKeyPress(Sender: TObject; var Key: Char);
var
   reg: tregistry;
  s1, s2: tstringlist;
  i: Integer;
begin

  if (Key = #13) then
  begin
    validarMedico(eco2matricula,eco2medicoapellido,eco2mediconombre);


  end;

end;

procedure TFfacturador.eco2medicoapellidoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin
    eco2mediconombre.SetFocus;
  end;
end;

procedure TFfacturador.eco2medicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

VAR
  form: tfbuscardatos;
begin
  if Key = VK_DOWN then
  BEGIN
    form := tfbuscardatos.Create(SELF);
    form.codigoCoseguro := Eco2.Text;
    form.TipoBusqueda := Medicos;
    form.ShowModal;
    eco2matricula.Text := form.numeroSeleccionado;
    eco2medicoapellido.Text := form.nombreSeleccionado;
  END;

end;

procedure TFfacturador.eco2medicoKeyPress(Sender: TObject; var Key: Char);
var
  reg: tregistry;
  buttonSelected: Integer;
begin
  if (Key = #13) then
  begin
    reg := tregistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('\SOFTWARE\a+\', true);
    dmFacturador.AbrirConexion();
    dmFacturador.qafiliados.Close;
    dmFacturador.qafiliados.SQL.Text :=
      concat('select des_medico, nro_matricula from osmamedicos where cod_planos=:codigo and  nro_matricula=:numero ');
    dmFacturador.qafiliados.ParamByName('codigo').AsString := Eco2.Text;
    dmFacturador.qafiliados.ParamByName('numero').AsString :=
      eco2matricula.Text;
    dmFacturador.qafiliados.Open;
    if dmFacturador.qafiliados.IsEmpty then
    Begin
      buttonSelected := messagedlg('Desea agregar afiliado', mtCustom,
        [mbok, mbno], 0);
      if buttonSelected = mrOK then
      BEGIN
        if ((eco2matricula.Text <> '') AND (eco2medicoapellido.Text <> '')) then
        begin
          if dmFacturador.tranafiliados.InTransaction then
          begin
            dmFacturador.tranafiliados.Rollback;
          end;
          dmFacturador.qiafiliados.Database := dmFacturador.getConexion;
          dmFacturador.dataafiliados.DataSet := dmFacturador.qiafiliados;
          dmFacturador.qiafiliados.Transaction := dmFacturador.tranafiliados;
          dmFacturador.qiafiliados.Close;
          dmFacturador.qiafiliados.SQL.Clear;

          dmFacturador.qiafiliados.Close;
          dmFacturador.qiafiliados.SQL.Text :=
            concat('INSERT INTO OSMAMEDICOS (NRO_MATRICULA, COD_PLANOS, DES_MEDICO, MAR_INHIBIDO, DES_DIRECCION, DES_LOCALIDAD, DES_TELEFONO, DES_FAX, COD_ESPECIALIDAD, ES_INSTITUCION)',
            'VALUES (:MATRICULA, :CODIGOPLAN, :DESMEDICO, ''N'', NULL, NULL, NULL, NULL, NULL, ''N'')');

          dmFacturador.qiafiliados.ParamByName('codigoPLAN').AsString :=
            Eco2.Text;
          dmFacturador.qiafiliados.ParamByName('MATRICULA').AsString :=
            eco2matricula.Text;
          dmFacturador.qiafiliados.ParamByName('DESMEDICO').AsString :=
            eco2medicoapellido.Text;
          dmFacturador.qiafiliados.Open;
          dmFacturador.tranafiliados.Commit;

        end;

      end;
      if eco2matricula.Text = '' then
      begin
        showmessage('Inserte Matricula de medico');
      end;
      if eco2medicoapellido.Text = '' then
      begin
        showmessage('Inserte Nombre de medico');
      end;
    End;
    if dmFacturador.qafiliados.RecordCount = 1 then
    Begin
      eco2medicoapellido.Text := dmFacturador.qafiliados.Fields[0].Text;
      eco2matricula.Text := dmFacturador.qafiliados.Fields[1].Text;
    end
  end;
end;

procedure TFfacturador.eco2mediconombreKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    eco2receta.SetFocus;
  end;

end;

procedure TFfacturador.eco2nombreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  form: tfbuscardatos;
begin
  if Key = VK_DOWN then
  BEGIN
    form := tfbuscardatos.Create(SELF);
    form.codigoCoseguro := Eco2.Text;
    form.TipoBusqueda := Afiliados;
    form.ShowModal;
    eco2nombre.Text := form.nombreSeleccionado;
    eco2afiliado.Text := form.numeroSeleccionado;

  END;
end;

procedure TFfacturador.eco2nombreKeyPress(Sender: TObject; var Key: Char);
var
  reg: tregistry;
  buttonSelected: Integer;
begin
  if (Key = #13) then
  begin
    reg := tregistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('\SOFTWARE\a+\', true);
    dmFacturador.AbrirConexion();
    dmFacturador.qafiliados.Close;
    dmFacturador.qafiliados.SQL.Text :=
      concat('select des_afiliado, nro_afiliado from osmaafiliado where cod_planos=:codigo and DES_AFILIADO=:NOMBRE');
    dmFacturador.qafiliados.ParamByName('codigo').AsString := Eco2.Text;
    dmFacturador.qafiliados.ParamByName('nombre').AsString := eco2nombre.Text;
    dmFacturador.qafiliados.Open;
    if dmFacturador.qafiliados.IsEmpty then
    Begin
      buttonSelected := messagedlg('Desea agregar afiliado', mtCustom,
        [mbok, mbno], 0);
      if buttonSelected = mrOK then
      BEGIN
        if ((eco2afiliado.Text <> '') AND (eco2nombre.Text <> '')) then
        begin
          if dmFacturador.tranafiliados.InTransaction then
          begin
            dmFacturador.tranafiliados.Rollback;
          end;
          dmFacturador.qiafiliados.Database := dmFacturador.getConexion;
          dmFacturador.dataafiliados.DataSet := dmFacturador.qiafiliados;
          dmFacturador.qiafiliados.Transaction := dmFacturador.tranafiliados;
          dmFacturador.qiafiliados.Close;
          dmFacturador.qiafiliados.SQL.Clear;

          dmFacturador.qiafiliados.Close;
          dmFacturador.qiafiliados.SQL.Text :=
            concat('INSERT INTO OSMAAFILIADO (COD_PLANOS, NRO_AFILIADO, DES_AFILIADO, NRO_DOCUMENTO, SEXO, PARENTESCO, FECHA_NAC)',
            'VALUES (:codigo, :numero, :nombre, 0, ''M'', ''T'', ''1899-12-30'')');

          dmFacturador.qiafiliados.ParamByName('codigo').AsString := Eco2.Text;
          dmFacturador.qiafiliados.ParamByName('numero').AsString :=
            eco2afiliado.Text;
          dmFacturador.qiafiliados.ParamByName('nombre').AsString :=
            eco2nombre.Text;
          dmFacturador.qiafiliados.Open;
          dmFacturador.tranafiliados.Commit;
        end;
      end;
      if eco2afiliado.Text = '' then
      begin
        showmessage('Inserte Numero de afiliado');
      end;

      if eco2nombre.Text = '' then
      begin
        showmessage('Inserte Nombre de afiliado');
      end;
    End;
    if dmFacturador.qafiliados.RecordCount = 1 then
    Begin
      eco2nombre.Text := dmFacturador.qafiliados.Fields[0].Text;
      eco2afiliado.Text := dmFacturador.qafiliados.Fields[1].Text;
    end
  end;
end;

procedure TFfacturador.eco2recetaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    dtfeccoseguro2.SetFocus;
  end;

end;

procedure TFfacturador.eco1nombreEnter(Sender: TObject);
begin
  eco1nombre.Color := clmoneygreen;
end;

procedure TFfacturador.eco1nombreExit(Sender: TObject);
begin
  eco1nombre.Color := clwhite;
end;

procedure TFfacturador.eco1nombreKeyPress(Sender: TObject; var Key: Char);

begin
  if Key = #13 then
  begin
    ECO1MATRICULA.SetFocus;
  end;

end;

procedure TFfacturador.eco1nombremedicoEnter(Sender: TObject);
begin
  eco1nombremedico.Color := clmoneygreen;
end;

procedure TFfacturador.eco1nombremedicoExit(Sender: TObject);
begin
  eco1nombremedico.Color := clwhite;
end;

procedure TFfacturador.eco1nombremedicoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    eco1receta.SetFocus;
  end;
end;

procedure TFfacturador.eco1recetaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    dtfeccoseguro.SetFocus;
  end;
end;

procedure TFfacturador.eco2afiliadoChange(Sender: TObject);
var
  reg: tregistry;
  buttonSelected: Integer;
  s1, s2: tstringlist;
begin
  reg := tregistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.OpenKey('\SOFTWARE\a+\', true);
  dmFacturador.AbrirConexion();
  dmFacturador.qafiliados.Close;
  dmFacturador.qafiliados.SQL.Text :=
    concat('select des_afiliado, nro_afiliado from osmaafiliado where cod_planos=:codigo AND nro_afiliado=:numero');
  if Ticket.cod_afiliadoplanos = '' then
  begin
    dmFacturador.qafiliados.ParamByName('codigo').AsString := Eco2.Text;
  end;
  if Ticket.cod_afiliadoplanos <> '' then
  begin
    dmFacturador.qafiliados.ParamByName('codigo').AsString :=
      Ticket.cod_afiliadoplanos;
  end;

  dmFacturador.qafiliados.ParamByName('numero').AsString := eco2afiliado.Text;
  dmFacturador.qafiliados.Open;

  if dmFacturador.qafiliados.RecordCount = 1 then
  Begin
    s1 := tstringlist.Create;
    s1.Text := dmFacturador.qafiliados.Fields[0].Text;

    s2 := tstringlist.Create;
    s2.CommaText := s1.Text;
    eco2apellido.Text := s2[0];
    eco2nombre.Text := s2[1];
    eco2matricula.SetFocus;
  end;
end;

procedure TFfacturador.eco2afiliadoEnter(Sender: TObject);
begin
  eco2afiliado.Color := clmoneygreen;
end;

procedure TFfacturador.eco2afiliadoExit(Sender: TObject);
begin
  eco2afiliado.Color := clwhite;
end;

procedure TFfacturador.eco2afiliadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  form: tfbuscardatos;
  s1, s2: tstringlist;
begin
  if Key = VK_DOWN then
  BEGIN
    form := tfbuscardatos.Create(SELF);
    if Ticket.cod_afiliadoplanos = '' then
    begin
      form.codigoCoseguro := Eco2.Text;
    end;
    if Ticket.cod_afiliadoplanos <> '' then
    begin
      form.codigoCoseguro := Ticket.cod_afiliadoplanos;
    end;

    form.TipoBusqueda := Afiliados;
    form.ShowModal;

    if ((form.nombreSeleccionado <> '') or (form.nombreSeleccionado <> '')) then
    begin
      s1 := tstringlist.Create;
      s1.Text := form.nombreSeleccionado;

      s2 := tstringlist.Create;
      s2.CommaText := s1.Text;

      ECO1AFILIADO.Text := form.numeroSeleccionado;

      eco2apellido.Text := s2[0];
      eco2nombre.Text := s2[1];
    end;

  END;
end;

procedure TFfacturador.eco2afiliadoKeyPress(Sender: TObject; var Key: Char);
var
  reg: tregistry;
  buttonSelected: Integer;
  s1, s2: tstringlist;
begin
  if ((Key = #13)) then
  begin
    reg := tregistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('\SOFTWARE\a+\', true);
    dmFacturador.AbrirConexion();
    dmFacturador.qafiliados.Close;
    dmFacturador.qafiliados.SQL.Text :=
      concat('select des_afiliado, nro_afiliado from osmaafiliado where cod_planos=:codigo AND nro_afiliado=:numero');
    dmFacturador.qafiliados.ParamByName('codigo').AsString := Eco2.Text;
    dmFacturador.qafiliados.ParamByName('numero').AsString := eco2afiliado.Text;
    dmFacturador.qafiliados.Open;

    if dmFacturador.qafiliados.RecordCount = 1 then
    Begin
      s1 := tstringlist.Create;
      s1.Text := dmFacturador.qafiliados.Fields[0].Text;

      s2 := tstringlist.Create;
      s2.CommaText := s1.Text;
      eco2apellido.Text := s2[0];
      eco2nombre.Text := s2[1];
      eco2matricula.SetFocus;
    end;
    if dmFacturador.qafiliados.IsEmpty then
    Begin
      buttonSelected :=
        messagedlg('Afiliado inexistente, complete datos para agregarlo',
        mtCustom, [mbok, mbno], 0);
      if buttonSelected = mrOK then
      BEGIN
        eco2apellido.Enabled := true;
        eco2nombre.Enabled := true;
        eco2apellido.SetFocus;
      END;
    End;

  end;
end;

procedure TFfacturador.ECO1MATRICULAChange(Sender: TObject);
var
  key:Char;
begin


end;

procedure TFfacturador.ECO1MATRICULAEnter(Sender: TObject);
begin
  ECO1MATRICULA.Color := clmoneygreen;
end;

procedure TFfacturador.ECO1MATRICULAExit(Sender: TObject);
begin
  ECO1MATRICULA.Color := clwhite;
end;

procedure TFfacturador.ECO1MATRICULAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  form: tfbuscardatos;
  s1, s2: tstringlist;
begin
  if Key = VK_DOWN then
  BEGIN
    FORM:=tfbuscardatos.Create(SELF);
  FORM.codigoCoseguro:=eco1.Text;
  form.TipoBusqueda:=Medicos;
  form.ShowModal;
   if ((form.nombreSeleccionado<>'') or (form.nombreSeleccionado<>''))  then
      begin
      s1 := TStringList.Create;
      s1.Text:=form.nombreSeleccionado;

      s2 := TStringList.Create;
      s2.CommaText := s1.Text;

      ECO1MATRICULA.Text:=form.numeroSeleccionado;

      eco1apellidomedico.Text:=s2[0];

      eco1nombremedico.Text:=s2[1];
      ECO1MATRICULAChange(Sender);
      end;
  END;

end;

procedure TFfacturador.ECO1MATRICULAKeyPress(Sender: TObject; var Key: Char);

begin
if (Key=#13) then
begin

   if Length(pchar(trim(Eco1MATRICULA.Text))) > 0 then
  begin
    buscarMedico(eco1,Eco1matricula,eco1nombremedico,eco1apellidomedico);
    validarMedico(eco1matricula,eco1nombremedico,eco1apellidomedico);
    exit;
  end;

  esMedicoValido:= true;
  eco1receta.SetFocus;

end;

end;

procedure TFfacturador.EosChange(Sender: TObject);
var
  MAR_OBRASOCIAL: string;
  buttonSelected: Integer;
  form: TFdatos;

begin

  Ticket.codigo_seguridad := '';
  Ticket.documento := '';
  MAR_OBRASOCIAL := 'O';
  dmFacturador.AbrirConexion();
  dmFacturador.qpanel2.Close;
  dmFacturador.qpanel2.SQL.Clear;
  dmFacturador.qpanel2.SQL.Text :=
    concat(' select NOM_PLANOS, codigo_validador, codigo_os_validador, codigo_plan_validador, COD_AFIL_PLANOS, can_diasvalidez, ',
    ' mar_pideinfoadicional, mar_pidedocumento from osmaplanesos where cod_planos=:CODIGO  AND MAR_OBRASOCIAL=:MAR_OBRASOCIAL   and mar_utilizados=''S'' ');

  dmFacturador.qpanel2.ParamByName('codigo').AsString := Eos.Text;
  dmFacturador.qpanel2.ParamByName('mar_obrasocial').AsString := MAR_OBRASOCIAL;
  dmFacturador.qpanel2.Open;
  los.Text := dmFacturador.qpanel2.Fields[0].Text;
  codigo_validador := dmFacturador.qpanel2.Fields[1].Text;
  codigo_os_validador := dmFacturador.qpanel2.Fields[2].Text;
  Ticket.codigo_planos_validador := dmFacturador.qpanel2.Fields[3].Text;
  Ticket.cod_afiliadoplanos := dmFacturador.qpanel2.Fields[4].Text;
  Ticket.dias_validez := dmFacturador.qpanel2.Fields[5].Text;
  Ticket.info_adicional := dmFacturador.qpanel2.Fields[6].Text;
  Ticket.pide_dni := dmFacturador.qpanel2.Fields[7].Text;
  if los.Text <> '' then
  Begin

    if application.MessageBox(' Tratamiento Prolongado? ', 'Tratamiento',
      MB_YESNO) = IDYES then
    BEGIN
      Ltratamiento.Caption := 'PROLONGADO';
      Ticket.codigo_tratamiento := 'P';
    END
    ELSE

    BEGIN
      Ltratamiento.Caption := 'NORMAL';
      Ticket.codigo_tratamiento := 'N';
    END;

    if Ticket.pide_dni = 'S' then
    BEGIN
      form := TFdatos.Create(SELF);
      form.SetTicket(Ticket);
      form.ShowModal;
      form.DisposeOf;

    END;

    if not dmFacturador.qpanel2.IsEmpty then
    begin
      Ticket.codigo_OS := Eos.Text;
      eafiliado.SetFocus;
      Gfacturador.Columns.Items[11].Visible := true;
    end;
    if not Gfacturador.DataSource.DataSet.IsEmpty then
    begin
      if codigo_validador <> '' then
      begin
        BVALIDAR.Enabled := true;
      end;
    end;

  End;
  if not dmFacturador.qpanel2.IsEmpty then
  begin
    if not Gfacturador.DataSource.DataSet.IsEmpty then
    begin
      reos;

      DESCOBER.Click;
      eafiliado.SetFocus;
    end;
  end;
  if dmFacturador.qpanel2.IsEmpty then
  begin
    Gfacturador.Columns.Items[11].Visible := false;
    if not Gfacturador.DataSource.DataSet.IsEmpty then
    begin
      reosempty;
      ticket.codigo_OS:='';
    end;

  end;

end;

procedure TFfacturador.eosdiagnosticoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    eosreceta.SetFocus;
  end;
end;

procedure TFfacturador.EosEnter(Sender: TObject);

begin
  if ticket.turnero = 'S' then
    lblLeyendaTurno.Visible:= true;
  

  Eos.Color := clmoneygreen;
end;

procedure TFfacturador.EosExit(Sender: TObject);

begin
  Eos.Color := clwhite;
  lblLeyendaTurno.Visible:= false; 
end;

procedure TFfacturador.EosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  form: tfbuscaros;
begin
  if Key = VK_DOWN then
  BEGIN
    form := tfbuscaros.Create(SELF);
    form.ShowModal;
    Eos.Text := form.codObraSocial;
    form.DisposeOf;
  END;
  if Key = vk_return then
  begin
    if los.Text <> '' then
    begin
      eafiliado.SetFocus;
    end;
    if los.Text = '' then
    begin
      pgCoberturas.TabIndex := 1;
      Eco1.SetFocus;
    end;
  end;
end;



procedure TFfacturador.EosmatriculaChange(Sender: TObject);
var
  key:Char;
begin
 key:= #13;



end;

procedure TFfacturador.EosmatriculaEnter(Sender: TObject);
var
  prompt:Integer;
begin
  Eosmatricula.Color := clmoneygreen;
  {
  // Si tenemos un afiliado de pami ofrecemos el servicio de consulta de recetas
  if ((eafiliado.Text <>'') and (Eos.Text = 'PAM') and(eosapellido.Text <> '') and (eosnombre.Text <>''))  then
  begin
    prompt := MensajeDLG('¿Desea consultar las recetas electronicas del afiliado?','Consulta de recetas por afiliado',mtConfirmation,[mbYes, mbNo]);

    // Si el usuario contesto que si lo mandamos a consultar las recetas
    if prompt = mrYes then
      consultarRecetasElectronicas;

  end;
    }


end;

procedure TFfacturador.EosmatriculaExit(Sender: TObject);
begin
  Eosmatricula.Color := clwhite;


end;

procedure TFfacturador.EosmatriculaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  form: tfbuscardatos;
  s1, s2: tstringlist;

begin
  if Key = VK_DOWN then
  BEGIN
     FORM:=tfbuscardatos.Create(SELF);
  FORM.codigoCoseguro:=Eos.Text;
  form.TipoBusqueda:=Medicos;
  form.ShowModal;
   if ((form.nombreSeleccionado<>'') or (form.nombreSeleccionado<>''))  then
      begin
      s1 := TStringList.Create;
      s1.Text:=form.nombreSeleccionado;

      s2 := TStringList.Create;
      s2.CommaText := s1.Text;

      eosmatricula.Text:=form.numeroSeleccionado;

      eosmedicoapellido.Text:=s2[0];

      eosmediconombre.Text:=s2[1];
      EosmatriculaKeyPress(Sender,enterKey);
      end;

  END;

end;

procedure TFfacturador.EosmatriculaKeyPress(Sender: TObject; var Key: Char);

begin
  if (Key = #13) then
  begin
     if length(pchar(trim(Eosmatricula.Text))) > 1 then
  begin
    buscarMedico(eos,Eosmatricula,EOSMEDICONOMBRE,eosmedicoAPELLIDO);
    validarMedico(Eosmatricula,EOSMEDICONOMBRE,eosmedicoAPELLIDO);

  end;

     exit;

  end;

end;

procedure TFfacturador.eosmedicoAPELLIDOEnter(Sender: TObject);
begin
  eosmedicoAPELLIDO.Color := clmoneygreen;
end;

procedure TFfacturador.eosmedicoAPELLIDOExit(Sender: TObject);
begin
    eosmedicoAPELLIDO.Color := clwhite;
    eosmediconombre.SetFocus;

end;

procedure TFfacturador.eosmedicoAPELLIDOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

VAR
  form: tfbuscardatos;
begin
  if Key = VK_DOWN then
  BEGIN
    form := tfbuscardatos.Create(SELF);
    form.codigoCoseguro := Eos.Text;
    form.TipoBusqueda := Medicos;
    form.ShowModal;
    Eosmatricula.Text := form.numeroSeleccionado;
    eosmedicoAPELLIDO.Text := form.nombreSeleccionado;
  END;

end;

procedure TFfacturador.eosmedicoAPELLIDOKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    EOSMEDICONOMBRE.SetFocus;
  end;
end;

procedure TFfacturador.EOSMEDICONOMBREEnter(Sender: TObject);
begin
  EOSMEDICONOMBRE.Color := clmoneygreen;
end;

procedure TFfacturador.EOSMEDICONOMBREExit(Sender: TObject);
begin
  eosmediconombre.Color := clwhite;
end;


procedure TFfacturador.EOSMEDICONOMBREKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    eosreceta.SetFocus;
  end;
end;

procedure TFfacturador.eosnombreEnter(Sender: TObject);
begin
  eosnombre.Color := clmoneygreen;

end;

procedure TFfacturador.eosnombreExit(Sender: TObject);
begin
  eosnombre.Color := clwhite;
end;

procedure TFfacturador.eosnombreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  form: tfbuscardatos;
begin
  if Key = VK_DOWN then
  BEGIN
    form := tfbuscardatos.Create(SELF);
    form.codigoCoseguro := Eos.Text;
    form.TipoBusqueda := Afiliados;
    form.ShowModal;
    eosnombre.Text := form.nombreSeleccionado;
    eafiliado.Text := form.numeroSeleccionado;

  END;
end;

procedure TFfacturador.eosnombreKeyPress(Sender: TObject; var Key: Char);
var
  fConsultaReceta:TFconsultaReceta;
begin
  if Key = #13 then
  begin
      



    eosmatricula.SetFocus;
  end;
end;

procedure TFfacturador.eosrecetaEnter(Sender: TObject);
begin
  eosreceta.Color := clmoneygreen;
end;

procedure TFfacturador.eosrecetaExit(Sender: TObject);
begin
  eosreceta.Color := clwhite;
end;

procedure TFfacturador.eosrecetaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    dtfecreceta.SetFocus;
  end;
end;

procedure TFfacturador.eosapellidoEnter(Sender: TObject);
begin
  eosapellido.Color := clmoneygreen;
end;

procedure TFfacturador.eosapellidoExit(Sender: TObject);
begin
  eosapellido.Color := clwhite;
end;

procedure TFfacturador.eosapellidoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    eosnombre.SetFocus;
  end;
end;

procedure TFfacturador.EvendedorChange(Sender: TObject);
var
  form: tfturnos;
  Key: Word;
begin
  if Ticket.autorizado = 'S' then
  BEGIN
    dmFacturador.qvendedor.Close;
    dmFacturador.qvendedor.SQL.Clear;
    dmFacturador.qvendedor.SQL.Append
      ('select nom_vendedor from vtmavendedor where cod_vendedor=:codigo_vendedor');
    dmFacturador.qvendedor.ParamByName('codigo_vendedor').AsString :=
      Evendedor.Text;
    dmFacturador.qvendedor.Open;
    Label1.Caption := dmFacturador.qvendedor.Fields[0].Text;

    if Label1.Caption <> '' then
    begin
      pgCoberturas.Enabled := true;
      Eos.Enabled := true;;
      Eco1.Enabled := true;
      Eco2.Enabled := true;
      ebusqueda.Enabled := true;
      bbuscar.Enabled := true;
      btnRecargos.Enabled:= True;
      bmodificable.Enabled := true;
      Eos.Color := clWINDOW;
      los.Color := clWINDOW;
      Eco1.Color := clWINDOW;
      Eco2.Color := clWINDOW;
      lco1.Color := clWINDOW;
      lco2.Color := clWINDOW;
      if Ticket.turnero = 'S' then
      BEGIN
        Ticket.turnoatencion := '0';
        lturno.Caption := '';


        
        frmTurnos.SetTicket(Ticket);
        frmTurnos.ShowModal;
        if Ticket.turnoatencion <> '' then
        BEGIN
          lturno.Caption := Ticket.turnoatencion;
        END;
      END;
      Evendedor.ReadOnly := true;
      if Label1.Caption <> '' then
      begin
        pgcoberturas.Enabled;
        Eos.SetFocus;
      end;

    end;

  END
  ELSE
  BEGIN
    dmFacturador.qvendedor.Close;
    dmFacturador.qvendedor.SQL.Clear;
    dmFacturador.qvendedor.SQL.Append
      ('select nom_vendedor from vtmavendedor where cod_vendedor=:codigo_vendedor');
    dmFacturador.qvendedor.ParamByName('codigo_vendedor').AsString :=
      Evendedor.Text;
    dmFacturador.qvendedor.Open;
    Label1.Caption := dmFacturador.qvendedor.Fields[0].Text;
  END;

  if Label1.Caption = '' then
  begin
    pgCoberturas.Enabled := false;
    Eos.Enabled := false;
    Eco1.Enabled := false;
    Eco2.Enabled := false;
    ebusqueda.Enabled := false;
    bbuscar.Enabled := false;
    btnRecargos.Enabled:= False;
    bmodificable.Enabled := false;
    Eos.Color := clmenu;
    los.Color := clmenu;
    Eco1.Color := clmenu;
    Eco2.Color := clmenu;
    lco1.Color := clmenu;
    lco2.Color := clmenu;

  end;
end;

procedure TFfacturador.EvendedorEnter(Sender: TObject);
var
  form2: tfpass;

begin
  if Label1.Caption = '' then
  begin

    Evendedor.Color := clmoneygreen;
    Ticket.autorizado := 'N';

    form2 := tfpass.Create(SELF);

    form2.SetTicket(Ticket);
    form2.ShowModal;
    Evendedor.Text := Ticket.cod_vendedor;

    if Ticket.autorizado = 'N' THEN
    BEGIN
      Blimpiartodo.Click;

    END;

  end;
  if Label1.Caption <> '' then
  begin


    Eos.SetFocus;
  end;
end;

procedure TFfacturador.EvendedorExit(Sender: TObject);
begin
  Evendedor.Color := clwhite;
end;

procedure TFfacturador.EvendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  { if Key = vk_return then
    begin

    end; }
end;

procedure TFfacturador.EvendedorKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8]) then
  begin
    Key := #0;
  end;

end;

procedure TFfacturador.FormActivate(Sender: TObject);
begin
  ActiveControl.SetFocus;

end;

procedure TFfacturador.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin

  pinformativo.Top := NewHeight - 55;
  pinformativo.Clientwidth := NewWidth - 20;
  // bcancelar.Top:=newheight-75;
  Blimpiartodo.Top := NewHeight - 80;
  bprecio.Top := NewHeight - 80;
  bvale.Top := NewHeight - 80;
  BVALIDAR.Top := NewHeight - 80;
  bstockonline.Top := NewHeight - 80;
  bdetalle.Top := NewHeight - 80;
  imprimir.Top := NewHeight - 80;
  DESCOBER.Top := NewHeight - 80;
  Label44.Top := NewHeight - 104;
  descuentoos.Top := NewHeight - 109;
  Label45.Top := NewHeight - 104;
  descuentoco1.Top := NewHeight - 109;
  Label46.Top := NewHeight - 104;
  descuentoco2.Top := NewHeight - 109;
  Label27.Top := NewHeight - 129;
  importetotal.Top := NewHeight - 135;
  Label28.Top := NewHeight - 129;
  descuentos.Top := NewHeight - 135;
  Label29.Top := NewHeight - 129;
  netoacobrar.Top := NewHeight - 135;
  Label18.Top := NewHeight - 129;
  importegentilezas.Top := NewHeight - 135;
  Label34.Top := NewHeight - 104;
  descuentoaplus.Top := NewHeight - 109;
  Gfacturador.Height := NewHeight - 460;
  Gfacturador.Clientwidth := NewWidth - 10;

end;


procedure TFfacturador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmFacturador.DPRINCIPAL.Active = true then
  begin
    dmFacturador.DPRINCIPAL.EmptyDataSet;

  end;
  if dmFacturador.DPRINCIPAL.Active = true then
  begin
    dmFacturador.dsecundario.Close;
  end;
  blimpiar.Click;
  blimpiartodo.Click;
  ModalResult := mrCancel;

end;

procedure TFfacturador.FormCreate(Sender: TObject);
begin
  registroSistema:= TRegistryHelper.Create;

  cargarRecargoHospital;
  medicoService:= TMedicoService.Create;
  afiliadoService:= TAfiliadoService.Create;

  //--------------------- AUMENTO A HOSPITALES -------------//

  
        if not Assigned(frmTurnos) then
        begin
          frmTurnos := tfturnos.Create(SELF);
        end;
        

  
  Ticket := TTicket.Create;

  // Inicializo el recargo por defecto es 0%
  calcuPrecio:= TCalculadoraPrecio.Create(0);
  esMedicoNuevo:= False;
  if Label1.Caption <> '' then
  begin
    Eos.Enabled := true;;
    Eco1.Enabled := true;
    Eco2.Enabled := true;

  end;
  if Label1.Caption = '' then
  begin
    Eos.Enabled := false;
    Eco1.Enabled := false;
    Eco2.Enabled := false;

  end;

end;

procedure TFfacturador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F6 then
  begin
    if imprimir.Enabled = true then
    begin
      imprimir.Click;
    end;
  end;
  if Key = vk_F7 then
  begin
    if DESCOBER.Enabled = true then
    begin
      DESCOBER.Click;
    end;
  end;
  { if key=vk_F5 then
    begin
    if bvalidar.Enabled=true then
    begin
    bvalidar.Click;
    end;
    end; }

  if Key = vk_F4 then
  begin
    if bvale.Enabled = true then
    begin
      bvale.Click;
    end;
  end;
  if Key = vk_F3 then
  begin
    if bprecio.Enabled = true then
    BEGIN
      bprecio.Click;

    END;
  end;
  if Key = vk_F2 then
  begin
    if Blimpiartodo.Enabled = true then
    BEGIN
      Blimpiartodo.Click;

    END;
  end;
  if Key = vk_f1 then
  begin
    if bmodificable.Enabled = true then
    begin
      bmodificable.Click;
    end;
  end;

  

  if Key = vk_f8 then
  begin
    lturnoClick(lturno);
  end;
  

  if Key = vk_f12 then
  begin
    bstockonline.Click;
  end;
  if Key = vk_f11 then
  begin
    bdetalle.Click;
  end;

end;

procedure TFfacturador.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Key := #0;
end;

procedure TFfacturador.FormShow(Sender: TObject);
var
  reg: tregistry;

begin
enterKey:=#13;
  dmFacturador.AbrirConexion();
  if dmFacturador.tpanel1.InTransaction then
  begin
    dmFacturador.tpanel1.Rollback;
  end;

  dmFacturador.qcomprobante.Close;
  dmFacturador.qcomprobante.SQL.Clear;
  dmFacturador.qcomprobante.SQL.Append
    ('select TIP_COMPROBANTE, TIP_IMPRE from vtmatipcomprob where tip_comprobante like :LETRA  AND MAR_TIPOPROCESO=''F'' order by 1 desc');
  dmFacturador.qcomprobante.ParamByName('LETRA').AsString :=
    '%' + dmFacturador.getPuntoVenta() + '%';
  dmFacturador.qcomprobante.Open;

  if dmFacturador.tcuit.InTransaction then
  begin
    dmFacturador.tcuit.Rollback;
  end;

  dmFacturador.qcuit.Close;
  dmFacturador.qcuit.SQL.Clear;
  dmFacturador.qcuit.SQL.Append
    ('select nro_cuit from sumasucursal where nro_sucursal=:sucursal');
  dmFacturador.qcuit.ParamByName('sucursal').AsString := Ticket.sucursal;
  dmFacturador.qcuit.Open;
  Ticket.cuitsucursal := dmFacturador.qcuit.Fields[0].Text;

  if Label1.Caption <> '' then
  begin
    Eos.Enabled := true;;
    Eco1.Enabled := true;
    Eco2.Enabled := true;

  end;
  if Label1.Caption = '' then
  begin
    Eos.Enabled := false;
    Eco1.Enabled := false;
    Eco2.Enabled := false;
  end;

  dmFacturador.qcomprobante.First;
  while not dmFacturador.qcomprobante.Eof do
  begin
    combotipo.Items.Add(dmFacturador.qcomprobante.Fields[0].Text);
    dmFacturador.qcomprobante.Next;
  end;

  reg := tregistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  reg.OpenKey(RegKey, true);
  dmFacturador.basecfg.Connected := false;

  dmFacturador.basecfg.DatabaseName := reg.ReadString('rutabasecfg');

  dmFacturador.basecfg.Params.Values['User_Name'] := 'SYSDBA';
  dmFacturador.basecfg.Params.Values['Password'] := 'nmpnet';
  dmFacturador.basecfg.LoginPrompt := false;
  dmFacturador.qcaja.Close;

  dmFacturador.qcaja.SQL.Clear;
  dmFacturador.qcaja.SQL.Add
    ('select NRO_CAJA FROM  msmapuesto  where ide_puesto=:puesto');
  dmFacturador.qcaja.ParamByName('puesto').AsString := Ticket.nombre_terminal;
  dmFacturador.qcaja.Open;
  if NOT dmFacturador.qcaja.IsEmpty THEN
  begin
    Ticket.nro_caja := dmFacturador.qcaja.FieldByName('nro_caja').AsString;
  end;

  dmFacturador.ibqcaja.Close;
  dmFacturador.ibqcaja.SQL.Clear;
  dmFacturador.ibqcaja.SQL.Text :=
    concat('SELECT DISTINCT c.NRO_CAJA, a.des_caja, MAX(FEC_OPERACIONES) FROM cjmaapertura c, cjmacaja a WHERE c.nro_caja=a.nro_caja and c.nro_sucursal=a.nro_sucursal and c.nro_caja=:caja and MAR_CAJA=''S'' GROUP BY 1,2');
  dmFacturador.ibqcaja.ParamByName('caja').AsString := Ticket.nro_caja;
  dmFacturador.ibqcaja.Open;
  if not dmFacturador.ibqcaja.IsEmpty then
  begin
    Ticket.fec_operativa := dmFacturador.ibqcaja.Fields[2].AsDateTime;
  end;
  pinformativo.Caption := ('Nombre Terminal:' + '  ' + Ticket.nombre_terminal +
    '       ' + 'Nombre de Caja:' + '  ' + (dmFacturador.ibqcaja.Fields[1].Text)
    + ' ' + Ticket.nro_caja + '       ' + 'Fecha Operativa:' + '  ' +
    datetostr(Ticket.fec_operativa));

  combotipo.ItemIndex := 0;
  pgCoberturas.ActivePageIndex := 0;
  dtfecreceta.DateTime := now;
  Cosprovincia.ItemIndex := strtoint(Ticket.region);
  pgCoberturas.ActivePageIndex := 1;

  dtfeccoseguro.DateTime := now;
  cco1provincia.ItemIndex := strtoint(Ticket.region);
  cco2provincia.ItemIndex:= strtoint(Ticket.region);
  pgCoberturas.ActivePageIndex := 0;
  if dmFacturador.ibqcaja.Fields[1].Text = '' then
  BEGIN
    showmessage('PUESTO SIN CAJA ASIGNADA IMPOSIBLE CONTINUAR');
    application.Terminate;
  END;

  if dmFacturador.DPRINCIPAL.Active = true then
  begin
    dmFacturador.DPRINCIPAL.EmptyDataSet;

  end;
  if dmFacturador.DPRINCIPAL.Active = true then
  begin
    dmFacturador.dsecundario.Close;
  end;

  combotipo.SetFocus;

  if Ticket.turnero <> 'S' then
  BEGIN
    lturno.Visible := false;
  END;

  // Asigno el recargo a la calculadora
  calcuPrecio.Recargo:= strToFloat(Ticket.recargo);

end;

procedure TFfacturador.GfacturadorCellClick(Column: TColumn);
var
  form2: tfpass;
begin

  if Column.FieldName = 'GENTILEZA' then
  begin
    Ticket.autorizado := 'N';
    Ticket.jerarquia := '';
    form2 := tfpass.Create(SELF);

    form2.SetTicket(Ticket);
    form2.ShowModal;
    if Ticket.autorizado = 'S' THEN
    BEGIN
      if Ticket.jerarquia = '0' then
      begin
        dmFacturador.DPRINCIPAL.Edit;
        dmFacturador.DPRINCIPALModificado.AsBoolean := true;
        Gfacturador.Columns.Items[22].ReadOnly := false;
        Gfacturador.SetFocus;
        Gfacturador.Selectedindex := 22;
        Gfacturador.EditorMode := true;

      end;
      if Ticket.jerarquia <> '0' then
      begin
        showmessage('NO AUTORIZADO');
        Gfacturador.Columns.Items[22].ReadOnly := true;
      end;

    END;

  end
  // Tú código aquí
  else if Column.FieldName <> 'GENTILEZA' then
  begin
    Gfacturador.Columns.Items[22].ReadOnly := true;
  end;
  // Más código

end;

procedure TFfacturador.GfacturadorExit(Sender: TObject);
var
  Key: Char;
begin

  if not Gfacturador.DataSource.DataSet.IsEmpty then
  begin
    Key := #13;
    Gfacturador.OnKeyPress(SELF, Key);

  end;
  limiteos;
  limiteco1;
end;

procedure TFfacturador.GfacturadorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  with DBGridExt(TDBGrid(Sender)) do
  begin
    if ((Key = VK_DOWN) and (Row = RowCount - 1)) then
    begin
      Abort
    end;
    if ((Key = vk_insert) and (Row = RowCount - 1)) then
    begin
      Abort
    end;
  end;

  if Key = vk_delete then
  begin
    Gfacturador.SelectedRows.Delete;
    dmFacturador.DPRINCIPAL.Delete;
  end;

end;

procedure TFfacturador.GfacturadorKeyPress(Sender: TObject; var Key: Char);
var
  descuento: double;
  registrogrilla: Integer;
  archivo: TextFile;
  ruta_archivo: string;
  unaLinea: String;
  reg: tregistry;
  Fecha: TDate;
  Dia, Mes, Anio: Word;
begin
  if (Key = #45) Then
  BEGIN
    Abort;
  END;
  if (Key = #13) then
    if Gfacturador.Fields[8].AsString <> '' then
    begin
      if Ticket.codigo_validador <> 'G' then
        registrogrilla := Gfacturador.DataSource.DataSet.RecNo;
      begin
        dmFacturador.DPRINCIPAL.Edit;
        if (Gfacturador.Fields[3].AsString = '') and
          (Gfacturador.Fields[8].AsString <> '') then
        begin

          dmFacturador.DPRINCIPALCANTIDAD.Asinteger := 1;
        end;
        if Gfacturador.Fields[3].AsString = '0' then
        begin
          dmFacturador.DPRINCIPALCANTIDAD.Asinteger := 1;
        end;
        if Gfacturador.Fields[3].Asinteger > 999 then
        begin
          showmessage('CANTIDAD MAYOR A 999 CORRIGIENDO...');
          dmFacturador.DPRINCIPALCANTIDAD.Asinteger := 999;

        end;

        dmFacturador.DPRINCIPAL.Edit;
        if Gfacturador.Fields[3].AsString <> '' then
        begin
          descuento := 0;
          descuento := Gfacturador.Fields[11].Asfloat + Gfacturador.Fields[12].Asfloat + Gfacturador.Fields[13].Asfloat + Gfacturador.Fields[22].Asfloat + Gfacturador.Fields[29].Asfloat;

          if descuento > 100 then
          begin
            descuento := 100;
          end;
          dmFacturador.dprincipalporcentaje.Asfloat := descuento;
          dmFacturador.DPRINCIPALCANTIDAD.Asinteger := Gfacturador.Fields[3].Asinteger;
          setroundmode(rmNearest);
          dmFacturador.dprincipalPrecio_Total.Asfloat := roundto((dmFacturador.DPRINCIPALCANTIDAD.Asfloat *dmFacturador.dprincipalPRECIO.Asfloat), -2);

          dmFacturador.dprincipalDESCUENTOS.Asfloat := roundto((dmFacturador.DPRINCIPALCANTIDAD.Asfloat * dmFacturador.dprincipalPRECIO.Asfloat) *    ((Gfacturador.Fields[7].Asfloat) / 100), -2);

          dmFacturador.dprincipalprecio_totaldesc.Asfloat := roundto((dmFacturador.dprincipalPrecio_Total.Asfloat - dmFacturador.dprincipalDESCUENTOS.Asfloat), -2);
          dmFacturador.dprincipalDESCUENTOSOS.Asfloat := roundto((dmFacturador.DPRINCIPALCANTIDAD.Asfloat * dmFacturador.dprincipalPRECIO.Asfloat) * ((Gfacturador.Fields[11].Asfloat) / 100), -2);
          dmFacturador.dprincipalDESCUENTOco1.Asfloat := roundto((dmFacturador.DPRINCIPALCANTIDAD.Asfloat * dmFacturador.dprincipalPRECIO.Asfloat) * ((Gfacturador.Fields[12].Asfloat) / 100), -2);
          dmFacturador.dprincipalDESCUENTOco2.Asfloat := roundto((dmFacturador.DPRINCIPALCANTIDAD.Asfloat * dmFacturador.dprincipalPRECIO.Asfloat) * ((Gfacturador.Fields[13].Asfloat) / 100), -2);
          dmFacturador.DPRINCIPALIMPORTEGENT.Asfloat := (dmFacturador.DPRINCIPALCANTIDAD.Asfloat * dmFacturador.dprincipalPRECIO.Asfloat) * ((Gfacturador.Fields[22].Asfloat) / 100);
          dmFacturador.DPRINCIPALDESCUENTOAPLUS.Asfloat := (dmFacturador.DPRINCIPALCANTIDAD.Asfloat * dmFacturador.dprincipalPRECIO.Asfloat) * ((Gfacturador.Fields[29].Asfloat) / 100);

         //------------------------------------------------------------- 17/05/2022-------------HOSPITALES-//

         if dmfacturador.DPRINCIPALhosp.AsString='N' then
             BEGIN
              if (TICKET.codigo_OS='ZBI') OR (TICKET.codigo_OS='ZBH') OR (TICKET.codigo_OS='ZA7')  OR (TICKET.codigo_OS='W14') OR (TICKET.codigo_OS='WVP') OR (TICKET.codigo_OS='WVR') OR (TICKET.codigo_OS='W15') OR (TICKET.codigo_OS='WVJ') OR (TICKET.codigo_OS='WVM') OR (TICKET.codigo_OS='WVD') OR (TICKET.codigo_OS='WVO') OR (TICKET.codigo_OS='WVG') OR (TICKET.codigo_OS='WVF') OR (TICKET.codigo_OS='WVH') OR (TICKET.codigo_OS='WVN') OR (TICKET.codigo_OS='WVE') OR (TICKET.codigo_OS='ZAE') OR (TICKET.codigo_OS='ZAF') OR (TICKET.codigo_OS='ZAG') OR (TICKET.codigo_OS='ZAI') OR (TICKET.codigo_OS='ZAL') OR (TICKET.codigo_OS='ZAM') OR (TICKET.codigo_OS='ZAN') OR (TICKET.codigo_OS='ZAO') OR (TICKET.codigo_OS='OFL') OR (TICKET.codigo_OS='OFN') OR (TICKET.codigo_OS='OFM') OR (TICKET.codigo_OS='OFK') OR (TICKET.codigo_OS='OFJ') OR (TICKET.codigo_OS='ZA2') OR (TICKET.codigo_OS='ZA3')   then
              BEGIN
              dmFacturador.dPRINCIPALprecio.AsString :=floattostr(dmFacturador.dPRINCIPALprecio.AsFloat*1.30);
              dmFacturador.dPRINCIPALhosp.AsString:='S';
              END;

              if (ticket.codigo_Co1='ZBI') OR (ticket.codigo_Co1='ZBH') OR (ticket.codigo_Co1='ZA7')  OR (ticket.codigo_Co1='W14') OR (ticket.codigo_Co1='WVP') OR (ticket.codigo_Co1='WVR') OR (ticket.codigo_Co1='W15') OR (ticket.codigo_Co1='WVJ') OR (ticket.codigo_Co1='WVM') OR (ticket.codigo_Co1='WVD') OR (ticket.codigo_Co1='WVO') OR (ticket.codigo_Co1='WVG') OR (ticket.codigo_Co1='WVF') OR (ticket.codigo_Co1='WVH') OR (ticket.codigo_Co1='WVN') OR (ticket.codigo_Co1='WVE') OR (ticket.codigo_Co1='ZAE') OR (ticket.codigo_Co1='ZAF') OR (ticket.codigo_Co1='ZAG') OR (ticket.codigo_Co1='ZAI') OR (ticket.codigo_Co1='ZAL') OR (ticket.codigo_Co1='ZAM') OR (ticket.codigo_Co1='ZAN') OR (ticket.codigo_Co1='ZAO') OR (ticket.codigo_Co1='OFL') OR (ticket.codigo_Co1='OFN') OR (ticket.codigo_Co1='OFM') OR (ticket.codigo_Co1='OFK') OR (ticket.codigo_Co1='OFJ') OR (ticket.codigo_Co1='ZA2') OR (ticket.codigo_Co1='ZA3')   then
              BEGIN
              dmFacturador.dPRINCIPALprecio.AsString :=floattostr(dmFacturador.dPRINCIPALprecio.AsFloat*1.30);
              dmFacturador.dPRINCIPALhosp.AsString:='S';
              END;

              if (ticket.codigo_Cos2='ZBI') OR (ticket.codigo_Cos2='ZBH') OR (ticket.codigo_Cos2='ZA7')  OR (ticket.codigo_Cos2='W14') OR (ticket.codigo_Cos2='WVP') OR (ticket.codigo_Cos2='WVR') OR (ticket.codigo_Cos2='W15') OR (ticket.codigo_Cos2='WVJ') OR (ticket.codigo_Cos2='WVM') OR (ticket.codigo_Cos2='WVD') OR (ticket.codigo_Cos2='WVO') OR (ticket.codigo_Cos2='WVG') OR (ticket.codigo_Cos2='WVF') OR (ticket.codigo_Cos2='WVH') OR (ticket.codigo_Cos2='WVN') OR (ticket.codigo_Cos2='WVE') OR (ticket.codigo_Cos2='ZAE') OR (ticket.codigo_Cos2='ZAF') OR (ticket.codigo_Cos2='ZAG') OR (ticket.codigo_Cos2='ZAI') OR (ticket.codigo_Cos2='ZAL') OR (ticket.codigo_Cos2='ZAM') OR (ticket.codigo_Cos2='ZAN') OR (ticket.codigo_Cos2='ZAO') OR (ticket.codigo_Cos2='OFL') OR (ticket.codigo_Cos2='OFN') OR (ticket.codigo_Cos2='OFM') OR (ticket.codigo_Cos2='OFK') OR (ticket.codigo_Cos2='OFJ') OR (ticket.codigo_Cos2='ZA2') OR (ticket.codigo_Cos2='ZA3')   then
              BEGIN
              dmFacturador.dPRINCIPALprecio.AsString :=floattostr(dmFacturador.dPRINCIPALprecio.AsFloat*1.30);
              dmFacturador.dPRINCIPALhosp.AsString:='S';
              END;

              if NOT ((TICKET.codigo_OS='ZBI') OR (TICKET.codigo_OS='ZBH') OR (TICKET.codigo_OS='ZA7')  OR (TICKET.codigo_OS='W14') OR (TICKET.codigo_OS='WVP') OR (TICKET.codigo_OS='WVR') OR (TICKET.codigo_OS='W15') OR (TICKET.codigo_OS='WVJ') OR (TICKET.codigo_OS='WVM') OR (TICKET.codigo_OS='WVD') OR (TICKET.codigo_OS='WVO') OR (TICKET.codigo_OS='WVG') OR (TICKET.codigo_OS='WVF') OR (TICKET.codigo_OS='WVH') OR (TICKET.codigo_OS='WVN') OR (TICKET.codigo_OS='WVE') OR (TICKET.codigo_OS='ZAE') OR (TICKET.codigo_OS='ZAF') OR (TICKET.codigo_OS='ZAG') OR (TICKET.codigo_OS='ZAI') OR (TICKET.codigo_OS='ZAL') OR (TICKET.codigo_OS='ZAM') OR (TICKET.codigo_OS='ZAN') OR (TICKET.codigo_OS='ZAO') OR (TICKET.codigo_OS='OFL') OR (TICKET.codigo_OS='OFN') OR (TICKET.codigo_OS='OFM') OR (TICKET.codigo_OS='OFK') OR (TICKET.codigo_OS='OFJ') OR (TICKET.codigo_OS='ZA2') OR (TICKET.codigo_OS='ZA3')  ) then
              BEGIN
              if not ((ticket.codigo_Co1='ZBI') OR (ticket.codigo_Co1='ZBH') OR (ticket.codigo_Co1='ZA7')  OR (ticket.codigo_Co1='W14') OR (ticket.codigo_Co1='WVP') OR (ticket.codigo_Co1='WVR') OR (ticket.codigo_Co1='W15') OR (ticket.codigo_Co1='WVJ') OR (ticket.codigo_Co1='WVM') OR (ticket.codigo_Co1='WVD') OR (ticket.codigo_Co1='WVO') OR (ticket.codigo_Co1='WVG') OR (ticket.codigo_Co1='WVF') OR (ticket.codigo_Co1='WVH') OR (ticket.codigo_Co1='WVN') OR (ticket.codigo_Co1='WVE') OR (ticket.codigo_Co1='ZAE') OR (ticket.codigo_Co1='ZAF') OR (ticket.codigo_Co1='ZAG') OR (ticket.codigo_Co1='ZAI') OR (ticket.codigo_Co1='ZAL') OR (ticket.codigo_Co1='ZAM') OR (ticket.codigo_Co1='ZAN') OR (ticket.codigo_Co1='ZAO') OR (ticket.codigo_Co1='OFL') OR (ticket.codigo_Co1='OFN') OR (ticket.codigo_Co1='OFM') OR (ticket.codigo_Co1='OFK') OR (ticket.codigo_Co1='OFJ') OR (ticket.codigo_Co1='ZA2') OR (ticket.codigo_Co1='ZA3'))   then
                BEGIN
                if not ((ticket.codigo_Cos2='ZBI') OR (ticket.codigo_Cos2='ZBH') OR (ticket.codigo_Cos2='ZA7') OR (ticket.codigo_Cos2='W14') OR (ticket.codigo_Cos2='WVP') OR (ticket.codigo_Cos2='WVR') OR (ticket.codigo_Cos2='W15') OR (ticket.codigo_Cos2='WVJ') OR (ticket.codigo_Cos2='WVM') OR (ticket.codigo_Cos2='WVD') OR (ticket.codigo_Cos2='WVO') OR (ticket.codigo_Cos2='WVG') OR (ticket.codigo_Cos2='WVF') OR (ticket.codigo_Cos2='WVH') OR (ticket.codigo_Cos2='WVN') OR (ticket.codigo_Cos2='WVE') OR (ticket.codigo_Cos2='ZAE') OR (ticket.codigo_Cos2='ZAF') OR (ticket.codigo_Cos2='ZAG') OR (ticket.codigo_Cos2='ZAI') OR (ticket.codigo_Cos2='ZAL') OR (ticket.codigo_Cos2='ZAM') OR (ticket.codigo_Cos2='ZAN') OR (ticket.codigo_Cos2='ZAO') OR (ticket.codigo_Cos2='OFL') OR (ticket.codigo_Cos2='OFN') OR (ticket.codigo_Cos2='OFM') OR (ticket.codigo_Cos2='OFK') OR (ticket.codigo_Cos2='OFJ') OR (ticket.codigo_Cos2='ZA2') OR (ticket.codigo_Cos2='ZA3')) then
                  begin
                   dmFacturador.dPRINCIPALprecio.AsString :=floattostr(dmFacturador.dPRINCIPALprecio.AsFloat);
                   dmFacturador.dPRINCIPALhosp.AsString:='N';
                  end;
                END;
              END;
          END;

          //---------------------------------------------------------------------------------------------------------------//
          arregladescuento;
          dmFacturador.DPRINCIPAL.Post;

        end;
        { if gfacturador.Fields[21].AsString='True' then
          begin
          if Gfacturador.Columns.Items[2].ReadOnly = false then
          begin

          Reg := TRegistry.Create;
          Reg.RootKey := HKEY_CURRENT_USER;
          Reg.OpenKey(regKey,true);
          Fecha := Date;
          DecodeDate(Fecha, Anio, Mes, Dia);
          ruta_archivo := Reg.ReadString('Reportes')+ticket.nombre_terminal+inttostr(mes)+inttostr(Anio)+'.txt';
          AssignFile( archivo, ruta_archivo );
          if FileExists( ruta_archivo ) then
          append( archivo )
          else
          rewrite( archivo );


          unalinea:='MODIFICACION -PRECIO NUEVO';
          unalinea:=unalinea+'|';
          unalinea:=unalinea+ticket.nom_vendedor+'|';
          unalinea:=unalinea+gfacturador.DataSource.DataSet.FieldByName('NOM_LARGO').AsString+'|';
          unalinea:=unalinea+gfacturador.DataSource.DataSet.FieldByName('PRECIO').AsString+'|';
          unalinea:=unalinea+datetimetostr(NOW)+'|';
          unaLinea:=unalinea+ #13 + #10;
          write (archivo , unaLinea );

          CloseFile(archivo);
          end;
          end; }

        Gfacturador.Columns.Items[2].ReadOnly := true;

        if Ticket.codigo_validador = 'G' then
        begin
          registrogrilla := Gfacturador.DataSource.DataSet.RecNo;
          begin
            dmFacturador.DPRINCIPAL.Edit;
            if (Gfacturador.Fields[3].AsString = '') and
              (Gfacturador.Fields[8].AsString <> '') then
            begin

              dmFacturador.DPRINCIPALCANTIDAD.Asinteger := 1;
            end;
            if Gfacturador.Fields[3].AsString = '0' then
            begin
              dmFacturador.DPRINCIPALCANTIDAD.Asinteger := 1;
            end;
            if Gfacturador.Fields[3].Asinteger > 999 then
            begin
              showmessage('CANTIDAD MAYOR A 999 CORRIGIENDO...');
              dmFacturador.DPRINCIPALCANTIDAD.Asinteger := 999;

            end;

            dmFacturador.DPRINCIPAL.Edit;
            if Gfacturador.Fields[3].AsString <> '' then
            begin
              descuento := 0;
              descuento := Gfacturador.Fields[11].Asfloat + Gfacturador.Fields[12].Asfloat + Gfacturador.Fields[13].Asfloat +Gfacturador.Fields[22].Asfloat+Gfacturador.Fields[29].Asfloat;
              if descuento > 100 then
              begin
                descuento := 100;
              end;
              dmFacturador.dprincipalporcentaje.Asfloat := descuento;
              dmFacturador.DPRINCIPALCANTIDAD.Asinteger := Gfacturador.Fields[3]
                .Asinteger;
              dmFacturador.dprincipalPrecio_Total.Asfloat :=dmFacturador.DPRINCIPALCANTIDAD.Asfloat * dmFacturador.dprincipalPRECIO.Asfloat;

              setroundmode(rmNearest);
              dmFacturador.dprincipalDESCUENTOS.Asfloat :=((dmFacturador.DPRINCIPALCANTIDAD.Asfloat * dmFacturador.dprincipalPRECIO.Asfloat) * ((Gfacturador.Fields[7].Asfloat) / 100));

              dmFacturador.dprincipalprecio_totaldesc.Asfloat := roundto((dmFacturador.dprincipalPrecio_Total.Asfloat - dmFacturador.dprincipalDESCUENTOS.Asfloat), -2);
              dmFacturador.dprincipalDESCUENTOSOS.Asfloat := ((dmFacturador.DPRINCIPALCANTIDAD.Asfloat *dmFacturador.dprincipalPRECIO.Asfloat) *((Gfacturador.Fields[11].Asfloat) / 100));
              dmFacturador.dprincipalDESCUENTOco1.Asfloat :=roundto((dmFacturador.DPRINCIPALCANTIDAD.Asfloat *dmFacturador.dprincipalPRECIO.Asfloat) *((Gfacturador.Fields[12].Asfloat) / 100), -2);
              dmFacturador.dprincipalDESCUENTOco2.Asfloat :=(dmFacturador.DPRINCIPALCANTIDAD.Asfloat *dmFacturador.dprincipalPRECIO.Asfloat) *((Gfacturador.Fields[13].Asfloat) / 100);
              dmFacturador.DPRINCIPALIMPORTEGENT.Asfloat :=(dmFacturador.DPRINCIPALCANTIDAD.Asfloat *dmFacturador.dprincipalPRECIO.Asfloat) *((Gfacturador.Fields[22].Asfloat) / 100);
              dmFacturador.DPRINCIPALDESCUENTOAPLUS.Asfloat := (dmFacturador.DPRINCIPALCANTIDAD.Asfloat * dmFacturador.dprincipalPRECIO.Asfloat) * ((Gfacturador.Fields[29].Asfloat) / 100);
              arregladescuento;
              dmFacturador.DPRINCIPAL.Post;

            end;

          end;
        end;
        ebusqueda.SetFocus;
        Gfacturador.DataSource.DataSet.RecNo := registrogrilla;
      end;
      if Gfacturador.Fields[8].AsString = '' then
      begin

        ebusqueda.SetFocus;
      end;

    end;
end;

procedure TFfacturador.archivomod;
var
  archivo: TextFile;
  ruta_archivo: string;
  unaLinea: String;
  reg: tregistry;
  Fecha: TDate;
  Dia, Mes, Anio: Word;
begin

  reg := tregistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  reg.OpenKey(RegKey, true);
  Fecha := Date;
  DecodeDate(Fecha, Anio, Mes, Dia);
  ruta_archivo := reg.ReadString('Reportes') + Ticket.nombre_terminal +
    inttostr(Mes) + inttostr(Anio) + '.txt';
  AssignFile(archivo, ruta_archivo);
  if FileExists(ruta_archivo) then
    Append(archivo)
  else
    rewrite(archivo);

  unaLinea := 'MODIFICACION -PRECIO ACTUAL';
  unaLinea := unaLinea + '|';
  unaLinea := unaLinea + Ticket.nom_vendedor + '|';
  unaLinea := unaLinea + Gfacturador.DataSource.DataSet.FieldByName('NOM_LARGO')
    .AsString + '|';
  unaLinea := unaLinea + Gfacturador.DataSource.DataSet.FieldByName('PRECIO')
    .AsString + '|';
  unaLinea := unaLinea + datetimetostr(now) + '|';
  unaLinea := unaLinea + #13 + #10;
  write(archivo, unaLinea);

  CloseFile(archivo);

end;

procedure TFfacturador.arregladescuento;
var
  descuento: double;
  unDescuento:TItemDescuento;
begin

  //---------- AGREGADO DE DESCUENTOS POR RESTO 26/09 -------------------//
  // Arreglo los coseguros que sean de resto y no de precio
  if marTipoDescCo1 = 'R' then
  begin
         unDescuento := CalcularDescuento(Ticket.sucursal,
      (dmFacturador.dprincipalcod_alfabeta.AsString), Eos.Text, Eco1.Text,
      Eco2.Text, eafiliado.Text, ECO1AFILIADO.Text, eco2afiliado.Text,
      (dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString),(dmFacturador.DPRINCIPALPORCENTAJEOS.AsFloat));
        Gfacturador.Fields[12].Asfloat:= unDescuento.porc_coseguro;
  end;

  //---------- AGREGADO DE DESCUENTOS POR RESTO 26/09 -------------------//


  if Gfacturador.Fields[11].Asfloat > 100 then
  begin
    Gfacturador.Fields[11].Asfloat := 100;
  end;
  if Gfacturador.Fields[12].Asfloat > 100 then
  begin
    Gfacturador.Fields[12].Asfloat := 100;
  end;
  if Gfacturador.Fields[13].Asfloat > 100 then
  begin
    Gfacturador.Fields[13].Asfloat := 100;
  end;

  if Gfacturador.Fields[11].Asfloat + Gfacturador.Fields[12].Asfloat + Gfacturador.Fields[13].Asfloat+ Gfacturador.Fields[29].Asfloat > 100 then
  BEGIN
    Gfacturador.Fields[12].Asfloat := 100 - Gfacturador.Fields[11].Asfloat - Gfacturador.Fields[13].Asfloat-Gfacturador.Fields[29].Asfloat;
    Gfacturador.Fields[13].Asfloat := 100 - Gfacturador.Fields[11].Asfloat - Gfacturador.Fields[12].Asfloat-Gfacturador.Fields[29].Asfloat;
    Gfacturador.Fields[29].Asfloat:=100-Gfacturador.Fields[11].Asfloat - Gfacturador.Fields[12].Asfloat-Gfacturador.Fields[13].Asfloat;
    if Gfacturador.Fields[11].Asfloat < 0 then
    begin
      Gfacturador.Fields[12].Asfloat := 0;
    end;
  end;

end;

procedure TFfacturador.gproductoDblClick(Sender: TObject);
begin
  // bagregar.Click;
end;

procedure TFfacturador.gproductoKeyPress(Sender: TObject; var Key: Char);
begin
  { if (Key=#13) then
    begin
    bagregar.Click;
    end; }
end;

procedure TFfacturador.imprimirClick(Sender: TObject);

var
  form: tfticket;
  form2: tfautorizacion;
  Key: Char;
  i: Integer;
  unItem: TTicketItem;

  form3: tfautofarmaplus;
  form4: tfafiliar;
BEGIN

  if not( verificarAfiliado)then
  begin
   pgCoberturas.Enabled := True;
   ShowMessage('Por favor complete los datos del afiliado');
       eafiliado.SetFocus;

    exit;
  end

  else if not verificarMatricula then
  begin
   pgCoberturas.Enabled := True;
    ShowMessage('Por favor complete los datos del médico');
        Eosmatricula.SetFocus;
        exit;
  end

  else
  begin
  //si el medico existe se ejecuta el programa

  verificarcaja;
  leerTicket;

  {if not existemedico and (Eosmatricula.Text <> '') then
    bgrabarmedico.Click;  }


if((ticket.codigo_Co1 <> 'Z87') and (ticket.codigo_Cos2 <> 'Z87')) then
begin
   if ticket.cod_cliente='' then
      begin
      if MessageDlg('Posee cliente autofarma plus?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      begin
       form3 := tfautofarmaplus.Create(SELF);
       form3.SetTicket(Ticket);
       form3.ShowModal;
      end
      else
      begin
      if MessageDlg('Desea afiliar nuevo cliente?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
          form4 :=  tfafiliar.Create(SELF);
          form4.SetTicket(Ticket);
          form4.ShowModal;
        end
      else
      ticket.TIENEAPLUS:='N'

      end;
    end;
end;

//Esto se anula, para que solo se ingrese a estas opciones si el Coseguro 1 y 2 son diferentes de Z87
    {if ticket.cod_cliente='' then
      begin
      if MessageDlg('Posee cliente autofarma plus?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      begin
       form3 := tfautofarmaplus.Create(SELF);
       form3.SetTicket(Ticket);
       form3.ShowModal;
      end
      else
      begin
      if MessageDlg('Desea afiliar nuevo cliente?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
          form4 :=  tfafiliar.Create(SELF);
          form4.SetTicket(Ticket);
          form4.ShowModal;
        end
      else
      ticket.TIENEAPLUS:='N'

      end;
    end;
   }
  if (BVALIDAR.Enabled = true) and (Ticket.valnroreferencia = '') then
  begin
    if application.MessageBox('    Desea validar por ADESFA? ', 'Validacion',
      MB_YESNO) = IDYES then
    BEGIN
      BVALIDAR.Click;
      if ticket.tieneReversaValidacion then
      begin
        Bvalidar.Click;
      end;


    END
    ELSE
    BEGIN

    END;
  end;

  if (Ticket.codigo_Co1 = 'Z87') or (Ticket.codigo_Cos2 = 'Z87') then
  BEGIN
    form2 := tfautorizacion.Create(SELF);
    form2.SetTicket(Ticket);
    form2.ShowModal;
    Gfacturador.DataSource.DataSet.First;
    while not Gfacturador.DataSource.DataSet.Eof do
    begin
      dmFacturador.DPRINCIPAL.Edit;
      if Ticket.codigo_Co1 = 'Z87' then
      BEGIN
        dmFacturador.DPRINCIPALPORCENTAJEco1.Asinteger :=
          Ticket.porcentajeempleados;
        Gfacturador.DataSource.DataSet.Next;
      END;
      if Ticket.codigo_Cos2 = 'Z87' then
      BEGIN
        dmFacturador.DPRINCIPALPORCENTAJEco2.Asinteger :=
          Ticket.porcentajeempleados;
        Gfacturador.DataSource.DataSet.Next;
      END;
    end;
    form2.DisposeOf;
  END;

  recalculo;
  Key := #13;

  // leerticket;
  analizarDescuentosTicket(Ticket);

  i := 0;
  Gfacturador.DataSource.DataSet.First;
  Ticket.sumafarmacia := 0;
  while not Gfacturador.DataSource.DataSet.Eof do
  begin
    // Asignar el descuento
    if Ffacturador.Gfacturador.Fields[10].AsString <> 'B' then
    begin
      Ticket.sumafarmacia := Ticket.sumafarmacia +
        (Ffacturador.Gfacturador.Fields[2].Asfloat *
        Ffacturador.Gfacturador.Fields[3].Asinteger);
    end;

    unItem := Ticket.Items[i];
       if ticket.farmacoins_importe=0 then
       begin
          if unItem.descuento <> 0 then
          begin

              if (Ticket.codigo_OS = '') and (Ticket.codigo_Co1 = '') and
                (Ticket.codigo_Cos2 = '') then
              begin

                dmFacturador.DPRINCIPAL.Edit;
                dmFacturador.dprincipalgentileza.Asinteger := round(unItem.descuento);
                dmFacturador.DPRINCIPAL.Post;
                i := i + 1;
                Gfacturador.DataSource.DataSet.Next;
              end;
              if (Ticket.codigo_OS <> '') then
              begin
                dmFacturador.DPRINCIPAL.Edit;
                dmFacturador.DPRINCIPALPORCENTAJEOS.Asinteger :=
                  round(unItem.descuento);
                dmFacturador.DPRINCIPAL.Post;
                i := i + 1;
                Gfacturador.DataSource.DataSet.Next;
              end;
              if (Ticket.codigo_Co1 <> '') then
              begin
                dmFacturador.DPRINCIPAL.Edit;
                dmFacturador.DPRINCIPALPORCENTAJEco1.Asinteger :=
                  round(unItem.descuento);
                dmFacturador.DPRINCIPAL.Post;
                i := i + 1;
                Gfacturador.DataSource.DataSet.Next;
              end;
          end else
                begin
                  Gfacturador.DataSource.DataSet.Next;
                  i := i + 1;
                end;
        end else
                begin
                  Gfacturador.DataSource.DataSet.Next;
                  i := i + 1;
                end;
  end;

  Key := #13;
  recalculo;
  if (Gfacturador.DataSource.DataSet.IsEmpty) and (Ticket.valnroreferencia <> '')
  then
  begin
    Ticket.valnroreferencia := '';
  end;
  if not Gfacturador.DataSource.DataSet.IsEmpty then
  begin
    leerTicket;
    Gfacturador.OnKeyPress(SELF, Key);
    form := tfticket.Create(SELF);
    form.SetTicket(Ticket);
    setroundmode(rmNearest);
    form.SaldoAPagar :=
      (strtocurr(formatfloat('0.00', (netoacobrar.Field.value))));
    form.IMPORTENETO :=
      (strtocurr(formatfloat('0.00', (netoacobrar.Field.value))));
    form.IMPORTEBRUTO :=
      (strtocurr(formatfloat('0.00', (importetotal.Field.value))));
    form.coberturatota :=
      (strtocurr(formatfloat('0.00', (descuentos.Field.value))));
    form.COBERTURAPLAN :=
      (strtocurr(formatfloat('0.00', (descuentoos.Field.value))));
    form.coberturaco1 :=
      (strtocurr(formatfloat('0.00', (descuentoco1.Field.value))));
    form.coberturaco2 :=
      roundto(strtofloat(formatfloat('0.00', (descuentoco2.Field.value))), -2);
    form.gentilezas :=roundto(strtofloat(formatfloat('0.00',(importegentilezas.Field.value))), -2);
    form.autofarmaplus :=roundto(strtofloat(formatfloat('0.00',(descuentoaplus.Field.value))), -2);
    ticket.autofarmaplus:=descuentoaplus.Field.value;
    ivadesc; // ------------------------analiza tabla iva despues de los descuentos--------------------------//
    form.Showmodal;
    form.DisposeOf;
    if PROMO = 'OK' then
    BEGIN
      recalculo;
      imprimir.Click;
    END;
    if Ticket.estadoticket = 1 then
    begin
      Blimpiartodo.Click;
    end;
  end;
  end;
END;

procedure TFfacturador.ivadesc;
var

  unaTasaIVA: TTasaIVA;
  importeGravado, IMPORTENETO: double;
  importeNetodesc, importeGravadodesc: double;
begin
  importeGravado := 0;
  IMPORTENETO := 0;
  importeNetodesc := 0;
  importeGravadodesc := 0;

  Gfacturador.DataSource.DataSet.First;
  Ticket.TotalesIVA.Clear;
  while not Gfacturador.DataSource.DataSet.Eof do
  Begin
    unaTasaIVA := nil;
    Ticket.TotalesIVA.TryGetValue(Gfacturador.DataSource.DataSet.FieldByName('cod_iva').AsString, unaTasaIVA);
    if (unaTasaIVA = nil) then
    Begin
      unaTasaIVA := TTasaIVA.Create;
    End;

    unaTasaIVA.codigoIVA := Gfacturador.DataSource.DataSet.FieldByName('cod_iva').AsString;
    importeGravado := ((Gfacturador.DataSource.DataSet.FieldByName('precio').Asfloat * Gfacturador.DataSource.DataSet.FieldByName('cantidad').Asfloat)- Gfacturador.DataSource.DataSet.FieldByName('descuentos').Asfloat);


    ///hasta aqui llegue--------------------------------//

    if (unaTasaIVA.getPorcentajeIVA > 0) then
    Begin
      IMPORTENETO := importeGravado / (1 + unaTasaIVA.getPorcentajeIVA / 100);
    End
    else
    Begin
      IMPORTENETO := importeGravado;
    End;
    unaTasaIVA.netogravado := unaTasaIVA.netogravado + IMPORTENETO;

    if Gfacturador.DataSource.DataSet.FieldByName('importegent').Asfloat > 0 then
    begin
      importeGravadodesc := 0;
       //--------------------13/07/2022 descuento caso especial autofarma plus-------------------//
       if Gfacturador.DataSource.DataSet.FieldByName('descuentoaplus').Asfloat > 0 then
       begin
       importeGravadodesc := Gfacturador.DataSource.DataSet.FieldByName('descuentos').Asfloat-Gfacturador.DataSource.DataSet.FieldByName('importegent').Asfloat
       end;


    end;
    if Gfacturador.DataSource.DataSet.FieldByName('importegent').Asfloat = 0
    then
    begin
      importeGravadodesc := Gfacturador.DataSource.DataSet.FieldByName('descuentos').Asfloat;
    end;

    Ticket.TotalesIVA.AddOrSetValue(Gfacturador.DataSource.DataSet.FieldByName('cod_iva').AsString, unaTasaIVA);
    if (unaTasaIVA.getPorcentajeIVA > 0) then
    Begin
      importeNetodesc := importeGravadodesc /(1 + unaTasaIVA.getPorcentajeIVA / 100);
    End
    else
    Begin
      importeNetodesc := importeGravadodesc;
    End;
    unaTasaIVA.netogravadodesc := unaTasaIVA.netogravadodesc + importeNetodesc;

    // sumaitem:=gfacturador.Fields[3].Asinteger+sumaitem;
    Gfacturador.DataSource.DataSet.Next;
  End;
end;

procedure TFfacturador.lco1Change(Sender: TObject);
begin
  if lco1.Text = '' THEN
    Panel5.Enabled := false;
  if lco1.Text <> '' then
    Panel5.Enabled := true;
end;

procedure TFfacturador.lco2Change(Sender: TObject);
begin
  if lco2.Text = '' THEN
    Panel3.Enabled := false;
  if lco2.Text <> '' then
    Panel3.Enabled := true;
end;

procedure TFfacturador.leerTicket;
Var
  item: TTicketItem;
  j: Integer;
  fechareceta: TDate;
  fecharecetaco1: TDate;
  sumaitem: Integer;
  valoriva: double;
  unaTasaIVA: TTasaIVA;
  importeGravado, IMPORTENETO: double;
  importeNetodesc, importeGravadodesc: double;
  Key: Word;

begin

  dmFacturador.AbrirConexion();
  dmFacturador.IBQcodigoprestador.Close;
  dmFacturador.IBQcodigoprestador.SQL.Text :=
    concat('select cod_farmacia, path_envio, path_respuesta from osmavalidadores where cod_validador=:codigo');
  dmFacturador.IBQcodigoprestador.ParamByName('codigo').AsString :=
    codigo_validador;
  dmFacturador.IBQcodigoprestador.Open;
  dmFacturador.qtipocomprob.Close;
  dmFacturador.qtipocomprob.SQL.Clear;
  dmFacturador.qtipocomprob.SQL.Append
    ('select TIP_IMPRE from vtmatipcomprob where tip_comprobante=:letra  AND MAR_TIPOPROCESO=''F''');
  dmFacturador.qtipocomprob.ParamByName('LETRA').AsString := combotipo.Text;
  dmFacturador.qtipocomprob.Open;

  Ticket.CodAccion := '290020';

  Ticket.codigoos_prestador := dmFacturador.IBQcodigoprestador.Fields[0].Text;

  Ticket.path_validador := dmFacturador.IBQcodigoprestador.Fields[1].Text;

  Ticket.path_respuesta := dmFacturador.IBQcodigoprestador.Fields[2].Text;
  Ticket.codigo_validador := codigo_validador;

  Ticket.codigoos_validador := codigo_os_validador;

  Ticket.afiliado_apellido := eosapellido.Text;

  Ticket.afiliado_apellidoco1 := eco1apellido.Text;

  Ticket.afiliado_apellidoco2 := eco2apellido.Text;

  Ticket.afiliado_nombre := eosnombre.Text;

  Ticket.afiliado_nombreco1 := eco1nombre.Text;

  Ticket.afiliado_nombreco2 := eco2nombre.Text;

  Ticket.afiliado_numero := eafiliado.Text;

  Ticket.afiliado_numeroco1 := ECO1AFILIADO.Text;

  Ticket.afiliado_numeroco2 := eco2afiliado.Text;

  if los.Text <> '' then
  begin
    Ticket.codigo_OS := Eos.Text;
    Ticket.nombre_os := los.Text;
    fechareceta := dtfecreceta.Date;
    Ticket.fecha_receta := fechareceta;
    Ticket.numero_receta := eosreceta.Text;
    if Ltratamiento.Caption = 'PROLONGADO' then
    begin
      Ticket.codigo_tratamiento := 'P';
    end;
    if Ltratamiento.Caption = 'NORMAL' then
    begin
      Ticket.codigo_tratamiento := 'N';
    end;
    if Cosprovincia.ItemIndex = 0 then
    begin
      Ticket.medico_codigo_provincia := '';
      Ticket.medico_tipo_matricula := 'N';
    end;
    if Cosprovincia.ItemIndex = 1 then
    begin
      Ticket.medico_codigo_provincia := 'Z';
      Ticket.medico_tipo_matricula := 'P';
    end;
    if Cosprovincia.ItemIndex = 2 then
    begin
      Ticket.medico_codigo_provincia := 'U';
      Ticket.medico_tipo_matricula := 'P';
    end;
    if Cosprovincia.ItemIndex = 3 then
    begin
      Ticket.medico_codigo_provincia := 'Q';
      Ticket.medico_tipo_matricula := 'P';
    end;
    if Cosprovincia.ItemIndex = 4 then
    begin
      Ticket.medico_codigo_provincia := 'R';
      Ticket.medico_tipo_matricula := 'P';
    end;
    if Cosprovincia.ItemIndex = 5 then
    begin
      Ticket.medico_codigo_provincia := 'M';
      Ticket.medico_tipo_matricula := 'P';
    end;
    if Cosprovincia.ItemIndex = 6 then
    begin
      Ticket.medico_codigo_provincia := 'X';
      Ticket.medico_tipo_matricula := 'P';
    end;
    if Cosprovincia.ItemIndex = 7 then
    begin
      Ticket.medico_codigo_provincia := 'O';
      Ticket.medico_tipo_matricula := 'P';
    end;
    if Cosprovincia.ItemIndex = 8 then
    begin
      Ticket.medico_codigo_provincia := 'B';
      Ticket.medico_tipo_matricula := 'P';
    end;
    Ticket.medico_nro_matricula := Eosmatricula.Text;
    Ticket.medico_nombre := EOSMEDICONOMBRE.Text;
    Ticket.medico_apellido := eosmedicoAPELLIDO.Text;

  end;
  if lco1.Text <> '' then
  begin
    Ticket.codigo_Co1 := Eco1.Text;
    Ticket.nombre_co1 := lco1.Text;
    fecharecetaco1 := dtfeccoseguro.Date;
    Ticket.fecha_recetaco1 := fecharecetaco1;
    Ticket.numero_recetaco1 := eco1receta.Text;
    Ticket.medico_codigo_provinciaco1 := '';
    Ticket.medico_tipo_matriculaco1 := '';
    Ticket.medico_nro_matriculaco1 := '';
    Ticket.medico_nombreco1 := '';
    Ticket.medico_apellidoco1 := '';

  end;
  if lco2.Text <> '' then
  begin
    Ticket.codigo_Cos2 := Eco2.Text;
    Ticket.nombre_cos2 := lco2.Text;

  end;
  if los.Text = '' then
  begin
    Ticket.codigo_OS := '';
    Ticket.nombre_os := '';
    fechareceta := dtfecreceta.Date;
    Ticket.fecha_receta := fechareceta;
    Ticket.numero_receta := '';
    Ticket.codigo_tratamiento := '';

    Ticket.codigo_tratamiento := '';
    Ticket.medico_codigo_provincia := '';
    Ticket.medico_tipo_matricula := '';

    Ticket.medico_nro_matricula := '';
    Ticket.medico_nombre := '';
    Ticket.medico_apellido := '';

  end;
  if lco1.Text = '' then
  begin
    Ticket.codigo_Co1 := '';
    Ticket.nombre_co1 := '';
    fecharecetaco1 := dtfeccoseguro.Date;
    Ticket.fecha_recetaco1 := fecharecetaco1;
    Ticket.numero_recetaco1 := eco1receta.Text;
    Ticket.medico_codigo_provinciaco1 := '';
    Ticket.medico_tipo_matriculaco1 := '';
    Ticket.medico_nro_matriculaco1 := '';
    Ticket.medico_nombreco1 := '';
    Ticket.medico_apellidoco1 := '';

  end;
  if lco2.Text = '' then
  begin
    Ticket.codigo_Cos2 := '';
    Ticket.nombre_cos2 := '';
  end;

  Ticket.comprobante := combotipo.Text;

  Ticket.cod_vendedor := Evendedor.Text;

  Ticket.nom_vendedor := Label1.Caption;

  Ticket.tip_comprobante := dmFacturador.qtipocomprob.Fields[0].Text;
  if not Gfacturador.DataSource.DataSet.IsEmpty then
  begin

    Ticket.importecargoos :=
      roundto(strtofloat(formatfloat('0.00', (descuentoos.Field.value))), -2);

    Ticket.importecargoco1 :=
      roundto(strtofloat(formatfloat('0.00', (descuentoco1.Field.value))), -2);

    Ticket.importecargoco2 :=
      roundto(strtofloat(formatfloat('0.00', (descuentoco2.Field.value))), -2);

    Ticket.importegentileza :=
      roundto(strtofloat(formatfloat('0.00',
      (importegentilezas.Field.value))), -2);

  end;

  Ticket.Items := tlist.Create;
  j := 0;
  Ticket.IMPORTEBRUTO := 0;
  Ticket.IMPORTENETO := 0;
  Ticket.importetotaldescuento := 0;
  Gfacturador.DataSource.DataSet.First;
  while not Gfacturador.DataSource.DataSet.Eof do
  Begin

    j := j + 1;
    item := TTicketItem.Create;
    item.nro_item := j;
    item.cod_barras := Gfacturador.Fields[9].AsString;
    item.cod_troquel := Gfacturador.Fields[0].AsString;
    item.cod_alfabeta := Gfacturador.Fields[8].AsString;
    item.importe_unitario := Gfacturador.Fields[2].Asfloat;
    item.cantidad := Gfacturador.Fields[3].Asinteger;
    item.porcentaje_cobertura := Gfacturador.Fields[11].Asfloat;
    item.importe_cobertura := Gfacturador.Fields[14].Asfloat;
    item.cod_iva := Gfacturador.Fields[10].AsString;
    item.cod_rubro := Gfacturador.Fields[23].AsString;
    item.cod_laboratorio := Gfacturador.Fields[15].AsString;
    item.codautorizacion := Gfacturador.Fields[25].AsString;

    Ticket.Items.Add(item);
    Ticket.IMPORTEBRUTO := Ticket.IMPORTEBRUTO + item.importe_unitario *
      item.cantidad;
    // ticket.importeneto:=ticket.importeneto+gfacturador.Fields[5].AsFloat*item.cantidad;
    Ticket.IMPORTENETO := Ticket.IMPORTENETO + Gfacturador.Fields[5].Asfloat;
    if (Gfacturador.Fields[11].Asfloat <> 0) or
      (Gfacturador.Fields[12].Asfloat <> 0) or
      (Gfacturador.Fields[13].Asfloat <> 0) or
      (Gfacturador.Fields[29].Asfloat <> 0) then
    begin
      Ticket.importetotaldescuento := Ticket.importetotaldescuento +
        item.importe_unitario * item.cantidad;
    end;
    if Gfacturador.Fields[18].Asinteger > 0 then
    begin
      dmFacturador.DPRINCIPAL.Edit;
      dmFacturador.DPRINCIPALcan_vale.AsString := Gfacturador.Fields
        [18].AsString;
      dmFacturador.DPRINCIPALvale.AsString := 'SI';

    end;
    if Gfacturador.Fields[18].Asinteger = 0 then
    begin
      dmFacturador.DPRINCIPAL.Edit;
      dmFacturador.DPRINCIPALcan_vale.AsString := '0';
      dmFacturador.DPRINCIPALvale.AsString := '';

    end;

    dmFacturador.DPRINCIPAL.Edit;

    dmFacturador.DPRINCIPALitem.Asinteger := j;
    Gfacturador.DataSource.DataSet.Next;
  End;
  Gfacturador.DataSource.DataSet.First;
  while not Gfacturador.DataSource.DataSet.Eof do
  Begin
    if Gfacturador.Fields[17].AsString = 'SI' then
    begin
      Ticket.llevavale := 'SI';
    end;
    Gfacturador.DataSource.DataSet.Next;
  End;

  { gfacturador.DataSource.DataSet.First;
    ticket.TotalesIVA.Clear;
    while not Gfacturador.DataSource.DataSet.Eof do
    Begin
    unaTasaIVA:=nil;
    ticket.TotalesIVA.TryGetValue(gfacturador.DataSource.DataSet.FieldByName('cod_iva').AsString,unaTasaIVA);
    if (unaTasaIVA=nil) then
    Begin
    unaTasaIVA:=TTasaIVA.Create;
    End;

    unaTasaIVA.codigoIVA:=gfacturador.DataSource.DataSet.FieldByName('cod_iva').AsString;
    importeGravado:=  ((gfacturador.DataSource.DataSet.FieldByName('precio').Asfloat*gfacturador.DataSource.DataSet.FieldByName('cantidad').Asfloat)-gfacturador.DataSource.DataSet.FieldByName('descuentos').Asfloat);

    if (unaTasaIVA.getPorcentajeIVA> 0) then
    Begin
    importeNeto:=importeGravado/(1+unaTasaIVA.getPorcentajeIVA/100);
    End
    else
    Begin
    importeNeto:=importeGravado;
    End;
    unaTasaIVA.netogravado:=unaTasaIVA.netogravado+ importeNeto;


    importegravadodesc:=gfacturador.DataSource.DataSet.FieldByName('descuentos').Asfloat;
    ticket.TotalesIVA.AddOrSetValue(gfacturador.DataSource.DataSet.FieldByName('cod_iva').AsString,unaTasaIVA);
    if (unaTasaIVA.getPorcentajeIVA> 0) then
    Begin
    importeNetodesc:=importeGravadodesc/(1+unaTasaIVA.getPorcentajeIVA/100);
    End
    else
    Begin
    importeNetodesc:=importeGravadodesc;
    End;
    unaTasaIVA.netogravadodesc:=  unaTasaIVA.netogravadodesc+ importeNetoDesc;

    //    sumaitem:=gfacturador.Fields[3].Asinteger+sumaitem;
    gfacturador.DataSource.DataSet.next;
    End; }
  sumaitem := Gfacturador.DataSource.DataSet.RecordCount;
  Ticket.itemsTotales := sumaitem;
  Ticket.coeficientetarjeta := 1;

  // ticket.nombre_terminal:=lterminal.Caption;
  // ticket.puerto_com:=Reg.ReadString('com');
  // ticket.fiscla_pv:=Reg.ReadString('pf');
  // ticket.sucursal:=reg.ReadString('sucursal');
  // ticket.url:=Reg.ReadString('URL');

end;

procedure TFfacturador.limiteco1;
var
  can_maxunidxrec: Integer;
  can_maxunidxren: Integer;
  can_maxunidxticket: Integer;
  can_maxrenxticket: Integer;
  Key: Char;
  urec, uren, uticket, renxticket: Boolean;

begin
  if not Gfacturador.DataSource.DataSet.IsEmpty then
  begin
    leerTicket;
    dmFacturador.AbrirConexion();
    if dmFacturador.TRANLIMITE.InTransaction then
    begin
      dmFacturador.TRANLIMITE.Rollback;
    end;
    dmFacturador.qlimite.Close;
    dmFacturador.qlimite.SQL.Clear;
    dmFacturador.qlimite.SQL.Append
      ('SELECT can_maxunidxrec, can_maxunidxren, can_maxunidxticket, can_maxrenxticket FROM OSMALIMITES WHERE TIP_TRATAMIENTO=:tratamiento and cod_planos=:plan and cod_tamano=:tamano');
    dmFacturador.qlimite.ParamByName('tratamiento').AsString :=
      Ticket.codigo_tratamiento;
    dmFacturador.qlimite.ParamByName('plan').AsString := Ticket.codigo_Co1;
    dmFacturador.qlimite.ParamByName('tamano').Asinteger :=
      Gfacturador.Fields[19].Asinteger;
    dmFacturador.qlimite.Open;
    dmFacturador.qlimite.First;
    urec := false;
    uren := false;
    uticket := false;
    renxticket := false;

    while not dmFacturador.qlimite.Eof do
    begin

      can_maxunidxrec := dmFacturador.qlimite.Fields[0].Asinteger;
      can_maxunidxren := dmFacturador.qlimite.Fields[1].Asinteger;
      can_maxunidxticket := dmFacturador.qlimite.Fields[2].Asinteger;
      can_maxrenxticket := dmFacturador.qlimite.Fields[3].Asinteger;
      if Ticket.itemsTotales > can_maxunidxrec then
      begin
        showmessage('LIMITE DE ITEMS X RECETA EXCEDIDO MODIFICAR CANTIDAD');

        urec := true;

      end;

      if Gfacturador.Fields[3].Asinteger > can_maxunidxren then
      begin
        showmessage('LIMITE DE ITEMS X RENGLON EXCEDIDO MODIFICAR CANTIDAD');

        uren := true;

      end;

      if Ticket.itemsTotales > can_maxunidxticket then
      begin
        showmessage('LIMITE DE ITEMS X TICKET EXCEDIDO MODIFICAR CANTIDAD');

        uticket := true;

      end;

      if Gfacturador.DataSource.DataSet.RecordCount > can_maxrenxticket then
      begin
        showmessage('LIMITE DE ITEMS X TICKET EXCEDIDO MODIFICAR CANTIDAD');

        renxticket := true;

      end;
      if (renxticket = true) or (uticket = true) or (uren = true) or
        (urec = true) then
      begin
        if application.MessageBox
          (' Limites excedidos: Desea forzar descuento? ', 'Limites', MB_YESNO)
          = IDYES then
        BEGIN
          // reCO1;
        END
        ELSE
        BEGIN
          dmFacturador.DPRINCIPAL.Edit;
          dmFacturador.DPRINCIPALPORCENTAJEco1.Asinteger := 0;
          dmFacturador.DPRINCIPAL.Post;
          Key := #13;
          Gfacturador.OnKeyPress(SELF, Key);
        END;
      end;

      { if not (gfacturador.DataSource.DataSet.RecordCount<=can_maxrenxticket) and (ticket.itemstotales<=can_maxunidxticket) and (ticket.itemstotales<=can_maxunidxrec) and  (gfacturador.Fields[3].Asinteger<=can_maxunidxreN) then
        begin
        reCO1;
        end; }

      dmFacturador.qlimite.Next;
    end;
  end;

end;

procedure TFfacturador.limiteos;
var
  can_maxunidxrec: Integer;
  can_maxunidxren: Integer;
  can_maxunidxticket: Integer;
  can_maxrenxticket: Integer;
  Key: Char;
  urec, uren, uticket, renxticket: Boolean;

begin
  if not Gfacturador.DataSource.DataSet.IsEmpty then
  begin
    leerTicket;
    dmFacturador.AbrirConexion();
    if dmFacturador.TRANLIMITE.InTransaction then
    begin
      dmFacturador.TRANLIMITE.Rollback;
    end;
    dmFacturador.qlimite.Close;
    dmFacturador.qlimite.SQL.Clear;
    dmFacturador.qlimite.SQL.Append
      ('SELECT can_maxunidxrec, can_maxunidxren, can_maxunidxticket, can_maxrenxticket FROM OSMALIMITES WHERE TIP_TRATAMIENTO=:tratamiento and cod_planos=:plan and cod_tamano=:tamano');
    dmFacturador.qlimite.ParamByName('tratamiento').AsString :=
      Ticket.codigo_tratamiento;
    dmFacturador.qlimite.ParamByName('plan').AsString := Ticket.codigo_OS;
    dmFacturador.qlimite.ParamByName('tamano').Asinteger :=
      Gfacturador.Fields[19].Asinteger;
    dmFacturador.qlimite.Open;
    dmFacturador.qlimite.First;
    urec := false;
    uren := false;
    uticket := false;
    renxticket := false;

    while not dmFacturador.qlimite.Eof do
    begin

      can_maxunidxrec := dmFacturador.qlimite.Fields[0].Asinteger;
      can_maxunidxren := dmFacturador.qlimite.Fields[1].Asinteger;
      can_maxunidxticket := dmFacturador.qlimite.Fields[2].Asinteger;
      can_maxrenxticket := dmFacturador.qlimite.Fields[3].Asinteger;
      if Ticket.itemsTotales > can_maxunidxrec then
      begin
        showmessage('LIMITE DE ITEMS X RECETA EXCEDIDO MODIFICAR CANTIDAD');

        urec := true;

      end;

      if Gfacturador.Fields[3].Asinteger > can_maxunidxren then
      begin
        showmessage('LIMITE DE ITEMS X RENGLON EXCEDIDO MODIFICAR CANTIDAD');

        uren := true;

      end;

      if Ticket.itemsTotales > can_maxunidxticket then
      begin
        showmessage('LIMITE DE ITEMS X TICKET EXCEDIDO MODIFICAR CANTIDAD');

        uticket := true;

      end;

      if Gfacturador.DataSource.DataSet.RecordCount > can_maxrenxticket then
      begin
        showmessage('LIMITE DE ITEMS X TICKET EXCEDIDO MODIFICAR CANTIDAD');

        renxticket := true;

      end;
      if (renxticket = true) or (uticket = true) or (uren = true) or
        (urec = true) then
      begin
        if application.MessageBox
          (' Limites excedidos: Desea forzar descuento? ', 'Limites', MB_YESNO)
          = IDYES then
        BEGIN
          // reos;
        END
        ELSE
        BEGIN
          dmFacturador.DPRINCIPAL.Edit;
          dmFacturador.DPRINCIPALPORCENTAJEOS.Asinteger := 0;
          dmFacturador.DPRINCIPAL.Post;
          Key := #13;
          Gfacturador.OnKeyPress(SELF, Key);
        END;
      end;

      { if (gfacturador.DataSource.DataSet.RecordCount<=can_maxrenxticket) and (ticket.itemstotales<=can_maxunidxticket) and (ticket.itemstotales<=can_maxunidxrec) and  (gfacturador.Fields[3].Asinteger<=can_maxunidxreN) then
        begin
        reos;
        end; }

      dmFacturador.qlimite.Next;
    end;
  end;

end;

procedure TFfacturador.LimpiarClick(Sender: TObject);
begin
  Eco2.Text := '';
  eco2afiliado.Text := '';
  eco2nombre.Text := '';
  eco2matricula.Text := '';
  eco2medicoapellido.Text := '';

  eco2receta.Text := '';

end;

procedure TFfacturador.limpiarunidadticket;
begin
  if Ticket.Items <> nil then
  begin
    Ticket.Items.Clear;
  end;
  if Ticket.itemsval <> nil then
  begin
    Ticket.itemsval.Clear;
  end;
  if Ticket.itemsonline <> nil then
  begin
    Ticket.itemsonline.Clear;
  end;
  if Ticket.TotalesIVA <> nil then
  begin
    Ticket.TotalesIVA.Clear;
  end;

  Ticket.afiliado_numero := '';
  Ticket.afiliado_nombre := '';
  Ticket.afiliado_apellido := '';

  Ticket.medico_apellido := '';
  Ticket.medico_nombre := '';
  Ticket.medico_tipo_matricula := '';
  Ticket.medico_nro_matricula := '';
  Ticket.medico_codigo_provincia := '';

  Ticket.fechacaja := 0;
  Ticket.fechaactual := '';
  Ticket.hora := 0;
  Ticket.fecha_receta := now;
  Ticket.fecha_recetaco1 := now;
  Ticket.numero_receta := '';
  Ticket.cod_afiliadoplanos := '';

  Ticket.codigo_OS := '';
  Ticket.nombre_os := '';
  Ticket.codigo_Co1 := '';
  Ticket.nombre_co1 := '';
  Ticket.codigo_Cos2 := '';
  Ticket.nombre_cos2 := '';
  Ticket.codigo_validador := '';
  Ticket.codigoos_validador := '';
  Ticket.codigoos_prestador := '';
  Ticket.codigo_tratamiento := '';
  Ticket.valnroreferencia := '';
  Ticket.valdescripcionrespuesta := '';
  Ticket.valmsjrespuesta := '';
  Ticket.valnro_item := '';
  Ticket.valcodigorespuesta := '9999';
  Ticket.valimporte_unitarioval := '';
  Ticket.valcod_troquel := '';
  Ticket.CodAccion := '';
  Ticket.path_validador := '';

  Ticket.cod_vendedor := '';
  Ticket.nom_vendedor := '';
  Ticket.itemsTotales := 0;
  Ticket.IMPORTEBRUTO := 0;
  Ticket.IMPORTENETO := 0;
  Ticket.saldocc := 0;
  Ticket.alfabetastock := '';
  Ticket.nombrestock := '';
  Ticket.estadoticket := 0;
  Ticket.importetotal_iva := 0;
  Ticket.importetotalsin_iva := 0;
  Ticket.importetotaldescuento := 0;
  Ticket.importecargoos := 0;
  Ticket.importecargoco1 := 0;
  Ticket.importecargoco2 := 0;
  Ticket.codigocheque := '';
  Ticket.numerocheque := '';
  Ticket.codigotarjeta := '';
  Ticket.cod_cliente := '';

  Ticket.codigocc := '';
  Ticket.codigosubcc := '';
  Ticket.valecantidad := '';
  Ticket.llevavale := '';

  Ticket.cuitproveedor := '';
  Ticket.facturaproveedor := '';

  Ticket.nrocomprobantenf := '';
  Ticket.marstock := '';
  Ticket.puntos_farmavalor := '';
  Ticket.monodroga := '';

  // ticket.fec_operativa:=0;
  // ticket.nombre_terminal:='';
  // ticket.fiscla_pv:='';
  // ticket.puerto_com:='';
  Ticket.fechafiscal := 0;
  // ticket.sucursal:='';
  // ticket.comprobante:='';
  // ticket.tip_comprobante:='';

  Ticket.CUIT := '';
  Ticket.CONDICIONIVA := '';
  Ticket.DESCRIPCIONCLIENTE := '';
  Ticket.codigocliente := '';
  Ticket.direccion := '';
  Ticket.telefono := '';
  // ticket.url:='';
  Ticket.dni := '';
  ticket.farmacoins_importe:=0;

end;

procedure TFfacturador.losChange(Sender: TObject);
begin
  if los.Text = '' THEN
    Panel4.Enabled := false;
  if los.Text <> '' then
    Panel4.Enabled := true;

end;

procedure TFfacturador.lturnoClick(Sender: TObject);
begin

if (length(pchar(eco1.Text)) < 1) and (length(pchar(eos.Text)) <1) and (length(pchar(Eco2.Text)) <1) then
begin
    if Ticket.turnero = 'S' then
    begin
        ticket.turnoatencion:= '0';
        // Pasa cualquier información necesaria al formulario modal
        frmTurnos.SetTicket(Ticket);

        // Muestra el formulario modal y espera hasta que se cierre
        frmTurnos.ShowModal;
        if Ticket.turnoatencion <> '' then
        BEGIN
          lturno.Caption := Ticket.turnoatencion;
        END;

      end;
end;

end;

procedure TFfacturador.pgCoberturasDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  with pgCoberturas.canvas do
  begin
    fillrect(Rect);
    font.Color := clBlack;
    // con éste color ya se verá, ves jugando con el que te guste más
    textout(Rect.left + 2, Rect.Top + 2, pgCoberturas.Pages[TabIndex].Caption);
  end;
end;

procedure TFfacturador.pgCoberturasExit(Sender: TObject);

begin   //1
  {codigo nuevo}
  if (los.text = '') then
  begin
     //eos.Clear;
     exit;
     //limpiarunidadticket;
  end;


        lblDatosMedico.Visible := true;
        {eosmedicoapellido.SetFocus; }



        // Agregar la condición para permitir la ejecución de LimpiarTodo.Click
        if not (Sender = BlimpiarTodo) then
        begin
          Exit;  // Salir del evento sin ejecutar más código
        end;


        panel1.Enabled := true;
        panel2.Enabled := true;
end;
     

procedure TFfacturador.precio;
begin

  calcuPrecio.CodRubro:=dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString;
  calcuPrecio.CodOS:=Eos.Text;
  calcuPrecio.CodCos1:= eco1.Text;
  calcuPrecio.CodCos2:= eco2.Text;

  preciocalculado:= calcuPrecio.CalcularPrecio(preciocrudo,porvarlabo,porvarrubro,dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString);
end;

procedure TFfacturador.recalculo;
var
  Key: Char;

begin
  Gfacturador.DataSource.DataSet.First;
  while not Gfacturador.DataSource.DataSet.Eof do
  begin
    Key := #13;

    Gfacturador.OnKeyPress(SELF, Key);
    Gfacturador.DataSource.DataSet.Next;

  end;

end;

procedure TFfacturador.reco1;
var
  descuento: titemdescuento;
  Key: Char;
begin
  if (lco1.Text <> '') then
  begin
    descuento := CalcularDescuento(Ticket.sucursal,
      (dmFacturador.dprincipalcod_alfabeta.AsString), Eos.Text, Eco1.Text,
      Eco2.Text, eafiliado.Text, ECO1AFILIADO.Text, eco2afiliado.Text,
      (dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString));
    dmFacturador.DPRINCIPAL.Edit;
    dmFacturador.DPRINCIPALPORCENTAJEco1.Asfloat := descuento.porc_coseguro;
    dmFacturador.DPRINCIPAL.Post;
    Key := #13;
    Gfacturador.OnKeyPress(SELF, Key);
     marTipoDescCo1:= descuento.mar_cos1;
              marTipoDescCo2:= descuento.mar_cos2;
  end;

end;

procedure TFfacturador.reco2;
var
  descuento: titemdescuento;
  Key: Char;
begin
  if (lco2.Text <> '') then
  begin
    descuento := CalcularDescuento(Ticket.sucursal,
      (dmFacturador.dprincipalcod_alfabeta.AsString), Eos.Text, Eco1.Text,
      Eco2.Text, eafiliado.Text, ECO1AFILIADO.Text, eco2afiliado.Text,
      (dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString));
    dmFacturador.DPRINCIPAL.Edit;
    dmFacturador.DPRINCIPALPORCENTAJEco2.Asfloat := descuento.porc_coseguro;
    dmFacturador.DPRINCIPAL.Post;
    Key := #13;
    Gfacturador.OnKeyPress(SELF, Key);
     marTipoDescCo1:= descuento.mar_cos1;
              marTipoDescCo2:= descuento.mar_cos2;
  end;

end;

procedure TFfacturador.reco1empty;
var
  descuento: titemdescuento;
  descuentoint: double;
begin
  if (lco1.Text = '') then
  begin
    Gfacturador.DataSource.DataSet.First;

    while not Gfacturador.DataSource.DataSet.Eof do
    begin

      descuento := CalcularDescuento(Ticket.sucursal,
        (dmFacturador.dprincipalcod_alfabeta.AsString), Eos.Text, Eco1.Text,
        Eco2.Text, eafiliado.Text, ECO1AFILIADO.Text, eco2afiliado.Text,
        (dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString));
         marTipoDescCo1:= descuento.mar_cos1;
              marTipoDescCo2:= descuento.mar_cos2;
      dmFacturador.DPRINCIPAL.Edit;
      dmFacturador.DPRINCIPALPORCENTAJEco1.Asfloat := descuento.porc_coseguro;
      if Gfacturador.Fields[3].AsString = '' then
      begin
        dmFacturador.DPRINCIPALCANTIDAD.Asinteger := 1;
      end;
      if Gfacturador.Fields[3].AsString = '0' then
      begin
        dmFacturador.DPRINCIPALCANTIDAD.Asinteger := 1;
      end;

      if Gfacturador.Fields[3].AsString <> '' then
      begin
        descuentoint := 0;
        descuentoint := Gfacturador.Fields[11].Asfloat + Gfacturador.Fields[12]
          .Asfloat + Gfacturador.Fields[13].Asfloat;
        if descuentoint > 100 then
        begin
          descuentoint := 100;
        end;
        dmFacturador.dprincipalporcentaje.Asfloat := descuentoint;
        dmFacturador.DPRINCIPALCANTIDAD.Asinteger := Gfacturador.Fields[3]
          .Asinteger;
        dmFacturador.dprincipalPrecio_Total.Asfloat :=
          dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat;
        dmFacturador.dprincipalDESCUENTOS.Asfloat :=
          (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat) *
          ((Gfacturador.Fields[7].Asfloat) / 100);
        dmFacturador.dprincipalprecio_totaldesc.Asfloat :=
          dmFacturador.dprincipalPrecio_Total.Asfloat -
          dmFacturador.dprincipalDESCUENTOS.Asfloat;
        dmFacturador.dprincipalDESCUENTOSOS.AsCurrency :=
          (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat) *
          ((Gfacturador.Fields[11].Asfloat) / 100);
        dmFacturador.dprincipalDESCUENTOco1.AsCurrency :=
          (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat) *
          ((Gfacturador.Fields[12].Asfloat) / 100);
        dmFacturador.dprincipalDESCUENTOco2.AsCurrency :=
          (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat) *
          ((Gfacturador.Fields[13].Asfloat) / 100);
        arregladescuento;
        dmFacturador.DPRINCIPAL.Post;

      end;
      Gfacturador.Columns.Items[2].ReadOnly := true;

      Gfacturador.DataSource.DataSet.Next;

    end;

  end;
end;

procedure TFfacturador.reco2empty;
var
  descuento: titemdescuento;
  descuentoint: double;
begin
  if (lco2.Text = '') then
  begin
    Gfacturador.DataSource.DataSet.First;

    while not Gfacturador.DataSource.DataSet.Eof do
    begin

      descuento := CalcularDescuento(Ticket.sucursal,
        (dmFacturador.dprincipalcod_alfabeta.AsString), Eos.Text, Eco1.Text,
        Eco2.Text, eafiliado.Text, ECO1AFILIADO.Text, eco2afiliado.Text,
        (dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString));
        marTipoDescCo1:= descuento.mar_cos1;
              marTipoDescCo2:= descuento.mar_cos2;
      dmFacturador.DPRINCIPAL.Edit;
      dmFacturador.DPRINCIPALPORCENTAJEco1.Asfloat := descuento.porc_coseguro;
      if Gfacturador.Fields[3].AsString = '' then
      begin
        dmFacturador.DPRINCIPALCANTIDAD.Asinteger := 1;
      end;
      if Gfacturador.Fields[3].AsString = '0' then
      begin
        dmFacturador.DPRINCIPALCANTIDAD.Asinteger := 1;
      end;

      if Gfacturador.Fields[3].AsString <> '' then
      begin
        descuentoint := 0;
        descuentoint := Gfacturador.Fields[11].Asfloat + Gfacturador.Fields[12]
          .Asfloat + Gfacturador.Fields[13].Asfloat;
        if descuentoint > 100 then
        begin
          descuentoint := 100;
        end;
        dmFacturador.dprincipalporcentaje.Asfloat := descuentoint;
        dmFacturador.DPRINCIPALCANTIDAD.Asinteger := Gfacturador.Fields[3]
          .Asinteger;
        dmFacturador.dprincipalPrecio_Total.Asfloat :=
          dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat;
        dmFacturador.dprincipalDESCUENTOS.Asfloat :=
          (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat) *
          ((Gfacturador.Fields[7].Asfloat) / 100);
        dmFacturador.dprincipalprecio_totaldesc.Asfloat :=
          dmFacturador.dprincipalPrecio_Total.Asfloat -
          dmFacturador.dprincipalDESCUENTOS.Asfloat;
        dmFacturador.dprincipalDESCUENTOSOS.AsCurrency :=
          (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat) *
          ((Gfacturador.Fields[11].Asfloat) / 100);
        dmFacturador.dprincipalDESCUENTOco1.AsCurrency :=
          (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat) *
          ((Gfacturador.Fields[12].Asfloat) / 100);
        dmFacturador.dprincipalDESCUENTOco2.AsCurrency :=
          (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat) *
          ((Gfacturador.Fields[13].Asfloat) / 100);
        arregladescuento;
        dmFacturador.DPRINCIPAL.Post;

      end;
      Gfacturador.Columns.Items[2].ReadOnly := true;

      Gfacturador.DataSource.DataSet.Next;

    end;

  end;
end;

procedure TFfacturador.reos;
var
  descuento: titemdescuento;
  Key: Char;
begin
  if (los.Text <> '') then
  begin
    Gfacturador.DataSource.DataSet.First;

    while not Gfacturador.DataSource.DataSet.Eof do
    begin

      descuento := CalcularDescuento(Ticket.sucursal,
        (dmFacturador.dprincipalcod_alfabeta.AsString), Eos.Text, Eco1.Text,
        Eco2.Text, eafiliado.Text, ECO1AFILIADO.Text, eco2afiliado.Text,
        (dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString));
       marTipoDescCo1:= descuento.mar_cos1;
              marTipoDescCo2:= descuento.mar_cos2;
      dmFacturador.DPRINCIPAL.Edit;

      dmFacturador.DPRINCIPALPORCENTAJEOS.Asfloat := descuento.Porc_os;
      dmFacturador.DPRINCIPAL.Post;
      Key := #13;
      Gfacturador.OnKeyPress(SELF, Key);
      Gfacturador.DataSource.DataSet.Next;
    end;
  end;

end;

procedure TFfacturador.reosempty;
var
  descuento: titemdescuento;
  descuentoint: double;
begin
  if (los.Text = '') then
  begin
    Gfacturador.DataSource.DataSet.First;

    while not Gfacturador.DataSource.DataSet.Eof do
    begin

      descuento := CalcularDescuento(Ticket.sucursal,
        (dmFacturador.dprincipalcod_alfabeta.AsString), Eos.Text, Eco1.Text,
        Eco2.Text, eafiliado.Text, ECO1AFILIADO.Text, eco2afiliado.Text,
        (dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString));
        marTipoDescCo1:= descuento.mar_cos1;
              marTipoDescCo2:= descuento.mar_cos2;
      dmFacturador.DPRINCIPAL.Edit;
      dmFacturador.DPRINCIPALPORCENTAJEOS.Asfloat := descuento.Porc_os;
      if Gfacturador.Fields[3].AsString = '' then
      begin
        dmFacturador.DPRINCIPALCANTIDAD.Asinteger := 1;
      end;
      if Gfacturador.Fields[3].AsString = '0' then
      begin
        dmFacturador.DPRINCIPALCANTIDAD.Asinteger := 1;
      end;

      if Gfacturador.Fields[3].AsString <> '' then
      begin
        descuentoint := 0;
        descuentoint := Gfacturador.Fields[11].Asfloat + Gfacturador.Fields[12]
          .Asfloat + Gfacturador.Fields[13].Asfloat;
        if descuentoint > 100 then
        begin
          descuentoint := 100;
        end;
        dmFacturador.dprincipalporcentaje.Asfloat := descuentoint;
        dmFacturador.DPRINCIPALCANTIDAD.Asinteger := Gfacturador.Fields[3]
          .Asinteger;
        dmFacturador.dprincipalPrecio_Total.Asfloat :=
          dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat;
        dmFacturador.dprincipalDESCUENTOS.Asfloat :=
          (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat) *
          ((Gfacturador.Fields[7].Asfloat) / 100);
        dmFacturador.dprincipalprecio_totaldesc.Asfloat :=
          dmFacturador.dprincipalPrecio_Total.Asfloat -
          dmFacturador.dprincipalDESCUENTOS.Asfloat;
        dmFacturador.dprincipalDESCUENTOSOS.AsCurrency :=
          (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat) *
          ((Gfacturador.Fields[11].Asfloat) / 100);
        dmFacturador.dprincipalDESCUENTOco1.AsCurrency :=
          (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat) *
          ((Gfacturador.Fields[12].Asfloat) / 100);
        dmFacturador.dprincipalDESCUENTOco2.AsCurrency :=
          (dmFacturador.DPRINCIPALCANTIDAD.Asfloat *
          dmFacturador.dprincipalPRECIO.Asfloat) *
          ((Gfacturador.Fields[13].Asfloat) / 100);
        arregladescuento;
        dmFacturador.DPRINCIPAL.Post;

      end;
      Gfacturador.Columns.Items[2].ReadOnly := true;

      Gfacturador.DataSource.DataSet.Next;

    end;

  end;
end;

procedure TFfacturador.setCoseguro1(coseguro: String);
begin
  Eco1.Text := coseguro;
end;

procedure TFfacturador.SetTicket(unTicket: TTicket);
begin
  Ticket := unTicket;
end;

procedure TFfacturador.tbCoberturaExit(Sender: TObject);
var
  dias: Integer;
begin
  if los.Text <> '' then
  begin
    dias := trunc(now - dtfecreceta.DateTime) + 1;

    if dias <= strtoint(Ticket.dias_validez) then
    begin


      // bgrabarafiliado.Click;
      // bgrabarmedico.Click;

    end
    else
    begin
      showmessage('RECETA VENCIDA CORRIJA LOS DATOS');

    end;
  end;

end;

procedure TFfacturador.tbCoseguroExit(Sender: TObject);

var
  dias: Integer;
begin
  if lco1.Text <> '' then
  begin
    dias := trunc(now - dtfeccoseguro.DateTime) + 1;

    if dias <= strtoint(Ticket.dias_validezco) then
    begin


      // bgrabarafiliado.Click;
      // bgrabarmedico.Click;

    end
    else
    begin
      showmessage('RECETA VENCIDA CORRIJA LOS DATOS');

    end;
  end;

end;

function TFfacturador.verificarMatricula: Boolean;
var
detener:boolean;

begin
  detener:= True;
   if not(TUtils.esCampoVacio(eos.Text)) and (TUtils.esCampoVacio(eosmedicoAPELLIDO.Text) OR TUtils.esCampoVacio(EOSMEDICONOMBRE.Text)
      OR TUtils.esCampoVacio(Eosmatricula.Text)  ) then
   begin

        detener:= False;

   end;


   Result:= detener;

end;



procedure TFfacturador.verificarcaja;
var
  reg: tregistry;
begin
  reg := tregistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  reg.OpenKey(RegKey, true);
  dmFacturador.basecfg.Connected := false;

  dmFacturador.basecfg.DatabaseName := reg.ReadString('rutabasecfg');

  dmFacturador.basecfg.Params.Values['User_Name'] := 'SYSDBA';
  dmFacturador.basecfg.Params.Values['Password'] := 'nmpnet';
  dmFacturador.basecfg.LoginPrompt := false;
  dmFacturador.qcaja.Close;

  dmFacturador.ibqcaja.Close;
  dmFacturador.ibqcaja.SQL.Clear;
  dmFacturador.ibqcaja.SQL.Text :=
    concat('SELECT DISTINCT c.NRO_CAJA, a.des_caja, MAX(FEC_OPERACIONES) FROM cjmaapertura c, cjmacaja a WHERE c.nro_caja=a.nro_caja and c.nro_sucursal=a.nro_sucursal and c.nro_caja=:caja and MAR_CAJA=''S'' GROUP BY 1,2');
  dmFacturador.ibqcaja.ParamByName('caja').AsString := Ticket.nro_caja;
  dmFacturador.ibqcaja.Open;

  if dmFacturador.ibqcaja.Fields[1].Text = '' then
  BEGIN
    showmessage('PUESTO SIN CAJA ASIGNADA IMPOSIBLE CONTINUAR');
    application.Terminate;
  END;

end;

end.

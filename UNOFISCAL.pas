unit UNOFISCAL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, uUtils,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, registry, udmfacturador, udticket, UCALCULARDESCUENTO,
  ustock, ufacturaonline, uticket, Math, umodificar, uproductosd, uprogreso, buscaros, ubuscardatos
  ,ubuscarco1, udrogas, udesdroga, ubusquedaproductos, ucomprob,passaj,uMessageDLG,uRegistryHelper,
  // Refactorizacion
    uMedico,uMedicoService,uAfiliado,uAfiliadoService,uCalculadoraPrecio;



type
  TFNOFISCAL = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label8: TLabel;
    Evendedor: TEdit;
    Panel2: TPanel;
    Label14: TLabel;
    ebusqueda: TEdit;
    bbuscar: TButton;
    Rbusqueda: TRadioGroup;
    Gfacturador: TDBGrid;
    Label27: TLabel;
    importetotal: TDBText;
    Label44: TLabel;
    descuentoos: TDBText;
    Label28: TLabel;
    Label45: TLabel;
    descuentos: TDBText;
    descuentoco1: TDBText;
    Label46: TLabel;
    Label29: TLabel;
    netoacobrar: TDBText;
    descuentoco2: TDBText;
    Blimpiartodo: TBitBtn;
    imprimir: TBitBtn;
    DESCOBER: TBitBtn;
    pgCoberturas: TPageControl;
    tbCobertura: TTabSheet;
    Label2: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label30: TLabel;
    Ltratamiento: TLabel;
    Eos: TEdit;
    Panel4: TPanel;
    desbloqueo: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    eafiliado: TEdit;
    eosapellido: TEdit;
    eosmedicoAPELLIDO: TEdit;
    dtfecreceta: TDateTimePicker;
    Eosmatricula: TEdit;
    eosreceta: TEdit;
    blimpiar: TBitBtn;
    Cosprovincia: TComboBox;
    EOSMEDICONOMBRE: TEdit;
    eosnombre: TEdit;
    los: TEdit;
    tbCoseguro: TTabSheet;
    Label3: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Eco1: TEdit;
    Panel5: TPanel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    ECO1AFILIADO: TEdit;
    ECO1apellido: TEdit;
    ECO1apellidoMEDICO: TEdit;
    dtfeccoseguro: TDateTimePicker;
    ECO1MATRICULA: TEdit;
    eco1receta: TEdit;
    blimpiarco1: TBitBtn;
    eco1nombremedico: TEdit;
    ComboBox1: TComboBox;
    eco1nombre: TEdit;
    lco1: TEdit;
    tbCoseguro2: TTabSheet;
    Label4: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Eco2: TEdit;
    Panel3: TPanel;
    eco2afiliado: TEdit;
    eco2nombre: TEdit;
    eco2medico: TEdit;
    eco2especialidad: TEdit;
    eco2diagnostico: TEdit;
    DateTimePicker2: TDateTimePicker;
    eco2matricula: TEdit;
    eco2receta: TEdit;
    Limpiar: TBitBtn;
    lco2: TEdit;
    Proveedor: TTabSheet;
    pinformativo: TPanel;
    Label47: TLabel;
    cuitproveedor: TEdit;
    Cletrafactura: TComboBox;
    Label49: TLabel;
    Label48: TLabel;
    facturanro: TEdit;
    blimpiarprov: TBitBtn;
    BitBtn1: TBitBtn;
    epv: TEdit;
    Label50: TLabel;
    bmodificable: TButton;
    bgrabarafiliado: TBitBtn;
    bgrabarmedico: TBitBtn;
    bagregarafico: TBitBtn;
    bagregarmedico: TBitBtn;
    Shape1: TShape;
    Label6: TLabel;
    ecomprob: TEdit;
    lcomprob: TLabel;
    Label7: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    ecuit: TEdit;
    procedure FormShow(Sender: TObject);
    procedure EvendedorChange(Sender: TObject);
    procedure bbuscarClick(Sender: TObject);

    procedure ebusquedaEnter(Sender: TObject);
    procedure ebusquedaKeyPress(Sender: TObject; var Key: Char);
    procedure gproductoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GfacturadorExit(Sender: TObject);
    procedure GfacturadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GfacturadorKeyPress(Sender: TObject; var Key: Char);
     procedure arregladescuento;
    procedure BitBtn1Click(Sender: TObject);
    procedure leerTicket();
    procedure imprimirClick(Sender: TObject);
    procedure BlimpiartodoClick(Sender: TObject);
    procedure blimpiarprovClick(Sender: TObject);
    procedure DESCOBERClick(Sender: TObject);
    procedure BcancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EvendedorEnter(Sender: TObject);
    procedure EvendedorExit(Sender: TObject);
    procedure ebusquedaExit(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure facturanroExit(Sender: TObject);
    procedure bmodificableClick(Sender: TObject);
    procedure limpiarunidadticket;
    procedure EvendedorKeyPress(Sender: TObject; var Key: Char);
    procedure cuitproveedorKeyPress(Sender: TObject; var Key: Char);
    procedure epvKeyPress(Sender: TObject; var Key: Char);
    procedure facturanroKeyPress(Sender: TObject; var Key: Char);
    procedure combotipoKeyPress(Sender: TObject; var Key: Char);
    procedure EosChange(Sender: TObject);
    procedure EosEnter(Sender: TObject);
    procedure EosExit(Sender: TObject);
    procedure EosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure losChange(Sender: TObject);
    procedure eafiliadoChange(Sender: TObject);
    procedure eafiliadoEnter(Sender: TObject);
    procedure eafiliadoExit(Sender: TObject);
    procedure eafiliadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eafiliadoKeyPress(Sender: TObject; var Key: Char);
    procedure eosapellidoKeyPress(Sender: TObject; var Key: Char);
    procedure eosapellidoEnter(Sender: TObject);
    procedure eosapellidoExit(Sender: TObject);
    procedure eosnombreEnter(Sender: TObject);
    procedure eosnombreExit(Sender: TObject);
    procedure eosnombreKeyPress(Sender: TObject; var Key: Char);
    procedure EosmatriculaChange(Sender: TObject);
    procedure EosmatriculaEnter(Sender: TObject);
    procedure EosmatriculaExit(Sender: TObject);
    procedure EosmatriculaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EosmatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure eosmedicoAPELLIDOEnter(Sender: TObject);
    procedure eosmedicoAPELLIDOExit(Sender: TObject);
    procedure EOSMEDICONOMBREEnter(Sender: TObject);
    procedure EOSMEDICONOMBREExit(Sender: TObject);
    procedure eosmedicoAPELLIDOKeyPress(Sender: TObject; var Key: Char);
    procedure EOSMEDICONOMBREKeyPress(Sender: TObject; var Key: Char);
    procedure eosrecetaEnter(Sender: TObject);
    procedure eosrecetaExit(Sender: TObject);
    procedure eosrecetaKeyPress(Sender: TObject; var Key: Char);
    procedure dtfecrecetaKeyPress(Sender: TObject; var Key: Char);
    procedure bgrabarafiliadoClick(Sender: TObject);
    procedure bgrabarmedicoClick(Sender: TObject);
    procedure Eco1Change(Sender: TObject);
    procedure lco1Change(Sender: TObject);
    procedure Eco1Enter(Sender: TObject);
    procedure Eco1Exit(Sender: TObject);
    procedure Eco1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Eco1KeyPress(Sender: TObject; var Key: Char);
    procedure ECO1AFILIADOChange(Sender: TObject);
    procedure ECO1AFILIADOEnter(Sender: TObject);
    procedure ECO1AFILIADOExit(Sender: TObject);
    procedure ECO1AFILIADOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECO1AFILIADOKeyPress(Sender: TObject; var Key: Char);
    procedure ECO1apellidoEnter(Sender: TObject);
    procedure ECO1apellidoExit(Sender: TObject);
    procedure ECO1apellidoKeyPress(Sender: TObject; var Key: Char);
    procedure eco1nombreEnter(Sender: TObject);
    procedure eco1nombreExit(Sender: TObject);
    procedure eco1nombreKeyPress(Sender: TObject; var Key: Char);
    procedure ECO1MATRICULAChange(Sender: TObject);
    procedure ECO1MATRICULAEnter(Sender: TObject);
    procedure ECO1MATRICULAExit(Sender: TObject);
    procedure ECO1MATRICULAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECO1MATRICULAKeyPress(Sender: TObject; var Key: Char);
    procedure ECO1apellidoMEDICOEnter(Sender: TObject);
    procedure ECO1apellidoMEDICOExit(Sender: TObject);
    procedure ECO1apellidoMEDICOKeyPress(Sender: TObject; var Key: Char);
    procedure eco1nombremedicoEnter(Sender: TObject);
    procedure eco1nombremedicoExit(Sender: TObject);
    procedure eco1nombremedicoKeyPress(Sender: TObject; var Key: Char);
    procedure eco1recetaKeyPress(Sender: TObject; var Key: Char);
    procedure dtfeccoseguroKeyPress(Sender: TObject; var Key: Char);
    procedure blimpiarClick(Sender: TObject);
    procedure blimpiarco1Click(Sender: TObject);
    procedure combotipoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ecomprobChange(Sender: TObject);
    procedure ecomprobKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ecomprobEnter(Sender: TObject);
    procedure ecomprobExit(Sender: TObject);
    procedure cuitproveedorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bagregaraficoClick(Sender: TObject);
    procedure bagregarmedicoClick(Sender: TObject);
    procedure Eco2KeyPress(Sender: TObject; var Key: Char);
    procedure eco1recetaEnter(Sender: TObject);
    procedure eco1recetaExit(Sender: TObject);



  private
   Ticket:TTicket;
   ENTER:Char;
   medicoService:TMedicoService;
   afiliadoService:TAfiliadoService;
   recargoHosp: double;
   esAfiliadoValido,esMedicoValido:boolean;
   calcuPrecio:TCalculadoraPrecio;
    procedure guardarMedico(eCodPlanos:TEdit;eNroMatricula:TEdit;eNombre:TEdit;eApellido:TEdit);
    procedure guardarAfiliado(eCodPlanos:TEdit;eNroAfiliado:TEdit;eNombre:TEdit;eApellido:TEdit);
    procedure buscarMedico(eCodPlanos:TEdit;eNroMatricula:TEdit;eNombre:TEdit;eApellido:TEdit);
    procedure buscarAfiliado(eCodPlanos:TEdit;eNroAfiliado:TEdit;eNombre:TEdit;eApellido:TEdit);
    procedure validarAfiliado(eNroAfiliado:TEdit;eNombre:TEdit;eApellido:TEdit);
    procedure validarMedico(ematricula:TEdit;eNombre:TEdit;eApellido:TEdit);
    procedure setRecargoHosp;


  public

  procedure SetTicket(unTicket:TTicket);
  procedure precio;
  procedure reos;
  procedure reosempty;
  procedure reco1;
  procedure reco1empty;
  end;

var
     FNOFISCAL: TFNOFISCAL;
     codigo_validador, codigo_os_validador: string;
     porvarlabo: double;
     porvarrubro: double;
     preciocrudo: double;
     preciocalculado: double;

implementation

{$R *.dfm}

uses facturador;


type
  DBGridExt = class(TDBGrid);




procedure TFNOFISCAL.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;

end;


procedure TFNOFiscal.setRecargoHosp;
var
  registro:TRegistryHelper;
  porcentajeHosp:string;
begin
    registro:= TRegistryHelper.Create;


   porcentajeHosp := registro.LeerValor('RecargoHosp');
  if (not TUtils.esNumero(porcentajeHosp)) or (strToInt(porcentajeHosp) < 0) then
  begin
    recargoHosp := 1.45; // Recargo 45% a hospitales por defecto
    registro.EscribirValor('RecargoHosp','45');
  end
  else

  begin
    recargoHosp := 1 + (strToInt(porcentajeHosp) / 100);
  end;
end;





procedure TFNOFISCAL.buscarMedico(eCodPlanos: TEdit; eNroMatricula: TEdit; eNombre: TEdit; eApellido: TEdit);
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

procedure TFNOFISCAL.buscarAfiliado(eCodPlanos: TEdit; eNroAfiliado: TEdit; eNombre: TEdit; eApellido: TEdit);
var
  afiliado:TAfiliado;
begin
   afiliado:= afiliadoService.buscarAfiliado(eCodPlanos.Text,eNroAfiliado.Text);

   if Assigned(afiliado) then
   begin
      enombre.Text:= afiliado.nombre;
      eApellido.Text:= afiliado.apellido;
      exit;
   end;

   enombre.Text:='';
   eapellido.Text:= '';



end;


procedure TFNOFISCAL.guardarAfiliado(eCodPlanos:TEdit;eNroAfiliado:TEdit;eNombre:TEdit;eApellido:TEdit);
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

procedure TFNOFISCAL.guardarMedico(eCodPlanos: TEdit; eNroMatricula: TEdit; eNombre: TEdit; eApellido: TEdit);
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
      showmessage('Inserte Apellido de médico');
      eApellido.SetFocus;
      exit;
   end;

   if eNombre.TEXT='' then
   begin
      showmessage('Inserte nombre de médico');
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




procedure TFNOFISCAL.FormCreate(Sender: TObject);
begin
    medicoService:= TMedicoService.Create;
    afiliadoService:= TAfiliadoService.Create;
    calcuPrecio:= TCalculadoraPrecio.Create(0);
end;


procedure TFNOFISCAL.bagregaraficoClick(Sender: TObject);
begin
  // Sale si no existe afiliado por coseguro
  if Length(pchar(trim(eco1afiliado.text))) <1 then
  begin
    esAfiliadoValido:= true;
    exit;
  end;


  guardarAfiliado(eco1,ECO1AFILIADO,eco1nombre,ECO1apellido);
end;

procedure TFNOFISCAL.bagregarmedicoClick(Sender: TObject);
begin
   if (ECO1MATRICULA.Text = '') and (eco1nombremedico.Text = '')
    and (ECO1apellidoMEDICO.Text = '') then
    begin
      esMedicoValido:= true;
      exit;
    end;


   guardarMedico(eco1,ECO1MATRICULA,eco1nombremedico,ECO1apellidoMEDICO);
end;

procedure TFNOFISCAL.bbuscarClick(Sender: TObject);




var

A: INTEGER;
descuento: titemdescuento;
cobOS:double;
cobCos1:double;
cobcos2: double;
Valor: extended;
espacios: string;
value: integer;
form: tfprogreso;
form3: tfbusquedaproductos;
form2: tfdrogas;
form4: tfdescripciondroga;
r1descuento: double;
begin
 form:=tfprogreso.Create(self);

  form.Show;
  application.ProcessMessages;
  dmfacturador.dsecundario.Close;
 //------------------------------------------------busqueda por descripcion/codigo troquel/ barras--------------------------------/ /
  if rbusqueda.ItemIndex=0 then
   begin
    dmFacturador.AbrirConexion();

         if Length(ebusqueda.text)>0  then
            begin
            dmfacturador.qbusqueda.Close;
            dmfacturador.qbusqueda.SQL.Clear;
            dmfacturador.qbusqueda.SQL.Text:=concat(' select first(100) ',
                                                    '  DISTINCT a.cod_alfabeta, ',
                                                    '  a.nro_troquel,   ',
                                                    '  a.cod_barraspri,  ',
                                                    '  a.nom_largo, ',
                                                    '  a.cod_iva, ',
                                                    '  s.can_stk, ',
                                                    '  a.cod_tamano, ',
                                                    '  a.cod_laboratorio, ',
                                                    ' coalesce(CAST(   ',
                                                    ' CASE  ',
                                                    ' WHEN a.mar_impsug=''N'' and a.mar_precioventa=''S'' THEN  ',
                                                    ' b.imp_venta  ',
                                                    ' when a.mar_impsug=''N'' and a.mar_precioventa=''N'' THEN ',
                                                    ' (b.imp_compra*(1+r.por_margen/100)) ',
                                                    '  when a.mar_impsug=''S'' AND A.mar_precioventa=''S'' then ',
                                                    ' (a.imp_sugerido) ',
                                                    ' when A.mar_impsug=''S'' AND A.mar_precioventa=''N'' then ',
                                                    '  ((a.imp_sugerido*r.por_margen/100) + a.imp_sugerido) ',
                                                    '  END AS DECIMAL (10,2)),0) as PRECIO, ',
                                                    ' c.POR_VAR_PRECIO as varlabo,  ',
                                                    ' r.por_var_precio as VARRUBRO,  ',
                                                    ' r.cod_rubro,  ',
                                                    ' d.des_droga,  ',
                                                    ' f.des_accfarm,  ',
                                                    ' c.nom_laboratorio ',
                                                    ' from  prmalaboratorio c, prmarubro r,   ',
                                                    ' prmaproducto a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta ',
                                                    ' LEFT JOIN prmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm  ',
                                                    ' LEFT JOIN prmamonodroga d ON  D.cod_droga=a.cod_droga   ',
                                                    ' left join   prmastock s on    a.cod_alfabeta=s.cod_alfabeta and s.nro_sucursal=b.nro_sucursal ',
                                                    ' where (cod_barraspri= :Barras Or NRO_TROQUEL= :Troquel or (a.nom_largo like :nombre ) ) ',
                                                    ' AND a.cod_rubro=r.cod_rubro ',
                                                    ' and c.cod_laboratorio=a.cod_laboratorio ',
                                                    ' and not(mar_baja=''S'' and s.can_stk=0) ',
                                                    ' and b.nro_sucursal=:sucursal ');



  //INACTIVOS

           // DMFACTURADOR.qbusqueda.SQL.SaveToFile('SQL.TXT');
            if TextToFloat(PChar(ebusqueda.text),Valor,fvExtended) then
            begin
            dmfacturador.qbusqueda.ParamByName('barras').AsString:=ebusqueda.Text;
            end;
            if tryStrToInt(ebusqueda.Text, value)then
            begin
            dmfacturador.qbusqueda.parambyname('troquel').asinteger:=value;
            end;
             dmfacturador.qbusqueda.ParamByName('sucursal').AsString:=dmFacturador.getSucursal();
            if not TextToFloat(PChar(ebusqueda.text),Valor,fvExtended) then
            begin
             espacios:= StringReplace(ebusqueda.text, ' ', '%', [rfReplaceAll]);
             dmfacturador.qbusqueda.ParamByName('nombre').AsString:='%'+espacios+'%';
            end;
             dmfacturador.qbusqueda.Open;
//------------------------insersion en grilla de busqueda--------------//
                if not  dmfacturador.qbusqueda.IsEmpty then
                 Begin

                     While not dmfacturador.qbusqueda.Eof do
                         begin
                           if dmfacturador.dsecundario.Active=false then
                            begin
                              dmfacturador.dsecundario.CreateDataSet;
                              dmfacturador.dsecundario.Active:=true;
                            end;
                            dmfacturador.dsecundario.Append;
                            dmfacturador.dsecundariocod_alfabeta.AsString:=dmfacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString;
                            dmfacturador.dsecundarionro_troquel.Asstring:=dmfacturador.qbusqueda.FieldByName('nro_troquel').AsString;
                            dmfacturador.dsecundariocod_barraspri.Asstring:=dmfacturador.qbusqueda.FieldByName('cod_barraspri').AsString;
                            dmfacturador.dsecundarionom_largo.AsString:=dmfacturador.qbusqueda.FieldByName('nom_largo').AsString;
                            dmfacturador.dsecundariocod_iva.AsString:=dmfacturador.qbusqueda.FieldByName('cod_iva').AsString;
                            dmfacturador.dsecundariocan_stk.AsString:=dmfacturador.qbusqueda.FieldByName('can_stk').AsString;

                            porvarlabo:=dmfacturador.qbusqueda.FieldByName('varlabo').AsFLOAT;
                            porvarrubro:=dmfacturador.qbusqueda.FieldByName('varrubro').Asfloat;
                            preciocrudo:=dmfacturador.qbusqueda.FieldByName('precio').Asfloat;
                            precio;
                            dmfacturador.dsecundarioprecio.AsString:=floattostr(preciocalculado);
                            //--------------------hospitales---------------------------//
                             if (TICKET.codigo_OS='ZBI') OR (TICKET.codigo_OS='ZBH') OR (TICKET.codigo_OS='ZA7')  OR (TICKET.codigo_OS='W14') OR (TICKET.codigo_OS='WVP') OR (TICKET.codigo_OS='WVR') OR (TICKET.codigo_OS='W15') OR (TICKET.codigo_OS='WVJ') OR (TICKET.codigo_OS='WVM') OR (TICKET.codigo_OS='WVD') OR (TICKET.codigo_OS='WVO') OR (TICKET.codigo_OS='WVG') OR (TICKET.codigo_OS='WVF') OR (TICKET.codigo_OS='WVH') OR (TICKET.codigo_OS='WVN') OR (TICKET.codigo_OS='WVE') OR (TICKET.codigo_OS='ZAE') OR (TICKET.codigo_OS='ZAF') OR (TICKET.codigo_OS='ZAG') OR (TICKET.codigo_OS='ZAI') OR (TICKET.codigo_OS='ZAL') OR (TICKET.codigo_OS='ZAM') OR (TICKET.codigo_OS='ZAN') OR (TICKET.codigo_OS='ZAO') OR (TICKET.codigo_OS='OFL') OR (TICKET.codigo_OS='OFN') OR (TICKET.codigo_OS='OFM') OR (TICKET.codigo_OS='OFK') OR (TICKET.codigo_OS='OFJ') OR (TICKET.codigo_OS='ZA2') OR (TICKET.codigo_OS='ZA3')   then
                              BEGIN

                              dmFacturador.dsecundarioprecio.AsFloat := preciocalculado*recargoHosp;

                              dmFacturador.dSECUNDARIOhosp.AsString:='S';

                              END;

                              if (ticket.codigo_Co1='ZBI') OR (ticket.codigo_Co1='ZBH') OR (ticket.codigo_Co1='ZA7')  OR (ticket.codigo_Co1='W14') OR (ticket.codigo_Co1='WVP') OR (ticket.codigo_Co1='WVR') OR (ticket.codigo_Co1='W15') OR (ticket.codigo_Co1='WVJ') OR (ticket.codigo_Co1='WVM') OR (ticket.codigo_Co1='WVD') OR (ticket.codigo_Co1='WVO') OR (ticket.codigo_Co1='WVG') OR (ticket.codigo_Co1='WVF') OR (ticket.codigo_Co1='WVH') OR (ticket.codigo_Co1='WVN') OR (ticket.codigo_Co1='WVE') OR (ticket.codigo_Co1='ZAE') OR (ticket.codigo_Co1='ZAF') OR (ticket.codigo_Co1='ZAG') OR (ticket.codigo_Co1='ZAI') OR (ticket.codigo_Co1='ZAL') OR (ticket.codigo_Co1='ZAM') OR (ticket.codigo_Co1='ZAN') OR (ticket.codigo_Co1='ZAO') OR (ticket.codigo_Co1='OFL') OR (ticket.codigo_Co1='OFN') OR (ticket.codigo_Co1='OFM') OR (ticket.codigo_Co1='OFK') OR (ticket.codigo_Co1='OFJ') OR (ticket.codigo_Co1='ZA2') OR (ticket.codigo_Co1='ZA3')   then
                              BEGIN
                              dmFacturador.dsecundarioprecio.AsFloat := preciocalculado*recargoHosp;
                              dmFacturador.dSECUNDARIOhosp.AsString:='S';
                              END;

                              if (ticket.codigo_Cos2='ZBI') OR (ticket.codigo_Cos2='ZBH') OR (ticket.codigo_Cos2='ZA7')  OR (ticket.codigo_Cos2='W14') OR (ticket.codigo_Cos2='WVP') OR (ticket.codigo_Cos2='WVR') OR (ticket.codigo_Cos2='W15') OR (ticket.codigo_Cos2='WVJ') OR (ticket.codigo_Cos2='WVM') OR (ticket.codigo_Cos2='WVD') OR (ticket.codigo_Cos2='WVO') OR (ticket.codigo_Cos2='WVG') OR (ticket.codigo_Cos2='WVF') OR (ticket.codigo_Cos2='WVH') OR (ticket.codigo_Cos2='WVN') OR (ticket.codigo_Cos2='WVE') OR (ticket.codigo_Cos2='ZAE') OR (ticket.codigo_Cos2='ZAF') OR (ticket.codigo_Cos2='ZAG') OR (ticket.codigo_Cos2='ZAI') OR (ticket.codigo_Cos2='ZAL') OR (ticket.codigo_Cos2='ZAM') OR (ticket.codigo_Cos2='ZAN') OR (ticket.codigo_Cos2='ZAO') OR (ticket.codigo_Cos2='OFL') OR (ticket.codigo_Cos2='OFN') OR (ticket.codigo_Cos2='OFM') OR (ticket.codigo_Cos2='OFK') OR (ticket.codigo_Cos2='OFJ') OR (ticket.codigo_Cos2='ZA2') OR (ticket.codigo_Cos2='ZA3')   then
                              BEGIN
                              dmFacturador.dsecundarioprecio.AsFloat :=preciocalculado*recargoHosp;
                              dmFacturador.dSECUNDARIOhosp.AsString:='S';
                              END;

                              if NOT ((TICKET.codigo_OS='ZBI') OR (TICKET.codigo_OS='ZBH') OR (TICKET.codigo_OS='ZA7')  OR (TICKET.codigo_OS='W14') OR (TICKET.codigo_OS='WVP') OR (TICKET.codigo_OS='WVR') OR (TICKET.codigo_OS='W15') OR (TICKET.codigo_OS='WVJ') OR (TICKET.codigo_OS='WVM') OR (TICKET.codigo_OS='WVD') OR (TICKET.codigo_OS='WVO') OR (TICKET.codigo_OS='WVG') OR (TICKET.codigo_OS='WVF') OR (TICKET.codigo_OS='WVH') OR (TICKET.codigo_OS='WVN') OR (TICKET.codigo_OS='WVE') OR (TICKET.codigo_OS='ZAE') OR (TICKET.codigo_OS='ZAF') OR (TICKET.codigo_OS='ZAG') OR (TICKET.codigo_OS='ZAI') OR (TICKET.codigo_OS='ZAL') OR (TICKET.codigo_OS='ZAM') OR (TICKET.codigo_OS='ZAN') OR (TICKET.codigo_OS='ZAO') OR (TICKET.codigo_OS='OFL') OR (TICKET.codigo_OS='OFN') OR (TICKET.codigo_OS='OFM') OR (TICKET.codigo_OS='OFK') OR (TICKET.codigo_OS='OFJ') OR (TICKET.codigo_OS='ZA2') OR (TICKET.codigo_OS='ZA3')  ) then
                              BEGIN
                              if not ((ticket.codigo_Co1='ZBI') OR (ticket.codigo_Co1='ZBH') OR (ticket.codigo_Co1='ZA7')  OR (ticket.codigo_Co1='W14') OR (ticket.codigo_Co1='WVP') OR (ticket.codigo_Co1='WVR') OR (ticket.codigo_Co1='W15') OR (ticket.codigo_Co1='WVJ') OR (ticket.codigo_Co1='WVM') OR (ticket.codigo_Co1='WVD') OR (ticket.codigo_Co1='WVO') OR (ticket.codigo_Co1='WVG') OR (ticket.codigo_Co1='WVF') OR (ticket.codigo_Co1='WVH') OR (ticket.codigo_Co1='WVN') OR (ticket.codigo_Co1='WVE') OR (ticket.codigo_Co1='ZAE') OR (ticket.codigo_Co1='ZAF') OR (ticket.codigo_Co1='ZAG') OR (ticket.codigo_Co1='ZAI') OR (ticket.codigo_Co1='ZAL') OR (ticket.codigo_Co1='ZAM') OR (ticket.codigo_Co1='ZAN') OR (ticket.codigo_Co1='ZAO') OR (ticket.codigo_Co1='OFL') OR (ticket.codigo_Co1='OFN') OR (ticket.codigo_Co1='OFM') OR (ticket.codigo_Co1='OFK') OR (ticket.codigo_Co1='OFJ') OR (ticket.codigo_Co1='ZA2') OR (ticket.codigo_Co1='ZA3'))   then
                                BEGIN
                                if not ((ticket.codigo_Cos2='ZBI') OR (ticket.codigo_Cos2='ZBH') OR (ticket.codigo_Cos2='ZA7')  OR (ticket.codigo_Cos2='W14') OR (ticket.codigo_Cos2='WVP') OR (ticket.codigo_Cos2='WVR') OR (ticket.codigo_Cos2='W15') OR (ticket.codigo_Cos2='WVJ') OR (ticket.codigo_Cos2='WVM') OR (ticket.codigo_Cos2='WVD') OR (ticket.codigo_Cos2='WVO') OR (ticket.codigo_Cos2='WVG') OR (ticket.codigo_Cos2='WVF') OR (ticket.codigo_Cos2='WVH') OR (ticket.codigo_Cos2='WVN') OR (ticket.codigo_Cos2='WVE') OR (ticket.codigo_Cos2='ZAE') OR (ticket.codigo_Cos2='ZAF') OR (ticket.codigo_Cos2='ZAG') OR (ticket.codigo_Cos2='ZAI') OR (ticket.codigo_Cos2='ZAL') OR (ticket.codigo_Cos2='ZAM') OR (ticket.codigo_Cos2='ZAN') OR (ticket.codigo_Cos2='ZAO') OR (ticket.codigo_Cos2='OFL') OR (ticket.codigo_Cos2='OFN') OR (ticket.codigo_Cos2='OFM') OR (ticket.codigo_Cos2='OFK') OR (ticket.codigo_Cos2='OFJ') OR (ticket.codigo_Cos2='ZA2') OR (ticket.codigo_Cos2='ZA3')) then
                                  begin
                                  dmFacturador.dsecundarioprecio.AsFloat :=preciocalculado;
                                  dmFacturador.dSECUNDARIOhosp.AsString:='N';

                                  end;
                                END;
                              END;
                               //--------------------hospitales---------------------------//
                           // dmfacturador.dsecundarioprecio.AsString:=dmfacturador.qbusqueda.FieldByName('precio').AsString;
                            ///------------------------si los campos de os no estan vacios--------------------------///
                            if ((los.Text<>'') or (lco1.Text<>'') or (lco2.Text<>''))  then
                            begin
                            descuento:=CalcularDescuento(ticket.sucursal, (dmfacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString),EOS.text,eco1.text,eco2.text,eafiliado.Text,eco1afiliado.Text,eco2afiliado.text,(dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString));
                            end;
                            ///-------------------------calculo de descuento preliminar--------------------------------//
                            if ((los.Text<>'') or (lco1.Text<>'') or (lco2.Text<>''))  then
                            begin
                            dmfacturador.dsecundariodescuento.AsFloat:=(descuento.getDescuentotal);
                              if (descuento.getDescuentotal)>0 then
                                begin
                                dmfacturador.dsecundarioPRECIO_TOTAL.AsFloat:=dmfacturador.dsecundarioprecio.asfloat*((descuento.getDescuentotal)/100);
                                end;
                            end;
                           if dmfacturador.dsecundariodescuento.IsNull then
                           begin
                             dmfacturador.dsecundarioDESCUENTO.AsFloat:=0;
                           end;

                            dmfacturador.dsecundarioPRECIO_TOTAL.AsFloat:=dmfacturador.dsecundarioprecio.asfloat;


                            dmfacturador.dsecundarioRUBRO.AsString:=dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString;

                            if los.Text<>'' then
                            begin
                                dmfacturador.dsecundarioDESCUENTOOS.asfloat:=descuento.Porc_os;
                                cobOS:=descuento.Porc_OS;
                            end;
                             if los.Text='' then
                            begin
                                dmfacturador.dsecundarioDESCUENTOOS.asfloat:=0;
                            end;


                             if lco1.Text<>'' then
                             begin
                              cobCos1:=DESCUENTO.porc_coseguro;
                              if cobCos1+cobOS>100 then
                              BEGIN
                                cobcos1:=100-cobOs;
                                if cobcos1<0 then
                                begin
                                  cobcos1:=0;
                                end;
                              END;
                             end;


                            if  lco1.Text<>'' then
                            begin
                                dmfacturador.dsecundarioDescuentoco1.Asfloat:=cobcos1;
                            end;
                             if  lco1.Text='' then
                            begin
                                dmfacturador.dsecundarioDescuentoco1.Asfloat:=0;
                            end;
                            if lco2.Text<>'' then
                            begin
                            cobCos2:=DESCUENTO.porc_coseguro2;
                            if cobos+cobCos1+cobcos2>100 then
                            BEGIN
                              cobcos2:=100-cobos-cobcos1;
                              if cobcos2<0 then
                              begin
                                cobcos2:=0;
                              end;
                            END;
                            end;
                            if lco2.Text<>'' then
                            begin
                                dmfacturador.dsecundarioDESCUENTOCO2.Asfloat:=cobcos2;
                            end;
                            if lco2.Text='' then
                            begin
                                dmfacturador.dsecundarioDESCUENTOCO2.Asfloat:=0;
                            end;
                            dmfacturador.dsecundarioCod_laboratorio.AsString:=dmfacturador.qbusqueda.FieldByName('cod_laboratorio').AsString;
                            dmfacturador.dsecundariocod_tamano.AsString:=dmfacturador.qbusqueda.FieldByName('cod_tamano').AsString;
                            dmfacturador.dsecundariodes_accion.AsString:=dmfacturador.qbusqueda.FieldByName('DES_ACCFARM').AsString;
                            dmfacturador.dsecundariodes_droga.AsString:=dmfacturador.qbusqueda.FieldByName('des_droga').AsString;
                            dmfacturador.qbusqueda.Next;

                          end;


                if  dmfacturador.qbusqueda.RecordCount=1 then
                 Begin

                      if dmfacturador.dprincipal.Active=false then
                      begin

                      dmfacturador.dprincipal.CreateDataSet;
                      dmfacturador.dprincipal.Active:=true;
                      end;
                      dmfacturador.dprincipal.Append;
                      dmfacturador.dprincipalNOM_LARGO.AsString:=dmfacturador.dsecundarioNOM_LARGO.AsString;
                      dmfacturador.dprincipalCANTIDAD.AsInteger:=0;
                      dmfacturador.dprincipalPRECIO.AsCurrency:=dmfacturador.dsecundarioPRECIO.AsCurrency;
                      dmfacturador.dprincipalcod_alfabeta.AsString:=dmfacturador.dsecundarioCOD_ALFABETA.AsString;
                      dmfacturador.dprincipalcod_barraspri.AsString:=dmfacturador.dsecundarioCOD_BARRASPRI.AsString;
                      dmfacturador.dprincipalNRO_troquel.AsString:=dmfacturador.dsecundarioNRO_TROQUEL.AsString;
                      dmfacturador.dprincipalcod_iva.AsString:=dmfacturador.dsecundarioCOD_IVA.AsString;
                      dmfacturador.dprincipalPrecio_Total.AsFloat:=dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat;
                      dmfacturador.dprincipalDESCUENTOS.AsFloat:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((dmfacturador.dsecundarioDESCUENTO.AsFloat/100));
                      r1descuento:=0;

                      r1descuento:=dmfacturador.dsecundarioDESCUENTOOS.AsFloat+dmfacturador.dsecundarioDESCUENTOco1.AsFloat+dmfacturador.dsecundarioDESCUENTOco2.AsFloat;
                       if r1descuento>100 then
                       begin
                       r1descuento:=100;
                       end;
                      dmfacturador.dprincipalporcentaje.AsFloat:=r1descuento;


                      dmfacturador.dprincipalprecio_totaldesc.AsFloat:=dmfacturador.DPRINCIPALprecio_total.AsFloat-dmfacturador.dprincipaldescuentos.AsFloat;
                      dmfacturador.DPRINCIPALPORCENTAJEOS.AsFloat:=dmfacturador.dsecundarioDESCUENTOOS.AsFloat;
                      dmfacturador.DPRINCIPALPORCENTAJEco1.AsFloat:=dmfacturador.dsecundarioDESCUENTOco1.AsFloat;
                      dmfacturador.DPRINCIPALPORCENTAJEco2.AsFloat:=dmfacturador.dsecundarioDESCUENTOco2.AsFloat;
                      dmfacturador.dprincipalDESCUENTOSOS.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[11].AsFLOAT)/100);
                      dmfacturador.dprincipalDESCUENTOco1.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[12].AsFLOAT)/100);
                      dmfacturador.dprincipalDESCUENTOco2.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[13].AsFLOAT)/100);
                      dmfacturador.DPRINCIPALCOD_LABORATORIO.AsString:=dmfacturador.dsecundarioCOD_LABORATORIO.AsString;
                      dmfacturador.DPRINCIPALcan_stk.Asinteger:=dmfacturador.dsecundarioCAN_STK.AsInteger;
                      dmfacturador.DPRINCIPALtamano.Asstring:=dmfacturador.qbusqueda.FieldByName('cod_tamano').AsString;
                      dmfacturador.DPRINCIPALrubro.AsString:=dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString;
                      dmfacturador.dprincipal.Post;
                      dmfacturador.dsecundario.Close;
                      ebusqueda.Clear;
                      gfacturador.SetFocus;

                      gfacturador.Selectedindex:=3;
                      gfacturador.EditorMode:=true;
                      dmfacturador.dprincipal.edit;
                      dmfacturador.dprincipalCANTIDAD.Clear;
                      if ffacturador.gfacturador.DataSource.DataSet.RecordCount>0 then
                        begin
                         imprimir.Enabled:=true;



                        end;


                        gfacturador.SetFocus;
                        end;
                 end;
                    form.Close;
                   if  dmfacturador.qbusqueda.RecordCount>1 then
                   Begin
                   form3:=tfbusquedaproductos.Create(self);
                   FORM3.SetTicket(TICKET);
                   form3.Showmodal;
                     if not gfacturador.DataSource.DataSet.IsEmpty then
                     begin
                        ebusqueda.Clear;
                        gfacturador.SetFocus;
                        gfacturador.Selectedindex:=3;
                        gfacturador.EditorMode:=true;
                        dmfacturador.dprincipal.edit;
                        dmfacturador.dprincipalCANTIDAD.Clear;
                        if ffacturador.gfacturador.DataSource.DataSet.RecordCount>0 then
                          begin
                           imprimir.Enabled:=true;



                          end;


                          gfacturador.SetFocus;
                          end;
                      end;
                  end;

              end;
//------------- DROGAS
if rbusqueda.ItemIndex=1 then
  begin
  form.Close;
  ticket.monodroga:='';
  dmfacturador.qdroga.SQL.Clear;
  dmfacturador.qdroga.Close;
  dmfacturador.qdroga.SQL.Text:=concat('select des_droga from prmamonodroga where des_droga like :droga ');
  espacios:= StringReplace(ebusqueda.text, ' ', '%', [rfReplaceAll]);
  dmfacturador.qdroga.ParamByName('droga').AsString:='%'+espacios+'%';
  dmfacturador.qdroga.Open;
  form2:=tfdrogas.Create(self);
  FORM2.SetTicket(TICKET);
  form2.ShowModal;

  form4:=tfdescripciondroga.Create(self);
  FORM4.SetTicket(TICKET);
  form4.ShowModal;



   dmFacturador.AbrirConexion();


  if Length(ebusqueda.text)>0  then
   begin
    form:=tfprogreso.Create(self);

    form.Show;
    application.ProcessMessages;
    dmfacturador.qbusqueda.SQL.Clear;
    dmfacturador.qbusqueda.Close;
    dmfacturador.qbusqueda.SQL.Text:=concat(' select first(100)',
                                                   ' DISTINCT a.cod_alfabeta, ',
                                                   ' a.nro_troquel, ',
                                                   ' a.cod_barraspri, ',
                                                   ' a.nom_largo, ',
                                                   ' a.cod_iva, ',
                                                   ' s.can_stk, ',
                                                   ' a.cod_laboratorio, ',
                                                   ' a.cod_tamano, ',
                                                   ' coalesce(CAST( ',
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
                                                     ' c.POR_VAR_PRECIO as varlabo, ',
                                                     ' r.por_var_precio as VARRUBRO, ',
                                                     ' r.cod_rubro, ',
                                                     ' d.des_droga,  ',
                                                     ' f.des_accfarm,  ',
                                                     ' c.nom_laboratorio ',
                                                     'from  prmalaboratorio c, prmarubro r, prmastock s, ',
                                                     'prmaproducto a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta LEFT JOIN prmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm LEFT JOIN prmamonodroga d ON  D.cod_droga=a.cod_droga ',
                                                     ' where (d.des_droga like :nombre )',
                                                     'and (a.nom_largo like :descripcion ) ',
                                                     'AND a.cod_rubro=r.cod_rubro ',
                                                     'and c.cod_laboratorio=a.cod_laboratorio ',
                                                     'and a.cod_alfabeta=s.cod_alfabeta ',
                                                     'and s.nro_sucursal=b.nro_sucursal ',
                                                     'and not(mar_baja=''S'' and s.can_stk=0) ',
                                                     'and b.nro_sucursal=:sucursal ');




      if not TextToFloat(PChar(ebusqueda.text),Valor,fvExtended) then
      begin
       espacios:= StringReplace(ticket.monodroga, ' ', '%', [rfReplaceAll]);
       dmfacturador.qbusqueda.ParamByName('nombre').AsString:='%'+espacios+'%';
       dmfacturador.qbusqueda.ParamByName('descripcion').AsString:='%'+ticket.desdroga+'%';
      end;
     dmfacturador.qbusqueda.ParamByName('sucursal').AsString:=dmFacturador.getSucursal();
     dmfacturador.qbusqueda.Open;
        if not  dmfacturador.qbusqueda.IsEmpty then
         Begin
           While not dmfacturador.qbusqueda.Eof do
           begin
            if dmfacturador.dsecundario.Active=false then
              begin
                dmfacturador.dsecundario.CreateDataSet;
                dmfacturador.dsecundario.Active:=true;
              end;
                dmfacturador.dsecundario.Append;
                dmfacturador.dsecundariocod_alfabeta.AsString:=dmfacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString;
                dmfacturador.dsecundarionro_troquel.Asstring:=dmfacturador.qbusqueda.FieldByName('nro_troquel').AsString;
                dmfacturador.dsecundariocod_barraspri.Asstring:=dmfacturador.qbusqueda.FieldByName('cod_barraspri').AsString;
                dmfacturador.dsecundarionom_largo.AsString:=dmfacturador.qbusqueda.FieldByName('nom_largo').AsString;
                dmfacturador.dsecundariocod_iva.AsString:=dmfacturador.qbusqueda.FieldByName('cod_iva').AsString;
                dmfacturador.dsecundariocan_stk.AsString:=dmfacturador.qbusqueda.FieldByName('can_stk').AsString;
                dmfacturador.dsecundarioprecio.AsString:=dmfacturador.qbusqueda.FieldByName('precio').AsString;
                ///------------------------si los campos de os no estan vacios--------------------------///
                if ((los.Text<>'') or (lco1.Text<>'') or (lco2.Text<>''))  then
                begin
                descuento:=CalcularDescuento(ticket.sucursal,(dmfacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString),EOS.text,eco1.text,eco2.text,eafiliado.Text,eco1afiliado.Text,eco2afiliado.text,(dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString));
                end;
                ///-------------------------calculo de descuento preliminar--------------------------------//
                if ((los.Text<>'') or (lco1.Text<>'') or (lco2.Text<>''))  then
                begin
                dmfacturador.dsecundariodescuento.AsFloat:=(descuento.getDescuentotal);
                  if (descuento.getDescuentotal)>0 then
                    begin
                    dmfacturador.dsecundarioPRECIO_TOTAL.AsFloat:=dmfacturador.dsecundarioprecio.asfloat*((descuento.getDescuentotal)/100);
                    end;
                end;
               if dmfacturador.dsecundariodescuento.IsNull then
               begin
                 dmfacturador.dsecundarioDESCUENTO.AsFloat:=0;
               end;

                dmfacturador.dsecundarioPRECIO_TOTAL.AsFloat:=dmfacturador.dsecundarioprecio.asfloat;


                dmfacturador.dsecundarioRUBRO.AsString:=dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString;

                if los.Text<>'' then
                begin
                    dmfacturador.dsecundarioDESCUENTOOS.asfloat:=descuento.Porc_os;
                    cobOS:=descuento.Porc_OS;
                end;
                 if los.Text='' then
                begin
                    dmfacturador.dsecundarioDESCUENTOOS.asfloat:=0;
                end;


                 if lco1.Text<>'' then
                 begin
                  cobCos1:=DESCUENTO.porc_coseguro;
                  if cobCos1+cobOS>100 then
                  BEGIN
                    cobcos1:=100-cobOs;
                    if cobcos1<0 then
                    begin
                      cobcos1:=0;
                    end;
                  END;
                 end;


          if  lco1.Text<>'' then
          begin
              dmfacturador.dsecundarioDescuentoco1.Asfloat:=cobcos1;
          end;
           if  lco1.Text='' then
          begin
              dmfacturador.dsecundarioDescuentoco1.Asfloat:=0;
          end;
          if lco2.Text<>'' then
          begin
          cobCos2:=DESCUENTO.porc_coseguro2;
          if cobos+cobCos1+cobcos2>100 then
          BEGIN
            cobcos2:=100-cobos-cobcos1;
            if cobcos2<0 then
            begin
              cobcos2:=0;
            end;
          END;
          end;
          if lco2.Text<>'' then
          begin
              dmfacturador.dsecundarioDESCUENTOCO2.Asfloat:=cobcos2;
          end;
          if lco2.Text='' then
          begin
              dmfacturador.dsecundarioDESCUENTOCO2.Asfloat:=0;
          end;
          dmfacturador.dsecundarioCod_laboratorio.AsString:=dmfacturador.qbusqueda.FieldByName('cod_laboratorio').AsString;
          dmfacturador.dsecundariocod_tamano.AsString:=dmfacturador.qbusqueda.FieldByName('cod_tamano').AsString;
          dmfacturador.dsecundariodes_accion.AsString:=dmfacturador.qbusqueda.FieldByName('DES_ACCFARM').AsString;
          dmfacturador.dsecundariodes_droga.AsString:=dmfacturador.qbusqueda.FieldByName('des_droga').AsString;
          dmfacturador.qbusqueda.Next;

        end;



      END;
    end;

     form.Close;
     if  dmfacturador.qbusqueda.RecordCount>1 then
       Begin
       form3:=tfbusquedaproductos.Create(self);
       FORM3.SetTicket(TICKET);
       form3.Showmodal;
         if not gfacturador.DataSource.DataSet.IsEmpty then
         begin
            ebusqueda.Clear;
            gfacturador.SetFocus;
            gfacturador.Selectedindex:=3;
            gfacturador.EditorMode:=true;
            dmfacturador.dprincipal.edit;
            dmfacturador.dprincipalCANTIDAD.Clear;
            if ffacturador.gfacturador.DataSource.DataSet.RecordCount>0 then
              begin
               imprimir.Enabled:=true;


              end;


              gfacturador.SetFocus;
          end;
        end;




    end;

//------------- ACCION FARMACO
if rbusqueda.ItemIndex=2 then
  begin

  dmFacturador.AbrirConexion();
  if Length(ebusqueda.text)>0  then
   begin
    dmfacturador.qbusqueda.Close;
    dmfacturador.qbusqueda.SQL.Text:=concat(' select first(100)',
                                            ' DISTINCT a.cod_alfabeta, ',
                                              ' a.nro_troquel, ',
                                              ' a.cod_barraspri, ',
                                              ' a.nom_largo, ',
                                               ' a.cod_iva, ',
                                               ' s.can_stk, ',
                                               ' a.cod_laboratorio, ',
                                               ' a.cod_tamano, ',
                                               ' coalesce(CAST( ',
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
                                               'c.POR_VAR_PRECIO as varlabo, ',
                                               'r.por_var_precio as VARRUBRO, ',
                                               'r.cod_rubro, ',
                                               'd.des_droga,  ',
                                               ' f.des_accfarm,  ',
                                               ' c.nom_laboratorio ',
                                               'from  prmalaboratorio c, prmarubro r, prmastock s, ',
                                               ' prmaproducto a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta ',
                                               ' LEFT JOIN prmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm LEFT JOIN prmamonodroga d ON  D.cod_droga=a.cod_droga ',
                                               ' where (f.des_accfarm like :nombre )',
                                               ' AND a.cod_rubro=r.cod_rubro ',
                                               ' and c.cod_laboratorio=a.cod_laboratorio ',
                                               ' and a.cod_alfabeta=s.cod_alfabeta ',
                                               ' and s.nro_sucursal=b.nro_sucursal ',
                                               ' and not(mar_baja=''S'' and s.can_stk=0) ',
                                               ' and b.nro_sucursal=:sucursal');





    if not TextToFloat(PChar(ebusqueda.text),Valor,fvExtended) then
      begin
       espacios:= StringReplace(ebusqueda.text, ' ', '%', [rfReplaceAll]);
       dmfacturador.qbusqueda.ParamByName('nombre').AsString:='%'+espacios+'%';
      end;
     dmfacturador.qbusqueda.ParamByName('sucursal').AsString:=dmFacturador.getSucursal();
     dmfacturador.qbusqueda.Open;
            if not  dmfacturador.qbusqueda.IsEmpty then
     Begin
       While not dmfacturador.qbusqueda.Eof do
       begin
         if dmfacturador.dsecundario.Active=false then
          begin
            dmfacturador.dsecundario.CreateDataSet;
            dmfacturador.dsecundario.Active:=true;
          end;
          dmfacturador.dsecundario.Append;
          dmfacturador.dsecundariocod_alfabeta.AsString:=dmfacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString;
          dmfacturador.dsecundarionro_troquel.Asstring:=dmfacturador.qbusqueda.FieldByName('nro_troquel').AsString;
          dmfacturador.dsecundariocod_barraspri.Asstring:=dmfacturador.qbusqueda.FieldByName('cod_barraspri').AsString;
          dmfacturador.dsecundarionom_largo.AsString:=dmfacturador.qbusqueda.FieldByName('nom_largo').AsString;
          dmfacturador.dsecundariocod_iva.AsString:=dmfacturador.qbusqueda.FieldByName('cod_iva').AsString;
          dmfacturador.dsecundariocan_stk.AsString:=dmfacturador.qbusqueda.FieldByName('can_stk').AsString;
          dmfacturador.dsecundarioprecio.AsString:=dmfacturador.qbusqueda.FieldByName('precio').AsString;
          ///------------------------si los campos de os no estan vacios--------------------------///
          if ((los.Text<>'') or (lco1.Text<>'') or (lco2.Text<>''))  then
          begin
          descuento:=CalcularDescuento(ticket.sucursal,(dmfacturador.qbusqueda.FieldByName('cod_Alfabeta').AsString),EOS.text,eco1.text,eco2.text,eafiliado.Text,eco1afiliado.Text,eco2afiliado.text,(dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString));
          end;
          ///-------------------------calculo de descuento preliminar--------------------------------//
          if ((los.Text<>'') or (lco1.Text<>'') or (lco2.Text<>''))  then
          begin
          dmfacturador.dsecundariodescuento.AsFloat:=(descuento.getDescuentotal);
            if (descuento.getDescuentotal)>0 then
              begin
              dmfacturador.dsecundarioPRECIO_TOTAL.AsFloat:=dmfacturador.dsecundarioprecio.asfloat*((descuento.getDescuentotal)/100);
              end;
          end;
         if dmfacturador.dsecundariodescuento.IsNull then
         begin
           dmfacturador.dsecundarioDESCUENTO.AsFloat:=0;
         end;

          dmfacturador.dsecundarioPRECIO_TOTAL.AsFloat:=dmfacturador.dsecundarioprecio.asfloat;


          dmfacturador.dsecundarioRUBRO.AsString:=dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString;

          if los.Text<>'' then
          begin
              dmfacturador.dsecundarioDESCUENTOOS.asfloat:=descuento.Porc_os;
              cobOS:=descuento.Porc_OS;
          end;
           if los.Text='' then
          begin
              dmfacturador.dsecundarioDESCUENTOOS.asfloat:=0;
          end;


           if lco1.Text<>'' then
           begin
            cobCos1:=DESCUENTO.porc_coseguro;
            if cobCos1+cobOS>100 then
            BEGIN
              cobcos1:=100-cobOs;
              if cobcos1<0 then
              begin
                cobcos1:=0;
              end;
            END;
           end;


          if  lco1.Text<>'' then
          begin
              dmfacturador.dsecundarioDescuentoco1.Asfloat:=cobcos1;
          end;
           if  lco1.Text='' then
          begin
              dmfacturador.dsecundarioDescuentoco1.Asfloat:=0;
          end;
          if lco2.Text<>'' then
          begin
          cobCos2:=DESCUENTO.porc_coseguro2;
          if cobos+cobCos1+cobcos2>100 then
          BEGIN
            cobcos2:=100-cobos-cobcos1;
            if cobcos2<0 then
            begin
              cobcos2:=0;
            end;
          END;
          end;
          if lco2.Text<>'' then
          begin
              dmfacturador.dsecundarioDESCUENTOCO2.Asfloat:=cobcos2;
          end;
          if lco2.Text='' then
          begin
              dmfacturador.dsecundarioDESCUENTOCO2.Asfloat:=0;
          end;
          dmfacturador.dsecundarioCod_laboratorio.AsString:=dmfacturador.qbusqueda.FieldByName('cod_laboratorio').AsString;
          dmfacturador.dsecundariocod_tamano.AsString:=dmfacturador.qbusqueda.FieldByName('cod_tamano').AsString;
          dmfacturador.dsecundariodes_accion.AsString:=dmfacturador.qbusqueda.FieldByName('DES_ACCFARM').AsString;
          dmfacturador.dsecundariodes_droga.AsString:=dmfacturador.qbusqueda.FieldByName('des_droga').AsString;
          dmfacturador.qbusqueda.Next;

        end;




      END;
    end;
    form.Close;
     if  dmfacturador.qbusqueda.RecordCount>1 then
       Begin
       form3:=tfbusquedaproductos.Create(self);
       FORM3.SetTicket(TICKET);
       form3.Showmodal;
         if not gfacturador.DataSource.DataSet.IsEmpty then
         begin
            ebusqueda.Clear;
            gfacturador.SetFocus;
            gfacturador.Selectedindex:=3;
            gfacturador.EditorMode:=true;
            dmfacturador.dprincipal.edit;
            dmfacturador.dprincipalCANTIDAD.Clear;
            if ffacturador.gfacturador.DataSource.DataSet.RecordCount>0 then
              begin
               imprimir.Enabled:=true;


              end;


              gfacturador.SetFocus;
          end;
        end;


    end;

 if  dmfacturador.qbusqueda.IsEmpty then
 begin
   ebusqueda.Text:='';
   ebusqueda.SetFocus;
 end;
FORM.Close;

end;



procedure TFNOFISCAL.BcancelarClick(Sender: TObject);
begin
    if dmfacturador.DPRINCIPAL.Active=true then
    begin
    dmfacturador.DPRINCIPAL.EmptyDataSet;

    end;
    if dmfacturador.DPRINCIPAL.Active=true then
    begin
    dmfacturador.dsecundario.Close;
    end;
end;

procedure TFNOFISCAL.bgrabarafiliadoClick(Sender: TObject);
var
reg: tregistry;
buttonSelected: INTEGER;
s1,s2: tstringlist;
afiliado:TAfiliado;
begin
  guardarAfiliado(Eos,eafiliado,eosnombre,eosapellido);
end;

procedure TFNOFISCAL.bgrabarmedicoClick(Sender: TObject);
var
reg: tregistry;
buttonSelected : Integer;
begin

  guardarMedico(eos,eosmatricula,EOSMEDICONOMBRE,eosmedicoAPELLIDO);


end;


procedure TFNOFISCAL.BitBtn1Click(Sender: TObject);
var
FORM: tffacturaonline;
itemsonline:TItemsonline;
i: integer;
key:char;
reg: tregistry;
begin
 FORM:=tffacturaonline.Create(SELF);
 form.SetTicket(ticket);
 ticket.cuitproveedor:=cuitproveedor.Text;
 ticket.facturaproveedor:=cletrafactura.Text+epv.Text+facturanro.Text;
 form.ShowModal;


    dmfacturador.qbusqueda.Close;
    dmfacturador.qbusqueda.SQL.Clear;
    dmfacturador.qbusqueda.SQL.Text:=concat(' select first(100) ',
                                                    '  DISTINCT a.cod_alfabeta, ',
                                                    '  a.nro_troquel,   ',
                                                    '  a.cod_barraspri,  ',
                                                    '  a.nom_largo, ',
                                                    '  a.cod_iva, ',
                                                    '  s.can_stk, ',
                                                    '  a.cod_tamano, ',
                                                    '  a.cod_laboratorio, ',
                                                    ' coalesce(CAST(   ',
                                                    ' CASE  ',
                                                    ' WHEN a.mar_impsug=''N'' and a.mar_precioventa=''S'' THEN  ',
                                                    ' b.imp_venta  ',
                                                    ' when a.mar_impsug=''N'' and a.mar_precioventa=''N'' THEN ',
                                                    ' (b.imp_compra*(1+r.por_margen/100)) ',
                                                    '  when a.mar_impsug=''S'' AND A.mar_precioventa=''S'' then ',
                                                    ' (a.imp_sugerido) ',
                                                    ' when A.mar_impsug=''S'' AND A.mar_precioventa=''N'' then ',
                                                    '  ((a.imp_sugerido*r.por_margen/100) + a.imp_sugerido) ',
                                                    '  END AS DECIMAL (10,2)),0) as PRECIO, ',
                                                    ' c.POR_VAR_PRECIO as varlabo,  ',
                                                    ' r.por_var_precio as VARRUBRO,  ',
                                                    ' r.cod_rubro,  ',
                                                    ' d.des_droga,  ',
                                                    ' f.des_accfarm,  ',
                                                    ' c.nom_laboratorio ',
                                                    ' from  prmalaboratorio c, prmarubro r,   ',
                                                    ' prmaproducto a left join cotbprecio b on a.cod_alfabeta=b.cod_alfabeta ',
                                                    ' LEFT JOIN prmaaccionfarm f ON  f.cod_accfarm=a.cod_acc_farm  ',
                                                    ' LEFT JOIN prmamonodroga d ON  D.cod_droga=a.cod_droga   ',
                                                    ' left join   prmastock s on    a.cod_alfabeta=s.cod_alfabeta and s.nro_sucursal=b.nro_sucursal ',
                                                    ' where (A.cod_ALFABETA= :ALFABETA ) ',
                                                    ' AND a.cod_rubro=r.cod_rubro ',
                                                    ' and c.cod_laboratorio=a.cod_laboratorio ',
                                                    ' and not(mar_baja=''S'' and s.can_stk=0) ',
                                                    ' and b.nro_sucursal=:sucursal ');



      for I := 0 to ticket.itemsonline.Count -1 do
       begin
        itemsonline:=ticket.itemsonline[i];
        dmfacturador.qbusqueda.close;
        //DMFACTURADOR.qbusqueda.SQL.SaveToFile('SQL.TXT');
        dmfacturador.qbusqueda.ParamByName('alfabeta').AsString:=itemsonline.cod_alfabeta;
        dmfacturador.qbusqueda.ParamByName('sucursal').AsString:=dmFacturador.getSucursal();
        dmfacturador.qbusqueda.Open;
        if dmfacturador.qbusqueda.RecordCount=1 then
          begin
          if dmfacturador.dprincipal.Active=false then
          begin

          dmfacturador.dprincipal.CreateDataSet;
          dmfacturador.dprincipal.Active:=true;
          end;
          dmfacturador.dprincipal.Append;
          dmfacturador.dprincipalNOM_LARGO.AsString:=dmfacturador.qbusqueda.Fields[3].Text;
          dmfacturador.dprincipalCANTIDAD.AsInteger:=itemsonline.cantidadonline;
          dmfacturador.dprincipalPRECIO.AsCurrency:=dmfacturador.qbusqueda.Fields[6].AsCurrency;
          dmfacturador.dprincipalcod_alfabeta.AsString:=dmfacturador.qbusqueda.Fields[0].text;
          dmfacturador.dprincipalcod_barraspri.AsString:=dmfacturador.qbusqueda.Fields[2].text;
          dmfacturador.dprincipalNRO_troquel.AsString:=dmfacturador.qbusqueda.Fields[1].text;
          dmfacturador.dprincipalcod_iva.AsString:=dmfacturador.qbusqueda.Fields[4].text;
          dmfacturador.dprincipalPrecio_Total.AsFloat:=dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat;
          dmfacturador.dprincipalDESCUENTOS.AsFloat:=0;
          dmfacturador.dprincipalporcentaje.AsFloat:=0;
          dmfacturador.dprincipalprecio_totaldesc.AsFloat:=0;
          dmfacturador.DPRINCIPALPORCENTAJEOS.AsFloat:=0;
          dmfacturador.DPRINCIPALPORCENTAJEco1.AsFloat:=0;
          dmfacturador.DPRINCIPALPORCENTAJEco2.AsFloat:=0;
          dmfacturador.dprincipalDESCUENTOSOS.AsCurrency:=0;
          dmfacturador.dprincipalDESCUENTOco1.AsCurrency:=0;
          dmfacturador.dprincipalDESCUENTOco2.AsCurrency:=0;
          dmfacturador.DPRINCIPALCOD_LABORATORIO.AsString:=dmfacturador.qbusqueda.FieldByName('cod_laboratorio').AsString;
          dmfacturador.DPRINCIPALcan_stk.Asinteger:=dmfacturador.qbusqueda.Fields[5].asinteger;
          dmfacturador.dprincipal.Post;
          dmfacturador.dsecundario.Close;
          ebusqueda.Clear;
          gfacturador.SetFocus;
          imprimir.Enabled:=true;
        end;
        if dmfacturador.qbusqueda.RecordCount<>1 then
          begin
          if dmfacturador.cdsfacturareporte.Active=false then
          begin
            dmfacturador.cdsfacturareporte.CreateDataSet;
            dmfacturador.cdsfacturareporte.Active:=true;
          end;
          dmfacturador.cdsfacturareporte.Append;
          dmfacturador.cdsfacturareportecod_alfabeta.AsString:=itemsonline.cod_alfabeta;
          dmfacturador.cdsfacturareportecod_barraspri.Asstring:='';
          dmfacturador.cdsfacturareportenom_largo.Asstring:=itemsonline.nombreonline;
          dmfacturador.cdsfacturareportecantidad.AsString:=inttostr(itemsonline.cantidadonline);
          dmfacturador.cdsfacturareportecantidadcontrol.asstring:='';


          end;
        if not gfacturador.DataSource.DataSet.IsEmpty then
        begin
          key:=#13;
          gfacturador.OnKeyPress(self,key);
        end;



       end;


if not dmfacturador.cdsfacturareporte.IsEmpty then
begin
Reg := TRegistry.Create;
Reg.RootKey := HKEY_CURRENT_USER;
Reg.OpenKey(regKey,true);
dmfacturador.reportefactonline.LoadFromFile(Reg.ReadString('Reportes')+'FACTURAONLINEFALTANTES.FR3');
dmfacturador.reportefactonline.ShowReport(false);
dmfacturador.cdsfactura.Close;
dmfacturador.cdsfacturareporte.Close;

end;


end;



procedure TFNOFISCAL.blimpiarClick(Sender: TObject);
begin
eos.Text:='';
eafiliado.Text:='';
eosnombre.Text:='';
eosapellido.Text:='';
eosmatricula.Text:='';
eosmedicoAPELLIDO.Text:='';
eosmedicoNOMBRE.Text:='';
ltratamiento.Caption:='';
eosreceta.Text:='';

//bvalidar.Enabled:=false;

end;
procedure TFNOFISCAL.blimpiarco1Click(Sender: TObject);
begin

eco1.Text:='';
eco1afiliado.Text:='';
eco1nombre.Text:='';
eco1apellido.Text:='';
eco1matricula.Text:='';
eco1apellidomedico.Text:='';
eco1nombremedico.Text:='';

eco1receta.Text:='';
//bvalidar.Enabled:=false;

end;

procedure TFNOFISCAL.blimpiarprovClick(Sender: TObject);
begin
cuitproveedor.Text:='';
facturanro.Text:='';
epv.Text:='';
end;

procedure TFNOFISCAL.BlimpiartodoClick(Sender: TObject);
begin






if dmfacturador.DPRINCIPAL.Active=true then
begin
dmfacturador.DPRINCIPAL.EmptyDataSet;
end;
if dmfacturador.dsecundario.Active=true then
begin
dmfacturador.dsecundario.Close;
end;

ebusqueda.Clear;
evendedor.clear;

TICKET.llevavale:='NO';
pgcoberturas.TabIndex:=0;
blimpiar.Click;
pgcoberturas.TabIndex:=1;
blimpiarco1.Click;
pgcoberturas.TabIndex:=0;

imprimir.Enabled:=false;
descober.Enabled:=false;

//combotipo.ItemIndex:=0;
ecomprob.Clear;
ECOMPROB.Enabled:=TRUE;
ECOMPROB.SetFocus;
limpiarunidadticket;
pgcoberturas.ActivePageIndex:=0;
//blimpiarprov.Click;
dtfecreceta.DateTime:=now;
pgcoberturas.ActivePageIndex:=1;
dtfeccoseguro.DateTime:=now;
pgcoberturas.ActivePageIndex:=0;
rbusqueda.ItemIndex:=0;
//combotipo.Enabled:=true;
//combotipo.SetFocus;

//evendedor.SetFocus;

end;


procedure TFnofiscal.limpiarunidadticket;
begin
    if ticket.items<>nil then
      begin
    ticket.items.Clear;
      end;
    if ticket.itemsval<>nil then
    begin
     ticket.itemsval.Clear;
    end;
     if ticket.itemsonline<>nil then
    begin
     ticket.itemsonline.Clear;
    end;
    if ticket.totalesiva<>nil then
      begin
      ticket.totalesiva.Clear;
    end;

      ticket.afiliado_numero:='';
      ticket.afiliado_nombre:='';
      ticket.afiliado_apellido:='';

      ticket.medico_apellido:='';
      ticket.medico_nombre:='';
      ticket.medico_tipo_matricula:='';
      ticket.medico_nro_matricula:='';
      ticket.medico_codigo_provincia:='';

      ticket.fechacaja:=0;
      ticket.fechaactual:='';
      ticket.hora:=0;
      ticket.fecha_receta:=now;
      ticket.fecha_recetaco1:=now;
      ticket.numero_receta:='';


      ticket.codigo_OS:='';
      ticket.nombre_os:='';
      ticket.codigo_Co1:='';
      ticket.nombre_co1:='';
      ticket.codigo_Cos2:='';
      ticket.nombre_cos2:='';
      ticket.codigo_validador:='';
      ticket.codigoos_validador:='';
      ticket.codigoos_prestador:='';
      ticket.codigo_tratamiento:='';
      ticket.valnroreferencia:='';
      ticket.valdescripcionrespuesta:='';
      ticket.valmsjrespuesta:='';
      ticket.valnro_item:='';
      ticket.valcodigorespuesta:='9999';
      ticket.valimporte_unitarioval:='';
      ticket.valcod_troquel:='';
      ticket.CodAccion:='';
      ticket.path_validador:='';

      ticket.cod_vendedor:='';
      ticket.nom_vendedor:='';
      ticket.itemstotales:=0;
      ticket.importebruto:=0;
      ticket.importeneto:=0;
      ticket.saldocc:=0;
      ticket.alfabetastock:='';
      ticket.nombrestock:='';
      ticket.estadoticket:=0;
      ticket.importetotal_iva:=0;
      ticket.importetotalsin_iva:=0;
      ticket.importetotaldescuento:=0;
      ticket.importecargoos:=0;
      ticket.importecargoco1:=0;
      ticket.importecargoco2:=0;
      ticket.codigocheque:='';
      ticket.numerocheque:='';
      ticket.codigotarjeta:='';
      ticket.cod_cliente:='';

      ticket.codigocc:='';
      ticket.codigosubcc:='';
      ticket.valecantidad:='';
      ticket.llevavale:='';


      ticket.cuitproveedor:='';
      ticket.facturaproveedor:='';



      ticket.nrocomprobantenf:='';
      ticket.marstock:='';
      ticket.puntos_farmavalor:='';




//      ticket.fec_operativa:=0;
//      ticket.nombre_terminal:='';
//      ticket.fiscla_pv:='';
//      ticket.puerto_com:='';
      ticket.fechafiscal:=0;
//      ticket.sucursal:='';
//      ticket.comprobante:='';
//      ticket.tip_comprobante:='';

      ticket.CUIT:='';
      ticket.CONDICIONIVA:='';
      ticket.DESCRIPCIONCLIENTE:='';
      ticket.codigocliente:='';
      ticket.direccion:='';
      ticket.telefono:='';
 //     ticket.url:='';
      ticket.dni:='';





end;


procedure TFNOFISCAL.losChange(Sender: TObject);
begin
if los.Text='' THEN
PANEL4.Enabled:=FALSE;
if los.Text<>'' then
panel4.Enabled:=true;

end;
procedure TFNOFISCAL.bmodificableClick(Sender: TObject);
var
form: tfproductosd;
form1: tfmodificacion;
begin
form1:=tfmodificacion.Create(self);
form1.SetTicket(ticket);
form1.ShowModal;
if TICKET.claveok='OK' then
BEGIN
FORM:=tfproductosd.Create(SELF);
form.ShowModal;

  if not gfacturador.DataSource.DataSet.IsEmpty then
                     begin
                        ebusqueda.Clear;
                        if ffacturador.gfacturador.DataSource.DataSet.RecordCount>0 then
                          begin
                           imprimir.Enabled:=true;

                          end;
                          if codigo_validador<>'' then
                          begin

                          end;
                          if codigo_validador='' then
                          begin

                          end;
                          ebusqueda.SetFocus;
                          end;
                      end;




if TICKET.claveok='NO' then
BEGIN
  ebusqueda.SetFocus;
END;


end;
procedure TFNOFISCAL.combotipoExit(Sender: TObject);
begin
//combotipo.Enabled:=false;
ECOMPROB.Enabled:=FALSE;
end;

procedure TFNOFISCAL.combotipoKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  evendedor.SetFocus;
end;
end;

procedure TFNOFISCAL.cuitproveedorChange(Sender: TObject);
var
formateo: string;

begin



    formateo:=StringReplace( cuitproveedor.Text, '-', '', [rfReplaceAll] );
    dmfacturador.AbrirConexion();
    dmfacturador.qnombrecuit.Close;
    dmfacturador.qnombrecuit.SQL.Clear;
    dmfacturador.qnombrecuit.SQL.Append('select NOM_CLIENTE from mkmacliente v where v.nro_cuit=:cuit');
    dmfacturador.qnombrecuit.ParamByName('cuit').AsString:=formateo;
    dmfacturador.qnombrecuit.Open;
    if dmfacturador.qnombrecuit.RecordCount>=1 then
    begin
          ecuit.text:=dmfacturador.qnombrecuit.Fields[0].Text;


    end;
    if dmfacturador.qnombrecuit.RecordCount<1 then
    begin
         ecuit.Text:='';
    end;

    end;




procedure TFNOFISCAL.cuitproveedorKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  epv.SetFocus;
end;




end;

procedure TFNOFISCAL.DESCOBERClick(Sender: TObject);
begin
pgcoberturas.Enabled:=TRUE;
eos.Color:=clWINDOW;
los.Color:=clWINDOW;
eco1.Color:=clWINDOW;
eco2.color:=clWINDOW;
lco1.Color:=clWINDOW;
lco2.Color:=clWINDOW;
desbloqueo.Caption:='';
DESCOBER.Enabled:=FALSE;
if TBCOBERTURA.TabVisible=FALSE then
BEGIN
  pgcoberturas.TabIndex:=0;
  CUITPROVEEDOR.SetFocus;
END;
if TBCOBERTURA.TabVisible=TRUE then
BEGIN
  pgcoberturas.TabIndex:=0;

  ebusqueda.Enabled:=true;
END;


end;

procedure TFNOFISCAL.dtfeccoseguroKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  bagregarafico.Click;
  bagregarmedico.Click;
  if esAfiliadoValido and esMedicoValido then
begin
pgcoberturas.TabIndex:=2;
  eco2.SetFocus;
end;

end;
end;

procedure TFNOFISCAL.dtfecrecetaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin

bgrabarafiliado.Click;
bgrabarmedico.Click;

if esAfiliadoValido and esMedicoValido then
begin
pgcoberturas.TabIndex:=1;
  eco1.SetFocus;
end;
end;

end;

procedure TFNOFISCAL.eafiliadoChange(Sender: TObject);
var
  key:Char;
begin
  key:= #13;

  if eafiliado.Text = '' then
   exit;

  buscarAfiliado(eos,eafiliado,eosnombre,eosapellido);

  if eosapellido.Text <> '' then
  begin
    eafiliadoKeyPress(Sender,key);
  end;



end;

procedure TFNOFISCAL.eafiliadoEnter(Sender: TObject);
begin
eafiliado.Color:=clmoneygreen;
end;

procedure TFNOFISCAL.eafiliadoExit(Sender: TObject);
begin
eafiliado.Color:=clwhite;
end;

procedure TFNOFISCAL.eafiliadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  FORM: tfbuscardatos;
  s1,s2: tstringlist;
begin
if KEY=VK_DOWN then
  BEGIN
  FORM:=tfbuscardatos.Create(SELF);
  FORM.codigoCoseguro:=Eos.Text;
  form.TipoBusqueda:=Afiliados;
  form.ShowModal;
  if ((form.nombreSeleccionado<>'') or (form.nombreSeleccionado<>''))  then
      begin
      s1 := TStringList.Create;
      s1.Text:=form.nombreSeleccionado;

      s2 := TStringList.Create;
      s2.CommaText := s1.Text;

      eafiliado.Text:=form.numeroSeleccionado;

      eosapellido.Text:=s2[0];
      eosnombre.Text:=s2[1];
      eafiliadoChange(Sender);
      //bhistorial.Enabled:=true;
      end;


  END;
end;
procedure TFNOFISCAL.eafiliadoKeyPress(Sender: TObject; var Key: Char);
var
reg: tregistry;
s1,s2: tstringlist;
begin
if ((Key=#13)) then
begin
  if Length(pchar(trim(eafiliado.Text))) > 0 then
  begin
    validarAfiliado(eafiliado,eosnombre,eosapellido);
    exit;
  end;

  showMessage('Ingrese número de afiliado');


end;
end;


procedure TFNOFISCAL.ebusquedaEnter(Sender: TObject);
begin

pgcoberturas.Enabled:=false;

eos.Color:=clmenu;
los.Color:=clmenu;
eco1.Color:=clmenu;
eco2.color:=clmenu;
lco1.Color:=clmenu;
lco2.Color:=clmenu;
desbloqueo.Caption:='Pantalla coberturas en modo bloqueado, Para desbloquear presionar F7';
DESCOBER.Enabled:=TRUE;
ebusqueda.Color:=clmoneygreen;
if True then

end;



procedure TFNOFISCAL.ebusquedaExit(Sender: TObject);
begin
ebusqueda.Color:=clwhite;
end;

procedure TFNOFISCAL.ebusquedaKeyPress(Sender: TObject; var Key: Char);
begin


if (Key=#13) then
begin
bbuscar.Click;
end;
end;

procedure TFNOFISCAL.ECO1AFILIADOChange(Sender: TObject);
var
reg: tregistry;
buttonSelected : Integer;
s1,s2: tstringlist;
begin
   if eco1afiliado.Text = '' then
   exit;

  buscarAfiliado(eco1,ECO1AFILIADO,eco1nombre,ECO1apellido);

  if ECO1apellido.Text <> '' then
  begin
    eco1afiliadoKeyPress(Sender,ENTER);
  end;
end;


procedure TFNOFISCAL.ECO1AFILIADOEnter(Sender: TObject);
begin
eco1afiliado.Color:=clmoneygreen;
end;
procedure TFNOFISCAL.ECO1AFILIADOExit(Sender: TObject);
begin
eco1afiliado.Color:=clwhite;
end;

procedure TFNOFISCAL.ECO1AFILIADOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  FORM: tfbuscardatos;
  s1,s2: tstringlist;
begin
if KEY=VK_DOWN then
  BEGIN
  FORM:=tfbuscardatos.Create(SELF);
  FORM.codigoCoseguro:=Eco1.Text;
  form.TipoBusqueda:=Afiliados;
  form.ShowModal;
  if ((form.nombreSeleccionado<>'') or (form.nombreSeleccionado<>''))  then
      begin
      s1 := TStringList.Create;
      s1.Text:=form.nombreSeleccionado;

      s2 := TStringList.Create;
      s2.CommaText := s1.Text;

      eco1afiliado.Text:=form.numeroSeleccionado;

      eco1apellido.Text:=s2[0];
      eco1nombre.Text:=s2[1];
      eco1afiliadoChange(sender);
      end;


  END;
end;

procedure TFNOFISCAL.ECO1AFILIADOKeyPress(Sender: TObject; var Key: Char);

begin
if ((Key=#13)) then
begin

  if Length(pchar(trim(eco1afiliado.Text))) > 0 then
  begin
    validarAfiliado(eco1afiliado,eco1nombre,eco1apellido);
    exit;
  end;
     esAfiliadoValido:= true;
    eco1receta.SetFocus;

end;
end;

procedure TFNOFISCAL.ECO1apellidoEnter(Sender: TObject);
begin
eco1apellido.Color:=clmoneygreen;
end;

procedure TFNOFISCAL.ECO1apellidoExit(Sender: TObject);
begin
eco1apellido.Color:=clwhite;
end;

procedure TFNOFISCAL.ECO1apellidoKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  eco1nombre.SetFocus;
end;

end;

procedure TFNOFISCAL.ECO1apellidoMEDICOEnter(Sender: TObject);
begin
eco1apellidomedico.Color:=clmoneygreen;
end;

procedure TFNOFISCAL.ECO1apellidoMEDICOExit(Sender: TObject);
begin
eco1apellidomedico.Color:=clwhite;
end;


procedure TFNOFISCAL.ECO1apellidoMEDICOKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  eco1nombremedico.SetFocus;
end;
end;

procedure TFNOFISCAL.Eco1Change(Sender: TObject);
VAR
MAR_OBRASOCIAL: STRING;
begin
dmfacturador.AbrirConexion();
mar_obrasocial:='C';
dmfacturador.qpanel2.Close;
dmfacturador.qpanel2.SQL.Clear;
dmfacturador.qpanel2.SQL.Append('select NOM_PLANOS from osmaplanesos where cod_planos=:CODIGO  AND MAR_OBRASOCIAL=:MAR_OBRASOCIAL   and mar_utilizados=''S''');
dmfacturador.qpanel2.ParamByName('codigo').AsString:=eCO1.Text;
dmfacturador.qpanel2.ParamByName('mar_obrasocial').AsString:=mar_obrasocial;
dmfacturador.qpanel2.Open;
lco1.Text:=dmfacturador.qpanel2.Fields[0].Text;
if not dmfacturador.qpanel2.IsEmpty then
begin
ticket.codigo_Co1:=eco1.text;
eco1afiliado.SetFocus;
end;
if not dmfacturador.qpanel2.IsEmpty then
begin
    if not gfacturador.DataSource.DataSet.IsEmpty then
    begin
        reco1;
        descober.Click;
        pgcoberturas.TabIndex:=1;
        eco1afiliado.SetFocus;
    end;
end;
if dmfacturador.qpanel2.IsEmpty then
begin

    if not gfacturador.DataSource.DataSet.IsEmpty then
    begin
        reco1empty;
    end;


end;

{    if not gfacturador.DataSource.DataSet.IsEmpty then
    begin
        reco1;
    end;
    if gfacturador.DataSource.DataSet.IsEmpty then
    begin
        reco1empty;
    end;  }
end;

procedure TFNOFISCAL.Eco1Enter(Sender: TObject);
begin
eco1.Color:=clmoneygreen;
end;
procedure TFNOFISCAL.Eco1Exit(Sender: TObject);
begin
eco1.Color:=clwhite;
end;

procedure TFNOFISCAL.Eco1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  FORM: tfbuscarco1;
begin
if KEY=VK_DOWN then
 BEGIN
 FORM:=tfbuscarco1.Create(SELF);
 form.ShowModal;
 Eco1.Text:=form.codObraSocial;

 END;


end;

procedure TFNOFISCAL.Eco1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
pgcoberturas.TabIndex:=0;
ebusqueda.SetFocus;

end;
end;
procedure TFNOFISCAL.ECO1MATRICULAChange(Sender: TObject);
var
reg: tregistry;
buttonSelected : Integer;
   s1,s2 : TStringList;
   i : integer;
begin
 if length(pchar(trim(Eco1matricula.Text))) > 1 then
  begin

    buscarmedico(eco1,eco1matricula,eco1nombremedico,ECO1apellidoMEDICO);

    if eco1apellidomedico.Text <> '' then
    begin
       ECO1MATRICULAKeyPress(Sender,ENTER);
    end;
  end;

end;

procedure TFNOFISCAL.ECO1MATRICULAEnter(Sender: TObject);
begin
eco1matricula.Color:=clmoneygreen;
end;

procedure TFNOFISCAL.ECO1MATRICULAExit(Sender: TObject);
begin
eco1matricula.Color:=clwhite;
end;

procedure TFNOFISCAL.ECO1MATRICULAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  FORM: tfbuscardatos;
  s1,s2: tstringlist;
begin
if KEY=VK_DOWN then
  BEGIN
  FORM:=tfbuscardatos.Create(SELF);
  FORM.codigoCoseguro:=Eco1.Text;
  form.TipoBusqueda:=Medicos;
  form.ShowModal;
   if ((form.nombreSeleccionado<>'') or (form.nombreSeleccionado<>''))  then
      begin
      s1 := TStringList.Create;
      s1.Text:=form.nombreSeleccionado;

      s2 := TStringList.Create;
      s2.CommaText := s1.Text;

      eco1matricula.Text:=form.numeroSeleccionado;

      eco1apellidomedico.Text:=s2[0];

      eco1nombremedico.Text:=s2[1];
      Eco1matriculaChange(sender);
      end;
  END;




end;


procedure TFNOFISCAL.ECO1MATRICULAKeyPress(Sender: TObject; var Key: Char);
var
reg: tregistry;
buttonSelected : Integer;
   s1,s2 : TStringList;
   i : integer;
begin
if (Key=#13) then
begin
  if Length(pchar(trim(ECO1MATRICULA.Text))) > 0 then
  begin
    validarMedico(eco1,eco1nombremedico,ECO1apellidoMEDICO);
    exit;
  end;

   esMedicoValido:= true;
    eco1receta.SetFocus;
end;

end;


procedure TFNOFISCAL.eco1nombreEnter(Sender: TObject);
begin
eco1nombre.Color:=clmoneygreen;
end;

procedure TFNOFISCAL.eco1nombreExit(Sender: TObject);
begin
eco1nombre.Color:=clwhite;
end;

procedure TFNOFISCAL.eco1nombreKeyPress(Sender: TObject; var Key: Char);

begin
if key=#13 then
begin
eco1matricula.SetFocus;
end;


end;


procedure TFNOFISCAL.eco1nombremedicoEnter(Sender: TObject);
begin
eco1nombremedico.Color:=clmoneygreen;
end;


procedure TFNOFISCAL.eco1nombremedicoExit(Sender: TObject);
begin
eco1nombremedico.Color:=clwhite;
end;

procedure TFNOFISCAL.eco1nombremedicoKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  eco1receta.SetFocus;
end;
end;

procedure TFNOFISCAL.eco1recetaEnter(Sender: TObject);
begin
eco1receta.Color:=clmoneygreen;
end;

procedure TFNOFISCAL.eco1recetaExit(Sender: TObject);
begin
eco1receta.Color:=clWhite;
end;

procedure TFNOFISCAL.eco1recetaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  dtfeccoseguro.SetFocus;
end;
end;

procedure TFNOFISCAL.Eco2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
pgcoberturas.TabIndex:=1;
pgCoberturas.Refresh;
ebusqueda.SetFocus;
end;
end;

procedure TFNOFISCAL.ecomprobChange(Sender: TObject);
begin
 dmFacturador.AbrirConexion();
 if dmfacturador.tpanel1.InTransaction then
 begin
   dmfacturador.tpanel1.Rollback;
 end;

 {dmfacturador.qcomprobante.Close;
 dmfacturador.qcomprobante.SQL.Clear;
 dmfacturador.qcomprobante.SQL.Append('select TIP_COMPROBANTE, TIP_IMPRE from vtmatipcomprob where MAR_TIPOPROCESO=''T'' order by 1 asc' );
 dmfacturador.qcomprobante.Open;    }



dmfacturador.qcomprobantenf.Close;
dmfacturador.qcomprobantenf.SQL.Clear;
dmfacturador.qcomprobantenf.SQL.Append('select TIP_COMPROBANTE, TIP_IMPRE, des_comp from vtmatipcomprob where MAR_TIPOPROCESO=''T'' and tip_comprobante=:comprobante');
dmfacturador.qcomprobantenf.ParamByName('comprobante').AsString:=ecomprob.Text;
dmfacturador.qcomprobantenf.Open;
lcomprob.Caption:=dmfacturador.qCOMPROBANTEnf.Fields[2].Text;

if LCOMPROB.Caption='' then
BEGIN
EVENDEDOR.Enabled:=FALSE;
EBUSQUEDA.Enabled:=FALSE;

END;

if LCOMPROB.Caption<>'' then
BEGIN
EVENDEDOR.Enabled:=TRUE;
EBUSQUEDA.Enabled:=TRUE;
EVENDEDOR.SetFocus;

END;


end;

procedure TFNOFISCAL.ecomprobEnter(Sender: TObject);
begin
eCOMPROB.Color:=clmoneygreen;
end;

procedure TFNOFISCAL.ecomprobExit(Sender: TObject);
begin
eCOMPROB.Color:=clwhite;
if LCOMPROB.CaptioN<>'' then
BEGIN
  ECOMPROB.Enabled:=FALSE;
END;

end;

procedure TFNOFISCAL.ecomprobKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  FORM: tftipcomprob;
begin
if KEY=VK_DOWN then
 BEGIN
 FORM:=tftipcomprob.Create(SELF);
 form.ShowModal;
 ecomprob.Text:=form.codcomprob;
// eos.Text:=form.codObraSocial;
 form.DisposeOf;
 END;
end;

procedure TFNOFISCAL.eosapellidoEnter(Sender: TObject);
begin
eosapellido.Color:=clmoneygreen;
end;


procedure TFNOFISCAL.eosapellidoExit(Sender: TObject);
begin
eosapellido.Color:=clwhite;
end;

procedure TFNOFISCAL.eosapellidoKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  eosnombre.SetFocus;
end;
end;

procedure TFNOFISCAL.EosChange(Sender: TObject);
var
mar_obrasocial: string;
buttonSelected : Integer;
//calculolimites: boolean ;
begin
//conexion(true);
mar_obrasocial:='O';
dmFacturador.AbrirConexion();
dmfacturador.qpanel2.Close;
dmfacturador.qpanel2.SQL.Clear;
dmfacturador.qpanel2.SQL.Append('select NOM_PLANOS, codigo_validador, codigo_os_validador, codigo_plan_validador from osmaplanesos where cod_planos=:CODIGO  AND MAR_OBRASOCIAL=:MAR_OBRASOCIAL   and mar_utilizados=''S''');
dmfacturador.qpanel2.ParamByName('codigo').AsString:=eos.Text;
dmfacturador.qpanel2.ParamByName('mar_obrasocial').AsString:=mar_obrasocial;
dmfacturador.qpanel2.Open;
los.Text:=dmfacturador.qpanel2.Fields[0].Text;
codigo_validador:=dmfacturador.qpanel2.Fields[1].Text;
codigo_os_validador:=dmfacturador.qpanel2.Fields[2].Text;
ticket.codigo_planos_validador:=dmfacturador.qpanel2.Fields[3].Text;
if los.Text<>'' then
  Begin
    //  buttonSelected:=messagedlg('Tratamiento Prolongado?',mtCustom,[mbok,mbno], 0);
       if APPLICATION.MessageBox(' Tratamiento Prolongado? ','Tratamiento', MB_YESNO) = IDYES     then
       BEGIN
          ltratamiento.Caption:='PROLONGADO';
          ticket.codigo_tratamiento:='P';
       END
       ELSE
       //if APPLICATION.MessageBox(' Tratamiento Prolongado? ','Tratamiento', MB_YESNO)      then
       BEGIN
          ltratamiento.Caption:='NORMAL';
          ticket.codigo_tratamiento:='N';
       END;
       { if (comprobadorLimite=nil) then
            Begin
            comprobadorLimite:=TComprobadorLimites.Create;
            End;
             ComprobadorLimite.CargarLimites(eos.Text, ticket.codigo_tratamiento);
  End;}
  if not dmfacturador.qpanel2.IsEmpty then
  begin
  ticket.codigo_OS:=eos.Text;
  eafiliado.SetFocus;
  end;
  if not gfacturador.DataSource.DataSet.IsEmpty then
        begin
         if codigo_validador<>'' then
              begin
         //   bvalidar.Enabled:=true;
              end;
        end;


  End;
if not dmfacturador.qpanel2.IsEmpty then
begin
    if not gfacturador.DataSource.DataSet.IsEmpty then
    begin
        reos;
        descober.Click;
        eafiliado.SetFocus;
    end;
end;
if dmfacturador.qpanel2.IsEmpty then
begin

    if not gfacturador.DataSource.DataSet.IsEmpty then
    begin
        reosempty;
    end;


end;





end;



procedure TFNOFISCAL.EosEnter(Sender: TObject);
begin
eos.Color:=clmoneygreen;
end;

procedure TFNOFISCAL.EosExit(Sender: TObject);
begin
eos.Color:=clwhite;
end;


procedure TFNOFISCAL.EosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  VAR
  FORM: tfbuscaros;
begin
if KEY=VK_DOWN then
 BEGIN
 FORM:=tfbuscaros.Create(SELF);
 form.ShowModal;
 eos.Text:=form.codObraSocial;
 form.DisposeOf;
 END;
if key=vk_return then
begin
  if los.Text<>'' then
  begin
  eafiliado.SetFocus;
  end;
  if los.Text='' then
  begin
     pgcoberturas.TabIndex:=1;
     eco1.SetFocus;
  end;
end;
end;

procedure TFNOFISCAL.EosmatriculaChange(Sender: TObject);
const
  key= #13;
var
reg: tregistry;
buttonSelected : Integer;
   s1,s2 : TStringList;
   i : integer;
begin
  buscarmedico(eos,eosmatricula,eosmediconombre,eosmedicoapellido);

  if eosmedicoAPELLIDO.Text <> '' then
  begin
    eosMatriculaKeyPress(Sender,ENTER);
  end;

end;

procedure TFNOFISCAL.EosmatriculaEnter(Sender: TObject);
begin
eosmatricula.Color:=clmoneygreen;
end;

procedure TFNOFISCAL.EosmatriculaExit(Sender: TObject);
begin
eosmatricula.Color:=clwhite;
end;

procedure TFNOFISCAL.EosmatriculaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  FORM: tfbuscardatos;
  s1,s2: tstringlist;
begin
if KEY=VK_DOWN then
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
      EosmatriculaChange(Sender);
      end;
  END;




end;


procedure TFNOFISCAL.EosmatriculaKeyPress(Sender: TObject; var Key: Char);
var
reg: tregistry;
buttonSelected : Integer;
   s1,s2 : TStringList;
   i : integer;
begin
if (Key=#13) then
begin

   if Length(pchar(trim(EosMATRICULA.Text))) > 0 then
  begin
    validarMedico(eosMatricula,eosmedicoNombre,eosMedicoApellido);
    exit;
  end;
   showMessage('Ingrese número de matricula');
end;







end;
procedure TFNOFISCAL.eosmedicoAPELLIDOEnter(Sender: TObject);
begin
eosmedicoapellido.Color:=clmoneygreen;
end;

procedure TFNOFISCAL.eosmedicoAPELLIDOExit(Sender: TObject);
begin
eosmedicoapellido.Color:=clwhite;
end;


procedure TFNOFISCAL.eosmedicoAPELLIDOKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  eosmediconombre.SetFocus;
end;
end;
procedure TFNOFISCAL.EOSMEDICONOMBREEnter(Sender: TObject);
begin
eosmediconombre.Color:=clmoneygreen;
end;

procedure TFNOFISCAL.EOSMEDICONOMBREExit(Sender: TObject);
begin
eosmediconombre.Color:=clwhite;
end;

procedure TFNOFISCAL.EOSMEDICONOMBREKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  eosreceta.SetFocus;
end;
end;


procedure TFNOFISCAL.eosnombreEnter(Sender: TObject);
begin
eosnombre.Color:=clmoneygreen;

end;


procedure TFNOFISCAL.eosnombreExit(Sender: TObject);
begin
eosnombre.Color:=clwhite;
end;

procedure TFNOFISCAL.eosnombreKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  eosmatricula.SetFocus;
end;
end;
procedure TFNOFISCAL.eosrecetaEnter(Sender: TObject);
begin
eosreceta.Color:=clmoneygreen;
end;

procedure TFNOFISCAL.eosrecetaExit(Sender: TObject);
begin
eosreceta.Color:=clwhite;
end;

procedure TFNOFISCAL.eosrecetaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
dtfecreceta.SetFocus;
end;
end;
procedure TFNOFISCAL.epvKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  facturanro.SetFocus;
end;
end;

procedure TFNOFISCAL.EvendedorChange(Sender: TObject);
begin
dmfacturador.qvendedor.Close;
dmfacturador.qvendedor.SQL.Clear;
dmfacturador.qvendedor.SQL.Append('select nom_vendedor from vtmavendedor where cod_vendedor=:codigo_vendedor');
dmfacturador.qvendedor.ParamByName('codigo_vendedor').AsString:=evendedor.Text;
dmfacturador.qvendedor.Open;
label1.Caption:=dmfacturador.qvendedor.Fields[0].Text;

if LABEL1.Caption<>'' then
begin
   pgcoberturas.Enabled:=true;
   if ((ECOMPROB.Text<>'TKT') OR (ECOMPROB.Text<>'TKA') OR (ECOMPROB.Text<>'TKB') OR (ECOMPROB.Text<>'REM') OR (ECOMPROB.Text<>'NCT') OR (ECOMPROB.Text<>'NCB') OR (ECOMPROB.Text<>'NCA'))THEN
   BEGIN
     tbcobertura.TabVisible:=false;
     tbcoseguro.TabVisible:=false;
     tbcoseguro2.TabVisible:=false;
     proveedor.TabVisible:=true;
     ebusqueda.Enabled:=true;
     bbuscar.Enabled:=true;
      bmodificable.Enabled:=true;
   END;
   if ((ECOMPROB.Text='TKT') OR (ECOMPROB.Text='TKA') OR (ECOMPROB.Text='TKB') OR (ECOMPROB.Text='REM') OR (ECOMPROB.Text='NCT') OR (ECOMPROB.Text='NCB') OR (ECOMPROB.Text='NCA') OR (ECOMPROB.Text='PRE') OR (ECOMPROB.Text='REM')) THEN
   BEGIN
    eos.Enabled:=true;;
    eco1.Enabled:=true;
    eco2.Enabled:=true;
    ebusqueda.Enabled:=true;
    bbuscar.Enabled:=true;
    bmodificable.Enabled:=true;
    eos.Color:=clWINDOW;
    los.Color:=clWINDOW;
    eco1.Color:=clWINDOW;
    eco2.color:=clWINDOW;
    lco1.Color:=clWINDOW;
    lco2.Color:=clWINDOW;
    tbcobertura.TabVisible:=true;
    tbcoseguro.TabVisible:=true;
    tbcoseguro2.TabVisible:=true;
    proveedor.TabVisible:=false;
   END;


end;
if LABEL1.Caption='' then
begin
  pgcoberturas.Enabled:=false;
   eos.Enabled:=false;
   eco1.Enabled:=false;
   eco2.Enabled:=false;
   ebusqueda.Enabled:=false;
   bbuscar.Enabled:=false;
    bmodificable.Enabled:=false;
    eos.Color:=clmenu;
    los.Color:=clmenu;
    eco1.Color:=clmenu;
    eco2.color:=clmenu;
    lco1.Color:=clmenu;
    lco2.Color:=clmenu;


end;

end;

procedure TFNOFISCAL.EvendedorEnter(Sender: TObject);
begin
evendedor.Color:=clmoneygreen;
end;

procedure TFNOFISCAL.EvendedorExit(Sender: TObject);
begin
evendedor.Color:=clwhite;
end;

procedure TFNOFISCAL.EvendedorKeyPress(Sender: TObject; var Key: Char);
begin
if KEY=#13 then
BEGIN
if proveedor.TabVisible=true then
begin
  cuitproveedor.SetFocus;
end;
if proveedor.TabVisible=false then
begin
  eos.SetFocus;
end;
END;
end;

procedure TFNOFISCAL.facturanroExit(Sender: TObject);
begin
if not (facturanro.Text='') then
 begin
facturanro.Text:=formatfloat('0#######',StrToFloat(facturanro.Text));
 end;
end;

procedure TFNOFISCAL.facturanroKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  ebusqueda.SetFocus;
end;
end;

procedure TFNOFISCAL.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin

  pinformativo.Top:=newheight-50;
  pinformativo.Clientwidth:=newwidth-20;
  //bcancelar.Top:=newheight-75;
  blimpiartodo.Top:=newheight-75;
  //bprecio.Top:=newheight-75;
  //bvale.Top:=newheight-75;
  //bvalidar.Top:=newheight-75;
  imprimir.top:=newheight-75;
  descober.top:=newheight-75;
  label44.Top:=newheight-99;
  descuentoos.Top:=newheight-99;
  label45.Top:=newheight-99;
  descuentoco1.Top:=newheight-99;
  label46.Top:=newheight-99;
  descuentoco2.top:=newheight-99;
  label27.Top:=newheight-124;
  importetotal.Top:=newheight-124;
  label28.Top:=newheight-124;
  descuentos.Top:=newheight-124;
  label29.Top:=newheight-124;
  netoacobrar.Top:=newheight-124;
  gfacturador.Height:=newheight-374;
  gfacturador.clientwidth:=newwidth-12;
{  panel9.ClientWidth:=newwidth-11;
  gproducto.ClientWidth:=newwidth-20;
  bstockonline.left:=newwidth-155; }
end;

procedure TFNOFISCAL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if dmfacturador.DPRINCIPAL.Active=true then
    begin
    dmfacturador.DPRINCIPAL.EmptyDataSet;

    end;
    if dmfacturador.DPRINCIPAL.Active=true then
    begin
    dmfacturador.dsecundario.Close;
    end;
end;


procedure TFNOFISCAL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f6 then
    begin
    imprimir.Click;
    end;
    if key=vk_f7 then
    begin
    DESCOBER.Click;
    end;


    if key=vk_f1 then
    begin
        if bmodificable.Enabled=true then
        begin
        bmodificable.Click;
        end;
    end;
    if key=vk_f2 then
    begin
    blimpiartodo.Click;
    end;

end;

procedure TFNOFISCAL.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #27 then
   key := #0;
end;

procedure TFNOFISCAL.FormShow(Sender: TObject);

var
reg: tregistry;

begin
  ENTER:=#13;
 setRecargoHosp;

 dmFacturador.AbrirConexion();
 if dmfacturador.tpanel1.InTransaction then
 begin
   dmfacturador.tpanel1.Rollback;
 end;

{ dmfacturador.qcomprobante.Close;
 dmfacturador.qcomprobante.SQL.Clear;
 dmfacturador.qcomprobante.SQL.Append('select TIP_COMPROBANTE, TIP_IMPRE from vtmatipcomprob where MAR_TIPOPROCESO=''T'' order by 1 asc' );
 dmfacturador.qcomprobante.Open;  }


 if LABEL1.Caption<>'' then
begin
   eos.Enabled:=true;;
   eco1.Enabled:=true;
   eco2.Enabled:=true;

end;
if LABEL1.Caption='' then
begin
   eos.Enabled:=false;
   eco1.Enabled:=false;
   eco2.Enabled:=false;
end;


{  dmfacturador.qcomprobante.First;
  while not dmfacturador.qcomprobante.Eof do
  begin
    combotipo.Items.Add(dmfacturador.qcomprobante.Fields[0].Text);
    dmfacturador.qcomprobante.Next;
  end; }


  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);
  dmfacturador.basecfg.Connected:=false;

  dmfacturador.BASEcfg.DatabaseName:=reg.ReadString('rutabasecfg');
  dmfacturador.BASEcfg.Params.Values['User_Name']:='SYSDBA';
  dmfacturador.BASEcfg.Params.Values['Password']:='nmpnet';
  dmfacturador.basecfg.LoginPrompt:=false;
  dmfacturador.qcaja.Close;
  dmfacturador.qcaja.SQL.Clear;
  dmfacturador.qcaja.SQL.Add('select NRO_CAJA FROM  msmapuesto  where ide_puesto=:puesto');
  dmfacturador.qcaja.ParamByName('puesto').AsString:=ticket.nombre_terminal;
  dmfacturador.qcaja.Open;
  if NOT dmfacturador.QCAJA.IsEmpty THEN
   begin
     ticket.nro_caja:=dmfacturador.qcaja.FieldByName('nro_caja').AsString;
   end;

    dmfacturador.ibqcaja.Close;
    dmfacturador.ibqcaja.SQL.Clear;
    dmfacturador.ibqcaja.SQL.Text:=concat('SELECT DISTINCT c.NRO_CAJA, a.des_caja, MAX(FEC_OPERACIONES) FROM cjmaapertura c, cjmacaja a WHERE c.nro_caja=a.nro_caja and c.nro_sucursal=a.nro_sucursal and c.nro_caja=:caja and MAR_CAJA=''S'' GROUP BY 1,2');
    dmfacturador.ibqcaja.ParamByName('caja').AsString:=ticket.nro_caja;
    dmfacturador.ibqcaja.Open;
    if not dmfacturador.ibqcaja.IsEmpty then
    begin
    ticket.fec_operativa:=dmfacturador.ibqcaja.Fields[2].AsDateTime;
    end;
pinformativo.Caption:=('Nombre Terminal:'+'  '+ticket.nombre_terminal+'       '+'Nombre de Caja:'+'  '+(dmfacturador.ibqcaja.Fields[1].text)+'       '+'Fecha Operativa:'+'  '+datetostr(ticket.fec_operativa));

dtfecreceta.DateTime:=now;
if dmfacturador.ibqcaja.Fields[1].text='' then
BEGIN
  SHOWMESSAGE('PUESTO SIN CAJA ASIGNADA IMPOSIBLE CONTINUAR');
  application.Terminate;
END;
    if dmfacturador.DPRINCIPAL.Active=true then
    begin
    dmfacturador.DPRINCIPAL.EmptyDataSet;

    end;
    if dmfacturador.DPRINCIPAL.Active=true then
    begin
    dmfacturador.dsecundario.Close;
    end;

//combotipo.ItemIndex:=0;
//COMBOTIPO.SetFocus;
ECOMPROB.SetFocus;


  // Asigno el recargo a la calculadora
  calcuPrecio.Recargo:= strToFloat(Ticket.recargo);

end;







procedure TFNOFISCAL.GfacturadorExit(Sender: TObject);
var
key:char;
begin

if not gfacturador.DataSource.DataSet.IsEmpty then
begin
     key:=#13;
     gfacturador.OnKeyPress(self,key);
end;
end;
procedure TFNOFISCAL.GfacturadorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with DBGridExt(TDBGrid(Sender)) do
  begin
    if ((Key = VK_DOWN)and(Row = RowCount-1)) then
    begin
      Abort;
    end;
      if ((Key = vk_insert)and(Row = RowCount-1)) then
    begin
      Abort;
    end;
  end;
  if key=vk_delete then
  begin
    gfacturador.SelectedRows.Delete;
    dmfacturador.dprincipal.Delete;
  end;


end;


procedure TFNOFISCAL.GfacturadorKeyPress(Sender: TObject; var Key: Char);
var
descuento: double;

begin



  if (Key=#13) then
   begin
   dmfacturador.dprincipal.Edit;
   if gfacturador.Fields[3].asstring='' then
    begin
      dmfacturador.dprincipalCANTIDAD.AsInteger:=1;
    end;
    if gfacturador.Fields[3].asstring='0' then
    begin
      dmfacturador.dprincipalCANTIDAD.AsInteger:=1;

    end;
    if gfacturador.Fields[3].asinteger>999 then
    begin
      showmessage('CANTIDAD MAYOR A 999 CORRIGIENDO...');
      dmfacturador.dprincipalCANTIDAD.AsInteger:=999;

    end;

    dmfacturador.dprincipal.Edit;
       if gfacturador.Fields[3].asstring<>'' then
    begin
    descuento:=0;
    descuento:=gfacturador.Fields[11].AsFloat+gfacturador.Fields[12].AsFloat+gfacturador.Fields[13].AsFloat;
    if descuento>100 then
     begin
      descuento:=100;
     end;
    dmfacturador.dprincipalporcentaje.AsFloat:=descuento;
    dmfacturador.dprincipalCANTIDAD.AsInteger:=gfacturador.Fields[3].Asinteger;
    dmfacturador.dprincipalPrecio_total.AsFloat:=dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat;
    dmfacturador.dprincipalDESCUENTOS.AsFloat:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((gfacturador.Fields[7].AsFLOAT)/100);
    dmfacturador.dprincipalprecio_totaldesc.AsFloat:=dmfacturador.DPRINCIPALprecio_total.AsFloat-dmfacturador.dprincipaldescuentos.AsFloat;
    dmfacturador.dprincipalDESCUENTOSOS.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[11].AsFLOAT)/100);
    dmfacturador.dprincipalDESCUENTOco1.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[12].AsFLOAT)/100);
    dmfacturador.dprincipalDESCUENTOco2.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[13].AsFLOAT)/100);
    arregladescuento;
    dmfacturador.dprincipal.Post;

   end;
   ebusqueda.SetFocus;
   end;
end;
procedure tfnofiscal.arregladescuento;
var
descuento:double;
begin

if gfacturador.Fields[11].AsFloat+gfacturador.Fields[12].AsFloat>100 then
            BEGIN
              gfacturador.Fields[12].AsFloat:=100-gfacturador.Fields[11].AsFloat;
              if gfacturador.Fields[11].AsFloat<0 then
              begin
                gfacturador.Fields[12].AsFloat:=0;
              end;
  END;


end;

procedure TFNOFISCAL.gproductoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
 const
   clPaleGreen = TColor($CCFFCC);
   clPaleRed =TColor($CCCCFF);
   clpaleskyblue=Tcolor(15750518);
   clpaleyellow=Tcolor($CCFFFF);
begin



end;
procedure TFNOFISCAL.imprimirClick(Sender: TObject);

var
  FORM: tfticket;
  FORM2: TFPASS;
  KEY: CHAR;

 BEGIN
  



  if not ((ecomprob.Text='AJN') or (ecomprob.Text='AJP' ) or (ecomprob.Text='RRR' ) or (ecomprob.Text='BMF' ) or (ecomprob.Text='BMF') or (ecomprob.Text='BOV') or (ecomprob.Text='ROB')  or (ecomprob.Text='ROT') or (ecomprob.Text='BUI') or (ecomprob.Text='VEN') or (ecomprob.Text='BFR')) then
   BEGIN
    key:=#13;


   leerticket;

   gfacturador.OnKeyPress(self,key);
   FORM:=tfticket.Create(SELF);
   form.SetTicket(ticket);
   setroundmode(rmup);
   form.SaldoAPagar:=(strtoCURR(formatfloat('0.00',(NETOACOBRAR.Field.Value))));
   FORM.IMPORTENETO:=(strtoCURR(formatfloat('0.00',(NETOACOBRAR.Field.Value))));
   FORM.IMPORTEBRUTO:=(strtoCURR(formatfloat('0.00',(importetotal.Field.Value))));
   FORM.coberturatota:=(strtoCURR(formatfloat('0.00',(descuentos.Field.Value))));
   FORM.COBERTURAPLAN:=(strtoCURR(formatfloat('0.00',(descuentoos.field.value))));
   form.coberturaco1:=(strtoCURR(formatfloat('0.00',(descuentoco1.field.value))));
   form.coberturaco2:=(strtoCURR(formatfloat('0.00',( descuentoco2.field.value))));
   form.ShowModal;
   FORM.DisposeOf;
      if ticket.estadoticket=1 then
 begin
   blimpiartodo.Click;
 end;

   END;



 ticket.autorizado:='N';
 if ((ecomprob.Text='AJN') or (ecomprob.Text='AJP' ) or (ecomprob.Text='RRR' ) or (ecomprob.Text='BMF' )  or (ecomprob.Text='BOV') or (ecomprob.Text='ROB')  or (ecomprob.Text='ROT') or (ecomprob.Text='BUI') or (ecomprob.Text='VEN') or (ecomprob.Text='BFR')) then
 BEGIN
 Ticket.autorizado := 'N';
 Ticket.jerarquia := '';
 FORM2:=tFPASS.Create(SELF);

 form2.SetTicket(ticket);
 form2.ShowModal;

 if TICKET.autorizado='S' then
 BEGIN
 if ticket.jerarquia='0' then
   begin
   key:=#13;


   leerticket;

   gfacturador.OnKeyPress(self,key);
   FORM:=tfticket.Create(SELF);
   form.SetTicket(ticket);
   setroundmode(rmup);
   form.SaldoAPagar:=(strtoCURR(formatfloat('0.00',(NETOACOBRAR.Field.Value))));
   FORM.IMPORTENETO:=(strtoCURR(formatfloat('0.00',(NETOACOBRAR.Field.Value))));
   FORM.IMPORTEBRUTO:=(strtoCURR(formatfloat('0.00',(importetotal.Field.Value))));
   FORM.coberturatota:=(strtoCURR(formatfloat('0.00',(descuentos.Field.Value))));
   FORM.COBERTURAPLAN:=(strtoCURR(formatfloat('0.00',(descuentoos.field.value))));
   form.coberturaco1:=(strtoCURR(formatfloat('0.00',(descuentoco1.field.value))));
   form.coberturaco2:=(strtoCURR(formatfloat('0.00',( descuentoco2.field.value))));
   form.ShowModal;
   FORM.DisposeOf;
   if ticket.estadoticket=1 then
     begin
       blimpiartodo.Click;
     end;
   end;
 if ticket.jerarquia<>'0' then
 begin
        showmessage('NO AUTORIZADO');
 end;
 END;


 END;



 END;


procedure TFNOFISCAL.lco1Change(Sender: TObject);
begin
if lco1.Text='' THEN
PANEL5.Enabled:=FALSE;
if lco1.Text<>'' then
panel5.Enabled:=true;
end;

procedure tfnofiscal.leerTicket;
 Var
 item:TTicketItem;
 j: integer;
 fechareceta:tdate;
 sumaitem: integer;
  valoriva: double;
  unaTasaIVA:TTasaIVA;
  importeGravado, importeNeto:double;
   importeNetodesc, importeGravadodesc: double;
begin


  dmfacturador.AbrirConexion();
  dmfacturador.IBQcodigoprestador.Close;
  dmfacturador.IBQcodigoprestador.SQL.Text:=concat('select cod_farmacia, path_envio from osmavalidadores where cod_validador=:codigo');
  dmfacturador.IBQcodigoprestador.ParamByName('codigo').AsString:=codigo_validador;
  dmfacturador.IBQcodigoprestador.Open;
  dmfacturador.qtipocomprob.Close;
  dmfacturador.qtipocomprob.SQL.Clear;
  dmfacturador.qtipocomprob.SQL.Append('select TIP_IMPRE from vtmatipcomprob where tip_comprobante=:letra  AND MAR_TIPOPROCESO=''F''');
  dmfacturador.qtipocomprob.ParamByName('LETRA').AsString:=ECOMPROB.Text;
  dmfacturador.qtipocomprob.Open;


  ticket.codigoos_prestador:=dmfacturador.IBQcodigoprestador.Fields[0].Text;

  ticket.path_validador:=dmfacturador.IBQcodigoprestador.Fields[1].Text;

  ticket.codigo_validador:=codigo_validador;

  ticket.codigoos_validador:=codigo_os_validador;

  ticket.comprobante:=ECOMPROB.Text;

  if ticket.comprobante='ING' then
  BEGIN
  ticket.afiliado_numero:=StringReplace(CUITPROVEEDOR.Text, '-', '', [rfReplaceAll]);
  ticket.numero_receta:=epv.text+StringReplace(FACTURANRO.Text, '-', '', [rfReplaceAll]);
  ticket.codigo_OS:='WEE';
  ticket.codigo_tratamiento:='N';

  END;

  if TICKET.comprobante<>'ING' then
  BEGIN

          ticket.afiliado_numero:=eafiliado.Text;
          ticket.codigo_OS:=eos.Text;
          ticket.numero_receta:=eosreceta.Text;
                if ltratamiento.Caption='PROLONGADO' then
              begin
              ticket.codigo_tratamiento:='P';
              end;
               if ltratamiento.Caption='NORMAL' then
              begin
              ticket.codigo_tratamiento:='N';
              end;
   END;
          ticket.afiliado_apellido:=eosapellido.Text;

          ticket.afiliado_nombre:=eosnombre.Text;
          ticket.afiliado_numeroco1:=eco1afiliado.Text;
          ticket.afiliado_numeroco2:=eco2afiliado.text;
          ticket.afiliado_nombreco1:=eco1nombre.Text;
          ticket.afiliado_nombreco2:=eco2nombre.Text;
          ticket.afiliado_apellidoco1:=eco1apellido.Text;



      ticket.nombre_os:=los.Text;

      ticket.codigo_Co1:=eco1.Text;

      ticket.nombre_co1:=lco1.Text;

      ticket.codigo_Cos2:=eco2.Text;

      ticket.nombre_cos2:=lco2.Text;

      fechareceta:=dtfecreceta.Date;

      ticket.fecha_receta:=fechareceta;

      ticket.cod_vendedor:=evendedor.Text;

      ticket.nom_vendedor:=label1.Caption;

      ticket.tip_comprobante:=dmfacturador.qtipocomprob.Fields[0].Text;

      ticket.importecargoos:=roundto(strtofloat(formatfloat('0.00',(descuentoos.field.value))),-2);

      ticket.importecargoco1:=roundto(strtofloat(formatfloat('0.00',(descuentoco1.field.value))),-2);

      ticket.importecargoco2:=roundto(strtofloat(formatfloat('0.00',( descuentoco2.field.value))),-2);

      ticket.fechaactual:=( FormatDateTime('dd/mm/yyyy hh:nn:ss', Now()));

      ticket.fechafiscal:=strtodatetime( FormatDateTime('dd/mm/yyyy hh:nn:ss', Now()));

        if cosprovincia.ItemIndex=0 then
        begin
        ticket.medico_codigo_provincia:='';
        ticket.medico_tipo_matricula:='N';
        end;
        if cosprovincia.ItemIndex=1 then
        begin
        ticket.medico_codigo_provincia:='Z';
        ticket.medico_tipo_matricula:='P';
        end;
         if cosprovincia.ItemIndex=2 then
        begin
        ticket.medico_codigo_provincia:='U';
        ticket.medico_tipo_matricula:='P';
        end;
         if cosprovincia.ItemIndex=3 then
        begin
        ticket.medico_codigo_provincia:='Q';
        ticket.medico_tipo_matricula:='P';
        end;
         if cosprovincia.ItemIndex=4 then
        begin
        ticket.medico_codigo_provincia:='R';
        ticket.medico_tipo_matricula:='P';
        end;
          if cosprovincia.ItemIndex=5 then
        begin
        ticket.medico_codigo_provincia:='M';
        ticket.medico_tipo_matricula:='P';
        end;
          if cosprovincia.ItemIndex=6 then
        begin
        ticket.medico_codigo_provincia:='X';
        ticket.medico_tipo_matricula:='P';
        end;
          if cosprovincia.ItemIndex=7 then
        begin
        ticket.medico_codigo_provincia:='O';
        ticket.medico_tipo_matricula:='P';
        end;
          if cosprovincia.ItemIndex=8 then
        begin
        ticket.medico_codigo_provincia:='B';
        ticket.medico_tipo_matricula:='P';
        end;
      ticket.medico_nro_matricula:=eosmatricula.Text;
      ticket.medico_nombre:=eosmediconombre.Text;
      ticket.medico_apellido:=eosmedicoapellido.Text;


      ticket.items:=TList.Create;
      j:=0;
      ticket.importebruto:=0;
      ticket.importeneto:=0;
      ticket.importetotaldescuento:=0;
      gfacturador.DataSource.DataSet.first;
            while not Gfacturador.DataSource.DataSet.Eof do
            Begin
                j:=j+1;
                item:=TTicketItem.Create;
                item.nro_item:=j;
                item.cod_barras:=Gfacturador.Fields[9].AsString;
                item.cod_troquel:=gfacturador.fields[0].AsString;
                item.cod_alfabeta:=gfacturador.Fields[8].AsString;
                item.importe_unitario:=gfacturador.Fields[2].Asfloat;
                item.cantidad:=gfacturador.Fields[3].Asinteger;
                item.porcentaje_cobertura:=gfacturador.Fields[11].Asfloat;
                item.importe_cobertura:=gfacturador.Fields[14].Asfloat;
                item.cod_iva:=gfacturador.Fields[10].Asstring;
                ticket.items.Add(item);
                ticket.importebruto:=ticket.importebruto+item.importe_unitario*item.cantidad;
                ticket.importeneto:=ticket.importeneto+gfacturador.Fields[5].AsFloat;
                if (gfacturador.Fields[11].AsFloat<>0) or (gfacturador.Fields[12].AsFloat<>0) or (gfacturador.Fields[13].AsFloat<>0)  then
                begin
                ticket.importetotaldescuento:=ticket.importetotaldescuento+item.importe_unitario*item.cantidad;
                end;

             gfacturador.DataSource.DataSet.next;
            End;
     gfacturador.DataSource.DataSet.First;
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
                 End;
  sumaitem:=gfacturador.DataSource.DataSet.RecordCount;
  ticket.itemsTotales:=sumaitem;
  ticket.coeficientetarjeta:=1;

end;

procedure TFNOFISCAL.precio;

begin
  calcuPrecio.CodRubro:=dmFacturador.qbusqueda.FieldByName('cod_rubro').AsString;
  calcuPrecio.CodOS:=Eos.Text;
  calcuPrecio.CodCos1:= eco1.Text;
  calcuPrecio.CodCos2:= eco2.Text;
  preciocalculado:= calcuPrecio.CalcularPrecio(preciocrudo,porvarlabo,porvarrubro,dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString);

end;


procedure TFNOFISCAL.reco1;
var
descuento: titemdescuento;
key: char;
begin
            if (lco1.Text<>'')  then
                  begin
                    descuento:=CalcularDescuento(ticket.sucursal, (dmfacturador.DPRINCIPALcod_alfabeta.AsString),EOS.text,eco1.text,eco2.text,eafiliado.Text,eco1afiliado.Text,eco2afiliado.text,(dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString));
                    dmfacturador.dprincipal.Edit;
                    dmfacturador.DPRINCIPALPORCENTAJECO1.AsFloat:=descuento.porc_coseguro;
                    dmfacturador.dprincipal.post;
                    key:=#13;
                    gfacturador.OnKeyPress(self,key);

                  end;


end;

procedure TFNOFISCAL.reco1empty;
var
descuento: titemdescuento;
descuentoint: double;
begin
               if (lco1.Text='')  then
               begin
               gfacturador.DataSource.DataSet.First;

                 while not gfacturador.DataSource.DataSet.Eof do
                    begin


                    descuento:=CalcularDescuento(ticket.sucursal, (dmfacturador.DPRINCIPALcod_alfabeta.AsString),EOS.text,eco1.text,eco2.text,eafiliado.Text,eco1afiliado.Text,eco2afiliado.text,(dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString));


                    dmfacturador.dprincipal.Edit;
                    dmfacturador.DPRINCIPALPORCENTAJEco1.AsFloat:=descuento.porc_coseguro;
                   if gfacturador.Fields[3].asstring='' then
                    begin
                      dmfacturador.dprincipalCANTIDAD.AsInteger:=1;
                    end;
                     if gfacturador.Fields[3].asstring='0' then
                    begin
                      dmfacturador.dprincipalCANTIDAD.AsInteger:=1;
                    end;


                       if gfacturador.Fields[3].asstring<>'' then
                    begin
                    descuentoint:=0;
                    descuentoint:=gfacturador.Fields[11].AsFloat+gfacturador.Fields[12].AsFloat+gfacturador.Fields[13].AsFloat;
                    if descuentoint>100 then
                     begin
                      descuentoint:=100;
                     end;
                    dmfacturador.dprincipalporcentaje.AsFloat:=descuentoint;
                    dmfacturador.dprincipalCANTIDAD.AsInteger:=gfacturador.Fields[3].Asinteger;
                    dmfacturador.dprincipalPrecio_total.AsFloat:=dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat;
                    dmfacturador.dprincipalDESCUENTOS.AsFloat:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((gfacturador.Fields[7].AsFLOAT)/100);
                    dmfacturador.dprincipalprecio_totaldesc.AsFloat:=dmfacturador.DPRINCIPALprecio_total.AsFloat-dmfacturador.dprincipaldescuentos.AsFloat;
                    dmfacturador.dprincipalDESCUENTOSOS.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[11].AsFLOAT)/100);
                    dmfacturador.dprincipalDESCUENTOco1.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[12].AsFLOAT)/100);
                    dmfacturador.dprincipalDESCUENTOco2.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[13].AsFLOAT)/100);
                    arregladescuento;
                    dmfacturador.dprincipal.Post;

                   end;
                   gfacturador.Columns.Items[2].ReadOnly:=true;



                    gfacturador.DataSource.DataSet.next;

                   end;



                    end;
               end;


procedure TFNOFISCAL.validarMedico(ematricula: TEdit; eNombre: TEdit; eApellido: TEdit);
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


procedure TFNOFISCAL.validarAfiliado(eNroAfiliado:TEdit;eNombre:TEdit;eApellido:TEdit);
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




procedure TFNOFISCAL.reos;
var

descuento: titemdescuento;
key: char;
begin
            if (los.Text<>'')  then
               begin
               gfacturador.DataSource.DataSet.First;

                 while not gfacturador.DataSource.DataSet.Eof do
                    begin


                    descuento:=CalcularDescuento(ticket.sucursal, (dmfacturador.DPRINCIPALcod_alfabeta.AsString),EOS.text,eco1.text,eco2.text,eafiliado.Text,eco1afiliado.Text,eco2afiliado.text,(dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString));


                    dmfacturador.dprincipal.Edit;

                    dmfacturador.DPRINCIPALPORCENTAJEOS.AsFloat:=descuento.Porc_os;
                    dmfacturador.dprincipal.post;
                    key:=#13;
                    gfacturador.OnKeyPress(self,key);
                    gfacturador.DataSource.DataSet.next;
                    end;
               end;

end;



procedure TFNOFISCAL.reosempty;

var
descuento: titemdescuento;
descuentoint: double;
begin
               if (los.Text='')  then
               begin
               gfacturador.DataSource.DataSet.First;

                 while not gfacturador.DataSource.DataSet.Eof do
                    begin


                    descuento:=CalcularDescuento(ticket.sucursal, (dmfacturador.DPRINCIPALcod_alfabeta.AsString),EOS.text,eco1.text,eco2.text,eafiliado.Text,eco1afiliado.Text,eco2afiliado.text,(dmfacturador.qbusqueda.FieldByName('cod_rubro').AsString));


                    dmfacturador.dprincipal.Edit;
                    dmfacturador.DPRINCIPALPORCENTAJEOS.AsFloat:=descuento.Porc_os;
                   if gfacturador.Fields[3].asstring='' then
                    begin
                      dmfacturador.dprincipalCANTIDAD.AsInteger:=1;
                    end;
                     if gfacturador.Fields[3].asstring='0' then
                    begin
                      dmfacturador.dprincipalCANTIDAD.AsInteger:=1;
                    end;


                       if gfacturador.Fields[3].asstring<>'' then
                    begin
                    descuentoint:=0;
                    descuentoint:=gfacturador.Fields[11].AsFloat+gfacturador.Fields[12].AsFloat+gfacturador.Fields[13].AsFloat;
                    if descuentoint>100 then
                     begin
                      descuentoint:=100;
                     end;
                    dmfacturador.dprincipalporcentaje.AsFloat:=descuentoint;
                    dmfacturador.dprincipalCANTIDAD.AsInteger:=gfacturador.Fields[3].Asinteger;
                    dmfacturador.dprincipalPrecio_total.AsFloat:=dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat;
                    dmfacturador.dprincipalDESCUENTOS.AsFloat:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((gfacturador.Fields[7].AsFLOAT)/100);
                    dmfacturador.dprincipalprecio_totaldesc.AsFloat:=dmfacturador.DPRINCIPALprecio_total.AsFloat-dmfacturador.dprincipaldescuentos.AsFloat;
                    dmfacturador.dprincipalDESCUENTOSOS.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[11].AsFLOAT)/100);
                    dmfacturador.dprincipalDESCUENTOco1.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[12].AsFLOAT)/100);
                    dmfacturador.dprincipalDESCUENTOco2.AsCurrency:=(dmfacturador.dprincipalCantidad.AsFloat*dmfacturador.dprincipalPrecio.AsFloat)*((Gfacturador.Fields[13].AsFLOAT)/100);
                    arregladescuento;
                    dmfacturador.dprincipal.Post;

                   end;
                   gfacturador.Columns.Items[2].ReadOnly:=true;



                    gfacturador.DataSource.DataSet.next;

                   end;



                    end;
               end;





end.

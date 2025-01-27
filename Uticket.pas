unit Uticket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls, ubuscardatos, registry, uimpresion,
  udticket, ubuscarcliente,uvalsorteo,
  uimpresionofiscal, uvalcliente, uvalida, uprogreso, Xml.xmldom, Xml.XMLIntf,
  Xml.XMLDoc, MSXML, uUtils,uDefPatchesDAO,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,uSorteoService,uSorteo,
  uupdcliente, math, uvalcancel, upromo, Vcl.Imaging.jpeg, uafiliar;

type
  TFticket = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ecobertura: TEdit;
    ecoseguro1: TEdit;
    ecoseguro2: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    eimportebruto: TEdit;
    Label9: TLabel;
    ecubiertoxplanes: TEdit;
    Label10: TLabel;
    eimporteneto: TEdit;
    Label12: TLabel;
    pmodospago: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ECTACTE: TEdit;
    Agregar: TBitBtn;
    EpEFECTIVO: TEdit;
    Efectivo: TLabel;
    Label13: TLabel;
    EpTarjetas: TEdit;
    Label14: TLabel;
    Epctacte: TEdit;
    epcheque: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    LMAXIMO: TLabel;
    ECuentaCorriente: TEdit;
    Label19: TLabel;
    ECuentaTarjeta: TEdit;
    bagregarbono: TBitBtn;
    btAgregarTarjeta: TBitBtn;
    Label20: TLabel;
    ecodtarjeta: TEdit;
    Label21: TLabel;
    enombretarjeta: TEdit;
    Label22: TLabel;
    echeque: TEdit;
    enumerocheque: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    esaldocheque: TEdit;
    blimpiarcta: TBitBtn;
    BitBtn3: TBitBtn;
    blimpiartarjeta: TBitBtn;
    blimpiarcheque: TBitBtn;
    Bimprimir: TBitBtn;
    Mcodigoautorizacion: TMemo;
    Label11: TLabel;
    Panel8: TPanel;
    ecliente: TEdit;
    enombrecliente: TEdit;
    ecuit: TEdit;
    edireccion: TEdit;
    ccondicioniva: TComboBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    etelefono: TEdit;
    Label30: TLabel;
    bagregarcliente: TBitBtn;
    Beditar: TBitBtn;
    bcancelar: TBitBtn;
    lnombrebanco: TLabel;
    edocumento: TEdit;
    Label31: TLabel;
    Cbono: TComboBox;
    efarmapass: TEdit;
    Label32: TLabel;
    IdHTTP: TIdHTTP;
    bguardar: TBitBtn;
    bcancelarcliente: TBitBtn;
    ecoeficiente: TEdit;
    Label33: TLabel;
    Bevel1: TBevel;
    nombrecc: TLabel;
    egentileza: TEdit;
    ESCTA: TEdit;
    Label6: TLabel;
    Promos: TTabSheet;
    Label34: TLabel;
    ecodigo: TEdit;
    Button1: TButton;
    esaldofarmacoins: TEdit;
    Label35: TLabel;
    Farmavalor: TTabSheet;
    Label36: TLabel;
    eafiliado: TEdit;
    esaldo: TEdit;
    Bafiliado: TButton;
    Label37: TLabel;
    Label38: TLabel;
    esaldousar: TEdit;
    bagregarcheque: TBitBtn;
    bagregarfarmacoins: TBitBtn;
    blimpiarfc: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Button2: TButton;
    bafiliar: TButton;
    bbuscardni: TButton;
    Label39: TLabel;
    eautofarmaplus: TEdit;
    procedure FormShow(Sender: TObject);
    procedure AgregarClick(Sender: TObject);
    procedure pmodospagoChange(Sender: TObject);
    procedure recalcularSaldoAPagar();
    procedure btAgregarTarjetaClick(Sender: TObject);
    procedure ECTACTEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECTACTEKeyPress(Sender: TObject; var Key: Char);
    procedure ECTACTEChange(Sender: TObject);
    procedure blimpiarctaClick(Sender: TObject);
    procedure ecodtarjetaChange(Sender: TObject);
    procedure ecodtarjetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure blimpiartarjetaClick(Sender: TObject);
    procedure BimprimirClick(Sender: TObject);
    procedure eclienteChange(Sender: TObject);
    procedure eclienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BeditarClick(Sender: TObject);
    procedure bagregarclienteClick(Sender: TObject);
    procedure eclienteKeyPress(Sender: TObject; var Key: Char);
    procedure ecuitKeyPress(Sender: TObject; var Key: Char);
    procedure bcancelarClick(Sender: TObject);
    procedure echequeChange(Sender: TObject);
    procedure bagregarchequeClick(Sender: TObject);
    procedure blimpiarchequeClick(Sender: TObject);
    procedure bagregarbonoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ECuentaCorrienteKeyPress(Sender: TObject; var Key: Char);
    procedure ECuentaTarjetaKeyPress(Sender: TObject; var Key: Char);
    procedure esaldochequeKeyPress(Sender: TObject; var Key: Char);
    procedure bguardarClick(Sender: TObject);
    procedure bcancelarclienteClick(Sender: TObject);
    procedure copiaspooler;
    procedure echequeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ESCTAKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ESCTAKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure BafiliadoClick(Sender: TObject);
    procedure consultarfarmacoins;
    procedure bagregarfarmacoinsClick(Sender: TObject);
    procedure descontarfarmacoins;
    procedure blimpiarfcClick(Sender: TObject);
    procedure esaldousarKeyPress(Sender: TObject; var Key: Char);
    procedure eafiliadoKeyPress(Sender: TObject; var Key: Char);
    procedure edocumentoChange(Sender: TObject);
    procedure promocion;
    procedure bafiliarClick(Sender: TObject);
    procedure bbuscardniClick(Sender: TObject);

  private
    totalRecargoMedicinal:Double;
    procedure calcularRecargoMedicinal;
    function calcularCoeficiente:double;
    procedure sorteo;

  public
    estado: integer;
    IMPORTENETO: currency;
    COBERTURAPLAN: currency;
    coberturaco1: currency;
    coberturaco2: currency;
    coberturatota: currency;
    IMPORTEBRUTO: currency;
    SaldoAPagar: currency;
    gentilezas: currency;
    coeficiente: double;
    autofarmaplus: currency;
    valor: string;
    pagoefectivo: string;
    pagotarjeta: string;
    pagocheque: string;
    pagootrospagos: string;
    Ticket: TTicket;
    procedure SetTicket(unTicket: TTicket);
    procedure arreglarsaldos;
    procedure verificarpuntos;
  end;

var
  Fticket: TFticket;

implementation

{$R *.dfm}
                                                       
uses UdmFacturador, facturador;

const
  TablaMul: Array [1 .. 10] of integer = (5, 4, 3, 2, 7, 6, 5, 4, 3, 2);
  { Tabla Arbitraria }

function EsCUITValido(Num: String): boolean;
type
  ArrayDe11 = Array [1 .. 11] of integer;
var
  R: ArrayDe11; { Resultados de Multiplicar por la Tabla Arbitraria }
  CUIT: ArrayDe11; { Para convertir cada digito }
  I: integer; { Indice }
  Sumatoria, { Sumatoria de los Digitos menos el último }
  Dividendo, { Resultado de la División }
  Producto, Diferencia, DigitoVerif: integer; { Digito Verificador Calculado }
begin
  result := false; { Asumir Invalido }
  if Length(Num) = 11 then
  begin
    try
      { Convertir cada caracter a Número }
      for I := 1 to 11 do
        CUIT[I] := StrToInt(Num[I]);
    except
      { Si hay error de conversión es CUIT invalido }
      Exit;
    end; { try }
  end
  else
    Exit; { if }  { Si no tiene 11 caracteres es CUIT invalido }

  for I := 1 to 10 do // Multiplicar cada digito por la
    R[I] := CUIT[I] * TablaMul[I]; // Tabla Arbitraria menos el último

  Sumatoria := 0;
  for I := 1 to 10 do
    Sumatoria := Sumatoria + R[I]; // Calcular la sumatoria de los resultados

  Dividendo := Sumatoria div 11; // Dividir por 11  (división entera)
  Producto := Dividendo * 11; // El resultado multiplica por 11
  Diferencia := Sumatoria - Producto; // Obtener la diferencia
  if Diferencia > 0 then // Si la dif. es mayor a cero
    DigitoVerif := 11 - Diferencia
    // El digito verificador es 11 menos la diferencia
  else
    DigitoVerif := Diferencia; // sino es Cero.

  if DigitoVerif = CUIT[11] then
    result := true; // si el Digito Verificador es igual
end; // al último digito del CUITel CUIT es Válido.

{ procedure arreglarsaldos;

  end; }

procedure TFticket.AgregarClick(Sender: TObject);

var
  saldo: string;
begin

  recalcularSaldoAPagar;

  if valor <> 'NEGATIVO' then
  BEGIN
    if ECuentaCorriente.Text <> '' then
    begin
      Epctacte.Text := '$ ' + ECuentaCorriente.Text;
    end;
  END;

  if ECuentaCorriente.Text = '' then
  begin
    if nombrecc.Caption = '' then
    begin
      showmessage('CODIGO CC INEXISTENTE');
    end;
    if nombrecc.Caption <> '' then
    begin
      showmessage('Inserte importe');
      ECuentaCorriente.SetFocus;
      ECuentaCorriente.ReadOnly := false;
    end;
  end;
  if ECuentaCorriente.Text <> '' then
  begin
    ECuentaCorriente.Text := '';
    ECuentaCorriente.ReadOnly := true;
    ECTACTE.ReadOnly := true;
    blimpiarcta.Enabled := true;
  END;

end;

procedure TFticket.arreglarsaldos;

var
  importeefectivo: double;
  importetarjeta: double;
  importecc: double;
  importech: double;
  importeos: double;
  importeco1: double;
  importeco2: double;
  importeaplus: double;

begin
  if EpEFECTIVO.Text <> '' then
  begin
    importeefectivo := strtofloat(stringreplace(EpEFECTIVO.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));
  end;
  if EpEFECTIVO.Text = '' then
  begin
    importeefectivo := 0;
  end;
  if EpTarjetas.Text <> '' then
  begin
    importetarjeta := strtofloat(stringreplace(EpTarjetas.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));
  end;
  if EpTarjetas.Text = '' then
  begin
    importetarjeta := 0;
  end;
  if Epctacte.Text <> '' then
  begin
    importecc := strtofloat(stringreplace(Epctacte.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));

  end;
  if Epctacte.Text = '' then
  begin
    importecc := 0;
  end;
  if epcheque.Text <> '' then
  begin
    importech := strtofloat(stringreplace(epcheque.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));

  end;
  if epcheque.Text = '' then
  begin
    importech := 0;
  end;
  if ecobertura.Text <> '' then
  begin
    importeos := strtofloat(stringreplace(ecobertura.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));

  end;
  if ecobertura.Text = '' then
  begin
    importeos := 0;
  end;
  if ecoseguro1.Text <> '' then
  begin
    importeco1 := strtofloat(stringreplace(ecoseguro1.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));

  end;
  if ecoseguro1.Text = '' then
  begin
    importeco1 := 0;
  end;
  if ecoseguro2.Text <> '' then
  begin
    importeco2 := strtofloat(stringreplace(ecoseguro2.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));

  end;
  if ecoseguro2.Text = '' then
  begin
    importeco2 := 0;
  end;
  if esaldofarmacoins.Text = '' then
  begin
    importeaplus := 0;
  end;

  if importeefectivo + importetarjeta + importecc + importech + importeos +
    importeco1 + importeco2 >
    round(Ticket.IMPORTEBRUTO * Ticket.coeficientetarjeta) then
  begin
    if importeefectivo <> 0 then
    begin
      EpEFECTIVO.Text := '$ ' +
        floattostr(strtofloat(stringreplace(EpEFECTIVO.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase])) + (Ticket.IMPORTEBRUTO - importeefectivo
        - importetarjeta - importecc - importech - importeos - importeco1 -
        importeco2-importeaplus));
    end
    else if importetarjeta <> 0 then
    begin
      EpTarjetas.Text := '$ ' +
        floattostr(strtofloat(stringreplace(EpTarjetas.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase])) +
        ((Ticket.IMPORTEBRUTO * Ticket.coeficientetarjeta) - importeefectivo -
        importetarjeta - importecc - importech - importeos - importeco1 -
        importeco2-importeaplus));
    end
    else if importecc <> 0 then
    begin
      Epctacte.Text := '$ ' +
        floattostr(strtofloat(stringreplace(Epctacte.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase])) + (Ticket.IMPORTEBRUTO - importeefectivo
        - importetarjeta - importecc - importech - importeos - importeco1 -
        importeco2-importeaplus));
    end
    else if importech <> 0 then
    begin
      epcheque.Text := '$ ' +
        floattostr(strtofloat(stringreplace(epcheque.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase])) + (Ticket.IMPORTEBRUTO - importeefectivo
        - importetarjeta - importecc - importech - importeos - importeco1 -
        importeco2-importeaplus));
    end
    else if importeos <> 0 then
    begin
      ecobertura.Text := '$ ' +
        floattostr(strtofloat(stringreplace(ecobertura.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase])) + (Ticket.IMPORTEBRUTO - importeefectivo
        - importetarjeta - importecc - importech - importeos - importeco1 -
        importeco2-importeaplus));
    end
    else if importeco1 <> 0 then
    begin
      ecoseguro1.Text := '$ ' +
        floattostr(strtofloat(stringreplace(ecoseguro1.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase])) + (Ticket.IMPORTEBRUTO - importeefectivo
        - importetarjeta - importecc - importech - importeos - importeco1 -
        importeco2-importeaplus));
    end
    else if importeco2 <> 0 then
    begin
      ecoseguro2.Text := '$ ' +
        floattostr(strtofloat(stringreplace(ecoseguro2.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase])) + (Ticket.IMPORTEBRUTO - importeefectivo
        - importetarjeta - importecc - importech - importeos - importeco1 -
        importeco2-importeaplus));
    end
    else if importeaplus <> 0 then
    begin
      esaldofarmacoins.Text := '$ ' +
        floattostr(strtofloat(stringreplace(esaldofarmacoins.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase])) + (Ticket.IMPORTEBRUTO - importeefectivo
        - importetarjeta - importecc - importech - importeos - importeco1 -
        importeco2-importeaplus));
    end
  end;
end;

procedure TFticket.bafiliarClick(Sender: TObject);
var
form: tfafiliar;
begin

form:=tfafiliar.create(SELF);
form.SetTicket(Ticket);
form.showmodal;
if ticket.afiliadofc<>'' then
begin
  ecliente.Text:=ticket.afiliadofc;
end;

end;

procedure TFticket.bagregarbonoClick(Sender: TObject);
var
  FORM: tfvalida;
  I: integer;
  itemsval: TTicketItemval;
  Key: Char;
begin
  if Cbono.ItemIndex = 0 then
  BEGIN
    FORM := tfvalida.Create(SELF);
    ffacturador.codigo_validador := 'S';
    ffacturador.leerticket;
    ffacturador.Ticket.CodAccion := '590020';
    ffacturador.Ticket.codigoos_validador := '5001';
    ffacturador.Ticket.afiliado_numero := efarmapass.Text;
    ffacturador.Ticket.valbono := 'SI';
    FORM.SetTicket(ffacturador.Ticket);
    FORM.ShowModal;
    if Ticket.estadoticket = 1 then
    begin
      showmessage('EN CONSTRUCCION PENDIENTE');

    end;

  END;

end;

procedure TFticket.bagregarchequeClick(Sender: TObject);
var
  saldo: string;
begin
  if enumerocheque.Text <> '' then
  begin
    recalcularSaldoAPagar;

    if valor <> 'NEGATIVO' then
    BEGIN
      if esaldocheque.Text <> '' then
      begin
        epcheque.Text := '$ ' + esaldocheque.Text;
        esaldocheque.ReadOnly := true;
        echeque.ReadOnly := true;
      end;
    END;

    if esaldocheque.Text = '' then
    begin
      showmessage('Inserte importe');
      esaldocheque.SetFocus;
      esaldocheque.ReadOnly := false;
    end;
    esaldocheque.Text := '';
    blimpiarcheque.Enabled := true;
  end;
  if enumerocheque.Text = '' then
  begin
    showmessage('Inserte numero de cheque');
    enumerocheque.SetFocus;
  end;

end;

procedure TFticket.bagregarclienteClick(Sender: TObject);
var

  FORM: tfvalcliente;

begin
  if ccondicioniva.Text <> 'CONSUMIDOR FINAL' then
  begin

    if EsCUITValido(stringreplace(ecuit.Text, ' ', '', [rfReplaceAll])) = true
    then
    begin
      Ticket.CUIT := ecuit.Text;
      Ticket.CONDICIONIVA := ccondicioniva.Text;
      Ticket.DESCRIPCIONCLIENTE := enombrecliente.Text;
      if edocumento.Text = '' then
      begin
        Ticket.dni := '1';
      end;
      if edocumento.Text <> '' then
      begin
        Ticket.dni := edocumento.Text;
      end;
      if edireccion.Text <> '' then
      begin
        Ticket.direccion := edireccion.Text;
      end;
      if edireccion.Text = '' then
      begin
        Ticket.direccion := '1';
      end;
      if etelefono.Text = '' then
      begin
        Ticket.telefono := '1';
      end;
      if etelefono.Text <> '' then
      begin
        Ticket.telefono := etelefono.Text;
      end;

      FORM := tfvalcliente.Create(SELF);
      FORM.SetTicket(Ticket);
      FORM.ShowModal;
      ecliente.Text := Ticket.codigocliente;
      enombrecliente.Text := Ticket.DESCRIPCIONCLIENTE;
      if Ticket.CONDICIONIVA = 'RESPONSABLE MONOTRIBUTO' then
      BEGIN
        ccondicioniva.ItemIndex := 0;
      END;
      if Ticket.CONDICIONIVA = 'RESPONSABLE INSCRIPTO' then
      BEGIN
        ccondicioniva.ItemIndex := 1;
      END;
      if Ticket.CONDICIONIVA = 'RESPONSABLE NO INSCRIPTO' then
      BEGIN
        ccondicioniva.ItemIndex := 2;
      END;
      if Ticket.CONDICIONIVA = 'EXENTO' then
      BEGIN
        ccondicioniva.ItemIndex := 3;
      END;
      if Ticket.CONDICIONIVA = 'CONSUMIDOR FINAL' then
      BEGIN
        ccondicioniva.ItemIndex := 4;
      END;
      ecuit.Text := Ticket.CUIT;
      edireccion.Text := Ticket.direccion;
      etelefono.Text := Ticket.telefono;
      FORM.DisposeOf;
      ecuit.Enabled := false;
      edireccion.Enabled := false;
      etelefono.Enabled := false;
      ccondicioniva.Enabled := false;
      ecliente.Enabled := true;
      enombrecliente.Enabled := false;
      edocumento.Enabled := false;
      edocumento.Color := clmenu;
      enombrecliente.Color := clmenu;
      ccondicioniva.Color := clmenu;
      ecliente.Color := clwhite;
      ecuit.Color := clmenu;
      edireccion.Color := clmenu;
      etelefono.Color := clmenu;

      bagregarcliente.Enabled := false;

    end;
    if EsCUITValido(stringreplace(ecuit.Text, ' ', '', [rfReplaceAll])) = false
    then
    begin
      showmessage('CUIT INVALIDO');
    end;
  end;

  if ccondicioniva.Text = 'CONSUMIDOR FINAL' then
  begin
    Ticket.CUIT := ecuit.Text;
    Ticket.CONDICIONIVA := ccondicioniva.Text;
    Ticket.DESCRIPCIONCLIENTE := enombrecliente.Text;
    if edocumento.Text = '' then
    begin
      Ticket.dni := '1';
    end;
    if edocumento.Text <> '' then
    begin
      Ticket.dni := edocumento.Text;
    end;
    if edireccion.Text <> '' then
    begin
      Ticket.direccion := edireccion.Text;
    end;
    if edireccion.Text = '' then
    begin
      Ticket.direccion := '1';
    end;
    if etelefono.Text = '' then
    begin
      Ticket.telefono := '1';
    end;
    if etelefono.Text <> '' then
    begin
      Ticket.telefono := etelefono.Text;;
    end;

    FORM := tfvalcliente.Create(SELF);
    FORM.SetTicket(Ticket);
    FORM.ShowModal;
    ecliente.Text := Ticket.codigocliente;
    enombrecliente.Text := Ticket.DESCRIPCIONCLIENTE;
    if Ticket.CONDICIONIVA = 'RESPONSABLE MONOTRIBUTO' then
    BEGIN
      ccondicioniva.ItemIndex := 0;
    END;
    if Ticket.CONDICIONIVA = 'RESPONSABLE INSCRIPTO' then
    BEGIN
      ccondicioniva.ItemIndex := 1;
    END;
    if Ticket.CONDICIONIVA = 'RESPONSABLE NO INSCRIPTO' then
    BEGIN
      ccondicioniva.ItemIndex := 2;
    END;
    if Ticket.CONDICIONIVA = 'EXENTO' then
    BEGIN
      ccondicioniva.ItemIndex := 3;
    END;
    if Ticket.CONDICIONIVA = 'CONSUMIDOR FINAL' then
    BEGIN
      ccondicioniva.ItemIndex := 4;
    END;
    ecuit.Text := Ticket.CUIT;
    edireccion.Text := Ticket.direccion;
    etelefono.Text := Ticket.telefono;
    FORM.DisposeOf;
    ecuit.Enabled := false;
    edireccion.Enabled := false;
    etelefono.Enabled := false;
    ccondicioniva.Enabled := false;
    ecliente.Enabled := true;
    enombrecliente.Enabled := false;
    edocumento.Enabled := false;
    edocumento.Color := clmenu;

    enombrecliente.Color := clmenu;
    ccondicioniva.Color := clmenu;
    ecliente.Color := clwhite;
    ecuit.Color := clmenu;
    edireccion.Color := clmenu;
    etelefono.Color := clmenu;

    bagregarcliente.Enabled := false;

  end;
end;

procedure TFticket.bagregarfarmacoinsClick(Sender: TObject);
var
  saldo: string;
  calculo: double;
  farmacoinsitems: double;
  porcentajecalculo:double;
  total: double;
  saldofarmacoins: double;
  porcentaje: double;
begin
  // SALDOAPAGAR:=SALDOAPAGAR-STRTOFLOAT(ecuentatarjeta.Text);
  if strtofloat(esaldousar.text)<=strtofloat(esaldo.text) then
  begin

  recalcularSaldoAPagar;

  if valor <> 'NEGATIVO' then
  BEGIN
  promo:='OK';
    if esaldousar.Text <> '' then
    begin
      // calculo:=strtofloat(FormatFloat('0.00', (strtofloat(ecuentatarjeta.Text)*((strtofloat(ecoeficiente.Text)/100)+1))));
      esaldofarmacoins.Text := '$ ' + (esaldousar.Text);

      saldofarmacoins:=strtofloat(esaldousar.Text);
      total:=ticket.importeneto;
      //total:=ticket.importebruto;



      ffacturador.Gfacturador.DataSource.DataSet.First;

      while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
      begin
        dmfacturador.dprincipal.Edit;

       porcentajecalculo:=ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[5].FieldName).asfloat*100/total;
       // porcentajecalculo:=total*100/ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[6].FieldName).asfloat;
        farmacoinsitems:=porcentajecalculo*saldofarmacoins/100;

        porcentaje:=farmacoinsitems*100/ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[6].FieldName).asfloat;
        ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[29].FieldName).asfloat:=porcentaje;
        ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[30].FieldName).asfloat:=farmacoinsitems;
        ffacturador.Gfacturador.DataSource.DataSet.next;
      end;
        if PROMO = 'OK' then
        BEGIN
          modalresult := mrcancel;
          ffacturador.fccredencial:=eafiliado.Text;
          ffacturador.fcsaldo:=esaldo.Text;
          ffacturador.fcfarmacoin:=esaldofarmacoins.text;



        END;

    end;
  END;

  if esaldousar.Text = '' then
  begin

    if esaldo.Text = '' then
    BEGIN
      showmessage('Saldo inexistente');
    END;

  end;
  if esaldousar.Text <> '' then
  begin
    esaldousar.Text := '';
    esaldousar.ReadOnly := true;
    eafiliado.ReadOnly := true;
    esaldousar.Enabled:=false;
    blimpiarfc.Enabled:=true;

  end;
  end;


end;

procedure TFticket.BeditarClick(Sender: TObject);
begin
  ecliente.Enabled := false;
  enombrecliente.Enabled := true;
  ccondicioniva.Enabled := true;
  ecuit.Enabled := true;
  edireccion.Enabled := true;
  etelefono.Enabled := true;
  ecliente.Color := clmenu;
  enombrecliente.Color := clwhite;
  ccondicioniva.Color := clwhite;
  ecuit.Color := clwhite;
  edireccion.Color := clwhite;
  etelefono.Color := clwhite;
  ccondicioniva.ItemIndex := 4;
  edocumento.Color := clwhite;
  edocumento.Enabled := true;
  if enombrecliente.Text = '' then
  begin
    bagregarcliente.Enabled := true;
  end;
  if enombrecliente.Text <> '' then
  begin
    bagregarcliente.Enabled := false;
    bguardar.Enabled := true;
  end;

  bcancelarcliente.Enabled := true;
end;

procedure TFticket.bguardarClick(Sender: TObject);
var

  FORM: tvalupdcliente;

begin
  if ccondicioniva.Text <> 'CONSUMIDOR FINAL' then
  begin
    if EsCUITValido(stringreplace(ecuit.Text, ' ', '', [rfReplaceAll])) = true
    then
    begin
      Ticket.codigocliente := ecliente.Text;
      Ticket.CUIT := ecuit.Text;
      Ticket.CONDICIONIVA := ccondicioniva.Text;
      Ticket.DESCRIPCIONCLIENTE := enombrecliente.Text;

      Ticket.direccion := edireccion.Text;
      Ticket.telefono := etelefono.Text;

      FORM := tvalupdcliente.Create(SELF);
      FORM.SetTicket(Ticket);
      FORM.ShowModal;
    end;
    if EsCUITValido(stringreplace(ecuit.Text, ' ', '', [rfReplaceAll])) = false
    then
    begin
      showmessage('CUIT INVALIDO');
    end;
  end;
  if ccondicioniva.Text = 'CONSUMIDOR FINAL' then
  begin
    Ticket.CUIT := ecuit.Text;
    Ticket.CONDICIONIVA := ccondicioniva.Text;
    Ticket.DESCRIPCIONCLIENTE := enombrecliente.Text;

    Ticket.direccion := edireccion.Text;
    Ticket.telefono := etelefono.Text;

    FORM := tvalupdcliente.Create(SELF);
    FORM.SetTicket(Ticket);
    FORM.ShowModal;
  end;

end;

procedure TFticket.bcancelarClick(Sender: TObject);
var
  leyendastring: widestring;
  leyenda: pwidechar;
  FORM: tvalcancel;
begin
  leyendastring :=
    ' Cancelando la impresion se recuerda que debera validar nuevamente, esta seguro?  Nro REF: '
    + Ticket.valnroreferencia;
  leyenda := pwidechar(leyendastring);
  if Ticket.valnroreferencia <> '' then
  begin
    if APPLICATION.MessageBox(leyenda, 'Anular', MB_YESNO) = IDYES then
    BEGIN
      FORM := tvalcancel.Create(SELF);
      FORM.SetTicket(Ticket);
      FORM.ShowModal;
      Ticket.valnroreferencia := '';
      Ticket.estadoticket := 0;
      modalresult := mrcancel;
    END
    ELSE

    BEGIN
      Ticket.estadoticket := 0;
      modalresult := mrcancel;
    END;
  end;
  if Ticket.valnroreferencia = '' then
  begin
    Ticket.estadoticket := 0;
    modalresult := mrcancel;
  end;
end;

procedure TFticket.bcancelarclienteClick(Sender: TObject);
begin
  ecliente.Text := '';
  ecliente.Enabled := true;
  enombrecliente.Enabled := false;
  ccondicioniva.ItemIndex := -1;
  ccondicioniva.Enabled := false;
  ecuit.Enabled := false;
  edireccion.Enabled := false;
  etelefono.Enabled := false;
  ecliente.Color := clwhite;
  enombrecliente.Color := clmenu;
  ccondicioniva.Color := clmenu;
  ecuit.Color := clmenu;
  edireccion.Color := clmenu;
  etelefono.Color := clmenu;

  if enombrecliente.Text = '' then
  begin
    bagregarcliente.Enabled := false;
  end;
  if enombrecliente.Text <> '' then
  begin
    bagregarcliente.Enabled := false;

  end;

  bcancelarcliente.Enabled := false;
  bguardar.Enabled := false;
end;

procedure TFticket.BimprimirClick(Sender: TObject);

var
  FORM: tfimpresion;
  FORM2: tfimpresionnofiscal;
  FORM3: tfprogreso;
  saldofc:  double;
  calculo: double;
begin
  Bimprimir.Enabled := false;
  ecliente.Enabled := false;
  arreglarsaldos;

  if((ticket.sorteo= 'S') and (ticket.TIENEAPLUS='S')) then
  begin
    sorteo;
  end;


  if ticket.Oespecial='S' then
  BEGIN
  promocion;
  END;
   if esaldofarmacoins.Text<>'' then
    begin
    descontarfarmacoins ;
    end;
  if ((Ticket.tip_comprobante = 'A') AND (ecliente.Text = '') and
    (ecuit.Text = '')) then
  begin
    showmessage('Insertar datos de cliente');
    Bimprimir.Enabled := true;
    ecliente.Enabled := true;
  end;
  if ((Ticket.tip_comprobante = 'B') AND (ecliente.Text = '') and
    (ecuit.Text = '')) then
  begin
    showmessage('Insertar datos de cliente');
    Bimprimir.Enabled := true;
    ecliente.Enabled := true;
  end;

  if ((Ticket.tip_comprobante = 'A') AND (ecliente.Text <> '') and
    (ecuit.Text <> '') and (Ticket.CONDICIONIVA = 'RESPONSABLE INSCRIPTO')) then
  begin

    FORM := tfimpresion.Create(APPLICATION);
    FORM.setEfectivo(stringreplace(EpEFECTIVO.Text, '$ ', '',[rfReplaceAll, rfIgnoreCase]));
    FORM.setTarjeta(stringreplace(EpTarjetas.Text, '$ ', '',[rfReplaceAll, rfIgnoreCase]));
    FORM.setos(stringreplace(ecobertura.Text, '$ ', '',[rfReplaceAll, rfIgnoreCase]));
    FORM.setco1(stringreplace(ecoseguro1.Text, '$ ', '',[rfReplaceAll, rfIgnoreCase]));
    FORM.setco2(stringreplace(ecoseguro2.Text, '$ ', '',[rfReplaceAll, rfIgnoreCase]));
    FORM.setch(stringreplace(epcheque.Text, '$ ', '',[rfReplaceAll, rfIgnoreCase]));
    FORM.setaplus(stringreplace(ESALDOFARMACOINS.Text, '$ ', '',[rfReplaceAll, rfIgnoreCase]));
    FORM.setcc(stringreplace(Epctacte.Text, '$ ', '',[rfReplaceAll, rfIgnoreCase]));

    FORM.setgentilezas(stringreplace(egentileza.Text, '$ ', '', [rfReplaceAll, rfIgnoreCase]));
    Ticket.codigocheque := echeque.Text;
    Ticket.numerocheque := enumerocheque.Text;
    Ticket.codigotarjeta := ecodtarjeta.Text;
    Ticket.DESCRIPCIONCLIENTE:=enombrecliente.Text;

    Ticket.codigocc := ECTACTE.Text;


    Ticket.cod_cliente := ecliente.Text;
    Ticket.direccion := edireccion.Text;
    if (ecliente.Text <> '') then
    begin
      verificarpuntos;
    end;
    FORM.SetTicket(Ticket);
    FORM.ShowModal;
    FORM.Update;
    FORM.Hide;
    FORM.DisposeOf;
    modalresult := mrcancel;

  end;

  if ((Ticket.tip_comprobante = 'A') AND (ecliente.Text <> '') and
    (ecuit.Text <> '') and (Ticket.CONDICIONIVA <> 'RESPONSABLE INSCRIPTO'))
  then
  begin
    showmessage
      ('EL CLIENTE DEBE SER RESPONSABLE INSCRIPTO PARA PODER EMITIR FACTURA "A"');
    Bimprimir.Enabled := true;
  end;

  if ((Ticket.tip_comprobante = 'B') AND (ecliente.Text <> '') and
    (Ticket.CONDICIONIVA <> '')) then
  begin
    if Ticket.CONDICIONIVA <> 'RESPONSABLE INSCRIPTO' then
    begin
      FORM := tfimpresion.Create(APPLICATION);
      FORM.setEfectivo(stringreplace(EpEFECTIVO.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));
      FORM.setTarjeta(stringreplace(EpTarjetas.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));
      FORM.setos(stringreplace(ecobertura.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));
      FORM.setco1(stringreplace(ecoseguro1.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));
      FORM.setco2(stringreplace(ecoseguro2.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));
      FORM.setch(stringreplace(epcheque.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));


    FORM.setcc(stringreplace(Epctacte.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));

      FORM.setgentilezas(stringreplace(egentileza.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));
       FORM.setaplus(stringreplace(ESALDOFARMACOINS.Text, '$ ', '',[rfReplaceAll, rfIgnoreCase]));
      Ticket.codigocheque := echeque.Text;
      Ticket.numerocheque := enumerocheque.Text;
      Ticket.codigotarjeta := ecodtarjeta.Text;
      Ticket.DESCRIPCIONCLIENTE:=enombrecliente.Text;


    Ticket.codigocc := ECTACTE.Text;

      Ticket.cod_cliente := ecliente.Text;
      Ticket.direccion := edireccion.Text;
      if (ecliente.Text <> '') then
      begin
        verificarpuntos;
      end;
      FORM.SetTicket(Ticket);
      FORM.ShowModal;
      FORM.Update;
      FORM.Hide;
      FORM.DisposeOf;
      modalresult := mrcancel;
    END;
    if Ticket.CONDICIONIVA = 'RESPONSABLE INSCRIPTO' then
    begin
      showmessage('CLIENTE RESPONSABLE INSCRIPTO IMPOSIBLE EMITIR FACTURA "B"');
      Bimprimir.Enabled := true;
    end;
    if Ticket.CONDICIONIVA = '' then
    begin
      showmessage('CONDICION IVA VACIO IMPOSIBLE EMITIR FACTURA "B"');
      Bimprimir.Enabled := true;
    end;
  end;

  if Ticket.tip_comprobante = 'T' then
  begin

    FORM := tfimpresion.Create(APPLICATION);
    FORM.setEfectivo(stringreplace(EpEFECTIVO.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));
    FORM.setTarjeta(stringreplace(EpTarjetas.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));
    FORM.setos(stringreplace(ecobertura.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));
    FORM.setco1(stringreplace(ecoseguro1.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));
    FORM.setco2(stringreplace(ecoseguro2.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));
    FORM.setch(stringreplace(epcheque.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));

    FORM.setcc(stringreplace(Epctacte.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));
    FORM.setgentilezas(stringreplace(egentileza.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase]));
     FORM.setaplus(stringreplace(ESALDOFARMACOINS.Text, '$ ', '',[rfReplaceAll, rfIgnoreCase]));

    Ticket.codigocheque := echeque.Text;
    Ticket.numerocheque := enumerocheque.Text;
    Ticket.codigotarjeta := ecodtarjeta.Text;

    Ticket.codigocc := ECTACTE.Text;
    Ticket.cod_cliente := ecliente.Text;
    Ticket.direccion := edireccion.Text;
    Ticket.DESCRIPCIONCLIENTE:=enombrecliente.Text;
    if (ecliente.Text <> '') then
    begin
      verificarpuntos;
    end;
    FORM.SetTicket(Ticket);
    FORM.ShowModal;
    FORM.Update;
    FORM.Hide;
    FORM.DisposeOf;
    modalresult := mrcancel;
  end;
  if Ticket.tip_comprobante = '' then
  begin
    if Ticket.comprobante = 'REI' then
    BEGIN
      if ecliente.Text = '' then
      BEGIN
        showmessage('INSERTE SUCURSAL DE DESTINO');
        Bimprimir.Enabled := true;
        ecliente.Enabled := true;
      END;
      if ecliente.Text <> '' then
      BEGIN

        FORM2 := tfimpresionnofiscal.Create(APPLICATION);
        FORM2.setEfectivo(stringreplace(EpEFECTIVO.Text, '$ ', '',
          [rfReplaceAll, rfIgnoreCase]));
        FORM2.setTarjeta(stringreplace(EpTarjetas.Text, '$ ', '',
          [rfReplaceAll, rfIgnoreCase]));
        FORM2.setos(stringreplace(ecobertura.Text, '$ ', '',
          [rfReplaceAll, rfIgnoreCase]));
        FORM2.setco1(stringreplace(ecoseguro1.Text, '$ ', '',
          [rfReplaceAll, rfIgnoreCase]));
        FORM2.setco2(stringreplace(ecoseguro2.Text, '$ ', '',
          [rfReplaceAll, rfIgnoreCase]));
        FORM2.setch(stringreplace(epcheque.Text, '$ ', '',
          [rfReplaceAll, rfIgnoreCase]));
        FORM2.setcc(stringreplace(Epctacte.Text, '$ ', '',
          [rfReplaceAll, rfIgnoreCase]));

        Ticket.codigocheque := echeque.Text;
        Ticket.numerocheque := enumerocheque.Text;
        Ticket.codigotarjeta := ecodtarjeta.Text;
        Ticket.codigocc := ECTACTE.Text;
        Ticket.direccion := edireccion.Text;
        FORM2.SetTicket(Ticket);
        FORM2.ShowModal;
        FORM2.Update;
        FORM2.Hide;
        FORM2.DisposeOf;
        modalresult := mrcancel;
      END;

    END;
    if Ticket.comprobante <> 'REI' then
    BEGIN

      FORM2 := tfimpresionnofiscal.Create(APPLICATION);
      FORM2.setEfectivo(stringreplace(EpEFECTIVO.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));
      FORM2.setTarjeta(stringreplace(EpTarjetas.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));
      FORM2.setos(stringreplace(ecobertura.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));
      FORM2.setco1(stringreplace(ecoseguro1.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));
      FORM2.setco2(stringreplace(ecoseguro2.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));
      FORM2.setch(stringreplace(epcheque.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));
      FORM2.setcc(stringreplace(Epctacte.Text, '$ ', '',
        [rfReplaceAll, rfIgnoreCase]));

      Ticket.codigocheque := echeque.Text;
      Ticket.numerocheque := enumerocheque.Text;
      Ticket.codigotarjeta := ecodtarjeta.Text;
      Ticket.codigocc := ECTACTE.Text;
      Ticket.direccion := edireccion.Text;



      FORM2.SetTicket(Ticket);

      FORM2.ShowModal;
      FORM2.Update;
      FORM2.Hide;
      FORM2.DisposeOf;

      modalresult := mrcancel;
    END;
  end;
end;

procedure TFticket.blimpiarchequeClick(Sender: TObject);
begin
  echeque.ReadOnly := false;
  echeque.Text := '';
  if epcheque.Text <> '' then
  begin
    EpEFECTIVO.Text := '$ ' +
      floattostr(strtofloat(stringreplace(EpEFECTIVO.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase])) + strtofloat(stringreplace(epcheque.Text,
      '$ ', '', [rfReplaceAll, rfIgnoreCase])));
    SaldoAPagar := SaldoAPagar + strtofloat(stringreplace(epcheque.Text, '$ ',
      '', [rfReplaceAll, rfIgnoreCase]));
    epcheque.Text := '';
  end;

  blimpiarcta.Enabled := false;
  esaldocheque.ReadOnly := true;
  echeque.SetFocus;
  blimpiarcheque.Enabled := false;
end;

procedure TFticket.blimpiarctaClick(Sender: TObject);
begin
  ECTACTE.ReadOnly := false;
  ECTACTE.Text := '';
  if Epctacte.Text <> '' then
  begin
    EpEFECTIVO.Text := '$ ' +
      floattostr(strtofloat(stringreplace(EpEFECTIVO.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase])) + strtofloat(stringreplace(Epctacte.Text,
      '$ ', '', [rfReplaceAll, rfIgnoreCase])));
    SaldoAPagar := SaldoAPagar + strtofloat(stringreplace(Epctacte.Text, '$ ',
      '', [rfReplaceAll, rfIgnoreCase]));
    Epctacte.Text := '';
  end;

  blimpiarcta.Enabled := false;
  ECuentaCorriente.ReadOnly := true;
  ECTACTE.SetFocus;
end;

procedure TFticket.blimpiarfcClick(Sender: TObject);
begin
ticket.farmacoins_importe:=0;
  if Esaldofarmacoins.Text <> '' then
  begin

    EpEFECTIVO.Text := '$ ' + floattostr(strtofloat(stringreplace(EpEFECTIVO.Text, '$ ', '',   [rfReplaceAll, rfIgnoreCase])) +
      strtofloat(stringreplace( Esaldofarmacoins.Text, '$ ', '', [rfReplaceAll,
      rfIgnoreCase])));
    SaldoAPagar := SaldoAPagar + strtofloat(stringreplace( Esaldofarmacoins.Text, '$ ',
      '', [rfReplaceAll, rfIgnoreCase]));
     Esaldofarmacoins.Text := '';
  end;
  Eafiliado.Text:='';
  eafiliado.ReadOnly := false;
  esaldousar.Text := '';
  esaldo.Text := '';
  esaldousar.ReadOnly:=true;
  blimpiarfc.Enabled := false;
  Eafiliado.ReadOnly := false;
  Eafiliado.SetFocus;
  ffacturador.Gfacturador.DataSource.DataSet.First;

      while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
      begin
        dmfacturador.dprincipal.Edit;

        ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[29].FieldName).asfloat:=0;
        ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[30].FieldName).asfloat:=0;
        ffacturador.Gfacturador.DataSource.DataSet.next;
        promo:='OK'
      end;
        if PROMO = 'OK' then
        BEGIN
          modalresult := mrcancel;
          ffacturador.fccredencial:=eafiliado.Text;
          ffacturador.fcsaldo:=esaldo.Text;
          ffacturador.fcfarmacoin:=esaldofarmacoins.text;


        END;

end;

procedure TFticket.blimpiartarjetaClick(Sender: TObject);
begin

  if EpTarjetas.Text <> '' then
  begin

    EpEFECTIVO.Text := '$ ' +
      floattostr(strtofloat(stringreplace(EpEFECTIVO.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase])) - coeficiente +
      strtofloat(stringreplace(EpTarjetas.Text, '$ ', '', [rfReplaceAll,
      rfIgnoreCase])));
    SaldoAPagar := SaldoAPagar + strtofloat(stringreplace(EpTarjetas.Text, '$ ',
      '', [rfReplaceAll, rfIgnoreCase])) - coeficiente;
    EpTarjetas.Text := '';
  end;
  ecodtarjeta.ReadOnly := false;
  ecodtarjeta.Text := '';
  blimpiartarjeta.Enabled := false;
  ECuentaTarjeta.ReadOnly := true;
  ecodtarjeta.SetFocus;

end;

procedure TFticket.btAgregarTarjetaClick(Sender: TObject);
var
  saldo: string;
  calculo: double;
begin
  // SALDOAPAGAR:=SALDOAPAGAR-STRTOFLOAT(ecuentatarjeta.Text);
  recalcularSaldoAPagar;

  if valor <> 'NEGATIVO' then
  BEGIN
    if ECuentaTarjeta.Text <> '' then
    begin
      // calculo:=strtofloat(FormatFloat('0.00', (strtofloat(ecuentatarjeta.Text)*((strtofloat(ecoeficiente.Text)/100)+1))));
      EpTarjetas.Text := '$ ' + (ECuentaTarjeta.Text);

    end;
  END;

  if ECuentaTarjeta.Text = '' then
  begin

    if enombretarjeta.Text = '' then
    BEGIN
      showmessage('CODIGO TARJETA INEXISTENTE');
    END;
    if enombretarjeta.Text <> '' then
    BEGIN
      showmessage('Inserte importe');
      ECuentaTarjeta.SetFocus;
      ECuentaTarjeta.ReadOnly := false;
    END;
  end;
  if ECuentaTarjeta.Text <> '' then
  begin
    ECuentaTarjeta.Text := '';
    ECuentaTarjeta.ReadOnly := true;
    ecodtarjeta.ReadOnly := true;
    blimpiartarjeta.Enabled := true;

  end;

end;

procedure TFticket.Button1Click(Sender: TObject);
var
  FORM: tfpromo;

begin

  Ticket.codigocupon := ecodigo.Text;
  FORM := tfpromo.Create(SELF);
  FORM.SetTicket(Ticket);
  FORM.ShowModal;
  if PROMO = 'OK' then
  BEGIN
    modalresult := mrcancel;
  END;

end;

procedure TFticket.bbuscardniClick(Sender: TObject);
begin
  dmFacturador.AbrirConexion();
  dmFacturador.qcliente.Close;
  dmFacturador.qcliente.SQL.Clear;
  dmFacturador.qcliente.SQL.Append
    ('select cod_cliente, nom_cliente, pos_iva, nro_cuit, des_direccion, des_telefono, nro_doc  from mkmacliente where nro_doc=:codigo');
  dmFacturador.qcliente.ParamByName('codigo').AsString := edocumento.Text;
  dmFacturador.qcliente.Open;
  if dmFacturador.qcliente.RecordCount = 1 then
  begin
    ecliente.Text := dmFacturador.qcliente.Fields[0].Text;
    Ticket.codigocliente := dmFacturador.qcliente.Fields[0].Text;
    enombrecliente.Text := dmFacturador.qcliente.Fields[1].Text;
    Ticket.DESCRIPCIONCLIENTE := dmFacturador.qcliente.Fields[1].Text;
    ecuit.Text := dmFacturador.qcliente.Fields[3].Text;
    Ticket.CUIT := dmFacturador.qcliente.Fields[3].Text;
    edireccion.Text := dmFacturador.qcliente.Fields[4].Text;
    Ticket.direccion := dmFacturador.qcliente.Fields[4].Text;
    etelefono.Text := dmFacturador.qcliente.Fields[5].Text;
    Ticket.telefono := dmFacturador.qcliente.Fields[5].Text;
 //   edocumento.Text := dmFacturador.qcliente.Fields[6].Text;
    Ticket.dni := dmFacturador.qcliente.Fields[6].Text;
    if dmFacturador.qcliente.Fields[2].Text = 'RESPONSABLE MONOTRIBUTO' then
    BEGIN
      ccondicioniva.ItemIndex := 0;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = 'RESPONSABLE INSCRIPTO' then
    BEGIN
      ccondicioniva.ItemIndex := 1;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = 'RESPONSABLE NO INSCRIPTO' then
    BEGIN
      ccondicioniva.ItemIndex := 2;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = 'EXENTO' then
    BEGIN
      ccondicioniva.ItemIndex := 3;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = 'CONSUMIDOR FINAL' then
    BEGIN
      ccondicioniva.ItemIndex := 4;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = '' then
    BEGIN
      ccondicioniva.ItemIndex := -1;
      Ticket.CONDICIONIVA := '';
    END;
  end;
  if dmFacturador.qcliente.RecordCount = 0 then
  begin

    enombrecliente.Text := '';
    ecuit.Text := '';
    ecliente.text:= '';
    edireccion.Text := '';
    etelefono.Text := '';
    ccondicioniva.ItemIndex := -1;

  end;



end;

procedure TFticket.BafiliadoClick(Sender: TObject);
begin
if esaldofarmacoins.Text='' then
  begin
    esaldo.ReadOnly := true;
    esaldousar.Enabled:=true;
    esaldousar.readonly:=false;
    consultarfarmacoins;
    if Ticket.farmacoins_importe<>0 then
    begin
      esaldo.Enabled:=true;
      esaldousar.Enabled:=true;
      esaldousar.Color:=clwhite;
      blimpiarfc.Enabled:=true;
      Eafiliado.ReadOnly := true;
    end;
    esaldo.Text := floattostr(Ticket.farmacoins_importe);

  end;
end;

procedure TFticket.consultarfarmacoins;
var
  S, url: String;
  j, I: integer;
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
    reg.OpenKey(regKey, true);
    Ticket.importe_promo := Ticket.IMPORTEBRUTO * 0.05;
    url := Ticket.url + 'get_puntos_farmavalor.php?' + 'tarjeta=' + eafiliado.Text;
   // url := Ticket.url + 'get_farmacoins_importe.php?nroafiliado=' +



      IdHTTP.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    S := IdHTTP.Get(url);
    j := 0;
    Doc := LoadXMLData(S);
    Doc.DocumentElement.ChildNodes.Count;
    ticket.farmacoins_importe :=strtofloat( Doc.DocumentElement.ChildNodes['Tarjeta'].ChildNodes['Puntos'].Text);


  finally

  end;


end;

procedure TFticket.copiaspooler;

var
  archivoXML: TXMLDocument;

  Nodo, NDatosGenerales, NMensajeFacturacion, NCabecera, NDatosFinales,
    terminal, software, validador, prestador, prescriptor, beneficiario,
    financiador, credencial, CoberturaEspecial, Preautorizacion, Fechareceta,
    Dispensa, Formulario, TipoTratamiento, Diagnostico, Institucion, Retira,
    detallereceta, item: IXMLNode;
  I: integer;
begin
  { archivoXML := TXMLDocument.Create(Application);

    try
    begin

    // Activamos el archivo XML
    archivoxml.xml.Clear;
    archivoxml.Active:=true;
    archivoXML.Version:='1.0';
    archivoXML.Encoding:='ISO-8859-1';
    NMensajeFacturacion := archivoXML.AddChild('COMPROBANTE');
    NCabecera := NMensajeFacturacion.AddChild( 'Encabezado' );
    Nodo := NCabecera.AddChild( 'NROTK' );
    Nodo.text :=ticket.fiscla_pv+(rightpad(inttostr(nro_comprobdigital), '0', 8));
    Nodo := NCabecera.AddChild( 'tipo_comprobante' );
    Nodo.Text := TICKEt.comprobante;
    Nodo := NCabecera.AddChild( 'NRO_VENDEDOR' );
    Nodo.Text := TICKEt.cod_vendedor;
    Nodo := NCabecera.AddChild( 'fecha_comprobante' );
    Nodo.Text := datetostr(now);
    Nodo := NCabecera.AddChild( 'codigo_cliente' );
    Nodo.Text := TICKEt.cod_cliente;
    Nodo := NCabecera.AddChild( 'codigo_cc' );
    Nodo.Text := ticket.codigocc;
    Nodo := NCabecera.AddChild( 'codigo_tj' );
    Nodo.Text := TICKEt.codigotarjeta;
    Nodo := NCabecera.AddChild( 'codigo_ch' );
    Nodo.Text := ticket.codigocheque;
    Nodo := NCabecera.AddChild( 'codigo_os' );
    Nodo.Text := TICKEt.codigo_OS;
    Nodo := NCabecera.AddChild( 'codigo_co1' );
    Nodo.Text := TICKEt.codigo_Co1;
    Nodo := NCabecera.AddChild( 'codigo_co2' );
    Nodo.Text := TICKEt.codigo_Cos2;
    Nodo := NCabecera.AddChild( 'importe_total' );
    Nodo.Text := floattostr(TICKet.importebruto);
    Nodo := NCabecera.AddChild( 'importe_neto' );
    Nodo.Text := floattostr(TICKEt.importeneto);
    Nodo := NCabecera.AddChild( 'importe_os' );
    Nodo.Text := floattostr(TICKEt.importecargoos);
    Nodo := NCabecera.AddChild( 'importe_co1' );
    Nodo.Text := floattostr(TICKEt.importecargoco1);
    Nodo := NCabecera.AddChild( 'pago_efectivo' );
    Nodo.Text := imp_efectivo;
    Nodo := NCabecera.AddChild( 'pago_tarjeta' );
    Nodo.Text := imp_tarjeta;
    Nodo := NCabecera.AddChild( 'pago_cc' );
    Nodo.Text := imp_cc;
    Nodo := NCabecera.AddChild( 'pago_ch' );
    Nodo.Text := imp_ch;
    Nodo := NCabecera.AddChild( 'afiliado_os' );
    Nodo.Text := ticket.afiliado_numero;
    Nodo := NCabecera.AddChild( 'matricula_medico' );
    Nodo.Text := ticket.medico_nro_matricula;
    Nodo := NCabecera.AddChild( 'afiliado_co1' );
    Nodo.Text := ticket.afiliado_numeroco1;
    Nodo := NCabecera.AddChild( 'matricula_medicoco1' );
    Nodo.Text := ticket.medico_tipo_matricula+ticket.medico_nro_matricula;
    Nodo := NCabecera.AddChild( 'codigo_Validacion' );
    Nodo.Text := ticket.valnroreferencia;
    Nodo := NCabecera.AddChild( 'Nro_caja' );
    Nodo.Text := ticket.nro_caja;
    Nodo := NCabecera.AddChild( 'fecha_operativa' );
    Nodo.Text := datetostr(ticket.fec_operativa);
    detallereceta := NMensajeFacturacion.AddChild( 'DetalleReceta' );
    ffacturador.Gfacturador.DataSource.DataSet.First;
    while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
    begin
    i:=i+1;
    item := detallereceta.AddChild('Item');
    Nodo := item.AddChild( 'NroItem' );
    Nodo.Text := inttostr(i);
    Nodo := item.AddChild( 'Cod_alfabeta' );
    Nodo.Text := inttostr(ffacturador.Gfacturador.Fields[8].AsInteger);
    Nodo := item.AddChild( 'nom_producto' );
    Nodo.Text := ffacturador.Gfacturador.Fields[1].AsString;
    Nodo := item.AddChild( 'cantidad' );
    Nodo.Text := inttostr(ffacturador.Gfacturador.Fields[3].Asinteger);
    Nodo := item.AddChild( 'imp_unitario' );
    Nodo.Text := floattostr(ffacturador.Gfacturador.Fields[2].asfloat);
    Nodo := item.AddChild( 'nro_troquel' );
    Nodo.Text := inttostr(ffacturador.Gfacturador.Fields[0].Asinteger);
    Nodo := item.AddChild( 'por_descuento' );
    Nodo.Text := inttostr(ffacturador.Gfacturador.Fields[11].Asinteger);
    Nodo := item.AddChild( 'imp_descuento' );
    Nodo.Text :=floattostr((ffacturador.Gfacturador.Fields[2].Asfloat*ffacturador.Gfacturador.Fields[11].Asfloat)/100);
    Nodo := item.AddChild( 'Codigo_iva' );
    Nodo.Text := ffacturador.Gfacturador.fields[10].AsString;
    Nodo := item.AddChild( 'imp_productoneto' );
    Nodo.Text := floattostr(ffacturador.Gfacturador.Fields[6].asfloat-ffacturador.Gfacturador.Fields[4].asfloat);
    Nodo := item.AddChild( 'Stock' );
    Nodo.Text := ffacturador.Gfacturador.fields[16].AsString;
    Nodo := item.AddChild( 'Laboratorio' );
    Nodo.Text := ffacturador.Gfacturador.fields[15].AsString;
    ffacturador.Gfacturador.DataSource.DataSet.Next;
    end;
    archivoXML.SaveToFile(ticket.errores+ticket.fiscla_pv+(rightpad(inttostr(nro_comprobdigital), '0', 8))+'.xml');

    end;

    finally

    end;





    end; }
end;

procedure TFticket.descontarfarmacoins;
var
  S, url: String;
  j, i: integer;
  Doc: IXMLDocument;
  resultado_alta_cliente, detalle: IXMLNode;
  porcentaje, descuentos, afiliado_nombre, afiliado_apellido: STRING;
  numImpresora: integer;
  detalleval: IXMLNode;
  reg: tregistry;
  ticketfc: string;
  importefc: double;

begin

  S := '';

  try

    reg := tregistry.Create;
    reg.RootKey := HKEY_CURRENT_USER;
    reg.OpenKey(regKey, True);
    Ticket.importe_promo := Ticket.importebruto * 0.05;
    ticketfc:='RES'+formatdatetime('mmddHHMMSS', (now));
    importefc:=strtofloat((stringreplace(esaldofarmacoins.Text, '$ ', '',
      [rfReplaceAll, rfIgnoreCase])));
    url := Ticket.url + 'resta_puntosfarmavalor.php?tarjeta='+ eafiliado.Text  + '&puntos=' + floattostr(importefc);

    IdHTTP.Request.UserAgent :='Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';

    S := IdHTTP.Get(url);
    j := 0;

  finally

  end;
  consultarfarmacoins;

end;

procedure TFticket.ecodtarjetaChange(Sender: TObject);
var
coeficiente_medicinal:Double;
begin

  dmFacturador.AbrirConexion();
  dmFacturador.qafiliados.Close;
  dmFacturador.qafiliados.SQL.Text :=
    concat('select nom_tarjeta, por_recargo from bamatarjeta where cod_tarjeta=:codigo');
  dmFacturador.qafiliados.ParamByName('codigo').AsString := ecodtarjeta.Text;
  dmFacturador.qafiliados.Open;
  if dmFacturador.qafiliados.RecordCount = 1 then
  Begin
    calcularRecargoMedicinal; // Aplica si se agrego un ticket de farmacia en cuotas
    coeficiente_medicinal:=0;
    enombretarjeta.Text := dmFacturador.qafiliados.Fields[0].Text;
    ecoeficiente.Text := dmFacturador.qafiliados.Fields[1].Text;
    if ecoeficiente.Text = '' then
    begin
      Ticket.coeficientetarjeta := 1;
    end 
    
    else 
    begin
      if (Ticket.codigo_OS = '') AND (Ticket.codigo_CO1 = '') AND
        (Ticket.codigo_Cos2 = '') then
      BEGIN
        Ticket.coeficientetarjeta :=
          ((strtofloat(ecoeficiente.Text) / 100) + 1);
      end
      ELSE
        begin
          coeficiente_medicinal:= ((strtofloat(ecoeficiente.Text) / 100) + 1);
          Ticket.coeficientetarjeta := 1;
        end;

    end;
    coeficiente:= calcularCoeficiente;

    if coeficiente_medicinal > 0 then
    begin
       ticket.coeficientetarjeta:= coeficiente_medicinal; 
       coeficiente:=calcularCoeficiente;
       ticket.coeficientetarjeta:= 1; 
    end; 
    
    eimporteneto.Text := TUtils.FormatearImporte(IMPORTENETO,coeficiente);
    coeficiente:=calcularCoeficiente;
   
    eimportebruto.Text :=  TUtils.FormatearImporte(IMPORTEBRUTO,coeficiente); 
    EpEFECTIVO.Text := TUtils.FormatearImporteMonetario(EpEfectivo.text,coeficiente);

    
    SaldoAPagar :=
      roundto(strtofloat(formatfloat('0.00',
      (strtofloat(formatfloat('0.00', (strtofloat(stringreplace(EpEFECTIVO.Text,
      '$ ', '', [rfReplaceAll, rfIgnoreCase])))))))), -2);
    ECuentaTarjeta.ReadOnly := false;
    ECuentaTarjeta.SetFocus;
  end;
  if dmFacturador.qafiliados.RecordCount < 1 then
  begin
    enombretarjeta.Text := '';
    ECuentaTarjeta.Text := '';
    ecoeficiente.Text := '';
    Ticket.coeficientetarjeta := 1;
    coeficiente := calcularCoeficiente; 
    
    eimporteneto.Text :=  TUtils.FormatearImporte(IMPORTENETO,coeficiente);
    
    eimportebruto.Text :=  TUtils.FormatearImporte(IMPORTEBRUTO,coeficiente); 
    
    EpEFECTIVO.Text := TUtils.FormatearImporteMonetario(EpEfectivo.text,coeficiente);
    
    SaldoAPagar :=
      roundto(strtofloat(formatfloat('0.00', (IMPORTENETO + coeficiente))), -2);

    ecodtarjeta.SetFocus;
  end;

end;

procedure TFticket.ecodtarjetaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  FORM: tfbuscardatos;
begin
  if Key = VK_DOWN then
  BEGIN
    FORM := tfbuscardatos.Create(SELF);
    FORM.TipoBusqueda := tarjeta;
    FORM.ShowModal;

    ecodtarjeta.Text := FORM.nombreSeleccionado;
    enombretarjeta.Text := FORM.numeroSeleccionado;
    ecoeficiente.Text := FORM.coeficiente;
    ECuentaTarjeta.ReadOnly := false;
    ECuentaTarjeta.SetFocus;
    FORM.DisposeOf;
  END;

end;

procedure TFticket.ECTACTEChange(Sender: TObject);
// var
// reg: tregistry;
begin

  dmFacturador.AbrirConexion();
  dmFacturador.qafiliados.Close;
  dmFacturador.qafiliados.SQL.Text :=
    concat('select nom_ctacte, cod_cliente from ccmactacte where cod_ctacte=:codigo and cod_Estado=''A''');
  dmFacturador.qafiliados.ParamByName('codigo').AsString := ECTACTE.Text;
  dmFacturador.qafiliados.Open;
  if dmFacturador.qafiliados.RecordCount = 1 then
  Begin

    Ticket.cod_cliente := dmFacturador.qafiliados.Fields[1].Text;
    Ticket.nombrecc := dmFacturador.qafiliados.Fields[0].Text;
    nombrecc.Caption := Ticket.nombrecc;
    ecliente.Text := Ticket.cod_cliente;
    ECuentaCorriente.ReadOnly := false;
    ESCTA.SetFocus;

  end
  else
  Begin
    nombrecc.Caption := '';
    ECuentaCorriente.Text := '';
    Ticket.cod_cliente := '';
    ecliente.Text := '';
    Ticket.nombrecc := '';
  end;

end;

procedure TFticket.ECTACTEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  FORM: tfbuscardatos;
begin
  if Key = VK_DOWN then
  BEGIN
    FORM := tfbuscardatos.Create(SELF);
    FORM.TipoBusqueda := CTACTE;
    FORM.ShowModal;

    ECTACTE.Text := FORM.nombreSeleccionado;
    ESCTA.Text := FORM.codigosubcuenta;
    nombrecc.Caption := FORM.numeroSeleccionado;
    Ticket.cod_cliente := FORM.cod_cliente;
    Ticket.codigosubcc := FORM.codigosubcuenta;

    if nombrecc.Caption <> '' then
    begin
      ECuentaCorriente.ReadOnly := false;
      ECuentaCorriente.SetFocus;
    end;
    FORM.DisposeOf;
  END;

end;

procedure TFticket.ECTACTEKeyPress(Sender: TObject; var Key: Char);
// var
// reg: tregistry;
begin
  if ((Key = #13)) then

  begin
    dmFacturador.AbrirConexion();
    dmFacturador.qafiliados.Close;
    dmFacturador.qafiliados.SQL.Text :=
      concat('select nom_ctacte from ccmactacte where cod_ctacte=:codigo');
    dmFacturador.qafiliados.ParamByName('codigo').AsString := ECTACTE.Text;
    dmFacturador.qafiliados.Open;
  end;
  if dmFacturador.qafiliados.RecordCount = 1 then
  Begin
    nombrecc.Caption := dmFacturador.qafiliados.Fields[0].Text;
  end;

end;

procedure TFticket.ECuentaCorrienteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Agregar.Click;
  end;
end;

procedure TFticket.ECuentaTarjetaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btAgregarTarjeta.Click;
  end;
end;

procedure TFticket.ecuitKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8]) then
  begin
    Key := #0;
  end;
end;

procedure TFticket.edocumentoChange(Sender: TObject);
begin
  dmFacturador.AbrirConexion();
  dmFacturador.qcliente.Close;
  dmFacturador.qcliente.SQL.Clear;
  dmFacturador.qcliente.SQL.Append
    ('select cod_cliente, nom_cliente, pos_iva, nro_cuit, des_direccion, des_telefono, nro_doc  from mkmacliente where nro_doc=:codigo');
  dmFacturador.qcliente.ParamByName('codigo').AsString := edocumento.Text;
  dmFacturador.qcliente.Open;
  if dmFacturador.qcliente.RecordCount = 1 then
  begin
    ecliente.Text := dmFacturador.qcliente.Fields[0].Text;
    Ticket.codigocliente := dmFacturador.qcliente.Fields[0].Text;
    enombrecliente.Text := dmFacturador.qcliente.Fields[1].Text;
    Ticket.DESCRIPCIONCLIENTE := dmFacturador.qcliente.Fields[1].Text;
    ecuit.Text := dmFacturador.qcliente.Fields[3].Text;
    Ticket.CUIT := dmFacturador.qcliente.Fields[3].Text;
    edireccion.Text := dmFacturador.qcliente.Fields[4].Text;
    Ticket.direccion := dmFacturador.qcliente.Fields[4].Text;
    etelefono.Text := dmFacturador.qcliente.Fields[5].Text;
    Ticket.telefono := dmFacturador.qcliente.Fields[5].Text;
 //   edocumento.Text := dmFacturador.qcliente.Fields[6].Text;
    Ticket.dni := dmFacturador.qcliente.Fields[6].Text;
    if dmFacturador.qcliente.Fields[2].Text = 'RESPONSABLE MONOTRIBUTO' then
    BEGIN
      ccondicioniva.ItemIndex := 0;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = 'RESPONSABLE INSCRIPTO' then
    BEGIN
      ccondicioniva.ItemIndex := 1;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = 'RESPONSABLE NO INSCRIPTO' then
    BEGIN
      ccondicioniva.ItemIndex := 2;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = 'EXENTO' then
    BEGIN
      ccondicioniva.ItemIndex := 3;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = 'CONSUMIDOR FINAL' then
    BEGIN
      ccondicioniva.ItemIndex := 4;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = '' then
    BEGIN
      ccondicioniva.ItemIndex := -1;
      Ticket.CONDICIONIVA := '';
    END;
  end;
  if dmFacturador.qcliente.RecordCount = 0 then
  begin

    enombrecliente.Text := '';
    ecuit.Text := '';
    ecliente.text:= '';
    edireccion.Text := '';
    etelefono.Text := '';
    ccondicioniva.ItemIndex := -1;

  end;


end;

procedure TFticket.esaldochequeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    bagregarcheque.Click;
  end;
end;

procedure TFticket.esaldousarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    bAgregarfarmacoins.Click;
  end;
end;

procedure TFticket.ESCTAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

VAR
  FORM: tfbuscardatos;

begin
  if Key = VK_DOWN then
  BEGIN
    Ticket.codigocc := ECTACTE.Text;
    FORM := tfbuscardatos.Create(SELF);
    FORM.SetTicket(Ticket);
    FORM.TipoBusqueda := SCTACTE;
    FORM.ShowModal;

    ECTACTE.Text := FORM.nombreSeleccionado;
    ESCTA.Text := FORM.codigosubcuenta;
    nombrecc.Caption := FORM.numeroSeleccionado;
    Ticket.cod_cliente := FORM.cod_cliente;
    Ticket.codigosubcc := FORM.codigosubcuenta;

    if nombrecc.Caption <> '' then
    begin
      ECuentaCorriente.ReadOnly := false;
      ECuentaCorriente.SetFocus;
    end;
    FORM.DisposeOf;
  END;
end;

procedure TFticket.ESCTAKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    ECuentaCorriente.SetFocus;
  end;
end;

procedure TFticket.eafiliadoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    bafiliado.Click;
  end;
end;

procedure TFticket.echequeChange(Sender: TObject);
begin

  dmFacturador.AbrirConexion();
  dmFacturador.qafiliados.Close;
  dmFacturador.qafiliados.SQL.Text :=
    concat('select nom_banco from bamabanco where cod_banco=:codigo');
  dmFacturador.qafiliados.ParamByName('codigo').AsString := echeque.Text;
  dmFacturador.qafiliados.Open;
  if dmFacturador.qafiliados.RecordCount = 1 then
  Begin
    lnombrebanco.Caption := dmFacturador.qafiliados.Fields[0].Text;
    enumerocheque.ReadOnly := false;
    esaldocheque.ReadOnly := false;
    enumerocheque.SetFocus;
    blimpiarcheque.Enabled := true;
  end;

  if dmFacturador.qafiliados.RecordCount < 1 then
  Begin
    enumerocheque.Text := '';
    esaldocheque.Text := '';
    blimpiarcheque.Enabled := false;
    enumerocheque.ReadOnly := true;
  end;

end;

procedure TFticket.echequeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

VAR
  FORM: tfbuscardatos;
begin
  if Key = VK_DOWN then
  BEGIN
    FORM := tfbuscardatos.Create(SELF);
    FORM.TipoBusqueda := banco;
    FORM.ShowModal;

    echeque.Text := FORM.nombreSeleccionado;

    FORM.DisposeOf;
  END;
end;

procedure TFticket.eclienteChange(Sender: TObject);
begin
  edocumento.OnChange:=nil;
  dmFacturador.AbrirConexion();
  dmFacturador.qcliente.Close;
  dmFacturador.qcliente.SQL.Clear;
  dmFacturador.qcliente.SQL.Append
    ('select cod_cliente, nom_cliente, pos_iva, nro_cuit, des_direccion, des_telefono, nro_doc  from mkmacliente where cod_cliente=:codigo');
  dmFacturador.qcliente.ParamByName('codigo').AsString := ecliente.Text;
  dmFacturador.qcliente.Open;
  if dmFacturador.qcliente.RecordCount = 1 then
  begin
    ecliente.Text := dmFacturador.qcliente.Fields[0].Text;
    Ticket.codigocliente := dmFacturador.qcliente.Fields[0].Text;
    enombrecliente.Text := dmFacturador.qcliente.Fields[1].Text;
    Ticket.DESCRIPCIONCLIENTE := dmFacturador.qcliente.Fields[1].Text;
    ecuit.Text := dmFacturador.qcliente.Fields[3].Text;
    Ticket.CUIT := dmFacturador.qcliente.Fields[3].Text;
    edireccion.Text := dmFacturador.qcliente.Fields[4].Text;
    Ticket.direccion := dmFacturador.qcliente.Fields[4].Text;
    etelefono.Text := dmFacturador.qcliente.Fields[5].Text;
    Ticket.telefono := dmFacturador.qcliente.Fields[5].Text;
    edocumento.Text := dmFacturador.qcliente.Fields[6].Text;
    Ticket.dni := dmFacturador.qcliente.Fields[6].Text;
    if dmFacturador.qcliente.Fields[2].Text = 'RESPONSABLE MONOTRIBUTO' then
    BEGIN
      ccondicioniva.ItemIndex := 0;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = 'RESPONSABLE INSCRIPTO' then
    BEGIN
      ccondicioniva.ItemIndex := 1;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = 'RESPONSABLE NO INSCRIPTO' then
    BEGIN
      ccondicioniva.ItemIndex := 2;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = 'EXENTO' then
    BEGIN
      ccondicioniva.ItemIndex := 3;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = 'CONSUMIDOR FINAL' then
    BEGIN
      ccondicioniva.ItemIndex := 4;
      Ticket.CONDICIONIVA := dmFacturador.qcliente.Fields[2].Text
    END;
    if dmFacturador.qcliente.Fields[2].Text = '' then
    BEGIN
      ccondicioniva.ItemIndex := -1;
      Ticket.CONDICIONIVA := '';
    END;
  end;
  if dmFacturador.qcliente.RecordCount = 0 then
  begin

    enombrecliente.Text := '';
    ecuit.Text := '';
//    edocumento.Text := '';
    edireccion.Text := '';
    etelefono.Text := '';
    ccondicioniva.ItemIndex := -1;

  end;
  edocumento.OnChange:=edocumentoChange;
end;

procedure TFticket.eclienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  FORM: tfcliente;

begin

  if Key = VK_DOWN then
  BEGIN
    FORM := tfcliente.Create(SELF);
    FORM.SetTicket(Ticket);
    FORM.ShowModal;

    ecuit.Text := Ticket.CUIT;

    if Ticket.CONDICIONIVA = 'RESPONSABLE MONOTRIBUTO' then
    BEGIN
      ccondicioniva.ItemIndex := 0;
    END;
    if Ticket.CONDICIONIVA = 'RESPONSABLE INSCRIPTO' then
    BEGIN
      ccondicioniva.ItemIndex := 1;
    END;
    if Ticket.CONDICIONIVA = 'RESPONSABLE NO INSCRIPTO' then
    BEGIN
      ccondicioniva.ItemIndex := 2;
    END;
    if Ticket.CONDICIONIVA = 'EXENTO' then
    BEGIN
      ccondicioniva.ItemIndex := 3;
    END;
    if Ticket.CONDICIONIVA = 'CONSUMIDOR FINAL' then
    BEGIN
      ccondicioniva.ItemIndex := 4;
    END;
    enombrecliente.Text := Ticket.DESCRIPCIONCLIENTE;
    ecliente.Text := Ticket.codigocliente;
    edireccion.Text := Ticket.direccion;
    etelefono.Text := Ticket.telefono;
    edocumento.Text := Ticket.dni;
    FORM.DisposeOf;
  END;

end;

procedure TFticket.eclienteKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8]) then
  begin
    Key := #0;
  end;
end;

procedure TFticket.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F11 then
  begin
    bcancelar.Click;
  end;
  if Key = VK_F6 then
  begin
    if Bimprimir.Enabled = true then
    begin
      Bimprimir.Click;
    end;
  end;

end;

procedure TFticket.FormShow(Sender: TObject);
begin

  PROMO := '';
  EpEFECTIVO.ReadOnly := false;
  EpEFECTIVO.Text := '$ ' + floattostr(IMPORTENETO);
  EpEFECTIVO.ReadOnly := true;
  eimporteneto.ReadOnly := false;
  eimporteneto.Text := '$ ' +
    floattostr(IMPORTENETO * Ticket.coeficientetarjeta);
  ecobertura.Text := '$ ' + floattostr(COBERTURAPLAN);
  ecoseguro1.Text := '$ ' + floattostr(coberturaco1);
  ecoseguro2.Text := '$ ' + floattostr(coberturaco2);
  eautofarmaplus.Text:='$ '+floattostr(autofarmaplus);
  ecubiertoxplanes.Text := '$ ' + floattostr(coberturatota - gentilezas);
  eimportebruto.Text := '$ ' +
    floattostr(IMPORTEBRUTO * Ticket.coeficientetarjeta);
  egentileza.Text := '$ ' + floattostr(gentilezas);

  Mcodigoautorizacion.Text := Ticket.valnroreferencia;
  eimporteneto.ReadOnly := true;
  LMAXIMO.Caption := EpEFECTIVO.Text;
  SaldoAPagar := IMPORTENETO;
  Bimprimir.SetFocus;
  pmodospago.ActivePageIndex := 1;                          
  Ticket.importegentileza := gentilezas;
  if ffacturador.fccredencial<>'' then
  begin
    eafiliado.Text:=ffacturador.fccredencial;
    esaldo.Text:=ffacturador.fcsaldo;
    esaldofarmacoins.Text:=ffacturador.fcfarmacoin;
    pmodospago.TabIndex:=5;
    eafiliado.ReadOnly:=true;
    esaldousar.readonly:=true;
    blimpiarfc.Enabled:=true;
    bafiliado.Click;
  end;
  if ticket.cod_cliente<>'' then
  begin
  pmodospago.ActivePageIndex := 5;
  eafiliado.Text:=ticket.dni;
  bafiliado.Click;
  ecliente.Text:=ticket.cod_cliente;
  end;

end;

procedure TFticket.pmodospagoChange(Sender: TObject);
begin
  if pmodospago.TabIndex = 0 then
  BEGIN
    // EcuentaCorriente.Text:=floattostr(SaldoAPagar);
  END;

  if pmodospago.TabIndex = 1 then
  BEGIN
    // ECuentaTarjeta.Text:=floatToStr(SaldoAPagar);
  END;

  if pmodospago.TabIndex = 2 then
  BEGIN
    // EcuentaCorriente.Text:=SaldoAPagar;
  END;
  if pmodospago.TabIndex = 3 then
  BEGIN
    // EcuentaCorriente.Text:=SaldoAPagar;
  END;

end;

procedure TFticket.promocion;
var
  valor: string;
  numImpresora: integer;
  reg: tregistry;
   saldo: string;
  calculo: double;
  farmacoinsitems: double;
  porcentajecalculo:double;
  total: double;
  saldofarmacoins: double;
  porcentaje: double;
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
  dmfacturador.qpromo.SQL.Add('select ultimopatchejecutado from defpatches where idpatch=:sucursal');
  dmfacturador.qpromo.ParamByName('sucursal').Asstring := Ticket.sucursal;
  dmfacturador.qpromo.Open;
  valor := dmfacturador.qpromo.FieldByName('ultimopatchejecutado').Asstring;
  dmfacturador.qpromo.Close;
  dmfacturador.qpromo.SQL.Clear;
  dmfacturador.qpromo.SQL.Add('update defpatches set ultimopatchejecutado=:valor where idpatch=:sucursal');
  dmfacturador.qpromo.ParamByName('sucursal').Asstring := Ticket.sucursal;
  dmfacturador.qpromo.ParamByName('valor').Asstring :=
    inttostr(strtoint(valor) + 1);
  dmfacturador.qpromo.Open;
  dmfacturador.tpromo.Commit;
if strtoint(valor)+1>=200 then
begin
if egentileza.Text='$ 0' then
begin

if ticket.importeneto>0 then
SHOWMESSAGE('TICKET GANADOR !!!!!!!');
  begin
    if ticket.importeneto<2500 then
    begin
      dmfacturador.qpromo.Close;
      dmfacturador.qpromo.SQL.Clear;
      dmfacturador.qpromo.SQL.Add('update defpatches set ultimopatchejecutado=:valor where idpatch=:sucursal');
      dmfacturador.qpromo.ParamByName('sucursal').Asstring := Ticket.sucursal;
      dmfacturador.qpromo.ParamByName('valor').Asstring :='0';
      dmfacturador.qpromo.Open;
      dmfacturador.tpromo.Commit;
      total:=ticket.importebruto;
      ffacturador.Gfacturador.DataSource.DataSet.First;

      while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
      begin
        dmfacturador.dprincipal.Edit;

        porcentaje:=100-ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[11].FieldName).asfloat-ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[12].FieldName).asfloat-ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[13].FieldName).asfloat-ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[22].FieldName).asfloat;
        ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[22].FieldName).asfloat:=porcentaje;
        ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[24].FieldName).asfloat:=ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[5].FieldName).asfloat;
        ffacturador.Gfacturador.DataSource.DataSet.next;
      end;
      if epefectivo.Text<>'' then
      begin
      epefectivo.Text:='$ 0';
      end;
      if eptarjetas.Text<>'' then
      begin
      eptarjetas.Text:='$ 0';
      end;
      if epcheque.Text<>'' then
      begin
      epcheque.Text:='$ 0';
      end;
      if epctacte.Text<>'' then
      begin
      epctacte.Text:='$ 0';
      end;
      if esaldofarmacoins.Text<>'' then
      begin
      esaldofarmacoins.Text:='$ 0';
      end;
    end;
  end;
end;

end;
end;

procedure TFticket.recalcularSaldoAPagar;
var
  saldoparcial: currency;
begin

  saldoparcial := SaldoAPagar;
  if not(trim(ECuentaCorriente.Text) = '') then
  Begin
    saldoparcial := saldoparcial - strtofloat(ECuentaCorriente.Text);
  End;
  if not(trim(ECuentaTarjeta.Text) = '') then
  begin
    saldoparcial := saldoparcial - strtofloat(ECuentaTarjeta.Text);
  end;
  if not(trim(esaldocheque.Text) = '') then
  begin
    saldoparcial := saldoparcial - strtofloat(esaldocheque.Text);
  end;
  if not(trim(esaldousar.Text) = '') then
  begin
    saldoparcial := saldoparcial - strtofloat(esaldousar.Text);
  end;
 { if not(trim(esaldousar.Text) = '') then
  begin
    saldoparcial := saldoparcial - strtofloat(esaldousar.Text);
  end;    }
  if saldoparcial < 0 then
  begin
    showmessage('IMPOSIBLE INSERTAR PAGO NEGATIVO');
    valor := 'NEGATIVO';
  end;
  if saldoparcial >= 0 then
  begin
    LMAXIMO.Caption := floattostr(saldoparcial);
    SaldoAPagar := saldoparcial;
    EpEFECTIVO.Text := '$ ' + floattostr(SaldoAPagar);
    valor := 'POSITIVO';
  end;
end;

procedure TFticket.SetTicket(unTicket: TTicket);
begin
  Ticket := unTicket;
end;

procedure TFticket.verificarpuntos;
VAR
  S, url: String;
  j, I: integer;
  Doc: IXMLDocument;
  resultado_alta_cliente, detalle: IXMLNode;
  SUCURSAL, STOCK: STRING;
  reg: tregistry;
  detalleval: IXMLNode;
  FORM: tfprogreso;

begin
  S := '';
  try
    FORM := tfprogreso.Create(SELF);

    FORM.Show;
    APPLICATION.ProcessMessages;
    url := Ticket.url + 'get_puntos_farmavalor.php?' + 'tarjeta=' +
      Ticket.cod_cliente;

    IdHTTP.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    S := IdHTTP.Get(url);
    j := 0;
    Doc := LoadXMLData(S);
    Doc.DocumentElement.ChildNodes.Count;
    Ticket.puntos_farmavalor := Doc.DocumentElement.ChildNodes['Tarjeta']
      .ChildNodes['Puntos'].Text;

    FORM.Close;
  except
    on E: Exception do
    begin
{$IFDEF DEBUG}showmessage('IMPOSIBLE VERIFICAR PUNTOS:' + E.Message){$ENDIF};
    end;

  end;
end;

procedure TFticket.sorteo;
var
  listaSorteos:TList<TSorteo>;
  sorteo:TSorteo;
  unRenglonSorteo:TRenglonSorteo;
  sorteoService:TSorteoService;
  tipoSorteo,valor:string;
  defPatchesDAO:TDefPatchesDAO;
  cantTickets:integer;
  frmValSorteo:TFrmValSorteo;
begin


  defPatchesDAO:=TDefPatchesDAO.Create;
  sorteoService:=TSorteoService.Create(TXMLDocument.Create(Application));
  listaSorteos:= sorteoService.obtenerSorteos(ticket.ofertas+'SORTEO.XML');
  cantTickets:= strToInt(defPatchesDAO.getUltPatchPorSucursal(ticket.sucursal)) +1;
  sorteoService.cantTickets:= cantTickets;
  for sorteo in listaSorteos do
  begin

       sorteoService.analizarSorteo(sorteo);
       if sorteoService.entraPromo then
       begin
          frmValSorteo:= TFrmValSorteo.Create(SELF);
          ticket.nroSorteo:=sorteo.SorteoEsquemaId;
          frmValSorteo.SetTicket(ticket);
          frmValSorteo.ShowModal;

       end;


  end;

  defPatchesDAO.aplicarPathEnSucursal(cantTickets,ticket.sucursal);

  sorteoService.Free;
  listaSorteos.Free;
end;

function TFticket.calcularCoeficiente: double;
begin
  Result:= strtofloat(formatfloat('0.00', ((strtofloat(stringreplace(EpEFECTIVO.Text, '$ ', '', [rfReplaceAll, rfIgnoreCase])) - totalRecargoMedicinal) * Ticket.coeficientetarjeta))) - (strtofloat(stringreplace(EpEFECTIVO.Text, '$ ', '', [rfReplaceAll, rfIgnoreCase]))) + totalRecargoMedicinal;
end;

procedure TFticket.calcularRecargoMedicinal;
var
  precioTotalStr: string;
begin
   totalRecargoMedicinal := 0;

  dmFacturador.DPRINCIPAL.First;
  while not dmFacturador.DPRINCIPAL.Eof do
  begin
     // Obtén la cadena formateada y realiza limpieza
      precioTotalStr := dmFacturador.DPRINCIPAL.FieldByName('Precio_Total').AsString;
      precioTotalStr := StringReplace(precioTotalStr, '$', '', [rfReplaceAll, rfIgnoreCase]);
      precioTotalStr := StringReplace(precioTotalStr, ' ', '', [rfReplaceAll, rfIgnoreCase]);

      // Ahora convierte la cadena a un número de punto flotante
      try
        if dmFacturador.DPRINCIPAL.FieldByName('ES_RECARGO').AsString = 'S'  then
            totalRecargoMedicinal := totalRecargoMedicinal + StrToFloat(precioTotalStr);

      except
        on E: EConvertError do
          ShowMessage('Error de conversión: ' + E.Message);
      end;
        dmFacturador.DPRINCIPAL.Next;
    end;
    // Avanza al siguiente registro

end;

end.

unit Ubuscardatos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, udmFacturador,registry, udticket;

type
  TTipoBusqueda=(Medicos , Afiliados, CTACTE, TARJETA, banco, sctacte);
  TFbuscardatos = class(TForm)
    grillabusqueda: TDBGrid;
    ebuscar: TEdit;
    BBUSCAR: TButton;
    Bcancelar: TBitBtn;
    procedure BBUSCARClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grillabusquedaDblClick(Sender: TObject);
    procedure ebuscarKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grillabusquedaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    codigoCoseguro:String;
    nombreSeleccionado:String;
    numeroSeleccionado:String;
    coeficiente: string;
    codigosubcuenta: string;
    cod_cliente: string;
    TipoBusqueda:TTipoBusqueda;
    consultas: Array [TTipoBusqueda] of String;
     Ticket:TTicket;
    procedure SetTicket(unTicket:TTicket);

  end;

var
  Fbuscardatos: TFbuscardatos;

implementation

{$R *.dfm}




procedure TFbuscardatos.BBUSCARClick(Sender: TObject);
var
reg: tregistry;
begin

  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('\SOFTWARE\a+\',true);
  dmFacturador.AbrirConexion();
  dmfacturador.qbusqueda.Database:=dmFacturador.getConexion;
  dmfacturador.dataafiliados.DataSet:=dmfacturador.qafiliados;
  dmfacturador.qafiliados.Transaction:=dmFacturador.tranafiliados;
  dmfacturador.qafiliados.Close;
  dmfacturador.qafiliados.SQL.Clear;
  grillabusqueda.DataSource.DataSet:=dmfacturador.dataafiliados.DataSet;
  udmFacturador.dmFacturador.qafiliados.SQL.Text:=consultas[TipoBusqueda];
  if tipobusqueda=AFILIADOS then
  BEGIN
  dmfacturador.qafiliados.ParamByName('codigo').AsString:=codigocoseguro;
  END;
  if tipobusqueda=MEDICOS then
  BEGIN
  dmfacturador.qafiliados.ParamByName('codigo').AsString:=codigocoseguro;
  END;



//dmfacturador.qafiliados.ParamByName('nombre').AsString:='%'+ebuscar.Text+'%';
   if tipobusqueda=SCTACTE then
  BEGIN
  dmfacturador.qafiliados.ParamByName('nombre').AsString:=ticket.codigocc;
  dmfacturador.qafiliados.ParamByName('descripcion').AsString:='%'+ebuscar.Text+'%';
  END;
  if tipobusqueda<>SCTACTE then
  BEGIN
  dmfacturador.qafiliados.ParamByName('nombre').AsString:='%'+ebuscar.Text+'%';
  END;
  dmfacturador.qafiliados.Open;
  grillabusqueda.SetFocus;

end;

procedure TFbuscardatos.ebuscarKeyPress(Sender: TObject; var Key: Char);
begin
if KEY=#13 then
   BBUSCAR.Click;
end;

procedure TFbuscardatos.FormCreate(Sender: TObject);
begin
  consultas[Medicos]:='select des_medico, nro_matricula from osmamedicos where cod_planos=:codigo and des_medico LIKE :nombre ';
  consultas[AFILIADOS]:='select des_afiliado, nro_afiliado from osmaafiliado where cod_planos=:codigo AND des_afiliado like :nombre';
  consultas[ctacte]:='select cod_ctacte, NOM_CTACTE, cod_subcta, cod_cliente from ccmactacte where nom_ctacte LIKE :nombre and cod_Estado=''A''';
  consultas[tarjeta]:='select cod_tarjeta, nom_tarjeta, por_recargo from bamatarjeta where nom_tarjeta like :nombre';
  consultas[banco]:='select cod_banco, nom_banco from bamabanco where nom_BANCO like :nombre';
  consultas[sctacte]:='select cod_ctacte, NOM_CTACTE, cod_subcta, cod_cliente from ccmactacte where cod_ctacte=:nombre and nom_ctacte like :descripcion and cod_Estado=''A''';
  dmfacturador.dataafiliados.DataSet.Close;
  end;

procedure TFbuscardatos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then
begin
  bcancelar.Click;
end;
end;

procedure TFbuscardatos.FormShow(Sender: TObject);
begin
ebuscar.SetFocus;
end;

procedure TFbuscardatos.grillabusquedaDblClick(Sender: TObject);
begin
if tipobusqueda=AFILIADOS then
begin
  if grillabusqueda.DataSource.DataSet.IsEmpty=false then
  begin
  bcancelar.Click;
  nombreSeleccionado:=grillabusqueda.Fields[0].AsString;
  numeroSeleccionado:=grillabusqueda.Fields[1].AsString;
  dmfacturador.qafiliados.Close;

  end;
end;
if tipobusqueda=Medicos then
begin
  if grillabusqueda.DataSource.DataSet.IsEmpty=false then
  begin
  bcancelar.Click;
  nombreSeleccionado:=grillabusqueda.Fields[0].AsString;
  numeroSeleccionado:=grillabusqueda.Fields[1].AsString;
  dmfacturador.qafiliados.Close;

  end;
end;
if tipobusqueda=CTACTE then
begin
if grillabusqueda.DataSource.DataSet.IsEmpty=false then
  begin
  bcancelar.Click;
  nombreSeleccionado:=grillabusqueda.Fields[0].AsString;
  numeroSeleccionado:=grillabusqueda.Fields[1].AsString;
  codigosubcuenta:=grillabusqueda.Fields[2].AsString;
  cod_cliente:=grillabusqueda.Fields[3].AsString;
  dmfacturador.qafiliados.Close;
  end;
end;
if tipobusqueda=SCTACTE then
begin
if grillabusqueda.DataSource.DataSet.IsEmpty=false then
  begin
  bcancelar.Click;
  nombreSeleccionado:=grillabusqueda.Fields[0].AsString;
  numeroSeleccionado:=grillabusqueda.Fields[1].AsString;
  codigosubcuenta:=grillabusqueda.Fields[2].AsString;
  cod_cliente:=grillabusqueda.Fields[3].AsString;
  dmfacturador.qafiliados.Close;
  end;
end;

if tipobusqueda=tarjeta then
begin
if grillabusqueda.DataSource.DataSet.IsEmpty=false then
  begin
  bcancelar.Click;
  nombreSeleccionado:=grillabusqueda.Fields[0].AsString;
  numeroSeleccionado:=grillabusqueda.Fields[1].AsString;
  coeficiente:=grillabusqueda.Fields[2].AsString;
  dmfacturador.qafiliados.Close;
  end;
end;

if tipobusqueda=banco then
begin
if grillabusqueda.DataSource.DataSet.IsEmpty=false then
  begin
  bcancelar.Click;
  nombreSeleccionado:=grillabusqueda.Fields[0].AsString;


  dmfacturador.qafiliados.Close;
  end;
end;




end;

procedure TFbuscardatos.grillabusquedaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
if tipobusqueda=AFILIADOS then
begin
  if grillabusqueda.DataSource.DataSet.IsEmpty=false then
  begin
  bcancelar.Click;
  nombreSeleccionado:=grillabusqueda.Fields[0].AsString;
  numeroSeleccionado:=grillabusqueda.Fields[1].AsString;
  dmfacturador.qafiliados.Close;
  end;
end;
if tipobusqueda=Medicos then
begin
  if grillabusqueda.DataSource.DataSet.IsEmpty=false then
  begin
  bcancelar.Click;
  nombreSeleccionado:=grillabusqueda.Fields[0].AsString;
  numeroSeleccionado:=grillabusqueda.Fields[1].AsString;
  dmfacturador.qafiliados.Close;
  end;
end;
if tipobusqueda=CTACTE then
begin
if grillabusqueda.DataSource.DataSet.IsEmpty=false then
  begin
  bcancelar.Click;
  nombreSeleccionado:=grillabusqueda.Fields[0].AsString;
  numeroSeleccionado:=grillabusqueda.Fields[1].AsString;
  codigosubcuenta:=grillabusqueda.Fields[2].AsString;
  cod_cliente:=grillabusqueda.Fields[3].AsString;
  dmfacturador.qafiliados.Close;
  end;
end;

if tipobusqueda=tarjeta then
begin
if grillabusqueda.DataSource.DataSet.IsEmpty=false then
  begin
  bcancelar.Click;
  nombreSeleccionado:=grillabusqueda.Fields[0].AsString;
  numeroSeleccionado:=grillabusqueda.Fields[1].AsString;
  coeficiente:=grillabusqueda.Fields[2].AsString;
  dmfacturador.qafiliados.Close;
  end;
end;


if tipobusqueda=banco then
begin
if grillabusqueda.DataSource.DataSet.IsEmpty=false then
  begin
  bcancelar.Click;
  nombreSeleccionado:=grillabusqueda.Fields[0].AsString;

  dmfacturador.qafiliados.Close;
  end;
end;




end;
end;

procedure TFbuscardatos.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;

end.

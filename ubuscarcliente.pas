unit ubuscarcliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, udmfacturador, UDTICKET,
  Data.DB, Vcl.ExtCtrls, Vcl.Buttons;

type
    Tfcliente = class(TForm)
    DBGrid1: TDBGrid;
    dscliente: TDataSource;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    ebuscar: TEdit;
    bbuscar: TButton;
    Bcancelar: TBitBtn;
    procedure bbuscarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ebuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
      Ticket:TTicket;
  public

    procedure SetTicket(unTicket:TTicket);
  end;

var
  fcliente: Tfcliente;

implementation

{$R *.dfm}

procedure Tfcliente.bbuscarClick(Sender: TObject);
begin

if radiogroup1.ItemIndex=0 then
begin
dmFacturador.AbrirConexion();
dmfacturador.qcliente.Close;
dmfacturador.qcliente.SQL.Clear;
dmfacturador.qcliente.SQL.Append('select cod_cliente, nom_cliente, pos_iva, nro_cuit, des_direccion, des_telefono, nro_doc  from mkmacliente where nom_cliente LIKE :nombre');
dmfacturador.qcliente.ParamByName('nombre').AsString:='%'+ebuscar.Text+'%';
dmfacturador.qcliente.Open;

      if dmfacturador.qcliente.RecordCount>0 then
      begin
        dbgrid1.SetFocus;
      end;


end;
if radiogroup1.ItemIndex=1 then
begin
dmFacturador.AbrirConexion();
dmfacturador.qcliente.Close;
dmfacturador.qcliente.SQL.Clear;
dmfacturador.qcliente.SQL.Append('select cod_cliente, nom_cliente, pos_iva, nro_cuit, des_direccion, des_telefono, nro_doc  from mkmacliente where nro_cuit=:nombre');
dmfacturador.qcliente.ParamByName('nombre').AsString:=ebuscar.Text;
dmfacturador.qcliente.Open;

    if dmfacturador.qcliente.RecordCount>0 then
    begin
      dbgrid1.SetFocus;
    end;


end;


end;

procedure Tfcliente.DBGrid1DblClick(Sender: TObject);
begin

    TICKET.CUIT:=dbgrid1.Fields[3].AsString;
    TICKET.CONDICIONIVA:=dbgrid1.Fields[2].AsString;
    TICKET.DESCRIPCIONCLIENTE:=dbgrid1.Fields[1].AsString;
    TICKET.codigocliente:=dbgrid1.Fields[0].AsString;
    TICKET.direccion:=dbgrid1.Fields[4].AsString;
    TICKET.telefono:=dbgrid1.Fields[5].AsString;
    ticket.dni:=dbgrid1.Fields[5].AsString;
    DMFACTURADOR.qcliente.Close;
    modalResult := mrClose;
    ticket.TIENEAPLUS := 'S';


end;
procedure Tfcliente.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
    TICKET.CUIT:=dbgrid1.Fields[3].AsString;
    TICKET.CONDICIONIVA:=dbgrid1.Fields[2].AsString;
    TICKET.DESCRIPCIONCLIENTE:=dbgrid1.Fields[1].AsString;
    TICKET.codigocliente:=dbgrid1.Fields[0].AsString;
    TICKET.direccion:=dbgrid1.Fields[4].AsString;
    TICKET.telefono:=dbgrid1.Fields[5].AsString;
    ticket.dni:=dbgrid1.Fields[5].AsString;
     ticket.TIENEAPLUS := 'S';
    DMFACTURADOR.qcliente.Close;
    modalResult := mrClose;
end;
end;

procedure Tfcliente.ebuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
  bbuscar.Click;
end;
end;

procedure Tfcliente.FormShow(Sender: TObject);
begin
ebuscar.SetFocus;
end;

procedure TFCLIENTE.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;

end.

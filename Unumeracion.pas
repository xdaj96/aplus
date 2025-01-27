unit Unumeracion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, udticket;

type
  Tfnumeracion = class(TForm)
    Bcancelar: TBitBtn;
    bagregar: TBitBtn;
    enumeracion: TEdit;
    procedure bagregarClick(Sender: TObject);
    procedure enumeracionKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Ticket:TTicket;
    procedure SetTicket(unTicket:TTicket);

  end;

var
  fnumeracion: Tfnumeracion;

implementation

{$R *.dfm}


procedure Tfnumeracion.bagregarClick(Sender: TObject);
begin
ticket.nrocomprobantenf:=enumeracion.Text;
bcancelar.Click;
end;

procedure Tfnumeracion.enumeracionKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  bagregar.Click;
end;

end;

procedure TFnumeracion.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;
end.

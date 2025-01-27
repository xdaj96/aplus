unit Udatosadicionales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, udticket;

type
  Tfdatos = class(TForm)
    Panel1: TPanel;
    edni: TEdit;
    ecsc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Bcancelar: TBitBtn;
    procedure edniKeyPress(Sender: TObject; var Key: Char);
    procedure ecscKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Ticket:TTicket;
    procedure SetTicket(unTicket:TTicket);
  end;

var
  fdatos: Tfdatos;

implementation

{$R *.dfm}
procedure Tfdatos.ecscKeyPress(Sender: TObject; var Key: Char);
begin
if ((Key=#13)) then
begin

ticket.codigo_seguridad:=ecsc.Text;
bcancelar.Click;
end;
end;

procedure Tfdatos.edniKeyPress(Sender: TObject; var Key: Char);
begin
if ((Key=#13)) then
begin

ticket.documento:=edni.Text;
ecsc.SetFocus;
end;
end;

procedure tFdatos.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;
end.

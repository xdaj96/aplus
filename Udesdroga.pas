unit Udesdroga;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, udticket, udmfacturador;

type
  Tfdescripciondroga = class(TForm)
    edesdroga: TEdit;
    Bcancelar: TBitBtn;
    bagregar: TBitBtn;
    procedure bagregarClick(Sender: TObject);
    procedure edesdrogaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
       Ticket:TTicket;
    procedure SetTicket(unTicket:TTicket);
  end;

var
  fdescripciondroga: Tfdescripciondroga;

implementation

{$R *.dfm}
procedure Tfdescripciondroga.bagregarClick(Sender: TObject);
begin
ticket.desdroga:='';


ticket.desdroga:= StringReplace(edesdroga.Text, ' ', '%', [rfReplaceAll]);

bcancelar.Click;

end;

procedure Tfdescripciondroga.edesdrogaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  bagregar.Click;
end;
end;

procedure TFdescripciondroga.SetTicket(unTicket: TTicket);
begin

    ticket:=unTicket;

end;

end.

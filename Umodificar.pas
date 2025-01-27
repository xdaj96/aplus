unit Umodificar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, udticket;

type
  TFmodificacion = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
     Ticket:TTicket;
     procedure SetTicket(unTicket:TTicket);
  end;

var
  Fmodificacion: TFmodificacion;

implementation
uses
facturador;

{$R *.dfm}
procedure TFmodificacion.Button1Click(Sender: TObject);
begin
if strtoint(edit1.Text)=strtoint(ticket.clavemodificar) then
    begin
     ticket.claveok:='OK';
     modalresult:=mrclose;
    end;

if strtoint(edit1.Text)<>strtoint(ticket.clavemodificar) then
    begin
     ticket.claveok:='NO';
     modalresult:=mrclose;
    end;
end;



procedure TFmodificacion.Button2Click(Sender: TObject);
begin
modalresult:=mrclose;
ticket.claveok:='NO';
end;

procedure TFmodificacion.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
  button1.Click;
  end;
end;

procedure TFmodificacion.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;

end.

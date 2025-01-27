unit Uvale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, udticket, Vcl.Buttons;

type
  Tfvale = class(TForm)
    ecantidad: TEdit;
    Label1: TLabel;
    Baceptar: TBitBtn;
    procedure ecantidadKeyPress(Sender: TObject; var Key: Char);
    procedure BaceptarClick(Sender: TObject);

  private

  public
   Ticket:TTicket;


   procedure SetTicket(unTicket:TTicket);
  end;

var
  fvale: Tfvale;

implementation

{$R *.dfm}

procedure Tfvale.BaceptarClick(Sender: TObject);
begin
if ecantidad.Text<>'' then
begin
  if strtoint(ecantidad.Text)<=strtoint(ticket.valecantidadmax) then
  begin
  TICKET.valecantidad:=ecantidad.Text;
  modalresult:=mrclose;
  end;
  if (strtoint(ecantidad.Text)>strtoint(ticket.valecantidadmax)) then
  begin
  Showmessage('Vale mayor que la cantidad a vender');

  ecantidad.Text:='';
  ecantidad.SetFocus;
  end;
end;
end;

procedure Tfvale.ecantidadKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
    begin
      Baceptar.Click;

    end;
end;
procedure tfvale.setTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;


end.

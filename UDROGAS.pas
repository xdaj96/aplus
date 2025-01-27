unit UDROGAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, udticket, udmfacturador;

type
  TFDROGAS = class(TForm)
    Bcancelar: TBitBtn;
    gdroga: TDBGrid;
    bagregar: TBitBtn;
    procedure bagregarClick(Sender: TObject);
    procedure gdrogaDblClick(Sender: TObject);
    procedure gdrogaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Ticket:TTicket;
    procedure SetTicket(unTicket:TTicket);
  end;

var
  FDROGAS: TFDROGAS;

implementation

{$R *.dfm}

{ TFDROGAS }

procedure TFDROGAS.bagregarClick(Sender: TObject);
begin
ticket.monodroga:=gdroga.DataSource.DataSet.FieldByName('des_droga').AsString;
bcancelar.Click;
end;

procedure TFDROGAS.gdrogaDblClick(Sender: TObject);
begin
bagregar.Click;
end;

procedure TFDROGAS.gdrogaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  bagregar.Click;
end;
end;

procedure TFDROGAS.SetTicket(unTicket: TTicket);
begin

    ticket:=unTicket;

end;

end.

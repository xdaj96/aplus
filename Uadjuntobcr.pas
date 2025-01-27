unit Uadjuntobcr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, StdCtrls, Vcl.Buttons,udticket,ShellAPI;

type
  TMemo = class(StdCtrls.TMemo)
  protected
    procedure WMDropFiles(var Message: TWMDropFiles); message WM_DROPFILES;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;

  end;
  Tfadjuntobcr = class(TForm)
    odialog: TOpenDialog;
    Bcancelar: TBitBtn;
    binsertar: TBitBtn;
    bbuscar: TBitBtn;
    ListBox1: TListBox;
    procedure bbuscarClick(Sender: TObject);
    procedure binsertarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Ticket:TTicket;
    var

    itemscaja: string;
    procedure SetTicket(unTicket:TTicket);
  end;

var
  fadjuntobcr: Tfadjuntobcr;

implementation

{$R *.dfm}

procedure Tfadjuntobcr.bbuscarClick(Sender: TObject);
var
archivo: string;
begin
odialog.Execute();
if odialog.FileName<>'' then
begin
listbox1.Clear;
archivo:=odialog.FileName;
listbox1.items.Add(archivo);
end;

end;

procedure Tfadjuntobcr.binsertarClick(Sender: TObject);
var

i: integer;
begin
if listbox1.items.Count>0 then
begin
  itemscaja:='';
  For I := 0 To listbox1.items.Count -1 DO
   begin
   if itemscaja='' then
   begin
     itemscaja:=(listbox1.items[i]);
   end
   else
   begin
     itemscaja:=itemscaja+';'+(listbox1.items[i]);
   end;
   end;


end;

bcancelar.Click;
end;
procedure TFadjuntobcr.SetTicket(unTicket: TTicket);
begin
ticket:=unTicket;
end;
procedure TMemo.WMDropFiles(var Message: TWMDropFiles);
//var
//  c: integer;
//  fn: array[0..MAX_PATH-1] of char;
  var c: integer; fn: array[0..MAX_PATH-1] of char; i: Integer;
begin

c := DragQueryFile(Message.Drop, $FFFFFFFF, fn, MAX_PATH);


Clear;

for i := 0 to c - 1 do
begin
  if DragQueryFile(Message.Drop, i, fn, MAX_PATH) = 0 then Exit;
  Lines.Add(fn);
end;

end;
procedure TMemo.CreateWnd;
begin
  inherited;
  DragAcceptFiles(Handle, true);
end;

procedure TMemo.DestroyWnd;
begin
  DragAcceptFiles(Handle, false);
  inherited;
end;

end.

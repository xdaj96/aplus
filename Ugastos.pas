unit Ugastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, Vcl.Buttons,udticket;

type
  TMemo = class(StdCtrls.TMemo)
  protected
    procedure WMDropFiles(var Message: TWMDropFiles); message WM_DROPFILES;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;

  end;

  TFgastos = class(TForm)
    Bcancelar: TBitBtn;
    BitBtn2: TBitBtn;
    bbuscar: TBitBtn;
    binsertar: TBitBtn;
    odialog: TOpenDialog;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure bbuscarClick(Sender: TObject);
    procedure binsertarClick(Sender: TObject);
  private
    { Private declarations }
   // Ticket:TTicket;
  public
    { Public declarations }
    Ticket:TTicket;
    var

    itemscaja: string;
    procedure SetTicket(unTicket:TTicket);
  end;

var
  fgastos: TFgastos;
//  itemscaja: TStringlist;

implementation

{$R *.dfm}

procedure TFgastos.bbuscarClick(Sender: TObject);
begin
odialog.Execute();
if odialog.FileName<>'' then
begin
listbox1.items.Add(odialog.FileName);
end;

end;

procedure TFgastos.binsertarClick(Sender: TObject);
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

procedure Tfgastos.FormCreate(Sender: TObject);
begin
inherited;
DragAcceptFiles(Handle, true);

end;

procedure TFgastos.SetTicket(unTicket: TTicket);
begin
ticket:=unTicket;
end;

{ TMemo }

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

procedure TMemo.WMDropFiles(var Message: TWMDropFiles);
//var
//  c: integer;
//  fn: array[0..MAX_PATH-1] of char;
  var c: integer; fn: array[0..MAX_PATH-1] of char; i: Integer;
begin

c := DragQueryFile(Message.Drop, $FFFFFFFF, fn, MAX_PATH);


//Clear;

for i := 0 to c - 1 do
begin
  if DragQueryFile(Message.Drop, i, fn, MAX_PATH) = 0 then Exit;
  Lines.Add(fn);
end;

end;


end.

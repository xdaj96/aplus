unit Uprogreso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Imaging.GIFImg,
  Vcl.ExtCtrls, IdBaseComponent, IdThreadComponent, Vcl.StdCtrls;

type
  Tfprogreso = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;

    procedure FormShow(Sender: TObject);




  private
    { Private declarations }
  public
   {procedure iniciargif;}
  end;




var
  fprogreso: Tfprogreso ;


implementation

{$R *.dfm}



{procedure tfprogreso.iniciargif;
begin
Sleep(20);

 TThread.Queue(nil, procedure begin

        showmessage('CORRIENDO SEGUNDO HILO');
      end);


end;  }


procedure Tfprogreso.FormShow(Sender: TObject);
begin

 // tthread.CreateAnonymousThread(iniciargif).Start;



end;

end.

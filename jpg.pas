unit jpg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TFimagen = class(TForm)
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fimagen: TFimagen;

implementation

{$R *.dfm}

end.

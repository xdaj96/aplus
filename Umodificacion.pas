unit Umodificacion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, udmfacturador, registry;

type
  TFmodifi = class(TForm)
    Panel1: TPanel;
    bbuscar: TBitBtn;
    Label6: TLabel;
    Shape1: TShape;
    fecha: TDateTimePicker;
    procedure bbuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmodifi: TFmodifi;

implementation

{$R *.dfm}

procedure TFmodifi.bbuscarClick(Sender: TObject);
var
 reg: tregistry;
begin
     Reg := TRegistry.Create;
     Reg.RootKey := HKEY_CURRENT_USER;
     Reg.OpenKey(regKey,true);

     dmFacturador.AbrirConexion();
     dmfacturador.qmodif.Close;
     dmfacturador.qmodif.ParamByName('fecha').AsDate:=fecha.Date;
     dmfacturador.qmodif.Open;

     dmfacturador.reportemodif.LoadFromFile(Reg.ReadString('Reportes')+'modificacion.FR3');
     dmfacturador.reportemodif.ShowReport(false);



end;

procedure TFmodifi.FormShow(Sender: TObject);
begin
fecha.DateTime:=now;
end;

end.

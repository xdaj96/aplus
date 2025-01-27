unit UCOMPROB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, UDMFACTURADOR,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFTIPCOMPROB = class(TForm)
    gtipcomprobante: TDBGrid;
    Bcancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure gtipcomprobanteDblClick(Sender: TObject);
    procedure gtipcomprobanteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    codcomprob:String;
  end;

var
  FTIPCOMPROB: TFTIPCOMPROB;

implementation

{$R *.dfm}

procedure TFTIPCOMPROB.FormShow(Sender: TObject);
begin
dmFacturador.AbrirConexion();
 if dmfacturador.tpanel1.InTransaction then
 begin
   dmfacturador.tpanel1.Rollback;
 end;





dmfacturador.qcomprobantenf.Close;
dmfacturador.qcomprobantenf.SQL.Clear;
dmfacturador.qcomprobantenf.SQL.Append('select TIP_COMPROBANTE, TIP_IMPRE, des_comp from vtmatipcomprob where MAR_TIPOPROCESO=''T''');
dmfacturador.qcomprobantenf.Open;

end;

procedure TFTIPCOMPROB.gtipcomprobanteDblClick(Sender: TObject);
begin
bcancelar.Click;
codcomprob:= gtipcomprobante.Fields[0].AsString;
end;

procedure TFTIPCOMPROB.gtipcomprobanteKeyPress(Sender: TObject; var Key: Char);
begin
if KEY=#13 then
begin
gtipcomprobantedblclick(self);

end;
end;

end.

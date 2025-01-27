unit buscaros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Registry, Data.DB, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, UDMFacturador;

  Const
  RegKey ='Software\Autofarma\APlus\';

type
  TFBUSCAROS = class(TForm)
    gbuscaros: TDBGrid;
    EBUSCAR: TEdit;
    Button1: TButton;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    Bcancelar: TBitBtn;

    procedure Button1Click(Sender: TObject);
    procedure gbuscarosDblClick(Sender: TObject);
    procedure EBUSCARKeyPress(Sender: TObject; var Key: Char);
    procedure gbuscarosKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    codObraSocial:String;
  end;

var
  FBUSCAROS: TFBUSCAROS;

implementation

{$R *.dfm}

uses login, facturador;

procedure TFBUSCAROS.Button1Click(Sender: TObject);

begin

  dmFacturador.AbrirConexion();
  IBTransaction1.AddDatabase(dmFacturador.getConexion) ;
  IBQuery1.Database:=dmFacturador.getConexion();
  IBQuery1.Database.Open;
  IBQUERY1.Close;
  IBQUERY1.SQL.Clear;
  IBQUERY1.SQL.Add('select NOM_PLANOS,COD_PLANOS from osmaplanesos where nom_planos LIKE :nombre and MAR_OBRASOCIAL=''O''  and mar_utilizados=''S''');
  IBQUERY1.ParamByName('nombre').AsString:='%'+EBUSCAR.Text+'%';
  IBQUERY1.Open;
  gbuscaros.SetFocus;


end;




procedure TFBUSCAROS.EBUSCARKeyPress(Sender: TObject; var Key: Char);
begin
if KEY=#13 then
BEGIN
  BUTTON1.Click;
END;

end;

procedure TFBUSCAROS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then
  begin
  bcancelar.Click;
  end;
end;

procedure TFBUSCAROS.FormShow(Sender: TObject);
begin
ebuscar.SetFocus;
end;

procedure TFBUSCAROS.gbuscarosDblClick(Sender: TObject);
begin

bcancelar.Click;
codObraSocial:= gbuscaros.Fields[1].AsString;

end;

procedure TFBUSCAROS.gbuscarosKeyPress(Sender: TObject; var Key: Char);
begin
if KEY=#13 then
begin
gbuscarosdblclick(self);

end;

End;

end.

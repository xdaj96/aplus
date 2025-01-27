unit ubuscarco1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBDatabase, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, registry,
  Vcl.Buttons, UDMFacturador;

type
  Tfbuscarco1 = class(TForm)
    DBGrid1: TDBGrid;
    ebuscar: TEdit;
    BBUSCAR: TButton;
    DataSource1: TDataSource;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    Bcancelar: TBitBtn;
    procedure BBUSCARClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ebuscarKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

  public
    codObraSocial:String;
    { Public declarations }
  end;

var
  fbuscarco1: Tfbuscarco1;

implementation

{$R *.dfm}

uses
login,facturador;

procedure Tfbuscarco1.BBUSCARClick(Sender: TObject);

begin

  dmFacturador.AbrirConexion();
  IBTransaction1.AddDatabase(dmFacturador.getConexion) ;
  IBQuery1.Database:=dmFacturador.getConexion();
  IBQuery1.Database.Open;
  IBQUERY1.Close;
  IBQUERY1.SQL.Clear;
  IBQUERY1.SQL.Add('select NOM_PLANOS,COD_PLANOS from osmaplanesos where nom_planos LIKE :nombre and MAR_OBRASOCIAL=''C''  and mar_utilizados=''S''');
  IBQUERY1.ParamByName('nombre').AsString:='%'+EBUSCAR.Text+'%';
  IBQUERY1.Open;
  dbgrid1.SetFocus;


end;

procedure Tfbuscarco1.DBGrid1DblClick(Sender: TObject);

begin
//codigoco1:='';
//codigoco1:=dbgrid1.Fields[1].AsString;
FFACTURADOR.Eco1.Text:='';
//FFACTURADOR.Eco1.Text:=CODIGOCO1;
bcancelar.Click;
codObraSocial:=dbgrid1.Fields[1].AsString;

end;

procedure Tfbuscarco1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if KEY=#13 then
BEGIN
 DBGrid1DblClick(self);
END;

end;

procedure Tfbuscarco1.ebuscarKeyPress(Sender: TObject; var Key: Char);
begin
if KEY=#13 then
BEGIN
  bbuscar.Click;
END;
end;

procedure Tfbuscarco1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then
  begin
  bcancelar.Click;
  end;
end;

procedure Tfbuscarco1.FormShow(Sender: TObject);
begin
ebuscar.SetFocus;
end;

end.

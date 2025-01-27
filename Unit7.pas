unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Registry;

type
  TFBUSCAROS = class(TForm)
    gbuscaros: TDBGrid;
    EBUSCAR: TEdit;
    Button1: TButton;
    IBQuery1: TIBQuery;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBUSCAROS: TFBUSCAROS;

implementation

{$R *.dfm}

procedure TFBUSCAROS.Button1Click(Sender: TObject);
var
 reg: tregistry;
begin
   Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('\SOFTWARE\a+\',true);
  ibdatabase1.DatabaseName:=reg.ReadString('rutabasecfg');
  ibdatabase1.Params.Values['RoleName']:='RoleName';
  ibdatabase1.Params.Values['User_Name']:='SYSDBA';
  ibdatabase1.Params.Values['Password']:='nmpnet';
  ibdatabase1.LoginPrompt:=false;
  IBQUERY1.Close;
  IBQUERY1.SQL.Add('select NOM_PLANOS,COD_PLANOS from osmaplanesos where nom_planos LIKE :nombre and MAR_OBRASOCIAL=''O''  and mar_activa=''S''');
  IBQUERY1.ParamByName('NOMBRE').AsString:=EBUSCAR.Text;
  IBQUERY1.Open;
end;

end.

unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Data.DBXFirebird, Data.DB, Data.SqlExpr, registry, Data.FMTBcd,
  IBX.IBDatabase, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFOS = class(TForm)
    ebuscaros: TEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    QBUSCAROS: TIBQuery;
    BASEOS: TIBDatabase;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    bcancelar: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bcancelarClick(Sender: TObject);

  private
      function  conexion2 (accbot:boolean):boolean;
  public
     VAR

    { Public declarations }
  end;

var
  FOS: TFOS;

implementation

{$R *.dfm}

uses Unit1,UNIT5;




procedure TFOS.bcancelarClick(Sender: TObject);
begin
FOS.CloseModal;
end;

procedure TFOS.BitBtn1Click(Sender: TObject);

var
mar_obrasocial: string;

begin

 conexion2 (true);
 qbuscaros.Close;
 qbuscaros.SQL.Clear;
 qbuscaros.SQL.Append('select NOM_PLANOS,COD_PLANOS from osmaplanesos where nom_planos LIKE :nombre and MAR_OBRASOCIAL=:MAR_OBRASOCIAL   and mar_activa=''S''');
 qbuscaros.ParamByName('nombre').AsString:='%'+ebuscaros.text+'%';
 qbuscaros.ParamByName('MAR_OBRASOCIAL').AsString:=TIPOOS;
 qbuscaros.Open;
 

end;

function  tfos.conexion2 (accbot:boolean):boolean;
var
 reg: tregistry;

begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('\SOFTWARE\a+\',true);
  baseos.Connected:=false;
  baseos.DatabaseName:=reg.ReadString('rutabase');
  baseos.Params.Values['User_Name']:='SYSDBA';
  baseos.Params.Values['Password']:='nmpnet';
  baseos.LoginPrompt:=false;
  baseos.Connected:=true;

end;

procedure TFOS.DBGrid1DblClick(Sender: TObject);

begin
CODIGOOS:='';
CODIGOOS:=DBGRID1.Fields[1].AsString;
FFACTURADOR.EOS.Text:=CODIGOOS;
BCANCELAR.Click;

end;

end.

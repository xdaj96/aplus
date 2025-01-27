unit UDMLibroRecetas;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, IBX.IBDatabase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TDMLibroRecetas = class(TDataModule)
    idhttp: TIdHTTP;
    QLibroRecetas: TIBQuery;
    DSLibroRecetas: TDataSource;
    BASE: TIBDatabase;
    IBTransaction1: TIBTransaction;
    CDSLibroRecetas: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLibroRecetas: TDMLibroRecetas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

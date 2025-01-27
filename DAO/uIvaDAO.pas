unit uIvaDAO;

interface

uses
  SysUtils, Classes, DB, DBClient, SqlExpr,udmFacturador,udTicket,IBX.IBQUERY;

type
  TTablaIVADAO = class
  private
    FQuery: TIBquery;
  public
    constructor Create;
    destructor Destroy; override;
    procedure CargarIVAPorCodigo(var TICKET: TTicket);
  end;

implementation

{ TTablaIVADAO }

constructor TTablaIVADAO.Create;
begin
   Fquery:= dmFacturador.qtablaiva;
  // Configura la conexión del FQuery, por ejemplo:
  // FQuery.SQLConnection := TuConexion;
end;

destructor TTablaIVADAO.Destroy;
begin
  inherited;
end;

procedure TTablaIVADAO.CargarIVAPorCodigo(var TICKET: TTicket);
begin



  Fquery.Close;
  FQuery.SQL.Text := 'SELECT cod_iva, por_iva FROM prmaiva';
  FQuery.Open;
  FQuery.First;
  while not FQuery.Eof do
  begin
    case FQuery.FieldByName('cod_iva').AsString[1] of
      'A': TICKET.IVAA := FQuery.FieldByName('por_iva').AsFloat;
      'B': TICKET.IVAB := FQuery.FieldByName('por_iva').AsFloat;
      'C': TICKET.IVAC := FQuery.FieldByName('por_iva').AsFloat;
      'D': TICKET.IVAD := FQuery.FieldByName('por_iva').AsFloat;
      'E': TICKET.IVAE := FQuery.FieldByName('por_iva').AsFloat;
      'F': TICKET.IVAF := FQuery.FieldByName('por_iva').AsFloat;
      's': TICKET.IVAs := FQuery.FieldByName('por_iva').AsFloat;
    end;
    FQuery.Next;
  end;
end;

end.


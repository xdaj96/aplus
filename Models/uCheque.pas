unit uCheque;

interface

type
  TCheque = class
  private
    FSucursal: string;
    FTipoComprobante: string;
    FNroComprobante: string;
    FCodigoBanco: string;
    FNroCheque: string;
    FImporte: Double;

  public
    property Sucursal: string read FSucursal write FSucursal;
    property TipoComprobante: string read FTipoComprobante write FTipoComprobante;
    property NroComprobante: string read FNroComprobante write FNroComprobante;
    property CodigoBanco: string read FCodigoBanco write FCodigoBanco;
    property NroCheque: string read FNroCheque write FNroCheque;
    property Importe: Double read FImporte write FImporte;
  end;

implementation

end.

unit uRanckingProd;

interface
  type TRanckingProd = record
    Sucursal: string;
    CodAlfabeta: Integer;
    FechaHora: TDateTime;
    StockInicial: Integer;
    Cantidad: Integer;
    CantidadCompraDiaria: Integer;
    CantidadVentaDiaria: Integer;
    CantidadMovDia: Integer;
    ImporteVenta: Double;
    ImporteNeto: Double;
    ImporteCostoVenta: Double;
    ImporteCostoCompra: Double;
    ImporteRetencionOSD: Double;
    ImporteRetencionOSM: Double;
    ImporteOSD: Double;
    CantidadUnidOSD: Double;
    ImporteCobroEfectivo: Double;
    ImporteCobroCheque: Double;
    ImporteCobroTarjeta: Double;
    ImporteRetencionTarjeta: Double;
    ImporteCtaCte: Double;
    ImporteDescCtaCte: Double;
    ImporteGentileza: Double;
    ImporteDscAfilOSD: Double;
    ImporteDscAfilOSM: Double;

  end;
implementation

end.

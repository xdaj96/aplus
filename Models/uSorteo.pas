unit uSorteo;

interface
    uses   System.Classes, System.Generics.Collections,uCliente;
 type
  TRenglonSorteo = class(TObject)
  private
    FCodRubro: string;
    FCodLaboratorio: string;
    FSucursalId: string;
    FRepeticion: string;
    FCodCategoria: string;
    FCodAlfabeta: string;
    FCantidadTickets: string;
    FCantidadPremios: string;
    FDesCategoria:string;
  public
    function getTipoSorteo:string;
    property CodRubro: string read FCodRubro write FCodRubro;
    property CodLaboratorio: string read FCodLaboratorio write FCodLaboratorio;
    property SucursalId: string read FSucursalId write FSucursalId;
    property Repeticion: string read FRepeticion write FRepeticion;
    property CodCategoria: string read FCodCategoria write FCodCategoria;
    property DesCategoria: string read FDesCategoria write FDesCategoria;
    property CodAlfabeta: string read FCodAlfabeta write FCodAlfabeta;
    property CantidadTickets: string read FCantidadTickets write FCantidadTickets;
    property CantidadPremios: string read FCantidadPremios write FCantidadPremios;

  end;

  TSorteo = class(TObject)
  private
    FSucursalId: string;
    FNombre: string;
    FSorteoEsquemaId: string;
    FCupon: string;
    FFechaDesde: TDate;
    FFechaHasta: TDate;
    FTotalVenta: string;
    FDetalle: TList<TRenglonSorteo>;
    FCliente:TCliente;
  public
    constructor Create;

    property SucursalId: string read FSucursalId write FSucursalId;
    property Nombre: string read FNombre write FNombre;
    property SorteoEsquemaId: string read FSorteoEsquemaId write FSorteoEsquemaId;
    property Cupon: string read FCupon write FCupon;
    property FechaDesde: TDate read FFechaDesde write FFechaDesde;
    property FechaHasta: TDate read FFechaHasta write FFechaHasta;
    property TotalVenta: string read FTotalVenta write FTotalVenta;
    property Detalle: TList<TRenglonSorteo> read FDetalle write FDetalle;
    property cliente: TCliente read FCliente write FCliente;

  end;

implementation

  constructor TSorteo.Create;
  begin
    FDetalle:= TList<TRenglonSorteo>.Create();

  end;

  function TRenglonSorteo.getTipoSorteo:string;
  var
    tipo:string;
  begin

    if((CantidadTickets<>'') and (CodRubro='') and (CodLaboratorio='')) then
    begin
       tipo:='T' {ESTO VA POR TICKETS}
    end;

    if((CantidadTickets<>'') and (CodRubro<>'') and (CodLaboratorio='')) then
    begin
       tipo:='TR' {ESTO VA POR TICKETS Y RUBRO}
    end;

     if((CantidadTickets<>'') and (CodRubro='') and (CodLaboratorio<>'')) then
    begin
       tipo:='TL' {ESTO VA POR TICKETS Y LABORATORIO}
    end;

    if((CantidadTickets<>'') and (CodRubro<>'') and (CodLaboratorio='')) then
    begin
       tipo:='TR' {ESTO VA POR TICKETS Y RUBRO}
    end;

    Result:= tipo;
  end;
end.

unit uMovObraSocial;

interface
   type
    TMovObraSocial = record
    SUCURSAL: string;
    TIPO_COMPROBANTE: string;
    nro_comprobante: string;
    COD_PLANOS: string;
    nom_obrasocial: string;
    fec_comprobante: TDateTime;
    fec_receta: TDate;
    imp_ticket: Double;
    imp_afectado: Double;
    imp_cargoos: Double;
    nro_afiliado: string;
    nom_afiliado: string;
    nro_matricula: string;
    nro_receta: string;
    tip_tratamiento: string;
  end;
implementation

end.

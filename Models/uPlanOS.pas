unit uPlanOS;

interface
   Type
    TPlanos = class
      private
        FCodigoPlan:string;
        FNomPlan:string;
      public
        property cod_planos:string read FCodigoPlan write FCodigoPlan;
        property nombrePlan:string read FNomPlan write FNomPlan;
    end;
implementation

end.

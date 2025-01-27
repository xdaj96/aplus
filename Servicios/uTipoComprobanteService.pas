unit uTipoComprobanteService;

interface
  uses uUtils,SysUtils,math;

  type TTipoComprobanteSerivce = class
    public
    function esComprobanteAutorizado(tipo_comprob:string):boolean;



  end;
implementation

    function TTipoComprobanteSerivce.esComprobanteAutorizado(tipo_comprob:string):boolean;
    const arr_comprobantes:array of string = ['AJN', 'AJP', 'RRR', 'BMF', 'BOV', 'ROB', 'ROT', 'BUI', 'VEN', 'BFR'];
    var
      existe:boolean;
      i:integer;
    begin
      existe:=False;

      for i :=0 to High(arr_comprobantes) do
      begin
        if tipo_comprob = arr_comprobantes[i] then
        begin
            existe:= True;
            break;
        end;
      end;
      Result:= Existe;

    end;




end.

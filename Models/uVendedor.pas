unit uVendedor;

interface
 type TVendedor = class
   private
      FcodVendedor:string;
      FNombreVendedor:string;
   public
      property nombre:string read FNombreVendedor write FNombreVendedor;
      property codigo:string read FcodVendedor write FcodVendedor;
 end;
implementation

end.

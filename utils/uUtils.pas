unit uUtils;
interface

  uses sysutils,math;

  type TFechaUtils = class
    public
    class function EstaFechaDentroDelRango(fecha_desde:string; fecha_hasta: string): Boolean;

  end;

  type TUtils = class
    public
    class function LeftPad(S: string; Ch: Char; Len: Integer): string;
    class function RightPad(S: string; Ch: Char; Len: Integer): string;
    class function CadLongitudFija(cadena : string; longitud : Integer; posicionIzquierda : boolean; valorRelleno : string) : string;
    class function esCampoVacio(cadena:string):boolean;
    class function FormatearImporte(const importe: Double; const coeficiente: Double):string;
    class function FormatearImporteMonetario(const importe: string; const coeficiente: Double):string;
    class function esNumero(cadena:string):boolean;
    class function FillSpaces(cVar:String;nLen:Integer):String;
    class function obtenerFechaValidacion:String;
  end;



implementation

class function TUtils.FillSpaces(cVar:String;nLen:Integer):String;
 begin
 Result:=StringOfChar('0',nLen - Length(cVar))+cVar;
 end;

class function TUtils.LeftPad(S: string; Ch: Char; Len: Integer): string;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := S + StringOfChar(Ch, RestLen);
end;

class function TUtils.RightPad(S: string; Ch: Char; Len: Integer): string;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;

class function TUtils.cadLongitudFija (cadena : string; longitud : Integer; posicionIzquierda : boolean; valorRelleno : string) : string;
var
  i: integer;
begin
  if length(cadena) > longitud then
    cadena := copy(cadena, 1, longitud)
  else
  begin
    for i := 1 to longitud - Length(cadena) do
      if posicionIzquierda then
        cadena := valorRelleno + cadena
      else
        cadena := cadena + valorRelleno;
  end;
  Result := cadena;
end;

 class function TUtils.esCampoVacio(cadena:string):boolean;

 begin
  Result:= Length(trim(cadena)) <1;
 end;

 class function TUtils.FormatearImporte(const importe: Double; const coeficiente: Double): string;
 begin
    Result := Format('$ %.2f', [RoundTo(importe + coeficiente, -2)]);
 end;

 class function TUtils.FormatearImporteMonetario(const importe: string; const coeficiente: Double): string;
begin
  // Convierte el valor de efectivo eliminando el símbolo '$' y luego realiza la operación
  Result := Format('$ %.2f', [RoundTo(StrToFloat(StringReplace(importe, '$ ', '', [rfReplaceAll, rfIgnoreCase])) + coeficiente, -2)]);
end;




    {
      Descripción: Esta función verifica si una fecha está dentro de un rango específico.
      @param fecha_desde: La fecha de inicio del rango en formato string.
      @param fecha_hasta: La fecha de fin del rango en formato string.
      @return True si la fecha actual está dentro del rango, False en caso contrario.
    }
    class function TFechaUtils.EstaFechaDentroDelRango(fecha_desde:string; fecha_hasta: string): Boolean;
    begin
      Result := (Now > StrToDateTime(fecha_desde)) and (Now < StrToDateTime(fecha_hasta));
    end;


    class function TUtils.esNumero(cadena: string):boolean;
    var
    numero:double;
    begin
      try
       numero:= StrToFloat(cadena);
       Result:= True
      except
       on E:exception do
       begin
         Result:= False
       end;
      end;
    end;

    class function TUtils.obtenerFechaValidacion:string;
    var
     fecha:TDate;
    begin

      // Suponiendo que tienes un valor de tipo TDateTime
      Fecha := Now;  // Usamos la fecha y hora actual como ejemplo

  // Convertir TDateTime a formato YYYYMMDD
      Result:= FormatDateTime('yyyymmdd', Fecha);
    end;


end.

unit uImpresorEtiquetas;

interface
    uses vcl.printers,Dialogs,Registry,Windows,vcl.graphics,sysUtils;
   type TImpresorEtiqueta = class
     public
      reg: tregistry;

       FPrinter:TPrinter;
       constructor Create;
       procedure initImpresora;
       function getPrinter:TPrinter;
       procedure imprimirCuponDescuento(cupon:string);
       procedure setearImpresora;
       procedure imprimirCuponPromo(nro_ticket:string;nomVendedor:string;nomParticipante:string;dni:string;tel:string);
       function GetImpresora(Impre: String;objPrinter:TPrinter): integer;
   end;
implementation


  constructor TImpresorEtiqueta.Create;
  begin
       initImpresora;
  end;

  procedure TImpresorEtiqueta.setearImpresora;
  var
  numImpresora:integer;
  begin
        numImpresora:=getImpresora(reg.ReadString('IMPRESORA'),Printer);
    FPrinter.PrinterIndex:=numImpresora;
    Printer.PrinterIndex:= numImpresora;
  end;



  procedure TImpresorEtiqueta.imprimirCuponDescuento(cupon:string);
  begin
      with FPrinter do
    begin

    BeginDoc;
    Canvas.Brush.Style := bsclear;
    canvas.Font.Height:=30;
    //--------modificado para jose luis 58mm en canvas.textout lleva 200,10
    Canvas.TextOut(50,10,'CUPON DE DESCUENTO');
    Canvas.TextOut(50,20, '_______________________________________');
    Canvas.Brush.Color := clBlack;
    Canvas.Brush.Style := bsclear;
    canvas.Font.Height:=30;

    Canvas.TextOut(50,50,'VALIDO X '+cupon+'%');



    {Canvas.TextOut(50,80,'En articulos de perfumeria');
    Canvas.TextOut(50,120, '_______________________________________');
    Canvas.Brush.Color := clBlack;
    Canvas.Brush.Style := bsclear;
    canvas.Font.Height:=50;
    Canvas.TextOut(50,230,cupon);
    canvas.Font.Height:=30;
    Canvas.TextOut(50,350, '______________________________________');
    canvas.Font.Height:=30;
    Canvas.TextOut(50,400,'autofarma centro de bienestar');
    Canvas.TextOut(50,450,'Fecha de emision: '+ datetostr(now));
    }


    enddoc;
    end;
  end;


  procedure TImpresorEtiqueta.imprimirCuponPromo(nro_ticket:string;nomVendedor:string;nomParticipante:string;dni:string;tel:string);
  begin
      with FPrinter do
    begin


    BeginDoc;
    Canvas.Brush.Style := bsclear;
    canvas.Font.Height:=30;
    //--------modificado para jose luis 58mm en canvas.textout lleva 200,10
    Canvas.TextOut(50,10,'CUPON VALIDO PARA PARTICIPAR EN PROMO');
    Canvas.TextOut(50,20, '_______________________________________');
    Canvas.Brush.Color := clBlack;
    Canvas.Brush.Style := bsclear;
    canvas.Font.Height:=30;

    Canvas.Brush.Color := clBlack;
    Canvas.Brush.Style := bsclear;
    canvas.Font.Height:=40;

    Canvas.TextOut(50,100,'VENDEDOR:');
    Canvas.TextOut(50,140,nomVendedor);

    Canvas.TextOut(50,200,'PARTICIPANTE:');
    Canvas.TextOut(50,240,nomParticipante);
    Canvas.TextOut(50,320,'DNI: '+dni);
    Canvas.TextOut(50,380,'TELEFONO: '+tel);
    Canvas.TextOut(50,440,'N° DE TICKET:'+nro_ticket);
    canvas.Font.Height:=30;
    Canvas.TextOut(50,500, '______________________________________');
    canvas.Font.Height:=30;
    Canvas.TextOut(50,515,'autofarma centro de bienestar');
    Canvas.TextOut(50,545,'Fecha de emision: '+DateToStr(now));



    enddoc;
    end;
  end;



  procedure TImpresorEtiqueta.initImpresora;
  var
      RegKey:string;
  begin
      RegKey :='Software\Autofarma\APlus\';
      Reg := TRegistry.Create;
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey(regKey,true);
      FPrinter:= getPrinter;
      setearImpresora;

  end;




  Function TImpresorEtiqueta.GetImpresora(Impre: String;objPrinter:TPrinter): integer;
Var
  nCont: integer;
  lSearch: boolean;
  cNewLIne: String;
  nroImpre:Integer;
begin
  lSearch := False;
  cNewLIne := Chr(10) + Chr(13);

  For nCont := 0 to objPrinter.printers.Count - 1 do
  // buscamos la impresora en la lista del sistema
  begin

    if Pos(Impre, objPrinter.printers[nCont]) <> 0 then
    begin
      lSearch := True;

      nroImpre := nCont;
      Break;
    end;

  end;

  if lSearch = False then
    begin
    ShowMessage('Impresora no encontrada.' + Impre + cNewLIne +
      'Se utilizará la predeterminda.');
    nroImpre := -1;
  end;
  Result:= nroImpre;

end;



  function TImpresorEtiqueta.getPrinter: TPrinter;
  begin
    if FPrinter = nil then
      FPrinter := TPrinter.Create;
  Result := FPrinter;
  end;

end.

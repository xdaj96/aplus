unit upromo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,udticket, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML,
  Vcl.StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP,registry,udmfacturador, Vcl.Buttons, Vcl.ExtCtrls;

type
  Tfpromo = class(TForm)
    idhttp: TIdHTTP;
    mpromo: TMemo;
    Bcancelar: TBitBtn;
    Timer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Ticket:TTicket;
    procedure SetTicket(unTicket:TTicket);
    procedure enviarcodigo;

  end;

var
  fpromo: Tfpromo;

implementation

{$R *.dfm}

uses facturador;
procedure Tfpromo.CancelarClick(Sender: TObject);
begin
modalresult:=mrcancel;
end;



procedure Tfpromo.enviarcodigo;
VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  SUCURSAL, STOCK, nombrepromo,monto_porcentaje,sucursal_id,dias, rubro, codigo, laboratorio, condicion: STRING;
  fechainicio,fechafin:string;
  reg: tregistry;
  detalleval:ixmlnode;
  ffin:tdate;
   DESCUENTO:double;

begin
s:='';
try


  url:=ticket.url+'get_descuento_cupon.php?'+'id_cupon='+ticket.codigocupon;

 // IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1)';
  IdHTTP.Request.UserAgent := 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.104 Safari/537.36';
  s:=IdHTTP.Get(url);
  j:=0;
  Doc:=LoadXMLData(s);
  Doc.DocumentElement.ChildNodes.Count;
  if Doc.DocumentElement.ChildNodes.Count>0 then
  begin
          detalleval:=doc.DocumentElement.ChildNodes[6];
          mpromo.Lines.Add('----------------------------------------');
          nombrepromo:=doc.DocumentElement.ChildNodes['nombre'].Text;
          mpromo.Lines.add('Nombre promo: '+nombrepromo);

          fechainicio:=doc.DocumentElement.ChildNodes['fecha_vig_inicio'].Text;
           mpromo.Lines.add('Fecha vigencia: '+(fechainicio));
          fechafin:=doc.DocumentElement.ChildNodes['fecha_vig_fin'].text;
          mpromo.Lines.add('Hasta: '+(fechafin));
          ffin:=strtodate(fechafin);
          if ffin<now then
          begin
          showmessage('PROMOCION FINALIZADA');


          end;

              if ffin>now then
              begin
                    monto_porcentaje:=doc.DocumentElement.ChildNodes['monto_porcentaje'].Text;
                    mpromo.Lines.add('Porcentaje: '+monto_porcentaje);

                        sucursal_id:=doc.DocumentElement.ChildNodes['sucursal_id'].Text;
                        if sucursal_id='' then
                        begin
                          sucursal_id:=ticket.sucursal;
                        end;
                        if sucursal_id<>ticket.sucursal  then
                        begin
                           showmessage('SUCURSAL NO CORRESPONDIDA');
                        end;

                        if (sucursal_id=ticket.sucursal) OR  (SUCURSAL_ID='') then
                        begin
                        dias:=doc.DocumentElement.ChildNodes['dias'].Text;
                        mpromo.Lines.Add('----------------------------------------');
                        ffacturador.Gfacturador.DataSource.DataSet.First;
                        while not ffacturador.Gfacturador.DataSource.DataSet.Eof do
                        begin
                          for I := 0 to detalleval.ChildNodes.Count -1 do
                          begin



                            codigo:=detalleval.ChildNodes[I].ChildNodes['cod_alfabeta'].Text;
                            mpromo.Lines.add('Alfabeta: '+codigo);
                            laboratorio:=detalleval.ChildNodes[I].ChildNodes['cod_laboratorio'].Text;
                            mpromo.Lines.add('Laboratorio: '+laboratorio);
                            rubro:=detalleval.ChildNodes[I].ChildNodes['cod_rubro'].Text;
                            mpromo.Lines.add('Laboratorio: '+rubro);

                             if codigo=(ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[8].FieldName).asstring) then
                              begin
                                DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;
                                dmfacturador.dprincipal.Edit;
                                ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[22].FieldName).asfloat:=descuento;
                                promo:='OK';
                              end;

                             if laboratorio=(ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[15].FieldName).asstring) then
                              begin
                                DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;
                                dmfacturador.dprincipal.Edit;
                                ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[22].FieldName).asfloat:=descuento;
                                promo:='OK';
                              end;
                             if rubro=(ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[23].FieldName).asstring) then
                              begin
                                DESCUENTO:=STRTOFLOAT(MONTO_PORCENTAJE)*100;
                                dmfacturador.dprincipal.Edit;
                                ffacturador.gfacturador.DataSource.DataSet.FieldByName(ffacturador.Gfacturador.Columns[22].FieldName).asfloat:=descuento;
                                promo:='OK';
                              end;

                          end;
                         ffacturador.Gfacturador.DataSource.DataSet.next;
                        end;
                        end;

              end;
  end;
  if Doc.DocumentElement.ChildNodes.Count=0 then
  begin
  showmessage('Cupon previamente usado o no generado.')
  end;
   except
      on E: Exception do
      begin
        {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
      end;





end;

end;

procedure Tfpromo.FormShow(Sender: TObject);
begin
enviarcodigo;
 timer.Enabled:=true;

end;

procedure Tfpromo.SetTicket(unTicket: TTicket);
begin
  ticket:=unTicket;
end;

procedure Tfpromo.TimerTimer(Sender: TObject);
begin
  if promo='OK' then
  BEGIN
    MODALRESULT:=MRCANCEL;
  END;

end;

end.

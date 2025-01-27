unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Tabs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Buttons,Registry, Data.DBXFirebird,
  Data.DB, Data.SqlExpr, Data.FMTBcd, jpg, menu, facturador, buscaros,
  Vcl.Imaging.pngimage, Vcl.Grids, Vcl.ValEdit, udticket, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBQuery, IdBaseComponent, IdComponent,uUsuarioService,uUsuario,ubaseDatos, uBaseCfg,
  IdTCPConnection, IdTCPClient, IdHTTP, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, MSXML, printers,
  IdAuthentication;

 Const
  RegKey ='Software\Autofarma\APlus\';

type
    TFinicio = class(TForm)

    Pinicio: TPageControl;
    Inicio: TTabSheet;
    Configuracion: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Eusuario: TEdit;
    Label2: TLabel;
    Epass: TEdit;
    Baceptar: TBitBtn;
    Bcancelar: TBitBtn;
    Image1: TImage;
    VLparametros: TValueListEditor;
    Shape2: TShape;
    Shape1: TShape;
    Bguardar: TBitBtn;
    Btestear: TBitBtn;
    Panel2: TPanel;
    lterminal: TLabel;
    emodificar: TEdit;
    Label3: TLabel;
    lversion: TLabel;
    SpeedButton1: TSpeedButton;
    idhttp: TIdHTTP;
    cboImpresoras: TComboBox;
    Label5: TLabel;
    ScrollBar1: TScrollBar;
    procedure BguardarClick(Sender: TObject);
    procedure BtestearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BcancelarClick(Sender: TObject);
    procedure BaceptarClick(Sender: TObject);
    procedure bajarofertas;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
     Ticket:TTicket;
     usuarioService:TUsuarioService;
     baseDatos:TBaseDatos;
     baseConfig:TBaseCfg;
    procedure cargarRecargoHospital(reg: TRegistry);

  public

  end;

var
  Finicio: TFinicio;
  fsucursal: string;



implementation

{$R *.dfm}

function GetPCName: string;
var
  Buffer: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
  Size: Cardinal;
begin
  FillChar(Buffer,Sizeof(Buffer),0);
  Size:= Sizeof(Buffer);

  if GetComputerName(Buffer,Size) then
    Result:= String(PChar(@Buffer))
  else
    Result:= 'MAXI-PC';
end;

function SepararCadena(const Cadena: string; const Delim: Char): TStringList;
begin
  Result:= TStringList.Create;
  Result.Delimiter:= Delim;
  Result.DelimitedText:= Cadena;
end;

procedure TFinicio.BaceptarClick(Sender: TObject);
var
 reg: tregistry;
 Splash: tfimagen;
 form: tfarbol;
 usuario:TUsuario;
begin
 try
  usuario:= usuarioService.login(eusuario.text,epass.text);

  if usuario = nil then
  begin
      eusuario.Clear;
      epass.Clear;
      eusuario.SetFocus;
      end
  else
      begin

      ticket.perfil:=usuarioService.obtenerIdPerfil(usuario.nombre);

      //bajarofertas;

      finicio.Hide;
      Splash:= Tfimagen.Create(Application);

      Splash.Show;
      Splash.Update;
      Sleep(3000);
      Splash.Hide;
      Splash.Free;
      form:=Tfarbol.Create(self);

      form.SetTicket(ticket);

      form.ShowModal;
  end;
 except
    on E:exception do
    begin
      ShowMessage(E.Message);
      eusuario.SetFocus;
    end;
 end;


end;

procedure TFinicio.bajarofertas;

VAR
  s, url:String;
  j,i:Integer;
  Doc:IXMLDocument;
  resultado_alta_cliente, detalle:ixmlnode;
  SUCURSAL, STOCK: STRING;
  reg: tregistry;
  detalleval:ixmlnode;

begin
s:='';
try

  url:=ticket.url+'get_descuentos.php?sucursal_id=201&f_desde=2017-04-01';

  IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
  s:=IdHTTP.Get(url);

  j:=0;
  Doc:=LoadXMLData(s);
  doc.SaveToFile('c:\NET\prueba.xml');
  doc.DocumentElement.ChildNodes.Count;
  detalleval:=doc.DocumentElement.ChildNodes[1];
{  for I := 0 to detalleval.ChildNodes.Count -1 do
  begin
  j:=j+1;
  if strtoint(detalleval.ChildNodes[I].ChildNodes['CAN_STK'].Text)>0 then
  begin
    SUCURSAL:=detalleval.ChildNodes[I].ChildNodes['NOM_SUCURSAL'].Text;
    STOCK:=detalleval.ChildNodes[I].ChildNodes['CAN_STK'].Text;
    vlstock.InsertRow(sucursal,stock,true);

  end;


  end; }

   except
      on E: Exception do
      begin
        {$IFDEF DEBUG}ShowMessage('IMPOSIBLE CONECTAR:'+E.Message){$ENDIF};
      end;





end;
end;


procedure TFinicio.BcancelarClick(Sender: TObject);
begin
finicio.Close;
end;

procedure TFinicio.BguardarClick(Sender: TObject);
var
 reg: tregistry;

begin

  Reg := TRegistry.Create(KEY_WRITE);
  Reg.RootKey := HKEY_CURRENT_USER;

  Reg.OpenKey(regKey,true);
  Reg.WriteString('rutabase', vlparametros.Values['Ruta base de datos']);
  Reg.WriteString('rutabasecfg', vlparametros.Values['Ruta base de configuracion']);
  Reg.WriteString('sucursal', vlparametros.Values['Numero de sucursal']);
  Reg.WriteString('pv', vlparametros.Values['Letrita']);
  Reg.WriteString('pf', vlparametros.Values['Numero']);
  Reg.WriteString('com', vlparametros.Values['Puerto COM fiscal']);
  Reg.WriteString('URL', vlparametros.Values['Url Webapps']);
  Reg.WriteString('Reportes', vlparametros.Values['Ruta reportes']);
  Reg.WriteString('error', vlparametros.Values['Ruta errores']);
  Reg.WriteString('Recargo', vlparametros.Values['Recargo']);
  Reg.WriteString('clave', emodificar.Text);
  REG.WriteString('ipfiscal',vlparametros.Values['IP controlador FISCAL']);
  REG.WriteString('ifh',vlparametros.Values['Version IFH']);
  REG.WriteString('P-441F',vlparametros.Values['P-441F']);
  REG.WriteString('caja',vlparametros.Values['Modulo de caja']);
  REG.WriteString('ventanas',vlparametros.Values['Ventanas Multiples']);
  REG.WriteString('ofertas',vlparametros.Values['Ruta Ofertas']);
  REG.WriteString('region',vlparametros.Values['Region']);
  REG.WriteString('Fiscal',vlparametros.Values['Marca del Fiscal']);
  REG.WriteString('Cola',vlparametros.Values['Usa cola']);
  REG.WriteString('Rcola',vlparametros.Values['Ruta de cola']);
  REG.WriteString('Oespecial',vlparametros.Values['Oferta especial']);
  REG.WriteString('Turnero',vlparametros.Values['Turnero']);
  REG.WriteString('Dturnero',vlparametros.Values['Direccion turnero']);
  Reg.WriteString('RecargoHosp',vlparametros.values['Recargo hospital']);
  Reg.WriteString('IMPRESORA',CBOIMPRESORAS.Text);

  Reg.Free;
  showmessage('Datos actualizados');

  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);




  ticket.clavemodificar:=Reg.ReadString('clave');
  ticket.recargo:=Reg.ReadString('Recargo');
  ticket.errores:=Reg.ReadString('error');
  ticket.p441f:=Reg.ReadString('P-441F');
  ticket.modulocaja:=Reg.ReadString('caja');
  ticket.ventanas:=Reg.ReadString('ventanas');
  ticket.ofertas:=Reg.ReadString('ofertas');
  ticket.region:=Reg.ReadString('region');
  ticket.fiscal:=Reg.ReadString('Fiscal');
  ticket.cola:=Reg.ReadString('Cola');
  ticket.rcola:=Reg.ReadString('Rcola');
  ticket.ifh:=Reg.ReadString('ifh');
  ticket.ipfiscal:=reg.ReadString('ipfiscal');
  ticket.Oespecial:=reg.ReadString('oespecial');
  ticket.direccionturnero:=Reg.ReadString('Dturnero');
  ticket.turnero:=Reg.ReadString('Turnero');
  ticket.url:=Reg.ReadString('URL');
  cboImpresoras.Items.Clear;
  cboImpresoras.Items.Assign(Printer.Printers);

end;

procedure TFinicio.BtestearClick(Sender: TObject);
var
reg: tregistry;


begin
try

  baseDatos.conectar;

  baseConfig.conectar;

  if baseDatos.estaConectado then
  begin
    shape1.Brush.Color:=cllime;
  end;

  if baseConfig.estaConectado then
  begin
    shape2.Brush.Color:=cllime;
  end;
except
  on E:Exception do
  begin
    showMessage('No se pudo conectar. Revise la configuración');

  end;
end;

end;

procedure TFinicio.FormCreate(Sender: TObject);
begin
  usuarioService:= TUsuarioService.Create;
  baseDatos:= TBaseDatos.getInstance;
  baseConfig:= TBaseCfg.getInstance;

end;

procedure TFinicio.FormDestroy(Sender: TObject);
begin
  usuarioService.Free;

  baseDatos.Desconectar;
  baseConfig.Desconectar;


end;
//--------------------lectura recargo hospital------------------------------//
procedure TFinicio.cargarRecargoHospital(reg: TRegistry);
var
  recargo_hosp: string;
  ip: string;
  ip2: TStringList;
  ip3: string;
  F: TextFile;
  ruta: string;

begin


  ip := reg.ReadString('rutabasecfg');
  ip2 := separarcadena(ip, '\');
  ip3 := ip2[2];
  ruta := '\\' + IP3 + '\' + 'NET\APLUS\URL\' + 'hospital.txt';
  if FileExists(ruta) then
  begin
    AssignFile(F, ruta);
    Reset(F);
    while not Eof(F) do
    begin
      ReadLn(F, recargo_hosp);
    end;
    CloseFile(F);
  end
  else
  begin
    recargo_hosp := Reg.ReadString('RecargoHosp');
  end;
  try
    // Si es distinto el recargo que se obtiene desde el archivo lo grabamos en el registro
    if strToInt(recargo_hosp) <> strToInt(Reg.ReadString('RecargoHosp')) then
      Reg.WriteString('RecargoHosp', recargo_hosp);
  except
    on E: Exception do
    begin
      ShowMessage('El valor del archivo para recargo de hospitales no es valido');
    end;
  end;
end;
//--------------------lectura recargo hospital------------------------------//


procedure TFinicio.FormShow(Sender: TObject);
var
reg: tregistry;
sLinea: tstringlist;
 F: TextFile;
  ip: STRING;
  ip2: tstringLIST;
  ip3: STRING;
   Linea: String;
   promo: string;
   sorteo:string;
   ruta:string;
begin
  Ticket:=TTicket.Create;
  pINICIO.ActivePageIndex:=0;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey(regKey,true);

  vlparametros.Values['Ruta base de datos']:=reg.ReadString('rutabase');
  vlparametros.Values['Ruta base de configuracion']:=reg.ReadString('rutabasecfg');
  vlparametros.Values['Numero de sucursal']:=reg.ReadString('sucursal');
  vlparametros.Values['Letrita']:=Reg.ReadString('pv');
  vlparametros.Values['Numero']:=Reg.ReadString('pf');
  vlparametros.Values['Puerto COM fiscal']:=Reg.ReadString('com');
  vlparametros.Values['Url Webapps']:=Reg.ReadString('URL');
  vlparametros.Values['Ruta reportes']:=Reg.ReadString('Reportes');
  vlparametros.Values['Recargo']:=Reg.ReadString('Recargo');
  vlparametros.Values['Ruta errores']:=Reg.ReadString('error');
  vlparametros.Values['P-441F']:=Reg.ReadString('P-441F');
  vlparametros.Values['Modulo de caja']:=Reg.ReadString('caja');
  vlparametros.Values['Ventanas Multiples']:=Reg.ReadString('ventanas');
  vlparametros.Values['Ruta Ofertas']:=Reg.ReadString('ofertas');
  vlparametros.Values['Region']:=Reg.ReadString('region');
  vlparametros.Values['Marca del Fiscal']:=Reg.ReadString('Fiscal');
  vlparametros.Values['Usa cola']:=Reg.ReadString('Cola');
  vlparametros.Values['Ruta de cola']:=Reg.ReadString('Rcola');
  vlparametros.values['IP controlador FISCAL']:=Reg.ReadString('ipfiscal');
  vlparametros.values['Version IFH']:=Reg.ReadString('ifh');
  vlparametros.values['Oferta especial']:=Reg.ReadString('Oespecial');
  vlparametros.values['Turnero']:=Reg.ReadString('Turnero');
  vlparametros.values['Direccion turnero']:=Reg.ReadString('Dturnero');
  vlparametros.values['Recargo hospital']:=Reg.ReadString('RecargoHosp');
  vlparametros.values['Sorteo']:=Reg.ReadString('sorteo');

    {if FileExists('c:\inicio.ini') then
  begin
     slinea:=tstringlist.Create;
     slinea.LoadFromFile('c:\inicio.ini');
     eusuario.Text:=slinea[0];
     epass.Text:=slinea[1];
     vlparametros.Values['Recargo'] := slinea[2];
  end;}

  if FileExists('c:\inicio.ini') then
  begin
      slinea:=tstringlist.Create;
      slinea.LoadFromFile('c:\inicio.ini');
      eusuario.Text:=slinea[0];
      epass.Text:=slinea[1];
      vlparametros.Values['Recargo']:=slinea[2];
  end
  else
  begin
      if FileExists('f:\aplus\inicio.ini') then
      begin
          slinea:=tstringlist.Create;
          slinea.LoadFromFile('f:\aplus\inicio.ini');
          eusuario.Text:=slinea[0];
          epass.Text:=slinea[1];
          vlparametros.Values['Recargo']:=slinea[2];
      end;
  end;



  cboimpresoras.SelText:=reg.ReadString('IMPRESORA');
  emodificar.Text:=Reg.ReadString('clave');
  lterminal.Caption:=getpcname;
  ticket.nombre_terminal:=lterminal.Caption;
  ticket.puerto_com:=Reg.ReadString('com');
  ticket.fiscla_pv:=Reg.ReadString('pf');
  ticket.sucursal:=reg.ReadString('sucursal');

//--------------------lectura url webservice------------------------------//
  ip:= reg.ReadString('rutabasecfg');

  ip2:=separarcadena(ip,'\');
  ip3:=ip2[2];

  AssignFile( F, '\\'+IP3+'\'+'NET\APLUS\URL\'+'URL.txt' );
  Reset( F );

  while not Eof( F ) do
  begin
  ReadLn( F, Linea );
  end;
  CloseFile( F );
//--------------------lectura url webservice------------------------------//
//--------------------lectura promo especial------------------------------//
  ip:= reg.ReadString('rutabasecfg');

  ip2:=separarcadena(ip,'\');
  ip3:=ip2[2];

  AssignFile( F, '\\'+IP3+'\'+'NET\APLUS\URL\'+'promo.txt' );
  Reset( F );

  while not Eof( F ) do
  begin
  ReadLn( F, promo );
  end;
  CloseFile( F );
  cargarRecargoHospital(reg);


//--------------------lectura promo especial------------------------------//



//--------------------lectura de sorteo------------------------------//
  ip:= reg.ReadString('rutabasecfg');

  ip2:=separarcadena(ip,'\');
  ip3:=ip2[2];

  ruta:= '\\'+IP3+'\'+'NET\APLUS\URL\'+'sorteo.txt';

  if FileExists(ruta) then
  begin
    AssignFile( F, ruta );
    Reset( F );
    while not Eof( F ) do
    begin
      ReadLn( F, sorteo );
    end;
    CloseFile( F );
  end
  else
  begin
    sorteo:='N';
  end;


//--------------------lectura de sorteo------------------------------//

  ticket.sorteo:= sorteo;
  Reg.WriteString('sorteo', sorteo);

  ticket.url:=LINEA;

  Reg.WriteString('URL', linea);

  ticket.Oespecial:=promo;

  Reg.WriteString('Oespecial', promo);


  ticket.clavemodificar:=Reg.ReadString('clave');
  ticket.recargo:=Reg.ReadString('Recargo');
  ticket.errores:=Reg.ReadString('error');
  ticket.p441f:=Reg.ReadString('P-441F');
  ticket.modulocaja:=Reg.ReadString('caja');
  ticket.ventanas:=Reg.ReadString('ventanas');
  ticket.ofertas:=Reg.ReadString('ofertas');
  ticket.region:=Reg.ReadString('region');
  ticket.fiscal:=Reg.ReadString('Fiscal');
  ticket.cola:=Reg.ReadString('Cola');
  ticket.rcola:=Reg.ReadString('Rcola');
  ticket.ifh:=Reg.ReadString('ifh');
  ticket.ipfiscal:=reg.ReadString('ipfiscal');
  ticket.Oespecial:=reg.ReadString('oespecial');
  ticket.direccionturnero:=Reg.ReadString('Dturnero');
  ticket.turnero:=Reg.ReadString('Turnero');
  ticket.recargoHosp:= Reg.ReadString('RecargoHosp');
  cboImpresoras.Items.Clear;
  cboImpresoras.Items.Assign(Printer.Printers);
 {
  if FileExists('c:\inicio.ini') then
  begin
      slinea:=tstringlist.Create;
      slinea.LoadFromFile('c:\inicio.ini');
      eusuario.Text:=slinea[0];
      epass.Text:=slinea[1];
      vlparametros.Values['Recargo']:=slinea[2];
  end
  else
  begin
      if FileExists('f:\aplus\inicio.ini') then
      begin
          slinea:=tstringlist.Create;
          slinea.LoadFromFile('f:\aplus\inicio.ini');
          eusuario.Text:=slinea[0];
          epass.Text:=slinea[1];
          vlparametros.Values['Recargo']:=slinea[2];
      end;
  end;
  }

  // Documentacion de cambios    02/08/2023

  {
    Se agrega la linea vlparametros.Values['Recargo']:=slinea[2];
    esto permite que se cargue el valor del archivo .ini que contenga el usuario y contraseña y ademas del recargo,
    de manera de no tener que modificar en cada maquina el recargo en el aplus

    Se modifica la linea de codigo if FileExists('C:\inicio.ini') then por
    if FileExists('C:\NET\aplus\inicio.ini') then
    de manera que el archivo que levante sea el que esta con el aplus en la ubicacion del servidor y solo deba modificarse una vez
    y aplique a todas las pcs de la sucursal

    recargo actual (03/08/2023) 15%
  }
  {if FileExists('F:\aplus\inicio.ini') then
  begin
     slinea:=tstringlist.Create;
     slinea.LoadFromFile('F:\aplus\inicio.ini');
     eusuario.Text:=slinea[0];
     epass.Text:=slinea[1];
     vlparametros.Values['Recargo']:=slinea[2];
  end;
  }
  {if FileExists('C:\inicio.ini') then
  begin
     slinea:=tstringlist.Create;
     slinea.LoadFromFile('C:\inicio.ini');
     Eusuario.Text:=slinea[0];
     Epass.Text:=slinea[1];
     vlparametros.Values['Recargo']:=slinea[2];
  end;}


end;

end.

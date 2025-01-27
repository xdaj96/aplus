unit uWebAppService;

interface

uses
  SysUtils, Classes, IdHTTP, IdSSLOpenSSL, IdSSLOpenSSLHeaders;

type
  TWebAppService = class
  private
    FIdHTTP: TIdHTTP;
    procedure HandleResponse(const Response: TStream; var Content: string);
  public
    constructor Create;
    destructor Destroy; override;
    function Get(const URL: string): string;
    function Post(const URL: string; const Params: TStringList): string;
  end;

implementation

{ TWebAppService }

constructor TWebAppService.Create;
begin
  FIdHTTP := TIdHTTP.Create(nil);
  // Configurar SSL si es necesario
  FIdHTTP.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  (FIdHTTP.IOHandler as TIdSSLIOHandlerSocketOpenSSL).SSLOptions.Method := sslvTLSv1_2;
end;

destructor TWebAppService.Destroy;
begin
  FIdHTTP.Free;
  inherited;
end;

procedure TWebAppService.HandleResponse(const Response: TStream; var Content: string);
var
  ResponseStream: TStringStream;
begin
  ResponseStream := TStringStream.Create('', TEncoding.UTF8);
  try
    ResponseStream.CopyFrom(Response, 0);
    Content := ResponseStream.DataString;
  finally
    ResponseStream.Free;
  end;
end;

function TWebAppService.Get(const URL: string): string;
begin
  Result := '';
  try
    Fidhttp.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
    Result := FIdHTTP.Get(URL);
  except
    on E: Exception do
      Result := 'Error: ' + E.Message;
  end;
end;

function TWebAppService.Post(const URL: string; const Params: TStringList): string;
var
  ResponseStream: TStringStream;
begin
  Result := '';
  try
    ResponseStream := TStringStream.Create(Params.Text, TEncoding.UTF8);
    try
      FIdHTTP.Request.ContentType := 'application/x-www-form-urlencoded'; // Configura el tipo de contenido según sea necesario
      Result := FIdHTTP.Post(URL, ResponseStream);
    finally
      ResponseStream.Free;
    end;
  except
    on E: Exception do
      Result := 'Error: ' + E.Message;
  end;
end;

end.

unit uClienteService;

interface
  uses sysUtils,uCliente,Xml.xmldom, Xml.XMLIntf,
  msxmldom, xml.xmldoc;

  Type
    TClienteService = class
      private

      public
        function obtenerClienteDesdeXML(clienteNode:IXMLNODE):TCliente;
    end;
implementation



function TClienteService.obtenerClienteDesdeXML(clienteNode:IXMLNODE):TCliente;
var
  cliente:TCliente;
begin
  cliente:= TCliente.Create(
    clienteNode.ChildNodes['nombre_cliente'].Text, clienteNode.ChildNodes['documento'].Text,
    clienteNode.ChildNodes['direccion'].Text,clienteNode.ChildNodes['telefono'].Text
  );
  Result:= cliente;
end;



end.


{*****************************************************************}
{                                                                 }
{                        XML Data Binding                         }
{                                                                 }
{         Generated on: 27/06/2016 11:18:14                       }
{       Generated from: C:\programas_datos\FARMACIA A+\maxi.xsd   }
{   Settings stored in: C:\programas_datos\FARMACIA A+\maxi.xdb   }
{                                                                 }
{*****************************************************************}

unit maxi;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLMensajeADESFA = interface;
  IXMLMensajeADESFA_EncabezadoMensaje = interface;
  IXMLMensajeADESFA_EncabezadoMensaje_InicioTrx = interface;
  IXMLMensajeADESFA_EncabezadoMensaje_Terminal = interface;
  IXMLMensajeADESFA_EncabezadoMensaje_Software = interface;
  IXMLMensajeADESFA_EncabezadoMensaje_Validador = interface;
  IXMLMensajeADESFA_EncabezadoMensaje_Prestador = interface;
  IXMLMensajeADESFA_EncabezadoReceta = interface;
  IXMLMensajeADESFA_EncabezadoReceta_Prescriptor = interface;
  IXMLMensajeADESFA_EncabezadoReceta_Beneficiario = interface;
  IXMLMensajeADESFA_EncabezadoReceta_Financiador = interface;
  IXMLMensajeADESFA_EncabezadoReceta_Credencial = interface;
  IXMLMensajeADESFA_EncabezadoReceta_Preautorizacion = interface;
  IXMLMensajeADESFA_EncabezadoReceta_Dispensa = interface;
  IXMLMensajeADESFA_EncabezadoReceta_Formulario = interface;
  IXMLMensajeADESFA_EncabezadoReceta_Institucion = interface;
  IXMLMensajeADESFA_EncabezadoReceta_Retira = interface;
  IXMLMensajeADESFA_DetalleReceta = interface;
  IXMLMensajeADESFA_DetalleReceta_Item = interface;

{ IXMLMensajeADESFA }

  IXMLMensajeADESFA = interface(IXMLNode)
    ['{029B7419-30A0-47EF-94C0-D2C3FE5883E0}']
    { Property Accessors }
    function Get_Version: STRING;
    function Get_EncabezadoMensaje: IXMLMensajeADESFA_EncabezadoMensaje;
    function Get_EncabezadoReceta: IXMLMensajeADESFA_EncabezadoReceta;
    function Get_DetalleReceta: IXMLMensajeADESFA_DetalleReceta;
    procedure Set_Version(Value: STRING);
    { Methods & Properties }
    property Version: STRING read Get_Version write Set_Version;
    property EncabezadoMensaje: IXMLMensajeADESFA_EncabezadoMensaje read Get_EncabezadoMensaje;
    property EncabezadoReceta: IXMLMensajeADESFA_EncabezadoReceta read Get_EncabezadoReceta;
    property DetalleReceta: IXMLMensajeADESFA_DetalleReceta read Get_DetalleReceta;
  end;

{ IXMLMensajeADESFA_EncabezadoMensaje }

  IXMLMensajeADESFA_EncabezadoMensaje = interface(IXMLNode)
    ['{3D42672B-0764-42A9-AC41-E3F1D41DAFF0}']
    { Property Accessors }
    function Get_TipoMsj: SmallInt;
    function Get_CodAccion: Integer;
    function Get_IdMsj: Integer;
    function Get_InicioTrx: IXMLMensajeADESFA_EncabezadoMensaje_InicioTrx;
    function Get_Terminal: IXMLMensajeADESFA_EncabezadoMensaje_Terminal;
    function Get_Software: IXMLMensajeADESFA_EncabezadoMensaje_Software;
    function Get_Validador: IXMLMensajeADESFA_EncabezadoMensaje_Validador;
    function Get_VersionMsj: Single;
    function Get_Prestador: IXMLMensajeADESFA_EncabezadoMensaje_Prestador;
    function Get_SetCaracteres: UnicodeString;
    procedure Set_TipoMsj(Value: SmallInt);
    procedure Set_CodAccion(Value: Integer);
    procedure Set_IdMsj(Value: Integer);
    procedure Set_VersionMsj(Value: Single);
    procedure Set_SetCaracteres(Value: UnicodeString);
    { Methods & Properties }
    property TipoMsj: SmallInt read Get_TipoMsj write Set_TipoMsj;
    property CodAccion: Integer read Get_CodAccion write Set_CodAccion;
    property IdMsj: Integer read Get_IdMsj write Set_IdMsj;
    property InicioTrx: IXMLMensajeADESFA_EncabezadoMensaje_InicioTrx read Get_InicioTrx;
    property Terminal: IXMLMensajeADESFA_EncabezadoMensaje_Terminal read Get_Terminal;
    property Software: IXMLMensajeADESFA_EncabezadoMensaje_Software read Get_Software;
    property Validador: IXMLMensajeADESFA_EncabezadoMensaje_Validador read Get_Validador;
    property VersionMsj: Single read Get_VersionMsj write Set_VersionMsj;
    property Prestador: IXMLMensajeADESFA_EncabezadoMensaje_Prestador read Get_Prestador;
    property SetCaracteres: UnicodeString read Get_SetCaracteres write Set_SetCaracteres;
  end;

{ IXMLMensajeADESFA_EncabezadoMensaje_InicioTrx }

  IXMLMensajeADESFA_EncabezadoMensaje_InicioTrx = interface(IXMLNode)
    ['{2B36339E-F5FE-48F2-A0D4-FEDFD8EE7962}']
    { Property Accessors }
    function Get_Fecha: Integer;
    function Get_Hora: Integer;
    procedure Set_Fecha(Value: Integer);
    procedure Set_Hora(Value: Integer);
    { Methods & Properties }
    property Fecha: Integer read Get_Fecha write Set_Fecha;
    property Hora: Integer read Get_Hora write Set_Hora;
  end;

{ IXMLMensajeADESFA_EncabezadoMensaje_Terminal }

  IXMLMensajeADESFA_EncabezadoMensaje_Terminal = interface(IXMLNode)
    ['{D452AF85-42DB-47F9-99FC-FB5C1C9E73FC}']
    { Property Accessors }
    function Get_Tipo: UnicodeString;
    function Get_Numero: ShortInt;
    procedure Set_Tipo(Value: UnicodeString);
    procedure Set_Numero(Value: ShortInt);
    { Methods & Properties }
    property Tipo: UnicodeString read Get_Tipo write Set_Tipo;
    property Numero: ShortInt read Get_Numero write Set_Numero;
  end;

{ IXMLMensajeADESFA_EncabezadoMensaje_Software }

  IXMLMensajeADESFA_EncabezadoMensaje_Software = interface(IXMLNode)
    ['{3247E6F7-5E6B-4215-B975-731D28FB7B1F}']
    { Property Accessors }
    function Get_Nombre: UnicodeString;
    function Get_Version: UnicodeString;
    procedure Set_Nombre(Value: UnicodeString);
    procedure Set_Version(Value: UnicodeString);
    { Methods & Properties }
    property Nombre: UnicodeString read Get_Nombre write Set_Nombre;
    property Version: UnicodeString read Get_Version write Set_Version;
  end;

{ IXMLMensajeADESFA_EncabezadoMensaje_Validador }

  IXMLMensajeADESFA_EncabezadoMensaje_Validador = interface(IXMLNode)
    ['{724E2824-B8C5-446C-9022-5146623F4AD2}']
    { Property Accessors }
    function Get_Nombre: UnicodeString;
    function Get_Version: UnicodeString;
    procedure Set_Nombre(Value: UnicodeString);
    procedure Set_Version(Value: UnicodeString);
    { Methods & Properties }
    property Nombre: UnicodeString read Get_Nombre write Set_Nombre;
    property Version: UnicodeString read Get_Version write Set_Version;
  end;

{ IXMLMensajeADESFA_EncabezadoMensaje_Prestador }

  IXMLMensajeADESFA_EncabezadoMensaje_Prestador = interface(IXMLNode)
    ['{EB0C0175-BAA3-4A7C-BAA9-202E800B3F42}']
    { Property Accessors }
    function Get_Cuit: UnicodeString;
    function Get_Sucursal: UnicodeString;
    function Get_RazonSocial: UnicodeString;
    function Get_Codigo: Int64;
    procedure Set_Cuit(Value: UnicodeString);
    procedure Set_Sucursal(Value: UnicodeString);
    procedure Set_RazonSocial(Value: UnicodeString);
    procedure Set_Codigo(Value: Int64);
    { Methods & Properties }
    property Cuit: UnicodeString read Get_Cuit write Set_Cuit;
    property Sucursal: UnicodeString read Get_Sucursal write Set_Sucursal;
    property RazonSocial: UnicodeString read Get_RazonSocial write Set_RazonSocial;
    property Codigo: Int64 read Get_Codigo write Set_Codigo;
  end;

{ IXMLMensajeADESFA_EncabezadoReceta }

  IXMLMensajeADESFA_EncabezadoReceta = interface(IXMLNode)
    ['{21164D2E-18AA-410B-98C1-848CBE0196D3}']
    { Property Accessors }
    function Get_Prescriptor: IXMLMensajeADESFA_EncabezadoReceta_Prescriptor;
    function Get_Beneficiario: IXMLMensajeADESFA_EncabezadoReceta_Beneficiario;
    function Get_Financiador: IXMLMensajeADESFA_EncabezadoReceta_Financiador;
    function Get_Credencial: IXMLMensajeADESFA_EncabezadoReceta_Credencial;
    function Get_CoberturaEspecial: UnicodeString;
    function Get_Preautorizacion: IXMLMensajeADESFA_EncabezadoReceta_Preautorizacion;
    function Get_FechaReceta: Integer;
    function Get_Dispensa: IXMLMensajeADESFA_EncabezadoReceta_Dispensa;
    function Get_Formulario: IXMLMensajeADESFA_EncabezadoReceta_Formulario;
    function Get_TipoTratamiento: UnicodeString;
    function Get_Diagnostico: UnicodeString;
    function Get_Institucion: IXMLMensajeADESFA_EncabezadoReceta_Institucion;
    function Get_Retira: IXMLMensajeADESFA_EncabezadoReceta_Retira;
    procedure Set_CoberturaEspecial(Value: UnicodeString);
    procedure Set_FechaReceta(Value: Integer);
    procedure Set_TipoTratamiento(Value: UnicodeString);
    procedure Set_Diagnostico(Value: UnicodeString);
    { Methods & Properties }
    property Prescriptor: IXMLMensajeADESFA_EncabezadoReceta_Prescriptor read Get_Prescriptor;
    property Beneficiario: IXMLMensajeADESFA_EncabezadoReceta_Beneficiario read Get_Beneficiario;
    property Financiador: IXMLMensajeADESFA_EncabezadoReceta_Financiador read Get_Financiador;
    property Credencial: IXMLMensajeADESFA_EncabezadoReceta_Credencial read Get_Credencial;
    property CoberturaEspecial: UnicodeString read Get_CoberturaEspecial write Set_CoberturaEspecial;
    property Preautorizacion: IXMLMensajeADESFA_EncabezadoReceta_Preautorizacion read Get_Preautorizacion;
    property FechaReceta: Integer read Get_FechaReceta write Set_FechaReceta;
    property Dispensa: IXMLMensajeADESFA_EncabezadoReceta_Dispensa read Get_Dispensa;
    property Formulario: IXMLMensajeADESFA_EncabezadoReceta_Formulario read Get_Formulario;
    property TipoTratamiento: UnicodeString read Get_TipoTratamiento write Set_TipoTratamiento;
    property Diagnostico: UnicodeString read Get_Diagnostico write Set_Diagnostico;
    property Institucion: IXMLMensajeADESFA_EncabezadoReceta_Institucion read Get_Institucion;
    property Retira: IXMLMensajeADESFA_EncabezadoReceta_Retira read Get_Retira;
  end;

{ IXMLMensajeADESFA_EncabezadoReceta_Prescriptor }

  IXMLMensajeADESFA_EncabezadoReceta_Prescriptor = interface(IXMLNode)
    ['{05C302D5-4864-4587-8035-885CC95DF001}']
    { Property Accessors }
    function Get_Apellido: UnicodeString;
    function Get_Nombre: UnicodeString;
    function Get_TipoMatricula: UnicodeString;
    function Get_Provincia: UnicodeString;
    function Get_NroMatricula: SmallInt;
    function Get_TipoPrescriptor: UnicodeString;
    function Get_Cuit: UnicodeString;
    function Get_Especialidad: UnicodeString;
    procedure Set_Apellido(Value: UnicodeString);
    procedure Set_Nombre(Value: UnicodeString);
    procedure Set_TipoMatricula(Value: UnicodeString);
    procedure Set_Provincia(Value: UnicodeString);
    procedure Set_NroMatricula(Value: SmallInt);
    procedure Set_TipoPrescriptor(Value: UnicodeString);
    procedure Set_Cuit(Value: UnicodeString);
    procedure Set_Especialidad(Value: UnicodeString);
    { Methods & Properties }
    property Apellido: UnicodeString read Get_Apellido write Set_Apellido;
    property Nombre: UnicodeString read Get_Nombre write Set_Nombre;
    property TipoMatricula: UnicodeString read Get_TipoMatricula write Set_TipoMatricula;
    property Provincia: UnicodeString read Get_Provincia write Set_Provincia;
    property NroMatricula: SmallInt read Get_NroMatricula write Set_NroMatricula;
    property TipoPrescriptor: UnicodeString read Get_TipoPrescriptor write Set_TipoPrescriptor;
    property Cuit: UnicodeString read Get_Cuit write Set_Cuit;
    property Especialidad: UnicodeString read Get_Especialidad write Set_Especialidad;
  end;

{ IXMLMensajeADESFA_EncabezadoReceta_Beneficiario }

  IXMLMensajeADESFA_EncabezadoReceta_Beneficiario = interface(IXMLNode)
    ['{F2D2008B-07DB-4EF3-80B2-FD3F2FB67D80}']
    { Property Accessors }
    function Get_TipoDoc: UnicodeString;
    function Get_NroDoc: UnicodeString;
    function Get_Apellido: UnicodeString;
    function Get_Nombre: UnicodeString;
    function Get_Sexo: UnicodeString;
    function Get_FechaNacimiento: UnicodeString;
    function Get_Parentesco: UnicodeString;
    function Get_EdadUnidad: UnicodeString;
    function Get_Edad: ShortInt;
    procedure Set_TipoDoc(Value: UnicodeString);
    procedure Set_NroDoc(Value: UnicodeString);
    procedure Set_Apellido(Value: UnicodeString);
    procedure Set_Nombre(Value: UnicodeString);
    procedure Set_Sexo(Value: UnicodeString);
    procedure Set_FechaNacimiento(Value: UnicodeString);
    procedure Set_Parentesco(Value: UnicodeString);
    procedure Set_EdadUnidad(Value: UnicodeString);
    procedure Set_Edad(Value: ShortInt);
    { Methods & Properties }
    property TipoDoc: UnicodeString read Get_TipoDoc write Set_TipoDoc;
    property NroDoc: UnicodeString read Get_NroDoc write Set_NroDoc;
    property Apellido: UnicodeString read Get_Apellido write Set_Apellido;
    property Nombre: UnicodeString read Get_Nombre write Set_Nombre;
    property Sexo: UnicodeString read Get_Sexo write Set_Sexo;
    property FechaNacimiento: UnicodeString read Get_FechaNacimiento write Set_FechaNacimiento;
    property Parentesco: UnicodeString read Get_Parentesco write Set_Parentesco;
    property EdadUnidad: UnicodeString read Get_EdadUnidad write Set_EdadUnidad;
    property Edad: ShortInt read Get_Edad write Set_Edad;
  end;

{ IXMLMensajeADESFA_EncabezadoReceta_Financiador }

  IXMLMensajeADESFA_EncabezadoReceta_Financiador = interface(IXMLNode)
    ['{5E760390-9371-497D-B3C6-5A756E2798FF}']
    { Property Accessors }
    function Get_Codigo: ShortInt;
    function Get_Cuit: UnicodeString;
    function Get_Sucursal: UnicodeString;
    procedure Set_Codigo(Value: ShortInt);
    procedure Set_Cuit(Value: UnicodeString);
    procedure Set_Sucursal(Value: UnicodeString);
    { Methods & Properties }
    property Codigo: ShortInt read Get_Codigo write Set_Codigo;
    property Cuit: UnicodeString read Get_Cuit write Set_Cuit;
    property Sucursal: UnicodeString read Get_Sucursal write Set_Sucursal;
  end;

{ IXMLMensajeADESFA_EncabezadoReceta_Credencial }

  IXMLMensajeADESFA_EncabezadoReceta_Credencial = interface(IXMLNode)
    ['{EF75D8A2-231C-4902-84AC-2FA92E05FEF1}']
    { Property Accessors }
    function Get_Numero: Int64;
    function Get_Track: UnicodeString;
    function Get_Version: UnicodeString;
    function Get_Vencimiento: UnicodeString;
    function Get_ModoIngreso: UnicodeString;
    function Get_EsProvisorio: UnicodeString;
    function Get_Plan: ShortInt;
    procedure Set_Numero(Value: Int64);
    procedure Set_Track(Value: UnicodeString);
    procedure Set_Version(Value: UnicodeString);
    procedure Set_Vencimiento(Value: UnicodeString);
    procedure Set_ModoIngreso(Value: UnicodeString);
    procedure Set_EsProvisorio(Value: UnicodeString);
    procedure Set_Plan(Value: ShortInt);
    { Methods & Properties }
    property Numero: Int64 read Get_Numero write Set_Numero;
    property Track: UnicodeString read Get_Track write Set_Track;
    property Version: UnicodeString read Get_Version write Set_Version;
    property Vencimiento: UnicodeString read Get_Vencimiento write Set_Vencimiento;
    property ModoIngreso: UnicodeString read Get_ModoIngreso write Set_ModoIngreso;
    property EsProvisorio: UnicodeString read Get_EsProvisorio write Set_EsProvisorio;
    property Plan: ShortInt read Get_Plan write Set_Plan;
  end;

{ IXMLMensajeADESFA_EncabezadoReceta_Preautorizacion }

  IXMLMensajeADESFA_EncabezadoReceta_Preautorizacion = interface(IXMLNode)
    ['{AA010444-11EA-4CA9-BACE-B38C9BFB21B1}']
    { Property Accessors }
    function Get_Codigo: UnicodeString;
    function Get_Fecha: UnicodeString;
    procedure Set_Codigo(Value: UnicodeString);
    procedure Set_Fecha(Value: UnicodeString);
    { Methods & Properties }
    property Codigo: UnicodeString read Get_Codigo write Set_Codigo;
    property Fecha: UnicodeString read Get_Fecha write Set_Fecha;
  end;

{ IXMLMensajeADESFA_EncabezadoReceta_Dispensa }

  IXMLMensajeADESFA_EncabezadoReceta_Dispensa = interface(IXMLNode)
    ['{025E2FE1-4D6C-4F57-AFEF-3E9476BD041F}']
    { Property Accessors }
    function Get_Fecha: Integer;
    function Get_Hora: Integer;
    procedure Set_Fecha(Value: Integer);
    procedure Set_Hora(Value: Integer);
    { Methods & Properties }
    property Fecha: Integer read Get_Fecha write Set_Fecha;
    property Hora: Integer read Get_Hora write Set_Hora;
  end;

{ IXMLMensajeADESFA_EncabezadoReceta_Formulario }

  IXMLMensajeADESFA_EncabezadoReceta_Formulario = interface(IXMLNode)
    ['{EB130FDF-8913-41E0-8EE5-46B6CBBABCC5}']
    { Property Accessors }
    function Get_Fecha: Integer;
    function Get_Tipo: UnicodeString;
    function Get_Numero: Int64;
    function Get_Serie: UnicodeString;
    procedure Set_Fecha(Value: Integer);
    procedure Set_Tipo(Value: UnicodeString);
    procedure Set_Numero(Value: Int64);
    procedure Set_Serie(Value: UnicodeString);
    { Methods & Properties }
    property Fecha: Integer read Get_Fecha write Set_Fecha;
    property Tipo: UnicodeString read Get_Tipo write Set_Tipo;
    property Numero: Int64 read Get_Numero write Set_Numero;
    property Serie: UnicodeString read Get_Serie write Set_Serie;
  end;

{ IXMLMensajeADESFA_EncabezadoReceta_Institucion }

  IXMLMensajeADESFA_EncabezadoReceta_Institucion = interface(IXMLNode)
    ['{A69E1E77-82F0-4FF8-92B3-3B8433F8F500}']
    { Property Accessors }
    function Get_Codigo: UnicodeString;
    function Get_Cuit: UnicodeString;
    function Get_Sucursal: UnicodeString;
    procedure Set_Codigo(Value: UnicodeString);
    procedure Set_Cuit(Value: UnicodeString);
    procedure Set_Sucursal(Value: UnicodeString);
    { Methods & Properties }
    property Codigo: UnicodeString read Get_Codigo write Set_Codigo;
    property Cuit: UnicodeString read Get_Cuit write Set_Cuit;
    property Sucursal: UnicodeString read Get_Sucursal write Set_Sucursal;
  end;

{ IXMLMensajeADESFA_EncabezadoReceta_Retira }

  IXMLMensajeADESFA_EncabezadoReceta_Retira = interface(IXMLNode)
    ['{640D9735-AC26-442B-A326-AF272D84129F}']
    { Property Accessors }
    function Get_Apellido: UnicodeString;
    function Get_Nombre: UnicodeString;
    function Get_TipoDoc: UnicodeString;
    function Get_NroDoc: UnicodeString;
    function Get_NroTelefono: UnicodeString;
    procedure Set_Apellido(Value: UnicodeString);
    procedure Set_Nombre(Value: UnicodeString);
    procedure Set_TipoDoc(Value: UnicodeString);
    procedure Set_NroDoc(Value: UnicodeString);
    procedure Set_NroTelefono(Value: UnicodeString);
    { Methods & Properties }
    property Apellido: UnicodeString read Get_Apellido write Set_Apellido;
    property Nombre: UnicodeString read Get_Nombre write Set_Nombre;
    property TipoDoc: UnicodeString read Get_TipoDoc write Set_TipoDoc;
    property NroDoc: UnicodeString read Get_NroDoc write Set_NroDoc;
    property NroTelefono: UnicodeString read Get_NroTelefono write Set_NroTelefono;
  end;

{ IXMLMensajeADESFA_DetalleReceta }

  IXMLMensajeADESFA_DetalleReceta = interface(IXMLNode)
    ['{EB7026F1-E729-430F-86C8-F4168D743888}']
    { Property Accessors }
    function Get_Item: IXMLMensajeADESFA_DetalleReceta_Item;
    { Methods & Properties }
    property Item: IXMLMensajeADESFA_DetalleReceta_Item read Get_Item;
  end;

{ IXMLMensajeADESFA_DetalleReceta_Item }

  IXMLMensajeADESFA_DetalleReceta_Item = interface(IXMLNode)
    ['{CB3FE972-6A80-4EBA-BEE2-AFEF79CAD961}']
    { Property Accessors }
    function Get_NroItem: ShortInt;
    function Get_CodBarras: Int64;
    function Get_CodTroquel: Integer;
    function Get_Alfabeta: UnicodeString;
    function Get_Kairos: UnicodeString;
    function Get_Codigo: UnicodeString;
    function Get_ImporteUnitario: Single;
    function Get_CantidadSolicitada: ShortInt;
    function Get_PorcentajeCobertura: Single;
    function Get_CodPreautorizacion: UnicodeString;
    function Get_ImporteCobertura: Single;
    function Get_ExcepcionPrescripcion: ShortInt;
    function Get_Diagnostico: UnicodeString;
    function Get_DosisDiaria: UnicodeString;
    function Get_DiasTratamiento: UnicodeString;
    function Get_Generico: UnicodeString;
    function Get_CodConflicto: UnicodeString;
    function Get_CodIntervencion: UnicodeString;
    function Get_CodAccion: UnicodeString;
    procedure Set_NroItem(Value: ShortInt);
    procedure Set_CodBarras(Value: Int64);
    procedure Set_CodTroquel(Value: Integer);
    procedure Set_Alfabeta(Value: UnicodeString);
    procedure Set_Kairos(Value: UnicodeString);
    procedure Set_Codigo(Value: UnicodeString);
    procedure Set_ImporteUnitario(Value: Single);
    procedure Set_CantidadSolicitada(Value: ShortInt);
    procedure Set_PorcentajeCobertura(Value: Single);
    procedure Set_CodPreautorizacion(Value: UnicodeString);
    procedure Set_ImporteCobertura(Value: Single);
    procedure Set_ExcepcionPrescripcion(Value: ShortInt);
    procedure Set_Diagnostico(Value: UnicodeString);
    procedure Set_DosisDiaria(Value: UnicodeString);
    procedure Set_DiasTratamiento(Value: UnicodeString);
    procedure Set_Generico(Value: UnicodeString);
    procedure Set_CodConflicto(Value: UnicodeString);
    procedure Set_CodIntervencion(Value: UnicodeString);
    procedure Set_CodAccion(Value: UnicodeString);
    { Methods & Properties }
    property NroItem: ShortInt read Get_NroItem write Set_NroItem;
    property CodBarras: Int64 read Get_CodBarras write Set_CodBarras;
    property CodTroquel: Integer read Get_CodTroquel write Set_CodTroquel;
    property Alfabeta: UnicodeString read Get_Alfabeta write Set_Alfabeta;
    property Kairos: UnicodeString read Get_Kairos write Set_Kairos;
    property Codigo: UnicodeString read Get_Codigo write Set_Codigo;
    property ImporteUnitario: Single read Get_ImporteUnitario write Set_ImporteUnitario;
    property CantidadSolicitada: ShortInt read Get_CantidadSolicitada write Set_CantidadSolicitada;
    property PorcentajeCobertura: Single read Get_PorcentajeCobertura write Set_PorcentajeCobertura;
    property CodPreautorizacion: UnicodeString read Get_CodPreautorizacion write Set_CodPreautorizacion;
    property ImporteCobertura: Single read Get_ImporteCobertura write Set_ImporteCobertura;
    property ExcepcionPrescripcion: ShortInt read Get_ExcepcionPrescripcion write Set_ExcepcionPrescripcion;
    property Diagnostico: UnicodeString read Get_Diagnostico write Set_Diagnostico;
    property DosisDiaria: UnicodeString read Get_DosisDiaria write Set_DosisDiaria;
    property DiasTratamiento: UnicodeString read Get_DiasTratamiento write Set_DiasTratamiento;
    property Generico: UnicodeString read Get_Generico write Set_Generico;
    property CodConflicto: UnicodeString read Get_CodConflicto write Set_CodConflicto;
    property CodIntervencion: UnicodeString read Get_CodIntervencion write Set_CodIntervencion;
    property CodAccion: UnicodeString read Get_CodAccion write Set_CodAccion;
  end;

{ Forward Decls }

  TXMLMensajeADESFA = class;
  TXMLMensajeADESFA_EncabezadoMensaje = class;
  TXMLMensajeADESFA_EncabezadoMensaje_InicioTrx = class;
  TXMLMensajeADESFA_EncabezadoMensaje_Terminal = class;
  TXMLMensajeADESFA_EncabezadoMensaje_Software = class;
  TXMLMensajeADESFA_EncabezadoMensaje_Validador = class;
  TXMLMensajeADESFA_EncabezadoMensaje_Prestador = class;
  TXMLMensajeADESFA_EncabezadoReceta = class;
  TXMLMensajeADESFA_EncabezadoReceta_Prescriptor = class;
  TXMLMensajeADESFA_EncabezadoReceta_Beneficiario = class;
  TXMLMensajeADESFA_EncabezadoReceta_Financiador = class;
  TXMLMensajeADESFA_EncabezadoReceta_Credencial = class;
  TXMLMensajeADESFA_EncabezadoReceta_Preautorizacion = class;
  TXMLMensajeADESFA_EncabezadoReceta_Dispensa = class;
  TXMLMensajeADESFA_EncabezadoReceta_Formulario = class;
  TXMLMensajeADESFA_EncabezadoReceta_Institucion = class;
  TXMLMensajeADESFA_EncabezadoReceta_Retira = class;
  TXMLMensajeADESFA_DetalleReceta = class;
  TXMLMensajeADESFA_DetalleReceta_Item = class;

{ TXMLMensajeADESFA }

  TXMLMensajeADESFA = class(TXMLNode, IXMLMensajeADESFA)
  protected
    { IXMLMensajeADESFA }
    function Get_Version: STRING;
    function Get_EncabezadoMensaje: IXMLMensajeADESFA_EncabezadoMensaje;
    function Get_EncabezadoReceta: IXMLMensajeADESFA_EncabezadoReceta;
    function Get_DetalleReceta: IXMLMensajeADESFA_DetalleReceta;
    procedure Set_Version(Value: STRING);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLMensajeADESFA_EncabezadoMensaje }

  TXMLMensajeADESFA_EncabezadoMensaje = class(TXMLNode, IXMLMensajeADESFA_EncabezadoMensaje)
  protected
    { IXMLMensajeADESFA_EncabezadoMensaje }
    function Get_TipoMsj: SmallInt;
    function Get_CodAccion: Integer;
    function Get_IdMsj: Integer;
    function Get_InicioTrx: IXMLMensajeADESFA_EncabezadoMensaje_InicioTrx;
    function Get_Terminal: IXMLMensajeADESFA_EncabezadoMensaje_Terminal;
    function Get_Software: IXMLMensajeADESFA_EncabezadoMensaje_Software;
    function Get_Validador: IXMLMensajeADESFA_EncabezadoMensaje_Validador;
    function Get_VersionMsj: Single;
    function Get_Prestador: IXMLMensajeADESFA_EncabezadoMensaje_Prestador;
    function Get_SetCaracteres: UnicodeString;
    procedure Set_TipoMsj(Value: SmallInt);
    procedure Set_CodAccion(Value: Integer);
    procedure Set_IdMsj(Value: Integer);
    procedure Set_VersionMsj(Value: Single);
    procedure Set_SetCaracteres(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLMensajeADESFA_EncabezadoMensaje_InicioTrx }

  TXMLMensajeADESFA_EncabezadoMensaje_InicioTrx = class(TXMLNode, IXMLMensajeADESFA_EncabezadoMensaje_InicioTrx)
  protected
    { IXMLMensajeADESFA_EncabezadoMensaje_InicioTrx }
    function Get_Fecha: Integer;
    function Get_Hora: Integer;
    procedure Set_Fecha(Value: Integer);
    procedure Set_Hora(Value: Integer);
  end;

{ TXMLMensajeADESFA_EncabezadoMensaje_Terminal }

  TXMLMensajeADESFA_EncabezadoMensaje_Terminal = class(TXMLNode, IXMLMensajeADESFA_EncabezadoMensaje_Terminal)
  protected
    { IXMLMensajeADESFA_EncabezadoMensaje_Terminal }
    function Get_Tipo: UnicodeString;
    function Get_Numero: ShortInt;
    procedure Set_Tipo(Value: UnicodeString);
    procedure Set_Numero(Value: ShortInt);
  end;

{ TXMLMensajeADESFA_EncabezadoMensaje_Software }

  TXMLMensajeADESFA_EncabezadoMensaje_Software = class(TXMLNode, IXMLMensajeADESFA_EncabezadoMensaje_Software)
  protected
    { IXMLMensajeADESFA_EncabezadoMensaje_Software }
    function Get_Nombre: UnicodeString;
    function Get_Version: UnicodeString;
    procedure Set_Nombre(Value: UnicodeString);
    procedure Set_Version(Value: UnicodeString);
  end;

{ TXMLMensajeADESFA_EncabezadoMensaje_Validador }

  TXMLMensajeADESFA_EncabezadoMensaje_Validador = class(TXMLNode, IXMLMensajeADESFA_EncabezadoMensaje_Validador)
  protected
    { IXMLMensajeADESFA_EncabezadoMensaje_Validador }
    function Get_Nombre: UnicodeString;
    function Get_Version: UnicodeString;
    procedure Set_Nombre(Value: UnicodeString);
    procedure Set_Version(Value: UnicodeString);
  end;

{ TXMLMensajeADESFA_EncabezadoMensaje_Prestador }

  TXMLMensajeADESFA_EncabezadoMensaje_Prestador = class(TXMLNode, IXMLMensajeADESFA_EncabezadoMensaje_Prestador)
  protected
    { IXMLMensajeADESFA_EncabezadoMensaje_Prestador }
    function Get_Cuit: UnicodeString;
    function Get_Sucursal: UnicodeString;
    function Get_RazonSocial: UnicodeString;
    function Get_Codigo: Int64;
    procedure Set_Cuit(Value: UnicodeString);
    procedure Set_Sucursal(Value: UnicodeString);
    procedure Set_RazonSocial(Value: UnicodeString);
    procedure Set_Codigo(Value: Int64);
  end;

{ TXMLMensajeADESFA_EncabezadoReceta }

  TXMLMensajeADESFA_EncabezadoReceta = class(TXMLNode, IXMLMensajeADESFA_EncabezadoReceta)
  protected
    { IXMLMensajeADESFA_EncabezadoReceta }
    function Get_Prescriptor: IXMLMensajeADESFA_EncabezadoReceta_Prescriptor;
    function Get_Beneficiario: IXMLMensajeADESFA_EncabezadoReceta_Beneficiario;
    function Get_Financiador: IXMLMensajeADESFA_EncabezadoReceta_Financiador;
    function Get_Credencial: IXMLMensajeADESFA_EncabezadoReceta_Credencial;
    function Get_CoberturaEspecial: UnicodeString;
    function Get_Preautorizacion: IXMLMensajeADESFA_EncabezadoReceta_Preautorizacion;
    function Get_FechaReceta: Integer;
    function Get_Dispensa: IXMLMensajeADESFA_EncabezadoReceta_Dispensa;
    function Get_Formulario: IXMLMensajeADESFA_EncabezadoReceta_Formulario;
    function Get_TipoTratamiento: UnicodeString;
    function Get_Diagnostico: UnicodeString;
    function Get_Institucion: IXMLMensajeADESFA_EncabezadoReceta_Institucion;
    function Get_Retira: IXMLMensajeADESFA_EncabezadoReceta_Retira;
    procedure Set_CoberturaEspecial(Value: UnicodeString);
    procedure Set_FechaReceta(Value: Integer);
    procedure Set_TipoTratamiento(Value: UnicodeString);
    procedure Set_Diagnostico(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLMensajeADESFA_EncabezadoReceta_Prescriptor }

  TXMLMensajeADESFA_EncabezadoReceta_Prescriptor = class(TXMLNode, IXMLMensajeADESFA_EncabezadoReceta_Prescriptor)
  protected
    { IXMLMensajeADESFA_EncabezadoReceta_Prescriptor }
    function Get_Apellido: UnicodeString;
    function Get_Nombre: UnicodeString;
    function Get_TipoMatricula: UnicodeString;
    function Get_Provincia: UnicodeString;
    function Get_NroMatricula: SmallInt;
    function Get_TipoPrescriptor: UnicodeString;
    function Get_Cuit: UnicodeString;
    function Get_Especialidad: UnicodeString;
    procedure Set_Apellido(Value: UnicodeString);
    procedure Set_Nombre(Value: UnicodeString);
    procedure Set_TipoMatricula(Value: UnicodeString);
    procedure Set_Provincia(Value: UnicodeString);
    procedure Set_NroMatricula(Value: SmallInt);
    procedure Set_TipoPrescriptor(Value: UnicodeString);
    procedure Set_Cuit(Value: UnicodeString);
    procedure Set_Especialidad(Value: UnicodeString);
  end;

{ TXMLMensajeADESFA_EncabezadoReceta_Beneficiario }

  TXMLMensajeADESFA_EncabezadoReceta_Beneficiario = class(TXMLNode, IXMLMensajeADESFA_EncabezadoReceta_Beneficiario)
  protected
    { IXMLMensajeADESFA_EncabezadoReceta_Beneficiario }
    function Get_TipoDoc: UnicodeString;
    function Get_NroDoc: UnicodeString;
    function Get_Apellido: UnicodeString;
    function Get_Nombre: UnicodeString;
    function Get_Sexo: UnicodeString;
    function Get_FechaNacimiento: UnicodeString;
    function Get_Parentesco: UnicodeString;
    function Get_EdadUnidad: UnicodeString;
    function Get_Edad: ShortInt;
    procedure Set_TipoDoc(Value: UnicodeString);
    procedure Set_NroDoc(Value: UnicodeString);
    procedure Set_Apellido(Value: UnicodeString);
    procedure Set_Nombre(Value: UnicodeString);
    procedure Set_Sexo(Value: UnicodeString);
    procedure Set_FechaNacimiento(Value: UnicodeString);
    procedure Set_Parentesco(Value: UnicodeString);
    procedure Set_EdadUnidad(Value: UnicodeString);
    procedure Set_Edad(Value: ShortInt);
  end;

{ TXMLMensajeADESFA_EncabezadoReceta_Financiador }

  TXMLMensajeADESFA_EncabezadoReceta_Financiador = class(TXMLNode, IXMLMensajeADESFA_EncabezadoReceta_Financiador)
  protected
    { IXMLMensajeADESFA_EncabezadoReceta_Financiador }
    function Get_Codigo: ShortInt;
    function Get_Cuit: UnicodeString;
    function Get_Sucursal: UnicodeString;
    procedure Set_Codigo(Value: ShortInt);
    procedure Set_Cuit(Value: UnicodeString);
    procedure Set_Sucursal(Value: UnicodeString);
  end;

{ TXMLMensajeADESFA_EncabezadoReceta_Credencial }

  TXMLMensajeADESFA_EncabezadoReceta_Credencial = class(TXMLNode, IXMLMensajeADESFA_EncabezadoReceta_Credencial)
  protected
    { IXMLMensajeADESFA_EncabezadoReceta_Credencial }
    function Get_Numero: Int64;
    function Get_Track: UnicodeString;
    function Get_Version: UnicodeString;
    function Get_Vencimiento: UnicodeString;
    function Get_ModoIngreso: UnicodeString;
    function Get_EsProvisorio: UnicodeString;
    function Get_Plan: ShortInt;
    procedure Set_Numero(Value: Int64);
    procedure Set_Track(Value: UnicodeString);
    procedure Set_Version(Value: UnicodeString);
    procedure Set_Vencimiento(Value: UnicodeString);
    procedure Set_ModoIngreso(Value: UnicodeString);
    procedure Set_EsProvisorio(Value: UnicodeString);
    procedure Set_Plan(Value: ShortInt);
  end;

{ TXMLMensajeADESFA_EncabezadoReceta_Preautorizacion }

  TXMLMensajeADESFA_EncabezadoReceta_Preautorizacion = class(TXMLNode, IXMLMensajeADESFA_EncabezadoReceta_Preautorizacion)
  protected
    { IXMLMensajeADESFA_EncabezadoReceta_Preautorizacion }
    function Get_Codigo: UnicodeString;
    function Get_Fecha: UnicodeString;
    procedure Set_Codigo(Value: UnicodeString);
    procedure Set_Fecha(Value: UnicodeString);
  end;

{ TXMLMensajeADESFA_EncabezadoReceta_Dispensa }

  TXMLMensajeADESFA_EncabezadoReceta_Dispensa = class(TXMLNode, IXMLMensajeADESFA_EncabezadoReceta_Dispensa)
  protected
    { IXMLMensajeADESFA_EncabezadoReceta_Dispensa }
    function Get_Fecha: Integer;
    function Get_Hora: Integer;
    procedure Set_Fecha(Value: Integer);
    procedure Set_Hora(Value: Integer);
  end;

{ TXMLMensajeADESFA_EncabezadoReceta_Formulario }

  TXMLMensajeADESFA_EncabezadoReceta_Formulario = class(TXMLNode, IXMLMensajeADESFA_EncabezadoReceta_Formulario)
  protected
    { IXMLMensajeADESFA_EncabezadoReceta_Formulario }
    function Get_Fecha: Integer;
    function Get_Tipo: UnicodeString;
    function Get_Numero: Int64;
    function Get_Serie: UnicodeString;
    procedure Set_Fecha(Value: Integer);
    procedure Set_Tipo(Value: UnicodeString);
    procedure Set_Numero(Value: Int64);
    procedure Set_Serie(Value: UnicodeString);
  end;

{ TXMLMensajeADESFA_EncabezadoReceta_Institucion }

  TXMLMensajeADESFA_EncabezadoReceta_Institucion = class(TXMLNode, IXMLMensajeADESFA_EncabezadoReceta_Institucion)
  protected
    { IXMLMensajeADESFA_EncabezadoReceta_Institucion }
    function Get_Codigo: UnicodeString;
    function Get_Cuit: UnicodeString;
    function Get_Sucursal: UnicodeString;
    procedure Set_Codigo(Value: UnicodeString);
    procedure Set_Cuit(Value: UnicodeString);
    procedure Set_Sucursal(Value: UnicodeString);
  end;

{ TXMLMensajeADESFA_EncabezadoReceta_Retira }

  TXMLMensajeADESFA_EncabezadoReceta_Retira = class(TXMLNode, IXMLMensajeADESFA_EncabezadoReceta_Retira)
  protected
    { IXMLMensajeADESFA_EncabezadoReceta_Retira }
    function Get_Apellido: UnicodeString;
    function Get_Nombre: UnicodeString;
    function Get_TipoDoc: UnicodeString;
    function Get_NroDoc: UnicodeString;
    function Get_NroTelefono: UnicodeString;
    procedure Set_Apellido(Value: UnicodeString);
    procedure Set_Nombre(Value: UnicodeString);
    procedure Set_TipoDoc(Value: UnicodeString);
    procedure Set_NroDoc(Value: UnicodeString);
    procedure Set_NroTelefono(Value: UnicodeString);
  end;

{ TXMLMensajeADESFA_DetalleReceta }

  TXMLMensajeADESFA_DetalleReceta = class(TXMLNode, IXMLMensajeADESFA_DetalleReceta)
  protected
    { IXMLMensajeADESFA_DetalleReceta }
    function Get_Item: IXMLMensajeADESFA_DetalleReceta_Item;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLMensajeADESFA_DetalleReceta_Item }

  TXMLMensajeADESFA_DetalleReceta_Item = class(TXMLNode, IXMLMensajeADESFA_DetalleReceta_Item)
  protected
    { IXMLMensajeADESFA_DetalleReceta_Item }
    function Get_NroItem: ShortInt;
    function Get_CodBarras: Int64;
    function Get_CodTroquel: Integer;
    function Get_Alfabeta: UnicodeString;
    function Get_Kairos: UnicodeString;
    function Get_Codigo: UnicodeString;
    function Get_ImporteUnitario: Single;
    function Get_CantidadSolicitada: ShortInt;
    function Get_PorcentajeCobertura: Single;
    function Get_CodPreautorizacion: UnicodeString;
    function Get_ImporteCobertura: Single;
    function Get_ExcepcionPrescripcion: ShortInt;
    function Get_Diagnostico: UnicodeString;
    function Get_DosisDiaria: UnicodeString;
    function Get_DiasTratamiento: UnicodeString;
    function Get_Generico: UnicodeString;
    function Get_CodConflicto: UnicodeString;
    function Get_CodIntervencion: UnicodeString;
    function Get_CodAccion: UnicodeString;
    procedure Set_NroItem(Value: ShortInt);
    procedure Set_CodBarras(Value: Int64);
    procedure Set_CodTroquel(Value: Integer);
    procedure Set_Alfabeta(Value: UnicodeString);
    procedure Set_Kairos(Value: UnicodeString);
    procedure Set_Codigo(Value: UnicodeString);
    procedure Set_ImporteUnitario(Value: Single);
    procedure Set_CantidadSolicitada(Value: ShortInt);
    procedure Set_PorcentajeCobertura(Value: Single);
    procedure Set_CodPreautorizacion(Value: UnicodeString);
    procedure Set_ImporteCobertura(Value: Single);
    procedure Set_ExcepcionPrescripcion(Value: ShortInt);
    procedure Set_Diagnostico(Value: UnicodeString);
    procedure Set_DosisDiaria(Value: UnicodeString);
    procedure Set_DiasTratamiento(Value: UnicodeString);
    procedure Set_Generico(Value: UnicodeString);
    procedure Set_CodConflicto(Value: UnicodeString);
    procedure Set_CodIntervencion(Value: UnicodeString);
    procedure Set_CodAccion(Value: UnicodeString);
  end;

{ Global Functions }

function GetMensajeADESFA(Doc: IXMLDocument): IXMLMensajeADESFA;
function LoadMensajeADESFA(const FileName: string): IXMLMensajeADESFA;
function NewMensajeADESFA: IXMLMensajeADESFA;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetMensajeADESFA(Doc: IXMLDocument): IXMLMensajeADESFA;
begin
  Result := Doc.GetDocBinding('MensajeADESFA', TXMLMensajeADESFA, TargetNamespace) as IXMLMensajeADESFA;
end;

function LoadMensajeADESFA(const FileName: string): IXMLMensajeADESFA;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('MensajeADESFA', TXMLMensajeADESFA, TargetNamespace) as IXMLMensajeADESFA;
end;

function NewMensajeADESFA: IXMLMensajeADESFA;
begin
  Result := NewXMLDocument.GetDocBinding('MensajeADESFA', TXMLMensajeADESFA, TargetNamespace) as IXMLMensajeADESFA;
end;

{ TXMLMensajeADESFA }

procedure TXMLMensajeADESFA.AfterConstruction;
begin
  RegisterChildNode('EncabezadoMensaje', TXMLMensajeADESFA_EncabezadoMensaje);
  RegisterChildNode('EncabezadoReceta', TXMLMensajeADESFA_EncabezadoReceta);
  RegisterChildNode('DetalleReceta', TXMLMensajeADESFA_DetalleReceta);
  inherited;
end;

function TXMLMensajeADESFA.Get_Version: STRING;
begin
  Result := AttributeNodes['version'].NodeValue;
end;

procedure TXMLMensajeADESFA.Set_Version(Value: STRING);
begin
  SetAttribute('version', Value);
end;

function TXMLMensajeADESFA.Get_EncabezadoMensaje: IXMLMensajeADESFA_EncabezadoMensaje;
begin
  Result := ChildNodes['EncabezadoMensaje'] as IXMLMensajeADESFA_EncabezadoMensaje;
end;

function TXMLMensajeADESFA.Get_EncabezadoReceta: IXMLMensajeADESFA_EncabezadoReceta;
begin
  Result := ChildNodes['EncabezadoReceta'] as IXMLMensajeADESFA_EncabezadoReceta;
end;

function TXMLMensajeADESFA.Get_DetalleReceta: IXMLMensajeADESFA_DetalleReceta;
begin
  Result := ChildNodes['DetalleReceta'] as IXMLMensajeADESFA_DetalleReceta;
end;

{ TXMLMensajeADESFA_EncabezadoMensaje }

procedure TXMLMensajeADESFA_EncabezadoMensaje.AfterConstruction;
begin
  RegisterChildNode('InicioTrx', TXMLMensajeADESFA_EncabezadoMensaje_InicioTrx);
  RegisterChildNode('Terminal', TXMLMensajeADESFA_EncabezadoMensaje_Terminal);
  RegisterChildNode('Software', TXMLMensajeADESFA_EncabezadoMensaje_Software);
  RegisterChildNode('Validador', TXMLMensajeADESFA_EncabezadoMensaje_Validador);
  RegisterChildNode('Prestador', TXMLMensajeADESFA_EncabezadoMensaje_Prestador);
  inherited;
end;

function TXMLMensajeADESFA_EncabezadoMensaje.Get_TipoMsj: SmallInt;
begin
  Result := ChildNodes['TipoMsj'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje.Set_TipoMsj(Value: SmallInt);
begin
  ChildNodes['TipoMsj'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoMensaje.Get_CodAccion: Integer;
begin
  Result := ChildNodes['CodAccion'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje.Set_CodAccion(Value: Integer);
begin
  ChildNodes['CodAccion'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoMensaje.Get_IdMsj: Integer;
begin
  Result := ChildNodes['IdMsj'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje.Set_IdMsj(Value: Integer);
begin
  ChildNodes['IdMsj'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoMensaje.Get_InicioTrx: IXMLMensajeADESFA_EncabezadoMensaje_InicioTrx;
begin
  Result := ChildNodes['InicioTrx'] as IXMLMensajeADESFA_EncabezadoMensaje_InicioTrx;
end;

function TXMLMensajeADESFA_EncabezadoMensaje.Get_Terminal: IXMLMensajeADESFA_EncabezadoMensaje_Terminal;
begin
  Result := ChildNodes['Terminal'] as IXMLMensajeADESFA_EncabezadoMensaje_Terminal;
end;

function TXMLMensajeADESFA_EncabezadoMensaje.Get_Software: IXMLMensajeADESFA_EncabezadoMensaje_Software;
begin
  Result := ChildNodes['Software'] as IXMLMensajeADESFA_EncabezadoMensaje_Software;
end;

function TXMLMensajeADESFA_EncabezadoMensaje.Get_Validador: IXMLMensajeADESFA_EncabezadoMensaje_Validador;
begin
  Result := ChildNodes['Validador'] as IXMLMensajeADESFA_EncabezadoMensaje_Validador;
end;

function TXMLMensajeADESFA_EncabezadoMensaje.Get_VersionMsj: Single;
begin
  Result := ChildNodes['VersionMsj'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje.Set_VersionMsj(Value: Single);
begin
  ChildNodes['VersionMsj'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoMensaje.Get_Prestador: IXMLMensajeADESFA_EncabezadoMensaje_Prestador;
begin
  Result := ChildNodes['Prestador'] as IXMLMensajeADESFA_EncabezadoMensaje_Prestador;
end;

function TXMLMensajeADESFA_EncabezadoMensaje.Get_SetCaracteres: UnicodeString;
begin
  Result := ChildNodes['SetCaracteres'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje.Set_SetCaracteres(Value: UnicodeString);
begin
  ChildNodes['SetCaracteres'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoMensaje_InicioTrx }

function TXMLMensajeADESFA_EncabezadoMensaje_InicioTrx.Get_Fecha: Integer;
begin
  Result := ChildNodes['Fecha'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje_InicioTrx.Set_Fecha(Value: Integer);
begin
  ChildNodes['Fecha'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoMensaje_InicioTrx.Get_Hora: Integer;
begin
  Result := ChildNodes['Hora'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje_InicioTrx.Set_Hora(Value: Integer);
begin
  ChildNodes['Hora'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoMensaje_Terminal }

function TXMLMensajeADESFA_EncabezadoMensaje_Terminal.Get_Tipo: UnicodeString;
begin
  Result := ChildNodes['Tipo'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje_Terminal.Set_Tipo(Value: UnicodeString);
begin
  ChildNodes['Tipo'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoMensaje_Terminal.Get_Numero: ShortInt;
begin
  Result := ChildNodes['Numero'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje_Terminal.Set_Numero(Value: ShortInt);
begin
  ChildNodes['Numero'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoMensaje_Software }

function TXMLMensajeADESFA_EncabezadoMensaje_Software.Get_Nombre: UnicodeString;
begin
  Result := ChildNodes['Nombre'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje_Software.Set_Nombre(Value: UnicodeString);
begin
  ChildNodes['Nombre'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoMensaje_Software.Get_Version: UnicodeString;
begin
  Result := ChildNodes['Version'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje_Software.Set_Version(Value: UnicodeString);
begin
  ChildNodes['Version'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoMensaje_Validador }

function TXMLMensajeADESFA_EncabezadoMensaje_Validador.Get_Nombre: UnicodeString;
begin
  Result := ChildNodes['Nombre'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje_Validador.Set_Nombre(Value: UnicodeString);
begin
  ChildNodes['Nombre'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoMensaje_Validador.Get_Version: UnicodeString;
begin
  Result := ChildNodes['Version'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje_Validador.Set_Version(Value: UnicodeString);
begin
  ChildNodes['Version'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoMensaje_Prestador }

function TXMLMensajeADESFA_EncabezadoMensaje_Prestador.Get_Cuit: UnicodeString;
begin
  Result := ChildNodes['Cuit'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje_Prestador.Set_Cuit(Value: UnicodeString);
begin
  ChildNodes['Cuit'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoMensaje_Prestador.Get_Sucursal: UnicodeString;
begin
  Result := ChildNodes['Sucursal'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje_Prestador.Set_Sucursal(Value: UnicodeString);
begin
  ChildNodes['Sucursal'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoMensaje_Prestador.Get_RazonSocial: UnicodeString;
begin
  Result := ChildNodes['RazonSocial'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje_Prestador.Set_RazonSocial(Value: UnicodeString);
begin
  ChildNodes['RazonSocial'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoMensaje_Prestador.Get_Codigo: Int64;
begin
  Result := ChildNodes['Codigo'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoMensaje_Prestador.Set_Codigo(Value: Int64);
begin
  ChildNodes['Codigo'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoReceta }

procedure TXMLMensajeADESFA_EncabezadoReceta.AfterConstruction;
begin
  RegisterChildNode('Prescriptor', TXMLMensajeADESFA_EncabezadoReceta_Prescriptor);
  RegisterChildNode('Beneficiario', TXMLMensajeADESFA_EncabezadoReceta_Beneficiario);
  RegisterChildNode('Financiador', TXMLMensajeADESFA_EncabezadoReceta_Financiador);
  RegisterChildNode('Credencial', TXMLMensajeADESFA_EncabezadoReceta_Credencial);
  RegisterChildNode('Preautorizacion', TXMLMensajeADESFA_EncabezadoReceta_Preautorizacion);
  RegisterChildNode('Dispensa', TXMLMensajeADESFA_EncabezadoReceta_Dispensa);
  RegisterChildNode('Formulario', TXMLMensajeADESFA_EncabezadoReceta_Formulario);
  RegisterChildNode('Institucion', TXMLMensajeADESFA_EncabezadoReceta_Institucion);
  RegisterChildNode('Retira', TXMLMensajeADESFA_EncabezadoReceta_Retira);
  inherited;
end;

function TXMLMensajeADESFA_EncabezadoReceta.Get_Prescriptor: IXMLMensajeADESFA_EncabezadoReceta_Prescriptor;
begin
  Result := ChildNodes['Prescriptor'] as IXMLMensajeADESFA_EncabezadoReceta_Prescriptor;
end;

function TXMLMensajeADESFA_EncabezadoReceta.Get_Beneficiario: IXMLMensajeADESFA_EncabezadoReceta_Beneficiario;
begin
  Result := ChildNodes['Beneficiario'] as IXMLMensajeADESFA_EncabezadoReceta_Beneficiario;
end;

function TXMLMensajeADESFA_EncabezadoReceta.Get_Financiador: IXMLMensajeADESFA_EncabezadoReceta_Financiador;
begin
  Result := ChildNodes['Financiador'] as IXMLMensajeADESFA_EncabezadoReceta_Financiador;
end;

function TXMLMensajeADESFA_EncabezadoReceta.Get_Credencial: IXMLMensajeADESFA_EncabezadoReceta_Credencial;
begin
  Result := ChildNodes['Credencial'] as IXMLMensajeADESFA_EncabezadoReceta_Credencial;
end;

function TXMLMensajeADESFA_EncabezadoReceta.Get_CoberturaEspecial: UnicodeString;
begin
  Result := ChildNodes['CoberturaEspecial'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta.Set_CoberturaEspecial(Value: UnicodeString);
begin
  ChildNodes['CoberturaEspecial'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta.Get_Preautorizacion: IXMLMensajeADESFA_EncabezadoReceta_Preautorizacion;
begin
  Result := ChildNodes['Preautorizacion'] as IXMLMensajeADESFA_EncabezadoReceta_Preautorizacion;
end;

function TXMLMensajeADESFA_EncabezadoReceta.Get_FechaReceta: Integer;
begin
  Result := ChildNodes['FechaReceta'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta.Set_FechaReceta(Value: Integer);
begin
  ChildNodes['FechaReceta'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta.Get_Dispensa: IXMLMensajeADESFA_EncabezadoReceta_Dispensa;
begin
  Result := ChildNodes['Dispensa'] as IXMLMensajeADESFA_EncabezadoReceta_Dispensa;
end;

function TXMLMensajeADESFA_EncabezadoReceta.Get_Formulario: IXMLMensajeADESFA_EncabezadoReceta_Formulario;
begin
  Result := ChildNodes['Formulario'] as IXMLMensajeADESFA_EncabezadoReceta_Formulario;
end;

function TXMLMensajeADESFA_EncabezadoReceta.Get_TipoTratamiento: UnicodeString;
begin
  Result := ChildNodes['TipoTratamiento'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta.Set_TipoTratamiento(Value: UnicodeString);
begin
  ChildNodes['TipoTratamiento'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta.Get_Diagnostico: UnicodeString;
begin
  Result := ChildNodes['Diagnostico'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta.Set_Diagnostico(Value: UnicodeString);
begin
  ChildNodes['Diagnostico'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta.Get_Institucion: IXMLMensajeADESFA_EncabezadoReceta_Institucion;
begin
  Result := ChildNodes['Institucion'] as IXMLMensajeADESFA_EncabezadoReceta_Institucion;
end;

function TXMLMensajeADESFA_EncabezadoReceta.Get_Retira: IXMLMensajeADESFA_EncabezadoReceta_Retira;
begin
  Result := ChildNodes['Retira'] as IXMLMensajeADESFA_EncabezadoReceta_Retira;
end;

{ TXMLMensajeADESFA_EncabezadoReceta_Prescriptor }

function TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Get_Apellido: UnicodeString;
begin
  Result := ChildNodes['Apellido'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Set_Apellido(Value: UnicodeString);
begin
  ChildNodes['Apellido'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Get_Nombre: UnicodeString;
begin
  Result := ChildNodes['Nombre'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Set_Nombre(Value: UnicodeString);
begin
  ChildNodes['Nombre'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Get_TipoMatricula: UnicodeString;
begin
  Result := ChildNodes['TipoMatricula'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Set_TipoMatricula(Value: UnicodeString);
begin
  ChildNodes['TipoMatricula'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Get_Provincia: UnicodeString;
begin
  Result := ChildNodes['Provincia'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Set_Provincia(Value: UnicodeString);
begin
  ChildNodes['Provincia'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Get_NroMatricula: SmallInt;
begin
  Result := ChildNodes['NroMatricula'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Set_NroMatricula(Value: SmallInt);
begin
  ChildNodes['NroMatricula'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Get_TipoPrescriptor: UnicodeString;
begin
  Result := ChildNodes['TipoPrescriptor'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Set_TipoPrescriptor(Value: UnicodeString);
begin
  ChildNodes['TipoPrescriptor'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Get_Cuit: UnicodeString;
begin
  Result := ChildNodes['Cuit'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Set_Cuit(Value: UnicodeString);
begin
  ChildNodes['Cuit'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Get_Especialidad: UnicodeString;
begin
  Result := ChildNodes['Especialidad'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Prescriptor.Set_Especialidad(Value: UnicodeString);
begin
  ChildNodes['Especialidad'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoReceta_Beneficiario }

function TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Get_TipoDoc: UnicodeString;
begin
  Result := ChildNodes['TipoDoc'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Set_TipoDoc(Value: UnicodeString);
begin
  ChildNodes['TipoDoc'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Get_NroDoc: UnicodeString;
begin
  Result := ChildNodes['NroDoc'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Set_NroDoc(Value: UnicodeString);
begin
  ChildNodes['NroDoc'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Get_Apellido: UnicodeString;
begin
  Result := ChildNodes['Apellido'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Set_Apellido(Value: UnicodeString);
begin
  ChildNodes['Apellido'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Get_Nombre: UnicodeString;
begin
  Result := ChildNodes['Nombre'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Set_Nombre(Value: UnicodeString);
begin
  ChildNodes['Nombre'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Get_Sexo: UnicodeString;
begin
  Result := ChildNodes['Sexo'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Set_Sexo(Value: UnicodeString);
begin
  ChildNodes['Sexo'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Get_FechaNacimiento: UnicodeString;
begin
  Result := ChildNodes['FechaNacimiento'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Set_FechaNacimiento(Value: UnicodeString);
begin
  ChildNodes['FechaNacimiento'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Get_Parentesco: UnicodeString;
begin
  Result := ChildNodes['Parentesco'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Set_Parentesco(Value: UnicodeString);
begin
  ChildNodes['Parentesco'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Get_EdadUnidad: UnicodeString;
begin
  Result := ChildNodes['EdadUnidad'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Set_EdadUnidad(Value: UnicodeString);
begin
  ChildNodes['EdadUnidad'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Get_Edad: ShortInt;
begin
  Result := ChildNodes['Edad'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Beneficiario.Set_Edad(Value: ShortInt);
begin
  ChildNodes['Edad'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoReceta_Financiador }

function TXMLMensajeADESFA_EncabezadoReceta_Financiador.Get_Codigo: ShortInt;
begin
  Result := ChildNodes['Codigo'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Financiador.Set_Codigo(Value: ShortInt);
begin
  ChildNodes['Codigo'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Financiador.Get_Cuit: UnicodeString;
begin
  Result := ChildNodes['Cuit'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Financiador.Set_Cuit(Value: UnicodeString);
begin
  ChildNodes['Cuit'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Financiador.Get_Sucursal: UnicodeString;
begin
  Result := ChildNodes['Sucursal'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Financiador.Set_Sucursal(Value: UnicodeString);
begin
  ChildNodes['Sucursal'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoReceta_Credencial }

function TXMLMensajeADESFA_EncabezadoReceta_Credencial.Get_Numero: Int64;
begin
  Result := ChildNodes['Numero'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Credencial.Set_Numero(Value: Int64);
begin
  ChildNodes['Numero'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Credencial.Get_Track: UnicodeString;
begin
  Result := ChildNodes['Track'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Credencial.Set_Track(Value: UnicodeString);
begin
  ChildNodes['Track'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Credencial.Get_Version: UnicodeString;
begin
  Result := ChildNodes['Version'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Credencial.Set_Version(Value: UnicodeString);
begin
  ChildNodes['Version'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Credencial.Get_Vencimiento: UnicodeString;
begin
  Result := ChildNodes['Vencimiento'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Credencial.Set_Vencimiento(Value: UnicodeString);
begin
  ChildNodes['Vencimiento'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Credencial.Get_ModoIngreso: UnicodeString;
begin
  Result := ChildNodes['ModoIngreso'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Credencial.Set_ModoIngreso(Value: UnicodeString);
begin
  ChildNodes['ModoIngreso'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Credencial.Get_EsProvisorio: UnicodeString;
begin
  Result := ChildNodes['EsProvisorio'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Credencial.Set_EsProvisorio(Value: UnicodeString);
begin
  ChildNodes['EsProvisorio'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Credencial.Get_Plan: ShortInt;
begin
  Result := ChildNodes['Plan'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Credencial.Set_Plan(Value: ShortInt);
begin
  ChildNodes['Plan'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoReceta_Preautorizacion }

function TXMLMensajeADESFA_EncabezadoReceta_Preautorizacion.Get_Codigo: UnicodeString;
begin
  Result := ChildNodes['Codigo'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Preautorizacion.Set_Codigo(Value: UnicodeString);
begin
  ChildNodes['Codigo'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Preautorizacion.Get_Fecha: UnicodeString;
begin
  Result := ChildNodes['Fecha'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Preautorizacion.Set_Fecha(Value: UnicodeString);
begin
  ChildNodes['Fecha'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoReceta_Dispensa }

function TXMLMensajeADESFA_EncabezadoReceta_Dispensa.Get_Fecha: Integer;
begin
  Result := ChildNodes['Fecha'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Dispensa.Set_Fecha(Value: Integer);
begin
  ChildNodes['Fecha'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Dispensa.Get_Hora: Integer;
begin
  Result := ChildNodes['Hora'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Dispensa.Set_Hora(Value: Integer);
begin
  ChildNodes['Hora'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoReceta_Formulario }

function TXMLMensajeADESFA_EncabezadoReceta_Formulario.Get_Fecha: Integer;
begin
  Result := ChildNodes['Fecha'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Formulario.Set_Fecha(Value: Integer);
begin
  ChildNodes['Fecha'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Formulario.Get_Tipo: UnicodeString;
begin
  Result := ChildNodes['Tipo'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Formulario.Set_Tipo(Value: UnicodeString);
begin
  ChildNodes['Tipo'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Formulario.Get_Numero: Int64;
begin
  Result := ChildNodes['Numero'].NodeValue;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Formulario.Set_Numero(Value: Int64);
begin
  ChildNodes['Numero'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Formulario.Get_Serie: UnicodeString;
begin
  Result := ChildNodes['Serie'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Formulario.Set_Serie(Value: UnicodeString);
begin
  ChildNodes['Serie'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoReceta_Institucion }

function TXMLMensajeADESFA_EncabezadoReceta_Institucion.Get_Codigo: UnicodeString;
begin
  Result := ChildNodes['Codigo'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Institucion.Set_Codigo(Value: UnicodeString);
begin
  ChildNodes['Codigo'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Institucion.Get_Cuit: UnicodeString;
begin
  Result := ChildNodes['Cuit'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Institucion.Set_Cuit(Value: UnicodeString);
begin
  ChildNodes['Cuit'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Institucion.Get_Sucursal: UnicodeString;
begin
  Result := ChildNodes['Sucursal'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Institucion.Set_Sucursal(Value: UnicodeString);
begin
  ChildNodes['Sucursal'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_EncabezadoReceta_Retira }

function TXMLMensajeADESFA_EncabezadoReceta_Retira.Get_Apellido: UnicodeString;
begin
  Result := ChildNodes['Apellido'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Retira.Set_Apellido(Value: UnicodeString);
begin
  ChildNodes['Apellido'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Retira.Get_Nombre: UnicodeString;
begin
  Result := ChildNodes['Nombre'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Retira.Set_Nombre(Value: UnicodeString);
begin
  ChildNodes['Nombre'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Retira.Get_TipoDoc: UnicodeString;
begin
  Result := ChildNodes['TipoDoc'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Retira.Set_TipoDoc(Value: UnicodeString);
begin
  ChildNodes['TipoDoc'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Retira.Get_NroDoc: UnicodeString;
begin
  Result := ChildNodes['NroDoc'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Retira.Set_NroDoc(Value: UnicodeString);
begin
  ChildNodes['NroDoc'].NodeValue := Value;
end;

function TXMLMensajeADESFA_EncabezadoReceta_Retira.Get_NroTelefono: UnicodeString;
begin
  Result := ChildNodes['NroTelefono'].Text;
end;

procedure TXMLMensajeADESFA_EncabezadoReceta_Retira.Set_NroTelefono(Value: UnicodeString);
begin
  ChildNodes['NroTelefono'].NodeValue := Value;
end;

{ TXMLMensajeADESFA_DetalleReceta }

procedure TXMLMensajeADESFA_DetalleReceta.AfterConstruction;
begin
  RegisterChildNode('Item', TXMLMensajeADESFA_DetalleReceta_Item);
  inherited;
end;

function TXMLMensajeADESFA_DetalleReceta.Get_Item: IXMLMensajeADESFA_DetalleReceta_Item;
begin
  Result := ChildNodes['Item'] as IXMLMensajeADESFA_DetalleReceta_Item;
end;

{ TXMLMensajeADESFA_DetalleReceta_Item }

function TXMLMensajeADESFA_DetalleReceta_Item.Get_NroItem: ShortInt;
begin
  Result := ChildNodes['NroItem'].NodeValue;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_NroItem(Value: ShortInt);
begin
  ChildNodes['NroItem'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_CodBarras: Int64;
begin
  Result := ChildNodes['CodBarras'].NodeValue;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_CodBarras(Value: Int64);
begin
  ChildNodes['CodBarras'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_CodTroquel: Integer;
begin
  Result := ChildNodes['CodTroquel'].NodeValue;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_CodTroquel(Value: Integer);
begin
  ChildNodes['CodTroquel'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_Alfabeta: UnicodeString;
begin
  Result := ChildNodes['Alfabeta'].Text;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_Alfabeta(Value: UnicodeString);
begin
  ChildNodes['Alfabeta'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_Kairos: UnicodeString;
begin
  Result := ChildNodes['Kairos'].Text;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_Kairos(Value: UnicodeString);
begin
  ChildNodes['Kairos'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_Codigo: UnicodeString;
begin
  Result := ChildNodes['Codigo'].Text;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_Codigo(Value: UnicodeString);
begin
  ChildNodes['Codigo'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_ImporteUnitario: Single;
begin
  Result := ChildNodes['ImporteUnitario'].NodeValue;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_ImporteUnitario(Value: Single);
begin
  ChildNodes['ImporteUnitario'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_CantidadSolicitada: ShortInt;
begin
  Result := ChildNodes['CantidadSolicitada'].NodeValue;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_CantidadSolicitada(Value: ShortInt);
begin
  ChildNodes['CantidadSolicitada'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_PorcentajeCobertura: Single;
begin
  Result := ChildNodes['PorcentajeCobertura'].NodeValue;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_PorcentajeCobertura(Value: Single);
begin
  ChildNodes['PorcentajeCobertura'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_CodPreautorizacion: UnicodeString;
begin
  Result := ChildNodes['CodPreautorizacion'].Text;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_CodPreautorizacion(Value: UnicodeString);
begin
  ChildNodes['CodPreautorizacion'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_ImporteCobertura: Single;
begin
  Result := ChildNodes['ImporteCobertura'].NodeValue;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_ImporteCobertura(Value: Single);
begin
  ChildNodes['ImporteCobertura'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_ExcepcionPrescripcion: ShortInt;
begin
  Result := ChildNodes['ExcepcionPrescripcion'].NodeValue;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_ExcepcionPrescripcion(Value: ShortInt);
begin
  ChildNodes['ExcepcionPrescripcion'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_Diagnostico: UnicodeString;
begin
  Result := ChildNodes['Diagnostico'].Text;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_Diagnostico(Value: UnicodeString);
begin
  ChildNodes['Diagnostico'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_DosisDiaria: UnicodeString;
begin
  Result := ChildNodes['DosisDiaria'].Text;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_DosisDiaria(Value: UnicodeString);
begin
  ChildNodes['DosisDiaria'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_DiasTratamiento: UnicodeString;
begin
  Result := ChildNodes['DiasTratamiento'].Text;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_DiasTratamiento(Value: UnicodeString);
begin
  ChildNodes['DiasTratamiento'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_Generico: UnicodeString;
begin
  Result := ChildNodes['Generico'].Text;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_Generico(Value: UnicodeString);
begin
  ChildNodes['Generico'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_CodConflicto: UnicodeString;
begin
  Result := ChildNodes['CodConflicto'].Text;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_CodConflicto(Value: UnicodeString);
begin
  ChildNodes['CodConflicto'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_CodIntervencion: UnicodeString;
begin
  Result := ChildNodes['CodIntervencion'].Text;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_CodIntervencion(Value: UnicodeString);
begin
  ChildNodes['CodIntervencion'].NodeValue := Value;
end;

function TXMLMensajeADESFA_DetalleReceta_Item.Get_CodAccion: UnicodeString;
begin
  Result := ChildNodes['CodAccion'].Text;
end;

procedure TXMLMensajeADESFA_DetalleReceta_Item.Set_CodAccion(Value: UnicodeString);
begin
  ChildNodes['CodAccion'].NodeValue := Value;
end;

end.
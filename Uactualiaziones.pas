unit Uactualiaziones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TFactualizaciones = class(TForm)
    Panel1: TPanel;
    Busqueda: TLabel;
    Shape1: TShape;
    Panel3: TPanel;
    getiquetas: TDBGrid;
    Bcancelar: TBitBtn;
    blimpiar: TBitBtn;
    Panel2: TPanel;
    rimpresion: TRadioGroup;
    Bimprimir: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Desde: TLabel;
    Hasta: TLabel;
    BitBtn1: TBitBtn;
    Shape2: TShape;
    bbuscar: TBitBtn;
    ebusqueda: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Factualizaciones: TFactualizaciones;

implementation

{$R *.dfm}

end.

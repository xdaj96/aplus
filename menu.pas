unit menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, facturador, uhasar,
  ucaja, udticket, unofiscal,uReporteTotalCos,
  Vcl.ImgList, uetiquetasmanuales, uiva, ubuscartk, ucajalistado, ukardex,
  ubusquedacomprob, umodificacion,uReporteVtaCoseguro,
  ureportestock, ucajaenviar2, uturnos, liq, ubcr, ulibrorecetas;

type
  Tfarbol = class(TForm)
    tarbol: TTreeView;
    Bcancelar: TBitBtn;
    ImageList1: TImageList;
    procedure BcancelarClick(Sender: TObject);
    procedure tarbolDblClick(Sender: TObject);
    procedure tarbolKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);

  private
    Ticket: TTicket;
  public

    { Public declarations }
    procedure SetTicket(unTicket: TTicket);

  end;

var
  farbol: Tfarbol;


implementation

{$R *.dfm}

procedure Tfarbol.BcancelarClick(Sender: TObject);

begin
  application.Terminate;

end;

procedure Tfarbol.tarbolDblClick(Sender: TObject);
VAR
  FORM: TFFACTURADOR;
  FORM2: TFHASAR;
  form3: tfcaja;
  form4: tfnofiscal;
  form5: tfetiquetasmanuales;
  form6: tfiva;
  form7: tfbuscartk;
  form8: tfcajaenviar2;
  form9: tfkardex;
  form10: tfbusquedacomprob;
  form11: tfmodifi;
  form12: tfreportestock;
  form13: tfliquidacion;
  form14: tfbcr;
  form15: tfLibroRecetas;
  frmReporteVtaCos:TFrmReporteVtaPorCoseguro;
  frmReporteTotalCos:TfrmReporteTotalCos;
begin

  if tarbol.Selected.Text = 'Fiscal' THEN
  BEGIN
    FORM := TFFACTURADOR.Create(SELF);
    FORM.SetTicket(Ticket);
    if Ticket.ventanas = 'S' then
    BEGIN
      FORM.Show;
    END;
    if Ticket.ventanas = 'N' then
    BEGIN
      FORM.ShowModal;
    END;

  END;
  if tarbol.Selected.Text = 'Hasar' THEN
  BEGIN
    FORM2 := TFHASAR.Create(SELF);
    FORM2.SetTicket(Ticket);
    FORM2.ShowModal;
  END;
  if tarbol.Selected.Text = 'Caja' THEN
  BEGIN
    form3 := tfcaja.Create(SELF);
    form3.SetTicket(Ticket);
    form3.ShowModal;
  END;
  if tarbol.Selected.Text = 'No Fiscal' THEN
  BEGIN
    form4 := tfnofiscal.Create(SELF);
    form4.SetTicket(Ticket);
    if Ticket.ventanas = 'S' then
    BEGIN
      form4.Show;
    END;
    if Ticket.ventanas = 'N' then
    BEGIN
      form4.ShowModal;
    END;
  END;
  if tarbol.Selected.Text = 'Etiquetas Manuales' THEN
  BEGIN
    form5 := tfetiquetasmanuales.Create(SELF);
    form5.SetTicket(Ticket);
    if Ticket.ventanas = 'S' then
    BEGIN
      form5.Show;
    END;
    if Ticket.ventanas = 'N' then
    BEGIN
      form5.ShowModal;
    END;
  END;
  if tarbol.Selected.Text = 'Subdiario iva' THEN
  BEGIN
    if tarbol.Items[8].Enabled = true then
    begin
      form6 := tfiva.Create(SELF);

      form6.ShowModal;
    end;
  END;
  if tarbol.Selected.Text = 'Cierre de caja' THEN
  BEGIN
    if tarbol.Items[9].Enabled = true then
    begin

      form8 := tfcajaenviar2.Create(SELF);
      form8.SetTicket(Ticket);

      form8.ShowModal;
      form8.DisposeOf;

    end;
  END;
  if tarbol.Selected.Text = 'Busqueda de comprobantes' THEN
  BEGIN
    if tarbol.Items[10].Enabled = true then
    begin
      form7 := tfbuscartk.Create(SELF);
      form7.SetTicket(Ticket);
      form7.ShowModal;
    end;

  END;

  if tarbol.Selected.Text = 'Reimpresion de comprobantes' THEN
  BEGIN
    if tarbol.Items[12].Enabled = true then
    begin
      form10 := tfbusquedacomprob.Create(SELF);
      form10.SetTicket(Ticket);
      if Ticket.ventanas = 'S' then
      BEGIN
        form10.Show;
      END;
      if Ticket.ventanas = 'N' then
      BEGIN
        form10.ShowModal;
      END;
    END;

  END;

  if tarbol.Selected.Text = 'Kardex' THEN
  BEGIN
    if tarbol.Items[11].Enabled = true then
    begin
      form9 := tfkardex.Create(SELF);
      form9.SetTicket(Ticket);
      if Ticket.ventanas = 'S' then
      BEGIN
        form9.Show;
      END;
      if Ticket.ventanas = 'N' then
      BEGIN
        form9.ShowModal;
      END;
    END;
  end;

  if tarbol.Selected.Text = 'Modificacion de precios' THEN
  BEGIN
    if tarbol.Items[13].Enabled = true then
    begin
      form11 := tfmodifi.Create(SELF);

      if Ticket.ventanas = 'S' then
      BEGIN
        form11.Show;
      END;
      if Ticket.ventanas = 'N' then
      BEGIN
        form11.ShowModal;
      END;
    end;

  END;
  if tarbol.Selected.Text = 'Reporte Stock' THEN
  BEGIN
    if tarbol.Items[14].Enabled = true then
    begin
      form12 := tfreportestock.Create(SELF);
      form12.SetTicket(Ticket);
      if Ticket.ventanas = 'S' then
      BEGIN
        form12.Show;
      END;
      if Ticket.ventanas = 'N' then
      BEGIN
        form12.ShowModal;
      END;
    end;
  END;
  if tarbol.Selected.Text = 'Liquidacion Os' THEN
  BEGIN
    if tarbol.Items[15].Enabled = true then
    begin
      form13 := tfliquidacion.Create(SELF);
      form13.SetTicket(Ticket);
      if Ticket.ventanas = 'S' then
      BEGIN
        form13.Show;
      END;
      if Ticket.ventanas = 'N' then
      BEGIN
        form13.ShowModal;
      END;
    end;
  end;
  if tarbol.Selected.Text = 'Deposito Bcr' THEN
  BEGIN
    if tarbol.Items[16].Enabled = true then
    begin
      form14 := tfbcr.Create(SELF);
      form14.SetTicket(Ticket);
      if Ticket.ventanas = 'S' then
      BEGIN
        form14.Show;
      END;
      if Ticket.ventanas = 'N' then
      BEGIN
        form14.ShowModal;
      END;
    end;
    end;
    { nueva implementacion 0.3.4.7 }
    //AnsiSameText(str1, str2)
    if tarbol.Selected.Text = 'Libro recetas' THEN
    begin
      if tarbol.Items[17].Enabled = true then
      begin
        form15 := TFLibroRecetas.Create(SELF);
        form15.Show;
        //form15.SetTicket(Ticket);
        //form15.ShowModal;
        //form15.DisposeOf;
          {form8.ShowModal;
      form8.DisposeOf;}
      end;
    END;

    if tarbol.Selected.Text = 'Totales de coseguros' THEN
  BEGIN
    if tarbol.Items[18].Enabled = true then
    begin
      frmReporteTotalCos := TfrmReporteTotalCos.Create(SELF);
      frmReporteTotalCos.SetTicket(Ticket);
      if Ticket.ventanas = 'S' then
      BEGIN
        frmReporteTotalCos.Show;
      END;
      if Ticket.ventanas = 'N' then
      BEGIN
        frmReporteTotalCos.ShowModal;
      END;
    END;

  END;


      if tarbol.Selected.Text = 'Ventas por coseguro' THEN
    begin
      if tarbol.Items[17].Enabled = true then
      begin
        frmReporteVtaCos := TFrmReporteVtaPorCoseguro.Create(SELF);
        frmReporteVtaCos.ShowModal;

      end;
    END;


  END;


procedure Tfarbol.tarbolKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    tarbol.OnDblClick(SELF);
  end;
end;

procedure Tfarbol.FormShow(Sender: TObject);
begin
  tarbol.FullExpand;
  if Ticket.perfil = '92' then
  begin
    tarbol.Items[7].Enabled := false;
    tarbol.Items[8].Enabled := false;
    tarbol.Items[9].Enabled := false;
    tarbol.Items[10].Enabled := false;
    tarbol.Items[11].Enabled := false;
    tarbol.Items[12].Enabled := false;
    tarbol.Items[13].Enabled := false;
    tarbol.Items[14].Enabled := false;
    tarbol.Items[15].Enabled := false;
    tarbol.Items[16].Enabled := false;
    tarbol.Items[18].Enabled := false;
  end;
end;

procedure Tfarbol.SetTicket(unTicket: TTicket);
begin
  Ticket := unTicket;
end;

end.

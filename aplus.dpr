program aplus;







uses
  Vcl.Forms,
  login in 'login.pas' {Finicio},
  jpg in 'jpg.pas' {Fimagen},
  menu in 'menu.pas' {farbol},
  facturador in 'facturador.pas' {Ffacturador},
  buscaros in 'buscaros.pas' {FBUSCAROS},
  ubuscarco1 in 'ubuscarco1.pas' {fbuscarco1},
  UdmFacturador in 'UdmFacturador.pas' {dmFacturador: TDataModule},
  Uticket in 'Uticket.pas' {Fticket},
  Uprogreso in 'Uprogreso.pas' {fprogreso},
  uhasar in 'uhasar.pas' {Fhasar},
  Ubuscardatos in 'Ubuscardatos.pas' {Fbuscardatos},
  UIMPRESION in 'UIMPRESION.pas' {FIMPRESION},
  UCalcularDescuento in 'UCalcularDescuento.pas',
  Uvalida in 'Uvalida.pas' {Fvalida},
  UDTicket in 'UDTicket.pas',
  maxi in 'maxi.pas',
  ucaja in 'ucaja.pas' {fcaja},
  ubuscarcliente in 'ubuscarcliente.pas' {fcliente},
  Uvalcliente in 'Uvalcliente.pas' {fvalcliente},
  Ustock in 'Ustock.pas' {fstock},
  Uvale in 'Uvale.pas' {fvale},
  UNOFISCAL in 'UNOFISCAL.pas' {FNOFISCAL},
  Ufacturaonline in 'Ufacturaonline.pas' {ffacturaonline},
  Uimpresionofiscal in 'Uimpresionofiscal.pas' {fimpresionnofiscal},
  Umodificar in 'Umodificar.pas' {Fmodificacion},
  Uetiquetasmanuales in 'Uetiquetasmanuales.pas' {fetiquetasmanuales},
  Uhistorial in 'Uhistorial.pas' {fhistorial},
  Uupdcliente in 'Uupdcliente.pas' {valupdcliente},
  ubusquedaproductos in 'ubusquedaproductos.pas' {fbusquedaproductos},
  ULimitesCobertura in 'ULimitesCobertura.pas',
  Uproductosd in 'Uproductosd.pas' {fproductosd},
  Uiva in 'Uiva.pas' {fiva},
  Ubusquedacomprob in 'Ubusquedacomprob.pas' {fbusquedacomprob},
  Unumeracion in 'Unumeracion.pas' {fnumeracion},
  UDROGAS in 'UDROGAS.pas' {FDROGAS},
  Udesdroga in 'Udesdroga.pas' {fdescripciondroga},
  Ubuscartk in 'Ubuscartk.pas' {fbuscartk},
  Ulistadocajas in 'Ulistadocajas.pas' {fcajas},
  Ucajalistado in 'Ucajalistado.pas' {fcajalistado},
  UAnalizaOfertas in 'UAnalizaOfertas.pas',
  Ukardex in 'Ukardex.pas' {fkardex},
  UCOMPROB in 'UCOMPROB.pas' {FTIPCOMPROB},
  Uvalcancel in 'Uvalcancel.pas' {valcancel},
  Vcl.Themes,
  Vcl.Styles,
  Umodificacion in 'Umodificacion.pas' {Fmodifi},
  Vcl.Styles.DbGrid in 'Vcl.Styles.DbGrid.pas',
  Udatosadicionales in 'Udatosadicionales.pas' {fdatos},
  Ureportestock in 'Ureportestock.pas' {Freportestock},
  ucajaenviar2 in 'ucajaenviar2.pas' {Fcajaenviar2},
  Uadicionales in 'Uadicionales.pas' {fadicionales},
  uautempleados in 'uautempleados.pas' {fautorizacion},
  upromo in 'upromo.pas' {fpromo},
  Uturnos in 'Uturnos.pas' {fturnos},
  liq in 'liq.pas' {fliquidacion},
  passaj in 'passaj.pas' {FPass},
  Uafiliar in 'Uafiliar.pas' {fafiliar},
  Ugastos in 'Ugastos.pas' {fgastos},
  Ubcr in 'Ubcr.pas' {Fbcr},
  ufautofarmaplus in 'ufautofarmaplus.pas' {fautofarmaplus},
  Uadjuntobcr in 'Uadjuntobcr.pas' {fadjuntobcr},
  HasarArgentina_TLB in 'HasarArgentina_TLB.pas',
  ULibroRecetas in 'ULibroRecetas.pas' {FLibroRecetas},
  FiscalEpson in 'FiscalEpson.pas',
  uFiscalEpson in 'uFiscalEpson.pas',
  uUtils in 'utils\uUtils.pas',
  uImpresorEtiquetas in 'Libs\uImpresorEtiquetas.pas',
  uPRMASTOCKDAO in 'DAO\uPRMASTOCKDAO.pas',
  uChequeDao in 'DAO\uChequeDao.pas',
  uDetaMovOSDAO in 'DAO\uDetaMovOSDAO.pas',
  uMovObraSocialDAO in 'DAO\uMovObraSocialDAO.pas',
  uRanckingProdDAO in 'DAO\uRanckingProdDAO.pas',
  uRegistryHelper in 'Helpers\uRegistryHelper.pas',
  uIvaDAO in 'DAO\uIvaDAO.pas',
  Urecargos in 'vistas\frmRecargos\Urecargos.pas' {frmRecargo},
  uFPagoTarjetaDAO in 'DAO\uFPagoTarjetaDAO.pas',
  uTarjetasDAO in 'DAO\uTarjetasDAO.pas',
  uReporteVtaCoseguro in 'vistas\frmReporteVtaCoseguro\uReporteVtaCoseguro.pas' {FrmReporteVtaPorCoseguro},
  uMovObraSocialService in 'Servicios\uMovObraSocialService.pas',
  uTipoComprobanteService in 'Servicios\uTipoComprobanteService.pas',
  uProductoService in 'Servicios\uProductoService.pas',
  uVendedorDAO in 'DAO\uVendedorDAO.pas',
  uVendedorService in 'Servicios\uVendedorService.pas',
  uAfiliadoDAO in 'DAO\uAfiliadoDAO.pas',
  uAfiliadoService in 'Servicios\uAfiliadoService.pas',
  uMedicoService in 'Servicios\uMedicoService.pas',
  uMedicoDAO in 'DAO\uMedicoDAO.pas',
  uBaseCfg in 'DATA\uBaseCfg.pas',
  uUsuarioDAO in 'DAO\uUsuarioDAO.pas',
  uUsuarioService in 'Servicios\uUsuarioService.pas',
  uBaseDatos in 'DATA\uBaseDatos.pas',
  uMessageDLG in 'Libs\uMessageDLG.pas',
  uProductoDAO in 'DAO\uProductoDAO.pas',
  uSucursalDAO in 'DAO\uSucursalDAO.pas',
  Ucajaenviar in 'Ucajaenviar.pas' {fcajaenviar},
  uCalculadoraPrecio in 'Servicios\uCalculadoraPrecio.pas',
  uSorteoService in 'Servicios\uSorteoService.pas',
  uDefPatchesDAO in 'DAO\uDefPatchesDAO.pas',
  uClienteService in 'Servicios\uClienteService.pas',
  uConfiguracionService in 'Servicios\uConfiguracionService.pas',
  uPlanesOSService in 'Servicios\uPlanesOSService.pas',
  uSucursalService in 'Servicios\uSucursalService.pas',
  uWebAppService in 'Servicios\uWebAppService.pas',
  uPagoTicketConTarjetaDAO in 'DAO\uPagoTicketConTarjetaDAO.pas',
  uPlanesOSDAO in 'DAO\uPlanesOSDAO.pas',
  UVTTBPAGOCHEQUEDAO in 'DAO\UVTTBPAGOCHEQUEDAO.pas',
  uReporteTotalCos in 'vistas\uReporteTotalCos.pas',
  uvalsorteo in 'vistas\uvalsorteo.pas' {FrmValSorteo},
  DetalleMovimientoOS in 'Models\DetalleMovimientoOS.pas',
  uAfiliado in 'Models\uAfiliado.pas',
  uCheque in 'Models\uCheque.pas',
  uChequeModel in 'Models\uChequeModel.pas',
  uCliente in 'Models\uCliente.pas',
  uDetalleMovOS in 'Models\uDetalleMovOS.pas',
  uMedico in 'Models\uMedico.pas',
  uMovObraSocial in 'Models\uMovObraSocial.pas',
  uPlanOS in 'Models\uPlanOS.pas',
  uRanckingProd in 'Models\uRanckingProd.pas',
  uSorteo in 'Models\uSorteo.pas',
  uUsuario in 'Models\uUsuario.pas',
  uVendedor in 'Models\uVendedor.pas',
  uDescComprobanteDAO in 'DAO\uDescComprobanteDAO.pas',
  uDescComprobanteService in 'Servicios\uDescComprobanteService.pas',
  uDetaAfiliadoService in 'Servicios\uDetaAfiliadoService.pas',
  uDescComprobante in 'Models\uDescComprobante.pas',
  uDetalleAfiliado in 'Models\uDetalleAfiliado.pas',
  uConsultaReceta in 'vistas\uConsultaReceta.pas' {fConsultaReceta},
  uConsultaRecetaElec in 'vistas\uConsultaRecetaElec.pas' {FRecetaElectronica},
  uAdesfaValService in 'Servicios\uAdesfaValService.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.MainFormOnTaskbar := false;

  TStyleManager.TrySetStyle('Slate Classico');
  Application.CreateForm(TFinicio, Finicio);
  Application.CreateForm(Tfarbol, farbol);
  Application.CreateForm(TFimagen, Fimagen);
  Application.CreateForm(TFfacturador, Ffacturador);
  Application.CreateForm(TFBUSCAROS, FBUSCAROS);
  Application.CreateForm(TFBUSCAROS, FBUSCAROS);
  Application.CreateForm(TFBUSCAROS, FBUSCAROS);
  Application.CreateForm(Tfbuscarco1, fbuscarco1);
  Application.CreateForm(TdmFacturador, dmFacturador);
  Application.CreateForm(TFticket, Fticket);
  Application.CreateForm(Tfprogreso, fprogreso);
  Application.CreateForm(TFhasar, Fhasar);
  Application.CreateForm(TFbuscardatos, Fbuscardatos);
  Application.CreateForm(TFIMPRESION, FIMPRESION);
  Application.CreateForm(TFvalida, Fvalida);
  Application.CreateForm(Tfcaja, fcaja);
  Application.CreateForm(Tfcliente, fcliente);
  Application.CreateForm(Tfvalcliente, fvalcliente);
  Application.CreateForm(Tfstock, fstock);
  Application.CreateForm(Tfvale, fvale);
  Application.CreateForm(TFNOFISCAL, FNOFISCAL);
  Application.CreateForm(Tffacturaonline, ffacturaonline);
  Application.CreateForm(Tfimpresionnofiscal, fimpresionnofiscal);
  Application.CreateForm(TFmodificacion, Fmodificacion);
  Application.CreateForm(Tfetiquetasmanuales, fetiquetasmanuales);
  Application.CreateForm(Tfhistorial, fhistorial);
  Application.CreateForm(Tvalupdcliente, valupdcliente);
  Application.CreateForm(Tfbusquedaproductos, fbusquedaproductos);
  Application.CreateForm(Tfproductosd, fproductosd);
  Application.CreateForm(Tfiva, fiva);
  Application.CreateForm(Tfbusquedacomprob, fbusquedacomprob);
  Application.CreateForm(Tfnumeracion, fnumeracion);
  Application.CreateForm(TFDROGAS, FDROGAS);
  Application.CreateForm(Tfdescripciondroga, fdescripciondroga);
  Application.CreateForm(Tfbuscartk, fbuscartk);
  Application.CreateForm(Tfcajas, fcajas);
  Application.CreateForm(Tfcajaenviar, fcajaenviar);
  Application.CreateForm(Tfcajalistado, fcajalistado);
  Application.CreateForm(Tfkardex, fkardex);
  Application.CreateForm(TFTIPCOMPROB, FTIPCOMPROB);
  Application.CreateForm(Tvalcancel, valcancel);
  Application.CreateForm(TFmodifi, Fmodifi);
  Application.CreateForm(Tfdatos, fdatos);
  Application.CreateForm(TFreportestock, Freportestock);
  Application.CreateForm(TFcajaenviar2, Fcajaenviar2);
  Application.CreateForm(Tfadicionales, fadicionales);
  Application.CreateForm(Tfautorizacion, fautorizacion);
  Application.CreateForm(Tfpromo, fpromo);
  Application.CreateForm(Tfturnos, fturnos);
  Application.CreateForm(Tfliquidacion, fliquidacion);
  Application.CreateForm(TFPass, FPass);
  Application.CreateForm(Tfafiliar, fafiliar);
  Application.CreateForm(Tfgastos, fgastos);
  Application.CreateForm(TFbcr, Fbcr);
  Application.CreateForm(Tfautofarmaplus, fautofarmaplus);
  Application.CreateForm(Tfadjuntobcr, fadjuntobcr);
  Application.CreateForm(TFLibroRecetas, FLibroRecetas);
  Application.CreateForm(TfrmRecargo, frmRecargo);
  Application.CreateForm(TFrmReporteVtaPorCoseguro, FrmReporteVtaPorCoseguro);
  Application.CreateForm(Tfcajaenviar, fcajaenviar);
  Application.CreateForm(TFrmValSorteo, FrmValSorteo);
  Application.CreateForm(TfConsultaReceta, fConsultaReceta);
  Application.CreateForm(TFRecetaElectronica, FRecetaElectronica);
  Application.Run;
end.

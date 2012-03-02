program cpKlinik;

uses
  Forms,
  unUtama in '..\units\unUtama.pas' {frmUtama},
  unDm in '..\units\unDm.pas' {dm: TDataModule},
  unFrmAddDokter in '..\units\unFrmAddDokter.pas' {frmAddDokter},
  unFrmEditDokter in '..\units\unFrmEditDokter.pas' {frmEditDokter},
  unFrmViewDokter in '..\units\unFrmViewDokter.pas' {frmViewDokter},
  unFrmViewKaryawan in '..\units\unFrmViewKaryawan.pas' {frmViewKaryawan},
  unFrmAddKaryawan in '..\units\unFrmAddKaryawan.pas' {frmAddKaryawan},
  unFrmViewPasien in '..\units\unFrmViewPasien.pas' {frmViewPasien},
  unFrmPasien in '..\units\unFrmPasien.pas' {frmPasien},
  unFrmAddPasien in '..\units\unFrmAddPasien.pas' {frmAddPasien},
  unFrmPoli in '..\units\unFrmPoli.pas' {frmPoli},
  unFrmViewPoli in '..\units\unFrmViewPoli.pas' {frmViewPoli},
  unFrmViewDepartemen in '..\units\unFrmViewDepartemen.pas' {frmViewDepartemen},
  unFrmViewBed in '..\units\unFrmViewBed.pas' {frmViewBed},
  unFrmAddBed in '..\units\unFrmAddBed.pas' {frmAddBed},
  unfrmObat in '..\units\unfrmObat.pas' {frmObat},
  unViewObat in '..\units\unViewObat.pas' {frmViewObat},
  unFrmRawatInap in '..\units\unFrmRawatInap.pas' {frmRawatInap},
  unFrmMaster in '..\units\unFrmMaster.pas' {frmMaster},
  unFrmTransaksiRawatInap in '..\units\unFrmTransaksiRawatInap.pas' {frmTreatment},
  unFrmService in '..\units\unFrmService.pas' {frmService},
  unFrmSetting in '..\units\unFrmSetting.pas' {frmSetting},
  unFrmPassword in '..\units\unFrmPassword.pas' {frmPassword},
  unEditKamar in '..\units\unEditKamar.pas' {frmEditKamar},
  unEditPoli in '..\units\unEditPoli.pas' {frmEditPoli},
  unFrmPerusahaan in '..\units\unFrmPerusahaan.pas' {frmPerusahaan},
  unFrmRumahSakit in '..\units\unFrmRumahSakit.pas' {frmRumahSakit},
  unFrmMigrasi in '..\units\unFrmMigrasi.pas' {frmMigrasi},
  unFrmItemLab in '..\units\unFrmItemLab.pas' {frmItemLab},
  unFrmGroupLab in '..\units\unFrmGroupLab.pas' {frmGroupLab},
  unFrmViewItemLab in '..\units\unFrmViewItemLab.pas' {frmViewItemLab},
  unFrmLab in '..\units\unFrmLab.pas' {frmLab},
  unFrmCetakLab in '..\units\unFrmCetakLab.pas' {frmCetakLab},
  unFrmPilihPasien in '..\units\unFrmPilihPasien.pas' {frmPilihPasien},
  unFrmRegLab in '..\units\unFrmRegLab.pas' {frmRegLab},
  unFrmRontgen in '..\units\unFrmRontgen.pas' {frmRontgen},
  unFrmPerujuk in '..\units\unFrmPerujuk.pas' {frmPerujuk},
  unFrmLayananRontgen in '..\units\unFrmLayananRontgen.pas' {frmLayananRontgen},
  unFrmPreferensi in '..\units\unFrmPreferensi.pas' {frmPreferensi},
  unFrmAlkes in '..\units\unFrmAlkes.pas' {frmAlkes},
  unitFrmBillingPasienNonAktif in '..\units\unitFrmBillingPasienNonAktif.pas' {frmBillingPasiennonaktif},
  unfrmViewAlkes in '..\units\unfrmViewAlkes.pas' {frmViewAlkes},
  unfrmApotek in '..\units\unfrmApotek.pas' {frmApotek},
  unfrmViewRawatInap in '..\units\unfrmViewRawatInap.pas' {frmViewRawatInap},
  unFrmViewPasienPoli in '..\units\unFrmViewPasienPoli.pas' {frmViewPasienPoli},
  unFrmApotik in '..\units\unFrmApotik.pas' {frmApotik},
  unfrmtarifdokter in '..\units\unfrmtarifdokter.pas' {frmtarifdokter},
  unfrmcetak in '..\units\unfrmcetak.pas' {frmCetak},
  undmrpt in '..\units\undmrpt.pas' {dmrpt: TDataModule},
  unfrmViewRontgen in '..\units\unfrmViewRontgen.pas' {frmViewRontgen},
  unfrmpolitreatment in '..\units\unfrmpolitreatment.pas' {frmPoliTreatment},
  unfrmviewservicedokter in '..\units\unfrmviewservicedokter.pas' {frmViewServicedokter},
  unfrmmigrasirawatinap in '..\units\unfrmmigrasirawatinap.pas' {frmMigrasiRawatInap},
  unfrmviewpolinonmigrasi in '..\units\unfrmviewpolinonmigrasi.pas' {frmviewpolinonmigrasi},
  unfrmtambahanapotik in '..\units\unfrmtambahanapotik.pas' {frmtambahanapotik},
  frmviewbiayatambahan in '..\units\frmviewbiayatambahan.pas' {frmviewtambahan},
  unfrmstokobat in '..\units\unfrmstokobat.pas' {frmStokobat},
  unfrmhargaobat in '..\units\unfrmhargaobat.pas' {frmhargaobat},
  unfrmgantipassword in '..\units\unfrmgantipassword.pas' {frmGantiPassword},
  uneditobat in '..\units\uneditobat.pas' {frmEditObat},
  unfrmsatuanobat in '..\units\unfrmsatuanobat.pas' {frmSatuan},
  unfrmantrian in '..\units\unfrmantrian.pas' {frmantrian},
  unfrmEditKaryawan in '..\units\unfrmEditKaryawan.pas' {frmEditKaryawan},
  unfrmracikan in '..\units\unfrmracikan.pas' {frmracikan},
  unfrmtariblab in '..\units\unfrmtariblab.pas' {frmtariflab},
  unfrmviewtariflab in '..\units\unfrmviewtariflab.pas' {frmviewtariflab},
  unfrmViewPasienlab in '..\units\unfrmViewPasienlab.pas' {frmViewPasienLab},
  unfrmhasillab in '..\units\unfrmhasillab.pas' {frmHasilLab},
  unfrmviewreglab in '..\units\unfrmviewreglab.pas' {frmViewRegLab},
  unfrmcetakkwitansilab in '..\units\unfrmcetakkwitansilab.pas' {frmcetakkwitansilab},
  kwitansi in '..\units\kwitansi.pas',
  unfrmcetakjualapotik in '..\units\unfrmcetakjualapotik.pas' {frmCetakJualApotik},
  unfrmtambahdeposit in '..\units\unfrmtambahdeposit.pas' {frmTambahDeposit},
  frmbillingrontgen in '..\units\frmbillingrontgen.pas' {frmbillrontgen},
  unfrmviewpasienrontgen in '..\units\unfrmviewpasienrontgen.pas' {frmViewPasienRontgen},
  unfrmpasswordsetwkt in '..\units\unfrmpasswordsetwkt.pas' {frmsettingwktkeluar},
  unfrmlaporanbilling in '..\units\unfrmlaporanbilling.pas' {frmLaporanBilling},
  unfrmuangkeluar in '..\units\unfrmuangkeluar.pas' {frmUangKeluar},
  unfrmjenistindakan in '..\units\unfrmjenistindakan.pas' {frmJenisTindakan},
  unFungsi in '..\units\unFungsi.pas',
  unfrmkomisidokter in '..\units\unfrmkomisidokter.pas' {frmKomisiDokter},
  unfrmrawatbaby in '..\units\unfrmrawatbaby.pas' {frmRawatBaby},
  unfrmlaporanakhir in '..\units\unfrmlaporanakhir.pas' {frmlaporanakhir},
  unfrmviewcustapotik in '..\units\unfrmviewcustapotik.pas' {frmViewCustApotik},
  unfrmsplash in 'unfrmsplash.pas' {frmSplash},
  unfrmbillingugd in '..\units\unfrmbillingugd.pas' {frmBillingUGD},
  unfrmdiagnosa in '..\units\unfrmdiagnosa.pas' {frmDiagnosa},
  unfrmviewpolidiag in '..\units\unfrmviewpolidiag.pas' {frmviewpolidiag},
  unfrmviewpenyakit in '..\units\unfrmviewpenyakit.pas' {frmViewPenyakit},
  unfrmkembalikas in '..\units\unfrmkembalikas.pas' {frmKembaliKas},
  frmresetbed in '..\units\frmresetbed.pas' {resetkamarfrm},
  editpasienun in '..\units\editpasienun.pas' {editpasienfrm},
  cetakstrukun in '..\units\cetakstrukun.pas' {cetakstrukfrm},
  pembelianun in '..\units\pembelianun.pas' {pembelianfrm},
  lapbrgmasukun in '..\units\lapbrgmasukun.pas' {lapbrgmasukfrm},
  dmlun in '..\units\dmlun.pas' {dml: TDataModule},
  frmlabreportun in '..\units\frmlabreportun.pas' {frmlabreport},
  kategoriobatun in '..\units\kategoriobatun.pas' {kategoriobatfrm},
  dmzun in '..\units\dmzun.pas' {dmz: TDataModule},
  psikouseun in '..\units\psikouseun.pas' {psikotopikafrm},
  beliapotikun in '..\units\beliapotikun.pas' {beliapotikfrm},
  expiredun in '..\units\expiredun.pas' {expiredfrm},
  sellingchartun in '..\units\sellingchartun.pas' {sellingchartfrm},
  gudangun in '..\units\gudangun.pas' {gudangfrm},
  kartustockun in '..\units\kartustockun.pas' {kartustockfrm},
  stockopnameun in '..\units\stockopnameun.pas' {stockopnamefrm},
  unfrmWait in '..\units\unfrmwait.pas' {frmWait},
  stockopnamerptun in '..\units\stockopnamerptun.pas' {stockopnamerptfrm};

{$R *.res}

begin
  Application.Initialize;
  splash.OpenSplash;
  splash.showProgress('Open Form Passowrd...');
  Application.Title := 'cpHospital';
  Application.CreateForm(TfrmPassword, frmPassword);
  Application.CreateForm(TfrmKembaliKas, frmKembaliKas);
  Application.CreateForm(Tresetkamarfrm, resetkamarfrm);
  Application.CreateForm(Teditpasienfrm, editpasienfrm);
  Application.CreateForm(TfrmUtama, frmUtama);
  Application.CreateForm(Tcetakstrukfrm, cetakstrukfrm);
  Application.CreateForm(Tpembelianfrm, pembelianfrm);
  Application.CreateForm(Tdmz, dmz);
  Application.CreateForm(Tpsikotopikafrm, psikotopikafrm);
  Application.CreateForm(Tbeliapotikfrm, beliapotikfrm);
  Application.CreateForm(Texpiredfrm, expiredfrm);
  Application.CreateForm(Tsellingchartfrm, sellingchartfrm);
  Application.CreateForm(Tgudangfrm, gudangfrm);
  Application.CreateForm(TfrmWait, frmWait);
  // Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(Tdml, dml);
  Application.CreateForm(Tfrmlabreport, frmlabreport);
  splash.showProgress('Open Menu....');
  Application.CreateForm(TfrmUtama, frmUtama);
  splash.showProgress('Activate Form Service...');
  Application.CreateForm(TfrmService, frmService);
  splash.showProgress('Loading Data Module...');
  Application.CreateForm(Tdm, dm);
  splash.showProgress('Open Form Dokter...');
  Application.CreateForm(TfrmAddDokter, frmAddDokter);
  Application.CreateForm(TfrmEditDokter, frmEditDokter);
  Application.CreateForm(TfrmViewDokter, frmViewDokter);
  splash.showProgress('Open Form Karyawan...');
  Application.CreateForm(TfrmViewKaryawan, frmViewKaryawan);
  Application.CreateForm(TfrmAddKaryawan, frmAddKaryawan);
  splash.showProgress('Open form Pasien...');
  Application.CreateForm(TfrmViewPasien, frmViewPasien);
  Application.CreateForm(TfrmPasien, frmPasien);
  Application.CreateForm(TfrmAddPasien, frmAddPasien);
  splash.showProgress('Open Form Poli...');
  Application.CreateForm(TfrmPoli, frmPoli);
  Application.CreateForm(TfrmViewPoli, frmViewPoli);
  Application.CreateForm(TfrmViewDepartemen, frmViewDepartemen);
  splash.showProgress('Open form Bed...');
  Application.CreateForm(TfrmViewBed, frmViewBed);
  Application.CreateForm(TfrmAddBed, frmAddBed);
  splash.showProgress('Open Form Obat...Mohon Tunggu...');
  Application.CreateForm(TfrmObat, frmObat);
  Application.CreateForm(TfrmViewObat, frmViewObat);
  splash.showProgress('OPen Form Rawat Inap. Mohon tunggu...');
  Application.CreateForm(TfrmRawatInap, frmRawatInap);
  Application.CreateForm(TfrmMaster, frmMaster);
  splash.showProgress('Open form Treatment...');
  Application.CreateForm(TfrmTreatment, frmTreatment);
  Application.CreateForm(TfrmSetting, frmSetting);
  Application.CreateForm(TfrmEditKamar, frmEditKamar);
  Application.CreateForm(TfrmEditPoli, frmEditPoli);
  splash.showProgress('Form Perusahaan...Mohon tunggu...');
  Application.CreateForm(TfrmPerusahaan, frmPerusahaan);
  Application.CreateForm(TfrmRumahSakit, frmRumahSakit);
  Application.CreateForm(TfrmMigrasi, frmMigrasi);
  splash.showProgress('Open Form Laboratorium...');
  Application.CreateForm(TfrmItemLab, frmItemLab);
  splash.showProgress('Open Form Group Lab..');
  Application.CreateForm(TfrmGroupLab, frmGroupLab);
  splash.showProgress('Open form View item Lab...');
  Application.CreateForm(TfrmViewItemLab, frmViewItemLab);
  splash.showProgress('Open form Lab...');
  Application.CreateForm(TfrmLab, frmLab);
  splash.showProgress('Open Form Cetak Lab...');
  Application.CreateForm(TfrmCetakLab, frmCetakLab);
  Application.CreateForm(TfrmPilihPasien, frmPilihPasien);
   splash.showProgress('Open Form Registrasi Lab...');
  Application.CreateForm(TfrmRegLab, frmRegLab);
  splash.showProgress('Open Form Rontgen...Mohon tunggu...');
  Application.CreateForm(TfrmRontgen, frmRontgen);
  Application.CreateForm(TfrmPerujuk, frmPerujuk);
  Application.CreateForm(TfrmLayananRontgen, frmLayananRontgen);
  splash.showProgress('Open Prefrerensi. Mohon tunggu...');
  Application.CreateForm(TfrmPreferensi, frmPreferensi);
  splash.showProgress('Open Form Alkes....');
  Application.CreateForm(TfrmAlkes, frmAlkes);
  Application.CreateForm(TfrmBillingPasiennonaktif, frmBillingPasiennonaktif);
  Application.CreateForm(TfrmViewAlkes, frmViewAlkes);
  splash.showProgress('Open Form Apotik.Mohon Tunggu...');
  Application.CreateForm(TfrmApotek, frmApotek);
  splash.showProgress('Open Form Rawat Inap.Mohon Tunggu...');
  Application.CreateForm(TfrmViewRawatInap, frmViewRawatInap);
  splash.showProgress('Open Form View Pasien Poli.Mohon Tunggu...');
  Application.CreateForm(TfrmViewPasienPoli, frmViewPasienPoli);
  //Application.CreateForm(TfrmApotik, frmApotik);
   splash.showProgress('Open Form Tarif Dokter.Mohon Tunggu...');
  Application.CreateForm(Tfrmtarifdokter, frmtarifdokter);
   splash.showProgress('Open Form Cetak.Mohon Tunggu...');
  Application.CreateForm(TfrmCetak, frmCetak);
  splash.showProgress('Open Data Module Reports.Mohon Tunggu...');
  Application.CreateForm(Tdmrpt, dmrpt);
  splash.showProgress('Open form View Rontgen. Mohon Tunggu...');
  Application.CreateForm(TfrmViewRontgen, frmViewRontgen);
  splash.showProgress('Open form Poli Treatment. Mohon Tunggu...');
  Application.CreateForm(TfrmPoliTreatment, frmPoliTreatment);
  splash.showProgress('Open form View Service Dokter. Mohon Tunggu...');
  Application.CreateForm(TfrmViewServicedokter, frmViewServicedokter);
  splash.showProgress('Open form Migrasi Rawat Inap. Mohon Tunggu...');
  Application.CreateForm(TfrmMigrasiRawatInap, frmMigrasiRawatInap);
  splash.showProgress('Open Form View Poli Non Migrasi. Mohon Tunggu...');
  Application.CreateForm(Tfrmviewpolinonmigrasi, frmviewpolinonmigrasi);
  splash.showProgress('Open form Tambahan Apotik. Mohon Tunggu...');
  Application.CreateForm(Tfrmtambahanapotik, frmtambahanapotik);
  splash.showProgress('Open form View Tambahan. Mohon Tunggu...');
  Application.CreateForm(Tfrmviewtambahan, frmviewtambahan);
  splash.showProgress('Open form Stock Obat. Mohon Tunggu...');
  Application.CreateForm(TfrmStokobat, frmStokobat);
  splash.showProgress('Open form Harga Obat. Mohon Tunggu...');  
  Application.CreateForm(Tfrmhargaobat, frmhargaobat);
  splash.showProgress('Open form Ganti Password. Mohon Tunggu...');
  Application.CreateForm(TfrmGantiPassword, frmGantiPassword);
  splash.showProgress('Open form Edit Obat. Mohon Tunggu...');
  Application.CreateForm(TfrmEditObat, frmEditObat);
  splash.showProgress('Open form Satuan. Mohon Tunggu...');
  Application.CreateForm(TfrmSatuan, frmSatuan);
  splash.showProgress('Open form Antrian. Mohon Tunggu...');
  Application.CreateForm(Tfrmantrian, frmantrian);
  splash.showProgress('Open form Edit Karyawan. Mohon Tunggu...');
  Application.CreateForm(TfrmEditKaryawan, frmEditKaryawan);
  splash.showProgress('Open Form Racikan. Mohon Tunggu...');
  Application.CreateForm(Tfrmracikan, frmracikan);
  splash.showProgress('Open form tarif lab. Mohon Tunggu...');
  Application.CreateForm(Tfrmtariflab, frmtariflab);
 splash.showProgress('Open form View tarif lab. Mohon Tunggu...');
  Application.CreateForm(Tfrmviewtariflab, frmviewtariflab);
 splash.showProgress('Open form View Pasien lab. Mohon Tunggu...');
  Application.CreateForm(TfrmViewPasienLab, frmViewPasienLab);
 splash.showProgress('Open form Hasil lab. Mohon Tunggu...');
  Application.CreateForm(TfrmHasilLab, frmHasilLab);
 splash.showProgress('Open form View Reg lab. Mohon Tunggu...');  
  Application.CreateForm(TfrmViewRegLab, frmViewRegLab);
  splash.showProgress('Load data Cetak. Mohon Tunggu...');
  Application.CreateForm(Tfrmcetakkwitansilab, frmcetakkwitansilab);
  Application.CreateForm(TfrmCetakJualApotik, frmCetakJualApotik);
  Application.CreateForm(TfrmTambahDeposit, frmTambahDeposit);
  Application.CreateForm(Tfrmbillrontgen, frmbillrontgen);
  Application.CreateForm(TfrmViewPasienRontgen, frmViewPasienRontgen);
  Application.CreateForm(Tfrmsettingwktkeluar, frmsettingwktkeluar);
  splash.showProgress('Load Billing data. Mohon Tunggu...');
  Application.CreateForm(TfrmLaporanBilling, frmLaporanBilling);
  Application.CreateForm(TfrmUangKeluar, frmUangKeluar);
  Application.CreateForm(TfrmJenisTindakan, frmJenisTindakan);
  splash.showProgress('Load Data Komisi. Mohon Tunggu...');
  Application.CreateForm(TfrmKomisiDokter, frmKomisiDokter);
  Application.CreateForm(TfrmRawatBaby, frmRawatBaby);
  splash.showProgress('Load General Report. Mohon Tunggu...');
  Application.CreateForm(Tfrmlaporanakhir, frmlaporanakhir);
  Application.CreateForm(TfrmViewCustApotik, frmViewCustApotik);
  Application.CreateForm(TfrmBillingUGD, frmBillingUGD);
  splash.showProgress('Load Data Diagnosa. Mohon Tunggu...');
  Application.CreateForm(TfrmDiagnosa, frmDiagnosa);
  Application.CreateForm(Tfrmviewpolidiag, frmviewpolidiag);
  splash.showProgress('Load Form Laporan Akhir. Mohon Tunggu....');
  Application.CreateForm(TfrmViewPenyakit, frmViewPenyakit);
  //Application.CreateForm(TfrmSplash, frmSplash);
  Splash.closeSplash;
  Application.Run;
end.

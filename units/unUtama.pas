unit unUtama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, jpeg, StdCtrls, Buttons,db,adodb, ComCtrls;

type
  TfrmUtama = class(TForm)
    mnUtama: TMainMenu;
    mnFile: TMenuItem;
    smSetting: TMenuItem;
    smExit: TMenuItem;
    mnMaster: TMenuItem;
    Pasien1: TMenuItem;
    Dokter1: TMenuItem;
    Karyawan1: TMenuItem;
    mnRawatInap: TMenuItem;
    JasaLayanan1: TMenuItem;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Timer1: TTimer;
    lblPoli: TLabel;
    lblRawatInap: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Poli1: TMenuItem;
    Kamar1: TMenuItem;
    Panel2: TPanel;
    anu: TMenuItem;
    Apotik2: TMenuItem;
    Supplier1: TMenuItem;
    Obat1: TMenuItem;
    Inventory1: TMenuItem;
    lblTreatment: TLabel;
    lblApotik: TLabel;
    smGantipassword: TMenuItem;
    Perusahaan1: TMenuItem;
    RumahSakit1: TMenuItem;
    mnBilling: TMenuItem;
    Billing1: TMenuItem;
    Migrasi1: TMenuItem;
    Laboratorium1: TMenuItem;
    Group1: TMenuItem;
    Item1: TMenuItem;
    Rontgen2: TMenuItem;
    RumahSakit2: TMenuItem;
    DokterBidan1: TMenuItem;
    mnPref: TMenuItem;
    BiayaAdministrasi1: TMenuItem;
    gbBilling: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    scAktif: TLabel;
    scNonAktif: TLabel;
    scPoli: TLabel;
    scLab: TLabel;
    Bevel5: TBevel;
    Label5: TLabel;
    mnPoli: TMenuItem;
    MigrasiRawatInap1: TMenuItem;
    Poli3: TMenuItem;
    mnRegistrasi: TMenuItem;
    Poli4: TMenuItem;
    RawatInap1: TMenuItem;
    Alkes2: TMenuItem;
    mnApotik: TMenuItem;
    Penjualan1: TMenuItem;
    Data1: TMenuItem;
    arif1: TMenuItem;
    mnLab: TMenuItem;
    Layanan2: TMenuItem;
    Migrasi2: TMenuItem;
    CetakHasilLab1: TMenuItem;
    Lainlain1: TMenuItem;
    Label6: TLabel;
    Label7: TLabel;
    MasterBarang1: TMenuItem;
    SatuanObat1: TMenuItem;
    AntiranPoli1: TMenuItem;
    arif2: TMenuItem;
    Laboratorium2: TMenuItem;
    Lab1: TMenuItem;
    RegistrasiLab1: TMenuItem;
    RegistrasiRontgen1: TMenuItem;
    LaporanPenjualan1: TMenuItem;
    Rontgen1: TMenuItem;
    Rontgen3: TMenuItem;
    UangKeluarPengeluaranKas1: TMenuItem;
    Laporan1: TMenuItem;
    mnlaporan: TMenuItem;
    KomisiDokter1: TMenuItem;
    ambahDeposit1: TMenuItem;
    CashFlow1: TMenuItem;
    Apotik1: TMenuItem;
    DiagnosaPasien1: TMenuItem;
    GawatDarurat1: TMenuItem;
    PengembalianKas1: TMenuItem;
    ResetJumlahKamar1: TMenuItem;
    InventoryBarangMasuk1: TMenuItem;
    LaporanBarangMasuk1: TMenuItem;
    Laboratorium3: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    KategoriObat1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    LaporanPenggunaanPsikotropika1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Expired1: TMenuItem;
    GudangAsalBarang1: TMenuItem;
    KartuStock1: TMenuItem;
    StokOpname1: TMenuItem;
    LaporanStockOpname1: TMenuItem;
    procedure Karyawan1Click(Sender: TObject);
    procedure Pasien1Click(Sender: TObject);
    {procedure InstalasiGawatDaruratIGD1Click(Sender: TObject);}
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure lblRegistrasiPasienMouseEnter(Sender: TObject);
    procedure lblRegistrasiPasienMouseLeave(Sender: TObject);
    procedure lblPoliMouseEnter(Sender: TObject);
    procedure lblPoliMouseLeave(Sender: TObject);
    procedure lbligdMouseEnter(Sender: TObject);
    procedure lbligdMouseLeave(Sender: TObject);
    procedure lblPoliClick(Sender: TObject);
    procedure lblRegistrasiPasienClick(Sender: TObject);
    procedure Poli1Click(Sender: TObject);
    procedure Departemen1Click(Sender: TObject);
    procedure Kamar1Click(Sender: TObject);
    procedure anuClick(Sender: TObject);
    procedure lblRawatInapClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure reatment1Click(Sender: TObject);
    procedure mnPoliClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure JasaLayanan1Click(Sender: TObject);
    procedure lblTreatmentClick(Sender: TObject);
    procedure lblTreatmentMouseEnter(Sender: TObject);
    procedure lblTreatmentMouseLeave(Sender: TObject);
    procedure lblRawatInapMouseLeave(Sender: TObject);
    procedure lblRawatInapMouseEnter(Sender: TObject);
    procedure lblApotikMouseEnter(Sender: TObject);
    procedure lblApotikMouseLeave(Sender: TObject);
    procedure lblApotikClick(Sender: TObject);
    procedure smSettingClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label3Click(Sender: TObject);
    procedure smGantipasswordClick(Sender: TObject);
    procedure smExitClick(Sender: TObject);
    procedure Perusahaan1Click(Sender: TObject);
    procedure Migrasi1Click(Sender: TObject);
    procedure Group1Click(Sender: TObject);
    procedure Item1Click(Sender: TObject);
    procedure Rontgen2Click(Sender: TObject);
    procedure RumahSakit2Click(Sender: TObject);
    procedure DokterBidan1Click(Sender: TObject);
    procedure Rontgen1Click(Sender: TObject);
    procedure BiayaAdministrasi1Click(Sender: TObject);
    procedure Alkes1Click(Sender: TObject);
    procedure rial1Click(Sender: TObject);
    procedure Aktif1Click(Sender: TObject);
    procedure scAktifClick(Sender: TObject);
    procedure scNonAktifClick(Sender: TObject);
    procedure Pendaftaran1Click(Sender: TObject);
    procedure Poli4Click(Sender: TObject);
    procedure RawatInap1Click(Sender: TObject);
    procedure Penjualan1Click(Sender: TObject);
    procedure Data1Click(Sender: TObject);
    procedure arif1Click(Sender: TObject);
    procedure Poli3Click(Sender: TObject);
    procedure Layanan1Click(Sender: TObject);
    procedure Layanan2Click(Sender: TObject);
    procedure Alkes2Click(Sender: TObject);
    procedure Migrasi2Click(Sender: TObject);
    procedure MigrasiRawatInap1Click(Sender: TObject);
    procedure Inventory1Click(Sender: TObject);
    procedure CetakHasilLab1Click(Sender: TObject);
    procedure Lainlain1Click(Sender: TObject);
    procedure MasterBarang1Click(Sender: TObject);
    procedure Stok1Click(Sender: TObject);
    procedure Obat1Click(Sender: TObject);
    procedure Billing1Click(Sender: TObject);
    procedure Registrasi1Click(Sender: TObject);
    procedure SatuanObat1Click(Sender: TObject);
    procedure AntiranPoli1Click(Sender: TObject);
    procedure arif2Click(Sender: TObject);
    procedure InputTarifLab1Click(Sender: TObject);
    procedure Laboratorium2Click(Sender: TObject);
    procedure Lab1Click(Sender: TObject);
    procedure RegistrasiLab1Click(Sender: TObject);
    procedure LaporanPenjualan1Click(Sender: TObject);
    procedure ambahDepositRawatInap1Click(Sender: TObject);
    procedure Rontgen3Click(Sender: TObject);
    procedure RegistrasiRontgen1Click(Sender: TObject);
    procedure UangKeluarPengeluaranKas1Click(Sender: TObject);
    procedure Laporan1Click(Sender: TObject);
    procedure KomisiDokter1Click(Sender: TObject);
    procedure ambahDeposit1Click(Sender: TObject);
    procedure CashFlow1Click(Sender: TObject);
    procedure Apotik1Click(Sender: TObject);
 
    procedure FormActivate(Sender: TObject);
    procedure GawatDarurat1Click(Sender: TObject);
    procedure DiagnosaPasien1Click(Sender: TObject);
    procedure PengembalianKas1Click(Sender: TObject);
    procedure ResetJumlahKamar1Click(Sender: TObject);
    procedure InventoryBarangMasuk1Click(Sender: TObject);
    procedure LaporanBarangMasuk1Click(Sender: TObject);
    procedure Laboratorium3Click(Sender: TObject);
    procedure KategoriObat1Click(Sender: TObject);
    procedure LaporanPenggunaanPsikotropika1Click(Sender: TObject);
    procedure Expired1Click(Sender: TObject);
    procedure GudangAsalBarang1Click(Sender: TObject);
    procedure KartuStock1Click(Sender: TObject);
    procedure StokOpname1Click(Sender: TObject);
    procedure LaporanStockOpname1Click(Sender: TObject);
  private
    { Private declarations }
   
  public
    { Public declarations }
    function cekMarkUp(kodeKamar : string):integer;

  end;

var
  frmUtama: TfrmUtama;
  isLayanan : integer;
  isPoli : integer;
  isRawatInap :integer;
  isMaster : integer;
  isTreatment : integer;
  isService : integer;
  isCurrentPassword : string;
  isCurrentUser : string;
  isLab : integer;
  isIsiLab: integer;
  isPrintLab : integer;
  isLayananRontgen : integer;
  transaksiObat:integer;
  isCetakPoli : integer;
  isPrintPoli : integer;
  kodekamar : string;
  tarifrontgen : integer;
  islabpoli : integer;
  isReglabpoli : integer;
  islabrawatinap : integer;
  isLabLuar : integer;
  isPoliTreatment : integer;
  isPendingMigrasi : integer;
  kodelayananpoli: string;
  oldqty:integer;
  currentQty : integer;
  isError : integer;
  isGantiPassword : integer;
  username : string;
  group : string;
  isCreator : integer;
  isRacikan : integer;
  isRegistrasiPasien : integer;
  isInputHasilLab : integer;
  isCetakKwitansiLab : integer;
  istambahdeposit:integer;
  isKonsul : integer;
  isbillingrontgen : integer;
  isObatOK : integer;
  isObatVK : integer;
  istindakansederhana  : integer;
  isTindakanSedang     : integer;
  isTindakanBesar      : integer;
  isTindakanKhusus     : integer;
  isOk : integer;
  isVK : integer;
  isRegLab : integer;
  isCetakugd : integer;
  isPembelian : integer;
  //noregPoli : string;
  //newqty:integer;
implementation

uses unFrmViewDokter, unFrmViewKaryawan, unFrmViewPasien, 
  unFrmPasien, unFrmAddPasien, unFrmPoli, unFrmViewPoli,
  unFrmViewDepartemen, unFrmViewBed, unFrmApotik, unfrmObat,
  unFrmRawatInap, unFrmMaster, unFrmTransaksiRawatInap, unFrmService,
  unFrmSetting, unFrmPassword, unViewObat, unFrmPerusahaan,
  unFrmRumahSakit, unFrmMigrasi, unFrmGroupLab, unFrmItemLab,
  unFrmLab, unFrmCetakLab, unFrmRontgen, unFrmPerujuk, unFrmLayananRontgen,
  unFrmPreferensi, unFrmAlkes, unitFrmBillingPasienNonAktif, unfrmApotek,
  unfrmtarifdokter, unfrmcetak, unfrmpolitreatment, unfrmmigrasirawatinap,
  unfrmviewpolinonmigrasi, unfrmtambahanapotik, unfrmstokobat,
  unfrmhargaobat, unfrmgantipassword, unfrmsatuanobat, unfrmantrian,
  unfrmtariblab, unfrmviewtariflab, unfrmViewPasienlab, unFrmRegLab,
  unfrmhasillab, unfrmcetakkwitansilab, unfrmcetakjualapotik,
  unfrmtambahdeposit, frmbillingrontgen, unfrmuangkeluar,
  unfrmlaporanbilling, unDm, unfrmkomisidokter, unfrmlaporanakhir,
  unfrmviewcustapotik, unfrmbillingugd, unfrmdiagnosa, unfrmkembalikas,
  frmresetbed, pembelianun, lapbrgmasukun, frmlabreportun, kategoriobatun,
  psikouseun, expiredun, gudangun, kartustockun, stockopnameun,
  stockopnamerptun;

{$R *.dfm}

function TfrmUtama.cekMarkUp(kodeKamar : string):integer;
begin
  with dm.dsetAdministrasi do
  begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from taadministrasi '+
   'where adkelas like (:kode) ';
   parameters.ParamByName('kode').Value := kodeKamar;
   active:=true;

   if isEmpty=false then
   begin
    result := fieldByName('adTindakan').AsInteger;
   end;
  end;
end;

procedure TfrmUtama.Karyawan1Click(Sender: TObject);
begin
  frmViewKaryawan.Show;
end;

procedure TfrmUtama.Pasien1Click(Sender: TObject);
begin
  frmViewPasien.Show;
end;

{procedure TfrmUtama.InstalasiGawatDaruratIGD1Click(Sender: TObject);
begin
 frmLayanan.Show;
end;}

procedure TfrmUtama.FormCreate(Sender: TObject);
begin

 isLayanan :=0;
end;

procedure TfrmUtama.Timer1Timer(Sender: TObject);
var today : TDateTime;
begin
    today := now();
    label1.Caption :=  TimeToStr(today);
end;

procedure TfrmUtama.lblRegistrasiPasienMouseEnter(Sender: TObject);
begin
  //lblRegistrasiPasien.Font.Color := clYellow;
  //lblRegistrasiPasien.Font.Style := [fsBold,fsUnderline];
end;

procedure TfrmUtama.lblRegistrasiPasienMouseLeave(Sender: TObject);
begin
   //lblRegistrasiPasien.Font.Color := clWhite;
  //lblRegistrasiPasien.Font.Style := [fsBold];
end;

procedure TfrmUtama.lblPoliMouseEnter(Sender: TObject);
begin
 {lblPoliUmum.Font.Color := clYellow;
 lblPoliUmum.Font.Style := [fsBold,fsUnderline];}
end;

procedure TfrmUtama.lblPoliMouseLeave(Sender: TObject);
begin
  {lblPoliUmum.Font.Color := clWhite;
 lblPoliUmum.Font.Style := [fsBold];}

end;

procedure TfrmUtama.lbligdMouseEnter(Sender: TObject);
begin
  //lbligd.Font.Color := clYellow;
  //lbligd.Font.Style := [fsBold,fsUnderline];
end;

procedure TfrmUtama.lbligdMouseLeave(Sender: TObject);
begin
  //lbligd.Font.Color := clWhite;
  //lbligd.Font.Style := [fsBold];
end;

procedure TfrmUtama.lblPoliClick(Sender: TObject);
begin
  frmPoli.Show;
end;

procedure TfrmUtama.lblRegistrasiPasienClick(Sender: TObject);
begin
 frmAddPasien.Show;
end;

procedure TfrmUtama.Poli1Click(Sender: TObject);
begin
  frmViewPoli.Show;
  
end;

procedure TfrmUtama.Departemen1Click(Sender: TObject);
begin
 frmViewDepartemen.Show;
end;

procedure TfrmUtama.Kamar1Click(Sender: TObject);
begin
  
  frmViewBed.Show;
end;

procedure TfrmUtama.anuClick(Sender: TObject);
begin
  frmTreatment.Show;
end;


procedure TfrmUtama.lblRawatInapClick(Sender: TObject);
begin

frmRawatInap.Show;

end;

procedure TfrmUtama.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=VK_F12)  then
  begin
    frmMaster.ShowModal;
  end;
end;

procedure TfrmUtama.reatment1Click(Sender: TObject);
begin
 frmTreatment.Show;
end;

procedure TfrmUtama.mnPoliClick(Sender: TObject);
begin
 frmRawatInap.Show; 
end;

procedure TfrmUtama.Label2Click(Sender: TObject);
begin
 frmTreatment.Show;
end;

procedure TfrmUtama.JasaLayanan1Click(Sender: TObject);
begin
 isTreatment:=0;
 frmService.Show;
end;

procedure TfrmUtama.lblTreatmentClick(Sender: TObject);
begin
 frmTreatMent.Show;
end;

procedure TfrmUtama.lblTreatmentMouseEnter(Sender: TObject);
begin
 lblTreatment.Font.Color := clYellow;
lblTreatment.Font.Style := [fsBold,fsUnderline];
end;

procedure TfrmUtama.lblTreatmentMouseLeave(Sender: TObject);
begin
 lblTreatment.Font.Color := clWhite;
lblTreatment.Font.Style := [fsBold];
end;

procedure TfrmUtama.lblRawatInapMouseLeave(Sender: TObject);
begin
 lblRawatInap.Font.Color := clWhite;
lblRawatInap.Font.Style := [fsBold];
end;

procedure TfrmUtama.lblRawatInapMouseEnter(Sender: TObject);
begin
 lblRawatInap.Font.Color := clYellow;
lblRawatInap.Font.Style := [fsBold,fsUnderline];
end;

procedure TfrmUtama.lblApotikMouseEnter(Sender: TObject);
begin
    lblApotik.Font.Color := clYellow;
    lblApotik.Font.Style := [fsBold,fsUnderline];
end;

procedure TfrmUtama.lblApotikMouseLeave(Sender: TObject);
begin
     lblApotik.Font.Color := clWhite;
     lblApotik.Font.Style := [fsBold];
end;

procedure TfrmUtama.lblApotikClick(Sender: TObject);
begin
  frmApotik.Show;
end;

procedure TfrmUtama.smSettingClick(Sender: TObject);
begin
 frmSetting.ShowModal;
end;

procedure TfrmUtama.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmPassword.Close;
end;

procedure TfrmUtama.Label3Click(Sender: TObject);
begin
 showMessage(isCurrentPassword);
end;

procedure TfrmUtama.smGantipasswordClick(Sender: TObject);
begin
 if isGantiPassword<>1 then
 begin
  frmGantiPassword.Show;
 end else if MessageDlg('Anda Baru Saja Melakukan Pergantian Password!'+#13+
 'Untuk Mengganti Kembali Password Anda Diharap Keluar dari Software.'+#13+
 'Keluar Dari Software Sekarang?',mtError,[mbYes,mbNo],0)=mrYes then
 begin
   frmUtama.Close;
 end;
end;

procedure TfrmUtama.smExitClick(Sender: TObject);
begin
if MessageDlg('Keluar dari cpKlinik?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
    close;
end; 
end;

procedure TfrmUtama.Perusahaan1Click(Sender: TObject);
begin
 frmPerusahaan.Show;
end;

procedure TfrmUtama.Migrasi1Click(Sender: TObject);
begin
 frmMigrasi.ShowModal;
end;

procedure TfrmUtama.Group1Click(Sender: TObject);
begin
  frmGroupLab.Show;
end;

procedure TfrmUtama.Item1Click(Sender: TObject);
begin
 frmItemLab.Show;
end;

procedure TfrmUtama.Rontgen2Click(Sender: TObject);
begin
 frmRontgen.Show;
end;

procedure TfrmUtama.RumahSakit2Click(Sender: TObject);
begin
  frmRumahSakit.Show;
end;

procedure TfrmUtama.DokterBidan1Click(Sender: TObject);
begin
 frmPerujuk.Show;
end;

procedure TfrmUtama.Rontgen1Click(Sender: TObject);
begin
 frmLayananRontgen.Show;
end;

procedure TfrmUtama.BiayaAdministrasi1Click(Sender: TObject);
begin
 frmPreferensi.Show;
end;

procedure TfrmUtama.Alkes1Click(Sender: TObject);
begin
  frmAlkes.Show;
end;

procedure TfrmUtama.rial1Click(Sender: TObject);
begin
 frmPasien.Show;
end;

procedure TfrmUtama.Aktif1Click(Sender: TObject);
begin
  //frmBillingRawatInap.Show;
end;

procedure TfrmUtama.scAktifClick(Sender: TObject);
begin
 //frmBillingRAwatInap.Show;
end;

procedure TfrmUtama.scNonAktifClick(Sender: TObject);
begin
  frmBillingPasienNonAktif.Show;
end;

procedure TfrmUtama.Pendaftaran1Click(Sender: TObject);
begin
 frmPoli.Show;
end;

procedure TfrmUtama.Poli4Click(Sender: TObject);
begin
 frmPoli.Show;
 frmpoli.btnNew.SetFocus;
end;

procedure TfrmUtama.RawatInap1Click(Sender: TObject);
begin
 frmRawatInap.Show;
end;

procedure TfrmUtama.Penjualan1Click(Sender: TObject);
begin
 frmApotek.Show;
end;

procedure TfrmUtama.Data1Click(Sender: TObject);
begin
 frmViewDokter.Show;
end;

procedure TfrmUtama.arif1Click(Sender: TObject);
begin
 frmTarifdokter.Show;
end;

procedure TfrmUtama.Poli3Click(Sender: TObject);
begin
 frmCetak.Show;
end;

procedure TfrmUtama.Layanan1Click(Sender: TObject);
begin
 frmLayananRontgen.Show;
end;

procedure TfrmUtama.Layanan2Click(Sender: TObject);
begin
  frmHasilLab.ShowModal;
end;

procedure TfrmUtama.Alkes2Click(Sender: TObject);
begin
 frmPoliTreatment.Show;
end;

procedure TfrmUtama.Migrasi2Click(Sender: TObject);
begin
 frmMigrasiRawatInap.Show;
end;

procedure TfrmUtama.MigrasiRawatInap1Click(Sender: TObject);
begin
 frmViewPolinonmigrasi.Show;
end;

procedure TfrmUtama.Inventory1Click(Sender: TObject);
begin
 frmtambahanapotik.Show;
end;

procedure TfrmUtama.CetakHasilLab1Click(Sender: TObject);
begin
  frmCetakLab.Show;
end;

procedure TfrmUtama.Lainlain1Click(Sender: TObject);
begin
 frmAddPasien.Show;
end;

procedure TfrmUtama.MasterBarang1Click(Sender: TObject);
begin
 frmViewObat.Show;
end;

procedure TfrmUtama.Stok1Click(Sender: TObject);
begin
 frmstokobat.Show;
end;

procedure TfrmUtama.Obat1Click(Sender: TObject);
begin
 frmHargaObat.Show;
end;

procedure TfrmUtama.Billing1Click(Sender: TObject);
begin
  frmBillingPasienNonAktif.Show;
end;

procedure TfrmUtama.Registrasi1Click(Sender: TObject);
begin
 frmAddPasien.Show;
end;

procedure TfrmUtama.SatuanObat1Click(Sender: TObject);
begin
 frmSatuan.Show;
end;

procedure TfrmUtama.AntiranPoli1Click(Sender: TObject);
begin
 frmAntrian.Show;
end;

procedure TfrmUtama.arif2Click(Sender: TObject);
begin
 frmTAriflab.Show;
end;

procedure TfrmUtama.InputTarifLab1Click(Sender: TObject);
begin
 frmViewPasienLab.Show;
end;

procedure TfrmUtama.Laboratorium2Click(Sender: TObject);
begin
 frmRegLab.Show;
end;

procedure TfrmUtama.Lab1Click(Sender: TObject);
begin
  frmCetakKwitansiLab.Show;
end;

procedure TfrmUtama.RegistrasiLab1Click(Sender: TObject);
begin
 frmREgLab.Show;
end;

procedure TfrmUtama.LaporanPenjualan1Click(Sender: TObject);
begin
 frmCetakJualApotik.Show;
end;

procedure TfrmUtama.ambahDepositRawatInap1Click(Sender: TObject);
begin
 frmtambahdeposit.Show;
end;

procedure TfrmUtama.Rontgen3Click(Sender: TObject);
begin
 frmbillrontgen.show;
end;

procedure TfrmUtama.RegistrasiRontgen1Click(Sender: TObject);
begin
 frmLayananRontgen.Show;
end;

procedure TfrmUtama.UangKeluarPengeluaranKas1Click(Sender: TObject);
begin
 frmUangKeluar.Show;
end;

procedure TfrmUtama.Laporan1Click(Sender: TObject);
begin
 frmLaporanbilling.Show;
end;

procedure TfrmUtama.KomisiDokter1Click(Sender: TObject);
begin
 frmkomisidokter.Show;
end;

procedure TfrmUtama.ambahDeposit1Click(Sender: TObject);
begin
 frmTambahDeposit.Show;
end;

procedure TfrmUtama.CashFlow1Click(Sender: TObject);
begin
 frmlaporanakhir.Show;
end;

procedure TfrmUtama.Apotik1Click(Sender: TObject);
begin
 frmViewCustApotik.Show;
end;



procedure TfrmUtama.FormActivate(Sender: TObject);
begin
{ begin
    with progressbar1 do
    begin
      min :=0;
      max := dm.dSetPasien.RecordCount;
      dm.dSetPasien.First;
      for i:= min to max do
      begin
       position :=i;
       dm.dSetPasien.Next;
      end;
    end;
 }
end;

procedure TfrmUtama.GawatDarurat1Click(Sender: TObject);
begin
 frmBillingugd.Show;
end;

procedure TfrmUtama.DiagnosaPasien1Click(Sender: TObject);
begin
  frmDiagnosa.Show;
end;

procedure TfrmUtama.PengembalianKas1Click(Sender: TObject);
begin
 frmKembalikas.Show;
end;

procedure TfrmUtama.ResetJumlahKamar1Click(Sender: TObject);
begin
  resetkamarfrm.ShowModal;
end;

procedure TfrmUtama.InventoryBarangMasuk1Click(Sender: TObject);
begin
 Pembelianfrm.ShowModal;
end;

procedure TfrmUtama.LaporanBarangMasuk1Click(Sender: TObject);
begin
 if lapbrgmasukfrm=nil then
 begin
  application.createform(Tlapbrgmasukfrm,lapbrgmasukfrm);
  lapbrgmasukfrm.ShowModal;
 end else
 begin
 lapbrgmasukfrm.ShowModal;
 end;
end;

procedure TfrmUtama.Laboratorium3Click(Sender: TObject);
begin
 frmlabreport.Show;
end;

procedure TfrmUtama.KategoriObat1Click(Sender: TObject);
begin
  if KategoriObatfrm=nil then
  begin
     application.CreateForm(TKategoriObatfrm,kategoriObatfrm);
     kategoriObatfrm.Show;
  end else
  begin
     KategoriObatfrm.Show;
  end;
end;

procedure TfrmUtama.LaporanPenggunaanPsikotropika1Click(Sender: TObject);
begin
 psikotopikafrm.Show;
end;

procedure TfrmUtama.Expired1Click(Sender: TObject);
begin
 expiredfrm.ShowModal;
end;

procedure TfrmUtama.GudangAsalBarang1Click(Sender: TObject);
begin
  gudangfrm.Show;
end;

procedure TfrmUtama.KartuStock1Click(Sender: TObject);
begin
 if kartustockfrm = nil  then
 begin
   application.CreateForm(TKartuStockfrm,kartuStockfrm);
   kartustockfrm.Show;
 end else
 begin
   kartustockfrm.Show;
 end;
end;

procedure TfrmUtama.StokOpname1Click(Sender: TObject);
begin
 if stockopnamefrm=nil then
 begin
   application.CreateForm(TStockopnamefrm,stockopnamefrm);
   stockopnamefrm.Showmodal;
 end else
 begin
   stockopnamefrm.Showmodal;
 end;
end;

procedure TfrmUtama.LaporanStockOpname1Click(Sender: TObject);
begin
 if stockopnamerptfrm = nil then
 begin
   application.CreateForm(TStockopnamerptfrm,stockopnamerptfrm);
   stockopnamerptfrm.ShowModal;
 end else
 begin
     stockopnamerptfrm.ShowModal;
 end;

end;

end.

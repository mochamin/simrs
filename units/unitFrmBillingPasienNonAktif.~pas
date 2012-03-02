unit unitFrmBillingPasienNonAktif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, adodb,db,Grids, DBGrids, Buttons, RpDefine, RpRave,
  RpCon,DateUtils, RpConDS,StrUtils, RpBase, RpSystem;

type
  TfrmBillingPasiennonaktif = class(TForm)
    Panel: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtCariNama: TEdit;
    gridViewPasien: TDBGrid;
    btnreksementara: TBitBtn;
    RvRawatInap: TRvProject;
    rvRwt: TRvDataSetConnection;
    rvkamardetail: TRvDataSetConnection;
    btnSetKeluar: TBitBtn;
    rvrawatinapdetail: TRvDataSetConnection;
    rvMedicine: TRvDataSetConnection;
    rvlayanrontgen: TRvDataSetConnection;
    rvpolitorwtinap: TRvDataSetConnection;
    btnbillakhir: TBitBtn;
    Rvprojectsumrawatinap: TRvProject;
    dsetsumkamardetail: TADODataSet;
    rvsumkamardetail: TRvDataSetConnection;
    dsetsumobat: TADODataSet;
    rvsumobat: TRvDataSetConnection;
    dsetsumrawatdetail: TADODataSet;
    rvrawatdetail: TRvDataSetConnection;
    rvsumvisite: TRvDataSetConnection;
    dsetsumvisite: TADODataSet;
    rvsumkonsul: TRvDataSetConnection;
    dsetsumkonsul: TADODataSet;
    rvsumlab: TRvDataSetConnection;
    dsetsumlab: TADODataSet;
    rvsumtindakan: TRvDataSetConnection;
    dsetsumtindakan: TADODataSet;
    dsetsumobatvk: TADODataSet;
    rvsumobatvk: TRvDataSetConnection;
    dsetrptsumpasien: TADODataSet;
    rvrptsumpasien: TRvDataSetConnection;
    dsetkmr: TADODataSet;
    rvkmr: TRvDataSetConnection;
    BitBtn3: TBitBtn;
    dsetdetailkamar: TADODataSet;
    dsetkamaraktif: TADODataSet;
    dsetadministrasi: TADODataSet;
    rvrptLab: TRvDataSetConnection;
    dsetrptlab: TADODataSet;
    dsetekg: TADODataSet;
    dsetOK: TADODataSet;
    rvok: TRvDataSetConnection;
    rvekg: TRvDataSetConnection;
    dsetusg: TADODataSet;
    rvusg: TRvDataSetConnection;
    dsetobatOK: TADODataSet;
    rvobatOK: TRvDataSetConnection;
    dsetpic: TADODataSet;
    dsetgenservice: TADODataSet;
    rvgeneralservice: TRvDataSetConnection;
    dsetlaprawatbaby: TADODataSet;
    rvlaprawatbaby: TRvDataSetConnection;
    dsetbayarrawatinap: TADODataSet;
    dsetinapkeluar: TADODataSet;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    dsetlapdeposit: TADODataSet;
    rvlapdeposit: TRvDataSetConnection;
    RvProjectDeposit: TRvProject;
    RvSystem: TRvSystem;
    btnrefresh: TBitBtn;
    procedure btnreksementaraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure txtCariNamaChange(Sender: TObject);
    procedure btnbillakhirClick(Sender: TObject);
    procedure btnSetKeluarClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dsetrptlabBeforeOpen(DataSet: TDataSet);
    procedure dsetrptlabAfterOpen(DataSet: TDataSet);
    procedure dsetOKBeforeOpen(DataSet: TDataSet);
    procedure dsetOKAfterOpen(DataSet: TDataSet);
    procedure dsetekgBeforeOpen(DataSet: TDataSet);
    procedure dsetekgAfterOpen(DataSet: TDataSet);
    procedure dsetusgBeforeOpen(DataSet: TDataSet);
    procedure dsetusgAfterOpen(DataSet: TDataSet);
    procedure dsetdetailkamarAfterOpen(DataSet: TDataSet);
    procedure dsetdetailkamarBeforeOpen(DataSet: TDataSet);
    procedure dsetkamaraktifBeforeOpen(DataSet: TDataSet);
    procedure dsetkamaraktifAfterOpen(DataSet: TDataSet);
    procedure dsetkmrBeforeOpen(DataSet: TDataSet);
    procedure dsetkmrAfterOpen(DataSet: TDataSet);
    procedure dsetadministrasiBeforeOpen(DataSet: TDataSet);
    procedure dsetadministrasiAfterOpen(DataSet: TDataSet);
    procedure dsetrptsumpasienBeforeOpen(DataSet: TDataSet);
    procedure dsetrptsumpasienAfterOpen(DataSet: TDataSet);
    procedure dsetsumkamardetailBeforeOpen(DataSet: TDataSet);
    procedure dsetsumkamardetailAfterOpen(DataSet: TDataSet);
    procedure dsetsumkonsulBeforeOpen(DataSet: TDataSet);
    procedure dsetsumkonsulAfterOpen(DataSet: TDataSet);
    procedure dsetsumvisiteBeforeOpen(DataSet: TDataSet);
    procedure dsetsumvisiteAfterOpen(DataSet: TDataSet);
    procedure dsetsumlabBeforeOpen(DataSet: TDataSet);
    procedure dsetsumlabAfterOpen(DataSet: TDataSet);
    procedure dsetsumtindakanBeforeOpen(DataSet: TDataSet);
    procedure dsetsumtindakanAfterOpen(DataSet: TDataSet);
    procedure dsetgenserviceBeforeOpen(DataSet: TDataSet);
    procedure dsetgenserviceAfterOpen(DataSet: TDataSet);
    procedure dsetlaprawatbabyBeforeOpen(DataSet: TDataSet);
    procedure dsetlaprawatbabyAfterOpen(DataSet: TDataSet);
    procedure dsetobatOKBeforeOpen(DataSet: TDataSet);
    procedure dsetobatOKAfterOpen(DataSet: TDataSet);
    procedure dsetsumobatBeforeOpen(DataSet: TDataSet);
    procedure dsetsumobatAfterOpen(DataSet: TDataSet);
    procedure dsetsumrawatdetailBeforeOpen(DataSet: TDataSet);
    procedure dsetsumrawatdetailAfterOpen(DataSet: TDataSet);
    procedure dsetlapdepositBeforeOpen(DataSet: TDataSet);
    procedure dsetlapdepositAfterOpen(DataSet: TDataSet);
    procedure dsetbayarrawatinapBeforeOpen(DataSet: TDataSet);
    procedure dsetbayarrawatinapAfterOpen(DataSet: TDataSet);
    procedure btnrefreshClick(Sender: TObject);
  private
    { Private declarations }
    procedure setPasienKeluar;
    procedure setBayiKeluar;

  public
   procedure refreshRawatInap;
    { Public declarations }
  end;

var
  frmBillingPasiennonaktif: TfrmBillingPasiennonaktif;

implementation

uses unDm,kwitansi, unfrmpasswordsetwkt,unUtama,unFungsi,unfrmwait;

{$R *.dfm}


procedure TfrmBillingPasienNonAktif.setBayiKeluar;
var jmlhari : double;
    tglkeluar,tglmasuk : TDate;
    noreg : string;
begin
  noreg := gridViewPasien.Fields[0].Value;
  tglKeluar := date();

  with dm.dsetrawatbaby do
  begin
   active:=false;
    commandType := cmdText;
   commandText := 'select * from tarawatbaby '+
   'where rbnoreg like (:noreg) ';
   parameters.ParamByName('noreg').Value := noreg;
   active:=true;

   if isEmpty=false then
   begin
    open;
    edit;
    tglmasuk := strToDate(fieldByName('rbtglmasuk').AsString);
    jmlHari:=daysBetween(tglKeluar,tglMasuk);

    if jmlhari=0 then
    begin
     fieldByName('rbnumofdays').AsFloat :=1;
    end else
    begin
      fieldByName('rbnumofdays').AsFloat := jmlhari;
    end;
    fieldByName('rbtglkeluar').AsString := dateToStr(date());
    post;
    updatebatch(arAll);
   end;

  end; // end of dsetrawatbaby
end;

procedure TfrmBillingPasienNonAktif.setPasienKeluar;
var noreg : string;
    tglMasuk : TDate;
    TglKeluar : TDate;
    jmlHari : double;
    jamkeluar : TTime;
begin
 jmlHari:=0;
 noreg := gridViewPasien.Fields[0].Value;
 tglKeluar := date();

if MessageDlg('Set Pasien Keluar?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
  with dm.dsetKamarDetail do
  begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from takamardetail '+
   'where kdactive=1 '+
   'and kdnoreg like (:noreg) ';
   parameters.ParamByName('noreg').Value := noreg;
   active:=true;

   if isempty=false then
   begin
     open;
     edit;
     tglMasuk := fieldByName('kdtglmasuk').AsDateTime;
     fieldByname('KdTglKeluar').AsDateTime := date();
     fieldByName('kdJamKeluar').AsDateTime := time();
     jmlHari:=daysBetween(tglKeluar,tglMasuk);
     //showMessage(inttostr(jmlhari));
     jamkeluar := time();
     
     if jmlHari=0 then
     begin
          jmlhari:=1;
          fieldByname('kdNumOfDays').AsFloat := jmlHari;
     end
     else if jamkeluar > strToTime('11:55:00') then
          begin
            fieldByname('kdNumOfDays').AsFloat := jmlHari+1;
          end else
          begin
           fieldByname('kdNumOfDays').AsFloat := jmlHari;
         end;
      


     post;
     setBayiKeluar; // setting perawatan bayi jika ada

   end;

   with dsetinapkeluar do
   begin
   active:=false;
   commandType := cmdTExt;
   commandText := 'select * from tarawatinap '+
   'where innoreg like (:noreg) ';
   parameters.ParamByName('noreg').Value := noreg;
   active:=true;

   if isEmpty=false then
   begin
    open;
    edit;
    fieldByName('inTglKeluar').AsString := dateToStr(date());
    fieldByName('inJamKeluar').AsString := timeToStr(time());
    post;
    updateBatch(arCurrent);
    showMessage('Setting Pasien Telah Tersimpan...');
   end;
   end;

  end;
end; // end of if messagedlg  
end;

procedure TfrmBillingPasiennonAktif.refreshRawatInap;
begin

 with dm.dsetRptRawatInap do
 begin
   active := false;
  commandType := cmdText;
  commandText :='select * from  tarawatinap,tapasien '+
  'where psKodePasien LIKE inNoRM '+
  'and inisbayar=0 ';
   active := true;
 end;
end;

procedure TfrmBillingPasiennonaktif.btnreksementaraClick(Sender: TObject);
var tempNoReg : string;
begin
 btnreksementara.Enabled := false;

///////////// aktifasi data module //////////////////////

  if dm.dsetRptRawatInap.Active = false then dm.dsetRptRawatInap.Active := true;
  if dm.dsetrptrawatinapdetail.Active = false then dm.dsetrptrawatinapdetail.Active := true;
  if dm.dsetRptKamarDetail.Active = false then dm.dsetRptKamarDetail.Active := true;
//  if dm.dSetObat.Active = false then dm.dSetObat.Active := true;
  if dm.dsetrptlayananrontgen.Active = false then dm.dsetrptlayananrontgen.Active := true;
  if dm.dsetrptpolitorwtinap.Active = false then dm.dsetrptpolitorwtinap.Active := true;
  if dm.dsetrptobat.Active = false then dm.dsetrptobat.Active := true;
////////////////////////////////////////////////////
 
 tempNoReg := gridViewPasien.Fields[0].Value;
 with dm.dsetRptRawatInap do
 begin
   active := false;
  commandType := cmdText;
  commandText :='select * from  tarawatinap,tapasien '+
  'where psKodePasien LIKE inNoRM '+  
  'and innoreg like (:noreg) ';
  parameters.ParamByName('noreg').Value := tempnoreg;
  active := true;

  if isEmpty=false then
  begin
   // showMessage('found');
  end;
 end;

  screen.Cursor := crHourGlass;
  dm.dsetRptKamarDetail.Requery();
  dm.dsetrptrawatinapdetail.Requery();
  dm.dsetrptobat.Requery();
  dm.dsetrptlayananrontgen.Requery();
  dm.dsetrptpolitorwtinap.Requery();
  dsetrptlab.Active := true;
  dsetrptlab.Requery();
  screen.Cursor := crDefault;
  rvRawatInap.ProjectFile := 'rawatInap.rav';

   rvRawatInap.Open;

  rvRawatInap.SelectReport('rawatInap',true);
  rvRawatInap.SetParam('noReg',tempNoReg);

  rvRawatInap.Execute;
  refreshrawatinap;
   btnreksementara.Enabled := true;
end;

procedure TfrmBillingPasiennonaktif.FormActivate(Sender: TObject);
begin
  refreshrawatInap;
 txtcarinama.SetFocus;
end;

procedure TfrmBillingPasiennonaktif.txtCariNamaChange(Sender: TObject);
begin
 with dm.dsetRptRawatInap do
 begin
  Locate('psnama',txtCariNama.Text,[loPartialKey]);
 end;
end;

procedure TfrmBillingPasiennonaktif.btnbillakhirClick(Sender: TObject);
var terbilang : string;
    noreg     :string;
    jmlhari   : double;
    tarif     : double;
    total,subtotalobat      : double;
    totalObat  : double;
    totalkamar : double;
    subtotalrontgen,totalrontgen : double;
    grandTotal : double;
    totalobatvk,subtotalobatvk:double;
    tanggal : string;
    tglKeluar : TDate;
    subTotalVisite,subtotalkonsul : double;
    TotalVisite,totalkonsul : double;
    totaltindakan,subtotaltindakan : double;
    totalLab,subtotallab : double;
    totalSementara : double;
    Biayaadministrasi : double;
    persenAdministrasi : double;
    namapasien,tempatasnama : string;
    kodekamaraktif : string;
    totalUangMuka : double;
    totalSelisihBayar : double;
    keteranganbayar : string;
    koderontgen : string;
    ketVisite : string;
    subtotalOk,totalOk : double;
    subTotalEKG,totalEKG : double;
    subTotalUSG,totalUSG : double;
    subtotalObatOK,totalObatOK : double;
    totGeneralservice : double;
    subtotgeneralservice : double;
    totalrawatbayi,totalselisih : double;
    ketrawatbayi : string;
    noKwitansi : string;
begin


      noreg := trim(gridviewpasien.Fields[0].Value);
      totalselisih      :=0;
      totalSementara    :=0;
      jmlHari           :=0;
      total             :=0;
      grandTotal        :=0;
      totalkamar        :=0;
      totalobat         :=0;
      totalrontgen      :=0;
      totalkonsul       :=0;
      totallab          :=0;
      totaltindakan     :=0;
      totalobatvk       :=0;
      totalUangMuka     :=0;
      totalSelisihBayar :=0;
      totalOk           :=0;
      subTotalOK        :=0;
      totalEKG          :=0;
      subTotalEKG       :=0;
      totalUSG          :=0;
      subTotalUSG       :=0;
      subTotalObatOK    :=0;
      totalObatOK       :=0;
      totgeneralservice :=0;
      totalrawatbayi    :=0;

//showMessage('masuk dsetlaprawatbaby');



with dsetlaprawatbaby do
begin
    active:=false;
    commandType := cmdtext;
    commandText :='select * from tarawatbaby '+
    'where rbnoreg like (:noreg) ';
    parameters.ParamByName('noreg').Value := noreg;
    active:=true;

    if isEmpty=false then
    begin
      totalRAwatBayi := (fieldByName('rbnumofdays').asInteger)*(fieldByName('rbtarifkamar').AsFloat);
      ketrawatBayi := '- Perawatan Baby Sejak Tanggal : '+
                      fieldByName('rbtglmasuk').AsString+' s/d Tanggal '+
                      fieldByName('rbTglKeluar').AsString;
    end;


end;// end of dsetrawatbaby

//showMessage('masuk dsetgenservice');
with dsetgenservice do
begin
  active:=false;
    commandType := cmdtext;
    commandText :='select * from tarawatinapdetail '+
    'where idisobat=0 '+
    'and idtotal<>0 '+
    'and idnoreg like (:noreg) ';
    parameters.ParamByName('noreg').Value := noreg;
    active:=true;

    if isEmpty=false then
    begin
    first;
    while not eof do
    begin
    subTotGeneralService:=fieldByName('idTotal').AsFloat;
    totGeneralService :=totGeneralService+subTotGeneralService;
    next;
    end;
    end;

end;// end of dsetgenservice

//showMessage('Masuk DSETRPTSUMPASIEN');
with dsetrptsumpasien do
begin
   active:=false;
    commandType := cmdtext;
    commandText :='select * from tarawatinap,tapasien '+
    'where innorm like pskodepasien '+
    'and innoreg like (:noreg)';
    parameters.ParamByName('noreg').Value := noreg;
    active:=true;

    namapasien := fieldByName('psNama').AsString;
    totalUangMuka :=fieldByName('indeposit').AsFloat;
    //'Biaya Perawatan dan Pengobatan An. '+
end;

//showMessage('DSETKAMARAKTIF');
// cari kamar aktif untuk menentukan besaran persentase administrasi
with dsetkamaraktif do
begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from takamardetail '+
 'where kdActive=1 '+
 'and kdnoreg like (:noreg) ';
 parameters.ParamByName('noreg').Value := noreg;
 active:=true;

 kodekamaraktif := fieldByName('kdKamar').AsString;

end;

//setelah kodekamar ditemukan cari persen administrasinya di tabel taADministrasi

//showMessage('DSETADMINISTRASI');
with dsetadministrasi do
begin
  active:=false;
 commandType := cmdText;
 commandText := 'select * from taadministrasi '+
 'where adkelas like (:kelas) ';
 parameters.ParamByName('kelas').Value := kodeKamarAktif;
 active:=true;

 persenadministrasi := fieldByName('adAdmin').AsInteger/100;

end; // end of dsetadministrasi

//showMessage('DSETKMR');
 with dsetkmr do
 begin
    active:=false;
    commandType := cmdtext;
    commandText :='select * from takamar,takamardetail '+
    'where kaKode like kdkamar '+
    'and kdnoreg like (:noreg)';
    parameters.ParamByName('noreg').Value := noreg;
    active:=true;

    //showMessage(fieldByname('innoreg').AsString);
     if isempty=false then
     begin

      first;
      while not eof do
      begin

        tarif   :=fieldByName('kdtarif').AsFloat;
        jmlhari :=fieldbyname('kdnumofdays').AsInteger;

        if jmlhari<1 then jmlhari:=1;
        //showMessage(intToStr(jmlhari));
        total      := tarif*jmlhari;
        totalkamar := totalkamar+total;

      next;
      end; // end of eof
     end;  // end of if isempty


  // cek apabila tgl keluar masih kosong maka tgl keluar diisi hari ini
   if  (fields.fieldbyname('kdtglkeluar').Value)=null then
   begin
     tglkeluar:=date();
   end else
       begin
        tglKeluar := fields.fieldbyname('kdtglkeluar').AsDateTime;
       end;

   Tanggal := 'Bekasi,'+FormatDateTime('dd mmmm yyyy',tglKeluar);
 end;  // end with dset


   tempAtasNama:=inputBox('Kwitansi Atas Nama: ',tempAtasnama,'');
   if Length(tempAtasNama)=0 then
   begin
     tempAtasNama:= namapasien;
   end;

//showMessage('DSETDETAILKAMAR');
// dataset untuk menampilkan detail kamar di report
with dsetdetailkamar do
 begin
    active:=false;
    commandType := cmdtext;
    commandText :='select * from takamar,takamardetail '+
    'where kakode like kdkamar ';
    active:=true;
end;

//showMessage('DSETSUMOBAT');

 with dsetsumobat do
 begin
  active:=false;
  commandType:=cmdText;
  commandText := 'select * from tarawatinapdetail '+
  'where idisobat=1 '+
  'and idstatuskamar="RIN" '+
  'and idnoreg like (:noreg) ';
  parameters.ParamByName('noreg').Value:=noreg;
  active:=true;

  if isempty=false then
  begin
  first;
  while not eof do
  begin
    subtotalobat :=fieldByname('idtotal').Value;
    totalobat    := totalobat+subtotalobat;
    next;
  end; // end of while not eof
  end; // end of isempty
 end; // end of dsetsumobat

//showMessage('DSETSUMRAWATDETAIL');
 with dsetsumrawatdetail do
 begin
  active:=false;
  commandType:=cmdText;
  commandText:='select * from tarawatinap,tarawatinapdetail '+
  'where innoreg like idnoreg '+
  'and idgroup ="general service" '+
  'and innoreg like (:noreg) ';
  parameters.ParamByName('noreg').Value := noreg;
  active:=true;
 end;//end of dsetsumrawatdetail


// showMessage('DSETSUMVISITE');
 with dsetsumvisite do
 begin
  active:=false;
  commandType:=cmdText;
  commandText:='select *, sum(idservicerate) as subTotalVisite, count(idservicerate) as xvisite '+
  'from tarawatinapdetail '+
  'where idisobat=2 and idstatuskamar="RIN" '+
  'and idnoreg like (:noreg) '+
  'group by idkodesv ';
  parameters.ParamByName('noreg').Value := noreg;
  active:=true;

 if isempty=false then
 begin
    first;
    while not eof do
    begin

    subTotalVisite := fieldByName('subTotalVisite').Value;
    TotalVisite := totalVisite+subTotalVisite;
    next;
    end;
   ketVisite := '- Visite '+trim(fieldByName('idNamaService').AsString);
 end;

 end;//end of dsetsumvisite

//showMessage('DSETOK');
 with dsetok do
 begin
  active:=false;
  commandType:=cmdText;
  commandText:='select * from tarawatinapdetail '+
  'where idisobat <> 1 '+
  'and idstatuskamar="OK" '+
  'and idnoreg like (:noreg) ';
  parameters.ParamByName('noreg').Value := noreg;
  active:=true;

   if isempty=false then
   begin
     first;
     while not eof do
     begin
     subtotalok := fieldByName('idtotal').AsFloat;
     totalOk    := totalOk+SubTotalOK;
     next;
     end;
   end;

 end;

// obat OK
//showMessage('DSETOBATOK');
 with dsetObatOk do
 begin
  active:=false;
  commandType:=cmdText;
  commandText:= 'select * from tarawatinapdetail '+
  'where idisobat=1 '+
  'and idstatuskamar="OK" '+
  'and idnoreg like (:noreg) ';
  parameters.ParamByName('noreg').Value := noreg;
  active:=true;

  if isEmpty=false then
  begin
    first;
    while not eof do
    begin
    subtotalobatOK := fieldByName('idtotal').AsFloat;
    totalObatOK    := totalObatOK+subTotalObatOK;
    next;
    end;
  end; //end of isEmpty

  end; // end of dsetobat OK

// showMessage('DSETSUMTINDAKAN');
 with dsetsumtindakan do
 begin
  active:=false;
  commandType:=cmdText;
  commandText:='select * from talayananpoli,talayananpolidetail '+
  'where lpnoreg like ldnoreg '+
  'and lpkoderawatinap like (:noreg) ';
  parameters.ParamByName('noreg').Value := noreg;
  active:=true;

 if isempty=false then
 begin
   // showMessage('ada konsul');
    first;
    while not eof do
    begin
    subTotalTindakan := fieldByName('ldTotal').Value;
    TotalTindakan := totalTindakan+subTotalTindakan;

    next;
    end;
 end;

 end;//end of dsetsum konsul

      // showMessage(floatToStr(totalKonsul));

  //layanan rontgen
//showMessage('DM.DSETRTPLAYANANRONTGEN');
  with dm.dsetrptlayananrontgen do
  begin
    active:=false;
    commandType := cmdText;
    commandText := 'select * from talayananrontgen '+
    'where lrkoderontgen not like "%ekg%" '+
    'and lrkoderontgen not like "%usg%" '+
    'and lrnotransaksi like (:noreg) ';
   parameters.ParamByName('noreg').Value  := noreg;
    active:=true;

    if isempty=false then
    begin
      first;
      while not eof do
      begin
         subtotalrontgen := fieldByName('lrtotal').AsFloat;
         totalrontgen := totalRontgen+subTotalRontgen;
      next;
      end;
    end;

  end;

//showMessage('DSETEKG');
  // summary EKG
  with dsetekg do
  begin
    active:=false;
    commandType := cmdText;
    commandText := 'select * from talayananrontgen '+
    'where lrkoderontgen like "%ekg%" '+
    'and lrnotransaksi like (:noreg) ';
   parameters.ParamByName('noreg').Value  := noreg;
    active:=true;

    if isEmpty=false then
    begin
     first;
     while not eof do
     begin
       subTotalEKG := fieldByName('lrTotal').AsFloat;
       totalEKG := totalEKG+subTotalEkg;
     next;
     end;
    end;

  end; // end of dsetekg


//showMessage('DSETUSG');
   // summary USG
  with dsetusg do
  begin
    active:=false;
    commandType := cmdText;
    commandText := 'select * from talayananrontgen '+
    'where lrkoderontgen like "%usg%" '+
    'and lrnotransaksi like (:noreg) ';
   parameters.ParamByName('noreg').Value  := noreg;
    active:=true;

    if isEmpty=false then
    begin
     first;
     while not eof do
     begin
       subTotalUSG := fieldByName('lrTotal').AsFloat;
       totalUSG := totalUSG+subTotalUSG;
     next;
     end;
    end;

  end; // end of dsetekg

//showMessage('DSETSUMLAB');
  // summary lab
  with dsetsumlab do
  begin
    active:=false;
    commandType := cmdTExt;
    commandText := 'select * from talab '+
    'where lbnorm like (:noreg) ';
    parameters.ParamByName('noreg').Value := noreg;
    active:=true;

    if isempty=false then
    begin
      first;
      while not eof do
      begin
      subTotalLab := fieldByName('lbtotal').AsFloat;
      totallab:=totalLab+subtotalLab;
      next;
      end;
    end;
  end;


//showMessage('DSETSUMOBATVK');
  with dsetsumobatvk do
  begin
    active:=false;
    commandType := cmdTExt;
    commandText := 'select * from tarawatinapdetail '+
    'where idisobat=1 and idstatuskamar="VK" '+
    'and idnoreg like (:noreg) ';
    parameters.ParamByName('noreg').Value := noreg;
    active:=true;

     if isempty=false then
    begin
      first;
      while not eof do
      begin
      subTotalobatvk := fieldByName('idtotal').AsFloat;
      totalobatVk:=totalObatVk+subtotalObatVk;
      next;
      end;
    end;

  end;

//showMessage('MASUK SUMMARY TOTAL');
  totalSementara    := totalkamar+totalobat+totalvisite+totalRontgen+totalLab
                       +totalTindakan+totalObatVK+totalOK+totalEKG+totalUSG
                       +totalObatOK+totGeneralService+totalrawatbayi;

  biayaAdministrasi := totalSementara*persenAdministrasi;
  grandTotal        := round(totalSementara+BiayaAdministrasi);
  totalSelisih      := grandTotal-TotalUangMuka;

//showMessage('Masuk Logic selisih');
  if totalSelisih<0 then
  begin
    totalSelisihBayar := totalSelisih*(-1);
    keteranganbayar   := 'Yang Harus Dikembalikan ';
  end else
      begin
       totalSelisihBayar := totalSelisih;
       keteranganBayar := 'Yang Harus Dibayar ';
      end;

  //grandTotal := round(grandTotal);
  //showMessage('sampai konversi terbilang..');
  terbilang:=rupiah(floatToStr(grandTotal));
  NoKwitansi := autonumberKwitansi(noreg,grandTotal);

  Rvprojectsumrawatinap.ProjectFile := 'billingsummary.rav';

  Rvprojectsumrawatinap.Open;

  Rvprojectsumrawatinap.SelectReport('billingsummary',true);
  Rvprojectsumrawatinap.SetParam('terbilang',ansiUppercase(terbilang));
  Rvprojectsumrawatinap.SetParam('rp',floatToStr(grandTotal));
  Rvprojectsumrawatinap.SetParam('uraian',namapasien);
  Rvprojectsumrawatinap.SetParam('tanggal',tanggal);
  Rvprojectsumrawatinap.SetParam('totVisite',floatToStr(totalVisite));
  Rvprojectsumrawatinap.SetParam('totKonsul',floatToStr(totalKonsul));
  Rvprojectsumrawatinap.SetParam('totRontgen',floatToStr(totalRontgen));
  Rvprojectsumrawatinap.SetParam('totLab',floatToStr(totalLab));
  Rvprojectsumrawatinap.SetParam('totTindakan',floatToStr(totalTindakan));
  Rvprojectsumrawatinap.SetParam('totAdministrasi',floatToStr(BiayaAdministrasi));
  Rvprojectsumrawatinap.SetParam('totObatVK',floatToStr(totalObatVK));
  Rvprojectsumrawatinap.SetParam('atasnama',ansiUppercase(tempatasnama));
  Rvprojectsumrawatinap.SetParam('ketVisite',ketVisite);
  Rvprojectsumrawatinap.SetParam('ketbayar',keteranganBayar);
  Rvprojectsumrawatinap.SetParam('totalobat',floatToStr(totalobat));
  Rvprojectsumrawatinap.SetParam('ketrawatbayi',ketrawatbayi);
  Rvprojectsumrawatinap.SetParam('totrawatbayi',floatToStr(totalrawatbayi));
  Rvprojectsumrawatinap.SetParam('totobatOK',floatToStr(totalobatOK));
  Rvprojectsumrawatinap.SetParam('totEKG',floatToStr(totalEKG));
  Rvprojectsumrawatinap.SetParam('totUSG',floatToStr(totalUSG));
  Rvprojectsumrawatinap.SetParam('totUangMuka',floatToStr(totalUangMuka));
  Rvprojectsumrawatinap.SetParam('totSelisihBayar',floatToStr(totalSelisihBayar));
  Rvprojectsumrawatinap.SetParam('totgrand',floatToStr(grandTotal));
  Rvprojectsumrawatinap.SetParam('nokwitansi',ansiUppercase(nokwitansi));
//  rvRawatInap.SetParam('noReg',tempNoReg);

  Rvprojectsumrawatinap.Execute;

//// /////set username masukkan ke dalam dbase rawatinap beserta pembayarannya

if dsetbayarrawatinap.Active = false then dsetbayarrawatinap.Active:=true;
with dsetbayarrawatinap do
begin
  { active:=false;
    commandType := cmdtext;
    commandText :='select * from tarawatinap '+
    'where innoreg like (:noreg)';
    parameters.ParamByName('noreg').Value := noreg;
    active:=true;
   }
    if locate('innoreg',trim(gridViewPasien.Fields[0].Value),[loCaseInsensitive])=true then
    begin

    if fieldByName('inTotal').Value = grandTotal then
    begin
     exit;
    end;

    open;
    edit;
    fieldByName('inpic').AsString := isCurrentUser;
    fieldByName('inbayar').AsFloat := totalSelisih;
    fieldByName('inTotal').AsFloat := grandTotal;
    fieldByName('inisbayar').AsInteger := 1;
    post;
    updatebatch(arAll);
    btnrefresh.Click;
    end; // end of if locate
end;
///// end of set pembayaran

///// REFRESH GRID /////////////////////////
 with dm.dsetRptRawatInap do
 begin
 active:=false;
 commandType := cmdText;
 commandTExt := 'SELECT * FROM tarawatinap, tapasien '+
 'WHERE innorm like pskodepasien '+
 'and inisbayar=0 ';
 active:=true;
 end;

/////////////////////////////////////////
end;

procedure TfrmBillingPasiennonaktif.btnSetKeluarClick(Sender: TObject);
begin
  SetPasienKeluar;
end;

procedure TfrmBillingPasiennonaktif.BitBtn3Click(Sender: TObject);
begin
 frmSettingwktkeluar.ShowModal;
end;

procedure TfrmBillingPasiennonaktif.BitBtn5Click(Sender: TObject);
begin
 close;
end;

procedure TfrmBillingPasiennonaktif.BitBtn4Click(Sender: TObject);
var noreg : string;
    namapasien : string;
    deposit : double;
    terbilang,tanggal : string;
    tempAtasNama,kamar,keterangan : string;
    tglMasuk : TDate;
    noKwitansi : string;
begin

 noreg := gridViewPasien.fields[0].Value;
 namapasien := gridViewPasien.fields[1].Value;
 kamar      := gridViewPasien.Fields[9].Value;


 with dsetlapdeposit do
 begin
  active:=false;
  commandType := cmdText;
  commandText := 'select * from tarawatinap '+
  'where innoreg like (:noreg) ';
  parameters.ParamByName('noreg').Value := noreg;
  active:=true;

  if isEmpty=false then
  begin
    deposit    := fieldByName('indeposit').AsFloat;
    tglMasuk  := fieldByName('inTglMasuk').AsDateTime;
    Tanggal := 'Bekasi, '+FormatDateTime('dd mmmm yyyy',date());
  end;
   terbilang := rupiah(floatToStr(deposit));
 end;

  Keterangan := 'Uang DEPOSIT Rawat Inap Pasien '+namaPasien+#13+
  'Kamar '+kamar;

   tempAtasNama:=inputBox('Kwitansi Atas Nama: ',tempAtasnama,'');
   if Length(tempAtasNama)=0 then
   begin
     tempAtasNama:= namapasien;
   end;

  noKwitansi:=autoNumberKwitansi(noreg,deposit); 

  RvProjectDeposit.ProjectFile := 'kwitansideposit.rav';
  RvProjectDeposit.Open;
  RvProjectDeposit.SelectReport('kwitansideposit',true);
  RvProjectDeposit.SetParam('terbilang',AnsiUpperCase(terbilang));
  RvProjectDeposit.SetParam('currentUser',AnsiUpperCase(isCurrentUser));
  RvProjectDeposit.SetParam('nokwitansi',AnsiUpperCase(noKwitansi));
  RvProjectDeposit.SetParam('keterangan',keterangan);
  RvProjectDeposit.SetParam('Tgl',Tanggal);
  RvProjectDeposit.SetParam('grandTotal',floatToStr(deposit));
  RvProjectDeposit.SetParam('atasnama',AnsiUpperCase(tempAtasnama));
  RvProjectDeposit.Execute;

  /// rekam data KASIR uang deposit ////////////
   with dsetlapdeposit do
   begin
    open;
    edit;
    fieldByName('inpicdeposit').AsString := isCurrentUser;
    post;
    updatebatch(arCurrent);
   end;

  //// END OF REKAM DATA KASIR
end;

procedure TfrmBillingPasiennonaktif.dsetrptlabBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Lab. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetrptlabAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetOKBeforeOpen(DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data OK. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetOKAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetekgBeforeOpen(DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data EKG. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetekgAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetusgBeforeOpen(DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data USG. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetusgAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetdetailkamarAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetdetailkamarBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Kamar. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetkamaraktifBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Kamar Aktif. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetkamaraktifAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetkmrBeforeOpen(DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Kamar. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetkmrAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetadministrasiBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Administrasi. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetadministrasiAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetrptsumpasienBeforeOpen(
  DataSet: TDataSet);
begin
   tunggu.openWait;
   tunggu.showWait('Loading data Pasien. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetrptsumpasienAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetsumkamardetailBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Detail Kamar. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetsumkamardetailAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetsumkonsulBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Layanan Dokter. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetsumkonsulAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetsumvisiteBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Visite Dokter. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetsumvisiteAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetsumlabBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Lab. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetsumlabAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetsumtindakanBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Tindakan. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetsumtindakanAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetgenserviceBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Service. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetgenserviceAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetlaprawatbabyBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Rawat Inap Baby. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetlaprawatbabyAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetobatOKBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Obat OK. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetobatOKAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetsumobatBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Obat. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetsumobatAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetsumrawatdetailBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Rawat Detail. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetsumrawatdetailAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetlapdepositBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Deposit. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetlapdepositAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.dsetbayarrawatinapBeforeOpen(
  DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Pembayaran. Mohon Tunggu...');
end;

procedure TfrmBillingPasiennonaktif.dsetbayarrawatinapAfterOpen(
  DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmBillingPasiennonaktif.btnrefreshClick(Sender: TObject);
begin
 with dm.dsetRptRawatInap do
 begin
 active:=false;
 commandType := cmdText;
 commandTExt := 'SELECT * FROM tarawatinap, tapasien '+
 'WHERE innorm like pskodepasien '+
 'and inisbayar=0 ';
 active:=true;
 end;
end;

end.

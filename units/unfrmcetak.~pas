unit unfrmcetak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RpCon, RpConDS, RpDefine, RpRave, DB, ADODB, StdCtrls,
  Buttons, Grids, DBGrids, RpBase, RpSystem;

type
  TfrmCetak = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    rvcoba: TRvDataSetConnection;
    dsetcoba: TADODataSet;
    rvapotik2: TRvDataSetConnection;
    rvApotikDetail: TRvDataSetConnection;
    rvProjectStruk: TRvProject;
    dsetapotikpoilidetail: TADODataSet;
    dsetApotikPoli: TADODataSet;
    txtNama: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    lblUsia: TLabel;
    lblAlamat: TLabel;
    lblNoRM: TLabel;
    d: TLabel;
    lblNoReg: TLabel;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    dsetkwitansipoli: TADODataSet;
    rvKwitansipoli: TRvDataSetConnection;
    dsetrptlayananrontgen: TADODataSet;
    rvlayananrontgen: TRvDataSetConnection;
    btnKwitansi: TBitBtn;
    rvprojectkwitansi: TRvProject;
    dsetlayananpolidetail: TADODataSet;
    rvlayananpolidetail: TRvDataSetConnection;
    rvKasir: TRvDataSetConnection;
    rvleb: TRvDataSetConnection;
    dsetrptlaboratorium: TADODataSet;
    rgoptions: TRadioGroup;
    dsetpolinonobat: TADODataSet;
    rvpolinonobat: TRvDataSetConnection;
    rvProjectpolinonobat: TRvProject;
    btnclose: TBitBtn;
    dsetdokter: TADODataSet;
    rvdokter: TRvDataSetConnection;
    dsetdokterugd: TADODataSet;
    rvdokterugd: TRvDataSetConnection;
    dsetpasien: TADODataSet;
    rvpasien: TRvDataSetConnection;
    rvapotikpoli: TRvDataSetConnection;
    RvSystem: TRvSystem;
    dsetapotikcashier: TADODataSet;
    cd: TLabel;
    er: TLabel;
    lbldokter: TLabel;
    lbljaminan: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnKwitansiClick(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCetak: TfrmCetak;

implementation

uses  unDm, undmrpt,unUtama, unFrmViewPasienPoli,kwitansi,
  unFrmSetting,unfungsi;

{$R *.dfm}

procedure TfrmCetak.BitBtn1Click(Sender: TObject);
var notransaksi : string;
    
begin

 
noTransaksi:=lblnoreg.Caption;

with dsetApotikPoli do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from taapotik '+
   'where apnoregpasien like (:noreg) ';
   parameters.ParamByName('noreg').Value := notransaksi;
   active:=true;


 end;


 rvProjectStruk.ProjectFile:='kwitansiapotik.rav';
 rvProjectStruk.Open;
 rvProjectStruk.SelectReport('kwitansiapotik.rav',true);
 rvProjectStruk.SetParam('noreg',notransaksi);
 rvProjectStruk.SetParam('namapasien',txtnama.Text);
 rvProjectStruk.SetParam('jaminan',lbljaminan.Caption);
 rvProjectStruk.SetParam('namadokter',lbldokter.Caption);
 
 rvProjectStruk.SetParam('currentuser',AnsiUpperCase(iscurrentuser));

 rvProjectStruk.Execute;
/// catat nama user di tabel apotik
with dsetapotikpoli do
begin
 active:=false;
 commandType := cmdText;
 commandText :='select * from taapotik '+
 'where apnoregpasien like (:noreg) ';
 parameters.ParamByName('noreg').Value := notransaksi;
 active:=true;

  open;
   edit;
   fieldByName('appic').AsString := isCurrentUser;
   post;
   updateBatch(arCurrent);
end;   
end;

procedure TfrmCetak.FormActivate(Sender: TObject);
begin
  isPrintPoli:=1;
  rgoptions.ItemIndex:=0;
end;

procedure TfrmCetak.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 isPrintPoli:=0;
end;

procedure TfrmCetak.txtNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
  frmViewPasienPoli.ShowModal;
 end;
end;

procedure TfrmCetak.btnKwitansiClick(Sender: TObject);
var notransaksi : string;
    tempAtasnama : string;
    kodeDokter  : string;
    total,totalapotik,tarifdokter,subtotalapotik,totallab,totalrontgen : double;
    terbilang : string;
    tanggal : String;
    totalugd,subtotalugd : double;
    kodePasien : string;
    pasien : string;
    wkt : TTime;
    noKwitansi : string;
begin
noTransaksi:=lblnoreg.Caption;

dsetlayananpolidetail.Open;
//dsetlayananpolidetail.Requery();


total:=0;
totalugd :=0;
tarifdokter :=0;
totalapotik :=0;
subtotalapotik :=0;

if rgoptions.ItemIndex=0 then
begin
 with dsetKwitansiPoli do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talayananpoli '+
   'where lpnoreg like (:noreg) ';
   parameters.ParamByName('noreg').Value := notransaksi;
   active:=true;


   if isempty=false then
   begin
     kodeDokter    := fieldByName('lpkodedokter').AsString;
     Tanggal       := formatDateTime('dd mmmm yyyy',fields.fieldbyname('lpTgl').AsDateTime);
     kodePasien    := fieldByName('lpkodepasien').AsString;
     wkt           := fieldByName('lpwktdaftar').AsDateTime;
     tarifdokter   := fieldByName('lpkonsuldokter').AsFloat;
   end;


 end;

with dsetapotikpoli do
begin
 active:=false;
 commandType := cmdText;
 commandText :='select * from taapotik '+
 'where apnoregpasien like (:noreg) ';
 parameters.ParamByName('noreg').Value := notransaksi;
 active:=true;

 if isEmpty=false then
 begin
 //showmessage('data exist');
 first;
 while not eof do
 begin
 subtotalapotik := fieldByName('aptotal').AsFloat;
 //showmessage('Sub Total Apotik : '+floattostr(subtotalapotik));
 totalapotik    := totalapotik+subtotalapotik;
 //showmessage('Total Apotik : '+floatToStr(totalapotik));
 next;
 end;
 end;

end;

 with dsetpasien do
 begin
 active:=false;
 commandType := cmdText;
 commandText :='select * from tapasien '+
 'where pskodepasien like (:kode) ';
 parameters.ParamByName('kode').Value := kodePasien;
 active:=true;

 if isempty=false then
 begin
      tempAtasNama:=inputBox('Kwitansi Atas Nama: ',tempAtasnama,'');

       if Length(tempAtasNama)=0 then
       begin
         tempAtasNama:= fields.fieldByName('psnama').AsString;
       end;
 end;

 end;

 with dsetdokter do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from tadokter,tatarifdokter '+
   'where dkkodedokter like tdkodedokter '+
   'and dkkodedokter like (:kode) ';
   parameters.ParamByName('kode').Value := kodeDokter;
   active:=true;

  // tarifdokter := isiTarifDokter(kodeDokter,'KONSUL',wkt);
 end;

 with dsetlayananpolidetail do
 begin
   active:=false;
   commandType := cmdtext;
   commandText := 'select * from talayananpolidetail '+
   'where ldnoreg like (:noreg) ';
   parameters.ParamByName('noreg').Value := notransaksi;
   active:=true;

   if isEmpty=false then
   begin
    first;
    while not eof do
    begin
    subtotalugd := fieldByName('ldtotal').AsFloat;
    totalugd    := totalugd+subtotalugd;
    next;
    end;
   end;

 end;


 with dsetdokterUGD do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talayananpolidetail '+
   'where ldisservice =2 '+
   'and ldnoreg like (:kode) ';
   parameters.ParamByName('kode').Value := notransaksi;
   active:=true;
 end;

 with dsetrptlaboratorium do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talab '+
   'where lbnorm like (:noreg)';
   parameters.ParamByName('noreg').Value := notransaksi;
   active:=true;

   totalLab:=0;
   if isempty=false then
   begin
    first;
    totalLab:=0;
    while not eof do
    begin
     // showMessage(fields.fieldbyname('lbtotal').AsString);
     totallab:=totallab+fields.fieldbyname('lbtotal').AsInteger;
     //showMessage(intToStr(totallab));
     next;
    end;
    //showMessage('grand total lab'+intToStr(totallab));
   end;

 end;

 with dsetrptlayananrontgen do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talayananrontgen '+
   'where lrnotransaksi like (:noreg)';
   parameters.ParamByName('noreg').Value := notransaksi;
   active:=true;

   if isempty=false then
   begin
    first;
    totalrontgen:=0;
    while not eof do
    begin
     // showMessage(fields.fieldbyname('lbtotal').AsString);
     totalrontgen:=totalrontgen+fields.fieldbyname('lrtotal').AsInteger;
     //showMessage(intToStr(totallab));
     next;
    end;
    //showMessage('grand total lab'+intToStr(totallab));
   end;

 end;


 //showmessage(floatToStr(totalapotik));

 total:= round(totalapotik+tarifdokter+totallab+totalrontgen+totalugd);
 terbilang:=ansiUpperCAse(rupiah(floatToStr(total)));

 noKwitansi := autoNumberKwitansi(noTransaksi,total);

 rvprojectkwitansi.ProjectFile:='polikwitansi.rav';
 rvprojectkwitansi.Open;
 rvprojectkwitansi.SelectReport('polikwitansi.rav',true);
 rvprojectkwitansi.SetParam('noreg',notransaksi);
 rvprojectkwitansi.SetParam('currentuser',AnsiUpperCase(iscurrentuser));
 rvProjectkwitansi.SetParam('atasnama',AnsiUpperCase(tempAtasNama));
 rvProjectkwitansi.SetParam('terbilang',terbilang);
 rvProjectkwitansi.SetParam('noKwitansi',noKwitansi);
 rvProjectkwitansi.SetParam('tgl',tanggal);
 rvProjectkwitansi.SetParam('tarifdokter',floatToStr(tarifDokter));
 rvProjectkwitansi.SetParam('totUgd',floatToStr(TotalUGD));
 rvProjectkwitansi.SetParam('totapotik',floatToStr(Totalapotik));
 rvProjectkwitansi.SetParam('grandTotal',floatToStr(Total));
 rvprojectkwitansi.Execute;


 if MessageDlg('Set Pasien Keluar?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
    if dm.dsetLayananPoli.Active = false then dm.dsetLayananPoli.Active := true;
    with dm.dsetLayananPoli do
    begin
      if Locate('lpnoreg',lblnoreg.Caption,[loCaseInsensitive])=true then
      begin
        open;
        edit;
        fields.FieldByName('lpisbayar').AsInteger:=1;
        fields.FieldByName('lpatasnama').AsString := AnsiUpperCase(tempAtasNama);
        //Recordset.Properties['update Criteria'].Value := 'adCriteriaKey';
        post;
      end;
    end;
 end;  // end of ifmessageDlg

///// ISI USERNAME DARI OPERATOR BILLING
if dsetapotikcashier.Active = false then dsetapotikcashier.Active := true;
with dsetapotikcashier do
begin
if locate('apnoregpasien',notransaksi,[loCaseInsensitive])=true then
begin
 edit;
 fieldByName('appic').AsString := isCurrentUser;
 //Recordset.Properties['update Criteria'].Value := 'adCriteriaKey';
 post;
end;
end; //

//showmessage('dsetapotikpoli | Done!');

 if dsetkwitansipoli.Active = false then dsetkwitansipoli.Active := true;
 with dsetKwitansiPoli do
 begin
   if locate('lpnoreg',notransaksi,[loCaseInsensitive])=true then
   begin
   edit;
   fieldByName('lppic').AsString := isCurrentUser;
   post;
   updateBatch(arCurrent);
   end; // end of if locate
 end;

/////// END OF USERNAME OPERATOR BILLING

end else // end of rgoptions
    begin
       with dsetpolinonobat do
       begin
          active:=false;
          commandType := cmdText;
          commandText := 'select * from talayananpoli '+
          'where lpnoreg like (:noreg) ';

       parameters.ParamByName('noreg').Value := notransaksi;
       active:=true;

       if isEmpty=false then
       begin
       // showMessage('qtmu');
         tarifdokter :=0;
         tarifdokter:=fields.fieldbyName('lpkonsuldokter').AsFloat;
         Tanggal := FormatDateTime('dd mmmm yyyy',fields.fieldbyname('lpTgl').AsDateTime);
         kodePasien := lblnorm.Caption;
       end;
      end; // end of dset polinonobat


       with dsetpasien do
       begin
        active:=false;
        commandType := cmdtext;
        commandText := 'select * from tapasien '+
        'where pskodepasien like (:noreg) ';
        parameters.ParamByName('noreg').Value := kodepasien;
        active:= true;

       if isEmpty=false then
       begin
       pasien := fields.fieldByName('psnama').AsString;
       tempAtasNama:=inputBox('Kwitansi Atas Nama: ',tempAtasnama,'');

       if Length(tempAtasNama)=0 then
       begin
         tempAtasNama:= fields.fieldByName('psnama').AsString;

       end;
       end;
       end;  // end of dsetpasien

       //showMessage('End of dsetPasien!');

       Total:=0;
       Total:=round(tarifDokter);
       terbilang := rupiah(floatToStr(total));

       noKwitansi:=autoNumberKwitansi(notransaksi,total);

       rvProjectpolinonobat.ProjectFile:='polinonobat.rav';
       rvProjectpolinonobat.Open;
       rvProjectpolinonobat.SelectReport('polinonobat.rav',true);
       rvProjectpolinonobat.SetParam('noreg',notransaksi);
       rvProjectpolinonobat.SetParam('tgl',tanggal);
       rvProjectpolinonobat.SetParam('currentuser',AnsiUpperCase(iscurrentuser));
       rvProjectpolinonobat.SetParam('atasnama',AnsiUpperCase(tempAtasNama));
       rvProjectpolinonobat.SetParam('noKwitansi',noKwitansi);
       rvProjectpolinonobat.SetParam('pasien',AnsiUpperCase(pasien));
       rvProjectpolinonobat.SetParam('terbilang',AnsiUpperCase(terbilang));
       rvProjectpolinonobat.SetParam('grandTotal',floatToStr(Total));
       rvProjectpolinonobat.Execute;
       //showMessage('End of report!');

    end;// end of else rgoptions

    /// pencatatan username ke dalam pic di table layanan poli
    with dsetKwitansiPoli do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talayananpoli '+
   'where lpnoreg like (:noreg) ';
   parameters.ParamByName('noreg').Value := notransaksi;
   active:=true;

   open;
   edit;
   fieldByName('lppic').AsString := isCurrentUser;
   post;
   updateBatch(arCurrent);
 end;  

    /////////////////// end of pencatatan

end;

procedure TfrmCetak.btncloseClick(Sender: TObject);
begin
 close;
end;

end.

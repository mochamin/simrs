unit unfrmlaporanbilling;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, RpCon, RpConDS, RpDefine,
  RpRave, DB, ADODB, RpRender, RpRenderCanvas, RpRenderPrinter,
  RpRenderPreview, RpBase, RpFiler, RpSystem;

type
  TfrmLaporanBilling = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    rgtipelaporan: TRadioGroup;
    btnclose: TBitBtn;
    btnPreview: TBitBtn;
    tglawal: TMaskEdit;
    tglakhir: TMaskEdit;
    lbltanggal: TLabel;
    lblsd: TLabel;
    dsetlaprawatinap: TADODataSet;
    RvProjectLapBilling: TRvProject;
    rvlaprawatinap: TRvDataSetConnection;
    dsetperiksaobat: TADODataSet;
    rvperiksaobat: TRvDataSetConnection;
    RvProjectlappoli: TRvProject;
    dsetlapuangkeluar: TADODataSet;
    rvlapuangkeluar: TRvDataSetConnection;
    RvProjectCashFlow: TRvProject;
    dsetlaprontgen: TADODataSet;
    rvlaprontgen: TRvDataSetConnection;
    dsetlaplab: TADODataSet;
    rvlaplab: TRvDataSetConnection;
    dsetlapapotik: TADODataSet;
    rvlapapotik: TRvDataSetConnection;
    checkSemua: TCheckBox;
    dsetfinalrawatinap: TADODataSet;
    rvfinalrawatinap: TRvDataSetConnection;
    RvProjectfinalrawatinap: TRvProject;
    dsettambahdeposit: TADODataSet;
    dsetlapdepositrawatinap: TADODataSet;
    rvlapdepositrawatinap: TRvDataSetConnection;
    dsetlaprawatinap2: TADODataSet;
    dsetperiksaonly: TADODataSet;
    rvperiksaonly: TRvDataSetConnection;
    rvProjectPeriksaOnly: TRvProject;
    dsetuangapotik: TADODataSet;
    rvuangapotik: TRvDataSetConnection;
    RvProjectUangApotik: TRvProject;
    rvlabkeuangan: TRvDataSetConnection;
    RvProjectlabkeuangan: TRvProject;
    rvlaprontgenkeuangan: TRvDataSetConnection;
    RvProjectrontgenkeuangan: TRvProject;
    RvSystem: TRvSystem;
    dsetsumperiksaonly: TADODataSet;
    rvsumperiksaonly: TRvDataSetConnection;
    dsetlapkembalikas: TADODataSet;
    rvLapkembalikas: TRvDataSetConnection;
    procedure btncloseClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure rgtipelaporanClick(Sender: TObject);
    procedure checkSemuaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLaporanBilling: TfrmLaporanBilling;

implementation

{$R *.dfm}
uses unUtama;

procedure TfrmLaporanBilling.btncloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLaporanBilling.btnPreviewClick(Sender: TObject);
var keterangan   : string;
    totalPoli    : double;
    totaldeposit,totaltambahdeposit : double;
    subtotaldeposit,subtotaltambahdeposit,deposit : double;
    totallab     : double;
    subtotallab  : double;
    totalrontgen : double;
    subtotalrontgen : double;
    currentuser,penerimaUang : string;
    noUrut,nourutdeposit : integer;
begin

  deposit:=0;

 if checksemua.Checked=false then
 begin
  currentUser := isCurrentUser;
 end else currentUser := '%';

if rgtipelaporan.ItemIndex=0 then
begin



 with dsetlaprawatinap do
 begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from tarawatinap,tapasien,takamar '+
 'where innorm like pskodepasien '+
 'and inkodekamar like kakode '+
 'and inpicdeposit like (:pic) '+
 'and intglmasuk between (:tglawal) and (:tglakhir) ';
 parameters.ParamByName('tglawal').Value  := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentuser;
 active:=true;

 noUrut := recNo;
 end;// end of dsetlaprawatinap


 with dsetlapdepositrawatinap do
 begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from tarawatinap,tapasien,takamar '+
 'where innorm like pskodepasien '+
 'and inkodekamar like kakode '+
 'and intambahdepositpic like (:pic) '+
 'and intgltambahdeposit between (:tglawal) and (:tglakhir) ';
 parameters.ParamByName('tglawal').Value  := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentuser;
 active:=true;


 end; // end of dsetlapdepositrawatinap

 if  (strToDate(tglawal.Text))=  (strToDate(tglakhir.Text)) then
 begin
  keterangan := 'Tanggal : '+tglawal.Text;
 end else
  keterangan := 'Tanggal : '+tglawal.Text+' s/d Tanggal : '+tglakhir.Text;


 //rvNDRWriter.Execute;


 RvProjectLapBilling.ProjectFile:='depositrawatinap.rav';
 RvProjectLapBilling.Open;
 RvProjectLapBilling.SelectReport('depositrawatinap.rav',false);
 RvProjectLapBilling.SetParam('keterangan',keterangan);
 RvProjectLapBilling.SetParam('totalrecord',intToStr(noUrut));


 RvProjectLapBilling.Execute;



 //RvProjectLapBilling.SaveToStream(RaveStream);
 //RvProjectLapBilling.SetParam('noreg',notransaksi);

end else if rgtipelaporan.ItemIndex=1 then
begin
 with dsetfinalrawatinap do
 begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from tarawatinap,tapasien,takamar '+
 'where innorm like pskodepasien '+
 'and inkodekamar like kakode '+
 'and inpic like (:pic) '+
 'and intglkeluar between (:tglawal) and (:tglakhir) ';
 parameters.ParamByName('tglawal').Value  := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentuser;
 active:=true;
 end;

  if  (strToDate(tglawal.Text))=  (strToDate(tglakhir.Text)) then
  begin
   keterangan := 'Tanggal : '+tglawal.Text;
  end else
   keterangan := 'Tanggal : '+tglawal.Text+' s/d Tanggal : '+tglakhir.Text;



 RvProjectfinalrawatinap.ProjectFile:='finalrawatinap.rav';
 RvProjectfinalrawatinap.Open;
 RvProjectfinalrawatinap.SelectReport('finalrawatinap.rav',true);
 RvProjectfinalrawatinap.SetParam('keterangan',keterangan);
 RvProjectfinalrawatinap.Execute;

end else if rgtipelaporan.ItemIndex=2 then
begin
////// ///////////// PEMERIKSAAN DAN OBAT
with dsetperiksaobat do
begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from talayananpoli,tapasien,taapotik '+
 'where lptgl between (:tglawal) and (:tglakhir) '+
 'and aptgl between (:tglaw) and (:tglakh) '+
 'and apnoregpasien like lpnoreg '+
 'and lppic like (:pic) '+
 'and appic like (:appic) '+
 'and lpkodepasien like pskodepasien ';
 parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
 parameters.ParamByName('tglaw').Value := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('tglakh').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentUser;
 parameters.ParamByName('appic').Value := currentUser;
 active:=true;

  if isEmpty=false then showMessage('qtmu');
end; // end of dsetperiksaobat

if  (strToDate(tglawal.Text))=  (strToDate(tglakhir.Text)) then
begin
  keterangan := 'Tanggal : '+tglawal.Text;
end else
  keterangan := 'Tanggal : '+tglawal.Text+' s/d Tanggal : '+tglakhir.Text;

 RvProjectlappoli.ProjectFile:='periksaobat.rav';
 RvProjectlappoli.Open;
 RvProjectlappoli.SelectReport('periksaobat.rav',true);
 RvProjectlappoli.SetParam('keterangan',keterangan);
 RvProjectlappoli.Execute;

 ////////////////// END OF PEMERIKSAAN DAN OBAT
end
else if rgtipelaporan.ItemIndex=3 then
begin
////// ///////////// PEMERIKSAAN ONLY

with dsetperiksaONLY do
begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from talayananpoli,tapasien '+
 'where lptgl between (:tglawal) and (:tglakhir) '+
 'and lppic like (:pic) '+
 'and lpisperiksaonly = 1 '+
 'and lpkodepasien like pskodepasien ';
 parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentUser;

 active:=true;

end; // end of dsetperiksaobat

if  (strToDate(tglawal.Text))=  (strToDate(tglakhir.Text)) then
begin
  keterangan := 'Tanggal : '+tglawal.Text;
end else
  keterangan := 'Tanggal : '+tglawal.Text+' s/d Tanggal : '+tglakhir.Text;

 RvProjectPeriksaOnly.ProjectFile:='periksaonly.rav';
 RvProjectPeriksaOnly.Open;
 RvProjectPeriksaOnly.SelectReport('periksaonly.rav',true);
 RvProjectPeriksaOnly.SetParam('keterangan',keterangan);
 RvProjectPeriksaOnly.Execute;

 ////////////////// END OF PEMERIKSAAN only

end
else if rgtipelaporan.ItemIndex=4 then
begin
////// ///////////// APOTIK

with dsetuangapotik do
begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from taapotik '+
 'where aptgl between (:tglawal) and (:tglakhir) '+
 'and aptgl is not null '+
 'and apnoregpasien is null ';
 parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 active:=true;

end; // end of dsetuangapotik

if  (strToDate(tglawal.Text))=  (strToDate(tglakhir.Text)) then
begin
  keterangan := 'Tanggal : '+tglawal.Text;
end else
  keterangan := 'Tanggal : '+tglawal.Text+' s/d Tanggal : '+tglakhir.Text;

 RvProjectUangApotik.ProjectFile:='keuanganapotik.rav';
 RvProjectUangApotik.Open;
 RvProjectUangApotik.SelectReport('keuanganapotik.rav',true);
 RvProjectUangApotik.SetParam('keterangan',keterangan);
 RvProjectUangApotik.Execute;

 ////////////////// END of APOTIK


end
else if rgtipelaporan.ItemIndex=5 then
begin
/////////// TOTAL PENDAPATAN DARI LAB

with dsetlaplab do
begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talab '+
   'where lbnorm not like "IN%" '+
   'and lbpic like (:pic) '+
   'and lbtgl between (:tglawal) and (:tglakhir) ';
  parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentUser;
 active:=true;

 if  (strToDate(tglawal.Text))=  (strToDate(tglakhir.Text)) then
begin
  keterangan := 'Tanggal : '+tglawal.Text;
end else
  keterangan := 'Tanggal : '+tglawal.Text+' s/d Tanggal : '+tglakhir.Text;

 RvProjectlabkeuangan.ProjectFile:='labkeuangan.rav';
 RvProjectlabkeuangan.Open;
 RvProjectlabkeuangan.SelectReport('labkeuangan.rav',true);
 RvProjectlabkeuangan.SetParam('keterangan',keterangan);
 RvProjectlabkeuangan.Execute;

end;

////// end of total PENDAPATAN LAB

end else if rgtipelaporan.ItemIndex=6 then
begin
//////// PENDAPATAN RONTGEN
 with dsetlaprontgen do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talayananrontgen '+
   'where lrtgl between (:tglawal) and (:tglakhir) '+
   'and lrnotransaksi not like "IN%" '+
   'and lrpic like (:pic) ';
 parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentUser;
 active:=true;

 
 if  (strToDate(tglawal.Text))=  (strToDate(tglakhir.Text)) then
begin
  keterangan := 'Tanggal : '+tglawal.Text;
end else
  keterangan := 'Tanggal : '+tglawal.Text+' s/d Tanggal : '+tglakhir.Text;

 RvProjectrontgenkeuangan.ProjectFile:='rontgenkeuangan.rav';
 RvProjectrontgenkeuangan.Open;
 RvProjectrontgenkeuangan.SelectReport('rontgenkeuangan.rav',true);
 RvProjectrontgenkeuangan.SetParam('keterangan',keterangan);
 RvProjectrontgenkeuangan.Execute;


 end;
 
///// END OF PENDAPATAN RONTGEN
end else if rgtipelaporan.ItemIndex=7 then
begin
  //////////// PILIHAN NO 8 //////////////////////////////

 with dsetsumperiksaonly do
 begin
  active:=false;
 commandType := cmdText;
 commandText := 'select * from talayananpoli,tapasien '+
 'where lptgl between (:tglawal) and (:tglakhir) '+
 'and lpkodepasien like pskodepasien '+
 'and psjenispasien not like "PERUSAHAAN%" '+
 'and lppic like (:pic) ';
 parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentUser;
 active:=true;
 end;

 with dsetlaprawatinap do
 begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from tarawatinap,tapasien,takamar '+
 'where innorm like pskodepasien '+
 'and inkodekamar like kakode '+
 'and psjenispasien not like "PERUSAHAAN" '+
 'and inpicdeposit like (:picdeposit) '+
 'and intglmasuk between (:tglawal) and (:tglakhir) ';
 parameters.ParamByName('tglawal').Value  := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('picdeposit').Value := currentUser;
 active:=true;

  if isEmpty=false then
  begin
     first;
     while not eof do
     begin
     subtotaldeposit :=(fieldByName('inDeposit').AsFloat)-(fieldByName('intambahdeposit').AsFloat);
     totalDeposit    := subTotalDeposit+totalDeposit;
     next;
     end;

  end;
end;

 with dsetlaprawatinap2 do
 begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from tarawatinap '+
 'where intgltambahdeposit between (:tglawal) and (:tglakhir) '+
 'and intambahdepositpic like (:pictambahdeposit) ';
 parameters.ParamByName('tglawal').Value  := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pictambahdeposit').Value := currentUser;
 active:=true;

 if isEmpty=false then
 begin
   first;
   while not eof do
   begin
   subtotaltambahdeposit := fieldByName('inTambahDeposit').AsFloat;
   TotaltambahDeposit    := subTotalTambahDeposit+totaltambahdeposit;
   next;
   end;
 end;

 end;

 with dsetfinalrawatinap do
 begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from tarawatinap,tapasien,takamar '+
 'where innorm like pskodepasien '+
 'and inkodekamar like kakode '+
 'and psjenispasien not like "PERUSAHAAN" '+
 'and inpic like (:pic) '+
 'and intglkeluar between (:tglawal) and (:tglakhir) ';
 parameters.ParamByName('tglawal').Value  := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentuser;
 active:=true;
 end;


{with dsetlappoli do
 begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from talayananpoli '+
 'where lptgl between (:tglawal) and (:tglakhir) '+
 'and lppic like (:pic) ';

 parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentUser;
 active:=true;

end; // end of dsetlappoli
}
 with dsetlapapotik do
 begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from taapotik '+
 'where aptgl between (:tglawal) and (:tglakhir) '+
 'and apjaminan like "PRIBADI" '+
 'and appic like (:pic) ';
 parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentUser;
 active:=true;
 end; // end of dsetlapapotik

with dsetlaplab do
begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talab '+
   'where lbnorm not like "IN%" '+
   'and lbpenjamin not like  "PERUSAHAAN" '+
   'and lbpic like (:pic) '+
   'and lbtgl between (:tglawal) and (:tglakhir) ';
  parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentUser;
 active:=true;

 with dsetlaprontgen do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talayananrontgen '+
   'where lrtgl between (:tglawal) and (:tglakhir) '+
   'and lrnotransaksi not like "IN" '+
   'and lrpenjamin not like "PERUSAHAAN" '+
   'and lrpic like (:pic) ';
 parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentUser;
 active:=true;

 end;
end; //end of dsetlaplab

 with dsetlapuangkeluar do
 begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from tauangkeluar '+
 'where uktgl between (:tglawal) and (:tglakhir) '+
 'and ukiskembali=0 '+
 'and ukcashier like (:pic) ';
 parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentUser;
 active:=true;
 end; // end of dsetlapuangkeluar

 with dsetlapkembalikas do
 begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from tauangkeluar '+
 'where uktgl between (:tglawal) and (:tglakhir) '+
 'and ukiskembali=1 '+
 'and ukcashier like (:pic) ';
 parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
 parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
 parameters.ParamByName('pic').Value := currentUser;
 active:=true;
 end;
 
 if  (strToDate(tglawal.Text))=  (strToDate(tglakhir.Text)) then
 begin
  keterangan := 'Tanggal : '+tglawal.Text;
 end else
  keterangan := 'Tanggal : '+tglawal.Text+' s/d Tanggal : '+tglakhir.Text;

  deposit := totalDeposit+totalTambahDeposit;

   penerimaUang:=inputBox('Penerima Uang : ',penerimaUang,'');

 RvProjectCashFlow.ProjectFile:='cashflow.rav';
 RvProjectCashFlow.Open;
 RvProjectCashFlow.SelectReport('cashflow.rav',true);
 RvProjectCashFlow.SetParam('deposit',floatToStr(deposit));
 RvProjectCashFlow.SetParam('keterangan',keterangan);
 RvProjectCashFlow.SetParam('penerimaUang',AnsiUpperCase(penerimauang));
 RvProjectCashFlow.SetParam('pic',AnsiUpperCase(isCurrentUser));
 RvProjectCashFlow.Execute;
 
  ///////////// END OF PILIHAN NO 4 //////////////////////

end else showmessage('Pilih kategori Laporan!');// end of rgtipelaporan

end;

procedure TfrmLaporanBilling.rgtipelaporanClick(Sender: TObject);
begin


      tglawal.Text := dateToStr(date());
      tglakhir.Text := dateToStr(date());
       
 
end;

procedure TfrmLaporanBilling.checkSemuaClick(Sender: TObject);
begin
 if (AnsiUpperCase(Group) <> 'SUPERUSER') and (Group <> 'THE CREATOR') then
 begin
   showMessage('Option ini hanya untuk Superuser!!');
   checksemua.Checked := false;
   exit;
 end;

end;

end.

unit unfrmkomisidokter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, DB, ADODB, RpCon,
  RpConDS, RpDefine, RpRave,DateUtils,StrUtils;

type
  TfrmKomisiDokter = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    cbdokter: TDBLookupComboBox;
    rgquerylaporan: TRadioGroup;
    tglawal: TMaskEdit;
    lbltanggal: TLabel;
    lblsd: TLabel;
    tglakhir: TMaskEdit;
    tahun: TEdit;
    lbltahun: TLabel;
    cbbulan: TComboBox;
    lblbulan: TLabel;
    rvProjectKomisi: TRvProject;
    RvDataSetConnection1: TRvDataSetConnection;
    dsetkomdokter: TADODataSet;
    dsetkompoli: TADODataSet;
    rvkompoli: TRvDataSetConnection;
    rvkomrawatinap: TRvDataSetConnection;
    dsetkomrawatinap: TADODataSet;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsetkompolidetail: TADODataSet;
    rvkompolidetail: TRvDataSetConnection;
    procedure BitBtn1Click(Sender: TObject);
    procedure rgquerylaporanClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure tahunKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKomisiDokter: TfrmKomisiDokter;

implementation

uses unDm;

{$R *.dfm}

procedure TfrmKomisiDokter.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TfrmKomisiDokter.rgquerylaporanClick(Sender: TObject);
begin
  case rgquerylaporan.ItemIndex of
  -1 : begin
       lbltanggal.Visible := false;
       lblsd.Visible      := false;
       lblbulan.Visible   := false;
       lbltahun.Visible   := false;
       tglawal.Visible    := false;
       tglakhir.Visible   := false;
       cbbulan.Visible    := false;
       tahun.Visible      := false;
       end;

    0: begin
       lbltanggal.Visible := true;
       lblsd.Visible      := true;
       lblbulan.Visible   := false;
       lbltahun.Visible   := false;
       tglawal.Visible    := true;
       tglakhir.Visible   := true;
       cbbulan.Visible    := false;
       tahun.Visible      := false;
       tglawal.SetFocus;
       tglawal.Text := dateTostr(date());
       tglakhir.Text := dateToStr(date());
       end;
   1 : begin
       lbltanggal.Visible := false;
       lblsd.Visible      := false;
       lblbulan.Visible   := true;
       lbltahun.Visible   := true;
       tglawal.Visible    := false;
       tglakhir.Visible   := false;
       cbbulan.Visible    := true;
       tahun.Visible      := true;
       cbbulan.SetFocus;
       tahun.Text         := RightStr(dateToStr(date()),4);
       end;
  end;
end;

procedure TfrmKomisiDokter.BitBtn2Click(Sender: TObject);
var totugd,totrawatinap,totpoli,grandTotal : double;
    subtotpoli,subtotrawatinap,subtotugd : double;
    txtTanggal : string;
begin
  totugd :=0;
  totrawatinap :=0;
  totpoli :=0;
  grandTotal :=0;


if rgquerylaporan.ItemIndex=0 then
begin

  with dsetkompoli do
  begin
  active:=false;
  commandType := cmdText;
  commandText := 'select *  from talayananpoli,tapasien '+
  'where lpkodedokter like (:kode) '+
  'and lptgl between (:tglawal) and (:tglakhir) '+
  'and lpkodepasien like pskodepasien ';
  parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
  parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
  parameters.ParamByName('kode').Value := cbdokter.KeyValue;
  active:=true;

  if isEmpty=false then
  begin
   first;
   while not eof do
   begin
    subtotPoli := fieldByName('lpkonsuldokter').AsFloat;
    totPoli := totpoli+subtotpoli;
   next;
   end;
  end;

  end;

  with dsetkompolidetail do
  begin
  active:=false;
  commandType := cmdText;
  commandText := 'select *  from talayananpoli,talayananpolidetail,tapasien '+
  'where lpkodepasien like pskodepasien '+
  'and ldtanggal between (:tglawal) and (:tglakhir) '+
  'and ldnoreg like lpnoreg '+
  'and ldkodeservice like (:kode) ';
  parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
  parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
  parameters.ParamByName('kode').Value := cbdokter.KeyValue;
  active:=true;

  if isEmpty=false then
  begin
  first;
  while not eof do
  begin
    subtotugd := fieldByName('ldtotal').AsFloat;
    totugd    := totugd+subtotugd;
    next;
  end;
  end;

  end;

  with dsetkomrawatinap do
  begin
  active:=false;
  commandType := cmdText;
  commandText := 'select *  from tarawatinap,tarawatinapdetail,tapasien '+
  'where innoreg like idnoreg '+
  'and idtgl between (:tglawal) and (:tglakhir) '+
  'and inNoRM like pskodepasien '+
  'and idkodeSV like (:kode) ';
  parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
  parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
  parameters.ParamByName('kode').Value := cbdokter.KeyValue;
  active:=true;

  if isEmpty=false then
  begin
  first;
  while not eof do
  begin
    subtotrawatinap := fieldByName('idtotal').AsFloat;
    totrawatinap := totrawatinap+subtotrawatinap;
    next;
  end;
  end;
  end;

  grandTotal := round(totugd+totPoli+totrawatinap);

  if grandTotal <= 0 then
  begin
    showMessage('Tidak Ada Data...');
    exit;
  end;

  txtTanggal := 'Tanggal : '+tglawal.Text+' s/d Tanggal : '+tglakhir.Text;
end else   // end of rgquerylaporan.ItemIndex
begin

/////////////////// QUERY BERDASARKAN BULAN /////////////////////////////////////////
  if cbbulan.ItemIndex=-1 then
  begin
  showmessage('Bulan Belum Dipilih!');
  cbbulan.SetFocus;
  exit;
  end;

  with dsetkompoli do
  begin
  active:=false;
  commandType := cmdText;
  commandText := 'select *  from talayananpoli,tapasien '+
  'where lpkodedokter like (:kode) '+
  'and month(lptgl)= (:bulan) and year(lptgl)= (:tahun) '+
  'and lpkodepasien like pskodepasien ';
  parameters.ParamByName('tahun').Value := tahun.Text;
  parameters.ParamByName('bulan').Value := cbbulan.ItemIndex+1;
  parameters.ParamByName('kode').Value := cbdokter.KeyValue;
  active:=true;

  if isEmpty=false then
  begin
   first;
   while not eof do
   begin
    subtotPoli := fieldByName('lpkonsuldokter').AsFloat;
    totPoli := totpoli+subtotpoli;
   next;
   end;
  end;

  end;

  with dsetkompolidetail do
  begin
  active:=false;
  commandType := cmdText;
  commandText := 'select *  from talayananpoli,talayananpolidetail,tapasien '+
  'where lpkodepasien like pskodepasien '+
  'and month(ldtanggal)= (:bulan) and year(ldtanggal)= (:tahun) '+
  'and ldnoreg like lpnoreg '+
  'and ldkodeservice like (:kode) ';
  parameters.ParamByName('tahun').Value := tahun.Text;
  parameters.ParamByName('bulan').Value := cbbulan.ItemIndex+1;
  parameters.ParamByName('kode').Value := cbdokter.KeyValue;
  active:=true;

  if isEmpty=false then
  begin
  first;
  while not eof do
  begin
    subtotugd := fieldByName('ldtotal').AsFloat;
    totugd    := totugd+subtotugd;
    next;
  end;
  end;

  end;

  with dsetkomrawatinap do
  begin
  active:=false;
  commandType := cmdText;
  commandText := 'select *  from tarawatinap,tarawatinapdetail,tapasien '+
  'where innoreg like idnoreg '+
  'and month(idtgl)= (:bulan) and year(idtgl)=(:tahun) '+
  'and inNoRM like pskodepasien '+
  'and idkodeSV like (:kode) ';
  parameters.ParamByName('tahun').Value := tahun.Text;
  parameters.ParamByName('bulan').Value := cbbulan.ItemIndex+1;
  parameters.ParamByName('kode').Value := cbdokter.KeyValue;
  active:=true;

  if isEmpty=false then
  begin
  first;
  while not eof do
  begin
    subtotrawatinap := fieldByName('idtotal').AsFloat;
    totrawatinap := totrawatinap+subtotrawatinap;
    next;
  end;
  end;
  end;

  grandTotal := round(totugd+totPoli+totrawatinap);

  if grandTotal <= 0 then
  begin
    showMessage('Tidak Ada Data...');
    exit;
  end;

  txtTanggal := 'Bulan : '+cbbulan.Text+' '+tahun.Text;
end; // end of else rgquerylaporan.ItemIndex

if rgquerylaporan.ItemIndex=-1 then
begin
showMessage('Anda Belum Memilih Query Laporan!');
exit;
end;

 rvProjectKomisi.ProjectFile:='komdok.rav';
 rvProjectKomisi.Open;
 rvProjectKomisi.SelectReport('komdok.rav',true);
 rvProjectKomisi.SetParam('namadokter',AnsiUpperCase(cbdokter.Text));
 rvProjectKomisi.SetParam('grandTotal',floatToStr(grandTotal));
 rvProjectKomisi.SetParam('kodedokter',cbdokter.KeyValue);
 rvProjectKomisi.SetParam('tanggal',txtTanggal);
 rvProjectKomisi.Execute;

end;

procedure TfrmKomisiDokter.tahunKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9',#8]) then key:=#0;
end;

procedure TfrmKomisiDokter.FormActivate(Sender: TObject);
begin
   if dm.dsetdokter.Active = false then dm.dsetdokter.Active := true;
end;

end.

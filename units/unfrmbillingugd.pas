unit unfrmbillingugd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Buttons, RpBase, RpSystem, RpCon,
  RpConDS, RpDefine, RpRave, DB, ADODB;

type
  TfrmBillingUGD = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    nama: TEdit;
    Label3: TLabel;
    dbnoreg: TDBText;
    Label4: TLabel;
    NoRM: TDBText;
    Label5: TLabel;
    alamat: TDBText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsetugd: TADODataSet;
    rvprojectcetakugd: TRvProject;
    rvugd: TRvDataSetConnection;
    dsetugddetail: TADODataSet;
    rvugddetail: TRvDataSetConnection;
    RvSystem: TRvSystem;
    Label6: TLabel;
    DBText1: TDBText;
    dsetugdjasadokter: TADODataSet;
    rvugdjasadokter: TRvDataSetConnection;
    dsetugdobat: TADODataSet;
    rvugdobat: TRvDataSetConnection;
    dsetkwitansiugd: TADODataSet;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure namaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBillingUGD: TfrmBillingUGD;

implementation

{$R *.dfm}
uses unUtama, unFrmViewPasienPoli,kwitansi,unFungsi;

procedure TfrmBillingUGD.FormActivate(Sender: TObject);
begin
  isCetakugd:=1;
end;

procedure TfrmBillingUGD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 isCetakugd:=0;
end;

procedure TfrmBillingUGD.namaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then frmViewPasienPoli.ShowModal;
end;

procedure TfrmBillingUGD.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TfrmBillingUGD.BitBtn2Click(Sender: TObject);
var noreg                   : string;
    subservice,totalservice : double;
    subdokter,totaldokter   : double;
    subobat,totalobat       : double;
    grandTotal              : double;
    terbilang               : string;
    tempAtasnama            : string;
    dbnama                  : string;
    noKwitansi              : string;
begin

noreg := trim(dbnoreg.Caption);

grandTotal    :=0;
subservice    :=0;
totalService  :=0;
subdokter     :=0;
totaldokter   :=0;
subobat       :=0;
totalobat     :=0;

with dsetugd do
begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from talayananpoli,tapasien '+
 'where lpkodepasien like pskodepasien '+
 'and lpnoreg like (:noreg)';
 parameters.ParamByName('noreg').Value := noreg;
 active:=true;

 dbnama := fieldByname('psNama').AsString;
end;

//showMessage('dsetugd success...');

/////////////SERIVCE///////////////
with dsetugddetail do
begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from talayananpoli,talayananpolidetail '+
 'where lpnoreg like ldnoreg '+
 'and ldisservice=1 '+
 'and lpnoreg like (:noreg)';
 parameters.ParamByName('noreg').Value := noreg;
 active:=true;

 first;
 while not eof do
 begin
 subService := fieldByName('ldtotal').AsFloat;
 totalService := totalService+subService;
 next;
 end;
end;
//////////end of SERVICE///////////////////
//showMessage('dsetugddetail success...');

//////////JASA DOKTER //////////////////////
with dsetugdjasadokter do
begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from talayananpoli,talayananpolidetail '+
 'where lpnoreg like ldnoreg '+
 'and ldisservice=2 '+
 'and lpnoreg like (:noreg)';
 parameters.ParamByName('noreg').Value := noreg;
 active:=true;

 first;
 while not eof do
 begin
 subdokter := fieldByName('ldtotal').AsFloat;
 totalDokter:= totalDokter+subDokter;
 next;
 end;
end;

///////////END OF JASA DOKTER /////////////////////////

//showMessage('dsetugdjasadokter success...');
//////////OBAT-OBATAN //////////////////////
with dsetugdOBAT do
begin
 active:=false;
 commandType := cmdText;
 commandText := 'select * from talayananpoli,talayananpolidetail '+
 'where lpnoreg like ldnoreg '+
 'and ldisservice=0 '+
 'and lpnoreg like (:noreg)';
 parameters.ParamByName('noreg').Value := noreg;
 active:=true;

 first;
 while not eof do
 begin
 subObat := fieldByName('ldtotal').AsFloat;
 totalObat:= totalObat+subObat;
 next;
 end;
end;
///////////END OF obat /////////////////////////
//showMessage('dsetugdobat success...');

grandTotal := round(totalService+totalObat+totalDokter);
terbilang  := rupiah(floatToStr(grandTotal));

noKwitansi := autoNumberKwitansi(noreg,grandTotal);

  tempAtasNama:=inputBox('Kwitansi Atas Nama: ',tempAtasnama,'');
  if Length(tempAtasNama)=0 then
  begin
     tempAtasNama:= dbNama;
  end;


  rvprojectcetakugd.ProjectFile := 'kwitansiugd.rav';
  rvprojectcetakugd.Open;
  rvprojectcetakugd.SelectReport('kwitansiugd.rav',true);
  rvprojectcetakugd.SetParam('grandTotal',floatToStr(grandTotal));
  rvprojectcetakugd.SetParam('terbilang',AnsiUpperCase(terbilang));
  rvprojectcetakugd.SetParam('atasnama',AnsiUpperCase(tempAtasNama));
  rvprojectcetakugd.SetParam('noKwitansi',noKwitansi);
  rvprojectcetakugd.SetParam('currentUser',AnsiUpperCase(isCurrentUser));
  rvprojectcetakugd.Execute;


  ///// ISI USERNAME DARI OPERATOR BILLING

 with dsetKwitansiugd do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talayananpoli '+
   'where lpnoreg like (:noreg) ';
   parameters.ParamByName('noreg').Value := noreg;
   active:=true;

   open;
   edit;
   fieldByName('lppic').AsString := isCurrentUser;
   post;
 end;

/////// END OF USERNAME OPERATOR BILLING
end;

end.

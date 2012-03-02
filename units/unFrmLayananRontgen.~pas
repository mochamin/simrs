unit unFrmLayananRontgen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, adodb,db,StdCtrls, ComCtrls, Mask, DBCtrls, Buttons,
  Grids, DBGrids,strutils;

type
  TfrmLayananRontgen = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gbInput: TGroupBox;
    Label1: TLabel;
    lblPasien: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbKode: TDBEdit;
    gbButton: TGroupBox;
    btnNew: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label8: TLabel;
    cmbTipePasien: TDBComboBox;
    Label7: TLabel;
    dbnotransaksi: TDBEdit;
    gbPasien: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbnama: TDBEdit;
    dbusia: TDBEdit;
    dbalamat: TDBMemo;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblnama: TLabel;
    lblusia: TLabel;
    lblalamat: TLabel;
    dbkoderontgen: TDBEdit;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    lbllayanan: TLabel;
    dtTglPeriksa: TDBEdit;
    dbKodeDokter: TDBLookupComboBox;
    dtTglSelesai: TDBEdit;
    Label14: TLabel;
    dbtotal: TDBEdit;
    btnclose: TBitBtn;
    Label15: TLabel;
    lblnorm: TLabel;
    dbdetail: TDBMemo;
    procedure FormActivate(Sender: TObject);
    procedure dbNoRMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure dbKodePemeriksaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbKodeRontgenKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncloseClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure lookNamaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnViewDokterClick(Sender: TObject);
    procedure cmbTipePasienClick(Sender: TObject);
    procedure dbnotransaksiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbnotransaksiKeyPress(Sender: TObject; var Key: Char);
    procedure dbkoderontgenKeyPress(Sender: TObject; var Key: Char);
    procedure GroupBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure hitungharga;
    procedure autonumber;
    procedure simpanlayananrontgen;
  public
    { Public declarations }
  end;

var
  frmLayananRontgen: TfrmLayananRontgen;
  totalRontgen : double;

implementation

uses unDm,unUtama, unFrmPasien, unFrmViewPasien, unFrmViewDokter,
  unFrmRontgen, unFrmViewPasienPoli, unfrmViewRawatInap, unfrmViewRontgen;

{$R *.dfm}

procedure TfrmLayananRontgen.simpanlayananrontgen;
var i :integer;
    Kode : string;
    totalBiayaLab : integer; //variable penampung total biaya lab
    notransaksi,terbilang : string;
    total : integer;
    penjamin : string;
begin
   totalBiayaLab:=0;



if MessageDlg('Simpan Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
 notransaksi:=dbkode.Text;


  for i:=1 to Length(dbkoderontgen.Text) do
  begin
   if AnsiMatchText(';',[dbKoderontgen.Text[i]])= true then
   begin
     Kode:=AnsiMidStr(dbKoderontgen.Text,i-5,5); // cari kode di dalam editbox "item"
     // query untuk mengumpulkan item lab berdasarkan kode yang ditemukan
     if dm.dsetRontgen.Locate('rnkode',kode,[locaseinsensitive])= true then
     begin
      dbtotal.Text := FloatToStr(strToFloat(dbTotal.Text)+dm.dsetrontgen.fieldByName('harga').AsFloat);
     end;
   end; // end of if ansi
   end; // end of for i

  /// Simpan STATUS Penjamin pasien diambil dari dbase Pasien
  with dm.dSetPasien do
  begin
    if locate('pskodepasien',lblnorm.Caption,[loCaseInsensitive])=true then
    begin
      penjamin := fieldByName('psJenisPasien').AsString;
      dm.dsetLayananRontgen.FieldByName('lrpenjamin').AsString := penjamin;
    end;
  end;//end of dm dsetpasien



 end; // end of if messageDlg...
end;

procedure TfrmLayananRontgen.autoNumber;
var zerofill  : string;
    curNumber : integer;
    curNoReg  : string;
    thn,bln,tgl,dbbln,cutthn : string;

begin

    tgl := LeftStr(dateToStr(date()),2);
    bln := AnsiMidStr(dateToStr(date()),4,2);  // ambil 2 digit bulan
    thn := RightStr(dateToStr(date()),2);

  with dm.dsetLayananRontgen do
  begin
    active:=false;
    commandType := cmdText;
    commandText := 'select * from talayananrontgen '+
    'order by lrtglwkt asc';
    active:=true;
    Last; // go to the last of the record

    dbbln := AnsiMidStr(fields.fieldByname('lrkode').AsString,3,2);
    curNoReg := RightStr(fields.fieldByname('lrkode').AsString,3); //ambil 6 digit dari No RM di database
   // showMessage(curNoReg);
    curNumber := strToInt(curNoReg)+1;


    case Length(intToStr(curNumber)) of
    1 : zeroFill := '00';
    2 : zerofill := '0';
    3 : zerofill := '';

    end;

    Append; // tambahkan record;
   if (dbbln<>bln)  then
   begin
      dbkode.Text := tgl+bln+thn+'001'
   end else dbkode.Text := tgl+bln+thn+zeroFill+intToStr(curNumber);
  end;
  dbtotal.Text :='0';
  dtTglPeriksa.Text := dateToStr(date());
  dtTglSelesai.Text := dateToStr(date());
end;

procedure TfrmLayananRontgen.hitungharga;
var kodeRontgen : string;
begin
  {  kodeRontgen:=dbkoderontgen.Text;
    with dm.dsetLayananRontgen do
    begin
      locate('lrkode',
    end;}
end;

procedure TfrmLayananRontgen.FormActivate(Sender: TObject);
begin
 if dm.dsetLayananRontgen.Active=false then dm.dsetLayananRontgen.Active:=true;
 if dm.dsetRontgen.Active=false then dm.dsetRontgen.Active:=true;
 isLayananRontgen:=1;
 

end;

procedure TfrmLayananRontgen.dbNoRMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
   frmViewPasien.ShowModal;
 end;
end;

procedure TfrmLayananRontgen.btnNewClick(Sender: TObject);
begin

 gbInput.Enabled := true;
 cmbtipepasien.SetFocus;
 
 btnSave.Visible := true;
 btnCancel.Visible := true;
 autonumber;
end;

procedure TfrmLayananRontgen.btnSaveClick(Sender: TObject);

begin
if MessageDlg('Simpan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
   gbInput.Enabled := false;
    simpanlayananrontgen;
   dm.dsetLayananRontgen.FieldByName('lrtglwkt').AsDateTime := now();

    dm.dsetLayananRontgen.FieldByName('lrtgl').AsDateTime := date();
   dm.dsetLayananRontgen.UpdateBatch(arCurrent);
    btnSave.Visible := false;
    btnCancel.Visible := false;

end;    
end;




procedure TfrmLayananRontgen.btnCancelClick(Sender: TObject);
begin
if MessageDlg('Batalkan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin

  dm.dsetLayananRontgen.CancelBatch(arCurrent);
   gbInput.Enabled := false;
    btnSave.Visible := false;
    btnCancel.Visible := false;
   
end;  
end;

procedure TfrmLayananRontgen.btnEditClick(Sender: TObject);
begin
 {  gbInput.Enabled := true;
   dbNoRm.SetFocus;
  dm.dsetLayananRontgen.Edit;
   btnSave.Visible := true;
 btnCancel.Visible := true;}
end;

procedure TfrmLayananRontgen.dbKodePemeriksaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then
  begin
    frmViewDokter.ShowModal;
  end;
end;

procedure TfrmLayananRontgen.dbKodeRontgenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key=vk_return then
 begin
   frmViewRontgen.ShowModal;
 end;
end;

procedure TfrmLayananRontgen.btncloseClick(Sender: TObject);
begin
 close;
end;

procedure TfrmLayananRontgen.BitBtn2Click(Sender: TObject);
begin
  frmViewPasien.ShowModal;
end;

procedure TfrmLayananRontgen.lookNamaClick(Sender: TObject);
begin
{ with dm.dsetLayananRontgen do
 begin
   Locate('lrNoRM',lookNama.KeyValue,[loPartialKey]);
 end;}
end;

procedure TfrmLayananRontgen.Button1Click(Sender: TObject);
begin
 { with dm.dsetLayananRontgen do
 begin
   Locate('lrNoRM',lookNama.KeyValue,[loPartialKey]);
 end;}
end;

procedure TfrmLayananRontgen.FormDeactivate(Sender: TObject);
begin
 isLayananRontgen:=0;
end;

procedure TfrmLayananRontgen.btnViewDokterClick(Sender: TObject);
begin
 frmViewDokter.ShowModal;
end;

procedure TfrmLayananRontgen.cmbTipePasienClick(Sender: TObject);
begin
 Case cmbTipePasien.ItemIndex of
 0 : begin
     gbPasien.Enabled := true;
     dbnotransaksi.Enabled := false;
     lblpasien.Enabled := false;
     dbnama.SetFocus;
     end;
 1 : begin
     gbPasien.Enabled := false;
     dbnotransaksi.Enabled := true;
     lblpasien.Enabled := true;
     dbnotransaksi.SetFocus;
     end;
 2 : begin
     gbPasien.Enabled := false;
     dbnotransaksi.Enabled := true;
     lblpasien.Enabled := true;
     dbnotransaksi.SetFocus;
     end;                      
 end
end;

procedure TfrmLayananRontgen.dbnotransaksiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key=vk_return then
begin
 case cmbTipePasien.ItemIndex of
 1 : frmViewPasienPoli.ShowModal;
 2 : frmViewRawatInap.ShowModal;
 end;
end; 
end;

procedure TfrmLayananRontgen.dbnotransaksiKeyPress(Sender: TObject;
  var Key: Char);
begin
 key:=#0;
end;

procedure TfrmLayananRontgen.dbkoderontgenKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in [#13,#8]) then
 begin
  frmViewRontgen.ShowModal;
  key:=#0;
 end;
end;

procedure TfrmLayananRontgen.GroupBox1Click(Sender: TObject);
begin
 //showMessage('Kode kamar aktif : '+kodekamar);
end;

end.

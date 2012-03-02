unit unFrmAddPasien;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,Qt, StrUtils,adodb,ComCtrls, Buttons, DBCtrls;

type
  TfrmAddPasien = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gbGuardian: TGroupBox;
    txtNamaGuardian: TEdit;
    Label11: TLabel;
    Label13: TLabel;
    txtAlamatGuardian: TEdit;
    Label14: TLabel;
    txtHubKerabat: TEdit;
    Label15: TLabel;
    Image2: TImage;
    Panel3: TPanel;
    btnCancel: TBitBtn;
    btnSimpan: TBitBtn;
    Bevel1: TBevel;
    Label16: TLabel;
    Label17: TLabel;
    lblClear: TLabel;
    btnNew: TBitBtn;
    gbIdentitasPasien: TGroupBox;
    Label12: TLabel;
    dtTgl: TDateTimePicker;
    Label1: TLabel;
    txtNoRM: TEdit;
    Label2: TLabel;
    txtNama: TEdit;
    Label3: TLabel;
    txtJenisKelamin: TComboBox;
    Label6: TLabel;
    txtUsia: TEdit;
    Label4: TLabel;
    txtTempatLahir: TEdit;
    Label5: TLabel;
    dtTglLahir: TDateTimePicker;
    Label7: TLabel;
    txtAlamat: TEdit;
    Label8: TLabel;
    txtKota: TEdit;
    Label9: TLabel;
    txtTelp: TEdit;
    Label10: TLabel;
    txtHp: TEdit;
    Label18: TLabel;
    lblNPK: TLabel;
    txtNPK: TEdit;
    chkGuardian: TCheckBox;
    txtBulan: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    btnClose: TBitBtn;
    cbJenisPasien: TComboBox;
    procedure chkGuardianClick(Sender: TObject);
    procedure lblSaveMouseEnter(Sender: TObject);
    procedure lblSaveMouseLeave(Sender: TObject);
    procedure lblCancelMouseEnter(Sender: TObject);
    procedure lblCancelMouseLeave(Sender: TObject);
    procedure lblCancelClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dtTglKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtNoRMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtJenisKelaminKeyPress(Sender: TObject; var Key: Char);
    procedure txtUsiaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure txtTelpKeyPress(Sender: TObject; var Key: Char);
    procedure txtHpKeyPress(Sender: TObject; var Key: Char);
    procedure btnSimpanClick(Sender: TObject);
    procedure txtNamaGuardianKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblClearClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure txtNoRMKeyPress(Sender: TObject; var Key: Char);
    procedure txtNPKKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbJenisPasienClick(Sender: TObject);
    procedure cbJenisPasienKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure cbJenisPasienExit(Sender: TObject);
  private
    { Private declarations }
    procedure autoNumberPasien;

  public
    { Public declarations }
    procedure validasiPasien;
    procedure simpanPasien;
    procedure clearPasien;
  end;

var
  frmAddPasien: TfrmAddPasien;
  

implementation

uses unDm, unFrmPoli,unUtama, unFrmRawatInap, unFrmPerusahaan, unFrmLab,
  unFrmRegLab;

{$R *.dfm}

procedure TfrmAddPasien.autoNumberPasien;
var tempKodePasien : string;
    cutKodePasien  : string;
    intKodePasien  : integer;
    zeroFill       : string;

begin
  with dm.dSetPasien do
  begin
     active:=false;
     commandType := cmdTExt;
     commandText := 'SELECT * FROM tapasien ORDER BY psKodePasien ASc';
     active:=true;
     open;
     last;
     tempKodePasien := trim(fields.fieldByName('psKodePasien').AsString);
     //showMessage('tempKode Pasien : '+tempKodePasien);
     cutKodePasien := RightStr(tempKodePasien,7);
     //showMessage('Cut Kode Pasien: '+cutKodePasien);
     intKodePasien := strToInt(cutKodePasien)+1;


     case Length(intToStr(intKodePasien)) of
     1 : zeroFill := '000000';
     2 : zeroFill := '00000';
     3 : zeroFill := '0000';
     4 : zeroFill := '000';
     5 : zeroFill := '00';
     6 : zeroFill := '0';
     7 : zeroFill := '';
     end;


      txtNoRM.Text := 'RM-'+zeroFill+intToStr(intKodePasien);

  end;
end;

procedure TfrmAddPasien.clearPasien;
begin
  txtNama.Clear;
  txtJenisKelamin.Text :='';
  txtUsia.Clear;
  txtTempatLahir.Clear;
  dtTglLahir.Date := date();
  txtAlamat.Clear;
  txtKota.Clear;
  txtTelp.Clear;
  txtHp.Clear;
  txtbulan.Clear;
  cbJenispasien.Text :='';

  if chkGuardian.Checked = true then
  begin
    txtNamaGuardian.Clear;
    txtAlamatGuardian.Clear;
    txtHubKerabat.Clear;
    chkGuardian.Checked := false;
  end;
end;


procedure TfrmAddPasien.simpanPasien;
var tempDatePick : string;
    tempDate : string;
begin
        tempDatePick := dateToStr(dtTglLahir.Date);
        tempDate := dateToStr(date());
        if (tempDatePick=tempDate) then // tanggal lahir tidak diisi
        begin

           if messageDlg('Simpan Record?',
              mtConfirmation,[mbYes,mbNo],0)=mrYes then
           begin

           with dm.dSetPasien do
           begin
            open;
            last;
            append;
           
            fields.FieldByName('psKodePasien').AsString := txtNoRM.Text;
            fields.FieldByName('psNama').AsString := txtNama.Text;
            fields.FieldByName('psTglDaftar').AsDateTime := dtTgl.Date;
            fields.FieldByName('psTempatLahir').AsString := txtTempatLahir.Text;
            fields.FieldByName('psJenisKelamin').AsString := txtJenisKelamin.Text;
            fields.FieldByName('usia').AsString := txtUsia.Text;
            fields.FieldByName('psAlamat').AsString := txtAlamat.Text;
            fields.FieldByName('kota').AsString := txtKota.Text;
            fields.FieldByName('psTelp').AsString := txtTelp.Text;
            fields.FieldByName('psHP').AsString := txtHp.Text;
            fields.FieldByName('psJenisPasien').AsString := cbJenisPasien.Text;
            fields.FieldByName('psKodePasienPerusahaan').AsString := txtNPK.Text;

          // cek dulu usia pasien, kalau dibawah umur (guardian dipilih)
          //maka baru terjadi aksi penyimpanan di taPasien utk 2 field di bawah ini:

          if chkGuardian.Checked = true then
          begin
            fields.FieldByName('psNamaGuardian').AsString := txtNamaGuardian.Text;
            fields.FieldByName('psHubKeluarga').AsString := txtHubKerabat.Text;
          end; // end dari chkGuardian.checked


            post;
            updatebatch(arAll);

           if isPoli=1 then // kalau sedang dalam modus transaksi poli
           begin
             frmAddPasien.Close;
             frmPoli.txtNoRm.SetFocus;
             frmPoli.txtNoRm.Text := txtNoRm.Text;
             clearPasien; // kosongkan isi form add pasien (kecuali field2 tgl)
             showMessage('data tersimpan...');
           end;

           if isRegLabPoli =1 then
           begin
             frmRegLab.dbnoreg.Text := txtnorm.Text;
             frmREglab.lblnorm.Caption := txtnorm.Text;
             frmreglab.lblnama.Caption := txtnama.Text;
             frmReglab.lbljk.Caption := txtJenisKelamin.Text;
             frmRegLab.lblalamat.Caption := txtAlamat.Text;
             clearPasien;
             frmAddpasien.close;
             frmRegLab.dbkodeitem.SetFocus;
           end;

           if isRawatInap=1 then // kalau sedang dalam modus Rawat Inap
           begin
             frmAddPasien.Close;
             frmRawatInap.txtNoRm.SetFocus;
             frmRawatInap.txtNoRm.Text := txtNoRm.Text;
             clearPasien; // kosongkan isi form add pasien (kecuali field2 tgl)
             showMessage('data tersimpan...');
           end;


           end;   // end dari with dm.dsetPasien ....
         end; // end dari if msgDlg....

        end else
        begin

        if MessageDlg('Simpan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
        begin
          with dm.dSetPasien do
          begin
            open;
            append;
            fields.FieldByName('psKodePasien').AsString := txtNoRm.Text;
            fields.FieldByName('psNama').AsString := txtNama.Text;
            fields.FieldByName('psTglDaftar').AsDateTime := dtTgl.Date;
            fields.FieldByName('psTempatLahir').AsString := txtTempatLahir.Text;
            fields.FieldByName('psTglLahir').AsDateTime := dtTglLahir.Date;
            fields.FieldByName('psJenisKelamin').AsString := txtJenisKelamin.Text;
            fields.FieldByName('usia').AsString := txtUsia.Text;
            fields.FieldByName('psBulan').AsString := txtBulan.Text;
            fields.FieldByName('psAlamat').AsString := txtAlamat.Text;
            fields.FieldByName('kota').AsString := txtKota.Text;
            fields.FieldByName('psTelp').AsString := txtTelp.Text;
            fields.FieldByName('psHP').AsString := txtHp.Text;
            fields.FieldByName('psJenisPasien').AsString := cbJenisPasien.Text;
            fields.FieldByName('psKodePasienPerusahaan').AsString := txtNPK.Text;

          // cek dulu usia pasien, kalau dibawah umur (guardian dipilih)
          //maka baru terjadi aksi penyimpanan di taPasien utk 2 field di bawah ini:

          if chkGuardian.Checked = true then
          begin
            fields.FieldByName('psNamaGuardian').AsString := txtNamaGuardian.Text;
            fields.FieldByName('psHubKeluarga').AsString := txtHubKerabat.Text;
          end;

            post; // simpan ke dalam tabel
            updatebatch(arAll);

           if isPoli=1 then // kalau sedang dalam modus transaksi poli
           begin
             frmAddPasien.Close;
             frmPoli.txtNoRm.SetFocus;
             frmPoli.txtNoRm.Text := txtNoRm.Text;
             clearPasien; // kosongkan isi form add pasien (kecuali field2 tgl)
             showMessage('data tersimpan...');
           end;

        if isRawatInap=1 then // kalau sedang dalam modus Rawat Inap
           begin
             frmAddPasien.Close;
             frmRawatInap.txtNoRm.SetFocus;
             frmRawatInap.txtNoRm.Text := txtNoRm.Text;
             clearPasien; // kosongkan isi form add pasien (kecuali field2 tgl)
             showMessage('data tersimpan...');
           end;


        end;

        end;
       end; // end dari if msgDlg (yang ke-2)
end;

procedure TfrmAddPasien.validasiPasien;
begin


   if Length(txtNama.Text) < 4 then
   begin
      showMessage('Nama belum diisi atau tidak valid');
      txtNama.SetFocus;
   end
   else if Length(txtJenisKelamin.Text)=0 then
   begin
     showMessage('Jenis Kelamin kosong');
     txtJenisKelamin.SetFocus;
   end else if (Length(txtUsia.Text)=0) and (length(txtBulan.Text)=0) then
   begin
     showMessage('Usia belum diisi');
     txtUsia.SetFocus;
   end else if Length(txtAlamat.Text)=0 then
   begin
     showMessage('Alamat kosong, mohon diisi');
     txtAlamat.SetFocus;
   end else if Length(txtKota.Text) < 5 then
   begin
     showMessage('Kota kosong atau tidak valid');
     txtKota.SetFocus;
   end
     else
       begin
        simpanPasien;
        btnSimpan.Visible := false;
        btnCancel.Visible := false;
        gbIdentitasPasien.Enabled := false;
       end;


end;

procedure TfrmAddPasien.chkGuardianClick(Sender: TObject);
begin
if chkGuardian.Checked = true then
begin
  gbGuardian.Visible := true;
  txtNamaGuardian.SetFocus;
end else  gbGuardian.Visible := false;
   end;

procedure TfrmAddPasien.lblSaveMouseEnter(Sender: TObject);
begin
  //lblSave.Font.Size := 16;
end;

procedure TfrmAddPasien.lblSaveMouseLeave(Sender: TObject);
begin
 //lblSave.Font.Size := 10;
end;

procedure TfrmAddPasien.lblCancelMouseEnter(Sender: TObject);
begin
  //lblCancel.Font.Size := 16;
end;

procedure TfrmAddPasien.lblCancelMouseLeave(Sender: TObject);
begin
  //lblCancel.Font.Size := 10;
end;

procedure TfrmAddPasien.lblCancelClick(Sender: TObject);
begin
 frmAddPasien.Hide;
end;

procedure TfrmAddPasien.btnCancelClick(Sender: TObject);
begin

if MessageDlg('Anda Yakin ingin membatalkan?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
 clearpasien;
 btnSimpan.Visible := false;
 btnCancel.Visible := false;
 btnNew.Visible := true;
 gbIdentitasPasien.Enabled := false;
 txtnpk.Visible := false;
 lblnpk.Visible := false;
end; 
end;

procedure TfrmAddPasien.dtTglKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
   VK_RETURN : txtNoRm.SetFocus;
   end;
end;

procedure TfrmAddPasien.txtNoRMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
   VK_RETURN : txtNama.SetFocus;
   end;
end;

procedure TfrmAddPasien.txtJenisKelaminKeyPress(Sender: TObject;
  var Key: Char);
begin

   if not (key in['l','p',#8])then
  begin
  key := #0;
  end;
end;

procedure TfrmAddPasien.txtUsiaKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (Key in['0'..'9',#8]) then
  begin
    key :=#0;
  end;
end;

procedure TfrmAddPasien.FormActivate(Sender: TObject);
var today : TDate;
begin
 if dm.dSetPasien.Active=false then dm.dSetPasien.Active:=true;
   today := date();
   dtTgl.Date := today;
   dtTglLahir.Date:=today;
   isRegistrasiPasien :=1;
end;

procedure TfrmAddPasien.txtTelpKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9','-',#8]) then
  begin
   key := #0;
  end;
end;

procedure TfrmAddPasien.txtHpKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9','+',#8]) then
  begin
   key := #0;
  end;
end;

procedure TfrmAddPasien.btnSimpanClick(Sender: TObject);
begin
  validasiPasien;
end;

procedure TfrmAddPasien.txtNamaGuardianKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=VK_UP then
  begin
     chkGuardian.SetFocus;
  end;
end;

procedure TfrmAddPasien.lblClearClick(Sender: TObject);
begin
 if messageDlg('Kosongkan form?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
  clearPasien;
 end; 
end;

procedure TfrmAddPasien.btnNewClick(Sender: TObject);
begin

  gbIdentitasPasien.Enabled := true;
  txtNoRM.Clear;
  autoNumberPasien; // Generate an autonumber
  btnSimpan.Visible := true;
  btnCancel.Visible := true;
  txtNama.SetFocus;

end;

procedure TfrmAddPasien.txtNoRMKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TfrmAddPasien.txtNPKKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
    frmPerusahaan.ShowModal;
    frmPerusahaan.pcPerusahaan.ActivePage.Caption := 'Karyawan';
    //frmPerusahaan.txtcariNama.SetFocus;
  end;
end;

procedure TfrmAddPasien.cbJenisPasienClick(Sender: TObject);
begin
  case cbJenisPasien.ItemIndex of
  0 : begin
      txtNPK.Visible := false;
      lblNPK.Visible := false;
      end;

  1 : begin
      txtNPK.Visible := true;
      lblNPK.Visible := true;
      txtNPK.SetFocus;
      end;


  end;
end;

procedure TfrmAddPasien.cbJenisPasienKeyPress(Sender: TObject;
  var Key: Char);
begin
 key:=#0;
end;

procedure TfrmAddPasien.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   isRegistrasiPasien :=0;
{ if btnSimpan.Visible=true then
 begin
   if MessageDlg('Data Belum tersimpan..!'+#13+
   'Batalkan penyimpanan?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      clearPasien;
      close;

   end;
 end;}
end;

procedure TfrmAddPasien.btnCloseClick(Sender: TObject);
begin
 close;
end;

procedure TfrmAddPasien.cbJenisPasienExit(Sender: TObject);
begin
   case cbJenisPasien.ItemIndex of
  0 : begin
      txtNPK.Visible := false;
      lblNPK.Visible := false;
      end;

  1 : begin
      txtNPK.Visible := true;
      lblNPK.Visible := true;
      txtNPK.SetFocus;
      end;
  end;
end;

end.

unit unFrmAddDokter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,db,adodb;

type
  TfrmAddDokter = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    txtKodeDokter: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dtTgl: TDateTimePicker;
    txtNama: TEdit;
    txtJenisKelamin: TComboBox;
    txtTempatLahir: TEdit;
    dtTglLahir: TDateTimePicker;
    txtAlamat: TEdit;
    txtKodePos: TEdit;
    txtPendidikanTerakhir: TEdit;
    txtTelp: TEdit;
    dtTglGabung: TDateTimePicker;
    txtHp: TEdit;
    BitBtn1: TBitBtn;
    btnSave: TBitBtn;
    Label13: TLabel;
    txtSpesialisasi: TEdit;
    Image2: TImage;
    Label15: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ValidasiDokter;
    procedure simpanDokter;
    procedure ClearFormDokter;
  end;

var
  frmAddDokter: TfrmAddDokter;

implementation

uses unDm;

{$R *.dfm}

procedure TfrmAddDokter.ClearFormDokter;
begin
 dtTgl.SetFocus;
 txtKodeDokter.Clear;
 txtNama.Clear;
 txtJenisKelamin.Clear;
 txtTempatLahir.Clear;
 txtAlamat.Clear;
 txtKodePos.Clear;
 txtPendidikanTerakhir.Clear;
 txtTelp.Clear;
 txtHp.Clear;
end;

procedure TfrmAddDokter.simpanDokter;
begin

  if messageDlg('Simpan Data ini?',
  mtInformation,[mbYes,mbNo],0)=mrYes then
  begin
  with dm.dsetDokter do
  begin
    open;
    last;
    append;
    fields.FieldByName('dkTgl').AsDateTime := dtTgl.Date;
    fields.FieldByName('dkTglBergabung').AsDateTime := dtTglGabung.Date;
    Fields.FieldByName('dkKodeDokter').AsString := txtKodeDokter.Text;
    fields.FieldByName('dkNama').AsString :=txtNama.Text;
    fields.FieldByName('dkJenisKelamin').AsString := txtJenisKelamin.Text;

   if Length(txtTempatLahir.Text) =0 then
   begin
     txtTempatLahir.Text:= '-';
   end;

   if length(txtPendidikanTerakhir.Text)=0 then
   begin
     txtPendidikanTerakhir.Text := '-';
   end;

   if length(txtKodePos.Text)=0 then
   begin
      txtKodePos.Text:='-';
   end;

   if Length(txtTelp.Text)=0 then
   begin
     txtTelp.Text :='-';
   end;

   if Length(txtHp.Text)=0 then
   begin
     txtHp.Text :='-';
   end;


    fields.FieldByName('dkTempatLahir').AsString := txtTempatLahir.Text;
    fields.FieldByName('dkTglLahir').AsDateTime := dtTglLahir.Date;
    fields.FieldByName('dkPendidikan').AsString := txtPendidikanTerakhir.Text;
    fields.FieldByName('dkAlamat').AsString := txtAlamat.Text;
    fields.FieldByName('dkKodePos').AsString := txtKodePos.Text;
    fields.FieldByName('dkTelp').AsString := txtTelp.Text;
    fields.FieldByName('dkHP').AsString := txtHp.Text;
    post;
    updatebatch(arAll);
    showMessage('data disimpan...');
    clearFormDokter;
  end;
 end
   else
     ShowMessage('penyimpanan dibatalkan..');
end;

procedure TfrmAddDokter.ValidasiDokter;
begin
  if Length(txtNama.Text)<3 then
  begin
    showMessage('Nama Kosong atau terlalu pendek!');
    txtNama.SetFocus;
  end else
      if Length(txtAlamat.Text)<10 then
      begin
        showMessage('Alamat kosong atau terlalu pendek!');
        txtAlamat.SetFocus;
      end else
      if Length(txtJenisKelamin.Text)=0 then
      begin
         showMessage('Jenis Kelamin harap diisi!');
         txtJenisKelamin.SetFocus;
      end else
         simpanDokter; //simpan data setelah validasi selesai
end;

procedure TfrmAddDokter.BitBtn1Click(Sender: TObject);
begin
 frmAddDokter.Close;
end;

procedure TfrmAddDokter.btnSaveClick(Sender: TObject);
begin
  validasiDokter;
end;

procedure TfrmAddDokter.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {case key of
  VK_ESCAPE : frmAddDokter.Close;
  end;}
end;

procedure TfrmAddDokter.FormActivate(Sender: TObject);
var today : TDateTime;
begin
if dm.dsetdokter.Active=false then dm.dsetdokter.Active:=true;
    today:=now();
    dtTgl.Date:=today;
end;

end.

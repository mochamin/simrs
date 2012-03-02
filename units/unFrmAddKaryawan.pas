unit unFrmAddKaryawan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls,adodb,db, Buttons;

type
  TfrmAddKaryawan = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
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
    txtKodeKaryawan: TEdit;
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
    GroupBox1: TGroupBox;
    txtGajiPokok: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    txtTunjanganTransport: TEdit;
    Label15: TLabel;
    txtTunjanganHadir: TEdit;
    txtTunjanganLain: TEdit;
    txtTunjanganMakan: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    txtTAx: TEdit;
    Label19: TLabel;
    txtKeterangan: TEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    btnSave: TBitBtn;
    txtStatus: TEdit;
    Label20: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure cekValidasiKaryawan;
    procedure simpanKaryawan;
  public
    { Public declarations }
  end;

var
  frmAddKaryawan: TfrmAddKaryawan;

implementation

uses unDm;

{$R *.dfm}

procedure TfrmAddKaryawan.simpanKaryawan;
begin
      with dm.dSetKaryawan do
      begin
        open;
        append;
        //simpan di table takaryawan
        //================================================================
        fields.FieldByName('krKodeKaryawan').AsString:=txtKodeKaryawan.Text;
        fields.FieldByName('krNama').AsString := txtNama.Text;
        fields.FieldByName('krTempatLahir').AsString := txtTempatLahir.Text;
        fields.FieldByName('krTglLahir').AsDateTime := dtTglLahir.Date;
        fields.FieldByName('krPendidikan').AsString := txtPendidikanTerakhir.Text;
        fields.FieldByName('krAlamat').AsString := txtAlamat.Text;
        fields.FieldByName('krKodePos').AsString := txtKodePos.Text;
        fields.FieldByName('krTelp').AsString := txtTelp.Text;
        fields.FieldByName('krHP').AsString := txtHp.Text;
        fields.FieldByName('krTglBergabung').AsDateTime := dtTglGabung.Date;
        fields.FieldByName('krTgl').AsDateTime := dtTgl.Date;

        fields.FieldByName('krStatusKaryawan').AsString := txtStatus.Text;
        fields.FieldByName('krGajiPokok').AsString := txtGajiPokok.Text;
        fields.FieldByName('krTunjanganTransport').AsString := txtTunjanganTransport.Text;
        fields.FieldByName('krTunjanganMakan').AsString := txtTunjanganMakan.Text;
        fields.FieldByName('krTunjanganHadir').AsString := txtTunjanganHadir.Text;
        fields.FieldByName('krTunjanganLain').AsString := txtTunjanganLain.Text;
        fields.FieldByName('krTax').AsString := txtTax.Text;
        fields.FieldByName('krKeterangan').AsString := txtKeterangan.Text;


        post; // simpan permanent di tabel
        updatebatch(arAll);
      end;



end;

procedure TfrmAddKaryawan.cekValidasiKaryawan;
begin
   if Length(txtNama.Text)<2 then
   begin
      showmessage('Nama kosong atau tidak valid');
      txtNama.SetFocus;
   end else if Length(txtJeniskelamin.Text)=0 then
       begin
         showmessage('Jenis Kelamin blm diisi!');
         txtJenisKelamin.SetFocus;
       end
        else if Length(txtTempatLahir.Text)<5 then
             begin
              showMessage('tempat Lahir Kosong atau tidak valid');
              txtTempatLahir.SetFocus;
             end
       else if Length(txtAlamat.Text)<5 then
       begin
        showmessage('alamat kosong atau tidak valid');
        txtAlamat.SetFocus;
       end
       else
         begin
         showMessage('data disimpan...');
         simpanKaryawan;
         end;
end;

procedure TfrmAddKaryawan.FormActivate(Sender: TObject);
var todaysDate : TDateTime;
begin
  if dm.dsetKaryawan.Active=false then dm.dsetKaryawan.Active:=true;
   todaysDate := now;
   dtTgl.Date := todaysDate;
end;

procedure TfrmAddKaryawan.btnSaveClick(Sender: TObject);
begin
  cekValidasiKaryawan;
end;

end.

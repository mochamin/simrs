unit unFrmPerusahaan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, adodb,db,DBCtrls, Mask, Buttons,StrUtils, Grids, DBGrids,
  ComCtrls;

type
  TfrmPerusahaan = class(TForm)
    Panel1: TPanel;
    pcPerusahaan: TPageControl;
    tabPerusahaan: TTabSheet;
    tabKaryawan: TTabSheet;
    gbPerusahaan: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbKode: TDBEdit;
    dbNama: TDBEdit;
    dbAlamat: TDBMemo;
    dbTelp: TDBEdit;
    dbFax: TDBEdit;
    dbContact: TDBEdit;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    gbKaryawan: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbNPK: TDBEdit;
    dbNamaKaryawan: TDBEdit;
    dbTelpKaryawan: TDBEdit;
    dbHpKaryawan: TDBEdit;
    dbAlamatKaryawan: TDBMemo;
    Label12: TLabel;
    GroupBox3: TGroupBox;
    gridKaryawan: TDBGrid;
    gbViewPerusahaan: TGroupBox;
    gridViewPerusahaan: TDBGrid;
    dbKodePerusahaan: TDBEdit;
    cbOptions: TDBLookupComboBox;
    Label13: TLabel;
    Label15: TLabel;
    txtcariNama: TEdit;
    gbButton: TGroupBox;
    btnCancelKaryawan: TBitBtn;
    btnSaveKaryawan: TBitBtn;
    btnKaryawanEdit: TBitBtn;
    btnKaryawanNew: TBitBtn;
    Label14: TLabel;
    cbPerusahaan: TDBLookupComboBox;
    gbBtnPerusahaan: TGroupBox;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    cariPerusahaan: TEdit;
    Label16: TLabel;
    BitBtn1: TBitBtn;
    lblinput: TLabel;
    lblview: TLabel;
    btnDelete: TBitBtn;
    btnhapus: TBitBtn;
    procedure btnNewClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnKaryawanNewClick(Sender: TObject);
    procedure gridViewPerusahaanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbKodePerusahaanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelKaryawanClick(Sender: TObject);
    procedure btnKaryawanEditClick(Sender: TObject);
    procedure btnSaveKaryawanClick(Sender: TObject);
    procedure gridKaryawanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure txtcariNamaChange(Sender: TObject);
    procedure txtcariNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure cbPerusahaanClick(Sender: TObject);
    procedure dbKodePerusahaanKeyPress(Sender: TObject; var Key: Char);
    procedure dbKodeKeyPress(Sender: TObject; var Key: Char);
    procedure cariPerusahaanChange(Sender: TObject);
    procedure cariPerusahaanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnhapusClick(Sender: TObject);
  private
    { Private declarations }
    procedure validasiPerusahaan;
    procedure simpanPerusahaan;
    procedure validasiKaryawan;
    procedure simpanKaryawan;
    procedure otoKode;
    procedure refreshPerusahaan;
   // procedure cariKaryawan;
   // procedure cariPerusahaan;
  public
    { Public declarations }
  end;

var
  frmPerusahaan  : TfrmPerusahaan;
  kodePerusahaan : string;

implementation

uses unDm, unFrmAddPasien,unUtama;

{$R *.dfm}


procedure TfrmPerusahaan.refreshPerusahaan;
begin
  with dm.dSetPerusahaan do
  begin
    active := false;
    commandType := cmdText;
    commandText := 'SELECT * FROM taperusahaan '+
    'ORDER BY phKode asc';
    active:=true;
  end;
end;

procedure TfrmPerusahaan.otoKode;
var tempKode : string;
    zeroFill : string;
    tambahKode : integer;
begin
   with dm.dSetPerusahaan do
   begin
     active:=false;
     commandType:=cmdText;
     commandText := 'select * from taperusahaan '+
     'ORDER BY phKode ASC ';
     active:=true;
     open;
     last;

      tempKode := RightStr(fields.fieldByName('phKode').AsString,3);
      tambahKode := strToInt(tempKode)+1;


   case Length(intToStr(tambahKode)) of
   1 : zeroFill := '00';
   2 : zeroFill := '0';
   3 : zeroFill :='';
   end;

   
   append;
   dbKode.Text := 'PR-'+zeroFill+intToStr(tambahKode);
   end;
end;


procedure TfrmPerusahaan.simpanPerusahaan;
begin
   if MessageDlg('Simpan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      dm.dSetPerusahaan.UpdateBatch(arAll);
      btnSave.Visible := false;
      btnCancel.Visible := false;
      btnNew.Visible := true;
      btnEdit.Visible := true;
      gbPerusahaan.Enabled := false;
      //editDisabled;
   end;
end;

procedure TfrmPerusahaan.simpanKaryawan;
begin
  if MessageDlg('Simpan Record?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
  begin
     with dm.dSetPasienKaryawan do
     begin
        UpdateBatch(arAll);
        btnSaveKaryawan.Visible := false;
        btnCancelkaryawan.Visible := false;
        gbKaryawan.Enabled := false;
     end;
  end;
end;

procedure TfrmPerusahaan.validasiKaryawan;
begin
   if Length(dbNPK.Text)=0 then
   begin
      showMessage('NPK harap diisi!');
      dbNPK.SetFocus;
   end else
   if length(dbNamaKaryawan.Text)=0 then
   begin
     showMessage('Nama Karyawan belum diisi');
     dbNamaKaryawan.SetFocus;
   end else
   if Length(dbKodePerusahaan.Text)=0 then
   begin
     showMessage('Kode Harap Diisi!');
     dbKodePerusahaan.SetFocus;
   end else  simpanKaryawan;

end;

procedure Tfrmperusahaan.validasiPerusahaan;
begin


         if Length(dbKode.Text)=0 then
         begin
          showMessage('Kode Harap diisi');
          dbKode.SetFocus;
         end else
         if Length(dbNama.Text)=0 then
         begin
           showMessage('Nama Harap diisi!');
           dbNama.SetFocus;
         end else
         if cbOptions.Text ='' then
         begin
           showMessage('Option harus diisi!');
           cbOptions.SetFocus;
         end else  simpanPerusahaan;
       

end;

procedure TfrmPerusahaan.btnNewClick(Sender: TObject);
begin
  btnSave.Visible := true;
  btnCancel.Visible := true;
  btnNew.Visible := false;
  btnEdit.Visible := false;

  gbPerusahaan.Enabled := true;
  dbKode.Enabled := true;
  //editEnabled;
  dbNama.SetFocus;

    otoKode;

end;

procedure TfrmPerusahaan.btnCancelClick(Sender: TObject);
begin
 if MessageDlg('Batalkan Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   gbPerusahaan.Enabled := false;
   dm.dSetPerusahaan.CancelBatch(arAll);
   btnSave.Visible := false;
   btnCancel.Visible := false;
   btnNew.Visible := true;
   btnEdit.Visible := true;
   //editDisabled;
 end;
end;

procedure TfrmPerusahaan.btnSaveClick(Sender: TObject);
begin
  validasiPerusahaan;
end;

procedure TfrmPerusahaan.btnEditClick(Sender: TObject);
begin
  //editEnabled;
  if Length(dbKode.Text)=2 then
  begin
     showMessage('Ini adalah Record System, tidak bisa diedit!');
     btnSave.Visible := false;
     btnCancel.Visible := false;
     btnNew.Visible := true;
     btnEdit.Visible := true;
     gbPerusahaan.Enabled := false;
  end else
  begin
  gbPerusahaan.Enabled := true;
  dbKode.Enabled := false;
  dbNama.SetFocus;
  btnSave.Visible := true;
  btnCancel.Visible := true;
  btnNew.Visible := false;
  btnEdit.Visible := false;

  dm.dSetPerusahaan.Open;
  dm.dSetPerusahaan.Edit;
  end;
   
end;

procedure TfrmPerusahaan.btnKaryawanNewClick(Sender: TObject);
begin
 btnSaveKaryawan.Visible := true;
 btnCancelkaryawan.Visible := true;

 gbKaryawan.Enabled := true;
 dbNPK.SetFocus;
 with dm.dSetPasienKaryawan do
 begin
  open;
  append;
 end;
end;

procedure TfrmPerusahaan.gridViewPerusahaanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_RETURN then
  begin
     dbKodePerusahaan.Text := gridViewPerusahaan.Fields[0].AsString;
     gbViewPerusahaan.Visible := false;
     refreshPerusahaan;
  end;
end;

procedure TfrmPerusahaan.dbKodePerusahaanKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=VK_RETURN then
  begin
     gbViewPerusahaan.Visible := true;
     gridViewPerusahaan.SetFocus;
  end;
end;

procedure TfrmPerusahaan.btnCancelKaryawanClick(Sender: TObject);
begin

 if MessageDlg('Cancel Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
    gbKaryawan.Enabled := false;
    btnSaveKaryawan.Visible := false;
    btnCancelkaryawan.Visible := false;
    dm.dSetPasienKaryawan.CancelBatch(arAll);
 end;   
end;

procedure TfrmPerusahaan.btnKaryawanEditClick(Sender: TObject);
begin
   btnSaveKaryawan.Visible := true;
   btnCancelkaryawan.Visible := true;
   gbKaryawan.Enabled := true;
   dbNPK.SetFocus;
   dm.dSetPasienKaryawan.Open;
   dm.dSetPasienKaryawan.Edit;
end;

procedure TfrmPerusahaan.btnSaveKaryawanClick(Sender: TObject);
begin
 validasiKaryawan;
end;

procedure TfrmPerusahaan.gridKaryawanKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then
  begin
    frmAddPasien.txtNPK.Text := gridKaryawan.Fields[0].Value;
    frmPerusahaan.Close;
  end;
end;



procedure TfrmPerusahaan.txtcariNamaChange(Sender: TObject);
begin
   with dm.dSetPasienKaryawan do
   begin
     active := false;
     commandtype := cmdText;
     commandText := 'select * from tapasienkaryawan, taperusahaan '+
     'where phKode LIKE pkKodePerusahaan '+
     'and pkNama LIKE (:nama) '+
     'and pkKodePerusahaan LIKE (:kode)';
     parameters.ParamByName('nama').Value := '%'+txtCariNama.Text+'%';
     parameters.ParamByName('kode').Value := '%'+cbPerusahaan.KeyValue+'%';
     active := true;
   end;
end;

procedure TfrmPerusahaan.txtcariNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=vk_return then
  begin
    frmAddPasien.txtNPK.Text := gridKaryawan.Fields[0].Value;
   frmPerusahaan.Close;
  end;
end;

procedure TfrmPerusahaan.FormActivate(Sender: TObject);
begin

if dm.dsetOptions.Active = false        then dm.dsetOptions.Active := true;
if dm.dSetPasienKaryawan.Active = false then dm.dSetPasienKaryawan.Active := true;

if (isPoli<>0) or (isRawatInap<>0) or (isRegistrasiPasien<>0) then
begin
  gbBtnPerusahaan.Visible := false;
  gbButton.Visible := false;
  lblinput.Visible :=  false;
  lblview.Visible := true;
end else
begin
  gbBtnPerusahaan.Visible := true;
  gbButton.Visible := true;
   lblinput.Visible :=  true;
  lblview.Visible := false;
end;

if isPoli=1 then
begin
  with dm.dSetPerusahaan do
  begin
    active := false;
    commandType := cmdText;
    commandText := 'SELECT * FROM taperusahaan '+
    'WHERE phOptions LIKE "POLI" '+
    'OR phOptions LIKE "POLI DAN RAWAT INAP" ';
    active:=true;
  end;
end else
if isRawatInap=1 then
begin
  with dm.dSetPerusahaan do
  begin
    active := false;
    commandType := cmdText;
    commandText := 'SELECT * FROM taperusahaan '+
    'WHERE phOptions LIKE "RAWAT INAP" '+
    'OR phOptions LIKE "POLI DAN RAWAT INAP" ';
    active:=true;
  end;
end else
begin
   with dm.dSetPerusahaan do
  begin
    active := false;
    commandType := cmdText;
    commandText := 'SELECT * FROM taperusahaan '+
    'ORDER BY phKode asc';
    active:=true;
  end;
end;


if pcPerusahaan.ActivePage.Caption = 'Karyawan' then
begin
 txtCariNama.SetFocus
end; 
end;

procedure TfrmPerusahaan.cbPerusahaanClick(Sender: TObject);
begin
   with dm.dSetPasienKaryawan do
   begin
     active := false;
     commandType := cmdText;
     commandText := 'SELECT * FROM tapasienkaryawan '+
     'WHERE pkKodePerusahaan LIKE (:kode) ';
     parameters.ParamByName('kode').Value := '%'+cbPerusahaan.KeyValue+'%';
     active := true;
    
   end;
end;

procedure TfrmPerusahaan.dbKodePerusahaanKeyPress(Sender: TObject;
  var Key: Char);
begin
 key:=#0;
end;

procedure TfrmPerusahaan.dbKodeKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmPerusahaan.cariPerusahaanChange(Sender: TObject);
begin
  with dm.dSetPerusahaan do
  begin
   active := false;
   commandType := cmdText;
   commandText := 'SELECT * FROM taperusahaan '+
   'WHERE phNama LIKE (:nama) '+
   'ORDER BY phKode ASC';
   parameters.ParamByName('nama').Value := '%'+cariPerusahaan.Text+'%';
   active:=true;
  end;
end;

procedure TfrmPerusahaan.cariPerusahaanKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key=VK_RETURN then
  begin
     dbKodePerusahaan.Text := gridViewPerusahaan.Fields[0].AsString;
     gbViewPerusahaan.Visible := false;
     refreshPerusahaan;
  end;
end;

procedure TfrmPerusahaan.BitBtn1Click(Sender: TObject);
begin
  refreshPerusahaan;
end;

procedure TfrmPerusahaan.btnDeleteClick(Sender: TObject);
begin
  if messageDlg('Hapus Data?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
  begin
      dm.dSetPasienKaryawan.Delete;
      dm.dSetPasienKaryawan.UpdateBatch(arAll);
  end;
end;

procedure TfrmPerusahaan.btnhapusClick(Sender: TObject);
begin
 if MessageDlg('Hapus Data?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   with dm.dsetPasienKaryawan do
   begin
     active:=false;
     commandType := cmdText;
     commandText := 'select * from tapasienkaryawan '+
     'where pkKodePerusahaan like (:kode) ';
     parameters.ParamByName('kode').Value := dbkode.Text;
     active:=true;

     if isEmpty=false then
     begin
       showMessage('Data Perusahaan Tidak Boleh Dihapus!' +#13+
       'Ada Karyawan yang menggunakan data perusahaan!');
       abort;
     end else
         begin
           dm.dSetPerusahaan.Delete;
           dm.dSetPerusahaan.UpdateBatch(arAll);
           showmessage('Data telah dihapus');
         end;
   end;


 end;
end;

end.

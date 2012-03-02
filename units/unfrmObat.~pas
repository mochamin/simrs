unit unfrmObat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ADODb,ComCtrls, Buttons, DBCtrls, Mask;

type
  TfrmObat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label13: TLabel;
    Panel3: TPanel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    btnNew: TBitBtn;
    gbData: TGroupBox;
    Label1: TLabel;
    txtKodeObat: TEdit;
    Label15: TLabel;
    txtKodeSupplier: TEdit;
    Label2: TLabel;
    txtNamaObat: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    txtJmlStok: TEdit;
    Label10: TLabel;
    txtMerek: TEdit;
    Label11: TLabel;
    txtSeri: TEdit;
    txtSatuan: TDBLookupComboBox;
    Button1: TButton;
    Label5: TLabel;
    dbkategori: TDBLookupComboBox;
    expired: TMaskEdit;
    txtrak: TEdit;
    Label6: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure calendarClick(Sender: TObject);
    procedure txtHargaBeliKeyPress(Sender: TObject; var Key: Char);
    procedure txtHargaJualKeyPress(Sender: TObject; var Key: Char);
    procedure txtJmlStokKeyPress(Sender: TObject; var Key: Char);
    procedure txtStokMinimalKeyPress(Sender: TObject; var Key: Char);
    procedure txtDiskonKeyPress(Sender: TObject; var Key: Char);
    procedure txtHargaJualChange(Sender: TObject);
    procedure txtHargaJualExit(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure dtExpiredKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btncancelsatuanClick(Sender: TObject);
    procedure btnSavesatuanClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure validasiObat;
    procedure simpanObat;
    procedure clearObat;
  public
    { Public declarations }
  end;

var
  frmObat: TfrmObat;

implementation

uses unDm, unfrmsatuanobat;

{$R *.dfm}

procedure TfrmObat.clearObat;
begin
 txtKodeObat.Clear;
 txtKodeSupplier.Clear;
 txtNamaObat.Clear;
 dbkategori.CleanupInstance;
 //txtSatuan.ItemIndex := -1;
 //txtHargaBeli.Clear;
 //txtHargaJual.Clear;
 txtJmlStok.Clear;
 //txtStokMinimal.Clear;
 //dtExpired.Clear;
 txtMerek.Clear;
 txtSeri.Clear;
//txtDiskon.Clear;
end;


procedure TfrmObat.simpanObat;
begin

  with dm.dSetObat do
  begin
   if messageDlg('Simpan record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
    open;
    append;
    fields.FieldByName('obKode').AsString          := txtKodeObat.Text;
    fields.FieldByName('obNama').AsString          := txtNamaObat.Text;
    fields.FieldByName('obKodeSupplier').AsString  := txtKodeSupplier.Text;
    fields.FieldByName('obSatuan').AsString        := txtSatuan.Text;
    fields.FieldByName('obStok').AsString          := txtJmlStok.Text;
    fields.FieldByName('obKategori').Value         := dbkategori.KeyValue;
    fields.FieldByName('obMerek').AsString         := txtMerek.Text;
    fields.FieldByName('obSeri').AsString          := txtSeri.Text;
    fields.FieldByName('obHargaJual').Value        := 0;
    fields.FieldByName('obexpired').Value          := strToDate(expired.Text);
    fields.FieldByName('obrak').Value              := txtrak.Text;
   // fields.FieldByName('obDiskon').AsString := txtDiskon.Text;
    post;
    updateBatch(arAll);
    clearObat;
    btnSave.Visible:=false;
    btnCancel.Visible := false;
    gbData.Enabled := false;
   end;
  end;
end;

procedure TfrmObat.validasiObat;
begin
 with dm.dSetObat do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'SELECT * FROM taobat '+
   'WHERE obKode LIKE (:kodeObat)';
   Parameters.ParamByName('kodeObat').value := '%'+txtKodeObat.Text+'%';
   active := true;


 if isEmpty = false then
 begin
   showMessage('Kode Sudah ada! Pilih kode yg lain..');
   txtKodeObat.SetFocus;
 end else
 if Length(txtNamaObat.Text)=0 then
 begin
    showMessage('Nama Obat Harap diisi');
    txtNamaObat.SetFocus;
 end else
 if Length(txtSatuan.Text)=0 then
 begin
   showMessage('Satuan belum diisi');
   txtSatuan.SetFocus;
 end else
 if Length(txtJmlStok.Text)=0 then
 begin
   showMessage('Jml Stok belum diisi');
   txtJmlStok.SetFocus;
 end else

     begin
     simpanObat;
     showMessage('Data disimpan...');
     dm.dsetObatView.Requery();
     end;
 end;

end;

procedure TfrmObat.SpeedButton1Click(Sender: TObject);
begin
 //gbCalendar.Visible := true;
end;

procedure TfrmObat.calendarClick(Sender: TObject);
begin
 //dtExpired.Text := DateToStr(Calendar.Date);
 //gbCalendar.Visible := false;
end;

procedure TfrmObat.txtHargaBeliKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9',#8]) then
 begin
   key :=#0;
 end;
end;

procedure TfrmObat.txtHargaJualKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
 begin
   key :=#0;
 end;
end;

procedure TfrmObat.txtJmlStokKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
 begin
   key :=#0;
 end;
end;

procedure TfrmObat.txtStokMinimalKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
 begin
   key :=#0;
 end;
end;

procedure TfrmObat.txtDiskonKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
 begin
   key :=#0;
 end;
end;

procedure TfrmObat.txtHargaJualChange(Sender: TObject);
begin
{if length(txtHargaJual.Text) >= length(txtHargaBeli.Text) then
begin
  if (strToInt(txtHargaBeli.Text)) > (strToInt(txtHargaJual.Text)) then
  begin
    showMessage('Harga Jual Lebih rendah!');
    txtHargaJual.SetFocus;
  end;
 end;}
end;

procedure TfrmObat.txtHargaJualExit(Sender: TObject);
begin
{if length(txtHargaJual.Text) >= length(txtHargaBeli.Text) then
begin
  if (strToInt(txtHargaBeli.Text)) > (strToInt(txtHargaJual.Text)) then
  begin
    showMessage('Harga Jual Lebih rendah!');
    txtHargaJual.SetFocus;
  end;
 end;}
end;

procedure TfrmObat.btnSaveClick(Sender: TObject);
begin
 validasiObat;
end;

procedure TfrmObat.dtExpiredKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9','/',#8]) then
 begin
  key := #0;
 end;
end;

procedure TfrmObat.btnCancelClick(Sender: TObject);
begin
  if messageDlg('Batalkan Data?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
     ClearObat;
     btnSave.Visible:=false;
    btnCancel.Visible := false;
    gbData.Enabled := false;
  end;
end;

procedure TfrmObat.btnNewClick(Sender: TObject);
begin
 gbdata.Enabled := true;
 btnSave.Visible := true;
 btnCancel.Visible := true;
 txtKodeObat.SetFocus;
end;

procedure TfrmObat.btncancelsatuanClick(Sender: TObject);
begin
 //gbsatuan.Visible := false;
end;

procedure TfrmObat.btnSavesatuanClick(Sender: TObject);
begin



//  gbsatuan.Visible := false;
  txtSatuan.SetFocus;
end;

procedure TfrmObat.Button1Click(Sender: TObject);
begin
 frmSatuan.ShowModal;
// gbsatuan.Visible := true;
// txtSatuanbaru.SetFocus;
end;

procedure TfrmObat.FormActivate(Sender: TObject);
begin
 if dm.dsetSatuan.Active = false then dm.dsetSatuan.Active := true;
end;

end.

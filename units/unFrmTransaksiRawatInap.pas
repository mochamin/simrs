unit unFrmTransaksiRawatInap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,ADODB, StdCtrls, ExtCtrls, ComCtrls, Buttons,
  DBCtrls, DB, Mask;

type
  TfrmTreatment = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    gridViewRawatInap: TDBGrid;
    GroupBox2: TGroupBox;
    txtNamaPasien: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    txtKamar: TLabel;
    dtTgl: TLabel;
    Label5: TLabel;
    txtCariAlamat: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    gbtreatmentdetail: TGroupBox;
    gridTreatment: TDBGrid;
    GroupBox5: TGroupBox;
    txtViewTglMasuk: TLabel;
    GroupBox6: TGroupBox;
    txtViewReg: TLabel;
    GroupBox7: TGroupBox;
    txtViewRM: TLabel;
    GroupBox8: TGroupBox;
    txtViewNama: TLabel;
    GroupBox9: TGroupBox;
    txtViewUsia: TLabel;
    GroupBox11: TGroupBox;
    txtViewKamar: TLabel;
    txtViewAlamat: TMemo;
    Label12: TLabel;
    Label13: TLabel;
    GroupBox10: TGroupBox;
    txtViewPenanggungJawab: TLabel;
    btncancel: TBitBtn;
    btnsave: TBitBtn;
    taRawatInapDetail: TADOTable;
    taRawatInap: TADOTable;
    dsRawatInap: TDataSource;
    dsRawatInapDetail: TDataSource;
    GroupBox12: TGroupBox;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    GroupBox13: TGroupBox;
    Label20: TLabel;
    txtViewKodeKamar: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    btnclose: TBitBtn;
    kamar: TEdit;
    caritgl: TMaskEdit;
    procedure gridViewRawatInapDblClick(Sender: TObject);
    procedure gridViewRawatInapKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dtTglMasukKeyPress(Sender: TObject; var Key: Char);
    procedure btnsaveClick(Sender: TObject);
    procedure gridTreatmentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncancelClick(Sender: TObject);
    procedure taRawatInapDetailBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure txtViewAlamatKeyPress(Sender: TObject; var Key: Char);
    procedure btncloseClick(Sender: TObject);
    procedure gridTreatmentDblClick(Sender: TObject);
    procedure txtNamaPasienChange(Sender: TObject);
    procedure kamarChange(Sender: TObject);
    procedure txtCariAlamatChange(Sender: TObject);
    procedure caritglChange(Sender: TObject);
    //procedure txtCariNamaChange(Sender: TObject);
//    procedure gridAlkesKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
//    procedure txtCariNamaKeyDown(Sender: TObject; var Key: Word;
    //  Shift: TShiftState);
  private
    { Private declarations }
    procedure ViewRawatInap;
    procedure cariPasienRawatInap;
    procedure addTreatment;
    procedure cariNoReg;
    procedure viewTreatment;
//    procedure isiAlkes;
  
  public
    { Public declarations }
    procedure refreshViewRawatInap;
  end;

var
  frmTreatment: TfrmTreatment;

implementation

uses unDm, unfrmObat, unViewObat,unUtama, unFrmService, 
  unfrmViewAlkes, undmrpt, unFrmViewDokter, unfrmjenistindakan,
  unfrmrawatbaby;

{$R *.dfm}



procedure TfrmTreatment.viewTreatment;
begin
  //tarawatinap.Refresh;
end;

procedure TfrmTreatment.cariNoReg;
begin
  with dm.dSetRawatInap do
  begin
    active := false;
    commandType := cmdText;
    commandText := 'SELECT * FROM tarawatinap '+
    'WHERE inNoReg LIKE (:noReg) ';
    parameters.ParamByName('noReg').Value := '%'+txtViewReg.Caption+'%';
    active := true;
    open;
    edit;
  end;
end;

procedure TfrmTreatment.addTreatment;
begin
  with tarawatinap do
  begin
    open;
    append;
    fields.FieldByName('inNoReg').AsString := txtViewReg.Caption;
    post;
  end;

  with tarawatinapdetail do
  begin
    open;
    append;

  end;
end;

procedure TfrmTreatment.refreshViewRawatInap;
begin
    with dm.dsetviewrawatinap do
    begin
    active := false;
    commandType := cmdText;
    commandText := 'select * from tarawatinap, tapasien,takamar, takamardetail '+
    'where pskodePasien like innorm '+
    'AND '+
    'kdNoReg LIKE inNoReg '+
    'AND '+
    'kaKode LIKE kdKamar '+
    'AND '+
    'kdActive=1 '+
    'AND '+
    'inisBayar = 0 '+
    'ORDER BY inNoReg ';
    active := true;    
    end;

end;

procedure TfrmTreatment.cariPasienRawatInap;
begin
    with dm.dsetViewRawatInap do
    begin
    active := false;
    commandType := cmdText;
    commandText := 'select * from tarawatinap, tapasien,takamar '+
    'where psKodePasien LIKE inNoRM '+
    'AND kaKode LIKE inKodeKamar '+
    'AND inStatus = "PROGRESS" '+
    'AND psNama LIKE (:nama) '+
    'AND kaNama LIKE (:kamar) '+
    'AND inTglMasuk LIKE (:tglMasuk) '+
    'AND psAlamat LIKE (:alamat) '+
    'ORDER BY inNoReg ';
    parameters.ParamByName('nama').Value := '%'+txtNamapasien.Text+'%';
   // parameters.ParamByName('kamar').Value := '%'+txtCariKamar.Text+'%';
    parameters.ParamByName('alamat').Value := '%'+txtCariAlamat.Text+'%';

{  if Length(dtTglMasuk.Text)<>0 then
   begin
    parameters.ParamByName('tglMasuk').Value := strToDate(dtTglMasuk.Text);
   end else
   begin
     parameters.ParamByName('tglMasuk').Value := '%'+''+'%';
   end;
 }
    active := true;

    end;
end;


procedure TfrmTreatment.ViewRawatInap;
begin
   txtViewTglMasuk.Caption := gridViewRawatInap.Fields[0].Value;
   txtViewReg.Caption := gridViewRawatInap.Fields[10].Value;
   txtViewRM.Caption := gridViewRawatInap.Fields[3].Value;
   txtViewNama.Caption := gridViewRawatInap.Fields[1].Value;
   txtViewUsia.Caption := gridViewRawatInap.Fields[2].Value;
   txtViewAlamat.Text := gridViewRawatInap.Fields[6].Value;
   txtViewPenanggungJawab.Caption := gridViewRawatInap.Fields[5].Value;
   txtViewKodeKamar.Caption := gridViewRawatInap.Fields[7].Value;
   txtViewKamar.Caption := gridViewRawatInap.Fields[8].Value;
   
end;

procedure TfrmTreatment.gridViewRawatInapDblClick(Sender: TObject);
begin
  gridTreatment.Enabled := true;
  viewRawatInap;
  viewtreatment;
  addTreatment;
  gridTreatment.SetFocus;
  btnSave.Visible := true;
  btnCancel.Visible := true;
end;

procedure TfrmTreatment.gridViewRawatInapKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=VK_RETURN then
  begin
    viewRawatInap;
    addTreatment;
    gridTreatment.SetFocus;
  end;
end;

procedure TfrmTreatment.FormActivate(Sender: TObject);
begin
 taRawatInap.Active := true;
 taRawatInapDetail.Active := true;
 refreshViewRawatInap;
 gridViewRawatInap.SetFocus;
 isTreatment := 1;
end;

procedure TfrmTreatment.BitBtn2Click(Sender: TObject);
begin
  cariPasienRawatInap;
end;

procedure TfrmTreatment.BitBtn1Click(Sender: TObject);
begin
  with dm.dSetKamar do
  begin
   open;
   first;
  end;
  refreshViewRawatInap;
 // txtCariKamar.ListFieldIndex := 5;
  txtNamaPasien.Clear;
 // dtTglMasuk.Clear;
  txtCariAlamat.Clear;
end;

procedure TfrmTreatment.dtTglMasukKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9','/','-',#8])then
  begin
    key:=#0;
  end;
end;

procedure TfrmTreatment.btnsaveClick(Sender: TObject);
begin
if MessageDlg('Simpan Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
  if dm.dsetrawatbaby.Active = false then dm.dsetrawatbaby.Active := true;
  if tarawatinapdetail.Active = false then tarawatinapdetail.Active := true;
  
  taRawatInapDetail.UpdateBatch(arAll);
  dm.dsetrawatbaby.UpdateBatch(arAll);
  showMessage('Transaksi tersimpan...');
  btnsave.Visible := false;
  btnCancel.Visible := false;
  gridTreatment.Enabled := false;
 { dm.dsetRptRawatInap.Active := false;
  dm.dsetRptRawatInap.Active := true;
  dmrpt.dsetrptRAwatInapDetail.Active := false;
  dmrpt.dsetrptRAwatInapDetail.Active := true;
  }
end;
end;

procedure TfrmTreatment.gridTreatmentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
  VK_DELETE : begin
               if MessageDlg('Hapus Record ini?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
               begin
                taRawatInapDetail.Delete;
               end;
              end;
  VK_F3 : frmService.ShowModal;
  VK_F4 : frmrawatbaby.ShowModal;
  VK_F5 : frmViewObat.ShowModal;
  VK_F6 : begin
          isObatOK:=1;
          frmviewObat.ShowModal;
          end;
  VK_F7 : begin
          isObatVK:=1;
          frmviewObat.ShowModal;
          end;
  VK_F9 : begin
          isKonsul:=1;
          frmViewDokter.ShowModal;
          //txtCariNama.SetFocus;
          end;
   VK_F10 : begin
           isOK :=1;
           frmJenisTindakan.ShowModal;
           end;
     VK_F11 : begin
           isVK :=1;
           frmJenisTindakan.ShowModal;
           end;

  end;

end;

procedure TfrmTreatment.btncancelClick(Sender: TObject);
begin
if MessageDlg('Tombol ini akan membatalkan transaksi terakhir! '#13+
'Anda yakin ingin membatalkan transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
  taRawatInapDetail.CancelBatch(arAll);
  gridViewRawatInap.SetFocus;
  btnsave.Visible := false;
  btnCancel.Visible := false;
  gridTreatment.Enabled := false;
end;
  
end;

procedure TfrmTreatment.taRawatInapDetailBeforePost(DataSet: TDataSet);
begin
 gridTreatment.Fields[6].Value := gridTreatment.Fields[4].Value*gridTreatment.Fields[5].value;
end;

procedure TfrmTreatment.FormCreate(Sender: TObject);
begin
// taRawatInap.Active := true;
 //taRawatInapDetail.Active := true;
end;

{procedure TfrmTreatment.txtCariNamaChange(Sender: TObject);
begin
 with dm.dsetAlkes do
 begin
   Locate('aknama',txtCariNama.Text,[loPartialKey]);
 end;
end;

procedure TfrmTreatment.gridAlkesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
   isiAlkes;
   //gbalkes.Visible := false;
 end;

{ if key=vk_escape then
 begin
   gbalkes.Visible := false;
 end;
end;
 }
{procedure TfrmTreatment.txtCariNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
 begin
   isiAlkes;
   //gbalkes.Visible := false;
 end;

 if key=vk_escape then
 begin
   gbalkes.Visible := false;
 end;
end;
  }
procedure TfrmTreatment.txtViewAlamatKeyPress(Sender: TObject;
  var Key: Char);
begin
 key:=#0;
end;

procedure TfrmTreatment.btncloseClick(Sender: TObject);
begin
 close;
end;

procedure TfrmTreatment.gridTreatmentDblClick(Sender: TObject);
begin
 if gridtreatment.Enabled= false then
 begin
   showMessage('double click dahulu pada nama pasien untuk '+#13+
   'Bisa menambahkan item pada Treatment Detail ');
   gridViewRawatInap.SetFocus;
 end;
end;

procedure TfrmTreatment.txtNamaPasienChange(Sender: TObject);
begin
 dm.dsetViewRawatInap.Locate('psnama',txtnamapasien.Text,[loPartialKey]);
end;

procedure TfrmTreatment.kamarChange(Sender: TObject);
begin
  dm.dsetViewRawatInap.Locate('kanama',kamar.Text,[loPartialKey]);
end;

procedure TfrmTreatment.txtCariAlamatChange(Sender: TObject);
begin
  dm.dsetViewRawatInap.Locate('psalamat',txtcariAlamat.Text,[loPartialKey]);
end;

procedure TfrmTreatment.caritglChange(Sender: TObject);
begin
  dm.dsetViewRawatInap.Locate('intglmasuk',caritgl.Text,[loPartialKey]);
end;

end.

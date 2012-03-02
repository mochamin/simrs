unit unFrmPreferensi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls,adodb, Buttons, db, Grids,
  DBGrids, ComCtrls;

type
  TfrmPreferensi = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    gbEdit: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dbAdmin: TDBEdit;
    dbRawatinap: TDBEdit;
    dbKelasVisible: TDBEdit;
    dbKelas: TEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    GroupBox2: TGroupBox;
    btnEdit: TBitBtn;
    btnCancel: TBitBtn;
    btnNew: TBitBtn;
    btnSave: TBitBtn;
    btnDelete: TBitBtn;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    gridView: TDBGrid;
    txtCarikelas: TEdit;
    gbKelas: TGroupBox;
    gridKelas: TDBGrid;
    gbdata: TGroupBox;
    DBEdit5: TDBEdit;
    Label15: TLabel;
    cbdokter: TDBLookupComboBox;
    Label16: TLabel;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    btnnewpoli: TBitBtn;
    btneditpoli: TBitBtn;
    btnsavepoli: TBitBtn;
    btncancelpoli: TBitBtn;
    GroupBox5: TGroupBox;
    DBGrid1: TDBGrid;
    DBEdit6: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    procedure dbAdminKeyPress(Sender: TObject; var Key: Char);
    procedure dbRawatinapKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dbKelasKeyPress(Sender: TObject; var Key: Char);
    procedure txtCarikelasChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure gridKelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbKelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnnewpoliClick(Sender: TObject);
    procedure btneditpoliClick(Sender: TObject);
    procedure btnsavepoliClick(Sender: TObject);
    procedure btncancelpoliClick(Sender: TObject);
  private
    { Private declarations }
    procedure cariKelas;
    procedure simpan;
    procedure Editsimpan;
  public
    { Public declarations }
  end;

var
  frmPreferensi: TfrmPreferensi;
  isEdit : integer;
implementation

uses unDm;

{$R *.dfm}


procedure TfrmPreferensi.simpan;
begin
     with dm.dsetAdministrasi do
     begin
       if MessageDlg('Simpan Perubahan?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
       begin
        dm.dsetAdministrasi.edit;
        fields.FieldByName('adkelas').AsString := dbkelas.Text;
        dm.dsetAdministrasi.UpdateBatch(arCurrent);
        gbEdit.Enabled := false;
        dbKelas.Visible := false;
         btnSave.Visible := false;
         btnCancel.Visible := false;
         isEdit :=0;
       end;
    end;     
end;

procedure TfrmPreferensi.Editsimpan;
begin
     with dm.dsetAdministrasi do
     begin
       if MessageDlg('Simpan Perubahan?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
       begin
        dm.dsetAdministrasi.UpdateBatch(arCurrent);
        gbEdit.Enabled := false;
        dbKelas.Visible := false;
         btnSave.Visible := false;
         btnCancel.Visible := false;
         isEdit :=0;
       end;
    end;     
end;

procedure TfrmPreferensi.cariKelas;
var tempKelas : string;
begin
  tempKelas:=dbKelas.Text;
  //showMessage(tempkelas);
  with dm.dsetAdministrasi do
  begin
  if isEdit=1 then
  begin
    Editsimpan;
    btnDelete.Visible := true;
  end else
     if Locate('adkelas',tempKelas,[locaseinsensitive])=false  then
     begin
        simpan;
    end else
        begin
          showMessage('Kelas sudah di setting! '+#13+
          'Tidak diperkenankan setting lebih dari satu!');
          btnSave.Visible := false;
          btnCancel.Visible := false;
          btnDelete.Visible := true;
          cancelBatch(arAll);
          dbKelas.Visible := false;

          gbEdit.Enabled := false;

          
        end;
  end;
end;

procedure TfrmPreferensi.dbAdminKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then
 begin
  key:=#0;
 end;
end;

procedure TfrmPreferensi.dbRawatinapKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then
 begin
  key:=#0;
 end;
end;

procedure TfrmPreferensi.btnEditClick(Sender: TObject);
begin
  isEdit := 1;
  dm.dsetAdministrasi.Edit;
  gbEdit.Enabled := true;
  btnSave.Visible := true;
  btnCancel.Visible := true;
   dbAdmin.SetFocus;
         btnDelete.Visible := false;
end;

procedure TfrmPreferensi.btnSaveClick(Sender: TObject);
begin
 cariKelas;
end;

procedure TfrmPreferensi.btnCancelClick(Sender: TObject);
begin
  if MessageDlg('Batalkan Perubahan?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
  dm.dsetAdministrasi.CancelBatch(arAll);
  //refreshkelas;
  gbEdit.Enabled := false;
  btnSave.Visible := false;
  btnCancel.Visible := false;
  dbkelas.Visible := false;
  isEdit:=0;
  btnDelete.Visible := true;
 end;
end;

procedure TfrmPreferensi.dbKelasKeyPress(Sender: TObject; var Key: Char);
begin
 key :=#0;
end;

procedure TfrmPreferensi.txtCarikelasChange(Sender: TObject);
begin
 with dm.dsetAdministrasi do
 begin
   Locate('adKelas',txtCariKelas.Text,[loCaseInsensitive]);
 end;
end;

procedure TfrmPreferensi.btnNewClick(Sender: TObject);
begin

  gbEdit.Enabled := true;
  btnSave.Visible := true;
  btnCancel.Visible := true;
  dbKelas.Visible := true;
  dm.dsetAdministrasi.Append;
  dbKelas.SetFocus;
  dbKelas.Clear;
  btnDelete.Visible := false;
end;

procedure TfrmPreferensi.gridKelasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
   dbKelas.Text := gridKelas.Fields[4].Value;
   gbKelas.Visible := false;
   dbAdmin.SetFocus;
 end;
end;

procedure TfrmPreferensi.dbKelasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
    gbKelas.Visible := true;
    gridKelas.SetFocus;
 end;
end;

procedure TfrmPreferensi.btnDeleteClick(Sender: TObject);
begin
 if messageDlg('Delete Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dsetAdministrasi.Delete;
   dm.dsetAdministrasi.UpdateBatch(arAll);
 end;
end;

procedure TfrmPreferensi.FormActivate(Sender: TObject);
begin
 with dm.dsetAdministrasi do
 begin
  active:=false;
  commandType := cmdText;
  commandText := 'select * from taadministrasi ';
  active:=true;
 end;
end;

procedure TfrmPreferensi.btnnewpoliClick(Sender: TObject);
begin
 gbdata.Enabled := true;
 cbdokter.SetFocus;
 btnSavePoli.Visible:=true;
 btnCancelPoli.Visible := true;
 dm.dsetadmpoli.Append;
end;

procedure TfrmPreferensi.btneditpoliClick(Sender: TObject);
begin
 gbdata.Enabled := true;
 cbdokter.SetFocus;
 btnSavePoli.Visible:=true;
 btnCancelPoli.Visible := true;
 dm.dsetadmpoli.edit;
end;

procedure TfrmPreferensi.btnsavepoliClick(Sender: TObject);
begin
 if messageDlg('Simpan Data?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dsetadmpoli.UpdateBatch(arAll);
   btnSavePoli.Visible:=false;
   btnCancelPoli.Visible := false;
   gbdata.Enabled := false;
 end;
end;

procedure TfrmPreferensi.btncancelpoliClick(Sender: TObject);
begin
 if messageDlg('Batalkan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dsetadmpoli.CancelBatch(arAll);
   btnSavePoli.Visible:=false;
   btnCancelPoli.Visible := false;
   gbdata.Enabled := false;
 end;
end;

end.

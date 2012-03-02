unit unFrmItemLab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, adodb,db,Buttons, Grids,
  DBGrids;

type
  TfrmItemLab = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gbLab: TGroupBox;
    dbKode: TDBEdit;
    Label1: TLabel;
    dbItem: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbNormal: TDBEdit;
    gbValueByGender: TGroupBox;
    Label5: TLabel;
    dbNormalPria: TDBEdit;
    Label6: TLabel;
    dbNormalWanita: TDBEdit;
    dbSatuan: TDBEdit;
    Label8: TLabel;
    gbButton: TGroupBox;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    dbGender: TDBComboBox;
    Label9: TLabel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    grid: TDBGrid;
    Label10: TLabel;
    txtCari: TEdit;
    Label11: TLabel;
    dbStatus: TDBComboBox;
    Label12: TLabel;
    dbKodeKelas: TDBEdit;
    Label13: TLabel;
    dbTitle: TDBEdit;
    dbgrouptarif: TDBLookupComboBox;
    Label7: TLabel;
    dbgroup: TDBLookupComboBox;
    btndelete: TBitBtn;
    BitBtn1: TBitBtn;
    procedure dbGenderClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dbStatusClick(Sender: TObject);
    procedure dbKodeKelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure dbKodeKelasKeyPress(Sender: TObject; var Key: Char);
    procedure txtCariChange(Sender: TObject);
    procedure btndeleteClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgroupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItemLab: TfrmItemLab;

implementation

uses unDm, unFrmViewBed,unUtama;

{$R *.dfm}

procedure TfrmItemLab.dbGenderClick(Sender: TObject);
begin
 Case dbGender.ItemIndex of
 0 : Begin
     gbValueByGEnder.Enabled := true;
     dbNormal.Enabled := false;
     dbNormalPria.SetFocus;
     end;
 1 : begin
     gbValueByGender.Enabled := false;
     dbNormal.Enabled := true;
     dbNormal.SetFocus;
     end;
 end;
end;

procedure TfrmItemLab.btnNewClick(Sender: TObject);
begin
  gbLab.Enabled := true;
  dbStatus.SetFocus;
  btnSave.Visible := true;
  btnCancel.Visible := true;
  btndelete.Visible := false;
  dm.dsetItemLab.Open;
  dm.dsetItemLab.Append;
end;

procedure TfrmItemLab.btnEditClick(Sender: TObject);
begin
  dm.dsetItemLab.Open;
  dm.dsetItemLab.Edit;
  gbLab.Enabled := true;
  dbItem.SetFocus;
  btnSave.Visible := true;
  btnCancel.Visible := true;

end;

procedure TfrmItemLab.btnSaveClick(Sender: TObject);
var kode : string;
begin
kode := grid.Fields[0].Value;
if MessageDlg('Simpan Record?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
begin
  //if dbgroup.Text = dbitem.Text then dbitem.Text := dbgroup.Text;
  dm.dsetItemLab.UpdateBatch(arCurrent);
  gbLab.Enabled := False;
  btnSave.Visible := false;
  btnCancel.Visible := false;
  dm.dsetItemLab.Requery();
  dm.dsetItemLab.Locate('ilkode',kode,[loCaseInsensitive]);
  btndelete.Visible := true;
end;  
end;

procedure TfrmItemLab.btnCancelClick(Sender: TObject);
begin
if MessageDlg('Cancel Record?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
begin
  gbLab.Enabled := False;
  btnSave.Visible := false;
  btnCancel.Visible := false;
  dm.dsetItemLab.CancelBatch(arAll);
  btndelete.Visible := true;
end;
end;

procedure TfrmItemLab.dbStatusClick(Sender: TObject);
begin
 case dbstatus.ItemIndex of
 0 : begin
     dbSatuan.Enabled := true;
     dbNormal.Enabled := true;
     dbGender.Enabled := true;
    // dbTarif.Enabled := true;
     dbTitle.Enabled := false;
     end;
{ 1 : begin
     dbSatuan.Enabled := false;
     dbNormal.Enabled := false;
     dbGender.Enabled := false;
     gbValueByGender.Enabled := false;
     dbTarif.Enabled := true;

     end;                    }
 1 : begin
     dbSatuan.Enabled := true;
     dbNormal.Enabled := true;
     dbGender.Enabled := true;
     gbValueByGender.Enabled := false;
    // dbTarif.Enabled := true;
     dbTitle.Enabled := true;
     end;
 end;
end;

procedure TfrmItemLab.dbKodeKelasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
   frmViewBed.ShowModal;
 end;
end;

procedure TfrmItemLab.FormActivate(Sender: TObject);
begin
 if dm.dsetGroupLab.Active = false then dm.dsetGroupLab.Active := true;
 if dm.dsettariflab.Active = false then dm.dsettariflab.Active := true;
 with dm.dsetItemLab do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from taitemlab ';
   active:=true;
 end;

 isLab:=1;
end;

procedure TfrmItemLab.dbKodeKelasKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmItemLab.txtCariChange(Sender: TObject);
begin
  dm.dsetItemLab.Locate('ilitem',txtCari.Text,[loPartialKey]);
end;

procedure TfrmItemLab.btndeleteClick(Sender: TObject);
begin
  if MessageDlg('Hapus Data ini? ',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    dm.dsetitemlab.Delete;
    dm.dsetItemLab.UpdateBatch(arAll);
  end;     
end;

procedure TfrmItemLab.BitBtn1Click(Sender: TObject);
begin
  with dm.dsetItemLab do
  begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from taitemlab '+
   'order by ilitem asc ';
   active:=true;
  end;
end;

procedure TfrmItemLab.dbgroupClick(Sender: TObject);
begin
 if trim(dbgroup.Text) = trim(dbitem.Text) then
 begin
   showMessage('sama');
   dbitem.Text := dbgroup.Text;
 end;
end;

end.

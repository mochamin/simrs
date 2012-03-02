unit unfrmsatuanobat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, Grids,db,adodb, DBGrids;

type
  TfrmSatuan = class(TForm)
    Panel1: TPanel;
    gbsatuan: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    dbsatuan: TDBEdit;
    GroupBox3: TGroupBox;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSatuan: TfrmSatuan;

implementation

uses unDm;

{$R *.dfm}

procedure TfrmSatuan.btnNewClick(Sender: TObject);
begin
 gbsatuan.Enabled := true;
 dbsatuan.SetFocus;
 dm.dsetSatuan.Open;
 dm.dsetSatuan.Append;
 btnCancel.Visible := true;
 btnSave.Visible :=  true;
end;

procedure TfrmSatuan.btnEditClick(Sender: TObject);
begin
 gbsatuan.Enabled := true;
 dbsatuan.SetFocus;
 dm.dsetSatuan.Edit;
 btnCancel.Visible := true;
 btnSave.Visible :=  true;
end;

procedure TfrmSatuan.btnSaveClick(Sender: TObject);
begin
if MessageDlg('Simpan Satuan?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
begin
 dm.dsetSatuan.UpdateBatch(arAll);
 btnSave.Visible := false;
 btnCancel.Visible := false;
 gbsatuan.Enabled := false;
 dm.dsetSatuan.Requery();
end;
end;

procedure TfrmSatuan.btnCancelClick(Sender: TObject);
begin
 if MessageDlg('Batalkan Data?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
begin
 dm.dsetSatuan.CancelBatch(arAll);
 btnSave.Visible := false;
 btnCancel.Visible := false;
  gbsatuan.Enabled := false;
end;
end;

end.

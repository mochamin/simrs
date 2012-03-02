unit unFrmGroupLab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls,adodb,db, Buttons, Grids,
  DBGrids;

type
  TfrmGroupLab = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    gbInput: TGroupBox;
    Label2: TLabel;
    dbNama: TDBEdit;
    GroupBox2: TGroupBox;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    procedure btnNewClick(Sender: TObject);
    procedure dbKodeKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }

   public
    { Public declarations }
  end;

var
  frmGroupLab: TfrmGroupLab;

implementation

uses unDm;

{$R *.dfm}


procedure TfrmGroupLab.btnNewClick(Sender: TObject);
begin
  gbInput.Enabled := true;
  //dbKode.SetFocus;
  btnSave.Visible := true;
  btnCancel.Visible := true;
  dm.dsetGroupLab.Open;
  dm.dsetGroupLab.Append;
end;

procedure TfrmGroupLab.dbKodeKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmGroupLab.btnEditClick(Sender: TObject);
begin
  gbInput.Enabled := true;
  dbNama.SetFocus;
  btnSave.Visible := true;
  btnCancel.Visible := true;
  dm.dsetGroupLab.Open;
  dm.dsetGroupLab.Edit;
end;

procedure TfrmGroupLab.btnSaveClick(Sender: TObject);
begin

if MessageDlg('Simpan Record?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
begin
  gbInput.Enabled := false;
  btnSave.Visible := false;
  btnCancel.Visible := false;
  dm.dsetGroupLab.UpdateBatch(arAll);
end;  
end;

procedure TfrmGroupLab.btnCancelClick(Sender: TObject);
begin

if MessageDlg('Batalkan Record?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
begin
  gbInput.Enabled := false;
  btnSave.Visible := false;
  btnCancel.Visible := false;
  dm.dsetGroupLab.CancelBatch(arAll);
end;  
end;

procedure TfrmGroupLab.FormActivate(Sender: TObject);
begin
 if dm.dsetGrouplab.Active = false then dm.dsetgrouplab.Active := true;
end;

end.

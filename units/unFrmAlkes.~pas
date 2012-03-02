unit unFrmAlkes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, adodb,db,Buttons, Grids, DBGrids;

type
  TfrmAlkes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gbInput: TGroupBox;
    GroupBox2: TGroupBox;
    Kodeh: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbKode: TDBEdit;
    dbNama: TDBEdit;
    dbSatuan: TDBEdit;
    dbHarga: TDBEdit;
    gbButton: TGroupBox;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    gridViewAlkes: TDBGrid;
    Label4: TLabel;
    txtCariNama: TEdit;
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dbHargaKeyPress(Sender: TObject; var Key: Char);
    procedure txtCariNamaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlkes: TfrmAlkes;

implementation

uses unDm;

{$R *.dfm}

procedure TfrmAlkes.btnNewClick(Sender: TObject);
begin
  btnSave.Visible   := true;
  btnCancel.Visible := true;
  gbInput.Enabled := true;

  dm.dsetAlkes.Append;
  dbKode.Enabled:=true;
  dbKode.SetFocus;
end;

procedure TfrmAlkes.btnEditClick(Sender: TObject);
begin
  btnSave.Visible   := true;
  btnCancel.Visible := true;
  gbInput.Enabled := true;

  dm.dsetAlkes.Edit;
  dbNama.SetFocus;
  dbKode.Enabled:=false;

end;

procedure TfrmAlkes.btnSaveClick(Sender: TObject);
begin
 if messageDlg('Simpan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
     btnSave.Visible   := false;
  btnCancel.Visible := false;
  dbKode.Enabled:=true;

  dm.dsetAlkes.UpdateBatch(arCurrent);
  gbInput.Enabled := false;

 end;
end;

procedure TfrmAlkes.btnCancelClick(Sender: TObject);
begin
  if messageDlg('Cancel Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
  btnSave.Visible   := false;
  btnCancel.Visible := false;
  dbKode.Enabled:=true;

  dm.dsetAlkes.CancelBatch(arCurrent);
  gbInput.Enabled := false;

 end;
end;

procedure TfrmAlkes.dbHargaKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9',#8]) then
 begin
   key:=#0;
 end;
end;

procedure TfrmAlkes.txtCariNamaChange(Sender: TObject);
begin
  with dm.dsetAlkes do
  begin
   Locate('akNama',txtCariNama.Text,[lopartialkey]);
  end;
end;

procedure TfrmAlkes.FormActivate(Sender: TObject);
begin
 if dm.dsetAlkes.Active=false then dm.dsetAlkes.Active:=true;
end;

end.

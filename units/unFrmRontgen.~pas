unit unFrmRontgen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, adodb,db,Buttons, Mask, Grids, DBGrids;

type
  TfrmRontgen = class(TForm)
    Panel1: TPanel;
    panel: TPanel;
    gbInputData: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbKode: TDBEdit;
    dbHarga: TDBEdit;
    GroupBox2: TGroupBox;
    btnNew: TBitBtn;
    GroupBox3: TGroupBox;
    dbJenisPemeriksaan: TDBMemo;
    gridViewRontgen: TDBGrid;
    txtCariData: TEdit;
    Label4: TLabel;
    btnEdit: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dbHargaKeyPress(Sender: TObject; var Key: Char);
    procedure txtCariDataChange(Sender: TObject);
    procedure gridViewRontgenKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtCariDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure ViewKodeRontgen;
  public
    { Public declarations }
  end;

var
  frmRontgen: TfrmRontgen;

implementation

uses unDm, unFrmLayananRontgen;

{$R *.dfm}

procedure TfrmRontgen.ViewKodeRontgen;
begin
  { frmLayananRontgen.dbKodeRontgen.KeyValue := gridViewRontgen.Fields[0].Value;
   frmLayananRontgen.gridViewRontgen.Fields[1].Value := gridViewRontgen.Fields[0].Value;
   frmRontgen.Close;}
end;

procedure TfrmRontgen.btnNewClick(Sender: TObject);
begin
   btnSAve.Visible := true;
   btnCancel.Visible := true;
   gbInputData.Enabled := true;
   dm.dsetRontgen.Open;
   dm.dsetRontgen.Append;
   dbKode.SetFocus;
end;

procedure TfrmRontgen.btnEditClick(Sender: TObject);
begin
   btnSAve.Visible := true;
   btnCancel.Visible := true;
   gbInputData.Enabled := true;
   dm.dsetRontgen.Open;
   dm.dsetRontgen.Edit;
   dbJenisPemeriksaan.SetFocus;
end;

procedure TfrmRontgen.btnSaveClick(Sender: TObject);
begin
if MessageDlg('Simpan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
  dm.dsetRontgen.UpdateBatch(arAll);
  btnSave.Visible := false;
  btnCancel.Visible := false;
  gbINputData.Enabled := false;
end;  
end;

procedure TfrmRontgen.btnCancelClick(Sender: TObject);
begin
 if MessageDlg('Cancel Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
  dm.dsetRontgen.CancelBatch(arAll);
  btnSave.Visible := false;
  btnCancel.Visible := false;
  gbINputData.Enabled := false;
end;
end;

procedure TfrmRontgen.dbHargaKeyPress(Sender: TObject; var Key: Char);
begin
//if not (key in['0'..'9','-',#8])
 if not (Key in['0'..'9',#8]) then
 begin
   key:=#0;
 end;
end;

procedure TfrmRontgen.txtCariDataChange(Sender: TObject);
begin
 with dm.dsetRontgen do
 begin
   Locate('rnJenisPeriksa',txtCariData.Text,[loPartialKey]);
 end;
end;

procedure TfrmRontgen.gridViewRontgenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key=vk_return then
 begin
    viewKodeRontgen;
 end;
end;

procedure TfrmRontgen.txtCariDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
 begin
    viewKodeRontgen;
 end;

end;

procedure TfrmRontgen.FormActivate(Sender: TObject);
begin
 if  dm.dsetRontgen.Active = false then dm.dsetRontgen.Active:=true;
 txtCariData.SetFocus;
end;

end.

unit unFrmPerujuk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, adodb,db,Mask, DBCtrls, Grids, DBGrids;

type
  TfrmPerujuk = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gbInputData: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbKode: TDBEdit;
    dbNama: TDBEdit;
    dbKodeRS: TDBEdit;
    gbButton: TGroupBox;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    gbViewData: TGroupBox;
    gridViewPerujuk: TDBGrid;
    Label4: TLabel;
    txtCariNama: TEdit;
    procedure txtCariNamaChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure txtCariNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridViewPerujukKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPerujuk: TfrmPerujuk;

implementation

uses unDm,unUtama, unFrmPoli, unFrmRawatInap;

{$R *.dfm}

procedure TfrmPerujuk.txtCariNamaChange(Sender: TObject);
begin
 with dm.dsetPerujuk do
 begin
   Locate('duNama',txtCariNama.Text,[loPartialKey]);
 end;
end;

procedure TfrmPerujuk.btnNewClick(Sender: TObject);
begin
  btnSave.Visible := true;
  btnCancel.Visible := true;
  gbInputData.Enabled := true;
  dm.dsetPerujuk.Open;
  dm.dsetPerujuk.Append;
  dbKode.SetFocus;
end;

procedure TfrmPerujuk.btnEditClick(Sender: TObject);
begin
  btnSave.Visible := true;
  btnCancel.Visible := true;
  gbInputData.Enabled := true;
  dbNama.SetFocus;
  dm.dsetPerujuk.Open;
  dm.dsetPerujuk.Edit;
end;

procedure TfrmPerujuk.btnSaveClick(Sender: TObject);
begin
if MessageDlg('Simpan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
   btnSave.Visible := False;
   btnCancel.Visible := false;
   dm.dsetPerujuk.UpdateBatch(arAll);
   gbInputData.Enabled := false;
end;
   
end;

procedure TfrmPerujuk.btnCancelClick(Sender: TObject);
begin
 if MessageDlg('Cancel Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
   btnSave.Visible := False;
   btnCancel.Visible := false;
   dm.dsetPerujuk.CancelBatch(arAll);
   gbInputData.Enabled := false;
end;

end;

procedure TfrmPerujuk.FormActivate(Sender: TObject);
begin
 if dm.dsetPerujuk.Active = false then dm.dsetPerujuk.Active:=true;

 if (isPoli=1) or (isRawatInap=1) then
 begin
   txtCariNama.SetFocus;
   gbButton.Visible:=false;
 end else begin
          gbButton.Visible:=true;
          end;
end;

procedure TfrmPerujuk.txtCariNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
 begin
   if isPoli=1 then
   begin
     frmPoli.txtPerujuk.Text := gridViewPerujuk.Fields[0].Value;
     frmPerujuk.Close;
   end else
   if isRawatInap=1 then
   begin
     frmRawatInap.txtPerujuk.Text := gridViewPerujuk.Fields[0].Value;
     frmPerujuk.Close;
   end;

 end;
end;

procedure TfrmPerujuk.gridViewPerujukKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key=vk_return then
 begin
   if isPoli=1 then
   begin
     frmPoli.txtPerujuk.Text := gridViewPerujuk.Fields[0].Value;
     frmPerujuk.Close;
   end else
   if isRawatInap=1 then
   begin
     frmRawatInap.txtPerujuk.Text := gridViewPerujuk.Fields[0].Value;
     frmPerujuk.Close;
   end;

 end;
end;

end.

unit unfrmpolitreatment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask, DBCtrls, DB,
  ADODB;

type
  TfrmPoliTreatment = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    gbtreatment: TGroupBox;
    gridViewPasien: TDBGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbnoreg: TDBEdit;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    gridtreatment: TDBGrid;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    dbusia: TDBEdit;
    dbalamat: TDBMemo;
    talayananpolidetail: TADOTable;
    talayananpoli: TADOTable;
    dsourcelayananpolidetail: TDataSource;
    dsourcelayananpoli: TDataSource;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbkodepoli: TDBEdit;
    Label12: TLabel;
    btnclose: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure gridViewPasienDblClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure gridtreatmentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure talayananpolidetailBeforePost(DataSet: TDataSet);
    procedure btncloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPoliTreatment: TfrmPoliTreatment;

implementation

uses unDm,unUtama, unFrmService, unfrmviewservicedokter, unfrmViewAlkes,
  unViewObat, unFrmViewDokter;

{$R *.dfm}

procedure TfrmPoliTreatment.BitBtn1Click(Sender: TObject);
begin
 with dm.dsetViewPasienPoli do
 begin
    requery;
 end;
end;

procedure TfrmPoliTreatment.gridViewPasienDblClick(Sender: TObject);
begin
  btnSave.Enabled := true;
  btnCancel.Enabled := true;
  gbtreatment.Enabled := true;
  with talayananpoli do
  begin
    open;
    append;
    fields.FieldByName('lpnoreg').AsString := dbnoreg.Text;
    post;
  end;

  with talayananpolidetail do
  begin
    open;
    append;
    gridTreatment.SetFocus;
  end;
end;

procedure TfrmPoliTreatment.btnSaveClick(Sender: TObject);
begin
if messageDlg('Simpan Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
  talayananpolidetail.UpdateBatch(arAll);
  btnSave.Enabled := false;
  btnCancel.Enabled := false;
   gbtreatment.Enabled := false;
end;
end;

procedure TfrmPoliTreatment.btnCancelClick(Sender: TObject);
begin
 if messageDlg('Batalkan Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
  talayananpolidetail.CancelBatch(arAll);
  btnSave.Enabled := false;
  btnCancel.Enabled := false;
  gbtreatment.Enabled := false;  
end;
end;

procedure TfrmPoliTreatment.FormActivate(Sender: TObject);
begin
 if dm.dsetViewPasienPoli.Active = false then dm.dsetViewPasienPoli.Active := true;
 isPoliTreatment:=1;
end;

procedure TfrmPoliTreatment.FormDeactivate(Sender: TObject);
begin
 isPoliTreatment:=0;
end;

procedure TfrmPoliTreatment.gridtreatmentKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key=vk_f6 then
 begin
   frmService.ShowModal;
 end;

 if key=vk_f7 then
 begin
   isPoliTreatment:=1;
   frmViewDokter.ShowModal;
 end;

  if key=vk_f8 then
 begin
   frmViewObat.ShowModal;
 end;

 if key=vk_delete then
 begin
   if MessageDlg('Hapus Transaksi ini?',mtConfirmation,[mbYes,mbNo],0)= mrYes then
   begin
      talayananpolidetail.Delete;
   end;
 end;
end;

procedure TfrmPoliTreatment.talayananpolidetailBeforePost(
  DataSet: TDataSet);
begin
  gridTreatment.Fields[6].Value := gridTreatment.Fields[4].Value * gridTreatment.Fields[5].Value;
end;

procedure TfrmPoliTreatment.btncloseClick(Sender: TObject);
begin
 close;
end;

end.

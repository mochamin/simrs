unit unFrmViewDepartemen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ADODb,Grids, DBGrids, ExtCtrls, Mask, DBCtrls;

type
  TfrmViewDepartemen = class(TForm)
    Panel1: TPanel;
    Image2: TImage;
    Label15: TLabel;
    Panel2: TPanel;
    gridViewPoli: TDBGrid;
    gbAddDepartemen: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    txtKodeDepartemen: TEdit;
    txtNamaDepartemen: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    gbEdit: TGroupBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    btnEdit: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure gridViewPoliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure simpanDepartemen;
  procedure validasiAddDepartemen;
  procedure refreshDepartemen;
  end;

var
  frmViewDepartemen: TfrmViewDepartemen;

implementation

uses unDm, unFrmService;

{$R *.dfm}

procedure TfrmViewDepartemen.refreshDepartemen;
begin
  with dm.dSetDept do
    begin
     active := false;
     commandType := cmdText;
     commandText := 'SELECT * FROM tadepartemen '+
     'ORDER BY dpKode';
     active := true;
    end;
end;
procedure TfrmViewDepartemen.simpanDepartemen;
begin
    with dm.dSetDept do
    begin
     active := false;
     commandType := cmdText;
     commandText := 'SELECT * FROM tadepartemen '+
     'WHERE dpKode LIKE (:cariKode)';
     parameters.ParamByName('cariKode').Value := txtKodeDepartemen.Text;
     active := true;
       if isEmpty=false then
       begin
         showMessage('Kode departement sudah ada. '+#13+
         'Mohon pilih kode yang lain!');
         txtKodeDepartemen.SetFocus;
       end else
       begin
         active:=true;
         open;
         append;
         fields.FieldByName('dpKode').AsString := txtKodeDepartemen.Text;
         fields.FieldByName('dpNama').AsString := txtNamaDepartemen.Text;
         post;
         updatebatch(arAll);
         showMessage('data tersimpan...');
         txtKodeDepartemen.Clear;
         txtNamaDepartemen.Clear;
         gbAddDepartemen.Visible := false;
         refreshDepartemen;
       end;

    end;
end;

procedure TfrmViewDepartemen.validasiAddDepartemen;
begin
  if Length(txtKodeDepartemen.Text)<2 then
  begin
    showMessage('Kode Departemen terlalu pendek!');
    txtKodeDepartemen.SetFocus;
  end else if Length(txtNamaDepartemen.Text)<2 then
  begin
    showMessage('Nama Departemen kosong atau terlalu pendek!');
  end else simpanDepartemen;
end;

procedure TfrmViewDepartemen.BitBtn3Click(Sender: TObject);
begin
 gbAddDepartemen.Visible:=true;

  txtKodeDepartemen.SetFocus;
  txtKodeDepartemen.Clear;
  txtNamaDepartemen.Clear;
end;

procedure TfrmViewDepartemen.BitBtn1Click(Sender: TObject);
begin
if MessageDlg('Batalkan Penambahan Data?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
begin
  dm.dSetDept.CancelBatch(arAll);
  gbAddDepartemen.Visible:=false;
end;
end;

procedure TfrmViewDepartemen.BitBtn2Click(Sender: TObject);
begin
     validasiAddDepartemen;
end;

procedure TfrmViewDepartemen.gridViewPoliKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
{  if key=VK_RETURN then
  begin
    frmViewDepartemen.Close;
    frmService.txtKodeDept.Text := gridViewPoli.Fields[0].Value;
  end;}
end;

procedure TfrmViewDepartemen.FormActivate(Sender: TObject);
begin
  refreshDepartemen;
end;

procedure TfrmViewDepartemen.btnEditClick(Sender: TObject);
begin
 gbedit.Visible := true;
end;

procedure TfrmViewDepartemen.BitBtn5Click(Sender: TObject);
begin
  if messageDlg('Batalkan Perubahan?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    dm.dSetDept.CancelBatch(arAll);
    gbEdit.Visible := false;
  end;
end;

procedure TfrmViewDepartemen.BitBtn4Click(Sender: TObject);
begin
  if messageDlg('Simpan Perubahan?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    dm.dSetDept.UpdateBatch(arAll);
    gbEdit.Visible := false;
  end;
end;

end.

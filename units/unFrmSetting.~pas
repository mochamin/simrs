unit unFrmSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls, DB, ADODB;

type
  TfrmSetting = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    gridUser: TDBGrid;
    Panel4: TPanel;
    btnSave: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbGroup: TDBLookupComboBox;
    Label3: TLabel;
    dbUsername: TDBEdit;
    dbPassword: TDBEdit;
    Label4: TLabel;
    taUserGroup: TADOTable;
    taUsername: TADOTable;
    dsUserGroup: TDataSource;
    dsUsername: TDataSource;
    txtRetypePassword: TEdit;
    btnEdit: TButton;
    btnCreate: TButton;
    btnCancel: TButton;
    txtCariUsername: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure txtCariUsernameChange(Sender: TObject);
    procedure gridUserKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure validasiUser;
  public
    { Public declarations }
  end;

var
  frmSetting: TfrmSetting;

implementation

{$R *.dfm}
uses unUtama;

procedure TfrmSetting.validasiUser;
begin
 if Length(dbUserName.Text)=0 then
 begin
   showMessage('Nama User belum diisi!');
   dbUserName.SetFocus;
 end else
 if Length(dbGroup.Text)=0 then
 begin
   showMessage('Group Harus diisi!');
   dbGroup.SetFocus;
 end else
 if Length(dbPassword.Text)=0 then
 begin
   showMessage('Password harus diisi!');
   dbPassword.SetFocus;
 end else
 if Length(txtRetypePassword.Text)=0 then
 begin
   showMessage('Konfirmasi Password belum diisi!');
   txtRetypePassword.SetFocus;
 end else
 if (dbPassword.text <> txtRetypePassword.Text) then
 begin
   showMessage('Password dan konfirmasi tidak sama!');
   txtRetypePassword.SetFocus;
 end else
     begin
      if MessageDlg('Simpan Record?',mtConfirmation,[mbyes,mbNo],0)=mrYes then
      begin
        taUserName.UpdateBatch(arAll);
        btnSave.visible := false;
        btnCancel.visible := false;
        btnCreate.Visible := true;
        btnEdit.Visible := true;
        taUserName.Active:=false;
        taUserName.Active := true;
       end; 
      end;


end;

procedure TfrmSetting.FormActivate(Sender: TObject);
begin
 if taUserName.Active = false then tausername.Active := true;
 if tausergroup.Active = false then tausergroup.Active := true;
end;

procedure TfrmSetting.btnSaveClick(Sender: TObject);
begin
  validasiUser;
end;

procedure TfrmSetting.btnCancelClick(Sender: TObject);
begin
  taUserName.CancelBatch(arAll);
   btnSave.visible := false;
   btnCancel.visible := false;
   btnCreate.Visible := true;
   btnEdit.Visible := true;
end;

procedure TfrmSetting.btnCreateClick(Sender: TObject);
begin
   taUsername.Open;
   taUserName.Append;
   dbUsername.SetFocus;
   btnSave.visible := true;
   btnCancel.visible := true;
   btnCreate.Visible := false;
   btnEdit.Visible := false;
end;

procedure TfrmSetting.btnEditClick(Sender: TObject);
begin
  taUsername.Open;
  taUsername.Edit;
  dbusername.SetFocus;
   btnSave.visible := true;
   btnCancel.visible := true;
   btnCreate.Visible := false;
   btnEdit.Visible := false;
end;

procedure TfrmSetting.txtCariUsernameChange(Sender: TObject);
begin
 {taUserName.IndexName := 'indexUsnama';
 tauserName.Seek(txtCariuserName.Text,soFirstEQ);
 taUserName.Locate('usNama',txtCariUsername.Text);}
 with taUserName do
 begin
    Locate('usNama',txtCariUsername.Text,[loPartialKey]);
 end;
end;

procedure TfrmSetting.gridUserKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_DELETE then
  begin
    if MessageDlg('Menghapus data berarti Anda akan menghilangkan'#13+
    'hak akses dari User bersangkutan!'#13+
    'Anda Yakin akan Menghapus?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      if gridUser.Fields[0].Value=isCurrentUser then
      begin
        showMessage('User '+'"'+isCurrentUser+'"'#13+
        'Saat ini sedang aktif! Menghapus User yang sedang aktif'#13+
        'Tidak diperbolehkan!');
      end else
          begin
          taUsername.Delete;
          taUserName.UpdateBatch(arAll);
          end;
    end;
  end;
end;

procedure TfrmSetting.FormCreate(Sender: TObject);
begin
{ taUsername.Active := true;
 taUserGroup.Active := true;}
end;

end.

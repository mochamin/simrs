unit unfrmgantipassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,db,adodb;

type
  TfrmGantiPassword = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    oldPassword: TEdit;
    Label2: TLabel;
    newpassword: TEdit;
    repeatpassword: TEdit;
    Label3: TLabel;
    btnset: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure oldPasswordChange(Sender: TObject);
    procedure btnsetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGantiPassword: TfrmGantiPassword;

implementation
uses unUtama, unDm;
{$R *.dfm}

procedure TfrmGantiPassword.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 oldpassword.Clear;
 newpassword.Clear;
 repeatpassword.Clear;
 btnSet.Enabled := false;
end;

procedure TfrmGantiPassword.oldPasswordChange(Sender: TObject);
begin
 if oldPassword.Text =isCurrentPassword then
 begin
   btnset.Enabled := true;
 end else btnSet.Enabled := false;
end;

procedure TfrmGantiPassword.btnsetClick(Sender: TObject);
begin
  if dm.dsetupdatepassword.Active = false then dm.dsetupdatepassword.Active := true;
  if newpassword.Text <> repeatpassword.Text then
  begin
    showmessage('Password tidak cocok !');
    newpassword.SetFocus;
  end else
  begin
   if dm.dsetUpdatePassword.Locate('usnama',isCurrentUser,[loCaseInsensitive])=true then
   begin
     dm.dsetUpdatePassword.Active:=true;
     dm.dsetUpdatePassword.open;
     dm.dsetUpdatePassword.edit;
     dm.dsetUpdatePassword.Fields.FieldByName('usPassword').AsString := newpassword.Text;
     dm.dsetUpdatePassword.post;
     showMessage('Password telah diubah...'+#13+
     'Password Baru Aktif Setelah Anda Login Ulang...');
     oldpassword.Clear;
     newpassword.Clear;
     repeatpassword.Clear;
     isGantiPassword:=1;
     frmGantiPassword.Close;
   end;
  end;
end;

end.

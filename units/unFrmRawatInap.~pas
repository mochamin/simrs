unit unFrmRawatInap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,ADODb, StrUtils,Grids,db, DBGrids, DBCtrls, ComCtrls,
  Buttons;



type
  TfrmRawatInap = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    gridKamar: TDBGrid;
    gbViewKamar: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbKodeKamar: TDBText;
    dbKamar: TDBText;
    dbRate: TDBText;
    DBMemo1: TDBMemo;
    Panel2: TPanel;
    gbDataPasien: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dtTglMasuk: TDateTimePicker;
    txtNoReg: TEdit;
    txtNoRm: TEdit;
    txtKodeKamar: TEdit;
    nmDeposit: TEdit;
    gbikhtisar: TGroupBox;
    Label10: TLabel;
    txtPenanggungjawab: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    txtKekerabatan: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dbNamaPasien: TDBText;
    dbAlamatPasien: TDBText;
    txtViewKamar: TLabel;
    txtViewRate: TLabel;
    txtViewTipePembayaran: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    dbJmlBed: TDBText;
    Label18: TLabel;
    dbUsia: TDBText;
    btnRegistrasipasien: TBitBtn;
    Label19: TLabel;
    txtPerujuk: TEdit;
    GroupBox2: TGroupBox;
    btnCancel: TButton;
    btnSave: TButton;
    btnNew: TButton;
    procedure FormActivate(Sender: TObject);
    procedure txtNoRmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridKamarDblClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure nmDepositKeyPress(Sender: TObject; var Key: Char);
    procedure nmDepositExit(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure rgTipePembayaranClick(Sender: TObject);
    procedure gridKamarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtKodeKamarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure txtNoRmKeyPress(Sender: TObject; var Key: Char);
    procedure btnRegistrasipasienClick(Sender: TObject);
    procedure txtKodeKamarKeyPress(Sender: TObject; var Key: Char);
    procedure txtNoRegKeyPress(Sender: TObject; var Key: Char);
    procedure txtPerujukKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure validasiRawatInap;
    procedure autoNumberRawatInap;
    procedure simpanRawatInap;
    procedure clearRawatInap;
    procedure viewKamar;
   
  public
    procedure refreshRawatInap;
    procedure refreshViewKamar;

    { Public declarations }
  end;

var
  frmRawatInap: TfrmRawatInap;
  isTransaksiRawatInap : integer;
  tempRate : integer;


implementation

uses unUtama, unFrmViewPasien, unDm, unFrmAddBed, unFrmTransaksiRawatInap,
  unFrmAddPasien, unFrmPerujuk;
{$R *.dfm}

procedure TfrmRawatInap.refreshViewKamar;
begin
   with dm.dsetViewKamar do
   begin
     active := false;
     commandType := cmdText;
     commandText := 'SELECT * FROM takamar '+
     'WHERE kaBedStok <> 0';
     active:=true;
   end;
end;

procedure TfrmRawatInap.viewKamar;
begin
if isTransaksiRawatInap = 1 then
 begin
  txtViewKamar.Caption := dbKamar.Caption;
  txtViewRate.Caption := dbRate.Caption;
  txtKodeKamar.Text :=  dbKodeKamar.Caption;
  tempRate:=gridKamar.Fields[2].Value;
  txtKodeKamar.SetFocus;
 end;
end;

procedure TfrmRawatInap.clearRawatInap;
begin
  txtNoReg.Clear;
  txtNoRM.Clear;
  txtKodeKamar.Clear;
  txtPenanggungJawab.Clear;
  txtKekerabatan.Clear;
  nmDeposit.Clear;
 // rgTipePembayaran.ItemIndex :=-1;
  gbIkhtisar.Visible := false;
  txtViewTipePembayaran.Clear;
  txtPerujuk.Clear;
  //cbbersalin.ItemIndex:=-1;
end;

procedure TfrmRawatInap.simpanRawatInap;
var persenadm : integer;
begin
  with dm.dsetrptadministrasi do
  begin
    active:=false;
    commandType :=cmdText;
    commandText := 'SELECT * FROM takamar,taadministrasi '+
    'where kakode like adkelas '+
    'and kakode like (:kodekamar) ';
    parameters.ParamByName('kodekamar').Value := txtkodekamar.Text;
    active:=true;

    if isEmpty=false then
    begin
    persenadm := fields.fieldByName('adadmin').AsInteger;
    end;
    
  end;

  if MessageDlg('Simpan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
   with dm.dSetRawatInap do
   begin
      open;
      Append;
      fields.FieldByName('inNoReg').AsString := txtNoReg.Text;
      fields.FieldByName('inTglMasuk').AsDateTime := dtTglMasuk.Date;
      fields.FieldByName('inJamMasuk').AsDateTime := time();
      fields.FieldByName('inNoRM').AsString := txtNoRm.Text;
      fields.FieldByName('inKodeKamar').AsString := txtKodeKamar.Text;
      fields.FieldByName('inDeposit').AsString := nmDeposit.Text;
      fields.FieldByName('inTipePembayaran').AsString := txtViewTipePembayaran.Text;
      fields.FieldByName('inPenanggungjawab').AsString := txtPenanggungJawab.Text;
      fields.FieldByName('inKekerabatan').AsString := txtKekerabatan.Text;
      fields.FieldByName('inpersenadm').AsInteger := persenadm;

      /// cek apakah pasien bersalin atau bukan
    {  if cbbersalin.ItemIndex=1 then
      begin
       fieldByName('inisbaby').AsInteger := 1;
      end;
     }
      /////////////////////////////////////////
      post;
      frmTreatment.refreshViewRawatInap;
    end;    // end of dm.dsetRawatInap

    with dm.dSetViewKamar do
    begin
      active:=false;
      commandType := cmdText;
      commandText := 'SELECT * FROM takamar '+
      'WHERE kaKode =(:kode) '+
      'ORDER BY kaKode';
      parameters.ParamByName('kode').value := txtKodeKamar.Text;
      active:=true;


       if isEmpty=false then
       begin
         open;
         edit;
         //showMessage(fields.fieldByName('kaKode').AsString+' '+txtKodeKamar.Text);
         fields.fieldByName('kaBedStok').AsInteger := (fields.fieldByName('kaBedStok').AsInteger)-1;
         post;
         refreshViewKamar;
       end;

       btnSave.Visible := false;
       btnCancel.Visible := false;
    end;

    with dm.dsetKamarDetail do
    begin
     open;
     append;
     fields.FieldByName('kdNoReg').AsString := txtNoReg.Text;
     fields.FieldByName('kdKamar').AsString := txtKodeKamar.Text;
     fields.FieldByName('kdTglMasuk').AsDateTime := dtTglMasuk.Date;
     fields.FieldByName('kdJamMasuk').AsDateTime := time();
     fields.FieldByName('kdActive').AsInteger :=1;
     fields.FieldByName('kdtarif').AsInteger := tempRate;

     post;
    end;

    //kalo ada transfer pasien dari Poli
    if isPendingMigrasi=1 then
    begin
      with dm.dsetLayananPoli do
      begin
        if locate('lpnoreg',kodelayananpoli,[loCaseInsensitive])= true then
        begin
          open;
          edit;
          fields.FieldByName('lpistorawatinap').AsInteger := 1;
          fields.FieldByName('lpkoderawatinap').AsString := txtNoreg.Text;
          post;
        end;
      end;
    end;

     showMessage('data tersimpan....');
     refreshRawatInap;
     clearRawatInap;



   end; // end of msgDlg

end;

procedure TfrmRawatInap.validasiRawatInap;
begin
  if Length(dateToStr(dtTglMasuk.Date))=0 then
  begin
    showMessage('tanggal tidak boleh kosong');
    dtTglMasuk.SetFocus;
  end else
    if Length(txtNoRm.Text)=0 then
    begin
       showMessage('No RM masih kosong, mohon diisi!');
       txtNoRm.SetFocus;
    end else
    if length(txtKodeKamar.Text)=0 then
    begin
      showMessage('Kode Kamar tidak boleh kosong!');
      txtKodeKamar.SetFocus;
    end else
     if Length(txtPenanggungJawab.Text)=0 then
     begin
       showMessage('Penanggung jawab belum diisi!');
       txtPenanggungjawab.SetFocus;
     end else
      if length(txtKekerabatan.Text)=0 then
      begin
        showmessage('Hubungan  kerabat harus diisi');
        txtKekerabatan.SetFocus;
      end else
      if length(nmDeposit.Text)=0 then
      begin
        showMessage('deposit belum diisi');
        nmDeposit.SetFocus;
      end else
      {if rgTipePembayaran.ItemIndex=-1 then
      begin
        showMessage('Pilih salah satu tipe pembayaran!');
        rgTipePembayaran.SetFocus;
      end else                    }
          begin
          simpanRawatInap;
          gbDataPasien.Enabled := false;
          end;

end;

procedure TfrmRawatInap.refreshRawatInap;
begin
      with dm.dSetRawatInap do
      begin
       active:=false;
       commandType := cmdText;
       commandText:='SELECT * FROM tarawatinap ';
       active:=true;
      end;

end;

procedure TfrmRawatInap.autoNumberRawatInap;
var NoReg : string;
    cutNoReg : String;
    autoNum : integer;
    zeroFill : string;

begin
   with dm.dSetRawatInap do
   begin
    active:=false;
    commandType := cmdText;
    commandText := 'select * from tarawatinap '+
    'order by in_idx asc ';
    active:=true;

    
    last;
    NoReg := fields.fieldByName('inNoReg').AsString;
    cutNoReg := RightStr(NoReg,7);

    autoNum := (strToInt(cutNoReg))+1;

    case  Length(intToStr(autoNum)) of
    1 : zeroFill := '000000';
    2 : zeroFill := '00000';
    3 : zeroFill := '0000';
    4 : zeroFill := '000';
    5 : zeroFill := '00';
    6 : zeroFill := '0';
    7 : zeroFill := '';
    else
      begin
      showMessage('Penomoran Sudah sampai batas akhir...'#13+
      'Hubungi "CahayaPitu" di 081310604697 atau '#13+
      'email: mochamadamin76@yahoo.com '#13+
      'sementara software tidak bisa dipergunakan'#13+
      'Terimakasih.');
      frmRawatInap.Close;
      end;
    end;

   txtNoReg.Text := 'IN-'+zeroFill+intToStr(autoNum);
   end;
end;

procedure TfrmRawatInap.FormActivate(Sender: TObject);
begin
 if dm.dsetViewKamar.Active = false then dm.dsetViewKamar.Active := true;
 dtTglMasuk.Date := Date();
 isRawatInap := 1;
 isPoli := 0;
end;

procedure TfrmRawatInap.txtNoRmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_RETURN then
 begin
   frmViewPasien.ShowModal;
 end;
end;

procedure TfrmRawatInap.gridKamarDblClick(Sender: TObject);
begin
 viewKamar;
end;

procedure TfrmRawatInap.btnNewClick(Sender: TObject);
begin
  
  gbDataPasien.Enabled := true;
  autoNumberRawatInap;
  btnSave.Visible := true;
  btnCancel.Visible := true;
  isTransaksiRawatInap := 1;
  gbikhtisar.Visible := true;
  txtNoRm.SetFocus;
end;

procedure TfrmRawatInap.btnCancelClick(Sender: TObject);
begin
if MessageDlg('Cancel akan membatalkan data yang sudah diinput di layar!'#13+
'Anda Yakin?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
 btnNew.Visible := true;
 btnCancel.Visible := false;
 btnSave.Visible := false;
 isTransaksiRawatInap :=0;
 clearRawatInap;
 gbIkhtisar.Visible := false;
 gbDataPasien.Enabled := false;
end;
end;
procedure TfrmRawatInap.nmDepositKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9',#8]) then
 begin
   key :=#0;
 end;
end;

procedure TfrmRawatInap.nmDepositExit(Sender: TObject);
begin
if (isTransaksiRawatInap=1) and (Length(txtViewRate.Caption)<>0) and (Length(nmDeposit.Text)<>0)then
begin
  if (strToInt(nmDeposit.Text)) < ((strToInt(txtViewRate.Caption))*10) then
  begin
     showMessage('Deposit kurang...!'#13+
     'Deposit Minimal adalah 10x dari Rate Kamar yang dipilih.'#13+
     'Untuk kamar  : '+(txtViewKamar.Caption)+#13+
     'Harga Kamar  : '+(txtViewRate.Caption)+#13+
     'Min. Deposit : Rp '+intToStr(strToInt(txtViewRate.Caption)*10));
     nmDeposit.SetFocus;
  end;
end;  
end;

procedure TfrmRawatInap.btnSaveClick(Sender: TObject);
begin

 validasiRawatInap;
 //frmBillingRawatInap.refreshRptRawatInap;
 
end;

procedure TfrmRawatInap.rgTipePembayaranClick(Sender: TObject);
begin
 {case rgTipePembayaran.ItemIndex of
 0 : txtviewTipePembayaran.Text := 'Asuransi';
 1 : txtViewTipePembayaran.Text := 'Instansi';
 2 : txtViewTipePembayaran.Text := 'Cash';
 end;}
end;

procedure TfrmRawatInap.gridKamarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   VK_RETURN : viewKamar;
  end;
end;

procedure TfrmRawatInap.txtKodeKamarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
  VK_RETURN : begin
           if gridKamar.Focused=false then
           begin
             gridKamar.SetFocus;
           end;
          end;
 end;
end;

procedure TfrmRawatInap.Button1Click(Sender: TObject);
begin
     with dm.dSetViewKamar do
    begin
      active:=false;
      commandType := cmdText;
      commandText := 'SELECT * FROM takamar '+
      'WHERE kaKode =(:kode) '+
      'ORDER BY kaKode';
      parameters.ParamByName('kode').value := txtKodeKamar.Text;
      active:=true;


       if isEmpty=false then
       begin
         open;
         edit;
         showMessage(fields.fieldByName('kaKode').AsString);
         fields.fieldByName('kaBedStok').AsInteger := (fields.fieldByName('kaBedStok').AsInteger)-1;
         post;
         requery;
       end;

       btnSave.Visible := false;
       btnCancel.Visible := false;
    end;
end;

procedure TfrmRawatInap.Button2Click(Sender: TObject);
begin
 isTransaksiRawatInap := 1
end;

procedure TfrmRawatInap.txtNoRmKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in[#8]) then
 begin
  key:=#0;
 end;
end;

procedure TfrmRawatInap.btnRegistrasipasienClick(Sender: TObject);
begin
  frmAddPasien.Show;
end;

procedure TfrmRawatInap.txtKodeKamarKeyPress(Sender: TObject;
  var Key: Char);
begin
 key:=#0;
end;

procedure TfrmRawatInap.txtNoRegKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmRawatInap.txtPerujukKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
    frmPerujuk.ShowModal;
  end;
end;

procedure TfrmRawatInap.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

end.

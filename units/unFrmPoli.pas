unit unFrmPoli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Qt,Buttons,strUtils, ComCtrls, ADODb,ExtCtrls, DBCtrls,
  RpCon, RpConDS, RpDefine, RpRave, DB;

type
  TfrmPoli = class(TForm)
    Panel1: TPanel;
    Label15: TLabel;
    Image2: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    lblClear: TLabel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    Image1: TImage;
    gbDetailPasien: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label14: TLabel;
    Bevel5: TBevel;
    dbtxtnoRm: TDBText;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    btnNew: TBitBtn;
    gbDataPasien: TGroupBox;
    Label12: TLabel;
    dtTgl: TDateTimePicker;
    Label1: TLabel;
    txtNoReg: TEdit;
    Label18: TLabel;
    dbLookUpPoli: TDBLookupComboBox;
    Label2: TLabel;
    txtNoRm: TEdit;
    BitBtn3: TBitBtn;
    Label6: TLabel;
    txtKodeDokter: TEdit;
    gbDokter: TGroupBox;
    DBText5: TDBText;
    Label5: TLabel;
    txtPerujuk: TEdit;
    btnclose: TBitBtn;
    dsetsumregpoli: TADODataSet;
    RvProjectStatus: TRvProject;
    rvsumregpoli: TRvDataSetConnection;
    dsetsumpasien: TADODataSet;
    rvsumpasien: TRvDataSetConnection;
    dsetsumdokter: TADODataSet;
    rvsumdokter: TRvDataSetConnection;
    tarif: TEdit;
    procedure txtNoRmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtNoRmChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txtKodeDokterChange(Sender: TObject);
    procedure txtKodeDokterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure txtNoRmKeyPress(Sender: TObject; var Key: Char);
    procedure txtKodeDokterKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure txtPerujukKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncloseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncloseClick(Sender: TObject);
  private
    { Private declarations }
    procedure autoNumberPoli;
  public
    { Public declarations }
    procedure simpanLayananPoli;
    procedure validasiLayananPoli;
    procedure clearLayananPoli;
  end;

var
  frmPoli: TfrmPoli;

implementation

uses unFrmViewPasien,unUtama, unFrmViewDokter, unDm, unFrmApotik,
  unFrmAddPasien, unFrmPerujuk;

{$R *.dfm}


procedure TfrmPoli.autoNumberPoli;
var tempKodePoli : string;
    cutKodePoli : string;
    intKodePoli : integer;
    zeroFill : string;
begin

      with dm.dsetLayananPoli do
      begin
        active:=false;
        commandType := cmdText;
        commandText := 'select * from talayananpoli '+
        'order by lpnoreg asc';
        active:=true;
        last;
        tempKodePoli := fields.fieldByName('lpNoReg').AsString;
        cutKodePoli := RightStr(tempKodePoli,7);
        intKodePoli := strToInt(cutKodePoli)+1;
      end;

      case Length(intToStr(intKodePoli)) of
      1 : zeroFill := '000000';
      2 : zeroFill := '00000';
      3 : zeroFill := '0000';
      4 : zeroFill := '000';
      5 : zeroFill := '00';
      6 : zeroFill := '0';
      7 : zeroFill := '';
      end;

      txtNoReg.Text := 'PL-'+ZeroFill+intToStr(intKodePoli); // generate the autonumber

end;

procedure TfrmPoli.clearLayananPoli;
begin
 // dblookUpPoli.CleanupInstance;
  txtNoReg.Clear;
  txtNoRm.Clear;
  txtKodeDokter.Clear;
  dtTgl.SetFocus;
  gbDetailPasien.Visible:=false;
  btnclose.Visible := true;
end;

procedure TfrmPoli.simpanLayananPoli;
var tempKodePoli : string;
begin
  {  //cari Kode Poli berdasarkan lookup di lookup Poli
    with dm.dSetPoli do
    begin
      active:=false;
      commandType := cmdText;
      commandText := 'SELECT * FROM tapoli '+
      'WHERE poNama LIKE (:cariNama)';
      parameters.ParamByName('cariNama').value := '%'+dbLookupPoli.Text+'%';
      active:=true;

       tempKodePoli := fields.fieldByName('poKode').Value;
       //showMessage(tempKodePoli);
    end;
   }
     with dm.dSetLayanan do
     begin
      active:=false;
      commandType := cmdText;
      commandText := 'SELECT * FROM talayananpoli';
      active:=true;
      open;
      append;
         if Length(txtKodeDokter.Text)=0 then
          begin
             //showMessage('Kode Dokter belum diisi!');
             txtKodeDokter.Text:='-';
          end; 
      fields.FieldByName('lpTgl').AsDateTime := dtTgl.Date;
      fields.FieldByName('lpNoReg').AsString := txtNoReg.Text;
      fields.FieldByName('lpKodeDokter').AsString := txtKodeDokter.Text;
      fields.FieldByName('lpKodePasien').AsString := txtNoRm.Text;
      fields.FieldByName('lpKodePoli').AsString := dblookupPoli.KeyValue;
      fields.FieldByName('lpWktDaftar').AsDateTime := time();
      fields.FieldByName('lpTglWktu').AsDateTime := now();
      fields.FieldByName('lpKodeRujuk').asstring := txtPeRujuk.Text;
      fields.FieldByName('lpkonsuldokter').AsFloat := strToFloat(tarif.Text);
       // Generate autoNumber
      post;
      clearLayananPoli;
      
      showMessage('data telah tersimpan...');
      btnSave.Visible := false;
      btnCancel.Visible := false;
     end;
end;


procedure TfrmPoli.validasiLayananPoli;
begin
   if Length(dbLookUpPoli.Text)=0 then
   begin
      showMessage('Poli Belum dipilih!');
      dblookupPoli.SetFocus;
   end else
       if Length(txtNoRm.Text)=0 then
       begin
         showMessage('No. Rekam Medik (RM) Blm diisi!');
         txtNoRm.SetFocus;
       end else

          begin
          simpanLayananPoli;
          gbDataPasien.Enabled := false;
          end;
end;

procedure TfrmPoli.txtNoRmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_RETURN then
  begin
     isPoli := 1;
     frmViewPasien.ShowModal;
  end;
end;

procedure TfrmPoli.txtNoRmChange(Sender: TObject);
begin




 if length(txtNoRm.Text)<>0 then
 begin
    gbDetailPasien.visible := true;
 end else gbDetailPasien.Visible := false;
end;

procedure TfrmPoli.FormCreate(Sender: TObject);
var today : TDate;
begin
    today:=date();
    dtTgl.Date:=today;
end;

procedure TfrmPoli.txtKodeDokterChange(Sender: TObject);
begin
  if Length(txtKodeDokter.Text) >5 then
  begin
     gbDokter.Visible := true;
  end else gbDokter.Visible := false;
end;

procedure TfrmPoli.txtKodeDokterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
  VK_RETURN : frmViewDokter.ShowModal;
  end;
end;

procedure TfrmPoli.FormActivate(Sender: TObject);
begin
 if dm.dsetLayananPoli.Active=false then dm.dsetLayananPoli.active:=true;
 if dm.dSetDept.Active=false then dm.dSetDept.Active:=true; 

  isPoli :=1;
  isRawatInap := 0;
  
end;

procedure TfrmPoli.btnCancelClick(Sender: TObject);
begin
if MessageDlg('Batalkan Transaksi?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
begin
 txtNoReg.Clear;
 
 gbDataPasien.Enabled := false;
 btnSave.Visible := false;
 btnCancel.Visible := false;
 btnclose.Visible:= true;
end;
end;

procedure TfrmPoli.txtNoRmKeyPress(Sender: TObject; var Key: Char);
begin
 if (key in['a'..'z','0'..'9',#13]) then
  begin
    key:=#0;
  end;
end;

procedure TfrmPoli.txtKodeDokterKeyPress(Sender: TObject; var Key: Char);
begin
  if (key in['a'..'z','0'..'9',#13]) then
  begin
    key:=#0;
  end;
end;

procedure TfrmPoli.btnSaveClick(Sender: TObject);
begin
  validasiLayananPoli;
end;

procedure TfrmPoli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 isPoli := 0;
end;

procedure TfrmPoli.BitBtn3Click(Sender: TObject);
begin
 frmAddPasien.Show;
 frmAddPasien.btnNew.Click;
end;

procedure TfrmPoli.btnNewClick(Sender: TObject);
begin
 gbDataPasien.Enabled := true;
 clearLayananPoli;
 autoNumberPoli;
 dbLookUpPoli.SetFocus;
 btnCancel.Visible := true;
 btnclose.Visible := false;
 btnSave.Visible := true;
 txtPerujuk.Text := '..';
end;

procedure TfrmPoli.txtPerujukKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
    frmPerujuk.ShowModal;
  end;
end;

procedure TfrmPoli.btncloseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
close;
end;

procedure TfrmPoli.btncloseClick(Sender: TObject);
begin
close;
end;

end.

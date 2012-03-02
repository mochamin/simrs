unit unFrmService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,db, adodb,ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls;

type
  TfrmService = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gridServices: TDBGrid;
    Panel3: TPanel;
    gbInputService: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    txtKodeService: TDBEdit;
    txtNamaService: TDBEdit;
    nmRate: TDBEdit;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    txtCari: TEdit;
    BitBtn3: TBitBtn;
    gbButton: TGroupBox;
    btnAdd: TBitBtn;
    Label8: TLabel;
    gbDetailLayanan: TGroupBox;
    DBMemo1: TDBMemo;
    Label9: TLabel;
    Label3: TLabel;
    cbgroup: TDBComboBox;
    procedure nmRateKeyPress(Sender: TObject; var Key: Char);
    procedure txtKodeDeptKeyPress(Sender: TObject; var Key: Char);
    procedure txtKodeDokterKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure txtKodeDeptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtKodeDokterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridServicesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridServicesDblClick(Sender: TObject);
    procedure txtCariChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure txtCariKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtKelasKeyPress(Sender: TObject; var Key: Char);
    procedure txtKelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure validasiService;
    procedure simpanService;
    procedure clearService;
    procedure isiToPoliTreatment;
    procedure viewServiceByClass;
    procedure queryKonsulDokter;
    procedure refreshService;
    procedure nonKonsul;

  public
    { Public declarations }
    procedure cekAdministrasi;
  end;

var
  frmService: TfrmService;
  tempHolderRate,tempMove : integer;
    tempKelas : string;
    tempMoveKelas : string;
    tempGeneral,tempTindakan : integer;
    tempObat,tempRontgen,tempLab,tempAlkes,tempAdmin : integer;

implementation

{$R *.dfm}
uses unUtama, unFrmViewDepartemen, unFrmViewDokter, unDm,
 unFrmViewBed,unFrmTransaksiRAwatInap, unfrmpolitreatment;


procedure TFrmService.nonKonsul;
begin
  with dm.dSetServices do
  begin
   active:=false;
   commandType:=cmdText;
   commandText := 'select * from taservices '+
   'where svgroup = "General Service" ';
   active:=true;
  end;
end;

procedure TfrmService.queryKonsulDokter;
begin
  with dm.dSetServices do
  begin
   active:=false;
   commandType:=cmdText;
   commandText := 'select * from taservices '+
   'where svgroup like "Konsul" '+
   'or svgroup like "Tindakan" '+
   'or svgroup like "Visite" ';
   active:=true;
  end;
end;

procedure TfrmService.refreshService;
begin
  with dm.dSetServices do
  begin
   active:=false;
   commandType:=cmdText;
   commandText := 'select * from taservices ';
   active:=true;
  end;

end;

procedure TfrmService.isiToPoliTreatment;
begin
   frmPoliTreatment.gridtreatment.Fields[0].Value := date();
   frmPoliTreatment.gridtreatment.Fields[1].Value := time();
  frmPoliTreatment.gridtreatment.Fields[2].Value := gridServices.Fields[0].Value;
  frmPoliTreatment.gridtreatment.Fields[3].Value := gridServices.Fields[1].Value;
  frmPoliTreatment.gridtreatment.Fields[4].Value := gridServices.Fields[2].Value;
  frmPoliTreatment.gridtreatment.Fields[5].Value :=1;
  frmService.Close;
end;


procedure TfrmService.cekAdministrasi;
begin
with dm.dsetViewKamarDetail do
  begin
    active:=false;
    commandType := cmdText;
    commandText := 'SELECT * FROM takamardetail,takamar '+
    'WHERE kdKamar like kaKode '+
    'AND kdactive=1 '+
    'AND kdNoReg LIKE (:noreg) ';
    parameters.ParamByName('noReg').Value := frmTreatment.txtViewReg.Caption;
    active:=true;

    tempKelas := fields.fieldByName('kdkamar').AsString;
  
  end;

 with dm.dsetAdministrasi do
 begin
    active := false;
    commandType := cmdText;
    commandText := 'SELECT * FROM taadministrasi '+
    'where adkelas like (:kelas) ';
    parameters.ParamByName('kelas').Value := tempKelas;
    active:=true;
    showMessage('Kelas Aktif Admin : '+tempKelas);
    tempGeneral := fields.fieldByName('adGeneral').AsInteger;
    tempTindakan := fields.fieldbyName('adTindakan').AsInteger;
    tempObat := fields.fieldByName('adobat').AsInteger;
    tempLab :=fields.fieldByName('adlab').AsInteger;
    tempRontgen := fields.fieldByName('adrontgen').AsInteger;
    tempAlkes := fields.fieldByName('adalkes').AsInteger;
    tempadmin := fields.fieldByname('adadmin').AsInteger;
 end;
end;


procedure TfrmService.viewServiceByClass;
begin
  with dm.dSetServices do
  begin
    active := false;
    commandType := cmdText;
    commandText := 'SELECT * from taservices '+
    'WHERE svKelas LIKE (:kelas) ';
    parameters.ParamByName('kelas').Value := frmTreatment.txtViewKodeKamar.Caption;
    active:=true;
  end;
end;

procedure TfrmService.clearService;
begin
 txtKodeService.Clear;
 txtnamaService.Clear;

 //txtKodeDokter.Clear;
 nmRate.Clear;
end;

procedure TfrmService.simpanService;
begin
 if MessageDlg('Simpan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
  with dm.dSetServices do
  begin
    //fields.FieldByName('svRate').AsCurrency;
    updateBatch(arAll);

    showMessage('data disimpan...');
    gbInputService.Visible := false;
    {clearService;}
  end;
 end;
end;

procedure TfrmService.validasiService;
begin
  if Length(txtKodeService.Text)=0 then
  begin
    showmessage('Kode Service Harap diisi!');
    txtKodeService.SetFocus;
  end else
  if Length(txtNamaService.Text)=0 then
  begin
    showMessage('nama Service harap diisi!');
    txtNamaService.SetFocus;
  end else
  {if Length(txtKelas.Text)=0 then
  begin
    showMessage('Kode kelas harus diisi!');;
    txtkelas.SetFocus;
  end else}
  if Length(nmRate.Text)=0 then
  begin
    showmessage('Rate harus diisi!');
    nmRate.SetFocus;
  end else simpanService;


end;

procedure TfrmService.nmRateKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9',#8]) then
 begin
   key:=#0;
 end;
   
end;

procedure TfrmService.txtKodeDeptKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

procedure TfrmService.txtKodeDokterKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := #0;
end;

procedure TfrmService.BitBtn2Click(Sender: TObject);
begin
 gbInputService.Visible := false;
 dm.dSetServices.CancelBatch(arAll);
end;

procedure TfrmService.BitBtn1Click(Sender: TObject);
begin

 validasiService;

end;

procedure TfrmService.btnAddClick(Sender: TObject);
begin
  gbInputService.Show;
  txtKodeService.SetFocus;
  dm.dSetServices.Open;
  dm.dSetServices.Append;
end;

procedure TfrmService.FormActivate(Sender: TObject);
begin
 isService :=1;

 if ((isPoliTreatment=1)or (isTreatment=1)) and (isKonsul<>1) then
 begin
   gbButton.Visible := false;
   nonKonsul;
   end else if (isTreatment=1) and (isKonsul=1) then
   begin
     querykonsuldokter;
   end else if (isTreatment=1) and (isKonsul<>1) then
   begin
     nonKonsul;
   end
   else if isKonsul=1 then
    begin
     queryKonsulDokter;
    end
 else
  begin
  gbButton.Visible := true;
  refreshService;
  end;
end;

procedure TfrmService.txtKodeDeptKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=VK_RETURN then
 begin
  frmViewDepartemen.ShowModal;
 end;
end;

procedure TfrmService.txtKodeDokterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_RETURN then
 begin
   frmViewDokter.ShowModal;
 end;
end;

procedure TfrmService.gridServicesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin

 if (key=vk_return) and (ispolitreatment=1) then
 begin
   isiToPoliTreatment;
 end;

 if (isTreatment=1) and (key=VK_RETURN) then
 begin
   cekAdministrasi; // sesuaikan kelas dengan tarif
   frmTreatment.gridTreatment.Fields[0].Value := date();
   frmTreatment.gridTreatment.Fields[1].Value := time();
   frmTreatment.gridTreatment.Fields[2].Value := gridServices.Fields[0].Value;
   frmTreatment.gridTreatment.Fields[3].Value := gridServices.Fields[1].Value;
   frmTreatment.gridTreatment.Fields[4].Value := (gridServices.Fields[2].Value)+((gridServices.Fields[2].Value)*tempGeneral/100);    //service rate
   frmTreatment.gridTreatment.Fields[5].Value := 1;
   frmTreatment.gridTreatment.Fields[8].Value := gridservices.Fields[3].Value; //group
   
   frmService.Close;
 end else
 if (isTreatment<>1) and (key=VK_F2) then
 begin
   gbInputService.Visible := true;
 end;

 if key=VK_F3 then
 begin
   if gbDetailLayanan.Visible = true then
   begin
       gbDetailLayanan.Visible := false;
   end else gbDetailLayanan.Visible := true;
 end;

 if (key=vk_delete) and (isTreatment<>1) then
 begin
  if MessageDlg('Hapus Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
   dm.dSetServices.Delete;
   dm.dSetServices.UpdateBatch(arAll);
  end; 
 end;

  if key=vk_escape then
 begin
   frmService.Close;
 end;
end;

procedure TfrmService.gridServicesDblClick(Sender: TObject);
begin


if isTreatment<>1 then
begin
  dm.dSetServices.Edit;
  gbInputService.Visible := true;
end;

end;

procedure TfrmService.txtCariChange(Sender: TObject);
begin
  with dm.dSetServices do
  begin
   Locate('svnama',txtcari.Text,[loPartialKey]);
    {active:=false;
    commandType := cmdText;
    commandText := 'SELECT * FROM taservices '+
    'WHERE svNama LIKE (:nama) '+
    'ORDER BY svNama Asc ';
    parameters.ParamByName('nama').Value := '%'+txtCari.Text+'%';
    active :=true;}
  end;
end;

procedure TfrmService.BitBtn3Click(Sender: TObject);
begin
txtCari.Clear;
end;

procedure TfrmService.txtCariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if (key=vk_return) and (ispolitreatment=1) then
 begin
   isiToPoliTreatment;
 end;

  if key=VK_F3 then
 begin
   if gbDetailLayanan.Visible = true then
   begin
       gbDetailLayanan.Visible := false;
   end else gbDetailLayanan.Visible := true;
 end;

 if key=vk_escape then
 begin
   frmService.Close;
 end;

end;

procedure TfrmService.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=VK_F3 then
 begin
   if gbDetailLayanan.Visible = true then
   begin
       gbDetailLayanan.Visible := false;
   end else gbDetailLayanan.Visible := true;
 end;
end;

procedure TfrmService.txtKelasKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmService.txtKelasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
    frmViewBed.ShowModal;
  end;
end;

procedure TfrmService.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 isKonsul:=0;
end;

end.

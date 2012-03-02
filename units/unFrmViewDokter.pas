unit unFrmViewDokter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Grids, DBGrids, db,Buttons,ADODb,
  jpeg;

type
  TfrmViewDokter = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    gridViewDokter: TDBGrid;
    txtCariNama: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Image2: TImage;
    Label15: TLabel;
    gbShortCut: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtCariNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridViewDokterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure txtCariNamaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function cekTarifDokter(kodedokter : string):double;
    procedure isiDokterToTreatment;
    procedure isiToPoliTreatment;
    procedure isiTindakanDokter;
  public
    { Public declarations }
    procedure cariDokter;
    procedure refreshDokter;
    procedure hapusDokter;
    procedure isiFormPoli;

  end;

var
  frmViewDokter: TfrmViewDokter;

implementation

uses unFrmAddDokter, unFrmEditDokter, unDm, unUtama,
  unFrmPoli, unFrmService, unFrmLab, unFrmLayananRontgen,
  unFrmTransaksiRawatInap, unfrmpolitreatment,unFungsi, unFrmRegLab;

{$R *.dfm}

procedure TfrmViewDokter.isiTindakanDokter;
var tarifdokter : double;
    markup : integer;
    kamar : string;
begin
   kamar := frmTreatment.txtViewKodeKamar.Caption;
   markUp:=frmUtama.cekMarkUp(kamar);
   showMessage('MarkUp : '+intToStr(markUp));
   frmTreatment.gridTreatment.Fields[0].Value := date();
   frmTreatment.gridTreatment.Fields[1].Value := time();
   frmTreatment.gridTreatment.Fields[2].Value := gridViewDokter.Fields[0].Value;

   if isTindakanSederhana=1 then
   begin
     showMessage('isTindakanSederhana =1 ');
     TarifDokter := isiTarifDokter(gridViewDokter.Fields[0].Value,'TINDAKAN SEDERHANA',time());
   end else
   if isTindakanSedang=1 then
   begin
     showMessage('isTindakanSedang =1 ');
     TarifDokter := isiTarifDokter(gridViewDokter.Fields[0].Value,'TINDAKAN SEDANG',time());
   end else
   if isTindakanBesar=1 then
   begin
     showMessage('isTindakanBesar =1 ');
     TarifDokter := isiTarifDokter(gridViewDokter.Fields[0].Value,'TINDAKAN BESAR',time());
   end else
   if isTindakanKhusus=1 then
   begin
     showMessage('isTindakanKhusus =1 ');
     TarifDokter := isiTarifDokter(gridViewDokter.Fields[0].Value,'TINDAKAN KHUSUS',time());
   end;

   TarifDokter := tarifdokter+(tarifdokter*markup/100);
   showMessage('Tarif Dokter : '+FloatToStr(tarifdokter));
   frmTreatment.gridTreatment.Fields[3].Value := gridViewDokter.Fields[1].Value;
   frmTreatment.gridTreatment.Fields[4].Value := tarifDokter;
   frmTreatment.gridTreatment.Fields[5].Value := 1;
   frmTreatment.gridTreatment.Fields[7].Value := 2;

  if (isOk=1) then
  begin
   frmTreatment.gridTreatment.Fields[9].Value := 'OK';
  end else
  if (isVK=1) then
  begin
  frmTreatment.gridTreatment.Fields[9].Value := 'VK';
  end;
   close;
end;

procedure TfrmViewDokter.isiToPoliTreatment;
var tarifdokter : double;
begin
   frmPoliTreatment.gridtreatment.Fields[0].Value:= date();
   frmPoliTreatment.gridtreatment.Fields[1].Value := time();
   frmPoliTreatment.gridtreatment.Fields[2].Value := gridViewDokter.Fields[0].Value;
   tarifDokter := isiTarifDokter(gridViewDokter.Fields[0].Value,'TINDAKAN SEDERHANA',time());
   frmPoliTreatment.gridtreatment.Fields[3].Value := gridViewDokter.Fields[1].Value;
   frmPoliTreatment.gridtreatment.Fields[4].Value := tarifDokter;
   frmPoliTreatment.gridtreatment.Fields[5].Value := 1;
   frmPoliTreatment.gridtreatment.Fields[7].Value := 2;
   close;
end;

procedure TfrmViewDokter.isiDokterToTreatment;
var tarifdokter : double;
    markup : integer;
    kamar : string;
begin
   kamar := frmTreatment.txtViewKodeKamar.Caption;
   markUp:=frmUtama.cekMarkUp(kamar);
   showMessage('MarkUp : '+intToStr(markUp));
   frmTreatment.gridTreatment.Fields[0].Value := date();
   frmTreatment.gridTreatment.Fields[1].Value := time();
   frmTreatment.gridTreatment.Fields[2].Value := gridViewDokter.Fields[0].Value;
   TarifDokter := isiTarifDokter(gridViewDokter.Fields[0].Value,'konsul/visite',time());
   TarifDokter := tarifdokter+(tarifdokter*markup/100);
   showMessage('Tarif Dokter : '+FloatToStr(tarifdokter));
   frmTreatment.gridTreatment.Fields[3].Value := gridViewDokter.Fields[1].Value;
   frmTreatment.gridTreatment.Fields[4].Value := tarifDokter;
   frmTreatment.gridTreatment.Fields[5].Value := 1;
   frmTreatment.gridTreatment.Fields[7].Value := 2;
   //frmTreatment.gridTreatment.Fields[6].Value :=
   close;
end;

function TfrmViewDokter.cekTarifDokter(kodedokter : string):double;
var tarifdokter : double;
begin
  with dm.dsetTarifDokter do
  begin
    active:=false;
    commandType := cmdText;
    commandText := 'select * from tatarifdokter '+
    'where tdkodedokter like (:kode) ';
    parameters.ParamByName('kode').Value := kodedokter;
    active:=true;

    if isempty=false then
    begin
     tarifdokter := fieldByName('tdTarif').AsInteger;
     result := tarifdokter;
    end else result :=0;
  end;
end;

procedure TfrmViewDokter.isiFormPOli;
begin
  if isPoli=1 then
  begin
   frmPoli.txtKodeDokter.Text := gridViewDokter.Fields[0].Value;
   frmpoli.tarif.Text := floatToStr(isiTarifDokter(gridViewDokter.Fields[0].AsString,'KONSUL/VISITE',time()));
   frmViewDokter.Close;
  end;
end;

procedure TfrmViewDokter.hapusDokter;
begin
 if MessageDlg('Hapus Data ini?',
 mtInformation,[mbYes,mbNo],0)=mrYes then
 begin
  with dm.dsetDokter do
  begin
    open;
    delete;
    refreshDokter;
  end;
end;
end;

procedure TfrmViewDokter.refreshDokter;
begin
  with dm.dsetDokter do
  begin
   active := false;
   commandType := cmdText;
   commandText := 'SELECT * FROM tadokter '+
   'ORDER BY dkKodeDokter asc';
   active := true;
 end;  
end;

procedure TfrmViewDokter.cariDokter;
begin

   
  with dm.dsetDokter do
  begin
    active :=false;
    commandType := cmdText;
    commandText := 'SELECT * FROM tadokter '+
    'WHERE dkNama LIKE (:cariNama) '+
    'ORDER BY dkNama asc';
    Parameters.ParamByName('cariNama').Value := '%'+txtCariNama.Text+'%';
    active:=true;
  end;

end;

procedure TfrmViewDokter.BitBtn1Click(Sender: TObject);
begin
  txtCariNama.Clear;
  txtCariNama.SetFocus;
  refreshdokter;
end;

procedure TfrmViewDokter.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if isPoli <> 1 then
begin
   case key of
    VK_F2 : frmEditDokter.ShowModal;
    VK_F3 : txtCariNama.SetFocus;
    VK_F5 : frmAddDokter.ShowModal;
    VK_F6 : frmViewDokter.refreshDokter;
    VK_DELETE : hapusDokter;
    VK_ESCAPE : frmViewDokter.Close;
    end;
end else
    begin
      case key of
      VK_RETURN : isiFormPoli;
      end;
     end;
end;

procedure TfrmViewDokter.txtCariNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_return) and (isRegLabPoli=1) then
begin
   frmReglab.dbdokter.Text := gridviewdokter.Fields[1].Value;
   close;
end;


if (key=vk_return) and (isPoliTreatment=1) then
begin
   isiToPoliTreatment;
end;

if (key=vk_return) and (isTindakanSederhana=1) then
begin
   showMessage('Masuk tindakan sederhana');
   isiTindakanDokter;
end;

if (key=vk_return) and (isTindakanSedang=1) then
begin
      showMessage('Masuk tindakan sedang');
   isiTindakanDokter;
end;

if (key=vk_return) and (isTindakanBesar=1) then
begin
      showMessage('Masuk tindakan besar');
   isiTindakanDokter;
end;

if (key=vk_return) and (isTindakanKhusus=1) then
begin
      showMessage('Masuk tindakan khusus');
   isiTindakanDokter;
end;


if (key=vk_return) and (isKonsul=1) then
begin
   isiDokterToTreatment;
end;

if (key=VK_Return) and  (isIsiLab = 1) then
begin
  frmLab.dbKodeDokter.Text := gridViewDokter.Fields[0].Value;
  frmViewDokter.Close;
end;

case key of
vk_down : dm.dsetdokter.Next;
vk_up   : dm.dsetdokter.Prior;
end;

{if (isLayananRontgen=1) and(key=VK_RETURN) then
begin
  frmLayananRontgen.dbKodeDokter.KeyValue := gridViewDokter.Fields[0].Value;
       frmLayananRontgen.gridViewRontgen.Fields[5].Value := gridViewDokter.Fields[0].Value;
   //frmLayananRontgen.dbViewChecker.Caption := gridViewDokter.Fields[1].Value;
   frmViewDokter.Close;
end;}

if isPoli <> 1 then
begin
   case key of
    VK_F2 : frmEditDokter.ShowModal;
    VK_F3 : txtCariNama.SetFocus;
    VK_F5 : frmAddDokter.ShowModal;
    VK_F6 : frmViewDokter.refreshDokter;
    VK_DELETE : hapusDokter;
    VK_ESCAPE : frmViewDokter.Close;
    end;
end else
    begin
      case key of
      VK_RETURN : isiFormPoli;
      end;
     end;
end;

procedure TfrmViewDokter.gridViewDokterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

if (key=vk_return) and (isRegLabPoli=1) then
begin
   frmReglab.dbdokter.Text := gridviewdokter.Fields[1].Value;
   close;
end;

if (key=vk_return) and (isTindakanSederhana=1) then
begin
   isiTindakanDokter;
end;

if (key=vk_return) and (isTindakanSedang=1) then
begin
   isiTindakanDokter;
end;

if (key=vk_return) and (isTindakanBesar=1) then
begin
   isiTindakanDokter;
end;

if (key=vk_return) and (isTindakanKhusus=1) then
begin
   isiTindakanDokter;
end;

 if (key=vk_return) and (isKonsul=1) then
 begin
   showMessage('masuk treatment!');
   isiDokterToTreatment;
 end;
  
if (isService=1) and (key=VK_RETURN) then
begin
 // frmService.txtKodeDokter.Text := gridViewDokter.Fields[0].Value;
  frmViewDokter.Close;
end;

if isIsiLab = 1 then
begin
  frmLab.dbKodeDokter.Text := gridViewDokter.Fields[0].Value;
  frmViewDokter.Close;
end;

if isPoli <> 1 then
begin
   case key of
    VK_F2 : frmEditDokter.ShowModal;
    VK_F3 : txtCariNama.SetFocus;
    VK_F5 : frmAddDokter.ShowModal;
    VK_F6 : frmViewDokter.refreshDokter;
    VK_DELETE : hapusDokter;
    VK_ESCAPE : frmViewDokter.Close;
    end;
end else
    begin
      case key of
      VK_RETURN : isiFormPoli;
      end;
     end;
end;

procedure TfrmViewDokter.FormActivate(Sender: TObject);
begin
  if dm.dsetdokter.Active=false then dm.dsetdokter.Active:=true;

 if (isPoli = 1) or (isPoliTreatment=1) then
 begin
    gbShortcut.Visible := false;
 end else gbShortCut.Visible := true;


 txtCariNama.Clear;
 txtCariNama.SetFocus;
 refreshDokter;
end;

procedure TfrmViewDokter.txtCariNamaChange(Sender: TObject);
begin
//  cariDokter;
 with dm.dsetDokter do
 begin
   Locate('dknama',txtCariNama.Text,[loPartialKey]);
 end;
end;

procedure TfrmViewDokter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  isKonsul:=0;
  isOk :=0;
  isVK :=0;
  isTindakanSederhana := 0;
  isTindakanSedang :=0;
  isTindakanBesar :=0;
  isTindakanKhusus :=0;
end;

end.

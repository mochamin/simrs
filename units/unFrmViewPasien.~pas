unit unFrmViewPasien;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,ADODb, Grids, DBGrids, Buttons, RpCon,
  RpConDS, RpDefine, RpRave;

type
  TfrmViewPasien = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtCariNama: TEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    gridViewPasien: TDBGrid;
    Image2: TImage;
    Label15: TLabel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure lblRegistrasiClick(Sender: TObject);
    procedure txtCariNamaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure txtCariNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridViewPasienKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure cariPasien;
    procedure cetakpasien;
    procedure hapuspasien;
  public
    { Public declarations }
    procedure refreshPasien;
    procedure validasiViewPasien;

  end;

var
  frmViewPasien: TfrmViewPasien;

implementation

uses unDm,unUtama,unFrmPoli, unFrmRawatInap, unFrmLab, unFrmCetakLab,
  unFrmLayananRontgen, unFrmRegLab, unFrmAddPasien, editpasienun;

{$R *.dfm}

procedure TfrmViewPasien.cetakpasien;
begin
if messagedlg('Cetak Data Pasien?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
 {RvProjectprintpasien.ProjectFile:='pasien.rav';
 RvProjectprintpasien.Open;
 RvProjectprintpasien.SelectReport('pasien.rav',true);
 RvProjectprintpasien.Execute;}
end;
end;

procedure TfrmViewPasien.hapuspasien;
begin
 if MessageDlg('Hapus Pasien ini?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dSetPasien.Delete;
   dm.dSetPasien.UpdateBatch(arAll);
 end;
end;

procedure TfrmViewPasien.validasiViewPasien;
begin
  if isPoli=1 then
  begin
     frmPoli.txtNoRm.Text := gridViewPasien.Fields[0].Value;
     frmViewPasien.Close;
  end else if isRawatInap=1 then
  begin
    frmRawatInap.txtNoRm.Text := gridViewPasien.Fields[0].Value;
    frmViewPasien.Close;
   
  end else if isLabLuar=1 then
  begin
     frmRegLab.dbnoreg.Text := gridViewPasien.fields[0].Value;
     frmRegLab.lblnama.Caption := gridViewPasien.Fields[1].Value;
     frmRegLab.lbljk.Caption := gridViewPasien.Fields[7].Value;
     frmreglab.lblnorm.Caption := gridViewPasien.Fields[0].Value;
     frmreglab.lblalamat.Caption := gridViewPasien.Fields[2].Value;
     frmViewpasien.Close;
    
  end;
  if isPrintLab=1 then
  begin
    //showMessage('isCetakLab=1');
    frmCetakLab.notransaksi.Text := gridViewPasien.Fields[0].Value;
    frmViewPasien.Close;
  end;

 { if isLayananRontgen=1 then
  begin
    frmLayananRontgen.dbNoRM.KeyValue := gridViewPasien.Fields[0].Value;
    frmLayananRontgen.gridViewRontgen.Fields[2].Value := gridViewPasien.Fields[0].Value;
    //frmLayananrontgen.dbViewName.Caption := gridViewPasien.Fields[1].Value;
    frmViewPasien.Close;
  end;

  }
end;

procedure TfrmViewPasien.refreshPasien;
begin
   with dm.dSetPasien do
   begin
     active := false;
     commandType := cmdText;
     commandText := 'SELECT * FROM tapasien '+
     'ORDER BY psNama';
     active := true;
   end;
end;

procedure TfrmViewPasien.cariPasien;
begin
   with dm.dSetPasien do
   begin
     active := false;
     commandType := cmdText;
     commandText := 'SELECT * FROM tapasien '+
     'WHERE psNama LIKE (:cariNama) '+
     'ORDER BY psNama';
     Parameters.ParamByName('cariNama').Value := '%'+txtCariNama.Text+'%';
     active := true;
   end;
end;

procedure TfrmViewPasien.lblRegistrasiClick(Sender: TObject);
begin
  showMessage('Registrasi Pasien');
end;

procedure TfrmViewPasien.txtCariNamaChange(Sender: TObject);
begin
  cariPasien;
end;

procedure TfrmViewPasien.FormActivate(Sender: TObject);
begin
  refreshPasien;
  txtCariNama.Clear;
end;

procedure TfrmViewPasien.txtCariNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
  VK_RETURN : validasiViewPasien;
  VK_DOWN : gridViewPasien.SetFocus;
  VK_ESCAPE : frmViewPasien.Close;
  vk_f8     : cetakPasien;
  vk_f2    : editpasienfrm.ShowModal;
  vk_Delete : hapuspasien;
  end;
end;

procedure TfrmViewPasien.gridViewPasienKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  case key of
  VK_RETURN : begin
              validasiViewPasien;
              end;
   vk_f5    : begin
              frmAddPasien.ShowModal;
              end;
   vk_f8     : cetakpasien;
   vk_f2    : editpasienfrm.ShowModal;
   vk_Delete : hapuspasien;
  end;
end;

procedure TfrmViewPasien.BitBtn1Click(Sender: TObject);
begin
  txtCariNama.Clear;
end;

end.

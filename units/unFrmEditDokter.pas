unit unFrmEditDokter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls,db,adodb;

type
  TfrmEditDokter = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    btnSave: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dtTgl: TDBEdit;
    dtTglGabung: TDBEdit;
    txtKodeDokter: TDBEdit;
    txtNama: TDBEdit;
    txtJenisKelamin: TDBEdit;
    txtTempatLahir: TDBEdit;
    dtTglLahir: TDBEdit;
    txtAlamat: TDBEdit;
    txtKodePos: TDBEdit;
    txtPendidikanTerakhir: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    txtSpesialisasi: TDBEdit;
    Label13: TLabel;
    Image2: TImage;
    Label15: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateDokter;
    procedure ValidasiUpdate;
  end;

var
  frmEditDokter: TfrmEditDokter;

implementation

uses unDm, unFrmViewDokter;

{$R *.dfm}

procedure TfrmEditDokter.UpdateDokter;
begin
    with dm.dsetDokter do
    begin
      open;
      edit;
      updateRecord;
      post;
      updateBatch(arAll);
    end;

end;

procedure TfrmEditDokter.ValidasiUpdate;
begin

  if Length(txtNama.Text)<3 then
  begin
    showMessage('Nama Kosong atau terlalu pendek!');
    txtNama.SetFocus;
  end else
      if Length(txtAlamat.Text)<10 then
      begin
        showMessage('Alamat kosong atau terlalu pendek!');
        txtAlamat.SetFocus;
      end else
      if Length(txtJenisKelamin.Text)=0 then
      begin
         showMessage('Jenis Kelamin harap diisi!');
         txtJenisKelamin.SetFocus;
      end else
         updateDokter; //simpan data setelah validasi selesai


end;

procedure TfrmEditDokter.btnSaveClick(Sender: TObject);
begin
  ValidasiUpdate;
  showMessage('data telah di-update');
  frmViewdokter.refreshDokter;
  frmEditDokter.Close;
end;

procedure TfrmEditDokter.BitBtn1Click(Sender: TObject);
begin
  frmEditDokter.Close;
end;

procedure TfrmEditDokter.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
  VK_ESCAPE : frmEditDokter.Close;
  end;
end;

end.

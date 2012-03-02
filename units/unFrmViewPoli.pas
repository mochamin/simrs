unit unFrmViewPoli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,ADODb, Buttons, Grids, DBGrids;

type
  TfrmViewPoli = class(TForm)
    Panel1: TPanel;
    Image2: TImage;
    Label15: TLabel;
    Panel2: TPanel;
    gbAddPoli: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    txtKodePoli: TEdit;
    txtNamaPoli: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    gridViewPoli: TDBGrid;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    Image1: TImage;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure gridViewPoliDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure validasiAddPoli;
    procedure simpanDepartemenPoli;
  public
    { Public declarations }
     procedure refreshDeptPoli;
  end;

var
  frmViewPoli: TfrmViewPoli;

implementation

uses unDm, unEditPoli;

{$R *.dfm}

procedure TfrmViewPoli.refreshDeptPoli;
begin
  with dm.dSetPoli do
    begin
     active := false;
     commandType := cmdText;
     commandText := 'SELECT * FROM tapoli '+
     'ORDER BY poKode';
     active := true;
    end;
end;

procedure TfrmViewPoli.simpanDepartemenPoli;
begin
    with dm.dSetPoli do
    begin
     active := false;
     commandType := cmdText;
     commandText := 'SELECT * FROM tapoli '+
     'WHERE poKode LIKE (:cariKode)';
     parameters.ParamByName('cariKode').Value := txtKodePoli.Text;
     active := true;
       if isEmpty=false then
       begin
         showMessage('Kode departement Poli sudah ada. '+#13+
         'Mohon pilih kode yang lain!');
         txtKodePoli.SetFocus;
       end else
       begin
         active:=true;
         open;
         append;
         fields.FieldByName('poKode').AsString := txtKodePoli.Text;
         fields.FieldByName('poNama').AsString := txtNamaPoli.Text;
         post;
         showMessage('data tersimpan...');
         txtKodePoli.Clear;
         txtNamaPOli.Clear;
         gbAddPoli.Visible := false;
         refreshDeptPoli;
       end;

    end;
end;

procedure TfrmViewPoli.validasiAddPoli;
begin
  if Length(txtKodePoli.Text)<2 then
  begin
    showMessage('Kode Poli terlalu pendek!');
    txtKodePoli.SetFocus;
  end else if Length(txtNamaPoli.Text)<2 then
  begin
    showMessage('Nama Poli kosong atau terlalu pendek!');
  end else simpanDepartemenPoli;
end;

procedure TfrmViewPoli.BitBtn3Click(Sender: TObject);
begin
  gbAddPoli.Visible := true;
  txtKodePoli.SetFocus;
  txtKodePoli.Clear;
  txtNamaPoli.Clear;
end;

procedure TfrmViewPoli.BitBtn1Click(Sender: TObject);
begin
  gbAddPoli.Visible := false;
  refreshDeptPoli;
end;

procedure TfrmViewPoli.BitBtn2Click(Sender: TObject);
begin
  validasiAddPoli;
end;

procedure TfrmViewPoli.gridViewPoliDblClick(Sender: TObject);
begin
 frmEditPoli.ShowModal;
end;

procedure TfrmViewPoli.FormActivate(Sender: TObject);
begin
 if dm.dSetPoli.Active = false then dm.dSetPoli.Active := true;
end;

end.

unit unFrmViewPasienPoli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids,db,adodb, DBGrids;

type
  TfrmViewPasienPoli = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    gridViewPasienPoli: TDBGrid;
    txtCariNama: TEdit;
    procedure gridViewPasienPoliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtCariNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure txtCariNamaChange(Sender: TObject);
  private
    { Private declarations }
    procedure isiToApotik;
    procedure isiToCetakPoli;
    procedure isiToRontgen;
    procedure isiToRegLab;
  public
    { Public declarations }
  end;

var
  frmViewPasienPoli: TfrmViewPasienPoli;

implementation

uses unfrmApotek, unDm,unUtama, unfrmcetak, unFrmLayananRontgen, unFrmLab,
  unFrmCetakLab, unFrmRegLab, unfrmbillingugd;

{$R *.dfm}

procedure TfrmViewPasienPoli.isiToRegLab;
begin
  frmRegLab.dbnoreg.Text := gridViewPasienPoli.Fields[0].Value;
  frmReglab.lblnama.Caption := gridViewPasienPoli.Fields[1].Value;
  frmREglab.lbljk.Caption := gridViewPasienPoli.Fields[7].Value;
  frmRegLab.lblnorm.Caption := gridViewPasienPoli.Fields[8].Value;
  frmRegLab.lblalamat.Caption := gridViewPasienPoli.Fields[4].Value;
  close;
end;

procedure TfrmViewPasienPoli.isiToCetakPoli;
begin
  frmCetak.txtNama.Text       := gridViewPasienPoli.Fields[1].Value;
  frmCetak.lblnoreg.Caption   := gridViewPasienPoli.Fields[0].Value;
  frmCetak.lblUsia.Caption    := gridViewPasienPoli.Fields[2].Value;
  frmCetak.lblAlamat.Caption  := gridViewPasienPoli.Fields[4].Value;
  frmCetak.lblnorm.Caption    := gridViewPasienPoli.Fields[5].Value;
  frmcetak.lbldokter.Caption  := gridviewpasienpoli.Fields[6].Value;
  frmcetak.lbljaminan.Caption := gridviewpasienpoli.Fields[9].Value;
  frmViewPasienPoli.Close;
end;

procedure TfrmViewPasienPoli.isiToRontgen;
begin
   frmLayananRontgen.dbnotransaksi.Text :=   gridViewPasienPoli.Fields[0].Value;
   frmLayananRontgen.lblnama.Caption    :=   gridViewPasienPoli.Fields[1].Value;
   frmLayananRontgen.lblusia.Caption    :=   gridViewPasienPoli.Fields[2].Value;
   frmlayananRontgen.lblalamat.Caption  :=   gridViewPasienPoli.Fields[4].Value;
   frmlayananrontgen.dbnama.Text        := gridViewPasienPoli.Fields[1].Value;
   frmlayananrontgen.dbusia.Text        := gridViewPasienPoli.Fields[2].Value;
   frmlayananrontgen.dbalamat.Text      := gridViewPasienPoli.Fields[4].Value;
   frmlayananrontgen.lblnorm.Caption    := gridViewPasienPoli.Fields[8].Value;
   frmViewPasienPoli.Close;
end;
procedure TfrmViewPasienPoli.isiToApotik;
begin
  frmApotek.dbNoReg.Text      := gridViewPasienPoli.Fields[0].Value;
  frmApotek.lblNama.Caption   := gridViewPasienPoli.Fields[1].Value;
  frmApotek.lblUsia.Caption   := gridViewPasienPoli.Fields[2].Value;
  frmApotek.lblAlamat.Caption := gridViewPasienPoli.Fields[4].Value;
  frmApotek.lbldokter.Caption := gridViewPasienPoli.Fields[6].Value;
  frmApotek.dbpenjamin.Text   := gridViewPasienPoli.Fields[9].Value;
  frmViewPasienPoli.Close;
end;

procedure TfrmViewPasienPoli.gridViewPasienPoliKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=vk_return) and (isCetakugd=1) then
 begin
   frmBillingUgd.nama.Text := gridViewPasienPoli.Fields[1].Value;
   close;
 end;


 if (key=vk_return) and (TransaksiObat=1) then
 begin
   isiToApotik;
 end;
  if (key=vk_return) and (isPrintPoli=1) then
  begin
      isiToCetakPoli;
  end;

  if (key=vk_return) and (isbillingrontgen=1) then
  begin
     // isiToBillingRontgen;
  end;

  if (key=vk_return)and (isPrintLab=1) then
  begin
    frmCetakLab.notransaksi.Text:= gridViewPasienPoli.Fields[0].Value;
    close;
  end;

  if (key=vk_return) and (isLayananRontgen=1)then
  begin
    isiToRontgen;
  end;

  if (key=vk_return) and (isRegLabPoli=1)then
  begin
    isiToRegLab;
  end;

 if key=vk_escape then
 begin
   frmViewPasienPoli.Close;
 end;

end;

procedure TfrmViewPasienPoli.txtCariNamaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var data : TADODataSet;
begin
data:=dm.dsetViewPasienPoli;
case key of
  vk_up : begin
           gridviewPasienPoli.SetFocus;
           data.Prior;
          end;
  vk_down : begin
           gridviewPasienPoli.SetFocus;
           data.Next;
          end;
end;

 if (key=vk_return)and (isPrintLab=1) then
  begin
    frmCetakLab.notransaksi.Text := gridViewPasienPoli.Fields[0].Value;
    close;
  end;

  if (key=vk_return) and (transaksiobat=1) then
 begin
   isiToApotik;
 end;
 if (key=vk_return) and (isPrintPoli=1)then
          begin
          isiToCetakPoli;
          end;
  if (key=vk_return) and (isRegLabPoli=1)then
  begin
    isiToRegLab;
  end;

  if (key=vk_return) and (isLayananRontgen=1)then
  begin
    isiToRontgen;
  end;

 if key=vk_escape then
 begin
   frmViewPasienPoli.Close;
 end;

 if (key=vk_return) and (isCetakugd=1) then
 begin
   frmBillingUgd.nama.Text := gridViewPasienPoli.Fields[1].Value;
   close;
 end;

end;

procedure TfrmViewPasienPoli.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
 begin
   isiToApotik;
 end;
 if key=vk_escape then
 begin
   frmViewPasienPoli.Close;
 end;

end;

procedure TfrmViewPasienPoli.FormActivate(Sender: TObject);
begin
if dm.dsetViewPasienPoli.Active=false then dm.dsetViewPasienPoli.Active:=true;
  dm.dsetViewPasienPoli.Requery();
  txtCariNama.SetFocus;
end;

procedure TfrmViewPasienPoli.txtCariNamaChange(Sender: TObject);
begin
 with dm.dsetViewPasienPoli do
 begin
   locate('psnama',txtCariNama.Text,[loPartialKey]);
 end;
end;

end.

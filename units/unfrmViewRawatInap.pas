unit unfrmViewRawatInap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids,adodb,db, DBGrids;

type
  TfrmViewRawatInap = class(TForm)
    GroupBox1: TGroupBox;
    gridViewRawatInap: TDBGrid;
    Label1: TLabel;
    txtCariNama: TEdit;
    procedure txtCariNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridViewRawatInapKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure txtCariNamaChange(Sender: TObject);
  private
    { Private declarations }
    procedure inputToApotik;
    procedure isiToRontgen;
    procedure isiToLab;
    procedure isiToRegLab;
  public
    { Public declarations }
  end;

var
  frmViewRawatInap: TfrmViewRawatInap;

implementation

uses unDm, unfrmApotek, unFrmLayananRontgen,unUtama, unFrmLab,
  unFrmCetakLab, unfrmtambahdeposit, unFrmRegLab;

{$R *.dfm}

procedure TfrmViewRawatInap.isiToLab;
begin
  frmLab.dbNoRm.Text := gridViewRawatInap.Fields[0].Value;
  frmLab.dbNama.Text := gridViewRawatInap.Fields[1].Value;
  frmLab.dbJK.Text := gridViewRawatInap.Fields[6].Value;
  frmLab.dbrekammedik.Text := gridViewRawatInap.Fields[7].Value;
  frmViewRawatInap.Close;
end;

procedure TfrmViewRawatInap.isiToRegLab;
begin
  frmRegLab.lblnama.Caption := gridViewRawatInap.Fields[2].Value;
  frmRegLab.lbljk.Caption   := gridViewRawatInap.Fields[6].Value;
  frmRegLab.lblnorm.Caption := gridViewRawatInap.Fields[9].Value;
  frmRegLab.lblalamat.Caption := gridViewRawatInap.Fields[4].Value;
  Close;
end;



procedure TfrmViewRawatInap.isiToRontgen;
begin
   frmLayananRontgen.dbnotransaksi.Text :=   gridViewRawatInap.Fields[0].Value;
   frmLayananRontgen.lblnama.Caption    :=   gridViewRawatInap.Fields[1].Value;
   frmLayananRontgen.lblusia.Caption    :=   gridViewRawatInap.Fields[2].Value;
   frmlayananRontgen.lblalamat.Caption  :=   gridViewRawatInap.Fields[4].Value;
   frmlayananRontgen.lblnorm.Caption    :=   gridViewRawatInap.Fields[7].Value;
   kodekamar := gridViewRawatInap.Fields[5].Value;
   frmViewRawatInap.Close;
end;

procedure TfrmViewRawatInap.inputToApotik;
begin
  frmApotek.dbNoReg.Text := gridviewRawatInap.Fields[0].Value;
  frmApotek.lblNama.Caption := gridviewRawatInap.Fields[1].Value;
  frmApotek.lblUsia.Caption := gridviewRawatInap.Fields[2].Value;
  frmApotek.lblAlamat.Caption := gridviewRawatInap.Fields[4].Value;
  frmViewRawatInap.Close;
end;

procedure TfrmViewRawatInap.txtCariNamaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (key=vk_return) and (isRegLab=1) then
 begin
   isiToRegLab;
 end;

 if (key=vk_return) and (isPrintLab=1) then
 begin
    frmCetakLab.notransaksi.Text := gridviewrawatinap.Fields[0].Value;
    close;
 end;

 if (key=vk_return) and (isLabRAwatInap=1) then
 begin
   frmReglab.dbnoreg.Text := gridViewRawatInap.Fields[0].Value;
   frmreglab.lblnama.Caption := gridviewrawatinap.Fields[1].Value;
   frmreglab.lbljk.Caption := gridviewrawatinap.Fields[6].Value;
   frmreglab.lblalamat.Caption := gridviewrawatinap.Fields[4].Value;
   frmreglab.lblnorm.Caption := gridviewrawatinap.Fields[8].Value;
   
   close;
 end;

 if key=vk_escape then
 begin
   frmViewRawatInap.Close;
 end;

 if (key=vk_return) and (transaksiobat=1) then
 begin
      inputToApotik;
 end;

  if (key=vk_return) and (isLabRawatInap=1) then
 begin
   isiToLab;
 end;

  if (key=vk_return) and (islayananrontgen=1) then
 begin
     isiToRontgen;
 end;

  if (key=vk_return) and (istambahdeposit=1) then
 begin
   frmtambahdeposit.noreg.Text := gridviewrawatinap.Fields[0].Value;
   frmtambahdeposit.gbketerangan.Visible:=true;
    close;
      frmtambahdeposit.deposit.SetFocus;
 end;

end;

procedure TfrmViewRawatInap.gridViewRawatInapKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_escape then
 begin
   frmViewRawatInap.Close;
 end;

 if (key=vk_return) and (isPrintLab=1) then
 begin
    frmCetakLab.notransaksi.Text := gridviewrawatinap.Fields[0].Value;
    close;
 end;

 if (key=vk_return) and (isLabRAwatInap=1) then
 begin
   frmReglab.dbnoreg.Text := gridViewRawatInap.Fields[0].Value;
   close;
 end;

 if (key=vk_return) and (transaksiobat=1) then
 begin
      inputToApotik;
 end;

 if (key=vk_return) and (isRegLab=1) then
 begin
   isiToRegLab;
 end;

 if (key=vk_return) and (isLabRawatInap=1) then
 begin
   isiToLab;
 end;

 if (key=vk_return) and (islayananrontgen=1) then
 begin
     isiToRontgen;
 end;

 if (key=vk_return) and (istambahdeposit=1) then
 begin
   frmtambahdeposit.noreg.Text := gridviewrawatinap.Fields[0].Value;
   frmtambahdeposit.gbketerangan.Visible:=true;
   close;
   frmtambahdeposit.deposit.SetFocus;
 end;


end;

procedure TfrmViewRawatInap.FormActivate(Sender: TObject);
begin
 if dm.dsetViewRawatInap.Active = false then dm.dsetViewRawatInap.Active := true;
 txtCariNama.SetFocus;
end;

procedure TfrmViewRawatInap.txtCariNamaChange(Sender: TObject);
begin
 with dm.dsetViewRawatInap do
 begin
   Locate('psnama',txtCarinama.Text,[loPartialKey]);
 end;
end;

end.

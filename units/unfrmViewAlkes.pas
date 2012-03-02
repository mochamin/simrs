unit unfrmViewAlkes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids,adodb,db, DBGrids;

type
  TfrmViewAlkes = class(TForm)
    txtCariNama: TEdit;
    gridAlkes: TDBGrid;
    Label21: TLabel;
    procedure gridAlkesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtCariNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtCariNamaChange(Sender: TObject);
  private
    { Private declarations }
    procedure isialkes;
    procedure isiToPoliTreatment;
  public
    { Public declarations }
  end;

var
  frmViewAlkes: TfrmViewAlkes;

implementation

uses unFrmService, unFrmTransaksiRawatInap, unDm,unUtama,
  unfrmpolitreatment;

{$R *.dfm}

procedure TfrmViewAlkes.isiToPoliTreatment;
begin
   frmPoliTreatment.gridtreatment.Fields[0].Value := date();
   frmPoliTreatment.gridtreatment.Fields[1].Value := time();
   frmPoliTreatment.gridtreatment.Fields[2].Value :=  gridAlkes.Fields[2].Value;
   frmPoliTreatment.gridtreatment.Fields[3].Value :=  gridAlkes.Fields[0].Value;
   frmPoliTreatment.gridtreatment.Fields[4].Value :=  gridAlkes.Fields[3].Value;
   frmPoliTreatment.gridtreatment.Fields[5].Value :=  1; // qty diisi default 1
   frmPoliTreatment.gridtreatment.Fields[7].Value :=  0; // fields ldisservice diisi 0
   //menandakan bahwa record bukanlah service melainkan alkes (service diberi kode 1)
   frmViewalkes.Close;
end;

procedure TfrmViewAlkes.isiAlkes;
begin
     frmService.cekAdministrasi;
     frmTreatment.gridTreatment.DataSource.edit;
    // dm.dsetAlkes.Append;
     frmTreatment.gridTreatment.Fields[0].Value := date();
     frmTreatment.gridTreatment.Fields[1].Value := time();
     frmTreatment.gridTreatment.Fields[2].Value := gridAlkes.Fields[2].Value;
     frmTreatment.gridTreatment.Fields[3].Value := gridAlkes.Fields[0].Value;
     frmTreatment.gridTreatment.Fields[4].Value := (gridAlkes.Fields[3].Value)+(gridAlkes.Fields[3].Value*tempAlkes/100);
     frmTreatment.gridTreatment.Fields[5].Value :=1;
     frmTreatment.gridTreatment.Fields[7].Value :=2; // kode menunjukkan alkes obat=1 service=0
     frmTreatment.gridTreatment.SetFocus;
     frmViewAlkes.Close;

end;

procedure TfrmViewAlkes.gridAlkesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=vk_return) and (isPoliTreatment=0) then
 begin
   isiAlkes;
   //gbalkes.Visible := false;
 end;
  if key=vk_escape then
 begin
   frmViewAlkes.Close;
 end;

 if (key=vk_return) and (isPoliTreatment=1) then
 begin
   isiToPoliTreatment;
 end;


end;

procedure TfrmViewAlkes.txtCariNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) and (isPoliTreatment=0) then
 begin
   isiAlkes;
   //gbalkes.Visible := false;
 end;
 if key=vk_escape then
 begin
   frmViewAlkes.Close;
 end;

  if (key=vk_return) and (isPoliTreatment=1) then
 begin
   isiToPoliTreatment;
 end;
end;

procedure TfrmViewAlkes.txtCariNamaChange(Sender: TObject);
begin
  with dm.dsetAlkes do
  begin
    Locate('aknama',txtCariNama.Text,[loPartialKey]);
  end;
end;

end.

unit unfrmviewservicedokter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids,db,adodb, DBGrids, ExtCtrls;

type
  TfrmViewServicedokter = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    gridViewDokter: TDBGrid;
    Label1: TLabel;
    txtcarinama: TEdit;
    procedure txtcarinamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridViewDokterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure txtcarinamaChange(Sender: TObject);
  private
    { Private declarations }
    procedure isiToPoliTreatment;
  public
    { Public declarations }
  end;

var
  frmViewServicedokter: TfrmViewServicedokter;

implementation

uses unDm,unUtama, unfrmpolitreatment;

{$R *.dfm}

procedure TfrmViewServicedokter.isiToPoliTreatment;
begin
   frmPoliTreatment.gridtreatment.Fields[0].Value := date();
   frmPoliTreatment.gridtreatment.Fields[1].Value := time();
  frmPoliTreatment.gridtreatment.Fields[2].Value := gridViewDokter.Fields[0].Value;
  frmPoliTreatment.gridtreatment.Fields[3].Value := gridViewDokter.Fields[1].Value;
  frmPoliTreatment.gridtreatment.Fields[4].Value := gridViewDokter.Fields[2].Value;
 frmPoliTreatment.gridtreatment.Fields[5].Value := 1;
  frmViewServicedokter.Close;
end;

procedure TfrmViewServicedokter.txtcarinamaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key=vk_escape then
 begin
   frmViewServiceDokter.Close;
 end;

 if (key=vk_return) and (isPoliTreatment=1) then
 begin
   isiToPoliTreatment;
 end;

end;

procedure TfrmViewServicedokter.gridViewDokterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (key=vk_return) and (isPoliTreatment=1) then
 begin
   isiToPoliTreatment;
 end;

 if key=vk_escape then
 begin
   frmViewServiceDokter.Close;
 end;
end;

procedure TfrmViewServicedokter.FormActivate(Sender: TObject);
begin
  txtCariNama.SetFocus;
  if ispolitreatment=1 then
  begin

    with dm.dsetViewDokter do
    begin
     active:=false;
     commandType := cmdText;
     commandText := 'select * from tadokter,tatarifdokter '+
     'where tdkodedokter like dkkodedokter '+
     'and tdkodedept like (:kodedept) ';
     parameters.ParamByName('kodedept').Value := frmPoliTreatment.dbkodepoli.Text;
     active:=true;
    end;

  end;
end;

procedure TfrmViewServicedokter.txtcarinamaChange(Sender: TObject);
begin
 with dm.dsetViewDokter do
 begin
   locate('dknama',txtCariNama.Text,[loPartialKey]);
 end;
end;

end.

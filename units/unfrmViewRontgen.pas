unit unfrmViewRontgen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids,db,adodb, DBGrids;

type
  TfrmViewRontgen = class(TForm)
    GroupBox1: TGroupBox;
    gridViewRontgen: TDBGrid;
    Label1: TLabel;
    txtCariLayanan: TEdit;
    procedure txtCariLayananChange(Sender: TObject);
    procedure txtCariLayananKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridViewRontgenKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   procedure isiToLayananRontgen;
  public
    { Public declarations }
  end;

var
  frmViewRontgen: TfrmViewRontgen;

implementation

uses unDm,unUtama, unFrmLayananRontgen;

{$R *.dfm}

procedure TFrmViewRontgen.isiToLayananRontgen;
var persenrontgen : integer;
    
begin

  with dm.dsetAdministrasi do
  begin
   active:=false;
   commandType := cmdText;
   commandText := 'SELECT * FROM taadministrasi '+
   'where adkelas like (:kelas) ';
   parameters.ParamByName('kelas').Value := kodekamar;
   //kode kamar adalah variabel global yg diambil dari frmViewPasienRawatInap
   active:=true;
   persenrontgen := fields.fieldbyname('adrontgen').AsInteger;
  end;
   tarifrontgen:= gridViewRontgen.Fields[2].Value+((gridViewRontgen.Fields[2].Value*persenrontgen)/100);
   dm.dsetAdministrasi.Requery();
   frmLayananRontgen.dbkoderontgen.Text := frmLayananRontgen.dbkoderontgen.Text+gridViewRontgen.Fields[0].Value+';';
   frmLayananRontgen.lbllayanan.Caption := gridViewRontgen.Fields[1].Value;
   frmlayananrontgen.dbdetail.Text := frmlayananrontgen.dbdetail.Text+gridViewRontgen.Fields[1].Value;
 frmViewRontgen.Close;   
end;


procedure TfrmViewRontgen.txtCariLayananChange(Sender: TObject);
begin
 with dm.dsetRontgen do
 begin
   Locate('rnjenisperiksa',txtCariLayanan.Text,[loPartialKey]);
 end;
end;

procedure TfrmViewRontgen.txtCariLayananKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (key=vk_return) and (islayananrontgen=1) then
 begin
   isiToLayananRontgen;
 end;

 if key=vk_escape then
 begin
  frmViewRontgen.Close;
 end;
end;

procedure TfrmViewRontgen.gridViewRontgenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=vk_return) and (islayananrontgen=1) then
 begin
   isiToLayananRontgen;
 end;
 if key=vk_escape then
 begin
  frmViewRontgen.Close;
 end;

end;

end.

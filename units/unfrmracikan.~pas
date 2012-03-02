unit unfrmracikan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ToolWin,db,adodb, ComCtrls, Grids, DBGrids;

type
  Tfrmracikan = class(TForm)
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    biayaracikan: TDBLookupComboBox;
    gridObat: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure gridObatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure biayaracikanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmracikan: Tfrmracikan;

implementation

uses unfrmApotek, unViewObat, unDm,unUtama;

{$R *.dfm}

procedure Tfrmracikan.gridObatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var hargaRata2 : integer;
begin
 if (key=vk_return) and (frmRacikan.gridObat.Fields[4].Value=null)  then
 begin
   frmViewObat.ShowModal;
 end else
 if (key=vk_return)  then
 begin
    dm.dsetracikan.Append;

  end;

  if key=vk_delete then
  begin
    dm.dsetracikan.Delete;
  end;

 if key=vk_f5 then
 begin

  //showMessage(intToStr(biayaracikan.KeyValue));
{ dm.dsetracikan.First;
 dm.dsetracikan.Edit;
 dm.dsetracikan.FieldByName('adisracik').AsInteger :=1;
 }
 //  showmessage(intToStr(frmRAcikan.gridObat.Fields[5].Value));
 hargaRata2 := biayaracikan.KeyValue/dm.dsetracikan.RecordCount;



if messageDlg('Masukkan Racikan?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin

if biayaracikan.Text='' then
begin
  showmessage('Jumlah Bungkus Harap Diisi!');
  biayaracikan.SetFocus;
  abort;
end;


with dm.dsetracikan do
begin
  First;
  while not Eof do
  begin
  dm.dsetApotikDEtail.FieldByName('adKodeObat').AsString := fields.fieldByName('adKodeObat').Value;
  dm.dsetApotikDEtail.FieldByName('adNamaObat').AsString := fields.fieldByName('adNamaObat').Value;
  dm.dsetApotikDEtail.FieldByName('adSatuan').AsString := fields.fieldByName('adSatuan').Value;
  dm.dsetApotikDEtail.FieldByName('adHargaSatuan').AsString := fields.fieldByName('adHargaSatuan').Value;
  dm.dsetApotikDEtail.FieldByName('adQty').AsString := fields.fieldByName('adqty').Value;
  dm.dsetApotikDEtail.FieldByName('adkategori').Value  := fields.fieldbyname('adkategori').Value;
  dm.dsetApotikDEtail.FieldByName('adTotal').AsString := fields.fieldByName('adTotal').Value+hargarata2;
 if fields.FieldByName('adisracik').AsInteger<>1 then
 begin
  //showmessage('nol');
  dm.dsetApotikDEtail.FieldByName('adisracik').AsInteger := 0;
 end else
 begin
  dm.dsetApotikDEtail.FieldByName('adisracik').AsInteger := fields.fieldbyname('adisracik').Value; //tanda bahwa obat adalah racikan
 end;
  dm.dsetApotikDEtail.Append;

  Next;
  end;
end;     // end of dset racikan

end; // end of messagedlg
   close;
 end; // end of vk_f5
end;

procedure Tfrmracikan.FormActivate(Sender: TObject);
begin
 //jmlRecord.Text :='0';
 if dm.dsettambahbiayaapotik.Active = false then
 dm.dsettambahbiayaapotik.Active := true;
 if dm.dsetracikan.Active = false then
 dm.dsetracikan.Active := true;
 biayaracikan.SetFocus;
 isRacikan:=1;
 dm.dsetracikan.CancelBatch(arAll);
end;

procedure Tfrmracikan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 isRacikan:=0;
end;

procedure Tfrmracikan.biayaracikanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_escape then
 begin
   close;
 end;
 if key=vk_return then
 begin
   gridobat.SetFocus;
 end;

end;

end.

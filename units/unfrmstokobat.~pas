unit unfrmstokobat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, adodb,db,Buttons, DBCtrls, Mask;

type
  TfrmStokobat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gbstok: TGroupBox;
    GroupBox2: TGroupBox;
    gridobat: TDBGrid;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    txtcarinama: TEdit;
    btnsave: TBitBtn;
    btncancel: TBitBtn;
    dbkodeobat: TDBEdit;
    dbtanggal: TDBEdit;
    dbqty: TDBEdit;
    dbketerangan: TDBMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnsaveClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure gridobatDblClick(Sender: TObject);
    procedure gridobatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtcarinamaChange(Sender: TObject);
    procedure txtcarinamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure updateStok;
  public
    { Public declarations }
  end;

var
  frmStokobat: TfrmStokobat;

implementation

uses unDm,unUtama;

{$R *.dfm}

procedure TfrmStokobat.updateStok;
begin
 gbstok.Enabled := true;
 btnSave.Enabled := true;
 btnCancel.Enabled := true;
 with dm.dsetstokopname do
 begin
  open;
  append;
  dbkodeobat.Text := gridobat.Fields[2].Value;
  dbtanggal.Text := dateToStr(date());
  fields.FieldByName('souser').Value := isCurrentUser;
  dbqty.SetFocus;
 end;
end;

procedure TfrmStokobat.btnsaveClick(Sender: TObject);
begin
 if messageDlg('Simpan perubahan stok?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
 begin

   // update perubahan stok pada tabel obat
   with dm.dSetObat do
   begin
     if locate('obkode',dbkodeobat.Text,[loCaseInsensitive])=true then
     begin
        open;
        edit;
        fields.FieldByName('obstok').Value := fields.FieldByName('obstok').AsInteger+strToInt(dbqty.Text);
        post;
        updatebatch(arAll);
        with dm.dsetstokopname do
        begin
           updatebatch(arAll);
        end;
        showMessage('update telah disimpan...');
        dm.dsetObat.Requery();
        with dm.dSetObat do
        begin
          locate('obkode',dbkodeobat.Text,[loCaseInsensitive]);
        end;
        gbstok.Enabled := false;
        btnSave.Enabled := false;
        btnCancel.Enabled := false;
     end else
         showMessage('kode Obat tidak ada!');
   end;
     gridObat.SetFocus;
 end;
end;

procedure TfrmStokobat.btncancelClick(Sender: TObject);
begin
  if messageDlg('Batalkan perubahan ?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
 begin
    dm.dsetstokopname.CancelBatch(arAll);
    gbstok.Enabled := false;
       btnSave.Enabled := false;
        btnCancel.Enabled := false;
        gridObat.SetFocus;
 end;
end;

procedure TfrmStokobat.gridobatDblClick(Sender: TObject);
begin
 updateStok;
end;

procedure TfrmStokobat.gridobatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
   updateStok;
 end;
end;

procedure TfrmStokobat.txtcarinamaChange(Sender: TObject);
begin
 with dm.dSetObat do
 begin
   Locate('obNama',txtCarinama.Text,[loPartialKey]);
 end;
end;

procedure TfrmStokobat.txtcarinamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
  updateStok;
 end;
end;

procedure TfrmStokobat.FormActivate(Sender: TObject);
begin
 if dm.dsetstokopname.Active = false then dm.dsetstokopname.Active := true;
 if dm.dSetObat.Active       = false then dm.dSetObat.Active := true;
 txtCariNama.SetFocus;
end;

end.

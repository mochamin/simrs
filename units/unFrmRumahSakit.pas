unit unFrmRumahSakit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, strUtils,Grids,db,adodb, DBGrids, DBCtrls, Mask;

type
  TfrmRumahSakit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    gbDataDetail: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    gridViewRumahSakit: TDBGrid;
    txtCari: TEdit;
    Label1: TLabel;
    btnClear: TButton;
    dbKode: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbNama: TDBEdit;
    dbTelp: TDBEdit;
    dbFax: TDBEdit;
    gbButton: TGroupBox;
    btnNew: TButton;
    dbAlamat: TDBMemo;
    btnEdit: TButton;
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnNewClick(Sender: TObject);
    procedure gridViewRumahSakitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEditClick(Sender: TObject);
    procedure txtCariChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure changeCaption;
    procedure validasiRumahSakit;
    procedure otoKode;

  public
    { Public declarations }
  end;

var
  frmRumahSakit: TfrmRumahSakit;

implementation

uses unDm;

{$R *.dfm}

procedure tfrmRumahSakit.otoKode;
var tempKode : integer;
    hitungKode : integer;
    zeroFill : string;
begin
    with dm.dSetRumahSakit do
    begin
      open;
      last;
      tempKode := strToInt(RightStr(fields.fieldByName('rsKode').asString,4));
      hitungKode := tempKode+1;


     case Length(intToStr(hitungKode)) of
     1 : zeroFill := '000';
     2 : zeroFill := '00';
     3 : zeroFill := '0';
     else
       zeroFill := '';
     end;

     append;
     dbKode.Text := 'RS-'+zeroFill+intToStr(hitungKode);
     dbKode.Enabled := false;
   end;
end;

procedure tfrmRumahSakit.validasiRumahSakit;
begin
  if Length(dbNama.Text)=0 then
  begin
    showMessage('Nama Harus Diisi!');
    dbNama.SetFocus;
  end else
  begin
   if MessageDlg('Simpan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
     dm.dSetRumahSakit.UpdateBatch(arAll);
     btnNew.Caption := '&New';
     btnEdit.Caption := '&Edit';
     dbKode.Enabled := true;
     gbDataDetail.Enabled := false;
   end;  
  end;

end;

procedure tfrmRumahSakit.changeCaption;
begin
  if btnNew.Caption = '&New' then
  begin
     gbDataDetail.Enabled := true;
     dbKode.Enabled := true;
     otoKode;
     dbNama.SetFocus;
     btnNew.Caption := '&Save';
     btnEdit.Caption := '&Cancel';
  end else validasiRumahSakit;
end;

procedure TfrmRumahSakit.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmRumahSakit.btnNewClick(Sender: TObject);
begin
 changeCaption;
end;

procedure TfrmRumahSakit.gridViewRumahSakitKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key=vk_delete then
 begin
   if MessageDlg('Hapus Rumah Sakit? ',mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
    dm.dSetRumahSakit.Delete;
   end; 
 end;

end;

procedure TfrmRumahSakit.btnEditClick(Sender: TObject);
begin
  if btnEdit.Caption='&Cancel' then
  begin
    if MessageDlg('Cancel Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      dbKode.Enabled := true;
      btnEdit.Caption := '&Edit';
      btnNew.Caption := '&New';
      dm.dSetRumahSakit.CancelBatch(arAll);
      dbKode.Enabled := true;
      gbDataDetail.Enabled := false;
    end;
  end else
  begin
    btnNew.Caption := '&Save';
    btnEdit.Caption := '&Cancel';
    gbDataDetail.Enabled := true;
    dbKode.Enabled := false;
    dm.dSetRumahSakit.Open;
    dm.dSetRumahSakit.Edit;
    dbNama.SetFocus;
  end;
end;

procedure TfrmRumahSakit.txtCariChange(Sender: TObject);
begin
  with dm.dSetRumahSakit do
  begin
  active := false;
  commandType := cmdText;
  commandText := 'SELECT * FROM tarumahsakit '+
  'WHERE rsNama LIKE (:nama) '+
  'ORDER BY rsKode ASC ';
  parameters.ParamByName('nama').Value := '%'+txtCari.Text+'%';
  active := true;
  end;
end;

procedure TfrmRumahSakit.btnClearClick(Sender: TObject);
begin
 txtCari.Clear;
end;

procedure TfrmRumahSakit.FormActivate(Sender: TObject);
begin
 if dm.dSetRumahSakit.Active = false then dm.dSetRumahSakit.Active := true;
end;

end.

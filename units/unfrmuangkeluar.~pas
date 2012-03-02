unit unfrmuangkeluar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, db,adodb,ExtCtrls, DBCtrls, Mask;

type
  TfrmUangKeluar = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    btnclose: TBitBtn;
    gbdata: TGroupBox;
    dbnoref: TDBEdit;
    Label2: TLabel;
    dbjmluang: TDBEdit;
    Label3: TLabel;
    dbketerangan: TDBMemo;
    Label4: TLabel;
    dbcashier: TDBEdit;
    Label5: TLabel;
    dbpic: TDBEdit;
    btnNew: TBitBtn;
    btnsave: TBitBtn;
    btncancel: TBitBtn;
    Label6: TLabel;
    dbtanggal: TDBEdit;
    procedure btncloseClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
    procedure dbjmluangKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUangKeluar: TfrmUangKeluar;

implementation

uses unDm,unUtama;

{$R *.dfm}

procedure TfrmUangKeluar.btncloseClick(Sender: TObject);
begin
 close;
end;

procedure TfrmUangKeluar.btnNewClick(Sender: TObject);
begin
  gbdata.Enabled      := true;
  btnsave.Visible     := true;
  btnCancel.Visible   := true;
  dm.dsetuangkeluar.Append;
  dbtanggal.Text      := dateTostr(Date());
  dbnoref.SetFocus;
  dbcashier.Text      := isCurrentUser;
  btnSave.Visible     := true;
  btnCancel.Visible   := true;
end;

procedure TfrmUangKeluar.btncancelClick(Sender: TObject);
begin
if MessageDlg('batalkan transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
 dm.dsetuangkeluar.CancelBatch(arAll);
 gbdata.Enabled := false;
 btnsave.Visible := false;
 btncancel.Visible := false;
end;
end;

procedure TfrmUangKeluar.btnsaveClick(Sender: TObject);
begin
if MessageDlg('Simpan transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
 dm.dsetuangkeluar.UpdateBatch(arAll);
 gbdata.Enabled := false;
 btnsave.Visible := false;
 btncancel.Visible := false;
end;

end;

procedure TfrmUangKeluar.dbjmluangKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9',#8]) then key:=#0;

end;

procedure TfrmUangKeluar.FormActivate(Sender: TObject);
begin
 if dm.dsetuangkeluar.Active = false then dm.dsetuangkeluar.Active := true;
end;

end.

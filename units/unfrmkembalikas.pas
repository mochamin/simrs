unit unfrmkembalikas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, db,adodb,Buttons, ExtCtrls;

type
  TfrmKembaliKas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    btnclose: TBitBtn;
    gbdata: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbnoref: TDBEdit;
    dbjmluang: TDBEdit;
    dbketerangan: TDBMemo;
    dbcashier: TDBEdit;
    dbpic: TDBEdit;
    dbtanggal: TDBEdit;
    btnNew: TBitBtn;
    btnsave: TBitBtn;
    btncancel: TBitBtn;
    dbiskembali: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKembaliKas: TfrmKembaliKas;

implementation

uses unDm,unUtama;

{$R *.dfm}

procedure TfrmKembaliKas.FormActivate(Sender: TObject);
begin
 if dm.dsetuangkeluar.Active = false then dm.dsetuangkeluar.Active := true;
end;

procedure TfrmKembaliKas.btncloseClick(Sender: TObject);
begin
 close;
end;

procedure TfrmKembaliKas.btnNewClick(Sender: TObject);
begin
 dm.dsetuangkeluar.Append;
 dbnoref.SetFocus;
 btnsave.Visible := true;
 btnCancel.Visible := true;
 dbtanggal.Text := dateToStr(date());
 dbiskembali.Text := '1';
 dbcashier.Text := isCurrentuser;
end;

procedure TfrmKembaliKas.btnsaveClick(Sender: TObject);
begin
 if Messagedlg('Simpan Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dsetuangkeluar.UpdateBatch(arAll);
   btnsave.Visible := false;
   btnCancel.Visible := false;
 end;
end;

procedure TfrmKembaliKas.btncancelClick(Sender: TObject);
begin
  if Messagedlg('Batalkan Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dsetuangkeluar.CancelBatch(arAll);
   btnsave.Visible := false;
   btnCancel.Visible := false;
 end;
end;

end.

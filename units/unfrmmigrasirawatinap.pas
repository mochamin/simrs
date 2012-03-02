unit unfrmmigrasirawatinap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls,db,adodb, Mask, ExtCtrls, Grids, DBGrids, Buttons;

type
  TfrmMigrasiRawatInap = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    dbnama: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbnoreg: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbumur: TDBEdit;
    Label5: TLabel;
    dbumurbulan: TDBEdit;
    Label6: TLabel;
    dbalamat: TDBMemo;
    GroupBox2: TGroupBox;
    gridviewpasienpoli: TDBGrid;
    Label11: TLabel;
    txtcarinama: TEdit;
    GroupBox6: TGroupBox;
    BitBtn1: TBitBtn;
    dbnorm: TDBEdit;
    Label12: TLabel;
    btnMigrasi: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure txtcarinamaChange(Sender: TObject);
    procedure btnMigrasiClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMigrasiRawatInap: TfrmMigrasiRawatInap;

implementation

uses unDm, unFrmRawatInap,unutama;

{$R *.dfm}

procedure TfrmMigrasiRawatInap.BitBtn1Click(Sender: TObject);
var noreg :string;
begin
 noreg := dbnoreg.Text;
 with dm.dsetViewMigrasi do
 begin
   Requery;
   locate('lpnoreg',noreg,[loCaseInsensitive]);
 end;

end;

procedure TfrmMigrasiRawatInap.txtcarinamaChange(Sender: TObject);
begin
 with dm.dsetviewmigrasi do
 begin
   locate('psnama',txtcarinama.Text,[loPartialKey]);
 end;
end;

procedure TfrmMigrasiRawatInap.btnMigrasiClick(Sender: TObject);
begin
if MessageDlg('Pasien Akan Didaftarkan Ke Rawat Inap?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
 kodelayananpoli:=dbnoreg.Text;
 frmRawatInap.Show;
 frmRAwatinap.btnNew.Click;
 frmRawatInap.txtNoRm.Text := dbnorm.Text;
 frmRawatInap.dbNamaPasien.Caption := dbnama.Text;
 frmRAwatInap.dbUsia.Caption := dbumur.Text;
 frmRawatInap.dbAlamatPasien.Caption := dbalamat.Text;
 frmRawatInap.txtKodeKamar.SetFocus;
 //frmMigrasiRawatInap.Close;
end; 
end;

procedure TfrmMigrasiRawatInap.FormActivate(Sender: TObject);
begin
 if dm.dsetViewMigrasi.Active = false then dm.dsetViewMigrasi.Active := true;
 isPendingMigrasi:=1;

end;

end.

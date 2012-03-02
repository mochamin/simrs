unit unfrmviewpolinonmigrasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, db,adodb,ExtCtrls, DBCtrls, Mask,
  Buttons;

type
  Tfrmviewpolinonmigrasi = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    gridViewPasienpoli: TDBGrid;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbnoreg: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    GroupBox4: TGroupBox;
    BitBtn1: TBitBtn;
    Label7: TLabel;
    txtcarinama: TEdit;
    BitBtn2: TBitBtn;
    procedure gridViewPasienpoliDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure txtcarinamaChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
   
  public
    { Public declarations }
  end;

var
  frmviewpolinonmigrasi: Tfrmviewpolinonmigrasi;

implementation

uses unDm;

{$R *.dfm}


procedure Tfrmviewpolinonmigrasi.gridViewPasienpoliDblClick(
  Sender: TObject);
begin
if MessageDlg('Migrasi Ke Rawat Inap ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin

  with dm.dsetLayananPoli do
  begin
    active:=false;
    commandType := cmdText;
    commandText := 'select * from talayananpoli '+
    'where lpnoreg like (:noreg) ';
    parameters.ParamByName('noreg').Value := dbnoreg.Text;
    active:=true;
    edit;
    fields.FieldByName('lpismigrasi').AsInteger := 1;
    post;
    updatebatch(arAll);
  end;
 // refreshviewpasienpoli;
end;//end of messagedlg
end;

procedure Tfrmviewpolinonmigrasi.FormActivate(Sender: TObject);
begin
 if dm.dsetViewPasienPoli.Active = false then dm.dsetViewPasienPoli.Active := true;
 if dm.dsetLayananPoli.Active = false then dm.dsetLayananPoli.Active := true;
 // dm.dsetViewPasienPoli.Requery();
end;

procedure Tfrmviewpolinonmigrasi.BitBtn1Click(Sender: TObject);
begin
  dm.dsetViewPasienPoli.Active := false;
  dm.dsetViewPasienPoli.Active := true;
end;

procedure Tfrmviewpolinonmigrasi.txtcarinamaChange(Sender: TObject);
begin
 with dm.dsetViewPasienPoli do
 begin
   locate('psnama',txtcarinama.Text,[loPartialKey]);
 end;
end;

procedure Tfrmviewpolinonmigrasi.BitBtn2Click(Sender: TObject);
begin
 if MessageDlg('Migrasi Ke Rawat Inap ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin

  with dm.dsetMigrasi do
  begin
    active:=false;
    commandType := cmdText;
    commandText := 'select * from talayananpoli '+
    'where lpnoreg like (:noreg) ';
    parameters.ParamByName('noreg').Value := dbnoreg.Text;
    active:=true;
    edit;
    fields.FieldByName('lpismigrasi').AsInteger := 1;
    post;
    updatebatch(arAll);
    showmessage('mirgrasi sukses...');
  end;
  //refreshviewpasienpoli;
end;//end of messagedlg 
end;

end.

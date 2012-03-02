unit unfrmtarifdokter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, adodb,db,Grids, DBGrids, Buttons;

type
  Tfrmtarifdokter = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gbdata: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    btnNew: TBitBtn;
    gbtarif: TGroupBox;
    btnEdit: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    BitBtn1: TBitBtn;
    grid: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dbTarifKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmtarifdokter: Tfrmtarifdokter;

implementation

uses unDm;

{$R *.dfm}

procedure Tfrmtarifdokter.btnNewClick(Sender: TObject);
begin
 gbtarif.Enabled := true;
// cmbDokter.SetFocus;
 btnSave.Visible := true;
 btnCancel.Visible := true;
 grid.SetFocus;
 dm.dsetTarifDokter.Append;
end;

procedure Tfrmtarifdokter.btnEditClick(Sender: TObject);
begin
 gbdata.Enabled := true;
 gbtarif.Enabled := true;
 //cmbDokter.SetFocus;
 btnSave.Visible := true;
 btnCancel.Visible := true;

  with dm.dsetTarifDokter do
 begin
   open;
   edit;
 end;
end;

procedure Tfrmtarifdokter.btnSaveClick(Sender: TObject);
begin
if MessageDlg('Simpan Record?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
begin
  dm.dsetTarifDokter.UpdateBatch(arCurrent);
  btnSave.Visible := false;
  btnCancel.Visible := false;
  gbtarif.Enabled := false;
  gbdata.Enabled := false;
end;

end;

procedure Tfrmtarifdokter.btnCancelClick(Sender: TObject);
begin
if MessageDlg('Cancel Record?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
begin
  dm.dsetTarifDokter.CancelBatch(arAll);
  btnSave.Visible := false;
  btnCancel.Visible := false;
  gbdata.Enabled := false;
end;
end;

procedure Tfrmtarifdokter.dbTarifKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9',#8]) then
 begin
   key:=#0;
 end;
end;

procedure Tfrmtarifdokter.BitBtn1Click(Sender: TObject);
begin
  with dm.dsetTarifDokter do
  begin
  active:=false;
  commandType := cmdText;
  commandText := 'select * from tatarifdokter ';
  active:=true;
  end;
end;

procedure Tfrmtarifdokter.FormActivate(Sender: TObject);
begin
 if dm.dsetdokter.Active      = false then dm.dsetdokter.Active:=true;
 if dm.dsetTarifDokter.Active = false then dm.dsetTarifDokter.Active := true;
end;

end.

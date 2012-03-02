unit unfrmtariblab;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB,adodb, DBTables, Mask, ExtCtrls, Grids, DBGrids, Buttons;

type
  Tfrmtariflab = class(TForm)
    ScrollBox: TScrollBox;
    Panel1: TPanel;
    Panel2: TPanel;
    gbdata: TGroupBox;
    Edittlkode: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edittlitemlab: TDBEdit;
    Label3: TLabel;
    Edittltarif: TDBEdit;
    GroupBox2: TGroupBox;
    btnnew: TBitBtn;
    btnEdit: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    GroupBox1: TGroupBox;
    griditemlab: TDBGrid;
    Label4: TLabel;
    cari: TEdit;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnnewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cariChange(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure griditemlabTitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmtariflab: Tfrmtariflab;

implementation

uses unDm;

{$R *.DFM}

procedure Tfrmtariflab.FormCreate(Sender: TObject);
begin
  //Table1.Open;
end;

procedure Tfrmtariflab.btnnewClick(Sender: TObject);
begin
 btnDelete.Visible := false;
 btnSave.Visible := true;
 btnCancel.Visible := true;
 gbData.Enabled := true;
 edittlkode.SetFocus;
 dm.dsettariflab.Append;
end;

procedure Tfrmtariflab.btnEditClick(Sender: TObject);
begin
 btnDelete.Visible := false;
 btnSave.Visible := true;
 btnCancel.Visible := true;
  gbData.Enabled := true;
  dm.dsettariflab.edit;
  edittlkode.SetFocus;
end;

procedure Tfrmtariflab.btnSaveClick(Sender: TObject);
begin
 if messageDlg('Simpan Data?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dsettariflab.Post;
   dm.dsettariflab.UpdateBatch(arAll);
   gbData.Enabled := false;
   btnSave.Visible := false;
   btnCancel.Visible := false;
   btnDelete.Visible := true;
 end;
end;

procedure Tfrmtariflab.btnCancelClick(Sender: TObject);
begin
  if messageDlg('Batalkan Penyimpanan?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dsettariflab.CancelBatch(arAll);
   gbData.Enabled := false;
   btnSave.Visible := false;
   btnCancel.Visible := false;
   btnDelete.Visible := true;
 end;
end;

procedure Tfrmtariflab.cariChange(Sender: TObject);
begin
 dm.dsettariflab.Locate('tlitemlab',cari.Text,[loPartialKey]);
end;

procedure Tfrmtariflab.btnDeleteClick(Sender: TObject);
begin
 if messagedlg('Hapus Tarif Lab?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dsettariflab.Delete;
  // dm.dsettariflab.Post;
   dm.dsettariflab.UpdateBatch(arAll);
 end;
end;

procedure Tfrmtariflab.griditemlabTitleClick(Column: TColumn);
begin
  with dm.dsettariflab do
  begin
    active:=false;
    commandType := cmdText;
    commandText := 'select * from tatariflab '+
    'order by tlitemlab asc ';
    active:=true;
  end;
end;

procedure Tfrmtariflab.BitBtn1Click(Sender: TObject);
begin
  with dm.dsettariflab do
  begin
    active:=false;
    commandType := cmdText;
    commandText := 'select * from tatariflab '+
    'order by tlitemlab asc ';
    active:=true;
  end;
end;

procedure Tfrmtariflab.FormActivate(Sender: TObject);
begin
 if dm.dsettariflab.Active = false then dm.dsetTariflab.Active := true;
end;

end.
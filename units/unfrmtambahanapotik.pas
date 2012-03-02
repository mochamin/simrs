unit unfrmtambahanapotik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, adodb,db,DBGrids, Mask, DBCtrls, ExtCtrls;

type
  Tfrmtambahanapotik = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gbData: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    btnnew: TBitBtn;
    btnEdit: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnnewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmtambahanapotik: Tfrmtambahanapotik;

implementation

uses unDm;

{$R *.dfm}

procedure Tfrmtambahanapotik.btnnewClick(Sender: TObject);
begin
gbdata.Enabled := true;
 btnSave.Visible := true;
 btnCancel.Visible := true;
 dm.dsettambahbiayaapotik.Open;
 dm.dsettambahbiayaapotik.append;
end;

procedure Tfrmtambahanapotik.btnEditClick(Sender: TObject);
begin
 gbdata.Enabled := true;
  btnSave.Visible := true;
 btnCancel.Visible := true;
  dm.dsettambahbiayaapotik.Open;
  dm.dsettambahbiayaapotik.edit;
end;

procedure Tfrmtambahanapotik.btnSaveClick(Sender: TObject);
begin
 if messageDlg('Simpan Record?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
 begin
    dm.dsettambahbiayaapotik.UpdateBatch(arAll);
    btnSave.Visible := false;
    btnCancel.Visible := false;
    gbdata.Enabled := false;
 end;
end;

procedure Tfrmtambahanapotik.btnCancelClick(Sender: TObject);
begin

  if messageDlg('Cancel Record?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dsettambahbiayaapotik.CancelBatch(arAll);
    btnSave.Visible := false;
    btnCancel.Visible := false;
    gbdata.Enabled := false;
 end;
end;

procedure Tfrmtambahanapotik.FormActivate(Sender: TObject);
begin
 if dm.dsettambahbiayaapotik.Active=false then dm.dsettambahbiayaapotik.Active:=true;
end;

end.

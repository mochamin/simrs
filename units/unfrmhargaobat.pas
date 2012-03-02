unit unfrmhargaobat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, adodb,db,Mask, Grids, DBGrids;

type
  Tfrmhargaobat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gbdata: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    BitBtn1: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    txtCariObat: TEdit;
    dbhargajual: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    dbhargabeli: TDBEdit;
    Label5: TLabel;
    procedure txtCariObatChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmhargaobat: Tfrmhargaobat;

implementation

uses unDm;

{$R *.dfm}

procedure Tfrmhargaobat.txtCariObatChange(Sender: TObject);
begin
 dm.dSetObat.Locate('obnama',txtCariObat.Text,[loPartialKey]);
end;

procedure Tfrmhargaobat.BitBtn1Click(Sender: TObject);
begin
 gbData.Enabled := true;
 dm.dSetObat.Edit;
 dbhargabeli.SetFocus;
 btnSave.Visible := true;
 btnCancel.Visible := true;
end;

procedure Tfrmhargaobat.btnSaveClick(Sender: TObject);
begin
 if messageDlg('Simpan Setting?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dSetObat.UpdateBatch(arAll);
   dm.dSetObat.Active := false;
   dm.dSetObat.Active := true;
    btnSave.Visible := false;
   btnCancel.Visible := false;
   gbData.Enabled := false;
 end;
end;

procedure Tfrmhargaobat.btnCancelClick(Sender: TObject);
begin
  if messageDlg('Batalkan Setting?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dSetObat.CancelBatch(arAll);
   btnSave.Visible := false;
   btnCancel.Visible := false;
   gbData.Enabled := false;
 end;
end;

procedure Tfrmhargaobat.FormActivate(Sender: TObject);
begin
 if dm.dSetObat.Active = false then dm.dSetObat.Active := true;
  txtCariObat.SetFocus;
end;

end.

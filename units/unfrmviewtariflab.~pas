unit unfrmviewtariflab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ToolWin,db,adodb, ComCtrls;

type
  Tfrmviewtariflab = class(TForm)
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    grid: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    cari: TEdit;
    procedure cariChange(Sender: TObject);
    procedure gridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cariKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure isiToRegistrasi;
  public
    { Public declarations }
  end;

var
  frmviewtariflab: Tfrmviewtariflab;

implementation

uses unDm, unFrmRegLab;

{$R *.dfm}

procedure TfrmViewtariflab.isiToRegistrasi;
begin
    frmReglab.dbkodeitem.Text := frmReglab.dbkodeitem.Text+grid.Fields[0].Value+';';

   if length(frmRegLab.itemdetail.Text)=0 then
   begin
    frmRegLab.itemdetail.Text := frmRegLab.itemdetail.Text+grid.Fields[1].Value;
   end else frmRegLab.itemdetail.Text := frmRegLab.itemdetail.Text+','+grid.Fields[1].Value;
    close;
end;

procedure Tfrmviewtariflab.cariChange(Sender: TObject);
begin
 dm.dsettariflab.Locate('tlitemlab',cari.Text,[loPartialKey]);
end;

procedure Tfrmviewtariflab.gridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key=vk_return then
 begin
   isiToRegistrasi;
 end;
end;

procedure Tfrmviewtariflab.cariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
 begin
   isiToRegistrasi;
 end;
end;

procedure Tfrmviewtariflab.FormActivate(Sender: TObject);
begin
if  dm.dsettariflab.Active = false then dm.dsettariflab.Active := true; 
  cari.SetFocus;
  cari.Clear;
end;

end.

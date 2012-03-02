unit unfrmviewreglab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids,adodb,db, DBGrids, ExtCtrls;

type
  TfrmViewRegLab = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    grid: TDBGrid;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    cari: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure cariChange(Sender: TObject);
    procedure cariKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure isiToLab;
  public
    { Public declarations }
  end;

var
  frmViewRegLab: TfrmViewRegLab;

implementation

uses unDm, unfrmhasillab, unFrmCetakLab,unUtama, unfrmcetakkwitansilab;

{$R *.dfm}

procedure TfrmViewRegLab.isiToLab;
begin
   frmHasilLab.notransaksi.Text:= grid.Fields[0].Value;
   close;

   if isPrintLab=1 then
   begin
     frmCetakLab.notransaksi.Text := grid.Fields[0].Value;
     close;
   end;

   if isCetakKwitansiLab=1 then
   begin
     frmCetakKwitansiLab.noregistrasi.Text := grid.Fields[0].Value;
     close;
   end;


end;

procedure TfrmViewRegLab.FormActivate(Sender: TObject);
begin
 if dm.dsetviewreglab.Active = false then dm.dsetviewreglab.Active:=true;
 cari.SetFocus;
 cari.Clear;
 dm.dsetviewreglab.Requery();
end;

procedure TfrmViewRegLab.cariChange(Sender: TObject);
var data : TADODataSet;
begin
   data := dm.dsetviewreglab;
   data.Locate('lbnama',cari.Text,[loPartialKey]);
end;

procedure TfrmViewRegLab.cariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
 vk_escape : close;
 vk_return  : isiToLab;
 end;
end;

procedure TfrmViewRegLab.gridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 case key of
 vk_escape : close;
 vk_return  : isiToLab;
 end;
end;

end.

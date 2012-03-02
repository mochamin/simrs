unit unfrmviewpenyakit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids,adodb,db, DBGrids, ExtCtrls;

type
  TfrmViewPenyakit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    gridpenyakit: TDBGrid;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    cari: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure cariChange(Sender: TObject);
    procedure cariKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridpenyakitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridpenyakitKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
   procedure isiToDiagnosa;
  public
    { Public declarations }
  end;

var
  frmViewPenyakit: TfrmViewPenyakit;

implementation

uses unDm, unfrmdiagnosa;

{$R *.dfm}

procedure TfrmViewPenyakit.isiToDiagnosa;
begin
 frmDiagnosa.grid.DataSource.Edit;
 frmDiagnosa.grid.Fields[0].Value := gridPenyakit.Fields[0].Value;
 frmDiagnosa.grid.Fields[1].Value := gridPenyakit.Fields[1].Value;
 close;
end;

procedure TfrmViewPenyakit.FormActivate(Sender: TObject);
begin
 cari.SetFocus;
 cari.Clear;
end;

procedure TfrmViewPenyakit.cariChange(Sender: TObject);
var data : TADODataSet;
begin
   data := dm.dsetviewpenyakit;
   data.Locate('jpdescription',cari.Text,[loPartialKey]);
end;

procedure TfrmViewPenyakit.cariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var cf   : integer; //cf = current Field
    data : TADODataSet;
    grid : TDBGrid;
begin
 data := dm.dsetviewpenyakit;
 grid := gridPenyakit;
 if grid.SelectedIndex=0 then
 begin
     cf:=1;
 end else cF := grid.SelectedIndex;

  case key of
  vk_up : begin
           grid.SetFocus;
           data.Prior;
          end;
  vk_down : begin
           grid.SetFocus;
           data.Next;
          end;
  vk_right : begin
            grid.SetFocus;
            grid.fields[cf+1].FocusControl;
            end;
 vk_left : begin
            grid.SetFocus;
            grid.fields[cf-1].FocusControl;
            end;
 vk_return : isiToDiagnosa;            
 vk_escape : close;            
  end;
end;


procedure TfrmViewPenyakit.gridpenyakitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 case key of
 vk_escape : close;
  vk_return : isiToDiagnosa;
 end;
end;

procedure TfrmViewPenyakit.gridpenyakitKeyPress(Sender: TObject; var Key: Char);
begin
 if (key in['a'..'z','A'..'Z',#8]) then
begin
  cari.SetFocus;
  cari.Clear;
  cari.text:=key;
  cari.SelStart :=1;
end;  
end;

end.

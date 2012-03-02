unit unfrmviewpolidiag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids,adodb,db, DBGrids, ExtCtrls, Buttons;

type
  Tfrmviewpolidiag = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    gridpasien: TDBGrid;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    cari: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    btnRefresh: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure cariChange(Sender: TObject);
    procedure cariKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridpasienKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridpasienKeyPress(Sender: TObject; var Key: Char);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    procedure isiToDiagnosa;
  public
    { Public declarations }
  end;

var
  frmviewpolidiag: Tfrmviewpolidiag;

implementation

uses unDm, unfrmdiagnosa;

{$R *.dfm}

procedure Tfrmviewpolidiag.isiToDiagnosa;
begin
   dm.dsetdiagnosa.Append;
   frmdiagnosa.dbnodiagnosa.Text := gridPasien.Fields[0].Value;
   frmdiagnosa.dbnama.Text       := gridPasien.Fields[1].Value;
   frmDiagnosa.dbtgl.Text        := gridPasien.Fields[6].Value;
   frmDiagnosa.dbjk.Text         := gridPasien.Fields[2].Value;
   frmDiagnosa.dbusia.Text       := gridPasien.Fields[3].Value;
   frmDiagnosa.dbalamat.Text     := trim(gridPasien.Fields[4].Value)
                                    +','+trim(gridPasien.Fields[5].Value);
   close;
end;

procedure Tfrmviewpolidiag.FormActivate(Sender: TObject);
begin
 cari.SetFocus;
 cari.Clear;
end;

procedure Tfrmviewpolidiag.cariChange(Sender: TObject);
var data : TADODataSet;
begin
   data := dm.dsetviewpolidiag;
   data.Locate('psnama',cari.Text,[loPartialKey]);
end;

procedure Tfrmviewpolidiag.cariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var cf   : integer; //cf = current Field
    data : TADODataSet;
    grid : TDBGrid;
begin
 grid := gridPasien;
 data:=dm.dsetviewpolidiag;
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


procedure Tfrmviewpolidiag.gridpasienKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 case key of
 vk_escape : close;
 vk_return : isiToDiagnosa;
 end;
end;

procedure Tfrmviewpolidiag.gridpasienKeyPress(Sender: TObject; var Key: Char);
begin
 if (key in['a'..'z','A'..'Z',#8]) then
begin
  cari.SetFocus;
  cari.Clear;
  cari.text:=key;
  cari.SelStart :=1;
end;  
end;

procedure Tfrmviewpolidiag.btnRefreshClick(Sender: TObject);
begin
 dm.dsetviewpolidiag.Requery();
end;

end.

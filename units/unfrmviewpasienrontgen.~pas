unit unfrmviewpasienrontgen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids,adodb,db, DBGrids, ExtCtrls;

type
  TfrmViewPasienRontgen = class(TForm)
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
    procedure gridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewPasienRontgen: TfrmViewPasienRontgen;

implementation

uses unDm, frmbillingrontgen;

{$R *.dfm}

procedure TfrmViewPasienRontgen.FormActivate(Sender: TObject);
begin
 if dm.dsetviewpasienrontgen.Active = false then dm.dsetviewpasienrontgen.Active := true;
 dm.dsetviewpasienrontgen.Requery;
 cari.SetFocus;
 cari.Clear;
end;

procedure TfrmViewPasienRontgen.cariChange(Sender: TObject);
var data : TADODataSet;
begin
   data:=dm.dsetviewpasienrontgen;
   data.Locate('lrnama',cari.Text,[loPartialKey]);
end;

procedure TfrmViewPasienRontgen.cariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var cf   : integer; //cf = current Field
    data : TADODataSet;

begin
 //grid := grid;
 data:=dm.dsetviewpasienrontgen;
 if grid.SelectedIndex=0 then
 begin
     cf:=1;
 end else cF := grid.SelectedIndex;

  case key of

 vk_down  : begin
             grid.SetFocus;
             data.Next;
            end;
 vk_up    : begin
            grid.SetFocus;
            data.Prior;
            end;
 vk_right : begin
            grid.SetFocus;
            grid.fields[cf+1].FocusControl;
            end;
 vk_left : begin
            grid.SetFocus;
            grid.fields[cf-1].FocusControl;
            end;
 vk_return :begin
             frmbillrontgen.notransaksi.Text := grid.Fields[1].Value;
             close;
             end;
 vk_escape : close;
  end;
end;


procedure TfrmViewPasienRontgen.gridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 case key of
 vk_escape : close;
 vk_return : begin
             frmBillrontgen.notransaksi.Text:=grid.Fields[1].Value;
             close;
             end;
 end;
end;

procedure TfrmViewPasienRontgen.gridKeyPress(Sender: TObject; var Key: Char);
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

unit gudangun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids;

type
  Tgudangfrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnsave: TBitBtn;
    btncancel: TBitBtn;
    btnnew: TBitBtn;
    btnedit: TBitBtn;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    procedure btnnewClick(Sender: TObject);
    procedure btneditClick(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  gudangfrm: Tgudangfrm;

implementation

uses dmzun,db;

{$R *.dfm}

procedure Tgudangfrm.btnnewClick(Sender: TObject);
begin
 with  dmz.gudangdset do
 begin
    append;
 end;
 dbedit1.SetFocus;
    btnnew.Visible :=false;
    btnedit.Visible := false;
end;

procedure Tgudangfrm.btneditClick(Sender: TObject);
begin
  dmz.gudangdset.Edit;
  dbedit1.SetFocus;
   btnnew.Visible :=false;
    btnedit.Visible := false;
end;

procedure Tgudangfrm.btnsaveClick(Sender: TObject);
begin
 if messagedlg('Simpan Data?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
    dmz.gudangdset.Post;
    dmz.gudangdset.ApplyUpdates;
 end;
end;

procedure Tgudangfrm.btncancelClick(Sender: TObject);
begin
  if messagedlg('Batalkan Data?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
    dmz.gudangdset.Post;
    dmz.gudangdset.CancelUpdates;
    btnnew.Visible := true;
    btnedit.Visible := true;
      btnnew.Visible := true;
    btnedit.Visible := true;
 end;
end;

procedure Tgudangfrm.DBEdit1Change(Sender: TObject);
begin
  if dmz.gudangdset.State in [dsEdit,dsInsert] then
  begin
     btnnew.Visible := false;
     btnedit.Visible := false;
  end;
end;

procedure Tgudangfrm.FormActivate(Sender: TObject);
begin
 if dmz.gudangdset.Active = false then dmz.gudangdset.Active := true;
end;

end.

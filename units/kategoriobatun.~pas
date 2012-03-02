unit kategoriobatun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids;

type
  Tkategoriobatfrm = class(TForm)
    Panel1: TPanel;
    kategoriobatfrm: TPanel;
    DBGrid1: TDBGrid;
    dbnama: TDBEdit;
    Label1: TLabel;
    btnnew: TBitBtn;
    btnedit: TBitBtn;
    btnsimpan: TBitBtn;
    btnbatal: TBitBtn;
    procedure btnnewClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure btnbatalClick(Sender: TObject);
    procedure btneditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kategoriobatfrm: Tkategoriobatfrm;

implementation

uses dmzun;

{$R *.dfm}

procedure Tkategoriobatfrm.btnnewClick(Sender: TObject);
begin
 dmz.kategoridset.Append;
 dbnama.SetFocus;
 btnnew.Visible := false;
 btnedit.Visible := false;
end;

procedure Tkategoriobatfrm.btnsimpanClick(Sender: TObject);
begin
if messagedlg('Simpan Data ini?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
begin
 dmz.kategoridset.Post;
 dmz.kategoridset.ApplyUpdates;
 btnnew.Visible := true;
 btnedit.Visible := true;
end;
end;

procedure Tkategoriobatfrm.btnbatalClick(Sender: TObject);
begin
if messagedlg('Batalkan perubahan?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
begin
  dmz.kategoridset.CancelUpdates;
  btnnew.Visible := true;
 btnedit.Visible := true;
 end;
end;

procedure Tkategoriobatfrm.btneditClick(Sender: TObject);
begin
 dmz.kategoridset.edit;
 dbnama.SetFocus;
 btnnew.Visible := false;
 btnedit.Visible := false;
end;

end.

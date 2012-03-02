unit beliapotikun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  Tbeliapotikfrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    btnnew: TBitBtn;
    btnbatal: TBitBtn;
    btnsimpan: TBitBtn;
    procedure btnnewClick(Sender: TObject);
    procedure btnbatalClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  beliapotikfrm: Tbeliapotikfrm;

implementation

{$R *.dfm}

procedure Tbeliapotikfrm.btnnewClick(Sender: TObject);
begin
  btnsimpan.Visible := true;
  btnbatal.Visible := true;
end;

procedure Tbeliapotikfrm.btnbatalClick(Sender: TObject);
begin
  btnsimpan.Visible := false;
  btnbatal.Visible := false;
end;

procedure Tbeliapotikfrm.btnsimpanClick(Sender: TObject);
begin
  btnsimpan.Visible := false;
  btnbatal.Visible  := false;
end;

end.

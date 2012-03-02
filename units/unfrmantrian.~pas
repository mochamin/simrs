unit unfrmantrian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, SMDBGrid;

type
  Tfrmantrian = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SMDBGrid1: TSMDBGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmantrian: Tfrmantrian;

implementation

uses unDm;

{$R *.dfm}

procedure Tfrmantrian.BitBtn1Click(Sender: TObject);
begin
 dm.dsetAntrian.Refresh;
end;

procedure Tfrmantrian.FormActivate(Sender: TObject);
begin
  if dm.dsetAntrian.Active=false then dm.dsetAntrian.Active:=true;
  if dm.dSetPasien.Active =false then dm.dSetPasien.Active := true;

end;

end.

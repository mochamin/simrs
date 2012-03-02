unit unfrmViewPasienlab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  TfrmViewPasienLab = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewPasienLab: TfrmViewPasienLab;

implementation

uses unDm, unFrmRegLab;

{$R *.dfm}

procedure TfrmViewPasienLab.DBGrid1DblClick(Sender: TObject);
begin
  frmRegLab.ShowModal;
end;

procedure TfrmViewPasienLab.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
  frmRegLab.ShowModal;
 end;
end;

procedure TfrmViewPasienLab.BitBtn1Click(Sender: TObject);
begin
 frmreglab.ShowModal;
end;

procedure TfrmViewPasienLab.FormActivate(Sender: TObject);
begin
 dm.dsetviewpasienlab.Requery();
end;

end.

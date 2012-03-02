unit frmviewbiayatambahan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  Tfrmviewtambahan = class(TForm)
    GroupBox1: TGroupBox;
    gridtambahan: TDBGrid;
    procedure gridtambahanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure isiToApotik;
  public
    { Public declarations }
  end;

var
  frmviewtambahan: Tfrmviewtambahan;

implementation

uses unfrmApotek, unDm;

{$R *.dfm}

procedure Tfrmviewtambahan.isiToApotik;
begin
    frmApotek.gridObat.DataSource.Edit;
    frmApotek.gridObat.Fields[0].Value := '-';
    frmApotek.gridObat.Fields[1].Value :='Biaya Racik&Bngks';
    frmApotek.gridObat.Fields[2].Value :='-';
    frmApotek.gridObat.Fields[3].Value := gridTambahan.Fields[1].Value;
    frmApotek.gridObat.Fields[4].Value := 1;
    dm.dsetApotikDEtail.Append;
    frmviewtambahan.Close;
end;

procedure Tfrmviewtambahan.gridtambahanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if key=vk_return then
begin
  isiToApotik;
end;

 if key=vk_escape then
 begin
  frmviewtambahan.Close;
 end;
end;

end.

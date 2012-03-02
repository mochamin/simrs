unit unFrmViewBed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids;

type
  TfrmViewBed = class(TForm)
    Panel1: TPanel;
    Image2: TImage;
    Label15: TLabel;
    Panel2: TPanel;
    gridViewKelas: TDBGrid;
    Panel3: TPanel;
    gbButton: TGroupBox;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gridViewKelasDblClick(Sender: TObject);
    procedure gridViewKelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewBed: TfrmViewBed;

implementation

uses unFrmAddBed, unEditKamar, unFrmService, unFrmItemLab,unUtama, unDm;

{$R *.dfm}

procedure TfrmViewBed.BitBtn3Click(Sender: TObject);
begin
  frmAddBed.ShowModal;
end;

procedure TfrmViewBed.FormActivate(Sender: TObject);
begin
 if dm.dSetKamar.Active = false then dm.dSetKamar.Active := true;
// frmAddBed.refreshKamar;
 if (isLab=1) or (isService=1) then
 begin
  gbButton.visible := false;
 end else gbButton.visible := true;
end;

procedure TfrmViewBed.gridViewKelasDblClick(Sender: TObject);
begin
 frmEditKamar.ShowModal;
end;

procedure TfrmViewBed.gridViewKelasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
    if isService=1 then
    begin
      //frmService.txtKelas.Text := gridViewKelas.Fields[0].Value;
      isService:=0;
      frmViewBed.Close;

    end else
     if isLab=1 then
     begin
       frmItemLab.dbKodeKelas.Text := gridViewKelas.Fields[0].Value;
       frmViewBed.Close;
       isLab:=0;
     end
 end;
end;

end.

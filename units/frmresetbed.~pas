unit frmresetbed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls,db,adodb, Buttons;

type
  Tresetkamarfrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gridreset: TDBGrid;
    btnsave: TBitBtn;
    btncancel: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  resetkamarfrm: Tresetkamarfrm;

implementation

uses unDm,unfungsi;

{$R *.dfm}

procedure Tresetkamarfrm.FormActivate(Sender: TObject);
begin
 if dm.dSetKamar.Active = false
 then dm.dSetKamar.Active := true;
end;

procedure Tresetkamarfrm.btnsaveClick(Sender: TObject);
begin
   if MessageDlg('Simpan Perubahan?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
     dm.dsetresetkamar.UpdateBatch(arAll);
   end;

   dm.dsetViewKamar.Active := false;
   dm.dsetViewKamar.Active := true;
   showMessage('Jumlah Bed telah direset...');
end;

procedure Tresetkamarfrm.btncancelClick(Sender: TObject);
begin
  if gridreset.DataSource.State in [dsEdit] then
 begin
   if MessageDlg('Batalkan Perubahan?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
     dm.dsetresetkamar.CancelBatch(arAll);
   end;
 end;
end;

end.

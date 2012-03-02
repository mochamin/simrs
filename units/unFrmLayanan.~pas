unit unFrmLayanan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmLayanan = class(TForm)
    txtKodeDokter: TEdit;
    txtNamaDokter: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure txtKodeDokterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLayanan: TfrmLayanan;

implementation

uses unFrmViewDokter,unUtama;

{$R *.dfm}

procedure TfrmLayanan.FormActivate(Sender: TObject);
begin
 isLayanan :=1;
end;

procedure TfrmLayanan.txtKodeDokterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
  VK_RETURN : frmViewDokter.ShowModal;
  end;
end;

procedure TfrmLayanan.FormDeactivate(Sender: TObject);
begin
  isLayanan := 0;
end;

end.

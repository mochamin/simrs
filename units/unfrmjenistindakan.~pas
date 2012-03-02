unit unfrmjenistindakan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmJenisTindakan = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cbtindakan: TComboBox;
    Label1: TLabel;
    procedure cbtindakanClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbtindakanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJenisTindakan: TfrmJenisTindakan;

implementation

{$R *.dfm}

uses unUtama, unFrmViewDokter;

procedure TfrmJenisTindakan.cbtindakanClick(Sender: TObject);
begin
  case cbtindakan.ItemIndex of
  0 : begin
      isTindakanSederhana :=1;
      frmViewDokter.ShowModal;
      close;
      end;
  1 : begin
      isTindakanSedang    :=1;
      frmViewDokter.ShowModal;
      close;
      end;
  2 : begin
      isTindakanBesar     :=1;
      frmViewDokter.ShowModal;
      close;
      end;

  3 : Begin
      isTindakanKhusus    :=1;
      frmViewDokter.ShowModal;
      close;
      end;
  end;
end;

procedure TfrmJenisTindakan.FormActivate(Sender: TObject);
begin
 cbtindakan.SetFocus;
end;

procedure TfrmJenisTindakan.cbtindakanKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case key of
 vk_escape : Close;
 end;
end;

end.

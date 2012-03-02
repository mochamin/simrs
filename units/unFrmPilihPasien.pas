unit unFrmPilihPasien;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmPilihPasien = class(TForm)
    cmbPilihPasien: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure cmbPilihPasienClick(Sender: TObject);
    procedure cmbPilihPasienKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbPilihPasienKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPilihPasien: TfrmPilihPasien;

implementation

uses unFrmLab, unFrmAddPasien, unDm,unUtama, unFrmItemLab;

{$R *.dfm}

procedure TfrmPilihPasien.cmbPilihPasienClick(Sender: TObject);
begin
 case cmbPilihPasien.ItemIndex of
 0 : begin
     isLabRawatInap :=1;
     Close;

     end;
 1 : begin
     isLabPoli :=1;
     Close;
     end;
 2 : begin
     isLabLuar :=1;
     Close;
     end;
 end;




end;

procedure TfrmPilihPasien.cmbPilihPasienKeyPress(Sender: TObject;
  var Key: Char);
begin
 key:=#0;
end;

procedure TfrmPilihPasien.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then
  begin
    frmPilihPasien.Close;
    frmItemLab.Close;
  end;
end;

procedure TfrmPilihPasien.cmbPilihPasienKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_escape then
  begin
    frmPilihPasien.Close;
    //frmLab.Close;
    frmLab.btnCancel.Click;
  end;
end;

end.

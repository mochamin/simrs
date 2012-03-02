unit uneditobat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, db,adodb,Mask;

type
  TfrmEditObat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gbdata: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    Button1: TButton;
    dbkategori: TDBLookupComboBox;
    Label5: TLabel;
    dbexpired: TDBEdit;
    Label6: TLabel;
    dbrak: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditObat: TfrmEditObat;

implementation

uses unDm, unfrmsatuanobat;

{$R *.dfm}

procedure TfrmEditObat.BitBtn1Click(Sender: TObject);
begin
 if messageDlg('Simpan Perubahan?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   if dm.dsetObatView.Active = false then dm.dsetObatView.Active := true;
   dm.dSetObatvIEW.UpdateBatch(arAll);
   showMessage('data telah terupdate...');
   dm.dSetObat.Active := false;
   dm.dSetObat.Active := true;
 end;
end;

procedure TfrmEditObat.Button1Click(Sender: TObject);
begin
 frmSatuan.Show;
end;

procedure TfrmEditObat.FormActivate(Sender: TObject);
begin
 if dm.dsetSatuan.Active = false then dm.dsetSatuan.Active := true;
end;

end.

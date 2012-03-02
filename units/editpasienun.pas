unit editpasienun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,db,adodb, Buttons, ExtCtrls;

type
  Teditpasienfrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBkode: TDBEdit;
    Label2: TLabel;
    DBnama: TDBEdit;
    Label3: TLabel;
    DBtgldaftar: TDBEdit;
    Label4: TLabel;
    DBtmpatlahir: TDBEdit;
    Label5: TLabel;
    DBtgllahir: TDBEdit;
    Label6: TLabel;
    DBjk: TDBEdit;
    Label7: TLabel;
    DBusia: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBbulan: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  editpasienfrm: Teditpasienfrm;

implementation

uses unDm;

{$R *.dfm}

procedure Teditpasienfrm.BitBtn1Click(Sender: TObject);
begin
 if MessageDlg('Simpan Data?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dSetPasien.Post;
   dm.dSetPasien.UpdateBatch(arAll);
   showmessage('data tersimpan....');
   editpasienfrm.Close;
 end;
end;

end.

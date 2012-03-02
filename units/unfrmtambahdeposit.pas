unit unfrmtambahdeposit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, db,adodb,Buttons;

type
  TfrmTambahDeposit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    noreg: TEdit;
    deposit: TEdit;
    Label2: TLabel;
    Label6: TLabel;
    btnsave: TBitBtn;
    btnclose: TBitBtn;
    gbketerangan: TGroupBox;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    DBText2: TDBText;
    Label5: TLabel;
    DBText3: TDBText;
    Label7: TLabel;
    DBText4: TDBText;
    Label8: TLabel;
    DBText5: TDBText;
    procedure depositKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure noregKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncloseClick(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTambahDeposit: TfrmTambahDeposit;

implementation

{$R *.dfm}
uses unutama, unfrmViewRawatInap, unDm;

procedure TfrmTambahDeposit.depositKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in['0'..'9',#8])then key:=#0;
end;

procedure TfrmTambahDeposit.FormActivate(Sender: TObject);
begin
 noreg.SetFocus;
 istambahdeposit:=1;
end;

procedure TfrmTambahDeposit.noregKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
 vk_return : frmviewrawatinap.ShowModal;
 vk_escape : close;
 end;
end;

procedure TfrmTambahDeposit.btncloseClick(Sender: TObject);
begin
 gbketerangan.Visible:=false;
 close;
end;

procedure TfrmTambahDeposit.btnsaveClick(Sender: TObject);
var tempnoreg : string;
begin
 tempnoreg:= trim(noreg.Text);
 if messagedlg('Simpan Tambahan Deposit?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   with dm.dSetRawatInap do
   begin
      if locate('innoreg',tempnoreg,[loCaseInsensitive])=true then
      begin
        open;
        edit;
        fieldByname('inDeposit').Value := fieldByname('inDeposit').Value +strToInt(deposit.Text);
        fieldByName('intambahdeposit').Value := strToInt(deposit.Text);
        fieldByName('intambahdepositpic').Value := isCurrentUser;
        fieldByName('intgltambahdeposit').AsString := dateToStr(date());
        post;
        updatebatch(arCurrent);
        showMessage('Data Tersimpan...');
        noreg.Clear;
        deposit.Clear;
        gbketerangan.Visible:=false;

        //dm.dsetViewRawatInap.CancelBatch(arcurrent);
      end;
   end; //end of dset rawat inap
   noreg.SetFocus;
 end; // end of if mssageldg
end;

end.

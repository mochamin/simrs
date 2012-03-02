unit unfrmdiagnosa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,db,adodb, Buttons;

type
  TfrmDiagnosa = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    gbdata: TGroupBox;
    gbdetail: TGroupBox;
    grid: TDBGrid;
    dbnodiagnosa: TDBEdit;
    dbnama: TDBEdit;
    dbjk: TDBEdit;
    dbusia: TDBEdit;
    dbalamat: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnclose: TBitBtn;
    btnnew: TBitBtn;
    btnsave: TBitBtn;
    btncancel: TBitBtn;
    dbtgl: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure dbnodiagnosaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnnewClick(Sender: TObject);
    procedure gridEnter(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
    procedure gridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnsaveClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure dbnodiagnosaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDiagnosa: TfrmDiagnosa;

implementation

uses unfrmviewpolidiag, unDm, unfrmviewpenyakit;

{$R *.dfm}

procedure TfrmDiagnosa.dbnodiagnosaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then frmViewPoliDiag.ShowModal;
end;

procedure TfrmDiagnosa.btnnewClick(Sender: TObject);
begin
 gbdata.Enabled := true;
 gbdetail.Enabled := true;
 dm.dsetdiagnosa.Append;
 dbnodiagnosa.SetFocus;
 btnsave.Visible := true;
 btnCancel.Visible := true;
end;

procedure TfrmDiagnosa.gridEnter(Sender: TObject);
begin
  dm.dsetdiagnosa.Post;
  dm.dsetdiagnosadetail.Append;
end;

procedure TfrmDiagnosa.btncloseClick(Sender: TObject);
begin
 close;
end;

procedure TfrmDiagnosa.gridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
 vk_delete : dm.dsetdiagnosadetail.Delete;
 vk_return : if grid.Fields[0].Value=null then
             begin
               frmviewPenyakit.ShowModal;
             end else dm.dsetdiagnosadetail.Append;
 end;
end;

procedure TfrmDiagnosa.btnsaveClick(Sender: TObject);
begin
 if messageDlg('Simpan Data? ',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
    dm.dsetdiagnosa.UpdateBatch(arAll);
    dm.dsetdiagnosadetail.UpdateBatch(arAll);

    /// status isdiagnosa di table layananpoli di ubah menjadi 1 (sudah di diagnosa)
     with dm.dsetlayananpoli do
     begin
       if locate('lpnoreg',dbnodiagnosa.Text,[loCaseInsensitive])=true then
       begin
         open;
         edit;
         fieldByName('lpisdiagnosa').AsInteger := 1;
         post;
         updateBatch(arAll);
       end;
     end;
    ////////////////
    showMessage('Data Tersimpan...');
    btnSave.Visible := false;
    btnCancel.Visible := false;
    gbdata.Enabled := false;
    gbdetail.Enabled := false;
 end;
end;

procedure TfrmDiagnosa.btncancelClick(Sender: TObject);
begin
 if messageDlg('Batalkan Data? ',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
    dm.dsetdiagnosa.CancelBatch(arAll);
    dm.dsetdiagnosadetail.CancelBatch(arAll);
    btnSave.Visible := false;
    btnCancel.Visible := false;
   gbdata.Enabled := false;
    gbdetail.Enabled := false;    
 end;
end;

procedure TfrmDiagnosa.dbnodiagnosaKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in[#8]) then
 key:=#0;
end;

procedure TfrmDiagnosa.FormActivate(Sender: TObject);
begin
 if dm.dsetdiagnosa.Active       = false then dm.dsetdiagnosa.Active := true;
 if dm.dsetdiagnosadetail.Active = false then dm.dsetdiagnosadetail.Active := true;
end;

end.

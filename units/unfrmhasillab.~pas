unit unfrmhasillab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids,db,adodb, DBGrids, Mask, DBCtrls,
  ComCtrls;

type
  TfrmHasilLab = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    gbhasil: TGroupBox;
    Label2: TLabel;
    notransaksi: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    grid: TDBGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    StatusBar1: TStatusBar;
    dbpemeriksa: TDBEdit;
    tglperiksa: TDBEdit;
    tglselesai: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBText4: TDBText;
    procedure FormActivate(Sender: TObject);
    procedure notransaksiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure notransaksiKeyPress(Sender: TObject; var Key: Char);
    procedure tglperiksaKeyPress(Sender: TObject; var Key: Char);
    procedure tglselesaiKeyPress(Sender: TObject; var Key: Char);
    procedure gridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure simpanHasil;
    procedure showhasillab;
    procedure batal;
  public
    { Public declarations }
  end;

var
  frmHasilLab: TfrmHasilLab;

implementation

uses unDm,unUtama, unfrmviewreglab, unfrmcetak, unFrmCetakLab;

{$R *.dfm}

procedure TfrmHasilLab.batal;
begin
 if messageDlg('Anda Yakin Membatalkan Input?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin

   dm.dsethasillab.CancelBatch(arAll);
   notransaksi.SetFocus;
 end;
end;

procedure TfrmHasilLab.simpanHasil;
begin
   if MessageDlg('Simpan Hasil Test?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
     //dm.dsethasillab.FieldByName('lbpemeriksa').AsString := isCurrentUser;

     dm.dsetLab.UpdateBatch(arCurrent);
     dm.dsethasillab.UpdateBatch(arAll);
     notransaksi.SetFocus;
   end;
end;

procedure TfrmHasilLab.showhasillab;
begin
 with dm.dsetlab do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talab '+
   'where lbkode = (:kode)';
   parameters.ParamByName('kode').Value := notransaksi.Text;
   active:=true;

   if isEmpty=false then
   begin
     edit;
     tglPeriksa.Text := dateToStr(date());
     tglSelesai.Text := dateToStr(date());
     dbpemeriksa.Text := AnsiUpperCase(isCurrentUser);
   end else
    begin
     tglPeriksa.Clear;
     tglSelesai.Clear;
     showMessage('Data Tidak ada!');
     notransaksi.SetFocus;
    end;

 end;


 with dm.dsethasillab do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldkode = (:kode)';
   parameters.ParamByName('kode').Value := notransaksi.Text;
   active:=true;

   if isEmpty=false then
   begin

     grid.Fields[1].FocusControl;
   end;

  end;


end;


procedure TfrmHasilLab.FormActivate(Sender: TObject);
begin
 notransaksi.Clear;
 isInputHasilLab:=1;
 with dm.dsethasillab do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldkode = (:kode)';
   parameters.ParamByName('kode').Value := notransaksi.Text;
   active:=true;
 end;


 with dm.dsetlab do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talab '+
   'where lbkode = (:kode)';
   parameters.ParamByName('kode').Value := notransaksi.Text;
   active:=true;
 end;

 dm.dsetLabDetail.Active := true;

end;

procedure TfrmHasilLab.notransaksiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
 vk_return : if (length(notransaksi.Text)=0) or (noTransaksi.Text=' ') then
             begin
               frmViewRegLab.ShowModal;
             end else showHasilLab;
 vk_escape : close;
 vk_f11 : begin
          frmCetakLab.ShowModal;
          //frmCetakLab.notransaksi.Text := notransaksi.Text;
          end;
 vk_f10 : simpanHasil;
 vk_f12 : batal;         
 end;
end;

procedure TfrmHasilLab.notransaksiKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9',#8]) then
 begin
  key:=#0;
 end;
end;

procedure TfrmHasilLab.tglperiksaKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9','/',#8]) then
 begin
  key:=#0;
 end;
end;

procedure TfrmHasilLab.tglselesaiKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9','/',#8]) then
 begin
  key:=#0;
 end;
end;

procedure TfrmHasilLab.gridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
 vk_return : begin
             dm.dsethasillab.Next;
             grid.Fields[1].FocusControl;
             if dm.dsethasillab.Eof then
             begin
               simpanHasil;
             end; 
             end;
 vk_f10 : simpanHasil;
 vk_f12 : batal;
 vk_escape : close;
 vk_f11 : begin
          frmCetakLab.ShowModal;
          //frmCetakLab.notransaksi.Text := notransaksi.Text;
          end;
 end;
end;

procedure TfrmHasilLab.gridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if dm.dSetHasilLab.FieldByName('ldSign').AsString ='*' then
 begin

   grid.Canvas.Font.Color:=clRed;
   grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

 end;
end;

procedure TfrmHasilLab.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
  vk_escape : close;
 end;
end;

procedure TfrmHasilLab.gridKeyPress(Sender: TObject; var Key: Char);
begin
 if key='p' then
 begin

  grid.DataSource.Edit;
  grid.Fields[1].Value := AnsiUpperCase(key)+'ositif';
  key:=#0;
 end else if key='n' then
 begin
  grid.DataSource.Edit;
  grid.Fields[1].Value := AnsiUpperCase(key)+'egatif';
  key:=#0;
 end;


end;

end.

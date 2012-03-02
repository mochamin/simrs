unit unFrmLab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,StrUtils, StdCtrls,adodb,db, ExtCtrls, Mask, DBCtrls, Buttons,
  ComCtrls;

type
  TfrmLab = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gblabitem: TGroupBox;
    griditemLab: TDBGrid;
    cmbGroup: TComboBox;
    Label1: TLabel;
    gbhasil: TGroupBox;
    gridLab: TDBGrid;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    dbNoRm: TDBEdit;
    Label2: TLabel;
    dbKodeDokter: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbNoReg: TDBEdit;
    Panel4: TPanel;
    btnNew: TBitBtn;
    GroupBox4: TGroupBox;
    dbNama: TDBEdit;
    dbJK: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dtTglPeriksa: TDateTimePicker;
    btnSave: TBitBtn;
    gbcaridata: TGroupBox;
    txtCariNama: TEdit;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnCancel: TBitBtn;
    Label9: TLabel;
    dtTglAkhirPeriksa: TDateTimePicker;
    Label10: TLabel;
    dbrekammedik: TDBEdit;
    Label11: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure dbNoRmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbNoRmKeyPress(Sender: TObject; var Key: Char);
    procedure dbKodeDokterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbKodeDokterKeyPress(Sender: TObject; var Key: Char);
    procedure griditemLabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridLabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNewClick(Sender: TObject);
    procedure gridLabDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cmbGroupClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure txtCariNamaChange(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dbNoRegKeyPress(Sender: TObject; var Key: Char);
    procedure dbTipePasienKeyPress(Sender: TObject; var Key: Char);
    procedure dbNoRmExit(Sender: TObject);
    procedure dbNoRmEnter(Sender: TObject);
    procedure dbKodeDokterExit(Sender: TObject);
    procedure griditemLabColEnter(Sender: TObject);
    procedure gblabitemClick(Sender: TObject);
  private
    { Private declarations }
    procedure autoNumber;
  public
    { Public declarations }
  end;

var
  frmLab: TfrmLab;
  isLabNew : integer;
  isLabEdit : integer;

implementation

uses unFrmViewPasien,unUtama, unFrmViewDokter, unDm, unFrmCetakLab,
  unFrmPilihPasien, unfrmViewRawatInap, unFrmViewPasienPoli;

{$R *.dfm}

procedure TfrmLab.autoNumber;
var tempUrut : integer;
    tempKode : string;
    zeroFill : string;
    tgl,bln,thn : string;
begin
   tgl := AnsiMidStr(dateToStr(now),1,2);
    bln := AnsiMidStr(dateToStr(now),4,2);
    thn := AnsiMidStr(dateToStr(now),9,2);

if LeftStr(DateToStr(now()),2)<>'01' then
begin
  with dm.dsetLab do
  begin
     active:=false;
     commandType := cmdText;
     commandText := 'select * from talab '+
     'ORDER BY lbtglPeriksa asc ';
     active:=true;
     Last;

     tempKode := RightStr(fields.fieldByName('lbKode').AsString,3);
     //showMessage(tempKOde);
     tempUrut :=strToInt(tempKode)+1;
     //showMessage(intToStr(tempUrut));


      case Length(intToStr(tempUrut)) of
      1 : zeroFill := '00';
      2 : zeroFill := '0';
      3 : zeroFill := '';
      end;


     append;
     dbNoReg.Text := tgl+bln+thn+zeroFill+intToStr(tempUrut);

  end;
end else
    begin

     dm.dsetLab.Append;
     dbNoReg.Text := tgl+bln+thn+'001'
    end;


end;

procedure TfrmLab.FormActivate(Sender: TObject);
begin
 isIsiLab :=1;
 dtTglPeriksa.Date := date();
end;

procedure TfrmLab.dbNoRmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=vk_return) and (isLabLuar=1) then
 begin
  frmViewPasien.ShowModal;
 end;

 if (key=vk_return) and (isLabrawatinap=1) then
 begin
  frmViewRawatInap.ShowModal;
 end;

  if (key=vk_return) and (isLabPoli=1) then
 begin
  frmViewPasienPoli.ShowModal;
 end;


end;

procedure TfrmLab.dbNoRmKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmLab.dbKodeDokterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_Return then
 begin
   frmViewDokter.ShowModal;
 end;
end;

procedure TfrmLab.dbKodeDokterKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmLab.griditemLabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var Pria,wanita : string;
begin
if dbkodedokter.Text='' then
begin
  showMessage('Pemeriksa Harap diisi terlebih dahulu');
  dbkodedokter.SetFocus;
end else
begin
  Pria:='P';
  Wanita:='W';
 if key=vk_return then
 begin
  if (isLabNew=1) or (isLabEdit=1) then
  begin
   dm.dsetLabDetail.Open;
   dm.dsetLabDetail.Append;
   gridLab.SetFocus;

   if AnsiUpperCase(gridItemLab.Fields[1].Value)='Y' then
   begin
    // showMessage('item gender');
     //showMessage(dbJk.Text);
     if Trim(dbJk.Text) =Pria then
     begin
       //showMessage('Pria');
       gridLab.Fields[2].Value := gridItemLab.Fields[3].Value;
     end else  gridLab.Fields[2].Value := gridItemLab.Fields[4].Value;



   end else
   begin
       gridLab.Fields[2].Value := gridItemLab.Fields[2].Value;
   end;
   gridLab.Fields[0].Value := gridItemLab.Fields[0].Value;
   gridLab.Fields[4].Value := gridItemLab.Fields[5].Value;
   gridLab.Fields[5].Value := gridItemLab.Fields[6].Value;
   gridLab.Fields[6].Value := gridItemLab.Fields[7].Value;
   gridLab.Fields[7].Value := gridItemLab.Fields[11].Value;
 end else
   showMessage('Silahkan tekan tombol "Edit" atau "New" '+#13+
   'Untuk Melakukan Input Item Lab!');
 end;
end;//end if dbkkodedokter empty
end;

procedure TfrmLab.gridLabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
    gridItemLab.SetFocus;
  end;

  if key=vk_delete then
  begin
    if MessageDlg('Hapus Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      dm.dsetLabDetail.Delete;
    end;
  end;

end;

procedure TfrmLab.btnNewClick(Sender: TObject);
begin
      gbcaridata.Enabled := false;
   isLabNew:=1;
   btnCancel.Visible := true;
   btnSave.Visible := true;
   dm.dsetLab.Open;
   dm.dsetLab.Append;
   dbNoRM.SetFocus;
   autoNumber;
   frmPilihPasien.ShowModal;

end;

procedure TfrmLab.gridLabDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if dm.dSetLabDetail.FieldByName('ldSign').AsString ='*' then
 begin

   gridLab.Canvas.Font.Color:=clRed;
   gridLab.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
end;
procedure TfrmLab.cmbGroupClick(Sender: TObject);

begin
  with dm.dsetItemLab do
  begin
   active:=false;
   commandType := cmdText;
   commandText := 'SELECT * FROM taitemlab '+
   'WHERE ilGroup LIKE (:group) ';
   parameters.ParamByName('group').Value := '%'+cmbGroup.Text+'%';
   active:=true;
  end;


end;

procedure TfrmLab.btnSaveClick(Sender: TObject);
begin
if MessageDlg('Simpan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
  dm.dsetLab.UpdateBatch(arAll);
  dm.dsetLabDetail.UpdateBatch(arAll);
   btnCancel.Visible := false;
   btnSave.Visible := false;
   isLabNew:=0;
   isLabEdit:=0;
   isLabPoli:=0;
   isLabRawatInap := 0;
   isLabLuar :=0;
   gbcaridata.Enabled := true;
   gblabitem.Enabled := false;
     gbhasil.Enabled := false;
end;

end;

procedure TfrmLab.txtCariNamaChange(Sender: TObject);
begin
 with dm.dsetLab do
 begin
   active:=false;
   commandType := cmdText;
   commandText :='SELECT * FROM talab '+
   'WHERE lbNama LIKE (:nama) ';
   parameters.ParamByName('nama').Value := '%'+txtCariNama.Text+'%';
   active:=true;
 end;
end;

procedure TfrmLab.btnEditClick(Sender: TObject);
begin
        gbcaridata.Enabled := false;
        gblabitem.Enabled := true;
        gbhasil.Enabled := true;
   isLabEdit:=1;
   btnCancel.Visible := true;
   btnSave.Visible := true;
   gridLab.SetFocus;
  //dm.dsetLab.Edit;
  dm.dsetLabDetail.Edit;
end;

procedure TfrmLab.btnCancelClick(Sender: TObject);
begin
if MessageDlg('Cancel Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
  dm.dsetLab.CancelBatch(arAll);
  dm.dsetLabDetail.CancelBatch(arAll);
     btnCancel.Visible := false;
   btnSave.Visible := false;
   isLabNew:=0;
   isLabEdit:=0;
   isLabPoli:=0;
   isLabRawatInap := 0;
   isLabLuar :=0;
      gbcaridata.Enabled := true;
      gblabitem.Enabled := false;
      gbhasil.Enabled := false;
end;
end;

procedure TfrmLab.dbNoRegKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmLab.dbTipePasienKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmLab.dbNoRmExit(Sender: TObject);
begin
 dm.dsetLab.Edit;
end;

procedure TfrmLab.dbNoRmEnter(Sender: TObject);
begin
 dm.dsetLab.Edit;
end;

procedure TfrmLab.dbKodeDokterExit(Sender: TObject);
begin
  gblabitem.Enabled := true;
  gbhasil.Enabled := true;
  dm.dsetLab.Post;
end;

procedure TfrmLab.griditemLabColEnter(Sender: TObject);
begin
 dm.dsetLab.Post; 
end;

procedure TfrmLab.gblabitemClick(Sender: TObject);
begin
  if gblabitem.Enabled=false then
  begin
    showMessage('isi dulu pemeriksa');
    dbkodedokter.SetFocus;
  end;
end;

end.


unit unFrmApotik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, adodb,StdCtrls, Grids, DBGrids, ComCtrls, Buttons, Mask,
  DBCtrls, DB, DBTables,strUtils;

type
  TfrmApotik = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    gbViewPasien: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    gridViewPasien: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    gbPasienLayanan: TGroupBox;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Image2: TImage;
    Label6: TLabel;
    dbDetailPasien: TGroupBox;
    DBEdit1: TDBEdit;
    dbtxtNama: TDBEdit;
    dbtxtUsia: TDBEdit;
    dbTxtGuardian: TDBEdit;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    dbtxtalamat: TDBMemo;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dbtxtNoReg: TDBEdit;
    gridObat: TDBGrid;
    taApotik: TADOTable;
    taApotikDetail: TADOTable;
    dsApotik: TDataSource;
    dsApotikDetail: TDataSource;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    txtjmlRecord: TLabel;
    Label17: TLabel;
    GroupBox4: TGroupBox;
    txtNoReg: TLabel;
    GroupBox5: TGroupBox;
    dbKodeTransaksi: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    txtViewNama: TLabel;
    txtViewUsia: TLabel;
    txtViewGuardian: TLabel;
    txtViewAlamat: TMemo;
    Label22: TLabel;
    dbtxtJK: TDBEdit;
    Label23: TLabel;
    txtViewJK: TLabel;
    dbBulan: TDBEdit;
    Label24: TLabel;
    txtViewBulan: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    procedure gridViewPasienDblClick(Sender: TObject);
    procedure gridObatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridObatEditButtonClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure gridObatDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridObatDblClick(Sender: TObject);
    procedure gridObatColExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure taApotikDetailAfterPost(DataSet: TDataSet);
    procedure taApotikDetailAfterEdit(DataSet: TDataSet);
    procedure taApotikDetailBeforePost(DataSet: TDataSet);
    procedure dsetApotikDetailBeforePost(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure dbtxtNoRegKeyPress(Sender: TObject; var Key: Char);
    procedure dbtxtNamaKeyPress(Sender: TObject; var Key: Char);
    procedure dbtxtalamatKeyPress(Sender: TObject; var Key: Char);
    procedure dbtxtUsiaKeyPress(Sender: TObject; var Key: Char);
    procedure dbtxtJKKeyPress(Sender: TObject; var Key: Char);
    procedure dbTxtGuardianKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure gridViewPasienEnter(Sender: TObject);
  private
    { Private declarations }
    procedure cekKey;
    procedure autonumberApotik;
    procedure isiPasienLayanan;
    function cekStokObat(qty:integer):integer;
  public
    { Public declarations }

    procedure simpanPasienApotik;
    procedure refreshPasienApotik;
  end;

var
  frmApotik: TfrmApotik;
  modeEdit : integer;
  transaksiObat : integer;

implementation

uses unDm, unfrmObat, unViewObat;

{$R *.dfm}

procedure TfrmApotik.isiPasienLayanan;
begin
   gbPasienLayanan.Visible := true;
   txtViewNama.Caption := dbTxtNama.Text;
   txtViewUsia.Caption := dbTxtUsia.Text;
   txtViewBulan.Caption := dbBulan.Text;
   txtViewGuardian.Caption := dbtxtGuardian.text;
   txtviewAlamat.Text := dbtxtalamat.Text;
   txtViewJK.Caption := dbtxtJK.Text;
end;

procedure TfrmApotik.simpanPasienApotik;
var tempNoreg : string;
    //tempStatus : string;
    //tempNama : string;
begin
  tempNoReg := txtNoReg.Caption;
  with dm.dsetLayananPoli do
  begin
     active:=false;
     commandType :=cmdText;
     commandText:= 'SELECT * FROM talayananpoli '+
     'WHERE lpNoReg LIKE (:noReg) ';
     Parameters.ParamByName('noReg').Value := tempNoReg;
     active:=true;
     
     open;
     edit;
     fieldvalues['lpStatus'] := 'Done';
     post;
  end;
end;

procedure TfrmApotik.autonumberApotik;
var GetKodeApotik : string;
    cutKOdeApotik : string;
    TempkodeApotik : integer;
    tempZeroFill : string;
    tempKodeTrans : string;
    tempDbtxt : string;
begin
  tempDbTxt := dbKodeTransaksi.caption;
  with dm.dSetApotik do
   begin
      active:=false;
      commandType := cmdText;
      commandText := 'SELECT * FROM taapotik,  tapasien, tadokter, tapoli ';
      active :=true;

      open;
      if isEmpty then
      begin
      Append;
      fields.FieldByName('apKodeApotik').AsString := 'AP0000001';
      post;
      end;
      
      last;
      GetKodeApotik := fieldByName('apKodeApotik').AsString; //ambil kode apotik dari taApotik
      cutKodeApotik := RightStr(getKodeApotik,7);
      tempKodeApotik := strToInt(cutKodeApotik);
      //showMessage(intToStr(tempKodeApotik));
      end; 

      tempKodeApotik := tempKodeApotik+1;

      Case length(intToStr(tempKodeApotik)) of
       1 : tempZeroFill := '000000';
       2 : tempZeroFill := '00000';
       3 : tempZeroFill := '0000';
       4 : tempZeroFill := '000';
       5 : tempZeroFill := '00';
       6 : tempZeroFill := '0';
       else
           tempZeroFill :='';
      end; //endcase

     //isi kode Apotik yg baru dengan kombinasi di atas
     tempKodeTrans := 'AP'+tempZeroFill+intToStr(tempKodeApotik);

     dbKodeTransaksi.caption:= tempKodeTrans;
     

end;

procedure tfrmApotik.cekKey;
begin
   if gridObat.DataSource.State in [dsEdit, dsInsert] then
   begin
      exit;
   end;
end;

procedure TfrmApotik.refreshPasienApotik;
var tempJmlRecord : integer;
begin
  with dm.dsetApotikPasien do
  begin
     active:=false;
     commandType := cmdText;
     commandText := 'select * from talayananpoli, tapasien, tadokter, tapoli '+
     'WHERE psKodePasien LIKE lpKodePasien '+
     'AND dkKodeDokter LIKE lpKodeDokter '+
     'AND poKode LIKE lpKodePoli '+
     'AND lpStatus LIKE "confirm" '+
     'ORDER BY  lpTglWktu ';
     active:=true;
     tempJmlRecord := recordCount;
     txtJmlRecord.Caption := intToStr(tempJmlRecord);
  end;
end;

procedure TfrmApotik.gridViewPasienDblClick(Sender: TObject);
begin
  modeEdit :=1; // set the editMode so it can save into gridObat
  if transaksiObat <> 1 then
  begin
     transaksiObat :=1;
     gridObat.SetFocus;
     txtNoReg.Caption := dbTxtNoReg.Text;
     taApotik.Append;
     taApotikDetail.Append;
     taApotikDetail.Edit;
     taApotikDetail.ClearFields;
    //--------------------------------------------------
   //pengisian field kodeTransaksi dengan autonumber
   
     autoNumberApotik;
     isiPasienLayanan;
     taApotik.FieldByName('apKodeApotik').Value := dbKodeTransaksi.caption;
     taApotik.Post;
  end else
  begin
    showMessage('Sedang dalam transaksi..'#13+
    'Selesaikan transaksi dahulu sebelum '#13+
    'melanjutkan transaksi berikutnya!');
  end;
end;

procedure TfrmApotik.gridObatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if transaksiObat = 1 then
begin
  case key of
  VK_RETURN : frmViewObat.ShowModal;
  VK_UP : cekKey;
  VK_DOWN : if modeEdit=1 then
            begin
              gridObat.SetFocus;
            end;
  VK_DELETE : if messageDlg('Hapus Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
              begin
                 taApotikDetail.Delete;
              end;
  end;
end else showMessage('isi Nama Pasien terlebih dahulu '#13+
         'dengan klik 2x /double click pada List Pasien.');

end;

procedure TfrmApotik.gridObatEditButtonClick(Sender: TObject);
begin
  frmViewObat.ShowModal;
end;

procedure TfrmApotik.BitBtn3Click(Sender: TObject);
begin
//  frmMasterDetail.ShowModal;
end;



procedure TfrmApotik.gridObatDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if taApotikDetail.FieldByName('adQty').AsInteger=0 then
  gridObat.Canvas.Font.Color:=clRed;
gridObat.DefaultDrawColumnCell
  (Rect, DataCol, Column, State);

end;

procedure TfrmApotik.FormActivate(Sender: TObject);
var tempJmlRecord : integer;
begin
  modeEdit :=0;
  refreshPasienApotik;
  transaksiObat :=0;
  tempJmlRecord := dm.dsetApotikPasien.RecordCount;
  txtJmlRecord.Caption := intToStr(tempJmlRecord);
end;

procedure TfrmApotik.FormCreate(Sender: TObject);
begin
{ taApotik.Connection := dm.connKlinik;
 taApotikDetail.Connection := dm.connKlinik;
 taApotik.Active := true;
 taApotikDetail.Active := true;}
end;

procedure TfrmApotik.gridObatDblClick(Sender: TObject);
begin
  modeEdit := 0;
end;

procedure TfrmApotik.gridObatColExit(Sender: TObject);
begin
    if (gridObat.SelectedField.FieldName = 'adQty') and (gridObat.DataSource.State in [dsEdit, dsInsert]) then
    begin

       gridObat.Fields[4].Value := gridObat.Fields[2].Value*gridObat.Fields[3].Value;

    end;
end;

procedure TfrmApotik.BitBtn1Click(Sender: TObject);
begin
if transaksiObat = 1 then
begin
 if MessageDlg('Simpan Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
    simpanPasienApotik;
    refreshPasienApotik;
    taApotik.UpdateBatch(arAll); //simpan permanen data yg ada di batch (memory)
    taApotikDetail.UpdateBatch(arAll);
    taApotik.Append;
    taApotikDetail.Append;
    transaksiObat:=0;
    dbKodeTransaksi.Caption :='';
    txtNoReg.Caption := '';
       gbPasienLayanan.Visible := false;
 end else
     begin
         transaksiObat :=0;
         dbKodeTransaksi.Caption :='<empty>';
         txtNoReg.Caption := '<empty>';
         taApotik.CancelBatch(arAll);
         taApotikDetail.CancelBatch(arAll);
         taApotikDetail.Cancel;
         taApotik.append;
         gbPasienLayanan.Visible := false;
     end;
end else showMessage('Tidak ada Transaksi...');

end;

procedure TfrmApotik.taApotikDetailAfterPost(DataSet: TDataSet);
begin
 //if  (gridObat.DataSource.State in [dsEdit]) then
  //  begin
       showMessage('after post');


   // end;
end;

procedure TfrmApotik.taApotikDetailAfterEdit(DataSet: TDataSet);
begin
//  gridObat.Fields[4].Value := gridObat.Fields[2].Value*gridObat.Fields[3].Value;
end;

function TfrmApotik.cekStokObat(qty:integer):integer;
begin
  with dm.dSetObat do
  begin
   
   active:=false;
   commandType := cmdText;
   commandText :='SELECT * FROM taobat '+
   'WHERE obKode LIKE (:kode)'+
   'ORDER BY obKode';
   parameters.ParamByName('kode').Value := '%'+gridObat.Fields[0].Value+'%';
   active := true;
   first;
   //showMessage('before post');
   showMessage(gridObat.Fields[0].Value);
     //showMessage(fields.fieldByName('obStok').AsString);
  if isEmpty=false then
  begin
     showMessage(fields.fieldByName('obKode').AsString);
  end;
  { if (fields.FieldByName('obStok').Value) < qty then
   begin

     showMessage('Stok tidak mencukupi');
     abort;

   end else
    begin
   // exit;
     gridObat.Fields[4].AsInteger := gridObat.Fields[2].Value*gridObat.Fields[3].Value;
     end;
   }
  end;
end;

procedure TfrmApotik.taApotikDetailBeforePost(DataSet: TDataSet);
begin
     gridObat.Fields[4].AsCurrency := gridObat.Fields[2].Value*gridObat.Fields[3].Value;
end;

procedure TfrmApotik.dsetApotikDetailBeforePost(DataSet: TDataSet);
begin
      gridObat.Fields[4].AsCurrency := gridObat.Fields[2].Value*gridObat.Fields[3].Value;
end;

procedure TfrmApotik.BitBtn2Click(Sender: TObject);
begin
if transaksiObat=1 then
begin
  if MessageDlg('Batalkan Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
     transaksiObat :=0;
     dbKodeTransaksi.Caption :='<empty>';
     txtNoReg.Caption := '<empty>';
     taApotik.CancelBatch(arAll);
     taApotikDetail.CancelBatch(arAll);
     taApotikDetail.Cancel;
     //taApotik.append;
     gbPasienLayanan.Visible := false;
     taApotik.Active := false;
     taApotik.Active := true;
     taApotikDetail.Active := false;
     taApotikDetail.Active := true;
  end;
end else showMessage('tidak ada transaksi...');
end;

procedure TfrmApotik.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if transaksiObat=1 then
 begin
   showMessage('Masih ada transaksi berlangsung..'#13+
               'Batalkan transaksi terlebih dahulu '#13+
               'dengan menekan tombol "Cancel"!');
   abort;            
   gridObat.SetFocus;            
 end;
end;

procedure TfrmApotik.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmApotik.dbtxtNoRegKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmApotik.dbtxtNamaKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmApotik.dbtxtalamatKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmApotik.dbtxtUsiaKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmApotik.dbtxtJKKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmApotik.dbTxtGuardianKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmApotik.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmApotik.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmApotik.gridViewPasienEnter(Sender: TObject);
begin
 refreshPasienApotik;
end;

end.

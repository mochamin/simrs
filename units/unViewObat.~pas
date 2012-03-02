unit unViewObat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,db, DBGrids,ADOdb, ExtCtrls, StdCtrls, ComCtrls, RpCon,
  RpConDS, RpDefine, RpRave;

type
  TfrmViewObat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gridViewObat: TDBGrid;
    GroupBox1: TGroupBox;
    cari: TEdit;
    Label1: TLabel;
    gbHelp: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    StatusBar: TStatusBar;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RvProjectprintobat: TRvProject;
    rvconobat: TRvDataSetConnection;
    Label8: TLabel;
    procedure gridViewObatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure cariKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cariChange(Sender: TObject);
    procedure gridViewObatTitleClick(Column: TColumn);
    procedure gridViewObatKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure cekAdmin;
    procedure isiToApotik;
    procedure isiToRacikan;
    procedure isiToPoliTreatment;
    procedure isiToObatOKVK;
    procedure cetakdataobat;
    procedure isiToPembelian;
   

  public
    { Public declarations }
  end;

var
  frmViewObat: TfrmViewObat;
  kelas : string;
  obat :integer;

implementation

uses unFrmApotik, unUtama,unDm, unFrmTransaksiRawatInap, unfrmObat,
  unFrmService, unfrmApotek, uneditobat, unfrmracikan, unfrmpolitreatment,
  pembelianun;

{$R *.dfm}


procedure tfrmviewobat.isiToPembelian;
begin
  //dm.dsetbelidetail.FieldByName('pd_notransaksi').Value :=
  dm.dsetbelidetail.Append;
  dm.dsetbelidetail.FieldByName('pd_kodeobat').Value     := gridviewobat.Fields[0].Value;
  dm.dsetbelidetail.fieldbyname('pd_namaobat').Value     :=  gridviewobat.Fields[1].Value;
  dm.dsetbelidetail.fieldbyname('pd_qty').Value          :=  1;
  dm.dsetbelidetail.FieldByName('pd_hrga').Value         := gridviewobat.Fields[2].Value;
  dm.dsetbelidetail.FieldByName('pd_kategori').Value     := gridviewobat.Fields[7].Value;
  dm.dsetbelidetail.FieldByName('pd_tgl').Value          := date();
  Pembelianfrm.gridbeli.Fields[2].FocusControl;
  close;
end;


procedure tfrmviewobat.cetakdataobat;
begin
 if messagedlg('Cetak Data Obat?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
 RvProjectprintobat.ProjectFile:='obat.rav';
 RvProjectprintobat.Open;
 RvProjectprintobat.SelectReport('obat.rav',true);
 RvProjectprintobat.Execute;
end;
end;

procedure TfrmViewObat.isiToObatOKVK;
 begin
    //showMessage('treatment mode');
    frmService.cekAdministrasi;
   // frmTreatment.gridTreatment.DataSource.Edit;
    frmTreatment.gridTreatment.Fields[0].Value := date();
    frmTreatMent.gridTreatment.Fields[1].Value := time();
    frmTreatment.gridTreatment.Fields[2].Value := gridViewObat.Fields[0].Value;
    frmTreatment.gridTreatment.Fields[3].Value := gridViewObat.Fields[1].Value;
    frmTreatment.gridTreatment.Fields[4].Value := (gridViewObat.Fields[2].Value)+(gridViewObat.Fields[2].Value*tempObat/100);
    frmTreatment.gridTreatment.Fields[5].Value :=1;
    frmTreatment.gridTreatment.Fields[7].Value :=1;

  if isObatOK=1 then
  begin
    frmTreatment.gridTreatment.Fields[9].Value := 'OK';
  end else if isObatVK=1 then
  begin
    frmTreatment.gridTreatment.Fields[9].Value := 'VK';
  end;

    frmViewObat.Close;
   end;


procedure TfrmViewObat.isiToPoliTreatment;
begin
   frmPoliTreatment.gridtreatment.DataSource.Edit;
   frmPoliTreatment.gridtreatment.Fields[0].Value := date();
   frmPoliTreatment.gridtreatment.Fields[1].Value := time();
   frmPoliTreatment.gridtreatment.Fields[2].Value := gridviewobat.Fields[0].Value;
   frmPoliTreatment.gridtreatment.Fields[3].Value := gridViewObat.Fields[1].Value;
   frmPoliTreatment.gridtreatment.Fields[4].Value := gridviewobat.Fields[2].Value;
   frmPoliTreatment.gridtreatment.Fields[7].Value := '0';
   frmPoliTreatment.gridtreatment.Fields[5].Value := 1;
   close;
end;

procedure TfrmViewObat.cekAdmin;
begin
with dm.dsetViewKamarDetail do
  begin
    active:=false;
    commandType := cmdText;
    commandText := 'SELECT * FROM takamardetail,takamar '+
    'WHERE kdKamar like kaKode '+
    'AND kdactive=1 '+
    'AND kdNoReg LIKE (:noreg) ';
    parameters.ParamByName('noReg').Value := frmApotek.dbNoReg.Text;
    active:=true;

  if isEmpty=false then
  begin
    //showMessage('cek admin ditemukan kelas!');
    Kelas := fields.fieldByName('kdkamar').AsString;
  end;
  end;

 with dm.dsetAdministrasi do
 begin
    active := false;
    commandType := cmdText;
    commandText := 'SELECT * FROM taadministrasi '+
    'where adkelas like (:kelas) ';
    parameters.ParamByName('kelas').Value := Kelas;
    active:=true;
    //showMessage('Kelas Aktif Admin : '+kelas);
    tempTindakan := fields.fieldByName('adTindakan').AsInteger;
    Obat := fields.fieldByName('adobat').AsInteger;
    tempLab :=fields.fieldByName('adlab').AsInteger;
    tempRontgen := fields.fieldByName('adrontgen').AsInteger;
    tempAlkes := fields.fieldByName('adalkes').AsInteger;
    tempadmin := fields.fieldByname('adadmin').AsInteger;
 end;
end;

procedure TfrmviewObat.isiToApotik;
var  namaDokter : string;
     markUp  : integer;
begin
   namaDokter := frmApotek.lbldokter.Caption;

   with dm.dsetadmpoli do
   begin
      if locate('apnama',namadokter,[loCaseInsensitive])=true then
      begin
        markup := fields.FieldByName('apobat').AsInteger;
      end;
   end;

   //modeEdit:=1; // set mode Edit = 1 supaya bisa dikalkulasikan qty sama harga
   frmApotek.gridObat.DataSource.Edit;
   frmApotek.gridObat.Fields[0].Value := gridViewObat.Fields[0].Value;
   frmApotek.gridObat.Fields[1].value := gridViewObat.Fields[1].Value;
   frmApotek.gridObat.Fields[2].Value := gridViewObat.Fields[3].Value;
    frmApotek.gridObat.Fields[7].Value := gridViewObat.Fields[8].Value;

 if frmApotek.cbTipeCustomer.ItemIndex=2 then
 begin
   cekAdmin; // menuju ke prosedure untuk mark-up harga obat
   //showmessage(intToStr(Obat));
   frmApotek.gridObat.Fields[3].Value := (gridViewObat.Fields[2].Value)+(gridViewObat.Fields[2].Value*(Obat/100));
 end else
 begin
  frmApotek.gridObat.Fields[3].Value := (gridViewObat.Fields[2].Value)+(gridViewObat.Fields[2].Value*(markUp/100));
 end;
   Close;

   frmApotek.gridObat.Fields[4].Value := 1;
   dm.dsetApotikDEtail.Post;

   frmApotek.gridObat.Fields[4].FocusControl;
   //dm.dsetApotikDEtail.Append;

end;

procedure TfrmViewObat.isiToRacikan;
begin
   frmRacikan.gridObat.DataSource.Edit;
   frmRacikan.gridObat.Fields[0].Value := gridViewObat.Fields[0].Value;
   frmRacikan.gridObat.Fields[1].value := gridViewObat.Fields[1].Value;
   frmRacikan.gridObat.Fields[2].Value := gridViewObat.Fields[3].Value;
   frmRacikan.gridObat.Fields[3].Value := gridViewObat.Fields[2].Value;
   frmRacikan.gridObat.Fields[4].Value := 1;
   frmRAcikan.gridObat.Fields[6].Value := 1; //isi isracikan dengan 1
     frmracikan.gridObat.Fields[7].Value := gridViewObat.Fields[8].Value;

   dm.dSetracikan.Post;
  // dm.dsetApotikDEtail.Post;
  close;
   frmRacikan.gridObat.Fields[4].FocusControl;

end;

procedure TfrmViewObat.gridViewObatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var tarifDokter : integer;  
begin

 //isi ke treatment rawat inap

 if key=vk_f8 then
 begin
  cetakdataobat;
 end;

 if key=vk_f10 then
 begin
  dm.dsetObatView.Active := false;
  dm.dsetObatView.Active := true;
  frmViewObat.cari.SetFocus;
 end;

 if key=vk_escape then
 begin
   frmViewObat.Close;
 end;

 if key=vk_delete then
 begin
    if MessageDlg('Hapus Data Obat ini?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      dm.dsetObatView.Delete;
      dm.dsetObatView.UpdateBatch(arAll);
    end;
 end;
 
if (TransaksiObat<>1) or (isTreatment<>1) then
begin
  if key=VK_F5 then
  begin
    frmObat.ShowModal;
  end else if key=vk_f2 then
  begin
    frmEditObat.ShowModal;
  end;
end;

if (key=vk_return) and (transaksiobat=1) and (isRacikan<>1) then
begin
  isiToApotik; 
end;

if (key=vk_return) and (isPembelian=1)   then
begin
  isiToPembelian;
end;

if (key=vk_return) and (isRacikan=1)   then
begin

  isiToRacikan;

end;

if (key=vk_return) and (isObatOK=1) then
begin
  isiToObatOKVK;
end;

if (key=vk_return) and (isObatVK=1) then
begin
  isiToObatOKVK;
end;

if (key=vk_return) and (isPoliTreatment=1)   then
begin
   isiToPoliTreatment;
end;

 if (key=VK_RETURN)   then
 //and (frmApotik.gridObat.DataSource.State in [dsEdit,dsInsert]) then
 begin


   if  isTreatment=1 then
   begin
    //showMessage('treatment mode');
    frmService.cekAdministrasi;
   // frmTreatment.gridTreatment.DataSource.Edit;
    frmTreatment.gridTreatment.Fields[0].Value := date();
    frmTreatMent.gridTreatment.Fields[1].Value := time();
    frmTreatment.gridTreatment.Fields[2].Value := gridViewObat.Fields[0].Value;
    frmTreatment.gridTreatment.Fields[3].Value := gridViewObat.Fields[1].Value;
    frmTreatment.gridTreatment.Fields[4].Value := (gridViewObat.Fields[2].Value)+(gridViewObat.Fields[2].Value*tempObat/100);
    frmTreatment.gridTreatment.Fields[5].Value :=1;
    frmTreatment.gridTreatment.Fields[7].Value :=1;
    frmViewObat.Close;
   end;

 end;
end;

procedure TfrmViewObat.FormActivate(Sender: TObject);
begin
  if dm.dsetObatView.Active =false then  dm.dsetObatView.Active:=true;
 // dm.dsetObatView.Refresh;

if dm.dsetadmpoli.Active=false then dm.dsetadmpoli.Active:=true;
 Cari.Clear;
 {if transaksiObat=1 then
 begin
   gbHelp.Visible := false;
 end else gbHelp.Visible := true;
  }

 cari.SetFocus;
{  with dm.dSetObatView do
  begin
   active := false;
   commandType := cmdText;
   commandText := 'SELECT * FROM taobat ';
   active:=true;


   statusbar.Panels[0].Text := 'Jumlah Item Obat: '+intToStr(recordcount);

  end;

 }

end;

procedure TfrmViewObat.cariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var cf   : integer; //cf = current Field
    data : TADODataSet;
begin

  if key=vk_f10 then
 begin
  dm.dsetObatView.Active := false;
  dm.dsetObatView.Active := true;
    frmViewObat.cari.SetFocus;
 end;
 
 data := dm.dsetObatView;
 if gridviewobat.SelectedIndex=0 then
 begin
     cf:=1;
 end else cF := gridviewobat.SelectedIndex;

  case key of
  vk_up : begin
           gridviewobat.SetFocus;
           data.Prior;
          end;
  vk_down : begin
           gridviewobat.SetFocus;
           data.Next;
          end;
  vk_right : begin
            gridviewobat.SetFocus;
            gridviewobat.fields[cf+1].FocusControl;
            end;
 vk_left : begin
            gridviewobat.SetFocus;
            gridviewobat.fields[cf-1].FocusControl;
            end;
 vk_f8    : cetakdataobat;           
 vk_escape : close;
 end;


 if (key=vk_return) and (isPembelian=1)   then
begin
  isiToPembelian;
end;

if TransaksiObat<>1 then
begin
  if key=VK_F5 then
  begin
    frmObat.ShowModal;
  end else if key=vk_f2 then
  begin
    frmEditObat.ShowModal;
  end;

end;

if (key=vk_return) and (isObatOK=1) then
begin
  isiToObatOKVK;
end;

if (key=vk_return) and (isObatVK=1) then
begin
  isiToObatOKVK;
end;


 if (key=VK_RETURN)   then
 //and (frmApotik.gridObat.DataSource.State in [dsEdit,dsInsert]) then
 begin
  if (transaksiObat=1) and (isRacikan<>1) then
  begin
    isiToapotik;
  end else if (key=vk_return) and (isRacikan=1) then
  begin
   isiToRacikan;
  end;

 {    if  isTreatment=1 then
   begin
    //showMessage('treatment mode');
    cekAdmin;
   // frmTreatment.gridTreatment.DataSource.Edit;
    frmTreatment.gridTreatment.Fields[0].Value := date();
    frmTreatMent.gridTreatment.Fields[1].Value := time();
    frmTreatment.gridTreatment.Fields[2].Value := gridViewObat.Fields[0].Value;
    frmTreatment.gridTreatment.Fields[3].Value := gridViewObat.Fields[1].Value;
    frmTreatment.gridTreatment.Fields[4].Value := (gridViewObat.Fields[2].Value)+(gridViewObat.Fields[2].Value*tempObat/100);
    frmTreatment.gridTreatment.Fields[5].Value :=1;
    frmTreatment.gridTreatment.Fields[7].Value :=1;
    frmViewObat.Close;
   end;
  }
 end;
  if key=vk_escape then
 begin
   frmViewObat.Close;
 end;
end;

procedure TfrmViewObat.cariChange(Sender: TObject);
begin
     with dm.dsetObatView do
     begin
       Locate('obNama',Cari.Text,[loPartialKey]);
     end;
end;

procedure TfrmViewObat.gridViewObatTitleClick(Column: TColumn);
begin
 if gridViewObat.Fields[1].FieldName='obNama' then
 begin
   with dm.dsetObatView do
   begin
     showmessage('nama obat di klik');
     active:=false;
     commandType := cmdText;
     commandText := 'select * from taobat '+
     'order by obnama asc ';
     active:=true;
   end;
 end
   else
   if gridViewObat.Fields[0].FieldName='obkode' then
   begin
    with dm.dsetObatView do
    begin
     showmessage('obat di klik');
     active:=false;
     commandType := cmdText;
     commandText := 'select * from taobat '+
     'order by obkode desc ';
     active:=true;
   end;
  end;
end;

procedure TfrmViewObat.gridViewObatKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in['a'..'z']) then
begin
  close;
end else
  cari.SetFocus;
  cari.Clear;
  cari.text:=key;
  cari.SelStart :=1;

end;

procedure TfrmViewObat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 isObatOK:=0;
 isObatVK:=0;
end;

end.

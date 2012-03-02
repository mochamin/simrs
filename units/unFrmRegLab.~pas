unit unFrmRegLab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls,db,adodb, Grids, strutils,DBGrids, Buttons,
  RpCon, RpConDS, RpDefine, RpRave, RpBase, RpSystem;

type
  TfrmRegLab = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gbdata: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    btncancel: TBitBtn;
    Label6: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    btnnew: TBitBtn;
    lblnama: TLabel;
    lbljk: TLabel;
    lblalamat: TLabel;
    btnSave: TButton;
    Label4: TLabel;
    lblnorm: TLabel;
    dbkodeitem: TEdit;
    dbnotransaksi: TEdit;
    dbnoreg: TEdit;
    Button1: TButton;
    Label5: TLabel;
    itemdetail: TMemo;
    dsetbonlabdetail: TADODataSet;
    dsetbonlab: TADODataSet;
    rvprojectbonlab: TRvProject;
    rvbonlab: TRvDataSetConnection;
    rvbonlabdetail: TRvDataSetConnection;
    Label9: TLabel;
    dbdokter: TEdit;
    RvSystem: TRvSystem;
    procedure gridregKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure btnnewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure itemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbnotransaksiKeyPress(Sender: TObject; var Key: Char);
    procedure dbnoregKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbdokterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsetbonlabBeforeOpen(DataSet: TDataSet);
    procedure dsetbonlabAfterOpen(DataSet: TDataSet);
    procedure dsetbonlabdetailBeforeOpen(DataSet: TDataSet);
    procedure dsetbonlabdetailAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure autonumber;
    procedure viewPasien;
    procedure clearArea;
  public
    { Public declarations }
  end;

var
  frmRegLab: TfrmRegLab;

implementation

uses unfrmviewtariflab, unDm, unFrmPilihPasien,unUtama, unFrmViewPasien,
  unFrmViewPasienPoli, unFrmAddPasien,kwitansi, unfrmViewRawatInap,
  unFrmViewDokter,unfrmWait;

{$R *.dfm}

procedure TfrmRegLab.clearArea;
begin
  dbnotransaksi.Clear;
  dbnoreg.Clear;
  dbkodeitem.Clear;
  lbljk.Caption := '';
  lblnama.Caption :='';
  lblalamat.Caption := '';
  lblnorm.Caption := '';
  itemdetail.Clear;
end;

procedure TfrmRegLab.viewPasien;
begin
  if isLabRAwatInap = 1 then
  begin
    frmViewRawatInap.ShowModal;
  end else
  if isLabPoli =1 then
  begin
      frmViewPasienPoli.ShowModal;
  end else if isLabLuar=1 then
           begin
             frmViewPasien.ShowModal;
           end;
end;

procedure TfrmRegLab.autoNumber;
var zerofill  : string;
    curNumber : integer;
    curNoReg  : string;
    thn,bln,tgl,dbbln,cutthn : string;

begin

    tgl := LeftStr(dateToStr(date()),2);
    bln := AnsiMidStr(dateToStr(date()),4,2);  // ambil 2 digit bulan
    thn := RightStr(dateToStr(date()),2);

  with dm.dsetlab do
  begin
    active:=false;
    commandType := cmdText;
    commandText := 'select * from talab '+
    'order by lb_idx asc';
    active:=true;
    Last; // go to the last of the record

    dbbln := AnsiMidStr(fields.fieldByname('lbkode').AsString,3,2);
    curNoReg := RightStr(fields.fieldByname('lbkode').AsString,3); //ambil 6 digit dari No RM di database
    curNumber := strToInt(curNoReg)+1;


    case Length(intToStr(curNumber)) of
    1 : zeroFill := '00';
    2 : zerofill := '0';
    3 : zerofill := '';

    end;

    Append; // tambahkan record;
   if (dbbln<>bln)  then
   begin
      dbnoTransaksi.Text := tgl+bln+thn+'001'
   end else dbnoTransaksi.Text := tgl+bln+thn+zeroFill+intToStr(curNumber);
  end;
end;

procedure TfrmRegLab.gridregKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 {if key=vk_return then
 begin
   frmviewtariflab.ShowModal;
 end;
 if key=vk_delete
  }
 case key of
 vk_return : frmViewtariflab.ShowModal;
 vk_delete : dm.dsetreglab.Delete;
 end;

end;

procedure TfrmRegLab.FormActivate(Sender: TObject);
begin
 if dm.dsetreglab.Active = false then dm.dsetreglab.Active := true;
 dm.dsetreglab.CancelBatch(arAll);
 //gridreg.SetFocus;
 //total.Text :='0';
 isRegLabPoli :=1;
end;

procedure TfrmRegLab.BitBtn1Click(Sender: TObject);
begin
if MessageDlg('Simpan Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin

 
end;
end;

procedure TfrmRegLab.btncancelClick(Sender: TObject);
begin
  if messageDlg('Batalkan Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    clearArea;
  gbdata.Enabled := false;
  btnSave.Visible := false;
  btnCancel.Visible := false;
   isLabLuar:=0;
  isLabRAwatInap:=0;
  isLabPoli:=0;
  end;
end;

procedure TfrmRegLab.btnnewClick(Sender: TObject);
begin
 frmPilihpasien.ShowModal;
 gbdata.Enabled := true;
 btnSave.Visible := true;
 btncancel.Visible := true;
 autonumber;
 dbnoreg.SetFocus;
end;

procedure TfrmRegLab.btnSaveClick(Sender: TObject);
var i :integer;
    Kode : string;
    totalBiayaLab : integer; //variable penampung total biaya lab
    notransaksi,terbilang : string;
    total : integer;
    jaminan : string;
begin
   totalBiayaLab:=0;



if MessageDlg('Simpan Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
 notransaksi:=dbnotransaksi.Text;


  for i:=1 to Length(dbkodeItem.Text) do
  begin
   if AnsiMatchText(';',[dbKodeitem.Text[i]])= true then
   begin
     Kode:=AnsiMidStr(dbKodeitem.Text,i-3,3); // cari kode di dalam editbox "item"
     // query untuk mengumpulkan item lab berdasarkan kode yang ditemukan
       with dm.dsetItemLab do
       begin
       active:=false;
       commandType :=cmdText;
       commandText :='select * from taitemlab '+
       'where ilkodetarif =(:kodetarif) ';
       parameters.ParamByName('kodetarif').Value := kode;
       active:=true;
          //setelah item lab dikelompokkan berdasarkan query, maka dilakukan pengcopy-an
          //dari taItemlab ke dalam taLabDetail guna pengisian hasil.
        if isEmpty=false then
        begin
          //showMessage('field ditemukan!');
        end;

          First;
          dm.dsetLabDetail.Open;
          while not eof do
          begin
            dm.dsetLabDetail.Append;
            dm.dsetLabDetail.FieldByName('ldkode').AsString     := dbnotransaksi.Text;
            dm.dsetLabDetail.FieldByName('ldkodeitem').AsString := fields.fieldByname('ilkode').AsString;
            dm.dsetLabDetail.FieldByName('lditem').AsString     := fields.fieldByName('ilitem').AsString;
            dm.dsetLabDetail.FieldByName('ldSatuan').AsString   := fields.fieldByName('ilSatuan').AsString;
            dm.dsetLabDetail.FieldByName('ldgroup').AsString    := fields.fieldbyName('ilGroup').AsString;
            dm.dsetLabDetail.FieldByName('ldTitle').AsString    := fields.fieldByName('ilTitle').AsString;
            dm.dsetLabDetail.fieldByName('ldvalue').AsString := '';
            dm.dsetLabDetail.FieldByName('ldsign').AsString :='';
            dm.dsetLabDetail.fieldByname('ldtotal').AsInteger := 0;

          //-- Cek Item Lab yang hasilnya berpengaruh terhadap jenis kelamin SEseorang
          if fields.FieldByName('ilisGender').AsString = 'Y' then
          begin
             // -------- cek Jenis Kelamin pasien masukkan standard berdasarkan jenis Kelamin
               if lbljk.Caption='P' then  // jika jenis kelamin pasien pria
               begin
                 dm.dsetLabDetail.FieldByName('ldStandard').AsString := fields.fieldByName('ilnormalpria').AsString;
               end else
               begin  // jika jenis kelamin pasien wanita
                   dm.dsetLabDetail.FieldByName('ldStandard').AsString := fields.fieldByName('ilnormalwanita').AsString;
               end; // end of lbljk.caption
             //----------------------------------------------------------
          end else // else of ilisGender === statement di bawah ini klo item test lab tidak terpengaruh jenis kelamin
          begin
            dm.dsetLabDetail.FieldByName('ldStandard').AsString := fields.fieldByName('ilnormal').AsString;
          end; // end of fileds.fieldbyName('ilisgender')


          Next; // next of dsetitemlab
           // showmessage('di akhir post');
          end; // end of while not eof
           dm.dsetLabDetail.UpdateBatch(arAll);
       end; // end of with dm.dsetlab

         // Menghitung Total Biaya Lab berdasarkan Tarif yang diambil pada tabel taTarifLab
          if dm.dsettariflab.Locate('tlkode',kode,[loCaseInsensitive])= true then
          begin
          totalBiayaLab := totalBiayaLab+dm.dsettariflab.fieldByName('tltarif').AsInteger;
          //showMessage((dm.dsettariflab.fieldByName('tlitemlab').AsString)+': tarif Rp '+intToStr(dm.dsettariflab.fieldByName('tltarif').AsInteger));
          //showMessage(intToStr(totalBiayaLab));
          end;


   end;// end of if AnsiMatch text
  end; //end of for i:=1 to...

  ///// CEK APAKAH PASIEN TERSEBUT JAMINAN PERUSAHAAN
  with dm.dSetPasien do
  begin
   active:=true;
   if locate('pskodepasien',lblnorm.Caption,[locaseinsensitive])=true then
   begin
       jaminan :=fieldByName('psJenisPasien').AsString;
   end;
  end;

  // daftarkan pada database lab;
  with dm.dsetLab do
  begin
    open;
    append;
    fields.FieldByName('lbkode').AsString       := dbnotransaksi.Text;
    fields.FieldByName('lbnorm').AsString       := dbnoreg.Text;
    fields.FieldByName('lbjk').AsString         := lbljk.Caption;
    fields.FieldByName('lbnama').AsString       := lblnama.Caption;
    fields.FieldByName('lbrekammedik').AsString := lblnorm.Caption;
    fields.FieldByName('lbitem').AsString       := dbkodeitem.Text;
    fields.FieldByName('lbtotal').AsInteger     := totalBiayaLab;
    fields.FieldByName('lbitemdetail').AsString := itemdetail.Text;
    fields.FieldByName('lbtgl').AsString        := dateToStr(date());
    fields.FieldByName('lbtglwkt').AsDateTime   := now();
    fields.FieldByName('lbpenjamin').AsString   := jaminan;
    fields.FieldByName('lbdokter').AsString     := dbdokter.Text;
    post;
    updatebatch(arCurrent);
  end; // end of dm.dsetlab

  showMessage('Pendaftaran Sukses...');
  clearArea;
  gbdata.Enabled := false;
  btnSave.Visible := false;
  btnCancel.Visible := false;
  isLabLuar:=0;
  isLabRAwatInap:=0;
  isLabPoli:=0;

  // Cetak Bon Lab
  with dsetbonLab do
  begin
    active:=false;
    commandType :=cmdText;
    commandText :='select * from talab,tapasien '+
    'where lbrekammedik like pskodepasien '+
    'and lbkode like (:kode)';
    parameters.ParamByName('kode').Value := notransaksi;
    active:=true;

    if isEmpty=false then
    begin
      total:=0;
      total:=fields.fieldbyname('lbtotal').AsInteger;
    end;


  end;

  terbilang:=rupiah(intToStr(total));

 rvprojectbonlab.ProjectFile:='bonlab.rav';
 rvprojectbonlab.Open;
 rvprojectbonlab.SelectReport('bonlab.rav',true);
 rvprojectbonlab.SetParam('currentuser',AnsiUpperCase(iscurrentuser));

 rvprojectbonlab.SetParam('terbilang',AnsiUpperCase(terbilang));
 rvprojectbonlab.SetParam('Total',intToStr(Total));
 rvprojectbonlab.Execute;

 end; // end of if messageDlg...
end;

procedure TfrmRegLab.itemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
 vk_return : frmviewtariflab.ShowModal;
 end;
end;

procedure TfrmRegLab.dbnotransaksiKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmRegLab.dbnoregKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
 vk_return : ViewPasien;
 end;
end;

procedure TfrmRegLab.Button1Click(Sender: TObject);
begin
 frmAddPasien.Show;
 frmAddPasien.btnNew.Click;
end;

procedure TfrmRegLab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 isRegLabPoli:=0;
end;

procedure TfrmRegLab.dbdokterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
 vk_return : frmViewDokter.ShowModal;

 end;
end;

procedure TfrmRegLab.dsetbonlabBeforeOpen(DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading Report. Mohon Tunggu...');
end;

procedure TfrmRegLab.dsetbonlabAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure TfrmRegLab.dsetbonlabdetailBeforeOpen(DataSet: TDataSet);
begin
  tunggu.openWait;
 tunggu.showWait('Loading Report. Mohon Tunggu...');
end;

procedure TfrmRegLab.dsetbonlabdetailAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

end.

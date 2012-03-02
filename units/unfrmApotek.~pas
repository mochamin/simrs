unit unfrmApotek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, db,adodb,Mask,StrUtils, Buttons, Grids,
  DBGrids, ComCtrls, RpCon, RpConDS, RpDefine, RpRave, RpBase, RpSystem;

type
  TfrmApotek = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gbDataUmum: TGroupBox;
    gbObat: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbNoTransaksi: TDBEdit;
    cbTipeCustomer: TDBComboBox;
    lblNoReg: TLabel;
    dbNoReg: TDBEdit;
    gbviewdata: TGroupBox;
    btnSave: TBitBtn;
    btnNew: TBitBtn;
    btnCancel: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblNama: TLabel;
    lblUsia: TLabel;
    lblAlamat: TLabel;
    gridObat: TDBGrid;
    dbTanggal: TDBEdit;
    Label6: TLabel;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    txtBayar: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    txtTotal: TMemo;
    txtKembali: TMemo;
    lblkembali: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ApotikStatusBar: TStatusBar;
    RvProject1: TRvProject;
    rvApotik: TRvDataSetConnection;
    Label13: TLabel;
    lbldokter: TLabel;
    Label12: TLabel;
    dbtglwkt: TDBEdit;
    dbnama: TDBEdit;
    dbusia: TDBEdit;
    dbalamat: TDBMemo;
    dbpenjamin: TDBEdit;
    Label14: TLabel;
    RvProjectStrukApotik: TRvProject;
    RvSystem1: TRvSystem;
    rvstrukdetail: TRvDataSetConnection;
    dsetstrukapotik: TADODataSet;
    procedure dbNoRegKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNewClick(Sender: TObject);
    procedure cbTipeCustomerClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure dbTanggalKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure gridObatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbNoTransaksiKeyPress(Sender: TObject; var Key: Char);
    procedure dbppnClick(Sender: TObject);
    procedure dbppnKeyPress(Sender: TObject; var Key: Char);
    procedure txtTotalKeyPress(Sender: TObject; var Key: Char);
    procedure txtBayarKeyPress(Sender: TObject; var Key: Char);
    procedure txtKembaliKeyPress(Sender: TObject; var Key: Char);
    procedure txtBayarChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtBayarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbTipeCustomerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridObatDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbusiaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure autonumber;
    procedure updateStokObat;
    procedure cekStokObat;
  public
    { Public declarations }
  end;

var
  frmApotek: TfrmApotek;
  isTransaksiApotik : integer;
  isError : integer;
implementation

uses unfrmViewRawatInap, unDm, unFrmViewPasienPoli,unUtama, unViewObat,
  unFrmPassword, frmviewbiayatambahan, unfrmracikan, dmzun;

{$R *.dfm}

procedure TfrmApotek.updateStokObat;
var kode,kodeobat : string;
    qty : integer;
begin
   kode := trim(dbnotransaksi.Text);


   with dm.dsetapotikdetail do
   begin
     First; // goto the first record of query
     while not eof do
     begin

     if dm.dsetObat.Locate('obkode',Trim(fieldByname('adkodeobat').AsString),[loCaseinsensitive])=true then
        begin
         //showmessage('Obat : '+dm.dsetObat.fieldbyname('obkode').AsString);

         // input ke dalam kartu stock
           dmz.kartustockdset.Open;
           dmz.kartustockdset.append;
           dmz.kartustockdset.fieldbyname('ks_tgl').Value         := date();
           dmz.kartustockdset.FieldByName('ks_wkt').Value         := time();
           dmz.kartustockdset.FieldByName('ks_kodeobat').Value    :=  fieldbyname('adkodeobat').Value;
           dmz.kartustockdset.fieldbyname('ks_notransaksi').Value :=  dbnotransaksi.Text;
           dmz.kartustockdset.fieldbyname('ks_stokawal').Value    :=  dm.dSetObat.fieldbyname('obstok').Value;
           dmz.kartustockdset.fieldbyname('ks_stoktrans').Value   :=  fieldByname('adqty').AsInteger;
           dmz.kartustockdset.fieldbyname('ks_stokakhir').Value   :=  dm.dSetObat.fieldbyname('obstok').Value-fieldByname('adqty').AsInteger;
           dmz.kartustockdset.FieldByName('ks_pic').Value         :=  isCurrentUser;
           dmz.kartustockdset.FieldByName('ks_ket').Value         := 'Penjualan';
           dmz.kartustockdset.Post;
         ///////////////////////////////


         dm.dsetObat.Open;
         dm.dsetObat.Edit;
         dm.dsetObat.FieldByName('obstok').AsInteger:= (dm.dsetObat.FieldByName('obstok').AsInteger)-(fieldByname('adqty').AsInteger);
         dm.dsetObat.Post;



        end; // end of if dm.dsetobat.locate
     next;
    end; // end of while not eof

   dm.dsetObat.UpdateBatch(arAll);

   end;// end of dm.dsetapotikdetail



end;

procedure TfrmApotek.cekStokObat;
var stok : integer;

    kodeobat : string;
begin
   kodeobat := gridObat.Fields[0].Value;


   with dm.dSetObat do
   begin
      if locate('obkode',kodeobat,[loCaseInsensitive])=true then
      begin

        stok := fields.fieldByName('obstok').AsInteger;
        showMessage('Current Qty :'+intToStr(currentqty));
        if stok < Currentqty then
        begin
          showMessage('stok tidak cukup');
          gridObat.Fields[4].FocusControl;
        end else begin
                 showmessage('stok cukup');
                 dm.dsetApotikDEtail.Append;
                 end;
      end;
   end;

end;



procedure TfrmApotek.autoNumber;
var tempUrut : integer;
    tempKode : string;
    zeroFill : string;
    tgl,bln,thn : string;
    cutBulan : string;
    curnumber : integer;
    dbbln : integer;
    curnoreg : string;
begin
  //  '200806260004'
  // 01/02/2008
    tgl := AnsiMidStr(dateToStr(now),1,2);
    bln := AnsiMidStr(dateToStr(now),4,2);
    thn := AnsiMidStr(dateToStr(now),7,4);

//if LeftStr(DateToStr(now()),2)<>'01' then
//begin
  with dm.dsetApotik do
  begin
     active:=false;
     commandType := cmdText;
     commandText := 'select * from taapotik '+
     'ORDER BY ap_idx DESC limit 10 ';
     active:=true;
    // Last;

    cutBulan := AnsiMidStr(fields.fieldByName('apKodeapotik').AsString,5,2);
    dbbln    := strToInt(cutBulan);
    curNoReg := RightStr(fields.fieldByname('apkodeapotik').AsString,4);
    curNumber := strToInt(curNoReg)+1;


      case Length(intToStr(curNumber)) of
      1 : zeroFill := '000';
      2 : zeroFill := '00';
      3 : zeroFill := '0';
      4 : zeroFill := '';
      end;
      
     append;
  end; // end of dm dsetapotik

   if (dbbln<>strToInt(bln))  then
   begin
      dbnotransaksi.Text := thn+bln+tgl+'0001';
   end else dbnotransaksi.Text := thn+bln+tgl+zeroFill+intToStr(curNumber);
  
end;

procedure TfrmApotek.dbNoRegKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (key=vk_return) and (cbTipeCustomer.ItemIndex=2) and (Length(dbnoreg.Text)=0) then
  begin
   frmViewRawatInap.ShowModal;
  end;
   if (key=vk_return) and (cbTipeCustomer.ItemIndex=1) and (Length(dbnoreg.Text)=0) then
  begin
   frmViewPasienpoli.ShowModal;
  end;

  if (key=vk_return) and (Length(dbnoreg.Text)<>0) then
  begin
   gridObat.SetFocus;
  end;


end;

procedure TfrmApotek.btnNewClick(Sender: TObject);
begin

 isError:=0;
 isTransaksiApotik := 1;
 gbDataUmum.Enabled := true;
 gbObat.Enabled := true;
 cbTipeCustomer.SetFocus;
 with dm.dsetapotik do
 begin

   open;
   append;
   autonumber;
   //dbppn.Text := '0';
 end;

 with dm.dsetApotikDEtail do
 begin
   open;
   append;
 end;
  lbldokter.Caption := '[]';
  lblnama.Caption :='[]';
  lblusia.Caption := '[]';
  lblalamat.Caption := '[]';
  dbTanggal.Text := dateToStr(date());
  cbtipecustomer.SetFocus;
  btnSave.Visible := true;
  btnCancel.Visible := true;

end;

procedure TfrmApotek.cbTipeCustomerClick(Sender: TObject);
begin
 dm.dSetApotik.Post;
 case cbtipecustomer.ItemIndex of
 0 : begin
     dbnoreg.Enabled := false;
     lblNoReg.Enabled := false;
     dbnama.Visible := true;
     dbusia.Visible := true;
     dbAlamat.Visible := true;
     dbnama.SetFocus;
     end;
 1 : begin
     dbnoreg.Enabled := true;
     lblNoReg.Enabled := true;
     //dbnoreg.SetFocus;
     end;
 2 : begin
     dbnoreg.Enabled := true;
     lblNoReg.Enabled := true;
     //dbnoreg.SetFocus;
     end;
 end;
end;

procedure TfrmApotek.btnCancelClick(Sender: TObject);
begin
if MessageDlg('Cancel Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
 if dm.dsetApotikDEtail.IsEmpty=false then
 begin
  dm.dsetApotikDEtail.Delete;
 end;

 if dm.dSetObat.isEmpty=false then
 begin
   dm.dSetObat.Delete;
   dm.dSetObat.CancelBatch(arAll);
 end else
   dm.dSetObat.CancelBatch(arAll);
 begin
 end;

  dm.dSetApotik.CancelBatch(arAll);
  //dm.dSetApotikDetail.CancelBatch(arAll);

       dbnama.Visible := false;
     dbusia.Visible := false;
     dbAlamat.Visible := false;
     
  isTransaksiApotik := 0;
  dm.dSetApotik.Close;
  dm.dsetApotikDEtail.Close;
  lblkembali.Caption:='';
  lblnama.Caption :='[]';
  lblusia.Caption := '[]';
  lblalamat.Caption := '[]';
   btnSave.Visible := false;
  btnCancel.Visible := false;
  gbDataUmum.Enabled := false;
     gbObat.Enabled := false;
  txtTotal.Text:='0';
   txtBayar.Text := '0';
 txtKembali.Text := '0';
  lbldokter.Caption := '';

end;
end;

procedure TfrmApotek.btnSaveClick(Sender: TObject);
var notransaksi : string;
begin
notransaksi := trim(dbnotransaksi.Text);
if MessageDlg('Simpan Transaksi?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
 //updatestokobat;
 dm.dSetApotik.Fields.FieldByName('apjam').AsDateTime := time();
 dm.dSetApotik.Fields.FieldByName('apTotal').AsCurrency := strToInt(txtTotal.Text);
 dm.dsetapotik.Fields.FieldByName('appic').Value := isCurrentUser;
try
 dm.dSetApotik.UpdateBatch(arall);
 dm.dsetApotikDetail.UpdateBatch(arAll);
except
  messageDlg('Pasien sudah order obat. Pilih pasien lain!',mtError,[mbok],0);
end;

 updateStokObat;

      dbnama.Visible := false;
     dbusia.Visible := false;
     dbAlamat.Visible := false;

////// jika customer apotik adalah pasien poli
////// Ubah status di table taLayananPoli

 if cbtipecustomer.ItemIndex=1 then
 begin
  if dm.dsetLayananPoli.Active = false then
  dm.dsetLayananPoli.Active := true;
  with dm.dsetLayananPoli do
  begin
   if Locate('lpnoreg',dbnoreg.Text,[loCaseInsensitive])=true then
   begin
    open;
    edit;
    fieldByName('lpisperiksaonly').AsInteger := 0;
    post;
    updateBatch(arCurrent);
   end;
  end; // end of dm dset
 end;
/////////////// end of jika pasien poli

// PROSEDURE MENCETAK STRUK

 with dsetStrukApotik do
 begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from taapotikdetail '+
   'where adkodeapotik like (:kode) ';
   parameters.ParamByName('kode').Value := notransaksi;
   active:=true;
   //if isEmpty=false then showmessage('qtmu') else showmessage('no data');
 end;

 rvProjectStrukApotik.ProjectFile:='strukapotik.rav';
 rvProjectStrukApotik.Open;
 rvProjectStrukApotik.SelectReport('strukapotik.rav',true);
 rvProjectStrukApotik.SetParam('noreg',dbnotransaksi.Text);
 rvProjectStrukApotik.SetParam('namapasien',lblnama.caption);
 rvProjectStrukApotik.SetParam('jaminan',dbpenjamin.text);
 rvProjectStrukApotik.SetParam('namadokter',lbldokter.Caption);
 
 rvProjectStrukApotik.SetParam('currentuser',AnsiUpperCase(iscurrentuser));

 rvProjectStrukApotik.Execute;

//////////////////////////////

 lblkembali.Caption:='';
  btnSave.Visible := false;
  btnCancel.Visible := false;
   gbDataUmum.Enabled := false;
   gbObat.Enabled := false;
   txtTotal.Text := '0';
    txtBayar.Text := '0';
   txtKembali.Text := '0';
   isTransaksiApotik := 0;
   lbldokter.Caption := '';
end;
end;

procedure TfrmApotek.dbTanggalKeyPress(Sender: TObject; var Key: Char);
begin

 if not (key in['0'..'9','/',#8]) then
 begin
   key:=#0;
 end;
end;

procedure TfrmApotek.FormActivate(Sender: TObject);
begin
if dm.dSetObat.Active=false then dm.dSetObat.Active:=true;
if dm.dSetApotik.Active=false then dm.dSetApotik.Active:=true;
if dm.dsetApotikDEtail.Active=false then dm.dsetApotikDEtail.Active:=true;
 
try
if isCreator<>1 then
begin
 with frmPassword.dsetPassword do
 begin
   username := Fields.fieldByName('usNama').AsString;
   group := fields.fieldByName('ugNamaGroup').AsString;
 end;
end;
finally
 lblkembali.Caption:='';
 transaksiObat:=1;
 txtTotal.Text :='0';
 txtBayar.Text := '0';
 txtKembali.Text := '0';
end; 
 apotikStatusBar.Panels[0].Text := ' User: '+username;
 apotikStatusBar.Panels[1].Text := ' Group Access : '+group;

end;

procedure TfrmApotek.gridObatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=vk_return) and (frmApotek.gridObat.Fields[4].Value=null)  then
 begin
  
   frmViewObat.ShowModal;
 end else
 if (key=vk_return)  then
 begin
    dm.dsetApotikDEtail.Append;
  end;

 
 if key=vk_delete then
 begin
   dm.dsetApotikDEtail.Delete;
  
 end;
 if key=vk_f4 then
 begin
  txtBayar.SetFocus;
 end;
  if key=vk_f5 then
 begin
   frmRacikan.ShowModal;
 end;


end;

procedure TfrmApotek.dbNoTransaksiKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmApotek.dbppnClick(Sender: TObject);
begin
 {if dbppn.Text='10' then
 begin
   txtTotal.Text := IntToStr(strToInt(txtTotal.Text)+StrToInt(txtTotal.Text)*10);
 end;}
end;

procedure TfrmApotek.dbppnKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmApotek.txtTotalKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmApotek.txtBayarKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9',#8]) then
 begin
   key:=#0;
 end;  
end;

procedure TfrmApotek.txtKembaliKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmApotek.txtBayarChange(Sender: TObject);
var total,bayar,kembali : integer;
begin
if isTransaksiApotik=1 then
begin
 if length(txtBayar.Text)=0 then
 begin
   txtBayar.Text := '0';
 end else
 begin
  total := strToInt(txtTotal.Text);
  bayar := strToInt(txtBayar.Text);
  kembali := strToInt(txtKembali.Text);

  kembali := bayar-total;
  txtKembali.Text := intToStr(kembali);
  if bayar < total then
  begin
     lblKembali.Caption := 'KURANG';
     lblkembali.Alignment := taRightJustify;
     lblkembali.Font.Color := clRed;
  end else
      if bayar=total then
      begin
        lblKembali.Caption := 'PAS';
        lblkembali.Font.Color := clBlue;
         lblkembali.Alignment := taRightJustify;
      end else
      if bayar > total then
      begin
        lblKembali.Caption := 'KEMBALI';
        lblkembali.Font.Color := clBlack;
        lblkembali.Alignment := taRightJustify;
      end;
 end;
end;
end;

procedure TfrmApotek.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if isTransaksiApotik=1 then
 begin
   showMessage('Masih ada transaksi berlangsung!'+#13+
   'Silahkan Anda tekan tombol "Save" apabila transaksi akan disimpan,'+#13+
   'atau tombol "Cancel" apabila transaksi ingin dibatalkan!');
   btnCancel.SetFocus;
   abort;
 end;
end;

procedure TfrmApotek.txtBayarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_f4 then
 begin
   gridObat.SetFocus;
 end;
end;

procedure TfrmApotek.cbTipeCustomerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=vk_return) and (cbtipecustomer.ItemIndex=0) then
 begin
   gridobat.SetFocus;
 end else if (key=vk_return) then
 begin
  dbnoreg.SetFocus;
 end;
end;

procedure TfrmApotek.gridObatDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 gridobat.Fields[5].AsCurrency;
 if dm.dsetapotikdetail.FieldByName('adisracik').AsInteger =1 then
 begin
    gridobat.Canvas.Brush.Color :=clInactiveCaptionText;

   gridObat.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
 
end;

procedure TfrmApotek.dbusiaKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9',#8]) then key:=#0;
end;

end.

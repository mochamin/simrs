unit unDm;

interface

uses
  SysUtils, Classes, DB,Dialogs, ADODB,Messages,Windows,StrUtils, DBClient,
  SimpleDS;

type
  Tdm = class(TDataModule)
    dsourceDokter: TDataSource;
    dSourceKaryawan: TDataSource;
    dSetPasien: TADODataSet;
    dSourcePasien: TDataSource;
    dSetLayanan: TADODataSet;
    dSourceLayanan: TDataSource;
    dSetPoli: TADODataSet;
    dSourcePoli: TDataSource;
    dSetDept: TADODataSet;
    dSourceDept: TDataSource;
    dSourceKamar: TDataSource;
    dsetApotikPasien: TADODataSet;
    dsourceApotikPasien: TDataSource;
    dSetObat: TADODataSet;
    dSourceObat: TDataSource;
    dSetApotik: TADODataSet;
    dSourceApotikMaster: TDataSource;
    taApotik: TADOTable;
    dSourceApotikDetail: TDataSource;
    taApotikDetail: TADOTable;
    dsourceApotik: TDataSource;
    dSetJK: TADODataSet;
    dsourceJK: TDataSource;
    dsetLayananPoli: TADODataSet;
    dSetRawatInap: TADODataSet;
    dsourceRawatInap: TDataSource;
    dsetViewKamar: TADODataSet;
    dSourceViewKamar: TDataSource;
    dsetObatView: TADODataSet;
    dSourceObatView: TDataSource;
    dsetViewRawatInap: TADODataSet;
    dSourceViewRawatInap: TDataSource;
    dSetServices: TADODataSet;
    dSourceServices: TDataSource;
    dSetPasienKaryawan: TADODataSet;
    dSetPerusahaan: TADODataSet;
    dsourcePerusahaan: TDataSource;
    dsourcePasienKaryawan: TDataSource;
    dSetViewPasienKaryawan: TADODataSet;
    dSourceViewPasienKaryawan: TDataSource;
    dsetOptions: TADODataSet;
    dsourceOptions: TDataSource;
    dSetRumahSakit: TADODataSet;
    dsourceRumahSakit: TDataSource;
    dsetRptRawatInap: TADODataSet;
    dsourceRptRawatInap: TDataSource;
    dsetKamarDetail: TADODataSet;
    dsetItemLab: TADODataSet;
    dsourceItemLab: TDataSource;
    dsetGroupLab: TADODataSet;
    dsetLab: TADODataSet;
    dsourceLab: TDataSource;
    dsetLabDetail: TADODataSet;
    dsourceLabDetail: TDataSource;
    dsetRontgen: TADODataSet;
    dsourceRontgen: TDataSource;
    dsetKaryawan: TADODataSet;
    dsetresetkamar: TADODataSet;
    dsetPerujuk: TADODataSet;
    dsourcePerujuk: TDataSource;
    dsetLayananRontgen: TADODataSet;
    dsourceLayananRontgen: TDataSource;
    qrUpdateRontgen: TADOQuery;
    dsetViewDokter: TADODataSet;
    dsourceViewDokter: TDataSource;
    dsetAdministrasi: TADODataSet;
    dsourceAdministrasi: TDataSource;
    dsetAlkes: TADODataSet;
    dsourceAlkes: TDataSource;
    dsetViewKamarDetail: TADODataSet;
    dsetRptKamarDetail: TADODataSet;
    dsetPasienKeluar: TADODataSet;
    dsourcepasienkeluar: TDataSource;
    dsetViewPasienPoli: TADODataSet;
    dsourceViewPasienPoli: TDataSource;
    dsetApotikDEtail: TADODataSet;
    dsetTarifDokter: TADODataSet;
    dsourcetarifdokter: TDataSource;
    dsetRptLayananPoli: TADODataSet;
    dsetpersenadmin: TADODataSet;
    dsetdokter: TADODataSet;
    dsettempobat: TADODataSet;
    dsetviewmigrasi: TADODataSet;
    dsourceviewmigrasi: TDataSource;
    dsettambahbiayaapotik: TADODataSet;
    dsourcetambahbiayaapotik: TDataSource;
    dsetadmpoli: TADODataSet;
    dsourceadmpoli: TDataSource;
    dsetstokopname: TADODataSet;
    dsourcestokopname: TDataSource;
    dsetupdatepassword: TADODataSet;
    dsetrptrawatinapdetail: TADODataSet;
    dsetrptobat: TADODataSet;
    dsetrptlayananrontgen: TADODataSet;
    dsetrptadministrasi: TADODataSet;
    dsetrptpolitorwtinap: TADODataSet;
    dsetSatuan: TADODataSet;
    dsourceGroupLab: TDataSource;
    dsourcesatuan: TDataSource;
    dsetAntrian: TADODataSet;
    dsourceantrian: TDataSource;
    dsetracikan: TADODataSet;
    dsourceracikan: TDataSource;
    dsettariflab: TADODataSet;
    dsourcetariflab: TDataSource;
    dsetviewpasienlab: TADODataSet;
    dsourceviewlab: TDataSource;
    dsetreglab: TADODataSet;
    dsourcereglab: TDataSource;
    dsetrptlab: TADODataSet;
    dsethasillab: TADODataSet;
    dsourcehasillab: TDataSource;
    dsetviewreglab: TADODataSet;
    dsourceviewreglab: TDataSource;
    connKlinik: TADOConnection;
    dsetviewpasienrontgen: TADODataSet;
    dsourceviewpasienrontgen: TDataSource;
    dsetsettingjam: TADODataSet;
    dsetuangkeluar: TADODataSet;
    dsourceuangkeluar: TDataSource;
    dsetcektarifdokter: TADODataSet;
    dsetrawatbaby: TADODataSet;
    dsourcerawatbaby: TDataSource;
    dsetcustapotik: TADODataSet;
    dsourcecustapotik: TDataSource;
    dsetkwitansi: TADODataSet;
    dsetviewpolidiag: TADODataSet;
    dsourceviewpolidiag: TDataSource;
    dsetdiagnosa: TADODataSet;
    dsetdiagnosadetail: TADODataSet;
    dsourcediagnosa: TDataSource;
    dsourcediagnosadetail: TDataSource;
    dsetviewpenyakit: TADODataSet;
    dsourceviewpenyakit: TDataSource;
    dsresetkamar: TDataSource;
    dsetkamar: TADODataSet;
    dsetresetkamarkaKode: TStringField;
    dsetresetkamarkaNama: TStringField;
    dsetresetkamarkaFasilitas: TStringField;
    dsetresetkamarkaJmlBed: TIntegerField;
    dsetresetkamarkaRate: TIntegerField;
    dsetresetkamarkaBedStok: TIntegerField;
    dsetresetkamarkaKeterangan: TIntegerField;
    dsetAntrianlpNoReg: TStringField;
    dsetAntrianlpTgl: TDateField;
    dsetAntrianlpKodePasien: TStringField;
    dsetAntrianNamaPasien: TStringField;
    dsetAntrianAlamatPasien: TStringField;
    dsetAntrianUsiaPasien: TStringField;
    dsetAntrianKota: TStringField;
    dsetAntrianNoRM: TStringField;
    dsetmigrasi: TADODataSet;
    dsetbeli: TADODataSet;
    dsetbelidetail: TADODataSet;
    dsbeli: TDataSource;
    dsbelidetail: TDataSource;
    dsetbelidetailpd_Id: TAutoIncField;
    dsetbelidetailpd_notransaksi: TStringField;
    dsetbelidetailpd_kodeobat: TStringField;
    dsetbelidetailpd_namaobat: TStringField;
    dsetbelidetailpd_qty: TIntegerField;
    dsetbelidetailpd_total: TFloatField;
    dsetbelidetailpd_hrga: TFloatField;
    dsetbelipb_Id: TAutoIncField;
    dsetbelipb_notransaksi: TStringField;
    dsetbelipb_tgl: TDateField;
    dsetbelipb_total: TFloatField;
    dsetbelipb_asal: TStringField;
    dsetbelipb_nofaktur: TStringField;
    dsetbelipb_pic: TStringField;
    dsetuser: TADODataSet;
    dsuser: TDataSource;
    dsetbelidetailpd_tgl: TDateField;
    dsetbelidetailpd_kategori: TStringField;
    dsetObatViewobKode: TStringField;
    dsetObatViewobNama: TStringField;
    dsetObatViewobKodeSupplier: TStringField;
    dsetObatViewobSatuan: TStringField;
    dsetObatViewobStok: TIntegerField;
    dsetObatViewobMinStok: TIntegerField;
    dsetObatViewobHargaJual: TIntegerField;
    dsetObatViewobHargaBeli: TIntegerField;
    dsetObatViewobKategori: TStringField;
    dsetObatViewobExpired: TDateField;
    dsetObatViewobMerek: TStringField;
    dsetObatViewobSeri: TStringField;
    dsetObatViewobDiskon: TIntegerField;
    dsetObatViewobson: TIntegerField;
    dsetObatViewobrak: TStringField;
    dsetViewPasienPolilpTgl: TDateField;
    dsetViewPasienPolilpNoReg: TStringField;
    dsetViewPasienPolilpKodeDokter: TStringField;
    dsetViewPasienPolilpKodePasien: TStringField;
    dsetViewPasienPolilpKodepoli: TStringField;
    dsetViewPasienPolilpWktDaftar: TTimeField;
    dsetViewPasienPolilpWktKonsultasi: TTimeField;
    dsetViewPasienPolilpTglWktu: TDateTimeField;
    dsetViewPasienPolilpisbayar: TSmallintField;
    dsetViewPasienPolilpKodeRujuk: TStringField;
    dsetViewPasienPolilpismigrasi: TSmallintField;
    dsetViewPasienPolilpistorawatinap: TWordField;
    dsetViewPasienPolilpkoderawatinap: TStringField;
    dsetViewPasienPolilpatasnama: TStringField;
    dsetViewPasienPolilpkonsuldokter: TFloatField;
    dsetViewPasienPolilppic: TStringField;
    dsetViewPasienPolilpisperiksaonly: TWordField;
    dsetViewPasienPolilpisdiagnosa: TWordField;
    dsetViewPasienPoliusia: TStringField;
    dsetViewPasienPolipsnama: TStringField;
    procedure dsetLabDetailBeforePost(DataSet: TDataSet);
    procedure dsetApotikDEtailBeforePost(DataSet: TDataSet);
    procedure dsetApotikDEtailBeforeDelete(DataSet: TDataSet);
    procedure dsetApotikDEtailAfterDelete(DataSet: TDataSet);
    procedure dsetApotikDEtailAfterPost(DataSet: TDataSet);
    procedure dsetApotikDEtailBeforeEdit(DataSet: TDataSet);
    procedure dsetracikanAfterPost(DataSet: TDataSet);
    procedure dsetracikanBeforeDelete(DataSet: TDataSet);
    procedure dsetracikanBeforeEdit(DataSet: TDataSet);
    procedure dsetracikanBeforePost(DataSet: TDataSet);
    procedure dsetreglabBeforePost(DataSet: TDataSet);
    procedure dsetreglabBeforeDelete(DataSet: TDataSet);
    procedure dsethasillabBeforePost(DataSet: TDataSet);
    procedure dsetpersenadminBeforeOpen(DataSet: TDataSet);
    procedure dSetServicesBeforeOpen(DataSet: TDataSet);
    procedure dsetrawatbabyBeforeOpen(DataSet: TDataSet);
    procedure dSetRumahSakitBeforeOpen(DataSet: TDataSet);
    procedure dsetKaryawanBeforeOpen(DataSet: TDataSet);
    procedure dSetPoliBeforeOpen(DataSet: TDataSet);
    procedure dsetuangkeluarBeforeOpen(DataSet: TDataSet);
    procedure dsetdokterBeforeOpen(DataSet: TDataSet);
    procedure dsetViewKamarBeforeOpen(DataSet: TDataSet);
    procedure dsetRptRawatInapBeforeOpen(DataSet: TDataSet);
    procedure dsetRptRawatInapAfterOpen(DataSet: TDataSet);
    procedure dsetRptKamarDetailBeforeOpen(DataSet: TDataSet);
    procedure dsetRptKamarDetailAfterOpen(DataSet: TDataSet);
    procedure dSetObatBeforeOpen(DataSet: TDataSet);
    procedure dSetObatAfterOpen(DataSet: TDataSet);
    procedure dSetApotikBeforeOpen(DataSet: TDataSet);
    procedure dSetApotikAfterOpen(DataSet: TDataSet);
    procedure dsetApotikDEtailBeforeOpen(DataSet: TDataSet);
    procedure dsetApotikDEtailAfterOpen(DataSet: TDataSet);
    procedure dsetObatViewBeforeOpen(DataSet: TDataSet);
    procedure dsetObatViewAfterOpen(DataSet: TDataSet);
    procedure dsetadmpoliAfterOpen(DataSet: TDataSet);
    procedure dsetadmpoliBeforeOpen(DataSet: TDataSet);
    procedure dsetViewRawatInapBeforeOpen(DataSet: TDataSet);
    procedure dsetViewRawatInapAfterOpen(DataSet: TDataSet);
    procedure dsetviewmigrasiBeforeOpen(DataSet: TDataSet);
    procedure dsetviewmigrasiAfterOpen(DataSet: TDataSet);
    procedure dsetreglabBeforeOpen(DataSet: TDataSet);
    procedure dsetreglabAfterOpen(DataSet: TDataSet);
    procedure dsetdokterAfterOpen(DataSet: TDataSet);
    procedure dsetbelidetailNewRecord(DataSet: TDataSet);
    procedure dsetbelidetailBeforePost(DataSet: TDataSet);

  private
    { Private declarations }
    procedure hitungTotal;
  public
    { Public declarations }

  end;

var
  dm: Tdm;

implementation

uses unFrmLab,  unfrmApotek,unUtama, unfrmracikan, unFrmRegLab,
  unfrmhasillab,unfrmsplash,unfrmwait, pembelianun;



{$R *.dfm}

procedure tdm.hitungTotal;
var i : integer;
    total : integer;
    subtotal: integer;
begin
   
   subTotal:= frmApotek.gridObat.Fields[5].Value; 
   Total:= total+subTotal;


   frmApotek.txtTotal.Text := intToStr(total);

end;



procedure Tdm.dsetLabDetailBeforePost(DataSet: TDataSet);

var tempStandard : string;
    I,totalText : integer;
    low,high,OneNumber : string;
    testValue : string;

begin
     tempStandard := trim(AnsiUpperCase(frmLab.gridLab.Fields[2].Value));
     testValue := trim(AnsiUpperCase(frmLab.gridLab.Fields[1].Value));
     totalText := Length(tempStandard);

   for i:=1 to totalText do
   begin
     if AnsiMatchText('-',[tempStandard[i]])= true then
     begin
       low:=AnsiMidStr(tempStandard,1,i-1);
       high:=AnsiMidStr(tempStandard,i+1,totalText);


       if (strToFloat(TestValue)< strToFloat(low)) or (strToFloat(testValue)>strToFloat(high)) then
       begin
          dm.dsetLabDetail.Edit;
          frmLab.gridLab.Fields[3].Value:='*';
       end else
       begin
           dm.dsetLabDetail.Edit;
           frmLab.gridLab.Fields[3].Value:='';
       end;

     end  // end dari ansi '-'
     else if AnsiMatchText('<',[tempStandard[i]])= true then
     begin
          OneNumber := AnsiMidStr(tempStandard,i+1,totalText);
          if strToFloat(testValue) >= strToFloat(OneNumber) then
          begin
               dm.dsetLabDetail.Edit;
               frmLab.gridLab.Fields[3].Value:='*';
          end else
          begin
           dm.dsetLabDetail.Edit;
           frmLab.gridLab.Fields[3].Value:='';
          end;
     end
     else if AnsiMatchText('P',[tempStandard[i]])=true  then
     begin
        if LeftStr(testValue,6) <> LeftStr(tempStandard,6) then
        begin
                dm.dsetLabDetail.Edit;
               frmLab.gridLab.Fields[3].Value:='*';
        end else
         begin
           dm.dsetLabDetail.Edit;
           frmLab.gridLab.Fields[3].Value:='';
         end;
     end
     else if AnsiMatchText('N',[tempStandard[i]])=true  then
     begin
          if LeftStr(testValue,6) <> LeftStr(tempStandard,6) then
          begin
            dm.dsetLabDetail.Edit;
             frmLab.gridLab.Fields[3].Value:='*';
          end else
              begin
               dm.dsetLabDetail.Edit;
               frmLab.gridLab.Fields[3].Value:='';

              end;
     end // end ansi match 'N'
      else if (AnsiPos('-',tempStandard)=0) and (AnsiPos('<',tempStandard)=0) and
           (AnsiPos('P',tempStandard)=0) and (AnsiPos('N',tempStandard)=0)then
           begin
             if testValue <> tempStandard then
             begin
                 dm.dsetLabDetail.Edit;
                 frmLab.gridLab.Fields[3].Value:='*';
             end else
                 begin
                   dm.dsetLabDetail.Edit;
                 frmLab.gridLab.Fields[3].Value:='';
                 end;
           end;
    end;  // end for i

end;



procedure Tdm.dsetApotikDEtailBeforePost(DataSet: TDataSet);
var subTotal,oldSubTotal : integer;
    qty,stok : integer;
    kodeobat:string;
   
  
begin
//if isRacikan<>1 then
//begin
 
  qty := frmApotek.gridObat.Fields[4].AsInteger;
  kodeObat := frmApotek.gridObat.Fields[0].Value;

  with dm.dSetObat do
   begin
      if locate('obkode',kodeobat,[loCaseInsensitive])=true then
      begin

        stok := fields.fieldByName('obstok').AsInteger;

        if stok < Qty then
        begin
          showMessage('stok tidak cukup');
          abort;
        end;
      end;
    end;

 if frmApotek.gridObat.Fields[6].value<>1   then
 begin
  subTotal := frmApotek.gridObat.Fields[4].Value*frmApotek.gridObat.Fields[3].Value;
 end else
 begin
   subTotal := frmApotek.gridObat.Fields[5].Value;
 end;


 if frmApotek.gridObat.DataSource.State in [dsEdit] then
  begin
   oldSubTotal := frmApotek.gridObat.Fields[5].Value;
   frmApotek.txtTotal.Text :=IntToStr(strToInt(frmApotek.txtTotal.Text)-(oldSubTotal));
   frmApotek.gridObat.Fields[5].AsCurrency := subTotal;   // isi dari grid total di gridobat
   frmApotek.txtTotal.Text :=IntToStr(strToInt(frmApotek.txtTotal.Text)+subTotal);


  end else
  begin
    frmApotek.gridObat.Fields[5].AsCurrency := subTotal;
    frmApotek.txtTotal.Text :=IntToStr(strToInt(frmApotek.txtTotal.Text))+frmApotek.gridObat.Fields[5].Value;
  end;
//end; // end of gridobatfields[5]<>1
end;

procedure Tdm.dsetApotikDEtailBeforeDelete(DataSet: TDataSet);
var kodeobat : string;
begin

 frmApotek.txtTotal.Text := intToStr(strToInt(frmApotek.txtTotal.Text)- frmApotek.gridObat.Fields[5].Value);
 oldqty := frmApotek.gridObat.Fields[4].Value;

{if dm.dSourceApotikDetail.State in [dsBrowse] then
begin
 kodeobat := trim(frmApotek.gridObat.Fields[0].Value);
 //showMessage(kodeobat);
  with dm.dSetObat do
  begin
    if locate('obkode',kodeobat,[loCaseInsensitive])=true then
    begin
    //  showMessage('kode obat : '+kodeobat+'Qtmu Cooy!');
     // showMessage('BD|qty in the gird: '+intToStr(oldqty));
      open;
      edit;
    //  showMessage('BD|Stok b4 grid added : '+intTostr(fields.FieldByName('obstok').AsInteger));
      fields.FieldByName('obstok').AsInteger := fields.FieldByName('obstok').AsInteger+oldQty;
      post;
    //  showMessage('BD|Stok after grid added : '+intTostr(fields.FieldByName('obstok').AsInteger));
    end else showMessage('kode obat : '+kodeobat+' tidak ketemu!');
  end;
end; // end of [dsedit,dsinsert]}

end;

procedure Tdm.dsetApotikDEtailAfterDelete(DataSet: TDataSet);
{var total : integer;
    ppn : integer;}
begin
{  total := strToInt(frmApotek.txtTotal.Text);
  //ppn := strToInt(frmApotek.dbppn.Text);
  frmApotek.txtTotal.Text := intToStr(strToInt(frmApotek.txtTotal.Text)- frmApotek.gridObat.Fields[5].Value);
  //frmApotek.txtTotal.Text := intToStr(total+(total*ppn));}
end;                                                        

procedure Tdm.dsetApotikDEtailAfterPost(DataSet: TDataSet);
var  qty : integer;
    kodeobat : string;
    dbstok : Integer;
begin

  qty:=frmApotek.gridObat.Fields[4].AsInteger;
  kodeobat := frmapotek.gridObat.Fields[0].Value;
  //showmessage('dset apotik detail afterpost!');
  with dm.dSetObat do
  begin
     if locate('obkode',kodeobat,[loCaseInsensitive])=true then
     begin
       dbstok:=fields.FieldByName('obstok').AsInteger;
       open;
       edit;
       //showmessage('Stok : '+intToStr(dbstok));
       //showMessage('Qty : '+intToStr(qty));
       fields.FieldByName('obstok').AsInteger:=dbstok-qty;
      //showmessage(intToStr(fields.FieldByName('obstok').AsInteger));
       post;
      // dm.dsetObatView.Requery();
     end;
  end;

end;
procedure Tdm.dsetApotikDEtailBeforeEdit(DataSet: TDataSet);
var kodeobat:string;

begin
//showmessage('before edit triggered');
if (frmApotek.gridObat.Fields[6].Value=1) or (frmApotek.gridObat.Fields[6].Value=0) then
begin
  showMessage('Obat Racikan, edit melalui menu racikan!');
  abort;
end;
{else
 begin
 oldqty := frmApotek.gridObat.Fields[4].Value;
 kodeobat := frmApotek.gridObat.Fields[0].Value;
  with dm.dSetObat do
  begin
    if locate('obkode',kodeobat,[loCaseInsensitive])=true then
    begin
      open;
      edit;
      fields.FieldByName('obstok').AsInteger := fields.FieldByName('obstok').AsInteger+oldQty;
      post;
    end;
  end;
// showMessage(intToStr(oldqty));
end;  }
end;

procedure Tdm.dsetracikanAfterPost(DataSet: TDataSet);
var  qty : integer;
    kodeobat : string;
begin

end;

procedure Tdm.dsetracikanBeforeDelete(DataSet: TDataSet);
begin
  //frmRacikan.jmlrecord.Text := intToStr(strToInt(frmRacikan.jmlrecord.Text)-1);
end;

procedure Tdm.dsetracikanBeforeEdit(DataSet: TDataSet);
//var kodeobat:string;

begin
 {oldqty := frmRacikan.gridObat.Fields[4].Value;
 kodeobat := frmRacikan.gridObat.Fields[0].Value;
  with dm.dSetObat do
  begin
    if locate('obkode',kodeobat,[loCaseInsensitive])=true then
    begin
      open;
      edit;
      fields.FieldByName('obstok').AsInteger := fields.FieldByName('obstok').AsInteger+oldQty;
      post;
    end;
  end;
  }
end;

procedure Tdm.dsetracikanBeforePost(DataSet: TDataSet);
begin

  frmRAcikan.gridObat.Fields[5].Value:=frmracikan.gridObat.Fields[4].Value*frmRacikan.gridObat.Fields[3].Value;

 end;

procedure Tdm.dsetreglabBeforePost(DataSet: TDataSet);
var total : integer;
begin

   //total := strToInt(frmRegLab.total.Text);
  // total := total+frmRegLab.gridreg.Fields[1].Value;
//   frmRegLab.total.Text := intToStr(total);
end;

procedure Tdm.dsetreglabBeforeDelete(DataSet: TDataSet);
begin
   //frmreglab.total.Text := IntToStr(strToInt(frmreglab.total.Text)-(frmreglab.gridreg.Fields[1].Value));
end;

procedure Tdm.dsetHasilLabBeforePost(DataSet: TDataSet);

var tempStandard : string;
    I,totalText : integer;
    low,high,OneNumber : string;
    testValue : string;

begin
     tempStandard := trim(AnsiUpperCase(frmHasilLab.grid.Fields[2].Value));
     testValue := trim(AnsiUpperCase(frmHasilLab.grid.Fields[1].Value));
     totalText := Length(tempStandard);


    // apabila grid tidak diisi maka routine keluar dari urutan pemeriksaan
       if (Length(frmHasilLab.grid.fields[1].Value)=0) or (frmHasilLab.grid.fields[1].Value=' ') then
       begin
         frmHasilLab.grid.Fields[3].Value:='';
         exit;
       end;

   

   for i:=1 to totalText do
   begin
     if AnsiMatchText('-',[tempStandard[i]])= true then
     begin
       low:=AnsiMidStr(tempStandard,1,i-1);
       high:=AnsiMidStr(tempStandard,i+1,totalText);



       if (strToFloat(TestValue)< strToFloat(low)) or (strToFloat(testValue)>strToFloat(high)) then
       begin
          dm.dsetHasilLab.Edit;
          frmHasilLab.grid.Fields[3].Value:='*';
       end else
       begin
           dm.dsetLabDetail.Edit;
           frmHasilLab.grid.Fields[3].Value:='';
       end;

     end  // end dari ansi '-'
     else if AnsiMatchText('<',[tempStandard[i]])= true then
     begin
          OneNumber := AnsiMidStr(tempStandard,i+1,totalText);
          if strToFloat(testValue) >= strToFloat(OneNumber) then
          begin
               dm.dsetHasilLab.Edit;
               frmHasilLab.grid.Fields[3].Value:='*';
          end else
          begin
           dm.dsetHasilLab.Edit;
           frmHasilLab.grid.Fields[3].Value:='';
          end;
     end
     else if AnsiMatchText('P',[tempStandard[i]])=true  then
     begin
        if LeftStr(testValue,6) <> LeftStr(tempStandard,6) then
        begin
                dm.dsetHasilLab.Edit;
               frmHasilLab.grid.Fields[3].Value:='*';
        end else
         begin
           dm.dsetHasilLab.Edit;
           frmHasilLab.grid.Fields[3].Value:='';
         end;
     end
     else if AnsiMatchText('N',[tempStandard[i]])=true  then
     begin
          if LeftStr(testValue,6) <> LeftStr(tempStandard,6) then
          begin
            dm.dsetHasilLab.Edit;
             frmHasilLab.grid.Fields[3].Value:='*';
          end else
              begin
               dm.dsetHasilLab.Edit;
               frmHasilLab.grid.Fields[3].Value:='';

              end;
     end // end ansi match 'N'
      else if (AnsiPos('-',tempStandard)=0) and (AnsiPos('<',tempStandard)=0) and
           (AnsiPos('P',tempStandard)=0) and (AnsiPos('N',tempStandard)=0)then
           begin
             if testValue <> tempStandard then
             begin
                 dm.dsetHasilLab.Edit;
                 frmHasilLab.grid.Fields[3].Value:='*';
             end else
                 begin
                   dm.dsetHasilLab.Edit;
                   frmHasilLab.grid.Fields[3].Value:='';
                 end;
           end;
    end;  // end for i

end;

procedure Tdm.dsetpersenadminBeforeOpen(DataSet: TDataSet);
begin
  splash.showProgress('Loading Preferences...');
end;

procedure Tdm.dSetServicesBeforeOpen(DataSet: TDataSet);
begin
 splash.showProgress('Loading Services...');
end;

procedure Tdm.dsetrawatbabyBeforeOpen(DataSet: TDataSet);
begin
 splash.showProgress('Loading Rawat Inap Baby...');
end;

procedure Tdm.dSetRumahSakitBeforeOpen(DataSet: TDataSet);
begin
 splash.showProgress('Loading Rumah Sakit Perujuk...');
end;

procedure Tdm.dsetKaryawanBeforeOpen(DataSet: TDataSet);
begin
 splash.showProgress('Loading Data Karyawan..');
end;

procedure Tdm.dSetPoliBeforeOpen(DataSet: TDataSet);
begin
 splash.showProgress('Loading Data Poli...');
end;

procedure Tdm.dsetuangkeluarBeforeOpen(DataSet: TDataSet);
begin
 splash.showProgress('Loading Uang Keluar...');
end;

procedure Tdm.dsetdokterBeforeOpen(DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading Data Dokter. Mohon Tunggu...');
end;

procedure Tdm.dsetViewKamarBeforeOpen(DataSet: TDataSet);
begin
 splash.showProgress('Loading View Kamar Pasien...');
end;

procedure Tdm.dsetRptRawatInapBeforeOpen(DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Rawat Inap. Mohon Tunggu...');
end;

procedure Tdm.dsetRptRawatInapAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure Tdm.dsetRptKamarDetailBeforeOpen(DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Kamar Detail. Mohon Tunggu...');
end;

procedure Tdm.dsetRptKamarDetailAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure Tdm.dSetObatBeforeOpen(DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data Obat. Mohon Tunggu...');
end;

procedure Tdm.dSetObatAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure Tdm.dSetApotikBeforeOpen(DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Membuka data Apotik. Mohon Tunggu...');
end;

procedure Tdm.dSetApotikAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure Tdm.dsetApotikDEtailBeforeOpen(DataSet: TDataSet);
begin
  tunggu.openWait;
  tunggu.showWait('Loading data Apotik Detail. Mohon Tunggu...');
end;

procedure Tdm.dsetApotikDEtailAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure Tdm.dsetObatViewBeforeOpen(DataSet: TDataSet);
begin
  tunggu.openWait;
 tunggu.showWait('Loading View Obat. Mohon Tunggu...');
end;

procedure Tdm.dsetObatViewAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure Tdm.dsetadmpoliAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure Tdm.dsetadmpoliBeforeOpen(DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading Preferensi. Mohon Tunggu...');
end;

procedure Tdm.dsetViewRawatInapBeforeOpen(DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading View Rawat Inap. Mohon tunggu...');
end;

procedure Tdm.dsetViewRawatInapAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure Tdm.dsetviewmigrasiBeforeOpen(DataSet: TDataSet);
begin
  tunggu.openWait;
  tunggu.showWait('Loading data. Mohon tunggu...');
end;

procedure Tdm.dsetviewmigrasiAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure Tdm.dsetreglabBeforeOpen(DataSet: TDataSet);
begin
 tunggu.openWait;
 tunggu.showWait('Loading data lab. Mohon tunggu...');
end;

procedure Tdm.dsetreglabAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure Tdm.dsetdokterAfterOpen(DataSet: TDataSet);
begin
 tunggu.closeWait;
end;

procedure Tdm.dsetbelidetailNewRecord(DataSet: TDataSet);
begin
   dsetbelidetail.FieldByName('pd_notransaksi').Value := pembelianfrm.dbauto.Text;
end;

procedure Tdm.dsetbelidetailBeforePost(DataSet: TDataSet);
begin
 dsetbelidetail.FieldByName('pd_total').Value := dsetbelidetail.FieldByName('pd_hrga').Value*dsetbelidetail.FieldByName('pd_qty').Value;
end;

end.







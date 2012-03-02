unit frmbillingrontgen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Buttons, DB, ADODB, RpCon, RpConDS,
  RpDefine, RpRave,strutils, RpBase, RpSystem;

type
  Tfrmbillrontgen = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    notransaksi: TEdit;
    Label1: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label2: TLabel;
    dsetrptrontgen: TADODataSet;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    rvprojectkwitansirontgen: TRvProject;
    rvkwitansirontgen: TRvDataSetConnection;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RvSystem: TRvSystem;
    procedure notransaksiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbillrontgen: Tfrmbillrontgen;

implementation

uses unFrmViewPasienPoli,unUtama, unfrmviewpasienrontgen, unDm,kwitansi,unFungsi;

{$R *.dfm}

procedure Tfrmbillrontgen.notransaksiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
 vk_return : frmviewpasienrontgen.ShowModal;
 end;
end;

procedure Tfrmbillrontgen.FormActivate(Sender: TObject);
begin
 isbillingrontgen :=1;
end;

procedure Tfrmbillrontgen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 isbillingrontgen :=0;
end;

procedure Tfrmbillrontgen.BitBtn2Click(Sender: TObject);
var terbilang, tempAtasNama,tanggal,itemrontgen : string;
    grandTotal : double;
    i : integer;
    koderontgen,kode,nama : string;
    noKwitansi : string;
begin
 with dsetrptrontgen do
 begin
  active:=false;
  commandType:=cmdText;
  commandText:='select * from talayananrontgen '+
  'where lrkode like (:kode) ';
  parameters.ParamByName('kode').Value := notransaksi.Text;
  active:=true;

   if isEmpty=false then
   begin
     //showMessage('qtmu');
     terbilang := rupiah(floatToStr(fieldByName('lrtotal').AsFloat));
     grandTotal := round(fieldByName('lrTotal').AsFloat);
     Tanggal := FormatDateTime('dd mmmm yyyy',date());
     koderontgen :=fieldByName('lrkoderontgen').AsString;
     nama   := fieldByname('lrnama').AsString;
   end;

   noKwitansi := autoNumberKwitansi(notransaksi.Text,grandTotal);

    tempAtasNama:=inputBox('Kwitansi Atas Nama: ',tempAtasnama,'');
   if Length(tempAtasNama)=0 then
   begin
     tempAtasNama:= fields.fieldByName('lrnama').AsString;
   end;


 end;

  if dm.dsetRontgen.Active = false then dm.dsetRontgen.Active := true;

  for i:=1 to Length(kodeRontgen) do
  begin
   if AnsiMatchText(';',[kodeRontgen[i]])= true then
   begin
     Kode:=AnsiMidStr(kodeRontgen,i-5,5); // cari kode di dalam editbox "item"
     // query untuk mengumpulkan item lab berdasarkan kode yang ditemukan
     if dm.dsetRontgen.Locate('rnkode',kode,[locaseinsensitive])= true then
     begin
        itemrontgen := itemRontgen+'- '+dm.dsetrontgen.fieldByName('rnJenisPeriksa').AsString+#13;
     end;
   end; // end of if ansi
   end; // end of for i
   itemrontgen := 'PEMERIKSAAN : '+#13+itemrontgen+#13+'Pro : '+AnsiUpperCase(nama);

 rvprojectkwitansirontgen.ProjectFile:='billingrontgen.rav';
 rvprojectkwitansirontgen.Open;
 rvprojectkwitansirontgen.SelectReport('billingrontgen.rav',true);
 rvprojectkwitansirontgen.SetParam('grandTotal',floatToStr(grandTotal));
 rvprojectkwitansirontgen.SetParam('terbilang',AnsiUpperCase(terbilang));
  rvprojectkwitansirontgen.SetParam('noKwitansi',AnsiUpperCase(noKwitansi)); 
 rvprojectkwitansirontgen.SetParam('atasnama',AnsiUpperCase(tempAtasNama));
 rvprojectkwitansirontgen.SetParam('tgl',tanggal);
 rvprojectkwitansirontgen.SetParam('itemrontgen',AnsiUpperCase(itemrontgen));
 rvprojectkwitansirontgen.Execute;

/// pencatatan userrname ke dalam database layanan rontgen

 with dsetrptrontgen do
 begin
  active:=false;
  commandType:=cmdText;
  commandText:='select * from talayananrontgen '+
  'where lrkode like (:kode) ';
  parameters.ParamByName('kode').Value := notransaksi.Text;
  active:=true;

  if isempty=false then
  begin
  open;
  edit;
  fieldByName('lrpic').AsString := isCurrentUser;
  post;
  updateBatch(arCurrent);
  end;
end;  

/////////////// end of pencatatan rontgen

end;

procedure Tfrmbillrontgen.BitBtn1Click(Sender: TObject);
begin
 close;
end;

end.

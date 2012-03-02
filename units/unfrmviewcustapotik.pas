unit unfrmviewcustapotik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids,adodb,db, DBGrids, ExtCtrls, Buttons,
  RpCon, RpConDS, RpDefine, RpRave;

type
  TfrmViewCustApotik = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    grid: TDBGrid;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    cari: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    dsetstrukapotikonly: TADODataSet;
    RvProjectstrukapotikonly: TRvProject;
    rvstrukapotikonly: TRvDataSetConnection;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsetstrukapotikdetailonly: TADODataSet;
    rvapotikdetailonly: TRvDataSetConnection;
    BitBtn3: TBitBtn;
    RvProjectkwitansiapotikonly: TRvProject;
    dsetpic: TADODataSet;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure cariChange(Sender: TObject);
    procedure cariKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewCustApotik: TfrmViewCustApotik;

implementation

uses unDm,kwitansi,unutama;

{$R *.dfm}

procedure TfrmViewCustApotik.FormActivate(Sender: TObject);
begin
if dm.dsetcustapotik.Active = false then dm.dsetcustapotik.Active := true;
 cari.SetFocus;
 cari.Clear;
 
end;

procedure TfrmViewCustApotik.cariChange(Sender: TObject);
var data : TADODataSet;
begin
   data := dm.dsetcustapotik;
   data.Locate('apnama',cari.Text,[loPartialKey]);
end;

procedure TfrmViewCustApotik.cariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var cf   : integer; //cf = current Field
    data : TADODataSet;
    grid : TDBGrid;
begin
 data := dm.dsetcustapotik;

 if grid.SelectedIndex=0 then
 begin
     cf:=1;
 end else cF := grid.SelectedIndex;

  case key of
  vk_up : begin
           grid.SetFocus;
           data.Prior;
          end;
  vk_down : begin
           grid.SetFocus;
           data.Next;
          end;
  vk_right : begin
            grid.SetFocus;
            grid.fields[cf+1].FocusControl;
            end;
 vk_left : begin
            grid.SetFocus;
            grid.fields[cf-1].FocusControl;
            end;
 vk_escape : close;            
  end;
end;


procedure TfrmViewCustApotik.gridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 case key of
 vk_escape : close;
 end;
end;

procedure TfrmViewCustApotik.gridKeyPress(Sender: TObject; var Key: Char);
begin
 if (key in['a'..'z','A'..'Z',#8]) then
begin
  cari.SetFocus;
  cari.Clear;
  cari.text:=key;
  cari.SelStart :=1;
end;  
end;

procedure TfrmViewCustApotik.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TfrmViewCustApotik.BitBtn2Click(Sender: TObject);
var kode : string;
begin
 kode := grid.Fields[3].Value;
 with dsetstrukapotikonly do
 begin
 active := false;
 commandType := cmdText;
 commandText := 'select * from taapotik '+
 'where apnoregpasien is null '+
 'and aptgl is not null '+
 'and apkodeapotik like (:kode) ';
 parameters.ParamByName('kode').Value := kode;
 active:=true;
 end;

 dsetstrukapotikdetailonly.Open;
 dsetstrukapotikdetailonly.Requery();

 RvProjectstrukapotikonly.ProjectFile:='strukapotikonly.rav';
 RvProjectstrukapotikonly.Open;
 RvProjectstrukapotikonly.SelectReport('strukapotikonly.rav',true);
// RvProjectstrukapotikonly.SetParam('keterangan',keterangan);
 RvProjectstrukapotikonly.Execute;


 with dsetpic do
begin
  open;
  if locate('apkodeapotik',kode,[loCaseInsensitive])=true then
  begin
    edit;
    fieldByName('appic').AsString := isCurrentUser;
    post;
    updatebatch(arCurrent);
  end;
end;

end;

procedure TfrmViewCustApotik.BitBtn3Click(Sender: TObject);
var kode : string;
    total : double;
    terbilang : string;
    atasNama : string;
    keterangan : string;
    nama : string;
begin
 nama := grid.Fields[0].Value;
 kode := grid.Fields[3].Value;
 with dsetstrukapotikonly do
 begin
 active:=false;
 commandType := cmdText;
 commandTExt := 'select * from taapotik '+
 'where apkodeapotik like (:kode) ';
 parameters.ParamByName('kode').Value := kode;
 active:=true;

  if isempty=false then
  begin
   total := fieldByName('aptotal').AsFloat;
  end;
 end;

 terbilang := rupiah(floatToStr(total));
 Keterangan := 'Pembelian Obat-obatan ';
 
 atasNama :=inputBox('Kwitansi Atas Nama : ',atasnama,'');
 if length(atasnama) = 0 then
 begin
   atasNama := nama;
 end else  atasnama := atasnama;

 RvProjectkwitansiapotikonly.ProjectFile:='kwitansiapotikonly.rav';
 RvProjectkwitansiapotikonly.Open;
 RvProjectkwitansiapotikonly.SelectReport('kwitansiapotikonly.rav',true);
 RvProjectkwitansiapotikonly.SetParam('keterangan',keterangan);
 RvProjectkwitansiapotikonly.SetParam('atasnama',AnsiUpperCase(atasnama));
 RvProjectkwitansiapotikonly.SetParam('terbilang',AnsiUpperCase(terbilang));
 RvProjectkwitansiapotikonly.SetParam('grandtotal',floatToStr(total));
 RvProjectkwitansiapotikonly.SetParam('user',AnsiUpperCase(isCurrentuser));
 RvProjectkwitansiapotikonly.Execute;

with dsetpic do
begin
  open;
  if locate('apkodeapotik',kode,[loCaseInsensitive])=true then
  begin
    edit;
    fieldByName('appic').AsString := isCurrentUser;
    post;
    updatebatch(arCurrent);
  end;
end;

end;

procedure TfrmViewCustApotik.Button1Click(Sender: TObject);
begin
 dm.dsetcustapotik.Requery();
end;

end.

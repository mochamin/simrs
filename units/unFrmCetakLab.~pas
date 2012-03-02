unit unFrmCetakLab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, RpCon, RpConDS, RpDefine, RpRave, StdCtrls,
  Buttons, Mask, DBCtrls, RpBase, RpSystem;

type
  TfrmCetakLab = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    rvProjectLab: TRvProject;
    rvLab: TRvDataSetConnection;
    dsetLab: TADODataSet;
    dsetHematologi: TADODataSet;
    rvHematologi: TRvDataSetConnection;
    GroupBox1: TGroupBox;
    notransaksi: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    btncetak: TBitBtn;
    dsetHitungJenis: TADODataSet;
    rvHitungJenis: TRvDataSetConnection;
    dsetHematologiTitle: TADODataSet;
    rvHematologiTitle: TRvDataSetConnection;
    dsetUrinTitle: TADODataSet;
    rvUrinTitle: TRvDataSetConnection;
    dsetUrinalisa: TADODataSet;
    rvUrinalisa: TRvDataSetConnection;
    dsetSedimen: TADODataSet;
    rvSedimen: TRvDataSetConnection;
    dsetFaecesTitle: TADODataSet;
    rvFaecesTitle: TRvDataSetConnection;
    dsetFaecesMakro: TADODataSet;
    rvFaecesMakro: TRvDataSetConnection;
    dsetFaecesMikro: TADODataSet;
    rvFaecesMikro: TRvDataSetConnection;
    dsetSerologi: TADODataSet;
    rvSerologi: TRvDataSetConnection;
    dsetWidal: TADODataSet;
    rvWidal: TRvDataSetConnection;
    dsetKimia: TADODataSet;
    rvKimia: TRvDataSetConnection;
    dsetTestPack: TADODataSet;
    rvTEstpack: TRvDataSetConnection;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    btnClose: TBitBtn;
    dsetindividual: TADODataSet;
    rvindividual: TRvDataSetConnection;
    rslab: TRvSystem;
    procedure notransaksiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btncetakClick(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCetakLab: TfrmCetakLab;

implementation

uses unFrmViewPasien,unUtama, unFrmViewPasienPoli, unfrmViewRawatInap,
  unfrmviewreglab, unfrmhasillab;

{$R *.dfm}

procedure TfrmCetakLab.notransaksiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  begin
      if (length(notransaksi.Text)=0) or (notransaksi.Text=' ') then
      begin
        frmViewRegLab.ShowModal;
      end else btncetak.Click;  
  end;

  if key=vk_escape then
  begin
    btnClose.click;
  end;
end;

procedure TfrmCetakLab.FormActivate(Sender: TObject);
begin
// tipepasien.SetFocus;
 isPrintLab:=1;
 notransaksi.SetFocus;

 if isInputHasilLab =1 then
 begin
   notransaksi.Text := frmHasilLab.notransaksi.Text;
 end;
 
end;

procedure TfrmCetakLab.btncetakClick(Sender: TObject);
begin

with dsetHematologi do
begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldgroup LIKE "HEMATOLOGI" '+
   'AND ldTitle ="-" ';
   active:=true;
end;

with dsetHitungJenis do
begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldgroup LIKE "HEMATOLOGI" '+
   'AND ldTitle LIKE "hitung jenis%" ';
   active:=true;
end;



 with dsetLab do
 begin
   active:=false;
   commandType := cmdText;
   commandText :='select * from talab,tapasien '+
   'where lbrekammedik like pskodepasien '+
   'and lbkode LIKE (:kode) ';
   parameters.ParamByName('kode').Value := notransaksi.text;
   active:=true;
   if isEmpty=true then
   begin
     showMessage('Pasien Dengan nomor Reg : '+notransaksi.Text+' tidak Ada!');
     exit;
     notransaksi.SetFocus;
   end;
end;


with dsetUrinalisa do
begin
    active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldgroup LIKE "URINALISA" '+
   'AND ldTitle is Null';
    active:=true;
end;

with dsetUrinTitle do
begin
    active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldgroup LIKE "URINALISA" ';
    active:=true;
end;

with dsetSedimen do
begin
    active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldgroup LIKE "URINALISA" '+
   'and ldtitle LIKE "Sedimen"';
    active:=true;
end;

with dsetFaecesTitle do
begin
    active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldgroup LIKE "FAE%" ';
   active:=true;
end;

with dsetFaecesMakro do
begin
    active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldgroup LIKE "FAECES" '+
   'AND ldTitle LIKE "Ma%" ';
    active:=true;
end;

with dsetFaecesMikro do
begin
    active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldgroup LIKE "FAECES" '+
   'AND ldTitle LIKE "Mi%" ';
    active:=true;
end;

with dsetSerologi do
begin
    active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldgroup LIKE "SERO%" ';
    active:=true;
end;

with dsetWidal do
begin
    active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldgroup LIKE "WID%" ';
    active:=true;
end;

with dsetKimia do
begin
    active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldgroup LIKE "KIM%" ';
    active:=true;
end;

with dsetTestPack do
begin
    active:=false;
   commandType := cmdText;
   commandText := 'select * from talabdetail '+
   'where ldgroup LIKE "TES%" ';
    active:=true;
end;


  rvProjectLab.ProjectFile := 'Lab.rav';
  rvProjectLab.Open;
  rvProjectLab.SelectReport('lab',true);
  rvProjectLab.SetParam('noTransaksi',notransaksi.Text);
  rvProjectLab.Execute;
end;

procedure TfrmCetakLab.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmCetakLab.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
   key:=#0;
end;

procedure TfrmCetakLab.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TfrmCetakLab.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TfrmCetakLab.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TfrmCetakLab.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
        key:=#0;
end;

procedure TfrmCetakLab.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
   key:=#0;
end;

procedure TfrmCetakLab.FormCreate(Sender: TObject);
begin
{dsetTestPack.Active:=true;
dsetHematologiTitle.Active:=true;
dsetLab.Active:=true;
dsetHematologi.Active:=true;
dsetUrinTitle.Active:=true;
dsetFaecesMikro.Active:=true;
dsetUrinalisa.Active:=true;
dsetSedimen.Active:=true;
dsetSerologi.Active:=true;
dsetFaecesMakro.Active:=true;
dsetFaecesTitle.Active:=true;
dsetWidal.Active:=true;}
end;

procedure TfrmCetakLab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 isPrintLab:=0;
end;

procedure TfrmCetakLab.btnCloseClick(Sender: TObject);
begin
 if isInputHasilLab=1 then
 begin
   close;
   frmHasilLab.notransaksi.SetFocus;
 end else close;
end;

end.

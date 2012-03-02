unit lapbrgmasukun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, RpCon, RpConDS, RpBase, RpSystem,
  RpDefine, RpRave, Buttons,db,adodb,strutils, ComCtrls;

type
  Tlapbrgmasukfrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    cbasal: TCheckBox;
    cbtgl: TCheckBox;
    lookgudang: TDBLookupComboBox;
    awal: TDateTimePicker;
    Label2: TLabel;
    akhir: TDateTimePicker;
    rplapmasuk: TRvProject;
    rvlapmasuk: TRvSystem;
    rdbrgmsk: TRvDataSetConnection;
    rdbrgmskdetail: TRvDataSetConnection;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure cetaklaporan;
  end;

var
  lapbrgmasukfrm: Tlapbrgmasukfrm;

implementation

uses unDm, dmzun;

{$R *.dfm}

procedure Tlapbrgmasukfrm.cetaklaporan;
var txtTgl  : string;
    txtPIC  : string;
    txtAsal : string;
    txtPeriode : string;
    conAwal : string;
    conAkhir: string;
begin

 { conAwal := RightStr(tglmulai.Text,4)+'-'+
                   AnsiMidStr(tglmulai.Text,4,2)+'-'+
                   LeftStr(tglmulai.Text,2);

  conAkhir      := RightStr(tglakhir.Text,4)+'-'+
                   AnsiMidStr(tglakhir.Text,4,2)+'-'+
                   LeftStr(tglakhir.Text,2);


   if cbtgl.Checked = true then
   begin
     txtTgl := ' and pb_tgl between "'+conAwal+'" and "'+conAkhir+'"';
   end else
   begin
      txtTgl := ' ';
   end;

   if cbpic.Checked = true then
   begin
      txtPIC := ' and pb_pic like "'+lookpic.Text+'" ';
   end else
   begin
      txtPIC := ' ';
   end;

   if cbasal.Checked = true then
   begin
      txtasal := ' and pb_asal like "'+lookasal.Text+'" ';
   end else
   begin
       txtasal := ' ';
   end;

   with dsetrptbeli do
   begin
    active := false;
    commandType := cmdText;
    commandText := 'select * from pembelian '+
    'where pb_notransaksi is not null '+
    txtTgl+
    txtPIC+
     txtAsal;
    active := true;
   end;


  

  // rvbrgmasuk.SetParam('paramperiode',txtperiode);
   rvbrgmasuk.ProjectFile := 'obatmasuk.rav';
   rvbrgmasuk.SelectReport('obatmasuk.rav',false);
   rvbrgmasuk.Execute;  }
end;

procedure Tlapbrgmasukfrm.FormActivate(Sender: TObject);
begin
  if dm.dsetuser.Active = false then dm.dsetuser.Active := true;
end;

procedure Tlapbrgmasukfrm.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure Tlapbrgmasukfrm.FormCreate(Sender: TObject);
begin
  awal.Date := date();
  akhir.Date := date();
  dmz.gudangdset.Active := true;
end;

procedure Tlapbrgmasukfrm.BitBtn2Click(Sender: TObject);
var nom : string;
begin
  with dmz.lapbrgmasukdset do
  begin
    sql.Text := 'select * from pembelian '+
    'where pb_asal = (:asal) ';
    params.ParamByName('asal').Value := lookgudang.KeyValue;
    open;
    nom := fieldbyname('pb_notransaksi').Value;
  end;

  with dmz.lapbrgdetail do
  begin
    sql.Text := 'select * from pembeliandetail '+
    'where pd_notransaksi = (:notran) ';
    params.ParamByName('notran').Value := nom;
    open;
  end;
  
  rpLapmasuk.ProjectFile := 'lapbrgmasuk.rav';
  rplapmasuk.Open;
  rplapmasuk.SelectReport('lapbrgmasuk.rav',true);
  rplapmasuk.SetParam('paramasal','Asal Barang : '+lookgudang.Text);
  rpLapmasuk.Execute;
end;

end.

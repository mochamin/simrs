unit frmlabreportun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, RpBase, RpSystem,
  RpDefine, RpRave, RpCon, RpConDS,adodb,db,strUtils, Mask;

type
  Tfrmlabreport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    rpLab: TRvProject;
    rsLab: TRvSystem;
    rdLab: TRvDataSetConnection;
    rdLabdetail: TRvDataSetConnection;
    a: TMaskEdit;
    b: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure cetakLaporan;
  public
    { Public declarations }
  end;

var
  frmlabreport: Tfrmlabreport;

implementation

uses dmlun;

{$R *.dfm}

procedure Tfrmlabreport.cetakLaporan;
var tgl : string;
    konversiAwal : string;
    konversiakhir : string;
    mulai : string;
    akhir : string;
    txtopsi :string;

begin

  { mulai := dateToStr(tglawal.Date);
   akhir := dateToStr(tglakhir.Date);
   konversiAwal := RightStr(mulai,4)+'-'+
                   AnsiMidStr(mulai,4,2)+'-'+
                   LeftStr(mulai,2);

  konversiAkhir :=  RightStr(akhir,4)+'-'+
                   AnsiMidStr(akhir,4,2)+'-'+
                   LeftStr(akhir,2);


  txtOpsi := 'Periode Tgl: '+mulai+' s/d Tgl: '+akhir;
  }
  with dml.labnew do
  begin
  active:=false;
  commandType := cmdText;
  commandText := 'select * from LabInput '+
  'where Tgllab between (:wal) and (:khir) ';
  parameters.ParamByName('wal').Value  := strToDate(a.Text);
  parameters.ParamByName('khir').Value := strToDate(b.Text);
  active:=true;

  //showmessage(commandText);
  
  if isEmpty=true then
  begin
    showmessage('Tidak ada data...');
    exit;
  end;
  end;


  rplab.ProjectFile := 'lapuanglab.rav';
  rplab.Open;
  rplab.SelectReport('lapuanglab.rav',false);
  rplab.SetParam('opsi',txtOpsi);
  rpLab.Execute;
  
end;

procedure Tfrmlabreport.BitBtn1Click(Sender: TObject);
begin
 cetakLaporan;
end;

procedure Tfrmlabreport.FormCreate(Sender: TObject);
begin
 a.Text := DateToStr(date);
 b.Text := dateToSTr(date);
end;

end.

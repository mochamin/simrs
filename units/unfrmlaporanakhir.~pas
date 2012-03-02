unit unfrmlaporanakhir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpCon, RpConDS, RpDefine, RpRave, DB, ADODB, StdCtrls, Buttons,
  ExtCtrls, Mask;

type
  Tfrmlaporanakhir = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    rglaporan: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsetlapakhirrawatinap: TADODataSet;
    RvProjectlapakhirrawatinap: TRvProject;
    rvlapakhirrawatinap: TRvDataSetConnection;
    tglawal: TMaskEdit;
    tglakhir: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rglaporanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlaporanakhir: Tfrmlaporanakhir;

implementation

{$R *.dfm}

procedure Tfrmlaporanakhir.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure Tfrmlaporanakhir.BitBtn2Click(Sender: TObject);
var keterangan : string;
begin
if rglaporan.ItemIndex=0 then
begin

  with dsetlapakhirrawatinap do
  begin
  active:=false;
  commandType := cmdText;
  commandText := 'select * from tarawatinap,tapasien, takamar '+
  'where innorm like pskodepasien '+
  'and inkodekamar like kakode '+
  'and intglkeluar between (:tglawal) and (:tglakhir) '+
  'and intotal <> 0 ';
  parameters.ParamByName('tglawal').Value := strToDate(tglawal.Text);
  parameters.ParamByName('tglakhir').Value := strToDate(tglakhir.Text);
  active:=true;
  end;

  if  strToDate(tglawal.Text)= strToDate(tglakhir.Text) then
  begin
   Keterangan := 'Tanggal '+tglawal.Text;
  end else  
  begin
    Keterangan := 'Tanggal '+tglawal.Text+' s/d Tanggal : '+tglakhir.Text;
  end;

 RvProjectlapakhirrawatinap.ProjectFile:='lapakhirrawatinap.rav';
 RvProjectlapakhirrawatinap.Open;
 RvProjectlapakhirrawatinap.SelectReport('lapakhirrawatinap.rav',true);
 RvProjectlapakhirrawatinap.SetParam('keterangan',keterangan);
 RvProjectlapakhirrawatinap.Execute;

end;
end;// end of rglaporan

procedure Tfrmlaporanakhir.rglaporanClick(Sender: TObject);
begin
  tglawal.Text := dateToStr(date());
  tglakhir.Text := dateToStr(date());
end;

end.

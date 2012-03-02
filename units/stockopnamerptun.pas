unit stockopnamerptun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RpCon, RpConDS, RpBase, RpSystem, RpDefine,
  RpRave, ExtCtrls, ComCtrls;

type
  Tstockopnamerptfrm = class(TForm)
    BitBtn1: TBitBtn;
    rpStockopname: TRvProject;
    restockopname: TRvSystem;
    rdrptstockopname: TRvDataSetConnection;
    awal: TDateTimePicker;
    akhir: TDateTimePicker;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  stockopnamerptfrm: Tstockopnamerptfrm;

implementation

uses dmzun,strutils;

{$R *.dfm}

procedure Tstockopnamerptfrm.BitBtn1Click(Sender: TObject);
var tglawal,tglakhir,opsi : string;
begin

 tglawal := RightStr(dateToStr(awal.Date),4)+'-'+AnsiMidStr(dateToStr(awal.Date),4,2)+'-'+
            LeftStr(dateToStr(awal.date),2);

 tglakhir := RightStr(dateToStr(akhir.Date),4)+'-'+AnsiMidStr(dateToStr(akhir.Date),4,2)+'-'+
            LeftStr(dateToStr(akhir.date),2);

 with dmz.stockopnamedset do
 begin
   sql.Text := 'select * from stockopname '+
   ' where so_tgl between (:awal) and  '+
   '(:akhir) order by so_id desc ';
   params.ParamByName('awal').Value := tglawal;
   params.parambyname('akhir').Value := tglakhir;
   active := true;
 end;

 opsi := 'Tanggal '+dateToStr(awal.Date)+' s/d '+dateToStr(akhir.Date);
                                           
 rpStockopname.ProjectFile := 'stockopname.rav';
 rpStockopname.Open;
 rpstockopname.SelectReport('stockopname.rav',true);
 rpstockopname.SetParam('opsitgl',opsi);
 rpstockopname.Execute;
end;

end.

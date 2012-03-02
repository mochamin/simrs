unit kartustockun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls;

type
  Tkartustockfrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    lookobat: TDBLookupComboBox;
    awal: TDateTimePicker;
    akhir: TDateTimePicker;
    Label2: TLabel;
    cbfilter: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kartustockfrm: Tkartustockfrm;

implementation

uses dmzun,strutils;

{$R *.dfm}

procedure Tkartustockfrm.FormCreate(Sender: TObject);
begin
 if dmz.kartustockdset.Active = false then dmz.kartustockdset.Active := true;
 if dmz.obatdset.active       = false then dmz.obatdset.active := true;
 awal.Date := date();
 akhir.Date := date();
end;

procedure Tkartustockfrm.BitBtn1Click(Sender: TObject);
var opsifilter,cAwal,cAkhir : string;
begin
 // showmessage(lookobat.KeyValue);

 if lookobat.KeyValue = null then
 begin
   showmessage('obat belum dipilih!');
   abort;
 end;

 cAwal := rightStr(dateToStr(awal.Date),4)+'-'+AnsiMidStr(dateToStr(awal.Date),4,2)+'-'+LeftStr(dateToStr(awal.Date),2);
 cAkhir := rightStr(dateToStr(akhir.Date),4)+'-'+AnsiMidStr(dateToStr(akhir.Date),4,2)+'-'+LeftStr(dateToStr(akhir.Date),2);
 if cbfilter.Checked = true then
 begin
   opsifilter := ' AND ks_tgl between "'+cAwal+'" AND "'+cAkhir+'"';

 end else
 begin
   opsiFilter := ' ';
 end;  

 
 
  with dmz.kartustockdset do
  begin
    sql.Text := 'SELECT * FROM kartustock WHERE ks_kodeobat = (:kd) '+
    opsifilter+
    ' ORDER BY ks_id ASC ';
    params.ParamByName('kd').AsString := lookobat.KeyValue;
    active := true;
  end;
end;

end.

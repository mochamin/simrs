unit expiredun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave;

type
  Texpiredfrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    tglawal: TMaskEdit;
    tglakhir: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    rpExpired: TRvProject;
    rsExpired: TRvSystem;
    rdExpired: TRvDataSetConnection;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  expiredfrm: Texpiredfrm;

implementation

uses dmzun,strutils;

{$R *.dfm}

procedure Texpiredfrm.BitBtn1Click(Sender: TObject);
var awal,akhir,opsi : string;
begin

  awal := rightstr(tglawal.text,4)+'-'+AnsiMidStr(tglawal.Text,4,2)+'-'+
           LeftStr(tglawal.Text,2);

   akhir := rightstr(tglakhir.text,4)+'-'+AnsiMidStr(tglakhir.text,4,2)+'-'+
           LeftStr(tglakhir.text,2);


   with dmz.expireddset do
      begin
      sql.Text := 'select * from taobat where obexpired between  '+
      ' (:a) and (:b) ';
      params.ParamByName('a').Value := awal;
      params.ParamByName('b').Value := akhir;
      active:=true;
    end;

     opsi := tglawal.Text+' s/d '+tglakhir.Text;

    rpExpired.ProjectFile := 'expired.rav';
    rpExpired.Open;
    rpExpired.SelectReport('expired.rav',true);
    rpExpired.SetParam('tglexpired',opsi);
    rpExpired.Execute;
end;

end.

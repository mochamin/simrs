unit unfrmcetakjualapotik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RpCon, RpConDS, RpBase, RpSystem,
  RpDefine, RpRave;

type
  TfrmCetakJualApotik = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    rg: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    gbtgl: TGroupBox;
    tglawal: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    tglakhir: TEdit;
    rpthelapapotik: TRvProject;
    apotikengine: TRvSystem;
    rdthelapapotik: TRvDataSetConnection;
    procedure rgClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCetakJualApotik: TfrmCetakJualApotik;

implementation

{$R *.dfm}
uses strutils, dmzun;

procedure TfrmCetakJualApotik.rgClick(Sender: TObject);
begin
  case rg.ItemIndex of
   -1 : gbtgl.Enabled:=false;
    0 : gbtgl.Enabled:=false;
   1  : begin
        gbtgl.Enabled:=true;
        tglawal.Text:=dateToStr(date());
        tglakhir.Text := dateToStr(date());
        tglawal.SetFocus;
        end;

  end;
end;

procedure TfrmCetakJualApotik.FormActivate(Sender: TObject);
begin
// rg.ItemIndex:=-1;
 if dmz.stockopnamedset.Active = false then dmz.stockopnamedset.Active := true;
end;

procedure TfrmCetakJualApotik.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TfrmCetakJualApotik.BitBtn2Click(Sender: TObject);
var konversitgl,awal,akhir,opsitgl : string;

begin



if rg.ItemIndex = 0 then
begin
    konversitgl := dateToStr(date);

    awal := rightstr(konversitgl,4)+'-'+AnsiMidStr(konversitgl,4,2)+'-'+
           LeftStr(konversitgl,2);

   akhir := rightstr(konversitgl,4)+'-'+AnsiMidStr(konversitgl,4,2)+'-'+
           LeftStr(konversitgl,2);

               

    with dmz.thelapapotikds do
      begin
      sql.Text := 'select * from taapotik where aptgl between  '+
      ' (:a) and (:b) ';
      params.ParamByName('a').Value := awal;
      params.ParamByName('b').Value := akhir;
      active := true;
    end;

    opsitgl := konversitgl;
        
end;

if rg.ItemIndex = 1 then
begin
   awal := rightstr(tglawal.text,4)+'-'+AnsiMidStr(tglawal.Text,4,2)+'-'+
           LeftStr(tglawal.Text,2);

   akhir := rightstr(tglakhir.text,4)+'-'+AnsiMidStr(tglakhir.text,4,2)+'-'+
           LeftStr(tglakhir.text,2);



  with dmz.thelapapotikds do
      begin
      sql.Text := 'select * from taapotik where aptgl between  '+
      ' (:a) and (:b) ';
      params.ParamByName('a').Value := awal;
      params.ParamByName('b').Value := akhir;
      active:=true;
    end;

    opsitgl := tglawal.Text+' s/d '+tglakhir.Text;

end;

    rpthelapapotik.ProjectFile := 'apotikjual.rav';
    rpthelapapotik.Open;
    rpthelapapotik.SelectReport('apotikjual.rav',true);
    rpthelapapotik.SetParam('rTgl',opsitgl);
    rpthelapapotik.Execute;
end;

procedure TfrmCetakJualApotik.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmz.thelapapotikds.Active := false;
end;

end.

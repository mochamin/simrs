unit unfrmcetakkwitansilab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, ADODB, RpCon, RpConDS,
  RpDefine, RpRave, RpBase, RpSystem;

type
  Tfrmcetakkwitansilab = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    rvProjekLab: TRvProject;
    rvkwitansilab: TRvDataSetConnection;
    dsetrptkwitansilab: TADODataSet;
    Label2: TLabel;
    noregistrasi: TEdit;
    btnprint: TBitBtn;
    RvSystem: TRvSystem;
    procedure btnprintClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure noregistrasiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcetakkwitansilab: Tfrmcetakkwitansilab;

implementation

{$R *.dfm}

uses unUtama, unfrmviewreglab,kwitansi,unFungsi;

procedure Tfrmcetakkwitansilab.btnprintClick(Sender: TObject);
var noreg : string;
    tempAtasNama : string;
    total : double;
    terbilang : string;
    noKwitansi : string;
begin
 noreg := noregistrasi.Text;




 with dsetrptkwitansilab do
 begin
   active:=false;
   commandType := cmdtext;
   commandText := 'select * from talab '+
   'where lbkode like (:noreg)';
   parameters.ParamByName('noreg').Value := noreg;
   active:=true;

   if isempty=false then
   begin
     total:=fields.fieldbyname('lbtotal').AsFloat;
   end;

    terbilang:=rupiah(floatToStr(round(total)));



  tempAtasNama:=inputBox('Kwitansi Atas Nama : ',tempAtasNama,'');
  if Length(tempAtasNama)=0 then
   begin
     tempAtasNama:= fieldByName('lbnama').AsString;
   end;
 end;

 noKwitansi:= autonumberKwitansi(noreg,total);

 rvProjekLab.ProjectFile:='kwitansilab.rav';
 rvProjekLab.Open;
 rvProjekLab.SelectReport('kwitansilab.rav',true);
 rvProjekLab.SetParam('noreg',noreg);
 rvProjekLab.SetParam('currentuser',AnsiUpperCase(iscurrentuser));
 rvProjekLab.SetParam('atasnama',AnsiUpperCase(tempAtasNama));
 rvProjekLab.SetParam('noKwitansi',AnsiUpperCase(noKwitansi)); 
 rvProjekLab.SetParam('terbilang',AnsiUpperCase(terbilang));
 rvProjekLab.Execute;

 with dsetrptkwitansilab do
 begin
 if Locate('lbkode',noreg,[locaseinsensitive])=true then
 begin
   open;
   edit;
   FieldByName('lbatasnama').AsString := AnsiUpperCase(tempAtasNama);
   fieldByname('lbpic').AsString := isCurrentUser; // masukan nama user pencetak billing ke dlm dbase
   post;
   updateBatch(arCurrent);
 end;
 end;


end;

procedure Tfrmcetakkwitansilab.FormActivate(Sender: TObject);
begin
   isCetakKwitansiLab:=1;
end;

procedure Tfrmcetakkwitansilab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  isCetakKwitansiLab:=0;
end;

procedure Tfrmcetakkwitansilab.noregistrasiKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key=vk_return then
begin
  if length(noregistrasi.Text) < 6 then
     frmViewRegLab.ShowModal else
     btnprint.Click;  
end;

if key=vk_escape then
begin
  close;
end;
end;

end.

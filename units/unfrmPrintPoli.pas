unit unfrmPrintPoli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, RpCon, RpConDS, RpDefine, RpRave, ExtCtrls, StdCtrls;

type
  TfrmPrintPoli = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    rvProjectApotik: TRvProject;
    rvApotik: TRvDataSetConnection;
    dsetprintpoli: TADODataSet;
    rvObat: TRvDataSetConnection;
    dsetObat: TADODataSet;
    GroupBox1: TGroupBox;
    txtNama: TEdit;
    Label1: TLabel;
    lblnoreg: TLabel;
    lblUsia: TLabel;
    lblAlamat: TLabel;
    lblnorm: TLabel;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure txtNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtNamaKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintPoli: TfrmPrintPoli;

implementation

uses unUtama, unFrmViewPasienPoli;
{$R *.dfm}


procedure TfrmPrintPoli.FormActivate(Sender: TObject);
begin
 isPrintPoli:=1;
end;

procedure TfrmPrintPoli.txtNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
  frmViewPasienPoli.ShowModal;
 end;
end;

procedure TfrmPrintPoli.txtNamaKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TfrmPrintPoli.Button1Click(Sender: TObject);
var tempkode : string;
begin
 tempkode := lblnoreg.Caption;
 with dsetprintpoli do
 begin
  active:=false;
  commandType := cmdText;
  commandText :='select * from taapotik '+
  'where apkodeapotik like (:kode) ';
  parameters.ParamByName('kode').Value := tempkode;
  active:=true;
 end;

 rvProjectApotik.ProjectFile := 'struk.rav';
 rvProjectApotik.Open;
 rvprojectApotik.SetParam('noreg',tempkode);
 rvprojectApotik.Execute;
end;

end.

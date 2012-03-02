unit unfrmpasswordsetwkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, db,adodb,Buttons, Mask, DBCtrls;

type
  Tfrmsettingwktkeluar = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    password: TEdit;
    Label2: TLabel;
    gbdata: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    dbnoreg: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label6: TLabel;
    jamkeluar: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    username: TEdit;
    Label7: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure passwordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsettingwktkeluar: Tfrmsettingwktkeluar;

implementation

uses unDm;

{$R *.dfm}

procedure Tfrmsettingwktkeluar.FormActivate(Sender: TObject);
begin
  username.Clear;
  password.Clear;
  username.SetFocus;
  gbdata.Visible := false;
end;

procedure Tfrmsettingwktkeluar.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure Tfrmsettingwktkeluar.passwordKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

begin
 if key=vk_return then
 begin
    with dm.dsetsettingjam do
    begin
      active:=false;
      commandType := cmdText;
      commandText := 'select * from tauser,tausergroup '+
      'where usnamagroup like ugnamagroup '+
      'and usnama like (:username) '+
      'and uspassword like (:password) ';
      parameters.ParamByName('password').Value := password.Text;
      parameters.ParamByName('username').Value := username.Text;
      active:=true;

      if isempty=false then
      begin
        if (fieldByname('ugnamagroup').AsString) = 'Superuser' then
        begin
         gbdata.Visible := true;
         jamkeluar.SetFocus;
        end else showMessage('Maaf, Anda Tidak Punya Hak!');
      end else begin
               showMessage('Maaf, Anda Tidak Punya Hak!');
               username.SetFocus;
               password.Clear;
              end;
    end;

 end; // end if vkey
end;

procedure Tfrmsettingwktkeluar.BitBtn2Click(Sender: TObject);
var noreg : string;
begin
 noreg := dbnoreg.Caption;
 if MessageDlg('Setting Jam Keluar? ',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
    with dm.dsetKamarDetail do
    begin
      active:=false;
      commandType := cmdTExt;
      commandText := 'select * from takamardetail '+
      'where kdactive=1 '+
      'and kdnoreg like (:noreg) ';
      parameters.ParamByName('noreg').Value := noreg;
      active:=true;

      if isEmpty=false then
      begin
        open;
        edit;
        fieldByName('kdjamkeluar').AsString := jamkeluar.Text;
        fieldByName('kdNumOfDays').AsInteger := fieldByName('kdNumOfDays').AsInteger-1; 
        post;
        showMessage('Jam Keluar Tersimpan...');
      end; // end of isEmpty

    end;
 end; // end of if messagedlg
end;

end.

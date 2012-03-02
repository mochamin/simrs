unit unfrmrawatbaby;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls,db,adodb;

type
  TfrmRawatBaby = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    tgl: TMaskEdit;
    noreg: TEdit;
    kodekamar: TEdit;
    namaibu: TEdit;
    Label6: TLabel;
    alamat: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRawatBaby: TfrmRawatBaby;

implementation

uses unFrmTransaksiRawatInap, unDm,unUtama,unFungsi;

{$R *.dfm}

procedure TfrmRawatBaby.Button2Click(Sender: TObject);
begin
 close;
end;

procedure TfrmRawatBaby.FormActivate(Sender: TObject);
begin
  tgl.Text := dateToStr(date());
  noreg.Text := frmTreatment.txtViewReg.Caption;
  kodekamar.Text := frmTreatment.txtViewKodeKamar.Caption;
  namaibu.Text   := frmTreatment.txtviewnama.Caption;
  alamat.Text    := frmTreatment.txtViewAlamat.Text;
end;

procedure TfrmRawatBaby.Button1Click(Sender: TObject);
var markup : integer;
    kamar : string;
    tarifkamar : double;
begin
 kamar := kodekamar.Text;
 tarifkamar :=cektarifkamar(kamar);
 if messageDlg('simpan Data? ',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   with dm.dsetrawatbaby do
   begin
    open;
    if locate('rbnoreg',frmTreatment.txtViewReg.Caption,[locaseinsensitive])=true then
    begin
    edit; // kalau ketemu no reg sejenis maka edit
    end else
    begin
    append; // kalau noreg belum ketemu maka di append;
    end;


    fieldByName('rbnoreg').AsString      := noreg.Text;
    fieldByName('rbtglmasuk').AsString   := tgl.Text;
    fieldByName('rbkodekamar').AsString  := kodekamar.Text;
    fieldByName('rbtarifkamar').AsFloat  := tarifkamar/2; // kamar bayi setengah harga kamar ortu
    post;
    frmTreatment.gridTreatment.Fields[0].Value := date();
    frmTreatment.gridTreatment.Fields[1].Value := time();
    frmTreatment.gridTreatment.Fields[2].Value := 'BABY';
    frmTreatment.gridTreatment.Fields[3].Value := 'Perawatan Baby';
    frmTreatment.gridTreatment.Fields[4].Value := 0;
    frmTreatment.gridTreatment.Fields[5].Value := 1;

    //updatebatch(arall);
   end;
   frmRAwatBaby.Close;
 end;
end;

end.

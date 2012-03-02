unit unFrmAddBed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ADODb,ExtCtrls, DBCtrls;

type
  TfrmAddBed = class(TForm)
    Panel1: TPanel;
    Image2: TImage;
    Label15: TLabel;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    txtKodeKamar: TEdit;
    txtNamaKamar: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    txtRateKamar: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    txtJmlBed: TEdit;
    txtFasilitas: TMemo;
    txtKamartersedia: TEdit;
    Label6: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure txtJmlBedKeyPress(Sender: TObject; var Key: Char);
    procedure txtRateKamarKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure validasiKamar;
    procedure simpanKamar;
    procedure refreshKamar;
    procedure clearKamar;
  end;

var
  frmAddBed: TfrmAddBed;

implementation

uses unDm;

{$R *.dfm}


procedure TfrmAddBed.clearKamar;
begin
  txtKodeKamar.Clear;
  txtNamaKamar.Clear;
  txtFasilitas.Clear;
  txtJmlBed.Clear;
  txtRateKamar.Clear;
end;

procedure TfrmAddBed.refreshKamar;
begin
    with dm.dSetKamar do
     begin
        active:=false;
        commandType := cmdText;
        commandText := 'SELECT * FROM takamar '+
        'ORDER BY kaKode';
        active:=true;
     end;
    { dm.qrRefreshKamar.Connection.Open;
     dm.qrRefreshKamar.ExecSQL;}
end;


procedure tfrmAddBed.simpanKamar;
begin
   with dm.dSetKamar do
   begin
   if messageDlg('Simpan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
     //refreshKamar;
     open;
     append;
     fields.FieldByName('kaKode').AsString := txtKodeKamar.Text;
     fields.FieldByName('kaNama').AsString := txtNamaKamar.Text;
     fields.FieldByName('kaFasilitas').AsString := txtFasilitas.Text;
     fields.FieldByName('kaJmlBed').AsString := txtJmlBed.Text;
     fields.FieldByName('kaRate').AsString := txtRateKamar.Text;
     fields.FieldByName('kaKeterangan').AsInteger := strToInt(txtKamarTersedia.Text);
     post;
     showMessage('data disimpan...');
     refreshKamar;
     //clearKamar;
     frmAddBed.Close;
   end;
  end; 

end;


procedure TfrmAddBed.validasiKamar;
begin


   with dm.dSetKamar do
   begin
     active:=false;
     commandType := cmdText;
     commandText := 'SELECT * FROM takamar '+
     'WHERE kaKode LIKE (:kode)';
     parameters.ParamByName('kode').Value := '%'+txtKodeKamar.Text+'%';
     active:=true;


    if isEmpty=false then
    begin
      showMessage('Kode sudah ada, mohon gunakan kode yang lain.');
      txtKodeKamar.SetFocus;
    end else
    if Length(txtKodeKamar.Text)=0 then
    begin
        showMessage('Kode Kamar Harap diisi!');
        txtKodeKamar.SetFocus;
    end else
        if Length(txtNamaKamar.Text)=0 then
        begin
          showMessage('Nama Kamar harap diisi!');
          txtNamakamar.SetFocus;
        end else
            if Length(txtFasilitas.Text)=0 then
            begin
               showMessage('Type Kamar kosong, harap diisi!');
               txtFasilitas.SetFocus;
            end else
             if Length(txtRateKamar.Text)=0 then
             begin
               showMessage('Rate/Tarif kamar belum diisi!');
               txtRateKamar.SetFocus;
             end else
             if Length(txtJmlBed.Text)=0 then
             begin
               showMessage('Jml Tempat tidur kosong, harap diisi!');
               txtJmlBed.SetFocus;
             end else simpanKamar;
     end; //end of dset...
end;


procedure TfrmAddBed.BitBtn1Click(Sender: TObject);
begin
  frmAddBed.Close;
end;

procedure TfrmAddBed.BitBtn3Click(Sender: TObject);
begin
//  validasiKamar;
simpanKamar;
end;

procedure TfrmAddBed.txtJmlBedKeyPress(Sender: TObject; var Key: Char);
begin

 if not (Key in['0'..'9',#8]) then
 begin
 key :=#0;
 end;
end;

procedure TfrmAddBed.txtRateKamarKeyPress(Sender: TObject; var Key: Char);
begin

  if not (Key in['0'..'9',#8]) then
 begin
 key :=#0;
 end;
end;

procedure TfrmAddBed.FormActivate(Sender: TObject);
begin
 if dm.dSetKamar.Active=false then dm.dSetKamar.Active:=true;
 txtKodeKamar.SetFocus;
 clearKamar;
end;

end.

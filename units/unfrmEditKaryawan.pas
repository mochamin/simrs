unit unfrmEditKaryawan;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB,adodb, Buttons, Mask, ExtCtrls;

type
  TfrmEditKaryawan = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditkrKodeKaryawan: TDBEdit;
    Label2: TLabel;
    EditkrNama: TDBEdit;
    Label3: TLabel;
    EditkrTempatLahir: TDBEdit;
    Label4: TLabel;
    EditkrTglLahir: TDBEdit;
    Label5: TLabel;
    EditkrPendidikan: TDBEdit;
    Label6: TLabel;
    EditkrAlamat: TDBEdit;
    Label7: TLabel;
    EditkrKodePos: TDBEdit;
    Label8: TLabel;
    EditkrTelp: TDBEdit;
    Label9: TLabel;
    EditkrHP: TDBEdit;
    Label10: TLabel;
    EditkrTglBergabung: TDBEdit;
    Label12: TLabel;
    EditkrStatusKaryawan: TDBEdit;
    Label13: TLabel;
    EditkrGajiPokok: TDBEdit;
    Label14: TLabel;
    EditkrTunjanganTransport: TDBEdit;
    Label15: TLabel;
    EditkrTunjanganMakan: TDBEdit;
    Label16: TLabel;
    EditkrTunjanganHadir: TDBEdit;
    Label17: TLabel;
    EditkrTunjanganLain: TDBEdit;
    Label18: TLabel;
    Editkrtax: TDBEdit;
    Label19: TLabel;
    EditkrKeterangan: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmEditKaryawan: TfrmEditKaryawan;

implementation

uses unDm;

{$R *.DFM}

procedure TfrmEditKaryawan.BitBtn1Click(Sender: TObject);
begin
 if messageDlg('Simpan Record?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dsetKaryawan.UpdateBatch(arAll);
 end;
end;

procedure TfrmEditKaryawan.BitBtn2Click(Sender: TObject);
begin
  if messageDlg('Batalkan Perubahan?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   dm.dsetKaryawan.CancelBatch(arAll);
 end;
end;

end.

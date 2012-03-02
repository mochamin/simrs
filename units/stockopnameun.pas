unit stockopnameun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  Tstockopnamefrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    cari: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cariChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  stockopnamefrm: Tstockopnamefrm;

implementation

uses unfrmwait, dmzun,db;
{$R *.dfm}

procedure Tstockopnamefrm.BitBtn1Click(Sender: TObject);
begin

if messagedlg('Lakukan Proses Stock Opname?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
 tunggu.openWait;
 tunggu.showWait('Proses Stockopname. Mohon Tunggu...');

 with dmz.obatstockdset do
 begin
  first;
  while not eof do
  begin
    dmz.stockopnamedset.open;
    dmz.stockopnamedset.Append;
    dmz.stockopnamedset.fieldbyname('so_kdobat').value    := fieldbyname('obkode').value;
    dmz.stockopnamedset.FieldByName('so_namaobat').Value  := fieldbyname('obnama').Value;
    dmz.stockopnamedset.FieldByName('so_tgl').Value       := date();
    dmz.stockopnamedset.FieldByName('so_current').Value   := fieldbyname('obstok').Value;
    dmz.stockopnamedset.FieldByName('so_adjust').Value    := fieldbyname('obson').Value;
    dmz.stockopnamedset.FieldByName('so_harga').Value     := fieldbyname('obhargajual').Value;
    dmz.stockopnamedset.Post;
  next;  
  end;
 end;
    messagedlg('Stock Opname Selesai.',mtInformation,[mbOK],0);
 end;   
end;

procedure Tstockopnamefrm.BitBtn2Click(Sender: TObject);
begin
 if messagedlg('Reset Stock ini digunakan untuk mengganti semua STOK SISTEM dengan '+#13+
 ' STOK FISIK secara permanen (tidak bisa diubah)! '+#13+
 ' Anda Yakin Reset Stok ? ',mtWarning,[mbYes,mbNo],0)=mrYes then
 begin

 tunggu.openWait;
 tunggu.showWait('Proses RESET STOK. Jangan lakukan apapun selama proses berlangsung. Mohon Tunggu...');

 with dmz.obatstockdset do
 begin
  open;
  first;
  while not eof do
  begin
    dmz.obatresetdset.Open;
    if dmz.obatresetdset.Locate('obkode',fieldbyname('obkode').Value,[loCaseInsensitive,loPartialKey])=true then
    begin
     if (dmz.obatresetdset.FieldByName('obson').AsInteger) > 0 then
     begin
      dmz.obatresetdset.Open;
      dmz.obatresetdset.Edit;
      dmz.obatresetdset.FieldByName('obstok').AsInteger := fieldbyname('obson').AsInteger;
      dmz.obatresetdset.Post;
     end; // if dmz. obson 
    end;
  next;
  end;
 end;

    dmz.obatstockdset.Active := false;
    dmz.obatstockdset.Active := true;
    messagedlg('Reset Stock Selesai.',mtInformation,[mbOK],0);
 end; // end of if messagedlg
end;

procedure Tstockopnamefrm.FormCreate(Sender: TObject);
begin
 if dmz.stockopnamedset.Active = false then dmz.stockopnamedset.Active := true;
 if dmz.obatstockdset.Active = false then dmz.obatstockdset.Active := true;
end;

procedure Tstockopnamefrm.FormActivate(Sender: TObject);
begin
  cari.SetFocus;
end;

procedure Tstockopnamefrm.cariChange(Sender: TObject);
begin
  with dmz.obatstockdset do
  begin
    sql.Text := 'SELECT * FROM taobat WHERE obnama LIKE (:a) '+
    ' ORDER BY obnama ASC ';
    params.ParamByName('a').Value := cari.Text+'%';
    open;
  end;
end;

end.

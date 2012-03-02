unit pembelianun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls, adodb,db,Buttons,strutils;

type
  Tpembelianfrm = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    gridbeli: TDBGrid;
    dbauto: TDBEdit;
    Panel1: TPanel;
    Panel8: TPanel;
    btnnew: TBitBtn;
    btnsimpan: TBitBtn;
    btnbatal: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    dbtgl: TDBEdit;
    Label4: TLabel;
    dbpic: TDBEdit;
    Label5: TLabel;
    Panel5: TPanel;
    pic: TEdit;
    dbgudang: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure gridbeliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnnewClick(Sender: TObject);
    procedure gridbeliEnter(Sender: TObject);
    procedure btnbatalClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure autonumber;
    procedure updateStokObat;
  public
    { Public declarations }
  end;

var
  pembelianfrm: Tpembelianfrm;


implementation

uses unUtama, unViewObat, unDm, dmzun,gudangun;

{$R *.dfm}

procedure Tpembelianfrm.autonumber;
begin

end;

procedure Tpembelianfrm.updateStokObat;
begin


   with dm.dsetbelidetail do
   begin
     open;
     first;
     while not eof do
     begin
      if dm.dsetObat.Locate('obkode',trim(gridbeli.Fields[0].Value),[loCaseInsensitive]) then
      begin

       // masuk kartu stock //
       dmz.kartustockdset.Open;
       dmz.kartustockdset.Append;
       dmz.kartustockdset.FieldByName('ks_tgl').Value           := date();
       dmz.kartustockdset.FieldByName('ks_wkt').Value           := time();
       dmz.kartustockdset.FieldByName('ks_notransaksi').Value   := dbauto.Text;
       dmz.kartustockdset.FieldByName('ks_kodeobat').Value      := dm.dsetObat.fieldbyname('obkode').Value;
       dmz.kartustockdset.FieldByName('ks_stokawal').Value      := dm.dsetObat.fieldbyname('obstok').Value;
       dmz.kartustockdset.FieldByName('ks_stoktrans').Value     := fieldbyname('pd_qty').Value;
       dmz.kartustockdset.FieldByName('ks_stokakhir').Value     := dm.dsetObat.fieldbyname('obstok').Value+fieldbyname('pd_qty').Value;
       dmz.kartustockdset.FieldByName('ks_gudang').Value        := dbgudang.Text;
       dmz.kartustockdset.FieldByName('ks_pic').Value           := isCurrentuser;
       dmz.kartustockdset.FieldByName('ks_ket').Value           := 'Obat Masuk/Pembelian-'+dbgudang.Text;
       dmz.kartustockdset.Post;
       ////////////////////////////////

       dm.dsetObat.Edit;
       dm.dsetObat.FieldByName('obstok').Value := dm.dsetObat.FieldByName('obstok').Value + gridbeli.Fields[3].Value;
       dm.dsetObat.FieldByName('obhargajual').Value := gridbeli.Fields[2].Value;
       dm.dsetObat.Post;

      end; // end if dm.dsetobatview
      next; 
     end; // end of while
     dm.dsetObat.UpdateBatch(arAll);
   end; // end of dm.dsetbelidetail
end;

procedure Tpembelianfrm.FormActivate(Sender: TObject);
begin
 isPembelian:=1; 
 if dm.dsetbeli.Active = false then dm.dsetbeli.Active := true;
 if dm.dsetobat.active = false then dm.dSetObat.Active := true;
 if dm.dsetbelidetail.Active = false then dm.dsetbelidetail.Active := true;
 if dmz.gudangdset.Active = false then dmz.gudangdset.Active := true;
 dbpic.Text := isCurrentUser;
end;

procedure Tpembelianfrm.gridbeliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
 begin
   frmviewobat.ShowModal;
 end; // end of

 if key=vk_delete then
 begin
   dm.dsetbelidetail.Delete;
 end;
end;

procedure Tpembelianfrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 isPembelian:=0;
end;

procedure Tpembelianfrm.btnnewClick(Sender: TObject);
var txtAutonumber : string;
begin

 btnsimpan.Visible := true;
 btnbatal.Visible := true;
 ///////////////////////////////
  txtAutoNumber := RightStr(dateToStr(date),4)+AnsiMidStr(dateToStr(date),4,2)+
                LeftStr(dateToStr(date),2)+
                LeftStr(timeToStr(time),2)+
                AnsiMidStr(timeToStr(time),4,2)+
                RightStr(timeToStr(time),2);
/////////////////////////////////////////

 dm.dsetbeli.Append;       
 dbauto.Text := txtAutonumber;
 dbtgl.Text  := dateToStr(date);
 dbpic.Text  := isCurrentUser;
 //dbnofaktur.SetFocus;
end;

procedure Tpembelianfrm.gridbeliEnter(Sender: TObject);
begin
 dm.dsetbeli.Post;
end;

procedure Tpembelianfrm.btnbatalClick(Sender: TObject);
begin
  if messagedlg('Batalkan Transaki?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
    dm.dsetbeli.CancelBatch(arAll);
       btnsimpan.Visible := false;
    btnbatal.Visible := false;
 end;
end;

procedure Tpembelianfrm.btnsimpanClick(Sender: TObject);
begin
  if messagedlg('Simpan Transaki?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
    dm.dsetbeli.UpdateBatch(Arall);
    dm.dsetbelidetail.UpdateBatch(arAll);
    btnsimpan.Visible := false;
    btnbatal.Visible := false;
    updateStokObat;
 end;
end;

procedure Tpembelianfrm.SpeedButton1Click(Sender: TObject);
begin
 gudangfrm.showmodal;
end;

end.

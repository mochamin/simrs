unit unFrmMigrasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, adodb,db, Mask,dateutils, DBCtrls;



type
  TfrmMigrasi = class(TForm)
    c: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    txtCariNama: TEdit;
    GroupBox3: TGroupBox;
    dbNoReg: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    gridViewKamar: TDBGrid;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    dbrate: TDBEdit;
    Label8: TLabel;
    DBMemo2: TDBMemo;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    dbKodeKamar: TDBEdit;
    Label13: TLabel;
    dbKodeKmr: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure gridViewKamarDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure txtCariNamaChange(Sender: TObject);
  private
    { Private declarations }
    procedure MigrasiKamar;
    procedure insertKamar;
    procedure refreshViewKamar;
    procedure refreshViewRawatInap;
  public
    { Public declarations }
  end;

var
  frmMigrasi: TfrmMigrasi;
  

implementation

uses unDm, unFrmTransaksiRawatInap;

{$R *.dfm}

procedure TfrmMigrasi.refreshViewKamar;
var kodeOldKamar : string;
begin
  kodeOldKamar := dbkodeKamar.Text;
  with dm.dsetViewKamar do
  begin
   active := false;
   commandType := cmdText;
   commandText := 'select * from takamar '+
   'WHERE kaBedStok <> 0 ';
   active := true;
   locate('kakode',kodeOldKamar,[loCaseInsensitive]);
  end;
end;

procedure TfrmMigrasi.refreshViewRawatInap;
var oldnoreg : string;
begin
 oldnoreg := dbnoreg.Text;
 with dm.dsetViewRawatInap do
 begin
  active:=false;
  commandType := cmdText;
  commandText := 'select * from tarawatinap, tapasien, takamar, takamardetail '+
  'where psKodePasien LIKE inNoRM AND '+
  'kdNoReg LIKE inNoReg AND '+
  'kaKode LIKE kdKamar AND '+
  'kdActive=1 AND '+
  'inisbayar = 0 '+
  'ORDER BY inNoReg ';
  active := true;
  locate('innoreg',oldnoreg,[loCaseInsensitive]);
 end;
end;

procedure TfrmMigrasi.MigrasiKamar;
var tglkeluar,tglMasuk : TDate;
    kodekamarbaru : string;
    persenadm : integer;
begin
 tglKeluar := date();

 kodekamarbaru := gridViewKamar.Fields[2].Value;
if (kodekamarbaru)<>(dbkodekmr.Text) then
begin

 if MessageDlg('Pasien ini Akan Migrasi/Pindah Kamar? ',
 mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
 {        gridviewkamar.DataSource.Edit;
         gridViewKamar.Fields[1].value:=gridViewKamar.Fields[1].Value-1;

      // ubah jumlah stok kamar pada kamar yang aktif
        gridViewKamar.DataSource.Edit;
        gridViewKamar.Fields[1].Value := (gridViewKamar.Fields[1].Value)-1;

       gridViewKamar.Options := [dgTitles,dgColumnResize,
       dgColLines,dgRowLines,dgTabs,dgRowSelect,
       dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];

  }

    with dm.dsetKamarDetail do
    begin
    active := false;
    commandType := cmdText;
    commandText := 'select * from takamardetail '+
    'WHERE kdActive=1 AND '+
    'kdNoReg LIKE (:noReg) ';
    parameters.ParamByName('noReg').Value := dbNoReg.Text;
    active:=true;

    if isEmpty=false then
    begin

      //showMessage('dsetKamarDetail '+fields.fieldByName('kdKamar').AsString);
      open;
      edit;
      tglMasuk := fields.fieldByName('kdTglMasuk').AsDateTime;
      fields.FieldByName('kdActive').AsInteger := 0;
      fields.FieldByName('kdTglKeluar').AsDateTime := date();
      fields.FieldByName('kdJamKeluar').AsDateTime := time();
      fields.FieldByName('kdnumofdays').AsInteger := daysbetween(TglKeluar,tglmasuk);
      post;

    //  tambahkan kamar baru hasil migrasi dan set sebagai kamar yang aktif
        append;
        fields.FieldByName('kdNoReg').AsString := dbNoreg.Text;
        fields.FieldByName('kdTglMasuk').AsDateTime := date();
        fields.FieldByName('kdKamar').AsString := dbKodeKamar.Text;
        fields.fieldbyname('kdtarif').AsString := dbRate.Text;
        fields.FieldByName('kdJamMasuk').AsDateTime := time();
        fields.FieldByName('kdActive').AsInteger :=1;
        post;



    end;  // end of isEmpty

   end;  //end of dsetkamarDetail

    // update persentase administrasi untuk kamar yang baru
    with dm.dsetrptadministrasi do
    begin
     active:=false;
     commandType := cmdText;
     commandText := 'select * from takamar,taadministrasi '+
     'where kakode like adkelas '+
     'and kakode like (:kodekamar) ';
     parameters.ParamByName('kodekamar').Value := dbkodekamar.Text;
     active:=true;
     persenadm := fields.fieldbyname('adadmin').AsInteger;
    end;

    //update persentase yg ada di rawatinap

    with dm.dSetRawatInap do
    begin
     active:=false;
     commandType := cmdTExt;
     commandText := 'select * from tarawatinap '+
     'where innoreg like (:noreg) ';
     parameters.ParamByName('noreg').Value := dbnoreg.Text;
     active:=true;

     if isempty=false then
     begin
       open;
       edit;
       fields.FieldByName('inpersenadm').AsInteger := persenadm;
       post;
     end;
    end;

    // tambahkan bed stok pada kamar yang ditinggalkan
      // tambahkan available kamar di master kamar
      with dm.dsetViewKamar do
      begin
        active := false;
        commandType := cmdText;
        commandText := 'SELECT * FROM takamar '+
        'where kaKode LIKE (:kode) ';
        parameters.ParamByName('kode').value := dbKodeKmr.Text;
        active := true;

        if isEmpty=false then
        begin
          //showMessage('dsetViewKamar '+fields.fieldByName('kaKode').AsString);
          open;
          edit;
          fields.FieldByName('kaBedStok').AsInteger := fields.fieldByName('kaBedStok').Value+1;
          post;
          requery;
        end; // end of isEmpty
        /////////////////////////////
         active := false;
        commandType := cmdText;
        commandText := 'SELECT * FROM takamar '+
        'where kaKode LIKE (:kode) ';
        parameters.ParamByName('kode').value := kodekamarbaru;
        active := true;

        if isEmpty=false then
        begin
          //showMessage('dsetViewKamar '+fields.fieldByName('kaKode').AsString);
          open;
          edit;
          fields.FieldByName('kaBedStok').AsInteger := fields.fieldByName('kaBedStok').Value-1;
          post;

        end; // end of isEmpty
     end; // end of dsetViewKamar

    refreshViewKamar;
    refreshViewRawatInap;
    showMessage('Pindah Kamar Telah dilakukan ...');
 end; // end of MessageDlg
end else begin
          showMessage('Kamar Lama sama dengan Kamar Baru, Pilih Kamar yang lain!');
         end;
end; // end of Procedure

procedure TfrmMigrasi.insertKamar;

begin
  with dm.dSetRawatInap.FieldByName('inKamar') do
  begin

  end;


end;


procedure TfrmMigrasi.Button1Click(Sender: TObject);
begin
  insertKamar;
end;

procedure TfrmMigrasi.gridViewKamarDblClick(Sender: TObject);
begin
  migrasiKamar;
end;

procedure TfrmMigrasi.FormActivate(Sender: TObject);
begin
frmTreatment.refreshViewRawatInap;
 refreshViewKamar;
end;

procedure TfrmMigrasi.txtCariNamaChange(Sender: TObject);
begin
  with dm.dsetViewRawatInap do
  begin
    Locate('psNama',txtcarinama.Text,[lopartialKey]);
  end;
end;

end.

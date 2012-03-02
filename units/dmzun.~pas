unit dmzun;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZConnection;

type
  Tdmz = class(TDataModule)
    rinoconn: TZConnection;
    kategoridset: TZQuery;
    kategorids: TDataSource;
    psikodset: TZQuery;
    thelapapotikds: TZQuery;
    expireddset: TZQuery;
    expireddsetobKode: TStringField;
    expireddsetobNama: TStringField;
    expireddsetobKodeSupplier: TStringField;
    expireddsetobSatuan: TStringField;
    expireddsetobStok: TLargeintField;
    expireddsetobMinStok: TLargeintField;
    expireddsetobHargaJual: TLargeintField;
    expireddsetobHargaBeli: TIntegerField;
    expireddsetobKategori: TStringField;
    expireddsetobExpired: TDateField;
    expireddsetobMerek: TStringField;
    expireddsetobSeri: TStringField;
    expireddsetobDiskon: TLargeintField;
    gudangdset: TZQuery;
    gudangds: TDataSource;
    kartustockdset: TZQuery;
    kartustockds: TDataSource;
    obatdset: TZQuery;
    obatds: TDataSource;
    obatstockdset: TZQuery;
    obatstockds: TDataSource;
    stockopnamedset: TZQuery;
    obatresetdset: TZQuery;
    stockopnamedsetso_id: TIntegerField;
    stockopnamedsetso_kdobat: TStringField;
    stockopnamedsetso_tgl: TDateField;
    stockopnamedsetso_time: TTimeField;
    stockopnamedsetso_current: TIntegerField;
    stockopnamedsetso_adjust: TIntegerField;
    stockopnamedsetso_pic: TStringField;
    stockopnamedsetso_harga: TFloatField;
    stockopnamedsetso_namaobat: TStringField;
    thelapapotikdsap_idx: TLargeintField;
    thelapapotikdsapKodeApotik: TStringField;
    thelapapotikdsapTgl: TDateField;
    thelapapotikdsapNoRegPasien: TStringField;
    thelapapotikdsapTipeCustomer: TStringField;
    thelapapotikdsapppn: TSmallintField;
    thelapapotikdsapjam: TTimeField;
    thelapapotikdsapTotal: TIntegerField;
    thelapapotikdsaptglwkt: TDateTimeField;
    thelapapotikdsappic: TStringField;
    thelapapotikdsapnama: TStringField;
    thelapapotikdsapalamat: TStringField;
    thelapapotikdsapumur: TStringField;
    thelapapotikdsapjaminan: TStringField;
    lapbrgmasukdset: TZQuery;
    lapbrgdetail: TZQuery;
    lapbrgdetailpd_Id: TIntegerField;
    lapbrgdetailpd_notransaksi: TStringField;
    lapbrgdetailpd_kodeobat: TStringField;
    lapbrgdetailpd_namaobat: TStringField;
    lapbrgdetailpd_qty: TIntegerField;
    lapbrgdetailpd_total: TFloatField;
    lapbrgdetailpd_hrga: TFloatField;
    lapbrgdetailpd_tgl: TDateField;
    lapbrgdetailpd_kategori: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmz: Tdmz;

implementation

{$R *.dfm}

end.

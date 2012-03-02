object dm: Tdm
  OldCreateOrder = False
  Left = 402
  Top = 114
  Height = 700
  Width = 1172
  object dsourceDokter: TDataSource
    DataSet = dsetdokter
    Left = 232
    Top = 16
  end
  object dSourceKaryawan: TDataSource
    DataSet = dsetKaryawan
    Left = 232
    Top = 72
  end
  object dSetPasien: TADODataSet
    Active = True
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'SELECT *  from tapasien'#13#10
    Parameters = <>
    Left = 608
    Top = 80
  end
  object dSourcePasien: TDataSource
    DataSet = dSetPasien
    Left = 168
    Top = 16
  end
  object dSetLayanan: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 'select * from tapasien,taguardian,tadokter'
    Parameters = <>
    Left = 448
    Top = 80
  end
  object dSourceLayanan: TDataSource
    DataSet = dSetLayanan
    Left = 104
    Top = 121
  end
  object dSetPoli: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    BeforeOpen = dSetPoliBeforeOpen
    CommandText = 'select * from tapoli'
    Parameters = <>
    Left = 712
    Top = 8
  end
  object dSourcePoli: TDataSource
    DataSet = dSetPoli
    Left = 168
    Top = 72
  end
  object dSetDept: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tadepartemen'#13#10'ORDER BY dpKode asc'
    Parameters = <>
    Left = 408
    Top = 256
  end
  object dSourceDept: TDataSource
    DataSet = dSetDept
    Left = 168
    Top = 120
  end
  object dSourceKamar: TDataSource
    DataSet = dsetkamar
    Left = 232
    Top = 120
  end
  object dsetApotikPasien: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 
      'select * from talayananpoli,tapasien,  tadokter, tapoli'#13#10'WHERE p' +
      'sKodePasien LIKE lpKodePasien '#13#10'AND'#13#10'dkKodeDokter LIKE lpKodeDok' +
      'ter '#13#10'AND'#13#10'poKode LIKE lpKodePoli'#13#10'AND'#13#10'lpisbayar=0'#13#10'ORDER BY  l' +
      'pTglWktu'#13#10#13#10
    Parameters = <>
    Left = 528
    Top = 80
  end
  object dsourceApotikPasien: TDataSource
    DataSet = dsetApotikPasien
    Left = 88
    Top = 224
  end
  object dSetObat: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dSetObatBeforeOpen
    AfterOpen = dSetObatAfterOpen
    CommandText = 'select * from taobat'
    Parameters = <>
    Left = 384
    Top = 80
  end
  object dSourceObat: TDataSource
    DataSet = dSetObat
    Left = 120
    Top = 72
  end
  object dSetApotik: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dSetApotikBeforeOpen
    AfterOpen = dSetApotikAfterOpen
    CommandText = 'select * from taapotik order by ap_idx DESC'#13#10'LIMIT 10'
    Parameters = <>
    Left = 360
    Top = 136
  end
  object dSourceApotikMaster: TDataSource
    DataSet = taApotik
    Left = 104
    Top = 16
  end
  object taApotik: TADOTable
    Connection = connKlinik
    CursorType = ctStatic
    TableName = 'taapotik'
    Left = 712
    Top = 456
  end
  object dSourceApotikDetail: TDataSource
    DataSet = dsetApotikDEtail
    Left = 104
    Top = 176
  end
  object taApotikDetail: TADOTable
    Connection = connKlinik
    CursorType = ctStatic
    IndexFieldNames = 'adKodeApotik'
    MasterFields = 'apKodeApotik'
    MasterSource = dSourceApotikMaster
    TableName = 'taapotikdetail'
    Left = 448
    Top = 424
  end
  object dsourceApotik: TDataSource
    DataSet = dSetApotik
    Left = 176
    Top = 176
  end
  object dSetJK: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 'select * from tajk'
    Parameters = <>
    Left = 376
    Top = 192
  end
  object dsourceJK: TDataSource
    DataSet = dSetJK
    Left = 240
    Top = 176
  end
  object dsetLayananPoli: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 'select * from talayananpoli'
    Parameters = <>
    Left = 384
    Top = 304
  end
  object dSetRawatInap: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 'select * from tarawatinap'#13#10'order by in_idx asc'
    Parameters = <>
    Left = 408
    Top = 368
  end
  object dsourceRawatInap: TDataSource
    DataSet = dSetRawatInap
    Left = 168
    Top = 240
  end
  object dsetViewKamar: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    BeforeOpen = dsetViewKamarBeforeOpen
    CommandText = 'select * from takamar'#13#10'WHERE kaBedStok <> 0'#13#10
    Parameters = <>
    Left = 776
    Top = 80
  end
  object dSourceViewKamar: TDataSource
    DataSet = dsetViewKamar
    Left = 224
    Top = 224
  end
  object dsetObatView: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    BeforeOpen = dsetObatViewBeforeOpen
    AfterOpen = dsetObatViewAfterOpen
    CommandText = 'select * from taobat'
    Parameters = <>
    Left = 560
    Top = 176
    object dsetObatViewobKode: TStringField
      FieldName = 'obKode'
      FixedChar = True
      Size = 50
    end
    object dsetObatViewobNama: TStringField
      FieldName = 'obNama'
      FixedChar = True
      Size = 150
    end
    object dsetObatViewobKodeSupplier: TStringField
      FieldName = 'obKodeSupplier'
      FixedChar = True
      Size = 50
    end
    object dsetObatViewobSatuan: TStringField
      FieldName = 'obSatuan'
      FixedChar = True
      Size = 100
    end
    object dsetObatViewobStok: TIntegerField
      FieldName = 'obStok'
    end
    object dsetObatViewobMinStok: TIntegerField
      FieldName = 'obMinStok'
    end
    object dsetObatViewobHargaJual: TIntegerField
      FieldName = 'obHargaJual'
    end
    object dsetObatViewobHargaBeli: TIntegerField
      FieldName = 'obHargaBeli'
    end
    object dsetObatViewobKategori: TStringField
      FieldName = 'obKategori'
      FixedChar = True
      Size = 50
    end
    object dsetObatViewobExpired: TDateField
      FieldName = 'obExpired'
    end
    object dsetObatViewobMerek: TStringField
      FieldName = 'obMerek'
      FixedChar = True
      Size = 100
    end
    object dsetObatViewobSeri: TStringField
      FieldName = 'obSeri'
      FixedChar = True
      Size = 100
    end
    object dsetObatViewobDiskon: TIntegerField
      FieldName = 'obDiskon'
    end
    object dsetObatViewobson: TIntegerField
      FieldName = 'obson'
    end
    object dsetObatViewobrak: TStringField
      FieldName = 'obrak'
      Size = 255
    end
  end
  object dSourceObatView: TDataSource
    DataSet = dsetObatView
    Left = 80
    Top = 360
  end
  object dsetViewRawatInap: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 
      'select * from tarawatinap, tapasien,  takamar, takamardetail'#13#10'wh' +
      'ere psKodePasien LIKE inNoRM'#13#10'AND'#13#10'kdNoReg LIKE inNoReg'#13#10'AND'#13#10'ka' +
      'Kode LIKE kdKamar'#13#10'AND'#13#10'kdActive=1'#13#10'AND'#13#10'inisbayar = 0'#13#10'ORDER BY' +
      ' inNoReg'#13#10
    Parameters = <>
    Left = 720
    Top = 136
  end
  object dSourceViewRawatInap: TDataSource
    DataSet = dsetViewRawatInap
    Left = 312
    Top = 272
  end
  object dSetServices: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dSetServicesBeforeOpen
    CommandText = 'select * from taservices'#13#10'ORDER BY svKode'
    Parameters = <>
    Left = 464
    Top = 8
  end
  object dSourceServices: TDataSource
    DataSet = dSetServices
    Left = 152
    Top = 352
  end
  object dSetPasienKaryawan: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tapasienkaryawan'
    Parameters = <>
    Left = 456
    Top = 192
  end
  object dSetPerusahaan: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from taperusahaan'#13#10'ORDER BY phKode ASC'
    Parameters = <>
    Left = 880
    Top = 368
  end
  object dsourcePerusahaan: TDataSource
    DataSet = dSetPerusahaan
    Left = 152
    Top = 408
  end
  object dsourcePasienKaryawan: TDataSource
    DataSet = dSetPasienKaryawan
    Left = 240
    Top = 280
  end
  object dSetViewPasienKaryawan: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from tapasienkaryawan, taperusahaan'#13#10'where phKode LIKE ' +
      'pkKodePerusahaan'
    Parameters = <>
    Left = 880
    Top = 240
  end
  object dSourceViewPasienKaryawan: TDataSource
    DataSet = dSetViewPasienKaryawan
    Left = 64
    Top = 464
  end
  object dsetOptions: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from taoptions'
    Parameters = <>
    Left = 544
    Top = 384
  end
  object dsourceOptions: TDataSource
    DataSet = dsetOptions
    Left = 64
    Top = 408
  end
  object dSetRumahSakit: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dSetRumahSakitBeforeOpen
    CommandText = 'select * from tarumahsakit'#13#10'order by rsKode Asc'
    Parameters = <>
    Left = 584
    Top = 40
  end
  object dsourceRumahSakit: TDataSource
    DataSet = dSetRumahSakit
    Left = 88
    Top = 288
  end
  object dsetRptRawatInap: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 
      'SELECT * FROM tarawatinap'#13#10'INNER JOIN tapasien ON (tarawatinap.i' +
      'nnorm=tapasien.pskodepasien)'#13#10'WHERE inisbayar=0'#13#10
    Parameters = <>
    Left = 472
    Top = 376
  end
  object dsourceRptRawatInap: TDataSource
    DataSet = dsetRptRawatInap
    Left = 224
    Top = 352
  end
  object dsetKamarDetail: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 'select * from takamardetail'
    Parameters = <>
    Left = 712
    Top = 200
  end
  object dsetItemLab: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from taitemlab'
    Parameters = <>
    Left = 712
    Top = 248
  end
  object dsourceItemLab: TDataSource
    DataSet = dsetItemLab
    Left = 168
    Top = 464
  end
  object dsetGroupLab: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tagrouplab'
    Parameters = <>
    Left = 712
    Top = 312
  end
  object dsetLab: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from talab'#13#10'ORDER BY lbtglPeriksa asc'
    Parameters = <>
    Left = 640
    Top = 304
  end
  object dsourceLab: TDataSource
    DataSet = dsetLab
    Left = 224
    Top = 528
  end
  object dsetLabDetail: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from talabdetail'
    Parameters = <>
    Left = 632
    Top = 360
  end
  object dsourceLabDetail: TDataSource
    DataSet = dsetLabDetail
    Left = 64
    Top = 528
  end
  object dsetRontgen: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tarontgen'
    Parameters = <>
    Left = 640
    Top = 416
  end
  object dsourceRontgen: TDataSource
    DataSet = dsetRontgen
    Left = 224
    Top = 472
  end
  object dsetKaryawan: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dsetKaryawanBeforeOpen
    CommandText = 'select * from takaryawan'
    Parameters = <>
    Left = 640
    Top = 16
  end
  object dsetresetkamar: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from takamar'
    Parameters = <>
    Left = 400
    Top = 464
    object dsetresetkamarkaKode: TStringField
      DisplayLabel = 'Kode Kamar'
      FieldName = 'kaKode'
      FixedChar = True
      Size = 50
    end
    object dsetresetkamarkaNama: TStringField
      DisplayLabel = 'Nama Kamar'
      FieldName = 'kaNama'
      FixedChar = True
      Size = 100
    end
    object dsetresetkamarkaFasilitas: TStringField
      DisplayLabel = 'Fasilitas'
      FieldName = 'kaFasilitas'
      FixedChar = True
      Size = 100
    end
    object dsetresetkamarkaJmlBed: TIntegerField
      DisplayLabel = 'Jml Bed'
      FieldName = 'kaJmlBed'
    end
    object dsetresetkamarkaRate: TIntegerField
      DisplayLabel = 'Rate/Tarif (Rp)'
      FieldName = 'kaRate'
    end
    object dsetresetkamarkaBedStok: TIntegerField
      DisplayLabel = 'Bed Yang Tersedia'
      FieldName = 'kaBedStok'
    end
    object dsetresetkamarkaKeterangan: TIntegerField
      DisplayLabel = 'Keterangan'
      FieldName = 'kaKeterangan'
    end
  end
  object dsetPerujuk: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tadokterrujuk'
    Parameters = <>
    Left = 704
    Top = 368
  end
  object dsourcePerujuk: TDataSource
    DataSet = dsetPerujuk
    Left = 144
    Top = 528
  end
  object dsetLayananRontgen: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from talayananrontgen'
    Parameters = <>
    Left = 864
    Top = 448
  end
  object dsourceLayananRontgen: TDataSource
    DataSet = dsetLayananRontgen
    Left = 64
    Top = 584
  end
  object qrUpdateRontgen: TADOQuery
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from talayananrontgen')
    Left = 456
    Top = 480
  end
  object dsetViewDokter: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 
      'select * from tadokter,tatarifdokter'#13#10'where tdkodedokter like dk' +
      'kodedokter'
    Parameters = <>
    Left = 800
    Top = 488
  end
  object dsourceViewDokter: TDataSource
    DataSet = dsetViewDokter
    Left = 64
    Top = 632
  end
  object dsetAdministrasi: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from taadministrasi'
    Parameters = <>
    Left = 648
    Top = 552
  end
  object dsourceAdministrasi: TDataSource
    DataSet = dsetAdministrasi
    Left = 168
    Top = 576
  end
  object dsetAlkes: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from taalkes'
    Parameters = <>
    Left = 552
    Top = 472
  end
  object dsourceAlkes: TDataSource
    DataSet = dsetAlkes
    Left = 240
    Top = 584
  end
  object dsetViewKamarDetail: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 'select * from takamar,takamardetail'#13#10'where kdkamar like kakode'
    Parameters = <>
    Left = 456
    Top = 544
  end
  object dsetRptKamarDetail: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 'select * from takamardetail,takamar'#13#10'where kakode like kdkamar'
    Parameters = <>
    Left = 872
    Top = 616
  end
  object dsetPasienKeluar: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 
      'select * from  tarawatinap,tapasien'#13#10'where psKodePasien LIKE inN' +
      'oRM'#13#10
    Parameters = <>
    Left = 552
    Top = 600
  end
  object dsourcepasienkeluar: TDataSource
    DataSet = dsetPasienKeluar
    Left = 168
    Top = 632
  end
  object dsetViewPasienPoli: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from talayananpoli'
    Parameters = <>
    Left = 504
    Top = 288
    object dsetViewPasienPolilpTgl: TDateField
      FieldName = 'lpTgl'
    end
    object dsetViewPasienPolilpNoReg: TStringField
      FieldName = 'lpNoReg'
      FixedChar = True
      Size = 100
    end
    object dsetViewPasienPolilpKodeDokter: TStringField
      FieldName = 'lpKodeDokter'
      FixedChar = True
      Size = 50
    end
    object dsetViewPasienPolilpKodePasien: TStringField
      FieldName = 'lpKodePasien'
      FixedChar = True
      Size = 50
    end
    object dsetViewPasienPolilpKodepoli: TStringField
      FieldName = 'lpKodepoli'
      FixedChar = True
      Size = 50
    end
    object dsetViewPasienPolilpWktDaftar: TTimeField
      FieldName = 'lpWktDaftar'
    end
    object dsetViewPasienPolilpWktKonsultasi: TTimeField
      FieldName = 'lpWktKonsultasi'
    end
    object dsetViewPasienPolilpTglWktu: TDateTimeField
      FieldName = 'lpTglWktu'
    end
    object dsetViewPasienPolilpisbayar: TSmallintField
      FieldName = 'lpisbayar'
    end
    object dsetViewPasienPolilpKodeRujuk: TStringField
      FieldName = 'lpKodeRujuk'
      FixedChar = True
      Size = 50
    end
    object dsetViewPasienPolilpismigrasi: TSmallintField
      FieldName = 'lpismigrasi'
    end
    object dsetViewPasienPolilpistorawatinap: TWordField
      FieldName = 'lpistorawatinap'
    end
    object dsetViewPasienPolilpkoderawatinap: TStringField
      FieldName = 'lpkoderawatinap'
      FixedChar = True
      Size = 50
    end
    object dsetViewPasienPolilpatasnama: TStringField
      FieldName = 'lpatasnama'
      Size = 300
    end
    object dsetViewPasienPolilpkonsuldokter: TFloatField
      FieldName = 'lpkonsuldokter'
    end
    object dsetViewPasienPolilppic: TStringField
      FieldName = 'lppic'
      FixedChar = True
      Size = 50
    end
    object dsetViewPasienPolilpisperiksaonly: TWordField
      FieldName = 'lpisperiksaonly'
    end
    object dsetViewPasienPolilpisdiagnosa: TWordField
      FieldName = 'lpisdiagnosa'
    end
    object dsetViewPasienPoliusia: TStringField
      FieldKind = fkLookup
      FieldName = 'usia'
      LookupDataSet = dSetPasien
      LookupKeyFields = 'psid'
      LookupResultField = 'usia'
      KeyFields = 'lpKodePasien'
      Size = 10
      Lookup = True
    end
    object dsetViewPasienPolipsnama: TStringField
      FieldKind = fkLookup
      FieldName = 'psnama'
      LookupDataSet = dSetPasien
      LookupKeyFields = 'psNama'
      LookupResultField = 'psNama'
      KeyFields = 'lpKodePasien'
      Size = 10
      Lookup = True
    end
  end
  object dsourceViewPasienPoli: TDataSource
    DataSet = dsetViewPasienPoli
    Left = 24
    Top = 144
  end
  object dsetApotikDEtail: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dsetApotikDEtailBeforeOpen
    AfterOpen = dsetApotikDEtailAfterOpen
    BeforeEdit = dsetApotikDEtailBeforeEdit
    BeforePost = dsetApotikDEtailBeforePost
    BeforeDelete = dsetApotikDEtailBeforeDelete
    CommandText = 'select * from taapotikdetail'#13#10'ORDER BY ad_idx DESC'#13#10'LIMIT 10'
    DataSource = dsourceApotik
    IndexFieldNames = 'adKodeApotik'
    MasterFields = 'apKodeApotik'
    Parameters = <>
    Left = 432
    Top = 136
  end
  object dsetTarifDokter: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tatarifdokter'
    DataSource = dsourceDokter
    IndexFieldNames = 'tdkodedokter'
    MasterFields = 'dkKodeDokter'
    Parameters = <>
    Left = 864
    Top = 128
  end
  object dsourcetarifdokter: TDataSource
    DataSet = dsetTarifDokter
    Left = 272
    Top = 528
  end
  object dsetRptLayananPoli: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 'select * from talayananpoli'#13#10'ORDER BY lpNoReg ASC'
    Parameters = <>
    Left = 640
    Top = 192
  end
  object dsetpersenadmin: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    BeforeOpen = dsetpersenadminBeforeOpen
    CommandText = 'select * from tarawatinap'
    Parameters = <>
    Left = 384
    Top = 8
  end
  object dsetdokter: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tadokter'
    Parameters = <>
    Left = 712
    Top = 72
  end
  object dsettempobat: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tatemp'
    Parameters = <>
    Left = 784
    Top = 144
  end
  object dsetviewmigrasi: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dsetviewmigrasiBeforeOpen
    AfterOpen = dsetviewmigrasiAfterOpen
    CommandText = 
      'select talayananpoli.lpNoReg, tadokter.dkNama, tapasien.psNama,t' +
      'apasien.pskodepasien,tapasien.psalamat,tapasien.psbulan,tapasien' +
      '.usia'#13#10'from talayananpoli'#13#10'inner join tadokter on (tadokter.dkKo' +
      'deDokter = talayananpoli.lpKodeDokter)'#13#10'inner join tapasien on (' +
      'tapasien.psKodePasien = talayananpoli.lpKodePasien)'#13#10'where lpism' +
      'igrasi=1'#13#10'and lpistorawatinap=0'#13#10'and lpisbayar=0'#13#10#13#10
    Parameters = <>
    Left = 632
    Top = 616
  end
  object dsourceviewmigrasi: TDataSource
    DataSet = dsetviewmigrasi
    Left = 264
    Top = 640
  end
  object dsettambahbiayaapotik: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tatambahanapotik'
    Parameters = <>
    Left = 784
    Top = 200
  end
  object dsourcetambahbiayaapotik: TDataSource
    DataSet = dsettambahbiayaapotik
    Left = 312
    Top = 232
  end
  object dsetadmpoli: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dsetadmpoliBeforeOpen
    AfterOpen = dsetadmpoliAfterOpen
    CommandText = 'select * from taadmpoli'
    Parameters = <>
    Left = 776
    Top = 16
  end
  object dsourceadmpoli: TDataSource
    DataSet = dsetadmpoli
    Left = 48
    Top = 72
  end
  object dsetstokopname: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tastokopname'
    Parameters = <>
    Left = 784
    Top = 256
  end
  object dsourcestokopname: TDataSource
    DataSet = dsetstokopname
    Left = 288
    Top = 176
  end
  object dsetupdatepassword: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 'select * from tauser'
    Parameters = <>
    Left = 783
    Top = 376
  end
  object dsetrptrawatinapdetail: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 'select * from tarawatinapdetail'#13#10'where idisobat <> 1'#13#10
    Parameters = <>
    Left = 808
    Top = 552
  end
  object dsetrptobat: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 'select * from tarawatinapdetail'#13#10'where idisobat=1'
    Parameters = <>
    Left = 872
    Top = 520
  end
  object dsetrptlayananrontgen: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from talayananrontgen'#13#10'where lrkoderontgen not like  '#39'%' +
      'ekg%'#39#13#10'and lrkoderontgen not like  '#39'%usg%'#39
    Parameters = <>
    Left = 456
    Top = 608
  end
  object dsetrptadministrasi: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 
      'select * from takamar, taadministrasi'#13#10'where adkelas like kakode' +
      '   '
    Parameters = <>
    Left = 720
    Top = 512
  end
  object dsetrptpolitorwtinap: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 
      'select * from talayananpoli, talayananpolidetail'#13#10'where lpnoreg ' +
      'like ldnoreg'
    Parameters = <>
    Left = 720
    Top = 576
  end
  object dsetSatuan: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tasatuanobat'
    Parameters = <>
    Left = 784
    Top = 320
  end
  object dsourceGroupLab: TDataSource
    DataSet = dsetGroupLab
    Left = 224
    Top = 408
  end
  object dsourcesatuan: TDataSource
    DataSet = dsetSatuan
    Left = 272
    Top = 408
  end
  object dsetAntrian: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 
      'select lpNoReg, lpTgl, lpKodePasien'#13#10'from talayananpoli'#13#10'where (' +
      'lptgl like curdate() or lptgl like date(curdate()-1))'#13#10'and lpisb' +
      'ayar=0'#13#10'ORDER BY lptglwktu asc'
    Parameters = <>
    Left = 624
    Top = 672
    object dsetAntrianlpNoReg: TStringField
      FieldName = 'lpNoReg'
      FixedChar = True
      Size = 100
    end
    object dsetAntrianlpTgl: TDateField
      FieldName = 'lpTgl'
    end
    object dsetAntrianlpKodePasien: TStringField
      FieldName = 'lpKodePasien'
      Visible = False
      FixedChar = True
      Size = 50
    end
    object dsetAntrianNamaPasien: TStringField
      FieldKind = fkLookup
      FieldName = 'NamaPasien'
      LookupDataSet = dSetPasien
      LookupKeyFields = 'psKodePasien'
      LookupResultField = 'psNama'
      KeyFields = 'lpKodePasien'
      Size = 150
      Lookup = True
    end
    object dsetAntrianAlamatPasien: TStringField
      FieldKind = fkLookup
      FieldName = 'AlamatPasien'
      LookupDataSet = dSetPasien
      LookupKeyFields = 'psKodePasien'
      LookupResultField = 'psAlamat'
      KeyFields = 'lpKodePasien'
      Size = 250
      Lookup = True
    end
    object dsetAntrianUsiaPasien: TStringField
      FieldKind = fkLookup
      FieldName = 'UsiaPasien'
      LookupDataSet = dSetPasien
      LookupKeyFields = 'psKodePasien'
      LookupResultField = 'usia'
      KeyFields = 'lpKodePasien'
      Lookup = True
    end
    object dsetAntrianKota: TStringField
      FieldKind = fkLookup
      FieldName = 'Kota'
      LookupDataSet = dSetPasien
      LookupKeyFields = 'psKodePasien'
      LookupResultField = 'kota'
      KeyFields = 'lpKodePasien'
      Size = 50
      Lookup = True
    end
    object dsetAntrianNoRM: TStringField
      FieldKind = fkLookup
      FieldName = 'NoRM'
      LookupDataSet = dSetPasien
      LookupKeyFields = 'psKodePasien'
      LookupResultField = 'psKodePasien'
      KeyFields = 'lpKodePasien'
      Size = 50
      Lookup = True
    end
  end
  object dsourceantrian: TDataSource
    DataSet = dsetAntrian
    Left = 192
    Top = 680
  end
  object dsetracikan: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforePost = dsetracikanBeforePost
    AfterPost = dsetracikanAfterPost
    BeforeDelete = dsetracikanBeforeDelete
    CommandText = 'select * from taracikan'
    DataSource = dsourceApotik
    IndexFieldNames = 'adKodeApotik'
    MasterFields = 'apKodeApotik'
    Parameters = <>
    Left = 512
    Top = 136
  end
  object dsourceracikan: TDataSource
    DataSet = dsetracikan
    Left = 280
    Top = 120
  end
  object dsettariflab: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tatariflab'
    Parameters = <>
    Left = 664
    Top = 80
  end
  object dsourcetariflab: TDataSource
    DataSet = dsettariflab
    Left = 296
    Top = 16
  end
  object dsetviewpasienlab: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from talab'#13#10'where lbtotal is null'
    Parameters = <>
    Left = 712
    Top = 624
  end
  object dsourceviewlab: TDataSource
    DataSet = dsetviewpasienlab
    Left = 288
    Top = 344
  end
  object dsetreglab: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dsetreglabBeforeOpen
    AfterOpen = dsetreglabAfterOpen
    BeforeDelete = dsetreglabBeforeDelete
    CommandText = 'select * from talabdetail'#13#10'where ldtotal is not null'
    DataSource = dsourceLab
    IndexFieldNames = 'ldKode'
    MasterFields = 'lbKode'
    Parameters = <>
    Left = 632
    Top = 138
  end
  object dsourcereglab: TDataSource
    DataSet = dsetreglab
    Left = 160
    Top = 296
  end
  object dsetrptlab: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from talab'
    Parameters = <>
    Left = 512
    Top = 656
  end
  object dsethasillab: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforePost = dsethasillabBeforePost
    CommandText = 'select * from talabdetail'
    Parameters = <>
    Left = 792
    Top = 432
  end
  object dsourcehasillab: TDataSource
    DataSet = dsethasillab
    Left = 24
    Top = 216
  end
  object dsetviewreglab: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from talab'#13#10
    Parameters = <>
    Left = 432
    Top = 664
  end
  object dsourceviewreglab: TDataSource
    DataSet = dsetviewreglab
    Left = 304
    Top = 592
  end
  object connKlinik: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=rinov' +
      'aintan'
    LoginPrompt = False
    Left = 16
    Top = 8
  end
  object dsetviewpasienrontgen: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from talayananrontgen'#13#10'where lrkode <> '#39'000000000'#39#13#10'and' +
      ' lrtgl = curdate()'
    Parameters = <>
    Left = 648
    Top = 480
  end
  object dsourceviewpasienrontgen: TDataSource
    DataSet = dsetviewpasienrontgen
    Left = 80
    Top = 680
  end
  object dsetsettingjam: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 
      'select * from tauser,tausergroup'#13#10'where usnamagroup like ugnamag' +
      'roup'
    Parameters = <>
    Left = 808
    Top = 608
  end
  object dsetuangkeluar: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dsetuangkeluarBeforeOpen
    CommandText = 'select * from tauangkeluar'
    Parameters = <>
    Left = 776
    Top = 16
  end
  object dsourceuangkeluar: TDataSource
    DataSet = dsetuangkeluar
    Left = 312
    Top = 64
  end
  object dsetcektarifdokter: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tatarifdokter'
    Parameters = <>
    Left = 848
    Top = 72
  end
  object dsetrawatbaby: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = dsetrawatbabyBeforeOpen
    CommandText = 'select * from tarawatbaby'
    Parameters = <>
    Left = 544
    Top = 8
  end
  object dsourcerawatbaby: TDataSource
    DataSet = dsetrawatbaby
    Left = 104
    Top = 16
  end
  object dsetcustapotik: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from taapotik'#13#10'where apnoregpasien is null'#13#10'and aptgl i' +
      's not null'
    Parameters = <>
    Left = 832
    Top = 320
  end
  object dsourcecustapotik: TDataSource
    DataSet = dsetcustapotik
    Left = 16
    Top = 272
  end
  object dsetkwitansi: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from takwitansi'
    Parameters = <>
    Left = 560
    Top = 120
  end
  object dsetviewpolidiag: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select * from talayananpoli, tapasien,tadokter'#13#10'where pskodepasi' +
      'en like lpkodepasien'#13#10'and dkkodedokter like lpkodedokter'#13#10'and lp' +
      'ismigrasi=0'#13#10'and lpisdiagnosa=0'#13#10'order by lpnoreg'
    Parameters = <>
    Left = 544
    Top = 400
  end
  object dsourceviewpolidiag: TDataSource
    DataSet = dsetviewpolidiag
    Left = 24
    Top = 353
  end
  object dsetdiagnosa: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tadiagnosa'
    Parameters = <>
    Left = 600
    Top = 336
  end
  object dsetdiagnosadetail: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tadiagnosadetail'
    DataSource = dsourcediagnosa
    IndexFieldNames = 'ddkode'
    MasterFields = 'dgkode'
    Parameters = <>
    Left = 896
    Top = 304
  end
  object dsourcediagnosa: TDataSource
    DataSet = dsetdiagnosa
    Left = 280
    Top = 456
  end
  object dsourcediagnosadetail: TDataSource
    DataSet = dsetdiagnosadetail
    Left = 328
    Top = 416
  end
  object dsetviewpenyakit: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from tajenispenyakit'
    Parameters = <>
    Left = 560
    Top = 528
  end
  object dsourceviewpenyakit: TDataSource
    DataSet = dsetviewpenyakit
    Left = 8
    Top = 408
  end
  object dsresetkamar: TDataSource
    DataSet = dsetresetkamar
    Left = 328
    Top = 512
  end
  object dsetkamar: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 'select * from takamar'
    Parameters = <>
    Left = 392
    Top = 512
  end
  object dsetmigrasi: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    CommandText = 'select * from talayananpoli'
    Parameters = <>
    Left = 360
    Top = 368
  end
  object dsetbeli: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from pembelian'
    Parameters = <>
    Left = 880
    Top = 8
    object dsetbelipb_Id: TAutoIncField
      FieldName = 'pb_Id'
      ReadOnly = True
    end
    object dsetbelipb_notransaksi: TStringField
      FieldName = 'pb_notransaksi'
      Size = 255
    end
    object dsetbelipb_tgl: TDateField
      FieldName = 'pb_tgl'
    end
    object dsetbelipb_total: TFloatField
      FieldName = 'pb_total'
    end
    object dsetbelipb_asal: TStringField
      FieldName = 'pb_asal'
      Size = 255
    end
    object dsetbelipb_nofaktur: TStringField
      FieldName = 'pb_nofaktur'
      Size = 255
    end
    object dsetbelipb_pic: TStringField
      FieldName = 'pb_pic'
      Size = 255
    end
  end
  object dsetbelidetail: TADODataSet
    Connection = connKlinik
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforePost = dsetbelidetailBeforePost
    OnNewRecord = dsetbelidetailNewRecord
    CommandText = 'select * from pembeliandetail'
    DataSource = dsbeli
    IndexFieldNames = 'pd_notransaksi'
    MasterFields = 'pb_notransaksi'
    Parameters = <>
    Left = 936
    Top = 8
    object dsetbelidetailpd_Id: TAutoIncField
      FieldName = 'pd_Id'
      ReadOnly = True
    end
    object dsetbelidetailpd_notransaksi: TStringField
      FieldName = 'pd_notransaksi'
      Size = 255
    end
    object dsetbelidetailpd_kodeobat: TStringField
      FieldName = 'pd_kodeobat'
      Size = 255
    end
    object dsetbelidetailpd_namaobat: TStringField
      FieldName = 'pd_namaobat'
      Size = 255
    end
    object dsetbelidetailpd_qty: TIntegerField
      FieldName = 'pd_qty'
    end
    object dsetbelidetailpd_total: TFloatField
      FieldName = 'pd_total'
    end
    object dsetbelidetailpd_hrga: TFloatField
      FieldName = 'pd_hrga'
    end
    object dsetbelidetailpd_tgl: TDateField
      FieldName = 'pd_tgl'
    end
    object dsetbelidetailpd_kategori: TStringField
      FieldName = 'pd_kategori'
      Size = 1
    end
  end
  object dsbeli: TDataSource
    DataSet = dsetbeli
    Left = 360
    Top = 584
  end
  object dsbelidetail: TDataSource
    DataSet = dsetbelidetail
    Left = 360
    Top = 632
  end
  object dsetuser: TADODataSet
    Connection = connKlinik
    CommandText = 'select * from tauser'
    Parameters = <>
    Left = 488
    Top = 64
  end
  object dsuser: TDataSource
    DataSet = dsetuser
    Left = 328
    Top = 120
  end
end

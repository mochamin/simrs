object pembelianfrm: Tpembelianfrm
  Left = 295
  Top = 102
  Width = 750
  Height = 577
  BorderIcons = [biSystemMenu]
  Caption = 'cpHospital'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 734
    Height = 104
    Align = alTop
    Color = clSkyBlue
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 19
      Width = 96
      Height = 18
      Caption = 'No Transaksi:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 11
      Top = 68
      Width = 60
      Height = 18
      Caption = 'Gudang:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 43
      Width = 60
      Height = 18
      Caption = 'Tanggal:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 400
      Top = 19
      Width = 102
      Height = 13
      Caption = 'Person in Charge:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 343
      Top = 67
      Width = 26
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object dbauto: TDBEdit
      Left = 106
      Top = 15
      Width = 263
      Height = 24
      DataField = 'pb_notransaksi'
      DataSource = dm.dsbeli
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dbtgl: TDBEdit
      Left = 106
      Top = 40
      Width = 263
      Height = 24
      DataField = 'pb_tgl'
      DataSource = dm.dsbeli
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object dbpic: TDBEdit
      Left = 512
      Top = 16
      Width = 156
      Height = 24
      DataField = 'pb_pic'
      DataSource = dm.dsbeli
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object pic: TEdit
      Left = 512
      Top = 42
      Width = 156
      Height = 21
      TabOrder = 4
      Visible = False
    end
    object dbgudang: TDBLookupComboBox
      Left = 106
      Top = 66
      Width = 235
      Height = 24
      DataField = 'pb_asal'
      DataSource = dm.dsbeli
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      KeyField = 'gd_id'
      ListField = 'gd_nama'
      ListSource = dmz.gudangds
      ParentFont = False
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 153
    Width = 734
    Height = 330
    Align = alClient
    TabOrder = 1
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 732
      Height = 16
      Align = alTop
      BevelOuter = bvNone
      Color = clMoneyGreen
      TabOrder = 0
    end
    object Panel7: TPanel
      Left = 1
      Top = 313
      Width = 732
      Height = 16
      Align = alBottom
      BevelOuter = bvNone
      Color = clMoneyGreen
      TabOrder = 1
    end
    object gridbeli: TDBGrid
      Left = 1
      Top = 17
      Width = 716
      Height = 296
      Align = alClient
      DataSource = dm.dsbelidetail
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEnter = gridbeliEnter
      OnKeyDown = gridbeliKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'pd_kodeobat'
          ReadOnly = True
          Title.Caption = 'Kode Obat'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -15
          Title.Font.Name = 'Arial Narrow'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pd_namaobat'
          ReadOnly = True
          Title.Caption = 'Nama Obat'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -15
          Title.Font.Name = 'Arial Narrow'
          Title.Font.Style = [fsBold]
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pd_hrga'
          Title.Caption = 'Harga Jual'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -15
          Title.Font.Name = 'Arial Narrow'
          Title.Font.Style = [fsBold]
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pd_qty'
          Title.Alignment = taCenter
          Title.Caption = 'Qty'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -15
          Title.Font.Name = 'Arial Narrow'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pd_total'
          ReadOnly = True
          Title.Caption = 'Total'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -15
          Title.Font.Name = 'Arial Narrow'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pd_kategori'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -15
          Title.Font.Name = 'Arial Narrow'
          Title.Font.Style = [fsBold]
          Visible = False
        end>
    end
    object Panel5: TPanel
      Left = 717
      Top = 17
      Width = 16
      Height = 296
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 49
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 2
  end
  object Panel8: TPanel
    Left = 0
    Top = 483
    Width = 734
    Height = 56
    Align = alBottom
    Color = clSkyBlue
    TabOrder = 3
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 57
      Height = 18
      Caption = '[Delete]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 76
      Top = 17
      Width = 100
      Height = 16
      Caption = 'Hapus Item Obat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnnew: TBitBtn
      Left = 632
      Top = 7
      Width = 82
      Height = 35
      Caption = '&New'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnnewClick
    end
    object btnsimpan: TBitBtn
      Left = 632
      Top = 8
      Width = 82
      Height = 34
      Caption = '&Simpan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = btnsimpanClick
    end
    object btnbatal: TBitBtn
      Left = 544
      Top = 8
      Width = 82
      Height = 33
      Caption = '&Batal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = btnbatalClick
    end
  end
end

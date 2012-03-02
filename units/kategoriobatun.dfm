object kategoriobatfrm: Tkategoriobatfrm
  Left = 397
  Top = 250
  Width = 399
  Height = 367
  Caption = 'cpHospital'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 383
    Height = 57
    Align = alTop
    TabOrder = 0
  end
  object kategoriobatfrm: TPanel
    Left = 0
    Top = 57
    Width = 383
    Height = 120
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 108
      Height = 18
      Caption = 'Nama Kategori:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnbatal: TBitBtn
      Left = 184
      Top = 72
      Width = 89
      Height = 33
      Caption = '&Batal'
      TabOrder = 4
      OnClick = btnbatalClick
    end
    object btnsimpan: TBitBtn
      Left = 280
      Top = 72
      Width = 89
      Height = 33
      Caption = '&Simpan'
      TabOrder = 3
      OnClick = btnsimpanClick
    end
    object dbnama: TDBEdit
      Left = 8
      Top = 32
      Width = 361
      Height = 28
      DataField = 'ko_namakategori'
      DataSource = dmz.kategorids
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btnnew: TBitBtn
      Left = 280
      Top = 72
      Width = 89
      Height = 33
      Caption = '&New'
      TabOrder = 1
      OnClick = btnnewClick
    end
    object btnedit: TBitBtn
      Left = 184
      Top = 72
      Width = 89
      Height = 33
      Caption = '&Edit'
      TabOrder = 2
      OnClick = btneditClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 177
    Width = 383
    Height = 152
    Align = alClient
    DataSource = dmz.kategorids
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ko_namakategori'
        Title.Caption = 'Kategori'
        Width = 600
        Visible = True
      end>
  end
end

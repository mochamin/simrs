object lapbrgmasukfrm: Tlapbrgmasukfrm
  Left = 462
  Top = 126
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'cpHospital'
  ClientHeight = 242
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 407
    Height = 49
    Align = alTop
    Color = clSkyBlue
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 178
      Height = 19
      Caption = 'Laporan Barang Masuk'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 407
    Height = 193
    Align = alClient
    Color = clMoneyGreen
    TabOrder = 1
    object Label2: TLabel
      Left = 239
      Top = 61
      Width = 22
      Height = 16
      Caption = 's/d:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 306
      Top = 144
      Width = 75
      Height = 33
      Caption = '&Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 226
      Top = 144
      Width = 75
      Height = 33
      Caption = '&Print'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object cbasal: TCheckBox
      Left = 18
      Top = 28
      Width = 97
      Height = 17
      Caption = 'Asal Barang:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object cbtgl: TCheckBox
      Left = 19
      Top = 63
      Width = 97
      Height = 17
      Caption = 'Tanggal:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object lookgudang: TDBLookupComboBox
      Left = 130
      Top = 26
      Width = 248
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      KeyField = 'gd_id'
      ListField = 'gd_nama'
      ListSource = dmz.gudangds
      ParentFont = False
      TabOrder = 4
    end
    object awal: TDateTimePicker
      Left = 129
      Top = 61
      Width = 97
      Height = 21
      Date = 40848.666095358800000000
      Time = 40848.666095358800000000
      TabOrder = 5
    end
    object akhir: TDateTimePicker
      Left = 276
      Top = 60
      Width = 102
      Height = 21
      Date = 40848.666095358800000000
      Time = 40848.666095358800000000
      TabOrder = 6
    end
  end
  object rplapmasuk: TRvProject
    Engine = rvlapmasuk
    Left = 24
    Top = 169
  end
  object rvlapmasuk: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 64
    Top = 169
  end
  object rdbrgmsk: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmz.lapbrgmasukdset
    Left = 104
    Top = 169
  end
  object rdbrgmskdetail: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmz.lapbrgdetail
    Left = 144
    Top = 169
  end
end

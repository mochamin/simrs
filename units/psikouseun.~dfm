object psikotopikafrm: Tpsikotopikafrm
  Left = 602
  Top = 242
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Laporan Psikotropika'
  ClientHeight = 257
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 96
    Width = 45
    Height = 18
    Caption = 'Bulan:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 136
    Width = 48
    Height = 18
    Caption = 'Tahun:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 365
    Height = 65
    Align = alTop
    TabOrder = 0
  end
  object cbbln: TComboBox
    Left = 80
    Top = 92
    Width = 265
    Height = 28
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 1
    Text = '[Klik Untuk Pilih Bulan]'
    Items.Strings = (
      'JANUARI'
      'FEBRUARI'
      'MARET'
      'APRIL'
      'MEI'
      'JUNI'
      'JULI'
      'AGUSTUS'
      'SEPTEMBER'
      'OKTOBER'
      'NOPEMBER'
      'DESEMBER')
  end
  object Edit1: TEdit
    Left = 80
    Top = 128
    Width = 262
    Height = 28
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 232
    Top = 192
    Width = 105
    Height = 41
    Caption = '&Laporan'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object rpPsikotropika: TRvProject
    Engine = RvSystem1
    ProjectFile = 'D:\cpKlinik 1.0\project\psikotropika.rav'
    Left = 40
    Top = 16
  end
  object RvDataSetConnection1: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmz.psikodset
    Left = 80
    Top = 16
  end
  object RvSystem1: TRvSystem
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
    Left = 112
    Top = 16
  end
end

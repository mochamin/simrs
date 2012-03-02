object stockopnamerptfrm: Tstockopnamerptfrm
  Left = 423
  Top = 144
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Report Stock Opname'
  ClientHeight = 210
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 127
    Top = 74
    Width = 25
    Height = 18
    Caption = 's/d:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 184
    Top = 112
    Width = 97
    Height = 41
    Caption = '&Laporan Stock'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object awal: TDateTimePicker
    Left = 9
    Top = 73
    Width = 105
    Height = 25
    Date = 40848.526414756950000000
    Time = 40848.526414756950000000
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object akhir: TDateTimePicker
    Left = 161
    Top = 73
    Width = 121
    Height = 25
    Date = 40848.526414756950000000
    Time = 40848.526414756950000000
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 295
    Height = 41
    Align = alTop
    Color = clSkyBlue
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 0
    Top = 169
    Width = 295
    Height = 41
    Align = alBottom
    Color = clSkyBlue
    TabOrder = 4
  end
  object rpStockopname: TRvProject
    Engine = restockopname
    Left = 16
    Top = 32
  end
  object restockopname: TRvSystem
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
    Top = 32
  end
  object rdrptstockopname: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmz.stockopnamedset
    Left = 112
    Top = 32
  end
end

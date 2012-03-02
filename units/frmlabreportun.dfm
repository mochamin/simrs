object frmlabreport: Tfrmlabreport
  Left = 351
  Top = 223
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'cpHospital'
  ClientHeight = 208
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 381
    Height = 49
    Align = alTop
    Caption = 'LAPORAN KEUANGAN LAB'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 381
    Height = 159
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 16
      Width = 361
      Height = 81
      Caption = ' Query Laporan '
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 24
        Height = 16
        Caption = 'Tgl:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 176
        Top = 32
        Width = 46
        Height = 16
        Caption = 's/d Tgl:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object a: TMaskEdit
        Left = 48
        Top = 32
        Width = 112
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object b: TMaskEdit
        Left = 232
        Top = 31
        Width = 112
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
      end
    end
    object BitBtn1: TBitBtn
      Left = 280
      Top = 112
      Width = 89
      Height = 33
      Caption = '&Cetak'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object rpLab: TRvProject
    Engine = rsLab
    Left = 16
    Top = 161
  end
  object rsLab: TRvSystem
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
    Left = 48
    Top = 161
  end
  object rdLab: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dml.labnew
    Left = 80
    Top = 161
  end
  object rdLabdetail: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dml.labnewdetail
    Left = 112
    Top = 161
  end
end

object gudangfrm: Tgudangfrm
  Left = 582
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gudang'
  ClientHeight = 439
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 397
    Height = 49
    Align = alTop
    Color = clSkyBlue
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 161
    Width = 397
    Height = 67
    Align = alTop
    Color = clSkyBlue
    TabOrder = 1
    object btncancel: TBitBtn
      Left = 160
      Top = 16
      Width = 97
      Height = 41
      Caption = '&Batal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btncancelClick
    end
    object btnsave: TBitBtn
      Left = 272
      Top = 16
      Width = 97
      Height = 41
      Caption = '&Simpan'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnsaveClick
    end
    object btnnew: TBitBtn
      Left = 272
      Top = 16
      Width = 97
      Height = 41
      Caption = '&New'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnnewClick
    end
    object btnedit: TBitBtn
      Left = 160
      Top = 16
      Width = 97
      Height = 41
      Caption = '&Edit'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btneditClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 397
    Height = 112
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 2
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 67
      Height = 19
      Caption = 'Gudang:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 32
      Top = 40
      Width = 337
      Height = 26
      DataField = 'gd_nama'
      DataSource = dmz.gudangds
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = DBEdit1Change
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 228
    Width = 397
    Height = 211
    Align = alClient
    Color = clMoneyGreen
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 395
      Height = 209
      Align = alClient
      DataSource = dmz.gudangds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'gd_nama'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Nama Gudang'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 450
          Visible = True
        end>
    end
  end
end

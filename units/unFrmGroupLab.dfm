object frmGroupLab: TfrmGroupLab
  Left = 401
  Top = 124
  Width = 395
  Height = 480
  Caption = 'cpHospital'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = -1
    Top = -2
    Width = 387
    Height = 57
    Caption = 'Group Lab'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = -1
    Top = 56
    Width = 387
    Height = 173
    TabOrder = 1
    object gbInput: TGroupBox
      Left = 14
      Top = 8
      Width = 359
      Height = 89
      Caption = ' Input Data '
      Enabled = False
      TabOrder = 0
      object Label2: TLabel
        Left = 19
        Top = 53
        Width = 41
        Height = 13
        Caption = 'Nama:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbNama: TDBEdit
        Left = 99
        Top = 50
        Width = 240
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'glNama'
        DataSource = dm.dsourceGroupLab
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 12
      Top = 102
      Width = 361
      Height = 54
      TabOrder = 1
      object btnNew: TBitBtn
        Left = 264
        Top = 16
        Width = 75
        Height = 25
        Caption = '&New'
        TabOrder = 0
        OnClick = btnNewClick
      end
      object btnEdit: TBitBtn
        Left = 184
        Top = 16
        Width = 75
        Height = 25
        Caption = '&Edit'
        TabOrder = 1
        OnClick = btnEditClick
      end
      object btnSave: TBitBtn
        Left = 265
        Top = 16
        Width = 73
        Height = 25
        Caption = '&Save'
        TabOrder = 2
        Visible = False
        OnClick = btnSaveClick
      end
      object btnCancel: TBitBtn
        Left = 185
        Top = 16
        Width = 73
        Height = 25
        Caption = '&Cancel'
        TabOrder = 3
        Visible = False
        OnClick = btnCancelClick
      end
    end
  end
  object Panel3: TPanel
    Left = -1
    Top = 232
    Width = 386
    Height = 201
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 369
      Height = 185
      Caption = ' View Data '
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 8
        Top = 24
        Width = 353
        Height = 153
        DataSource = dm.dsourceGroupLab
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'glNama'
            Title.Caption = 'Nama Group'
            Width = 330
            Visible = True
          end>
      end
    end
  end
end

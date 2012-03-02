object frmPerujuk: TfrmPerujuk
  Left = 347
  Top = 112
  Width = 383
  Height = 548
  Caption = 'cpHospital'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = -8
    Width = 375
    Height = 65
    Caption = 'Perujuk'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = -1
    Top = 60
    Width = 375
    Height = 453
    TabOrder = 1
    object gbInputData: TGroupBox
      Left = 13
      Top = 10
      Width = 350
      Height = 119
      Caption = ' Input Data '
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 32
        Width = 36
        Height = 13
        Caption = 'Kode:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 9
        Top = 56
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
      object Label3: TLabel
        Left = 9
        Top = 80
        Width = 56
        Height = 13
        Caption = 'Kode RS:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbKode: TDBEdit
        Left = 74
        Top = 30
        Width = 262
        Height = 19
        Ctl3D = False
        DataField = 'duKode'
        DataSource = dm.dsourcePerujuk
        ParentCtl3D = False
        TabOrder = 0
      end
      object dbNama: TDBEdit
        Left = 74
        Top = 52
        Width = 262
        Height = 19
        Ctl3D = False
        DataField = 'duNama'
        DataSource = dm.dsourcePerujuk
        ParentCtl3D = False
        TabOrder = 1
      end
      object dbKodeRS: TDBEdit
        Left = 74
        Top = 76
        Width = 262
        Height = 19
        Ctl3D = False
        DataField = 'duKodeRS'
        DataSource = dm.dsourcePerujuk
        ParentCtl3D = False
        TabOrder = 2
      end
    end
    object gbButton: TGroupBox
      Left = 12
      Top = 132
      Width = 351
      Height = 45
      TabOrder = 1
      object btnNew: TBitBtn
        Left = 261
        Top = 13
        Width = 75
        Height = 25
        Caption = '&New'
        TabOrder = 0
        OnClick = btnNewClick
      end
      object btnEdit: TBitBtn
        Left = 183
        Top = 13
        Width = 75
        Height = 25
        Caption = '&Edit'
        TabOrder = 1
        OnClick = btnEditClick
      end
      object btnSave: TBitBtn
        Left = 261
        Top = 13
        Width = 75
        Height = 25
        Caption = '&Save'
        TabOrder = 2
        Visible = False
        OnClick = btnSaveClick
      end
      object btnCancel: TBitBtn
        Left = 183
        Top = 13
        Width = 75
        Height = 25
        Caption = '&Cancel'
        TabOrder = 3
        Visible = False
        OnClick = btnCancelClick
      end
    end
    object gbViewData: TGroupBox
      Left = 11
      Top = 188
      Width = 353
      Height = 235
      Caption = ' View Data '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label4: TLabel
        Left = 17
        Top = 24
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
      object gridViewPerujuk: TDBGrid
        Left = 11
        Top = 54
        Width = 329
        Height = 169
        Ctl3D = False
        DataSource = dm.dsourcePerujuk
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnKeyDown = gridViewPerujukKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'duKode'
            Title.Caption = 'Kode'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'duNama'
            Title.Caption = 'Nama'
            Width = 240
            Visible = True
          end>
      end
      object txtCariNama: TEdit
        Left = 65
        Top = 22
        Width = 256
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnChange = txtCariNamaChange
        OnKeyDown = txtCariNamaKeyDown
      end
    end
  end
end

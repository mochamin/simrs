object frmRumahSakit: TfrmRumahSakit
  Left = 272
  Top = 73
  Width = 475
  Height = 586
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
    Left = -1
    Top = -1
    Width = 468
    Height = 67
    Caption = 'Rumah Sakit'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = -1
    Top = 66
    Width = 468
    Height = 223
    TabOrder = 1
    object gbDataDetail: TGroupBox
      Left = 9
      Top = 5
      Width = 449
      Height = 166
      Caption = ' Data Detail '
      Enabled = False
      TabOrder = 0
      object Label2: TLabel
        Left = 15
        Top = 19
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
      object Label3: TLabel
        Left = 15
        Top = 40
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
      object Label4: TLabel
        Left = 15
        Top = 64
        Width = 50
        Height = 13
        Caption = 'Alamat:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 15
        Top = 114
        Width = 32
        Height = 13
        Caption = 'Telp:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 15
        Top = 139
        Width = 28
        Height = 13
        Caption = 'Fax:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbKode: TDBEdit
        Left = 94
        Top = 17
        Width = 337
        Height = 19
        Ctl3D = False
        DataField = 'rsKode'
        DataSource = dm.dsourceRumahSakit
        ParentCtl3D = False
        TabOrder = 0
      end
      object dbNama: TDBEdit
        Left = 94
        Top = 38
        Width = 337
        Height = 19
        Ctl3D = False
        DataField = 'rsNama'
        DataSource = dm.dsourceRumahSakit
        ParentCtl3D = False
        TabOrder = 1
      end
      object dbTelp: TDBEdit
        Left = 94
        Top = 112
        Width = 337
        Height = 19
        Ctl3D = False
        DataField = 'rsTelp'
        DataSource = dm.dsourceRumahSakit
        ParentCtl3D = False
        TabOrder = 3
      end
      object dbFax: TDBEdit
        Left = 94
        Top = 134
        Width = 337
        Height = 19
        Ctl3D = False
        DataField = 'rsFax'
        DataSource = dm.dsourceRumahSakit
        ParentCtl3D = False
        TabOrder = 4
      end
      object dbAlamat: TDBMemo
        Left = 94
        Top = 60
        Width = 337
        Height = 48
        Ctl3D = False
        DataField = 'rsAlamat'
        DataSource = dm.dsourceRumahSakit
        ParentCtl3D = False
        TabOrder = 2
      end
    end
    object gbButton: TGroupBox
      Left = 9
      Top = 173
      Width = 452
      Height = 41
      TabOrder = 1
      object btnNew: TButton
        Left = 368
        Top = 11
        Width = 75
        Height = 25
        Caption = '&New'
        TabOrder = 0
        OnClick = btnNewClick
      end
      object btnEdit: TButton
        Left = 288
        Top = 11
        Width = 75
        Height = 25
        Caption = '&Edit'
        TabOrder = 1
        OnClick = btnEditClick
      end
    end
  end
  object Panel3: TPanel
    Left = -1
    Top = 291
    Width = 468
    Height = 258
    TabOrder = 2
    object GroupBox2: TGroupBox
      Left = 8
      Top = 57
      Width = 453
      Height = 183
      Caption = ' View Data '
      TabOrder = 0
      object gridViewRumahSakit: TDBGrid
        Left = 10
        Top = 19
        Width = 434
        Height = 157
        DataSource = dm.dsourceRumahSakit
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = gridViewRumahSakitKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'rsKode'
            Title.Caption = 'Kode '
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rsNama'
            Title.Caption = 'Rumah Sakit'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rsAlamat'
            Title.Caption = 'Alamat'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rsTelp'
            Title.Caption = 'Telp.'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rsFax'
            Title.Caption = 'Fax'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end>
      end
    end
    object GroupBox3: TGroupBox
      Left = 9
      Top = 6
      Width = 451
      Height = 47
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 50
        Height = 13
        Caption = 'Cari RS:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtCari: TEdit
        Left = 65
        Top = 18
        Width = 299
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnChange = txtCariChange
      end
      object btnClear: TButton
        Left = 369
        Top = 15
        Width = 75
        Height = 25
        Caption = '&Clear'
        TabOrder = 1
        OnClick = btnClearClick
      end
    end
  end
end

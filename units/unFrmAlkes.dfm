object frmAlkes: TfrmAlkes
  Left = 331
  Top = 91
  Width = 419
  Height = 601
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
    Top = 0
    Width = 411
    Height = 65
    Caption = 'Alkes'
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
    Width = 412
    Height = 495
    TabOrder = 1
    object gbInput: TGroupBox
      Left = 16
      Top = 11
      Width = 376
      Height = 156
      Caption = ' Input Data '
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Kodeh: TLabel
        Left = 16
        Top = 34
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
      object Label1: TLabel
        Left = 16
        Top = 57
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
      object Label2: TLabel
        Left = 16
        Top = 82
        Width = 49
        Height = 13
        Caption = 'Satuan:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 105
        Width = 43
        Height = 13
        Caption = 'Harga:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbKode: TDBEdit
        Left = 96
        Top = 31
        Width = 257
        Height = 19
        Ctl3D = False
        DataField = 'akkode'
        DataSource = dm.dsourceAlkes
        ParentCtl3D = False
        TabOrder = 0
      end
      object dbNama: TDBEdit
        Left = 96
        Top = 55
        Width = 257
        Height = 19
        Ctl3D = False
        DataField = 'aknama'
        DataSource = dm.dsourceAlkes
        ParentCtl3D = False
        TabOrder = 1
      end
      object dbSatuan: TDBEdit
        Left = 96
        Top = 79
        Width = 257
        Height = 19
        Ctl3D = False
        DataField = 'aksatuan'
        DataSource = dm.dsourceAlkes
        ParentCtl3D = False
        TabOrder = 2
      end
      object dbHarga: TDBEdit
        Left = 96
        Top = 103
        Width = 257
        Height = 19
        Ctl3D = False
        DataField = 'akharga'
        DataSource = dm.dsourceAlkes
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = dbHargaKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 230
      Width = 379
      Height = 251
      Caption = ' View Data '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label4: TLabel
        Left = 16
        Top = 29
        Width = 30
        Height = 13
        Caption = 'Cari:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gridViewAlkes: TDBGrid
        Left = 16
        Top = 58
        Width = 345
        Height = 177
        DataSource = dm.dsourceAlkes
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'akkode'
            Title.Caption = 'Kode'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'aknama'
            Title.Caption = 'Nama'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'aksatuan'
            Title.Caption = 'Satuan'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'akharga'
            Title.Alignment = taRightJustify
            Title.Caption = 'Harga (Rp)'
            Visible = True
          end>
      end
      object txtCariNama: TEdit
        Left = 54
        Top = 27
        Width = 305
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnChange = txtCariNamaChange
      end
    end
    object gbButton: TGroupBox
      Left = 16
      Top = 172
      Width = 378
      Height = 49
      TabOrder = 2
      object btnNew: TBitBtn
        Left = 280
        Top = 14
        Width = 75
        Height = 25
        Caption = '&New'
        TabOrder = 0
        OnClick = btnNewClick
      end
      object btnEdit: TBitBtn
        Left = 201
        Top = 14
        Width = 75
        Height = 25
        Caption = '&Edit'
        TabOrder = 1
        OnClick = btnEditClick
      end
      object btnSave: TBitBtn
        Left = 280
        Top = 14
        Width = 75
        Height = 25
        Caption = '&Save'
        TabOrder = 2
        Visible = False
        OnClick = btnSaveClick
      end
      object btnCancel: TBitBtn
        Left = 201
        Top = 14
        Width = 75
        Height = 25
        Caption = '&Cancel'
        TabOrder = 3
        Visible = False
        OnClick = btnCancelClick
      end
    end
  end
end

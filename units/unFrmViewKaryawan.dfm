object frmViewKaryawan: TfrmViewKaryawan
  Left = 255
  Top = 78
  Width = 580
  Height = 660
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = -8
    Top = 0
    Width = 578
    Height = 69
    Caption = 'View Karyawan'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 72
    Width = 569
    Height = 521
    TabOrder = 1
    object Bevel1: TBevel
      Left = 16
      Top = 480
      Width = 537
      Height = 33
      Shape = bsFrame
    end
    object Label2: TLabel
      Left = 24
      Top = 488
      Width = 47
      Height = 13
      Caption = 'F2|Edit'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 88
      Top = 488
      Width = 78
      Height = 13
      Caption = 'F5|Tambah '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 184
      Top = 488
      Width = 76
      Height = 13
      Caption = 'F6|Refresh '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 272
      Top = 488
      Width = 88
      Height = 13
      Caption = 'Delete|Hapus'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 16
      Width = 537
      Height = 65
      Caption = ' Cari Data '
      TabOrder = 0
      object Label1: TLabel
        Left = 88
        Top = 26
        Width = 41
        Height = 14
        Caption = 'Nama:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object txtCariNama: TEdit
        Left = 136
        Top = 24
        Width = 257
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnKeyDown = txtCariNamaKeyDown
      end
      object BitBtn1: TBitBtn
        Left = 400
        Top = 21
        Width = 75
        Height = 25
        Caption = '&Clear'
        TabOrder = 1
        OnClick = BitBtn1Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 88
      Width = 537
      Height = 385
      Caption = ' Data View  '
      TabOrder = 1
      object gridViewKaryawan: TDBGrid
        Left = 16
        Top = 24
        Width = 505
        Height = 345
        Ctl3D = False
        DataSource = dm.dSourceKaryawan
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = gridViewKaryawanKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'krKodeKaryawan'
            Title.Caption = 'Kode Karyawan'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'krNama'
            Title.Caption = 'Nama'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'krHP'
            Title.Caption = 'Handphone'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'krTelp'
            Title.Caption = 'Telp.'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'krAlamat'
            Title.Caption = 'Alamat'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'krKodePos'
            Title.Caption = 'Kode Pos'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 75
            Visible = True
          end>
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 601
    Width = 572
    Height = 25
    Panels = <>
  end
end

object frmAddKaryawan: TfrmAddKaryawan
  Left = 357
  Top = 46
  Width = 553
  Height = 667
  BorderIcons = [biSystemMenu]
  Caption = 'cpHospital'
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
    Width = 545
    Height = 69
    Caption = 'TAMBAH KARYAWAN'
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 72
    Width = 545
    Height = 505
    TabOrder = 1
    object Label1: TLabel
      Left = 60
      Top = 40
      Width = 63
      Height = 28
      Caption = 'Kode Karyawan'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label2: TLabel
      Left = 60
      Top = 98
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
    object Label3: TLabel
      Left = 60
      Top = 124
      Width = 89
      Height = 14
      Caption = 'Jenis Kelamin:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 60
      Top = 150
      Width = 87
      Height = 14
      Caption = 'Tempat Lahir:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 60
      Top = 178
      Width = 58
      Height = 14
      Caption = 'Tgl Lahir:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 60
      Top = 252
      Width = 73
      Height = 28
      Caption = 'Pendidikan Terakhir:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label7: TLabel
      Left = 60
      Top = 204
      Width = 48
      Height = 14
      Caption = 'Alamat:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 60
      Top = 227
      Width = 64
      Height = 14
      Caption = 'Kode Pos:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 60
      Top = 298
      Width = 31
      Height = 14
      Caption = 'Telp:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 60
      Top = 319
      Width = 78
      Height = 14
      Caption = 'Handphone:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 280
      Top = 18
      Width = 96
      Height = 14
      Caption = 'Tgl Bergabung:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 60
      Top = 20
      Width = 23
      Height = 14
      Caption = 'Tgl:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 60
      Top = 74
      Width = 46
      Height = 14
      Caption = 'Status:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 352
      Width = 505
      Height = 145
      Caption = ' Gaji dan Tunjangan (Rp)  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      object Label13: TLabel
        Left = 8
        Top = 24
        Width = 71
        Height = 14
        Caption = 'Gaji Pokok:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 8
        Top = 80
        Width = 67
        Height = 28
        Caption = 'Tunjangan Makan:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label15: TLabel
        Left = 8
        Top = 48
        Width = 67
        Height = 28
        Caption = 'Tunjangan Transport:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label16: TLabel
        Left = 244
        Top = 18
        Width = 69
        Height = 28
        Caption = 'Tunjangan Kehadiran:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label17: TLabel
        Left = 244
        Top = 52
        Width = 58
        Height = 14
        Caption = 'Lain-lain:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label18: TLabel
        Left = 246
        Top = 104
        Width = 54
        Height = 14
        Caption = 'Tax (%):'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 244
        Top = 76
        Width = 79
        Height = 14
        Caption = 'Keterangan:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object txtGajiPokok: TEdit
        Left = 94
        Top = 23
        Width = 121
        Height = 19
        BiDiMode = bdLeftToRight
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBiDiMode = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = '0'
      end
      object txtTunjanganTransport: TEdit
        Left = 94
        Top = 53
        Width = 121
        Height = 19
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        Text = '0'
      end
      object txtTunjanganHadir: TEdit
        Left = 328
        Top = 23
        Width = 121
        Height = 19
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        Text = '0'
      end
      object txtTunjanganLain: TEdit
        Left = 328
        Top = 49
        Width = 121
        Height = 19
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        Text = '0'
      end
      object txtTunjanganMakan: TEdit
        Left = 94
        Top = 85
        Width = 121
        Height = 19
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Text = '0'
      end
      object txtTAx: TEdit
        Left = 328
        Top = 101
        Width = 41
        Height = 19
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        Text = '0'
      end
      object txtKeterangan: TEdit
        Left = 328
        Top = 73
        Width = 161
        Height = 19
        Ctl3D = False
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
    end
    object txtKodeKaryawan: TEdit
      Left = 156
      Top = 48
      Width = 337
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object dtTgl: TDateTimePicker
      Left = 156
      Top = 16
      Width = 105
      Height = 21
      Date = 39426.414561354170000000
      Time = 39426.414561354170000000
      TabOrder = 0
    end
    object txtNama: TEdit
      Left = 156
      Top = 96
      Width = 337
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object txtJenisKelamin: TComboBox
      Left = 156
      Top = 121
      Width = 106
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 5
      Items.Strings = (
        'LAKI-LAKI'
        'PEREMPUAN')
    end
    object txtTempatLahir: TEdit
      Left = 156
      Top = 149
      Width = 337
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object dtTglLahir: TDateTimePicker
      Left = 156
      Top = 174
      Width = 106
      Height = 21
      Date = 39426.414561354170000000
      Time = 39426.414561354170000000
      TabOrder = 7
    end
    object txtAlamat: TEdit
      Left = 156
      Top = 201
      Width = 337
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 8
    end
    object txtKodePos: TEdit
      Left = 156
      Top = 226
      Width = 107
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
    end
    object txtPendidikanTerakhir: TEdit
      Left = 156
      Top = 255
      Width = 337
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 10
    end
    object txtTelp: TEdit
      Left = 156
      Top = 294
      Width = 337
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 11
    end
    object dtTglGabung: TDateTimePicker
      Left = 380
      Top = 16
      Width = 113
      Height = 21
      Date = 39426.414561354170000000
      Time = 39426.414561354170000000
      TabOrder = 1
    end
    object txtHp: TEdit
      Left = 156
      Top = 318
      Width = 337
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 12
    end
    object txtStatus: TEdit
      Left = 156
      Top = 72
      Width = 337
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 580
    Width = 545
    Height = 53
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 376
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Cancel'
      TabOrder = 0
    end
    object btnSave: TBitBtn
      Left = 456
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Save'
      TabOrder = 1
      OnClick = btnSaveClick
    end
  end
end

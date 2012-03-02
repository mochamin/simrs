object frmBillingRawatInap: TfrmBillingRawatInap
  Left = 195
  Top = 141
  Width = 714
  Height = 722
  Caption = 'cpKlinik'
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
    Top = -1
    Width = 705
    Height = 82
    Caption = 'Pasien Rawat Inap'
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
    Top = 82
    Width = 706
    Height = 605
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 24
      Top = 279
      Width = 665
      Height = 313
      Caption = ' Data View '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object gridRawatInap: TDBGrid
        Left = 16
        Top = 80
        Width = 633
        Height = 217
        DataSource = dmrpt.dsRptRawatInap
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'psNama'
            Title.Caption = 'Nama Pasien'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'inNoRM'
            Title.Caption = 'No.RM'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'inTglMasuk'
            Title.Caption = 'Tgl Masuk'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'inJamMasuk'
            Title.Caption = 'Jam Masuk'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'inPenanggungjawab'
            Title.Caption = 'Penanggung Jawab'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'inKekerabatan'
            Title.Caption = 'Hub Keluarga'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'inDeposit'
            Title.Caption = 'Depost (Rp)'
            Visible = True
          end>
      end
      object GroupBox5: TGroupBox
        Left = 16
        Top = 15
        Width = 633
        Height = 50
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 21
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
          Left = 272
          Top = 22
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
        object txtCariNama: TEdit
          Left = 55
          Top = 19
          Width = 194
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          OnChange = txtCariNamaChange
        end
        object txtCariAlamat: TEdit
          Left = 332
          Top = 19
          Width = 209
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
        end
        object btnClear: TBitBtn
          Left = 548
          Top = 16
          Width = 75
          Height = 25
          Caption = '&Clear'
          TabOrder = 2
          OnClick = btnClearClick
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 385
      Top = 200
      Width = 303
      Height = 73
      TabOrder = 1
      object billingsementara: TBitBtn
        Left = 161
        Top = 40
        Width = 132
        Height = 25
        Caption = '&Billing Sementara'
        TabOrder = 0
        OnClick = billingsementaraClick
      end
      object BitBtn2: TBitBtn
        Left = 161
        Top = 11
        Width = 132
        Height = 25
        Caption = '&Refresh/Update'
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object BitBtn3: TBitBtn
        Left = 8
        Top = 40
        Width = 145
        Height = 25
        Caption = 'Set Pasien &Keluar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Left = 8
        Top = 12
        Width = 145
        Height = 26
        Caption = '&Setting Manual Jam'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BitBtn4Click
      end
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 8
      Width = 353
      Height = 265
      Caption = ' Data Pribadi '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 43
        Height = 13
        Caption = 'No.RM:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 39
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
      object Label5: TLabel
        Left = 16
        Top = 60
        Width = 32
        Height = 13
        Caption = 'Usia:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 16
        Top = 80
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
      object Label7: TLabel
        Left = 16
        Top = 145
        Width = 53
        Height = 13
        Caption = 'No Telp:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 16
        Top = 186
        Width = 88
        Height = 26
        Caption = 'Penanggung  Jawab:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label9: TLabel
        Left = 16
        Top = 218
        Width = 62
        Height = 26
        Caption = 'Hub. Keluarga:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label10: TLabel
        Left = 16
        Top = 164
        Width = 77
        Height = 13
        Caption = 'Handphone:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbNoRM: TDBEdit
        Left = 102
        Top = 16
        Width = 241
        Height = 19
        Ctl3D = False
        DataField = 'inNoRM'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnKeyPress = dbNoRMKeyPress
      end
      object dbNama: TDBEdit
        Left = 102
        Top = 37
        Width = 241
        Height = 19
        Ctl3D = False
        DataField = 'psNama'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnKeyPress = dbNamaKeyPress
      end
      object DBEdit3: TDBEdit
        Left = 102
        Top = 58
        Width = 241
        Height = 19
        Ctl3D = False
        DataField = 'usia'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnKeyPress = DBEdit3KeyPress
      end
      object DBEdit4: TDBEdit
        Left = 102
        Top = 141
        Width = 241
        Height = 19
        Ctl3D = False
        DataField = 'psTelp'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnKeyPress = DBEdit4KeyPress
      end
      object DBEdit5: TDBEdit
        Left = 102
        Top = 189
        Width = 241
        Height = 19
        Ctl3D = False
        DataField = 'inPenanggungjawab'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnKeyPress = DBEdit5KeyPress
      end
      object DBMemo1: TDBMemo
        Left = 102
        Top = 81
        Width = 241
        Height = 57
        Ctl3D = False
        DataField = 'psAlamat'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnKeyPress = DBMemo1KeyPress
      end
      object DBEdit6: TDBEdit
        Left = 102
        Top = 227
        Width = 241
        Height = 19
        Ctl3D = False
        DataField = 'inKekerabatan'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnKeyPress = DBEdit6KeyPress
      end
      object DBEdit7: TDBEdit
        Left = 102
        Top = 162
        Width = 241
        Height = 19
        Ctl3D = False
        DataField = 'psHP'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnKeyPress = DBEdit7KeyPress
      end
    end
    object GroupBox3: TGroupBox
      Left = 384
      Top = 8
      Width = 305
      Height = 191
      Caption = ' Medical Record  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label11: TLabel
        Left = 16
        Top = 46
        Width = 49
        Height = 13
        Caption = 'No Reg:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 16
        Top = 70
        Width = 69
        Height = 13
        Caption = 'Tgl Masuk:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 16
        Top = 118
        Width = 70
        Height = 13
        Caption = 'Tgl Keluar:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 16
        Top = 22
        Width = 79
        Height = 13
        Caption = 'Tipe Pasien:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 16
        Top = 94
        Width = 75
        Height = 13
        Caption = 'Jam Masuk:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 16
        Top = 143
        Width = 76
        Height = 13
        Caption = 'Jam Keluar:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbjamkeluar: TDBEdit
        Left = 112
        Top = 140
        Width = 177
        Height = 19
        Ctl3D = False
        DataField = 'inJamKeluar'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnKeyPress = DBEdit6KeyPress
      end
      object DBEdit1: TDBEdit
        Left = 112
        Top = 116
        Width = 177
        Height = 19
        Ctl3D = False
        DataField = 'inTglKeluar'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnKeyPress = DBEdit6KeyPress
      end
      object dbTglMasuk: TDBEdit
        Left = 112
        Top = 68
        Width = 177
        Height = 19
        Ctl3D = False
        DataField = 'inTglMasuk'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnKeyPress = DBEdit6KeyPress
      end
      object dbJamMasuk: TDBEdit
        Left = 112
        Top = 92
        Width = 177
        Height = 19
        Ctl3D = False
        DataField = 'inJamMasuk'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnKeyPress = DBEdit6KeyPress
      end
      object DBEdit11: TDBEdit
        Left = 112
        Top = 20
        Width = 177
        Height = 19
        Ctl3D = False
        DataField = 'psJenisPasien'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnKeyPress = DBEdit6KeyPress
      end
      object dbNoreg: TDBEdit
        Left = 112
        Top = 44
        Width = 177
        Height = 19
        Ctl3D = False
        DataField = 'inNoReg'
        DataSource = dmrpt.dsRptRawatInap
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnKeyPress = DBEdit6KeyPress
      end
      object gbJam: TGroupBox
        Left = 14
        Top = 44
        Width = 289
        Height = 104
        Caption = ' Setting Jam '
        Color = clMoneyGreen
        ParentColor = False
        TabOrder = 4
        Visible = False
        object btnSaveJam: TButton
          Left = 184
          Top = 56
          Width = 75
          Height = 25
          Caption = '&Save'
          TabOrder = 0
          OnClick = btnSaveJamClick
        end
        object Button3: TButton
          Left = 104
          Top = 56
          Width = 75
          Height = 25
          Caption = '&Cancel'
          TabOrder = 1
          OnClick = Button3Click
        end
        object txtJamBaru: TEdit
          Left = 23
          Top = 28
          Width = 233
          Height = 21
          TabOrder = 2
        end
      end
      object gbPassword: TGroupBox
        Left = 8
        Top = 30
        Width = 305
        Height = 133
        Caption = ' Otorisasi  '
        Color = clSkyBlue
        ParentColor = False
        TabOrder = 3
        Visible = False
        object Label17: TLabel
          Left = 17
          Top = 20
          Width = 70
          Height = 13
          Caption = 'Username:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 17
          Top = 61
          Width = 66
          Height = 13
          Caption = 'Password:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object txtusername: TEdit
          Left = 17
          Top = 38
          Width = 273
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          OnKeyDown = txtusernameKeyDown
        end
        object txtPassword: TEdit
          Left = 17
          Top = 78
          Width = 273
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          PasswordChar = '*'
          TabOrder = 1
          OnKeyDown = txtPasswordKeyDown
        end
        object BitBtn5: TBitBtn
          Left = 200
          Top = 104
          Width = 89
          Height = 25
          Caption = '&Login'
          TabOrder = 2
          OnClick = BitBtn5Click
        end
      end
    end
  end
  object rvRawatInap: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.dsetRptRawatInap
    Left = 663
    Top = 12
  end
  object rvProjectRawatInap: TRvProject
    Left = 71
    Top = 4
  end
  object rvRawatInapDetail: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 559
    Top = 10
  end
  object rvKamarDetail: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.dsetKamarDetail
    Left = 591
    Top = 39
  end
  object rvViewObat: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 591
    Top = 7
  end
  object rvRontgen: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 631
    Top = 7
  end
  object rvAdministrasi: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.dsetAdministrasi
    Left = 631
    Top = 39
  end
  object rvProjectRawatInapSementara: TRvProject
    LoadDesigner = True
    ProjectFile = 'D:\cpSoftwares\cpKlinik ver 1.0\rawatinapsementara.rav'
    Left = 39
    Top = 4
  end
  object rvAlkes: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.dsetAlkes
    Left = 560
    Top = 39
  end
  object rvApotik: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 528
    Top = 39
  end
  object rvProjectStruk: TRvProject
    LoadDesigner = True
    ProjectFile = 'D:\cpSoftwares\cpKlinik ver 1.0\struk.rav'
    Left = 40
    Top = 39
  end
  object rvApotikdetail: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 528
    Top = 7
  end
end

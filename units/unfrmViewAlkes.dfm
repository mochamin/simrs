object frmViewAlkes: TfrmViewAlkes
  Left = 360
  Top = 197
  BorderIcons = []
  BorderStyle = bsSingle
  BorderWidth = 1
  Caption = 'Alat Kesehatan'
  ClientHeight = 206
  ClientWidth = 384
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label21: TLabel
    Left = 24
    Top = 24
    Width = 34
    Height = 13
    Caption = 'Cari :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txtCariNama: TEdit
    Left = 84
    Top = 22
    Width = 285
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    OnChange = txtCariNamaChange
    OnKeyDown = txtCariNamaKeyDown
  end
  object gridAlkes: TDBGrid
    Left = 16
    Top = 46
    Width = 361
    Height = 153
    DataSource = dm.dsourceAlkes
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = gridAlkesKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'aknama'
        Title.Caption = 'Alat Kesehatan'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aksatuan'
        Title.Caption = 'Satuan'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'akkode'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'akharga'
        Visible = False
      end>
  end
end

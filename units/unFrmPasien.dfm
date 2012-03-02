object frmPasien: TfrmPasien
  Left = 208
  Top = 173
  Width = 681
  Height = 513
  Caption = 'cpKlinik'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 673
    Height = 57
    Caption = 'LAYANAN PASIEN'
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 64
    Width = 673
    Height = 321
    TabOrder = 1
    object Button1: TButton
      Left = 208
      Top = 144
      Width = 137
      Height = 33
      Caption = 'Test Pengurangan Tgl'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object dsetTrial: TADODataSet
    Active = True
    Connection = dm.connKlinik
    CursorType = ctStatic
    CommandText = 'select * from takamardetail'
    Parameters = <>
    Left = 127
    Top = 15
  end
end

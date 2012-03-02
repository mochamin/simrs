object frmWait: TfrmWait
  Left = 360
  Top = 288
  BorderStyle = bsNone
  Caption = 'frmWait'
  ClientHeight = 75
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 506
    Height = 73
    Align = alTop
    Color = clInactiveCaption
    TabOrder = 0
    object Bevel1: TBevel
      Left = 8
      Top = 13
      Width = 465
      Height = 52
    end
    object Label1: TLabel
      Left = 33
      Top = 33
      Width = 96
      Height = 16
      Caption = 'Label1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object waktu: TTimer
    Interval = 10
    OnTimer = waktuTimer
    Left = 304
    Top = 16
  end
end

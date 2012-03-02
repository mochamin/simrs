object sellingchartfrm: Tsellingchartfrm
  Left = 162
  Top = 46
  BorderStyle = bsSingle
  Caption = 'Chart Penjualan'
  ClientHeight = 597
  ClientWidth = 916
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object jualchartdset: TZQuery
    Connection = dmz.rinoconn
    SQL.Strings = (
      
        'select  aptgl,appic as omset, sum(aptotal) as total from taapoti' +
        'k'
      'group by appic'
      'order by aptgl desc limit 10')
    Params = <>
    Left = 848
    Top = 352
  end
end

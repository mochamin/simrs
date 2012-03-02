object dml: Tdml
  OldCreateOrder = False
  Left = 455
  Top = 289
  Height = 204
  Width = 238
  object labnew: TADODataSet
    Connection = dm.connKlinik
    CursorType = ctStatic
    CommandText = 'select * from LabInput'
    Parameters = <>
    Left = 32
    Top = 16
  end
  object labnewdetail: TADODataSet
    Connection = dm.connKlinik
    CursorType = ctStatic
    CommandText = 'select * from DetailTarifLab'
    DataSource = dslabnew
    IndexFieldNames = 'NoFaktur'
    MasterFields = 'NoFaktur'
    Parameters = <>
    Left = 112
    Top = 16
    object labnewdetailNoFaktur: TStringField
      FieldName = 'NoFaktur'
      Size = 25
    end
    object labnewdetailKdBiaya: TStringField
      FieldName = 'KdBiaya'
      Size = 10
    end
    object labnewdetailKdTarif: TStringField
      FieldName = 'KdTarif'
      Size = 10
    end
    object labnewdetailNama: TStringField
      FieldName = 'Nama'
      Size = 50
    end
    object labnewdetailTarif: TFloatField
      FieldName = 'Tarif'
    end
    object labnewdetailDiskon: TFloatField
      FieldName = 'Diskon'
    end
    object labnewdetailTotal: TFloatField
      FieldName = 'Total'
      DisplayFormat = '#,###'
    end
    object labnewdetailKet: TStringField
      FieldName = 'Ket'
      Size = 50
    end
    object labnewdetailtgl: TDateField
      FieldName = 'tgl'
    end
  end
  object dslabnew: TDataSource
    DataSet = labnew
    Left = 40
    Top = 88
  end
  object dslabnewdetail: TDataSource
    DataSet = labnewdetail
    Left = 120
    Top = 88
  end
end

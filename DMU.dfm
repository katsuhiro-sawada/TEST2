object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 479
  Width = 741
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=J:\JA\JA'#20840#36786#31119#23798'\Data\'#20840 +
      #36786#31119#23798'\2020\nkpsoil.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 608
    Top = 24
  end
  object QueryRead: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select count(*) cnt  T_UKETUKE3')
    Left = 184
    Top = 376
  end
  object QueryWrite: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select count(*) cnt  T_UKETUKE3')
    Left = 600
    Top = 328
  end
  object ADOQtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select count(*) cnt  T_UKETUKE3')
    Left = 400
    Top = 176
  end
  object QueryRead2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select count(*) cnt  T_UKETUKE3')
    Left = 560
    Top = 184
  end
  object ADOTableRead: TADOTable
    Connection = ADOConnection1
    Left = 472
    Top = 112
  end
  object QAVG: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 432
    Top = 360
  end
  object TCls: TADOTable
    Connection = ADOConnection1
    Left = 368
    Top = 408
  end
  object Query1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 448
    Top = 264
  end
  object QSehi: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 320
    Top = 336
  end
  object DummyTable: TADOTable
    Connection = ADOConnection1
    TableName = 'M_CENTER'
    Left = 336
    Top = 200
  end
  object MargeTable1: TADOTable
    Connection = ADOConnection1
    Left = 248
    Top = 128
  end
  object MargeTable2: TADOTable
    Connection = ADOConnection1
    Left = 160
    Top = 136
  end
  object ADONoukyou: TADOQuery
    Connection = ADOConnectionNou
    Parameters = <>
    Left = 192
    Top = 64
  end
  object ADOConnectionNou: TADOConnection
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 608
    Top = 88
  end
  object ADOConnectionDel: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=J:\JA\JA'#20840#36786#31119#23798'\Data\'#20840 +
      #36786#31119#23798'\2020\nkpsoil.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 496
    Top = 24
  end
  object ADOYear: TADOQuery
    Connection = ADOConnectionNou
    Parameters = <>
    Left = 184
    Top = 256
  end
  object ADOQtmpDel: TADOQuery
    Connection = ADOConnectionDel
    Parameters = <>
    SQL.Strings = (
      'select count(*) cnt  T_UKETUKE3')
    Left = 360
    Top = 96
  end
  object ADOQueryRead3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select count(*) cnt  T_UKETUKE3')
    Left = 40
    Top = 256
  end
  object ADOQSakuhi: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select count(*) cnt  T_UKETUKE3')
    Left = 32
    Top = 320
  end
end

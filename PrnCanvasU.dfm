object PrintModule1: TPrintModule1
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 563
  Width = 746
  object ds1: TDataSource
    AutoEdit = False
    DataSet = ADOQueryUketuke
    OnDataChange = ds1DataChange
    Left = 632
    Top = 40
  end
  object ADOQueryUketuke: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'SELECT T_UKETUKE.*,'
      'M_HOJOU.'#36786#23478#30058#21495', M_HOJOU.'#22275#22580#21517',M_HOJOU.'#22303#22732#12467#12540#12489','
      'M_NOUKA.*,'
      'M_CITY.'#24066#30010#26449#21517', M_TIKU.'#22320#21306#21517', '
      'M_DOJOU.'#22303#22732#21517', M_DOSEI.'#22303#24615#21517', M_FUSHOKU.'#33104#26893#21517', '
      'M_sakumotu.'#20316#29289#21517', M_sakugata.'#20316#22411#21517', M_zsakumotu.'#20316#29289#21517' '#21069#20316#29289#21517
      'FROM T_UKETUKE'
      '   INNER JOIN M_HOJOU'
      '   ON  (T_UKETUKE.'#22275#22580#30058#21495' = M_HOJOU.'#22275#22580#30058#21495')'
      '   LEFT OUTER JOIN "M_SAKUMOTU.db" M_sakumotu'
      '   ON  (T_UKETUKE.'#20316#30446#12467#12540#12489' = M_sakumotu.'#20316#30446#12467#12540#12489')'
      '   AND  (T_UKETUKE.'#20316#29289#12467#12540#12489' = M_sakumotu.'#20316#29289#12467#12540#12489')'
      '   LEFT OUTER JOIN "M_SAKUGATA.db" M_sakugata'
      '   ON  (T_UKETUKE.'#20316#30446#12467#12540#12489' = M_sakugata.'#20316#30446#12467#12540#12489')'
      '   AND  (T_UKETUKE.'#20316#29289#12467#12540#12489' = M_sakugata.'#20316#29289#12467#12540#12489')'
      '   AND  (T_UKETUKE.'#20316#22411#12467#12540#12489' = M_sakugata.'#20316#22411#12467#12540#12489')'
      '   LEFT OUTER JOIN "M_SAKUMOTU.db" M_zsakumotu'
      '   ON  (T_UKETUKE.'#21069#20316#30446#12467#12540#12489' = M_zsakumotu.'#20316#30446#12467#12540#12489')'
      '   AND  (T_UKETUKE.'#21069#20316#29289#12467#12540#12489' = M_zsakumotu.'#20316#29289#12467#12540#12489')'
      '   LEFT OUTER JOIN M_DOJOU'
      '   ON  (M_HOJOU.'#22303#22732#12467#12540#12489' = M_DOJOU.'#22303#22732#12467#12540#12489')  '
      '   LEFT OUTER JOIN M_DOSEI'
      '   ON  (M_HOJOU.'#22303#24615#12467#12540#12489' = M_DOSEI.'#22303#24615#12467#12540#12489')  '
      '   LEFT OUTER JOIN M_FUSHOKU'
      '   ON  (M_HOJOU.'#33104#26893#12467#12540#12489' = M_FUSHOKU.'#33104#26893#12467#12540#12489')  '
      '   INNER JOIN M_NOUKA'
      '   ON  (M_HOJOU.'#36786#23478#30058#21495' = M_NOUKA.'#36786#23478#30058#21495')'
      '   INNER JOIN M_CITY'
      '   ON  (M_HOJOU.'#24066#30010#26449#12467#12540#12489' = M_CITY.'#24066#30010#26449#12467#12540#12489')  '
      '   INNER JOIN M_TIKU'
      '   ON  (M_HOJOU.'#24066#30010#26449#12467#12540#12489' = M_TIKU.'#24066#30010#26449#12467#12540#12489')  '
      '   AND  (M_HOJOU.'#22320#21306#12467#12540#12489' = M_TIKU.'#22320#21306#12467#12540#12489')  '
      'ORDER BY '#12469#12531#12503#12523#30058#21495)
    Left = 512
    Top = 40
  end
  object ADOQuerySindan: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds1
    Parameters = <
      item
        Name = #35430#26009'NO'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from T_SINDAN'
      'where '#35430#26009'NO=:'#35430#26009'NO')
    Left = 168
    Top = 136
  end
  object ADOQueryKijun: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds1
    ParamCheck = False
    Parameters = <>
    Left = 56
    Top = 136
  end
  object ADOQueryDokaizai: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds1
    Parameters = <
      item
        Name = #12467#12540#12489
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select '#36039#26448#21517
      'from M_DOKAIZAI'
      'where '#12467#12540#12489'=:'#12467#12540#12489)
    Left = 528
    Top = 328
  end
  object ADOQSehik: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds1
    Parameters = <
      item
        Name = #12469#12531#12503#12523#30058#21495
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select *'
      'from T_SINDAN'
      'where '#12469#12531#12503#12523#30058#21495'=:'#12469#12531#12503#12523#30058#21495)
    Left = 440
    Top = 368
  end
  object ADOQtmp: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds1
    Parameters = <
      item
        Name = #12469#12531#12503#12523#30058#21495
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select *'
      'from T_SINDAN'
      'where '#12469#12531#12503#12523#30058#21495'=:'#12469#12531#12503#12523#30058#21495)
    Left = 400
    Top = 224
  end
  object ADOQtmp2: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds1
    Parameters = <
      item
        Name = #12469#12531#12503#12523#30058#21495
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select *'
      'from T_SINDAN'
      'where '#12469#12531#12503#12523#30058#21495'=:'#12469#12531#12503#12523#30058#21495)
    Left = 392
    Top = 288
  end
  object ADOSinCom: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'T_SINCOM'
    Left = 632
    Top = 328
  end
  object ADOQTJ: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds1
    Parameters = <
      item
        Name = #12469#12531#12503#12523#30058#21495
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * From T_JCMT ORDER BY '#12467#12540#12489)
    Left = 624
    Top = 256
  end
  object ADOQTJKITA: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds1
    Parameters = <
      item
        Name = #12469#12531#12503#12523#30058#21495
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * From T_JCMTKITA ORDER BY '#12467#12540#12489)
    Left = 624
    Top = 200
  end
  object ADOK_SUI: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'K_SUI'
    Left = 104
    Top = 368
  end
  object ADOTHeikin: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds1
    ParamCheck = False
    Parameters = <>
    Left = 344
    Top = 440
  end
  object ADOQueryDokaizai2: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds1
    Parameters = <
      item
        Name = #12467#12540#12489
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select '#36039#26448#21517
      'from M_DOKAIZAI'
      'where '#12467#12540#12489'=:'#12467#12540#12489)
    Left = 512
    Top = 400
  end
  object ADOQKasei: TADOQuery
    Connection = DataModule1.ADOConnection1
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from M_KASEI6')
    Left = 56
    Top = 208
  end
  object ADOQKasei2: TADOQuery
    Connection = DataModule1.ADOConnection1
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from M_KASEI6')
    Left = 112
    Top = 224
  end
  object ADOKasei3: TADOQuery
    Connection = DataModule1.ADOConnection1
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from M_KASEI6')
    Left = 168
    Top = 232
  end
end

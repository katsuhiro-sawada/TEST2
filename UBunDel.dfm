object FBunDel: TFBunDel
  Left = 0
  Top = 0
  Caption = #35079#25968#34892#21066#38500
  ClientHeight = 614
  ClientWidth = 682
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 255
      Height = 16
      Caption = 'CTRL'#12434#25276#12375#12394#12364#12425#12487#12540#12479#34892#12434#36984#25246#12375#12414#12377#12290
    end
    object BitBtn1: TBitBtn
      Left = 416
      Top = 13
      Width = 225
      Height = 33
      Caption = #36984#25246#12375#12383#12418#12398#20840#12390#12434#21066#38500#23455#34892
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 682
    Height = 516
    Align = alClient
    DataSource = Ds1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
  end
  object Panel2: TPanel
    Left = 0
    Top = 573
    Width = 682
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 144
    ExplicitTop = 488
    ExplicitWidth = 185
    object BitBtn2: TBitBtn
      Left = 472
      Top = 6
      Width = 193
      Height = 25
      Caption = #32066#20102
      TabOrder = 0
      OnClick = BitBtn2Click
    end
  end
  object Ds1: TDataSource
    DataSet = ADOTable1
    Left = 336
    Top = 16
  end
  object ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    IndexFieldNames = #12469#12531#12503#12523#30058#21495
    TableName = 'T_UKETUKE'
    Left = 376
    Top = 16
    object ADOTable1WideStringField: TWideStringField
      FieldName = #12469#12531#12503#12523#30058#21495
      Size = 6
    end
    object ADOTable1SmallintField: TSmallintField
      DisplayLabel = #31665#30058#21495
      FieldName = #20998#26512#30058#21495
    end
    object ADOTable1WideStringField36: TWideStringField
      FieldName = #25285#24403#32773
      Size = 24
    end
    object ADOTable1WideStringField38: TWideStringField
      FieldName = #36786#23478#30058#21495
      Size = 7
    end
    object ADOTable1Field: TStringField
      FieldKind = fkLookup
      FieldName = #36786#23478#21517
      LookupDataSet = ADONouka
      LookupKeyFields = #36786#23478#30058#21495
      LookupResultField = #36786#23478#21517
      KeyFields = #36786#23478#30058#21495
      Size = 26
      Lookup = True
    end
    object ADOTable1WideStringField10: TWideStringField
      FieldName = #20316#29289#12467#12540#12489
      Size = 3
    end
    object ADOTable1Field2: TStringField
      FieldKind = fkLookup
      FieldName = #20316#29289#21517
      LookupDataSet = ADOSakumotu
      LookupKeyFields = #20316#29289#12467#12540#12489
      LookupResultField = #20316#29289#21517
      KeyFields = #20316#29289#12467#12540#12489
      Lookup = True
    end
    object ADOTable1WideStringField2: TWideStringField
      FieldName = #20316#22411#12467#12540#12489
      Size = 2
    end
    object ADOTable1WideStringField3: TWideStringField
      DisplayLabel = #20316#22411#21517
      FieldName = #20316#22411#21517'tmp'
      Size = 30
    end
    object ADOTable1WideStringField37: TWideStringField
      FieldName = #20316#29289#31278#39006#12467#12540#12489
      Size = 2
    end
    object ADOTable1Field3: TStringField
      FieldKind = fkLookup
      FieldName = #20316#29289#31278#39006
      LookupDataSet = ADOSakuSyurui
      LookupKeyFields = #12467#12540#12489
      LookupResultField = #20316#29289#31278#39006
      KeyFields = #20316#29289#31278#39006#12467#12540#12489
      Size = 6
      Lookup = True
    end
    object ADOTable1SmallintField12: TSmallintField
      FieldName = #26685#22521#26399#38291#22987
    end
    object ADOTable1SmallintField13: TSmallintField
      FieldName = #26685#22521#26399#38291#32066
    end
    object ADOTable1WideStringField39: TWideStringField
      FieldName = #22303#22732#12467#12540#12489
      Size = 3
    end
    object ADOTable1Field4: TStringField
      FieldKind = fkLookup
      FieldName = #22303#22732#21517
      LookupDataSet = ADODojyou
      LookupKeyFields = #22303#22732#12467#12540#12489
      LookupResultField = #22303#22732#21517
      KeyFields = #22303#22732#12467#12540#12489
      Lookup = True
    end
    object ADOTable1WideStringField40: TWideStringField
      FieldName = #22303#24615#12467#12540#12489
      Size = 2
    end
    object ADOTable1Field5: TStringField
      FieldKind = fkLookup
      FieldName = #22303#24615#21517
      LookupDataSet = ADODosei
      LookupKeyFields = #22303#24615#12467#12540#12489
      LookupResultField = #22303#24615#21517
      KeyFields = #22303#24615#12467#12540#12489
      Size = 12
      Lookup = True
    end
    object ADOTable1WideStringField41: TWideStringField
      FieldName = #22275#22580#21517
      Size = 30
    end
    object ADOTable1WideStringField42: TWideStringField
      FieldName = #22275#22580#20303#25152
      Size = 50
    end
  end
  object ADONouka: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_NOUKA'
    Left = 376
    Top = 144
  end
  object ADOSakumotu: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_SAKUMOTU'
    Left = 432
    Top = 144
  end
  object ADODojyou: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_DOJOU'
    Left = 488
    Top = 144
  end
  object ADODosei: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_DOSEI'
    Left = 536
    Top = 144
  end
  object ADOSakuSyurui: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_SAKUSYURUI'
    Left = 584
    Top = 144
  end
  object ADOSakuSyuruiaaaaa: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_SAKUSYURUI')
    Left = 584
    Top = 184
  end
  object ADODoseiaaaa: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_DOSEI')
    Left = 536
    Top = 184
  end
  object ADODojyouaaaa: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_DOJOU')
    Left = 488
    Top = 184
  end
end

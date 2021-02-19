inherited mstNoukaForm: TmstNoukaForm
  Left = 362
  Top = 107
  Caption = #36786#23478#12510#12473#12479
  ClientHeight = 485
  ClientWidth = 614
  OldCreateOrder = True
  ExplicitWidth = 630
  ExplicitHeight = 523
  PixelsPerInch = 96
  TextHeight = 12
  inherited Splitter1: TSplitter
    Top = 273
    Width = 614
    ExplicitTop = 273
    ExplicitWidth = 622
  end
  inherited EditPanel: TPanel
    Top = 65
    Width = 614
    Height = 208
    ExplicitTop = 65
    ExplicitWidth = 614
    ExplicitHeight = 208
    object Label1: TLabel
      Left = 60
      Top = 16
      Width = 60
      Height = 12
      Caption = #36786#23478#12467#12540#12489#65306
    end
    object Label2: TLabel
      Left = 60
      Top = 40
      Width = 30
      Height = 12
      Caption = #27663#21517#65306
    end
    object Label3: TLabel
      Left = 60
      Top = 64
      Width = 51
      Height = 12
      Caption = #27663#21517#12459#12490#65306
    end
    object Label4: TLabel
      Left = 60
      Top = 136
      Width = 30
      Height = 12
      Caption = #20303#25152#65306
    end
    object Label5: TLabel
      Left = 60
      Top = 160
      Width = 54
      Height = 12
      Caption = #38651#35441#30058#21495#65306
    end
    object Label6: TLabel
      Left = 60
      Top = 184
      Width = 28
      Height = 12
      Caption = 'FAX'#65306
    end
    object Label7: TLabel
      Left = 400
      Top = 56
      Width = 30
      Height = 12
      Caption = #36786#21332#65306
    end
    object Label8: TLabel
      Left = 400
      Top = 104
      Width = 30
      Height = 12
      Caption = #37096#20250#65306
    end
    object Label9: TLabel
      Left = 400
      Top = 80
      Width = 30
      Height = 12
      Caption = #38598#22243#65306
    end
    object Label10: TLabel
      Left = 400
      Top = 128
      Width = 30
      Height = 12
      Caption = #21306#20998#65306
    end
    object Label11: TLabel
      Left = 60
      Top = 88
      Width = 42
      Height = 12
      Caption = #24066#30010#26449#65306
      ParentShowHint = False
      ShowHint = False
    end
    object Label12: TLabel
      Left = 60
      Top = 114
      Width = 30
      Height = 12
      Caption = #22320#21306#65306
      ParentShowHint = False
      ShowHint = False
    end
    object DBEdit1: TDBEdit
      Left = 140
      Top = 12
      Width = 53
      Height = 20
      DataField = #36786#23478#30058#21495
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 140
      Top = 36
      Width = 189
      Height = 20
      DataField = #36786#23478#21517
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 140
      Top = 60
      Width = 121
      Height = 20
      DataField = #36786#23478#12459#12490
      DataSource = ds1
      ImeMode = imKata
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 140
      Top = 132
      Width = 221
      Height = 20
      DataField = #20303#25152
      DataSource = ds1
      ImeMode = imHira
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 140
      Top = 156
      Width = 121
      Height = 20
      DataField = #38651#35441#30058#21495
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 140
      Top = 180
      Width = 121
      Height = 20
      DataField = 'FAX'
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 5
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 440
      Top = 52
      Width = 145
      Height = 20
      DataField = #36786#21332#12467#12540#12489
      DataSource = ds1
      KeyField = #36786#21332#12467#12540#12489
      ListField = #36786#21332#21517
      ListSource = ds2
      TabOrder = 6
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 440
      Top = 100
      Width = 145
      Height = 20
      DataField = #37096#20250#12467#12540#12489
      DataSource = ds1
      KeyField = #37096#20250#12467#12540#12489
      ListField = #37096#20250#21517
      ListSource = ds3
      TabOrder = 7
      OnKeyPress = EnterKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 440
      Top = 76
      Width = 121
      Height = 20
      DataField = #38598#22243
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 8
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 440
      Top = 124
      Width = 65
      Height = 20
      DataField = #21306#20998
      DataSource = ds1
      KeyField = #21306#21029
      ListField = #21306#21029
      ListSource = ds4
      TabOrder = 9
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 140
      Top = 84
      Width = 145
      Height = 20
      Hint = #12475#12531#12479#12540#30331#37682#12373#12428#12390#12356#12427#24066#30010#26449#12398#12522#12473#12488
      DataField = #24066#30010#26449#12467#12540#12489
      DataSource = ds1
      KeyField = #24066#30010#26449#12467#12540#12489
      ListField = #24066#30010#26449#21517
      ListSource = ds5
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnExit = DBLookupComboBox4Exit
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 140
      Top = 110
      Width = 145
      Height = 20
      Hint = #21508#24066#30010#26449#12398#22320#21306
      DataField = #22320#21306#12467#12540#12489
      DataSource = ds1
      KeyField = #22320#21306#12467#12540#12489
      ListField = #22320#21306#21517
      ListSource = ds6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnKeyPress = EnterKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 466
    Width = 614
    ExplicitTop = 466
    ExplicitWidth = 614
  end
  inherited Panel2: TPanel
    Width = 614
    Height = 65
    ExplicitWidth = 614
    ExplicitHeight = 65
    inherited btnDel: TBitBtn
      Left = 196
      ExplicitLeft = 196
    end
    inherited btnPost: TBitBtn
      Left = 304
      ExplicitLeft = 304
    end
    inherited btnCancel: TBitBtn
      Left = 396
      ExplicitLeft = 396
    end
    inherited btnClose: TBitBtn
      Left = 488
      ExplicitLeft = 488
    end
    object btnFind: TBitBtn
      Left = 304
      Top = 36
      Width = 89
      Height = 25
      Hint = #32232#38598#12375#12383#12356#36786#23478#12434#25351#23450#12375#12414#12377
      Caption = #26908#32034'(&F)'
      DoubleBuffered = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000077777777777777777000000070000077777000007000000070B0
        00777770F0007000000070F000777770B0007000000070000000700000007000
        0000700B000000B0000070000000700F000700F0000070000000700B000700B0
        0000700000007700000000000007700000007770B00070B00077700000007770
        0000700000777000000077770007770007777000000077770B07770B07777000
        0000777700077700077770000000777777777777777770000000777777777777
        777770000000}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnFindClick
    end
  end
  inherited GridPanel: TPanel
    Top = 276
    Width = 614
    Height = 190
    ExplicitTop = 276
    ExplicitWidth = 614
    ExplicitHeight = 190
    inherited DBGrid1: TDBGrid
      Width = 614
      Height = 190
    end
  end
  inherited ds1: TDataSource
    Left = 448
    Top = 40
  end
  inherited ADOTable1: TADOTable
    TableName = 'M_NOUKA'
    Left = 520
    Top = 40
  end
  object ds2: TDataSource
    DataSet = ADOTable2
    Left = 504
    Top = 100
  end
  object ds3: TDataSource
    DataSet = ADOTable3
    Left = 504
    Top = 132
  end
  object ds4: TDataSource
    DataSet = ADOTable4
    Left = 504
    Top = 188
  end
  object ds5: TDataSource
    DataSet = QCity
    Left = 344
    Top = 124
  end
  object ds6: TDataSource
    DataSet = QTiku
    Left = 344
    Top = 172
  end
  object ADOTable2: TADOTable
    Connection = DataModule1.ADOConnection1
    AfterPost = ADOTable1AfterPost
    TableName = 'M_NOUKYOU'
    Left = 568
    Top = 64
  end
  object ADOTable3: TADOTable
    Connection = DataModule1.ADOConnection1
    AfterPost = ADOTable1AfterPost
    TableName = 'M_BUKAI'
    Left = 576
    Top = 112
  end
  object ADOTable4: TADOTable
    Connection = DataModule1.ADOConnection1
    AfterPost = ADOTable1AfterPost
    TableName = 'M_KINGAKU'
    Left = 584
    Top = 160
  end
  object QCity: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from M_CITY')
    Left = 304
    Top = 120
  end
  object QTiku: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds5
    Parameters = <
      item
        Name = #24066#30010#26449#12467#12540#12489
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select * from M_TIKU'
      'where M_TIKU.'#24066#30010#26449#12467#12540#12489' = :'#24066#30010#26449#12467#12540#12489
      '')
    Left = 304
    Top = 176
  end
end

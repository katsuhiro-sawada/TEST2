inherited mstCityForm: TmstCityForm
  Left = 252
  Top = 148
  Caption = #24066#30010#26449#12510#12473#12479
  OldCreateOrder = True
  ExplicitWidth = 631
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 12
  inherited Splitter1: TSplitter
    Top = 181
    ExplicitTop = 181
  end
  inherited EditPanel: TPanel
    Height = 140
    ExplicitWidth = 615
    ExplicitHeight = 140
    object Label1: TLabel
      Left = 56
      Top = 12
      Width = 72
      Height = 12
      Caption = #24066#30010#26449#12467#12540#12489#65306
    end
    object Label2: TLabel
      Left = 56
      Top = 36
      Width = 54
      Height = 12
      Caption = #24066#30010#26449#21517#65306
    end
    object Label3: TLabel
      Left = 56
      Top = 60
      Width = 72
      Height = 12
      Caption = #30331#37682#12475#12531#12479#12540#65306
    end
    object Label4: TLabel
      Left = 56
      Top = 88
      Width = 78
      Height = 12
      Caption = #27161#28310#22320#24111#21306#20998#65306
    end
    object Label5: TLabel
      Left = 56
      Top = 112
      Width = 78
      Height = 12
      Caption = #27700#31282#22320#24111#21306#20998#65306
    end
    object DBEdit1: TDBEdit
      Left = 140
      Top = 8
      Width = 29
      Height = 20
      DataField = #24066#30010#26449#12467#12540#12489
      DataSource = ds1
      ImeMode = imClose
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 140
      Top = 32
      Width = 157
      Height = 20
      DataField = #24066#30010#26449#21517
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 140
      Top = 56
      Width = 145
      Height = 20
      DataField = #12475#12531#12479#12540#12467#12540#12489
      DataSource = ds1
      KeyField = #12475#12531#12479#12540#12467#12540#12489
      ListField = #12475#12531#12479#12540#21517#31216
      ListSource = ds2
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 140
      Top = 84
      Width = 245
      Height = 20
      DataField = #27161#28310#22320#24111#21306#20998
      DataSource = ds1
      KeyField = #22320#24111#21306#20998#12467#12540#12489
      ListField = #22320#24111#21517
      ListSource = DataSource1
      TabOrder = 3
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 140
      Top = 108
      Width = 249
      Height = 20
      DataField = #27700#31282#22320#24111#21306#20998
      DataSource = ds1
      KeyField = #22320#24111#21306#20998#12467#12540#12489
      ListField = #22320#24111#21517
      ListSource = DataSource2
      TabOrder = 4
    end
    object BtClsCenter: TBitBtn
      Left = 296
      Top = 59
      Width = 65
      Height = 17
      Caption = #12463#12522#12450
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = BtClsCenterClick
    end
  end
  inherited StatusBar1: TStatusBar
    ExplicitWidth = 615
  end
  inherited Panel2: TPanel
    ExplicitWidth = 615
    inherited btnNew: TBitBtn
      Visible = False
    end
    inherited btnDel: TBitBtn
      Visible = False
    end
  end
  inherited GridPanel: TPanel
    Top = 184
    Height = 211
    ExplicitTop = 184
    ExplicitWidth = 615
    ExplicitHeight = 211
    inherited DBGrid1: TDBGrid
      Height = 211
    end
  end
  inherited ADOTable1: TADOTable
    TableName = 'M_CITY'
    Left = 480
  end
  object ds2: TDataSource
    DataSet = ADOTable2
    Left = 536
    Top = 116
  end
  object DataSource1: TDataSource
    DataSet = TableTitaiH
    Left = 408
    Top = 77
  end
  object DataSource2: TDataSource
    DataSet = TableTitaiS
    Left = 440
    Top = 125
  end
  object ADOTable2: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'M_CENTER'
    Left = 496
    Top = 176
  end
  object TableTitaiH: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'M_TITAI_H'
    Left = 264
    Top = 40
  end
  object TableTitaiS: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'M_TITAI_S'
    Left = 288
    Top = 192
  end
end

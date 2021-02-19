inherited mstHojouForm: TmstHojouForm
  Left = 208
  Top = 229
  Caption = #22275#22580#12510#12473#12479
  ClientHeight = 432
  ClientWidth = 632
  OldCreateOrder = True
  ExplicitWidth = 648
  ExplicitHeight = 470
  PixelsPerInch = 96
  TextHeight = 12
  inherited Splitter1: TSplitter
    Top = 241
    Width = 632
    ExplicitTop = 241
    ExplicitWidth = 640
  end
  inherited EditPanel: TPanel
    Top = 69
    Width = 632
    Height = 172
    ExplicitTop = 69
    ExplicitWidth = 632
    ExplicitHeight = 172
    object Label1: TLabel
      Left = 24
      Top = 12
      Width = 114
      Height = 12
      Caption = #22275#22580#30058#21495#65288#22320#28857#30058#21495#65289#65306
    end
    object Label2: TLabel
      Left = 84
      Top = 36
      Width = 54
      Height = 12
      Caption = #36786#23478#30058#21495#65306
    end
    object Label3: TLabel
      Left = 48
      Top = 60
      Width = 90
      Height = 12
      Caption = #22275#22580#21517#65288#22320#28857#21517#65289#65306
    end
    object Label4: TLabel
      Left = 108
      Top = 84
      Width = 30
      Height = 12
      Caption = #38754#31309#65306
    end
    object Label5: TLabel
      Left = 208
      Top = 84
      Width = 7
      Height = 12
      Caption = #65345
    end
    object Label6: TLabel
      Left = 96
      Top = 112
      Width = 42
      Height = 12
      Caption = #24066#30010#26449#65306
      ParentShowHint = False
      ShowHint = False
    end
    object Label7: TLabel
      Left = 108
      Top = 140
      Width = 30
      Height = 12
      Caption = #22320#21306#65306
      ParentShowHint = False
      ShowHint = False
    end
    object Label8: TLabel
      Left = 410
      Top = 11
      Width = 30
      Height = 12
      Caption = #22303#22732#65306
    end
    object Label9: TLabel
      Left = 410
      Top = 35
      Width = 30
      Height = 12
      Caption = #22303#24615#65306
    end
    object Label10: TLabel
      Left = 410
      Top = 59
      Width = 30
      Height = 12
      Caption = #33104#26893#65306
    end
    object DBEdit1: TDBEdit
      Left = 144
      Top = 8
      Width = 121
      Height = 20
      DataField = #22275#22580#30058#21495
      DataSource = ds1
      ImeMode = imClose
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBNouka: TDBEdit
      Left = 144
      Top = 32
      Width = 65
      Height = 20
      DataField = #36786#23478#30058#21495
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 144
      Top = 56
      Width = 121
      Height = 20
      Hint = #22275#22580#12434#21306#21029#12377#12427#21517#31216
      DataField = #22275#22580#21517
      DataSource = ds1
      ImeMode = imOpen
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 144
      Top = 80
      Width = 57
      Height = 20
      DataField = #38754#31309
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 144
      Top = 108
      Width = 145
      Height = 20
      Hint = #12475#12531#12479#12540#30331#37682#12373#12428#12390#12356#12427#24066#30010#26449#12398#12522#12473#12488
      DataField = #24066#30010#26449#12467#12540#12489
      DataSource = ds1
      KeyField = #24066#30010#26449#12467#12540#12489
      ListField = #24066#30010#26449#21517
      ListSource = ds2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnExit = DBLookupComboBox1Exit
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 144
      Top = 136
      Width = 145
      Height = 20
      Hint = #21508#24066#30010#26449#12398#22320#21306
      DataField = #22320#21306#12467#12540#12489
      DataSource = ds1
      KeyField = #22320#21306#12467#12540#12489
      ListField = #22320#21306#21517
      ListSource = ds3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnKeyPress = EnterKeyPress
    end
    object btnNouka: TButton
      Left = 216
      Top = 32
      Width = 65
      Height = 21
      Hint = #36786#23478#19968#35239#12363#12425#36984#25246#12375#12414#12377
      Caption = #36786#23478#36984#25246
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnNoukaClick
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 450
      Top = 7
      Width = 145
      Height = 20
      DataField = #22303#22732#12467#12540#12489
      DataSource = ds1
      KeyField = #22303#22732#12467#12540#12489
      ListField = #22303#22732#21517
      ListSource = ds4
      TabOrder = 7
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 450
      Top = 31
      Width = 145
      Height = 20
      DataField = #22303#24615#12467#12540#12489
      DataSource = ds1
      KeyField = #22303#24615#12467#12540#12489
      ListField = #22303#24615#21517
      ListSource = ds5
      TabOrder = 8
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 450
      Top = 55
      Width = 145
      Height = 20
      DataField = #33104#26893#12467#12540#12489
      DataSource = ds1
      KeyField = #33104#26893#12467#12540#12489
      ListField = #33104#26893#21517
      ListSource = ds6
      TabOrder = 9
      OnKeyPress = EnterKeyPress
    end
    object btnCopy: TBitBtn
      Left = 292
      Top = 8
      Width = 85
      Height = 25
      Hint = #12487#12540#12479#12434#12467#12500#12540#12375#12414#12377
      Caption = #12467#12500#12540
      DoubleBuffered = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888800008888888888888888888800008888777777778888888800008800
        00000000788888880000880BFFFBFFF0777777880000880F444444F000000078
        0000880FFBFFFBF0FBFFF0780000880F444444F04444F0780000880BFFFBFFF0
        FFFBF0780000880F444444F04444F0780000880FFBFFFBF0FBFFF0780000880F
        44F000004477F0780000880BFFF0FFF0FF0007780000880F44F0FB00F70A0778
        0000880FFBF0F0FF000A00080000880000000F470AAAAA080000888888880FFB
        000A00080000888888880000770A088800008888888888888800088800008888
        88888888888888880000}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = btnCopyClick
    end
    object BtHarituke: TBitBtn
      Left = 292
      Top = 40
      Width = 85
      Height = 25
      Hint = #12487#12540#12479#12434#36028#12426#20184#12369#12414#12377
      Caption = #36028#12426#20184#12369
      DoubleBuffered = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888800008888888888888888888800008888777777778888888800008800
        00000000788888880000880BFFFBFFF0777777880000880F444444F000000078
        0000880FFBFFFBF0FBFFF0780000880F444444F04444F0780000880BFFFBFFF0
        FFFBF0780000880F444444F04444F0780000880FFBFFFBF0FBFFF0780000880F
        44F000004477F0780000880BFFF0FFF0FF0007780000880F44F0FB00F70A0778
        0000880FFBF0F0FF000A00080000880000000F470AAAAA080000888888880FFB
        000A00080000888888880000770A088800008888888888888800088800008888
        88888888888888880000}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = BtHaritukeClick
    end
    object BtCityTiku: TButton
      Left = 295
      Top = 109
      Width = 85
      Height = 21
      Hint = #36786#23478#12510#12473#12479#12363#12425#21462#24471
      Caption = #36786#23478#12363#12425#12475#12483#12488
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = BtCityTikuClick
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 413
    Width = 632
    ExplicitTop = 413
    ExplicitWidth = 632
  end
  inherited Panel2: TPanel
    Width = 632
    Height = 69
    ExplicitWidth = 632
    ExplicitHeight = 69
    inherited btnNew: TBitBtn
      Left = 4
      ExplicitLeft = 4
    end
    inherited btnEdit: TBitBtn
      Left = 96
      ExplicitLeft = 96
    end
    inherited btnDel: TBitBtn
      Left = 188
      ExplicitLeft = 188
    end
    inherited btnPost: TBitBtn
      Left = 308
      ExplicitLeft = 308
    end
    inherited btnCancel: TBitBtn
      Left = 400
      ExplicitLeft = 400
    end
    inherited btnClose: TBitBtn
      Left = 492
      ExplicitLeft = 492
    end
    object btnFind: TBitBtn
      Left = 308
      Top = 36
      Width = 89
      Height = 25
      Hint = #25351#23450#36786#23478#12384#12369#32094#12426#36796#12415#12414#12377
      Caption = #36786#23478'(&F)'
      DoubleBuffered = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007777777777777700700000007777777777777000700000007777
        7777777700077000000077778000087000777000000077700777700007777000
        0000770870007E80777770000000780777077770877770000000707777077777
        077770000000707777077777077770000000707E70000777077770000000707E
        77077777077770000000780EE70770708777700000007708EEE0078077777000
        0000777007777007777770000000777780000877777770000000777777777777
        777770000000}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnFindClick
    end
    object ENo: TEdit
      Left = 16
      Top = 40
      Width = 121
      Height = 23
      TabOrder = 7
      Visible = False
    end
  end
  inherited GridPanel: TPanel
    Top = 244
    Width = 632
    Height = 169
    ExplicitTop = 244
    ExplicitWidth = 632
    ExplicitHeight = 169
    inherited DBGrid1: TDBGrid
      Width = 632
      Height = 169
      Columns = <
        item
          Expanded = False
          FieldName = #22275#22580#30058#21495
          Title.Caption = #22320#28857#30058#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22275#22580#21517
          Title.Caption = #22320#28857#21517
          Width = 228
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36786#23478#30058#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22303#22732#12467#12540#12489
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22303#24615#12467#12540#12489
          Visible = True
        end
        item
          Expanded = False
          FieldName = #33104#26893#12467#12540#12489
          Visible = True
        end>
    end
  end
  inherited ds1: TDataSource
    Left = 196
    Top = 244
  end
  inherited ADOTable1: TADOTable
    TableName = 'M_HOJOU'
    Left = 440
    Top = 32
  end
  object ds2: TDataSource
    AutoEdit = False
    DataSet = ADOQuery2
    Left = 284
    Top = 136
  end
  object ds3: TDataSource
    AutoEdit = False
    DataSet = ADOQuery3
    Left = 280
    Top = 280
  end
  object ds4: TDataSource
    DataSet = ADOTable2
    Left = 460
    Top = 80
  end
  object ds5: TDataSource
    DataSet = ADOTable3
    Left = 460
    Top = 112
  end
  object ds6: TDataSource
    DataSet = ADOTable4
    Left = 464
    Top = 148
  end
  object ADOTable2: TADOTable
    Connection = DataModule1.ADOConnection1
    AfterPost = ADOTable1AfterPost
    TableName = 'M_DOJOU'
    Left = 584
    Top = 152
  end
  object ADOTable3: TADOTable
    Connection = DataModule1.ADOConnection1
    AfterPost = ADOTable1AfterPost
    TableName = 'M_DOSEI'
    Left = 536
    Top = 168
  end
  object ADOTable4: TADOTable
    Connection = DataModule1.ADOConnection1
    AfterPost = ADOTable1AfterPost
    TableName = 'M_FUSHOKU'
    Left = 480
    Top = 192
  end
  object ADOQuery2: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds1
    Parameters = <>
    SQL.Strings = (
      'select * from M_CITY')
    Left = 392
    Top = 144
  end
  object ADOQuery3: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds1
    Parameters = <
      item
        Name = #24066#30010#26449#12467#12540#12489
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'elect * from M_TIKU'
      'where M_TIKU.'#24066#30010#26449#12467#12540#12489' = :'#24066#30010#26449#12467#12540#12489)
    Left = 392
    Top = 200
  end
  object QNouka: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds2
    Parameters = <
      item
        Name = #24066#30010#26449#12467#12540#12489
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'elect * from M_TIKU'
      'where M_TIKU.'#24066#30010#26449#12467#12540#12489' = :'#24066#30010#26449#12467#12540#12489)
    Left = 392
    Top = 280
  end
end

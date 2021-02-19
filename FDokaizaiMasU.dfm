inherited FDokaizaiMas: TFDokaizaiMas
  Left = 233
  Top = 154
  Caption = #22303#12388#12367#12426#32933#26009#12510#12473#12479
  ClientHeight = 450
  ClientWidth = 712
  OldCreateOrder = True
  ExplicitWidth = 728
  ExplicitHeight = 489
  PixelsPerInch = 96
  TextHeight = 12
  inherited Splitter1: TSplitter
    Top = 185
    Width = 712
    ExplicitTop = 185
    ExplicitWidth = 682
  end
  inherited EditPanel: TPanel
    Width = 712
    Height = 144
    ExplicitWidth = 712
    ExplicitHeight = 144
    object Label1: TLabel
      Left = 24
      Top = 65
      Width = 42
      Height = 12
      Caption = #36039#26448#21517#65306
    end
    object Label2: TLabel
      Left = 20
      Top = 92
      Width = 54
      Height = 12
      Caption = #12450#12523#12459#12522#20998
    end
    object Label3: TLabel
      Left = 97
      Top = 92
      Width = 31
      Height = 12
      Caption = #12522#12531#37240
    end
    object Label4: TLabel
      Left = 173
      Top = 92
      Width = 24
      Height = 12
      Caption = #33510#22303
    end
    object Label5: TLabel
      Left = 250
      Top = 92
      Width = 24
      Height = 12
      Caption = #30707#28784
    end
    object Label9: TLabel
      Left = 24
      Top = 17
      Width = 56
      Height = 12
      Caption = #36039#26448#12467#12540#12489':'
    end
    object Label6: TLabel
      Left = 327
      Top = 92
      Width = 24
      Height = 12
      Caption = #21152#37324
    end
    object Label7: TLabel
      Left = 403
      Top = 92
      Width = 33
      Height = 12
      Caption = #12465#12452#37240
    end
    object LTanka: TLabel
      Left = 626
      Top = 90
      Width = 48
      Height = 12
      Caption = #21336#20385#65288#20870#65289
    end
    object Label10: TLabel
      Left = 486
      Top = 94
      Width = 12
      Height = 12
      Caption = #37444
    end
    object DBEdit1: TDBEdit
      Left = 72
      Top = 61
      Width = 181
      Height = 20
      DataField = #36039#26448#21517
      DataSource = ds1
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 20
      Top = 108
      Width = 57
      Height = 20
      DataField = #12450#12523#12459#12522#20998
      DataSource = ds1
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 97
      Top = 110
      Width = 57
      Height = 20
      DataField = #12522#12531#37240
      DataSource = ds1
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 172
      Top = 108
      Width = 57
      Height = 20
      DataField = #33510#22303
      DataSource = ds1
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 248
      Top = 108
      Width = 57
      Height = 20
      DataField = #30707#28784
      DataSource = ds1
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object DBEdit10: TDBEdit
      Left = 86
      Top = 6
      Width = 57
      Height = 20
      DataField = #12467#12540#12489
      DataSource = ds1
      TabOrder = 5
      OnKeyPress = EnterKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 324
      Top = 108
      Width = 57
      Height = 20
      DataField = #21152#37324
      DataSource = ds1
      TabOrder = 6
      OnKeyPress = EnterKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 400
      Top = 108
      Width = 57
      Height = 20
      DataField = #12465#12452#37240
      DataSource = ds1
      TabOrder = 7
      OnKeyPress = EnterKeyPress
    end
    object DBTanka: TDBEdit
      Left = 617
      Top = 108
      Width = 57
      Height = 20
      DataField = #21336#20385
      DataSource = ds1
      TabOrder = 8
      OnKeyPress = EnterKeyPress
    end
    object DBEdit9: TDBEdit
      Left = 469
      Top = 108
      Width = 57
      Height = 20
      DataField = #37444
      DataSource = ds1
      TabOrder = 9
      OnKeyPress = EnterKeyPress
    end
    object BtSentaku: TBitBtn
      Left = 496
      Top = 59
      Width = 185
      Height = 25
      Caption = #36984#25246#23455#34892
      TabOrder = 10
      OnClick = BtSentakuClick
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 431
    Width = 712
    ExplicitTop = 431
    ExplicitWidth = 712
  end
  inherited Panel2: TPanel
    Width = 712
    ExplicitWidth = 712
  end
  inherited GridPanel: TPanel
    Top = 188
    Width = 712
    Height = 243
    ExplicitTop = 188
    ExplicitWidth = 712
    ExplicitHeight = 243
    inherited DBGrid1: TDBGrid
      Width = 712
      Height = 243
    end
  end
  inherited ds1: TDataSource
    DataSet = ADOTable2
    Left = 344
    Top = 72
  end
  object ADOTable2: TADOTable
    TableName = 'm_Dokaizai'
  end
end

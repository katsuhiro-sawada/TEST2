inherited mstSehi_HForm: TmstSehi_HForm
  Left = 181
  Top = 118
  Caption = #26045#32933#27161#28310#12510#12473#12479#65288#30033#65289
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited SelectPanel: TPanel
    Height = 108
    ExplicitHeight = 108
    object Label1: TLabel
      Left = 48
      Top = 16
      Width = 30
      Height = 12
      Caption = #20316#29289#65306
    end
    object Label2: TLabel
      Left = 48
      Top = 44
      Width = 54
      Height = 12
      Caption = #22320#24111#21306#20998#65306
    end
    object Label3: TLabel
      Left = 48
      Top = 72
      Width = 54
      Height = 12
      Caption = #22303#22732#21306#20998#65306
    end
    object ComboBox1: TComboBox
      Left = 112
      Top = 12
      Width = 145
      Height = 20
      Style = csDropDownList
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object ComboBox2: TComboBox
      Left = 112
      Top = 40
      Width = 221
      Height = 20
      Style = csDropDownList
      TabOrder = 1
      OnChange = ComboBox2Change
    end
    object ComboBox3: TComboBox
      Left = 112
      Top = 68
      Width = 145
      Height = 20
      Style = csDropDownList
      TabOrder = 2
      OnChange = ComboBox3Change
    end
    object ComboBox4: TComboBox
      Left = 344
      Top = 40
      Width = 73
      Height = 20
      Style = csDropDownList
      TabOrder = 3
      OnChange = ComboBox4Change
    end
  end
  inherited EditPanel: TPanel
    Top = 149
    Height = 225
    ExplicitTop = 155
    ExplicitHeight = 225
    object Label4: TLabel
      Left = 48
      Top = 40
      Width = 71
      Height = 12
      Caption = #22522#32933#65288'Kg/10a)'
    end
    object Label5: TLabel
      Left = 64
      Top = 112
      Width = 69
      Height = 12
      Caption = #30446#27161#21454#37327'(Kg)'
    end
    object Label6: TLabel
      Left = 164
      Top = 16
      Width = 8
      Height = 12
      Caption = 'N'
    end
    object Label7: TLabel
      Left = 232
      Top = 16
      Width = 7
      Height = 12
      Caption = 'P'
    end
    object Label8: TLabel
      Left = 296
      Top = 16
      Width = 7
      Height = 12
      Caption = 'K'
    end
    object Label9: TLabel
      Left = 364
      Top = 16
      Width = 15
      Height = 12
      Caption = 'Mg'
    end
    object Label10: TLabel
      Left = 48
      Top = 72
      Width = 71
      Height = 12
      Caption = #36861#32933#65288'Kg/10a)'
    end
    object Label11: TLabel
      Left = 64
      Top = 144
      Width = 168
      Height = 12
      Caption = #31378#32032#12398'1'#24230#12395#26045#29992#12377#12427#26368#22823#20516'(Kg)'
    end
    object Label12: TLabel
      Left = 64
      Top = 168
      Width = 72
      Height = 12
      Caption = #20998#26045#22238#25968#65288#22238#65289
    end
    object DBEdit1: TDBEdit
      Left = 140
      Top = 36
      Width = 61
      Height = 20
      DataField = 'N'
      DataSource = ds1
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 208
      Top = 36
      Width = 61
      Height = 20
      DataField = 'P'
      DataSource = ds1
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 276
      Top = 36
      Width = 61
      Height = 20
      DataField = 'K'
      DataSource = ds1
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 344
      Top = 36
      Width = 61
      Height = 20
      DataField = 'Mg'
      DataSource = ds1
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 140
      Top = 108
      Width = 61
      Height = 20
      DataField = #30446#27161#21454#37327
      DataSource = ds1
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 140
      Top = 68
      Width = 61
      Height = 20
      DataField = 'N2'
      DataSource = ds1
      TabOrder = 5
      OnKeyPress = EnterKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 208
      Top = 68
      Width = 61
      Height = 20
      DataField = 'P2'
      DataSource = ds1
      TabOrder = 6
      OnKeyPress = EnterKeyPress
    end
    object DBEdit8: TDBEdit
      Left = 276
      Top = 68
      Width = 61
      Height = 20
      DataField = 'K2'
      DataSource = ds1
      TabOrder = 7
      OnKeyPress = EnterKeyPress
    end
    object DBEdit9: TDBEdit
      Left = 344
      Top = 68
      Width = 61
      Height = 20
      DataField = 'Mg2'
      DataSource = ds1
      TabOrder = 8
      OnKeyPress = EnterKeyPress
    end
    object DBEdit10: TDBEdit
      Left = 236
      Top = 140
      Width = 61
      Height = 20
      DataField = 'NMax'
      DataSource = ds1
      TabOrder = 9
      OnKeyPress = EnterKeyPress
    end
    object DBEdit11: TDBEdit
      Left = 236
      Top = 164
      Width = 61
      Height = 20
      DataField = #20998#26045#22238#25968
      DataSource = ds1
      TabOrder = 10
      OnKeyPress = EnterKeyPress
    end
  end
  inherited ds1: TDataSource
    Left = 544
  end
  object ADOQuery1: TADOQuery [5]
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 464
    Top = 104
  end
  inherited ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'M_SEHI_H'
    Left = 464
  end
end

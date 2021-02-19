inherited mstSehi_BForm: TmstSehi_BForm
  Left = 290
  Top = 124
  Caption = #26045#32933#27161#28310#12510#12473#12479#65288#29287#33609#12289#39164#26009#65289
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited SelectPanel: TPanel
    Height = 156
    ExplicitHeight = 156
    object Label1: TLabel
      Left = 48
      Top = 44
      Width = 30
      Height = 12
      Caption = #20316#29289#65306
    end
    object Label2: TLabel
      Left = 48
      Top = 100
      Width = 54
      Height = 12
      Caption = #22320#24111#21306#20998#65306
    end
    object Label3: TLabel
      Left = 48
      Top = 128
      Width = 54
      Height = 12
      Caption = #22303#22732#21306#20998#65306
    end
    object Label10: TLabel
      Left = 48
      Top = 16
      Width = 30
      Height = 12
      Caption = #20316#30446#65306
    end
    object Label11: TLabel
      Left = 48
      Top = 72
      Width = 30
      Height = 12
      Caption = #20316#22411#65306
    end
    object ComboBox2: TComboBox
      Left = 112
      Top = 40
      Width = 145
      Height = 20
      Style = csDropDownList
      TabOrder = 1
      OnChange = ComboBox2Change
    end
    object ComboBox4: TComboBox
      Left = 112
      Top = 96
      Width = 221
      Height = 20
      Style = csDropDownList
      TabOrder = 3
      OnChange = ComboBox4Change
    end
    object ComboBox5: TComboBox
      Left = 112
      Top = 124
      Width = 145
      Height = 20
      Style = csDropDownList
      TabOrder = 4
      OnChange = ComboBox5Change
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
    object ComboBox3: TComboBox
      Left = 112
      Top = 68
      Width = 145
      Height = 20
      Style = csDropDownList
      TabOrder = 2
      OnChange = ComboBox3Change
    end
  end
  inherited EditPanel: TPanel
    Top = 197
    Height = 177
    ExplicitTop = 197
    ExplicitHeight = 177
    object Label4: TLabel
      Left = 48
      Top = 40
      Width = 83
      Height = 12
      Caption = #26045#32933#37327#65288'Kg/10a)'
    end
    object Label5: TLabel
      Left = 64
      Top = 96
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
      Top = 92
      Width = 61
      Height = 20
      DataField = #30446#27161#21454#37327
      DataSource = ds1
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
  end
  inherited ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'M_SEHI_B'
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 448
    Top = 120
  end
end

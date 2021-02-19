inherited mstSehi_SForm: TmstSehi_SForm
  Left = 241
  Top = 296
  Caption = #26045#32933#27161#28310#12510#12473#12479#65288#27700#31282#65289
  ClientWidth = 618
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited SelectPanel: TPanel
    Width = 618
    Height = 68
    ExplicitWidth = 618
    ExplicitHeight = 68
    object Label2: TLabel
      Left = 32
      Top = 16
      Width = 54
      Height = 12
      Caption = #22320#24111#21306#20998#65306
    end
    object Label3: TLabel
      Left = 32
      Top = 44
      Width = 54
      Height = 12
      Caption = #22303#22732#21306#20998#65306
    end
    object ComboBox2: TComboBox
      Left = 96
      Top = 12
      Width = 221
      Height = 20
      Style = csDropDownList
      TabOrder = 0
      OnChange = ComboBox2Change
    end
    object ComboBox3: TComboBox
      Left = 96
      Top = 40
      Width = 145
      Height = 20
      Style = csDropDownList
      TabOrder = 1
      OnChange = ComboBox3Change
    end
  end
  inherited Panel2: TPanel
    Width = 618
    ExplicitWidth = 618
  end
  inherited EditPanel: TPanel
    Top = 109
    Width = 618
    Height = 265
    ExplicitTop = 109
    ExplicitWidth = 618
    ExplicitHeight = 265
    object Bevel1: TBevel
      Left = 8
      Top = 28
      Width = 221
      Height = 69
      Shape = bsFrame
    end
    object Bevel2: TBevel
      Left = 232
      Top = 28
      Width = 149
      Height = 69
      Shape = bsFrame
    end
    object Bevel3: TBevel
      Left = 536
      Top = 28
      Width = 77
      Height = 69
      Shape = bsFrame
    end
    object Bevel4: TBevel
      Left = 384
      Top = 28
      Width = 149
      Height = 69
      Shape = bsFrame
    end
    object Label4: TLabel
      Left = 12
      Top = 12
      Width = 83
      Height = 12
      Caption = #26045#32933#37327#65288'Kg/10a)'
    end
    object Label5: TLabel
      Left = 20
      Top = 108
      Width = 69
      Height = 12
      Caption = #30446#27161#21454#37327'(Kg)'
    end
    object Label6: TLabel
      Left = 112
      Top = 12
      Width = 24
      Height = 12
      Caption = #31378#32032
    end
    object Label7: TLabel
      Left = 284
      Top = 12
      Width = 31
      Height = 12
      Caption = #12522#12531#37240
    end
    object Label8: TLabel
      Left = 444
      Top = 12
      Width = 24
      Height = 12
      Caption = #21152#37324
    end
    object Label9: TLabel
      Left = 556
      Top = 12
      Width = 24
      Height = 12
      Caption = #33510#22303
    end
    object Label1: TLabel
      Left = 20
      Top = 44
      Width = 48
      Height = 12
      Caption = #20840#23652#26045#32933
    end
    object Label10: TLabel
      Left = 116
      Top = 52
      Width = 24
      Height = 12
      Caption = #20840#23652
    end
    object Label11: TLabel
      Left = 172
      Top = 52
      Width = 24
      Height = 12
      Caption = #20596#26465
    end
    object Label12: TLabel
      Left = 300
      Top = 72
      Width = 12
      Height = 12
      Caption = #65374
    end
    object Label13: TLabel
      Left = 452
      Top = 72
      Width = 12
      Height = 12
      Caption = #65374
    end
    object Label14: TLabel
      Left = 104
      Top = 36
      Width = 114
      Height = 12
      Caption = #20840#23652#12539#20596#26465#32068#21512#12379#26045#32933
    end
    object DBEdit1: TDBEdit
      Left = 20
      Top = 68
      Width = 61
      Height = 20
      DataField = #20840#23652#26045#32933
      DataSource = ds1
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 236
      Top = 68
      Width = 61
      Height = 20
      DataField = #29136'N'
      DataSource = ds1
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 388
      Top = 68
      Width = 61
      Height = 20
      DataField = #12459#12522'N'
      DataSource = ds1
      TabOrder = 5
      OnKeyPress = EnterKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 544
      Top = 68
      Width = 61
      Height = 20
      DataField = #33510#22303
      DataSource = ds1
      TabOrder = 7
      OnKeyPress = EnterKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 96
      Top = 100
      Width = 61
      Height = 20
      DataField = #30446#27161#21454#37327
      DataSource = ds1
      TabOrder = 8
      OnKeyPress = EnterKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 96
      Top = 68
      Width = 61
      Height = 20
      DataField = #20840#20596#20840#23652#20998
      DataSource = ds1
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 160
      Top = 68
      Width = 61
      Height = 20
      DataField = #20840#20596#20596#26465#20998
      DataSource = ds1
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBEdit8: TDBEdit
      Left = 316
      Top = 68
      Width = 61
      Height = 20
      DataField = #29136'X'
      DataSource = ds1
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object DBEdit9: TDBEdit
      Left = 468
      Top = 68
      Width = 61
      Height = 20
      DataField = #12459#12522'X'
      DataSource = ds1
      TabOrder = 6
      OnKeyPress = EnterKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 618
    ExplicitWidth = 618
  end
  inherited ADOTable1: TADOTable
    Left = 424
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 344
    Top = 56
  end
end

inherited mstKijun2Form: TmstKijun2Form
  Left = 217
  Top = 245
  Caption = #22522#28310#20516#35443#32048#35373#23450
  ClientHeight = 454
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitHeight = 483
  PixelsPerInch = 96
  TextHeight = 12
  inherited StatusBar1: TStatusBar
    Top = 434
    Height = 20
    ExplicitTop = 434
    ExplicitHeight = 20
  end
  inherited Panel2: TPanel
    Height = 141
    ExplicitHeight = 141
    object Label1: TLabel [0]
      Left = 40
      Top = 12
      Width = 42
      Height = 12
      Caption = #20316#29289#21517#65306
    end
    object Label77: TLabel [1]
      Left = 40
      Top = 36
      Width = 42
      Height = 12
      Caption = #20316#22411#21517#65306
    end
    object Button1: TButton
      Left = 252
      Top = 72
      Width = 125
      Height = 25
      Hint = #20316#29289#21029#22522#28310#20516#12434#25505#29992#12375#12414#12377
      Caption = #20316#30446#22522#28310#20516#12363#12425#12467#12500#12540
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 92
      Top = 8
      Width = 145
      Height = 20
      Style = csDropDownList
      DropDownCount = 20
      TabOrder = 2
      OnChange = ComboBox1Change
    end
    object ComboBox2: TComboBox
      Left = 92
      Top = 32
      Width = 145
      Height = 20
      Style = csDropDownList
      DropDownCount = 10
      TabOrder = 3
      OnChange = ComboBox2Change
    end
    object DBCheckBox1: TDBCheckBox
      Left = 252
      Top = 36
      Width = 173
      Height = 17
      Caption = #12371#12398#22522#28310#20516#35443#32048#12434#20351#29992#12377#12427
      DataField = #20351#29992#26377#28961
      DataSource = ds1
      TabOrder = 4
    end
    object BitBtn1: TBitBtn
      Left = 396
      Top = 72
      Width = 185
      Height = 25
      Caption = #20182#12398#20316#29289#12363#12425#22522#28310#20516#12434#12467#12500#12540
      TabOrder = 6
    end
    object BitBtn2: TBitBtn
      Left = 252
      Top = 103
      Width = 329
      Height = 25
      Caption = 'CEC:0'#65374'10'#12288#12434#12288'CEC:10'#65374'20'#12289'CEC:20'#65374' '#12395#12467#12500#12540
      TabOrder = 5
      OnClick = BitBtn2Click
    end
  end
  inherited ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 392
  end
  object ADOQCopy: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 208
    Top = 88
  end
end

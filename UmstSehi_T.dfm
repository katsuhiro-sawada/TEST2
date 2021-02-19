inherited mstSehi_T: TmstSehi_T
  Left = 262
  Top = 253
  Caption = #26045#32933#27161#28310#65288#27700#31282#32946#33495#65289
  ClientHeight = 314
  OldCreateOrder = True
  OnCreate = nil
  ExplicitHeight = 343
  PixelsPerInch = 96
  TextHeight = 12
  inherited SelectPanel: TPanel
    Height = 104
    ExplicitHeight = 104
    object Label1: TLabel
      Left = 48
      Top = 16
      Width = 30
      Height = 12
      Caption = #20316#29289#65306
    end
    object Label2: TLabel
      Left = 48
      Top = 48
      Width = 30
      Height = 12
      Caption = #20316#22411#65306
    end
    object CbSakumotu: TComboBox
      Left = 112
      Top = 12
      Width = 145
      Height = 20
      Style = csDropDownList
      TabOrder = 0
      OnChange = CbSakumotuChange
    end
    object CbSakugata: TComboBox
      Left = 112
      Top = 44
      Width = 145
      Height = 20
      Style = csDropDownList
      TabOrder = 1
      OnChange = CbSakugataChange
    end
    object CbSakugataCD: TComboBox
      Left = 264
      Top = 40
      Width = 73
      Height = 20
      TabOrder = 2
      Visible = False
    end
    object CbSakumotuCD: TComboBox
      Left = 264
      Top = 8
      Width = 73
      Height = 20
      TabOrder = 3
      Visible = False
    end
  end
  inherited EditPanel: TPanel
    Top = 145
    Height = 150
    ExplicitTop = 145
    ExplicitHeight = 150
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
    object Label3: TLabel
      Left = 32
      Top = 40
      Width = 40
      Height = 12
      Caption = #22522#12288#12288#32933
    end
    object LTuihi1: TLabel
      Left = 32
      Top = 72
      Width = 90
      Height = 12
      Caption = #36861#12288#12288#32933#65288'1.5'#33865#26399#65289
    end
    object LTuihi2: TLabel
      Left = 32
      Top = 104
      Width = 90
      Height = 12
      Caption = #36861#12288#12288#32933#65288'2.5'#33865#26399#65289
    end
    object DBEdit1: TDBEdit
      Left = 140
      Top = 36
      Width = 61
      Height = 20
      DataField = 'N'
      DataSource = ds1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 208
      Top = 36
      Width = 61
      Height = 20
      DataField = 'P'
      DataSource = ds1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 276
      Top = 36
      Width = 61
      Height = 20
      DataField = 'K'
      DataSource = ds1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 344
      Top = 36
      Width = 61
      Height = 20
      DataField = 'Mg'
      DataSource = ds1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 140
      Top = 68
      Width = 61
      Height = 20
      DataField = 'N1'
      DataSource = ds1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 140
      Top = 100
      Width = 61
      Height = 20
      DataField = 'N2'
      DataSource = ds1
      TabOrder = 5
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 295
    ExplicitTop = 295
  end
  object ADOQuery1: TADOQuery [5]
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 384
    Top = 96
  end
  inherited ADOTable1: TADOTable
    Left = 456
  end
end

inherited mstKaseiForm: TmstKaseiForm
  Left = 233
  Top = 154
  Caption = #21270#25104#12510#12473#12479
  ClientHeight = 542
  Font.Height = -16
  Font.Style = [fsBold]
  OldCreateOrder = True
  ExplicitHeight = 581
  PixelsPerInch = 96
  TextHeight = 16
  inherited Splitter1: TSplitter
    Top = 233
    ExplicitTop = 185
  end
  inherited EditPanel: TPanel
    Height = 192
    ExplicitTop = 41
    ExplicitHeight = 192
    object Label1: TLabel
      Left = 66
      Top = 42
      Width = 60
      Height = 16
      Caption = #32933#26009#21517#65306
    end
    object Label2: TLabel
      Left = 66
      Top = 82
      Width = 78
      Height = 16
      Caption = #25104#20998#65288#65285#65289#65306
    end
    object Label3: TLabel
      Left = 66
      Top = 108
      Width = 82
      Height = 16
      Caption = #23481#37327#65288#65355#65351#65289#65306
    end
    object Label4: TLabel
      Left = 181
      Top = 63
      Width = 11
      Height = 16
      Caption = 'N'
    end
    object Label5: TLabel
      Left = 241
      Top = 63
      Width = 11
      Height = 16
      Caption = 'P'
    end
    object Label6: TLabel
      Left = 292
      Top = 63
      Width = 11
      Height = 16
      Caption = 'K'
    end
    object Label7: TLabel
      Left = 345
      Top = 63
      Width = 21
      Height = 16
      Caption = 'Mg'
    end
    object Label8: TLabel
      Left = 66
      Top = 132
      Width = 78
      Height = 16
      Caption = #21336#20385#65288#20870#65289#65306
    end
    object Label9: TLabel
      Left = 66
      Top = 14
      Width = 51
      Height = 16
      Caption = #12467#12540#12489#65306
    end
    object DBEdit1: TDBEdit
      Left = 161
      Top = 39
      Width = 257
      Height = 24
      DataField = #21697#21517
      DataSource = ds1
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 161
      Top = 79
      Width = 53
      Height = 24
      DataField = 'N'
      DataSource = ds1
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 215
      Top = 79
      Width = 53
      Height = 24
      DataField = 'P'
      DataSource = ds1
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 271
      Top = 79
      Width = 53
      Height = 24
      DataField = 'K'
      DataSource = ds1
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 327
      Top = 79
      Width = 53
      Height = 24
      DataField = 'Mg'
      DataSource = ds1
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 161
      Top = 105
      Width = 53
      Height = 24
      DataField = #23481#37327
      DataSource = ds1
      TabOrder = 5
      OnKeyPress = EnterKeyPress
    end
    object DBEdit8: TDBEdit
      Left = 161
      Top = 13
      Width = 53
      Height = 24
      DataField = #32933#26009#12467#12540#12489
      DataSource = ds1
      TabOrder = 6
      OnKeyPress = EnterKeyPress
    end
    object Eken: TEdit
      Left = 343
      Top = 151
      Width = 121
      Height = 24
      TabOrder = 7
    end
    object BtKensaku: TBitBtn
      Left = 470
      Top = 151
      Width = 106
      Height = 25
      Caption = #26908#32034#23455#34892
      TabOrder = 8
      OnClick = BtKensakuClick
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 523
    ExplicitTop = 523
  end
  inherited GridPanel: TPanel
    Top = 236
    Height = 287
    ExplicitTop = 236
    ExplicitHeight = 287
    inherited DBGrid1: TDBGrid
      Height = 287
      TitleFont.Height = -16
      TitleFont.Style = [fsBold]
    end
  end
  inherited ds1: TDataSource
    DataSet = ADOQuery1
    Left = 528
    Top = 160
  end
  inherited ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'M_KASEI6'
    Left = 400
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 528
    Top = 200
  end
end

inherited mstTanpiForm: TmstTanpiForm
  Left = 282
  Top = 121
  Caption = #21336#32933#12510#12473#12479
  ClientWidth = 591
  OldCreateOrder = True
  ExplicitWidth = 607
  PixelsPerInch = 96
  TextHeight = 12
  inherited Splitter1: TSplitter
    Top = 257
    Width = 591
    ExplicitTop = 249
    ExplicitWidth = 591
  end
  inherited EditPanel: TPanel
    Width = 591
    Height = 216
    ExplicitWidth = 591
    ExplicitHeight = 216
    object Label1: TLabel
      Left = 76
      Top = 80
      Width = 42
      Height = 12
      Caption = #32933#26009#21517#65306
    end
    object Label2: TLabel
      Left = 64
      Top = 120
      Width = 54
      Height = 12
      Caption = #25104#20998#65288#65285#65289#65306
    end
    object Label3: TLabel
      Left = 64
      Top = 148
      Width = 56
      Height = 12
      Caption = #23481#37327#65288#65355#65351#65289#65306
    end
    object Label4: TLabel
      Left = 148
      Top = 100
      Width = 8
      Height = 12
      Caption = 'N'
    end
    object Label5: TLabel
      Left = 208
      Top = 100
      Width = 7
      Height = 12
      Caption = 'P'
    end
    object Label6: TLabel
      Left = 264
      Top = 100
      Width = 7
      Height = 12
      Caption = 'K'
    end
    object Label7: TLabel
      Left = 312
      Top = 100
      Width = 15
      Height = 12
      Caption = 'Mg'
    end
    object Label8: TLabel
      Left = 76
      Top = 56
      Width = 30
      Height = 12
      Caption = #12467#12540#12489
    end
    object Label9: TLabel
      Left = 64
      Top = 180
      Width = 54
      Height = 12
      Caption = #21336#20385#65288#20870#65289#65306
    end
    object gr1: TRadioGroup
      Left = 0
      Top = 0
      Width = 591
      Height = 41
      Align = alTop
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'N'#32933#26009
        'P'#32933#26009
        'K'#32933#26009
        'Mg'#32933#26009)
      TabOrder = 0
      OnClick = gr1Click
    end
    object DBEdit1: TDBEdit
      Left = 128
      Top = 76
      Width = 121
      Height = 20
      DataField = #32933#26009#21517
      DataSource = ds1
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 128
      Top = 116
      Width = 53
      Height = 20
      DataField = 'N'
      DataSource = ds1
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 184
      Top = 116
      Width = 53
      Height = 20
      DataField = 'P205'
      DataSource = ds1
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 240
      Top = 116
      Width = 53
      Height = 20
      DataField = 'K2O'
      DataSource = ds1
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 296
      Top = 116
      Width = 53
      Height = 20
      DataField = 'MgO'
      DataSource = ds1
      TabOrder = 5
      OnKeyPress = EnterKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 128
      Top = 144
      Width = 53
      Height = 20
      DataField = #23481#37327
      DataSource = ds1
      TabOrder = 6
      OnKeyPress = EnterKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 128
      Top = 52
      Width = 41
      Height = 20
      DataField = 'CODE'
      DataSource = ds1
      TabOrder = 7
      OnKeyPress = EnterKeyPress
    end
    object DBEdit8: TDBEdit
      Left = 128
      Top = 176
      Width = 53
      Height = 20
      DataField = #21336#20385
      DataSource = ds1
      TabOrder = 8
      OnKeyPress = EnterKeyPress
    end
    object ESisyoNo: TEdit
      Left = 408
      Top = 56
      Width = 33
      Height = 20
      TabOrder = 9
      Visible = False
    end
    object BtTanpi: TBitBtn
      Left = 366
      Top = 168
      Width = 187
      Height = 33
      Caption = #21336#32933#36984#25246#23455#34892
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 10
      OnClick = BtTanpiClick
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 591
    ExplicitWidth = 591
  end
  inherited Panel2: TPanel
    Width = 591
    ExplicitWidth = 591
  end
  inherited GridPanel: TPanel
    Top = 260
    Width = 591
    Height = 135
    ExplicitTop = 260
    ExplicitWidth = 591
    ExplicitHeight = 135
    inherited DBGrid1: TDBGrid
      Width = 591
      Height = 135
    end
  end
  inherited ds1: TDataSource
    DataSet = ADOQuery1
  end
  inherited ADOTable1: TADOTable
    TableName = 'M_TANPI'
  end
  object ADOTable2: TADOTable
    TableName = 'm_tanpi'
    Left = 336
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 456
    Top = 136
  end
end

inherited mstTikuForm: TmstTikuForm
  Caption = #25903#24215#12510#12473#12479
  Font.Height = -16
  Font.Name = #12513#12452#12522#12458
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 24
  inherited EditPanel: TPanel
    ExplicitTop = 41
    object Label1: TLabel
      Left = 64
      Top = 68
      Width = 80
      Height = 24
      Caption = #25903#24215#30058#21495#65306
    end
    object Label2: TLabel
      Left = 80
      Top = 104
      Width = 64
      Height = 24
      Caption = #25903#24215#21517#65306
    end
    object Label3: TLabel
      Left = 80
      Top = 36
      Width = 64
      Height = 24
      Caption = #32068#21512#21517#65306
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 164
      Top = 30
      Width = 205
      Height = 32
      DataField = #32068#21512#30058#21495
      DataSource = ds1
      KeyField = #32068#21512#30058#21495
      ListField = #32068#21512#21517
      ListSource = ds2
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 164
      Top = 65
      Width = 53
      Height = 32
      DataField = #25903#24215#30058#21495
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 164
      Top = 101
      Width = 329
      Height = 32
      DataField = #25903#24215#21517
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
  end
  inherited GridPanel: TPanel
    inherited DBGrid1: TDBGrid
      TitleFont.Height = -16
      TitleFont.Name = #12513#12452#12522#12458
    end
  end
  inherited ds1: TDataSource
    Left = 552
    Top = 176
  end
  inherited ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'M_SISYO'
    Left = 488
    Top = 168
  end
  object ds2: TDataSource
    DataSet = ADOTable2
    Left = 532
    Top = 56
  end
  object ADOTable2: TADOTable
    Connection = DataModule1.ADOConnection1
    AfterPost = ADOTable1AfterPost
    TableName = 'M_NOUKYOU'
    Left = 408
    Top = 48
  end
end

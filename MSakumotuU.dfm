inherited mstSakumotuForm: TmstSakumotuForm
  Caption = #20316#29289#12510#12473#12479
  ClientWidth = 600
  OldCreateOrder = True
  ExplicitWidth = 616
  PixelsPerInch = 96
  TextHeight = 12
  inherited Splitter1: TSplitter
    Top = 217
    Width = 600
    ExplicitTop = 217
    ExplicitWidth = 600
  end
  inherited EditPanel: TPanel
    Top = 73
    Width = 600
    Height = 144
    ExplicitTop = 73
    ExplicitWidth = 600
    ExplicitHeight = 144
    object Label1: TLabel
      Left = 76
      Top = 56
      Width = 60
      Height = 12
      Caption = #20316#29289#12467#12540#12489#65306
    end
    object Label2: TLabel
      Left = 76
      Top = 88
      Width = 42
      Height = 12
      Caption = #20316#29289#21517#65306
    end
    object Label3: TLabel
      Left = 76
      Top = 24
      Width = 30
      Height = 12
      Caption = #20316#30446#65306
    end
    object DBEdit1: TDBEdit
      Left = 160
      Top = 52
      Width = 29
      Height = 20
      DataField = #20316#29289#12467#12540#12489
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 160
      Top = 84
      Width = 157
      Height = 20
      DataField = #20316#29289#21517
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 160
      Top = 20
      Width = 145
      Height = 20
      DataField = #20316#30446#12467#12540#12489
      DataSource = ds1
      KeyField = #20316#30446#12467#12540#12489
      ListField = #20316#30446#21517
      ListSource = ds2
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 600
    ExplicitWidth = 600
  end
  inherited Panel2: TPanel
    Width = 600
    Height = 73
    ExplicitWidth = 600
    ExplicitHeight = 73
    object Label5: TLabel [0]
      Left = 16
      Top = 44
      Width = 120
      Height = 12
      Caption = #19968#35239#12434#20316#30446#12391#32094#12426#36796#12415#65306
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
    end
    object cmbSakumoku: TComboBox
      Left = 144
      Top = 40
      Width = 169
      Height = 20
      Style = csDropDownList
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnChange = cmbSakumokuChange
      OnKeyPress = EnterKeyPress
    end
  end
  inherited GridPanel: TPanel
    Top = 220
    Width = 600
    Height = 175
    ExplicitTop = 220
    ExplicitWidth = 600
    ExplicitHeight = 175
    inherited DBGrid1: TDBGrid
      Width = 600
      Height = 175
    end
  end
  inherited ADOTable1: TADOTable
    TableName = 'M_SAKUMOTU'
  end
  object ds2: TDataSource
    DataSet = ADOTable2
    Left = 540
    Top = 104
  end
  object ADOTable2: TADOTable
    Connection = DataModule1.ADOConnection1
    AfterPost = ADOTable1AfterPost
    TableName = 'M_SAKUMOKU'
    Left = 496
    Top = 144
  end
end

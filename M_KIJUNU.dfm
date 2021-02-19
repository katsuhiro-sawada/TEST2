inherited mstKijun1Form: TmstKijun1Form
  Left = 367
  Top = 220
  ClientHeight = 577
  ClientWidth = 714
  Font.Height = -16
  Font.Name = #12513#12452#12522#12458
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 720
  ExplicitHeight = 606
  PixelsPerInch = 96
  TextHeight = 24
  inherited StatusBar1: TStatusBar
    Top = 558
    Width = 714
    ExplicitTop = 558
    ExplicitWidth = 714
  end
  inherited Panel2: TPanel
    Width = 714
    Height = 117
    ExplicitWidth = 714
    ExplicitHeight = 117
    object Label1: TLabel [0]
      Left = 32
      Top = 16
      Width = 64
      Height = 24
      Caption = #20316#29289#21517#65306
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 96
      Top = 16
      Width = 205
      Height = 32
      DataField = #12467#12540#12489'2'
      DataSource = DDummy
      KeyField = #20316#29289#12467#12540#12489
      ListField = #20316#29289#21517
      ListSource = ds1
      TabOrder = 1
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 117
    Width = 714
    Height = 441
    Align = alClient
    TabOrder = 2
    object Label11: TLabel
      Left = 217
      Top = 43
      Width = 16
      Height = 24
      Caption = #65374
    end
    object Label2: TLabel
      Left = 32
      Top = 43
      Width = 38
      Height = 24
      Caption = 'pH'#65306
    end
    object Label3: TLabel
      Left = 32
      Top = 81
      Width = 69
      Height = 24
      Caption = 'pHKCL'#65306
    end
    object Label4: TLabel
      Left = 217
      Top = 81
      Width = 16
      Height = 24
      Caption = #65374
    end
    object Label5: TLabel
      Left = 32
      Top = 119
      Width = 37
      Height = 24
      Caption = 'EC'#65306
    end
    object Label6: TLabel
      Left = 217
      Top = 119
      Width = 16
      Height = 24
      Caption = #65374
    end
    object Label7: TLabel
      Left = 127
      Top = 6
      Width = 48
      Height = 24
      Caption = #19979#38480#20516
    end
    object Label8: TLabel
      Left = 245
      Top = 6
      Width = 48
      Height = 24
      Caption = #19978#38480#20516
    end
    object DBEdit5: TDBEdit
      Left = 127
      Top = 40
      Width = 75
      Height = 32
      DataField = 'pH'#19979#38480
      DataSource = ds1
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 245
      Top = 40
      Width = 75
      Height = 32
      DataField = 'pH'#19978#38480
      DataSource = ds1
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 127
      Top = 78
      Width = 75
      Height = 32
      DataField = 'pHKCL'#19979#38480
      DataSource = ds1
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 245
      Top = 78
      Width = 75
      Height = 32
      DataField = 'pHKCL'#19978#38480
      DataSource = ds1
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 127
      Top = 116
      Width = 75
      Height = 32
      DataField = 'EC'#19979#38480
      DataSource = ds1
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 245
      Top = 116
      Width = 75
      Height = 32
      DataField = 'EC'#19978#38480
      DataSource = ds1
      TabOrder = 5
      OnKeyPress = EnterKeyPress
    end
  end
  inherited ds1: TDataSource
    Left = 424
    Top = 8
  end
  inherited ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_SAKUMOTU'
    Left = 384
    Top = 8
  end
  object ADODummy: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'T_DUMMY'
    Left = 376
    Top = 72
  end
  object DDummy: TDataSource
    DataSet = ADODummy
    Left = 428
    Top = 72
  end
end

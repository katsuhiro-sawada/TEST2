inherited mstCenterForm: TmstCenterForm
  Left = 268
  Top = 158
  Caption = #12475#12531#12479#12540#21517#31216#12510#12473#12479
  OldCreateOrder = True
  ExplicitWidth = 631
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 12
  inherited EditPanel: TPanel
    ExplicitWidth = 615
    object Label1: TLabel
      Left = 68
      Top = 40
      Width = 78
      Height = 12
      Caption = #12475#12531#12479#12540#12467#12540#12489#65306
    end
    object Label2: TLabel
      Left = 68
      Top = 72
      Width = 72
      Height = 12
      Caption = #12475#12531#12479#12540#21517#31216#65306
    end
    object Label3: TLabel
      Left = 68
      Top = 104
      Width = 78
      Height = 12
      Caption = #12475#12531#12479#12540#12467#12540#12489#65306
    end
    object DBEdit1: TDBEdit
      Left = 160
      Top = 36
      Width = 29
      Height = 20
      DataField = #12475#12531#12479#12540#12467#12540#12489
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 160
      Top = 68
      Width = 157
      Height = 20
      DataField = #12475#12531#12479#12540#21517#31216
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 160
      Top = 100
      Width = 157
      Height = 20
      Hint = #12487#12540#12479#12501#12457#12523#12480#12395#20351#29992#12375#12414#12377#12290#20462#27491#19981#21487
      DataField = #12475#12531#12479#12540#35352#21495
      DataSource = ds1
      ImeMode = imDisable
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    ExplicitWidth = 615
  end
  inherited Panel2: TPanel
    ExplicitWidth = 615
  end
  inherited GridPanel: TPanel
    ExplicitWidth = 615
  end
  inherited ADOTable1: TADOTable
    TableName = 'M_CENTER'
  end
end

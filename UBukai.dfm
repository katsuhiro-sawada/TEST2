inherited mstBukaiForm: TmstBukaiForm
  Left = 190
  Top = 181
  Caption = #37096#20250
  ClientWidth = 583
  ExplicitWidth = 599
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 12
  inherited Splitter1: TSplitter
    Top = 129
    Width = 583
    ExplicitTop = 129
    ExplicitWidth = 591
  end
  inherited EditPanel: TPanel
    Width = 583
    Height = 88
    ExplicitWidth = 583
    ExplicitHeight = 88
    object Label1: TLabel
      Left = 12
      Top = 32
      Width = 60
      Height = 12
      Caption = #37096#20250#12467#12540#12489#65306
    end
    object Label2: TLabel
      Left = 156
      Top = 32
      Width = 42
      Height = 12
      Caption = #37096#20250#21517#65306
    end
    object DBEdit1: TDBEdit
      Left = 80
      Top = 28
      Width = 29
      Height = 20
      DataField = #37096#20250#12467#12540#12489
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 208
      Top = 28
      Width = 193
      Height = 20
      DataField = #37096#20250#21517
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 1
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 583
    ExplicitWidth = 583
  end
  inherited Panel2: TPanel
    Width = 583
    ExplicitWidth = 583
  end
  inherited GridPanel: TPanel
    Top = 132
    Width = 583
    Height = 263
    ExplicitTop = 132
    ExplicitWidth = 583
    ExplicitHeight = 263
    inherited DBGrid1: TDBGrid
      Width = 583
      Height = 263
    end
  end
  inherited ADOTable1: TADOTable
    TableName = 'M_BUKAI'
  end
end

inherited mstNoukyouForm: TmstNoukyouForm
  Top = 139
  Caption = #36786#21332#12510#12473#12479
  ClientWidth = 610
  Font.Height = -16
  Font.Name = #12513#12452#12522#12458
  OldCreateOrder = True
  ExplicitWidth = 626
  PixelsPerInch = 96
  TextHeight = 24
  inherited Splitter1: TSplitter
    Top = 177
    Width = 610
    ExplicitTop = 177
    ExplicitWidth = 610
  end
  inherited EditPanel: TPanel
    Width = 610
    Height = 136
    ExplicitWidth = 610
    ExplicitHeight = 136
    object Label1: TLabel
      Left = 92
      Top = 40
      Width = 96
      Height = 24
      Caption = #36786#21332#12467#12540#12489#65306
    end
    object Label2: TLabel
      Left = 108
      Top = 76
      Width = 80
      Height = 24
      Caption = #36786#21332#21517#31216#65306
    end
    object DBEdit1: TDBEdit
      Left = 191
      Top = 34
      Width = 50
      Height = 32
      DataField = #32068#21512#30058#21495
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 191
      Top = 73
      Width = 186
      Height = 32
      DataField = #32068#21512#21517
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 610
    ExplicitWidth = 610
  end
  inherited Panel2: TPanel
    Width = 610
    ExplicitWidth = 610
  end
  inherited GridPanel: TPanel
    Top = 180
    Width = 610
    Height = 215
    ExplicitTop = 180
    ExplicitWidth = 610
    ExplicitHeight = 215
    inherited DBGrid1: TDBGrid
      Width = 610
      Height = 215
      TitleFont.Height = -16
      TitleFont.Name = #12513#12452#12522#12458
    end
  end
  inherited ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_NOUKYOU'
  end
end

inherited mstSakumokuForm: TmstSakumokuForm
  Caption = #20316#29289#12510#12473#12479
  ClientWidth = 606
  Font.Height = -16
  OldCreateOrder = True
  ExplicitWidth = 622
  PixelsPerInch = 96
  TextHeight = 16
  inherited Splitter1: TSplitter
    Top = 169
    Width = 606
    ExplicitTop = 169
    ExplicitWidth = 606
  end
  inherited EditPanel: TPanel
    Width = 606
    Height = 128
    ExplicitTop = 39
    ExplicitWidth = 606
    ExplicitHeight = 128
    object Label1: TLabel
      Left = 76
      Top = 28
      Width = 79
      Height = 16
      Caption = #20316#29289#12467#12540#12489#65306
    end
    object Label2: TLabel
      Left = 76
      Top = 60
      Width = 56
      Height = 16
      Caption = #20316#29289#21517#65306
    end
    object DBEdit1: TDBEdit
      Left = 160
      Top = 24
      Width = 29
      Height = 24
      DataField = #20316#29289#12467#12540#12489
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 160
      Top = 56
      Width = 157
      Height = 24
      DataField = #20316#29289#21517
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 606
    ExplicitWidth = 606
  end
  inherited Panel2: TPanel
    Width = 606
    ExplicitWidth = 606
  end
  inherited GridPanel: TPanel
    Top = 172
    Width = 606
    Height = 223
    ExplicitTop = 172
    ExplicitWidth = 606
    ExplicitHeight = 223
    inherited DBGrid1: TDBGrid
      Width = 606
      Height = 223
      TitleFont.Height = -16
      Columns = <
        item
          Expanded = False
          FieldName = #20316#29289#12467#12540#12489
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20316#29289#21517
          Width = 209
          Visible = True
        end>
    end
  end
  inherited ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    AfterPost = nil
    TableName = 'M_SAKUMOTU'
  end
  object AddQuery: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 512
    Top = 112
  end
end

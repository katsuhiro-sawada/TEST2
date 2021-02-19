inherited mstDoseiForm: TmstDoseiForm
  Left = 190
  Top = 85
  Caption = #22303#24615#12510#12473#12479
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited EditPanel: TPanel
    object Label1: TLabel
      Left = 92
      Top = 40
      Width = 60
      Height = 12
      Caption = #22303#24615#12467#12540#12489#65306
    end
    object Label2: TLabel
      Left = 92
      Top = 72
      Width = 54
      Height = 12
      Caption = #22303#24615#21517#31216#65306
    end
    object DBEdit1: TDBEdit
      Left = 160
      Top = 36
      Width = 29
      Height = 20
      DataField = #22303#24615#12467#12540#12489
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
      DataField = #22303#24615#21517
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
  end
  object Table1: TTable
    TableName = 'M_DOSEI.db'
  end
end

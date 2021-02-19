inherited mstFushokuForm: TmstFushokuForm
  Caption = '腐植マスタ'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited EditPanel: TPanel
    object Label1: TLabel
      Left = 92
      Top = 40
      Width = 60
      Height = 12
      Caption = '腐植コード：'
    end
    object Label2: TLabel
      Left = 92
      Top = 72
      Width = 42
      Height = 12
      Caption = '腐植名：'
    end
    object DBEdit1: TDBEdit
      Left = 160
      Top = 36
      Width = 29
      Height = 20
      DataField = '腐植コード'
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
      DataField = '腐植名'
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
  end
  inherited Table1: TTable
    TableName = 'M_FUSHOKU.db'
  end
end

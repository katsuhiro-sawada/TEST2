inherited mstYuukiForm: TmstYuukiForm
  Left = 214
  Top = 175
  Caption = #26377#27231#29289#12510#12473#12479
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Splitter1: TSplitter
    Top = 197
    ExplicitTop = 197
  end
  inherited EditPanel: TPanel
    Height = 156
    ExplicitWidth = 615
    ExplicitHeight = 156
    object Label1: TLabel
      Left = 76
      Top = 12
      Width = 72
      Height = 12
      Caption = #26377#27231#29289#12467#12540#12489#65306
    end
    object Label2: TLabel
      Left = 80
      Top = 40
      Width = 66
      Height = 12
      Caption = #26377#27231#29289#31278#39006#65306
    end
    object Label3: TLabel
      Left = 160
      Top = 68
      Width = 159
      Height = 12
      Caption = #21270#25104#32933#26009#30456#24403#25104#20998#37327' Kg/'#29694#29289't'
    end
    object Label5: TLabel
      Left = 232
      Top = 112
      Width = 7
      Height = 12
      Caption = 'P'
    end
    object Label6: TLabel
      Left = 280
      Top = 112
      Width = 7
      Height = 12
      Caption = 'K'
    end
    object Label7: TLabel
      Left = 92
      Top = 132
      Width = 54
      Height = 12
      Caption = #28779#23665#24615#22303#65306
    end
    object Label8: TLabel
      Left = 32
      Top = 92
      Width = 114
      Height = 12
      Caption = #20302#22320#22303#12539#21488#22320#22303#12539#27877#28845#65306
    end
    object Label4: TLabel
      Left = 176
      Top = 112
      Width = 8
      Height = 12
      Caption = 'N'
    end
    object DBEdit1: TDBEdit
      Left = 160
      Top = 8
      Width = 29
      Height = 20
      DataField = #26377#27231#29289#12467#12540#12489
      DataSource = ds1
      ImeMode = imClose
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 160
      Top = 36
      Width = 245
      Height = 20
      DataField = #26377#27231#29289#21517#31216
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 160
      Top = 88
      Width = 45
      Height = 20
      DataField = 'N'
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 212
      Top = 88
      Width = 45
      Height = 20
      DataField = 'P'
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 264
      Top = 88
      Width = 45
      Height = 20
      DataField = 'K'
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 160
      Top = 128
      Width = 45
      Height = 20
      DataField = 'N_2'
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 5
      OnKeyPress = EnterKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 212
      Top = 128
      Width = 45
      Height = 20
      DataField = 'P_2'
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 6
      OnKeyPress = EnterKeyPress
    end
    object DBEdit8: TDBEdit
      Left = 264
      Top = 128
      Width = 45
      Height = 20
      DataField = 'K_2'
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 7
      OnKeyPress = EnterKeyPress
    end
    object ESisyoNo: TEdit
      Left = 368
      Top = 8
      Width = 33
      Height = 20
      TabOrder = 8
      Visible = False
    end
  end
  inherited StatusBar1: TStatusBar
    ExplicitWidth = 615
  end
  inherited Panel2: TPanel
    ExplicitWidth = 615
  end
  inherited GridPanel: TPanel
    Top = 200
    Height = 195
    ExplicitTop = 200
    ExplicitWidth = 615
    ExplicitHeight = 195
    inherited DBGrid1: TDBGrid
      Height = 195
    end
  end
  inherited ADOTable1: TADOTable
    TableName = 'M_YUUKI'
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 504
    Top = 96
  end
end

inherited FKingaku: TFKingaku
  Left = 270
  Top = 213
  Caption = #20998#26512#37329#38989
  ClientHeight = 291
  ExplicitWidth = 631
  ExplicitHeight = 330
  PixelsPerInch = 96
  TextHeight = 12
  inherited Splitter1: TSplitter
    Top = 145
    ExplicitTop = 145
  end
  inherited EditPanel: TPanel
    Height = 104
    ExplicitWidth = 615
    ExplicitHeight = 104
    object Label1: TLabel
      Left = 56
      Top = 48
      Width = 48
      Height = 12
      Caption = #31777#26131#20998#26512
    end
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 24
      Height = 12
      Caption = #21306#21029
    end
    object Label3: TLabel
      Left = 120
      Top = 48
      Width = 48
      Height = 12
      Caption = #22522#26412#20998#26512
    end
    object Label4: TLabel
      Left = 184
      Top = 48
      Width = 48
      Height = 12
      Caption = #32207#21512#20998#26512
    end
    object Label5: TLabel
      Left = 248
      Top = 48
      Width = 60
      Height = 12
      Caption = #32946#33495#22303#20998#26512
    end
    object Label6: TLabel
      Left = 320
      Top = 48
      Width = 24
      Height = 12
      Caption = #22534#32933
    end
    object Label7: TLabel
      Left = 376
      Top = 48
      Width = 36
      Height = 12
      Caption = #31895#39164#26009
    end
    object Label8: TLabel
      Left = 432
      Top = 80
      Width = 48
      Height = 12
      Caption = #21336#20301#65288#20870#65289
    end
    object DBEdit1: TDBEdit
      Left = 56
      Top = 72
      Width = 49
      Height = 20
      DataField = #31777#26131#20998#26512
      DataSource = ds1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 56
      Top = 8
      Width = 57
      Height = 20
      DataField = #21306#21029
      DataSource = ds1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 120
      Top = 72
      Width = 49
      Height = 20
      DataField = #22522#26412#20998#26512
      DataSource = ds1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 184
      Top = 72
      Width = 49
      Height = 20
      DataField = #32207#21512#20998#26512
      DataSource = ds1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 248
      Top = 72
      Width = 49
      Height = 20
      DataField = #32946#33495#22303#20998#26512
      DataSource = ds1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 312
      Top = 72
      Width = 49
      Height = 20
      DataField = #22534#32933
      DataSource = ds1
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 368
      Top = 72
      Width = 49
      Height = 20
      DataField = #31895#39164#26009
      DataSource = ds1
      TabOrder = 6
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 272
    ExplicitTop = 272
    ExplicitWidth = 615
  end
  inherited Panel2: TPanel
    ExplicitWidth = 615
  end
  inherited GridPanel: TPanel
    Top = 148
    Height = 124
    ExplicitTop = 148
    ExplicitWidth = 615
    ExplicitHeight = 124
    inherited DBGrid1: TDBGrid
      Height = 124
    end
  end
  inherited ADOTable1: TADOTable
    TableName = 'M_KINGAKU'
  end
end

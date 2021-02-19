inherited FTaihiMas: TFTaihiMas
  Left = 221
  Top = 279
  Caption = #22534#32933#12510#12473#12479
  ClientHeight = 534
  ClientWidth = 598
  Font.Height = -15
  Font.Style = [fsBold]
  Position = poScreenCenter
  ExplicitWidth = 614
  ExplicitHeight = 573
  PixelsPerInch = 96
  TextHeight = 15
  inherited Splitter1: TSplitter
    Top = 273
    Width = 598
    ExplicitTop = 273
    ExplicitWidth = 598
  end
  inherited EditPanel: TPanel
    Width = 598
    Height = 232
    ExplicitWidth = 598
    ExplicitHeight = 232
    object Label1: TLabel
      Left = 89
      Top = 108
      Width = 53
      Height = 15
      Caption = #25104#20998'(%)'
    end
    object Label2: TLabel
      Left = 185
      Top = 84
      Width = 11
      Height = 15
      Caption = 'N'
    end
    object Label3: TLabel
      Left = 256
      Top = 84
      Width = 10
      Height = 15
      Caption = 'P'
    end
    object Label4: TLabel
      Left = 335
      Top = 84
      Width = 10
      Height = 15
      Caption = 'K'
    end
    object Label5: TLabel
      Left = 404
      Top = 84
      Width = 31
      Height = 15
      Caption = 'CaO'
    end
    object Label6: TLabel
      Left = 477
      Top = 84
      Width = 32
      Height = 15
      Caption = 'MgO'
    end
    object Label7: TLabel
      Left = 73
      Top = 148
      Width = 69
      Height = 15
      Caption = #21033#29992#29575'(%)'
    end
    object Label8: TLabel
      Left = 73
      Top = 188
      Width = 69
      Height = 15
      Caption = #20094#29289#29575'(%)'
    end
    object Label9: TLabel
      Left = 94
      Top = 20
      Width = 40
      Height = 15
      Caption = #12467#12540#12489
    end
    object Label10: TLabel
      Left = 94
      Top = 58
      Width = 32
      Height = 15
      Caption = #21517#31216
    end
    object DBEdit1: TDBEdit
      Left = 161
      Top = 105
      Width = 57
      Height = 23
      DataField = 'N'
      DataSource = ds1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 238
      Top = 105
      Width = 57
      Height = 23
      DataField = 'P'
      DataSource = ds1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 315
      Top = 105
      Width = 57
      Height = 23
      DataField = 'K'
      DataSource = ds1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 392
      Top = 105
      Width = 57
      Height = 23
      DataField = 'CaO'
      DataSource = ds1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 469
      Top = 105
      Width = 57
      Height = 23
      DataField = 'MgO'
      DataSource = ds1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 161
      Top = 145
      Width = 57
      Height = 23
      DataField = 'N'#21033#29992#29575
      DataSource = ds1
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 238
      Top = 145
      Width = 57
      Height = 23
      DataField = 'P'#21033#29992#29575
      DataSource = ds1
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 315
      Top = 145
      Width = 57
      Height = 23
      DataField = 'K'#21033#29992#29575
      DataSource = ds1
      TabOrder = 7
    end
    object DBEdit9: TDBEdit
      Left = 392
      Top = 145
      Width = 57
      Height = 23
      DataField = 'CaO'#21033#29992#29575
      DataSource = ds1
      TabOrder = 8
    end
    object DBEdit10: TDBEdit
      Left = 469
      Top = 145
      Width = 57
      Height = 23
      DataField = 'MgO'#21033#29992#29575
      DataSource = ds1
      TabOrder = 9
    end
    object DBEdit11: TDBEdit
      Left = 161
      Top = 185
      Width = 57
      Height = 23
      DataField = #20094#29289#29575
      DataSource = ds1
      TabOrder = 10
    end
    object DBEdit12: TDBEdit
      Left = 161
      Top = 17
      Width = 57
      Height = 23
      DataField = #22534#32933#12467#12540#12489
      DataSource = ds1
      TabOrder = 11
    end
    object DBEdit13: TDBEdit
      Left = 161
      Top = 55
      Width = 207
      Height = 23
      DataField = #21517#31216
      DataSource = ds1
      TabOrder = 12
    end
    object BtSentaku: TBitBtn
      Left = 392
      Top = 192
      Width = 177
      Height = 25
      Caption = #36984#25246#23455#34892
      TabOrder = 13
      OnClick = BtSentakuClick
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 515
    Width = 598
    ExplicitTop = 515
    ExplicitWidth = 598
  end
  inherited Panel2: TPanel
    Width = 598
    ExplicitWidth = 598
  end
  inherited GridPanel: TPanel
    Top = 276
    Width = 598
    Height = 239
    ExplicitTop = 276
    ExplicitWidth = 598
    ExplicitHeight = 239
    inherited DBGrid1: TDBGrid
      Width = 598
      Height = 239
      TitleFont.Height = -15
      TitleFont.Style = [fsBold]
    end
  end
  inherited ADOTable1: TADOTable
    CursorType = ctStatic
    TableName = 'M_TAIHI'
    Left = 456
    Top = 64
  end
  object ADOTable2: TADOTable
    Left = 544
    Top = 120
  end
end

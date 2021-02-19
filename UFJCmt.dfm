inherited FJCmt: TFJCmt
  Left = 241
  Top = 104
  Caption = #12467#12513#12531#12488#26465#20214#35373#23450
  ClientHeight = 499
  ClientWidth = 593
  OldCreateOrder = True
  ExplicitWidth = 609
  ExplicitHeight = 538
  PixelsPerInch = 96
  TextHeight = 12
  inherited Splitter1: TSplitter
    Top = 321
    Width = 593
    ExplicitTop = 321
    ExplicitWidth = 601
  end
  inherited EditPanel: TPanel
    Width = 593
    Height = 280
    ExplicitWidth = 593
    ExplicitHeight = 280
    object Label6: TLabel
      Left = 24
      Top = 40
      Width = 44
      Height = 12
      Caption = #26465#20214#24335#65297
    end
    object Label7: TLabel
      Left = 24
      Top = 72
      Width = 44
      Height = 12
      Caption = #26465#20214#24335#65298
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 67
      Height = 12
      Caption = #12467#12513#12531#12488#12467#12540#12489
    end
    object Label2: TLabel
      Left = 96
      Top = 72
      Width = 60
      Height = 12
      Caption = #22522#28310#20516#19979#38480
    end
    object Label3: TLabel
      Left = 96
      Top = 104
      Width = 60
      Height = 12
      Caption = #22522#28310#20516#19979#38480
    end
    object Label4: TLabel
      Left = 464
      Top = 72
      Width = 60
      Height = 12
      Caption = #22522#28310#20516#19978#38480
    end
    object Label5: TLabel
      Left = 464
      Top = 104
      Width = 60
      Height = 12
      Caption = #22522#28310#20516#19978#38480
    end
    object Label8: TLabel
      Left = 24
      Top = 104
      Width = 44
      Height = 12
      Caption = #26465#20214#24335#65299
    end
    object Label9: TLabel
      Left = 96
      Top = 40
      Width = 56
      Height = 12
      Caption = #20316#12288#12288#12288#12288#29289
    end
    object Label10: TLabel
      Left = 24
      Top = 136
      Width = 44
      Height = 12
      Caption = #26465#20214#24335#65300
    end
    object Label11: TLabel
      Left = 408
      Top = 136
      Width = 12
      Height = 12
      Caption = #215
    end
    object Label12: TLabel
      Left = 472
      Top = 136
      Width = 12
      Height = 12
      Caption = #20493
    end
    object Label13: TLabel
      Left = 320
      Top = 8
      Width = 264
      Height = 12
      Caption = #8251#26465#20214#24335#65297#65374#65300#12399#12289#65313#65326#65316#26465#20214#12395#12424#12427#21028#26029#12395#12394#12426#12414#12377#12290
    end
    object DBJyouken12: TDBComboBox
      Left = 232
      Top = 64
      Width = 153
      Height = 20
      Style = csDropDownList
      DataField = #38917#30446#65297
      DataSource = ds1
      Items.Strings = (
        ''
        'pH'
        'EC'
        'MgO'
        'K2O'
        'P'
        #22633#22522#39165#21644#24230
        #30707#28784#33510#22303#27604
        #33510#22303#21152#37324#27604)
      TabOrder = 0
    end
    object DBComboBox4: TDBComboBox
      Left = 168
      Top = 64
      Width = 57
      Height = 20
      Style = csDropDownList
      DataField = #19979#38480#35352#21495#65297
      DataSource = ds1
      Items.Strings = (
        ''
        #65308
        #65310)
      TabOrder = 1
    end
    object DBComboBox5: TDBComboBox
      Left = 392
      Top = 64
      Width = 57
      Height = 20
      Style = csDropDownList
      DataField = #19978#38480#35352#21495#65297
      DataSource = ds1
      Items.Strings = (
        ''
        #65308
        #65310)
      TabOrder = 2
    end
    object DBJyouken22: TDBComboBox
      Left = 232
      Top = 96
      Width = 153
      Height = 20
      Style = csDropDownList
      DataField = #38917#30446#65298
      DataSource = ds1
      Items.Strings = (
        ''
        'pH'
        'EC'
        'CaO'
        'MgO'
        'K2O'
        'P'
        #65315#65317#65315
        #22633#22522#39165#21644#24230
        #30707#28784#33510#22303#27604
        #33510#22303#21152#37324#27604
        '')
      TabOrder = 3
    end
    object DBComboBox6: TDBComboBox
      Left = 168
      Top = 96
      Width = 57
      Height = 20
      Style = csDropDownList
      DataField = #19979#38480#35352#21495#65298
      DataSource = ds1
      Items.Strings = (
        ''
        #65308
        #65310)
      TabOrder = 4
    end
    object DBComboBox7: TDBComboBox
      Left = 392
      Top = 96
      Width = 57
      Height = 20
      Style = csDropDownList
      DataField = #19978#38480#35352#21495#65298
      DataSource = ds1
      Items.Strings = (
        ''
        #65308
        #65310)
      TabOrder = 5
    end
    object DBMemo1: TDBMemo
      Left = 9
      Top = 176
      Width = 584
      Height = 73
      DataField = #12467#12513#12531#12488
      DataSource = ds1
      TabOrder = 6
    end
    object DBEdit1: TDBEdit
      Left = 104
      Top = 5
      Width = 49
      Height = 20
      DataField = #12467#12540#12489
      DataSource = ds1
      TabOrder = 7
      OnKeyPress = EnterKeyPress
    end
    object DBComboBox1: TDBComboBox
      Left = 168
      Top = 32
      Width = 89
      Height = 20
      Style = csDropDownList
      DataField = #20316#29289
      DataSource = ds1
      Items.Strings = (
        ''
        #20840#20316#29289
        #27700#31282
        #30033
        #37326#33756
        #26524#27193
        #33457#12365
        #33609#22320
        #39164#26009
        #12381#12398#20182)
      TabOrder = 8
    end
    object DBJyouken31: TDBComboBox
      Left = 96
      Top = 128
      Width = 153
      Height = 20
      Style = csDropDownList
      DataField = #38917#30446#65299
      DataSource = ds1
      Items.Strings = (
        ''
        'pH'
        'EC'
        'CaO'
        'MgO'
        'K2O'
        'P'
        #65315#65317#65315
        #22633#22522#39165#21644#24230
        #30707#28784#33510#22303#27604
        #33510#22303#21152#37324#27604
        '')
      TabOrder = 9
    end
    object DBComboBox2: TDBComboBox
      Left = 256
      Top = 128
      Width = 57
      Height = 20
      Style = csDropDownList
      DataField = #35352#21495#65299
      DataSource = ds1
      Items.Strings = (
        ''
        #65308
        #65310)
      TabOrder = 10
    end
    object DBEdit3: TDBEdit
      Left = 424
      Top = 128
      Width = 41
      Height = 20
      DataField = #20493#25968
      DataSource = ds1
      TabOrder = 11
    end
    object DBComboBox3: TDBComboBox
      Left = 320
      Top = 128
      Width = 81
      Height = 20
      Style = csDropDownList
      DataField = #22522#28310
      DataSource = ds1
      Items.Strings = (
        ''
        #22522#28310#20516#19978#38480
        #22522#28310#20516#19979#38480)
      TabOrder = 12
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 480
    Width = 593
    ExplicitTop = 480
    ExplicitWidth = 593
  end
  inherited Panel2: TPanel
    Width = 593
    ExplicitWidth = 593
  end
  inherited GridPanel: TPanel
    Top = 324
    Width = 593
    Height = 156
    ExplicitTop = 324
    ExplicitWidth = 593
    ExplicitHeight = 156
    inherited DBGrid1: TDBGrid
      Width = 593
      Height = 156
    end
  end
  inherited ADOTable1: TADOTable
    TableName = 'T_JCMT'
  end
end

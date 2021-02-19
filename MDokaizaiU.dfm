inherited mstDokaizaiForm: TmstDokaizaiForm
  Left = 253
  Top = 145
  Caption = #22303#22732#25913#33391#36039#26448
  ClientWidth = 656
  OldCreateOrder = True
  ExplicitWidth = 672
  PixelsPerInch = 96
  TextHeight = 12
  inherited Splitter1: TSplitter
    Top = 149
    Width = 656
    ExplicitTop = 149
    ExplicitWidth = 664
  end
  inherited EditPanel: TPanel
    Width = 656
    Height = 108
    ExplicitWidth = 656
    ExplicitHeight = 108
    object Label1: TLabel
      Left = 32
      Top = 20
      Width = 42
      Height = 12
      Caption = #36039#26448#21517#65306
    end
    object Label2: TLabel
      Left = 28
      Top = 44
      Width = 54
      Height = 12
      Caption = #12450#12523#12459#12522#20998
    end
    object Label3: TLabel
      Left = 105
      Top = 44
      Width = 31
      Height = 12
      Caption = #12522#12531#37240
    end
    object Label4: TLabel
      Left = 181
      Top = 44
      Width = 24
      Height = 12
      Caption = #33510#22303
    end
    object Label5: TLabel
      Left = 258
      Top = 44
      Width = 24
      Height = 12
      Caption = #30707#28784
    end
    object Label6: TLabel
      Left = 335
      Top = 44
      Width = 24
      Height = 12
      Caption = #21152#37324
    end
    object Label7: TLabel
      Left = 411
      Top = 44
      Width = 33
      Height = 12
      Caption = #12465#12452#37240
    end
    object Label8: TLabel
      Left = 488
      Top = 44
      Width = 37
      Height = 12
      Caption = #29992#37327'Kg'
    end
    object LTanka: TLabel
      Left = 560
      Top = 44
      Width = 48
      Height = 12
      Caption = #21336#20385#65288#20870#65289
    end
    object DBCheckBox1: TDBCheckBox
      Left = 276
      Top = 16
      Width = 97
      Height = 17
      Caption = 'ON/OFF'
      DataField = #36984#25246#12501#12521#12464
      DataSource = ds1
      TabOrder = 0
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnKeyPress = EnterKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 80
      Top = 16
      Width = 181
      Height = 20
      DataField = #36039#26448#21517
      DataSource = ds1
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 28
      Top = 64
      Width = 57
      Height = 20
      DataField = #12450#12523#12459#12522#20998
      DataSource = ds1
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 104
      Top = 64
      Width = 57
      Height = 20
      DataField = #12522#12531#37240
      DataSource = ds1
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 180
      Top = 64
      Width = 57
      Height = 20
      DataField = #33510#22303
      DataSource = ds1
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 256
      Top = 64
      Width = 57
      Height = 20
      DataField = #30707#28784
      DataSource = ds1
      TabOrder = 5
      OnKeyPress = EnterKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 332
      Top = 64
      Width = 57
      Height = 20
      DataField = #21152#37324
      DataSource = ds1
      TabOrder = 6
      OnKeyPress = EnterKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 408
      Top = 64
      Width = 57
      Height = 20
      DataField = #12465#12452#37240
      DataSource = ds1
      TabOrder = 7
      OnKeyPress = EnterKeyPress
    end
    object DBEdit8: TDBEdit
      Left = 484
      Top = 64
      Width = 57
      Height = 20
      DataField = #23481#37327
      DataSource = ds1
      TabOrder = 8
      OnKeyPress = EnterKeyPress
    end
    object DBTanka: TDBEdit
      Left = 556
      Top = 64
      Width = 57
      Height = 20
      DataField = #21336#20385
      DataSource = ds1
      TabOrder = 9
      OnKeyPress = EnterKeyPress
    end
    object ESisyoNo: TEdit
      Left = 368
      Top = 8
      Width = 41
      Height = 20
      TabOrder = 10
      Visible = False
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 656
    ExplicitWidth = 656
  end
  inherited Panel2: TPanel
    Width = 656
    ExplicitWidth = 656
    inherited btnNew: TBitBtn
      Visible = False
    end
    inherited btnDel: TBitBtn
      Visible = False
    end
  end
  inherited GridPanel: TPanel
    Top = 152
    Width = 656
    Height = 243
    ExplicitTop = 152
    ExplicitWidth = 656
    ExplicitHeight = 243
    inherited DBGrid1: TDBGrid
      Width = 656
      Height = 243
      Columns = <
        item
          Expanded = False
          FieldName = #12467#12540#12489
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22303#25913#26448#12398#31278#39006
          Width = 177
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36039#26448#21517
          Width = 167
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36984#25246#12501#12521#12464
          Visible = True
        end>
    end
  end
  inherited ADOTable1: TADOTable
    TableName = 'M_DOKAIZAI'
    Left = 472
  end
end

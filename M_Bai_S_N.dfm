inherited mstBai_S_NForm: TmstBai_S_NForm
  Left = 213
  Top = 187
  Caption = #31378#32032#26045#32933#23550#24540
  ClientHeight = 343
  ClientWidth = 715
  Font.Height = -15
  Font.Style = [fsBold]
  OldCreateOrder = True
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 15
  inherited SelectPanel: TPanel
    Width = 715
    Height = 96
    TabOrder = 1
    ExplicitWidth = 715
    ExplicitHeight = 96
    object Label2: TLabel
      Left = 32
      Top = 24
      Width = 73
      Height = 15
      Caption = #22320#24111#21306#20998#65306
    end
    object Label3: TLabel
      Left = 32
      Top = 52
      Width = 73
      Height = 15
      Caption = #22303#22732#21306#20998#65306
    end
    object ComboBox2: TComboBox
      Left = 112
      Top = 20
      Width = 221
      Height = 23
      Style = csDropDownList
      TabOrder = 0
      OnChange = ComboBox2Change
    end
    object ComboBox3: TComboBox
      Left = 112
      Top = 48
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 1
      OnChange = ComboBox3Change
    end
  end
  inherited Panel2: TPanel
    Width = 715
    TabOrder = 0
    ExplicitWidth = 715
    inherited btnPost: TBitBtn
      Left = 412
      ExplicitLeft = 412
    end
    inherited btnCancel: TBitBtn
      Left = 508
      ExplicitLeft = 508
    end
    inherited btnClose: TBitBtn
      Left = 600
      ExplicitLeft = 600
    end
  end
  inherited EditPanel: TPanel
    Top = 137
    Width = 715
    Height = 187
    ExplicitTop = 137
    ExplicitWidth = 715
    ExplicitHeight = 187
    object Shape16: TShape
      Left = 16
      Top = 24
      Width = 137
      Height = 81
      Brush.Style = bsClear
    end
    object Label1: TLabel
      Left = 56
      Top = 64
      Width = 76
      Height = 15
      Caption = '(mg/100g)'
    end
    object Label4: TLabel
      Left = 24
      Top = 40
      Width = 112
      Height = 15
      Caption = #31378#32032#32933#27779#24230#27700#28310
    end
    object Label5: TLabel
      Left = 160
      Top = 80
      Width = 16
      Height = 15
      Caption = #65374
    end
    object Label6: TLabel
      Left = 288
      Top = 80
      Width = 16
      Height = 15
      Caption = #65374
    end
    object Label7: TLabel
      Left = 416
      Top = 80
      Width = 16
      Height = 15
      Caption = #65374
    end
    object Label8: TLabel
      Left = 544
      Top = 80
      Width = 16
      Height = 15
      Caption = #65374
    end
    object Label9: TLabel
      Left = 672
      Top = 80
      Width = 16
      Height = 15
      Caption = #65374
    end
    object Shape1: TShape
      Left = 152
      Top = 64
      Width = 81
      Height = 41
      Brush.Style = bsClear
    end
    object Shape2: TShape
      Left = 152
      Top = 104
      Width = 81
      Height = 41
      Brush.Style = bsClear
    end
    object Shape3: TShape
      Left = 152
      Top = 24
      Width = 81
      Height = 41
      Brush.Style = bsClear
    end
    object Shape4: TShape
      Left = 616
      Top = 104
      Width = 81
      Height = 41
      Brush.Style = bsClear
    end
    object Shape5: TShape
      Left = 232
      Top = 104
      Width = 129
      Height = 41
      Brush.Style = bsClear
    end
    object Shape6: TShape
      Left = 232
      Top = 64
      Width = 129
      Height = 41
      Brush.Style = bsClear
    end
    object Shape7: TShape
      Left = 232
      Top = 24
      Width = 129
      Height = 41
      Brush.Style = bsClear
    end
    object Shape8: TShape
      Left = 360
      Top = 104
      Width = 129
      Height = 41
      Brush.Style = bsClear
    end
    object Shape9: TShape
      Left = 488
      Top = 104
      Width = 129
      Height = 41
      Brush.Style = bsClear
    end
    object Shape10: TShape
      Left = 360
      Top = 64
      Width = 129
      Height = 41
      Brush.Style = bsClear
    end
    object Shape11: TShape
      Left = 360
      Top = 24
      Width = 129
      Height = 41
      Brush.Style = bsClear
    end
    object Shape12: TShape
      Left = 488
      Top = 64
      Width = 129
      Height = 41
      Brush.Style = bsClear
    end
    object Shape13: TShape
      Left = 488
      Top = 24
      Width = 129
      Height = 41
      Brush.Style = bsClear
    end
    object Shape14: TShape
      Left = 616
      Top = 64
      Width = 81
      Height = 41
      Brush.Style = bsClear
    end
    object Shape15: TShape
      Left = 616
      Top = 24
      Width = 81
      Height = 41
      Brush.Style = bsClear
    end
    object Shape17: TShape
      Left = 16
      Top = 104
      Width = 137
      Height = 41
      Brush.Style = bsClear
    end
    object Label10: TLabel
      Left = 24
      Top = 112
      Width = 111
      Height = 15
      Caption = #26045#32933#37327'(kg/10a)'
    end
    object Label11: TLabel
      Left = 184
      Top = 40
      Width = 16
      Height = 15
      Caption = #20302
    end
    object Label12: TLabel
      Left = 272
      Top = 40
      Width = 48
      Height = 15
      Caption = #12420#12420#20302
    end
    object Label13: TLabel
      Left = 408
      Top = 40
      Width = 32
      Height = 15
      Caption = #20013#20301
    end
    object Label14: TLabel
      Left = 528
      Top = 40
      Width = 48
      Height = 15
      Caption = #12420#12420#39640
    end
    object Label15: TLabel
      Left = 648
      Top = 40
      Width = 16
      Height = 15
      Caption = #39640
    end
    object DBEdit1: TDBEdit
      Left = 184
      Top = 72
      Width = 41
      Height = 23
      DataField = #22522#28310'1'
      DataSource = ds1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 312
      Top = 72
      Width = 41
      Height = 23
      DataField = #22522#28310'2'
      DataSource = ds1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 240
      Top = 72
      Width = 41
      Height = 23
      DataField = #22522#28310'1'
      DataSource = ds1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 368
      Top = 72
      Width = 41
      Height = 23
      DataField = #22522#28310'2'
      DataSource = ds1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 440
      Top = 72
      Width = 41
      Height = 23
      DataField = #22522#28310'3'
      DataSource = ds1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 496
      Top = 72
      Width = 41
      Height = 23
      DataField = #22522#28310'3'
      DataSource = ds1
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 568
      Top = 72
      Width = 41
      Height = 23
      DataField = #22522#28310'4'
      DataSource = ds1
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 624
      Top = 72
      Width = 41
      Height = 23
      DataField = #22522#28310'4'
      DataSource = ds1
      TabOrder = 7
    end
    object DBEdit9: TDBEdit
      Left = 272
      Top = 112
      Width = 41
      Height = 23
      DataField = #26045#32933#37327'2'
      DataSource = ds1
      TabOrder = 8
    end
    object DBEdit10: TDBEdit
      Left = 168
      Top = 112
      Width = 41
      Height = 23
      DataField = #26045#32933#37327'1'
      DataSource = ds1
      TabOrder = 9
    end
    object DBEdit11: TDBEdit
      Left = 400
      Top = 112
      Width = 41
      Height = 23
      DataField = #26045#32933#37327'3'
      DataSource = ds1
      TabOrder = 10
    end
    object DBEdit12: TDBEdit
      Left = 528
      Top = 112
      Width = 41
      Height = 23
      DataField = #26045#32933#37327'4'
      DataSource = ds1
      TabOrder = 11
    end
    object DBEdit13: TDBEdit
      Left = 640
      Top = 112
      Width = 41
      Height = 23
      DataField = #26045#32933#37327'5'
      DataSource = ds1
      TabOrder = 12
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 324
    Width = 715
    ExplicitTop = 324
    ExplicitWidth = 715
  end
  object Table1: TTable
    TableName = 'M_BAI_S_N.DB'
  end
  object Query1: TQuery
    DatabaseName = 'DOJO'
    Left = 456
    Top = 57
  end
end

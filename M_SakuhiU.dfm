object mstSakuhiForm: TmstSakuhiForm
  Left = 224
  Top = 42
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20316#29289#21029#32933#26009#35373#23450
  ClientHeight = 623
  ClientWidth = 851
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Bevel1: TBevel
    Left = 0
    Top = 81
    Width = 851
    Height = 200
    Align = alTop
    Shape = bsFrame
    ExplicitTop = 82
  end
  object Bevel2: TBevel
    Left = 0
    Top = 281
    Width = 851
    Height = 342
    Align = alClient
    Shape = bsFrame
    ExplicitWidth = 584
  end
  object Label2: TLabel
    Left = 168
    Top = 87
    Width = 48
    Height = 12
    Caption = #21270#25104#32933#26009
  end
  object Label3: TLabel
    Left = 664
    Top = 87
    Width = 48
    Height = 12
    Caption = #26377#27231#32933#26009
  end
  object Label4: TLabel
    Left = 24
    Top = 156
    Width = 48
    Height = 12
    Caption = #32933#26009#35373#23450
  end
  object Label5: TLabel
    Left = 424
    Top = 87
    Width = 48
    Height = 12
    Caption = #25512#22888#32933#26009
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 851
    Height = 81
    Align = alTop
    BevelInner = bvLowered
    ParentColor = True
    TabOrder = 0
    ExplicitWidth = 584
    object Label1: TLabel
      Left = 36
      Top = 36
      Width = 42
      Height = 12
      Caption = #20316#29289#21517#65306
    end
    object Label77: TLabel
      Left = 36
      Top = 60
      Width = 42
      Height = 12
      Caption = #20316#22411#21517#65306
    end
    object lblDositu: TLabel
      Left = 36
      Top = 12
      Width = 42
      Height = 12
      Caption = #20316#30446#21517#65306
    end
    object btnClose: TBitBtn
      Left = 716
      Top = 12
      Width = 89
      Height = 25
      Caption = #38281#12376#12427'(&X)'
      DoubleBuffered = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333333333333333FFFFFFFFFFFFF3300000000000
        003337777777777777F330F777777777703337F33333333337F330F333333333
        703337F3FFFFFFF337F330F300000003703337F3F777777737F330F300000003
        703337F33777777737F330F333333333703337F3FFFFFFF337F330F300000003
        703337F3F777777737F330F330000033703337F33377777337F330F333000333
        703337F33337773337F330F333303333703337F33333733337F330F333333333
        703337F33333333337F330FFFFFFFFFFF03337FFFFFFFFFFF7F3300000000000
        0033377777777777773333333333333333333333333333333333}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object ComboBox1: TComboBox
      Left = 92
      Top = 8
      Width = 145
      Height = 20
      Style = csDropDownList
      TabOrder = 1
      OnChange = ComboBox1Change
    end
    object ComboBox2: TComboBox
      Left = 92
      Top = 32
      Width = 145
      Height = 20
      Style = csDropDownList
      Enabled = False
      TabOrder = 2
      OnChange = ComboBox2Change
    end
    object ComboBox3: TComboBox
      Left = 92
      Top = 56
      Width = 145
      Height = 20
      Style = csDropDownList
      Enabled = False
      TabOrder = 3
      OnChange = ComboBox3Change
    end
    object ESisyoNo: TEdit
      Left = 368
      Top = 8
      Width = 33
      Height = 20
      TabOrder = 4
      Visible = False
    end
  end
  object KaseiMast: TListBox
    Left = 192
    Top = 296
    Width = 233
    Height = 281
    ItemHeight = 12
    TabOrder = 1
    OnDblClick = btnKaseiAddClick
  end
  object YuukiMast: TListBox
    Left = 584
    Top = 302
    Width = 221
    Height = 313
    ItemHeight = 12
    TabOrder = 2
    OnDblClick = btnYuukiAddClick
  end
  object KaseiList: TListBox
    Left = 92
    Top = 105
    Width = 221
    Height = 129
    ItemHeight = 12
    TabOrder = 3
    OnDblClick = btnKaseiDelClick
  end
  object YuukiList: TListBox
    Left = 584
    Top = 104
    Width = 221
    Height = 129
    ItemHeight = 12
    TabOrder = 4
    OnDblClick = btnYuukiDelClick
  end
  object btnKaseiDel: TButton
    Left = 212
    Top = 236
    Width = 34
    Height = 25
    Hint = #21066#38500
    Caption = #8595
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnKaseiDelClick
  end
  object btnKaseiAdd: TButton
    Left = 168
    Top = 236
    Width = 34
    Height = 25
    Hint = #36861#21152
    Caption = #8593
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnKaseiAddClick
  end
  object btnYuukiDel: TButton
    Left = 688
    Top = 236
    Width = 34
    Height = 25
    Hint = #21066#38500
    Caption = #8595
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnYuukiDelClick
  end
  object btnYuukiAdd: TButton
    Left = 644
    Top = 236
    Width = 34
    Height = 25
    Hint = #36861#21152
    Caption = #8593
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = btnYuukiAddClick
  end
  object Bttop: TButton
    Left = 8
    Top = 240
    Width = 137
    Height = 25
    Caption = #25351#23450#32933#26009#12434#19968#30058#19978#12395#31227#21205
    TabOrder = 9
    OnClick = BttopClick
  end
  object Eken: TEdit
    Left = 72
    Top = 583
    Width = 121
    Height = 20
    TabOrder = 10
  end
  object BtKensaku: TBitBtn
    Left = 199
    Top = 583
    Width = 106
    Height = 25
    Caption = #26908#32034#23455#34892
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 11
    OnClick = BtKensakuClick
  end
  object SuiList: TListBox
    Left = 340
    Top = 105
    Width = 221
    Height = 129
    ItemHeight = 12
    TabOrder = 12
    OnDblClick = SuiListDblClick
  end
  object btnSuiAdd: TButton
    Left = 416
    Top = 240
    Width = 34
    Height = 25
    Hint = #36861#21152
    Caption = #8593
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = btnSuiAddClick
  end
  object btnSuiDel: TButton
    Left = 460
    Top = 240
    Width = 34
    Height = 25
    Hint = #21066#38500
    Caption = #8595
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = btnSuiDelClick
  end
  object ds1: TDataSource
    DataSet = ADOTable1
    Left = 488
    Top = 40
  end
  object ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    AfterPost = ADOTable1AfterPost
    AfterScroll = ADOTable1AfterScroll
    TableName = 'M_SAKHI'
    Left = 416
    Top = 40
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 248
    Top = 40
  end
  object ADOQuery2: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 344
    Top = 40
  end
end

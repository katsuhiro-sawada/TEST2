object frmUkeTaihi: TfrmUkeTaihi
  Left = 89
  Top = 256
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #22534#32933#21463#20184
  ClientHeight = 628
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object StatusBar1: TStatusBar
    Left = 0
    Top = 611
    Width = 767
    Height = 17
    Panels = <>
    ParentColor = True
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    object btnNew: TBitBtn
      Left = 8
      Top = 8
      Width = 95
      Height = 25
      Caption = #26032#35215'(&N)'
      DoubleBuffered = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777770000000777770000000000770000000777770FFFFFFFF07700000007777
        70F000000F0770000000777770FFFFFFFF0770000000777770F000000F077000
        0000777770FFFFFFFF07700000007F778FF000000F077000000078778BFFFFFF
        FF0770000000777F8F8000F00007700000007888FB7FFFF0F077700000007FB8
        BFBFBFB0077770000000778B8B8B000077777000000078B78F78B77777777000
        00007B778B778F7777777000000077778F777777777770000000777777777777
        777770000000}
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnEdit: TBitBtn
      Left = 104
      Top = 8
      Width = 95
      Height = 25
      Caption = #20462#27491'(&E)'
      DoubleBuffered = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDel: TBitBtn
      Left = 200
      Top = 8
      Width = 95
      Height = 25
      Caption = #21066#38500'(&D)'
      DoubleBuffered = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888800008888888888888888889800008898888888888888898800008899
        88777777777798880000889990000000000998880000888990BFFFBFFF998888
        0000888899FCCCCCCF97888800008888999FBFFFB9978888000088888999CCC9
        990788880000888880999FB99F0788880000888880FC9999CF07888800008888
        80FF9999BF0788880000888880FC9999000788880000888880B99F099F078888
        0000888880999F099998888800008888999FBF0F089988880000889999000000
        8889988800008899988888888888898800008888888888888888889800008888
        88888888888888880000}
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
      OnClick = btnDelClick
    end
    object btnPost: TBitBtn
      Left = 400
      Top = 8
      Width = 95
      Height = 25
      Caption = #30331#37682'(&P)'
      DoubleBuffered = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 3
      OnClick = btnPostClick
    end
    object btnCancel: TBitBtn
      Left = 500
      Top = 8
      Width = 101
      Height = 25
      Cancel = True
      Caption = #65399#65388#65437#65406#65433'(&C)'
      DoubleBuffered = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 4
      OnClick = btnCancelClick
    end
    object btnClose: TBitBtn
      Left = 652
      Top = 8
      Width = 95
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
      TabOrder = 5
      OnClick = btnCloseClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 767
    Height = 40
    Align = alTop
    ParentColor = True
    TabOrder = 2
    object Label13: TLabel
      Left = 8
      Top = 12
      Width = 75
      Height = 12
      Caption = #12469#12531#12503#12523#30058#21495#65306
    end
    object txtSampleNo: TDBEdit
      Left = 84
      Top = 8
      Width = 53
      Height = 20
      DataField = #12469#12531#12503#12523#30058#21495
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 0
      OnExit = txtSampleNoExit
      OnKeyPress = EnterKeyPress
    end
    object btnSNo: TButton
      Left = 140
      Top = 8
      Width = 41
      Height = 21
      Caption = #26908#32034
      TabOrder = 1
      OnClick = btnSNoClick
    end
    object DBNavigator1: TDBNavigator
      Left = 204
      Top = 12
      Width = 96
      Height = 21
      DataSource = ds1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 209
    Width = 767
    Height = 80
    Align = alTop
    ParentColor = True
    TabOrder = 3
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 72
      Height = 12
      Caption = #32076#12288#36942#12288#24180#12288#25968
    end
    object Label2: TLabel
      Left = 176
      Top = 16
      Width = 12
      Height = 12
      Caption = #24180
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 96
      Height = 12
      Caption = #22534#32933#25955#24067#20104#23450#26178#26399
    end
    object Label4: TLabel
      Left = 176
      Top = 48
      Width = 12
      Height = 12
      Caption = #24180
    end
    object Label5: TLabel
      Left = 264
      Top = 48
      Width = 32
      Height = 12
      Caption = #26376#12288#38915
    end
    object DBEdit2: TDBEdit
      Left = 112
      Top = 8
      Width = 49
      Height = 20
      DataField = #32076#36942#24180#25968
      DataSource = ds1
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 112
      Top = 40
      Width = 49
      Height = 20
      DataField = #25955#24067#20104#23450#24180
      DataSource = ds1
      TabOrder = 1
    end
    object DBEdit9: TDBEdit
      Left = 200
      Top = 40
      Width = 49
      Height = 20
      DataField = #25955#24067#20104#23450#26376
      DataSource = ds1
      TabOrder = 2
    end
  end
  object gb5: TGroupBox
    Left = 0
    Top = 289
    Width = 767
    Height = 144
    Align = alTop
    Caption = #22534#32933#21407#26009
    TabOrder = 4
    object Label15: TLabel
      Left = 152
      Top = 22
      Width = 48
      Height = 12
      Caption = #27083#25104#21106#21512
    end
    object Shape1: TShape
      Left = 136
      Top = 16
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape2: TShape
      Left = 32
      Top = 16
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Label16: TLabel
      Left = 72
      Top = 24
      Width = 24
      Height = 12
      Caption = #38917#30446
    end
    object Shape3: TShape
      Left = 136
      Top = 40
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape4: TShape
      Left = 136
      Top = 64
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape5: TShape
      Left = 136
      Top = 88
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape6: TShape
      Left = 136
      Top = 112
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape7: TShape
      Left = 32
      Top = 40
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Label17: TLabel
      Left = 64
      Top = 48
      Width = 34
      Height = 12
      Caption = #31282#12431#12425
    end
    object Shape8: TShape
      Left = 32
      Top = 64
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Shape9: TShape
      Left = 32
      Top = 88
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Label18: TLabel
      Left = 64
      Top = 72
      Width = 34
      Height = 12
      Caption = #40614#12431#12425
    end
    object Label19: TLabel
      Left = 64
      Top = 96
      Width = 34
      Height = 12
      Caption = #31870#12364#12425
    end
    object Shape10: TShape
      Left = 32
      Top = 112
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Label20: TLabel
      Left = 64
      Top = 120
      Width = 48
      Height = 12
      Caption = #20316#29289#27531#28195
    end
    object Label14: TLabel
      Left = 336
      Top = 22
      Width = 48
      Height = 12
      Caption = #27083#25104#21106#21512
    end
    object Shape11: TShape
      Left = 320
      Top = 16
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape12: TShape
      Left = 216
      Top = 16
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Label21: TLabel
      Left = 256
      Top = 24
      Width = 24
      Height = 12
      Caption = #38917#30446
    end
    object Shape13: TShape
      Left = 320
      Top = 40
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape14: TShape
      Left = 320
      Top = 64
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape15: TShape
      Left = 320
      Top = 88
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape16: TShape
      Left = 320
      Top = 112
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape17: TShape
      Left = 216
      Top = 40
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Label22: TLabel
      Left = 248
      Top = 48
      Width = 36
      Height = 12
      Caption = #29275#12405#12435
    end
    object Shape18: TShape
      Left = 216
      Top = 64
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Shape19: TShape
      Left = 216
      Top = 88
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Label23: TLabel
      Left = 248
      Top = 72
      Width = 36
      Height = 12
      Caption = #35930#12407#12435
    end
    object Label24: TLabel
      Left = 248
      Top = 96
      Width = 36
      Height = 12
      Caption = #40335#12405#12435
    end
    object Shape20: TShape
      Left = 216
      Top = 112
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Label25: TLabel
      Left = 248
      Top = 120
      Width = 36
      Height = 12
      Caption = #39340#12405#12435
    end
    object Label26: TLabel
      Left = 520
      Top = 22
      Width = 48
      Height = 12
      Caption = #27083#25104#21106#21512
    end
    object Shape21: TShape
      Left = 504
      Top = 16
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape22: TShape
      Left = 400
      Top = 16
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Label27: TLabel
      Left = 440
      Top = 24
      Width = 24
      Height = 12
      Caption = #38917#30446
    end
    object Shape23: TShape
      Left = 504
      Top = 40
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape24: TShape
      Left = 504
      Top = 64
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape25: TShape
      Left = 504
      Top = 88
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape26: TShape
      Left = 504
      Top = 112
      Width = 81
      Height = 25
      Brush.Style = bsClear
    end
    object Shape27: TShape
      Left = 400
      Top = 40
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Label28: TLabel
      Left = 432
      Top = 48
      Width = 47
      Height = 12
      Caption = #12391#12435#31881#31893
    end
    object Shape28: TShape
      Left = 400
      Top = 64
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Shape29: TShape
      Left = 400
      Top = 88
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Label29: TLabel
      Left = 432
      Top = 72
      Width = 24
      Height = 12
      Caption = #27531#22303
    end
    object Label30: TLabel
      Left = 432
      Top = 96
      Width = 48
      Height = 12
      Caption = #27738#27877#22534#32933
    end
    object Shape30: TShape
      Left = 400
      Top = 112
      Width = 105
      Height = 25
      Brush.Style = bsClear
    end
    object Label31: TLabel
      Left = 432
      Top = 120
      Width = 35
      Height = 12
      Caption = #12381#12398#20182
    end
    object Label39: TLabel
      Left = 200
      Top = 48
      Width = 6
      Height = 12
      Caption = '%'
    end
    object Label41: TLabel
      Left = 200
      Top = 72
      Width = 6
      Height = 12
      Caption = '%'
    end
    object Label42: TLabel
      Left = 200
      Top = 96
      Width = 6
      Height = 12
      Caption = '%'
    end
    object Label43: TLabel
      Left = 200
      Top = 120
      Width = 6
      Height = 12
      Caption = '%'
    end
    object Label44: TLabel
      Left = 384
      Top = 48
      Width = 6
      Height = 12
      Caption = '%'
    end
    object Label45: TLabel
      Left = 384
      Top = 72
      Width = 6
      Height = 12
      Caption = '%'
    end
    object Label46: TLabel
      Left = 384
      Top = 96
      Width = 6
      Height = 12
      Caption = '%'
    end
    object Label47: TLabel
      Left = 384
      Top = 120
      Width = 6
      Height = 12
      Caption = '%'
    end
    object Label48: TLabel
      Left = 568
      Top = 48
      Width = 6
      Height = 12
      Caption = '%'
    end
    object Label49: TLabel
      Left = 568
      Top = 72
      Width = 6
      Height = 12
      Caption = '%'
    end
    object Label50: TLabel
      Left = 568
      Top = 96
      Width = 6
      Height = 12
      Caption = '%'
    end
    object Label51: TLabel
      Left = 568
      Top = 120
      Width = 6
      Height = 12
      Caption = '%'
    end
    object DBEdit10: TDBEdit
      Left = 144
      Top = 42
      Width = 49
      Height = 20
      DataField = #31282#12431#12425
      DataSource = ds1
      TabOrder = 0
    end
    object DBEdit11: TDBEdit
      Left = 144
      Top = 66
      Width = 49
      Height = 20
      DataField = #40614#12431#12425
      DataSource = ds1
      TabOrder = 1
    end
    object DBEdit12: TDBEdit
      Left = 144
      Top = 90
      Width = 49
      Height = 20
      DataField = #31870#12364#12425
      DataSource = ds1
      TabOrder = 2
    end
    object DBEdit13: TDBEdit
      Left = 144
      Top = 114
      Width = 49
      Height = 20
      DataField = #20316#29289#27531#28195
      DataSource = ds1
      TabOrder = 3
    end
    object DBEdit14: TDBEdit
      Left = 328
      Top = 42
      Width = 49
      Height = 20
      DataField = #29275#12405#12435
      DataSource = ds1
      TabOrder = 4
    end
    object DBEdit15: TDBEdit
      Left = 328
      Top = 66
      Width = 49
      Height = 20
      DataField = #35930#12407#12435
      DataSource = ds1
      TabOrder = 5
    end
    object DBEdit16: TDBEdit
      Left = 328
      Top = 90
      Width = 49
      Height = 20
      DataField = #40335#12405#12435
      DataSource = ds1
      TabOrder = 6
    end
    object DBEdit17: TDBEdit
      Left = 328
      Top = 114
      Width = 49
      Height = 20
      DataField = #39340#12405#12435
      DataSource = ds1
      TabOrder = 7
    end
    object DBEdit18: TDBEdit
      Left = 512
      Top = 42
      Width = 49
      Height = 20
      DataField = #12391#12435#31881#31893
      DataSource = ds1
      TabOrder = 8
    end
    object DBEdit19: TDBEdit
      Left = 512
      Top = 66
      Width = 49
      Height = 20
      DataField = #27531#22303
      DataSource = ds1
      TabOrder = 9
    end
    object DBEdit20: TDBEdit
      Left = 512
      Top = 90
      Width = 49
      Height = 20
      DataField = #27738#27877#22534#32933
      DataSource = ds1
      TabOrder = 10
    end
    object DBEdit22: TDBEdit
      Left = 512
      Top = 114
      Width = 49
      Height = 20
      DataField = #12381#12398#20182
      DataSource = ds1
      TabOrder = 11
    end
    object BtWariCls: TButton
      Tag = 1
      Left = 592
      Top = 16
      Width = 43
      Height = 17
      Caption = #65400#65432#65393
      TabOrder = 12
      OnClick = BtWariClsClick
    end
  end
  object gb2: TGroupBox
    Left = 0
    Top = 81
    Width = 767
    Height = 128
    Align = alTop
    TabOrder = 5
    object Label7: TLabel
      Left = 264
      Top = 28
      Width = 30
      Height = 12
      Caption = #27663#21517#65306
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 56
      Top = 76
      Width = 30
      Height = 12
      Caption = #20303#25152#65306
    end
    object Label9: TLabel
      Left = 40
      Top = 100
      Width = 54
      Height = 12
      Caption = #38651#35441#30058#21495#65306
    end
    object Label10: TLabel
      Left = 212
      Top = 100
      Width = 52
      Height = 12
      Caption = 'FAX'#30058#21495#65306
    end
    object Label12: TLabel
      Left = 24
      Top = 28
      Width = 72
      Height = 12
      Caption = #32068#21512#21729#12467#12540#12489#65306
    end
    object Label6: TLabel
      Left = 260
      Top = 56
      Width = 66
      Height = 12
      Caption = #25505#21462#24180#26376#26085#65306
    end
    object Label11: TLabel
      Left = 32
      Top = 52
      Width = 63
      Height = 12
      Caption = #12469#12531#12503#12523#21517#65306
    end
    object Label53: TLabel
      Left = 388
      Top = 100
      Width = 30
      Height = 12
      Caption = #21306#20998#65306
    end
    object btnSHojou: TBitBtn
      Left = 180
      Top = 22
      Width = 69
      Height = 21
      Caption = #26908#32034#12539#26032#35215
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnSHojouClick
    end
    object DBEdit4: TDBEdit
      Left = 312
      Top = 24
      Width = 297
      Height = 20
      DataField = #36786#23478#21517
      DataSource = ds2
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 104
      Top = 72
      Width = 297
      Height = 20
      DataField = #20303#25152
      DataSource = ds2
      ReadOnly = True
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 104
      Top = 96
      Width = 89
      Height = 20
      DataField = #38651#35441#30058#21495
      DataSource = ds2
      ReadOnly = True
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 276
      Top = 96
      Width = 89
      Height = 20
      DataField = 'FAX'
      DataSource = ds2
      ReadOnly = True
      TabOrder = 5
      OnKeyPress = EnterKeyPress
    end
    object DBEdit8: TDBEdit
      Left = 104
      Top = 24
      Width = 69
      Height = 20
      DataField = #36786#23478#30058#21495
      DataSource = ds1
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object dtUketuke2: TDateTimePicker
      Left = 336
      Top = 48
      Width = 121
      Height = 20
      Date = 37545.625266203700000000
      Time = 37545.625266203700000000
      DateFormat = dfLong
      TabOrder = 6
      OnChange = dtUketuke2Change
      OnKeyPress = EnterKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 104
      Top = 48
      Width = 145
      Height = 20
      DataField = #12469#12531#12503#12523#21517
      DataSource = ds1
      TabOrder = 7
    end
    object DBEdit24: TDBEdit
      Left = 428
      Top = 96
      Width = 53
      Height = 20
      DataField = #21306#20998
      DataSource = ds2
      ReadOnly = True
      TabOrder = 8
      OnKeyPress = EnterKeyPress
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 433
    Width = 767
    Height = 96
    Align = alTop
    Caption = #22275#22580#26465#20214
    TabOrder = 6
    object Label32: TLabel
      Left = 34
      Top = 19
      Width = 30
      Height = 12
      Caption = #22303#22732#65306
    end
    object Label33: TLabel
      Left = 34
      Top = 43
      Width = 30
      Height = 12
      Caption = #22303#24615#65306
    end
    object Label34: TLabel
      Left = 264
      Top = 20
      Width = 54
      Height = 12
      Caption = #20104#23450#20316#30446#65306
    end
    object Label35: TLabel
      Left = 264
      Top = 44
      Width = 54
      Height = 12
      Caption = #20104#23450#20316#29289#65306
    end
    object Label36: TLabel
      Left = 264
      Top = 68
      Width = 54
      Height = 12
      Caption = #20104#23450#20316#22411#65306
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 74
      Top = 15
      Width = 145
      Height = 20
      DataField = #22303#22732#12467#12540#12489
      DataSource = ds1
      KeyField = #22303#22732#12467#12540#12489
      ListField = #22303#22732#21517
      ListSource = ds4
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 74
      Top = 39
      Width = 145
      Height = 20
      DataField = #22303#24615#12467#12540#12489
      DataSource = ds1
      KeyField = #22303#24615#12467#12540#12489
      ListField = #22303#24615#21517
      ListSource = ds5
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object cmbSakumoku: TDBLookupComboBox
      Left = 324
      Top = 16
      Width = 145
      Height = 20
      DataField = #20316#30446#12467#12540#12489
      DataSource = ds1
      KeyField = #20316#30446#12467#12540#12489
      ListField = #20316#30446#21517
      ListSource = dsSakumoku
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object cmbSakumotu: TDBLookupComboBox
      Left = 324
      Top = 40
      Width = 145
      Height = 20
      DataField = #20316#29289#12467#12540#12489
      DataSource = ds1
      DropDownRows = 20
      KeyField = #20316#29289#12467#12540#12489
      ListField = #20316#29289#21517
      ListSource = dsSakumotu
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object cmbSakugata: TDBLookupComboBox
      Left = 324
      Top = 64
      Width = 145
      Height = 20
      DataField = #20316#22411#12467#12540#12489
      DataSource = ds1
      KeyField = #20316#22411#12467#12540#12489
      ListField = #20316#22411#21517
      ListSource = dsSakugata
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object BtSakuCls1: TButton
      Tag = 1
      Left = 480
      Top = 16
      Width = 43
      Height = 17
      Caption = #65400#65432#65393
      TabOrder = 5
      OnClick = BtSakuCls1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 529
    Width = 767
    Height = 82
    Align = alClient
    TabOrder = 7
    object Label37: TLabel
      Left = 12
      Top = 48
      Width = 87
      Height = 12
      Caption = #12469#12531#12503#12523#25345#36796#26085#65306
    end
    object Label40: TLabel
      Left = 250
      Top = 48
      Width = 132
      Height = 12
      Caption = #21271#27996#20998#26512#12475#12531#12479#12540#21463#20184#26085#65306
    end
    object Label38: TLabel
      Left = 64
      Top = 20
      Width = 30
      Height = 12
      Caption = #20633#32771#65306
    end
    object Label52: TLabel
      Left = 543
      Top = 49
      Width = 52
      Height = 12
      Caption = #37329#38989'('#20870#65289#65306
    end
    object Label54: TLabel
      Left = 530
      Top = 25
      Width = 66
      Height = 12
      Caption = #36027#29992#36000#25285#32773#65306
    end
    object DateTimePicker1: TDateTimePicker
      Left = 104
      Top = 44
      Width = 121
      Height = 20
      Date = 37545.625266203700000000
      Time = 37545.625266203700000000
      DateFormat = dfLong
      TabOrder = 0
      OnChange = DateTimePicker1Change
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker4: TDateTimePicker
      Left = 384
      Top = 44
      Width = 121
      Height = 20
      Date = 37545.625266203700000000
      Time = 37545.625266203700000000
      DateFormat = dfLong
      TabOrder = 1
      OnChange = DateTimePicker4Change
      OnKeyPress = EnterKeyPress
    end
    object DBEdit23: TDBEdit
      Left = 104
      Top = 12
      Width = 281
      Height = 20
      DataField = #20633#32771
      DataSource = ds1
      TabOrder = 2
    end
    object DBEdit21: TDBEdit
      Left = 600
      Top = 44
      Width = 53
      Height = 20
      DataField = #37329#38989
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object BtKingaku: TButton
      Tag = 3
      Left = 660
      Top = 44
      Width = 65
      Height = 17
      Caption = #37329#38989#12475#12483#12488
      TabOrder = 4
      OnClick = BtKingakuClick
    end
    object DBFutan: TDBComboBox
      Left = 600
      Top = 16
      Width = 145
      Height = 20
      DataField = #36027#29992#36000#25285#32773
      DataSource = ds1
      TabOrder = 5
    end
  end
  object ds1: TDataSource
    DataSet = ADOQuery1
    OnStateChange = ds1StateChange
    OnDataChange = ds1DataChange
    Left = 612
    Top = 80
  end
  object ds2: TDataSource
    DataSet = QNouka
    Left = 520
    Top = 193
  end
  object ds4: TDataSource
    DataSet = ADOTable2
    Left = 196
    Top = 440
  end
  object ds5: TDataSource
    DataSet = ADOTable3
    Left = 196
    Top = 472
  end
  object dsSakumotu: TDataSource
    AutoEdit = False
    DataSet = QuerySakumotu
    Left = 516
    Top = 482
  end
  object dsSakugata: TDataSource
    AutoEdit = False
    DataSet = QuerySakugata
    Left = 660
    Top = 442
  end
  object dsSakumoku: TDataSource
    AutoEdit = False
    DataSet = QuerySakumoku
    Left = 660
    Top = 386
  end
  object QNouka: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 584
    Top = 224
  end
  object ADOTable2: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'M_DOJOU'
    Left = 32
    Top = 488
  end
  object ADOTable3: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'M_DOSEI'
    Left = 104
    Top = 480
  end
  object QKingaku: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 528
    Top = 560
  end
  object QuerySakumoku: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = ds1
    Parameters = <>
    SQL.Strings = (
      'select '#20316#30446#12467#12540#12489','#20316#30446#21517
      'from M_SAKUMOKU')
    Left = 608
    Top = 320
  end
  object QuerySakumotu: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = dsSakumoku
    Parameters = <
      item
        Name = #20316#30446#12467#12540#12489
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select '#20316#30446#12467#12540#12489','#20316#29289#12467#12540#12489','#20316#29289#21517
      'from M_SAKUMOTU'
      'where '#20316#30446#12467#12540#12489' = :'#20316#30446#12467#12540#12489)
    Left = 376
    Top = 512
  end
  object QuerySakugata: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = dsSakumotu
    Parameters = <
      item
        Name = #20316#30446#12467#12540#12489
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = #20316#29289#12467#12540#12489
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select '#20316#30446#12467#12540#12489','#20316#29289#12467#12540#12489','#20316#22411#12467#12540#12489','#20316#22411#21517
      'from M_SAKUGATA'
      'where '#20316#30446#12467#12540#12489' = :'#20316#30446#12467#12540#12489' and '#20316#29289#12467#12540#12489' = :'#20316#29289#12467#12540#12489)
    Left = 616
    Top = 488
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    AfterInsert = ADOQuery1AfterInsert
    BeforePost = ADOQuery1BeforePost
    AfterPost = ADOQuery1AfterPost
    AfterCancel = ADOQuery1AfterCancel
    AfterScroll = ADOQuery1AfterScroll
    ParamCheck = False
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select * from T_UKETUKE2 order by '#12469#12531#12503#12523#30058#21495)
    Left = 664
    Top = 136
  end
end

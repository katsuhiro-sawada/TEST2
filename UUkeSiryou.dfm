object frmUkeSiryou: TfrmUkeSiryou
  Left = 44
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #39164#26009#21463#20184
  ClientHeight = 556
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object StatusBar1: TStatusBar
    Left = 0
    Top = 539
    Width = 752
    Height = 17
    Panels = <>
    ParentColor = True
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 752
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
      Left = 392
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
      Left = 492
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
      Left = 636
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
    Width = 752
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
      Top = 7
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
    Width = 752
    Height = 40
    Align = alTop
    ParentColor = True
    TabOrder = 3
    object Label1: TLabel
      Left = 32
      Top = 14
      Width = 78
      Height = 12
      Caption = #31895#39164#26009#21454#31339#24180#65306
    end
    object Label2: TLabel
      Left = 168
      Top = 16
      Width = 12
      Height = 12
      Caption = #24180
    end
    object Label3: TLabel
      Left = 208
      Top = 14
      Width = 78
      Height = 12
      Caption = #25773#31278#24460#32076#36942#24180#65306
    end
    object Label4: TLabel
      Left = 344
      Top = 16
      Width = 12
      Height = 12
      Caption = #24180
    end
    object DBEdit2: TDBEdit
      Left = 112
      Top = 8
      Width = 49
      Height = 20
      DataField = #21454#31339#24180
      DataSource = ds1
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 288
      Top = 8
      Width = 49
      Height = 20
      DataField = #32076#36942#24180#25968
      DataSource = ds1
      TabOrder = 1
    end
  end
  object gb2: TGroupBox
    Left = 0
    Top = 81
    Width = 752
    Height = 128
    Align = alTop
    TabOrder = 4
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
    object Label24: TLabel
      Left = 396
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
    object DBEdit11: TDBEdit
      Left = 436
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
  object GroupBox2: TGroupBox
    Left = 0
    Top = 457
    Width = 752
    Height = 82
    Align = alClient
    TabOrder = 5
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
    object Label23: TLabel
      Left = 64
      Top = 22
      Width = 30
      Height = 12
      Caption = #20633#32771#65306
    end
    object Label43: TLabel
      Left = 543
      Top = 46
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
    object DBEdit10: TDBEdit
      Left = 104
      Top = 14
      Width = 401
      Height = 20
      DataField = #20633#32771
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 2
      OnKeyPress = EnterKeyPress
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
      Left = 652
      Top = 44
      Width = 65
      Height = 17
      Caption = #37329#38989#12475#12483#12488
      TabOrder = 4
      OnClick = BtKingakuClick
    end
    object DBFutan: TDBComboBox
      Left = 598
      Top = 16
      Width = 145
      Height = 20
      DataField = #36027#29992#36000#25285#32773
      DataSource = ds1
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 249
    Width = 752
    Height = 88
    Align = alTop
    ParentColor = True
    TabOrder = 6
    object Label14: TLabel
      Left = 324
      Top = 32
      Width = 54
      Height = 12
      Caption = #35440#36796#38283#22987#65306
    end
    object Label15: TLabel
      Left = 36
      Top = 56
      Width = 54
      Height = 12
      Caption = #21454#31339#32066#20102#65306
    end
    object Label16: TLabel
      Left = 324
      Top = 56
      Width = 54
      Height = 12
      Caption = #35440#36796#32066#20102#65306
    end
    object Label17: TLabel
      Left = 36
      Top = 8
      Width = 72
      Height = 12
      Caption = #29287#33609#21454#31339#26178#26399
    end
    object Label18: TLabel
      Left = 324
      Top = 8
      Width = 103
      Height = 12
      Caption = #12469#12452#12524#12540#12472#35440#36796#26178#26399
    end
    object Label5: TLabel
      Left = 36
      Top = 32
      Width = 54
      Height = 12
      Caption = #21454#31339#38283#22987#65306
    end
    object DateTimePicker5: TDateTimePicker
      Left = 104
      Top = 28
      Width = 121
      Height = 20
      Date = 37545.625266203700000000
      Time = 37545.625266203700000000
      DateFormat = dfLong
      TabOrder = 0
      OnChange = DateTimePicker5Change
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker6: TDateTimePicker
      Left = 384
      Top = 28
      Width = 121
      Height = 20
      Date = 37545.625266203700000000
      Time = 37545.625266203700000000
      DateFormat = dfLong
      TabOrder = 1
      OnChange = DateTimePicker6Change
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker7: TDateTimePicker
      Left = 104
      Top = 52
      Width = 121
      Height = 20
      Date = 37545.625266203700000000
      Time = 37545.625266203700000000
      DateFormat = dfLong
      TabOrder = 2
      OnChange = DateTimePicker7Change
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker8: TDateTimePicker
      Left = 384
      Top = 52
      Width = 121
      Height = 20
      Date = 37545.625266203700000000
      Time = 37545.625266203700000000
      DateFormat = dfLong
      TabOrder = 3
      OnChange = DateTimePicker8Change
      OnKeyPress = EnterKeyPress
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 337
    Width = 752
    Height = 40
    Align = alTop
    ParentColor = True
    TabOrder = 7
    object Label19: TLabel
      Left = 36
      Top = 14
      Width = 54
      Height = 12
      Caption = #31895#39164#26009#21517#65306
    end
    object DBSName: TDBComboBox
      Left = 104
      Top = 8
      Width = 161
      Height = 20
      Style = csDropDownList
      DataField = #39164#26009#21517
      DataSource = ds1
      Items.Strings = (
        #12458#12540#12481#12515#12540#12489
        #12481#12514#12471#12540
        #12452#12493#31185#20027#20307#28151#25773
        #12510#12513#31185#20027#20307#28151#25773
        #12450#12523#12501#12449#12523#12501#12449
        #12488#12454#12514#12525#12467#12471)
      TabOrder = 0
      OnChange = DBSNameChange
    end
    object DBSName2: TDBComboBox
      Left = 272
      Top = 8
      Width = 105
      Height = 20
      Style = csDropDownList
      DataField = #39164#26009#31278#39006
      DataSource = ds1
      Items.Strings = (
        #20094#33609
        #12469#12452#12524#12540#12472
        #29983#33609)
      TabOrder = 1
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 377
    Width = 752
    Height = 40
    Align = alTop
    ParentColor = True
    TabOrder = 8
    object Label20: TLabel
      Left = 24
      Top = 14
      Width = 72
      Height = 12
      Caption = #21000#12426#21462#12426#30058#33609#65306
    end
    object Label21: TLabel
      Left = 168
      Top = 14
      Width = 24
      Height = 12
      Caption = #30058#33609
    end
    object DBEdit9: TDBEdit
      Left = 104
      Top = 8
      Width = 49
      Height = 20
      DataField = #21000#12426#21462#12426#30058#33609
      DataSource = ds1
      TabOrder = 0
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 417
    Width = 752
    Height = 40
    Align = alTop
    ParentColor = True
    TabOrder = 9
    object Label22: TLabel
      Left = 20
      Top = 14
      Width = 75
      Height = 12
      Caption = #29983#32946#12473#12486#12540#12472#65306
    end
    object DBSt02: TDBComboBox
      Left = 216
      Top = 8
      Width = 97
      Height = 20
      Style = csDropDownList
      DataField = #29983#32946#12473#12486#12540#12472
      DataSource = ds1
      Items.Strings = (
        #20986#31298#22987
        #20986#31298#26399
        #31298#25539#26399
        #38283#33457#26399
        #25104#29087#26399)
      TabOrder = 0
    end
    object DBSt01: TDBComboBox
      Left = 104
      Top = 8
      Width = 105
      Height = 20
      Style = csDropDownList
      DataField = #29983#32946#31278#39006
      DataSource = ds1
      Items.Strings = (
        #12452#12493#31185
        #12510#12513#31185
        #12488#12454#12514#12525#12467#12471)
      TabOrder = 1
      OnChange = DBSt01Change
    end
  end
  object Table1aaa: TTable
    AfterInsert = Table1aaaAfterInsert
    BeforePost = Table1aaaBeforePost
    AfterPost = Table1aaaAfterPost
    AfterCancel = Table1aaaAfterCancel
    AfterScroll = Table1aaaAfterScroll
    DatabaseName = 'DOJO'
    Filter = #21066#38500#12501#12521#12464'<>True'
    Filtered = True
    TableName = 'T_UKETUKE3.DB'
    Left = 456
    Top = 52
  end
  object ds1: TDataSource
    DataSet = ADOTable1
    OnStateChange = ds1StateChange
    OnDataChange = ds1DataChange
    Left = 612
    Top = 80
  end
  object QNoukaorg: TQuery
    DatabaseName = 'DOJO'
    SQL.Strings = (
      'select *'
      'from M_HOJOU,M_NOUKA,M_CITY,M_TIKU'
      'left outer join M_DOJOU on (M_HOJOU.'#22303#22732#12467#12540#12489' = M_DOJOU.'#22303#22732#12467#12540#12489')'
      'left outer join M_DOSEI on (M_HOJOU.'#22303#24615#12467#12540#12489' = M_DOSEI.'#22303#24615#12467#12540#12489')'
      'left outer join M_FUSHOKU on (M_HOJOU.'#33104#26893#12467#12540#12489' = M_FUSHOKU.'#33104#26893#12467#12540#12489')'
      'where M_HOJOU.'#36786#23478#30058#21495'=M_NOUKA.'#36786#23478#30058#21495' and'
      'M_HOJOU.'#22275#22580#30058#21495' = :'#22275#22580#30058#21495' and'
      'M_HOJOU.'#24066#30010#26449#12467#12540#12489' = M_CITY.'#24066#30010#26449#12467#12540#12489' and'
      'M_HOJOU.'#24066#30010#26449#12467#12540#12489' = M_TIKU.'#24066#30010#26449#12467#12540#12489' and'
      'M_HOJOU.'#22320#21306#12467#12540#12489' = M_TIKU.'#22320#21306#12467#12540#12489' ')
    Left = 528
    Top = 281
    ParamData = <
      item
        DataType = ftUnknown
        Name = #22275#22580#30058#21495
        ParamType = ptUnknown
      end>
  end
  object ds2: TDataSource
    DataSet = QNouka
    Left = 568
    Top = 193
  end
  object QKingakuorg: TQuery
    DatabaseName = 'DOJO'
    DataSource = ds1
    SQL.Strings = (
      'select *'
      'from M_HOJOU,M_NOUKA,M_CITY,M_TIKU'
      'left outer join M_DOJOU on (M_HOJOU.'#22303#22732#12467#12540#12489' = M_DOJOU.'#22303#22732#12467#12540#12489')'
      'left outer join M_DOSEI on (M_HOJOU.'#22303#24615#12467#12540#12489' = M_DOSEI.'#22303#24615#12467#12540#12489')'
      'left outer join M_FUSHOKU on (M_HOJOU.'#33104#26893#12467#12540#12489' = M_FUSHOKU.'#33104#26893#12467#12540#12489')'
      'where M_HOJOU.'#36786#23478#30058#21495'=M_NOUKA.'#36786#23478#30058#21495' and'
      'M_HOJOU.'#22275#22580#30058#21495' = :'#22275#22580#30058#21495' and'
      'M_HOJOU.'#24066#30010#26449#12467#12540#12489' = M_CITY.'#24066#30010#26449#12467#12540#12489' and'
      'M_HOJOU.'#24066#30010#26449#12467#12540#12489' = M_TIKU.'#24066#30010#26449#12467#12540#12489' and'
      'M_HOJOU.'#22320#21306#12467#12540#12489' = M_TIKU.'#22320#21306#12467#12540#12489' '
      ' '
      '')
    Left = 496
    Top = 388
    ParamData = <
      item
        DataType = ftString
        Name = #22275#22580#30058#21495
        ParamType = ptUnknown
      end>
  end
  object ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    AfterInsert = ADOTable1AfterInsert
    BeforePost = ADOTable1BeforePost
    AfterPost = ADOTable1AfterPost
    AfterCancel = ADOTable1AfterCancel
    AfterScroll = ADOTable1AfterScroll
    IndexFieldNames = #12469#12531#12503#12523#30058#21495
    TableName = 'T_UKETUKE3'
    Left = 680
    Top = 80
  end
  object QNouka: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 664
    Top = 256
  end
  object QKingaku: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 608
    Top = 424
  end
end

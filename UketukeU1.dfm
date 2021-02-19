object frmUketuke1: TfrmUketuke1
  Left = 125
  Top = 1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #21463#20184
  ClientHeight = 721
  ClientWidth = 890
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #12513#12452#12522#12458
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 24
  object StatusBar1: TStatusBar
    Left = 0
    Top = 702
    Width = 890
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 890
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 0
    object btnNew: TBitBtn
      Left = 3
      Top = 8
      Width = 95
      Height = 25
      Caption = #26032#35215'(&N)'
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
      ParentFont = False
      TabOrder = 2
      OnClick = btnDelClick
    end
    object btnPost: TBitBtn
      Left = 311
      Top = 9
      Width = 95
      Height = 25
      Caption = #30331#37682'(&P)'
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
      ParentFont = False
      TabOrder = 3
      OnClick = btnPostClick
    end
    object btnCancel: TBitBtn
      Left = 412
      Top = 8
      Width = 101
      Height = 25
      Cancel = True
      Caption = #65399#65388#65437#65406#65433'(&C)'
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
      ParentFont = False
      TabOrder = 4
      OnClick = btnCancelClick
    end
    object btnClose: TBitBtn
      Left = 625
      Top = 8
      Width = 95
      Height = 25
      Caption = #38281#12376#12427'(&X)'
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
      ParentFont = False
      TabOrder = 5
      OnClick = btnCloseClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 890
    Height = 70
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 3
    object Label13: TLabel
      Left = 8
      Top = 12
      Width = 80
      Height = 24
      Caption = #21463#20184#36899#30058#65306
    end
    object Label9: TLabel
      Left = 335
      Top = 6
      Width = 111
      Height = 55
      Caption = #35519#25972#20013
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clRed
      Font.Height = -37
      Font.Name = #12513#12452#12522#12458
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txtSampleNo: TDBEdit
      Left = 84
      Top = 8
      Width = 72
      Height = 32
      DataField = #21463#20184#36899#30058
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 0
      OnExit = txtSampleNoExit
      OnKeyPress = EnterKeyPress
    end
    object btnSNo: TButton
      Left = 186
      Top = 6
      Width = 102
      Height = 43
      Caption = #26908#32034
      TabOrder = 1
      OnClick = btnSNoClick
    end
    object DBNavigator1: TDBNavigator
      Left = 84
      Top = 43
      Width = 96
      Height = 21
      DataSource = ds1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 646
    Width = 890
    Height = 56
    Align = alBottom
    TabOrder = 4
    object Label50: TLabel
      Left = 96
      Top = 18
      Width = 48
      Height = 24
      Caption = #20633#32771#65306
    end
    object DBEdit23: TDBEdit
      Left = 166
      Top = 18
      Width = 413
      Height = 32
      DataField = #20633#32771
      DataSource = ds1
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 497
    Width = 890
    Height = 149
    Align = alClient
    TabOrder = 5
    object Label14: TLabel
      Left = 77
      Top = 19
      Width = 64
      Height = 24
      Caption = #36895#22577#26085#65306
    end
    object Label15: TLabel
      Left = 350
      Top = 19
      Width = 64
      Height = 24
      Caption = #30330#36865#26085#65306
    end
    object Label16: TLabel
      Left = 642
      Top = 8
      Width = 48
      Height = 24
      Caption = #36092#36023#22806
    end
    object Label17: TLabel
      Left = 642
      Top = 32
      Width = 64
      Height = 24
      Caption = #20837#21147#26085#65306
    end
    object Label18: TLabel
      Left = 78
      Top = 102
      Width = 64
      Height = 24
      Caption = #35336#19978#26085#65306
    end
    object Label19: TLabel
      Left = 350
      Top = 102
      Width = 64
      Height = 24
      Caption = #22238#21454#26085#65306
    end
    object Label20: TLabel
      Left = 350
      Top = 59
      Width = 64
      Height = 24
      Caption = #30330#36865#20808#65306
    end
    object DBEdit8: TDBEdit
      Left = 163
      Top = 14
      Width = 129
      Height = 32
      DataField = #36895#22577#26085
      DataSource = ds1
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker3: TDateTimePicker
      Left = 298
      Top = 14
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 1
      OnChange = DateTimePicker3Change
    end
    object DBEdit9: TDBEdit
      Left = 436
      Top = 14
      Width = 129
      Height = 32
      DataField = #30330#36865#26085
      DataSource = ds1
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker4: TDateTimePicker
      Left = 571
      Top = 14
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 3
      OnChange = DateTimePicker4Change
    end
    object DBEdit10: TDBEdit
      Left = 714
      Top = 14
      Width = 129
      Height = 32
      DataField = #36092#36023#22806#20837#21147#26085
      DataSource = ds1
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker5: TDateTimePicker
      Left = 849
      Top = 14
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 5
      OnChange = DateTimePicker5Change
    end
    object DBEdit11: TDBEdit
      Left = 164
      Top = 97
      Width = 129
      Height = 32
      DataField = #35336#19978#26085
      DataSource = ds1
      TabOrder = 6
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker6: TDateTimePicker
      Left = 299
      Top = 97
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 7
      OnChange = DateTimePicker6Change
    end
    object DBEdit12: TDBEdit
      Left = 436
      Top = 97
      Width = 129
      Height = 32
      DataField = #22238#21454#26085
      DataSource = ds1
      TabOrder = 8
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker7: TDateTimePicker
      Left = 571
      Top = 97
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 9
      OnChange = DateTimePicker7Change
    end
    object DBEdit13: TDBEdit
      Left = 436
      Top = 56
      Width = 407
      Height = 32
      DataField = #30330#36865#20808
      DataSource = ds1
      TabOrder = 10
      OnKeyPress = EnterKeyPress
    end
  end
  object gb2: TGroupBox
    Left = 0
    Top = 111
    Width = 890
    Height = 386
    Align = alTop
    TabOrder = 1
    object Label6: TLabel
      Left = 62
      Top = 12
      Width = 96
      Height = 24
      Caption = #21463#20184#24180#26376#26085#65306
    end
    object Label1: TLabel
      Left = 61
      Top = 46
      Width = 96
      Height = 24
      Caption = #22577#21578#24076#26395#26085#65306
    end
    object Label2: TLabel
      Left = 93
      Top = 91
      Width = 64
      Height = 24
      Caption = #32068#21512#21517#65306
    end
    object Label3: TLabel
      Left = 92
      Top = 121
      Width = 64
      Height = 24
      Caption = #25903#24215#21517#65306
    end
    object Label4: TLabel
      Left = 77
      Top = 171
      Width = 80
      Height = 24
      Caption = #20104#23450#20316#29289#65306
    end
    object Label5: TLabel
      Left = 114
      Top = 244
      Width = 96
      Height = 24
      Caption = #65306#22522#26412#12475#12483#12488
    end
    object Label7: TLabel
      Left = 335
      Top = 244
      Width = 160
      Height = 24
      Caption = #65306#22522#26412#65291#12511#12493#12521#12523#25104#20998
    end
    object Label8: TLabel
      Left = 551
      Top = 244
      Width = 64
      Height = 24
      Caption = #65306#20840#25104#20998
    end
    object Label10: TLabel
      Left = 72
      Top = 301
      Width = 64
      Height = 24
      Caption = #35430#26009#25968#65306
      Visible = False
    end
    object Label11: TLabel
      Left = 329
      Top = 337
      Width = 16
      Height = 24
      Caption = #65374
      Visible = False
    end
    object Label12: TLabel
      Left = 72
      Top = 341
      Width = 72
      Height = 24
      Caption = #35430#26009'NO'#65306
      Visible = False
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 163
      Top = 85
      Width = 182
      Height = 32
      DataField = #32068#21512#30058#21495
      DataSource = ds1
      DropDownRows = 20
      KeyField = #32068#21512#30058#21495
      ListField = #32068#21512#21517
      ListSource = dskumiai
      TabOrder = 0
      OnDropDown = DBLookupComboBox1DropDown
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 163
      Top = 126
      Width = 269
      Height = 32
      DataField = #25903#24215#30058#21495
      DataSource = ds1
      DropDownRows = 20
      KeyField = #25903#24215#30058#21495
      ListField = #25903#24215#21517
      ListSource = dssiten
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 226
      Top = 171
      Width = 145
      Height = 32
      DataField = #20316#29289#12467#12540#12489
      DataSource = ds1
      DropDownRows = 20
      KeyField = #20316#29289#12467#12540#12489
      ListField = #20316#29289#21517
      ListSource = dsSakumotu
      TabOrder = 2
      OnDropDown = cmbSakumotuDropDown
      OnKeyPress = EnterKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 377
      Top = 171
      Width = 31
      Height = 32
      DataField = #20316#29289#20998#39006
      DataSource = dsSakumotu
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 163
      Top = 171
      Width = 57
      Height = 32
      DataField = #20316#29289#12467#12540#12489
      DataSource = ds1
      DropDownRows = 20
      KeyField = #20316#29289#12467#12540#12489
      ListField = #20316#29289#12467#12540#12489
      ListSource = dsSakumotu
      TabOrder = 4
      OnDropDown = cmbSakumotuDropDown
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker2: TDateTimePicker
      Left = 290
      Top = 5
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 5
      OnChange = DateTimePicker2Change
    end
    object DBEdit2: TDBEdit
      Left = 163
      Top = 6
      Width = 121
      Height = 32
      DataField = #21463#20184#24180#26376#26085
      DataSource = ds1
      TabOrder = 6
      OnKeyPress = EnterKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 164
      Top = 294
      Width = 59
      Height = 32
      DataField = #35430#26009#25968
      DataSource = ds1
      TabOrder = 7
      Visible = False
      OnKeyPress = EnterKeyPress
    end
    object Button1: TButton
      Left = 262
      Top = 294
      Width = 163
      Height = 33
      Caption = #21463#20184'NO'#20316#25104
      TabOrder = 8
      Visible = False
      OnClick = Button1Click
    end
    object DBEdit4: TDBEdit
      Left = 466
      Top = 294
      Width = 143
      Height = 32
      DataField = #21463#20184'NO'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 9
      Visible = False
      OnKeyPress = EnterKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 164
      Top = 332
      Width = 143
      Height = 32
      DataField = #35430#26009'NO'#38283#22987
      DataSource = ds1
      ReadOnly = True
      TabOrder = 10
      Visible = False
      OnKeyPress = EnterKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 369
      Top = 332
      Width = 143
      Height = 32
      DataField = #35430#26009'NO'#32066#20102
      DataSource = ds1
      ReadOnly = True
      TabOrder = 11
      Visible = False
      OnKeyPress = EnterKeyPress
    end
    object Memo1: TMemo
      Left = 436
      Top = 6
      Width = 429
      Height = 189
      Lines.Strings = (
        #12513#12514
        #12539#20316#29289#12398#65402#65392#65412#65438#12434#12461#12540#12508#12540#12489#20837#21147#12391#12365#12427#12424#12358#12395
        #12539#12479#12502#12398#31227#21205#38918#24207#25972#20633
        #12539#12513#12491#12517#12540#12508#12479#12531#22823#12365#12367
        #12539#26082#12395#35430#26009'NO'#12364#35373#23450#12373#12428#12390#12356#12427#12392#12365#12399#12289#35430#26009#25968#12434#22793#26356#12391
        #12365#12394#12356#12424#12358#12395#12377#12427
        '')
      TabOrder = 12
      Visible = False
      OnChange = Memo1Change
    end
    object DBEdit7: TDBEdit
      Left = 164
      Top = 42
      Width = 121
      Height = 32
      DataField = #22577#21578#24076#26395#26085
      DataSource = ds1
      TabOrder = 13
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker1: TDateTimePicker
      Left = 290
      Top = 42
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 14
      OnChange = DateTimePicker1Change
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 77
      Top = 212
      Width = 660
      Height = 65
      Caption = #20998#26512#38917#30446
      Color = clBtnFace
      Columns = 3
      Ctl3D = False
      DataField = #20998#26512#38917#30446
      DataSource = ds1
      Items.Strings = (
        'A'
        'B'
        'C')
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 15
    end
  end
  object ds1: TDataSource
    DataSet = ADOUketuke
    OnStateChange = ds1StateChange
    OnDataChange = ds1DataChange
    Left = 604
    Top = 40
  end
  object dsSakumotu: TDataSource
    AutoEdit = False
    DataSet = ADOQSakumotu
    Left = 244
    Top = 322
  end
  object ADOUketuke: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    AfterInsert = ADOUketukeAfterInsert
    BeforePost = ADOUketukeBeforePost
    AfterPost = ADOUketukeAfterPost
    AfterCancel = ADOUketukeAfterCancel
    AfterScroll = ADOUketukeAfterScroll
    IndexFieldNames = #21463#20184#36899#30058
    TableName = 'T_UKETUKE1'
    Left = 560
    Top = 40
  end
  object ADOQSakumotu: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <
      item
        Name = #20316#29289#20998#39006
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select '#20316#29289#12467#12540#12489','#20316#29289#21517','#20316#29289#20998#39006
      'from M_SAKUMOTU'
      'order by '#20316#29289#12467#12540#12489)
    Left = 208
    Top = 320
  end
  object dskumiai: TDataSource
    DataSet = ADOQkumiai
    OnStateChange = ds1StateChange
    Left = 44
    Top = 192
  end
  object dssiten: TDataSource
    DataSet = ADOQsiten
    OnStateChange = ds1StateChange
    OnDataChange = dssitenDataChange
    Left = 12
    Top = 296
  end
  object ADOQkumiai: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <
      item
        Name = #32068#21512#30058#21495
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = #32068#21512#21517
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select '#32068#21512#30058#21495','#32068#21512#21517' from M_NOUKYOU'
      'order by '#32068#21512#30058#21495)
    Left = 16
    Top = 200
  end
  object ADOQsiten: TADOQuery
    Connection = DataModule1.ADOConnection1
    DataSource = dskumiai
    Parameters = <
      item
        Name = #32068#21512#30058#21495
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select '#32068#21512#30058#21495','#25903#24215#30058#21495','#25903#24215#21517
      'from M_SISYO'
      'where '#32068#21512#30058#21495' = :'#32068#21512#30058#21495
      'order by '#32068#21512#30058#21495)
    Left = 24
    Top = 256
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <
      item
        Name = #32068#21512#30058#21495
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = #32068#21512#21517
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select '#32068#21512#30058#21495','#32068#21512#21517' from M_NOUKYOU'
      'order by '#32068#21512#30058#21495)
    Left = 696
    Top = 392
  end
end

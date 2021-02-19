object frmUketuke6: TfrmUketuke6
  Left = 125
  Top = 1
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #21463#20184
  ClientHeight = 819
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 890
    Height = 57
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      890
      57)
    object btnNew: TBitBtn
      Left = 7
      Top = 6
      Width = 113
      Height = 43
      Anchors = [akTop, akRight]
      Caption = #26032#35215
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Yu Gothic UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnNewClick
    end
    object btnEdit: TBitBtn
      Left = 126
      Top = 6
      Width = 113
      Height = 43
      Anchors = [akTop, akRight]
      Caption = #20462#27491
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Yu Gothic UI'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDel: TBitBtn
      Left = 245
      Top = 6
      Width = 113
      Height = 43
      Anchors = [akTop, akRight]
      Caption = #21066#38500
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Yu Gothic UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnDelClick
    end
    object btnPost: TBitBtn
      Left = 449
      Top = 6
      Width = 113
      Height = 43
      Anchors = [akTop, akRight]
      Caption = #30331#37682
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Yu Gothic UI'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 3
      OnClick = btnPostClick
    end
    object btnCancel: TBitBtn
      Left = 568
      Top = 6
      Width = 113
      Height = 43
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #65399#65388#65437#65406#65433
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Yu Gothic UI'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
      OnClick = btnCancelClick
    end
    object btnClose: TBitBtn
      Left = 769
      Top = 6
      Width = 113
      Height = 43
      Anchors = [akTop, akRight]
      Caption = #38281#12376#12427
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 5
      OnClick = btnCloseClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 57
    Width = 890
    Height = 72
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 2
    ExplicitTop = 55
    object Label13: TLabel
      Left = 15
      Top = 11
      Width = 129
      Height = 24
      Alignment = taRightJustify
      AutoSize = False
      Caption = #21463#20184#36899#30058#65306
    end
    object txtSampleNo: TDBEdit
      Left = 150
      Top = 9
      Width = 96
      Height = 32
      DataField = #21463#20184#36899#30058
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 0
      OnExit = txtSampleNoExit
      OnKeyPress = EnterKeyPress
    end
    object btnSNo: TButton
      Left = 253
      Top = 9
      Width = 67
      Height = 32
      Caption = #26908#32034
      TabOrder = 1
      OnClick = btnSNoClick
    end
    object DBNavigator1: TDBNavigator
      Left = 151
      Top = 42
      Width = 96
      Height = 21
      DataSource = ds1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 755
    Width = 890
    Height = 64
    Align = alClient
    TabOrder = 3
    object Label50: TLabel
      Left = 97
      Top = 18
      Width = 48
      Height = 24
      Alignment = taRightJustify
      Caption = #20633#32771#65306
    end
    object DBEdit23: TDBEdit
      Left = 151
      Top = 15
      Width = 709
      Height = 32
      DataField = #20633#32771
      DataSource = ds1
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 609
    Width = 890
    Height = 146
    Align = alTop
    TabOrder = 4
    object Label14: TLabel
      Left = 16
      Top = 19
      Width = 129
      Height = 24
      Alignment = taRightJustify
      AutoSize = False
      Caption = #36895#22577#26085#65306
    end
    object Label15: TLabel
      Left = 350
      Top = 7
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
      Left = 81
      Top = 102
      Width = 64
      Height = 24
      Alignment = taRightJustify
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
    object Label9: TLabel
      Left = 335
      Top = 27
      Width = 80
      Height = 24
      Caption = #65288#22577#21578#26085#65289
    end
    object DBEdit8: TDBEdit
      Left = 151
      Top = 14
      Width = 121
      Height = 32
      DataField = #36895#22577#26085
      DataSource = ds1
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker3: TDateTimePicker
      Left = 272
      Top = 14
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 1
      OnChange = DateTimePicker3Change
    end
    object DBEdit9: TDBEdit
      Left = 420
      Top = 18
      Width = 121
      Height = 32
      DataField = #30330#36865#26085
      DataSource = ds1
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker4: TDateTimePicker
      Left = 541
      Top = 18
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 3
      OnChange = DateTimePicker4Change
    end
    object DBEdit10: TDBEdit
      Left = 714
      Top = 18
      Width = 129
      Height = 32
      DataField = #36092#36023#22806#20837#21147#26085
      DataSource = ds1
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker5: TDateTimePicker
      Left = 843
      Top = 18
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 5
      OnChange = DateTimePicker5Change
    end
    object DBEdit11: TDBEdit
      Left = 151
      Top = 97
      Width = 121
      Height = 32
      DataField = #35336#19978#26085
      DataSource = ds1
      TabOrder = 6
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker6: TDateTimePicker
      Left = 272
      Top = 97
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 7
      OnChange = DateTimePicker6Change
    end
    object DBEdit12: TDBEdit
      Left = 420
      Top = 97
      Width = 121
      Height = 32
      DataField = #22238#21454#26085
      DataSource = ds1
      TabOrder = 8
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker7: TDateTimePicker
      Left = 541
      Top = 97
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 9
      OnChange = DateTimePicker7Change
    end
    object DBEdit13: TDBEdit
      Left = 420
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
    Top = 129
    Width = 890
    Height = 480
    Align = alTop
    BiDiMode = bdLeftToRight
    Color = clBtnFace
    ParentBackground = False
    ParentBiDiMode = False
    ParentColor = False
    TabOrder = 1
    object Label6: TLabel
      Left = 15
      Top = 65
      Width = 129
      Height = 24
      Alignment = taRightJustify
      AutoSize = False
      Caption = #21463#20184#24180#26376#26085#65306
    end
    object Label1: TLabel
      Left = 327
      Top = 65
      Width = 96
      Height = 24
      Alignment = taRightJustify
      Caption = #22577#21578#24076#26395#26085#65306
    end
    object Label2: TLabel
      Left = 16
      Top = 107
      Width = 129
      Height = 24
      Alignment = taRightJustify
      AutoSize = False
      Caption = #32068#21512#21517#65306
    end
    object Label3: TLabel
      Left = 391
      Top = 107
      Width = 129
      Height = 24
      Alignment = taRightJustify
      AutoSize = False
      Caption = #25903#24215#21517#65306
    end
    object Label4: TLabel
      Left = 16
      Top = 149
      Width = 129
      Height = 24
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20316#29289#21306#20998#65306
    end
    object Label10: TLabel
      Left = 16
      Top = 337
      Width = 129
      Height = 24
      Alignment = taRightJustify
      AutoSize = False
      Caption = #35430#26009#25968#65306
    end
    object Label11: TLabel
      Left = 711
      Top = 337
      Width = 16
      Height = 24
      Caption = #65374
    end
    object Label12: TLabel
      Left = 516
      Top = 337
      Width = 98
      Height = 24
      Caption = #65295'  '#35430#26009'NO'#65306
    end
    object Label5: TLabel
      Left = 16
      Top = 191
      Width = 129
      Height = 24
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20998#26512#38917#30446#65306
    end
    object Label21: TLabel
      Left = 15
      Top = 23
      Width = 129
      Height = 24
      Alignment = taRightJustify
      AutoSize = False
      Caption = #25285#24403#32773#65306
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 213
      Top = 105
      Width = 219
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
      Left = 590
      Top = 105
      Width = 219
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
      Left = 215
      Top = 147
      Width = 145
      Height = 32
      DataField = #20316#29289#20998#39006
      DataSource = ds1
      DropDownRows = 20
      KeyField = #12467#12540#12489
      ListField = #20998#39006#21517
      ListSource = dsSakumotu
      TabOrder = 2
      OnDropDown = cmbSakumotuDropDown
      OnKeyPress = EnterKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 151
      Top = 147
      Width = 58
      Height = 32
      DataField = #20316#29289#20998#39006
      DataSource = ds1
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker2: TDateTimePicker
      Left = 271
      Top = 63
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 4
      OnChange = DateTimePicker2Change
    end
    object DBEdit2: TDBEdit
      Left = 150
      Top = 63
      Width = 121
      Height = 32
      DataField = #21463#20184#24180#26376#26085
      DataSource = ds1
      TabOrder = 5
      OnKeyPress = EnterKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 150
      Top = 335
      Width = 59
      Height = 32
      DataField = #35430#26009#25968
      DataSource = ds1
      TabOrder = 6
      OnKeyPress = EnterKeyPress
    end
    object Button1: TButton
      Left = 215
      Top = 335
      Width = 130
      Height = 32
      Caption = #21463#20184'NO'#20316#25104
      TabOrder = 7
      OnClick = Button1Click
    end
    object DBEdit4: TDBEdit
      Left = 351
      Top = 337
      Width = 143
      Height = 32
      TabStop = False
      Color = clBtnFace
      DataField = #21463#20184'NO'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 8
      OnKeyPress = EnterKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 615
      Top = 335
      Width = 81
      Height = 32
      TabStop = False
      Color = clBtnFace
      DataField = #35430#26009'NO'#38283#22987
      DataSource = ds1
      ReadOnly = True
      TabOrder = 9
      OnKeyPress = EnterKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 749
      Top = 335
      Width = 76
      Height = 32
      TabStop = False
      Color = clBtnFace
      DataField = #35430#26009'NO'#32066#20102
      DataSource = ds1
      ReadOnly = True
      TabOrder = 10
      OnKeyPress = EnterKeyPress
    end
    object Memo1: TMemo
      Left = 438
      Top = 9
      Width = 429
      Height = 96
      Lines.Strings = (
        #12513#12514
        #12539#20316#29289#12398#65402#65392#65412#65438#12434#12461#12540#12508#12540#12489#20837#21147#12391#12365#12427#12424#12358#12395
        #12539#12479#12502#12398#31227#21205#38918#24207#25972#20633
        #12539#12513#12491#12517#12540#12508#12479#12531#22823#12365#12367
        #12539#26082#12395#35430#26009'NO'#12364#35373#23450#12373#12428#12390#12356#12427#12392#12365#12399#12289#35430
        #26009#25968#12434#22793#26356#12391
        #12365#12394#12356#12424#12358#12395#12377#12427
        '')
      TabOrder = 11
      Visible = False
    end
    object DBEdit7: TDBEdit
      Left = 429
      Top = 63
      Width = 121
      Height = 32
      DataField = #22577#21578#24076#26395#26085
      DataSource = ds1
      TabOrder = 12
      OnKeyPress = EnterKeyPress
    end
    object DateTimePicker1: TDateTimePicker
      Left = 550
      Top = 63
      Width = 17
      Height = 32
      Date = 44204.000000000000000000
      Time = 0.898608020834217300
      TabOrder = 13
      OnChange = DateTimePicker1Change
    end
    object DBEdit14: TDBEdit
      Left = 151
      Top = 105
      Width = 58
      Height = 32
      DataField = #32068#21512#30058#21495
      DataSource = ds1
      TabOrder = 14
      OnKeyPress = EnterKeyPress
    end
    object DBEdit15: TDBEdit
      Left = 526
      Top = 105
      Width = 58
      Height = 32
      DataField = #25903#24215#30058#21495
      DataSource = ds1
      TabOrder = 15
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 215
      Top = 189
      Width = 145
      Height = 32
      DataField = #20998#26512#38917#30446
      DataSource = ds1
      DropDownRows = 20
      KeyField = #12467#12540#12489
      ListField = #20998#26512#38917#30446
      ListSource = DsKoumoku
      TabOrder = 16
      OnDropDown = cmbSakumotuDropDown
      OnKeyPress = EnterKeyPress
    end
    object DBEdit16: TDBEdit
      Left = 151
      Top = 189
      Width = 58
      Height = 32
      DataField = #20998#26512#38917#30446
      DataSource = ds1
      TabOrder = 17
      OnKeyPress = EnterKeyPress
    end
    object Button2: TButton
      Left = 650
      Top = 384
      Width = 175
      Height = 34
      Caption = #21463#20184#35430#26009#19968#35239
      TabOrder = 18
      OnClick = Button2Click
    end
    object DBEdit17: TDBEdit
      Left = 150
      Top = 21
      Width = 159
      Height = 32
      DataField = #25285#24403#32773
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 19
      OnExit = txtSampleNoExit
      OnKeyPress = EnterKeyPress
    end
    object Panel4: TPanel
      Left = 378
      Top = 191
      Width = 460
      Height = 110
      BorderStyle = bsSingle
      TabOrder = 20
      object Label7: TLabel
        Left = 8
        Top = 0
        Width = 64
        Height = 24
        Caption = #36861#21152#38917#30446
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #12513#12452#12522#12458
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object DBCheckBox1: TDBCheckBox
        Left = 19
        Top = 30
        Width = 83
        Height = 17
        Caption = 'pH'
        Color = clWhite
        DataField = 'pH'#12501#12521#12464
        DataSource = ds1
        ParentColor = False
        TabOrder = 0
      end
      object DBCheckBox6: TDBCheckBox
        Left = 19
        Top = 53
        Width = 61
        Height = 17
        Caption = #21152#37324
        Color = clWhite
        DataField = #21152#37324#12501#12521#12464
        DataSource = ds1
        ParentColor = False
        TabOrder = 1
      end
      object DBCheckBox11: TDBCheckBox
        Left = 19
        Top = 76
        Width = 83
        Height = 17
        Caption = #33104#26893
        DataField = #33104#26893#12501#12521#12464
        DataSource = ds1
        TabOrder = 2
      end
      object DBCheckBox2: TDBCheckBox
        Left = 108
        Top = 30
        Width = 83
        Height = 17
        Caption = 'EC'
        DataField = 'EC'#12501#12521#12464
        DataSource = ds1
        TabOrder = 3
      end
      object DBCheckBox7: TDBCheckBox
        Left = 108
        Top = 53
        Width = 83
        Height = 17
        Caption = #12522#12531#37240
        DataField = #12522#12531#37240#12501#12521#12464
        DataSource = ds1
        TabOrder = 4
      end
      object DBCheckBox12: TDBCheckBox
        Left = 108
        Top = 76
        Width = 83
        Height = 17
        Caption = #12507#12454#32032
        DataField = #12507#12454#32032#12501#12521#12464
        DataSource = ds1
        TabOrder = 5
      end
      object DBCheckBox13: TDBCheckBox
        Left = 197
        Top = 76
        Width = 83
        Height = 17
        Caption = #12510#12531#12460#12531
        DataField = #12510#12531#12460#12531#12501#12521#12464
        DataSource = ds1
        TabOrder = 6
      end
      object DBCheckBox8: TDBCheckBox
        Left = 197
        Top = 53
        Width = 83
        Height = 17
        Caption = #31378#32032
        DataField = #31378#32032#12501#12521#12464
        DataSource = ds1
        TabOrder = 7
      end
      object DBCheckBox3: TDBCheckBox
        Left = 197
        Top = 30
        Width = 83
        Height = 17
        Caption = 'CEC'
        DataField = 'CEC'#12501#12521#12464
        DataSource = ds1
        TabOrder = 8
      end
      object DBCheckBox4: TDBCheckBox
        Left = 286
        Top = 30
        Width = 83
        Height = 17
        Caption = #30707#28784
        DataField = #30707#28784#12501#12521#12464
        DataSource = ds1
        TabOrder = 9
      end
      object DBCheckBox9: TDBCheckBox
        Left = 286
        Top = 53
        Width = 83
        Height = 17
        Caption = #12465#12452#37240
        DataField = #12465#12452#37240#12501#12521#12464
        DataSource = ds1
        TabOrder = 10
      end
      object DBCheckBox14: TDBCheckBox
        Left = 286
        Top = 76
        Width = 83
        Height = 17
        Caption = #37509
        DataField = #37509#12501#12521#12464
        DataSource = ds1
        TabOrder = 11
      end
      object DBCheckBox5: TDBCheckBox
        Left = 375
        Top = 30
        Width = 83
        Height = 17
        Caption = #33510#22303
        DataField = #33510#22303#12501#12521#12464
        DataSource = ds1
        TabOrder = 12
      end
      object DBCheckBox10: TDBCheckBox
        Left = 375
        Top = 53
        Width = 83
        Height = 17
        Caption = #37444
        DataField = #37444#12501#12521#12464
        DataSource = ds1
        TabOrder = 13
      end
      object DBCheckBox15: TDBCheckBox
        Left = 375
        Top = 76
        Width = 83
        Height = 17
        Caption = #20124#37467
        DataField = #20124#37467#12501#12521#12464
        DataSource = ds1
        TabOrder = 14
      end
    end
    object Panel5: TPanel
      Left = 151
      Top = 393
      Width = 242
      Height = 64
      BorderStyle = bsSingle
      TabOrder = 21
      object Label8: TLabel
        Left = 1
        Top = 1
        Width = 96
        Height = 58
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = #37329#38989':'
        Color = clBtnFace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Height = -32
        Font.Name = 'Yu Gothic UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        StyleElements = [seClient, seBorder]
      end
      object Lkingaku: TLabel
        AlignWithMargins = True
        Left = 100
        Top = 4
        Width = 127
        Height = 52
        Margins.Right = 10
        Align = alClient
        Alignment = taRightJustify
        Caption = 'XXXXXX'
        Color = clBtnFace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Yu Gothic UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        StyleElements = [seClient, seBorder]
        ExplicitLeft = 113
        ExplicitWidth = 114
        ExplicitHeight = 45
      end
    end
  end
  object ds1: TDataSource
    DataSet = ADOUketuke
    OnStateChange = ds1StateChange
    OnDataChange = ds1DataChange
    Left = 596
  end
  object dsSakumotu: TDataSource
    AutoEdit = False
    DataSet = ADOQSakumotubun
    Left = 660
    Top = 66
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
    TableName = 'T_UKETUKE6'
    Left = 552
  end
  object ADOQSakumotubun: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_SAKUBUN')
    Left = 432
    Top = 72
  end
  object dskumiai: TDataSource
    DataSet = ADOQkumiai
    OnStateChange = ds1StateChange
    Left = 76
    Top = 184
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
    Left = 24
    Top = 160
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
  object ADOKoumoku: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_KOUMOKU')
    Left = 544
    Top = 72
  end
  object DsKoumoku: TDataSource
    AutoEdit = False
    DataSet = ADOKoumoku
    Left = 492
    Top = 74
  end
  object ADOQuery1: TADOQuery
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
    Left = 8
    Top = 384
  end
  object ADOTuikakoumoku: TADOQuery
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
    Left = 600
    Top = 72
  end
  object ADOkingaku: TADOQuery
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
    Left = 584
    Top = 552
  end
end

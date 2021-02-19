inherited mstSehi_EForm: TmstSehi_EForm
  Left = 298
  Top = 122
  Caption = #26045#32933#27161#28310#12510#12473#12479'('#22290#33464#65289
  ClientHeight = 400
  ClientWidth = 610
  OldCreateOrder = True
  ExplicitWidth = 616
  ExplicitHeight = 429
  PixelsPerInch = 96
  TextHeight = 12
  inherited SelectPanel: TPanel
    Width = 610
    Height = 64
    ExplicitWidth = 610
    ExplicitHeight = 64
    object Label1: TLabel
      Left = 36
      Top = 36
      Width = 30
      Height = 12
      Caption = #20316#29289#65306
    end
    object Label10: TLabel
      Left = 36
      Top = 12
      Width = 30
      Height = 12
      Caption = #20316#30446#65306
    end
    object Label11: TLabel
      Left = 256
      Top = 12
      Width = 30
      Height = 12
      Caption = #20316#22411#65306
    end
    object Label3: TLabel
      Left = 256
      Top = 36
      Width = 54
      Height = 12
      Caption = #22303#22732#21306#20998#65306
    end
    object BitBtn1: TBitBtn
      Left = 480
      Top = 8
      Width = 121
      Height = 25
      Caption = #22987#12417#12398#20316#22411#12363#12425#12467#12500#12540
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object ComboBox2: TComboBox
      Left = 76
      Top = 32
      Width = 145
      Height = 20
      Style = csDropDownList
      DropDownCount = 20
      TabOrder = 1
      OnChange = ComboBox2Change
    end
    object ComboBox1: TComboBox
      Left = 76
      Top = 8
      Width = 145
      Height = 20
      Style = csDropDownList
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object ComboBox3: TComboBox
      Left = 316
      Top = 8
      Width = 145
      Height = 20
      Style = csDropDownList
      TabOrder = 2
      OnChange = ComboBox3Change
    end
    object ComboBox5: TComboBox
      Left = 316
      Top = 32
      Width = 145
      Height = 20
      Style = csDropDownList
      TabOrder = 3
      OnChange = ComboBox5Change
    end
    object BtTeitiCopy: TBitBtn
      Left = 480
      Top = 32
      Width = 121
      Height = 25
      Caption = #20302#22320#22303#12363#12425#12467#12500#12540
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = BtTeitiCopyClick
    end
  end
  inherited Panel2: TPanel
    Width = 610
    ExplicitWidth = 610
    inherited btnClose: TBitBtn
      Left = 500
      ExplicitLeft = 500
    end
  end
  inherited EditPanel: TPanel
    Top = 105
    Width = 610
    Height = 56
    Align = alTop
    ExplicitTop = 105
    ExplicitWidth = 610
    ExplicitHeight = 56
    object Label4: TLabel
      Left = 24
      Top = 32
      Width = 83
      Height = 12
      Caption = #26045#32933#37327#65288'Kg/10a)'
    end
    object Label5: TLabel
      Left = 404
      Top = 32
      Width = 69
      Height = 12
      Caption = #30446#27161#21454#37327'(Kg)'
    end
    object Label6: TLabel
      Left = 140
      Top = 8
      Width = 8
      Height = 12
      Caption = 'N'
    end
    object Label7: TLabel
      Left = 208
      Top = 8
      Width = 7
      Height = 12
      Caption = 'P'
    end
    object Label8: TLabel
      Left = 272
      Top = 8
      Width = 7
      Height = 12
      Caption = 'K'
    end
    object Label9: TLabel
      Left = 340
      Top = 8
      Width = 15
      Height = 12
      Caption = 'Mg'
    end
    object DBEditN: TDBEdit
      Left = 116
      Top = 28
      Width = 61
      Height = 20
      DataField = 'N'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEditP: TDBEdit
      Left = 184
      Top = 28
      Width = 61
      Height = 20
      DataField = 'P'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEditK: TDBEdit
      Left = 252
      Top = 28
      Width = 61
      Height = 20
      DataField = 'K'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBEditM: TDBEdit
      Left = 320
      Top = 28
      Width = 61
      Height = 20
      DataField = 'Mg'
      DataSource = ds1
      TabOrder = 3
      OnKeyPress = EnterKeyPress
    end
    object DBEditTotal: TDBEdit
      Left = 480
      Top = 28
      Width = 61
      Height = 20
      DataField = #30446#27161#21454#37327
      DataSource = ds1
      TabOrder = 4
      OnKeyPress = EnterKeyPress
    end
  end
  object PageControl1: TPageControl [3]
    Left = 0
    Top = 161
    Width = 610
    Height = 220
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 3
    OnChange = DBP2Change
    ExplicitTop = 159
    object TabSheet1: TTabSheet
      Caption = #31378#32032
      object Bevel5: TBevel
        Left = 0
        Top = 56
        Width = 100
        Height = 55
      end
      object Label2: TLabel
        Left = 40
        Top = 12
        Width = 54
        Height = 12
        Alignment = taRightJustify
        Caption = #27700#28310#20998#39006#65306
      end
      object Label12: TLabel
        Left = 10
        Top = 36
        Width = 84
        Height = 12
        Alignment = taRightJustify
        Caption = #36861#32933#12539#20998#26045#22238#25968#65306
      end
      object Label13: TLabel
        Left = 20
        Top = 64
        Width = 48
        Height = 12
        Alignment = taCenter
        Caption = #27700#28310#31684#22258
      end
      object Label14: TLabel
        Left = 20
        Top = 84
        Width = 53
        Height = 12
        Alignment = taCenter
        Caption = '(me/100g)'
      end
      object Bevel7: TBevel
        Left = 0
        Top = 111
        Width = 100
        Height = 85
      end
      object Label15: TLabel
        Left = 4
        Top = 124
        Width = 80
        Height = 12
        Caption = #22522#32933#37327'(kg/10a)'
      end
      object TuihiNLabel: TLabel
        Left = 4
        Top = 148
        Width = 68
        Height = 12
        Caption = #20998#26045#37327#65297#22238#30446
      end
      object TuihiN2Label: TLabel
        Left = 4
        Top = 172
        Width = 92
        Height = 12
        Caption = #20998#26045#37327#65298#22238#30446#20197#38477
      end
      object Bevel2: TBevel
        Left = 100
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel3: TBevel
        Left = 200
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel4: TBevel
        Left = 300
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel6: TBevel
        Left = 400
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel8: TBevel
        Left = 100
        Top = 111
        Width = 100
        Height = 85
      end
      object Bevel9: TBevel
        Left = 200
        Top = 111
        Width = 100
        Height = 85
      end
      object Bevel10: TBevel
        Left = 300
        Top = 111
        Width = 100
        Height = 85
      end
      object Bevel11: TBevel
        Left = 400
        Top = 111
        Width = 100
        Height = 85
      end
      object Label18: TLabel
        Left = 144
        Top = 64
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #8544
      end
      object Label19: TLabel
        Left = 224
        Top = 64
        Width = 48
        Height = 12
        Alignment = taCenter
        Caption = #8545#65288#27161#28310#65289
      end
      object Bevel12: TBevel
        Left = 500
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel13: TBevel
        Left = 500
        Top = 111
        Width = 100
        Height = 85
      end
      object Label20: TLabel
        Left = 344
        Top = 64
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #8546
      end
      object Label21: TLabel
        Left = 444
        Top = 64
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #8547
      end
      object Label22: TLabel
        Left = 544
        Top = 64
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #8548
      end
      object Label23: TLabel
        Left = 144
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label24: TLabel
        Left = 244
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label25: TLabel
        Left = 344
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label26: TLabel
        Left = 444
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label27: TLabel
        Left = 544
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label16: TLabel
        Left = 142
        Top = 36
        Width = 216
        Height = 12
        Alignment = taRightJustify
        Caption = #22238#12288#65288#12288'-'#12399#12289#36861#32933#12288#20363#65306#36861#32933#65297#22238#12398#22580#21512#12288'-1'#65289
      end
      object cmbN1: TDBValComboBox
        Left = 100
        Top = 8
        Width = 145
        Height = 20
        DataField = #27700#28310#20998#39006'N'
        DataSource = ds1
        Items.Strings = (
          #28961#12375
          #30813#37240#24907#31378#32032
          #21487#32102#24907#31378#32032)
        TabOrder = 0
        Values.Strings = (
          '0'
          '1'
          '2')
        OnChange = DBN2Change
      end
      object grN: TRadioGroup
        Left = 252
        Top = 0
        Width = 237
        Height = 33
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #29983#22303#22521#39178#31378#32032
          #29105#27700#25277#20986#24615#31378#32032)
        TabOrder = 1
        OnClick = grNClick
      end
      object DBENM1: TDBEdit
        Left = 124
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'N1'
        DataSource = ds1
        TabOrder = 10
        OnKeyPress = EnterKeyPress
      end
      object DBENT1: TDBEdit
        Left = 160
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'N11'
        DataSource = ds1
        TabOrder = 2
        OnKeyPress = EnterKeyPress
      end
      object DBENF2: TDBEdit
        Left = 204
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'N11'
        DataSource = ds1
        TabOrder = 3
        OnKeyPress = EnterKeyPress
      end
      object DBEN11: TDBEdit
        Left = 124
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1N1'
        DataSource = ds1
        TabOrder = 15
        OnKeyPress = EnterKeyPress
      end
      object DBEN21: TDBEdit
        Left = 124
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2N1'
        DataSource = ds1
        TabOrder = 20
        OnKeyPress = EnterKeyPress
      end
      object DBENF3: TDBEdit
        Left = 304
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'N12'
        DataSource = ds1
        TabOrder = 5
        OnKeyPress = EnterKeyPress
      end
      object DBENT2: TDBEdit
        Left = 260
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'N12'
        DataSource = ds1
        TabOrder = 4
        OnKeyPress = EnterKeyPress
      end
      object DBENF4: TDBEdit
        Left = 404
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'N13'
        DataSource = ds1
        TabOrder = 7
        OnKeyPress = EnterKeyPress
      end
      object DBENT3: TDBEdit
        Left = 360
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'N13'
        DataSource = ds1
        TabOrder = 6
        OnKeyPress = EnterKeyPress
      end
      object DBENF5: TDBEdit
        Left = 504
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'N14'
        DataSource = ds1
        TabOrder = 9
        OnKeyPress = EnterKeyPress
      end
      object DBENT4: TDBEdit
        Left = 460
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'N14'
        DataSource = ds1
        TabOrder = 8
        OnKeyPress = EnterKeyPress
      end
      object DBENM2: TDBEdit
        Left = 224
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'N2'
        DataSource = ds1
        TabOrder = 11
        OnChange = CalcTotal
        OnKeyPress = EnterKeyPress
      end
      object DBEN12: TDBEdit
        Left = 224
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1N2'
        DataSource = ds1
        TabOrder = 16
        OnChange = CalcTotal
        OnKeyPress = EnterKeyPress
      end
      object DBEN22: TDBEdit
        Left = 224
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2N2'
        DataSource = ds1
        TabOrder = 21
        OnChange = CalcTotal
        OnKeyPress = EnterKeyPress
      end
      object DBENM3: TDBEdit
        Left = 324
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'N3'
        DataSource = ds1
        TabOrder = 12
        OnKeyPress = EnterKeyPress
      end
      object DBEN13: TDBEdit
        Left = 324
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1N3'
        DataSource = ds1
        TabOrder = 18
        OnKeyPress = EnterKeyPress
      end
      object DBEN23: TDBEdit
        Left = 324
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2N3'
        DataSource = ds1
        TabOrder = 22
        OnKeyPress = EnterKeyPress
      end
      object DBENM4: TDBEdit
        Left = 424
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'N4'
        DataSource = ds1
        TabOrder = 13
        OnKeyPress = EnterKeyPress
      end
      object DBEN14: TDBEdit
        Left = 424
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1N4'
        DataSource = ds1
        TabOrder = 17
        OnKeyPress = EnterKeyPress
      end
      object DBEN24: TDBEdit
        Left = 424
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2N4'
        DataSource = ds1
        TabOrder = 23
        OnKeyPress = EnterKeyPress
      end
      object DBENM5: TDBEdit
        Left = 524
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'N5'
        DataSource = ds1
        TabOrder = 14
        OnKeyPress = EnterKeyPress
      end
      object DBEN15: TDBEdit
        Left = 524
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1N5'
        DataSource = ds1
        TabOrder = 19
        OnKeyPress = EnterKeyPress
      end
      object DBEN25: TDBEdit
        Left = 524
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2N5'
        DataSource = ds1
        TabOrder = 24
        OnKeyPress = EnterKeyPress
      end
      object DBN2: TDBEdit
        Left = 100
        Top = 32
        Width = 37
        Height = 20
        DataField = #36861#20998#20998#39006'N'
        DataSource = ds1
        TabOrder = 25
        OnChange = DBN2Change
        OnExit = DBN2Change
        OnKeyPress = EnterKeyPress
      end
    end
    object TabSheet2: TTabSheet
      Caption = #12522#12531#37240
      ImageIndex = 1
      object Bevel1: TBevel
        Left = 0
        Top = 56
        Width = 100
        Height = 55
      end
      object Label28: TLabel
        Left = 40
        Top = 12
        Width = 54
        Height = 12
        Alignment = taRightJustify
        Caption = #27700#28310#20998#39006#65306
      end
      object Label29: TLabel
        Left = 10
        Top = 36
        Width = 84
        Height = 12
        Alignment = taRightJustify
        Caption = #36861#32933#12539#20998#26045#22238#25968#65306
      end
      object Label30: TLabel
        Left = 20
        Top = 64
        Width = 48
        Height = 12
        Alignment = taCenter
        Caption = #27700#28310#31684#22258
      end
      object Label31: TLabel
        Left = 20
        Top = 84
        Width = 53
        Height = 12
        Alignment = taCenter
        Caption = '(me/100g)'
      end
      object Bevel14: TBevel
        Left = 0
        Top = 111
        Width = 100
        Height = 85
      end
      object Label32: TLabel
        Left = 4
        Top = 124
        Width = 80
        Height = 12
        Caption = #22522#32933#37327'(kg/10a)'
      end
      object TuihiPLabel: TLabel
        Left = 4
        Top = 148
        Width = 68
        Height = 12
        Caption = #20998#32972#37327#65297#22238#30446
      end
      object TuihiP2Label: TLabel
        Left = 4
        Top = 172
        Width = 92
        Height = 12
        Caption = #20998#32972#37327#65298#22238#30446#20197#38477
      end
      object Bevel15: TBevel
        Left = 100
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel16: TBevel
        Left = 200
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel17: TBevel
        Left = 300
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel18: TBevel
        Left = 400
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel19: TBevel
        Left = 100
        Top = 111
        Width = 100
        Height = 85
      end
      object Bevel20: TBevel
        Left = 200
        Top = 111
        Width = 100
        Height = 85
      end
      object Bevel21: TBevel
        Left = 300
        Top = 111
        Width = 100
        Height = 85
      end
      object Bevel22: TBevel
        Left = 400
        Top = 111
        Width = 100
        Height = 85
      end
      object Label35: TLabel
        Left = 144
        Top = 64
        Width = 23
        Height = 12
        Alignment = taCenter
        Caption = #20302#12356
      end
      object Label36: TLabel
        Left = 224
        Top = 64
        Width = 47
        Height = 12
        Alignment = taCenter
        Caption = #12420#12420#20302#12356
      end
      object Bevel23: TBevel
        Left = 500
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel24: TBevel
        Left = 500
        Top = 111
        Width = 100
        Height = 85
      end
      object Label37: TLabel
        Left = 336
        Top = 64
        Width = 36
        Height = 12
        Alignment = taCenter
        Caption = #22522#28310#20516
      end
      object Label38: TLabel
        Left = 432
        Top = 64
        Width = 47
        Height = 12
        Alignment = taCenter
        Caption = #12420#12420#39640#12356
      end
      object Label39: TLabel
        Left = 540
        Top = 64
        Width = 23
        Height = 12
        Alignment = taCenter
        Caption = #39640#12356
      end
      object Label40: TLabel
        Left = 144
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label41: TLabel
        Left = 244
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label42: TLabel
        Left = 344
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label43: TLabel
        Left = 444
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label44: TLabel
        Left = 544
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label17: TLabel
        Left = 142
        Top = 36
        Width = 216
        Height = 12
        Alignment = taRightJustify
        Caption = #22238#12288#65288#12288'-'#12399#12289#36861#32933#12288#20363#65306#36861#32933#65297#22238#12398#22580#21512#12288'-1'#65289
      end
      object cmbP1: TDBValComboBox
        Left = 100
        Top = 8
        Width = 145
        Height = 20
        DataField = #27700#28310#20998#39006'P'
        DataSource = ds1
        Items.Strings = (
          #28961#12375
          #26377#12426)
        TabOrder = 0
        Values.Strings = (
          '0'
          '1')
        OnChange = DBP2Change
      end
      object DBEPM1: TDBEdit
        Left = 124
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'P1'
        DataSource = ds1
        TabOrder = 9
        OnKeyPress = EnterKeyPress
      end
      object DBEPT1: TDBEdit
        Left = 160
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'P11'
        DataSource = ds1
        TabOrder = 1
        OnKeyPress = EnterKeyPress
      end
      object DBEPF2: TDBEdit
        Left = 204
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'P11'
        DataSource = ds1
        TabOrder = 2
        OnKeyPress = EnterKeyPress
      end
      object DBEP11: TDBEdit
        Left = 124
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1P1'
        DataSource = ds1
        TabOrder = 14
        OnKeyPress = EnterKeyPress
      end
      object DBEP21: TDBEdit
        Left = 124
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2P1'
        DataSource = ds1
        TabOrder = 19
        OnKeyPress = EnterKeyPress
      end
      object DBEPF3: TDBEdit
        Left = 304
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'P12'
        DataSource = ds1
        TabOrder = 4
        OnKeyPress = EnterKeyPress
      end
      object DBEPT2: TDBEdit
        Left = 260
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'P12'
        DataSource = ds1
        TabOrder = 3
        OnKeyPress = EnterKeyPress
      end
      object DBEPF4: TDBEdit
        Left = 404
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'P13'
        DataSource = ds1
        TabOrder = 6
        OnKeyPress = EnterKeyPress
      end
      object DBEPT3: TDBEdit
        Left = 360
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'P13'
        DataSource = ds1
        TabOrder = 5
        OnKeyPress = EnterKeyPress
      end
      object DBEPF5: TDBEdit
        Left = 504
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'P14'
        DataSource = ds1
        TabOrder = 8
        OnKeyPress = EnterKeyPress
      end
      object DBEPT4: TDBEdit
        Left = 460
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'P14'
        DataSource = ds1
        TabOrder = 7
        OnKeyPress = EnterKeyPress
      end
      object DBEPM2: TDBEdit
        Left = 224
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'P2'
        DataSource = ds1
        TabOrder = 10
        OnKeyPress = EnterKeyPress
      end
      object DBEP12: TDBEdit
        Left = 224
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1P2'
        DataSource = ds1
        TabOrder = 15
        OnKeyPress = EnterKeyPress
      end
      object DBEP22: TDBEdit
        Left = 224
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2P2'
        DataSource = ds1
        TabOrder = 20
        OnKeyPress = EnterKeyPress
      end
      object DBEPM3: TDBEdit
        Left = 324
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'P3'
        DataSource = ds1
        TabOrder = 11
        OnChange = CalcTotal
        OnKeyPress = EnterKeyPress
      end
      object DBEP13: TDBEdit
        Left = 324
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1P3'
        DataSource = ds1
        TabOrder = 16
        OnChange = CalcTotal
        OnKeyPress = EnterKeyPress
      end
      object DBEP23: TDBEdit
        Left = 324
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2P3'
        DataSource = ds1
        TabOrder = 21
        OnChange = CalcTotal
        OnKeyPress = EnterKeyPress
      end
      object DBEPM4: TDBEdit
        Left = 424
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'P4'
        DataSource = ds1
        TabOrder = 12
        OnKeyPress = EnterKeyPress
      end
      object DBEP14: TDBEdit
        Left = 424
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1P4'
        DataSource = ds1
        TabOrder = 17
        OnKeyPress = EnterKeyPress
      end
      object DBEP24: TDBEdit
        Left = 424
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2P4'
        DataSource = ds1
        TabOrder = 22
        OnKeyPress = EnterKeyPress
      end
      object DBEPM5: TDBEdit
        Left = 524
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'P5'
        DataSource = ds1
        TabOrder = 13
        OnKeyPress = EnterKeyPress
      end
      object DBEP15: TDBEdit
        Left = 524
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1P5'
        DataSource = ds1
        TabOrder = 18
        OnKeyPress = EnterKeyPress
      end
      object DBEP25: TDBEdit
        Left = 524
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2P5'
        DataSource = ds1
        TabOrder = 23
        OnKeyPress = EnterKeyPress
      end
      object DBP2: TDBEdit
        Left = 100
        Top = 32
        Width = 37
        Height = 20
        DataField = #36861#20998#20998#39006'P'
        DataSource = ds1
        TabOrder = 24
        OnChange = DBP2Change
        OnKeyPress = EnterKeyPress
      end
    end
    object TabSheet3: TTabSheet
      Caption = #21152#37324
      ImageIndex = 2
      object Bevel25: TBevel
        Left = 0
        Top = 56
        Width = 100
        Height = 55
      end
      object Label45: TLabel
        Left = 40
        Top = 12
        Width = 54
        Height = 12
        Alignment = taRightJustify
        Caption = #27700#28310#20998#39006#65306
      end
      object Label46: TLabel
        Left = 10
        Top = 36
        Width = 84
        Height = 12
        Alignment = taRightJustify
        Caption = #36861#32933#12539#20998#26045#22238#25968#65306
      end
      object Label47: TLabel
        Left = 20
        Top = 64
        Width = 48
        Height = 12
        Alignment = taCenter
        Caption = #27700#28310#31684#22258
      end
      object Label48: TLabel
        Left = 20
        Top = 84
        Width = 53
        Height = 12
        Alignment = taCenter
        Caption = '(me/100g)'
      end
      object Bevel26: TBevel
        Left = 0
        Top = 111
        Width = 100
        Height = 85
      end
      object Label49: TLabel
        Left = 4
        Top = 124
        Width = 80
        Height = 12
        Caption = #22522#32933#37327'(kg/10a)'
      end
      object TuihiKLabel: TLabel
        Left = 4
        Top = 148
        Width = 68
        Height = 12
        Caption = #20998#32972#37327#65297#22238#30446
      end
      object TuihiK2Label: TLabel
        Left = 4
        Top = 172
        Width = 92
        Height = 12
        Caption = #20998#32972#37327#65298#22238#30446#20197#38477
      end
      object Bevel27: TBevel
        Left = 100
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel28: TBevel
        Left = 200
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel29: TBevel
        Left = 300
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel30: TBevel
        Left = 400
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel31: TBevel
        Left = 100
        Top = 111
        Width = 100
        Height = 85
      end
      object Bevel32: TBevel
        Left = 200
        Top = 111
        Width = 100
        Height = 85
      end
      object Bevel33: TBevel
        Left = 300
        Top = 111
        Width = 100
        Height = 85
      end
      object Bevel34: TBevel
        Left = 400
        Top = 111
        Width = 100
        Height = 85
      end
      object Label52: TLabel
        Left = 144
        Top = 64
        Width = 23
        Height = 12
        Alignment = taCenter
        Caption = #20302#12356
      end
      object Label53: TLabel
        Left = 224
        Top = 64
        Width = 47
        Height = 12
        Alignment = taCenter
        Caption = #12420#12420#20302#12356
      end
      object Bevel35: TBevel
        Left = 500
        Top = 56
        Width = 100
        Height = 55
      end
      object Bevel36: TBevel
        Left = 500
        Top = 111
        Width = 100
        Height = 85
      end
      object Label54: TLabel
        Left = 336
        Top = 64
        Width = 36
        Height = 12
        Alignment = taCenter
        Caption = #22522#28310#20516
      end
      object Label55: TLabel
        Left = 432
        Top = 64
        Width = 47
        Height = 12
        Alignment = taCenter
        Caption = #12420#12420#39640#12356
      end
      object Label56: TLabel
        Left = 540
        Top = 64
        Width = 23
        Height = 12
        Alignment = taCenter
        Caption = #39640#12356
      end
      object Label57: TLabel
        Left = 144
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label58: TLabel
        Left = 244
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label59: TLabel
        Left = 344
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label60: TLabel
        Left = 444
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label61: TLabel
        Left = 544
        Top = 92
        Width = 12
        Height = 12
        Alignment = taCenter
        Caption = #65374
      end
      object Label33: TLabel
        Left = 142
        Top = 36
        Width = 216
        Height = 12
        Alignment = taRightJustify
        Caption = #22238#12288#65288#12288'-'#12399#12289#36861#32933#12288#20363#65306#36861#32933#65297#22238#12398#22580#21512#12288'-1'#65289
      end
      object cmbK1: TDBValComboBox
        Left = 100
        Top = 8
        Width = 101
        Height = 20
        DataField = #27700#28310#20998#39006'K'
        DataSource = ds1
        Items.Strings = (
          #28961#12375
          #26377#12426
          '-'
          #22303#22732#20998#39006#26377)
        TabOrder = 0
        Values.Strings = (
          '0'
          '1'
          '2'
          '3')
        OnChange = DBK2Change
      end
      object DBEKM1: TDBEdit
        Left = 124
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'K1'
        DataSource = ds1
        TabOrder = 10
        OnKeyPress = EnterKeyPress
      end
      object DBEKT1: TDBEdit
        Left = 160
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'K11'
        DataSource = ds1
        TabOrder = 2
        OnKeyPress = EnterKeyPress
      end
      object DBEKF2: TDBEdit
        Left = 204
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'K11'
        DataSource = ds1
        TabOrder = 3
        OnKeyPress = EnterKeyPress
      end
      object DBEK11: TDBEdit
        Left = 124
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1K1'
        DataSource = ds1
        TabOrder = 15
        OnKeyPress = EnterKeyPress
      end
      object DBEK21: TDBEdit
        Left = 124
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2K1'
        DataSource = ds1
        TabOrder = 20
        OnKeyPress = EnterKeyPress
      end
      object DBEKF3: TDBEdit
        Left = 304
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'K12'
        DataSource = ds1
        TabOrder = 5
        OnKeyPress = EnterKeyPress
      end
      object DBEKT2: TDBEdit
        Left = 260
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'K12'
        DataSource = ds1
        TabOrder = 4
        OnKeyPress = EnterKeyPress
      end
      object DBEKF4: TDBEdit
        Left = 404
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'K13'
        DataSource = ds1
        TabOrder = 7
        OnKeyPress = EnterKeyPress
      end
      object DBEKT3: TDBEdit
        Left = 360
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'K13'
        DataSource = ds1
        TabOrder = 6
        OnKeyPress = EnterKeyPress
      end
      object DBEKF5: TDBEdit
        Left = 504
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'K14'
        DataSource = ds1
        TabOrder = 9
        OnKeyPress = EnterKeyPress
      end
      object DBEKT4: TDBEdit
        Left = 460
        Top = 88
        Width = 37
        Height = 20
        DataField = #22522#28310'K14'
        DataSource = ds1
        TabOrder = 8
        OnKeyPress = EnterKeyPress
      end
      object DBEKM2: TDBEdit
        Left = 224
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'K2'
        DataSource = ds1
        TabOrder = 11
        OnKeyPress = EnterKeyPress
      end
      object DBEK12: TDBEdit
        Left = 224
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1K2'
        DataSource = ds1
        TabOrder = 16
        OnKeyPress = EnterKeyPress
      end
      object DBEK22: TDBEdit
        Left = 224
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2K2'
        DataSource = ds1
        TabOrder = 21
        OnKeyPress = EnterKeyPress
      end
      object DBEKM3: TDBEdit
        Left = 324
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'K3'
        DataSource = ds1
        TabOrder = 12
        OnChange = CalcTotal
        OnKeyPress = EnterKeyPress
      end
      object DBEK13: TDBEdit
        Left = 324
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1K3'
        DataSource = ds1
        TabOrder = 17
        OnChange = CalcTotal
        OnKeyPress = EnterKeyPress
      end
      object DBEK23: TDBEdit
        Left = 324
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2K3'
        DataSource = ds1
        TabOrder = 22
        OnChange = CalcTotal
        OnKeyPress = EnterKeyPress
      end
      object DBEKM4: TDBEdit
        Left = 424
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'K4'
        DataSource = ds1
        TabOrder = 13
        OnKeyPress = EnterKeyPress
      end
      object DBEK14: TDBEdit
        Left = 424
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1K4'
        DataSource = ds1
        TabOrder = 18
        OnKeyPress = EnterKeyPress
      end
      object DBEK24: TDBEdit
        Left = 424
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2K4'
        DataSource = ds1
        TabOrder = 23
        OnKeyPress = EnterKeyPress
      end
      object DBEKM5: TDBEdit
        Left = 524
        Top = 120
        Width = 57
        Height = 20
        DataField = #22522#32933'K5'
        DataSource = ds1
        TabOrder = 14
        OnKeyPress = EnterKeyPress
      end
      object DBEK15: TDBEdit
        Left = 524
        Top = 144
        Width = 57
        Height = 20
        DataField = #20998#26045'1K5'
        DataSource = ds1
        TabOrder = 19
        OnKeyPress = EnterKeyPress
      end
      object DBEK25: TDBEdit
        Left = 524
        Top = 168
        Width = 57
        Height = 20
        DataField = #20998#26045'2K5'
        DataSource = ds1
        TabOrder = 24
        OnKeyPress = EnterKeyPress
      end
      object grK: TRadioGroup
        Left = 256
        Top = 0
        Width = 285
        Height = 33
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          #31895#31890#36074#22303#22732
          #20013#31890#36074#22303#22732
          #32048#31890#36074#22303#22732)
        TabOrder = 1
        OnClick = grKClick
      end
      object DBKSui: TDBEdit
        Left = 8
        Top = 8
        Width = 25
        Height = 20
        DataField = #27700#28310#20998#39006'K'
        DataSource = ds1
        TabOrder = 25
        Visible = False
        OnKeyPress = EnterKeyPress
      end
      object DBK2: TDBEdit
        Left = 100
        Top = 32
        Width = 37
        Height = 20
        DataField = #36861#20998#20998#39006'K'
        DataSource = ds1
        TabOrder = 26
        OnChange = DBK2Change
        OnKeyPress = EnterKeyPress
      end
    end
    object TabSheet4: TTabSheet
      Caption = #33510#22303
      ImageIndex = 3
      object Label62: TLabel
        Left = 88
        Top = 12
        Width = 15
        Height = 12
        Caption = 'Mg'
      end
      object Label63: TLabel
        Left = 144
        Top = 36
        Width = 44
        Height = 12
        Caption = '(kg/10a)'
      end
      object DBEM: TDBEdit
        Left = 68
        Top = 32
        Width = 61
        Height = 20
        DataField = 'Mg'
        DataSource = ds1
        TabOrder = 0
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 381
    Width = 610
    ExplicitTop = 381
    ExplicitWidth = 610
  end
  inherited ds1: TDataSource
    Left = 488
    Top = 32
  end
  inherited ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'M_SEHI_E'
    Left = 440
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 448
    Top = 104
  end
  object ADOTable2: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'M_SEHI_E'
    Left = 504
    Top = 104
  end
end

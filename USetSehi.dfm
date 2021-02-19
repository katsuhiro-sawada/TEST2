object FSetSehi: TFSetSehi
  Left = 0
  Top = 0
  Caption = #32933#26009#35373#23450
  ClientHeight = 599
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 17
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 54
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    BevelInner = bvLowered
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = [fsBold]
    ParentColor = True
    ParentFont = False
    TabOrder = 0
    object btnPost: TBitBtn
      Left = 471
      Top = 13
      Width = 116
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #26356#26032'(&P)'
      DoubleBuffered = True
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
      TabOrder = 0
      OnClick = btnPostClick
    end
    object btnCancel: TBitBtn
      Left = 591
      Top = 13
      Width = 116
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Cancel = True
      Caption = #65399#65388#65437#65406#65433'(&C)'
      DoubleBuffered = True
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
      TabOrder = 1
    end
    object btnClose: TBitBtn
      Left = 711
      Top = 13
      Width = 117
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #38281#12376#12427'(&X)'
      DoubleBuffered = True
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
      TabOrder = 2
      OnClick = btnCloseClick
    end
  end
  object EditPanel: TPanel
    Left = 0
    Top = 54
    Width = 862
    Height = 251
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object Label13: TLabel
      Left = 9
      Top = 22
      Width = 78
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #12469#12531#12503#12523#30058#21495#65306
    end
    object Bevel5: TBevel
      Left = 12
      Top = 52
      Width = 90
      Height = 144
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Shape = bsFrame
    end
    object Label8: TLabel
      Left = 17
      Top = 115
      Width = 70
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #35386#26029#26045#32933#37327
    end
    object Bevel6: TBevel
      Left = 99
      Top = 52
      Width = 312
      Height = 89
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Shape = bsFrame
    end
    object Bevel7: TBevel
      Left = 408
      Top = 52
      Width = 332
      Height = 89
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Shape = bsFrame
    end
    object Label9: TLabel
      Left = 106
      Top = 58
      Width = 28
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #22522#32933
    end
    object Label10: TLabel
      Left = 420
      Top = 58
      Width = 28
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #21512#35336
    end
    object Label11: TLabel
      Left = 106
      Top = 146
      Width = 68
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20998#26045'('#36861#32933#65289
    end
    object Label12: TLabel
      Left = 420
      Top = 146
      Width = 92
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20998#26045'2'#22238#30446#20197#38477
    end
    object Label14: TLabel
      Left = 153
      Top = 58
      Width = 28
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #31378#32032
    end
    object Label16: TLabel
      Left = 216
      Top = 58
      Width = 32
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #12522#12531#37240
    end
    object Label17: TLabel
      Left = 284
      Top = 58
      Width = 28
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #21152#37324
    end
    object Label18: TLabel
      Left = 352
      Top = 58
      Width = 28
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #33510#22303
    end
    object Label19: TLabel
      Left = 477
      Top = 58
      Width = 28
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #31378#32032
    end
    object Label20: TLabel
      Left = 545
      Top = 58
      Width = 32
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #12522#12531#37240
    end
    object Label21: TLabel
      Left = 619
      Top = 58
      Width = 28
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #21152#37324
    end
    object Label22: TLabel
      Left = 749
      Top = 115
      Width = 56
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20998#26045#22238#25968
    end
    object Label50: TLabel
      Left = 687
      Top = 58
      Width = 28
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #33510#22303
    end
    object Bevel16: TBevel
      Left = 99
      Top = 139
      Width = 312
      Height = 57
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Shape = bsFrame
    end
    object Label55: TLabel
      Left = 755
      Top = 68
      Width = 54
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '(Kg/10a)'
    end
    object Label61: TLabel
      Left = 415
      Top = 112
      Width = 42
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #65288#26377#27231#65289
    end
    object Bevel18: TBevel
      Left = 408
      Top = 139
      Width = 332
      Height = 57
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Shape = bsFrame
    end
    object DBEdit1: TDBEdit
      Left = 106
      Top = 18
      Width = 115
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = #12469#12531#12503#12523#30058#21495
      DataSource = Ds1
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object txtNBuld1: TDBEdit
      Left = 135
      Top = 78
      Width = 62
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'N'#26045#32933#19981#36275#37327
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 1
    end
    object txtPBuld1: TDBEdit
      Left = 205
      Top = 78
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'P'#26045#32933#19981#36275#37327
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 2
    end
    object txtKBuld1: TDBEdit
      Left = 273
      Top = 78
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'K'#26045#32933#19981#36275#37327
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 3
    end
    object txtMBuld1: TDBEdit
      Left = 341
      Top = 78
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'Mg'#26045#32933#19981#36275#37327
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 4
    end
    object txtNBuld2: TDBEdit
      Left = 137
      Top = 162
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'N'#26045#32933#19981#36275#37327'2'
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 5
    end
    object txtPBuld2: TDBEdit
      Left = 205
      Top = 162
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'P'#26045#32933#19981#36275#37327'2'
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 6
    end
    object txtKBuld2: TDBEdit
      Left = 273
      Top = 162
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'K'#26045#32933#19981#36275#37327'2'
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 7
    end
    object txtNBuld3: TDBEdit
      Left = 467
      Top = 162
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'N'#26045#32933#19981#36275#37327'3'
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 8
    end
    object txtPBuld3: TDBEdit
      Left = 535
      Top = 162
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'P'#26045#32933#19981#36275#37327'3'
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 9
    end
    object txtKBuld3: TDBEdit
      Left = 603
      Top = 162
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'K'#26045#32933#19981#36275#37327'3'
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 10
    end
    object txtCntBuld: TDBEdit
      Left = 749
      Top = 136
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = #20998#26045#22238#25968
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 11
    end
    object txtNBuldSum: TDBEdit
      Left = 467
      Top = 78
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'N'#26045#32933#19981#36275#37327#21512#35336
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 12
    end
    object txtPBuldSum: TDBEdit
      Left = 535
      Top = 78
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'P'#26045#32933#19981#36275#37327#21512#35336
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 13
    end
    object txtKBuldSum: TDBEdit
      Left = 603
      Top = 78
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'K'#26045#32933#19981#36275#37327#21512#35336
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 14
    end
    object txtMBuldSum: TDBEdit
      Left = 671
      Top = 78
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'Mg'#26045#32933#19981#36275#37327#21512#35336
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 15
    end
    object txtNyBuldSum: TDBEdit
      Left = 467
      Top = 106
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'Ny'#26045#32933#19981#36275#37327#21512#35336
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 16
    end
    object txtPyBuldSum: TDBEdit
      Left = 535
      Top = 106
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'Py'#26045#32933#19981#36275#37327#21512#35336
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 17
    end
    object txtKyBuldSum: TDBEdit
      Left = 603
      Top = 106
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = 'Ky'#26045#32933#19981#36275#37327#21512#35336
      DataSource = Ds1
      ParentCtl3D = False
      TabOrder = 18
    end
    object DBCd1: TDBEdit
      Left = 252
      Top = 17
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = #20316#30446#12467#12540#12489
      DataSource = Ds2
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 19
    end
    object DBCd2: TDBEdit
      Left = 331
      Top = 17
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = #20316#29289#12467#12540#12489
      DataSource = Ds2
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 20
    end
    object DBcd3: TDBEdit
      Left = 409
      Top = 17
      Width = 63
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      Ctl3D = True
      DataField = #20316#22411#12467#12540#12489
      DataSource = Ds2
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 21
    end
  end
  object PageHiryoDest: TPageControl
    Left = 0
    Top = 305
    Width = 409
    Height = 259
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheet7
    Align = alLeft
    TabOrder = 2
    OnExit = NumExit
    object TabSheet6: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #26377#27231#65288#22534#32933#65289
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label2: TLabel
        Left = 305
        Top = 3
        Width = 15
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '(t)'
      end
      object ListSehiY: TListBox
        Left = 10
        Top = 21
        Width = 263
        Height = 153
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Style = lbOwnerDrawFixed
        ItemHeight = 22
        TabOrder = 0
        OnDblClick = BtnDelClick
      end
      object DBEdit12: TDBEdit
        Left = 292
        Top = 21
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #26377#27231#37327'1'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 1
      end
      object DBEdit13: TDBEdit
        Left = 292
        Top = 52
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #26377#27231#37327'2'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 2
      end
      object DBEdit14: TDBEdit
        Left = 292
        Top = 84
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #26377#27231#37327'3'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 3
      end
      object DBEdit15: TDBEdit
        Left = 292
        Top = 115
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #26377#27231#37327'4'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 4
      end
      object DBEdit16: TDBEdit
        Left = 292
        Top = 146
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #26377#27231#37327'5'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 5
      end
    end
    object TabSheet7: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #22522#32933
      ImageIndex = 1
      object Label15: TLabel
        Left = 305
        Top = 3
        Width = 25
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '(kg)'
      end
      object ListSehiM: TListBox
        Left = 10
        Top = 21
        Width = 263
        Height = 153
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Style = lbOwnerDrawFixed
        ItemHeight = 22
        TabOrder = 0
        OnDblClick = BtnDelClick
      end
      object DBEdit2: TDBEdit
        Left = 292
        Top = 21
        Width = 62
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #22522#32933#37327'1'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 292
        Top = 52
        Width = 62
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #22522#32933#37327'2'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 292
        Top = 84
        Width = 62
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #22522#32933#37327'3'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 292
        Top = 115
        Width = 62
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #22522#32933#37327'4'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 292
        Top = 146
        Width = 62
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #22522#32933#37327'5'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 5
      end
    end
    object TabSheet8: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20998#26045#65297#22238#30446
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label3: TLabel
        Left = 305
        Top = 3
        Width = 25
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '(kg)'
      end
      object ListSehiB: TListBox
        Left = 10
        Top = 21
        Width = 263
        Height = 153
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Style = lbOwnerDrawFixed
        ItemHeight = 22
        TabOrder = 0
        OnDblClick = BtnDelClick
      end
      object DBEdit7: TDBEdit
        Left = 292
        Top = 21
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #20998#26045'1'#37327'1'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 1
      end
      object DBEdit8: TDBEdit
        Left = 292
        Top = 52
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #20998#26045'1'#37327'2'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 2
      end
      object DBEdit9: TDBEdit
        Left = 292
        Top = 84
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #20998#26045'1'#37327'3'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 3
      end
      object DBEdit10: TDBEdit
        Left = 292
        Top = 115
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #20998#26045'1'#37327'4'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 4
      end
      object DBEdit11: TDBEdit
        Left = 292
        Top = 146
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #20998#26045'1'#37327'5'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 5
      end
    end
    object TabSheet9: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #20998#26045#65298#22238#30446
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label6: TLabel
        Left = 305
        Top = 3
        Width = 25
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '(kg)'
      end
      object ListSehiB2: TListBox
        Left = 10
        Top = 21
        Width = 263
        Height = 153
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Style = lbOwnerDrawFixed
        ItemHeight = 22
        TabOrder = 0
        OnDblClick = BtnDelClick
      end
      object DBEdit17: TDBEdit
        Left = 292
        Top = 21
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #20998#26045'2'#37327'1'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 1
      end
      object DBEdit18: TDBEdit
        Left = 292
        Top = 52
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #20998#26045'2'#37327'2'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 2
      end
      object DBEdit19: TDBEdit
        Left = 292
        Top = 84
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #20998#26045'2'#37327'3'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 3
      end
      object DBEdit20: TDBEdit
        Left = 292
        Top = 115
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #20998#26045'2'#37327'4'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 4
      end
      object DBEdit21: TDBEdit
        Left = 292
        Top = 146
        Width = 62
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabStop = False
        Ctl3D = True
        DataField = #20998#26045'2'#37327'5'
        DataSource = Ds1
        ParentCtl3D = False
        TabOrder = 5
      end
    end
    object TabYuukisitu: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #26377#27231#36074#32933#26009
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label62: TLabel
        Left = 305
        Top = 3
        Width = 25
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '(kg)'
      end
      object ListSehiM2: TListBox
        Left = 10
        Top = 21
        Width = 263
        Height = 153
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Style = lbOwnerDrawFixed
        ItemHeight = 22
        TabOrder = 0
      end
    end
  end
  object RLPanel: TPanel
    Left = 409
    Top = 305
    Width = 63
    Height = 259
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 3
    object BtnDel: TButton
      Left = 9
      Top = 75
      Width = 43
      Height = 32
      Hint = #21066#38500
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #8594
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BtnDelClick
    end
    object btnAdd: TButton
      Left = 9
      Top = 132
      Width = 43
      Height = 33
      Hint = #36861#21152
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #8592
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnAddClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 564
    Width = 862
    Height = 35
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 4
    object chkSim: TDBCheckBox
      Left = 460
      Top = 5
      Width = 347
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #12471#12511#12517#12524#12540#12471#12519#12531#35386#26029#28168#12415#65288#33258#21205#26045#32933#35373#35336#12375#12394#12356#65289
      DataField = 'SIM'#35336#31639#28168
      DataSource = Ds1
      TabOrder = 0
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object PageHiryoSource: TPageControl
    Left = 472
    Top = 305
    Width = 390
    Height = 259
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 5
    object TabSheet3: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #26377#27231#32933#26009
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Bevel4: TBevel
        Left = 0
        Top = 0
        Width = 379
        Height = 48
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Shape = bsSpacer
      end
      object ListYuuki: TListBox
        Left = 0
        Top = 48
        Width = 263
        Height = 174
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        Ctl3D = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
        OnDblClick = btnAddClick
      end
      object btnSakuhi: TButton
        Left = 267
        Top = 101
        Width = 90
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #32933#26009#35373#23450
        TabOrder = 1
        OnClick = btnSakuhiClick
      end
    end
    object TabSheet4: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #21270#25104#32933#26009
      ImageIndex = 1
      object grKasei: TRadioGroup
        Left = 0
        Top = 0
        Width = 382
        Height = 54
        Hint = #36984#25246#12375#12383#25104#20998#12391#31639#20986#12375#12414#12377
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Columns = 4
        ItemIndex = 0
        Items.Strings = (
          'N'#32933#26009
          'P'#32933#26009
          'K'#32933#26009
          'Mg'#32933#26009)
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object ListKasei: TListBox
        Left = 0
        Top = 54
        Width = 263
        Height = 173
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        Ctl3D = True
        ItemHeight = 17
        ParentCtl3D = False
        TabOrder = 1
        OnDblClick = btnAddClick
      end
      object btnSakuhi2: TButton
        Left = 267
        Top = 101
        Width = 90
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #32933#26009#35373#23450
        TabOrder = 2
        OnClick = btnSakuhi2Click
      end
    end
    object TabSheet5: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #21336#32933
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ListTanpi: TListBox
        Left = 0
        Top = 54
        Width = 263
        Height = 173
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        Ctl3D = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
        OnDblClick = btnAddClick
      end
      object btnTanpi: TButton
        Left = 267
        Top = 101
        Width = 90
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #21336#32933
        TabOrder = 1
        OnClick = btnTanpiClick
      end
      object grTanpi: TRadioGroup
        Left = 0
        Top = 0
        Width = 382
        Height = 54
        Hint = #34920#31034#12377#12427#21336#32933#12398#31278#39006
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Columns = 4
        ItemIndex = 0
        Items.Strings = (
          'N'#32933#26009
          'P'#32933#26009
          'K'#32933#26009
          'Mg'#32933#26009)
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = grTanpiClick
        ExplicitWidth = 379
      end
    end
  end
  object Ds1: TDataSource
    DataSet = ADOSindan
    OnStateChange = Ds1StateChange
    Left = 600
    Top = 48
  end
  object QueryWork: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select * from M_SAKUMOKU')
    Left = 328
    Top = 232
  end
  object ADOSindan: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    BeforePost = ADOSindanBeforePost
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select * from T_SINDAN')
    Left = 472
    Top = 48
    object ADOSindanサンプル番号: TWideStringField
      FieldName = #12469#12531#12503#12523#30058#21495
      Size = 4
    end
    object ADOSindan編集日: TDateTimeField
      FieldName = #32232#38598#26085
    end
    object ADOSindanコメント: TWideMemoField
      FieldName = #12467#12513#12531#12488
      BlobType = ftWideMemo
    end
    object ADOSindanpH診断不足量: TFloatField
      FieldName = 'pH'#35386#26029#19981#36275#37327
    end
    object ADOSindanP診断不足量: TFloatField
      FieldName = 'P'#35386#26029#19981#36275#37327
    end
    object ADOSindanMg診断不足量: TFloatField
      FieldName = 'Mg'#35386#26029#19981#36275#37327
    end
    object ADOSindanK診断不足量: TFloatField
      FieldName = 'K'#35386#26029#19981#36275#37327
    end
    object ADOSindan土改材コード1: TWideStringField
      FieldName = #22303#25913#26448#12467#12540#12489'1'
      Size = 3
    end
    object ADOSindan土改材量1: TFloatField
      FieldName = #22303#25913#26448#37327'1'
    end
    object ADOSindan土改材コード2: TWideStringField
      FieldName = #22303#25913#26448#12467#12540#12489'2'
      Size = 3
    end
    object ADOSindan土改材量2: TFloatField
      FieldName = #22303#25913#26448#37327'2'
    end
    object ADOSindan土改材コード3: TWideStringField
      FieldName = #22303#25913#26448#12467#12540#12489'3'
      Size = 3
    end
    object ADOSindan土改材量3: TFloatField
      FieldName = #22303#25913#26448#37327'3'
    end
    object ADOSindan土改材コード4: TWideStringField
      FieldName = #22303#25913#26448#12467#12540#12489'4'
      Size = 3
    end
    object ADOSindan土改材量4: TFloatField
      FieldName = #22303#25913#26448#37327'4'
    end
    object ADOSindan土改材コード5: TWideStringField
      FieldName = #22303#25913#26448#12467#12540#12489'5'
      Size = 3
    end
    object ADOSindan土改材量5: TFloatField
      FieldName = #22303#25913#26448#37327'5'
    end
    object ADOSindanN施肥不足量: TFloatField
      FieldName = 'N'#26045#32933#19981#36275#37327
      DisplayFormat = '0.0'
    end
    object ADOSindanP施肥不足量: TFloatField
      FieldName = 'P'#26045#32933#19981#36275#37327
      DisplayFormat = '0.0'
    end
    object ADOSindanK施肥不足量: TFloatField
      FieldName = 'K'#26045#32933#19981#36275#37327
      DisplayFormat = '0.0'
    end
    object ADOSindanMg施肥不足量: TFloatField
      FieldName = 'Mg'#26045#32933#19981#36275#37327
      DisplayFormat = '0.0'
    end
    object ADOSindan分施回数: TSmallintField
      FieldName = #20998#26045#22238#25968
    end
    object ADOSindanN施肥不足量2: TFloatField
      FieldName = 'N'#26045#32933#19981#36275#37327'2'
      DisplayFormat = '0.0'
    end
    object ADOSindanP施肥不足量2: TFloatField
      FieldName = 'P'#26045#32933#19981#36275#37327'2'
      DisplayFormat = '0.0'
    end
    object ADOSindanK施肥不足量2: TFloatField
      FieldName = 'K'#26045#32933#19981#36275#37327'2'
      DisplayFormat = '0.0'
    end
    object ADOSindanN施肥不足量3: TFloatField
      FieldName = 'N'#26045#32933#19981#36275#37327'3'
      DisplayFormat = '0.0'
    end
    object ADOSindanP施肥不足量3: TFloatField
      FieldName = 'P'#26045#32933#19981#36275#37327'3'
      DisplayFormat = '0.0'
    end
    object ADOSindanK施肥不足量3: TFloatField
      FieldName = 'K'#26045#32933#19981#36275#37327'3'
      DisplayFormat = '0.0'
    end
    object ADOSindanN施肥不足量合計: TFloatField
      FieldName = 'N'#26045#32933#19981#36275#37327#21512#35336
      DisplayFormat = '0.0'
    end
    object ADOSindanP施肥不足量合計: TFloatField
      FieldName = 'P'#26045#32933#19981#36275#37327#21512#35336
      DisplayFormat = '0.0'
    end
    object ADOSindanK施肥不足量合計: TFloatField
      FieldName = 'K'#26045#32933#19981#36275#37327#21512#35336
      DisplayFormat = '0.0'
    end
    object ADOSindanMg施肥不足量合計: TFloatField
      FieldName = 'Mg'#26045#32933#19981#36275#37327#21512#35336
      DisplayFormat = '0.0'
    end
    object ADOSindan基肥1: TWideStringField
      FieldName = #22522#32933'1'
      Size = 4
    end
    object ADOSindan基肥量1: TFloatField
      FieldName = #22522#32933#37327'1'
      DisplayFormat = '0.0'
    end
    object ADOSindan基肥2: TWideStringField
      FieldName = #22522#32933'2'
      Size = 4
    end
    object ADOSindan基肥量2: TFloatField
      FieldName = #22522#32933#37327'2'
      DisplayFormat = '0.0'
    end
    object ADOSindan基肥3: TWideStringField
      FieldName = #22522#32933'3'
      Size = 4
    end
    object ADOSindan基肥量3: TFloatField
      FieldName = #22522#32933#37327'3'
      DisplayFormat = '0.0'
    end
    object ADOSindan基肥4: TWideStringField
      FieldName = #22522#32933'4'
      Size = 4
    end
    object ADOSindan基肥量4: TFloatField
      FieldName = #22522#32933#37327'4'
      DisplayFormat = '0.0'
    end
    object ADOSindan基肥5: TWideStringField
      FieldName = #22522#32933'5'
      Size = 4
    end
    object ADOSindan基肥量5: TFloatField
      FieldName = #22522#32933#37327'5'
      DisplayFormat = '0.0'
    end
    object ADOSindan分施11: TWideStringField
      FieldName = #20998#26045'11'
      Size = 4
    end
    object ADOSindan分施1量1: TFloatField
      FieldName = #20998#26045'1'#37327'1'
      DisplayFormat = '0.0'
    end
    object ADOSindan分施12: TWideStringField
      FieldName = #20998#26045'12'
      Size = 4
    end
    object ADOSindan分施1量2: TFloatField
      FieldName = #20998#26045'1'#37327'2'
      DisplayFormat = '0.0'
    end
    object ADOSindan分施13: TWideStringField
      FieldName = #20998#26045'13'
      Size = 4
    end
    object ADOSindan分施1量3: TFloatField
      FieldName = #20998#26045'1'#37327'3'
      DisplayFormat = '0.0'
    end
    object ADOSindan分施14: TWideStringField
      FieldName = #20998#26045'14'
      Size = 4
    end
    object ADOSindan分施1量4: TFloatField
      FieldName = #20998#26045'1'#37327'4'
      DisplayFormat = '0.0'
    end
    object ADOSindan分施15: TWideStringField
      FieldName = #20998#26045'15'
      Size = 4
    end
    object ADOSindan分施1量5: TFloatField
      FieldName = #20998#26045'1'#37327'5'
      DisplayFormat = '0.0'
    end
    object ADOSindan分施21: TWideStringField
      FieldName = #20998#26045'21'
      Size = 4
    end
    object ADOSindan分施2量1: TFloatField
      FieldName = #20998#26045'2'#37327'1'
      DisplayFormat = '0.0'
    end
    object ADOSindan分施22: TWideStringField
      FieldName = #20998#26045'22'
      Size = 4
    end
    object ADOSindan分施2量2: TFloatField
      FieldName = #20998#26045'2'#37327'2'
      DisplayFormat = '0.0'
    end
    object ADOSindan分施23: TWideStringField
      FieldName = #20998#26045'23'
      Size = 4
    end
    object ADOSindan分施2量3: TFloatField
      FieldName = #20998#26045'2'#37327'3'
      DisplayFormat = '0.0'
    end
    object ADOSindan分施24: TWideStringField
      FieldName = #20998#26045'24'
      Size = 4
    end
    object ADOSindan分施2量4: TFloatField
      FieldName = #20998#26045'2'#37327'4'
      DisplayFormat = '0.0'
    end
    object ADOSindan分施25: TWideStringField
      FieldName = #20998#26045'25'
      Size = 4
    end
    object ADOSindan分施2量5: TFloatField
      FieldName = #20998#26045'2'#37327'5'
      DisplayFormat = '0.0'
    end
    object ADOSindan有機1: TWideStringField
      FieldName = #26377#27231'1'
      Size = 2
    end
    object ADOSindan有機量1: TFloatField
      FieldName = #26377#27231#37327'1'
      DisplayFormat = '0.0'
    end
    object ADOSindan有機2: TWideStringField
      FieldName = #26377#27231'2'
      Size = 2
    end
    object ADOSindan有機量2: TFloatField
      FieldName = #26377#27231#37327'2'
      DisplayFormat = '0.0'
    end
    object ADOSindan有機3: TWideStringField
      FieldName = #26377#27231'3'
      Size = 2
    end
    object ADOSindan有機量3: TFloatField
      FieldName = #26377#27231#37327'3'
      DisplayFormat = '0.0'
    end
    object ADOSindan有機4: TWideStringField
      FieldName = #26377#27231'4'
      Size = 2
    end
    object ADOSindan有機量4: TFloatField
      FieldName = #26377#27231#37327'4'
      DisplayFormat = '0.0'
    end
    object ADOSindan有機5: TWideStringField
      FieldName = #26377#27231'5'
      Size = 2
    end
    object ADOSindan有機量5: TFloatField
      FieldName = #26377#27231#37327'5'
      DisplayFormat = '0.0'
    end
    object ADOSindanSIM計算済: TBooleanField
      FieldName = 'SIM'#35336#31639#28168
    end
    object ADOSindan設計コメント: TWideMemoField
      FieldName = #35373#35336#12467#12513#12531#12488
      BlobType = ftWideMemo
    end
    object ADOSindan削除フラグ: TBooleanField
      FieldName = #21066#38500#12501#12521#12464
    end
    object ADOSindanNy施肥不足量合計: TFloatField
      FieldName = 'Ny'#26045#32933#19981#36275#37327#21512#35336
      DisplayFormat = '0.0'
    end
    object ADOSindanPy施肥不足量合計: TFloatField
      FieldName = 'Py'#26045#32933#19981#36275#37327#21512#35336
      DisplayFormat = '0.0'
    end
    object ADOSindanKy施肥不足量合計: TFloatField
      FieldName = 'Ky'#26045#32933#19981#36275#37327#21512#35336
      DisplayFormat = '0.0'
    end
    object ADOSindan所見土壌: TWideMemoField
      FieldName = #25152#35211#22303#22732
      BlobType = ftWideMemo
    end
    object ADOSindan所見施肥: TWideMemoField
      FieldName = #25152#35211#26045#32933
      BlobType = ftWideMemo
    end
  end
  object ADOUketuke: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    ParamCheck = False
    Parameters = <>
    Left = 600
    Top = 192
  end
  object Ds2: TDataSource
    DataSet = ADOUketuke
    OnStateChange = Ds1StateChange
    Left = 552
    Top = 192
  end
end

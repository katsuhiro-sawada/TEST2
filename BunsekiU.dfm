object frmBunseki: TfrmBunseki
  Left = 303
  Top = 154
  BorderIcons = [biMaximize]
  Caption = #20998#26512#20516#20837#21147
  ClientHeight = 586
  ClientWidth = 1690
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object StatusBar1: TStatusBar
    Left = 0
    Top = 567
    Width = 1690
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1690
    Height = 121
    Align = alTop
    ParentColor = True
    TabOrder = 1
    DesignSize = (
      1690
      121)
    object Label3: TLabel
      Left = 963
      Top = 43
      Width = 27
      Height = 24
      Caption = 'F5'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 963
      Top = 76
      Width = 27
      Height = 24
      Caption = 'F8'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 996
      Top = 43
      Width = 96
      Height = 24
      Caption = #65306#12510#12473#12479#36984#25246
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 996
      Top = 76
      Width = 160
      Height = 24
      Caption = #65306#19978#27573#12398#20869#23481#12434#12467#12500#12540
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 17
      Top = 13
      Width = 69
      Height = 24
      Alignment = taRightJustify
      AutoSize = False
      Caption = #35430#26009'NO'#65306
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 305
      Top = 13
      Width = 69
      Height = 65
      AutoSize = False
      Caption = #38283#22987#21015#65306
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 671
      Top = 13
      Width = 134
      Height = 65
      AutoSize = False
      Caption = '[enter]'#12461#12540#12395#12424#12427#31227#21205#26041#21521
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 963
      Top = 13
      Width = 150
      Height = 24
      AutoSize = False
      Caption = #12501#12449#12531#12463#12471#12519#12531#12461#12540
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object DBNavigator1: TDBNavigator
      Left = 91
      Top = 44
      Width = 96
      Height = 21
      DataSource = ds1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 90
      Top = 11
      Width = 96
      Height = 32
      AutoSize = False
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ImeMode = imClose
      ParentFont = False
      TabOrder = 1
      OnKeyDown = Edit1KeyDown
    end
    object ComboBox1: TComboBox
      Left = 822
      Top = 13
      Width = 57
      Height = 32
      Style = csDropDownList
      DropDownCount = 2
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Items.Strings = (
        #8594
        #8595)
    end
    object EMode: TEdit
      Left = 1249
      Top = 82
      Width = 73
      Height = 32
      Anchors = [akTop, akRight]
      AutoSize = False
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'EMode'
      Visible = False
    end
    object BtSiborikomi: TBitBtn
      Left = 1566
      Top = 64
      Width = 113
      Height = 43
      Caption = #32094#12426#36796#12415#23455#34892
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 1447
      Top = 64
      Width = 113
      Height = 43
      Caption = #32094#12426#36796#12415#35299#38500
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
    end
    object BitBtn2: TBitBtn
      Left = 1328
      Top = 64
      Width = 113
      Height = 43
      Caption = #26032#35215#35079#25968#34892#20837#21147
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Visible = False
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 375
      Top = 9
      Width = 85
      Height = 32
      Caption = #19968#30058#24038#12408
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 375
      Top = 44
      Width = 85
      Height = 32
      Caption = 'pH'#12408
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = BitBtn4Click
    end
    object EIdou: TEdit
      Left = 375
      Top = 82
      Width = 121
      Height = 32
      AutoSize = False
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object BitBtn6: TBitBtn
      Left = 502
      Top = 82
      Width = 67
      Height = 32
      Caption = #12408#31227#21205
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = BitBtn6Click
    end
    object EUketukeNo: TEdit
      Left = 1249
      Top = 64
      Width = 73
      Height = 32
      Anchors = [akTop, akRight]
      AutoSize = False
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      Text = 'EUketukeNo'
      Visible = False
    end
    object btnClose: TBitBtn
      Left = 1560
      Top = 15
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
      TabOrder = 12
      OnClick = btnClose1Click
    end
    object BitBtn9: TBitBtn
      Left = 1371
      Top = 64
      Width = 113
      Height = 43
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #38917#30446#24133#20445#23384
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Yu Gothic UI'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 13
      OnClick = BitBtn91Click
    end
    object BitBtn8: TBitBtn
      Left = 1371
      Top = 15
      Width = 113
      Height = 43
      Anchors = [akTop, akRight]
      Caption = #12487#12540#12479#20986#21147
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Yu Gothic UI'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 14
    end
    object BitBtn5: TBitBtn
      Left = 1252
      Top = 15
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
      TabOrder = 15
      Visible = False
      OnClick = BitBtn51Click
    end
    object Button1: TButton
      Left = 193
      Top = 11
      Width = 67
      Height = 32
      Caption = #12408#31227#21205
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 193
    Top = 121
    Width = 1497
    Height = 446
    Align = alClient
    DataSource = ds1
    DrawingStyle = gdsClassic
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 2
    TitleFont.Charset = SHIFTJIS_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnColEnter = DBGrid1ColEnter
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 121
    Width = 193
    Height = 446
    Align = alLeft
    Ctl3D = True
    DataSource = ds1
    DrawingStyle = gdsClassic
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 3
    TitleFont.Charset = SHIFTJIS_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -12
    TitleFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnColEnter = DBGrid1ColEnter
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid2KeyDown
    Columns = <
      item
        ButtonStyle = cbsNone
        Color = clWhite
        Expanded = False
        FieldName = #35430#26009'NO'
        Title.Alignment = taCenter
        Title.Font.Charset = SHIFTJIS_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = #21463#20184'NO'
        Title.Alignment = taCenter
        Title.Font.Charset = SHIFTJIS_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Title.Font.Style = []
        Width = 94
        Visible = True
      end>
  end
  object ds1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = ds1DataChange
    OnUpdateData = ds1UpdateData
    Left = 96
    Top = 84
  end
  object ADODojyouaaaa: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_DOJOU')
    Left = 488
    Top = 240
  end
  object ADODoseiaaaa: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_DOSEI')
    Left = 536
    Top = 184
  end
  object ADOSakuSyuruiaaaaa: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_SAKUSYURUI')
    Left = 608
    Top = 200
  end
  object PopupMenu1: TPopupMenu
    Left = 200
    Top = 80
    object D1: TMenuItem
      Caption = #65297#34892#21066#38500'(&D)'
      OnClick = D1Click
    end
    object V1: TMenuItem
      Caption = #12456#12463#12475#12523#12363#12425#36028#12426#20184#12369'(&V)'
      OnClick = V1Click
    end
    object A2: TMenuItem
      Caption = #35079#25968#34892#21066#38500'(&A)'
      OnClick = A2Click
    end
    object A1: TMenuItem
      Caption = #36984#25246#12375#12383#12418#12398#12377#12409#12390#21066#38500'(&A)'
      Visible = False
      OnClick = A1Click
    end
  end
  object ADOSakumotu: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_SAKUMOTU')
    Left = 392
    Top = 176
  end
  object ADOKOURYO: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'C_KOURYO'
    Left = 280
    Top = 296
  end
  object ADOUMU: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'C_UMU'
    Left = 352
    Top = 304
  end
  object ADODokaizai1: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_DOKAIMAS')
    Left = 376
    Top = 360
  end
  object ADODokaizai2: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_DOKAIMAS')
    Left = 456
    Top = 376
  end
  object ADODokaizai3: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_DOKAIMAS')
    Left = 568
    Top = 328
  end
  object ADODokaizai4: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_DOKAIMAS')
    Left = 600
    Top = 328
  end
  object ADONouka: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_NOUKA'
    Left = 328
    Top = 144
  end
  object ADOSakumoku: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_SAKUMOKU'
    Left = 392
    Top = 144
  end
  object ADOSakuSyurui: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_SAKUSYURUI'
    Left = 32
    Top = 88
  end
  object ADODojyou: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_DOJOU'
    Left = 256
    Top = 80
  end
  object ADODosei: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_DOSEI'
    Left = 144
    Top = 80
  end
  object ADOSakugata: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_SAKUGATA')
    Left = 392
    Top = 224
  end
  object ADOJICHIKAI: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_JICHIKAI'
    Left = 632
    Top = 144
  end
  object ADOCity: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_CITY'
    Left = 672
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    BeforeInsert = ADOQuery1BeforeInsert
    Parameters = <>
    SQL.Strings = (
      'select * from T_BUNSEKI6')
    Left = 144
    Top = 232
    object ADOQuery1試料NO: TWideStringField
      FieldName = #35430#26009'NO'
      Size = 4
    end
    object ADOQuery1受付NO: TWideStringField
      FieldName = #21463#20184'NO'
      Size = 8
    end
    object ADOQuery1依頼者氏名: TWideStringField
      FieldName = #20381#38972#32773#27663#21517
      Size = 36
    end
    object ADOQuery1採取場所: TWideStringField
      FieldName = #25505#21462#22580#25152
      Size = 50
    end
    object ADOQuery1作物コード: TWideStringField
      DisplayWidth = 3
      FieldName = #20316#29289#12467#12540#12489
      Size = 3
    end
    object ADOQuery1作物名: TWideStringField
      FieldName = #20316#29289#21517
      Size = 25
    end
    object ADOQuery1作型コード: TWideStringField
      FieldName = #20316#22411#12467#12540#12489
      Size = 2
    end
    object ADOQuery1作型名: TWideStringField
      FieldName = #20316#22411#21517
      Size = 25
    end
    object ADOQuery1pH: TFloatField
      FieldName = 'pH'
    end
    object ADOQuery1EC: TFloatField
      FieldName = 'EC'
    end
    object ADOQuery1トルオーグP: TFloatField
      FieldName = #12488#12523#12458#12540#12464'P'
    end
    object ADOQuery1ブレイP: TFloatField
      FieldName = #12502#12524#12452'P'
    end
    object ADOQuery1CaO: TFloatField
      FieldName = 'CaO'
    end
    object ADOQuery1MgO: TFloatField
      FieldName = 'MgO'
    end
    object ADOQuery1K2O: TFloatField
      FieldName = 'K2O'
    end
    object ADOQuery1CEC: TFloatField
      FieldName = 'CEC'
    end
    object ADOQuery1腐植: TFloatField
      FieldName = #33104#26893
    end
    object ADOQuery1アンモニア態N: TFloatField
      FieldName = #12450#12531#12514#12491#12450#24907'N'
    end
    object ADOQuery1可給態N: TFloatField
      FieldName = #21487#32102#24907'N'
    end
    object ADOQuery1熱抽出N: TFloatField
      FieldName = #29105#25277#20986'N'
    end
    object ADOQuery1硝酸態N: TFloatField
      FieldName = #30813#37240#24907'N'
    end
    object ADOQuery1ケイ酸: TFloatField
      FieldName = #12465#12452#37240
    end
    object ADOQuery1鉄: TFloatField
      FieldName = #37444
    end
    object ADOQuery1リン吸: TFloatField
      FieldName = #12522#12531#21560
    end
    object ADOQuery1亜鉛: TFloatField
      FieldName = #20124#37467
    end
    object ADOQuery1銅: TFloatField
      FieldName = #37509
    end
    object ADOQuery1マンガン: TFloatField
      FieldName = #12510#12531#12460#12531
    end
    object ADOQuery1ホウ素: TFloatField
      FieldName = #12507#12454#32032
    end
    object ADOQuery1ニッケル: TFloatField
      FieldName = #12491#12483#12465#12523
    end
    object ADOQuery1pHKCL: TFloatField
      FieldName = 'pHKCL'
    end
    object ADOQuery1Y1: TFloatField
      FieldName = 'Y1'
    end
    object ADOQuery1備考: TWideStringField
      FieldName = #20633#32771
      Size = 60
    end
    object ADOQuery1容量3: TFloatField
      FieldName = #23481#37327'3'
    end
    object ADOQuery1Mg3: TFloatField
      FieldName = 'Mg3'
    end
    object ADOQuery1K3: TFloatField
      FieldName = 'K3'
    end
    object ADOQuery1P3: TFloatField
      FieldName = 'P3'
    end
    object ADOQuery1N3: TFloatField
      FieldName = 'N3'
    end
    object ADOQuery1肥料名3: TWideStringField
      FieldName = #32933#26009#21517'3'
      Size = 30
    end
    object ADOQuery1容量2: TFloatField
      FieldName = #23481#37327'2'
    end
    object ADOQuery1Mg2: TFloatField
      FieldName = 'Mg2'
    end
    object ADOQuery1K2: TFloatField
      FieldName = 'K2'
    end
    object ADOQuery1P2: TFloatField
      FieldName = 'P2'
    end
    object ADOQuery1N2: TFloatField
      FieldName = 'N2'
    end
    object ADOQuery1肥料名2: TWideStringField
      FieldName = #32933#26009#21517'2'
      Size = 30
    end
    object ADOQuery1容量1: TFloatField
      FieldName = #23481#37327'1'
    end
    object ADOQuery1Mg1: TFloatField
      FieldName = 'Mg1'
    end
    object ADOQuery1K1: TFloatField
      FieldName = 'K1'
    end
    object ADOQuery1P1: TFloatField
      FieldName = 'P1'
    end
    object ADOQuery1N1: TFloatField
      FieldName = 'N1'
    end
    object ADOQuery1肥料名1: TWideStringField
      FieldName = #32933#26009#21517'1'
      Size = 30
    end
  end
end

object frmSHojou: TfrmSHojou
  Left = 399
  Top = 108
  Caption = #22275#22580#26908#32034
  ClientHeight = 506
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Bevel1: TBevel
    Left = 0
    Top = 45
    Width = 466
    Height = 9
    Align = alTop
    Shape = bsSpacer
    Style = bsRaised
    ExplicitWidth = 465
  end
  object Bevel2: TBevel
    Left = 0
    Top = 54
    Width = 466
    Height = 155
    Align = alTop
    Shape = bsSpacer
    ExplicitWidth = 465
  end
  object Label4: TLabel
    Left = 8
    Top = 64
    Width = 54
    Height = 12
    Caption = #22275#22580#30058#21495#65306
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 94
    Width = 369
    Height = 107
    Caption = #26908#32034#26465#20214#65288#19968#37096#12461#12540#12527#12540#12489#65289
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 52
      Width = 42
      Height = 12
      Caption = #36786#23478#21517#65306
    end
    object Label2: TLabel
      Left = 12
      Top = 24
      Width = 54
      Height = 12
      Caption = #36786#23478#30058#21495#65306
    end
    object Label3: TLabel
      Left = 12
      Top = 80
      Width = 51
      Height = 12
      Caption = #36786#23478#12459#12490#65306
    end
    object txtNouka: TEdit
      Left = 80
      Top = 48
      Width = 121
      Height = 20
      ImeMode = imOpen
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object txtCode: TEdit
      Left = 80
      Top = 20
      Width = 121
      Height = 20
      ImeMode = imClose
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object txtKana: TEdit
      Left = 80
      Top = 76
      Width = 121
      Height = 20
      ImeMode = imKata
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object btnFind: TButton
      Left = 206
      Top = 20
      Width = 75
      Height = 77
      Caption = #26908#32034'(&F)'
      TabOrder = 3
      OnClick = btnFindClick
    end
    object btnAll: TButton
      Left = 284
      Top = 20
      Width = 75
      Height = 77
      Caption = #20840#12390#34920#31034
      TabOrder = 4
      OnClick = btnAllClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 209
    Width = 466
    Height = 297
    Hint = #12479#12452#12488#12523#12434#12463#12522#12483#12463#12377#12427#12392#12381#12398#38917#30446#12391#12477#12540#12488#12373#12428#12414#12377
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = SHIFTJIS_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
    TitleFont.Style = []
    OnDblClick = BitBtn1Click
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = #22275#22580#30058#21495
        Title.Caption = #22320#28857#30058#21495
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36786#23478#21517
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36786#23478#12459#12490
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22275#22580#21517
        Title.Caption = #22320#28857#21517
        Width = 197
        Visible = True
      end
      item
        Expanded = False
        FieldName = #38754#31309
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 45
    Align = alTop
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 156
      Top = 8
      Width = 95
      Height = 25
      Caption = #36984#25246'(&S)'
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
        7777700000007777777777777777700000007777777774F77777700000007777
        7777444F77777000000077777774444F777770000000700000444F44F7777000
        000070FFF444F0744F777000000070F8884FF0774F777000000070FFFFFFF077
        74F77000000070F88888F077774F7000000070FFFFFFF0777774F000000070F8
        8777F07777774000000070FFFF00007777777000000070F88707077777777000
        000070FFFF007777777770000000700000077777777770000000777777777777
        777770000000}
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 256
      Top = 8
      Width = 95
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
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object btnClose: TBitBtn
      Left = 364
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
      TabOrder = 2
      OnClick = btnCloseClick
    end
  end
  object BitBtn3: TBitBtn
    Left = 376
    Top = 60
    Width = 81
    Height = 77
    Caption = #12510#12473#12479'(&N)'
    DoubleBuffered = True
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
    TabOrder = 3
    OnClick = btnNewClick
  end
  object ETiten: TEdit
    Left = 80
    Top = 56
    Width = 121
    Height = 20
    ImeMode = imClose
    MaxLength = 9
    TabOrder = 4
    OnKeyPress = ETitenKeyPress
  end
  object BtBan: TBitBtn
    Left = 208
    Top = 56
    Width = 145
    Height = 25
    Caption = #30058#21495#30452#25509#25351#23450
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = BtBanClick
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 244
    Top = 192
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from M_HOJOU,M_NOUKA'
      'where M_HOJOU.'#36786#23478#30058#21495'=M_NOUKA.'#36786#23478#30058#21495)
    Left = 304
    Top = 264
  end
end

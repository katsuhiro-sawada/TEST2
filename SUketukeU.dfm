object frmSUketuke: TfrmSUketuke
  Left = 254
  Top = 218
  BorderIcons = [biSystemMenu]
  Caption = #12469#12531#12503#12523#30058#21495#26908#32034
  ClientHeight = 575
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #12513#12452#12522#12458
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 24
  object DBGrid1: TDBGrid
    Left = 0
    Top = 169
    Width = 695
    Height = 406
    Align = alClient
    DataSource = ds1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = SHIFTJIS_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = #12513#12452#12522#12458
    TitleFont.Style = []
    OnDblClick = BitBtn1Click
    OnTitleClick = DBGrid1TitleClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 695
    Height = 169
    Align = alTop
    ParentColor = True
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = -6
    object LCount: TLabel
      Left = 529
      Top = 148
      Width = 137
      Height = 12
      AutoSize = False
      Caption = 'LCount'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 12
      Top = 7
      Width = 350
      Height = 53
      Caption = #32068#21512#21517#12391#26908#32034
      TabOrder = 0
      object Button1: TButton
        Left = 223
        Top = 19
        Width = 82
        Height = 34
        Caption = #26908#32034
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object btnClose: TBitBtn
      Left = 464
      Top = 24
      Width = 89
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
      TabOrder = 2
      OnClick = btnCloseClick
    end
    object BitBtn1: TBitBtn
      Left = 368
      Top = 24
      Width = 89
      Height = 25
      Caption = #36984#25246'(&S)'
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
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object ELocateNo: TEdit
      Left = 368
      Top = 0
      Width = 121
      Height = 32
      TabOrder = 3
      Text = 'ELocateNo'
      Visible = False
    end
    object EMode: TEdit
      Left = 512
      Top = 0
      Width = 121
      Height = 32
      TabOrder = 4
      Text = 'EMode'
      Visible = False
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 24
      Top = 28
      Width = 205
      Height = 32
      DataField = #12467#12540#12489'3'
      DataSource = DDummy
      KeyField = #32068#21512#30058#21495
      ListField = #32068#21512#21517
      ListSource = dskumiai
      TabOrder = 5
    end
    object GroupBox2: TGroupBox
      Left = 12
      Top = 66
      Width = 661
      Height = 63
      Caption = #21463#20184#24180#26376#26085#12391#26908#32034
      TabOrder = 6
      object Label1: TLabel
        Left = 189
        Top = 24
        Width = 16
        Height = 24
        Caption = #65374
      end
      object BtNoKen: TButton
        Left = 386
        Top = 22
        Width = 99
        Height = 38
        Caption = #26908#32034
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BtNoKenClick
      end
      object Button4: TButton
        Left = 579
        Top = 11
        Width = 51
        Height = 21
        Caption = #12463#12522#12450
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
      object DateTimePicker2: TDateTimePicker
        Left = 140
        Top = 20
        Width = 17
        Height = 32
        Date = 44204.000000000000000000
        Time = 0.898608020834217300
        TabOrder = 2
        OnChange = DateTimePicker2Change
      end
      object DBEdit2: TDBEdit
        Left = 13
        Top = 21
        Width = 121
        Height = 32
        DataField = #26085#20184#38283#22987
        DataSource = DDummy
        TabOrder = 3
      end
      object DateTimePicker1: TDateTimePicker
        Left = 355
        Top = 21
        Width = 17
        Height = 32
        Date = 44204.000000000000000000
        Time = 0.898608020834217300
        TabOrder = 4
        OnChange = DateTimePicker1Change
      end
      object DBEdit7: TDBEdit
        Left = 229
        Top = 21
        Width = 121
        Height = 32
        DataField = #26085#20184#32066#20102
        DataSource = DDummy
        TabOrder = 5
      end
    end
  end
  object ds1: TDataSource
    DataSet = ADOQuery1
    Left = 452
    Top = 140
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      
        'SELECT T_UKETUKE.'#12469#12531#12503#12523#30058#21495', T_UKETUKE.'#21463#20184#24180#26376#26085', M_HOJOU.'#22275#22580#21517', M_NOUKA.'#36786 +
        #23478#21517', M_SAKUMOTU.'#20316#29289#21517', M_sakugata.'#20316#22411#21517', M_dojou.'#22303#22732#21517', M_HOJOU.'#36786#23478#30058#21495
      'FROM T_UKETUKE'
      '   INNER JOIN M_HOJOU'
      '   ON  (T_UKETUKE.'#22275#22580#30058#21495' = M_HOJOU.'#22275#22580#30058#21495')  '
      '   INNER JOIN M_SAKUMOTU'
      '   ON  (T_UKETUKE.'#20316#30446#12467#12540#12489' = M_SAKUMOTU.'#20316#30446#12467#12540#12489')  '
      '   AND  (T_UKETUKE.'#20316#29289#12467#12540#12489' = M_SAKUMOTU.'#20316#29289#12467#12540#12489')  '
      '   INNER JOIN "M_SAKUGATA.DB" M_sakugata'
      '   ON  (T_UKETUKE.'#20316#30446#12467#12540#12489' = M_sakugata.'#20316#30446#12467#12540#12489')  '
      '   AND  (T_UKETUKE.'#20316#29289#12467#12540#12489' = M_sakugata.'#20316#29289#12467#12540#12489')  '
      '   AND  (T_UKETUKE.'#20316#22411#12467#12540#12489' = M_sakugata.'#20316#22411#12467#12540#12489')  '
      '   INNER JOIN M_NOUKA'
      '   ON  (M_HOJOU.'#36786#23478#30058#21495' = M_NOUKA.'#36786#23478#30058#21495')  '
      '   INNER JOIN "M_DOJOU.db" M_dojou'
      '   ON  (M_HOJOU.'#22303#22732#12467#12540#12489' = M_dojou.'#22303#22732#12467#12540#12489') ')
    Left = 536
    Top = 184
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
  object dskumiai: TDataSource
    DataSet = ADOQkumiai
    Left = 44
    Top = 192
  end
  object ADODummy: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'T_DUMMY'
    Left = 600
    Top = 200
  end
  object DDummy: TDataSource
    DataSet = ADODummy
    Left = 332
    Top = 144
  end
end

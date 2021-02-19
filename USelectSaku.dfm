object FSelectSaku: TFSelectSaku
  Left = 0
  Top = 0
  Caption = #20316#29289#36984#25246
  ClientHeight = 143
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 102
    Width = 440
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 168
    ExplicitTop = 104
    ExplicitWidth = 185
    object BitBtn1: TBitBtn
      Left = 256
      Top = 6
      Width = 153
      Height = 25
      Caption = #36984#25246#23455#34892
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 6
      Width = 153
      Height = 25
      Caption = #12461#12515#12531#12475#12523
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 440
    Height = 102
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 418
    ExplicitHeight = 222
    object Label1: TLabel
      Left = 40
      Top = 12
      Width = 57
      Height = 16
      Caption = #20316#29289#21517#65306
    end
    object Label77: TLabel
      Left = 40
      Top = 41
      Width = 57
      Height = 16
      Caption = #20316#22411#21517#65306
    end
    object lblDositu: TLabel
      Left = 24
      Top = 72
      Width = 73
      Height = 16
      Caption = #22303#22732#31278#39006#65306
      Visible = False
    end
    object ComboBox1: TComboBox
      Left = 103
      Top = 9
      Width = 210
      Height = 24
      Style = csDropDownList
      DropDownCount = 20
      ItemHeight = 16
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object ComboBox2: TComboBox
      Left = 103
      Top = 39
      Width = 210
      Height = 24
      Style = csDropDownList
      DropDownCount = 10
      ItemHeight = 16
      TabOrder = 1
      OnChange = ComboBox2Change
    end
    object cmbDositu: TComboBox
      Left = 103
      Top = 69
      Width = 145
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 2
      Visible = False
      Items.Strings = (
        '1 '#28779#23665#24615#22303
        '2 '#20302#22320#22303#12539#21488#22320#22303
        '3 '#27877#28845#22320)
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 336
    Top = 8
  end
  object ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    Left = 336
    Top = 48
  end
end

object FBunTaihi: TFBunTaihi
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #20998#26512#22534#32933#36984#25246
  ClientHeight = 191
  ClientWidth = 498
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 498
    Height = 191
    Align = alClient
    TabOrder = 0
    ExplicitTop = -32
    ExplicitWidth = 361
    ExplicitHeight = 211
    object Label1: TLabel
      Left = 64
      Top = 24
      Width = 48
      Height = 16
      Caption = #22534#32933#21517
    end
    object Label2: TLabel
      Left = 185
      Top = 26
      Width = 32
      Height = 16
      Caption = #31378#32032
    end
    object Label3: TLabel
      Left = 249
      Top = 26
      Width = 38
      Height = 16
      Caption = #12522#12531#37240
    end
    object Label4: TLabel
      Left = 313
      Top = 26
      Width = 32
      Height = 16
      Caption = #21152#37324
    end
    object DBName1: TDBEdit
      Left = 16
      Top = 48
      Width = 153
      Height = 24
      DataField = #22534#32933#21517'1'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 175
      Top = 48
      Width = 58
      Height = 24
      DataField = #22534#32933#25104#20998'1N'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 239
      Top = 48
      Width = 58
      Height = 24
      DataField = #22534#32933#25104#20998'1P'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 303
      Top = 48
      Width = 58
      Height = 24
      DataField = #22534#32933#25104#20998'1K'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 376
      Top = 47
      Width = 75
      Height = 25
      Caption = #36984#25246
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 328
      Top = 151
      Width = 123
      Height = 25
      Caption = #12461#12515#12531#12475#12523
      TabOrder = 5
      OnClick = BitBtn2Click
    end
    object DBName2: TDBEdit
      Left = 16
      Top = 78
      Width = 153
      Height = 24
      DataField = #22534#32933#21517'2'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit6: TDBEdit
      Left = 175
      Top = 78
      Width = 58
      Height = 24
      DataField = #22534#32933#25104#20998'2N'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit7: TDBEdit
      Left = 239
      Top = 78
      Width = 58
      Height = 24
      DataField = #22534#32933#25104#20998'2P'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit8: TDBEdit
      Left = 303
      Top = 78
      Width = 58
      Height = 24
      DataField = #22534#32933#25104#20998'2K'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 9
    end
    object BitBtn3: TBitBtn
      Left = 376
      Top = 76
      Width = 75
      Height = 25
      Caption = #36984#25246
      TabOrder = 10
      OnClick = BitBtn3Click
    end
    object DBName3: TDBEdit
      Left = 16
      Top = 108
      Width = 153
      Height = 24
      DataField = #22534#32933#21517'3'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 11
    end
    object DBEdit10: TDBEdit
      Left = 175
      Top = 108
      Width = 58
      Height = 24
      DataField = #22534#32933#25104#20998'3N'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 12
    end
    object DBEdit11: TDBEdit
      Left = 239
      Top = 108
      Width = 58
      Height = 24
      DataField = #22534#32933#25104#20998'3P'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 13
    end
    object DBEdit12: TDBEdit
      Left = 303
      Top = 108
      Width = 58
      Height = 24
      DataField = #22534#32933#25104#20998'3K'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 14
    end
    object BitBtn4: TBitBtn
      Left = 376
      Top = 107
      Width = 75
      Height = 25
      Caption = #36984#25246
      TabOrder = 15
      OnClick = BitBtn4Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from T_UKETUKE')
    Left = 360
    Top = 8
  end
  object ds1: TDataSource
    DataSet = ADOQuery1
    Left = 392
    Top = 8
  end
end

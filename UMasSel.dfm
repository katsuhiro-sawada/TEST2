object FMasSel: TFMasSel
  Left = 0
  Top = 0
  Caption = #12510#12473#12479#36984#25246
  ClientHeight = 580
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 529
    Width = 365
    Height = 51
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 16
      Top = 16
      Width = 129
      Height = 25
      Caption = #12461#12515#12531#12475#12523
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 224
      Top = 16
      Width = 129
      Height = 25
      Caption = #36984#25246#23455#34892
      TabOrder = 1
      OnClick = BitBtn3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 365
    Height = 121
    Align = alTop
    TabOrder = 0
    object Eskey: TEdit
      Left = 32
      Top = 24
      Width = 137
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImeMode = imOpen
      ParentFont = False
      TabOrder = 0
      OnKeyDown = EskeyKeyDown
    end
    object BtNouka: TBitBtn
      Left = 175
      Top = 74
      Width = 137
      Height = 33
      Caption = #36786#23478#12510#12473#12479#30331#37682
      TabOrder = 1
      TabStop = False
      OnClick = BtNoukaClick
    end
    object BitBtn2: TBitBtn
      Left = 175
      Top = 22
      Width = 137
      Height = 33
      Caption = #36984#25246#23455#34892
      TabOrder = 2
      TabStop = False
      OnClick = BitBtn2Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 121
    Width = 365
    Height = 408
    Align = alClient
    DataSource = ds1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
  end
  object ds1: TDataSource
    DataSet = ADOQ
    Left = 128
    Top = 44
  end
  object ADOQ: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from M_SAKUMOKU')
    Left = 160
    Top = 48
  end
end

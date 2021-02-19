object FSousin: TFSousin
  Left = 295
  Top = 128
  Width = 629
  Height = 257
  Caption = '送受信'
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'ＭＳ Ｐゴシック'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 621
    Height = 153
    Align = alClient
    ParentColor = True
    TabOrder = 0
    object Label1: TLabel
      Left = 344
      Top = 40
      Width = 224
      Height = 15
      Caption = '受付、分析、地点位置マスタのみ'
    end
    object Label2: TLabel
      Left = 344
      Top = 56
      Width = 129
      Height = 15
      Caption = 'の送受信をします。'
    end
    object Label3: TLabel
      Left = 344
      Top = 104
      Width = 210
      Height = 15
      Caption = '全てのデータについて送受信を'
    end
    object Label4: TLabel
      Left = 344
      Top = 120
      Width = 71
      Height = 15
      Caption = '行います。'
    end
    object Btkanni: TBitBtn
      Left = 88
      Top = 31
      Width = 241
      Height = 49
      Caption = '簡易モード'
      TabOrder = 0
      OnClick = BtkanniClick
    end
    object BtKanzen: TBitBtn
      Left = 88
      Top = 95
      Width = 241
      Height = 49
      Caption = '完全モード'
      TabOrder = 1
      OnClick = BtKanzenClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 153
    Width = 621
    Height = 70
    Align = alBottom
    ParentColor = True
    TabOrder = 1
    object Btsyuuryou: TBitBtn
      Left = 216
      Top = 9
      Width = 241
      Height = 49
      Caption = 'キャンセル'
      TabOrder = 0
      OnClick = BtsyuuryouClick
    end
  end
end

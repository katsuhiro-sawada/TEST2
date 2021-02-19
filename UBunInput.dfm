object FBunInput: TFBunInput
  Left = 0
  Top = 0
  Caption = #35079#25968#34892#20837#21147
  ClientHeight = 165
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 124
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 90
    object Label1: TLabel
      Left = 24
      Top = 40
      Width = 82
      Height = 18
      Caption = #12469#12531#12503#12523#30058#21495
    end
    object Label2: TLabel
      Left = 303
      Top = 40
      Width = 48
      Height = 18
      Caption = #31665#30058#21495
    end
    object Label4: TLabel
      Left = 440
      Top = 40
      Width = 98
      Height = 18
      Caption = #36861#21152#12469#12531#12503#12523#25968
    end
    object Label3: TLabel
      Left = 42
      Top = 80
      Width = 64
      Height = 18
      Caption = #25285#24403#32773#21517
    end
    object Esample: TEdit
      Left = 112
      Top = 37
      Width = 121
      Height = 26
      TabOrder = 0
      Text = '000001'
    end
    object BitBtn1: TBitBtn
      Left = 239
      Top = 38
      Width = 42
      Height = 25
      Caption = #26412#26085
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object SpHako: TSpinEdit
      Left = 357
      Top = 37
      Width = 60
      Height = 28
      MaxLength = 999
      MaxValue = 999
      MinValue = 1
      TabOrder = 2
      Value = 1
    end
    object SpKazu: TSpinEdit
      Left = 544
      Top = 37
      Width = 57
      Height = 28
      MaxValue = 999
      MinValue = 1
      TabOrder = 3
      Value = 1
    end
    object ETantou: TEdit
      Left = 112
      Top = 77
      Width = 121
      Height = 26
      TabOrder = 4
      Text = 'XXXXXX'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 124
    Width = 644
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 90
    object BitBtn2: TBitBtn
      Left = 276
      Top = 6
      Width = 165
      Height = 25
      Caption = #23455#34892
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 460
      Top = 6
      Width = 165
      Height = 25
      Caption = #12461#12515#12531#12475#12523
      TabOrder = 1
      OnClick = BitBtn3Click
    end
  end
end

object FETaitoru: TFETaitoru
  Left = 0
  Top = 0
  Caption = #19968#35239#12479#12452#12488#12523
  ClientHeight = 119
  ClientWidth = 607
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
    Width = 607
    Height = 119
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 80
    ExplicitTop = 56
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 24
      Top = 33
      Width = 79
      Height = 16
      Caption = #31665#30058#21495#12288'No.'
    end
    object Label2: TLabel
      Left = 176
      Top = 33
      Width = 32
      Height = 16
      Caption = 'JA'#21517
    end
    object Label3: TLabel
      Left = 384
      Top = 33
      Width = 48
      Height = 16
      Caption = #25903#25152#21517
    end
    object BitBtn1: TBitBtn
      Left = 392
      Top = 72
      Width = 193
      Height = 25
      Caption = #23455#34892
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object ENo: TEdit
      Left = 109
      Top = 30
      Width = 52
      Height = 20
      TabOrder = 1
    end
    object EJA: TEdit
      Left = 214
      Top = 30
      Width = 147
      Height = 20
      TabOrder = 2
    end
    object ESisyo: TEdit
      Left = 438
      Top = 30
      Width = 147
      Height = 20
      TabOrder = 3
    end
  end
end

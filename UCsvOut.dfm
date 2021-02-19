object FCsvOut: TFCsvOut
  Left = 0
  Top = 0
  Caption = #12486#12461#12473#12488#20986#21147
  ClientHeight = 171
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 130
    Align = alClient
    TabOrder = 0
    object Eoutfile: TEdit
      Left = 32
      Top = 53
      Width = 625
      Height = 26
      TabOrder = 0
    end
    object PB1: TProgressBar
      Left = 1
      Top = 104
      Width = 735
      Height = 25
      Align = alBottom
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 663
      Top = 54
      Width = 34
      Height = 25
      Caption = '...'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 130
    Width = 737
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 224
      Top = 6
      Width = 185
      Height = 25
      Caption = #20986#21147#23455#34892
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 536
      Top = 6
      Width = 185
      Height = 25
      Caption = #12461#12515#12531#12475#12523
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.CSV'
    Filter = 'CSV'#12501#12449#12452#12523'|*.CSV'
    Left = 504
    Top = 8
  end
end

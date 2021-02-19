object FSehiSekkei: TFSehiSekkei
  Left = 0
  Top = 0
  Caption = 'FSehiSekkei'
  ClientHeight = 541
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 500
    Width = 725
    Height = 41
    Align = alBottom
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 725
    Height = 500
    Align = alClient
    TabOrder = 1
    OnClick = Panel2Click
    object ListSehiM: TListBox
      Left = 16
      Top = 24
      Width = 201
      Height = 217
      ItemHeight = 13
      TabOrder = 0
    end
    object ListSehiB: TListBox
      Left = 223
      Top = 24
      Width = 201
      Height = 217
      ItemHeight = 13
      TabOrder = 1
    end
    object ListSehiB2: TListBox
      Left = 430
      Top = 24
      Width = 201
      Height = 217
      ItemHeight = 13
      TabOrder = 2
    end
    object ListKasei: TListBox
      Left = 16
      Top = 247
      Width = 201
      Height = 217
      ItemHeight = 13
      TabOrder = 3
    end
    object ListTanpi: TListBox
      Left = 223
      Top = 247
      Width = 201
      Height = 217
      ItemHeight = 13
      TabOrder = 4
    end
    object TMPList: TListBox
      Left = 486
      Top = 247
      Width = 201
      Height = 217
      ItemHeight = 13
      TabOrder = 5
    end
  end
end

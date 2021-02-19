object FSakumokuSel: TFSakumokuSel
  Left = 234
  Top = 230
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'çÏñ⁄ëIë'
  ClientHeight = 115
  ClientWidth = 224
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'ÇlÇr ÇoÉSÉVÉbÉN'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 104
    Top = 45
    Width = 16
    Height = 15
    Caption = 'Å`'
  end
  object CbSaku: TComboBox
    Left = 16
    Top = 8
    Width = 193
    Height = 23
    Style = csDropDownList
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'ÇlÇr ÇoÉSÉVÉbÉN'
    Font.Style = [fsBold]
    ItemHeight = 15
    ParentFont = False
    TabOrder = 0
    OnChange = CbSakuChange
    Items.Strings = (
      'êÖàÓ'
      'î®'
      'ñÏçÿ'
      'â‘Ç´ÅEâ é˜'
      'ëêínÅEéîóø'
      'ÇªÇÃëº'
      'ä»à’'
      'ëÕîÏ')
  end
  object BtSet: TBitBtn
    Left = 16
    Top = 72
    Width = 193
    Height = 25
    Caption = 'åàíË'
    TabOrder = 1
    OnClick = BtSetClick
  end
  object CbSNo: TComboBox
    Left = 16
    Top = 40
    Width = 81
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    TabOrder = 2
    OnChange = CbSNoChange
    Items.Strings = (
      '1000'
      '2000'
      '4000'
      '6000'
      '0001'
      '7000'
      '8000'
      '9000')
  end
  object CbENo: TComboBox
    Left = 128
    Top = 40
    Width = 81
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    TabOrder = 3
    OnChange = CbENoChange
    Items.Strings = (
      '1999'
      '3999'
      '5999'
      '6999'
      '0999'
      '7999'
      '8999'
      '9999')
  end
end

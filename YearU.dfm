object frmYear: TfrmYear
  Left = 359
  Top = 239
  BorderStyle = bsDialog
  Caption = 'îNìxêÿÇËë÷Ç¶'
  ClientHeight = 130
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'ÇlÇr ÇoÉSÉVÉbÉN'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 287
    Height = 17
    Align = alTop
    Shape = bsSpacer
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 17
    Width = 287
    Height = 61
    Align = alTop
    Caption = 'îNìx'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 54
      Height = 12
      Caption = 'ëÄçÏîNìxÅF'
    end
    object ComboBox1: TComboBox
      Left = 80
      Top = 20
      Width = 145
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 44
    Top = 92
    Width = 89
    Height = 25
    Caption = 'ëIë(&S)'
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'ÇlÇr ÇoÉSÉVÉbÉN'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 92
    Width = 89
    Height = 25
    Caption = '∑¨›æŸ(&C)'
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'ÇlÇr ÇoÉSÉVÉbÉN'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
end

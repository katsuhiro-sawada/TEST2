object frmCenter: TfrmCenter
  Left = 581
  Top = 336
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #12475#12531#12479#12540#20999#12426#26367#12360
  ClientHeight = 129
  ClientWidth = 286
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 286
    Height = 17
    Align = alTop
    Shape = bsSpacer
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 17
    Width = 286
    Height = 61
    Align = alTop
    Caption = #30331#37682#12377#12427#12475#12531#12479#12540
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 48
      Height = 12
      Caption = #12475#12531#12479#12540#65306
    end
    object ComboBox1: TComboBox
      Left = 80
      Top = 20
      Width = 145
      Height = 20
      Style = csDropDownList
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 44
    Top = 92
    Width = 89
    Height = 25
    Caption = #36984#25246'(&S)'
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
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
    Caption = #65399#65388#65437#65406#65433'(&C)'
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    TableName = 'M_CENTER'
    Left = 152
    Top = 56
  end
end

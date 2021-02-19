object InputNoForm: TInputNoForm
  Left = 276
  Top = 125
  BorderStyle = bsDialog
  Caption = #21360#21047#26465#20214
  ClientHeight = 267
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 393
    Height = 65
    Align = alTop
    Shape = bsSpacer
  end
  object L2: TLabel
    Left = 16
    Top = 24
    Width = 217
    Height = 15
    Caption = #21360#21047#12377#12427#26465#20214#12434#36984#25246#12375#12390#12367#12384#12373#12356
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 65
    Width = 393
    Height = 161
    ActivePage = Tabsample
    Align = alClient
    DoubleBuffered = False
    MultiLine = True
    ParentDoubleBuffered = False
    TabOrder = 0
    object Tabsample: TTabSheet
      Caption = #12469#12531#12503#12523#30058#21495
      object Label1: TLabel
        Left = 117
        Top = 50
        Width = 16
        Height = 15
        Caption = #65374
      end
      object Label2: TLabel
        Left = 20
        Top = 18
        Width = 263
        Height = 15
        Caption = #12469#12531#12503#12523#30058#21495#12398#31684#22258#12434#20837#21147#12375#12390#12367#12384#12373#12356
      end
      object Edit1: TEdit
        Left = 32
        Top = 46
        Width = 53
        Height = 23
        ImeMode = imClose
        MaxLength = 4
        TabOrder = 0
        Text = '0001'
        OnExit = Edit1Exit
      end
      object Edit2: TEdit
        Left = 160
        Top = 46
        Width = 53
        Height = 23
        ImeMode = imClose
        MaxLength = 4
        TabOrder = 1
        Text = '9999'
        OnExit = Edit1Exit
      end
    end
    object TabSheet3: TTabSheet
      Caption = #20316#29289#25351#23450
      ImageIndex = 2
      object Label6: TLabel
        Left = 16
        Top = 24
        Width = 41
        Height = 15
        Caption = #20316#29289#65306
      end
      object ComboBox2: TComboBox
        Left = 60
        Top = 24
        Width = 145
        Height = 23
        Style = csDropDownList
        TabOrder = 0
      end
    end
  end
  object EMode: TEdit
    Left = 208
    Top = 8
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'EMode'
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 226
    Width = 393
    Height = 41
    Align = alBottom
    ParentColor = True
    TabOrder = 2
    object btnOK: TButton
      Left = 104
      Top = 8
      Width = 113
      Height = 25
      Caption = #34920' '#31034
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 264
      Top = 8
      Width = 75
      Height = 25
      Caption = #65399#65388#65437#65406#65433
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.ADOConnection1
    Parameters = <>
    Left = 32
    Top = 16
  end
  object TSisyo: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    TableName = 'M_SISYO'
    Left = 320
    Top = 96
  end
end

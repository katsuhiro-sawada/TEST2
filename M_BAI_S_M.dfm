inherited mstBai_S_MForm: TmstBai_S_MForm
  Left = 278
  Top = 233
  Caption = #33510#22303#26045#32933#37327
  ClientHeight = 285
  Font.Height = -15
  Font.Style = [fsBold]
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 15
  inherited SelectPanel: TPanel
    Height = 216
    TabOrder = 1
    ExplicitHeight = 216
    object Shape1: TShape
      Left = 152
      Top = 16
      Width = 153
      Height = 89
      Brush.Style = bsClear
    end
    object Shape6: TShape
      Left = 304
      Top = 16
      Width = 113
      Height = 89
      Brush.Style = bsClear
    end
    object Label1: TLabel
      Left = 224
      Top = 120
      Width = 16
      Height = 15
      Caption = #65374
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 320
      Top = 40
      Width = 48
      Height = 15
      Caption = #26045#32933#37327
    end
    object Label4: TLabel
      Left = 176
      Top = 40
      Width = 112
      Height = 15
      Caption = #20132#25563#24615#33510#22303#21547#37327
    end
    object Label6: TLabel
      Left = 208
      Top = 64
      Width = 82
      Height = 15
      Caption = #65288'mg/100g'#65289
    end
    object Label7: TLabel
      Left = 224
      Top = 152
      Width = 16
      Height = 15
      Caption = #65374
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape3: TShape
      Left = 304
      Top = 104
      Width = 113
      Height = 81
      Brush.Style = bsClear
    end
    object Label3: TLabel
      Left = 320
      Top = 64
      Width = 69
      Height = 15
      Caption = #65288'kg/10a'#65289
    end
    object Shape2: TShape
      Left = 152
      Top = 104
      Width = 153
      Height = 81
      Brush.Style = bsClear
    end
    object DBEdit1: TDBEdit
      Left = 248
      Top = 112
      Width = 41
      Height = 23
      DataField = #22522#28310#20516'1'
      DataSource = ds1
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 328
      Top = 112
      Width = 65
      Height = 23
      DataField = #26045#32933#37327'1'
      DataSource = ds1
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit6: TDBEdit
      Left = 328
      Top = 144
      Width = 65
      Height = 23
      DataField = #26045#32933#37327'2'
      DataSource = ds1
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit9: TDBEdit
      Left = 176
      Top = 144
      Width = 41
      Height = 23
      DataField = #22522#28310#20516'1'
      DataSource = ds1
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  inherited Panel2: TPanel
    TabOrder = 0
  end
  inherited EditPanel: TPanel
    Top = 257
    Height = 9
    ExplicitTop = 257
    ExplicitHeight = 9
  end
  inherited StatusBar1: TStatusBar
    Top = 266
    ExplicitTop = 266
  end
  object Table1: TTable
    TableName = 'M_BAI_S_M.DB'
  end
end

inherited mstCMTForm: TmstCMTForm
  Left = 238
  Top = 138
  Caption = #12467#12513#12531#12488#12510#12473#12479
  ClientHeight = 423
  ClientWidth = 585
  OldCreateOrder = True
  ExplicitWidth = 601
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 12
  inherited Splitter1: TSplitter
    Top = 41
    Width = 585
    ExplicitTop = 41
    ExplicitWidth = 593
  end
  inherited EditPanel: TPanel
    Top = 267
    Width = 585
    Height = 137
    Align = alBottom
    ExplicitTop = 267
    ExplicitWidth = 585
    ExplicitHeight = 137
    object Label1: TLabel
      Left = 28
      Top = 12
      Width = 30
      Height = 12
      Caption = #20107#38917#65306
    end
    object DBMemo1: TDBMemo
      Left = 64
      Top = 16
      Width = 433
      Height = 105
      DataField = #20107#38917
      DataSource = ds1
      TabOrder = 0
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 404
    Width = 585
    ExplicitTop = 404
    ExplicitWidth = 585
  end
  inherited Panel2: TPanel
    Width = 585
    ExplicitWidth = 585
    inherited btnNew: TBitBtn
      Visible = False
    end
    inherited btnDel: TBitBtn
      Visible = False
    end
  end
  inherited GridPanel: TPanel
    Top = 97
    Width = 585
    ExplicitTop = 97
    ExplicitWidth = 585
    inherited DBGrid1: TDBGrid
      Width = 585
      DataSource = DataSource1
      OnCellClick = DBGrid1CellClick
    end
  end
  object Panel1: TPanel [5]
    Left = 0
    Top = 44
    Width = 585
    Height = 53
    Align = alTop
    TabOrder = 4
    object Label5: TLabel
      Left = 12
      Top = 12
      Width = 120
      Height = 12
      Caption = #19968#35239#12434#20316#29289#12391#32094#12426#36796#12415#65306
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
    end
    object cmbSakumotu: TComboBox
      Left = 140
      Top = 8
      Width = 169
      Height = 20
      Style = csDropDownList
      DropDownCount = 20
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = cmbSakumotuChange
    end
  end
  object DataSource1: TDataSource
    Left = 552
    Top = 161
  end
end

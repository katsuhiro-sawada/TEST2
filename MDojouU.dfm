inherited mstDojouForm: TmstDojouForm
  Left = 288
  Top = 213
  Width = 600
  Caption = '土壌マスタ'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Splitter1: TSplitter
    Top = 209
    Width = 592
  end
  inherited EditPanel: TPanel
    Width = 592
    Height = 168
    object Label1: TLabel
      Left = 64
      Top = 16
      Width = 60
      Height = 12
      Caption = '土壌コード：'
    end
    object Label2: TLabel
      Left = 64
      Top = 48
      Width = 54
      Height = 12
      Caption = '土壌名称：'
    end
    object DBEdit1: TDBEdit
      Left = 132
      Top = 12
      Width = 29
      Height = 20
      DataField = '土壌コード'
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 132
      Top = 44
      Width = 157
      Height = 20
      DataField = '土壌名'
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object GroupBox1: TGroupBox
      Left = 60
      Top = 76
      Width = 526
      Height = 88
      Caption = '施肥マスタの土壌区分との関連'
      TabOrder = 2
      object Label3: TLabel
        Left = 12
        Top = 33
        Width = 84
        Height = 12
        Caption = '畑作土壌コード：'
      end
      object Label4: TLabel
        Left = 12
        Top = 57
        Width = 66
        Height = 12
        Caption = '畑牧土壌名：'
      end
      object Label6: TLabel
        Left = 276
        Top = 57
        Width = 66
        Height = 12
        Caption = '水稲土壌名：'
      end
      object Label5: TLabel
        Left = 276
        Top = 29
        Width = 84
        Height = 12
        Caption = '水稲土壌コード：'
      end
      object DBEdit4: TDBEdit
        Left = 108
        Top = 53
        Width = 137
        Height = 20
        DataField = '畑牧土壌名'
        DataSource = ds1
        ImeMode = imOpen
        TabOrder = 0
        OnKeyPress = EnterKeyPress
      end
      object DBEdit3: TDBEdit
        Left = 108
        Top = 29
        Width = 29
        Height = 20
        DataField = '畑牧土壌コード'
        DataSource = ds1
        ImeMode = imClose
        TabOrder = 1
        OnKeyPress = EnterKeyPress
      end
      object DBEdit5: TDBEdit
        Left = 368
        Top = 25
        Width = 29
        Height = 20
        DataField = '水稲土壌コード'
        DataSource = ds1
        ImeMode = imClose
        TabOrder = 2
        OnKeyPress = EnterKeyPress
      end
      object DBEdit6: TDBEdit
        Left = 368
        Top = 53
        Width = 137
        Height = 20
        DataField = '水稲土壌名'
        DataSource = ds1
        ImeMode = imOpen
        TabOrder = 3
        OnKeyPress = EnterKeyPress
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 592
  end
  inherited Panel2: TPanel
    Width = 592
  end
  inherited GridPanel: TPanel
    Top = 212
    Width = 592
    Height = 194
    inherited DBGrid1: TDBGrid
      Width = 592
      Height = 194
    end
  end
  inherited Table1: TTable
    TableName = 'M_DOJOU.db'
  end
end

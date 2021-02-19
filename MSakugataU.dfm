inherited mstSakugataForm: TmstSakugataForm
  Left = 318
  Top = 239
  Caption = #20316#22411#12510#12473#12479
  Font.Height = -15
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Splitter1: TSplitter
    Top = 185
    ExplicitTop = 181
  end
  inherited EditPanel: TPanel
    Top = 49
    Height = 136
    ExplicitTop = 49
    ExplicitHeight = 136
    object Label1: TLabel
      Left = 28
      Top = 60
      Width = 75
      Height = 15
      Caption = #20316#22411#12467#12540#12489#65306
    end
    object Label2: TLabel
      Left = 28
      Top = 84
      Width = 53
      Height = 15
      Caption = #20316#22411#21517#65306
    end
    object Label4: TLabel
      Left = 28
      Top = 36
      Width = 38
      Height = 15
      Caption = #20316#29289#65306
    end
    object DBEdit1: TDBEdit
      Left = 112
      Top = 56
      Width = 29
      Height = 23
      DataField = #20316#22411#12467#12540#12489
      DataSource = ds1
      ImeMode = imClose
      TabOrder = 1
      OnKeyPress = EnterKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 112
      Top = 80
      Width = 157
      Height = 23
      DataField = #20316#22411#21517
      DataSource = ds1
      ImeMode = imOpen
      TabOrder = 2
      OnKeyPress = EnterKeyPress
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 112
      Top = 27
      Width = 145
      Height = 23
      DataField = #20316#29289#12467#12540#12489
      DataSource = ds1
      KeyField = #20316#29289#12467#12540#12489
      ListField = #20316#29289#21517
      ListSource = ds2
      TabOrder = 0
      OnKeyPress = EnterKeyPress
    end
    object btnCopy: TBitBtn
      Left = 272
      Top = 8
      Width = 85
      Height = 25
      Hint = #12487#12540#12479#12434#12467#12500#12540#12375#12414#12377
      Caption = #12467#12500#12540
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888800008888888888888888888800008888777777778888888800008800
        00000000788888880000880BFFFBFFF0777777880000880F444444F000000078
        0000880FFBFFFBF0FBFFF0780000880F444444F04444F0780000880BFFFBFFF0
        FFFBF0780000880F444444F04444F0780000880FFBFFFBF0FBFFF0780000880F
        44F000004477F0780000880BFFF0FFF0FF0007780000880F44F0FB00F70A0778
        0000880FFBF0F0FF000A00080000880000000F470AAAAA080000888888880FFB
        000A00080000888888880000770A088800008888888888888800088800008888
        88888888888888880000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
    end
    object Btharituke: TBitBtn
      Left = 272
      Top = 40
      Width = 85
      Height = 25
      Hint = #12487#12540#12479#12434#36028#12426#20184#12369#12414#12377
      Caption = #36028#12426#20184#12369
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888800008888888888888888888800008888777777778888888800008800
        00000000788888880000880BFFFBFFF0777777880000880F444444F000000078
        0000880FFBFFFBF0FBFFF0780000880F444444F04444F0780000880BFFFBFFF0
        FFFBF0780000880F444444F04444F0780000880FFBFFFBF0FBFFF0780000880F
        44F000004477F0780000880BFFF0FFF0FF0007780000880F44F0FB00F70A0778
        0000880FFBF0F0FF000A00080000880000000F470AAAAA080000888888880FFB
        000A00080000888888880000770A088800008888888888888800088800008888
        88888888888888880000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Height = 49
    ExplicitHeight = 49
    inherited btnNew: TBitBtn
      Left = 12
      ExplicitLeft = 12
    end
    inherited btnEdit: TBitBtn
      Left = 104
      ExplicitLeft = 104
    end
    inherited btnDel: TBitBtn
      Left = 196
      ExplicitLeft = 196
    end
    inherited btnPost: TBitBtn
      Left = 296
      ExplicitLeft = 296
    end
    inherited btnCancel: TBitBtn
      Left = 392
      ExplicitLeft = 392
    end
    inherited btnClose: TBitBtn
      Left = 488
      ExplicitLeft = 488
    end
  end
  inherited GridPanel: TPanel
    Top = 188
    Height = 207
    ExplicitTop = 188
    ExplicitHeight = 207
    inherited DBGrid1: TDBGrid
      Height = 207
      TitleFont.Height = -15
    end
  end
  inherited ds1: TDataSource
    Left = 456
    Top = 112
  end
  inherited ADOTable1: TADOTable
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    AfterPost = nil
    TableName = 'M_SAKUGATA'
    Left = 400
    Top = 112
  end
  object ds2: TDataSource
    DataSet = ADOTable2
    OnStateChange = ds1StateChange
    Left = 456
    Top = 56
  end
  object ADOTable2: TADOTable
    Connection = DataModule1.ADOConnection1
    AfterPost = ADOTable1AfterPost
    TableName = 'M_SAKUMOTU'
    Left = 392
    Top = 56
  end
end

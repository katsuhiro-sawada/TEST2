object FBarCodePrn: TFBarCodePrn
  Left = 282
  Top = 119
  Width = 436
  Height = 439
  Caption = 'バーコード印刷'
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'ＭＳ Ｐゴシック'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 364
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 64
      Width = 69
      Height = 12
      Caption = 'サンプル番号'
    end
    object Label2: TLabel
      Left = 216
      Top = 64
      Width = 12
      Height = 12
      Caption = '～'
    end
    object Label3: TLabel
      Left = 88
      Top = 96
      Width = 36
      Height = 12
      Caption = '出力数'
    end
    object Label4: TLabel
      Left = 48
      Top = 24
      Width = 72
      Height = 12
      Caption = '用紙開始位置'
    end
    object Label5: TLabel
      Left = 136
      Top = 24
      Width = 48
      Height = 12
      Caption = '縦（1～5）'
    end
    object Label6: TLabel
      Left = 232
      Top = 24
      Width = 48
      Height = 12
      Caption = '横（1～4）'
    end
    object Label7: TLabel
      Left = 56
      Top = 216
      Width = 12
      Height = 12
      Caption = '↓'
    end
    object Label8: TLabel
      Left = 56
      Top = 240
      Width = 12
      Height = 12
      Caption = '↓'
    end
    object Label9: TLabel
      Left = 56
      Top = 264
      Width = 12
      Height = 12
      Caption = '↓'
    end
    object Label10: TLabel
      Left = 56
      Top = 288
      Width = 12
      Height = 12
      Caption = '↓'
    end
    object Label11: TLabel
      Left = 56
      Top = 312
      Width = 12
      Height = 12
      Caption = '↓'
    end
    object Label12: TLabel
      Left = 80
      Top = 216
      Width = 12
      Height = 12
      Caption = '→'
    end
    object Label13: TLabel
      Left = 112
      Top = 216
      Width = 12
      Height = 12
      Caption = '→'
    end
    object Label14: TLabel
      Left = 144
      Top = 216
      Width = 12
      Height = 12
      Caption = '→'
    end
    object Shape1: TShape
      Left = 248
      Top = 208
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label15: TLabel
      Left = 40
      Top = 184
      Width = 48
      Height = 12
      Caption = '出力方向'
    end
    object Label16: TLabel
      Left = 256
      Top = 216
      Width = 14
      Height = 12
      Caption = '1,1'
    end
    object Shape2: TShape
      Left = 248
      Top = 232
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label17: TLabel
      Left = 256
      Top = 240
      Width = 16
      Height = 12
      Caption = '2,1,'
    end
    object Shape3: TShape
      Left = 248
      Top = 256
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label18: TLabel
      Left = 256
      Top = 264
      Width = 14
      Height = 12
      Caption = '3,1'
    end
    object Shape4: TShape
      Left = 248
      Top = 280
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label19: TLabel
      Left = 256
      Top = 288
      Width = 14
      Height = 12
      Caption = '4,1'
    end
    object Shape5: TShape
      Left = 248
      Top = 304
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label20: TLabel
      Left = 256
      Top = 312
      Width = 14
      Height = 12
      Caption = '5,1'
    end
    object Shape6: TShape
      Left = 280
      Top = 208
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label21: TLabel
      Left = 288
      Top = 216
      Width = 14
      Height = 12
      Caption = '1,2'
    end
    object Shape7: TShape
      Left = 280
      Top = 232
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label22: TLabel
      Left = 288
      Top = 240
      Width = 14
      Height = 12
      Caption = '2,1'
    end
    object Shape8: TShape
      Left = 280
      Top = 256
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label23: TLabel
      Left = 288
      Top = 264
      Width = 14
      Height = 12
      Caption = '3,2'
    end
    object Shape9: TShape
      Left = 280
      Top = 280
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label24: TLabel
      Left = 288
      Top = 288
      Width = 14
      Height = 12
      Caption = '4,2'
    end
    object Shape10: TShape
      Left = 280
      Top = 304
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label25: TLabel
      Left = 288
      Top = 312
      Width = 14
      Height = 12
      Caption = '5,2'
    end
    object Shape11: TShape
      Left = 312
      Top = 208
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label26: TLabel
      Left = 320
      Top = 216
      Width = 14
      Height = 12
      Caption = '1,3'
    end
    object Shape12: TShape
      Left = 312
      Top = 232
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label27: TLabel
      Left = 320
      Top = 240
      Width = 14
      Height = 12
      Caption = '2,3'
    end
    object Shape13: TShape
      Left = 312
      Top = 256
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label28: TLabel
      Left = 320
      Top = 264
      Width = 14
      Height = 12
      Caption = '3,3'
    end
    object Shape14: TShape
      Left = 312
      Top = 280
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label29: TLabel
      Left = 320
      Top = 288
      Width = 14
      Height = 12
      Caption = '4,3'
    end
    object Shape15: TShape
      Left = 312
      Top = 304
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label30: TLabel
      Left = 320
      Top = 312
      Width = 14
      Height = 12
      Caption = '5,3'
    end
    object Shape16: TShape
      Left = 344
      Top = 208
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label31: TLabel
      Left = 352
      Top = 216
      Width = 14
      Height = 12
      Caption = '1,4'
    end
    object Shape17: TShape
      Left = 344
      Top = 232
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label32: TLabel
      Left = 352
      Top = 240
      Width = 14
      Height = 12
      Caption = '2,4'
    end
    object Shape18: TShape
      Left = 344
      Top = 256
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label33: TLabel
      Left = 352
      Top = 264
      Width = 14
      Height = 12
      Caption = '3,4'
    end
    object Shape19: TShape
      Left = 344
      Top = 280
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label34: TLabel
      Left = 352
      Top = 288
      Width = 14
      Height = 12
      Caption = '4,4'
    end
    object Shape20: TShape
      Left = 344
      Top = 304
      Width = 33
      Height = 25
      Brush.Style = bsClear
    end
    object Label35: TLabel
      Left = 352
      Top = 312
      Width = 14
      Height = 12
      Caption = '5,4'
    end
    object Shape21: TShape
      Left = 224
      Top = 200
      Width = 177
      Height = 137
      Brush.Style = bsClear
    end
    object Shape22: TShape
      Left = 24
      Top = 200
      Width = 177
      Height = 137
      Brush.Style = bsClear
    end
    object Label36: TLabel
      Left = 224
      Top = 184
      Width = 72
      Height = 12
      Caption = '出力開始位置'
    end
    object ESno: TEdit
      Left = 144
      Top = 56
      Width = 60
      Height = 20
      ImeMode = imClose
      TabOrder = 0
    end
    object Es: TEdit
      Left = 192
      Top = 16
      Width = 25
      Height = 20
      TabOrder = 1
      Text = '1'
    end
    object Ee: TEdit
      Left = 288
      Top = 16
      Width = 25
      Height = 20
      TabOrder = 2
      Text = '1'
    end
    object Ec: TEdit
      Left = 144
      Top = 88
      Width = 33
      Height = 20
      TabOrder = 3
    end
    object Ch1: TCheckBox
      Left = 56
      Top = 128
      Width = 161
      Height = 17
      Caption = '前処理終了以外'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 364
    Width = 428
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BtCan: TButton
      Left = 320
      Top = 8
      Width = 91
      Height = 25
      Caption = 'キャンセル'
      TabOrder = 0
      OnClick = BtCanClick
    end
    object BtJikkou: TButton
      Left = 24
      Top = 8
      Width = 121
      Height = 25
      Caption = 'エクセル出力実行'
      TabOrder = 1
      OnClick = BtJikkouClick
    end
  end
  object Q1: TQuery
    DatabaseName = 'DOJO'
    Left = 32
    Top = 32
  end
end

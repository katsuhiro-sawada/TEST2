object frmPreview: TfrmPreview
  Left = 309
  Top = 93
  Caption = #12503#12524#12499#12517#12540
  ClientHeight = 730
  ClientWidth = 1200
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 711
    Width = 1200
    Height = 19
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <
      item
        Width = 50
      end
      item
        Width = 80
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitWidth = 1544
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1200
    Height = 89
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ParentColor = True
    TabOrder = 1
    object SpDojyou: TSpeedButton
      Left = 10
      Top = 10
      Width = 138
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      GroupIndex = 100
      Down = True
      Caption = #22303#22732#20998#26512#32080#26524#31080
      OnClick = SpDojyouClick
    end
    object SpeedButton1: TSpeedButton
      Left = 315
      Top = 50
      Width = 40
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      GroupIndex = 100
      Caption = #12456#12463#12475#12523#12501#12449#12452#12523#20986#21147
      Visible = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 156
      Top = 11
      Width = 138
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      GroupIndex = 100
      Caption = #26045#32933#35373#35336#31080
      OnClick = SpeedButton2Click
    end
    object Panel3: TPanel
      Left = 257
      Top = 1
      Width = 942
      Height = 87
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      ExplicitHeight = 42
      object FontBtn: TBitBtn
        Left = 492
        Top = 48
        Width = 117
        Height = 32
        Hint = #65420#65439#65434#65419#65438#65389#65392#12398#65420#65387#65437#65412#12434#22793#26356#12375#12414#12377
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Font'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333FFF33FFFFF33333300033000
          00333337773377777333333330333300033333337FF33777F333333330733300
          0333333377FFF777F33333333700000073333333777777773333333333033000
          3333333337FF777F333333333307300033333333377F777F3333333333703007
          33333333377F7773333333333330000333333333337777F33333333333300003
          33333333337777F3333333333337007333333333337777333333333333330033
          3333333333377333333333333333033333333333333733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = FontBtnClick
      end
      object BitBtn3: TBitBtn
        Left = 492
        Top = 8
        Width = 112
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #65420#65439#65432#65437#65408
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
          1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
          1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
          193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
          11155557F755F777777555000755033305555577755F75F77F55555555503335
          0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
          05555757F75F75557F5505000333555505557F777FF755557F55000000355557
          07557777777F55557F5555000005555707555577777FF5557F55553000075557
          0755557F7777FFF5755555335000005555555577577777555555}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn3Click
      end
      object btnCMT: TBitBtn
        Left = 339
        Top = 48
        Width = 145
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #12467#12513#12531#12488#20837#21147
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 4
        OnClick = btnCMTClick
      end
      object btnSaveAs: TBitBtn
        Left = 113
        Top = 9
        Width = 106
        Height = 31
        Hint = #65420#65439#65434#65419#65438#65389#65392#12398#65420#65387#65437#65412#12434#22793#26356#12375#12414#12377
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #65420#65383#65394#65433'...'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Visible = False
        OnClick = btnSaveAsClick
      end
      object btnAll: TBitBtn
        Left = 627
        Top = 48
        Width = 182
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #29255#38754#21360#21047
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 2
        OnClick = btnAllClick
      end
      object BitBtn2: TBitBtn
        Left = 817
        Top = 10
        Width = 111
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #38281#12376#12427
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333FFFFFFFFFFFFF3300000000000
          003337777777777777F330F777777777703337F33333333337F330F333333333
          703337F3FFFFFFF337F330F300000003703337F3F777777737F330F300000003
          703337F33777777737F330F333333333703337F3FFFFFFF337F330F300000003
          703337F3F777777737F330F330000033703337F33377777337F330F333000333
          703337F33337773337F330F333303333703337F33333733337F330F333333333
          703337F33333333337F330FFFFFFFFFFF03337FFFFFFFFFFF7F3300000000000
          0033377777777777773333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn2Click
      end
      object BitBtn1: TBitBtn
        Left = 627
        Top = 8
        Width = 182
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #20001#38754#21360#21047
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 6
        OnClick = BitBtn1Click
      end
      object BtHiryou: TBitBtn
        Left = 186
        Top = 48
        Width = 145
        Height = 32
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #25512#22888#32933#26009#35373#23450
        Enabled = False
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 7
        OnClick = BtHiryouClick
      end
    end
    object BtSetHiryou: TBitBtn
      Left = 174
      Top = 51
      Width = 119
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #32933#26009#22793#26356
      Enabled = False
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = BtSetHiryouClick
    end
    object BitBtn4: TBitBtn
      Left = 388
      Top = 13
      Width = 118
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #12506#12540#12472#31227#21205
      TabOrder = 2
      OnClick = BitBtn4Click
    end
    object SPE: TSpinEdit
      Left = 315
      Top = 18
      Width = 65
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      MaxValue = 999
      MinValue = 1
      TabOrder = 3
      Value = 1
    end
    object btnPrev: TBitBtn
      Left = 514
      Top = 13
      Width = 46
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7000777777077777700077777007777770007777060777777000777066000007
        7000770666666607700070666666660770007706666666077000777066000007
        7000777706077777700077777007777770007777770777777000777777777777
        7000}
      TabOrder = 4
      OnClick = btnPrevClick
    end
    object btnNext: TBitBtn
      Left = 568
      Top = 13
      Width = 47
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7000777777077777700077777700777770007777770607777000770000066077
        7000770666666607700077066666666070007706666666077000770000066077
        7000777777060777700077777700777770007777770777777000777777777777
        7000}
      TabOrder = 5
      OnClick = btnNextClick
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 89
    Width = 1200
    Height = 622
    Cursor = crArrow
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    TabOrder = 2
    ExplicitTop = 51
    ExplicitWidth = 1544
    ExplicitHeight = 660
    object Panel2: TPanel
      Left = 0
      Top = -1
      Width = 665
      Height = 502
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object Image1: TImage
        Left = 48
        Top = 70
        Width = 456
        Height = 160
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      object Image2: TImage
        Left = 48
        Top = 238
        Width = 456
        Height = 160
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Visible = False
      end
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 432
    Top = 88
  end
  object FontDialog1: TFontDialog
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    Device = fdBoth
    Options = [fdAnsiOnly, fdForceFontExist, fdWysiwyg]
    Left = 476
    Top = 56
  end
  object SaveDialog1: TSaveDialog
    Filter = 'JPEG|*.jpg|BMAP|*.bmp'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = #12501#12449#12452#12523#20445#23384
    Left = 332
    Top = 72
  end
  object SaveDialog2: TSaveDialog
    Filter = 'JPEG|*.jpg|BMAP|*.bmp'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = #12501#12449#12452#12523#20445#23384
    Left = 252
    Top = 72
  end
end

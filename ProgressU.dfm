object frmProgress: TfrmProgress
  Left = 591
  Top = 268
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = '�i�s��'
  ClientHeight = 25
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '�l�r �o�S�V�b�N'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 0
    Width = 200
    Height = 25
    Align = alLeft
    Min = 0
    Max = 1000
    Smooth = True
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 200
    Top = 0
    Width = 65
    Height = 25
    Caption = '���f'
    TabOrder = 1
    OnClick = btnCancelClick
  end
end

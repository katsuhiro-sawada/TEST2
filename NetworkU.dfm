object NetworkForm: TNetworkForm
  Left = 343
  Top = 199
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = '�l�b�g���[�N�ݒ�'
  ClientHeight = 252
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '�l�r �o�S�V�b�N'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 20
    Top = 28
    Width = 75
    Height = 12
    Caption = 'FTP�T�[�o�[�F'
  end
  object Label2: TLabel
    Left = 20
    Top = 56
    Width = 56
    Height = 12
    Caption = '�A�J�E���g�F'
  end
  object Label3: TLabel
    Left = 20
    Top = 84
    Width = 60
    Height = 12
    Caption = '�p�X���[�h�F'
  end
  object Label4: TLabel
    Left = 20
    Top = 180
    Width = 73
    Height = 12
    Caption = '�����t�H���_�F'
  end
  object Label5: TLabel
    Left = 20
    Top = 114
    Width = 54
    Height = 12
    Caption = '���[�U���F'
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 144
    Width = 121
    Height = 17
    Caption = 'PASV���[�h���g��'
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 108
    Top = 24
    Width = 213
    Height = 20
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 108
    Top = 52
    Width = 97
    Height = 20
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 108
    Top = 80
    Width = 97
    Height = 20
    PasswordChar = '*'
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 108
    Top = 176
    Width = 217
    Height = 20
    TabOrder = 4
  end
  object btnOK: TButton
    Left = 124
    Top = 212
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = '�l�r �o�S�V�b�N'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 220
    Top = 212
    Width = 75
    Height = 25
    Caption = '��ݾ�'
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = '�l�r �o�S�V�b�N'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnCancelClick
  end
  object EUser: TEdit
    Left = 108
    Top = 110
    Width = 97
    Height = 20
    TabOrder = 7
  end
end

unit M_Sehi_SU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MSehiU, Db, DBTables, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls,
  Variants,ComCtrls, ADODB;

type
  TmstSehi_SForm = class(TmstSehiBasicForm)
    Label2: TLabel;
    Label3: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Bevel1: TBevel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Bevel2: TBevel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    ADOQuery1: TADOQuery;
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private �錾 }
    TitaiCDList : TStringList ;
    DojoCDList : TStringList ;
  public
    { Public �錾 }
  end;

var
  mstSehi_SForm: TmstSehi_SForm;

implementation

uses DMU;

{$R *.DFM}

procedure TmstSehi_SForm.FormCreate(Sender: TObject);
begin
  TitaiCDList := TStringList.Create ;
  DojoCDList := TStringList.Create ;
  inherited;
  with ADOQuery1 do begin

    SQL.Text := 'Select �n�ы敪�R�[�h,�n�і� from M_TITAI_S';
    Open;
    while not Eof do begin
      ComboBox2.Items.Add( fieldByname('�n�і�').asString );
      TitaiCDList.Add(fieldByname('�n�ы敪�R�[�h').asString);
      Next;
    end;
    Close;

    SQL.Text := 'Select Distinct ����y��R�[�h,����y�떼 from M_DOJOU';
    Open;
    while not Eof do begin
      ComboBox3.Items.Add( fieldByname('����y�떼').asString );
      DojoCDList.Add(fieldByname('����y��R�[�h').asString);
      Next;
    end;
    Close;
  end;
end;

procedure TmstSehi_SForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TitaiCDList.Free ;
  DojoCDList.Free ;

end;


procedure TmstSehi_SForm.ComboBox2Change(Sender: TObject);
begin
  inherited;
  ComboBox3.ItemIndex := -1 ;
  ComboBox3Change(self);
end;

procedure TmstSehi_SForm.ComboBox3Change(Sender: TObject);
begin
  inherited;
  {�ҏW���L��΃|�X�g}
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
    ds1.DataSet.Post ;
  {���R�[�h�̈ړ�}
  if ComboBox3.ItemIndex < 0 then begin
    ADOTable1.Close;
    exit ;
  end;

  if not IsEntryYear then begin		//����\�N�x�Ŗ�����ΕҏW�s��
    btnEdit.Enabled := False ;
    btnDel.Enabled := False ;
    EditPanel.Enabled := False ;
    ds1.AutoEdit := false;
  end;

  //���R�[�h��I������B�Ȃ���΃��R�[�h�쐬
  with ADOTable1 do begin
    Open;
    if not Locate('�n�ы敪;�y��敪',
      VarArrayOf([TitaiCDList[ComboBox2.ItemIndex],
                  DojoCDList[ComboBox3.ItemIndex]]),[]) then begin
        {�����Ȃ���ΐV�K���R�[�h}
        if IsEntryYear then begin
          Append ;
          FieldByName('�n�ы敪').asString := TitaiCDList[ComboBox2.ItemIndex];
          FieldByName('�y��敪').asString := DojoCDList[ComboBox3.ItemIndex];
        end;
    end;
  end;

end;

end.

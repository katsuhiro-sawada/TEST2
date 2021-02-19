unit M_Sehi_HU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MSehiU, DBTables, StdCtrls, Db, Buttons, ExtCtrls, Mask, DBCtrls,
  Variants,ComCtrls, ADODB;

type
  TmstSehi_HForm = class(TmstSehiBasicForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox4: TComboBox;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    ADOQuery1: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
  private
    { Private �錾 }
    SakumotuCDList : TStringList ;
    TitaiCDList : TStringList ;
    DojoCDList : TStringList ;
  public
    { Public �錾 }
  end;

var
  mstSehi_HForm: TmstSehi_HForm;

implementation

uses DMU;

{$R *.DFM}

procedure TmstSehi_HForm.FormCreate(Sender: TObject);
begin
  SakumotuCDList := TStringList.Create ;
  TitaiCDList := TStringList.Create ;
  DojoCDList := TStringList.Create ;
  inherited;

  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
  ComboBox3.Items.Clear;
  ComboBox4.Items.Clear;



  with ADOQuery1 do begin
    SQL.Text := 'Select �앨�R�[�h,�앨�� from M_Sakumotu where ��ڃR�[�h=''2''';
    Open;
    while not Eof do begin
      ComboBox1.Items.Add( fieldByname('�앨��').asString );
      SakumotuCDList.Add(fieldByname('�앨�R�[�h').asString);
      Next;
    end;
    Close;

    SQL.Text := 'Select �n�ы敪�R�[�h,�n�і� from M_TITAI_H';
    Open;
    while not Eof do begin
      ComboBox2.Items.Add( fieldByname('�n�і�').asString );
      ComboBox4.Items.Add( fieldByname('�n�ы敪�R�[�h').asString );
      TitaiCDList.Add(fieldByname('�n�ы敪�R�[�h').asString);
      Next;
    end;
    Close;

    SQL.Text := 'Select Distinct ���q�y��R�[�h,���q�y�떼 from M_DOJOU';
    Open;
    while not Eof do begin
      ComboBox3.Items.Add( fieldByname('���q�y�떼').asString );
      DojoCDList.Add(fieldByname('���q�y��R�[�h').asString);
      Next;
    end;
    Close;
  end;
end;

procedure TmstSehi_HForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SakumotuCDList.Free ;
  TitaiCDList.Free ;
  DojoCDList.Free ;

end;

procedure TmstSehi_HForm.ComboBox1Change(Sender: TObject);
begin
  inherited;
  ComboBox2.ItemIndex := -1 ;
  ComboBox4.ItemIndex := -1 ;
  ComboBox2Change(self);
  ComboBox4Change(self);
end;

procedure TmstSehi_HForm.ComboBox2Change(Sender: TObject);
begin
  inherited;
  ComboBox4.ItemIndex := ComboBox2.ItemIndex;

  ComboBox3.ItemIndex := -1 ;
  ComboBox3Change(self);
end;

procedure TmstSehi_HForm.ComboBox3Change(Sender: TObject);
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
    if not Locate('��ڃR�[�h;�앨�R�[�h;�n�ы敪;�y��敪',
      VarArrayOf(['2',SakumotuCDList[ComboBox1.ItemIndex],
                  TitaiCDList[ComboBox2.ItemIndex],
                  DojoCDList[ComboBox3.ItemIndex]]),[]) then begin
        {�����Ȃ���ΐV�K���R�[�h}
        if IsEntryYear then begin
          Append ;
          FieldByName('��ڃR�[�h').asString := '2';
          FieldByName('�앨�R�[�h').asString := SakumotuCDList[ComboBox1.ItemIndex];
          FieldByName('�n�ы敪').asString := TitaiCDList[ComboBox2.ItemIndex];
          FieldByName('�y��敪').asString := DojoCDList[ComboBox3.ItemIndex];
        end;
    end;
  end;

end;


procedure TmstSehi_HForm.ComboBox4Change(Sender: TObject);
begin
  inherited;
  ComboBox2.ItemIndex := ComboBox4.ItemIndex;

  ComboBox3.ItemIndex := -1 ;
  ComboBox3Change(self);

end;

end.

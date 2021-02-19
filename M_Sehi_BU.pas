unit M_Sehi_BU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MSehiU, DBTables, StdCtrls, Mask, DBCtrls, Db, Buttons, ExtCtrls,
  Variants,ComCtrls, ADODB;

type
  TmstSehi_BForm = class(TmstSehiBasicForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox2: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
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
    Label10: TLabel;
    ComboBox1: TComboBox;
    Label11: TLabel;
    ComboBox3: TComboBox;
    ADOQuery1: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
  private
    { Private 宣言 }
    SakumokuCDList : TStringList ;
    SakumotuCDList : TStringList ;
    SakugataCDList : TStringList ;
    TitaiCDList : TStringList ;
    DojoCDList : TStringList ;
  public
    { Public 宣言 }
  end;

var
  mstSehi_BForm: TmstSehi_BForm;

implementation

uses DMU;

{$R *.DFM}

procedure TmstSehi_BForm.FormCreate(Sender: TObject);
begin
  SakumokuCDList := TStringList.Create ;
  SakumotuCDList := TStringList.Create ;
  SakugataCDList := TStringList.Create ;
  TitaiCDList := TStringList.Create ;
  DojoCDList := TStringList.Create ;
  inherited;
  with ADOQuery1 do begin
    SQL.Text := 'Select 作目コード,作目名 from M_Sakumoku where 作目コード in (''6'',''7'')';
    Open;
    while not Eof do begin
      ComboBox1.Items.Add( fieldByname('作目名').asString );
      SakumokuCDList.Add(fieldByname('作目コード').asString);
      Next;
    end;
    Close;


    SQL.Text := 'Select 地帯区分コード,地帯名 from M_TITAI_H';
    Open;
    while not Eof do begin
      ComboBox4.Items.Add( fieldByname('地帯名').asString );
      TitaiCDList.Add(fieldByname('地帯区分コード').asString);
      Next;
    end;
    Close;

    SQL.Text := 'Select Distinct 畑牧土壌コード,畑牧土壌名 from M_DOJOU';
    Open;
    while not Eof do begin
      ComboBox5.Items.Add( fieldByname('畑牧土壌名').asString );
      DojoCDList.Add(fieldByname('畑牧土壌コード').asString);
      Next;
    end;
    Close;
  end;
end;

procedure TmstSehi_BForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SakumokuCDList.Free ;
  SakumotuCDList.Free ;
  SakugataCDList.Free ;
  TitaiCDList.Free ;
  DojoCDList.Free ;

end;

procedure TmstSehi_BForm.ComboBox1Change(Sender: TObject);
begin
  inherited;
  ComboBox2.Clear;
  SakumotuCDList.Clear;
  if ComboBox1.ItemIndex >= 0 then begin
    with ADOQuery1 do begin
      SQL.Text := 'Select 作物コード,作物名 from M_Sakumotu where 作目コード='''+SakumokuCDList[ComboBox1.ItemIndex]+'''';
      Open;
      while not Eof do begin
        ComboBox2.Items.Add( fieldByname('作物名').asString );
        SakumotuCDList.Add(fieldByname('作物コード').asString);
        Next;
      end;
      Close;
    end;
  end;
  ComboBox2.ItemIndex := -1 ;
  ComboBox2Change(self);
end;

procedure TmstSehi_BForm.ComboBox2Change(Sender: TObject);
var
   stmp : String;
begin
  inherited;
  ComboBox3.Clear;
  SakugataCDList.Clear;
  if ComboBox2.ItemIndex >= 0 then begin
    with ADOQuery1 do begin
//      SQL.Text := 'Select 作型コード,作型名 from M_Sakugata where 作目コード='''+SakumokuCDList[ComboBox1.ItemIndex]+
//      ''' and 作型コード='''+SakumotuCDList[ComboBox2.ItemIndex]+'''';
      SQL.Text := 'Select 作型コード,作型名 from M_Sakugata where 作目コード='''+SakumokuCDList[ComboBox1.ItemIndex]+
      ''' and 作物コード='''+SakumotuCDList[ComboBox2.ItemIndex]+'''';
      stmp := SQL.Text;
      Open;
      while not Eof do begin
        ComboBox3.Items.Add( fieldByname('作型名').asString );
        SakugataCDList.Add(fieldByname('作型コード').asString);
        Next;
      end;
      Close;
    end;
  end;
  ComboBox3.ItemIndex := -1 ;
  ComboBox3Change(self);
end;

procedure TmstSehi_BForm.ComboBox3Change(Sender: TObject);
begin
  inherited;
  ComboBox4.ItemIndex := -1 ;
  ComboBox4Change(self);
end;

procedure TmstSehi_BForm.ComboBox4Change(Sender: TObject);
begin
  inherited;
  ComboBox5.ItemIndex := -1 ;
  ComboBox5Change(self);
end;

procedure TmstSehi_BForm.ComboBox5Change(Sender: TObject);
begin
  inherited;
  {編集が有ればポスト}
  if ds1.DataSet.State in [dsEdit	,dsInsert] then
    ds1.DataSet.Post ;
  {レコードの移動}
  if (ComboBox3.ItemIndex < 0)or (ComboBox4.ItemIndex < 0) or (ComboBox5.ItemIndex < 0) then begin
    ADOTable1.Close;
    exit ;
  end;

  if not IsEntryYear then begin		//操作可能年度で無ければ編集不可
    btnEdit.Enabled := False ;
    btnDel.Enabled := False ;
    EditPanel.Enabled := False ;
    ds1.AutoEdit := false;
  end;
  //レコードを選択する。なければレコード作成
  with ADOTable1 do begin

    Open;
    if not Locate('作目コード;作物コード;作型コード;地帯区分;土壌区分',
      VarArrayOf([SakumokuCDList[ComboBox1.ItemIndex],
                  SakumotuCDList[ComboBox2.ItemIndex],
                  SakugataCDList[ComboBox3.ItemIndex],
                  TitaiCDList[ComboBox4.ItemIndex],
                  DojoCDList[ComboBox5.ItemIndex]]),[]) then begin
        {もしなければ新規レコード}
        if IsEntryYear then begin
          Append ;
          FieldByName('作目コード').asString := SakumokuCDList[ComboBox1.ItemIndex];
          FieldByName('作物コード').asString := SakumotuCDList[ComboBox2.ItemIndex];
          FieldByName('作型コード').asString := SakugataCDList[ComboBox3.ItemIndex];
          FieldByName('地帯区分').asString := TitaiCDList[ComboBox4.ItemIndex];
          FieldByName('土壌区分').asString := DojoCDList[ComboBox5.ItemIndex];
        end;
    end;
  end;

end;

end.

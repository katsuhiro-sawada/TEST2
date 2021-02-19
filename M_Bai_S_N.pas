unit M_Bai_S_N;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MSehiU, Db, DBTables, ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask,
  Variants,DBCtrls, ADODB;

type
  TmstBai_S_NForm = class(TmstSehiBasicForm)
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    ComboBox3: TComboBox;
    Query1: TQuery;
    Label1: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private 宣言 }
    TitaiCDList : TStringList ;
    DojoCDList : TStringList ;
  public
    { Public 宣言 }
  end;

var
  mstBai_S_NForm: TmstBai_S_NForm;

implementation

uses DMU;

{$R *.DFM}

procedure TmstBai_S_NForm.FormCreate(Sender: TObject);
begin
  TitaiCDList := TStringList.Create ;
  DojoCDList := TStringList.Create ;
  inherited;
  with Query1 do begin

    SQL.Text := 'Select 地帯区分コード,地帯名 from M_TITAI_S';
    Open;
    while not Eof do begin
      ComboBox2.Items.Add( fieldByname('地帯名').asString );
      TitaiCDList.Add(fieldByname('地帯区分コード').asString);
      Next;
    end;
    Close;

    SQL.Text := 'Select Distinct 水稲土壌コード,水稲土壌名 from M_DOJOU';
    Open;
    while not Eof do begin
      ComboBox3.Items.Add( fieldByname('水稲土壌名').asString );
      DojoCDList.Add(fieldByname('水稲土壌コード').asString);
      Next;
    end;
    Close;
  end;

end;

procedure TmstBai_S_NForm.ComboBox2Change(Sender: TObject);
begin
  inherited;
  ComboBox3.ItemIndex := -1 ;
  ComboBox3Change(self);

end;

procedure TmstBai_S_NForm.ComboBox3Change(Sender: TObject);
begin
  inherited;
  {編集が有ればポスト}
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
    ds1.DataSet.Post ;
  {レコードの移動}
  if ComboBox3.ItemIndex < 0 then begin
    ADOTable1.Close;
    exit ;
  end;
  //レコードを選択する。なければレコード作成
  with ADOTable1 do begin
    Open;
    if not Locate('地帯区分;土壌コード',
      VarArrayOf([TitaiCDList[ComboBox2.ItemIndex],
                  DojoCDList[ComboBox3.ItemIndex]]),[]) then begin
        {もしなければ新規レコード}
        if IsEntryYear then begin
          Append ;
          FieldByName('地帯区分').asString := TitaiCDList[ComboBox2.ItemIndex];
          FieldByName('土壌コード').asString := DojoCDList[ComboBox3.ItemIndex];
        end;
    end;
  end;

end;

procedure TmstBai_S_NForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TitaiCDList.Free ;
  DojoCDList.Free ;

end;

end.

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
    { Private 宣言 }
    TitaiCDList : TStringList ;
    DojoCDList : TStringList ;
  public
    { Public 宣言 }
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
  {編集が有ればポスト}
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
    ds1.DataSet.Post ;
  {レコードの移動}
  if ComboBox3.ItemIndex < 0 then begin
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
    if not Locate('地帯区分;土壌区分',
      VarArrayOf([TitaiCDList[ComboBox2.ItemIndex],
                  DojoCDList[ComboBox3.ItemIndex]]),[]) then begin
        {もしなければ新規レコード}
        if IsEntryYear then begin
          Append ;
          FieldByName('地帯区分').asString := TitaiCDList[ComboBox2.ItemIndex];
          FieldByName('土壌区分').asString := DojoCDList[ComboBox3.ItemIndex];
        end;
    end;
  end;

end;

end.

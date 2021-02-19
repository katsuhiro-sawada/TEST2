unit mstKIJUNU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask, DBCtrls, ADODB;

type
  TmstKijunForm = class(TForm)
    ds1: TDataSource;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    btnClose: TBitBtn;
    ADOTable1: TADOTable;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbDosituChange(Sender: TObject);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    FDOSEICD  : string ;
    FIsPost : Boolean;  //更新フラグ
		function CheckBeforePost:Boolean;
    procedure SyncUpdate;
  end;

var
  mstKijunForm: TmstKijunForm;

implementation

uses DMU;

{$R *.DFM}

procedure TmstKijunForm.FormCreate(Sender: TObject);
begin
  FIsPost:=False;
	Color := BackColor ;
//	if not IsEntryYear then begin		//操作可能年度で無ければ編集不可
//    ds1.AutoEdit := false ;
//    Table1.ReadOnly := True ;
//  end;
  //PageControl1.ActivePage := TabSheet1;
end;

procedure TmstKijunForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOTable1.Close;
  //基準マスタは対象テーブルが二種なので継承先で日付更新
  SyncUpdate;  //マスタ更新日記録
end;

procedure TmstKijunForm.btnCloseClick(Sender: TObject);
begin
	Close;
end;


procedure TmstKijunForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
  	if CheckBeforePost then
			ds1.DataSet.Post
    else CanClose := False ;

end;


//各列の値範囲チェック
function TmstKijunForm.CheckBeforePost:Boolean;
begin
(*
使用可能、
呼び出し側の表示の工夫（comboboxの表示を戻すなど）が必要
   if StrtoFloat(DBEdit1.Text) > Strtofloat(DBEdit2.Text) then begin
   	showmessage('値の関係が正しくありません。');
    DBEdit1.SetFocus ;
    result := false ;
   end else begin
   	result := True ;
   end;
*)
	result := True ;
end;

procedure TmstKijunForm.cmbDosituChange(Sender: TObject);
begin
 // FDOSEICD := strParts(cmbDositu.Text ,1);  //処理した後にセットします
end;

procedure TmstKijunForm.Table1AfterPost(DataSet: TDataSet);
begin
  FIsPost := True ;

end;
procedure TmstKijunForm.SyncUpdate;
begin
  if FIsPost then begin //テーブル変更前に更新日記録
    UpdateSyncFile(DataPath+SYNCFILE,ChangeFileExt(ExtractFileName(ADOTable1.TableName),''));
    FIsPost := False ;
  end;
end;

{Enterキーでタブ移動}
procedure TmstKijunForm.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enterキーが押されたら
  begin
    Key:=#0; //キー入力を無効にし
    Keybd_event(VK_TAB,0,0,0) //Tabキーを発生させる。
  end;
end;


end.

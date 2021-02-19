unit UketukeU5;
{
  受付画面：受付テーブルにエントリーする画面
  リンクテーブルが多数あるので、レコード移動時に時間がかかる。
  必須入力のチェックは登録ボタンの時はプログラム制御出来るが、
  AutoPost時はシステム（BDE）にゆだねる。
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBTables, Mask, DBCtrls, Db, ComCtrls, ExtCtrls, ADODB,
  Vcl.WinXPickers;


type
  TfrmUketuke5 = class(TForm)
    StatusBar1: TStatusBar;
    ds1: TDataSource;
    gb2: TGroupBox;
    Panel2: TPanel;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    btnDel: TBitBtn;
    btnPost: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    dsSakumotu: TDataSource;
    Panel1: TPanel;
    Label13: TLabel;
    txtSampleNo: TDBEdit;
    btnSNo: TButton;
    DBNavigator1: TDBNavigator;
    ADOUketuke: TADOTable;
    ADOQSakumotu: TADOQuery;
    Label6: TLabel;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    dskumiai: TDataSource;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    dssiten: TDataSource;
    ADOQkumiai: TADOQuery;
    ADOQsiten: TADOQuery;
    Label3: TLabel;
    Label4: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DateTimePicker2: TDateTimePicker;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    Label50: TLabel;
    DBEdit23: TDBEdit;
    DBEdit3: TDBEdit;
    Button1: TButton;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Panel3: TPanel;
    ADOQuery1: TADOQuery;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Memo1: TMemo;
    DBEdit7: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    DateTimePicker3: TDateTimePicker;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    DateTimePicker4: TDateTimePicker;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    DateTimePicker5: TDateTimePicker;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit11: TDBEdit;
    DateTimePicker6: TDateTimePicker;
    Label19: TLabel;
    DBEdit12: TDBEdit;
    DateTimePicker7: TDateTimePicker;
    Label20: TLabel;
    DBEdit13: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label9: TLabel;
    procedure btnSHojouClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtHojouNoChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure ds1StateChange(Sender: TObject);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure btnSNoClick(Sender: TObject);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbJikiChange(Sender: TObject);
    procedure dtUketukeChange(Sender: TObject);
    procedure Table1AfterCancel(DataSet: TDataSet);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure BtnClrClick(Sender: TObject);
    procedure txtSampleNoExit(Sender: TObject);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure ESakuCodeKeyPress(Sender: TObject; var Key: Char);
    procedure cmbSakumokuDropDown(Sender: TObject);
    procedure cmbSakumotuDropDown(Sender: TObject);
    procedure cmbSakugataDropDown(Sender: TObject);
//    procedure DateTimePicker1Change(Sender: TObject);
//    procedure DateTimePicker2Change(Sender: TObject);
//    procedure DateTimePicker3Change(Sender: TObject);
//    procedure DateTimePicker4Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ADOUketukeAfterCancel(DataSet: TDataSet);
    procedure ADOUketukeAfterInsert(DataSet: TDataSet);
    procedure ADOUketukeAfterPost(DataSet: TDataSet);
    procedure ADOUketukeAfterScroll(DataSet: TDataSet);
    procedure ADOUketukeBeforePost(DataSet: TDataSet);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure dssitenDataChange(Sender: TObject; Field: TField);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure DateTimePicker5Change(Sender: TObject);
    procedure DateTimePicker6Change(Sender: TObject);
    procedure DateTimePicker7Change(Sender: TObject);
//    procedure Button1Click(Sender: TObject);
  private
    { Private 宣言 }
    FNewNO : string ;
    ESakuCodeFlg : Boolean;
    ESakuCodeFlg2 : Boolean;
    procedure SetEditEnable(aFlag: Boolean);
  public
    procedure LocateNo(pSmplNo: string);
    { Public 宣言 }
  end;

var
  frmUketuke5: TfrmUketuke5;

implementation

uses DMU,SHojouU, SUketukeU, MHojouU;

{$R *.DFM}

procedure TfrmUketuke5.FormShow(Sender: TObject);
var
stmp : string;
mysqlstmp : String;
i,itmp : integer;
stmp2 : string;
begin
	Color := BackColor ;
  FNewNO := '';

//  Table1.Open;
  DataModule1.ADOConnection1.close;
  mysqlstmp := DMU.GetConnection;
  DataModule1.ADOConnection1.ConnectionString := mysqlstmp;

  //DataModule1.ADOConnection1.Open('Admin','');






  //先にHOJYOUにSQLをセットしておかないと開けない。

  ADOuKETUKE.Close;
  ADOUketuke.Open;


//速度アップなら以下の作物関連のリンクテーブル処理を見直すと改善される

 // ADOZSakumokuConect.ConnectionString := mysqlstmp;

  ADOQkumiai.Open;
  ADOQsiten.Open;
  ADOQSakumotu.Open;



  {
  ADOQZSakumotu.Close;
  ADOZSakumotuConect.ConnectionString := mysqlstmp;
  ADOQZSakumotu.Open;


  ADOQZSakugata.Close;
  ADOZSakugataConect.ConnectionString := mysqlstmp;
  ADOQZSakugata.Open;
 }
{
  ADOQSakumoku.Close;
  ADOSakumokuConect.ConnectionString := mysqlstmp;
  ADOQSakumoku.Open;

  ADOQSakumotu.Close;
  ADOSakumotuConect.ConnectionString := mysqlstmp;
  ADOQSakumotu.Open;


  ADOQSakugata.Close;
  ADOSakugataConect.ConnectionString := mysqlstmp;
  ADOQSakugata.Open;
 }




end;

{
  データ登録コンポーネントの有効設定：サンプル場号別編集制御用
}
procedure TfrmUketuke5.SetEditEnable(aFlag:Boolean);
begin

{ XXXXXXx edit
    btnEdit.Enabled := aFlag ;
    btnDel.Enabled := aFlag ;
  	ds1.AutoEdit := aFlag ;
//    gb1.Enabled := aFlag ;
    gb2.Enabled := aFlag ;
		gb3.Enabled := aFlag ;
		gb4.Enabled := aFlag ;
}

end;
procedure TfrmUketuke5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  if JMode <> '' then begin
  		ds1.DataSet.Cancel;
  end
  else begin
	 if ds1.DataSet.State in [dsEdit	,dsInsert] then begin
    if Application.MessageBox ('編集を取り消しますか？','確認', MB_YESNO ) = ID_YES then
  		ds1.DataSet.Cancel
    else begin
      CanClose := false ;
      exit ;
    end;
   end;
  end;
end;

procedure TfrmUketuke5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
end;

{指定サンプル番号に移動}
procedure TfrmUketuke5.LocateNo( pSmplNo : string );
begin
  //編集中でなければサンプル番号に移動
	if ds1.DataSet.State in [dsEdit	,dsInsert] then exit;
    ADOUketuke.locate('受付連番',pSmplNo,[]);
end;
procedure TfrmUketuke5.Memo1Change(Sender: TObject);
begin

end;

{圃場検索}
procedure TfrmUketuke5.btnSHojouClick(Sender: TObject);
begin
end;

//圃場番号変更
procedure TfrmUketuke5.txtHojouNoChange(Sender: TObject);
begin


end;
{新規ボタン}
procedure TfrmUketuke5.btnNewClick(Sender: TObject);
var
  bNewRec : Boolean ;
begin
    //最大サンプル番号割り当て
    FNewNO := GetMaxSampleNo(bNewRec,'1') ;   {Version 0.6 #38}

    if FNewNO = '' then exit ;   {Version 0.6 #36}



{
    if not bNewRec then begin
 //    実際にレコードを削除する。でないと変更量（画面リンク項目、Filtere処理）が大きい
      with DataModule1.QueryWrite do begin
        SQL.Text := 'delete from T_UKETUKE6 where 受付連番='''+FNewNO+'''';
        ExecSQL ;
        //SQL.Text := 'delete from T_SINDAN6 where 受付連番='''+FNewNO+'''';
        //ExecSQL ;
      end;
    end;



	  ds1.DataSet.append;
     //insert; //Append;    Append->Insert特に問題なさそう
//   	ds1.DataSet.Edit;
}



	  ds1.DataSet.append;




    ds1.DataSet.FieldByName('受付連番').asString := FNewNO ;

//    ds1.DataSet.FieldByName('編集日').asDatetime := now;

    ds1.DataSet.FieldByName('受付年月日').asDatetime := now ;

  //  DtUketuke.DateTime := ds1.DataSet.FieldByName('受付年月日').asDateTime;



//    ds1.DataSet.Post;

//   	ds1.DataSet.Edit;




end;
{閉じるボタン}
procedure TfrmUketuke5.btnCloseClick(Sender: TObject);
begin
//	if ds1.DataSet.State in [dsEdit	,dsInsert] then
//		ds1.DataSet.Cancel;
	Close;
end;
{キャンセルボタン}
procedure TfrmUketuke5.btnCancelClick(Sender: TObject);
begin
	ds1.DataSet.Cancel;
end;
{登録ボタン}
procedure TfrmUketuke5.btnPostClick(Sender: TObject);
begin
  {入力チェック}
{
  if not ChkEditLength(txtSampleNo,4) then exit;
  if JMode = 'Douou' then begin
     if not ChkEditLength(txtHojouNo,9) then exit;
  end
  else begin
     if not ChkEditLength(txtHojouNo,7) then exit;
  end;

  if DBEdit8.Text = '' then begin
    showmessage('登録されている圃場番号が有りません');
  	exit;
  end;
}


{
	if cmbSakumoku.Text = '' then begin
    showmessage('予定作目が設定されていません');
    cmbSakumoku.SetFocus;
  	exit;
  end;
	if cmbSakumotu.Text = '' then begin
    showmessage('予定作物が設定されていません');
    cmbSakumotu.SetFocus;
  	exit;
  end;



{ //作型
	if cmbSakugata.Text = '' then begin
    showmessage('予定作型が設定されていません');
    cmbSakugata.SetFocus;
  	exit;
  end;
}




	ds1.DataSet.Post;

end;
//新規の場合受付日セット
procedure TfrmUketuke5.Table1AfterInsert(DataSet: TDataSet);
begin
//	dtUketuke.Date := now ;
  {初期値の設定}
//  ds1.DataSet.FieldByName('受付年月日').asDateTime := dtUketuke.Date ;




  ds1.DataSet.FieldByName('編集日').asDatetime := now ;  //送信フラグの手前、手動で更新する
	ds1.DataSet.FieldByName('削除フラグ').asBoolean := False ;

  SetEditEnable( True );  {Version 0.6 #37}
end;
//更新前処理
procedure TfrmUketuke5.Table1BeforePost(DataSet: TDataSet);
begin
  //レコード移動による自動ポストの時は必須項目が未入力のとき例外が発生し、
  //その項目にフォーカスが移動するので、任せる。
  {初期値の設定}
//  ds1.DataSet.FieldByName('受付年月日').asDateTime := dtUketuke.Date ;



  //分析時期
//  ds1.DataSet.FieldByName('分析時期').asString := InttoStr(cmbJiki.ItemIndex);
	//編集日の登録
//  ds1.DataSet.FieldByName('編集日').asDatetime := now ;  //送信フラグの手前、手動で更新する
end;
//更新後処理
procedure TfrmUketuke5.Table1AfterPost(DataSet: TDataSet);
begin
  //もし、新規作成なら、診断テーブルを作成する。 {Version 0.6 #38}
//  if FNewNO <> '' then
//    InsertSindanTable(DataSet.FieldByName('サンプル番号').asString);  //←FNewNOにしないこと
  FNewNO:=''; //Post,Cancelした後はクリア
end;

{削除ボタン}
procedure TfrmUketuke5.btnDelClick(Sender: TObject);
var
sint,eint : integer;
i : integer;
//stmp : string;
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
  if Application.MessageBox ('削除しますか？','確認', MB_YESNO ) = ID_YES then begin
    {Version 0.6 #23 }  //同期処理対処のため、削除フラグにする。診断Tもあれば同様
//		ds1.DataSet.Delete;

       //診断テーブル削除
  //  DelFlagSindanTable(ds1.DataSet.FieldByName('受付連番').asString);



  if ds1.DataSet.FieldByName('試料NO開始').AsString <> '' then begin

     sint := strtoint(ds1.DataSet.FieldByName('試料NO開始').AsString);
     eint := strtoint(ds1.DataSet.FieldByName('試料NO終了').AsString);

    for i  := sint to eint do begin

      with DataModule1.QueryWrite do begin
        SQL.Text := 'Delete from T_BUNSEKI6 where 試料NO='''+Format('%0.4d',[i])+'''';
        ExecSQL ;
      end;

    end;

  end;


  ds1.DataSet.Edit ;
  ds1.DataSet.Delete;



  end;
end;
{編集ボタン}
procedure TfrmUketuke5.btnEditClick(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	ds1.DataSet.Edit;
end;
{ステータス変更イベントで操作ボタンの制御}
procedure TfrmUketuke5.ds1StateChange(Sender: TObject);
begin
	//主キーは新規のみ修正可
	txtSampleNo.Enabled := ds1.DataSet.State in [dsInsert ];
  //検索ボタン 新規の時は無効  2003/05/06
  btnSNO.Enabled := not (ds1.DataSet.State in [dsInsert ]);

	case ds1.DataSet.State of
	dsEdit	,dsInsert	: begin
  	btnNew.Enabled := False;
    btnEdit.Enabled := False;
    btnDel.Enabled := False;
    btnPost.Enabled := True ;
    btnCancel.Enabled := True ;

//    BtTitenIn.Enabled := True;
  end;
  else begin
  	btnNew.Enabled := True;
    btnEdit.Enabled := True;
    btnDel.Enabled := True;
    btnPost.Enabled := False ;
    btnCancel.Enabled := False ;
//    BtTitenIn.Enabled := False ;
  end;
  end; //case
end;

procedure TfrmUketuke5.dssitenDataChange(Sender: TObject; Field: TField);
begin

end;

//検索
procedure TfrmUketuke5.btnSNoClick(Sender: TObject);
var
	SNO : string ;
begin
  SNO := DspUkeList(txtSampleNo.Text, '5');
  if SNO <> '' then begin
//  	Table1.Locate('サンプル番号',SNO,[]);
  	ADOUketuke.Locate('受付連番',SNO,[]);
  end;
end;
procedure TfrmUketuke5.Button1Click(Sender: TObject);
var
stmp : string;
itmp : integer;
count : integer;
i : integer;
begin


//作物名　と　試料数　分析項目が入っていない場合

if ds1.DataSet.FieldByName('作物コード').AsString = '' then begin

  showmessage('作物を入力して下さい。');
  exit;
end;
if ds1.DataSet.FieldByName('分析項目').AsString = '' then begin

  showmessage('分析項目を入力して下さい。');
  exit;
end;

if ds1.DataSet.FieldByName('試料数').AsString = '' then begin

  showmessage('試料数を入力して下さい。');
  exit;
end;
if ds1.DataSet.FieldByName('試料数').AsString = '0' then begin

  showmessage('試料数を入力して下さい。');
  exit;
end;



if ds1.DataSet.FieldByName('試料NO開始').AsString <> '' then begin

  showmessage('既に設定されています。');
  exit;
end;

if ds1.DataSet.FieldByName('試料NO終了').AsString <> '' then begin

  showmessage('既に設定されています。');
  exit;
end;





//受付NOを作成


  stmp :=  copy(FTPnen,3,2);

  stmp := stmp + '6';

  stmp := stmp + ds1.DataSet.FieldByName('受付連番').AsString;

  stmp := stmp + dssakumotu.DataSet.FieldByName('作物分類').AsString;

  stmp := stmp + ds1.DataSet.FieldByName('分析項目').AsString;


   	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;


  ds1.DataSet.FieldByName('受付NO').AsString := stmp;



  //
//分析レコードを作成

ADOQuery1.Close;



//stmp := 'select MAX(試料NO) as sample from T_BUNSEKI6';
//stmp := 'select MAX(試料NO) as sample from T_BUNSEKI6 where 試料NO < "2000"';
stmp := 'select MAX(試料NO) as sample from T_BUNSEKI6';
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add(stmp);
ADOQuery1.Open;


//最初は、０
itmp := StrToIntDef(ADOQuery1.FieldByName('sample').AsString,0);


count :=  ds1.DataSet.FieldByName('試料数').asinteger;


ADOQuery1.Close;
stmp := 'select * from T_BUNSEKI6';
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add(stmp);
ADOQuery1.Open;


i := itmp + 1;
ds1.DataSet.FieldByName('試料NO開始').AsString := Format('%0.4d',[i]);
i := itmp + count;
ds1.DataSet.FieldByName('試料NO終了').AsString := Format('%0.4d',[i]);



for i := itmp + 1 to itmp + count do begin

ADOQuery1.Insert;
ADOQuery1.Edit;
ADOQuery1.Fieldbyname('試料NO').AsString := Format('%0.4d',[i]);
ADOQuery1.Fieldbyname('受付NO').AsString := ds1.DataSet.FieldByName('受付NO').AsString;
ADOQuery1.Post;


end;


 	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;

  ds1.DataSet.Post;




end;

//レコードの移動でＤＢリンクでない項目をセット
procedure TfrmUketuke5.Table1AfterScroll(DataSet: TDataSet);
begin


  //分析時期
  //cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('分析時期').asString,0);

  {Version 0.6 #27 : 自PCエントリー番号範囲内のみ編集可}
//XXXXXXXXXXXXXXX ????
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    SetEditEnable( True);
//      IsEditRec(DataSet.FieldByName('サンプル番号').asString)  and IsEntryYear
//    );






end;

//DB非リンク項目編集されれば、自動エディットする。
procedure TfrmUketuke5.cmbJikiChange(Sender: TObject);
begin
end;
//DB非リンク項目編集されれば、自動エディットする。
procedure TfrmUketuke5.dtUketukeChange(Sender: TObject);
begin

//データ修正
  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;


end;

//キャンセルしたら非リンク項目を戻す
procedure TfrmUketuke5.Table1AfterCancel(DataSet: TDataSet);
begin
  FNewNO := '';     //Post,Cancelした後はクリア {Version 0.6 #38}
{
   ESakuCodeFlg := false;
   ESakuCode.Text := ds1.DataSet.FieldByName('作目コード').AsString
         + ds1.DataSet.FieldByName('作物コード').AsString
         + ds1.DataSet.FieldByName('作型コード').AsString;

   ESakuCodeFlg2 := false;
   ESakuCode2.Text := ds1.DataSet.FieldByName('前作目コード').AsString
         + ds1.DataSet.FieldByName('前作物コード').AsString
         + ds1.DataSet.FieldByName('前作型コード').AsString;
}
  //   Table1AfterScroll(DataSet);
//2003/5/6 二度呼ばれるためコメント
end;
{データ編集イベント}
procedure TfrmUketuke5.ds1DataChange(Sender: TObject; Field: TField);
begin
  {全作物及び予定作物以降の入力制御の設定：上位が確定しないと下位が操作有効にならない}
{
  if Field = nil then begin
    cmbZSakumotu.Enabled := not ds1.DataSet.FieldByName ('前作目コード').IsNull ;
    cmbZSakugata.Enabled := not ds1.DataSet.FieldByName ('前作物コード').IsNull ;
    cmbSakumotu.Enabled := not ds1.DataSet.FieldByName ('作目コード').IsNull ;
    cmbSakugata.Enabled := not ds1.DataSet.FieldByName ('作物コード').IsNull ;
  end else begin
    if Field.FieldName = '前作目コード' then  begin
      if (ds1.DataSet.State in [dsEdit	,dsInsert]) then
        ds1.DataSet.FieldByName ('前作物コード').asString := '';
      cmbZSakumotu.Enabled := not Field.IsNull ;
//      cmbZSakugata.Enabled := not Field.IsNull ;
    end
    else
    if Field.FieldName = '前作物コード' then  begin
      if (ds1.DataSet.State in [dsEdit	,dsInsert]) then
        ds1.DataSet.FieldByName ('前作型コード').asString := '';
      cmbZSakugata.Enabled := not Field.IsNull ;
    end
    else
    if Field.FieldName = '作目コード' then  begin
      if (ds1.DataSet.State in [dsEdit	,dsInsert]) then
        ds1.DataSet.FieldByName ('作物コード').asString := '';
      cmbSakumotu.Enabled := not Field.IsNull ;
//      cmbSakugata.Enabled := not Field.IsNull ;
    end
    else
    if Field.FieldName = '作物コード' then  begin
      if (ds1.DataSet.State in [dsEdit	,dsInsert]) then
        ds1.DataSet.FieldByName ('作型コード').asString := '';
      cmbSakugata.Enabled := not Field.IsNull ;
    end;
  end;

//    if ESakuCodeFlg = false then begin
//この命令を入れるとキーボードからの入力ができなくなる
(*
       ESakuCode.Text := ds1.DataSet.FieldByName('作目コード').AsString
         + ds1.DataSet.FieldByName('作物コード').AsString
         + ds1.DataSet.FieldByName('作型コード').AsString;
//    end;

       ESakuCode2.Text := ds1.DataSet.FieldByName('前作目コード').AsString
         + ds1.DataSet.FieldByName('前作物コード').AsString
         + ds1.DataSet.FieldByName('前作型コード').AsString;
*)



 }

end;
{Enterキーでタブ移動}
procedure TfrmUketuke5.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enterキーが押されたら
  begin
    Key:=#0; //キー入力を無効にし
    Keybd_event(VK_TAB,0,0,0) //Tabキーを発生させる。
  end;
end;

procedure TfrmUketuke5.BtnClrClick(Sender: TObject);
var
  aBuff : string ;
begin
  aBuff := InttoStr( (Sender as TButton).Tag ) ;
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('有機物コード'+aBuff).Clear ;
  ds1.DataSet.FieldByName('有機物施肥量'+aBuff).Clear ;
  ds1.DataSet.FieldByName('連用年数'+aBuff).Clear ;

end;


procedure TfrmUketuke5.txtSampleNoExit(Sender: TObject);
var
  iNum : integer ;
begin
  {Version 0.6 #24 範囲入力チェック}
  if txtSampleNo.Enabled  then begin
    //新規の時しか有効でない
    try
      iNum := StrtoInt(txtSampleNo.Text);
    except
      showmessage('受付連番を正しく入力して下さい。');
      txtSampleNo.Text := FNewNO ;
      ds1.DataSet.FieldByName('受付連番').asString := txtSampleNo.Text ;
      txtSampleNo.SetFocus ;
      exit;
    end;
    txtSampleNo.Text := Format('%0.3d',[iNum]);
    ds1.DataSet.FieldByName('受付連番').asString := txtSampleNo.Text ;
    //用意された番号以上＆エンドないか？
    if (iNum < StrtoInt(FNewNO) ) or ( iNum > EntrySTOP ) then begin
      showmessage('受付連番範囲制約を超えています。');
      txtSampleNo.Text := FNewNO ;
      ds1.DataSet.FieldByName('受付連番').asString := txtSampleNo.Text ;
      txtSampleNo.SetFocus ;
    end;

    //既にあるサンプルの場合
    with DataModule1.ADOQtmp do begin
        SQL.Text := 'select * from T_UKETUKE6 where 受付連番='''+txtSampleNo.Text+'''';
        Open;
        //レコードがあるか
        if DataModule1.ADOQtmp.RecordCount > 0 then begin
//          if DataModule1.ADOQtmp.FieldByName('削除フラグ').asBoolean Then begin
//               DataModule1.ADOQtmp.Delete;
//               close;
               //診断テーブルも削除
               //SQL.Text := 'select * from T_SINDAN where サンプル番号='''+txtSampleNo.Text+'''';
//               Open;
//               DataModule1.ADOQtmp.Delete;
//               close;
//          end
//          else begin
              showMessage('既にサンプルがあります。別のサンプルにしてください。');
              txtSampleNo.Text := FNewNO ;
              ds1.DataSet.FieldByName('受付連番').asString := txtSampleNo.Text ;
              txtSampleNo.SetFocus ;

//          end;

        end

    end;

  end;
end;


procedure TfrmUketuke5.ESakuCodeKeyPress(Sender: TObject; var Key: Char);
begin
 ESakuCodeFlg := true;

 if Key=#13 then  //Enterキーが押されたら
  begin
    Key:=#0; //キー入力を無効にし
    Keybd_event(VK_TAB,0,0,0) //Tabキーを発生させる。
  end;
end;


procedure TfrmUketuke5.cmbSakumokuDropDown(Sender: TObject);
begin
    ESakuCodeFlg := false;
    ESakuCodeFlg2 := true;

end;

procedure TfrmUketuke5.cmbSakumotuDropDown(Sender: TObject);
begin
    ESakuCodeFlg := false;
    ESakuCodeFlg2 := true;

end;

procedure TfrmUketuke5.cmbSakugataDropDown(Sender: TObject);
begin
    ESakuCodeFlg := false;
    ESakuCodeFlg2 := true;

end;

procedure TfrmUketuke5.DateTimePicker1Change(Sender: TObject);
begin
//データ修正
  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('報告希望日').asDatetime :=　DateTimePicker1.Date;

end;

procedure TfrmUketuke5.DateTimePicker2Change(Sender: TObject);
begin

  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;


  ds1.DataSet.FieldByName('受付年月日').asDatetime :=　DateTimePicker2.Date;


end;

procedure TfrmUketuke5.DateTimePicker3Change(Sender: TObject);
begin

  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('速報日').asDatetime :=　DateTimePicker3.Date;

end;

procedure TfrmUketuke5.DateTimePicker4Change(Sender: TObject);
begin
//データ修正
  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('発送日').asDatetime :=　DateTimePicker4.Date;

end;


procedure TfrmUketuke5.DateTimePicker5Change(Sender: TObject);
begin
  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('購買外入力日').asDatetime :=　DateTimePicker5.Date;

end;

procedure TfrmUketuke5.DateTimePicker6Change(Sender: TObject);
begin
  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('計上日').asDatetime :=　DateTimePicker6.Date;

end;

procedure TfrmUketuke5.DateTimePicker7Change(Sender: TObject);
begin
  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('回収日').asDatetime :=　DateTimePicker7.Date;

end;

procedure TfrmUketuke5.DBLookupComboBox1DropDown(Sender: TObject);
begin

 	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;

ds1.DataSet.FieldByName('支店番号').AsString := '';


end;

procedure TfrmUketuke5.ADOUketukeAfterCancel(DataSet: TDataSet);
begin
  FNewNO := '';     //Post,Cancelした後はクリア {Version 0.6 #38}



end;

procedure TfrmUketuke5.ADOUketukeAfterInsert(DataSet: TDataSet);
begin
  ds1.DataSet.FieldByName('編集日').asDatetime := now ;  //送信フラグの手前、手動で更新する
//	ds1.DataSet.FieldByName('削除フラグ').asBoolean := False ;

  SetEditEnable( True );  {Version 0.6 #37}

end;

procedure TfrmUketuke5.ADOUketukeAfterPost(DataSet: TDataSet);
begin
  //もし、新規作成なら、診断テーブルを作成する。 {Version 0.6 #38}
//  if FNewNO <> '' then
//    InsertSindanTable(DataSet.FieldByName('受付連番').asString);  //←FNewNOにしないこと
//  FNewNO:=''; //Post,Cancelした後はクリア

end;

procedure TfrmUketuke5.ADOUketukeAfterScroll(DataSet: TDataSet);
begin

{
  if not DataSet.FieldByName('採取年月日').IsNull then
    dtUketuke.Date := DataSet.FieldByName('採取年月日').asDateTime ;



  if not DataSet.FieldByName('組合員持込日').IsNull then
    DateTimePicker1.Date := DataSet.FieldByName('組合員持込日').asDateTime ;

  if not DataSet.FieldByName('結果配信予定日').IsNull then
    DateTimePicker2.Date := DataSet.FieldByName('結果配信予定日').asDateTime ;

  if not DataSet.FieldByName('本所受付日').IsNull then
    DateTimePicker3.Date := DataSet.FieldByName('本所受付日').asDateTime ;

  if not DataSet.FieldByName('センター受付日').IsNull then
    DateTimePicker4.Date := DataSet.FieldByName('センター受付日').asDateTime ;
}


  //分析時期
  //cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('分析時期').asString,0);

  {Version 0.6 #27 : 自PCエントリー番号範囲内のみ編集可}
//	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
//    SetEditEnable(
//      IsEditRec(DataSet.FieldByName('サンプル番号').asString)  and IsEntryYear
//    );

  // DtUketuke.DateTime := ds1.DataSet.FieldByName('受付年月日').asDateTime;



{
   if not DataSet.FieldByName('サンプル持込日').IsNull then
    DateTimePicker1.Date := DataSet.FieldByName('サンプル持込日').asDateTime ;


  if not DataSet.FieldByName('センター受付日').IsNull then
    DateTimePicker4.Date := DataSet.FieldByName('センター受付日').asDateTime ;

}







end;

procedure TfrmUketuke5.ADOUketukeBeforePost(DataSet: TDataSet);
begin





  //レコード移動による自動ポストの時は必須項目が未入力のとき例外が発生し、
  //その項目にフォーカスが移動するので、任せる。
  {初期値の設定}
  //ds1.DataSet.FieldByName('受付年月日').asDateTime := DtUketuke.DateTime ;



//  ds1.DataSet.FieldByName('受付年月日').asDateTime := DtUketuke.DateTime;

//  ds1.DataSet.FieldByName('サンプル持込日').asDateTime := DateTimePicker1.Date ;
//  ds1.DataSet.FieldByName('結果配信予定日').asDateTime := DateTimePicker2.Date ;
//  ds1.DataSet.FieldByName('本所受付日').asDateTime := DateTimePicker3.Date ;
//  ds1.DataSet.FieldByName('センター受付日').asDateTime := DateTimePicker4.Date ;

//  ds1.DataSet.FieldByName('採取年月日').asDateTime := dtUketuke2.Date ;
//  ds1.DataSet.FieldByName('組合員持込日').asDateTime := DateTimePicker1.Date ;
//  ds1.DataSet.FieldByName('結果配信予定日').asDateTime := DateTimePicker2.Date ;
//  ds1.DataSet.FieldByName('本所受付日').asDateTime := DateTimePicker3.Date ;
//  ds1.DataSet.FieldByName('センター受付日').asDateTime := DateTimePicker4.Date ;


  //分析時期
//  ds1.DataSet.FieldByName('分析時期').asString := InttoStr(cmbJiki.ItemIndex);
	//編集日の登録
  ds1.DataSet.FieldByName('編集日').asDatetime := now ;  //送信フラグの手前、手動で更新する




  //Ver
//  if ADOQHojyou.Active then begin

//  ds1.DataSet.FieldByName('農家番号').asString := ds2.DataSet.FieldByName('農家番号').asString;
//  ds1.DataSet.FieldByName('土壌コード').asString := ds2.DataSet.FieldByName('M_HOJOU.土壌コード').asString;
//  ds1.DataSet.FieldByName('土性コード').asString := ds2.DataSet.FieldByName('M_HOJOU.土性コード').asString;
//  ds1.DataSet.FieldByName('腐植コード').asString := ds2.DataSet.FieldByName('M_HOJOU.腐植コード').asString;
//  ds1.DataSet.FieldByName('市町村コード').asString := ds2.DataSet.FieldByName('M_HOJOU.市町村コード').asString;
//  ds1.DataSet.FieldByName('地区名').asString := ds2.DataSet.FieldByName('地区名').asString;
//  ds1.DataSet.FieldByName('圃場名').asString := ds2.DataSet.FieldByName('圃場名').asString;


//  ds1.DataSet.FieldByName('作物名').asString := cmbSakumotu.Text; //
//  ds1.DataSet.FieldByName('作型名').asString := cmbSakugata.Text; //

//  ds1.DataSet.FieldByName('前作物名').asString := cmbZSakumotu.Text; //
//  ds1.DataSet.FieldByName('前作型名').asString := cmbZSakugata.Text; //

//  end;
  //ds1.DataSet.FieldByName('採取年月日').asDateTime := dtUketuke2.Date ;



end;


end.

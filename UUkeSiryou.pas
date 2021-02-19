unit UUkeSiryou;
{
  受付画面：受付テーブルにエントリーする画面
  リンクテーブルが多数あるので、レコード移動時に時間がかかる。
  必須入力のチェックは登録ボタンの時はプログラム制御出来るが、
  AutoPost時はシステム（BDE）にゆだねる。
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBTables, Mask, DBCtrls, Db, ComCtrls, ExtCtrls, ADODB;

type
  TfrmUkeSiryou = class(TForm)
    StatusBar1: TStatusBar;
    Table1aaa: TTable;
    ds1: TDataSource;
    Panel2: TPanel;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    btnDel: TBitBtn;
    btnPost: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    Panel3: TPanel;
    Panel5: TPanel;
    QNoukaorg: TQuery;
    ds2: TDataSource;
    Label13: TLabel;
    txtSampleNo: TDBEdit;
    btnSNo: TButton;
    DBNavigator1: TDBNavigator;
    gb2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    btnSHojou: TBitBtn;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    dtUketuke2: TDateTimePicker;
    DBEdit1: TDBEdit;
    GroupBox2: TGroupBox;
    Label37: TLabel;
    Label40: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Panel4: TPanel;
    DateTimePicker5: TDateTimePicker;
    Label14: TLabel;
    DateTimePicker6: TDateTimePicker;
    Label15: TLabel;
    DateTimePicker7: TDateTimePicker;
    Label16: TLabel;
    DateTimePicker8: TDateTimePicker;
    Label17: TLabel;
    Label18: TLabel;
    Label5: TLabel;
    Panel6: TPanel;
    Label19: TLabel;
    DBSName: TDBComboBox;
    DBSName2: TDBComboBox;
    Label20: TLabel;
    DBEdit9: TDBEdit;
    Label21: TLabel;
    Panel7: TPanel;
    Label22: TLabel;
    DBSt02: TDBComboBox;
    DBSt01: TDBComboBox;
    Label23: TLabel;
    DBEdit10: TDBEdit;
    Label43: TLabel;
    DBEdit21: TDBEdit;
    Label24: TLabel;
    DBEdit11: TDBEdit;
    BtKingaku: TButton;
    QKingakuorg: TQuery;
    Label54: TLabel;
    DBFutan: TDBComboBox;
    ADOTable1: TADOTable;
    QNouka: TADOQuery;
    QKingaku: TADOQuery;
//    procedure btnSHojouClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure txtHojouNoChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure ds1StateChange(Sender: TObject);
    procedure Table1aaaAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnSNoClick(Sender: TObject);
    procedure Table1aaaAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbJikiChange(Sender: TObject);
    procedure dtUketukeChange(Sender: TObject);
    procedure Table1aaaAfterCancel(DataSet: TDataSet);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
    procedure Table1aaaBeforePost(DataSet: TDataSet);
    procedure BtnClrClick(Sender: TObject);
    procedure txtSampleNoExit(Sender: TObject);
    procedure Table1aaaAfterPost(DataSet: TDataSet);
    procedure BtSakuCls0Click(Sender: TObject);
    procedure BtSakuCls1Click(Sender: TObject);
    procedure dtUketuke2Change(Sender: TObject);
    procedure btnSHojouClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure DateTimePicker5Change(Sender: TObject);
    procedure DateTimePicker7Change(Sender: TObject);
    procedure DateTimePicker6Change(Sender: TObject);
    procedure DateTimePicker8Change(Sender: TObject);
    procedure DBSt01Change(Sender: TObject);
    procedure DBSNameChange(Sender: TObject);
    procedure BtKingakuClick(Sender: TObject);
    procedure ADOTable1AfterCancel(DataSet: TDataSet);
    procedure ADOTable1AfterInsert(DataSet: TDataSet);
    procedure ADOTable1AfterPost(DataSet: TDataSet);
    procedure ADOTable1AfterScroll(DataSet: TDataSet);
    procedure ADOTable1BeforePost(DataSet: TDataSet);
  private
    { Private 宣言 }
    FNewNO : string ;
    procedure SetEditEnable(aFlag: Boolean);
  public
    procedure LocateNo(pSmplNo: string);
    { Public 宣言 }
  end;

var
  frmUkeSiryou: TfrmUkeSiryou;

implementation

uses DMU,SUketukeU, MHojouU,SNoukaU;

{$R *.DFM}

procedure TfrmUkeSiryou.FormCreate(Sender: TObject);
var
stmp : String;
begin
	Color := BackColor ;
  FNewNO := '';
	ADOTable1.Open;
  QNouka.CLose;
  QNouka.SQL.Clear();
  stmp := 'select * from M_NOUKA order by 農家番号';
//  stmp := 'select * from M_NOUKA,M_CITY,M_TIKU'+
//  ' where M_NOUKA.農家番号 = "'+DBEdit8.Text+'"';
  QNouka.SQL.Add( stmp );
  QNouka.Open;
//  QueryHojou.Open;
//速度アップなら以下の作物関連のリンクテーブル処理を見直すと改善される


        //
	if not IsEntryYear then begin		//操作可能年度で無ければ編集不可
    btnNew.Enabled := False ;
    SetEditEnable(False);
  end;
end;
{
  データ登録コンポーネントの有効設定：サンプル場号別編集制御用
}
procedure TfrmUkeSiryou.SetEditEnable(aFlag:Boolean);
begin
    btnEdit.Enabled := aFlag ;
    btnDel.Enabled := aFlag ;
  	ds1.AutoEdit := aFlag ;
//    gb1.Enabled := aFlag ;
    gb2.Enabled := aFlag ;
//		gb3.Enabled := aFlag ;
//		gb4.Enabled := aFlag ;
end;
procedure TfrmUkeSiryou.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	if ds1.DataSet.State in [dsEdit	,dsInsert] then begin
    if Application.MessageBox ('編集を取り消しますか？','確認', MB_YESNO ) = ID_YES then
  		ds1.DataSet.Cancel
    else begin
      CanClose := false ;
      exit ;
    end;
  end;
end;

procedure TfrmUkeSiryou.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOTable1.Close;
end;

{指定サンプル番号に移動}
procedure TfrmUkeSiryou.LocateNo( pSmplNo : string );
begin
  //編集中でなければサンプル番号に移動
	if ds1.DataSet.State in [dsEdit	,dsInsert] then exit;
  ADOTable1.locate('サンプル番号',pSmplNo,[]);
end;
{新規ボタン}
procedure TfrmUkeSiryou.btnNewClick(Sender: TObject);
var
  bNewRec : Boolean ;
begin

//ScaleBy(1,10);
    //最大サンプル番号割り当て
    FNewNO := GetMaxSampleNo(bNewRec,'3') ;   {Version 0.6 #38}
    if FNewNO = '' then exit ;   {Version 0.6 #36}
    {Version 0.6 #46 : 削除レコードも使う}
    if not bNewRec then begin
      {実際にレコードを削除する。でないと変更量（画面リンク項目、Filtere処理）が大きい}
      with DataModule1.QueryWrite do begin
        SQL.Text := 'delete from T_UKETUKE3 where サンプル番号='''+FNewNO+'''';
        ExecSQL ;
//        SQL.Text := 'delete from T_SINDAN where サンプル番号='''+FNewNO+'''';
//        ExecSQL ;
      end;
    end;
	  ds1.DataSet.Append;    {Append->Insert特に問題なさそう}
    ds1.DataSet.FieldByName('サンプル番号').asString := FNewNO ;
    ds1.DataSet.FieldByName('費用負担者').asString := '生産者本人';


end;
{閉じるボタン}
procedure TfrmUkeSiryou.btnCloseClick(Sender: TObject);
begin
//	if ds1.DataSet.State in [dsEdit	,dsInsert] then
//		ds1.DataSet.Cancel;
	Close;
end;
{キャンセルボタン}
procedure TfrmUkeSiryou.btnCancelClick(Sender: TObject);
begin
	ds1.DataSet.Cancel;
end;
{登録ボタン}
procedure TfrmUkeSiryou.btnPostClick(Sender: TObject);
var
stmp : String;
begin
  {入力チェック}
  if not ChkEditLength(txtSampleNo,4) then exit;
//  if not ChkEditLength(txtHojouNo,7) then exit;


  stmp := DBSName.Text; //ds1.DataSet.FieldByName('飼料名').asString;
  if stmp = '' then begin
     showMessage('飼料名を入力してください。');
     exit;
  end;

  stmp := DBSName2.Text; //ds1.DataSet.FieldByName('飼料種類').asString;
  if stmp = '' then begin
     showMessage('飼料種類を入力してください。');
     exit;
  end;



	ds1.DataSet.Post;
end;
//新規の場合受付日セット
procedure TfrmUkeSiryou.Table1aaaAfterInsert(DataSet: TDataSet);
begin
//	dtUketuke.Date := now ;
//	dtUketuke2.Date := now ;
  {初期値の設定}
//  ds1.DataSet.FieldByName('受付年月日').asDateTime := dtUketuke.Date ;
//  ds1.DataSet.FieldByName('採取年月日').asDateTime := dtUketuke2.Date ;
  ds1.DataSet.FieldByName('編集日').asDatetime := now ;  //送信フラグの手前、手動で更新する
	ds1.DataSet.FieldByName('削除フラグ').asBoolean := False ;

  SetEditEnable( True );  {Version 0.6 #37}
end;
//更新前処理
procedure TfrmUkeSiryou.Table1aaaBeforePost(DataSet: TDataSet);
var
nname : String;
sname : String;
itmp : Integer;
flg : boolean;
i : Integer;
stmp : String;
begin
  //レコード移動による自動ポストの時は必須項目が未入力のとき例外が発生し、
  //その項目にフォーカスが移動するので、任せる。



  {初期値の設定}
//  ds1.DataSet.FieldByName('受付年月日').asDateTime := dtUketuke.Date ;
  ds1.DataSet.FieldByName('採取年月日').asDateTime := dtUketuke2.Date ;
  //分析時期
//  ds1.DataSet.FieldByName('分析時期').asString := InttoStr(cmbJiki.ItemIndex);
	//編集日の登録
  ds1.DataSet.FieldByName('編集日').asDatetime := now ;  //送信フラグの手前、手動で更新する

  //負担者リスト登録
  nname := ds1.DataSet.FieldByName('費用負担者').asString;
  if nname <> '' then begin
        //iniファイルに登録
        itmp := SystemIni.ReadInteger( 'Futansya', 'Count', 0 );

        //iniに既にあるものは、登録しない
        flg := false;
        for i := 1 to itmp do begin
            stmp := 'name'+InttoStr(i);
            sname := SystemIni.ReadString( 'Futansya', stmp, '' );
            if nname = sname then
               flg := true;
        end;

        if not flg then begin
           INC(itmp);
           stmp := 'name'+InttoStr(itmp);
           SystemIni.WriteInteger( 'Futansya', 'Count', itmp );
           SystemIni.WriteString('Futansya', stmp, nname );
           DBFutan.Items.Add( nname );
        end;
  end;

end;
//更新後処理
procedure TfrmUkeSiryou.Table1aaaAfterPost(DataSet: TDataSet);
begin
  //もし、新規作成なら、診断テーブルを作成する。 {Version 0.6 #38}

//  if FNewNO <> '' then
//    InsertSindanTable(DataSet.FieldByName('サンプル番号').asString);  //←FNewNOにしないこと

  FNewNO:=''; //Post,Cancelした後はクリア
end;

{削除ボタン}
procedure TfrmUkeSiryou.btnDelClick(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
  if Application.MessageBox ('削除しますか？','確認', MB_YESNO ) = ID_YES then begin
    {Version 0.6 #23 }  //同期処理対処のため、削除フラグにする。診断Tもあれば同様
//		ds1.DataSet.Delete;
    //診断テーブル削除
    DelFlagSindanTable(ds1.DataSet.FieldByName('サンプル番号').asString);
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('削除フラグ').asBoolean := True ;
    ds1.DataSet.Post ;
    {Version 0.6 #47 : 編集ボタン再評価}
    ADOTable1AfterScroll(ds1.DataSet);
  end;
end;
{編集ボタン}
procedure TfrmUkeSiryou.btnEditClick(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	ds1.DataSet.Edit;
end;
{ステータス変更イベントで操作ボタンの制御}
procedure TfrmUkeSiryou.ds1StateChange(Sender: TObject);
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
    btnSHojou.Enabled := True ;
    BtKingaku.Enabled := True;

    DBNavigator1.Enabled := false;

//    BtTitenIn.Enabled := True;
  end;
  else begin
  	btnNew.Enabled := True;
    btnEdit.Enabled := True;
    btnDel.Enabled := True;
    btnPost.Enabled := False ;
    btnCancel.Enabled := False ;
    btnSHojou.Enabled := False ;
    BtKingaku.Enabled := False;
//    BtTitenIn.Enabled := False ;
    DBNavigator1.Enabled := True;
  end;
  end;
end;

//検索
procedure TfrmUkeSiryou.btnSNoClick(Sender: TObject);
var
	SNO : string ;
begin
  SNO := DspUkeList(txtSampleNo.Text, '3');
  if SNO <> '' then begin
  	ADOTable1.Locate('サンプル番号',SNO,[]);
  end;
end;
//レコードの移動でＤＢリンクでない項目をセット
procedure TfrmUkeSiryou.Table1aaaAfterScroll(DataSet: TDataSet);
var
stmp : String;
begin
//  if not DataSet.FieldByName('受付年月日').IsNull then
//    dtUketuke.Date := DataSet.FieldByName('受付年月日').asDateTime ;




  if not DataSet.FieldByName('採取年月日').IsNull then
    dtUketuke2.Date := DataSet.FieldByName('採取年月日').asDateTime ;

  if not DataSet.FieldByName('サンプル持込日').IsNull then
    DateTimePicker1.Date := DataSet.FieldByName('サンプル持込日').asDateTime ;

//  if not DataSet.FieldByName('結果配信予定日').IsNull then
//    DateTimePicker2.Date := DataSet.FieldByName('結果配信予定日').asDateTime ;

//  if not DataSet.FieldByName('本所受付日').IsNull then
//    DateTimePicker3.Date := DataSet.FieldByName('本所受付日').asDateTime ;

  if not DataSet.FieldByName('センター受付日').IsNull then
    DateTimePicker4.Date := DataSet.FieldByName('センター受付日').asDateTime ;

  if not DataSet.FieldByName('収穫開始年月日').IsNull then
    DateTimePicker5.Date := DataSet.FieldByName('収穫開始年月日').asDateTime ;

  if not DataSet.FieldByName('収穫終了年月日').IsNull then
    DateTimePicker7.Date := DataSet.FieldByName('収穫終了年月日').asDateTime ;

  if not DataSet.FieldByName('詰込開始年月日').IsNull then
    DateTimePicker6.Date := DataSet.FieldByName('詰込開始年月日').asDateTime ;

  if not DataSet.FieldByName('詰込終了年月日').IsNull then
    DateTimePicker8.Date := DataSet.FieldByName('詰込終了年月日').asDateTime ;


  //ステージ
  DBSt01.OnChange(nil);
  DBSt02.ItemIndex := DBSt02.Items.IndexOf( DataSet.FieldByName('生育ステージ').AsString);

   //
   DBSName.OnChange(Nil);
  DBSName2.ItemIndex := DBSName2.Items.IndexOf( DataSet.FieldByName('飼料種類').AsString);


  //分析時期
//  cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('分析時期').asString,0);

  {Version 0.6 #27 : 自PCエントリー番号範囲内のみ編集可}
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    SetEditEnable(
      IsEditRec(DataSet.FieldByName('サンプル番号').asString)  and IsEntryYear
    );
end;

//DB非リンク項目編集されれば、自動エディットする。
procedure TfrmUkeSiryou.cmbJikiChange(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
//  ds1.DataSet.FieldByName('分析時期').asString := InttoStr(cmbJiki.ItemIndex);

end;
//DB非リンク項目編集されれば、自動エディットする。
procedure TfrmUkeSiryou.dtUketukeChange(Sender: TObject);
begin
end;

//キャンセルしたら非リンク項目を戻す
procedure TfrmUkeSiryou.Table1aaaAfterCancel(DataSet: TDataSet);
begin
  FNewNO := '';     //Post,Cancelした後はクリア {Version 0.6 #38}
//   Table1AfterScroll(DataSet);
//2003/5/6 二度呼ばれるためコメント
end;
{データ編集イベント}
procedure TfrmUkeSiryou.ds1DataChange(Sender: TObject; Field: TField);
var
stmp : String;
begin

  QNouka.CLose;
  QNouka.SQL.Clear();
  stmp := 'select * from M_NOUKA,M_CITY,M_TIKU'+
  ' where M_NOUKA.農家番号 = "'+DBEdit8.Text+'"';
  QNouka.SQL.Add( stmp );
  QNouka.Open;


end;
{Enterキーでタブ移動}
procedure TfrmUkeSiryou.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enterキーが押されたら
  begin
    Key:=#0; //キー入力を無効にし
    Keybd_event(VK_TAB,0,0,0) //Tabキーを発生させる。
  end;
end;

procedure TfrmUkeSiryou.BtnClrClick(Sender: TObject);
var
  aBuff : string ;
begin
  aBuff := InttoStr( (Sender as TButton).Tag ) ;
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('有機物コード'+aBuff).Clear ;
  ds1.DataSet.FieldByName('有機物施肥量'+aBuff).Clear ;
end;


procedure TfrmUkeSiryou.txtSampleNoExit(Sender: TObject);
var
  iNum : integer ;
begin
  {Version 0.6 #24 範囲入力チェック}
  if txtSampleNo.Enabled  then begin
    //新規の時しか有効でない
    try
      iNum := StrtoInt(txtSampleNo.Text);
    except
      showmessage('サンプル番号を正しく入力して下さい。');
      txtSampleNo.Text := FNewNO ;
      ds1.DataSet.FieldByName('サンプル番号').asString := txtSampleNo.Text ;
      txtSampleNo.SetFocus ;
      exit;
    end;
    txtSampleNo.Text := Format('%0.4d',[iNum]);
    ds1.DataSet.FieldByName('サンプル番号').asString := txtSampleNo.Text ;
    //用意された番号以上＆エンドないか？
//    if (iNum < StrtoInt(FNewNO) ) or ( iNum > EntrySTOP ) then begin
//      showmessage('サンプル番号範囲制約を超えています。');
//      txtSampleNo.Text := FNewNO ;
//      ds1.DataSet.FieldByName('サンプル番号').asString := txtSampleNo.Text ;
//      txtSampleNo.SetFocus ;
//    end;

    //既にあるサンプルの場合
    with DataModule1.ADOQtmp do begin
        SQL.Text := 'select * from T_UKETUKE3 where サンプル番号='''+txtSampleNo.Text+'''';
        Open;
        //レコードがあるか
        if DataModule1.ADOQtmp.RecordCount > 0 then begin
          if DataModule1.ADOQtmp.FieldByName('削除フラグ').asBoolean Then begin
               DataModule1.ADOQtmp.Delete;
               close;
               //診断テーブルも削除
               SQL.Text := 'select * from T_SINDAN where サンプル番号='''+txtSampleNo.Text+'''';
               Open;
               DataModule1.ADOQtmp.Delete;
               close;
          end
          else begin
              showMessage('既にサンプルがあります。別のサンプルにしてください。');
              txtSampleNo.Text := FNewNO ;
              ds1.DataSet.FieldByName('サンプル番号').asString := txtSampleNo.Text ;
              txtSampleNo.SetFocus ;

          end;

        end

    end;

  end;
end;


procedure TfrmUkeSiryou.BtSakuCls0Click(Sender: TObject);

begin
//  aBuff := InttoStr( (Sender as TButton).Tag ) ;
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('前作目コード').Clear ;
    ds1.DataSet.FieldByName('前作物コード').Clear ;
    ds1.DataSet.FieldByName('前作型コード').Clear ;

end;

procedure TfrmUkeSiryou.BtSakuCls1Click(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('作目コード').Clear ;
    ds1.DataSet.FieldByName('作物コード').Clear ;
    ds1.DataSet.FieldByName('作型コード').Clear ;

end;

procedure TfrmUkeSiryou.dtUketuke2Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('採取年月日').asDateTime := dtUketuke2.Date ;

end;

procedure TfrmUkeSiryou.btnSHojouClick(Sender: TObject);
var
	aBuff :string;
        stmp : String;
begin
	aBuff := DBEdit8.Text;
  if DspSNouka(aBuff) then begin
//    DBEdit2.Text := aBuff ;   これだと、編集モードに自動的にならない
    if not( ds1.DataSet.State in [dsEdit	,dsInsert] ) then ds1.DataSet.Edit;
    ds1.DataSet.FieldByName('農家番号').asString :=  aBuff;
  end;

  QNouka.CLose;
  QNouka.SQL.Clear();
  stmp := 'select * from M_NOUKA,M_CITY,M_TIKU'+
  ' where M_NOUKA.農家番号 = "'+aBuff+'"';
  QNouka.SQL.Add( stmp );
  QNouka.Open;





end;

procedure TfrmUkeSiryou.FormShow(Sender: TObject);
var
itmp : Integer;
i : Integer;
stmp : String;
stmp2 : String;
begin

  DBFutan.Items.Clear;
  itmp := SystemIni.ReadInteger('Futansya', 'Count', 0 );
  for i := 1 to itmp do begin
     stmp2 := 'name'+InttoStr(i);
     stmp := SystemIni.ReadString('Futansya',stmp2, '' );
     if stmp <> '' then
       DBFutan.Items.Add( stmp );
  end;

 // TSisyo.Open;


end;

procedure TfrmUkeSiryou.DateTimePicker1Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('サンプル持込日').asDateTime := DateTimePicker1.Date ;

end;

procedure TfrmUkeSiryou.DateTimePicker4Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('センター受付日').asDateTime := DateTimePicker4.Date ;

end;

procedure TfrmUkeSiryou.DateTimePicker5Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('収穫開始年月日').asDateTime := DateTimePicker5.Date ;

end;

procedure TfrmUkeSiryou.DateTimePicker7Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('収穫終了年月日').asDateTime := DateTimePicker7.Date ;

end;

procedure TfrmUkeSiryou.DateTimePicker6Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('詰込開始年月日').asDateTime := DateTimePicker6.Date ;

end;

procedure TfrmUkeSiryou.DateTimePicker8Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('詰込終了年月日').asDateTime := DateTimePicker8.Date ;

end;

procedure TfrmUkeSiryou.DBSt01Change(Sender: TObject);
begin
   DBSt02.Items.Clear;

   if DBSt01.Text = 'イネ科' then begin
      DBSt02.Items.Add('出穂始');
      DBSt02.Items.Add('出穂期');
      DBSt02.Items.Add('穂揃期');
      DBSt02.Items.Add('開花期');
      DBSt02.Items.Add('成熟期');

   end
   else if DBSt01.Text = 'マメ科' then begin
      DBSt02.Items.Add('開花前');
      DBSt02.Items.Add('開花期');
      DBSt02.Items.Add('成熟期');

   end
   else if DBSt01.Text = 'トウモロコシ' then begin
      DBSt02.Items.Add('未乳熟期');
      DBSt02.Items.Add('乳熟期');
      DBSt02.Items.Add('糊熟期');
      DBSt02.Items.Add('黄熟期');
      DBSt02.Items.Add('成熟期');

   end;

end;

procedure TfrmUkeSiryou.DBSNameChange(Sender: TObject);
begin

     DBSName2.Items.Clear;
     if DBSName.Text = 'トウモロコシ' then begin
         DBSName2.Items.Add('サイレージ');
         DBSName2.Items.Add('黄熟期');

     end
     else begin
         DBSName2.Items.Add('乾草');
         DBSName2.Items.Add('サイレージ');
         DBSName2.Items.Add('生草');

     end;
end;

procedure TfrmUkeSiryou.ADOTable1AfterCancel(DataSet: TDataSet);
begin
  FNewNO := '';     //Post,Cancelした後はクリア {Version 0.6 #38}

end;

procedure TfrmUkeSiryou.ADOTable1AfterInsert(DataSet: TDataSet);
begin
//	dtUketuke.Date := now ;
//	dtUketuke2.Date := now ;
  {初期値の設定}
//  ds1.DataSet.FieldByName('受付年月日').asDateTime := dtUketuke.Date ;
//  ds1.DataSet.FieldByName('採取年月日').asDateTime := dtUketuke2.Date ;
  ds1.DataSet.FieldByName('編集日').asDatetime := now ;  //送信フラグの手前、手動で更新する
	ds1.DataSet.FieldByName('削除フラグ').asBoolean := False ;

  SetEditEnable( True );  {Version 0.6 #37}

end;

procedure TfrmUkeSiryou.ADOTable1AfterPost(DataSet: TDataSet);
begin
  FNewNO:=''; //Post,Cancelした後はクリア

end;

procedure TfrmUkeSiryou.ADOTable1AfterScroll(DataSet: TDataSet);
var
stmp : String;
begin
//  if not DataSet.FieldByName('受付年月日').IsNull then
//    dtUketuke.Date := DataSet.FieldByName('受付年月日').asDateTime ;




  if not DataSet.FieldByName('採取年月日').IsNull then
    dtUketuke2.Date := DataSet.FieldByName('採取年月日').asDateTime ;

  if not DataSet.FieldByName('サンプル持込日').IsNull then
    DateTimePicker1.Date := DataSet.FieldByName('サンプル持込日').asDateTime ;

//  if not DataSet.FieldByName('結果配信予定日').IsNull then
//    DateTimePicker2.Date := DataSet.FieldByName('結果配信予定日').asDateTime ;

//  if not DataSet.FieldByName('本所受付日').IsNull then
//    DateTimePicker3.Date := DataSet.FieldByName('本所受付日').asDateTime ;

  if not DataSet.FieldByName('センター受付日').IsNull then
    DateTimePicker4.Date := DataSet.FieldByName('センター受付日').asDateTime ;

  if not DataSet.FieldByName('収穫開始年月日').IsNull then
    DateTimePicker5.Date := DataSet.FieldByName('収穫開始年月日').asDateTime ;

  if not DataSet.FieldByName('収穫終了年月日').IsNull then
    DateTimePicker7.Date := DataSet.FieldByName('収穫終了年月日').asDateTime ;

  if not DataSet.FieldByName('詰込開始年月日').IsNull then
    DateTimePicker6.Date := DataSet.FieldByName('詰込開始年月日').asDateTime ;

  if not DataSet.FieldByName('詰込終了年月日').IsNull then
    DateTimePicker8.Date := DataSet.FieldByName('詰込終了年月日').asDateTime ;


  //ステージ
  DBSt01.OnChange(nil);
  DBSt02.ItemIndex := DBSt02.Items.IndexOf( DataSet.FieldByName('生育ステージ').AsString);

   //
   DBSName.OnChange(Nil);
  DBSName2.ItemIndex := DBSName2.Items.IndexOf( DataSet.FieldByName('飼料種類').AsString);


  //分析時期
//  cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('分析時期').asString,0);

  {Version 0.6 #27 : 自PCエントリー番号範囲内のみ編集可}
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    SetEditEnable(
      IsEditRec(DataSet.FieldByName('サンプル番号').asString)  and IsEntryYear
    );

end;

procedure TfrmUkeSiryou.ADOTable1BeforePost(DataSet: TDataSet);
var
nname : String;
sname : String;
itmp : Integer;
flg : boolean;
i : Integer;
stmp : String;
begin
  //レコード移動による自動ポストの時は必須項目が未入力のとき例外が発生し、
  //その項目にフォーカスが移動するので、任せる。



  {初期値の設定}
//  ds1.DataSet.FieldByName('受付年月日').asDateTime := dtUketuke.Date ;
  ds1.DataSet.FieldByName('採取年月日').asDateTime := dtUketuke2.Date ;
  //分析時期
//  ds1.DataSet.FieldByName('分析時期').asString := InttoStr(cmbJiki.ItemIndex);
	//編集日の登録
  ds1.DataSet.FieldByName('編集日').asDatetime := now ;  //送信フラグの手前、手動で更新する

  //負担者リスト登録
  nname := ds1.DataSet.FieldByName('費用負担者').asString;
  if nname <> '' then begin
        //iniファイルに登録
        itmp := SystemIni.ReadInteger( 'Futansya', 'Count', 0 );

        //iniに既にあるものは、登録しない
        flg := false;
        for i := 1 to itmp do begin
            stmp := 'name'+InttoStr(i);
            sname := SystemIni.ReadString( 'Futansya', stmp, '' );
            if nname = sname then
               flg := true;
        end;

        if not flg then begin
           INC(itmp);
           stmp := 'name'+InttoStr(itmp);
           SystemIni.WriteInteger( 'Futansya', 'Count', itmp );
           SystemIni.WriteString('Futansya', stmp, nname );
           DBFutan.Items.Add( nname );
        end;
  end;

end;

procedure TfrmUkeSiryou.BtKingakuClick(Sender: TObject);
var
stmp : String;
skubun : String;
skoumoku : String;
itmp : Integer;
begin
  //金額セット
  skubun := QNouka.FieldByName('区分').asString;
  if skubun <> '' then begin

     skoumoku := '粗飼料';

     QKingaku.Close;
     stmp := 'select 区別,'+skoumoku+' as 金額 from M_KINGAKU where 区別 = "'+skubun+'"';
     QKingaku.SQL.Clear;
     QKingaku.SQL.Add(stmp);
     QKingaku.Open;

     if QKingaku.RecordCount > 0 then begin

       itmp := QKingaku.FieldByName('金額').asInteger;

       ds1.DataSet.FieldByName('金額').asInteger := itmp;
     end;

     QKingaku.close;

  end;

end;


end.

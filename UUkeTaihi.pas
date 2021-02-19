unit UUkeTaihi;
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
  TfrmUkeTaihi = class(TForm)
    StatusBar1: TStatusBar;
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
    gb5: TGroupBox;
    gb2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    btnSHojou: TBitBtn;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    ds2: TDataSource;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit9: TDBEdit;
    Label5: TLabel;
    Label13: TLabel;
    txtSampleNo: TDBEdit;
    btnSNo: TButton;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    dtUketuke2: TDateTimePicker;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label15: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label16: TLabel;
    Shape3: TShape;
    DBEdit11: TDBEdit;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Shape7: TShape;
    Label17: TLabel;
    Shape8: TShape;
    Shape9: TShape;
    Label18: TLabel;
    Label19: TLabel;
    Shape10: TShape;
    Label20: TLabel;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    Shape11: TShape;
    Shape12: TShape;
    Label21: TLabel;
    Shape13: TShape;
    DBEdit15: TDBEdit;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Shape17: TShape;
    Label22: TLabel;
    Shape18: TShape;
    Shape19: TShape;
    Label23: TLabel;
    Label24: TLabel;
    Shape20: TShape;
    Label25: TLabel;
    DBEdit18: TDBEdit;
    Label26: TLabel;
    Shape21: TShape;
    Shape22: TShape;
    Label27: TLabel;
    Shape23: TShape;
    DBEdit19: TDBEdit;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    DBEdit20: TDBEdit;
    DBEdit22: TDBEdit;
    Shape27: TShape;
    Label28: TLabel;
    Shape28: TShape;
    Shape29: TShape;
    Label29: TLabel;
    Label30: TLabel;
    Shape30: TShape;
    Label31: TLabel;
    Label32: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label33: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    ds4: TDataSource;
    ds5: TDataSource;
    Label34: TLabel;
    cmbSakumoku: TDBLookupComboBox;
    Label35: TLabel;
    cmbSakumotu: TDBLookupComboBox;
    Label36: TLabel;
    cmbSakugata: TDBLookupComboBox;
    BtSakuCls1: TButton;
    dsSakumotu: TDataSource;
    dsSakugata: TDataSource;
    dsSakumoku: TDataSource;
    Label37: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label40: TLabel;
    DateTimePicker4: TDateTimePicker;
    Label38: TLabel;
    DBEdit23: TDBEdit;
    BtWariCls: TButton;
    Label39: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    DBEdit21: TDBEdit;
    Label53: TLabel;
    DBEdit24: TDBEdit;
    BtKingaku: TButton;
    Label54: TLabel;
    DBFutan: TDBComboBox;
    QNouka: TADOQuery;
    ADOTable2: TADOTable;
    ADOTable3: TADOTable;
    QKingaku: TADOQuery;
    QuerySakumoku: TADOQuery;
    QuerySakumotu: TADOQuery;
    QuerySakugata: TADOQuery;
    ADOQuery1: TADOQuery;
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
    procedure Table1orgAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnSNoClick(Sender: TObject);
    procedure Table1orgAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbJikiChange(Sender: TObject);
    procedure dtUketukeChange(Sender: TObject);
    procedure Table1orgAfterCancel(DataSet: TDataSet);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
    procedure Table1orgBeforePost(DataSet: TDataSet);
    procedure BtnClrClick(Sender: TObject);
    procedure txtSampleNoExit(Sender: TObject);
    procedure Table1orgAfterPost(DataSet: TDataSet);
    procedure BtSakuCls0Click(Sender: TObject);
    procedure BtSakuCls1Click(Sender: TObject);
    procedure dtUketuke2Change(Sender: TObject);
    procedure btnSHojouClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure BtWariClsClick(Sender: TObject);
    procedure BtKingakuClick(Sender: TObject);
    procedure ADOTable1AfterCancel(DataSet: TDataSet);
    procedure ADOTable1AfterInsert(DataSet: TDataSet);
    procedure ADOTable1AfterPost(DataSet: TDataSet);
    procedure ADOTable1AfterScroll(DataSet: TDataSet);
    procedure ADOTable1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1AfterCancel(DataSet: TDataSet);
    procedure ADOQuery1AfterInsert(DataSet: TDataSet);
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
  private
    { Private 宣言 }
    FNewNO : string ;
    procedure SetEditEnable(aFlag: Boolean);
  public
    procedure LocateNo(pSmplNo: string);
    { Public 宣言 }
  end;

var
  frmUkeTaihi: TfrmUkeTaihi;

implementation

uses DMU,SUketukeU, MHojouU,SNoukaU;

{$R *.DFM}

procedure TfrmUkeTaihi.FormCreate(Sender: TObject);
var
stmp : String;
begin
	Color := BackColor ;
  FNewNO := '';
	ADOQuery1.Open;
  QNouka.CLose;
  QNouka.SQL.Clear();
  stmp := 'select * from M_NOUKA,M_CITY,M_TIKU'+
  ' where M_NOUKA.農家番号 = "'+DBEdit8.Text+'"';
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
procedure TfrmUkeTaihi.SetEditEnable(aFlag:Boolean);
begin
    btnEdit.Enabled := aFlag ;
    btnDel.Enabled := aFlag ;
  	ds1.AutoEdit := aFlag ;
//    gb1.Enabled := aFlag ;
    gb2.Enabled := aFlag ;
//		gb3.Enabled := aFlag ;
//		gb4.Enabled := aFlag ;
end;
procedure TfrmUkeTaihi.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TfrmUkeTaihi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOQuery1.Close;
end;

{指定サンプル番号に移動}
procedure TfrmUkeTaihi.LocateNo( pSmplNo : string );
begin
  //編集中でなければサンプル番号に移動
	if ds1.DataSet.State in [dsEdit	,dsInsert] then exit;
  ADOQuery1.locate('サンプル番号',pSmplNo,[]);
end;
{新規ボタン}
procedure TfrmUkeTaihi.btnNewClick(Sender: TObject);
var
  bNewRec : Boolean ;
begin

//ScaleBy(1,10);
    //最大サンプル番号割り当て
    FNewNO := GetMaxSampleNo(bNewRec,'2') ;   {Version 0.6 #38}
    if FNewNO = '' then exit ;   {Version 0.6 #36}
    {Version 0.6 #46 : 削除レコードも使う}
    if not bNewRec then begin
      {実際にレコードを削除する。でないと変更量（画面リンク項目、Filtere処理）が大きい}
      with DataModule1.QueryWrite do begin
        SQL.Text := 'delete from T_UKETUKE2 where サンプル番号='''+FNewNO+'''';
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
procedure TfrmUkeTaihi.btnCloseClick(Sender: TObject);
begin
//	if ds1.DataSet.State in [dsEdit	,dsInsert] then
//		ds1.DataSet.Cancel;
	Close;
end;
{キャンセルボタン}
procedure TfrmUkeTaihi.btnCancelClick(Sender: TObject);
begin
	ds1.DataSet.Cancel;
end;
{登録ボタン}
procedure TfrmUkeTaihi.btnPostClick(Sender: TObject);
begin
  {入力チェック}
  if not ChkEditLength(txtSampleNo,4) then exit;
//  if not ChkEditLength(txtHojouNo,7) then exit;





	ds1.DataSet.Post;
end;
//新規の場合受付日セット
procedure TfrmUkeTaihi.Table1orgAfterInsert(DataSet: TDataSet);
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
procedure TfrmUkeTaihi.Table1orgBeforePost(DataSet: TDataSet);
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

 //



  {初期値の設定}
//  ds1.DataSet.FieldByName('受付年月日').asDateTime := dtUketuke.Date ;
  ds1.DataSet.FieldByName('採取年月日').asDateTime := dtUketuke2.Date ;

  ds1.DataSet.FieldByName('サンプル持込日').asDateTime := DateTimePicker1.Date ;
//  ds1.DataSet.FieldByName('結果配信予定日').asDateTime := DateTimePicker2.Date ;
//  ds1.DataSet.FieldByName('本所受付日').asDateTime := DateTimePicker3.Date ;
  ds1.DataSet.FieldByName('センター受付日').asDateTime := DateTimePicker4.Date ;


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
procedure TfrmUkeTaihi.Table1orgAfterPost(DataSet: TDataSet);
begin
  //もし、新規作成なら、診断テーブルを作成する。 {Version 0.6 #38}
//  if FNewNO <> '' then
//    InsertSindanTable(DataSet.FieldByName('サンプル番号').asString);  //←FNewNOにしないこと
  FNewNO:=''; //Post,Cancelした後はクリア
end;

{削除ボタン}
procedure TfrmUkeTaihi.btnDelClick(Sender: TObject);
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
procedure TfrmUkeTaihi.btnEditClick(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	ds1.DataSet.Edit;
end;
{ステータス変更イベントで操作ボタンの制御}
procedure TfrmUkeTaihi.ds1StateChange(Sender: TObject);
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

//    BtTitenIn.Enabled := True;
    DBNavigator1.Enabled := false;
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
procedure TfrmUkeTaihi.btnSNoClick(Sender: TObject);
var
	SNO : string ;
begin
  SNO := DspUkeList(txtSampleNo.Text, '2');
  if SNO <> '' then begin
  	ADOQuery1.Locate('サンプル番号',SNO,[]);
  end;
end;
//レコードの移動でＤＢリンクでない項目をセット
procedure TfrmUkeTaihi.Table1orgAfterScroll(DataSet: TDataSet);
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

  //分析時期
//  cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('分析時期').asString,0);

  {Version 0.6 #27 : 自PCエントリー番号範囲内のみ編集可}
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    SetEditEnable(
      IsEditRec(DataSet.FieldByName('サンプル番号').asString)  and IsEntryYear
    );
end;

//DB非リンク項目編集されれば、自動エディットする。
procedure TfrmUkeTaihi.cmbJikiChange(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
//  ds1.DataSet.FieldByName('分析時期').asString := InttoStr(cmbJiki.ItemIndex);

end;
//DB非リンク項目編集されれば、自動エディットする。
procedure TfrmUkeTaihi.dtUketukeChange(Sender: TObject);
begin
end;

//キャンセルしたら非リンク項目を戻す
procedure TfrmUkeTaihi.Table1orgAfterCancel(DataSet: TDataSet);
begin
  FNewNO := '';     //Post,Cancelした後はクリア {Version 0.6 #38}
//   Table1AfterScroll(DataSet);
//2003/5/6 二度呼ばれるためコメント
end;
{データ編集イベント}
procedure TfrmUkeTaihi.ds1DataChange(Sender: TObject; Field: TField);
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
procedure TfrmUkeTaihi.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enterキーが押されたら
  begin
    Key:=#0; //キー入力を無効にし
    Keybd_event(VK_TAB,0,0,0) //Tabキーを発生させる。
  end;
end;

procedure TfrmUkeTaihi.BtnClrClick(Sender: TObject);
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


procedure TfrmUkeTaihi.txtSampleNoExit(Sender: TObject);
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
        SQL.Text := 'select * from T_UKETUKE2 where サンプル番号='''+txtSampleNo.Text+'''';
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


procedure TfrmUkeTaihi.BtSakuCls0Click(Sender: TObject);

begin
//  aBuff := InttoStr( (Sender as TButton).Tag ) ;
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('前作目コード').Clear ;
    ds1.DataSet.FieldByName('前作物コード').Clear ;
    ds1.DataSet.FieldByName('前作型コード').Clear ;

end;

procedure TfrmUkeTaihi.BtSakuCls1Click(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('作目コード').Clear ;
    ds1.DataSet.FieldByName('作物コード').Clear ;
    ds1.DataSet.FieldByName('作型コード').Clear ;

end;

procedure TfrmUkeTaihi.dtUketuke2Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('採取年月日').asDateTime := dtUketuke2.Date ;

end;

procedure TfrmUkeTaihi.btnSHojouClick(Sender: TObject);
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

procedure TfrmUkeTaihi.FormShow(Sender: TObject);
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
  ADOTable2.Open; //土壌
  ADOTable3.Open; //土性

  QuerySakumoku.Open;
  QuerySakumotu.Open;
  QuerySakugata.Open;



end;

procedure TfrmUkeTaihi.DateTimePicker1Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('サンプル持込日').asDateTime := DateTimePicker1.Date ;

end;

procedure TfrmUkeTaihi.DateTimePicker4Change(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
    ds1.DataSet.FieldByName('センター受付日').asDateTime := DateTimePicker4.Date ;

end;

procedure TfrmUkeTaihi.BtWariClsClick(Sender: TObject);
begin

    if ADOQuery1.State <> dsEdit then
       ADOQuery1.Edit;

    ADOQuery1.FieldByName('稲わら').AsString := '';
    ADOQuery1.FieldByName('麦わら').AsString := '';
    ADOQuery1.FieldByName('籾がら').AsString := '';
    ADOQuery1.FieldByName('作物残渣').AsString := '';
    ADOQuery1.FieldByName('牛ふん').AsString := '';
    ADOQuery1.FieldByName('豚ぷん').AsString := '';
    ADOQuery1.FieldByName('鶏ふん').AsString := '';
    ADOQuery1.FieldByName('馬ふん').AsString := '';
    ADOQuery1.FieldByName('でん粉粕').AsString := '';
    ADOQuery1.fieldByName('残土').AsString := '';
    ADOQuery1.FieldByName('汚泥堆肥').AsString := '';
    ADOQuery1.FieldByName('その他').AsString := '';

end;

procedure TfrmUkeTaihi.ADOQuery1AfterCancel(DataSet: TDataSet);
begin
 FNewNO := '';
end;

procedure TfrmUkeTaihi.ADOQuery1AfterInsert(DataSet: TDataSet);
begin
  ds1.DataSet.FieldByName('編集日').asDatetime := now ;  //送信フラグの手前、手動で更新する
	ds1.DataSet.FieldByName('削除フラグ').asBoolean := False ;

  SetEditEnable( True );  {Version 0.6 #37}

end;

procedure TfrmUkeTaihi.ADOQuery1AfterPost(DataSet: TDataSet);
begin
 FNewNO:='';
end;

procedure TfrmUkeTaihi.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
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

  //分析時期
//  cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('分析時期').asString,0);

  {Version 0.6 #27 : 自PCエントリー番号範囲内のみ編集可}
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    SetEditEnable(
      IsEditRec(DataSet.FieldByName('サンプル番号').asString)  and IsEntryYear
    );

end;

procedure TfrmUkeTaihi.ADOQuery1BeforePost(DataSet: TDataSet);
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

 //



  {初期値の設定}
//  ds1.DataSet.FieldByName('受付年月日').asDateTime := dtUketuke.Date ;
  ds1.DataSet.FieldByName('採取年月日').asDateTime := dtUketuke2.Date ;

  ds1.DataSet.FieldByName('サンプル持込日').asDateTime := DateTimePicker1.Date ;
//  ds1.DataSet.FieldByName('結果配信予定日').asDateTime := DateTimePicker2.Date ;
//  ds1.DataSet.FieldByName('本所受付日').asDateTime := DateTimePicker3.Date ;
  ds1.DataSet.FieldByName('センター受付日').asDateTime := DateTimePicker4.Date ;


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

procedure TfrmUkeTaihi.ADOTable1AfterCancel(DataSet: TDataSet);
begin
  FNewNO := '';     //Post,Cancelした後はクリア {Version 0.6 #38}
end;

procedure TfrmUkeTaihi.ADOTable1AfterInsert(DataSet: TDataSet);
begin
  ds1.DataSet.FieldByName('編集日').asDatetime := now ;  //送信フラグの手前、手動で更新する
	ds1.DataSet.FieldByName('削除フラグ').asBoolean := False ;

  SetEditEnable( True );  {Version 0.6 #37}

end;

procedure TfrmUkeTaihi.ADOTable1AfterPost(DataSet: TDataSet);
begin
  FNewNO:=''; //Post,Cancelした後はクリア

end;

procedure TfrmUkeTaihi.ADOTable1AfterScroll(DataSet: TDataSet);
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

  //分析時期
//  cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('分析時期').asString,0);

  {Version 0.6 #27 : 自PCエントリー番号範囲内のみ編集可}
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    SetEditEnable(
      IsEditRec(DataSet.FieldByName('サンプル番号').asString)  and IsEntryYear
    );

end;

procedure TfrmUkeTaihi.ADOTable1BeforePost(DataSet: TDataSet);
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

 //



  {初期値の設定}
//  ds1.DataSet.FieldByName('受付年月日').asDateTime := dtUketuke.Date ;
  ds1.DataSet.FieldByName('採取年月日').asDateTime := dtUketuke2.Date ;

  ds1.DataSet.FieldByName('サンプル持込日').asDateTime := DateTimePicker1.Date ;
//  ds1.DataSet.FieldByName('結果配信予定日').asDateTime := DateTimePicker2.Date ;
//  ds1.DataSet.FieldByName('本所受付日').asDateTime := DateTimePicker3.Date ;
  ds1.DataSet.FieldByName('センター受付日').asDateTime := DateTimePicker4.Date ;


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

procedure TfrmUkeTaihi.BtKingakuClick(Sender: TObject);
var
stmp : String;
skubun : String;
skoumoku : String;
itmp : Integer;
begin
  //金額セット
  skubun := QNouka.FieldByName('区分').asString;
  if skubun <> '' then begin

     skoumoku := '堆肥';

     QKingaku.Close;
     stmp := 'select 区別,'+skoumoku+' 金額 from M_KINGAKU where 区別 = "'+skubun+'"';
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

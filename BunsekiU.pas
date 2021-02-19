unit BunsekiU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, ComCtrls, DBCtrls, Db, StdCtrls,
  Buttons, ADODB,SHojouU, Menus,Clipbrd,UMasSel,UBunInput,UBunDel,UCsvOut,
  plChgCompo, Vcl.Mask;

type

  TMyDBGrid = class(TDBGrid)
  protected
    procedure DrawCell(ACol: Integer; ARow: Integer; ARect: TRect; AState: TGridDrawState); override;
  end;


  TfrmBunseki = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    ds1: TDataSource;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    EMode: TEdit;
    ADODojyouaaaa: TADOQuery;
    ADODoseiaaaa: TADOQuery;
    ADOSakuSyuruiaaaaa: TADOQuery;
    PopupMenu1: TPopupMenu;
    D1: TMenuItem;
    V1: TMenuItem;
    ADOSakumotu: TADOQuery;
    A1: TMenuItem;
    ADOKOURYO: TADOTable;
    ADOUMU: TADOTable;
    ADODokaizai1: TADOQuery;
    ADODokaizai2: TADOQuery;
    ADODokaizai3: TADOQuery;
    ADODokaizai4: TADOQuery;
    ADONouka: TADOTable;
    ADOSakumoku: TADOTable;
    ADOSakuSyurui: TADOTable;
    ADODojyou: TADOTable;
    ADODosei: TADOTable;
    Label3: TLabel;
    Label4: TLabel;
    BtSiborikomi: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    EIdou: TEdit;
    BitBtn6: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    ADOSakugata: TADOQuery;
    DBGrid2: TDBGrid;
    A2: TMenuItem;
    ADOJICHIKAI: TADOTable;
    ADOCity: TADOTable;
    EUketukeNo: TEdit;
    ADOQuery1: TADOQuery;
    ADOQuery1試料NO: TWideStringField;
    ADOQuery1受付NO: TWideStringField;
    ADOQuery1依頼者氏名: TWideStringField;
    ADOQuery1採取場所: TWideStringField;
    ADOQuery1作物コード: TWideStringField;
    ADOQuery1作物名: TWideStringField;
    ADOQuery1pH: TFloatField;
    ADOQuery1EC: TFloatField;
    ADOQuery1トルオーグP: TFloatField;
    ADOQuery1ブレイP: TFloatField;
    ADOQuery1CaO: TFloatField;
    ADOQuery1MgO: TFloatField;
    ADOQuery1K2O: TFloatField;
    ADOQuery1CEC: TFloatField;
    ADOQuery1腐植: TFloatField;
    ADOQuery1アンモニア態N: TFloatField;
    ADOQuery1可給態N: TFloatField;
    ADOQuery1熱抽出N: TFloatField;
    ADOQuery1硝酸態N: TFloatField;
    ADOQuery1ケイ酸: TFloatField;
    ADOQuery1鉄: TFloatField;
    ADOQuery1リン吸: TFloatField;
    ADOQuery1亜鉛: TFloatField;
    ADOQuery1銅: TFloatField;
    ADOQuery1マンガン: TFloatField;
    ADOQuery1ホウ素: TFloatField;
    ADOQuery1ニッケル: TFloatField;
    ADOQuery1pHKCL: TFloatField;
    ADOQuery1Y1: TFloatField;
    ADOQuery1備考: TWideStringField;
    ADOQuery1容量3: TFloatField;
    ADOQuery1Mg3: TFloatField;
    ADOQuery1K3: TFloatField;
    ADOQuery1P3: TFloatField;
    ADOQuery1N3: TFloatField;
    ADOQuery1肥料名3: TWideStringField;
    ADOQuery1容量2: TFloatField;
    ADOQuery1Mg2: TFloatField;
    ADOQuery1K2: TFloatField;
    ADOQuery1P2: TFloatField;
    ADOQuery1N2: TFloatField;
    ADOQuery1肥料名2: TWideStringField;
    ADOQuery1容量1: TFloatField;
    ADOQuery1Mg1: TFloatField;
    ADOQuery1K1: TFloatField;
    ADOQuery1P1: TFloatField;
    ADOQuery1N1: TFloatField;
    ADOQuery1肥料名1: TWideStringField;
    ADOQuery1作型コード: TWideStringField;
    ADOQuery1作型名: TWideStringField;
    btnClose: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn5: TBitBtn;
    Label13: TLabel;
    Button1: TButton;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    procedure btnClose1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1AfterEdit(DataSet: TDataSet);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ds1UpdateData(Sender: TObject);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure D1Click(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure A1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ADOTable1AfterScroll(DataSet: TDataSet);
    procedure A2Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn51Click(Sender: TObject);
    procedure BitBtn8Click1(Sender: TObject);
    procedure BitBtn91Click(Sender: TObject);
    procedure ADOTable1BeforeInsert(DataSet: TDataSet);
    procedure ADOQuery1BeforeInsert(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private 宣言 }
    UpFlg : boolean;
    Colcount : integer;

    plDBGrid1 :  TMyDBGrid;
    plDBGrid2 :  TMyDBGrid;
  public
    { Public 宣言 }
    FStartKey: String;
    FStartBM: TBookMarkStr;

    Procedure RangeSel;
  end;

var
  frmBunseki: TfrmBunseki;

implementation

uses DMU;

{$R *.DFM}


procedure TfrmBunseki.FormCreate(Sender: TObject);
begin


  // Color := BackColor ;

  Label1.Caption := '表示' + #13#10 + '開始列:';
  Label5.Caption := '[enter]キーによる' + #13#10 + '移動方向：';

  // フォーム作成時にコンポーネントの入れ替え
  plDBGrid1 := TMyDBGrid(ChangeComponent(DBGrid1, TMyDBGrid));
  plDBGrid2 := TMyDBGrid(ChangeComponent(DBGrid2, TMyDBGrid));

end;

procedure TfrmBunseki.FormClose(Sender: TObject; var Action: TCloseAction);
var
i : Integer;
stmp : String;
begin


     //項目の並び保存
     stmp := AppPath + '\Bunkou.dat';
     //DBGrid1.Columns.SaveToFile(ExtractFilePath(ParamStr(0)) + 'col.dat');
     DBGrid1.Columns.SaveToFile(stmp);


       {
       i := DBGrid1.Columns.Count;



       for i := 1 to DBGrid1.Columns.Count - 1 do begin

          stmp := 'NO'+InttoStr(i);
          if EMode.Text = '1' then begin
             BunkouIni.WriteString('Data',stmp,DBGrid1.Columns.Items[i].FieldName);
          end
          else if EMode.Text = '2' then begin
             BunkouIni2.WriteString('Data',stmp,DBGrid1.Columns.Items[i].FieldName);
          end
          else if EMode.Text = '3' then begin
             BunkouIni3.WriteString('Data',stmp,DBGrid1.Columns.Items[i].FieldName);
          end
          else begin
             BunkouIni.WriteString('Data',stmp,DBGrid1.Columns.Items[i].FieldName);
          end;

       end;
}

	if ADOQuery1.State in  [dsEdit	,dsInsert] then
		ds1.DataSet.Post;
	//ds1.DataSet.Refresh;



{
  if UPFlg = True then begin
      if Application.MessageBox('変更内容を保存しますか？','確認',MB_YESNO) = ID_NO then begin
	       ADOTable1.Close;
         //データベースを閉じる
         DataModule1.ADOConnection1.Close;


         //もとのデータをコピー
         CopyFile(PChar(TempPath+'nkpsoil.mdb'),PChar(DataPath+'nkpsoil.mdb'),false);

      end;
  end;
}



	ADOQuery1.Close;


  Systemini.WriteString( 'BUNSEKI','FIELD',EIdou.Text );
  Systemini.WriteInteger( 'BUNSEKI','HOUKOU',ComboBox1.ItemIndex );


end;

procedure TfrmBunseki.A1Click(Sender: TObject);
begin
//選択したものすべて削除

DBGrid1.SelectedRows.Delete;
UPFlg := true;



end;

procedure TfrmBunseki.A2Click(Sender: TObject);
var
st : Boolean;
begin
//複数行　削除

  Application.CreateForm(TFBunDel, FBunDel);
  FBunDel.ShowModal ;
  st := FBunDel.UPFlg;
  FBunDel.Release ;


  if st = True then begin

     UPFlg := st;
     //分析一覧の表示しなおし

      ADOQuery1.Close;
    ADOQuery1.SQL.Text := 'select * from T_BUNSEKI6 order by 試料NO';

      ADOQuery1.Open;

  end;






end;

procedure TfrmBunseki.ADOQuery1BeforeInsert(DataSet: TDataSet);
begin


ADOQuery1.Cancel;
end;

procedure TfrmBunseki.ADOTable1AfterScroll(DataSet: TDataSet);
begin

//スクロールバーをなくす
//ShowScrollBar(DBGrid2.Handle, SB_VERT, False);
//ShowScrollBar(DBGrid2.Handle, SB_HORZ, False);


end;

procedure TfrmBunseki.ADOTable1BeforeInsert(DataSet: TDataSet);
begin

ADOQuery1.Cancel;

end;

procedure TfrmBunseki.Button1Click(Sender: TObject);
begin
  if Edit1.Text <> '' then begin
  	ADOQuery1.Locate('試料NO',Edit1.Text,[]);
  end;

end;

procedure TfrmBunseki.BitBtn2Click(Sender: TObject);
var
ssample : string;
ssamplein : string;
tantou : String;
itmp : integer;
sno : integer;
count : integer;
hakono : integer;
i : integer;

begin



    if ADOQuery1.Filtered = True then begin
       ADOQuery1.Cancel;

       ShowMessage('新規入力は、絞り込みを解除して下さい。');

       exit;
    end;


  //複数行入力

     Application.CreateForm(TFBunInput, FBunInput);
     FBunInput.ShowModal ;


     if FBunInput.Tag <> 0 then begin

       sno := StrToIntDef(FBunInput.Esample.Text, 0);//trtoint(FBunInput.Esample.Text);
       count := sno + StrToIntDef(FBunInput.spKazu.Text, 0);
       hakono := StrToIntDef(FBunInput.spHako.Text, 0);
       tantou := FBunInput.ETantou.Text;

       for i := sno to count - 1 do begin

         ADOQuery1.Last;
         ssample := FormatFloat('0000',i);

         if ADOQuery1.Locate('サンプル番号',ssample,[]) then begin
           showmessage('指定されたサンプルが既に存在する為、処理を途中で終了します。');
           break;
         end;

         ADOQuery1.Append;
         ADOQuery1.Edit;
         ADOQuery1.FieldByName('サンプル番号').asString := ssample;
         ADOQuery1.FieldByName('分析番号').asInteger := hakono;
         ADOQuery1.FieldByName('担当者').asString := tantou;

       end;

     end;

     FBunInput.Release ;

end;

procedure TfrmBunseki.BitBtn3Click(Sender: TObject);
var
stmp : String;
begin

  //一度最後のフィールドにする。それから移動すると一番最初に指定フィールドがくる。
//  DBGrid1.SelectedIndex :=  DBGrid1.FieldCount;
//  DBGrid1.SelectedField :=  ADOTable1.FieldByName('サンプル番号');

  stmp := DBGrid1.Columns.Items[0].FieldName;
  DBGrid1.SelectedIndex :=  DBGrid1.FieldCount;
  DBGrid1.SelectedField :=  ADOQuery1.FieldByName(stmp);


end;

procedure TfrmBunseki.BitBtn4Click(Sender: TObject);
begin

  //一度最後のフィールドにする。それから移動すると一番最初に指定フィールドがくる。
  DBGrid1.SelectedIndex :=  DBGrid1.FieldCount;
  DBGrid1.SelectedField :=  ADOQuery1.FieldByName('pH');



end;

procedure TfrmBunseki.BitBtn51Click(Sender: TObject);
begin

//登録

 	if ADOQuery1.State in  [dsEdit	,dsInsert] then
		ds1.DataSet.Post;




end;

procedure TfrmBunseki.BitBtn6Click(Sender: TObject);
begin

  if EIdou.Text = '' then begin
    showmessage('フィールド名を入力してください。');
    exit;
  end;

  //一度最後のフィールドにする。それから移動すると一番最初に指定フィールドがくる。
  DBGrid1.SelectedIndex :=  DBGrid1.FieldCount;

  try
    DBGrid1.SelectedField :=  ADOQuery1.FieldByName(EIdou.Text);
//  finally
  except
   showmessage( '指定されたフィールド名は、ありません。' );
  end;



end;

procedure TfrmBunseki.BitBtn8Click1(Sender: TObject);
begin
//データ出力
  Application.CreateForm(TFCsvOut, FCsvOut);
  FCsvOut.Mode := '受付';
  FCsvOut.ShowModal ;
  FCsvOut.Release ;

end;

procedure TfrmBunseki.BitBtn91Click(Sender: TObject);
var
stmp : String;
begin

	  if Application.MessageBox ('現在の状態をデフォルトに保存します。よろしいですか？','確認', MB_YESNO ) = ID_YES then begin

    //項目の並び保存
     stmp := AppPath + '\BunkouDEF.dat';
     //DBGrid1.Columns.SaveToFile(ExtractFilePath(ParamStr(0)) + 'col.dat');
     DBGrid1.Columns.SaveToFile(stmp);

     ShowMessage('保存しました。');
    end;
end;

procedure TfrmBunseki.btnClose1Click(Sender: TObject);
begin
	Close;
end;

procedure TfrmBunseki.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if (Key in [VK_RETURN] ) then  Button1Click(self);

end;

procedure TfrmBunseki.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
stmp,stmp2 : String;
begin

  //セル上でキーが押された
  if Key in [VK_F5] then begin

{
    if DBGrid1.SelectedField.FieldName = '受付年月日' then begin
      //本日の日付を入力
      stmp :=  FormatDateTime('yyyy"/"m"/"d',Now);
      ADOTable1.Edit;
      ADOTable1.FieldByName('受付年月日').asString := stmp;

    end;



}


    if (DBGrid1.SelectedField.FieldName = '作物コード')
       or (DBGrid1.SelectedField.FieldName = '作物名') then begin
      //作物の選択
        Application.CreateForm(TFMasSel, FMasSel);
        FMasSel.Mode := '作物';
        FMasSel.SakuCD := ADOQuery1.FieldByName('作物コード').asString;
        FMasSel.ShowModal ;
        stmp := FMasSel.SAns;
        FMasSel.Release ;
        if stmp <> '' then begin
          ADOQuery1.Edit;
          ADOQuery1.FieldByName('作物コード').asString := stmp;
          ADOQuery1.FieldByName('作物名').asString := FMasSel.SAns2;
        end;
    end;


     if (DBGrid1.SelectedField.FieldName = '作型コード')
       or (DBGrid1.SelectedField.FieldName = '作型名') then begin

      if (ADOQuery1.FieldByName('作物コード').asString <> '') then begin

        Application.CreateForm(TFMasSel, FMasSel);
        FMasSel.Mode := '作型';
        FMasSel.SakuCD := ADOQuery1.FieldByName('作物コード').asString;
        FMasSel.SakuCD2 := ADOQuery1.FieldByName('作型コード').asString;
        FMasSel.ShowModal ;
        stmp := FMasSel.SAns;
        if stmp <> '' then begin
          ADOQuery1.Edit;
          ADOQuery1.FieldByName('作型コード').asString := stmp;
          ADOQuery1.FieldByName('作型名').asString := FMasSel.SAns2;
        end;
        FMasSel.Release ;

      end;
    end;





    if (DBGrid1.SelectedField.FieldName = '土壌コード')
       or (DBGrid1.SelectedField.FieldName = '土壌名') then begin
      //土壌の選択
      Application.CreateForm(TFMasSel, FMasSel);
      FMasSel.Mode := '土壌';
      FMasSel.ShowModal ;
      stmp := FMasSel.SAns;
      FMasSel.Release ;
      if stmp <> '' then begin
        ADOQuery1.Edit;
        ADOQuery1.FieldByName('土壌コード').asString := stmp;
      end;
    end;





    //コンボの表示を更新するためにレコードを移動
    //一番上の場合の処理を追加する。
    ADOQuery1.Prior;
    ADOQuery1.Next;

{
    ADOTable2.Filter := '[作物名] like ''シ%''';
   ADOTable2.Filtered := true;
}

  end;


  //上のセルをコピー
  if Key in [VK_F8] then begin

     if ADOQuery1.RecNo <> 1 then begin

       if (DBGrid1.SelectedField.FieldName = '作物コード')
         or (DBGrid1.SelectedField.FieldName = '作物名') then begin
         ADOQuery1.Prior;
         stmp := ADOQuery1.FieldByName('作物コード').asString;
         stmp2 := ADOQuery1.FieldByName('作物名').asString;
         ADOQuery1.Next;
         ADOQuery1.Edit;
         ADOQuery1.FieldByName('作物コード').asString := stmp;
         ADOQuery1.FieldByName('作物名').asString := stmp2;
       end
       else begin
         stmp := DBGrid1.SelectedField.FieldName;
         ADOQuery1.Prior;
         stmp2 := ADOQuery1.FieldByName(stmp).asString;
         ADOQuery1.Next;
         ADOQuery1.Edit;
         ADOQuery1.FieldByName(stmp).asString := stmp2;
       end;


     end;
  end;




  //
	if not (Key in [VK_RETURN] ) then exit;

  //リターンキーでセルの移動
  if ComboBox1.ItemIndex = 0 then begin //→
  	//右端なら改行
// 09.12.04 削除   if (DBGrid1.SelectedIndex+1) >= DBGrid1.Columns.Count then begin
//    	ADOQuery1.Next ;
//    	DBGrid1.SelectedIndex := 1 ;
//    end else
  		DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1 ;
  end else begin  //↓
    //最下行なら戻る
//09.12.04 削除  	if ADOQuery1.Eof then begin
//    	ADOQuery1.First ;
//    	DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1 ;
//    end else
    	ADOQuery1.Next ;
  end;
  Key := 0 ;


end;

procedure TfrmBunseki.DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
stmp,stmp2 : String;
begin

  //セル上でキーが押された
  if Key in [VK_F5] then begin



    if (DBGrid2.SelectedField.FieldName = '農家番号')
       or (DBGrid2.SelectedField.FieldName = '農家名') then begin
      //農家の選択
      Application.CreateForm(TFMasSel, FMasSel);
      FMasSel.Mode := '農家';
      FMasSel.ShowModal ;
      stmp := FMasSel.SAns;
      FMasSel.Release ;
      if stmp <> '' then begin
        ADONouka.Close;
        ADONouka.Open;

        ADOQuery1.Edit;
        ADOQuery1.FieldByName('農家番号').asString := stmp;


      end;

    end;

  end;


  //上のセルをコピー
  if Key in [VK_F8] then begin

     if ADOQuery1.RecNo <> 1 then begin

       if (DBGrid2.SelectedField.FieldName = '農家番号')
         or (DBGrid2.SelectedField.FieldName = '農家名') then begin
         ADOQuery1.Prior;
         stmp := ADOQuery1.FieldByName('農家番号').asString;
         ADOQuery1.Next;
         ADOQuery1.Edit;
         ADOQuery1.FieldByName('農家番号').asString := stmp;
       end
       else begin
         stmp := DBGrid2.SelectedField.FieldName;
         ADOQuery1.Prior;
         stmp2 := ADOQuery1.FieldByName(stmp).asString;
         ADOQuery1.Next;
         ADOQuery1.Edit;
         ADOQuery1.FieldByName(stmp).asString := stmp2;
       end;


     end;
  end;




  //
	if not (Key in [VK_RETURN] ) then exit;
  //リターンキーでセルの移動
  if ComboBox1.ItemIndex = 0 then begin //→
  	//右端なら改行
// 09.12.04 削除   if (DBGrid1.SelectedIndex+1) >= DBGrid1.Columns.Count then begin
//    	ADOQuery1.Next ;
//    	DBGrid1.SelectedIndex := 1 ;
//    end else
  		DBGrid2.SelectedIndex := DBGrid2.SelectedIndex + 1 ;
  end else begin  //↓
    //最下行なら戻る
//09.12.04 削除  	if ADOQuery1.Eof then begin
//    	ADOQuery1.First ;
//    	DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1 ;
//    end else
    	ADOQuery1.Next ;
  end;
  Key := 0 ;

end;

procedure TfrmBunseki.ds1DataChange(Sender: TObject; Field: TField);
begin

//UPFlg := true;

end;

procedure TfrmBunseki.ds1UpdateData(Sender: TObject);
var
stmp : String;
begin

UPFlg := true;

   //KCLに値が入っていると施設にする。
{
  if (DBGrid1.SelectedField.FieldName = 'pHKCL') then begin

     stmp := ADOQuery1.FieldByName('pHKCL').asString;
     if stmp <> '' then begin

        ADOQuery1.Edit;
        ADOQuery1.FieldByName('作物種類コード').asString := '3'; //施設にする。

     end;

  end;
}


end;

//丸め処理、小数点２桁
procedure TfrmBunseki.Table1BeforePost(DataSet: TDataSet);
var
	cnt : integer ;
  aBuff : string ;
begin
	//グリッドの２番目以降の入力フィールドの丸め処理
  {
	for cnt := 2 to  DBGrid1.Columns.Count do begin
  	aBuff := DBGrid1.Columns[cnt-1].FieldName;
        if DataSet.FieldByName(aBuff).asString <> '' then begin
	  	DataSet.FieldByName(aBuff).asString := Format('%7.2f',[DataSet.FieldByName(aBuff).asFloat]);
                DataSet.FieldByName('編集日').asDatetime := now ;
        end;
  end;
  }
end;

procedure TfrmBunseki.V1Click(Sender: TObject);

const
Tab = #9;
CR = #13;
LF = #10;
var
aBuff : string;
S, Subs : string;
Cols,
Rows,
Col,
Row,
i : integer;
begin

Col := DBGrid1.SelectedIndex;
//ROw := DBGrid1.SelectedRows;

 aBuff := DBGrid1.Columns[Col].FieldName;
//Col:= DBGrid1.Columns.;
//Row:=ARow;

{Col,Row が負の値のときには0に修正する}
if Col < 0 then Col := 0;
if Row < 0 then Row := 0;

S := Clipboard.AsText;
Rows := 0;
Cols := Col;
Subs := '';
for i := 1 to Length(S) do
case S[i] of
Tab : begin
//  if (Col + Cols < DBGrid1.ColCount) and
//  (Row + Rows < DBGrid1.RowCount) then

  ADOQuery1.Edit;
             ADOQuery1.FieldByName(aBuff).AsString := Subs;
  Col := Col + 1;
  aBuff := DBGrid1.Columns[Col].FieldName;

             //  ADOQuery1.next;   //Inc(Cols);
  Subs := '';
end;
CR : begin
//  if (Col + Cols < StringGrid1.ColCount) and
//  (Row + Rows < StringGrid1.RowCount) then
   ADOQuery1.Edit;
             ADOQuery1.FieldByName(aBuff).AsString := Subs;
//             ADOQuery1.IndexFields[Col].Asfloat := 1;
  ADOQuery1.next;   //Inc(Cols);

//  StringGrid1.Cells[Col + Cols, Row + Rows] := Subs;
  Col := Cols;
  aBuff := DBGrid1.Columns[Col].FieldName;
//  Inc(Rows);
  Subs := '';
end;
LF : ;
else begin
  Subs := Subs + S[i];
end;




end; //for

//SendMessage(GetFocus,WM_PASTE,0,0);
UPFlg := true;

end;

//レコード追加は拒否する {Version 0.6 #45}
procedure TfrmBunseki.Table1AfterInsert(DataSet: TDataSet);
begin
  DataSet.Cancel;
  DataSet.Last;
  DataSet.Refresh;
end;

procedure TfrmBunseki.Table1AfterEdit(DataSet: TDataSet);
begin
//     if JMode = 'Douou' then begin
//       if DataSet.FieldByName('進捗分析終了').AsString = '●' then begin
//          DataSet.Cancel;
//       end;
//     end;
end;

procedure TfrmBunseki.D1Click(Sender: TObject);
begin

 UPFlg := True;
 ds1.DataSet.Delete;


end;

procedure TfrmBunseki.DBGrid1CellClick(Column: TColumn);
Var
  Rtn: Word;
begin
  { Shift の判定 }
  Rtn := GetAsyncKeyState(VK_Shift);
  If (Rtn AND $8000) <> 0 Then
    RangeSel
  Else
  Begin
    FStartBM := Stringof(ADOQuery1.BookMark);
    FStartKey := ADOQuery1.FieldByName('試料NO').AsString; {Key は適当に}
  End;
end;
//複数選択
procedure TfrmBunseki.RangeSel;
Var
  WBM: TBookMarkStr;
  WNext: Boolean;
begin
  With ADOQuery1 Do
  Begin
    WBM := Stringof(BookMark);
    If ADOQuery1.FieldByName('試料NO').AsString < FStartKey Then
      WNext := True
    Else
      WNext := False;
    DisableControls;
    Try
      While True Do
      Begin
        DBGrid1.SelectedRows.CurrentRowSelected := True;
        If (EOF) Or (BOF) Or(Stringof(BookMark) = FStartBM) Then
          Break;
        If WNext Then
          Next
        Else
          Prior;
      End;
      BookMark := BytesOF(WBM);
    Finally
      EnableControls;
    End;
  End;
end;

procedure TfrmBunseki.DBGrid1ColEnter(Sender: TObject);
begin
//	if(DBGrid1.SelectedIndex <= 1) then
//		DBGrid1.SelectedIndex := 1;

end;


procedure TfrmBunseki.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
i,j : integer;
col : integer;
stmp : String;
//itmp : integer;
begin




  if (gdSelected in State) then begin
    // 塗り潰しの色 (TBrush.Color で指定する)
     TMyDBGrid(Sender).Canvas.Brush.Color := clSkyBlue;
    // 描画ルーチンを実行
  end
  else begin
    if (Column.Field.DataSet.RecNo Mod 2) = 0 then begin
      TMyDBGrid(Sender).Canvas.Brush.Color := clMoneyGreen;
    end
    else begin
      TMyDBGrid(Sender).Canvas.Brush.Color := clWindow;
    end;
  end;
  TMyDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);








{
 if  gdSelected in  State then  begin
   DBGrid1.Canvas.Brush.Color := clAqua;
 end
 else begin
   DBGrid1.Canvas.Brush.Color := clWhite;

 end;



   DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
}

  //カラムを固定
  //表示されている一番左のカラム番号を取得
  //with TMyDBGrid(DBGrid1) do begin
  //  col := LeftCol - IndicatorOffset;
  //end;

  //if col < 0  then col := 0;



{
  col := TMyDBGrid(DBGrid1).Leftcol;
  if ColCount <> col  then begin

    ColCount := col;

    for i := 0 to DBGrid1.Columns.Count - 1 do begin
      if DBGrid1.Columns.Items[i].FieldName = 'サンプル番号' then break;
    end;

    //カラムの移動
    DBGrid1.Columns.items[i].Index := col - 1;

  end;
}


end;

procedure TfrmBunseki.FormShow(Sender: TObject);
var
i : Integer;
stmp : String;
begin

 ShowScrollBar(DBGrid2.Handle, SB_VERT, true);




  //データをコピー
  //TempPath
  CopyFile(PChar(DataPath+'nkpsoil.mdb'), PChar(TempPath+'nkpsoil.mdb'), false );


  UPFlg := False;
  Colcount := 0;



 //XXXXXXXXX 分析値
 ADOQuery1.Close;
 //ADOQuery1.Open;
    ADOQuery1.SQL.Text := 'select * from T_BUNSEKI6 order by 試料NO';

  ADOQuery1.Open;



  //iniファイルから読み込み
  EIdou.Text := Systemini.ReadString('BUNSEKI','FIELD', '');
  ComboBox1.ItemIndex := Systemini.ReadInteger('BUNSEKI','HOUKOU', 0);


  //項目リスト読みこみ
  stmp := AppPath + '\Bunkou.dat';

  if FileExists(stmp) then begin

     //復元する
    DBGrid1.Columns.LoadFromFile(stmp);

  end;

  //サンプル番号を常に表示するため選択する。
//  DBGrid1.SelectedIndex :=  DBGrid1.FieldCount;
//  DBGrid1.SelectedField :=  ADOQuery1.FieldByName('サンプル番号');

 //
  if EMode.Text = '6' then begin

    ADOQuery1.Close;
    stmp := 'select * from T_BUNSEKI6 where 受付NO = '''+Euketukeno.Text+'''  order by 試料NO';
    ADOQuery1.SQL.Text := stmp;
    ADOQuery1.open;

  end
  else begin

    ADOQuery1.Close;
    ADOQuery1.SQL.Text := 'select * from T_BUNSEKI6 order by 試料NO';
    ADOQuery1.open;
  end;

  // DBGrid1のタイトル設定
  for i := 0 to DBGrid1.Columns.Count - 1 do begin

    DBGrid1.Columns[i].Title.Alignment := taCenter;
    //DBGrid1.Columns[i].Title.Color := clYellow;
    DBGrid1.Columns[i].Title.Font.Color := clBlack;
    DBGrid1.Columns[i].Title.Font.Size := 12;
  end;
  //DBGrid1.RowHeights[0] := 30;

  // DBGrid2のタイトル設定
  DBGrid2.Columns[0].Title.Alignment := taCenter;
  //DBGrid2.Columns[0].Title.Color := clAqua;
  DBGrid2.Columns[0].Title.Font.Color := clBlack;
  DBGrid2.Columns[0].Title.Font.Size := 12;
  DBGrid2.Columns[1].Title.Alignment := taCenter;
  //DBGrid2.Columns[1].Title.Color := clAqua;
  DBGrid2.Columns[1].Title.Font.Color := clBlack;
  DBGrid2.Columns[1].Title.Font.Size := 12;
  //DBGrid2.RowHeights[0] := 30;
end;

procedure TMyDBGrid.DrawCell(ACol, ARow: Integer; ARect: TRect; AState: TGridDrawState);
var
  LColor    : TColor;
  LRect     : TRect;
  LColumn   : TColumn;
  LColText  : string;
  LFormat   : TTextFormat;
begin
  inherited;


  // ACol = 0 はタイトル行
  // データ ACol は 1 から
  if (ACol >= 1) and (ACol <= Columns.Count) and (ARow = 0) then begin

    RowHeights[0] := 30;

    LColor := clAqua;

    // 背景の塗り潰し
    LRect := ARect;
    Canvas.Brush.Color := LColor;
    Canvas.FillRect(LRect);

    // カラム間の線
    Canvas.Pen.Color := clSilver;
    Canvas.MoveTo(LRect.Left, LRect.Top + 1);
    Canvas.LineTo(LRect.Left, LRect.Bottom - 1);

    // タイトルのキャプションを描画
    // 上の塗り潰しの実行で文字列も塗り潰されている
    LColumn  := Columns[ACol-1];
    LColText := LColumn.Title.Caption;

    // テキスト描画ノアライメントを取得
    case LColumn.Title.Alignment of
      taLeftJustify  : LFormat := [tfLeft];
      taRightJustify : LFormat := [tfRight];
    else
      LFormat := [tfCenter];
    end;

    // テキストを描画
    LFormat := LFormat + [tfVerticalCenter, tfSingleLine];
    Canvas.TextRect(LRect, LColText, LFormat);
  end;
end;
end.

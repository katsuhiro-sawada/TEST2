unit DojouU;

interface
{
  診断テーブルの各種計算メソッド群

  対象＝受付テーブル ＆ SQLCondition
  診断．診断不足量算出   CalcKijun
  診断．土改材算出       CalcDojou
  施肥．肥料算出
  結果＝診断テーブル 算出項目
  クラスを生成して、各メソッド(CalcKijun,CalcDojou)呼び出しのみで、結果を得ることが出来る。
  実際はメーンフォームの診断印刷 Mainform.ActSindanExecute 無い

  画面を表示することにより、対象データの選択を変更出来る。
  呼び出し後、 DspPrnReport( self, TReportType); で結果をプレビューする。
  算出メソッド、プレビュー関数内でプログレスをレコード処理毎に表示することが可能。
    OpenProgress; frmProgress.Scale(一件当たりのスケール/1000);CloseProgress; 

}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, ExtCtrls, Variants,Grids, ADODB;

type TsDokai = (sdP,sdMg,sdpH);
type
  TSindanForm = class(TForm)
    DataSource1: TDataSource;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    btnClose: TBitBtn;
    btnAll: TBitBtn;
    btnCancel: TBitBtn;
    btnPreview: TBitBtn;
    Image2: TImage;
    Image1: TImage;
    EMode : TEdit;
    ADOQuery1: TADOQuery;
    QueryUketuke: TADOQuery;
    QueryKijun: TADOQuery;
    QuerySindan: TADOQuery;
    QueryDokaizai: TADOQuery;
    QAre: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure QuerySindanorgBeforePost(DataSet: TDataSet);
    procedure StringGrid1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function SetKijunRec: Boolean ;
  private
    IsKusa,IsIne,IsKazan : Boolean ;
    typCEC : string ;
    function GetDokaizai(Code, aFieldN: string): double;
    function MakeDokaiVolume(aCode: string; aType: TsDokai; aValue: double;
      var pVolP: double; var pVolMg: double; var pVolpH: double): double;
    function DokaiVolume(aCode: string; aValue: double;
      var pVolP: double; var pVolMg: double; var pVolpH: double): double;
    { Private 宣言 }
  public
    { Public 宣言 }
    FRes : Boolean ;
    procedure MakeSQL;
    procedure MakeSQL2;
    procedure CalcKijun;
    procedure CalcDojou;
    procedure CalcDojouAuto;
  end;

var
  SindanForm: TSindanForm;

implementation

uses DMU, ProgressU, PrnCanvasU;

{$R *.DFM}

procedure TSindanForm.FormCreate(Sender: TObject);
begin
	Color := BackColor ;
end;
procedure TSindanForm.MakeSQL;
begin
      QueryUketuke.SQL.Text := 'Select T_BUNSEKI6.*,M_SAKUMOTU.* '+
        'from T_BUNSEKI6 LEFT OUTER JOIN M_SAKUMOTU '+
   	'ON  (T_BUNSEKI6.作物コード = M_SAKUMOTU.作物コード) '+
        'where ' + SQLCondition ;

        {Version 0.6 #26 削除フラグ追加}
end;
procedure TSindanForm.MakeSQL2;
begin
      QueryUketuke.SQL.Text := 'Select T_UKETUKE.*,M_HOJOU.土壌コード,M_HOJOU.土性コード,M_HOJOU.腐植コード,M_HOJOU.農家番号,M_NOUKA.農家番号,M_NOUKA.集団 '+
        'from T_UKETUKE LEFT OUTER JOIN M_HOJOU '+
   	'ON  (T_UKETUKE.圃場番号 = M_HOJOU.圃場番号) '+
        'from M_HOJOU LEFT OUTER JOIN M_NOUKA '+
   	'ON  (M_HOJOU.農家番号 = M_NOUKA.農家番号) '+
        'where T_UKETUKE.削除フラグ<>True and ' + SQLCondition + SQLCondition2;

        {Version 0.6 #26 削除フラグ追加}
end;
procedure TSindanForm.FormDestroy(Sender: TObject);
begin
  QuerySindan.Close;
  QueryUketuke.Close;
  QueryKijun.Close;

end;
procedure TSindanForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//
end;
{
  1.1 基準不足算出
}
procedure TSindanForm.CalcKijun;
function CalcMg : double ;   //Mg不足量算出処理
var
  Youseki : double ;
begin
  //容積重の判定
  Youseki := PrintModule1.ADOQueryUketuke.FieldByName('容積重').asFloat ;
  if Youseki = 0 then   //分析値なしで火山性土の場合７０
    if IsKazan then Youseki := 70
    else Youseki := 100;

  //Mg不足量＝（Mg目標値－Mg分析値）容積重／１００
  // H170601 目標値から下限に変更
  result := ( PrintModule1.ADOQueryKijun.FieldByName('苦土'+typCEC+'目標').asFloat - PrintModule1.ADOQueryUketuke.FieldByName('MgO').asFloat )
            * Youseki / 100 ;
//  result := ( QueryKijun.FieldByName('苦土'+typCEC+'下限').asFloat - QueryUketuke.FieldByName('MgO').asFloat )
//            * Youseki / 100 ;
  if result < 0 then result := 0 ;
end;


function CalcP : double ;   //P不足量算出処理
var
  Youseki,ValueP,coeP,Rin : double ;
  Dositu,PKeisu : integer ;  //土質（土壌コード１０の位＋土性コード）
  sakucd : String;
begin
  //容積重の判定
  Youseki := PrintModule1.ADOQueryUketuke.FieldByName('容積重').asFloat ;
  sakucd :=  PrintModule1.ADOQueryUketuke.FieldByName('作目コード').asString;
  if Youseki = 0 then   //分析値なしで火山性土の場合７０
    if IsKazan then Youseki := 70
    else Youseki := 100;

  if IsIne then begin
    ValueP := PrintModule1.ADOQueryUketuke.FieldByName('ブレイP').asFloat;
    //H171120
    if (PrintModule1.ADOQueryUketuke.FieldByName('作物コード').asString = '04') or
       (PrintModule1.ADOQueryUketuke.FieldByName('作物コード').asString = '05') or
       (PrintModule1.ADOQueryUketuke.FieldByName('作物コード').asString = '06')
       then begin
      ValueP := PrintModule1.ADOQueryUketuke.FieldByName('トルオーグP').asFloat ;
    end;


  end
  else if sakucd = '6' then begin
    ValueP := PrintModule1.ADOQueryUketuke.FieldByName('ブレイP').asFloat;
  end
  else begin
    ValueP := PrintModule1.ADOQueryUketuke.FieldByName('トルオーグP').asFloat ;
  end;


  with PrintModule1.ADOQueryUketuke do begin
    Dositu := (StrtoIntDef(FieldByName('M_HOJOU.土壌コード').asString,0)div 10)*10 + StrtoIntdef(FieldByName('M_HOJOU.土性コード').asString,0);

    coeP := Rinsankeisuu( Dositu, FieldByName('リン吸').asFloat);
 end;
(*
  //リン酸吸倍率 表２ リン酸吸収係数×土壌＋土性 のリン酸倍率表
  coeP := 0;
  with QueryUketuke do begin
    Dositu := (StrtoIntDef(FieldByName('土壌コード').asString,0)div 10)*10 + StrtoIntdef(FieldByName('土性コード').asString,0);
//    if FieldByName('リン吸').isnull then PKeisu := 0
    if (FieldByName('リン吸').asFloat > 0 )and( FieldByName('リン吸').asFloat <= 700 ) then PKeisu := 1
    else if (FieldByName('リン吸').asFloat > 700 )and( FieldByName('リン吸').asFloat <= 1500 ) then PKeisu := 2
    else if (FieldByName('リン吸').asFloat > 1500 )and( FieldByName('リン吸').asFloat <= 2000 ) then PKeisu := 3
    else PKeisu := 1;
//    else PKeisu := 0;
  end;
  case Dositu of
  11..12:  //低地土＋S,SL
    case PKeisu of  //リン吸係数
    0: coeP := 1.0; 1: coeP := 2.0;  2: coeP := 2.5;  3: coeP := 3.0;  4: coeP := 3.5;
    end;
  13..17:  //低地土＋L,CL,C,腐植,泥炭
    case PKeisu of  //リン吸係数
    0: coeP := 1.0;1: coeP := 2.5;  2: coeP := 3.0;  3: coeP := 3.5;  4: coeP := 4.0;
    end;
  20..29:  //泥炭土
    case PKeisu of  //リン吸係数
    0: coeP := 1.0;1: coeP := 3.0;  2: coeP := 3.5;  3: coeP := 4.0;  4: coeP := 4.5;
    end;
  31..32:  //火山土＋S,SL
    case PKeisu of  //リン吸係数
    0: coeP := 1.0;1: coeP := 3.5;  2: coeP := 4.0;  3: coeP := 4.5;  4: coeP := 5.0;
    end;
  33..37:  //火山土＋L,CL,C,腐植,泥炭
    case PKeisu of  //リン吸係数
    0: coeP := 1.0;1: coeP := 4.5;  2: coeP := 5.0;  3: coeP := 5.5;  4: coeP := 6.0;
    end;
  41..42:  //台地土＋S,SL
    case PKeisu of  //リン吸係数
    0: coeP := 1.0;1: coeP := 2.5;  2: coeP := 3.0;  3: coeP := 3.5;  4: coeP := 4.0;
    end;
  43..47:  //台地土＋L,CL,C,腐植,泥炭
    case PKeisu of  //リン吸係数
    0: coeP := 1.0;1: coeP := 3.0;  2: coeP := 3.5;  3: coeP := 4.0;  4: coeP := 4.5;
    end;
  end;
*)


  //P不足量＝（P目標値－P分析値）* P吸倍率 * 容積重／１００
  result := ( PrintModule1.ADOQueryKijun.FieldByName('リン酸'+typCEC+'目標').asFloat - ValueP )
            * coeP * Youseki / 100 ;

//  result := ( QueryKijun.FieldByName('リン酸'+typCEC+'下限').asFloat - ValueP )
//            * coeP * Youseki / 100 ;
  if result < 0 then result := 0 ;
end;

function CalcPh: double ;      //Ph補正、Ph不足量
var
  alenius : double ;
begin
  with PrintModule1.ADOQueryUketuke do begin
    //アレニウス量
    alenius := cstAlenius[StrtoIntDef(FieldByName('M_HOJOU.腐植コード').asString,1)][StrtoIntDef(FieldByName('M_HOJOU.土性コード').asString,1)] * 10 ;
    if IsKazan then alenius := alenius * 0.7 ;
    result := alenius ;
//    if (FieldByName('EC').asFloat > 0.2 ) and (FieldByName('EC').asFloat <= 1.0  ) then
      //不足量＝pH分析値＋EC
//      result := FieldByName('pH').asFloat + FieldByName('EC').asFloat
//    else
//    if FieldByName('EC').asFloat > 1.0 then result := 9.8 ;
  end;
end;
function CalcPh2( hph : Double; var id : double ): double ;      //Ph補正、Ph不足量
var
  alenius : double ;
  kou : String;
  stmp : String;
  dosei : String;
  fusyoku : String;
begin
  with QueryUketuke do begin
    //アレニウス量
    QAre.Close;
    QAre.SQL.Clear;
    QAre.SQL.Add('select * from M_アレニウス.DB');
    QAre.Open;

    hph := hph * 1.000 + 0.00001;


    if hph < 4.0 then begin
        result := 0;
        id := 4.0;
        exit;
    end;
    if hph >= 6.5 then begin
        result := 0;
        id := 6.5;
        exit;
    end;


    if 4.2 > hph then begin
       kou := 'pH40';
       id := 4.0;

    end
    else if 4.4 > hph then begin
       kou := 'pH42';
       id := 4.2;
    end
    else if 4.6 > hph then begin
       kou := 'pH44';
       id := 4.4;
    end
    else if 4.8 > hph then begin
       kou := 'pH46';
       id := 4.6;
    end
    else if 5.0 > hph then begin
       kou := 'pH48';
       id := 4.8;
    end
    else if 5.2 > hph then begin
       kou := 'pH50';
       id := 5.0;
    end
    else if 5.4 > hph then begin
       kou := 'pH52';
       id := 5.2;
    end
    else if 5.6 > hph then begin
       kou := 'pH54';
       id := 5.4;
    end
    else if 5.800 > hph then begin
       kou := 'pH56';
       id := 5.6;
    end
    else if 6.000 > hph then begin
       kou := 'pH58';
       id := 5.8;
    end
    else if 6.2 > hph then begin
       kou := 'pH60';
       id := 6.0;
    end
    else if 6.4 > hph then begin
       kou := 'pH62';
       id := 6.2;
    end
    else  begin
       kou := 'pH64';
       id := 6.4;
    end;



    dosei := FieldByName('土性コード').asString;
    fusyoku := FieldByName('腐植コード').asString;


	//腐植仕様 腐植値がなし:０,あり:０～２以下,含む:２～５以下,富む:５～１０以下,頗る富む:１０～２０以下,腐植土:２０～
        if FieldByName('腐植').isNull then fusyoku := FieldByName('腐植コード').asString
        else
        if FieldByName('腐植').asFloat = 0 then  fusyoku := FieldByName('腐植コード').asString
        else
        if (FieldByName('腐植').asFloat > 0 ) and (FieldByName('腐植').asFloat <= 2) then  fusyoku := '1' //'あり'
        else
        if (FieldByName('腐植').asFloat > 2 ) and (FieldByName('腐植').asFloat <= 5) then  fusyoku := '1'
        else
        if (FieldByName('腐植').asFloat > 5 ) and (FieldByName('腐植').asFloat <= 10) then fusyoku := '2'
        else
        if (FieldByName('腐植').asFloat > 10 ) and (FieldByName('腐植').asFloat <= 20) then fusyoku := '3'
        else                                                                           fusyoku := '3';





    alenius := 0;
    alenius := 0;
    //泥炭の場合　腐植土  H171120
    if dosei = '7' then begin
         dosei := '6';
    end;
    if dosei = '6' then fusyoku := '1';


    if QAre.locate('土性コード;腐植',VarArrayOf([dosei,fusyoku]),[] ) then begin
                 alenius := QAre.FieldByName(kou).asFloat;
    end
    else begin
              alenius := 0;
    end;


    QAre.Close;

    result := alenius ;
  end;
end;
var
   moku, hph, btmp : double;
   hph2,hph3,hph4 : double;
   moku2,moku3,moku4 : double;
   id1, id2 : double;
   //   stmp : String;
begin


//  QueryUketuke.SQL.Text := 'Select T_UKETUKE.*,M_HOJOU.土壌コード,M_HOJOU.土性コード,M_HOJOU.腐植コード '+
//    'from T_UKETUKE INNER JOIN M_HOJOU '+
 //  	'ON  (T_UKETUKE.圃場番号 = M_HOJOU.圃場番号) where T_UKETUKE.削除フラグ<>True and  サンプル番号 = '''+PrintModule1.QueryUketuke.FieldByName('サンプル番号').asString + '''';
//  SQLCondition := 'サンプル番号 = '''+PrintModule1.QueryUketuke.FieldByName('サンプル番号').asString + '''';
//  MakeSQL;
//  QueryUketuke.Open;



//  QuerySindan.Open;

///////////////////////////////////////////////////////////////
//  PrintModule1.ADOQueryUketuke　は、開いているものとする。




//  while not QueryUketuke.eof do begin
    if not SetKijunRec then begin
      showmessage('基準値マスタに存在しません。');
//      continue ;
    end;





    with PrintModule1.ADOQuerySindan do  begin
      if RecordCount = 0 then begin
        Append;
        FieldByName('サンプル番号').asString := PrintModule1.ADOQueryUketuke.FieldByName('サンプル番号').asString ;
        FieldByName('編集日').asDateTime := now ; {Version 0.6 #19 }
      end else
        Edit;
      //不足量初期化
      FieldByName('Mg診断不足量').Clear;
      FieldByName('Ph診断不足量').Clear;  //PH不足量
      FieldByName('P診断不足量').Clear ;



      //Mg不足量算出
      FieldByName('Mg診断不足量').asFloat := CalcMg;


      //PH不足量
      if JMode = 'Fuuren' then begin
        //目標値を２種類で計算する。
        if JMode_DokaiSel = 1 then begin
           moku := QueryKijun.FieldByName('pH'+typCEC+'下限').asFloat;
        end
        else begin
           moku := QueryKijun.FieldByName('pH'+typCEC+'上限').asFloat;
        end;

        hph := QueryUketuke.FieldByName('pH').asFloat;
        btmp := QueryUketuke.FieldByName('EC').asFloat;
        if (btmp > 0.20001 ) and (btmp <= 1.0  ) then
          //不足量＝pH分析値＋EC
          hph := QueryUketuke.FieldByName('pH').asFloat + QueryUketuke.FieldByName('EC').asFloat
        else
        if QueryUketuke.FieldByName('EC').asFloat > 1.0 then hph := 9.8 ;


        hph := moku - hph;
        if hph < 0 then hph := 0;
        hph := Calcph * hph;



      end
      else begin
        moku := PrintModule1.ADOQueryKijun.FieldByName('pH'+typCEC+'目標').asFloat;
        hph := PrintModule1.ADOQueryUketuke.FieldByName('pH').asFloat;
        btmp := PrintModule1.ADOQueryUketuke.FieldByName('EC').asFloat;
        if (btmp > 0.20001 ) and (btmp <= 1.0  ) then
          //不足量＝pH分析値＋EC
          hph := PrintModule1.ADOQueryUketuke.FieldByName('pH').asFloat + PrintModule1.ADOQueryUketuke.FieldByName('EC').asFloat
        else
        if PrintModule1.ADOQueryUketuke.FieldByName('EC').asFloat > 1.0 then hph := 9.8 ;


        hph := moku - hph;
        if hph < 0 then hph := 0;
        hph := Calcph * hph;
      end;


      if IsKusa then begin
//        FieldByName('Ph診断不足量').asFloat := CalcPh;  //PH不足量
        FieldByName('Ph診断不足量').asFloat := hph;  //PH不足量
      end else begin
        //P不足量算出
        FieldByName('P診断不足量').asFloat := CalcP;
        if not IsIne then begin
//          FieldByName('Ph診断不足量').asFloat := CalcPh;  //pH補正

          FieldByName('Ph診断不足量').asFloat := hph;  //pH補正
        end;
      end;
      Post;    //自動ポスト
    end;
//    QueryUketuke.Next;
//    Application.ProcessMessages ;
//    if not NextProgress then break;
//  end;
  QuerySindan.Close;
  QueryUketuke.Close;
  QueryKijun.Close;




end;
{
  土改材マスタ取得 指定資材コードのフィールド値
}
function TSindanForm.GetDokaizai(Code,aFieldN : string ) : double ;
begin
  with QueryDokaizai do begin
    SQL.Text := 'Select * from M_DOKAIZAI where コード='''+Code+'''';
    Open;
    result := FieldByName(aFieldN).asFloat ;
//A.Nishimura     result := 1.0;
    Close;
  end;
end;
{
  1.2  土壌診断自動処理計算、対象データ　SQLCondition
  受付T－基準マスタ
  ｜
  診断T－土改材マスタ
  分析値から作成作物別に必要施肥量を算出する
}
procedure TSindanForm.CalcDojou ;
{  ****************************************************************************
 //1-2-3草地土改材算出
}
procedure CalDokai3;
var
  aVolP,aVolMg,aVolpH : double; //関数算出値
  aNesP,aNesMg,aNespH : double ; //必要量
  aNesNo : integer ;
  aCode : string ;
  btmp : double;
  bairitu : double;
  stmp : String;
begin

  //泥炭の場合
  with PrintModule1.ADOQueryUketuke do begin
       stmp := Copy(PrintModule1.ADOQueryUketuke.FieldByName('土壌コード').AsString,1,1);
       if stmp <> '2' then
        bairitu := 1.0 //bairitu := 0.5
       else
        bairitu := 1.0;
  end;


  //計算用不足量を設定
  with PrintModule1.ADOQuerySindan do begin
    aNesP  := FieldByName('P診断不足量').asFloat ;
    aNesMg := FieldByName('Mg診断不足量').asFloat ;
    aNespH := FieldByName('pH診断不足量').asFloat ;
    aNesNo := 1 ; //算出資材番号


    while true do begin
      //⑧全て必要無くなれば計算終了
      if (aNesP <= 0 ) and ( aNesMg <= 0 ) and ( aNespH <= 0 ) then
        break;
      //①全て必要な場合 : Pをようりんで算出
//NISHI0527
{
      if (aNesP > 0)and(aNesMg > 0)and(aNespH > 0) then begin
        aCode := '030';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNespH := aNespH - aVolpH ; //アルカリ分を必要量から減算
        aNesMg := aNesMg - aVolMg ; //苦土分を必要量から減算
        aNesP := 0 ;
      end
}
      //②P,Mgが必要の場合 : Pをダブリンで先に算出
      if (aNesP > 0)and(aNesMg > 0)and(aNespH <= 0) then begin
        aCode := '040';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNesMg := aNesMg - aVolMg ; //苦土分を必要量から減算
        aNesP := 0 ;
      end
      //③P、pHが必要の場合 : pHをタンカル,Pを過石で算出
      else if (aNesP > 0)and(aNespH > 0) then begin
        aCode := '010';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH診断不足量').asFloat * bairitu;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat := btmp;
//        btmp := DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
//        aNesMg := aNesMg - aVolMg ; //苦土分を必要量から減算

        aNespH := 0 ;
      end
      //④Pが必要の場合 : Pを過石で算出
      else if (aNesP > 0) then begin
        aCode := '050';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNesP := 0 ;
      end
      //①,⑤Mg,pHが必要な場合 : pHを苦土炭カルで算出  //1-2-1-1
      else if (aNesMg > 0)and(aNespH > 0) then begin
        aCode := '020';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH診断不足量').asFloat * bairitu;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat := btmp;

        DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
//H150916                MakeDokaiVolume(aCode, sdpH, aNespH, aVolP,aVolMg,aVolpH);
        //土壌改良資材量から成分量



        aNesMg := aNesMg - aVolMg ; //苦土分を必要量から減算
        aNespH := 0 ;
      end
      //③,⑦pHが必要な場合 : pHを炭カルで算出
      else if (aNesMg <= 0)and(aNespH > 0) then begin
        aCode := '010';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat := aNespH * 1.0; //bairitu;
//        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
//                MakeDokaiVolume(aCode, sdpH, aNespH, aVolP,aVolMg,aVolpH);
        aNespH := 0 ;
      end
      //①,②,⑤,⑥Mgのみの必要 : Mgを硫酸苦土で算出
      else if (aNesP <= 0)and(aNesMg > 0)and(aNespH <= 0) then begin
        aCode := '060';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdMg, aNesMg, aVolP,aVolMg,aVolpH);
        aNesMg := 0 ;
      end;
      INC(aNesNo);  //必ずどれか算出されるはず
    end;
 end;
end;
//
//  造成・更新　土壌改良資材算出
//
procedure CalDokai3_2;
var
  aVolP,aVolMg,aVolpH : double; //関数算出値
  aNesP,aNesMg,aNespH : double ; //必要量
  aNesNo : integer ;
  aCode : string ;
  stmp : String;
  btmp : double;
  bairitu : double;
begin

  //泥炭の場合
  with PrintModule1.ADOQueryUketuke do begin
       stmp := Copy(PrintModule1.ADOQueryUketuke.FieldByName('M_HOJOU.土壌コード').AsString,1,1);
       if stmp <> '2' then
        bairitu := 1.0 //1.5
       else
        bairitu := 1.0;
  end;
  //計算用不足量を設定
  with PrintModule1.ADOQuerySindan do begin
    aNesP  := FieldByName('P診断不足量').asFloat ;
    aNesMg := FieldByName('Mg診断不足量').asFloat ;
    aNespH := FieldByName('pH診断不足量').asFloat ;
    aNesNo := 1 ; //算出資材番号


    while true do begin
      //⑧全て必要無くなれば計算終了
      if (aNesP <= 0 ) and ( aNesMg <= 0 ) and ( aNespH <= 0 ) then
        break;
      //①全て必要な場合 : Pをようりんで算出
 //NISHI0527
{
      if (aNesP > 0)and(aNesMg > 0)and(aNespH > 0) then begin
        aCode := '030';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNespH := aNespH - aVolpH ; //アルカリ分を必要量から減算
        aNesMg := aNesMg - aVolMg ; //苦土分を必要量から減算
        aNesP := 0 ;
      end
}
      //②P,Mgが必要の場合 : Pをダブリンで先に算出
      if (aNesP > 0)and(aNesMg > 0)and(aNespH <= 0) then begin
        aCode := '040';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNesMg := aNesMg - aVolMg ; //苦土分を必要量から減算
        aNesP := 0 ;
      end
      //③P、pHが必要の場合 : pHをタンカル,Pを過石で算出
      else if (aNesP > 0)and(aNespH > 0) then begin
        aCode := '010';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH診断不足量').asFloat * bairitu;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat := btmp;
//        btmp := DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
//        aNesMg := aNesMg - aVolMg ; //苦土分を必要量から減算

        aNespH := 0 ;
      end
      //④Pが必要の場合 : Pを過石で算出
      else if (aNesP > 0) then begin
        aCode := '050';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNesP := 0 ;
      end
      //①,⑤Mg,pHが必要な場合 : pHを苦土炭カルで算出  //1-2-1-1
      else if (aNesMg > 0)and(aNespH > 0) then begin
        aCode := '020';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH診断不足量').asFloat * bairitu;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat := btmp;

        DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
//H150916                MakeDokaiVolume(aCode, sdpH, aNespH, aVolP,aVolMg,aVolpH);
        //土壌改良資材量から成分量



        aNesMg := aNesMg - aVolMg ; //苦土分を必要量から減算
        aNespH := 0 ;
      end
      //③,⑦pHが必要な場合 : pHを炭カルで算出
      else if (aNesMg <= 0)and(aNespH > 0) then begin
        aCode := '010';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat := aNespH * bairitu;
//        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
//                MakeDokaiVolume(aCode, sdpH, aNespH, aVolP,aVolMg,aVolpH);
        aNespH := 0 ;
      end
      //①,②,⑤,⑥Mgのみの必要 : Mgを硫酸苦土で算出
      else if (aNesP <= 0)and(aNesMg > 0)and(aNespH <= 0) then begin
        aCode := '060';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdMg, aNesMg, aVolP,aVolMg,aVolpH);
        aNesMg := 0 ;
      end;
      INC(aNesNo);  //必ずどれか算出されるはず
    end;
 end;
end;
//var
//  aCode : string ;
//begin
//  with QuerySindan do begin
//    if FieldByName('pH診断不足量').asFloat <= 0 then exit;
//    if FieldByName('Mg診断不足量').asFloat <= 0 then
//      aCode := '010'
//    else
//      aCode := '020';
//    FieldByName('土改材コード1').asString := aCode;
//    FieldByName('土改材量1').asFloat := FieldByName('pH診断不足量').asFloat;
//  //  / GetDokaizai(aCode,'アルカリ分')*100;
//  end;
  //※Mg不足の程度は考慮しない
//end;
{
   珪カル必要量を算出（土壌から、ケイ酸値から）
}
{  ****************************************************************************
   //1-2-2水田土改材算出
}
procedure CalDokai2;
var
  Mg2 : double ;
  aCode :string ;
begin
  with PrintModule1.ADOQuerySindan do begin
    if PrintModule1.ADOQueryUketuke.FieldByName('ケイ酸').asFloat <= 0 then begin
      //土壌の種類により珪カル必要量を算出
      FieldByName('土改材コード1').asString := '070';
      FieldByName('土改材量1').asFloat := GetKeiCal(PrintModule1.ADOQueryUketuke.FieldByName('土壌コード').asString);
    end else begin
      //ケイ酸値により珪カル必要量を算出
      FieldByName('土改材コード1').asString := '070';
      FieldByName('土改材量1').asFloat := GetKeiCal(PrintModule1.ADOQueryUketuke.FieldByName('ケイ酸').asFloat,QueryUketuke.FieldByName('土壌コード').asString);
    end;

    if FieldByName('Mg診断不足量').asFloat > 0  then begin
      if FieldByName('P診断不足量').asFloat > 0 then begin
        if PrintModule1.ADOQueryUketuke.FieldByName('pH').asFloat < PrintModule1.ADOQueryKijun.FieldByName('pH'+typCEC +'下限').asFloat then begin
          //式d. Mg,P不足&pH分析値＜pH目標値下限
          FieldByName('土改材コード2').asString := '030';
        end else begin
          //式c.
          FieldByName('土改材コード2').asString := '040';
        end;
        //式e. P不足量の算出、Mg不足量の算出
        FieldByName('土改材量2').asFloat := FieldByName('P診断不足量').asFloat /
                                GetDokaizai( FieldByName('土改材コード2').asString,'リン酸') * 100 ;
//        Mg2 := FieldByName('Mg診断不足量').asFloat;

//        Mg2 := FieldByName('土改材量2').asFloat * GetDokaizai( FieldByName('土改材コード2').asString,'苦土') / 100 ;

        Mg2 := FieldByName('Mg診断不足量').asFloat -
                                FieldByName('土改材量2').asFloat * GetDokaizai( FieldByName('土改材コード2').asString,'苦土') / 100 ;


//        Mg2 := FieldByName('土改材量2').asFloat * GetDokaizai( FieldByName('土改材コード2').asString,'苦土') / 100 ;


        if Mg2 > 0 then begin
          aCode := '060' ;
          FieldByName('土改材コード3').asString := aCode;
          FieldByName('土改材量3').asFloat := Mg2 / GetDokaizai( aCode,'苦土') * 100 ;
        end;
      end else begin
        //式b. Mg不足量の算出
        aCode := '060' ;
        FieldByName('土改材コード2').asString := aCode;
        FieldByName('土改材量2').asFloat := FieldByName('Mg診断不足量').asFloat / GetDokaizai( aCode,'苦土') * 100 ;
      end;
    end else begin
      if FieldByName('P診断不足量').asFloat > 0 then begin
        //式a. P不足量の算出
        aCode := '050';
        FieldByName('土改材コード2').asString := aCode;
        FieldByName('土改材量2').asFloat := FieldByName('P診断不足量').asFloat / GetDokaizai( aCode,'リン酸') * 100 ;
      end;
    end;
  end;
end;
//------------------------------------------------------------
//  土壌改良資材　道央　水稲育苗
//
//------------------------------------------------------------
procedure CalDokai2_1;
var
  aVolP,aVolMg,aVolpH : double; //関数算出値
  aNesP,aNesMg,aNespH : double ; //必要量
  aNesNo : integer ;
  aCode : string ;
  btmp : double;

  P : Double;
  CaO : Double;
  MgO : Double;
  SekkaiKudo : Double;
  pH : Double;

  Mg2 : double ;
  btmp2 : double;

  dcode,dscode : String;
  id, ids : Integer;
  //硫黄粉　換算
  // 含む、富む、頗る富む
  const Ro : array [1..7,1..3] of Integer =
  ((155,180,235),   //砂土
   (185,190,250),   //砂壌土
   (175,210,270),   //壌土
   (190,225,290),   //埴壌土
   (225,260,340),   //埴土
   (225,260,340),   //腐植土  基準にないので埴土と同じにしておく　
   (800,800,800));  //泥炭土

//  aCode :string ;
begin

  pH := PrintModule1.ADOQueryUketuke.FieldByName('pH').asFloat;
  if PrintModule1.ADOQueryUketuke.FieldByName('EC').asFloat >= 0.2 then
     pH := pH + PrintModule1.ADOQueryUketuke.FieldByName('EC').asFloat;



  P := PrintModule1.ADOQueryUketuke.FieldByName('トルオーグP').asFloat;
  CaO := PrintModule1.ADOQueryUketuke.FieldByName('CaO').asFloat;
  MgO := PrintModule1.ADOQueryUketuke.FieldByName('MgO').asFloat;

  SekkaiKudo := (CaO / 28.0) / (MgO / 20.2);

    //ここでコメントをいれると駄目　所見描画時に出力
{       if pH >= 6.0 then begin
          //施用なし
          Edit;
          FieldByName('所見施肥').asString := 'この土は、育苗に適さない土です。';
          //Post;

       end;
}
  if pH >= 6.0 then exit;


  with PrintModule1.ADOQuerySindan do begin

    //りん酸の不足は、常に０とする　土壌改良資材でみない
     //aNesP  := FieldByName('P診断不足量').asFloat ;
     aNesP := 0;

    aNesMg := FieldByName('Mg診断不足量').asFloat ;
    aNespH := FieldByName('pH診断不足量').asFloat ;





    aNesNo := 1;
//    if aNespH > 0 then begin
//pH　４．０以下は、タンカルを求められない。
{
       if (pH < 4.0) and (P >= 50.0) and (SekkaiKudo >= 4.1) then begin
           //苦土タンカル施用
        aCode := '020';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH診断不足量').asFloat; // * 10.0 / 1000.0;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat := btmp;

        DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
        //土壌改良資材量から成分量

        aNesMg := aNesMg - aVolMg ; //苦土分を必要量から減算
        aNespH := 0 ;
        INC(aNesNo);
       end
}
       if pH < 4.75 then  begin  // pH < 目標値

           if PrintModule1.ADOQueryUketuke.FieldByName('ケイ酸').asFloat <= 0 then begin
              //土壌の種類により珪カル必要量を算出
              FieldByName('土改材コード'+InttoStr(aNesNo)).asString := '070';
              FieldByName('土改材量'+InttoStr(aNesNo)).asFloat := GetKeiCal(QueryUketuke.FieldByName('土壌コード').asString);
           end else begin
              //ケイ酸値により珪カル必要量を算出
              FieldByName('土改材コード'+InttoStr(aNesNo)).asString := '070';
              FieldByName('土改材量'+InttoStr(aNesNo)).asFloat := GetKeiCal(QueryUketuke.FieldByName('ケイ酸').asFloat,QueryUketuke.FieldByName('土壌コード').asString);
           end;
           INC(aNesNo);
       end
       else if (4.75 < pH) and (pH < 6.0) then begin
    //硫黄粉
       id := 1;
       ids := 1;

       dcode := PrintModule1.ADOQueryUketuke.FieldByName('土性コード').asString;
       if dcode <> '' then id := Strtoint(dcode);
       dscode := PrintModule1.ADOQueryUketuke.FieldByName('腐植コード').asString;
       if dscode <> '' then ids := Strtoint(dscode);

       if id > 7 then id := 7;
       if ids > 3 then ids := 3;


       btmp := (4.75 - 4.5) * Ro[id,ids];
       btmp2 := (pH - 4.5) * Ro[id,ids];
       btmp := (btmp2 - btmp) * 0.92;

       FieldByName('土改材コード'+InttoStr(aNesNo)).asString := '100';
       FieldByName('土改材量'+InttoStr(aNesNo)).asFloat := btmp;
       end;

    //以下　苦土が不足していた場合？



  end;
end;
{  ****************************************************************************
  //1-2-1その他土改材算出
}
procedure CalDokai1;
var
  aVolP,aVolMg,aVolpH : double; //関数算出値
  aNesP,aNesMg,aNespH : double ; //必要量
  aNesNo : integer ;
  aCode : string ;
  btmp : double;
{ 診断不足量の有無で施肥材料が違い、以下の組み合わせによる計算式を処理する
      |    Mg>0     |    Mg=0     |
      | pH>0 | pH=0 | pH>0 | pH=0 |
  P>0 |  ①  |  ②  |  ③  |  ④  |
  P=0 |  ⑤  |  ⑥  |  ⑦  |  ⑧  |
}
begin
  //計算用不足量を設定  //NISHI0527
  with PrintModule1.ADOQuerySindan do begin
    aNesP  := FieldByName('P診断不足量').asFloat ;
    aNesMg := FieldByName('Mg診断不足量').asFloat ;
    aNespH := FieldByName('pH診断不足量').asFloat ;
    aNesNo := 1 ; //算出資材番号
    while true do begin
      //⑧全て必要無くなれば計算終了
      if (aNesP <= 0 ) and ( aNesMg <= 0 ) and ( aNespH <= 0 ) then
        break;
      //①全て必要な場合 : Pをようりんで算出
{
      if (aNesP > 0)and(aNesMg > 0)and(aNespH > 0) then begin
        aCode := '030';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNespH := aNespH - aVolpH ; //アルカリ分を必要量から減算
        aNesMg := aNesMg - aVolMg ; //苦土分を必要量から減算
        aNesP := 0 ;
      end
}
      //②P,Mgが必要の場合 : Pをダブリンで先に算出
      if (aNesP > 0)and(aNesMg > 0)and(aNespH <= 0) then begin
        aCode := '040';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNesMg := aNesMg - aVolMg ; //苦土分を必要量から減算
        aNesP := 0 ;
      end
      //③P、pHが必要の場合 : pHをタンカル,Pを過石で算出
      else if (aNesP > 0)and(aNespH > 0) then begin
        aCode := '010';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH診断不足量').asFloat;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat := btmp;
//        btmp := DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
//        aNesMg := aNesMg - aVolMg ; //苦土分を必要量から減算

        aNespH := 0 ;
      end
      //④Pが必要の場合 : Pを過石で算出
      else if (aNesP > 0) then begin
        aCode := '050';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNesP := 0 ;
      end
      //①,⑤Mg,pHが必要な場合 : pHを苦土炭カルで算出  //1-2-1-1
      else if (aNesMg > 0)and(aNespH > 0) then begin
        aCode := '020';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH診断不足量').asFloat;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat := btmp;

        DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
//H150916                MakeDokaiVolume(aCode, sdpH, aNespH, aVolP,aVolMg,aVolpH);
        //土壌改良資材量から成分量



        aNesMg := aNesMg - aVolMg ; //苦土分を必要量から減算
        aNespH := 0 ;
      end
      //③,⑦pHが必要な場合 : pHを炭カルで算出
      else if (aNesMg <= 0)and(aNespH > 0) then begin
        aCode := '010';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat := aNespH;
//        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
//                MakeDokaiVolume(aCode, sdpH, aNespH, aVolP,aVolMg,aVolpH);
        aNespH := 0 ;
      end
      //①,②,⑤,⑥Mgのみの必要 : Mgを硫酸苦土で算出
      else if (aNesP <= 0)and(aNesMg > 0)and(aNespH <= 0) then begin
        aCode := '060';
        FieldByName('土改材コード'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('土改材量'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdMg, aNesMg, aVolP,aVolMg,aVolpH);
        aNesMg := 0 ;
      end;
      INC(aNesNo);  //必ずどれか算出されるはず
    end;
 end;
end;
   ////NISHI0525 土壌改良資材メイン
   //H171109 育苗床土　土壌改良資材変更
var
  cnt : integer ;
//  stmp : String;
begin


{
  QueryUketuke.SQL.Text := 'Select T_UKETUKE.*,M_HOJOU.土壌コード,M_HOJOU.土性コード,M_HOJOU.腐植コード '+
    'from T_UKETUKE INNER JOIN M_HOJOU '+
   	'ON  (T_UKETUKE.圃場番号 = M_HOJOU.圃場番号) where T_UKETUKE.削除フラグ<>True and  サンプル番号 = '''+PrintModule1.QueryUketuke.FieldByName('サンプル番号').asString + '''';
  QueryUketuke.Open;
  QuerySindan.Open;
}





//診断のサンプル番号をチェック
//   stmp := QueryUketuke.FieldByName('サンプル番号').asString;
//   showMessage( stmp );
//   stmp := QuerySindan.FieldByName('サンプル番号').AsString;
//   showMessage( stmp );

//  while not QueryUketuke.eof do begin
    if not SetKijunRec then begin
      showmessage('基準値マスタに存在しません。');

//      continue ;
    end;
    with PrintModule1.ADOQuerySindan do  begin
      if RecordCount = 0 then begin
        Append;
        FieldByName('サンプル番号').asString := PrintModule1.ADOQueryUketuke.FieldByName('サンプル番号').asString ;
        FieldByName('編集日').asDateTime := now ; {Version 0.6 #19 }
      end else
        Edit;
      //算出項目クリア
      for cnt := 1 to 5 do begin
        FieldByName('土改材コード'+InttoStr(cnt)).Clear ;
        FieldByName('土改材量'+InttoStr(cnt)).Clear ;
      end;
      //土改材算出

      if IsKusa then begin
         if PrintModule1.ADOQueryUketuke.FieldByName('作物コード').AsString <> '01' then
              CalDokai3   //
         else
              CalDokai3_2 //造成・更新の場合
      end
      else if IsIne then begin
         //床土の場合　珪ケルは　算出しない
         if (PrintModule1.ADOQueryUketuke.FieldByName('作物コード').AsString = '04') or
            (PrintModule1.ADOQueryUketuke.FieldByName('作物コード').AsString = '05') or
            (PrintModule1.ADOQueryUketuke.FieldByName('作物コード').AsString = '06')
            then begin
            CalDokai2_1   //水田土改材算出
         end
         else begin
            CalDokai2   //水田土改材算出
         end;
      end
      else begin
         CalDokai1;  //その他土改材算出
      end;

      Post;    //自動ポスト
    end;
//h150909    QueryUketuke.Next;
//    Application.ProcessMessages ;
//    if not NextProgress then break;
//  end;    //while
  QuerySindan.Close;
  QueryUketuke.Close;
  QueryKijun.Close;
//
end; //CalcDojou END
procedure TSindanForm.CalcDojouAuto ;
begin
//
end;
//========================================================================
//  基準値のレコードセット
//========================================================================
function TSindanForm.SetKijunRec: Boolean ;
var
//  aBuff,
  DosituCode : string ;
  dcode : String;
begin
  IsKusa := PrintModule1.ADOQueryUketuke.FieldByName('作目コード').asString = BokusouCode ;
  IsIne := PrintModule1.ADOQueryUketuke.FieldByName('作目コード').asString = SuitouCode ;

  //A.Nishimura 火山性土の判定
  dcode :=  PrintModule1.ADOQueryUketuke.FieldByName('M_HOJOU.土壌コード').asString;

  case Strtoint(Copy( dcode,1,1)) of
  1,4:  DosituCode := '2';
  2:     DosituCode := '3';
  3:     DosituCode := '1';
  end;
  IsKazan := DosituCode = '1'; //火山性土


  //基準値CEC 0～10 等のタイプを判定 A,B,C
  typCEC := Get_CEC_ABC(PrintModule1.ADOQueryUketuke);


(*
  //草地の場合と園芸に分ける
  if IsKusa then begin
      if dcode = '' then dcode := '10';
      typCEC := 'A';
      case Strtoint( dcode ) of
        31: typCEC := 'A';
        32: typCEC := 'B';
        33: typCEC := 'C';
      end;
  end
  else begin    //草地以外
      //CECよりどの基準値{A,B,C}を採用するか
      if QueryUketuke.FieldByName('CEC').asFloat <= 10.0 then  typCEC := 'A'
      else
      if QueryUketuke.FieldByName('CEC').asFloat <= 20.0 then  typCEC := 'B'
      else                                                     typCEC := 'C' ;
  end;
*)

  //基準ＤＢのレコード移動
  result := Set_Kijun_Rec( PrintModule1.ADOQueryUketuke, PrintModule1.ADOQueryKijun ) > 0;





end;


procedure TSindanForm.QuerySindanorgBeforePost(DataSet: TDataSet);
begin
  //印刷するたびに計算＆書き込みするので呼ばれる。（例外にして適用しない？）
  //が、この時に項目 ( 診断不足量、土改材コード ) が設定される内容があるので残すしかない。
//	DataSet.FieldByName('編集日').asDateTime := now ;
  //仕様上エントリー項目でないので同期対象にならないとみなす
end;
{
  指定土改材による必要量算出と他取得成分の算出
  aCode: 土改材コード
  aType: 計算対象成分 Set of (sdP,sdMg,sdpH)
  aValue:必要量
  pVolP,pVolMg,pVolpH : 算出量
  result : 指定成分の算出量
}
function TSindanForm.MakeDokaiVolume( aCode: string ; aType : TsDokai; aValue : double;
      var pVolP: double; var pVolMg: double; var pVolpH: double): double;
var aVol :double ;

begin
  aVol := 0 ;
  with QueryDokaizai do begin
    SQL.Text := 'Select * from M_DOKAIZAI where コード='''+aCode+'''';
    Open;
    case aType of
    sdP: aVol := aValue / FieldByName('リン酸').asFloat * 100 ;
    sdMg:aVol := aValue / FieldByName('苦土').asFloat * 100 ;
    sdpH:aVol := aValue / FieldByName('アルカリ分').asFloat * 100 ;
    end;
    //必要量を算出後その他の成分の量も計算
    if    FieldByName('リン酸').asFloat = 0 then pVolP := 0
    else  pVolP := aVol * FieldByName('リン酸').asFloat / 100 ;
    if    FieldByName('苦土').asFloat = 0 then pVolMg := 0
    else  pVolMg := aVol * FieldByName('苦土').asFloat / 100 ;
    if    FieldByName('アルカリ分').asFloat = 0 then pVolpH := 0
    else  pVolpH := aVol * FieldByName('アルカリ分').asFloat / 100 ;
    Close;
  end;
  result := aVol ;
end;

//資材量から成分量を算出
// aValue  資材量
function TSindanForm.DokaiVolume( aCode: string ; aValue : double;
      var pVolP: double; var pVolMg: double; var pVolpH: double): double;
var aVol :double ;

begin
//  aVol := 0 ;
  with PrintModule1.ADOQueryDokaizai do begin
    SQL.Text := 'Select * from M_DOKAIZAI where コード='''+aCode+'''';
    Open;

    aVol := aValue;
    //必要量を算出後その他の成分の量も計算
    if    FieldByName('リン酸').asFloat = 0 then pVolP := 0
    else  pVolP := aVol * FieldByName('リン酸').asFloat / 100 ;
    if    FieldByName('苦土').asFloat = 0 then pVolMg := 0
    else  pVolMg := aVol * FieldByName('苦土').asFloat / 100 ;
    if    FieldByName('アルカリ分').asFloat = 0 then pVolpH := 0
    else  pVolpH := aVol * FieldByName('アルカリ分').asFloat / 100 ;
    Close;
  end;
  result := aVol ;
end;

procedure TSindanForm.StringGrid1Click(Sender: TObject);
begin

end;
{
  表示の時対象一覧を表示する
}
procedure TSindanForm.FormShow(Sender: TObject);
var  RowCnt : integer ;
var stmp : String;
begin


  FRes := False ;

    if EMode.Text = '土壌' then begin
       with StringGrid1 do begin
         Cells[ 0, 0 ] := '試料NO' ;
         ColWidths[0] := 80;
         Cells[ 1, 0 ] := '受付NO';
         ColWidths[1] := 80;
         Cells[ 2, 0 ] := '採取場所';
         ColWidths[2] := 128;
         Cells[ 3, 0 ] := '作物名';
         ColWidths[3] := 128;
         Cells[ 4, 0 ] := '印刷';
         ColWidths[4] := 32;
       end;
       //受け付け対象レコード : 画面表示しないで計算メソッド呼び出す場合この時点のSQLConditionが適用される。
       MakeSQL;
    end
    else if EMode.Text = '堆肥' then begin

    end
    else if EMode.Text = '飼料' then begin

    end;


  with ADOQuery1 do begin


{
    if EMode.Text = '診断票' then begin
       SQLCondition := SQLCondition + ' and ((出力調書土壌 = True) or (出力調書施肥 = True))';
    end
    else if EMode.Text = '分析値のみ' then begin
       SQLCondition := SQLCondition + ' and (出力調書分析のみ = True)';

    end;


    if JFukyuu = True then begin
       SQLCondition := SQLCondition + ' and (本人サイン = True)';
    end;
}   SQL.Clear;

    if EMode.Text = '土壌' then begin


//2018.12.26修正


      stmp := 'Select T_BUNSEKI6.*,M_SAKUMOTU.* '+
        'from T_BUNSEKI6 LEFT OUTER JOIN M_SAKUMOTU '+
   	'ON  (T_BUNSEKI6.作物コード = M_SAKUMOTU.作物コード) '+
        'where ' + SQLCondition +
        ' ORDER BY T_Bunseki6.試料NO' ;




 {
      stmp := 'SELECT T_uketuke.サンプル番号, M_hojou.圃場名, M_nouka.農家名,M_nouka.農家番号,M_nouka.集団, M_sakumotu.作物名, M_sakugata.作型名 ' +
        'FROM T_UKETUKE T_uketuke ' +
        'INNER JOIN M_HOJOU M_hojou '+
        'ON  (T_uketuke.圃場番号 = M_hojou.圃場番号) '+
        'INNER JOIN M_SAKUGATA M_sakugata '+
        'ON  (T_uketuke.作目コード = M_sakugata.作目コード) '+
        'AND  (T_uketuke.作物コード = M_sakugata.作物コード) '+
        'AND  (T_uketuke.作型コード = M_sakugata.作型コード) '+
        'INNER JOIN M_SAKUMOTU M_sakumotu '+
        'ON  (T_uketuke.作目コード = M_sakumotu.作目コード) '+
        'AND  (T_uketuke.作物コード = M_sakumotu.作物コード) '+
        'INNER JOIN M_NOUKA M_nouka '+
        'ON  (M_hojou.農家番号 = M_nouka.農家番号) '+
        'Where T_uketuke.削除フラグ<>True and ' +
        SQLCondition + SQLCondition2;
 }




//    ' ORDER BY T_uketuke.サンプル番号' ;
    SQL.Text := stmp;

      {Version 0.6 #26 削除フラグ追加}
      Open;
      RowCnt := 1 ;
      while not Eof do begin
        with StringGrid1 do begin
          RowCount := RowCnt + 1 ;
          Cells[ 0, RowCnt ] := FieldByName('試料NO').asString ;
          Cells[ 1, RowCnt ] := FieldByName('受付NO').asString;
          Cells[ 2, RowCnt ] := FieldByName('採取場所').asString;
          Cells[ 3, RowCnt ] := FieldByName('M_SAKUMOTU.作物名').asString;
          Cells[ 5, RowCnt ] := '1';



        end;
        Next ;
        INC(RowCnt);
      end;
      StringGrid1.FixedRows := 1 ;
    end
    else if EMode.Text = '堆肥' then begin
    end
    else if EMode.Text = '飼料' then begin


    end;

    close;
  end;
end;

procedure TSindanForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TSindanForm.btnPreviewClick(Sender: TObject);
var
  aCnt : integer ;
  aBuff : string ;
begin
  aBuff := '';
  for aCnt := 1 to StringGrid1.rowcount -1 do begin
    if (StringGrid1.Cells[0,aCnt] <> '' ) and (StringGrid1.Cells[5,aCnt] = '1') then begin
      if aBuff <> '' then aBuff := aBuff + ',' ;
      aBuff := aBuff + ''''+ StringGrid1.Cells[0,aCnt] + '''';
    end;
  end;
  if aBuff = '' then begin
    ShowMessage('印刷対象が０件です。');
    exit ; //印刷件数０
  end;

  {選択情報をSQLConditionに再設定して閉じる}
  SQLCondition := '試料NO in ('+ aBuff +')';
  MakeSQL2;       //画面で指定した条件でSQL作成
  FRes  := True;
  Close;
end;

procedure TSindanForm.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
	if (ACol=5) and (not(gdFixed in State)) then begin
		StringGrid1.Canvas.FillRect(Rect);   //テキストの背景色で消す
		StringGrid1.Canvas.Pen.Color := clBtnHighlight;
		StringGrid1.Canvas.Polyline([Point(Rect.Left, Rect.Bottom), Rect.TopLeft,
			Point(Rect.Right, Rect.Top)]);
		StringGrid1.Canvas.Pen.Color := clBtnShadow;
		StringGrid1.Canvas.Polyline([Point(Rect.Left, Rect.Bottom),
			Rect.BottomRight, Point(Rect.Right, Rect.Top)]);
		if StringGrid1.Cells[aCol,aRow] = '1' then begin
			StringGrid1.Canvas.Draw(Rect.Left+2, Rect.Top+2, Image1.Picture.Bitmap);
		end else begin
			StringGrid1.Canvas.Draw(Rect.Left+2, Rect.Top+2, Image2.Picture.Bitmap);
    end;
  end;

end;

procedure TSindanForm.btnCancelClick(Sender: TObject);
var aCnt : integer ;
begin
  for aCnt := 1 to StringGrid1.rowcount -1 do begin
    if StringGrid1.Cells[0,aCnt] <> '' then
      StringGrid1.Cells[5,aCnt] := '0' ;
  end;
end;

procedure TSindanForm.btnAllClick(Sender: TObject);
var aCnt : integer ;
begin
  for aCnt := 1 to StringGrid1.rowcount -1 do begin
    if StringGrid1.Cells[0,aCnt] <> '' then
      StringGrid1.Cells[5,aCnt] := '1' ;
  end;
end;

procedure TSindanForm.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow : integer ;
begin
  StringGrid1.MouseToCell(X,Y, ACol, ARow);
  if (ACol = 5 )and( ARow>0 )and ( StringGrid1.Cells[0,ARow] <> '' ) then begin
    if StringGrid1.Cells[5,ARow] = '1' then
      StringGrid1.Cells[5,ARow] := '0'
    else
      StringGrid1.Cells[5,ARow] := '1';
  end;
end;

end.

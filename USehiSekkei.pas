unit USehiSekkei;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,Db,Math;

type TSetMode = (smIns,smDel);
type THiryoType = (htYuuki,htHiryo1,htHiryo2,htHiryo3);
type TRecHiryo = record
    CD : string ;   //肥料コード
    Name  : string ; // 肥料名
    N : double ;  //成分率(%)
    P : double ;
    K : double ;
    M : double ;
    V : double ;   //施用量(kg or t)
    You : double;    //容量
    Tanka : Integer; //単価
    YuukiSitu : Bool;
    Tuihi : Bool;
  end;

type
  TSehiHiryo = class(TObject)
  private
    { Private 宣言 }
    aryHiryo : array[Ord(Low(THiryoType))..Ord(High(THiryoType)),1..5] of TRecHiryo ;
    //受付での指定肥料
  public
    { Public 宣言 }
    constructor Create; virtual;
    destructor Destroy; override;
    {肥料情報の設定}
    function SetHiryo(aType: THiryoType; aCode : string  ;aValue : double; IsKazan : Boolean):integer;
    {肥料情報の取得}
    function GetHiryo(aType: THiryoType; aNum: integer): TRecHiryo;
    {施用量の設定}
    procedure SetValue( aType : THiryoType; aNum:integer ; aValue : double);
    procedure DelHiryo(aType: THiryoType; aNum: integer);   {肥料の削除}
    procedure Clear;  overload; //全クリア
    procedure Clear(aCnt1,aCnt2:integer); overload;
    function GetQuantity(aType: THiryoType):TRecHiryo;      {成分の合計}
    function GetQuantity2( aType : THiryoType; mode : Integer):TRecHiryo;
    {施容量の自動算出：他の指定済み成分の合計の残りで計算}
    function CalcValue(aType: THiryoType; aNum: integer; aSetVal: double;aCalIng: integer): double;
    {有機を含まない成分合計：施肥回数指定}
    function GetTotal(Kaisu: integer): TRecHiryo;    {基肥＋肥料１＋肥料２（分施回数）}
end;


type
  TFSehiSekkei = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ListSehiM: TListBox;
    ListSehiB: TListBox;
    ListSehiB2: TListBox;
    ListTanpi: TListBox;
    ListKasei: TListBox;
    TMPList: TListBox;
    procedure Panel2Click(Sender: TObject);
  private
    { Private declarations }
  public
    SehiList : TSehiHiryo;

    procedure SehiSekkei;
    procedure SehiSekkei2;
    procedure SehiSekkei2_Soku;

    function SetHiryoList( aMode :TSetMode; aHiryo :THiryoType  ; aDelNum: integer ; aCode: string ):Boolean;
    function SetHiryoList2( aMode :TSetMode; aHiryo :THiryoType  ; aDelNum: integer ; aCode: string; aSetVal : double;type1 : Integer;Type2 : integer ):Boolean;
    procedure SetHiryoField( DataSet: TDataSet; aField : string; aCnt : integer ;aRecHiryo : TRecHiryo );


    { Public declarations }
  end;







var
  FSehiSekkei: TFSehiSekkei;




implementation

{$R *.dfm}
uses
	DMU,PrnCanvasU; //,MainU;



////////////////////////////////////////////////////////////

{
  施肥設計クラス
}
constructor TSehiHiryo.Create;
begin
  inherited Create ;
end;
destructor TSehiHiryo.Destroy;
begin
  inherited Destroy ;
end;
{登録肥料クリア}
procedure TSehiHiryo.Clear(aCnt1,aCnt2:integer);
begin
  aryHiryo[aCnt1,aCnt2].CD := '';
  aryHiryo[aCnt1,aCnt2].Name := '';
  aryHiryo[aCnt1,aCnt2].N := 0;
  aryHiryo[aCnt1,aCnt2].P := 0;
  aryHiryo[aCnt1,aCnt2].K := 0;
  aryHiryo[aCnt1,aCnt2].M := 0;
  aryHiryo[aCnt1,aCnt2].V := 0;
end;
{登録肥料全クリア}
procedure TSehiHiryo.Clear;
var
  aCnt1,aCnt2 : integer ;
begin
  for aCnt1 := Ord(Low(THiryoType)) to Ord(High(THiryoType)) do begin
    for aCnt2 := 1 to 5 do begin
      Clear(aCnt1,aCnt2) ;
    end;
  end;
end;
{
  肥料リストの追加。レコードから 容量もセット
  戻り値：格納番号
}
function TSehiHiryo.SetHiryo( aType : THiryoType; aCode : string ;aValue : double ; IsKazan : Boolean ):integer;
var
  aCnt,len : integer ;
begin
  result := 0 ;
  len := length(aCode);
  for aCnt := 1 to 5 do begin
    {空きのあるところに}
    if aryHiryo[Ord(aType),aCnt].CD = '' then begin

      with DataModule1.ADOQueryRead3 do begin  {肥料明細の登録}
        case aType of
        htYuuki:
          if IsKazan then
            SQL.Text := 'Select 有機物名称 as Name,N,K,P,0 as M from M_Yuuki where 有機物コード='''+  aCode+''''
          else
            SQL.Text := 'Select 有機物名称 as Name,N_2 as N,K_2 as K,P_2 as P,0 as M from M_Yuuki where 有機物コード='''+aCode+'''';
        else if len = 4 then   //化成肥料
            SQL.Text := 'Select 肥料名 as Name,N,K2O as K,P205 as P,MgO as M,容量 as You,単価 as Tanka,有機質フラグ,追肥フラグ from M_Kasei where CODE='''+aCode +''''
          else                   //単肥肥料
            SQL.Text := 'Select 肥料名 as Name,N,K2O as K,P205 as P,MgO as M,容量 as You,単価 as Tanka from M_Tanpi where CODE='''+aCode +'''';
        end;
        Open;
        if RecordCount > 0 then begin
          aryHiryo[Ord(aType),aCnt].CD := aCode ;
          aryHiryo[Ord(aType),aCnt].Name := FieldByName('Name').asString ;
          aryHiryo[Ord(aType),aCnt].N := FieldByName('N').asFloat ;
          aryHiryo[Ord(aType),aCnt].K := FieldByName('K').asFloat ;
          aryHiryo[Ord(aType),aCnt].P := FieldByName('P').asFloat ;
          aryHiryo[Ord(aType),aCnt].M := FieldByName('M').asFloat ;
          aryHiryo[Ord(aType),aCnt].V := aValue ;

          if len = 4 then begin  //H170420
//            aryHiryo[Ord(aType),aCnt].YuukiSitu := FieldByName('有機質フラグ').asBoolean;
            aryHiryo[Ord(aType),aCnt].Tuihi := FieldByName('追肥フラグ').asBoolean;
          end
          else begin
            aryHiryo[Ord(aType),aCnt].YuukiSitu := false;
            aryHiryo[Ord(aType),aCnt].Tuihi := false;
          end;
          if aType <> htYuuki then begin
             aryHiryo[Ord(aType),aCnt].You := FieldByName('You').asFloat;
             aryHiryo[Ord(aType),aCnt].Tanka := FieldByName('Tanka').asInteger;
          end
          else begin
             aryHiryo[Ord(aType),aCnt].You := 0;
             aryHiryo[Ord(aType),aCnt].Tanka := 0;
          end;
        end;
        Close;
      end;
      result := aCnt ;   //セットできた番号を返す
      break;
    end;
  end;
end;
{
  肥料容量の算出
    肥料タイプ、
    aNum : integer  : 1-5算出する肥料の登録済番号（算出成分率）
    aSetVal :double : 成分の施肥量（合計目標値）
    aCalIng:integer : 1:N,2:P,3:K,4:Mg 算出成分種類
    戻り値：算出した施容量
}
function TSehiHiryo.CalcValue( aType : THiryoType; aNum : integer ;aSetVal :double;aCalIng:integer ):double;
var
  aCnt : integer ;
  aTotal,aVal,aDifference,aIngredient : double ;
begin
  result := 0 ;
  aTotal := 0;
  //自分以外の合計の成分を算出
  for aCnt := 1 to 5 do begin
    if aCnt = aNum then continue ;  {自分は合計に含めない}
    {有機のみ成分量(Kg/t)}
    aVal := 0;
    if aType = htYuuki then begin
      case  aCalIng of  {※：呼ばれることはない}
      1: aVal := aryHiryo[Ord(aType),aCnt].N *  aryHiryo[Ord(aType),aCnt].V  ;
{※}  2: aVal := aryHiryo[Ord(aType),aCnt].P *  aryHiryo[Ord(aType),aCnt].V  ;
{※}  3: aVal := aryHiryo[Ord(aType),aCnt].K *  aryHiryo[Ord(aType),aCnt].V  ;
{※}  4: aVal := aryHiryo[Ord(aType),aCnt].M *  aryHiryo[Ord(aType),aCnt].V  ;
      end;
    end else begin
      case  aCalIng of
      1: aVal := aryHiryo[Ord(aType),aCnt].N *  aryHiryo[Ord(aType),aCnt].V / 100 ;
      2: aVal := aryHiryo[Ord(aType),aCnt].P *  aryHiryo[Ord(aType),aCnt].V / 100 ;
      3: aVal := aryHiryo[Ord(aType),aCnt].K *  aryHiryo[Ord(aType),aCnt].V / 100 ;
      4: aVal := aryHiryo[Ord(aType),aCnt].M *  aryHiryo[Ord(aType),aCnt].V / 100 ;
      end;
    end;
    aTotal := aTotal +  aVal ;
  end;
  //目標値からの不足分算出
  aDifference := aSetVal - aTotal ;
  if aDifference <= 0 then exit;   {０を返す}
  //成分量、比を出す
  aIngredient := 0;
  case  aCalIng of
  1: aIngredient := aryHiryo[Ord(aType),aNum].N  ;
  2: aIngredient := aryHiryo[Ord(aType),aNum].P  ;
  3: aIngredient := aryHiryo[Ord(aType),aNum].K  ;
  4: aIngredient := aryHiryo[Ord(aType),aNum].M  ;
  end;
  if aIngredient <= 0 then exit ;

  result := aDifference / aIngredient ;   {不足分／成分率＝必要量}
  if aType <> htYuuki then result := result * 100 ;
end;
{登録済み肥料の削除}
procedure TSehiHiryo.DelHiryo( aType : THiryoType; aNum : integer );
var
  aCnt : integer ;
begin
  if (aNum < 1) or ( aNum > 5 ) then exit ;

  //施用量も削除する。

  for acnt := aNum to 4 do aryHiryo[Ord(aType),aCnt] := aryHiryo[Ord(aType),aCnt+1] ;
  Clear(Ord(aType),5);
end;
{登録済み肥料情報の取得}
function TSehiHiryo.GetHiryo( aType : THiryoType; aNum : integer ):TRecHiryo;
begin
  result := aryHiryo[Ord(aType),aNum];
end;
{容量のみの登録}
procedure TSehiHiryo.SetValue( aType : THiryoType; aNum:integer ; aValue : double);
begin
  aryHiryo[Ord(aType),aNum].V := aValue ;
end;
{肥料成分の算出}
function TSehiHiryo.GetQuantity( aType : THiryoType):TRecHiryo;
var
  aCnt : integer ;
  aRecHiryo : TRecHiryo ;
  dN,dP,dK,dM : double ;
begin
  dN := 0; dP := 0 ; dK := 0 ; dM := 0;
  for aCnt := 1 to 5 do begin
    aRecHiryo := GetHiryo(aType,aCnt);
    if aRecHiryo.V =0 then continue ;
    {有機のみ成分量(Kg/t)}
    if aType = htYuuki then begin
      dN := dN + aRecHiryo.N * aRecHiryo.V  ;
      dP := dP + aRecHiryo.P * aRecHiryo.V  ;
      dK := dK + aRecHiryo.K * aRecHiryo.V  ;
    end else begin
      dN := dN + aRecHiryo.N * aRecHiryo.V /100 ;
      dP := dP + aRecHiryo.P * aRecHiryo.V /100 ;
      dK := dK + aRecHiryo.K * aRecHiryo.V /100 ;
      dM := dM + aRecHiryo.M * aRecHiryo.V /100 ;
    end;
  end;
  result.N := dN ;
  result.P := dP ;
  result.K := dK ;
  result.M := dM ;
end;


{肥料成分の算出}
// mode
// 0・・・ 全ての肥料合計　1・・・・基肥のみ  2・・・・追肥のみ
//
function TSehiHiryo.GetQuantity2( aType : THiryoType; mode : Integer):TRecHiryo;
var
  aCnt : integer ;
  aRecHiryo : TRecHiryo ;
  dN,dP,dK,dM : double ;
begin
  dN := 0; dP := 0 ; dK := 0 ; dM := 0;
  for aCnt := 1 to 5 do begin


    aRecHiryo := GetHiryo(aType,aCnt);



    if mode = 1 then begin
       if aRecHiryo.Tuihi = True then continue;
    end
    else if mode = 2 then begin
       if aRecHiryo.Tuihi <> True then continue;
    end;


    if aRecHiryo.V =0 then continue ;


    {有機のみ成分量(Kg/t)}
    if aType = htYuuki then begin
      dN := dN + aRecHiryo.N * aRecHiryo.V  ;
      dP := dP + aRecHiryo.P * aRecHiryo.V  ;
      dK := dK + aRecHiryo.K * aRecHiryo.V  ;
    end else begin
      dN := dN + aRecHiryo.N * aRecHiryo.V /100 ;
      dP := dP + aRecHiryo.P * aRecHiryo.V /100 ;
      dK := dK + aRecHiryo.K * aRecHiryo.V /100 ;
      dM := dM + aRecHiryo.M * aRecHiryo.V /100 ;
    end;
  end;
  result.N := dN ;
  result.P := dP ;
  result.K := dK ;
  result.M := dM ;
end;





{指定施肥回数で成分の総合計を算出：回数で追肥＝０は１にする}
function TSehiHiryo.GetTotal( Kaisu : integer ) :TRecHiryo;
var
  aRecHiryo : array[1..3] of TRecHiryo ;
begin
  aRecHiryo[1] := GetQuantity( htHiryo1 ) ;
  aRecHiryo[2] := GetQuantity( htHiryo2 ) ;
  aRecHiryo[3] := GetQuantity( htHiryo3 ) ;
  result := aRecHiryo[1] ;    {基肥}
  {分施回数１及び追肥の場合}
  if Kaisu >= 1 then begin
    result.N := result.N + aRecHiryo[2].N;
    result.P := result.P + aRecHiryo[2].P;
    result.K := result.K + aRecHiryo[2].K;
    result.M := result.M + aRecHiryo[2].M;
  end;
  if Kaisu >= 2 then begin
    result.N := result.N + aRecHiryo[3].N*(Kaisu-1);
    result.P := result.P + aRecHiryo[3].P*(Kaisu-1);
    result.K := result.K + aRecHiryo[3].K*(Kaisu-1);
    result.M := result.M + aRecHiryo[3].M*(Kaisu-1);
  end;
end;


procedure TFSehiSekkei.Panel2Click(Sender: TObject);
begin

end;
///////////////////////////////////////////////////////////////////////////
//  施肥設計　
///////////////////////////////////////////////////////////////////////////
procedure TFSehiSekkei.SehiSekkei;
const
  //本田　リン酸　施肥対応
  //M_BAI_S_P

  //本田　加里　施肥対応
  //M_BAI_S_K
  //本田　苦土　施肥対応
  //M_BAI_S_M
  //Sui_Sehi_Mg : array [1..2] of Integer =
  //  (1,0);



  //園芸　苦土


  //てんさい　窒素　施肥対応
  Hata_Sehi_N : array [1..6] of Integer =
    (24,  //1,2    熱抽出窒素
     20,  //3,4
     16,  //5,6
     12,  //7,8
     8,   //9,10
     8);  //11以上

  //馬鈴薯 206
  Hata_Sehi_N206 : array [1..6, 1..10] of Integer =
    ((0,0,0,5,0,7,8,10,10,12),   //1,2
     (0,0,0,4,0,6,7, 8, 9,10),   //3,4
     (0,0,0,4,0,5,6, 7, 8, 9),   //5,6
     (0,0,0,4,0,5,6, 6, 7, 8),   //7,8
     (0,0,0,3,0,4,5, 6, 6, 7),   //9,10
     (0,0,0,2,0,4,4, 5, 5, 6));   //11以上

  Hata_Sehi_N205 : array [1..6, 1..11] of Integer =
    ((0,0,0,0,0,0,10,11,13,14,15),   //1,2
     (0,0,0,0,0,0, 8,10,11,12,13),   //3,4
     (0,0,0,0,0,0, 7, 8, 9,10,11),   //5,6
     (0,0,0,0,0,0, 6, 6, 7, 8, 9),   //7,8
     (0,0,0,0,0,0, 5, 6, 6, 7, 8),   //9,10
     (0,0,0,0,0,0, 4, 5, 5, 6, 7));   //11以上

  //麦類  窒素  収量 480
  Hata_Sehi_N201A : array [1..6] of Integer =
    (14,  // 0-2
     11,  // -3
     9,  // -4
     6, // -5
     4, // -6
     4); // 6-

  //  収量 480
  Hata_Sehi_N201B : array [1..4] of Integer =
    (9,  // 0-7
     6,  // 7-11
     4,  // 11-15
     4); //  15-

  Hata_Sehi_N202 : array [1..4] of Integer =
    (11,  // 0-5
     8,  // 5-10
     5,  // 10-30
     4); //  60-

  //麦類  リン酸
  Hata_Sehi_P1 : array [1..5] of Integer =
    (150,  // 0-5
     130,  // 5-10
     100,  // 10-30
     80,  // 30-60
     50); //  60-
  //麦類  加里
  Hata_Sehi_K1 : array [1..6] of Integer =
    (150,  // 0-8
     130,  // 8-15
     100,  // 15-30
     60,  // 30-50
     30,   //50-70
     0); //  70-

  //麦類  苦土
  Hata_Sehi_M1 : array [1..4] of Integer =
    (150,  // 0-10
     130,  // 10-25
     100,  // 25-45
     0);  // 45-

  //馬鈴薯  リン酸
  Hata_Sehi_P2 : array [1..5] of Integer =
    (150,  // 0-5
     130,  // 5-10
     100,  // 10-30
     80,  // 30-60
     50); //  60-
  //馬鈴薯  加里
  Hata_Sehi_K2 : array [1..6] of Integer =
    (130,  // 0-8
     110,  // 8-15
     100,  // 15-30
     50,  // 30-50
     20,   //50-70
     0); //  70-

  //馬鈴薯  苦土
  Hata_Sehi_M2 : array [1..4] of Integer =
    (150,  // 0-10
     130,  // 10-25
     100,  // 25-45
     0);  // 45-


  //H150826
  //その他  リン酸
  Hata_Sehi_P3 : array [1..5] of Integer =
    (150,  // 0-5
     130,  // 5-10
     100,  // 10-30
     80,  // 30-60
     50); //  60-
  //豆類  リン酸
  Hata_Sehi_P4 : array [1..5] of Integer =
    (150,  // 0-5
     130,  // 5-10
     100,  // 10-30
     100,  // 30-60
     80); //  60-
  //馬鈴薯  加里
  Hata_Sehi_K3 : array [1..6] of Integer =
    (130,  // 0-8
     110,  // 8-15
     100,  // 15-30
     50,  // 30-50
     20,   //50-70
     0); //  70-
  //豆類  加里
  Hata_Sehi_K4 : array [1..6] of Integer =
    (150,  // 0-8
     130,  // 8-15
     100,  // 15-30
     60,  // 30-50
     30,   //50-70
     0); //  70-

  //その他  苦土
  Hata_Sehi_M3 : array [1..4] of Integer =
    (150,  // 0-10
     130,  // 10-25
     100,  // 25-45
     0);  // 45-
  //豆類  苦土
  Hata_Sehi_M4 : array [1..4] of Integer =
    (150,  // 0-10
     130,  // 10-25
     100,  // 25-45
     0);  // 45-

  //牧草　リン酸　施肥倍率
  Sou_Sehi_P : array [1..2, 1..3] of double =
    ((150,100,50), //　火山性土 30
     (150,100,50)); //  低地土,台地土 10,40  70以上は、0

  //牧草　加里　施肥倍率
  Sou_Sehi_K : array [1..4, 1..3] of double =
    ((125,100,75), //　火山性土 30
     (110,100,50), //  低地土,台地土 10,40
     (125,100,75), //   泥炭土　無客土　20
     (110,100,75)); //  泥炭土　客土　　21

  //牧草　苦土　施肥倍率
  Sou_Sehi_M : array [1..2, 1..3] of double =
    ((150,100,50), //　全て
     (100,100,100)); //  ダミー

  //サイレージとうもろこし　リン酸　施肥倍率
  Sairei_Sehi_P : array [1..2, 1..5] of double =
    ((150,130,100,80,50), //　
     (100,100,100,100,100)); //  ダミー

  //サイレージとうもろこし　加里　施肥倍率
  Sairei_Sehi_K : array [1..2, 1..6] of double =
    ((150,130,100,60,30,0), //　
     (100,100,100,100,100,100)); //  ダミー

  //サイレージとうもろこし　苦土　施肥倍率
  Sairei_Sehi_M : array [1..2, 1..4] of double =
    ((150,130,100,0), //　
     (100,100,100,100)); //  ダミー


var
  SakumokuCD : String;
  SakumotuCD : String;
  SakugataCD : String;
  fcode : String;  // 腐植等　コード作業用
  icode,icode2 : Integer;
  dcode0 : String; //土壌コード
  dcode : String; // 水稲土壌コード
  dval : double;
  titaiS : String; //水稲地帯区分
  Ppp : double;  //リン酸
  Kkk : double;  //加里
  Mgg : double;
  Nnn : double;   //窒素
  ff : double; //腐植
  min, max : double;  //基準値　下限　上限
  dtmp,btmp : double;  //ダミー
  stmp,stmp2 : String;
  Standard : TRecStandard ;
  SehiV : TRecStandard ;

  Standard2 : TRecStandard ;
  typcec : string;
  dallP,dallMg,dallpH,dallkei : Double;
  i : integer;
  dkakaku : integer;
  dP , dMg, dpH, dkei : double;
  baibmp : double;
  itmp : Integer;
begin

    //データベースエディット
    if PrintModule1.ADOQuerySindan.State <> dsEdit then  PrintModule1.ADOQuerySindan.Edit();

    //////////////////////////////////////////////////////////////////
    //施肥標準値をとりあえずセット
    with PrintModule1.ADOQuerySindan do begin
      Standard := GetStandardValue(PrintModule1.ADOQueryUketuke);

      FieldByName('N施肥不足量').asFloat := Standard.Motohi.N;
      FieldByName('P施肥不足量').asFloat := Standard.Motohi.P;
      FieldByName('K施肥不足量').asFloat := Standard.Motohi.K;
      FieldByName('Mg施肥不足量').asFloat := Standard.Motohi.M;

      FieldByName('N施肥不足量2').asFloat := Standard.Sehi1.N;
      FieldByName('P施肥不足量2').asFloat := Standard.Sehi1.P;
      FieldByName('K施肥不足量2').asFloat := Standard.Sehi1.K;

      FieldByName('N施肥不足量3').asFloat := Standard.Sehi2.N;
      FieldByName('P施肥不足量3').asFloat := Standard.Sehi2.P;
      FieldByName('K施肥不足量3').asFloat := Standard.Sehi2.K;

      FieldByName('分施回数').asFloat := Standard.Kaisu;


      SehiV := GetSehiValue( PrintModule1.ADOQueryUketuke);

    end;
    dallP := 0;
    dallMg := 0;
    dallpH := 0;
    //カリ資材は、ないものとして計算

//    with PrintModule1.QuerySindan do begin
//NISHI0513
      for i := 1 to 4 do begin
//         YY2 := YY2 + 5;
         stmp2 := '土改材コード'+InttoStr(i);
         dcode := PrintModule1.ADOQuerySindan.FieldByName(stmp2).asString;
//         stmp := ' '+GetDokaizaiName(dcode);
//         RectAndText(lmRECT,tlCENTER,taLeft,XX1+8,YY3+YY2,65,5,11,stmp,ftNORMAL);
         stmp2 := '土改材量'+InttoStr(i);
         dval := PrintModule1.ADOQuerySindan.FieldByName(stmp2).asFloat;
         dkakaku := 0;
         if dval > 0 then begin
            DokaiVolume( dcode, dval, dP , dMg, dpH, dkei,dkakaku); //H170517
            dallP := dallP + dP;//(dval / 100.0 * dp);
            dallMg := dallMg + dMg; //(dval / 100.0 * dMg);
            dallpH := dallpH + dpH;
            dallkei := dallkei + dkei;
         end;
//         stmp := FtoStr(dval,1);
//         RectAndText(lmRECT,tlCENTER,taCENTER,XX1+73,YY3+YY2,35,5,11,stmp,ftNORMAL);
         //価格
//         stmp := FtoStr( dkakaku,0 );
//         RectAndText(lmRECT,tlCENTER,taCENTER,XX1+108,YY3+YY2,29,5,11,stmp,ftNORMAL);
      end;
//    end;



    with PrintModule1.ADOQueryUketuke do begin
        //作物ＣＤ
        SakumokuCD := FieldByName('作目コード').asString;
        SakumotuCD := FieldByName('作物コード').asString;
        SakugataCD := FieldByName('作型コード').asString;

//        code := FieldByName('腐植コード').asString;
        //
        fcode := '1';

//        dcode := FieldByName('水稲土壌コード').asString;
//        dcode0 := FieldByName('畑牧土壌コード').asString;
        dcode := Jval.DojyouCD; //('水稲土壌コード').asString;
        dcode0 := Jval.DojyouCD; //('畑牧土壌コード').asString;

        titaiS := FieldByName('水稲地帯区分').asString;


        ///////////////////////////////////////////////////////////////////////////
        ///  作物ごと判定
        ///

         //水稲
        if SakumokuCD = '1' then begin

            //窒素の値は、ここでは、使用しないがセットする。
            Nnn := FieldByName('可給態N').asFloat;
            Jval.NN := Nnn;


             //本田
            if SakumotuCD = '01' then begin


                //窒素のランクを選別
                Nnn := FieldByName('可給態N').asFloat;
                Jval.NN := Nnn;
                dtmp := Bai_S_N( Nnn, dcode, titaiS,0 );
                PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := dtmp;

                //リン酸のランクを選別
                Ppp := FieldByName('ブレイP').asFloat;// + dallP;
                dtmp := Bai_S_P( Ppp, dcode, fcode );
                PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat := dtmp;
//燐酸分はみない H170601
//                TableSindan.FieldByName('P施肥不足量').asFloat := 0;


                //本田　加里
                Kkk := FieldByName('K2O').asFloat;
                dtmp := Bai_S_K( Kkk );
                PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat := dtmp;



                //本田　苦土
                Mgg := FieldByName('MgO').asFloat;// + dallMg;
                dtmp := Bai_S_M( Mgg );
                PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量').asFloat := dtmp;

            end;

            //側条
            if SakumotuCD = '02' then begin


                //窒素のランクを選別
                Nnn := FieldByName('可給態N').asFloat;
                Jval.NN := Nnn;
                dtmp := Bai_S_N( Nnn, dcode, titaiS,1 );
                PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量2').asFloat := dtmp;

                dtmp := Bai_S_N( Nnn, dcode, titaiS,0 ) - 0.5;
                PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat :=
                     dtmp - PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量2').asFloat;

                //リン酸のランクを選別
                Ppp := FieldByName('ブレイP').asFloat;// + dallP;
                dtmp := Bai_S_P( Ppp, dcode, fcode );
                PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat := dtmp;




                //　加里
                Kkk := FieldByName('K2O').asFloat;
                dtmp := Bai_S_K( Kkk );
                PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat := dtmp;



                //　苦土
                Mgg := FieldByName('MgO').asFloat;// + dallMg;
                dtmp := Bai_S_M( Mgg );
                PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量').asFloat := dtmp;

           end;

            //復元田
            if (SakumotuCD = '03') or (SakumotuCD = '07') then begin

                //窒素の値は、ここでは、使用しないがセットする。
                Nnn := PrintModule1.ADOQueryUketuke.FieldByName('可給態N').asFloat;
                Jval.NN := Nnn;

               //窒素
//                if txtNStd1.Text <> '' then begin
//                   btmp := StrToFloat(txtNStd1.Text);
//                end
//                else begin
//                   btmp := 0;
//                end;
               btmp := Standard.Motohi.N + Standard.Sehi1.N; //StrToFloat(txtNStd1.Text);

               if (dcode = '16') then begin //グライ土
                   if SakugataCD = '01' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.6
                   else if SakugataCD = '02' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.6
                   else if SakugataCD = '03' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.6
                   else if SakugataCD = '04' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.4
                   else if SakugataCD = '05' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.4
                   else if SakugataCD = '06' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.5
                   else
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp;
               end
               else if (Copy(dcode,1,1) = '1') or (Copy(dcode,1,1) = '3') then begin
                   if SakugataCD = '01' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.7
                   else if SakugataCD = '02' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 1.0
                   else if SakugataCD = '03' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 1.0
                   else if SakugataCD = '04' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.5
                   else if SakugataCD = '05' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.6
                   else if SakugataCD = '06' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.6
                   else
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp;
               end
               else if Copy(dcode,1,1) = '2' then begin
                   if SakugataCD = '01' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.5
                   else if SakugataCD = '02' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.5
                   else if SakugataCD = '03' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.5
                   else if SakugataCD = '04' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.3
                   else if SakugataCD = '05' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.3
                   else if SakugataCD = '06' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.4
                   else
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp;
               end
               else if Copy(dcode,1,1) = '4' then begin
                   if SakugataCD = '01' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.6
                   else if SakugataCD = '02' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.6
                   else if SakugataCD = '03' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.6
                   else if SakugataCD = '04' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.4
                   else if SakugataCD = '05' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.4
                   else if SakugataCD = '06' then
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.5
                   else
                      PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp;
               end;

               //50% 50%
               btmp := PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat;


               if (SakumotuCD = '07') then begin
               PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp;
               PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量2').asFloat := 0;

               end
               else begin //03
               PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := btmp * 0.5;
               PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量2').asFloat := btmp * 0.5;

               end;




                dtmp := 0;
                PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat := SehiV.Motohi.P; //dtmp;
                PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat := SehiV.Motohi.K; //dtmp;
                PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量').asFloat := SehiV.Motohi.M; //dtmp;



{
                //リン酸のランクを選別
                Ppp := FieldByName('ブレイP').asFloat;// + dallP;
                dtmp := Bai_S_P( Ppp, dcode, fcode );
                PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat := dtmp;


                //本田　加里
                Kkk := FieldByName('K2O').asFloat;
                dtmp := Bai_S_K( Kkk );
                PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat := dtmp;


                //本田　苦土
                Mgg := FieldByName('MgO').asFloat;// + dallMg;
                dtmp := Bai_S_M( Mgg );
                PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量').asFloat := dtmp;

               //リン酸、加里は、施肥標準に従う
//               txtPBuld1.Text := FloatToStr(StrToFloat(txtPStd1.Text) * 1.0);   //基肥 P
//               txtKBuld1.Text := FloatToStr(StrToFloat(txtKStd1.Text) * 1.0);   //基肥 K
}
            end;

{ //水稲床土の診断　
            //床土
            if (SakumotuCD = '04') then
                Ppp := FieldByName('トルオーグP').asFloat;
                btmp := PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat;

                if Ppp >= 20 then begin
                    PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat :=  btmp * 0.0;
                end
                else if Ppp >= 10 then begin
                    PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat :=  btmp * 1.0;
                end
                else begin
                    PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat :=  btmp * 1.5;
                end;



                Kkk := FieldByName('K2O').asFloat;
                btmp := PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat;
                if  Kkk >= 50 then begin
                    PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat :=  btmp * 0.0;   //基肥 P
                end
                else if Kkk >= 35 then begin
                    PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat :=  btmp * 0.25;   //基肥 P
                end
                else if Kkk >= 15 then begin
                    PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat :=  btmp * 0.5;   //基肥 P
                end
                else begin
                    PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat :=  btmp * 1.0;   //基肥 P
                end;

            end;
}

       end; // SakumokuCD = 1 水田



          //畑作
       if SakumokuCD = '2' then begin

             //秋播き小麦  窒素
            if (SakumotuCD = '01') then begin
                  PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := SehiV.Motohi.N;


{
               Nnn := FieldByName('可給態N').asFloat;// + dallN;

               btmp := FieldByName('腐植').asFloat;
               if btmp < 5 then begin
                 if  Nnn >= 7.0 then begin
                    icode := 6;
                  end
                  else if Nnn >= 6.0 then begin
                    icode := 5;
                  end
                  else if Nnn >= 5.0 then begin
                    icode := 4;
                  end
                  else if Nnn >= 4.0 then begin
                    icode := 3;
                  end
                  else if Nnn >= 3.0 then begin
                    icode := 2;
                  end
                  else begin
                    icode := 1;
                  end;

                  itmp := Hata_Sehi_N201A[icode];


               end
               else begin  //秋巻き小麦以外
                 if  Nnn >= 15.0 then begin
                    icode := 4;
                  end
                  else if Nnn >= 11.0 then begin
                    icode := 3;
                  end
                  else if Nnn >= 7.0 then begin
                    icode := 2;
                  end
                  else begin
                    icode := 1;
                  end;

                  itmp := Hata_Sehi_N201B[icode];

               end;

               PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := itmp;

             end;

             //秋播き小麦
            if (SakumotuCD = '01') or (SakumotuCD = '14') then begin


               Nnn := FieldByName('トルオーグP').asFloat; // + dallP;
               //切り上げする
               Nnn := Nnn + 0.9;
                if  Nnn >= 60.0 then begin
                    icode := 5;
                end
                else if Nnn >= 30.0 then begin
                    icode := 4;
                end
                else if Nnn >= 10.0 then begin
                    icode := 3;
                end
                else if Nnn >= 5.0 then begin
                    icode := 2;
                end
                else begin
                    icode := 1;
                end;
                btmp := PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat;
                PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat := btmp * (Hata_Sehi_P1[icode] / 100.0);

                //加里
                Nnn := FieldByName('K2O').asFloat;
                if  Nnn >= 70.0 then begin
                    icode := 6;
                end
                else if Nnn >= 50.0 then begin
                    icode := 5;
                end
                else if Nnn >= 30.0 then begin
                    icode := 4;
                end
                else if Nnn >= 15.0 then begin
                    icode := 3;
                end
                else if Nnn >= 8.0 then begin
                    icode := 2;
                end
                else begin
                    icode := 1;
                end;

                btmp := PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat;
                PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat := btmp * (Hata_Sehi_K1[icode] / 100.0);


                //苦土
                Nnn := FieldByName('MgO').asFloat + dallMg;
                if  Nnn >= 45.0 then begin
                    icode := 4;
                end
                else if Nnn >= 25.0 then begin
                    icode := 3;
                end
                else if Nnn >= 10.0 then begin
                    icode := 2;
                end
                else begin
                    icode := 1;
                end;

                btmp := PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量').asFloat;
                PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量').asFloat := btmp * (Hata_Sehi_M1[icode] / 100.0);

}


            end

             //大豆
            else if (SakumotuCD = '08') or
               (SakumotuCD = '09') then begin

               Nnn := FieldByName('トルオーグP').asFloat;// + dallP;
               //切り上げする
               Nnn := Nnn + 0.9;
                if  Nnn >= 60.0 then begin
                    icode := 5;
                end
                else if Nnn >= 30.0 then begin
                    icode := 4;
                end
                else if Nnn >= 10.0 then begin
                    icode := 3;
                end
                else if Nnn >= 5.0 then begin
                    icode := 2;
                end
                else begin
                    icode := 1;
                end;

                dtmp := Standard.Motohi.P * (Hata_Sehi_P4[icode] / 100.0);

                PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat := dtmp;


               Nnn := FieldByName('K2O').asFloat;// + dallP;
               //切り上げする
               Nnn := Nnn + 0.9;
                if  Nnn >= 70.0 then begin
                    icode := 6;
                end
                else if Nnn >= 50.0 then begin
                    icode := 5;
                end
                else if Nnn >= 30.0 then begin
                    icode := 4;
                end
                else if Nnn >= 15.0 then begin
                    icode := 3;
                end
                else if Nnn >= 8.0 then begin
                    icode := 2;
                end
                else begin
                    icode := 1;
                end;

                dtmp := Standard.Motohi.K * (Hata_Sehi_K4[icode] / 100.0);
                PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat := dtmp;


               Nnn := FieldByName('MgO').asFloat;// + dallP;
               //切り上げする
               Nnn := Nnn + 0.9;
                if  Nnn >= 45.0 then begin
                    icode := 4;
                end
                else if Nnn >= 25.0 then begin
                    icode := 3;
                end
                else if Nnn >= 10.0 then begin
                    icode := 2;
                end
                else begin
                    icode := 1;
                end;

                dtmp := Standard.Motohi.M * (Hata_Sehi_M4[icode] / 100.0);
                PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量').asFloat := dtmp;






            end;




       end; //2



         if (SakumokuCD = '3') or
           (SakumokuCD = '4') or
           (SakumokuCD = '5')
         then begin
           {施肥標準を施肥標準マスタから取得する}   //NISHI0525
//           Standard := GetSehiValue(PrintModule1.QueryUketuke);
           Standard := GetSehiValue(PrintModule1.ADOQueryUketuke);


    //窒素は、標準量そのまま
    //PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat := Standard.Motohi.N;



    PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat := Standard.Motohi.P;
    PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat := Standard.Motohi.K;



          //苦土
          if Jval.MgO >= 45 then begin

    PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量').asFloat := 0;

          end
          else if Jval.MgO >= 25 then begin

     PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量').asFloat := Standard.Motohi.M;

          end
          else if Jval.MgO >= 10 then begin

     PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量').asFloat := Standard.Motohi.M * 1.3;

          end
          else begin

     PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量').asFloat := Standard.Motohi.M * 1.5;

          end;








    //PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量2').asFloat := Standard.Sehi1.N;
    PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量2').asFloat := Standard.Sehi1.P;
    PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量2').asFloat := Standard.Sehi1.K;

    //PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量3').asFloat := Standard.Sehi2.N;
    PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量3').asFloat := Standard.Sehi2.P;
    PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量3').asFloat := Standard.Sehi2.K;

    PrintModule1.ADOQuerySindan.FieldByName('分施回数').asFloat := Standard.Kaisu;
      end;





    end;


    if PrintModule1.ADOQuerySindan.State = dsEdit then  PrintModule1.ADOQuerySindan.Post();



end;



///////////////////////////////////////////////////////////////////////////
procedure TFSehiSekkei.SehiSekkei2;
//施肥設計 肥料設計
// リン酸,加里の許容範囲　　３０％

// 同じ比率のときは、単価を見る。


var
hhh : String;
hhh2 : String;
//ooo : String;





aCnt : Integer;
i : Integer;
name : String;
stmp : String;

//stmp : String;
sorgN : String;
sorgP : String;
sorgK : String;

orgN : Double;
orgP : Double;
orgK : Double;
orgM : Double;

orgN2 : Double;
orgP2 : Double;
orgK2 : Double;
orgM2 : Double;


orgN3 : Double;
orgP3 : Double;
orgK3 : Double;
orgM3 : Double;

tmpN : Double;
tmpP : Double;
tmpK : Double;
tmpM : Double;

tmpN2 : Double;
tmpP2 : Double;
tmpK2 : Double;

hirituN : Double;
hirituP : Double;
hirituK : Double;
hirituM : Double;

hiritu2N : Double;
hiritu2P : Double;
hiritu2K : Double;
hiritu2M : Double;

hiritu3N : Double;
hiritu3P : Double;
hiritu3K : Double;
hiritu3M : Double;

tanka1, tanka2 : Double;
you1, you2 : DOuble;


btmp : Double;

ooo : Array[0..128] of String;
ooo2 : Array[0..128] of String;


hcount : Integer; //肥料選択カウント
count,count2 : Integer;
aCode : String;

itmp, itmp2 : Integer;

tuihi1 : String;  //追肥肥料
tuihi2 : String;  //追肥肥料



cd1, cd2, cd3 : String;

hhh_0 : String;
haba2 : double;
haba1 : double;
tmpV : double;

begin

   for i := 0 to 128 do begin
       ooo[i] := '';
       ooo2[i] := '';

   end;

  SehiList := TSehiHiryo.Create ;  {施肥肥量リスト}


   JMode_Eko := false;

    //肥料削除
//    for aCnt := 1 to 5 do begin
//        SehiList.DelHiryo(htYuuki,aCnt);
//        SehiList.DelHiryo(htHiryo1,aCnt);
//        SehiList.DelHiryo(htHiryo2,aCnt);
//        SehiList.DelHiryo(htHiryo3,aCnt);
//    end;

    SehiList.Clear;

    for aCnt := 1 to 5 do begin
      if PrintModule1.ADOQuerySindan.State <> dsEdit then PrintModule1.ADOQuerySindan.Edit;
      PrintModule1.ADOQuerySindan.FieldByName('有機'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('有機量'+InttoStr(aCnt)).asFloat := 0;

      PrintModule1.ADOQuerySindan.FieldByName('基肥'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('基肥量'+InttoStr(aCnt)).asFloat := 0;

      PrintModule1.ADOQuerySindan.FieldByName('分施1'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('分施1量'+InttoStr(aCnt)).asFloat := 0;
      PrintModule1.ADOQuerySindan.FieldByName('分施2'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('分施2量'+InttoStr(aCnt)).asFloat := 0;

    end;
    if PrintModule1.ADOQuerySindan.State = dsEdit then
                      PrintModule1.ADOQuerySindan.post;


 //   ListSehiM := TListBox.Create;
 //   ListSehiB := TListBox.Create;
 //   ListSehiB2 := TListBox.Create;

//    ListKasei := TListBox.Create;
//    ListTanpi := TListBox.Create;



    ListSehiM.Items.Clear;
    ListSehiB.Items.Clear;
    ListSehiB2.Items.Clear;

    ListKasei.Items.Clear;
    // 化成リストを登録

    cd1 := PrintModule1.ADOQueryUketuke.FieldByName('作目コード').asString;
    cd2 := PrintModule1.ADOQueryUketuke.FieldByName('作物コード').asString;
    cd3 := PrintModule1.ADOQueryUketuke.FieldByName('作型コード').asString;


    with DataModule1.ADOQSakuhi do begin
      Close;
      SQL.Clear;
      stmp := 'select * from M_SAKHI where 作目コード = "'+cd1+'" and 作物コード = "'+cd2+'" and 作型コード = "'+cd3+'"';
      SQL.Add(stmp);
      open;
      aCnt := 0;
      for i := 1 to 10 do begin
//      while EOF do begin
//        aCnt := aCnt + 1;
        stmp := FieldByName('化成'+inttoStr(i)).asString + GetHiryoName(FieldByName('化成'+inttoStr(i)).asString);
        if stmp <> '' then
            ListKasei.Items.Add(stmp);
        Next;
      end;
      close;
    end;


    ListTanpi.Items.Clear;



    //肥料の保存
    //作物から肥料を検索　（基肥窒素）

    //Copy2_3;

      orgN := PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat; //txtNSet1.Value;
      orgP := PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat; //txtNSet1.Value;
      orgK := PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat; //txtNSet1.Value;
      orgM := PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量').asFloat; //txtNSet1.Value;

      orgN2 := PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量2').asFloat; //txtNSet1.Value;
      orgP2 := PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量2').asFloat; //txtNSet1.Value;
      orgK2 := PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量2').asFloat; //txtNSet1.Value;
      orgM2 := 0; //PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量2').asFloat; //txtNSet1.Value;

      orgN3 := PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量3').asFloat; //txtNSet1.Value;
      orgP3 := PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量3').asFloat; //txtNSet1.Value;
      orgK3 := PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量3').asFloat; //txtNSet1.Value;
      orgM3 := 0; //PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量2').asFloat; //txtNSet1.Value;

{
      if PrintModule1.ADOQueryUketuke.FieldByName('作目コード' ).asString = '6' then begin
        //チモシー 602 60401 60402 60403   2:1      //NISHI0526 作型をみていた
        if (QueryUketuke.FieldByName('作物コード' ).asString = '02') or
           ((QueryUketuke.FieldByName('作物コード' ).asString = '04') and
            ((QueryUketuke.FieldByName('作型コード' ).asString = '01') or
             (QueryUketuke.FieldByName('作型コード' ).asString = '02') or
             (QueryUketuke.FieldByName('作型コード' ).asString = '03')
            )
           )
           then begin
         btmp := orgN;
         orgN := btmp / 3 * 2;
         orgN2 := btmp / 3 * 1;

         btmp := orgK;
         orgK := btmp / 3 * 2;

         orgK2 := btmp / 3 * 1;
       end
        //オーシャード 603 60403 60404 60405   1:1:1
        else if (QueryUketuke.FieldByName('作物コード' ).asString = '03') or
                (QueryUketuke.FieldByName('作物コード' ).asString = '05') or
           ((QueryUketuke.FieldByName('作物コード' ).asString = '04') and
            ((QueryUketuke.FieldByName('作型コード' ).asString = '04') or
             (QueryUketuke.FieldByName('作型コード' ).asString = '05') or
             (QueryUketuke.FieldByName('作型コード' ).asString = '06')
            )
           )
           then begin

         btmp := orgN;
         orgN := btmp / 3 * 1;
         orgN2 := btmp / 3 * 2;
         orgN3 := 0; //btmp / 3 * 2;

         btmp := orgK;
         orgK := btmp / 3 * 1;

         orgK2 := btmp / 3 * 2;
         orgK3 := 0; //btmp / 3 * 2;
       end;
      end;
}


      //微量要素

        hirituN := 1;
        hirituP := 0;
        hirituK := 0;
        hirituM := 0;

        if orgN <> 0 then begin
        hirituP := orgP / orgN;
        hirituK := orgK / orgN;
        hirituM := orgM / orgN;
        end;


        hiritu3K := 999; //hirituK;


    //選択肥料の中から適切なものを選択
    if ListKasei.Items.Count > 0 then begin

        //

          //肥料の比率
        ooo[0] := '';
        hcount := 1;
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //追肥肥料は、飛ばす






             if ((cd1 = '1') and (cd2 = '02'))
                 or ((cd1 = '1') and (cd2 = '03')) then begin
                   if (orgN+orgN2) < 3.5 then begin

                     //側条用のみを選択
                     if GetHiryoT(hhh) = false then continue;

                   end
                   else begin

                     if GetHiryoT(hhh) = true then continue;

                   end;

             end
             else begin

               if GetHiryoT(hhh) = true then continue;

             end;


             //H171220 エコ・ロングは、選択しない
             if (hhh = '1187') or           //エコ・ロングが選択肥料にあった場合
                (hhh = '1191') or
                (hhh = '1208') or
                (hhh = '1236') then begin

                  JMode_Eko := true;
                  continue;
             end;




             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);



             if tmpN < 1 then tmpN := 1;
             hiritu2N := 1;
             hiritu2P := tmpP / tmpN;
             hiritu2K := tmpK / tmpN;
             hiritu2M := tmpM / tmpN;


             //複数選択する。
             if  (abs(hirituK - hiritu2K) <= hiritu3K) and (hiritu2K <> 0 ) then begin
                 if hiritu3K = abs(hirituK - hiritu2K) then begin
                    hcount := hcount + 1;
                 end
                 else begin
                    hcount := 1;
                 end;
                 ooo[hcount - 1] := hhh;
                 hiritu3K := abs(hirituK - hiritu2K); //hiritu2K;
             end;

        end;

        //



        //複数ある場合は、単価で選択。
       //Ｐであわせる
        hhh := '';
        hiritu3P := 999;
        count := 1;
        if hCount = 1 then begin
            ooo2[0] := ooo[0];
        end
        else if hCount > 1 then begin
          for i := 0 to hCount - 1  do begin

             //pであわせたときのリン酸量を求める

             //GetSehi( ooo[i],orgN, tmpN, tmpP, tmpK, tmpM);
             tmpN := GetHiryoN(ooo[i]);
             tmpP := GetHiryoP(ooo[i]);

             //Pがおおきい場合は、省く
 //            if orgP < tmpP then continue;


             hiritu2N := 1;
             hiritu2P := tmpP / tmpN;

             //複数選択する。
             if  (abs(hirituP - hiritu2P) <= hiritu3P) and (hiritu2P <> 0 ) then begin
                 if hiritu3P = abs(hirituP - hiritu2P) then begin
                    count := count + 1;
                 end
                 else begin
                    count := 1;
                 end;
                 ooo2[count - 1] := ooo[i];
                 hiritu3P := abs(hirituP - hiritu2P); //hiritu2K;
             end;



          end;
        end
        else if hCount <> 1 then begin

             ooo2[0]:= '';

        end;

        //Pであわせても複数ある場合は、単価の低い方  H171220
        if count > 1 then begin
                itmp := 999999;
                count2 := 0;
                for i := 0 to count - 1 do begin
                    itmp2 := GetHiryoTanka(ooo[i]);
                    if itmp2 < itmp then begin
                       count2 := i;
                       itmp := itmp2;
                    end;
                end;

                hhh := ooo2[count2];

        end
        else begin
                hhh := ooo2[0];
        end;

       if hhh = '' then exit;    //H170802
//H170110 化成がない場合


             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);
         //NISHI0527 ｄｄｄｄｄ
          tmpN2 := 0;
          tmpP2 := 0;
          tmpK2 := 0;
          if tmpN <> 0 then
            tmpN2 := orgN / tmpN;
          if tmpP <> 0 then
            tmpP2 := orgP / tmpP;
          if tmpK <> 0 then
            tmpK2 := orgK / tmpK;



    //肥料のセット
//    hhh := '1001';
//        PageHiryoSource.ActivePageIndex := 1;
//        PageHiryoDest.ActivePageIndex := 1;
         //どれであわせる大きくなる場合
         if (tmpN2 <= tmpP2) and (tmpN2 <= tmpK2 ) then  begin
             //grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
             SetHiryoList2(smIns,htHiryo1,0,hhh,orgN,1,0);
             // then DspHiryoList(htHiryo1);
         end
         else if (tmpP2 <= tmpN2) and (tmpP2 <= tmpK2 ) then  begin
             //grKasei.ItemIndex := 1; //0窒素　1リン酸 　2加里
             //if SetHiryoList2(smIns,htHiryo1,0,hhh,orgP) then DspHiryoList(htHiryo1);
             SetHiryoList2(smIns,htHiryo1,0,hhh,orgP,1,1);

         end
         else begin
         //if (orgK <= orgN) and (orgK <= orgP ) then
            // grKasei.ItemIndex := 2; //0窒素　1リン酸 　2加里
             SetHiryoList2(smIns,htHiryo1,0,hhh,orgK,1,2); // then DspHiryoList(htHiryo1);
         end;

    end;

 //ZZZZZZZZZZZZ

     //単肥料

     //PageHiryoSource.ActivePageIndex := 2;
     //grTanpi.ItemIndex := 0; //窒素
//     hhh := Copy(ListTanpi.Items[0],1,2);
     hhh := '10'; //硫安
     SetHiryoList2(smIns,htHiryo1,0,hhh,orgN,2,0); // then DspHiryoList(htHiryo1);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);

     //grTanpi.ItemIndex := 1; //リン酸
     //肥料の中から単肥を選択 H171216  //
{
     if QueryUketuke.FieldByName('作目コード' ).asString = '2' then begin
        //春よ恋、ハルユタカ
        if ( QueryUketuke.FieldByName('作物コード' ).asString = '12')
        or ( QueryUketuke.FieldByName('作物コード' ).asString = '13')
         then begin
             hhh := '1006'; //
        end
        else begin
             hhh := '21'; //
        end;
     end
     else begin
             hhh := '21'; //
     end;
}


     hhh := '21'; //

     //     hhh := '1006'; //
     SetHiryoList2(smIns,htHiryo1,0,hhh,orgP,2,1);
     // then DspHiryoList(htHiryo1);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);
//     grTanpi.ItemIndex := 2; //加里
//     hhh := Copy(ListTanpi.Items[1],1,2);
     hhh := '30'; //
     SetHiryoList2(smIns,htHiryo1,0,hhh,orgK,2,2);
     // then DspHiryoList(htHiryo1);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);



     tuihi1 := '';
     tuihi2 := '';


//追肥は、Ｎで合わせる。
    if (orgN2 > 0) then begin //and (orgK2 > 0 ) then begin

       for i := 0 to 128 do begin
          ooo[i] := '';
          ooo2[i] := '';

       end;

        hirituN := 1;
        hirituP := 0;
        hirituK := 0;
//        hirituM := 0;

        if orgN2 <> 0 then begin
        hirituP := orgP2 / orgN2;
        hirituK := orgK2 / orgN2;
//        hirituM := orgM / orgN;
        end;


        hiritu3K := 999; //hirituK;




       //選択肥料の中から適切なものを選択
       if ListKasei.Items.Count > 0 then begin

        //

          //肥料の比率
           ooo[0] := '';
           hcount := 1;

           haba1 := 99999999;
           hhh_0 := '';


           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) <> true then continue;
             if ooo[0] = '' then ooo[0] := hhh;





             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);





      if tmpN > 0.0 then
        tmpV := OrgN2 / (tmpN/100)
      else if tmpK > 0.0 then
        tmpV := OrgK2 / (tmpK/100)
      else if tmpP > 0.0 then
        tmpV := OrgP2 / (tmpP/100);

      tmpN2 := tmpV * (tmpN / 100);

      tmpP2 := tmpV * (tmpP / 100);
      tmpK2 := tmpV * (tmpK / 100);

      haba2 := sqrt( power(OrgN2 - tmpN2,2) + power(OrgP2 - tmpP2,2) + power(OrgK2 - tmpK2,2));
//      haba2 := sqrt( power(Ppp - tmpP2,2) + power(Kkk - tmpK2,2));

      if haba1 >  haba2 then begin
        haba1 := haba2;
        hhh_0 := hhh;
      end;



{------OLD----
             if tmpN < 1 then tmpN := 1;
             hiritu2N := 1;
             hiritu2P := tmpP / tmpN;
             hiritu2K := tmpK / tmpN;
             hiritu2M := tmpM / tmpN;


             //複数選択する。
             if  (abs(hirituK - hiritu2K) <= hiritu3K) and (hiritu2K <> 0 ) then begin
                 if hiritu3K = abs(hirituK - hiritu2K) then begin
                    hcount := hcount + 1;
                 end
                 else begin
                    hcount := 1;
                 end;
                 ooo[hcount - 1] := hhh;
                 hiritu3K := abs(hirituK - hiritu2K); //hiritu2K;
             end;
-----OLD-----}




           end;



//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里

//           hhh := ooo[0];
           hhh := hhh_0;

           if hhh = '' then hhh := '1320';  //硫安
           tuihi1 := hhh;



           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2,1,0);
           // then DspHiryoList(htHiryo1);
//        if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);

        //オーチャードの場合は、単肥を追加 加里のみ

        if PrintModule1.ADOQueryUketuke.FieldByName('作目コード' ).asString = '6' then begin
//           if (QueryUketuke.FieldByName('作物コード' ).asString = '03') or
//              (QueryUketuke.FieldByName('作物コード' ).asString = '03') then begin

//              PageHiryoSource.ActivePageIndex := 2;
//              grTanpi.ItemIndex := 2; //加里
              hhh := '30'; //硫加
              SetHiryoList2(smIns,htHiryo1,0,hhh,orgK+orgK2,2,2);
              // then DspHiryoList(htHiryo1);


//           end;
        end;


        end;
     end
     else if (orgN2 > 0) and (orgK2 <= 0 ) then begin  //単肥　　硫安

//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
           hhh := '1320';   //追肥用硫安　　　10 硫安
           tuihi1 := hhh;
           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2,1,0);
           // then DspHiryoList(htHiryo1);

     end
     else if (orgN2 <= 0) and (orgK2 > 0 ) then begin  //単肥　　硫加

              //PageHiryoSource.ActivePageIndex := 2;
              //grTanpi.ItemIndex := 2; //加里
//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 2; //0窒素　1リン酸 　2加里
              hhh := '1400'; //hhh := '30'; //硫加
              tuihi1 := hhh;
              SetHiryoList2(smIns,htHiryo1,0,hhh,orgK+orgK2,2,2);
              // then DspHiryoList(htHiryo1);

     end;





{ //追肥２はださない
     //追肥２
    if orgN3 > 0 then begin


       for i := 0 to 128 do begin
          ooo[i] := '';
          ooo2[i] := '';

       end;



        hirituN := 1;
        hirituP := 0;
        hirituK := 0;
//        hirituM := 0;

        if orgN2 <> 0 then begin
        hirituP := orgP3 / orgN3;
        hirituK := orgK3 / orgN3;
//        hirituM := orgM / orgN;
        end;


        hiritu3K := 999; //hirituK;


       //選択肥料の中から適切なものを選択
       if ListKasei.Items.Count > 0 then begin

        //

          //肥料の比率
           ooo[0] := '';
           hcount := 1;
           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) <> true then continue;

             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);






             if tmpN < 1 then tmpN := 1;
             hiritu2N := 1;
             hiritu2P := tmpP / tmpN;
             hiritu2K := tmpK / tmpN;
             hiritu2M := tmpM / tmpN;


             //複数選択する。
//             if  (abs(hirituK - hiritu2K) <= hiritu3K) and (hiritu2K <> 0 ) then begin
                 if hiritu3K = abs(hirituK - hiritu2K) then begin
                    hcount := hcount + 1;
                 end
                 else begin
                    hcount := 1;
                 end;
                 ooo[hcount - 1] := hhh;
                 hiritu3K := abs(hirituK - hiritu2K); //hiritu2K;
//             end;

           end;


           hhh := ooo[0];
           tuihi2 := hhh;


//      btmp := txtNSet1.Value;
//      txtNSet1.Value := txtNSet1.Value + txtNSet2.Value;


//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2+orgN3,1,0);
           // then DspHiryoList(htHiryo1);
//        if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);

//      txtNSet1.Value := btmp;

        end;
     end
     else if (orgN3 > 0) and (orgK3 <= 0 ) then begin  //単肥　　硫安

//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
           hhh := '1320';   //追肥用硫安　　　10 硫安
           tuihi1 := hhh;
           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2+orgN3,1,0);
           // then DspHiryoList(htHiryo1);

     end
     else if (orgN3 <= 0) and (orgK3 > 0 ) then begin  //単肥　　硫加

//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 2; //0窒素　1リン酸 　2加里
              hhh := '1400'; //hhh := '30'; //硫加
//              PageHiryoSource.ActivePageIndex := 2;
//              grTanpi.ItemIndex := 2; //加里
//              hhh := '30'; //硫加
           tuihi1 := hhh;
              SetHiryoList2(smIns,htHiryo1,0,hhh,orgK+orgK2+orgK3,1,2);
              // then DspHiryoList(htHiryo1);

     end;
}

    //肥料の保存
    for aCnt := 1 to 5 do begin

        PrintModule1.ADOQuerySindan.Edit;
        stmp := '基肥'+Inttostr(aCnt);
        SetHiryoField (PrintModule1.ADOQuerySindan,'基肥',aCnt,SehiList.GetHiryo(htHiryo1,aCnt)) ;

/////        PrintModule1.ADOQuerySindan.FiledByName(stmp).asString := SehiList.GetHiryo(htHiryo1,aCnt);


    end;




   /////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////////////////////////////////////////////////////////////
    //設計２  金額が一番安いもの
        //選択肥料の中から適切なものを選択
    //PageHiryoSource.ActivePageIndex := 1;
    //PageHiryoDest.ActivePageIndex := 2;

    if ListKasei.Items.Count > 0 then begin



        hhh := '';
        tanka1 := 1000000;
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh2 := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh2 );
             if (name = '') or (name = ' ') then continue;

             //追肥肥料以外は、飛ばす

             if ((cd1 = '1') and (cd2 = '02'))
                 or ((cd1 = '1') and (cd2 = '03')) then begin
                   if (orgN+orgN2) < 3.5 then begin

                     //側条用のみを選択
                     if GetHiryoT(hhh2) = false then continue;

                   end
                   else begin

                     if GetHiryoT(hhh2) = true then continue;

                   end;

             end
             else begin

               if GetHiryoT(hhh2) = true then continue;

             end;






             tmpN2 := GetHiryoN(hhh2);
             tanka2 := GetHiryoTanka(hhh2);
             you2 := GetHiryoV(hhh2);
             if you2 > 0  then begin

               if tmpN2 > 0 then begin  //単価が正確でない為に　施用量の少ないのも
                 btmp := OrgN / (tmpN2 / 100.0);

                 btmp := (btmp / you2) * tanka2;

                 if btmp < tanka1 then begin
                   tanka1 := btmp;
                   hhh := hhh2;
                 end;
               end;
             end;
             //break;
        end;


        //grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
        SetHiryoList2(smIns,htHiryo2,0,hhh,orgN,1,0);


     end;

{
     hhh := '10'; //硫安
     SetHiryoList2(smIns,htHiryo2,0,hhh,orgN,2,0);

     //grTanpi.ItemIndex := 1; //リン酸
     if PrintModule1.ADOQueryUketuke.FieldByName('作目コード' ).asString = '2' then begin
        //春よ恋、ハルユタカ
        if ( PrintModule1.ADOQueryUketuke.FieldByName('作物コード' ).asString = '12')
        or ( PrintModule1.ADOQueryUketuke.FieldByName('作物コード' ).asString = '13')
         then begin
             hhh := '1006'; //
        end
        else begin
             hhh := '21'; //
        end;
     end
     else begin
             hhh := '21'; //
     end;
     SetHiryoList2(smIns,htHiryo2,0,hhh,orgP,2,1);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);
     //grTanpi.ItemIndex := 2; //加里
//     hhh := Copy(ListTanpi.Items[1],1,2);
     hhh := '30'; //
     SetHiryoList2(smIns,htHiryo2,0,hhh,orgK,2,2);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);
}




    if ListKasei.Items.Count > 0 then begin

        hhh := '';

        hhh := '';
        tanka1 := 1000000;
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh2 := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh2 );
             if (name = '') or (name = ' ') then continue;

             //追肥のみ
             if GetHiryoT(hhh2) <> true then continue;


             tmpN2 := GetHiryoN(hhh2);
             tanka2 := GetHiryoTanka(hhh2);
             you2 := GetHiryoV(hhh2);

             if tmpN2 > 0 then begin
               btmp := OrgN2 / (tmpN2 / 100.0);
               btmp := (btmp / you2) * tanka2;

               if btmp < tanka1 then begin
                 tanka1 := btmp;
                 hhh := hhh2;
               end;
             end;

             //break;
        end;

        if hhh = '' then hhh := '1320'; //硫安



        //grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
        SetHiryoList2(smIns,htHiryo2,0,hhh,orgN+orgN2,1,0);


      end;





    //肥料の保存
    for aCnt := 1 to 5 do begin

        PrintModule1.ADOQuerySindan.Edit;
        SetHiryoField (PrintModule1.ADOQuerySindan,'分施1',aCnt,SehiList.GetHiryo(htHiryo2,aCnt)) ;
    end;




   ////////////////////////////////////////////////////////////////////////////////
    //設計3
    ////
    ///
        //選択肥料の中から適切なものを選択
    //PageHiryoSource.ActivePageIndex := 1;
    //PageHiryoDest.ActivePageIndex := 3;



    //春巻き小麦の場合は、設計３は、出力しない
//    if not ((PrintModule1.ADOQueryUketuke.FieldByName('作目コード' ).asString = '2') and
//           ((PrintModule1.ADOQueryUketuke.FieldByName('作物コード' ).asString = '12') or
//            (PrintModule1.ADOQueryUketuke.FieldByName('作物コード' ).asString = '13'))) then begin




    if ListKasei.Items.Count > 0 then begin

         //肥料の比率
        hhh := '';
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) = true then continue;

             break;
        end;




        if( hhh <> '' ) and ( hhh <> ' ') then begin
           //grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN,1,0); // then DspHiryoList(htHiryo3);
        end
        else begin
          //選択する追肥がない
           hhh := '10';
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN,1,0); // then DspHiryoList(htHiryo3);
        end;






        hhh := '';
//       if txtNSet2.Value > 0 then begin

        //追肥
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh2 := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) <> true then continue;

             hhh := hhh2;
             break;
        end;

//        hhh := tuihi1;

        if( hhh <> '' ) and ( hhh <> ' ') then begin
           //PageHiryoSource.ActivePageIndex := 1;
           //PageHiryoDest.ActivePageIndex := 2;
           //grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2,1,0);// then DspHiryoList(htHiryo3);
        end
        else begin
          //選択する追肥がない
           hhh := '1320';
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2,1,0); // then DspHiryoList(htHiryo3);
        end;
//       end;
        hhh := '';
//       if txtNSet3.Value > 0 then begin


        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) <> true then continue;

             break;
        end;

//        hhh := tuihi2;

        if( hhh <> '' ) and ( hhh <> ' ') then begin
           //PageHiryoSource.ActivePageIndex := 1;
           //PageHiryoDest.ActivePageIndex := 2;
           //grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2+orgN3,1,0);// then DspHiryoList(htHiryo3);
        end;
//       end;


       //追肥
         hhh := '';

       if orgN2 > 0 then begin
{
           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) <> true then continue;

             break;
           end;
}
           //選択しないで設計１で選ばれた追肥をそのまま使用
           hhh := tuihi1;

           if( hhh <> '' ) and ( hhh <> ' ') then begin
//              PageHiryoSource.ActivePageIndex := 1;
//              PageHiryoDest.ActivePageIndex := 2;
//              grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
              SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2,1,0);// then DspHiryoList(htHiryo2);
           end;


        end;


        hhh := '';

       if orgN3 > 0 then begin
{
           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) <> true then continue;

             break;
           end;
}
           hhh := tuihi2;

           if( hhh <> '' ) and ( hhh <> ' ') then begin
//              PageHiryoSource.ActivePageIndex := 1;
//              PageHiryoDest.ActivePageIndex := 2;
//              grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
              SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2+orgN3,1,0); // then DspHiryoList(htHiryo2);
           end;
        end;


    end;//ListKasei.Items.Count


//    end; //春巻き小麦の場合は、設計３は、出力しない

    //肥料の保存
    for aCnt := 1 to 5 do begin

        PrintModule1.ADOQuerySindan.Edit;
        SetHiryoField (PrintModule1.ADOQuerySindan,'分施2',aCnt,SehiList.GetHiryo(htHiryo3,aCnt)) ;
    end;





end;

///////////////////////////////////////////////////////////////////////////
procedure TFSehiSekkei.SehiSekkei2_soku;
//施肥設計 肥料設計
// リン酸,加里の許容範囲　　３０％

// 同じ比率のときは、単価を見る。


var
hhh : String;
hhh2 : String;
//ooo : String;





aCnt : Integer;
i : Integer;
name : String;
stmp : String;

//stmp : String;
sorgN : String;
sorgP : String;
sorgK : String;

orgN : Double;
orgP : Double;
orgK : Double;
orgM : Double;

orgN2 : Double;
orgP2 : Double;
orgK2 : Double;
orgM2 : Double;


orgN3 : Double;
orgP3 : Double;
orgK3 : Double;
orgM3 : Double;

tmpN : Double;
tmpP : Double;
tmpK : Double;
tmpM : Double;

tmpN2 : Double;
tmpP2 : Double;
tmpK2 : Double;

hirituN : Double;
hirituP : Double;
hirituK : Double;
hirituM : Double;

hiritu2N : Double;
hiritu2P : Double;
hiritu2K : Double;
hiritu2M : Double;

hiritu3N : Double;
hiritu3P : Double;
hiritu3K : Double;
hiritu3M : Double;

tanka1, tanka2 : Double;
you1, you2 : DOuble;


btmp : Double;

ooo : Array[0..128] of String;
ooo2 : Array[0..128] of String;


hcount : Integer; //肥料選択カウント
count,count2 : Integer;
aCode : String;

itmp, itmp2 : Integer;

tuihi1 : String;  //追肥肥料
tuihi2 : String;  //追肥肥料



cd1, cd2, cd3 : String;

hhh_0 : String;
haba2 : double;
haba1 : double;
tmpV : double;

sokujyou_hhh : String; //側条肥料



begin

   for i := 0 to 128 do begin
       ooo[i] := '';
       ooo2[i] := '';

   end;

  SehiList := TSehiHiryo.Create ;  {施肥肥量リスト}


   JMode_Eko := false;

    //肥料削除
//    for aCnt := 1 to 5 do begin
//        SehiList.DelHiryo(htYuuki,aCnt);
//        SehiList.DelHiryo(htHiryo1,aCnt);
//        SehiList.DelHiryo(htHiryo2,aCnt);
//        SehiList.DelHiryo(htHiryo3,aCnt);
//    end;

    SehiList.Clear;

    for aCnt := 1 to 5 do begin
      if PrintModule1.ADOQuerySindan.State <> dsEdit then PrintModule1.ADOQuerySindan.Edit;
      PrintModule1.ADOQuerySindan.FieldByName('有機'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('有機量'+InttoStr(aCnt)).asFloat := 0;

      PrintModule1.ADOQuerySindan.FieldByName('基肥'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('基肥量'+InttoStr(aCnt)).asFloat := 0;

      PrintModule1.ADOQuerySindan.FieldByName('分施1'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('分施1量'+InttoStr(aCnt)).asFloat := 0;
      PrintModule1.ADOQuerySindan.FieldByName('分施2'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('分施2量'+InttoStr(aCnt)).asFloat := 0;

    end;
    if PrintModule1.ADOQuerySindan.State = dsEdit then
                      PrintModule1.ADOQuerySindan.post;


 //   ListSehiM := TListBox.Create;
 //   ListSehiB := TListBox.Create;
 //   ListSehiB2 := TListBox.Create;

//    ListKasei := TListBox.Create;
//    ListTanpi := TListBox.Create;



    ListSehiM.Items.Clear;
    ListSehiB.Items.Clear;
    ListSehiB2.Items.Clear;

    ListKasei.Items.Clear;
    // 化成リストを登録

    cd1 := PrintModule1.ADOQueryUketuke.FieldByName('作目コード').asString;
    cd2 := PrintModule1.ADOQueryUketuke.FieldByName('作物コード').asString;
    cd3 := PrintModule1.ADOQueryUketuke.FieldByName('作型コード').asString;


    with DataModule1.ADOQSakuhi do begin
      Close;
      SQL.Clear;
      stmp := 'select * from M_SAKHI where 作目コード = "'+cd1+'" and 作物コード = "'+cd2+'" and 作型コード = "'+cd3+'"';
      SQL.Add(stmp);
      open;
      aCnt := 0;
      for i := 1 to 10 do begin
//      while EOF do begin
//        aCnt := aCnt + 1;
        stmp := FieldByName('化成'+inttoStr(i)).asString + GetHiryoName(FieldByName('化成'+inttoStr(i)).asString);
        if stmp <> '' then
            ListKasei.Items.Add(stmp);
        Next;
      end;
      close;
    end;


    ListTanpi.Items.Clear;



    //肥料の保存
    //作物から肥料を検索　（基肥窒素）

    //Copy2_3;

      orgN := PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量').asFloat; //txtNSet1.Value;
      orgP := PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量').asFloat; //txtNSet1.Value;
      orgK := PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量').asFloat; //txtNSet1.Value;
      orgM := PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量').asFloat; //txtNSet1.Value;

      orgN2 := PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量2').asFloat; //txtNSet1.Value;
      orgP2 := PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量2').asFloat; //txtNSet1.Value;
      orgK2 := PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量2').asFloat; //txtNSet1.Value;
      orgM2 := 0; //PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量2').asFloat; //txtNSet1.Value;

      orgN3 := PrintModule1.ADOQuerySindan.FieldByName('N施肥不足量3').asFloat; //txtNSet1.Value;
      orgP3 := PrintModule1.ADOQuerySindan.FieldByName('P施肥不足量3').asFloat; //txtNSet1.Value;
      orgK3 := PrintModule1.ADOQuerySindan.FieldByName('K施肥不足量3').asFloat; //txtNSet1.Value;
      orgM3 := 0; //PrintModule1.ADOQuerySindan.FieldByName('Mg施肥不足量2').asFloat; //txtNSet1.Value;

{
      if PrintModule1.ADOQueryUketuke.FieldByName('作目コード' ).asString = '6' then begin
        //チモシー 602 60401 60402 60403   2:1      //NISHI0526 作型をみていた
        if (QueryUketuke.FieldByName('作物コード' ).asString = '02') or
           ((QueryUketuke.FieldByName('作物コード' ).asString = '04') and
            ((QueryUketuke.FieldByName('作型コード' ).asString = '01') or
             (QueryUketuke.FieldByName('作型コード' ).asString = '02') or
             (QueryUketuke.FieldByName('作型コード' ).asString = '03')
            )
           )
           then begin
         btmp := orgN;
         orgN := btmp / 3 * 2;
         orgN2 := btmp / 3 * 1;

         btmp := orgK;
         orgK := btmp / 3 * 2;

         orgK2 := btmp / 3 * 1;
       end
        //オーシャード 603 60403 60404 60405   1:1:1
        else if (QueryUketuke.FieldByName('作物コード' ).asString = '03') or
                (QueryUketuke.FieldByName('作物コード' ).asString = '05') or
           ((QueryUketuke.FieldByName('作物コード' ).asString = '04') and
            ((QueryUketuke.FieldByName('作型コード' ).asString = '04') or
             (QueryUketuke.FieldByName('作型コード' ).asString = '05') or
             (QueryUketuke.FieldByName('作型コード' ).asString = '06')
            )
           )
           then begin

         btmp := orgN;
         orgN := btmp / 3 * 1;
         orgN2 := btmp / 3 * 2;
         orgN3 := 0; //btmp / 3 * 2;

         btmp := orgK;
         orgK := btmp / 3 * 1;

         orgK2 := btmp / 3 * 2;
         orgK3 := 0; //btmp / 3 * 2;
       end;
      end;
}

// MMMMMMM
//最初に側条用の肥料を求める。
      //微量要素

        hirituN := 1;
        hirituP := 0;
        hirituK := 0;
        hirituM := 0;

        if orgN <> 0 then begin
        hirituP := orgP / orgN;
        hirituK := orgK / orgN;
        hirituM := orgM / orgN;
        end;


        hiritu3K := 999; //hirituK;


    //選択肥料の中から適切なものを選択
 if ListKasei.Items.Count > 0 then begin

        //

          //肥料の比率
        ooo[0] := '';
        hcount := 1;
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //追肥肥料のみ　
             if GetHiryoT(hhh) <> true then continue;


             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);



             if tmpN < 1 then tmpN := 1;
             hiritu2N := 1;
             hiritu2P := tmpP / tmpN;
             hiritu2K := tmpK / tmpN;
             hiritu2M := tmpM / tmpN;


             //複数選択する。
             if  (abs(hirituK - hiritu2K) <= hiritu3K) and (hiritu2K <> 0 ) then begin
                 if hiritu3K = abs(hirituK - hiritu2K) then begin
                    hcount := hcount + 1;
                 end
                 else begin
                    hcount := 1;
                 end;
                 ooo[hcount - 1] := hhh;
                 hiritu3K := abs(hirituK - hiritu2K); //hiritu2K;
             end;

        end; //for

        //



        //複数ある場合は、単価で選択。
       //Ｐであわせる
        hhh := '';
        hiritu3P := 999;
        count := 1;
        if hCount = 1 then begin
            ooo2[0] := ooo[0];
        end
        else if hCount > 1 then begin
          for i := 0 to hCount - 1  do begin

             //pであわせたときのリン酸量を求める

             //GetSehi( ooo[i],orgN, tmpN, tmpP, tmpK, tmpM);
             tmpN := GetHiryoN(ooo[i]);
             tmpP := GetHiryoP(ooo[i]);

             //Pがおおきい場合は、省く
 //            if orgP < tmpP then continue;


             hiritu2N := 1;
             hiritu2P := tmpP / tmpN;

             //複数選択する。
             if  (abs(hirituP - hiritu2P) <= hiritu3P) and (hiritu2P <> 0 ) then begin
                 if hiritu3P = abs(hirituP - hiritu2P) then begin
                    count := count + 1;
                 end
                 else begin
                    count := 1;
                 end;
                 ooo2[count - 1] := ooo[i];
                 hiritu3P := abs(hirituP - hiritu2P); //hiritu2K;
             end;



          end;
        end
        else if hCount <> 1 then begin

             ooo2[0]:= '';

        end;

        //Pであわせても複数ある場合は、単価の低い方  H171220
        if count > 1 then begin
                itmp := 999999;
                count2 := 0;
                for i := 0 to count - 1 do begin
                    itmp2 := GetHiryoTanka(ooo[i]);
                    if itmp2 < itmp then begin
                       count2 := i;
                       itmp := itmp2;
                    end;
                end;

                hhh := ooo2[count2];

        end
        else begin
                hhh := ooo2[0];
        end;

       if hhh = '' then exit;    //H170802
//H170110 化成がない場合


             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);






  end;


  if hhh = '' then exit;    //H170802

  sokujyou_hhh := hhh; //側条肥料を決定

             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);

        //tmpV  orgN2 で　容量を求める

        tmpV := orgN2 / (tmpN / 100);

        orgP2 := tmpV * (tmpP / 100);
        orgP := orgP - orgP2;

        orgK2 := tmpV * (tmpK / 100);
        orgK := orgK - orgK2;






////////////////////////////////////////////////
   for i := 0 to 128 do begin
       ooo[i] := '';
       ooo2[i] := '';

   end;

      //微量要素

        hirituN := 1;
        hirituP := 0;
        hirituK := 0;
        hirituM := 0;

        if orgN <> 0 then begin
        hirituP := orgP / orgN;
        hirituK := orgK / orgN;
        hirituM := orgM / orgN;
        end;


        hiritu3K := 999; //hirituK;


    //選択肥料の中から適切なものを選択
    if ListKasei.Items.Count > 0 then begin

        //

          //肥料の比率
        ooo[0] := '';
        hcount := 1;
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //追肥肥料は、飛ばす
             if GetHiryoT(hhh) = true then continue;
             //H171220 エコ・ロングは、選択しない
             if (hhh = '1187') or           //エコ・ロングが選択肥料にあった場合
                (hhh = '1191') or
                (hhh = '1208') or
                (hhh = '1236') then begin

                  JMode_Eko := true;
                  continue;
             end;




             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);



             if tmpN < 1 then tmpN := 1;
             hiritu2N := 1;
             hiritu2P := tmpP / tmpN;
             hiritu2K := tmpK / tmpN;
             hiritu2M := tmpM / tmpN;


             //複数選択する。
             if  (abs(hirituK - hiritu2K) <= hiritu3K) and (hiritu2K <> 0 ) then begin
                 if hiritu3K = abs(hirituK - hiritu2K) then begin
                    hcount := hcount + 1;
                 end
                 else begin
                    hcount := 1;
                 end;
                 ooo[hcount - 1] := hhh;
                 hiritu3K := abs(hirituK - hiritu2K); //hiritu2K;
             end;

        end;

        //



        //複数ある場合は、単価で選択。
       //Ｐであわせる
        hhh := '';
        hiritu3P := 999;
        count := 1;
        if hCount = 1 then begin
            ooo2[0] := ooo[0];
        end
        else if hCount > 1 then begin
          for i := 0 to hCount - 1  do begin

             //pであわせたときのリン酸量を求める

             //GetSehi( ooo[i],orgN, tmpN, tmpP, tmpK, tmpM);
             tmpN := GetHiryoN(ooo[i]);
             tmpP := GetHiryoP(ooo[i]);

             //Pがおおきい場合は、省く
 //            if orgP < tmpP then continue;


             hiritu2N := 1;
             hiritu2P := tmpP / tmpN;

             //複数選択する。
             if  (abs(hirituP - hiritu2P) <= hiritu3P) and (hiritu2P <> 0 ) then begin
                 if hiritu3P = abs(hirituP - hiritu2P) then begin
                    count := count + 1;
                 end
                 else begin
                    count := 1;
                 end;
                 ooo2[count - 1] := ooo[i];
                 hiritu3P := abs(hirituP - hiritu2P); //hiritu2K;
             end;



          end;
        end
        else if hCount <> 1 then begin

             ooo2[0]:= '';

        end;

        //Pであわせても複数ある場合は、単価の低い方  H171220
        if count > 1 then begin
                itmp := 999999;
                count2 := 0;
                for i := 0 to count - 1 do begin
                    itmp2 := GetHiryoTanka(ooo[i]);
                    if itmp2 < itmp then begin
                       count2 := i;
                       itmp := itmp2;
                    end;
                end;

                hhh := ooo2[count2];

        end
        else begin
                hhh := ooo2[0];
        end;

       if hhh = '' then exit;    //H170802
//H170110 化成がない場合


             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);
         //NISHI0527 ｄｄｄｄｄ
          tmpN2 := 0;
          tmpP2 := 0;
          tmpK2 := 0;
          if tmpN <> 0 then
            tmpN2 := orgN / tmpN;
          if tmpP <> 0 then
            tmpP2 := orgP / tmpP;
          if tmpK <> 0 then
            tmpK2 := orgK / tmpK;



    //肥料のセット
//    hhh := '1001';
//        PageHiryoSource.ActivePageIndex := 1;
//        PageHiryoDest.ActivePageIndex := 1;
         //どれであわせる大きくなる場合
         if (tmpN2 <= tmpP2) and (tmpN2 <= tmpK2 ) then  begin
             //grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
             SetHiryoList2(smIns,htHiryo1,0,hhh,orgN,1,0);
             // then DspHiryoList(htHiryo1);
         end
         else if (tmpP2 <= tmpN2) and (tmpP2 <= tmpK2 ) then  begin
             //grKasei.ItemIndex := 1; //0窒素　1リン酸 　2加里
             //if SetHiryoList2(smIns,htHiryo1,0,hhh,orgP) then DspHiryoList(htHiryo1);
             SetHiryoList2(smIns,htHiryo1,0,hhh,orgP,1,1);

         end
         else begin
         //if (orgK <= orgN) and (orgK <= orgP ) then
            // grKasei.ItemIndex := 2; //0窒素　1リン酸 　2加里
             SetHiryoList2(smIns,htHiryo1,0,hhh,orgK,1,2); // then DspHiryoList(htHiryo1);
         end;

    end;

 //ZZZZZZZZZZZZ

     //単肥料

     //PageHiryoSource.ActivePageIndex := 2;
     //grTanpi.ItemIndex := 0; //窒素
//     hhh := Copy(ListTanpi.Items[0],1,2);
     hhh := '10'; //硫安
     SetHiryoList2(smIns,htHiryo1,0,hhh,orgN,2,0); // then DspHiryoList(htHiryo1);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);

     //grTanpi.ItemIndex := 1; //リン酸
     //肥料の中から単肥を選択 H171216  //
{
     if QueryUketuke.FieldByName('作目コード' ).asString = '2' then begin
        //春よ恋、ハルユタカ
        if ( QueryUketuke.FieldByName('作物コード' ).asString = '12')
        or ( QueryUketuke.FieldByName('作物コード' ).asString = '13')
         then begin
             hhh := '1006'; //
        end
        else begin
             hhh := '21'; //
        end;
     end
     else begin
             hhh := '21'; //
     end;
}


     hhh := '21'; //

     //     hhh := '1006'; //
     SetHiryoList2(smIns,htHiryo1,0,hhh,orgP,2,1);
     // then DspHiryoList(htHiryo1);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);
//     grTanpi.ItemIndex := 2; //加里
//     hhh := Copy(ListTanpi.Items[1],1,2);
     hhh := '30'; //
     SetHiryoList2(smIns,htHiryo1,0,hhh,orgK,2,2);
     // then DspHiryoList(htHiryo1);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);



     tuihi1 := '';
     tuihi2 := '';


//追肥は、Ｎで合わせる。
    if (orgN2 > 0) then begin //and (orgK2 > 0 ) then begin

       for i := 0 to 128 do begin
          ooo[i] := '';
          ooo2[i] := '';

       end;

        hirituN := 1;
        hirituP := 0;
        hirituK := 0;
//        hirituM := 0;

        if orgN2 <> 0 then begin
        hirituP := orgP2 / orgN2;
        hirituK := orgK2 / orgN2;
//        hirituM := orgM / orgN;
        end;


        hiritu3K := 999; //hirituK;




       //選択肥料の中から適切なものを選択
       if ListKasei.Items.Count > 0 then begin

        //

          //肥料の比率
           ooo[0] := '';
           hcount := 1;

           haba1 := 99999999;
           hhh_0 := '';


           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) <> true then continue;
             if ooo[0] = '' then ooo[0] := hhh;





             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);





      if tmpN > 0.0 then
        tmpV := OrgN2 / (tmpN/100)
      else if tmpK > 0.0 then
        tmpV := OrgK2 / (tmpK/100)
      else if tmpP > 0.0 then
        tmpV := OrgP2 / (tmpP/100);

      tmpN2 := tmpV * (tmpN / 100);

      tmpP2 := tmpV * (tmpP / 100);
      tmpK2 := tmpV * (tmpK / 100);

      haba2 := sqrt( power(OrgN2 - tmpN2,2) + power(OrgP2 - tmpP2,2) + power(OrgK2 - tmpK2,2));
//      haba2 := sqrt( power(Ppp - tmpP2,2) + power(Kkk - tmpK2,2));

      if haba1 >  haba2 then begin
        haba1 := haba2;
        hhh_0 := hhh;
      end;



{------OLD----
             if tmpN < 1 then tmpN := 1;
             hiritu2N := 1;
             hiritu2P := tmpP / tmpN;
             hiritu2K := tmpK / tmpN;
             hiritu2M := tmpM / tmpN;


             //複数選択する。
             if  (abs(hirituK - hiritu2K) <= hiritu3K) and (hiritu2K <> 0 ) then begin
                 if hiritu3K = abs(hirituK - hiritu2K) then begin
                    hcount := hcount + 1;
                 end
                 else begin
                    hcount := 1;
                 end;
                 ooo[hcount - 1] := hhh;
                 hiritu3K := abs(hirituK - hiritu2K); //hiritu2K;
             end;
-----OLD-----}




           end;



//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里

//           hhh := ooo[0];
           hhh := hhh_0;

           if hhh = '' then hhh := '1320';  //硫安
           tuihi1 := hhh;



           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2,1,0);
           // then DspHiryoList(htHiryo1);
//        if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);

        //オーチャードの場合は、単肥を追加 加里のみ

        if PrintModule1.ADOQueryUketuke.FieldByName('作目コード' ).asString = '6' then begin
//           if (QueryUketuke.FieldByName('作物コード' ).asString = '03') or
//              (QueryUketuke.FieldByName('作物コード' ).asString = '03') then begin

//              PageHiryoSource.ActivePageIndex := 2;
//              grTanpi.ItemIndex := 2; //加里
              hhh := '30'; //硫加
              SetHiryoList2(smIns,htHiryo1,0,hhh,orgK+orgK2,2,2);
              // then DspHiryoList(htHiryo1);


//           end;
        end;


        end;
     end
     else if (orgN2 > 0) and (orgK2 <= 0 ) then begin  //単肥　　硫安

//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
           hhh := '1320';   //追肥用硫安　　　10 硫安
           tuihi1 := hhh;
           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2,1,0);
           // then DspHiryoList(htHiryo1);

     end
     else if (orgN2 <= 0) and (orgK2 > 0 ) then begin  //単肥　　硫加

              //PageHiryoSource.ActivePageIndex := 2;
              //grTanpi.ItemIndex := 2; //加里
//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 2; //0窒素　1リン酸 　2加里
              hhh := '1400'; //hhh := '30'; //硫加
              tuihi1 := hhh;
              SetHiryoList2(smIns,htHiryo1,0,hhh,orgK+orgK2,2,2);
              // then DspHiryoList(htHiryo1);

     end;





{ //追肥２はださない
     //追肥２
    if orgN3 > 0 then begin


       for i := 0 to 128 do begin
          ooo[i] := '';
          ooo2[i] := '';

       end;



        hirituN := 1;
        hirituP := 0;
        hirituK := 0;
//        hirituM := 0;

        if orgN2 <> 0 then begin
        hirituP := orgP3 / orgN3;
        hirituK := orgK3 / orgN3;
//        hirituM := orgM / orgN;
        end;


        hiritu3K := 999; //hirituK;


       //選択肥料の中から適切なものを選択
       if ListKasei.Items.Count > 0 then begin

        //

          //肥料の比率
           ooo[0] := '';
           hcount := 1;
           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) <> true then continue;

             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);






             if tmpN < 1 then tmpN := 1;
             hiritu2N := 1;
             hiritu2P := tmpP / tmpN;
             hiritu2K := tmpK / tmpN;
             hiritu2M := tmpM / tmpN;


             //複数選択する。
//             if  (abs(hirituK - hiritu2K) <= hiritu3K) and (hiritu2K <> 0 ) then begin
                 if hiritu3K = abs(hirituK - hiritu2K) then begin
                    hcount := hcount + 1;
                 end
                 else begin
                    hcount := 1;
                 end;
                 ooo[hcount - 1] := hhh;
                 hiritu3K := abs(hirituK - hiritu2K); //hiritu2K;
//             end;

           end;


           hhh := ooo[0];
           tuihi2 := hhh;


//      btmp := txtNSet1.Value;
//      txtNSet1.Value := txtNSet1.Value + txtNSet2.Value;


//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2+orgN3,1,0);
           // then DspHiryoList(htHiryo1);
//        if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);

//      txtNSet1.Value := btmp;

        end;
     end
     else if (orgN3 > 0) and (orgK3 <= 0 ) then begin  //単肥　　硫安

//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
           hhh := '1320';   //追肥用硫安　　　10 硫安
           tuihi1 := hhh;
           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2+orgN3,1,0);
           // then DspHiryoList(htHiryo1);

     end
     else if (orgN3 <= 0) and (orgK3 > 0 ) then begin  //単肥　　硫加

//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 2; //0窒素　1リン酸 　2加里
              hhh := '1400'; //hhh := '30'; //硫加
//              PageHiryoSource.ActivePageIndex := 2;
//              grTanpi.ItemIndex := 2; //加里
//              hhh := '30'; //硫加
           tuihi1 := hhh;
              SetHiryoList2(smIns,htHiryo1,0,hhh,orgK+orgK2+orgK3,1,2);
              // then DspHiryoList(htHiryo1);

     end;
}

    //肥料の保存
    for aCnt := 1 to 5 do begin

        PrintModule1.ADOQuerySindan.Edit;
        stmp := '基肥'+Inttostr(aCnt);
        SetHiryoField (PrintModule1.ADOQuerySindan,'基肥',aCnt,SehiList.GetHiryo(htHiryo1,aCnt)) ;

/////        PrintModule1.ADOQuerySindan.FiledByName(stmp).asString := SehiList.GetHiryo(htHiryo1,aCnt);


    end;




   /////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////////////////////////////////////////////////////////////
    //設計２  金額が一番安いもの
        //選択肥料の中から適切なものを選択
    //PageHiryoSource.ActivePageIndex := 1;
    //PageHiryoDest.ActivePageIndex := 2;

    if ListKasei.Items.Count > 0 then begin



        hhh := '';
        tanka1 := 1000000;
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh2 := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh2 );
             if (name = '') or (name = ' ') then continue;

             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh2) = true then continue;


             tmpN2 := GetHiryoN(hhh2);
             tanka2 := GetHiryoTanka(hhh2);
             you2 := GetHiryoV(hhh2);
             if you2 > 0  then begin

               if tmpN2 > 0 then begin  //単価が正確でない為に　施用量の少ないのも
                 btmp := OrgN / (tmpN2 / 100.0);

                 btmp := (btmp / you2) * tanka2;

                 if btmp < tanka1 then begin
                   tanka1 := btmp;
                   hhh := hhh2;
                 end;
               end;
             end;
             //break;
        end;


        //grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
        SetHiryoList2(smIns,htHiryo2,0,hhh,orgN,1,0);


     end;

{
     hhh := '10'; //硫安
     SetHiryoList2(smIns,htHiryo2,0,hhh,orgN,2,0);

     //grTanpi.ItemIndex := 1; //リン酸
     if PrintModule1.ADOQueryUketuke.FieldByName('作目コード' ).asString = '2' then begin
        //春よ恋、ハルユタカ
        if ( PrintModule1.ADOQueryUketuke.FieldByName('作物コード' ).asString = '12')
        or ( PrintModule1.ADOQueryUketuke.FieldByName('作物コード' ).asString = '13')
         then begin
             hhh := '1006'; //
        end
        else begin
             hhh := '21'; //
        end;
     end
     else begin
             hhh := '21'; //
     end;
     SetHiryoList2(smIns,htHiryo2,0,hhh,orgP,2,1);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);
     //grTanpi.ItemIndex := 2; //加里
//     hhh := Copy(ListTanpi.Items[1],1,2);
     hhh := '30'; //
     SetHiryoList2(smIns,htHiryo2,0,hhh,orgK,2,2);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);
}




    if ListKasei.Items.Count > 0 then begin

        hhh := '';

        hhh := '';
        tanka1 := 1000000;
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh2 := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh2 );
             if (name = '') or (name = ' ') then continue;

             //追肥のみ
             if GetHiryoT(hhh2) <> true then continue;


             tmpN2 := GetHiryoN(hhh2);
             tanka2 := GetHiryoTanka(hhh2);
             you2 := GetHiryoV(hhh2);

             if tmpN2 > 0 then begin
               btmp := OrgN2 / (tmpN2 / 100.0);
               btmp := (btmp / you2) * tanka2;

               if btmp < tanka1 then begin
                 tanka1 := btmp;
                 hhh := hhh2;
               end;
             end;

             //break;
        end;

        if hhh = '' then hhh := '1320'; //硫安



        //grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
        SetHiryoList2(smIns,htHiryo2,0,hhh,orgN+orgN2,1,0);


      end;





    //肥料の保存
    for aCnt := 1 to 5 do begin

        PrintModule1.ADOQuerySindan.Edit;
        SetHiryoField (PrintModule1.ADOQuerySindan,'分施1',aCnt,SehiList.GetHiryo(htHiryo2,aCnt)) ;
    end;




   ////////////////////////////////////////////////////////////////////////////////
    //設計3
    ////
    ///
        //選択肥料の中から適切なものを選択
    //PageHiryoSource.ActivePageIndex := 1;
    //PageHiryoDest.ActivePageIndex := 3;



    //春巻き小麦の場合は、設計３は、出力しない
//    if not ((PrintModule1.ADOQueryUketuke.FieldByName('作目コード' ).asString = '2') and
//           ((PrintModule1.ADOQueryUketuke.FieldByName('作物コード' ).asString = '12') or
//            (PrintModule1.ADOQueryUketuke.FieldByName('作物コード' ).asString = '13'))) then begin




    if ListKasei.Items.Count > 0 then begin

         //肥料の比率
        hhh := '';
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) = true then continue;

             break;
        end;




        if( hhh <> '' ) and ( hhh <> ' ') then begin
           //grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN,1,0); // then DspHiryoList(htHiryo3);
        end
        else begin
          //選択する追肥がない
           hhh := '10';
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN,1,0); // then DspHiryoList(htHiryo3);
        end;






        hhh := '';
//       if txtNSet2.Value > 0 then begin

        //追肥
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh2 := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) <> true then continue;

             hhh := hhh2;
             break;
        end;

//        hhh := tuihi1;

        if( hhh <> '' ) and ( hhh <> ' ') then begin
           //PageHiryoSource.ActivePageIndex := 1;
           //PageHiryoDest.ActivePageIndex := 2;
           //grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2,1,0);// then DspHiryoList(htHiryo3);
        end
        else begin
          //選択する追肥がない
           hhh := '1320';
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2,1,0); // then DspHiryoList(htHiryo3);
        end;
//       end;
        hhh := '';
//       if txtNSet3.Value > 0 then begin


        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) <> true then continue;

             break;
        end;

//        hhh := tuihi2;

        if( hhh <> '' ) and ( hhh <> ' ') then begin
           //PageHiryoSource.ActivePageIndex := 1;
           //PageHiryoDest.ActivePageIndex := 2;
           //grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2+orgN3,1,0);// then DspHiryoList(htHiryo3);
        end;
//       end;


       //追肥
         hhh := '';

       if orgN2 > 0 then begin
{
           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) <> true then continue;

             break;
           end;
}
           //選択しないで設計１で選ばれた追肥をそのまま使用
           hhh := tuihi1;

           if( hhh <> '' ) and ( hhh <> ' ') then begin
//              PageHiryoSource.ActivePageIndex := 1;
//              PageHiryoDest.ActivePageIndex := 2;
//              grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
              SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2,1,0);// then DspHiryoList(htHiryo2);
           end;


        end;


        hhh := '';

       if orgN3 > 0 then begin
{
           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //追肥肥料以外は、飛ばす
             if GetHiryoT(hhh) <> true then continue;

             break;
           end;
}
           hhh := tuihi2;

           if( hhh <> '' ) and ( hhh <> ' ') then begin
//              PageHiryoSource.ActivePageIndex := 1;
//              PageHiryoDest.ActivePageIndex := 2;
//              grKasei.ItemIndex := 0; //0窒素　1リン酸 　2加里
              SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2+orgN3,1,0); // then DspHiryoList(htHiryo2);
           end;
        end;


    end;//ListKasei.Items.Count


//    end; //春巻き小麦の場合は、設計３は、出力しない

    //肥料の保存
    for aCnt := 1 to 5 do begin

        PrintModule1.ADOQuerySindan.Edit;
        SetHiryoField (PrintModule1.ADOQuerySindan,'分施2',aCnt,SehiList.GetHiryo(htHiryo3,aCnt)) ;
    end;





end;









{診断テーブル．肥料明細（１－5）の登録、削除処理
  aMode : smIns 追加、 smDel 削除
  aHiryo : htYuuki 有機, htHiryo1,2,3
  aDelNum :　削除時削除番号（１－）
  aCode : 追加時追加肥料コード
}
function TFSehiSekkei.SetHiryoList( aMode :TSetMode; aHiryo :THiryoType  ; aDelNum: integer ; aCode: string ):Boolean;
var
  aNum,aIndex : integer ;    {登録できた配列番号}
  aSetVal,aValue : double ;
//  stmp : String;
begin
  result := False ;

  //ウィンドウの描画を完了する。
//  Application.ProcessMessages();
//stmp := txtNSet1.Text;


end;
//////
//
//
//  type1  0:有機 1:化成 2:単肥   使用していない
//  type2  1:N 2:P 3:K 4 :M
//
function TFSehiSekkei.SetHiryoList2( aMode :TSetMode; aHiryo :THiryoType  ; aDelNum: integer ; aCode: string; aSetVal : double;type1 : Integer;Type2 : integer ):Boolean;
var
  aNum,aIndex : integer ;    {登録できた配列番号}
  aValue : double ;
//  stmp : String;
begin
  result := False ;

  //ウィンドウの描画を完了する。
//  Application.ProcessMessages();
//stmp := txtNSet1.Text;

  case aMode of
  smIns:begin
    aNum := SehiList.SetHiryo(aHiryo,aCode,0,false); //IsKazan );
    if aNum > 0 then begin
      {目標値を画面の状態から割り出す}
//      aSetVal := 0;
//      aIndex := 0 ;
//      case type1 of   {どの肥料種か}
//      0: {有機} aIndex := 0;  {有機の場合は全て窒素で計算}
//      1: {化成} aIndex := grKasei.ItemIndex;
//      2: {単肥} aIndex := grTanpi.ItemIndex;
//      end;
      {施容量を算出する}
      aValue := SehiList.CalcValue(aHiryo,aNum,aSetVal,type2+1);
      if aValue > 0.001 then begin
//         aNum := SehiList.SetHiryo(aHiryo,aCode,0,IsKazan );

         SehiList.SetValue(aHiryo,aNum,aValue);
      end
      else begin
         aDelNum := aNum;
         SehiList.DelHiryo(aHiryo,aDelNum );
      end;
   end;


    result := aNum > 0 ;
  end;
  smDel:begin
    SehiList.DelHiryo(aHiryo,aDelNum );
    result := True ;
  end;
  end;



end;

{指定フィールドの条件付きデータ書き込み。}
procedure TFSehiSekkei.SetHiryoField( DataSet: TDataSet; aField : string; aCnt : integer ;aRecHiryo : TRecHiryo );
begin
  if aRecHiryo.CD <> '' then begin
    DataSet.FieldByName(aField+InttoStr(aCnt)).asString :=  aRecHiryo.CD ;
    DataSet.FieldByName(aField+'量'+InttoStr(aCnt)).asFloat :=  aRecHiryo.V ;
  end else begin
    DataSet.FieldByName(aField+InttoStr(aCnt)).Clear ;
    DataSet.FieldByName(aField+'量'+InttoStr(aCnt)).Clear ;
  end;
end;



end.

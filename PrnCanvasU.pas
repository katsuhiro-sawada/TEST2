unit PrnCanvasU;



interface



uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Variants,
  Db, DBTables,PreviewU,AobutU, ADODB;




type
  TPrintModule1 = class(TDataModule)
    ds1: TDataSource;
    ADOQueryUketuke: TADOQuery;
    ADOQuerySindan: TADOQuery;
    ADOQueryKijun: TADOQuery;
    ADOQueryDokaizai: TADOQuery;
    ADOQSehik: TADOQuery;
    ADOQtmp: TADOQuery;
    ADOQtmp2: TADOQuery;
    ADOSinCom: TADOTable;
    ADOQTJ: TADOQuery;
    ADOQTJKITA: TADOQuery;
    ADOK_SUI: TADOTable;
    ADOTHeikin: TADOQuery;
    ADOQueryDokaizai2: TADOQuery;
    ADOQKasei: TADOQuery;
    ADOQKasei2: TADOQuery;
    ADOKasei3: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ds1DataChange(Sender: TObject; Field: TField);
  private
		{ Private 宣言 }


  public
    { Public 宣言 }
  end;

type JCmtVal = record
    SNO : String;

    renraku : String;

    Sakumoku : String;
    Sakucd : String;
    SakuSyurui : String;
    SakugataCD : String;

    DojyouCD: String;
    DoseiCD: String;
    FusyokuCD: String;

    pH : Double;
    pHMin : Double;
    pHMax : Double;
    EC : Double;
    ECMin : Double;
    ECMax : Double;

    CaO : Double;
    CaOMin : Double;
    CaOMax : Double;

    K2O : Double;
    K2OMin : Double;
    K2OMax : Double;
    MgO : Double;
    MgOMin : Double;
    MgOMax : Double;
    P : Double;
    PMin : Double;
    PMax : Double;
    RinsanRiyou : DOuble;

    NN : Double;   //窒素　仕様する窒素
    NNMin : Double;
    NNMax : Double;


    AN : Double;

    Fe : Double;

    Fusyoku : Double;   //腐植

    CEC : Double;
    //CECMin : Double;  //CECの基準値なし
    //CECMax : Double;

    KudoHouwa : Double;
    KudoHouwaMax : Double;

    Karihouwa : Double;  //加里飽和
    KarihouwaMax : Double;

    SekkaiHouwa : Double;
    SekkaiHouwaMax : Double;

    SekkaiKudo : Double;
    SekkaiKudoMin : Double;
    SekkaiKudoMax : Double;
    KudoKari : DOuble;
    KudoKariMin : DOuble;
    KudoKariMax : DOuble;

    EnkiHouwa : Double;
    EnkiHouwaMin : Double;
    EnkiHouwaMax : Double;

    DokaiGNo : String; //土改材のグループ番号


    CECFlg : Boolean; //土性からのCEC想定　True　01
    Flg_EnkiCa : Boolean; //塩基バランス　石灰   02
    Flg_EnkiMg : Boolean;                  //03
    Flg_EnkiCaMg : Boolean;                //04
    Flg_OneT : Boolean;  //ワンタッチ肥料  05

    Flg_Taihi : Boolean;  //堆肥　　11
    Flg_Dosin : Boolean;  //土壌診断　堆肥なし　　12
    Flg_Fusoku: Boolean;  //不足する冬季　　13
    Flg_FusokuMsg : String;

    Flg_Max : Boolean;  //最大値を超えた場合 14
    Flg_MaxMsg : String;

    Flg_Sehi : Boolean;  //窒素を分析していないとき等は、施肥を表示しない。

    tankaru : Double;  //炭カル施用量

    PrnLeftX : integer;  //印刷の左マージ　施肥設計のみ


  end;

{
type JCmtVal2 = record

    PCount : Integer;  //出力個数

    SNo : String;
    Sakumoku : String;
    Dojyou : String;
    SakuSyurui : String;

    pH : double;
    pHMin : Double;
    pHMax : Double;
    pHMark : String; // マーク

    EC : Double;
    ECMin : Double;
    ECMax : Double;
    ECMark : String; // マーク

    CaO : Double;
    CaOMin : Double;
    CaOMax : Double;
    CaOMark : String; // マーク

    MgO : Double;
    MgOMin : Double;
    MgOMax : Double;
    MgOMark : String; // マーク
//20
    K2O : Double;
    K2OMin : Double;
    K2OMax : Double;
    K2OMark : String; // マーク

    P : Double;
    PMin : Double;
    PMax : Double;
    PMark : String; // マーク
    RinsanRiyou : DOuble;

//    AN : array [1..2] of Double;   //
//    NetuN : array [1..2] of Double;   //
//    KaN : array [1..2] of Double;   //
    N : Double;   //硝酸態窒素
    NMark : String; // マーク





    Fe : Double;
    FeMin : Double;
    FeMax : Double;
    FeMark : String; // マーク
    Kei : Double;
    KeiMin : Double;
    KeiMax : Double;
    KeiMark : String; // マーク


    CEC : Double;
//40
    Karihouwa : Double;  //加里飽和

    Fu : Double;   //腐植
    FuMin : Double;   //腐植
    FuMax : Double;   //腐植
    FuMark : String; // マーク


    KudoHouwa : Double;

    SekkaiHouwa : Double;
    SekkaiKudo : Double;
    SekkaiKudoMin : Double;
    SekkaiKudoMax : Double;
    SekkaiKudoMark : String; // マーク

    KudoKari : DOuble;
    KudoKariMin : DOuble;
    KudoKariMax : DOuble;
    KudoKariMark : String; // マーク

    EnkiHouwa : Double;
    EnkiHouwaMin : Double;
    EnkiHouwaMax : Double;
    EnkiHouwaMark : String; // マーク

    DokaiGNo : String; //土改材のグループ番号
//60

    CECFlg : Boolean; //土性からのCEC想定　True　01
    Flg_EnkiCa : Boolean; //塩基バランス　石灰   02
    Flg_EnkiMg : Boolean;                  //03
    Flg_EnkiCaMg : Boolean;                //04
    Flg_OneT : Boolean;  //ワンタッチ肥料  05

    Flg_Taihi : Boolean;  //堆肥　　11
    Flg_Dosin : Boolean;  //土壌診断　堆肥なし　　12
    Flg_Fusoku: Boolean;  //不足する冬季　　13
    Flg_FusokuMsg : String;

    Flg_Max : Boolean;  //最大値を超えた場合 14
    Flg_MaxMsg : String;


  end;
}



var
  JVal : JCmtVal;
  //JVal2 : array [1..3] of JCmtVal2;

	PrintModule1 : TPrintModule1;
	CurLine : Integer;

function PriDBGet( inp1 : Integer; inp2 : Integer; out1 : string ):Integer;  ///SHIBUTA

function JKenCmtGet( val : JCmtVal) : String;

//function JKenCmtGet( dosei : String; count : integer) : String;
//function DokaiVolume( aCode: string ; aValue : double;
//      var pVolP: double; var pVolMg: double; var pVolpH: double;var pVolKei : Double;Var kakaku : Integer): double;

procedure SiryouSub( kou1 : String;kou2 : String;kou3 : String;dbkou : String; PriDBL1 : double;SentoXX : Integer; WorkXXYY : Integer; TateHabaYo : Integer );

//procedure BarGlaAll( ans : Double; mode : Integer;sAns : String; var NsY : Integer; typCEC : String; XX1, YY1 : Integer );

//procedure BarGlaAll( ans : Double; mode : Integer;sAns : String; NsY : Integer; typCEC : String; XX1, YY1 : Integer; hyouji : Boolean );



procedure BarGlaAba( ans : Double; sKou : String; sY : Integer; typCEC : String );
procedure BarGla_naie( ans : Double; sKou : String; dhaba : Integer; typCEC : String; XX1, YY1 : Integer );
procedure BarGla( ans : Double; sAns : String; sY : Integer; typCEC : String; XX1, YY1 : Integer );


procedure kijyunbar( kou : string; CurLine : integer );
function shindan_top(CurLine : Integer):integer;

procedure kijyunbar2( kou : string; CurLine : integer );


//function PrintSindan( prmDeviceType : TDeviceType; pCondition : string; PageCnt : Integer; var KeyCode :string  ):boolean;
function PrintSindan( prmDeviceType : TDeviceType; pCondition : string; PageCnt : Integer; var KeyCode :string  ):boolean;

//function PrintSindan3( prmDeviceType : TDeviceType; pCondition : string; PageCnt : Integer; var KeyCode :string  ):boolean;

function PrintSekkei(prmDeviceType : TDeviceType; pCondition : string; PageCnt : Integer ; var KeyCode :string):boolean;


//function PrintSekkei2(prmDeviceType : TDeviceType; pCondition : string; PageCnt : Integer ; var KeyCode :string  ):Boolean;
//function PrintSekkei3(prmDeviceType : TDeviceType; pCondition : string; PageCnt : Integer ; var KeyCode :string):boolean;
//function MakeKijunMark(cnt : integer;aFieldName : string ) : string;
//function MakeKijunStr( cnt : Integer;aDataSet : TDataSet; aFieldName : string; aPrec : integer ) : string;
function MakeKijunStr( aDataSet : TDataSet; aFieldName : string; aPrec : integer ) : string;
function GetGrfMax( pFieldName : string  ) : double ;
function GetScale( pValue : double ; pFieldName : string  ) : double ;
//function GetScale2( pValue : double ; pFieldName : string; typCEC : string    ) : double ;
function GetDokaizaiName( pCode : string ): string ;
function GetDokaizaiName001( pgrp : string; pCode : string ): string ;

function Bunseki_Hantei( min: Double; max: Double; ans : Double ) : String;

procedure Sokujyou( n : Double; f : Double; var btmp : Double; var btmp2 : Double );

implementation


uses
	DMU, MainU, DojouU, USehiSekkei;

{$R *.DFM}
const
	RightEnd = 180;  {印刷右端＝固定のほうが矩形が同じになる}
  CIRCLEGRFMAXSIZE = 25; //30;	{円グラフグラフ上限半径mm}
  CIRCLEMAXSIZE = 18; //20;	{円グラフ上限半径mm}
  CIRCLEMINSIZE = 7; //10;	{円グラフ下限半径mm}

  //牧草　加里　施肥倍率
  Sokuj : array [1..8, 1..8] of double =
    ((  0,  0,  0,  0,  0,  0,  0,  0), //
     (  0,  0, 20, 30, 50, 50, 50, 60), //
     (  0, 20, 30, 50, 50, 50, 60, 60), //
     ( 20, 30, 30, 50, 50, 60, 70, 70), //
     ( 30, 30, 50, 50, 60, 60, 70,100), //
     ( 30, 50, 50, 60, 60, 70,100,100), //
     ( 30, 50, 60, 60, 70,100,100,100), //
     ( 30, 50, 70, 70,100,100,100,100)); //



procedure TPrintModule1.DataModuleCreate(Sender: TObject);
begin
//
end;

procedure TPrintModule1.DataModuleDestroy(Sender: TObject);
begin
//
end;


procedure TPrintModule1.ds1DataChange(Sender: TObject; Field: TField);
begin

end;

//SHIBUTA-KANSU
function PriDBGet( inp1 : Integer; inp2 : Integer; out1 : string ): Integer;
begin





//
result := 1;
end;

//数値を文字列に変換してから数値に戻す
function FtoStrtoF( ans : Double; imode : integer) : double;
var
stmp : String;
btmp : Double;
begin

   stmp := Format('%.*f',[imode,ans]);
   //stmp := Format('%.*n',[imode,ans]);  //1000を超えると,が入るので０になる
   btmp := StrToFloatDef(stmp, 0.0);
   result := btmp;

end;




//条件コマンド判定
function JKenCmtGet( val : JCmtVal) : String;
var
stmp : String;
scmt : String;
i : Integer;
flg1 : Integer;
flg2 : Integer;
flg3 : Integer;
flg4 : Integer;
flg5 : Integer;
flg6 : Integer;
flg7 : Integer;

min1, max1, ans1 : Double;
min2, max2, ans2 : Double;
min3, max3, ans3, btmp : Double;
saku : String;
sakumotu : String;
begin
  scmt := '';
  with PrintModule1.ADOQTJ do begin
   open;
   first;
   while not eof do begin

//   for i := 1 to RecordCount do begin
//        if FieldByName('作物').AsString = val.Sakumoku then begin

           if FieldByName('項目１').AsString = 'pH' then begin
                min1 := val.pHMin;
                max1 := val.pHMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.pH;
           end
           else if FieldByName('項目１').AsString = 'EC' then begin
                min1 := val.ECMin;
                max1 := val.ECMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.EC;

           end
           else if FieldByName('項目１').AsString = 'MgO' then begin
                min1 := val.MgOMin;
                max1 := val.MgOMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.MgO;

           end
           else if FieldByName('項目１').AsString = 'K2O' then begin
                min1 := val.K2OMin;
                max1 := val.K2OMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.K2O;
           end
           else if FieldByName('項目１').AsString = 'P' then begin
                min1 := val.PMin;
                max1 := val.PMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.P;

           end
           else if FieldByName('項目１').AsString = '塩基飽和度' then begin
                min1 := val.EnkiHouwaMin;
                max1 := val.EnkiHouwaMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.EnkiHouwa;
           end
           else if FieldByName('項目１').AsString = '石灰苦土比' then begin
                min1 := val.SekkaiKudoMin;
                max1 := val.SekkaiKudoMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.SekkaiKudo;
           end
           else if FieldByName('項目１').AsString = '苦土加里比' then begin
                min1 := val.KudoKariMin;
                max1 := val.KudoKariMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.KudoKari;
           end;

           ///////////////////////
           if FieldByName('項目２').AsString = 'pH' then begin
                min2 := val.pHMin;
                max2 := val.pHMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.pH;
           end
           else if FieldByName('項目２').AsString = 'EC' then begin
                min2 := val.ECMin;
                max2 := val.ECMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.EC;

           end
           else if FieldByName('項目２').AsString = 'MgO' then begin
                min2 := val.MgOMin;
                max2 := val.MgOMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.MgO;

           end
           else if FieldByName('項目２').AsString = 'K2O' then begin
                min2 := val.K2OMin;
                max2 := val.K2OMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.K2O;
           end
           else if FieldByName('項目２').AsString = 'P' then begin
                min2 := val.PMin;
                max2 := val.PMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.P;

           end
           else if FieldByName('項目２').AsString = '塩基飽和度' then begin
                min2 := val.EnkiHouwaMin;
                max2 := val.EnkiHouwaMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.EnkiHouwa;
           end
           else if FieldByName('項目２').AsString = '石灰苦土比' then begin
                min2 := val.SekkaiKudoMin;
                max2 := val.SekkaiKudoMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.SekkaiKudo;
           end
           else if FieldByName('項目２').AsString = '苦土加里比' then begin
                min2 := val.KudoKariMin;
                max2 := val.KudoKariMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.KudoKari;
           end;

           ///////////////////////
           if FieldByName('項目３').AsString = 'pH' then begin
                min3 := val.pHMin;
                max3 := val.pHMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.pH;
           end
           else if FieldByName('項目３').AsString = 'EC' then begin
                min3 := val.ECMin;
                max3 := val.ECMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.EC;

           end
           else if FieldByName('項目３').AsString = 'MgO' then begin
                min3 := val.MgOMin;
                max3 := val.MgOMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.MgO;

           end
           else if FieldByName('項目３').AsString = 'K2O' then begin
                min3 := val.K2OMin;
                max3 := val.K2OMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.K2O;
           end
           else if FieldByName('項目３').AsString = 'P' then begin
                min3 := val.PMin;
                max3 := val.PMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.P;

           end
           else if FieldByName('項目３').AsString = '塩基飽和度' then begin
                min3 := val.EnkiHouwaMin;
                max3 := val.EnkiHouwaMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.EnkiHouwa;
           end
           else if FieldByName('項目３').AsString = '石灰苦土比' then begin
                min3 := val.SekkaiKudoMin;
                max3 := val.SekkaiKudoMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.SekkaiKudo;
           end
           else if FieldByName('項目３').AsString = '苦土加里比' then begin
                min3 := val.KudoKariMin;
                max3 := val.KudoKariMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.KudoKari;
           end;









           flg1 := 0;
           flg2 := 0;
           flg3 := 0;
           flg4 := 0;
           flg5 := 0;
           flg6 := 0;
           saku := '';
           //条件１
           sakumotu := FieldByName('作物').AsString;
           if sakumotu = '全作物' then begin
              saku := '';
           end
           else if FieldByName('作物').AsString = '水稲' then begin
              saku := '1';
           end
           else if FieldByName('作物').AsString = '畑' then begin
              saku := '2';
           end
           else if FieldByName('作物').AsString = '野菜' then begin
              saku := '3';
           end
           else if FieldByName('作物').AsString = '花き' then begin
              saku := '4';
           end
           else if FieldByName('作物').AsString = '果樹' then begin
              saku := '5';
           end
           else if FieldByName('作物').AsString = '草地' then begin
              saku := '6';
           end
           else if FieldByName('作物').AsString = '飼料' then begin
              saku := '7';
           end
           else if FieldByName('作物').AsString = 'その他' then begin
              saku := '8';
           end;

           if saku = '' then begin
              flg1 := 1; //現在は、全ての作物OK
           end
           else if saku = val.Sakumoku then begin
              flg1 := 1;
              //水稲床土の場合は、ぬく
              if Val.Sakucd = '104' then begin
                 flg1 := 0;
              end;

           end;


           //条件２
           if FieldByName('下限記号１').AsString = '' then begin
              flg2 := 1;
           end
           else if FieldByName('下限記号１').AsString = '＞' then begin
             if (min1 > ans1) and ( ans1 <> 0 ) then begin
                flg2 := 1;
             end;
           end
           else if FieldByName('下限記号１').AsString = '＜' then begin
             if (min1 < ans1) and ( ans1 <> 0 ) then begin
                flg2 := 1;
             end;
           end;

           if FieldByName('上限記号１').AsString = '' then begin
              flg3 := 1;
           end
           else if FieldByName('上限記号１').AsString = '＞' then begin
             if (max1 < ans1) and ( ans1 <> 0 ) then begin
                flg3 := 1;
             end;
           end
           else if FieldByName('上限記号１').AsString = '＜' then begin
             if (max1 > ans1) and ( ans1 <> 0 ) then begin
                flg3 := 1;
             end;
           end;


           //条件３
           if FieldByName('下限記号２').AsString = '' then begin
              flg4 := 1;
           end
           else if FieldByName('下限記号２').AsString = '＞' then begin
             if (min2 > ans2) and ( ans2 <> 0 ) then begin
                flg4 := 1;
             end;
           end
           else if FieldByName('下限記号２').AsString = '＜' then begin
             if (min2 < ans2) and ( ans2 <> 0 ) then begin
                flg4 := 1;
             end;
           end;

           if FieldByName('上限記号２').AsString = '' then begin
              flg5 := 1;
           end
           else if FieldByName('上限記号２').AsString = '＞' then begin
             if (max2 < ans2) and ( ans2 <> 0 ) then begin
                flg5 := 1;
             end;
           end
           else if FieldByName('上限記号２').AsString = '＜' then begin
             if (max2 > ans2) and ( ans2 <> 0 ) then begin
                flg5 := 1;
             end;
           end;

           //条件４
           btmp := 0;
           if FieldByName('基準').AsString = '基準値上限' then begin
             btmp := Max3 * FieldByName('倍数').AsFloat;
           end
           else if FieldByName('基準').AsString = '基準値下限' then begin
             btmp := Min3 * FieldByName('倍数').AsFloat;
           end;


           if FieldByName('記号３').AsString = '' then begin
              flg6 := 1;
           end
           else if FieldByName('記号３').AsString = '＞' then begin
             if (btmp < ans3) and ( ans3 <> 0 ) then begin
                flg6 := 1;
             end;
           end
           else if FieldByName('記号３').AsString = '＜' then begin
             if (btmp > ans3) and ( ans3 <> 0 ) then begin
                flg6 := 1;
             end;
           end;


           //条件５
           flg7 := 0;
           stmp := FieldByName('項目５').AsString;
           if stmp <> '' then begin
             if FieldByName('項目５').AsString = Val.renraku then begin
                flg7 := 1;
             end;
           end
           else begin
                flg7 := 1;

           end;




           if (flg1 = 1) and (flg2 = 1) and (flg3 = 1) and (flg4 = 1) and (flg5 = 1) and (flg6 = 1) and (flg7 = 1) then begin
              scmt := scmt + FieldByName('コメント').AsString+#13;
           end;





//        end;
        Next;
   end;
   close;
  end;
   result := scmt;

end;






{桁あわせ、小数点桁数による印刷位置}
function Keta( mode : integer ): Integer;
var
itmp : Integer;
begin
        itmp := 107-25;
	case mode of
           0: itmp := 103-25;
           1: itmp := 107-25;
           2: itmp := 110-25;
           3: itmp := 114-25;
        end;
	result := itmp;
end;
//0を表示する
function FtoStr2(aValue : double; aPrec : integer ):string; overload;
begin
	if aValue < 0.000 then aValue := 0.00;

	result := Format('%.*n',[aPrec,aValue]);
end;
//0は、表示しない 3桁区切り,をいれない
function FtoStr3(aValue : double; aPrec : integer ):string; overload;
begin
	if aValue <= 0.000 then result := ' '
  else
		result := Format('%.*f',[aPrec,aValue]);
end;
//0は、表示しない
function FtoStr(aValue : double; aPrec : integer ):string; overload;
begin
	if aValue <= 0.000 then result := ' '
  else
		result := Format('%.*n',[aPrec,aValue]);
end;
function FtoStr(aField : TField; aPrec : integer ):string; overload;
begin
	if aField.isNull then result := '－    '     {Version 0.6 #49}
  else
		result := Format('%.*n ',[aPrec,aField.asFloat]);
end;

{土改材用} {Version 0.6 #49}
function FtoStr(aField : TField):string; overload;
begin
	if aField.isNull then result := ''
  else
		result := Format('%.1n ',[aField.asFloat]);
end;
{
	戻り値：
    印刷の場合：True 次のデータ存在、false :無し
    画面の場合：True 描画データ存在、false :無し
}

{苦土me/100mg}
function KudoMe( aValue : double ) : double;
begin
	result := aValue / 20.2 ;
end;
{石灰me/100mg}
function SekkaiMe( aValue : double ) : double;
begin
	result := aValue / 28.0 ;
end;
{加里me/100mg}
function KariMe( aValue : double ) : double;
begin
	result := aValue / 47.1 ;
end;
{リン酸me/100mg}
function RinsanMe( aValue : double ) : double;
begin
	result := aValue / 62.97 ;
end;

{基準値範囲文字作成:代表項目名、少数桁数}
function MakeKijunStr( aDataSet : TDataSet; aFieldName : string; aPrec : integer ) : string;
var
stmp : String;
dc : String;
titai : String;
dcode : String;
begin

   if aFieldName = '熱抽出性窒素' then begin

     DataModule1.ADOTableRead.Close;
     DataModule1.ADOTableRead.TableName := 'M_BAI_S_N';
     DataModule1.ADOTableRead.Open;

     if DataModule1.ADOTableRead.RecordCount <= 0 then begin
       result :=  '';
       exit;
     end;

     dcode := JVal.DojyouCD;
     dc := '10';
     if (dcode = '15')  then begin
       dc := '15';
      end
      else if Copy( dcode,1,1)  = '1' then begin
       dc := '10';
      end
      else if Copy( dcode,1,1)  = '2' then begin
       dc := '20';
      end
      else if Copy( dcode,1,1)  = '3' then begin
       dc := '30';
      end
     else if Copy( dcode,1,1)  = '4' then begin
       dc := '40';
     end;

    //レコードの移動  //新篠津専用
     titai := '07A';
	   DataModule1.ADOTableRead.Locate('地帯区分;土壌コード',VarArrayOf([titai,dc]), []);


     JVal.NNMin := DataModule1.ADOTableRead.FieldByName('基準2').AsFloat; //Standard.Nkijyun1; //.0;
  	 JVal.NNMax := DataModule1.ADOTableRead.FieldByName('基準3').AsFloat; //Standard.Nkijyun2; //13.5;

		result := FtoStr(Jval.NNMin, aPrec) + '～ ' + FtoStr(Jval.NNMax, aPrec)

   end
   else begin


		result :=
			FtoStr(aDataSet.FieldByName(aFieldName+'下限').asFloat,aPrec) + '～ ' +
			FtoStr(aDataSet.FieldByName(aFieldName+'上限').asFloat,aPrec)  ;

  //stmp :=  Copy(aFieldName,1,2);

                if Copy(aFieldName,1,2) = 'pH' then begin
                    JVal.pHMin := aDataSet.FieldByName(aFieldName+'下限').asFloat;
                    JVal.pHMax := aDataSet.FieldByName(aFieldName+'上限').asFloat;
                end
                else if Copy(aFieldName,1,2) = 'EC' then begin
                    JVal.ECMin := aDataSet.FieldByName(aFieldName+'下限').asFloat;
                    JVal.ECMax := aDataSet.FieldByName(aFieldName+'上限').asFloat;
                end
                else if Copy(aFieldName,1,4) = '苦土加里' then begin
                    JVal.KudoKariMin := aDataSet.FieldByName(aFieldName+'下限').asFloat;
                    JVal.KudoKariMax := aDataSet.FieldByName(aFieldName+'上限').asFloat;
                end
                else if Copy(aFieldName,1,2) = '苦土' then begin
                    JVal.MgOMin := aDataSet.FieldByName(aFieldName+'下限').asFloat;
                    JVal.MgOMax := aDataSet.FieldByName(aFieldName+'上限').asFloat;
                end
                else if Copy(aFieldName,1,2) = '加里' then begin
                     if Copy(aFieldName,1,4) <> '加里飽和' then begin
                        JVal.K2OMin := aDataSet.FieldByName(aFieldName+'下限').asFloat;
                        JVal.K2OMax := aDataSet.FieldByName(aFieldName+'上限').asFloat;
                     end;
                end
                else if Copy(aFieldName,1,2) = 'リン' then begin
                     if Copy(aFieldName,1,4) <> 'リン酸苦' then begin
                       JVal.PMin := aDataSet.FieldByName(aFieldName+'下限').asFloat;
                       JVal.PMax := aDataSet.FieldByName(aFieldName+'上限').asFloat;
                     end;
                end
                else if Copy(aFieldName,1,2) = '塩基' then begin
                    JVal.EnkiHouwaMin := aDataSet.FieldByName(aFieldName+'下限').asFloat;
                    JVal.EnkiHouwaMax := aDataSet.FieldByName(aFieldName+'上限').asFloat;
                end
                else if Copy(aFieldName,1,4) = '石灰苦土' then begin
                    JVal.SekkaiKudoMin := aDataSet.FieldByName(aFieldName+'下限').asFloat;
                    JVal.SekkaiKudoMax := aDataSet.FieldByName(aFieldName+'上限').asFloat;
                end
                else if Copy(aFieldName,1,4) = '石灰飽和' then begin
                     //何もしない
                    //JVal.CaOMin := aDataSet.FieldByName(aFieldName+'下限').asFloat;
                    //JVal.CaOMax := aDataSet.FieldByName(aFieldName+'上限').asFloat;
                end
                else if Copy(aFieldName,1,2) = '石灰' then begin
                    JVal.CaOMin := aDataSet.FieldByName(aFieldName+'下限').asFloat;
                    JVal.CaOMax := aDataSet.FieldByName(aFieldName+'上限').asFloat;
                end;
     end;
//未入力の場合 印字したくない場合は
//			FtoStr(aDataSet.FieldByName(aFieldName+'下限'),aPrec) + '～ ' +
//			FtoStr(aDataSet.FieldByName(aFieldName+'上限'),aPrec)  ;
end;


///////////////////////////////////////////////////////////////////////////////
{基準値範囲文字作成:代表項目名、少数桁数}
{グラフ上限値取得}
function GetGrfMax( pFieldName : string  ) : double ;
//var
//  aCEC : string ;
begin
	//各値を算出
  with PrintModule1.ADOQueryKijun do begin
    {Version 0.7 #51 苦土飽和->塩基飽和のため変換必要なし}
(*
		if AnsiPos('塩基飽和', pFieldName ) > 0 then begin
    	aCEC := Copy( pFieldName,9,1);
  		result :=  FieldByName('石灰飽和'+aCEC+'グラフ上限').asFloat +
      						FieldByName('加里飽和'+aCEC+'グラフ上限').asFloat +
                  FieldByName('苦土飽和'+aCEC+'グラフ上限').asFloat ;
    end else begin
*)
	    result :=  FieldByName(pFieldName+'グラフ上限').asFloat ;
//    end;
  end;
end;

function GetScale( pValue : double ; pFieldName : string  ) : double ;
var
	aCalc : double ;
  dGrfLow,dKijunLow,dKijunMax,dGrfMax : double ;
  aSclGMin,aSclMin,aSclMax,aSclGMax : double ;
  Standard : TRecStandard ;

  dc, dcode : String;
  titai : String;

  btmp : double;

//  aCEC : string ;
begin


 if pFieldName <> '窒素' then begin


	//各値を算出
  with PrintModule1.ADOQueryKijun do begin



//  		dGrfLow :=  FieldByName(pFieldName+'グラフ下限').asFloat ;
    	dKijunLow :=     FieldByName(pFieldName+'下限').asFloat ;
  	  dKijunMax :=     FieldByName(pFieldName+'上限').asFloat ;
//	    dGrfMax :=  FieldByName(pFieldName+'グラフ上限').asFloat ;

      btmp :=  dKijunMax - dKijunLow;
      if btmp < 0 then begin
         dGrfLow := 0;
         dGrfMax := dKijunMax * 2;

      end
      else if dKijunMax = 0  then begin

         dGrfLow := 0;
         dGrfMax := dKijunLow * 2;


      end
      else begin
         dGrfLow := 0;
         dGrfMax := dKijunMax * 2;
      end;





//    end;
  end;
 end
 else begin
      //水稲施肥対応から数値をもってくる。


      //Standard := GetSehiValue( PrintModule1.ADOQueryUketuke);
                 //GetStandardValue(PrintModule1.ADOQueryUketuke);
//      dtmp := Bai_S_N( JVal.NN, dcode, titaiS,0 );

     //with DataModule1.ADOTableRead do begin
     DataModule1.ADOTableRead.Close;
     DataModule1.ADOTableRead.TableName := 'M_BAI_S_N';
     DataModule1.ADOTableRead.Open;

     if DataModule1.ADOTableRead.RecordCount <= 0 then begin
       result :=  0.0;
       exit;
     end;

     dcode := JVal.DojyouCD;
     dc := '10';
     if (dcode = '15')  then begin
       dc := '15';
      end
      else if Copy( dcode,1,1)  = '1' then begin
       dc := '10';
      end
      else if Copy( dcode,1,1)  = '2' then begin
       dc := '20';
      end
      else if Copy( dcode,1,1)  = '3' then begin
       dc := '30';
      end
     else if Copy( dcode,1,1)  = '4' then begin
       dc := '40';
     end;

    //レコードの移動  //新篠津専用
     titai := '07A';
	   DataModule1.ADOTableRead.Locate('地帯区分;土壌コード',VarArrayOf([titai,dc]), []);


  		dGrfLow :=  0;
    	dKijunLow := DataModule1.ADOTableRead.FieldByName('基準2').AsFloat; //Standard.Nkijyun1; //.0;
  	  dKijunMax := DataModule1.ADOTableRead.FieldByName('基準3').AsFloat; //Standard.Nkijyun2; //13.5;
	    dGrfMax :=  30.0;
//   end;
 end;



  //基準値ないものはグラフ下限＝０、下限＝０，上限＝下限×１０、グラフ上限＝上限
  if dKijunMax = 0 then dKijunMax := dKijunLow * 10 ;
  if dGrfMax = 0 then dGrfMax := dKijunMax ;

  //それでも基準値無いものはグラフ引かない
  if dGrfMax = 0 then begin
    result := 0;
    exit;
  end;
  //基準値円のスケール（外円＝１）で出す。
  if JMode = 'Fuuren' then begin
  aSclGMin := 0.0;
  aSclMin := 10 / 30; //CIRCLEMINSIZE / CIRCLEGRFMAXSIZE ;
  aSclMax := 20 / 30; //CIRCLEMAXSIZE / CIRCLEGRFMAXSIZE ;
  aSclGMax := 1.0;
  end
  else begin
  aSclGMin := 0.0;
  aSclMin := CIRCLEMINSIZE / CIRCLEGRFMAXSIZE ;
  aSclMax := CIRCLEMAXSIZE / CIRCLEGRFMAXSIZE ;
  aSclGMax := 1.0;
  end;
//分析値がどこに位置するか
	try      //注意：基準値上限＝グラフ上限値の場合除算０になるためその場合はグラフ値採用
    //
    if (pValue < dGrfLow) then begin  //グラフ下限未満
      aCalc := 0 ;
    end else
    //グラフ下限以上-基準値下限以下の間
    if (pValue >= dGrfLow ) and ( pValue <= dKijunLow ) then begin
      if dKijunLow = 0 then aCalc := 0   //０除算
//      else aCalc := ( pValue - dGrfLow ) / dKijunLow  * (aSclMin - aSclGMin )  + aSclGMin ;
//      bug.fix. 2002/12/26
      else aCalc := ( pValue - dGrfLow ) / (dKijunLow - dGrfLow ) * (aSclMin - aSclGMin )  + aSclGMin ;
    end else
    //基準値上限超－下限未満の間
    if (pValue > dKijunLow ) and ( pValue < dKijunMax ) then begin
      //０除算は無い ：上記超 未満のため
      aCalc := ( pValue - dKijunLow ) / ( dKijunMax - dKijunLow ) *  ( aSclMax - aSclMin ) + aSclMin ;
    end else
    //基準値上限以上-グラフ上限以下
    if (pValue >= dKijunMax ) and ( pValue <= dGrfMax ) then begin
      if ( dGrfMax - dKijunMax ) = 0 then aCalc := 1  //０除算
      else aCalc := ( pValue - dKijunMax ) / ( dGrfMax - dKijunMax ) * ( aSclGMax - aSclMax ) + aSclMax;
    end else
    //グラフ上限超 ： 上記式と同じ（１．０を超える）
    if (pValue > dGrfMax ) then begin
      if ( dGrfMax - dKijunMax ) = 0 then aCalc := 1.05  //０除算
      else aCalc := ( pValue - dKijunMax ) / ( dGrfMax - dKijunMax ) * ( aSclGMax - aSclMax ) + aSclMax;
    end
    else       //nothing
    	aCalc := 0 ;
    //グラフ最大値を超えた値の処置
    if aCalc > 1.05 then aCalc:= 1.05;
    if aCalc < 0 then aCalc := 0;
  except
  	aCalc := 0;
  end;
	result := aCalc ;
end;


//   分析値が半径のどこに位置するか返す。
//パラメータ
//分析値、(グラフ下限、基準値下限、基準値上限、グラフ上限)の項目名
//戻り値 0.0～1.1   グラフ下限中心を０，グラフ上限を１として返す
//各限界値の間のスケールはその値で変わる。
//各円の半径は定数(mm)を参照。
//特例：塩基飽和のキーワードの時は石灰、加里、苦土の和とする。

{土改材マスタの検索}
function GetDokaizaiName( pCode : string ): string ;
var
stmp : String;
begin
  result := '';
  if pCode = '' then exit ;

  if pCode = '100' then begin
    result := '硫黄粉';
    exit;
  end;


  with PrintModule1.ADOQueryDokaizai do begin
    Close;
    stmp := 'Select * from M_DOKAIZAI where コード='''+pCode+'''';
//    PrintModule1.ADOQueryDokaizai.Parameters.ParamByName('コード').Value := pCode ;
    SQL.Clear;
    SQL.Add(stmp);
    Open;
    if RecordCount > 0 then
      result := FieldByName('資材名').asString ;
    Close;
  end;
end;
//土改材名の取得
//グループコード , 土改材コード
function GetDokaizaiName001( pgrp : string; pCode : string ): string ;
begin
  result := '';
  if pCode = '' then exit ;
  with PrintModule1.ADOQueryDokaizai do begin
    Close;
    if Length(pCode) <> 2 then begin
     SQL.Text := 'Select * from M_DOKAIZAI where グループ = "'+pgrp+'" and コード= "'+pCode+'"';
    end
    else begin
      SQL.Text := 'Select * from M_DOKAIMAS where コード= "'+pCode+'"';
    end;

    Open;
//    PrintModule1.ADOQueryDokaizai.Parameters.ParamByName('コード').Value := pCode ;
//    Open;
    if RecordCount > 0 then
      result := FieldByName('資材名').asString ;
    Close;
  end;
end;


//////
//
//   kou 項目 kou1 記号 kou3 単位
//
//   TSHeikin テーブルは、オープンしておく必要がある
//
procedure SiryouSub( kou1 : String;kou2 : String;kou3 : String;dbkou : String; PriDBL1 : double;SentoXX : Integer; WorkXXYY : Integer; TateHabaYo : Integer );
var
PriWK1, PriOut : String;
PriDBL2,PriDBL3 : double;

begin

RectAndText(lmNONE,tlCENTER,taCENTER,SentoXX,WorkXXYY,53,TateHabaYo,11,
        	kou1,ftNORMAL);
RectAndText(lmNONE,tlCENTER,taCENTER,SentoXX+53,WorkXXYY,15,TateHabaYo,11,
        	kou2,ftNORMAL);
if kou1 = '正味エネルギー' then begin
RectAndText(lmNONE,tlCENTER,taCENTER,SentoXX+53+15,WorkXXYY,13,TateHabaYo,7,
               kou3,ftNORMAL);
end
else begin
RectAndText(lmNONE,tlCENTER,taCENTER,SentoXX+53+15,WorkXXYY,13,TateHabaYo,11,
               kou3,ftNORMAL);
end;

PriWK1 := Ftostr3(PrintModule1.ADOQueryUketuke.FieldByName(dbkou).asFloat,JMode_Siryou);

PriDBL2 := 0;
if PriWK1 <> ' ' then begin
         PriDBL2 := strtofloat( PriWK1 );
end;
//         PriDBL2 := strtofloat( PriWK1 );

PriDBL3 :=  PriDBL1 *  PriDBL2;
PriOut := Ftostr(PriDBL3,JMode_Siryou);
RectAndText(lmNONE,tlCENTER,taCENTER,SentoXX+53+15+13,WorkXXYY,27,TateHabaYo,11,
        	PriOut,ftNORMAL);

PriOut := Ftostr(PrintModule1.ADOQueryUketuke.FieldByName(dbkou).asFloat,JMode_Siryou);//PriWK1;
RectAndText(lmNONE,tlCENTER,taCENTER,SentoXX+53+15+13+27,WorkXXYY,28,TateHabaYo,11,
        	PriOut,ftNORMAL);

//PriOut := Ftostr(PrintModule1.TSHeikin.FieldByName(dbkou).asFloat,JMode_Siryou);
RectAndText(lmNONE,tlCENTER,taCENTER,SentoXX+53+15+13+27+28,WorkXXYY,28,TateHabaYo,11,
        	PriOut,ftNORMAL);


end;


//////////////////////////////////////////////////////////////////////




//
//========================================================================

//========================================================================
// グラフの表示　
procedure BarGlaAba( ans : Double; sKou : String; sY : Integer; typCEC : String );
var
  haba : Integer;
  sx : Integer;

  gmin, gmax : Double;
  kmin, kmax : Double;

  keta : Integer;
  mm1,mm2,ansmm : Integer;


begin

//    RectLine(lmRECT, 0,CurLine-4,88,4*2 );
//procedure SlantLine(fX,fY,tX,tY : Integer);
//procedure PictSlantLine(start, stop : TPoint);
     sx := 50+23+25+15;

     haba := 67;

     //枠
     RectAndText(lmRECT,tlCENTER,taCENTER,sx,sY,haba,7, 10,' ',ftNORMAL);




     gmin := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'グラフ下限').asFloat;
     gmax := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'グラフ上限').asFloat;

     keta := 0;
     if sKou = 'pH' then keta := JMode_pH
     else if sKou = 'リン酸' then keta := JMode_P
     else if sKou = '石灰' then keta := JMode_CaO
     else if sKou = '苦土' then keta := JMode_MgO
     else if sKou = '加里' then keta := JMode_K2O;



     //基準
     kmin := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'下限').asFloat;
     kmax := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'上限').asFloat;

     if gmin > kmin then gmin := kmin;
     if gmax < kmax then gmax := kmax;


     RectAndText(lmNONE,tlCENTER,taLEFT,sx+1,sY+2,8,5,7,
    	FtoStr2( gmin, keta),ftNORMAL);

     RectAndText(lmNONE,tlCENTER,taLEFT,sx+haba-7,sY+2,8,5,7,
    	FtoStr2( gmax, keta),ftNORMAL);


     mm1 := Round(((haba - 4) / ( gmax - gmin )) * (kmin - gmin) );
     mm2 := Round(((haba - 4) / ( gmax - gmin )) * (kmax - kmin) );

     if gmin > ans then ansmm := 1
     else if gmax < ans then ansmm := haba - 2
     else ansmm := Round(((haba - 4) / ( gmax - gmin )) * (ans - gmin) );

     //RectLine(lmRECTFILL, sx+mm1, sY+2, mm2, 5 );
     RectAndText(lmRECTFILL,tlCENTER,taCENTER,sx+mm1, sY+2, mm2, 5,10,
    	' ',ftNORMAL);



     //メモリ
     RectAndText(lmClear,tlCENTER,taLEFT,sx+mm1-2, sY, 10, 2,6,
    	FtoStr2( kmin, keta),ftNORMAL);

     RectAndText(lmClear,tlCENTER,taLEFT,sx+mm1+mm2-2, sY, 10, 2,6,
    	FtoStr2( kmax, keta),ftNORMAL);


     PenSize( BoldPenSize );
     SlantLine(sx+3,     sY+2,sx+3,     sY+7);
     SlantLine(sx+haba-4,sY+2,sx+haba-4,sY+7);
     //上の線
     PenSize( DefPenSize );
     SlantLine(sx,sY+2,sx+haba,sY+2);

     //☆
     RectAndText(lmClear,tlCENTER,taCENTER,sx+ansmm-1, sY+2, 2, 5,10,
    	'☆',ftNORMAL);


//     RectAndText(lmNONE,tlCENTER,taCENTER,sx,sY,6,2,7,
//    	'885.5',ftNORMAL);









end;
//========================================================================
// 奈井江版　グラフ
//========================================================================
procedure BarGla_naie( ans : Double; sKou : String; dhaba : Integer; typCEC : String; XX1, YY1 : Integer );
var
sx : integer;

gmin, gmax : Double;
kmin, kmax : Double;

keta : Integer;
mm1,mm2,ansmm : Integer;
haba : integer;

begin


    //グラフ 　　90
    haba := 90;
    sx := 90;
    RectAndText(lmRECT,tlCENTER,taCENTER,90,CurLine,90,dhaba,		9,
    	' ',ftNORMAL);

     gmin := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'グラフ下限').asFloat;
     gmax := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'グラフ上限').asFloat;


     //基準
     kmin := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'下限').asFloat;
     kmax := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'上限').asFloat;

     if gmin > kmin then gmin := kmin;
     if gmax < kmax then gmax := kmax;

     if kmin > kmax then kmax := gmax;


    keta := 0;
     if sKou = 'pH' then keta := JMode_pH
     else if sKou = 'EC' then keta := JMode_EC
     else if sKou = 'リン酸' then keta := JMode_P
     else if sKou = '石灰' then keta := JMode_CaO
     else if sKou = '苦土' then keta := JMode_MgO
     else if sKou = '加里' then keta := JMode_K2O;



    //基準値
     mm1 := Round(((90 - 6) / ( gmax - gmin )) * (kmin - gmin) );
     mm2 := Round(((90 - 6) / ( gmax - gmin )) * (kmax - kmin) );

     if gmin > ans then ansmm := 1
     else if gmax < ans then ansmm := haba - 3
     else ansmm := Round(((haba - 6) / ( gmax - gmin )) * (ans - gmin) );

     RectAndText(lmRECTFILL,tlCENTER,taCENTER,90+mm1,CurLine + 2,mm2,dhaba - 2,		9,
    	' ',ftNORMAL);

     //`メモリ
     RectAndText(lmClear,tlCENTER,taLEFT,sx+mm1-2,CurLine,5,3,		7,
    	FtoStr2( kmin, keta),ftNORMAL);

     RectAndText(lmClear,tlCENTER,taLEFT,sx+mm1+mm2-2,CurLine,5,3,		7,
    	FtoStr2( kmax, keta),ftNORMAL);

    //基準文字
    RectAndText(lmClear,tlCENTER,taLEFT,sx+3,CurLine,5,3,		7,
    	FtoStr2( gmin, keta),ftNORMAL);

    RectAndText(lmClear,tlCENTER,taRIGHT,172,CurLine,5,3,		7,
    	FtoStr2( gmax, keta),ftNORMAL);


    RectAndText(lmClear,tlCENTER,taCENTER,sx+ansmm-1,CurLine + 2,3,4,		9,
    	'★',ftNORMAL);




    //下限上限線
    RectAndText(lmRECT,tlCENTER,taCENTER,93,CurLine,84,dhaba,		9,
    	' ',ftNORMAL);




end;
//========================================================================
procedure BarGla( ans : Double; sAns : String; sY : Integer; typCEC : String; XX1, YY1 : Integer );
var
gmin, gmax : Double;
kmin, kmax : Double;
btmp : Double;
itmp : Integer;
//ans : Double;
begin


    if ans < 0 then exit;


    if sAns = 'ケイ酸' then begin
        gmin := PrintModule1.ADOQueryKijun.FieldByName(sAns+'グラフ下限').asFloat;
        gmax := PrintModule1.ADOQueryKijun.FieldByName(sAns+'グラフ上限').asFloat;
        kmin := PrintModule1.ADOQueryKijun.FieldByName(sAns+'下限').asFloat;
//        JVal.pHMin := kmin;
        kmax := PrintModule1.ADOQueryKijun.FieldByName(sAns+'上限').asFloat;
    end
    else begin
        gmin := PrintModule1.ADOQueryKijun.FieldByName(sAns+typCEC+'グラフ下限').asFloat;
        gmax := PrintModule1.ADOQueryKijun.FieldByName(sAns+typCEC+'グラフ上限').asFloat;
        kmin := PrintModule1.ADOQueryKijun.FieldByName(sAns+typCEC+'下限').asFloat;
//        JVal.pHMin := kmin;
        kmax := PrintModule1.ADOQueryKijun.FieldByName(sAns+typCEC+'上限').asFloat;
//        JVal.pHMax := kmax;
    end;








//    ans := PrintModule1.ADOQueryUketuke.FieldByName(sAns).asFloat;

   if (kmin = 0) and (kmax = 0 ) then exit;


    if gmin > ans then begin
       RectAndText(lmRECT,tlCENTER,taCENTER,XX1+108,YY1+sY,14,5,11,'★',ftNORMAL);
    end
    else if kmin > ans then begin
       btmp := (kmin - gmin) / 8.0;
       btmp := (ans - gmin) / btmp;
       itmp := Round(btmp);
       RectAndText(lmNONE,tlCENTER,taLeft,XX1+122+itmp-2,YY1+sY,10,5,11,'★',ftNORMAL);
    end
    else if kmax > ans then begin
       btmp := (kmax - kmin) / 6.0;
       btmp := (ans - kmin) / btmp;
       itmp := Round(btmp);
       if kmin = ans then begin
           RectAndText(lmNONE,tlCENTER,taLeft,XX1+179+itmp-2,YY1+sY,27,5,11,'★',ftNORMAL);
       end
       else begin
           RectAndText(lmNONE,tlCENTER,taLeft,XX1+179+itmp-2,YY1+sY,27,5,11,'☆',ftNORMAL);
       end;

    end
    else if gmax >= ans then begin
       btmp := (gmax - kmax) / 8.0;
       btmp := (ans - kmax) / btmp;
       itmp := Round(btmp);
       RectAndText(lmNONE,tlCENTER,taLeft,XX1+206+itmp-2,YY1+sY,10,5,11,'★',ftNORMAL);
    end
    else begin
       RectAndText(lmRECT,tlCENTER,taCENTER,XX1+263,YY1+sY,14,5,11,'★',ftNORMAL);
    end;

end;


//
//診断票の基準値を描画
//
procedure kijyunbar( kou : string; CurLine : integer );
var
stmp : string;
koumoku : string;
tanni : string;
smin, smax : string;
bmin, bmax, bans : double;
iketa : integer;
begin

//pH

    if kou = 'pH' then begin         koumoku := 'ｐ　　　　　　　Ｈ';  tanni := '[pH]';
                                   smin := kou+'下限';  smax := kou+'上限';  iketa := JMode_pH;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'EC' then begin    koumoku := 'Ｅ　　　　　　　Ｃ';  tanni := '(ms/cm)';
                                   smin := kou+'下限';  smax := kou+'上限';  iketa := JMode_EC;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'CEC' then begin   koumoku := 'Ｃ　　　Ｅ　　　Ｃ';  tanni := '(me/100g)';
                                   smin := kou+'下限';  smax := kou+'上限';  iketa := JMode_CEC;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'CaO' then begin  koumoku := '置　換　性　石　灰';  tanni := '(mg/100g)';
                                   smin := '石灰下限';  smax := '石灰上限';  iketa := JMode_CaO;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'MgO' then begin  koumoku := '置　換　性　苦　土';  tanni := '(mg/100g)';
                                   smin := '苦土下限';  smax := '苦土上限';  iketa := JMode_MgO;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'K2O' then begin  koumoku :=  '置　換　性　加　里';  tanni := '(mg/100g)';
                                   smin := '加里下限';  smax := '加里上限';  iketa := JMode_K2O;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'トルオーグP' then begin  koumoku := '可　給　態 リ ン 酸';  tanni := '(mg/100g)';
                                   smin := 'リン酸下限';  smax := 'リン酸上限';  iketa := JMode_P;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '硝酸態N' then begin koumoku := '硝　酸　態　窒　素';  tanni := '(mg/100g)';
                                   smin := '硝酸態N下限';  smax := '硝酸態N上限';  iketa := JMode_N;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'ケイ酸' then begin koumoku := '可　給　態 ケ イ 酸';  tanni := '(mg/100g)';
                                   smin := 'ケイ酸下限';  smax := 'ケイ酸上限';  iketa := JMode_Kei;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '鉄' then begin koumoku := '遊　離　酸　化　鉄';  tanni := '(ppm)';
                                   smin := '鉄下限';  smax := '鉄上限';  iketa := JMode_Fe;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '腐植' then begin     koumoku := '腐　　　　　　植';  tanni := '(%)';
                                   smin := '腐植下限';  smax := '腐植上限';  iketa := JMode_Fus;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'マンガン' then begin koumoku := '置 換 性マンガン';  tanni := '(ppm)';
                                   smin := 'マンガン下限';  smax := 'マンガン上限';  iketa := JMode_Man;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '銅' then begin       koumoku := '可 　溶 　性　銅';  tanni := '(ppm)';
                                   smin := '銅下限';  smax := '銅上限';  iketa := JMode_Dou;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'ホウ素' then begin   koumoku := 'ホ　 　ウ　 　素';  tanni := '(ppm)';
                                   smin := 'ホウ素下限';  smax := 'ホウ素上限';  iketa := JMode_Hou;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '亜鉛' then begin     koumoku := '可　給　態　亜　鉛';  tanni := '(ppm)';
                                   smin := '亜鉛下限';  smax := '亜鉛上限';  iketa := JMode_Aen;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '石灰苦土' then begin koumoku := '石　灰・苦　土　比';  tanni := '';
                                   smin := '基準ない';  smax := '石灰苦土上限';  iketa := JMode_Hiritu;
       bans := JVal.SekkaiKudo;
    end
    else if kou = '苦土加里' then begin   koumoku := '苦　土・加　里　比';  tanni := '';
                                   smin := '基準ない';  smax := '苦土加里上限';  iketa := JMode_Hiritu;
       bans := JVal.KudoKari;
    end
    else if kou = '石灰飽和度' then begin koumoku := '石　灰　飽　和　度';  tanni := '(%)';
                                   smin := '石灰飽和度下限';  smax := '石灰飽和度上限';  iketa := JMode_Houwa;
       bans := JVal.SekkaiHouwa;
       Jval.SekkaiHouwaMax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;
    end
    else if kou = '苦土飽和度' then begin koumoku := '苦　土　飽　和　度';  tanni := '(%)';
                                   smin := '苦土飽和度下限';  smax := '苦土飽和度上限';  iketa := JMode_Houwa;
       bans := JVal.KudoHouwa;
       Jval.KudoHouwaMax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;
    end
    else if kou = '加里飽和度' then begin koumoku := '加　里　飽　和　度';  tanni := '(%)';
                                   smin := '加里飽和度下限';  smax := '加里飽和度上限';  iketa := JMode_Houwa;
       bans := JVal.Karihouwa;
       Jval.KariHouwaMax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;
    end
    else if kou = '塩基飽和度' then begin koumoku := '塩　基　飽　和　度';  tanni := '(%)';
                                   smin := '基準ない';  smax := '塩基飽和度上限';  iketa := JMode_Houwa;
       bans := JVal.EnkiHouwa;
    end
    else begin

      stmp := '';
      RectAndText(lmRECT,tlCENTER,taLEFT,0,CurLine, 45   , 6  ,		10,
    	stmp ,ftNORMAL);

      RectAndText(lmNONE,tlCENTER,taRIGHT,31,CurLine, 14   , 6  ,		4,
    	stmp ,ftNORMAL);


      RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		8,
    	stmp, ftNORMAL);

      RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 14  , 6  ,		10,
    	stmp,ftNORMAL);

     //stmp := '□';
     RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25+14,CurLine, 6   , 6  ,		10,
    	stmp,ftNORMAL);

      exit;

    end;

    //基準値がないとき
    if smin = '基準ない' then begin

      RectAndText(lmRECT,tlCENTER,taLEFT,0,CurLine, 45   , 6  ,		10,
    	 koumoku ,ftNORMAL);

      RectAndText(lmNONE,tlCENTER,taCENTER,33,CurLine, 12   , 6  ,		6,
    	 tanni ,ftNORMAL);


      stmp := '';
      RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		8,
    	stmp, ftNORMAL);

      stmp := FtoStr(bans,iketa); //'5.6';
      RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 14  , 6  ,		10,
    	  stmp,ftNORMAL);

      //stmp := '□';
      stmp := '';
      RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25+14,CurLine, 6   , 6  ,		10,
    	 stmp,ftNORMAL);


    end
    else begin

      RectAndText(lmRECT,tlCENTER,taLEFT,0,CurLine, 45   , 6  ,		10,
    	 koumoku ,ftNORMAL);

      RectAndText(lmNONE,tlCENTER,taCENTER,33,CurLine, 12   , 6  ,		6,
    	 tanni ,ftNORMAL);

      bmin := PrintModule1.ADOQueryKijun.FieldbyName(smin).asFloat;
      bmax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;


      stmp := FtoStr(bmin,iketa); //'XX～XX';
      stmp := stmp + ' ～ '+FtoStr(bmax,iketa); //'XX～XX';

      RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		8,
    	stmp, ftNORMAL);

      stmp := FtoStr(bans,iketa); //'5.6';
      RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 14  , 6  ,		10,
    	  stmp,ftNORMAL);

      //stmp := '□';
      stmp := Bunseki_Hantei( bmin, bmax, bans);
      RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25+14,CurLine, 6   , 6  ,		10,
    	 stmp,ftNORMAL);
   end;

end;



function shindan_top(CurLine : Integer):integer;
var
stmp : string;
begin

  result := 0;

  with PrintModule1.ADOQueryUketuke do begin


    RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 20    , 6  ,		10,
    	'依頼機関' ,ftNORMAL);

    stmp := FieldByName('組合名').asString + ' ' + FieldByName('支店名').asString;
    RectAndText(lmRECT,tlCENTER,taLEFT,0+20,CurLine, 60    , 6  ,		10,
    	stmp ,ftNORMAL);




    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60,CurLine, 20    , 6  ,		10,
    	'試料NO.' ,ftNORMAL);

    stmp := FieldByName('試料NO').asString;
    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20,CurLine, 30    , 6  ,		10,
    	stmp ,ftNORMAL);


    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20+30,CurLine, 20    , 6  ,		10,
    	'受付日' ,ftNORMAL);

    stmp := FormatDateTime('yyyy"年"m"月"d"日"',FieldByName('T_UKETUKE6.受付年月日').asDateTime);
    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20+30+20,CurLine, 30    , 6  ,		10,
    	stmp ,ftNORMAL);


   CurLine := CurLine + 6;


    RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 20    , 6  ,		10,
    	'氏名' ,ftNORMAL);

    stmp := FieldByName('依頼者氏名').asString;
    RectAndText(lmRECT,tlCENTER,taCENTER,0+20,CurLine, 60    , 6  ,		10,
    	stmp ,ftNORMAL);

    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60,CurLine, 20    , 6  ,		10,
    	'作物' ,ftNORMAL);

    stmp := FieldByName('M_SAKUMOTU.作物名').asstring;
    RectAndText(lmRECT,tlCENTER,taLEFT,0+20+60+20,CurLine, 30    , 6  ,		10,
    	stmp ,ftNORMAL);


    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20+30,CurLine, 20    , 6  ,		10,
    	'報告日' ,ftNORMAL);

    stmp := FormatDateTime('yyyy"年"m"月"d"日"',FieldByName('発送日').asDateTime);
    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20+30+20,CurLine, 30    , 6  ,		10,
    	stmp ,ftNORMAL);

   CurLine := CurLine + 6;


    RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 20    , 6  ,		10,
    	'採取場所' ,ftNORMAL);

    stmp := FieldByName('採取場所').asstring;
    RectAndText(lmRECT,tlCENTER,taLEFT,0+20,CurLine, 60    , 6  ,		10,
    	stmp ,ftNORMAL);

    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60,CurLine, 20    , 6  ,		10,
    	'作型' ,ftNORMAL);

    stmp := FieldByName('T_BUNSEKI6.作型名').asstring;
    RectAndText(lmRECT,tlCENTER,taLEFT,0+20+60+20,CurLine, 30    , 6  ,		10,
    	stmp ,ftNORMAL);


    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20+30,CurLine, 20    , 6  ,		10,
    	'受付No.' ,ftNORMAL);

    stmp := FieldByName('T_UKETUKE6.受付NO').asString;
    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20+30+20,CurLine, 30    , 6  ,		10,
    	stmp ,ftNORMAL);



   CurLine := CurLine + 6;


    RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 20   , 6  ,		10,
    	'備考' ,ftNORMAL);

    stmp := FieldByName('T_BUNSEKI6.備考').asString;
    RectAndText(lmRECT,tlCENTER,taLEFT,0+20,CurLine, 160    , 6  ,		10,
    	stmp ,ftNORMAL);

  end;


  result := CurLine;

end;


//
//診断票の基準値を描画  棒グラフ付き
//
procedure kijyunbar2( kou : string; CurLine : integer );
var
stmp : string;
koumoku : string;
tanni : string;
smin, smax : string;
bmin, bmax, bans : double;
btmp, btmp2, btmp3, btmp4 : double;
iketa : integer;
itmp,itmp2 : integer;
begin

//pH

    if kou = 'pH' then begin         koumoku := 'ｐ　　　　　　　Ｈ';  tanni := '[pH]';
                                   smin := kou+'下限';  smax := kou+'上限';  iketa := JMode_pH;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'EC' then begin    koumoku := 'Ｅ　　　　　　　Ｃ';  tanni := '(ms/cm)';
                                   smin := kou+'下限';  smax := kou+'上限';  iketa := JMode_EC;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'CEC' then begin   koumoku := 'Ｃ　　　Ｅ　　　Ｃ';  tanni := '(me/100g)';
                                   smin := kou+'下限';  smax := kou+'上限';  iketa := JMode_CEC;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'CaO' then begin  koumoku := '置　換　性　石　灰';  tanni := '(mg/100g)';
                                   smin := '石灰下限';  smax := '石灰上限';  iketa := JMode_CaO;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'MgO' then begin  koumoku := '置　換　性　苦　土';  tanni := '(mg/100g)';
                                   smin := '苦土下限';  smax := '苦土上限';  iketa := JMode_MgO;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'K2O' then begin  koumoku :=  '置　換　性　加　里';  tanni := '(mg/100g)';
                                   smin := '加里下限';  smax := '加里上限';  iketa := JMode_K2O;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'トルオーグP' then begin  koumoku := '可　給　態 リ ン 酸';  tanni := '(mg/100g)';
                                   smin := 'リン酸下限';  smax := 'リン酸上限';  iketa := JMode_P;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '硝酸態N' then begin koumoku := '硝　酸　態　窒　素';  tanni := '(mg/100g)';
                                   smin := '硝酸態N下限';  smax := '硝酸態N上限';  iketa := JMode_N;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'ケイ酸' then begin koumoku := '可　給　態 ケ イ 酸';  tanni := '(mg/100g)';
                                   smin := 'ケイ酸下限';  smax := 'ケイ酸上限';  iketa := JMode_Kei;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '鉄' then begin koumoku := '遊　離　酸　化　鉄';  tanni := '(ppm)';
                                   smin := '鉄下限';  smax := '鉄上限';  iketa := JMode_Fe;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '腐植' then begin     koumoku := '腐　　　　　　植';  tanni := '(%)';
                                   smin := '腐植下限';  smax := '腐植上限';  iketa := JMode_Fus;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'マンガン' then begin koumoku := '置 換 性マンガン';  tanni := '(ppm)';
                                   smin := 'マンガン下限';  smax := 'マンガン上限';  iketa := JMode_Man;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '銅' then begin       koumoku := '可 　溶 　性　銅';  tanni := '(ppm)';
                                   smin := '銅下限';  smax := '銅上限';  iketa := JMode_Dou;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'ホウ素' then begin   koumoku := 'ホ　 　ウ　 　素';  tanni := '(ppm)';
                                   smin := 'ホウ素下限';  smax := 'ホウ素上限';  iketa := JMode_Hou;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '亜鉛' then begin     koumoku := '可　給　態　亜　鉛';  tanni := '(ppm)';
                                   smin := '亜鉛下限';  smax := '亜鉛上限';  iketa := JMode_Aen;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '石灰苦土' then begin koumoku := '石　灰・苦　土　比';  tanni := '';
                                   smin := '基準ない';  smax := '石灰苦土上限';  iketa := JMode_Hiritu;
       bans := JVal.SekkaiKudo;
    end
    else if kou = '苦土加里' then begin   koumoku := '苦　土・加　里　比';  tanni := '';
                                   smin := '基準ない';  smax := '苦土加里上限';  iketa := JMode_Hiritu;
       bans := JVal.KudoKari;
    end
    else if kou = '石灰飽和度' then begin koumoku := '石　灰　飽　和　度';  tanni := '(%)';
                                   smin := '石灰飽和度下限';  smax := '石灰飽和度上限';  iketa := JMode_Houwa;
       bans := JVal.SekkaiHouwa;
       Jval.SekkaiHouwaMax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;
    end
    else if kou = '苦土飽和度' then begin koumoku := '苦　土　飽　和　度';  tanni := '(%)';
                                   smin := '苦土飽和度下限';  smax := '苦土飽和度上限';  iketa := JMode_Houwa;
       bans := JVal.KudoHouwa;
       Jval.KudoHouwaMax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;
    end
    else if kou = '加里飽和度' then begin koumoku := '加　里　飽　和　度';  tanni := '(%)';
                                   smin := '加里飽和度下限';  smax := '加里飽和度上限';  iketa := JMode_Houwa;
       bans := JVal.Karihouwa;
       Jval.KariHouwaMax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;
    end
    else if kou = '塩基飽和度' then begin koumoku := '塩　基　飽　和　度';  tanni := '(%)';
                                   smin := '基準ない';  smax := '塩基飽和度上限';  iketa := JMode_Houwa;
       bans := JVal.EnkiHouwa;
    end
    else begin

      stmp := '';
      RectAndText(lmRECT,tlCENTER,taLEFT,0,CurLine, 45   , 6  ,		10,
    	stmp ,ftNORMAL);

      RectAndText(lmNONE,tlCENTER,taRIGHT,31,CurLine, 14   , 6  ,		4,
    	stmp ,ftNORMAL);


      RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		8,
    	stmp, ftNORMAL);

      RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 14  , 6  ,		10,
    	stmp,ftNORMAL);

     //stmp := '□';
     RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25+14,CurLine, 6   , 6  ,		10,
    	stmp,ftNORMAL);

      exit;

    end;

    //基準値がないとき
    if smin = '基準ない' then begin

      RectAndText(lmRECT,tlCENTER,taLEFT,0,CurLine, 45   , 6  ,		10,
    	 koumoku ,ftNORMAL);

      RectAndText(lmNONE,tlCENTER,taCENTER,33,CurLine, 12   , 6  ,		6,
    	 tanni ,ftNORMAL);


      stmp := '';
      RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		8,
    	stmp, ftNORMAL);

      stmp := FtoStr(bans,iketa); //'5.6';
      RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 14  , 6  ,		10,
    	  stmp,ftNORMAL);

      //stmp := '□';
      stmp := '';
      RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25+14,CurLine, 6   , 6  ,		10,
    	 stmp,ftNORMAL);


    end
    else begin

      RectAndText(lmRECT,tlCENTER,taLEFT,0,CurLine, 45   , 6  ,		10,
    	 koumoku ,ftNORMAL);

      RectAndText(lmNONE,tlCENTER,taCENTER,33,CurLine, 12   , 6  ,		6,
    	 tanni ,ftNORMAL);

      bmin := PrintModule1.ADOQueryKijun.FieldbyName(smin).asFloat;
      bmax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;


      stmp := FtoStr(bmin,iketa); //'XX～XX';
      stmp := stmp + ' ～ '+FtoStr(bmax,iketa); //'XX～XX';

      RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		8,
    	stmp, ftNORMAL);

      stmp := FtoStr(bans,iketa); //'5.6';
      RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 14  , 6  ,		10,
    	  stmp,ftNORMAL);

      //stmp := '□';
      stmp := Bunseki_Hantei( bmin, bmax, bans);
      RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25+14,CurLine, 6   , 6  ,		10,
    	 stmp,ftNORMAL);
   end;



   //  棒グラフ

   //  １メモリ 6 　　15列　　6から１０まで基準   MAX　90
   itmp := 0+45+25+14+6;

//   RectAndText(lmRECTFILL,tlCENTER,taCENTER,itmp,CurLine+2, 90   , 2  ,		10,
//    	 '',ftNORMAL);

   btmp := bmax - bmin;  //幅
   //最大値が０の場合を　考慮
   if bmax < bmin then btmp := bmin;


   if bans <= 0 then begin
        //なにもしない

   end
   else if bans <= bmin then begin

         btmp2 := bmin / 30;
         btmp3 := bans / btmp2;
         itmp2 := round(btmp3);
      RectAndText(lmRECTFILL,tlCENTER,taCENTER,itmp,CurLine+2, itmp2  , 2  ,		10,
    	    '',ftNORMAL);


   end
   else if bans <= bmax then begin

         btmp2 := btmp / 30;
         btmp3 := (bans - bmin)  / btmp2;
         itmp2 := round(btmp3);
      RectAndText(lmRECTFILL,tlCENTER,taCENTER,itmp,CurLine+2, 30 + itmp2  , 2  ,		10,
    	    '',ftNORMAL);

   end
   else begin

      btmp2 := (bmax * 2) / 30;
      btmp3 := (bans - bmax) / btmp2;
      if btmp3 > 30 then btmp3 := 30;
      itmp2 := round(btmp3);
      RectAndText(lmRECTFILL,tlCENTER,taCENTER,itmp,CurLine+2, 60 + itmp2  , 2  ,		10,
    	    '',ftNORMAL);
   end;



end;


//========================================================================
//  土壌診断票
//
//========================================================================
function PrintSindan( prmDeviceType : TDeviceType; pCondition : string; PageCnt : Integer; var KeyCode :string  ):boolean;

var
	Qcnt ,MaxHeight, CurLocX, cnt : integer ;
  GetLoc,PictCenter : TPoint ;
  GetLocList : array[1..6] of TPoint ;	//グラフチャート用角のピクセル座標
  SekkaiKudo,KUdoKari,RinsanKudo : double;
  dblRinsan, SekkaiHouwa,Karihouwa,EnkiHouwa: double ;
  IsKusa : boolean ;
  DosituCode : string ;
  stmp : String;
  //塩基用算出値      {Version 0.7 #51 苦土飽和->塩基飽和のため変換必要なし}
//  dblEnkiGLow,dblEnkiLow,dblEnkiMokuhyo,dblEnkiMax,dblenkiGMax : double ;
  aBuff,typCEC : string ;
  TheRect : TRect;
  haba : Integer;

  Standard : TRecStandard ;
  SehiV : TRecStandard ;

  no : String;
  btmp : double;

  sakucd1 : String;
  sakucd2 : String;
  sakucd3 : String;

  sehiLine : integer;

  bmin, bmax, bans : double;

  itmp : integer;
  itmp2,itmp3,itmp4 : integer;
//  iXX1, iYY1 : integer;
  iXX2, iYY2 : integer;
  iXX3, iYY3 : integer;
  i : integer;

begin
//AAAAA
	result := False;



  //所定のデータまで移動
  Qcnt := 1 ;
  with PrintModule1.ADOQueryUketuke do begin
  	Close;




          stmp := 'Select T_BUNSEKI6.*,T_UKETUKE6.*,M_NOUKYOU.*,M_SISYO.*,M_SAKUMOTU.*,M_SAKUGATA.* '+
        'from (((((T_BUNSEKI6 '+
        ' LEFT JOIN T_UKETUKE6 ON T_BUNSEKI6.受付NO = T_UKETUKE6.受付NO) '+
        ' LEFT JOIN M_SAKUMOTU ON T_BUNSEKI6.作物コード = M_SAKUMOTU.作物コード) '+
        ' LEFT JOIN M_SAKUGATA ON (T_BUNSEKI6.作物コード = M_SAKUGATA.作物コード) and (T_BUNSEKI6.作型コード = M_SAKUGATA.作型コード)) '+
        ' LEFT JOIN M_NOUKYOU ON T_UKETUKE6.組合番号 = M_NOUKYOU.組合番号) '+
        ' LEFT JOIN M_SISYO ON (T_UKETUKE6.組合番号 = M_SISYO.組合番号) and (T_UKETUKE6.支店番号 = M_SISYO.支店番号)) '+
        'where ' + pCondition +
        ' ORDER BY T_Bunseki6.試料NO' ;




    SQL.Text := stmp;


   Open;
    while not eof do begin
      if Qcnt = PageCnt then break ;
      INC(QCnt);
      Next ;
    end;
    {該当データ有り？}
    if Eof then begin
      Close ;
      exit ;
    end;
  end;

    // 下でも同じことをやっているのでまとめる。
    //土壌
    // Jval.DojyouCD := PrintModule1.ADOQueryUketuke.FieldByName('T_UKETUKE.土壌コード').asString;


  //xxxxxxxx
    MainForm.VSample := PrintModule1.ADOQueryUketuke.FieldByName('試料NO').asString;
    JVal.SNO := PrintModule1.ADOQueryUketuke.FieldByName('試料NO').asString;
    with PrintModule1.ADOQuerySindan do begin
      Close;
      SQL.Clear;
      stmp := 'select * from T_SINDAN where 試料NO = "'+MainForm.VSample+'"';
      SQL.Add(stmp);

      Open();
      if RecordCount <= 0 then begin
         insert;
         edit;
         fieldbyname('試料NO').AsString := MainForm.VSample;
         post;
      end;
    end;



//H150909
//SindanForm.CalcKijun ;    //基準値設定


//SindanForm.CalcDojou ;    //土壌資材選択





  CurLine := 0;


  with PrintModule1.ADOQueryUketuke do begin



    //グラフ内を一度けす
    TheRect := Rect(HorzPos(0),VertPos(0),HorzPos(300),VertPos(450));
    PrintCanvas.Brush.Bitmap := nil;
    PrintCanvas.Brush.Color := clWhite; //clRed; //White;
    PrintCanvas.Brush.Style := bsSolid	;
    PrintCanvas.FillRect(TheRect);
    //クリアにしておく
    PrintCanvas.Brush.Style := bsClear;


//    PrintCanvas.Font.Name := 'ＭＳ 明朝';
    PrintCanvas.Font.Name := 'メイリオ';





    RectAndText(lmNONE,tlCENTER,taCENTER,0,0,RightEnd,15,		18,
    	'土壌分析結果表',ftBOLD);




    RectAndText(lmNONE,tlCENTER,taRight,0,5,RightEnd,10,		7,
    	'JA全農福島　営農企画部　農業技術センター',ftBOLD);


      CurLine := CurLine + 12;



     CurLine := shindan_top(CurLine);






    //基準値をサーチ
    PrintModule1.ADOQueryKijun.Close;
    stmp := 'select * from M_SAKUMOTU where 作物コード = ''' +
    FieldByName('T_BUNSEKI6.作物コード').asString + '''';
    PrintModule1.ADOQueryKijun.SQL.Text := stmp;
    PrintModule1.ADOQueryKijun.Open;





    //
   CurLine := CurLine + 6;
   CurLine := CurLine + 3;  //隙間

   RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine, 45   , 6  ,		10,
    	'１．一般成分' ,ftNORMAL);

   CurLine := CurLine + 6;
   RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 45   , 6  ,		10,
    	'分析項目' ,ftNORMAL);

   RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		10,
    	'改良目標値' ,ftNORMAL);

   RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 20   , 6  ,		10,
    	'分析値' ,ftNORMAL);

   RectAndText(lmNONE,tlCENTER,taLEFT,0+45+25+20,CurLine, 20   , 5  ,		7,
    	'高い：□' ,ftNORMAL);
   CurLine := CurLine + 5;
   RectAndText(lmNONE,tlCENTER,taLEFT,0+45+25+20,CurLine, 20   , 5  ,		7,
    	'低い：△' ,ftNORMAL);

   CurLine := CurLine - 5;

   CurLine := CurLine + 6;




   kijyunbar( 'pH', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( 'EC', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( 'CEC', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( 'CaO', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( 'MgO', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( 'K2O', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( 'トルオーグP', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '硝酸態N', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '', CurLine );
   CurLine := CurLine + 6;
   kijyunbar( '', CurLine );


  //
   CurLine := CurLine + 3;

   CurLine := CurLine + 6;

   RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine, 45   , 6  ,		10,
    	'２．塩基バランス' ,ftNORMAL);



   CurLine := CurLine + 6;
   iYY2 := CurLine;
   iXX2 := 45+25+20;

    stmp := '分析項目';
   RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 45   , 6  ,		10,
    	stmp ,ftNORMAL);

   stmp := '改良目標値';
   RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		10,
    	stmp, ftNORMAL);

   stmp := '分析値';
   RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 20   , 6  ,		10,
    	stmp,ftNORMAL);



    //塩基バランス計算項目**************************************************************************
    //石灰苦土比
    if FieldByName('MgO').asFloat <>  0 then
    	SekkaiKudo := SekkaiMe(FieldByName('Cao').asFloat) / KudoMe(FieldByName('MgO').asFloat)
    else
      SekkaiKudo := 0;

    JVal.SekkaiKudo := SekkaiKudo;


    //苦土加里比
    if FieldByName('K2O').asFloat <> 0 then
    	KudoKari := KudoMe(FieldByName('MgO').asFloat) / KariMe(FieldByName('K2O').asFloat)
    else
    	KudoKari := 0 ;

    JVal.KudoKari := KudoKari;


    //リン酸苦土比
    if FieldByName('MgO').asFloat <> 0 then
    	RinsanKudo := RinsanMe(dblRinsan) / KudoMe(FieldByName('MgO').asFloat)
    else
    	RinsanKudo := 0 ;

//    JVal.RinsanKudo := RinsanKudo;

    //石灰飽和度    Ver 0.42 *CEC -> /CEC
    if FieldByName('CEC').asFloat <> 0 then
      SekkaiHouwa := SekkaiMe(FieldByName('CaO').asFloat) / FieldByName('CEC').asFloat * 100.0
    else  SekkaiHouwa := 0 ;
    JVal.SekkaiHouwa := SekkaiHouwa;


    //苦土飽和度
    if FieldByName('CEC').asFloat <> 0 then
      JVal.KudoHouwa := KudoMe(FieldByName('MgO').asFloat) / FieldByName('CEC').asFloat * 100.0
    else  JVal.KudoHouwa := 0;



    //加里飽和度
    if FieldByName('CEC').asFloat <> 0 then
      KariHouwa := KariMe(FieldByName('K2O').asFloat) / FieldByName('CEC').asFloat * 100.0
    else  KariHouwa := 0;
    JVal.KariHouwa := KariHouwa;




    //塩基飽和度
    if FieldByName('CEC').asFloat <> 0 then
      EnkiHouwa := (SekkaiMe(FieldByName('CaO').asFloat)+
    							KariMe(FieldByName('K2O').asFloat)+
                  KudoMe(FieldByName('Mgo').asFloat)
                  )/ FieldByName('CEC').asFloat * 100.0
    else  EnkiHouwa := 0 ;
    JVal.EnkiHouwa := EnkiHouwa;




  //石灰・苦土比
   CurLine := CurLine + 6;
   kijyunbar( '石灰苦土', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '苦土加里', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '石灰飽和度', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '苦土飽和度', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '加里飽和度', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '塩基飽和度', CurLine );



  //
   CurLine := CurLine + 3;

   CurLine := CurLine + 6;

   RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine, 45   , 6  ,		10,
    	'３．微量要素　等' ,ftNORMAL);

   CurLine := CurLine + 6;

    stmp := '分析項目';
   RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 45  , 6  ,		10,
    	stmp ,ftNORMAL);

   stmp := '改良目標値';
   RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		10,
    	stmp, ftNORMAL);

   stmp := '分析値';
   RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 20   , 6  ,		10,
    	stmp,ftNORMAL);

   stmp := '【分析値の分布】';
   RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25+20,CurLine, 90   , 6  ,		10,
    	stmp,ftNORMAL);


   RectAndText(lmRECTFILL,tlCENTER,taCENTER,151,CurLine+1, 3   , 3  ,		6,
    	'',ftNORMAL);
   stmp := ':改良目標値';
   RectAndText(lmNONE,tlCENTER,taLEFT,155,CurLine+1, 20   , 4  ,		6,
    	stmp,ftNORMAL);



//   stmp := '：改良目標値';

   //メモリ
   for i := 0 to 14 do begin //  90 / 5 = 18

     if (i > 4) and (i < 10) then begin
       RectAndText(lmRECTFILL,tlCENTER,taCENTER,0+45+25+20+i*6,CurLine+6, 6  , 6*9  ,		10,
       	'',ftNORMAL);
     end
     else begin
       RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25+20+i*6,CurLine+6, 6  , 6*9  ,		10,
       	'',ftNORMAL);

     end;

   end;




   CurLine := CurLine + 6;
   kijyunbar2( 'ケイ酸', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '鉄', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '腐植', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( 'マンガン', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '銅', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( 'ホウ素', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '亜鉛', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '', CurLine );



//レーダーチャート

  //円グラフの印刷
    CurLocX := 135 ; //中心X
    CurLine := 80;   //中心

    //円の角度は水平右＝０度から時計回り
		CircleLine( 0, CurLocX,CurLine,CIRCLEGRFMAXSIZE );
		CircleLine( 1, CurLocX,CurLine,CIRCLEMAXSIZE );
		CircleLine( 2, CurLocX,CurLine,CIRCLEMINSIZE );
		{三角点位置を返す中心座標、距離、角度(右水平=0-360時計回り)}
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,342);
		{ライン表示:二点間直線描画}

		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-5,GetLoc.Y-5,15,4,		10,
    	'リン酸',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,54);


		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y,15,4,		10,
    	'石灰',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,126);

		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-9,GetLoc.Y,15,4,		10,
    	'苦土',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,198);
		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y-5,15,4,		10,
    	'加里',ftBOLD);

    //pH
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,270);
		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y-5,15,4,		10,
    	'ｐＨ',ftBOLD);

    {各測定値の分析値の位置をグラフ下限、上限からピクセルで割り出す}
    PictCenter.x := HorzPos( CurLocX );
    PictCenter.y := VertPos( CurLine );
    //測定値/(上限値-下限値) 戻り値 0.0～1.0
//   function GetScale( aLow, aValue, aMax : double ) : double ;

    GetLocList[1] := GetTrign(PictCenter.x, PictCenter.y ,
   		Round(GetScale(FieldByName('pH').asFloat,'pH')*HorzSize(CIRCLEGRFMAXSIZE)) ,270);

    GetLocList[2] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('トルオーグP').asFloat,'リン酸')*HorzSize(CIRCLEGRFMAXSIZE)) ,342);

    GetLocList[3] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('CaO').asFloat,'石灰')*HorzSize(CIRCLEGRFMAXSIZE)) ,54);

    GetLocList[4] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('MgO').asFloat,'苦土')*HorzSize(CIRCLEGRFMAXSIZE)) ,126);

    GetLocList[5] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('K2O').asFloat,'加里')*HorzSize(CIRCLEGRFMAXSIZE)) ,198);
    //分析値を直線で結ぶ
    for cnt := 1 to 4 do
    	PictSlantLine( GetLocList[cnt],GetLocList[cnt+1] );

   	PictSlantLine( GetLocList[5],GetLocList[1] );



    RectAndText(lmNONE,tlCENTER,taLEFT,CurLocX - 11,CurLine-40, 35   , 6  ,		8,
    	'【分析値の分布】',ftNORMAL);




   //塩基飽和度　グラフ

    iYY2 := iYY2 + 3;  //位置調整

    itmp := CurLocX - iXX2 -10; //グラフの幅

    itmp2 := iXX2 + 10;

    RectAndText(lmNONE,tlCENTER,taLEFT,CurLocX - 11,iYY2-6, 35   , 6  ,		8,
    	'【塩基飽和度】',ftNORMAL);


    //メモリ
    for i := 0 to 4 do begin

    RectAndText(lmRECT,tlCENTER,taLEFT,iXX2 + 10,iYY2+6*i, itmp   , 6  ,		10,
    	'',ftNORMAL);

    end;
    for i := 0 to 4 do begin

    RectAndText(lmRECT,tlCENTER,taLEFT,iXX2 + 10 + itmp,iYY2+6*i, itmp   , 6  ,		10,
    	'',ftNORMAL);

    end;



    RectAndText(lmNONE,tlCENTER,taCENTER,iXX2 + 17,iYY2+6*5, itmp - 15   , 6  ,		8,
    	'改良目標値' ,ftNORMAL);
    RectAndText(lmNONE,tlCENTER,taCENTER,iXX2 + 17 + itmp,iYY2+6*5, itmp - 15   , 6  ,		8,
    	'分析値' ,ftNORMAL);


    itmp2 := itmp2 + 5; //位置調整
    RectAndText(lmRECTFILLBLUE,tlCENTER,taCENTER,itmp2,iYY2+6*6+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

    RectAndText(lmNONE,tlCENTER,taLEFT,itmp2+2,iYY2+6*6, 20   , 4  ,		8,
    	'石灰飽和度' ,ftNORMAL);

    RectAndText(lmRECTFILLRED,tlCENTER,taCENTER,itmp2+2+20,iYY2+6*6+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

    RectAndText(lmNONE,tlCENTER,taLEFT,itmp2+2+20+2,iYY2+6*6, 20   , 4  ,		8,
    	'苦土飽和度' ,ftNORMAL);

    RectAndText(lmRECTFILLYELLOW,tlCENTER,taCENTER,itmp2+2+20+2+20,iYY2+6*6+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

    RectAndText(lmNONE,tlCENTER,taLEFT,itmp2+2+20+2+20+2,iYY2+6*6, 20   , 4  ,		8,
    	'加里飽和度' ,ftNORMAL);



    //１００　　30
    //1メモリ　0.3
    //石灰飽和度
    itmp3 := 0;
    itmp2 := round(JVal.SekkaiHouwaMax * 0.3);
    itmp3 := itmp3 + itmp2;
    itmp4 := iYY2 + (30 - itmp3);
    PrintCanvas.Font.Color := TColor($FFFFFF);
    RectAndText(lmRECTFILLBLUE,tlCENTER,taCENTER,iXX2 + 17,itmp4, itmp - 15, itmp2  ,		8,
    	FtoStr2(Jval.SekkaiHouwaMax,JMode_Houwa)+'%',ftNORMAL);

    PrintCanvas.Font.Color := TColor($000000);
    //苦土飽和
    itmp2 := round(JVal.KudoHouwaMax * 0.3);
    itmp3 := itmp3 + itmp2;
    itmp4 := iYY2 + (30 - itmp3);
    RectAndText(lmRECTFILLRED,tlCENTER,taCENTER,iXX2 + 17,itmp4, itmp - 15, itmp2  ,		8,
    	FtoStr2(Jval.KudoHouwaMax,JMode_Houwa)+'%',ftNORMAL);

    //加里飽和
    itmp2 := round(JVal.KariHouwaMax * 0.3);
    itmp3 := itmp3 + itmp2;
    itmp4 := iYY2 + (30 - itmp3);
    RectAndText(lmRECTFILLYELLOW,tlCENTER,taCENTER,iXX2 + 17,itmp4, itmp - 15, itmp2  ,		8,
    	FtoStr2(Jval.KariHouwaMax,JMode_Houwa)+'%',ftNORMAL);

    btmp :=  JVal.SekkaiHouwaMax + JVal.KudoHouwaMax + JVal.KariHouwaMax;

    RectAndText(lmNONE,tlCENTER,taCENTER,iXX2 + 17,itmp4-5, itmp - 15, 4  ,		8,
    	FtoStr2(btmp,JMode_Houwa)+'%',ftNORMAL);

    //分析値
    //石灰飽和度
    itmp3 := 0;
    itmp2 := round(JVal.SekkaiHouwa * 0.3);
    itmp3 := itmp3 + itmp2;
    itmp4 := iYY2 + (30 - itmp3);
    PrintCanvas.Font.Color := TColor($FFFFFF);
    RectAndText(lmRECTFILLBLUE,tlCENTER,taCENTER,iXX2 + 17 + itmp,itmp4, itmp - 15, itmp2  ,		8,
    	FtoStr2(Jval.SekkaiHouwa,JMode_Houwa)+'%',ftNORMAL);

    PrintCanvas.Font.Color := TColor($000000);
    //苦土飽和
    itmp2 := round(JVal.KudoHouwa * 0.3);
    itmp3 := itmp3 + itmp2;
    itmp4 := iYY2 + (30 - itmp3);
    RectAndText(lmRECTFILLRED,tlCENTER,taCENTER,iXX2 + 17 + itmp,itmp4, itmp - 15, itmp2  ,		8,
    	FtoStr2(Jval.KudoHouwa,JMode_Houwa)+'%',ftNORMAL);

    //加里飽和
    itmp2 := round(JVal.KariHouwa * 0.3);
    itmp3 := itmp3 + itmp2;
    itmp4 := iYY2 + (30 - itmp3);
    RectAndText(lmRECTFILLYELLOW,tlCENTER,taCENTER,iXX2 + 17 + itmp,itmp4, itmp - 15, itmp2  ,		8,
    	FtoStr2(Jval.KariHouwa,JMode_Houwa)+'%',ftNORMAL);

    btmp :=  JVal.SekkaiHouwa + JVal.KudoHouwa + JVal.KariHouwa;

    RectAndText(lmNONE,tlCENTER,taCENTER,iXX2 + 17 + itmp,itmp4-5, itmp - 15, 4  ,		8,
    	FtoStr2(btmp,JMode_Houwa)+'%',ftNORMAL);


   //**********************************************************************************************
   //コメントの印刷
    CurLine := 240;

    RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine,RightEnd,5,		10,
    	'４．コメント',ftNORMAL);


    CurLine := CurLine + 5;
		MaxHeight:=24;

  	aBuff := '';
    if PrintModule1.ADOQuerySindan.RecordCount > 0 then begin

{        aBuff := JKenCmtGet(JVal);

        if JVal.tankaru > 300.0 then begin

          aBuff := aBuff + '炭カルは、１回の施用量が300kg/10aを超えない様に分けて施用して下さい。' +#13;
        end;

        if JVal.Sakucd = '201' then begin   //秋まき小麦

          aBuff := aBuff + '窒素は、基肥として4kg/10a程度を播種時に、残りを起生期から幼穂形成期までに施用する。' +#13;
        end;

    	aBuff := aBuff + PrintModule1.ADOQuerySindan.fieldbyname('所見土壌').asString

}
    end
    else begin
    	aBuff := '';
    end;

   RectAndMemo(lmRECTFILL,0,CurLine,RightEnd,24, 9,aBuff , ftNORMAL, MaxHeight );




    //表示プライマリーキーを返す
    KeyCode := FieldByName('試料NO').asString ;

    case prmDeviceType of
    dvDISP :result := True ;	{このデータ作成ＯＫ}
    dvPRNT : begin {次のデータ有無}
      //次のレコードあるか？
      Next ;
      result := not Eof ;
    end;
    end;
    Close ;
  end;   {with QueryUketuke}

  PrintModule1.ADOQuerySindan.Close;
  PrintModule1.ADOQueryKijun.Close;


  end;


//{ ==========================================================================


//分析値の判定

//
function Bunseki_Hantei( min: Double; max: Double; ans : Double ) : String;
var
stmp : string;
begin

  stmp := '';

  if ans > 0.0 then begin

   if max < ans then begin
      stmp := '□';  //高い
   end
   else if min > ans then begin
      stmp := '△';  //低い
   end;

  end;


   result := stmp;

end;




{ ==========================================================================
  施肥設計表印刷
	戻り値：
    印刷の場合：True 次のデータ存在、false :無し
    画面の場合：True 描画データ存在、false :無し
}
function PrintSekkei(prmDeviceType : TDeviceType; pCondition : string; PageCnt : Integer ; var KeyCode :string  ):Boolean;
var
	Qcnt ,aCnt,MaxHeight,cnt : integer ;
  aBuff,typCEC,aCode : string ;
  Standard : TRecStandard ;
  //SehiList : TSehiHiryo ;  {施肥肥量リスト}
  stmp,stmp2,stmp3 : String;
  no : String;
    TheRect : TRect;
    LX, LY : Integer;  //レーダーチャートの位置
    XX1, YY1 : Integer;
    XX, YY : Integer;
    XX2, YY2 : Integer;

  RMax : Integer;  //用紙幅

  sakucd : String;
  btmp,btmp2,btmp3 : Double;

  btmpN,btmpP,btmpK : Double;
  btmpN2,btmpP2,btmpK2 : Double;
  btmpN3,btmpP3,btmpK3 : Double;


  aRecHiryo : TRecHiryo ;

  aRecHiryo2 : array[1..3] of TRecHiryo ;

  SiteiHiryo : array[1..2] of TRecHiryo ;

  takasa : integer;
  mojisize : integer;
  btmpall : double;
  CurLocX : integer;
  GetLoc,PictCenter : TPoint ;
  GetLocList : array[1..6] of TPoint ;	//グラフチャート用角のピクセル座標
  GetLocList2 : array[1..6] of TPoint ;	//グラフチャート用角のピクセル座標

  sehiN, sehiP, sehiK : double;
  tuihi1N, tuihi1P, tuihi1K : double;
  tuihi2N, tuihi2P, tuihi2K : double;

  byouryou : double;

  i : integer;


begin
	result := False;

  RMAX := RightEnd; //220;  //B4 tate

  //所定のデータまで移動
  Qcnt := 1 ;
  with PrintModule1.ADOQueryUketuke do begin



  	Close;

{
     stmp := 'SELECT T_UKETUKE.*, M_NOUKA.*, M_DOJOU.*, M_DOSEI.*,M_SAKUMOKU.作目名 as 作目名,M_FUSHOKU.*,M_CITY.*'+
     ' FROM (((((((T_UKETUKE'+
     ' LEFT JOIN M_SAKUMOTU ON (T_UKETUKE.作目コード = M_SAKUMOTU.作目コード) AND (T_UKETUKE.作物コード = M_SAKUMOTU.作物コード))'+
     ' LEFT JOIN M_SAKUGATA ON (T_UKETUKE.作目コード = M_SAKUGATA.作目コード) AND (T_UKETUKE.作物コード = M_SAKUGATA.作物コード) AND (T_UKETUKE.作型コード = M_SAKUGATA.作型コード))'+
     ' LEFT JOIN M_SAKUMOKU ON T_UKETUKE.作目コード = M_SAKUMOKU.作目コード)'+
     ' LEFT JOIN M_DOJOU ON T_UKETUKE.土壌コード = M_DOJOU.土壌コード)'+
     ' LEFT JOIN M_DOSEI ON T_UKETUKE.土性コード = M_DOSEI.土性コード)'+
     ' LEFT JOIN M_FUSHOKU ON T_UKETUKE.腐植コード = M_FUSHOKU.腐植コード)'+
     ' LEFT JOIN M_CITY ON T_UKETUKE.市町村コード = M_CITY.市町村コード)'+
     ' LEFT JOIN M_NOUKA ON T_UKETUKE.農家番号 = M_NOUKA.農家番号'+
     ' WHERE '+pCondition+
     ' ORDER BY T_UKETUKE.サンプル番号';

}

          stmp := 'Select T_BUNSEKI6.*,T_UKETUKE6.*,M_NOUKYOU.*,M_SISYO.*,M_SAKUMOTU.*,M_SAKUGATA.* '+
        'from (((((T_BUNSEKI6 '+
        ' LEFT JOIN T_UKETUKE6 ON T_BUNSEKI6.受付NO = T_UKETUKE6.受付NO) '+
        ' LEFT JOIN M_SAKUMOTU ON T_BUNSEKI6.作物コード = M_SAKUMOTU.作物コード) '+
        ' LEFT JOIN M_SAKUGATA ON (T_BUNSEKI6.作物コード = M_SAKUGATA.作物コード) and (T_BUNSEKI6.作型コード = M_SAKUGATA.作型コード)) '+
        ' LEFT JOIN M_NOUKYOU ON T_UKETUKE6.組合番号 = M_NOUKYOU.組合番号) '+
        ' LEFT JOIN M_SISYO ON (T_UKETUKE6.組合番号 = M_SISYO.組合番号) and (T_UKETUKE6.支店番号 = M_SISYO.支店番号)) '+
        'where ' + pCondition +
        ' ORDER BY T_Bunseki6.試料NO' ;





    SQL.Text := stmp;



   Open;
    while not eof do begin
      if Qcnt = PageCnt then break ;
      INC(QCnt);
      Next ;
    end;
    {該当データ有り？}
    if Eof then begin
      Close ;
      exit ;
    end;



  end;



//  Application.CreateForm(TFSehiSekkei, FSehiSekkei);






  with PrintModule1.ADOQueryUketuke do begin

  //初期フォント
//  PrintCanvas.Font.Name := 'ＭＳ Ｐゴシック';
//  PrintCanvas.Font.Name := 'HG丸ｺﾞｼｯｸM-PRO';
  PrintCanvas.Font.Name := 'メイリオ';



    //グラフ内を一度けす

    TheRect := Rect(HorzPos(0),VertPos(0),HorzPos(300),VertPos(450));
    PrintCanvas.Brush.Bitmap := nil;
    PrintCanvas.Brush.Color := clWhite; //clRed; //White;
    PrintCanvas.Brush.Style := bsSolid	;
    PrintCanvas.FillRect(TheRect);
    //クリアにしておく
    PrintCanvas.Brush.Style := bsClear;






PrintModule1.ADOQuerySindan.close;
PrintModule1.ADOQuerySindan.SQL.Clear;
MainForm.VSample := FieldBYName('試料NO').AsString;
stmp := 'select * from T_SINDAN where 試料NO = "'+MainForm.VSample+'"';
PrintModule1.ADOQuerySindan.SQL.Add(stmp);


//    PrintModule1.ADOQuerySindan.Parameters.ParamByName('サンプル番号').Value := FieldByName('サンプル番号').AsString;
    PrintModule1.ADOQuerySindan.open;

    with PrintModule1.ADOQuerySindan do begin
      Close;
      SQL.Clear;
      stmp := 'select * from T_SINDAN where 試料NO = "'+MainForm.VSample+'"';
      SQL.Add(stmp);

      Open();
      if RecordCount <= 0 then begin
         insert;
         edit;
         fieldbyname('試料NO').AsString := MainForm.VSample;
         post;
      end;
    end;


//土改材の計算を省く






    //肥料設計　FSkehiSekkei
{
    sakucd := FieldByName('作目コード').asString + FieldByName('作物コード').asString;

    if not PrintModule1.ADOQuerySindan.FieldByName('SIM計算済').asBoolean then begin


      FSehiSekkei.SehiSekkei;


    end;
      FSehiSekkei.SehiSekkei2;
}






    //テーブルの保存　A.Nishimura
    if PrintModule1.ADOQuerySindan.State in [dsEdit	,dsInsert] then
       PrintModule1.ADOQuerySindan.Post;





     CurLine := 0;


    RectAndText(lmNONE,tlCENTER,taCENTER,0,0,RightEnd,15,		18,
    	'施肥設計表',ftBOLD);



    RectAndText(lmNONE,tlCENTER,taRight,0,5,RightEnd,10,		7,
    	'JA全農福島　営農企画部　農業技術センター',ftBOLD);


      CurLine := CurLine + 12;

     //受付情報
     CurLine := shindan_top(CurLine);

   //基準値をサーチ
    PrintModule1.ADOQueryKijun.Close;
    stmp := 'select * from M_SAKUMOTU where 作物コード = ''' +
    FieldByName('T_BUNSEKI6.作物コード').asString + '''';
    PrintModule1.ADOQueryKijun.SQL.Text := stmp;
    PrintModule1.ADOQueryKijun.Open;



  CurLine := CurLine + 6;
  CurLine := CurLine + 3;


    RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine, 30   , 6  ,		10,
    	'１．目標施用量' ,ftNORMAL);

  CurLine := CurLine + 6;

  takasa := 5;
  mojisize := 10;

  YY1 := CurLine;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 40   , takasa  ,	mojisize,
    	'施用時期' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+40,CurLine, 15   , takasa  ,	mojisize,
    	'窒素' ,ftNORMAL);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15,CurLine, 15   ,takasa  ,	mojisize,
    	'リン酸' ,ftNORMAL);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15+15,CurLine, 15   ,takasa  ,	mojisize,
    	'加里' ,ftNORMAL);

  CurLine := CurLine + takasa;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 40   ,takasa  ,	mojisize,
    	'基　　肥' ,ftNORMAL);

  btmpN := 0; btmpP := 0; btmpK := 0;

  sehiN := Fieldbyname('基肥N').AsFloat;

  btmpN := btmpN + sehiN;
  stmp := FtoStr(sehiN, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);


  sehiP := Fieldbyname('基肥P').AsFloat;
  btmpP := btmpP + sehiP;
  stmp := FtoStr(sehiP, 1);
    RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);



  btmp := Fieldbyname('基肥K').AsFloat;
  sehiK := btmp;
  btmpK := btmpK + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);
  CurLine := CurLine + takasa;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 40   ,takasa  ,	mojisize,
    	'追　肥１' ,ftNORMAL);


  btmp := Fieldbyname('追肥N').AsFloat;
  tuihi1N := btmp;
  btmpN := btmpN + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);



  btmp := Fieldbyname('追肥P').AsFloat;
  tuihi1P := btmp;
  btmpP := btmpP + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);




  btmp := Fieldbyname('追肥K').AsFloat;
  tuihi1K := btmp;
  btmpK := btmpK + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);
  CurLine := CurLine + takasa;



  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 40   ,takasa  ,	mojisize,
    	'追　肥２' ,ftNORMAL);

  btmp := Fieldbyname('3回目N').AsFloat;
  tuihi2N := btmp;
  btmpN := btmpN + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);



  btmp := Fieldbyname('3回目P').AsFloat;
  tuihi2P := btmp;
  btmpP := btmpP + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);


  btmp := Fieldbyname('3回目K').AsFloat;
  tuihi2K := btmp;
  btmpK := btmpK + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);

  CurLine := CurLine + takasa;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 40   ,takasa  ,	mojisize,
    	'合　　計' ,ftNORMAL);


  stmp := FtoStr(btmpN, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);
  stmp := FtoStr(btmpP, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);
  stmp := FtoStr(btmpK, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);






  //コメント
   aBuff := Fieldbyname('M_SAKUGATA.備考').AsString;
   MaxHeight:=25;

   RectAndMemo(lmRECTFILL,40+15+15+15+3,YY1, 92  ,25, 6 ,aBuff , ftNORMAL, MaxHeight);



   //肥料の選択

   //除外するもの
   //無　単肥　土壌改良　　が空白のもの

 　//JA組合名

   //作物


   //
    PrintModule1.ADOQKasei.Close;
    stmp := 'select * from M_KASEI6 where (無 is null) and (単肥 is null) and (土壌改良 is null) and (施肥タイプ is null)';

    stmp2 :=   Fieldbyname('T_UKETUKE6.組合番号').asString;
    case Strtoint(stmp2) of
     2: stmp3 := '未来';  //ふくしま未来
     661: stmp3 := 'さくら'; //福島さくら
     252: stmp3 := 'みなみ'; //夢みなみ
     541: stmp3 := 'さくら'; //会津よつば
     326: stmp3 := '東西'; //東西しらかわ
    end;
    stmp := stmp + ' and (' + stmp3 + '= "●")';


    stmp2 :=   Fieldbyname('T_BUNSEKI6.作物コード').asString;
    case Strtoint(copy(stmp2,1,1)) of
     1: stmp3 := '水稲';
     2: stmp3 := '畑作';
     3: stmp3 := '野菜';
     4: stmp3 := '果樹';
     5: stmp3 := '花き';
     6: stmp3 := 'その他';
     else stmp3 := 'その他';
    end;
    stmp := stmp + ' and (' + stmp3 + '= "●")';



    PrintModule1.ADOQKasei.SQL.Text := stmp;
    PrintModule1.ADOQKasei.open;






    //追肥
    PrintModule1.ADOQKasei2.Close;
    stmp := 'select * from M_KASEI6 where (無 is null) and (単肥 is null) and (土壌改良 is null) and not(施肥タイプ is null)';

    stmp2 :=   Fieldbyname('T_UKETUKE6.組合番号').asString;
    case Strtoint(stmp2) of
     2: stmp3 := '未来';  //ふくしま未来
     661: stmp3 := 'さくら'; //福島さくら
     252: stmp3 := 'みなみ'; //夢みなみ
     541: stmp3 := 'さくら'; //会津よつば
     326: stmp3 := '東西'; //東西しらかわ
    end;
    stmp := stmp + ' and (' + stmp3 + '= "●")';


    stmp2 :=   Fieldbyname('T_BUNSEKI6.作物コード').asString;
    case Strtoint(copy(stmp2,1,1)) of
     1: stmp3 := '水稲';
     2: stmp3 := '畑作';
     3: stmp3 := '野菜';
     4: stmp3 := '果樹';
     5: stmp3 := '花き';
     6: stmp3 := 'その他';
     else stmp3 := 'その他';
    end;
    stmp := stmp + ' and (' + stmp3 + '= "●")';



    PrintModule1.ADOQKasei2.SQL.Text := stmp;
    PrintModule1.ADOQKasei2.open;











  //  設計案
  CurLine := CurLine + takasa;
  CurLine := CurLine + 3;





   RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine, 30   , 6  ,		10,
    	'２．施肥設計案①' ,ftNORMAL);

   CurLine := CurLine + 6;
   LY := CurLine;

   RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 45   , 11  ,		8,
    	'品　名' ,ftNORMAL);


   RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 11  ,		8,
    	'施肥量' ,ftNORMAL);


   RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7*7   , 6  ,		8,
    	'成分量(kg/10a)' ,ftNORMAL);


  CurLine := CurLine + 6;

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 5  ,		7,
    	'窒素' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 5  ,	 6,
    	'リン酸' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 5  ,		7,
    	'加里' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 5  ,		7,
    	'石灰' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 5  ,		7,
    	'苦土' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 5  ,	6,
    	'ケイ酸' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 5  ,		7,
    	'鉄' ,ftNORMAL);



  LX := 0+45+15+7*7;
  LX := LX + 3;



  CurLine := CurLine + 5;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 5   , 10  ,		8,
    	'基肥' ,ftNORMAL);


  stmp :=  PrintModule1.ADOQKasei.Fieldbyname('品名').asString;

  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp ,ftNORMAL);


  stmp := FtoStr(PrintModule1.ADOQKasei.Fieldbyname('N').asFloat,JMode_1);

  //施肥量
  btmp := PrintModule1.ADOQKasei.Fieldbyname('N').asFloat;
  if btmp > 0 then begin
     byouryou := sehiN / (btmp / 100);
     stmp := Ftostr(byouryou, JMode_1);

  end
  else begin
    stmp := '';
    byouryou := 0;
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 10  ,		10,
    	stmp ,ftNORMAL);


 //成分N
  btmp := PrintModule1.ADOQKasei.Fieldbyname('N').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);



 //成分P
  btmp := PrintModule1.ADOQKasei.Fieldbyname('P').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 10  ,	 7,
    	stmp ,ftNORMAL);

 //成分K
  btmp := PrintModule1.ADOQKasei.Fieldbyname('K').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

  stmp := '';
  //
  btmp := PrintModule1.ADOQKasei.Fieldbyname('Ca').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);
  //
  btmp := PrintModule1.ADOQKasei.Fieldbyname('Mg').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

//
  btmp := PrintModule1.ADOQKasei.Fieldbyname('Si').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 10  ,	7,
    	stmp ,ftNORMAL);

//
  btmp := PrintModule1.ADOQKasei.Fieldbyname('Fe').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);





  stmp := '('+ FtoStr2(PrintModule1.ADOQKasei.Fieldbyname('N').asFloat,JMode_N);
  stmp := stmp + '-'+ FtoStr2(PrintModule1.ADOQKasei.Fieldbyname('P').asFloat,JMode_N);
  stmp := stmp + '-'+ FtoStr2(PrintModule1.ADOQKasei.Fieldbyname('K').asFloat,JMode_N);
  stmp := stmp + ')';

  CurLine := CurLine + 6;
  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 4  ,		6,
    	stmp ,ftNORMAL);




  ////////////////////////////////////////////////////////////////



  CurLine := CurLine + 4;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 5   , 10 ,		8,
    	'追肥' ,ftNORMAL);

  stmp :=  PrintModule1.ADOQKasei2.Fieldbyname('品名').asString;

    RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp ,ftNORMAL);


 //施肥量
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('N').asFloat;
  if btmp > 0 then begin
     byouryou := sehiN / (btmp / 100);
     stmp := Ftostr(byouryou, JMode_1);

  end
  else begin
    stmp := '';
    byouryou := 0;
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 10  ,		10,  	stmp ,ftNORMAL);




 //成分N
  btmp := PrintModule1.ADOQKasei.Fieldbyname('N').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);



 //成分P
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('P').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 10  ,	 7,
    	stmp ,ftNORMAL);

 //成分K
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('K').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

  stmp := '';
  //
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('Ca').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);
  //
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('Mg').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

//
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('Si').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 10  ,	7,
    	stmp ,ftNORMAL);

//
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('Fe').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);



  CurLine := CurLine + 6;


  stmp := '('+ FtoStr2(PrintModule1.ADOQKasei2.Fieldbyname('N').asFloat,JMode_N);
  stmp := stmp + '-'+ FtoStr2(PrintModule1.ADOQKasei2.Fieldbyname('P').asFloat,JMode_N);
  stmp := stmp + '-'+ FtoStr2(PrintModule1.ADOQKasei2.Fieldbyname('K').asFloat,JMode_N);
  stmp := stmp + ')';

  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 4  ,		6,
    	stmp,ftNORMAL);



  CurLine := CurLine + 4;




  //////////////////////////////////////////////////////////////////////


  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 5   , 10  ,		8,
    	'追肥' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	'' ,ftNORMAL);


  stmp := '';
  //施肥量
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 10  ,		10,
    	stmp ,ftNORMAL);


  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);


 //成分P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 10  ,	 7,
    	stmp ,ftNORMAL);

 //成分K
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 10  ,	7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);


  CurLine := CurLine + 6;

  {
  stmp := '('+ FtoStr2(PrintModule1.ADOQKasei3.Fieldbyname('N').asFloat,JMode_N);
  stmp := stmp + '-'+ FtoStr2(PrintModule1.ADOQKasei3.Fieldbyname('P').asFloat,JMode_N);
  stmp := stmp + '-'+ FtoStr2(PrintModule1.ADOQKasei3.Fieldbyname('K').asFloat,JMode_N);
  stmp := stmp + ')';
  }
  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 4  ,		6,
    	stmp,ftNORMAL);


  CurLine := CurLine + 4;





  ////////////////////////////////////////////////////////////////////////


  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 5   , 12  ,		8,
    	'土' ,ftNORMAL);



  stmp := FieldByname('土改材1').AsString;
  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp,ftNORMAL);



  btmp := FieldByname('土改材量1').AsFloat;
  stmp := FtoStr2(btmp, JMode_1);
  //施肥量
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 6  ,		10,
    	stmp ,ftNORMAL);

  stmp := '';

  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 6 ,		7,
    	stmp ,ftNORMAL);


 //成分P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 6  ,	 7,
    	stmp ,ftNORMAL);

 //成分K
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 6  ,	7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);



  CurLine := CurLine + 6;


   //

  stmp := FieldByname('土改材2').AsString;
  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp ,ftNORMAL);


  btmp := FieldByname('土改材量2').AsFloat;
  stmp := FtoStr2(btmp, JMode_1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 6  ,	 10,
    	stmp ,ftNORMAL);

  stmp := '';
  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 6 ,		7,
    	stmp ,ftNORMAL);


 //成分P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 6  ,	 7,
    	stmp ,ftNORMAL);

 //成分K
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 6  ,	7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);








  CurLine := CurLine + 6;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 45+15   , 6  ,		10,
    	'合計' ,ftNORMAL);

   stmp := '';
  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);


 //成分P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 6  ,	 7,
    	stmp ,ftNORMAL);

 //成分K
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 6  ,	7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);









 //グラフ
  CurLine := CurLine + 6;

  RectAndText(lmRECTFILLBLUE,tlCENTER,taCENTER,0,CurLine+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

  RectAndText(lmNONE,tlCENTER,taLEFT,0+2,CurLine, 20   , 4  ,		8,
    	'石灰飽和度' ,ftNORMAL);

  RectAndText(lmRECTFILLRED,tlCENTER,taCENTER,0+2+20,CurLine+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

  RectAndText(lmNONE,tlCENTER,taLEFT,0+2+20+2,CurLine, 20   , 4  ,		8,
    	'苦土飽和度' ,ftNORMAL);

  RectAndText(lmRECTFILLYELLOW,tlCENTER,taCENTER,0+2+20+2+20,CurLine+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

  RectAndText(lmNONE,tlCENTER,taLEFT,0+2+20+2+20+2,CurLine, 20   , 4  ,		8,
    	'加里飽和度' ,ftNORMAL);



  CurLine := CurLine + 4;





  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 19   , 6  ,		10,
    	'改善値' ,ftNORMAL);

  for i := 0 to 9 do begin

  RectAndText(lmRECT,tlCENTER,taCENTER,0+19+9*i,CurLine, 9  , 6  ,		10,
    	'' ,ftNORMAL);

  end;

  //棒
  // 90

  CurLine := CurLine + 1;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+19,CurLine, 9*5   , 4  ,		10,
    	'---' ,ftNORMAL);


  CurLine := CurLine + 5;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 19   , 6  ,		10,
    	'分析値' ,ftNORMAL);


  for i := 0 to 9 do begin

  RectAndText(lmRECT,tlCENTER,taCENTER,0+19+9*i,CurLine, 9  , 6  ,		10,
    	'' ,ftNORMAL);

  end;


  CurLine := CurLine + 1;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+19,CurLine, 9*7   , 4  ,		10,
    	'---' ,ftNORMAL);





  //メモリ
  CurLine := CurLine + 5;
  btmp := 0;
  for i := 0 to 10 do begin
    btmp := i * 10;
    stmp := FtoStr2(btmp, 0);
    RectAndText(lmNONE,tlCENTER,taCENTER,0+17+9*i,CurLine, 4 , 4  ,		6,
    	stmp ,ftNORMAL);

  end;






  ///////////////////////////////////////////////////////////////////////////



  //レーダーチャート
  RectAndText(lmRECT,tlCENTER,taCENTER,LX,LY, 67   , 79  ,		10,
    	'' ,ftNORMAL);


  YY1 := CurLine;

  //円グラフの印刷
    CurLocX := 144; //中心X
    CurLine := 118;   //中心

    //円の角度は水平右＝０度から時計回り
		CircleLine( 0, CurLocX,CurLine,CIRCLEGRFMAXSIZE );
		CircleLine( 1, CurLocX,CurLine,CIRCLEMAXSIZE );
		CircleLine( 2, CurLocX,CurLine,CIRCLEMINSIZE );
		{三角点位置を返す中心座標、距離、角度(右水平=0-360時計回り)}
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,342);
		{ライン表示:二点間直線描画}

		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-5,GetLoc.Y-5,15,4,		10,
    	'リン酸',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,54);


		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y,15,4,		10,
    	'石灰',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,126);

		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-9,GetLoc.Y,15,4,		10,
    	'苦土',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,198);
		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y-5,15,4,		10,
    	'加里',ftBOLD);

    //pH
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,270);
		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y-5,15,4,		10,
    	'ｐＨ',ftBOLD);

    {各測定値の分析値の位置をグラフ下限、上限からピクセルで割り出す}
    PictCenter.x := HorzPos( CurLocX );
    PictCenter.y := VertPos( CurLine );
    //測定値/(上限値-下限値) 戻り値 0.0～1.0
//   function GetScale( aLow, aValue, aMax : double ) : double ;

    GetLocList[1] := GetTrign(PictCenter.x, PictCenter.y ,
   		Round(GetScale(FieldByName('pH').asFloat,'pH')*HorzSize(CIRCLEGRFMAXSIZE)) ,270);

    GetLocList[2] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('トルオーグP').asFloat,'リン酸')*HorzSize(CIRCLEGRFMAXSIZE)) ,342);

    GetLocList[3] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('CaO').asFloat,'石灰')*HorzSize(CIRCLEGRFMAXSIZE)) ,54);

    GetLocList[4] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('MgO').asFloat,'苦土')*HorzSize(CIRCLEGRFMAXSIZE)) ,126);

    GetLocList[5] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('K2O').asFloat,'加里')*HorzSize(CIRCLEGRFMAXSIZE)) ,198);



     GetLocList2[1] := GetTrign(PictCenter.x, PictCenter.y ,
   		Round(GetScale(FieldByName('pH').asFloat+2.5,'pH')*HorzSize(CIRCLEGRFMAXSIZE)) ,270);

    GetLocList2[2] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('トルオーグP').asFloat+50,'リン酸')*HorzSize(CIRCLEGRFMAXSIZE)) ,342);

    GetLocList2[3] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('CaO').asFloat+120,'石灰')*HorzSize(CIRCLEGRFMAXSIZE)) ,54);

    GetLocList2[4] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('MgO').asFloat+10,'苦土')*HorzSize(CIRCLEGRFMAXSIZE)) ,126);

    GetLocList2[5] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('K2O').asFloat+30,'加里')*HorzSize(CIRCLEGRFMAXSIZE)) ,198);



    //分析値を直線で結ぶ
    for cnt := 1 to 4 do
     	PictSlantLine( GetLocList[cnt],GetLocList[cnt+1] );
     	PictSlantLine( GetLocList[5],GetLocList[1] );

    for cnt := 1 to 4 do
    	PictSlantLine3( GetLocList2[cnt],GetLocList2[cnt+1] );
     	PictSlantLine3( GetLocList2[5],GetLocList2[1] );










   CurLine := YY1;
   CurLine := CurLine + 6;


  ///////////////////////////////////////////////////////////////////////////////
  ///// 設計案２　
  ///////////////////////////////////////////////////////////////////////////////

     RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine, 30   , 6  ,		10,
    	'３．施肥設計案①' ,ftNORMAL);

   CurLine := CurLine + 6;
   LY := CurLine;

   RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 45   , 11  ,		8,
    	'品　名' ,ftNORMAL);


   RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 11  ,		8,
    	'施肥量' ,ftNORMAL);


   RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7*7   , 6  ,		8,
    	'成分量(kg/10a)' ,ftNORMAL);


  CurLine := CurLine + 6;

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 5  ,		7,
    	'窒素' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 5  ,	 6,
    	'リン酸' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 5  ,		7,
    	'加里' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 5  ,		7,
    	'石灰' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 5  ,		7,
    	'苦土' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 5  ,	6,
    	'ケイ酸' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 5  ,		7,
    	'鉄' ,ftNORMAL);



  LX := 0+45+15+7*7;
  LX := LX + 3;



  CurLine := CurLine + 5;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 5   , 10  ,		8,
    	'基肥' ,ftNORMAL);

  PrintModule1.ADOQKasei.next;

  stmp :=  PrintModule1.ADOQKasei.Fieldbyname('品名').asString;

  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp ,ftNORMAL);


  stmp := FtoStr(PrintModule1.ADOQKasei.Fieldbyname('N').asFloat,JMode_1);

  //施肥量
  btmp := PrintModule1.ADOQKasei.Fieldbyname('N').asFloat;
  if btmp > 0 then begin
     byouryou := sehiN / (btmp / 100);
     stmp := Ftostr(byouryou, JMode_1);

  end
  else begin
    stmp := ' ';
    byouryou := 0;
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 10  ,		10,
    	stmp ,ftNORMAL);


 //成分N
  btmp := PrintModule1.ADOQKasei.Fieldbyname('N').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);



 //成分P
  btmp := PrintModule1.ADOQKasei.Fieldbyname('P').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 10  ,	 7,
    	stmp ,ftNORMAL);

 //成分K
  btmp := PrintModule1.ADOQKasei.Fieldbyname('K').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

  stmp := '';
  //
  btmp := PrintModule1.ADOQKasei.Fieldbyname('Ca').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);
  //
  btmp := PrintModule1.ADOQKasei.Fieldbyname('Mg').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

//
  btmp := PrintModule1.ADOQKasei.Fieldbyname('Si').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 10  ,	7,
    	stmp ,ftNORMAL);

//
  btmp := PrintModule1.ADOQKasei.Fieldbyname('Fe').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);





  stmp := '('+ FtoStr2(PrintModule1.ADOQKasei.Fieldbyname('N').asFloat,JMode_N);
  stmp := stmp + '-'+ FtoStr2(PrintModule1.ADOQKasei.Fieldbyname('P').asFloat,JMode_N);
  stmp := stmp + '-'+ FtoStr2(PrintModule1.ADOQKasei.Fieldbyname('K').asFloat,JMode_N);
  stmp := stmp + ')';

  CurLine := CurLine + 6;
  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 4  ,		6,
    	stmp ,ftNORMAL);




  ////////////////////////////////////////////////////////////////



  CurLine := CurLine + 4;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 5   , 10 ,		8,
    	'追肥' ,ftNORMAL);

  stmp :=  PrintModule1.ADOQKasei2.Fieldbyname('品名').asString;

    RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp ,ftNORMAL);


 //施肥量
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('N').asFloat;
  if btmp > 0 then begin
     byouryou := sehiN / (btmp / 100);
     stmp := Ftostr(byouryou, JMode_1);

  end
  else begin
    stmp := ' ';
    byouryou := 0;
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 10  ,		10,  	stmp ,ftNORMAL);




 //成分N
  btmp := PrintModule1.ADOQKasei.Fieldbyname('N').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);



 //成分P
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('P').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 10  ,	 7,
    	stmp ,ftNORMAL);

 //成分K
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('K').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

  stmp := '';
  //
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('Ca').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);
  //
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('Mg').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

//
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('Si').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 10  ,	7,
    	stmp ,ftNORMAL);

//
  btmp := PrintModule1.ADOQKasei2.Fieldbyname('Fe').asFloat;
  if btmp > 0  then begin
    btmp2 := byouryou * (btmp / 100.0);
    stmp := Ftostr(btmp2, JMode_1);
  end
  else begin
    btmp2 := 0;
    stmp := '0.0';
  end;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);



  CurLine := CurLine + 6;


  stmp := '('+ FtoStr2(PrintModule1.ADOQKasei2.Fieldbyname('N').asFloat,JMode_N);
  stmp := stmp + '-'+ FtoStr2(PrintModule1.ADOQKasei2.Fieldbyname('P').asFloat,JMode_N);
  stmp := stmp + '-'+ FtoStr2(PrintModule1.ADOQKasei2.Fieldbyname('K').asFloat,JMode_N);
  stmp := stmp + ')';

  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 4  ,		6,
    	stmp,ftNORMAL);



  CurLine := CurLine + 4;




  //////////////////////////////////////////////////////////////////////


  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 5   , 10  ,		8,
    	'追肥' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	'' ,ftNORMAL);


  stmp := '';
  //施肥量
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 10  ,		10,
    	stmp ,ftNORMAL);


  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);


 //成分P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 10  ,	 7,
    	stmp ,ftNORMAL);

 //成分K
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 10  ,	7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);


  CurLine := CurLine + 6;

  {
  stmp := '('+ FtoStr2(PrintModule1.ADOQKasei3.Fieldbyname('N').asFloat,JMode_N);
  stmp := stmp + '-'+ FtoStr2(PrintModule1.ADOQKasei3.Fieldbyname('P').asFloat,JMode_N);
  stmp := stmp + '-'+ FtoStr2(PrintModule1.ADOQKasei3.Fieldbyname('K').asFloat,JMode_N);
  stmp := stmp + ')';
  }
  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 4  ,		6,
    	stmp,ftNORMAL);


  CurLine := CurLine + 4;





  ////////////////////////////////////////////////////////////////////////


  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 5   , 12  ,		8,
    	'土' ,ftNORMAL);



  stmp := FieldByname('土改材1').AsString;
  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp,ftNORMAL);



  btmp := FieldByname('土改材量1').AsFloat;
  stmp := FtoStr2(btmp, JMode_1);
  //施肥量
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 6  ,		10,
    	stmp ,ftNORMAL);

  stmp := '';

  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 6 ,		7,
    	stmp ,ftNORMAL);


 //成分P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 6  ,	 7,
    	stmp ,ftNORMAL);

 //成分K
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 6  ,	7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);



  CurLine := CurLine + 6;


   //

  stmp := FieldByname('土改材2').AsString;
  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp ,ftNORMAL);


  btmp := FieldByname('土改材量2').AsFloat;
  stmp := FtoStr2(btmp, JMode_1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 6  ,	 10,
    	stmp ,ftNORMAL);

  stmp := '';
  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 6 ,		7,
    	stmp ,ftNORMAL);


 //成分P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 6  ,	 7,
    	stmp ,ftNORMAL);

 //成分K
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 6  ,	7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);








  CurLine := CurLine + 6;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 45+15   , 6  ,		10,
    	'合計' ,ftNORMAL);

   stmp := '';
  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);


 //成分P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 6  ,	 7,
    	stmp ,ftNORMAL);

 //成分K
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

  //
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 6  ,	7,
    	stmp ,ftNORMAL);

//
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);









 //グラフ
  CurLine := CurLine + 6;

  RectAndText(lmRECTFILLBLUE,tlCENTER,taCENTER,0,CurLine+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

  RectAndText(lmNONE,tlCENTER,taLEFT,0+2,CurLine, 20   , 4  ,		8,
    	'石灰飽和度' ,ftNORMAL);

  RectAndText(lmRECTFILLRED,tlCENTER,taCENTER,0+2+20,CurLine+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

  RectAndText(lmNONE,tlCENTER,taLEFT,0+2+20+2,CurLine, 20   , 4  ,		8,
    	'苦土飽和度' ,ftNORMAL);

  RectAndText(lmRECTFILLYELLOW,tlCENTER,taCENTER,0+2+20+2+20,CurLine+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

  RectAndText(lmNONE,tlCENTER,taLEFT,0+2+20+2+20+2,CurLine, 20   , 4  ,		8,
    	'加里飽和度' ,ftNORMAL);



  CurLine := CurLine + 4;





  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 19   , 6  ,		10,
    	'改善値' ,ftNORMAL);

  for i := 0 to 9 do begin

  RectAndText(lmRECT,tlCENTER,taCENTER,0+19+9*i,CurLine, 9  , 6  ,		10,
    	'' ,ftNORMAL);

  end;

  //棒
  // 90

  CurLine := CurLine + 1;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+19,CurLine, 9*5   , 4  ,		10,
    	'---' ,ftNORMAL);


  CurLine := CurLine + 5;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 19   , 6  ,		10,
    	'分析値' ,ftNORMAL);


  for i := 0 to 9 do begin

  RectAndText(lmRECT,tlCENTER,taCENTER,0+19+9*i,CurLine, 9  , 6  ,		10,
    	'' ,ftNORMAL);

  end;


  CurLine := CurLine + 1;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+19,CurLine, 9*7   , 4  ,		10,
    	'---' ,ftNORMAL);





  //メモリ
  CurLine := CurLine + 5;
  btmp := 0;
  for i := 0 to 10 do begin
    btmp := i * 10;
    stmp := FtoStr2(btmp, 0);
    RectAndText(lmNONE,tlCENTER,taCENTER,0+17+9*i,CurLine, 4 , 4  ,		6,
    	stmp ,ftNORMAL);

  end;






  ///////////////////////////////////////////////////////////////////////////



  //レーダーチャート
  RectAndText(lmRECT,tlCENTER,taCENTER,LX,LY, 67   , 79  ,		10,
    	'' ,ftNORMAL);


  //YY1 := CurLine;

  //円グラフの印刷
    CurLocX := 144; //中心X
    CurLine := LY+38;   //中心

    //円の角度は水平右＝０度から時計回り
		CircleLine( 0, CurLocX,CurLine,CIRCLEGRFMAXSIZE );
		CircleLine( 1, CurLocX,CurLine,CIRCLEMAXSIZE );
		CircleLine( 2, CurLocX,CurLine,CIRCLEMINSIZE );
		{三角点位置を返す中心座標、距離、角度(右水平=0-360時計回り)}
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,342);
		{ライン表示:二点間直線描画}

		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-5,GetLoc.Y-5,15,4,		10,
    	'リン酸',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,54);


		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y,15,4,		10,
    	'石灰',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,126);

		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-9,GetLoc.Y,15,4,		10,
    	'苦土',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,198);
		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y-5,15,4,		10,
    	'加里',ftBOLD);

    //pH
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,270);
		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y-5,15,4,		10,
    	'ｐＨ',ftBOLD);

    {各測定値の分析値の位置をグラフ下限、上限からピクセルで割り出す}
    PictCenter.x := HorzPos( CurLocX );
    PictCenter.y := VertPos( CurLine );
    //測定値/(上限値-下限値) 戻り値 0.0～1.0
//   function GetScale( aLow, aValue, aMax : double ) : double ;

    GetLocList[1] := GetTrign(PictCenter.x, PictCenter.y ,
   		Round(GetScale(FieldByName('pH').asFloat,'pH')*HorzSize(CIRCLEGRFMAXSIZE)) ,270);

    GetLocList[2] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('トルオーグP').asFloat,'リン酸')*HorzSize(CIRCLEGRFMAXSIZE)) ,342);

    GetLocList[3] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('CaO').asFloat,'石灰')*HorzSize(CIRCLEGRFMAXSIZE)) ,54);

    GetLocList[4] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('MgO').asFloat,'苦土')*HorzSize(CIRCLEGRFMAXSIZE)) ,126);

    GetLocList[5] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('K2O').asFloat,'加里')*HorzSize(CIRCLEGRFMAXSIZE)) ,198);



     GetLocList2[1] := GetTrign(PictCenter.x, PictCenter.y ,
   		Round(GetScale(FieldByName('pH').asFloat+2.5,'pH')*HorzSize(CIRCLEGRFMAXSIZE)) ,270);

    GetLocList2[2] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('トルオーグP').asFloat+50,'リン酸')*HorzSize(CIRCLEGRFMAXSIZE)) ,342);

    GetLocList2[3] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('CaO').asFloat+120,'石灰')*HorzSize(CIRCLEGRFMAXSIZE)) ,54);

    GetLocList2[4] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('MgO').asFloat+10,'苦土')*HorzSize(CIRCLEGRFMAXSIZE)) ,126);

    GetLocList2[5] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('K2O').asFloat+30,'加里')*HorzSize(CIRCLEGRFMAXSIZE)) ,198);



    //分析値を直線で結ぶ
    for cnt := 1 to 4 do
     	PictSlantLine( GetLocList[cnt],GetLocList[cnt+1] );
     	PictSlantLine( GetLocList[5],GetLocList[1] );

    for cnt := 1 to 4 do
    	PictSlantLine3( GetLocList2[cnt],GetLocList2[cnt+1] );
     	PictSlantLine3( GetLocList2[5],GetLocList2[1] );


    PrintCanvas.Pen.Color := TColor($000000);

   //コメントの印刷
    CurLine := 246;

    RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine,RightEnd,5,		10,
    	'４．コメント',ftNORMAL);


    CurLine := CurLine + 5;
		MaxHeight:=20;

  	aBuff := '';
    if PrintModule1.ADOQuerySindan.RecordCount > 0 then begin
      //
    end
    else begin
    	aBuff := '';
    end;

   RectAndMemo(lmRECTFILL,0,CurLine,RightEnd,20, 9,aBuff , ftNORMAL, MaxHeight );







  end;   {with QuerySindan}
  with  PrintModule1.ADOQueryUketuke do begin
    case prmDeviceType of
    dvDISP :result := True ;	{このデータ作成ＯＫ}
    dvPRNT : begin {次のデータ有無}
      //次のレコードあるか？
      Next ;
      result := not Eof ;
    end;
    end;
    Close ;
  end;   {with QueryUketuke}
  PrintModule1.ADOQuerySindan.Close;

  //  FSehisekkei.SehiList.Free ;

//  FSehisekkei.Release;

end;











//
procedure Sokujyou( n : Double; f : Double; var btmp : Double; var btmp2 : Double );
var
x, y : Integer;
begin

     if n < 7 then begin
        x := 1;
     end
     else if n < 10 then begin
        x := 2;
     end
     else if n < 15 then begin
        x := 3;
     end
     else if n < 20 then begin
        x := 4;
     end
     else if n < 25 then begin
        x := 5;
     end
     else if n < 30 then begin
        x := 6;
     end
     else if n < 35 then begin
        x := 7;
     end
     else begin
        x := 8;
     end;

     if f < 3 then begin
        y := 2;
     end
     else if f < 4 then begin
        y := 3;
     end
     else if f < 5 then begin
        y := 4;
     end
     else if f < 6 then begin
        y := 5;
     end
     else if f < 7 then begin
        y := 6;
     end
     else if f < 8 then begin
        y := 7;
     end
     else begin
        y := 8;
     end;


     btmp2 := Sokuj[y,x];
     btmp := 100 - btmp2;


end;





end.

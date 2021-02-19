unit DMU;

{
  データセット共通モジュール
  システムグローバル変数
  システム処理関連
  システム共通関数群
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBCtrls,DBTables,IniFiles,StdCtrls, UFSakumokuSel,Variants,MMSYSTEM, ADODB;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    QueryRead: TADOQuery;
    QueryWrite: TADOQuery;
    ADOQtmp: TADOQuery;
    QueryRead2: TADOQuery;
    ADOTableRead: TADOTable;
    QAVG: TADOQuery;
    TCls: TADOTable;
    Query1: TADOQuery;
    QSehi: TADOQuery;
    DummyTable: TADOTable;
    MargeTable1: TADOTable;
    MargeTable2: TADOTable;
    ADONoukyou: TADOQuery;
    ADOConnectionNou: TADOConnection;
    ADOConnectionDel: TADOConnection;
    ADOYear: TADOQuery;
    ADOQtmpDel: TADOQuery;
    ADOQueryRead3: TADOQuery;
    ADOQSakuhi: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

{
  診断用施肥設計項目 ： シミュレーション画面と施肥設計印刷に用いる
                        画面リソースなどは利用しない
}
type THiryoType = (htYuuki,htHiryo1,htHiryo2,htHiryo3);
type TRecHiryo = record
    CD : string ;   //肥料コード
    Name  : string ; // 肥料名
    N : double ;  //成分率(%)
    P : double ;
    K : double ;
    Ca: double ;
    M: double ;
    Kei: double ;
    Fe: double ;

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
    {施容量の自動算出：他の指定済み成分の合計の残りで計算}
    function CalcValue(aType: THiryoType; aNum: integer; aSetVal: double;aCalIng: integer): double;
    {有機を含まない成分合計：施肥回数指定}
    function GetTotal(Kaisu: integer): TRecHiryo;    {基肥＋肥料１＋肥料２（分施回数）}
  end;

const
  VERFILE = 'version.txt';
  MSGFILE = 'message.txt';
	SYSFILE = 'system.ini';
	SYNCFILE = 'sync.ini';
  BYTEOFSEC = 4000 ;  //一秒間の転送バイト数制約

//アレニウス量変換テーブル
const cstAlenius : array[1..3,1..7] of integer = (
  (8,17,25,34,42,83,99),
  (13,25,34,42,51,83,99),
  (20,39,51,62,73,83,99)
);



var
  DataModule1: TDataModule1;

  Version : string ;  {プログラムのバージョン（アプリ情報） メジャー＆マイナー}
  SystemIni: TIniFile;
  BunkouIni: TIniFile;
  BunkouIni2: TIniFile;
  BunkouIni3: TIniFile;
  AppPath : string ;      //プログラムフォルダー
  //データフォルダ関連

  EntryCenter,EntryCenterName : string ;
  EntryCenterNo : string ; //センターコード
  EntryYear : string ;
  ThisYear : string ;	//最新登録可能年度
  IsEntryYear : Boolean ;
  SQLCondition : string ;	//印刷範囲
  SQLCondition2 : string ;	//印刷範囲

  EntrySTART,EntrySTOP : integer ;
//  OrgPath : string ;	//テーブルオリジナルpath
  DataPath : string ; //現エントリーパス
  TempPath : string ;  //temp path
  IsMaster,IsMasterMore : Boolean ;//マスタ管理権限
  IsBackUp : Boolean ;  //終了時自動バックアップ
  //ネットワーク関連
  IsUseNet,FTPPSSV : Boolean ;
  FTPServer,FTPAccount,FTPPassword,FTPHome,FTPUsrName : string ;
  FTPTiku,FTPNen : string;
  FTPBPS : integer ;
  //
  SuitouCode,BokusouCode : string ;
  Debug : Boolean ;

  JMode : String;  //kihon : 基本   Douou : 道央バージョン
  JMode_DokaiSel : Integer;   // 風連用　1 pH下限 それ以外 pH上限
  JBerCode : Boolean;  //受付のバーコード入力
  JBunseki : Boolean;  //分析の登録
  JUketuke : Boolean;  //受付の登録
  JMaster : Boolean;  //マスタの変更
  JFukyuu : Boolean;  //普及センターモード

  JMode_Saku1 : Boolean ;  //土壌診断票の作型、前作
  JMode_Saku2 : Boolean ;  //施肥設計票の作型、前作

  JMode_Dosei1 : Boolean ;  //土壌診断票の土性
  JMode_Dosei2 : Boolean ;  //施肥設計票の土性
  JMode_Fusyoku1 : Boolean ;  //土壌診断票の腐植
  JMode_Fusyoku2 : Boolean ;  //施肥設計票の腐植

  JMode_Memori : Boolean ;  //レーダチャートのメモリ
  JMode_Brush : Boolean ;  //網掛け　ＦＡＸ用　土壌診断

  JMode_Titen1 : Integer;   //土壌診断票の圃場番号表示桁　99は、圃場名
  JMode_Titen2 : Integer;   //施肥設計票のーーー

  JMode_Hantei : Integer;  //判定の許容範囲　５０％

  JMode_pH : Integer;
  JMode_EC : Integer;
  JMode_P : Integer;
  JMode_CaO : Integer;
  JMode_MgO : Integer;
  JMode_K2O : Integer;

  JMode_Houwa : Integer;
  JMode_Hiritu : Integer;

  JMode_CEC : Integer;
  JMode_Rin : Integer;
  JMode_1 : Integer;
  JMode_N : Integer;
  JMode_Kei : Integer;
  JMode_Fe : Integer;
  JMode_Aen : Integer;
  JMode_Dou : Integer;
  JMode_Man : Integer;
  JMode_Hou : Integer;
  JMode_Ni : Integer;
  JMode_Fus : Integer;

  JMode_You : Integer;
  JMode_Youdatu : Integer;


  JMode_Eko : Boolean; //エコ・ロング　コメント出力フラグ
  JMode_Ikubyou : Boolean; //育苗　簡易

  JMode_Siryou : Integer;
  JMode_Taihi : Integer;
//  JMode_TaihiEC : Integer;

  JMode_CN : Boolean;  //診断票で　CN比を表示するしない H181206
  JMode_CNketa : Integer;

  JMode_Yobi1 : Boolean;
  JMode_Yobi2 : Boolean;
  JMode_Yobi3 : Boolean;

  JMode_Yobi1name : String;   //予備
  JMode_Yobi2name : String;
  JMode_Yobi3name : String;

  JMode_Yobi1keta : Integer;
  JMode_Yobi2keta : Integer;
  JMode_Yobi3keta : Integer;

  //堆肥桁
  TaKeta:Array[1..11] of Integer;
  //飼料
//  SiKeta:Array[1..27] of Integer;



  BackColor,FontColor : TColor ;   //画面共通背景色,メッセージフォント色

  // P.D パラメータ
  P_CENTER,P_YEAR,P_SMPNO,P_TYPE  : string ;
  P_MODE : Boolean ;  //モード
{
  施肥標準マスタのメモリ展開用
}
type TRecYouryo = record
    N : double ;
    P : double ;
    K : double ;
    M : double ;
  end;
type TRecStandard = record  //作物別施肥標準値
  Motohi : TRecYouryo ; //基肥
  Sehi1 : TRecYouryo ;  //園芸のみ
  Sehi2 : TRecYouryo ;  //園芸のみ
  Kaisu : integer ;     //分施回数
  Sum : TRecYouryo ;    //合計（園芸）
  Suijyun : TRecYouryo;  //水準分類N,P,K
  Nkijyun1 : Double;
  NKijyun2 : Double;
  NMax : Double;   //窒素１回に施用できるMAX
  end;




function GetStandardValue(UketukeQuery : TADOQuery): TRecStandard;
function GetSehiValue(UketukeQuery : TADOQuery): TRecStandard;
function GetHiryoName(Code: string): string;
function GetHiryoN(Code: string): Double;
function GetHiryoP(Code: string): Double;
function GetHiryoK(Code: string): Double;
function GetHiryoM(Code: string): Double;
function GetHiryoT(Code: string): Boolean;
function GetHiryoTanka(Code: string): Integer;
function GetHiryoV(Code: string): Double;

//基準値のＣＥＣからA,B,Cを求める。　草地の場合は、火山性土の種類から
function Get_CEC_ABC(UketukeQuery : TADOQuery): string;
function Get_CEC_ABC2(UketukeQuery : TADOQuery): string;  //土壌code
//基準値テーブルのレコード選択　QueryKijun
function Set_Kijun_Rec(UketukeQuery : TADOQuery;QueryKijun : TADOQuery): Integer;


procedure UsrBeep();

function DokaiVolume( aCode: string ; aValue : double;
      var pVolP: double; var pVolMg: double; var pVolpH: double; var pVolKei : Double ; Var kakaku : Integer): double;
function DokaiVolume2( aCode: string ; aValue : double;
      var pVolP: double; var pVolMg: double; var pVolpH: double; var pVolKei : Double ; Var kakaku : Integer): double;
function ChangeDataBase(CenterName,Year:string):Boolean ;
procedure CloseDataBase ;
function GetID(): string;
function getMACaddress: String;
function ChkEditLength( pEdit : TCustomEdit; pLen : integer ) : Boolean;
function GetMaxSampleNo(var pNewRec:Boolean; mode : String) : string ;
function GetMaxSampleNo2(var pNewRec:Boolean) : string ;
function ChangeCenter( pCenter : string ): Boolean ;
function ChangeYear( pYear : string ): Boolean ;
procedure MakeNewYearData ;

procedure Set_Heikin( skou : string; dbkou : String;MakePath : String);

function  FilesCopy( srcPath, dstPath, FileName  : string ) : Boolean ;
function  FilesDelete( srcPath, FileName  : string ) : Boolean ;
function OriginalFilesCopy( syncPath, srcPath, dstPath  : string ) : Boolean ;
function MasterFilesCopy( syncPath,srcPath, dstPath : string): Boolean ;
function MasterFilesCopy2( syncPath,srcPath, dstPath : string): Boolean ;
function strParts( const pData: string ; PartsNum : integer ) : string ;
procedure UpdateSyncFile( SyncFile, pSecName: string );
function  MargeTable( pTable1, pTable2 : string; key : string ) : Boolean ;
procedure ExportFile( TableName, FileName : string );
procedure ExportFileGIS( TableName, FileName : string );
procedure QueryToCSV( QuerySource:TADOQuery; FileName:String );
function ImportFile( FileName, TableName  : string ):Boolean;
function CSVToQuery( FileName:String; QuerySource:TQuery ): Boolean ;
function GetComment( CD1,CD2,CD3 : string ) : string ;
function myStrtoFloat( aText : string ) : double ;
procedure SetEnableBDE( aOwner : TComponent; aName: string; aFlag: Boolean);overload;
procedure SetEnableBDE( pCMP : TDBEdit; aFlag : Boolean ); overload;
procedure DelFlagSindanTable(aSmpNO : string );
procedure InsertSindanTable(aSmpNO : string );
function IsEditRec(aNO : string):Boolean;
function Bai_S_N( N:double; dcode:string; titai:string;mode : Integer ):double;
function Bai_S_P( P:double; dcode:string; fcode:string ):double;
function Bai_S_K( K:double ):double;
function Bai_S_M( M:double ):double;

function Rinsankeisuu( Dositu : integer; Rin : double) : double;

function GetKeiCal( aCode : string ) : double ; overload ;    //土壌から
function GetKeiCal( aKeisan : double; dcode : string ) : double ; overload ;   //ケイ酸値から
{苦土me/100mg}
function KudoMe( aValue : double ) : double;
{石灰me/100mg}
function SekkaiMe( aValue : double ) : double;
{加里me/100mg}
function KariMe( aValue : double ) : double;
{リン酸me/100mg}
function RinsanMe( aValue : double ) : double;

function GetConnection() : String;   //データベース接続



implementation

{$R *.DFM}
uses
	FileCtrl,Nb30, MCenterU, AobutU, PrnCanvasU, MainU;
{
  システム生成処理処理
}
procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
	SysFileName,sVersion  : string ;
  acnt,pCnt : integer ;

  p: PChar;
  MaxChar : Cardinal;
  stmp : String;
  i : Integer;


begin
//プログラムのバージョンを取得
  sVersion := AppGetInfo(Application.exename,3);
  {メジャー＆マイナーまでにする}
  pCnt := 0;   Version := '';
  for acnt := 1 to length(sVersion) do begin
    if sVersion[acnt] = '.' then INC(pCnt);
    if pCnt >= 2 then break;
    Version := Version + sVersion[acnt] ;
  end;

	AppPath := ExtractFilePath(Application.ExeName);
	IsEntryYear := False ;

//分析項目の順番
    BunkouIni := TIniFile.Create( AppPath + 'Bunkou.ini' );
    BunkouIni2 := TIniFile.Create( AppPath + 'Bunkou2.ini' );
    BunkouIni3 := TIniFile.Create( AppPath + 'Bunkou3.ini' );


  //システム設定関連
  SysFileName := AppPath + SYSFILE;



  //設定ﾌｧｲﾙの取り込み
  if FileExists( SysFileName ) then
    SystemIni := TIniFile.Create( SysFileName );

  if SystemIni = nil then begin
  	showmessage('システム設定ファイルが見つかりません。');
    PostQuitMessage(0);
    exit;
  end;
  //値を取得
  Debug := SystemIni.ReadBool('system', 'debug', false );
  BokusouCode := SystemIni.ReadString('data', 'bokusoucode', '' );
  SuitouCode := SystemIni.ReadString('data', 'suitoucode', '' );
  EntryCenter := SystemIni.ReadString('data', 'center', '' );
  EntryYear := SystemIni.ReadString(EntryCenter, 'entryyear', '' );
  ThisYear := SystemIni.ReadString(EntryCenter, 'thisyear', '' );
	//サンプル番号割り当て    {Version 0.6 #34 }
  EntryStart := SystemIni.ReadInteger(EntryCenter, 'start', 1 );
  EntryStop := SystemIni.ReadInteger(EntryCenter, 'stop', 9999 );

  IsEntryYear := ThisYear = EntryYear ;	//エントリー可能フラグ
  IsMaster := SystemIni.ReadInteger('system', 'master', 0 ) >= 1 ;
  IsMasterMore := SystemIni.ReadInteger('system', 'master', 0 ) >= 2 ;

//  OrgPath :=  AppPath + SystemIni.ReadString('data', 'orgpath', 'org' ) +'\';
  TempPath :=  AppPath + SystemIni.ReadString('data', 'tmppath', 'temp') +'\';


	//サンプル番号割り当て    {Version 0.6 #34 }
//  EntryStart := SystemIni.ReadInteger('system', 'start', 1 );
//  EntryStop := SystemIni.ReadInteger('system', 'stop', 9999 );
  IsBackUp := SystemIni.ReadBool('system', 'BackUp', true );

  //ネットワーク関連
  IsUseNet := SystemIni.ReadBool('system', 'UseNet', false );
  if IsUseNet then begin
    FTPPSSV :=   SystemIni.ReadBool('network', 'usepssv', false );
    FTPServer :=   SystemIni.ReadString('network', 'server', '' );
    FTPAccount:=   SystemIni.ReadString('network', 'username', '' );
    FTPPassword := SystemIni.ReadString('network', 'password', '' );
    FTPHome := SystemIni.ReadString('network', 'home', '' );
    FTPBPS  := SystemIni.ReadInteger('network', 'bps', BYTEOFSEC );
    FTPUsrName := SystemIni.ReadString('network', 'usrname', '' );
    if FTPUsrName = '' then begin
     //ユーザ名
     MaxChar := 128; // もっと小さくてもいいかもしれません
     p := StrAlloc(MaxChar);
     GetUserName( p, MaxChar);
     stmp := String(p);
     StrDispose(p);

     FTPUsrName := stmp;
    end;

  end;




  DataPath := FTPServer + '\' + EntryCenter + '\' + EntryYear + '\' ;



  BackColor := TColor( SystemIni.ReadInteger('system', 'BackColor', 12632256 ));
  FontColor := TColor( SystemIni.ReadInteger('system', 'FontColor', 0 ));

  //システム条件
  //調書描画モード
  JMode_Saku1 := SystemIni.ReadBool('sysmode', 'tyousyo_do', false );
  JMode_Saku2 := SystemIni.ReadBool('sysmode', 'tyousyo_do', false );

  JMode_Dosei1 := SystemIni.ReadBool('sysmode', 'tyousyo_dosei1', false );
  JMode_Fusyoku1 := SystemIni.ReadBool('sysmode', 'tyousyo_fusyoku1', false );

  JMode_Dosei2 := SystemIni.ReadBool('sysmode', 'tyousyo_dosei2', false );
  JMode_Fusyoku2 := SystemIni.ReadBool('sysmode', 'tyousyo_fusyoku2', false );

  JMode_Memori := SystemIni.ReadBool('sysmode', 'tyousyo_Memori', false );

  JMode_Brush := SystemIni.ReadBool('sysmode', 'tyousyo_Brush', true );


  JMode_Titen1 := SystemIni.ReadInteger('sysmode', 'tyousyo_Titen1', 0 );
  if JMode_Titen1 <= 0 then JMode_Titen1 := 9;
  if (JMode_Titen1 > 9) and (JMode_Titen1 < 99) then JMode_Titen1 := 9;

  JMode_Titen2 := SystemIni.ReadInteger('sysmode', 'tyousyo_Titen2', 0 );
  if JMode_Titen2 <= 0 then JMode_Titen2 := 9;
  if (JMode_Titen2 > 9) and (JMode_Titen2 < 99) then JMode_Titen1 := 9;


  JMode_pH := SystemIni.ReadInteger('sysmode', 'tyousyo_pH', 0 );
  JMode_EC := SystemIni.ReadInteger('sysmode', 'tyousyo_EC', 0 );
  JMode_P := SystemIni.ReadInteger('sysmode', 'tyousyo_P', 0 );
  JMode_CaO := SystemIni.ReadInteger('sysmode', 'tyousyo_CaO', 0 );
  JMode_MgO := SystemIni.ReadInteger('sysmode', 'tyousyo_MgO', 0 );
  JMode_K2O := SystemIni.ReadInteger('sysmode', 'tyousyo_K2O', 0 );


  JMode_Houwa := SystemIni.ReadInteger('sysmode', 'tyousyo_Houwa', 0 );
  JMode_Hiritu := SystemIni.ReadInteger('sysmode', 'tyousyo_Hiritu', 0 );

  JMode_CEC := SystemIni.ReadInteger('sysmode', 'tyousyo_CEC', 0 );
  JMode_Rin := SystemIni.ReadInteger('sysmode', 'tyousyo_Rin', 0 );
JMode_1 := 1;
  JMode_N := SystemIni.ReadInteger('sysmode', 'tyousyo_N', 0 );
  JMode_Kei := SystemIni.ReadInteger('sysmode', 'tyousyo_Kei', 0 );
  JMode_Fe := SystemIni.ReadInteger('sysmode', 'tyousyo_Fe', 0 );
  JMode_Aen := SystemIni.ReadInteger('sysmode', 'tyousyo_Aen', 0 );
  JMode_Dou := SystemIni.ReadInteger('sysmode', 'tyousyo_Dou', 0 );
  JMode_Man := SystemIni.ReadInteger('sysmode', 'tyousyo_Man', 0 );
  JMode_Hou := SystemIni.ReadInteger('sysmode', 'tyousyo_Hou', 0 );
  JMode_Ni := SystemIni.ReadInteger('sysmode', 'tyousyo_Ni', 0 );
  JMode_Fus := SystemIni.ReadInteger('sysmode', 'tyousyo_Fus', 0 );

  JMode_You := SystemIni.ReadInteger('sysmode', 'tyousyo_You', 0 );
  JMode_Youdatu := SystemIni.ReadInteger('sysmode', 'tyousyo_Youdatu', 0 );

  JMode_Taihi := SystemIni.ReadInteger('sysmode', 'tyousyo_Taihi', 1 );
//  JMode_TaihiEC := SystemIni.ReadInteger('sysmode', 'tyousyo_TaihiEC', 2 );

  JMode_CNketa := SystemIni.ReadInteger('sysmode', 'tyousyo_CN', 0 );

  JMode_Yobi1keta := SystemIni.ReadInteger('sysmode', 'tyousyo_Yobi1keta', 0 );
  JMode_Yobi2keta := SystemIni.ReadInteger('sysmode', 'tyousyo_Yobi2keta', 0 );
  JMode_Yobi3keta := SystemIni.ReadInteger('sysmode', 'tyousyo_Yobi3keta', 0 );

  JMode_Yobi1name := SystemIni.ReadString('sysmode', 'tyousyo_Yobi1name', 'XXX1' );
  JMode_Yobi2name := SystemIni.ReadString('sysmode', 'tyousyo_Yobi2name', 'XXX2' );
  JMode_Yobi3name := SystemIni.ReadString('sysmode', 'tyousyo_Yobi3name', 'XXX3' );

 {
  //堆肥の桁
  for i := 1 to 11 do begin
     stmp := 'kou' + inttoStr(i);
     TaKeta[i] := SystemIni.ReadInteger('KetaTaihi', stmp, 0 );
  end;
  //飼料の桁
  for i := 1 to 27 do begin
     stmp := 'kou' + inttoStr(i);
     SiKeta[i] := SystemIni.ReadInteger('KetaSiryo', stmp, 0 );
  end;
 }




  if not DirectoryExists(TempPath) then
    if not CreateDir(TempPath) then begin
      showmessage(TempPath+'ディレクトリ作成出来ません。');
      exit;
    end;

end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
  //終了処理
  //DataBase1.Close;
  if SystemIni <> nil then SystemIni.Free ;
end;

//データベースクローズ
procedure CloseDataBase;
begin
  //DataModule1.DataBase1.Close;
end;




//ビープ音
procedure UsrBeep();
var
s: String;
  p: PChar;
begin

  s := 'SystemAsterisk';
(*SystemStart
        SystemExit
        SystemHand
        SystemQuestion
        SystemExclamation 　//いい感じ
        SystemAsterisk  //これにきめた
        Open
        Close
        Maximize
        Minimize
        RestoreDown
        RestoreUp
        AppGPFault
        MenuCommand
        MenuPopup
        MailBeep
        RingIn
        Ringout
        SystemDefault
        SchdplusReminder
*)
  p := StrAlloc(200);
  StrPCopy(p, s);
  PlaySound(p, 0, SND_ALIAS or SND_ASYNC);
  StrDispose(p);

//     PlaySound('Ringout.wav', 0, SND_ASYNC);
//     MessageBeep(
//      PlaySound(p, 0, SND_ALIAS or SND_ASYNC);
//     for i := 0 to 10000 do begin
//       Beep;
//     end;


end;


//資材量から成分量を算出
// aValue  資材量
function DokaiVolume( aCode: string ; aValue : double;
      var pVolP: double; var pVolMg: double; var pVolpH: double; var pVolKei : Double ; Var kakaku : Integer): double;
var aVol :double ;
you, tanka : Double;

begin
//  aVol := 0 ;



  with PrintModule1.ADOQueryDokaizai2 do begin
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
    if    FieldByName('ケイ酸').asFloat = 0 then pVolKei := 0
    else  pVolKei := aVol * FieldByName('ケイ酸').asFloat / 100 ;
    kakaku := 0;
    if aVol > 0 then begin
       you := FieldByName('容量').asFloat;
       if you > 0 then begin
         tanka := FieldByName('単価').asInteger;
         kakaku := Round((aVol / you) * tanka);
       end;
    end;

    Close;
  end;
  result := aVol ;
end;

//資材量から成分％と単価を算出
// aValue  資材量
function DokaiVolume2( aCode: string ; aValue : double;
      var pVolP: double; var pVolMg: double; var pVolpH: double; var pVolKei : Double ; Var kakaku : Integer): double;
var aVol :double ;
you, tanka : Double;

begin
//  aVol := 0 ;
  with PrintModule1.ADOQueryDokaizai2 do begin
    SQL.Text := 'Select * from M_DOKAIZAI where コード='''+aCode+'''';
    Open;

    aVol := aValue;
    //必要量を算出後その他の成分の量も計算
    pVolP := FieldByName('リン酸').asFloat;
    pVolMg := FieldByName('苦土').asFloat;
    pVolpH := FieldByName('アルカリ分').asFloat;
    pVolKei := FieldByName('ケイ酸').asFloat;
    kakaku := 0;
    if aVol > 0 then begin
       you := FieldByName('容量').asFloat;
       if you > 0 then begin
         tanka := FieldByName('単価').asInteger;
         kakaku := Round((aVol / you) * tanka);
       end;
    end;

    Close;
  end;
  result := aVol ;
end;

//センター切り替え：データベースの切り替え
function ChangeDataBase(CenterName,Year:string) : Boolean;
var
	path  : string ;
	path2  : string ;
begin
 	result := False;
  //DataModule1.DataBase1.Close;
  //DataModule1.DataBase2.Close;







  //データフォルダー






  //H160712
  path := AppPath +
  				CenterName +
  				'\' + 	Year; //  + '\testdata';
  if JMode = 'Douou' then begin
      path2 := AppPath +
  				CenterName +
  				'\' + 	Year+'\'+'01';//  + '\testdata';
  end
  else begin
      path2 := path;
  end;






  path := 'J:\JA\JAオホーツク網走\data';




  if not DirectoryExists(path) then begin
		showmessage('データベースフォルダがありません');
    exit;
  end;
  with DataModule1 do begin
    //DataBase1.Params.Clear ;
    //DataBase1.Params.Add ( 'path='+path);
    //DataBase2.Params.Clear ;
    //DataBase2.Params.Add ( 'path='+path2);
    try
      //DataBase1.Open ;

      //テーブルオープンで確認
      DummyTable.Open;
      //センター名称の取得
      EntryCenterName := '';
      if DummyTable.Locate('センター記号',CenterName,[]) then begin
        EntryCenterName := DummyTable.FieldByName('センター名称').asString;
        EntryCenterNo := DummyTable.FieldByName('センターコード').asString;
      end
      else begin
        showmessage('最初にメニューのマスタメンテで地域情報のセンターマスタの登録を行ってください。');
      end;
      DummyTable.Close;
      result := true ;
    except
      showmessage('データベースの構成がありません。');
    end;
  end;
end;
//HDW IDの取得
function GetID(): string;
var
	PCInfo: TSystemInfo;
begin
	GetSystemInfo(PCInfo);
  result := IntToHex(PCInfo.dwOemId,8);
end;
function getMACaddress: String;
var
  NCB:      TNCB;
  Adapter:  packed record
              adapt:    TADAPTERSTATUS;
              NameBuff: packed array[0..29] of TNAMEBUFFER;
            end;
  NameB:    packed array[0..MAX_PATH - 1] of Char;

begin
  result := 'FFFFFFFFFFFF';
  GetSystemDirectory(NameB,sizeof(NameB));
  if fileExists(NameB + '\NetApi32.dll') then begin
    fillchar(NCB,sizeof(NCB),0);
    NCB.ncb_command := Char(NCBRESET);
    netbios(@NCB);                          // RESET NETBIOS
    fillchar(NCB,sizeof(NCB),0);
    NCB.ncb_command := Char(NCBASTAT);
    NCB.ncb_callname := '* ';
    NCB.ncb_buffer := @Adapter;
    NCB.ncb_length := sizeof(Adapter);
    if Byte(netbios(@NCB)) = 0 then begin  // Request NETBIOS Status
      result := Format('%.2x%.2x%.2x%.2x%.2x%.2x',[
                        Byte(Adapter.adapt.adapter_address[0]),
                        Byte(Adapter.adapt.adapter_address[1]),
                        Byte(Adapter.adapt.adapter_address[2]),
                        Byte(Adapter.adapt.adapter_address[3]),
                        Byte(Adapter.adapt.adapter_address[4]),
                        Byte(Adapter.adapt.adapter_address[5])]);
    end{fi};
  end{fi};
end{ of getMACaddress};
//入力桁数のチェックとフォーカス移動
function ChkEditLength( pEdit : TCustomEdit; pLen : integer ) : Boolean;
begin

//	result := length (pEdit.Text ) >= pLen ;
	result := length (pEdit.Text ) <= pLen ;
  if not result then  begin
    showmessage('入力桁数オーバーです。');
  	pEdit.SetFocus ;
  end;
end;
{
  サンプル番号最大値取得
  pNewRec : True : Newrecord, False : Deleterecord;
}

function GetMaxSampleNo2(var pNewRec:Boolean) : string ;
var
	aNo : integer ;
        sNo : integer;
        eNo : integer;
        sample : integer;
begin
  with DataModule1.QueryRead do begin
  	close;
    {Version 0.6 #24 : サンプル番号割り当ては該当範囲内}
//    SQL.Text := 'Select サンプル番号 from T_UKETUKE where サンプル番号 >= '''+Format('%0.4d',[EntryStart])+
//    ''' and サンプル番号 <= '''+Format('%0.4d',[EntryStop]) +''' order by サンプル番号 desc';
    {Version 0.6 #46 : 削除レコードも対象}
    //範囲内で削除フラグを持つレコードの一番若い番号
    //上記を使用してはいけない。理由：再使用時レコード削除されるのでそれをｷｬﾝｾﾙされると真の最小番号にならない
      //無ければ従来通り
    SQL.Text := 'Select サンプル番号,削除フラグ from T_UKETUKE where サンプル番号 >= '''+Format('%0.4d',[EntryStart])+
                      ''' and サンプル番号 <= '''+Format('%0.4d',[EntryStop]) +
                      ''' order by サンプル番号';
    Open;
    {したから順番に読み取り空きを探す}

    Application.CreateForm(TFSakumokuSel, FSakumokuSel);
    FSakumokuSel.ShowModal ;

    sNO := StrtoInt(FSakumokuSel.CbSNo.Text);
    aNO := sNo;
    eNO := StrtoInt(FSakumokuSel.CbENo.Text);

    FSakumokuSel.Release ;


//    aNO := EntryStart ;
    while not Eof do begin
      sample := StrtoInt(FieldByName('サンプル番号').asString);
      if (sNO <= sample) and (eNO >= sample) then begin

        if aNO <> sample then begin
          //違えば空き番号である。
          pNewRec := True ;
          break;
        end;
        //削除レコードも空き番号
        if FieldByName('削除フラグ').asBoolean then begin
          pNewRec := False;
          break;
        end;
        aNO := sample +1; {次の番号}
      end;
      Next;
    end ;
    Close;

    //割り当てが範囲内かチェック
    if (EntryStart <= aNO ) and ( aNO <= EntryStop ) then
      result := Format('%0.4d',[aNO])
    else begin
      {Version 0.6 #36}
      showmessage('割り当てるサンプル番号はありません。');
      result := '';
    end;
  end;
end;
{
  サンプル番号最大値取得
  pNewRec : True : Newrecord, False : Deleterecord;
}

function GetMaxSampleNo(var pNewRec:Boolean; mode : String) : string ;
var
	aNo : integer ;
        sNo : integer;
        eNo : integer;
        sample : integer;
        stmp : String;
begin
  with DataModule1.QueryRead do begin
  	close;
    {Version 0.6 #24 : サンプル番号割り当ては該当範囲内}
//    SQL.Text := 'Select サンプル番号 from T_UKETUKE where サンプル番号 >= '''+Format('%0.4d',[EntryStart])+
//    ''' and サンプル番号 <= '''+Format('%0.4d',[EntryStop]) +''' order by サンプル番号 desc';
    {Version 0.6 #46 : 削除レコードも対象}
    //範囲内で削除フラグを持つレコードの一番若い番号
    //上記を使用してはいけない。理由：再使用時レコード削除されるのでそれをｷｬﾝｾﾙされると真の最小番号にならない
      //無ければ従来通り

    if mode = '1' then begin
      SQL.Text := 'Select 受付連番 from T_UKETUKE6 where 受付連番 >= '''+Format('%0.3d',[EntryStart])+
                      ''' and 受付連番 <= '''+Format('%0.3d',[EntryStop]) +
                      ''' order by 受付連番';
    end
    else if mode = '2' then begin
      SQL.Text := 'Select サンプル番号,削除フラグ from T_UKETUKE2 where サンプル番号 >= '''+Format('%0.4d',[EntryStart])+
                      ''' and サンプル番号 <= '''+Format('%0.4d',[EntryStop]) +
                      ''' order by サンプル番号';
    end
    else if mode = '3' then begin
      SQL.Text := 'Select サンプル番号,削除フラグ from T_UKETUKE3 where サンプル番号 >= '''+Format('%0.4d',[EntryStart])+
                      ''' and サンプル番号 <= '''+Format('%0.4d',[EntryStop]) +
                      ''' order by サンプル番号';
    end
    else begin
      SQL.Text := 'Select サンプル番号,削除フラグ from T_UKETUKE where サンプル番号 >= '''+Format('%0.4d',[EntryStart])+
                      ''' and サンプル番号 <= '''+Format('%0.4d',[EntryStop]) +
                      ''' order by サンプル番号';
    end;


    Open;
    {したから順番に読み取り空きを探す}

    FindLast;


    stmp := FieldByName('受付連番').asString;
    if stmp = '' then stmp := '0';
    sNO := strtoint( stmp);
    aNO := sNO;
    eNO := 999;



//    aNO := EntryStart ;
    while not Eof do begin
      sample := StrtoInt(FieldByName('受付連番').asString);
      if (sNO <= sample) and (eNO >= sample) then begin

        if aNO <> sample then begin
          //違えば空き番号である。
          pNewRec := True ;
          break;
        end;
        aNO := sample +1; {次の番号}
      end;
      Next;
    end ;
    Close;

    //割り当てが範囲内かチェック
    if (EntryStart <= aNO ) and ( aNO <= EntryStop ) then
      result := Format('%0.3d',[aNO])
    else begin
      {Version 0.6 #36}
      showmessage('割り当てる受付番号はありません。');
      result := '';
    end;
  end;
end;
//センター切り替え
function ChangeCenter( pCenter : string ): Boolean ;
var
   aYear,aThisYear : string ;
begin
	result := false ;
	aYear := SystemIni.ReadString( pCenter , 'EntryYear', '');
  aThisYear := SystemIni.ReadString( pCenter , 'ThisYear', '');
	//サンプル番号割り当て    {Version 0.6 #34 }
  EntryStart := SystemIni.ReadInteger(pCenter, 'start', 1 );
  EntryStop := SystemIni.ReadInteger(pCenter, 'stop', 9999 );
  if ChangeDataBase(pCenter,aYear) then begin
    SystemIni.WriteString('data', 'center',pCenter) ;
    EntryCenter := pCenter ;
    EntryYear := aYear ;
    ThisYear := aThisYear ;
		IsEntryYear := ThisYear = EntryYear ;	//エントリー可能フラグ
    DataPath := AppPath + EntryCenter + '\' + EntryYear + '\' ;
    result := true ;
  end
	else //だめなら戻す
   	ChangeDataBase(EntryCenter , EntryYear );
end;
//年度切り替え
function ChangeYear( pYear : string ): Boolean ;
begin
	result := false ;
  if ChangeDataBase(EntryCenter,pYear) then begin
    SystemIni.WriteString(EntryCenter, 'entryyear', pYear );
    EntryYear := pYear ;
		IsEntryYear := ThisYear = pYear ;	//エントリー可能フラグ
    DataPath := AppPath + EntryCenter + '\' + EntryYear + '\' ;
    result := true ;
  end
	else //だめなら戻す
   	ChangeDataBase(EntryCenter , EntryYear );
end;

//マスタ系ファイル名
procedure MakeNewYearData ;
var
  MakeYear,MakePath,srcPath,syncPath : string ;
  MakePath2,srcPath2 : String;
  aYears : integer ;
  i : Integer;
  stmp : String;
  stmp2 : String;
  skou : String;
  newyear : integer;
  sdir : String;
  olddir : String;
begin
  srcPath := FTPServer + '\' + FTPTiku + '\' +	ThisYear +'\';
  syncPath := srcPath ;
  // 作成年度を作成
  MakeYear := InttoStr(StrToInt(ThisYear ) + 1 );

  newyear := strtoint(ThisYear);
  newyear := newyear + 1;


//  MakePath := AppPath + EntryCenter + '\' + 	MakeYear +'\';
  MakePath := FTPServer + '\' + FTPTiku + '\' + 	MakeYear +'\';


 // if not DirectoryExists(MakePath) then
 //   if not CreateDir( MakePath) then begin
 //     showmessage('データディレクトリを作成できません。');
 //     exit;
 //   end;








 DataModule1.ADONoukyou.SQL.Clear;
  stmp := 'select * from M_NOUKYOU ORDER BY 農協コード';
  DataModule1.ADONoukyou.SQL.Text := stmp;
  DataModule1.ADONoukyou.Open;

  with DataModule1.ADONoukyou do begin

    first;
    while not Eof do begin
      stmp := FieldByName('農協名').AsString;
      //フォルダーの作成
      sdir := FTPServer+'\'+stmp+ '\'+inttostr(newyear);
      if not DirectoryExists(sdir) then begin
        if not CreateDir(sdir) then begin
          showmessage('ディレクトリを作成できません。'+stmp);
          exit;
        end;
      end;

      //ファイルのコピー
      olddir :=  FTPServer+'\'+stmp+ '\'+ThisYear;

      copyfile(PChar(olddir + '\nkpsoil.mdb'), PChar(sdir + '\nkpsoil.mdb'),false);

      //受付ファイルをクリア
      DataModule1.ADOConnectionDel.Close;
      stmp := 'Provider=Microsoft.Jet.OLEDB.4.0;';
      stmp := stmp + 'Data Source=';
      stmp := stmp + sdir + '\nkpsoil.mdb'+';'; //FTPServer+'\nkpsoilmas.mdb;';
      stmp := stmp + 'Persist Security Info=False';
      DataModule1.ADOConnectionDel.ConnectionString := stmp;
      DataModule1.ADOConnectionDel.Open('Admin','');
      DataModule1.ADOConnectionDel.Execute('DELETE FROM T_UKETUKE');
      DataModule1.ADOConnectionDel.Close;

      DataModule1.ADOConnectionDel.Open('Admin','');
      DataModule1.ADOConnectionDel.Execute('DELETE FROM T_UKETUKE2');
      DataModule1.ADOConnectionDel.Close;

      DataModule1.ADOConnectionDel.Open('Admin','');
      DataModule1.ADOConnectionDel.Execute('DELETE FROM T_UKETUKE3');
      DataModule1.ADOConnectionDel.Close;


      //0001を追加
 //受付に0001のみ追加
  DataModule1.ADOQtmpDel.close;
  DataModule1.ADOQtmpDel.SQL.Clear;
  stmp := 'select * from T_UKETUKE';
  DataModule1.ADOQtmpDel.SQL.Text := stmp;
  DataModule1.ADOQtmpDel.Open;
  DataModule1.ADOQtmpDel.insert;
  DataModule1.ADOQtmpDel.FieldByName('サンプル番号').AsString := '0001';
  DataModule1.ADOQtmpDel.post;
  DataModule1.ADOQtmpDel.close;

  DataModule1.ADOQtmpDel.close;
  DataModule1.ADOQtmpDel.SQL.Clear;
  stmp := 'select * from T_UKETUKE2';
  DataModule1.ADOQtmpDel.SQL.Text := stmp;
  DataModule1.ADOQtmpDel.Open;
  DataModule1.ADOQtmpDel.insert;
  DataModule1.ADOQtmpDel.FieldByName('サンプル番号').AsString := '0001';
  DataModule1.ADOQtmpDel.post;
  DataModule1.ADOQtmpDel.close;

  DataModule1.ADOQtmpDel.close;
  DataModule1.ADOQtmpDel.SQL.Clear;
  stmp := 'select * from T_UKETUKE3';
  DataModule1.ADOQtmpDel.SQL.Text := stmp;
  DataModule1.ADOQtmpDel.Open;
  DataModule1.ADOQtmpDel.insert;
  DataModule1.ADOQtmpDel.FieldByName('サンプル番号').AsString := '0001';
  DataModule1.ADOQtmpDel.post;
  DataModule1.ADOQtmpDel.close;


      Next;
    end;
  end;
  DataModule1.ADONoukyou.Close;











{
  DataModule1.ADOQtmp.close;
  DataModule1.ADOQtmp.SQL.Clear;
  stmp := 'select * from T_UKETUKE2';
  DataModule1.ADOQtmp.SQL.Text := stmp;
  DataModule1.ADOQtmp.Open;
  DataModule1.ADOQtmp.edit;
  DataModule1.ADOQtmp.FieldByName('サンプル番号').AsString := '0001';
  DataModule1.ADOQtmp.post;
  DataModule1.ADOQtmp.close;

  DataModule1.ADOQtmp.close;
  DataModule1.ADOQtmp.SQL.Clear;
  stmp := 'select * from T_UKETUKE3';
  DataModule1.ADOQtmp.SQL.Text := stmp;
  DataModule1.ADOQtmp.Open;
  DataModule1.ADOQtmp.edit;
  DataModule1.ADOQtmp.FieldByName('サンプル番号').AsString := '0001';
  DataModule1.ADOQtmp.post;
  DataModule1.ADOQtmp.close;
 }













  //現在年度を変更
  DataModule1.ADOYear.close;
  DataModule1.ADOYear.SQL.Clear;
  stmp := 'select * from M_YEAR';
  DataModule1.ADOYear.SQL.Text := stmp;
  DataModule1.ADOYear.Open;
  DataModule1.ADOYear.edit;
  DataModule1.ADOYear.FieldByName('現在年').AsInteger := newyear;
  DataModule1.ADOYear.post;


  //年度リストに追加
  DataModule1.ADOYear.close;
  DataModule1.ADOYear.SQL.Clear;
  stmp := 'select * from M_YEARLIST';
  DataModule1.ADOYear.SQL.Text := stmp;
  DataModule1.ADOYear.Open;
  DataModule1.ADOYear.last;
  DataModule1.ADOYear.Append;
  DataModule1.ADOYear.edit;
  DataModule1.ADOYear.FieldByName('年').AsInteger := newyear;
  DataModule1.ADOYear.post;


  //コンボに追加
  MainForm.CbNendo.Items.Add(inttoStr(newyear));





  //飼料の平均値を更新
//  select 飼料名,AVG(水分) 平均 from T_UKETUKE3.DB group by 飼料名
{
  skou := '水分';
  Set_Heikin( skou,'水分', MakePath );
  skou := '乾物';
  Set_Heikin( skou,'乾物',MakePath );
  skou := 'pH';
  Set_Heikin( skou,'pH', MakePath );
  skou := '粗蛋白質';
  Set_Heikin( skou, 'CP',MakePath );
  skou := '溶解性蛋白質';
  Set_Heikin( skou, 'SIP',MakePath );
  skou := '結合性蛋白質';
  Set_Heikin( skou, 'ADICP',MakePath );
  skou := '有効蛋白質';
  Set_Heikin( skou, '有効蛋白',MakePath );
  skou := '正味エネルギー';
  Set_Heikin( skou, 'NEL',MakePath );
  skou := '可消化養分総量';
  Set_Heikin( skou,'TDN', MakePath );
  skou := '細胞内容物質';
  Set_Heikin( skou,'OCC', MakePath );
  skou := '細胞壁物質';
  Set_Heikin( skou,'OCW', MakePath );
  skou := '高消化性繊維';
  Set_Heikin( skou,'Oa', MakePath );
  skou := '低消化性繊維';
  Set_Heikin( skou,'Ob', MakePath );
  skou := '酸性ﾃﾞﾀｰｼﾞｪﾝﾄ繊維';
  Set_Heikin( skou,'ADF', MakePath );
  skou := '中性ﾃﾞﾀｰｼﾞｪﾝﾄ繊維';
  Set_Heikin( skou,'NDF', MakePath );
  skou := '酸性ﾃﾞﾀｰｼﾞｪﾝﾄ不溶ﾘｸﾞﾆﾝ';
  Set_Heikin( skou,'ADL', MakePath );
  skou := '中性ﾃﾞﾀｰｼﾞｪﾝﾄ不溶蛋白質';
  Set_Heikin( skou,'NDICP', MakePath );
  skou := '非繊維性炭水化物';
  Set_Heikin( skou,'NFC', MakePath );
  skou := 'デンプン';
  Set_Heikin( skou,'STA', MakePath );
  skou := '粗脂肪';
  Set_Heikin( skou,'EE', MakePath );
  skou := '粗灰分';
  Set_Heikin( skou,'粗灰分', MakePath );
  skou := 'カルシウム';
  Set_Heikin( skou,'Ca', MakePath );
  skou := 'リン';
  Set_Heikin( skou,'P', MakePath );
  skou := 'マグネシウム';
  Set_Heikin( skou,'Mg', MakePath );
  skou := 'カリウム';
  Set_Heikin( skou,'K', MakePath );
  skou := '当量比';
  Set_Heikin( skou,'当量比', MakePath );
  skou := '相対飼料価';
  Set_Heikin( skou,'相対的粗飼料価', MakePath );
}
  showmessage('新年度データ作成しました。');
end;

procedure Set_Heikin( skou : string; dbkou : String;MakePath : String );
var
stmp : String;
cd1, cd2 : String;
itmp : Integer;
begin

  DataModule1.TCls.Close;
  //DataModule1.TCls.DatabaseName := MakePath;
  DataModule1.TCls.TableName := 'T_SHEIKIN';
//  DataModule1.TCls.EmptyTable;
  DataModule1.TCls.Open;

  with DataModule1.QAVG do begin
    DataModule1.QAVG.Close;
    stmp := 'select 飼料名,刈り取り番草,飼料種類,AVG('+skou+') 平均 from T_UKETUKE3 group by 飼料名,刈り取り番草,飼料種類';
    DataModule1.QAVG.SQL.Clear;
    DataModule1.QAVG.SQL.Add(stmp);
    Open;
    First;
    while not eof do begin

        cd1 := DataModule1.QAVG.FieldByName('飼料名').asString;
        itmp := DataModule1.QAVG.FieldByName('刈り取り番草').asInteger;
        cd2 := DataModule1.QAVG.FieldByName('飼料種類').asString;

        if DataModule1.TCls.Locate( '飼料名;番草;飼料種類', VarArrayOf([cd1,itmp,cd2]), [] ) then begin
           DataModule1.TCls.Edit;
           DataModule1.TCls.FieldByName( dbkou ).asFloat :=
            DataModule1.QAVG.FieldByName('平均').asfloat;
           DataModule1.TCls.Post;
        end;
        Next;
     end;
     Close;
  end;

  DataModule1.TCls.Close;


end;

//指定拡張子ファイルの複写
const Exts : array[1..3] of string =  ('.DB','.PX','.VAL');
function  FilesCopy( srcPath, dstPath, FileName  : string ) : Boolean ;
var
  srcF,dstF : string ;
	cnt : integer ;
begin
	result := False ;
  // エントリーデータはorgフォルダから複写
  for cnt := 1 to 3 do begin
    srcF := srcPath	 + FileName + Exts[cnt] ;
    dstF := dstPath  + FileName + Exts[cnt];
     //  .VALファイル以外のエラーのみエラーで返す
    if FileExists( srcF ) then begin
//      if not CopyFile(  PChar(srcF) , PChar(dstF) ,  false ) and (cnt <> 3)then begin
      if not CopyFile(  PChar(srcF) , PChar(dstF) ,  false ) then
    	  exit;
    end;
  end;
  //MBファイルが有れば複写
  srcF := srcPath	 + FileName + '.MB' ;
  dstF := dstPath  + FileName + '.MB';
  if FileExists( srcF ) then
    CopyFile(  PChar(srcF) , PChar(dstF) ,  false ) ;

  result := True ;
end;
//指定拡張子ファイルの削除
function  FilesDelete( srcPath, FileName  : string ) : Boolean ;
var
  srcF : string ;
	cnt : integer ;
begin
  // エントリーデータはorgフォルダから複写
  for cnt := 1 to 3 do begin
    srcF := srcPath	 + FileName + Exts[cnt] ;
    DeleteFile(  PChar(srcF) ) ;
  end;
  //MBファイルが有れば複写
  srcF := srcPath	 + FileName + '.MB' ;
  if FileExists( srcF ) then
    DeleteFile(  PChar(srcF) ) ;
  result := True ;
end;

{
  文字列のパーツを取り出す。パーツ区切りはスペース
}
function strParts( const pData: string ; PartsNum : integer ) : string ;
var
  cCnt , PartsCnt : integer ;
begin
  result := '';
  PartsCnt := 1 ; //最初のパーツ
  cCnt := 0 ;
  while cCnt < length( pData ) do begin
    INC(cCnt);
    if pData[cCnt] = ' ' then begin
      INC(PartsCnt);
      continue ;
    end;
    if PartsCnt > PartsNum then break;
    if PartsNum = PartsCnt then result := result + pData[cCnt];
  end;
end;
//orgディレクトリからのマスタファイル複写 : 新年度更新で利用
function OriginalFilesCopy( syncPath, srcPath, dstPath  : string ) : Boolean ;
var
  OriginalIni: TIniFile;
	IniFile, MName : string ;
  cnt,Mfiles : integer ;
begin
	result := false ;
  //システム設定関連
  IniFile := syncPath + SYNCFILE;

  //設定ﾌｧｲﾙの取り込み
  OriginalIni := nil;
  if FileExists( IniFile ) then
    OriginalIni := TIniFile.Create( IniFile );

  if OriginalIni = nil then begin
  	showmessage('マスタ設定ファイルが見つかりません。');
    exit;
  end;
  try
    // マスタデータは同じセンターの最新年度から複写
    Mfiles := OriginalIni.ReadInteger('original','NumofFiles',0);
    for cnt := 1 to Mfiles do begin
      MName := OriginalIni.ReadString('original','File'+InttoStr(cnt),'');
			result := FilesCopy( srcPath, dstPath, MName ) ;
      if not result then begin
        OriginalIni.Free ;
        exit;
      end;
    end;
    result := True ;
  finally
    OriginalIni.Free ;
  end;
end;

//指定ディレクトリからのマスタファイル複写 : 新年度更新で利用
function MasterFilesCopy( syncPath,srcPath, dstPath  : string ) : Boolean ;
var
  MasterIni: TIniFile;
	IniFile, MName : string ;
  cnt,Mfiles : integer ;
begin
	result := false ;
  //システム設定関連
  IniFile := syncPath + SYNCFILE;

  //設定ﾌｧｲﾙの取り込み
  MasterIni := nil;
  if FileExists( IniFile ) then
    MasterIni := TIniFile.Create( IniFile );

  if MasterIni = nil then begin
  	showmessage('マスタ設定ファイルが見つかりません。');
    exit;
  end;
  try
    // マスタデータは同じセンターの最新年度から複写
    Mfiles := MasterIni.ReadInteger('masters','NumofFiles',0);
    for cnt := 1 to Mfiles do begin
      MName := MasterIni.ReadString('masters','File'+InttoStr(cnt),'');
			result := FilesCopy( srcPath, dstPath, MName ) ;
      if not result then begin
        MasterIni.Free ;
        exit;
      end;
    end;
    result := True ;
  finally
    MasterIni.Free ;
  end;
end;
function MasterFilesCopy2( syncPath,srcPath, dstPath  : string ) : Boolean ;
var
  MasterIni: TIniFile;
	IniFile, MName : string ;
  cnt,Mfiles : integer ;
begin
	result := false ;
  //システム設定関連
  IniFile := syncPath + SYNCFILE;

  //設定ﾌｧｲﾙの取り込み
  MasterIni := nil;
  if FileExists( IniFile ) then
    MasterIni := TIniFile.Create( IniFile );

  if MasterIni = nil then begin
  	showmessage('マスタ設定ファイルが見つかりません。');
    exit;
  end;
  try
    // マスタデータは同じセンターの最新年度から複写
    Mfiles := MasterIni.ReadInteger('masters2','NumofFiles',0);
    for cnt := 1 to Mfiles do begin
      MName := MasterIni.ReadString('masters2','File'+InttoStr(cnt),'');
			result := FilesCopy( srcPath, dstPath, MName ) ;
      if not result then begin
        MasterIni.Free ;
        exit;
      end;
    end;
    result := True ;
  finally
    MasterIni.Free ;
  end;
end;
{
  同期ファイルの更新日付更新
  pName : マスタファイル名、更新日時＝現日時
}
procedure UpdateSyncFile( SyncFile, pSecName: string );
var
  MasterIni: TIniFile;
begin
  MasterIni := TIniFile.Create(SyncFile);
  if MasterIni = nil then begin
  	showmessage('同期設定ファイルが見つかりません。');
    exit;
  end;
  MasterIni.WriteDateTime( LowerCase(pSecName), 'update',now ) ;

  MasterIni.Free ;
end;

{
  テーブルのマージ ： Table1,2 : 絶対パステーブル名
  result : True : マージ有り
}
function  MargeTable( pTable1, pTable2 : string; key : string ) : Boolean ;
var
  cnt : integer ;
  IsUpdate : Boolean ;
  stmp : String;
begin
  IsUpdate := False ;
  with DataModule1 do begin
  //  MargeTable1.databasename := ExtractFilePath(pTable1);
    MargeTable1.TableName := ExtractFileName(pTable1);
    MargeTable1.Open ;
   // MargeTable2.databasename := ExtractFilePath(pTable2);
    MargeTable2.TableName := ExtractFileName(pTable2);
    MargeTable2.Open ;
//  Table1を回して、Table2を検索し、新しい日付を更新する。Table2に無ければ追加する。
    MargeTable1.First ;
    while not MargeTable1.eof do begin
      //同じレコードを検索する
      if MargeTable2.Locate(key,MargeTable1.FieldByName(key).asString,[]) then begin
        //編集日を比較する。
        if MargeTable1.FieldByName('編集日').asDateTime = MargeTable2.FieldByName('編集日').asDateTime then begin
          MargeTable1.Next ;
          continue ;
        end;
        if MargeTable1.FieldByName('編集日').asDateTime > MargeTable2.FieldByName('編集日').asDateTime then begin
          //1が新しい：
          with MargeTable2 do begin
            Edit ;
            for cnt := 1 to FieldCount -1 do   //主キーの次から全てコピー
              FieldValues[ Fields[cnt].FieldName ] := MargeTable1.FieldValues[ Fields[cnt].FieldName ] ;
            Post ;
            IsUpdate := True ;
          end;
        end else begin
          //2が新しい：
          with MargeTable1 do begin
            Edit ;
            for cnt := 1 to FieldCount -1 do   //主キーの次から全てコピー
              FieldValues[ Fields[cnt].FieldName ] := MargeTable2.FieldValues[ Fields[cnt].FieldName ] ;
            Post ;
            IsUpdate := True ;
          end;
        end;
      end else begin  //無ければ、2に追加
          with MargeTable2 do begin
            Append ;
            for cnt := 0 to FieldCount -1 do
              FieldValues[ Fields[cnt].FieldName ] := MargeTable1.FieldValues[ Fields[cnt].FieldName ] ;
            Post ;
            IsUpdate := True ;
          end;
      end;
      MargeTable1.Next ;
    end;
//  Table2を回して、Table2を検索し、Table1に無ければ追加する。
    MargeTable2.First ;
    while not MargeTable2.eof do begin
       stmp := MargeTable2.FieldByName(key).asString;
      if not MargeTable1.Locate(key,stmp,[]) then begin
          with MargeTable1 do begin
            Append ;
            for cnt := 0 to FieldCount -1 do
              FieldValues[ Fields[cnt].FieldName ] := MargeTable2.FieldValues[ Fields[cnt].FieldName ] ;
            Post ;
          end;
      end;
      MargeTable2.Next ;
    end;
    MargeTable1.Close ;
    MargeTable2.Close ;
  end;
  result := IsUpdate ;
end;
{
  エクスポート
}
procedure ExportFile( TableName, FileName : string );
begin

  with DataModule1 do begin

  if TableName = 't_uketuke' then begin

        //SQL.Text := 'Select Count(*) cnt from T_UKETUKE where 削除フラグ<>True and  ' + SQLCondition ;

//    QueryRead.SQL.Text := 'Select * from '+TableName;
        QueryRead.SQL.Text := 'SELECT T_uketuke.サンプル番号,'+
        'M_sakumotu.作物名,'+
        'M_sakugata.作型名,'+
//        'T_uketuke.作目コード, T_uketuke.作物コード,T_uketuke.作型コード, '+
        'M_nouka.農家番号,M_nouka.農家名,T_uketuke.圃場番号,M_hojou.圃場名,'+
        'M_dojou.土壌名,M_dosei.土性名,M_hojou.腐植コード,'+
        'M_yuuki01.有機物名称 有機物名1,'+
        'M_yuuki02.有機物名称 有機物名2,'+
        'M_yuuki03.有機物名称 有機物名3,'+

        'T_uketuke.* '+
//        'T_uketuke.pH,'+
//        'T_uketuke.EC,'+
//        'T_uketuke.トルオーグP,T_uketuke.ブレイP,'+
//        'T_uketuke.CaO,'+
//        'T_uketuke.MgO,'+
//        'T_uketuke.K2O,'+
//        'T_uketuke.CEC,'+
//        'T_uketuke.リン吸,'+
//        'T_uketuke.可給態N 培養N,'+
//        'T_uketuke.アンモニア態N,'+
//        'T_uketuke.硝酸態N,T_uketuke.熱抽出N,'+
//        'T_uketuke.ケイ酸,'+
//        'T_uketuke.鉄,'+
//        'T_uketuke.亜鉛,'+
//        'T_uketuke.銅,'+
//        'T_uketuke.マンガン,'+
 //       'T_uketuke.ホウ素,'+
//        'T_uketuke.ニッケル,'+
//        'T_uketuke.腐植,'+
//        'T_uketuke.容積重,'+
//        'T_uketuke.溶脱係数 '+
'FROM "T_UKETUKE.DB" T_uketuke'+
'   LEFT OUTER JOIN "M_HOJOU.DB" M_hojou'+
'   ON  (T_uketuke.圃場番号 = M_hojou.圃場番号)'+
'   LEFT OUTER JOIN "M_SAKUMOTU.db" M_sakumotu'+
'   ON  (T_uketuke.作目コード = M_sakumotu.作目コード)'+
'   AND  (T_uketuke.作物コード = M_sakumotu.作物コード)'+
'   LEFT OUTER JOIN "M_SAKUGATA.DB" M_sakugata'+
'   ON  (T_uketuke.作目コード = M_sakugata.作目コード)'+
'   AND  (T_uketuke.作物コード = M_sakugata.作物コード)'+
'   AND  (T_uketuke.作型コード = M_sakugata.作型コード)'+
'   LEFT OUTER JOIN "M_NOUKA.db" M_nouka'+
'   ON  (M_hojou.農家番号 = M_nouka.農家番号)'+
'   LEFT OUTER JOIN "M_DOJOU.db" M_dojou'+
'   ON  (M_hojou.土壌コード = M_dojou.土壌コード)'+
'   LEFT OUTER JOIN "M_DOSEI.db" M_dosei'+
'   ON  (M_hojou.土性コード = M_dosei.土性コード)'+
'   LEFT OUTER JOIN "M_YUUKI.db" M_yuuki01'+
'   ON  (T_uketuke.有機物コード1 = M_yuuki01.有機物コード)'+
'   LEFT OUTER JOIN "M_YUUKI.db" M_yuuki02'+
'   ON  (T_uketuke.有機物コード2 = M_yuuki02.有機物コード)'+
'   LEFT OUTER JOIN "M_YUUKI.db" M_yuuki03'+
'   ON  (T_uketuke.有機物コード3 = M_yuuki03.有機物コード)'+
'WHERE T_Uketuke.削除フラグ<>True '+
'and '+ SQLCondition;
//'Order by T_Uketuke.サンプル番号';
    end
    else begin
    QueryRead.SQL.Text := 'Select * from '+TableName;

    end;
    QueryRead.Open;
    QueryToCSV(QueryRead,FileName) ;
    QueryRead.Close;
  end;
end;

//地図データ出力
procedure ExportFileGIS( TableName, FileName : string );
var
  iCnt : Integer;
  WorkList,CSVList : TStringList;
  stmp, stmp2 : String;
  kou : String;
begin

  with DataModule1 do begin

//    QueryRead.SQL.Text := 'Select * from '+TableName;
        QueryRead.SQL.Text := 'SELECT T_uketuke.サンプル番号,'+
        'M_sakumoku.作目名,'+
        'M_sakumotu.作物名,'+
        'M_sakugata.作型名,'+
        'M_zsakumotu.作物名 前作名,'+
//        'T_uketuke.作目コード, T_uketuke.作物コード,T_uketuke.作型コード, '+
        'M_nouka.農家番号,M_nouka.農家名,T_uketuke.圃場番号,M_hojou.圃場名,'+
        'M_hojou.土壌コード,'+
        'M_noukyou.農協名,'+
        'M_dojou.土壌名,M_dosei.土性名,M_hojou.腐植コード,'+

        'T_uketuke.* '+
//        'T_uketuke.pH,'+
//        'T_uketuke.EC,'+
//        'T_uketuke.トルオーグP,T_uketuke.ブレイP,'+
//        'T_uketuke.CaO,'+
//        'T_uketuke.MgO,'+
//        'T_uketuke.K2O,'+
//        'T_uketuke.CEC,'+
//        'T_uketuke.リン吸,'+
//        'T_uketuke.可給態N 培養N,'+
//        'T_uketuke.アンモニア態N,'+
//        'T_uketuke.硝酸態N,T_uketuke.熱抽出N,'+
//        'T_uketuke.ケイ酸,'+
//        'T_uketuke.鉄,'+
//        'T_uketuke.亜鉛,'+
//        'T_uketuke.銅,'+
//        'T_uketuke.マンガン,'+
 //       'T_uketuke.ホウ素,'+
//        'T_uketuke.ニッケル,'+
//        'T_uketuke.腐植,'+
//        'T_uketuke.容積重,'+
//        'T_uketuke.溶脱係数 '+
'FROM "T_UKETUKE.DB" T_uketuke'+
'   LEFT OUTER JOIN "M_HOJOU.DB" M_hojou'+
'   ON  (T_uketuke.圃場番号 = M_hojou.圃場番号)'+
'   LEFT OUTER JOIN "M_SAKUMOKU.db" M_sakumoku'+
'   ON  (T_uketuke.作目コード = M_sakumoku.作目コード)'+

'   LEFT OUTER JOIN "M_SAKUMOTU.db" M_sakumotu'+
'   ON  (T_uketuke.作目コード = M_sakumotu.作目コード)'+
'   AND  (T_uketuke.作物コード = M_sakumotu.作物コード)'+
'   LEFT OUTER JOIN "M_SAKUGATA.DB" M_sakugata'+
'   ON  (T_uketuke.作目コード = M_sakugata.作目コード)'+
'   AND  (T_uketuke.作物コード = M_sakugata.作物コード)'+
'   AND  (T_uketuke.作型コード = M_sakugata.作型コード)'+

'   LEFT OUTER JOIN "M_SAKUMOTU.db" M_zsakumotu'+
'   ON  (T_uketuke.前作目コード = M_zsakumotu.作目コード)'+
'   AND  (T_uketuke.前作物コード = M_zsakumotu.作物コード)'+


'   LEFT OUTER JOIN "M_NOUKA.db" M_nouka'+
'   ON  (M_hojou.農家番号 = M_nouka.農家番号)'+
'   LEFT OUTER JOIN "M_NOUKYOU.db" M_noukyou'+
'   ON  (M_nouka.農協コード = M_noukyou.農協コード)'+
'   LEFT OUTER JOIN "M_DOJOU.db" M_dojou'+
'   ON  (M_hojou.土壌コード = M_dojou.土壌コード)'+
'   LEFT OUTER JOIN "M_DOSEI.db" M_dosei'+
'   ON  (M_hojou.土性コード = M_dosei.土性コード)'+
'WHERE T_Uketuke.削除フラグ<>True '+
'and '+ SQLCondition;
//'Order by T_Uketuke.サンプル番号';


    QueryRead.Open;
//    QueryToCSV(QueryRead,FileName) ;

//    WorkList := TStringList.Create;
    CSVList := TStringList.Create;

    //最初の1行はフィールド名
//    for iCnt:= 0 to QuerySource.FieldCount -1 do
//      WorkList.Add(QuerySource.Fields[iCnt].FieldName);

    stmp := stmp + 'サンプル番号,';
    stmp := stmp + '農協名,';
    stmp := stmp + '農家コード,';
    stmp := stmp + '農家名,';
    stmp := stmp + '圃場番号,';
    stmp := stmp + '分析対象土壌コード,';
    stmp := stmp + '分析対象土壌名,';
    stmp := stmp + '土壌名,';
    stmp := stmp + '土性名,';
    stmp := stmp + '前作,';

    stmp := stmp + '作付予定,';
    stmp := stmp + '排水良否,';
    stmp := stmp + '病害,';
    stmp := stmp + '施肥法,';
    stmp := stmp + '復元田,';
    stmp := stmp + '利用区分,';
    stmp := stmp + '造成年,';
    stmp := stmp + '現在草種,';
    stmp := stmp + '対象土層,';
    stmp := stmp + '前作栽培区分,';

    stmp := stmp + '予定作物栽培区分,';
    stmp := stmp + '園地利用区分,';
    stmp := stmp + 'ｐＨ,';
    stmp := stmp + '電気伝導度,';
    stmp := stmp + '加里,';
    stmp := stmp + '苦土,';
    stmp := stmp + '石灰,';
    stmp := stmp + '塩基置換容量,';
    stmp := stmp + 'トルオーグりん酸,';
    stmp := stmp + 'ブレイりん酸,';

    stmp := stmp + 'りんＱ,';
    stmp := stmp + '腐植,';
    stmp := stmp + '熱－Ｎ,';
    stmp := stmp + '培養－Ｎ,';
    stmp := stmp + '仮比重,';
    stmp := stmp + '湛水法珪酸,';
    stmp := stmp + '酢酸法珪酸,';
    stmp := stmp + 'ホウ素,';
    stmp := stmp + '銅,';
    stmp := stmp + '亜鉛,';

    stmp := stmp + 'マンガン,';
    stmp := stmp + '遊離酸化鉄,';
    stmp := stmp + '作物体珪酸,';
    stmp := stmp + '採取年月日,';
    stmp := stmp + ' ,';
    stmp := stmp + ' ,';
    stmp := stmp + '加里,';
    stmp := stmp + '苦土,';
    stmp := stmp + '石灰,';
    stmp := stmp + 'CEC,';

    stmp := stmp + '塩基飽和度,';
    stmp := stmp + '石灰飽和度,';
    stmp := stmp + '苦土カリ比,';
    stmp := stmp + '石灰苦土比';

    CSVList.Add(stmp);

//    CSVList.Add(WorkList.CommaText);

    //レコードをStringListに出力
    QueryRead.First;
    while not QueryRead.EOF do begin
//    WorkList.Clear ;
//    for iCnt:= 0 to QuerySource.FieldCount -1 do
//      WorkList.Add(QuerySource.Fields[iCnt].AsString);
      stmp := '';


      stmp := stmp + QueryRead.FieldByName('サンプル番号').asString;
      stmp := stmp + ','+QueryRead.FieldByName('農協名').asString;
      stmp := stmp + ','+QueryRead.FieldByName('農家番号').asString;
      stmp := stmp + ','+QueryRead.FieldByName('農家名').asString;
      stmp := stmp + ','+QueryRead.FieldByName('圃場番号').asString;
      stmp := stmp + ','+QueryRead.FieldByName('土壌コード').asString;
      stmp := stmp + ','+QueryRead.FieldByName('作目名').asString;  //分析対象土壌名
      stmp := stmp + ','+QueryRead.FieldByName('土壌名').asString;
      stmp := stmp + ','+QueryRead.FieldByName('土性名').asString;
      stmp := stmp + ','+QueryRead.FieldByName('前作名').asString;
      stmp := stmp + ','+QueryRead.FieldByName('作物名').asString;
      stmp := stmp + ',';//排水良否 +QueryRead.FieldByName('').asString;
      stmp := stmp + ','; //病害 +QueryRead.FieldByName('').asString;
      stmp := stmp + ',';//施肥法QueryRead.FieldByName('').asString;
      stmp := stmp + ',';//復元田QueryRead.FieldByName('').asString;
      stmp := stmp + ',';//利用区分QueryRead.FieldByName('').asString;

      stmp := stmp + ',';//造成年QueryRead.FieldByName('').asString;
      stmp := stmp + ',';//現在草種QueryRead.FieldByName('').asString;
      stmp := stmp + ',';//対象土層QueryRead.FieldByName('').asString;
      stmp := stmp + ',';//前作栽培区分QueryRead.FieldByName('').asString;
      stmp := stmp + ',';//予定作物栽培区分QueryRead.FieldByName('').asString;
      stmp := stmp + ',';//園地利用区分QueryRead.FieldByName('').asString;


      kou := 'pH';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := 'EC';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);


      kou := 'K2O';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := 'MgO';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := 'CaO';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := 'トルオーグP';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := 'ブレイP';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*f ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := 'リン吸';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*f ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '腐植';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '熱抽出N';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '可給態N'; //培養窒素
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '容積重'; //培養窒素
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := 'ケイ酸'; //湛水法珪酸
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := 'ケイ酸'; //酢酸法珪酸
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := 'ホウ素';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '銅';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '亜鉛';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := 'マンガン';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '鉄';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '作物体ケイ酸';
      //if QueryRead.FieldByName(kou).IsNull then
      stmp := stmp + ',';
      //else
      //    stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '採取年月日';
      if QueryRead.FieldByName(kou).IsNull then begin
          stmp := stmp + ',';
      end
      else begin
          DateTimetoString(stmp2, 'yyyy/mm/dd',QueryRead.FieldByName(kou).asDateTime);
          stmp := stmp + ','+ stmp2;
      end;

      //２つ空白
      stmp := stmp + ',';
      stmp := stmp + ',';

      kou := 'K2O';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := 'MgO';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := 'CaO';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := 'CEC';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);


{
    stmp := stmp + '塩基飽和度,';
    stmp := stmp + '石灰飽和度,';
    stmp := stmp + '苦土カリ比,';
    stmp := stmp + '石灰苦土比';
}
      stmp := stmp + ',';
      stmp := stmp + ',';
      stmp := stmp + ',';
      //stmp := stmp + ',';

      CSVList.Add(stmp);
      QueryRead.Next;
    end;

    CSVList.SavetoFile( FileName );

    CSVList.Free;
//  WorkList.Free;

    QueryRead.Close;
  end;
end;
{
  クエリーをＣＳＶ出力。一行目：フィールド名
}
procedure QueryToCSV( QuerySource:TADOQuery; FileName:String );
var
  iCnt : Integer;
  WorkList,CSVList : TStringList;
begin
  WorkList := TStringList.Create;
  CSVList := TStringList.Create;

  //最初の1行はフィールド名
  for iCnt:= 0 to QuerySource.FieldCount -1 do
    WorkList.Add(QuerySource.Fields[iCnt].FieldName);
  CSVList.Add(WorkList.CommaText);
  //レコードをStringListに出力
  QuerySource.First;
  while not QuerySource.EOF do begin
    WorkList.Clear ;
    for iCnt:= 0 to QuerySource.FieldCount -1 do
      WorkList.Add(QuerySource.Fields[iCnt].AsString);
    CSVList.Add(WorkList.CommaText);
    QuerySource.Next;
  end;
  CSVList.SavetoFile( FileName );

  CSVList.Free;
  WorkList.Free;
end;
{
  インポート
}
function ImportFile( FileName, TableName  : string ):Boolean;
begin
end;
{
  CSVファイルをテーブルに書き込む、上書き追加
}
function CSVToQuery( FileName:String; QuerySource:TQuery ): Boolean ;
var
  TF : TextFile ;
  aRec,sSQL : string ;
  FieldNList,DataList : TStringList;
  aCnt : integer ;
begin
  result := False ;
  AssignFile(TF, FileName);
  FieldNList := TStringList.Create;
  DataList  := TStringList.Create;
  sSQL :=  QuerySource.SQL.Text ;
  try
    Reset(TF);
    Readln(TF,aRec);   //フィールドリストの取得
    FieldNList.CommaText := aRec ;
    while not Eof(TF) do begin
      Readln(TF,aRec);  //データレコード一件入力
      DataList.CommaText := aRec ;
      //該当クエリーに出力
      with QuerySource do begin
        //第一フィールドを主キーと見なして既存レコードの確認
        Close ;
        SQL.Text := sSQL + ' where '+FieldNList[0]+' = '''+DataList[0]+'''' ;
        Open;
        if RecordCount > 0 then Edit
        else Append ;
        for aCnt := 0 to FieldNList.Count -1 do
          FieldByName( FieldNList[aCnt] ).asString := DataList[aCnt] ;
        Post;
      end;
    end;
    result := True ;
  finally
    CloseFile(TF);
    FieldNList.Free ;
    DataList.Free ;
  end;
end;
{
  肥料名称取得：コード桁数で参照マスタ変更
}
function GetHiryoName( Code : string ) : string ;
begin
  with DataModule1.QueryRead2 do begin
    if length(Code)>2 then begin
      SQL.Text := 'Select 肥料名 from M_KASEI where CODE='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('肥料名').asString
      else result := '';
    end else begin
      SQL.Text := 'Select 有機物名称 from M_YUUKI where 有機物コード='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('有機物名称').asString
      else result := '';
    end;
    Close;
  end;
end;
///////
function GetHiryoN( Code : string ) : Double;
begin
  with DataModule1.QueryRead2 do begin
    if length(Code)>2 then begin
      SQL.Text := 'Select * from M_KASEI where CODE='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('N').asFloat
      else result := 0;
    end else begin
      SQL.Text := 'Select * from M_YUUKI where 有機物コード='''+Code+'''';
      Open;
      if RecordCount > 0 then begin
//        if IsKazan then
            result := FieldbyName('N').asFloat;
//        else
//            result := FieldbyName('N_2').asFloat;
      end
      else begin
        result := 0;
      end;
    end;
    Close;
  end;
end;
function GetHiryoP( Code : string ) : Double;
begin
  with DataModule1.QueryRead2 do begin
    if length(Code)>2 then begin
      SQL.Text := 'Select * from M_KASEI where CODE='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('P205').asFloat
      else result := 0;
    end else begin
      SQL.Text := 'Select * from M_YUUKI where 有機物コード='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('P205').asFloat
      else result := 0;
    end;
    Close;
  end;
end;
function GetHiryoK( Code : string ) : Double;
begin
  with DataModule1.QueryRead2 do begin
    if length(Code)>2 then begin
      SQL.Text := 'Select * from M_KASEI where CODE='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('K2O').asFloat
      else result := 0;
    end else begin
      SQL.Text := 'Select * from M_YUUKI where 有機物コード='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('K2O').asFloat
      else result := 0;
    end;
    Close;
  end;
end;
function GetHiryoM( Code : string ) : Double;
begin
  with DataModule1.QueryRead2 do begin
    if length(Code)>2 then begin
      SQL.Text := 'Select * from M_KASEI where CODE='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('MgO').asFloat
      else result := 0;
    end else begin
      SQL.Text := 'Select * from M_YUUKI where 有機物コード='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('MgO').asFloat
      else result := 0;
    end;
    Close;
  end;
end;
function GetHiryoT( Code : string ) : Boolean;
begin
  with DataModule1.QueryRead2 do begin
    if length(Code)>2 then begin
//   DatabaseName := 'DOJO2';
      SQL.Text := 'Select * from M_KASEI where CODE='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('追肥フラグ').asBoolean
      else result := false;
    Close;
    end;
  end;
end;
function GetHiryoTanka( Code : string ) : Integer;
begin
  with DataModule1.QueryRead2 do begin
    if length(Code)>2 then begin
//   DatabaseName := 'DOJO2';
      SQL.Text := 'Select * from M_KASEI where CODE='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('単価').asInteger
      else result := 0;
    Close;
    end;
  end;
end;
function GetHiryoV( Code : string ) : Double;
begin
  with DataModule1.QueryRead2 do begin
    if length(Code)>2 then begin
//   DatabaseName := 'DOJO2';
      SQL.Text := 'Select * from M_KASEI where CODE='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('容量').asfloat
      else result := 0;
    Close;
    end;
  end;
end;

//========================================================================
//　typCEC の　セット
//  A,B,C
//========================================================================
function Get_CEC_ABC(UketukeQuery : TADOQuery): string;
var
  dcode : String;
  IsKusa : Boolean ;
begin

  IsKusa := UketukeQuery.FieldByName('作目コード').asString = BokusouCode;
  //A.Nishimura 火山性土の判定
  dcode :=  UketukeQuery.FieldByName('M_HOJOU.土壌コード').asString;

  //草地の場合と園芸に分ける
  if IsKusa then begin
      if dcode = '' then dcode := '10';
      result := 'A';
      case Strtoint( dcode ) of
        31: result := 'A';
        32: result := 'B';
        33: result := 'C';
      end;
  end
  else begin    //草地以外
      //CECよりどの基準値{A,B,C}を採用するか
      if UketukeQuery.FieldByName('CEC').asFloat < 12.0 then  result := 'A'
      else
      if UketukeQuery.FieldByName('CEC').asFloat < 25.0 then  result := 'B'
      else                                                     result := 'C' ;
  end;

end;
//========================================================================
//　typCEC の　セット
//  A,B,C
//========================================================================
function Get_CEC_ABC2(UketukeQuery : TADOQuery): string;
var
  dcode : String;
  IsKusa : Boolean ;
begin

  IsKusa := UketukeQuery.FieldByName('作目コード').asString = BokusouCode;
  //A.Nishimura 火山性土の判定
  dcode :=  UketukeQuery.FieldByName('土壌コード').asString;   //土壌code

  //草地の場合と園芸に分ける
  if IsKusa then begin
      if dcode = '' then dcode := '10';
      result := 'A';
      case Strtoint( dcode ) of
        31: result := 'A';
        32: result := 'B';
        33: result := 'C';
      end;
  end
  else begin    //草地以外
      //CECよりどの基準値{A,B,C}を採用するか
      if UketukeQuery.FieldByName('CEC').asFloat < 12.0 then  result := 'A'
      else
      if UketukeQuery.FieldByName('CEC').asFloat < 25.0 then  result := 'B'
      else                                                     result := 'C' ;
  end;

end;
//========================================================================
//  基準値のレコードセット
//========================================================================
function Set_Kijun_Rec(UketukeQuery : TADOQuery;QueryKijun : TADOQuery): Integer;
var
  aBuff,DosituCode : string ;
  dcode : String;
  IsKusa, IsIne : Boolean ;
  IsKazan : Boolean ;
  stmp : string;
  cd1, cd2, cd3 : string;

begin
  IsKusa := UketukeQuery.FieldByName('作目コード').asString = BokusouCode ;
  IsIne := UketukeQuery.FieldByName('作目コード').asString = SuitouCode ;

  cd1 := UketukeQuery.FieldByName('作目コード').asString;
  cd2 := UketukeQuery.FieldByName('作物コード').asString;
  cd3 := UketukeQuery.FieldByName('作型コード').asString;

  //A.Nishimura 火山性土の判定
  dcode :=  UketukeQuery.FieldByName('M_HOJOU.土壌コード').asString;

  case Strtoint(Copy( dcode,1,1)) of
  1,4:  DosituCode := '2';
  2:     DosituCode := '3';
  3:     DosituCode := '1';
  end;
  IsKazan := DosituCode = '1'; //火山性土

  //基準値CEC 0～10 等のタイプを判定 A,B,C
//  typcec := Get_CEC_ABC(QueryUketuke);
//  typCEC_Set;

  //作成作目により基準値割り出し

  with QueryKijun do begin
    aBuff := UketukeQuery.FieldByName('作型コード').asString ;
    if aBuff <> '' then begin
      Close;
      if IsKusa then
//        SQL.Text := 'Select * from M_BOKUGATA where 作目コード=:作目コード and 作物コード=:作物コード and 作型コード=:作型コード and 土質コード='''+DosituCode+''''
        SQL.Text := 'Select * from M_BOKUGATA where 作目コード='''+cd1+''' and 作物コード='''+cd2+''' and 作型コード='''+cd3+''' and 土質コード='''+DosituCode+''''
      else
        SQL.Text := 'Select * from M_SAKUGATA where 作目コード='''+cd1+''' and 作物コード='''+cd2+''' and 作型コード='''+cd3+'''';
//        SQL.Text := 'Select * from M_SAKUGATA where 作目コード=:作目コード and 作物コード=:作物コード and 作型コード=:作型コード';

      stmp := SQL.Text;
      Open;
      if not FieldByName('使用有無').asBoolean then     //このレコード有効か？
        Close;
    end;
    //先の判定でクエリ有効でないなら
    //予定作物のみであればその作目コードで基準値DBから基準値を取得する。
    if not Active then begin
      if IsKusa then
//        SQL.Text := 'Select * from M_BOKUMOKU where 作目コード=:作目コード and 土質コード='''+DosituCode+''''
        SQL.Text := 'Select * from M_BOKUMOKU where 作目コード='''+cd1+''' and 土質コード='''+DosituCode+''''
      else
        SQL.Text := 'Select * from M_SAKUMOKU where 作目コード='''+cd1+'''';// and 作物コード='''+cd2+'''';
//        SQL.Text := 'Select * from M_SAKUMOKU where 作目コード=:作目コード';

      stmp := SQL.Text;
      Open;
    end;
    result := Recordcount;
  end; {bottom with}
end;
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
    //空きのあるところに
    if aryHiryo[Ord(aType),aCnt].CD = '' then begin

      with DataModule1.QueryRead do begin  //肥料明細の登録
        case aType of
        htYuuki:
          if IsKazan then
            SQL.Text := 'Select 有機物名称 as Name,N_2 as N,K_2 as K,P_2 as P,0 as M from M_Yuuki where 有機物コード='''+aCode+''''
          else
            SQL.Text := 'Select 有機物名称 as Name,N,K,P,0 as M from M_Yuuki where 有機物コード='''+  aCode+'''';
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
{NULLは０にするStrtoFloat}
function myStrtoFloat( aText : string ) : double ;
begin
  result := 0;
  if aText = '' then exit;
  try
    result := StrtoFloat( aText );
  except
  end;
end;
{
  特定の名称のコンポーネント１～５のEnabledの設定
}
procedure SetEnableBDE(aOwner : TComponent; aName : string ; aFlag : Boolean );
var
  aCnt : integer ;
begin
  for aCnt := 1 to 5 do
    SetEnableBDE(TDBEdit(aOwner.FindComponent( aName + Inttostr( aCnt ))), aFlag );
end;
{コンポーネント指定の場合}
procedure SetEnableBDE( pCMP : TDBEdit; aFlag : Boolean  );
begin
  if pCMP = nil then exit;
  pCMP.Enabled := aFlag ;
  if aFlag then
    pCMP.Color := clWindow
  else
    pCMP.Color := clSilver;
end;

{
  標準施用量の算出処理
}

function GetStandardValue(UketukeQuery : TADOQuery): TRecStandard;
var
  SakumokuCD,SakumotuCD,SakugataCD : string ;
  TableN,TitaiCD,DojoCD : string ;
  IsEngei,IsKusa : Boolean;  {園芸作物}
  NKaisu : integer ;  {窒素分施回数：通常合計の施肥回数を成分共通で適用}
begin
  result.Motohi.N := 0;
  result.Motohi.P := 0;
  result.Motohi.K := 0;
  result.Motohi.M := 0;
  result.Sehi1.N := 0;
  result.Sehi1.P := 0;
  result.Sehi1.K := 0;
  result.Sehi1.M := 0;
  result.Sehi2.N := 0;
  result.Sehi2.P := 0;
  result.Sehi2.K := 0;
  result.Sehi2.M := 0;
  result.Sum.N := 0;
  result.Sum.P := 0;
  result.Sum.K := 0;
  result.Sum.M := 0;
  result.Kaisu := 0;

  SakumokuCD := UketukeQuery.FieldByName('作目コード').asString;
  SakumotuCD := UketukeQuery.FieldByName('作物コード').asString;
  SakugataCD := UketukeQuery.FieldByName('作型コード').asString;
  IsEngei := (SakumokuCD = '3') or (SakumokuCD = '4') or (SakumokuCD = '5') ;{園芸作物か}
  IsKusa  := (SakumokuCD = '6') or (SakumokuCD = '7') ;{牧草}
//  IsKusa  := (SakumokuCD = '6');{牧草}


  with DataModule1.QueryRead do begin
    Close;
    SQL.Text := '';
    if SakumokuCD = '1' then begin

      if (SakumotuCD = '04' ) or
         (SakumotuCD = '05' ) or
         (SakumotuCD = '06' ) then begin
        TableN := 'M_SEHI_T';
        SQL.Text := 'Select * from '+TableN+
                    ' Where 作目コード = "'+SakumokuCD+'" and '+
                    '作物コード = "'+SakumotuCD+'" and '+
                    '作型コード = "'+SakugataCD+'"';

      end
      else begin
        TableN := 'M_SEHI_S';
        TitaiCD := UketukeQuery.FieldByName('水稲地帯区分').asString;
        DojoCD := UketukeQuery.FieldByName('水稲土壌コード').asString;
        if (SakumotuCD = '01') or(SakumotuCD = '03')then //本田 　復元田　{食味米=03}
          SQL.Text := 'Select 全層施肥 as N,燐N as P,カリN as K,苦土 as Mg from '+TableN+
                      ' Where 地帯区分='''+TitaiCD+''' and 土壌区分='''+DojoCD + ''''
        else if SakumotuCD = '02' then  //水稲側条
//H171114          SQL.Text := 'Select 全側全層分+全側側条分 as N,燐N as P,カリN as K,苦土 as Mg from '+TableN+
//                      ' Where 地帯区分='''+TitaiCD+''' and 土壌区分='''+DojoCD + ''''
          SQL.Text := 'Select 全側全層分 as N,全側側条分 as N2,燐N as P,カリN as K,苦土 as Mg from '+TableN+
                      ' Where 地帯区分='''+TitaiCD+''' and 土壌区分='''+DojoCD + ''''
        else if SakumotuCD = '04' then //水稲床土
          SQL.Text := 'Select 全層施肥 as N,燐N as P,カリN as K,苦土 as Mg from '+TableN+
                      ' Where 地帯区分='''+TitaiCD+''' and 土壌区分='''+DojoCD + ''''
        else if SakumotuCD = '07' then //水稲床土
          SQL.Text := 'Select 全側全層分 as N,全側側条分 as N2,燐N as P,カリN as K,苦土 as Mg from '+TableN+
                      ' Where 地帯区分='''+TitaiCD+''' and 土壌区分='''+DojoCD + ''''
        else  //以外は全て０
          ;
      end;

    end else
    if SakumokuCD = '2' then begin
        TableN := 'M_SEHI_H';
        TitaiCD := UketukeQuery.FieldByName('標準地帯区分').asString;
        DojoCD := UketukeQuery.FieldByName('畑牧土壌コード').asString;
        SQL.Text := 'Select * from '+TableN+' Where 作目コード='''+SakumokuCD+''' and 作物コード='''+SakumotuCD+
                    ''' and  地帯区分='''+TitaiCD+''' and 土壌区分='''+DojoCD + '''';
    end else
    if IsEngei then begin
        TableN := 'M_SEHI_E';
        TitaiCD := '';
        DojoCD := UketukeQuery.FieldByName('畑牧土壌コード').asString;
        SQL.Text := 'Select * from '+TableN+' Where 作目コード='''+SakumokuCD+''' and 作物コード='''+SakumotuCD+
                    ''' and  作型コード='''+SakugataCD+''' and 土壌区分='''+DojoCD + '''';
    end else
    if IsKusa then begin
        TableN := 'M_SEHI_B';
        TitaiCD := UketukeQuery.FieldByName('標準地帯区分').asString;
        DojoCD := UketukeQuery.FieldByName('畑牧土壌コード').asString;
        SQL.Text := 'Select * from '+TableN+' Where 作目コード='''+SakumokuCD+''' and 作物コード='''+SakumotuCD+
                    ''' and  作型コード='''+SakugataCD+''' and  地帯区分='''+TitaiCD+''' and 土壌区分='''+DojoCD + '''';
    end;
    //クエリー無い物は０値
    if SQL.Text <> '' then begin
      Open;
      if RecordCount = 0 then begin
        Close;
        exit; //０値
      end;

//H171220  施肥標準
      //園芸の場合分施値を取得する。
      if IsEngei then begin
        result.Motohi.N := FieldByName('基肥N2').asFloat ;    {成分により標準値参照が違う}
        result.Motohi.P := FieldByName('基肥P3').asFloat ;
        result.Motohi.K := FieldByName('基肥K3').asFloat ;
        result.Motohi.M := FieldByName('Mg').asFloat ;

        result.Suijyun.N := FieldByName('水準分類N').asInteger;

        //追肥は分施１に値を代入するが、合計の算出対象には分施１はならない
//        if FieldByName('追分分類N').asInteger >= 0 then //追肥は基肥と同じ
          result.Sehi1.N := FieldByName('分施1N2').asFloat;
//        if FieldByName('追分分類P').asInteger >= 0 then //追肥は基肥と同じ
          result.Sehi1.P := FieldByName('分施1P3').asFloat;
//        if FieldByName('追分分類K').asInteger >= 0 then //追肥は基肥と同じ
          result.Sehi1.K := FieldByName('分施1K3').asFloat;

//        if FieldByName('追分分類N').asInteger >= 2 then //分施2回以上
          result.Sehi2.N := FieldByName('分施2N2').asFloat;
//        if FieldByName('追分分類P').asInteger >= 2 then //分施2回以上
          result.Sehi2.P := FieldByName('分施2P3').asFloat;
//        if FieldByName('追分分類K').asInteger >= 2 then //分施2回以上
          result.Sehi2.K := FieldByName('分施2K3').asFloat;
        {分施値は窒素の施肥回数}
//        if FieldByName('追分分類N').asInteger >= 1 then //分施1回以上
          result.Kaisu := FieldByName('追分分類N').asInteger;
        {合計算出:マスタの合計項目でなく、窒素の分施回数から算出する
        理由：マスタメンテを経由しないとき合計値が算出されないため}
(*
        result.Sum.N := FieldByName('N').asFloat ;
        result.Sum.P := FieldByName('P').asFloat ;
        result.Sum.K := FieldByName('K').asFloat ;
*)
        NKaisu :=  FieldByName('追分分類N').asInteger ;
        result.Sum.N := result.Motohi.N ;
//        if NKaisu <= 1 then
          result.Sum.N := result.Sum.N + result.Sehi1.N ;
//        if NKaisu > 1 then
//          result.Sum.N := result.Sum.N + result.Sehi2.N*(NKaisu-1) ;
//          result.Sum.N := result.Sum.N + result.Sehi2.N*NKaisu ;

        result.Sum.P := result.Motohi.P ;
//        if NKaisu <= 1 then
          result.Sum.P := result.Sum.P + result.Sehi1.P ;
//        if NKaisu > 1 then
//          result.Sum.P := result.Sum.P + result.Sehi2.P*NKaisu ;

        result.Sum.K := result.Motohi.K ;
//        if NKaisu <= 1 then
          result.Sum.K := result.Sum.K + result.Sehi1.K ;
//        if NKaisu > 1 then
//          result.Sum.K := result.Sum.K + result.Sehi2.K*NKaisu ;

        result.Sum.M := FieldByName('Mg').asFloat ;
      end
      //H141114 側条
      else if (SakumokuCD = '1') and
              (SakumotuCD = '02' ) then begin

        result.Motohi.N  := FieldByName('N').asFloat ;
        result.Motohi.P := FieldByName('P').asFloat ;
        result.Motohi.K := FieldByName('K').asFloat ;
        result.Motohi.M := FieldByName('Mg').asFloat ;

        result.Sehi1.N  := FieldByName('N2').asFloat ;

        result.Sum.N := FieldByName('N').asFloat + FieldByName('N2').asFloat;
        result.Sum.P := FieldByName('P').asFloat ;
        result.Sum.K := FieldByName('K').asFloat ;
        result.Sum.M := FieldByName('Mg').asFloat ;
      end

      else if (SakumokuCD = '1') and
              ((SakumotuCD = '04' ) or
               (SakumotuCD = '05' ) or
               (SakumotuCD = '06' )) then begin

        //result.Kaisu := FieldByName('追肥回数').asInteger;

        result.Motohi.N  := FieldByName('N').asFloat ;
        result.Motohi.P := FieldByName('P').asFloat ;
        result.Motohi.K := FieldByName('K').asFloat ;
        result.Motohi.M := FieldByName('Mg').asFloat ;
        result.Sehi1.N  := FieldByName('N1').asFloat ;
        result.Sehi2.N  := FieldByName('N2').asFloat ;

        if result.Sehi2.N <> 0.0 then begin
           result.Kaisu := 2;
        end
        else if result.Sehi1.N <> 0.0 then begin
           result.Kaisu := 1;
        end
        else begin
        result.Kaisu := 0;
        end;


        result.Sum.N := FieldByName('N').asFloat + FieldByName('N1').asFloat + FieldByName('N2').asFloat;
        result.Sum.P := FieldByName('P').asFloat ;
        result.Sum.K := FieldByName('K').asFloat ;
        result.Sum.M := FieldByName('Mg').asFloat ;

      end
      //畑作　ＪＡあばしり版　追肥
      else if (SakumokuCD = '2') then begin

        result.Motohi.N  := FieldByName('N').asFloat ;
        result.Motohi.P := FieldByName('P').asFloat ;
        result.Motohi.K := FieldByName('K').asFloat ;
        result.Motohi.M := FieldByName('Mg').asFloat ;
        result.Sehi1.N  := FieldByName('N2').asFloat ;
        result.Sehi1.P := FieldByName('P2').asFloat ;
        result.Sehi1.K := FieldByName('K2').asFloat ;
        result.Sehi1.M := FieldByName('Mg2').asFloat ;
        result.Sum.N := FieldByName('N').asFloat + FieldByName('N2').asFloat;
        result.Sum.P := FieldByName('P').asFloat + FieldByName('P2').asFloat;
        result.Sum.K := FieldByName('K').asFloat + FieldByName('K2').asFloat;
        result.Sum.M := FieldByName('Mg').asFloat + FieldByName('Mg2').asFloat;

        result.NMax := FieldByName('NMax').asFloat;


        if (SakumotuCD = '01' ) then
            result.Kaisu := -1
        else
                result.kaisu := FieldByName('分施回数').asinteger;
//    result.Kaisu := 0;

     end
     else begin   //園芸以外は基肥のみ
//        if IsKusa then begin   //牧草は施肥入力あるが、マスタにはない
//        end;
        result.Motohi.N  := FieldByName('N').asFloat ;
        result.Motohi.P := FieldByName('P').asFloat ;
        result.Motohi.K := FieldByName('K').asFloat ;
        result.Motohi.M := FieldByName('Mg').asFloat ;
        result.Sum.N := FieldByName('N').asFloat ;
        result.Sum.P := FieldByName('P').asFloat ;
        result.Sum.K := FieldByName('K').asFloat ;
        result.Sum.M := FieldByName('Mg').asFloat ;
      end;
    end;
    Close;
  end; {bottom with QueryRead}
end;
//////////////////////////////
//   診断施肥量　算出
/////////////////////////////
//NISHI0511 GetSehiValue
function GetSehiValue(UketukeQuery : TADOQuery ): TRecStandard;
var
  SakumokuCD,SakumotuCD,SakugataCD : string ;
  TableN,TitaiCD,DojoCD : string ;
  IsEngei,IsKusa : Boolean;  {園芸作物}
  NKaisu : integer ;  {窒素分施回数：通常合計の施肥回数を成分共通で適用}
  Nkoumoku : String;
  Pkoumoku : String;
  Kkoumoku : String;
  Ncount : String;
  Pcount : String;
  Kcount : String;
  Kcount2 : String;

  Nnn : double;
  Nc1 : double;
  Nc2 : double;
  Nc3 : double;
  Nc4 : double;
//  Nc5 : double;
  dallP,dallMg,dallpH,dallkei : double;
  dP,dMg,dpH,dkei : double;
  dval : double;
  stmp2, dcode : string;
  i,dkakaku : integer;
  cec : double;
  Dositu : integer;
  coeP : double;
  P2 : double;
  stmp : string;
begin
  result.Motohi.N := 0;
  result.Motohi.P := 0;
  result.Motohi.K := 0;
  result.Motohi.M := 0;
  result.Sehi1.N := 0;
  result.Sehi1.P := 0;
  result.Sehi1.K := 0;
  result.Sehi1.M := 0;
  result.Sehi2.N := 0;
  result.Sehi2.P := 0;
  result.Sehi2.K := 0;
  result.Sehi2.M := 0;
  result.Sum.N := 0;
  result.Sum.P := 0;
  result.Sum.K := 0;
  result.Sum.M := 0;
  result.Kaisu := 0;
  SakumokuCD := UketukeQuery.FieldByName('作目コード').asString;
  SakumotuCD := UketukeQuery.FieldByName('作物コード').asString;
  SakugataCD := UketukeQuery.FieldByName('作型コード').asString;
  IsEngei := (SakumokuCD = '3') or (SakumokuCD = '4') or (SakumokuCD = '5') ;{園芸作物か}
  IsKusa  := (SakumokuCD = '6') or (SakumokuCD = '7') ;{牧草}


  //土壌改良資材量  H160705
    // Pramにサンプル番号を入力
//    stmp2 := UketukeQuery.FieldByName('サンプル番号').asString;
//    PrintModule1.QuerySindan.ParamByName('サンプル番号').asString := UketukeQuery.FieldByName('サンプル番号').asString;
//    PrintModule1.QuerySindan.Open;

   PrintModule1.ADOQuerySindan.close;
  PrintModule1.ADOQuerySindan.SQL.Clear;
  stmp := 'select * from T_SINDAN where サンプル番号 = "'+ UketukeQuery.FieldByName('サンプル番号').asString + '"';
  PrintModule1.ADOQuerySindan.SQL.add(stmp);
  PrintModule1.ADOQuerySindan.Open;





    with PrintModule1.ADOQuerySindan do begin
      for i := 1 to 4 do begin
         stmp2 := '土改材コード'+InttoStr(i);
         dcode := FieldByName(stmp2).asString;
//         stmp := ' '+GetDokaizaiName(dcode);
//         RectAndText(lmRECT,tlCENTER,taLeft,XX1+8,YY3+YY2,65,5,11,stmp,ftNORMAL);
         stmp2 := '土改材量'+InttoStr(i);
         dval := FieldByName(stmp2).asFloat;
         if dval > 0 then begin
            DokaiVolume( dcode, dval, dP , dMg, dpH, dkei,dkakaku);
//            dallP := dallP + ((dval / 100.0) * dp);
            dallP := dallP + dp;
            dallMg := dallMg + dMg;
            dallpH := dallpH + dpH;
            dallkei := dallkei + dkei;
         end;
      end;
    end;

    Dositu := (StrtoIntDef(UketukeQuery.FieldByName('土壌コード').asString,0)div 10)*10 + StrtoIntdef(UketukeQuery.FieldByName('土性コード').asString,0);
    coeP := Rinsankeisuu( Dositu, UketukeQuery.FieldByName('リン吸').asFloat);



//土壌改良資材を考慮
//    P2 := UketukeQuery.FieldByName('トルオーグP').asfloat + (dallP / coeP);
//考慮しない
    P2 := UketukeQuery.FieldByName('トルオーグP').asfloat;




  with DataModule1.QueryRead do begin
    Close;
    SQL.Text := '';
    if SakumokuCD = '1' then begin
        TableN := 'M_SEHI_S';
        TitaiCD := UketukeQuery.FieldByName('水稲地帯区分').asString;
        DojoCD := UketukeQuery.FieldByName('水稲土壌コード').asString;
        if (SakumotuCD = '01') or(SakumotuCD = '03')then //本田 {食味米=03}
          SQL.Text := 'Select 全層施肥 as N,燐N as P,カリN as K,苦土 as Mg from '+TableN+
                      ' Where 地帯区分='''+TitaiCD+''' and 土壌区分='''+DojoCD + ''''
        else if SakumotuCD = '02' then  //水稲側条
//H171114          SQL.Text := 'Select 全側全層分+全側側条分 as N,燐N as P,カリN as K,苦土 as Mg from '+TableN+
//                      ' Where 地帯区分='''+TitaiCD+''' and 土壌区分='''+DojoCD + ''''
          SQL.Text := 'Select 全側全層分 as N,全側側条分 as N2,燐N as P,カリN as K,苦土 as Mg from '+TableN+
                      ' Where 地帯区分='''+TitaiCD+''' and 土壌区分='''+DojoCD + ''''
        else if SakumotuCD = '04' then //水稲床土
          SQL.Text := 'Select 全層施肥 as N,燐N as P,カリN as K,苦土 as Mg from '+TableN+
                      ' Where 地帯区分='''+TitaiCD+''' and 土壌区分='''+DojoCD + ''''
        else  //以外は全て０
          ;

 //水稲の基準 NISHI0525


    end else
    if SakumokuCD = '2' then begin
        TableN := 'M_SEHI_H';
        TitaiCD := UketukeQuery.FieldByName('標準地帯区分').asString;
        DojoCD := UketukeQuery.FieldByName('畑牧土壌コード').asString;
        SQL.Text := 'Select * from '+TableN+' Where 作目コード='''+SakumokuCD+''' and 作物コード='''+SakumotuCD+
                     ''' and  地帯区分='''+TitaiCD+''' and 土壌区分='''+DojoCD + '''';

           result.Nkijyun1 := 0;
           result.Nkijyun2 := 0;


    end else
    if IsEngei then begin
        TableN := 'M_SEHI_E';
        TitaiCD := '';
        DojoCD := UketukeQuery.FieldByName('畑牧土壌コード').asString;
        SQL.Text := 'Select * from '+TableN+' Where 作目コード='''+SakumokuCD+''' and 作物コード='''+SakumotuCD+
                    ''' and  作型コード='''+SakugataCD+''' and 土壌区分='''+DojoCD + '''';
    end else
    if IsKusa then begin
        TableN := 'M_SEHI_B';
        TitaiCD := UketukeQuery.FieldByName('標準地帯区分').asString;
        DojoCD := UketukeQuery.FieldByName('畑牧土壌コード').asString;
        SQL.Text := 'Select * from '+TableN+' Where 作目コード='''+SakumokuCD+''' and 作物コード='''+SakumotuCD+
                    ''' and  作型コード='''+SakugataCD+''' and  地帯区分='''+TitaiCD+''' and 土壌区分='''+DojoCD + '''';
    end;
    //クエリー無い物は０値
    if SQL.Text <> '' then begin
      Open;
      if RecordCount = 0 then begin
        Close;
        exit; //０値
      end;
      //園芸の場合分施値を取得する。
      if IsEngei then begin
        //窒素の種類
        Nkoumoku := '基肥N2';
        Ncount := '2';
        if FieldByName('水準分類N').asInteger = 1 then begin // 硝酸態窒素
           Nnn := UketukeQuery.FieldByName('硝酸態N').asfloat;
           Nc1 := FieldByName('基準N11').asFloat ;
           Nc2 := FieldByName('基準N12').asFloat ;
           Nc3 := FieldByName('基準N13').asFloat ;      //H161130  N12になっていた
           Nc4 := FieldByName('基準N14').asFloat ;

           result.Nkijyun1 := Nc1;
           result.Nkijyun2 := Nc2;


           Ncount := '5';
           if Nnn <= Nc1 then begin
              Ncount := '1';
           end
           else if Nnn < Nc2 then begin
              Ncount := '2';
           end
           else if Nnn < Nc3 then begin
              Ncount := '3';
           end
           else if Nnn < Nc4 then begin
              Ncount := '4';
           end;
           Nkoumoku := '基肥N'+Ncount;
        end
        else if FieldByName('水準分類N').asInteger = 2 then begin // 可給態窒素
//           Nnn := UketukeQuery.FieldByName('可給態N').asfloat;
           Nnn := UketukeQuery.FieldByName('熱抽出N').asfloat;
           //熱抽出性窒素　固定
           Nc1 := FieldByName('基準N21').asFloat ;
           Nc2 := FieldByName('基準N22').asFloat ;

           result.Nkijyun1 := Nc1;
           result.Nkijyun2 := Nc2;



           Ncount := '3';
           if Nnn < Nc1 then begin
              Ncount := '1';
           end
           else if Nnn < Nc2 then begin
              Ncount := '2';
           end;
           Nkoumoku := '基肥N'+Ncount;
        end;

        //リン酸の種類
        Pkoumoku := '基肥P3';
        Pcount := '3';
        if FieldByName('水準分類P').asInteger = 1 then begin // 分類あり


           //診断後の値

           Nnn := P2;
           //UketukeQuery.FieldByName('トルオーグP').asfloat;




           Nc1 := FieldByName('基準P11').asFloat ;
           Nc2 := FieldByName('基準P12').asFloat ;
           Nc3 := FieldByName('基準P13').asFloat ;
           Nc4 := FieldByName('基準P14').asFloat ;

           if Nnn < Nc1 then begin
              Pcount := '1';
           end
           else if Nnn < Nc2 then begin
              Pcount := '2';
           end
           else if Nnn < Nc3 then begin
              Pcount := '3';
           end
           else if Nnn < Nc4 then begin
              Pcount := '4';
           end
           else begin
              Pcount := '5';
           end;
           Pkoumoku := '基肥P'+Pcount;
        end ;

        //加里の種類
        Kkoumoku := '基肥K3';
        Kcount := '3';

        if FieldByName('水準分類K').asInteger > 0 then begin // 硝酸態窒素

            cec := UketukeQuery.FieldByName('CEC').asfloat;

            Kcount2 := '1';
            if FieldByName('水準分類K').asInteger = 3 then begin

              if cec < 12.0 then begin
                Kcount2 := '1';
              end
              else if cec < 25.0 then begin
                Kcount2 := '2';
              end
              else begin
                Kcount2 := '3';
              end;
            end;

            Nnn := UketukeQuery.FieldByName('K2O').asfloat;
            Kkoumoku := '基準K'+Kcount2+'1';   //基準K11
            Nc1 := FieldByName(Kkoumoku).asFloat ;
            Kkoumoku := '基準K'+Kcount2+'2';
            Nc2 := FieldByName(Kkoumoku).asFloat ;
            Kkoumoku := '基準K'+Kcount2+'3';
            Nc3 := FieldByName(Kkoumoku).asFloat ;
            Kkoumoku := '基準K'+Kcount2+'4';
            Nc4 := FieldByName(Kkoumoku).asFloat ;

            Kcount := '3';
           if Nnn < Nc1 then begin
              Kcount := '1';
           end
           else if Nnn < Nc2 then begin
              Kcount := '2';
           end
           else if Nnn < Nc3 then begin
              Kcount := '3';
           end
           else if Nnn < Nc4 then begin
              Kcount := '4';
           end
           else begin
              Kcount := '5';    //H161210  以上
           end;
           Kkoumoku := '基肥K'+Kcount;
        end;


        result.Motohi.N := FieldByName(Nkoumoku).asFloat ;    {成分により標準値参照が違う}
        result.Motohi.P := FieldByName(Pkoumoku).asFloat ;
        result.Motohi.K := FieldByName(Kkoumoku).asFloat ;
        result.Motohi.M := FieldByName('Mg').asFloat ;
        //追肥は分施１に値を代入するが、合計の算出対象には分施１はならない
        //H171220 診断施肥

        if FieldByName('追分分類N').asInteger <> 0 then begin //追肥は基肥と同じ
          if abs(FieldByName('追分分類N').asInteger) < 10 then begin
             Nkoumoku := '分施1N'+Ncount;//inttostr(abs(FieldByName('追分分類N').asInteger)); //Ncount;
             result.Sehi1.N := FieldByName(Nkoumoku).asFloat;
          end
          else begin
             Nkoumoku := '分施1N'+Ncount;
             result.Sehi1.N := FieldByName(Nkoumoku).asFloat;
             Nkoumoku := '分施2N'+Ncount;//2'; //Ncount;
             result.Sehi2.N := FieldByName(Nkoumoku).asFloat;
          end;
        end;
        if FieldByName('追分分類P').asInteger <> 0 then begin //追肥は基肥と同じ
          Pkoumoku := '分施1P'+Pcount; //inttostr(abs(FieldByName('追分分類P').asInteger));//Pcount;
          result.Sehi1.P := FieldByName(Pkoumoku).asFloat;
        end;
        if FieldByName('追分分類K').asInteger <> 0 then begin //追肥は基肥と同じ
          Kkoumoku := '分施1K'+Kcount; //inttostr(abs(FieldByName('追分分類K').asInteger));//Kcount;
          result.Sehi1.K := FieldByName(Kkoumoku).asFloat;
        end;
{
        if FieldByName('追分分類N').asInteger >= 2 then begin//分施2回以上
          Nkoumoku := '分施2N'+Ncount;
          result.Sehi2.N := FieldByName(Nkoumoku).asFloat;
        end;
        if FieldByName('追分分類P').asInteger >= 2 then begin//分施2回以上
          Pkoumoku := '分施2P'+Pcount;
          result.Sehi2.P := FieldByName(Pkoumoku).asFloat;
        end;
        if FieldByName('追分分類K').asInteger >= 2 then begin //分施2回以上
          Kkoumoku := '分施2K'+Kcount;
          result.Sehi2.K := FieldByName(Kkoumoku).asFloat;
        end;
}
        {分施値は窒素の施肥回数}
//        if FieldByName('追分分類N').asInteger >= 1 then //分施1回以上
        result.Kaisu := FieldByName('追分分類N').asInteger;
        {合計算出:マスタの合計項目でなく、窒素の分施回数から算出する
        理由：マスタメンテを経由しないとき合計値が算出されないため}
(*
        result.Sum.N := FieldByName('N').asFloat ;
        result.Sum.P := FieldByName('P').asFloat ;
        result.Sum.K := FieldByName('K').asFloat ;
*)
//        NKaisu :=  FieldByName('追分分類N').asInteger ;
        result.Sum.N := result.Motohi.N ;
//        if NKaisu >= 1 then
          result.Sum.N := result.Sum.N + result.Sehi1.N ;
          if result.Kaisu = 10 then begin
            result.Sum.N := result.Sum.N + result.Sehi1.N + result.Sehi2.N;
          end;
//        if NKaisu >= 2 then
//          result.Sum.N := result.Sum.N + result.Sehi2.N*(NKaisu-1) ;
        result.Sum.P := result.Motohi.P ;
//        if NKaisu >= 1 then
          result.Sum.P := result.Sum.P + result.Sehi1.P ;
//        if NKaisu >= 2 then
//          result.Sum.P := result.Sum.P + result.Sehi2.P*(NKaisu-1) ;
        result.Sum.K := result.Motohi.K ;
//        if NKaisu >= 1 then
          result.Sum.K := result.Sum.K + result.Sehi1.K ;
//        if NKaisu >= 2 then
//          result.Sum.K := result.Sum.K + result.Sehi2.K*(NKaisu-1) ;

        result.Sum.M := FieldByName('Mg').asFloat ;
      end
      //畑作 JAあばしり版　
      else if SakumokuCD = '2' then begin

        result.Motohi.N  := FieldByName('N').asFloat ;
        result.Motohi.P := FieldByName('P').asFloat ;
        result.Motohi.K := FieldByName('K').asFloat ;
        result.Motohi.M := FieldByName('Mg').asFloat ;
        result.Sehi1.N  := FieldByName('N2').asFloat ;
        result.Sehi1.P := FieldByName('P2').asFloat ;
        result.Sehi1.K := FieldByName('K2').asFloat ;
        result.Sehi1.M := FieldByName('Mg2').asFloat ;
        result.Sum.N := FieldByName('N').asFloat + FieldByName('N2').asFloat;
        result.Sum.P := FieldByName('P').asFloat + FieldByName('P2').asFloat;
        result.Sum.K := FieldByName('K').asFloat + FieldByName('K2').asFloat;
        result.Sum.M := FieldByName('Mg').asFloat + FieldByName('Mg2').asFloat;
        //一度に施用できるＭＡＸ
        result.NMax := FieldByName('NMax').asFloat;
        //あばしり　H190528 秋まき小麦のみ
        if (SakumotuCD = '01' ) then
            result.Kaisu := -1
        else
            result.Kaisu := 0;

      end
      else begin   //園芸以外は基肥のみ
        if IsKusa then begin   //牧草は施肥入力あるが、マスタにはない
        end;
        result.Motohi.N  := FieldByName('N').asFloat ;
        result.Motohi.P := FieldByName('P').asFloat ;
        result.Motohi.K := FieldByName('K').asFloat ;
        result.Motohi.M := FieldByName('Mg').asFloat ;
        result.Sum.N := FieldByName('N').asFloat ;
        result.Sum.P := FieldByName('P').asFloat ;
        result.Sum.K := FieldByName('K').asFloat ;
        result.Sum.M := FieldByName('Mg').asFloat ;
      end;
    end;
    Close;
  end; {bottom with QueryRead}
end;
{
  コメントマスタ取得：
  IN:作目、作物、作型コード
}
function GetComment( CD1,CD2,CD3 : string ) : string ;
begin
  result := '';
  with DataModule1.QueryRead do begin
    Close;
    SQL.Text := 'Select 事項 from M_COMENT where 作目コード='''+CD1+''' and 作物コード='''+CD2+''' and 作型コード='''+CD3+'''';
    Open;
    if RecordCount > 0 then
      result :=  FieldByName('事項').asString;
    Close;
  end;
end;
{
  診断テーブル指定レコード削除（フラグ）セット
}
procedure    DelFlagSindanTable(aSmpNO : string );
begin


  with DataModule1.QueryWrite do begin
    SQL.Text := 'Update T_SINDAN set 削除フラグ=True,編集日=:編集日 where サンプル番号='''+aSmpNO+'''';
//    ParamByName('編集日').asDateTime := now;
    Parameters.ParamByName('編集日').Value := now;
    ExecSQL ;
  end;


  end;
{
  診断テーブルレコード作成
}
procedure    InsertSindanTable(aSmpNO : string );
begin
  with DataModule1.QueryWrite do begin
    SQL.Text := 'Insert into T_SINDAN (サンプル番号,編集日,SIM計算済,削除フラグ) '+
                'values ('''+aSmpNO+''',:編集日,False,False)';
    Parameters.ParamByName('編集日').Value := now;
    ExecSQL ;
  end;
{
  with DataModule1.QueryWrite do begin
    SQL.Text := 'Insert into T_SINDAN (サンプル番号,編集日,SIM計算済,削除フラグ) '+
                'values ('''+aSmpNO+''',:編集日,False,False)';
    ParamByName('編集日').asDateTime := now;
    ExecSQL ;
  end;
 }
 end;
{
  編集可能サンプル番号か？
}
function IsEditRec(aNO : string):Boolean;
var
  iNum : integer;
begin
  try
    iNum := StrToIntDef(aNO, 0);// iNum := StrtoInt( aNO );
  except    //新規のキャンセルの時など、DataSetがない場合
    iNum := 0 ;
  end;                                                       //且P.D モードでないこと
  result := (EntryStart <= iNum )and( iNum <= EntryStop) and not P_MODE ;
end;
{
  水稲　窒素施肥対応
  N 窒素値
  mode 0 全層
  mode 1 側条
}
function Bai_S_N( N:double; dcode:string; titai:string;mode : Integer):double;
var
sb, eb:double;
ans : double;
i : integer;
fc: integer;
stmp : string;
dc : string;
begin

  with DataModule1.ADOTableRead do begin
    Close;
    TableName := 'M_BAI_S_N';
    Open;

    if RecordCount <= 0 then begin
      result :=  0.0;
      exit;
    end;


    //土壌判定
    //水稲土壌コード　低地土　腐植含む以外
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

    //レコードの移動
	Locate('地帯区分;土壌コード',VarArrayOf([titai,dc]), []);


    sb := 0.0;
    if mode = 1 then begin  //側条
      ans := FieldByName('側条施肥量5').AsFloat;
      for i := 1 to 4 do begin
        stmp := '基準'+InttoStr(i);
        eb := FieldByName(stmp).AsFloat;
        if (sb <= N ) and ( eb > N ) then begin
            stmp := '側条施肥量'+InttoStr(i);
            ans := FieldByName(stmp).AsFloat;
        end;
        sb := eb;
      end;
    end
    else begin  //全層
      ans := FieldByName('施肥量5').AsFloat;
      for i := 1 to 4 do begin
        stmp := '基準'+InttoStr(i);
        eb := FieldByName(stmp).AsFloat;
        if (sb <= N ) and ( eb > N ) then begin
            stmp := '施肥量'+InttoStr(i);
            ans := FieldByName(stmp).AsFloat;
        end;
        sb := eb;
      end;
    end;
    Close;
  end;
  result := ans;

end;
{
  水稲　リン酸施肥対応
  P リン酸値
  dcode 土壌コード
  code 腐植コード
}
function Bai_S_P( P:double; dcode:string; fcode:string):double;
var
sb, eb:double;
ans : double;
i : integer;
fc: integer;
stmp : string;
begin

  with DataModule1.ADOTableRead do begin
    Close;
    TableName := 'M_BAI_S_P';
    Open;

    if RecordCount <= 0 then begin
      result :=  0.0;
      exit;
    end;


    //土壌判定
    //水稲土壌コード　低地土　腐植含む以外
    fc := 1;
    if (dcode = '10') and  (fcode <> '1')  then begin
      fc := 1;
    end
    else if (dcode = '15') or (dcode = '20') or (dcode = '40') then begin
      fc := 2;
    end
    else if (dcode = '10') or (dcode = '30') then begin
      fc := 3;
    end;

    sb := 0.0;
    ans := 0.0;
    for i := 1 to 5 do begin
        stmp := '基準値'+InttoStr(i);
        eb := FieldByName(stmp).AsFloat;
        if (sb <= P ) and ( eb > P ) then begin
            stmp := '土壌'+InttoStr(i)+InttoStr(fc)+'施肥量';
            ans := FieldByName(stmp).AsFloat;
        end;
        sb := eb;
    end;
    Close;
  end;
  result := ans;

end;
{
  水稲　カリ施肥対応
  K 加里値
}
function Bai_S_K( K:double):double;
var
sb, eb:double;
ans : double;
i : integer;
stmp : string;
begin

  with DataModule1.ADOTableRead do begin
    Close;
    TableName := 'M_BAI_S_K';
    Open;

    if RecordCount <= 0 then begin
      result :=  0.0;
      exit;
    end;

    sb := 0.0;
    ans := 0.0;
    for i := 1 to 4 do begin
        stmp := '基準値'+InttoStr(i);
        eb := FieldByName(stmp).AsFloat;
        if (sb <= K ) and ( eb > K ) then begin
            stmp := '施肥量'+InttoStr(i);
            ans := FieldByName(stmp).AsFloat;
        end;
        sb := eb;
    end;
    Close;
  end;
  result := ans;

end;
{
  水稲　苦土施肥対応
  M 苦土値
}
function Bai_S_M( M:double):double;
var
sb, eb:double;
ans : double;
i : integer;
stmp : string;
begin

  with DataModule1.ADOTableRead do begin
    Close;
    TableName := 'M_BAI_S_M';
    Open;

    if RecordCount <= 0 then begin
      result :=  0.0;
      exit;
    end;

    sb := 0.0;
    ans := 0.0;
    for i := 1 to 2 do begin
        stmp := '基準値'+InttoStr(i);
        eb := FieldByName(stmp).AsFloat;
        if (sb <= M ) and ( eb > M ) then begin
            stmp := '施肥量'+InttoStr(i);
            ans := FieldByName(stmp).AsFloat;
        end;
        sb := eb;
    end;
    Close;
  end;
  result := ans;

end;

//リン酸吸収係数
// Dosei 土性 Rin りん吸
function Rinsankeisuu( Dositu : integer; Rin : double) : double;
var
coeP : double;
PKeisu : integer;
begin
  //リン酸吸倍率 表２ リン酸吸収係数×土壌＋土性 のリン酸倍率表
  coeP := 0;
//  with QueryUketuke do begin
//    Dositu := (StrtoIntDef(FieldByName('土壌コード').asString,0)div 10)*10 + StrtoIntdef(FieldByName('土性コード').asString,0);
//    if FieldByName('リン吸').isnull then PKeisu := 0
    if (Rin > 0 )and( Rin <= 700 ) then PKeisu := 1
    else if (Rin > 700 )and( Rin <= 1500 ) then PKeisu := 2
    else if (Rin > 1500 )and( Rin <= 2000 ) then PKeisu := 3
    else PKeisu := 1;
//    else PKeisu := 0;
//  end;
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


  result := coeP;

end;
{
   珪カル必要量を算出（土壌から、ケイ酸値から）
}
function GetKeiCal( aCode : string ) : double ; overload ;    //土壌から
begin
//  if aCode = '10' then result := 110
  if aCode = '11' then result := 105 //110
  else if aCode = '12' then result := 135 //140
  else if aCode = '13' then result := 165 //170
  else if aCode[1] = '1' then result := 135 //140  //追加 H150826
  else if aCode[1] = '2' then result := 165 //170
  else if aCode[1] = '3' then result := 135 //140
  else if aCode[1] = '4' then result := 135 //140
  else result := 0;
end;

function GetKeiCal( aKeisan : double; dcode : string ) : double ; overload ;   //ケイ酸値から
var
btmp : double;
btmp2 : double;
begin

  if aKeisan <= 0.0 then begin
     result := 0;
  end
  else if (dcode = '16') or (dcode = '20') or (dcode = '21') then begin //グライ土、泥炭土は、高い値
     if aKeisan < 10.0 then result := 240
     else if aKeisan < 13.0 then result := 180
     else if aKeisan < 16.0 then result := 120 //110
     else result := 60;  //90 ;
  end
  else begin
     if aKeisan < 10.0 then begin  //result := 210
        btmp := (240 - 180 ) / ( 10 - 0 );  //6
        btmp2 := 180 + (10 - aKeisan) * btmp;
        result := btmp2;
     end
     else if aKeisan < 13.0 then begin
        btmp := (180 - 120 ) / ( 13 - 10 ); //20
        btmp2 := 120 + (13 - aKeisan) * btmp;
        result := btmp2;
//     result := 150
     end
     else if aKeisan < 16.0 then begin
        btmp := (120 - 60 ) / ( 16 - 13 );  //20
        btmp2 := 60 + (16 - aKeisan) * btmp;
        result := btmp2;
     //result := 90 //110
     end
     else begin
       result := 0;  //90 ;
     end;
  end;
end;


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

function GetConnection() : String ;  //データベース接続
var
stmp : String;
sfile : String;
begin






  stmp := '';
  sfile := '';

// localhost
{
 stmp := stmp + 'Provider=MSDASQL;';
 stmp := stmp + 'Persist Security Info=False;';
 stmp := stmp + 'Extended Properties="Driver=MySQL ODBC 5.1 Driver;';
 stmp := stmp + 'SERVER=' + FTPServer + ';';
 stmp := stmp + 'UID='+FTPUsrName + ';';
 stmp := stmp + 'PASSWORD='+FTPPassword+';';
 stmp := stmp + 'DATABASE=nkpsoil' + FTPJACD+';';
 stmp := stmp + 'PORT=3306"';
}

{ //192.168.1.10
 stmp := stmp + 'Provider=MSDASQL;';
 stmp := stmp + 'Persist Security Info=False;';
 stmp := stmp + 'Extended Properties="Driver=MySQL ODBC 5.1 Driver;';
 stmp := stmp + 'SERVER=192.168.1.10;';
 stmp := stmp + 'UID=hamc;';
 stmp := stmp + 'PASSWORD=nishi;';
 stmp := stmp + 'DATABASE=nkpsoil;';
 stmp := stmp + 'PORT=3306"';
}



 //Ａｃｃｅｓｓ
DataPath := FTPServer + '\' + FTPTiku + '\' + FTPNen + '\' ;


sfile := DataPath + 'nkpsoil.mdb;';
// stmp := FTPServer + '\'+ FTPTiku + '\'+ FTPNen + '\';

// DataPath := stmp;

// sfile := stmp + 'nkpsoil.mdb;';
stmp := 'Provider=Microsoft.Jet.OLEDB.4.0;';
stmp := stmp + 'Data Source=' + sfile;
stmp := stmp + 'Persist Security Info=False';




  result := stmp;
end;


end.


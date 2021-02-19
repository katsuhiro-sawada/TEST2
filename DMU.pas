unit DMU;

{
  �f�[�^�Z�b�g���ʃ��W���[��
  �V�X�e���O���[�o���ϐ�
  �V�X�e�������֘A
  �V�X�e�����ʊ֐��Q
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
    { Private �錾 }
  public
    { Public �錾 }
  end;

{
  �f�f�p�{��݌v���� �F �V�~�����[�V������ʂƎ{��݌v����ɗp����
                        ��ʃ��\�[�X�Ȃǂ͗��p���Ȃ�
}
type THiryoType = (htYuuki,htHiryo1,htHiryo2,htHiryo3);
type TRecHiryo = record
    CD : string ;   //�엿�R�[�h
    Name  : string ; // �엿��
    N : double ;  //������(%)
    P : double ;
    K : double ;
    Ca: double ;
    M: double ;
    Kei: double ;
    Fe: double ;

    V : double ;   //�{�p��(kg or t)
    You : double;    //�e��
    Tanka : Integer; //�P��
    YuukiSitu : Bool;
    Tuihi : Bool;
  end;
type
  TSehiHiryo = class(TObject)
  private
    { Private �錾 }
    aryHiryo : array[Ord(Low(THiryoType))..Ord(High(THiryoType)),1..5] of TRecHiryo ;
  public
    { Public �錾 }
    constructor Create; virtual;
    destructor Destroy; override;
    {�엿���̐ݒ�}
    function SetHiryo(aType: THiryoType; aCode : string  ;aValue : double; IsKazan : Boolean):integer;
    {�엿���̎擾}
    function GetHiryo(aType: THiryoType; aNum: integer): TRecHiryo;
    {�{�p�ʂ̐ݒ�}
    procedure SetValue( aType : THiryoType; aNum:integer ; aValue : double);
    procedure DelHiryo(aType: THiryoType; aNum: integer);   {�엿�̍폜}
    procedure Clear;  overload; //�S�N���A
    procedure Clear(aCnt1,aCnt2:integer); overload;
    function GetQuantity(aType: THiryoType):TRecHiryo;      {�����̍��v}
    {�{�e�ʂ̎����Z�o�F���̎w��ςݐ����̍��v�̎c��Ōv�Z}
    function CalcValue(aType: THiryoType; aNum: integer; aSetVal: double;aCalIng: integer): double;
    {�L�@���܂܂Ȃ��������v�F�{��񐔎w��}
    function GetTotal(Kaisu: integer): TRecHiryo;    {���{�엿�P�{�엿�Q�i���{�񐔁j}
  end;

const
  VERFILE = 'version.txt';
  MSGFILE = 'message.txt';
	SYSFILE = 'system.ini';
	SYNCFILE = 'sync.ini';
  BYTEOFSEC = 4000 ;  //��b�Ԃ̓]���o�C�g������

//�A���j�E�X�ʕϊ��e�[�u��
const cstAlenius : array[1..3,1..7] of integer = (
  (8,17,25,34,42,83,99),
  (13,25,34,42,51,83,99),
  (20,39,51,62,73,83,99)
);



var
  DataModule1: TDataModule1;

  Version : string ;  {�v���O�����̃o�[�W�����i�A�v�����j ���W���[���}�C�i�[}
  SystemIni: TIniFile;
  BunkouIni: TIniFile;
  BunkouIni2: TIniFile;
  BunkouIni3: TIniFile;
  AppPath : string ;      //�v���O�����t�H���_�[
  //�f�[�^�t�H���_�֘A

  EntryCenter,EntryCenterName : string ;
  EntryCenterNo : string ; //�Z���^�[�R�[�h
  EntryYear : string ;
  ThisYear : string ;	//�ŐV�o�^�\�N�x
  IsEntryYear : Boolean ;
  SQLCondition : string ;	//����͈�
  SQLCondition2 : string ;	//����͈�

  EntrySTART,EntrySTOP : integer ;
//  OrgPath : string ;	//�e�[�u���I���W�i��path
  DataPath : string ; //���G���g���[�p�X
  TempPath : string ;  //temp path
  IsMaster,IsMasterMore : Boolean ;//�}�X�^�Ǘ�����
  IsBackUp : Boolean ;  //�I���������o�b�N�A�b�v
  //�l�b�g���[�N�֘A
  IsUseNet,FTPPSSV : Boolean ;
  FTPServer,FTPAccount,FTPPassword,FTPHome,FTPUsrName : string ;
  FTPTiku,FTPNen : string;
  FTPBPS : integer ;
  //
  SuitouCode,BokusouCode : string ;
  Debug : Boolean ;

  JMode : String;  //kihon : ��{   Douou : �����o�[�W����
  JMode_DokaiSel : Integer;   // ���A�p�@1 pH���� ����ȊO pH���
  JBerCode : Boolean;  //��t�̃o�[�R�[�h����
  JBunseki : Boolean;  //���͂̓o�^
  JUketuke : Boolean;  //��t�̓o�^
  JMaster : Boolean;  //�}�X�^�̕ύX
  JFukyuu : Boolean;  //���y�Z���^�[���[�h

  JMode_Saku1 : Boolean ;  //�y��f�f�[�̍�^�A�O��
  JMode_Saku2 : Boolean ;  //�{��݌v�[�̍�^�A�O��

  JMode_Dosei1 : Boolean ;  //�y��f�f�[�̓y��
  JMode_Dosei2 : Boolean ;  //�{��݌v�[�̓y��
  JMode_Fusyoku1 : Boolean ;  //�y��f�f�[�̕��A
  JMode_Fusyoku2 : Boolean ;  //�{��݌v�[�̕��A

  JMode_Memori : Boolean ;  //���[�_�`���[�g�̃�����
  JMode_Brush : Boolean ;  //�Ԋ|���@�e�`�w�p�@�y��f�f

  JMode_Titen1 : Integer;   //�y��f�f�[�̕ޏ�ԍ��\�����@99�́A�ޏꖼ
  JMode_Titen2 : Integer;   //�{��݌v�[�́[�[�[

  JMode_Hantei : Integer;  //����̋��e�͈́@�T�O��

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


  JMode_Eko : Boolean; //�G�R�E�����O�@�R�����g�o�̓t���O
  JMode_Ikubyou : Boolean; //��c�@�Ȉ�

  JMode_Siryou : Integer;
  JMode_Taihi : Integer;
//  JMode_TaihiEC : Integer;

  JMode_CN : Boolean;  //�f�f�[�Ł@CN���\�����邵�Ȃ� H181206
  JMode_CNketa : Integer;

  JMode_Yobi1 : Boolean;
  JMode_Yobi2 : Boolean;
  JMode_Yobi3 : Boolean;

  JMode_Yobi1name : String;   //�\��
  JMode_Yobi2name : String;
  JMode_Yobi3name : String;

  JMode_Yobi1keta : Integer;
  JMode_Yobi2keta : Integer;
  JMode_Yobi3keta : Integer;

  //�͔쌅
  TaKeta:Array[1..11] of Integer;
  //����
//  SiKeta:Array[1..27] of Integer;



  BackColor,FontColor : TColor ;   //��ʋ��ʔw�i�F,���b�Z�[�W�t�H���g�F

  // P.D �p�����[�^
  P_CENTER,P_YEAR,P_SMPNO,P_TYPE  : string ;
  P_MODE : Boolean ;  //���[�h
{
  �{��W���}�X�^�̃������W�J�p
}
type TRecYouryo = record
    N : double ;
    P : double ;
    K : double ;
    M : double ;
  end;
type TRecStandard = record  //�앨�ʎ{��W���l
  Motohi : TRecYouryo ; //���
  Sehi1 : TRecYouryo ;  //���|�̂�
  Sehi2 : TRecYouryo ;  //���|�̂�
  Kaisu : integer ;     //���{��
  Sum : TRecYouryo ;    //���v�i���|�j
  Suijyun : TRecYouryo;  //��������N,P,K
  Nkijyun1 : Double;
  NKijyun2 : Double;
  NMax : Double;   //���f�P��Ɏ{�p�ł���MAX
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

//��l�̂b�d�b����A,B,C�����߂�B�@���n�̏ꍇ�́A�ΎR���y�̎�ނ���
function Get_CEC_ABC(UketukeQuery : TADOQuery): string;
function Get_CEC_ABC2(UketukeQuery : TADOQuery): string;  //�y��code
//��l�e�[�u���̃��R�[�h�I���@QueryKijun
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

function GetKeiCal( aCode : string ) : double ; overload ;    //�y�납��
function GetKeiCal( aKeisan : double; dcode : string ) : double ; overload ;   //�P�C�_�l����
{��yme/100mg}
function KudoMe( aValue : double ) : double;
{�ΊDme/100mg}
function SekkaiMe( aValue : double ) : double;
{����me/100mg}
function KariMe( aValue : double ) : double;
{�����_me/100mg}
function RinsanMe( aValue : double ) : double;

function GetConnection() : String;   //�f�[�^�x�[�X�ڑ�



implementation

{$R *.DFM}
uses
	FileCtrl,Nb30, MCenterU, AobutU, PrnCanvasU, MainU;
{
  �V�X�e��������������
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
//�v���O�����̃o�[�W�������擾
  sVersion := AppGetInfo(Application.exename,3);
  {���W���[���}�C�i�[�܂łɂ���}
  pCnt := 0;   Version := '';
  for acnt := 1 to length(sVersion) do begin
    if sVersion[acnt] = '.' then INC(pCnt);
    if pCnt >= 2 then break;
    Version := Version + sVersion[acnt] ;
  end;

	AppPath := ExtractFilePath(Application.ExeName);
	IsEntryYear := False ;

//���͍��ڂ̏���
    BunkouIni := TIniFile.Create( AppPath + 'Bunkou.ini' );
    BunkouIni2 := TIniFile.Create( AppPath + 'Bunkou2.ini' );
    BunkouIni3 := TIniFile.Create( AppPath + 'Bunkou3.ini' );


  //�V�X�e���ݒ�֘A
  SysFileName := AppPath + SYSFILE;



  //�ݒ�̧�ق̎�荞��
  if FileExists( SysFileName ) then
    SystemIni := TIniFile.Create( SysFileName );

  if SystemIni = nil then begin
  	showmessage('�V�X�e���ݒ�t�@�C����������܂���B');
    PostQuitMessage(0);
    exit;
  end;
  //�l���擾
  Debug := SystemIni.ReadBool('system', 'debug', false );
  BokusouCode := SystemIni.ReadString('data', 'bokusoucode', '' );
  SuitouCode := SystemIni.ReadString('data', 'suitoucode', '' );
  EntryCenter := SystemIni.ReadString('data', 'center', '' );
  EntryYear := SystemIni.ReadString(EntryCenter, 'entryyear', '' );
  ThisYear := SystemIni.ReadString(EntryCenter, 'thisyear', '' );
	//�T���v���ԍ����蓖��    {Version 0.6 #34 }
  EntryStart := SystemIni.ReadInteger(EntryCenter, 'start', 1 );
  EntryStop := SystemIni.ReadInteger(EntryCenter, 'stop', 9999 );

  IsEntryYear := ThisYear = EntryYear ;	//�G���g���[�\�t���O
  IsMaster := SystemIni.ReadInteger('system', 'master', 0 ) >= 1 ;
  IsMasterMore := SystemIni.ReadInteger('system', 'master', 0 ) >= 2 ;

//  OrgPath :=  AppPath + SystemIni.ReadString('data', 'orgpath', 'org' ) +'\';
  TempPath :=  AppPath + SystemIni.ReadString('data', 'tmppath', 'temp') +'\';


	//�T���v���ԍ����蓖��    {Version 0.6 #34 }
//  EntryStart := SystemIni.ReadInteger('system', 'start', 1 );
//  EntryStop := SystemIni.ReadInteger('system', 'stop', 9999 );
  IsBackUp := SystemIni.ReadBool('system', 'BackUp', true );

  //�l�b�g���[�N�֘A
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
     //���[�U��
     MaxChar := 128; // �����Ə������Ă�������������܂���
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

  //�V�X�e������
  //�����`�惂�[�h
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
  //�͔�̌�
  for i := 1 to 11 do begin
     stmp := 'kou' + inttoStr(i);
     TaKeta[i] := SystemIni.ReadInteger('KetaTaihi', stmp, 0 );
  end;
  //�����̌�
  for i := 1 to 27 do begin
     stmp := 'kou' + inttoStr(i);
     SiKeta[i] := SystemIni.ReadInteger('KetaSiryo', stmp, 0 );
  end;
 }




  if not DirectoryExists(TempPath) then
    if not CreateDir(TempPath) then begin
      showmessage(TempPath+'�f�B���N�g���쐬�o���܂���B');
      exit;
    end;

end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
  //�I������
  //DataBase1.Close;
  if SystemIni <> nil then SystemIni.Free ;
end;

//�f�[�^�x�[�X�N���[�Y
procedure CloseDataBase;
begin
  //DataModule1.DataBase1.Close;
end;




//�r�[�v��
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
        SystemExclamation �@//��������
        SystemAsterisk  //����ɂ��߂�
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


//���ޗʂ��琬���ʂ��Z�o
// aValue  ���ޗ�
function DokaiVolume( aCode: string ; aValue : double;
      var pVolP: double; var pVolMg: double; var pVolpH: double; var pVolKei : Double ; Var kakaku : Integer): double;
var aVol :double ;
you, tanka : Double;

begin
//  aVol := 0 ;



  with PrintModule1.ADOQueryDokaizai2 do begin
    SQL.Text := 'Select * from M_DOKAIZAI where �R�[�h='''+aCode+'''';
    Open;

    aVol := aValue;
    //�K�v�ʂ��Z�o�セ�̑��̐����̗ʂ��v�Z
    if    FieldByName('�����_').asFloat = 0 then pVolP := 0
    else  pVolP := aVol * FieldByName('�����_').asFloat / 100 ;
    if    FieldByName('��y').asFloat = 0 then pVolMg := 0
    else  pVolMg := aVol * FieldByName('��y').asFloat / 100 ;
    if    FieldByName('�A���J����').asFloat = 0 then pVolpH := 0
    else  pVolpH := aVol * FieldByName('�A���J����').asFloat / 100 ;
    if    FieldByName('�P�C�_').asFloat = 0 then pVolKei := 0
    else  pVolKei := aVol * FieldByName('�P�C�_').asFloat / 100 ;
    kakaku := 0;
    if aVol > 0 then begin
       you := FieldByName('�e��').asFloat;
       if you > 0 then begin
         tanka := FieldByName('�P��').asInteger;
         kakaku := Round((aVol / you) * tanka);
       end;
    end;

    Close;
  end;
  result := aVol ;
end;

//���ޗʂ��琬�����ƒP�����Z�o
// aValue  ���ޗ�
function DokaiVolume2( aCode: string ; aValue : double;
      var pVolP: double; var pVolMg: double; var pVolpH: double; var pVolKei : Double ; Var kakaku : Integer): double;
var aVol :double ;
you, tanka : Double;

begin
//  aVol := 0 ;
  with PrintModule1.ADOQueryDokaizai2 do begin
    SQL.Text := 'Select * from M_DOKAIZAI where �R�[�h='''+aCode+'''';
    Open;

    aVol := aValue;
    //�K�v�ʂ��Z�o�セ�̑��̐����̗ʂ��v�Z
    pVolP := FieldByName('�����_').asFloat;
    pVolMg := FieldByName('��y').asFloat;
    pVolpH := FieldByName('�A���J����').asFloat;
    pVolKei := FieldByName('�P�C�_').asFloat;
    kakaku := 0;
    if aVol > 0 then begin
       you := FieldByName('�e��').asFloat;
       if you > 0 then begin
         tanka := FieldByName('�P��').asInteger;
         kakaku := Round((aVol / you) * tanka);
       end;
    end;

    Close;
  end;
  result := aVol ;
end;

//�Z���^�[�؂�ւ��F�f�[�^�x�[�X�̐؂�ւ�
function ChangeDataBase(CenterName,Year:string) : Boolean;
var
	path  : string ;
	path2  : string ;
begin
 	result := False;
  //DataModule1.DataBase1.Close;
  //DataModule1.DataBase2.Close;







  //�f�[�^�t�H���_�[






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






  path := 'J:\JA\JA�I�z�[�c�N�ԑ�\data';




  if not DirectoryExists(path) then begin
		showmessage('�f�[�^�x�[�X�t�H���_������܂���');
    exit;
  end;
  with DataModule1 do begin
    //DataBase1.Params.Clear ;
    //DataBase1.Params.Add ( 'path='+path);
    //DataBase2.Params.Clear ;
    //DataBase2.Params.Add ( 'path='+path2);
    try
      //DataBase1.Open ;

      //�e�[�u���I�[�v���Ŋm�F
      DummyTable.Open;
      //�Z���^�[���̂̎擾
      EntryCenterName := '';
      if DummyTable.Locate('�Z���^�[�L��',CenterName,[]) then begin
        EntryCenterName := DummyTable.FieldByName('�Z���^�[����').asString;
        EntryCenterNo := DummyTable.FieldByName('�Z���^�[�R�[�h').asString;
      end
      else begin
        showmessage('�ŏ��Ƀ��j���[�̃}�X�^�����e�Œn����̃Z���^�[�}�X�^�̓o�^���s���Ă��������B');
      end;
      DummyTable.Close;
      result := true ;
    except
      showmessage('�f�[�^�x�[�X�̍\��������܂���B');
    end;
  end;
end;
//HDW ID�̎擾
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
//���͌����̃`�F�b�N�ƃt�H�[�J�X�ړ�
function ChkEditLength( pEdit : TCustomEdit; pLen : integer ) : Boolean;
begin

//	result := length (pEdit.Text ) >= pLen ;
	result := length (pEdit.Text ) <= pLen ;
  if not result then  begin
    showmessage('���͌����I�[�o�[�ł��B');
  	pEdit.SetFocus ;
  end;
end;
{
  �T���v���ԍ��ő�l�擾
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
    {Version 0.6 #24 : �T���v���ԍ����蓖�Ă͊Y���͈͓�}
//    SQL.Text := 'Select �T���v���ԍ� from T_UKETUKE where �T���v���ԍ� >= '''+Format('%0.4d',[EntryStart])+
//    ''' and �T���v���ԍ� <= '''+Format('%0.4d',[EntryStop]) +''' order by �T���v���ԍ� desc';
    {Version 0.6 #46 : �폜���R�[�h���Ώ�}
    //�͈͓��ō폜�t���O�������R�[�h�̈�ԎႢ�ԍ�
    //��L���g�p���Ă͂����Ȃ��B���R�F�Ďg�p�����R�[�h�폜�����̂ł����ݾق����Ɛ^�̍ŏ��ԍ��ɂȂ�Ȃ�
      //������Ώ]���ʂ�
    SQL.Text := 'Select �T���v���ԍ�,�폜�t���O from T_UKETUKE where �T���v���ԍ� >= '''+Format('%0.4d',[EntryStart])+
                      ''' and �T���v���ԍ� <= '''+Format('%0.4d',[EntryStop]) +
                      ''' order by �T���v���ԍ�';
    Open;
    {�������珇�Ԃɓǂݎ��󂫂�T��}

    Application.CreateForm(TFSakumokuSel, FSakumokuSel);
    FSakumokuSel.ShowModal ;

    sNO := StrtoInt(FSakumokuSel.CbSNo.Text);
    aNO := sNo;
    eNO := StrtoInt(FSakumokuSel.CbENo.Text);

    FSakumokuSel.Release ;


//    aNO := EntryStart ;
    while not Eof do begin
      sample := StrtoInt(FieldByName('�T���v���ԍ�').asString);
      if (sNO <= sample) and (eNO >= sample) then begin

        if aNO <> sample then begin
          //�Ⴆ�΋󂫔ԍ��ł���B
          pNewRec := True ;
          break;
        end;
        //�폜���R�[�h���󂫔ԍ�
        if FieldByName('�폜�t���O').asBoolean then begin
          pNewRec := False;
          break;
        end;
        aNO := sample +1; {���̔ԍ�}
      end;
      Next;
    end ;
    Close;

    //���蓖�Ă��͈͓����`�F�b�N
    if (EntryStart <= aNO ) and ( aNO <= EntryStop ) then
      result := Format('%0.4d',[aNO])
    else begin
      {Version 0.6 #36}
      showmessage('���蓖�Ă�T���v���ԍ��͂���܂���B');
      result := '';
    end;
  end;
end;
{
  �T���v���ԍ��ő�l�擾
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
    {Version 0.6 #24 : �T���v���ԍ����蓖�Ă͊Y���͈͓�}
//    SQL.Text := 'Select �T���v���ԍ� from T_UKETUKE where �T���v���ԍ� >= '''+Format('%0.4d',[EntryStart])+
//    ''' and �T���v���ԍ� <= '''+Format('%0.4d',[EntryStop]) +''' order by �T���v���ԍ� desc';
    {Version 0.6 #46 : �폜���R�[�h���Ώ�}
    //�͈͓��ō폜�t���O�������R�[�h�̈�ԎႢ�ԍ�
    //��L���g�p���Ă͂����Ȃ��B���R�F�Ďg�p�����R�[�h�폜�����̂ł����ݾق����Ɛ^�̍ŏ��ԍ��ɂȂ�Ȃ�
      //������Ώ]���ʂ�

    if mode = '1' then begin
      SQL.Text := 'Select ��t�A�� from T_UKETUKE6 where ��t�A�� >= '''+Format('%0.3d',[EntryStart])+
                      ''' and ��t�A�� <= '''+Format('%0.3d',[EntryStop]) +
                      ''' order by ��t�A��';
    end
    else if mode = '2' then begin
      SQL.Text := 'Select �T���v���ԍ�,�폜�t���O from T_UKETUKE2 where �T���v���ԍ� >= '''+Format('%0.4d',[EntryStart])+
                      ''' and �T���v���ԍ� <= '''+Format('%0.4d',[EntryStop]) +
                      ''' order by �T���v���ԍ�';
    end
    else if mode = '3' then begin
      SQL.Text := 'Select �T���v���ԍ�,�폜�t���O from T_UKETUKE3 where �T���v���ԍ� >= '''+Format('%0.4d',[EntryStart])+
                      ''' and �T���v���ԍ� <= '''+Format('%0.4d',[EntryStop]) +
                      ''' order by �T���v���ԍ�';
    end
    else begin
      SQL.Text := 'Select �T���v���ԍ�,�폜�t���O from T_UKETUKE where �T���v���ԍ� >= '''+Format('%0.4d',[EntryStart])+
                      ''' and �T���v���ԍ� <= '''+Format('%0.4d',[EntryStop]) +
                      ''' order by �T���v���ԍ�';
    end;


    Open;
    {�������珇�Ԃɓǂݎ��󂫂�T��}

    FindLast;


    stmp := FieldByName('��t�A��').asString;
    if stmp = '' then stmp := '0';
    sNO := strtoint( stmp);
    aNO := sNO;
    eNO := 999;



//    aNO := EntryStart ;
    while not Eof do begin
      sample := StrtoInt(FieldByName('��t�A��').asString);
      if (sNO <= sample) and (eNO >= sample) then begin

        if aNO <> sample then begin
          //�Ⴆ�΋󂫔ԍ��ł���B
          pNewRec := True ;
          break;
        end;
        aNO := sample +1; {���̔ԍ�}
      end;
      Next;
    end ;
    Close;

    //���蓖�Ă��͈͓����`�F�b�N
    if (EntryStart <= aNO ) and ( aNO <= EntryStop ) then
      result := Format('%0.3d',[aNO])
    else begin
      {Version 0.6 #36}
      showmessage('���蓖�Ă��t�ԍ��͂���܂���B');
      result := '';
    end;
  end;
end;
//�Z���^�[�؂�ւ�
function ChangeCenter( pCenter : string ): Boolean ;
var
   aYear,aThisYear : string ;
begin
	result := false ;
	aYear := SystemIni.ReadString( pCenter , 'EntryYear', '');
  aThisYear := SystemIni.ReadString( pCenter , 'ThisYear', '');
	//�T���v���ԍ����蓖��    {Version 0.6 #34 }
  EntryStart := SystemIni.ReadInteger(pCenter, 'start', 1 );
  EntryStop := SystemIni.ReadInteger(pCenter, 'stop', 9999 );
  if ChangeDataBase(pCenter,aYear) then begin
    SystemIni.WriteString('data', 'center',pCenter) ;
    EntryCenter := pCenter ;
    EntryYear := aYear ;
    ThisYear := aThisYear ;
		IsEntryYear := ThisYear = EntryYear ;	//�G���g���[�\�t���O
    DataPath := AppPath + EntryCenter + '\' + EntryYear + '\' ;
    result := true ;
  end
	else //���߂Ȃ�߂�
   	ChangeDataBase(EntryCenter , EntryYear );
end;
//�N�x�؂�ւ�
function ChangeYear( pYear : string ): Boolean ;
begin
	result := false ;
  if ChangeDataBase(EntryCenter,pYear) then begin
    SystemIni.WriteString(EntryCenter, 'entryyear', pYear );
    EntryYear := pYear ;
		IsEntryYear := ThisYear = pYear ;	//�G���g���[�\�t���O
    DataPath := AppPath + EntryCenter + '\' + EntryYear + '\' ;
    result := true ;
  end
	else //���߂Ȃ�߂�
   	ChangeDataBase(EntryCenter , EntryYear );
end;

//�}�X�^�n�t�@�C����
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
  // �쐬�N�x���쐬
  MakeYear := InttoStr(StrToInt(ThisYear ) + 1 );

  newyear := strtoint(ThisYear);
  newyear := newyear + 1;


//  MakePath := AppPath + EntryCenter + '\' + 	MakeYear +'\';
  MakePath := FTPServer + '\' + FTPTiku + '\' + 	MakeYear +'\';


 // if not DirectoryExists(MakePath) then
 //   if not CreateDir( MakePath) then begin
 //     showmessage('�f�[�^�f�B���N�g�����쐬�ł��܂���B');
 //     exit;
 //   end;








 DataModule1.ADONoukyou.SQL.Clear;
  stmp := 'select * from M_NOUKYOU ORDER BY �_���R�[�h';
  DataModule1.ADONoukyou.SQL.Text := stmp;
  DataModule1.ADONoukyou.Open;

  with DataModule1.ADONoukyou do begin

    first;
    while not Eof do begin
      stmp := FieldByName('�_����').AsString;
      //�t�H���_�[�̍쐬
      sdir := FTPServer+'\'+stmp+ '\'+inttostr(newyear);
      if not DirectoryExists(sdir) then begin
        if not CreateDir(sdir) then begin
          showmessage('�f�B���N�g�����쐬�ł��܂���B'+stmp);
          exit;
        end;
      end;

      //�t�@�C���̃R�s�[
      olddir :=  FTPServer+'\'+stmp+ '\'+ThisYear;

      copyfile(PChar(olddir + '\nkpsoil.mdb'), PChar(sdir + '\nkpsoil.mdb'),false);

      //��t�t�@�C�����N���A
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


      //0001��ǉ�
 //��t��0001�̂ݒǉ�
  DataModule1.ADOQtmpDel.close;
  DataModule1.ADOQtmpDel.SQL.Clear;
  stmp := 'select * from T_UKETUKE';
  DataModule1.ADOQtmpDel.SQL.Text := stmp;
  DataModule1.ADOQtmpDel.Open;
  DataModule1.ADOQtmpDel.insert;
  DataModule1.ADOQtmpDel.FieldByName('�T���v���ԍ�').AsString := '0001';
  DataModule1.ADOQtmpDel.post;
  DataModule1.ADOQtmpDel.close;

  DataModule1.ADOQtmpDel.close;
  DataModule1.ADOQtmpDel.SQL.Clear;
  stmp := 'select * from T_UKETUKE2';
  DataModule1.ADOQtmpDel.SQL.Text := stmp;
  DataModule1.ADOQtmpDel.Open;
  DataModule1.ADOQtmpDel.insert;
  DataModule1.ADOQtmpDel.FieldByName('�T���v���ԍ�').AsString := '0001';
  DataModule1.ADOQtmpDel.post;
  DataModule1.ADOQtmpDel.close;

  DataModule1.ADOQtmpDel.close;
  DataModule1.ADOQtmpDel.SQL.Clear;
  stmp := 'select * from T_UKETUKE3';
  DataModule1.ADOQtmpDel.SQL.Text := stmp;
  DataModule1.ADOQtmpDel.Open;
  DataModule1.ADOQtmpDel.insert;
  DataModule1.ADOQtmpDel.FieldByName('�T���v���ԍ�').AsString := '0001';
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
  DataModule1.ADOQtmp.FieldByName('�T���v���ԍ�').AsString := '0001';
  DataModule1.ADOQtmp.post;
  DataModule1.ADOQtmp.close;

  DataModule1.ADOQtmp.close;
  DataModule1.ADOQtmp.SQL.Clear;
  stmp := 'select * from T_UKETUKE3';
  DataModule1.ADOQtmp.SQL.Text := stmp;
  DataModule1.ADOQtmp.Open;
  DataModule1.ADOQtmp.edit;
  DataModule1.ADOQtmp.FieldByName('�T���v���ԍ�').AsString := '0001';
  DataModule1.ADOQtmp.post;
  DataModule1.ADOQtmp.close;
 }













  //���ݔN�x��ύX
  DataModule1.ADOYear.close;
  DataModule1.ADOYear.SQL.Clear;
  stmp := 'select * from M_YEAR';
  DataModule1.ADOYear.SQL.Text := stmp;
  DataModule1.ADOYear.Open;
  DataModule1.ADOYear.edit;
  DataModule1.ADOYear.FieldByName('���ݔN').AsInteger := newyear;
  DataModule1.ADOYear.post;


  //�N�x���X�g�ɒǉ�
  DataModule1.ADOYear.close;
  DataModule1.ADOYear.SQL.Clear;
  stmp := 'select * from M_YEARLIST';
  DataModule1.ADOYear.SQL.Text := stmp;
  DataModule1.ADOYear.Open;
  DataModule1.ADOYear.last;
  DataModule1.ADOYear.Append;
  DataModule1.ADOYear.edit;
  DataModule1.ADOYear.FieldByName('�N').AsInteger := newyear;
  DataModule1.ADOYear.post;


  //�R���{�ɒǉ�
  MainForm.CbNendo.Items.Add(inttoStr(newyear));





  //�����̕��ϒl���X�V
//  select ������,AVG(����) ���� from T_UKETUKE3.DB group by ������
{
  skou := '����';
  Set_Heikin( skou,'����', MakePath );
  skou := '����';
  Set_Heikin( skou,'����',MakePath );
  skou := 'pH';
  Set_Heikin( skou,'pH', MakePath );
  skou := '�e�`����';
  Set_Heikin( skou, 'CP',MakePath );
  skou := '�n�𐫒`����';
  Set_Heikin( skou, 'SIP',MakePath );
  skou := '�������`����';
  Set_Heikin( skou, 'ADICP',MakePath );
  skou := '�L���`����';
  Set_Heikin( skou, '�L���`��',MakePath );
  skou := '�����G�l���M�[';
  Set_Heikin( skou, 'NEL',MakePath );
  skou := '�����{������';
  Set_Heikin( skou,'TDN', MakePath );
  skou := '�זE���e����';
  Set_Heikin( skou,'OCC', MakePath );
  skou := '�זE�Ǖ���';
  Set_Heikin( skou,'OCW', MakePath );
  skou := '���������@��';
  Set_Heikin( skou,'Oa', MakePath );
  skou := '��������@��';
  Set_Heikin( skou,'Ob', MakePath );
  skou := '�_�������ު�đ@��';
  Set_Heikin( skou,'ADF', MakePath );
  skou := '���������ު�đ@��';
  Set_Heikin( skou,'NDF', MakePath );
  skou := '�_�������ު�ĕs�nظ���';
  Set_Heikin( skou,'ADL', MakePath );
  skou := '���������ު�ĕs�n�`����';
  Set_Heikin( skou,'NDICP', MakePath );
  skou := '��@�ې��Y������';
  Set_Heikin( skou,'NFC', MakePath );
  skou := '�f���v��';
  Set_Heikin( skou,'STA', MakePath );
  skou := '�e���b';
  Set_Heikin( skou,'EE', MakePath );
  skou := '�e�D��';
  Set_Heikin( skou,'�e�D��', MakePath );
  skou := '�J���V�E��';
  Set_Heikin( skou,'Ca', MakePath );
  skou := '����';
  Set_Heikin( skou,'P', MakePath );
  skou := '�}�O�l�V�E��';
  Set_Heikin( skou,'Mg', MakePath );
  skou := '�J���E��';
  Set_Heikin( skou,'K', MakePath );
  skou := '���ʔ�';
  Set_Heikin( skou,'���ʔ�', MakePath );
  skou := '���Ύ�����';
  Set_Heikin( skou,'���ΓI�e������', MakePath );
}
  showmessage('�V�N�x�f�[�^�쐬���܂����B');
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
    stmp := 'select ������,������ԑ�,�������,AVG('+skou+') ���� from T_UKETUKE3 group by ������,������ԑ�,�������';
    DataModule1.QAVG.SQL.Clear;
    DataModule1.QAVG.SQL.Add(stmp);
    Open;
    First;
    while not eof do begin

        cd1 := DataModule1.QAVG.FieldByName('������').asString;
        itmp := DataModule1.QAVG.FieldByName('������ԑ�').asInteger;
        cd2 := DataModule1.QAVG.FieldByName('�������').asString;

        if DataModule1.TCls.Locate( '������;�ԑ�;�������', VarArrayOf([cd1,itmp,cd2]), [] ) then begin
           DataModule1.TCls.Edit;
           DataModule1.TCls.FieldByName( dbkou ).asFloat :=
            DataModule1.QAVG.FieldByName('����').asfloat;
           DataModule1.TCls.Post;
        end;
        Next;
     end;
     Close;
  end;

  DataModule1.TCls.Close;


end;

//�w��g���q�t�@�C���̕���
const Exts : array[1..3] of string =  ('.DB','.PX','.VAL');
function  FilesCopy( srcPath, dstPath, FileName  : string ) : Boolean ;
var
  srcF,dstF : string ;
	cnt : integer ;
begin
	result := False ;
  // �G���g���[�f�[�^��org�t�H���_���畡��
  for cnt := 1 to 3 do begin
    srcF := srcPath	 + FileName + Exts[cnt] ;
    dstF := dstPath  + FileName + Exts[cnt];
     //  .VAL�t�@�C���ȊO�̃G���[�̂݃G���[�ŕԂ�
    if FileExists( srcF ) then begin
//      if not CopyFile(  PChar(srcF) , PChar(dstF) ,  false ) and (cnt <> 3)then begin
      if not CopyFile(  PChar(srcF) , PChar(dstF) ,  false ) then
    	  exit;
    end;
  end;
  //MB�t�@�C�����L��Ε���
  srcF := srcPath	 + FileName + '.MB' ;
  dstF := dstPath  + FileName + '.MB';
  if FileExists( srcF ) then
    CopyFile(  PChar(srcF) , PChar(dstF) ,  false ) ;

  result := True ;
end;
//�w��g���q�t�@�C���̍폜
function  FilesDelete( srcPath, FileName  : string ) : Boolean ;
var
  srcF : string ;
	cnt : integer ;
begin
  // �G���g���[�f�[�^��org�t�H���_���畡��
  for cnt := 1 to 3 do begin
    srcF := srcPath	 + FileName + Exts[cnt] ;
    DeleteFile(  PChar(srcF) ) ;
  end;
  //MB�t�@�C�����L��Ε���
  srcF := srcPath	 + FileName + '.MB' ;
  if FileExists( srcF ) then
    DeleteFile(  PChar(srcF) ) ;
  result := True ;
end;

{
  ������̃p�[�c�����o���B�p�[�c��؂�̓X�y�[�X
}
function strParts( const pData: string ; PartsNum : integer ) : string ;
var
  cCnt , PartsCnt : integer ;
begin
  result := '';
  PartsCnt := 1 ; //�ŏ��̃p�[�c
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
//org�f�B���N�g������̃}�X�^�t�@�C������ : �V�N�x�X�V�ŗ��p
function OriginalFilesCopy( syncPath, srcPath, dstPath  : string ) : Boolean ;
var
  OriginalIni: TIniFile;
	IniFile, MName : string ;
  cnt,Mfiles : integer ;
begin
	result := false ;
  //�V�X�e���ݒ�֘A
  IniFile := syncPath + SYNCFILE;

  //�ݒ�̧�ق̎�荞��
  OriginalIni := nil;
  if FileExists( IniFile ) then
    OriginalIni := TIniFile.Create( IniFile );

  if OriginalIni = nil then begin
  	showmessage('�}�X�^�ݒ�t�@�C����������܂���B');
    exit;
  end;
  try
    // �}�X�^�f�[�^�͓����Z���^�[�̍ŐV�N�x���畡��
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

//�w��f�B���N�g������̃}�X�^�t�@�C������ : �V�N�x�X�V�ŗ��p
function MasterFilesCopy( syncPath,srcPath, dstPath  : string ) : Boolean ;
var
  MasterIni: TIniFile;
	IniFile, MName : string ;
  cnt,Mfiles : integer ;
begin
	result := false ;
  //�V�X�e���ݒ�֘A
  IniFile := syncPath + SYNCFILE;

  //�ݒ�̧�ق̎�荞��
  MasterIni := nil;
  if FileExists( IniFile ) then
    MasterIni := TIniFile.Create( IniFile );

  if MasterIni = nil then begin
  	showmessage('�}�X�^�ݒ�t�@�C����������܂���B');
    exit;
  end;
  try
    // �}�X�^�f�[�^�͓����Z���^�[�̍ŐV�N�x���畡��
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
  //�V�X�e���ݒ�֘A
  IniFile := syncPath + SYNCFILE;

  //�ݒ�̧�ق̎�荞��
  MasterIni := nil;
  if FileExists( IniFile ) then
    MasterIni := TIniFile.Create( IniFile );

  if MasterIni = nil then begin
  	showmessage('�}�X�^�ݒ�t�@�C����������܂���B');
    exit;
  end;
  try
    // �}�X�^�f�[�^�͓����Z���^�[�̍ŐV�N�x���畡��
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
  �����t�@�C���̍X�V���t�X�V
  pName : �}�X�^�t�@�C�����A�X�V������������
}
procedure UpdateSyncFile( SyncFile, pSecName: string );
var
  MasterIni: TIniFile;
begin
  MasterIni := TIniFile.Create(SyncFile);
  if MasterIni = nil then begin
  	showmessage('�����ݒ�t�@�C����������܂���B');
    exit;
  end;
  MasterIni.WriteDateTime( LowerCase(pSecName), 'update',now ) ;

  MasterIni.Free ;
end;

{
  �e�[�u���̃}�[�W �F Table1,2 : ��΃p�X�e�[�u����
  result : True : �}�[�W�L��
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
//  Table1���񂵂āATable2���������A�V�������t���X�V����BTable2�ɖ�����Βǉ�����B
    MargeTable1.First ;
    while not MargeTable1.eof do begin
      //�������R�[�h����������
      if MargeTable2.Locate(key,MargeTable1.FieldByName(key).asString,[]) then begin
        //�ҏW�����r����B
        if MargeTable1.FieldByName('�ҏW��').asDateTime = MargeTable2.FieldByName('�ҏW��').asDateTime then begin
          MargeTable1.Next ;
          continue ;
        end;
        if MargeTable1.FieldByName('�ҏW��').asDateTime > MargeTable2.FieldByName('�ҏW��').asDateTime then begin
          //1���V�����F
          with MargeTable2 do begin
            Edit ;
            for cnt := 1 to FieldCount -1 do   //��L�[�̎�����S�ăR�s�[
              FieldValues[ Fields[cnt].FieldName ] := MargeTable1.FieldValues[ Fields[cnt].FieldName ] ;
            Post ;
            IsUpdate := True ;
          end;
        end else begin
          //2���V�����F
          with MargeTable1 do begin
            Edit ;
            for cnt := 1 to FieldCount -1 do   //��L�[�̎�����S�ăR�s�[
              FieldValues[ Fields[cnt].FieldName ] := MargeTable2.FieldValues[ Fields[cnt].FieldName ] ;
            Post ;
            IsUpdate := True ;
          end;
        end;
      end else begin  //������΁A2�ɒǉ�
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
//  Table2���񂵂āATable2���������ATable1�ɖ�����Βǉ�����B
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
  �G�N�X�|�[�g
}
procedure ExportFile( TableName, FileName : string );
begin

  with DataModule1 do begin

  if TableName = 't_uketuke' then begin

        //SQL.Text := 'Select Count(*) cnt from T_UKETUKE where �폜�t���O<>True and  ' + SQLCondition ;

//    QueryRead.SQL.Text := 'Select * from '+TableName;
        QueryRead.SQL.Text := 'SELECT T_uketuke.�T���v���ԍ�,'+
        'M_sakumotu.�앨��,'+
        'M_sakugata.��^��,'+
//        'T_uketuke.��ڃR�[�h, T_uketuke.�앨�R�[�h,T_uketuke.��^�R�[�h, '+
        'M_nouka.�_�Ɣԍ�,M_nouka.�_�Ɩ�,T_uketuke.�ޏ�ԍ�,M_hojou.�ޏꖼ,'+
        'M_dojou.�y�떼,M_dosei.�y����,M_hojou.���A�R�[�h,'+
        'M_yuuki01.�L�@������ �L�@����1,'+
        'M_yuuki02.�L�@������ �L�@����2,'+
        'M_yuuki03.�L�@������ �L�@����3,'+

        'T_uketuke.* '+
//        'T_uketuke.pH,'+
//        'T_uketuke.EC,'+
//        'T_uketuke.�g���I�[�OP,T_uketuke.�u���CP,'+
//        'T_uketuke.CaO,'+
//        'T_uketuke.MgO,'+
//        'T_uketuke.K2O,'+
//        'T_uketuke.CEC,'+
//        'T_uketuke.�����z,'+
//        'T_uketuke.����N �|�{N,'+
//        'T_uketuke.�A�����j�A��N,'+
//        'T_uketuke.�Ɏ_��N,T_uketuke.�M���oN,'+
//        'T_uketuke.�P�C�_,'+
//        'T_uketuke.�S,'+
//        'T_uketuke.����,'+
//        'T_uketuke.��,'+
//        'T_uketuke.�}���K��,'+
 //       'T_uketuke.�z�E�f,'+
//        'T_uketuke.�j�b�P��,'+
//        'T_uketuke.���A,'+
//        'T_uketuke.�e�Ϗd,'+
//        'T_uketuke.�n�E�W�� '+
'FROM "T_UKETUKE.DB" T_uketuke'+
'   LEFT OUTER JOIN "M_HOJOU.DB" M_hojou'+
'   ON  (T_uketuke.�ޏ�ԍ� = M_hojou.�ޏ�ԍ�)'+
'   LEFT OUTER JOIN "M_SAKUMOTU.db" M_sakumotu'+
'   ON  (T_uketuke.��ڃR�[�h = M_sakumotu.��ڃR�[�h)'+
'   AND  (T_uketuke.�앨�R�[�h = M_sakumotu.�앨�R�[�h)'+
'   LEFT OUTER JOIN "M_SAKUGATA.DB" M_sakugata'+
'   ON  (T_uketuke.��ڃR�[�h = M_sakugata.��ڃR�[�h)'+
'   AND  (T_uketuke.�앨�R�[�h = M_sakugata.�앨�R�[�h)'+
'   AND  (T_uketuke.��^�R�[�h = M_sakugata.��^�R�[�h)'+
'   LEFT OUTER JOIN "M_NOUKA.db" M_nouka'+
'   ON  (M_hojou.�_�Ɣԍ� = M_nouka.�_�Ɣԍ�)'+
'   LEFT OUTER JOIN "M_DOJOU.db" M_dojou'+
'   ON  (M_hojou.�y��R�[�h = M_dojou.�y��R�[�h)'+
'   LEFT OUTER JOIN "M_DOSEI.db" M_dosei'+
'   ON  (M_hojou.�y���R�[�h = M_dosei.�y���R�[�h)'+
'   LEFT OUTER JOIN "M_YUUKI.db" M_yuuki01'+
'   ON  (T_uketuke.�L�@���R�[�h1 = M_yuuki01.�L�@���R�[�h)'+
'   LEFT OUTER JOIN "M_YUUKI.db" M_yuuki02'+
'   ON  (T_uketuke.�L�@���R�[�h2 = M_yuuki02.�L�@���R�[�h)'+
'   LEFT OUTER JOIN "M_YUUKI.db" M_yuuki03'+
'   ON  (T_uketuke.�L�@���R�[�h3 = M_yuuki03.�L�@���R�[�h)'+
'WHERE T_Uketuke.�폜�t���O<>True '+
'and '+ SQLCondition;
//'Order by T_Uketuke.�T���v���ԍ�';
    end
    else begin
    QueryRead.SQL.Text := 'Select * from '+TableName;

    end;
    QueryRead.Open;
    QueryToCSV(QueryRead,FileName) ;
    QueryRead.Close;
  end;
end;

//�n�}�f�[�^�o��
procedure ExportFileGIS( TableName, FileName : string );
var
  iCnt : Integer;
  WorkList,CSVList : TStringList;
  stmp, stmp2 : String;
  kou : String;
begin

  with DataModule1 do begin

//    QueryRead.SQL.Text := 'Select * from '+TableName;
        QueryRead.SQL.Text := 'SELECT T_uketuke.�T���v���ԍ�,'+
        'M_sakumoku.��ږ�,'+
        'M_sakumotu.�앨��,'+
        'M_sakugata.��^��,'+
        'M_zsakumotu.�앨�� �O�얼,'+
//        'T_uketuke.��ڃR�[�h, T_uketuke.�앨�R�[�h,T_uketuke.��^�R�[�h, '+
        'M_nouka.�_�Ɣԍ�,M_nouka.�_�Ɩ�,T_uketuke.�ޏ�ԍ�,M_hojou.�ޏꖼ,'+
        'M_hojou.�y��R�[�h,'+
        'M_noukyou.�_����,'+
        'M_dojou.�y�떼,M_dosei.�y����,M_hojou.���A�R�[�h,'+

        'T_uketuke.* '+
//        'T_uketuke.pH,'+
//        'T_uketuke.EC,'+
//        'T_uketuke.�g���I�[�OP,T_uketuke.�u���CP,'+
//        'T_uketuke.CaO,'+
//        'T_uketuke.MgO,'+
//        'T_uketuke.K2O,'+
//        'T_uketuke.CEC,'+
//        'T_uketuke.�����z,'+
//        'T_uketuke.����N �|�{N,'+
//        'T_uketuke.�A�����j�A��N,'+
//        'T_uketuke.�Ɏ_��N,T_uketuke.�M���oN,'+
//        'T_uketuke.�P�C�_,'+
//        'T_uketuke.�S,'+
//        'T_uketuke.����,'+
//        'T_uketuke.��,'+
//        'T_uketuke.�}���K��,'+
 //       'T_uketuke.�z�E�f,'+
//        'T_uketuke.�j�b�P��,'+
//        'T_uketuke.���A,'+
//        'T_uketuke.�e�Ϗd,'+
//        'T_uketuke.�n�E�W�� '+
'FROM "T_UKETUKE.DB" T_uketuke'+
'   LEFT OUTER JOIN "M_HOJOU.DB" M_hojou'+
'   ON  (T_uketuke.�ޏ�ԍ� = M_hojou.�ޏ�ԍ�)'+
'   LEFT OUTER JOIN "M_SAKUMOKU.db" M_sakumoku'+
'   ON  (T_uketuke.��ڃR�[�h = M_sakumoku.��ڃR�[�h)'+

'   LEFT OUTER JOIN "M_SAKUMOTU.db" M_sakumotu'+
'   ON  (T_uketuke.��ڃR�[�h = M_sakumotu.��ڃR�[�h)'+
'   AND  (T_uketuke.�앨�R�[�h = M_sakumotu.�앨�R�[�h)'+
'   LEFT OUTER JOIN "M_SAKUGATA.DB" M_sakugata'+
'   ON  (T_uketuke.��ڃR�[�h = M_sakugata.��ڃR�[�h)'+
'   AND  (T_uketuke.�앨�R�[�h = M_sakugata.�앨�R�[�h)'+
'   AND  (T_uketuke.��^�R�[�h = M_sakugata.��^�R�[�h)'+

'   LEFT OUTER JOIN "M_SAKUMOTU.db" M_zsakumotu'+
'   ON  (T_uketuke.�O��ڃR�[�h = M_zsakumotu.��ڃR�[�h)'+
'   AND  (T_uketuke.�O�앨�R�[�h = M_zsakumotu.�앨�R�[�h)'+


'   LEFT OUTER JOIN "M_NOUKA.db" M_nouka'+
'   ON  (M_hojou.�_�Ɣԍ� = M_nouka.�_�Ɣԍ�)'+
'   LEFT OUTER JOIN "M_NOUKYOU.db" M_noukyou'+
'   ON  (M_nouka.�_���R�[�h = M_noukyou.�_���R�[�h)'+
'   LEFT OUTER JOIN "M_DOJOU.db" M_dojou'+
'   ON  (M_hojou.�y��R�[�h = M_dojou.�y��R�[�h)'+
'   LEFT OUTER JOIN "M_DOSEI.db" M_dosei'+
'   ON  (M_hojou.�y���R�[�h = M_dosei.�y���R�[�h)'+
'WHERE T_Uketuke.�폜�t���O<>True '+
'and '+ SQLCondition;
//'Order by T_Uketuke.�T���v���ԍ�';


    QueryRead.Open;
//    QueryToCSV(QueryRead,FileName) ;

//    WorkList := TStringList.Create;
    CSVList := TStringList.Create;

    //�ŏ���1�s�̓t�B�[���h��
//    for iCnt:= 0 to QuerySource.FieldCount -1 do
//      WorkList.Add(QuerySource.Fields[iCnt].FieldName);

    stmp := stmp + '�T���v���ԍ�,';
    stmp := stmp + '�_����,';
    stmp := stmp + '�_�ƃR�[�h,';
    stmp := stmp + '�_�Ɩ�,';
    stmp := stmp + '�ޏ�ԍ�,';
    stmp := stmp + '���͑Ώۓy��R�[�h,';
    stmp := stmp + '���͑Ώۓy�떼,';
    stmp := stmp + '�y�떼,';
    stmp := stmp + '�y����,';
    stmp := stmp + '�O��,';

    stmp := stmp + '��t�\��,';
    stmp := stmp + '�r���ǔ�,';
    stmp := stmp + '�a�Q,';
    stmp := stmp + '�{��@,';
    stmp := stmp + '�����c,';
    stmp := stmp + '���p�敪,';
    stmp := stmp + '�����N,';
    stmp := stmp + '���ݑ���,';
    stmp := stmp + '�Ώۓy�w,';
    stmp := stmp + '�O��͔|�敪,';

    stmp := stmp + '�\��앨�͔|�敪,';
    stmp := stmp + '���n���p�敪,';
    stmp := stmp + '���g,';
    stmp := stmp + '�d�C�`���x,';
    stmp := stmp + '����,';
    stmp := stmp + '��y,';
    stmp := stmp + '�ΊD,';
    stmp := stmp + '����u���e��,';
    stmp := stmp + '�g���I�[�O���_,';
    stmp := stmp + '�u���C���_,';

    stmp := stmp + '���p,';
    stmp := stmp + '���A,';
    stmp := stmp + '�M�|�m,';
    stmp := stmp + '�|�{�|�m,';
    stmp := stmp + '����d,';
    stmp := stmp + '�X���@�]�_,';
    stmp := stmp + '�|�_�@�]�_,';
    stmp := stmp + '�z�E�f,';
    stmp := stmp + '��,';
    stmp := stmp + '����,';

    stmp := stmp + '�}���K��,';
    stmp := stmp + '�V���_���S,';
    stmp := stmp + '�앨�̌]�_,';
    stmp := stmp + '�̎�N����,';
    stmp := stmp + ' ,';
    stmp := stmp + ' ,';
    stmp := stmp + '����,';
    stmp := stmp + '��y,';
    stmp := stmp + '�ΊD,';
    stmp := stmp + 'CEC,';

    stmp := stmp + '����O�a�x,';
    stmp := stmp + '�ΊD�O�a�x,';
    stmp := stmp + '��y�J����,';
    stmp := stmp + '�ΊD��y��';

    CSVList.Add(stmp);

//    CSVList.Add(WorkList.CommaText);

    //���R�[�h��StringList�ɏo��
    QueryRead.First;
    while not QueryRead.EOF do begin
//    WorkList.Clear ;
//    for iCnt:= 0 to QuerySource.FieldCount -1 do
//      WorkList.Add(QuerySource.Fields[iCnt].AsString);
      stmp := '';


      stmp := stmp + QueryRead.FieldByName('�T���v���ԍ�').asString;
      stmp := stmp + ','+QueryRead.FieldByName('�_����').asString;
      stmp := stmp + ','+QueryRead.FieldByName('�_�Ɣԍ�').asString;
      stmp := stmp + ','+QueryRead.FieldByName('�_�Ɩ�').asString;
      stmp := stmp + ','+QueryRead.FieldByName('�ޏ�ԍ�').asString;
      stmp := stmp + ','+QueryRead.FieldByName('�y��R�[�h').asString;
      stmp := stmp + ','+QueryRead.FieldByName('��ږ�').asString;  //���͑Ώۓy�떼
      stmp := stmp + ','+QueryRead.FieldByName('�y�떼').asString;
      stmp := stmp + ','+QueryRead.FieldByName('�y����').asString;
      stmp := stmp + ','+QueryRead.FieldByName('�O�얼').asString;
      stmp := stmp + ','+QueryRead.FieldByName('�앨��').asString;
      stmp := stmp + ',';//�r���ǔ� +QueryRead.FieldByName('').asString;
      stmp := stmp + ','; //�a�Q +QueryRead.FieldByName('').asString;
      stmp := stmp + ',';//�{��@QueryRead.FieldByName('').asString;
      stmp := stmp + ',';//�����cQueryRead.FieldByName('').asString;
      stmp := stmp + ',';//���p�敪QueryRead.FieldByName('').asString;

      stmp := stmp + ',';//�����NQueryRead.FieldByName('').asString;
      stmp := stmp + ',';//���ݑ���QueryRead.FieldByName('').asString;
      stmp := stmp + ',';//�Ώۓy�wQueryRead.FieldByName('').asString;
      stmp := stmp + ',';//�O��͔|�敪QueryRead.FieldByName('').asString;
      stmp := stmp + ',';//�\��앨�͔|�敪QueryRead.FieldByName('').asString;
      stmp := stmp + ',';//���n���p�敪QueryRead.FieldByName('').asString;


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

      kou := '�g���I�[�OP';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '�u���CP';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*f ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '�����z';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*f ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '���A';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '�M���oN';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '����N'; //�|�{���f
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '�e�Ϗd'; //�|�{���f
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '�P�C�_'; //�X���@�]�_
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '�P�C�_'; //�|�_�@�]�_
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '�z�E�f';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '��';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '����';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '�}���K��';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '�S';
      if QueryRead.FieldByName(kou).IsNull then
          stmp := stmp + ','
      else
          stmp := stmp + ','+ Format('%.*n',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '�앨�̃P�C�_';
      //if QueryRead.FieldByName(kou).IsNull then
      stmp := stmp + ',';
      //else
      //    stmp := stmp + ','+ Format('%.*n ',[2,QueryRead.FieldByName(kou).asFloat]);

      kou := '�̎�N����';
      if QueryRead.FieldByName(kou).IsNull then begin
          stmp := stmp + ',';
      end
      else begin
          DateTimetoString(stmp2, 'yyyy/mm/dd',QueryRead.FieldByName(kou).asDateTime);
          stmp := stmp + ','+ stmp2;
      end;

      //�Q��
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
    stmp := stmp + '����O�a�x,';
    stmp := stmp + '�ΊD�O�a�x,';
    stmp := stmp + '��y�J����,';
    stmp := stmp + '�ΊD��y��';
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
  �N�G���[���b�r�u�o�́B��s�ځF�t�B�[���h��
}
procedure QueryToCSV( QuerySource:TADOQuery; FileName:String );
var
  iCnt : Integer;
  WorkList,CSVList : TStringList;
begin
  WorkList := TStringList.Create;
  CSVList := TStringList.Create;

  //�ŏ���1�s�̓t�B�[���h��
  for iCnt:= 0 to QuerySource.FieldCount -1 do
    WorkList.Add(QuerySource.Fields[iCnt].FieldName);
  CSVList.Add(WorkList.CommaText);
  //���R�[�h��StringList�ɏo��
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
  �C���|�[�g
}
function ImportFile( FileName, TableName  : string ):Boolean;
begin
end;
{
  CSV�t�@�C�����e�[�u���ɏ������ށA�㏑���ǉ�
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
    Readln(TF,aRec);   //�t�B�[���h���X�g�̎擾
    FieldNList.CommaText := aRec ;
    while not Eof(TF) do begin
      Readln(TF,aRec);  //�f�[�^���R�[�h�ꌏ����
      DataList.CommaText := aRec ;
      //�Y���N�G���[�ɏo��
      with QuerySource do begin
        //���t�B�[���h����L�[�ƌ��Ȃ��Ċ������R�[�h�̊m�F
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
  �엿���̎擾�F�R�[�h�����ŎQ�ƃ}�X�^�ύX
}
function GetHiryoName( Code : string ) : string ;
begin
  with DataModule1.QueryRead2 do begin
    if length(Code)>2 then begin
      SQL.Text := 'Select �엿�� from M_KASEI where CODE='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('�엿��').asString
      else result := '';
    end else begin
      SQL.Text := 'Select �L�@������ from M_YUUKI where �L�@���R�[�h='''+Code+'''';
      Open;
      if RecordCount > 0 then
        result := FieldbyName('�L�@������').asString
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
      SQL.Text := 'Select * from M_YUUKI where �L�@���R�[�h='''+Code+'''';
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
      SQL.Text := 'Select * from M_YUUKI where �L�@���R�[�h='''+Code+'''';
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
      SQL.Text := 'Select * from M_YUUKI where �L�@���R�[�h='''+Code+'''';
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
      SQL.Text := 'Select * from M_YUUKI where �L�@���R�[�h='''+Code+'''';
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
        result := FieldbyName('�ǔ�t���O').asBoolean
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
        result := FieldbyName('�P��').asInteger
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
        result := FieldbyName('�e��').asfloat
      else result := 0;
    Close;
    end;
  end;
end;

//========================================================================
//�@typCEC �́@�Z�b�g
//  A,B,C
//========================================================================
function Get_CEC_ABC(UketukeQuery : TADOQuery): string;
var
  dcode : String;
  IsKusa : Boolean ;
begin

  IsKusa := UketukeQuery.FieldByName('��ڃR�[�h').asString = BokusouCode;
  //A.Nishimura �ΎR���y�̔���
  dcode :=  UketukeQuery.FieldByName('M_HOJOU.�y��R�[�h').asString;

  //���n�̏ꍇ�Ɖ��|�ɕ�����
  if IsKusa then begin
      if dcode = '' then dcode := '10';
      result := 'A';
      case Strtoint( dcode ) of
        31: result := 'A';
        32: result := 'B';
        33: result := 'C';
      end;
  end
  else begin    //���n�ȊO
      //CEC���ǂ̊�l{A,B,C}���̗p���邩
      if UketukeQuery.FieldByName('CEC').asFloat < 12.0 then  result := 'A'
      else
      if UketukeQuery.FieldByName('CEC').asFloat < 25.0 then  result := 'B'
      else                                                     result := 'C' ;
  end;

end;
//========================================================================
//�@typCEC �́@�Z�b�g
//  A,B,C
//========================================================================
function Get_CEC_ABC2(UketukeQuery : TADOQuery): string;
var
  dcode : String;
  IsKusa : Boolean ;
begin

  IsKusa := UketukeQuery.FieldByName('��ڃR�[�h').asString = BokusouCode;
  //A.Nishimura �ΎR���y�̔���
  dcode :=  UketukeQuery.FieldByName('�y��R�[�h').asString;   //�y��code

  //���n�̏ꍇ�Ɖ��|�ɕ�����
  if IsKusa then begin
      if dcode = '' then dcode := '10';
      result := 'A';
      case Strtoint( dcode ) of
        31: result := 'A';
        32: result := 'B';
        33: result := 'C';
      end;
  end
  else begin    //���n�ȊO
      //CEC���ǂ̊�l{A,B,C}���̗p���邩
      if UketukeQuery.FieldByName('CEC').asFloat < 12.0 then  result := 'A'
      else
      if UketukeQuery.FieldByName('CEC').asFloat < 25.0 then  result := 'B'
      else                                                     result := 'C' ;
  end;

end;
//========================================================================
//  ��l�̃��R�[�h�Z�b�g
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
  IsKusa := UketukeQuery.FieldByName('��ڃR�[�h').asString = BokusouCode ;
  IsIne := UketukeQuery.FieldByName('��ڃR�[�h').asString = SuitouCode ;

  cd1 := UketukeQuery.FieldByName('��ڃR�[�h').asString;
  cd2 := UketukeQuery.FieldByName('�앨�R�[�h').asString;
  cd3 := UketukeQuery.FieldByName('��^�R�[�h').asString;

  //A.Nishimura �ΎR���y�̔���
  dcode :=  UketukeQuery.FieldByName('M_HOJOU.�y��R�[�h').asString;

  case Strtoint(Copy( dcode,1,1)) of
  1,4:  DosituCode := '2';
  2:     DosituCode := '3';
  3:     DosituCode := '1';
  end;
  IsKazan := DosituCode = '1'; //�ΎR���y

  //��lCEC 0�`10 ���̃^�C�v�𔻒� A,B,C
//  typcec := Get_CEC_ABC(QueryUketuke);
//  typCEC_Set;

  //�쐬��ڂɂ���l����o��

  with QueryKijun do begin
    aBuff := UketukeQuery.FieldByName('��^�R�[�h').asString ;
    if aBuff <> '' then begin
      Close;
      if IsKusa then
//        SQL.Text := 'Select * from M_BOKUGATA where ��ڃR�[�h=:��ڃR�[�h and �앨�R�[�h=:�앨�R�[�h and ��^�R�[�h=:��^�R�[�h and �y���R�[�h='''+DosituCode+''''
        SQL.Text := 'Select * from M_BOKUGATA where ��ڃR�[�h='''+cd1+''' and �앨�R�[�h='''+cd2+''' and ��^�R�[�h='''+cd3+''' and �y���R�[�h='''+DosituCode+''''
      else
        SQL.Text := 'Select * from M_SAKUGATA where ��ڃR�[�h='''+cd1+''' and �앨�R�[�h='''+cd2+''' and ��^�R�[�h='''+cd3+'''';
//        SQL.Text := 'Select * from M_SAKUGATA where ��ڃR�[�h=:��ڃR�[�h and �앨�R�[�h=:�앨�R�[�h and ��^�R�[�h=:��^�R�[�h';

      stmp := SQL.Text;
      Open;
      if not FieldByName('�g�p�L��').asBoolean then     //���̃��R�[�h�L�����H
        Close;
    end;
    //��̔���ŃN�G���L���łȂ��Ȃ�
    //�\��앨�݂̂ł���΂��̍�ڃR�[�h�Ŋ�lDB�����l���擾����B
    if not Active then begin
      if IsKusa then
//        SQL.Text := 'Select * from M_BOKUMOKU where ��ڃR�[�h=:��ڃR�[�h and �y���R�[�h='''+DosituCode+''''
        SQL.Text := 'Select * from M_BOKUMOKU where ��ڃR�[�h='''+cd1+''' and �y���R�[�h='''+DosituCode+''''
      else
        SQL.Text := 'Select * from M_SAKUMOKU where ��ڃR�[�h='''+cd1+'''';// and �앨�R�[�h='''+cd2+'''';
//        SQL.Text := 'Select * from M_SAKUMOKU where ��ڃR�[�h=:��ڃR�[�h';

      stmp := SQL.Text;
      Open;
    end;
    result := Recordcount;
  end; {bottom with}
end;
////////////////////////////////////////////////////////////

{
  �{��݌v�N���X
}
constructor TSehiHiryo.Create;
begin
  inherited Create ;
end;
destructor TSehiHiryo.Destroy;
begin
  inherited Destroy ;
end;
{�o�^�엿�N���A}
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
{�o�^�엿�S�N���A}
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
  �엿���X�g�̒ǉ��B���R�[�h���� �e�ʂ��Z�b�g
  �߂�l�F�i�[�ԍ�
}

function TSehiHiryo.SetHiryo( aType : THiryoType; aCode : string ;aValue : double ; IsKazan : Boolean ):integer;
var
  aCnt,len : integer ;
begin
  result := 0 ;
  len := length(aCode);
  for aCnt := 1 to 5 do begin
    //�󂫂̂���Ƃ����
    if aryHiryo[Ord(aType),aCnt].CD = '' then begin

      with DataModule1.QueryRead do begin  //�엿���ׂ̓o�^
        case aType of
        htYuuki:
          if IsKazan then
            SQL.Text := 'Select �L�@������ as Name,N_2 as N,K_2 as K,P_2 as P,0 as M from M_Yuuki where �L�@���R�[�h='''+aCode+''''
          else
            SQL.Text := 'Select �L�@������ as Name,N,K,P,0 as M from M_Yuuki where �L�@���R�[�h='''+  aCode+'''';
        else if len = 4 then   //�����엿
            SQL.Text := 'Select �엿�� as Name,N,K2O as K,P205 as P,MgO as M,�e�� as You,�P�� as Tanka,�L�@���t���O,�ǔ�t���O from M_Kasei where CODE='''+aCode +''''
          else                   //�P��엿
            SQL.Text := 'Select �엿�� as Name,N,K2O as K,P205 as P,MgO as M,�e�� as You,�P�� as Tanka from M_Tanpi where CODE='''+aCode +'''';
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
//            aryHiryo[Ord(aType),aCnt].YuukiSitu := FieldByName('�L�@���t���O').asBoolean;
            aryHiryo[Ord(aType),aCnt].Tuihi := FieldByName('�ǔ�t���O').asBoolean;
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
      result := aCnt ;   //�Z�b�g�ł����ԍ���Ԃ�
      break;
    end;
  end;
end;

{
  �엿�e�ʂ̎Z�o
    �엿�^�C�v�A
    aNum : integer  : 1-5�Z�o����엿�̓o�^�ϔԍ��i�Z�o�������j
    aSetVal :double : �����̎{��ʁi���v�ڕW�l�j
    aCalIng:integer : 1:N,2:P,3:K,4:Mg �Z�o�������
    �߂�l�F�Z�o�����{�e��
}
function TSehiHiryo.CalcValue( aType : THiryoType; aNum : integer ;aSetVal :double;aCalIng:integer ):double;
var
  aCnt : integer ;
  aTotal,aVal,aDifference,aIngredient : double ;
begin
  result := 0 ;
  aTotal := 0;
  //�����ȊO�̍��v�̐������Z�o
  for aCnt := 1 to 5 do begin
    if aCnt = aNum then continue ;  {�����͍��v�Ɋ܂߂Ȃ�}
    {�L�@�̂ݐ�����(Kg/t)}
    aVal := 0;
    if aType = htYuuki then begin
      case  aCalIng of  {���F�Ă΂�邱�Ƃ͂Ȃ�}
      1: aVal := aryHiryo[Ord(aType),aCnt].N *  aryHiryo[Ord(aType),aCnt].V  ;
{��}  2: aVal := aryHiryo[Ord(aType),aCnt].P *  aryHiryo[Ord(aType),aCnt].V  ;
{��}  3: aVal := aryHiryo[Ord(aType),aCnt].K *  aryHiryo[Ord(aType),aCnt].V  ;
{��}  4: aVal := aryHiryo[Ord(aType),aCnt].M *  aryHiryo[Ord(aType),aCnt].V  ;
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
  //�ڕW�l����̕s�����Z�o
  aDifference := aSetVal - aTotal ;
  if aDifference <= 0 then exit;   {�O��Ԃ�}
  //�����ʁA����o��
  aIngredient := 0;
  case  aCalIng of
  1: aIngredient := aryHiryo[Ord(aType),aNum].N  ;
  2: aIngredient := aryHiryo[Ord(aType),aNum].P  ;
  3: aIngredient := aryHiryo[Ord(aType),aNum].K  ;
  4: aIngredient := aryHiryo[Ord(aType),aNum].M  ;
  end;
  if aIngredient <= 0 then exit ;

  result := aDifference / aIngredient ;   {�s�����^���������K�v��}
  if aType <> htYuuki then result := result * 100 ;
end;
{�o�^�ςݔ엿�̍폜}
procedure TSehiHiryo.DelHiryo( aType : THiryoType; aNum : integer );
var
  aCnt : integer ;
begin
  if (aNum < 1) or ( aNum > 5 ) then exit ;
  for acnt := aNum to 4 do aryHiryo[Ord(aType),aCnt] := aryHiryo[Ord(aType),aCnt+1] ;
  Clear(Ord(aType),5);
end;
{�o�^�ςݔ엿���̎擾}
function TSehiHiryo.GetHiryo( aType : THiryoType; aNum : integer ):TRecHiryo;
begin
  result := aryHiryo[Ord(aType),aNum];
end;
{�e�ʂ݂̂̓o�^}
procedure TSehiHiryo.SetValue( aType : THiryoType; aNum:integer ; aValue : double);
begin
  aryHiryo[Ord(aType),aNum].V := aValue ;
end;
{�엿�����̎Z�o}
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
    {�L�@�̂ݐ�����(Kg/t)}
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
{�w��{��񐔂Ő����̑����v���Z�o�F�񐔂Œǔ쁁�O�͂P�ɂ���}
function TSehiHiryo.GetTotal( Kaisu : integer ) :TRecHiryo;
var
  aRecHiryo : array[1..3] of TRecHiryo ;
begin
  aRecHiryo[1] := GetQuantity( htHiryo1 ) ;
  aRecHiryo[2] := GetQuantity( htHiryo2 ) ;
  aRecHiryo[3] := GetQuantity( htHiryo3 ) ;
  result := aRecHiryo[1] ;    {���}
  {���{�񐔂P�y�ђǔ�̏ꍇ}
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
{NULL�͂O�ɂ���StrtoFloat}
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
  ����̖��̂̃R���|�[�l���g�P�`�T��Enabled�̐ݒ�
}
procedure SetEnableBDE(aOwner : TComponent; aName : string ; aFlag : Boolean );
var
  aCnt : integer ;
begin
  for aCnt := 1 to 5 do
    SetEnableBDE(TDBEdit(aOwner.FindComponent( aName + Inttostr( aCnt ))), aFlag );
end;
{�R���|�[�l���g�w��̏ꍇ}
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
  �W���{�p�ʂ̎Z�o����
}

function GetStandardValue(UketukeQuery : TADOQuery): TRecStandard;
var
  SakumokuCD,SakumotuCD,SakugataCD : string ;
  TableN,TitaiCD,DojoCD : string ;
  IsEngei,IsKusa : Boolean;  {���|�앨}
  NKaisu : integer ;  {���f���{�񐔁F�ʏ퍇�v�̎{��񐔂𐬕����ʂœK�p}
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

  SakumokuCD := UketukeQuery.FieldByName('��ڃR�[�h').asString;
  SakumotuCD := UketukeQuery.FieldByName('�앨�R�[�h').asString;
  SakugataCD := UketukeQuery.FieldByName('��^�R�[�h').asString;
  IsEngei := (SakumokuCD = '3') or (SakumokuCD = '4') or (SakumokuCD = '5') ;{���|�앨��}
  IsKusa  := (SakumokuCD = '6') or (SakumokuCD = '7') ;{�q��}
//  IsKusa  := (SakumokuCD = '6');{�q��}


  with DataModule1.QueryRead do begin
    Close;
    SQL.Text := '';
    if SakumokuCD = '1' then begin

      if (SakumotuCD = '04' ) or
         (SakumotuCD = '05' ) or
         (SakumotuCD = '06' ) then begin
        TableN := 'M_SEHI_T';
        SQL.Text := 'Select * from '+TableN+
                    ' Where ��ڃR�[�h = "'+SakumokuCD+'" and '+
                    '�앨�R�[�h = "'+SakumotuCD+'" and '+
                    '��^�R�[�h = "'+SakugataCD+'"';

      end
      else begin
        TableN := 'M_SEHI_S';
        TitaiCD := UketukeQuery.FieldByName('����n�ы敪').asString;
        DojoCD := UketukeQuery.FieldByName('����y��R�[�h').asString;
        if (SakumotuCD = '01') or(SakumotuCD = '03')then //�{�c �@�����c�@{�H����=03}
          SQL.Text := 'Select �S�w�{�� as N,��N as P,�J��N as K,��y as Mg from '+TableN+
                      ' Where �n�ы敪='''+TitaiCD+''' and �y��敪='''+DojoCD + ''''
        else if SakumotuCD = '02' then  //�����
//H171114          SQL.Text := 'Select �S���S�w��+�S������ as N,��N as P,�J��N as K,��y as Mg from '+TableN+
//                      ' Where �n�ы敪='''+TitaiCD+''' and �y��敪='''+DojoCD + ''''
          SQL.Text := 'Select �S���S�w�� as N,�S������ as N2,��N as P,�J��N as K,��y as Mg from '+TableN+
                      ' Where �n�ы敪='''+TitaiCD+''' and �y��敪='''+DojoCD + ''''
        else if SakumotuCD = '04' then //����y
          SQL.Text := 'Select �S�w�{�� as N,��N as P,�J��N as K,��y as Mg from '+TableN+
                      ' Where �n�ы敪='''+TitaiCD+''' and �y��敪='''+DojoCD + ''''
        else if SakumotuCD = '07' then //����y
          SQL.Text := 'Select �S���S�w�� as N,�S������ as N2,��N as P,�J��N as K,��y as Mg from '+TableN+
                      ' Where �n�ы敪='''+TitaiCD+''' and �y��敪='''+DojoCD + ''''
        else  //�ȊO�͑S�ĂO
          ;
      end;

    end else
    if SakumokuCD = '2' then begin
        TableN := 'M_SEHI_H';
        TitaiCD := UketukeQuery.FieldByName('�W���n�ы敪').asString;
        DojoCD := UketukeQuery.FieldByName('���q�y��R�[�h').asString;
        SQL.Text := 'Select * from '+TableN+' Where ��ڃR�[�h='''+SakumokuCD+''' and �앨�R�[�h='''+SakumotuCD+
                    ''' and  �n�ы敪='''+TitaiCD+''' and �y��敪='''+DojoCD + '''';
    end else
    if IsEngei then begin
        TableN := 'M_SEHI_E';
        TitaiCD := '';
        DojoCD := UketukeQuery.FieldByName('���q�y��R�[�h').asString;
        SQL.Text := 'Select * from '+TableN+' Where ��ڃR�[�h='''+SakumokuCD+''' and �앨�R�[�h='''+SakumotuCD+
                    ''' and  ��^�R�[�h='''+SakugataCD+''' and �y��敪='''+DojoCD + '''';
    end else
    if IsKusa then begin
        TableN := 'M_SEHI_B';
        TitaiCD := UketukeQuery.FieldByName('�W���n�ы敪').asString;
        DojoCD := UketukeQuery.FieldByName('���q�y��R�[�h').asString;
        SQL.Text := 'Select * from '+TableN+' Where ��ڃR�[�h='''+SakumokuCD+''' and �앨�R�[�h='''+SakumotuCD+
                    ''' and  ��^�R�[�h='''+SakugataCD+''' and  �n�ы敪='''+TitaiCD+''' and �y��敪='''+DojoCD + '''';
    end;
    //�N�G���[�������͂O�l
    if SQL.Text <> '' then begin
      Open;
      if RecordCount = 0 then begin
        Close;
        exit; //�O�l
      end;

//H171220  �{��W��
      //���|�̏ꍇ���{�l���擾����B
      if IsEngei then begin
        result.Motohi.N := FieldByName('���N2').asFloat ;    {�����ɂ��W���l�Q�Ƃ��Ⴄ}
        result.Motohi.P := FieldByName('���P3').asFloat ;
        result.Motohi.K := FieldByName('���K3').asFloat ;
        result.Motohi.M := FieldByName('Mg').asFloat ;

        result.Suijyun.N := FieldByName('��������N').asInteger;

        //�ǔ�͕��{�P�ɒl�������邪�A���v�̎Z�o�Ώۂɂ͕��{�P�͂Ȃ�Ȃ�
//        if FieldByName('�Ǖ�����N').asInteger >= 0 then //�ǔ�͊��Ɠ���
          result.Sehi1.N := FieldByName('���{1N2').asFloat;
//        if FieldByName('�Ǖ�����P').asInteger >= 0 then //�ǔ�͊��Ɠ���
          result.Sehi1.P := FieldByName('���{1P3').asFloat;
//        if FieldByName('�Ǖ�����K').asInteger >= 0 then //�ǔ�͊��Ɠ���
          result.Sehi1.K := FieldByName('���{1K3').asFloat;

//        if FieldByName('�Ǖ�����N').asInteger >= 2 then //���{2��ȏ�
          result.Sehi2.N := FieldByName('���{2N2').asFloat;
//        if FieldByName('�Ǖ�����P').asInteger >= 2 then //���{2��ȏ�
          result.Sehi2.P := FieldByName('���{2P3').asFloat;
//        if FieldByName('�Ǖ�����K').asInteger >= 2 then //���{2��ȏ�
          result.Sehi2.K := FieldByName('���{2K3').asFloat;
        {���{�l�͒��f�̎{���}
//        if FieldByName('�Ǖ�����N').asInteger >= 1 then //���{1��ȏ�
          result.Kaisu := FieldByName('�Ǖ�����N').asInteger;
        {���v�Z�o:�}�X�^�̍��v���ڂłȂ��A���f�̕��{�񐔂���Z�o����
        ���R�F�}�X�^�����e���o�R���Ȃ��Ƃ����v�l���Z�o����Ȃ�����}
(*
        result.Sum.N := FieldByName('N').asFloat ;
        result.Sum.P := FieldByName('P').asFloat ;
        result.Sum.K := FieldByName('K').asFloat ;
*)
        NKaisu :=  FieldByName('�Ǖ�����N').asInteger ;
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
      //H141114 ����
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

        //result.Kaisu := FieldByName('�ǔ��').asInteger;

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
      //����@�i�`���΂���Ł@�ǔ�
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
                result.kaisu := FieldByName('���{��').asinteger;
//    result.Kaisu := 0;

     end
     else begin   //���|�ȊO�͊��̂�
//        if IsKusa then begin   //�q���͎{����͂��邪�A�}�X�^�ɂ͂Ȃ�
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
//   �f�f�{��ʁ@�Z�o
/////////////////////////////
//NISHI0511 GetSehiValue
function GetSehiValue(UketukeQuery : TADOQuery ): TRecStandard;
var
  SakumokuCD,SakumotuCD,SakugataCD : string ;
  TableN,TitaiCD,DojoCD : string ;
  IsEngei,IsKusa : Boolean;  {���|�앨}
  NKaisu : integer ;  {���f���{�񐔁F�ʏ퍇�v�̎{��񐔂𐬕����ʂœK�p}
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
  SakumokuCD := UketukeQuery.FieldByName('��ڃR�[�h').asString;
  SakumotuCD := UketukeQuery.FieldByName('�앨�R�[�h').asString;
  SakugataCD := UketukeQuery.FieldByName('��^�R�[�h').asString;
  IsEngei := (SakumokuCD = '3') or (SakumokuCD = '4') or (SakumokuCD = '5') ;{���|�앨��}
  IsKusa  := (SakumokuCD = '6') or (SakumokuCD = '7') ;{�q��}


  //�y����ǎ��ޗ�  H160705
    // Pram�ɃT���v���ԍ������
//    stmp2 := UketukeQuery.FieldByName('�T���v���ԍ�').asString;
//    PrintModule1.QuerySindan.ParamByName('�T���v���ԍ�').asString := UketukeQuery.FieldByName('�T���v���ԍ�').asString;
//    PrintModule1.QuerySindan.Open;

   PrintModule1.ADOQuerySindan.close;
  PrintModule1.ADOQuerySindan.SQL.Clear;
  stmp := 'select * from T_SINDAN where �T���v���ԍ� = "'+ UketukeQuery.FieldByName('�T���v���ԍ�').asString + '"';
  PrintModule1.ADOQuerySindan.SQL.add(stmp);
  PrintModule1.ADOQuerySindan.Open;





    with PrintModule1.ADOQuerySindan do begin
      for i := 1 to 4 do begin
         stmp2 := '�y���ރR�[�h'+InttoStr(i);
         dcode := FieldByName(stmp2).asString;
//         stmp := ' '+GetDokaizaiName(dcode);
//         RectAndText(lmRECT,tlCENTER,taLeft,XX1+8,YY3+YY2,65,5,11,stmp,ftNORMAL);
         stmp2 := '�y���ޗ�'+InttoStr(i);
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

    Dositu := (StrtoIntDef(UketukeQuery.FieldByName('�y��R�[�h').asString,0)div 10)*10 + StrtoIntdef(UketukeQuery.FieldByName('�y���R�[�h').asString,0);
    coeP := Rinsankeisuu( Dositu, UketukeQuery.FieldByName('�����z').asFloat);



//�y����ǎ��ނ��l��
//    P2 := UketukeQuery.FieldByName('�g���I�[�OP').asfloat + (dallP / coeP);
//�l�����Ȃ�
    P2 := UketukeQuery.FieldByName('�g���I�[�OP').asfloat;




  with DataModule1.QueryRead do begin
    Close;
    SQL.Text := '';
    if SakumokuCD = '1' then begin
        TableN := 'M_SEHI_S';
        TitaiCD := UketukeQuery.FieldByName('����n�ы敪').asString;
        DojoCD := UketukeQuery.FieldByName('����y��R�[�h').asString;
        if (SakumotuCD = '01') or(SakumotuCD = '03')then //�{�c {�H����=03}
          SQL.Text := 'Select �S�w�{�� as N,��N as P,�J��N as K,��y as Mg from '+TableN+
                      ' Where �n�ы敪='''+TitaiCD+''' and �y��敪='''+DojoCD + ''''
        else if SakumotuCD = '02' then  //�����
//H171114          SQL.Text := 'Select �S���S�w��+�S������ as N,��N as P,�J��N as K,��y as Mg from '+TableN+
//                      ' Where �n�ы敪='''+TitaiCD+''' and �y��敪='''+DojoCD + ''''
          SQL.Text := 'Select �S���S�w�� as N,�S������ as N2,��N as P,�J��N as K,��y as Mg from '+TableN+
                      ' Where �n�ы敪='''+TitaiCD+''' and �y��敪='''+DojoCD + ''''
        else if SakumotuCD = '04' then //����y
          SQL.Text := 'Select �S�w�{�� as N,��N as P,�J��N as K,��y as Mg from '+TableN+
                      ' Where �n�ы敪='''+TitaiCD+''' and �y��敪='''+DojoCD + ''''
        else  //�ȊO�͑S�ĂO
          ;

 //����̊ NISHI0525


    end else
    if SakumokuCD = '2' then begin
        TableN := 'M_SEHI_H';
        TitaiCD := UketukeQuery.FieldByName('�W���n�ы敪').asString;
        DojoCD := UketukeQuery.FieldByName('���q�y��R�[�h').asString;
        SQL.Text := 'Select * from '+TableN+' Where ��ڃR�[�h='''+SakumokuCD+''' and �앨�R�[�h='''+SakumotuCD+
                     ''' and  �n�ы敪='''+TitaiCD+''' and �y��敪='''+DojoCD + '''';

           result.Nkijyun1 := 0;
           result.Nkijyun2 := 0;


    end else
    if IsEngei then begin
        TableN := 'M_SEHI_E';
        TitaiCD := '';
        DojoCD := UketukeQuery.FieldByName('���q�y��R�[�h').asString;
        SQL.Text := 'Select * from '+TableN+' Where ��ڃR�[�h='''+SakumokuCD+''' and �앨�R�[�h='''+SakumotuCD+
                    ''' and  ��^�R�[�h='''+SakugataCD+''' and �y��敪='''+DojoCD + '''';
    end else
    if IsKusa then begin
        TableN := 'M_SEHI_B';
        TitaiCD := UketukeQuery.FieldByName('�W���n�ы敪').asString;
        DojoCD := UketukeQuery.FieldByName('���q�y��R�[�h').asString;
        SQL.Text := 'Select * from '+TableN+' Where ��ڃR�[�h='''+SakumokuCD+''' and �앨�R�[�h='''+SakumotuCD+
                    ''' and  ��^�R�[�h='''+SakugataCD+''' and  �n�ы敪='''+TitaiCD+''' and �y��敪='''+DojoCD + '''';
    end;
    //�N�G���[�������͂O�l
    if SQL.Text <> '' then begin
      Open;
      if RecordCount = 0 then begin
        Close;
        exit; //�O�l
      end;
      //���|�̏ꍇ���{�l���擾����B
      if IsEngei then begin
        //���f�̎��
        Nkoumoku := '���N2';
        Ncount := '2';
        if FieldByName('��������N').asInteger = 1 then begin // �Ɏ_�Ԓ��f
           Nnn := UketukeQuery.FieldByName('�Ɏ_��N').asfloat;
           Nc1 := FieldByName('�N11').asFloat ;
           Nc2 := FieldByName('�N12').asFloat ;
           Nc3 := FieldByName('�N13').asFloat ;      //H161130  N12�ɂȂ��Ă���
           Nc4 := FieldByName('�N14').asFloat ;

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
           Nkoumoku := '���N'+Ncount;
        end
        else if FieldByName('��������N').asInteger = 2 then begin // ���Ԓ��f
//           Nnn := UketukeQuery.FieldByName('����N').asfloat;
           Nnn := UketukeQuery.FieldByName('�M���oN').asfloat;
           //�M���o�����f�@�Œ�
           Nc1 := FieldByName('�N21').asFloat ;
           Nc2 := FieldByName('�N22').asFloat ;

           result.Nkijyun1 := Nc1;
           result.Nkijyun2 := Nc2;



           Ncount := '3';
           if Nnn < Nc1 then begin
              Ncount := '1';
           end
           else if Nnn < Nc2 then begin
              Ncount := '2';
           end;
           Nkoumoku := '���N'+Ncount;
        end;

        //�����_�̎��
        Pkoumoku := '���P3';
        Pcount := '3';
        if FieldByName('��������P').asInteger = 1 then begin // ���ނ���


           //�f�f��̒l

           Nnn := P2;
           //UketukeQuery.FieldByName('�g���I�[�OP').asfloat;




           Nc1 := FieldByName('�P11').asFloat ;
           Nc2 := FieldByName('�P12').asFloat ;
           Nc3 := FieldByName('�P13').asFloat ;
           Nc4 := FieldByName('�P14').asFloat ;

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
           Pkoumoku := '���P'+Pcount;
        end ;

        //�����̎��
        Kkoumoku := '���K3';
        Kcount := '3';

        if FieldByName('��������K').asInteger > 0 then begin // �Ɏ_�Ԓ��f

            cec := UketukeQuery.FieldByName('CEC').asfloat;

            Kcount2 := '1';
            if FieldByName('��������K').asInteger = 3 then begin

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
            Kkoumoku := '�K'+Kcount2+'1';   //�K11
            Nc1 := FieldByName(Kkoumoku).asFloat ;
            Kkoumoku := '�K'+Kcount2+'2';
            Nc2 := FieldByName(Kkoumoku).asFloat ;
            Kkoumoku := '�K'+Kcount2+'3';
            Nc3 := FieldByName(Kkoumoku).asFloat ;
            Kkoumoku := '�K'+Kcount2+'4';
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
              Kcount := '5';    //H161210  �ȏ�
           end;
           Kkoumoku := '���K'+Kcount;
        end;


        result.Motohi.N := FieldByName(Nkoumoku).asFloat ;    {�����ɂ��W���l�Q�Ƃ��Ⴄ}
        result.Motohi.P := FieldByName(Pkoumoku).asFloat ;
        result.Motohi.K := FieldByName(Kkoumoku).asFloat ;
        result.Motohi.M := FieldByName('Mg').asFloat ;
        //�ǔ�͕��{�P�ɒl�������邪�A���v�̎Z�o�Ώۂɂ͕��{�P�͂Ȃ�Ȃ�
        //H171220 �f�f�{��

        if FieldByName('�Ǖ�����N').asInteger <> 0 then begin //�ǔ�͊��Ɠ���
          if abs(FieldByName('�Ǖ�����N').asInteger) < 10 then begin
             Nkoumoku := '���{1N'+Ncount;//inttostr(abs(FieldByName('�Ǖ�����N').asInteger)); //Ncount;
             result.Sehi1.N := FieldByName(Nkoumoku).asFloat;
          end
          else begin
             Nkoumoku := '���{1N'+Ncount;
             result.Sehi1.N := FieldByName(Nkoumoku).asFloat;
             Nkoumoku := '���{2N'+Ncount;//2'; //Ncount;
             result.Sehi2.N := FieldByName(Nkoumoku).asFloat;
          end;
        end;
        if FieldByName('�Ǖ�����P').asInteger <> 0 then begin //�ǔ�͊��Ɠ���
          Pkoumoku := '���{1P'+Pcount; //inttostr(abs(FieldByName('�Ǖ�����P').asInteger));//Pcount;
          result.Sehi1.P := FieldByName(Pkoumoku).asFloat;
        end;
        if FieldByName('�Ǖ�����K').asInteger <> 0 then begin //�ǔ�͊��Ɠ���
          Kkoumoku := '���{1K'+Kcount; //inttostr(abs(FieldByName('�Ǖ�����K').asInteger));//Kcount;
          result.Sehi1.K := FieldByName(Kkoumoku).asFloat;
        end;
{
        if FieldByName('�Ǖ�����N').asInteger >= 2 then begin//���{2��ȏ�
          Nkoumoku := '���{2N'+Ncount;
          result.Sehi2.N := FieldByName(Nkoumoku).asFloat;
        end;
        if FieldByName('�Ǖ�����P').asInteger >= 2 then begin//���{2��ȏ�
          Pkoumoku := '���{2P'+Pcount;
          result.Sehi2.P := FieldByName(Pkoumoku).asFloat;
        end;
        if FieldByName('�Ǖ�����K').asInteger >= 2 then begin //���{2��ȏ�
          Kkoumoku := '���{2K'+Kcount;
          result.Sehi2.K := FieldByName(Kkoumoku).asFloat;
        end;
}
        {���{�l�͒��f�̎{���}
//        if FieldByName('�Ǖ�����N').asInteger >= 1 then //���{1��ȏ�
        result.Kaisu := FieldByName('�Ǖ�����N').asInteger;
        {���v�Z�o:�}�X�^�̍��v���ڂłȂ��A���f�̕��{�񐔂���Z�o����
        ���R�F�}�X�^�����e���o�R���Ȃ��Ƃ����v�l���Z�o����Ȃ�����}
(*
        result.Sum.N := FieldByName('N').asFloat ;
        result.Sum.P := FieldByName('P').asFloat ;
        result.Sum.K := FieldByName('K').asFloat ;
*)
//        NKaisu :=  FieldByName('�Ǖ�����N').asInteger ;
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
      //���� JA���΂���Ł@
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
        //��x�Ɏ{�p�ł���l�`�w
        result.NMax := FieldByName('NMax').asFloat;
        //���΂���@H190528 �H�܂������̂�
        if (SakumotuCD = '01' ) then
            result.Kaisu := -1
        else
            result.Kaisu := 0;

      end
      else begin   //���|�ȊO�͊��̂�
        if IsKusa then begin   //�q���͎{����͂��邪�A�}�X�^�ɂ͂Ȃ�
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
  �R�����g�}�X�^�擾�F
  IN:��ځA�앨�A��^�R�[�h
}
function GetComment( CD1,CD2,CD3 : string ) : string ;
begin
  result := '';
  with DataModule1.QueryRead do begin
    Close;
    SQL.Text := 'Select ���� from M_COMENT where ��ڃR�[�h='''+CD1+''' and �앨�R�[�h='''+CD2+''' and ��^�R�[�h='''+CD3+'''';
    Open;
    if RecordCount > 0 then
      result :=  FieldByName('����').asString;
    Close;
  end;
end;
{
  �f�f�e�[�u���w�背�R�[�h�폜�i�t���O�j�Z�b�g
}
procedure    DelFlagSindanTable(aSmpNO : string );
begin


  with DataModule1.QueryWrite do begin
    SQL.Text := 'Update T_SINDAN set �폜�t���O=True,�ҏW��=:�ҏW�� where �T���v���ԍ�='''+aSmpNO+'''';
//    ParamByName('�ҏW��').asDateTime := now;
    Parameters.ParamByName('�ҏW��').Value := now;
    ExecSQL ;
  end;


  end;
{
  �f�f�e�[�u�����R�[�h�쐬
}
procedure    InsertSindanTable(aSmpNO : string );
begin
  with DataModule1.QueryWrite do begin
    SQL.Text := 'Insert into T_SINDAN (�T���v���ԍ�,�ҏW��,SIM�v�Z��,�폜�t���O) '+
                'values ('''+aSmpNO+''',:�ҏW��,False,False)';
    Parameters.ParamByName('�ҏW��').Value := now;
    ExecSQL ;
  end;
{
  with DataModule1.QueryWrite do begin
    SQL.Text := 'Insert into T_SINDAN (�T���v���ԍ�,�ҏW��,SIM�v�Z��,�폜�t���O) '+
                'values ('''+aSmpNO+''',:�ҏW��,False,False)';
    ParamByName('�ҏW��').asDateTime := now;
    ExecSQL ;
  end;
 }
 end;
{
  �ҏW�\�T���v���ԍ����H
}
function IsEditRec(aNO : string):Boolean;
var
  iNum : integer;
begin
  try
    iNum := StrToIntDef(aNO, 0);// iNum := StrtoInt( aNO );
  except    //�V�K�̃L�����Z���̎��ȂǁADataSet���Ȃ��ꍇ
    iNum := 0 ;
  end;                                                       //��P.D ���[�h�łȂ�����
  result := (EntryStart <= iNum )and( iNum <= EntryStop) and not P_MODE ;
end;
{
  ����@���f�{��Ή�
  N ���f�l
  mode 0 �S�w
  mode 1 ����
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


    //�y�딻��
    //����y��R�[�h�@��n�y�@���A�܂ވȊO
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

    //���R�[�h�̈ړ�
	Locate('�n�ы敪;�y��R�[�h',VarArrayOf([titai,dc]), []);


    sb := 0.0;
    if mode = 1 then begin  //����
      ans := FieldByName('�����{���5').AsFloat;
      for i := 1 to 4 do begin
        stmp := '�'+InttoStr(i);
        eb := FieldByName(stmp).AsFloat;
        if (sb <= N ) and ( eb > N ) then begin
            stmp := '�����{���'+InttoStr(i);
            ans := FieldByName(stmp).AsFloat;
        end;
        sb := eb;
      end;
    end
    else begin  //�S�w
      ans := FieldByName('�{���5').AsFloat;
      for i := 1 to 4 do begin
        stmp := '�'+InttoStr(i);
        eb := FieldByName(stmp).AsFloat;
        if (sb <= N ) and ( eb > N ) then begin
            stmp := '�{���'+InttoStr(i);
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
  ����@�����_�{��Ή�
  P �����_�l
  dcode �y��R�[�h
  code ���A�R�[�h
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


    //�y�딻��
    //����y��R�[�h�@��n�y�@���A�܂ވȊO
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
        stmp := '��l'+InttoStr(i);
        eb := FieldByName(stmp).AsFloat;
        if (sb <= P ) and ( eb > P ) then begin
            stmp := '�y��'+InttoStr(i)+InttoStr(fc)+'�{���';
            ans := FieldByName(stmp).AsFloat;
        end;
        sb := eb;
    end;
    Close;
  end;
  result := ans;

end;
{
  ����@�J���{��Ή�
  K �����l
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
        stmp := '��l'+InttoStr(i);
        eb := FieldByName(stmp).AsFloat;
        if (sb <= K ) and ( eb > K ) then begin
            stmp := '�{���'+InttoStr(i);
            ans := FieldByName(stmp).AsFloat;
        end;
        sb := eb;
    end;
    Close;
  end;
  result := ans;

end;
{
  ����@��y�{��Ή�
  M ��y�l
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
        stmp := '��l'+InttoStr(i);
        eb := FieldByName(stmp).AsFloat;
        if (sb <= M ) and ( eb > M ) then begin
            stmp := '�{���'+InttoStr(i);
            ans := FieldByName(stmp).AsFloat;
        end;
        sb := eb;
    end;
    Close;
  end;
  result := ans;

end;

//�����_�z���W��
// Dosei �y�� Rin ���z
function Rinsankeisuu( Dositu : integer; Rin : double) : double;
var
coeP : double;
PKeisu : integer;
begin
  //�����_�z�{�� �\�Q �����_�z���W���~�y��{�y�� �̃����_�{���\
  coeP := 0;
//  with QueryUketuke do begin
//    Dositu := (StrtoIntDef(FieldByName('�y��R�[�h').asString,0)div 10)*10 + StrtoIntdef(FieldByName('�y���R�[�h').asString,0);
//    if FieldByName('�����z').isnull then PKeisu := 0
    if (Rin > 0 )and( Rin <= 700 ) then PKeisu := 1
    else if (Rin > 700 )and( Rin <= 1500 ) then PKeisu := 2
    else if (Rin > 1500 )and( Rin <= 2000 ) then PKeisu := 3
    else PKeisu := 1;
//    else PKeisu := 0;
//  end;
  case Dositu of
  11..12:  //��n�y�{S,SL
    case PKeisu of  //�����z�W��
    0: coeP := 1.0; 1: coeP := 2.0;  2: coeP := 2.5;  3: coeP := 3.0;  4: coeP := 3.5;
    end;
  13..17:  //��n�y�{L,CL,C,���A,�D�Y
    case PKeisu of  //�����z�W��
    0: coeP := 1.0;1: coeP := 2.5;  2: coeP := 3.0;  3: coeP := 3.5;  4: coeP := 4.0;
    end;
  20..29:  //�D�Y�y
    case PKeisu of  //�����z�W��
    0: coeP := 1.0;1: coeP := 3.0;  2: coeP := 3.5;  3: coeP := 4.0;  4: coeP := 4.5;
    end;
  31..32:  //�ΎR�y�{S,SL
    case PKeisu of  //�����z�W��
    0: coeP := 1.0;1: coeP := 3.5;  2: coeP := 4.0;  3: coeP := 4.5;  4: coeP := 5.0;
    end;
  33..37:  //�ΎR�y�{L,CL,C,���A,�D�Y
    case PKeisu of  //�����z�W��
    0: coeP := 1.0;1: coeP := 4.5;  2: coeP := 5.0;  3: coeP := 5.5;  4: coeP := 6.0;
    end;
  41..42:  //��n�y�{S,SL
    case PKeisu of  //�����z�W��
    0: coeP := 1.0;1: coeP := 2.5;  2: coeP := 3.0;  3: coeP := 3.5;  4: coeP := 4.0;
    end;
  43..47:  //��n�y�{L,CL,C,���A,�D�Y
    case PKeisu of  //�����z�W��
    0: coeP := 1.0;1: coeP := 3.0;  2: coeP := 3.5;  3: coeP := 4.0;  4: coeP := 4.5;
    end;
  end;


  result := coeP;

end;
{
   �]�J���K�v�ʂ��Z�o�i�y�납��A�P�C�_�l����j
}
function GetKeiCal( aCode : string ) : double ; overload ;    //�y�납��
begin
//  if aCode = '10' then result := 110
  if aCode = '11' then result := 105 //110
  else if aCode = '12' then result := 135 //140
  else if aCode = '13' then result := 165 //170
  else if aCode[1] = '1' then result := 135 //140  //�ǉ� H150826
  else if aCode[1] = '2' then result := 165 //170
  else if aCode[1] = '3' then result := 135 //140
  else if aCode[1] = '4' then result := 135 //140
  else result := 0;
end;

function GetKeiCal( aKeisan : double; dcode : string ) : double ; overload ;   //�P�C�_�l����
var
btmp : double;
btmp2 : double;
begin

  if aKeisan <= 0.0 then begin
     result := 0;
  end
  else if (dcode = '16') or (dcode = '20') or (dcode = '21') then begin //�O���C�y�A�D�Y�y�́A�����l
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


{��yme/100mg}
function KudoMe( aValue : double ) : double;
begin
	result := aValue / 20.2 ;
end;
{�ΊDme/100mg}
function SekkaiMe( aValue : double ) : double;
begin
	result := aValue / 28.0 ;
end;
{����me/100mg}
function KariMe( aValue : double ) : double;
begin
	result := aValue / 47.1 ;
end;
{�����_me/100mg}
function RinsanMe( aValue : double ) : double;
begin
	result := aValue / 62.97 ;
end;

function GetConnection() : String ;  //�f�[�^�x�[�X�ڑ�
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



 //�`����������
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


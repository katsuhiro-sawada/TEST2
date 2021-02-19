unit MainU;
{
  メーン画面：事前のデータモジュールユニットの生成が必要
}

//　元システム　
//  Ver 3.9.0  R2.3.17　オホーツク



//  Ver 0.00    2020/9/11  A.Nishimura  基本作成
//  Ver 0.17    2021/2/3  A.Nishimura  基本作成 骨格ができたくらい








Interface

uses
  Windows, Messages, SysUtils, StrUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus,FileCtrl,IniFiles, ExtCtrls, Buttons,
  ToolWin, ImgList, ActnList, StdCtrls, jpeg,shellapi,Printers,
  System.ImageList, System.Actions,  VCLTee.TeCanvas, ButtonEx, BitBtnEx,
  IOUtils, Types, Vcl.Imaging.pngimage;

type
	TMFState = (mfChgHomeDir, mfChgCenterDir, mfGetSync, mfChgMstDir, mfGetMst,mfEnd );
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    nmExit: TMenuItem;
    Uketuke1: TMenuItem;
    nmUketuke: TMenuItem;
    nmUkeList: TMenuItem;
    nmMaster: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Tool1: TMenuItem;
    N1: TMenuItem;
    Bunseki: TMenuItem;
    nmBunseki: TMenuItem;
    Sindan: TMenuItem;
    nmSindanPrn: TMenuItem;
    nmSetCenter: TMenuItem;
    nmSetYear: TMenuItem;
    nmSetNetWork: TMenuItem;
    nmNoukyou: TMenuItem;
    nmTiku: TMenuItem;
    nmSizai: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    StatusBar1: TStatusBar;
    nmBuildYear: TMenuItem;
    M1: TMenuItem;
    nmKijun: TMenuItem;
    ActionList1: TActionList;
    ActUketuke: TAction;
    ActBunseki: TAction;
    ActSindan: TAction;
    ActSync: TAction;
    ImageList1: TImageList;
    ActExit: TAction;
    nmColor: TMenuItem;
    ColorDialog1: TColorDialog;
    OpenDialog1: TOpenDialog;
    nmDokaizai: TMenuItem;
    nmYuuki: TMenuItem;
    ActSehi: TAction;
    SaveDialog1: TSaveDialog;
    nmKasei: TMenuItem;
    nmTanpi: TMenuItem;
    ActionSim: TAction;
    nmSetHiryo: TMenuItem;
    N3: TMenuItem;
    ActSintyoku: TAction;
    N4: TMenuItem;
    ActTaihi: TAction;
    MainMenu2: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem55: TMenuItem;
    MenuItem56: TMenuItem;
    MenuItem57: TMenuItem;
    MenuItem58: TMenuItem;
    MenuItem59: TMenuItem;
    MenuItem60: TMenuItem;
    MenuItem61: TMenuItem;
    MenuItem62: TMenuItem;
    MenuItem63: TMenuItem;
    MenuItem64: TMenuItem;
    MenuItem65: TMenuItem;
    MenuItem66: TMenuItem;
    MenuItem67: TMenuItem;
    MenuItem68: TMenuItem;
    MenuItem69: TMenuItem;
    MenuItem70: TMenuItem;
    MenuItem71: TMenuItem;
    MenuItem72: TMenuItem;
    MenuItem73: TMenuItem;
    MenuItem74: TMenuItem;
    MenuItem75: TMenuItem;
    MenuItem76: TMenuItem;
    MenuItem77: TMenuItem;
    N011: TMenuItem;
    N021: TMenuItem;
    N022: TMenuItem;
    N023: TMenuItem;
    N051: TMenuItem;
    Y1: TMenuItem;
    D1: TMenuItem;
    T1: TMenuItem;
    K2: TMenuItem;
    S2: TMenuItem;
    Y2: TMenuItem;
    Y3: TMenuItem;
    Y4: TMenuItem;
    Y5: TMenuItem;
    D2: TMenuItem;
    D3: TMenuItem;
    D4: TMenuItem;
    D5: TMenuItem;
    T2: TMenuItem;
    T3: TMenuItem;
    T4: TMenuItem;
    T5: TMenuItem;
    K3: TMenuItem;
    K4: TMenuItem;
    K5: TMenuItem;
    K6: TMenuItem;
    S3: TMenuItem;
    S4: TMenuItem;
    S5: TMenuItem;
    S6: TMenuItem;
    N61: TMenuItem;
    N71: TMenuItem;
    Y6: TMenuItem;
    Y7: TMenuItem;
    D6: TMenuItem;
    D7: TMenuItem;
    T6: TMenuItem;
    T7: TMenuItem;
    K7: TMenuItem;
    K8: TMenuItem;
    S7: TMenuItem;
    S8: TMenuItem;
    N12: TMenuItem;
    Y8: TMenuItem;
    D8: TMenuItem;
    T8: TMenuItem;
    K9: TMenuItem;
    S9: TMenuItem;
    ActKanni: TAction;
    T9: TMenuItem;
    ActShindanTaihi: TAction;
    ActShindanSiryou: TAction;
    ActBunseki2: TAction;
    ActBunseki3: TAction;
    ActUkeSiryou: TAction;
    T12: TMenuItem;
    S12: TMenuItem;
    uketuke001: TAction;
    uketuke002: TAction;
    uketuke003: TAction;
    uketuke004: TAction;
    uketuke005: TAction;
    uketuke007: TAction;
    uketuke008: TAction;
    N41: TMenuItem;
    N14: TMenuItem;
    N72: TMenuItem;
    DON81: TMenuItem;
    PanelLeft: TPanel;
    PanelAppName: TPanel;
    lblAppName: TLabel;
    PanelVersion: TPanel;
    MsgLabel2: TStaticText;
    CbJAName: TComboBox;
    CbNendo: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    PanelClient: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Panel4: TPanel;
    Image2: TImage;
    Panel1: TPanel;
    Image1: TImage;
    Timer1: TTimer;
    G1: TMenuItem;
    btnUketuke: TButtonEx;
    btnExit: TBitBtnEx;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Image3: TImage;
    btnBunseki: TButtonEx;
    c: TButtonEx;
    BitBtn6: TButtonEx;
    btnMaster: TButtonEx;
    ButtonEx2: TButtonEx;
    ButtonEx3: TButtonEx;
    SpSintyoku: TButtonEx;
    btnSim: TButtonEx;
    Label10: TLabel;
    Label11: TLabel;
    ActMaster: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure nmNoukyouClick(Sender: TObject);
    procedure nmNoukaClick(Sender: TObject);
    procedure nmDojouClick(Sender: TObject);
    procedure nmDoseiClick(Sender: TObject);
    procedure nmFushokuClick(Sender: TObject);
    procedure nmCenterClick(Sender: TObject);
    procedure nmCityClick(Sender: TObject);
    procedure nmTikuClick(Sender: TObject);
    procedure nmSizaiClick(Sender: TObject);
    procedure nmSakumokuClick(Sender: TObject);
    procedure nmSakumotuClick(Sender: TObject);
    procedure nmSakugataClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure nmHojouClick(Sender: TObject);
    procedure nmSetCenterClick(Sender: TObject);
    procedure nmSetYearClick(Sender: TObject);
    procedure nmBuildYearClick(Sender: TObject);
    procedure nmManuDataCopyClick(Sender: TObject);
    procedure nmKijunClick(Sender: TObject);
    procedure ActUketukeExecute(Sender: TObject);
    procedure ActBunsekiExecute(Sender: TObject);
    procedure ActSindanExecute(Sender: TObject);
    procedure ActExitExecute(Sender: TObject);
    procedure nmColorClick(Sender: TObject);
    procedure btnFTPClick(Sender: TObject);

    procedure btnloginClick(Sender: TObject);
    procedure btnlogoutClick(Sender: TObject);

    procedure nmSetNetWorkClick(Sender: TObject);
    procedure nmExpDataClick(Sender: TObject);
    procedure nmExpMstClick(Sender: TObject);
    procedure nmImpDataClick(Sender: TObject);
    procedure nmImpMstClick(Sender: TObject);
    procedure nmDokaizaiClick(Sender: TObject);

    procedure btnClearClick(Sender: TObject);

    procedure nmExUkeClick(Sender: TObject);
    procedure nmExBunClick(Sender: TObject);
    procedure nmImpNoukaClick(Sender: TObject);
    procedure nmImpHojoClick(Sender: TObject);
    procedure nmExpNoukaClick(Sender: TObject);
    procedure nmExpHojoClick(Sender: TObject);
    procedure ActSehiExecute(Sender: TObject);
    procedure nmTanpiClick(Sender: TObject);
    procedure nmKaseiClick(Sender: TObject);
    procedure ActionSimExecute(Sender: TObject);
    procedure nmSetHiryoClick(Sender: TObject);
    procedure nmSehiHatakeClick(Sender: TObject);
    procedure nmSehiSuiClick(Sender: TObject);
    procedure nmSehiEngeiClick(Sender: TObject);
    procedure nmSehiBokuClick(Sender: TObject);
    procedure nmJikouClick(Sender: TObject);
    procedure nmEditMsgClick(Sender: TObject);
    procedure nmUkeListClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure nmFontColorClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure K1Click(Sender: TObject);
    procedure M2Click(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure ActSintyokuExecute(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure ActTaihiExecute(Sender: TObject);
    procedure Y1Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure Y2Click(Sender: TObject);
    procedure K2Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure D3Click(Sender: TObject);
    procedure D4Click(Sender: TObject);
    procedure D5Click(Sender: TObject);
    procedure Y3Click(Sender: TObject);
    procedure Y4Click(Sender: TObject);
    procedure Y5Click(Sender: TObject);
    procedure T2Click(Sender: TObject);
    procedure T3Click(Sender: TObject);
    procedure T4Click(Sender: TObject);
    procedure T5Click(Sender: TObject);
    procedure K3Click(Sender: TObject);
    procedure K4Click(Sender: TObject);
    procedure K5Click(Sender: TObject);
    procedure K6Click(Sender: TObject);
    procedure S3Click(Sender: TObject);
    procedure S4Click(Sender: TObject);
    procedure S5Click(Sender: TObject);
    procedure S6Click(Sender: TObject);
    procedure Y6Click(Sender: TObject);
    procedure Y7Click(Sender: TObject);
    procedure D6Click(Sender: TObject);
    procedure D7Click(Sender: TObject);
    procedure T6Click(Sender: TObject);
    procedure T7Click(Sender: TObject);
    procedure K7Click(Sender: TObject);
    procedure K8Click(Sender: TObject);
    procedure S7Click(Sender: TObject);
    procedure S8Click(Sender: TObject);
    procedure Y8Click(Sender: TObject);
    procedure D8Click(Sender: TObject);
    procedure T8Click(Sender: TObject);
    procedure K9Click(Sender: TObject);
    procedure S9Click(Sender: TObject);
    procedure ActKanniExecute(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure T9Click(Sender: TObject);
    procedure ActShindanTaihiExecute(Sender: TObject);
    procedure ActShindanSiryouExecute(Sender: TObject);
    procedure ActBunseki3Execute(Sender: TObject);
    procedure T10Click(Sender: TObject);
    procedure nmBukaiClick(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure S10Click(Sender: TObject);
    procedure T11Click(Sender: TObject);
    procedure S11Click(Sender: TObject);
    procedure S12Click(Sender: TObject);
    procedure T13Click(Sender: TObject);
    procedure S13Click(Sender: TObject);
    procedure K10Click(Sender: TObject);
    procedure CbJANameChange(Sender: TObject);
    procedure CbNendoChange(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure uketuke001Execute(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure uketuke002Execute(Sender: TObject);
    procedure uketuke003Execute(Sender: TObject);
    procedure uketuke004Execute(Sender: TObject);
    procedure uketuke005Execute(Sender: TObject);
    procedure uketuke007Execute(Sender: TObject);
    procedure uketuke008Execute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure NOUTIClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ActMasterExecute(Sender: TObject);

  private
    { Private 宣言 }
    FIsOnline : Boolean ;

    FIsFTPError,FIsConnected,FIsDirectoryChanged,FIsDirectoryCreated : Boolean;
    FListingDone,FIsFileRecived,FIsFileStored,FIsRenamed,FIsFileDeleted : Boolean ;
    FFTPLastError : string ;
    FMsg : TStringList ;       //サーバーメッセージ
{
    FSyncDone : Boolean ;  //同期処理結果
    MFState : TMFState ;
}
		procedure DspCaption ;
    function FTPFileExist(aFileName: string): Boolean;
    function FTPFileSize(aFileName: string): integer;
    procedure FTPRefresh;
    function FTPGetFile(aFileName: string): Boolean;
    function BackupFile(pFileName, pZipFile : string ):Boolean;
    function ImportTemp(pZipFile: string): Boolean;
    function RestoreFile(pZipFile: string): Boolean;
    procedure OnlineEnable(fOnline: Boolean);
//    procedure SetYearEnable;
    function FTPPutFile(aFileName: string): Boolean;
    function FTPFileReName( aSrcFile,  aDstFile: string ) : Boolean ;
    function FTPDeleteFile( aFileName : string ) : Boolean ;
    function FTPDirExist(aFileName: string): Boolean;
    function MakeDirectory(aDir: string): Boolean;
    function FTPChangeDir( aDir : string ) : Boolean ;
    procedure DspMsg;
  public
    { Public 宣言 }
      VSample : String;
      JpgDir    : String;
      FilesList : TStringDynArray;

      TimerCount : Integer;

      procedure FTPLogMessage( aMsg : string );
      function FTPLogin: Boolean ;
      procedure FTPLogOut ;

  end;

var
  MainForm: TMainForm;

Function Unlha(handle:THandle; szCmdline,szOutput:PChar; wSize:DWord):integer;stdcall; External 'UNLHA32.DLL';
function Zip( const aFileName , aPath , aZipFile : string ): Boolean;
function UnZip( const pZipName, pPath :string ): Boolean;
function MakePassageTime( aSize : integer ): integer ;

implementation

{$R *.DFM}

uses
  Math,DMU,MNoukyouU, MNoukaU, MDojouU, MDoseiU, MFushokuU, MCenterU, MCityU,
  MTikuU, MYuukiU, MSakumokuU, MSakumotuU, MSakugataU, AobutU, MHojouU,
  UketukeU, CenterU, YearU, LUketukeU, BunsekiU, PreviewU, M_KIJUNU,
  InputNoU, NetworkU, MDokaizaiU, DojouU, ProgressU, M_TanpiU,
  M_KaseiU, M_SakuhiU, M_Sehi_HU, M_Sehi_SU, M_Sehi_BU, M_Sehi_EU, M_CMTU,
  UJyouken,M_Bai_S_P,M_Bai_S_K,M_Bai_S_M,M_Bai_S_N,USintyoku, UFBarCodePrn,UFJCmt,
  UUkeTaihi, USousin,UUkeSiryou,UmstSehi_T,UBukai,UKingaku,UketukeUORG,
  UketukeU6,UketukeU1,UketukeU2,UketukeU3,UketukeU4,UketukeU5,UketukeU7,UketukeU8,
  UMaster;
  //MainUnit;

const
  SystemName = 'NK-Psoil(エヌ・ケイ・ピー・ソイル ) 土壌診断・施肥設計システム';
  MINTIMEOUT = 20 ; //転送時間最低タイムアウト数
  STDTIMEOUT = 10 ; //通常コマンドタイムアウト数

procedure TMainForm.FormCreate(Sender: TObject);
var
  pictfile : string ;

  VerInfoSize  : DWORD;
  VerInfo      : Pointer;
  VerValueSize : DWORD;
  VerValue     : PVSFixedFileInfo;
  Dummy        : DWORD;

begin
  FMsg := TStringList.Create;
	// Color := BackColor ;
  MsgLabel2.Font.Color := FontColor ;
//  MsgLabel.Caption := '　【送受信メッセージ】';
//	Caption := SystemName  ;



  // アプリケーション名の表示
  lblAppName.Caption := 'NK-Psoil' + #13#10 + #13#10 + '土壌診断・施肥設計システム';



  //2019.12.11 バージョンを求める
  VerInfoSize := GetFileVersionInfoSize( PChar(ParamStr(0)), Dummy );

  GetMem(VerInfo, VerInfoSize);
  try
    GetFileVersionInfo( PChar(ParamStr(0)), 0, VerInfoSize, VerInfo );
    VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);

    with VerValue^ do begin
 //     Version := Format('Ver%d.%d.%.3d [Build:%.4d]' , [(dwFileVersionMS shr 16)
 //                                         , (dwFileVersionMS and $FFFF)
 //                                         , (dwFileVersionLS shr 16)
 //                                         , (dwFileVersionLS and $FFFF)])

      Version := Format('%d.%d.%d' , [(dwFileVersionMS shr 16)
                                   ,  (dwFileVersionMS and $FFFF)
                                   ,  (dwFileVersionLS shr 16)]) ;

  end;
  finally
    FreeMem(VerInfo, VerInfoSize);
  end;


	Caption := SystemName; // + ' - Ver ' +Version; //AppGetInfo(Application.exename,3);
 	PanelVersion.Caption := PanelVersion.Caption + Version;















  // 初期画像貼り付け
  //pictfile := SystemIni.ReadString('system', 'picture', '' ) ;
  //if pictfile <> '' then begin
    //pictfile := 'TOP*.jpg';
    //Image1.Picture.LoadFromFile(AnsiReplaceStr(pictfile, 'TOP', 'TOP_1'));
    //Image2.Picture.LoadFromFile(AnsiReplaceStr(pictfile, 'TOP', 'TOP_2'));

    JpgDir := ExtractFileDir(Application.ExeName);
    if TDirectory.Exists(JpgDir + '\picture') then
      //ファイルのリストを取得
      //指定のパターンに一致するファイル名だけを取り出す
      FilesList := TDirectory.GetFiles(JpgDir + '\picture', '*.jpg')
    else
     FilesList := TDirectory.GetFiles(JpgDir, '*.jpg');

    if( Length(FilesList) > 0 ) then begin
      Image1.Picture.LoadFromFile(FilesList[0]);

      if( Length(FilesList) > 1 ) then
          Image2.Picture.LoadFromFile(FilesList[1])
      else
          Image2.Picture.LoadFromFile(FilesList[0]);
    end;

  //end;


  //モードの読み込み
  JMode := SystemIni.ReadString('system', 'Mode', 'Kihon' ) ;
  JBerCode := SystemIni.ReadBool('system', 'BerCode', false ) ;
  JBunseki := SystemIni.ReadBool('system', 'Bunseki', false ) ;
  JUketuke := SystemIni.ReadBool('system', 'Uketuke', false ) ;
  JMaster := SystemIni.ReadBool('system', 'Mas', false ) ;
  JFukyuu := SystemIni.ReadBool('system', 'Fukyuu', false ) ;

  FIsOnline := False ;
  //マスタ権限＆ネット使用有無の設定
  ActSync.Enabled := IsUseNet ;
  nmSetNetWork.Enabled := IsUseNet ;
  nmMaster.Enabled := IsMaster ;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//










    CloseDataBase;
    FMsg.Free ;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
barcode, jyoukenn : Boolean;
stmp : string;
itmp : integer;
sfile : string;

ii : integer;
hMenuHandle : HMENU;
AItemCnt : Integer;
begin
// データベースの接続。system.iniの内容から

//  if ChangeDataBase(EntryCenter,EntryYear) then
		DspCaption ;

  //センターマスタに登録がなければ登録を促す。
  {
  if EntryCenterName = '' then begin
	  Application.CreateForm(TmstCenterForm, mstCenterForm);
    mstCenterForm.btnNewClick(self);
    mstCenterForm.DBEdit3.Text := EntryCenter ;
    mstCenterForm.DBEdit3.Enabled := false ;
  	mstCenterForm.ShowModal ;
	  mstCenterForm.Release ;
  end;
   }
      ActSintyoku.Visible := true;
 //     btnTaihi.Visible := true;

      Menu := MainMenu1;


  //
{
  barcode := SystemIni.ReadBool('system','BerCode',false );
  if barcode then MenuItem74.Enabled := true
  else MenuItem74.Enabled := false;

  jyoukenn := SystemIni.ReadBool('system','entry',false );
  if jyoukenn then MenuItem73.Enabled := true
  else MenuItem73.Enabled := false;
}


     //データベースオープン
  DataModule1.ADOConnectionNOU.Close;
  stmp := 'Provider=Microsoft.Jet.OLEDB.4.0;';
  stmp := stmp + 'Data Source=';
  stmp := stmp + FTPServer+'\nkpsoilmas.mdb;';
  stmp := stmp + 'Persist Security Info=False';
  DataModule1.ADOConnectionNou.ConnectionString := stmp;
  DataModule1.ADOConnectionNou.Open('Admin','');





//農協名
  //cbJAcd.Items.Clear;
  cbJANAME.Items.Clear;


  DataModule1.ADONoukyou.SQL.Clear;
  stmp := 'select * from M_NOUKYOU ORDER BY 農協コード';
  DataModule1.ADONoukyou.SQL.Text := stmp;
  DataModule1.ADONoukyou.Open;

  with DataModule1.ADONoukyou do begin



    while not Eof do begin
//      stmp := FieldByName('農協コード').AsString;
//       cbJAcd.Items.Add(stmp);
      stmp := FieldByName('農協名').AsString;
      cbJANAME.Items.add(stmp);

           Next;
    end;
  end;

  DataModule1.ADONoukyou.Close;



  //年度の設定
  DataModule1.ADONoukyou.SQL.Clear;
  stmp := 'select * from M_YEARLIST ORDER BY 年';
  DataModule1.ADONoukyou.SQL.ADD(stmp);
  DataModule1.ADONoukyou.Open;

  CbNendo.Items.Clear;

  with DataModule1.ADONoukyou do begin

      First;


      while not EOF do begin

        itmp := FieldbyName('年').AsInteger;
        stmp := inttostr(itmp);
        CbNendo.Items.Add(stmp);
        Next;
      end;

  end;

  DataModule1.ADONoukyou.Close;

  DataModule1.ADONoukyou.SQL.Clear;
  stmp := 'select * from M_YEAR';
  DataModule1.ADONoukyou.SQL.Text := stmp;
  DataModule1.ADONoukyou.Open;

  itmp :=  DataModule1.ADONoukyou.FieldbyName('現在年').AsInteger;
  ThisYear := inttostr(itmp);

  DataModule1.ADONoukyou.Close;


  DataModule1.ADOConnectionNou.Close;



  //iniファイルから
 // cbJAcd.ItemIndex := SystemIni.ReadInteger('system', 'JACD', 0 );
  itmp := SystemIni.Readinteger('system', 'JACD', 1 );
  cbJANAME.ItemIndex := itmp;



  //itmp := ThisYear; //SystemIni.Readinteger('system', 'YEAR', 1 ) ;
  itmp :=  CbNendo.Items.IndexOf(ThisYear);

  CbNendo.Itemindex := itmp;


  //cbJAcd.ItemIndex := 0;
  //cbJANAME.ItemIndex := 0;
  //CbNendo.ItemIndex := 0;




  FTPTiku := cbJANAME.Text;
  FTPNen := CbNendo.Text;




  DataPath := FTPServer + '\' + FTPTiku + '\' + FTPNen + '\' ;


  sfile := DataPath + 'nkpsoil.mdb;';
  stmp := 'Provider=Microsoft.Jet.OLEDB.4.0;';
  stmp := stmp + 'Data Source=' + sfile;
  stmp := stmp + 'Persist Security Info=False';

  DataModule1.ADOConnection1.Close;
  DataModule1.ADOConnection1.ConnectionString := stmp;








  //データベース変更 2014/2/19
{
   DataModule1.Query1.Close;
   stmp := Apppath + EntryCenter+'\'+EntryYear;
   DataModule1.Query1.DatabaseName := stmp;
   stmp := 'select * from M_SEHI_H';
   DataModule1.Query1.SQL.Clear;
   DataModule1.Query1.SQL.Add(stmp);
   DataModule1.Query1.Open;

   try
     itmp := DataModule1.Query1.Fieldbyname('分施回数').asinteger;


   except

     DataModule1.Query1.Close;
     DataModule1.Query1.SQL.Clear;
     stmp := 'ALTER TABLE M_SEHI_H ADD COLUMN 分施回数 INTEGER'; //CHAR(255)
     DataModule1.Query1.SQL.Add(stmp);
     DataModule1.Query1.ExecSQL;

  end;
}




  // タイマースタート
  Timer1.Enabled := true;
  TimerCount := 0;


  btnUketuke.SetFocus;

  hMenuHandle := GetSystemMenu(Self.Handle,False);
  if hMenuHandle <> 0 then
  begin
    EnableMenuItem(hMenuHandle, SC_CLOSE, (MF_BYCOMMAND or MF_DISABLED or MF_GRAYED));
  end;
  DrawMenuBar(Self.Handle);



  //現在のメニューの項目数を取得して一番下の区切り線を削除
  //AItemCnt := GetMenuItemCount(hMenuHandle);
  //for ii := 0 to AItemCnt - 1 do begin
  //  DeleteMenu(hMenuHandle, 0, MF_BYPOSITION);
  //end;

end;
(*
procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  Timer1.enabled := False ;
  SyncFirst;

end;
//showの後に呼び出し
procedure TMainForm.SyncFirst ;
begin
	Refresh;
// 起動時に同期処理を行う：センターが決定した後
	while IsUseNet do begin
  	FIsOnline := True ;
    Cursor := crAppStart	;
    FSyncDone := False ;	//同期処理未完了
  	FTPStart ;

	  //同期処理終了まで待つ。
    while FIsOnline do  Application.ProcessMessages  ;
    Refresh;
    if not FSyncDone then
    	ShowMessage('同期処理は正常に終了出来ませんでした。');
  	StatusBar1.Panels[0].Text := '';
  	StatusBar1.Panels[1].Text := '';
  	StatusBar1.Panels[2].Text := '';
    Cursor := crDefault	;
    break;
  end;
  if ChangeDataBase(EntryCenter,EntryYear) then
		DspCaption ;

  //センターマスタに登録がなければ登録を促す。
  if EntryCenterName = '' then begin
	  Application.CreateForm(TmstCenterForm, mstCenterForm);
    mstCenterForm.btnNewClick(self);
    mstCenterForm.DBEdit3.Text := EntryCenter ;
    mstCenterForm.DBEdit3.Enabled := false ;
  	mstCenterForm.ShowModal ;
	  mstCenterForm.Release ;
  end;
end;
*)


procedure TMainForm.Timer1Timer(Sender: TObject);
var
  pictfile : string ;
  strtmp : string;

  begin

  {
  pictfile := SystemIni.ReadString('system', 'picture', '' ) ;

  TimerCount := TimerCount + 1;
  if( TimerCount > 4 ) then begin
    TimerCount := 1;
  end;

  if pictfile <> '' then begin
    // 画像1
    strtmp := 'TOP_'+TimerCount.ToString.Trim;
    Image1.Picture.LoadFromFile(AnsiReplaceStr(pictfile, 'TOP', strtmp));

    // 画像2
    if( TimerCount + 1 > 4 ) then begin
      strtmp := 'TOP_1'
    end
    else begin
      strtmp := 'TOP_'+(TimerCount+1).ToString.Trim;
    end;

    Image2.Picture.LoadFromFile(AnsiReplaceStr(pictfile, 'TOP', strtmp));
  end;
  }

  //JpgDir := ExtractFileDir(Application.ExeName);
  if TDirectory.Exists(JpgDir) then begin
    TimerCount := TimerCount + 1;

    //ファイルのリストを取得
    //指定のパターンに一致するファイル名だけを取り出す
    //FilesList := TDirectory.GetFiles(JpgDir, '*.jpg');
    if( Length(FilesList) > 0 ) then begin
      if( Length(FilesList) <= TimerCount ) then
        TimerCount := 0;

        Image1.Picture.LoadFromFile(FilesList[TimerCount]);

      if( Length(FilesList) <= TimerCount + 1 ) then
          Image2.Picture.LoadFromFile(FilesList[0])
      else
          Image2.Picture.LoadFromFile(FilesList[TimerCount + 1]);

    end;
  end;

end;



procedure TMainForm.DspCaption ;
begin
  //フォームタイトルに表示する
 //	Caption := SystemName + ' (Ver' +AppGetInfo(Application.exename,3)+') '+ EntryCenterName + ' : ' + EntryYear +  '年度';








  end;
{農協マスタ}
procedure TMainForm.nmNoukyouClick(Sender: TObject);
begin
  Application.CreateForm(TmstNoukyouForm, mstNoukyouForm);
	mstNoukyouForm.ShowModal ;
  mstNoukyouForm.Release ;
end;
{農家マスタ}
procedure TMainForm.nmNoukaClick(Sender: TObject);
begin
  Application.CreateForm(TmstNoukaForm, mstNoukaForm);
  mstNoukaForm.ShowModal ;
  mstNoukaForm.Release ;
end;
{土壌マスタ}
procedure TMainForm.nmDojouClick(Sender: TObject);
begin
  Application.CreateForm(TmstDojouForm, mstDojouForm);
  mstDojouForm.ShowModal ;
  mstDojouForm.Release ;
end;
{土性マスタ}
procedure TMainForm.nmDoseiClick(Sender: TObject);
begin
  Application.CreateForm(TmstDoseiForm, mstDoseiForm);
  mstDoseiForm.ShowModal ;
  mstDoseiForm.Release ;
end;
{腐植マスタ}
procedure TMainForm.nmFushokuClick(Sender: TObject);
begin
  Application.CreateForm(TmstFushokuForm, mstFushokuForm);
  mstFushokuForm.ShowModal ;
  mstFushokuForm.Release ;
end;
{センターマスタ}
procedure TMainForm.nmCenterClick(Sender: TObject);
begin
  Application.CreateForm(TmstCenterForm, mstCenterForm);
  mstCenterForm.ShowModal ;
  mstCenterForm.Release ;
end;
{市町村マスタ}
procedure TMainForm.nmCityClick(Sender: TObject);
begin
  Application.CreateForm(TmstCityForm, mstCityForm);
  mstCityForm.ShowModal ;
  mstCityForm.Release ;
end;
{地区マスタ}
procedure TMainForm.nmTikuClick(Sender: TObject);
begin
  Application.CreateForm(TmstTikuForm, mstTikuForm);
  mstTikuForm.ShowModal ;
  mstTikuForm.Release ;
end;
{有機マスタ}
procedure TMainForm.nmSizaiClick(Sender: TObject);
begin
  Application.CreateForm(TmstYuukiForm, mstYuukiForm);
  mstYuukiForm.ShowModal ;
  mstYuukiForm.Release ;
end;
{土改材マスタ}
procedure TMainForm.nmDokaizaiClick(Sender: TObject);
begin
  Application.CreateForm(TmstDokaizaiForm, mstDokaizaiForm);
  mstDokaizaiForm.ShowModal ;
  mstDokaizaiForm.Release ;
end;
{単肥マスタ}
procedure TMainForm.nmTanpiClick(Sender: TObject);
begin
  Application.CreateForm(TmstTanpiForm, mstTanpiForm);
  mstTanpiForm.ShowModal ;
  mstTanpiForm.Release ;
end;
{化成マスタ}
procedure TMainForm.nmKaseiClick(Sender: TObject);
begin
  Application.CreateForm(TmstKaseiForm, mstKaseiForm);
  mstKaseiForm.ShowModal ;
  mstKaseiForm.Release ;
end;
{作目マスタ}
procedure TMainForm.nmSakumokuClick(Sender: TObject);
begin
  Application.CreateForm(TmstSakumokuForm, mstSakumokuForm);
  mstSakumokuForm.ShowModal ;
  mstSakumokuForm.Release ;
end;
{作物マスタ}
procedure TMainForm.nmSakumotuClick(Sender: TObject);
begin
  Application.CreateForm(TmstSakumotuForm, mstSakumotuForm);
  mstSakumotuForm.ShowModal ;
  mstSakumotuForm.Release ;
end;
{作型マスタ}
procedure TMainForm.nmSakugataClick(Sender: TObject);
begin
  Application.CreateForm(TmstSakugataForm, mstSakugataForm);
  mstSakugataForm.ShowModal ;
  mstSakugataForm.Release ;
end;
{バージョン情報ダイアログ}
procedure TMainForm.About1Click(Sender: TObject);
begin
  Application.CreateForm(TAboutBox, AboutBox);
  AboutBox.ShowModal ;
  AboutBox.Release ;
end;
{圃場マスタ}
procedure TMainForm.nmHojouClick(Sender: TObject);
begin
  Application.CreateForm(TmstHojouForm, mstHojouForm);
  mstHojouForm.ShowModal ;
  mstHojouForm.Release ;
end;
{基準マスタ}
procedure TMainForm.nmKijunClick(Sender: TObject);
begin
  Application.CreateForm(TmstKijun1Form, mstKijun1Form);
  mstKijun1Form.ShowModal ;
  mstKijun1Form.Release ;
end;
{受付一覧画面}
procedure TMainForm.nmUkeListClick(Sender: TObject);
begin
  Application.CreateForm(TfrmLUketuke, frmLUketuke);
  frmLUketuke.ShowModal ;
  frmLUketuke.Release ;
end;

procedure TMainForm.NOUTIClick(Sender: TObject);
begin

end;

{シミュレーション画面}
procedure TMainForm.ActionSimExecute(Sender: TObject);
begin

showmessage('調整中');

end;
{肥料設定}
procedure TMainForm.nmSetHiryoClick(Sender: TObject);
begin
  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release;
end;
{施肥標準畑}
procedure TMainForm.nmSehiHatakeClick(Sender: TObject);
begin
  Application.CreateForm(TmstSehi_HForm, mstSehi_HForm);
  mstSehi_HForm.ShowModal ;
  mstSehi_HForm.Release;
end;
{施肥標準水稲}
procedure TMainForm.nmSehiSuiClick(Sender: TObject);
begin
end;
{施肥標準園芸}
procedure TMainForm.nmSehiEngeiClick(Sender: TObject);
begin
  Application.CreateForm(TmstSehi_EForm, mstSehi_EForm);
  mstSehi_EForm.ShowModal ;
  mstSehi_EForm.Release;
end;
{施肥標準牧草}
procedure TMainForm.nmSehiBokuClick(Sender: TObject);
begin
  Application.CreateForm(TmstSehi_BForm, mstSehi_BForm);
  mstSehi_BForm.ShowModal ;
  mstSehi_BForm.Release;
end;
{コメントマスタ}
procedure TMainForm.nmJikouClick(Sender: TObject);
begin
  Application.CreateForm(TmstCMTForm, mstCMTForm);
  mstCMTForm.ShowModal ;
  mstCMTForm.Release;
end;
//センター切り替え
procedure TMainForm.nmSetCenterClick(Sender: TObject);
var
	Center : string ;
begin
	Center := EntryCenter ;
	if DspCenter( Center ) then begin
	  if Application.MessageBox ('登録するデータベースを変更します。よろしいですか？','確認', MB_YESNO ) = ID_YES then
			if ChangeCenter( Center ) then
  //      SetYearEnable
      else
      	showmessage('センター切り替えはできませんでした。') ;

  end;
	DspCaption;
end;
//年度切り替え
procedure TMainForm.nmSetYearClick(Sender: TObject);
var
	Year : string;
begin
	Year := EntryYear ;
	if DspYear( Year ) then begin
	  if Application.MessageBox ('登録するデータベースを変更します。よろしいですか？','確認', MB_YESNO ) = ID_YES then
			if ChangeYear( Year ) then
//        SetYearEnable
      else
      	showmessage('年度データ切り替えはできませんでした。');
  end;
	DspCaption;
end;
//新年度データ作成
procedure TMainForm.nmBuildYearClick(Sender: TObject);
var
	aBuff :string ;
begin
	aBuff := '新しい年度の作成';
  if Application.MessageBox ('新しい年度を作成します。よろしいですか？',
  	PChar(aBuff), MB_YESNO ) = ID_NO then begin
  	exit ;
	end;
  MakeNewYearData;
  //SetYearEnable;
end;


//指定データの複写
procedure TMainForm.nmManuDataCopyClick(Sender: TObject);
begin
//トランザクションはオリジナルから複写
//トランザクションをのぞくマスタを複写
end;
//ネットワーク設定
procedure TMainForm.nmSetNetWorkClick(Sender: TObject);
begin
  Application.CreateForm(TNetworkForm, NetworkForm);
  NetworkForm.ShowModal ;
  NetworkForm.Release ;
end;

(*
function TMainForm.GetFTPFile(const sFile, dFile : string ):Boolean;
var
  INSTFileAge,SVFileAge: TDateTime;
  iAge  : integer;
  Attr: Integer;
  sFileName,dFileName : string;
const
  myReadOnly = $00000001;
begin
	result := False;

 	iAge := FileAge( dFile );
  if iAge = -1 then begin
   	INSTFileAge := 0;	{自前が無い場合は}
  end else
   	INSTFileAge := FileDateToDateTime(iAge);

 	iAge := FileAge( sFile );
  if iAge = -1 then begin
    result := True;
  	exit;	{サーバーに無いときは次}
  end;
  SVFileAge := FileDateToDateTime(iAge);
  {タイムスタンプ比較}
//    showmessage(FileList[cnt]+':SV='+Floattostr(SVFileAge)+'HD='+Floattostr(INSTFileAge));

  if SVFileAge > INSTFileAge then begin
//        showmessage(SVDir+FileList[cnt]+'->'+INSTDir+FileList[cnt]);

    sFileName := sFile ;
    dFileName := dFile ;
		//Ver 1.2 拡張子がEXEの場合圧縮ファイルを指定して展開する
    if UpperCase(ExtractFileExt(sFile)) = '.EXE' then begin
      if FileExists(ChangeFileExt(sFile ,'.LZH')) then begin
	     	sFileName := ChangeFileExt(sFile ,'.LZH') ;
  	   	dFileName := ChangeFileExt(dFile ,'.LZH') ;
      end;
		end;

    {Ver 1.2 書込み先の属性を確認する}
		if FileExists(dFileName) then begin
    	Attr := FileGetAttr(dFileName);
    	if (Attr and myReadOnly) <> 0 then
      	FileSetAttr(dFileName, Attr - myReadOnly);
  	end;

	  StatusBar1.Panels[2].Text := 'ダウンロード中 : '+ExtractFileName(sFileName) ;
   	StatusBar1.Refresh ;

{
    if CopyFile(PChar(sFileName),PChar(dFileName),False) = False then begin
      showmessage('Auto update failed. ('+SysErrorMessage(Getlasterror)+')') ;
      exit;
    end
    else begin {圧縮ファイルの場合解凍する}
			SHChangeNotify(SHCNE_CREATE or SHCNE_UPDATEDIR,SHCNF_PATH ,
    			PChar(UsrExtractFilePath(dFileName)),nil);
      if UpperCase(ExtractFileExt(dFileName)) = '.LZH' then begin
        UnZip(dFileName);
      end;
    end;
}
		{コピーした後更新系のファイルのために書込み属性確認}
 		Attr := FileGetAttr(dFile);
 		if (Attr and myReadOnly) <> 0 then
   		FileSetAttr(dFile, Attr - myReadOnly);
	end;
  result := True;
end;
*)
{
		圧縮処理
    aFileName :　パス付き拡張子なしファイル名（圧縮は.lzh 被圧縮は.*）
    aPath : 被圧縮ファイルのあるパス 末端￥つき
    aZipFile : パス付き圧縮ファイル名
}
function Zip( const aFileName , aPath , aZipFile : string ): Boolean;
var
	Buff : string;
  szCmdline, szOutput: PChar;
  wSize: DWord;
  Res : Integer;
begin
	Res := 1;
  wSize := 1024;
  GetMem(szCmdline, wSize); //領域確保
  GetMem(szOutput, wSize); //領域確保
  {圧縮する}
  try
      //コマンド＋スイッチ＋圧縮ファイル＋圧縮ファイルディレクトリ＋被圧縮ファイル群　アプリルートにできる
	  	Buff := '"'+aZipFile +'" "'+aPath+'" '+ aFileName+'.*';
//-n:状況ダイアルグ表示抑止
//-y:全ての質問にyes
//-t:書庫の更新日時を，書庫内の最新の格納ファイルのものに合わせます。
   		strpcopy(szCmdline, 'a -n -y -t '+ Buff );
   		Res :=  Unlha(Application.Handle ,szCmdline,szOutput,wSize) ;
  finally
    if Res <> 0 then begin
        showmessage( szoutput );
    end;
  	FreeMem(szCmdline);
  	FreeMem(szOutput);
  end;
  result := Res = 0 ;
end;
{
		解凍処理
    pZipFile : 圧縮ファイル名
    pPath : 解凍基準ディレクトリ
}
function UnZip( const pZipName, pPath :string ): Boolean;
var
	Buff: string;
  szCmdline, szOutput: PChar;
  wSize: DWord;
  Res : Integer;
begin
	result := False; Res := 1;

  wSize := 1024;
  GetMem(szCmdline, wSize); //領域確保
  GetMem(szOutput, wSize); //領域確保
  {解凍する}
  try
      //コマンド＋スイッチ＋圧縮ファイル＋展開ディレクトリ
	  	Buff := '"'+pZipName +'" "'+pPath+'"';
//-c:タイムスタンプに関係ないく上書き
//-n:状況ダイアルグ表示抑止
//-y:全ての質問にyes
   		strpcopy(szCmdline, 'e -c -n -y '+ Buff );
   		Res :=  Unlha(Application.Handle ,szCmdline,szOutput,wSize) ;

  finally
	  if Res <> 0 then begin
    	showmessage( szoutput );
  	end;
  	FreeMem(szCmdline);
  	FreeMem(szOutput);
  end;
  {削除する}
//	Ver 1.2 日付比較用にのこす。削除する場合属性をチェックする。
//  DeleteFile(AFileName);
	if Res <> 0 then exit;
  result := True;
end;

{受付処理画面}
procedure TMainForm.ActUketukeExecute(Sender: TObject);
var
  oldColor : TColor;
begin

    oldColor := btnUketuke.Color;
    btnUketuke.Color := clYellow;

    Application.CreateForm(TfrmUketuke6, frmUketuke6);
    frmUketuke6.ShowModal ;
    frmUketuke6.Release ;

    btnUketuke.Color := oldColor;

end;
{分析処理画面}
procedure TMainForm.ActBunsekiExecute(Sender: TObject);
begin

//  if JMode = 'Douou' then begin

     Application.CreateForm(TfrmBunseki, frmBunseki);
     frmBunseki.EMode.Text := '1';
     frmBunseki.ShowModal ;
     frmBunseki.Release ;
//  end
//  else begin
//     Application.CreateForm(TfrmBunseki2, frmBunseki2);
//     frmBunseki2.ShowModal ;
//     frmBunseki2.Release ;
//  end;
end;
{診断}
procedure TMainForm.ActSindanExecute(Sender: TObject);
var
  RecCnt : integer ;
aDevice:Array[0..255] of char;
aDriver:Array[0..255] of char;
aPort:Array[0..32] of char;
PDM: PDeviceMode;
aDevMode: THandle;
sret : String;

begin

    JMode_CN := false; //CN比表示フラグ
    JMode_Yobi1 := false; //予備
    JMode_Yobi2 := false;
    JMode_Yobi3 := false;




    JMode_Ikubyou := false;

    sret := DspInputNo( self, 1 );

    if sret = '' then exit;

    Application.CreateForm(TSindanForm, SindanForm);
    //最初の一覧表示
    SindanForm.EMode.Text := sret;
    SindanForm.ShowModal ; //一覧から印刷対象の再設定



    if SindanForm.FRes then begin
            //全体の件数を割り出す
            with DataModule1.QueryRead do begin
                {Version 0.6 #26 削除フラグ追加}
                SQL.Text := 'Select Count(*) as cnt from T_BUNSEKI6 where ' + SQLCondition ;
                Open;
                RecCnt := FieldByName('cnt').asInteger ;
                Close;
            end;

            //プリンタの設定
            //  Printer.PrinterIndex := -1;
            Printer.PrinterIndex := Printer.PrinterIndex;
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            Printer.SetPrinter(aDevice, aDriver, aPort, 0);
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            PDM := GlobalLock(aDevMode); //メモリをロックする　領域をとるわけではない。


            PDM^.dmPaperSize := DMPAPER_A4;
            PDM^.dmOrientation := DMORIENT_PORTRAIT; //DMORIENT_LANDSCAPE; // 横
                     //DMORIENT_PORTRAIT;


            GlobalUnlock(aDevMode); //メモリを開放　領域を消すわけではない。
            Printer.SetPrinter(aDevice, aDriver, aPort, aDevMode);



//            if sret <> '分析値のみ' then begin
                DspPrnReport( self,rtSindan, RecCnt );
//            end
//            else begin
//                DspPrnReport( self,rtBunseki, RecCnt );
//            end;


    end;
    SindanForm.Release ;
//    end;
end;
{施肥設計}
procedure TMainForm.ActSehiExecute(Sender: TObject);
var
  RecCnt : integer ;
aDevice:Array[0..255] of char;
aDriver:Array[0..255] of char;
aPort:Array[0..32] of char;
PDM: PDeviceMode;
aDevMode: THandle;

begin
	if DspInputNo( self, 0 ) <> '' then begin
    Application.CreateForm(TSindanForm, SindanForm);
    //最初の一覧表示
    SindanForm.ShowModal ; //一覧から印刷対象の再設定
    if SindanForm.FRes then begin
      //全体の件数を割り出す
      with DataModule1.QueryRead do begin
        {Version 0.6 #26 削除フラグ追加}
        SQL.Text := 'Select Count(*) cnt from T_UKETUKE where 削除フラグ<>True and ' + SQLCondition ;
        Open;
        RecCnt := FieldByName('cnt').asInteger ;
        Close;
      end;

            //プリンタの設定
            //  Printer.PrinterIndex := -1;
            Printer.PrinterIndex := Printer.PrinterIndex;
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            Printer.SetPrinter(aDevice, aDriver, aPort, 0);
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            PDM := GlobalLock(aDevMode); //メモリをロックする　領域をとるわけではない。

            if JMode = 'Douou' then begin
                     PDM^.dmPaperSize := DMPAPER_A4;
                     PDM^.dmOrientation := DMORIENT_LANDSCAPE; // 横
                     //DMORIENT_PORTRAIT;
            end
            else if JMode = 'Fuuren' then begin
                     PDM^.dmPaperSize := DMPAPER_A4;
                     PDM^.dmOrientation := DMORIENT_PORTRAIT; // 縦
            end
            else begin
                     PDM^.dmPaperSize := DMPAPER_A4;
                     PDM^.dmOrientation := DMORIENT_PORTRAIT; // 縦
            end;

            GlobalUnlock(aDevMode); //メモリを開放　領域を消すわけではない。
            Printer.SetPrinter(aDevice, aDriver, aPort, aDevMode);

        //診断計算メソッド呼び出し
    	DspPrnReport( self,rtSekkei, RecCnt );
    end;
    SindanForm.Release ;
  end;
end;


{マスタメンテ処理画面}
procedure TMainForm.ActMasterExecute(Sender: TObject);
var
  oldColor : TColor;
begin

    oldColor := btnMaster.Color;
    btnMaster.Color := clYellow;

    Application.CreateForm(TfrmMaster, frmMaster);
    frmMaster.ShowModal ;
    frmMaster.Release ;

    btnMaster.Color := oldColor;

end;

{シミュレーション診断}
procedure TMainForm.ActExitExecute(Sender: TObject);
const
  DataFile1 = 't_*' ;
  aZipFile = 'data.lzh' ;
begin
//終了時に自動的にデータのバックアップをとる
  if IsBackUp then begin
    if not BackupFile(DataFile1,aZipFile) then exit ;
    //指定ファイルに変更
    if not DirectoryExists( AppPath+'log') then
      CreateDir(AppPath+'log');
    CopyFile(PChar(AppPath+aZipFile),PChar(AppPath+'log\Data'+FormatDateTime('yymmdd',now)+'.lzh' ),false);
    DeleteFile(AppPath+aZipFile);
  end;
	Close;
end;
{画面色設定}
procedure TMainForm.nmColorClick(Sender: TObject);
begin
  ColorDialog1.Color := BackColor ;
  if ColorDialog1.Execute then begin
  	BackColor := ColorDialog1.Color ;
    SystemIni.WriteString('system', 'BackColor', IntToStr(BackColor) );
   	Color := BackColor ;
    Repaint;
  end;
end;
{メッセージフォント色設定 Version 0.6 #43}
procedure TMainForm.nmFontColorClick(Sender: TObject);
begin
  ColorDialog1.Color := FontColor ;
  if ColorDialog1.Execute then begin
  	FontColor := ColorDialog1.Color ;
    SystemIni.WriteString('system', 'FontColor', IntToStr(FontColor) );
   	MsgLabel2.Font.Color := FontColor ;
    Repaint;
  end;
end;
{
  オンライン中制御
}
procedure TMainForm.OnlineEnable( fOnline : Boolean);
begin
  File1.Enabled := not fOnline ;
  Uketuke1.Enabled := not fOnline ;
  Bunseki.Enabled := not fOnline ;
  Sindan.Enabled := not fOnline ;
//  SehiSekkei.Enabled := not fOnline ;
  nmMaster.Enabled := not fOnline ;
  Tool1.Enabled := not fOnline ;
  ActUketuke.Enabled := not fOnline ;
  ActBunseki.Enabled := not fOnline ;
  ActSindan.Enabled := not fOnline ;
  ActSync.Enabled := not fOnline ;
  ActSehi.Enabled := not fOnline ;
  ActionSim.Enabled := not fOnline ;
end;
{
  送受信処理
}

procedure TMainForm.btnFTPClick(Sender: TObject);
begin


end;

// 送受信
//　ＭＯ用
procedure TMainForm.SpeedButton3Click(Sender: TObject);
begin



end;

{
	==========================================================================
	FTP関数
  バッチ処理なので手順の流れによっては無限ループになる場合あり。タイマー監視などで要対策
  その例：
  DirChange:->FtpError->                      ChangeDir:<busyで実行の為>
                      ->DirChanged->Refresh:->Busy->ListtingDone
  対策：通常はコマンド発行前にビジーをチェックすればいい。
}
procedure TMainForm.FTPLogMessage( aMsg : string );
begin
end;
//ログイン
function TMainForm.FTPLogin: Boolean ;
begin
  FIsFTPError := False ;
  FIsConnected := False ;
//  with MFTP1 do begin
//    Passive := SystemIni.ReadBool('network', 'usepssv', false );
//    Server := SystemIni.ReadString('network', 'server', '' );
//    Username := SystemIni.ReadString('network', 'username', '' ) ;
//    password := SystemIni.ReadString('network', 'password', '' ) ;
    //パスワード変換処理を追加する
//    InitialDirectory :=  SystemIni.ReadString('network', 'home', '' ) ;
//    FTPLogMessage('login:'+Server);
//    Login ;
    {  状態遷移
      正常：ready -> loggedin
      サーバー非起動：[timeout] -> error -> error
      アカウント無し：error -> quit -> ready
    }
//  end;
  //エラーでなく非コネクト状態は待つ
  {注意：なぜかwith MFTP1内で行うと勝手にブレイクする}
  while (not FIsConnected) and (not FIsFTPError) do begin
    Sleep(100);
    Application.ProcessMessages ;
  end;
  result := FIsConnected ;
end;
//ログアウト
procedure TMainForm.FTPLogOut ;
begin
   FTPLogMessage('Logout:');
//   MFTP1.Quit ;
end;
//ディレクトリ変更   aDir はカレントからでもルートパスからでも有効
function TMainForm.FTPChangeDir( aDir : string ) : Boolean ;
begin
//  while MFTP1.Busy do Application.ProcessMessages ;
	FTPLogMessage('ChangeDirectory:'+aDir);
  FIsDirectoryChanged := False ;
  FIsFTPError := False ;
//	MFtp1.ChangeDirectory(aDir);
  { 状態遷移
    Busy -> Ready -> DirectoryChanged. 次にrefresh:必要
    Busy -> Error -> Ready -> DirectoryChanged.
  }
  // DirectoryChangedイベントを待つ
	while (not FIsDirectoryChanged) and (not FIsFTPError) do begin
    Sleep(100);
   	Application.ProcessMessages ;
  end;
  result := not FIsFTPError ;
end;
//ディレクトリ作成
function TMainForm.MakeDirectory( aDir : string ) : Boolean;
begin
//  while MFTP1.Busy do Application.ProcessMessages ;
end;
//ファイルサイズより通信時間の上限を予測する。
function MakePassageTime( aSize : integer ): integer ;
begin
  //4kbyte / sec
  if FTPBPS = 0 then FTPBPS := BYTEOFSEC ;
  result := Floor(aSize / FTPBPS );
end;

procedure TMainForm.S10Click(Sender: TObject);
var
sret : String;
begin

    Application.CreateForm(TInputNoForm, InputNoForm);

    InputNoForm.EMode.Text := '飼料';

    InputNoForm.PageControl1.ActivePageIndex := 0 ;


    InputNoForm.ShowModal ; //一覧から印刷対象の再設定

    sret := InputNoForm.EMode.Text;
    //sret := DspInputNo( Sender, 1 );
    InputNoForm.Release ;
    if sret = '' then exit;

    Application.CreateForm(TSindanForm, SindanForm);
    //最初の一覧表示
    SindanForm.EMode.Text := sret;
    SindanForm.btnPreview.Caption := '出力実行';
    SindanForm.ShowModal ; //一覧から印刷対象の再設定

    if SindanForm.FRes then begin

      if SaveDialog1.Execute then begin
        ExportFile('t_uketuke3',SaveDialog1.FileName );

       ShowMessage('出力しました。');
      end;
    end;
    SindanForm.Release ;

end;
//ファイルダウンロード -> temppath
function TMainForm.FTPGetFile( aFileName : string ) : Boolean ;
var
  aTime : integer ;
//  res : boolean ;
begin
  result := false ;





  result :=  not FIsFTPError ;
end;
//ファイルのアップロード temppath -> から.tmpでアップしてファイルサイズ
//正しければ サーバーにあるファイルを削除してからリネームする。

function TMainForm.FTPPutFile( aFileName : string )  : Boolean ;
var
  aTime ,aSize, aaSize : integer ;
  sr: TSearchRec;
  bFileExist : Boolean ;
begin
  result := false ;

  result :=  not FIsFTPError ;
end;
//ファイル削除
function TMainForm.FTPDeleteFile( aFileName : string ) : Boolean ;
begin
  FIsFTPError := False ;
  FIsFileDeleted := False ;



  result :=  not FIsFTPError ;
end;
//ファイルリネーム
function TMainForm.FTPFileReName( aSrcFile,  aDstFile: string ) : Boolean ;
begin


end;
//ファイルサイズ取得 キャッシュから検索  notfound = -1,
function TMainForm.FTPFileSize( aFileName : string ) : integer ;
var
	cnt : integer ;
begin
	result := -1 ;



  end;
//ファイル検索 キャッシュから検索
function TMainForm.FTPFileExist( aFileName : string ) : Boolean ;
var
	cnt : integer ;
begin
	result := False ;
end;
//ディレクトリ検索 キャッシュから検索
function TMainForm.FTPDirExist( aFileName : string ) : Boolean ;
var
	cnt : integer ;
begin
	result := False ;


end;


procedure TMainForm.FTPRefresh ;
begin
    {
      Busy -> Ready -> ListingDone ;
    }
end;
procedure TMainForm.G1Click(Sender: TObject);
begin


  //作型
  Application.CreateForm(TmstSakugataForm, mstSakugataForm);
  mstSakugataForm.ShowModal ;
  mstSakugataForm.Release ;



end;

//コネクト

procedure TMainForm.btnloginClick(Sender: TObject);
begin
  FTPLogin;
end;

procedure TMainForm.btnlogoutClick(Sender: TObject);
begin
  FTPLogOut;
end;
procedure TMainForm.Button1Click(Sender: TObject);
begin

    Application.CreateForm(TMainForm, MainForm);
    MainForm.ShowModal ;
    MainForm.Release ;

end;

procedure TMainForm.btnClearClick(Sender: TObject);
begin
end;


{
	FTP関数 ここまで
	//////////////////////////////////////////////////////////////////////////
}
{
  データのエクスポート
  pFileName:被圧縮ファイル名（拡張子無し）
  pZipFile : 圧縮ファイル名
}
function TMainForm.BackupFile(pFileName, pZipFile : string ):Boolean;
var
  Dir : string ;
begin
  // 指定ディレクトリ
  Dir := DataPath ;
  // 受付データの圧縮
  result := Zip(pFileName,Dir,pZipFile);
end;
{
  インポート処理
  pZipFile : 圧縮ファイル名
}
function TMainForm.RestoreFile( pZipFile : string ):Boolean;
var
  Dir : string ;
begin
  // 指定ディレクトリ
  Dir := DataPath;
  // 受付データの圧縮
  result := UnZip(pZipFile,Dir);
end;
{
  インポート処理 : トランザクションはtempで展開し差分取り込み
  pZipFile : 圧縮ファイル名
}
function TMainForm.ImportTemp( pZipFile : string ):Boolean;
var
  Dir : string ;
begin
  // tempディレクトリ
  Dir := TempPath ;
  // 受付データの圧縮
  result := UnZip(pZipFile,Dir);
end;

{トランザクションテーブルのエクスポート}
procedure TMainForm.nmExpDataClick(Sender: TObject);
const
  DataFile1 = 't_*' ;
  aZipFile = 'data.lzh' ;
var
  Dir : string ;
begin
  if not SelectDirectory(Dir,[sdAllowCreate, sdPerformCreate, sdPrompt],0) then exit;
  if not BackupFile(DataFile1,aZipFile) then exit ;
  //指定ファイルに変更
  CopyFile(PChar(AppPath+aZipFile),PChar(Dir+aZipFile ),false);
  DeleteFile(AppPath+aZipFile);

end;
{マスタの全エクスポート}
procedure TMainForm.nmExpMstClick(Sender: TObject);
const
  MasterFile1 = 'm_*' ;
  aZipFile = 'master.lzh' ;
var
  Dir : string ;
begin
  if not SelectDirectory(Dir,[sdAllowCreate, sdPerformCreate, sdPrompt],0) then exit;

  if not BackupFile(MasterFile1,aZipFile) then exit ;
  //指定ファイルに変更
  CopyFile(PChar(AppPath+aZipFile),PChar(Dir+aZipFile ),false);
  DeleteFile(AppPath+aZipFile);

end;
{データインポート処理}
procedure TMainForm.nmImpDataClick(Sender: TObject);
begin
  OpenDialog1.FileName := 'data.lzh';
  OpenDialog1.DefaultExt := 'lzh';
  OpenDialog1.Filter := '圧縮ファイル|*.lzh';
  if not OpenDialog1.Execute then exit;
  if Application.MessageBox ('今あるデータに上書きをします。よろしいですか？','インポート', MB_YESNO ) = ID_NO then
    exit;
  CloseDataBase;
  ImportTemp(OpenDialog1.FileName) ;
  ChangeDataBase(EntryCenter , EntryYear );
  //データをマージする。
//  MargeData;
end;
{マスタインポート処理}
procedure TMainForm.nmImpMstClick(Sender: TObject);
begin
  OpenDialog1.FileName := 'master.lzh';
  OpenDialog1.DefaultExt := 'lzh';
  OpenDialog1.Filter := '圧縮ファイル|*.lzh';
  if not OpenDialog1.Execute then exit;
  if Application.MessageBox ('今あるマスタを上書きをします。よろしいですか？','インポート', MB_YESNO ) = ID_NO then
    exit;
  CloseDataBase;
  RestoreFile(OpenDialog1.FileName) ;
  ChangeDataBase(EntryCenter , EntryYear );

end;
{
  操作年度別機能設定
}
{
procedure TMainForm.SetYearEnable;
begin
//  ActUketuke.Enabled := IsEntryYear ;
//  ActBunseki.Enabled := IsEntryYear ;
//  ActSindan.Enabled := IsEntryYear ;

//送受信　btnFTP
//  ActSync.Enabled := IsEntryYear ;

//  nmBuildYear.Enabled := IsEntryYear ;
//  nmRestore.Enabled := IsEntryYear ;
//  nmImport.Enabled := IsEntryYear ;
end;
}
{
  CSV エクスポート
}
procedure TMainForm.nmExUkeClick(Sender: TObject);
var
sret : String;
begin
{
   sret := 'CeresDBOut.exe';
   ShellExecute(Handle,'OPEN',PChar(sret),'','',sw_Show);

   exit;
}

    Application.CreateForm(TInputNoForm, InputNoForm);

    InputNoForm.EMode.Text := '土壌';

    InputNoForm.PageControl1.ActivePageIndex := 0 ;


    InputNoForm.ShowModal ; //一覧から印刷対象の再設定

    sret := InputNoForm.EMode.Text;
    //sret := DspInputNo( Sender, 1 );

    //if sret = '' then exit;
    InputNoForm.Release ;

    if sret = '' then exit;



    Application.CreateForm(TSindanForm, SindanForm);
    //最初の一覧表示
    SindanForm.EMode.Text := sret;
    SindanForm.btnPreview.Caption := '出力実行';
    SindanForm.ShowModal ; //一覧から印刷対象の再設定

    if SindanForm.FRes then begin

      if SaveDialog1.Execute then begin
        ExportFile('t_uketuke',SaveDialog1.FileName );

       ShowMessage('出力しました。');
      end;
    end;
    SindanForm.Release ;


end;

procedure TMainForm.nmExBunClick(Sender: TObject);
begin
  if SaveDialog1.Execute then begin
    ExportFile('t_sindan',SaveDialog1.FileName );
   ShowMessage('出力しました。');
  end;
end;

procedure TMainForm.nmExpNoukaClick(Sender: TObject);
var
sret : String;
begin


      if SaveDialog1.Execute then begin
         ExportFile('m_nouka',SaveDialog1.FileName );
         ShowMessage('出力しました。');
       end;


end;

procedure TMainForm.nmExpHojoClick(Sender: TObject);
begin
  if SaveDialog1.Execute then begin
    ExportFile('m_hojou',SaveDialog1.FileName );
   ShowMessage('出力しました。');
  end;
end;

procedure TMainForm.nmImpNoukaClick(Sender: TObject);
begin
  OpenDialog1.DefaultExt := 'csv';
  OpenDialog1.Filter := 'CSVファイル|*.csv';
  if not OpenDialog1.Execute then exit;
  ImportFile( OpenDialog1.FileName, 'm_nouka' );
  ShowMessage('終了しました。');

end;

procedure TMainForm.nmImpHojoClick(Sender: TObject);
begin
  OpenDialog1.DefaultExt := 'csv';
  OpenDialog1.Filter := 'CSVファイル|*.csv';
  if not OpenDialog1.Execute then exit;
  ImportFile( OpenDialog1.FileName, 'm_hojou' );
  ShowMessage('終了しました。');
end;

procedure TMainForm.nmEditMsgClick(Sender: TObject);
begin
{メッセージファイルを編集して、サーバーに転送する}
//MsgBoxを編集させる。メッセージ無い場合、事前に同期する必要あり。
//登録＝アップデート
end;

{イメージをストレッチする}
procedure TMainForm.FormResize(Sender: TObject);
begin
  Panel4.Width := PanelClient.Width div 2;
end;

{メッセージラベルの表示}
procedure  TMainForm.DspMsg;
{Version 0.6 #43 メッセージを背景の上}
var
  aBuff : string ;
begin
  //背景透過なラベルに文字を表示する
(*
  for aCnt := 1 to pMsg.Count do begin
    aBuff := aBuff + pMsg[aCnt] + #10#13;
  end;
*)
  aBuff := FMsg.Text ;
//  MsgLabel.Caption := '【送受信メッセージ】'+#10#13+aBuff ;
  MsgLabel2.Visible := true;
  MsgLabel2.Caption := '【送受信メッセージ】'+#10#13+aBuff ;


  end;


procedure TMainForm.N3Click(Sender: TObject);
begin
  Application.CreateForm(TFJyouken, FJyouken);
  FJyouken.ShowModal ;
  FJyouken.Release ;

end;

procedure TMainForm.N10Click(Sender: TObject);
begin
  Application.CreateForm(TmstSehi_SForm, mstSehi_SForm);
  mstSehi_SForm.ShowModal ;
  mstSehi_SForm.Release;

end;

//水稲　リン酸肥沃度
procedure TMainForm.N11Click(Sender: TObject);
begin

  Application.CreateForm(TmstBai_S_PForm, mstBai_S_PForm);
  mstBai_S_PForm.ShowModal ;
  mstBai_S_PForm.Release;

end;

procedure TMainForm.K1Click(Sender: TObject);
begin
  Application.CreateForm(TmstBai_S_KForm, mstBai_S_KForm);
  mstBai_S_KForm.ShowModal ;
  mstBai_S_KForm.Release;

end;

procedure TMainForm.M2Click(Sender: TObject);
begin
  Application.CreateForm(TmstBai_S_MForm, mstBai_S_MForm);
  mstBai_S_MForm.ShowModal ;
  mstBai_S_MForm.Release;

end;

procedure TMainForm.H1Click(Sender: TObject);
begin

  Application.CreateForm(TmstBai_S_NForm, mstBai_S_NForm);
  mstBai_S_NForm.ShowModal ;
  mstBai_S_NForm.Release;


end;

procedure TMainForm.ActSintyokuExecute(Sender: TObject);
begin
     Application.CreateForm(TFSintyoku, FSintyoku);
     FSintyoku.ShowModal ;
     FSintyoku.Release ;

end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  Application.CreateForm(TFBarCodePrn, FBarCodePrn);
  FBarCodePrn.ShowModal ;
  FBarCodePrn.Release ;

end;

procedure TMainForm.N7Click(Sender: TObject);
begin

  Application.CreateForm(TmstSakumokuForm, mstSakumokuForm);
  mstSakumokuForm.ShowModal ;
  mstSakumokuForm.Release ;

end;

procedure TMainForm.B1Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt := 'csv';
  OpenDialog1.Filter := 'CSVファイル|*.csv';
  if not OpenDialog1.Execute then exit;
  ImportFile( OpenDialog1.FileName, 'T_UKETUKE' );

  ShowMessage('終了しました。');

end;

procedure TMainForm.C1Click(Sender: TObject);
begin

  if JMode = 'Fuuren' then begin
     ShowMessage( 'このバージョンでは、サポートしていません。' );
     exit;
  end;
  Application.CreateForm(TFJCmt, FJCmt);
  FJCmt.ShowModal ;
  FJCmt.Release ;

end;

procedure TMainForm.ActTaihiExecute(Sender: TObject);
begin




    Application.CreateForm(TfrmUketuke6, frmUketuke6);
    frmUketuke6.ShowModal ;
    frmUketuke6.Release ;



end;

procedure TMainForm.CbJANameChange(Sender: TObject);
var
stmp : String;
begin

  //cbNendo.ItemIndex := cbJANAME.ItemIndex;

  DataModule1.ADOConnection1.Close;
 //FTPJACD := cbJACD.Text;
 FTPTiku := cbJANAME.Text;
 FTPNen := cbNENDO.Text;

  stmp := GetConnection;
  DMU.DataModule1.ADOConnection1.ConnectionString := stmp;


end;

procedure TMainForm.CbNendoChange(Sender: TObject);
var
stmp : String;
begin

 // cbJANAME.ItemIndex := cbNendo.ItemIndex;

  DataModule1.ADOConnection1.Close;
 //FTPJACD := cbJACD.Text;
 FTPTiku := cbJANAME.Text;
 FTPNen := cbNENDO.Text;

  stmp := GetConnection;
  DMU.DataModule1.ADOConnection1.ConnectionString := stmp;


end;

procedure TMainForm.Y1Click(Sender: TObject);
var
stmp : String;
begin
{
    DataModule1.DataBase2.Close;
    stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'01';//  + '\testdata';
    DataModule1.DataBase2.Params.Clear ;
    DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
    Application.CreateForm(TmstYuukiForm, mstYuukiForm);
    mstYuukiForm.ESisyoNO.Text := '1';
    mstYuukiForm.ShowModal ;
    mstYuukiForm.Release ;

end;

procedure TMainForm.D1Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'01';//  + '\testdata';
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstDokaizaiForm, mstDokaizaiForm);
  mstDokaizaiForm.ESisyoNO.Text := '1';
  mstDokaizaiForm.ShowModal ;
  mstDokaizaiForm.Release ;

end;

procedure TMainForm.T1Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'01';//  + '\testdata';
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstTanpiForm, mstTanpiForm);
  mstTanpiForm.ESisyoNO.Text := '1';
  mstTanpiForm.ShowModal ;
  mstTanpiForm.Release ;

end;

procedure TMainForm.S2Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'01';//  + '\testdata';
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
  mstSakuhiForm.ESisyoNO.Text := '1';
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release;

end;

procedure TMainForm.Y2Click(Sender: TObject);
var
stmp : String;
begin
{
    DataModule1.DataBase2.Close;
    stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'02';//江別
    DataModule1.DataBase2.Params.Clear ;
    DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
    Application.CreateForm(TmstYuukiForm, mstYuukiForm);
    mstYuukiForm.ESisyoNO.Text := '2';
    mstYuukiForm.ShowModal ;
    mstYuukiForm.Release ;

end;

procedure TMainForm.K2Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'01';//  + '\testdata';
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstKaseiForm, mstKaseiForm);
//  mstKaseiForm.ESisyoNO.Text := '1';
  mstKaseiForm.ShowModal ;
  mstKaseiForm.Release ;

end;

procedure TMainForm.D2Click(Sender: TObject);
var
stmp : String;
begin
 {
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'02';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
  Application.CreateForm(TmstDokaizaiForm, mstDokaizaiForm);
//  mstDokaizaiForm.ESisyoNO.Text := '2';
  mstDokaizaiForm.ShowModal ;
  mstDokaizaiForm.Release ;

end;

procedure TMainForm.D3Click(Sender: TObject);
var
stmp : String;
begin
 {
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'03';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
  Application.CreateForm(TmstDokaizaiForm, mstDokaizaiForm);
//  mstDokaizaiForm.ESisyoNO.Text := '3';
  mstDokaizaiForm.ShowModal ;
  mstDokaizaiForm.Release ;

end;

procedure TMainForm.D4Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'04';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
  Application.CreateForm(TmstDokaizaiForm, mstDokaizaiForm);
  mstDokaizaiForm.ESisyoNO.Text := '4';
  mstDokaizaiForm.ShowModal ;
  mstDokaizaiForm.Release ;

end;

procedure TMainForm.D5Click(Sender: TObject);
var
stmp : String;
begin
 {
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'05';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
  }
  Application.CreateForm(TmstDokaizaiForm, mstDokaizaiForm);
  mstDokaizaiForm.ESisyoNO.Text := '5';
  mstDokaizaiForm.ShowModal ;
  mstDokaizaiForm.Release ;

end;

procedure TMainForm.Y3Click(Sender: TObject);
var
stmp : String;
begin
{
    DataModule1.DataBase2.Close;
    stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'03';//
    DataModule1.DataBase2.Params.Clear ;
    DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
    Application.CreateForm(TmstYuukiForm, mstYuukiForm);
    mstYuukiForm.ESisyoNO.Text := '3';
    mstYuukiForm.ShowModal ;
    mstYuukiForm.Release ;

end;

procedure TMainForm.Y4Click(Sender: TObject);
var
stmp : String;
begin
{
    DataModule1.DataBase2.Close;
    stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'04';//
    DataModule1.DataBase2.Params.Clear ;
    DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
    Application.CreateForm(TmstYuukiForm, mstYuukiForm);
    mstYuukiForm.ESisyoNO.Text := '4';
    mstYuukiForm.ShowModal ;
    mstYuukiForm.Release ;

end;

procedure TMainForm.Y5Click(Sender: TObject);
var
stmp : String;
begin
{
    DataModule1.DataBase2.Close;
    stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'05';//
    DataModule1.DataBase2.Params.Clear ;
    DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
    Application.CreateForm(TmstYuukiForm, mstYuukiForm);
    mstYuukiForm.ESisyoNO.Text := '5';
    mstYuukiForm.ShowModal ;
    mstYuukiForm.Release ;

end;

procedure TMainForm.T2Click(Sender: TObject);
var
stmp : String;
begin
 {
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'02';//;
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
  Application.CreateForm(TmstTanpiForm, mstTanpiForm);
  mstTanpiForm.ESisyoNO.Text := '2';
  mstTanpiForm.ShowModal ;
  mstTanpiForm.Release ;

end;

procedure TMainForm.T3Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'03';//;
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
  Application.CreateForm(TmstTanpiForm, mstTanpiForm);
  mstTanpiForm.ESisyoNO.Text := '3';
  mstTanpiForm.ShowModal ;
  mstTanpiForm.Release ;

end;

procedure TMainForm.T4Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'04';//;
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
  Application.CreateForm(TmstTanpiForm, mstTanpiForm);
  mstTanpiForm.ESisyoNO.Text := '4';
  mstTanpiForm.ShowModal ;
  mstTanpiForm.Release ;

end;

procedure TMainForm.T5Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'05';//;
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstTanpiForm, mstTanpiForm);
  mstTanpiForm.ESisyoNO.Text := '5';
  mstTanpiForm.ShowModal ;
  mstTanpiForm.Release ;

end;

procedure TMainForm.K3Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'02';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstKaseiForm, mstKaseiForm);
//  mstKaseiForm.ESisyoNO.Text := '2';
  mstKaseiForm.ShowModal ;
  mstKaseiForm.Release ;

end;

procedure TMainForm.K4Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'03';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
  Application.CreateForm(TmstKaseiForm, mstKaseiForm);
//  mstKaseiForm.ESisyoNO.Text := '3';
  mstKaseiForm.ShowModal ;
  mstKaseiForm.Release ;

end;

procedure TMainForm.K5Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'04';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstKaseiForm, mstKaseiForm);
//  mstKaseiForm.ESisyoNO.Text := '4';
  mstKaseiForm.ShowModal ;
  mstKaseiForm.Release ;

end;

procedure TMainForm.K6Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'05';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
  Application.CreateForm(TmstKaseiForm, mstKaseiForm);
//  mstKaseiForm.ESisyoNO.Text := '5';
  mstKaseiForm.ShowModal ;
  mstKaseiForm.Release ;

end;

procedure TMainForm.S3Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'02';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
//  mstSakuhiForm.ESisyoNO.Text := '2';
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release;

end;

procedure TMainForm.S4Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'03';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
//  mstSakuhiForm.ESisyoNO.Text := '3';
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release;

end;

procedure TMainForm.S5Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'04';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
//  mstSakuhiForm.ESisyoNO.Text := '4';
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release;

end;

procedure TMainForm.S6Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'05';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
//  mstSakuhiForm.ESisyoNO.Text := '5';
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release;

end;

procedure TMainForm.Y6Click(Sender: TObject);
var
stmp : String;
begin
{
    DataModule1.DataBase2.Close;
    stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'06';//  + '\testdata';
    DataModule1.DataBase2.Params.Clear ;
    DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
    Application.CreateForm(TmstYuukiForm, mstYuukiForm);
//    mstYuukiForm.ESisyoNO.Text := '6';
    mstYuukiForm.ShowModal ;
    mstYuukiForm.Release ;

end;

procedure TMainForm.Y7Click(Sender: TObject);
var
stmp : String;
begin
{
    DataModule1.DataBase2.Close;
    stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'07';//  + '\testdata';
    DataModule1.DataBase2.Params.Clear ;
    DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
    Application.CreateForm(TmstYuukiForm, mstYuukiForm);
//    mstYuukiForm.ESisyoNO.Text := '7';
    mstYuukiForm.ShowModal ;
    mstYuukiForm.Release ;

end;

procedure TMainForm.D6Click(Sender: TObject);
var
stmp : String;
begin
 {
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'06';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
  }
  Application.CreateForm(TmstDokaizaiForm, mstDokaizaiForm);
//  mstDokaizaiForm.ESisyoNO.Text := '6';
  mstDokaizaiForm.ShowModal ;
  mstDokaizaiForm.Release ;

end;

procedure TMainForm.D7Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'07';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
  Application.CreateForm(TmstDokaizaiForm, mstDokaizaiForm);
  mstDokaizaiForm.ShowModal ;
  mstDokaizaiForm.Release ;

end;

procedure TMainForm.T6Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'06';//;
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstTanpiForm, mstTanpiForm);
//  mstTanpiForm.ESisyoNO.Text := '6';
  mstTanpiForm.ShowModal ;
  mstTanpiForm.Release ;

end;

procedure TMainForm.T7Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'07';//;
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
 }
  Application.CreateForm(TmstTanpiForm, mstTanpiForm);
//  mstTanpiForm.ESisyoNO.Text := '7';
  mstTanpiForm.ShowModal ;
  mstTanpiForm.Release ;

end;

procedure TMainForm.K7Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'06';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstKaseiForm, mstKaseiForm);
//  mstKaseiForm.ESisyoNO.Text := '6';
  mstKaseiForm.ShowModal ;
  mstKaseiForm.Release ;


end;

procedure TMainForm.K8Click(Sender: TObject);
var
stmp : String;
begin
{
  DataModule1.DataBase2.Close;
  stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'07';//
  DataModule1.DataBase2.Params.Clear ;
  DataModule1.DataBase2.Params.Add ( 'path='+stmp);
}
  Application.CreateForm(TmstKaseiForm, mstKaseiForm);
//  mstKaseiForm.ESisyoNO.Text := '7';
  mstKaseiForm.ShowModal ;
  mstKaseiForm.Release ;


end;

procedure TMainForm.S7Click(Sender: TObject);
var
stmp : String;
begin


  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
//  mstSakuhiForm.ESisyoNO.Text := '6';
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release;

end;

procedure TMainForm.S8Click(Sender: TObject);
var
stmp : String;
begin


  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
//  mstSakuhiForm.ESisyoNO.Text := '7';
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release;

end;

procedure TMainForm.Y8Click(Sender: TObject);
var
stmp : String;
begin

    Application.CreateForm(TmstYuukiForm, mstYuukiForm);
//    mstYuukiForm.ESisyoNO.Text := '8';
    mstYuukiForm.ShowModal ;
    mstYuukiForm.Release ;

end;

procedure TMainForm.D8Click(Sender: TObject);
var
stmp : String;
begin

  Application.CreateForm(TmstDokaizaiForm, mstDokaizaiForm);
//  mstDokaizaiForm.ESisyoNO.Text := '8';
  mstDokaizaiForm.ShowModal ;
  mstDokaizaiForm.Release ;

end;

procedure TMainForm.T8Click(Sender: TObject);
var
stmp : String;
begin

  Application.CreateForm(TmstTanpiForm, mstTanpiForm);
//  mstTanpiForm.ESisyoNO.Text := '8';
  mstTanpiForm.ShowModal ;
  mstTanpiForm.Release ;

end;

procedure TMainForm.K9Click(Sender: TObject);
var
stmp : String;
begin

  Application.CreateForm(TmstKaseiForm, mstKaseiForm);
//  mstKaseiForm.ESisyoNO.Text := '8';
  mstKaseiForm.ShowModal ;
  mstKaseiForm.Release ;

end;

procedure TMainForm.S9Click(Sender: TObject);
var
stmp : String;
begin

  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
//  mstSakuhiForm.ESisyoNO.Text := '8';
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release;

end;

procedure TMainForm.ActKanniExecute(Sender: TObject);
var
  RecCnt : integer ;
  aDevice:Array[0..255] of char;
  aDriver:Array[0..255] of char;
  aPort:Array[0..32] of char;
  PDM: PDeviceMode;
  aDevMode: THandle;
  sret : String;
begin
    sret := DspInputNo( self, 1 );
    if sret = '' then exit;
        Application.CreateForm(TSindanForm, SindanForm);
        //最初の一覧表示
        SindanForm.EMode.Text := sret;
        SindanForm.ShowModal ; //一覧から印刷対象の再設定
        if SindanForm.FRes then begin
            //全体の件数を割り出す
            with DataModule1.QueryRead do begin
                {Version 0.6 #26 削除フラグ追加}
                SQL.Text := 'Select Count(*) cnt from T_UKETUKE where 削除フラグ<>True and ' + SQLCondition ;
                Open;
                RecCnt := FieldByName('cnt').asInteger ;
                Close;
            end;
//          OpenProgress;
            //一件当たりのステップ数
//          frmProgress.Scale(Floor(333/RecCnt));
            //H150828      Pages := RecCnt;

            //プリンタの設定
            //  Printer.PrinterIndex := -1;
            Printer.PrinterIndex := Printer.PrinterIndex;
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            Printer.SetPrinter(aDevice, aDriver, aPort, 0);
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            PDM := GlobalLock(aDevMode); //メモリをロックする　領域をとるわけではない。

//            if JMode = 'Douou' then begin
                     PDM^.dmPaperSize := DMPAPER_A4;
                     PDM^.dmOrientation := DMORIENT_LANDSCAPE; // 横
                     //DMORIENT_PORTRAIT;
//            end
//            else if JMode = 'Fuuren' then begin
//                     PDM^.dmPaperSize := DMPAPER_B4;
//                     PDM^.dmOrientation := DMORIENT_PORTRAIT; // 縦
//            end
//            else begin
//                     PDM^.dmPaperSize := DMPAPER_A4;
//                     PDM^.dmOrientation := DMORIENT_PORTRAIT; // 縦
//            end;
            GlobalUnlock(aDevMode); //メモリを開放　領域を消すわけではない。
            Printer.SetPrinter(aDevice, aDriver, aPort, aDevMode);

//            if sret <> '分析値のみ' then begin
//                DspPrnReport( self,rtSindan, RecCnt );
//            end
//            else begin
                DspPrnReport( self,rtBunseki, RecCnt );
//            end;
        end;
        SindanForm.Release ;
//    end;

end;

procedure TMainForm.N13Click(Sender: TObject);
begin

  Application.CreateForm(TmstSehi_T, mstSehi_T);
  mstSehi_HForm.ShowModal ;
  mstSehi_HForm.Release;


end;

procedure TMainForm.T9Click(Sender: TObject);
begin

  Application.CreateForm(TmstSehi_T, mstSehi_T);
  mstSehi_T.ShowModal ;
  mstSehi_T.Release;

end;


procedure TMainForm.uketuke001Execute(Sender: TObject);
begin

    Application.CreateForm(TfrmUketuke1, frmUketuke1);
    frmUketuke1.ShowModal ;
    frmUketuke1.Release ;

end;

procedure TMainForm.uketuke002Execute(Sender: TObject);
begin
    Application.CreateForm(TfrmUketuke2, frmUketuke2);
    frmUketuke2.ShowModal ;
    frmUketuke2.Release ;
end;

procedure TMainForm.uketuke003Execute(Sender: TObject);
begin
    Application.CreateForm(TfrmUketuke3, frmUketuke3);
    frmUketuke3.ShowModal ;
    frmUketuke3.Release ;

end;

procedure TMainForm.uketuke004Execute(Sender: TObject);
begin
        Application.CreateForm(TfrmUketuke4, frmUketuke4);
    frmUketuke4.ShowModal ;
    frmUketuke4.Release ;

end;

procedure TMainForm.uketuke005Execute(Sender: TObject);
begin

    Application.CreateForm(TfrmUketuke5, frmUketuke5);
    frmUketuke5.ShowModal ;
    frmUketuke5.Release ;

end;

procedure TMainForm.uketuke007Execute(Sender: TObject);
begin
    Application.CreateForm(TfrmUketuke7, frmUketuke7);
    frmUketuke7.ShowModal ;
    frmUketuke7.Release ;

end;

procedure TMainForm.uketuke008Execute(Sender: TObject);
begin
                 Application.CreateForm(TfrmUketuke8, frmUketuke8);
    frmUketuke8.ShowModal ;
    frmUketuke8.Release ;

end;

procedure TMainForm.ActShindanTaihiExecute(Sender: TObject);
var
  RecCnt : integer ;
aDevice:Array[0..255] of char;
aDriver:Array[0..255] of char;
aPort:Array[0..32] of char;
PDM: PDeviceMode;
aDevMode: THandle;
sret : String;

begin

    JMode_Ikubyou := false;

    sret := DspInputNo( self, 2 );

    if sret = '' then exit;

    Application.CreateForm(TSindanForm, SindanForm);
    //最初の一覧表示
    SindanForm.EMode.Text := sret;
    SindanForm.ShowModal ; //一覧から印刷対象の再設定



    if SindanForm.FRes then begin
            //全体の件数を割り出す
            with DataModule1.QueryRead do begin
                {Version 0.6 #26 削除フラグ追加}
                SQL.Text := 'Select * from T_UKETUKE2 where 削除フラグ<>True and  ' + SQLCondition ;
                Open;
                RecCnt := DataModule1.QueryRead.RecordCount;    //ieldByName('cnt').asInteger ;
                Close;
            end;

            //プリンタの設定
            //  Printer.PrinterIndex := -1;
            Printer.PrinterIndex := Printer.PrinterIndex;
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            Printer.SetPrinter(aDevice, aDriver, aPort, 0);
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            PDM := GlobalLock(aDevMode); //メモリをロックする　領域をとるわけではない。


            PDM^.dmPaperSize := DMPAPER_A4;
            PDM^.dmOrientation := DMORIENT_PORTRAIT; // 縦
//            PDM^.dmOrientation := DMORIENT_LANDSCAPE; // 横


            GlobalUnlock(aDevMode); //メモリを開放　領域を消すわけではない。
            Printer.SetPrinter(aDevice, aDriver, aPort, aDevMode);



//            if sret <> '分析値のみ' then begin
                DspPrnReport( self,rtTaihi, RecCnt );
//            end
//            else begin
//                DspPrnReport( self,rtBunseki, RecCnt );
//            end;


    end;
    SindanForm.Release ;
end;

procedure TMainForm.ActShindanSiryouExecute(Sender: TObject);
var
  RecCnt : integer ;
aDevice:Array[0..255] of char;
aDriver:Array[0..255] of char;
aPort:Array[0..32] of char;
PDM: PDeviceMode;
aDevMode: THandle;
sret : String;

begin

    JMode_Ikubyou := false;

    sret := DspInputNo( self, 3 );

    if sret = '' then exit;

    Application.CreateForm(TSindanForm, SindanForm);
    //最初の一覧表示
    SindanForm.EMode.Text := sret;
    SindanForm.ShowModal ; //一覧から印刷対象の再設定



    if SindanForm.FRes then begin
            //全体の件数を割り出す
            with DataModule1.QueryRead do begin
                {Version 0.6 #26 削除フラグ追加}
                SQL.Text := 'Select * from T_UKETUKE3 where 削除フラグ<>True and  ' + SQLCondition ;
                Open;


                RecCnt := DataModule1.QueryRead.RecordCount;

                //FieldByName('cnt').asInteger ;
                Close;
            end;

            //プリンタの設定
            //  Printer.PrinterIndex := -1;
            Printer.PrinterIndex := Printer.PrinterIndex;
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            Printer.SetPrinter(aDevice, aDriver, aPort, 0);
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            PDM := GlobalLock(aDevMode); //メモリをロックする　領域をとるわけではない。


            PDM^.dmPaperSize := DMPAPER_A4;
            PDM^.dmOrientation := DMORIENT_PORTRAIT; // 縦
//            PDM^.dmOrientation := DMORIENT_LANDSCAPE; // 横


            GlobalUnlock(aDevMode); //メモリを開放　領域を消すわけではない。
            Printer.SetPrinter(aDevice, aDriver, aPort, aDevMode);



//            if sret <> '分析値のみ' then begin
                DspPrnReport( self,rtSiryou, RecCnt );
//            end
//            else begin
//                DspPrnReport( self,rtBunseki, RecCnt );
//            end;


    end;
    SindanForm.Release ;

end;

procedure TMainForm.ActBunseki3Execute(Sender: TObject);
begin
     Application.CreateForm(TfrmBunseki, frmBunseki);
     frmBunseki.EMode.Text := '3';
     frmBunseki.ShowModal ;
     frmBunseki.Release ;

end;

procedure TMainForm.T10Click(Sender: TObject);
var
sret : String;
begin
    Application.CreateForm(TInputNoForm, InputNoForm);

    InputNoForm.EMode.Text := '土壌';

    InputNoForm.PageControl1.ActivePageIndex := 0 ;


    InputNoForm.ShowModal ; //一覧から印刷対象の再設定

    sret := InputNoForm.EMode.Text;
    //sret := DspInputNo( Sender, 1 );

    //if sret = '' then exit;
    InputNoForm.Release ;

    Application.CreateForm(TSindanForm, SindanForm);
    //最初の一覧表示
    SindanForm.EMode.Text := sret;
    SindanForm.btnPreview.Caption := '出力実行';
    SindanForm.ShowModal ; //一覧から印刷対象の再設定

    if SindanForm.FRes then begin
      if SaveDialog1.Execute then begin
        ExportFileGIS('地図',SaveDialog1.FileName );

        ShowMessage('出力しました。');
      end;
    end;

    SindanForm.Release ;

    

end;

procedure TMainForm.nmBukaiClick(Sender: TObject);
begin
  Application.CreateForm(TmstBukaiForm, mstBukaiForm);
  mstBukaiForm.ShowModal ;
  mstBukaiForm.Release ;

end;

procedure TMainForm.I1Click(Sender: TObject);
var
sret : String;
begin

    Application.CreateForm(TInputNoForm, InputNoForm);

    InputNoForm.EMode.Text := '堆肥';

    InputNoForm.PageControl1.ActivePageIndex := 0 ;


    InputNoForm.ShowModal ; //一覧から印刷対象の再設定

    sret := InputNoForm.EMode.Text;
    //sret := DspInputNo( Sender, 1 );

    InputNoForm.Release ;

    if sret = '' then exit;


    Application.CreateForm(TSindanForm, SindanForm);
    //最初の一覧表示
    SindanForm.EMode.Text := sret;
    SindanForm.btnPreview.Caption := '出力実行';
    SindanForm.ShowModal ; //一覧から印刷対象の再設定

    if SindanForm.FRes then begin

      if SaveDialog1.Execute then begin
        ExportFile('t_uketuke2',SaveDialog1.FileName );

       ShowMessage('出力しました。');
      end;
    end;
    SindanForm.Release ;



end;

procedure TMainForm.T11Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt := 'csv';
  OpenDialog1.Filter := 'CSVファイル|*.csv';
  if not OpenDialog1.Execute then exit;
  ImportFile( OpenDialog1.FileName, 'T_UKETUKE2' );

  ShowMessage('終了しました。');

end;

procedure TMainForm.S11Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt := 'csv';
  OpenDialog1.Filter := 'CSVファイル|*.csv';
  if not OpenDialog1.Execute then exit;
  ImportFile( OpenDialog1.FileName, 'T_UKETUKE3' );

  ShowMessage('終了しました。');

end;

procedure TMainForm.S12Click(Sender: TObject);
begin
    Application.CreateForm(TfrmUkeSiryou, frmUkeSiryou);
    frmUkeSiryou.ShowModal ;
    frmUkeSiryou.Release ;

end;

procedure TMainForm.T13Click(Sender: TObject);
begin
     Application.CreateForm(TfrmBunseki, frmBunseki);
     frmBunseki.EMode.Text := '2';
     frmBunseki.ShowModal ;
     frmBunseki.Release ;

end;

procedure TMainForm.S13Click(Sender: TObject);
begin
     Application.CreateForm(TfrmBunseki, frmBunseki);
     frmBunseki.EMode.Text := '3';
     frmBunseki.ShowModal ;
     frmBunseki.Release ;

end;

procedure TMainForm.K10Click(Sender: TObject);
begin
  Application.CreateForm(TFKingaku, FKingaku);
  FKingaku.ShowModal ;
  FKingaku.Release ;

end;

end.

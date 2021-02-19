unit MainU;
{
  ���[����ʁF���O�̃f�[�^���W���[�����j�b�g�̐������K�v
}

//�@���V�X�e���@
//  Ver 3.9.0  R2.3.17�@�I�z�[�c�N



//  Ver 0.00    2020/9/11  A.Nishimura  ��{�쐬
//  Ver 0.17    2021/2/3  A.Nishimura  ��{�쐬 ���i���ł������炢








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
    { Private �錾 }
    FIsOnline : Boolean ;

    FIsFTPError,FIsConnected,FIsDirectoryChanged,FIsDirectoryCreated : Boolean;
    FListingDone,FIsFileRecived,FIsFileStored,FIsRenamed,FIsFileDeleted : Boolean ;
    FFTPLastError : string ;
    FMsg : TStringList ;       //�T�[�o�[���b�Z�[�W
{
    FSyncDone : Boolean ;  //������������
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
    { Public �錾 }
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
  SystemName = 'NK-Psoil(�G�k�E�P�C�E�s�[�E�\�C�� ) �y��f�f�E�{��݌v�V�X�e��';
  MINTIMEOUT = 20 ; //�]�����ԍŒ�^�C���A�E�g��
  STDTIMEOUT = 10 ; //�ʏ�R�}���h�^�C���A�E�g��

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
//  MsgLabel.Caption := '�@�y����M���b�Z�[�W�z';
//	Caption := SystemName  ;



  // �A�v���P�[�V�������̕\��
  lblAppName.Caption := 'NK-Psoil' + #13#10 + #13#10 + '�y��f�f�E�{��݌v�V�X�e��';



  //2019.12.11 �o�[�W���������߂�
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















  // �����摜�\��t��
  //pictfile := SystemIni.ReadString('system', 'picture', '' ) ;
  //if pictfile <> '' then begin
    //pictfile := 'TOP*.jpg';
    //Image1.Picture.LoadFromFile(AnsiReplaceStr(pictfile, 'TOP', 'TOP_1'));
    //Image2.Picture.LoadFromFile(AnsiReplaceStr(pictfile, 'TOP', 'TOP_2'));

    JpgDir := ExtractFileDir(Application.ExeName);
    if TDirectory.Exists(JpgDir + '\picture') then
      //�t�@�C���̃��X�g���擾
      //�w��̃p�^�[���Ɉ�v����t�@�C�������������o��
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


  //���[�h�̓ǂݍ���
  JMode := SystemIni.ReadString('system', 'Mode', 'Kihon' ) ;
  JBerCode := SystemIni.ReadBool('system', 'BerCode', false ) ;
  JBunseki := SystemIni.ReadBool('system', 'Bunseki', false ) ;
  JUketuke := SystemIni.ReadBool('system', 'Uketuke', false ) ;
  JMaster := SystemIni.ReadBool('system', 'Mas', false ) ;
  JFukyuu := SystemIni.ReadBool('system', 'Fukyuu', false ) ;

  FIsOnline := False ;
  //�}�X�^�������l�b�g�g�p�L���̐ݒ�
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
// �f�[�^�x�[�X�̐ڑ��Bsystem.ini�̓��e����

//  if ChangeDataBase(EntryCenter,EntryYear) then
		DspCaption ;

  //�Z���^�[�}�X�^�ɓo�^���Ȃ���Γo�^�𑣂��B
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


     //�f�[�^�x�[�X�I�[�v��
  DataModule1.ADOConnectionNOU.Close;
  stmp := 'Provider=Microsoft.Jet.OLEDB.4.0;';
  stmp := stmp + 'Data Source=';
  stmp := stmp + FTPServer+'\nkpsoilmas.mdb;';
  stmp := stmp + 'Persist Security Info=False';
  DataModule1.ADOConnectionNou.ConnectionString := stmp;
  DataModule1.ADOConnectionNou.Open('Admin','');





//�_����
  //cbJAcd.Items.Clear;
  cbJANAME.Items.Clear;


  DataModule1.ADONoukyou.SQL.Clear;
  stmp := 'select * from M_NOUKYOU ORDER BY �_���R�[�h';
  DataModule1.ADONoukyou.SQL.Text := stmp;
  DataModule1.ADONoukyou.Open;

  with DataModule1.ADONoukyou do begin



    while not Eof do begin
//      stmp := FieldByName('�_���R�[�h').AsString;
//       cbJAcd.Items.Add(stmp);
      stmp := FieldByName('�_����').AsString;
      cbJANAME.Items.add(stmp);

           Next;
    end;
  end;

  DataModule1.ADONoukyou.Close;



  //�N�x�̐ݒ�
  DataModule1.ADONoukyou.SQL.Clear;
  stmp := 'select * from M_YEARLIST ORDER BY �N';
  DataModule1.ADONoukyou.SQL.ADD(stmp);
  DataModule1.ADONoukyou.Open;

  CbNendo.Items.Clear;

  with DataModule1.ADONoukyou do begin

      First;


      while not EOF do begin

        itmp := FieldbyName('�N').AsInteger;
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

  itmp :=  DataModule1.ADONoukyou.FieldbyName('���ݔN').AsInteger;
  ThisYear := inttostr(itmp);

  DataModule1.ADONoukyou.Close;


  DataModule1.ADOConnectionNou.Close;



  //ini�t�@�C������
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








  //�f�[�^�x�[�X�ύX 2014/2/19
{
   DataModule1.Query1.Close;
   stmp := Apppath + EntryCenter+'\'+EntryYear;
   DataModule1.Query1.DatabaseName := stmp;
   stmp := 'select * from M_SEHI_H';
   DataModule1.Query1.SQL.Clear;
   DataModule1.Query1.SQL.Add(stmp);
   DataModule1.Query1.Open;

   try
     itmp := DataModule1.Query1.Fieldbyname('���{��').asinteger;


   except

     DataModule1.Query1.Close;
     DataModule1.Query1.SQL.Clear;
     stmp := 'ALTER TABLE M_SEHI_H ADD COLUMN ���{�� INTEGER'; //CHAR(255)
     DataModule1.Query1.SQL.Add(stmp);
     DataModule1.Query1.ExecSQL;

  end;
}




  // �^�C�}�[�X�^�[�g
  Timer1.Enabled := true;
  TimerCount := 0;


  btnUketuke.SetFocus;

  hMenuHandle := GetSystemMenu(Self.Handle,False);
  if hMenuHandle <> 0 then
  begin
    EnableMenuItem(hMenuHandle, SC_CLOSE, (MF_BYCOMMAND or MF_DISABLED or MF_GRAYED));
  end;
  DrawMenuBar(Self.Handle);



  //���݂̃��j���[�̍��ڐ����擾���Ĉ�ԉ��̋�؂�����폜
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
//show�̌�ɌĂяo��
procedure TMainForm.SyncFirst ;
begin
	Refresh;
// �N�����ɓ����������s���F�Z���^�[�����肵����
	while IsUseNet do begin
  	FIsOnline := True ;
    Cursor := crAppStart	;
    FSyncDone := False ;	//��������������
  	FTPStart ;

	  //���������I���܂ő҂B
    while FIsOnline do  Application.ProcessMessages  ;
    Refresh;
    if not FSyncDone then
    	ShowMessage('���������͐���ɏI���o���܂���ł����B');
  	StatusBar1.Panels[0].Text := '';
  	StatusBar1.Panels[1].Text := '';
  	StatusBar1.Panels[2].Text := '';
    Cursor := crDefault	;
    break;
  end;
  if ChangeDataBase(EntryCenter,EntryYear) then
		DspCaption ;

  //�Z���^�[�}�X�^�ɓo�^���Ȃ���Γo�^�𑣂��B
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
    // �摜1
    strtmp := 'TOP_'+TimerCount.ToString.Trim;
    Image1.Picture.LoadFromFile(AnsiReplaceStr(pictfile, 'TOP', strtmp));

    // �摜2
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

    //�t�@�C���̃��X�g���擾
    //�w��̃p�^�[���Ɉ�v����t�@�C�������������o��
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
  //�t�H�[���^�C�g���ɕ\������
 //	Caption := SystemName + ' (Ver' +AppGetInfo(Application.exename,3)+') '+ EntryCenterName + ' : ' + EntryYear +  '�N�x';








  end;
{�_���}�X�^}
procedure TMainForm.nmNoukyouClick(Sender: TObject);
begin
  Application.CreateForm(TmstNoukyouForm, mstNoukyouForm);
	mstNoukyouForm.ShowModal ;
  mstNoukyouForm.Release ;
end;
{�_�ƃ}�X�^}
procedure TMainForm.nmNoukaClick(Sender: TObject);
begin
  Application.CreateForm(TmstNoukaForm, mstNoukaForm);
  mstNoukaForm.ShowModal ;
  mstNoukaForm.Release ;
end;
{�y��}�X�^}
procedure TMainForm.nmDojouClick(Sender: TObject);
begin
  Application.CreateForm(TmstDojouForm, mstDojouForm);
  mstDojouForm.ShowModal ;
  mstDojouForm.Release ;
end;
{�y���}�X�^}
procedure TMainForm.nmDoseiClick(Sender: TObject);
begin
  Application.CreateForm(TmstDoseiForm, mstDoseiForm);
  mstDoseiForm.ShowModal ;
  mstDoseiForm.Release ;
end;
{���A�}�X�^}
procedure TMainForm.nmFushokuClick(Sender: TObject);
begin
  Application.CreateForm(TmstFushokuForm, mstFushokuForm);
  mstFushokuForm.ShowModal ;
  mstFushokuForm.Release ;
end;
{�Z���^�[�}�X�^}
procedure TMainForm.nmCenterClick(Sender: TObject);
begin
  Application.CreateForm(TmstCenterForm, mstCenterForm);
  mstCenterForm.ShowModal ;
  mstCenterForm.Release ;
end;
{�s�����}�X�^}
procedure TMainForm.nmCityClick(Sender: TObject);
begin
  Application.CreateForm(TmstCityForm, mstCityForm);
  mstCityForm.ShowModal ;
  mstCityForm.Release ;
end;
{�n��}�X�^}
procedure TMainForm.nmTikuClick(Sender: TObject);
begin
  Application.CreateForm(TmstTikuForm, mstTikuForm);
  mstTikuForm.ShowModal ;
  mstTikuForm.Release ;
end;
{�L�@�}�X�^}
procedure TMainForm.nmSizaiClick(Sender: TObject);
begin
  Application.CreateForm(TmstYuukiForm, mstYuukiForm);
  mstYuukiForm.ShowModal ;
  mstYuukiForm.Release ;
end;
{�y���ރ}�X�^}
procedure TMainForm.nmDokaizaiClick(Sender: TObject);
begin
  Application.CreateForm(TmstDokaizaiForm, mstDokaizaiForm);
  mstDokaizaiForm.ShowModal ;
  mstDokaizaiForm.Release ;
end;
{�P��}�X�^}
procedure TMainForm.nmTanpiClick(Sender: TObject);
begin
  Application.CreateForm(TmstTanpiForm, mstTanpiForm);
  mstTanpiForm.ShowModal ;
  mstTanpiForm.Release ;
end;
{�����}�X�^}
procedure TMainForm.nmKaseiClick(Sender: TObject);
begin
  Application.CreateForm(TmstKaseiForm, mstKaseiForm);
  mstKaseiForm.ShowModal ;
  mstKaseiForm.Release ;
end;
{��ڃ}�X�^}
procedure TMainForm.nmSakumokuClick(Sender: TObject);
begin
  Application.CreateForm(TmstSakumokuForm, mstSakumokuForm);
  mstSakumokuForm.ShowModal ;
  mstSakumokuForm.Release ;
end;
{�앨�}�X�^}
procedure TMainForm.nmSakumotuClick(Sender: TObject);
begin
  Application.CreateForm(TmstSakumotuForm, mstSakumotuForm);
  mstSakumotuForm.ShowModal ;
  mstSakumotuForm.Release ;
end;
{��^�}�X�^}
procedure TMainForm.nmSakugataClick(Sender: TObject);
begin
  Application.CreateForm(TmstSakugataForm, mstSakugataForm);
  mstSakugataForm.ShowModal ;
  mstSakugataForm.Release ;
end;
{�o�[�W�������_�C�A���O}
procedure TMainForm.About1Click(Sender: TObject);
begin
  Application.CreateForm(TAboutBox, AboutBox);
  AboutBox.ShowModal ;
  AboutBox.Release ;
end;
{�ޏ�}�X�^}
procedure TMainForm.nmHojouClick(Sender: TObject);
begin
  Application.CreateForm(TmstHojouForm, mstHojouForm);
  mstHojouForm.ShowModal ;
  mstHojouForm.Release ;
end;
{��}�X�^}
procedure TMainForm.nmKijunClick(Sender: TObject);
begin
  Application.CreateForm(TmstKijun1Form, mstKijun1Form);
  mstKijun1Form.ShowModal ;
  mstKijun1Form.Release ;
end;
{��t�ꗗ���}
procedure TMainForm.nmUkeListClick(Sender: TObject);
begin
  Application.CreateForm(TfrmLUketuke, frmLUketuke);
  frmLUketuke.ShowModal ;
  frmLUketuke.Release ;
end;

procedure TMainForm.NOUTIClick(Sender: TObject);
begin

end;

{�V�~�����[�V�������}
procedure TMainForm.ActionSimExecute(Sender: TObject);
begin

showmessage('������');

end;
{�엿�ݒ�}
procedure TMainForm.nmSetHiryoClick(Sender: TObject);
begin
  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
  mstSakuhiForm.ShowModal ;
  mstSakuhiForm.Release;
end;
{�{��W����}
procedure TMainForm.nmSehiHatakeClick(Sender: TObject);
begin
  Application.CreateForm(TmstSehi_HForm, mstSehi_HForm);
  mstSehi_HForm.ShowModal ;
  mstSehi_HForm.Release;
end;
{�{��W������}
procedure TMainForm.nmSehiSuiClick(Sender: TObject);
begin
end;
{�{��W�����|}
procedure TMainForm.nmSehiEngeiClick(Sender: TObject);
begin
  Application.CreateForm(TmstSehi_EForm, mstSehi_EForm);
  mstSehi_EForm.ShowModal ;
  mstSehi_EForm.Release;
end;
{�{��W���q��}
procedure TMainForm.nmSehiBokuClick(Sender: TObject);
begin
  Application.CreateForm(TmstSehi_BForm, mstSehi_BForm);
  mstSehi_BForm.ShowModal ;
  mstSehi_BForm.Release;
end;
{�R�����g�}�X�^}
procedure TMainForm.nmJikouClick(Sender: TObject);
begin
  Application.CreateForm(TmstCMTForm, mstCMTForm);
  mstCMTForm.ShowModal ;
  mstCMTForm.Release;
end;
//�Z���^�[�؂�ւ�
procedure TMainForm.nmSetCenterClick(Sender: TObject);
var
	Center : string ;
begin
	Center := EntryCenter ;
	if DspCenter( Center ) then begin
	  if Application.MessageBox ('�o�^����f�[�^�x�[�X��ύX���܂��B��낵���ł����H','�m�F', MB_YESNO ) = ID_YES then
			if ChangeCenter( Center ) then
  //      SetYearEnable
      else
      	showmessage('�Z���^�[�؂�ւ��͂ł��܂���ł����B') ;

  end;
	DspCaption;
end;
//�N�x�؂�ւ�
procedure TMainForm.nmSetYearClick(Sender: TObject);
var
	Year : string;
begin
	Year := EntryYear ;
	if DspYear( Year ) then begin
	  if Application.MessageBox ('�o�^����f�[�^�x�[�X��ύX���܂��B��낵���ł����H','�m�F', MB_YESNO ) = ID_YES then
			if ChangeYear( Year ) then
//        SetYearEnable
      else
      	showmessage('�N�x�f�[�^�؂�ւ��͂ł��܂���ł����B');
  end;
	DspCaption;
end;
//�V�N�x�f�[�^�쐬
procedure TMainForm.nmBuildYearClick(Sender: TObject);
var
	aBuff :string ;
begin
	aBuff := '�V�����N�x�̍쐬';
  if Application.MessageBox ('�V�����N�x���쐬���܂��B��낵���ł����H',
  	PChar(aBuff), MB_YESNO ) = ID_NO then begin
  	exit ;
	end;
  MakeNewYearData;
  //SetYearEnable;
end;


//�w��f�[�^�̕���
procedure TMainForm.nmManuDataCopyClick(Sender: TObject);
begin
//�g�����U�N�V�����̓I���W�i�����畡��
//�g�����U�N�V�������̂����}�X�^�𕡎�
end;
//�l�b�g���[�N�ݒ�
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
   	INSTFileAge := 0;	{���O�������ꍇ��}
  end else
   	INSTFileAge := FileDateToDateTime(iAge);

 	iAge := FileAge( sFile );
  if iAge = -1 then begin
    result := True;
  	exit;	{�T�[�o�[�ɖ����Ƃ��͎�}
  end;
  SVFileAge := FileDateToDateTime(iAge);
  {�^�C���X�^���v��r}
//    showmessage(FileList[cnt]+':SV='+Floattostr(SVFileAge)+'HD='+Floattostr(INSTFileAge));

  if SVFileAge > INSTFileAge then begin
//        showmessage(SVDir+FileList[cnt]+'->'+INSTDir+FileList[cnt]);

    sFileName := sFile ;
    dFileName := dFile ;
		//Ver 1.2 �g���q��EXE�̏ꍇ���k�t�@�C�����w�肵�ēW�J����
    if UpperCase(ExtractFileExt(sFile)) = '.EXE' then begin
      if FileExists(ChangeFileExt(sFile ,'.LZH')) then begin
	     	sFileName := ChangeFileExt(sFile ,'.LZH') ;
  	   	dFileName := ChangeFileExt(dFile ,'.LZH') ;
      end;
		end;

    {Ver 1.2 �����ݐ�̑������m�F����}
		if FileExists(dFileName) then begin
    	Attr := FileGetAttr(dFileName);
    	if (Attr and myReadOnly) <> 0 then
      	FileSetAttr(dFileName, Attr - myReadOnly);
  	end;

	  StatusBar1.Panels[2].Text := '�_�E�����[�h�� : '+ExtractFileName(sFileName) ;
   	StatusBar1.Refresh ;

{
    if CopyFile(PChar(sFileName),PChar(dFileName),False) = False then begin
      showmessage('Auto update failed. ('+SysErrorMessage(Getlasterror)+')') ;
      exit;
    end
    else begin {���k�t�@�C���̏ꍇ�𓀂���}
			SHChangeNotify(SHCNE_CREATE or SHCNE_UPDATEDIR,SHCNF_PATH ,
    			PChar(UsrExtractFilePath(dFileName)),nil);
      if UpperCase(ExtractFileExt(dFileName)) = '.LZH' then begin
        UnZip(dFileName);
      end;
    end;
}
		{�R�s�[������X�V�n�̃t�@�C���̂��߂ɏ����ݑ����m�F}
 		Attr := FileGetAttr(dFile);
 		if (Attr and myReadOnly) <> 0 then
   		FileSetAttr(dFile, Attr - myReadOnly);
	end;
  result := True;
end;
*)
{
		���k����
    aFileName :�@�p�X�t���g���q�Ȃ��t�@�C�����i���k��.lzh �툳�k��.*�j
    aPath : �툳�k�t�@�C���̂���p�X ���[����
    aZipFile : �p�X�t�����k�t�@�C����
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
  GetMem(szCmdline, wSize); //�̈�m��
  GetMem(szOutput, wSize); //�̈�m��
  {���k����}
  try
      //�R�}���h�{�X�C�b�`�{���k�t�@�C���{���k�t�@�C���f�B���N�g���{�툳�k�t�@�C���Q�@�A�v�����[�g�ɂł���
	  	Buff := '"'+aZipFile +'" "'+aPath+'" '+ aFileName+'.*';
//-n:�󋵃_�C�A���O�\���}�~
//-y:�S�Ă̎����yes
//-t:���ɂ̍X�V�������C���ɓ��̍ŐV�̊i�[�t�@�C���̂��̂ɍ��킹�܂��B
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
		�𓀏���
    pZipFile : ���k�t�@�C����
    pPath : �𓀊�f�B���N�g��
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
  GetMem(szCmdline, wSize); //�̈�m��
  GetMem(szOutput, wSize); //�̈�m��
  {�𓀂���}
  try
      //�R�}���h�{�X�C�b�`�{���k�t�@�C���{�W�J�f�B���N�g��
	  	Buff := '"'+pZipName +'" "'+pPath+'"';
//-c:�^�C���X�^���v�Ɋ֌W�Ȃ����㏑��
//-n:�󋵃_�C�A���O�\���}�~
//-y:�S�Ă̎����yes
   		strpcopy(szCmdline, 'e -c -n -y '+ Buff );
   		Res :=  Unlha(Application.Handle ,szCmdline,szOutput,wSize) ;

  finally
	  if Res <> 0 then begin
    	showmessage( szoutput );
  	end;
  	FreeMem(szCmdline);
  	FreeMem(szOutput);
  end;
  {�폜����}
//	Ver 1.2 ���t��r�p�ɂ̂����B�폜����ꍇ�������`�F�b�N����B
//  DeleteFile(AFileName);
	if Res <> 0 then exit;
  result := True;
end;

{��t�������}
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
{���͏������}
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
{�f�f}
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

    JMode_CN := false; //CN��\���t���O
    JMode_Yobi1 := false; //�\��
    JMode_Yobi2 := false;
    JMode_Yobi3 := false;




    JMode_Ikubyou := false;

    sret := DspInputNo( self, 1 );

    if sret = '' then exit;

    Application.CreateForm(TSindanForm, SindanForm);
    //�ŏ��̈ꗗ�\��
    SindanForm.EMode.Text := sret;
    SindanForm.ShowModal ; //�ꗗ�������Ώۂ̍Đݒ�



    if SindanForm.FRes then begin
            //�S�̂̌���������o��
            with DataModule1.QueryRead do begin
                {Version 0.6 #26 �폜�t���O�ǉ�}
                SQL.Text := 'Select Count(*) as cnt from T_BUNSEKI6 where ' + SQLCondition ;
                Open;
                RecCnt := FieldByName('cnt').asInteger ;
                Close;
            end;

            //�v�����^�̐ݒ�
            //  Printer.PrinterIndex := -1;
            Printer.PrinterIndex := Printer.PrinterIndex;
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            Printer.SetPrinter(aDevice, aDriver, aPort, 0);
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            PDM := GlobalLock(aDevMode); //�����������b�N����@�̈���Ƃ�킯�ł͂Ȃ��B


            PDM^.dmPaperSize := DMPAPER_A4;
            PDM^.dmOrientation := DMORIENT_PORTRAIT; //DMORIENT_LANDSCAPE; // ��
                     //DMORIENT_PORTRAIT;


            GlobalUnlock(aDevMode); //���������J���@�̈�������킯�ł͂Ȃ��B
            Printer.SetPrinter(aDevice, aDriver, aPort, aDevMode);



//            if sret <> '���͒l�̂�' then begin
                DspPrnReport( self,rtSindan, RecCnt );
//            end
//            else begin
//                DspPrnReport( self,rtBunseki, RecCnt );
//            end;


    end;
    SindanForm.Release ;
//    end;
end;
{�{��݌v}
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
    //�ŏ��̈ꗗ�\��
    SindanForm.ShowModal ; //�ꗗ�������Ώۂ̍Đݒ�
    if SindanForm.FRes then begin
      //�S�̂̌���������o��
      with DataModule1.QueryRead do begin
        {Version 0.6 #26 �폜�t���O�ǉ�}
        SQL.Text := 'Select Count(*) cnt from T_UKETUKE where �폜�t���O<>True and ' + SQLCondition ;
        Open;
        RecCnt := FieldByName('cnt').asInteger ;
        Close;
      end;

            //�v�����^�̐ݒ�
            //  Printer.PrinterIndex := -1;
            Printer.PrinterIndex := Printer.PrinterIndex;
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            Printer.SetPrinter(aDevice, aDriver, aPort, 0);
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            PDM := GlobalLock(aDevMode); //�����������b�N����@�̈���Ƃ�킯�ł͂Ȃ��B

            if JMode = 'Douou' then begin
                     PDM^.dmPaperSize := DMPAPER_A4;
                     PDM^.dmOrientation := DMORIENT_LANDSCAPE; // ��
                     //DMORIENT_PORTRAIT;
            end
            else if JMode = 'Fuuren' then begin
                     PDM^.dmPaperSize := DMPAPER_A4;
                     PDM^.dmOrientation := DMORIENT_PORTRAIT; // �c
            end
            else begin
                     PDM^.dmPaperSize := DMPAPER_A4;
                     PDM^.dmOrientation := DMORIENT_PORTRAIT; // �c
            end;

            GlobalUnlock(aDevMode); //���������J���@�̈�������킯�ł͂Ȃ��B
            Printer.SetPrinter(aDevice, aDriver, aPort, aDevMode);

        //�f�f�v�Z���\�b�h�Ăяo��
    	DspPrnReport( self,rtSekkei, RecCnt );
    end;
    SindanForm.Release ;
  end;
end;


{�}�X�^�����e�������}
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

{�V�~�����[�V�����f�f}
procedure TMainForm.ActExitExecute(Sender: TObject);
const
  DataFile1 = 't_*' ;
  aZipFile = 'data.lzh' ;
begin
//�I�����Ɏ����I�Ƀf�[�^�̃o�b�N�A�b�v���Ƃ�
  if IsBackUp then begin
    if not BackupFile(DataFile1,aZipFile) then exit ;
    //�w��t�@�C���ɕύX
    if not DirectoryExists( AppPath+'log') then
      CreateDir(AppPath+'log');
    CopyFile(PChar(AppPath+aZipFile),PChar(AppPath+'log\Data'+FormatDateTime('yymmdd',now)+'.lzh' ),false);
    DeleteFile(AppPath+aZipFile);
  end;
	Close;
end;
{��ʐF�ݒ�}
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
{���b�Z�[�W�t�H���g�F�ݒ� Version 0.6 #43}
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
  �I�����C��������
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
  ����M����
}

procedure TMainForm.btnFTPClick(Sender: TObject);
begin


end;

// ����M
//�@�l�n�p
procedure TMainForm.SpeedButton3Click(Sender: TObject);
begin



end;

{
	==========================================================================
	FTP�֐�
  �o�b�`�����Ȃ̂Ŏ菇�̗���ɂ���Ă͖������[�v�ɂȂ�ꍇ����B�^�C�}�[�Ď��Ȃǂŗv�΍�
  ���̗�F
  DirChange:->FtpError->                      ChangeDir:<busy�Ŏ��s�̈�>
                      ->DirChanged->Refresh:->Busy->ListtingDone
  �΍�F�ʏ�̓R�}���h���s�O�Ƀr�W�[���`�F�b�N����΂����B
}
procedure TMainForm.FTPLogMessage( aMsg : string );
begin
end;
//���O�C��
function TMainForm.FTPLogin: Boolean ;
begin
  FIsFTPError := False ;
  FIsConnected := False ;
//  with MFTP1 do begin
//    Passive := SystemIni.ReadBool('network', 'usepssv', false );
//    Server := SystemIni.ReadString('network', 'server', '' );
//    Username := SystemIni.ReadString('network', 'username', '' ) ;
//    password := SystemIni.ReadString('network', 'password', '' ) ;
    //�p�X���[�h�ϊ�������ǉ�����
//    InitialDirectory :=  SystemIni.ReadString('network', 'home', '' ) ;
//    FTPLogMessage('login:'+Server);
//    Login ;
    {  ��ԑJ��
      ����Fready -> loggedin
      �T�[�o�[��N���F[timeout] -> error -> error
      �A�J�E���g�����Ferror -> quit -> ready
    }
//  end;
  //�G���[�łȂ���R�l�N�g��Ԃ͑҂�
  {���ӁF�Ȃ���with MFTP1���ōs���Ə���Ƀu���C�N����}
  while (not FIsConnected) and (not FIsFTPError) do begin
    Sleep(100);
    Application.ProcessMessages ;
  end;
  result := FIsConnected ;
end;
//���O�A�E�g
procedure TMainForm.FTPLogOut ;
begin
   FTPLogMessage('Logout:');
//   MFTP1.Quit ;
end;
//�f�B���N�g���ύX   aDir �̓J�����g����ł����[�g�p�X����ł��L��
function TMainForm.FTPChangeDir( aDir : string ) : Boolean ;
begin
//  while MFTP1.Busy do Application.ProcessMessages ;
	FTPLogMessage('ChangeDirectory:'+aDir);
  FIsDirectoryChanged := False ;
  FIsFTPError := False ;
//	MFtp1.ChangeDirectory(aDir);
  { ��ԑJ��
    Busy -> Ready -> DirectoryChanged. ����refresh:�K�v
    Busy -> Error -> Ready -> DirectoryChanged.
  }
  // DirectoryChanged�C�x���g��҂�
	while (not FIsDirectoryChanged) and (not FIsFTPError) do begin
    Sleep(100);
   	Application.ProcessMessages ;
  end;
  result := not FIsFTPError ;
end;
//�f�B���N�g���쐬
function TMainForm.MakeDirectory( aDir : string ) : Boolean;
begin
//  while MFTP1.Busy do Application.ProcessMessages ;
end;
//�t�@�C���T�C�Y���ʐM���Ԃ̏����\������B
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

    InputNoForm.EMode.Text := '����';

    InputNoForm.PageControl1.ActivePageIndex := 0 ;


    InputNoForm.ShowModal ; //�ꗗ�������Ώۂ̍Đݒ�

    sret := InputNoForm.EMode.Text;
    //sret := DspInputNo( Sender, 1 );
    InputNoForm.Release ;
    if sret = '' then exit;

    Application.CreateForm(TSindanForm, SindanForm);
    //�ŏ��̈ꗗ�\��
    SindanForm.EMode.Text := sret;
    SindanForm.btnPreview.Caption := '�o�͎��s';
    SindanForm.ShowModal ; //�ꗗ�������Ώۂ̍Đݒ�

    if SindanForm.FRes then begin

      if SaveDialog1.Execute then begin
        ExportFile('t_uketuke3',SaveDialog1.FileName );

       ShowMessage('�o�͂��܂����B');
      end;
    end;
    SindanForm.Release ;

end;
//�t�@�C���_�E�����[�h -> temppath
function TMainForm.FTPGetFile( aFileName : string ) : Boolean ;
var
  aTime : integer ;
//  res : boolean ;
begin
  result := false ;





  result :=  not FIsFTPError ;
end;
//�t�@�C���̃A�b�v���[�h temppath -> ����.tmp�ŃA�b�v���ăt�@�C���T�C�Y
//��������� �T�[�o�[�ɂ���t�@�C�����폜���Ă��烊�l�[������B

function TMainForm.FTPPutFile( aFileName : string )  : Boolean ;
var
  aTime ,aSize, aaSize : integer ;
  sr: TSearchRec;
  bFileExist : Boolean ;
begin
  result := false ;

  result :=  not FIsFTPError ;
end;
//�t�@�C���폜
function TMainForm.FTPDeleteFile( aFileName : string ) : Boolean ;
begin
  FIsFTPError := False ;
  FIsFileDeleted := False ;



  result :=  not FIsFTPError ;
end;
//�t�@�C�����l�[��
function TMainForm.FTPFileReName( aSrcFile,  aDstFile: string ) : Boolean ;
begin


end;
//�t�@�C���T�C�Y�擾 �L���b�V�����猟��  notfound = -1,
function TMainForm.FTPFileSize( aFileName : string ) : integer ;
var
	cnt : integer ;
begin
	result := -1 ;



  end;
//�t�@�C������ �L���b�V�����猟��
function TMainForm.FTPFileExist( aFileName : string ) : Boolean ;
var
	cnt : integer ;
begin
	result := False ;
end;
//�f�B���N�g������ �L���b�V�����猟��
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


  //��^
  Application.CreateForm(TmstSakugataForm, mstSakugataForm);
  mstSakugataForm.ShowModal ;
  mstSakugataForm.Release ;



end;

//�R�l�N�g

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
	FTP�֐� �����܂�
	//////////////////////////////////////////////////////////////////////////
}
{
  �f�[�^�̃G�N�X�|�[�g
  pFileName:�툳�k�t�@�C�����i�g���q�����j
  pZipFile : ���k�t�@�C����
}
function TMainForm.BackupFile(pFileName, pZipFile : string ):Boolean;
var
  Dir : string ;
begin
  // �w��f�B���N�g��
  Dir := DataPath ;
  // ��t�f�[�^�̈��k
  result := Zip(pFileName,Dir,pZipFile);
end;
{
  �C���|�[�g����
  pZipFile : ���k�t�@�C����
}
function TMainForm.RestoreFile( pZipFile : string ):Boolean;
var
  Dir : string ;
begin
  // �w��f�B���N�g��
  Dir := DataPath;
  // ��t�f�[�^�̈��k
  result := UnZip(pZipFile,Dir);
end;
{
  �C���|�[�g���� : �g�����U�N�V������temp�œW�J��������荞��
  pZipFile : ���k�t�@�C����
}
function TMainForm.ImportTemp( pZipFile : string ):Boolean;
var
  Dir : string ;
begin
  // temp�f�B���N�g��
  Dir := TempPath ;
  // ��t�f�[�^�̈��k
  result := UnZip(pZipFile,Dir);
end;

{�g�����U�N�V�����e�[�u���̃G�N�X�|�[�g}
procedure TMainForm.nmExpDataClick(Sender: TObject);
const
  DataFile1 = 't_*' ;
  aZipFile = 'data.lzh' ;
var
  Dir : string ;
begin
  if not SelectDirectory(Dir,[sdAllowCreate, sdPerformCreate, sdPrompt],0) then exit;
  if not BackupFile(DataFile1,aZipFile) then exit ;
  //�w��t�@�C���ɕύX
  CopyFile(PChar(AppPath+aZipFile),PChar(Dir+aZipFile ),false);
  DeleteFile(AppPath+aZipFile);

end;
{�}�X�^�̑S�G�N�X�|�[�g}
procedure TMainForm.nmExpMstClick(Sender: TObject);
const
  MasterFile1 = 'm_*' ;
  aZipFile = 'master.lzh' ;
var
  Dir : string ;
begin
  if not SelectDirectory(Dir,[sdAllowCreate, sdPerformCreate, sdPrompt],0) then exit;

  if not BackupFile(MasterFile1,aZipFile) then exit ;
  //�w��t�@�C���ɕύX
  CopyFile(PChar(AppPath+aZipFile),PChar(Dir+aZipFile ),false);
  DeleteFile(AppPath+aZipFile);

end;
{�f�[�^�C���|�[�g����}
procedure TMainForm.nmImpDataClick(Sender: TObject);
begin
  OpenDialog1.FileName := 'data.lzh';
  OpenDialog1.DefaultExt := 'lzh';
  OpenDialog1.Filter := '���k�t�@�C��|*.lzh';
  if not OpenDialog1.Execute then exit;
  if Application.MessageBox ('������f�[�^�ɏ㏑�������܂��B��낵���ł����H','�C���|�[�g', MB_YESNO ) = ID_NO then
    exit;
  CloseDataBase;
  ImportTemp(OpenDialog1.FileName) ;
  ChangeDataBase(EntryCenter , EntryYear );
  //�f�[�^���}�[�W����B
//  MargeData;
end;
{�}�X�^�C���|�[�g����}
procedure TMainForm.nmImpMstClick(Sender: TObject);
begin
  OpenDialog1.FileName := 'master.lzh';
  OpenDialog1.DefaultExt := 'lzh';
  OpenDialog1.Filter := '���k�t�@�C��|*.lzh';
  if not OpenDialog1.Execute then exit;
  if Application.MessageBox ('������}�X�^���㏑�������܂��B��낵���ł����H','�C���|�[�g', MB_YESNO ) = ID_NO then
    exit;
  CloseDataBase;
  RestoreFile(OpenDialog1.FileName) ;
  ChangeDataBase(EntryCenter , EntryYear );

end;
{
  ����N�x�ʋ@�\�ݒ�
}
{
procedure TMainForm.SetYearEnable;
begin
//  ActUketuke.Enabled := IsEntryYear ;
//  ActBunseki.Enabled := IsEntryYear ;
//  ActSindan.Enabled := IsEntryYear ;

//����M�@btnFTP
//  ActSync.Enabled := IsEntryYear ;

//  nmBuildYear.Enabled := IsEntryYear ;
//  nmRestore.Enabled := IsEntryYear ;
//  nmImport.Enabled := IsEntryYear ;
end;
}
{
  CSV �G�N�X�|�[�g
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

    InputNoForm.EMode.Text := '�y��';

    InputNoForm.PageControl1.ActivePageIndex := 0 ;


    InputNoForm.ShowModal ; //�ꗗ�������Ώۂ̍Đݒ�

    sret := InputNoForm.EMode.Text;
    //sret := DspInputNo( Sender, 1 );

    //if sret = '' then exit;
    InputNoForm.Release ;

    if sret = '' then exit;



    Application.CreateForm(TSindanForm, SindanForm);
    //�ŏ��̈ꗗ�\��
    SindanForm.EMode.Text := sret;
    SindanForm.btnPreview.Caption := '�o�͎��s';
    SindanForm.ShowModal ; //�ꗗ�������Ώۂ̍Đݒ�

    if SindanForm.FRes then begin

      if SaveDialog1.Execute then begin
        ExportFile('t_uketuke',SaveDialog1.FileName );

       ShowMessage('�o�͂��܂����B');
      end;
    end;
    SindanForm.Release ;


end;

procedure TMainForm.nmExBunClick(Sender: TObject);
begin
  if SaveDialog1.Execute then begin
    ExportFile('t_sindan',SaveDialog1.FileName );
   ShowMessage('�o�͂��܂����B');
  end;
end;

procedure TMainForm.nmExpNoukaClick(Sender: TObject);
var
sret : String;
begin


      if SaveDialog1.Execute then begin
         ExportFile('m_nouka',SaveDialog1.FileName );
         ShowMessage('�o�͂��܂����B');
       end;


end;

procedure TMainForm.nmExpHojoClick(Sender: TObject);
begin
  if SaveDialog1.Execute then begin
    ExportFile('m_hojou',SaveDialog1.FileName );
   ShowMessage('�o�͂��܂����B');
  end;
end;

procedure TMainForm.nmImpNoukaClick(Sender: TObject);
begin
  OpenDialog1.DefaultExt := 'csv';
  OpenDialog1.Filter := 'CSV�t�@�C��|*.csv';
  if not OpenDialog1.Execute then exit;
  ImportFile( OpenDialog1.FileName, 'm_nouka' );
  ShowMessage('�I�����܂����B');

end;

procedure TMainForm.nmImpHojoClick(Sender: TObject);
begin
  OpenDialog1.DefaultExt := 'csv';
  OpenDialog1.Filter := 'CSV�t�@�C��|*.csv';
  if not OpenDialog1.Execute then exit;
  ImportFile( OpenDialog1.FileName, 'm_hojou' );
  ShowMessage('�I�����܂����B');
end;

procedure TMainForm.nmEditMsgClick(Sender: TObject);
begin
{���b�Z�[�W�t�@�C����ҏW���āA�T�[�o�[�ɓ]������}
//MsgBox��ҏW������B���b�Z�[�W�����ꍇ�A���O�ɓ�������K�v����B
//�o�^���A�b�v�f�[�g
end;

{�C���[�W���X�g���b�`����}
procedure TMainForm.FormResize(Sender: TObject);
begin
  Panel4.Width := PanelClient.Width div 2;
end;

{���b�Z�[�W���x���̕\��}
procedure  TMainForm.DspMsg;
{Version 0.6 #43 ���b�Z�[�W��w�i�̏�}
var
  aBuff : string ;
begin
  //�w�i���߂ȃ��x���ɕ�����\������
(*
  for aCnt := 1 to pMsg.Count do begin
    aBuff := aBuff + pMsg[aCnt] + #10#13;
  end;
*)
  aBuff := FMsg.Text ;
//  MsgLabel.Caption := '�y����M���b�Z�[�W�z'+#10#13+aBuff ;
  MsgLabel2.Visible := true;
  MsgLabel2.Caption := '�y����M���b�Z�[�W�z'+#10#13+aBuff ;


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

//����@�����_�엀�x
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
  OpenDialog1.Filter := 'CSV�t�@�C��|*.csv';
  if not OpenDialog1.Execute then exit;
  ImportFile( OpenDialog1.FileName, 'T_UKETUKE' );

  ShowMessage('�I�����܂����B');

end;

procedure TMainForm.C1Click(Sender: TObject);
begin

  if JMode = 'Fuuren' then begin
     ShowMessage( '���̃o�[�W�����ł́A�T�|�[�g���Ă��܂���B' );
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
    stmp := AppPath +	EntryCenter + '\' + EntryYear+'\'+'02';//�]��
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
        //�ŏ��̈ꗗ�\��
        SindanForm.EMode.Text := sret;
        SindanForm.ShowModal ; //�ꗗ�������Ώۂ̍Đݒ�
        if SindanForm.FRes then begin
            //�S�̂̌���������o��
            with DataModule1.QueryRead do begin
                {Version 0.6 #26 �폜�t���O�ǉ�}
                SQL.Text := 'Select Count(*) cnt from T_UKETUKE where �폜�t���O<>True and ' + SQLCondition ;
                Open;
                RecCnt := FieldByName('cnt').asInteger ;
                Close;
            end;
//          OpenProgress;
            //�ꌏ������̃X�e�b�v��
//          frmProgress.Scale(Floor(333/RecCnt));
            //H150828      Pages := RecCnt;

            //�v�����^�̐ݒ�
            //  Printer.PrinterIndex := -1;
            Printer.PrinterIndex := Printer.PrinterIndex;
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            Printer.SetPrinter(aDevice, aDriver, aPort, 0);
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            PDM := GlobalLock(aDevMode); //�����������b�N����@�̈���Ƃ�킯�ł͂Ȃ��B

//            if JMode = 'Douou' then begin
                     PDM^.dmPaperSize := DMPAPER_A4;
                     PDM^.dmOrientation := DMORIENT_LANDSCAPE; // ��
                     //DMORIENT_PORTRAIT;
//            end
//            else if JMode = 'Fuuren' then begin
//                     PDM^.dmPaperSize := DMPAPER_B4;
//                     PDM^.dmOrientation := DMORIENT_PORTRAIT; // �c
//            end
//            else begin
//                     PDM^.dmPaperSize := DMPAPER_A4;
//                     PDM^.dmOrientation := DMORIENT_PORTRAIT; // �c
//            end;
            GlobalUnlock(aDevMode); //���������J���@�̈�������킯�ł͂Ȃ��B
            Printer.SetPrinter(aDevice, aDriver, aPort, aDevMode);

//            if sret <> '���͒l�̂�' then begin
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
    //�ŏ��̈ꗗ�\��
    SindanForm.EMode.Text := sret;
    SindanForm.ShowModal ; //�ꗗ�������Ώۂ̍Đݒ�



    if SindanForm.FRes then begin
            //�S�̂̌���������o��
            with DataModule1.QueryRead do begin
                {Version 0.6 #26 �폜�t���O�ǉ�}
                SQL.Text := 'Select * from T_UKETUKE2 where �폜�t���O<>True and  ' + SQLCondition ;
                Open;
                RecCnt := DataModule1.QueryRead.RecordCount;    //ieldByName('cnt').asInteger ;
                Close;
            end;

            //�v�����^�̐ݒ�
            //  Printer.PrinterIndex := -1;
            Printer.PrinterIndex := Printer.PrinterIndex;
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            Printer.SetPrinter(aDevice, aDriver, aPort, 0);
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            PDM := GlobalLock(aDevMode); //�����������b�N����@�̈���Ƃ�킯�ł͂Ȃ��B


            PDM^.dmPaperSize := DMPAPER_A4;
            PDM^.dmOrientation := DMORIENT_PORTRAIT; // �c
//            PDM^.dmOrientation := DMORIENT_LANDSCAPE; // ��


            GlobalUnlock(aDevMode); //���������J���@�̈�������킯�ł͂Ȃ��B
            Printer.SetPrinter(aDevice, aDriver, aPort, aDevMode);



//            if sret <> '���͒l�̂�' then begin
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
    //�ŏ��̈ꗗ�\��
    SindanForm.EMode.Text := sret;
    SindanForm.ShowModal ; //�ꗗ�������Ώۂ̍Đݒ�



    if SindanForm.FRes then begin
            //�S�̂̌���������o��
            with DataModule1.QueryRead do begin
                {Version 0.6 #26 �폜�t���O�ǉ�}
                SQL.Text := 'Select * from T_UKETUKE3 where �폜�t���O<>True and  ' + SQLCondition ;
                Open;


                RecCnt := DataModule1.QueryRead.RecordCount;

                //FieldByName('cnt').asInteger ;
                Close;
            end;

            //�v�����^�̐ݒ�
            //  Printer.PrinterIndex := -1;
            Printer.PrinterIndex := Printer.PrinterIndex;
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            Printer.SetPrinter(aDevice, aDriver, aPort, 0);
            Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
            PDM := GlobalLock(aDevMode); //�����������b�N����@�̈���Ƃ�킯�ł͂Ȃ��B


            PDM^.dmPaperSize := DMPAPER_A4;
            PDM^.dmOrientation := DMORIENT_PORTRAIT; // �c
//            PDM^.dmOrientation := DMORIENT_LANDSCAPE; // ��


            GlobalUnlock(aDevMode); //���������J���@�̈�������킯�ł͂Ȃ��B
            Printer.SetPrinter(aDevice, aDriver, aPort, aDevMode);



//            if sret <> '���͒l�̂�' then begin
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

    InputNoForm.EMode.Text := '�y��';

    InputNoForm.PageControl1.ActivePageIndex := 0 ;


    InputNoForm.ShowModal ; //�ꗗ�������Ώۂ̍Đݒ�

    sret := InputNoForm.EMode.Text;
    //sret := DspInputNo( Sender, 1 );

    //if sret = '' then exit;
    InputNoForm.Release ;

    Application.CreateForm(TSindanForm, SindanForm);
    //�ŏ��̈ꗗ�\��
    SindanForm.EMode.Text := sret;
    SindanForm.btnPreview.Caption := '�o�͎��s';
    SindanForm.ShowModal ; //�ꗗ�������Ώۂ̍Đݒ�

    if SindanForm.FRes then begin
      if SaveDialog1.Execute then begin
        ExportFileGIS('�n�}',SaveDialog1.FileName );

        ShowMessage('�o�͂��܂����B');
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

    InputNoForm.EMode.Text := '�͔�';

    InputNoForm.PageControl1.ActivePageIndex := 0 ;


    InputNoForm.ShowModal ; //�ꗗ�������Ώۂ̍Đݒ�

    sret := InputNoForm.EMode.Text;
    //sret := DspInputNo( Sender, 1 );

    InputNoForm.Release ;

    if sret = '' then exit;


    Application.CreateForm(TSindanForm, SindanForm);
    //�ŏ��̈ꗗ�\��
    SindanForm.EMode.Text := sret;
    SindanForm.btnPreview.Caption := '�o�͎��s';
    SindanForm.ShowModal ; //�ꗗ�������Ώۂ̍Đݒ�

    if SindanForm.FRes then begin

      if SaveDialog1.Execute then begin
        ExportFile('t_uketuke2',SaveDialog1.FileName );

       ShowMessage('�o�͂��܂����B');
      end;
    end;
    SindanForm.Release ;



end;

procedure TMainForm.T11Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt := 'csv';
  OpenDialog1.Filter := 'CSV�t�@�C��|*.csv';
  if not OpenDialog1.Execute then exit;
  ImportFile( OpenDialog1.FileName, 'T_UKETUKE2' );

  ShowMessage('�I�����܂����B');

end;

procedure TMainForm.S11Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt := 'csv';
  OpenDialog1.Filter := 'CSV�t�@�C��|*.csv';
  if not OpenDialog1.Execute then exit;
  ImportFile( OpenDialog1.FileName, 'T_UKETUKE3' );

  ShowMessage('�I�����܂����B');

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

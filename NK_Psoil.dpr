program NK_Psoil;

//印刷プログラム    コンパイル条件設定で指定
//  /D PRNMODE         {$DEFINE PRNMODE}  //再コンパイルしないと駄目



uses
  windows,
  Dialogs,
  SysUtils,
  Forms,
  MainU in 'MainU.pas' {MainForm},
  DMU in 'DMU.pas' {DataModule1: TDataModule},
  PrnCanvasU in 'PrnCanvasU.pas' {PrintModule1: TDataModule},
  mstU in 'mstU.pas' {mstForm},
  MNoukyouU in 'MNoukyouU.pas' {mstNoukyouForm},
  MNoukaU in 'MNoukaU.pas' {mstNoukaForm},
  MFushokuU in 'MFushokuU.pas' {mstFushokuForm},
  MDoseiU in 'MDoseiU.pas' {mstDoseiForm},
  MDojouU in 'MDojouU.pas' {mstDojouForm},
  MCenterU in 'MCenterU.pas' {mstCenterForm},
  MCityU in 'MCityU.pas' {mstCityForm},
  MTikuU in 'MTikuU.pas' {mstTikuForm},
  MYuukiU in 'MYuukiU.pas' {mstYuukiForm},
  MSakumokuU in 'MSakumokuU.pas' {mstSakumokuForm},
  MSakumotuU in 'MSakumotuU.pas' {mstSakumotuForm},
  MSakugataU in 'MSakugataU.pas' {mstSakugataForm},
  AobutU in 'AobutU.pas' {AboutBox},
  MHojouU in 'MHojouU.pas' {mstHojouForm},
  SNoukaU in 'SNoukaU.pas' {frmNouka},
  SHojouU in 'SHojouU.pas' {frmSHojou},
  UUkeSiryou in 'UUkeSiryou.pas' {frmUkeSiryou},
  CenterU in 'CenterU.pas' {frmCenter},
  YearU in 'YearU.pas' {frmYear},
  SUketukeU in 'SUketukeU.pas' {frmSUketuke},
  LUketukeU in 'LUketukeU.pas' {frmLUketuke},
  PreviewU in 'PreviewU.pas' {frmPreview},
  InputNoU in 'InputNoU.pas' {InputNoForm},
  EntCMTU in 'EntCMTU.pas' {EntryCMTForm},
  NetworkU in 'NetworkU.pas' {NetworkForm},
  MDokaizaiU in 'MDokaizaiU.pas' {mstDokaizaiForm},
  DojouU in 'DojouU.pas' {SindanForm},
  ProgressU in 'ProgressU.pas' {frmProgress},
  M_KaseiU in 'M_KaseiU.pas' {mstKaseiForm},
  MSehiU in 'MSehiU.pas' {mstSehiBasicForm},
  M_Sehi_HU in 'M_Sehi_HU.pas' {mstSehi_HForm},
  M_Sehi_SU in 'M_Sehi_SU.pas' {mstSehi_SForm},
  M_Sehi_BU in 'M_Sehi_BU.pas' {mstSehi_BForm},
  M_Sehi_EU in 'M_Sehi_EU.pas' {mstSehi_EForm},
  M_CMTU in 'M_CMTU.pas' {mstCMTForm},
  USehi in 'USehi.pas' {FSehi},
  UJyouken in 'UJyouken.pas' {FJyouken},
  M_Bai_S_P in 'M_Bai_S_P.pas' {mstBai_S_PForm},
  M_BAI_S_K in 'M_BAI_S_K.pas' {mstBai_S_KForm},
  M_BAI_S_M in 'M_BAI_S_M.pas' {mstBai_S_MForm},
  M_Bai_S_N in 'M_Bai_S_N.pas' {mstBai_S_NForm},
  USintyoku in 'USintyoku.pas' {FSintyoku},
  UFBarCodePrn in 'UFBarCodePrn.pas' {FBarCodePrn},
  UFJCmt in 'UFJCmt.pas' {FJCmt},
  UFSakumokuSel in 'UFSakumokuSel.pas' {FSakumokuSel},
  USousin in 'USousin.pas' {FSousin},
  UFMsg in 'UFMsg.pas' {FMsg},
  UmstSehi_T in 'UmstSehi_T.pas' {mstSehi_T},
  BunsekiU in 'BunsekiU.pas' {frmBunseki},
  UUkeTaihi in 'UUkeTaihi.pas' {frmUkeTaihi},
  UBukai in 'UBukai.pas' {mstBukaiForm},
  UKingaku in 'UKingaku.pas' {FKingaku},
  NumEdit in 'Edit\NumEdit.pas',
  DBValCbx in 'Edit\DBValCbx.pas',
  UketukeU8 in 'UketukeU8.pas' {frmUketuke8},
  mstKIJUNU in 'mstKIJUNU.pas' {mstKijunForm},
  M_KIJUN2U in 'M_KIJUN2U.pas' {mstKijun2Form},
  M_KIJUNU in 'M_KIJUNU.pas' {mstKijun1Form},
  USelectSaku in 'USelectSaku.pas' {FSelectSaku},
  M_TanpiU in 'M_TanpiU.pas' {mstTanpiForm},
  M_SakuhiU in 'M_SakuhiU.pas' {mstSakuhiForm},
  UketukeU1 in 'UketukeU1.pas' {frmUketuke1},
  UketukeU2 in 'UketukeU2.pas' {frmUketuke2},
  UketukeU3 in 'UketukeU3.pas' {frmUketuke3},
  UketukeU4 in 'UketukeU4.pas' {frmUketuke4},
  UketukeU5 in 'UketukeU5.pas' {frmUketuke5},
  UketukeU6 in 'UketukeU6.pas' {frmUketuke6},
  UketukeU7 in 'UketukeU7.pas' {frmUketuke7},
  UCsvOut in 'UCsvOut.pas' {FCsvOut},
  UMasSel in 'UMasSel.pas' {FMasSel},
  UBunInput in 'UBunInput.pas' {FBunInput},
  UBunDel in 'UBunDel.pas' {FBunDel},
  UFETaitoru in 'UFETaitoru.pas' {FETaitoru},
  UFDokaiChenge in 'UFDokaiChenge.pas' {FDokaiChenge},
  UBunTaihi in 'UBunTaihi.pas' {FBunTaihi},
  FDokaizaiMasU in 'FDokaizaiMasU.pas' {FDokaizaiMas},
  UFTaihiMas in 'UFTaihiMas.pas' {FTaihiMas},
  USakhiSel in 'USakhiSel.pas' {FSakhiSel},
  USehiSekkei in 'USehiSekkei.pas' {FSehiSekkei},
  UFSetHiryou in 'UFSetHiryou.pas' {FSetHiryou},
  USetSehi in 'USetSehi.pas' {FSetSehi},
  UMaster in 'UMaster.pas' {frmMaster},
  UMaterials in 'UMaterials.pas' {frmMaterials},
  UArea in 'UArea.pas' {frmArea},
  plChgCompo in 'plChgCompo.pas';

{$R *.RES}

//プログラムソースの先頭
const
  APPNM = 'NK-Psoil';
var
  hMutex:THandle;
begin
(*
  if formatdatetime( 'yyyy/mm/dd', now ) > '2003/05/01' then begin
    showmessage('このシステムは評価版です。正規版のお問い合わせをお願い致します。');
    PostQuitMessage(0);
    exit;
  end;
*)
  hMutex := OpenMutex(MUTEX_ALL_ACCESS,False,APPNM);
  //すでにMutexがあるかどうか調べる
  if hMutex <> 0 then
  begin  //あるとき
    ShowMessage('既にＣｅｒｅｓは起動しています。');
    CloseHandle(hMutex);
    PostQuitMessage(0);
    exit;
  end
  else begin //ないとき
    hMutex := CreateMutex(nil,False,APPNM);
    // Mutexを作成しておく。MyProjectは、他のアプリと重複しないような
    // 文字列ならなんでもよい
  end;
  P_MODE := False ; //ダイレクト印刷モードオフ

  //shortdateformat := 'yyyy/mm/dd';
  Application.UpdateFormatSettings := false;

  Application.Initialize;
  Application.Title := 'NK-Psoil 土壌診断・施肥設計システム';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TPrintModule1, PrintModule1);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFMsg, FMsg);
  Application.CreateForm(TFSetHiryou, FSetHiryou);
  Application.CreateForm(TFSetSehi, FSetSehi);
  Application.CreateForm(TfrmMaster, frmMaster);
  Application.CreateForm(TfrmMaterials, frmMaterials);
  Application.CreateForm(TfrmArea, frmArea);
  //  Application.CreateForm(TfrmUketuke, frmUketuke);
//  Application.CreateForm(TmstKijunForm, mstKijunForm);
//  Application.CreateForm(TmstKijun2Form, mstKijun2Form);
//  Application.CreateForm(TmstKijun1Form, mstKijun1Form);
//  Application.CreateForm(TmstKijun1Form, mstKijun1Form);
//  Application.CreateForm(TFSelectSaku, FSelectSaku);
//  Application.CreateForm(TmstTanpiForm, mstTanpiForm);
//  Application.CreateForm(TmstSakuhiForm, mstSakuhiForm);
  //  Application.CreateForm(TFKingaku, FKingaku);
  Application.Run;

  Application.UpdateFormatSettings := True;

  ReleaseMutex(hMutex);		//Mutexの解放
end.

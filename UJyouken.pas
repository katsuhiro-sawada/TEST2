unit UJyouken;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons,IniFiles, ComCtrls;

type
  TFJyouken = class(TForm)
    Panel1: TPanel;
    btnClose: TBitBtn;
    btnPost: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
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
    LMemori: TLabel;
    LHantei1: TLabel;
    LHantei2: TLabel;
    Ch1: TCheckBox;
    Ch2: TCheckBox;
    ETiten1: TEdit;
    ETiten2: TEdit;
    EpH: TEdit;
    EEC: TEdit;
    EP: TEdit;
    ECaO: TEdit;
    EMgO: TEdit;
    EK2O: TEdit;
    EHouwa: TEdit;
    EHiritu: TEdit;
    ECEC: TEdit;
    ERin: TEdit;
    EN: TEdit;
    EKei: TEdit;
    EFe: TEdit;
    EAen: TEdit;
    EDou: TEdit;
    EMan: TEdit;
    EHou: TEdit;
    ENi: TEdit;
    EFus: TEdit;
    EYou: TEdit;
    EYoudatu: TEdit;
    ChDo1: TCheckBox;
    ChFu1: TCheckBox;
    ChDo2: TCheckBox;
    ChFu2: TCheckBox;
    ChMemori: TCheckBox;
    ChBrush: TCheckBox;
    EHantei: TEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Esiryou1: TEdit;
    Esiryou2: TEdit;
    Esiryou3: TEdit;
    Esiryou4: TEdit;
    Esiryou5: TEdit;
    Esiryou6: TEdit;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Esiryou7: TEdit;
    Esiryou8: TEdit;
    Esiryou9: TEdit;
    Esiryou10: TEdit;
    Esiryou11: TEdit;
    Esiryou12: TEdit;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    ETai1: TEdit;
    ETai2: TEdit;
    ETai3: TEdit;
    ETai4: TEdit;
    ETai5: TEdit;
    ETai6: TEdit;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    ETai7: TEdit;
    ETai8: TEdit;
    ETai9: TEdit;
    ETai10: TEdit;
    ETai11: TEdit;
    Label100: TLabel;
    Esiryou13: TEdit;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Esiryou14: TEdit;
    Esiryou15: TEdit;
    Esiryou16: TEdit;
    Esiryou17: TEdit;
    Esiryou18: TEdit;
    Esiryou19: TEdit;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Esiryou20: TEdit;
    Esiryou21: TEdit;
    Esiryou22: TEdit;
    Esiryou23: TEdit;
    Esiryou24: TEdit;
    Esiryou25: TEdit;
    Label126: TLabel;
    Esiryou26: TEdit;
    Label127: TLabel;
    Label128: TLabel;
    Esiryou27: TEdit;
    Label129: TLabel;
    Label130: TLabel;
    ECN: TEdit;
    Label131: TLabel;
    Label132: TLabel;
    EYobi1name: TEdit;
    EYobi1keta: TEdit;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label133: TLabel;
    EYobi2name: TEdit;
    Label134: TLabel;
    EYobi2keta: TEdit;
    Label138: TLabel;
    Label139: TLabel;
    EYobi3name: TEdit;
    Label140: TLabel;
    EYobi3keta: TEdit;
    Label141: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
  private
    { Private 宣言 }
    Etaihi:Array[1..11] of TEdit;
    Esiryou:Array[1..27] of TEdit;


  public
    { Public 宣言 }
  end;

var
  FJyouken: TFJyouken;

implementation

uses DMU;

{$R *.DFM}

procedure TFJyouken.FormShow(Sender: TObject);
var
    SysFileName : String;
    i : Integer;
    stmp : String;

begin
   Color := BackColor ;


  //設定ﾌｧｲﾙの取り込み
  if FileExists( SysFileName ) then
    SystemIni := TIniFile.Create( SysFileName );

  if SystemIni = nil then begin
  	showmessage('システム設定ファイルが見つかりません。');
    PostQuitMessage(0);
    exit;
  end;
  //値を取得
  //調書描画モード
  JMode_Saku1 := SystemIni.ReadBool('sysmode', 'tyousyo_do', false );
  JMode_Dosei1 := SystemIni.ReadBool('sysmode', 'tyousyo_dosei1', false );
  JMode_Fusyoku1 := SystemIni.ReadBool('sysmode', 'tyousyo_fusyoku1', false );
  JMode_Titen1 := SystemIni.ReadInteger('sysmode', 'tyousyo_titen1', 0 );
  JMode_Saku2 := SystemIni.ReadBool('sysmode', 'tyousyo_se', false );
  JMode_Dosei2 := SystemIni.ReadBool('sysmode', 'tyousyo_dosei2', false );
  JMode_Fusyoku2 := SystemIni.ReadBool('sysmode', 'tyousyo_fusyoku2', false );
  JMode_Titen2 := SystemIni.ReadInteger('sysmode', 'tyousyo_titen2', 0 );

  JMode_Memori := SystemIni.ReadBool('sysmode', 'tyousyo_Memori', false );
  JMode_Brush := SystemIni.ReadBool('sysmode', 'tyousyo_Brush', true );


  Ch1.Checked := JMode_Saku1;
  Ch2.Checked := JMode_Saku2;

  ChDo1.Checked := JMode_Dosei1;
  ChDo2.Checked := JMode_Dosei2;

  ChFu1.Checked := JMode_Fusyoku1;
  ChFu2.Checked := JMode_Fusyoku2;


  ChMemori.Checked := JMode_Memori;
  ChBrush.Checked := JMode_Brush;

  if JMode_Titen1 <= 0  then JMode_Titen1 := 9;
  if (JMode_Titen1 > 9) and (JMode_Titen1 < 99)  then JMode_Titen1 := 9;
  ETiten1.Text := IntToStr(JMode_Titen1);

  if JMode_Titen2 <= 0  then JMode_Titen2 := 7;
  if (JMode_Titen2 > 9) and (JMode_Titen2 < 99)  then JMode_Titen1 := 9;
  ETiten2.Text := IntToStr(JMode_Titen2);





  JMode_pH := SystemIni.ReadInteger('sysmode', 'tyousyo_pH', 0 );
  EpH.Text := IntToStr(JMode_pH);
  JMode_EC := SystemIni.ReadInteger('sysmode', 'tyousyo_EC', 0 );
  EEC.Text := IntToStr(JMode_EC);
  JMode_P := SystemIni.ReadInteger('sysmode', 'tyousyo_P', 0 );
  EP.Text := IntToStr(JMode_P);
  JMode_CaO := SystemIni.ReadInteger('sysmode', 'tyousyo_CaO', 0 );
  ECaO.Text := IntToStr(JMode_CaO);
  JMode_MgO := SystemIni.ReadInteger('sysmode', 'tyousyo_MgO', 0 );
  EMgO.Text := IntToStr(JMode_MgO);
  JMode_K2O := SystemIni.ReadInteger('sysmode', 'tyousyo_K2O', 0 );
  EK2O.Text := IntToStr(JMode_K2O);


  JMode_Houwa := SystemIni.ReadInteger('sysmode', 'tyousyo_Houwa', 0 );
  EHouwa.Text := IntToStr(JMode_Houwa);
  JMode_Hiritu := SystemIni.ReadInteger('sysmode', 'tyousyo_Hiritu', 0 );
  EHiritu.Text := IntToStr(JMode_Hiritu);

  JMode_CEC := SystemIni.ReadInteger('sysmode', 'tyousyo_CEC', 0 );
  ECEC.Text := IntToStr(JMode_CEC);
  JMode_Rin := SystemIni.ReadInteger('sysmode', 'tyousyo_Rin', 0 );
  ERin.Text := IntToStr(JMode_Rin);

JMode_1 := 1;
  JMode_N := SystemIni.ReadInteger('sysmode', 'tyousyo_N', 0 );
  EN.Text := IntToStr(JMode_N);
  JMode_Kei := SystemIni.ReadInteger('sysmode', 'tyousyo_Kei', 0 );
  EKei.Text := IntToStr(JMode_Kei);
  JMode_Fe := SystemIni.ReadInteger('sysmode', 'tyousyo_Fe', 0 );
  EFe.Text := IntToStr(JMode_Fe);
  JMode_Aen := SystemIni.ReadInteger('sysmode', 'tyousyo_Aen', 0 );
  EAen.Text := IntToStr(JMode_Aen);
  JMode_Dou := SystemIni.ReadInteger('sysmode', 'tyousyo_Dou', 0 );
  EDou.Text := IntToStr(JMode_Dou);
  JMode_Man := SystemIni.ReadInteger('sysmode', 'tyousyo_Man', 0 );
  EMan.Text := IntToStr(JMode_Man);
  JMode_Hou := SystemIni.ReadInteger('sysmode', 'tyousyo_Hou', 0 );
  EHou.Text := IntToStr(JMode_Hou);
  JMode_Ni := SystemIni.ReadInteger('sysmode', 'tyousyo_Ni', 0 );
  ENi.Text := IntToStr(JMode_Ni);
  JMode_Fus := SystemIni.ReadInteger('sysmode', 'tyousyo_Fus', 0 );
  EFus.Text := IntToStr(JMode_Fus);

  JMode_You := SystemIni.ReadInteger('sysmode', 'tyousyo_You', 0 );
  EYou.Text := IntToStr(JMode_You);
  JMode_Youdatu := SystemIni.ReadInteger('sysmode', 'tyousyo_Youdatu', 0 );
  EYoudatu.Text := IntToStr(JMode_Youdatu);


  JMode_Hantei := SystemIni.ReadInteger('sysmode', 'tyousyo_Hantei', 50 );
  EHantei.Text := InttoStr(JMode_Hantei);


  JMode_CNketa := SystemIni.ReadInteger('sysmode', 'tyousyo_CN', 0 );
  ECN.Text := InttoStr(JMode_CNketa);


  JMode_Yobi1name := SystemIni.ReadString('sysmode', 'tyousyo_Yobi1name', 'XXX1' );
  EYobi1name.Text := JMode_Yobi1name;
  JMode_Yobi1keta := SystemIni.ReadInteger('sysmode', 'tyousyo_Yobi1keta', 0 );
  EYobi1keta.Text := InttoStr(JMode_Yobi1keta);

  JMode_Yobi2name := SystemIni.ReadString('sysmode', 'tyousyo_Yobi2name', 'XXX2' );
  EYobi2name.Text := JMode_Yobi2name;
  JMode_Yobi2keta := SystemIni.ReadInteger('sysmode', 'tyousyo_Yobi2keta', 0 );
  EYobi2keta.Text := InttoStr(JMode_Yobi2keta);

  JMode_Yobi3name := SystemIni.ReadString('sysmode', 'tyousyo_Yobi3name', 'XXX3' );
  EYobi3name.Text := JMode_Yobi3name;
  JMode_Yobi3keta := SystemIni.ReadInteger('sysmode', 'tyousyo_Yobi3keta', 0 );
  EYobi3keta.Text := InttoStr(JMode_Yobi3keta);


  //  if JMode_Titen1 = "" then  JMode_Titen1 := "7";
//  if JMode_Titen2 = "" then  JMode_Titen2 := "7";


  //堆肥
  Etaihi[1] := ETai1;
  Etaihi[2] := ETai2;
  Etaihi[3] := ETai3;
  Etaihi[4] := ETai4;
  Etaihi[5] := ETai5;
  Etaihi[6] := ETai6;
  Etaihi[7] := ETai7;
  Etaihi[8] := ETai8;
  Etaihi[9] := ETai9;
  Etaihi[10] := ETai10;
  Etaihi[11] := ETai11;

  for i := 1 to 11 do begin
    stmp := 'kou' + inttostr(i);
    TaKeta[i] := SystemIni.ReadInteger('KetaTaihi', stmp, 0 );
    Etaihi[i].Text := InttoStr(TaKeta[i]);
  end;


  //飼料
  Esiryou[1] := Esiryou1;
  Esiryou[2] := Esiryou2;
  Esiryou[3] := Esiryou3;
  Esiryou[4] := Esiryou4;
  Esiryou[5] := Esiryou5;
  Esiryou[6] := Esiryou6;
  Esiryou[7] := Esiryou7;
  Esiryou[8] := Esiryou8;
  Esiryou[9] := Esiryou9;
  Esiryou[10] := Esiryou10;
  Esiryou[11] := Esiryou11;
  Esiryou[12] := Esiryou12;
  Esiryou[13] := Esiryou13;
  Esiryou[14] := Esiryou14;
  Esiryou[15] := Esiryou15;
  Esiryou[16] := Esiryou16;
  Esiryou[17] := Esiryou17;
  Esiryou[18] := Esiryou18;
  Esiryou[19] := Esiryou19;
  Esiryou[20] := Esiryou20;
  Esiryou[21] := Esiryou21;
  Esiryou[22] := Esiryou22;
  Esiryou[23] := Esiryou23;
  Esiryou[24] := Esiryou24;
  Esiryou[25] := Esiryou25;
  Esiryou[26] := Esiryou26;
  Esiryou[27] := Esiryou27;
  for i := 1 to 27 do begin
    stmp := 'kou' + inttostr(i);
 //   SiKeta[i] := SystemIni.ReadInteger('KetaSiryo', stmp, 0 );
  //  Esiryou[i].Text := InttoStr(SiKeta[i]);
  end;













end;

procedure TFJyouken.btnCloseClick(Sender: TObject);
begin
    close;
end;

procedure TFJyouken.btnPostClick(Sender: TObject);
var
    itmp : Integer;
    i : Integer;
    stmp : String;
begin


    SystemIni.WriteBool('sysmode', 'tyousyo_do', Ch1.Checked );
    SystemIni.WriteBool('sysmode', 'tyousyo_se', Ch2.Checked );
    JMode_Saku1 := Ch1.Checked;
    JMode_Saku2 := Ch2.Checked;


    SystemIni.WriteBool('sysmode', 'tyousyo_dosei1', ChDo1.Checked );
    JMode_Dosei1 := ChDo1.Checked;
    SystemIni.WriteBool('sysmode', 'tyousyo_dosei2', ChDo2.Checked );
    JMode_Dosei2 := ChDo2.Checked;

    SystemIni.WriteBool('sysmode', 'tyousyo_fusyoku1', ChFu1.Checked );
    JMode_Fusyoku1 := ChFu1.Checked;
    SystemIni.WriteBool('sysmode', 'tyousyo_fusyoku2', ChFu2.Checked );
    JMode_Fusyoku2 := ChFu2.Checked;


    SystemIni.WriteBool('sysmode', 'tyousyo_Memori', ChMemori.Checked );
    JMode_Memori := ChMemori.Checked;

    SystemIni.WriteBool('sysmode', 'tyousyo_Brush', ChBrush.Checked );
    JMode_Brush := ChBrush.Checked;




    itmp := StrToInt(ETiten1.Text);
    if itmp <= 0 then itmp := 9;
    if (itmp > 7) and (itmp < 99 ) then itmp := 9;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Titen1', itmp );
    JMode_Titen1 := itmp;

    itmp := StrToInt(ETiten2.Text);
    if itmp <= 0 then itmp := 7;
    if (itmp > 7) and (itmp < 99 ) then itmp := 9;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Titen2', itmp );
    JMode_Titen2 := itmp;

    itmp := StrToInt(EpH.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_pH', itmp );
    JMode_pH := itmp;

    itmp := StrToInt(EEC.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_EC', itmp );
    JMode_EC := itmp;

    itmp := StrToInt(EP.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_P', itmp );
    JMode_P := itmp;


    itmp := StrToInt(ECaO.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_CaO', itmp );
    JMode_CaO := itmp;

    itmp := StrToInt(EMgO.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_MgO', itmp );
    JMode_MgO := itmp;

    itmp := StrToInt(EK2O.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_K2O', itmp );
    JMode_K2O := itmp;

    itmp := StrToInt(EHouwa.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Houwa', itmp );
    JMode_Houwa := itmp;

    itmp := StrToInt(EHiritu.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Hiritu', itmp );
    JMode_Hiritu := itmp;

    itmp := StrToInt(ECEC.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_CEC', itmp );
    JMode_CEC := itmp;

    itmp := StrToInt(ERin.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Rin', itmp );
    JMode_Rin := itmp;

    itmp := StrToInt(EN.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_N', itmp );
    JMode_N := itmp;

    itmp := StrToInt(EKei.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Kei', itmp );
    JMode_Kei := itmp;

    itmp := StrToInt(EFe.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Fe', itmp );
    JMode_Fe := itmp;

    itmp := StrToInt(EAen.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Aen', itmp );
    JMode_Aen := itmp;

    itmp := StrToInt(EDou.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Dou', itmp );
    JMode_Dou := itmp;

    itmp := StrToInt(EMan.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Man', itmp );
    JMode_Man := itmp;

    itmp := StrToInt(EHou.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Hou', itmp );
    JMode_Hou := itmp;

    itmp := StrToInt(ENi.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Ni', itmp );
    JMode_Ni := itmp;

    itmp := StrToInt(EFus.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Fus', itmp );
    JMode_Fus := itmp;

    itmp := StrToInt(EYou.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_You', itmp );
    JMode_You := itmp;

    itmp := StrToInt(EYoudatu.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Youdatu', itmp );
    JMode_Youdatu := itmp;

    itmp := StrToInt(EHantei.Text);
    if itmp < 0 then itmp := 0;
//    if itmp > 100 then itmp := 100;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Hantei', itmp );
    JMode_Hantei := itmp;


    itmp := StrToInt(ECN.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_CN', itmp );
    JMode_CNketa := itmp;



    JMode_Yobi1name := EYobi1name.Text;
    SystemIni.WriteString('sysmode', 'tyousyo_Yobi1name', JMode_Yobi1name );
    itmp := StrToInt(EYobi1keta.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Yobi1keta', itmp );
    JMode_Yobi1keta := itmp;

    JMode_Yobi2name := EYobi2name.Text;
    SystemIni.WriteString('sysmode', 'tyousyo_Yobi2name', JMode_Yobi2name );
    itmp := StrToInt(EYobi2keta.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Yobi2keta', itmp );
    JMode_Yobi2keta := itmp;

    JMode_Yobi3name := EYobi3name.Text;
    SystemIni.WriteString('sysmode', 'tyousyo_Yobi3name', JMode_Yobi3name );
    itmp := StrToInt(EYobi3keta.Text);
    if itmp < 0 then itmp := 3;
    if itmp > 3 then itmp := 3;
    SystemIni.WriteInteger('sysmode', 'tyousyo_Yobi3keta', itmp );
    JMode_Yobi3keta := itmp;



    //堆肥の桁
    for i := 1 to 11 do begin
      stmp := 'kou' + inttostr(i);

      if Etaihi[i].Text <> '' then begin
          itmp := StrtoInt(Etaihi[i].Text);
      end
      else begin
          itmp := 0;
      end;
      TaKeta[i] := itmp;
      stmp := 'kou'+InttoStr(i);
      SystemIni.WriteInteger('KetaTaihi',stmp, itmp);

    end;

    //飼料の桁
    for i := 1 to 27 do begin
      stmp := 'kou' + inttostr(i);

      if Esiryou[i].Text <> '' then begin
          itmp := StrtoInt(Esiryou[i].Text);
      end
      else begin
          itmp := 0;
      end;
//      SiKeta[i] := itmp;
      stmp := 'kou'+InttoStr(i);
      SystemIni.WriteInteger('KetaSiryo',stmp, itmp);

    end;

    close;

end;

end.

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
		{ Private �錾 }


  public
    { Public �錾 }
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

    NN : Double;   //���f�@�d�l���钂�f
    NNMin : Double;
    NNMax : Double;


    AN : Double;

    Fe : Double;

    Fusyoku : Double;   //���A

    CEC : Double;
    //CECMin : Double;  //CEC�̊�l�Ȃ�
    //CECMax : Double;

    KudoHouwa : Double;
    KudoHouwaMax : Double;

    Karihouwa : Double;  //�����O�a
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

    DokaiGNo : String; //�y���ނ̃O���[�v�ԍ�


    CECFlg : Boolean; //�y�������CEC�z��@True�@01
    Flg_EnkiCa : Boolean; //����o�����X�@�ΊD   02
    Flg_EnkiMg : Boolean;                  //03
    Flg_EnkiCaMg : Boolean;                //04
    Flg_OneT : Boolean;  //�����^�b�`�엿  05

    Flg_Taihi : Boolean;  //�͔�@�@11
    Flg_Dosin : Boolean;  //�y��f�f�@�͔�Ȃ��@�@12
    Flg_Fusoku: Boolean;  //�s������~�G�@�@13
    Flg_FusokuMsg : String;

    Flg_Max : Boolean;  //�ő�l�𒴂����ꍇ 14
    Flg_MaxMsg : String;

    Flg_Sehi : Boolean;  //���f�𕪐͂��Ă��Ȃ��Ƃ����́A�{���\�����Ȃ��B

    tankaru : Double;  //�Y�J���{�p��

    PrnLeftX : integer;  //����̍��}�[�W�@�{��݌v�̂�


  end;

{
type JCmtVal2 = record

    PCount : Integer;  //�o�͌�

    SNo : String;
    Sakumoku : String;
    Dojyou : String;
    SakuSyurui : String;

    pH : double;
    pHMin : Double;
    pHMax : Double;
    pHMark : String; // �}�[�N

    EC : Double;
    ECMin : Double;
    ECMax : Double;
    ECMark : String; // �}�[�N

    CaO : Double;
    CaOMin : Double;
    CaOMax : Double;
    CaOMark : String; // �}�[�N

    MgO : Double;
    MgOMin : Double;
    MgOMax : Double;
    MgOMark : String; // �}�[�N
//20
    K2O : Double;
    K2OMin : Double;
    K2OMax : Double;
    K2OMark : String; // �}�[�N

    P : Double;
    PMin : Double;
    PMax : Double;
    PMark : String; // �}�[�N
    RinsanRiyou : DOuble;

//    AN : array [1..2] of Double;   //
//    NetuN : array [1..2] of Double;   //
//    KaN : array [1..2] of Double;   //
    N : Double;   //�Ɏ_�Ԓ��f
    NMark : String; // �}�[�N





    Fe : Double;
    FeMin : Double;
    FeMax : Double;
    FeMark : String; // �}�[�N
    Kei : Double;
    KeiMin : Double;
    KeiMax : Double;
    KeiMark : String; // �}�[�N


    CEC : Double;
//40
    Karihouwa : Double;  //�����O�a

    Fu : Double;   //���A
    FuMin : Double;   //���A
    FuMax : Double;   //���A
    FuMark : String; // �}�[�N


    KudoHouwa : Double;

    SekkaiHouwa : Double;
    SekkaiKudo : Double;
    SekkaiKudoMin : Double;
    SekkaiKudoMax : Double;
    SekkaiKudoMark : String; // �}�[�N

    KudoKari : DOuble;
    KudoKariMin : DOuble;
    KudoKariMax : DOuble;
    KudoKariMark : String; // �}�[�N

    EnkiHouwa : Double;
    EnkiHouwaMin : Double;
    EnkiHouwaMax : Double;
    EnkiHouwaMark : String; // �}�[�N

    DokaiGNo : String; //�y���ނ̃O���[�v�ԍ�
//60

    CECFlg : Boolean; //�y�������CEC�z��@True�@01
    Flg_EnkiCa : Boolean; //����o�����X�@�ΊD   02
    Flg_EnkiMg : Boolean;                  //03
    Flg_EnkiCaMg : Boolean;                //04
    Flg_OneT : Boolean;  //�����^�b�`�엿  05

    Flg_Taihi : Boolean;  //�͔�@�@11
    Flg_Dosin : Boolean;  //�y��f�f�@�͔�Ȃ��@�@12
    Flg_Fusoku: Boolean;  //�s������~�G�@�@13
    Flg_FusokuMsg : String;

    Flg_Max : Boolean;  //�ő�l�𒴂����ꍇ 14
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
	RightEnd = 180;  {����E�[���Œ�̂ق�����`�������ɂȂ�}
  CIRCLEGRFMAXSIZE = 25; //30;	{�~�O���t�O���t������amm}
  CIRCLEMAXSIZE = 18; //20;	{�~�O���t������amm}
  CIRCLEMINSIZE = 7; //10;	{�~�O���t�������amm}

  //�q���@�����@�{��{��
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

//���l�𕶎���ɕϊ����Ă��琔�l�ɖ߂�
function FtoStrtoF( ans : Double; imode : integer) : double;
var
stmp : String;
btmp : Double;
begin

   stmp := Format('%.*f',[imode,ans]);
   //stmp := Format('%.*n',[imode,ans]);  //1000�𒴂����,������̂łO�ɂȂ�
   btmp := StrToFloatDef(stmp, 0.0);
   result := btmp;

end;




//�����R�}���h����
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
//        if FieldByName('�앨').AsString = val.Sakumoku then begin

           if FieldByName('���ڂP').AsString = 'pH' then begin
                min1 := val.pHMin;
                max1 := val.pHMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.pH;
           end
           else if FieldByName('���ڂP').AsString = 'EC' then begin
                min1 := val.ECMin;
                max1 := val.ECMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.EC;

           end
           else if FieldByName('���ڂP').AsString = 'MgO' then begin
                min1 := val.MgOMin;
                max1 := val.MgOMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.MgO;

           end
           else if FieldByName('���ڂP').AsString = 'K2O' then begin
                min1 := val.K2OMin;
                max1 := val.K2OMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.K2O;
           end
           else if FieldByName('���ڂP').AsString = 'P' then begin
                min1 := val.PMin;
                max1 := val.PMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.P;

           end
           else if FieldByName('���ڂP').AsString = '����O�a�x' then begin
                min1 := val.EnkiHouwaMin;
                max1 := val.EnkiHouwaMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.EnkiHouwa;
           end
           else if FieldByName('���ڂP').AsString = '�ΊD��y��' then begin
                min1 := val.SekkaiKudoMin;
                max1 := val.SekkaiKudoMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.SekkaiKudo;
           end
           else if FieldByName('���ڂP').AsString = '��y������' then begin
                min1 := val.KudoKariMin;
                max1 := val.KudoKariMax;
                if max1 <= 0 then max1 := 99999;
                ans1 := val.KudoKari;
           end;

           ///////////////////////
           if FieldByName('���ڂQ').AsString = 'pH' then begin
                min2 := val.pHMin;
                max2 := val.pHMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.pH;
           end
           else if FieldByName('���ڂQ').AsString = 'EC' then begin
                min2 := val.ECMin;
                max2 := val.ECMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.EC;

           end
           else if FieldByName('���ڂQ').AsString = 'MgO' then begin
                min2 := val.MgOMin;
                max2 := val.MgOMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.MgO;

           end
           else if FieldByName('���ڂQ').AsString = 'K2O' then begin
                min2 := val.K2OMin;
                max2 := val.K2OMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.K2O;
           end
           else if FieldByName('���ڂQ').AsString = 'P' then begin
                min2 := val.PMin;
                max2 := val.PMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.P;

           end
           else if FieldByName('���ڂQ').AsString = '����O�a�x' then begin
                min2 := val.EnkiHouwaMin;
                max2 := val.EnkiHouwaMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.EnkiHouwa;
           end
           else if FieldByName('���ڂQ').AsString = '�ΊD��y��' then begin
                min2 := val.SekkaiKudoMin;
                max2 := val.SekkaiKudoMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.SekkaiKudo;
           end
           else if FieldByName('���ڂQ').AsString = '��y������' then begin
                min2 := val.KudoKariMin;
                max2 := val.KudoKariMax;
                if max2 <= 0 then max2 := 99999;
                ans2 := val.KudoKari;
           end;

           ///////////////////////
           if FieldByName('���ڂR').AsString = 'pH' then begin
                min3 := val.pHMin;
                max3 := val.pHMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.pH;
           end
           else if FieldByName('���ڂR').AsString = 'EC' then begin
                min3 := val.ECMin;
                max3 := val.ECMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.EC;

           end
           else if FieldByName('���ڂR').AsString = 'MgO' then begin
                min3 := val.MgOMin;
                max3 := val.MgOMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.MgO;

           end
           else if FieldByName('���ڂR').AsString = 'K2O' then begin
                min3 := val.K2OMin;
                max3 := val.K2OMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.K2O;
           end
           else if FieldByName('���ڂR').AsString = 'P' then begin
                min3 := val.PMin;
                max3 := val.PMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.P;

           end
           else if FieldByName('���ڂR').AsString = '����O�a�x' then begin
                min3 := val.EnkiHouwaMin;
                max3 := val.EnkiHouwaMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.EnkiHouwa;
           end
           else if FieldByName('���ڂR').AsString = '�ΊD��y��' then begin
                min3 := val.SekkaiKudoMin;
                max3 := val.SekkaiKudoMax;
                if max3 <= 0 then max3 := 99999;
                ans3 := val.SekkaiKudo;
           end
           else if FieldByName('���ڂR').AsString = '��y������' then begin
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
           //�����P
           sakumotu := FieldByName('�앨').AsString;
           if sakumotu = '�S�앨' then begin
              saku := '';
           end
           else if FieldByName('�앨').AsString = '����' then begin
              saku := '1';
           end
           else if FieldByName('�앨').AsString = '��' then begin
              saku := '2';
           end
           else if FieldByName('�앨').AsString = '���' then begin
              saku := '3';
           end
           else if FieldByName('�앨').AsString = '�Ԃ�' then begin
              saku := '4';
           end
           else if FieldByName('�앨').AsString = '�ʎ�' then begin
              saku := '5';
           end
           else if FieldByName('�앨').AsString = '���n' then begin
              saku := '6';
           end
           else if FieldByName('�앨').AsString = '����' then begin
              saku := '7';
           end
           else if FieldByName('�앨').AsString = '���̑�' then begin
              saku := '8';
           end;

           if saku = '' then begin
              flg1 := 1; //���݂́A�S�Ă̍앨OK
           end
           else if saku = val.Sakumoku then begin
              flg1 := 1;
              //����y�̏ꍇ�́A�ʂ�
              if Val.Sakucd = '104' then begin
                 flg1 := 0;
              end;

           end;


           //�����Q
           if FieldByName('�����L���P').AsString = '' then begin
              flg2 := 1;
           end
           else if FieldByName('�����L���P').AsString = '��' then begin
             if (min1 > ans1) and ( ans1 <> 0 ) then begin
                flg2 := 1;
             end;
           end
           else if FieldByName('�����L���P').AsString = '��' then begin
             if (min1 < ans1) and ( ans1 <> 0 ) then begin
                flg2 := 1;
             end;
           end;

           if FieldByName('����L���P').AsString = '' then begin
              flg3 := 1;
           end
           else if FieldByName('����L���P').AsString = '��' then begin
             if (max1 < ans1) and ( ans1 <> 0 ) then begin
                flg3 := 1;
             end;
           end
           else if FieldByName('����L���P').AsString = '��' then begin
             if (max1 > ans1) and ( ans1 <> 0 ) then begin
                flg3 := 1;
             end;
           end;


           //�����R
           if FieldByName('�����L���Q').AsString = '' then begin
              flg4 := 1;
           end
           else if FieldByName('�����L���Q').AsString = '��' then begin
             if (min2 > ans2) and ( ans2 <> 0 ) then begin
                flg4 := 1;
             end;
           end
           else if FieldByName('�����L���Q').AsString = '��' then begin
             if (min2 < ans2) and ( ans2 <> 0 ) then begin
                flg4 := 1;
             end;
           end;

           if FieldByName('����L���Q').AsString = '' then begin
              flg5 := 1;
           end
           else if FieldByName('����L���Q').AsString = '��' then begin
             if (max2 < ans2) and ( ans2 <> 0 ) then begin
                flg5 := 1;
             end;
           end
           else if FieldByName('����L���Q').AsString = '��' then begin
             if (max2 > ans2) and ( ans2 <> 0 ) then begin
                flg5 := 1;
             end;
           end;

           //�����S
           btmp := 0;
           if FieldByName('�').AsString = '��l���' then begin
             btmp := Max3 * FieldByName('�{��').AsFloat;
           end
           else if FieldByName('�').AsString = '��l����' then begin
             btmp := Min3 * FieldByName('�{��').AsFloat;
           end;


           if FieldByName('�L���R').AsString = '' then begin
              flg6 := 1;
           end
           else if FieldByName('�L���R').AsString = '��' then begin
             if (btmp < ans3) and ( ans3 <> 0 ) then begin
                flg6 := 1;
             end;
           end
           else if FieldByName('�L���R').AsString = '��' then begin
             if (btmp > ans3) and ( ans3 <> 0 ) then begin
                flg6 := 1;
             end;
           end;


           //�����T
           flg7 := 0;
           stmp := FieldByName('���ڂT').AsString;
           if stmp <> '' then begin
             if FieldByName('���ڂT').AsString = Val.renraku then begin
                flg7 := 1;
             end;
           end
           else begin
                flg7 := 1;

           end;




           if (flg1 = 1) and (flg2 = 1) and (flg3 = 1) and (flg4 = 1) and (flg5 = 1) and (flg6 = 1) and (flg7 = 1) then begin
              scmt := scmt + FieldByName('�R�����g').AsString+#13;
           end;





//        end;
        Next;
   end;
   close;
  end;
   result := scmt;

end;






{�����킹�A�����_�����ɂ�����ʒu}
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
//0��\������
function FtoStr2(aValue : double; aPrec : integer ):string; overload;
begin
	if aValue < 0.000 then aValue := 0.00;

	result := Format('%.*n',[aPrec,aValue]);
end;
//0�́A�\�����Ȃ� 3����؂�,������Ȃ�
function FtoStr3(aValue : double; aPrec : integer ):string; overload;
begin
	if aValue <= 0.000 then result := ' '
  else
		result := Format('%.*f',[aPrec,aValue]);
end;
//0�́A�\�����Ȃ�
function FtoStr(aValue : double; aPrec : integer ):string; overload;
begin
	if aValue <= 0.000 then result := ' '
  else
		result := Format('%.*n',[aPrec,aValue]);
end;
function FtoStr(aField : TField; aPrec : integer ):string; overload;
begin
	if aField.isNull then result := '�|    '     {Version 0.6 #49}
  else
		result := Format('%.*n ',[aPrec,aField.asFloat]);
end;

{�y���ޗp} {Version 0.6 #49}
function FtoStr(aField : TField):string; overload;
begin
	if aField.isNull then result := ''
  else
		result := Format('%.1n ',[aField.asFloat]);
end;
{
	�߂�l�F
    ����̏ꍇ�FTrue ���̃f�[�^���݁Afalse :����
    ��ʂ̏ꍇ�FTrue �`��f�[�^���݁Afalse :����
}

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

{��l�͈͕����쐬:��\���ږ��A��������}
function MakeKijunStr( aDataSet : TDataSet; aFieldName : string; aPrec : integer ) : string;
var
stmp : String;
dc : String;
titai : String;
dcode : String;
begin

   if aFieldName = '�M���o�����f' then begin

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

    //���R�[�h�̈ړ�  //�V�Ð�p
     titai := '07A';
	   DataModule1.ADOTableRead.Locate('�n�ы敪;�y��R�[�h',VarArrayOf([titai,dc]), []);


     JVal.NNMin := DataModule1.ADOTableRead.FieldByName('�2').AsFloat; //Standard.Nkijyun1; //.0;
  	 JVal.NNMax := DataModule1.ADOTableRead.FieldByName('�3').AsFloat; //Standard.Nkijyun2; //13.5;

		result := FtoStr(Jval.NNMin, aPrec) + '�` ' + FtoStr(Jval.NNMax, aPrec)

   end
   else begin


		result :=
			FtoStr(aDataSet.FieldByName(aFieldName+'����').asFloat,aPrec) + '�` ' +
			FtoStr(aDataSet.FieldByName(aFieldName+'���').asFloat,aPrec)  ;

  //stmp :=  Copy(aFieldName,1,2);

                if Copy(aFieldName,1,2) = 'pH' then begin
                    JVal.pHMin := aDataSet.FieldByName(aFieldName+'����').asFloat;
                    JVal.pHMax := aDataSet.FieldByName(aFieldName+'���').asFloat;
                end
                else if Copy(aFieldName,1,2) = 'EC' then begin
                    JVal.ECMin := aDataSet.FieldByName(aFieldName+'����').asFloat;
                    JVal.ECMax := aDataSet.FieldByName(aFieldName+'���').asFloat;
                end
                else if Copy(aFieldName,1,4) = '��y����' then begin
                    JVal.KudoKariMin := aDataSet.FieldByName(aFieldName+'����').asFloat;
                    JVal.KudoKariMax := aDataSet.FieldByName(aFieldName+'���').asFloat;
                end
                else if Copy(aFieldName,1,2) = '��y' then begin
                    JVal.MgOMin := aDataSet.FieldByName(aFieldName+'����').asFloat;
                    JVal.MgOMax := aDataSet.FieldByName(aFieldName+'���').asFloat;
                end
                else if Copy(aFieldName,1,2) = '����' then begin
                     if Copy(aFieldName,1,4) <> '�����O�a' then begin
                        JVal.K2OMin := aDataSet.FieldByName(aFieldName+'����').asFloat;
                        JVal.K2OMax := aDataSet.FieldByName(aFieldName+'���').asFloat;
                     end;
                end
                else if Copy(aFieldName,1,2) = '����' then begin
                     if Copy(aFieldName,1,4) <> '�����_��' then begin
                       JVal.PMin := aDataSet.FieldByName(aFieldName+'����').asFloat;
                       JVal.PMax := aDataSet.FieldByName(aFieldName+'���').asFloat;
                     end;
                end
                else if Copy(aFieldName,1,2) = '����' then begin
                    JVal.EnkiHouwaMin := aDataSet.FieldByName(aFieldName+'����').asFloat;
                    JVal.EnkiHouwaMax := aDataSet.FieldByName(aFieldName+'���').asFloat;
                end
                else if Copy(aFieldName,1,4) = '�ΊD��y' then begin
                    JVal.SekkaiKudoMin := aDataSet.FieldByName(aFieldName+'����').asFloat;
                    JVal.SekkaiKudoMax := aDataSet.FieldByName(aFieldName+'���').asFloat;
                end
                else if Copy(aFieldName,1,4) = '�ΊD�O�a' then begin
                     //�������Ȃ�
                    //JVal.CaOMin := aDataSet.FieldByName(aFieldName+'����').asFloat;
                    //JVal.CaOMax := aDataSet.FieldByName(aFieldName+'���').asFloat;
                end
                else if Copy(aFieldName,1,2) = '�ΊD' then begin
                    JVal.CaOMin := aDataSet.FieldByName(aFieldName+'����').asFloat;
                    JVal.CaOMax := aDataSet.FieldByName(aFieldName+'���').asFloat;
                end;
     end;
//�����͂̏ꍇ �󎚂������Ȃ��ꍇ��
//			FtoStr(aDataSet.FieldByName(aFieldName+'����'),aPrec) + '�` ' +
//			FtoStr(aDataSet.FieldByName(aFieldName+'���'),aPrec)  ;
end;


///////////////////////////////////////////////////////////////////////////////
{��l�͈͕����쐬:��\���ږ��A��������}
{�O���t����l�擾}
function GetGrfMax( pFieldName : string  ) : double ;
//var
//  aCEC : string ;
begin
	//�e�l���Z�o
  with PrintModule1.ADOQueryKijun do begin
    {Version 0.7 #51 ��y�O�a->����O�a�̂��ߕϊ��K�v�Ȃ�}
(*
		if AnsiPos('����O�a', pFieldName ) > 0 then begin
    	aCEC := Copy( pFieldName,9,1);
  		result :=  FieldByName('�ΊD�O�a'+aCEC+'�O���t���').asFloat +
      						FieldByName('�����O�a'+aCEC+'�O���t���').asFloat +
                  FieldByName('��y�O�a'+aCEC+'�O���t���').asFloat ;
    end else begin
*)
	    result :=  FieldByName(pFieldName+'�O���t���').asFloat ;
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


 if pFieldName <> '���f' then begin


	//�e�l���Z�o
  with PrintModule1.ADOQueryKijun do begin



//  		dGrfLow :=  FieldByName(pFieldName+'�O���t����').asFloat ;
    	dKijunLow :=     FieldByName(pFieldName+'����').asFloat ;
  	  dKijunMax :=     FieldByName(pFieldName+'���').asFloat ;
//	    dGrfMax :=  FieldByName(pFieldName+'�O���t���').asFloat ;

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
      //����{��Ή����琔�l�������Ă���B


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

    //���R�[�h�̈ړ�  //�V�Ð�p
     titai := '07A';
	   DataModule1.ADOTableRead.Locate('�n�ы敪;�y��R�[�h',VarArrayOf([titai,dc]), []);


  		dGrfLow :=  0;
    	dKijunLow := DataModule1.ADOTableRead.FieldByName('�2').AsFloat; //Standard.Nkijyun1; //.0;
  	  dKijunMax := DataModule1.ADOTableRead.FieldByName('�3').AsFloat; //Standard.Nkijyun2; //13.5;
	    dGrfMax :=  30.0;
//   end;
 end;



  //��l�Ȃ����̂̓O���t�������O�A�������O�C����������~�P�O�A�O���t��������
  if dKijunMax = 0 then dKijunMax := dKijunLow * 10 ;
  if dGrfMax = 0 then dGrfMax := dKijunMax ;

  //����ł���l�������̂̓O���t�����Ȃ�
  if dGrfMax = 0 then begin
    result := 0;
    exit;
  end;
  //��l�~�̃X�P�[���i�O�~���P�j�ŏo���B
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
//���͒l���ǂ��Ɉʒu���邩
	try      //���ӁF��l������O���t����l�̏ꍇ���Z�O�ɂȂ邽�߂��̏ꍇ�̓O���t�l�̗p
    //
    if (pValue < dGrfLow) then begin  //�O���t��������
      aCalc := 0 ;
    end else
    //�O���t�����ȏ�-��l�����ȉ��̊�
    if (pValue >= dGrfLow ) and ( pValue <= dKijunLow ) then begin
      if dKijunLow = 0 then aCalc := 0   //�O���Z
//      else aCalc := ( pValue - dGrfLow ) / dKijunLow  * (aSclMin - aSclGMin )  + aSclGMin ;
//      bug.fix. 2002/12/26
      else aCalc := ( pValue - dGrfLow ) / (dKijunLow - dGrfLow ) * (aSclMin - aSclGMin )  + aSclGMin ;
    end else
    //��l������|���������̊�
    if (pValue > dKijunLow ) and ( pValue < dKijunMax ) then begin
      //�O���Z�͖��� �F��L�� �����̂���
      aCalc := ( pValue - dKijunLow ) / ( dKijunMax - dKijunLow ) *  ( aSclMax - aSclMin ) + aSclMin ;
    end else
    //��l����ȏ�-�O���t����ȉ�
    if (pValue >= dKijunMax ) and ( pValue <= dGrfMax ) then begin
      if ( dGrfMax - dKijunMax ) = 0 then aCalc := 1  //�O���Z
      else aCalc := ( pValue - dKijunMax ) / ( dGrfMax - dKijunMax ) * ( aSclGMax - aSclMax ) + aSclMax;
    end else
    //�O���t����� �F ��L���Ɠ����i�P�D�O�𒴂���j
    if (pValue > dGrfMax ) then begin
      if ( dGrfMax - dKijunMax ) = 0 then aCalc := 1.05  //�O���Z
      else aCalc := ( pValue - dKijunMax ) / ( dGrfMax - dKijunMax ) * ( aSclGMax - aSclMax ) + aSclMax;
    end
    else       //nothing
    	aCalc := 0 ;
    //�O���t�ő�l�𒴂����l�̏��u
    if aCalc > 1.05 then aCalc:= 1.05;
    if aCalc < 0 then aCalc := 0;
  except
  	aCalc := 0;
  end;
	result := aCalc ;
end;


//   ���͒l�����a�̂ǂ��Ɉʒu���邩�Ԃ��B
//�p�����[�^
//���͒l�A(�O���t�����A��l�����A��l����A�O���t���)�̍��ږ�
//�߂�l 0.0�`1.1   �O���t�������S���O�C�O���t������P�Ƃ��ĕԂ�
//�e���E�l�̊Ԃ̃X�P�[���͂��̒l�ŕς��B
//�e�~�̔��a�͒萔(mm)���Q�ƁB
//����F����O�a�̃L�[���[�h�̎��͐ΊD�A�����A��y�̘a�Ƃ���B

{�y���ރ}�X�^�̌���}
function GetDokaizaiName( pCode : string ): string ;
var
stmp : String;
begin
  result := '';
  if pCode = '' then exit ;

  if pCode = '100' then begin
    result := '������';
    exit;
  end;


  with PrintModule1.ADOQueryDokaizai do begin
    Close;
    stmp := 'Select * from M_DOKAIZAI where �R�[�h='''+pCode+'''';
//    PrintModule1.ADOQueryDokaizai.Parameters.ParamByName('�R�[�h').Value := pCode ;
    SQL.Clear;
    SQL.Add(stmp);
    Open;
    if RecordCount > 0 then
      result := FieldByName('���ޖ�').asString ;
    Close;
  end;
end;
//�y���ޖ��̎擾
//�O���[�v�R�[�h , �y���ރR�[�h
function GetDokaizaiName001( pgrp : string; pCode : string ): string ;
begin
  result := '';
  if pCode = '' then exit ;
  with PrintModule1.ADOQueryDokaizai do begin
    Close;
    if Length(pCode) <> 2 then begin
     SQL.Text := 'Select * from M_DOKAIZAI where �O���[�v = "'+pgrp+'" and �R�[�h= "'+pCode+'"';
    end
    else begin
      SQL.Text := 'Select * from M_DOKAIMAS where �R�[�h= "'+pCode+'"';
    end;

    Open;
//    PrintModule1.ADOQueryDokaizai.Parameters.ParamByName('�R�[�h').Value := pCode ;
//    Open;
    if RecordCount > 0 then
      result := FieldByName('���ޖ�').asString ;
    Close;
  end;
end;


//////
//
//   kou ���� kou1 �L�� kou3 �P��
//
//   TSHeikin �e�[�u���́A�I�[�v�����Ă����K�v������
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
if kou1 = '�����G�l���M�[' then begin
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
// �O���t�̕\���@
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

     //�g
     RectAndText(lmRECT,tlCENTER,taCENTER,sx,sY,haba,7, 10,' ',ftNORMAL);




     gmin := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'�O���t����').asFloat;
     gmax := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'�O���t���').asFloat;

     keta := 0;
     if sKou = 'pH' then keta := JMode_pH
     else if sKou = '�����_' then keta := JMode_P
     else if sKou = '�ΊD' then keta := JMode_CaO
     else if sKou = '��y' then keta := JMode_MgO
     else if sKou = '����' then keta := JMode_K2O;



     //�
     kmin := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'����').asFloat;
     kmax := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'���').asFloat;

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



     //������
     RectAndText(lmClear,tlCENTER,taLEFT,sx+mm1-2, sY, 10, 2,6,
    	FtoStr2( kmin, keta),ftNORMAL);

     RectAndText(lmClear,tlCENTER,taLEFT,sx+mm1+mm2-2, sY, 10, 2,6,
    	FtoStr2( kmax, keta),ftNORMAL);


     PenSize( BoldPenSize );
     SlantLine(sx+3,     sY+2,sx+3,     sY+7);
     SlantLine(sx+haba-4,sY+2,sx+haba-4,sY+7);
     //��̐�
     PenSize( DefPenSize );
     SlantLine(sx,sY+2,sx+haba,sY+2);

     //��
     RectAndText(lmClear,tlCENTER,taCENTER,sx+ansmm-1, sY+2, 2, 5,10,
    	'��',ftNORMAL);


//     RectAndText(lmNONE,tlCENTER,taCENTER,sx,sY,6,2,7,
//    	'885.5',ftNORMAL);









end;
//========================================================================
// �ވ�]�Ł@�O���t
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


    //�O���t �@�@90
    haba := 90;
    sx := 90;
    RectAndText(lmRECT,tlCENTER,taCENTER,90,CurLine,90,dhaba,		9,
    	' ',ftNORMAL);

     gmin := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'�O���t����').asFloat;
     gmax := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'�O���t���').asFloat;


     //�
     kmin := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'����').asFloat;
     kmax := PrintModule1.ADOQueryKijun.FieldByName(sKou+typCEC+'���').asFloat;

     if gmin > kmin then gmin := kmin;
     if gmax < kmax then gmax := kmax;

     if kmin > kmax then kmax := gmax;


    keta := 0;
     if sKou = 'pH' then keta := JMode_pH
     else if sKou = 'EC' then keta := JMode_EC
     else if sKou = '�����_' then keta := JMode_P
     else if sKou = '�ΊD' then keta := JMode_CaO
     else if sKou = '��y' then keta := JMode_MgO
     else if sKou = '����' then keta := JMode_K2O;



    //��l
     mm1 := Round(((90 - 6) / ( gmax - gmin )) * (kmin - gmin) );
     mm2 := Round(((90 - 6) / ( gmax - gmin )) * (kmax - kmin) );

     if gmin > ans then ansmm := 1
     else if gmax < ans then ansmm := haba - 3
     else ansmm := Round(((haba - 6) / ( gmax - gmin )) * (ans - gmin) );

     RectAndText(lmRECTFILL,tlCENTER,taCENTER,90+mm1,CurLine + 2,mm2,dhaba - 2,		9,
    	' ',ftNORMAL);

     //`������
     RectAndText(lmClear,tlCENTER,taLEFT,sx+mm1-2,CurLine,5,3,		7,
    	FtoStr2( kmin, keta),ftNORMAL);

     RectAndText(lmClear,tlCENTER,taLEFT,sx+mm1+mm2-2,CurLine,5,3,		7,
    	FtoStr2( kmax, keta),ftNORMAL);

    //�����
    RectAndText(lmClear,tlCENTER,taLEFT,sx+3,CurLine,5,3,		7,
    	FtoStr2( gmin, keta),ftNORMAL);

    RectAndText(lmClear,tlCENTER,taRIGHT,172,CurLine,5,3,		7,
    	FtoStr2( gmax, keta),ftNORMAL);


    RectAndText(lmClear,tlCENTER,taCENTER,sx+ansmm-1,CurLine + 2,3,4,		9,
    	'��',ftNORMAL);




    //���������
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


    if sAns = '�P�C�_' then begin
        gmin := PrintModule1.ADOQueryKijun.FieldByName(sAns+'�O���t����').asFloat;
        gmax := PrintModule1.ADOQueryKijun.FieldByName(sAns+'�O���t���').asFloat;
        kmin := PrintModule1.ADOQueryKijun.FieldByName(sAns+'����').asFloat;
//        JVal.pHMin := kmin;
        kmax := PrintModule1.ADOQueryKijun.FieldByName(sAns+'���').asFloat;
    end
    else begin
        gmin := PrintModule1.ADOQueryKijun.FieldByName(sAns+typCEC+'�O���t����').asFloat;
        gmax := PrintModule1.ADOQueryKijun.FieldByName(sAns+typCEC+'�O���t���').asFloat;
        kmin := PrintModule1.ADOQueryKijun.FieldByName(sAns+typCEC+'����').asFloat;
//        JVal.pHMin := kmin;
        kmax := PrintModule1.ADOQueryKijun.FieldByName(sAns+typCEC+'���').asFloat;
//        JVal.pHMax := kmax;
    end;








//    ans := PrintModule1.ADOQueryUketuke.FieldByName(sAns).asFloat;

   if (kmin = 0) and (kmax = 0 ) then exit;


    if gmin > ans then begin
       RectAndText(lmRECT,tlCENTER,taCENTER,XX1+108,YY1+sY,14,5,11,'��',ftNORMAL);
    end
    else if kmin > ans then begin
       btmp := (kmin - gmin) / 8.0;
       btmp := (ans - gmin) / btmp;
       itmp := Round(btmp);
       RectAndText(lmNONE,tlCENTER,taLeft,XX1+122+itmp-2,YY1+sY,10,5,11,'��',ftNORMAL);
    end
    else if kmax > ans then begin
       btmp := (kmax - kmin) / 6.0;
       btmp := (ans - kmin) / btmp;
       itmp := Round(btmp);
       if kmin = ans then begin
           RectAndText(lmNONE,tlCENTER,taLeft,XX1+179+itmp-2,YY1+sY,27,5,11,'��',ftNORMAL);
       end
       else begin
           RectAndText(lmNONE,tlCENTER,taLeft,XX1+179+itmp-2,YY1+sY,27,5,11,'��',ftNORMAL);
       end;

    end
    else if gmax >= ans then begin
       btmp := (gmax - kmax) / 8.0;
       btmp := (ans - kmax) / btmp;
       itmp := Round(btmp);
       RectAndText(lmNONE,tlCENTER,taLeft,XX1+206+itmp-2,YY1+sY,10,5,11,'��',ftNORMAL);
    end
    else begin
       RectAndText(lmRECT,tlCENTER,taCENTER,XX1+263,YY1+sY,14,5,11,'��',ftNORMAL);
    end;

end;


//
//�f�f�[�̊�l��`��
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

    if kou = 'pH' then begin         koumoku := '���@�@�@�@�@�@�@�g';  tanni := '[pH]';
                                   smin := kou+'����';  smax := kou+'���';  iketa := JMode_pH;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'EC' then begin    koumoku := '�d�@�@�@�@�@�@�@�b';  tanni := '(ms/cm)';
                                   smin := kou+'����';  smax := kou+'���';  iketa := JMode_EC;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'CEC' then begin   koumoku := '�b�@�@�@�d�@�@�@�b';  tanni := '(me/100g)';
                                   smin := kou+'����';  smax := kou+'���';  iketa := JMode_CEC;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'CaO' then begin  koumoku := '�u�@���@���@�΁@�D';  tanni := '(mg/100g)';
                                   smin := '�ΊD����';  smax := '�ΊD���';  iketa := JMode_CaO;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'MgO' then begin  koumoku := '�u�@���@���@��@�y';  tanni := '(mg/100g)';
                                   smin := '��y����';  smax := '��y���';  iketa := JMode_MgO;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'K2O' then begin  koumoku :=  '�u�@���@���@���@��';  tanni := '(mg/100g)';
                                   smin := '��������';  smax := '�������';  iketa := JMode_K2O;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�g���I�[�OP' then begin  koumoku := '�@���@�� �� �� �_';  tanni := '(mg/100g)';
                                   smin := '�����_����';  smax := '�����_���';  iketa := JMode_P;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�Ɏ_��N' then begin koumoku := '�Ɂ@�_�@�ԁ@���@�f';  tanni := '(mg/100g)';
                                   smin := '�Ɏ_��N����';  smax := '�Ɏ_��N���';  iketa := JMode_N;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�P�C�_' then begin koumoku := '�@���@�� �P �C �_';  tanni := '(mg/100g)';
                                   smin := '�P�C�_����';  smax := '�P�C�_���';  iketa := JMode_Kei;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�S' then begin koumoku := '�V�@���@�_�@���@�S';  tanni := '(ppm)';
                                   smin := '�S����';  smax := '�S���';  iketa := JMode_Fe;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '���A' then begin     koumoku := '���@�@�@�@�@�@�A';  tanni := '(%)';
                                   smin := '���A����';  smax := '���A���';  iketa := JMode_Fus;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�}���K��' then begin koumoku := '�u �� ���}���K��';  tanni := '(ppm)';
                                   smin := '�}���K������';  smax := '�}���K�����';  iketa := JMode_Man;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '��' then begin       koumoku := '�� �@�n �@���@��';  tanni := '(ppm)';
                                   smin := '������';  smax := '�����';  iketa := JMode_Dou;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�z�E�f' then begin   koumoku := '�z�@ �@�E�@ �@�f';  tanni := '(ppm)';
                                   smin := '�z�E�f����';  smax := '�z�E�f���';  iketa := JMode_Hou;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '����' then begin     koumoku := '�@���@�ԁ@���@��';  tanni := '(ppm)';
                                   smin := '��������';  smax := '�������';  iketa := JMode_Aen;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�ΊD��y' then begin koumoku := '�΁@�D�E��@�y�@��';  tanni := '';
                                   smin := '��Ȃ�';  smax := '�ΊD��y���';  iketa := JMode_Hiritu;
       bans := JVal.SekkaiKudo;
    end
    else if kou = '��y����' then begin   koumoku := '��@�y�E���@���@��';  tanni := '';
                                   smin := '��Ȃ�';  smax := '��y�������';  iketa := JMode_Hiritu;
       bans := JVal.KudoKari;
    end
    else if kou = '�ΊD�O�a�x' then begin koumoku := '�΁@�D�@�O�@�a�@�x';  tanni := '(%)';
                                   smin := '�ΊD�O�a�x����';  smax := '�ΊD�O�a�x���';  iketa := JMode_Houwa;
       bans := JVal.SekkaiHouwa;
       Jval.SekkaiHouwaMax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;
    end
    else if kou = '��y�O�a�x' then begin koumoku := '��@�y�@�O�@�a�@�x';  tanni := '(%)';
                                   smin := '��y�O�a�x����';  smax := '��y�O�a�x���';  iketa := JMode_Houwa;
       bans := JVal.KudoHouwa;
       Jval.KudoHouwaMax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;
    end
    else if kou = '�����O�a�x' then begin koumoku := '���@���@�O�@�a�@�x';  tanni := '(%)';
                                   smin := '�����O�a�x����';  smax := '�����O�a�x���';  iketa := JMode_Houwa;
       bans := JVal.Karihouwa;
       Jval.KariHouwaMax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;
    end
    else if kou = '����O�a�x' then begin koumoku := '���@��@�O�@�a�@�x';  tanni := '(%)';
                                   smin := '��Ȃ�';  smax := '����O�a�x���';  iketa := JMode_Houwa;
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

     //stmp := '��';
     RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25+14,CurLine, 6   , 6  ,		10,
    	stmp,ftNORMAL);

      exit;

    end;

    //��l���Ȃ��Ƃ�
    if smin = '��Ȃ�' then begin

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

      //stmp := '��';
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


      stmp := FtoStr(bmin,iketa); //'XX�`XX';
      stmp := stmp + ' �` '+FtoStr(bmax,iketa); //'XX�`XX';

      RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		8,
    	stmp, ftNORMAL);

      stmp := FtoStr(bans,iketa); //'5.6';
      RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 14  , 6  ,		10,
    	  stmp,ftNORMAL);

      //stmp := '��';
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
    	'�˗��@��' ,ftNORMAL);

    stmp := FieldByName('�g����').asString + ' ' + FieldByName('�x�X��').asString;
    RectAndText(lmRECT,tlCENTER,taLEFT,0+20,CurLine, 60    , 6  ,		10,
    	stmp ,ftNORMAL);




    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60,CurLine, 20    , 6  ,		10,
    	'����NO.' ,ftNORMAL);

    stmp := FieldByName('����NO').asString;
    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20,CurLine, 30    , 6  ,		10,
    	stmp ,ftNORMAL);


    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20+30,CurLine, 20    , 6  ,		10,
    	'��t��' ,ftNORMAL);

    stmp := FormatDateTime('yyyy"�N"m"��"d"��"',FieldByName('T_UKETUKE6.��t�N����').asDateTime);
    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20+30+20,CurLine, 30    , 6  ,		10,
    	stmp ,ftNORMAL);


   CurLine := CurLine + 6;


    RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 20    , 6  ,		10,
    	'����' ,ftNORMAL);

    stmp := FieldByName('�˗��Ҏ���').asString;
    RectAndText(lmRECT,tlCENTER,taCENTER,0+20,CurLine, 60    , 6  ,		10,
    	stmp ,ftNORMAL);

    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60,CurLine, 20    , 6  ,		10,
    	'�앨' ,ftNORMAL);

    stmp := FieldByName('M_SAKUMOTU.�앨��').asstring;
    RectAndText(lmRECT,tlCENTER,taLEFT,0+20+60+20,CurLine, 30    , 6  ,		10,
    	stmp ,ftNORMAL);


    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20+30,CurLine, 20    , 6  ,		10,
    	'�񍐓�' ,ftNORMAL);

    stmp := FormatDateTime('yyyy"�N"m"��"d"��"',FieldByName('������').asDateTime);
    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20+30+20,CurLine, 30    , 6  ,		10,
    	stmp ,ftNORMAL);

   CurLine := CurLine + 6;


    RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 20    , 6  ,		10,
    	'�̎�ꏊ' ,ftNORMAL);

    stmp := FieldByName('�̎�ꏊ').asstring;
    RectAndText(lmRECT,tlCENTER,taLEFT,0+20,CurLine, 60    , 6  ,		10,
    	stmp ,ftNORMAL);

    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60,CurLine, 20    , 6  ,		10,
    	'��^' ,ftNORMAL);

    stmp := FieldByName('T_BUNSEKI6.��^��').asstring;
    RectAndText(lmRECT,tlCENTER,taLEFT,0+20+60+20,CurLine, 30    , 6  ,		10,
    	stmp ,ftNORMAL);


    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20+30,CurLine, 20    , 6  ,		10,
    	'��tNo.' ,ftNORMAL);

    stmp := FieldByName('T_UKETUKE6.��tNO').asString;
    RectAndText(lmRECT,tlCENTER,taCENTER,0+20+60+20+30+20,CurLine, 30    , 6  ,		10,
    	stmp ,ftNORMAL);



   CurLine := CurLine + 6;


    RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 20   , 6  ,		10,
    	'���l' ,ftNORMAL);

    stmp := FieldByName('T_BUNSEKI6.���l').asString;
    RectAndText(lmRECT,tlCENTER,taLEFT,0+20,CurLine, 160    , 6  ,		10,
    	stmp ,ftNORMAL);

  end;


  result := CurLine;

end;


//
//�f�f�[�̊�l��`��  �_�O���t�t��
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

    if kou = 'pH' then begin         koumoku := '���@�@�@�@�@�@�@�g';  tanni := '[pH]';
                                   smin := kou+'����';  smax := kou+'���';  iketa := JMode_pH;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'EC' then begin    koumoku := '�d�@�@�@�@�@�@�@�b';  tanni := '(ms/cm)';
                                   smin := kou+'����';  smax := kou+'���';  iketa := JMode_EC;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'CEC' then begin   koumoku := '�b�@�@�@�d�@�@�@�b';  tanni := '(me/100g)';
                                   smin := kou+'����';  smax := kou+'���';  iketa := JMode_CEC;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'CaO' then begin  koumoku := '�u�@���@���@�΁@�D';  tanni := '(mg/100g)';
                                   smin := '�ΊD����';  smax := '�ΊD���';  iketa := JMode_CaO;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'MgO' then begin  koumoku := '�u�@���@���@��@�y';  tanni := '(mg/100g)';
                                   smin := '��y����';  smax := '��y���';  iketa := JMode_MgO;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = 'K2O' then begin  koumoku :=  '�u�@���@���@���@��';  tanni := '(mg/100g)';
                                   smin := '��������';  smax := '�������';  iketa := JMode_K2O;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�g���I�[�OP' then begin  koumoku := '�@���@�� �� �� �_';  tanni := '(mg/100g)';
                                   smin := '�����_����';  smax := '�����_���';  iketa := JMode_P;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�Ɏ_��N' then begin koumoku := '�Ɂ@�_�@�ԁ@���@�f';  tanni := '(mg/100g)';
                                   smin := '�Ɏ_��N����';  smax := '�Ɏ_��N���';  iketa := JMode_N;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�P�C�_' then begin koumoku := '�@���@�� �P �C �_';  tanni := '(mg/100g)';
                                   smin := '�P�C�_����';  smax := '�P�C�_���';  iketa := JMode_Kei;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�S' then begin koumoku := '�V�@���@�_�@���@�S';  tanni := '(ppm)';
                                   smin := '�S����';  smax := '�S���';  iketa := JMode_Fe;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '���A' then begin     koumoku := '���@�@�@�@�@�@�A';  tanni := '(%)';
                                   smin := '���A����';  smax := '���A���';  iketa := JMode_Fus;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�}���K��' then begin koumoku := '�u �� ���}���K��';  tanni := '(ppm)';
                                   smin := '�}���K������';  smax := '�}���K�����';  iketa := JMode_Man;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '��' then begin       koumoku := '�� �@�n �@���@��';  tanni := '(ppm)';
                                   smin := '������';  smax := '�����';  iketa := JMode_Dou;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�z�E�f' then begin   koumoku := '�z�@ �@�E�@ �@�f';  tanni := '(ppm)';
                                   smin := '�z�E�f����';  smax := '�z�E�f���';  iketa := JMode_Hou;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '����' then begin     koumoku := '�@���@�ԁ@���@��';  tanni := '(ppm)';
                                   smin := '��������';  smax := '�������';  iketa := JMode_Aen;
      bans := PrintModule1.ADOQueryUketuke.FieldByName(kou).asfloat;
    end
    else if kou = '�ΊD��y' then begin koumoku := '�΁@�D�E��@�y�@��';  tanni := '';
                                   smin := '��Ȃ�';  smax := '�ΊD��y���';  iketa := JMode_Hiritu;
       bans := JVal.SekkaiKudo;
    end
    else if kou = '��y����' then begin   koumoku := '��@�y�E���@���@��';  tanni := '';
                                   smin := '��Ȃ�';  smax := '��y�������';  iketa := JMode_Hiritu;
       bans := JVal.KudoKari;
    end
    else if kou = '�ΊD�O�a�x' then begin koumoku := '�΁@�D�@�O�@�a�@�x';  tanni := '(%)';
                                   smin := '�ΊD�O�a�x����';  smax := '�ΊD�O�a�x���';  iketa := JMode_Houwa;
       bans := JVal.SekkaiHouwa;
       Jval.SekkaiHouwaMax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;
    end
    else if kou = '��y�O�a�x' then begin koumoku := '��@�y�@�O�@�a�@�x';  tanni := '(%)';
                                   smin := '��y�O�a�x����';  smax := '��y�O�a�x���';  iketa := JMode_Houwa;
       bans := JVal.KudoHouwa;
       Jval.KudoHouwaMax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;
    end
    else if kou = '�����O�a�x' then begin koumoku := '���@���@�O�@�a�@�x';  tanni := '(%)';
                                   smin := '�����O�a�x����';  smax := '�����O�a�x���';  iketa := JMode_Houwa;
       bans := JVal.Karihouwa;
       Jval.KariHouwaMax := PrintModule1.ADOQueryKijun.FieldbyName(smax).asFloat;
    end
    else if kou = '����O�a�x' then begin koumoku := '���@��@�O�@�a�@�x';  tanni := '(%)';
                                   smin := '��Ȃ�';  smax := '����O�a�x���';  iketa := JMode_Houwa;
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

     //stmp := '��';
     RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25+14,CurLine, 6   , 6  ,		10,
    	stmp,ftNORMAL);

      exit;

    end;

    //��l���Ȃ��Ƃ�
    if smin = '��Ȃ�' then begin

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

      //stmp := '��';
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


      stmp := FtoStr(bmin,iketa); //'XX�`XX';
      stmp := stmp + ' �` '+FtoStr(bmax,iketa); //'XX�`XX';

      RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		8,
    	stmp, ftNORMAL);

      stmp := FtoStr(bans,iketa); //'5.6';
      RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 14  , 6  ,		10,
    	  stmp,ftNORMAL);

      //stmp := '��';
      stmp := Bunseki_Hantei( bmin, bmax, bans);
      RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25+14,CurLine, 6   , 6  ,		10,
    	 stmp,ftNORMAL);
   end;



   //  �_�O���t

   //  �P������ 6 �@�@15��@�@6����P�O�܂Ŋ   MAX�@90
   itmp := 0+45+25+14+6;

//   RectAndText(lmRECTFILL,tlCENTER,taCENTER,itmp,CurLine+2, 90   , 2  ,		10,
//    	 '',ftNORMAL);

   btmp := bmax - bmin;  //��
   //�ő�l���O�̏ꍇ���@�l��
   if bmax < bmin then btmp := bmin;


   if bans <= 0 then begin
        //�Ȃɂ����Ȃ�

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
//  �y��f�f�[
//
//========================================================================
function PrintSindan( prmDeviceType : TDeviceType; pCondition : string; PageCnt : Integer; var KeyCode :string  ):boolean;

var
	Qcnt ,MaxHeight, CurLocX, cnt : integer ;
  GetLoc,PictCenter : TPoint ;
  GetLocList : array[1..6] of TPoint ;	//�O���t�`���[�g�p�p�̃s�N�Z�����W
  SekkaiKudo,KUdoKari,RinsanKudo : double;
  dblRinsan, SekkaiHouwa,Karihouwa,EnkiHouwa: double ;
  IsKusa : boolean ;
  DosituCode : string ;
  stmp : String;
  //����p�Z�o�l      {Version 0.7 #51 ��y�O�a->����O�a�̂��ߕϊ��K�v�Ȃ�}
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



  //����̃f�[�^�܂ňړ�
  Qcnt := 1 ;
  with PrintModule1.ADOQueryUketuke do begin
  	Close;




          stmp := 'Select T_BUNSEKI6.*,T_UKETUKE6.*,M_NOUKYOU.*,M_SISYO.*,M_SAKUMOTU.*,M_SAKUGATA.* '+
        'from (((((T_BUNSEKI6 '+
        ' LEFT JOIN T_UKETUKE6 ON T_BUNSEKI6.��tNO = T_UKETUKE6.��tNO) '+
        ' LEFT JOIN M_SAKUMOTU ON T_BUNSEKI6.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h) '+
        ' LEFT JOIN M_SAKUGATA ON (T_BUNSEKI6.�앨�R�[�h = M_SAKUGATA.�앨�R�[�h) and (T_BUNSEKI6.��^�R�[�h = M_SAKUGATA.��^�R�[�h)) '+
        ' LEFT JOIN M_NOUKYOU ON T_UKETUKE6.�g���ԍ� = M_NOUKYOU.�g���ԍ�) '+
        ' LEFT JOIN M_SISYO ON (T_UKETUKE6.�g���ԍ� = M_SISYO.�g���ԍ�) and (T_UKETUKE6.�x�X�ԍ� = M_SISYO.�x�X�ԍ�)) '+
        'where ' + pCondition +
        ' ORDER BY T_Bunseki6.����NO' ;




    SQL.Text := stmp;


   Open;
    while not eof do begin
      if Qcnt = PageCnt then break ;
      INC(QCnt);
      Next ;
    end;
    {�Y���f�[�^�L��H}
    if Eof then begin
      Close ;
      exit ;
    end;
  end;

    // ���ł��������Ƃ�����Ă���̂ł܂Ƃ߂�B
    //�y��
    // Jval.DojyouCD := PrintModule1.ADOQueryUketuke.FieldByName('T_UKETUKE.�y��R�[�h').asString;


  //xxxxxxxx
    MainForm.VSample := PrintModule1.ADOQueryUketuke.FieldByName('����NO').asString;
    JVal.SNO := PrintModule1.ADOQueryUketuke.FieldByName('����NO').asString;
    with PrintModule1.ADOQuerySindan do begin
      Close;
      SQL.Clear;
      stmp := 'select * from T_SINDAN where ����NO = "'+MainForm.VSample+'"';
      SQL.Add(stmp);

      Open();
      if RecordCount <= 0 then begin
         insert;
         edit;
         fieldbyname('����NO').AsString := MainForm.VSample;
         post;
      end;
    end;



//H150909
//SindanForm.CalcKijun ;    //��l�ݒ�


//SindanForm.CalcDojou ;    //�y�뎑�ޑI��





  CurLine := 0;


  with PrintModule1.ADOQueryUketuke do begin



    //�O���t������x����
    TheRect := Rect(HorzPos(0),VertPos(0),HorzPos(300),VertPos(450));
    PrintCanvas.Brush.Bitmap := nil;
    PrintCanvas.Brush.Color := clWhite; //clRed; //White;
    PrintCanvas.Brush.Style := bsSolid	;
    PrintCanvas.FillRect(TheRect);
    //�N���A�ɂ��Ă���
    PrintCanvas.Brush.Style := bsClear;


//    PrintCanvas.Font.Name := '�l�r ����';
    PrintCanvas.Font.Name := '���C���I';





    RectAndText(lmNONE,tlCENTER,taCENTER,0,0,RightEnd,15,		18,
    	'�y�땪�͌��ʕ\',ftBOLD);




    RectAndText(lmNONE,tlCENTER,taRight,0,5,RightEnd,10,		7,
    	'JA�S�_�����@�c�_��敔�@�_�ƋZ�p�Z���^�[',ftBOLD);


      CurLine := CurLine + 12;



     CurLine := shindan_top(CurLine);






    //��l���T�[�`
    PrintModule1.ADOQueryKijun.Close;
    stmp := 'select * from M_SAKUMOTU where �앨�R�[�h = ''' +
    FieldByName('T_BUNSEKI6.�앨�R�[�h').asString + '''';
    PrintModule1.ADOQueryKijun.SQL.Text := stmp;
    PrintModule1.ADOQueryKijun.Open;





    //
   CurLine := CurLine + 6;
   CurLine := CurLine + 3;  //����

   RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine, 45   , 6  ,		10,
    	'�P�D��ʐ���' ,ftNORMAL);

   CurLine := CurLine + 6;
   RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 45   , 6  ,		10,
    	'���͍���' ,ftNORMAL);

   RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		10,
    	'���ǖڕW�l' ,ftNORMAL);

   RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 20   , 6  ,		10,
    	'���͒l' ,ftNORMAL);

   RectAndText(lmNONE,tlCENTER,taLEFT,0+45+25+20,CurLine, 20   , 5  ,		7,
    	'�����F��' ,ftNORMAL);
   CurLine := CurLine + 5;
   RectAndText(lmNONE,tlCENTER,taLEFT,0+45+25+20,CurLine, 20   , 5  ,		7,
    	'�Ⴂ�F��' ,ftNORMAL);

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
   kijyunbar( '�g���I�[�OP', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '�Ɏ_��N', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '', CurLine );
   CurLine := CurLine + 6;
   kijyunbar( '', CurLine );


  //
   CurLine := CurLine + 3;

   CurLine := CurLine + 6;

   RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine, 45   , 6  ,		10,
    	'�Q�D����o�����X' ,ftNORMAL);



   CurLine := CurLine + 6;
   iYY2 := CurLine;
   iXX2 := 45+25+20;

    stmp := '���͍���';
   RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 45   , 6  ,		10,
    	stmp ,ftNORMAL);

   stmp := '���ǖڕW�l';
   RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		10,
    	stmp, ftNORMAL);

   stmp := '���͒l';
   RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 20   , 6  ,		10,
    	stmp,ftNORMAL);



    //����o�����X�v�Z����**************************************************************************
    //�ΊD��y��
    if FieldByName('MgO').asFloat <>  0 then
    	SekkaiKudo := SekkaiMe(FieldByName('Cao').asFloat) / KudoMe(FieldByName('MgO').asFloat)
    else
      SekkaiKudo := 0;

    JVal.SekkaiKudo := SekkaiKudo;


    //��y������
    if FieldByName('K2O').asFloat <> 0 then
    	KudoKari := KudoMe(FieldByName('MgO').asFloat) / KariMe(FieldByName('K2O').asFloat)
    else
    	KudoKari := 0 ;

    JVal.KudoKari := KudoKari;


    //�����_��y��
    if FieldByName('MgO').asFloat <> 0 then
    	RinsanKudo := RinsanMe(dblRinsan) / KudoMe(FieldByName('MgO').asFloat)
    else
    	RinsanKudo := 0 ;

//    JVal.RinsanKudo := RinsanKudo;

    //�ΊD�O�a�x    Ver 0.42 *CEC -> /CEC
    if FieldByName('CEC').asFloat <> 0 then
      SekkaiHouwa := SekkaiMe(FieldByName('CaO').asFloat) / FieldByName('CEC').asFloat * 100.0
    else  SekkaiHouwa := 0 ;
    JVal.SekkaiHouwa := SekkaiHouwa;


    //��y�O�a�x
    if FieldByName('CEC').asFloat <> 0 then
      JVal.KudoHouwa := KudoMe(FieldByName('MgO').asFloat) / FieldByName('CEC').asFloat * 100.0
    else  JVal.KudoHouwa := 0;



    //�����O�a�x
    if FieldByName('CEC').asFloat <> 0 then
      KariHouwa := KariMe(FieldByName('K2O').asFloat) / FieldByName('CEC').asFloat * 100.0
    else  KariHouwa := 0;
    JVal.KariHouwa := KariHouwa;




    //����O�a�x
    if FieldByName('CEC').asFloat <> 0 then
      EnkiHouwa := (SekkaiMe(FieldByName('CaO').asFloat)+
    							KariMe(FieldByName('K2O').asFloat)+
                  KudoMe(FieldByName('Mgo').asFloat)
                  )/ FieldByName('CEC').asFloat * 100.0
    else  EnkiHouwa := 0 ;
    JVal.EnkiHouwa := EnkiHouwa;




  //�ΊD�E��y��
   CurLine := CurLine + 6;
   kijyunbar( '�ΊD��y', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '��y����', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '�ΊD�O�a�x', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '��y�O�a�x', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '�����O�a�x', CurLine );

   CurLine := CurLine + 6;
   kijyunbar( '����O�a�x', CurLine );



  //
   CurLine := CurLine + 3;

   CurLine := CurLine + 6;

   RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine, 45   , 6  ,		10,
    	'�R�D���ʗv�f�@��' ,ftNORMAL);

   CurLine := CurLine + 6;

    stmp := '���͍���';
   RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 45  , 6  ,		10,
    	stmp ,ftNORMAL);

   stmp := '���ǖڕW�l';
   RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 25   , 6  ,		10,
    	stmp, ftNORMAL);

   stmp := '���͒l';
   RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25,CurLine, 20   , 6  ,		10,
    	stmp,ftNORMAL);

   stmp := '�y���͒l�̕��z�z';
   RectAndText(lmRECT,tlCENTER,taCENTER,0+45+25+20,CurLine, 90   , 6  ,		10,
    	stmp,ftNORMAL);


   RectAndText(lmRECTFILL,tlCENTER,taCENTER,151,CurLine+1, 3   , 3  ,		6,
    	'',ftNORMAL);
   stmp := ':���ǖڕW�l';
   RectAndText(lmNONE,tlCENTER,taLEFT,155,CurLine+1, 20   , 4  ,		6,
    	stmp,ftNORMAL);



//   stmp := '�F���ǖڕW�l';

   //������
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
   kijyunbar2( '�P�C�_', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '�S', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '���A', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '�}���K��', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '��', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '�z�E�f', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '����', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '', CurLine );

   CurLine := CurLine + 6;
   kijyunbar2( '', CurLine );



//���[�_�[�`���[�g

  //�~�O���t�̈��
    CurLocX := 135 ; //���SX
    CurLine := 80;   //���S

    //�~�̊p�x�͐����E���O�x���玞�v���
		CircleLine( 0, CurLocX,CurLine,CIRCLEGRFMAXSIZE );
		CircleLine( 1, CurLocX,CurLine,CIRCLEMAXSIZE );
		CircleLine( 2, CurLocX,CurLine,CIRCLEMINSIZE );
		{�O�p�_�ʒu��Ԃ����S���W�A�����A�p�x(�E����=0-360���v���)}
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,342);
		{���C���\��:��_�Ԓ����`��}

		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-5,GetLoc.Y-5,15,4,		10,
    	'�����_',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,54);


		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y,15,4,		10,
    	'�ΊD',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,126);

		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-9,GetLoc.Y,15,4,		10,
    	'��y',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,198);
		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y-5,15,4,		10,
    	'����',ftBOLD);

    //pH
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,270);
		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y-5,15,4,		10,
    	'���g',ftBOLD);

    {�e����l�̕��͒l�̈ʒu���O���t�����A�������s�N�Z���Ŋ���o��}
    PictCenter.x := HorzPos( CurLocX );
    PictCenter.y := VertPos( CurLine );
    //����l/(����l-�����l) �߂�l 0.0�`1.0
//   function GetScale( aLow, aValue, aMax : double ) : double ;

    GetLocList[1] := GetTrign(PictCenter.x, PictCenter.y ,
   		Round(GetScale(FieldByName('pH').asFloat,'pH')*HorzSize(CIRCLEGRFMAXSIZE)) ,270);

    GetLocList[2] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('�g���I�[�OP').asFloat,'�����_')*HorzSize(CIRCLEGRFMAXSIZE)) ,342);

    GetLocList[3] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('CaO').asFloat,'�ΊD')*HorzSize(CIRCLEGRFMAXSIZE)) ,54);

    GetLocList[4] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('MgO').asFloat,'��y')*HorzSize(CIRCLEGRFMAXSIZE)) ,126);

    GetLocList[5] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('K2O').asFloat,'����')*HorzSize(CIRCLEGRFMAXSIZE)) ,198);
    //���͒l�𒼐��Ō���
    for cnt := 1 to 4 do
    	PictSlantLine( GetLocList[cnt],GetLocList[cnt+1] );

   	PictSlantLine( GetLocList[5],GetLocList[1] );



    RectAndText(lmNONE,tlCENTER,taLEFT,CurLocX - 11,CurLine-40, 35   , 6  ,		8,
    	'�y���͒l�̕��z�z',ftNORMAL);




   //����O�a�x�@�O���t

    iYY2 := iYY2 + 3;  //�ʒu����

    itmp := CurLocX - iXX2 -10; //�O���t�̕�

    itmp2 := iXX2 + 10;

    RectAndText(lmNONE,tlCENTER,taLEFT,CurLocX - 11,iYY2-6, 35   , 6  ,		8,
    	'�y����O�a�x�z',ftNORMAL);


    //������
    for i := 0 to 4 do begin

    RectAndText(lmRECT,tlCENTER,taLEFT,iXX2 + 10,iYY2+6*i, itmp   , 6  ,		10,
    	'',ftNORMAL);

    end;
    for i := 0 to 4 do begin

    RectAndText(lmRECT,tlCENTER,taLEFT,iXX2 + 10 + itmp,iYY2+6*i, itmp   , 6  ,		10,
    	'',ftNORMAL);

    end;



    RectAndText(lmNONE,tlCENTER,taCENTER,iXX2 + 17,iYY2+6*5, itmp - 15   , 6  ,		8,
    	'���ǖڕW�l' ,ftNORMAL);
    RectAndText(lmNONE,tlCENTER,taCENTER,iXX2 + 17 + itmp,iYY2+6*5, itmp - 15   , 6  ,		8,
    	'���͒l' ,ftNORMAL);


    itmp2 := itmp2 + 5; //�ʒu����
    RectAndText(lmRECTFILLBLUE,tlCENTER,taCENTER,itmp2,iYY2+6*6+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

    RectAndText(lmNONE,tlCENTER,taLEFT,itmp2+2,iYY2+6*6, 20   , 4  ,		8,
    	'�ΊD�O�a�x' ,ftNORMAL);

    RectAndText(lmRECTFILLRED,tlCENTER,taCENTER,itmp2+2+20,iYY2+6*6+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

    RectAndText(lmNONE,tlCENTER,taLEFT,itmp2+2+20+2,iYY2+6*6, 20   , 4  ,		8,
    	'��y�O�a�x' ,ftNORMAL);

    RectAndText(lmRECTFILLYELLOW,tlCENTER,taCENTER,itmp2+2+20+2+20,iYY2+6*6+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

    RectAndText(lmNONE,tlCENTER,taLEFT,itmp2+2+20+2+20+2,iYY2+6*6, 20   , 4  ,		8,
    	'�����O�a�x' ,ftNORMAL);



    //�P�O�O�@�@30
    //1�������@0.3
    //�ΊD�O�a�x
    itmp3 := 0;
    itmp2 := round(JVal.SekkaiHouwaMax * 0.3);
    itmp3 := itmp3 + itmp2;
    itmp4 := iYY2 + (30 - itmp3);
    PrintCanvas.Font.Color := TColor($FFFFFF);
    RectAndText(lmRECTFILLBLUE,tlCENTER,taCENTER,iXX2 + 17,itmp4, itmp - 15, itmp2  ,		8,
    	FtoStr2(Jval.SekkaiHouwaMax,JMode_Houwa)+'%',ftNORMAL);

    PrintCanvas.Font.Color := TColor($000000);
    //��y�O�a
    itmp2 := round(JVal.KudoHouwaMax * 0.3);
    itmp3 := itmp3 + itmp2;
    itmp4 := iYY2 + (30 - itmp3);
    RectAndText(lmRECTFILLRED,tlCENTER,taCENTER,iXX2 + 17,itmp4, itmp - 15, itmp2  ,		8,
    	FtoStr2(Jval.KudoHouwaMax,JMode_Houwa)+'%',ftNORMAL);

    //�����O�a
    itmp2 := round(JVal.KariHouwaMax * 0.3);
    itmp3 := itmp3 + itmp2;
    itmp4 := iYY2 + (30 - itmp3);
    RectAndText(lmRECTFILLYELLOW,tlCENTER,taCENTER,iXX2 + 17,itmp4, itmp - 15, itmp2  ,		8,
    	FtoStr2(Jval.KariHouwaMax,JMode_Houwa)+'%',ftNORMAL);

    btmp :=  JVal.SekkaiHouwaMax + JVal.KudoHouwaMax + JVal.KariHouwaMax;

    RectAndText(lmNONE,tlCENTER,taCENTER,iXX2 + 17,itmp4-5, itmp - 15, 4  ,		8,
    	FtoStr2(btmp,JMode_Houwa)+'%',ftNORMAL);

    //���͒l
    //�ΊD�O�a�x
    itmp3 := 0;
    itmp2 := round(JVal.SekkaiHouwa * 0.3);
    itmp3 := itmp3 + itmp2;
    itmp4 := iYY2 + (30 - itmp3);
    PrintCanvas.Font.Color := TColor($FFFFFF);
    RectAndText(lmRECTFILLBLUE,tlCENTER,taCENTER,iXX2 + 17 + itmp,itmp4, itmp - 15, itmp2  ,		8,
    	FtoStr2(Jval.SekkaiHouwa,JMode_Houwa)+'%',ftNORMAL);

    PrintCanvas.Font.Color := TColor($000000);
    //��y�O�a
    itmp2 := round(JVal.KudoHouwa * 0.3);
    itmp3 := itmp3 + itmp2;
    itmp4 := iYY2 + (30 - itmp3);
    RectAndText(lmRECTFILLRED,tlCENTER,taCENTER,iXX2 + 17 + itmp,itmp4, itmp - 15, itmp2  ,		8,
    	FtoStr2(Jval.KudoHouwa,JMode_Houwa)+'%',ftNORMAL);

    //�����O�a
    itmp2 := round(JVal.KariHouwa * 0.3);
    itmp3 := itmp3 + itmp2;
    itmp4 := iYY2 + (30 - itmp3);
    RectAndText(lmRECTFILLYELLOW,tlCENTER,taCENTER,iXX2 + 17 + itmp,itmp4, itmp - 15, itmp2  ,		8,
    	FtoStr2(Jval.KariHouwa,JMode_Houwa)+'%',ftNORMAL);

    btmp :=  JVal.SekkaiHouwa + JVal.KudoHouwa + JVal.KariHouwa;

    RectAndText(lmNONE,tlCENTER,taCENTER,iXX2 + 17 + itmp,itmp4-5, itmp - 15, 4  ,		8,
    	FtoStr2(btmp,JMode_Houwa)+'%',ftNORMAL);


   //**********************************************************************************************
   //�R�����g�̈��
    CurLine := 240;

    RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine,RightEnd,5,		10,
    	'�S�D�R�����g',ftNORMAL);


    CurLine := CurLine + 5;
		MaxHeight:=24;

  	aBuff := '';
    if PrintModule1.ADOQuerySindan.RecordCount > 0 then begin

{        aBuff := JKenCmtGet(JVal);

        if JVal.tankaru > 300.0 then begin

          aBuff := aBuff + '�Y�J���́A�P��̎{�p�ʂ�300kg/10a�𒴂��Ȃ��l�ɕ����Ď{�p���ĉ������B' +#13;
        end;

        if JVal.Sakucd = '201' then begin   //�H�܂�����

          aBuff := aBuff + '���f�́A���Ƃ���4kg/10a���x��d�펞�ɁA�c����N��������c��`�����܂łɎ{�p����B' +#13;
        end;

    	aBuff := aBuff + PrintModule1.ADOQuerySindan.fieldbyname('�����y��').asString

}
    end
    else begin
    	aBuff := '';
    end;

   RectAndMemo(lmRECTFILL,0,CurLine,RightEnd,24, 9,aBuff , ftNORMAL, MaxHeight );




    //�\���v���C�}���[�L�[��Ԃ�
    KeyCode := FieldByName('����NO').asString ;

    case prmDeviceType of
    dvDISP :result := True ;	{���̃f�[�^�쐬�n�j}
    dvPRNT : begin {���̃f�[�^�L��}
      //���̃��R�[�h���邩�H
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


//���͒l�̔���

//
function Bunseki_Hantei( min: Double; max: Double; ans : Double ) : String;
var
stmp : string;
begin

  stmp := '';

  if ans > 0.0 then begin

   if max < ans then begin
      stmp := '��';  //����
   end
   else if min > ans then begin
      stmp := '��';  //�Ⴂ
   end;

  end;


   result := stmp;

end;




{ ==========================================================================
  �{��݌v�\���
	�߂�l�F
    ����̏ꍇ�FTrue ���̃f�[�^���݁Afalse :����
    ��ʂ̏ꍇ�FTrue �`��f�[�^���݁Afalse :����
}
function PrintSekkei(prmDeviceType : TDeviceType; pCondition : string; PageCnt : Integer ; var KeyCode :string  ):Boolean;
var
	Qcnt ,aCnt,MaxHeight,cnt : integer ;
  aBuff,typCEC,aCode : string ;
  Standard : TRecStandard ;
  //SehiList : TSehiHiryo ;  {�{���ʃ��X�g}
  stmp,stmp2,stmp3 : String;
  no : String;
    TheRect : TRect;
    LX, LY : Integer;  //���[�_�[�`���[�g�̈ʒu
    XX1, YY1 : Integer;
    XX, YY : Integer;
    XX2, YY2 : Integer;

  RMax : Integer;  //�p����

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
  GetLocList : array[1..6] of TPoint ;	//�O���t�`���[�g�p�p�̃s�N�Z�����W
  GetLocList2 : array[1..6] of TPoint ;	//�O���t�`���[�g�p�p�̃s�N�Z�����W

  sehiN, sehiP, sehiK : double;
  tuihi1N, tuihi1P, tuihi1K : double;
  tuihi2N, tuihi2P, tuihi2K : double;

  byouryou : double;

  i : integer;


begin
	result := False;

  RMAX := RightEnd; //220;  //B4 tate

  //����̃f�[�^�܂ňړ�
  Qcnt := 1 ;
  with PrintModule1.ADOQueryUketuke do begin



  	Close;

{
     stmp := 'SELECT T_UKETUKE.*, M_NOUKA.*, M_DOJOU.*, M_DOSEI.*,M_SAKUMOKU.��ږ� as ��ږ�,M_FUSHOKU.*,M_CITY.*'+
     ' FROM (((((((T_UKETUKE'+
     ' LEFT JOIN M_SAKUMOTU ON (T_UKETUKE.��ڃR�[�h = M_SAKUMOTU.��ڃR�[�h) AND (T_UKETUKE.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h))'+
     ' LEFT JOIN M_SAKUGATA ON (T_UKETUKE.��ڃR�[�h = M_SAKUGATA.��ڃR�[�h) AND (T_UKETUKE.�앨�R�[�h = M_SAKUGATA.�앨�R�[�h) AND (T_UKETUKE.��^�R�[�h = M_SAKUGATA.��^�R�[�h))'+
     ' LEFT JOIN M_SAKUMOKU ON T_UKETUKE.��ڃR�[�h = M_SAKUMOKU.��ڃR�[�h)'+
     ' LEFT JOIN M_DOJOU ON T_UKETUKE.�y��R�[�h = M_DOJOU.�y��R�[�h)'+
     ' LEFT JOIN M_DOSEI ON T_UKETUKE.�y���R�[�h = M_DOSEI.�y���R�[�h)'+
     ' LEFT JOIN M_FUSHOKU ON T_UKETUKE.���A�R�[�h = M_FUSHOKU.���A�R�[�h)'+
     ' LEFT JOIN M_CITY ON T_UKETUKE.�s�����R�[�h = M_CITY.�s�����R�[�h)'+
     ' LEFT JOIN M_NOUKA ON T_UKETUKE.�_�Ɣԍ� = M_NOUKA.�_�Ɣԍ�'+
     ' WHERE '+pCondition+
     ' ORDER BY T_UKETUKE.�T���v���ԍ�';

}

          stmp := 'Select T_BUNSEKI6.*,T_UKETUKE6.*,M_NOUKYOU.*,M_SISYO.*,M_SAKUMOTU.*,M_SAKUGATA.* '+
        'from (((((T_BUNSEKI6 '+
        ' LEFT JOIN T_UKETUKE6 ON T_BUNSEKI6.��tNO = T_UKETUKE6.��tNO) '+
        ' LEFT JOIN M_SAKUMOTU ON T_BUNSEKI6.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h) '+
        ' LEFT JOIN M_SAKUGATA ON (T_BUNSEKI6.�앨�R�[�h = M_SAKUGATA.�앨�R�[�h) and (T_BUNSEKI6.��^�R�[�h = M_SAKUGATA.��^�R�[�h)) '+
        ' LEFT JOIN M_NOUKYOU ON T_UKETUKE6.�g���ԍ� = M_NOUKYOU.�g���ԍ�) '+
        ' LEFT JOIN M_SISYO ON (T_UKETUKE6.�g���ԍ� = M_SISYO.�g���ԍ�) and (T_UKETUKE6.�x�X�ԍ� = M_SISYO.�x�X�ԍ�)) '+
        'where ' + pCondition +
        ' ORDER BY T_Bunseki6.����NO' ;





    SQL.Text := stmp;



   Open;
    while not eof do begin
      if Qcnt = PageCnt then break ;
      INC(QCnt);
      Next ;
    end;
    {�Y���f�[�^�L��H}
    if Eof then begin
      Close ;
      exit ;
    end;



  end;



//  Application.CreateForm(TFSehiSekkei, FSehiSekkei);






  with PrintModule1.ADOQueryUketuke do begin

  //�����t�H���g
//  PrintCanvas.Font.Name := '�l�r �o�S�V�b�N';
//  PrintCanvas.Font.Name := 'HG�ۺ޼��M-PRO';
  PrintCanvas.Font.Name := '���C���I';



    //�O���t������x����

    TheRect := Rect(HorzPos(0),VertPos(0),HorzPos(300),VertPos(450));
    PrintCanvas.Brush.Bitmap := nil;
    PrintCanvas.Brush.Color := clWhite; //clRed; //White;
    PrintCanvas.Brush.Style := bsSolid	;
    PrintCanvas.FillRect(TheRect);
    //�N���A�ɂ��Ă���
    PrintCanvas.Brush.Style := bsClear;






PrintModule1.ADOQuerySindan.close;
PrintModule1.ADOQuerySindan.SQL.Clear;
MainForm.VSample := FieldBYName('����NO').AsString;
stmp := 'select * from T_SINDAN where ����NO = "'+MainForm.VSample+'"';
PrintModule1.ADOQuerySindan.SQL.Add(stmp);


//    PrintModule1.ADOQuerySindan.Parameters.ParamByName('�T���v���ԍ�').Value := FieldByName('�T���v���ԍ�').AsString;
    PrintModule1.ADOQuerySindan.open;

    with PrintModule1.ADOQuerySindan do begin
      Close;
      SQL.Clear;
      stmp := 'select * from T_SINDAN where ����NO = "'+MainForm.VSample+'"';
      SQL.Add(stmp);

      Open();
      if RecordCount <= 0 then begin
         insert;
         edit;
         fieldbyname('����NO').AsString := MainForm.VSample;
         post;
      end;
    end;


//�y���ނ̌v�Z���Ȃ�






    //�엿�݌v�@FSkehiSekkei
{
    sakucd := FieldByName('��ڃR�[�h').asString + FieldByName('�앨�R�[�h').asString;

    if not PrintModule1.ADOQuerySindan.FieldByName('SIM�v�Z��').asBoolean then begin


      FSehiSekkei.SehiSekkei;


    end;
      FSehiSekkei.SehiSekkei2;
}






    //�e�[�u���̕ۑ��@A.Nishimura
    if PrintModule1.ADOQuerySindan.State in [dsEdit	,dsInsert] then
       PrintModule1.ADOQuerySindan.Post;





     CurLine := 0;


    RectAndText(lmNONE,tlCENTER,taCENTER,0,0,RightEnd,15,		18,
    	'�{��݌v�\',ftBOLD);



    RectAndText(lmNONE,tlCENTER,taRight,0,5,RightEnd,10,		7,
    	'JA�S�_�����@�c�_��敔�@�_�ƋZ�p�Z���^�[',ftBOLD);


      CurLine := CurLine + 12;

     //��t���
     CurLine := shindan_top(CurLine);

   //��l���T�[�`
    PrintModule1.ADOQueryKijun.Close;
    stmp := 'select * from M_SAKUMOTU where �앨�R�[�h = ''' +
    FieldByName('T_BUNSEKI6.�앨�R�[�h').asString + '''';
    PrintModule1.ADOQueryKijun.SQL.Text := stmp;
    PrintModule1.ADOQueryKijun.Open;



  CurLine := CurLine + 6;
  CurLine := CurLine + 3;


    RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine, 30   , 6  ,		10,
    	'�P�D�ڕW�{�p��' ,ftNORMAL);

  CurLine := CurLine + 6;

  takasa := 5;
  mojisize := 10;

  YY1 := CurLine;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 40   , takasa  ,	mojisize,
    	'�{�p����' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+40,CurLine, 15   , takasa  ,	mojisize,
    	'���f' ,ftNORMAL);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15,CurLine, 15   ,takasa  ,	mojisize,
    	'�����_' ,ftNORMAL);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15+15,CurLine, 15   ,takasa  ,	mojisize,
    	'����' ,ftNORMAL);

  CurLine := CurLine + takasa;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 40   ,takasa  ,	mojisize,
    	'��@�@��' ,ftNORMAL);

  btmpN := 0; btmpP := 0; btmpK := 0;

  sehiN := Fieldbyname('���N').AsFloat;

  btmpN := btmpN + sehiN;
  stmp := FtoStr(sehiN, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);


  sehiP := Fieldbyname('���P').AsFloat;
  btmpP := btmpP + sehiP;
  stmp := FtoStr(sehiP, 1);
    RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);



  btmp := Fieldbyname('���K').AsFloat;
  sehiK := btmp;
  btmpK := btmpK + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);
  CurLine := CurLine + takasa;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 40   ,takasa  ,	mojisize,
    	'�ǁ@��P' ,ftNORMAL);


  btmp := Fieldbyname('�ǔ�N').AsFloat;
  tuihi1N := btmp;
  btmpN := btmpN + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);



  btmp := Fieldbyname('�ǔ�P').AsFloat;
  tuihi1P := btmp;
  btmpP := btmpP + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);




  btmp := Fieldbyname('�ǔ�K').AsFloat;
  tuihi1K := btmp;
  btmpK := btmpK + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);
  CurLine := CurLine + takasa;



  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 40   ,takasa  ,	mojisize,
    	'�ǁ@��Q' ,ftNORMAL);

  btmp := Fieldbyname('3���N').AsFloat;
  tuihi2N := btmp;
  btmpN := btmpN + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);



  btmp := Fieldbyname('3���P').AsFloat;
  tuihi2P := btmp;
  btmpP := btmpP + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);


  btmp := Fieldbyname('3���K').AsFloat;
  tuihi2K := btmp;
  btmpK := btmpK + btmp;
  stmp := FtoStr(btmp, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);

  CurLine := CurLine + takasa;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 40   ,takasa  ,	mojisize,
    	'���@�@�v' ,ftNORMAL);


  stmp := FtoStr(btmpN, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);
  stmp := FtoStr(btmpP, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);
  stmp := FtoStr(btmpK, 1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+40+15+15,CurLine, 15   ,takasa  ,	mojisize,
    	stmp ,ftNORMAL);






  //�R�����g
   aBuff := Fieldbyname('M_SAKUGATA.���l').AsString;
   MaxHeight:=25;

   RectAndMemo(lmRECTFILL,40+15+15+15+3,YY1, 92  ,25, 6 ,aBuff , ftNORMAL, MaxHeight);



   //�엿�̑I��

   //���O�������
   //���@�P��@�y����ǁ@�@���󔒂̂���

 �@//JA�g����

   //�앨


   //
    PrintModule1.ADOQKasei.Close;
    stmp := 'select * from M_KASEI6 where (�� is null) and (�P�� is null) and (�y����� is null) and (�{��^�C�v is null)';

    stmp2 :=   Fieldbyname('T_UKETUKE6.�g���ԍ�').asString;
    case Strtoint(stmp2) of
     2: stmp3 := '����';  //�ӂ����ܖ���
     661: stmp3 := '������'; //����������
     252: stmp3 := '�݂Ȃ�'; //���݂Ȃ�
     541: stmp3 := '������'; //��Â��
     326: stmp3 := '����'; //�������炩��
    end;
    stmp := stmp + ' and (' + stmp3 + '= "��")';


    stmp2 :=   Fieldbyname('T_BUNSEKI6.�앨�R�[�h').asString;
    case Strtoint(copy(stmp2,1,1)) of
     1: stmp3 := '����';
     2: stmp3 := '����';
     3: stmp3 := '���';
     4: stmp3 := '�ʎ�';
     5: stmp3 := '�Ԃ�';
     6: stmp3 := '���̑�';
     else stmp3 := '���̑�';
    end;
    stmp := stmp + ' and (' + stmp3 + '= "��")';



    PrintModule1.ADOQKasei.SQL.Text := stmp;
    PrintModule1.ADOQKasei.open;






    //�ǔ�
    PrintModule1.ADOQKasei2.Close;
    stmp := 'select * from M_KASEI6 where (�� is null) and (�P�� is null) and (�y����� is null) and not(�{��^�C�v is null)';

    stmp2 :=   Fieldbyname('T_UKETUKE6.�g���ԍ�').asString;
    case Strtoint(stmp2) of
     2: stmp3 := '����';  //�ӂ����ܖ���
     661: stmp3 := '������'; //����������
     252: stmp3 := '�݂Ȃ�'; //���݂Ȃ�
     541: stmp3 := '������'; //��Â��
     326: stmp3 := '����'; //�������炩��
    end;
    stmp := stmp + ' and (' + stmp3 + '= "��")';


    stmp2 :=   Fieldbyname('T_BUNSEKI6.�앨�R�[�h').asString;
    case Strtoint(copy(stmp2,1,1)) of
     1: stmp3 := '����';
     2: stmp3 := '����';
     3: stmp3 := '���';
     4: stmp3 := '�ʎ�';
     5: stmp3 := '�Ԃ�';
     6: stmp3 := '���̑�';
     else stmp3 := '���̑�';
    end;
    stmp := stmp + ' and (' + stmp3 + '= "��")';



    PrintModule1.ADOQKasei2.SQL.Text := stmp;
    PrintModule1.ADOQKasei2.open;











  //  �݌v��
  CurLine := CurLine + takasa;
  CurLine := CurLine + 3;





   RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine, 30   , 6  ,		10,
    	'�Q�D�{��݌v�ć@' ,ftNORMAL);

   CurLine := CurLine + 6;
   LY := CurLine;

   RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 45   , 11  ,		8,
    	'�i�@��' ,ftNORMAL);


   RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 11  ,		8,
    	'�{���' ,ftNORMAL);


   RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7*7   , 6  ,		8,
    	'������(kg/10a)' ,ftNORMAL);


  CurLine := CurLine + 6;

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 5  ,		7,
    	'���f' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 5  ,	 6,
    	'�����_' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 5  ,		7,
    	'����' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 5  ,		7,
    	'�ΊD' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 5  ,		7,
    	'��y' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 5  ,	6,
    	'�P�C�_' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 5  ,		7,
    	'�S' ,ftNORMAL);



  LX := 0+45+15+7*7;
  LX := LX + 3;



  CurLine := CurLine + 5;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 5   , 10  ,		8,
    	'���' ,ftNORMAL);


  stmp :=  PrintModule1.ADOQKasei.Fieldbyname('�i��').asString;

  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp ,ftNORMAL);


  stmp := FtoStr(PrintModule1.ADOQKasei.Fieldbyname('N').asFloat,JMode_1);

  //�{���
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


 //����N
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



 //����P
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

 //����K
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
    	'�ǔ�' ,ftNORMAL);

  stmp :=  PrintModule1.ADOQKasei2.Fieldbyname('�i��').asString;

    RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp ,ftNORMAL);


 //�{���
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




 //����N
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



 //����P
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

 //����K
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
    	'�ǔ�' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	'' ,ftNORMAL);


  stmp := '';
  //�{���
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 10  ,		10,
    	stmp ,ftNORMAL);


  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);


 //����P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 10  ,	 7,
    	stmp ,ftNORMAL);

 //����K
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
    	'�y' ,ftNORMAL);



  stmp := FieldByname('�y����1').AsString;
  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp,ftNORMAL);



  btmp := FieldByname('�y���ޗ�1').AsFloat;
  stmp := FtoStr2(btmp, JMode_1);
  //�{���
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 6  ,		10,
    	stmp ,ftNORMAL);

  stmp := '';

  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 6 ,		7,
    	stmp ,ftNORMAL);


 //����P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 6  ,	 7,
    	stmp ,ftNORMAL);

 //����K
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

  stmp := FieldByname('�y����2').AsString;
  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp ,ftNORMAL);


  btmp := FieldByname('�y���ޗ�2').AsFloat;
  stmp := FtoStr2(btmp, JMode_1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 6  ,	 10,
    	stmp ,ftNORMAL);

  stmp := '';
  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 6 ,		7,
    	stmp ,ftNORMAL);


 //����P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 6  ,	 7,
    	stmp ,ftNORMAL);

 //����K
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
    	'���v' ,ftNORMAL);

   stmp := '';
  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);


 //����P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 6  ,	 7,
    	stmp ,ftNORMAL);

 //����K
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









 //�O���t
  CurLine := CurLine + 6;

  RectAndText(lmRECTFILLBLUE,tlCENTER,taCENTER,0,CurLine+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

  RectAndText(lmNONE,tlCENTER,taLEFT,0+2,CurLine, 20   , 4  ,		8,
    	'�ΊD�O�a�x' ,ftNORMAL);

  RectAndText(lmRECTFILLRED,tlCENTER,taCENTER,0+2+20,CurLine+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

  RectAndText(lmNONE,tlCENTER,taLEFT,0+2+20+2,CurLine, 20   , 4  ,		8,
    	'��y�O�a�x' ,ftNORMAL);

  RectAndText(lmRECTFILLYELLOW,tlCENTER,taCENTER,0+2+20+2+20,CurLine+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

  RectAndText(lmNONE,tlCENTER,taLEFT,0+2+20+2+20+2,CurLine, 20   , 4  ,		8,
    	'�����O�a�x' ,ftNORMAL);



  CurLine := CurLine + 4;





  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 19   , 6  ,		10,
    	'���P�l' ,ftNORMAL);

  for i := 0 to 9 do begin

  RectAndText(lmRECT,tlCENTER,taCENTER,0+19+9*i,CurLine, 9  , 6  ,		10,
    	'' ,ftNORMAL);

  end;

  //�_
  // 90

  CurLine := CurLine + 1;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+19,CurLine, 9*5   , 4  ,		10,
    	'---' ,ftNORMAL);


  CurLine := CurLine + 5;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 19   , 6  ,		10,
    	'���͒l' ,ftNORMAL);


  for i := 0 to 9 do begin

  RectAndText(lmRECT,tlCENTER,taCENTER,0+19+9*i,CurLine, 9  , 6  ,		10,
    	'' ,ftNORMAL);

  end;


  CurLine := CurLine + 1;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+19,CurLine, 9*7   , 4  ,		10,
    	'---' ,ftNORMAL);





  //������
  CurLine := CurLine + 5;
  btmp := 0;
  for i := 0 to 10 do begin
    btmp := i * 10;
    stmp := FtoStr2(btmp, 0);
    RectAndText(lmNONE,tlCENTER,taCENTER,0+17+9*i,CurLine, 4 , 4  ,		6,
    	stmp ,ftNORMAL);

  end;






  ///////////////////////////////////////////////////////////////////////////



  //���[�_�[�`���[�g
  RectAndText(lmRECT,tlCENTER,taCENTER,LX,LY, 67   , 79  ,		10,
    	'' ,ftNORMAL);


  YY1 := CurLine;

  //�~�O���t�̈��
    CurLocX := 144; //���SX
    CurLine := 118;   //���S

    //�~�̊p�x�͐����E���O�x���玞�v���
		CircleLine( 0, CurLocX,CurLine,CIRCLEGRFMAXSIZE );
		CircleLine( 1, CurLocX,CurLine,CIRCLEMAXSIZE );
		CircleLine( 2, CurLocX,CurLine,CIRCLEMINSIZE );
		{�O�p�_�ʒu��Ԃ����S���W�A�����A�p�x(�E����=0-360���v���)}
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,342);
		{���C���\��:��_�Ԓ����`��}

		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-5,GetLoc.Y-5,15,4,		10,
    	'�����_',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,54);


		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y,15,4,		10,
    	'�ΊD',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,126);

		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-9,GetLoc.Y,15,4,		10,
    	'��y',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,198);
		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y-5,15,4,		10,
    	'����',ftBOLD);

    //pH
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,270);
		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y-5,15,4,		10,
    	'���g',ftBOLD);

    {�e����l�̕��͒l�̈ʒu���O���t�����A�������s�N�Z���Ŋ���o��}
    PictCenter.x := HorzPos( CurLocX );
    PictCenter.y := VertPos( CurLine );
    //����l/(����l-�����l) �߂�l 0.0�`1.0
//   function GetScale( aLow, aValue, aMax : double ) : double ;

    GetLocList[1] := GetTrign(PictCenter.x, PictCenter.y ,
   		Round(GetScale(FieldByName('pH').asFloat,'pH')*HorzSize(CIRCLEGRFMAXSIZE)) ,270);

    GetLocList[2] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('�g���I�[�OP').asFloat,'�����_')*HorzSize(CIRCLEGRFMAXSIZE)) ,342);

    GetLocList[3] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('CaO').asFloat,'�ΊD')*HorzSize(CIRCLEGRFMAXSIZE)) ,54);

    GetLocList[4] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('MgO').asFloat,'��y')*HorzSize(CIRCLEGRFMAXSIZE)) ,126);

    GetLocList[5] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('K2O').asFloat,'����')*HorzSize(CIRCLEGRFMAXSIZE)) ,198);



     GetLocList2[1] := GetTrign(PictCenter.x, PictCenter.y ,
   		Round(GetScale(FieldByName('pH').asFloat+2.5,'pH')*HorzSize(CIRCLEGRFMAXSIZE)) ,270);

    GetLocList2[2] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('�g���I�[�OP').asFloat+50,'�����_')*HorzSize(CIRCLEGRFMAXSIZE)) ,342);

    GetLocList2[3] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('CaO').asFloat+120,'�ΊD')*HorzSize(CIRCLEGRFMAXSIZE)) ,54);

    GetLocList2[4] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('MgO').asFloat+10,'��y')*HorzSize(CIRCLEGRFMAXSIZE)) ,126);

    GetLocList2[5] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('K2O').asFloat+30,'����')*HorzSize(CIRCLEGRFMAXSIZE)) ,198);



    //���͒l�𒼐��Ō���
    for cnt := 1 to 4 do
     	PictSlantLine( GetLocList[cnt],GetLocList[cnt+1] );
     	PictSlantLine( GetLocList[5],GetLocList[1] );

    for cnt := 1 to 4 do
    	PictSlantLine3( GetLocList2[cnt],GetLocList2[cnt+1] );
     	PictSlantLine3( GetLocList2[5],GetLocList2[1] );










   CurLine := YY1;
   CurLine := CurLine + 6;


  ///////////////////////////////////////////////////////////////////////////////
  ///// �݌v�ĂQ�@
  ///////////////////////////////////////////////////////////////////////////////

     RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine, 30   , 6  ,		10,
    	'�R�D�{��݌v�ć@' ,ftNORMAL);

   CurLine := CurLine + 6;
   LY := CurLine;

   RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 45   , 11  ,		8,
    	'�i�@��' ,ftNORMAL);


   RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 11  ,		8,
    	'�{���' ,ftNORMAL);


   RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7*7   , 6  ,		8,
    	'������(kg/10a)' ,ftNORMAL);


  CurLine := CurLine + 6;

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 5  ,		7,
    	'���f' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 5  ,	 6,
    	'�����_' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*2,CurLine, 7   , 5  ,		7,
    	'����' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*3,CurLine, 7   , 5  ,		7,
    	'�ΊD' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*4,CurLine, 7   , 5  ,		7,
    	'��y' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*5,CurLine, 7   , 5  ,	6,
    	'�P�C�_' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7*6,CurLine, 7   , 5  ,		7,
    	'�S' ,ftNORMAL);



  LX := 0+45+15+7*7;
  LX := LX + 3;



  CurLine := CurLine + 5;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 5   , 10  ,		8,
    	'���' ,ftNORMAL);

  PrintModule1.ADOQKasei.next;

  stmp :=  PrintModule1.ADOQKasei.Fieldbyname('�i��').asString;

  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp ,ftNORMAL);


  stmp := FtoStr(PrintModule1.ADOQKasei.Fieldbyname('N').asFloat,JMode_1);

  //�{���
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


 //����N
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



 //����P
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

 //����K
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
    	'�ǔ�' ,ftNORMAL);

  stmp :=  PrintModule1.ADOQKasei2.Fieldbyname('�i��').asString;

    RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp ,ftNORMAL);


 //�{���
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




 //����N
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



 //����P
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

 //����K
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
    	'�ǔ�' ,ftNORMAL);

  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	'' ,ftNORMAL);


  stmp := '';
  //�{���
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 10  ,		10,
    	stmp ,ftNORMAL);


  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 10  ,		7,
    	stmp ,ftNORMAL);


 //����P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 10  ,	 7,
    	stmp ,ftNORMAL);

 //����K
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
    	'�y' ,ftNORMAL);



  stmp := FieldByname('�y����1').AsString;
  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp,ftNORMAL);



  btmp := FieldByname('�y���ޗ�1').AsFloat;
  stmp := FtoStr2(btmp, JMode_1);
  //�{���
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 6  ,		10,
    	stmp ,ftNORMAL);

  stmp := '';

  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 6 ,		7,
    	stmp ,ftNORMAL);


 //����P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 6  ,	 7,
    	stmp ,ftNORMAL);

 //����K
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

  stmp := FieldByname('�y����2').AsString;
  RectAndText(lmRECT,tlCENTER,taLEFT,0+5,CurLine, 40   , 6  ,		10,
    	stmp ,ftNORMAL);


  btmp := FieldByname('�y���ޗ�2').AsFloat;
  stmp := FtoStr2(btmp, JMode_1);
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45,CurLine, 15   , 6  ,	 10,
    	stmp ,ftNORMAL);

  stmp := '';
  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 6 ,		7,
    	stmp ,ftNORMAL);


 //����P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 6  ,	 7,
    	stmp ,ftNORMAL);

 //����K
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
    	'���v' ,ftNORMAL);

   stmp := '';
  //N
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15,CurLine, 7   , 6  ,		7,
    	stmp ,ftNORMAL);


 //����P
  RectAndText(lmRECT,tlCENTER,taCENTER,0+45+15+7,CurLine, 7   , 6  ,	 7,
    	stmp ,ftNORMAL);

 //����K
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









 //�O���t
  CurLine := CurLine + 6;

  RectAndText(lmRECTFILLBLUE,tlCENTER,taCENTER,0,CurLine+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

  RectAndText(lmNONE,tlCENTER,taLEFT,0+2,CurLine, 20   , 4  ,		8,
    	'�ΊD�O�a�x' ,ftNORMAL);

  RectAndText(lmRECTFILLRED,tlCENTER,taCENTER,0+2+20,CurLine+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

  RectAndText(lmNONE,tlCENTER,taLEFT,0+2+20+2,CurLine, 20   , 4  ,		8,
    	'��y�O�a�x' ,ftNORMAL);

  RectAndText(lmRECTFILLYELLOW,tlCENTER,taCENTER,0+2+20+2+20,CurLine+1, 2   , 2  ,		2,
    	'' ,ftNORMAL);

  RectAndText(lmNONE,tlCENTER,taLEFT,0+2+20+2+20+2,CurLine, 20   , 4  ,		8,
    	'�����O�a�x' ,ftNORMAL);



  CurLine := CurLine + 4;





  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 19   , 6  ,		10,
    	'���P�l' ,ftNORMAL);

  for i := 0 to 9 do begin

  RectAndText(lmRECT,tlCENTER,taCENTER,0+19+9*i,CurLine, 9  , 6  ,		10,
    	'' ,ftNORMAL);

  end;

  //�_
  // 90

  CurLine := CurLine + 1;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+19,CurLine, 9*5   , 4  ,		10,
    	'---' ,ftNORMAL);


  CurLine := CurLine + 5;

  RectAndText(lmRECT,tlCENTER,taCENTER,0,CurLine, 19   , 6  ,		10,
    	'���͒l' ,ftNORMAL);


  for i := 0 to 9 do begin

  RectAndText(lmRECT,tlCENTER,taCENTER,0+19+9*i,CurLine, 9  , 6  ,		10,
    	'' ,ftNORMAL);

  end;


  CurLine := CurLine + 1;
  RectAndText(lmRECT,tlCENTER,taCENTER,0+19,CurLine, 9*7   , 4  ,		10,
    	'---' ,ftNORMAL);





  //������
  CurLine := CurLine + 5;
  btmp := 0;
  for i := 0 to 10 do begin
    btmp := i * 10;
    stmp := FtoStr2(btmp, 0);
    RectAndText(lmNONE,tlCENTER,taCENTER,0+17+9*i,CurLine, 4 , 4  ,		6,
    	stmp ,ftNORMAL);

  end;






  ///////////////////////////////////////////////////////////////////////////



  //���[�_�[�`���[�g
  RectAndText(lmRECT,tlCENTER,taCENTER,LX,LY, 67   , 79  ,		10,
    	'' ,ftNORMAL);


  //YY1 := CurLine;

  //�~�O���t�̈��
    CurLocX := 144; //���SX
    CurLine := LY+38;   //���S

    //�~�̊p�x�͐����E���O�x���玞�v���
		CircleLine( 0, CurLocX,CurLine,CIRCLEGRFMAXSIZE );
		CircleLine( 1, CurLocX,CurLine,CIRCLEMAXSIZE );
		CircleLine( 2, CurLocX,CurLine,CIRCLEMINSIZE );
		{�O�p�_�ʒu��Ԃ����S���W�A�����A�p�x(�E����=0-360���v���)}
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,342);
		{���C���\��:��_�Ԓ����`��}

		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-5,GetLoc.Y-5,15,4,		10,
    	'�����_',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,54);


		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y,15,4,		10,
    	'�ΊD',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,126);

		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-9,GetLoc.Y,15,4,		10,
    	'��y',ftBOLD);
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,198);
		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y-5,15,4,		10,
    	'����',ftBOLD);

    //pH
    GetLoc := GetTrign(CurLocX, CurLine,CIRCLEGRFMAXSIZE+3,270);
		SlantLine(CurLocX,CurLine,GetLoc.X,GetLoc.Y);
    RectAndText(lmClear,tlCENTER,taCENTER,GetLoc.X-7,GetLoc.Y-5,15,4,		10,
    	'���g',ftBOLD);

    {�e����l�̕��͒l�̈ʒu���O���t�����A�������s�N�Z���Ŋ���o��}
    PictCenter.x := HorzPos( CurLocX );
    PictCenter.y := VertPos( CurLine );
    //����l/(����l-�����l) �߂�l 0.0�`1.0
//   function GetScale( aLow, aValue, aMax : double ) : double ;

    GetLocList[1] := GetTrign(PictCenter.x, PictCenter.y ,
   		Round(GetScale(FieldByName('pH').asFloat,'pH')*HorzSize(CIRCLEGRFMAXSIZE)) ,270);

    GetLocList[2] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('�g���I�[�OP').asFloat,'�����_')*HorzSize(CIRCLEGRFMAXSIZE)) ,342);

    GetLocList[3] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('CaO').asFloat,'�ΊD')*HorzSize(CIRCLEGRFMAXSIZE)) ,54);

    GetLocList[4] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('MgO').asFloat,'��y')*HorzSize(CIRCLEGRFMAXSIZE)) ,126);

    GetLocList[5] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('K2O').asFloat,'����')*HorzSize(CIRCLEGRFMAXSIZE)) ,198);



     GetLocList2[1] := GetTrign(PictCenter.x, PictCenter.y ,
   		Round(GetScale(FieldByName('pH').asFloat+2.5,'pH')*HorzSize(CIRCLEGRFMAXSIZE)) ,270);

    GetLocList2[2] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('�g���I�[�OP').asFloat+50,'�����_')*HorzSize(CIRCLEGRFMAXSIZE)) ,342);

    GetLocList2[3] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('CaO').asFloat+120,'�ΊD')*HorzSize(CIRCLEGRFMAXSIZE)) ,54);

    GetLocList2[4] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('MgO').asFloat+10,'��y')*HorzSize(CIRCLEGRFMAXSIZE)) ,126);

    GetLocList2[5] := GetTrign(PictCenter.x, PictCenter.y ,
    		Round(GetScale(FieldByName('K2O').asFloat+30,'����')*HorzSize(CIRCLEGRFMAXSIZE)) ,198);



    //���͒l�𒼐��Ō���
    for cnt := 1 to 4 do
     	PictSlantLine( GetLocList[cnt],GetLocList[cnt+1] );
     	PictSlantLine( GetLocList[5],GetLocList[1] );

    for cnt := 1 to 4 do
    	PictSlantLine3( GetLocList2[cnt],GetLocList2[cnt+1] );
     	PictSlantLine3( GetLocList2[5],GetLocList2[1] );


    PrintCanvas.Pen.Color := TColor($000000);

   //�R�����g�̈��
    CurLine := 246;

    RectAndText(lmNONE,tlCENTER,taLEFT,0,CurLine,RightEnd,5,		10,
    	'�S�D�R�����g',ftNORMAL);


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
    dvDISP :result := True ;	{���̃f�[�^�쐬�n�j}
    dvPRNT : begin {���̃f�[�^�L��}
      //���̃��R�[�h���邩�H
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

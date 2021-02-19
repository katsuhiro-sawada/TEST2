unit USehiSekkei;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,Db,Math;

type TSetMode = (smIns,smDel);
type THiryoType = (htYuuki,htHiryo1,htHiryo2,htHiryo3);
type TRecHiryo = record
    CD : string ;   //�엿�R�[�h
    Name  : string ; // �엿��
    N : double ;  //������(%)
    P : double ;
    K : double ;
    M : double ;
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
    //��t�ł̎w��엿
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
    function GetQuantity2( aType : THiryoType; mode : Integer):TRecHiryo;
    {�{�e�ʂ̎����Z�o�F���̎w��ςݐ����̍��v�̎c��Ōv�Z}
    function CalcValue(aType: THiryoType; aNum: integer; aSetVal: double;aCalIng: integer): double;
    {�L�@���܂܂Ȃ��������v�F�{��񐔎w��}
    function GetTotal(Kaisu: integer): TRecHiryo;    {���{�엿�P�{�엿�Q�i���{�񐔁j}
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
    {�󂫂̂���Ƃ����}
    if aryHiryo[Ord(aType),aCnt].CD = '' then begin

      with DataModule1.ADOQueryRead3 do begin  {�엿���ׂ̓o�^}
        case aType of
        htYuuki:
          if IsKazan then
            SQL.Text := 'Select �L�@������ as Name,N,K,P,0 as M from M_Yuuki where �L�@���R�[�h='''+  aCode+''''
          else
            SQL.Text := 'Select �L�@������ as Name,N_2 as N,K_2 as K,P_2 as P,0 as M from M_Yuuki where �L�@���R�[�h='''+aCode+'''';
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

  //�{�p�ʂ��폜����B

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


{�엿�����̎Z�o}
// mode
// 0�E�E�E �S�Ă̔엿���v�@1�E�E�E�E���̂�  2�E�E�E�E�ǔ�̂�
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


procedure TFSehiSekkei.Panel2Click(Sender: TObject);
begin

end;
///////////////////////////////////////////////////////////////////////////
//  �{��݌v�@
///////////////////////////////////////////////////////////////////////////
procedure TFSehiSekkei.SehiSekkei;
const
  //�{�c�@�����_�@�{��Ή�
  //M_BAI_S_P

  //�{�c�@�����@�{��Ή�
  //M_BAI_S_K
  //�{�c�@��y�@�{��Ή�
  //M_BAI_S_M
  //Sui_Sehi_Mg : array [1..2] of Integer =
  //  (1,0);



  //���|�@��y


  //�Ă񂳂��@���f�@�{��Ή�
  Hata_Sehi_N : array [1..6] of Integer =
    (24,  //1,2    �M���o���f
     20,  //3,4
     16,  //5,6
     12,  //7,8
     8,   //9,10
     8);  //11�ȏ�

  //�n�鏒 206
  Hata_Sehi_N206 : array [1..6, 1..10] of Integer =
    ((0,0,0,5,0,7,8,10,10,12),   //1,2
     (0,0,0,4,0,6,7, 8, 9,10),   //3,4
     (0,0,0,4,0,5,6, 7, 8, 9),   //5,6
     (0,0,0,4,0,5,6, 6, 7, 8),   //7,8
     (0,0,0,3,0,4,5, 6, 6, 7),   //9,10
     (0,0,0,2,0,4,4, 5, 5, 6));   //11�ȏ�

  Hata_Sehi_N205 : array [1..6, 1..11] of Integer =
    ((0,0,0,0,0,0,10,11,13,14,15),   //1,2
     (0,0,0,0,0,0, 8,10,11,12,13),   //3,4
     (0,0,0,0,0,0, 7, 8, 9,10,11),   //5,6
     (0,0,0,0,0,0, 6, 6, 7, 8, 9),   //7,8
     (0,0,0,0,0,0, 5, 6, 6, 7, 8),   //9,10
     (0,0,0,0,0,0, 4, 5, 5, 6, 7));   //11�ȏ�

  //����  ���f  ���� 480
  Hata_Sehi_N201A : array [1..6] of Integer =
    (14,  // 0-2
     11,  // -3
     9,  // -4
     6, // -5
     4, // -6
     4); // 6-

  //  ���� 480
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

  //����  �����_
  Hata_Sehi_P1 : array [1..5] of Integer =
    (150,  // 0-5
     130,  // 5-10
     100,  // 10-30
     80,  // 30-60
     50); //  60-
  //����  ����
  Hata_Sehi_K1 : array [1..6] of Integer =
    (150,  // 0-8
     130,  // 8-15
     100,  // 15-30
     60,  // 30-50
     30,   //50-70
     0); //  70-

  //����  ��y
  Hata_Sehi_M1 : array [1..4] of Integer =
    (150,  // 0-10
     130,  // 10-25
     100,  // 25-45
     0);  // 45-

  //�n�鏒  �����_
  Hata_Sehi_P2 : array [1..5] of Integer =
    (150,  // 0-5
     130,  // 5-10
     100,  // 10-30
     80,  // 30-60
     50); //  60-
  //�n�鏒  ����
  Hata_Sehi_K2 : array [1..6] of Integer =
    (130,  // 0-8
     110,  // 8-15
     100,  // 15-30
     50,  // 30-50
     20,   //50-70
     0); //  70-

  //�n�鏒  ��y
  Hata_Sehi_M2 : array [1..4] of Integer =
    (150,  // 0-10
     130,  // 10-25
     100,  // 25-45
     0);  // 45-


  //H150826
  //���̑�  �����_
  Hata_Sehi_P3 : array [1..5] of Integer =
    (150,  // 0-5
     130,  // 5-10
     100,  // 10-30
     80,  // 30-60
     50); //  60-
  //����  �����_
  Hata_Sehi_P4 : array [1..5] of Integer =
    (150,  // 0-5
     130,  // 5-10
     100,  // 10-30
     100,  // 30-60
     80); //  60-
  //�n�鏒  ����
  Hata_Sehi_K3 : array [1..6] of Integer =
    (130,  // 0-8
     110,  // 8-15
     100,  // 15-30
     50,  // 30-50
     20,   //50-70
     0); //  70-
  //����  ����
  Hata_Sehi_K4 : array [1..6] of Integer =
    (150,  // 0-8
     130,  // 8-15
     100,  // 15-30
     60,  // 30-50
     30,   //50-70
     0); //  70-

  //���̑�  ��y
  Hata_Sehi_M3 : array [1..4] of Integer =
    (150,  // 0-10
     130,  // 10-25
     100,  // 25-45
     0);  // 45-
  //����  ��y
  Hata_Sehi_M4 : array [1..4] of Integer =
    (150,  // 0-10
     130,  // 10-25
     100,  // 25-45
     0);  // 45-

  //�q���@�����_�@�{��{��
  Sou_Sehi_P : array [1..2, 1..3] of double =
    ((150,100,50), //�@�ΎR���y 30
     (150,100,50)); //  ��n�y,��n�y 10,40  70�ȏ�́A0

  //�q���@�����@�{��{��
  Sou_Sehi_K : array [1..4, 1..3] of double =
    ((125,100,75), //�@�ΎR���y 30
     (110,100,50), //  ��n�y,��n�y 10,40
     (125,100,75), //   �D�Y�y�@���q�y�@20
     (110,100,75)); //  �D�Y�y�@�q�y�@�@21

  //�q���@��y�@�{��{��
  Sou_Sehi_M : array [1..2, 1..3] of double =
    ((150,100,50), //�@�S��
     (100,100,100)); //  �_�~�[

  //�T�C���[�W�Ƃ����낱���@�����_�@�{��{��
  Sairei_Sehi_P : array [1..2, 1..5] of double =
    ((150,130,100,80,50), //�@
     (100,100,100,100,100)); //  �_�~�[

  //�T�C���[�W�Ƃ����낱���@�����@�{��{��
  Sairei_Sehi_K : array [1..2, 1..6] of double =
    ((150,130,100,60,30,0), //�@
     (100,100,100,100,100,100)); //  �_�~�[

  //�T�C���[�W�Ƃ����낱���@��y�@�{��{��
  Sairei_Sehi_M : array [1..2, 1..4] of double =
    ((150,130,100,0), //�@
     (100,100,100,100)); //  �_�~�[


var
  SakumokuCD : String;
  SakumotuCD : String;
  SakugataCD : String;
  fcode : String;  // ���A���@�R�[�h��Ɨp
  icode,icode2 : Integer;
  dcode0 : String; //�y��R�[�h
  dcode : String; // ����y��R�[�h
  dval : double;
  titaiS : String; //����n�ы敪
  Ppp : double;  //�����_
  Kkk : double;  //����
  Mgg : double;
  Nnn : double;   //���f
  ff : double; //���A
  min, max : double;  //��l�@�����@���
  dtmp,btmp : double;  //�_�~�[
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

    //�f�[�^�x�[�X�G�f�B�b�g
    if PrintModule1.ADOQuerySindan.State <> dsEdit then  PrintModule1.ADOQuerySindan.Edit();

    //////////////////////////////////////////////////////////////////
    //�{��W���l���Ƃ肠�����Z�b�g
    with PrintModule1.ADOQuerySindan do begin
      Standard := GetStandardValue(PrintModule1.ADOQueryUketuke);

      FieldByName('N�{��s����').asFloat := Standard.Motohi.N;
      FieldByName('P�{��s����').asFloat := Standard.Motohi.P;
      FieldByName('K�{��s����').asFloat := Standard.Motohi.K;
      FieldByName('Mg�{��s����').asFloat := Standard.Motohi.M;

      FieldByName('N�{��s����2').asFloat := Standard.Sehi1.N;
      FieldByName('P�{��s����2').asFloat := Standard.Sehi1.P;
      FieldByName('K�{��s����2').asFloat := Standard.Sehi1.K;

      FieldByName('N�{��s����3').asFloat := Standard.Sehi2.N;
      FieldByName('P�{��s����3').asFloat := Standard.Sehi2.P;
      FieldByName('K�{��s����3').asFloat := Standard.Sehi2.K;

      FieldByName('���{��').asFloat := Standard.Kaisu;


      SehiV := GetSehiValue( PrintModule1.ADOQueryUketuke);

    end;
    dallP := 0;
    dallMg := 0;
    dallpH := 0;
    //�J�����ނ́A�Ȃ����̂Ƃ��Čv�Z

//    with PrintModule1.QuerySindan do begin
//NISHI0513
      for i := 1 to 4 do begin
//         YY2 := YY2 + 5;
         stmp2 := '�y���ރR�[�h'+InttoStr(i);
         dcode := PrintModule1.ADOQuerySindan.FieldByName(stmp2).asString;
//         stmp := ' '+GetDokaizaiName(dcode);
//         RectAndText(lmRECT,tlCENTER,taLeft,XX1+8,YY3+YY2,65,5,11,stmp,ftNORMAL);
         stmp2 := '�y���ޗ�'+InttoStr(i);
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
         //���i
//         stmp := FtoStr( dkakaku,0 );
//         RectAndText(lmRECT,tlCENTER,taCENTER,XX1+108,YY3+YY2,29,5,11,stmp,ftNORMAL);
      end;
//    end;



    with PrintModule1.ADOQueryUketuke do begin
        //�앨�b�c
        SakumokuCD := FieldByName('��ڃR�[�h').asString;
        SakumotuCD := FieldByName('�앨�R�[�h').asString;
        SakugataCD := FieldByName('��^�R�[�h').asString;

//        code := FieldByName('���A�R�[�h').asString;
        //
        fcode := '1';

//        dcode := FieldByName('����y��R�[�h').asString;
//        dcode0 := FieldByName('���q�y��R�[�h').asString;
        dcode := Jval.DojyouCD; //('����y��R�[�h').asString;
        dcode0 := Jval.DojyouCD; //('���q�y��R�[�h').asString;

        titaiS := FieldByName('����n�ы敪').asString;


        ///////////////////////////////////////////////////////////////////////////
        ///  �앨���Ɣ���
        ///

         //����
        if SakumokuCD = '1' then begin

            //���f�̒l�́A�����ł́A�g�p���Ȃ����Z�b�g����B
            Nnn := FieldByName('����N').asFloat;
            Jval.NN := Nnn;


             //�{�c
            if SakumotuCD = '01' then begin


                //���f�̃����N��I��
                Nnn := FieldByName('����N').asFloat;
                Jval.NN := Nnn;
                dtmp := Bai_S_N( Nnn, dcode, titaiS,0 );
                PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := dtmp;

                //�����_�̃����N��I��
                Ppp := FieldByName('�u���CP').asFloat;// + dallP;
                dtmp := Bai_S_P( Ppp, dcode, fcode );
                PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat := dtmp;
//�ӎ_���݂͂Ȃ� H170601
//                TableSindan.FieldByName('P�{��s����').asFloat := 0;


                //�{�c�@����
                Kkk := FieldByName('K2O').asFloat;
                dtmp := Bai_S_K( Kkk );
                PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat := dtmp;



                //�{�c�@��y
                Mgg := FieldByName('MgO').asFloat;// + dallMg;
                dtmp := Bai_S_M( Mgg );
                PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����').asFloat := dtmp;

            end;

            //����
            if SakumotuCD = '02' then begin


                //���f�̃����N��I��
                Nnn := FieldByName('����N').asFloat;
                Jval.NN := Nnn;
                dtmp := Bai_S_N( Nnn, dcode, titaiS,1 );
                PrintModule1.ADOQuerySindan.FieldByName('N�{��s����2').asFloat := dtmp;

                dtmp := Bai_S_N( Nnn, dcode, titaiS,0 ) - 0.5;
                PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat :=
                     dtmp - PrintModule1.ADOQuerySindan.FieldByName('N�{��s����2').asFloat;

                //�����_�̃����N��I��
                Ppp := FieldByName('�u���CP').asFloat;// + dallP;
                dtmp := Bai_S_P( Ppp, dcode, fcode );
                PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat := dtmp;




                //�@����
                Kkk := FieldByName('K2O').asFloat;
                dtmp := Bai_S_K( Kkk );
                PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat := dtmp;



                //�@��y
                Mgg := FieldByName('MgO').asFloat;// + dallMg;
                dtmp := Bai_S_M( Mgg );
                PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����').asFloat := dtmp;

           end;

            //�����c
            if (SakumotuCD = '03') or (SakumotuCD = '07') then begin

                //���f�̒l�́A�����ł́A�g�p���Ȃ����Z�b�g����B
                Nnn := PrintModule1.ADOQueryUketuke.FieldByName('����N').asFloat;
                Jval.NN := Nnn;

               //���f
//                if txtNStd1.Text <> '' then begin
//                   btmp := StrToFloat(txtNStd1.Text);
//                end
//                else begin
//                   btmp := 0;
//                end;
               btmp := Standard.Motohi.N + Standard.Sehi1.N; //StrToFloat(txtNStd1.Text);

               if (dcode = '16') then begin //�O���C�y
                   if SakugataCD = '01' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.6
                   else if SakugataCD = '02' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.6
                   else if SakugataCD = '03' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.6
                   else if SakugataCD = '04' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.4
                   else if SakugataCD = '05' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.4
                   else if SakugataCD = '06' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.5
                   else
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp;
               end
               else if (Copy(dcode,1,1) = '1') or (Copy(dcode,1,1) = '3') then begin
                   if SakugataCD = '01' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.7
                   else if SakugataCD = '02' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 1.0
                   else if SakugataCD = '03' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 1.0
                   else if SakugataCD = '04' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.5
                   else if SakugataCD = '05' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.6
                   else if SakugataCD = '06' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.6
                   else
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp;
               end
               else if Copy(dcode,1,1) = '2' then begin
                   if SakugataCD = '01' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.5
                   else if SakugataCD = '02' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.5
                   else if SakugataCD = '03' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.5
                   else if SakugataCD = '04' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.3
                   else if SakugataCD = '05' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.3
                   else if SakugataCD = '06' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.4
                   else
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp;
               end
               else if Copy(dcode,1,1) = '4' then begin
                   if SakugataCD = '01' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.6
                   else if SakugataCD = '02' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.6
                   else if SakugataCD = '03' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.6
                   else if SakugataCD = '04' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.4
                   else if SakugataCD = '05' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.4
                   else if SakugataCD = '06' then
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.5
                   else
                      PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp;
               end;

               //50% 50%
               btmp := PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat;


               if (SakumotuCD = '07') then begin
               PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp;
               PrintModule1.ADOQuerySindan.FieldByName('N�{��s����2').asFloat := 0;

               end
               else begin //03
               PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := btmp * 0.5;
               PrintModule1.ADOQuerySindan.FieldByName('N�{��s����2').asFloat := btmp * 0.5;

               end;




                dtmp := 0;
                PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat := SehiV.Motohi.P; //dtmp;
                PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat := SehiV.Motohi.K; //dtmp;
                PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����').asFloat := SehiV.Motohi.M; //dtmp;



{
                //�����_�̃����N��I��
                Ppp := FieldByName('�u���CP').asFloat;// + dallP;
                dtmp := Bai_S_P( Ppp, dcode, fcode );
                PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat := dtmp;


                //�{�c�@����
                Kkk := FieldByName('K2O').asFloat;
                dtmp := Bai_S_K( Kkk );
                PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat := dtmp;


                //�{�c�@��y
                Mgg := FieldByName('MgO').asFloat;// + dallMg;
                dtmp := Bai_S_M( Mgg );
                PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����').asFloat := dtmp;

               //�����_�A�����́A�{��W���ɏ]��
//               txtPBuld1.Text := FloatToStr(StrToFloat(txtPStd1.Text) * 1.0);   //��� P
//               txtKBuld1.Text := FloatToStr(StrToFloat(txtKStd1.Text) * 1.0);   //��� K
}
            end;

{ //����y�̐f�f�@
            //���y
            if (SakumotuCD = '04') then
                Ppp := FieldByName('�g���I�[�OP').asFloat;
                btmp := PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat;

                if Ppp >= 20 then begin
                    PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat :=  btmp * 0.0;
                end
                else if Ppp >= 10 then begin
                    PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat :=  btmp * 1.0;
                end
                else begin
                    PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat :=  btmp * 1.5;
                end;



                Kkk := FieldByName('K2O').asFloat;
                btmp := PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat;
                if  Kkk >= 50 then begin
                    PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat :=  btmp * 0.0;   //��� P
                end
                else if Kkk >= 35 then begin
                    PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat :=  btmp * 0.25;   //��� P
                end
                else if Kkk >= 15 then begin
                    PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat :=  btmp * 0.5;   //��� P
                end
                else begin
                    PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat :=  btmp * 1.0;   //��� P
                end;

            end;
}

       end; // SakumokuCD = 1 ���c



          //����
       if SakumokuCD = '2' then begin

             //�H�d������  ���f
            if (SakumotuCD = '01') then begin
                  PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := SehiV.Motohi.N;


{
               Nnn := FieldByName('����N').asFloat;// + dallN;

               btmp := FieldByName('���A').asFloat;
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
               else begin  //�H���������ȊO
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

               PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := itmp;

             end;

             //�H�d������
            if (SakumotuCD = '01') or (SakumotuCD = '14') then begin


               Nnn := FieldByName('�g���I�[�OP').asFloat; // + dallP;
               //�؂�グ����
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
                btmp := PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat;
                PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat := btmp * (Hata_Sehi_P1[icode] / 100.0);

                //����
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

                btmp := PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat;
                PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat := btmp * (Hata_Sehi_K1[icode] / 100.0);


                //��y
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

                btmp := PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����').asFloat;
                PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����').asFloat := btmp * (Hata_Sehi_M1[icode] / 100.0);

}


            end

             //�哤
            else if (SakumotuCD = '08') or
               (SakumotuCD = '09') then begin

               Nnn := FieldByName('�g���I�[�OP').asFloat;// + dallP;
               //�؂�グ����
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

                PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat := dtmp;


               Nnn := FieldByName('K2O').asFloat;// + dallP;
               //�؂�グ����
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
                PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat := dtmp;


               Nnn := FieldByName('MgO').asFloat;// + dallP;
               //�؂�グ����
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
                PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����').asFloat := dtmp;






            end;




       end; //2



         if (SakumokuCD = '3') or
           (SakumokuCD = '4') or
           (SakumokuCD = '5')
         then begin
           {�{��W�����{��W���}�X�^����擾����}   //NISHI0525
//           Standard := GetSehiValue(PrintModule1.QueryUketuke);
           Standard := GetSehiValue(PrintModule1.ADOQueryUketuke);


    //���f�́A�W���ʂ��̂܂�
    //PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat := Standard.Motohi.N;



    PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat := Standard.Motohi.P;
    PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat := Standard.Motohi.K;



          //��y
          if Jval.MgO >= 45 then begin

    PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����').asFloat := 0;

          end
          else if Jval.MgO >= 25 then begin

     PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����').asFloat := Standard.Motohi.M;

          end
          else if Jval.MgO >= 10 then begin

     PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����').asFloat := Standard.Motohi.M * 1.3;

          end
          else begin

     PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����').asFloat := Standard.Motohi.M * 1.5;

          end;








    //PrintModule1.ADOQuerySindan.FieldByName('N�{��s����2').asFloat := Standard.Sehi1.N;
    PrintModule1.ADOQuerySindan.FieldByName('P�{��s����2').asFloat := Standard.Sehi1.P;
    PrintModule1.ADOQuerySindan.FieldByName('K�{��s����2').asFloat := Standard.Sehi1.K;

    //PrintModule1.ADOQuerySindan.FieldByName('N�{��s����3').asFloat := Standard.Sehi2.N;
    PrintModule1.ADOQuerySindan.FieldByName('P�{��s����3').asFloat := Standard.Sehi2.P;
    PrintModule1.ADOQuerySindan.FieldByName('K�{��s����3').asFloat := Standard.Sehi2.K;

    PrintModule1.ADOQuerySindan.FieldByName('���{��').asFloat := Standard.Kaisu;
      end;





    end;


    if PrintModule1.ADOQuerySindan.State = dsEdit then  PrintModule1.ADOQuerySindan.Post();



end;



///////////////////////////////////////////////////////////////////////////
procedure TFSehiSekkei.SehiSekkei2;
//�{��݌v �엿�݌v
// �����_,�����̋��e�͈́@�@�R�O��

// �����䗦�̂Ƃ��́A�P��������B


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


hcount : Integer; //�엿�I���J�E���g
count,count2 : Integer;
aCode : String;

itmp, itmp2 : Integer;

tuihi1 : String;  //�ǔ�엿
tuihi2 : String;  //�ǔ�엿



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

  SehiList := TSehiHiryo.Create ;  {�{���ʃ��X�g}


   JMode_Eko := false;

    //�엿�폜
//    for aCnt := 1 to 5 do begin
//        SehiList.DelHiryo(htYuuki,aCnt);
//        SehiList.DelHiryo(htHiryo1,aCnt);
//        SehiList.DelHiryo(htHiryo2,aCnt);
//        SehiList.DelHiryo(htHiryo3,aCnt);
//    end;

    SehiList.Clear;

    for aCnt := 1 to 5 do begin
      if PrintModule1.ADOQuerySindan.State <> dsEdit then PrintModule1.ADOQuerySindan.Edit;
      PrintModule1.ADOQuerySindan.FieldByName('�L�@'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('�L�@��'+InttoStr(aCnt)).asFloat := 0;

      PrintModule1.ADOQuerySindan.FieldByName('���'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('����'+InttoStr(aCnt)).asFloat := 0;

      PrintModule1.ADOQuerySindan.FieldByName('���{1'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('���{1��'+InttoStr(aCnt)).asFloat := 0;
      PrintModule1.ADOQuerySindan.FieldByName('���{2'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('���{2��'+InttoStr(aCnt)).asFloat := 0;

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
    // �������X�g��o�^

    cd1 := PrintModule1.ADOQueryUketuke.FieldByName('��ڃR�[�h').asString;
    cd2 := PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h').asString;
    cd3 := PrintModule1.ADOQueryUketuke.FieldByName('��^�R�[�h').asString;


    with DataModule1.ADOQSakuhi do begin
      Close;
      SQL.Clear;
      stmp := 'select * from M_SAKHI where ��ڃR�[�h = "'+cd1+'" and �앨�R�[�h = "'+cd2+'" and ��^�R�[�h = "'+cd3+'"';
      SQL.Add(stmp);
      open;
      aCnt := 0;
      for i := 1 to 10 do begin
//      while EOF do begin
//        aCnt := aCnt + 1;
        stmp := FieldByName('����'+inttoStr(i)).asString + GetHiryoName(FieldByName('����'+inttoStr(i)).asString);
        if stmp <> '' then
            ListKasei.Items.Add(stmp);
        Next;
      end;
      close;
    end;


    ListTanpi.Items.Clear;



    //�엿�̕ۑ�
    //�앨����엿�������@�i��쒂�f�j

    //Copy2_3;

      orgN := PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat; //txtNSet1.Value;
      orgP := PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat; //txtNSet1.Value;
      orgK := PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat; //txtNSet1.Value;
      orgM := PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����').asFloat; //txtNSet1.Value;

      orgN2 := PrintModule1.ADOQuerySindan.FieldByName('N�{��s����2').asFloat; //txtNSet1.Value;
      orgP2 := PrintModule1.ADOQuerySindan.FieldByName('P�{��s����2').asFloat; //txtNSet1.Value;
      orgK2 := PrintModule1.ADOQuerySindan.FieldByName('K�{��s����2').asFloat; //txtNSet1.Value;
      orgM2 := 0; //PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����2').asFloat; //txtNSet1.Value;

      orgN3 := PrintModule1.ADOQuerySindan.FieldByName('N�{��s����3').asFloat; //txtNSet1.Value;
      orgP3 := PrintModule1.ADOQuerySindan.FieldByName('P�{��s����3').asFloat; //txtNSet1.Value;
      orgK3 := PrintModule1.ADOQuerySindan.FieldByName('K�{��s����3').asFloat; //txtNSet1.Value;
      orgM3 := 0; //PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����2').asFloat; //txtNSet1.Value;

{
      if PrintModule1.ADOQueryUketuke.FieldByName('��ڃR�[�h' ).asString = '6' then begin
        //�`���V�[ 602 60401 60402 60403   2:1      //NISHI0526 ��^���݂Ă���
        if (QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '02') or
           ((QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '04') and
            ((QueryUketuke.FieldByName('��^�R�[�h' ).asString = '01') or
             (QueryUketuke.FieldByName('��^�R�[�h' ).asString = '02') or
             (QueryUketuke.FieldByName('��^�R�[�h' ).asString = '03')
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
        //�I�[�V���[�h 603 60403 60404 60405   1:1:1
        else if (QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '03') or
                (QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '05') or
           ((QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '04') and
            ((QueryUketuke.FieldByName('��^�R�[�h' ).asString = '04') or
             (QueryUketuke.FieldByName('��^�R�[�h' ).asString = '05') or
             (QueryUketuke.FieldByName('��^�R�[�h' ).asString = '06')
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


      //���ʗv�f

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


    //�I��엿�̒�����K�؂Ȃ��̂�I��
    if ListKasei.Items.Count > 0 then begin

        //

          //�엿�̔䗦
        ooo[0] := '';
        hcount := 1;
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //�ǔ�엿�́A��΂�






             if ((cd1 = '1') and (cd2 = '02'))
                 or ((cd1 = '1') and (cd2 = '03')) then begin
                   if (orgN+orgN2) < 3.5 then begin

                     //����p�݂̂�I��
                     if GetHiryoT(hhh) = false then continue;

                   end
                   else begin

                     if GetHiryoT(hhh) = true then continue;

                   end;

             end
             else begin

               if GetHiryoT(hhh) = true then continue;

             end;


             //H171220 �G�R�E�����O�́A�I�����Ȃ�
             if (hhh = '1187') or           //�G�R�E�����O���I��엿�ɂ������ꍇ
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


             //�����I������B
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



        //��������ꍇ�́A�P���őI���B
       //�o�ł��킹��
        hhh := '';
        hiritu3P := 999;
        count := 1;
        if hCount = 1 then begin
            ooo2[0] := ooo[0];
        end
        else if hCount > 1 then begin
          for i := 0 to hCount - 1  do begin

             //p�ł��킹���Ƃ��̃����_�ʂ����߂�

             //GetSehi( ooo[i],orgN, tmpN, tmpP, tmpK, tmpM);
             tmpN := GetHiryoN(ooo[i]);
             tmpP := GetHiryoP(ooo[i]);

             //P�����������ꍇ�́A�Ȃ�
 //            if orgP < tmpP then continue;


             hiritu2N := 1;
             hiritu2P := tmpP / tmpN;

             //�����I������B
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

        //P�ł��킹�Ă���������ꍇ�́A�P���̒Ⴂ��  H171220
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
//H170110 �������Ȃ��ꍇ


             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);
         //NISHI0527 ����������
          tmpN2 := 0;
          tmpP2 := 0;
          tmpK2 := 0;
          if tmpN <> 0 then
            tmpN2 := orgN / tmpN;
          if tmpP <> 0 then
            tmpP2 := orgP / tmpP;
          if tmpK <> 0 then
            tmpK2 := orgK / tmpK;



    //�엿�̃Z�b�g
//    hhh := '1001';
//        PageHiryoSource.ActivePageIndex := 1;
//        PageHiryoDest.ActivePageIndex := 1;
         //�ǂ�ł��킹��傫���Ȃ�ꍇ
         if (tmpN2 <= tmpP2) and (tmpN2 <= tmpK2 ) then  begin
             //grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
             SetHiryoList2(smIns,htHiryo1,0,hhh,orgN,1,0);
             // then DspHiryoList(htHiryo1);
         end
         else if (tmpP2 <= tmpN2) and (tmpP2 <= tmpK2 ) then  begin
             //grKasei.ItemIndex := 1; //0���f�@1�����_ �@2����
             //if SetHiryoList2(smIns,htHiryo1,0,hhh,orgP) then DspHiryoList(htHiryo1);
             SetHiryoList2(smIns,htHiryo1,0,hhh,orgP,1,1);

         end
         else begin
         //if (orgK <= orgN) and (orgK <= orgP ) then
            // grKasei.ItemIndex := 2; //0���f�@1�����_ �@2����
             SetHiryoList2(smIns,htHiryo1,0,hhh,orgK,1,2); // then DspHiryoList(htHiryo1);
         end;

    end;

 //ZZZZZZZZZZZZ

     //�P�엿

     //PageHiryoSource.ActivePageIndex := 2;
     //grTanpi.ItemIndex := 0; //���f
//     hhh := Copy(ListTanpi.Items[0],1,2);
     hhh := '10'; //����
     SetHiryoList2(smIns,htHiryo1,0,hhh,orgN,2,0); // then DspHiryoList(htHiryo1);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);

     //grTanpi.ItemIndex := 1; //�����_
     //�엿�̒�����P���I�� H171216  //
{
     if QueryUketuke.FieldByName('��ڃR�[�h' ).asString = '2' then begin
        //�t����A�n�����^�J
        if ( QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '12')
        or ( QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '13')
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
//     grTanpi.ItemIndex := 2; //����
//     hhh := Copy(ListTanpi.Items[1],1,2);
     hhh := '30'; //
     SetHiryoList2(smIns,htHiryo1,0,hhh,orgK,2,2);
     // then DspHiryoList(htHiryo1);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);



     tuihi1 := '';
     tuihi2 := '';


//�ǔ�́A�m�ō��킹��B
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




       //�I��엿�̒�����K�؂Ȃ��̂�I��
       if ListKasei.Items.Count > 0 then begin

        //

          //�엿�̔䗦
           ooo[0] := '';
           hcount := 1;

           haba1 := 99999999;
           hhh_0 := '';


           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //�ǔ�엿�ȊO�́A��΂�
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


             //�����I������B
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
//           grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����

//           hhh := ooo[0];
           hhh := hhh_0;

           if hhh = '' then hhh := '1320';  //����
           tuihi1 := hhh;



           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2,1,0);
           // then DspHiryoList(htHiryo1);
//        if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);

        //�I�[�`���[�h�̏ꍇ�́A�P���ǉ� �����̂�

        if PrintModule1.ADOQueryUketuke.FieldByName('��ڃR�[�h' ).asString = '6' then begin
//           if (QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '03') or
//              (QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '03') then begin

//              PageHiryoSource.ActivePageIndex := 2;
//              grTanpi.ItemIndex := 2; //����
              hhh := '30'; //����
              SetHiryoList2(smIns,htHiryo1,0,hhh,orgK+orgK2,2,2);
              // then DspHiryoList(htHiryo1);


//           end;
        end;


        end;
     end
     else if (orgN2 > 0) and (orgK2 <= 0 ) then begin  //�P��@�@����

//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
           hhh := '1320';   //�ǔ�p�����@�@�@10 ����
           tuihi1 := hhh;
           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2,1,0);
           // then DspHiryoList(htHiryo1);

     end
     else if (orgN2 <= 0) and (orgK2 > 0 ) then begin  //�P��@�@����

              //PageHiryoSource.ActivePageIndex := 2;
              //grTanpi.ItemIndex := 2; //����
//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 2; //0���f�@1�����_ �@2����
              hhh := '1400'; //hhh := '30'; //����
              tuihi1 := hhh;
              SetHiryoList2(smIns,htHiryo1,0,hhh,orgK+orgK2,2,2);
              // then DspHiryoList(htHiryo1);

     end;





{ //�ǔ�Q�͂����Ȃ�
     //�ǔ�Q
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


       //�I��엿�̒�����K�؂Ȃ��̂�I��
       if ListKasei.Items.Count > 0 then begin

        //

          //�엿�̔䗦
           ooo[0] := '';
           hcount := 1;
           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //�ǔ�엿�ȊO�́A��΂�
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


             //�����I������B
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
//           grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2+orgN3,1,0);
           // then DspHiryoList(htHiryo1);
//        if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);

//      txtNSet1.Value := btmp;

        end;
     end
     else if (orgN3 > 0) and (orgK3 <= 0 ) then begin  //�P��@�@����

//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
           hhh := '1320';   //�ǔ�p�����@�@�@10 ����
           tuihi1 := hhh;
           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2+orgN3,1,0);
           // then DspHiryoList(htHiryo1);

     end
     else if (orgN3 <= 0) and (orgK3 > 0 ) then begin  //�P��@�@����

//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 2; //0���f�@1�����_ �@2����
              hhh := '1400'; //hhh := '30'; //����
//              PageHiryoSource.ActivePageIndex := 2;
//              grTanpi.ItemIndex := 2; //����
//              hhh := '30'; //����
           tuihi1 := hhh;
              SetHiryoList2(smIns,htHiryo1,0,hhh,orgK+orgK2+orgK3,1,2);
              // then DspHiryoList(htHiryo1);

     end;
}

    //�엿�̕ۑ�
    for aCnt := 1 to 5 do begin

        PrintModule1.ADOQuerySindan.Edit;
        stmp := '���'+Inttostr(aCnt);
        SetHiryoField (PrintModule1.ADOQuerySindan,'���',aCnt,SehiList.GetHiryo(htHiryo1,aCnt)) ;

/////        PrintModule1.ADOQuerySindan.FiledByName(stmp).asString := SehiList.GetHiryo(htHiryo1,aCnt);


    end;




   /////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////////////////////////////////////////////////////////////
    //�݌v�Q  ���z����Ԉ�������
        //�I��엿�̒�����K�؂Ȃ��̂�I��
    //PageHiryoSource.ActivePageIndex := 1;
    //PageHiryoDest.ActivePageIndex := 2;

    if ListKasei.Items.Count > 0 then begin



        hhh := '';
        tanka1 := 1000000;
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh2 := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh2 );
             if (name = '') or (name = ' ') then continue;

             //�ǔ�엿�ȊO�́A��΂�

             if ((cd1 = '1') and (cd2 = '02'))
                 or ((cd1 = '1') and (cd2 = '03')) then begin
                   if (orgN+orgN2) < 3.5 then begin

                     //����p�݂̂�I��
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

               if tmpN2 > 0 then begin  //�P�������m�łȂ��ׂɁ@�{�p�ʂ̏��Ȃ��̂�
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


        //grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
        SetHiryoList2(smIns,htHiryo2,0,hhh,orgN,1,0);


     end;

{
     hhh := '10'; //����
     SetHiryoList2(smIns,htHiryo2,0,hhh,orgN,2,0);

     //grTanpi.ItemIndex := 1; //�����_
     if PrintModule1.ADOQueryUketuke.FieldByName('��ڃR�[�h' ).asString = '2' then begin
        //�t����A�n�����^�J
        if ( PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h' ).asString = '12')
        or ( PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h' ).asString = '13')
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
     //grTanpi.ItemIndex := 2; //����
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

             //�ǔ�̂�
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

        if hhh = '' then hhh := '1320'; //����



        //grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
        SetHiryoList2(smIns,htHiryo2,0,hhh,orgN+orgN2,1,0);


      end;





    //�엿�̕ۑ�
    for aCnt := 1 to 5 do begin

        PrintModule1.ADOQuerySindan.Edit;
        SetHiryoField (PrintModule1.ADOQuerySindan,'���{1',aCnt,SehiList.GetHiryo(htHiryo2,aCnt)) ;
    end;




   ////////////////////////////////////////////////////////////////////////////////
    //�݌v3
    ////
    ///
        //�I��엿�̒�����K�؂Ȃ��̂�I��
    //PageHiryoSource.ActivePageIndex := 1;
    //PageHiryoDest.ActivePageIndex := 3;



    //�t���������̏ꍇ�́A�݌v�R�́A�o�͂��Ȃ�
//    if not ((PrintModule1.ADOQueryUketuke.FieldByName('��ڃR�[�h' ).asString = '2') and
//           ((PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h' ).asString = '12') or
//            (PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h' ).asString = '13'))) then begin




    if ListKasei.Items.Count > 0 then begin

         //�엿�̔䗦
        hhh := '';
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //�ǔ�엿�ȊO�́A��΂�
             if GetHiryoT(hhh) = true then continue;

             break;
        end;




        if( hhh <> '' ) and ( hhh <> ' ') then begin
           //grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN,1,0); // then DspHiryoList(htHiryo3);
        end
        else begin
          //�I������ǔ삪�Ȃ�
           hhh := '10';
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN,1,0); // then DspHiryoList(htHiryo3);
        end;






        hhh := '';
//       if txtNSet2.Value > 0 then begin

        //�ǔ�
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh2 := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //�ǔ�엿�ȊO�́A��΂�
             if GetHiryoT(hhh) <> true then continue;

             hhh := hhh2;
             break;
        end;

//        hhh := tuihi1;

        if( hhh <> '' ) and ( hhh <> ' ') then begin
           //PageHiryoSource.ActivePageIndex := 1;
           //PageHiryoDest.ActivePageIndex := 2;
           //grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2,1,0);// then DspHiryoList(htHiryo3);
        end
        else begin
          //�I������ǔ삪�Ȃ�
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

             //�ǔ�엿�ȊO�́A��΂�
             if GetHiryoT(hhh) <> true then continue;

             break;
        end;

//        hhh := tuihi2;

        if( hhh <> '' ) and ( hhh <> ' ') then begin
           //PageHiryoSource.ActivePageIndex := 1;
           //PageHiryoDest.ActivePageIndex := 2;
           //grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2+orgN3,1,0);// then DspHiryoList(htHiryo3);
        end;
//       end;


       //�ǔ�
         hhh := '';

       if orgN2 > 0 then begin
{
           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //�ǔ�엿�ȊO�́A��΂�
             if GetHiryoT(hhh) <> true then continue;

             break;
           end;
}
           //�I�����Ȃ��Ő݌v�P�őI�΂ꂽ�ǔ�����̂܂܎g�p
           hhh := tuihi1;

           if( hhh <> '' ) and ( hhh <> ' ') then begin
//              PageHiryoSource.ActivePageIndex := 1;
//              PageHiryoDest.ActivePageIndex := 2;
//              grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
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

             //�ǔ�엿�ȊO�́A��΂�
             if GetHiryoT(hhh) <> true then continue;

             break;
           end;
}
           hhh := tuihi2;

           if( hhh <> '' ) and ( hhh <> ' ') then begin
//              PageHiryoSource.ActivePageIndex := 1;
//              PageHiryoDest.ActivePageIndex := 2;
//              grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
              SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2+orgN3,1,0); // then DspHiryoList(htHiryo2);
           end;
        end;


    end;//ListKasei.Items.Count


//    end; //�t���������̏ꍇ�́A�݌v�R�́A�o�͂��Ȃ�

    //�엿�̕ۑ�
    for aCnt := 1 to 5 do begin

        PrintModule1.ADOQuerySindan.Edit;
        SetHiryoField (PrintModule1.ADOQuerySindan,'���{2',aCnt,SehiList.GetHiryo(htHiryo3,aCnt)) ;
    end;





end;

///////////////////////////////////////////////////////////////////////////
procedure TFSehiSekkei.SehiSekkei2_soku;
//�{��݌v �엿�݌v
// �����_,�����̋��e�͈́@�@�R�O��

// �����䗦�̂Ƃ��́A�P��������B


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


hcount : Integer; //�엿�I���J�E���g
count,count2 : Integer;
aCode : String;

itmp, itmp2 : Integer;

tuihi1 : String;  //�ǔ�엿
tuihi2 : String;  //�ǔ�엿



cd1, cd2, cd3 : String;

hhh_0 : String;
haba2 : double;
haba1 : double;
tmpV : double;

sokujyou_hhh : String; //����엿



begin

   for i := 0 to 128 do begin
       ooo[i] := '';
       ooo2[i] := '';

   end;

  SehiList := TSehiHiryo.Create ;  {�{���ʃ��X�g}


   JMode_Eko := false;

    //�엿�폜
//    for aCnt := 1 to 5 do begin
//        SehiList.DelHiryo(htYuuki,aCnt);
//        SehiList.DelHiryo(htHiryo1,aCnt);
//        SehiList.DelHiryo(htHiryo2,aCnt);
//        SehiList.DelHiryo(htHiryo3,aCnt);
//    end;

    SehiList.Clear;

    for aCnt := 1 to 5 do begin
      if PrintModule1.ADOQuerySindan.State <> dsEdit then PrintModule1.ADOQuerySindan.Edit;
      PrintModule1.ADOQuerySindan.FieldByName('�L�@'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('�L�@��'+InttoStr(aCnt)).asFloat := 0;

      PrintModule1.ADOQuerySindan.FieldByName('���'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('����'+InttoStr(aCnt)).asFloat := 0;

      PrintModule1.ADOQuerySindan.FieldByName('���{1'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('���{1��'+InttoStr(aCnt)).asFloat := 0;
      PrintModule1.ADOQuerySindan.FieldByName('���{2'+InttoStr(aCnt)).asString := '';
      PrintModule1.ADOQuerySindan.FieldByName('���{2��'+InttoStr(aCnt)).asFloat := 0;

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
    // �������X�g��o�^

    cd1 := PrintModule1.ADOQueryUketuke.FieldByName('��ڃR�[�h').asString;
    cd2 := PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h').asString;
    cd3 := PrintModule1.ADOQueryUketuke.FieldByName('��^�R�[�h').asString;


    with DataModule1.ADOQSakuhi do begin
      Close;
      SQL.Clear;
      stmp := 'select * from M_SAKHI where ��ڃR�[�h = "'+cd1+'" and �앨�R�[�h = "'+cd2+'" and ��^�R�[�h = "'+cd3+'"';
      SQL.Add(stmp);
      open;
      aCnt := 0;
      for i := 1 to 10 do begin
//      while EOF do begin
//        aCnt := aCnt + 1;
        stmp := FieldByName('����'+inttoStr(i)).asString + GetHiryoName(FieldByName('����'+inttoStr(i)).asString);
        if stmp <> '' then
            ListKasei.Items.Add(stmp);
        Next;
      end;
      close;
    end;


    ListTanpi.Items.Clear;



    //�엿�̕ۑ�
    //�앨����엿�������@�i��쒂�f�j

    //Copy2_3;

      orgN := PrintModule1.ADOQuerySindan.FieldByName('N�{��s����').asFloat; //txtNSet1.Value;
      orgP := PrintModule1.ADOQuerySindan.FieldByName('P�{��s����').asFloat; //txtNSet1.Value;
      orgK := PrintModule1.ADOQuerySindan.FieldByName('K�{��s����').asFloat; //txtNSet1.Value;
      orgM := PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����').asFloat; //txtNSet1.Value;

      orgN2 := PrintModule1.ADOQuerySindan.FieldByName('N�{��s����2').asFloat; //txtNSet1.Value;
      orgP2 := PrintModule1.ADOQuerySindan.FieldByName('P�{��s����2').asFloat; //txtNSet1.Value;
      orgK2 := PrintModule1.ADOQuerySindan.FieldByName('K�{��s����2').asFloat; //txtNSet1.Value;
      orgM2 := 0; //PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����2').asFloat; //txtNSet1.Value;

      orgN3 := PrintModule1.ADOQuerySindan.FieldByName('N�{��s����3').asFloat; //txtNSet1.Value;
      orgP3 := PrintModule1.ADOQuerySindan.FieldByName('P�{��s����3').asFloat; //txtNSet1.Value;
      orgK3 := PrintModule1.ADOQuerySindan.FieldByName('K�{��s����3').asFloat; //txtNSet1.Value;
      orgM3 := 0; //PrintModule1.ADOQuerySindan.FieldByName('Mg�{��s����2').asFloat; //txtNSet1.Value;

{
      if PrintModule1.ADOQueryUketuke.FieldByName('��ڃR�[�h' ).asString = '6' then begin
        //�`���V�[ 602 60401 60402 60403   2:1      //NISHI0526 ��^���݂Ă���
        if (QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '02') or
           ((QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '04') and
            ((QueryUketuke.FieldByName('��^�R�[�h' ).asString = '01') or
             (QueryUketuke.FieldByName('��^�R�[�h' ).asString = '02') or
             (QueryUketuke.FieldByName('��^�R�[�h' ).asString = '03')
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
        //�I�[�V���[�h 603 60403 60404 60405   1:1:1
        else if (QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '03') or
                (QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '05') or
           ((QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '04') and
            ((QueryUketuke.FieldByName('��^�R�[�h' ).asString = '04') or
             (QueryUketuke.FieldByName('��^�R�[�h' ).asString = '05') or
             (QueryUketuke.FieldByName('��^�R�[�h' ).asString = '06')
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
//�ŏ��ɑ���p�̔엿�����߂�B
      //���ʗv�f

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


    //�I��엿�̒�����K�؂Ȃ��̂�I��
 if ListKasei.Items.Count > 0 then begin

        //

          //�엿�̔䗦
        ooo[0] := '';
        hcount := 1;
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //�ǔ�엿�̂݁@
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


             //�����I������B
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



        //��������ꍇ�́A�P���őI���B
       //�o�ł��킹��
        hhh := '';
        hiritu3P := 999;
        count := 1;
        if hCount = 1 then begin
            ooo2[0] := ooo[0];
        end
        else if hCount > 1 then begin
          for i := 0 to hCount - 1  do begin

             //p�ł��킹���Ƃ��̃����_�ʂ����߂�

             //GetSehi( ooo[i],orgN, tmpN, tmpP, tmpK, tmpM);
             tmpN := GetHiryoN(ooo[i]);
             tmpP := GetHiryoP(ooo[i]);

             //P�����������ꍇ�́A�Ȃ�
 //            if orgP < tmpP then continue;


             hiritu2N := 1;
             hiritu2P := tmpP / tmpN;

             //�����I������B
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

        //P�ł��킹�Ă���������ꍇ�́A�P���̒Ⴂ��  H171220
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
//H170110 �������Ȃ��ꍇ


             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);






  end;


  if hhh = '' then exit;    //H170802

  sokujyou_hhh := hhh; //����엿������

             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);

        //tmpV  orgN2 �Ł@�e�ʂ����߂�

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

      //���ʗv�f

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


    //�I��엿�̒�����K�؂Ȃ��̂�I��
    if ListKasei.Items.Count > 0 then begin

        //

          //�엿�̔䗦
        ooo[0] := '';
        hcount := 1;
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //�ǔ�엿�́A��΂�
             if GetHiryoT(hhh) = true then continue;
             //H171220 �G�R�E�����O�́A�I�����Ȃ�
             if (hhh = '1187') or           //�G�R�E�����O���I��엿�ɂ������ꍇ
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


             //�����I������B
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



        //��������ꍇ�́A�P���őI���B
       //�o�ł��킹��
        hhh := '';
        hiritu3P := 999;
        count := 1;
        if hCount = 1 then begin
            ooo2[0] := ooo[0];
        end
        else if hCount > 1 then begin
          for i := 0 to hCount - 1  do begin

             //p�ł��킹���Ƃ��̃����_�ʂ����߂�

             //GetSehi( ooo[i],orgN, tmpN, tmpP, tmpK, tmpM);
             tmpN := GetHiryoN(ooo[i]);
             tmpP := GetHiryoP(ooo[i]);

             //P�����������ꍇ�́A�Ȃ�
 //            if orgP < tmpP then continue;


             hiritu2N := 1;
             hiritu2P := tmpP / tmpN;

             //�����I������B
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

        //P�ł��킹�Ă���������ꍇ�́A�P���̒Ⴂ��  H171220
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
//H170110 �������Ȃ��ꍇ


             tmpN := GetHiryoN(hhh);
             tmpP := GetHiryoP(hhh);
             tmpK := GetHiryoK(hhh);
             tmpM := GetHiryoM(hhh);
         //NISHI0527 ����������
          tmpN2 := 0;
          tmpP2 := 0;
          tmpK2 := 0;
          if tmpN <> 0 then
            tmpN2 := orgN / tmpN;
          if tmpP <> 0 then
            tmpP2 := orgP / tmpP;
          if tmpK <> 0 then
            tmpK2 := orgK / tmpK;



    //�엿�̃Z�b�g
//    hhh := '1001';
//        PageHiryoSource.ActivePageIndex := 1;
//        PageHiryoDest.ActivePageIndex := 1;
         //�ǂ�ł��킹��傫���Ȃ�ꍇ
         if (tmpN2 <= tmpP2) and (tmpN2 <= tmpK2 ) then  begin
             //grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
             SetHiryoList2(smIns,htHiryo1,0,hhh,orgN,1,0);
             // then DspHiryoList(htHiryo1);
         end
         else if (tmpP2 <= tmpN2) and (tmpP2 <= tmpK2 ) then  begin
             //grKasei.ItemIndex := 1; //0���f�@1�����_ �@2����
             //if SetHiryoList2(smIns,htHiryo1,0,hhh,orgP) then DspHiryoList(htHiryo1);
             SetHiryoList2(smIns,htHiryo1,0,hhh,orgP,1,1);

         end
         else begin
         //if (orgK <= orgN) and (orgK <= orgP ) then
            // grKasei.ItemIndex := 2; //0���f�@1�����_ �@2����
             SetHiryoList2(smIns,htHiryo1,0,hhh,orgK,1,2); // then DspHiryoList(htHiryo1);
         end;

    end;

 //ZZZZZZZZZZZZ

     //�P�엿

     //PageHiryoSource.ActivePageIndex := 2;
     //grTanpi.ItemIndex := 0; //���f
//     hhh := Copy(ListTanpi.Items[0],1,2);
     hhh := '10'; //����
     SetHiryoList2(smIns,htHiryo1,0,hhh,orgN,2,0); // then DspHiryoList(htHiryo1);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);

     //grTanpi.ItemIndex := 1; //�����_
     //�엿�̒�����P���I�� H171216  //
{
     if QueryUketuke.FieldByName('��ڃR�[�h' ).asString = '2' then begin
        //�t����A�n�����^�J
        if ( QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '12')
        or ( QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '13')
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
//     grTanpi.ItemIndex := 2; //����
//     hhh := Copy(ListTanpi.Items[1],1,2);
     hhh := '30'; //
     SetHiryoList2(smIns,htHiryo1,0,hhh,orgK,2,2);
     // then DspHiryoList(htHiryo1);
//     if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);



     tuihi1 := '';
     tuihi2 := '';


//�ǔ�́A�m�ō��킹��B
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




       //�I��엿�̒�����K�؂Ȃ��̂�I��
       if ListKasei.Items.Count > 0 then begin

        //

          //�엿�̔䗦
           ooo[0] := '';
           hcount := 1;

           haba1 := 99999999;
           hhh_0 := '';


           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //�ǔ�엿�ȊO�́A��΂�
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


             //�����I������B
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
//           grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����

//           hhh := ooo[0];
           hhh := hhh_0;

           if hhh = '' then hhh := '1320';  //����
           tuihi1 := hhh;



           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2,1,0);
           // then DspHiryoList(htHiryo1);
//        if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);

        //�I�[�`���[�h�̏ꍇ�́A�P���ǉ� �����̂�

        if PrintModule1.ADOQueryUketuke.FieldByName('��ڃR�[�h' ).asString = '6' then begin
//           if (QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '03') or
//              (QueryUketuke.FieldByName('�앨�R�[�h' ).asString = '03') then begin

//              PageHiryoSource.ActivePageIndex := 2;
//              grTanpi.ItemIndex := 2; //����
              hhh := '30'; //����
              SetHiryoList2(smIns,htHiryo1,0,hhh,orgK+orgK2,2,2);
              // then DspHiryoList(htHiryo1);


//           end;
        end;


        end;
     end
     else if (orgN2 > 0) and (orgK2 <= 0 ) then begin  //�P��@�@����

//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
           hhh := '1320';   //�ǔ�p�����@�@�@10 ����
           tuihi1 := hhh;
           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2,1,0);
           // then DspHiryoList(htHiryo1);

     end
     else if (orgN2 <= 0) and (orgK2 > 0 ) then begin  //�P��@�@����

              //PageHiryoSource.ActivePageIndex := 2;
              //grTanpi.ItemIndex := 2; //����
//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 2; //0���f�@1�����_ �@2����
              hhh := '1400'; //hhh := '30'; //����
              tuihi1 := hhh;
              SetHiryoList2(smIns,htHiryo1,0,hhh,orgK+orgK2,2,2);
              // then DspHiryoList(htHiryo1);

     end;





{ //�ǔ�Q�͂����Ȃ�
     //�ǔ�Q
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


       //�I��엿�̒�����K�؂Ȃ��̂�I��
       if ListKasei.Items.Count > 0 then begin

        //

          //�엿�̔䗦
           ooo[0] := '';
           hcount := 1;
           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );

             if (name = '') or (name = ' ') then continue;


             //�ǔ�엿�ȊO�́A��΂�
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


             //�����I������B
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
//           grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2+orgN3,1,0);
           // then DspHiryoList(htHiryo1);
//        if SetHiryoList(smIns,htHiryo1,0,hhh) then DspHiryoList(htHiryo1);

//      txtNSet1.Value := btmp;

        end;
     end
     else if (orgN3 > 0) and (orgK3 <= 0 ) then begin  //�P��@�@����

//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
           hhh := '1320';   //�ǔ�p�����@�@�@10 ����
           tuihi1 := hhh;
           SetHiryoList2(smIns,htHiryo1,0,hhh,orgN+orgN2+orgN3,1,0);
           // then DspHiryoList(htHiryo1);

     end
     else if (orgN3 <= 0) and (orgK3 > 0 ) then begin  //�P��@�@����

//           PageHiryoSource.ActivePageIndex := 1;
//           PageHiryoDest.ActivePageIndex := 1;
//           grKasei.ItemIndex := 2; //0���f�@1�����_ �@2����
              hhh := '1400'; //hhh := '30'; //����
//              PageHiryoSource.ActivePageIndex := 2;
//              grTanpi.ItemIndex := 2; //����
//              hhh := '30'; //����
           tuihi1 := hhh;
              SetHiryoList2(smIns,htHiryo1,0,hhh,orgK+orgK2+orgK3,1,2);
              // then DspHiryoList(htHiryo1);

     end;
}

    //�엿�̕ۑ�
    for aCnt := 1 to 5 do begin

        PrintModule1.ADOQuerySindan.Edit;
        stmp := '���'+Inttostr(aCnt);
        SetHiryoField (PrintModule1.ADOQuerySindan,'���',aCnt,SehiList.GetHiryo(htHiryo1,aCnt)) ;

/////        PrintModule1.ADOQuerySindan.FiledByName(stmp).asString := SehiList.GetHiryo(htHiryo1,aCnt);


    end;




   /////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////////////////////////////////////////////////////////////
    //�݌v�Q  ���z����Ԉ�������
        //�I��엿�̒�����K�؂Ȃ��̂�I��
    //PageHiryoSource.ActivePageIndex := 1;
    //PageHiryoDest.ActivePageIndex := 2;

    if ListKasei.Items.Count > 0 then begin



        hhh := '';
        tanka1 := 1000000;
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh2 := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh2 );
             if (name = '') or (name = ' ') then continue;

             //�ǔ�엿�ȊO�́A��΂�
             if GetHiryoT(hhh2) = true then continue;


             tmpN2 := GetHiryoN(hhh2);
             tanka2 := GetHiryoTanka(hhh2);
             you2 := GetHiryoV(hhh2);
             if you2 > 0  then begin

               if tmpN2 > 0 then begin  //�P�������m�łȂ��ׂɁ@�{�p�ʂ̏��Ȃ��̂�
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


        //grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
        SetHiryoList2(smIns,htHiryo2,0,hhh,orgN,1,0);


     end;

{
     hhh := '10'; //����
     SetHiryoList2(smIns,htHiryo2,0,hhh,orgN,2,0);

     //grTanpi.ItemIndex := 1; //�����_
     if PrintModule1.ADOQueryUketuke.FieldByName('��ڃR�[�h' ).asString = '2' then begin
        //�t����A�n�����^�J
        if ( PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h' ).asString = '12')
        or ( PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h' ).asString = '13')
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
     //grTanpi.ItemIndex := 2; //����
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

             //�ǔ�̂�
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

        if hhh = '' then hhh := '1320'; //����



        //grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
        SetHiryoList2(smIns,htHiryo2,0,hhh,orgN+orgN2,1,0);


      end;





    //�엿�̕ۑ�
    for aCnt := 1 to 5 do begin

        PrintModule1.ADOQuerySindan.Edit;
        SetHiryoField (PrintModule1.ADOQuerySindan,'���{1',aCnt,SehiList.GetHiryo(htHiryo2,aCnt)) ;
    end;




   ////////////////////////////////////////////////////////////////////////////////
    //�݌v3
    ////
    ///
        //�I��엿�̒�����K�؂Ȃ��̂�I��
    //PageHiryoSource.ActivePageIndex := 1;
    //PageHiryoDest.ActivePageIndex := 3;



    //�t���������̏ꍇ�́A�݌v�R�́A�o�͂��Ȃ�
//    if not ((PrintModule1.ADOQueryUketuke.FieldByName('��ڃR�[�h' ).asString = '2') and
//           ((PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h' ).asString = '12') or
//            (PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h' ).asString = '13'))) then begin




    if ListKasei.Items.Count > 0 then begin

         //�엿�̔䗦
        hhh := '';
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //�ǔ�엿�ȊO�́A��΂�
             if GetHiryoT(hhh) = true then continue;

             break;
        end;




        if( hhh <> '' ) and ( hhh <> ' ') then begin
           //grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN,1,0); // then DspHiryoList(htHiryo3);
        end
        else begin
          //�I������ǔ삪�Ȃ�
           hhh := '10';
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN,1,0); // then DspHiryoList(htHiryo3);
        end;






        hhh := '';
//       if txtNSet2.Value > 0 then begin

        //�ǔ�
        for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh2 := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //�ǔ�엿�ȊO�́A��΂�
             if GetHiryoT(hhh) <> true then continue;

             hhh := hhh2;
             break;
        end;

//        hhh := tuihi1;

        if( hhh <> '' ) and ( hhh <> ' ') then begin
           //PageHiryoSource.ActivePageIndex := 1;
           //PageHiryoDest.ActivePageIndex := 2;
           //grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2,1,0);// then DspHiryoList(htHiryo3);
        end
        else begin
          //�I������ǔ삪�Ȃ�
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

             //�ǔ�엿�ȊO�́A��΂�
             if GetHiryoT(hhh) <> true then continue;

             break;
        end;

//        hhh := tuihi2;

        if( hhh <> '' ) and ( hhh <> ' ') then begin
           //PageHiryoSource.ActivePageIndex := 1;
           //PageHiryoDest.ActivePageIndex := 2;
           //grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
           SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2+orgN3,1,0);// then DspHiryoList(htHiryo3);
        end;
//       end;


       //�ǔ�
         hhh := '';

       if orgN2 > 0 then begin
{
           for i := 0 to ListKasei.Items.Count - 1 do begin

             hhh := Copy(ListKasei.Items[i],1,4);
             name := GetHiryoName( hhh );
             if (name = '') or (name = ' ') then continue;

             //�ǔ�엿�ȊO�́A��΂�
             if GetHiryoT(hhh) <> true then continue;

             break;
           end;
}
           //�I�����Ȃ��Ő݌v�P�őI�΂ꂽ�ǔ�����̂܂܎g�p
           hhh := tuihi1;

           if( hhh <> '' ) and ( hhh <> ' ') then begin
//              PageHiryoSource.ActivePageIndex := 1;
//              PageHiryoDest.ActivePageIndex := 2;
//              grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
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

             //�ǔ�엿�ȊO�́A��΂�
             if GetHiryoT(hhh) <> true then continue;

             break;
           end;
}
           hhh := tuihi2;

           if( hhh <> '' ) and ( hhh <> ' ') then begin
//              PageHiryoSource.ActivePageIndex := 1;
//              PageHiryoDest.ActivePageIndex := 2;
//              grKasei.ItemIndex := 0; //0���f�@1�����_ �@2����
              SetHiryoList2(smIns,htHiryo3,0,hhh,orgN+orgN2+orgN3,1,0); // then DspHiryoList(htHiryo2);
           end;
        end;


    end;//ListKasei.Items.Count


//    end; //�t���������̏ꍇ�́A�݌v�R�́A�o�͂��Ȃ�

    //�엿�̕ۑ�
    for aCnt := 1 to 5 do begin

        PrintModule1.ADOQuerySindan.Edit;
        SetHiryoField (PrintModule1.ADOQuerySindan,'���{2',aCnt,SehiList.GetHiryo(htHiryo3,aCnt)) ;
    end;





end;









{�f�f�e�[�u���D�엿���ׁi�P�|5�j�̓o�^�A�폜����
  aMode : smIns �ǉ��A smDel �폜
  aHiryo : htYuuki �L�@, htHiryo1,2,3
  aDelNum :�@�폜���폜�ԍ��i�P�|�j
  aCode : �ǉ����ǉ��엿�R�[�h
}
function TFSehiSekkei.SetHiryoList( aMode :TSetMode; aHiryo :THiryoType  ; aDelNum: integer ; aCode: string ):Boolean;
var
  aNum,aIndex : integer ;    {�o�^�ł����z��ԍ�}
  aSetVal,aValue : double ;
//  stmp : String;
begin
  result := False ;

  //�E�B���h�E�̕`�����������B
//  Application.ProcessMessages();
//stmp := txtNSet1.Text;


end;
//////
//
//
//  type1  0:�L�@ 1:���� 2:�P��   �g�p���Ă��Ȃ�
//  type2  1:N 2:P 3:K 4 :M
//
function TFSehiSekkei.SetHiryoList2( aMode :TSetMode; aHiryo :THiryoType  ; aDelNum: integer ; aCode: string; aSetVal : double;type1 : Integer;Type2 : integer ):Boolean;
var
  aNum,aIndex : integer ;    {�o�^�ł����z��ԍ�}
  aValue : double ;
//  stmp : String;
begin
  result := False ;

  //�E�B���h�E�̕`�����������B
//  Application.ProcessMessages();
//stmp := txtNSet1.Text;

  case aMode of
  smIns:begin
    aNum := SehiList.SetHiryo(aHiryo,aCode,0,false); //IsKazan );
    if aNum > 0 then begin
      {�ڕW�l����ʂ̏�Ԃ��犄��o��}
//      aSetVal := 0;
//      aIndex := 0 ;
//      case type1 of   {�ǂ̔엿�킩}
//      0: {�L�@} aIndex := 0;  {�L�@�̏ꍇ�͑S�Ē��f�Ōv�Z}
//      1: {����} aIndex := grKasei.ItemIndex;
//      2: {�P��} aIndex := grTanpi.ItemIndex;
//      end;
      {�{�e�ʂ��Z�o����}
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

{�w��t�B�[���h�̏����t���f�[�^�������݁B}
procedure TFSehiSekkei.SetHiryoField( DataSet: TDataSet; aField : string; aCnt : integer ;aRecHiryo : TRecHiryo );
begin
  if aRecHiryo.CD <> '' then begin
    DataSet.FieldByName(aField+InttoStr(aCnt)).asString :=  aRecHiryo.CD ;
    DataSet.FieldByName(aField+'��'+InttoStr(aCnt)).asFloat :=  aRecHiryo.V ;
  end else begin
    DataSet.FieldByName(aField+InttoStr(aCnt)).Clear ;
    DataSet.FieldByName(aField+'��'+InttoStr(aCnt)).Clear ;
  end;
end;



end.

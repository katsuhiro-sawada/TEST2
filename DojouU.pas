unit DojouU;

interface
{
  �f�f�e�[�u���̊e��v�Z���\�b�h�Q

  �Ώہ���t�e�[�u�� �� SQLCondition
  �f�f�D�f�f�s���ʎZ�o   CalcKijun
  �f�f�D�y���ގZ�o       CalcDojou
  �{��D�엿�Z�o
  ���ʁ��f�f�e�[�u�� �Z�o����
  �N���X�𐶐����āA�e���\�b�h(CalcKijun,CalcDojou)�Ăяo���݂̂ŁA���ʂ𓾂邱�Ƃ��o����B
  ���ۂ̓��[���t�H�[���̐f�f��� Mainform.ActSindanExecute ����

  ��ʂ�\�����邱�Ƃɂ��A�Ώۃf�[�^�̑I����ύX�o����B
  �Ăяo����A DspPrnReport( self, TReportType); �Ō��ʂ��v���r���[����B
  �Z�o���\�b�h�A�v���r���[�֐����Ńv���O���X�����R�[�h�������ɕ\�����邱�Ƃ��\�B
    OpenProgress; frmProgress.Scale(�ꌏ������̃X�P�[��/1000);CloseProgress; 

}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, ExtCtrls, Variants,Grids, ADODB;

type TsDokai = (sdP,sdMg,sdpH);
type
  TSindanForm = class(TForm)
    DataSource1: TDataSource;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    btnClose: TBitBtn;
    btnAll: TBitBtn;
    btnCancel: TBitBtn;
    btnPreview: TBitBtn;
    Image2: TImage;
    Image1: TImage;
    EMode : TEdit;
    ADOQuery1: TADOQuery;
    QueryUketuke: TADOQuery;
    QueryKijun: TADOQuery;
    QuerySindan: TADOQuery;
    QueryDokaizai: TADOQuery;
    QAre: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure QuerySindanorgBeforePost(DataSet: TDataSet);
    procedure StringGrid1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function SetKijunRec: Boolean ;
  private
    IsKusa,IsIne,IsKazan : Boolean ;
    typCEC : string ;
    function GetDokaizai(Code, aFieldN: string): double;
    function MakeDokaiVolume(aCode: string; aType: TsDokai; aValue: double;
      var pVolP: double; var pVolMg: double; var pVolpH: double): double;
    function DokaiVolume(aCode: string; aValue: double;
      var pVolP: double; var pVolMg: double; var pVolpH: double): double;
    { Private �錾 }
  public
    { Public �錾 }
    FRes : Boolean ;
    procedure MakeSQL;
    procedure MakeSQL2;
    procedure CalcKijun;
    procedure CalcDojou;
    procedure CalcDojouAuto;
  end;

var
  SindanForm: TSindanForm;

implementation

uses DMU, ProgressU, PrnCanvasU;

{$R *.DFM}

procedure TSindanForm.FormCreate(Sender: TObject);
begin
	Color := BackColor ;
end;
procedure TSindanForm.MakeSQL;
begin
      QueryUketuke.SQL.Text := 'Select T_BUNSEKI6.*,M_SAKUMOTU.* '+
        'from T_BUNSEKI6 LEFT OUTER JOIN M_SAKUMOTU '+
   	'ON  (T_BUNSEKI6.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h) '+
        'where ' + SQLCondition ;

        {Version 0.6 #26 �폜�t���O�ǉ�}
end;
procedure TSindanForm.MakeSQL2;
begin
      QueryUketuke.SQL.Text := 'Select T_UKETUKE.*,M_HOJOU.�y��R�[�h,M_HOJOU.�y���R�[�h,M_HOJOU.���A�R�[�h,M_HOJOU.�_�Ɣԍ�,M_NOUKA.�_�Ɣԍ�,M_NOUKA.�W�c '+
        'from T_UKETUKE LEFT OUTER JOIN M_HOJOU '+
   	'ON  (T_UKETUKE.�ޏ�ԍ� = M_HOJOU.�ޏ�ԍ�) '+
        'from M_HOJOU LEFT OUTER JOIN M_NOUKA '+
   	'ON  (M_HOJOU.�_�Ɣԍ� = M_NOUKA.�_�Ɣԍ�) '+
        'where T_UKETUKE.�폜�t���O<>True and ' + SQLCondition + SQLCondition2;

        {Version 0.6 #26 �폜�t���O�ǉ�}
end;
procedure TSindanForm.FormDestroy(Sender: TObject);
begin
  QuerySindan.Close;
  QueryUketuke.Close;
  QueryKijun.Close;

end;
procedure TSindanForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//
end;
{
  1.1 ��s���Z�o
}
procedure TSindanForm.CalcKijun;
function CalcMg : double ;   //Mg�s���ʎZ�o����
var
  Youseki : double ;
begin
  //�e�Ϗd�̔���
  Youseki := PrintModule1.ADOQueryUketuke.FieldByName('�e�Ϗd').asFloat ;
  if Youseki = 0 then   //���͒l�Ȃ��ŉΎR���y�̏ꍇ�V�O
    if IsKazan then Youseki := 70
    else Youseki := 100;

  //Mg�s���ʁ��iMg�ڕW�l�|Mg���͒l�j�e�Ϗd�^�P�O�O
  // H170601 �ڕW�l���牺���ɕύX
  result := ( PrintModule1.ADOQueryKijun.FieldByName('��y'+typCEC+'�ڕW').asFloat - PrintModule1.ADOQueryUketuke.FieldByName('MgO').asFloat )
            * Youseki / 100 ;
//  result := ( QueryKijun.FieldByName('��y'+typCEC+'����').asFloat - QueryUketuke.FieldByName('MgO').asFloat )
//            * Youseki / 100 ;
  if result < 0 then result := 0 ;
end;


function CalcP : double ;   //P�s���ʎZ�o����
var
  Youseki,ValueP,coeP,Rin : double ;
  Dositu,PKeisu : integer ;  //�y���i�y��R�[�h�P�O�̈ʁ{�y���R�[�h�j
  sakucd : String;
begin
  //�e�Ϗd�̔���
  Youseki := PrintModule1.ADOQueryUketuke.FieldByName('�e�Ϗd').asFloat ;
  sakucd :=  PrintModule1.ADOQueryUketuke.FieldByName('��ڃR�[�h').asString;
  if Youseki = 0 then   //���͒l�Ȃ��ŉΎR���y�̏ꍇ�V�O
    if IsKazan then Youseki := 70
    else Youseki := 100;

  if IsIne then begin
    ValueP := PrintModule1.ADOQueryUketuke.FieldByName('�u���CP').asFloat;
    //H171120
    if (PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h').asString = '04') or
       (PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h').asString = '05') or
       (PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h').asString = '06')
       then begin
      ValueP := PrintModule1.ADOQueryUketuke.FieldByName('�g���I�[�OP').asFloat ;
    end;


  end
  else if sakucd = '6' then begin
    ValueP := PrintModule1.ADOQueryUketuke.FieldByName('�u���CP').asFloat;
  end
  else begin
    ValueP := PrintModule1.ADOQueryUketuke.FieldByName('�g���I�[�OP').asFloat ;
  end;


  with PrintModule1.ADOQueryUketuke do begin
    Dositu := (StrtoIntDef(FieldByName('M_HOJOU.�y��R�[�h').asString,0)div 10)*10 + StrtoIntdef(FieldByName('M_HOJOU.�y���R�[�h').asString,0);

    coeP := Rinsankeisuu( Dositu, FieldByName('�����z').asFloat);
 end;
(*
  //�����_�z�{�� �\�Q �����_�z���W���~�y��{�y�� �̃����_�{���\
  coeP := 0;
  with QueryUketuke do begin
    Dositu := (StrtoIntDef(FieldByName('�y��R�[�h').asString,0)div 10)*10 + StrtoIntdef(FieldByName('�y���R�[�h').asString,0);
//    if FieldByName('�����z').isnull then PKeisu := 0
    if (FieldByName('�����z').asFloat > 0 )and( FieldByName('�����z').asFloat <= 700 ) then PKeisu := 1
    else if (FieldByName('�����z').asFloat > 700 )and( FieldByName('�����z').asFloat <= 1500 ) then PKeisu := 2
    else if (FieldByName('�����z').asFloat > 1500 )and( FieldByName('�����z').asFloat <= 2000 ) then PKeisu := 3
    else PKeisu := 1;
//    else PKeisu := 0;
  end;
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
*)


  //P�s���ʁ��iP�ڕW�l�|P���͒l�j* P�z�{�� * �e�Ϗd�^�P�O�O
  result := ( PrintModule1.ADOQueryKijun.FieldByName('�����_'+typCEC+'�ڕW').asFloat - ValueP )
            * coeP * Youseki / 100 ;

//  result := ( QueryKijun.FieldByName('�����_'+typCEC+'����').asFloat - ValueP )
//            * coeP * Youseki / 100 ;
  if result < 0 then result := 0 ;
end;

function CalcPh: double ;      //Ph�␳�APh�s����
var
  alenius : double ;
begin
  with PrintModule1.ADOQueryUketuke do begin
    //�A���j�E�X��
    alenius := cstAlenius[StrtoIntDef(FieldByName('M_HOJOU.���A�R�[�h').asString,1)][StrtoIntDef(FieldByName('M_HOJOU.�y���R�[�h').asString,1)] * 10 ;
    if IsKazan then alenius := alenius * 0.7 ;
    result := alenius ;
//    if (FieldByName('EC').asFloat > 0.2 ) and (FieldByName('EC').asFloat <= 1.0  ) then
      //�s���ʁ�pH���͒l�{EC
//      result := FieldByName('pH').asFloat + FieldByName('EC').asFloat
//    else
//    if FieldByName('EC').asFloat > 1.0 then result := 9.8 ;
  end;
end;
function CalcPh2( hph : Double; var id : double ): double ;      //Ph�␳�APh�s����
var
  alenius : double ;
  kou : String;
  stmp : String;
  dosei : String;
  fusyoku : String;
begin
  with QueryUketuke do begin
    //�A���j�E�X��
    QAre.Close;
    QAre.SQL.Clear;
    QAre.SQL.Add('select * from M_�A���j�E�X.DB');
    QAre.Open;

    hph := hph * 1.000 + 0.00001;


    if hph < 4.0 then begin
        result := 0;
        id := 4.0;
        exit;
    end;
    if hph >= 6.5 then begin
        result := 0;
        id := 6.5;
        exit;
    end;


    if 4.2 > hph then begin
       kou := 'pH40';
       id := 4.0;

    end
    else if 4.4 > hph then begin
       kou := 'pH42';
       id := 4.2;
    end
    else if 4.6 > hph then begin
       kou := 'pH44';
       id := 4.4;
    end
    else if 4.8 > hph then begin
       kou := 'pH46';
       id := 4.6;
    end
    else if 5.0 > hph then begin
       kou := 'pH48';
       id := 4.8;
    end
    else if 5.2 > hph then begin
       kou := 'pH50';
       id := 5.0;
    end
    else if 5.4 > hph then begin
       kou := 'pH52';
       id := 5.2;
    end
    else if 5.6 > hph then begin
       kou := 'pH54';
       id := 5.4;
    end
    else if 5.800 > hph then begin
       kou := 'pH56';
       id := 5.6;
    end
    else if 6.000 > hph then begin
       kou := 'pH58';
       id := 5.8;
    end
    else if 6.2 > hph then begin
       kou := 'pH60';
       id := 6.0;
    end
    else if 6.4 > hph then begin
       kou := 'pH62';
       id := 6.2;
    end
    else  begin
       kou := 'pH64';
       id := 6.4;
    end;



    dosei := FieldByName('�y���R�[�h').asString;
    fusyoku := FieldByName('���A�R�[�h').asString;


	//���A�d�l ���A�l���Ȃ�:�O,����:�O�`�Q�ȉ�,�܂�:�Q�`�T�ȉ�,�x��:�T�`�P�O�ȉ�,����x��:�P�O�`�Q�O�ȉ�,���A�y:�Q�O�`
        if FieldByName('���A').isNull then fusyoku := FieldByName('���A�R�[�h').asString
        else
        if FieldByName('���A').asFloat = 0 then  fusyoku := FieldByName('���A�R�[�h').asString
        else
        if (FieldByName('���A').asFloat > 0 ) and (FieldByName('���A').asFloat <= 2) then  fusyoku := '1' //'����'
        else
        if (FieldByName('���A').asFloat > 2 ) and (FieldByName('���A').asFloat <= 5) then  fusyoku := '1'
        else
        if (FieldByName('���A').asFloat > 5 ) and (FieldByName('���A').asFloat <= 10) then fusyoku := '2'
        else
        if (FieldByName('���A').asFloat > 10 ) and (FieldByName('���A').asFloat <= 20) then fusyoku := '3'
        else                                                                           fusyoku := '3';





    alenius := 0;
    alenius := 0;
    //�D�Y�̏ꍇ�@���A�y  H171120
    if dosei = '7' then begin
         dosei := '6';
    end;
    if dosei = '6' then fusyoku := '1';


    if QAre.locate('�y���R�[�h;���A',VarArrayOf([dosei,fusyoku]),[] ) then begin
                 alenius := QAre.FieldByName(kou).asFloat;
    end
    else begin
              alenius := 0;
    end;


    QAre.Close;

    result := alenius ;
  end;
end;
var
   moku, hph, btmp : double;
   hph2,hph3,hph4 : double;
   moku2,moku3,moku4 : double;
   id1, id2 : double;
   //   stmp : String;
begin


//  QueryUketuke.SQL.Text := 'Select T_UKETUKE.*,M_HOJOU.�y��R�[�h,M_HOJOU.�y���R�[�h,M_HOJOU.���A�R�[�h '+
//    'from T_UKETUKE INNER JOIN M_HOJOU '+
 //  	'ON  (T_UKETUKE.�ޏ�ԍ� = M_HOJOU.�ޏ�ԍ�) where T_UKETUKE.�폜�t���O<>True and  �T���v���ԍ� = '''+PrintModule1.QueryUketuke.FieldByName('�T���v���ԍ�').asString + '''';
//  SQLCondition := '�T���v���ԍ� = '''+PrintModule1.QueryUketuke.FieldByName('�T���v���ԍ�').asString + '''';
//  MakeSQL;
//  QueryUketuke.Open;



//  QuerySindan.Open;

///////////////////////////////////////////////////////////////
//  PrintModule1.ADOQueryUketuke�@�́A�J���Ă�����̂Ƃ���B




//  while not QueryUketuke.eof do begin
    if not SetKijunRec then begin
      showmessage('��l�}�X�^�ɑ��݂��܂���B');
//      continue ;
    end;





    with PrintModule1.ADOQuerySindan do  begin
      if RecordCount = 0 then begin
        Append;
        FieldByName('�T���v���ԍ�').asString := PrintModule1.ADOQueryUketuke.FieldByName('�T���v���ԍ�').asString ;
        FieldByName('�ҏW��').asDateTime := now ; {Version 0.6 #19 }
      end else
        Edit;
      //�s���ʏ�����
      FieldByName('Mg�f�f�s����').Clear;
      FieldByName('Ph�f�f�s����').Clear;  //PH�s����
      FieldByName('P�f�f�s����').Clear ;



      //Mg�s���ʎZ�o
      FieldByName('Mg�f�f�s����').asFloat := CalcMg;


      //PH�s����
      if JMode = 'Fuuren' then begin
        //�ڕW�l���Q��ނŌv�Z����B
        if JMode_DokaiSel = 1 then begin
           moku := QueryKijun.FieldByName('pH'+typCEC+'����').asFloat;
        end
        else begin
           moku := QueryKijun.FieldByName('pH'+typCEC+'���').asFloat;
        end;

        hph := QueryUketuke.FieldByName('pH').asFloat;
        btmp := QueryUketuke.FieldByName('EC').asFloat;
        if (btmp > 0.20001 ) and (btmp <= 1.0  ) then
          //�s���ʁ�pH���͒l�{EC
          hph := QueryUketuke.FieldByName('pH').asFloat + QueryUketuke.FieldByName('EC').asFloat
        else
        if QueryUketuke.FieldByName('EC').asFloat > 1.0 then hph := 9.8 ;


        hph := moku - hph;
        if hph < 0 then hph := 0;
        hph := Calcph * hph;



      end
      else begin
        moku := PrintModule1.ADOQueryKijun.FieldByName('pH'+typCEC+'�ڕW').asFloat;
        hph := PrintModule1.ADOQueryUketuke.FieldByName('pH').asFloat;
        btmp := PrintModule1.ADOQueryUketuke.FieldByName('EC').asFloat;
        if (btmp > 0.20001 ) and (btmp <= 1.0  ) then
          //�s���ʁ�pH���͒l�{EC
          hph := PrintModule1.ADOQueryUketuke.FieldByName('pH').asFloat + PrintModule1.ADOQueryUketuke.FieldByName('EC').asFloat
        else
        if PrintModule1.ADOQueryUketuke.FieldByName('EC').asFloat > 1.0 then hph := 9.8 ;


        hph := moku - hph;
        if hph < 0 then hph := 0;
        hph := Calcph * hph;
      end;


      if IsKusa then begin
//        FieldByName('Ph�f�f�s����').asFloat := CalcPh;  //PH�s����
        FieldByName('Ph�f�f�s����').asFloat := hph;  //PH�s����
      end else begin
        //P�s���ʎZ�o
        FieldByName('P�f�f�s����').asFloat := CalcP;
        if not IsIne then begin
//          FieldByName('Ph�f�f�s����').asFloat := CalcPh;  //pH�␳

          FieldByName('Ph�f�f�s����').asFloat := hph;  //pH�␳
        end;
      end;
      Post;    //�����|�X�g
    end;
//    QueryUketuke.Next;
//    Application.ProcessMessages ;
//    if not NextProgress then break;
//  end;
  QuerySindan.Close;
  QueryUketuke.Close;
  QueryKijun.Close;




end;
{
  �y���ރ}�X�^�擾 �w�莑�ރR�[�h�̃t�B�[���h�l
}
function TSindanForm.GetDokaizai(Code,aFieldN : string ) : double ;
begin
  with QueryDokaizai do begin
    SQL.Text := 'Select * from M_DOKAIZAI where �R�[�h='''+Code+'''';
    Open;
    result := FieldByName(aFieldN).asFloat ;
//A.Nishimura     result := 1.0;
    Close;
  end;
end;
{
  1.2  �y��f�f���������v�Z�A�Ώۃf�[�^�@SQLCondition
  ��tT�|��}�X�^
  �b
  �f�fT�|�y���ރ}�X�^
  ���͒l����쐬�앨�ʂɕK�v�{��ʂ��Z�o����
}
procedure TSindanForm.CalcDojou ;
{  ****************************************************************************
 //1-2-3���n�y���ގZ�o
}
procedure CalDokai3;
var
  aVolP,aVolMg,aVolpH : double; //�֐��Z�o�l
  aNesP,aNesMg,aNespH : double ; //�K�v��
  aNesNo : integer ;
  aCode : string ;
  btmp : double;
  bairitu : double;
  stmp : String;
begin

  //�D�Y�̏ꍇ
  with PrintModule1.ADOQueryUketuke do begin
       stmp := Copy(PrintModule1.ADOQueryUketuke.FieldByName('�y��R�[�h').AsString,1,1);
       if stmp <> '2' then
        bairitu := 1.0 //bairitu := 0.5
       else
        bairitu := 1.0;
  end;


  //�v�Z�p�s���ʂ�ݒ�
  with PrintModule1.ADOQuerySindan do begin
    aNesP  := FieldByName('P�f�f�s����').asFloat ;
    aNesMg := FieldByName('Mg�f�f�s����').asFloat ;
    aNespH := FieldByName('pH�f�f�s����').asFloat ;
    aNesNo := 1 ; //�Z�o���ޔԍ�


    while true do begin
      //�G�S�ĕK�v�����Ȃ�Όv�Z�I��
      if (aNesP <= 0 ) and ( aNesMg <= 0 ) and ( aNespH <= 0 ) then
        break;
      //�@�S�ĕK�v�ȏꍇ : P���悤���ŎZ�o
//NISHI0527
{
      if (aNesP > 0)and(aNesMg > 0)and(aNespH > 0) then begin
        aCode := '030';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNespH := aNespH - aVolpH ; //�A���J������K�v�ʂ��猸�Z
        aNesMg := aNesMg - aVolMg ; //��y����K�v�ʂ��猸�Z
        aNesP := 0 ;
      end
}
      //�AP,Mg���K�v�̏ꍇ : P���_�u�����Ő�ɎZ�o
      if (aNesP > 0)and(aNesMg > 0)and(aNespH <= 0) then begin
        aCode := '040';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNesMg := aNesMg - aVolMg ; //��y����K�v�ʂ��猸�Z
        aNesP := 0 ;
      end
      //�BP�ApH���K�v�̏ꍇ : pH���^���J��,P���ߐ΂ŎZ�o
      else if (aNesP > 0)and(aNespH > 0) then begin
        aCode := '010';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH�f�f�s����').asFloat * bairitu;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat := btmp;
//        btmp := DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
//        aNesMg := aNesMg - aVolMg ; //��y����K�v�ʂ��猸�Z

        aNespH := 0 ;
      end
      //�CP���K�v�̏ꍇ : P���ߐ΂ŎZ�o
      else if (aNesP > 0) then begin
        aCode := '050';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNesP := 0 ;
      end
      //�@,�DMg,pH���K�v�ȏꍇ : pH����y�Y�J���ŎZ�o  //1-2-1-1
      else if (aNesMg > 0)and(aNespH > 0) then begin
        aCode := '020';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH�f�f�s����').asFloat * bairitu;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat := btmp;

        DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
//H150916                MakeDokaiVolume(aCode, sdpH, aNespH, aVolP,aVolMg,aVolpH);
        //�y����ǎ��ޗʂ��琬����



        aNesMg := aNesMg - aVolMg ; //��y����K�v�ʂ��猸�Z
        aNespH := 0 ;
      end
      //�B,�FpH���K�v�ȏꍇ : pH��Y�J���ŎZ�o
      else if (aNesMg <= 0)and(aNespH > 0) then begin
        aCode := '010';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat := aNespH * 1.0; //bairitu;
//        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
//                MakeDokaiVolume(aCode, sdpH, aNespH, aVolP,aVolMg,aVolpH);
        aNespH := 0 ;
      end
      //�@,�A,�D,�EMg�݂̂̕K�v : Mg�𗰎_��y�ŎZ�o
      else if (aNesP <= 0)and(aNesMg > 0)and(aNespH <= 0) then begin
        aCode := '060';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdMg, aNesMg, aVolP,aVolMg,aVolpH);
        aNesMg := 0 ;
      end;
      INC(aNesNo);  //�K���ǂꂩ�Z�o�����͂�
    end;
 end;
end;
//
//  �����E�X�V�@�y����ǎ��ގZ�o
//
procedure CalDokai3_2;
var
  aVolP,aVolMg,aVolpH : double; //�֐��Z�o�l
  aNesP,aNesMg,aNespH : double ; //�K�v��
  aNesNo : integer ;
  aCode : string ;
  stmp : String;
  btmp : double;
  bairitu : double;
begin

  //�D�Y�̏ꍇ
  with PrintModule1.ADOQueryUketuke do begin
       stmp := Copy(PrintModule1.ADOQueryUketuke.FieldByName('M_HOJOU.�y��R�[�h').AsString,1,1);
       if stmp <> '2' then
        bairitu := 1.0 //1.5
       else
        bairitu := 1.0;
  end;
  //�v�Z�p�s���ʂ�ݒ�
  with PrintModule1.ADOQuerySindan do begin
    aNesP  := FieldByName('P�f�f�s����').asFloat ;
    aNesMg := FieldByName('Mg�f�f�s����').asFloat ;
    aNespH := FieldByName('pH�f�f�s����').asFloat ;
    aNesNo := 1 ; //�Z�o���ޔԍ�


    while true do begin
      //�G�S�ĕK�v�����Ȃ�Όv�Z�I��
      if (aNesP <= 0 ) and ( aNesMg <= 0 ) and ( aNespH <= 0 ) then
        break;
      //�@�S�ĕK�v�ȏꍇ : P���悤���ŎZ�o
 //NISHI0527
{
      if (aNesP > 0)and(aNesMg > 0)and(aNespH > 0) then begin
        aCode := '030';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNespH := aNespH - aVolpH ; //�A���J������K�v�ʂ��猸�Z
        aNesMg := aNesMg - aVolMg ; //��y����K�v�ʂ��猸�Z
        aNesP := 0 ;
      end
}
      //�AP,Mg���K�v�̏ꍇ : P���_�u�����Ő�ɎZ�o
      if (aNesP > 0)and(aNesMg > 0)and(aNespH <= 0) then begin
        aCode := '040';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNesMg := aNesMg - aVolMg ; //��y����K�v�ʂ��猸�Z
        aNesP := 0 ;
      end
      //�BP�ApH���K�v�̏ꍇ : pH���^���J��,P���ߐ΂ŎZ�o
      else if (aNesP > 0)and(aNespH > 0) then begin
        aCode := '010';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH�f�f�s����').asFloat * bairitu;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat := btmp;
//        btmp := DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
//        aNesMg := aNesMg - aVolMg ; //��y����K�v�ʂ��猸�Z

        aNespH := 0 ;
      end
      //�CP���K�v�̏ꍇ : P���ߐ΂ŎZ�o
      else if (aNesP > 0) then begin
        aCode := '050';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNesP := 0 ;
      end
      //�@,�DMg,pH���K�v�ȏꍇ : pH����y�Y�J���ŎZ�o  //1-2-1-1
      else if (aNesMg > 0)and(aNespH > 0) then begin
        aCode := '020';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH�f�f�s����').asFloat * bairitu;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat := btmp;

        DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
//H150916                MakeDokaiVolume(aCode, sdpH, aNespH, aVolP,aVolMg,aVolpH);
        //�y����ǎ��ޗʂ��琬����



        aNesMg := aNesMg - aVolMg ; //��y����K�v�ʂ��猸�Z
        aNespH := 0 ;
      end
      //�B,�FpH���K�v�ȏꍇ : pH��Y�J���ŎZ�o
      else if (aNesMg <= 0)and(aNespH > 0) then begin
        aCode := '010';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat := aNespH * bairitu;
//        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
//                MakeDokaiVolume(aCode, sdpH, aNespH, aVolP,aVolMg,aVolpH);
        aNespH := 0 ;
      end
      //�@,�A,�D,�EMg�݂̂̕K�v : Mg�𗰎_��y�ŎZ�o
      else if (aNesP <= 0)and(aNesMg > 0)and(aNespH <= 0) then begin
        aCode := '060';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdMg, aNesMg, aVolP,aVolMg,aVolpH);
        aNesMg := 0 ;
      end;
      INC(aNesNo);  //�K���ǂꂩ�Z�o�����͂�
    end;
 end;
end;
//var
//  aCode : string ;
//begin
//  with QuerySindan do begin
//    if FieldByName('pH�f�f�s����').asFloat <= 0 then exit;
//    if FieldByName('Mg�f�f�s����').asFloat <= 0 then
//      aCode := '010'
//    else
//      aCode := '020';
//    FieldByName('�y���ރR�[�h1').asString := aCode;
//    FieldByName('�y���ޗ�1').asFloat := FieldByName('pH�f�f�s����').asFloat;
//  //  / GetDokaizai(aCode,'�A���J����')*100;
//  end;
  //��Mg�s���̒��x�͍l�����Ȃ�
//end;
{
   �]�J���K�v�ʂ��Z�o�i�y�납��A�P�C�_�l����j
}
{  ****************************************************************************
   //1-2-2���c�y���ގZ�o
}
procedure CalDokai2;
var
  Mg2 : double ;
  aCode :string ;
begin
  with PrintModule1.ADOQuerySindan do begin
    if PrintModule1.ADOQueryUketuke.FieldByName('�P�C�_').asFloat <= 0 then begin
      //�y��̎�ނɂ��]�J���K�v�ʂ��Z�o
      FieldByName('�y���ރR�[�h1').asString := '070';
      FieldByName('�y���ޗ�1').asFloat := GetKeiCal(PrintModule1.ADOQueryUketuke.FieldByName('�y��R�[�h').asString);
    end else begin
      //�P�C�_�l�ɂ��]�J���K�v�ʂ��Z�o
      FieldByName('�y���ރR�[�h1').asString := '070';
      FieldByName('�y���ޗ�1').asFloat := GetKeiCal(PrintModule1.ADOQueryUketuke.FieldByName('�P�C�_').asFloat,QueryUketuke.FieldByName('�y��R�[�h').asString);
    end;

    if FieldByName('Mg�f�f�s����').asFloat > 0  then begin
      if FieldByName('P�f�f�s����').asFloat > 0 then begin
        if PrintModule1.ADOQueryUketuke.FieldByName('pH').asFloat < PrintModule1.ADOQueryKijun.FieldByName('pH'+typCEC +'����').asFloat then begin
          //��d. Mg,P�s��&pH���͒l��pH�ڕW�l����
          FieldByName('�y���ރR�[�h2').asString := '030';
        end else begin
          //��c.
          FieldByName('�y���ރR�[�h2').asString := '040';
        end;
        //��e. P�s���ʂ̎Z�o�AMg�s���ʂ̎Z�o
        FieldByName('�y���ޗ�2').asFloat := FieldByName('P�f�f�s����').asFloat /
                                GetDokaizai( FieldByName('�y���ރR�[�h2').asString,'�����_') * 100 ;
//        Mg2 := FieldByName('Mg�f�f�s����').asFloat;

//        Mg2 := FieldByName('�y���ޗ�2').asFloat * GetDokaizai( FieldByName('�y���ރR�[�h2').asString,'��y') / 100 ;

        Mg2 := FieldByName('Mg�f�f�s����').asFloat -
                                FieldByName('�y���ޗ�2').asFloat * GetDokaizai( FieldByName('�y���ރR�[�h2').asString,'��y') / 100 ;


//        Mg2 := FieldByName('�y���ޗ�2').asFloat * GetDokaizai( FieldByName('�y���ރR�[�h2').asString,'��y') / 100 ;


        if Mg2 > 0 then begin
          aCode := '060' ;
          FieldByName('�y���ރR�[�h3').asString := aCode;
          FieldByName('�y���ޗ�3').asFloat := Mg2 / GetDokaizai( aCode,'��y') * 100 ;
        end;
      end else begin
        //��b. Mg�s���ʂ̎Z�o
        aCode := '060' ;
        FieldByName('�y���ރR�[�h2').asString := aCode;
        FieldByName('�y���ޗ�2').asFloat := FieldByName('Mg�f�f�s����').asFloat / GetDokaizai( aCode,'��y') * 100 ;
      end;
    end else begin
      if FieldByName('P�f�f�s����').asFloat > 0 then begin
        //��a. P�s���ʂ̎Z�o
        aCode := '050';
        FieldByName('�y���ރR�[�h2').asString := aCode;
        FieldByName('�y���ޗ�2').asFloat := FieldByName('P�f�f�s����').asFloat / GetDokaizai( aCode,'�����_') * 100 ;
      end;
    end;
  end;
end;
//------------------------------------------------------------
//  �y����ǎ��ށ@�����@�����c
//
//------------------------------------------------------------
procedure CalDokai2_1;
var
  aVolP,aVolMg,aVolpH : double; //�֐��Z�o�l
  aNesP,aNesMg,aNespH : double ; //�K�v��
  aNesNo : integer ;
  aCode : string ;
  btmp : double;

  P : Double;
  CaO : Double;
  MgO : Double;
  SekkaiKudo : Double;
  pH : Double;

  Mg2 : double ;
  btmp2 : double;

  dcode,dscode : String;
  id, ids : Integer;
  //�������@���Z
  // �܂ށA�x�ށA����x��
  const Ro : array [1..7,1..3] of Integer =
  ((155,180,235),   //���y
   (185,190,250),   //����y
   (175,210,270),   //��y
   (190,225,290),   //����y
   (225,260,340),   //���y
   (225,260,340),   //���A�y  ��ɂȂ��̂ŏ��y�Ɠ����ɂ��Ă����@
   (800,800,800));  //�D�Y�y

//  aCode :string ;
begin

  pH := PrintModule1.ADOQueryUketuke.FieldByName('pH').asFloat;
  if PrintModule1.ADOQueryUketuke.FieldByName('EC').asFloat >= 0.2 then
     pH := pH + PrintModule1.ADOQueryUketuke.FieldByName('EC').asFloat;



  P := PrintModule1.ADOQueryUketuke.FieldByName('�g���I�[�OP').asFloat;
  CaO := PrintModule1.ADOQueryUketuke.FieldByName('CaO').asFloat;
  MgO := PrintModule1.ADOQueryUketuke.FieldByName('MgO').asFloat;

  SekkaiKudo := (CaO / 28.0) / (MgO / 20.2);

    //�����ŃR�����g�������Ƒʖځ@�����`�掞�ɏo��
{       if pH >= 6.0 then begin
          //�{�p�Ȃ�
          Edit;
          FieldByName('�����{��').asString := '���̓y�́A��c�ɓK���Ȃ��y�ł��B';
          //Post;

       end;
}
  if pH >= 6.0 then exit;


  with PrintModule1.ADOQuerySindan do begin

    //���_�̕s���́A��ɂO�Ƃ���@�y����ǎ��ނł݂Ȃ�
     //aNesP  := FieldByName('P�f�f�s����').asFloat ;
     aNesP := 0;

    aNesMg := FieldByName('Mg�f�f�s����').asFloat ;
    aNespH := FieldByName('pH�f�f�s����').asFloat ;





    aNesNo := 1;
//    if aNespH > 0 then begin
//pH�@�S�D�O�ȉ��́A�^���J�������߂��Ȃ��B
{
       if (pH < 4.0) and (P >= 50.0) and (SekkaiKudo >= 4.1) then begin
           //��y�^���J���{�p
        aCode := '020';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH�f�f�s����').asFloat; // * 10.0 / 1000.0;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat := btmp;

        DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
        //�y����ǎ��ޗʂ��琬����

        aNesMg := aNesMg - aVolMg ; //��y����K�v�ʂ��猸�Z
        aNespH := 0 ;
        INC(aNesNo);
       end
}
       if pH < 4.75 then  begin  // pH < �ڕW�l

           if PrintModule1.ADOQueryUketuke.FieldByName('�P�C�_').asFloat <= 0 then begin
              //�y��̎�ނɂ��]�J���K�v�ʂ��Z�o
              FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := '070';
              FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat := GetKeiCal(QueryUketuke.FieldByName('�y��R�[�h').asString);
           end else begin
              //�P�C�_�l�ɂ��]�J���K�v�ʂ��Z�o
              FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := '070';
              FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat := GetKeiCal(QueryUketuke.FieldByName('�P�C�_').asFloat,QueryUketuke.FieldByName('�y��R�[�h').asString);
           end;
           INC(aNesNo);
       end
       else if (4.75 < pH) and (pH < 6.0) then begin
    //������
       id := 1;
       ids := 1;

       dcode := PrintModule1.ADOQueryUketuke.FieldByName('�y���R�[�h').asString;
       if dcode <> '' then id := Strtoint(dcode);
       dscode := PrintModule1.ADOQueryUketuke.FieldByName('���A�R�[�h').asString;
       if dscode <> '' then ids := Strtoint(dscode);

       if id > 7 then id := 7;
       if ids > 3 then ids := 3;


       btmp := (4.75 - 4.5) * Ro[id,ids];
       btmp2 := (pH - 4.5) * Ro[id,ids];
       btmp := (btmp2 - btmp) * 0.92;

       FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := '100';
       FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat := btmp;
       end;

    //�ȉ��@��y���s�����Ă����ꍇ�H



  end;
end;
{  ****************************************************************************
  //1-2-1���̑��y���ގZ�o
}
procedure CalDokai1;
var
  aVolP,aVolMg,aVolpH : double; //�֐��Z�o�l
  aNesP,aNesMg,aNespH : double ; //�K�v��
  aNesNo : integer ;
  aCode : string ;
  btmp : double;
{ �f�f�s���ʂ̗L���Ŏ{��ޗ����Ⴂ�A�ȉ��̑g�ݍ��킹�ɂ��v�Z������������
      |    Mg>0     |    Mg=0     |
      | pH>0 | pH=0 | pH>0 | pH=0 |
  P>0 |  �@  |  �A  |  �B  |  �C  |
  P=0 |  �D  |  �E  |  �F  |  �G  |
}
begin
  //�v�Z�p�s���ʂ�ݒ�  //NISHI0527
  with PrintModule1.ADOQuerySindan do begin
    aNesP  := FieldByName('P�f�f�s����').asFloat ;
    aNesMg := FieldByName('Mg�f�f�s����').asFloat ;
    aNespH := FieldByName('pH�f�f�s����').asFloat ;
    aNesNo := 1 ; //�Z�o���ޔԍ�
    while true do begin
      //�G�S�ĕK�v�����Ȃ�Όv�Z�I��
      if (aNesP <= 0 ) and ( aNesMg <= 0 ) and ( aNespH <= 0 ) then
        break;
      //�@�S�ĕK�v�ȏꍇ : P���悤���ŎZ�o
{
      if (aNesP > 0)and(aNesMg > 0)and(aNespH > 0) then begin
        aCode := '030';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNespH := aNespH - aVolpH ; //�A���J������K�v�ʂ��猸�Z
        aNesMg := aNesMg - aVolMg ; //��y����K�v�ʂ��猸�Z
        aNesP := 0 ;
      end
}
      //�AP,Mg���K�v�̏ꍇ : P���_�u�����Ő�ɎZ�o
      if (aNesP > 0)and(aNesMg > 0)and(aNespH <= 0) then begin
        aCode := '040';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNesMg := aNesMg - aVolMg ; //��y����K�v�ʂ��猸�Z
        aNesP := 0 ;
      end
      //�BP�ApH���K�v�̏ꍇ : pH���^���J��,P���ߐ΂ŎZ�o
      else if (aNesP > 0)and(aNespH > 0) then begin
        aCode := '010';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH�f�f�s����').asFloat;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat := btmp;
//        btmp := DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
//        aNesMg := aNesMg - aVolMg ; //��y����K�v�ʂ��猸�Z

        aNespH := 0 ;
      end
      //�CP���K�v�̏ꍇ : P���ߐ΂ŎZ�o
      else if (aNesP > 0) then begin
        aCode := '050';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdP, aNesP, aVolP,aVolMg,aVolpH);
        aNesP := 0 ;
      end
      //�@,�DMg,pH���K�v�ȏꍇ : pH����y�Y�J���ŎZ�o  //1-2-1-1
      else if (aNesMg > 0)and(aNespH > 0) then begin
        aCode := '020';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        btmp := FieldByName('pH�f�f�s����').asFloat;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat := btmp;

        DokaiVolume(aCode, btmp, aVolP,aVolMg,aVolpH);
//H150916                MakeDokaiVolume(aCode, sdpH, aNespH, aVolP,aVolMg,aVolpH);
        //�y����ǎ��ޗʂ��琬����



        aNesMg := aNesMg - aVolMg ; //��y����K�v�ʂ��猸�Z
        aNespH := 0 ;
      end
      //�B,�FpH���K�v�ȏꍇ : pH��Y�J���ŎZ�o
      else if (aNesMg <= 0)and(aNespH > 0) then begin
        aCode := '010';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat := aNespH;
//        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
//                MakeDokaiVolume(aCode, sdpH, aNespH, aVolP,aVolMg,aVolpH);
        aNespH := 0 ;
      end
      //�@,�A,�D,�EMg�݂̂̕K�v : Mg�𗰎_��y�ŎZ�o
      else if (aNesP <= 0)and(aNesMg > 0)and(aNespH <= 0) then begin
        aCode := '060';
        FieldByName('�y���ރR�[�h'+InttoStr(aNesNo)).asString := aCode ;
        FieldByName('�y���ޗ�'+InttoStr(aNesNo)).asFloat :=
                MakeDokaiVolume(aCode, sdMg, aNesMg, aVolP,aVolMg,aVolpH);
        aNesMg := 0 ;
      end;
      INC(aNesNo);  //�K���ǂꂩ�Z�o�����͂�
    end;
 end;
end;
   ////NISHI0525 �y����ǎ��ރ��C��
   //H171109 ��c���y�@�y����ǎ��ޕύX
var
  cnt : integer ;
//  stmp : String;
begin


{
  QueryUketuke.SQL.Text := 'Select T_UKETUKE.*,M_HOJOU.�y��R�[�h,M_HOJOU.�y���R�[�h,M_HOJOU.���A�R�[�h '+
    'from T_UKETUKE INNER JOIN M_HOJOU '+
   	'ON  (T_UKETUKE.�ޏ�ԍ� = M_HOJOU.�ޏ�ԍ�) where T_UKETUKE.�폜�t���O<>True and  �T���v���ԍ� = '''+PrintModule1.QueryUketuke.FieldByName('�T���v���ԍ�').asString + '''';
  QueryUketuke.Open;
  QuerySindan.Open;
}





//�f�f�̃T���v���ԍ����`�F�b�N
//   stmp := QueryUketuke.FieldByName('�T���v���ԍ�').asString;
//   showMessage( stmp );
//   stmp := QuerySindan.FieldByName('�T���v���ԍ�').AsString;
//   showMessage( stmp );

//  while not QueryUketuke.eof do begin
    if not SetKijunRec then begin
      showmessage('��l�}�X�^�ɑ��݂��܂���B');

//      continue ;
    end;
    with PrintModule1.ADOQuerySindan do  begin
      if RecordCount = 0 then begin
        Append;
        FieldByName('�T���v���ԍ�').asString := PrintModule1.ADOQueryUketuke.FieldByName('�T���v���ԍ�').asString ;
        FieldByName('�ҏW��').asDateTime := now ; {Version 0.6 #19 }
      end else
        Edit;
      //�Z�o���ڃN���A
      for cnt := 1 to 5 do begin
        FieldByName('�y���ރR�[�h'+InttoStr(cnt)).Clear ;
        FieldByName('�y���ޗ�'+InttoStr(cnt)).Clear ;
      end;
      //�y���ގZ�o

      if IsKusa then begin
         if PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h').AsString <> '01' then
              CalDokai3   //
         else
              CalDokai3_2 //�����E�X�V�̏ꍇ
      end
      else if IsIne then begin
         //���y�̏ꍇ�@�]�P���́@�Z�o���Ȃ�
         if (PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h').AsString = '04') or
            (PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h').AsString = '05') or
            (PrintModule1.ADOQueryUketuke.FieldByName('�앨�R�[�h').AsString = '06')
            then begin
            CalDokai2_1   //���c�y���ގZ�o
         end
         else begin
            CalDokai2   //���c�y���ގZ�o
         end;
      end
      else begin
         CalDokai1;  //���̑��y���ގZ�o
      end;

      Post;    //�����|�X�g
    end;
//h150909    QueryUketuke.Next;
//    Application.ProcessMessages ;
//    if not NextProgress then break;
//  end;    //while
  QuerySindan.Close;
  QueryUketuke.Close;
  QueryKijun.Close;
//
end; //CalcDojou END
procedure TSindanForm.CalcDojouAuto ;
begin
//
end;
//========================================================================
//  ��l�̃��R�[�h�Z�b�g
//========================================================================
function TSindanForm.SetKijunRec: Boolean ;
var
//  aBuff,
  DosituCode : string ;
  dcode : String;
begin
  IsKusa := PrintModule1.ADOQueryUketuke.FieldByName('��ڃR�[�h').asString = BokusouCode ;
  IsIne := PrintModule1.ADOQueryUketuke.FieldByName('��ڃR�[�h').asString = SuitouCode ;

  //A.Nishimura �ΎR���y�̔���
  dcode :=  PrintModule1.ADOQueryUketuke.FieldByName('M_HOJOU.�y��R�[�h').asString;

  case Strtoint(Copy( dcode,1,1)) of
  1,4:  DosituCode := '2';
  2:     DosituCode := '3';
  3:     DosituCode := '1';
  end;
  IsKazan := DosituCode = '1'; //�ΎR���y


  //��lCEC 0�`10 ���̃^�C�v�𔻒� A,B,C
  typCEC := Get_CEC_ABC(PrintModule1.ADOQueryUketuke);


(*
  //���n�̏ꍇ�Ɖ��|�ɕ�����
  if IsKusa then begin
      if dcode = '' then dcode := '10';
      typCEC := 'A';
      case Strtoint( dcode ) of
        31: typCEC := 'A';
        32: typCEC := 'B';
        33: typCEC := 'C';
      end;
  end
  else begin    //���n�ȊO
      //CEC���ǂ̊�l{A,B,C}���̗p���邩
      if QueryUketuke.FieldByName('CEC').asFloat <= 10.0 then  typCEC := 'A'
      else
      if QueryUketuke.FieldByName('CEC').asFloat <= 20.0 then  typCEC := 'B'
      else                                                     typCEC := 'C' ;
  end;
*)

  //��c�a�̃��R�[�h�ړ�
  result := Set_Kijun_Rec( PrintModule1.ADOQueryUketuke, PrintModule1.ADOQueryKijun ) > 0;





end;


procedure TSindanForm.QuerySindanorgBeforePost(DataSet: TDataSet);
begin
  //������邽�тɌv�Z���������݂���̂ŌĂ΂��B�i��O�ɂ��ēK�p���Ȃ��H�j
  //���A���̎��ɍ��� ( �f�f�s���ʁA�y���ރR�[�h ) ���ݒ肳�����e������̂Ŏc�������Ȃ��B
//	DataSet.FieldByName('�ҏW��').asDateTime := now ;
  //�d�l��G���g���[���ڂłȂ��̂œ����ΏۂɂȂ�Ȃ��Ƃ݂Ȃ�
end;
{
  �w��y���ނɂ��K�v�ʎZ�o�Ƒ��擾�����̎Z�o
  aCode: �y���ރR�[�h
  aType: �v�Z�Ώې��� Set of (sdP,sdMg,sdpH)
  aValue:�K�v��
  pVolP,pVolMg,pVolpH : �Z�o��
  result : �w�萬���̎Z�o��
}
function TSindanForm.MakeDokaiVolume( aCode: string ; aType : TsDokai; aValue : double;
      var pVolP: double; var pVolMg: double; var pVolpH: double): double;
var aVol :double ;

begin
  aVol := 0 ;
  with QueryDokaizai do begin
    SQL.Text := 'Select * from M_DOKAIZAI where �R�[�h='''+aCode+'''';
    Open;
    case aType of
    sdP: aVol := aValue / FieldByName('�����_').asFloat * 100 ;
    sdMg:aVol := aValue / FieldByName('��y').asFloat * 100 ;
    sdpH:aVol := aValue / FieldByName('�A���J����').asFloat * 100 ;
    end;
    //�K�v�ʂ��Z�o�セ�̑��̐����̗ʂ��v�Z
    if    FieldByName('�����_').asFloat = 0 then pVolP := 0
    else  pVolP := aVol * FieldByName('�����_').asFloat / 100 ;
    if    FieldByName('��y').asFloat = 0 then pVolMg := 0
    else  pVolMg := aVol * FieldByName('��y').asFloat / 100 ;
    if    FieldByName('�A���J����').asFloat = 0 then pVolpH := 0
    else  pVolpH := aVol * FieldByName('�A���J����').asFloat / 100 ;
    Close;
  end;
  result := aVol ;
end;

//���ޗʂ��琬���ʂ��Z�o
// aValue  ���ޗ�
function TSindanForm.DokaiVolume( aCode: string ; aValue : double;
      var pVolP: double; var pVolMg: double; var pVolpH: double): double;
var aVol :double ;

begin
//  aVol := 0 ;
  with PrintModule1.ADOQueryDokaizai do begin
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
    Close;
  end;
  result := aVol ;
end;

procedure TSindanForm.StringGrid1Click(Sender: TObject);
begin

end;
{
  �\���̎��Ώۈꗗ��\������
}
procedure TSindanForm.FormShow(Sender: TObject);
var  RowCnt : integer ;
var stmp : String;
begin


  FRes := False ;

    if EMode.Text = '�y��' then begin
       with StringGrid1 do begin
         Cells[ 0, 0 ] := '����NO' ;
         ColWidths[0] := 80;
         Cells[ 1, 0 ] := '��tNO';
         ColWidths[1] := 80;
         Cells[ 2, 0 ] := '�̎�ꏊ';
         ColWidths[2] := 128;
         Cells[ 3, 0 ] := '�앨��';
         ColWidths[3] := 128;
         Cells[ 4, 0 ] := '���';
         ColWidths[4] := 32;
       end;
       //�󂯕t���Ώۃ��R�[�h : ��ʕ\�����Ȃ��Ōv�Z���\�b�h�Ăяo���ꍇ���̎��_��SQLCondition���K�p�����B
       MakeSQL;
    end
    else if EMode.Text = '�͔�' then begin

    end
    else if EMode.Text = '����' then begin

    end;


  with ADOQuery1 do begin


{
    if EMode.Text = '�f�f�[' then begin
       SQLCondition := SQLCondition + ' and ((�o�͒����y�� = True) or (�o�͒����{�� = True))';
    end
    else if EMode.Text = '���͒l�̂�' then begin
       SQLCondition := SQLCondition + ' and (�o�͒������͂̂� = True)';

    end;


    if JFukyuu = True then begin
       SQLCondition := SQLCondition + ' and (�{�l�T�C�� = True)';
    end;
}   SQL.Clear;

    if EMode.Text = '�y��' then begin


//2018.12.26�C��


      stmp := 'Select T_BUNSEKI6.*,M_SAKUMOTU.* '+
        'from T_BUNSEKI6 LEFT OUTER JOIN M_SAKUMOTU '+
   	'ON  (T_BUNSEKI6.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h) '+
        'where ' + SQLCondition +
        ' ORDER BY T_Bunseki6.����NO' ;




 {
      stmp := 'SELECT T_uketuke.�T���v���ԍ�, M_hojou.�ޏꖼ, M_nouka.�_�Ɩ�,M_nouka.�_�Ɣԍ�,M_nouka.�W�c, M_sakumotu.�앨��, M_sakugata.��^�� ' +
        'FROM T_UKETUKE T_uketuke ' +
        'INNER JOIN M_HOJOU M_hojou '+
        'ON  (T_uketuke.�ޏ�ԍ� = M_hojou.�ޏ�ԍ�) '+
        'INNER JOIN M_SAKUGATA M_sakugata '+
        'ON  (T_uketuke.��ڃR�[�h = M_sakugata.��ڃR�[�h) '+
        'AND  (T_uketuke.�앨�R�[�h = M_sakugata.�앨�R�[�h) '+
        'AND  (T_uketuke.��^�R�[�h = M_sakugata.��^�R�[�h) '+
        'INNER JOIN M_SAKUMOTU M_sakumotu '+
        'ON  (T_uketuke.��ڃR�[�h = M_sakumotu.��ڃR�[�h) '+
        'AND  (T_uketuke.�앨�R�[�h = M_sakumotu.�앨�R�[�h) '+
        'INNER JOIN M_NOUKA M_nouka '+
        'ON  (M_hojou.�_�Ɣԍ� = M_nouka.�_�Ɣԍ�) '+
        'Where T_uketuke.�폜�t���O<>True and ' +
        SQLCondition + SQLCondition2;
 }




//    ' ORDER BY T_uketuke.�T���v���ԍ�' ;
    SQL.Text := stmp;

      {Version 0.6 #26 �폜�t���O�ǉ�}
      Open;
      RowCnt := 1 ;
      while not Eof do begin
        with StringGrid1 do begin
          RowCount := RowCnt + 1 ;
          Cells[ 0, RowCnt ] := FieldByName('����NO').asString ;
          Cells[ 1, RowCnt ] := FieldByName('��tNO').asString;
          Cells[ 2, RowCnt ] := FieldByName('�̎�ꏊ').asString;
          Cells[ 3, RowCnt ] := FieldByName('M_SAKUMOTU.�앨��').asString;
          Cells[ 5, RowCnt ] := '1';



        end;
        Next ;
        INC(RowCnt);
      end;
      StringGrid1.FixedRows := 1 ;
    end
    else if EMode.Text = '�͔�' then begin
    end
    else if EMode.Text = '����' then begin


    end;

    close;
  end;
end;

procedure TSindanForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TSindanForm.btnPreviewClick(Sender: TObject);
var
  aCnt : integer ;
  aBuff : string ;
begin
  aBuff := '';
  for aCnt := 1 to StringGrid1.rowcount -1 do begin
    if (StringGrid1.Cells[0,aCnt] <> '' ) and (StringGrid1.Cells[5,aCnt] = '1') then begin
      if aBuff <> '' then aBuff := aBuff + ',' ;
      aBuff := aBuff + ''''+ StringGrid1.Cells[0,aCnt] + '''';
    end;
  end;
  if aBuff = '' then begin
    ShowMessage('����Ώۂ��O���ł��B');
    exit ; //��������O
  end;

  {�I������SQLCondition�ɍĐݒ肵�ĕ���}
  SQLCondition := '����NO in ('+ aBuff +')';
  MakeSQL2;       //��ʂŎw�肵��������SQL�쐬
  FRes  := True;
  Close;
end;

procedure TSindanForm.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
	if (ACol=5) and (not(gdFixed in State)) then begin
		StringGrid1.Canvas.FillRect(Rect);   //�e�L�X�g�̔w�i�F�ŏ���
		StringGrid1.Canvas.Pen.Color := clBtnHighlight;
		StringGrid1.Canvas.Polyline([Point(Rect.Left, Rect.Bottom), Rect.TopLeft,
			Point(Rect.Right, Rect.Top)]);
		StringGrid1.Canvas.Pen.Color := clBtnShadow;
		StringGrid1.Canvas.Polyline([Point(Rect.Left, Rect.Bottom),
			Rect.BottomRight, Point(Rect.Right, Rect.Top)]);
		if StringGrid1.Cells[aCol,aRow] = '1' then begin
			StringGrid1.Canvas.Draw(Rect.Left+2, Rect.Top+2, Image1.Picture.Bitmap);
		end else begin
			StringGrid1.Canvas.Draw(Rect.Left+2, Rect.Top+2, Image2.Picture.Bitmap);
    end;
  end;

end;

procedure TSindanForm.btnCancelClick(Sender: TObject);
var aCnt : integer ;
begin
  for aCnt := 1 to StringGrid1.rowcount -1 do begin
    if StringGrid1.Cells[0,aCnt] <> '' then
      StringGrid1.Cells[5,aCnt] := '0' ;
  end;
end;

procedure TSindanForm.btnAllClick(Sender: TObject);
var aCnt : integer ;
begin
  for aCnt := 1 to StringGrid1.rowcount -1 do begin
    if StringGrid1.Cells[0,aCnt] <> '' then
      StringGrid1.Cells[5,aCnt] := '1' ;
  end;
end;

procedure TSindanForm.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow : integer ;
begin
  StringGrid1.MouseToCell(X,Y, ACol, ARow);
  if (ACol = 5 )and( ARow>0 )and ( StringGrid1.Cells[0,ARow] <> '' ) then begin
    if StringGrid1.Cells[5,ARow] = '1' then
      StringGrid1.Cells[5,ARow] := '0'
    else
      StringGrid1.Cells[5,ARow] := '1';
  end;
end;

end.

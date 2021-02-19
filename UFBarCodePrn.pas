unit UFBarCodePrn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,ComObj, Db, DBTables;

type
  TFBarCodePrn = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtCan: TButton;
    Label1: TLabel;
    ESno: TEdit;
    Label2: TLabel;
    BtJikkou: TButton;
    Label3: TLabel;
    Q1: TQuery;
    Label4: TLabel;
    Es: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Ee: TEdit;
    Ec: TEdit;
    Ch1: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Shape1: TShape;
    Label15: TLabel;
    Label16: TLabel;
    Shape2: TShape;
    Label17: TLabel;
    Shape3: TShape;
    Label18: TLabel;
    Shape4: TShape;
    Label19: TLabel;
    Shape5: TShape;
    Label20: TLabel;
    Shape6: TShape;
    Label21: TLabel;
    Shape7: TShape;
    Label22: TLabel;
    Shape8: TShape;
    Label23: TLabel;
    Shape9: TShape;
    Label24: TLabel;
    Shape10: TShape;
    Label25: TLabel;
    Shape11: TShape;
    Label26: TLabel;
    Shape12: TShape;
    Label27: TLabel;
    Shape13: TShape;
    Label28: TLabel;
    Shape14: TShape;
    Label29: TLabel;
    Shape15: TShape;
    Label30: TLabel;
    Shape16: TShape;
    Label31: TLabel;
    Shape17: TShape;
    Label32: TLabel;
    Shape18: TShape;
    Label33: TLabel;
    Shape19: TShape;
    Label34: TLabel;
    Shape20: TShape;
    Label35: TLabel;
    Shape21: TShape;
    Shape22: TShape;
    Label36: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtCanClick(Sender: TObject);
    procedure BtJikkouClick(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
  end;

var
  FBarCodePrn: TFBarCodePrn;

implementation

uses DMU;


{$R *.DFM}

procedure TFBarCodePrn.FormShow(Sender: TObject);
begin
	Color := BackColor ;

end;

procedure TFBarCodePrn.BtCanClick(Sender: TObject);
begin
    Close;
end;

procedure TFBarCodePrn.BtJikkouClick(Sender: TObject);
var
excel : Variant;
i, j : Integer;
stmp : String;
sno : Integer;
ies, iee : Integer;
count, ecount : Integer;
flg : Integer;
begin

  if Es.Text = '' then begin
      ShowMessage('�p���J�n�ʒu�i�c�j����͂��Ă��������B' );
      exit;
  end;

  ies := StrtoInt( Es.Text );

  if (ies < 1) or (ies > 5 ) then begin
      ShowMessage('�p���J�n�ʒu�i�c�j���K�؂Ȑ��l�ł͂���܂���B' );
      exit;
  end;



  if Ee.Text = '' then begin
      ShowMessage('�p���J�n�ʒu�i���j����͂��Ă��������B' );
      exit;
  end;

  iee := StrtoInt( Ee.Text );
  if (iee < 1) or (iee > 4 ) then begin
      ShowMessage('�p���J�n�ʒu�i���j���K�؂Ȑ��l�ł͂���܂���B' );
      exit;
  end;


  if ESno.Text = '' then begin
      ShowMessage('�T���v���ԍ�����͂��Ă��������B' );
      exit;
  end;

  sno := StrtoInt( ESno.Text );

  if Ec.Text = '' then begin
      ShowMessage('�o�͐�����͂��Ă��������B' );
      exit;
  end;
  ecount := StrtoInt( Ec.Text );


  try
     excel := CreateOleObject('Excel.Application');
  except
      ShowMessage('Excel���N���ł��܂���');
      exit;
  end;


  Q1.Close;
  Q1.DatabaseName := 'DOJO';
//  Q1.DatabaseName := DataPath;
    stmp :=
		'SELECT T_UKETUKE.*,'+
		'M_HOJOU.�_�Ɣԍ�, M_HOJOU.�ޏꖼ,M_HOJOU.�y��R�[�h,'+
		'M_NOUKA.*,'+
		'M_CITY.�s������, M_TIKU.�n�於,'+
		'M_DOJOU.�y�떼, M_DOSEI.�y����, M_FUSHOKU.���A��,'+
                'M_DOJOU.����y��R�[�h,M_DOJOU.���q�y��R�[�h,'+
                'M_city.�W���n�ы敪, M_city.����n�ы敪, '+
                 //		'M_DOJOU.�y�떼, M_DOSEI.�y����,'+
		'M_sakumotu.�앨��, M_sakugata.��^��,'+
                'M_zsakumotu.�앨�� �O�앨�� '+ //, M_zsakugata.��^�� �O��^�� '+
		'FROM T_UKETUKE INNER JOIN M_HOJOU '+
   	'ON  (T_UKETUKE.�ޏ�ԍ� = M_HOJOU.�ޏ�ԍ�)'+
   	'LEFT OUTER JOIN "M_SAKUMOTU.db" M_sakumotu '+
   	'ON  (T_UKETUKE.��ڃR�[�h = M_sakumotu.��ڃR�[�h)'+
   	'AND  (T_UKETUKE.�앨�R�[�h = M_sakumotu.�앨�R�[�h)'+
   	'LEFT OUTER JOIN "M_SAKUGATA.db" M_sakugata '+
    'ON  (T_UKETUKE.��ڃR�[�h = M_sakugata.��ڃR�[�h)'+
    'AND  (T_UKETUKE.�앨�R�[�h = M_sakugata.�앨�R�[�h)'+
    'AND  (T_UKETUKE.��^�R�[�h = M_sakugata.��^�R�[�h)'+
    'LEFT OUTER JOIN "M_SAKUMOTU.db" M_zsakumotu '+
    'ON  (T_UKETUKE.�O��ڃR�[�h = M_zsakumotu.��ڃR�[�h)'+
    'AND  (T_UKETUKE.�O�앨�R�[�h = M_zsakumotu.�앨�R�[�h)'+
//    'AND  (T_UKETUKE.�O��^�R�[�h = M_zsakugata.��^�R�[�h)'+
    'LEFT OUTER JOIN M_DOJOU '+
    'ON  (M_HOJOU.�y��R�[�h = M_DOJOU.�y��R�[�h)'+
    'LEFT OUTER JOIN M_DOSEI '+
    'ON  (M_HOJOU.�y���R�[�h = M_DOSEI.�y���R�[�h)'+
    'LEFT OUTER JOIN M_FUSHOKU '+
    'ON  (M_HOJOU.���A�R�[�h = M_FUSHOKU.���A�R�[�h)'+
    'INNER JOIN M_NOUKA '+
    'ON  (M_HOJOU.�_�Ɣԍ� = M_NOUKA.�_�Ɣԍ�)'+
    'INNER JOIN M_CITY '+
    'ON  (M_HOJOU.�s�����R�[�h = M_CITY.�s�����R�[�h)'+
    'INNER JOIN M_TIKU '+
    'ON  (M_HOJOU.�s�����R�[�h = M_TIKU.�s�����R�[�h)'+
    'AND  (M_HOJOU.�n��R�[�h = M_TIKU.�n��R�[�h)'+
        {Version 0.6 #26 �폜�t���O�ǉ�}
    ' WHERE (T_UKETUKE.�폜�t���O<>True) ';

 if Ch1.Checked then begin
     stmp := stmp + 'and (�i����t = "")'+
    ' ORDER by �T���v���ԍ�' ;
 end
 else begin
     stmp := stmp + ' ORDER by �T���v���ԍ�' ;

 end;
  Q1.SQL.Clear;
  Q1.SQL.Add( stmp );
  Q1.Open;

  stmp := FormatFloat( '0000', sno );
  if not Q1.Locate('�T���v���ԍ�', stmp,[] ) then begin

        Q1.FindFirst;
        stmp := Q1.FieldByName('�T���v���ԍ�').AsString;
        sno := StrtoInt( stmp );
        //      ShowMessage('�J�n�T���v��������܂���B');
//      Q1.Close;
//      exit;
  end;

  //�\��
  excel.Visible := True;

 // �ۑ��̊m�F���o���Ȃ��悤�ɂ���
  excel.DisplayAlerts := False;
  //�I�[�v��
  excel.Application.Workbooks.open(AppPath+'\�o�[�R�[�h�d�l.xls');

  count := 1;
  for j := 1 to 4 do begin
    for i := 1 to 5 do begin
//      sno := sno + 1;
      flg := 0;
      if ecount < count then begin
         flg := 0;
      end
      else if ( j = iee ) and ( i >= ies ) then begin
          flg := 1;
      end
      else if (j > iee) then begin
          flg := 1;
      end;


      if flg = 1 then begin
         stmp := EntryCenterNo+EntryYear+Q1.FieldbyName('�T���v���ԍ�').AsString;
         excel.ActiveSheet.Cells[2+(i-1)*6, 2+(j-1)*4].value := '*'+stmp+'*';
         stmp := EntryCenterNo+'-'+EntryYear+'-'+Q1.FieldbyName('�T���v���ԍ�').AsString;
         excel.ActiveSheet.Cells[3+(i-1)*6, 2+(j-1)*4].value := stmp;

         excel.ActiveSheet.Cells[4+(i-1)*6, 2+(j-1)*4].value := Q1.FieldbyName('�_�Ɩ�').AsString;
         excel.ActiveSheet.Cells[5+(i-1)*6, 2+(j-1)*4].value := Q1.FieldbyName('�앨��').AsString;
         excel.ActiveSheet.Cells[6+(i-1)*6, 2+(j-1)*4].value := Q1.FieldbyName('���͍���').AsString;
         count := count + 1;

         if not Q1.FindNext then count := ecount+ 1;
      end
      else  begin
         excel.ActiveSheet.Cells[2+(i-1)*6, 2+(j-1)*4].value := '';
         excel.ActiveSheet.Cells[3+(i-1)*6, 2+(j-1)*4].value := '';
         excel.ActiveSheet.Cells[4+(i-1)*6, 2+(j-1)*4].value := '';
         excel.ActiveSheet.Cells[5+(i-1)*6, 2+(j-1)*4].value := '';
         excel.ActiveSheet.Cells[6+(i-1)*6, 2+(j-1)*4].value := '';
      end;
    end;
  end;




end;

end.

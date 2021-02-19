unit SUketukeU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, ExtCtrls, Grids, DBGrids, Buttons, ADODB, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ComCtrls;

type
  TfrmSUketuke = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    ds1: TDataSource;
    GroupBox1: TGroupBox;
    Button1: TButton;
    btnClose: TBitBtn;
    BitBtn1: TBitBtn;
    ELocateNo: TEdit;
    EMode: TEdit;
    ADOQuery1: TADOQuery;
    ADOQkumiai: TADOQuery;
    dskumiai: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    ADODummy: TADOTable;
    DDummy: TDataSource;
    GroupBox2: TGroupBox;
    BtNoKen: TButton;
    Button4: TButton;
    DateTimePicker2: TDateTimePicker;
    DBEdit2: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    DBEdit7: TDBEdit;
    Label1: TLabel;
    LCount: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtNoKenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Private �錾 }
    FNO : string ;
    procedure LocateNO(pLocNO: string);
  public
    { Public �錾 }
  end;

var
  frmSUketuke: TfrmSUketuke;
function DspUkeList(pLocNO : string; mode : String) : string ;

implementation

uses SNoukaU, DMU;

const sSQL = 'SELECT T_UKETUKE6.��t�A��, T_UKETUKE.��t�N���� '+
   'FROM T_UKETUKE6 '+
   'LEFT OUTER JOIN M_NOUKYOU '+
   'ON  (T_UKETUKE6.�g���ԍ� = M_NOUKYOU.�g���ԍ�) ';
        {Version 0.6 #26 �폜�t���O�ǉ�}
// INNER JOIN �� LEFT OUTER JOIN

{$R *.DFM}
{
  ��t�������
  IN:pLocNO : �ꗗ����ʒu�����T���v���ԍ�
  result : �I�������ԍ�
}
function DspUkeList(pLocNO : string; mode : String ) : string ;
begin
  Application.CreateForm(TfrmSUketuke, frmSUketuke);

  frmSUketuke.ELocateNo.Text := pLocNO;
  frmSUketuke.EMode.Text := mode;
//  frmSUketuke.LocateNO(pLocNO) ;
  frmSUketuke.ShowModal ;
  result := frmSUketuke.FNO ;
  frmSUketuke.Release ;
end;
procedure TfrmSUketuke.FormCreate(Sender: TObject);
var
stmp : String;
begin
	Color := BackColor ;


end;
{�ʒu����}
procedure TfrmSUketuke.LocateNO(pLocNO : string );
begin
  if pLocNO <> '' then
    ADOQuery1.Locate('��t�A��',pLocNO,[]);
end;

procedure TfrmSUketuke.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOQuery1.Close;
end;
//�_�ƍi�荞��
procedure TfrmSUketuke.Button1Click(Sender: TObject);
var stmp : string ;
code : string;
begin
	//NoukaCD := DBLookupComboBox1.Text ;

  ADOQuery1.Close;

  code := DDummy.DataSet.FieldByName('�R�[�h3').AsString;




        if EMode.Text = '6' then begin

         stmp :=
          'SELECT T_UKETUKE6.��t�A��, T_UKETUKE6.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g���� '+
          'FROM (T_UKETUKE6 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE6.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'where M_NOUKYOU.�g���ԍ� = '''+code + ''' '+
          'order by ��t�A��';

        end
        else if EMode.Text = '1' then begin

         stmp :=
          'SELECT T_UKETUKE1.��t�A��, T_UKETUKE1.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE1 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE1.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE1.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where M_NOUKYOU.�g���ԍ� = '''+code + ''' '+
          'order by ��t�A��';

        end
        else if EMode.Text = '2' then begin

         stmp :=
          'SELECT T_UKETUKE2.��t�A��, T_UKETUKE2.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE2 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE2.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE2.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where M_NOUKYOU.�g���ԍ� = '''+code + ''' '+
          'order by ��t�A��';

        end
        else if EMode.Text = '3' then begin

         stmp :=
          'SELECT T_UKETUKE3.��t�A��, T_UKETUKE3.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE3 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE3.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE3.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where M_NOUKYOU.�g���ԍ� = '''+code + ''' '+
          'order by ��t�A��';

        end
        else if EMode.Text = '4' then begin

         stmp :=
          'SELECT T_UKETUKE4.��t�A��, T_UKETUKE4.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE4 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE4.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE4.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where M_NOUKYOU.�g���ԍ� = '''+code + ''' '+
          'order by ��t�A��';

        end
        else if EMode.Text = '5' then begin

         stmp :=
          'SELECT T_UKETUKE5.��t�A��, T_UKETUKE5.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE5 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE5.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE5.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where M_NOUKYOU.�g���ԍ� = '''+code + ''' '+
          'order by ��t�A��';

        end
        else if EMode.Text = '7' then begin

         stmp :=
          'SELECT T_UKETUKE7.��t�A��, T_UKETUKE7.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE7 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE7.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE7.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where M_NOUKYOU.�g���ԍ� = '''+code + ''' '+
          'order by ��t�A��';

        end
        else begin  //8

         stmp :=
          'SELECT T_UKETUKE8.��t�A��, T_UKETUKE8.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE8 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE8.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE8.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where M_NOUKYOU.�g���ԍ� = '''+code + ''' '+
          'order by ��t�A��';

        end;






  ADOQuery1.SQL.Text := stmp;
         ADOQuery1.Open;


          stmp := inttoStr(ADOQuery1.RecordCount);
        LCount.Caption := '�T���v����: '+stmp;



end;
//��������
procedure TfrmSUketuke.btnCloseClick(Sender: TObject);
begin
	Close;
end;

//�I��
procedure TfrmSUketuke.BitBtn1Click(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	FNO := ds1.DataSet.FieldByName('��t�A��').asString ;
  close;
end;

//�Z���N���b�N�A�^�O�Ȃ�I�[�_�[����
procedure TfrmSUketuke.DateTimePicker1Change(Sender: TObject);
begin

  	if not (DDummy.DataSet.State  in [dsEdit	,dsInsert]) then
    DDummy.DataSet.Edit ;


  DDummy.DataSet.FieldByName('���t�I��').asDatetime :=�@DateTimePicker1.Date;

end;

procedure TfrmSUketuke.DateTimePicker2Change(Sender: TObject);
begin
  	if not (DDummy.DataSet.State  in [dsEdit	,dsInsert]) then
    DDummy.DataSet.Edit ;


  DDummy.DataSet.FieldByName('���t�J�n').asDatetime :=�@DateTimePicker2.Date;

end;

procedure TfrmSUketuke.DBGrid1TitleClick(Column: TColumn);
begin
  with ADOQuery1 do begin
  	Close;
    SQL.Text := sSQL + ' order by ' + Column.FieldName;
    Open;
  end;

end;

procedure TfrmSUketuke.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if (Key in [VK_RETURN] ) then  Button1Click(self);

end;

procedure TfrmSUketuke.BtNoKenClick(Sender: TObject);
Var
   no : String;
   stime : string;
   etime : string;
   stmp : string;
   dtmp : TDatetime;

begin

  ADOQuery1.Close;

  DateTimetoString(stime,'#mm/dd/yyyy#',DDummy.DataSet.FieldByName('���t�J�n').AsDateTime);
  dtmp := StrtoDate('1900/1/1');

  if DDummy.DataSet.FieldByName('���t�J�n').AsDateTime < dtmp then begin

    showmessage('�J�n���t����͂��ĉ������B');
    exit;
  end;
  DateTimetoString(etime,'#mm/dd/yyyy#',DDummy.DataSet.FieldByName('���t�I��').AsDateTime);


  if DDummy.DataSet.FieldByName('���t�I��').AsDateTime < dtmp then begin

     etime := stime;

  end;


      if EMode.Text = '6' then begin


         stmp :=
          'SELECT T_UKETUKE6.��t�A��, T_UKETUKE6.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g���� '+
          'FROM (T_UKETUKE6 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE6.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
//          'where (T_UKETUKE6.��t�N���� > #12/10/2020#) '+
          'where (T_UKETUKE6.��t�N���� >= '+ stime + ') and (T_UKETUKE6.��t�N���� <= '+ etime + ') '+
//          'where (T_UKETUKE6.��t�N���� >= '+ stime + ') '+
          'order by ��t�A��';

      end
      else if EMode.Text = '1' then begin
         stmp :=
          'SELECT T_UKETUKE1.��t�A��, T_UKETUKE1.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE1 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE1.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE1.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where (T_UKETUKE1.��t�N���� >= '+ stime + ') and (T_UKETUKE1.��t�N���� <= '+ etime + ') '+
          'order by ��t�A��';

      end
      else if EMode.Text = '2' then begin
         stmp :=
          'SELECT T_UKETUKE2.��t�A��, T_UKETUKE2.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE2 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE2.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE2.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where (T_UKETUKE2.��t�N���� >= '+ stime + ') and (T_UKETUKE2.��t�N���� <= '+ etime + ') '+
          'order by ��t�A��';

      end
      else if EMode.Text = '3' then begin
         stmp :=
          'SELECT T_UKETUKE3.��t�A��, T_UKETUKE3.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE3 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE3.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE3.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where (T_UKETUKE3.��t�N���� >= '+ stime + ') and (T_UKETUKE3.��t�N���� <= '+ etime + ') '+
          'order by ��t�A��';

      end
      else if EMode.Text = '4' then begin
         stmp :=
          'SELECT T_UKETUKE4.��t�A��, T_UKETUKE4.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE4 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE4.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE4.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where (T_UKETUKE4.��t�N���� >= '+ stime + ') and (T_UKETUKE4.��t�N���� <= '+ etime + ') '+
          'order by ��t�A��';

      end
      else if EMode.Text = '5' then begin
         stmp :=
          'SELECT T_UKETUKE5.��t�A��, T_UKETUKE5.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE5 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE5.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE5.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where (T_UKETUKE5.��t�N���� >= '+ stime + ') and (T_UKETUKE5.��t�N���� <= '+ etime + ') '+
          'order by ��t�A��';

      end
      else if EMode.Text = '7' then begin
         stmp :=
          'SELECT T_UKETUKE7.��t�A��, T_UKETUKE7.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE7 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE7.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE7.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where (T_UKETUKE7.��t�N���� >= '+ stime + ') and (T_UKETUKE7.��t�N���� <= '+ etime + ') '+
          'order by ��t�A��';

      end
      else begin
         stmp :=
          'SELECT T_UKETUKE8.��t�A��, T_UKETUKE8.��t�N����, M_NOUKYOU.�g���ԍ�,M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE8 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE8.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE8.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'where (T_UKETUKE8.��t�N���� >= '+ stime + ') and (T_UKETUKE8.��t�N���� <= '+ etime + ') '+
          'order by ��t�A��';

      end;




  ADOQuery1.SQL.Text := stmp;
         ADOQuery1.Open;


                 stmp := inttoStr(ADOQuery1.RecordCount);
        LCount.Caption := '�T���v����: '+stmp;



end;


procedure TfrmSUketuke.FormShow(Sender: TObject);
var
stmp : String;
begin

	FNO := '';
//	Query1.SQL.Text := sSQL + ' order by �T���v���ԍ�';
         //INNER JOIN �� LEFT OUTER JOIN
  ADOQuery1.close;
  ADOQuery1.SQL.Clear;
    stmp := '';

        if EMode.Text = '6' then begin


         stmp :=
          'SELECT T_UKETUKE6.��t�A��, T_UKETUKE6.��t�N����, M_NOUKYOU.�g���� '+
          'FROM (T_UKETUKE6 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE6.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'order by ��t�A��';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;

        end
        else if EMode.Text = '1' then begin
         stmp :=
          'SELECT T_UKETUKE1.��t�A��, T_UKETUKE1.��t�N����, M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE1 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE1.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE1.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'order by ��t�A��';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;

        end
        else if EMode.Text = '2' then begin
         stmp :=
          'SELECT T_UKETUKE2.��t�A��, T_UKETUKE2.��t�N����, M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE2 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE2.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE2.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'order by ��t�A��';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;

        end
        else if EMode.Text = '3' then begin

         stmp :=
          'SELECT T_UKETUKE3.��t�A��, T_UKETUKE3.��t�N����, M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE3 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE3.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE3.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'order by ��t�A��';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;
        end
        else if EMode.Text = '4' then begin

         stmp :=
          'SELECT T_UKETUKE4.��t�A��, T_UKETUKE4.��t�N����, M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE4 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE4.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE4.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'order by ��t�A��';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;
        end
        else if EMode.Text = '3' then begin

         stmp :=
          'SELECT T_UKETUKE5.��t�A��, T_UKETUKE5.��t�N����, M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE5 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE5.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE5.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'order by ��t�A��';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;
        end
        else if EMode.Text = '7' then begin

         stmp :=
          'SELECT T_UKETUKE7.��t�A��, T_UKETUKE7.��t�N����, M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE7 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE7.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE3.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'order by ��t�A��';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;
        end
        else if EMode.Text = '8' then begin

         stmp :=
          'SELECT T_UKETUKE8.��t�A��, T_UKETUKE8.��t�N����, M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE8 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE8.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE8.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'order by ��t�A��';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;
        end
        else begin

         stmp :=
          'SELECT T_UKETUKE6.��t�A��, T_UKETUKE6.��t�N����, M_NOUKYOU.�g����, M_SAKUMOTU.�앨�� '+
          'FROM ((T_UKETUKE6 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE6.�g���ԍ� = M_NOUKYOU.�g���ԍ�)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE6.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h)) '+
          'order by ��t�A��';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;


        end;


  ADOQuery1.SQL.Add(stmp);
	ADOQuery1.Open;




        stmp := inttoStr(ADOQuery1.RecordCount);
        LCount.Caption := '�T���v����: '+stmp;

end;

end.

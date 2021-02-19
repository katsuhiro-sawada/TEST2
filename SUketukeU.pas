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
    { Private 宣言 }
    FNO : string ;
    procedure LocateNO(pLocNO: string);
  public
    { Public 宣言 }
  end;

var
  frmSUketuke: TfrmSUketuke;
function DspUkeList(pLocNO : string; mode : String) : string ;

implementation

uses SNoukaU, DMU;

const sSQL = 'SELECT T_UKETUKE6.受付連番, T_UKETUKE.受付年月日 '+
   'FROM T_UKETUKE6 '+
   'LEFT OUTER JOIN M_NOUKYOU '+
   'ON  (T_UKETUKE6.組合番号 = M_NOUKYOU.組合番号) ';
        {Version 0.6 #26 削除フラグ追加}
// INNER JOIN → LEFT OUTER JOIN

{$R *.DFM}
{
  受付検索画面
  IN:pLocNO : 一覧から位置だしサンプル番号
  result : 選択検索番号
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
{位置だし}
procedure TfrmSUketuke.LocateNO(pLocNO : string );
begin
  if pLocNO <> '' then
    ADOQuery1.Locate('受付連番',pLocNO,[]);
end;

procedure TfrmSUketuke.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOQuery1.Close;
end;
//農家絞り込み
procedure TfrmSUketuke.Button1Click(Sender: TObject);
var stmp : string ;
code : string;
begin
	//NoukaCD := DBLookupComboBox1.Text ;

  ADOQuery1.Close;

  code := DDummy.DataSet.FieldByName('コード3').AsString;




        if EMode.Text = '6' then begin

         stmp :=
          'SELECT T_UKETUKE6.受付連番, T_UKETUKE6.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名 '+
          'FROM (T_UKETUKE6 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE6.組合番号 = M_NOUKYOU.組合番号)) '+
          'where M_NOUKYOU.組合番号 = '''+code + ''' '+
          'order by 受付連番';

        end
        else if EMode.Text = '1' then begin

         stmp :=
          'SELECT T_UKETUKE1.受付連番, T_UKETUKE1.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE1 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE1.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE1.作物コード = M_SAKUMOTU.作物コード)) '+
          'where M_NOUKYOU.組合番号 = '''+code + ''' '+
          'order by 受付連番';

        end
        else if EMode.Text = '2' then begin

         stmp :=
          'SELECT T_UKETUKE2.受付連番, T_UKETUKE2.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE2 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE2.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE2.作物コード = M_SAKUMOTU.作物コード)) '+
          'where M_NOUKYOU.組合番号 = '''+code + ''' '+
          'order by 受付連番';

        end
        else if EMode.Text = '3' then begin

         stmp :=
          'SELECT T_UKETUKE3.受付連番, T_UKETUKE3.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE3 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE3.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE3.作物コード = M_SAKUMOTU.作物コード)) '+
          'where M_NOUKYOU.組合番号 = '''+code + ''' '+
          'order by 受付連番';

        end
        else if EMode.Text = '4' then begin

         stmp :=
          'SELECT T_UKETUKE4.受付連番, T_UKETUKE4.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE4 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE4.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE4.作物コード = M_SAKUMOTU.作物コード)) '+
          'where M_NOUKYOU.組合番号 = '''+code + ''' '+
          'order by 受付連番';

        end
        else if EMode.Text = '5' then begin

         stmp :=
          'SELECT T_UKETUKE5.受付連番, T_UKETUKE5.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE5 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE5.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE5.作物コード = M_SAKUMOTU.作物コード)) '+
          'where M_NOUKYOU.組合番号 = '''+code + ''' '+
          'order by 受付連番';

        end
        else if EMode.Text = '7' then begin

         stmp :=
          'SELECT T_UKETUKE7.受付連番, T_UKETUKE7.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE7 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE7.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE7.作物コード = M_SAKUMOTU.作物コード)) '+
          'where M_NOUKYOU.組合番号 = '''+code + ''' '+
          'order by 受付連番';

        end
        else begin  //8

         stmp :=
          'SELECT T_UKETUKE8.受付連番, T_UKETUKE8.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE8 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE8.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE8.作物コード = M_SAKUMOTU.作物コード)) '+
          'where M_NOUKYOU.組合番号 = '''+code + ''' '+
          'order by 受付連番';

        end;






  ADOQuery1.SQL.Text := stmp;
         ADOQuery1.Open;


          stmp := inttoStr(ADOQuery1.RecordCount);
        LCount.Caption := 'サンプル数: '+stmp;



end;
//検索解除
procedure TfrmSUketuke.btnCloseClick(Sender: TObject);
begin
	Close;
end;

//選択
procedure TfrmSUketuke.BitBtn1Click(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	FNO := ds1.DataSet.FieldByName('受付連番').asString ;
  close;
end;

//セルクリック、タグならオーダーする
procedure TfrmSUketuke.DateTimePicker1Change(Sender: TObject);
begin

  	if not (DDummy.DataSet.State  in [dsEdit	,dsInsert]) then
    DDummy.DataSet.Edit ;


  DDummy.DataSet.FieldByName('日付終了').asDatetime :=　DateTimePicker1.Date;

end;

procedure TfrmSUketuke.DateTimePicker2Change(Sender: TObject);
begin
  	if not (DDummy.DataSet.State  in [dsEdit	,dsInsert]) then
    DDummy.DataSet.Edit ;


  DDummy.DataSet.FieldByName('日付開始').asDatetime :=　DateTimePicker2.Date;

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

  DateTimetoString(stime,'#mm/dd/yyyy#',DDummy.DataSet.FieldByName('日付開始').AsDateTime);
  dtmp := StrtoDate('1900/1/1');

  if DDummy.DataSet.FieldByName('日付開始').AsDateTime < dtmp then begin

    showmessage('開始日付を入力して下さい。');
    exit;
  end;
  DateTimetoString(etime,'#mm/dd/yyyy#',DDummy.DataSet.FieldByName('日付終了').AsDateTime);


  if DDummy.DataSet.FieldByName('日付終了').AsDateTime < dtmp then begin

     etime := stime;

  end;


      if EMode.Text = '6' then begin


         stmp :=
          'SELECT T_UKETUKE6.受付連番, T_UKETUKE6.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名 '+
          'FROM (T_UKETUKE6 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE6.組合番号 = M_NOUKYOU.組合番号)) '+
//          'where (T_UKETUKE6.受付年月日 > #12/10/2020#) '+
          'where (T_UKETUKE6.受付年月日 >= '+ stime + ') and (T_UKETUKE6.受付年月日 <= '+ etime + ') '+
//          'where (T_UKETUKE6.受付年月日 >= '+ stime + ') '+
          'order by 受付連番';

      end
      else if EMode.Text = '1' then begin
         stmp :=
          'SELECT T_UKETUKE1.受付連番, T_UKETUKE1.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE1 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE1.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE1.作物コード = M_SAKUMOTU.作物コード)) '+
          'where (T_UKETUKE1.受付年月日 >= '+ stime + ') and (T_UKETUKE1.受付年月日 <= '+ etime + ') '+
          'order by 受付連番';

      end
      else if EMode.Text = '2' then begin
         stmp :=
          'SELECT T_UKETUKE2.受付連番, T_UKETUKE2.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE2 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE2.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE2.作物コード = M_SAKUMOTU.作物コード)) '+
          'where (T_UKETUKE2.受付年月日 >= '+ stime + ') and (T_UKETUKE2.受付年月日 <= '+ etime + ') '+
          'order by 受付連番';

      end
      else if EMode.Text = '3' then begin
         stmp :=
          'SELECT T_UKETUKE3.受付連番, T_UKETUKE3.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE3 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE3.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE3.作物コード = M_SAKUMOTU.作物コード)) '+
          'where (T_UKETUKE3.受付年月日 >= '+ stime + ') and (T_UKETUKE3.受付年月日 <= '+ etime + ') '+
          'order by 受付連番';

      end
      else if EMode.Text = '4' then begin
         stmp :=
          'SELECT T_UKETUKE4.受付連番, T_UKETUKE4.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE4 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE4.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE4.作物コード = M_SAKUMOTU.作物コード)) '+
          'where (T_UKETUKE4.受付年月日 >= '+ stime + ') and (T_UKETUKE4.受付年月日 <= '+ etime + ') '+
          'order by 受付連番';

      end
      else if EMode.Text = '5' then begin
         stmp :=
          'SELECT T_UKETUKE5.受付連番, T_UKETUKE5.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE5 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE5.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE5.作物コード = M_SAKUMOTU.作物コード)) '+
          'where (T_UKETUKE5.受付年月日 >= '+ stime + ') and (T_UKETUKE5.受付年月日 <= '+ etime + ') '+
          'order by 受付連番';

      end
      else if EMode.Text = '7' then begin
         stmp :=
          'SELECT T_UKETUKE7.受付連番, T_UKETUKE7.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE7 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE7.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE7.作物コード = M_SAKUMOTU.作物コード)) '+
          'where (T_UKETUKE7.受付年月日 >= '+ stime + ') and (T_UKETUKE7.受付年月日 <= '+ etime + ') '+
          'order by 受付連番';

      end
      else begin
         stmp :=
          'SELECT T_UKETUKE8.受付連番, T_UKETUKE8.受付年月日, M_NOUKYOU.組合番号,M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE8 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE8.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE8.作物コード = M_SAKUMOTU.作物コード)) '+
          'where (T_UKETUKE8.受付年月日 >= '+ stime + ') and (T_UKETUKE8.受付年月日 <= '+ etime + ') '+
          'order by 受付連番';

      end;




  ADOQuery1.SQL.Text := stmp;
         ADOQuery1.Open;


                 stmp := inttoStr(ADOQuery1.RecordCount);
        LCount.Caption := 'サンプル数: '+stmp;



end;


procedure TfrmSUketuke.FormShow(Sender: TObject);
var
stmp : String;
begin

	FNO := '';
//	Query1.SQL.Text := sSQL + ' order by サンプル番号';
         //INNER JOIN → LEFT OUTER JOIN
  ADOQuery1.close;
  ADOQuery1.SQL.Clear;
    stmp := '';

        if EMode.Text = '6' then begin


         stmp :=
          'SELECT T_UKETUKE6.受付連番, T_UKETUKE6.受付年月日, M_NOUKYOU.組合名 '+
          'FROM (T_UKETUKE6 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE6.組合番号 = M_NOUKYOU.組合番号)) '+
          'order by 受付連番';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;

        end
        else if EMode.Text = '1' then begin
         stmp :=
          'SELECT T_UKETUKE1.受付連番, T_UKETUKE1.受付年月日, M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE1 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE1.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE1.作物コード = M_SAKUMOTU.作物コード)) '+
          'order by 受付連番';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;

        end
        else if EMode.Text = '2' then begin
         stmp :=
          'SELECT T_UKETUKE2.受付連番, T_UKETUKE2.受付年月日, M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE2 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE2.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE2.作物コード = M_SAKUMOTU.作物コード)) '+
          'order by 受付連番';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;

        end
        else if EMode.Text = '3' then begin

         stmp :=
          'SELECT T_UKETUKE3.受付連番, T_UKETUKE3.受付年月日, M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE3 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE3.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE3.作物コード = M_SAKUMOTU.作物コード)) '+
          'order by 受付連番';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;
        end
        else if EMode.Text = '4' then begin

         stmp :=
          'SELECT T_UKETUKE4.受付連番, T_UKETUKE4.受付年月日, M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE4 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE4.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE4.作物コード = M_SAKUMOTU.作物コード)) '+
          'order by 受付連番';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;
        end
        else if EMode.Text = '3' then begin

         stmp :=
          'SELECT T_UKETUKE5.受付連番, T_UKETUKE5.受付年月日, M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE5 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE5.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE5.作物コード = M_SAKUMOTU.作物コード)) '+
          'order by 受付連番';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;
        end
        else if EMode.Text = '7' then begin

         stmp :=
          'SELECT T_UKETUKE7.受付連番, T_UKETUKE7.受付年月日, M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE7 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE7.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE3.作物コード = M_SAKUMOTU.作物コード)) '+
          'order by 受付連番';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;
        end
        else if EMode.Text = '8' then begin

         stmp :=
          'SELECT T_UKETUKE8.受付連番, T_UKETUKE8.受付年月日, M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE8 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE8.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE8.作物コード = M_SAKUMOTU.作物コード)) '+
          'order by 受付連番';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;
        end
        else begin

         stmp :=
          'SELECT T_UKETUKE6.受付連番, T_UKETUKE6.受付年月日, M_NOUKYOU.組合名, M_SAKUMOTU.作物名 '+
          'FROM ((T_UKETUKE6 '+
          'LEFT JOIN M_NOUKYOU '+
          'ON  (T_UKETUKE6.組合番号 = M_NOUKYOU.組合番号)) '+
          'LEFT  JOIN M_SAKUMOTU '+
          'ON  (T_UKETUKE6.作物コード = M_SAKUMOTU.作物コード)) '+
          'order by 受付連番';

         ADOQkumiai.Close;
         ADOQkumiai.Open;

         ADODummy.Close;
         ADODummy.Open;


        end;


  ADOQuery1.SQL.Add(stmp);
	ADOQuery1.Open;




        stmp := inttoStr(ADOQuery1.RecordCount);
        LCount.Caption := 'サンプル数: '+stmp;

end;

end.

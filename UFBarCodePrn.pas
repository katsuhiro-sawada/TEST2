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
    { Private 宣言 }
  public
    { Public 宣言 }
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
      ShowMessage('用紙開始位置（縦）を入力してください。' );
      exit;
  end;

  ies := StrtoInt( Es.Text );

  if (ies < 1) or (ies > 5 ) then begin
      ShowMessage('用紙開始位置（縦）が適切な数値ではありません。' );
      exit;
  end;



  if Ee.Text = '' then begin
      ShowMessage('用紙開始位置（横）を入力してください。' );
      exit;
  end;

  iee := StrtoInt( Ee.Text );
  if (iee < 1) or (iee > 4 ) then begin
      ShowMessage('用紙開始位置（横）が適切な数値ではありません。' );
      exit;
  end;


  if ESno.Text = '' then begin
      ShowMessage('サンプル番号を入力してください。' );
      exit;
  end;

  sno := StrtoInt( ESno.Text );

  if Ec.Text = '' then begin
      ShowMessage('出力数を入力してください。' );
      exit;
  end;
  ecount := StrtoInt( Ec.Text );


  try
     excel := CreateOleObject('Excel.Application');
  except
      ShowMessage('Excelが起動できません');
      exit;
  end;


  Q1.Close;
  Q1.DatabaseName := 'DOJO';
//  Q1.DatabaseName := DataPath;
    stmp :=
		'SELECT T_UKETUKE.*,'+
		'M_HOJOU.農家番号, M_HOJOU.圃場名,M_HOJOU.土壌コード,'+
		'M_NOUKA.*,'+
		'M_CITY.市町村名, M_TIKU.地区名,'+
		'M_DOJOU.土壌名, M_DOSEI.土性名, M_FUSHOKU.腐植名,'+
                'M_DOJOU.水稲土壌コード,M_DOJOU.畑牧土壌コード,'+
                'M_city.標準地帯区分, M_city.水稲地帯区分, '+
                 //		'M_DOJOU.土壌名, M_DOSEI.土性名,'+
		'M_sakumotu.作物名, M_sakugata.作型名,'+
                'M_zsakumotu.作物名 前作物名 '+ //, M_zsakugata.作型名 前作型名 '+
		'FROM T_UKETUKE INNER JOIN M_HOJOU '+
   	'ON  (T_UKETUKE.圃場番号 = M_HOJOU.圃場番号)'+
   	'LEFT OUTER JOIN "M_SAKUMOTU.db" M_sakumotu '+
   	'ON  (T_UKETUKE.作目コード = M_sakumotu.作目コード)'+
   	'AND  (T_UKETUKE.作物コード = M_sakumotu.作物コード)'+
   	'LEFT OUTER JOIN "M_SAKUGATA.db" M_sakugata '+
    'ON  (T_UKETUKE.作目コード = M_sakugata.作目コード)'+
    'AND  (T_UKETUKE.作物コード = M_sakugata.作物コード)'+
    'AND  (T_UKETUKE.作型コード = M_sakugata.作型コード)'+
    'LEFT OUTER JOIN "M_SAKUMOTU.db" M_zsakumotu '+
    'ON  (T_UKETUKE.前作目コード = M_zsakumotu.作目コード)'+
    'AND  (T_UKETUKE.前作物コード = M_zsakumotu.作物コード)'+
//    'AND  (T_UKETUKE.前作型コード = M_zsakugata.作型コード)'+
    'LEFT OUTER JOIN M_DOJOU '+
    'ON  (M_HOJOU.土壌コード = M_DOJOU.土壌コード)'+
    'LEFT OUTER JOIN M_DOSEI '+
    'ON  (M_HOJOU.土性コード = M_DOSEI.土性コード)'+
    'LEFT OUTER JOIN M_FUSHOKU '+
    'ON  (M_HOJOU.腐植コード = M_FUSHOKU.腐植コード)'+
    'INNER JOIN M_NOUKA '+
    'ON  (M_HOJOU.農家番号 = M_NOUKA.農家番号)'+
    'INNER JOIN M_CITY '+
    'ON  (M_HOJOU.市町村コード = M_CITY.市町村コード)'+
    'INNER JOIN M_TIKU '+
    'ON  (M_HOJOU.市町村コード = M_TIKU.市町村コード)'+
    'AND  (M_HOJOU.地区コード = M_TIKU.地区コード)'+
        {Version 0.6 #26 削除フラグ追加}
    ' WHERE (T_UKETUKE.削除フラグ<>True) ';

 if Ch1.Checked then begin
     stmp := stmp + 'and (進捗受付 = "")'+
    ' ORDER by サンプル番号' ;
 end
 else begin
     stmp := stmp + ' ORDER by サンプル番号' ;

 end;
  Q1.SQL.Clear;
  Q1.SQL.Add( stmp );
  Q1.Open;

  stmp := FormatFloat( '0000', sno );
  if not Q1.Locate('サンプル番号', stmp,[] ) then begin

        Q1.FindFirst;
        stmp := Q1.FieldByName('サンプル番号').AsString;
        sno := StrtoInt( stmp );
        //      ShowMessage('開始サンプルがありません。');
//      Q1.Close;
//      exit;
  end;

  //表示
  excel.Visible := True;

 // 保存の確認を出さないようにする
  excel.DisplayAlerts := False;
  //オープン
  excel.Application.Workbooks.open(AppPath+'\バーコード仕様.xls');

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
         stmp := EntryCenterNo+EntryYear+Q1.FieldbyName('サンプル番号').AsString;
         excel.ActiveSheet.Cells[2+(i-1)*6, 2+(j-1)*4].value := '*'+stmp+'*';
         stmp := EntryCenterNo+'-'+EntryYear+'-'+Q1.FieldbyName('サンプル番号').AsString;
         excel.ActiveSheet.Cells[3+(i-1)*6, 2+(j-1)*4].value := stmp;

         excel.ActiveSheet.Cells[4+(i-1)*6, 2+(j-1)*4].value := Q1.FieldbyName('農家名').AsString;
         excel.ActiveSheet.Cells[5+(i-1)*6, 2+(j-1)*4].value := Q1.FieldbyName('作物名').AsString;
         excel.ActiveSheet.Cells[6+(i-1)*6, 2+(j-1)*4].value := Q1.FieldbyName('分析項目').AsString;
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

unit USintyoku;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, DBTables, Buttons, ExtCtrls,
  ComCtrls, DBCtrls;

type
  TFSintyoku = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    D2: TDataSource;
    DBGrid2: TDBGrid;
    Image2: TImage;
    Image1: TImage;
    Label13: TLabel;
    EKensuu: TEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure EBarInputChange(Sender: TObject);
    procedure Sp1Click(Sender: TObject);
    procedure Sp2Click(Sender: TObject);
    procedure Sp3Click(Sender: TObject);
    procedure BtKensakuClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private 宣言 }
    procedure DataSet( sf : String);
    procedure DataCls( sf : String );
    procedure DataSetAll( sf : String );
    procedure TableOpen();
    procedure TableOpen2();
  public
    { Public 宣言 }
  end;

var
  FSintyoku: TFSintyoku;


implementation

uses
  DMU,PrnCanvasU,Printers,PreviewU, DojouU;


{$R *.DFM}

procedure TFSintyoku.FormShow(Sender: TObject);
var
 i : integer;
 flg : Boolean;
 stmp : String;
begin

    Color := BackColor ;



end;

procedure TFSintyoku.EBarInputChange(Sender: TObject);
begin



end;

//テーブルのオーペン
procedure TFSintyoku.TableOpen();
begin


end;

//テーブルのオーペン
procedure TFSintyoku.TableOpen2();
begin


end;

procedure TFSintyoku.Sp1Click(Sender: TObject);
begin
    Tableopen;


end;

procedure TFSintyoku.Sp2Click(Sender: TObject);
begin

    Tableopen;


end;

procedure TFSintyoku.Sp3Click(Sender: TObject);
begin

    Tableopen;


end;

procedure TFSintyoku.BtKensakuClick(Sender: TObject);
begin

  TableOpen2;


end;

procedure TFSintyoku.DataSet( sf : String);
begin

end;

procedure TFSintyoku.DataSetAll( sf : String );
begin


end;

procedure TFSintyoku.DataCls( sf : String );
var
stmp : String;
begin

end;

procedure TFSintyoku.BitBtn5Click(Sender: TObject);
begin
    DataCls('進捗診断');

end;

procedure TFSintyoku.BitBtn12Click(Sender: TObject);
begin
    DataCls('進捗送付終了');
end;

procedure TFSintyoku.BitBtn9Click(Sender: TObject);
begin
     DataSet('進捗所見要求');

end;

procedure TFSintyoku.BitBtn14Click(Sender: TObject);
begin
    DataCls('進捗所見要求');
end;

procedure TFSintyoku.BitBtn1Click(Sender: TObject);
begin

close;

end;

procedure TFSintyoku.BitBtn2Click(Sender: TObject);
var
stmp : String;
begin


  DataModule1.ADOQtmp.Close;



stmp := 'SELECT T_UKETUKE6.受付連番, T_BUNSEKI6.受付NO, T_UKETUKE6.受付年月日,min(試料NO) as 始NO,max(試料NO) as 終NO,'+
 ' Count(T_BUNSEKI6.ph) AS ph,'+
 ' Count(T_BUNSEKI6.EC) AS EC,'+
 ' T_UKETUKE6.受付年月日'+
 ' FROM T_BUNSEKI6 INNER JOIN T_UKETUKE6 ON T_BUNSEKI6.受付NO = T_UKETUKE6.受付NO'+
 ' GROUP BY T_UKETUKE6.受付連番, T_BUNSEKI6.受付NO, T_UKETUKE6.受付年月日';







{

        ' LEFT JOIN M_SAKUMOTU ON T_BUNSEKI6.作物コード = M_SAKUMOTU.作物コード) '+
        ' LEFT JOIN M_SAKUGATA ON (T_BUNSEKI6.作物コード = M_SAKUGATA.作物コード) and (T_BUNSEKI6.作型コード = M_SAKUGATA.作型コード)) '+
        ' LEFT JOIN M_NOUKYOU ON T_UKETUKE6.組合番号 = M_NOUKYOU.組合番号) '+
        ' LEFT JOIN M_SISYO ON (T_UKETUKE6.組合番号 = M_SISYO.組合番号) and (T_UKETUKE6.支店番号 = M_SISYO.支店番号)) '+
        'where ' + pCondition +
        ' ORDER BY T_Bunseki6.試料NO' ;

}


  DataModule1.ADOQtmp.SQL.Text := stmp;

  DataModule1.ADOQtmp.open;











end;

procedure TFSintyoku.BitBtn3Click(Sender: TObject);
begin

showmessage('調整中');

end;

procedure TFSintyoku.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with DBGrid2.Canvas do begin
    if Column.FieldName = '再確認' then begin
      if DBGrid2.DataSource.DataSet.FieldByName('再確認').AsBoolean then begin
//           and (not (gdFocused in State))
//      then begin
          DBGrid2.Canvas.FillRect(Rect);
          DBGrid2.Canvas.Draw(Rect.Left+2, Rect.Top+2, Image1.Picture.Bitmap);
      end
      else begin
          DBGrid2.Canvas.FillRect(Rect);
          DBGrid2.Canvas.Draw(Rect.Left+2, Rect.Top+2, Image2.Picture.Bitmap);
      end;
//          Brush.Color := clBtnFace;//TColor($0073705B); //clBlue;
//          Font.Color := clBlue; //clGreen; //clWhite;
    end;
//    end;
  end;
//  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);


//		if StringGrid1.Cells[aCol,aRow] = '1' then begin
//			StringGrid1.Canvas.Draw(Rect.Left+2, Rect.Top+2, Image1.Picture.Bitmap);
//		end else begin
//			StringGrid1.Canvas.Draw(Rect.Left+2, Rect.Top+2, Image2.Picture.Bitmap);





end;

procedure TFSintyoku.DBGrid2DblClick(Sender: TObject);
var
stmp : String;
RecCnt : Integer;
aDevice:Array[0..255] of char;
aDriver:Array[0..255] of char;
aPort:Array[0..32] of char;
PDM: PDeviceMode;
aDevMode: THandle;
//PrnDlg : TfrmPreview;
begin

{


     if Q1.FieldByName('進捗分析終了').asString <> '●' then begin
        ShowMessage('分析が終了していません。' );
        exit;
     end;



       //このフォームを作っておかないといけない。　内部のDBを仕様している。
     Application.CreateForm(TSindanForm, SindanForm);



     SQLCondition := 'サンプル番号 = "'+ Q1.FieldByName('サンプル番号').asString+'"';
     PrintModule1.ADOQueryUketuke.SQL.Clear;
     stmp := 'Select T_UKETUKE.*,M_HOJOU.土壌コード,M_HOJOU.土性コード,M_HOJOU.腐植コード '+
                'from T_UKETUKE INNER JOIN M_HOJOU '+
                'ON  (T_UKETUKE.圃場番号 = M_HOJOU.圃場番号) where T_UKETUKE.削除フラグ<>True and ' +
                SQLCondition;
     PrintModule1.ADOQueryUketuke.SQL.Add(stmp);
     PrintModule1.ADOQueryUketuke.open;

     //全体の件数を割り出す
     with DataModule1.QueryRead do begin
                SQL.Text := 'Select Count(*) cnt from T_UKETUKE where 削除フラグ<>True and ' + SQLCondition ;
                Open;
                RecCnt := FieldByName('cnt').asInteger ;
                Close;
     end;
//          OpenProgress;
            //一件当たりのステップ数
//          frmProgress.Scale(Floor(333/RecCnt));
            //H150828      Pages := RecCnt;

            //プリンタの設定
            //  Printer.PrinterIndex := -1;
     Printer.PrinterIndex := Printer.PrinterIndex;
     Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
     Printer.SetPrinter(aDevice, aDriver, aPort, 0);
     Printer.GetPrinter(aDevice, aDriver, aPort, aDevMode);
     PDM := GlobalLock(aDevMode); //メモリをロックする　領域をとるわけではない。


     if JMode = 'Douou' then begin
                     PDM^.dmPaperSize := DMPAPER_A4;
                     PDM^.dmOrientation := DMORIENT_LANDSCAPE; // 横
                     //DMORIENT_PORTRAIT;
     end
     else if JMode = 'Fuuren' then begin
                     PDM^.dmPaperSize := DMPAPER_B4;
                     PDM^.dmOrientation := DMORIENT_PORTRAIT; // 縦
     end
     else begin
                     PDM^.dmPaperSize := DMPAPER_A4;
                     PDM^.dmOrientation := DMORIENT_PORTRAIT; // 縦
     end;


     GlobalUnlock(aDevMode); //メモリを開放　領域を消すわけではない。
     Printer.SetPrinter(aDevice, aDriver, aPort, aDevMode);

     //表示
     if Q1.FieldByName('出力調書分析のみ').asBoolean then begin
         DspPrnReport( self,rtBunseki, RecCnt );
     end
     else begin
         DspPrnReport( self,rtSindan, RecCnt );
     end;


     SindanForm.Release ;
}
end;

end.

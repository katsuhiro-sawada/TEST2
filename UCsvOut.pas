unit UCsvOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, ExtDlgs,DMU; //,PrnCanvasU;

type
  TFCsvOut = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Eoutfile: TEdit;
    PB1: TProgressBar;
    SaveDialog1: TSaveDialog;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    Mode : String;
    { Public declarations }
  end;

var
  FCsvOut: TFCsvOut;

implementation

uses PrnCanvasU, MainU, BunsekiU;

{$R *.dfm}

procedure TFCsvOut.BitBtn1Click(Sender: TObject);
var
outfile : String;
  iCnt : Integer;
  WorkList,CSVList : TStringList;
  stmp : String;
  i : integer;

begin
//出力実行

  if EOUtfile.Text = '' then begin
    ShowMessage('出力ファイル名を入力して下さい。');
    exit;
  end;

  outfile := EOUtfile.Text;


   WorkList := TStringList.Create; //1行ごと
   CSVList := TStringList.Create;  //全体を格納



  if Mode = '受付' then begin

   ///////////////////////// 出力   ///
   //項目を出力
    WorkList.Clear ;
      WorkList.Add('サンプル番号');
      WorkList.Add('受付年月日');
      WorkList.Add('農家番号');
      WorkList.Add('農家名');
      WorkList.Add('圃場番号');
      WorkList.Add('圃場名');
      WorkList.Add('市町村コード');
      WorkList.Add('市町村名');
      WorkList.Add('前作目コード');
      WorkList.Add('前作目');
      WorkList.Add('前作物コード');
      WorkList.Add('前作物名');
      WorkList.Add('前作型コード');
      WorkList.Add('前作型名');
      WorkList.Add('作目コード');
      WorkList.Add('作目');
      WorkList.Add('作物コード');
      WorkList.Add('作物名');
      WorkList.Add('作型コード');
      WorkList.Add('作型名');
      WorkList.Add('土壌コード');
      WorkList.Add('土壌名');
      WorkList.Add('土性コード');
      WorkList.Add('土性名');

      WorkList.Add('肥料名1');
      WorkList.Add('N1');
      WorkList.Add('P1');
      WorkList.Add('K1');
      WorkList.Add('Mg1');
      WorkList.Add('容量1');
//      WorkList.Add('単価1');
      WorkList.Add('肥料名2');
      WorkList.Add('N2');
      WorkList.Add('P2');
      WorkList.Add('K2');
      WorkList.Add('Mg2');
      WorkList.Add('容量2');
//      WorkList.Add('単価2');



//      WorkList.Add('分析種類');
//      WorkList.Add('腐植');
      WorkList.Add('pH');
      WorkList.Add('EC');
      WorkList.Add('トルオーグP');
      WorkList.Add('ブレイP');
      WorkList.Add('CaO');
      WorkList.Add('MgO');
      WorkList.Add('K2O');
      WorkList.Add('CEC');
      WorkList.Add('腐植');
      WorkList.Add('アンモニア態N');
      WorkList.Add('可給態N');
      WorkList.Add('熱抽出N');
      WorkList.Add('硝酸態N');
      WorkList.Add('ケイ酸');
      WorkList.Add('鉄');
      WorkList.Add('りん吸');

WorkList.Add('亜鉛');
WorkList.Add('銅');
WorkList.Add('マンガン');
WorkList.Add('ホウ素');
WorkList.Add('ニッケル');
WorkList.Add('pHKCL');
WorkList.Add('Y1');
WorkList.Add('備考');

//      WorkList.Add('その他分析項目');
//      WorkList.Add('その他分析値');
//      WorkList.Add('備考');

   CSVList.Add(WorkList.CommaText);





//   frmBunseki.ADOTable1
//   DM  PrintModule1.QueryUketuke.close;
//   PrintModule1.QueryUketuke.open;

PB1.Min := 0;
PB1.Max := frmBunseki.ADOQuery1.RecordCount;
PB1.Position := 0;


   with frmBunseki.ADOQuery1 do begin

     First;
     i := 0;
     while not frmBunseki.ADOQuery1.eof do begin

       i := i + 1;
       PB1.Position := i;

       //if frmBunseki.ADOTable1.RecordCount < i then
       //  break;


        //ワークリストをクリア
        WorkList.Clear;
      WorkList.Add(FieldbyName('サンプル番号').asString);
      WorkList.Add(FieldbyName('受付年月日').asString);
      WorkList.Add(FieldbyName('農家番号').asString);
      WorkList.Add(FieldbyName('農家名').asString);
      WorkList.Add(FieldbyName('圃場番号').asString);
      WorkList.Add(FieldbyName('圃場名').asString);
      WorkList.Add(FieldbyName('市町村コード').asString);
      WorkList.Add(FieldbyName('市町村名').asString);


      WorkList.Add(FieldbyName('前作目コード').asString);
      WorkList.Add(FieldbyName('前作目').asString);
      WorkList.Add(FieldbyName('前作物コード').asString);
      WorkList.Add(FieldbyName('前作物名').asString);
      WorkList.Add(FieldbyName('前作型コード').asString);
      WorkList.Add(FieldbyName('前作型名').asString);
      WorkList.Add(FieldbyName('作目コード').asString);
      WorkList.Add(FieldbyName('作目').asString);
      WorkList.Add(FieldbyName('作物コード').asString);
      WorkList.Add(FieldbyName('作物名').asString);
      WorkList.Add(FieldbyName('作型コード').asString);
      WorkList.Add(FieldbyName('作型名').asString);

      WorkList.Add(FieldbyName('土壌コード').asString);
      WorkList.Add(FieldbyName('土壌名').asString);
      WorkList.Add(FieldbyName('土性コード').asString);
      WorkList.Add(FieldbyName('土性名').asString);


WorkList.Add(FieldbyName('肥料名1').asString);
WorkList.Add(FieldbyName('N1').asString);
WorkList.Add(FieldbyName('P1').asString);
WorkList.Add(FieldbyName('K1').asString);
WorkList.Add(FieldbyName('Mg1').asString);
WorkList.Add(FieldbyName('容量1').asString);
//WorkList.Add(FieldbyName('単価1').asString);

WorkList.Add(FieldbyName('肥料名2').asString);
WorkList.Add(FieldbyName('N2').asString);
WorkList.Add(FieldbyName('P2').asString);
WorkList.Add(FieldbyName('K2').asString);
WorkList.Add(FieldbyName('Mg2').asString);
WorkList.Add(FieldbyName('容量2').asString);
//WorkList.Add(FieldbyName('単価2').asString);


//      WorkList.Add(FieldbyName('分析種類').asString);
//      WorkList.Add('腐植');
      WorkList.Add(FieldbyName('pH').asString);
      WorkList.Add(FieldbyName('EC').asString);
      WorkList.Add(FieldbyName('トルオーグP').asString);
      WorkList.Add(FieldbyName('ブレイP').asString);
      WorkList.Add(FieldbyName('CaO').asString);
      WorkList.Add(FieldbyName('MgO').asString);
      WorkList.Add(FieldbyName('K2O').asString);
      WorkList.Add(FieldbyName('CEC').asString);
      WorkList.Add(FieldbyName('腐植').asString);
      WorkList.Add(FieldbyName('アンモニア態N').asString);
      WorkList.Add(FieldbyName('可給態N').asString);
      WorkList.Add(FieldbyName('熱抽出N').asString);
      WorkList.Add(FieldbyName('硝酸態N').asString);
      WorkList.Add(FieldbyName('ケイ酸').asString);
      WorkList.Add(FieldbyName('鉄').asString);
      WorkList.Add(FieldbyName('リン吸').asString);


WorkList.Add(FieldbyName('亜鉛').asString);
WorkList.Add(FieldbyName('銅').asString);
WorkList.Add(FieldbyName('マンガン').asString);
WorkList.Add(FieldbyName('ホウ素').asString);
WorkList.Add(FieldbyName('ニッケル').asString);
WorkList.Add(FieldbyName('pHKCL').asString);
WorkList.Add(FieldbyName('Y1').asString);
WorkList.Add(FieldbyName('備考').asString);


//      WorkList.Add(FieldbyName('含水率').asString);
//      WorkList.Add(FieldbyName('その他分析項目').asString);
//      WorkList.Add(FieldbyName('その他分析値').asString);
//      WorkList.Add(FieldbyName('備考').asString);


        CSVList.Add(WorkList.CommaText);
        Next;

       end;

   end;


   end;


   if Mode = '集計' then begin

    //項目を出力
    WorkList.Clear ;
      WorkList.Add('受付年月日');
      WorkList.Add('住所');
      WorkList.Add('氏名');
      WorkList.Add('番号');
      WorkList.Add('分析種類');
      WorkList.Add('単価');
      WorkList.Add('分析数');

      CSVList.Add(WorkList.CommaText);





//   frmBunseki.ADOTable1
//   DM  PrintModule1.QueryUketuke.close;
//   PrintModule1.QueryUketuke.open;

    PB1.Min := 0;
    PB1.Max := DataModule1.ADOQtmp.RecordCount;
    PB1.Position := 0;


   with DataModule1.ADOQtmp do begin

     First;
     i := 0;
     while not eof do begin

       i := i + 1;
       PB1.Position := i;

       //if frmBunseki.ADOTable1.RecordCount < i then
       //  break;


        //ワークリストをクリア
        WorkList.Clear;
        WorkList.Add(FieldbyName('受付年月日').asString);
        WorkList.Add(FieldbyName('住所').asString);
        WorkList.Add(FieldbyName('氏名').asString);
        WorkList.Add(FieldbyName('番号').asString);
        WorkList.Add(FieldbyName('分析種類').asString);
        WorkList.Add(FieldbyName('単価').asString);
        WorkList.Add(FieldbyName('分析数').asString);


        CSVList.Add(WorkList.CommaText);
        Next;

       end;

   end;






   end;









  CSVList.SavetoFile( outfile );

  CSVList.Free;
  WorkList.Free;


 showmessage('出力しました。');

 close;


end;

procedure TFCsvOut.BitBtn2Click(Sender: TObject);
begin

   Close;

end;

procedure TFCsvOut.BitBtn3Click(Sender: TObject);
var
outfile : String;
stmp : String;
begin
//一覧テキスト出力

    //stmp := MainForm.Vmode;

    //SaveDialog1.FileName := stmp;

   if SaveDialog1.Execute then begin
       outfile := SaveDialog1.FileName;
       EOUtfile.Text := outfile;
   end
   else begin
     exit;
   end;



end;

end.

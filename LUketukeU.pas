unit LUketukeU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, ExtCtrls;

type
  TfrmLUketuke = class(TForm)
    Panel1: TPanel;
    btnClose: TBitBtn;
    ds1: TDataSource;
    Query1: TQuery;
    DBGrid1: TDBGrid;
    btnPrint: TBitBtn;
    btnUketuke: TBitBtn;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnUketukeClick(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  frmLUketuke: TfrmLUketuke;

implementation

uses DMU, UketukeU;

{$R *.DFM}
const sSQL = 'SELECT T_UKETUKE.サンプル番号, T_UKETUKE.受付年月日, M_HOJOU.圃場名, M_NOUKA.農家名, M_SAKUMOTU.作物名, M_sakugata.作型名, M_dojou.土壌名 '+
   'FROM T_UKETUKE '+
   'INNER JOIN M_HOJOU '+
   'ON  (T_UKETUKE.圃場番号 = M_HOJOU.圃場番号) '+
   'INNER JOIN M_SAKUMOTU '+
   'ON  (T_UKETUKE.作目コード = M_SAKUMOTU.作目コード) '+
   'AND  (T_UKETUKE.作物コード = M_SAKUMOTU.作物コード) '+
   'INNER JOIN "M_SAKUGATA.DB" M_sakugata '+
   'ON  (T_UKETUKE.作目コード = M_sakugata.作目コード)  '+
   'AND  (T_UKETUKE.作物コード = M_sakugata.作物コード) '+
   'AND  (T_UKETUKE.作型コード = M_sakugata.作型コード) '+
   'INNER JOIN M_NOUKA '+
   'ON  (M_HOJOU.農家番号 = M_NOUKA.農家番号) '+
   'INNER JOIN "M_DOJOU.db" M_dojou '+
   'ON  (M_HOJOU.土壌コード = M_dojou.土壌コード) '+
   'WHERE T_UKETUKE.削除フラグ<>True ';     {Version 0.6 #26}
        {Version 0.6 #26 削除フラグ追加}

procedure TfrmLUketuke.DBGrid1TitleClick(Column: TColumn);
begin
  with Query1 do begin
  	Close;
    SQL.Text := sSQL + ' order by ' + Column.FieldName;
    Open;
  end;

end;

procedure TfrmLUketuke.FormCreate(Sender: TObject);
begin

        if JMode = 'Douou' then  btnUketuke.Visible := false;

	Color := BackColor ;
	Query1.SQL.Text := sSQL +' order by サンプル番号';
	Query1.Open;

end;

procedure TfrmLUketuke.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Query1.Close;

end;

procedure TfrmLUketuke.btnCloseClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmLUketuke.btnPrintClick(Sender: TObject);
begin

//	  Application.CreateForm(TQuickReport1, QuickReport1);
//    QuickReport1.InitRep(EntryCenter,EntryYear);
//    QuickReport1.Preview;
//    QuickReport1.FinishRep;
//    QuickReport1.Free;

    end;

procedure TfrmLUketuke.btnUketukeClick(Sender: TObject);
begin
  if Query1.Eof and Query1.bof then exit ;
  //受付画面へ
  Application.CreateForm(TfrmUketuke, frmUketuke);
  frmUketuke.locateNo(Query1.FieldByName('サンプル番号').asString);
  frmUketuke.ShowModal ;
  frmUketuke.Release ;
end;

end.

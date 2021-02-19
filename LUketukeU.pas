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
    { Private �錾 }
  public
    { Public �錾 }
  end;

var
  frmLUketuke: TfrmLUketuke;

implementation

uses DMU, UketukeU;

{$R *.DFM}
const sSQL = 'SELECT T_UKETUKE.�T���v���ԍ�, T_UKETUKE.��t�N����, M_HOJOU.�ޏꖼ, M_NOUKA.�_�Ɩ�, M_SAKUMOTU.�앨��, M_sakugata.��^��, M_dojou.�y�떼 '+
   'FROM T_UKETUKE '+
   'INNER JOIN M_HOJOU '+
   'ON  (T_UKETUKE.�ޏ�ԍ� = M_HOJOU.�ޏ�ԍ�) '+
   'INNER JOIN M_SAKUMOTU '+
   'ON  (T_UKETUKE.��ڃR�[�h = M_SAKUMOTU.��ڃR�[�h) '+
   'AND  (T_UKETUKE.�앨�R�[�h = M_SAKUMOTU.�앨�R�[�h) '+
   'INNER JOIN "M_SAKUGATA.DB" M_sakugata '+
   'ON  (T_UKETUKE.��ڃR�[�h = M_sakugata.��ڃR�[�h)  '+
   'AND  (T_UKETUKE.�앨�R�[�h = M_sakugata.�앨�R�[�h) '+
   'AND  (T_UKETUKE.��^�R�[�h = M_sakugata.��^�R�[�h) '+
   'INNER JOIN M_NOUKA '+
   'ON  (M_HOJOU.�_�Ɣԍ� = M_NOUKA.�_�Ɣԍ�) '+
   'INNER JOIN "M_DOJOU.db" M_dojou '+
   'ON  (M_HOJOU.�y��R�[�h = M_dojou.�y��R�[�h) '+
   'WHERE T_UKETUKE.�폜�t���O<>True ';     {Version 0.6 #26}
        {Version 0.6 #26 �폜�t���O�ǉ�}

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
	Query1.SQL.Text := sSQL +' order by �T���v���ԍ�';
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
  //��t��ʂ�
  Application.CreateForm(TfrmUketuke, frmUketuke);
  frmUketuke.locateNo(Query1.FieldByName('�T���v���ԍ�').asString);
  frmUketuke.ShowModal ;
  frmUketuke.Release ;
end;

end.

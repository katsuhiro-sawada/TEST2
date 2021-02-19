unit mstU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, Grids, DBGrids, DBTables, ComCtrls, ExtCtrls, ADODB;

type
  TmstForm = class(TForm)
    EditPanel: TPanel;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    ds1: TDataSource;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    btnDel: TBitBtn;
    btnPost: TBitBtn;
    btnCancel: TBitBtn;
    GridPanel: TPanel;
    DBGrid1: TDBGrid;
    btnClose: TBitBtn;
    ADOTable1: TADOTable;
    procedure btnNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ds1StateChange(Sender: TObject);
    procedure EditPanelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Table1orgAfterPost(DataSet: TDataSet);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
    procedure ADOTable1AfterPost(DataSet: TDataSet);  //更新フラグ
  private
    { Private 宣言 }
    FIsPost : Boolean;        {同期用マスタ更新フラグ}
  public
    { Public 宣言 }
  end;

var
  mstForm: TmstForm;

implementation

uses DMU;

{$R *.DFM}
procedure TmstForm.FormCreate(Sender: TObject);
begin
//
  FIsPost:=False;
	Color := BackColor ;
	ADOTable1.Open;

 if not IsEntryYear then begin		//操作可能年度で無ければ編集不可
    btnNew.Enabled := False ;
    btnEdit.Enabled := False ;
    btnDel.Enabled := False ;
    EditPanel.Enabled := False ;
  end;
 if not JMaster then begin		//編集不可
    btnNew.Enabled := False ;
    btnEdit.Enabled := False ;
    btnDel.Enabled := False ;
    EditPanel.Enabled := False ;
  end;

end;

procedure TmstForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//
	ADOTable1.Close;

//  if FIsPost then
//    UpdateSyncFile(DataPath+SYNCFILE,ChangeFileExt(ExtractFileName(ADOTable1.TableName),''));


end;

procedure TmstForm.FormShow(Sender: TObject);
begin
//



end;

procedure TmstForm.btnCloseClick(Sender: TObject);
begin
	Close;
end;

procedure TmstForm.btnNewClick(Sender: TObject);
begin
	//if not IsEntryYear then exit ;	//操作可能年度で無ければ編集不可
	ds1.DataSet.Insert;
end;


procedure TmstForm.btnEditClick(Sender: TObject);
begin
	if not IsEntryYear then exit ;	//操作可能年度で無ければ編集不可
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	ds1.DataSet.Edit;

end;

procedure TmstForm.btnDelClick(Sender: TObject);
begin
	if not IsEntryYear then exit ;	//操作可能年度で無ければ編集不可
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
  if Application.MessageBox ('削除しますか？','確認', MB_YESNO ) = ID_YES then begin
		ds1.DataSet.Delete;
    FIsPost := True ;
  end;
end;

procedure TmstForm.btnPostClick(Sender: TObject);
begin
	ds1.DataSet.Post;

end;

procedure TmstForm.ADOTable1AfterPost(DataSet: TDataSet);
begin
  FIsPost := True ;

end;

procedure TmstForm.btnCancelClick(Sender: TObject);
begin
	ds1.DataSet.Cancel;

end;

procedure TmstForm.ds1StateChange(Sender: TObject);
begin
	case ds1.DataSet.State of
	dsEdit	,dsInsert	: begin
//  	EditPanel.Enabled := True ;
  	btnNew.Enabled := False;
    btnEdit.Enabled := False;
    btnDel.Enabled := False;
    btnPost.Enabled := True ;
    btnCancel.Enabled := True ;
//    DBGrid1.Enabled := False;    時々statechangeするため不可
//    GridPanel.Enabled := False;
  end;
  else begin
//  	EditPanel.Enabled := False ;
  	btnNew.Enabled := True;
    btnEdit.Enabled := True;
    btnDel.Enabled := True;
    btnPost.Enabled := False ;
    btnCancel.Enabled := False ;
//    DBGrid1.Enabled := True;
//    GridPanel.Enabled := True;
  end;
  end;
end;

procedure TmstForm.EditPanelClick(Sender: TObject);
begin
//
end;


procedure TmstForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
		ds1.DataSet.Post;

end;

procedure TmstForm.Table1orgAfterPost(DataSet: TDataSet);
begin
  FIsPost := True ;
end;

{Enterキーでタブ移動}
procedure TmstForm.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enterキーが押されたら
  begin
    Key:=#0; //キー入力を無効にし
    Keybd_event(VK_TAB,0,0,0) //Tabキーを発生させる。
  end;
end;

end.

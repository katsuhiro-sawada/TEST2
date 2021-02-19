unit MSehiU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, ComCtrls, ADODB;

type
  TmstSehiBasicForm = class(TForm)
    SelectPanel: TPanel;
    Panel2: TPanel;
    btnEdit: TBitBtn;
    btnDel: TBitBtn;
    btnPost: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    EditPanel: TPanel;
    ds1: TDataSource;
    StatusBar1: TStatusBar;
    ADOTable1: TADOTable;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ds1StateChange(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
  private
    { Private 宣言 }
    FIsPost : Boolean;
  public
    { Public 宣言 }
  end;

var
  mstSehiBasicForm: TmstSehiBasicForm;

implementation

uses DMU;

{$R *.DFM}

procedure TmstSehiBasicForm.FormCreate(Sender: TObject);
begin
  FIsPost:=False;
	Color := BackColor ;
  if not IsEntryYear then begin		//操作可能年度で無ければ編集不可
    btnEdit.Enabled := False ;
    btnDel.Enabled := False ;
    EditPanel.Enabled := False ;
  end;
  if not JMaster then begin		//操作可能年度で無ければ編集不可
    btnEdit.Visible := False ;
    btnDel.Visible := False ;
    EditPanel.Enabled := False ;
    ds1.AutoEdit := false;
  end;
end;

procedure TmstSehiBasicForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOTable1.Close;
  if FIsPost then
    UpdateSyncFile(DataPath+SYNCFILE,ChangeFileExt(ExtractFileName(ADOTable1.TableName),''));

end;

procedure TmstSehiBasicForm.FormShow(Sender: TObject);
begin
//  Table1.Open;

end;

procedure TmstSehiBasicForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
			ds1.DataSet.Post ;

end;

procedure TmstSehiBasicForm.ds1StateChange(Sender: TObject);
begin
	case ds1.DataSet.State of
	dsEdit	,dsInsert	: begin
//  	EditPanel.Enabled := True ;
    btnEdit.Enabled := False;
    btnDel.Enabled := False;
    btnPost.Enabled := True ;
    btnCancel.Enabled := True ;
  end;
  else begin
//  	EditPanel.Enabled := False ;
    btnEdit.Enabled := True;
    btnDel.Enabled := True;
    btnPost.Enabled := False ;
    btnCancel.Enabled := False ;
  end;
  end;

end;

procedure TmstSehiBasicForm.btnEditClick(Sender: TObject);
begin
	if not IsEntryYear then exit ;	//操作可能年度で無ければ編集不可
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	ds1.DataSet.Edit;

end;

procedure TmstSehiBasicForm.btnDelClick(Sender: TObject);
begin
	if not IsEntryYear then exit ;	//操作可能年度で無ければ編集不可
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
  if Application.MessageBox ('削除しますか？','確認', MB_YESNO ) = ID_YES then begin
		ds1.DataSet.Delete;
    FIsPost := True ;
  end;

end;

procedure TmstSehiBasicForm.btnPostClick(Sender: TObject);
begin
	ds1.DataSet.Post;

end;

procedure TmstSehiBasicForm.btnCancelClick(Sender: TObject);
begin
	ds1.DataSet.Cancel;

end;

procedure TmstSehiBasicForm.btnCloseClick(Sender: TObject);
begin
	Close;

end;

{Enterキーでタブ移動}
procedure TmstSehiBasicForm.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enterキーが押されたら
  begin
    Key:=#0; //キー入力を無効にし
    Keybd_event(VK_TAB,0,0,0) //Tabキーを発生させる。
  end;
end;

procedure TmstSehiBasicForm.Table1AfterPost(DataSet: TDataSet);
begin
  FIsPost := True ;

end;

end.

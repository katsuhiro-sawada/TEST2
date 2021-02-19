unit EntCMTU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, DBCtrls, ComCtrls, Buttons, ExtCtrls,PreviewU,
  Mask, Grids, DBGrids, ADODB;

type
  TEntryCMTForm = class(TForm)
    DBMemo1: TDBMemo;
    ds1: TDataSource;
    Panel2: TPanel;
    btnClose: TBitBtn;
    StatusBar1: TStatusBar;
    btnCancel: TBitBtn;
    btnPost: TBitBtn;
    CheckBox1: TCheckBox;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBMemo2: TDBMemo;
    Panel4: TPanel;
    SpCmtSet: TSpeedButton;
    Panel5: TPanel;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    btnDel: TBitBtn;
    BtKousin: TBitBtn;
    BtTyuusi: TBitBtn;
    Dcmt: TDataSource;
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    ADOQuery1: TADOQuery;
    Tcmt: TADOTable;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Query1BeforePost(DataSet: TDataSet);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure Query1AfterPost(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure TcmtzzzAfterPost(DataSet: TDataSet);
    procedure btnDelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure DcmtStateChange(Sender: TObject);
    procedure BtKousinClick(Sender: TObject);
    procedure BtTyuusiClick(Sender: TObject);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
    procedure SpCmtSetClick(Sender: TObject);
    procedure TcmtAfterPost(DataSet: TDataSet);
  private
    { Private �錾 }
    FRes : Boolean ;
    FIsPost : Boolean;        {�����p�}�X�^�X�V�t���O}
  public
    { Public �錾 }
    KeyCode : string ;
    procedure SetReport(pReportType: TReportType);
  end;

var
  EntryCMTForm: TEntryCMTForm;
function 	EntComment( pReportType : TReportType; pCode : string ):Boolean;

implementation

uses
  DMU;
{$R *.DFM}



{
  �������͉��
  IN pReportType : ���|�[�g���
  pCode : �T���v���ԍ�
}
function 	EntComment( pReportType : TReportType; pCode : string ):Boolean;
begin
  Application.CreateForm(TEntryCMTForm, EntryCMTForm);
  EntryCMTForm.KeyCode := pCode ;
  EntryCMTForm.SetReport( pReportType );
  EntryCMTForm.ShowModal ;
  result := EntryCMTForm.FRes ;
  EntryCMTForm.Release ;
end;

procedure TEntryCMTForm.FormCreate(Sender: TObject);
begin
	Color := BackColor ;
	FRes := False ;
end;

procedure TEntryCMTForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if ds1.DataSet.State in [dsEdit	,dsInsert] then
	  if Application.MessageBox ('�X�V���܂����H','�m�F', MB_YESNO ) = ID_YES then
			ds1.DataSet.Post
    else
    	ds1.DataSet.Cancel ;
	ADOQuery1.Close;

end;
procedure TEntryCMTForm.SetReport(pReportType : TReportType);
begin

  //H181117 �͔�A�����@�R�����g���͒ǉ�

  case pReportType of
  rtSindan: begin//'�y��f�f�[';
//     DBMemo1.DataField := '�R�����g';
       DBMemo1.DataField := '�����y��';
       ADOQuery1.SQL.Clear;
       ADOQuery1.SQL.Add( 'select * from T_SINDAN where �T���v���ԍ�="' + KeyCode + '"');
     end;
  rtSekkei: begin //'�{��݌v�[';
     DBMemo1.DataField := '�����{��'; //'�݌v�R�����g';
       ADOQuery1.SQL.Clear;
       ADOQuery1.SQL.Add( 'select * from T_SINDAN where �T���v���ԍ�="' + KeyCode + '"');
     end;
  rtTaihi: begin //�͔�
     DBMemo1.DataField := '�R�����g';
       ADOQuery1.SQL.Clear;
       ADOQuery1.SQL.Add( 'select * from T_SINDAN2 where �T���v���ԍ�="' + KeyCode + '"');
     end;
  rtSiryou: begin //����
     DBMemo1.DataField := '�R�����g';
       ADOQuery1.SQL.Clear;
       ADOQuery1.SQL.Add( 'select * from T_SINDAN3 where �T���v���ԍ�="' + KeyCode + '"');
     end;
  end;
end;

procedure TEntryCMTForm.FormShow(Sender: TObject);
var
stmp : string;
begin
//
  CheckBox1Click(self);

  //�J���f�[�^�x�[�X�𐸍�


  with ADOQuery1 do begin
  //   SQL.Clear;
    //ParamByName('�T���v���ԍ�').asString := KeyCode ;
  //  stmp := 'select * from T_SINDAN2 where �T���v���ԍ� = "' + KeyCode + '"';
  //  SQL.Add(stmp);
    Open;
    if RecordCount = 0 then begin
      Append;
      edit;
      FieldByName('�T���v���ԍ�').asString := KeyCode ;
      post;
    end;
  end;

  Tcmt.Close;
//DOJO �ɌŒ�  Tcmt.DatabaseName := DataPath;
  Tcmt.TableName := 'T_CMT';
  Tcmt.Open;




end;

procedure TEntryCMTForm.Query1BeforePost(DataSet: TDataSet);
begin
	DataSet.FieldByName('�ҏW��').asDateTime := now ;
//	DataSet.FieldByName('SIM�v�Z��').asBoolean := False ;
//	DataSet.FieldByName('�폜�t���O').asBoolean := False ;
end;

procedure TEntryCMTForm.btnCancelClick(Sender: TObject);
begin
	ds1.DataSet.Cancel ;
  Close;
end;

procedure TEntryCMTForm.btnPostClick(Sender: TObject);
begin
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
		ds1.DataSet.Post ;
  Close;
end;

procedure TEntryCMTForm.btnCloseClick(Sender: TObject);
begin
	Close;
end;

procedure TEntryCMTForm.Query1AfterPost(DataSet: TDataSet);
begin
	if CheckBox1.Checked then
	  FRes := True ;
end;

procedure TEntryCMTForm.CheckBox1Click(Sender: TObject);
begin
	case CheckBox1.Checked of
  false:	StatusBar1.Panels[0].Text := ' �R�����g�͍ēx�v���r���[�̎��ɔ��f���܂��B';
  true:   StatusBar1.Panels[0].Text := ' �R�����g�̓v���r���[�ɒ����ɔ��f���܂��B';
  end;
end;

procedure TEntryCMTForm.TcmtAfterPost(DataSet: TDataSet);
begin
FIsPost := True ;
end;

procedure TEntryCMTForm.TcmtzzzAfterPost(DataSet: TDataSet);
begin
  FIsPost := True ;

end;

procedure TEntryCMTForm.btnDelClick(Sender: TObject);
begin
//	if not IsEntryYear then exit ;	//����\�N�x�Ŗ�����ΕҏW�s��
	if Dcmt.DataSet.Bof and  Dcmt.DataSet.Eof then exit ;
  if Application.MessageBox ('�폜���܂����H','�m�F', MB_YESNO ) = ID_YES then begin
		Dcmt.DataSet.Delete;
    FIsPost := True ;
  end;

end;

procedure TEntryCMTForm.btnEditClick(Sender: TObject);
begin
//	if not IsEntryYear then exit ;	//����\�N�x�Ŗ�����ΕҏW�s��
	if Dcmt.DataSet.Bof and  Dcmt.DataSet.Eof then exit ;
	Dcmt.DataSet.Edit;

end;

procedure TEntryCMTForm.btnNewClick(Sender: TObject);
begin
//	if not IsEntryYear then exit ;	//����\�N�x�Ŗ�����ΕҏW�s��

        Tcmt.Last;
       // stmp := 
 	Dcmt.DataSet.Insert;


end;

procedure TEntryCMTForm.DcmtStateChange(Sender: TObject);
begin
	case Dcmt.DataSet.State of
	dsEdit	,dsInsert	: begin
//  	EditPanel.Enabled := True ;
  	btnNew.Enabled := False;
    btnEdit.Enabled := False;
    btnDel.Enabled := False;
    BtKousin.Enabled := True ;
    BtTyuusi.Enabled := True ;
//    DBGrid1.Enabled := False;    ���Xstatechange���邽�ߕs��
//    GridPanel.Enabled := False;
  end;
  else begin
//  	EditPanel.Enabled := False ;
  	btnNew.Enabled := True;
    btnEdit.Enabled := True;
    btnDel.Enabled := True;
    BtKousin.Enabled := False ;
    BtTyuusi.Enabled := False ;
//    DBGrid1.Enabled := True;
//    GridPanel.Enabled := True;
  end;
  end;

end;

procedure TEntryCMTForm.BtKousinClick(Sender: TObject);
begin
	Dcmt.DataSet.Post;
        UpdateSyncFile(DataPath+SYNCFILE,ChangeFileExt(ExtractFileName(Tcmt.TableName),''));

end;

procedure TEntryCMTForm.BtTyuusiClick(Sender: TObject);
begin
	Dcmt.DataSet.Cancel;

end;

procedure TEntryCMTForm.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enter�L�[�������ꂽ��
  begin
    Key:=#0; //�L�[���͂𖳌��ɂ�
    Keybd_event(VK_TAB,0,0,0) //Tab�L�[�𔭐�������B
  end;
end;

procedure TEntryCMTForm.SpCmtSetClick(Sender: TObject);
begin

//   DBMemo1.SetSelTextBuf( Tcmt.FieldByName('�R�����g').AsString );
ds1.DataSet.Edit;
    DBMemo1.Lines.Add( Tcmt.FieldByName('�R�����g').AsString );

end;

end.

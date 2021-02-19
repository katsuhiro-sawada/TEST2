unit mstKIJUNU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask, DBCtrls, ADODB;

type
  TmstKijunForm = class(TForm)
    ds1: TDataSource;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    btnClose: TBitBtn;
    ADOTable1: TADOTable;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbDosituChange(Sender: TObject);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
  private
    { Private �錾 }
  public
    { Public �錾 }
    FDOSEICD  : string ;
    FIsPost : Boolean;  //�X�V�t���O
		function CheckBeforePost:Boolean;
    procedure SyncUpdate;
  end;

var
  mstKijunForm: TmstKijunForm;

implementation

uses DMU;

{$R *.DFM}

procedure TmstKijunForm.FormCreate(Sender: TObject);
begin
  FIsPost:=False;
	Color := BackColor ;
//	if not IsEntryYear then begin		//����\�N�x�Ŗ�����ΕҏW�s��
//    ds1.AutoEdit := false ;
//    Table1.ReadOnly := True ;
//  end;
  //PageControl1.ActivePage := TabSheet1;
end;

procedure TmstKijunForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOTable1.Close;
  //��}�X�^�͑Ώۃe�[�u�������Ȃ̂Ōp����œ��t�X�V
  SyncUpdate;  //�}�X�^�X�V���L�^
end;

procedure TmstKijunForm.btnCloseClick(Sender: TObject);
begin
	Close;
end;


procedure TmstKijunForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	if ds1.DataSet.State in [dsEdit	,dsInsert] then
  	if CheckBeforePost then
			ds1.DataSet.Post
    else CanClose := False ;

end;


//�e��̒l�͈̓`�F�b�N
function TmstKijunForm.CheckBeforePost:Boolean;
begin
(*
�g�p�\�A
�Ăяo�����̕\���̍H�v�icombobox�̕\����߂��Ȃǁj���K�v
   if StrtoFloat(DBEdit1.Text) > Strtofloat(DBEdit2.Text) then begin
   	showmessage('�l�̊֌W������������܂���B');
    DBEdit1.SetFocus ;
    result := false ;
   end else begin
   	result := True ;
   end;
*)
	result := True ;
end;

procedure TmstKijunForm.cmbDosituChange(Sender: TObject);
begin
 // FDOSEICD := strParts(cmbDositu.Text ,1);  //����������ɃZ�b�g���܂�
end;

procedure TmstKijunForm.Table1AfterPost(DataSet: TDataSet);
begin
  FIsPost := True ;

end;
procedure TmstKijunForm.SyncUpdate;
begin
  if FIsPost then begin //�e�[�u���ύX�O�ɍX�V���L�^
    UpdateSyncFile(DataPath+SYNCFILE,ChangeFileExt(ExtractFileName(ADOTable1.TableName),''));
    FIsPost := False ;
  end;
end;

{Enter�L�[�Ń^�u�ړ�}
procedure TmstKijunForm.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enter�L�[�������ꂽ��
  begin
    Key:=#0; //�L�[���͂𖳌��ɂ�
    Keybd_event(VK_TAB,0,0,0) //Tab�L�[�𔭐�������B
  end;
end;


end.

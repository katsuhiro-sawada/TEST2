unit UketukeU5;
{
  ��t��ʁF��t�e�[�u���ɃG���g���[������
  �����N�e�[�u������������̂ŁA���R�[�h�ړ����Ɏ��Ԃ�������B
  �K�{���͂̃`�F�b�N�͓o�^�{�^���̎��̓v���O��������o���邪�A
  AutoPost���̓V�X�e���iBDE�j�ɂ䂾�˂�B
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBTables, Mask, DBCtrls, Db, ComCtrls, ExtCtrls, ADODB,
  Vcl.WinXPickers;


type
  TfrmUketuke5 = class(TForm)
    StatusBar1: TStatusBar;
    ds1: TDataSource;
    gb2: TGroupBox;
    Panel2: TPanel;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    btnDel: TBitBtn;
    btnPost: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    dsSakumotu: TDataSource;
    Panel1: TPanel;
    Label13: TLabel;
    txtSampleNo: TDBEdit;
    btnSNo: TButton;
    DBNavigator1: TDBNavigator;
    ADOUketuke: TADOTable;
    ADOQSakumotu: TADOQuery;
    Label6: TLabel;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    dskumiai: TDataSource;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    dssiten: TDataSource;
    ADOQkumiai: TADOQuery;
    ADOQsiten: TADOQuery;
    Label3: TLabel;
    Label4: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DateTimePicker2: TDateTimePicker;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    Label50: TLabel;
    DBEdit23: TDBEdit;
    DBEdit3: TDBEdit;
    Button1: TButton;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Panel3: TPanel;
    ADOQuery1: TADOQuery;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Memo1: TMemo;
    DBEdit7: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    DateTimePicker3: TDateTimePicker;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    DateTimePicker4: TDateTimePicker;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    DateTimePicker5: TDateTimePicker;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit11: TDBEdit;
    DateTimePicker6: TDateTimePicker;
    Label19: TLabel;
    DBEdit12: TDBEdit;
    DateTimePicker7: TDateTimePicker;
    Label20: TLabel;
    DBEdit13: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label9: TLabel;
    procedure btnSHojouClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtHojouNoChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure ds1StateChange(Sender: TObject);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure btnSNoClick(Sender: TObject);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbJikiChange(Sender: TObject);
    procedure dtUketukeChange(Sender: TObject);
    procedure Table1AfterCancel(DataSet: TDataSet);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure BtnClrClick(Sender: TObject);
    procedure txtSampleNoExit(Sender: TObject);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure ESakuCodeKeyPress(Sender: TObject; var Key: Char);
    procedure cmbSakumokuDropDown(Sender: TObject);
    procedure cmbSakumotuDropDown(Sender: TObject);
    procedure cmbSakugataDropDown(Sender: TObject);
//    procedure DateTimePicker1Change(Sender: TObject);
//    procedure DateTimePicker2Change(Sender: TObject);
//    procedure DateTimePicker3Change(Sender: TObject);
//    procedure DateTimePicker4Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ADOUketukeAfterCancel(DataSet: TDataSet);
    procedure ADOUketukeAfterInsert(DataSet: TDataSet);
    procedure ADOUketukeAfterPost(DataSet: TDataSet);
    procedure ADOUketukeAfterScroll(DataSet: TDataSet);
    procedure ADOUketukeBeforePost(DataSet: TDataSet);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure dssitenDataChange(Sender: TObject; Field: TField);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure DateTimePicker5Change(Sender: TObject);
    procedure DateTimePicker6Change(Sender: TObject);
    procedure DateTimePicker7Change(Sender: TObject);
//    procedure Button1Click(Sender: TObject);
  private
    { Private �錾 }
    FNewNO : string ;
    ESakuCodeFlg : Boolean;
    ESakuCodeFlg2 : Boolean;
    procedure SetEditEnable(aFlag: Boolean);
  public
    procedure LocateNo(pSmplNo: string);
    { Public �錾 }
  end;

var
  frmUketuke5: TfrmUketuke5;

implementation

uses DMU,SHojouU, SUketukeU, MHojouU;

{$R *.DFM}

procedure TfrmUketuke5.FormShow(Sender: TObject);
var
stmp : string;
mysqlstmp : String;
i,itmp : integer;
stmp2 : string;
begin
	Color := BackColor ;
  FNewNO := '';

//  Table1.Open;
  DataModule1.ADOConnection1.close;
  mysqlstmp := DMU.GetConnection;
  DataModule1.ADOConnection1.ConnectionString := mysqlstmp;

  //DataModule1.ADOConnection1.Open('Admin','');






  //���HOJYOU��SQL���Z�b�g���Ă����Ȃ��ƊJ���Ȃ��B

  ADOuKETUKE.Close;
  ADOUketuke.Open;


//���x�A�b�v�Ȃ�ȉ��̍앨�֘A�̃����N�e�[�u���������������Ɖ��P�����

 // ADOZSakumokuConect.ConnectionString := mysqlstmp;

  ADOQkumiai.Open;
  ADOQsiten.Open;
  ADOQSakumotu.Open;



  {
  ADOQZSakumotu.Close;
  ADOZSakumotuConect.ConnectionString := mysqlstmp;
  ADOQZSakumotu.Open;


  ADOQZSakugata.Close;
  ADOZSakugataConect.ConnectionString := mysqlstmp;
  ADOQZSakugata.Open;
 }
{
  ADOQSakumoku.Close;
  ADOSakumokuConect.ConnectionString := mysqlstmp;
  ADOQSakumoku.Open;

  ADOQSakumotu.Close;
  ADOSakumotuConect.ConnectionString := mysqlstmp;
  ADOQSakumotu.Open;


  ADOQSakugata.Close;
  ADOSakugataConect.ConnectionString := mysqlstmp;
  ADOQSakugata.Open;
 }




end;

{
  �f�[�^�o�^�R���|�[�l���g�̗L���ݒ�F�T���v���ꍆ�ʕҏW����p
}
procedure TfrmUketuke5.SetEditEnable(aFlag:Boolean);
begin

{ XXXXXXx edit
    btnEdit.Enabled := aFlag ;
    btnDel.Enabled := aFlag ;
  	ds1.AutoEdit := aFlag ;
//    gb1.Enabled := aFlag ;
    gb2.Enabled := aFlag ;
		gb3.Enabled := aFlag ;
		gb4.Enabled := aFlag ;
}

end;
procedure TfrmUketuke5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  if JMode <> '' then begin
  		ds1.DataSet.Cancel;
  end
  else begin
	 if ds1.DataSet.State in [dsEdit	,dsInsert] then begin
    if Application.MessageBox ('�ҏW���������܂����H','�m�F', MB_YESNO ) = ID_YES then
  		ds1.DataSet.Cancel
    else begin
      CanClose := false ;
      exit ;
    end;
   end;
  end;
end;

procedure TfrmUketuke5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
end;

{�w��T���v���ԍ��Ɉړ�}
procedure TfrmUketuke5.LocateNo( pSmplNo : string );
begin
  //�ҏW���łȂ���΃T���v���ԍ��Ɉړ�
	if ds1.DataSet.State in [dsEdit	,dsInsert] then exit;
    ADOUketuke.locate('��t�A��',pSmplNo,[]);
end;
procedure TfrmUketuke5.Memo1Change(Sender: TObject);
begin

end;

{�ޏꌟ��}
procedure TfrmUketuke5.btnSHojouClick(Sender: TObject);
begin
end;

//�ޏ�ԍ��ύX
procedure TfrmUketuke5.txtHojouNoChange(Sender: TObject);
begin


end;
{�V�K�{�^��}
procedure TfrmUketuke5.btnNewClick(Sender: TObject);
var
  bNewRec : Boolean ;
begin
    //�ő�T���v���ԍ����蓖��
    FNewNO := GetMaxSampleNo(bNewRec,'1') ;   {Version 0.6 #38}

    if FNewNO = '' then exit ;   {Version 0.6 #36}



{
    if not bNewRec then begin
 //    ���ۂɃ��R�[�h���폜����B�łȂ��ƕύX�ʁi��ʃ����N���ځAFiltere�����j���傫��
      with DataModule1.QueryWrite do begin
        SQL.Text := 'delete from T_UKETUKE6 where ��t�A��='''+FNewNO+'''';
        ExecSQL ;
        //SQL.Text := 'delete from T_SINDAN6 where ��t�A��='''+FNewNO+'''';
        //ExecSQL ;
      end;
    end;



	  ds1.DataSet.append;
     //insert; //Append;    Append->Insert���ɖ��Ȃ�����
//   	ds1.DataSet.Edit;
}



	  ds1.DataSet.append;




    ds1.DataSet.FieldByName('��t�A��').asString := FNewNO ;

//    ds1.DataSet.FieldByName('�ҏW��').asDatetime := now;

    ds1.DataSet.FieldByName('��t�N����').asDatetime := now ;

  //  DtUketuke.DateTime := ds1.DataSet.FieldByName('��t�N����').asDateTime;



//    ds1.DataSet.Post;

//   	ds1.DataSet.Edit;




end;
{����{�^��}
procedure TfrmUketuke5.btnCloseClick(Sender: TObject);
begin
//	if ds1.DataSet.State in [dsEdit	,dsInsert] then
//		ds1.DataSet.Cancel;
	Close;
end;
{�L�����Z���{�^��}
procedure TfrmUketuke5.btnCancelClick(Sender: TObject);
begin
	ds1.DataSet.Cancel;
end;
{�o�^�{�^��}
procedure TfrmUketuke5.btnPostClick(Sender: TObject);
begin
  {���̓`�F�b�N}
{
  if not ChkEditLength(txtSampleNo,4) then exit;
  if JMode = 'Douou' then begin
     if not ChkEditLength(txtHojouNo,9) then exit;
  end
  else begin
     if not ChkEditLength(txtHojouNo,7) then exit;
  end;

  if DBEdit8.Text = '' then begin
    showmessage('�o�^����Ă���ޏ�ԍ����L��܂���');
  	exit;
  end;
}


{
	if cmbSakumoku.Text = '' then begin
    showmessage('�\���ڂ��ݒ肳��Ă��܂���');
    cmbSakumoku.SetFocus;
  	exit;
  end;
	if cmbSakumotu.Text = '' then begin
    showmessage('�\��앨���ݒ肳��Ă��܂���');
    cmbSakumotu.SetFocus;
  	exit;
  end;



{ //��^
	if cmbSakugata.Text = '' then begin
    showmessage('�\���^���ݒ肳��Ă��܂���');
    cmbSakugata.SetFocus;
  	exit;
  end;
}




	ds1.DataSet.Post;

end;
//�V�K�̏ꍇ��t���Z�b�g
procedure TfrmUketuke5.Table1AfterInsert(DataSet: TDataSet);
begin
//	dtUketuke.Date := now ;
  {�����l�̐ݒ�}
//  ds1.DataSet.FieldByName('��t�N����').asDateTime := dtUketuke.Date ;




  ds1.DataSet.FieldByName('�ҏW��').asDatetime := now ;  //���M�t���O�̎�O�A�蓮�ōX�V����
	ds1.DataSet.FieldByName('�폜�t���O').asBoolean := False ;

  SetEditEnable( True );  {Version 0.6 #37}
end;
//�X�V�O����
procedure TfrmUketuke5.Table1BeforePost(DataSet: TDataSet);
begin
  //���R�[�h�ړ��ɂ�鎩���|�X�g�̎��͕K�{���ڂ������͂̂Ƃ���O���������A
  //���̍��ڂɃt�H�[�J�X���ړ�����̂ŁA�C����B
  {�����l�̐ݒ�}
//  ds1.DataSet.FieldByName('��t�N����').asDateTime := dtUketuke.Date ;



  //���͎���
//  ds1.DataSet.FieldByName('���͎���').asString := InttoStr(cmbJiki.ItemIndex);
	//�ҏW���̓o�^
//  ds1.DataSet.FieldByName('�ҏW��').asDatetime := now ;  //���M�t���O�̎�O�A�蓮�ōX�V����
end;
//�X�V�㏈��
procedure TfrmUketuke5.Table1AfterPost(DataSet: TDataSet);
begin
  //�����A�V�K�쐬�Ȃ�A�f�f�e�[�u�����쐬����B {Version 0.6 #38}
//  if FNewNO <> '' then
//    InsertSindanTable(DataSet.FieldByName('�T���v���ԍ�').asString);  //��FNewNO�ɂ��Ȃ�����
  FNewNO:=''; //Post,Cancel������̓N���A
end;

{�폜�{�^��}
procedure TfrmUketuke5.btnDelClick(Sender: TObject);
var
sint,eint : integer;
i : integer;
//stmp : string;
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
  if Application.MessageBox ('�폜���܂����H','�m�F', MB_YESNO ) = ID_YES then begin
    {Version 0.6 #23 }  //���������Ώ��̂��߁A�폜�t���O�ɂ���B�f�fT������Γ��l
//		ds1.DataSet.Delete;

       //�f�f�e�[�u���폜
  //  DelFlagSindanTable(ds1.DataSet.FieldByName('��t�A��').asString);



  if ds1.DataSet.FieldByName('����NO�J�n').AsString <> '' then begin

     sint := strtoint(ds1.DataSet.FieldByName('����NO�J�n').AsString);
     eint := strtoint(ds1.DataSet.FieldByName('����NO�I��').AsString);

    for i  := sint to eint do begin

      with DataModule1.QueryWrite do begin
        SQL.Text := 'Delete from T_BUNSEKI6 where ����NO='''+Format('%0.4d',[i])+'''';
        ExecSQL ;
      end;

    end;

  end;


  ds1.DataSet.Edit ;
  ds1.DataSet.Delete;



  end;
end;
{�ҏW�{�^��}
procedure TfrmUketuke5.btnEditClick(Sender: TObject);
begin
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	ds1.DataSet.Edit;
end;
{�X�e�[�^�X�ύX�C�x���g�ő���{�^���̐���}
procedure TfrmUketuke5.ds1StateChange(Sender: TObject);
begin
	//��L�[�͐V�K�̂ݏC����
	txtSampleNo.Enabled := ds1.DataSet.State in [dsInsert ];
  //�����{�^�� �V�K�̎��͖���  2003/05/06
  btnSNO.Enabled := not (ds1.DataSet.State in [dsInsert ]);

	case ds1.DataSet.State of
	dsEdit	,dsInsert	: begin
  	btnNew.Enabled := False;
    btnEdit.Enabled := False;
    btnDel.Enabled := False;
    btnPost.Enabled := True ;
    btnCancel.Enabled := True ;

//    BtTitenIn.Enabled := True;
  end;
  else begin
  	btnNew.Enabled := True;
    btnEdit.Enabled := True;
    btnDel.Enabled := True;
    btnPost.Enabled := False ;
    btnCancel.Enabled := False ;
//    BtTitenIn.Enabled := False ;
  end;
  end; //case
end;

procedure TfrmUketuke5.dssitenDataChange(Sender: TObject; Field: TField);
begin

end;

//����
procedure TfrmUketuke5.btnSNoClick(Sender: TObject);
var
	SNO : string ;
begin
  SNO := DspUkeList(txtSampleNo.Text, '5');
  if SNO <> '' then begin
//  	Table1.Locate('�T���v���ԍ�',SNO,[]);
  	ADOUketuke.Locate('��t�A��',SNO,[]);
  end;
end;
procedure TfrmUketuke5.Button1Click(Sender: TObject);
var
stmp : string;
itmp : integer;
count : integer;
i : integer;
begin


//�앨���@�Ɓ@�������@���͍��ڂ������Ă��Ȃ��ꍇ

if ds1.DataSet.FieldByName('�앨�R�[�h').AsString = '' then begin

  showmessage('�앨����͂��ĉ������B');
  exit;
end;
if ds1.DataSet.FieldByName('���͍���').AsString = '' then begin

  showmessage('���͍��ڂ���͂��ĉ������B');
  exit;
end;

if ds1.DataSet.FieldByName('������').AsString = '' then begin

  showmessage('����������͂��ĉ������B');
  exit;
end;
if ds1.DataSet.FieldByName('������').AsString = '0' then begin

  showmessage('����������͂��ĉ������B');
  exit;
end;



if ds1.DataSet.FieldByName('����NO�J�n').AsString <> '' then begin

  showmessage('���ɐݒ肳��Ă��܂��B');
  exit;
end;

if ds1.DataSet.FieldByName('����NO�I��').AsString <> '' then begin

  showmessage('���ɐݒ肳��Ă��܂��B');
  exit;
end;





//��tNO���쐬


  stmp :=  copy(FTPnen,3,2);

  stmp := stmp + '6';

  stmp := stmp + ds1.DataSet.FieldByName('��t�A��').AsString;

  stmp := stmp + dssakumotu.DataSet.FieldByName('�앨����').AsString;

  stmp := stmp + ds1.DataSet.FieldByName('���͍���').AsString;


   	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;


  ds1.DataSet.FieldByName('��tNO').AsString := stmp;



  //
//���̓��R�[�h���쐬

ADOQuery1.Close;



//stmp := 'select MAX(����NO) as sample from T_BUNSEKI6';
//stmp := 'select MAX(����NO) as sample from T_BUNSEKI6 where ����NO < "2000"';
stmp := 'select MAX(����NO) as sample from T_BUNSEKI6';
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add(stmp);
ADOQuery1.Open;


//�ŏ��́A�O
itmp := StrToIntDef(ADOQuery1.FieldByName('sample').AsString,0);


count :=  ds1.DataSet.FieldByName('������').asinteger;


ADOQuery1.Close;
stmp := 'select * from T_BUNSEKI6';
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add(stmp);
ADOQuery1.Open;


i := itmp + 1;
ds1.DataSet.FieldByName('����NO�J�n').AsString := Format('%0.4d',[i]);
i := itmp + count;
ds1.DataSet.FieldByName('����NO�I��').AsString := Format('%0.4d',[i]);



for i := itmp + 1 to itmp + count do begin

ADOQuery1.Insert;
ADOQuery1.Edit;
ADOQuery1.Fieldbyname('����NO').AsString := Format('%0.4d',[i]);
ADOQuery1.Fieldbyname('��tNO').AsString := ds1.DataSet.FieldByName('��tNO').AsString;
ADOQuery1.Post;


end;


 	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;

  ds1.DataSet.Post;




end;

//���R�[�h�̈ړ��łc�a�����N�łȂ����ڂ��Z�b�g
procedure TfrmUketuke5.Table1AfterScroll(DataSet: TDataSet);
begin


  //���͎���
  //cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('���͎���').asString,0);

  {Version 0.6 #27 : ��PC�G���g���[�ԍ��͈͓��̂ݕҏW��}
//XXXXXXXXXXXXXXX ????
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    SetEditEnable( True);
//      IsEditRec(DataSet.FieldByName('�T���v���ԍ�').asString)  and IsEntryYear
//    );






end;

//DB�񃊃��N���ڕҏW�����΁A�����G�f�B�b�g����B
procedure TfrmUketuke5.cmbJikiChange(Sender: TObject);
begin
end;
//DB�񃊃��N���ڕҏW�����΁A�����G�f�B�b�g����B
procedure TfrmUketuke5.dtUketukeChange(Sender: TObject);
begin

//�f�[�^�C��
  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;


end;

//�L�����Z��������񃊃��N���ڂ�߂�
procedure TfrmUketuke5.Table1AfterCancel(DataSet: TDataSet);
begin
  FNewNO := '';     //Post,Cancel������̓N���A {Version 0.6 #38}
{
   ESakuCodeFlg := false;
   ESakuCode.Text := ds1.DataSet.FieldByName('��ڃR�[�h').AsString
         + ds1.DataSet.FieldByName('�앨�R�[�h').AsString
         + ds1.DataSet.FieldByName('��^�R�[�h').AsString;

   ESakuCodeFlg2 := false;
   ESakuCode2.Text := ds1.DataSet.FieldByName('�O��ڃR�[�h').AsString
         + ds1.DataSet.FieldByName('�O�앨�R�[�h').AsString
         + ds1.DataSet.FieldByName('�O��^�R�[�h').AsString;
}
  //   Table1AfterScroll(DataSet);
//2003/5/6 ��x�Ă΂�邽�߃R�����g
end;
{�f�[�^�ҏW�C�x���g}
procedure TfrmUketuke5.ds1DataChange(Sender: TObject; Field: TField);
begin
  {�S�앨�y�ї\��앨�ȍ~�̓��͐���̐ݒ�F��ʂ��m�肵�Ȃ��Ɖ��ʂ�����L���ɂȂ�Ȃ�}
{
  if Field = nil then begin
    cmbZSakumotu.Enabled := not ds1.DataSet.FieldByName ('�O��ڃR�[�h').IsNull ;
    cmbZSakugata.Enabled := not ds1.DataSet.FieldByName ('�O�앨�R�[�h').IsNull ;
    cmbSakumotu.Enabled := not ds1.DataSet.FieldByName ('��ڃR�[�h').IsNull ;
    cmbSakugata.Enabled := not ds1.DataSet.FieldByName ('�앨�R�[�h').IsNull ;
  end else begin
    if Field.FieldName = '�O��ڃR�[�h' then  begin
      if (ds1.DataSet.State in [dsEdit	,dsInsert]) then
        ds1.DataSet.FieldByName ('�O�앨�R�[�h').asString := '';
      cmbZSakumotu.Enabled := not Field.IsNull ;
//      cmbZSakugata.Enabled := not Field.IsNull ;
    end
    else
    if Field.FieldName = '�O�앨�R�[�h' then  begin
      if (ds1.DataSet.State in [dsEdit	,dsInsert]) then
        ds1.DataSet.FieldByName ('�O��^�R�[�h').asString := '';
      cmbZSakugata.Enabled := not Field.IsNull ;
    end
    else
    if Field.FieldName = '��ڃR�[�h' then  begin
      if (ds1.DataSet.State in [dsEdit	,dsInsert]) then
        ds1.DataSet.FieldByName ('�앨�R�[�h').asString := '';
      cmbSakumotu.Enabled := not Field.IsNull ;
//      cmbSakugata.Enabled := not Field.IsNull ;
    end
    else
    if Field.FieldName = '�앨�R�[�h' then  begin
      if (ds1.DataSet.State in [dsEdit	,dsInsert]) then
        ds1.DataSet.FieldByName ('��^�R�[�h').asString := '';
      cmbSakugata.Enabled := not Field.IsNull ;
    end;
  end;

//    if ESakuCodeFlg = false then begin
//���̖��߂�����ƃL�[�{�[�h����̓��͂��ł��Ȃ��Ȃ�
(*
       ESakuCode.Text := ds1.DataSet.FieldByName('��ڃR�[�h').AsString
         + ds1.DataSet.FieldByName('�앨�R�[�h').AsString
         + ds1.DataSet.FieldByName('��^�R�[�h').AsString;
//    end;

       ESakuCode2.Text := ds1.DataSet.FieldByName('�O��ڃR�[�h').AsString
         + ds1.DataSet.FieldByName('�O�앨�R�[�h').AsString
         + ds1.DataSet.FieldByName('�O��^�R�[�h').AsString;
*)



 }

end;
{Enter�L�[�Ń^�u�ړ�}
procedure TfrmUketuke5.EnterKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then  //Enter�L�[�������ꂽ��
  begin
    Key:=#0; //�L�[���͂𖳌��ɂ�
    Keybd_event(VK_TAB,0,0,0) //Tab�L�[�𔭐�������B
  end;
end;

procedure TfrmUketuke5.BtnClrClick(Sender: TObject);
var
  aBuff : string ;
begin
  aBuff := InttoStr( (Sender as TButton).Tag ) ;
	if ds1.DataSet.Bof and  ds1.DataSet.Eof then exit ;
	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('�L�@���R�[�h'+aBuff).Clear ;
  ds1.DataSet.FieldByName('�L�@���{���'+aBuff).Clear ;
  ds1.DataSet.FieldByName('�A�p�N��'+aBuff).Clear ;

end;


procedure TfrmUketuke5.txtSampleNoExit(Sender: TObject);
var
  iNum : integer ;
begin
  {Version 0.6 #24 �͈͓��̓`�F�b�N}
  if txtSampleNo.Enabled  then begin
    //�V�K�̎������L���łȂ�
    try
      iNum := StrtoInt(txtSampleNo.Text);
    except
      showmessage('��t�A�Ԃ𐳂������͂��ĉ������B');
      txtSampleNo.Text := FNewNO ;
      ds1.DataSet.FieldByName('��t�A��').asString := txtSampleNo.Text ;
      txtSampleNo.SetFocus ;
      exit;
    end;
    txtSampleNo.Text := Format('%0.3d',[iNum]);
    ds1.DataSet.FieldByName('��t�A��').asString := txtSampleNo.Text ;
    //�p�ӂ��ꂽ�ԍ��ȏさ�G���h�Ȃ����H
    if (iNum < StrtoInt(FNewNO) ) or ( iNum > EntrySTOP ) then begin
      showmessage('��t�A�Ԕ͈͐���𒴂��Ă��܂��B');
      txtSampleNo.Text := FNewNO ;
      ds1.DataSet.FieldByName('��t�A��').asString := txtSampleNo.Text ;
      txtSampleNo.SetFocus ;
    end;

    //���ɂ���T���v���̏ꍇ
    with DataModule1.ADOQtmp do begin
        SQL.Text := 'select * from T_UKETUKE6 where ��t�A��='''+txtSampleNo.Text+'''';
        Open;
        //���R�[�h�����邩
        if DataModule1.ADOQtmp.RecordCount > 0 then begin
//          if DataModule1.ADOQtmp.FieldByName('�폜�t���O').asBoolean Then begin
//               DataModule1.ADOQtmp.Delete;
//               close;
               //�f�f�e�[�u�����폜
               //SQL.Text := 'select * from T_SINDAN where �T���v���ԍ�='''+txtSampleNo.Text+'''';
//               Open;
//               DataModule1.ADOQtmp.Delete;
//               close;
//          end
//          else begin
              showMessage('���ɃT���v��������܂��B�ʂ̃T���v���ɂ��Ă��������B');
              txtSampleNo.Text := FNewNO ;
              ds1.DataSet.FieldByName('��t�A��').asString := txtSampleNo.Text ;
              txtSampleNo.SetFocus ;

//          end;

        end

    end;

  end;
end;


procedure TfrmUketuke5.ESakuCodeKeyPress(Sender: TObject; var Key: Char);
begin
 ESakuCodeFlg := true;

 if Key=#13 then  //Enter�L�[�������ꂽ��
  begin
    Key:=#0; //�L�[���͂𖳌��ɂ�
    Keybd_event(VK_TAB,0,0,0) //Tab�L�[�𔭐�������B
  end;
end;


procedure TfrmUketuke5.cmbSakumokuDropDown(Sender: TObject);
begin
    ESakuCodeFlg := false;
    ESakuCodeFlg2 := true;

end;

procedure TfrmUketuke5.cmbSakumotuDropDown(Sender: TObject);
begin
    ESakuCodeFlg := false;
    ESakuCodeFlg2 := true;

end;

procedure TfrmUketuke5.cmbSakugataDropDown(Sender: TObject);
begin
    ESakuCodeFlg := false;
    ESakuCodeFlg2 := true;

end;

procedure TfrmUketuke5.DateTimePicker1Change(Sender: TObject);
begin
//�f�[�^�C��
  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('�񍐊�]��').asDatetime :=�@DateTimePicker1.Date;

end;

procedure TfrmUketuke5.DateTimePicker2Change(Sender: TObject);
begin

  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;


  ds1.DataSet.FieldByName('��t�N����').asDatetime :=�@DateTimePicker2.Date;


end;

procedure TfrmUketuke5.DateTimePicker3Change(Sender: TObject);
begin

  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('�����').asDatetime :=�@DateTimePicker3.Date;

end;

procedure TfrmUketuke5.DateTimePicker4Change(Sender: TObject);
begin
//�f�[�^�C��
  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('������').asDatetime :=�@DateTimePicker4.Date;

end;


procedure TfrmUketuke5.DateTimePicker5Change(Sender: TObject);
begin
  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('�w���O���͓�').asDatetime :=�@DateTimePicker5.Date;

end;

procedure TfrmUketuke5.DateTimePicker6Change(Sender: TObject);
begin
  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('�v���').asDatetime :=�@DateTimePicker6.Date;

end;

procedure TfrmUketuke5.DateTimePicker7Change(Sender: TObject);
begin
  	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;
  ds1.DataSet.FieldByName('�����').asDatetime :=�@DateTimePicker7.Date;

end;

procedure TfrmUketuke5.DBLookupComboBox1DropDown(Sender: TObject);
begin

 	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
    ds1.DataSet.Edit ;

ds1.DataSet.FieldByName('�x�X�ԍ�').AsString := '';


end;

procedure TfrmUketuke5.ADOUketukeAfterCancel(DataSet: TDataSet);
begin
  FNewNO := '';     //Post,Cancel������̓N���A {Version 0.6 #38}



end;

procedure TfrmUketuke5.ADOUketukeAfterInsert(DataSet: TDataSet);
begin
  ds1.DataSet.FieldByName('�ҏW��').asDatetime := now ;  //���M�t���O�̎�O�A�蓮�ōX�V����
//	ds1.DataSet.FieldByName('�폜�t���O').asBoolean := False ;

  SetEditEnable( True );  {Version 0.6 #37}

end;

procedure TfrmUketuke5.ADOUketukeAfterPost(DataSet: TDataSet);
begin
  //�����A�V�K�쐬�Ȃ�A�f�f�e�[�u�����쐬����B {Version 0.6 #38}
//  if FNewNO <> '' then
//    InsertSindanTable(DataSet.FieldByName('��t�A��').asString);  //��FNewNO�ɂ��Ȃ�����
//  FNewNO:=''; //Post,Cancel������̓N���A

end;

procedure TfrmUketuke5.ADOUketukeAfterScroll(DataSet: TDataSet);
begin

{
  if not DataSet.FieldByName('�̎�N����').IsNull then
    dtUketuke.Date := DataSet.FieldByName('�̎�N����').asDateTime ;



  if not DataSet.FieldByName('�g����������').IsNull then
    DateTimePicker1.Date := DataSet.FieldByName('�g����������').asDateTime ;

  if not DataSet.FieldByName('���ʔz�M�\���').IsNull then
    DateTimePicker2.Date := DataSet.FieldByName('���ʔz�M�\���').asDateTime ;

  if not DataSet.FieldByName('�{����t��').IsNull then
    DateTimePicker3.Date := DataSet.FieldByName('�{����t��').asDateTime ;

  if not DataSet.FieldByName('�Z���^�[��t��').IsNull then
    DateTimePicker4.Date := DataSet.FieldByName('�Z���^�[��t��').asDateTime ;
}


  //���͎���
  //cmbJiki.ItemIndex := StrtoIntDef(DataSet.FieldByName('���͎���').asString,0);

  {Version 0.6 #27 : ��PC�G���g���[�ԍ��͈͓��̂ݕҏW��}
//	if not (ds1.DataSet.State  in [dsEdit	,dsInsert]) then
//    SetEditEnable(
//      IsEditRec(DataSet.FieldByName('�T���v���ԍ�').asString)  and IsEntryYear
//    );

  // DtUketuke.DateTime := ds1.DataSet.FieldByName('��t�N����').asDateTime;



{
   if not DataSet.FieldByName('�T���v��������').IsNull then
    DateTimePicker1.Date := DataSet.FieldByName('�T���v��������').asDateTime ;


  if not DataSet.FieldByName('�Z���^�[��t��').IsNull then
    DateTimePicker4.Date := DataSet.FieldByName('�Z���^�[��t��').asDateTime ;

}







end;

procedure TfrmUketuke5.ADOUketukeBeforePost(DataSet: TDataSet);
begin





  //���R�[�h�ړ��ɂ�鎩���|�X�g�̎��͕K�{���ڂ������͂̂Ƃ���O���������A
  //���̍��ڂɃt�H�[�J�X���ړ�����̂ŁA�C����B
  {�����l�̐ݒ�}
  //ds1.DataSet.FieldByName('��t�N����').asDateTime := DtUketuke.DateTime ;



//  ds1.DataSet.FieldByName('��t�N����').asDateTime := DtUketuke.DateTime;

//  ds1.DataSet.FieldByName('�T���v��������').asDateTime := DateTimePicker1.Date ;
//  ds1.DataSet.FieldByName('���ʔz�M�\���').asDateTime := DateTimePicker2.Date ;
//  ds1.DataSet.FieldByName('�{����t��').asDateTime := DateTimePicker3.Date ;
//  ds1.DataSet.FieldByName('�Z���^�[��t��').asDateTime := DateTimePicker4.Date ;

//  ds1.DataSet.FieldByName('�̎�N����').asDateTime := dtUketuke2.Date ;
//  ds1.DataSet.FieldByName('�g����������').asDateTime := DateTimePicker1.Date ;
//  ds1.DataSet.FieldByName('���ʔz�M�\���').asDateTime := DateTimePicker2.Date ;
//  ds1.DataSet.FieldByName('�{����t��').asDateTime := DateTimePicker3.Date ;
//  ds1.DataSet.FieldByName('�Z���^�[��t��').asDateTime := DateTimePicker4.Date ;


  //���͎���
//  ds1.DataSet.FieldByName('���͎���').asString := InttoStr(cmbJiki.ItemIndex);
	//�ҏW���̓o�^
  ds1.DataSet.FieldByName('�ҏW��').asDatetime := now ;  //���M�t���O�̎�O�A�蓮�ōX�V����




  //Ver
//  if ADOQHojyou.Active then begin

//  ds1.DataSet.FieldByName('�_�Ɣԍ�').asString := ds2.DataSet.FieldByName('�_�Ɣԍ�').asString;
//  ds1.DataSet.FieldByName('�y��R�[�h').asString := ds2.DataSet.FieldByName('M_HOJOU.�y��R�[�h').asString;
//  ds1.DataSet.FieldByName('�y���R�[�h').asString := ds2.DataSet.FieldByName('M_HOJOU.�y���R�[�h').asString;
//  ds1.DataSet.FieldByName('���A�R�[�h').asString := ds2.DataSet.FieldByName('M_HOJOU.���A�R�[�h').asString;
//  ds1.DataSet.FieldByName('�s�����R�[�h').asString := ds2.DataSet.FieldByName('M_HOJOU.�s�����R�[�h').asString;
//  ds1.DataSet.FieldByName('�n�於').asString := ds2.DataSet.FieldByName('�n�於').asString;
//  ds1.DataSet.FieldByName('�ޏꖼ').asString := ds2.DataSet.FieldByName('�ޏꖼ').asString;


//  ds1.DataSet.FieldByName('�앨��').asString := cmbSakumotu.Text; //
//  ds1.DataSet.FieldByName('��^��').asString := cmbSakugata.Text; //

//  ds1.DataSet.FieldByName('�O�앨��').asString := cmbZSakumotu.Text; //
//  ds1.DataSet.FieldByName('�O��^��').asString := cmbZSakugata.Text; //

//  end;
  //ds1.DataSet.FieldByName('�̎�N����').asDateTime := dtUketuke2.Date ;



end;


end.
